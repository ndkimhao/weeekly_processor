from progs.stdlib import printf
from progs.stdlib.devices import M_CLK_COUNT_2, M_CLK_COUNT_1, M_CLK_COUNT_0
from soeunasm import If, While, Else, Loop, call, Break, Continue, ElseIf, cmt, Scope, Cleanup, BreakIf
from soeunasm.data import const

CLK_FREQ = 60_000_000  # 60 MHz


def DELAY_MILLIS(us):
    DELAY_NANOS(us * 1_000_000)


def DELAY_MICROS(us):
    DELAY_NANOS(us * 1_000)


def DELAY_NANOS(ns):
    ns = int(ns)
    cycles = (ns * CLK_FREQ) // 1_000_000_000
    assert 0 <= cycles < 2 ** 48
    call(_delay_impl,
         (cycles >> 32) & 0xFFFF,
         (cycles >> 16) & 0xFFFF,
         (cycles >> 0) & 0xFFFF
         )


def _delay_impl(cnt_2, cnt_1, cnt_0, A, B, C, D, H):
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

    # call(printf, const("done: %x %x %x\n"), M_CLK_COUNT_2, M_CLK_COUNT_1, M_CLK_COUNT_0)
