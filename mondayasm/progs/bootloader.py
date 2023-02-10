from mondayasm import *

UART_BUFSZ = 16
recv_buf = StaticVar('recv_buf', UART_BUFSZ + 2)
send_buf = StaticVar('send_buf', UART_BUFSZ + 2)
M_UART_SEND = M[0x3000]
M_UART_RECV = M[0x3002]
M_UART_STATUS = M[0x3004]

FLAG_UART_RECV_VALID = 0x8000
FLAG_UART_RECV_EMPTY = 0x4000
FLAG_UART_RECV_FULL = 0x2000
MASK_UART_RECV_COUNT = 0x3F00

FLAG_UART_SEND_EMPTY = 0x0040
FLAG_UART_SEND_FULL = 0x0020
MASK_UART_SEND_COUNT = 0x003F


# Caller save: (none)
# Callee save: A, B, C, D, SP, E, F, G, H
#   Arg passing: A -> H
#   Return: H (optionally B->G)

def check_recv():
    stashed = PUSH(C, D)
    MOV(C, M_UART_RECV)
    AND(D, C, FLAG_UART_RECV_VALID)
    with Block() as if_recv:
        JEQ(D, 0, if_recv.end)  # if (C & FLAG_UART_RECV_VALID == 0) break;
        MOV(F, C)
    POP(stashed)


def send_data():
    stashed = PUSH(B, C)
    MOV(C, UART_BUFSZ + 1)  # C tracks send queue size
    with Block() as for_a:
        MOV(B, [A])
        AND(B, 0x00FF)  # only use 1 byte
        JEQ(B, 0, for_a.end)  # if end of string, then break
        CALL(check_recv)
        with Block() as wait_send_ready:
            JLT(C, UART_BUFSZ, wait_send_ready.end)  # have empty send slots
            MOV(C, M_UART_STATUS)
            AND(C, MASK_UART_SEND_COUNT)
            JMP(wait_send_ready.begin)
        MOV(M_UART_SEND, B)
        MOV(E, B)  # TODO: for debugging
        INC(A)
        INC(C)
        JMP(for_a.begin)  # loop next character
    POP(stashed)


def recv_echo():
    stashed = PUSH(C, D)
    MOV(C, M_UART_RECV)
    AND(D, C, FLAG_UART_RECV_VALID)
    with Block() as if_recv:
        JEQ(D, 0, if_recv.end)  # if (C & FLAG_UART_RECV_VALID == 0) break;
        MOV(M_UART_SEND, C + 1)
    POP(stashed)


def start():
    MOV(A, 0xFD)
    MOV(B, 0)
    MMAP(0x3000, 0x3000, 2)

    MOV(H, 0)
    with Block() as for_a:
        MOV(A, ConstData("Hello World!"))
        CALL(send_data)
        INC(H)
        JLT(H, 4, for_a.begin)
    with Block() as while_true:
        CALL(recv_echo)
        JMP(while_true.begin)


if __name__ == '__main__':
    MOV(SP, 0x2000)
    CALL(start)
    HALT()

    CodeGen().compile().write('bootloader.hex').write_vhd('bootloader.vhd')
