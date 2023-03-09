from progs.stdlib.video import switch_screen_row, fill_cell
from progs.tetris.board import Board
from progs.tetris.defs import N_ROWS, N_COLS, N_COLORS
from soeunasm import For, ForRange, call, M, If

BOARD_TOP_PADDING = 2
BOARD_LEFT_PADDING = 10


def display_board(A, B, C, D):
    with ForRange(A, 0, N_ROWS):
        with ForRange(C, 0, N_COLORS):
            call(switch_screen_row, A + BOARD_TOP_PADDING, C)
            with ForRange(B, 0, N_COLS):
                D @= N_COLS * A
                D @= (D + B) + Board.state.addr()
                D @= M[D].byte()
                with If(D == C):
                    call(fill_cell, B + BOARD_LEFT_PADDING, 0xFFFF)
