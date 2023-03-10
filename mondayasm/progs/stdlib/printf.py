from progs.stdlib.devices import FLAG_UART_SEND_FULL, UART_SEND, UART_STATUS
from progs.stdlib.format import itoa_10, itoa_16, itoa_2
from soeunasm import M, If, For, cmt, call, Loop, Continue, addr, ElseIf, Break, Cleanup, Else, BreakIf
from soeunasm.data import local_var, const


def putc(c, H):
    cmt('wait if uart send buffer is full')
    with Loop():
        H @= M[UART_STATUS] & FLAG_UART_SEND_FULL
        If(H == 0).then_break()

    cmt('send data now')
    M[UART_SEND] @= c


def puts(p_str, A, H):
    with For(A @ p_str, True, A @ (A + 1)):
        H @= M[A].byte()
        If(H == 0).then_break()
        call(putc, H)


# noinspection PyPep8Naming
def printf(fmt, VAR_ARGS,
           A, B, C):
    buf = local_var(size=18)
    cmt('For each letter in fmt')
    B @= addr(VAR_ARGS)
    with For(A @ fmt, True, A @ (A + 1)):
        C @= M[A].byte()
        If(C == 0).then_break()

        cmt('normal char')
        with If(C != ord('%')):
            call(putc, C)
            Continue()

        cmt('format specifier')
        A += 1
        C @= M[A].byte()
        with If(C == 0):
            Break()

            ElseIf(C == ord('%'))
            call(putc, ord('%'))
            Continue()

            ElseIf(C == ord('d'))
            call(itoa_10, [B], addr(buf))
            call(puts, addr(buf))

            ElseIf(C == ord('x'))
            call(itoa_16, [B], addr(buf))
            call(puts, addr(buf))

            ElseIf(C == ord('h'))  # one byte, hex
            call(itoa_16, [B], addr(buf))
            call(puts, addr(buf) + 2)

            ElseIf(C == ord('b'))
            call(itoa_2, [B], addr(buf))
            call(puts, addr(buf))

            ElseIf(C == ord('s'))
            call(puts, [B])

            ElseIf(C == ord('c'))
            call(putc, [B])
        ###
        B += 2


def test_itoa_10(A):
    buf = local_var(size=6)
    A @= 0
    with Loop():
        call(itoa_10, A, buf)
        call(printf, buf)
        call(putc, ord('\n'))

        A += 1
        BreakIf(A == 0)


def PRINTF(fmt, *args):
    call(printf, const(fmt), *args)
