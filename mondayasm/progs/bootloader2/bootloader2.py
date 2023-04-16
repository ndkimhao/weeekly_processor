from enum import Enum

import mondayasm
from progs.bootloader2.syscall_entry import syscall_entry
from progs.stdlib.devices import DEV_BASE_ADDR, LED, UART_SEND, JMP_TARGET, \
    SYSCALL_ENTRY, BTN_READ, SD_SECTOR_SIZE, BTN_DEBOUNCED, BIT_BTN_UP, BIT_BTN_DOWN, BIT_BTN_CENTER, BIT_BTN_LEFT
from progs.stdlib.format import atoi_16, itoa_16, itoa_10
from progs.stdlib.memory import strchr, strcasecmp, memcpy
from progs.stdlib.oled import init_oled, deinit_oled, quick_deinit_oled, draw_str_oled, \
    draw_char_oled, clear_oled
from progs.stdlib.printf import puts, printf, PRINTF
from progs.stdlib.sdcard import read_sd, init_sd, init_sd_head, init_sd_tail, write_sd
from progs.stdlib.uart import putc, getc, getc_nonblocking
from soeunasm import Reg, call, halt, init_code_gen, If, jmp, mmap, umap, const, M, Loop, local_var, Break, expr, Scope, \
    global_var, While, Else, cmt, Continue, ForRange, Cleanup, getb
from soeunasm.free_expr import decl_label, label, push, pop, addr, inc
from soeunasm.scope_func import Return, emit_fn

BOOTLOADER2_ROM_MODE = False

if BOOTLOADER2_ROM_MODE:
    # ROM mode
    CODE_OFFSET = 0xD000
    CODE_END = 0xFA00
else:
    # TESTING mode
    CODE_OFFSET = 0x9000
    CODE_END = 0xFA00

MMAP_SLOT_ROM = 3
MMAP_SLOT_DEVICES = 2

MAX_ARGS = 6
g_num_args = global_var('g_num_args')
g_args = global_var('g_args', size=2 * (MAX_ARGS + 1), align=2)

g_has_sd_card = global_var('g_has_sd_card')
g_sd_slot = global_var('g_sd_slot')
g_sd_jmp_target = global_var('g_sd_jmp_target')
g_last_button_state = global_var('g_last_button_state')

SD_CODE_BANK = 3


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
    WRITE_SD = 13
    MMAP = 14
    UMAP = 15
    WRITEB_SD = 16
    SHOW_IMG = 17
    ERASE_SD = 18


def parse_command_name(p_str, A, H):
    A @= p_str
    for cmd in SerialCmd:
        if cmd != SerialCmd.NONE:
            call(strcasecmp, A, const(cmd.name))
            If(H == 0).then_return(cmd.value)
    H @= SerialCmd.NONE


def check_button_pressed(A, B, G):
    A @= M[BTN_DEBOUNCED]
    If(A == g_last_button_state).then_return()
    g_last_button_state @ A

    G @= getb(A, BIT_BTN_UP)
    with If(G != 0):
        G @ g_sd_slot
        with If(G >= 0):
            G -= 1
            g_sd_slot @ G
            call(update_code_index_screen)

    G @= getb(A, BIT_BTN_DOWN)
    with If(G != 0):
        B @= g_sd_slot
        g_sd_slot @ (B + 1)
        call(update_code_index_screen)
        with If(g_sd_slot == -1):
            g_sd_slot @ B
            call(update_code_index_screen)

    G @= getb(A, BIT_BTN_CENTER)
    with If(G != 0):
        call(load_code_from_sd)


