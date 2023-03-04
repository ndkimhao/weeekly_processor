from dataclasses import dataclass, field
from enum import Enum, auto

import soeunasm as so
from mondayasm import RawExpr, RawIndirect
from soeunasm.enums import ExprOp, StmOp

EXPR_STM_OP_MAP = {
    ExprOp.ADD: StmOp.ADD,
    ExprOp.SUB: StmOp.SUB,
    ExprOp.MUL: StmOp.MUL,
    ExprOp.IMUL: StmOp.IMUL,
    ExprOp.DIV: StmOp.DIV,
    ExprOp.IDIV: StmOp.IDIV,
    ExprOp.SHR: StmOp.SHR,
    ExprOp.ISHR: StmOp.ISHR,
    ExprOp.SHL: StmOp.SHL,
    ExprOp.AND: StmOp.AND,
    ExprOp.OR: StmOp.OR,
    ExprOp.XOR: StmOp.XOR,
    ExprOp.NEG: StmOp.NEG,
    ExprOp.NOT: StmOp.NOT,
    ExprOp.BOOL: StmOp.BOOL,
    ExprOp.INC: StmOp.INC,
    ExprOp.DEC: StmOp.DEC,
}

CONST_ADD_VAL_OP_MAP = {1: StmOp.INC, -1: StmOp.DEC}


class PseudoExpr(Enum):
    NULL = auto()
    FLAGS = auto()
    STACK = auto()


@dataclass(frozen=True, slots=True)
class Expr:
    a: RawExpr | RawIndirect | PseudoExpr = field(default=PseudoExpr.NULL)
    b: RawExpr | RawIndirect | PseudoExpr = field(default=PseudoExpr.NULL)
    op: ExprOp = field(default=ExprOp.NONE)

    def __post_init__(self):
        assert isinstance(self.a, (RawExpr, RawIndirect, PseudoExpr))
        assert isinstance(self.b, (RawExpr, RawIndirect, PseudoExpr))
        assert isinstance(self.op, ExprOp)

    @classmethod
    def to_so_expr(cls, obj):
        if not isinstance(obj, Expr):
            if isinstance(obj, list) and len(obj) == 1:
                if isinstance(obj[0], Expr):
                    assert isinstance(obj[0].a, RawExpr)
                    assert obj[0].op == ExprOp.NONE
                    obj = RawIndirect(obj[0].a)
                elif isinstance(obj[0], RawExpr):
                    obj = RawIndirect(obj[0])
            if not isinstance(obj, RawIndirect):
                obj = RawExpr.to_expr(obj)
            obj = Expr(obj)
        return obj

    def _binary_op(self, rhs, op: ExprOp) -> 'Expr':
        rhs = self.to_so_expr(rhs)
        assert self.op == ExprOp.NONE
        assert rhs.op == ExprOp.NONE

        tmp = None
        if isinstance(self.a, RawExpr) and isinstance(rhs.a, RawExpr):
            if op == ExprOp.ADD:
                tmp = self.a + rhs.a
            elif op == ExprOp.SUB:
                tmp = self.a - rhs.a
            elif op == ExprOp.MUL and rhs.a.is_pure_const:
                tmp = self.a * rhs.a.const_value

        if tmp is not None:
            try:
                tmp.assemble()
                return Expr(tmp)
            except AssertionError:
                ...

        return Expr(self.a, rhs.a, op)

    def _binary_op_r(self, lhs, op: ExprOp) -> 'Expr':
        lhs = self.to_so_expr(lhs)
        return lhs._binary_op(self, op)

    def _unary_op(self, op: ExprOp) -> 'Expr':
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
        rhs = self.to_so_expr(rhs)
        assert self.op == ExprOp.NONE

        if rhs.op == ExprOp.ADD or rhs.op == ExprOp.SUB and \
                isinstance(rhs.a, RawIndirect) and \
                rhs.b.is_pure_const and abs(rhs.b.const_value) == 1:
            add_val = rhs.b.const_value if rhs.op == rhs.op.ADD else -rhs.b.const_value
            if self.a == rhs.a:  # same dest variant
                return so.Statement(CONST_ADD_VAL_OP_MAP[add_val], self.a)
            else:  # different dest variant
                return so.Statement(CONST_ADD_VAL_OP_MAP[add_val], self.a, rhs.a)

        if rhs.op == ExprOp.NONE and abs(rhs.a.const_value) == 1:
            add_val = rhs.a.const_value
            if self.a == rhs.a.without_const_value:  # same dest variant
                return so.Statement(CONST_ADD_VAL_OP_MAP[add_val], self.a)
            else:  # different dest variant
                return so.Statement(CONST_ADD_VAL_OP_MAP[add_val], self.a, rhs.a.without_const_value)

        if rhs.op == ExprOp.NONE:
            return so.Statement(so.StmOp.MOV, self.a, rhs.a)

        stm_op = EXPR_STM_OP_MAP[rhs.op]
        if self.a == rhs.a:  # same dest variant
            return so.Statement(stm_op, self.a, rhs.b)
        else:  # different dest variant
            return so.Statement(stm_op, self.a, rhs.a, rhs.b)

    def __contains__(self, lhs):
        return lhs @ self

    def __rmatmul__(self, lhs):
        lhs = self.to_so_expr(lhs)
        return lhs @ self

    def __imatmul__(self, rhs):
        self @ rhs
        return self

    def __iadd__(self, rhs):
        self @ (self + rhs)
        return self

    def __isub__(self, rhs):
        self @ (self - rhs)
        return self

    def __imul__(self, rhs):
        self @ (self * rhs)
        return self

    def __itruediv__(self, rhs):
        self @ (self / rhs)
        return self

    def __ifloordiv__(self, rhs):
        self @ (self // rhs)
        return self

    def __irshift__(self, rhs):
        self @ (self >> rhs)
        return self

    def __ilshift__(self, rhs):
        self @ (self << rhs)
        return self

    def __iand__(self, rhs):
        self @ (self & rhs)
        return self

    def __ior__(self, rhs):
        self @ (self | rhs)
        return self

    def __ixor__(self, rhs):
        self @ (self ^ rhs)
        return self
