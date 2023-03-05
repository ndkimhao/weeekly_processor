from mondayasm import RawExpr
from soeunasm import Expr, scope_global
import mondayasm as mon
from soeunasm.enums import placeholder_stack_offset
from soeunasm.free_expr import expr
from soeunasm.scope_func import FuncScopeCtx


def stack_vars(n: int) -> tuple[Expr, ...]:
    g_stack = scope_global.g_stack
    assert len(g_stack) == 0 or \
           (len(g_stack) == 1 and isinstance(g_stack[0], FuncScopeCtx))

    sp_offset = RawExpr.to_expr(placeholder_stack_offset) * 2
    ret = []
    for i in range(n):
        scope_global.inc_stack_offset(1)
        cur_offset = scope_global.cur_stack_offset() * 2
        ret.append(Expr.to_expr([mon.SP + sp_offset - cur_offset]))
    expr(mon.SP).__isub__(n * 2)
    return tuple(ret)


def stack_var() -> Expr:
    return stack_vars(1)[0]