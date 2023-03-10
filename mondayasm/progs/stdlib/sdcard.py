from progs.stdlib.devices import SD_ADDR_1, SD_ADDR_0, SD_OUT, BIT_SD_OUT_READ, SD_IN, BIT_SD_IN_BUSY, \
    BIT_SD_IN_HANDSHAKE, BIT_SD_OUT_HANDSHAKE
from progs.stdlib.printf import PRINTF
from soeunasm import setb, ForRange, getb, If, Loop
from soeunasm.free_cmds import clrb
from soeunasm.free_expr import decl_label, label, M
from soeunasm.scope_func import Return


# returns H = num bytes read, G = is not timeout
# buf must have at least 514 bytes free
def read_sd(buf, addr_1, addr_0,
            A, B, C, D, E, G, H):
    lb_timeout = decl_label()

    M[SD_ADDR_1] @= addr_1
    M[SD_ADDR_0] @= addr_0

    setb([SD_OUT], BIT_SD_OUT_READ)
    with ForRange(D, 0, 0xFFFF):
        getb(B, [SD_IN], BIT_SD_IN_BUSY)
        If(B != 0).then_break()
    If(B == 0).then_jmp(lb_timeout)
    clrb([SD_OUT], BIT_SD_OUT_READ)

    E @= buf
    with Loop():
        D += 1
        If(D == 0xFFFF).then_jmp(lb_timeout)
        C @= [SD_IN]
        getb(A, C, BIT_SD_IN_BUSY)
        If(A == 0).then_break()  # done read
        getb(A, C, BIT_SD_IN_HANDSHAKE)
        If(A == 0).then_continue()

        setb([SD_OUT], BIT_SD_OUT_HANDSHAKE)
        with ForRange(D, 0, 0xFFFF):
            getb(B, [SD_IN], BIT_SD_IN_HANDSHAKE)
            If(B == 0).then_break()
        If(B != 0).then_jmp(lb_timeout)
        clrb([SD_OUT], BIT_SD_OUT_HANDSHAKE)

        C &= 0xFF
        M[E] @= C
        E += 1
        D @= 0

    G @= 1
    H @= - buf
    H += E
    Return()

    label(lb_timeout)
    G @= 0
    H @= 0
