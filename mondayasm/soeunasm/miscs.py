import mondayasm as mon
from mondayasm import Block, CodeGen
from soeunasm import Expr
from soeunasm.free_expr import expr


def adjust_sp(n):
    if n == 0:
        return Block()
    SP = expr(mon.SP)
    return SP @ (SP + n)


def cmt(message):
    mon.builder.Comment(message)


def init_code_gen() -> CodeGen:
    return CodeGen()


class Reg:
    A = Expr.to_expr(mon.A)
    B = Expr.to_expr(mon.B)
    C = Expr.to_expr(mon.C)
    D = Expr.to_expr(mon.D)
    SP = Expr.to_expr(mon.SP)
    PC = Expr.to_expr(mon.PC)
    E = Expr.to_expr(mon.E)
    F = Expr.to_expr(mon.F)
    G = Expr.to_expr(mon.G)
    H = Expr.to_expr(mon.H)
