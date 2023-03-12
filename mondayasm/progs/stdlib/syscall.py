from enum import Enum

import mondayasm
from progs.stdlib.devices import SYSCALL_ENTRY
from soeunasm import call, Scope, Expr, ExprOp
from soeunasm.free_expr import push, M
from soeunasm.miscs import adjust_sp, Reg
from soeunasm.scope_func import g_func_scope_stack, CALLER_SAVE
from soeunasm.scope_global import inc_stack_offset, dec_stack_offset


class S(Enum):
    printf = 0
    putc = 1
    getc = 2
    itoa_10 = 3
    itoa_16 = 4
    itoa_2 = 5
    to_hex_digit = 6
    from_hex_digit = 7
    atoi_16 = 8
    memset = 9
    memcpy = 10
    strcmp = 11
    strcasecmp = 12
    strchr = 13
    srand = 14
    rand = 15
    _delay_impl = 16
    puts = 17
    decode_font = 18
    decode_font_16_12 = 19
    read_sd = 20
    write_sd = 21
    init_sd = 22


def syscall(syscall_number: S, *args):
    assert isinstance(syscall_number, S)

    preserve = [r for r in g_func_scope_stack[-1]._used_regs
                if r.a.register_value.name in CALLER_SAVE]
    args = list(args)

    with Scope(preserve=preserve, simple=True, base_name='syscall'):
        for arg in reversed(args):
            push(arg).emit()
            inc_stack_offset(2)
        Reg.H @= syscall_number
        mondayasm.CALL([SYSCALL_ENTRY])
        adjust_sp(len(args) * 2)
        dec_stack_offset(len(args) * 2)
