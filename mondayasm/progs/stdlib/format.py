from progs.stdlib.div_const import DIV_CONST
from soeunasm import M, While, Break, If, cmt, Else


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
