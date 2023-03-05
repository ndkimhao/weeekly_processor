from dataclasses import dataclass
from typing import ClassVar, Any

from mondayasm import RawExpr, RawIndirect
from soeunasm import Statement, Block
from soeunasm.enums import CmpOp, StmOp, ExprOp
import soeunasm as so

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
    TInner: ClassVar = RawExpr | RawIndirect

    op: CmpOp
    a: TInner
    b: TInner

    def __post_init__(self):
        assert isinstance(self.op, CmpOp)
        assert isinstance(self.a, (RawExpr, RawIndirect))
        assert isinstance(self.b, (RawExpr, RawIndirect))

    def then_jmp(self, target: Any, *, negated: bool = False, signed: bool = False) -> Statement | Block:
        if isinstance(target, so.expr.Expr):
            assert target.op == ExprOp.NONE
            target = target.a

        if not isinstance(target, (RawExpr, RawIndirect)):
            target = RawIndirect.to_expr_maybe_indirect(target)

        op = self.op
        if negated:
            op = CMP_OP_INVERSE[op]
        if signed or isinstance(target, RawIndirect):
            cmp_op = StmOp.ICMP if signed else StmOp.CMP
            return Block.create(
                Statement(cmp_op, self.a, self.b),
                Statement(CMP_STM_OP[op], target),
            )
        else:
            return Statement(CMP_STM_OP[op], self.a, self.b, target)
