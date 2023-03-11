from enum import Enum

import mondayasm
from progs.bootloader2.syscall_entry import syscall_entry
from progs.stdlib.devices import DEV_BASE_ADDR, LED, UART_SEND, JMP_TARGET, \
    SYSCALL_ENTRY, BTN_READ, SD_OUT, SD_IN, SD_ADDR_1, \
    SD_ADDR_0, BIT_SD_OUT_RESET, BIT_SD_OUT_POWER_ON, BIT_SD_IN_BUSY, BIT_SD_OUT_READ, \
    BIT_SD_OUT_HANDSHAKE, BIT_SD_IN_HANDSHAKE, SD_ERROR
from progs.stdlib.format import atoi_16, itoa_16
from progs.stdlib.memory import strchr, strcmp, strcasecmp
from progs.stdlib.oled import init_oled, deinit_oled, quick_deinit_oled, test_show_oled_chars, draw_str_oled, \
    draw_char_oled
from progs.stdlib.printf import puts, printf, PRINTF
from progs.stdlib.sdcard import read_sd, init_sd, init_sd_head, init_sd_tail
from progs.stdlib.uart import putc, getc
from progs.stdlib.timing import DELAY_MILLIS
from soeunasm import Reg, call, halt, init_code_gen, If, jmp, mmap, umap, const, M, Loop, local_var, Break, expr, Scope, \
    global_var, While, Else, cmt, Continue, ForRange, setb
from soeunasm.free_cmds import clrb, getb
from soeunasm.free_expr import decl_label, label, push, pop, addr
from soeunasm.scope_func import Return, emit_fn

BOOTLOADER2_ROM_MODE = False

if BOOTLOADER2_ROM_MODE:
    # ROM mode
    CODE_OFFSET = 0xE000
    CODE_END = 0xFA00
else:
    # TESTING mode
    CODE_OFFSET = 0x9000
    CODE_END = 0xFA00

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
    READB = 4
    WRITEB = 5
    JMP = 6
    JMP_PERSIST = 7
    INIT_SD = 8
    READ_SD = 9
    INIT_OLED = 10
    READW = 11  # read hex in big endian
    DEINIT_OLED = 12


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
        call(getc)
        C @= H
        # echo back
        M[UART_SEND] @= C  # we are receiving, so uart sender won't be busy
        If(C == '\n').then_break()
        If(C == '\r').then_break()

        with If(A >= buf.addr() + BUF_SZ - 1):
            call(puts, const(f'$OVERFLOW max={BUF_SZ - 1}\n'))
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
            call(puts, const(f'TOO_MANY_ARGS max={MAX_ARGS}\n'))
            jmp(lb_fail)

        call(atoi_16, C)
        with If(G == 0):  # parse error
            call(printf, const('INVALID_ARG idx=%d\n'), A)
            jmp(lb_fail)

        B @= A << 1
        g_args.addr_add(B) @ H
        # PRINTF('arg%d=%x\n', g_num_args, g_args.addr_add(B))

        g_num_args @= A + 1
        C @= D + 1
    # returns cmd_num
    G @= 1
    H @= cmd_num
    Return()

    label(lb_fail)
    G @= 0
    H @= SerialCmd.NONE


def check_num_args(need, G):
    G @= 1
    with If(g_num_args != need):
        call(printf, const('WRONG_NUM_ARGS need=%d provided=%d\n'), need, g_num_args)
        G @= 0


def check_addr_range(A, B, C, G):
    lb_fail = decl_label()
    A @= g_args
    B @= g_args.addr_add(2)

    C @= const('INVALID_RANGE\n')
    If(A >= B).then_jmp(lb_fail)

    C @= const('NOT_ALIGNED\n')
    G @= A & 1
    If(G != 0).then_jmp(lb_fail)
    G @= B & 1
    If(G != 0).then_jmp(lb_fail)

    G @= 1
    Return()

    label(lb_fail)
    call(puts, C)
    G @= 0


def handle_ping(cmd_num):
    call(check_num_args, 0)
    call(puts, const('PONG\n'))


def handle_read(cmd_num, A, B, C, D, G):
    buf = local_var(size=6)

    call(check_num_args, 2)
    If(G == 0).then_return()
    call(check_addr_range)
    If(G == 0).then_return()

    A @= g_args
    B @= g_args.addr_add(2)

    call(printf, const('READ_OK %x %x\n'), A, B)
    with If(cmd_num == SerialCmd.READB):
        with While(A < B):
            C @= [A]
            call(putc, C)
            C >>= 8
            call(putc, C)
            A += 2

        Else()  # READ or READW
        with While(A < B):
            D @= M[A].ror(8)
            with If(cmd_num == SerialCmd.READW):
                D @= D.ror(8)
            call(itoa_16, D, addr(buf))
            call(puts, addr(buf))
            A += 2
    ###
    call(putc, '\n')


def handle_write(cmd_num, A, B, C, D, G, H):
    lb_fail = decl_label()
    buf = local_var(size=6)

    call(check_num_args, 2)
    If(G == 0).then_return()
    call(check_addr_range)
    If(G == 0).then_return()

    A @= g_args
    B @= g_args.addr_add(2)

    with If(cmd_num == SerialCmd.WRITE):
        with While(A < B):
            with ForRange(D, 0, 4):
                call(getc)
                M[UART_SEND] @= H  # echo back
                buf.addr_add(D) @ H
            ###
            call(atoi_16, buf.addr())
            If(G == 0).then_jmp(lb_fail)

            C @= H << 8
            H >>= 8
            C |= H
            M[A] @= C
            A += 2

        Else()
        with While(A < B):
            call(getc)
            M[UART_SEND] @= H
            C @= H
            call(getc)
            M[UART_SEND] @= H

            H <<= 8
            C |= H
            M[A] @= C
            A += 2
    ###
    call(getc)
    M[UART_SEND] @= H  # echo back
    with Scope():
        If(H == '\n').then_break()
        If(H == '\r').then_break()
        jmp(lb_fail)
    call(printf, const('WRITE_OK %x %x\n'), g_args, B)

    Return()
    label(lb_fail)
    call(puts, const("$INVALID_DATA\n"))
    G @= 0


