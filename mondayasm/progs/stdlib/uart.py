from progs.stdlib.devices import UART_STATUS, FLAG_UART_SEND_FULL, UART_SEND, UART_RECV, FLAG_UART_RECV_VALID
from soeunasm import cmt, Loop, M, If, Break


def putc(c, H):
    cmt('wait if uart send buffer is full')
    with Loop():
        H @= M[UART_STATUS] & FLAG_UART_SEND_FULL
        If(H == 0).then_break()

    cmt('send data now')
    M[UART_SEND] @= c


def getc(G, H):
    with Loop():
        # recv uart
        H @= M[UART_RECV]
        G @= H & FLAG_UART_RECV_VALID
        If(G == 0).then_continue()

        # got one
        H &= 0xFF
        Break()
