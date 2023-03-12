from progs.stdlib.printf import PRINTF
from soeunasm import addr, mmap, For, M, cmt, Loop, If, getb, Break, call, ElseIf, expr, Scope, ForRange, umap
from soeunasm.data import global_var, const, local_var, local_vars

CHUNK_SZ = 16
WIDTH = 640
HEIGHT = 480

MMAP_SLOT = 1
ROW_BUFFER_SZ = WIDTH // 8 * CHUNK_SZ

g_row_buffer = global_var('VIDEO_ROW_BUFFER', size=ROW_BUFFER_SZ, align=16)
g_row_buffer_end = g_row_buffer.addr_add(ROW_BUFFER_SZ)

JUMP_ONE_ROW = WIDTH // 8


def switch_screen_row(chunk_row, color, A, B, H):
    A @= color
    A @= 0xA0 + A
    B @= chunk_row * (JUMP_ONE_ROW * CHUNK_SZ)
    start_addr = g_row_buffer.addr()
    end_addr = g_row_buffer.addr_add(ROW_BUFFER_SZ - 1).addr()
    mmap(start_addr, end_addr, MMAP_SLOT)


def unmap_screen_row():
    umap(MMAP_SLOT)


def fill_cell(col, value, A, G):
    G @= value
    A @= col << 1
    with For(A @ (A + g_row_buffer.addr()), A < g_row_buffer_end.addr(), A @ (A + JUMP_ONE_ROW)):
        M[A] @= G


def fill_cell_except_first_and_last_row(col, value, A, G):
    G @= value
    A @= col << 1
    with For(A @ (A + (g_row_buffer.addr() + JUMP_ONE_ROW)),
             A < g_row_buffer_end.addr() - JUMP_ONE_ROW,
             A @ (A + JUMP_ONE_ROW)):
        M[A] @= G


def get_cell_addr(col, H):
    H @= col << 1
    H @= H + g_row_buffer.addr()


def fill_cell_content(col, ptr_buf, A, B):
    A @= col << 1
    B @= ptr_buf
    with For(A @ (A + g_row_buffer.addr()),
             A < g_row_buffer_end.addr(),
             (A @ (A + JUMP_ONE_ROW), B @ (B + 2))
             ):
        M[A] @= M[B]


# must call(switch_screen_row, 0, 0) before calling this
def reset_color_palette(A, B, C, D):
    with ForRange(A, 0, 8):
        for i, reg in enumerate([B, C, D]):
            reg @= getb(A, 2 - i)
            with If(reg != 0):
                reg @= 0xFF
        call(set_color_palette, A, B, C, D)


# must call(switch_screen_row, 0, 0) before calling this
def set_color_palette(color_idx, red, green, blue,
                      A):
    A @= color_idx & 0x07
    A <<= 1
    M[A.raw + g_row_buffer.addr()] @= blue
    M[A.raw + (g_row_buffer.addr() + 0x10)] @= green
    M[A.raw + (g_row_buffer.addr() + 0x20)] @= red
