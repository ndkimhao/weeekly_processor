from progs.stdlib.div_const import DIV_CONST
from soeunasm import M, While, Break, If, cmt, Else, For
from soeunasm.scope_func import Return, call


def itoa_10(value, p_str,
            A, B, C, H, G):
    A @= p_str
    M[A] @= ord('0')

    cmt('convert int to string')
    B @= value
    with While(B != 0):
        DIV_CONST(C, B, 10,  # C = B / 10
                  H, G, calc_mod=True)  # H = B % 10
        M[A] @= H + ord('0')
        A += 1
        B @= C

    cmt('reverse the string')
    C @= p_str
    with While(C < A):
        A -= 1
        B @= M[C]
        M[C] @= M[A].byte()
        M[A] @= B.byte()
        C += 1


def itoa_16(value, p_str, A, B, C, H):
    B @= value
    C @= p_str
    with For(A @ 3, A != -1, A @ (A - 1)):
        H @= B >> (A * 4)
        H &= 0xF
        call(to_hex_digit, H)
        M[C] @= H
        C += 1


def itoa_2(value, p_str, A, B, C, H):
    B @= value
    C @= p_str
    with For(A @ 15, A != -1, A @ (A - 1)):
        H @= B >> A
        H &= 1
        M[C] @= H + ord('0')
        C += 1


def to_hex_digit(v, H):
    with If(v <= 9):
        H @= v + ord('0')
        Else()
        H @= v + (ord('a') - 10)
