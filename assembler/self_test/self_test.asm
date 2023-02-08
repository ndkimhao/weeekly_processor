
# BEGIN preamble.asm
.offset 0xD000
.boot:
    mov A, 0xFFFA
    jne A, 0x00FA, $start_test
fail:
    # register A contains failed test
    halt
    jmp $fail
success:
    jne A, 0xDEAD, $fail  # check cookie
    jne B, 0xBEEF, $fail
    jne C, 0x4983, $fail
    jne D, 0xA614, $fail
    # okay!
    add A, 0xACAB
    add B, 0x41CC
    mul A, D
    xor A, 0xF24A
    xor C, 0x494F
    xor D, 0x5A30
    # A = 0x00aa
    # B = 0x00bb
    # C = 0x00cc
    # D = 0x0055
    halt
# END preamble.asm

start_test:
alu_test:
     # t=True, a=d230, b=a012
    add B, 0xd230, 0xa012
    jne B, 0x7242, $fail

    sub B, 0xd230, 0xa012
    jne B, 0x321e, $fail

    mul B, 0xd230, 0xa012
    jne B, 0xc760, $fail
    jne D, 0x836c, $fail

    imul B, 0xd230, 0xa012
    jne B, 0xc760, $fail
    jne D, 0x112a, $fail

    shr B, 0xd230, 0xa012
    jne B, 0x348c, $fail

    ishr B, 0xd230, 0xa012
    jne B, 0xf48c, $fail

    shl B, 0xd230, 0xa012
    jne B, 0x48c0, $fail

    and B, 0xd230, 0xa012
    jne B, 0x8010, $fail

    or B, 0xd230, 0xa012
    jne B, 0xf232, $fail

    xor B, 0xd230, 0xa012
    jne B, 0x7222, $fail

    neg B, 0xd230
    jne B, 0x2dd0, $fail

    not B, 0xd230
    jne B, 0x2dcf, $fail

    bool B, 0xd230
    jne B, 0x0001, $fail

    inc B, 0xd230
    jne B, 0xd231, $fail

    dec B, 0xd230
    jne B, 0xd22f, $fail

     # t=True, a=00ad, b=da37
    add B, 0x00ad, 0xda37
    jne B, 0xdae4, $fail

    sub B, 0x00ad, 0xda37
    jne B, 0x2676, $fail

    mul B, 0x00ad, 0xda37
    jne B, 0x772b, $fail
    jne D, 0x0093, $fail

    imul B, 0x00ad, 0xda37
    jne B, 0x772b, $fail
    jne D, 0xffe6, $fail

    shr B, 0x00ad, 0xda37
    jne B, 0x0001, $fail

    ishr B, 0x00ad, 0xda37
    jne B, 0x0001, $fail

    shl B, 0x00ad, 0xda37
    jne B, 0x5680, $fail

    and B, 0x00ad, 0xda37
    jne B, 0x0025, $fail

    or B, 0x00ad, 0xda37
    jne B, 0xdabf, $fail

    xor B, 0x00ad, 0xda37
    jne B, 0xda9a, $fail

    neg B, 0x00ad
    jne B, 0xff53, $fail

    not B, 0x00ad
    jne B, 0xff52, $fail

    bool B, 0x00ad
    jne B, 0x0001, $fail

    inc B, 0x00ad
    jne B, 0x00ae, $fail

    dec B, 0x00ad
    jne B, 0x00ac, $fail

     # t=False, a=f0ad, b=2a3f
    mov B, 0xf0ad
    add B, 0x2a3f
    jne B, 0x1aec, $fail

    mov B, 0xf0ad
    sub B, 0x2a3f
    jne B, 0xc66e, $fail

    mov B, 0xf0ad
    mul B, 0x2a3f
    jne B, 0x9c93, $fail
    jne D, 0x27b7, $fail

    mov B, 0xf0ad
    imul B, 0x2a3f
    jne B, 0x9c93, $fail
    jne D, 0xfd78, $fail

    mov B, 0xf0ad
    shr B, 0x2a3f
    jne B, 0x0001, $fail

    mov B, 0xf0ad
    ishr B, 0x2a3f
    jne B, 0xffff, $fail

    mov B, 0xf0ad
    shl B, 0x2a3f
    jne B, 0x8000, $fail

    mov B, 0xf0ad
    and B, 0x2a3f
    jne B, 0x202d, $fail

    mov B, 0xf0ad
    or B, 0x2a3f
    jne B, 0xfabf, $fail

    mov B, 0xf0ad
    xor B, 0x2a3f
    jne B, 0xda92, $fail

    mov B, 0xf0ad
    neg B
    jne B, 0x0f53, $fail

    mov B, 0xf0ad
    not B
    jne B, 0x0f52, $fail

    mov B, 0xf0ad
    bool B
    jne B, 0x0001, $fail

    mov B, 0xf0ad
    inc B
    jne B, 0xf0ae, $fail

    mov B, 0xf0ad
    dec B
    jne B, 0xf0ac, $fail

     # t=False, a=0000, b=dead
    mov B, 0x0000
    add B, 0xdead
    jne B, 0xdead, $fail

    mov B, 0x0000
    sub B, 0xdead
    jne B, 0x2153, $fail

    mov B, 0x0000
    mul B, 0xdead
    jne B, 0x0000, $fail
    jne D, 0x0000, $fail

    mov B, 0x0000
    imul B, 0xdead
    jne B, 0x0000, $fail
    jne D, 0x0000, $fail

    mov B, 0x0000
    shr B, 0xdead
    jne B, 0x0000, $fail

    mov B, 0x0000
    ishr B, 0xdead
    jne B, 0x0000, $fail

    mov B, 0x0000
    shl B, 0xdead
    jne B, 0x0000, $fail

    mov B, 0x0000
    and B, 0xdead
    jne B, 0x0000, $fail

    mov B, 0x0000
    or B, 0xdead
    jne B, 0xdead, $fail

    mov B, 0x0000
    xor B, 0xdead
    jne B, 0xdead, $fail

    mov B, 0x0000
    neg B
    jne B, 0x0000, $fail

    mov B, 0x0000
    not B
    jne B, 0xffff, $fail

    mov B, 0x0000
    bool B
    jne B, 0x0000, $fail

    mov B, 0x0000
    inc B
    jne B, 0x0001, $fail

    mov B, 0x0000
    dec B
    jne B, 0xffff, $fail

