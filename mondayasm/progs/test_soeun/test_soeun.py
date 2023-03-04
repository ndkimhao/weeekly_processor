import soeunasm as so
import mondayasm as mon
from mondayasm import CodeGen
from soeunasm import SoExpr
from soeunasm.free_expr import mul


def main():
    A = SoExpr(mon.A)
    B = SoExpr(mon.B)
    C = SoExpr(mon.C)
    tmp = A * 2 + B + 10
    [B] @ mul([B], [C])
    [C + 100] @ (B | A)


if __name__ == '__main__':
    main()

    cg = CodeGen()
    cg.compile().write('test_soeun.asm')
