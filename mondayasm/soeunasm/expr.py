from dataclasses import dataclass, field
from enum import Enum, auto
from typing import ClassVar, Any

import soeunasm as so
from mondayasm import RawExpr, RawIndirect
from soeunasm.cmp_expr import CmpExpr
from soeunasm.enums import ExprOp, StmOp, CmpOp

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
    TInner: ClassVar = RawExpr | RawIndirect | PseudoExpr

    op: ExprOp = field(default=ExprOp.NONE)
    a: TInner = field(default=PseudoExpr.NULL)
    b: TInner = field(default=PseudoExpr.NULL)

    def __post_init__(self):
        assert isinstance(self.op, ExprOp)
        assert isinstance(self.a, (RawExpr, RawIndirect, PseudoExpr))
        assert isinstance(self.b, (RawExpr, RawIndirect, PseudoExpr))

    @classmethod
    def to_expr(cls, obj) -> 'Expr':
        if not isinstance(obj, Expr):
            if isinstance(obj, list) and len(obj) == 1:
                if isinstance(obj[0], Expr):
                    assert isinstance(obj[0].a, RawExpr)
                    assert obj[0].op == ExprOp.NONE
                    obj = RawIndirect(obj[0].a)
                elif isinstance(obj[0], RawExpr):
                    obj = RawIndirect(obj[0])
            if not isinstance(obj, (RawExpr, RawIndirect, PseudoExpr)):
                obj = RawExpr.to_expr(obj)
            obj = Expr(ExprOp.NONE, obj)
        return obj

    @classmethod
    def _combine(cls, op: ExprOp, lhs: Any = PseudoExpr.NULL, rhs: Any = PseudoExpr.NULL) -> 'Expr':
        lhs = cls.to_expr(lhs)
        rhs = cls.to_expr(rhs)
        assert lhs.op == ExprOp.NONE
        assert rhs.op == ExprOp.NONE

        tmp = None
        if isinstance(lhs.a, RawExpr) and isinstance(rhs.a, RawExpr):
            if op == ExprOp.ADD:
                tmp = lhs.a + rhs.a
            elif op == ExprOp.SUB:
                tmp = lhs.a - rhs.a
            elif op == ExprOp.MUL and rhs.a.is_pure_const:
                tmp = lhs.a * rhs.a.const_value

        if tmp is not None:
            try:
                tmp.assemble()
                return Expr(ExprOp.NONE, tmp)
            except AssertionError:
                ...

        return Expr(op, lhs.a, rhs.a)

    @classmethod
    def _compare(cls, op: CmpOp, lhs: Any, rhs: Any):
        lhs = cls.to_expr(lhs)
        rhs = cls.to_expr(rhs)
        assert lhs.op == ExprOp.NONE
        assert rhs.op == ExprOp.NONE

        return CmpExpr(op, lhs.a, rhs.a)

    @classmethod
    def _assign(cls, lhs: Any, rhs: Any):
        lhs = cls.to_expr(lhs)
        rhs = cls.to_expr(rhs)

        if lhs.op == ExprOp.BYTE or rhs.op == ExprOp.BYTE:
            assert lhs.op in (ExprOp.BYTE, ExprOp.NONE)
            assert rhs.op in (ExprOp.BYTE, ExprOp.NONE)
            return so.Statement(so.StmOp.BMOV, lhs.a, rhs.a)

        assert lhs.op == ExprOp.NONE

        if (rhs.op == ExprOp.ADD or rhs.op == ExprOp.SUB) and \
                isinstance(rhs.a, (RawExpr, RawIndirect)) and \
                isinstance(rhs.b, RawExpr) and \
                rhs.b.is_pure_const and \
                abs(rhs.b.const_value) == 1:
            add_val = rhs.b.const_value if rhs.op == rhs.op.ADD else -rhs.b.const_value
            if lhs.a == rhs.a:  # same dest variant
                return so.Statement(CONST_ADD_VAL_OP_MAP[add_val], lhs.a)
            else:  # different dest variant
                return so.Statement(CONST_ADD_VAL_OP_MAP[add_val], lhs.a, rhs.a)

        if rhs.op == ExprOp.NONE and isinstance(rhs.a, RawExpr) and abs(rhs.a.const_value) == 1:
            add_val = rhs.a.const_value
            if lhs.a == rhs.a.without_const_value:  # same dest variant
                return so.Statement(CONST_ADD_VAL_OP_MAP[add_val], lhs.a)
            else:  # different dest variant
                return so.Statement(CONST_ADD_VAL_OP_MAP[add_val], lhs.a, rhs.a.without_const_value)

        if rhs.op == ExprOp.NONE:
            return so.Statement(so.StmOp.MOV, lhs.a, rhs.a)

        stm_op = EXPR_STM_OP_MAP[rhs.op]
        if lhs.a == rhs.a:  # same dest variant
            if rhs.b != PseudoExpr.NULL:
                return so.Statement(stm_op, lhs.a, rhs.b)
            else:
                return so.Statement(stm_op, lhs.a)
        else:  # different dest variant
            return so.Statement(stm_op, lhs.a, rhs.a, rhs.b)

    # Operators of Expr

    def __add__(self, rhs):
        return self._combine(ExprOp.ADD, self, rhs)

    def __sub__(self, rhs):
        return self._combine(ExprOp.SUB, self, rhs)

    def __mul__(self, rhs):
        return self._combine(ExprOp.MUL, self, rhs)

    def imul(self, rhs):
        return self._combine(ExprOp.IMUL, self, rhs)

    def __truediv__(self, rhs):
        return self._combine(ExprOp.DIV, self, rhs)

    def __floordiv__(self, rhs):
        return self._combine(ExprOp.DIV, self, rhs)

    def idiv(self, rhs):
        return self._combine(ExprOp.IDIV, self, rhs)

    def __rshift__(self, rhs):
        return self._combine(ExprOp.SHR, self, rhs)

    def ishr(self, rhs):
        return self._combine(ExprOp.ISHR, self, rhs)

    def __lshift__(self, rhs):
        return self._combine(ExprOp.SHL, self, rhs)

    def __and__(self, rhs):
        return self._combine(ExprOp.AND, self, rhs)

    def __or__(self, rhs):
        return self._combine(ExprOp.OR, self, rhs)

    def __xor__(self, rhs):
        return self._combine(ExprOp.XOR, self, rhs)

    def __neg__(self):
        return self._combine(ExprOp.NEG, self)

    def __invert__(self):
        return self._combine(ExprOp.NOT, self)

    def bool(self):
        return self._combine(ExprOp.BOOL, self)

    def inc(self):
        return self._combine(ExprOp.INC, self)

    def dec(self):
        return self._combine(ExprOp.DEC, self)

    def byte(self):
        return self._combine(ExprOp.BYTE, self)

    def __radd__(self, lhs):
        return self._combine(ExprOp.ADD, lhs, self)

    def __rsub__(self, lhs):
        return self._combine(ExprOp.SUB, lhs, self)

    def __rmul__(self, lhs):
        return self._combine(ExprOp.MUL, lhs, self)

    def __rtruediv__(self, lhs):
        return self._combine(ExprOp.DIV, lhs, self)

    def __rfloordiv__(self, lhs):
        return self._combine(ExprOp.DIV, lhs, self)

    def __rrshift__(self, lhs):
        return self._combine(ExprOp.SHR, lhs, self)

    def __rlshift__(self, lhs):
        return self._combine(ExprOp.SHL, lhs, self)

    def __rand__(self, lhs):
        return self._combine(ExprOp.AND, lhs, self)

    def __ror__(self, lhs):
        return self._combine(ExprOp.OR, lhs, self)

    def __rxor__(self, lhs):
        return self._combine(ExprOp.XOR, lhs, self)

    # Statement generators
    def __matmul__(self, rhs):
        return self._assign(self, rhs)

    def __contains__(self, lhs):
        return self._assign(lhs, self)

    def __rmatmul__(self, lhs):
        lhs = self.to_expr(lhs)
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

    # Comparators
    def __eq__(self, rhs):
        return self._compare(CmpOp.EQ, self, rhs)

    def __ne__(self, rhs):
        return self._compare(CmpOp.NE, self, rhs)

    def __lt__(self, rhs):
        return self._compare(CmpOp.LT, self, rhs)

    def __le__(self, rhs):
        return self._compare(CmpOp.LE, self, rhs)

    def __gt__(self, rhs):
        return self._compare(CmpOp.GT, self, rhs)

    def __ge__(self, rhs):
        return self._compare(CmpOp.GE, self, rhs)

    # Properties
    @property
    def is_pure_register(self):
        return self.op == ExprOp.NONE and self.a.is_pure_register

    @property
    def is_pure_const(self):
        return self.op == ExprOp.NONE and self.a.is_pure_const

    @property
    def is_pure_label(self):
        return self.op == ExprOp.NONE and self.a.is_pure_label

    @property
    def is_pure(self):
        return self.op == ExprOp.NONE
