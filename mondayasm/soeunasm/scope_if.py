from typing import Iterable

from soeunasm import StmOp, Statement
from soeunasm.expr import Expr
from soeunasm.cmp_expr import CmpExpr
from mondayasm import builder as monb
import mondayasm as mon
from soeunasm.scope_global import inc_stack_offset, dec_stack_offset, push_global_scope, pop_global_scope, BreakIf, \
    ContinueIf

g_if_stack: list['IfCtx'] = []


class IfCtxInner:
    def __init__(self, blk: 'IfCtx'):
        self._ctx = blk

    def Exit(self):
        return Statement(StmOp.JMP, self._ctx.l_cleanup)

    def ExitIf(self, cond: CmpExpr, *, signed: bool = False):
        assert isinstance(cond, CmpExpr)
        return cond.then_jmp(self._ctx.l_cleanup, signed=signed)

    def ExitWithoutCleanup(self):
        return Statement(StmOp.JMP, self._ctx.l_end)

    def Cleanup(self):
        assert not self._ctx._emitted_cleanup
        self._ctx._emit_cleanup()

    def DoNotEmitJmpCleanupBeforeElse(self):
        self._ctx._emit_jmp_cleanup_before_else = False


# noinspection PyProtectedMember
class IfCtx:
    FUNCTION_BYPASS = ['break', 'continue']

    def __init__(self, cond: CmpExpr, preserve: Iterable[Expr]):
        assert all(e.is_pure_register for e in preserve)
        self._cond = cond
        self._preserve = tuple(preserve)

        name = monb.Global.gen_label_name('if', prefix='')
        self.base_name = name
        self.l_prepare = mon.DeclLabel('_A_' + name)
        self.l_elses = [mon.DeclLabel('_E_' + name)]
        self.l_cleanup = mon.DeclLabel('_C_' + name)
        self.l_end = mon.DeclLabel('_Z_' + name)
        self._emitted_else = False
        self._emitted_cleanup = False
        self._emit_jmp_cleanup_before_else = True

        self.inner_ctx = IfCtxInner(self)

    def __enter__(self) -> IfCtxInner:
        mon.EmitLabel(self.l_prepare)
        inc_stack_offset(len(self._preserve) * 2)
        for v in self._preserve:
            mon.PUSH(v.a)

        self._cond.then_jmp(self.l_elses[-1], negated=True)

        g_if_stack.append(self)
        push_global_scope(self)
        return self.inner_ctx

    def _emit_cleanup(self):
        if self._emitted_cleanup:
            return
        self._emitted_cleanup = True

        if not self._emitted_else:
            mon.EmitLabel(self.l_elses[-1])

        mon.EmitLabel(self.l_cleanup)
        dec_stack_offset(len(self._preserve) * 2)
        for v in reversed(self._preserve):
            mon.POP(v.a)

    def __exit__(self, exc_type, exc_val, exc_tb):
        assert g_if_stack[-1] is self
        g_if_stack.pop()
        pop_global_scope(self)

        self._emit_cleanup()

        mon.EmitLabel(self.l_end)

    def jmp(self, target, *, negated: bool = False, signed: bool = False):
        return self._cond.then_jmp(target, negated=negated, signed=signed)

    def then_break(self, *args, **kwargs):
        return BreakIf(self._cond, *args, **kwargs)

    def then_continue(self, *args, **kwargs):
        return ContinueIf(self._cond, *args, **kwargs)


# noinspection PyPep8Naming
def If(cond: CmpExpr | bool, preserve: Iterable[Expr] = ()):
    assert isinstance(cond, CmpExpr)
    return IfCtx(cond, preserve)


# noinspection PyProtectedMember, PyPep8Naming
def Else(*, emit_jmp_cleanup_before_this: bool = True):
    blk = g_if_stack[-1]
    assert not blk._emitted_else
    blk._emitted_else = True

    if blk._emit_jmp_cleanup_before_else and emit_jmp_cleanup_before_this:
        mon.JMP(blk.l_cleanup)
    mon.EmitLabel(blk.l_elses[-1])


# noinspection PyProtectedMember, PyPep8Naming
def ElseIf(cond: CmpExpr | bool, *, emit_jmp_cleanup_before_this: bool = True):
    blk = g_if_stack[-1]
    assert not blk._emitted_else
    idx = len(blk.l_elses) + 1
    l_next_else = mon.DeclLabel(f'_E{idx}_' + blk.base_name)

    if blk._emit_jmp_cleanup_before_else and emit_jmp_cleanup_before_this:
        mon.JMP(blk.l_cleanup)
    mon.EmitLabel(blk.l_elses[-1])
    cond.then_jmp(l_next_else, negated=True)

    blk.l_elses.append(l_next_else)