jmp_test:
    jeq 0xffab, 0x002b, $fail
    jne 0xffab, 0x002b, $_L_test_jmp_1
    jmp $fail
_L_test_jmp_1:
    jlt 0xffab, 0x002b, $fail
    jle 0xffab, 0x002b, $fail
    jgt 0xffab, 0x002b, $_L_test_jmp_2
    jmp $fail
_L_test_jmp_2:
    jge 0xffab, 0x002b, $_L_test_jmp_3
    jmp $fail
_L_test_jmp_3:
    cmp 0xffab, 0x002b
    jeq $fail
    jne $_L_test_jmp_4
    jmp $fail
_L_test_jmp_4:
    jlt $fail
    jle $fail
    jgt $_L_test_jmp_5
    jmp $fail
_L_test_jmp_5:
    jge $_L_test_jmp_6
    jmp $fail
_L_test_jmp_6:
    icmp 0xffab, 0x002b
    jeq $fail
    jne $_L_test_jmp_7
    jmp $fail
_L_test_jmp_7:
    jlt $_L_test_jmp_8
    jmp $fail
_L_test_jmp_8:
    jle $_L_test_jmp_9
    jmp $fail
_L_test_jmp_9:
    jgt $fail
    jge $fail
    jeq 0x002b, 0xffab, $fail
    jne 0x002b, 0xffab, $_L_test_jmp_10
    jmp $fail
_L_test_jmp_10:
    jlt 0x002b, 0xffab, $_L_test_jmp_11
    jmp $fail
_L_test_jmp_11:
    jle 0x002b, 0xffab, $_L_test_jmp_12
    jmp $fail
_L_test_jmp_12:
    jgt 0x002b, 0xffab, $fail
    jge 0x002b, 0xffab, $fail
    cmp 0x002b, 0xffab
    jeq $fail
    jne $_L_test_jmp_13
    jmp $fail
_L_test_jmp_13:
    jlt $_L_test_jmp_14
    jmp $fail
_L_test_jmp_14:
    jle $_L_test_jmp_15
    jmp $fail
_L_test_jmp_15:
    jgt $fail
    jge $fail
    icmp 0x002b, 0xffab
    jeq $fail
    jne $_L_test_jmp_16
    jmp $fail
_L_test_jmp_16:
    jlt $fail
    jle $fail
    jgt $_L_test_jmp_17
    jmp $fail
_L_test_jmp_17:
    jge $_L_test_jmp_18
    jmp $fail
_L_test_jmp_18:
    jeq 0xffab, 0xffab, $_L_test_jmp_19
    jmp $fail
_L_test_jmp_19:
    jne 0xffab, 0xffab, $fail
    jlt 0xffab, 0xffab, $fail
    jle 0xffab, 0xffab, $_L_test_jmp_20
    jmp $fail
_L_test_jmp_20:
    jgt 0xffab, 0xffab, $fail
    jge 0xffab, 0xffab, $_L_test_jmp_21
    jmp $fail
_L_test_jmp_21:
    cmp 0xffab, 0xffab
    jeq $_L_test_jmp_22
    jmp $fail
_L_test_jmp_22:
    jne $fail
    jlt $fail
    jle $_L_test_jmp_23
    jmp $fail
_L_test_jmp_23:
    jgt $fail
    jge $_L_test_jmp_24
    jmp $fail
_L_test_jmp_24:
    icmp 0xffab, 0xffab
    jeq $_L_test_jmp_25
    jmp $fail
_L_test_jmp_25:
    jne $fail
    jlt $fail
    jle $_L_test_jmp_26
    jmp $fail
_L_test_jmp_26:
    jgt $fail
    jge $_L_test_jmp_27
    jmp $fail
