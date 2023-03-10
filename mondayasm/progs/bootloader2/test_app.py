from progs.stdlib import printf
from progs.stdlib.devices import LED, SYSCALL_ENTRY
from progs.stdlib.syscall import syscall, S
from soeunasm import Reg, call, halt, init_code_gen, const, M

CODE_OFFSET = 0x5100


def main(SP):
    M[LED] @= 0x00af
    call(printf, const('before SP=%x\n'), SP)
    syscall(S.printf, const('test %d %x\n'), 123, 0xaaff)
    call(printf, const('after SP=%x\n'), SP)

    call(printf, const('before SP=%x\n'), SP)
    syscall(S.printf, const('test 2 %d %x\n'), 11, 0xaaff)
    call(printf, const('after SP=%x\n'), SP)

    syscall(S.printf, const('okay %d %x\n'), 22, 0xaaff)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('test_app.asm')
