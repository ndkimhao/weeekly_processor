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
    'E', 'F', 'G', 'H', '1', '2', '0x00FF', '0xFF00',
)

CMDS = (
    ('', ('NULL', 'MOV', 'MMU')),
    ('MEM', ('LOAD', 'STORE')),
    ('ARG', ('GET', 'PUT')),
    ('ALU', ('ADD', 'SUB', 'AND', 'OP_COPY')),
    ('CMP', ('UNSIGNED', 'SIGNED')),
    ('JMP', ('ALWAYS', 'COND_COPY')),
)

REGS_MAP = {r: i for i, r in enumerate(REGS) if r != ''}
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
    fallthrough = False
    if ps[-1] == 'FALLTHROUGH':
        fallthrough = True
        ps.pop()

    cmap = CMDS_MAP[ps[0]]
    cid = cmap[ps[-1]] if len(cmap) > 1 else cmap['']
    nargs = len(ps) - 1 - (1 if len(cmap) > 1 else 0)

    argstr = ''
    for i in range(nargs):
        aid = REGS_MAP[ps[1 + i]]
        argstr += f'{aid:04b}'
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
    '); -- uops_rom ---------------------------------------------------',
    ''
]

for lbl, idx in label_map.items():
    out.append(f'constant uops_label_{lbl} : integer := {idx};')

out += [
    f'',
    f'-- ##############################################################',
    f'-- ## END UOPS ROM',
    f'-- ##############################################################',
    f'',
]

with open('uops_rom.vhd', 'w') as f:
    f.write('\n'.join(out) + '\n')

# print(label_map)
