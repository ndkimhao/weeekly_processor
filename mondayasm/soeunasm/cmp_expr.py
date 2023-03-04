from dataclasses import dataclass
from enum import Enum, auto
import mondayasm as mon


class CmpOp(Enum):
    EQ = auto()
    NE = auto()
    LT = auto()
    LE = auto()
    GT = auto()
    GE = auto()


@dataclass(frozen=True, slots=True)
class CmpExpr:
    a: RawExpr | RawIndirect
    b: RawExpr | RawIndirect
    op: CmpOp
