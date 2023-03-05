from typing import Iterable

from soeunasm import Expr, Statement, StmOp
from mondayasm import builder as monb
import mondayasm as mon
from soeunasm.cmp_expr import CmpExpr
from soeunasm.scope_global import push_global_scope, pop_global_scope, inc_stack_offset, dec_stack_offset

g_scope_stack: list['ScopeCtx'] = []


# noinspection PyPep8Naming, PyProtectedMember
class ScopeCtxInner:
    def __init__(self, blk: 'ScopeCtx'):
        self._blk = blk

    def Break(self):
        return Statement(StmOp.JMP, self._blk.l_cleanup)

    def BreakIf(self, cond: CmpExpr, *, signed: bool = False):
        assert isinstance(cond, CmpExpr)
        return cond.then_jmp(self._blk.l_cleanup, signed=signed)

    def Continue(self):
        return Statement(StmOp.JMP, self._blk.l_begin_body)

    def ContinueIf(self, cond: CmpExpr, *, signed: bool = False):
        assert isinstance(cond, CmpExpr)
        return cond.then_jmp(self._blk.l_begin_body, signed=signed)

    def Cleanup(self):
        self._blk._emit_cleanup()


class ScopeCtx:
    def __init__(self, preserve: Iterable[Expr], simple: bool, base_name: str):
        assert all(e.is_pure_register for e in preserve)
        self._preserve = tuple(preserve)
        self._simple = simple

        name = monb.Global.gen_label_name(base_name, prefix='')
        self.l_prepare = mon.DeclLabel('_A_' + name)
        self.l_begin_body = mon.DeclLabel('_B_' + name)
        self.l_cleanup = mon.DeclLabel('_C_' + name) if not simple else None
        self.l_end = mon.DeclLabel('_Z_' + name)
        self._emitted_cleanup = False

        self.inner_ctx = ScopeCtxInner(self)

    def __enter__(self) -> ScopeCtxInner:
        mon.EmitLabel(self.l_prepare)
        inc_stack_offset(len(self._preserve))
        for v in self._preserve:
            mon.PUSH(v.a)

        if not self._simple:
            mon.EmitLabel(self.l_begin_body)

        g_scope_stack.append(self)
        push_global_scope(self)
        return self.inner_ctx

    def __exit__(self, exc_type, exc_val, exc_tb):
        assert g_scope_stack[-1] is self
        g_scope_stack.pop()
        pop_global_scope(self)

        if not self._emitted_cleanup:
            self._emit_cleanup()
        dec_stack_offset(len(self._preserve))
        for v in reversed(self._preserve):
            mon.POP(v.a)
        mon.EmitLabel(self.l_end)

    def _emit_cleanup(self):
        if not self._simple:
            assert not self._emitted_cleanup
            self._emitted_cleanup = True
            mon.EmitLabel(self.l_cleanup)


# noinspection PyPep8Naming
def Scope(*, preserve: Iterable[Expr] = (), simple: bool = False, base_name: str = 'scope'):
    return ScopeCtx(preserve, simple, base_name)
