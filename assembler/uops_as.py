# bits
#  3 - opcode
#  2 - opts
# --
#  4 - reg 1
#  4 - reg 2

import re
import fnmatch

# MUL/DIV always place result to X:Y
REGS = (
    '0', 'A', 'B', 'C', 'D', 'SP', 'PC', 'FL',
    'X', 'Y', 'Z', 'K', '2', '', '', ''
)
assert len(REGS) == 16

CMDS = (
    ('', ('NOP', 'MOV', 'CON', 'MMU')),
    ('MEM', ('LOAD', 'STORE')),
    ('ARG', ('PUT', 'GET_0', 'GET_1', 'GET_2')),
    ('ALU', ('ADD', 'SUB', 'AND', 'OP_COPY')),
    ('CMP', ('UNSIGNED', 'SIGNED', 'OP_COPY')),
    ('CMV', ('EQ', 'LT', 'LE', 'COND_COPY')),  # conditional move
    ('_', ()),
    ('BRK', ()),  # spacer between blocks
)
assert len(CMDS) == 8

REGS_MAP = {r: i for i, r in enumerate(REGS) if r != '_'}
CMDS_MAP = {}
for cmdid, (cmd, opts) in enumerate(CMDS):
    if cmd != '':
        CMDS_MAP[cmd] = {opt: cmdid * 4 + optid
                         for optid, opt in enumerate(opts)}
    else:
        for optid, opt in enumerate(opts):
            CMDS_MAP[opt] = {'': cmdid * 4 + optid}

# print(REGS_MAP)
# print(CMDS_MAP)

out = []
label_map = {}
const_map = {}
const_map_cnt = {}
romlen = 0

with open('uops.asm', 'r') as f:
    lines = f.readlines()

lines_proc = [re.sub(r'^(.*)#.*$', r'\1', s).strip() for s in lines]

fallthrough = False


def out_cmd(bincode, origs, comma=','):
    global romlen
    if bincode is not None:
        hexcode = f'{int(bincode, 2):04x}'
        # out.append(f'\t"{bincode}"{comma} -- {romlen:03x}. {hexcode} | {origs}')
        out.append(f'\t/* {romlen:03} */ 13x"{hexcode}"{comma} -- {origs}')
        romlen += 1
    else:
        out.append(f'\t{" ":21}-- {origs}')


gen_names = []
gen_startline = 0

lineidx = -1
while lineidx+1 < len(lines_proc):
    lineidx += 1
    s = lines_proc[lineidx]
    origs = lines[lineidx].rstrip()

    gen_curname = gen_names[0] if len(gen_names) > 0 else None

    if s == '' or s.endswith(':'):
        if s.endswith(':'):
            lbl = s[:-1]
            if gen_curname:
                lbl = lbl.replace('$$', gen_curname)
                origs = origs.replace('$$', gen_curname)
            out_cmd('1'*13 if not fallthrough else None, origs)
            label_map[lbl] = romlen
        elif origs != '':
            out_cmd(None, origs)
        continue
    ps = [s for s in re.split(' |,', s) if s != '']
    # print(origs)
    fallthrough = False
    if ps[-1] == '!FALLTHROUGH':
        fallthrough = True
        ps.pop()

    ps[0] = ps[0].upper()
    if ps[0] == '.GENERATE':
        gen_names = ps[1:]
        gen_startline = lineidx+1
        continue
    elif ps[0] == '.END_GENERATE':
        if len(gen_names) > 0:
            gen_names = gen_names[1:]
        if len(gen_names) > 0:
            lineidx = gen_startline-1
        continue

    if gen_curname:
        pattern = ps[0][1:-1]
        ps = ps[1:]
        if not fnmatch.fnmatch(gen_curname, pattern.replace('-', '?')):
            continue

    ps[0] = ps[0].upper()
    cmap = CMDS_MAP[ps[0]]
    cid = cmap[ps[-1]] if len(cmap) > 1 else cmap['']
    nargs = len(ps) - 1 - (1 if len(cmap) > 1 else 0)

    if ps[0] == 'CON':  # load constant
        nargs -= 1

    argstr = ''
    aid = 0
    for i in range(nargs):
        aid = REGS_MAP[ps[1 + i]]
        argstr += f'{aid:04b}'

    if ps[0] == 'CON':  # load constant
        v = ps[-1]
        if v.startswith('0x'):
            v = int(v[2:], 16)
        else:
            v = int(v, 10)
        if v not in const_map:
            const_map[v] = max(list(const_map.values()) + [-1]) + 1
        argstr += f'{const_map[v]:04b}'
        const_map_cnt[v] = const_map_cnt.get(v, 0) + 1

    while len(argstr) < 8:
        argstr += f'{aid:04b}'  # repeat last register

    bincode = f'{cid:05b}{argstr}'
    out_cmd(bincode, origs)

out_cmd('1'*13, 'end_of_rom:', ' ')

out = [
    f'-- ##############################################################',
    f'-- ## BEGIN UOPS ROM',
    f'-- ##############################################################',
    f'',
    f'type TArrUtopROM is array (0 to {romlen}-1) of TUop;',
    f'constant uops_rom : TArrUtopROM := ('
] + out + [
    f'); -- uops_rom ---------------------------------------------------',
    f''
]

for lbl, idx in label_map.items():
    out.append(f'constant label_{lbl} : integer := {idx};')

out += [
    f'',
    f'-- ##############################################################',
    f'-- ## END UOPS ROM',
    f'-- ##############################################################',
    f'', f'', f'',
]

const_map_r = {v: k for k, v in const_map.items()}
out += [
    f'type TArrUopsConstsROM is array (0 to {len(const_map_r)}-1) of TData;',
    f'constant uops_consts_rom : TArrUopsConstsROM := (',
]
for i in range(16):
    if i not in const_map_r:
        break
    v = const_map_r[i]
    comma = ',' if i+1 in const_map_r else ' '
    out.append(f'\tx"{v:04X}"{comma} -- used {const_map_cnt[v]} times')
out += [
    f'); -- uops_consts_rom -------------------------------------------',
]

out += [f'', f'',]
CMDS_MAP_HEAD_ID = {cmd: i for i, (cmd, _) in enumerate(CMDS)}
for cmd, opts in CMDS_MAP.items():
    if cmd == '_':
        continue
    if len(opts) == 1:
        out.append(f'constant UOP_{cmd} : TUcodeTail := "{opts[""] % 4:02b}";')
    else:
        out.append(
            f'constant UOP_{cmd}_HEAD : TUcodeHead := "{CMDS_MAP_HEAD_ID[cmd]:03b}";')
        for opt, oid in opts.items():
            out.append(
                f'constant UOP_{cmd}_{opt} : TUcodeTail := "{oid % 4:02b}";')


out += [f'', f'',]
for reg, rid in REGS_MAP.items():
    if reg != '':
        out.append(f'constant REGID_{reg} : integer := {rid};')


with open('uops_rom.vhd', 'w') as f:
    f.write('\n'.join(out) + '\n')

# print(label_map)