def load_code_from_sd(A, B, C, D, G):
    CHUNK_HDR_SZ = 4
    lb_fail = decl_label()
    sd_buf = local_var(size=SD_SECTOR_SIZE + 16)

    C @= g_sd_slot
    If(C == -1).then_return()

    call(show_status, '-')
    C <<= 8
    with ForRange(B, 1, 256) as for_b:
        call(read_sd, sd_buf.addr(), SD_SECTOR_SIZE, SD_CODE_BANK, B + C)
        If(G == 0).then_jmp(lb_fail)

        A @= sd_buf
        D @= sd_buf.addr_add(2)
        with Scope():
            If(A != 0).then_break()
            If(D != 0).then_break()
            for_b.Break()

        G @= D - A
        If(G > SD_SECTOR_SIZE - CHUNK_HDR_SZ).then_jmp(lb_fail)

        call(memcpy, A, sd_buf.addr() + CHUNK_HDR_SZ, G)
        call(printf, const('SD_LOAD %x %x\n'), A, D)
    # END for B
    If(B == 256).then_jmp(lb_fail)

    G @= getb(M[BTN_READ], BIT_BTN_LEFT)
    with If(G == 0):
        call(show_status, 'R')
        call(printf, const('SD_JMP %x\n'), g_sd_jmp_target)
        call(jmp_to_target_persisted, g_sd_jmp_target)

    ###
    Return()
    label(lb_fail)
    call(show_status, 'E')
    Return()


def update_code_index_screen(C, G, H):
    lb_fail = decl_label()
    lb_not_found = decl_label()
    sd_buf = local_var(size=SD_SECTOR_SIZE + 16)
    iota_buf = local_var(size=10)

    C @= g_sd_slot
    If(C == -1).then_jmp(lb_not_found)

    C <<= 8
    call(read_sd, sd_buf.addr(), SD_SECTOR_SIZE, SD_CODE_BANK, C)
    If(G == 0).then_jmp(lb_fail)
    If(sd_buf != 0x3bb6).then_jmp(lb_not_found)

    g_sd_jmp_target @ sd_buf.addr_add(2)

    sd_buf.addr_add(4 + 8) @ 0  # null terminate
    call(clear_oled)
    call(draw_str_oled, 0, 0, sd_buf.addr() + 4)

    G @= g_sd_slot + 1
    call(itoa_10, G, iota_buf.addr())
    G @= iota_buf.addr()
    with Loop():
        H @= M[G].byte()
        If(H == 0).then_break()
        G += 1
    M[G] @= '.'  # append "." at the end
    call(draw_str_oled, 1, 0, iota_buf.addr())

    Return()

    label(lb_fail)
    call(show_status, 'E')
    Return()

    label(lb_not_found)
    g_sd_slot @ -1


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
        call(getc_nonblocking)
        with If(G == 0):
            call(check_button_pressed)
            Continue()
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
    with If(H == SerialCmd.NONE):
        call(puts, const('UNKNOWN_COMMAND\n'))
        jmp(lb_fail)
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
    If(H != '\n').then_jmp(lb_fail)
    call(printf, const('WRITE_OK %x %x\n'), g_args, B)

    Return()
    label(lb_fail)
    call(puts, const("$INVALID_DATA\n"))


glb_jmp_to_stored_target = decl_label('glb_jmp_to_stored_target', anon=False)


def show_status(ch):
    call(draw_char_oled, 1, 7, ch)


def handle_jmp(cmd_num, A, G):
    call(check_num_args, 1)
    If(G == 0).then_return()

    call(show_status, 'R')
    M[LED] @= 0

    A @= g_args

    with If(cmd_num == SerialCmd.JMP):
        call(printf, const('JMP_TO %x\n'), A)
        jmp(A)

    call(printf, const('JMP_PERSISTED %x\n'), A)
    call(jmp_to_target_persisted, A)


def jmp_to_target_persisted(target):
    M[JMP_TARGET] @= target

    # No return from this point
    label(glb_jmp_to_stored_target)
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
    itoa_buf = local_var(size=6)
    buf = local_var(size=SD_SECTOR_SIZE + 16)
    call(check_num_args, 2)
    If(G == 0).then_return()

    call(read_sd, buf.addr(), SD_SECTOR_SIZE, g_args, g_args.addr_add(2))
    with If(G == 0):
        call(puts, const('TIMEOUT\n'))
        Return()

    call(printf, const('READ_SD_OK %x %x\n'), g_args, g_args.addr_add(2))

    with ForRange(B, buf.addr(), buf.addr() + SD_SECTOR_SIZE):
        call(itoa_16, [B], itoa_buf.addr())
        call(puts, itoa_buf.addr() + 2)

    call(putc, '\n')