_L_test_jmp_27:
test_uop_get_arg:
    mov SP, 0x7000
    mov A, 0x00aa
    mov B, 0x00bb
    xor [A], A*4 + -10, A*2
    jne [0x00aa], 0x03ca, $fail
    xor [A*2], A*4 + -10, -123
    jne [0x0154], 0xfd1b, $fail
    xor [12345], A*4 + -10, A*2
    jne [0x3039], 0x03ca, $fail
    xor [A*4 + -10], 12345, A*4 + B
    jne [0x029e], 0x335a, $fail
    xor [12345], A*4 + B, 0xFADE + A
    jne [0x3039], 0xf8eb, $fail
    xor [A*4 + B], A*4 + -10, A
    jne [0x0363], 0x0234, $fail
    xor [A*2], 12345, A*2
    jne [0x0154], 0x316d, $fail
    xor [12345], A*4 + -10, A
    jne [0x3039], 0x0234, $fail
    xor [A*4 + -10], 0xFADE + A, A*2
    jne [0x029e], 0xfadc, $fail
    xor [12345], 0xFADE + A, 0xFADE + A
    jne [0x3039], 0x0000, $fail
    xor [A*4 + -10], A, 0xFADE + A
    jne [0x029e], 0xfb22, $fail
    xor [A*2], A*4 + B, A
    jne [0x0154], 0x03c9, $fail
    xor [A*2], A*4 + -10, A*2
    jne [0x0154], 0x03ca, $fail
    xor [A*4 + B], A*4 + B, A
    jne [0x0363], 0x03c9, $fail
    xor [A*4 + -10], -123, A
    jne [0x029e], 0xff2f, $fail
    xor [A*2], -123, A*2
    jne [0x0154], 0xfed1, $fail
    xor [12345], A, A*4 + -10
    jne [0x3039], 0x0234, $fail
    xor [A*4 + B], 0xFADE + A, 0xFADE + A
    jne [0x0363], 0x0000, $fail
    xor [12345], -123, A*2
    jne [0x3039], 0xfed1, $fail
    xor [A*4 + B], A*2, A*4 + B
    jne [0x0363], 0x0237, $fail
    xor [A*2], 0xFADE + A, 0xFADE + A
    jne [0x0154], 0x0000, $fail
    xor [A], A, A
    jne [0x00aa], 0x0000, $fail
    xor [A*2], A*4 + B, A*4 + B
    jne [0x0154], 0x0000, $fail
    xor [A], 12345, 12345
    jne [0x00aa], 0x0000, $fail
    xor [12345], -123, 12345
    jne [0x3039], 0xcfbc, $fail
    xor [A], 0xFADE + A, A*2
    jne [0x00aa], 0xfadc, $fail
    xor [12345], A, A*4 + B
    jne [0x3039], 0x03c9, $fail
    xor [A], 12345, A*2
    jne [0x00aa], 0x316d, $fail
    xor [A*2], A*4 + B, -123
    jne [0x0154], 0xfce6, $fail
    xor [12345], A, -123
    jne [0x3039], 0xff2f, $fail
    xor [A*4 + B], 0xFADE + A, 12345
    jne [0x0363], 0xcbb1, $fail
    xor [A*4 + B], A*2, 12345
    jne [0x0363], 0x316d, $fail
    xor [A*4 + -10], A*4 + B, A
    jne [0x029e], 0x03c9, $fail
    xor [A*2], 0xFADE + A, -123
    jne [0x0154], 0x040d, $fail
    xor [12345], A*2, -123
    jne [0x3039], 0xfed1, $fail
    xor [A], 12345, A*4 + B
    jne [0x00aa], 0x335a, $fail
    xor [A*2], -123, 12345
    jne [0x0154], 0xcfbc, $fail
    xor [A], A, A*2
    jne [0x00aa], 0x01fe, $fail
    xor [A*4 + B], A*4 + -10, 12345
    jne [0x0363], 0x32a7, $fail
    xor [A*4 + B], 12345, A
    jne [0x0363], 0x3093, $fail
    xor [A*4 + -10], 0xFADE + A, 0xFADE + A
    jne [0x029e], 0x0000, $fail
    xor [A*2], A*4 + B, 0xFADE + A
    jne [0x0154], 0xf8eb, $fail
    xor [A*2], A*2, A
    jne [0x0154], 0x01fe, $fail
    xor [A*2], 12345, A*4 + -10
    jne [0x0154], 0x32a7, $fail
    xor [A*2], 12345, -123
    jne [0x0154], 0xcfbc, $fail
    xor [A*4 + -10], A*4 + B, A*2
    jne [0x029e], 0x0237, $fail
    xor [A*2], A, A
    jne [0x0154], 0x0000, $fail
    xor [12345], 12345, A*4 + B
    jne [0x3039], 0x335a, $fail
    xor [A*2], A*4 + -10, A
    jne [0x0154], 0x0234, $fail
    xor [A], A*4 + -10, A*4 + B
    jne [0x00aa], 0x01fd, $fail
    xor [12345], A*4 + B, A
    jne [0x3039], 0x03c9, $fail
    xor [A*4 + B], 0xFADE + A, A
    jne [0x0363], 0xfb22, $fail
    xor [A*4 + B], 0xFADE + A, -123
    jne [0x0363], 0x040d, $fail
    xor [A*4 + -10], A*4 + -10, 0xFADE + A
    jne [0x029e], 0xf916, $fail
    xor [A*4 + -10], A, 12345
    jne [0x029e], 0x3093, $fail
    xor [A], A, -123
    jne [0x00aa], 0xff2f, $fail
    xor [A], -123, 0xFADE + A
    jne [0x00aa], 0x040d, $fail
    xor [A*2], A, A*4 + -10
    jne [0x0154], 0x0234, $fail
    xor [A*4 + B], A, A*4 + -10
    jne [0x0363], 0x0234, $fail
    xor [A*4 + B], -123, A*2
    jne [0x0363], 0xfed1, $fail
    xor [A], -123, A
    jne [0x00aa], 0xff2f, $fail
    xor [A*2], A, A*4 + B
    jne [0x0154], 0x03c9, $fail
    xor [A*4 + B], -123, A
    jne [0x0363], 0xff2f, $fail
    xor [12345], A, A
    jne [0x3039], 0x0000, $fail
    xor [A], A*2, A*4 + B
    jne [0x00aa], 0x0237, $fail
    xor [A*2], 0xFADE + A, A*4 + -10
    jne [0x0154], 0xf916, $fail
    xor [12345], 12345, -123
    jne [0x3039], 0xcfbc, $fail
    xor [12345], A*4 + B, A*2
    jne [0x3039], 0x0237, $fail
    xor [A], -123, -123
    jne [0x00aa], 0x0000, $fail
    xor [A*4 + B], A*4 + -10, A*4 + -10
    jne [0x0363], 0x0000, $fail
    xor [A*2], A*4 + B, A*2
    jne [0x0154], 0x0237, $fail
    xor [A], -123, 12345
    jne [0x00aa], 0xcfbc, $fail
    xor [12345], A*4 + B, 12345
    jne [0x3039], 0x335a, $fail
    xor [A], 0xFADE + A, A*4 + -10
    jne [0x00aa], 0xf916, $fail
    xor [A*2], A*4 + -10, A*4 + -10
    jne [0x0154], 0x0000, $fail
    xor [A*4 + B], -123, -123
    jne [0x0363], 0x0000, $fail
    xor [A*4 + B], A*4 + -10, A*2
    jne [0x0363], 0x03ca, $fail
    xor [A], 0xFADE + A, 12345
    jne [0x00aa], 0xcbb1, $fail
    xor [A*4 + -10], A, A*2
    jne [0x029e], 0x01fe, $fail
    xor [A*4 + -10], A*4 + -10, -123
    jne [0x029e], 0xfd1b, $fail
    xor [A], A*2, -123
    jne [0x00aa], 0xfed1, $fail
    xor [A*4 + -10], A*4 + -10, 12345
    jne [0x029e], 0x32a7, $fail
    xor [A], 12345, 0xFADE + A
    jne [0x00aa], 0xcbb1, $fail
    xor [A*4 + -10], A, A
    jne [0x029e], 0x0000, $fail
    xor [A*4 + -10], A, A*4 + B
    jne [0x029e], 0x03c9, $fail
    xor [A*4 + -10], A*4 + -10, A*2
    jne [0x029e], 0x03ca, $fail
    xor [12345], 12345, A
    jne [0x3039], 0x3093, $fail
    xor [A], A, A*4 + B
    jne [0x00aa], 0x03c9, $fail
    xor [A*4 + B], A*2, A*4 + -10
    jne [0x0363], 0x03ca, $fail
    xor [A], A*4 + -10, 0xFADE + A
    jne [0x00aa], 0xf916, $fail
    xor [A], 0xFADE + A, -123
    jne [0x00aa], 0x040d, $fail
    xor [A*4 + B], 12345, 0xFADE + A
    jne [0x0363], 0xcbb1, $fail
    xor [A*2], -123, -123
    jne [0x0154], 0x0000, $fail
    xor [A*4 + -10], A*4 + -10, A
    jne [0x029e], 0x0234, $fail
    xor [A*4 + B], 12345, -123
    jne [0x0363], 0xcfbc, $fail
    xor [12345], -123, A*4 + -10
    jne [0x3039], 0xfd1b, $fail
    xor [12345], A*2, A
    jne [0x3039], 0x01fe, $fail
    xor [A*2], 0xFADE + A, 12345
    jne [0x0154], 0xcbb1, $fail
    xor [A*4 + -10], A*2, 12345
    jne [0x029e], 0x316d, $fail
    xor [12345], 12345, A*4 + -10
    jne [0x3039], 0x32a7, $fail
    xor [A*4 + B], A, A
    jne [0x0363], 0x0000, $fail
    xor [A*4 + -10], -123, 0xFADE + A
    jne [0x029e], 0x040d, $fail
    xor [A], -123, A*4 + -10
    jne [0x00aa], 0xfd1b, $fail
    xor [A], A*4 + B, A*4 + B
    jne [0x00aa], 0x0000, $fail
    xor [12345], A*2, 12345
    jne [0x3039], 0x316d, $fail
    xor [A*4 + -10], -123, 12345
    jne [0x029e], 0xcfbc, $fail
    xor [A], A*4 + B, A
    jne [0x00aa], 0x03c9, $fail
    xor [12345], 0xFADE + A, A*2
    jne [0x3039], 0xfadc, $fail
    xor [A*4 + B], 0xFADE + A, A*4 + -10
    jne [0x0363], 0xf916, $fail
    xor [A*4 + -10], A, -123
    jne [0x029e], 0xff2f, $fail
    xor [A*4 + B], -123, A*4 + B
    jne [0x0363], 0xfce6, $fail
    xor [A*4 + -10], -123, -123
    jne [0x029e], 0x0000, $fail
    xor [A*4 + B], A*4 + -10, A*4 + B
    jne [0x0363], 0x01fd, $fail
    xor [A*4 + -10], 12345, A*2
    jne [0x029e], 0x316d, $fail
    xor [12345], A*4 + -10, 12345
    jne [0x3039], 0x32a7, $fail
    xor [A], A*4 + B, A*2
    jne [0x00aa], 0x0237, $fail
    xor [12345], A*2, A*4 + B
    jne [0x3039], 0x0237, $fail
    xor [A*2], 12345, A
    jne [0x0154], 0x3093, $fail
    xor [A*2], A, 12345
    jne [0x0154], 0x3093, $fail
    xor [A*4 + -10], A*2, A*4 + -10
    jne [0x029e], 0x03ca, $fail
    xor [A*4 + B], -123, 0xFADE + A
    jne [0x0363], 0x040d, $fail
    xor [A], A*4 + -10, A
    jne [0x00aa], 0x0234, $fail
    xor [12345], A*4 + B, A*4 + -10
    jne [0x3039], 0x01fd, $fail
    xor [A*4 + -10], 12345, -123
    jne [0x029e], 0xcfbc, $fail
    xor [A*2], -123, A*4 + -10
    jne [0x0154], 0xfd1b, $fail
    xor [A], A*2, A*2
    jne [0x00aa], 0x0000, $fail
    xor [A], A*2, A
    jne [0x00aa], 0x01fe, $fail
    xor [A], 0xFADE + A, A
    jne [0x00aa], 0xfb22, $fail
    xor [A], 12345, -123
    jne [0x00aa], 0xcfbc, $fail
    xor [12345], A*2, A*4 + -10
    jne [0x3039], 0x03ca, $fail
    xor [A*4 + B], A, A*4 + B
    jne [0x0363], 0x03c9, $fail
    xor [A*4 + -10], 0xFADE + A, 12345
    jne [0x029e], 0xcbb1, $fail
    xor [A*4 + -10], 12345, A*4 + -10
    jne [0x029e], 0x32a7, $fail
    xor [12345], A*4 + B, A*4 + B
    jne [0x3039], 0x0000, $fail
    xor [A], 12345, A
    jne [0x00aa], 0x3093, $fail
    xor [A*4 + -10], A*2, 0xFADE + A
    jne [0x029e], 0xfadc, $fail
    xor [A*4 + -10], A*4 + B, A*4 + B
    jne [0x029e], 0x0000, $fail
    xor [A*4 + -10], A*2, A*2
    jne [0x029e], 0x0000, $fail
    xor [A*2], A*2, A*2
    jne [0x0154], 0x0000, $fail
    xor [A], A, 12345
    jne [0x00aa], 0x3093, $fail
    xor [A*4 + -10], 0xFADE + A, A*4 + -10
    jne [0x029e], 0xf916, $fail
    xor [A*4 + -10], -123, A*2
    jne [0x029e], 0xfed1, $fail
    xor [12345], 0xFADE + A, A*4 + -10
    jne [0x3039], 0xf916, $fail
    xor [A], A*2, 12345
    jne [0x00aa], 0x316d, $fail
    xor [A*2], 0xFADE + A, A*2
    jne [0x0154], 0xfadc, $fail
    xor [A*2], A*2, 0xFADE + A
    jne [0x0154], 0xfadc, $fail
    xor [12345], A*2, 0xFADE + A
    jne [0x3039], 0xfadc, $fail
    xor [12345], A*4 + -10, 0xFADE + A
    jne [0x3039], 0xf916, $fail
    xor [A], A*4 + B, 12345
    jne [0x00aa], 0x335a, $fail
    xor [A*2], A*4 + B, 12345
    jne [0x0154], 0x335a, $fail
    xor [A*4 + B], A, 12345
    jne [0x0363], 0x3093, $fail
    xor [A*2], -123, 0xFADE + A
    jne [0x0154], 0x040d, $fail
    xor [A], A*4 + -10, A*4 + -10
    jne [0x00aa], 0x0000, $fail
    xor [A*4 + B], 12345, A*4 + B
    jne [0x0363], 0x335a, $fail
    xor [A*4 + -10], -123, A*4 + B
    jne [0x029e], 0xfce6, $fail
    xor [A*2], A*2, A*4 + -10
    jne [0x0154], 0x03ca, $fail
    xor [A*4 + -10], 0xFADE + A, -123
    jne [0x029e], 0x040d, $fail
    xor [12345], A, A*2
    jne [0x3039], 0x01fe, $fail
    xor [A*4 + B], 0xFADE + A, A*4 + B
    jne [0x0363], 0xf8eb, $fail
    xor [A*2], 0xFADE + A, A*4 + B
    jne [0x0154], 0xf8eb, $fail
    xor [A*4 + -10], A*4 + B, A*4 + -10
    jne [0x029e], 0x01fd, $fail
    xor [12345], -123, A*4 + B
    jne [0x3039], 0xfce6, $fail
    xor [A*4 + -10], A, A*4 + -10
    jne [0x029e], 0x0234, $fail
    xor [A*4 + B], -123, A*4 + -10
    jne [0x0363], 0xfd1b, $fail
    xor [A*4 + -10], -123, A*4 + -10
    jne [0x029e], 0xfd1b, $fail
    xor [12345], A, 0xFADE + A
    jne [0x3039], 0xfb22, $fail
    xor [12345], -123, A
    jne [0x3039], 0xff2f, $fail
    xor [A*4 + B], A*4 + B, A*4 + -10
    jne [0x0363], 0x01fd, $fail
    xor [A*4 + B], A, A*2
    jne [0x0363], 0x01fe, $fail
    xor [A*4 + -10], A*2, A*4 + B
    jne [0x029e], 0x0237, $fail
    xor [A*4 + -10], 12345, 12345
    jne [0x029e], 0x0000, $fail
    xor [A*4 + B], A*4 + B, 0xFADE + A
    jne [0x0363], 0xf8eb, $fail
    xor [A*2], A*4 + -10, A*4 + B
    jne [0x0154], 0x01fd, $fail
    xor [A*4 + -10], A*2, -123
    jne [0x029e], 0xfed1, $fail
    xor [12345], A, 12345
    jne [0x3039], 0x3093, $fail
    xor [A], 0xFADE + A, A*4 + B
    jne [0x00aa], 0xf8eb, $fail
    xor [A*2], A, 0xFADE + A
    jne [0x0154], 0xfb22, $fail
    xor [12345], 12345, 0xFADE + A
    jne [0x3039], 0xcbb1, $fail
    xor [A*4 + -10], 12345, A
    jne [0x029e], 0x3093, $fail
    xor [A], 12345, A*4 + -10
    jne [0x00aa], 0x32a7, $fail
    xor [12345], 0xFADE + A, 12345
    jne [0x3039], 0xcbb1, $fail
    xor [A*4 + -10], 0xFADE + A, A
    jne [0x029e], 0xfb22, $fail
    xor [A*2], A, -123
    jne [0x0154], 0xff2f, $fail
    xor [A*4 + B], A*4 + B, 12345
    jne [0x0363], 0x335a, $fail
    xor [A], A*2, 0xFADE + A
    jne [0x00aa], 0xfadc, $fail
    xor [A*2], 12345, 12345
    jne [0x0154], 0x0000, $fail
    xor [12345], 0xFADE + A, -123
    jne [0x3039], 0x040d, $fail
    xor [A*4 + B], A*4 + -10, 0xFADE + A
    jne [0x0363], 0xf916, $fail
    xor [A*2], A*4 + -10, 12345
    jne [0x0154], 0x32a7, $fail
    xor [A*4 + B], A*4 + B, A*4 + B
    jne [0x0363], 0x0000, $fail
    xor [A*4 + B], 12345, A*2
    jne [0x0363], 0x316d, $fail
    xor [12345], -123, -123
    jne [0x3039], 0x0000, $fail
    xor [12345], A*4 + B, -123
    jne [0x3039], 0xfce6, $fail
    xor [A], A*4 + -10, 12345
    jne [0x00aa], 0x32a7, $fail
    xor [A*4 + -10], A*4 + -10, A*4 + B
    jne [0x029e], 0x01fd, $fail
    xor [A], A, A*4 + -10
    jne [0x00aa], 0x0234, $fail
    xor [A*4 + B], 0xFADE + A, A*2
    jne [0x0363], 0xfadc, $fail
    xor [A], A*4 + B, A*4 + -10
    jne [0x00aa], 0x01fd, $fail
    xor [A*2], A*4 + B, A*4 + -10
    jne [0x0154], 0x01fd, $fail
    xor [A*4 + B], A*4 + -10, -123
    jne [0x0363], 0xfd1b, $fail
    xor [A*4 + -10], A*2, A
    jne [0x029e], 0x01fe, $fail
    xor [12345], A*2, A*2
    jne [0x3039], 0x0000, $fail
    xor [A*4 + B], A, -123
    jne [0x0363], 0xff2f, $fail
    xor [A*4 + -10], A*4 + B, 0xFADE + A
    jne [0x029e], 0xf8eb, $fail
    xor [A*2], 12345, 0xFADE + A
    jne [0x0154], 0xcbb1, $fail
    xor [12345], A*4 + -10, A*4 + -10
    jne [0x3039], 0x0000, $fail
    xor [A*4 + B], A*2, 0xFADE + A
    jne [0x0363], 0xfadc, $fail
    xor [A*4 + B], A*2, -123
    jne [0x0363], 0xfed1, $fail
    xor [A], A*4 + -10, -123
    jne [0x00aa], 0xfd1b, $fail
    xor [A*2], -123, A*4 + B
    jne [0x0154], 0xfce6, $fail
    xor [A*4 + B], A, 0xFADE + A
    jne [0x0363], 0xfb22, $fail
    xor [A], -123, A*2
    jne [0x00aa], 0xfed1, $fail
    xor [A*2], 12345, A*4 + B
    jne [0x0154], 0x335a, $fail
    xor [A], A*4 + B, -123
    jne [0x00aa], 0xfce6, $fail
    xor [A], -123, A*4 + B
    jne [0x00aa], 0xfce6, $fail
    xor [A*2], -123, A
    jne [0x0154], 0xff2f, $fail
    xor [A*4 + B], 12345, 12345
    jne [0x0363], 0x0000, $fail
    xor [A*2], A*2, 12345
    jne [0x0154], 0x316d, $fail
    xor [A*4 + -10], A*4 + B, -123
    jne [0x029e], 0xfce6, $fail
    xor [A*4 + B], A*2, A*2
    jne [0x0363], 0x0000, $fail
    xor [A*2], 0xFADE + A, A
    jne [0x0154], 0xfb22, $fail
    xor [A*4 + -10], A*4 + B, 12345
    jne [0x029e], 0x335a, $fail
    xor [12345], -123, 0xFADE + A
    jne [0x3039], 0x040d, $fail
    xor [A], A, 0xFADE + A
    jne [0x00aa], 0xfb22, $fail
    xor [A*4 + -10], 0xFADE + A, A*4 + B
    jne [0x029e], 0xf8eb, $fail
    xor [A*2], A*2, -123
    jne [0x0154], 0xfed1, $fail
    xor [A*4 + B], A*4 + B, A*2
    jne [0x0363], 0x0237, $fail
    xor [12345], 12345, 12345
    jne [0x3039], 0x0000, $fail
    xor [A*4 + B], A*4 + B, -123
    jne [0x0363], 0xfce6, $fail
    xor [A], A*2, A*4 + -10
    jne [0x00aa], 0x03ca, $fail
    xor [A], 0xFADE + A, 0xFADE + A
    jne [0x00aa], 0x0000, $fail
    xor [12345], 0xFADE + A, A*4 + B
    jne [0x3039], 0xf8eb, $fail
    xor [A*2], A*4 + -10, 0xFADE + A
    jne [0x0154], 0xf916, $fail
    xor [12345], 0xFADE + A, A
    jne [0x3039], 0xfb22, $fail
    xor [A*4 + -10], 12345, 0xFADE + A
    jne [0x029e], 0xcbb1, $fail
    xor [A*4 + B], A*2, A
    jne [0x0363], 0x01fe, $fail
    xor [A*4 + B], -123, 12345
    jne [0x0363], 0xcfbc, $fail
    xor [A], A*4 + B, 0xFADE + A
    jne [0x00aa], 0xf8eb, $fail
    xor [12345], A*4 + -10, -123
    jne [0x3039], 0xfd1b, $fail
    xor [12345], A*4 + -10, A*4 + B
    jne [0x3039], 0x01fd, $fail
    xor [12345], 12345, A*2
    jne [0x3039], 0x316d, $fail
    xor [A*2], A, A*2
    jne [0x0154], 0x01fe, $fail
    xor [A*4 + B], 12345, A*4 + -10
    jne [0x0363], 0x32a7, $fail
    xor [A*4 + -10], A*4 + -10, A*4 + -10
    jne [0x029e], 0x0000, $fail
    xor [A*2], A*2, A*4 + B
    jne [0x0154], 0x0237, $fail
    mov [A], -123
    jne [0x00aa], 0xff85, $fail
    mov [A*4 + B], 12345
    jne [0x0363], 0x3039, $fail
    mov [A*4 + B], 0xFADE + A
    jne [0x0363], 0xfb88, $fail
    mov [A], A*4 + -10
    jne [0x00aa], 0x029e, $fail
    mov [A*2], 12345
    jne [0x0154], 0x3039, $fail
    mov [A*4 + -10], A*2
    jne [0x029e], 0x0154, $fail
    mov [12345], A*4 + -10
    jne [0x3039], 0x029e, $fail
    mov [A*2], A*4 + -10
    jne [0x0154], 0x029e, $fail
    mov [12345], A
    jne [0x3039], 0x00aa, $fail
    mov [A*4 + -10], A*4 + -10
    jne [0x029e], 0x029e, $fail
    mov [A], 0xFADE + A
    jne [0x00aa], 0xfb88, $fail
    mov [A*4 + B], A
    jne [0x0363], 0x00aa, $fail
    mov [A*4 + -10], 0xFADE + A
    jne [0x029e], 0xfb88, $fail
    mov [A*4 + B], A*2
    jne [0x0363], 0x0154, $fail
    mov [A], A
    jne [0x00aa], 0x00aa, $fail
    mov [A*2], A*4 + B
    jne [0x0154], 0x0363, $fail
    mov [A], A*4 + B
    jne [0x00aa], 0x0363, $fail
    mov [A*2], 0xFADE + A
    jne [0x0154], 0xfb88, $fail
    mov [12345], A*4 + B
    jne [0x3039], 0x0363, $fail
    mov [A*2], A*2
    jne [0x0154], 0x0154, $fail
    mov [A*2], -123
    jne [0x0154], 0xff85, $fail
    mov [A], A*2
    jne [0x00aa], 0x0154, $fail
    mov [A*4 + -10], -123
    jne [0x029e], 0xff85, $fail
    mov [A], 12345
    jne [0x00aa], 0x3039, $fail
    mov [A*4 + B], A*4 + -10
    jne [0x0363], 0x029e, $fail
    mov [12345], A*2
    jne [0x3039], 0x0154, $fail
    mov [A*4 + -10], A
    jne [0x029e], 0x00aa, $fail
    mov [A*4 + -10], 12345
    jne [0x029e], 0x3039, $fail
    mov [A*4 + B], A*4 + B
    jne [0x0363], 0x0363, $fail
    mov [A*4 + -10], A*4 + B
    jne [0x029e], 0x0363, $fail
    mov [A*2], A
    jne [0x0154], 0x00aa, $fail
    mov [A*4 + B], -123
    jne [0x0363], 0xff85, $fail
    mov [12345], -123
    jne [0x3039], 0xff85, $fail
    mov [12345], 12345
    jne [0x3039], 0x3039, $fail
    mov [12345], 0xFADE + A
    jne [0x3039], 0xfb88, $fail
    push 0xFADE + A
    pop D
    jne D, 0xfb88, $fail
    push A*2
    pop D
    jne D, 0x0154, $fail
    push A*4 + -10
    pop D
    jne D, 0x029e, $fail
    push A
    pop D
    jne D, 0x00aa, $fail
    push A*4 + B
    pop D
    jne D, 0x0363, $fail
    push 12345
    pop D
    jne D, 0x3039, $fail
    push -123
    pop D
    jne D, 0xff85, $fail
    call $_L_test_uop_get_arg_1
    jne C, 0xADFE, $fail
    jmp $_L_test_uop_get_arg_2
