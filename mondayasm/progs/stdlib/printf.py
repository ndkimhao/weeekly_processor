from progs.stdlib.devices import FLAG_UART_SEND_FULL, UART_SEND, UART_STATUS
from progs.stdlib.format import itoa_10
from soeunasm import M, If, For, cmt, call, Loop, Continue, addr, ElseIf, Break, Cleanup, Else, BreakIf
from soeunasm.data import local_var
from soeunasm.free_expr import decl_label, label, inc


def send_char(c, H):
    cmt('wait if uart send buffer is full')
    with Loop():
        H @= M[UART_STATUS] & FLAG_UART_SEND_FULL
        If(H == 0).then_break()

    cmt('send data now')
    M[UART_SEND] @= c


# noinspection PyPep8Naming
def printf(fmt, VAR_ARGS,
           A, B, C, D, H):
    buf = local_var(size=6)
    cmt('For each letter in fmt')
    B @= addr(VAR_ARGS)
    with For(A @ fmt, True, A @ (A + 1)):
        C @= M[A].byte()
        If(C == 0).then_break()

        cmt('normal char')
        with If(C != ord('%')):
            call(send_char, C)
            Continue()

        cmt('format specifier')
        A += 1
        C @= M[A].byte()
        with If(C == 0) as if_g_0:
            Break()

            ElseIf(C == ord('d'))
            cmt('format %d')
            call(itoa_10, [B], addr(buf))
            with For(D @ addr(buf), True, D @ (D + 1)):
                H @= M[D].byte()
                If(H == 0).then_break()
                call(send_char, H)

            B += 2

            ElseIf(C == ord('x'))
            cmt('format %x')
            B += 2

            ElseIf(C == ord('%'))
            cmt('format %%')
            call(send_char, ord('%'))


def test_itoa_10(A):
    buf = local_var(size=6)
    A @= 0
    with Loop():
        call(itoa_10, A, buf)
        call(printf, buf)
        call(send_char, ord('\n'))

        A += 1
        BreakIf(A == 0)
