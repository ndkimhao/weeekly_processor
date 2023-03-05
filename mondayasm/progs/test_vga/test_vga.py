from mondayasm import *

###

DEV_ADDR = 0xFF00

M_UART_SEND = M[DEV_ADDR + 0x00]
M_UART_RECV = M[DEV_ADDR + 0x02]
M_UART_STATUS = M[DEV_ADDR + 0x04]
M_PS2_RECV = M[DEV_ADDR + 0x06]

M_LED = M[DEV_ADDR + 0x0A]
M_BTN_READ = M[DEV_ADDR + 0x0C]

FLAG_UART_RECV_VALID = 0x8000
FLAG_UART_RECV_EMPTY = 0x4000
FLAG_UART_RECV_FULL = 0x2000
MASK_UART_RECV_COUNT = 0x3F00

FLAG_UART_SEND_EMPTY = 0x0040
FLAG_UART_SEND_FULL = 0x0020
MASK_UART_SEND_COUNT = 0x003F

CODE_OFFSET = 0xA000

###

UART_HW_BUFSZ = 16


def send_data():
    stashed = PUSH(A, B, C)
    MOV(C, UART_HW_BUFSZ + 1)  # C tracks send queue size
    with Block() as for_a:
        MOV(B, [A])
        AND(B, 0x00FF)  # only use 1 byte
        JEQ(B, 0, for_a.end)  # if (*A == '\0') break;

        # check if send buffer is full
        with Block() as wait_send_ready:
            JLT(C, UART_HW_BUFSZ, wait_send_ready.end)  # have empty send slots
            MOV(C, M_UART_STATUS)
            AND(C, MASK_UART_SEND_COUNT)
            JMP(wait_send_ready.begin)

        MOV(M_UART_SEND, B)  # SEND UART
        INC(A)
        INC(C)
        JMP(for_a.begin)  # loop next character
    # end for_a
    POP(stashed)


def start():
    MOV(SP, CODE_OFFSET - 0x100)
    MOV(A, ConstData('Hello World!\n'))
    CALL(send_data)

    addr = 0x2000
    for color in range(8):
        MOV(A, 0xF0 + color)
        MOV(B, 0)
        MMAP(0, 0x9600, 1)
        for i in range(10):
            MOV(M[addr], 0xFFFF)
            addr += 80

    MOV(A, 0xF3)
    MOV(B, 0)
    MMAP(0, 0x9600, 1)

    addr = 0x1000
    for i in range(10):
        MOV(M[addr - 2], 0x00FF)
        MOV(M[addr], 0xFFFF)
        MOV(M[addr + 2], 0xFF00)
        addr += 80

    for i in range(10):
        MOV(M[addr - 2], 0x00FF)
        MOV(M[addr], 0xFFFF - 1)
        MOV(M[addr + 2], 0xFF00)
        addr += 80

    for i in range(10):
        MOV(M[addr - 2], 0x00FF)
        MOV(M[addr], 0xFF00)
        MOV(M[addr + 2], 0xFF00)
        addr += 80

    for i in range(10):
        MOV(M[addr - 2], 0x00FF)
        MOV(M[addr], 0x0F0F)
        MOV(M[addr + 2], 0xFF00)
        addr += 80

    MOV(E, 0)
    MOV(M_LED, 0x000)
    with Block() as while_true:
        MOV(A, 0)
        with Block() as loop:
            JEQ(A, 0xFFFF, loop.end)
            INC(A)
            MUL(B, B)
            JMP(loop.begin)
        INC(M_LED)
        INC(E)
        for i in range(10):
            MOV(M[0x1000 - 80 * i], E)
        JMP(while_true.begin)

        ss = PUSH(A, G, H)
        with Block() as blk:
            MOV(G, M_PS2_RECV)
            AND(H, G, 0x8000)
            JEQ(H, 0, blk.end)
            MOV(A, ConstData("recv\n"))
            CALL(send_data)
        POP(ss)

    HALT()


if __name__ == '__main__':
    CALL(start, emit_call=False)

    cg = CodeGen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('test_vga.asm')
