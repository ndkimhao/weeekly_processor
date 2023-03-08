from soeunasm import addr, mmap, For, M
from soeunasm.data import global_var

CHUNK_SZ = 16
WIDTH = 640
HEIGHT = 480

MMAP_SLOT = 1
ROW_BUFFER_SZ = WIDTH // 8 * CHUNK_SZ
ROW_BUFFER = global_var('VIDEO_ROW_BUFFER', size=ROW_BUFFER_SZ, align=16)
ROW_BUFFER_END = ROW_BUFFER + ROW_BUFFER_SZ

JUMP_ONE_ROW = WIDTH // 8


def switch_screen_row(chunk_row, color, A, B, H):
    A @= color
    A @= 0xF0 + A
    B @= chunk_row * (JUMP_ONE_ROW * CHUNK_SZ)
    start_addr = ROW_BUFFER
    end_addr = ROW_BUFFER + ROW_BUFFER_SZ - 1
    mmap(start_addr, end_addr, MMAP_SLOT)


def fill_cell(col, value, A, G):
    G @= value
    A @= col << 1
    with For(A @ (A + ROW_BUFFER), A < ROW_BUFFER_END, A @ (A + JUMP_ONE_ROW)):
        M[A] @= G
