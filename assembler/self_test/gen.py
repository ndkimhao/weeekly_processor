out_lines = []


out_lines += [
    f'.offset 0xD000',
    f'.boot:',
    f'    jmp $start_test',
    f'    halt',
    f'fail:',
    f'    # A register contains failed test',
    f'    halt',
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


current_test_index = 0


def gen_store_test_index(next=True):
    global current_test_index
    if next:
        current_test_index += 1
    gen_cmd(f'mov A, 0x{current_test_index:04x}', comment=f'test_{current_test_index}')


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

#########################################################################


gen_section('start_test')


def gen_test_alu2_op(t, op, a, b, fn, fn2=None):
    if t == 3:  # arg variant
        gen_cmd(f'{op} B, 0x{a:04x}, 0x{b:04x}')
    else:
        gen_cmd(f'mov B, 0x{a:04x}')
        gen_cmd(f'{op} B, 0x{b:04x}')
    gen_store_test_index()
    gen_cmd(f'jne $fail, B, 0x{fn(a,b):04x}')
    if fn2 is not None:
        gen_cmd(f'jne $fail, D, 0x{fn2(a,b):04x}')


def gen_test_alu2(t, a, b):
    gen_test_alu2_op(t, 'add', a, b, lambda x, y: (x + y) & 0xFFFF)
    gen_test_alu2_op(t, 'sub', a, b, lambda x, y: (x - y) & 0xFFFF)
    gen_test_alu2_op(t, 'mul', a, b,
                     lambda x, y: (x * y) & 0xFFFF,
                     lambda x, y: ((x * y) >> 16) & 0xFFFF)
    gen_test_alu2_op(t, 'imul', a, b,
                     lambda x, y: (as_signed(x) * as_signed(y)) & 0xFFFF,
                     lambda x, y: ((as_signed(x) * as_signed(y)) >> 16) & 0xFFFF)
    # TODO: div/mod
    gen_test_alu2_op(t, 'shr', a, b, lambda x, y: x >> (y & 0xF))
    gen_test_alu2_op(t, 'ishr', a, b, calc_ishr)


ALU_TESTCASES = [
    (3, 0xD230, 0xA012), (3, 0x00AD, 0xDA37), (2, 0xF0AD, 0x2A3F)
]
for t, a, b in ALU_TESTCASES:
    gen_cmd('', comment=f't={t}, a={a:04x}, b={b:04x}')
    gen_test_alu2(t, a, b)

#########################################################################
gen_section('end_of_test:')
gen_cmd('jmp $success')

with open('self_test.asm', 'w') as f:
    f.write('\n'.join(out_lines) + '\n')
