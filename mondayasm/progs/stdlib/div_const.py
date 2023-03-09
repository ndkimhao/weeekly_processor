from soeunasm import Reg, If, mov, expr, inc
from soeunasm.scope_global import ExitIf

_DIV_CONST_CACHE = {}

HAS_HW_DIVIDER = True


def _check_div_const(v, p):
    v = v & 0xFFFF
    p = p & 0xFFFF
    for i in range(1, 0x10000):
        r1 = i // v
        r2 = (i * p) >> 16
        if not (r1 == r2 or r1 == r2 + 1):
            return False
    return True


def _find_div_const(v):
    p = 0xFFFF // v
    if _check_div_const(v, p):
        return p

    p = 0xFFFF // v + 1
    if _check_div_const(v, p):
        return p

    p = 0xFFFF // v - 1
    if _check_div_const(v, p):
        return p

    assert False


def DIV_RECIPROCAL(v):
    assert 0 <= v <= 0xFFFF
    if v not in _DIV_CONST_CACHE:
        _DIV_CONST_CACHE[v] = _find_div_const(v)
    return _DIV_CONST_CACHE[v]


def DIV_CONST(dest, a_var, b_const, H, G, *, calc_mod: bool = False):
    assert isinstance(b_const, int)
    assert dest != a_var
    if HAS_HW_DIVIDER:
        mov(dest, expr(a_var) // expr(b_const))
        return
    G @= a_var * DIV_RECIPROCAL(b_const)
    mov(dest, H)
    G @= H * b_const
    if calc_mod:
        H @= a_var - G
    with If(G <= a_var - b_const):
        ExitIf(a_var < b_const)
        mov(dest, inc(dest))
        H -= b_const
