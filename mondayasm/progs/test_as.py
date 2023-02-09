from mondayasm import *


def start():
    Mov([A], B)
    a = Label()
    Jmp(a)
    with Block('for_i') as for_i:
        Jeq(A, 23432, for_i.end)
        Add(B, 1)
        Jlt(B, 250, for_i.start)
        Sub(C, B + A)
    Add([B + 2 * A], C + 12345)


def main():
    Call(start, emit_call=False)
    CodeGen().compile().write('test_as.asm')


if __name__ == '__main__':
    main()
