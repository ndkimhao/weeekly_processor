import soeunasm as so
import mondayasm as mon
from mondayasm import CodeGen
from soeunasm import Expr
from soeunasm.free_expr import mul, expr


def main():
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

    print(A < B)


if __name__ == '__main__':
    main()

    cg = CodeGen()
    cg.compile().write('test_soeun.asm')
