import mondayasm as mon
from mondayasm import Block
from soeunasm.free_expr import expr


def _adjust_sp(n):
    if n == 0:
        return Block()
    SP = expr(mon.SP)
    return SP @ (SP + n)


def Comment(message):
    mon.builder.Comment(message)
