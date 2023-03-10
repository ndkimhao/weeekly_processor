from progs.stdlib.font import FONT_16_12_COMPRESSED, FONT_16_12_INDEX, FONT_16_12_INDEX_PY
from progs.stdlib.printf import puts, printf
from progs.stdlib.timing import DELAY_MILLIS
from progs.stdlib.video import switch_screen_row, fill_cell, decode_font, fill_cell_content
from soeunasm import call, halt, init_code_gen, Reg, Loop, For, If, Else, M, addr, const, global_var, local_var

CODE_OFFSET = 0xA000

test_loop_target_v = global_var('test_loop_target_v')


def test_loop_target():
    delay_counter = global_var()
    with If(M[test_loop_target_v] == 0):
        delay_counter += 1
        call(printf, const("delay %d\n"), delay_counter)
        test_loop_target_v @ 1


def gen_font(A, B, C, D, E, H):
    color = global_var()
    font_buf = local_var(size=2 * 16)
    C @= FONT_16_12_INDEX
    with For(A @ 0, A < 6, A @ (A + 1)):
        with If(color >= 7):
            color @= 0
        color += 1
        call(switch_screen_row, A + 1, color)
        with For(B @ 0, B < 16, B @ (B + 1)):
            D @= M[C] + FONT_16_12_COMPRESSED
            # call(printf, const('a=%x b=%x c=%x d=%x [c]=%x\n'), A, B, C, D, M[C])
            C += 2
            call(decode_font, addr(font_buf), D, 16, 12)
            call(fill_cell_content, 10 + B, addr(font_buf))


def main(A, B, C, D, E, H):
    call(puts, const('Testbed\n'))

    # call(decode_font, addr(font_buf), FONT_16_12_COMPRESSED + FONT_16_12_INDEX_PY[ord('B') - 32], 16, 12)
    # with For(A @ addr(font_buf), A != addr(font_buf) + 32, A @ (A + 2)):
    #     call(printf, const('%b\n'), [A])

    call(switch_screen_row, 0, 0b110)
    call(fill_cell, 0, 0x0f0f)
    call(fill_cell, 1, 0xffff)
    call(fill_cell, 2, 0xaaaa)
    call(switch_screen_row, 2, 0b101)
    call(fill_cell, 0, 0x0f0f)
    call(fill_cell, 1, 0xffff)
    call(fill_cell, 2, 0xaaaa)

    with For(A @ 0, True, A @ (~A)):
        call(gen_font)
        with If(A == 0):
            call(switch_screen_row, 5, 0b111)
            Else()
            call(switch_screen_row, 5, 0b100)

        call(fill_cell, 0, 0x0f0f)
        call(fill_cell, 1, 0xa0a0)
        call(fill_cell, 2, 0xcccc)
        call(fill_cell, 3, 0xaaaa)
        test_loop_target_v @ 0
        DELAY_MILLIS(1000)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('testbed.asm')
