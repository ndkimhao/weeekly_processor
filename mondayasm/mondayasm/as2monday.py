import sys
import re

with open(sys.argv[1], 'r') as f:
    lines_raw = f.readlines()

lines = [re.sub(r'^(.*)#.*$', r'\1', s).strip() for s in lines_raw]

# state
out = []


def out_cmd(pycode, origs):
    out.append((pycode, origs))


def assemble():
    global offset
    for lineidx, s in enumerate(lines):
        origs = lines_raw[lineidx].rstrip()
        # print(origs)
        if s == '' or s.endswith(':'):
            if s.endswith(':'):
                out_cmd(f'Label(\'{s[:-1]}\')', s)
            else:
                out_cmd('', origs)
            continue

        ps = s.strip().split(' ', 1)
        if len(ps) == 1:
            ps.append('')

        pargs = [s.replace(' ', '') for s in ps[1].split(',')]
        pargs = [s for s in pargs if s != '']

        cmd = ps[0].upper()
        nargs = len(pargs)

        pyargs = []

        for i in range(nargs):
            arg = pargs[i]
            if arg.startswith('$'):
                arg = f'ConstLabel(\'{arg[1:]}\')'

            pyargs.append(arg)

        ####
        out_cmd(f'{cmd}({", ".join(pyargs)})', origs)


assemble()

out_lines = []
for pycode, origs in out:
    out_lines.append(f'{pycode:<50} # {origs}')

with open('pyasm.py', 'w') as f:
    f.write('\n'.join(out_lines) + '\n')
