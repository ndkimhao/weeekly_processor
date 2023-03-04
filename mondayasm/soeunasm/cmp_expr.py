from dataclasses import dataclass

from mondayasm import RawExpr, RawIndirect
from soeunasm.enums import CmpOp, StmOp

CMP_OP_INVERSE = {
    CmpOp.EQ: CmpOp.NE,
    CmpOp.NE: CmpOp.EQ,
    CmpOp.LT: CmpOp.GE,
    CmpOp.LE: CmpOp.GT,
    CmpOp.GT: CmpOp.LE,
    CmpOp.GE: CmpOp.LT,
}

CMP_STM_OP = {
    CmpOp.EQ: StmOp.JEQ,
    CmpOp.NE: StmOp.JNE,
    CmpOp.LT: StmOp.JLT,
    CmpOp.LE: StmOp.JLE,
    CmpOp.GT: StmOp.JGT,
    CmpOp.GE: StmOp.JGE,
}


@dataclass(frozen=True, slots=True)
class CmpExpr:
    op: CmpOp
    a: RawExpr | RawIndirect
    b: RawExpr | RawIndirect

    def __post_init__(self):
        assert isinstance(self.op, CmpOp)
        assert isinstance(self.a, (RawExpr, RawIndirect))
        assert isinstance(self.b, (RawExpr, RawIndirect))
