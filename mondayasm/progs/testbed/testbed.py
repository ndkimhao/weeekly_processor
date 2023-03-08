from progs.stdlib import printf
from progs.stdlib.printf import putc, test_itoa_10
from soeunasm import call, halt, init_code_gen, Reg, getb, setb
from soeunasm.data import const

VID_MEM_OFFSET = 0x0000
CODE_OFFSET = 0xA000


def main(A, B, C, D, E, H):
    A @= 12345
    B @= 456
    C @= A // B
    getb(D, A, 3)
    setb(E, A, 2)
    call(printf, const("Hello World: %%a=%d b=%x c=%d h=%d d=%d(%b) e=%d(%b) v1=%d v2=%d\n"), A, B, C, H, D, D, E, E,
         323, 42342)
    call(printf, const("from soeunasm import call, halt, init_code_gen, Reg\n"), A, B)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('testbed.asm')
