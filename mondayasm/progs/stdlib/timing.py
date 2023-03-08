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


def _delay_impl(cnt_2, cnt_1, cnt_0, loop_target, A, B, C, D, H):
    B @= M_CLK_COUNT_0
    C @= M_CLK_COUNT_1
    D @= M_CLK_COUNT_2
    # call(printf, const("begi: %x %x %x\n"), D, C, B)

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

    # call(printf, const("targ: %x %x %x\n"), D, C, B)
    cmt("delay loop")
    A @= loop_target
    with Loop():
        H @= M_CLK_COUNT_2
        with If(H > D):
            Break()

            ElseIf(H == D, emit_jmp_cleanup_before_this=False)

            H @= M_CLK_COUNT_1
            with If(H > C):
                Break()

                ElseIf(H == C, emit_jmp_cleanup_before_this=False)

                If(M_CLK_COUNT_0 > B).then_break()

                with If(A != 0):
                    mondayasm.CALL(A.raw_expr)
    # call(printf, const("done: %x %x %x\n"), M_CLK_COUNT_2, M_CLK_COUNT_1, M_CLK_COUNT_0)
