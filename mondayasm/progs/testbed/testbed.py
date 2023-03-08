from progs.stdlib.printf import puts
from progs.stdlib.timing import DELAY_MILLIS
from progs.stdlib.video import switch_screen_row, fill_cell
from soeunasm import call, halt, init_code_gen, Reg, Loop, For, If, Else
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
    with For(A @ 0, True, A @ (~A)):
        with If(A == 0):
            call(switch_screen_row, 5, 0b111)
            Else()
            call(switch_screen_row, 5, 0b101)

        call(fill_cell, 0, 0x0f0f)
        call(fill_cell, 1, 0xffff)
        DELAY_MILLIS(1000)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('testbed.asm')
