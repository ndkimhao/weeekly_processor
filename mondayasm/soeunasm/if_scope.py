from typing import Iterable

from soeunasm.expr import Expr
from soeunasm.cmp_expr import CmpExpr
from mondayasm import builder as monb
import mondayasm as mon

_g_if_stack: list['IfCtx'] = []


class IfCtxInner:
    def __init__(self, blk: 'IfCtx'):
        self._ctx = blk

    def Break(self):
        mon.JMP(self._ctx.l_early_break)


# noinspection PyProtectedMember
class IfCtx:
    def __init__(self, cond: CmpExpr, preserve: Iterable[Expr]):
        _g_if_stack.append(self)

        assert all(e.is_pure_register for e in preserve)
        self._cond = cond
        self._preserve = tuple(preserve)

        name = monb.Global.gen_label_name('if', prefix='')
        self.base_name = name
        self.l_prepare = mon.DeclLabel('_A_' + name)
        self.l_elses = [mon.DeclLabel('_E_' + name)]
        self.l_cleanup = mon.DeclLabel('_C_' + name)
        self.l_end = mon.DeclLabel('_Z_' + name)
        self.l_early_break = self.l_cleanup if len(self._preserve) > 0 else self.l_end
        self._emitted_else = False

    def __enter__(self) -> IfCtxInner:
        mon.EmitLabel(self.l_prepare)
        for v in self._preserve:
            mon.PUSH(v.a)

        self._cond.then_jmp(self.l_elses[-1], negated=True)
        return IfCtxInner(self)

    def __exit__(self, exc_type, exc_val, exc_tb):
        assert _g_if_stack[-1] is self
        _g_if_stack.pop()

        if not self._emitted_else:
            mon.EmitLabel(self.l_elses[-1])

        if len(self._preserve) > 0:
            mon.EmitLabel(self.l_cleanup)
            for v in reversed(self._preserve):
                mon.POP(v.a)
        mon.EmitLabel(self.l_end)

    def jmp(self, target, *, negated: bool = False, signed: bool = False):
        return self._cond.then_jmp(target, negated=negated, signed=signed)


# noinspection PyPep8Naming
def If(cond: CmpExpr | bool, preserve: Iterable[Expr] = ()):
    assert isinstance(cond, CmpExpr)
    return IfCtx(cond, preserve)


# noinspection PyProtectedMember, PyPep8Naming
def Else():
    blk = _g_if_stack[-1]
    assert not blk._emitted_else
    blk._emitted_else = True

    mon.JMP(blk.l_early_break)
    mon.EmitLabel(blk.l_elses[-1])


# noinspection PyProtectedMember, PyPep8Naming
def ElseIf(cond: CmpExpr):
    blk = _g_if_stack[-1]
    assert not blk._emitted_else
    idx = len(blk.l_elses) + 1
    l_next_else = mon.DeclLabel(f'_E{idx}_' + blk.base_name)

    mon.JMP(blk.l_early_break)
    mon.EmitLabel(blk.l_elses[-1])
    cond.then_jmp(l_next_else, negated=True)

    blk.l_elses.append(l_next_else)
