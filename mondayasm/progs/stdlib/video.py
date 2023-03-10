from soeunasm import addr, mmap, For, M, cmt, Loop, If, getb, Break, call, ElseIf, expr, Scope
from soeunasm.data import global_var, const, local_var, local_vars

CHUNK_SZ = 16
WIDTH = 640
HEIGHT = 480

MMAP_SLOT = 1
ROW_BUFFER_SZ = WIDTH // 8 * CHUNK_SZ
ROW_BUFFER = global_var('VIDEO_ROW_BUFFER', size=ROW_BUFFER_SZ, align=16)
ROW_BUFFER_END = ROW_BUFFER.addr_add(ROW_BUFFER_SZ)

JUMP_ONE_ROW = WIDTH // 8


def switch_screen_row(chunk_row, color, A, B, H):
    A @= color
    A @= 0xA0 + A
    B @= chunk_row * (JUMP_ONE_ROW * CHUNK_SZ)
    start_addr = ROW_BUFFER.addr()
    end_addr = ROW_BUFFER.addr_add(ROW_BUFFER_SZ - 1).addr()
    mmap(start_addr, end_addr, MMAP_SLOT)


def fill_cell(col, value, A, G):
    G @= value
    A @= col << 1
    with For(A @ (A + ROW_BUFFER.addr()), A < ROW_BUFFER_END.addr(), A @ (A + JUMP_ONE_ROW)):
        M[A] @= G


def get_cell_addr(col, H):
    H @= col << 1
    H @= H + ROW_BUFFER.addr()


def fill_cell_content(col, ptr_buf, A, B):
    A @= col << 1
    B @= ptr_buf
    with For(A @ (A + ROW_BUFFER.addr()),
             A < ROW_BUFFER_END.addr(),
             (A @ (A + JUMP_ONE_ROW), B @ (B + 2))
             ):
        M[A] @= M[B]
