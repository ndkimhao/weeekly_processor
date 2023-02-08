import sys
import re
import shlex

CMDS = (
    ("ADD", 2), ("SUB", 2), ("MUL", 2), ("IMUL", 2), ("DIV", 2), ("IDIV", 2), ("MOD", 2), ("IMOD", 2),
    ("SHR", 2), ("ISHR", 2), ("SHL", 2), ("AND", 2), ("OR", 2), ("XOR", 2), ("NEG", 1), ("NOT", 1),
    ("BOOL", 1), ("INC", 1), ("DEC", 1), ("GETF", 1), ("CMP", 2), ("MMAP", 3), ("JMP", 1), ("CALL", 1),
    ("MOV", 2), ("BMOV", 2), ("JEQ", 1), ("JNE", 1), ("JLT", 1), ("JLE", 1), ("JGT", 1), ("JGE",  1),
    ("ADD", 3), ("SUB", 3), ("MUL", 3), ("IMUL", 3), ("DIV", 3), ("IDIV", 3), ("MOD", 3), ("IMOD", 3),
    ("SHR", 3), ("ISHR", 3), ("SHL", 3), ("AND", 3), ("OR", 3), ("XOR", 3), ("NEG", 2), ("NOT", 2),
    ("BOOL", 2), ("INC", 2), ("DEC", 2), ("SETF", 1), ("ICMP", 2), ("UMAP", 1), ("HALT", 0), ("RET", 0),
    ("PUSH", 1), ("POP", 1), ("JEQ", 3), ("JNE", 3), ("JLT", 3), ("JLE", 3), ("JGT", 3), ("JGE", 3),
)
assert len(CMDS) == 64
REGS = (
    '0', 'A', 'B', 'C', 'D', 'SP', 'PC'
)
assert len(REGS) == 7
MULT_MAP = {4: 3, 2: 2, 1: 1, 0: 0}

CMDS_MAP = {v: i for i, v in enumerate(CMDS)}
REGS_MAP = {v: i for i, v in enumerate(REGS)}

with open(sys.argv[1], 'r') as f:
    lines_raw = f.readlines()

lines = [re.sub(r'^(.*)#.*$', r'\1', s).strip() for s in lines_raw]

# state
romlen = 0
offset = 0
out = []
label_map = {}


def bool2bin(v):
    return '1' if v else '0'


def out_cmd(bincode, origs):
    global romlen
    if bincode is not None:
        bc = bincode.replace(' ', '')
        out.append((romlen + offset, bc, origs))
        romlen += len(bc) // 8
        assert len(bc) % 8 == 0, bincode
    else:
        out.append((romlen + offset, '', origs))


def parse_int(s: str):
    s = s.lower().replace('_', '')
    if s.startswith('\''):
        assert len(s) == 3 and s.endswith('\'')
        return ord(s[1])
    if s.startswith('0x'):
        return int(s[2:], 16)
    if s.startswith('0b'):
        return int(s[2:], 2)
    if len(s) > 1 and s.startswith('0'):
        return int(s[1:], 8)
    if s.startswith('0b'):
        return int(s[2:], 2)
    return int(s, 10)


