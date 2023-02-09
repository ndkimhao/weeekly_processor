import string
from dataclasses import dataclass

from mondayasm.builder import ScopeBuilder, Directive, Global, Instruction


@dataclass
class CodeGen:

    def __init__(self):
        # idx, bin, command
        self.buf: list[tuple[int, str, str]] = []
        self.code_offset = 0xd000

        self.romlen = 0
        self.label_map: dict[str, int] = {}

    def _translate_bincode(self, s: str) -> tuple[str, int]:
        hexcode = ''
        instlen = 0
        s = s.replace(' ', '')
        while len(s) > 0:
            if len(hexcode) > 0:
                hexcode += ' '
            if s.startswith('$'):
                end = s.index('}')
                hexcode += s[:end + 1]
                s = s[end + 1:]
                instlen += 2
            else:
                hexcode += f'{int(s[:8], 2):02x}'
                s = s[8:]
                instlen += 1
        return hexcode, instlen

    def _gen_block(self, blk: ScopeBuilder):
        for inst in blk.instructions:
            cur_offset = self.code_offset + self.romlen
            if isinstance(inst, Directive):
                assert inst.name in ('.label',)
                lbl = inst.args[0]
                assert lbl not in self.label_map
                self.buf.append((cur_offset, '', f'{lbl}:'))
                self.label_map[lbl] = cur_offset
            else:
                assert isinstance(inst, Instruction)
                hexcode, instlen = self._translate_bincode(inst.bincode)
                self.buf.append((cur_offset, hexcode, '  ' + str(inst)))
                self.romlen += instlen

    def _fix_refs(self):
        label_hexmap = {lbl: f'{v % 256:02x} {v // 256:02x}' for lbl, v in self.label_map.items()}
        new_buf = []
        for idx, hexcode, cmd in self.buf:
            if '$' in hexcode:
                hexcode = string.Template(hexcode).substitute(label_hexmap)
            new_buf.append((idx, hexcode, cmd))
        self.buf = new_buf

    def compile(self) -> 'CodeGen':
        for blk in Global.blocks.values():
            if blk.name in self.label_map:
                continue
            self._gen_block(blk)
        self._fix_refs()
        return self

    def write(self, file) -> 'CodeGen':
        with open(file, 'w') as f:
            for idx, hexcode, cmd in self.buf:
                idxstr = f'{idx:x}' if hexcode != '' else ''
                f.write(f'{hexcode:<30} # {idxstr:>4} | {cmd}\n')
        return self

    def write_vhd(self, file) -> 'CodeGen':
        with open(file, 'w') as f:
            f.write(f'''
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := {self.romlen};
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
'''
                    )

            for idx, hexcode, cmd in self.buf:
                idxstr = f'{idx:x}' if hexcode != '' else ''
                hexline = ''.join([f'x"{s}",' for s in hexcode.split(' ') if s != ''])
                f.write(f'    {hexline:<48} -- {idxstr:>4} | {cmd}\n')

            f.write('''
    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
'''
                    )
        return self
