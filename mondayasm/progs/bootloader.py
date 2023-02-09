from mondayasm import *


# Caller save: (none)
# Callee save: A, B, C, D, SP, E, F, G, H
#   Arg passing: A -> H
#   Return: H (optionally B->G)

recv_buffer = StaticVar(123)

def start():
    stashed = PUSH(A, B, C)
    ADD(B, 0xd230, 0xa012)
    with Block() as b:
        JEQ(A, 123, b.end)
        RET()
    MOV(B, ConstData('READY'))
    MOV([recv_buffer], [B])
    CALL('fn_start')
    POP(stashed)


if __name__ == '__main__':
    MOV(SP, 0x2000)
    CALL(start)
    HALT()

    CodeGen().compile().write('bootloader.hex').write_vhd('bootloader.vhd')
