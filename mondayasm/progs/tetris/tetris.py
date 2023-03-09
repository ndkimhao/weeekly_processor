from progs.stdlib.devices import M_LED
from progs.stdlib.font import C_FONT_16_12_COMPRESSED, C_FONT_16_12_INDEX, FONT_16_12_INDEX_PY
from progs.stdlib.printf import puts, printf
from progs.stdlib.timing import DELAY_MILLIS
from progs.stdlib.video import switch_screen_row, fill_cell, decode_font, fill_cell_content
from progs.tetris.board import tg_init, tg_tick
from progs.tetris.display import display_board
from soeunasm import call, halt, init_code_gen, Reg, Loop, For, If, Else, M, addr, const, global_var, local_var, cmt, \
    While
from soeunasm.data import local_vars

CODE_OFFSET = 0x5000


def main(A, B, C, D, E, F, G, H):
    call(tg_init)
    running, move = local_vars(2)

    cmt('game loop')
    with While(running != 0):
        call(tg_tick, move)
        running @= H
        call(display_board)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('tetris.asm')
