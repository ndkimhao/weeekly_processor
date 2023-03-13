import inspect

import mondayasm
from progs.stdlib import printf
from progs.stdlib.devices import M_CLK_COUNT_2, M_CLK_COUNT_1, M_CLK_COUNT_0
from soeunasm import If, While, Else, Loop, call, Break, Continue, ElseIf, cmt, Scope, Cleanup, BreakIf, emit_fn
from soeunasm.data import const

CLK_FREQ = 60_000_000  # 60 MHz


def DELAY_MILLIS(us, loop_fn=None):
    DELAY_NANOS(us * 1_000_000, loop_fn)


def DELAY_MICROS(us, loop_fn=None):
    DELAY_NANOS(us * 1_000, loop_fn)


def DELAY_NANOS(ns, loop_fn=None):
    ns = int(ns)
    cycles = (ns * CLK_FREQ) // 1_000_000_000
    assert 0 <= cycles < 2 ** 48
    loop_target = emit_fn(loop_fn) if loop_fn is not None else 0
    call(_delay_impl,
         (cycles >> 32) & 0xFFFF,
         (cycles >> 16) & 0xFFFF,
         (cycles >> 0) & 0xFFFF,
         loop_target
         )


def _delay_impl(cnt_2, cnt_1, cnt_0, loop_target, A, B, C, D, E, H, G):
    B @= M_CLK_COUNT_0
    C @= M_CLK_COUNT_1
    D @= M_CLK_COUNT_2
    # call(printf, const("DELAY: %x %x %x + %x %x %x = "), D, C, B, cnt_2, cnt_1, cnt_0)

    # first word
    A @= cnt_0
    H @= 0
    with If(A + B < A):
        H @= 1
    B += A

    # second word
    A @= cnt_1 + H
    H @= 0
    with Scope():
        If(A + C < A).then_break()
        If(A < H).then_break()
        Break(cleanup=False)

        Cleanup()
        H @= 1

    C += A

    # third word
    A @= cnt_2 + H
    D += A

    cmt("delay loop")
    A @= loop_target
    with Loop():
        H @= M_CLK_COUNT_0
        G @= M_CLK_COUNT_1
        E @= M_CLK_COUNT_2
        with If(E != D):
            If(E > D).then_break()
            Else()
            with If(G != C):
                If(G > C).then_break()
                Else()
                If(H > B).then_break()
                with If(A != 0):
                    # we don't need to preserve E, G, H here
                    mondayasm.CALL(A.raw_expr)

    # call(printf, const("%x %x %x => %x %x %x\n"), D, C, B, E, G, H)


def delay_1ms():
    DELAY_MILLIS(1)


def delay_10ms():
    DELAY_MILLIS(10)
