import string
from dataclasses import dataclass

from mondayasm.builder import ScopeBuilder, Directive, Global, Instruction


@dataclass
class CodeGen:

    def __init__(self):
        # idx, bin, command
        self.buf: list[tuple[int, str, str]] = []
        self.code_offset = 0x0000

        self.cur_codelen = 0
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
        cur_offset = self.code_offset + self.cur_codelen
        for inst in blk.instructions:
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
                cur_offset += instlen

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
                f.write(f'{hexcode:<30} # {idx:4x} | {cmd}\n')
        return self
