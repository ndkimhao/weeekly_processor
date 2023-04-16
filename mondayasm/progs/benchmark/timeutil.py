from progs.stdlib.devices import M_INSTRUCTIONS_COUNT_0, M_INSTRUCTIONS_COUNT_1, M_INSTRUCTIONS_COUNT_2, M_CLK_COUNT_0, \
    M_CLK_COUNT_1, M_CLK_COUNT_2, UART_STATUS, FLAG_UART_SEND_EMPTY
from progs.stdlib.syscall import syscall, S
from soeunasm import const, Loop, M, If


def print_time(A, B, C, D, E, F):
    A @= M_CLK_COUNT_0
    B @= M_CLK_COUNT_1
    C @= M_CLK_COUNT_2

    D @= M_INSTRUCTIONS_COUNT_0
    E @= M_INSTRUCTIONS_COUNT_1
    F @= M_INSTRUCTIONS_COUNT_2

    # ensure print less than 32 characters
    syscall(S.printf, const('%x%x%x, %x%x%x, '), C, B, A, F, E, D)


def wait_clean_uart_buffer(H):
    with Loop():
        H @= M[UART_STATUS] & FLAG_UART_SEND_EMPTY
        If(H != 0).then_break()
