from progs.stdlib.devices import FLAG_UART_SEND_FULL, UART_SEND, UART_STATUS
from soeunasm import M, If, For, cmt, call, Loop


def send_char(c, H):
    cmt('wait if uart send buffer is full')
    with Loop():
        H @= M[UART_STATUS] & FLAG_UART_SEND_FULL
        If(H == 0).then_break()

    cmt('send data now')
    M[UART_SEND] @= c


# noinspection PyPep8Naming
def printf(fmt, VAR_ARGS,
           A, B, C, D, G, H):
    cmt('For each letter in fmt')
    with For(A @ fmt, True, A @ (A + 1)):
        H @= M[A].byte()
        If(H == 0).then_break()
        call(send_char, H)