def handle_write_sd(cmd_num, A, B, C, D, G, H):
    lb_invalid_data = decl_label()

    atoi_buf = local_var(size=6)
    buf = local_var(size=SD_SECTOR_SIZE + 16)
    call(check_num_args, 2)
    If(G == 0).then_return()

    A @= buf.addr()
    with While(A < buf.addr() + SD_SECTOR_SIZE):
        with If(cmd_num == SerialCmd.WRITE_SD):
            with ForRange(D, 0, 2):
                call(getc)
                M[UART_SEND] @= H  # echo back
                C @= atoi_buf.addr()
                M[C + D] @= H
            ###
            call(atoi_16, atoi_buf.addr())
            If(G == 0).then_jmp(lb_invalid_data)
            M[A] @= H
            A += 1

            Else()  # cmd_num == SerialCmd.WRITEB_SD
            call(getc)
            M[UART_SEND] @= H  # echo back
            M[A] @= H
            A += 1
    ###

    # read end line
    call(getc)
    M[UART_SEND] @= H  # echo back
    If(H != '\n').then_jmp(lb_invalid_data)

    call(write_sd, buf.addr(), SD_SECTOR_SIZE, g_args, g_args.addr_add(2))
    with If(G == 0):
        call(puts, const('TIMEOUT\n'))
        Return()
    call(printf, const('WRITE_SD_OK %x %x\n'), g_args, g_args.addr_add(2))

    Return()
    label(lb_invalid_data)
    call(puts, const("$INVALID_DATA\n"))


def handle_init_oled(cmd_num):
    call(init_oled)
    call(puts, const('DONE\n'))


def handle_deinit_oled(cmd_num):
    call(deinit_oled)
    call(puts, const('DONE\n'))


def handle_mmap(cmd_num, A, B, C, D, E, G):
    call(check_num_args, 5)
    If(G == 0).then_return()

    A @= g_args
    B @= g_args.addr_add(2)
    C @= g_args.addr_add(4)
    D @= g_args.addr_add(6)
    E @= g_args.addr_add(8) & 0x03

    mmap(C, D, E)
    call(printf, const('MMAP_OK %x %x %x %x %x\n'), A, B, C, D, E)


def handle_umap(cmd_num, A, G):
    call(check_num_args, 1)
    If(G == 0).then_return()

    A @= g_args & 0x03
    umap(A)
    call(printf, const('UMAP_OK %x\n'), A)


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


# noinspection PyPep8Naming
def display_image(img_bank, img_slot, A, B, C, D, H, G):
    SD_BUF_MMAP_SLOT = 4
    COLOR_PALETTE_SIZE = 48
    VID_BUF_START = 0x0100
    VID_BUF_END = VID_BUF_START + SD_SECTOR_SIZE

    sd_buf = local_var(size=SD_SECTOR_SIZE + 16)
    C @= img_slot << 8
    call(read_sd, sd_buf.addr(), SD_SECTOR_SIZE, img_bank, C)
    If(G == 0).then_return()
    with If(sd_buf != 0x3aa6):
        G @= 0
        Return()

    A @= 0xA0
    B @= 0
    mmap(VID_BUF_START, VID_BUF_END, SD_BUF_MMAP_SLOT)
    call(memcpy, VID_BUF_START, sd_buf.addr() + 22, COLOR_PALETTE_SIZE)

    N_PAGES = 640 * 480 * 3 // 8 // SD_SECTOR_SIZE
    A @= 0xA1
    B @= 0
    with ForRange(D, 1, N_PAGES + 1):
        call(read_sd, sd_buf.addr(), SD_SECTOR_SIZE, img_bank, C + D)
        If(G == 0).then_return()
        # PRINTF('read %x %x\n', SD_IMAGE_BANK, (SD_IMAGE_SLOT << 8) + D)

        mmap(VID_BUF_START, VID_BUF_END, SD_BUF_MMAP_SLOT)
        call(memcpy, VID_BUF_START, sd_buf.addr(), SD_SECTOR_SIZE)

        H @= A & 0x0F
        H <<= 1
        with If(H > 7):
            H @= 1
            B += SD_SECTOR_SIZE
        A @= 0xA0 | H

    Cleanup()
    umap(SD_BUF_MMAP_SLOT)


