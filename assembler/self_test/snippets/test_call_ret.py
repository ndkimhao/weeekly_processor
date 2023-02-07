MASK = 0xFFFF


def main():
    A = 10
    B = 0
    C = 0
    D = 0

    def fn_recursive():
        nonlocal A, B, C, D
        A = (A - 1)
        fn_process_c()
        if A == 0:
            return
        fn_recursive()
        D = (D + C) & 0xFFFF
        D = (D * 3) & 0xFFFF
        B = (B + D) & 0xFFFF
        B = (B * 5) & 0xFFFF

    def fn_process_c():
        nonlocal A, B, C, D
        C = (C + A) & 0xFFFF

    fn_recursive()
    print(f'A = {A:04x}')
    print(f'B = {B:04x}')
    print(f'C = {C:04x}')
    print(f'D = {D:04x}')


main()