_L_test_uop_get_arg_1:
    mov C, 0xADFE
    ret
    jmp $fail
_L_test_uop_get_arg_2:

# BEGIN test_uop_rom.asm
test_uop_alu_2dd:
    mov A, 0xABCD
    add A, 0xCDAB # TEST
    jne A, 0x7978, $fail

test_uop_alu_2di:
    mov A, 0x1000
    mov [0x1000], 0x0ABC
    add A, [A]  # TEST
    jne A, 0x1ABC, $fail

test_uop_alu_2id:
    mov [0x1000], 0x1234
    add [0x1000], 0x4321  # TEST
    mov A, [0x1000]
    jne A, 0x5555, $fail

test_uop_alu_2ii:
    mov [0x1000], 0x1234
    mov [0x1005], 0xAAAA
    add [0x1005], [0x1000]  # TEST
    jne [0x1005], 0xBCDE, $fail

test_uop_alu_3dd:
    mov A, 0xABFE
    mov B, 0x5555
    add C, A, B # TEST
    jne A, 0xABFE, $fail
    jne B, 0x5555, $fail
    jne C, 0x0153, $fail

test_uop_alu_3di:
    mov [0x1000], 0x12AA
    mov B, 0xFADE
    xor A, [0x1000], B # TEST
    jne [0x1000], 0x12AA, $fail
    jne B, 0xFADE, $fail
    jne A, 0xE874, $fail

