import re
from dataclasses import dataclass, field
from typing import Union

from mondayasm.types import ArgEncode, Term
from mondayasm.data import REGS_MAP, AUX_REGS_MAP, FACTORS_MAP


@dataclass(frozen=True)
class AsmArg:
    a: ArgEncode
    b: ArgEncode
    x: ArgEncode

    def __str__(self) -> str:
        a, b, x = self.a.value, self.b.value, self.x.value
        if a == '' and self.b.value == '':
            return x
        s = ''
        if str(a) != '0':
            s += f'0x{a & 0xFFFF:x}' if isinstance(a, int) else str(a)
        if str(x) != '1':
            s += f'*{x}'
        if str(b) != '0':
            if s != '':
                s += ' + '
            if isinstance(b, int) and b < 0:
                s += str(b)
            elif isinstance(b, int) and b >= 0xFF:
                s += str(b - 0x10000)
            else:
                s += f'0x{b & 0xFF:x}' if isinstance(b, int) else str(b)
        if s == '':
            s = '0'
        return s

    @property
    def bincode_head(self) -> str:
        return self.a.bincode + self.b.bincode + self.x.bincode

    @property
    def bincode_tail(self) -> str:
        return self.a.tailbincode + self.b.tailbincode


@dataclass(frozen=True)
class Register:
    name: str

    def __repr__(self) -> str:
        return self.name


@dataclass(frozen=True)
class ConstLabel:
    name: str

    def __post_init__(self):
        assert self.is_valid_name(self.name), repr(self.name)

    def __repr__(self) -> str:
        return f'${self.name}'

    @classmethod
    def is_valid_name(cls, name):
        if name.strip() != name:
            return False
        return re.match(r'^[0-9a-zA-Z-_]+$', name)


REGISTER_A = Register('A')
REGISTER_B = Register('B')
REGISTER_C = Register('C')
REGISTER_D = Register('D')
REGISTER_SP = Register('SP')
REGISTER_PC = Register('PC')
REGISTER_E = Register('E')
REGISTER_F = Register('F')
REGISTER_G = Register('G')
REGISTER_H = Register('H')
REGISTER_0 = Register('0')

LABEL_REL_PC = ConstLabel('__PC__')


