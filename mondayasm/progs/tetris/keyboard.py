from progs.stdlib.devices import M_PS2_RECV, FLAG_PS2_RECV_VALID, BTN_DEBOUNCED, BIT_BTN_DOWN, BIT_BTN_UP, \
    BIT_BTN_RIGHT, BIT_BTN_LEFT, BIT_BTN_CENTER
from progs.tetris.board import tg_handle_move
from progs.tetris.display import tg_display
from progs.tetris.te_types import TeMove
from soeunasm import global_var, Loop, If, ElseIf, call, M, getb

last_btn_in = global_var('last_btn_in')


def handle_keyboard(A, G, H):
    # PS/2 keyboard
    scan_code = global_var('handle_keyboard__scan_code')
    with Loop():
        G @= M_PS2_RECV
        H @= G & FLAG_PS2_RECV_VALID
        If(H == 0).then_break()

        H @= scan_code << 8
        G &= 0xFF
        H |= G
        scan_code @= H

        G @= H >> 8
        H &= 0xFF
        If(G == 0xF0).then_continue()  # break code
        G @= TeMove.NONE
        with If(H == 0x75):  # up
            G @= TeMove.ROTATE

            ElseIf(H == 0x74)  # right
            G @= TeMove.RIGHT

            ElseIf(H == 0x6B)  # left
            G @= TeMove.LEFT

            ElseIf(H == 0x72)  # down
            G @= TeMove.SOFT_DROP

            ElseIf(H == 0x21)  # C
            G @= TeMove.HOLD

            ElseIf(H == 0x1A)  # Z
            G @= TeMove.ROTATE_R

            ElseIf(H == 0x22)  # X
            G @= TeMove.ROTATE

            ElseIf(H == 0x29)  # Space Bar
            G @= TeMove.DROP

        with If(G != TeMove.NONE):
            call(tg_handle_move, G)
            call(tg_display)

    # On-board buttons
    H @= M[BTN_DEBOUNCED]
    with If(H != last_btn_in):
        last_btn_in @ H
        G @= TeMove.NONE

        A @= getb(H, BIT_BTN_UP)
        with If(A != 0):
            G @= TeMove.ROTATE

        A @= getb(H, BIT_BTN_RIGHT)
        with If(A != 0):
            G @= TeMove.RIGHT

        A @= getb(H, BIT_BTN_LEFT)
        with If(A != 0):
            G @= TeMove.LEFT

        A @= getb(H, BIT_BTN_DOWN)
        with If(A != 0):
            G @= TeMove.DROP

        A @= getb(H, BIT_BTN_CENTER)
        with If(A != 0):
            G @= TeMove.HOLD

        with If(G != TeMove.NONE):
            call(tg_handle_move, G)
            call(tg_display)
