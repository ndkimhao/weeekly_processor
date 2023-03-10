from progs.stdlib.syscall import syscall, S
from soeunasm import Reg, call, halt, init_code_gen, const

CODE_OFFSET = 0x5000


def main():
    syscall(S.printf, const('test %d %x\n'), 123, 0xaaff)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('test_app.asm')
