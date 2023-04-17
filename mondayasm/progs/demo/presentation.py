from progs.stdlib.syscall import syscall, S
from progs.stdlib.timing import DELAY_MILLIS
from progs.stdlib.video import switch_screen_page, reset_color_palette, g_page_buffer, NUM_PAGES, fill_page
from soeunasm import Reg, call, halt, init_code_gen, const, global_var, ForRange, If, Else, M, Loop

CODE_OFFSET = 0x5000

N_MEMBERS = 7
members = const([
    'Lee Soojin',
    'Monday',
    'Park Soeun',
    'Lee Jaehee',
    'Jihan',
    'Zoa',
    'Shin Jiyoon',
])


def init_video(A):
    call(switch_screen_page, 0, 0)
    call(reset_color_palette)
    with ForRange(A, 0, NUM_PAGES):
        call(switch_screen_page, A, 0b1000)
        call(fill_page, 0)


def draw_string(row, col, color, s,
                A, B, C, D, H):
    A @= row
    B @= s
    with Loop():
        H @= M[B].byte()
        If(H == 0).then_break()

        syscall(S.strchr, B, '\n')
        with If(H == 0):
            D @= 0
            Else()
            C @= H
            D @= M[C].byte()
            M[C].byte() @ 0

        call(switch_screen_page, row, color)
        syscall(S.draw_str, g_page_buffer.addr(), col, B)

        If(D == 0).then_break()
        M[C].byte() @ D
        B @= C + 1
        row += 1


def demo_video(A, C):
    call(init_video)
    with ForRange(A, 0, N_MEMBERS):
        C @= members
        call(draw_string, A + 10, 10, 3, [A * 2 + C])
    call(draw_string, 18, 10, 2, const('Everyday Weeekly!\nHello!@#$%'))


def demo_uart(num,
              A, B, C):
    syscall(S.printf, const('Hello World!\n'))

    with ForRange(A, 0, num):
        B @= A + 1
        with If(A < N_MEMBERS):
            C @= members
            syscall(S.printf, const('%d --> %s\n'), B, [A * 2 + C])

            Else()

            C @= B * B
            syscall(S.printf, const('%d --> %d\n'), B, C)


def main(A, H):
    call(demo_uart, 10)
    call(demo_video)

    DELAY_MILLIS(1000)
    syscall(S.printf, const('Finished\n'))


if __name__ == '__main__':
    Reg.SP @= CODE_OFFSET - 0x10  # padding for safety
    call(main, preserve_registers=False)
    halt()

    cg = init_code_gen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('presentation.asm')
