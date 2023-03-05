from typing import Iterable

from soeunasm import Expr, Statement, StmOp
from mondayasm import builder as monb
import mondayasm as mon
from soeunasm.block import BlockStmArg, Block
from soeunasm.cmp_expr import CmpExpr
from soeunasm.global_stack import _push_global_scope, _pop_global_scope

_g_for_stack: list['ForScopeCtx'] = []


# noinspection PyPep8Naming, PyProtectedMember
class ForScopeCtxInner:
    def __init__(self, blk: 'ForScopeCtx'):
        self._blk = blk

    def Break(self):
        return Statement(StmOp.JMP, self._blk.l_cleanup)

    def BreakIf(self, cond: CmpExpr, *, signed: bool = False):
        assert isinstance(cond, CmpExpr)
        return cond.then_jmp(self._blk.l_cleanup, signed=signed)

    def Continue(self):
        return Statement(StmOp.JMP, self._blk.l_end_body)

    def ContinueIf(self, cond: CmpExpr, *, signed: bool = False):
        assert isinstance(cond, CmpExpr)
        return cond.then_jmp(self._blk.l_end_body, signed=signed)

    def Cleanup(self):
        self._blk._emit_cleanup()


class ForScopeCtx:
    def __init__(self, init: BlockStmArg, cond: CmpExpr, incr: BlockStmArg,
                 signed: bool, preserve: Iterable[Expr], loop_name):
        assert all(e.is_pure_register for e in preserve)
        assert isinstance(init, BlockStmArg)
        assert isinstance(cond, CmpExpr)
        assert isinstance(incr, BlockStmArg)
        self._init = Block.create(init).do_not_emit()
        self._cond = cond
        self._incr = Block.create(incr).do_not_emit()
        self._signed = signed
        self._preserve = tuple(preserve)

        name = monb.Global.gen_label_name(loop_name, prefix='')
        self.l_prepare = mon.DeclLabel('_A_' + name)
        self.l_cleanup = mon.DeclLabel('_C_' + name)
        self.l_end = mon.DeclLabel('_Z_' + name)
        self._emitted_cleanup = False

        self.l_begin_body = mon.DeclLabel('_BA_' + name)
        self.l_end_body = mon.DeclLabel('_BZ_' + name)

        self.inner_ctx = ForScopeCtxInner(self)

    def __enter__(self) -> ForScopeCtxInner:
        _g_for_stack.append(self)
        _push_global_scope(self)

        mon.EmitLabel(self.l_prepare)
        for v in self._preserve:
            mon.PUSH(v.a)

        mon.EmitLabel(self.l_begin_body)
        self._cond.then_jmp(self.l_cleanup, negated=True, signed=self._signed)
        return self.inner_ctx

    def __exit__(self, exc_type, exc_val, exc_tb):
        assert _g_for_stack[-1] is self
        _g_for_stack.pop()
        _pop_global_scope(self)

        if not self._emitted_cleanup:
            self._emit_cleanup()
        for v in reversed(self._preserve):
            mon.POP(v.a)
        mon.EmitLabel(self.l_end)

    def _emit_cleanup(self):
        assert not self._emitted_cleanup
        self._emitted_cleanup = True
        mon.EmitLabel(self.l_end_body)
        self._incr.emit(forced=True)
        mon.JMP(self.l_begin_body)
        mon.EmitLabel(self.l_cleanup)


# noinspection PyPep8Naming
def For(init: BlockStmArg, cond: CmpExpr, incr: BlockStmArg,
        *, signed: bool = False, preserve: Iterable[Expr] = ()):
    return ForScopeCtx(init, cond, incr, signed, preserve, 'for')


def While(cond: CmpExpr, *, signed: bool = False, preserve: Iterable[Expr] = ()):
    return ForScopeCtx((), cond, (), signed, preserve, 'while')
