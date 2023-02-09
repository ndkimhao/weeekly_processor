from dataclasses import dataclass, field
from typing import Union, Callable
import re

from mondayasm.expr import Expr, IndirectExpr, AsmArg, ConstLabel
from mondayasm.data import CMDS_MAP
from mondayasm.types import ArgEncode, CmdEncode, DataEncode


@dataclass(frozen=True)
class Instruction:
    cmd: CmdEncode
    args: tuple[AsmArg, ...]
    is_indirect: tuple[bool, ...]

    @property
    def bincode(self) -> str:
        s = self.cmd.bincode + self.cmd.tailbincode
        for arg in self.args:
            s += ' ' + arg.bincode
        return s

    def __str__(self):
        s = f'{self.cmd.name}'
        for i, arg in enumerate(self.args):
            s += ', ' if i > 0 else ' '
            if self.is_indirect[i]:
                s += '[' + str(arg) + ']'
            else:
                s += str(arg)
        return s


@dataclass(frozen=True)
class Directive:
    name: str
    args: tuple = field(default=())


@dataclass
class ScopeBuilder:
    name: str
    instructions: list[Union[Instruction, Directive]] = field(default_factory=list)

    def add(self, inst: Union[Instruction, Directive]):
        assert isinstance(inst, (Instruction, Directive))
        self.instructions.append(inst)


@dataclass
class StaticData:
    name: str
    readonly: bool
    size: int
    data: DataEncode


class Global:
    blocks: dict[str, ScopeBuilder] = {
        '_start': ScopeBuilder('_start')
    }
    scope_stack: list[ScopeBuilder] = [blocks['_start']]
    blocks_unique_counter: dict[str, int] = {}

    static_data: dict[str, StaticData] = {}

    visited_fns: set[Callable] = set()

    @classmethod
    def enter_scope(cls, blk: ScopeBuilder):
        assert isinstance(blk, ScopeBuilder)
        cls.scope_stack.append(blk)

    @classmethod
    def exit_scope(cls, blk: ScopeBuilder):
        assert blk is cls.scope_stack[-1]
        cls.scope_stack.pop()

    @classmethod
    def current_scope(cls) -> ScopeBuilder:
        return cls.scope_stack[-1]

    @classmethod
    def add_block(cls, blk: ScopeBuilder):
        assert isinstance(blk, ScopeBuilder)
        assert blk.name not in cls.blocks
        cls.blocks[blk.name] = blk

    @classmethod
    def gen_label_name(cls, name: str, prefix: str = '_L_') -> str:
        blk_id = cls.blocks_unique_counter.get(name, 0) + 1
        cls.blocks_unique_counter[name] = blk_id
        blk_name = f'{prefix}{name}_{blk_id}'
        return blk_name

    @classmethod
    def add_static_data(cls, d: StaticData):
        assert d.name not in cls.static_data
        cls.static_data[d.name] = d


def unwrap_indirect(a):
    indirect = False
    if isinstance(a, (IndirectExpr, list)):
        indirect = True
        if isinstance(a, list):
            assert len(a) == 1 and isinstance(a[0], Expr)
            a = a[0]
        else:
            a = a.expr
    return a, indirect


def emit_command(name: str, a=None, b=None, c=None):
    a, indirect_a = unwrap_indirect(a)
    b, indirect_b = unwrap_indirect(b)
    id_specs = (2 if indirect_a else 0) | (1 if indirect_b else 0)

    args: list[AsmArg] = []
    if a is not None:
        a = Expr.to_expr(a)
        args.append(a.assemble())
    if b is not None:
        b = Expr.to_expr(b)
        args.append(b.assemble())
    if c is not None:
        c = Expr.to_expr(c)
        args.append(c.assemble())

    cmd_ord = (name.upper(), len(args))
    cur_blk = Global.current_scope()
    inst = Instruction(
        cmd=CmdEncode(name, f'{CMDS_MAP[cmd_ord]:06b}', f'{id_specs:02b}'),
        args=tuple(args),
        is_indirect=tuple([id_specs & 2 != 0, id_specs & 1 != 0, False][:len(args)])
    )

    cur_blk.add(inst)


def emit_command_call(name, target, emit_call: bool):
    blk = None
    visit_fn = callable(target) and target not in Global.visited_fns
    lbl_start = f'fn_{target.__name__}'
    lbl_end = f'end_fn_{target.__name__}'
    if visit_fn:
        blk = ScopeBuilder(lbl_start)
        Global.add_block(blk)
        Global.enter_scope(blk)
        _Label(lbl_start, anon=False)
        target()

    if emit_call:
        emit_command('call', Expr.to_expr(ConstLabel(lbl_start)))

    if visit_fn:
        _Label(lbl_end, anon=False)
        Global.exit_scope(blk)


def _Label(name: str = '', anon: bool = True, emit_label: bool = True) -> Expr:
    if name == '':
        name = Global.gen_label_name(Global.current_scope().name)
    elif anon:
        name = Global.gen_label_name(name)
    if emit_label:
        Global.current_scope().add(Directive('.label', (name,)))
    return Expr.to_expr(ConstLabel(name))


def _ConstData(name: str, obj) -> Expr:
    if isinstance(obj, str):
        value = f'"{re.escape(obj)}"'
        data = bytes(obj, 'utf-8')
    elif isinstance(obj, bytes):
        value = f'RAW:{obj.hex()}'
        data = obj
    else:
        assert False, f'unknown data type: {type(obj)}'
    Global.add_static_data(StaticData(
        name=name,
        readonly=True,
        data=DataEncode(value, data),
        size=len(data),
    ))
    return Expr.to_expr(ConstLabel(f'_CONST_{name}'))


def _StaticVar(name: str, size) -> Expr:
    Global.add_static_data(StaticData(
        name=name,
        readonly=False,
        data=DataEncode('', bytes()),
        size=size,
    ))
    return Expr.to_expr(ConstLabel(f'_VAR_{name}'))


class BlockContextManager:
    def __init__(self, name):
        self.name = name
        self.label_start = None
        self.label_end = None
        self.name_start = None
        self.name_end = None

    def __enter__(self) -> 'BlockContextManager':
        name = Global.current_scope().name if self.name == '' else self.name
        blk_name = Global.gen_label_name(name, '')
        self.name_start = 'B_' + blk_name
        self.name_end = 'E_' + blk_name
        self.label_start = _Label(self.name_start, anon=False)
        self.label_end = Expr.to_expr(ConstLabel(self.name_end))
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        _Label(self.name_end, anon=False)

    @property
    def start(self) -> Expr:
        return self.label_start

    @property
    def end(self) -> Expr:
        return self.label_end


def _Block(name: str = '') -> BlockContextManager:
    return BlockContextManager(name)
