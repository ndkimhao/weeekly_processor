from enum import Enum

import mondayasm
from progs.stdlib.devices import DEV_BASE_ADDR, LED, UART_RECV, FLAG_UART_RECV_VALID, UART_SEND
from progs.stdlib.format import atoi_16
from progs.stdlib.memory import strchr, strcmp, strcasecmp
from progs.stdlib.printf import puts, printf, PRINTF
from progs.stdlib.timing import DELAY_MILLIS
from soeunasm import Reg, call, halt, init_code_gen, If, jmp, mmap, umap, const, M, Loop, local_var, Break, expr, Scope, \
    global_var, While, Else, cmt, Continue
from soeunasm.free_expr import decl_label, label
from soeunasm.scope_func import Return, emit_fn

BOOTLOADER2_ROM_MODE = False

CODE_OFFSET = 0xA000
CODE_END = 0xFB00
MMAP_SLOT_ROM = 3
MMAP_SLOT_DEVICES = 2

MAX_ARGS = 4
g_num_args = global_var('g_num_args')
g_args = global_var('g_args', size=2 * (MAX_ARGS + 1), align=2)


class SerialCmd(Enum):
    NONE = 0
    PING = 1
    READ = 2
    WRITE = 3


def parse_command_name(p_str, A, H):
    A @= p_str
    for cmd in SerialCmd:
        if cmd != SerialCmd.NONE:
            call(strcasecmp, A, const(cmd.name))
            If(H == 0).then_return(cmd.value)
    H @= SerialCmd.NONE


# Returns H = SerialCmd, G = is okay
def recv_command(A, B, C, D, G, H):
    global g_args, g_num_args
    lb_fail = decl_label()

    cmd_num = local_var()
    cmd_num @= SerialCmd.NONE

    BUF_SZ = 32
    buf = local_var(size=BUF_SZ + 2)
    buf @= 0  # null terminate
    A @= buf.addr()
    with Loop():
        # recv uart
        C @= M[UART_RECV]
        D @= C & FLAG_UART_RECV_VALID
        If(D == 0).then_continue()

        # process character
        C &= 0xFF
        # echo back
        M[UART_SEND] @= C  # we are receiving, so uart sender won't be busy
        If(C == '\n').then_break()
        If(C == '\r').then_break()

        with If(A >= buf.addr() + BUF_SZ - 1):
            call(puts, const('$OVERFLOW\n'))
            If(H == SerialCmd.NONE).then_jmp(lb_fail)

        M[A] @= C  # Write character
        A += 1

    # process command
    call(strchr, buf.addr(), ' ')
    C @= H
    with If(C != 0):
        M[C].byte() @ 0
        C += 1
        Else()  # ELSE
        C @= 0xFFFF

    # parse command name
    call(parse_command_name, buf.addr())
    If(H == SerialCmd.NONE).then_return()
    cmd_num @= H

    # parse arguments
    cmt('parse arguments')
    g_num_args @= 0
    with While(C < buf.addr() + BUF_SZ):
        call(strchr, C, ' ')
        D @= H
        with If(D != 0):
            M[D].byte() @ 0
            Else()
            D @= 0xFFFF - 1  # prevent overflow when doing C @= D+1
        A @= g_num_args
        with If(A >= MAX_ARGS):
            call(puts, const('TOO_MANY_ARGS\n'))
            jmp(lb_fail)

        call(atoi_16, C)
        with If(G == 0):  # parse error
            call(printf, const("INVALID_ARG %d\n"), A)
            jmp(lb_fail)

        B @= A << 1
        g_args.addr_add(B) @ H
        PRINTF('arg%d=%x\n', g_num_args, g_args.addr_add(B))

        g_num_args @= A + 1
        C @= D + 1
    # returns cmd_num
    G @= 1
    H @= cmd_num
    Return()

    label(lb_fail)
    G @= 0
    H @= SerialCmd.NONE


def handle_ping():
    call(puts, const("PONG\n"))


def handle_read():
    call(puts, const("read\n"))


def handle_write():
    call(puts, const("write\n"))


HANDLER_MAP_PY = [
    (SerialCmd.PING, handle_ping),
    (SerialCmd.READ, handle_read),
    (SerialCmd.WRITE, handle_write),
]


def _process_handler_map(arr):
    ret = []
    prev = SerialCmd.NONE
    for cmd, fn in HANDLER_MAP_PY:
        cmd: SerialCmd
        assert prev.value + 1 == cmd.value
        prev = cmd
        lb_fn = emit_fn(fn)
        ret.append(lb_fn)
    return ret


HANDLER_MAP = const('HANDLER_MAP', _process_handler_map(HANDLER_MAP_PY))


def main(A, B, G, H):
    # map device range
    A @= 0xFD
    B @= 0
    mmap(DEV_BASE_ADDR, DEV_BASE_ADDR + 0xFF, MMAP_SLOT_DEVICES)

    # send hello
    call(puts, const('Weeekly3006 - Hardware v1.2 - Bootloader v2.0\nREADY\n'))

    # wait for commands
    M[LED] @= 1
    with Loop():
        call(recv_command)
        A @= H
        with If(G == 0):
            Continue()
        with If(A == SerialCmd.NONE):
            call(puts, const('UNKNOWN_COMMAND\n'))
            Continue()
        A <<= 1
        A += HANDLER_MAP - 2
        mondayasm.CALL([A.a])


if __name__ == '__main__':
    if BOOTLOADER2_ROM_MODE:
        with If(Reg.PC != CODE_OFFSET):
            Reg.A @= 0xFF
            Reg.B @= 0
            mmap(CODE_OFFSET, CODE_END - 1, MMAP_SLOT_DEVICES)  # tmp slot = MMAP_SLOT_DEVICES
            jmp(CODE_OFFSET)

        # PC == START_ADDR
        mmap(CODE_OFFSET, CODE_END - 1, MMAP_SLOT_ROM)
        umap(MMAP_SLOT_DEVICES)

    Reg.SP @= DEV_BASE_ADDR
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.var_offset = (CODE_END + 0xF) & 0xFFF0
    cg.compile().write('bootloader2.asm')
