from dataclasses import dataclass, field
from enum import Enum, auto
from types import NoneType
from typing import Optional

from soeunasm.enums import StmOp
from soeunasm.so_expr import SoExpr
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
    a: Optional[mon.Expr | mon.IndirectExpr] = field(default=None)
    b: Optional[mon.Expr | mon.IndirectExpr] = field(default=None)
    c: Optional[mon.Expr | mon.IndirectExpr] = field(default=None)

    emitted: MutableFlag = field(default_factory=MutableFlag)

    def __post_init__(self):
        assert isinstance(self.op, StmOp)
        assert isinstance(self.a, (mon.Expr | mon.IndirectExpr, NoneType))
        assert isinstance(self.b, (mon.Expr | mon.IndirectExpr, NoneType))
        assert isinstance(self.c, (mon.Expr | mon.IndirectExpr, NoneType))

    def __del__(self):
        self.emit()

    def emit(self, forced: bool = False):
        if self.emitted and not forced:
            return

        self.emitted.set(True)

        cmd_args = []
        if self.a is not None:
            cmd_args.append(self.a)
        if self.b is not None:
            assert self.a is not None
            cmd_args.append(self.b)
        if self.c is not None:
            assert self.b is not None
            cmd_args.append(self.c)

        OP_MAP[self.op](*cmd_args)

    def do_not_emit(self):
        self.emitted.set(True)