def handle_show_img(G):
    call(check_num_args, 2)
    If(G == 0).then_return()

    with If(g_has_sd_card == 0):
        call(puts, const('NO_SD\n'))
        Return()

    call(display_image, g_args, g_args.addr_add(2))
    with If(G == 1):
        call(puts, const('SHOW_IMG_OK\n'))
        Else()
        call(puts, const('SHOW_IMG_ERROR\n'))


def handle_erase_sd(G):
    call(check_num_args, 2)
    If(G == 0).then_return()

    call(write_sd, 0, 0, g_args, g_args.addr_add(2))
    with If(G == 1):
        call(puts, const('ERASE_SD_OK\n'))
        Else()
        call(puts, const('ERASE_SD_ERROR\n'))


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
    SerialCmd.WRITE_SD: handle_write_sd,
    SerialCmd.MMAP: handle_mmap,
    SerialCmd.UMAP: handle_umap,
    SerialCmd.WRITEB_SD: handle_write_sd,
    SerialCmd.SHOW_IMG: handle_show_img,
    SerialCmd.ERASE_SD: handle_erase_sd,
}
HANDLER_MAP = const('HANDLER_MAP', _process_handler_map())


def check_persisted_target(A, B):
    A @= M[JMP_TARGET]
    with Scope():
        If(A == 0).then_break()
        If(A == CODE_OFFSET).then_break()

        B @= M[BTN_READ]
        B &= 0x100
        with If(B != 0):
            call(printf, const('FORCED_BOOTLOADER\n'))
            call(show_status, 'F')
            Break()

        call(printf, const('JMP_TO %x\n'), A)
        call(show_status, 'P')
        jmp(glb_jmp_to_stored_target)


VERSION_CHAR = '8'


def display_default_oled_screen(H):
    IS_TEST_CHAR = ' ' if BOOTLOADER2_ROM_MODE else 'T'
    call(draw_str_oled, 0, 0, const(f'Weeekly{IS_TEST_CHAR}'))
    call(draw_str_oled, 1, 0, const(f'3006 {VERSION_CHAR}'))
    H @= 'S'
    with If(g_has_sd_card == 0):
        H @= '-'
    call(draw_char_oled, 1, 6, H)


def init_sd_and_oled(H, G):
    # show welcome screen
    call(init_sd_head)
    call(init_oled)
    # check sd status
    call(init_sd_tail)
    g_has_sd_card @ G


def display_splash_screen():
    call(display_image, 2, 0)


def main(A, B, G, H):
    # map device range
    A @= 0xFD
    B @= 0
    mmap(DEV_BASE_ADDR, DEV_BASE_ADDR + 0xFF, MMAP_SLOT_DEVICES)

    # write syscall address
    M[SYSCALL_ENTRY] @= emit_fn(syscall_entry)

    # init
    call(puts, const(f'Weeekly3006 - Hardware v2.1 - Bootloader v3.{VERSION_CHAR}\n'))
    call(init_sd_and_oled)
    call(display_default_oled_screen)

    # init global vars
    g_sd_slot @ -1
    g_last_button_state @ 0

    # jump to persisted target if exists
    call(check_persisted_target)

    with If(g_has_sd_card == 1):
        call(display_splash_screen)
        call(show_status, '-')

    # wait for commands
    call(puts, const('READY\n'))
    M[LED] @= 1
    with Loop():
        call(recv_command)
        M[LED] += 1
        A @= H
        with If(G == 0):
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
        cg.compile().write('bootloader2.coe.asm')
    else:
        cg.compile().write('bootloader2.asm')
    if BOOTLOADER2_ROM_MODE:
        cg.write_coe('bootloader2.coe')
