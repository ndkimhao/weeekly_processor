from progs.stdlib.printf import PRINTF
from progs.stdlib.video import switch_screen_row, fill_cell, get_cell_addr
from progs.tetris.board import Board
from progs.tetris.defs import N_ROWS, N_COLS, N_COLORS
from soeunasm import For, ForRange, call, M, If, Else

BOARD_TOP_PADDING = 2
BOARD_LEFT_PADDING = 10


def display_board(A, B, C, D, H):
    with ForRange(A, 0, N_ROWS):
        with For(C @ 1, C < 0x08, C @ (C << 1)):
            call(switch_screen_row, A + BOARD_TOP_PADDING, C)
            with ForRange(B, 0, N_COLS):
                D @= N_COLS * A
                D @= (D + B) + Board.state.addr()
                D @= M[D].byte()
                D @= D & C
                H @= 0x0001
                with If(D != 0):
                    H @= 0xFFFF
                call(fill_cell, B + BOARD_LEFT_PADDING, H)
                call(get_cell_addr, B + BOARD_LEFT_PADDING)
                M[H] @= 0xFFFF
