from dataclasses import dataclass, field
from enum import Enum, auto

import mondayasm as mon
import soeunasm as so


class ExprOp(Enum):
    NONE = auto()

    # binary ALU
    ADD = auto()
    SUB = auto()
    MUL = auto()
    IMUL = auto()
    DIV = auto()
    IDIV = auto()

    SHR = auto()
    ISHR = auto()
    SHL = auto()
    AND = auto()
    OR = auto()
    XOR = auto()

    # unary ALU
    NEG = auto()
    NOT = auto()
    BOOL = auto()
    INC = auto()
    DEC = auto()


EXPR_STM_OP_MAP = lambda: {
    ExprOp.ADD: so.StmOp.ADD,
    ExprOp.SUB: so.StmOp.SUB,
    ExprOp.MUL: so.StmOp.MUL,
    ExprOp.IMUL: so.StmOp.IMUL,
    ExprOp.DIV: so.StmOp.DIV,
    ExprOp.IDIV: so.StmOp.IDIV,
    ExprOp.SHR: so.StmOp.SHR,
    ExprOp.ISHR: so.StmOp.ISHR,
    ExprOp.SHL: so.StmOp.SHL,
    ExprOp.AND: so.StmOp.AND,
    ExprOp.OR: so.StmOp.OR,
    ExprOp.XOR: so.StmOp.XOR,
    ExprOp.NEG: so.StmOp.NEG,
    ExprOp.NOT: so.StmOp.NOT,
    ExprOp.BOOL: so.StmOp.BOOL,
    ExprOp.INC: so.StmOp.INC,
    ExprOp.DEC: so.StmOp.DEC,
}


def _ensure_expr_stm_map():
    global EXPR_STM_OP_MAP
    if not isinstance(EXPR_STM_OP_MAP, dict):
        EXPR_STM_OP_MAP = EXPR_STM_OP_MAP()


class PseudoExpr(Enum):
    NULL = auto()
    FLAGS = auto()
    STACK = auto()


