from mondayasm import *

###

DEV_ADDR = 0xFF00

M_UART_SEND = M[DEV_ADDR + 0x00]
M_UART_RECV = M[DEV_ADDR + 0x02]
M_UART_STATUS = M[DEV_ADDR + 0x04]

M_SPI_SEND = M[DEV_ADDR + 0x06]
M_SPI_STATUS = M[DEV_ADDR + 0x08]

M_LED = M[DEV_ADDR + 0x0A]
M_BTN_READ = M[DEV_ADDR + 0x0C]

M_PS2_READ = M[DEV_ADDR + 0x0E]

FLAG_UART_RECV_VALID = 0x8000
FLAG_UART_RECV_EMPTY = 0x4000
FLAG_UART_RECV_FULL = 0x2000
MASK_UART_RECV_COUNT = 0x3F00

FLAG_UART_SEND_EMPTY = 0x0040
FLAG_UART_SEND_FULL = 0x0020
MASK_UART_SEND_COUNT = 0x003F

CODE_OFFSET = 0xA000


###

def start():
    MOV(A, 0xFE)
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
    HALT()


if __name__ == '__main__':
    CALL(start, emit_call=False)

    cg = CodeGen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('test_vga.asm')
