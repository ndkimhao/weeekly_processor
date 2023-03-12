from progs.stdlib.printf import PRINTF
from progs.stdlib.video import switch_screen_row, fill_cell, get_cell_addr, JUMP_ONE_ROW, CHUNK_SZ, reset_color_palette, \
    set_color_palette, g_row_buffer, g_row_buffer_end
from progs.tetris.board import Board
from progs.tetris.defs import N_ROWS, N_COLS, N_COLORS
from soeunasm import For, ForRange, call, M, If, Else, cmt, Scope, local_var, While, ElseIf
from soeunasm.data import local_vars

BOARD_TOP_PADDING = 2
BOARD_LEFT_PADDING = 10


def init_tetris_color_palette():
    call(switch_screen_row, 0, 0)
    call(reset_color_palette)
    call(set_color_palette, 4, 0xa0, 0x00, 0xf0)
    call(set_color_palette, 7, 0x70, 0x70, 0x70)


def display_board(A, B, C, D, H, G):
    cur_row = local_var()
    with ForRange(A, 0, N_ROWS):
        cur_row @= A
        with For(C @ 1, C < 0x08, C @ (C << 1)):
            call(switch_screen_row, A + BOARD_TOP_PADDING, C)
            with ForRange(B, 0, N_COLS, preserve=[A]):
                D @= cur_row * N_COLS
                D @= (D + B) + Board.state.addr()
                A @= M[D].byte()
                D @= A & C
                with If(D != 0):
                    D @= 0x7FFF
                    ElseIf(A == 0)
                    D @= 1
                    with If(B == N_COLS - 1):
                        D |= 0x8000
                    # Else() : D @= 0 is not needed because If(D != 0) ... Else() here

                # draw inner cell
                H @= (B + BOARD_LEFT_PADDING) << 1
                H @= H + g_row_buffer.addr()
                with If(A == 0):  # if cell_type == 0
                    M[H] @= 0xFFFF
                    H += JUMP_ONE_ROW
                with While(H < g_row_buffer_end.addr() - 1 * JUMP_ONE_ROW):
                    M[H] @= D
                    H @ (H + JUMP_ONE_ROW)
                with If(cur_row == N_ROWS - 1):
                    M[H] @= 0xFFFF
                    Else()
                    M[H] @= 1
            # END for B
        # END for C
    # now last row is mmaped
