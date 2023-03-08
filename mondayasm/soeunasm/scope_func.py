from typing import Iterable, Callable, Any
import inspect

import mondayasm
from soeunasm import Expr, Statement, StmOp, scope_if, scope_for, scope_global, scope, enums, Scope
from mondayasm import builder as monb, RawExpr
import mondayasm as mon
from soeunasm.enums import placeholder_stack_offset, ExprOp
from soeunasm.free_expr import mov, expr
from soeunasm.miscs import adjust_sp
from soeunasm.scope_global import push_global_scope, pop_global_scope, dec_stack_offset, inc_stack_offset

g_func_scope_stack: list['FuncScopeCtx'] = []


class FuncScopeCtxInner:
    def __init__(self, blk: 'FuncScopeCtx'):
        self._blk = blk

    def Cleanup(self):
        self._blk._emit_cleanup()


# noinspection PyProtectedMember
class FuncScopeCtx:
    def __init__(self, name: str, preserve: Iterable[Expr], used_regs: Iterable[Expr]):
        assert all(e.is_pure_register for e in preserve)
        self._preserve = tuple(preserve)
        self._used_regs = tuple(used_regs)

        self.l_prepare = mon.DeclLabel('_begin_fn_' + name)
        self.l_cleanup = mon.DeclLabel('_cleanup_fn_' + name)
        self.l_end = mon.DeclLabel('_end_fn_' + name)
        self._emitted_cleanup = False

        self.inner_ctx = FuncScopeCtxInner(self)

    def __enter__(self):
        self._swap_out_ctx_stacks()

        mon.EmitLabel(self.l_prepare)
        for v in self._preserve:
            mon.PUSH(v.a)

        g_func_scope_stack.append(self)
        push_global_scope(self)

    def __exit__(self, exc_type, exc_val, exc_tb):
        assert g_func_scope_stack[-1] is self
        g_func_scope_stack.pop()
        pop_global_scope(self)

        if not self._emitted_cleanup:
            self._emit_cleanup()

        stack_offset = scope_global.cur_stack_offset()
        adjust_sp(stack_offset)
        dec_stack_offset(stack_offset)

        for v in reversed(self._preserve):
            mon.POP(v.a)
        mon.RET()
        mon.EmitLabel(self.l_end)

        assert scope_global.cur_stack_offset() == 0
        self._restore_ctx_stacks()

    def _emit_cleanup(self):
        assert not self._emitted_cleanup
        self._emitted_cleanup = True
        mon.EmitLabel(self.l_cleanup)

    def _emit_return(self, value, value_2):
        assert scope_global.cur_stack_offset() == 0 or \
               (len(scope_global.g_stack) == 1 and scope_global.g_stack[0] is self)
        if value is not None:
            mov(mon.H, value)
        if value_2 is not None:
            assert value is not None
            mov(mon.G, value)
        if len(self._preserve) == 0 and scope_global.cur_stack_offset() == 0:
            mon.RET()
        else:
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
def Return(value=None, value_2=None):
    blk = g_func_scope_stack[-1]
    blk._emit_return(value, value_2)


g_visited_fns: set[Callable] = set()


def emit_fn(fn):
    assert callable(fn) and hasattr(fn, '__name__')
    name = fn.__name__
    l_fn_entry = mon.DeclLabel(f'fn_{name}')
    if fn not in g_visited_fns:
        generate_fn_code(fn, name, l_fn_entry)
    return l_fn_entry


def call(fn, *args: Any, preserve_registers: bool = True):
    assert callable(fn) and hasattr(fn, '__name__')

    l_fn_entry = emit_fn(fn)
    preserve = []
    n_regs = 0

    arg_names = list(inspect.signature(fn).parameters.keys())
    for arg in reversed(arg_names):
        if arg not in REG_NAME_MAP:
            break
        n_regs += 1
        if preserve_registers and \
                arg in CALLER_SAVE and \
                arg in g_func_scope_stack[-1]._used_regs:
            preserve.append(REG_NAME_MAP[arg])

    if n_regs > 0:
        arg_names = arg_names[:-n_regs]
    var_args = len(arg_names) >= 1 and arg_names[-1] == 'VAR_ARGS'
    if var_args:
        assert len(args) >= len(arg_names) - 1
    else:
        assert len(args) == len(arg_names)

    with Scope(preserve=preserve, simple=True, base_name='call'):
        for arg in reversed(args):
            arg = Expr.to_expr(arg)
            assert arg.op == ExprOp.NONE
            Statement(StmOp.PUSH, arg.a)
            inc_stack_offset(2)
        mon.CALL(l_fn_entry)
        adjust_sp(len(args) * 2)
        dec_stack_offset(len(args) * 2)


REG_NAME_MAP = {
    'A': expr(mon.A),
    'B': expr(mon.B),
    'C': expr(mon.C),
    'D': expr(mon.D),
    'SP': expr(mon.SP),
    'PC': expr(mon.PC),
    'E': expr(mon.E),
    'F': expr(mon.F),
    'G': expr(mon.G),
    'H': expr(mon.H),
}

CALLEE_SAVE = ('A', 'B', 'C', 'D')
CALLER_SAVE = ('E', 'F')
NO_SAVE = ('G', 'H')  # use for return value


def generate_fn_code(fn, name, l_fn_entry):
    g_visited_fns.add(fn)

    blk = monb.ScopeBuilder(l_fn_entry.label_value.name)
    monb.Global.add_block(blk)
    monb.Global.enter_scope(blk)
    mon.EmitLabel(l_fn_entry)

    arg_names = list(inspect.signature(fn).parameters.keys())
    reg_args = []
    preserve = []
    for arg in reversed(arg_names):
        if arg not in REG_NAME_MAP:
            break
        reg_expr = REG_NAME_MAP[arg]
        reg_args.append(reg_expr)
        if arg in CALLEE_SAVE:
            preserve.append(reg_expr)
    reg_args.reverse()

    sp_offset = RawExpr.to_expr(placeholder_stack_offset)

    arg_names = arg_names
    stack_args = []
    for i in range(len(arg_names) - len(reg_args)):
        offset = (1 + len(preserve) + i) * 2
        stack_loc = mon.SP + offset + sp_offset
        stack_args.append(expr([stack_loc]))

    all_args = stack_args + reg_args
    with FuncScopeCtx(name, preserve=tuple(preserve), used_regs=tuple(reg_args)):
        fn(*all_args)

    monb.Global.exit_scope(blk)
