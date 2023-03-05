from dataclasses import dataclass
from types import GeneratorType
from typing import Iterable, Union

from soeunasm import Statement


@dataclass(frozen=True, slots=True)
class Block:
    statements: tuple[Union[Statement, 'Block'], ...]

    @classmethod
    def create(cls, *v):
        if isinstance(v[0], list) or isinstance(v[0], tuple) or isinstance(v[0], GeneratorType):
            v = v[0]
        v = tuple(v)
        return Block(v)

    def __post_init__(self):
        assert isinstance(self.statements, tuple)
        assert all(isinstance(s, Statement) for s in self.statements)

    def emit(self, forced: bool = False):
        # ensure ordered emit
        for s in self.statements:
            s.emit(forced)

    def __del__(self):
        self.emit()

    def __iter__(self):
        return iter(self.statements)

    def __len__(self):
        return len(self.statements)

    def __bool__(self):
        return bool(self.statements)
