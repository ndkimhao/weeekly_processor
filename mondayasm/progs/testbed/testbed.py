from progs.stdlib.font import FONT_16_12_COMPRESSED, FONT_16_12_INDEX, FONT_16_12_INDEX_PY
from progs.stdlib.printf import puts, printf
from progs.stdlib.timing import DELAY_MILLIS
from progs.stdlib.video import switch_screen_row, fill_cell, decode_font, fill_cell_content
from soeunasm import call, halt, init_code_gen, Reg, Loop, For, If, Else, M, addr
from soeunasm.data import const, global_var, local_var

VID_MEM_OFFSET = 0x0000
CODE_OFFSET = 0xA000

test_loop_target_v = global_var('test_loop_target_v')


def test_loop_target():
    delay_counter = global_var()
    with If(M[test_loop_target_v] == 0):
        M[delay_counter] += 1
        call(printf, const("delay %d\n"), M[delay_counter])
        M[test_loop_target_v] @= 1


def main(A, B, C, D, E, H):
    call(puts, const('Testbed\n'))

    font_buf = local_var(size=2 * 16)
    call(decode_font, addr(font_buf), FONT_16_12_COMPRESSED + FONT_16_12_INDEX_PY[ord('A') - 32], 16, 12)
    with For(A @ addr(font_buf), A != addr(font_buf) + 32, A @ (A + 2)):
        call(printf, const('%b\n'), [A])

    call(switch_screen_row, 10, 0b110)
    call(fill_cell_content, 1, addr(font_buf))

    call(switch_screen_row, 0, 0b110)
    call(fill_cell, 0, 0x0f0f)
    call(fill_cell, 1, 0xffff)
    call(fill_cell, 2, 0xaaaa)
    call(switch_screen_row, 2, 0b101)
    call(fill_cell, 0, 0x0f0f)
    call(fill_cell, 1, 0xffff)
    call(fill_cell, 2, 0xaaaa)
    with For(A @ 0, True, A @ (~A)):
        with If(A == 0):
            call(switch_screen_row, 5, 0b111)
            Else()
            call(switch_screen_row, 5, 0b100)

        call(fill_cell, 0, 0x0f0f)
        call(fill_cell, 1, 0xa0a0)
        call(fill_cell, 2, 0xcccc)
        call(fill_cell, 3, 0xaaaa)
        M[test_loop_target_v] @= 0
        DELAY_MILLIS(1000)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('testbed.asm')