@dataclass(frozen=True)
class RawExpr:
    terms: tuple[Term, ...] = field(default=())

    def __post_init__(self):
        assert all(isinstance(t, Term) and
                   isinstance(t.value, (int, ConstLabel, Register)) and
                   isinstance(t.factor, int)
                   for t in self.terms)

    def __add__(self, rhs) -> 'RawExpr':
        if isinstance(rhs, RawExpr):
            assert all(isinstance(t, Term) for t in rhs.terms)
            return RawExpr(self.terms + rhs.terms)
        else:
            assert isinstance(rhs, (Register, ConstLabel, int))
            return RawExpr(self.terms + (Term(rhs, 1),))

    def __sub__(self, rhs) -> 'RawExpr':
        return self + (rhs * -1)

    def __mul__(self, rhs) -> 'RawExpr':
        assert isinstance(rhs, int)
        return RawExpr(tuple(Term(term, factor * rhs) for term, factor in self.terms))

    def __radd__(self, lhs) -> 'RawExpr':
        return self + lhs

    def __rsub__(self, lhs) -> 'RawExpr':
        return self - lhs

    def __rmul__(self, lhs) -> 'RawExpr':
        return self * lhs

    def assemble(self) -> AsmArg:
        regs = {}
        labels = {}
        const = 0
        for term, factor in self.terms:
            assert isinstance(factor, int)
            if isinstance(term, Register):
                regs[term.name] = regs.get(term.name, 0) + factor
            elif isinstance(term, ConstLabel):
                labels[term.name] = labels.get(term.name, 0) + factor
            else:
                assert isinstance(term, int)
                const += term * factor
        regs = [Term(k, v) for k, v in regs.items() if v != 0]
        labels = [Term(k, v) for k, v in labels.items() if v != 0]
        assert len(regs) <= 2
        if len(regs) == 2 and regs[0].factor < regs[1].factor:
            regs[0], regs[1] = regs[1], regs[0]
        assert len(regs) == 0 or regs[0].factor in FACTORS_MAP
        assert len(regs) <= 1 or regs[1].factor == 1
        assert len(regs) <= 1 or const == 0
        assert 0 <= const < 65536 or -32768 <= const < 32768
        has_aux_reg = False
        for value, factor in regs:
            assert value in REGS_MAP or value in AUX_REGS_MAP
            if value in AUX_REGS_MAP:
                has_aux_reg = True
        if has_aux_reg:
            assert len(regs) == 1 and regs[0].factor == 1 and const == 0

        a = ArgEncode('0', '000', '')
        b = ArgEncode('0', '000', '')
        x = ArgEncode('1', '00', '')
        const_enc = ArgEncode(const, '111', f'{(const & 0xFFFF) % 256:08b}{(const & 0xFFFF) // 256:08b}')
        if len(labels) != 0:
            const_head = ' + '.join(f'{lbl.factor:x} * ${{{lbl.value}}}'
                                    if lbl.factor != 1 else f'${{{lbl.value}}}'
                                    for lbl in labels)
            const_tail = '' if const == 0 else f' + {const:04x}'
            humanval = f'{const_head}{const_tail}'.replace(f' + -1 * ${{{LABEL_REL_PC.name}}}', ':rel')
            # unknown constant, encode as big constant
            a = ArgEncode(humanval, '111', f'<{const_head}{const_tail}>')
            if len(regs) != 0:
                assert len(regs) == 1
                assert regs[0].factor == 1 or regs[0].value == REGISTER_0
                b = ArgEncode(regs[0].value, f'{REGS_MAP[regs[0].value]:03b}', '')
        elif len(regs) == 0:
            # constant
            if const == 0:
                # zero value
                pass
            elif -128 <= const < 128:
                # small constant: a = 0, b = const, x = 1
                b = ArgEncode(const, '111', f'{const & 0xFF:08b}')
            elif -128 <= const - 0x10000:
                # convert big const to small negative value
                c2 = const - 0x10000
                b = ArgEncode(const, '111', f'{c2 & 0xFF:08b}')
            else:
                # large constant: a = const, b = 0, x = 1
                a = const_enc
        elif not -128 <= const < 128:
            # a = big const, b = register, x = 1
            assert len(regs) == 1 and regs[0].factor == 1
            a = const_enc
            b = ArgEncode(regs[0].value, f'{REGS_MAP[regs[0].value]:03b}', '')
        elif regs[0].value in AUX_REGS_MAP:
            assert len(regs) == 1 and regs[0].factor == 1
            # a = b = 111, x = aux reg id
            a = ArgEncode('', '111', '')
            b = ArgEncode('', '111', '')
            x = ArgEncode(regs[0].value, f'{AUX_REGS_MAP[regs[0].value]:02b}', '')
        else:
            # normal form
            a = ArgEncode(regs[0].value, f'{REGS_MAP[regs[0].value]:03b}', '')
            x = ArgEncode(regs[0].factor, f'{FACTORS_MAP[regs[0].factor]:02b}', '')
            if const != 0:
                # b = small const
                assert -128 <= const < 128
                assert len(regs) == 1
                b = ArgEncode(const, '111', f'{const & 0xFF:08b}')
            elif len(regs) == 2:
                # b = reg
                assert regs[1].factor == 1
                b = ArgEncode(regs[1].value, f'{REGS_MAP[regs[1].value]:03b}', '')
            else:
                # b = 0
                pass
        return AsmArg(a, b, x)

    def _has_term_value(self, tval):
        return any(tval == t.value for t in self.terms)

    @property
    def relative(self) -> 'RawExpr':
        if not self._has_term_value(LABEL_REL_PC):
            return self + RawExpr((Term(LABEL_REL_PC, -1),)) + RawExpr.to_expr(REGISTER_PC)
        else:
            return self

    @property
    def absolute(self):
        if self._has_term_value(LABEL_REL_PC):
            return self + RawExpr((Term(LABEL_REL_PC, +1),)) - RawExpr.to_expr(REGISTER_PC)
        else:
            return self

    @property
    def is_pure_register(self):
        return len(self.terms) == 1 and isinstance(self.terms[0].value, Register)

    @property
    def is_pure_label(self):
        return len(self.terms) == 1 and self.terms[0].factor == 1 and isinstance(self.terms[0].value, ConstLabel)

    @property
    def is_pure_const(self):
        return len(self.terms) == 1 and isinstance(self.terms[0].value, int)

    @property
    def const_value(self) -> int:
        return sum(t.value * t.factor for t in self.terms if isinstance(t.value, int))

    @property
    def without_const_value(self) -> 'RawExpr':
        return RawExpr(tuple(t for t in self.terms if not isinstance(t.value, int)))

    @property
    def label_value(self) -> ConstLabel:
        assert self.is_pure_label
        return self.terms[0].value

    @property
    def register_value(self) -> Register:
        assert self.is_pure_register
        return self.terms[0].value

    def __str__(self) -> str:
        s = ''
        for term, factor in self.terms:
            if s != '':
                s += ' + '
            s += str(term)
            if factor != 1:
                s += f'*{factor}'
        if s == '':
            s = '0'
        return s

    @classmethod
    def to_expr(cls, v) -> 'RawExpr':
        if isinstance(v, RawExpr):
            return v
        else:
            if isinstance(v, str):
                v = ConstLabel(v)
            assert isinstance(v, (Register, ConstLabel, int)), v
            return RawExpr() + v

    def replace_once(self, find_value, replace_value) -> 'RawExpr':
        found_idx = -1
        for i, t in enumerate(self.terms):
            if t.value == find_value:
                found_idx = i
                break
        if found_idx == -1:
            return self
        return RawExpr(tuple(
            t if i != found_idx else Term(replace_value, t.factor)
            for i, t in enumerate(self.terms)
        ))


@dataclass(frozen=True, slots=True)
class RawIndirect:
    expr: RawExpr

    def __post_init__(self):
        assert isinstance(self.expr, RawExpr)

    def as_direct(self) -> RawExpr:
        return self.expr

    @classmethod
    def to_expr_maybe_indirect(cls, v) -> Union['RawIndirect', RawExpr]:
        if isinstance(v, list):
            assert len(v) == 1
            return RawIndirect(RawExpr.to_expr(v[0]))

        return RawExpr.to_expr(v)

    def replace_once(self, find_value, replace_value) -> 'RawIndirect':
        return RawIndirect(self.expr.replace_once(find_value, replace_value))


class MemoryMagic:
    def __getitem__(self, v) -> RawIndirect:
        expr = RawExpr.to_expr(v)
        return RawIndirect(expr)


MemoryMagicInstance = MemoryMagic()

A = RawExpr.to_expr(REGISTER_A)
B = RawExpr.to_expr(REGISTER_B)
C = RawExpr.to_expr(REGISTER_C)
D = RawExpr.to_expr(REGISTER_D)
SP = RawExpr.to_expr(REGISTER_SP)
PC = RawExpr.to_expr(REGISTER_PC)
E = RawExpr.to_expr(REGISTER_E)
F = RawExpr.to_expr(REGISTER_F)
G = RawExpr.to_expr(REGISTER_G)
H = RawExpr.to_expr(REGISTER_H)
ZERO = RawExpr.to_expr(REGISTER_0)
