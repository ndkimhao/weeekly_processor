from progs.stdlib import printf
from progs.stdlib.format import itoa_10, itoa_16, itoa_2, to_hex_digit, from_hex_digit, atoi_16
from progs.stdlib.memory import memset, memcpy, strcmp, strcasecmp, strchr
from progs.stdlib.random import srand, rand
from progs.stdlib.syscall import S
from progs.stdlib.timing import _delay_impl
from progs.stdlib.uart import putc, getc
from soeunasm import emit_fn, const, Reg, M, global_var, jmp, If
import mondayasm
from soeunasm.scope_func import Return

SYSCALL_MAP_PY = {
    S.printf: printf,
    S.putc: putc,
    S.getc: getc,
    S.itoa_10: itoa_10,
    S.itoa_16: itoa_16,
    S.itoa_2: itoa_2,
    S.to_hex_digit: to_hex_digit,
    S.from_hex_digit: from_hex_digit,
    S.atoi_16: atoi_16,
    S.memset: memset,
    S.memcpy: memcpy,
    S.strcmp: strcmp,
    S.strcasecmp: strcasecmp,
    S.strchr: strchr,
    S.srand: srand,
    S.rand: rand,
    S._delay_impl: _delay_impl,
}


def _process_syscall_map():
    ret = []
    prev = -1
    for sc_num, fn in SYSCALL_MAP_PY.items():
        sc_num: S
        assert prev + 1 == sc_num.value
        prev = sc_num.value
        lb_fn = emit_fn(fn)
        ret.append(lb_fn)
    assert len(ret) == len(S)
    return ret


SYSCALL_MAP = const('SYSCALL_MAP', _process_syscall_map())


def syscall_entry(SP):
    with If(M[SP + 2] >= len(SYSCALL_MAP_PY)):
        Return()
    SP += 2
    #  SP-4        SP-2          SP            SP+2
    # [    t    ] [return addr] [syscall num] [args...]
    M[SP - 4] @= M[SP] << 1
    M[SP - 4] += SYSCALL_MAP
    M[SP] @= M[SP - 2]
    jmp(M[SP - 4])
