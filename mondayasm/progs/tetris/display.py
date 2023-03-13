from progs.stdlib.printf import PRINTF
from progs.stdlib.video import switch_screen_page, fill_cell, get_cell_addr, ROW_BUFFER_SZ, CHUNK_SZ, \
    reset_color_palette, \
    set_color_palette, g_row_buffer, g_row_buffer_end, switch_screen_page_rgb, PAGE_BUFFER_SZ
from progs.tetris.board import Board
from progs.tetris.defs import N_ROWS, N_COLS, N_COLORS
from progs.tetris.te_types import TeCell
from soeunasm import For, ForRange, call, M, If, Else, cmt, Scope, local_var, While, ElseIf, getb, expr
from soeunasm.data import local_vars

BOARD_TOP_PADDING = 2
BOARD_LEFT_PADDING = 10


def init_tetris_color_palette():
    call(switch_screen_page, 0, 0)
    call(reset_color_palette)
    call(set_color_palette, 4, 0xa0, 0x00, 0xf0)
    call(set_color_palette, 7, 0x70, 0x70, 0x70)


def display_board(A, B, C, D, G, H):
    display_board_generic(Board.state.addr(), N_ROWS, N_COLS, BOARD_TOP_PADDING, BOARD_LEFT_PADDING,
                          A, B, C, D, G, H)


def display_board_generic(state_table, n_rows, n_cols, top_padding, left_padding,
                          A, B, C, D, G, H):
    cur_row, n_rows_minus_one = local_vars(2)
    n_rows_minus_one @= n_rows - 1
    with ForRange(A, 0, n_rows):
        cur_row @= A
        G @= top_padding + A
        call(switch_screen_page_rgb, G)
        with ForRange(B, 0, n_cols, preserve=[A]):
            C @= n_cols
            G @= 0
            with If(B == C - 1):
                G @= 0x8000
            with If(B == 0):
                G |= 1

            D @= cur_row * C
            D @= (D + B) + state_table
            A @= M[D].byte()

            C @= B + left_padding
            C @= expr(g_row_buffer.addr()) + C * 2
            with If(A == TeCell.EMPTY):
                with ForRange(D, ROW_BUFFER_SZ * 0, PAGE_BUFFER_SZ * 3, ROW_BUFFER_SZ * 2):
                    M[C + D] @= 1 | G
                with ForRange(D, ROW_BUFFER_SZ * 1, PAGE_BUFFER_SZ * 3, ROW_BUFFER_SZ * 2):
                    M[C + D] @= 0 | G
                for i in range(0, PAGE_BUFFER_SZ * 3, PAGE_BUFFER_SZ):
                    M[C + i] @= 0x5555
                # END scope

                Else()  # If ( A != TeCell.EMPTY )

                for i in range(3):
                    H @= getb(A, i)
                    with If(H != 0):
                        H @= 0x7FFF
                    with ForRange(D, PAGE_BUFFER_SZ * i + ROW_BUFFER_SZ * 0,
                                  PAGE_BUFFER_SZ * (i + 1) - ROW_BUFFER_SZ,
                                  ROW_BUFFER_SZ * 2):
                        M[C + D] @= H | G
                    with ForRange(D, PAGE_BUFFER_SZ * i + ROW_BUFFER_SZ * 1,
                                  PAGE_BUFFER_SZ * (i + 1) - ROW_BUFFER_SZ,
                                  ROW_BUFFER_SZ * 2):
                        M[C + D] @= H | G
                    M[C + D] @= 0
            # END if (A == TeCell.EMPTY)
            A @= cur_row
            with If(A == n_rows_minus_one):
                for i in range(ROW_BUFFER_SZ * (CHUNK_SZ - 1), PAGE_BUFFER_SZ * 3, PAGE_BUFFER_SZ):
                    M[C + i] @= 0xFFFF
            with If(A == 0):
                for i in range(0, PAGE_BUFFER_SZ * 3, PAGE_BUFFER_SZ):
                    M[C + i] @= 0xFFFF
        # END for B
    # END for A