test_uop_alu_3id:
    mov A, 0xABFE
    mov B, 0x5555
    sub [0x1000], A, B # TEST
    jne A, 0xABFE, $fail
    jne B, 0x5555, $fail
    jne [0x1000], 0x56A9, $fail

test_uop_alu_3ii:
    mov [0x1000], 0xABFE
    mov B, 0x5555
    and [0x1002], [0x1000], B # TEST
    jne [0x1000], 0xABFE, $fail
    jne B, 0x5555, $fail
    jne [0x1002], 0x0154, $fail

test_uop_alu_single_1dx:
    mov A, 0xFF00
    not A # TEST
    jne A, 0x00FF, $fail

test_uop_alu_single_1ix:
    mov [100], 0x1234
    neg [100] # TEST
    jne [100], 0xEDCC, $fail

test_uop_alu_single_2dd:
    mov B, 0x00FF
    not A, B # TEST
    jne B, 0x00FF, $fail
    jne A, 0xFF00, $fail

test_uop_alu_single_2di:
    mov [100], 0x1234
    not A, [100]
    jne [100], 0x1234, $fail
    jne A, 0xEDCB, $fail

test_uop_alu_single_2id:
    mov B, 0x00FF
    not [100], B # TEST
    jne B, 0x00FF, $fail
    jne [100], 0xFF00, $fail

