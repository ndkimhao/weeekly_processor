from progs.stdlib.devices import SD_ADDR_1, SD_ADDR_0, SD_OUT, BIT_SD_OUT_READ, SD_IN, BIT_SD_IN_BUSY, \
    BIT_SD_IN_HANDSHAKE, BIT_SD_OUT_HANDSHAKE, BIT_SD_OUT_RESET, BIT_SD_OUT_POWER_ON, BIT_SD_OUT_WRITE, SD_SECTOR_SIZE, \
    FLAG_SD_OUT_HANDSHAKE
from progs.stdlib.timing import delay_1ms
from soeunasm import setb, ForRange, getb, If, Loop, While, Else
from soeunasm.free_cmds import clrb
from soeunasm.free_expr import decl_label, label, M
from soeunasm.scope_func import Return, call


# rw: 0 = read / 1 = write
# returns G = is okay
def send_sd_cmd(rw, addr_1, addr_0,
                A, B, D, G):
    A @= BIT_SD_OUT_READ
    with If(rw == 1):
        A @= BIT_SD_OUT_WRITE

    M[SD_ADDR_1] @= addr_1
    M[SD_ADDR_0] @= addr_0

    setb([SD_OUT], A, inplace=True)
    with ForRange(D, 0, 0xFFFF):
        getb(B, [SD_IN], BIT_SD_IN_BUSY)
        If(B != 0).then_break()
    clrb([SD_OUT], A, inplace=True)

    G @= 1
    with If(B == 0):
        G @= 0


# returns H = num bytes read, G = is not timeout
# buf must have at least buf_len+2 bytes
def read_sd(buf, buf_len, addr_1, addr_0,
            A, B, C, D, E, F, G, H):
    lb_timeout = decl_label()

    # signal sd controller
    call(send_sd_cmd, 0, addr_1, addr_0)
    If(G == 0).then_jmp(lb_timeout)

    # read data
    E @= buf
    F @= 0
    with While(F < SD_SECTOR_SIZE):
        D += 1
        If(D == 0xFFFF).then_jmp(lb_timeout)

        C @= [SD_IN]
        getb(A, C, BIT_SD_IN_BUSY)
        If(A == 0).then_break()  # done read
        getb(A, C, BIT_SD_IN_HANDSHAKE)
        If(A == 0).then_continue()

        setb([SD_OUT], BIT_SD_OUT_HANDSHAKE, inplace=True)
        with ForRange(D, 0, 0xFFFF):
            getb(B, [SD_IN], BIT_SD_IN_HANDSHAKE)
            If(B == 0).then_break()
        If(B != 0).then_jmp(lb_timeout)
        clrb([SD_OUT], BIT_SD_OUT_HANDSHAKE, inplace=True)

        C &= 0xFF
        with If(F < buf_len):
            M[E] @= C
            E += 1
        F += 1
        D @= 0
    ###

    # return result
    G @= 1
    H @= - buf
    H += E
    Return()

    # failed
    label(lb_timeout)
    G @= 0
    H @= 0


def write_sd(buf, buf_len, addr_1, addr_0,
             A, B, C, D, E, F, G, H):
    lb_timeout = decl_label()

    # signal sd controller
    call(send_sd_cmd, 1, addr_1, addr_0)
    If(G == 0).then_jmp(lb_timeout)

    # send data
    E @= buf
    F @= 0
    with While(F < SD_SECTOR_SIZE):
        D += 1
        If(D == 0xFFFF).then_jmp(lb_timeout)

        C @= [SD_IN]
        getb(A, C, BIT_SD_IN_BUSY)
        If(A == 0).then_break()  # done write
        getb(A, C, BIT_SD_IN_HANDSHAKE)
        If(A == 0).then_continue()

        # now write the byte
        C @= 0
        with If(F < buf_len):
            C @= M[E].byte()
            E += 1

        A @= M[SD_OUT] & (0xFF00 - FLAG_SD_OUT_HANDSHAKE)
        M[SD_OUT] @= setb(A + C, BIT_SD_OUT_HANDSHAKE)
        with ForRange(D, 0, 0xFFFF):
            getb(B, [SD_IN], BIT_SD_IN_HANDSHAKE)
            If(B == 0).then_break()
        If(B != 0).then_jmp(lb_timeout)
        M[SD_OUT] @= A  # A already has SD_OUT_HANDSHAKE unset

        F += 1
        D @= 0
    ###

    # return
    G @= 1
    Return()

    # failed
    label(lb_timeout)
    G @= 0


def init_sd_head():
    setb([SD_OUT], BIT_SD_OUT_RESET, inplace=True)

    clrb([SD_OUT], BIT_SD_OUT_POWER_ON, inplace=True)
    delay_1ms()
    setb([SD_OUT], BIT_SD_OUT_POWER_ON, inplace=True)

    clrb([SD_OUT], BIT_SD_OUT_RESET, inplace=True)


def init_sd_tail(A, B, C, G):
    with ForRange(C, 0, 10):
        with ForRange(A, 0, 0xFFFF):
            getb(B, [SD_IN], BIT_SD_IN_BUSY)
            If(B == 0).then_break()
        If(B == 0).then_break()

    G @= 1
    with If(B != 0):
        G @= 0  # timeout


# returns G == 1 if okay
def init_sd():
    call(init_sd_head)
    call(init_sd_tail)
