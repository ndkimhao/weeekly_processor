from typing import Iterable

from soeunasm import Expr, Statement, StmOp
from mondayasm import builder as monb
import mondayasm as mon
from soeunasm.cmp_expr import CmpExpr

_g_scope_stack: list['ScopeCtx'] = []


# noinspection PyPep8Naming, PyProtectedMember
class ScopeCtxInner:
    def __init__(self, blk: 'ScopeCtx'):
        self._blk = blk

    def Break(self):
        return Statement(StmOp.JMP, self._blk.l_cleanup)

    def BreakIf(self, cond: CmpExpr, *, signed: bool = False):
        assert isinstance(cond, CmpExpr)
        return cond.then_jmp(self._blk.l_cleanup, signed=signed)

    def ScopeCleanup(self):
        self._blk._emit_cleanup()


class ScopeCtx:
    def __init__(self, preserve: Iterable[Expr]):
        assert all(e.is_pure_register for e in preserve)
        self._preserve = tuple(preserve)

        name = monb.Global.gen_label_name('scope', prefix='')
        self.l_prepare = mon.DeclLabel('_A_' + name)
        self.l_cleanup = mon.DeclLabel('_C_' + name)
        self.l_end = mon.DeclLabel('_Z_' + name)
        self._emitted_cleanup = False

    def __enter__(self) -> ScopeCtxInner:
        _g_scope_stack.append(self)

        mon.EmitLabel(self.l_prepare)
        for v in self._preserve:
            mon.PUSH(v.a)
        return ScopeCtxInner(self)

    def __exit__(self, exc_type, exc_val, exc_tb):
        assert _g_scope_stack[-1] is self
        _g_scope_stack.pop()

        if not self._emitted_cleanup:
            self._emit_cleanup()
        for v in reversed(self._preserve):
            mon.POP(v.a)
        mon.EmitLabel(self.l_end)

    def _emit_cleanup(self):
        assert not self._emitted_cleanup
        self._emitted_cleanup = True
        mon.EmitLabel(self.l_cleanup)


# noinspection PyPep8Naming
def Scope(preserve: Iterable[Expr] = ()):
    return ScopeCtx(preserve)


# noinspection PyPep8Naming, PyProtectedMember
def ScopeCleanup():
    blk = _g_scope_stack[-1]
    blk._emit_cleanup()
