from progs.stdlib import printf
from progs.stdlib.printf import putc, test_itoa_10, puts
from progs.stdlib.video import switch_screen_row, fill_cell
from soeunasm import call, halt, init_code_gen, Reg, getb, setb
from soeunasm.data import const

VID_MEM_OFFSET = 0x0000
CODE_OFFSET = 0xA000


def main(A, B, C, D, E, H):
    call(puts, const('Testbed\n'))
    call(switch_screen_row, 0, 0b110)
    call(fill_cell, 0, 0x0f0f)
    call(fill_cell, 1, 0xffff)
    call(switch_screen_row, 2, 0b101)
    call(fill_cell, 0, 0x0f0f)
    call(fill_cell, 1, 0xffff)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('testbed.asm')
