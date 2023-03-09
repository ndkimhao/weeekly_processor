from soeunasm import While, M, If


def memset(p_start, value, size,
           A, B, G, H):
    G @= value.byte()
    H @= G << 8
    H |= G
    A @= p_start
    B @= size + A
    with While(A + 2 <= B):
        M[A] @= H
        A += 2
    with If(A < B):
        M[A] @= H.byte()


def memcpy(p_dest, p_src, size,
           A, B, C):
    A @= p_dest
    B @= size + A
    C @= p_src
    with While(A + 2 <= B):
        M[A] @= M[C]
        A += 2
        C += 2
    with If(A < B):
        M[A] @= M[C].byte()