def assemble(final):
    global offset
    for lineidx, s in enumerate(lines):
        origs = lines_raw[lineidx].rstrip()
        # print(origs)
        if s == '' or s.endswith(':'):
            out_cmd('', origs)
            if s.endswith(':'):
                label_map[s[:-1]] = romlen + offset
            continue

        bincode = ''

        ps = s.strip().split(' ', 1)
        if len(ps) == 1:
            ps.append('')

        pargs = [s.replace(' ', '') for s in ps[1].split(',')]
        pargs = [s for s in pargs if s != '']

        cmd = ps[0].upper()
        if cmd.startswith('.'):
            cmd = cmd.lower()
            assert cmd in ('.string', '.db', '.dw', '.offset')
            if cmd == '.string':
                shlexer = shlex.shlex(origs, posix=True)
                stringparts = list(shlexer)[2:]
                rawstring = ''.join(stringparts) + '\0'
                rawstring = rawstring.replace('\\n', '\n')
                for c in rawstring:
                    bincode += f'{ord(c):08b} '
            elif cmd == '.dw':
                for arg in pargs:
                    aint = parse_int(arg)
                    bincode += f'{aint % 256:08b} '
                    bincode += f'{aint // 256:08b} '
            elif cmd == '.db':
                for arg in pargs:
                    if arg.startswith('\''):
                        assert arg.endswith('\'')
                        bincode += f'{ord(arg[1]):08b} '
                    else:
                        bincode += f'{parse_int(arg):08b} '
            elif cmd == '.offset':
                offset = parse_int(pargs[0])
            out_cmd(f'{bincode}', origs)
            continue

        nargs = len(pargs)
        assert (cmd, nargs) in CMDS_MAP, (lineidx, origs)
        opcode = CMDS_MAP[(cmd, nargs)]

        if cmd.upper().startswith('J') and nargs == 3:
            assert not pargs[0].strip().startswith('$'), 'condition jmp: put target address at the end'

        arg1_indirect = nargs >= 1 and pargs[0].startswith('[')
        arg2_indirect = nargs >= 2 and pargs[1].startswith('[')

        bincode += f'{opcode:06b}{bool2bin(arg1_indirect)}{bool2bin(arg2_indirect)} '
        bintail = ''

        for i in range(nargs):
            arg = pargs[i]
            if arg.startswith('['):
                assert arg.endswith(']'), (lineidx, origs)
                arg = arg[1:-1]
            if arg.startswith('$'):
                if final:
                    lbl = arg[1:]
                    assert lbl in label_map, (lineidx, origs)
                    arg = f'{label_map[lbl]}'
                else:
                    arg = '0xFFFF'  # dummy address

            arg = arg.upper()
            pa = arg.split('+')
            if len(pa) == 1:
                pa.append('0')
            ax = pa[0].split('*')
            if len(ax) == 1:
                a, b, x = ax[0], pa[1], '1'
            else:
                a, b, x = ax[0], pa[1], ax[1]
                if a in map(str, MULT_MAP.keys()) and (x != '0' and x in REGS_MAP):
                    a, x = x, a

            #  a  b  x -> a*(2^x) + b
            # 00011100
            if b == '0' and x == '1':
                if a in REGS_MAP:
                    bincode += f'{REGS_MAP[a]:03b}00000'
                else:
                    # immediate value
                    a = parse_int(a)
                    if -128 <= a < 128:
                        bincode += f'00011100 '
                        bintail += f'{a & 0xFF:08b} '
                    else:
                        if a < 0:
                            assert -(2**15) <= a < (2**15)
                            a = a & 0xFFFF
                        else:
                            assert 0 <= a < (2**16), (lineidx, origs)
                        bincode += f'11100000 '
                        bintail += f'{a % 256:08b} '
                        bintail += f'{a // 256:08b} '
            elif a in REGS_MAP:
                bincode += f'{REGS_MAP[a]:03b}'
                if b in REGS_MAP:
                    bincode += f'{REGS_MAP[b]:03b}'
                else:
                    # b is constant
                    b = parse_int(b)
                    assert -128 <= b < 128, (lineidx, origs)
                    bincode += f'111'
                    bintail += f'{b & 0xFF:08b}'
                x = parse_int(x)
                assert x in MULT_MAP, (lineidx, origs)
                bincode += f'{MULT_MAP[x]:02b}'
            else:
                assert b in REGS_MAP, (lineidx, origs)
                a = parse_int(a)
                assert 0 <= a and a < (2**16), (lineidx, origs)
                bincode += f'111{REGS_MAP[b]:03b}00 '
                bintail += f'{a % 256:08b} '
                bintail += f'{a // 256:08b} '
        ####
        out_cmd(f'{bincode} {bintail}', origs)


assemble(False)  # collect labels
romlen = 0
offset = 0
out = []
assemble(True)

out_cmd(f'', '')
out_cmd(f'{CMDS_MAP[("HALT",0)]:06b}00', '__end_of_rom: halt')

out_lines = []
out_lines += [
    f'-- ##############################################################',
    f'-- ## BEGIN ROM',
    f'-- ##############################################################',
    f'',
    f'constant ROMSize : integer := {romlen};',
    f'type TArrROM is array (0 to ROMSize-1) of TByte;',
    f'constant arr_rom : TArrROM := (',
]
countprinted = 0
for romidx, bincode, origs in out:
    hexline = ''
    assert len(bincode) % 8 == 0
    while len(bincode) > 0:
        head = bincode[:8]
        bincode = bincode[8:]
        countprinted += 1
        comma = ',' if countprinted < romlen else ' '
        hexline += f'x"{int(head, 2):02x}"{comma}'
    romidxstr = f'{romidx:3x}' if hexline != '' else ''
    out_lines.append(f'\t/* {romidxstr:>4} */ {hexline:48} -- {origs}'.rstrip())
out_lines += [
    f'); -- arr_rom -------------------------------------------',
    f'',
    f'-- ##############################################################',
    f'-- ## END ROM',
    f'-- ##############################################################',
]

with open('code_rom.vhd', 'w') as f:
    f.write(
        '''
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is
''')
    f.write('\n'.join(out_lines) + '\n')
    f.write('\nend package;\n')
