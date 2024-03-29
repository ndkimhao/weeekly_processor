from soeunasm import addr, mmap, For, M, cmt, Loop, If, getb, Break, call, ElseIf, expr, Scope, Else, While
from soeunasm.data import global_var, const, local_var, local_vars
import base64

FONT_16_12_COMPRESSED_BASE64 = \
    b'AAA4IAGOCBDgiGAAOCIcf+OP/GA4CHD+4iPARcP7iIHER4f3AQwcgfiD8IDggcCDgIcAjgCccLjg4DgccERwOOAh0OOeJxBDv8YA4IDgYYAAOM' \
    b'BwYOAgBwYOMBg4BnAw4IAHAw4BmA7BnGw4IHf8uNh2DMAHBAd/yYAAHAQcAzABx/IAAA4CEDiAOEBwQHAgcBBwCOAIwDh8cQRxhOKJxJOIpxDO' \
    b'II4fGDggcHDgmcEADj+YOHxxBHEAOHBwGOAI4/mAOHxxBOIAcPCOIJw+MDjAcUDiQcRDiEcQQ4/nEAYAOP5wBDh+cQAcQTh8YDg8cAQ4fnEEDh' \
    b'8YOP5xBOIBwgHBAcCBwEGAOHxxBBw+IcPjADh8cQQOPxxAHDA4HmAHAQg4CEAHAQg4CDgGYBzAOGBwMOAZwA7gYcMDmAYABx/I4/kAHAD4BnAw' \
    b'4YHMAuBhwDOAHgA4fHEEcQBw4OAgzgIQOHxxBOPJxFA48nAE4/GAOHxxBBx/IMA4fnEEOH5Bw/MAOHxxBOAIBxBOHxg4HnDE4ggHDE4HmDj+cA' \
    b'QcHyHH8wA4/nAEHB8gwDh8cQTgCHHE4gg4fGA4ggcfyDA4+HBAAOPhgDjgcQADiCOHxgA4gnCE4InAk4CnAMuBJwROEJxBMDgCADj+YDiA8YPi' \
    b'i8SniI8QEGA4gjiGcRTiScUTjCcQQYA4fHEEAOHxgDh+cQQcPzgCBgA4fHEEAOHxwYOMBjh+cQQcPzgKcCTgicITiCYAOHxxBOAIcPjiAHEE4f' \
    b'GAO/5wQABgOIIAOHxgOICcIJwRHAocBBg4gIOIjxKeKLxg+IDgOIDwguCJwKOAgcCjgicILiA4OIDwguCJwKOAgBg4/nEAcIDggcCDgIcAjgCO' \
    b'P5g4OHAQAODhgBwBOARwEOBBwQOEBxAOQB0APABgOA5wEADgOYBwMOGZzA8AAAADj+TgIODBgAAHDw4gDj8cQQ4/GDgCHD84ggOH5gAHD44gnA' \
    b'EHEE4fGDiAHH44ggOPxgAHD44ghx/OAJxBOHxgOPBwEHB8gMAHH44ggOPxxAHD8DgCHD84ggGAOCBODhwQAcfDADggTggAHBE4HAA4AhxhODJw' \
    b'HOAZwNOGJxBOQJg4OHBAAOPhgAcP/iIgYAcPziCAYAcPjiCA4fGABw/OIIDh+cAQBx+OIIDj8cQABx5OA5wBAYAHD44gnAE4fHEAcQTh8YA4CB' \
    b'x/IHHgwAcQQDj8YAcQFwgnBEcCjgIYBxATiIjh3YAHEB4QXBE4HHAo4InCC4gOAAcQQDj8cQBw8AcfziAcIDggcCDgIcAjj+YAOPBwEBwDIceD' \
    b'ADggABg4HnBAHGAhwPMAcTjhyYAAAAA='

FONT_16_12_INDEX_PY = [
    0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080,
    0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125,
    0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be,
    0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a,
    0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6,
    0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a,
    0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3
]

FONT_16_12_COMPRESSED = const('FONT_16_12_COMPRESSED', base64.b64decode(FONT_16_12_COMPRESSED_BASE64))
FONT_16_12_INDEX = const('FONT_16_12_INDEX', FONT_16_12_INDEX_PY)

FONT_BUFFER_SZ = 16 * 2


def decode_font_16_12(ptr_out, ch, A, B):
    A @= ch
    B @= ord('?') - 32
    with Scope():
        If(A < 32).then_break()
        If(A >= 128).then_break()
        B @= A - 32
    B <<= 1
    B @= M[FONT_16_12_INDEX + B]
    call(decode_font, ptr_out, B + FONT_16_12_COMPRESSED, 16, 12)


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
                with If(H >= ptr_out):
                    M[E] @= M[H]
                    Else()
                    M[E] @= 0
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


class _VideoConsts:
    CHUNK_SZ = 16
    WIDTH = 640
    HEIGHT = 480
    PAGE_BUFFER_SZ = WIDTH // 8 * CHUNK_SZ
    ROW_BUFFER_SZ = WIDTH // 8


def fill_cell_content(video_buf, col, ptr_buf, A, B, C):
    A @= col << 1
    A += video_buf
    C @= A + _VideoConsts.PAGE_BUFFER_SZ
    B @= ptr_buf
    with For((),
             A < C,
             (A @ (A + _VideoConsts.ROW_BUFFER_SZ), B @ (B + 2))
             ):
        M[A] @= M[B]


def draw_char(video_buf, col, ch, A, B):
    font_buf = local_var(size=2 * 16)
    call(decode_font_16_12, font_buf.addr(), ch)
    call(fill_cell_content, video_buf, col, addr(font_buf))


def draw_str(video_buf, col, s, A, B, H):
    A @= col
    B @= s
    with Loop():
        If(A >= _VideoConsts.WIDTH // _VideoConsts.CHUNK_SZ).then_break()
        H @= M[B].byte()
        If(H == 0).then_break()
        call(draw_char, video_buf, A, H)
        A += 1
        B += 1
