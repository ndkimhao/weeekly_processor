from progs.stdlib.devices import M_LED, M_PS2_RECV, FLAG_PS2_RECV_VALID
from progs.stdlib.font import C_FONT_16_12_COMPRESSED, C_FONT_16_12_INDEX, FONT_16_12_INDEX_PY
from progs.stdlib.printf import puts, printf, PRINTF
from progs.stdlib.timing import DELAY_MILLIS, DELAY_MICROS
from progs.stdlib.video import switch_screen_row, fill_cell, decode_font, fill_cell_content
from progs.tetris.board import tg_init, tg_tick, tg_handle_move
from progs.tetris.display import display_board
from progs.tetris.te_types import TeMove
from soeunasm import call, halt, init_code_gen, Reg, Loop, For, If, Else, M, addr, const, global_var, local_var, cmt, \
    While, ElseIf
from soeunasm.data import local_vars

CODE_OFFSET = 0x5000


def handle_keyboard(G, H):
    scan_code = global_var('handle_keyboard__scan_code')
    with Loop():
        G @= M_PS2_RECV
        H @= G & FLAG_PS2_RECV_VALID
        If(H == 0).then_break()

        H @= scan_code << 8
        G &= 0xFF
        H |= G
        scan_code @= H

        G @= H >> 8
        H &= 0xFF
        If(G == 0xF0).then_continue()  # break code
        G @= TeMove.NONE.value
        with If(H == 0x75):  # up
            G @= TeMove.ROTATE.value

            ElseIf(H == 0x74)  # right
            G @= TeMove.RIGHT.value

            ElseIf(H == 0x6B)  # left
            G @= TeMove.LEFT.value

            ElseIf(H == 0x72)  # down
            G @= TeMove.DROP.value

        with If(G != TeMove.NONE.value):
            call(tg_handle_move, G)
            call(display_board)


def main(A, B, C, D, E, F, G, H):
    call(tg_init)
    running, move = local_vars(2)

    cmt('game loop')
    with While(running != 0):
        call(tg_tick, move)
        running @= H
        DELAY_MICROS(5000, handle_keyboard)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('tetris.asm')
