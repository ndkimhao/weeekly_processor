import soeunasm as so
import mondayasm as mon
from mondayasm import CodeGen
from soeunasm import Expr, If, Else, ElseIf, Scope, Cleanup, BreakIf, Continue, For, Break, While, call
from soeunasm.data import stack_vars, stack_var
from soeunasm.free_expr import mul, expr, deref, mov, address_of
from soeunasm.miscs import Comment
from soeunasm.scope_func import Return


def memcpy(p_dest, p_src, size,
           E, F, G):
    a, b, end_a = E, F, G

    a @= p_dest
    b @= p_src

    end_a @= a
    end_a += size

    with While(a < end_a):
        mov([a], [b])
        a += 2
        b += 2


def main():
    s1, s2 = stack_vars(2)
    A = expr(mon.A)
    B = expr(mon.B)
    C = expr(mon.C)
    tmp = A * 2 + B + 10
    [B] @ mul([B], [C])
    aa = expr([C + 100])
    aa @= (B | A)
    A += 1
    B @= A + 1
    aa += 1
    C @= aa + 1

    A -= 1
    B @= A - 1
    aa -= 1
    C @= aa - 1

    A @ (B * (C + 1))

    mabyte = expr([A])
    mabyte @= B.byte()

    Comment('s1 @= 2')
    s1 @= 2
    s2 @= 3
    with If(A < B, preserve=(A, B)) as outer:
        s1 @= 4
        s2 @= 5
        with Scope(preserve=[C]):
            s1 @= 6
        s1 @= 6
        A @= B

        ElseIf(B == 2)
        A @= B * 2
        with If(B == 3):
            outer.Break()

        Else()
        A @= B + 1

    mon.Label('test')
    If(A == B).jmp(['test'])
    If(A == B).jmp('test')

    with Scope(preserve=[B, C]):
        A += B
        BreakIf(deref(A + 1) > 1000)
        B @= [A] + (A + C)
        Continue()
        Break()

        Cleanup()
        A @= 0

    with For(A @ 0, A < 10, A @ (A + 1), preserve=[C]):
        B *= 2
        with If(B == 1234):
            C @= 100
            Break()
        Continue()
        B @= C * A

        Comment('test comment')
        Cleanup()
        A @= 1

    with While(A < 10, preserve=[C]):
        A += 1
        BreakIf(B == 100)
        Continue()
        A += 2

    with While(True, preserve=[C]):
        A += 1
        Continue()
        Break()

    call(memcpy, A, B, 100)


if __name__ == '__main__':
    call(main, preserve_registers=False)

    cg = CodeGen()
    cg.compile().write('test_soeun.asm')
