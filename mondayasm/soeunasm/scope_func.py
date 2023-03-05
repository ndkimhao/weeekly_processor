from typing import Iterable

from soeunasm import Expr, Statement, StmOp, scope_if, scope_for, scope_global, scope
from mondayasm import builder as monb
import mondayasm as mon
from soeunasm.free_expr import mov
from soeunasm.miscs import _adjust_sp
from soeunasm.scope_global import push_global_scope, pop_global_scope

g_func_scope_stack: list['FuncScopeCtx'] = []


# noinspection PyProtectedMember
class FuncScopeCtx:
    def __init__(self, used_regs: Iterable[Expr]):
        assert all(e.is_pure_register for e in used_regs)
        self._used_regs = tuple(used_regs)

        name = monb.Global.gen_label_name('function', prefix='')
        self.l_prepare = mon.DeclLabel('_A_' + name)
        self.l_cleanup = mon.DeclLabel('_C_' + name)
        self.l_end = mon.DeclLabel('_Z_' + name)
        self._emitted_cleanup = False

    def __enter__(self):
        self._swap_out_ctx_stacks()

        mon.EmitLabel(self.l_prepare)
        for v in self._used_regs:
            mon.PUSH(v.a)

        g_func_scope_stack.append(self)
        push_global_scope(self)

    def __exit__(self, exc_type, exc_val, exc_tb):
        assert g_func_scope_stack[-1] is self
        g_func_scope_stack.pop()
        pop_global_scope(self)

        if not self._emitted_cleanup:
            self._emit_cleanup()
        _adjust_sp(scope_global.cur_stack_offset() * 2)
        for v in reversed(self._used_regs):
            mon.POP(v.a)
        mon.EmitLabel(self.l_end)

        self._restore_ctx_stacks()

    def _emit_cleanup(self):
        assert not self._emitted_cleanup
        self._emitted_cleanup = True
        mon.EmitLabel(self.l_cleanup)

    def _emit_return(self, value):
        if value is not None:
            mov(mon.H, value)
        mon.JMP(self.l_cleanup)

    def _swap_out_ctx_stacks(self):
        self._bak_g_scope_stack = scope.g_scope_stack
        self._bak_g_if_stack = scope_if.g_if_stack
        self._bak_g_for_stack = scope_for.g_for_stack
        self._bak_g_stack = scope_global.g_stack
        self._bak_g_sp_offset = scope_global.g_sp_offset
        scope.g_scope_stack = []
        scope_if.g_if_stack = []
        scope_for.g_for_stack = []
        scope_global.g_stack = []
        scope_global.g_sp_offset = 0

    def _restore_ctx_stacks(self):
        scope.g_scope_stack = self._bak_g_scope_stack
        scope_if.g_if_stack = self._bak_g_if_stack
        scope_for.g_for_stack = self._bak_g_for_stack
        scope_global.g_stack = self._bak_g_stack
        scope_global.g_sp_offset = self._bak_g_sp_offset


# noinspection PyProtectedMember
def Return(value=None):
    blk = g_func_scope_stack[-1]
    blk._emit_return(value)
