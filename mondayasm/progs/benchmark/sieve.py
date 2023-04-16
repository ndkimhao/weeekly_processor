import math

from progs.benchmark.timeutil import print_time, wait_clean_uart_buffer
from progs.stdlib.devices import M_CLK_COUNT_0, M_CLK_COUNT_1, M_CLK_COUNT_2, LED, M_INSTRUCTIONS_COUNT_0, \
    M_INSTRUCTIONS_COUNT_1, M_INSTRUCTIONS_COUNT_2
from progs.stdlib.syscall import syscall, S
from soeunasm import Reg, call, halt, init_code_gen, ForRange, M, const, global_var, getb, If, setb
from soeunasm.free_cmds import clrb

CODE_OFFSET = 0x5000

arr_is_prime_size = 65536 // 8 // 2
arr_is_prime = global_var('is_prime', size=arr_is_prime_size * 2)

N = 65000
N_SQRT = int(math.sqrt(N))


# def count_primes(n):
#     ctr = 0
#
#     for num in range(n):
#         if num <= 1:
#             continue
#         for i in range(2, num):
#             if (num % i) == 0:
#                 break
#         else:
#             ctr += 1
#
#     return ctr
#
#
# print('truth = ', count_primes(N))


def sieve(A, B, C, D, E, F, G, H):
    call(wait_clean_uart_buffer)
    call(print_time)

    with ForRange(A, 0, arr_is_prime_size * 2, 2):
        arr_is_prime.addr_add(A) @ 0xFFFF

    arr_is_prime.addr_add(0) @ (0xFFFF - 0x3)  # prime[0] = prime[1] = False
    with ForRange(A, 2, N_SQRT + 1):
        B @= A >> 4
        B <<= 1
        C @= getb(arr_is_prime.addr_add(B), A)
        If(C == 0).then_continue()  # if !prime[A] then continue

        G @= A * A
        # H @= high(A * A)
        with ForRange(D, G, N + 1, A):
            B @= D >> 4
            B <<= 1
            C @= D & 0xF
            clrb(arr_is_prime.addr_add(B), C, inplace=True)

    D @= 0
    with ForRange(A, 0, N + 1):
        B @= A >> 4
        B <<= 1
        C @= getb(arr_is_prime.addr_add(B), A)
        If(C == 0).then_continue()
        D += 1

    call(print_time)
    syscall(S.putc, '\n')
    H @= D


def prime_primes(A, B, C, D):
    with ForRange(A, 0, N + 1):
        B @= A >> 4
        B <<= 1
        C @= getb(arr_is_prime.addr_add(B), A)
        If(C == 0).then_continue()
        syscall(S.printf, const('%d '), A)


def main(A, B, C, H):
    syscall(S.puts, const('find_fib:\n'))
    with ForRange(A, 0, 5):
        call(sieve)

    syscall(S.printf, const('\n\nNum primes = %d\n'), H)
    # call(prime_primes)


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('sieve.asm')