@dataclass(frozen=True, slots=True)
class SoExpr:
    a: mon.Expr | mon.IndirectExpr | PseudoExpr = field(default=PseudoExpr.NULL)
    b: mon.Expr | mon.IndirectExpr | PseudoExpr = field(default=PseudoExpr.NULL)
    op: ExprOp = field(default=ExprOp.NONE)

    def __post_init__(self):
        assert isinstance(self.a, (mon.Expr, mon.IndirectExpr, PseudoExpr))
        assert isinstance(self.b, (mon.Expr, mon.IndirectExpr, PseudoExpr))
        assert isinstance(self.op, ExprOp)

    @classmethod
    def to_so_expr(cls, obj):
        if not isinstance(obj, SoExpr):
            if isinstance(obj, list) and len(obj) == 1:
                if isinstance(obj[0], SoExpr):
                    assert isinstance(obj[0].a, mon.Expr)
                    assert obj[0].op == ExprOp.NONE
                    obj = mon.IndirectExpr(obj[0].a)
                elif isinstance(obj[0], mon.Expr):
                    obj = mon.IndirectExpr(obj[0])
            if not isinstance(obj, mon.IndirectExpr):
                obj = mon.Expr.to_expr(obj)
            obj = SoExpr(obj)
        return obj

    def _binary_op(self, rhs, op: ExprOp) -> 'SoExpr':
        rhs = self.to_so_expr(rhs)
        assert self.op == ExprOp.NONE
        assert rhs.op == ExprOp.NONE

        tmp = None
        if isinstance(self.a, mon.Expr) and isinstance(rhs.a, mon.Expr):
            if op == ExprOp.ADD:
                tmp = self.a + rhs.a
            elif op == ExprOp.SUB:
                tmp = self.a - rhs.a
            elif op == ExprOp.MUL and rhs.a.is_pure_const:
                tmp = self.a * rhs.a.const_value

        if tmp is not None:
            try:
                tmp.assemble()
                return SoExpr(tmp)
            except AssertionError:
                ...

        return SoExpr(self.a, rhs.a, op)

    def _binary_op_r(self, lhs, op: ExprOp) -> 'SoExpr':
        lhs = self.to_so_expr(lhs)
        return lhs._binary_op(self, op)

    def _unary_op(self, op: ExprOp) -> 'SoExpr':
        return self._binary_op(PseudoExpr.NULL, op)

    # Operators of Expr

    def __add__(self, rhs):
        return self._binary_op(rhs, ExprOp.ADD)

    def __sub__(self, rhs):
        return self._binary_op(rhs, ExprOp.SUB)

    def __mul__(self, rhs):
        return self._binary_op(rhs, ExprOp.MUL)

    def imul(self, rhs):
        return self._binary_op(rhs, ExprOp.IMUL)

    def __truediv__(self, rhs):
        return self._binary_op(rhs, ExprOp.DIV)

    def __floordiv__(self, rhs):
        return self._binary_op(rhs, ExprOp.DIV)

    def idiv(self, rhs):
        return self._binary_op(rhs, ExprOp.IDIV)

    def __rshift__(self, rhs):
        return self._binary_op(rhs, ExprOp.SHR)

    def ishr(self, rhs):
        return self._binary_op(rhs, ExprOp.ISHR)

    def __lshift__(self, rhs):
        return self._binary_op(rhs, ExprOp.SHL)

    def __and__(self, rhs):
        return self._binary_op(rhs, ExprOp.AND)

    def __or__(self, rhs):
        return self._binary_op(rhs, ExprOp.OR)

    def __xor__(self, rhs):
        return self._binary_op(rhs, ExprOp.XOR)

    def __neg__(self):
        return self._unary_op(ExprOp.NEG)

    def __invert__(self):
        return self._unary_op(ExprOp.NOT)

    def bool(self):
        return self._unary_op(ExprOp.BOOL)

    def inc(self):
        return self._unary_op(ExprOp.INC)

    def dec(self):
        return self._unary_op(ExprOp.DEC)

    def __radd__(self, lhs):
        return self._binary_op_r(lhs, ExprOp.ADD)

    def __rsub__(self, lhs):
        return self._binary_op_r(lhs, ExprOp.SUB)

    def __rmul__(self, lhs):
        return self._binary_op_r(lhs, ExprOp.MUL)

    def __rtruediv__(self, lhs):
        return self._binary_op_r(lhs, ExprOp.DIV)

    def __rfloordiv__(self, lhs):
        return self._binary_op_r(lhs, ExprOp.DIV)

    def __rrshift__(self, lhs):
        return self._binary_op_r(lhs, ExprOp.SHR)

    def __rlshift__(self, lhs):
        return self._binary_op_r(lhs, ExprOp.SHL)

    def __rand__(self, lhs):
        return self._binary_op_r(lhs, ExprOp.AND)

    def __ror__(self, lhs):
        return self._binary_op_r(lhs, ExprOp.OR)

    def __rxor__(self, lhs):
        return self._binary_op_r(lhs, ExprOp.XOR)

    # Statement generators
    def __matmul__(self, rhs):
        _ensure_expr_stm_map()

        rhs = self.to_so_expr(rhs)
        assert self.op == ExprOp.NONE
        if rhs.op == ExprOp.NONE:
            return so.Statement(so.StmOp.MOV, self.a, rhs.a)
        stm_op = EXPR_STM_OP_MAP[rhs.op]
        if self.a == rhs.a:  # same dest variant
            return so.Statement(stm_op, self.a, rhs.b)
        else:  # different dest variant
            return so.Statement(stm_op, self.a, rhs.a, rhs.b)

    def __rmatmul__(self, lhs):
        lhs = self.to_so_expr(lhs)
        return lhs @ self

    def __imatmul__(self, rhs):
        self @ rhs
        return self

