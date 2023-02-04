# bits
#  1 - end of stream
#  3 - opcode
#  2 - opts
# --
#  4 - reg 1
#  4 - reg 2

import re

REGS = (
    '0', 'A', 'B', 'C', 'D', 'SP', 'PC', 'FL',
    'E', 'F', 'G', 'H', '2',
)

CMDS = (
    ('', ('NULL', 'MOV', 'CON', 'MMU')),
    ('MEM', ('LOAD', 'STORE')),
    ('ARG', ('GET', 'PUT')),
    ('ALU', ('ADD', 'SUB', 'AND', 'OP_COPY')),
    ('CMP', ('UNSIGNED', 'SIGNED')),
    ('JMP', ('ALWAYS', 'COND_COPY')),
)

REGS_MAP = {r: i for i, r in enumerate(REGS)}
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


for lineidx, s in enumerate(lines_proc):
    origs = lines[lineidx].rstrip()
    if s == '' or s.endswith(':'):
        if origs != '':
            out.append(f'\t{" ":18}--      | {origs}')
        if s.endswith(':'):
            label_map[s[:-1]] = romlen
        continue
    ps = [s for s in re.split(' |,', s) if s != '']
    # print(origs)
    fallthrough = False
    if ps[-1] == 'FALLTHROUGH':
        fallthrough = True
        ps.pop()

    cmap = CMDS_MAP[ps[0]]
    cid = cmap[ps[-1]] if len(cmap) > 1 else cmap['']
    nargs = len(ps) - 1 - (1 if len(cmap) > 1 else 0)

    if ps[0] == 'CON':  # load constant
        nargs -= 1

    argstr = ''
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
        argstr += '0000'

    endstream = '1'
    for j in range(lineidx+1, len(lines_proc)):
        x = lines_proc[j]
        if x.endswith(':'):
            break
        elif x != '':
            endstream = '0'
            break
    if fallthrough:
        endstream = '0'

    comma = ' '
    for j in range(lineidx+1, len(lines_proc)):
        x = lines_proc[j]
        if x != '' and not x.endswith(':'):
            comma = ','

    romlen += 1
    bincode = f'{endstream}{cid:05b}{argstr}'
    hexcode = f'{int(bincode, 2):04x}'
    out.append(f'\t"{bincode}"{comma} -- {hexcode} | {origs}')

out = [
    f'-- ##############################################################',
    f'-- ## BEGIN UOPS ROM',
    f'-- ##############################################################',
    f'',
    f'type TArrUtopROM is array (0 to {romlen}-1) of TUop;',
    f'signal uops_rom : TArrUtopROM := ('
] + out + [
    f'); -- uops_rom ---------------------------------------------------',
    f''
]

for lbl, idx in label_map.items():
    out.append(f'constant uops_label_{lbl} : integer := {idx};')

out += [
    f'',
    f'-- ##############################################################',
    f'-- ## END UOPS ROM',
    f'-- ##############################################################',
    f'', f'', f'',
]

out += [
    f'type TArrUopsConstsROM is array (0 to 16-1) of TData;',
    f'signal uops_consts_rom : TArrUopsConstsROM := (',
]
const_map_r = {v: k for k, v in const_map.items()}
for i in range(16):
    v = const_map_r.get(i, 0)
    notes = f'used {const_map_cnt[v]} times' if v in const_map_cnt else 'unused'
    comma = ',' if i < 15 else ' '
    out.append(f'\tx"{v:04X}"{comma} -- {notes}')
out += [
    f'); -- uops_consts_rom -------------------------------------------',
]

with open('uops_rom.vhd', 'w') as f:
    f.write('\n'.join(out) + '\n')

# print(label_map)
