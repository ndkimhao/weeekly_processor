from progs.stdlib import printf
from progs.stdlib.printf import send_char, test_itoa_10
from soeunasm import call, halt, init_code_gen, Reg
from soeunasm.data import const

VID_MEM_OFFSET = 0x0000
CODE_OFFSET = 0xA000


def main(A, B):
    A @= 12345
    B @= 456
    call(printf, const("Hello World: %%a=%d %%b=%x v1=%d v2=%d\n"), A, B, 323, 42342)
    call(printf, const("from soeunasm import call, halt, init_code_gen, Reg\n"), A, B)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('testbed.asm')