test_uop_alu_single_2ii:
    mov [102], 0x00FF
    not [100], [102] # TEST
    jne [102], 0x00FF, $fail
    jne [100], 0xFF00, $fail

# GE GT LE LT NE EQ
test_uop_cmp_dd:
    mov B, 123
    cmp B, 456 # TEST
    getf A
    jne B, 123, $fail
    jne A, 0b001110, $fail

test_uop_cmp_di:
    mov [100], -123
    mov B, 456
    icmp B, [100] # TEST
    getf A
    jne B, 456, $fail
    jne A, 0b110010, $fail

test_uop_cmp_id:
    mov [100], -123
    mov B, 456
    icmp [100], B # TEST
    getf A
    jne B, 456, $fail
    jne A, 0b001110, $fail

test_uop_cmp_ii:
    mov [100], -123
    mov [102], -456
    icmp [100], [102]  # TEST
    getf A
    jne [100], -123, $fail
    jne [102], -456, $fail
    jne A, 0b110010, $fail

test_uop_jmp_d:
    mov A, $_L_test_uop_jmp_d_okay
    jmp A  # TEST
    jmp $fail
    _L_test_uop_jmp_d_okay:

test_uop_jmp_i:
    mov [100], $_L_test_uop_jmp_i_okay
    jmp [100]  # TEST
    jmp $fail
    _L_test_uop_jmp_i_okay:
    jne [100], $_L_test_uop_jmp_i_okay, $fail

