from dataclasses import dataclass
from enum import Enum, auto
from typing import ClassVar

from soeunasm import Expr


@dataclass
class TeLocation:
    SIZE: ClassVar = 2 + 2
    base: Expr
    row: Expr
    col: Expr

    def __init__(self, base):
        assert isinstance(base, Expr) and base.is_pure_indirect
        self.base = base
        self.row = self.base
        self.col = self.base.addr_add(2)

    def addr(self):
        return self.base.addr()


@dataclass
class TeBlock:
    SIZE: ClassVar = 2 + 2 + TeLocation.SIZE
    base: Expr
    typ: Expr
    ori: Expr
    loc: TeLocation

    def __init__(self, base):
        assert isinstance(base, Expr) and base.is_pure_indirect
        self.base = base
        self.typ = self.base
        self.ori = self.base.addr_add(2)
        self.loc = TeLocation(self.base.addr_add(4))

    def addr(self):
        return self.base.addr()


class TeMove(Enum):
    NONE = 0
    LEFT = 1
    RIGHT = 2
    ROTATE = 3
    DROP = 4
    HOLD = 5


class TeCell:
    EMPTY = 0
    CELL_J = 1
    CELL_S = 2
    CELL_I = 3
    CELL_Z = 4
    CELL_T = 5
    CELL_O = 6
    CELL_L = 7
