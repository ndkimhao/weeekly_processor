from dataclasses import dataclass, field
from types import NoneType
from typing import Optional

import mondayasm.types
from mondayasm import RawExpr, RawIndirect
from soeunasm import scope_global, enums
from soeunasm.enums import StmOp
import mondayasm as mon

OP_MAP = {
    StmOp.GETF: mon.GETF,
    StmOp.CMP: mon.CMP,
    StmOp.MMAP: mon.MMAP,
    StmOp.JMP: mon.JMP,
    StmOp.CALL: mon.CALL,
    StmOp.MOV: mon.MOV,
    StmOp.BMOV: mon.BMOV,
    StmOp.SETF: mon.SETF,
    StmOp.ICMP: mon.ICMP,
    StmOp.UMAP: mon.UMAP,
    StmOp.HALT: mon.HALT,
    StmOp.RET: mon.RET,
    StmOp.PUSH: mon.PUSH,
    StmOp.POP: mon.POP,
    StmOp.JEQ: mon.JEQ,
    StmOp.JNE: mon.JNE,
    StmOp.JLT: mon.JLT,
    StmOp.JLE: mon.JLE,
    StmOp.JGT: mon.JGT,
    StmOp.JGE: mon.JGE,

    StmOp.ADD: mon.ADD,
    StmOp.SUB: mon.SUB,
    StmOp.MUL: mon.MUL,
    StmOp.IMUL: mon.IMUL,
    StmOp.DIV: mon.DIV,
    StmOp.IDIV: mon.IDIV,
    StmOp.GETB: mon.GETB,
    StmOp.SETB: mon.SETB,
    StmOp.SHR: mon.SHR,
    StmOp.ISHR: mon.ISHR,
    StmOp.SHL: mon.SHL,
    StmOp.AND: mon.AND,
    StmOp.OR: mon.OR,
    StmOp.XOR: mon.XOR,
    StmOp.NEG: mon.NEG,
    StmOp.NOT: mon.NOT,
    StmOp.BOOL: mon.BOOL,
    StmOp.INC: mon.INC,
    StmOp.DEC: mon.DEC,
}


@dataclass(slots=True)
class MutableFlag:
    v: bool = field(default=False)

    def __bool__(self):
        return self.v

    def set(self, new_value: bool):
        self.v = new_value


@dataclass(frozen=True, slots=True)
class Statement:
    op: StmOp
    a: Optional[RawExpr | RawIndirect] = field(default=None)
    b: Optional[RawExpr | RawIndirect] = field(default=None)
    c: Optional[RawExpr | RawIndirect] = field(default=None)

    emitted: MutableFlag = field(default_factory=MutableFlag)

    def __post_init__(self):
        try:
            assert isinstance(self.op, StmOp)
            assert isinstance(self.a, (RawExpr, RawIndirect, NoneType))
            assert isinstance(self.b, (RawExpr, RawIndirect, NoneType))
            assert isinstance(self.c, (RawExpr, RawIndirect, NoneType))
        except AssertionError:
            self.emitted.set(True)
            raise

    def __del__(self):
        self.emit()

    def emit(self, *, forced: bool = False):
        if self.emitted and not forced:
            return

        self.emitted.set(True)

        sp_offset = scope_global.cur_stack_offset()
        sp_offset_ph = enums.placeholder_stack_offset

        cmd_args = []
        if self.a is not None:
            cmd_args.append(self.a.replace_once(sp_offset_ph, sp_offset))
        if self.b is not None:
            assert self.a is not None
            cmd_args.append(self.b.replace_once(sp_offset_ph, sp_offset))
        if self.c is not None:
            assert self.b is not None
            cmd_args.append(self.c.replace_once(sp_offset_ph, sp_offset))

        OP_MAP[self.op](*cmd_args)
        return self

    def do_not_emit(self):
        self.emitted.set(True)
        return self