glb_jmp_to_stored_target = decl_label('glb_jmp_to_stored_target', anon=False)


def handle_jmp(cmd_num, G):
    call(check_num_args, 1)
    If(G == 0).then_return()

    with If(cmd_num == SerialCmd.JMP):
        call(printf, const('JMP_TO %x\n'), g_args)
        jmp(g_args)

    M[JMP_TARGET] @= g_args
    call(printf, const('JMP_PERSISTED %x\n'), M[JMP_TARGET])

    # No return from this point
    label(glb_jmp_to_stored_target)
    M[LED] @= 0
    for reg in [Reg.A, Reg.B, Reg.C, Reg.D, Reg.SP,
                Reg.E, Reg.F, Reg.G, Reg.H]:
        reg @= 0

    jmp(M[JMP_TARGET])


def handle_init_sd(cmd_num, G):
    call(init_sd)
    with If(G == 0):
        call(puts, const('TIMEOUT\n'))
        Else()
        call(puts, const('INIT_OK\n'))


def handle_read_sd(cmd_num, A, B, G, H):
    buf = local_var(size=514)
    call(check_num_args, 2)
    If(G == 0).then_return()

    call(read_sd, buf.addr(), g_args, g_args.addr_add(2))
    with If(G == 0):
        call(puts, const('TIMEOUT\n'))
        Return()

    A @= H
    PRINTF('read %d bytes\n', A)
    A += buf.addr()
    with ForRange(B, buf.addr(), A):
        call(printf, const('%h '), [B])

    call(putc, '\n')


def handle_init_oled(cmd_num):
    call(init_oled)
    call(puts, const('DONE\n'))


def handle_deinit_oled(cmd_num):
    call(deinit_oled)
    call(puts, const('DONE\n'))


def _process_handler_map():
    ret = []
    prev = SerialCmd.NONE
    for cmd, fn in HANDLER_MAP_PY.items():
        cmd: SerialCmd
        assert prev.value + 1 == cmd.value
        prev = cmd
        lb_fn = emit_fn(fn)
        ret.append(lb_fn)
    assert len(ret) == len(SerialCmd) - 1
    return ret


HANDLER_MAP_PY = {
    SerialCmd.PING: handle_ping,
    SerialCmd.READ: handle_read,
    SerialCmd.WRITE: handle_write,
    SerialCmd.READB: handle_read,
    SerialCmd.WRITEB: handle_write,
    SerialCmd.JMP: handle_jmp,
    SerialCmd.JMP_PERSIST: handle_jmp,
    SerialCmd.INIT_SD: handle_init_sd,
    SerialCmd.READ_SD: handle_read_sd,
    SerialCmd.INIT_OLED: handle_init_oled,
    SerialCmd.READW: handle_read,
    SerialCmd.DEINIT_OLED: handle_deinit_oled,
}
HANDLER_MAP = const('HANDLER_MAP', _process_handler_map())


def main(A, B, G, H):
    # map device range
    A @= 0xFD
    B @= 0
    mmap(DEV_BASE_ADDR, DEV_BASE_ADDR + 0xFF, MMAP_SLOT_DEVICES)

    # write syscall address
    M[SYSCALL_ENTRY] @= emit_fn(syscall_entry)

    # cleanup devices
    call(quick_deinit_oled)

    # send hello
    call(puts, const('Weeekly3006 - Hardware v1.4 - Bootloader v2.3\n'))

    # check for persisted target
    A @= M[JMP_TARGET]
    with Scope():
        If(A == 0).then_break()
        If(A == CODE_OFFSET).then_break()

        B @= M[BTN_READ]
        B &= 0x100
        with If(B != 0):
            call(printf, const('FORCED_BOOTLOADER\n'))
            Break()

        call(printf, const('JMP_TO %x\n'), A)
        jmp(glb_jmp_to_stored_target)

    # show welcome screen
    call(init_sd_head)
    call(init_oled)
    call(draw_str_oled, 0, 0, const('Weeekly'))
    call(draw_str_oled, 1, 0, const('3006'))
    # check sd status
    call(init_sd_tail)
    H @= 's'
    with If(G == 0):
        H @= '-'
    call(draw_char_oled, 1, 6, H)

    # wait for commands
    call(puts, const('READY\n'))
    call(draw_char_oled, 1, 7, 'R')
    M[LED] @= 1
    with Loop():
        call(recv_command)
        M[LED] += 1
        A @= H
        with If(G == 0):
            Continue()
        with If(A == SerialCmd.NONE):
            call(puts, const('UNKNOWN_COMMAND\n'))
            Continue()
        B @= A * 2
        B += HANDLER_MAP - 2
        push(A)
        # NOTES: E & F maybe modified after this call
        mondayasm.CALL([B.a])
        pop(A)


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

    if BOOTLOADER2_ROM_MODE:
        Reg.SP @= DEV_BASE_ADDR
    else:
        Reg.SP @= CODE_OFFSET - 2
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    if BOOTLOADER2_ROM_MODE:
        cg.var_offset = (CODE_END + 0xF) & 0xFFF0
    cg.compile().write('bootloader2.asm')
    if BOOTLOADER2_ROM_MODE:
        cg.write_coe('bootloader2.coe')
