from mondayasm import RawExpr, RawIndirect
from soeunasm import ExprOp, Expr


def expr(val):
    return Expr.to_expr(val)


def add(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs + rhs


def sub(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs - rhs


def mul(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs * rhs


def imul(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs.imul(rhs)


def truediv(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs / rhs


def floordiv(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs // rhs


def idiv(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs.idiv(rhs)


def rshift(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs >> rhs


def ishr(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs.ishr(rhs)


def lshift(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs << rhs


def And(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs & rhs


def Or(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs | rhs


def xor(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs ^ rhs


def neg(val):
    val = Expr.to_expr(val)
    return -val


def invert(val):
    val = Expr.to_expr(val)
    return ~val


def bool(val):
    val = Expr.to_expr(val)
    return val.bool()


def inc(val):
    val = Expr.to_expr(val)
    return val.inc()


def dec(val):
    val = Expr.to_expr(val)
    return val.dec()


def byte(val):
    val = Expr.to_expr(val)
    return val.byte()


# Statements

def mov(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs @ rhs


def bmov(lhs, rhs):
    lhs = Expr.to_expr(lhs).byte()
    rhs = Expr.to_expr(rhs).byte()
    return lhs @ rhs


# Comparators

def eq(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs == rhs


def ne(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs != rhs


def lt(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs < rhs


def le(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs <= rhs


def gt(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs > rhs


def ge(lhs, rhs):
    lhs = Expr.to_expr(lhs)
    rhs = Expr.to_expr(rhs)
    return lhs >= rhs


####

def deref(val):
    if not isinstance(val, Expr):
        val = Expr.to_expr(val)
    assert val.op == ExprOp.NONE
    assert isinstance(val.a, RawExpr)
    return Expr.to_expr([val.a])