test_uop_jmp_cond_i:
    mov [100], $_L_test_uop_jmp_cond_i_okay
    cmp 1, 2
    jeq $fail
    jne [100]  # TEST
    jmp $fail
    _L_test_uop_jmp_cond_i_okay:
    jne [100], $_L_test_uop_jmp_cond_i_okay, $fail

test_uop_jmp_cond_d:
    mov A, $_L_test_uop_jmp_cond_d_okay
    cmp 1, 1
    jne $fail
    jeq A  # TEST
    jmp $fail
    _L_test_uop_jmp_cond_d_okay:
    jne A, $_L_test_uop_jmp_cond_d_okay, $fail

test_uop_jmp_3dd:

test_uop_jmp_3di:

test_uop_jmp_3id:

test_uop_jmp_3ii:

test_uop_mov_dd:

test_uop_mov_di:

test_uop_mov_id:

test_uop_mov_ii:

test_uop_halt:

test_uop_getf:

test_uop_setf:

test_uop_call_d:

test_uop_call_i:

test_uop_ret:

test_uop_push_d:

test_uop_push_i:

test_uop_pop_d:

test_uop_pop_i:

test_uop_mmap:

test_uop_umap:
# END test_uop_rom.asm


# BEGIN test_call_ret.asm
test_call_ret:

    mov SP, 0x1000
    call $fn_test_target
    jne SP, 0x1000, $fail

    mov A, 10
    mov B, 0
    mov C, 0
    mov D, 0
    call $fn_recursive

    jne A, 0, $fail
    jne B, 0xcf3f, $fail
    jne C, 0x002d, $fail
    jne D, 0x4597, $fail
    jne SP, 0x1000, $fail

    jmp $test_call_ret_end

