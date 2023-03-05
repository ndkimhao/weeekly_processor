from mondayasm import *

DEV_ADDR = 0xFF00
M_LED = M[DEV_ADDR + 0x0A]
CODE_OFFSET = 0xA000


def self_test():
    #
    # # BEGIN preamble.asm
    # .OFFSET(0xD000)  # .offset 0xD000
    Label('.boot')  # .boot:
    MOV(A, 0xFFFA)  # mov A, 0xFFFA
    JNE(A, 0x00FA, ConstLabel('start_test'))  # jne A, 0x00FA, $start_test
    Label('fail')  # fail:
    #     # register A contains failed test
    HALT()  # halt
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('success')  # success:
    JNE(A, 0xDEAD, ConstLabel('fail'))  # jne A, 0xDEAD, $fail  # check cookie
    JNE(B, 0xBEEF, ConstLabel('fail'))  # jne B, 0xBEEF, $fail
    JNE(C, 0x4983, ConstLabel('fail'))  # jne C, 0x4983, $fail
    JNE(H, 0xA614, ConstLabel('fail'))  # jne H, 0xA614, $fail
    MOV(D, H)  # mov D, H
    #     # okay!
    ADD(A, 0xACAB)  # add A, 0xACAB
    ADD(B, 0x41CC)  # add B, 0x41CC
    MUL(A, D)  # mul A, D
    XOR(A, 0xF24A)  # xor A, 0xF24A
    XOR(C, 0x494F)  # xor C, 0x494F
    XOR(H, 0x5A30)  # xor H, 0x5A30
    MOV(D, H)  # mov D, H
    #     # A = 0x00aa
    #     # B = 0x00bb
    #     # C = 0x00cc
    #     # D = 0x0055

    CALL(led_loop)

    HALT()  # halt
    # # END preamble.asm
    #
    Label('start_test')  # start_test:
    Label('alu_test')  # alu_test:
    #      # t=True, a=d230, b=a012
    ADD(B, 0xd230, 0xa012)  # add B, 0xd230, 0xa012
    JNE(B, 0x7242, ConstLabel('fail'))  # jne B, 0x7242, $fail
    #
    SUB(B, 0xd230, 0xa012)  # sub B, 0xd230, 0xa012
    JNE(B, 0x321e, ConstLabel('fail'))  # jne B, 0x321e, $fail
    #
    MUL(B, 0xd230, 0xa012)  # mul B, 0xd230, 0xa012
    JNE(B, 0xc760, ConstLabel('fail'))  # jne B, 0xc760, $fail
    JNE(H, 0x836c, ConstLabel('fail'))  # jne H, 0x836c, $fail
    #
    IMUL(B, 0xd230, 0xa012)  # imul B, 0xd230, 0xa012
    JNE(B, 0xc760, ConstLabel('fail'))  # jne B, 0xc760, $fail
    JNE(H, 0x112a, ConstLabel('fail'))  # jne H, 0x112a, $fail
    #
    SHR(B, 0xd230, 0xa012)  # shr B, 0xd230, 0xa012
    JNE(B, 0x348c, ConstLabel('fail'))  # jne B, 0x348c, $fail
    #
    ISHR(B, 0xd230, 0xa012)  # ishr B, 0xd230, 0xa012
    JNE(B, 0xf48c, ConstLabel('fail'))  # jne B, 0xf48c, $fail
    #
    SHL(B, 0xd230, 0xa012)  # shl B, 0xd230, 0xa012
    JNE(B, 0x48c0, ConstLabel('fail'))  # jne B, 0x48c0, $fail
    #
    AND(B, 0xd230, 0xa012)  # and B, 0xd230, 0xa012
    JNE(B, 0x8010, ConstLabel('fail'))  # jne B, 0x8010, $fail
    #
    OR(B, 0xd230, 0xa012)  # or B, 0xd230, 0xa012
    JNE(B, 0xf232, ConstLabel('fail'))  # jne B, 0xf232, $fail
    #
    XOR(B, 0xd230, 0xa012)  # xor B, 0xd230, 0xa012
    JNE(B, 0x7222, ConstLabel('fail'))  # jne B, 0x7222, $fail
    #
    NEG(B, 0xd230)  # neg B, 0xd230
    JNE(B, 0x2dd0, ConstLabel('fail'))  # jne B, 0x2dd0, $fail
    #
    NOT(B, 0xd230)  # not B, 0xd230
    JNE(B, 0x2dcf, ConstLabel('fail'))  # jne B, 0x2dcf, $fail
    #
    BOOL(B, 0xd230)  # bool B, 0xd230
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    INC(B, 0xd230)  # inc B, 0xd230
    JNE(B, 0xd231, ConstLabel('fail'))  # jne B, 0xd231, $fail
    #
    DEC(B, 0xd230)  # dec B, 0xd230
    JNE(B, 0xd22f, ConstLabel('fail'))  # jne B, 0xd22f, $fail
    #
    #      # t=True, a=00ad, b=da37
    ADD(B, 0x00ad, 0xda37)  # add B, 0x00ad, 0xda37
    JNE(B, 0xdae4, ConstLabel('fail'))  # jne B, 0xdae4, $fail
    #
    SUB(B, 0x00ad, 0xda37)  # sub B, 0x00ad, 0xda37
    JNE(B, 0x2676, ConstLabel('fail'))  # jne B, 0x2676, $fail
    #
    MUL(B, 0x00ad, 0xda37)  # mul B, 0x00ad, 0xda37
    JNE(B, 0x772b, ConstLabel('fail'))  # jne B, 0x772b, $fail
    JNE(H, 0x0093, ConstLabel('fail'))  # jne H, 0x0093, $fail
    #
    IMUL(B, 0x00ad, 0xda37)  # imul B, 0x00ad, 0xda37
    JNE(B, 0x772b, ConstLabel('fail'))  # jne B, 0x772b, $fail
    JNE(H, 0xffe6, ConstLabel('fail'))  # jne H, 0xffe6, $fail
    #
    SHR(B, 0x00ad, 0xda37)  # shr B, 0x00ad, 0xda37
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    ISHR(B, 0x00ad, 0xda37)  # ishr B, 0x00ad, 0xda37
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    SHL(B, 0x00ad, 0xda37)  # shl B, 0x00ad, 0xda37
    JNE(B, 0x5680, ConstLabel('fail'))  # jne B, 0x5680, $fail
    #
    AND(B, 0x00ad, 0xda37)  # and B, 0x00ad, 0xda37
    JNE(B, 0x0025, ConstLabel('fail'))  # jne B, 0x0025, $fail
    #
    OR(B, 0x00ad, 0xda37)  # or B, 0x00ad, 0xda37
    JNE(B, 0xdabf, ConstLabel('fail'))  # jne B, 0xdabf, $fail
    #
    XOR(B, 0x00ad, 0xda37)  # xor B, 0x00ad, 0xda37
    JNE(B, 0xda9a, ConstLabel('fail'))  # jne B, 0xda9a, $fail
    #
    NEG(B, 0x00ad)  # neg B, 0x00ad
    JNE(B, 0xff53, ConstLabel('fail'))  # jne B, 0xff53, $fail
    #
    NOT(B, 0x00ad)  # not B, 0x00ad
    JNE(B, 0xff52, ConstLabel('fail'))  # jne B, 0xff52, $fail
    #
    BOOL(B, 0x00ad)  # bool B, 0x00ad
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    INC(B, 0x00ad)  # inc B, 0x00ad
    JNE(B, 0x00ae, ConstLabel('fail'))  # jne B, 0x00ae, $fail
    #
    DEC(B, 0x00ad)  # dec B, 0x00ad
    JNE(B, 0x00ac, ConstLabel('fail'))  # jne B, 0x00ac, $fail
    #
    #      # t=False, a=f0ad, b=2a3f
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    ADD(B, 0x2a3f)  # add B, 0x2a3f
    JNE(B, 0x1aec, ConstLabel('fail'))  # jne B, 0x1aec, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    SUB(B, 0x2a3f)  # sub B, 0x2a3f
    JNE(B, 0xc66e, ConstLabel('fail'))  # jne B, 0xc66e, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    MUL(B, 0x2a3f)  # mul B, 0x2a3f
    JNE(B, 0x9c93, ConstLabel('fail'))  # jne B, 0x9c93, $fail
    JNE(H, 0x27b7, ConstLabel('fail'))  # jne H, 0x27b7, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    IMUL(B, 0x2a3f)  # imul B, 0x2a3f
    JNE(B, 0x9c93, ConstLabel('fail'))  # jne B, 0x9c93, $fail
    JNE(H, 0xfd78, ConstLabel('fail'))  # jne H, 0xfd78, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    SHR(B, 0x2a3f)  # shr B, 0x2a3f
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    ISHR(B, 0x2a3f)  # ishr B, 0x2a3f
    JNE(B, 0xffff, ConstLabel('fail'))  # jne B, 0xffff, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    SHL(B, 0x2a3f)  # shl B, 0x2a3f
    JNE(B, 0x8000, ConstLabel('fail'))  # jne B, 0x8000, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    AND(B, 0x2a3f)  # and B, 0x2a3f
    JNE(B, 0x202d, ConstLabel('fail'))  # jne B, 0x202d, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    OR(B, 0x2a3f)  # or B, 0x2a3f
    JNE(B, 0xfabf, ConstLabel('fail'))  # jne B, 0xfabf, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    XOR(B, 0x2a3f)  # xor B, 0x2a3f
    JNE(B, 0xda92, ConstLabel('fail'))  # jne B, 0xda92, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    NEG(B)  # neg B
    JNE(B, 0x0f53, ConstLabel('fail'))  # jne B, 0x0f53, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    NOT(B)  # not B
    JNE(B, 0x0f52, ConstLabel('fail'))  # jne B, 0x0f52, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    BOOL(B)  # bool B
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    INC(B)  # inc B
    JNE(B, 0xf0ae, ConstLabel('fail'))  # jne B, 0xf0ae, $fail
    #
    MOV(B, 0xf0ad)  # mov B, 0xf0ad
    DEC(B)  # dec B
    JNE(B, 0xf0ac, ConstLabel('fail'))  # jne B, 0xf0ac, $fail
    #
    #      # t=False, a=0000, b=dead
    MOV(B, 0x0000)  # mov B, 0x0000
    ADD(B, 0xdead)  # add B, 0xdead
    JNE(B, 0xdead, ConstLabel('fail'))  # jne B, 0xdead, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    SUB(B, 0xdead)  # sub B, 0xdead
    JNE(B, 0x2153, ConstLabel('fail'))  # jne B, 0x2153, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    MUL(B, 0xdead)  # mul B, 0xdead
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    JNE(H, 0x0000, ConstLabel('fail'))  # jne H, 0x0000, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    IMUL(B, 0xdead)  # imul B, 0xdead
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    JNE(H, 0x0000, ConstLabel('fail'))  # jne H, 0x0000, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    SHR(B, 0xdead)  # shr B, 0xdead
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    ISHR(B, 0xdead)  # ishr B, 0xdead
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    SHL(B, 0xdead)  # shl B, 0xdead
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    AND(B, 0xdead)  # and B, 0xdead
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    OR(B, 0xdead)  # or B, 0xdead
    JNE(B, 0xdead, ConstLabel('fail'))  # jne B, 0xdead, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    XOR(B, 0xdead)  # xor B, 0xdead
    JNE(B, 0xdead, ConstLabel('fail'))  # jne B, 0xdead, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    NEG(B)  # neg B
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    NOT(B)  # not B
    JNE(B, 0xffff, ConstLabel('fail'))  # jne B, 0xffff, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    BOOL(B)  # bool B
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    INC(B)  # inc B
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    MOV(B, 0x0000)  # mov B, 0x0000
    DEC(B)  # dec B
    JNE(B, 0xffff, ConstLabel('fail'))  # jne B, 0xffff, $fail
    #
    Label('alu_test_direct_reg')  # alu_test_direct_reg:
    #      # (direct) t=True, a=d230, b=a012
    MOV(C, 0xd230)  # mov C, 0xd230
    MOV(D, 0xa012)  # mov D, 0xa012
    ADD(B, C, D)  # add B, C, D
    JNE(B, 0x7242, ConstLabel('fail'))  # jne B, 0x7242, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    MOV(D, 0xa012)  # mov D, 0xa012
    SUB(B, C, D)  # sub B, C, D
    JNE(B, 0x321e, ConstLabel('fail'))  # jne B, 0x321e, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    MOV(D, 0xa012)  # mov D, 0xa012
    MUL(B, C, D)  # mul B, C, D
    JNE(B, 0xc760, ConstLabel('fail'))  # jne B, 0xc760, $fail
    JNE(H, 0x836c, ConstLabel('fail'))  # jne H, 0x836c, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    MOV(D, 0xa012)  # mov D, 0xa012
    IMUL(B, C, D)  # imul B, C, D
    JNE(B, 0xc760, ConstLabel('fail'))  # jne B, 0xc760, $fail
    JNE(H, 0x112a, ConstLabel('fail'))  # jne H, 0x112a, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    MOV(D, 0xa012)  # mov D, 0xa012
    SHR(B, C, D)  # shr B, C, D
    JNE(B, 0x348c, ConstLabel('fail'))  # jne B, 0x348c, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    MOV(D, 0xa012)  # mov D, 0xa012
    ISHR(B, C, D)  # ishr B, C, D
    JNE(B, 0xf48c, ConstLabel('fail'))  # jne B, 0xf48c, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    MOV(D, 0xa012)  # mov D, 0xa012
    SHL(B, C, D)  # shl B, C, D
    JNE(B, 0x48c0, ConstLabel('fail'))  # jne B, 0x48c0, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    MOV(D, 0xa012)  # mov D, 0xa012
    AND(B, C, D)  # and B, C, D
    JNE(B, 0x8010, ConstLabel('fail'))  # jne B, 0x8010, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    MOV(D, 0xa012)  # mov D, 0xa012
    OR(B, C, D)  # or B, C, D
    JNE(B, 0xf232, ConstLabel('fail'))  # jne B, 0xf232, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    MOV(D, 0xa012)  # mov D, 0xa012
    XOR(B, C, D)  # xor B, C, D
    JNE(B, 0x7222, ConstLabel('fail'))  # jne B, 0x7222, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    NEG(B, C)  # neg B, C
    JNE(B, 0x2dd0, ConstLabel('fail'))  # jne B, 0x2dd0, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    NOT(B, C)  # not B, C
    JNE(B, 0x2dcf, ConstLabel('fail'))  # jne B, 0x2dcf, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    BOOL(B, C)  # bool B, C
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    INC(B, C)  # inc B, C
    JNE(B, 0xd231, ConstLabel('fail'))  # jne B, 0xd231, $fail
    #
    MOV(C, 0xd230)  # mov C, 0xd230
    DEC(B, C)  # dec B, C
    JNE(B, 0xd22f, ConstLabel('fail'))  # jne B, 0xd22f, $fail
    #
    #      # (direct) t=True, a=00ad, b=da37
    MOV(C, 0x00ad)  # mov C, 0x00ad
    MOV(D, 0xda37)  # mov D, 0xda37
    ADD(B, C, D)  # add B, C, D
    JNE(B, 0xdae4, ConstLabel('fail'))  # jne B, 0xdae4, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    MOV(D, 0xda37)  # mov D, 0xda37
    SUB(B, C, D)  # sub B, C, D
    JNE(B, 0x2676, ConstLabel('fail'))  # jne B, 0x2676, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    MOV(D, 0xda37)  # mov D, 0xda37
    MUL(B, C, D)  # mul B, C, D
    JNE(B, 0x772b, ConstLabel('fail'))  # jne B, 0x772b, $fail
    JNE(H, 0x0093, ConstLabel('fail'))  # jne H, 0x0093, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    MOV(D, 0xda37)  # mov D, 0xda37
    IMUL(B, C, D)  # imul B, C, D
    JNE(B, 0x772b, ConstLabel('fail'))  # jne B, 0x772b, $fail
    JNE(H, 0xffe6, ConstLabel('fail'))  # jne H, 0xffe6, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    MOV(D, 0xda37)  # mov D, 0xda37
    SHR(B, C, D)  # shr B, C, D
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    MOV(D, 0xda37)  # mov D, 0xda37
    ISHR(B, C, D)  # ishr B, C, D
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    MOV(D, 0xda37)  # mov D, 0xda37
    SHL(B, C, D)  # shl B, C, D
    JNE(B, 0x5680, ConstLabel('fail'))  # jne B, 0x5680, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    MOV(D, 0xda37)  # mov D, 0xda37
    AND(B, C, D)  # and B, C, D
    JNE(B, 0x0025, ConstLabel('fail'))  # jne B, 0x0025, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    MOV(D, 0xda37)  # mov D, 0xda37
    OR(B, C, D)  # or B, C, D
    JNE(B, 0xdabf, ConstLabel('fail'))  # jne B, 0xdabf, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    MOV(D, 0xda37)  # mov D, 0xda37
    XOR(B, C, D)  # xor B, C, D
    JNE(B, 0xda9a, ConstLabel('fail'))  # jne B, 0xda9a, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    NEG(B, C)  # neg B, C
    JNE(B, 0xff53, ConstLabel('fail'))  # jne B, 0xff53, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    NOT(B, C)  # not B, C
    JNE(B, 0xff52, ConstLabel('fail'))  # jne B, 0xff52, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    BOOL(B, C)  # bool B, C
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    INC(B, C)  # inc B, C
    JNE(B, 0x00ae, ConstLabel('fail'))  # jne B, 0x00ae, $fail
    #
    MOV(C, 0x00ad)  # mov C, 0x00ad
    DEC(B, C)  # dec B, C
    JNE(B, 0x00ac, ConstLabel('fail'))  # jne B, 0x00ac, $fail
    #
    #      # (direct) t=False, a=f0ad, b=2a3f
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(D, 0x2a3f)  # mov D, 0x2a3f
    MOV(B, C)  # mov B, C
    ADD(B, D)  # add B, D
    JNE(B, 0x1aec, ConstLabel('fail'))  # jne B, 0x1aec, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(D, 0x2a3f)  # mov D, 0x2a3f
    MOV(B, C)  # mov B, C
    SUB(B, D)  # sub B, D
    JNE(B, 0xc66e, ConstLabel('fail'))  # jne B, 0xc66e, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(D, 0x2a3f)  # mov D, 0x2a3f
    MOV(B, C)  # mov B, C
    MUL(B, D)  # mul B, D
    JNE(B, 0x9c93, ConstLabel('fail'))  # jne B, 0x9c93, $fail
    JNE(H, 0x27b7, ConstLabel('fail'))  # jne H, 0x27b7, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(D, 0x2a3f)  # mov D, 0x2a3f
    MOV(B, C)  # mov B, C
    IMUL(B, D)  # imul B, D
    JNE(B, 0x9c93, ConstLabel('fail'))  # jne B, 0x9c93, $fail
    JNE(H, 0xfd78, ConstLabel('fail'))  # jne H, 0xfd78, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(D, 0x2a3f)  # mov D, 0x2a3f
    MOV(B, C)  # mov B, C
    SHR(B, D)  # shr B, D
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(D, 0x2a3f)  # mov D, 0x2a3f
    MOV(B, C)  # mov B, C
    ISHR(B, D)  # ishr B, D
    JNE(B, 0xffff, ConstLabel('fail'))  # jne B, 0xffff, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(D, 0x2a3f)  # mov D, 0x2a3f
    MOV(B, C)  # mov B, C
    SHL(B, D)  # shl B, D
    JNE(B, 0x8000, ConstLabel('fail'))  # jne B, 0x8000, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(D, 0x2a3f)  # mov D, 0x2a3f
    MOV(B, C)  # mov B, C
    AND(B, D)  # and B, D
    JNE(B, 0x202d, ConstLabel('fail'))  # jne B, 0x202d, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(D, 0x2a3f)  # mov D, 0x2a3f
    MOV(B, C)  # mov B, C
    OR(B, D)  # or B, D
    JNE(B, 0xfabf, ConstLabel('fail'))  # jne B, 0xfabf, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(D, 0x2a3f)  # mov D, 0x2a3f
    MOV(B, C)  # mov B, C
    XOR(B, D)  # xor B, D
    JNE(B, 0xda92, ConstLabel('fail'))  # jne B, 0xda92, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(B, C)  # mov B, C
    NEG(B)  # neg B
    JNE(B, 0x0f53, ConstLabel('fail'))  # jne B, 0x0f53, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(B, C)  # mov B, C
    NOT(B)  # not B
    JNE(B, 0x0f52, ConstLabel('fail'))  # jne B, 0x0f52, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(B, C)  # mov B, C
    BOOL(B)  # bool B
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(B, C)  # mov B, C
    INC(B)  # inc B
    JNE(B, 0xf0ae, ConstLabel('fail'))  # jne B, 0xf0ae, $fail
    #
    MOV(C, 0xf0ad)  # mov C, 0xf0ad
    MOV(B, C)  # mov B, C
    DEC(B)  # dec B
    JNE(B, 0xf0ac, ConstLabel('fail'))  # jne B, 0xf0ac, $fail
    #
    #      # (direct) t=False, a=0000, b=dead
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(D, 0xdead)  # mov D, 0xdead
    MOV(B, C)  # mov B, C
    ADD(B, D)  # add B, D
    JNE(B, 0xdead, ConstLabel('fail'))  # jne B, 0xdead, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(D, 0xdead)  # mov D, 0xdead
    MOV(B, C)  # mov B, C
    SUB(B, D)  # sub B, D
    JNE(B, 0x2153, ConstLabel('fail'))  # jne B, 0x2153, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(D, 0xdead)  # mov D, 0xdead
    MOV(B, C)  # mov B, C
    MUL(B, D)  # mul B, D
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    JNE(H, 0x0000, ConstLabel('fail'))  # jne H, 0x0000, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(D, 0xdead)  # mov D, 0xdead
    MOV(B, C)  # mov B, C
    IMUL(B, D)  # imul B, D
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    JNE(H, 0x0000, ConstLabel('fail'))  # jne H, 0x0000, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(D, 0xdead)  # mov D, 0xdead
    MOV(B, C)  # mov B, C
    SHR(B, D)  # shr B, D
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(D, 0xdead)  # mov D, 0xdead
    MOV(B, C)  # mov B, C
    ISHR(B, D)  # ishr B, D
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(D, 0xdead)  # mov D, 0xdead
    MOV(B, C)  # mov B, C
    SHL(B, D)  # shl B, D
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(D, 0xdead)  # mov D, 0xdead
    MOV(B, C)  # mov B, C
    AND(B, D)  # and B, D
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(D, 0xdead)  # mov D, 0xdead
    MOV(B, C)  # mov B, C
    OR(B, D)  # or B, D
    JNE(B, 0xdead, ConstLabel('fail'))  # jne B, 0xdead, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(D, 0xdead)  # mov D, 0xdead
    MOV(B, C)  # mov B, C
    XOR(B, D)  # xor B, D
    JNE(B, 0xdead, ConstLabel('fail'))  # jne B, 0xdead, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(B, C)  # mov B, C
    NEG(B)  # neg B
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(B, C)  # mov B, C
    NOT(B)  # not B
    JNE(B, 0xffff, ConstLabel('fail'))  # jne B, 0xffff, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(B, C)  # mov B, C
    BOOL(B)  # bool B
    JNE(B, 0x0000, ConstLabel('fail'))  # jne B, 0x0000, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(B, C)  # mov B, C
    INC(B)  # inc B
    JNE(B, 0x0001, ConstLabel('fail'))  # jne B, 0x0001, $fail
    #
    MOV(C, 0x0000)  # mov C, 0x0000
    MOV(B, C)  # mov B, C
    DEC(B)  # dec B
    JNE(B, 0xffff, ConstLabel('fail'))  # jne B, 0xffff, $fail
    #
    Label('jmp_test')  # jmp_test:
    JEQ(0xffab, 0x002b, ConstLabel('fail'))  # jeq 0xffab, 0x002b, $fail
    JNE(0xffab, 0x002b, ConstLabel('_L_test_jmp_1'))  # jne 0xffab, 0x002b, $_L_test_jmp_1
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_1')  # _L_test_jmp_1:
    JLT(0xffab, 0x002b, ConstLabel('fail'))  # jlt 0xffab, 0x002b, $fail
    JLE(0xffab, 0x002b, ConstLabel('fail'))  # jle 0xffab, 0x002b, $fail
    JGT(0xffab, 0x002b, ConstLabel('_L_test_jmp_2'))  # jgt 0xffab, 0x002b, $_L_test_jmp_2
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_2')  # _L_test_jmp_2:
    JGE(0xffab, 0x002b, ConstLabel('_L_test_jmp_3'))  # jge 0xffab, 0x002b, $_L_test_jmp_3
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_3')  # _L_test_jmp_3:
    CMP(0xffab, 0x002b)  # cmp 0xffab, 0x002b
    JEQ(ConstLabel('fail'))  # jeq $fail
    JNE(ConstLabel('_L_test_jmp_4'))  # jne $_L_test_jmp_4
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_4')  # _L_test_jmp_4:
    JLT(ConstLabel('fail'))  # jlt $fail
    JLE(ConstLabel('fail'))  # jle $fail
    JGT(ConstLabel('_L_test_jmp_5'))  # jgt $_L_test_jmp_5
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_5')  # _L_test_jmp_5:
    JGE(ConstLabel('_L_test_jmp_6'))  # jge $_L_test_jmp_6
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_6')  # _L_test_jmp_6:
    ICMP(0xffab, 0x002b)  # icmp 0xffab, 0x002b
    JEQ(ConstLabel('fail'))  # jeq $fail
    JNE(ConstLabel('_L_test_jmp_7'))  # jne $_L_test_jmp_7
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_7')  # _L_test_jmp_7:
    JLT(ConstLabel('_L_test_jmp_8'))  # jlt $_L_test_jmp_8
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_8')  # _L_test_jmp_8:
    JLE(ConstLabel('_L_test_jmp_9'))  # jle $_L_test_jmp_9
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_9')  # _L_test_jmp_9:
    JGT(ConstLabel('fail'))  # jgt $fail
    JGE(ConstLabel('fail'))  # jge $fail
    JEQ(0x002b, 0xffab, ConstLabel('fail'))  # jeq 0x002b, 0xffab, $fail
    JNE(0x002b, 0xffab, ConstLabel('_L_test_jmp_10'))  # jne 0x002b, 0xffab, $_L_test_jmp_10
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_10')  # _L_test_jmp_10:
    JLT(0x002b, 0xffab, ConstLabel('_L_test_jmp_11'))  # jlt 0x002b, 0xffab, $_L_test_jmp_11
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_11')  # _L_test_jmp_11:
    JLE(0x002b, 0xffab, ConstLabel('_L_test_jmp_12'))  # jle 0x002b, 0xffab, $_L_test_jmp_12
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_12')  # _L_test_jmp_12:
    JGT(0x002b, 0xffab, ConstLabel('fail'))  # jgt 0x002b, 0xffab, $fail
    JGE(0x002b, 0xffab, ConstLabel('fail'))  # jge 0x002b, 0xffab, $fail
    CMP(0x002b, 0xffab)  # cmp 0x002b, 0xffab
    JEQ(ConstLabel('fail'))  # jeq $fail
    JNE(ConstLabel('_L_test_jmp_13'))  # jne $_L_test_jmp_13
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_13')  # _L_test_jmp_13:
    JLT(ConstLabel('_L_test_jmp_14'))  # jlt $_L_test_jmp_14
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_14')  # _L_test_jmp_14:
    JLE(ConstLabel('_L_test_jmp_15'))  # jle $_L_test_jmp_15
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_15')  # _L_test_jmp_15:
    JGT(ConstLabel('fail'))  # jgt $fail
    JGE(ConstLabel('fail'))  # jge $fail
    ICMP(0x002b, 0xffab)  # icmp 0x002b, 0xffab
    JEQ(ConstLabel('fail'))  # jeq $fail
    JNE(ConstLabel('_L_test_jmp_16'))  # jne $_L_test_jmp_16
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_16')  # _L_test_jmp_16:
    JLT(ConstLabel('fail'))  # jlt $fail
    JLE(ConstLabel('fail'))  # jle $fail
    JGT(ConstLabel('_L_test_jmp_17'))  # jgt $_L_test_jmp_17
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_17')  # _L_test_jmp_17:
    JGE(ConstLabel('_L_test_jmp_18'))  # jge $_L_test_jmp_18
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_18')  # _L_test_jmp_18:
    JEQ(0xffab, 0xffab, ConstLabel('_L_test_jmp_19'))  # jeq 0xffab, 0xffab, $_L_test_jmp_19
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_19')  # _L_test_jmp_19:
    JNE(0xffab, 0xffab, ConstLabel('fail'))  # jne 0xffab, 0xffab, $fail
    JLT(0xffab, 0xffab, ConstLabel('fail'))  # jlt 0xffab, 0xffab, $fail
    JLE(0xffab, 0xffab, ConstLabel('_L_test_jmp_20'))  # jle 0xffab, 0xffab, $_L_test_jmp_20
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_20')  # _L_test_jmp_20:
    JGT(0xffab, 0xffab, ConstLabel('fail'))  # jgt 0xffab, 0xffab, $fail
    JGE(0xffab, 0xffab, ConstLabel('_L_test_jmp_21'))  # jge 0xffab, 0xffab, $_L_test_jmp_21
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_21')  # _L_test_jmp_21:
    CMP(0xffab, 0xffab)  # cmp 0xffab, 0xffab
    JEQ(ConstLabel('_L_test_jmp_22'))  # jeq $_L_test_jmp_22
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_22')  # _L_test_jmp_22:
    JNE(ConstLabel('fail'))  # jne $fail
    JLT(ConstLabel('fail'))  # jlt $fail
    JLE(ConstLabel('_L_test_jmp_23'))  # jle $_L_test_jmp_23
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_23')  # _L_test_jmp_23:
    JGT(ConstLabel('fail'))  # jgt $fail
    JGE(ConstLabel('_L_test_jmp_24'))  # jge $_L_test_jmp_24
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_24')  # _L_test_jmp_24:
    ICMP(0xffab, 0xffab)  # icmp 0xffab, 0xffab
    JEQ(ConstLabel('_L_test_jmp_25'))  # jeq $_L_test_jmp_25
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_25')  # _L_test_jmp_25:
    JNE(ConstLabel('fail'))  # jne $fail
    JLT(ConstLabel('fail'))  # jlt $fail
    JLE(ConstLabel('_L_test_jmp_26'))  # jle $_L_test_jmp_26
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_26')  # _L_test_jmp_26:
    JGT(ConstLabel('fail'))  # jgt $fail
    JGE(ConstLabel('_L_test_jmp_27'))  # jge $_L_test_jmp_27
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_jmp_27')  # _L_test_jmp_27:
    Label('test_uop_get_arg')  # test_uop_get_arg:
    MOV(SP, 0x7000)  # mov SP, 0x7000
    MOV(A, 0x00aa)  # mov A, 0x00aa
    MOV(B, 0x00bb)  # mov B, 0x00bb
    MOV(G, 0x0155)  # mov G, 0x0155
    XOR([12345], -123, G)  # xor [12345], -123, G
    JNE([0x3039], 0xfed0, ConstLabel('fail'))  # jne [0x3039], 0xfed0, $fail
    AND([A * 4 + -10], G, A * 2)  # and [A*4 + -10], G, A*2
    JNE([0x029e], 0x0154, ConstLabel('fail'))  # jne [0x029e], 0x0154, $fail
    SUB([A * 2], 0xFADE + A, A * 4 + -10)  # sub [A*2], 0xFADE + A, A*4 + -10
    JNE([0x0154], 0xf8ea, ConstLabel('fail'))  # jne [0x0154], 0xf8ea, $fail
    ISHR([12345], A, A * 2)  # ishr [12345], A, A*2
    JNE([0x3039], 0x000a, ConstLabel('fail'))  # jne [0x3039], 0x000a, $fail
    SHL([G], A * 4 + B, A * 4 + -10)  # shl [G], A*4 + B, A*4 + -10
    JNE([0x0155], 0xc000, ConstLabel('fail'))  # jne [0x0155], 0xc000, $fail
    OR([G], -123, G)  # or [G], -123, G
    JNE([0x0155], 0xffd5, ConstLabel('fail'))  # jne [0x0155], 0xffd5, $fail
    MUL([A * 4 + B], -123, A)  # mul [A*4 + B], -123, A
    JNE([0x0363], 0xae52, ConstLabel('fail'))  # jne [0x0363], 0xae52, $fail
    ISHR([12345], 12345, A * 4 + B)  # ishr [12345], 12345, A*4 + B
    JNE([0x3039], 0x0607, ConstLabel('fail'))  # jne [0x3039], 0x0607, $fail
    SHR([A * 2], 0xFADE + A, A * 2)  # shr [A*2], 0xFADE + A, A*2
    JNE([0x0154], 0x0fb8, ConstLabel('fail'))  # jne [0x0154], 0x0fb8, $fail
    ADD([A * 2], G, G)  # add [A*2], G, G
    JNE([0x0154], 0x02aa, ConstLabel('fail'))  # jne [0x0154], 0x02aa, $fail
    ISHR([G], 0xFADE + A, A)  # ishr [G], 0xFADE + A, A
    JNE([0x0155], 0xfffe, ConstLabel('fail'))  # jne [0x0155], 0xfffe, $fail
    ADD([12345], 0xFADE + A, A * 4 + B)  # add [12345], 0xFADE + A, A*4 + B
    JNE([0x3039], 0xfeeb, ConstLabel('fail'))  # jne [0x3039], 0xfeeb, $fail
    ISHR([A], A, A)  # ishr [A], A, A
    JNE([0x00aa], 0x0000, ConstLabel('fail'))  # jne [0x00aa], 0x0000, $fail
    ADD([G], A * 4 + B, A)  # add [G], A*4 + B, A
    JNE([0x0155], 0x040d, ConstLabel('fail'))  # jne [0x0155], 0x040d, $fail
    XOR([G], G, G)  # xor [G], G, G
    JNE([0x0155], 0x0000, ConstLabel('fail'))  # jne [0x0155], 0x0000, $fail
    SHL([A * 2], G, A * 2)  # shl [A*2], G, A*2
    JNE([0x0154], 0x1550, ConstLabel('fail'))  # jne [0x0154], 0x1550, $fail
    ISHR([G], 12345, A * 2)  # ishr [G], 12345, A*2
    JNE([0x0155], 0x0303, ConstLabel('fail'))  # jne [0x0155], 0x0303, $fail
    AND([A * 2], A * 4 + B, 0xFADE + A)  # and [A*2], A*4 + B, 0xFADE + A
    JNE([0x0154], 0x0300, ConstLabel('fail'))  # jne [0x0154], 0x0300, $fail
    ADD([A], A * 4 + -10, A * 4 + -10)  # add [A], A*4 + -10, A*4 + -10
    JNE([0x00aa], 0x053c, ConstLabel('fail'))  # jne [0x00aa], 0x053c, $fail
    OR([12345], A * 2, -123)  # or [12345], A*2, -123
    JNE([0x3039], 0xffd5, ConstLabel('fail'))  # jne [0x3039], 0xffd5, $fail
    ADD([12345], G, G)  # add [12345], G, G
    JNE([0x3039], 0x02aa, ConstLabel('fail'))  # jne [0x3039], 0x02aa, $fail
    AND([G], 12345, 0xFADE + A)  # and [G], 12345, 0xFADE + A
    JNE([0x0155], 0x3008, ConstLabel('fail'))  # jne [0x0155], 0x3008, $fail
    IMUL([12345], A * 4 + B, A * 4 + -10)  # imul [12345], A*4 + B, A*4 + -10
    JNE([0x3039], 0xdd1a, ConstLabel('fail'))  # jne [0x3039], 0xdd1a, $fail
    OR([A * 2], 12345, A)  # or [A*2], 12345, A
    JNE([0x0154], 0x30bb, ConstLabel('fail'))  # jne [0x0154], 0x30bb, $fail
    IMUL([A * 2], A * 4 + -10, A * 2)  # imul [A*2], A*4 + -10, A*2
    JNE([0x0154], 0x79d8, ConstLabel('fail'))  # jne [0x0154], 0x79d8, $fail
    ADD([A * 4 + -10], -123, A * 4 + B)  # add [A*4 + -10], -123, A*4 + B
    JNE([0x029e], 0x02e8, ConstLabel('fail'))  # jne [0x029e], 0x02e8, $fail
    SUB([G], 0xFADE + A, A * 2)  # sub [G], 0xFADE + A, A*2
    JNE([0x0155], 0xfa34, ConstLabel('fail'))  # jne [0x0155], 0xfa34, $fail
    OR([A * 4 + B], 0xFADE + A, A * 2)  # or [A*4 + B], 0xFADE + A, A*2
    JNE([0x0363], 0xfbdc, ConstLabel('fail'))  # jne [0x0363], 0xfbdc, $fail
    AND([A * 2], A * 2, A)  # and [A*2], A*2, A
    JNE([0x0154], 0x0000, ConstLabel('fail'))  # jne [0x0154], 0x0000, $fail
    SUB([A * 4 + B], A * 4 + B, G)  # sub [A*4 + B], A*4 + B, G
    JNE([0x0363], 0x020e, ConstLabel('fail'))  # jne [0x0363], 0x020e, $fail
    ADD([A * 4 + -10], A * 4 + -10, A)  # add [A*4 + -10], A*4 + -10, A
    JNE([0x029e], 0x0348, ConstLabel('fail'))  # jne [0x029e], 0x0348, $fail
    SUB([A * 2], 12345, 12345)  # sub [A*2], 12345, 12345
    JNE([0x0154], 0x0000, ConstLabel('fail'))  # jne [0x0154], 0x0000, $fail
    SHR([A], -123, G)  # shr [A], -123, G
    JNE([0x00aa], 0x07fc, ConstLabel('fail'))  # jne [0x00aa], 0x07fc, $fail
    SHL([A * 4 + B], -123, A * 4 + B)  # shl [A*4 + B], -123, A*4 + B
    JNE([0x0363], 0xfc28, ConstLabel('fail'))  # jne [0x0363], 0xfc28, $fail
    OR([A * 4 + B], A, A)  # or [A*4 + B], A, A
    JNE([0x0363], 0x00aa, ConstLabel('fail'))  # jne [0x0363], 0x00aa, $fail
    SUB([A], A, -123)  # sub [A], A, -123
    JNE([0x00aa], 0x0125, ConstLabel('fail'))  # jne [0x00aa], 0x0125, $fail
    ISHR([A * 4 + -10], 0xFADE + A, A * 2)  # ishr [A*4 + -10], 0xFADE + A, A*2
    JNE([0x029e], 0xffb8, ConstLabel('fail'))  # jne [0x029e], 0xffb8, $fail
    SUB([A], 12345, 12345)  # sub [A], 12345, 12345
    JNE([0x00aa], 0x0000, ConstLabel('fail'))  # jne [0x00aa], 0x0000, $fail
    ADD([G], 12345, 12345)  # add [G], 12345, 12345
    JNE([0x0155], 0x6072, ConstLabel('fail'))  # jne [0x0155], 0x6072, $fail
    SHR([A * 4 + B], 0xFADE + A, 0xFADE + A)  # shr [A*4 + B], 0xFADE + A, 0xFADE + A
    JNE([0x0363], 0x00fb, ConstLabel('fail'))  # jne [0x0363], 0x00fb, $fail
    IMUL([A], A, G)  # imul [A], A, G
    JNE([0x00aa], 0xe272, ConstLabel('fail'))  # jne [0x00aa], 0xe272, $fail
    SHR([A * 2], 0xFADE + A, A * 4 + B)  # shr [A*2], 0xFADE + A, A*4 + B
    JNE([0x0154], 0x1f71, ConstLabel('fail'))  # jne [0x0154], 0x1f71, $fail
    SHR([A * 4 + B], A * 4 + B, -123)  # shr [A*4 + B], A*4 + B, -123
    JNE([0x0363], 0x001b, ConstLabel('fail'))  # jne [0x0363], 0x001b, $fail
    SHR([A], A * 2, A * 4 + B)  # shr [A], A*2, A*4 + B
    JNE([0x00aa], 0x002a, ConstLabel('fail'))  # jne [0x00aa], 0x002a, $fail
    AND([12345], A * 4 + B, A)  # and [12345], A*4 + B, A
    JNE([0x3039], 0x0022, ConstLabel('fail'))  # jne [0x3039], 0x0022, $fail
    SHR([12345], 12345, 12345)  # shr [12345], 12345, 12345
    JNE([0x3039], 0x0018, ConstLabel('fail'))  # jne [0x3039], 0x0018, $fail
    MUL([A], G, A * 4 + -10)  # mul [A], G, A*4 + -10
    JNE([0x00aa], 0x7c76, ConstLabel('fail'))  # jne [0x00aa], 0x7c76, $fail
    ADD([A * 4 + B], 12345, A * 4 + B)  # add [A*4 + B], 12345, A*4 + B
    JNE([0x0363], 0x339c, ConstLabel('fail'))  # jne [0x0363], 0x339c, $fail
    IMUL([G], A * 4 + -10, A * 4 + B)  # imul [G], A*4 + -10, A*4 + B
    JNE([0x0155], 0xdd1a, ConstLabel('fail'))  # jne [0x0155], 0xdd1a, $fail
    SHL([A], A * 2, 12345)  # shl [A], A*2, 12345
    JNE([0x00aa], 0xa800, ConstLabel('fail'))  # jne [0x00aa], 0xa800, $fail
    ADD([A * 2], G, A)  # add [A*2], G, A
    JNE([0x0154], 0x01ff, ConstLabel('fail'))  # jne [0x0154], 0x01ff, $fail
    ADD([A * 4 + B], A * 4 + B, A * 2)  # add [A*4 + B], A*4 + B, A*2
    JNE([0x0363], 0x04b7, ConstLabel('fail'))  # jne [0x0363], 0x04b7, $fail
    SHR([A], G, 0xFADE + A)  # shr [A], G, 0xFADE + A
    JNE([0x00aa], 0x0001, ConstLabel('fail'))  # jne [0x00aa], 0x0001, $fail
    ADD([G], -123, A)  # add [G], -123, A
    JNE([0x0155], 0x002f, ConstLabel('fail'))  # jne [0x0155], 0x002f, $fail
    IMUL([A * 4 + -10], G, 12345)  # imul [A*4 + -10], G, 12345
    JNE([0x029e], 0x3bed, ConstLabel('fail'))  # jne [0x029e], 0x3bed, $fail
    MUL([G], 0xFADE + A, A * 4 + B)  # mul [G], 0xFADE + A, A*4 + B
    JNE([0x0155], 0xdd98, ConstLabel('fail'))  # jne [0x0155], 0xdd98, $fail
    SHR([G], G, A)  # shr [G], G, A
    JNE([0x0155], 0x0000, ConstLabel('fail'))  # jne [0x0155], 0x0000, $fail
    OR([A * 2], A, A)  # or [A*2], A, A
    JNE([0x0154], 0x00aa, ConstLabel('fail'))  # jne [0x0154], 0x00aa, $fail
    OR([A * 4 + -10], -123, A * 2)  # or [A*4 + -10], -123, A*2
    JNE([0x029e], 0xffd5, ConstLabel('fail'))  # jne [0x029e], 0xffd5, $fail
    MUL([A * 4 + B], -123, -123)  # mul [A*4 + B], -123, -123
    JNE([0x0363], 0x3b19, ConstLabel('fail'))  # jne [0x0363], 0x3b19, $fail
    MUL([12345], 0xFADE + A, A * 2)  # mul [12345], 0xFADE + A, A*2
    JNE([0x3039], 0x10a0, ConstLabel('fail'))  # jne [0x3039], 0x10a0, $fail
    SUB([G], A, A * 4 + -10)  # sub [G], A, A*4 + -10
    JNE([0x0155], 0xfe0c, ConstLabel('fail'))  # jne [0x0155], 0xfe0c, $fail
    SHL([A], A * 4 + B, A * 2)  # shl [A], A*4 + B, A*2
    JNE([0x00aa], 0x3630, ConstLabel('fail'))  # jne [0x00aa], 0x3630, $fail
    XOR([A * 2], -123, A * 4 + B)  # xor [A*2], -123, A*4 + B
    JNE([0x0154], 0xfce6, ConstLabel('fail'))  # jne [0x0154], 0xfce6, $fail
    SUB([A * 4 + B], A * 4 + -10, -123)  # sub [A*4 + B], A*4 + -10, -123
    JNE([0x0363], 0x0319, ConstLabel('fail'))  # jne [0x0363], 0x0319, $fail
    SUB([12345], 12345, 0xFADE + A)  # sub [12345], 12345, 0xFADE + A
    JNE([0x3039], 0x34b1, ConstLabel('fail'))  # jne [0x3039], 0x34b1, $fail
    AND([G], A * 4 + B, 0xFADE + A)  # and [G], A*4 + B, 0xFADE + A
    JNE([0x0155], 0x0300, ConstLabel('fail'))  # jne [0x0155], 0x0300, $fail
    SHL([A], A * 4 + -10, G)  # shl [A], A*4 + -10, G
    JNE([0x00aa], 0x53c0, ConstLabel('fail'))  # jne [0x00aa], 0x53c0, $fail
    ISHR([G], G, 0xFADE + A)  # ishr [G], G, 0xFADE + A
    JNE([0x0155], 0x0001, ConstLabel('fail'))  # jne [0x0155], 0x0001, $fail
    AND([A * 2], 12345, A * 4 + B)  # and [A*2], 12345, A*4 + B
    JNE([0x0154], 0x0021, ConstLabel('fail'))  # jne [0x0154], 0x0021, $fail
    ISHR([A * 2], A * 2, -123)  # ishr [A*2], A*2, -123
    JNE([0x0154], 0x000a, ConstLabel('fail'))  # jne [0x0154], 0x000a, $fail
    XOR([G], A * 2, 12345)  # xor [G], A*2, 12345
    JNE([0x0155], 0x316d, ConstLabel('fail'))  # jne [0x0155], 0x316d, $fail
    SUB([A * 4 + B], A * 4 + -10, A * 4 + B)  # sub [A*4 + B], A*4 + -10, A*4 + B
    JNE([0x0363], 0xff3b, ConstLabel('fail'))  # jne [0x0363], 0xff3b, $fail
    OR([12345], G, -123)  # or [12345], G, -123
    JNE([0x3039], 0xffd5, ConstLabel('fail'))  # jne [0x3039], 0xffd5, $fail
    SHL([A * 4 + B], A * 4 + -10, A)  # shl [A*4 + B], A*4 + -10, A
    JNE([0x0363], 0x7800, ConstLabel('fail'))  # jne [0x0363], 0x7800, $fail
    SUB([12345], A * 2, A)  # sub [12345], A*2, A
    JNE([0x3039], 0x00aa, ConstLabel('fail'))  # jne [0x3039], 0x00aa, $fail
    XOR([12345], A * 4 + B, A * 2)  # xor [12345], A*4 + B, A*2
    JNE([0x3039], 0x0237, ConstLabel('fail'))  # jne [0x3039], 0x0237, $fail
    AND([A * 4 + B], 12345, -123)  # and [A*4 + B], 12345, -123
    JNE([0x0363], 0x3001, ConstLabel('fail'))  # jne [0x0363], 0x3001, $fail
    IMUL([G], A * 4 + B, 12345)  # imul [G], A*4 + B, 12345
    JNE([0x0155], 0x510b, ConstLabel('fail'))  # jne [0x0155], 0x510b, $fail
    OR([A * 4 + B], A, G)  # or [A*4 + B], A, G
    JNE([0x0363], 0x01ff, ConstLabel('fail'))  # jne [0x0363], 0x01ff, $fail
    ISHR([A * 4 + -10], 12345, A)  # ishr [A*4 + -10], 12345, A
    JNE([0x029e], 0x000c, ConstLabel('fail'))  # jne [0x029e], 0x000c, $fail
    SHL([12345], 0xFADE + A, 0xFADE + A)  # shl [12345], 0xFADE + A, 0xFADE + A
    JNE([0x3039], 0x8800, ConstLabel('fail'))  # jne [0x3039], 0x8800, $fail
    SHL([A], 12345, G)  # shl [A], 12345, G
    JNE([0x00aa], 0x0720, ConstLabel('fail'))  # jne [0x00aa], 0x0720, $fail
    XOR([G], A * 4 + -10, A * 2)  # xor [G], A*4 + -10, A*2
    JNE([0x0155], 0x03ca, ConstLabel('fail'))  # jne [0x0155], 0x03ca, $fail
    OR([A * 4 + B], G, -123)  # or [A*4 + B], G, -123
    JNE([0x0363], 0xffd5, ConstLabel('fail'))  # jne [0x0363], 0xffd5, $fail
    SUB([A * 4 + -10], -123, 12345)  # sub [A*4 + -10], -123, 12345
    JNE([0x029e], 0xcf4c, ConstLabel('fail'))  # jne [0x029e], 0xcf4c, $fail
    SHL([A * 2], A * 2, A * 2)  # shl [A*2], A*2, A*2
    JNE([0x0154], 0x1540, ConstLabel('fail'))  # jne [0x0154], 0x1540, $fail
    SUB([12345], 0xFADE + A, 12345)  # sub [12345], 0xFADE + A, 12345
    JNE([0x3039], 0xcb4f, ConstLabel('fail'))  # jne [0x3039], 0xcb4f, $fail
    SHR([A * 2], 12345, -123)  # shr [A*2], 12345, -123
    JNE([0x0154], 0x0181, ConstLabel('fail'))  # jne [0x0154], 0x0181, $fail
    ISHR([12345], 0xFADE + A, A)  # ishr [12345], 0xFADE + A, A
    JNE([0x3039], 0xfffe, ConstLabel('fail'))  # jne [0x3039], 0xfffe, $fail
    XOR([A * 4 + -10], 0xFADE + A, 12345)  # xor [A*4 + -10], 0xFADE + A, 12345
    JNE([0x029e], 0xcbb1, ConstLabel('fail'))  # jne [0x029e], 0xcbb1, $fail
    SUB([A * 4 + -10], A * 2, A * 4 + -10)  # sub [A*4 + -10], A*2, A*4 + -10
    JNE([0x029e], 0xfeb6, ConstLabel('fail'))  # jne [0x029e], 0xfeb6, $fail
    IMUL([G], -123, A * 4 + -10)  # imul [G], -123, A*4 + -10
    JNE([0x0155], 0xbe16, ConstLabel('fail'))  # jne [0x0155], 0xbe16, $fail
    SHL([A], A * 4 + B, A * 4 + B)  # shl [A], A*4 + B, A*4 + B
    JNE([0x00aa], 0x1b18, ConstLabel('fail'))  # jne [0x00aa], 0x1b18, $fail
    XOR([12345], A * 2, A * 4 + B)  # xor [12345], A*2, A*4 + B
    JNE([0x3039], 0x0237, ConstLabel('fail'))  # jne [0x3039], 0x0237, $fail
    ADD([A * 2], A * 2, 12345)  # add [A*2], A*2, 12345
    JNE([0x0154], 0x318d, ConstLabel('fail'))  # jne [0x0154], 0x318d, $fail
    AND([A * 2], A * 4 + B, A)  # and [A*2], A*4 + B, A
    JNE([0x0154], 0x0022, ConstLabel('fail'))  # jne [0x0154], 0x0022, $fail
    SHL([A], A * 4 + B, 0xFADE + A)  # shl [A], A*4 + B, 0xFADE + A
    JNE([0x00aa], 0x6300, ConstLabel('fail'))  # jne [0x00aa], 0x6300, $fail
    AND([A * 4 + B], G, A)  # and [A*4 + B], G, A
    JNE([0x0363], 0x0000, ConstLabel('fail'))  # jne [0x0363], 0x0000, $fail
    XOR([G], A * 2, -123)  # xor [G], A*2, -123
    JNE([0x0155], 0xfed1, ConstLabel('fail'))  # jne [0x0155], 0xfed1, $fail
    AND([12345], G, A * 2)  # and [12345], G, A*2
    JNE([0x3039], 0x0154, ConstLabel('fail'))  # jne [0x3039], 0x0154, $fail
    OR([A * 4 + -10], 12345, A * 4 + B)  # or [A*4 + -10], 12345, A*4 + B
    JNE([0x029e], 0x337b, ConstLabel('fail'))  # jne [0x029e], 0x337b, $fail
    XOR([G], 0xFADE + A, A * 4 + -10)  # xor [G], 0xFADE + A, A*4 + -10
    JNE([0x0155], 0xf916, ConstLabel('fail'))  # jne [0x0155], 0xf916, $fail
    IMUL([A * 4 + B], A * 2, A * 4 + B)  # imul [A*4 + B], A*2, A*4 + B
    JNE([0x0363], 0x7f7c, ConstLabel('fail'))  # jne [0x0363], 0x7f7c, $fail
    ISHR([G], A * 2, G)  # ishr [G], A*2, G
    JNE([0x0155], 0x000a, ConstLabel('fail'))  # jne [0x0155], 0x000a, $fail
    MUL([A * 2], -123, -123)  # mul [A*2], -123, -123
    JNE([0x0154], 0x3b19, ConstLabel('fail'))  # jne [0x0154], 0x3b19, $fail
    IMUL([A * 4 + B], 0xFADE + A, A)  # imul [A*4 + B], 0xFADE + A, A
    JNE([0x0363], 0x0850, ConstLabel('fail'))  # jne [0x0363], 0x0850, $fail
    SHR([A * 4 + -10], A * 4 + -10, A * 4 + -10)  # shr [A*4 + -10], A*4 + -10, A*4 + -10
    JNE([0x029e], 0x0000, ConstLabel('fail'))  # jne [0x029e], 0x0000, $fail
    MUL([A], -123, 0xFADE + A)  # mul [A], -123, 0xFADE + A
    JNE([0x00aa], 0x25a8, ConstLabel('fail'))  # jne [0x00aa], 0x25a8, $fail
    ISHR([A * 4 + -10], A, A * 2)  # ishr [A*4 + -10], A, A*2
    JNE([0x029e], 0x000a, ConstLabel('fail'))  # jne [0x029e], 0x000a, $fail
    OR([A * 4 + -10], A, A)  # or [A*4 + -10], A, A
    JNE([0x029e], 0x00aa, ConstLabel('fail'))  # jne [0x029e], 0x00aa, $fail
    ADD([12345], G, 12345)  # add [12345], G, 12345
    JNE([0x3039], 0x318e, ConstLabel('fail'))  # jne [0x3039], 0x318e, $fail
    IMUL([A * 4 + -10], 12345, A * 4 + -10)  # imul [A*4 + -10], 12345, A*4 + -10
    JNE([0x029e], 0x352e, ConstLabel('fail'))  # jne [0x029e], 0x352e, $fail
    ISHR([G], G, A * 2)  # ishr [G], G, A*2
    JNE([0x0155], 0x0015, ConstLabel('fail'))  # jne [0x0155], 0x0015, $fail
    IMUL([A], 0xFADE + A, A * 4 + -10)  # imul [A], 0xFADE + A, A*4 + -10
    JNE([0x00aa], 0x4df0, ConstLabel('fail'))  # jne [0x00aa], 0x4df0, $fail
    ISHR([G], A, G)  # ishr [G], A, G
    JNE([0x0155], 0x0005, ConstLabel('fail'))  # jne [0x0155], 0x0005, $fail
    ADD([A * 4 + B], 12345, A * 4 + -10)  # add [A*4 + B], 12345, A*4 + -10
    JNE([0x0363], 0x32d7, ConstLabel('fail'))  # jne [0x0363], 0x32d7, $fail
    AND([A * 4 + -10], A * 4 + B, 0xFADE + A)  # and [A*4 + -10], A*4 + B, 0xFADE + A
    JNE([0x029e], 0x0300, ConstLabel('fail'))  # jne [0x029e], 0x0300, $fail
    IMUL([A], -123, A * 4 + B)  # imul [A], -123, A*4 + B
    JNE([0x00aa], 0x5f6f, ConstLabel('fail'))  # jne [0x00aa], 0x5f6f, $fail
    SHR([G], A * 4 + -10, 0xFADE + A)  # shr [G], A*4 + -10, 0xFADE + A
    JNE([0x0155], 0x0002, ConstLabel('fail'))  # jne [0x0155], 0x0002, $fail
    OR([A * 4 + B], 12345, A)  # or [A*4 + B], 12345, A
    JNE([0x0363], 0x30bb, ConstLabel('fail'))  # jne [0x0363], 0x30bb, $fail
    XOR([A * 4 + B], 12345, G)  # xor [A*4 + B], 12345, G
    JNE([0x0363], 0x316c, ConstLabel('fail'))  # jne [0x0363], 0x316c, $fail
    IMUL([A], A, 12345)  # imul [A], A, 12345
    JNE([0x00aa], 0x05da, ConstLabel('fail'))  # jne [0x00aa], 0x05da, $fail
    OR([A * 2], A * 4 + B, A * 4 + -10)  # or [A*2], A*4 + B, A*4 + -10
    JNE([0x0154], 0x03ff, ConstLabel('fail'))  # jne [0x0154], 0x03ff, $fail
    SHL([G], 0xFADE + A, 12345)  # shl [G], 0xFADE + A, 12345
    JNE([0x0155], 0x1000, ConstLabel('fail'))  # jne [0x0155], 0x1000, $fail
    ISHR([A * 4 + B], 0xFADE + A, A * 4 + B)  # ishr [A*4 + B], 0xFADE + A, A*4 + B
    JNE([0x0363], 0xff71, ConstLabel('fail'))  # jne [0x0363], 0xff71, $fail
    SHL([A * 4 + -10], 0xFADE + A, -123)  # shl [A*4 + -10], 0xFADE + A, -123
    JNE([0x029e], 0x7100, ConstLabel('fail'))  # jne [0x029e], 0x7100, $fail
    SHR([A * 4 + -10], 0xFADE + A, A)  # shr [A*4 + -10], 0xFADE + A, A
    JNE([0x029e], 0x003e, ConstLabel('fail'))  # jne [0x029e], 0x003e, $fail
    MUL([A * 4 + -10], A, A * 4 + B)  # mul [A*4 + -10], A, A*4 + B
    JNE([0x029e], 0x3fbe, ConstLabel('fail'))  # jne [0x029e], 0x3fbe, $fail
    OR([A * 2], A * 4 + -10, A * 4 + B)  # or [A*2], A*4 + -10, A*4 + B
    JNE([0x0154], 0x03ff, ConstLabel('fail'))  # jne [0x0154], 0x03ff, $fail
    IMUL([A * 4 + -10], A * 2, -123)  # imul [A*4 + -10], A*2, -123
    JNE([0x029e], 0x5ca4, ConstLabel('fail'))  # jne [0x029e], 0x5ca4, $fail
    SHL([12345], A * 4 + -10, A * 2)  # shl [12345], A*4 + -10, A*2
    JNE([0x3039], 0x29e0, ConstLabel('fail'))  # jne [0x3039], 0x29e0, $fail
    SHL([A * 2], 0xFADE + A, 0xFADE + A)  # shl [A*2], 0xFADE + A, 0xFADE + A
    JNE([0x0154], 0x8800, ConstLabel('fail'))  # jne [0x0154], 0x8800, $fail
    ADD([G], A * 2, A * 2)  # add [G], A*2, A*2
    JNE([0x0155], 0x02a8, ConstLabel('fail'))  # jne [0x0155], 0x02a8, $fail
    AND([A * 2], 0xFADE + A, G)  # and [A*2], 0xFADE + A, G
    JNE([0x0154], 0x0100, ConstLabel('fail'))  # jne [0x0154], 0x0100, $fail
    AND([A * 4 + -10], 12345, 12345)  # and [A*4 + -10], 12345, 12345
    JNE([0x029e], 0x3039, ConstLabel('fail'))  # jne [0x029e], 0x3039, $fail
    SHL([A * 4 + -10], A, -123)  # shl [A*4 + -10], A, -123
    JNE([0x029e], 0x1540, ConstLabel('fail'))  # jne [0x029e], 0x1540, $fail
    AND([A * 4 + B], A * 4 + -10, 0xFADE + A)  # and [A*4 + B], A*4 + -10, 0xFADE + A
    JNE([0x0363], 0x0288, ConstLabel('fail'))  # jne [0x0363], 0x0288, $fail
    ADD([G], -123, -123)  # add [G], -123, -123
    JNE([0x0155], 0xff0a, ConstLabel('fail'))  # jne [0x0155], 0xff0a, $fail
    MUL([A], A, 0xFADE + A)  # mul [A], A, 0xFADE + A
    JNE([0x00aa], 0x0850, ConstLabel('fail'))  # jne [0x00aa], 0x0850, $fail
    OR([A * 2], A * 4 + B, G)  # or [A*2], A*4 + B, G
    JNE([0x0154], 0x0377, ConstLabel('fail'))  # jne [0x0154], 0x0377, $fail
    SUB([G], 0xFADE + A, 0xFADE + A)  # sub [G], 0xFADE + A, 0xFADE + A
    JNE([0x0155], 0x0000, ConstLabel('fail'))  # jne [0x0155], 0x0000, $fail
    SHR([A * 4 + B], G, 0xFADE + A)  # shr [A*4 + B], G, 0xFADE + A
    JNE([0x0363], 0x0001, ConstLabel('fail'))  # jne [0x0363], 0x0001, $fail
    SUB([A * 2], -123, G)  # sub [A*2], -123, G
    JNE([0x0154], 0xfe30, ConstLabel('fail'))  # jne [0x0154], 0xfe30, $fail
    SHL([A * 4 + -10], A * 2, G)  # shl [A*4 + -10], A*2, G
    JNE([0x029e], 0x2a80, ConstLabel('fail'))  # jne [0x029e], 0x2a80, $fail
    SHL([A], -123, A * 4 + -10)  # shl [A], -123, A*4 + -10
    JNE([0x00aa], 0x4000, ConstLabel('fail'))  # jne [0x00aa], 0x4000, $fail
    MUL([A * 4 + -10], A * 4 + B, A * 2)  # mul [A*4 + -10], A*4 + B, A*2
    JNE([0x029e], 0x7f7c, ConstLabel('fail'))  # jne [0x029e], 0x7f7c, $fail
    SHR([A], A * 4 + B, G)  # shr [A], A*4 + B, G
    JNE([0x00aa], 0x001b, ConstLabel('fail'))  # jne [0x00aa], 0x001b, $fail
    ADD([A], A * 4 + B, 12345)  # add [A], A*4 + B, 12345
    JNE([0x00aa], 0x339c, ConstLabel('fail'))  # jne [0x00aa], 0x339c, $fail
    XOR([G], 12345, -123)  # xor [G], 12345, -123
    JNE([0x0155], 0xcfbc, ConstLabel('fail'))  # jne [0x0155], 0xcfbc, $fail
    SUB([A], 0xFADE + A, A * 4 + B)  # sub [A], 0xFADE + A, A*4 + B
    JNE([0x00aa], 0xf825, ConstLabel('fail'))  # jne [0x00aa], 0xf825, $fail
    ISHR([A * 4 + B], A * 2, G)  # ishr [A*4 + B], A*2, G
    JNE([0x0363], 0x000a, ConstLabel('fail'))  # jne [0x0363], 0x000a, $fail
    OR([A * 2], G, 0xFADE + A)  # or [A*2], G, 0xFADE + A
    JNE([0x0154], 0xfbdd, ConstLabel('fail'))  # jne [0x0154], 0xfbdd, $fail
    MUL([12345], 0xFADE + A, G)  # mul [12345], 0xFADE + A, G
    JNE([0x3039], 0x0c28, ConstLabel('fail'))  # jne [0x3039], 0x0c28, $fail
    IMUL([A * 4 + B], A * 4 + B, 0xFADE + A)  # imul [A*4 + B], A*4 + B, 0xFADE + A
    JNE([0x0363], 0xdd98, ConstLabel('fail'))  # jne [0x0363], 0xdd98, $fail
    AND([12345], A, G)  # and [12345], A, G
    JNE([0x3039], 0x0000, ConstLabel('fail'))  # jne [0x3039], 0x0000, $fail
    IMUL([G], G, A * 4 + B)  # imul [G], G, A*4 + B
    JNE([0x0155], 0x82df, ConstLabel('fail'))  # jne [0x0155], 0x82df, $fail
    IMUL([A * 4 + -10], A * 2, A * 2)  # imul [A*4 + -10], A*2, A*2
    JNE([0x029e], 0xc390, ConstLabel('fail'))  # jne [0x029e], 0xc390, $fail
    OR([G], 0xFADE + A, -123)  # or [G], 0xFADE + A, -123
    JNE([0x0155], 0xff8d, ConstLabel('fail'))  # jne [0x0155], 0xff8d, $fail
    IMUL([A * 4 + B], A, A * 4 + -10)  # imul [A*4 + B], A, A*4 + -10
    JNE([0x0363], 0xbcec, ConstLabel('fail'))  # jne [0x0363], 0xbcec, $fail
    SHR([A * 4 + B], A * 4 + -10, 12345)  # shr [A*4 + B], A*4 + -10, 12345
    JNE([0x0363], 0x0001, ConstLabel('fail'))  # jne [0x0363], 0x0001, $fail
    XOR([A * 4 + B], A * 2, 12345)  # xor [A*4 + B], A*2, 12345
    JNE([0x0363], 0x316d, ConstLabel('fail'))  # jne [0x0363], 0x316d, $fail
    SHR([12345], A * 4 + -10, 12345)  # shr [12345], A*4 + -10, 12345
    JNE([0x3039], 0x0001, ConstLabel('fail'))  # jne [0x3039], 0x0001, $fail
    SHR([A * 2], -123, A * 4 + -10)  # shr [A*2], -123, A*4 + -10
    JNE([0x0154], 0x0003, ConstLabel('fail'))  # jne [0x0154], 0x0003, $fail
    OR([A * 2], A, A * 2)  # or [A*2], A, A*2
    JNE([0x0154], 0x01fe, ConstLabel('fail'))  # jne [0x0154], 0x01fe, $fail
    SHR([G], A * 4 + B, A * 2)  # shr [G], A*4 + B, A*2
    JNE([0x0155], 0x0036, ConstLabel('fail'))  # jne [0x0155], 0x0036, $fail
    XOR([12345], A * 4 + -10, A * 4 + B)  # xor [12345], A*4 + -10, A*4 + B
    JNE([0x3039], 0x01fd, ConstLabel('fail'))  # jne [0x3039], 0x01fd, $fail
    MUL([A * 4 + -10], 0xFADE + A, A * 4 + -10)  # mul [A*4 + -10], 0xFADE + A, A*4 + -10
    JNE([0x029e], 0x4df0, ConstLabel('fail'))  # jne [0x029e], 0x4df0, $fail
    IMUL([A * 4 + B], A * 2, A * 4 + -10)  # imul [A*4 + B], A*2, A*4 + -10
    JNE([0x0363], 0x79d8, ConstLabel('fail'))  # jne [0x0363], 0x79d8, $fail
    SHR([12345], 0xFADE + A, A * 4 + -10)  # shr [12345], 0xFADE + A, A*4 + -10
    JNE([0x3039], 0x0003, ConstLabel('fail'))  # jne [0x3039], 0x0003, $fail
    ADD([A * 4 + -10], A, G)  # add [A*4 + -10], A, G
    JNE([0x029e], 0x01ff, ConstLabel('fail'))  # jne [0x029e], 0x01ff, $fail
    SHR([A * 4 + B], 0xFADE + A, 12345)  # shr [A*4 + B], 0xFADE + A, 12345
    JNE([0x0363], 0x007d, ConstLabel('fail'))  # jne [0x0363], 0x007d, $fail
    SHR([A * 4 + -10], -123, -123)  # shr [A*4 + -10], -123, -123
    JNE([0x029e], 0x07fc, ConstLabel('fail'))  # jne [0x029e], 0x07fc, $fail
    IMUL([A], -123, 12345)  # imul [A], -123, 12345
    JNE([0x00aa], 0xd49d, ConstLabel('fail'))  # jne [0x00aa], 0xd49d, $fail
    SHL([A * 4 + B], A * 4 + -10, A * 2)  # shl [A*4 + B], A*4 + -10, A*2
    JNE([0x0363], 0x29e0, ConstLabel('fail'))  # jne [0x0363], 0x29e0, $fail
    XOR([A * 2], 12345, G)  # xor [A*2], 12345, G
    JNE([0x0154], 0x316c, ConstLabel('fail'))  # jne [0x0154], 0x316c, $fail
    XOR([12345], A * 4 + -10, A * 4 + -10)  # xor [12345], A*4 + -10, A*4 + -10
    JNE([0x3039], 0x0000, ConstLabel('fail'))  # jne [0x3039], 0x0000, $fail
    XOR([A], A * 2, -123)  # xor [A], A*2, -123
    JNE([0x00aa], 0xfed1, ConstLabel('fail'))  # jne [0x00aa], 0xfed1, $fail
    XOR([A * 2], A * 2, G)  # xor [A*2], A*2, G
    JNE([0x0154], 0x0001, ConstLabel('fail'))  # jne [0x0154], 0x0001, $fail
    MUL([G], 12345, A)  # mul [G], 12345, A
    JNE([0x0155], 0x05da, ConstLabel('fail'))  # jne [0x0155], 0x05da, $fail
    XOR([A * 2], 12345, A * 2)  # xor [A*2], 12345, A*2
    JNE([0x0154], 0x316d, ConstLabel('fail'))  # jne [0x0154], 0x316d, $fail
    MUL([A * 2], A * 4 + B, 12345)  # mul [A*2], A*4 + B, 12345
    JNE([0x0154], 0x510b, ConstLabel('fail'))  # jne [0x0154], 0x510b, $fail
    AND([A * 4 + -10], 12345, -123)  # and [A*4 + -10], 12345, -123
    JNE([0x029e], 0x3001, ConstLabel('fail'))  # jne [0x029e], 0x3001, $fail
    SHL([G], A * 2, A)  # shl [G], A*2, A
    JNE([0x0155], 0x5000, ConstLabel('fail'))  # jne [0x0155], 0x5000, $fail
    AND([A], 0xFADE + A, A)  # and [A], 0xFADE + A, A
    JNE([0x00aa], 0x0088, ConstLabel('fail'))  # jne [0x00aa], 0x0088, $fail
    SHL([A * 2], A * 4 + -10, 0xFADE + A)  # shl [A*2], A*4 + -10, 0xFADE + A
    JNE([0x0154], 0x9e00, ConstLabel('fail'))  # jne [0x0154], 0x9e00, $fail
    XOR([12345], 12345, -123)  # xor [12345], 12345, -123
    JNE([0x3039], 0xcfbc, ConstLabel('fail'))  # jne [0x3039], 0xcfbc, $fail
    MUL([A * 4 + -10], A * 4 + -10, -123)  # mul [A*4 + -10], A*4 + -10, -123
    JNE([0x029e], 0xbe16, ConstLabel('fail'))  # jne [0x029e], 0xbe16, $fail
    SUB([G], A * 2, A * 4 + -10)  # sub [G], A*2, A*4 + -10
    JNE([0x0155], 0xfeb6, ConstLabel('fail'))  # jne [0x0155], 0xfeb6, $fail
    SUB([A * 4 + -10], A * 4 + B, G)  # sub [A*4 + -10], A*4 + B, G
    JNE([0x029e], 0x020e, ConstLabel('fail'))  # jne [0x029e], 0x020e, $fail
    XOR([A * 4 + -10], -123, G)  # xor [A*4 + -10], -123, G
    JNE([0x029e], 0xfed0, ConstLabel('fail'))  # jne [0x029e], 0xfed0, $fail
    SUB([A], A * 4 + B, -123)  # sub [A], A*4 + B, -123
    JNE([0x00aa], 0x03de, ConstLabel('fail'))  # jne [0x00aa], 0x03de, $fail
    SUB([A], A * 2, G)  # sub [A], A*2, G
    JNE([0x00aa], 0xffff, ConstLabel('fail'))  # jne [0x00aa], 0xffff, $fail
    SUB([A * 4 + B], A, 0xFADE + A)  # sub [A*4 + B], A, 0xFADE + A
    JNE([0x0363], 0x0522, ConstLabel('fail'))  # jne [0x0363], 0x0522, $fail
    SHL([12345], G, A * 4 + -10)  # shl [12345], G, A*4 + -10
    JNE([0x3039], 0x4000, ConstLabel('fail'))  # jne [0x3039], 0x4000, $fail
    AND([A], -123, -123)  # and [A], -123, -123
    JNE([0x00aa], 0xff85, ConstLabel('fail'))  # jne [0x00aa], 0xff85, $fail
    XOR([A], G, 12345)  # xor [A], G, 12345
    JNE([0x00aa], 0x316c, ConstLabel('fail'))  # jne [0x00aa], 0x316c, $fail
    OR([12345], A * 2, A * 4 + -10)  # or [12345], A*2, A*4 + -10
    JNE([0x3039], 0x03de, ConstLabel('fail'))  # jne [0x3039], 0x03de, $fail
    OR([A], 0xFADE + A, A * 2)  # or [A], 0xFADE + A, A*2
    JNE([0x00aa], 0xfbdc, ConstLabel('fail'))  # jne [0x00aa], 0xfbdc, $fail
    XOR([G], A * 4 + -10, A * 4 + -10)  # xor [G], A*4 + -10, A*4 + -10
    JNE([0x0155], 0x0000, ConstLabel('fail'))  # jne [0x0155], 0x0000, $fail
    XOR([A * 4 + -10], A, 0xFADE + A)  # xor [A*4 + -10], A, 0xFADE + A
    JNE([0x029e], 0xfb22, ConstLabel('fail'))  # jne [0x029e], 0xfb22, $fail
    XOR([12345], -123, 12345)  # xor [12345], -123, 12345
    JNE([0x3039], 0xcfbc, ConstLabel('fail'))  # jne [0x3039], 0xcfbc, $fail
    SHR([A * 4 + -10], G, A * 4 + B)  # shr [A*4 + -10], G, A*4 + B
    JNE([0x029e], 0x002a, ConstLabel('fail'))  # jne [0x029e], 0x002a, $fail
    AND([A], G, A)  # and [A], G, A
    JNE([0x00aa], 0x0000, ConstLabel('fail'))  # jne [0x00aa], 0x0000, $fail
    SUB([A * 4 + B], 0xFADE + A, -123)  # sub [A*4 + B], 0xFADE + A, -123
    JNE([0x0363], 0xfc03, ConstLabel('fail'))  # jne [0x0363], 0xfc03, $fail
    AND([12345], A * 2, A * 2)  # and [12345], A*2, A*2
    JNE([0x3039], 0x0154, ConstLabel('fail'))  # jne [0x3039], 0x0154, $fail
    SHR([12345], A, 12345)  # shr [12345], A, 12345
    JNE([0x3039], 0x0000, ConstLabel('fail'))  # jne [0x3039], 0x0000, $fail
    IMUL([A * 4 + -10], A * 4 + B, A * 4 + -10)  # imul [A*4 + -10], A*4 + B, A*4 + -10
    JNE([0x029e], 0xdd1a, ConstLabel('fail'))  # jne [0x029e], 0xdd1a, $fail
    SHR([12345], A * 4 + -10, -123)  # shr [12345], A*4 + -10, -123
    JNE([0x3039], 0x0014, ConstLabel('fail'))  # jne [0x3039], 0x0014, $fail
    ADD([G], A, 12345)  # add [G], A, 12345
    JNE([0x0155], 0x30e3, ConstLabel('fail'))  # jne [0x0155], 0x30e3, $fail
    ISHR([12345], A * 2, 12345)  # ishr [12345], A*2, 12345
    JNE([0x3039], 0x0000, ConstLabel('fail'))  # jne [0x3039], 0x0000, $fail
    ISHR([12345], 0xFADE + A, -123)  # ishr [12345], 0xFADE + A, -123
    JNE([0x3039], 0xffdc, ConstLabel('fail'))  # jne [0x3039], 0xffdc, $fail
    OR([A * 4 + -10], G, A)  # or [A*4 + -10], G, A
    JNE([0x029e], 0x01ff, ConstLabel('fail'))  # jne [0x029e], 0x01ff, $fail
    ISHR([A * 4 + B], A * 4 + B, A)  # ishr [A*4 + B], A*4 + B, A
    JNE([0x0363], 0x0000, ConstLabel('fail'))  # jne [0x0363], 0x0000, $fail
    SHL([G], 12345, A * 4 + B)  # shl [G], 12345, A*4 + B
    JNE([0x0155], 0x81c8, ConstLabel('fail'))  # jne [0x0155], 0x81c8, $fail
    MUL([A * 2], A * 4 + -10, A)  # mul [A*2], A*4 + -10, A
    JNE([0x0154], 0xbcec, ConstLabel('fail'))  # jne [0x0154], 0xbcec, $fail
    IMUL([A * 4 + -10], A * 4 + -10, 12345)  # imul [A*4 + -10], A*4 + -10, 12345
    JNE([0x029e], 0x352e, ConstLabel('fail'))  # jne [0x029e], 0x352e, $fail
    XOR([12345], -123, A * 4 + -10)  # xor [12345], -123, A*4 + -10
    JNE([0x3039], 0xfd1b, ConstLabel('fail'))  # jne [0x3039], 0xfd1b, $fail
    OR([G], A, 0xFADE + A)  # or [G], A, 0xFADE + A
    JNE([0x0155], 0xfbaa, ConstLabel('fail'))  # jne [0x0155], 0xfbaa, $fail
    IMUL([G], G, A * 4 + -10)  # imul [G], G, A*4 + -10
    JNE([0x0155], 0x7c76, ConstLabel('fail'))  # jne [0x0155], 0x7c76, $fail
    MUL([A], 12345, A * 4 + -10)  # mul [A], 12345, A*4 + -10
    JNE([0x00aa], 0x352e, ConstLabel('fail'))  # jne [0x00aa], 0x352e, $fail
    OR([G], A, A)  # or [G], A, A
    JNE([0x0155], 0x00aa, ConstLabel('fail'))  # jne [0x0155], 0x00aa, $fail
    SHR([A * 4 + -10], A * 2, 0xFADE + A)  # shr [A*4 + -10], A*2, 0xFADE + A
    JNE([0x029e], 0x0001, ConstLabel('fail'))  # jne [0x029e], 0x0001, $fail
    ISHR([A], A * 4 + -10, A * 4 + B)  # ishr [A], A*4 + -10, A*4 + B
    JNE([0x00aa], 0x0053, ConstLabel('fail'))  # jne [0x00aa], 0x0053, $fail
    ADD([A], 12345, A)  # add [A], 12345, A
    JNE([0x00aa], 0x30e3, ConstLabel('fail'))  # jne [0x00aa], 0x30e3, $fail
    ISHR([A], -123, A)  # ishr [A], -123, A
    JNE([0x00aa], 0xffff, ConstLabel('fail'))  # jne [0x00aa], 0xffff, $fail
    AND([A * 2], A, -123)  # and [A*2], A, -123
    JNE([0x0154], 0x0080, ConstLabel('fail'))  # jne [0x0154], 0x0080, $fail
    XOR([A * 4 + B], -123, 0xFADE + A)  # xor [A*4 + B], -123, 0xFADE + A
    JNE([0x0363], 0x040d, ConstLabel('fail'))  # jne [0x0363], 0x040d, $fail
    ADD([A], 12345, A * 2)  # add [A], 12345, A*2
    JNE([0x00aa], 0x318d, ConstLabel('fail'))  # jne [0x00aa], 0x318d, $fail
    ADD([A * 2], G, A * 4 + B)  # add [A*2], G, A*4 + B
    JNE([0x0154], 0x04b8, ConstLabel('fail'))  # jne [0x0154], 0x04b8, $fail
    OR([A], A * 4 + B, A)  # or [A], A*4 + B, A
    JNE([0x00aa], 0x03eb, ConstLabel('fail'))  # jne [0x00aa], 0x03eb, $fail
    ADD([A * 2], -123, 12345)  # add [A*2], -123, 12345
    JNE([0x0154], 0x2fbe, ConstLabel('fail'))  # jne [0x0154], 0x2fbe, $fail
    SHL([G], A * 4 + B, -123)  # shl [G], A*4 + B, -123
    JNE([0x0155], 0x6c60, ConstLabel('fail'))  # jne [0x0155], 0x6c60, $fail
    ADD([A * 4 + -10], A * 4 + -10, A * 4 + B)  # add [A*4 + -10], A*4 + -10, A*4 + B
    JNE([0x029e], 0x0601, ConstLabel('fail'))  # jne [0x029e], 0x0601, $fail
    OR([A], A * 4 + -10, 0xFADE + A)  # or [A], A*4 + -10, 0xFADE + A
    JNE([0x00aa], 0xfb9e, ConstLabel('fail'))  # jne [0x00aa], 0xfb9e, $fail
    SHL([A * 4 + B], A * 2, -123)  # shl [A*4 + B], A*2, -123
    JNE([0x0363], 0x2a80, ConstLabel('fail'))  # jne [0x0363], 0x2a80, $fail
    OR([12345], -123, A * 4 + B)  # or [12345], -123, A*4 + B
    JNE([0x3039], 0xffe7, ConstLabel('fail'))  # jne [0x3039], 0xffe7, $fail
    ADD([A * 2], A * 4 + B, A * 4 + B)  # add [A*2], A*4 + B, A*4 + B
    JNE([0x0154], 0x06c6, ConstLabel('fail'))  # jne [0x0154], 0x06c6, $fail
    AND([A], A * 2, A)  # and [A], A*2, A
    JNE([0x00aa], 0x0000, ConstLabel('fail'))  # jne [0x00aa], 0x0000, $fail
    SUB([A], G, -123)  # sub [A], G, -123
    JNE([0x00aa], 0x01d0, ConstLabel('fail'))  # jne [0x00aa], 0x01d0, $fail
    OR([A], A * 4 + B, A * 4 + -10)  # or [A], A*4 + B, A*4 + -10
    JNE([0x00aa], 0x03ff, ConstLabel('fail'))  # jne [0x00aa], 0x03ff, $fail
    XOR([A * 4 + B], A, A * 4 + B)  # xor [A*4 + B], A, A*4 + B
    JNE([0x0363], 0x03c9, ConstLabel('fail'))  # jne [0x0363], 0x03c9, $fail
    SHL([A * 2], G, A * 4 + -10)  # shl [A*2], G, A*4 + -10
    JNE([0x0154], 0x4000, ConstLabel('fail'))  # jne [0x0154], 0x4000, $fail
    AND([A * 4 + -10], 12345, A * 2)  # and [A*4 + -10], 12345, A*2
    JNE([0x029e], 0x0010, ConstLabel('fail'))  # jne [0x029e], 0x0010, $fail
    SHR([12345], A * 4 + B, 0xFADE + A)  # shr [12345], A*4 + B, 0xFADE + A
    JNE([0x3039], 0x0003, ConstLabel('fail'))  # jne [0x3039], 0x0003, $fail
    MUL([G], A * 2, A * 4 + B)  # mul [G], A*2, A*4 + B
    JNE([0x0155], 0x7f7c, ConstLabel('fail'))  # jne [0x0155], 0x7f7c, $fail
    SHR([A * 4 + -10], A * 4 + -10, G)  # shr [A*4 + -10], A*4 + -10, G
    JNE([0x029e], 0x0014, ConstLabel('fail'))  # jne [0x029e], 0x0014, $fail
    MUL([A], 12345, 0xFADE + A)  # mul [A], 12345, 0xFADE + A
    JNE([0x00aa], 0x8148, ConstLabel('fail'))  # jne [0x00aa], 0x8148, $fail
    MUL([A * 4 + B], -123, A * 4 + -10)  # mul [A*4 + B], -123, A*4 + -10
    JNE([0x0363], 0xbe16, ConstLabel('fail'))  # jne [0x0363], 0xbe16, $fail
    AND([A * 4 + B], -123, G)  # and [A*4 + B], -123, G
    JNE([0x0363], 0x0105, ConstLabel('fail'))  # jne [0x0363], 0x0105, $fail
    SHL([12345], 12345, A)  # shl [12345], 12345, A
    JNE([0x3039], 0xe400, ConstLabel('fail'))  # jne [0x3039], 0xe400, $fail
    IMUL([A], G, A * 4 + B)  # imul [A], G, A*4 + B
    JNE([0x00aa], 0x82df, ConstLabel('fail'))  # jne [0x00aa], 0x82df, $fail
    SUB([A * 4 + -10], -123, A * 4 + -10)  # sub [A*4 + -10], -123, A*4 + -10
    JNE([0x029e], 0xfce7, ConstLabel('fail'))  # jne [0x029e], 0xfce7, $fail
    SHL([A * 2], A, A * 4 + B)  # shl [A*2], A, A*4 + B
    JNE([0x0154], 0x0550, ConstLabel('fail'))  # jne [0x0154], 0x0550, $fail
    ADD([A], A * 4 + -10, A * 2)  # add [A], A*4 + -10, A*2
    JNE([0x00aa], 0x03f2, ConstLabel('fail'))  # jne [0x00aa], 0x03f2, $fail
    MUL([A * 2], G, -123)  # mul [A*2], G, -123
    JNE([0x0154], 0x5c29, ConstLabel('fail'))  # jne [0x0154], 0x5c29, $fail
    MUL([G], -123, 12345)  # mul [G], -123, 12345
    JNE([0x0155], 0xd49d, ConstLabel('fail'))  # jne [0x0155], 0xd49d, $fail
    ISHR([12345], A * 4 + B, A * 4 + B)  # ishr [12345], A*4 + B, A*4 + B
    JNE([0x3039], 0x006c, ConstLabel('fail'))  # jne [0x3039], 0x006c, $fail
    ADD([A * 4 + B], -123, A * 2)  # add [A*4 + B], -123, A*2
    JNE([0x0363], 0x00d9, ConstLabel('fail'))  # jne [0x0363], 0x00d9, $fail
    MUL([12345], 12345, G)  # mul [12345], 12345, G
    JNE([0x3039], 0x3bed, ConstLabel('fail'))  # jne [0x3039], 0x3bed, $fail
    OR([12345], A * 4 + B, G)  # or [12345], A*4 + B, G
    JNE([0x3039], 0x0377, ConstLabel('fail'))  # jne [0x3039], 0x0377, $fail
    SHL([A * 4 + B], -123, 12345)  # shl [A*4 + B], -123, 12345
    JNE([0x0363], 0x0a00, ConstLabel('fail'))  # jne [0x0363], 0x0a00, $fail
    MUL([G], -123, A * 4 + B)  # mul [G], -123, A*4 + B
    JNE([0x0155], 0x5f6f, ConstLabel('fail'))  # jne [0x0155], 0x5f6f, $fail
    AND([A * 4 + -10], 12345, G)  # and [A*4 + -10], 12345, G
    JNE([0x029e], 0x0011, ConstLabel('fail'))  # jne [0x029e], 0x0011, $fail
    ISHR([A * 4 + B], A * 2, 0xFADE + A)  # ishr [A*4 + B], A*2, 0xFADE + A
    JNE([0x0363], 0x0001, ConstLabel('fail'))  # jne [0x0363], 0x0001, $fail
    OR([A * 2], A * 2, A * 4 + B)  # or [A*2], A*2, A*4 + B
    JNE([0x0154], 0x0377, ConstLabel('fail'))  # jne [0x0154], 0x0377, $fail
    AND([A * 4 + B], G, G)  # and [A*4 + B], G, G
    JNE([0x0363], 0x0155, ConstLabel('fail'))  # jne [0x0363], 0x0155, $fail
    SHL([A * 4 + B], A * 4 + -10, A * 4 + -10)  # shl [A*4 + B], A*4 + -10, A*4 + -10
    JNE([0x0363], 0x8000, ConstLabel('fail'))  # jne [0x0363], 0x8000, $fail
    SUB([A * 4 + -10], A * 4 + B, -123)  # sub [A*4 + -10], A*4 + B, -123
    JNE([0x029e], 0x03de, ConstLabel('fail'))  # jne [0x029e], 0x03de, $fail
    AND([G], G, -123)  # and [G], G, -123
    JNE([0x0155], 0x0105, ConstLabel('fail'))  # jne [0x0155], 0x0105, $fail
    ISHR([A * 2], A * 4 + -10, -123)  # ishr [A*2], A*4 + -10, -123
    JNE([0x0154], 0x0014, ConstLabel('fail'))  # jne [0x0154], 0x0014, $fail
    OR([12345], A * 2, G)  # or [12345], A*2, G
    JNE([0x3039], 0x0155, ConstLabel('fail'))  # jne [0x3039], 0x0155, $fail
    OR([A * 4 + B], A, A * 2)  # or [A*4 + B], A, A*2
    JNE([0x0363], 0x01fe, ConstLabel('fail'))  # jne [0x0363], 0x01fe, $fail
    SHR([A * 2], A, 12345)  # shr [A*2], A, 12345
    JNE([0x0154], 0x0000, ConstLabel('fail'))  # jne [0x0154], 0x0000, $fail
    IMUL([A * 4 + -10], A * 4 + -10, 0xFADE + A)  # imul [A*4 + -10], A*4 + -10, 0xFADE + A
    JNE([0x029e], 0x4df0, ConstLabel('fail'))  # jne [0x029e], 0x4df0, $fail
    SHR([A * 4 + B], A * 4 + -10, G)  # shr [A*4 + B], A*4 + -10, G
    JNE([0x0363], 0x0014, ConstLabel('fail'))  # jne [0x0363], 0x0014, $fail
    SHL([12345], A * 4 + B, -123)  # shl [12345], A*4 + B, -123
    JNE([0x3039], 0x6c60, ConstLabel('fail'))  # jne [0x3039], 0x6c60, $fail
    SUB([12345], A * 4 + -10, A)  # sub [12345], A*4 + -10, A
    JNE([0x3039], 0x01f4, ConstLabel('fail'))  # jne [0x3039], 0x01f4, $fail
    SUB([G], A * 4 + -10, G)  # sub [G], A*4 + -10, G
    JNE([0x0155], 0x0149, ConstLabel('fail'))  # jne [0x0155], 0x0149, $fail
    XOR([A], A, A * 4 + B)  # xor [A], A, A*4 + B
    JNE([0x00aa], 0x03c9, ConstLabel('fail'))  # jne [0x00aa], 0x03c9, $fail
    SHR([A], A * 2, A * 2)  # shr [A], A*2, A*2
    JNE([0x00aa], 0x0015, ConstLabel('fail'))  # jne [0x00aa], 0x0015, $fail
    ADD([A * 4 + B], 12345, A * 2)  # add [A*4 + B], 12345, A*2
    JNE([0x0363], 0x318d, ConstLabel('fail'))  # jne [0x0363], 0x318d, $fail
    ADD([G], A * 4 + B, A * 4 + B)  # add [G], A*4 + B, A*4 + B
    JNE([0x0155], 0x06c6, ConstLabel('fail'))  # jne [0x0155], 0x06c6, $fail
    SHL([A * 4 + B], A * 4 + B, A * 4 + -10)  # shl [A*4 + B], A*4 + B, A*4 + -10
    JNE([0x0363], 0xc000, ConstLabel('fail'))  # jne [0x0363], 0xc000, $fail
    XOR([A * 4 + -10], A * 4 + B, A)  # xor [A*4 + -10], A*4 + B, A
    JNE([0x029e], 0x03c9, ConstLabel('fail'))  # jne [0x029e], 0x03c9, $fail
    MUL([A], 0xFADE + A, -123)  # mul [A], 0xFADE + A, -123
    JNE([0x00aa], 0x25a8, ConstLabel('fail'))  # jne [0x00aa], 0x25a8, $fail
    AND([A * 4 + -10], 12345, 0xFADE + A)  # and [A*4 + -10], 12345, 0xFADE + A
    JNE([0x029e], 0x3008, ConstLabel('fail'))  # jne [0x029e], 0x3008, $fail
    ADD([A], G, A * 2)  # add [A], G, A*2
    JNE([0x00aa], 0x02a9, ConstLabel('fail'))  # jne [0x00aa], 0x02a9, $fail
    SUB([G], 0xFADE + A, G)  # sub [G], 0xFADE + A, G
    JNE([0x0155], 0xfa33, ConstLabel('fail'))  # jne [0x0155], 0xfa33, $fail
    SHR([12345], A * 4 + -10, 0xFADE + A)  # shr [12345], A*4 + -10, 0xFADE + A
    JNE([0x3039], 0x0002, ConstLabel('fail'))  # jne [0x3039], 0x0002, $fail
    SHR([A * 4 + -10], A * 2, A * 4 + B)  # shr [A*4 + -10], A*2, A*4 + B
    JNE([0x029e], 0x002a, ConstLabel('fail'))  # jne [0x029e], 0x002a, $fail
    SHR([G], A, A * 4 + B)  # shr [G], A, A*4 + B
    JNE([0x0155], 0x0015, ConstLabel('fail'))  # jne [0x0155], 0x0015, $fail
    IMUL([A * 4 + B], G, A * 2)  # imul [A*4 + B], G, A*2
    JNE([0x0363], 0xc4e4, ConstLabel('fail'))  # jne [0x0363], 0xc4e4, $fail
    MUL([A * 4 + -10], 0xFADE + A, 0xFADE + A)  # mul [A*4 + -10], 0xFADE + A, 0xFADE + A
    JNE([0x029e], 0xf840, ConstLabel('fail'))  # jne [0x029e], 0xf840, $fail
    ADD([A * 4 + -10], A * 4 + B, 12345)  # add [A*4 + -10], A*4 + B, 12345
    JNE([0x029e], 0x339c, ConstLabel('fail'))  # jne [0x029e], 0x339c, $fail
    XOR([A * 4 + B], G, A * 4 + -10)  # xor [A*4 + B], G, A*4 + -10
    JNE([0x0363], 0x03cb, ConstLabel('fail'))  # jne [0x0363], 0x03cb, $fail
    XOR([A * 2], 0xFADE + A, A)  # xor [A*2], 0xFADE + A, A
    JNE([0x0154], 0xfb22, ConstLabel('fail'))  # jne [0x0154], 0xfb22, $fail
    SHR([12345], 12345, A * 2)  # shr [12345], 12345, A*2
    JNE([0x3039], 0x0303, ConstLabel('fail'))  # jne [0x3039], 0x0303, $fail
    IMUL([A * 4 + B], G, 12345)  # imul [A*4 + B], G, 12345
    JNE([0x0363], 0x3bed, ConstLabel('fail'))  # jne [0x0363], 0x3bed, $fail
    XOR([12345], -123, A * 2)  # xor [12345], -123, A*2
    JNE([0x3039], 0xfed1, ConstLabel('fail'))  # jne [0x3039], 0xfed1, $fail
    SUB([12345], G, 0xFADE + A)  # sub [12345], G, 0xFADE + A
    JNE([0x3039], 0x05cd, ConstLabel('fail'))  # jne [0x3039], 0x05cd, $fail
    XOR([A], A * 2, 0xFADE + A)  # xor [A], A*2, 0xFADE + A
    JNE([0x00aa], 0xfadc, ConstLabel('fail'))  # jne [0x00aa], 0xfadc, $fail
    MUL([A * 2], A * 4 + -10, 12345)  # mul [A*2], A*4 + -10, 12345
    JNE([0x0154], 0x352e, ConstLabel('fail'))  # jne [0x0154], 0x352e, $fail
    SHL([A * 4 + B], A * 2, A)  # shl [A*4 + B], A*2, A
    JNE([0x0363], 0x5000, ConstLabel('fail'))  # jne [0x0363], 0x5000, $fail
    AND([G], -123, 0xFADE + A)  # and [G], -123, 0xFADE + A
    JNE([0x0155], 0xfb80, ConstLabel('fail'))  # jne [0x0155], 0xfb80, $fail
    SHR([A], A, A * 2)  # shr [A], A, A*2
    JNE([0x00aa], 0x000a, ConstLabel('fail'))  # jne [0x00aa], 0x000a, $fail
    XOR([A * 4 + -10], A, A * 4 + -10)  # xor [A*4 + -10], A, A*4 + -10
    JNE([0x029e], 0x0234, ConstLabel('fail'))  # jne [0x029e], 0x0234, $fail
    SHL([A * 4 + -10], A * 4 + -10, A * 2)  # shl [A*4 + -10], A*4 + -10, A*2
    JNE([0x029e], 0x29e0, ConstLabel('fail'))  # jne [0x029e], 0x29e0, $fail
    MUL([A], A * 4 + -10, -123)  # mul [A], A*4 + -10, -123
    JNE([0x00aa], 0xbe16, ConstLabel('fail'))  # jne [0x00aa], 0xbe16, $fail
    OR([G], G, 12345)  # or [G], G, 12345
    JNE([0x0155], 0x317d, ConstLabel('fail'))  # jne [0x0155], 0x317d, $fail
    SHR([A * 4 + B], 0xFADE + A, A * 4 + -10)  # shr [A*4 + B], 0xFADE + A, A*4 + -10
    JNE([0x0363], 0x0003, ConstLabel('fail'))  # jne [0x0363], 0x0003, $fail
    MUL([A * 4 + B], A, 12345)  # mul [A*4 + B], A, 12345
    JNE([0x0363], 0x05da, ConstLabel('fail'))  # jne [0x0363], 0x05da, $fail
    AND([A * 4 + -10], A * 2, 12345)  # and [A*4 + -10], A*2, 12345
    JNE([0x029e], 0x0010, ConstLabel('fail'))  # jne [0x029e], 0x0010, $fail
    AND([12345], A, A * 4 + B)  # and [12345], A, A*4 + B
    JNE([0x3039], 0x0022, ConstLabel('fail'))  # jne [0x3039], 0x0022, $fail
    IMUL([G], A * 4 + B, G)  # imul [G], A*4 + B, G
    JNE([0x0155], 0x82df, ConstLabel('fail'))  # jne [0x0155], 0x82df, $fail
    SUB([12345], G, A * 4 + B)  # sub [12345], G, A*4 + B
    JNE([0x3039], 0xfdf2, ConstLabel('fail'))  # jne [0x3039], 0xfdf2, $fail
    SHR([A * 4 + B], G, A * 4 + B)  # shr [A*4 + B], G, A*4 + B
    JNE([0x0363], 0x002a, ConstLabel('fail'))  # jne [0x0363], 0x002a, $fail
    OR([A * 4 + -10], G, G)  # or [A*4 + -10], G, G
    JNE([0x029e], 0x0155, ConstLabel('fail'))  # jne [0x029e], 0x0155, $fail
    XOR([A * 2], A, G)  # xor [A*2], A, G
    JNE([0x0154], 0x01ff, ConstLabel('fail'))  # jne [0x0154], 0x01ff, $fail
    SHR([G], A * 4 + -10, -123)  # shr [G], A*4 + -10, -123
    JNE([0x0155], 0x0014, ConstLabel('fail'))  # jne [0x0155], 0x0014, $fail
    ISHR([12345], G, A)  # ishr [12345], G, A
    JNE([0x3039], 0x0000, ConstLabel('fail'))  # jne [0x3039], 0x0000, $fail
    MUL([A * 2], -123, 0xFADE + A)  # mul [A*2], -123, 0xFADE + A
    JNE([0x0154], 0x25a8, ConstLabel('fail'))  # jne [0x0154], 0x25a8, $fail
    OR([A * 2], 0xFADE + A, 12345)  # or [A*2], 0xFADE + A, 12345
    JNE([0x0154], 0xfbb9, ConstLabel('fail'))  # jne [0x0154], 0xfbb9, $fail
    IMUL([A * 4 + B], 12345, 0xFADE + A)  # imul [A*4 + B], 12345, 0xFADE + A
    JNE([0x0363], 0x8148, ConstLabel('fail'))  # jne [0x0363], 0x8148, $fail
    OR([A * 4 + -10], G, -123)  # or [A*4 + -10], G, -123
    JNE([0x029e], 0xffd5, ConstLabel('fail'))  # jne [0x029e], 0xffd5, $fail
    ISHR([A * 4 + -10], A * 2, A)  # ishr [A*4 + -10], A*2, A
    JNE([0x029e], 0x0000, ConstLabel('fail'))  # jne [0x029e], 0x0000, $fail
    AND([A * 2], A * 4 + B, -123)  # and [A*2], A*4 + B, -123
    JNE([0x0154], 0x0301, ConstLabel('fail'))  # jne [0x0154], 0x0301, $fail
    OR([A], A * 2, A * 4 + -10)  # or [A], A*2, A*4 + -10
    JNE([0x00aa], 0x03de, ConstLabel('fail'))  # jne [0x00aa], 0x03de, $fail
    ADD([G], A * 4 + -10, A)  # add [G], A*4 + -10, A
    JNE([0x0155], 0x0348, ConstLabel('fail'))  # jne [0x0155], 0x0348, $fail
    SHL([A * 4 + -10], A, 12345)  # shl [A*4 + -10], A, 12345
    JNE([0x029e], 0x5400, ConstLabel('fail'))  # jne [0x029e], 0x5400, $fail
    SHL([A], 0xFADE + A, 0xFADE + A)  # shl [A], 0xFADE + A, 0xFADE + A
    JNE([0x00aa], 0x8800, ConstLabel('fail'))  # jne [0x00aa], 0x8800, $fail
    IMUL([G], A * 4 + -10, 12345)  # imul [G], A*4 + -10, 12345
    JNE([0x0155], 0x352e, ConstLabel('fail'))  # jne [0x0155], 0x352e, $fail
    ADD([12345], -123, -123)  # add [12345], -123, -123
    JNE([0x3039], 0xff0a, ConstLabel('fail'))  # jne [0x3039], 0xff0a, $fail
    SUB([A * 2], A * 4 + -10, G)  # sub [A*2], A*4 + -10, G
    JNE([0x0154], 0x0149, ConstLabel('fail'))  # jne [0x0154], 0x0149, $fail
    ISHR([A], 0xFADE + A, G)  # ishr [A], 0xFADE + A, G
    JNE([0x00aa], 0xffdc, ConstLabel('fail'))  # jne [0x00aa], 0xffdc, $fail
    XOR([A], 0xFADE + A, 12345)  # xor [A], 0xFADE + A, 12345
    JNE([0x00aa], 0xcbb1, ConstLabel('fail'))  # jne [0x00aa], 0xcbb1, $fail
    SUB([G], A * 2, 0xFADE + A)  # sub [G], A*2, 0xFADE + A
    JNE([0x0155], 0x05cc, ConstLabel('fail'))  # jne [0x0155], 0x05cc, $fail
    ADD([A * 4 + B], 12345, 12345)  # add [A*4 + B], 12345, 12345
    JNE([0x0363], 0x6072, ConstLabel('fail'))  # jne [0x0363], 0x6072, $fail
    SUB([A * 4 + -10], -123, 0xFADE + A)  # sub [A*4 + -10], -123, 0xFADE + A
    JNE([0x029e], 0x03fd, ConstLabel('fail'))  # jne [0x029e], 0x03fd, $fail
    ADD([A * 2], A * 2, A * 4 + -10)  # add [A*2], A*2, A*4 + -10
    JNE([0x0154], 0x03f2, ConstLabel('fail'))  # jne [0x0154], 0x03f2, $fail
    SHR([A], 12345, -123)  # shr [A], 12345, -123
    JNE([0x00aa], 0x0181, ConstLabel('fail'))  # jne [0x00aa], 0x0181, $fail
    IMUL([A * 2], A, A * 4 + -10)  # imul [A*2], A, A*4 + -10
    JNE([0x0154], 0xbcec, ConstLabel('fail'))  # jne [0x0154], 0xbcec, $fail
    OR([A * 4 + -10], G, 0xFADE + A)  # or [A*4 + -10], G, 0xFADE + A
    JNE([0x029e], 0xfbdd, ConstLabel('fail'))  # jne [0x029e], 0xfbdd, $fail
    ISHR([G], A, -123)  # ishr [G], A, -123
    JNE([0x0155], 0x0005, ConstLabel('fail'))  # jne [0x0155], 0x0005, $fail
    ISHR([A * 2], A, 0xFADE + A)  # ishr [A*2], A, 0xFADE + A
    JNE([0x0154], 0x0000, ConstLabel('fail'))  # jne [0x0154], 0x0000, $fail
    SHR([12345], -123, A)  # shr [12345], -123, A
    JNE([0x3039], 0x003f, ConstLabel('fail'))  # jne [0x3039], 0x003f, $fail
    IMUL([A], A, A * 4 + -10)  # imul [A], A, A*4 + -10
    JNE([0x00aa], 0xbcec, ConstLabel('fail'))  # jne [0x00aa], 0xbcec, $fail
    ADD([A * 4 + B], 0xFADE + A, G)  # add [A*4 + B], 0xFADE + A, G
    JNE([0x0363], 0xfcdd, ConstLabel('fail'))  # jne [0x0363], 0xfcdd, $fail
    XOR([G], 12345, A * 4 + -10)  # xor [G], 12345, A*4 + -10
    JNE([0x0155], 0x32a7, ConstLabel('fail'))  # jne [0x0155], 0x32a7, $fail
    IMUL([A], 12345, A * 4 + B)  # imul [A], 12345, A*4 + B
    JNE([0x00aa], 0x510b, ConstLabel('fail'))  # jne [0x00aa], 0x510b, $fail
    OR([A * 4 + -10], 0xFADE + A, G)  # or [A*4 + -10], 0xFADE + A, G
    JNE([0x029e], 0xfbdd, ConstLabel('fail'))  # jne [0x029e], 0xfbdd, $fail
    SUB([A * 2], -123, A * 2)  # sub [A*2], -123, A*2
    JNE([0x0154], 0xfe31, ConstLabel('fail'))  # jne [0x0154], 0xfe31, $fail
    OR([A * 4 + B], A * 2, A * 2)  # or [A*4 + B], A*2, A*2
    JNE([0x0363], 0x0154, ConstLabel('fail'))  # jne [0x0363], 0x0154, $fail
    IMUL([12345], A, A * 4 + -10)  # imul [12345], A, A*4 + -10
    JNE([0x3039], 0xbcec, ConstLabel('fail'))  # jne [0x3039], 0xbcec, $fail
    ISHR([A * 4 + -10], 0xFADE + A, A * 4 + B)  # ishr [A*4 + -10], 0xFADE + A, A*4 + B
    JNE([0x029e], 0xff71, ConstLabel('fail'))  # jne [0x029e], 0xff71, $fail
    AND([12345], A, 0xFADE + A)  # and [12345], A, 0xFADE + A
    JNE([0x3039], 0x0088, ConstLabel('fail'))  # jne [0x3039], 0x0088, $fail
    ISHR([A], G, G)  # ishr [A], G, G
    JNE([0x00aa], 0x000a, ConstLabel('fail'))  # jne [0x00aa], 0x000a, $fail
    IMUL([A], A * 4 + -10, A)  # imul [A], A*4 + -10, A
    JNE([0x00aa], 0xbcec, ConstLabel('fail'))  # jne [0x00aa], 0xbcec, $fail
    OR([12345], A * 4 + -10, G)  # or [12345], A*4 + -10, G
    JNE([0x3039], 0x03df, ConstLabel('fail'))  # jne [0x3039], 0x03df, $fail
    ADD([A * 2], 12345, 0xFADE + A)  # add [A*2], 12345, 0xFADE + A
    JNE([0x0154], 0x2bc1, ConstLabel('fail'))  # jne [0x0154], 0x2bc1, $fail
    ADD([12345], -123, 0xFADE + A)  # add [12345], -123, 0xFADE + A
    JNE([0x3039], 0xfb0d, ConstLabel('fail'))  # jne [0x3039], 0xfb0d, $fail
    OR([G], A, A * 2)  # or [G], A, A*2
    JNE([0x0155], 0x01fe, ConstLabel('fail'))  # jne [0x0155], 0x01fe, $fail
    SHL([A * 2], A * 4 + B, A * 2)  # shl [A*2], A*4 + B, A*2
    JNE([0x0154], 0x3630, ConstLabel('fail'))  # jne [0x0154], 0x3630, $fail
    ADD([12345], A * 4 + B, 12345)  # add [12345], A*4 + B, 12345
    JNE([0x3039], 0x339c, ConstLabel('fail'))  # jne [0x3039], 0x339c, $fail
    AND([A * 4 + B], A, -123)  # and [A*4 + B], A, -123
    JNE([0x0363], 0x0080, ConstLabel('fail'))  # jne [0x0363], 0x0080, $fail
    XOR([12345], A, -123)  # xor [12345], A, -123
    JNE([0x3039], 0xff2f, ConstLabel('fail'))  # jne [0x3039], 0xff2f, $fail
    AND([A * 2], G, 12345)  # and [A*2], G, 12345
    JNE([0x0154], 0x0011, ConstLabel('fail'))  # jne [0x0154], 0x0011, $fail
    AND([A * 4 + -10], G, A * 4 + -10)  # and [A*4 + -10], G, A*4 + -10
    JNE([0x029e], 0x0014, ConstLabel('fail'))  # jne [0x029e], 0x0014, $fail
    MUL([A * 4 + -10], A * 4 + B, A * 4 + B)  # mul [A*4 + -10], A*4 + B, A*4 + B
    JNE([0x029e], 0x7849, ConstLabel('fail'))  # jne [0x029e], 0x7849, $fail
    ADD([A], A * 4 + -10, 12345)  # add [A], A*4 + -10, 12345
    JNE([0x00aa], 0x32d7, ConstLabel('fail'))  # jne [0x00aa], 0x32d7, $fail
    ADD([A * 2], 12345, A * 4 + -10)  # add [A*2], 12345, A*4 + -10
    JNE([0x0154], 0x32d7, ConstLabel('fail'))  # jne [0x0154], 0x32d7, $fail
    XOR([A * 2], A * 4 + -10, A * 4 + -10)  # xor [A*2], A*4 + -10, A*4 + -10
    JNE([0x0154], 0x0000, ConstLabel('fail'))  # jne [0x0154], 0x0000, $fail
    ISHR([12345], A, A)  # ishr [12345], A, A
    JNE([0x3039], 0x0000, ConstLabel('fail'))  # jne [0x3039], 0x0000, $fail
    ISHR([12345], 12345, A * 4 + -10)  # ishr [12345], 12345, A*4 + -10
    JNE([0x3039], 0x0000, ConstLabel('fail'))  # jne [0x3039], 0x0000, $fail
    SHL([A], -123, A * 2)  # shl [A], -123, A*2
    JNE([0x00aa], 0xf850, ConstLabel('fail'))  # jne [0x00aa], 0xf850, $fail
    AND([12345], A * 2, 0xFADE + A)  # and [12345], A*2, 0xFADE + A
    JNE([0x3039], 0x0100, ConstLabel('fail'))  # jne [0x3039], 0x0100, $fail
    OR([A * 4 + -10], -123, A)  # or [A*4 + -10], -123, A
    JNE([0x029e], 0xffaf, ConstLabel('fail'))  # jne [0x029e], 0xffaf, $fail
    IMUL([A * 2], -123, A)  # imul [A*2], -123, A
    JNE([0x0154], 0xae52, ConstLabel('fail'))  # jne [0x0154], 0xae52, $fail
    MUL([A * 4 + B], A * 4 + B, A * 4 + B)  # mul [A*4 + B], A*4 + B, A*4 + B
    JNE([0x0363], 0x7849, ConstLabel('fail'))  # jne [0x0363], 0x7849, $fail
    SUB([A * 4 + B], A * 4 + B, 12345)  # sub [A*4 + B], A*4 + B, 12345
    JNE([0x0363], 0xd32a, ConstLabel('fail'))  # jne [0x0363], 0xd32a, $fail
    AND([G], -123, A * 2)  # and [G], -123, A*2
    JNE([0x0155], 0x0104, ConstLabel('fail'))  # jne [0x0155], 0x0104, $fail
    IMUL([A * 2], 0xFADE + A, -123)  # imul [A*2], 0xFADE + A, -123
    JNE([0x0154], 0x25a8, ConstLabel('fail'))  # jne [0x0154], 0x25a8, $fail
    MUL([A * 2], A * 2, 0xFADE + A)  # mul [A*2], A*2, 0xFADE + A
    JNE([0x0154], 0x10a0, ConstLabel('fail'))  # jne [0x0154], 0x10a0, $fail
    SUB([G], 12345, G)  # sub [G], 12345, G
    JNE([0x0155], 0x2ee4, ConstLabel('fail'))  # jne [0x0155], 0x2ee4, $fail
    MOV([A], -123)  # mov [A], -123
    JNE([0x00aa], 0xff85, ConstLabel('fail'))  # jne [0x00aa], 0xff85, $fail
    MOV([A * 4 + -10], A * 4 + -10)  # mov [A*4 + -10], A*4 + -10
    JNE([0x029e], 0x029e, ConstLabel('fail'))  # jne [0x029e], 0x029e, $fail
    MOV([A * 2], A * 4 + B)  # mov [A*2], A*4 + B
    JNE([0x0154], 0x0363, ConstLabel('fail'))  # jne [0x0154], 0x0363, $fail
    MOV([12345], -123)  # mov [12345], -123
    JNE([0x3039], 0xff85, ConstLabel('fail'))  # jne [0x3039], 0xff85, $fail
    MOV([G], A * 4 + -10)  # mov [G], A*4 + -10
    JNE([0x0155], 0x029e, ConstLabel('fail'))  # jne [0x0155], 0x029e, $fail
    MOV([12345], G)  # mov [12345], G
    JNE([0x3039], 0x0155, ConstLabel('fail'))  # jne [0x3039], 0x0155, $fail
    MOV([G], A * 2)  # mov [G], A*2
    JNE([0x0155], 0x0154, ConstLabel('fail'))  # jne [0x0155], 0x0154, $fail
    MOV([A * 4 + -10], 0xFADE + A)  # mov [A*4 + -10], 0xFADE + A
    JNE([0x029e], 0xfb88, ConstLabel('fail'))  # jne [0x029e], 0xfb88, $fail
    MOV([12345], 12345)  # mov [12345], 12345
    JNE([0x3039], 0x3039, ConstLabel('fail'))  # jne [0x3039], 0x3039, $fail
    MOV([A * 4 + -10], G)  # mov [A*4 + -10], G
    JNE([0x029e], 0x0155, ConstLabel('fail'))  # jne [0x029e], 0x0155, $fail
    MOV([A], G)  # mov [A], G
    JNE([0x00aa], 0x0155, ConstLabel('fail'))  # jne [0x00aa], 0x0155, $fail
    MOV([A * 4 + B], A * 4 + B)  # mov [A*4 + B], A*4 + B
    JNE([0x0363], 0x0363, ConstLabel('fail'))  # jne [0x0363], 0x0363, $fail
    MOV([A * 4 + -10], A * 4 + B)  # mov [A*4 + -10], A*4 + B
    JNE([0x029e], 0x0363, ConstLabel('fail'))  # jne [0x029e], 0x0363, $fail
    MOV([A * 4 + B], A)  # mov [A*4 + B], A
    JNE([0x0363], 0x00aa, ConstLabel('fail'))  # jne [0x0363], 0x00aa, $fail
    MOV([A * 4 + -10], A)  # mov [A*4 + -10], A
    JNE([0x029e], 0x00aa, ConstLabel('fail'))  # jne [0x029e], 0x00aa, $fail
    MOV([A], A)  # mov [A], A
    JNE([0x00aa], 0x00aa, ConstLabel('fail'))  # jne [0x00aa], 0x00aa, $fail
    MOV([A * 4 + B], 0xFADE + A)  # mov [A*4 + B], 0xFADE + A
    JNE([0x0363], 0xfb88, ConstLabel('fail'))  # jne [0x0363], 0xfb88, $fail
    MOV([A * 2], -123)  # mov [A*2], -123
    JNE([0x0154], 0xff85, ConstLabel('fail'))  # jne [0x0154], 0xff85, $fail
    MOV([A * 4 + B], 12345)  # mov [A*4 + B], 12345
    JNE([0x0363], 0x3039, ConstLabel('fail'))  # jne [0x0363], 0x3039, $fail
    MOV([A * 4 + -10], -123)  # mov [A*4 + -10], -123
    JNE([0x029e], 0xff85, ConstLabel('fail'))  # jne [0x029e], 0xff85, $fail
    MOV([A * 4 + -10], A * 2)  # mov [A*4 + -10], A*2
    JNE([0x029e], 0x0154, ConstLabel('fail'))  # jne [0x029e], 0x0154, $fail
    MOV([A * 2], A * 4 + -10)  # mov [A*2], A*4 + -10
    JNE([0x0154], 0x029e, ConstLabel('fail'))  # jne [0x0154], 0x029e, $fail
    MOV([12345], A * 2)  # mov [12345], A*2
    JNE([0x3039], 0x0154, ConstLabel('fail'))  # jne [0x3039], 0x0154, $fail
    MOV([A * 2], G)  # mov [A*2], G
    JNE([0x0154], 0x0155, ConstLabel('fail'))  # jne [0x0154], 0x0155, $fail
    MOV([A * 4 + B], G)  # mov [A*4 + B], G
    JNE([0x0363], 0x0155, ConstLabel('fail'))  # jne [0x0363], 0x0155, $fail
    MOV([A * 2], 0xFADE + A)  # mov [A*2], 0xFADE + A
    JNE([0x0154], 0xfb88, ConstLabel('fail'))  # jne [0x0154], 0xfb88, $fail
    MOV([A], A * 4 + -10)  # mov [A], A*4 + -10
    JNE([0x00aa], 0x029e, ConstLabel('fail'))  # jne [0x00aa], 0x029e, $fail
    MOV([12345], A * 4 + -10)  # mov [12345], A*4 + -10
    JNE([0x3039], 0x029e, ConstLabel('fail'))  # jne [0x3039], 0x029e, $fail
    MOV([A * 4 + B], A * 4 + -10)  # mov [A*4 + B], A*4 + -10
    JNE([0x0363], 0x029e, ConstLabel('fail'))  # jne [0x0363], 0x029e, $fail
    MOV([12345], 0xFADE + A)  # mov [12345], 0xFADE + A
    JNE([0x3039], 0xfb88, ConstLabel('fail'))  # jne [0x3039], 0xfb88, $fail
    MOV([A * 2], 12345)  # mov [A*2], 12345
    JNE([0x0154], 0x3039, ConstLabel('fail'))  # jne [0x0154], 0x3039, $fail
    MOV([G], -123)  # mov [G], -123
    JNE([0x0155], 0xff85, ConstLabel('fail'))  # jne [0x0155], 0xff85, $fail
    MOV([12345], A * 4 + B)  # mov [12345], A*4 + B
    JNE([0x3039], 0x0363, ConstLabel('fail'))  # jne [0x3039], 0x0363, $fail
    MOV([G], 0xFADE + A)  # mov [G], 0xFADE + A
    JNE([0x0155], 0xfb88, ConstLabel('fail'))  # jne [0x0155], 0xfb88, $fail
    MOV([A], 12345)  # mov [A], 12345
    JNE([0x00aa], 0x3039, ConstLabel('fail'))  # jne [0x00aa], 0x3039, $fail
    MOV([A], A * 2)  # mov [A], A*2
    JNE([0x00aa], 0x0154, ConstLabel('fail'))  # jne [0x00aa], 0x0154, $fail
    MOV([A * 4 + -10], 12345)  # mov [A*4 + -10], 12345
    JNE([0x029e], 0x3039, ConstLabel('fail'))  # jne [0x029e], 0x3039, $fail
    MOV([G], A)  # mov [G], A
    JNE([0x0155], 0x00aa, ConstLabel('fail'))  # jne [0x0155], 0x00aa, $fail
    MOV([A * 2], A)  # mov [A*2], A
    JNE([0x0154], 0x00aa, ConstLabel('fail'))  # jne [0x0154], 0x00aa, $fail
    MOV([G], G)  # mov [G], G
    JNE([0x0155], 0x0155, ConstLabel('fail'))  # jne [0x0155], 0x0155, $fail
    MOV([A], A * 4 + B)  # mov [A], A*4 + B
    JNE([0x00aa], 0x0363, ConstLabel('fail'))  # jne [0x00aa], 0x0363, $fail
    MOV([A * 4 + B], -123)  # mov [A*4 + B], -123
    JNE([0x0363], 0xff85, ConstLabel('fail'))  # jne [0x0363], 0xff85, $fail
    MOV([A * 4 + B], A * 2)  # mov [A*4 + B], A*2
    JNE([0x0363], 0x0154, ConstLabel('fail'))  # jne [0x0363], 0x0154, $fail
    MOV([12345], A)  # mov [12345], A
    JNE([0x3039], 0x00aa, ConstLabel('fail'))  # jne [0x3039], 0x00aa, $fail
    MOV([G], 12345)  # mov [G], 12345
    JNE([0x0155], 0x3039, ConstLabel('fail'))  # jne [0x0155], 0x3039, $fail
    MOV([A * 2], A * 2)  # mov [A*2], A*2
    JNE([0x0154], 0x0154, ConstLabel('fail'))  # jne [0x0154], 0x0154, $fail
    MOV([G], A * 4 + B)  # mov [G], A*4 + B
    JNE([0x0155], 0x0363, ConstLabel('fail'))  # jne [0x0155], 0x0363, $fail
    MOV([A], 0xFADE + A)  # mov [A], 0xFADE + A
    JNE([0x00aa], 0xfb88, ConstLabel('fail'))  # jne [0x00aa], 0xfb88, $fail
    PUSH(A * 4 + B)  # push A*4 + B
    POP(D)  # pop D
    JNE(D, 0x0363, ConstLabel('fail'))  # jne D, 0x0363, $fail
    PUSH(-123)  # push -123
    POP(D)  # pop D
    JNE(D, 0xff85, ConstLabel('fail'))  # jne D, 0xff85, $fail
    PUSH(G)  # push G
    POP(D)  # pop D
    JNE(D, 0x0155, ConstLabel('fail'))  # jne D, 0x0155, $fail
    PUSH(A * 4 + -10)  # push A*4 + -10
    POP(D)  # pop D
    JNE(D, 0x029e, ConstLabel('fail'))  # jne D, 0x029e, $fail
    PUSH(A)  # push A
    POP(D)  # pop D
    JNE(D, 0x00aa, ConstLabel('fail'))  # jne D, 0x00aa, $fail
    PUSH(0xFADE + A)  # push 0xFADE + A
    POP(D)  # pop D
    JNE(D, 0xfb88, ConstLabel('fail'))  # jne D, 0xfb88, $fail
    PUSH(A * 2)  # push A*2
    POP(D)  # pop D
    JNE(D, 0x0154, ConstLabel('fail'))  # jne D, 0x0154, $fail
    PUSH(12345)  # push 12345
    POP(D)  # pop D
    JNE(D, 0x3039, ConstLabel('fail'))  # jne D, 0x3039, $fail
    CALL(ConstLabel('_L_test_uop_get_arg_1'))  # call $_L_test_uop_get_arg_1
    JNE(C, 0xADFE, ConstLabel('fail'))  # jne C, 0xADFE, $fail
    JMP(ConstLabel('_L_test_uop_get_arg_2'))  # jmp $_L_test_uop_get_arg_2
    Label('_L_test_uop_get_arg_1')  # _L_test_uop_get_arg_1:
    MOV(C, 0xADFE)  # mov C, 0xADFE
    RET()  # ret
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_uop_get_arg_2')  # _L_test_uop_get_arg_2:
    #
    # # BEGIN test_uop_rom.asm
    Label('test_uop_alu_2dd')  # test_uop_alu_2dd:
    MOV(A, 0xABCD)  # mov A, 0xABCD
    ADD(A, 0xCDAB)  # add A, 0xCDAB # TEST
    JNE(A, 0x7978, ConstLabel('fail'))  # jne A, 0x7978, $fail
    #
    Label('test_uop_alu_2di')  # test_uop_alu_2di:
    MOV(A, 0x1000)  # mov A, 0x1000
    MOV([0x1000], 0x0ABC)  # mov [0x1000], 0x0ABC
    ADD(A, [A])  # add A, [A]  # TEST
    JNE(A, 0x1ABC, ConstLabel('fail'))  # jne A, 0x1ABC, $fail
    #
    Label('test_uop_alu_2id')  # test_uop_alu_2id:
    MOV([0x1000], 0x1234)  # mov [0x1000], 0x1234
    ADD([0x1000], 0x4321)  # add [0x1000], 0x4321  # TEST
    MOV(A, [0x1000])  # mov A, [0x1000]
    JNE(A, 0x5555, ConstLabel('fail'))  # jne A, 0x5555, $fail
    #
    Label('test_uop_alu_2ii')  # test_uop_alu_2ii:
    MOV([0x1000], 0x1234)  # mov [0x1000], 0x1234
    MOV([0x1005], 0xAAAA)  # mov [0x1005], 0xAAAA
    ADD([0x1005], [0x1000])  # add [0x1005], [0x1000]  # TEST
    JNE([0x1005], 0xBCDE, ConstLabel('fail'))  # jne [0x1005], 0xBCDE, $fail
    #
    Label('test_uop_alu_3dd')  # test_uop_alu_3dd:
    MOV(A, 0xABFE)  # mov A, 0xABFE
    MOV(B, 0x5555)  # mov B, 0x5555
    ADD(C, A, B)  # add C, A, B # TEST
    JNE(A, 0xABFE, ConstLabel('fail'))  # jne A, 0xABFE, $fail
    JNE(B, 0x5555, ConstLabel('fail'))  # jne B, 0x5555, $fail
    JNE(C, 0x0153, ConstLabel('fail'))  # jne C, 0x0153, $fail
    #
    Label('test_uop_alu_3di')  # test_uop_alu_3di:
    MOV([0x1000], 0x12AA)  # mov [0x1000], 0x12AA
    MOV(B, 0xFADE)  # mov B, 0xFADE
    XOR(A, [0x1000], B)  # xor A, [0x1000], B # TEST
    JNE([0x1000], 0x12AA, ConstLabel('fail'))  # jne [0x1000], 0x12AA, $fail
    JNE(B, 0xFADE, ConstLabel('fail'))  # jne B, 0xFADE, $fail
    JNE(A, 0xE874, ConstLabel('fail'))  # jne A, 0xE874, $fail
    #
    Label('test_uop_alu_3id')  # test_uop_alu_3id:
    MOV(A, 0xABFE)  # mov A, 0xABFE
    MOV(B, 0x5555)  # mov B, 0x5555
    SUB([0x1000], A, B)  # sub [0x1000], A, B # TEST
    JNE(A, 0xABFE, ConstLabel('fail'))  # jne A, 0xABFE, $fail
    JNE(B, 0x5555, ConstLabel('fail'))  # jne B, 0x5555, $fail
    JNE([0x1000], 0x56A9, ConstLabel('fail'))  # jne [0x1000], 0x56A9, $fail
    #
    Label('test_uop_alu_3ii')  # test_uop_alu_3ii:
    MOV([0x1000], 0xABFE)  # mov [0x1000], 0xABFE
    MOV(B, 0x5555)  # mov B, 0x5555
    AND([0x1002], [0x1000], B)  # and [0x1002], [0x1000], B # TEST
    JNE([0x1000], 0xABFE, ConstLabel('fail'))  # jne [0x1000], 0xABFE, $fail
    JNE(B, 0x5555, ConstLabel('fail'))  # jne B, 0x5555, $fail
    JNE([0x1002], 0x0154, ConstLabel('fail'))  # jne [0x1002], 0x0154, $fail
    #
    Label('test_uop_alu_single_1dx')  # test_uop_alu_single_1dx:
    MOV(A, 0xFF00)  # mov A, 0xFF00
    NOT(A)  # not A # TEST
    JNE(A, 0x00FF, ConstLabel('fail'))  # jne A, 0x00FF, $fail
    #
    Label('test_uop_alu_single_1ix')  # test_uop_alu_single_1ix:
    MOV([100], 0x1234)  # mov [100], 0x1234
    NEG([100])  # neg [100] # TEST
    JNE([100], 0xEDCC, ConstLabel('fail'))  # jne [100], 0xEDCC, $fail
    #
    Label('test_uop_alu_single_2dd')  # test_uop_alu_single_2dd:
    MOV(B, 0x00FF)  # mov B, 0x00FF
    NOT(A, B)  # not A, B # TEST
    JNE(B, 0x00FF, ConstLabel('fail'))  # jne B, 0x00FF, $fail
    JNE(A, 0xFF00, ConstLabel('fail'))  # jne A, 0xFF00, $fail
    #
    Label('test_uop_alu_single_2di')  # test_uop_alu_single_2di:
    MOV([100], 0x1234)  # mov [100], 0x1234
    NOT(A, [100])  # not A, [100]
    JNE([100], 0x1234, ConstLabel('fail'))  # jne [100], 0x1234, $fail
    JNE(A, 0xEDCB, ConstLabel('fail'))  # jne A, 0xEDCB, $fail
    #
    Label('test_uop_alu_single_2id')  # test_uop_alu_single_2id:
    MOV(B, 0x00FF)  # mov B, 0x00FF
    NOT([100], B)  # not [100], B # TEST
    JNE(B, 0x00FF, ConstLabel('fail'))  # jne B, 0x00FF, $fail
    JNE([100], 0xFF00, ConstLabel('fail'))  # jne [100], 0xFF00, $fail
    #
    Label('test_uop_alu_single_2ii')  # test_uop_alu_single_2ii:
    MOV([102], 0x00FF)  # mov [102], 0x00FF
    NOT([100], [102])  # not [100], [102] # TEST
    JNE([102], 0x00FF, ConstLabel('fail'))  # jne [102], 0x00FF, $fail
    JNE([100], 0xFF00, ConstLabel('fail'))  # jne [100], 0xFF00, $fail
    #
    # # GE GT LE LT NE EQ
    Label('test_uop_cmp_dd')  # test_uop_cmp_dd:
    MOV(B, 123)  # mov B, 123
    CMP(B, 456)  # cmp B, 456 # TEST
    GETF(A)  # getf A
    JNE(B, 123, ConstLabel('fail'))  # jne B, 123, $fail
    JNE(A, 0b001110, ConstLabel('fail'))  # jne A, 0b001110, $fail
    #
    Label('test_uop_cmp_di')  # test_uop_cmp_di:
    MOV([100], -123)  # mov [100], -123
    MOV(B, 456)  # mov B, 456
    ICMP(B, [100])  # icmp B, [100] # TEST
    GETF(A)  # getf A
    JNE(B, 456, ConstLabel('fail'))  # jne B, 456, $fail
    JNE(A, 0b110010, ConstLabel('fail'))  # jne A, 0b110010, $fail
    #
    Label('test_uop_cmp_id')  # test_uop_cmp_id:
    MOV([100], -123)  # mov [100], -123
    MOV(B, 456)  # mov B, 456
    ICMP([100], B)  # icmp [100], B # TEST
    GETF(A)  # getf A
    JNE(B, 456, ConstLabel('fail'))  # jne B, 456, $fail
    JNE(A, 0b001110, ConstLabel('fail'))  # jne A, 0b001110, $fail
    #
    Label('test_uop_cmp_ii')  # test_uop_cmp_ii:
    MOV([100], -123)  # mov [100], -123
    MOV([102], -456)  # mov [102], -456
    ICMP([100], [102])  # icmp [100], [102]  # TEST
    GETF(A)  # getf A
    JNE([100], -123, ConstLabel('fail'))  # jne [100], -123, $fail
    JNE([102], -456, ConstLabel('fail'))  # jne [102], -456, $fail
    JNE(A, 0b110010, ConstLabel('fail'))  # jne A, 0b110010, $fail
    #
    Label('test_uop_jmp_d')  # test_uop_jmp_d:
    MOV(A, ConstLabel('_L_test_uop_jmp_d_okay'))  # mov A, $_L_test_uop_jmp_d_okay
    JMP(A)  # jmp A  # TEST
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_uop_jmp_d_okay')  # _L_test_uop_jmp_d_okay:
    #
    Label('test_uop_jmp_i')  # test_uop_jmp_i:
    MOV([100], ConstLabel('_L_test_uop_jmp_i_okay'))  # mov [100], $_L_test_uop_jmp_i_okay
    JMP([100])  # jmp [100]  # TEST
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_uop_jmp_i_okay')  # _L_test_uop_jmp_i_okay:
    JNE([100], ConstLabel('_L_test_uop_jmp_i_okay'), ConstLabel('fail'))  # jne [100], $_L_test_uop_jmp_i_okay, $fail
    #
    Label('test_uop_jmp_cond_i')  # test_uop_jmp_cond_i:
    MOV([100], ConstLabel('_L_test_uop_jmp_cond_i_okay'))  # mov [100], $_L_test_uop_jmp_cond_i_okay
    CMP(1, 2)  # cmp 1, 2
    JEQ(ConstLabel('fail'))  # jeq $fail
    JNE([100])  # jne [100]  # TEST
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_uop_jmp_cond_i_okay')  # _L_test_uop_jmp_cond_i_okay:
    JNE([100], ConstLabel('_L_test_uop_jmp_cond_i_okay'),
        ConstLabel('fail'))  # jne [100], $_L_test_uop_jmp_cond_i_okay, $fail
    #
    Label('test_uop_jmp_cond_d')  # test_uop_jmp_cond_d:
    MOV(A, ConstLabel('_L_test_uop_jmp_cond_d_okay'))  # mov A, $_L_test_uop_jmp_cond_d_okay
    CMP(1, 1)  # cmp 1, 1
    JNE(ConstLabel('fail'))  # jne $fail
    JEQ(A)  # jeq A  # TEST
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_L_test_uop_jmp_cond_d_okay')  # _L_test_uop_jmp_cond_d_okay:
    JNE(A, ConstLabel('_L_test_uop_jmp_cond_d_okay'), ConstLabel('fail'))  # jne A, $_L_test_uop_jmp_cond_d_okay, $fail
    #
    Label('test_uop_jmp_3dd')  # test_uop_jmp_3dd:
    MOV(A, 123)  # mov A, 123
    JNE(A, 123, ConstLabel('fail'))  # jne A, 123, $fail
    JEQ(A, 123, ConstLabel('_test_uop_jmp_3dd_okay'))  # jeq A, 123, $_test_uop_jmp_3dd_okay
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_test_uop_jmp_3dd_okay')  # _test_uop_jmp_3dd_okay:
    JNE(A, 123, ConstLabel('fail'))  # jne A, 123, $fail
    #
    Label('test_uop_jmp_3di')  # test_uop_jmp_3di:
    MOV(A, 123)  # mov A, 123
    MOV([100], 321)  # mov [100], 321
    JEQ(A, [100], ConstLabel('fail'))  # jeq A, [100], $fail
    JNE(A, [100], ConstLabel('test_uop_jmp_3di_okay'))  # jne A, [100], $test_uop_jmp_3di_okay
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('test_uop_jmp_3di_okay')  # test_uop_jmp_3di_okay:
    JNE(A, 123, ConstLabel('fail'))  # jne A, 123, $fail
    JNE([100], 321, ConstLabel('fail'))  # jne [100], 321, $fail
    #
    Label('test_uop_jmp_3id')  # test_uop_jmp_3id:
    MOV(A, 123)  # mov A, 123
    MOV([100], 321)  # mov [100], 321
    JEQ([100], A, ConstLabel('fail'))  # jeq [100], A, $fail
    JNE([100], A, ConstLabel('_test_uop_jmp_3id_okay'))  # jne [100], A, $_test_uop_jmp_3id_okay
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_test_uop_jmp_3id_okay')  # _test_uop_jmp_3id_okay:
    JNE(A, 123, ConstLabel('fail'))  # jne A, 123, $fail
    JNE([100], 321, ConstLabel('fail'))  # jne [100], 321, $fail
    #
    Label('test_uop_jmp_3ii')  # test_uop_jmp_3ii:
    MOV([200], 123)  # mov [200], 123
    MOV([100], 321)  # mov [100], 321
    JEQ([100], [200], ConstLabel('fail'))  # jeq [100], [200], $fail
    JNE([100], [200], ConstLabel('_test_uop_jmp_3ii_okay'))  # jne [100], [200], $_test_uop_jmp_3ii_okay
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('_test_uop_jmp_3ii_okay')  # _test_uop_jmp_3ii_okay:
    JNE([200], 123, ConstLabel('fail'))  # jne [200], 123, $fail
    JNE([100], 321, ConstLabel('fail'))  # jne [100], 321, $fail
    #
    Label('test_uop_mov_dd')  # test_uop_mov_dd:
    MOV(A, 123)  # mov A, 123
    JNE(A, 123, ConstLabel('fail'))  # jne A, 123, $fail
    #
    Label('test_uop_mov_di')  # test_uop_mov_di:
    MOV([100], 0xFFDA)  # mov [100], 0xFFDA
    MOV(A, [100])  # mov A, [100]
    JNE(A, 0xFFDA, ConstLabel('fail'))  # jne A, 0xFFDA, $fail
    #
    Label('test_uop_mov_id')  # test_uop_mov_id:
    MOV([100], 0xFFFF)  # mov [100], 0xFFFF
    JNE([100], 0xFFFF, ConstLabel('fail'))  # jne [100], 0xFFFF, $fail
    #
    Label('test_uop_mov_ii')  # test_uop_mov_ii:
    MOV(A, 20)  # mov A, 20
    MOV([120], 0xFDFA)  # mov [120], 0xFDFA
    MOV([100], [100 + A])  # mov [100], [100+A]
    JNE([100], 0xFDFA, ConstLabel('fail'))  # jne [100], 0xFDFA, $fail
    #
    Label('test_uop_bmov_dd')  # test_uop_bmov_dd:
    BMOV(A, 0xAFDE)  # bmov A, 0xAFDE
    JNE(A, 0xDE, ConstLabel('fail'))  # jne A, 0xDE, $fail
    BMOV(A, 0xFA)  # bmov A, 0xFA
    JNE(A, 0xFA, ConstLabel('fail'))  # jne A, 0xFA, $fail
    #
    Label('test_uop_bmov_di')  # test_uop_bmov_di:
    MOV([100], 0xFFDA)  # mov [100], 0xFFDA
    BMOV(A, [100])  # bmov A, [100]
    JNE(A, 0xDA, ConstLabel('fail'))  # jne A, 0xDA, $fail
    #
    Label('test_uop_bmov_id')  # test_uop_bmov_id:
    MOV([100], 0xABCD)  # mov [100], 0xABCD
    MOV([102], 0x1234)  # mov [102], 0x1234
    MOV([104], 0x5678)  # mov [104], 0x5678
    BMOV([102], 0xDF)  # bmov [102], 0xDF
    JNE([100], 0xABCD, ConstLabel('fail'))  # jne [100], 0xABCD, $fail
    JNE([102], 0x12DF, ConstLabel('fail'))  # jne [102], 0x12DF, $fail
    JNE([104], 0x5678, ConstLabel('fail'))  # jne [104], 0x5678, $fail
    BMOV([103], 0xB8)  # bmov [103], 0xB8
    JNE([100], 0xABCD, ConstLabel('fail'))  # jne [100], 0xABCD, $fail
    JNE([102], 0xB8DF, ConstLabel('fail'))  # jne [102], 0xB8DF, $fail
    JNE([104], 0x5678, ConstLabel('fail'))  # jne [104], 0x5678, $fail
    #
    Label('test_uop_bmov_ii')  # test_uop_bmov_ii:
    MOV([300], 0xDF)  # mov [300], 0xDF
    MOV([302], 0xB8)  # mov [302], 0xB8
    #
    MOV([200], 0xABCD)  # mov [200], 0xABCD
    MOV([202], 0x1234)  # mov [202], 0x1234
    MOV([204], 0x5678)  # mov [204], 0x5678
    BMOV([202], [300])  # bmov [202], [300]
    JNE([200], 0xABCD, ConstLabel('fail'))  # jne [200], 0xABCD, $fail
    JNE([202], 0x12DF, ConstLabel('fail'))  # jne [202], 0x12DF, $fail
    JNE([204], 0x5678, ConstLabel('fail'))  # jne [204], 0x5678, $fail
    JNE([300], 0xDF, ConstLabel('fail'))  # jne [300], 0xDF, $fail
    JNE([302], 0xB8, ConstLabel('fail'))  # jne [302], 0xB8, $fail
    BMOV([203], [302])  # bmov [203], [302]
    JNE([200], 0xABCD, ConstLabel('fail'))  # jne [200], 0xABCD, $fail
    JNE([202], 0xB8DF, ConstLabel('fail'))  # jne [202], 0xB8DF, $fail
    JNE([204], 0x5678, ConstLabel('fail'))  # jne [204], 0x5678, $fail
    JNE([300], 0xDF, ConstLabel('fail'))  # jne [300], 0xDF, $fail
    JNE([302], 0xB8, ConstLabel('fail'))  # jne [302], 0xB8, $fail
    #
    #
    Label('test_uop_halt')  # test_uop_halt:
    #     # Can't test!
    #
    Label('test_uop_getf')  # test_uop_getf:
    CMP(123, 45)  # cmp 123, 45
    GETF(A)  # getf A
    JNE(A, 0b110010, ConstLabel('fail'))  # jne A, 0b110010, $fail
    #
    Label('test_uop_setf')  # test_uop_setf:
    SETF(0xFFFF)  # setf 0xFFFF
    GETF(A)  # getf A
    JNE(A, 0x3F, ConstLabel('fail'))  # jne A, 0x3F, $fail # masked only 6 bits
    #
    Label('test_uop_call_d')  # test_uop_call_d:
    MOV(SP, 0x1000)  # mov SP, 0x1000
    MOV(B, ConstLabel('_L_test_uop_call_d_fn'))  # mov B, $_L_test_uop_call_d_fn
    CALL(B)  # call B
    JNE(B, ConstLabel('_L_test_uop_call_d_fn'), ConstLabel('fail'))  # jne B, $_L_test_uop_call_d_fn, $fail
    JNE(A, 0x34FA, ConstLabel('fail'))  # jne A, 0x34FA, $fail
    JMP(ConstLabel('_L_test_uop_call_d_okay'))  # jmp $_L_test_uop_call_d_okay
    Label('_L_test_uop_call_d_fn')  # _L_test_uop_call_d_fn:
    MOV(A, 0x34FA)  # mov A, 0x34FA
    RET()  # ret
    Label('_L_test_uop_call_d_okay')  # _L_test_uop_call_d_okay:
    #
    Label('test_uop_call_i')  # test_uop_call_i:
    MOV(SP, 0x1000)  # mov SP, 0x1000
    MOV(B, 100)  # mov B, 100
    MOV([B], ConstLabel('_L_test_uop_call_i_fn'))  # mov [B], $_L_test_uop_call_i_fn
    CALL([B])  # call [B]
    JNE([B], ConstLabel('_L_test_uop_call_i_fn'), ConstLabel('fail'))  # jne [B], $_L_test_uop_call_i_fn, $fail
    JNE(A, 0xAAD4, ConstLabel('fail'))  # jne A, 0xAAD4, $fail
    JMP(ConstLabel('_L_test_uop_call_i_okay'))  # jmp $_L_test_uop_call_i_okay
    Label('_L_test_uop_call_i_fn')  # _L_test_uop_call_i_fn:
    MOV(A, 0xAAD4)  # mov A, 0xAAD4
    RET()  # ret
    Label('_L_test_uop_call_i_okay')  # _L_test_uop_call_i_okay:
    #
    Label('test_uop_ret')  # test_uop_ret:
    #     # already tested above
    #
    Label('test_uop_push_d')  # test_uop_push_d:
    MOV(SP, 0x1000)  # mov SP, 0x1000
    MOV(B, 100)  # mov B, 100
    PUSH(B)  # push B
    JNE(SP, 0xFFE, ConstLabel('fail'))  # jne SP, 0xFFE, $fail
    JNE([0xFFE], 100, ConstLabel('fail'))  # jne [0xFFE], 100, $fail
    POP(C)  # pop C
    JNE(C, 100, ConstLabel('fail'))  # jne C, 100, $fail
    #
    Label('test_uop_push_i')  # test_uop_push_i:
    MOV(SP, 0x1000)  # mov SP, 0x1000
    MOV(B, 100)  # mov B, 100
    MOV([B], 400)  # mov [B], 400
    PUSH([B])  # push [B]
    JNE(SP, 0xFFE, ConstLabel('fail'))  # jne SP, 0xFFE, $fail
    JNE([0xFFE], 400, ConstLabel('fail'))  # jne [0xFFE], 400, $fail
    POP(C)  # pop C
    JNE(C, 400, ConstLabel('fail'))  # jne C, 400, $fail
    #
    Label('test_uop_pop_d')  # test_uop_pop_d:
    MOV(SP, 0x1000)  # mov SP, 0x1000
    PUSH(0xFADA)  # push 0xFADA
    POP(A)  # pop A
    JNE(A, 0xFADA, ConstLabel('fail'))  # jne A, 0xFADA, $fail
    #
    Label('test_uop_pop_i')  # test_uop_pop_i:
    MOV(SP, 0x1000)  # mov SP, 0x1000
    PUSH(0xF2DA)  # push 0xF2DA
    POP([100])  # pop [100]
    JNE([100], 0xF2DA, ConstLabel('fail'))  # jne [100], 0xF2DA, $fail
    #
    Label('test_uop_mmap')  # test_uop_mmap:
    #     # mmap/umap does not support indirection
    MOV([0x3000], 0xFF00)  # mov [0x3000], 0xFF00
    MOV([0x3100], 0xFF01)  # mov [0x3100], 0xFF01
    MOV([0x3200], 0xFF02)  # mov [0x3200], 0xFF02
    #
    MOV([0x4000], 0xDD00)  # mov [0x4000], 0xDD00
    MOV([0x4100], 0xDD01)  # mov [0x4100], 0xDD01
    MOV([0x4200], 0xDD02)  # mov [0x4200], 0xDD02
    #
    MOV([0x5000], 0xEE00)  # mov [0x5000], 0xEE00
    MOV([0x5100], 0xEE01)  # mov [0x5100], 0xEE01
    MOV([0x5200], 0xEE02)  # mov [0x5200], 0xEE02
    #
    MOV(A, 0)  # mov A, 0
    MOV(B, 0x4100)  # mov B, 0x4100
    MMAP(0x3100, 0x32FF, 1)  # mmap  0x3100, 0x32FF, 1 # start, end, idx
    JNE([0x3100], 0xDD01, ConstLabel('fail'))  # jne [0x3100], 0xDD01, $fail
    JNE([0x3200], 0xDD02, ConstLabel('fail'))  # jne [0x3200], 0xDD02, $fail
    JNE([0x3000], 0xFF00, ConstLabel('fail'))  # jne [0x3000], 0xFF00, $fail
    #
    MOV(B, 0x5100)  # mov B, 0x5100
    MMAP(0x3200, 0x32FF, 2)  # mmap  0x3200, 0x32FF, 2 # higher priority
    JNE([0x3200], 0xEE01, ConstLabel('fail'))  # jne [0x3200], 0xEE01, $fail
    JNE([0x3000], 0xFF00, ConstLabel('fail'))  # jne [0x3000], 0xFF00, $fail
    JNE([0x3100], 0xDD01, ConstLabel('fail'))  # jne [0x3100], 0xDD01, $fail
    #
    UMAP(1)  # umap 1
    JNE([0x3100], 0xFF01, ConstLabel('fail'))  # jne [0x3100], 0xFF01, $fail
    JNE([0x3200], 0xEE01, ConstLabel('fail'))  # jne [0x3200], 0xEE01, $fail
    JNE([0x3000], 0xFF00, ConstLabel('fail'))  # jne [0x3000], 0xFF00, $fail
    #
    UMAP(2)  # umap 2
    JNE([0x3000], 0xFF00, ConstLabel('fail'))  # jne [0x3000], 0xFF00, $fail
    JNE([0x3100], 0xFF01, ConstLabel('fail'))  # jne [0x3100], 0xFF01, $fail
    JNE([0x3200], 0xFF02, ConstLabel('fail'))  # jne [0x3200], 0xFF02, $fail
    #
    Label('test_uop_umap')  # test_uop_umap:
    #     # done above
    # # END test_uop_rom.asm
    #
    #
    # # BEGIN test_aux_regs.asm
    Label('test_aux_reg')  # test_aux_reg:
    MOV(A, 1)  # mov A, 1
    MOV(B, 2)  # mov B, 2
    MOV(C, 3)  # mov C, 3
    MOV(D, 4)  # mov D, 4
    #
    MOV(E, 5)  # mov E, 5
    MOV(F, 6)  # mov F, 6
    MOV(G, 7)  # mov G, 7
    MOV(H, 8)  # mov H, 8
    #
    JNE(A, 1, ConstLabel('fail'))  # jne A, 1, $fail
    JNE(B, 2, ConstLabel('fail'))  # jne B, 2, $fail
    JNE(C, 3, ConstLabel('fail'))  # jne C, 3, $fail
    JNE(D, 4, ConstLabel('fail'))  # jne D, 4, $fail
    #
    JNE(E, 5, ConstLabel('fail'))  # jne E, 5, $fail
    JNE(F, 6, ConstLabel('fail'))  # jne F, 6, $fail
    JNE(G, 7, ConstLabel('fail'))  # jne G, 7, $fail
    JNE(H, 8, ConstLabel('fail'))  # jne H, 8, $fail
    #
    XOR(H, 0xFF00)  # xor H, 0xFF00
    JNE(H, 0xFF08, ConstLabel('fail'))  # jne H, 0xFF08, $fail
    MOV(A, H)  # mov A, H
    JNE(A, 0xFF08, ConstLabel('fail'))  # jne A, 0xFF08, $fail
    MOV(E, G)  # mov E, G
    JNE(E, 7, ConstLabel('fail'))  # jne E, 7, $fail
    JNE(H, 0xFF08, ConstLabel('fail'))  # jne H, 0xFF08, $fail
    # # END test_aux_regs.asm
    #
    #
    # # BEGIN test_call_ret.asm
    Label('test_call_ret')  # test_call_ret:
    #
    MOV(SP, 0x1000)  # mov SP, 0x1000
    CALL(ConstLabel('fn_test_target'))  # call $fn_test_target
    JNE(SP, 0x1000, ConstLabel('fail'))  # jne SP, 0x1000, $fail
    #
    MOV(A, 10)  # mov A, 10
    MOV(B, 0)  # mov B, 0
    MOV(C, 0)  # mov C, 0
    MOV(D, 0)  # mov D, 0
    CALL(ConstLabel('fn_recursive'))  # call $fn_recursive
    #
    JNE(A, 0, ConstLabel('fail'))  # jne A, 0, $fail
    JNE(B, 0xcf3f, ConstLabel('fail'))  # jne B, 0xcf3f, $fail
    JNE(C, 0x002d, ConstLabel('fail'))  # jne C, 0x002d, $fail
    JNE(D, 0x4597, ConstLabel('fail'))  # jne D, 0x4597, $fail
    JNE(SP, 0x1000, ConstLabel('fail'))  # jne SP, 0x1000, $fail
    #
    JMP(ConstLabel('test_call_ret_end'))  # jmp $test_call_ret_end
    #
    Label('fn_recursive')  # fn_recursive:
    SUB(A, 1)  # sub A, 1
    CALL(ConstLabel('fn_process_c'))  # call $fn_process_c
    JEQ(A, 0, ConstLabel('fn_recursive_end'))  # jeq A, 0, $fn_recursive_end
    CALL(ConstLabel('fn_recursive'))  # call $fn_recursive
    ADD(D, C)  # add D, C
    MUL(D, 3)  # mul D, 3
    ADD(B, D)  # add B, D
    PUSH(D)  # push D
    MUL(B, 5)  # mul B, 5
    POP(D)  # pop D
    Label('fn_recursive_end')  # fn_recursive_end:
    RET()  # ret
    JMP(ConstLabel('fail'))  # jmp $fail
    #
    Label('fn_process_c')  # fn_process_c:
    ADD(C, A)  # add C, A
    RET()  # ret
    JMP(ConstLabel('fail'))  # jmp $fail
    #
    Label('fn_test_target')  # fn_test_target:
    JNE(SP, 0x0ffe, ConstLabel('fail'))  # jne SP, 0x0ffe, $fail
    RET()  # ret
    JMP(ConstLabel('fail'))  # jmp $fail
    #
    Label('test_call_ret_end')  # test_call_ret_end:
    # # END test_call_ret.asm
    #
    #
    # # BEGIN test_mem_access.asm
    Label('test_mem_access')  # test_mem_access:
    MOV([0x100], 0xFFED)  # mov [0x100], 0xFFED
    JNE([0x100], 0x00AA, ConstLabel('test_mem_access_check_jmp'))  # jne [0x100], 0x00AA, $test_mem_access_check_jmp
    JMP(ConstLabel('fail'))  # jmp $fail
    Label('test_mem_access_check_jmp')  # test_mem_access_check_jmp:
    #
    MOV([0x1000], 0)  # mov [0x1000], 0
    MOV(SP, 0x1000)  # mov SP, 0x1000
    JNE([SP], 0, ConstLabel('fail'))  # jne [SP], 0, $fail
    PUSH(0)  # push 0
    PUSH(0)  # push 0
    PUSH(0)  # push 0
    POP(A)  # pop A
    POP(A)  # pop A
    POP(A)  # pop A
    JNE(SP, 0x1000, ConstLabel('fail'))  # jne SP, 0x1000, $fail
    JNE(A, 0, ConstLabel('fail'))  # jne A, 0, $fail
    #
    PUSH(0x0102)  # push 0x0102
    JNE(SP, 0xFFE, ConstLabel('fail'))  # jne SP, 0xFFE, $fail
    PUSH(0x0304)  # push 0x0304
    JNE(SP, 0xFFC, ConstLabel('fail'))  # jne SP, 0xFFC, $fail
    #
    JNE([0xFFE], 0x0102, ConstLabel('fail'))  # jne [0xFFE], 0x0102, $fail
    JNE([0xFFC], 0x0304, ConstLabel('fail'))  # jne [0xFFC], 0x0304, $fail
    #
    #     # unaligned
    JNE([0xFFB], 0x0400, ConstLabel('fail'))  # jne [0xFFB], 0x0400, $fail
    JNE([0xFFD], 0x0203, ConstLabel('fail'))  # jne [0xFFD], 0x0203, $fail
    JNE([0xFFF], 0x0001, ConstLabel('fail'))  # jne [0xFFF], 0x0001, $fail
    #
    POP(A)  # pop A
    JNE(A, 0x0304, ConstLabel('fail'))  # jne A, 0x0304, $fail
    JNE(SP, 0xFFE, ConstLabel('fail'))  # jne SP, 0xFFE, $fail
    POP(A)  # pop A
    JNE(A, 0x0102, ConstLabel('fail'))  # jne A, 0x0102, $fail
    JNE(SP, 0x1000, ConstLabel('fail'))  # jne SP, 0x1000, $fail
    #
    # # END test_mem_access.asm
    #
    #
    # # BEGIN test_cmp.asm
    Label('test_cmp')  # test_cmp:
    SETF(0xFFFF)  # setf 0xFFFF
    GETF(A)  # getf A
    JNE(A, 0x3F, ConstLabel('fail'))  # jne A, 0x3F, $fail
    #
    SETF(0xABAB)  # setf 0xABAB
    GETF(A)  # getf A
    JNE(A, 0x2B, ConstLabel('fail'))  # jne A, 0x2B, $fail
    #
    #     # unsigned
    CMP(0xFFAB, 0x2B)  # cmp 0xFFAB, 0x2B
    GETF(A)  # getf A
    #     # GE GT LE LT NE EQ
    JNE(A, 0b110010, ConstLabel('fail'))  # jne A, 0b110010, $fail
    #
    CMP(0x2B, 0xFFAB)  # cmp 0x2B, 0xFFAB
    GETF(A)  # getf A
    JNE(A, 0b001110, ConstLabel('fail'))  # jne A, 0b001110, $fail
    #
    CMP(0xFFAB, 0xFFAB)  # cmp 0xFFAB, 0xFFAB
    GETF(A)  # getf A
    JNE(A, 0b101001, ConstLabel('fail'))  # jne A, 0b101001, $fail
    #
    #     # signed
    ICMP(0xFFAB, 0x2B)  # icmp 0xFFAB, 0x2B
    GETF(A)  # getf A
    #     # GE GT LE LT NE EQ
    JNE(A, 0b001110, ConstLabel('fail'))  # jne A, 0b001110, $fail
    #
    ICMP(0x2B, 0xFFAB)  # icmp 0x2B, 0xFFAB
    GETF(A)  # getf A
    JNE(A, 0b110010, ConstLabel('fail'))  # jne A, 0b110010, $fail
    #
    ICMP(0xFFAB, 0xFFAB)  # icmp 0xFFAB, 0xFFAB
    GETF(A)  # getf A
    JNE(A, 0b101001, ConstLabel('fail'))  # jne A, 0b101001, $fail
    #
    #
    #
    Label('test_cmp_direct')  # test_cmp_direct:
    #     # unsigned
    MOV(C, 0xFFAB)  # mov C, 0xFFAB
    MOV(D, 0x2B)  # mov D, 0x2B
    CMP(C, D)  # cmp C, D
    GETF(A)  # getf A
    #     # GE GT LE LT NE EQ
    JNE(A, 0b110010, ConstLabel('fail'))  # jne A, 0b110010, $fail
    #
    CMP(D, C)  # cmp D, C
    GETF(A)  # getf A
    JNE(A, 0b001110, ConstLabel('fail'))  # jne A, 0b001110, $fail
    #
    CMP(C, C)  # cmp C, C
    GETF(A)  # getf A
    JNE(A, 0b101001, ConstLabel('fail'))  # jne A, 0b101001, $fail
    #
    #     # signed
    ICMP(C, D)  # icmp C, D
    GETF(A)  # getf A
    #     # GE GT LE LT NE EQ
    JNE(A, 0b001110, ConstLabel('fail'))  # jne A, 0b001110, $fail
    #
    ICMP(D, C)  # icmp D, C
    GETF(A)  # getf A
    JNE(A, 0b110010, ConstLabel('fail'))  # jne A, 0b110010, $fail
    #
    ICMP(C, C)  # icmp C, C
    GETF(A)  # getf A
    JNE(A, 0b101001, ConstLabel('fail'))  # jne A, 0b101001, $fail
    # # END test_cmp.asm
    #
    Label('end_of_test')  # end_of_test:
    MOV(A, 0xDEAD)  # mov A, 0xDEAD
    MOV(B, 0xBEEF)  # mov B, 0xBEEF
    MUL(C, A, B)  # mul C, A, B
    JMP(ConstLabel('success'))  # jmp $success


def led_loop():
    JNE(A, 0x00aa, 'fail')
    JNE(B, 0x00bb, 'fail')
    JNE(C, 0x00cc, 'fail')
    JNE(D, 0x0055, 'fail')

    # map device range
    MOV(A, 0xFD)
    MOV(B, 0)
    MMAP(DEV_ADDR, DEV_ADDR + 0xFF, 2)

    MOV(M_LED, 0x000)
    with Block() as while_true:
        MOV(A, 0)
        with Block() as loop:
            JEQ(A, 0xFFFF, loop.end)
            INC(A)
            MUL(B, B)
            JMP(loop.begin)
        INC(M_LED)
        JMP(while_true.begin)
    HALT()


if __name__ == '__main__':
    CALL(self_test, emit_call=False)

    cg = CodeGen()
    cg.code_offset = CODE_OFFSET
    cg.compile().write('self_test_hw.asm')
