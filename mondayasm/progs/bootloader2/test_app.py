from progs.stdlib import printf
from progs.stdlib.devices import LED, SYSCALL_ENTRY
from progs.stdlib.syscall import syscall, S
from soeunasm import Reg, call, halt, init_code_gen, const, M

CODE_OFFSET = 0x5100


def main(A, B, SP):
    M[LED] @= 0x00af
    syscall(S.printf, const('test %d %x\n'), 123, 0xaaff)

    syscall(S.printf, const('test 2 %d %x\n'), 11, 0xaaff)

    syscall(S.printf, const('okay %d %x\n'), 22, 0xaaff)

    syscall(S.puts, const('test puts %d %x\n'), 22, 0xaaff)

    syscall(S.printf, const('okay %d %x\n'), 22, 0xaaff)

    A @= 0x8a1b
    syscall(S.printf, const('%x\n'), A)
    B @= A.ror(4)
    syscall(S.printf, const('%x\n'), B)
    B @= A.ror(8)
    syscall(S.printf, const('%x\n'), B)
    B @= A.ror(15)
    syscall(S.printf, const('%x\n'), B)
    B @= A.ror(16)
    syscall(S.printf, const('%x\n'), B)

if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('test_app.asm')