fn_recursive:
    sub A, 1
    call $fn_process_c
    jeq A, 0, $fn_recursive_end
    call $fn_recursive
    add D, C
    mul D, 3
    add B, D
    push D
    mul B, 5
    pop D
fn_recursive_end:
    ret
    jmp $fail

fn_process_c:
    add C, A
    ret
    jmp $fail

fn_test_target:
    jne SP, 0x0ffe, $fail
    ret
    jmp $fail

test_call_ret_end:
# END test_call_ret.asm


# BEGIN test_mem_access.asm
test_mem_access:
    mov [0x100], 0xFFED
    jne [0x100], 0x00AA, $test_mem_access_check_jmp
    jmp $fail
test_mem_access_check_jmp:

    mov [0x1000], 0
    mov SP, 0x1000
    jne [SP], 0, $fail
    push 0
    push 0
    push 0
    pop A
    pop A
    pop A
    jne SP, 0x1000, $fail
    jne A, 0, $fail

    push 0x0102
    jne SP, 0xFFE, $fail
    push 0x0304
    jne SP, 0xFFC, $fail

    jne [0xFFE], 0x0102, $fail
    jne [0xFFC], 0x0304, $fail

    # unaligned
    jne [0xFFB], 0x0400, $fail
    jne [0xFFD], 0x0203, $fail
    jne [0xFFF], 0x0001, $fail

    pop A
    jne A, 0x0304, $fail
    jne SP, 0xFFE, $fail
    pop A
    jne A, 0x0102, $fail
    jne SP, 0x1000, $fail

# END test_mem_access.asm


# BEGIN test_cmp.asm
test_cmp:
    setf 0xFFFF
    getf A
    jne A, 0x3F, $fail

    setf 0xABAB
    getf A
    jne A, 0x2B, $fail

    # unsigned
    cmp 0xFFAB, 0x2B
    getf A
    # GE GT LE LT NE EQ
    jne A, 0b110010, $fail

    cmp 0x2B, 0xFFAB
    getf A
    jne A, 0b001110, $fail

    cmp 0xFFAB, 0xFFAB
    getf A
    jne A, 0b101001, $fail

    # signed
    icmp 0xFFAB, 0x2B
    getf A
    # GE GT LE LT NE EQ
    jne A, 0b001110, $fail

    icmp 0x2B, 0xFFAB
    getf A
    jne A, 0b110010, $fail

    icmp 0xFFAB, 0xFFAB
    getf A
    jne A, 0b101001, $fail
# END test_cmp.asm

end_of_test:
    mov A, 0xDEAD
    mov B, 0xBEEF
    mul C, A, B
    jmp $success
