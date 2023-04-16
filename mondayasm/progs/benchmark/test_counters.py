from progs.stdlib.devices import M_CLK_COUNT_0, M_CLK_COUNT_1, M_CLK_COUNT_2, LED, M_INSTRUCTIONS_COUNT_0, \
    M_INSTRUCTIONS_COUNT_1, M_INSTRUCTIONS_COUNT_2
from progs.stdlib.syscall import syscall, S
from soeunasm import Reg, call, halt, init_code_gen, ForRange, M, const

CODE_OFFSET = 0x5000


def delay_raw(A, B):
    with ForRange(A, 0, 0xFFFE):
        with ForRange(B, 0, 32):
            M[LED] @= A >> 8
    M[LED] @= 0


def test_clk(A, B, C, D):
    B @= M_CLK_COUNT_0
    C @= M_CLK_COUNT_1
    D @= M_CLK_COUNT_2
    syscall(S.printf, const('CLK: %x %x %x\n'), D, C, B)
    call(delay_raw)
    C @= M_CLK_COUNT_1
    D @= M_CLK_COUNT_2
    syscall(S.printf, const('CLK: %x %x %x\n'), D, C, B)


def test_inst(A, B, C, D):
    B @= M_INSTRUCTIONS_COUNT_0
    C @= M_INSTRUCTIONS_COUNT_1
    D @= M_INSTRUCTIONS_COUNT_2
    syscall(S.printf, const('INST: %x %x %x\n'), D, C, B)
    call(delay_raw)
    C @= M_INSTRUCTIONS_COUNT_1
    D @= M_INSTRUCTIONS_COUNT_2
    syscall(S.printf, const('INST: %x %x %x\n'), D, C, B)


def main(A):
    with ForRange(A, 0, 5):
        call(test_clk)
        call(test_inst)
        syscall(S.puts, const('\n'))


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('test_counters.asm')
