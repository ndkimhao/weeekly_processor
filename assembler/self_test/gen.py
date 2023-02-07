out_lines = []


out_lines += [
    f'.offset 0xD000',
    f'.boot:',
    f'    mov A, 0xFFFA',
    f'    jne A, 0x00FA, $start_test',
    f'fail:',
    f'    # register A contains failed test',
    f'    halt',
    f'    jmp $fail',
    f'success:',
    f'    mov A, 0xAB',
    f'    mov B, 0xCD',
    f'    mov C, 0xEF',
    f'    mov D, 0x55',
    f'    halt',
]


def gen_cmd(s, indent=1, comment=''):
    if comment:
        comment = ' # ' + comment
    out_lines.append(f'{"    "*indent}{s}{comment}')


def gen_section(label, indent=1, comment=''):
    gen_cmd(f'{label}:', indent=indent-1, comment=comment)


def as_signed(a):
    if a >= 0x8000:
        return -1 - (0xFFFF - a)
    else:
        return a


def calc_ishr(x, y):
    y = y & 0xF
    ny = 16 - y
    neg = x >= 0x8000
    x = x >> y
    if neg:
        x = x | ((0xFFFF >> ny) << ny)
    return x


def append_snippet(p):
    out_lines.extend(['', f'# BEGIN {p}'])
    with open(f'snippets/{p}', 'r') as f:
        out_lines.extend(s.rstrip() for s in f.readlines())
    out_lines.extend([f'# END {p}', ''])


UNIQUE_LABELS = {}


def get_unique_label(name):
    curid = UNIQUE_LABELS.get(name, 0)
    curid += 1
    ret = f'_L_{name}_{curid}'
    UNIQUE_LABELS[name] = curid
    return ret

#########################################################################


gen_section('start_test')


def gen_test_alu2_op(t, op, a, b, expected, expected_aux=None):
    if t:  # separate dest variant
        gen_cmd(f'{op} B, 0x{a:04x}, 0x{b:04x}')
    else:
        gen_cmd(f'mov B, 0x{a:04x}')
        gen_cmd(f'{op} B, 0x{b:04x}')
    gen_cmd(f'jne B, 0x{expected:04x}, $fail')
    if expected_aux is not None:
        gen_cmd(f'jne D, 0x{expected_aux:04x}, $fail')
    gen_cmd('')


def gen_test_alu1_op(t, op, a, expected):
    if t:  # separate dest variant
        gen_cmd(f'{op} B, 0x{a:04x}')
    else:
        gen_cmd(f'mov B, 0x{a:04x}')
        gen_cmd(f'{op} B')
    gen_cmd(f'jne B, 0x{expected:04x}, $fail')
    gen_cmd('')


def gen_test_alu2(t, a, b):
    gen_test_alu2_op(t, 'add', a, b, (a + b) & 0xFFFF)
    gen_test_alu2_op(t, 'sub', a, b, (a - b) & 0xFFFF)
    gen_test_alu2_op(t, 'mul', a, b,
                     (a * b) & 0xFFFF,
                     ((a * b) >> 16) & 0xFFFF)
    gen_test_alu2_op(t, 'imul', a, b,
                     (as_signed(a) * as_signed(b)) & 0xFFFF,
                     ((as_signed(a) * as_signed(b)) >> 16) & 0xFFFF)
    # TODO: div/mod
    gen_test_alu2_op(t, 'shr', a, b, a >> (b & 0xF))
    gen_test_alu2_op(t, 'ishr', a, b, calc_ishr(a, b))
    gen_test_alu2_op(t, 'shl', a, b, (a << (b & 0xF)) & 0xFFFF)
    gen_test_alu2_op(t, 'and', a, b, a & b)
    gen_test_alu2_op(t, 'or', a, b, a | b)
    gen_test_alu2_op(t, 'xor', a, b, a ^ b)

    gen_test_alu1_op(t, 'neg', a, (-as_signed(a)) & 0xFFFF)
    gen_test_alu1_op(t, 'not', a, (~a) & 0xFFFF)
    gen_test_alu1_op(t, 'bool', a, 0 if a == 0 else 1)
    gen_test_alu1_op(t, 'inc', a, (a+1) & 0xFFFF)
    gen_test_alu1_op(t, 'dec', a, (a-1) & 0xFFFF)


ALU_TESTCASES = [
    (True, 0xD230, 0xA012), (True, 0x00AD, 0xDA37), (False, 0xF0AD, 0x2A3F), (False, 0, 0xDEAD)
]
gen_section('alu_test')
for t, a, b in ALU_TESTCASES:
    gen_cmd('', comment=f't={t}, a={a:04x}, b={b:04x}')
    gen_test_alu2(t, a, b)


#########################################################################

def gen_test_jmp(a, b, signed=False, separate_cmp=False):
    if signed:
        assert separate_cmp

    def gen_lbl(): return get_unique_label('test_jmp')
    if signed:
        va, vb = as_signed(a), as_signed(b)
    else:
        va, vb = a, b
    if separate_cmp:
        cmp_cmd = 'cmp' if not signed else 'icmp'
        gen_cmd(f'{cmp_cmd} 0x{a:04x}, 0x{b:04x}')

        def gen_fn(cmd, is_true):
            if is_true:
                lbl = gen_lbl()
                gen_cmd(f'{cmd} ${lbl}')
                gen_cmd(f'jmp $fail')
                gen_section(lbl)
            else:
                gen_cmd(f'{cmd} $fail')
    else:  # separate_cmp = False
        def gen_fn(cmd, is_true):
            if is_true:
                lbl = gen_lbl()
                gen_cmd(f'{cmd} 0x{a:04x}, 0x{b:04x}, ${lbl}')
                gen_cmd(f'jmp $fail')
                gen_section(lbl)
            else:
                gen_cmd(f'{cmd} 0x{a:04x}, 0x{b:04x}, $fail')

    gen_fn('jeq', va == vb)
    gen_fn('jne', va != vb)
    gen_fn('jlt', va < vb)
    gen_fn('jle', va <= vb)
    gen_fn('jgt', va > vb)
    gen_fn('jge', va >= vb)


gen_section('jmp_test')
for (a, b) in ((0xFFAB, 0x2B), (0x2B, 0xFFAB), (0xFFAB, 0xFFAB)):
    gen_test_jmp(a, b)
    gen_test_jmp(a, b, separate_cmp=True)
    gen_test_jmp(a, b, signed=True, separate_cmp=True)


#########################################################################

append_snippet('test_call_ret.asm')

append_snippet('test_mem_access.asm')

append_snippet('test_cmp.asm')

#########################################################################

gen_section('end_of_test')
gen_cmd('jmp $success')

append_snippet('drive_led.asm')

#########################################################################

with open('self_test.asm', 'w') as f:
    f.write('\n'.join(s.rstrip() for s in out_lines) + '\n')
