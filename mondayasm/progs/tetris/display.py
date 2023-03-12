from progs.stdlib.printf import PRINTF
from progs.stdlib.video import switch_screen_row, fill_cell, get_cell_addr, JUMP_ONE_ROW, CHUNK_SZ, reset_color_palette, \
    set_color_palette, fill_cell_except_first_and_last_row
from progs.tetris.board import Board
from progs.tetris.defs import N_ROWS, N_COLS, N_COLORS
from soeunasm import For, ForRange, call, M, If, Else, cmt

BOARD_TOP_PADDING = 2
BOARD_LEFT_PADDING = 10


def init_tetris_color_palette():
    call(switch_screen_row, 0, 0)
    call(reset_color_palette)
    call(set_color_palette, 4, 0xa0, 0x00, 0xf0)
    call(set_color_palette, 7, 0x70, 0x70, 0x70)


def display_board(A, B, C, D, H, G):
    with ForRange(A, 0, N_ROWS):
        with For(C @ 1, C < 0x08, C @ (C << 1)):
            call(switch_screen_row, A + BOARD_TOP_PADDING, C)
            with ForRange(B, 0, N_COLS):
                D @= N_COLS * A
                D @= (D + B) + Board.state.addr()
                G @= M[D].byte()
                D @= G & C
                H @= 0
                # set left & right border
                with If(G == 0):
                    H @= 1
                    with If(B == N_COLS - 1):
                        H |= 0x8000
                # inner cell color
                with If(D != 0):
                    H |= 0x7FFF

                D @= H

                # draw top & bottom border
                call(get_cell_addr, B + BOARD_LEFT_PADDING)
                M[H] @= 0xFFFF
                H += (JUMP_ONE_ROW * (CHUNK_SZ - 1))
                with If(A == N_ROWS - 1):
                    G @= 0xFFFF
                    Else()
                    G @= 0x8001  # left & right border
                M[H] @= 0xFFFF

                # draw inner cell
                call(fill_cell_except_first_and_last_row, B + BOARD_LEFT_PADDING, D)
