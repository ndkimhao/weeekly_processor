from progs.stdlib.div_const import DIV_CONST
from soeunasm import M, While, Break, If, cmt, Else, For, Loop, Scope
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


# returns H = value, G = 0/1 is okay
def from_hex_digit(ch, G, H):
    G @= ch | 32
    with Scope():
        If(G < '0').then_break()
        If(G > '9').then_break()
        H @= G - '0'
        G @= 1
        Return()
    with Scope():
        If(G < 'a').then_break()
        If(G > 'f').then_break()
        H @= G + (- ord('a') + 10)
        G @= 1
        Return()

    H @= 0
    G @= 0


# returns H = value, G = 0/1 is okay
def atoi_16(p_str, A, B, G, H):
    A @= 0
    B @= p_str
    with Loop():
        H @= M[B].byte()
        If(H == 0).then_break()
        call(from_hex_digit, H)
        If(G == 0).then_return()  # parsing error
        A <<= 4
        A += H
        B += 1
    G @= 0
    with Scope():
        H @= p_str
        If(B == H).then_break()
        If(B - 4 > H).then_break()
        G @= 1
    H @= A
