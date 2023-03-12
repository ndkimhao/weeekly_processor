from progs.stdlib.timing import DELAY_MICROS
from progs.stdlib.video import reset_color_palette, switch_screen_row, set_color_palette
from progs.tetris.board import tg_init, tg_tick
from progs.tetris.display import init_tetris_color_palette
from progs.tetris.keyboard import handle_keyboard, last_btn_in
from soeunasm import call, halt, init_code_gen, Reg, Loop, If, global_var, cmt, expr

CODE_OFFSET = 0x5000


def main(H):
    expr(last_btn_in) @ 0
    call(init_tetris_color_palette)
    call(tg_init)
    cmt('game loop')
    with Loop():
        call(tg_tick)
        If(H == 0).then_break()
        DELAY_MICROS(5000, handle_keyboard)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('tetris.asm')
