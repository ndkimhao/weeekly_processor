from progs.benchmark.timeutil import print_time, wait_clean_uart_buffer
from progs.stdlib.devices import M_CLK_COUNT_0, M_CLK_COUNT_1, M_CLK_COUNT_2, LED, M_INSTRUCTIONS_COUNT_0, \
    M_INSTRUCTIONS_COUNT_1, M_INSTRUCTIONS_COUNT_2
from progs.stdlib.syscall import syscall, S
from soeunasm import Reg, call, halt, init_code_gen, ForRange, M, const, global_var

CODE_OFFSET = 0x5000


def find_fib_truth():
    A = 0
    B = 1
    for _ in range(20_000_000):
        C = (A + B) & 0xFFFF
        A = B
        B = C
    return A


def find_fib(A, B, C, D, E, F, G, H):
    call(wait_clean_uart_buffer)
    call(print_time)
    A @= 0
    B @= 1
    with ForRange(E, 0, 400):
        with ForRange(F, 0, 50000):
            C @= A + B
            A @= B
            B @= C
    call(print_time)
    syscall(S.putc, '\n')
    H @= A


def main(A, H):
    syscall(S.puts, const('find_fib:\n'))
    with ForRange(A, 0, 5):
        call(find_fib)

    syscall(S.printf, const('res = %d, truth = %d\n'), H, find_fib_truth())
    syscall(S.puts, const('\n\n'))


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('find_fib.asm')
