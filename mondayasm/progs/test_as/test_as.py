from mondayasm import *


def start():
    ADD(B, 0xd230, 0xa012)


if __name__ == '__main__':
    CALL(start, emit_call=False)
    CodeGen().compile().write('test_as.asm').write_vhd('test_as.vhd')
