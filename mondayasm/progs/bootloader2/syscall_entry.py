from progs.stdlib import printf
from progs.stdlib.format import itoa_10, itoa_16, itoa_2, to_hex_digit, from_hex_digit, atoi_16
from progs.stdlib.memory import memset, memcpy, strcmp, strcasecmp, strchr
from progs.stdlib.printf import puts
from progs.stdlib.random import srand, rand
from progs.stdlib.sdcard import read_sd, write_sd, init_sd
from progs.stdlib.syscall import S
from progs.stdlib.timing import _delay_impl
from progs.stdlib.uart import putc, getc
from progs.stdlib.font import decode_font, decode_font_16_12
from soeunasm import emit_fn, const, M, jmp, If
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
    S.puts: puts,
    S.decode_font: decode_font,
    S.decode_font_16_12: decode_font_16_12,
    S.read_sd: read_sd,
    S.write_sd: write_sd,
    S.init_sd: init_sd,
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


def syscall_entry(H):
    with If(H >= len(SYSCALL_MAP_PY)):
        Return()
    H <<= 1
    H += SYSCALL_MAP
    jmp(M[H])
