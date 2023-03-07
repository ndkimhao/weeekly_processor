from mondayasm import RawExpr
from soeunasm import Expr, scope_global
import mondayasm as mon
from soeunasm.enums import placeholder_stack_offset
from soeunasm.free_expr import expr
from soeunasm.scope_func import FuncScopeCtx


def local_vars(n: int, *, size: int = 2) -> tuple[Expr, ...]:
    assert size % 2 == 0
    g_stack = scope_global.g_stack
    assert len(g_stack) == 0 or \
           (len(g_stack) == 1 and isinstance(g_stack[0], FuncScopeCtx))

    sp_offset = RawExpr.to_expr(placeholder_stack_offset)
    ret = []
    for i in range(n):
        scope_global.inc_stack_offset(size)
        cur_offset = scope_global.cur_stack_offset()
        ret.append(Expr.to_expr([mon.SP + sp_offset - cur_offset]))
    expr(mon.SP).__isub__(n * size)
    return tuple(ret)


def local_var(*, size: int = 2) -> Expr:
    return local_vars(1, size=size)[0]


def global_var(name: str, size: int) -> Expr:
    v = mon.StaticVar(name, size)
    return Expr.to_expr(v)


def const(name, obj=None) -> Expr:
    v = mon.ConstData(name, obj)
    return Expr.to_expr(v)
