from progs.stdlib import printf
from progs.stdlib.printf import puts
from soeunasm import addr, mmap, For, M, cmt, Loop, If, getb, Break, call, ElseIf
from soeunasm.data import global_var, const, local_var, local_vars

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


def fill_cell_content(col, ptr_buf, A, B):
    A @= col << 1
    B @= ptr_buf
    with For(A @ (A + ROW_BUFFER),
             A < ROW_BUFFER_END,
             (A @ (A + JUMP_ONE_ROW), B @ (B + 2))
             ):
        # call(printf, const('f:%b\n'), M[B])
        # M[A] @= M[B]
        M[A] @= 0xa0a0
        call(printf, const('%x\n'), M[A])


def decode_font(ptr_out, ptr_encoded, height, width,
                A, B, C, D, E, F, G, H):
    E @= ptr_out
    F @= height << 1
    F += E

    G @= ptr_encoded
    B @= [G]  # current enc word
    C @= 7  # bit index
    A @= 0  # decoding content

    bits_cnt = local_var()

    with For((), E < F, E @ (E + 2)):
        cmt('decode one line')
        A @= 0
        bits_cnt @= 0xFFFF
        with Loop():
            with If(C == -1):
                G += 1
                B @= [G]
                C @= 7
            getb(D, B, C)
            C -= 1
            D @= D.bool()
            A @= (A * 2) | D
            bits_cnt -= 1
            with If(bits_cnt == 0):
                cmt('bit pattern')
                # call(printf, const('A: %b\n'), A)
                H @= A
                A @= -width
                A @= 0xFFFF >> (A + 16)
                M[E] @= H & A
                # call(printf, const('H: %b\n'), H)
                # call(printf, const('A: %b\n'), A)
                Break()

                ElseIf(A == 0, emit_jmp_cleanup_before_this=False)
                cmt('copy line n-1')
                H @= E - 2
                M[E] @= M[H]
                # call(puts, const('n-1\n'))
                Break()

                ElseIf(A == 0b10, emit_jmp_cleanup_before_this=False)

                cmt('copy line n-2')
                H @= E - 4
                M[E] @= M[H]
                # call(puts, const('n-2\n'))
                Break()

                ElseIf(A == 0b110, emit_jmp_cleanup_before_this=False)

                cmt('all zeros')
                M[E] @= 0
                # call(puts, const('zeros\n'))
                Break()

                ElseIf(A == 0b111, emit_jmp_cleanup_before_this=False)

                cmt('bitmap')
                bits_cnt @= width
                # call(puts, const('bitmap\n'))
