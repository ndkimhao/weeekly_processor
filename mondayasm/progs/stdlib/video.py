from progs.stdlib.printf import PRINTF
from soeunasm import addr, mmap, For, M, cmt, Loop, If, getb, Break, call, ElseIf, expr, Scope, ForRange, umap
from soeunasm.data import global_var, const, local_var, local_vars

CHUNK_SZ = 16
WIDTH = 640
HEIGHT = 480

MMAP_SLOT = 4
PAGE_BUFFER_SZ = WIDTH // 8 * CHUNK_SZ
ROW_BUFFER_SZ = WIDTH // 8

g_page_buffer = global_var('VIDEO_ROW_BUFFER', size=PAGE_BUFFER_SZ * 3, align=16)
g_row_buffer_end = g_page_buffer.addr_add(PAGE_BUFFER_SZ)


# each page consists of 16 rows
def switch_screen_page(page, color, A, B, H):
    START_ADDR = g_page_buffer.addr()
    END_ADDR = g_page_buffer.addr_add(PAGE_BUFFER_SZ - 1).addr()

    A @= color
    A @= 0xA0 + A
    B @= page * (ROW_BUFFER_SZ * CHUNK_SZ)
    mmap(START_ADDR, END_ADDR, MMAP_SLOT)


def switch_screen_page_rgb(page, A, B):
    START_ADDR = g_page_buffer.addr()
    END_ADDR = g_page_buffer.addr_add(PAGE_BUFFER_SZ - 1).addr()

    A @= 0xA1
    B @= page * (ROW_BUFFER_SZ * CHUNK_SZ)
    mmap(START_ADDR + PAGE_BUFFER_SZ * 0, END_ADDR + PAGE_BUFFER_SZ * 0, MMAP_SLOT + 0)
    A @= 0xA2
    mmap(START_ADDR + PAGE_BUFFER_SZ * 1, END_ADDR + PAGE_BUFFER_SZ * 1, MMAP_SLOT + 1)
    A @= 0xA4
    mmap(START_ADDR + PAGE_BUFFER_SZ * 2, END_ADDR + PAGE_BUFFER_SZ * 2, MMAP_SLOT + 2)


def unmap_screen_row():
    umap(MMAP_SLOT)


def fill_cell(col, value, A, G):
    G @= value
    A @= col << 1
    with For(A @ (A + g_page_buffer.addr()), A < g_row_buffer_end.addr(), A @ (A + ROW_BUFFER_SZ)):
        M[A] @= G


def get_cell_addr(col, H):
    H @= col << 1
    H @= H + g_page_buffer.addr()


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
    M[A.raw + g_page_buffer.addr()] @= blue
    M[A.raw + (g_page_buffer.addr() + 0x10)] @= green
    M[A.raw + (g_page_buffer.addr() + 0x20)] @= red
