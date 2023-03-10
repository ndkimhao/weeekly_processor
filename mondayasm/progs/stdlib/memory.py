from soeunasm import While, M, If, Loop, Scope


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


def strcmp(p_lhs, p_rhs,
           E, F, G, H):
    E @= p_lhs
    F @= p_rhs
    with Loop():
        G @= M[E].byte()
        H @= M[F].byte()
        H @= G - H
        If(H != 0).then_return()
        If(G == 0).then_return()  # H == 0 ==> returns 0
        E += 1
        F += 1


def strcasecmp(p_lhs, p_rhs,
               A, E, F, G, H):
    E @= p_lhs
    F @= p_rhs
    with Loop():
        G @= M[E].byte()
        H @= M[F].byte()
        A @= G  # G before converting case
        G |= 32
        H |= 32
        H @= G - H
        If(H != 0).then_return()
        If(A == 0).then_return()  # H == 0 ==> returns 0
        E += 1
        F += 1


def strchr(p_str, c, G, H):
    H @= p_str
    with Loop():
        G @= M[H].byte()
        If(G == c).then_return()
        If(G == 0).then_return(0)
        H += 1
