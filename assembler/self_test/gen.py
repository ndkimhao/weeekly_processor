import itertools
import random

out_lines = []


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


append_snippet('preamble.asm')

gen_section('start_test')

ALU_DIRECT_REG = False

def gen_test_alu2_op(t, op, a, b, expected, expected_aux=None):
    if ALU_DIRECT_REG:
        gen_cmd(f'mov C, 0x{a:04x}')
        gen_cmd(f'mov D, 0x{b:04x}')
        if t:  # separate dest variant
            gen_cmd(f'{op} B, C, D')
        else:
            gen_cmd(f'mov B, C')
            gen_cmd(f'{op} B, D')
    else:
        if t:  # separate dest variant
            gen_cmd(f'{op} B, 0x{a:04x}, 0x{b:04x}')
        else:
            gen_cmd(f'mov B, 0x{a:04x}')
            gen_cmd(f'{op} B, 0x{b:04x}')
    gen_cmd(f'jne B, 0x{expected:04x}, $fail')
    if expected_aux is not None:
        gen_cmd(f'jne H, 0x{expected_aux:04x}, $fail')
    gen_cmd('')


def gen_test_alu1_op(t, op, a, expected):
    if ALU_DIRECT_REG:
        gen_cmd(f'mov C, 0x{a:04x}')
        if t:  # separate dest variant
            gen_cmd(f'{op} B, C')
        else:
            gen_cmd(f'mov B, C')
            gen_cmd(f'{op} B')
    else:
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
ALU_DIRECT_REG = False
for t, a, b in ALU_TESTCASES:
    gen_cmd('', comment=f't={t}, a={a:04x}, b={b:04x}')
    gen_test_alu2(t, a, b)

gen_section('alu_test_direct_reg')
ALU_DIRECT_REG = True
for t, a, b in ALU_TESTCASES:
    gen_cmd('', comment=f'(direct) t={t}, a={a:04x}, b={b:04x}')
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

ALU_OPS_LIST = [
    ('add', lambda a, b: (a + b) & 0xFFFF),
    ('sub', lambda a, b: (a - b) & 0xFFFF),
    ('mul', lambda a, b: (a * b) & 0xFFFF),
    ('imul', lambda a, b: (as_signed(a) * as_signed(b)) & 0xFFFF),
    ('shr', lambda a, b: a >> (b & 0xF)),
    ('ishr', lambda a, b: calc_ishr(a, b)),
    ('shl', lambda a, b: (a << (b & 0xF)) & 0xFFFF),
    ('and', lambda a, b: a & b),
    ('or', lambda a, b: a | b),
    ('xor', lambda a, b: a ^ b),
]
TEST_GET_ARG_RND = random.Random(3006)


def gen_test_get_arg_impl(nargs, x=None, y=None, z=None):
    if nargs == 1:
        gen_cmd(f'push {x[0]}')
        gen_cmd(f'pop D')
        gen_cmd(f'jne D, 0x{x[1]:04x}, $fail')
        return
    if x[1] < 0x6000:
        if nargs == 2:
            gen_cmd(f'mov [{x[0]}], {y[0]}')
            gen_cmd(f'jne [0x{x[1]:04x}], 0x{y[1]:04x}, $fail')
            return
        if nargs == 3:
            op, fn = TEST_GET_ARG_RND.choice(ALU_OPS_LIST)
            gen_cmd(f'{op} [{x[0]}], {y[0]}, {z[0]}')
            gen_cmd(f'jne [0x{x[1]:04x}], 0x{fn(y[1], z[1]):04x}, $fail')
            return
    else:
        return
    assert False


def gen_test_get_arg():
    gen_section('test_uop_get_arg')
    gen_cmd('mov SP, 0x7000')
    A = 0x00AA
    B = 0x00BB
    G = 0x0155
    gen_cmd(f'mov A, 0x{A:04x}')
    gen_cmd(f'mov B, 0x{B:04x}')
    gen_cmd(f'mov G, 0x{G:04x}')

    VALUES = [
        ('A', A),  # 1 byte
        ('G', G),  # 1 byte, aux reg
        ('A*2', A*2),  # 1 byte
        ('A*4 + -10', A*4 - 10),  # 2 bytes
        ('0xFADE + A', (0xFADE + A) & 0xFFFF),  # 3 bytes
        ('A*4 + B', (A*4 + B) & 0xFFFF),  # 2 bytes
        ('-123', -123 & 0xFFFF),  # 2 bytes
        ('12345', 12345),  # 3 bytes
    ]
    list3 = list(itertools.product(VALUES, VALUES, VALUES))
    list2 = list(itertools.product(VALUES, VALUES))
    list1 = list(VALUES.copy())
    TEST_GET_ARG_RND.shuffle(list3)
    TEST_GET_ARG_RND.shuffle(list2)
    TEST_GET_ARG_RND.shuffle(list1)
    for a1, a2, a3 in list3:
        gen_test_get_arg_impl(3, a1, a2, a3)
    for a1, a2 in list2:
        gen_test_get_arg_impl(2, a1, a2)
    for a1 in list1:
        gen_test_get_arg_impl(1, a1)

    lbl = get_unique_label('test_uop_get_arg')
    lbl_okay = get_unique_label('test_uop_get_arg')
    gen_cmd(f'call ${lbl}')
    gen_cmd(f'jne C, 0xADFE, $fail')
    gen_cmd(f'jmp ${lbl_okay}')
    gen_section(lbl)
    gen_cmd(f'mov C, 0xADFE')
    gen_cmd(f'ret')
    gen_cmd(f'jmp $fail')
    gen_section(lbl_okay)


gen_test_get_arg()

#########################################################################

append_snippet('test_uop_rom.asm')

append_snippet('test_aux_regs.asm')

append_snippet('test_call_ret.asm')

append_snippet('test_mem_access.asm')

append_snippet('test_cmp.asm')

#########################################################################

gen_section('end_of_test')
gen_cmd('mov A, 0xDEAD')
gen_cmd('mov B, 0xBEEF')
gen_cmd('mul C, A, B')
gen_cmd('jmp $success')

# append_snippet('drive_led.asm')

#########################################################################

with open('self_test.asm', 'w') as f:
    f.write('\n'.join(s.rstrip() for s in out_lines) + '\n')
