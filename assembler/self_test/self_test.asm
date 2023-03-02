
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
    jne H, 0xA614, $fail
    mov D, H
    # okay!
    add A, 0xACAB
    add B, 0x41CC
    mul A, D
    xor A, 0xF24A
    xor C, 0x494F
    xor H, 0x5A30
    mov D, H
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
    jne H, 0x836c, $fail

    imul B, 0xd230, 0xa012
    jne B, 0xc760, $fail
    jne H, 0x112a, $fail

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
    jne H, 0x0093, $fail

    imul B, 0x00ad, 0xda37
    jne B, 0x772b, $fail
    jne H, 0xffe6, $fail

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
    jne H, 0x27b7, $fail

    mov B, 0xf0ad
    imul B, 0x2a3f
    jne B, 0x9c93, $fail
    jne H, 0xfd78, $fail

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
    jne H, 0x0000, $fail

    mov B, 0x0000
    imul B, 0xdead
    jne B, 0x0000, $fail
    jne H, 0x0000, $fail

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

alu_test_direct_reg:
     # (direct) t=True, a=d230, b=a012
    mov C, 0xd230
    mov D, 0xa012
    add B, C, D
    jne B, 0x7242, $fail

    mov C, 0xd230
    mov D, 0xa012
    sub B, C, D
    jne B, 0x321e, $fail

    mov C, 0xd230
    mov D, 0xa012
    mul B, C, D
    jne B, 0xc760, $fail
    jne H, 0x836c, $fail

    mov C, 0xd230
    mov D, 0xa012
    imul B, C, D
    jne B, 0xc760, $fail
    jne H, 0x112a, $fail

    mov C, 0xd230
    mov D, 0xa012
    shr B, C, D
    jne B, 0x348c, $fail

    mov C, 0xd230
    mov D, 0xa012
    ishr B, C, D
    jne B, 0xf48c, $fail

    mov C, 0xd230
    mov D, 0xa012
    shl B, C, D
    jne B, 0x48c0, $fail

    mov C, 0xd230
    mov D, 0xa012
    and B, C, D
    jne B, 0x8010, $fail

    mov C, 0xd230
    mov D, 0xa012
    or B, C, D
    jne B, 0xf232, $fail

    mov C, 0xd230
    mov D, 0xa012
    xor B, C, D
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

     # (direct) t=True, a=00ad, b=da37
    mov C, 0x00ad
    mov D, 0xda37
    add B, C, D
    jne B, 0xdae4, $fail

    mov C, 0x00ad
    mov D, 0xda37
    sub B, C, D
    jne B, 0x2676, $fail

    mov C, 0x00ad
    mov D, 0xda37
    mul B, C, D
    jne B, 0x772b, $fail
    jne H, 0x0093, $fail

    mov C, 0x00ad
    mov D, 0xda37
    imul B, C, D
    jne B, 0x772b, $fail
    jne H, 0xffe6, $fail

    mov C, 0x00ad
    mov D, 0xda37
    shr B, C, D
    jne B, 0x0001, $fail

    mov C, 0x00ad
    mov D, 0xda37
    ishr B, C, D
    jne B, 0x0001, $fail

    mov C, 0x00ad
    mov D, 0xda37
    shl B, C, D
    jne B, 0x5680, $fail

    mov C, 0x00ad
    mov D, 0xda37
    and B, C, D
    jne B, 0x0025, $fail

    mov C, 0x00ad
    mov D, 0xda37
    or B, C, D
    jne B, 0xdabf, $fail

    mov C, 0x00ad
    mov D, 0xda37
    xor B, C, D
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

     # (direct) t=False, a=f0ad, b=2a3f
    mov C, 0xf0ad
    mov D, 0x2a3f
    mov B, C
    add B, D
    jne B, 0x1aec, $fail

    mov C, 0xf0ad
    mov D, 0x2a3f
    mov B, C
    sub B, D
    jne B, 0xc66e, $fail

    mov C, 0xf0ad
    mov D, 0x2a3f
    mov B, C
    mul B, D
    jne B, 0x9c93, $fail
    jne H, 0x27b7, $fail

    mov C, 0xf0ad
    mov D, 0x2a3f
    mov B, C
    imul B, D
    jne B, 0x9c93, $fail
    jne H, 0xfd78, $fail

    mov C, 0xf0ad
    mov D, 0x2a3f
    mov B, C
    shr B, D
    jne B, 0x0001, $fail

    mov C, 0xf0ad
    mov D, 0x2a3f
    mov B, C
    ishr B, D
    jne B, 0xffff, $fail

    mov C, 0xf0ad
    mov D, 0x2a3f
    mov B, C
    shl B, D
    jne B, 0x8000, $fail

    mov C, 0xf0ad
    mov D, 0x2a3f
    mov B, C
    and B, D
    jne B, 0x202d, $fail

    mov C, 0xf0ad
    mov D, 0x2a3f
    mov B, C
    or B, D
    jne B, 0xfabf, $fail

    mov C, 0xf0ad
    mov D, 0x2a3f
    mov B, C
    xor B, D
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

     # (direct) t=False, a=0000, b=dead
    mov C, 0x0000
    mov D, 0xdead
    mov B, C
    add B, D
    jne B, 0xdead, $fail

    mov C, 0x0000
    mov D, 0xdead
    mov B, C
    sub B, D
    jne B, 0x2153, $fail

    mov C, 0x0000
    mov D, 0xdead
    mov B, C
    mul B, D
    jne B, 0x0000, $fail
    jne H, 0x0000, $fail

    mov C, 0x0000
    mov D, 0xdead
    mov B, C
    imul B, D
    jne B, 0x0000, $fail
    jne H, 0x0000, $fail

    mov C, 0x0000
    mov D, 0xdead
    mov B, C
    shr B, D
    jne B, 0x0000, $fail

    mov C, 0x0000
    mov D, 0xdead
    mov B, C
    ishr B, D
    jne B, 0x0000, $fail

    mov C, 0x0000
    mov D, 0xdead
    mov B, C
    shl B, D
    jne B, 0x0000, $fail

    mov C, 0x0000
    mov D, 0xdead
    mov B, C
    and B, D
    jne B, 0x0000, $fail

    mov C, 0x0000
    mov D, 0xdead
    mov B, C
    or B, D
    jne B, 0xdead, $fail

    mov C, 0x0000
    mov D, 0xdead
    mov B, C
    xor B, D
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
    mov G, 0x0155
    xor [12345], -123, G
    jne [0x3039], 0xfed0, $fail
    and [A*4 + -10], G, A*2
    jne [0x029e], 0x0154, $fail
    sub [A*2], 0xFADE + A, A*4 + -10
    jne [0x0154], 0xf8ea, $fail
    ishr [12345], A, A*2
    jne [0x3039], 0x000a, $fail
    shl [G], A*4 + B, A*4 + -10
    jne [0x0155], 0xc000, $fail
    or [G], -123, G
    jne [0x0155], 0xffd5, $fail
    mul [A*4 + B], -123, A
    jne [0x0363], 0xae52, $fail
    ishr [12345], 12345, A*4 + B
    jne [0x3039], 0x0607, $fail
    shr [A*2], 0xFADE + A, A*2
    jne [0x0154], 0x0fb8, $fail
    add [A*2], G, G
    jne [0x0154], 0x02aa, $fail
    ishr [G], 0xFADE + A, A
    jne [0x0155], 0xfffe, $fail
    add [12345], 0xFADE + A, A*4 + B
    jne [0x3039], 0xfeeb, $fail
    ishr [A], A, A
    jne [0x00aa], 0x0000, $fail
    add [G], A*4 + B, A
    jne [0x0155], 0x040d, $fail
    xor [G], G, G
    jne [0x0155], 0x0000, $fail
    shl [A*2], G, A*2
    jne [0x0154], 0x1550, $fail
    ishr [G], 12345, A*2
    jne [0x0155], 0x0303, $fail
    and [A*2], A*4 + B, 0xFADE + A
    jne [0x0154], 0x0300, $fail
    add [A], A*4 + -10, A*4 + -10
    jne [0x00aa], 0x053c, $fail
    or [12345], A*2, -123
    jne [0x3039], 0xffd5, $fail
    add [12345], G, G
    jne [0x3039], 0x02aa, $fail
    and [G], 12345, 0xFADE + A
    jne [0x0155], 0x3008, $fail
    imul [12345], A*4 + B, A*4 + -10
    jne [0x3039], 0xdd1a, $fail
    or [A*2], 12345, A
    jne [0x0154], 0x30bb, $fail
    imul [A*2], A*4 + -10, A*2
    jne [0x0154], 0x79d8, $fail
    add [A*4 + -10], -123, A*4 + B
    jne [0x029e], 0x02e8, $fail
    sub [G], 0xFADE + A, A*2
    jne [0x0155], 0xfa34, $fail
    or [A*4 + B], 0xFADE + A, A*2
    jne [0x0363], 0xfbdc, $fail
    and [A*2], A*2, A
    jne [0x0154], 0x0000, $fail
    sub [A*4 + B], A*4 + B, G
    jne [0x0363], 0x020e, $fail
    add [A*4 + -10], A*4 + -10, A
    jne [0x029e], 0x0348, $fail
    sub [A*2], 12345, 12345
    jne [0x0154], 0x0000, $fail
    shr [A], -123, G
    jne [0x00aa], 0x07fc, $fail
    shl [A*4 + B], -123, A*4 + B
    jne [0x0363], 0xfc28, $fail
    or [A*4 + B], A, A
    jne [0x0363], 0x00aa, $fail
    sub [A], A, -123
    jne [0x00aa], 0x0125, $fail
    ishr [A*4 + -10], 0xFADE + A, A*2
    jne [0x029e], 0xffb8, $fail
    sub [A], 12345, 12345
    jne [0x00aa], 0x0000, $fail
    add [G], 12345, 12345
    jne [0x0155], 0x6072, $fail
    shr [A*4 + B], 0xFADE + A, 0xFADE + A
    jne [0x0363], 0x00fb, $fail
    imul [A], A, G
    jne [0x00aa], 0xe272, $fail
    shr [A*2], 0xFADE + A, A*4 + B
    jne [0x0154], 0x1f71, $fail
    shr [A*4 + B], A*4 + B, -123
    jne [0x0363], 0x001b, $fail
    shr [A], A*2, A*4 + B
    jne [0x00aa], 0x002a, $fail
    and [12345], A*4 + B, A
    jne [0x3039], 0x0022, $fail
    shr [12345], 12345, 12345
    jne [0x3039], 0x0018, $fail
    mul [A], G, A*4 + -10
    jne [0x00aa], 0x7c76, $fail
    add [A*4 + B], 12345, A*4 + B
    jne [0x0363], 0x339c, $fail
    imul [G], A*4 + -10, A*4 + B
    jne [0x0155], 0xdd1a, $fail
    shl [A], A*2, 12345
    jne [0x00aa], 0xa800, $fail
    add [A*2], G, A
    jne [0x0154], 0x01ff, $fail
    add [A*4 + B], A*4 + B, A*2
    jne [0x0363], 0x04b7, $fail
    shr [A], G, 0xFADE + A
    jne [0x00aa], 0x0001, $fail
    add [G], -123, A
    jne [0x0155], 0x002f, $fail
    imul [A*4 + -10], G, 12345
    jne [0x029e], 0x3bed, $fail
    mul [G], 0xFADE + A, A*4 + B
    jne [0x0155], 0xdd98, $fail
    shr [G], G, A
    jne [0x0155], 0x0000, $fail
    or [A*2], A, A
    jne [0x0154], 0x00aa, $fail
    or [A*4 + -10], -123, A*2
    jne [0x029e], 0xffd5, $fail
    mul [A*4 + B], -123, -123
    jne [0x0363], 0x3b19, $fail
    mul [12345], 0xFADE + A, A*2
    jne [0x3039], 0x10a0, $fail
    sub [G], A, A*4 + -10
    jne [0x0155], 0xfe0c, $fail
    shl [A], A*4 + B, A*2
    jne [0x00aa], 0x3630, $fail
    xor [A*2], -123, A*4 + B
    jne [0x0154], 0xfce6, $fail
    sub [A*4 + B], A*4 + -10, -123
    jne [0x0363], 0x0319, $fail
    sub [12345], 12345, 0xFADE + A
    jne [0x3039], 0x34b1, $fail
    and [G], A*4 + B, 0xFADE + A
    jne [0x0155], 0x0300, $fail
    shl [A], A*4 + -10, G
    jne [0x00aa], 0x53c0, $fail
    ishr [G], G, 0xFADE + A
    jne [0x0155], 0x0001, $fail
    and [A*2], 12345, A*4 + B
    jne [0x0154], 0x0021, $fail
    ishr [A*2], A*2, -123
    jne [0x0154], 0x000a, $fail
    xor [G], A*2, 12345
    jne [0x0155], 0x316d, $fail
    sub [A*4 + B], A*4 + -10, A*4 + B
    jne [0x0363], 0xff3b, $fail
    or [12345], G, -123
    jne [0x3039], 0xffd5, $fail
    shl [A*4 + B], A*4 + -10, A
    jne [0x0363], 0x7800, $fail
    sub [12345], A*2, A
    jne [0x3039], 0x00aa, $fail
    xor [12345], A*4 + B, A*2
    jne [0x3039], 0x0237, $fail
    and [A*4 + B], 12345, -123
    jne [0x0363], 0x3001, $fail
    imul [G], A*4 + B, 12345
    jne [0x0155], 0x510b, $fail
    or [A*4 + B], A, G
    jne [0x0363], 0x01ff, $fail
    ishr [A*4 + -10], 12345, A
    jne [0x029e], 0x000c, $fail
    shl [12345], 0xFADE + A, 0xFADE + A
    jne [0x3039], 0x8800, $fail
    shl [A], 12345, G
    jne [0x00aa], 0x0720, $fail
    xor [G], A*4 + -10, A*2
    jne [0x0155], 0x03ca, $fail
    or [A*4 + B], G, -123
    jne [0x0363], 0xffd5, $fail
    sub [A*4 + -10], -123, 12345
    jne [0x029e], 0xcf4c, $fail
    shl [A*2], A*2, A*2
    jne [0x0154], 0x1540, $fail
    sub [12345], 0xFADE + A, 12345
    jne [0x3039], 0xcb4f, $fail
    shr [A*2], 12345, -123
    jne [0x0154], 0x0181, $fail
    ishr [12345], 0xFADE + A, A
    jne [0x3039], 0xfffe, $fail
    xor [A*4 + -10], 0xFADE + A, 12345
    jne [0x029e], 0xcbb1, $fail
    sub [A*4 + -10], A*2, A*4 + -10
    jne [0x029e], 0xfeb6, $fail
    imul [G], -123, A*4 + -10
    jne [0x0155], 0xbe16, $fail
    shl [A], A*4 + B, A*4 + B
    jne [0x00aa], 0x1b18, $fail
    xor [12345], A*2, A*4 + B
    jne [0x3039], 0x0237, $fail
    add [A*2], A*2, 12345
    jne [0x0154], 0x318d, $fail
    and [A*2], A*4 + B, A
    jne [0x0154], 0x0022, $fail
    shl [A], A*4 + B, 0xFADE + A
    jne [0x00aa], 0x6300, $fail
    and [A*4 + B], G, A
    jne [0x0363], 0x0000, $fail
    xor [G], A*2, -123
    jne [0x0155], 0xfed1, $fail
    and [12345], G, A*2
    jne [0x3039], 0x0154, $fail
    or [A*4 + -10], 12345, A*4 + B
    jne [0x029e], 0x337b, $fail
    xor [G], 0xFADE + A, A*4 + -10
    jne [0x0155], 0xf916, $fail
    imul [A*4 + B], A*2, A*4 + B
    jne [0x0363], 0x7f7c, $fail
    ishr [G], A*2, G
    jne [0x0155], 0x000a, $fail
    mul [A*2], -123, -123
    jne [0x0154], 0x3b19, $fail
    imul [A*4 + B], 0xFADE + A, A
    jne [0x0363], 0x0850, $fail
    shr [A*4 + -10], A*4 + -10, A*4 + -10
    jne [0x029e], 0x0000, $fail
    mul [A], -123, 0xFADE + A
    jne [0x00aa], 0x25a8, $fail
    ishr [A*4 + -10], A, A*2
    jne [0x029e], 0x000a, $fail
    or [A*4 + -10], A, A
    jne [0x029e], 0x00aa, $fail
    add [12345], G, 12345
    jne [0x3039], 0x318e, $fail
    imul [A*4 + -10], 12345, A*4 + -10
    jne [0x029e], 0x352e, $fail
    ishr [G], G, A*2
    jne [0x0155], 0x0015, $fail
    imul [A], 0xFADE + A, A*4 + -10
    jne [0x00aa], 0x4df0, $fail
    ishr [G], A, G
    jne [0x0155], 0x0005, $fail
    add [A*4 + B], 12345, A*4 + -10
    jne [0x0363], 0x32d7, $fail
    and [A*4 + -10], A*4 + B, 0xFADE + A
    jne [0x029e], 0x0300, $fail
    imul [A], -123, A*4 + B
    jne [0x00aa], 0x5f6f, $fail
    shr [G], A*4 + -10, 0xFADE + A
    jne [0x0155], 0x0002, $fail
    or [A*4 + B], 12345, A
    jne [0x0363], 0x30bb, $fail
    xor [A*4 + B], 12345, G
    jne [0x0363], 0x316c, $fail
    imul [A], A, 12345
    jne [0x00aa], 0x05da, $fail
    or [A*2], A*4 + B, A*4 + -10
    jne [0x0154], 0x03ff, $fail
    shl [G], 0xFADE + A, 12345
    jne [0x0155], 0x1000, $fail
    ishr [A*4 + B], 0xFADE + A, A*4 + B
    jne [0x0363], 0xff71, $fail
    shl [A*4 + -10], 0xFADE + A, -123
    jne [0x029e], 0x7100, $fail
    shr [A*4 + -10], 0xFADE + A, A
    jne [0x029e], 0x003e, $fail
    mul [A*4 + -10], A, A*4 + B
    jne [0x029e], 0x3fbe, $fail
    or [A*2], A*4 + -10, A*4 + B
    jne [0x0154], 0x03ff, $fail
    imul [A*4 + -10], A*2, -123
    jne [0x029e], 0x5ca4, $fail
    shl [12345], A*4 + -10, A*2
    jne [0x3039], 0x29e0, $fail
    shl [A*2], 0xFADE + A, 0xFADE + A
    jne [0x0154], 0x8800, $fail
    add [G], A*2, A*2
    jne [0x0155], 0x02a8, $fail
    and [A*2], 0xFADE + A, G
    jne [0x0154], 0x0100, $fail
    and [A*4 + -10], 12345, 12345
    jne [0x029e], 0x3039, $fail
    shl [A*4 + -10], A, -123
    jne [0x029e], 0x1540, $fail
    and [A*4 + B], A*4 + -10, 0xFADE + A
    jne [0x0363], 0x0288, $fail
    add [G], -123, -123
    jne [0x0155], 0xff0a, $fail
    mul [A], A, 0xFADE + A
    jne [0x00aa], 0x0850, $fail
    or [A*2], A*4 + B, G
    jne [0x0154], 0x0377, $fail
    sub [G], 0xFADE + A, 0xFADE + A
    jne [0x0155], 0x0000, $fail
    shr [A*4 + B], G, 0xFADE + A
    jne [0x0363], 0x0001, $fail
    sub [A*2], -123, G
    jne [0x0154], 0xfe30, $fail
    shl [A*4 + -10], A*2, G
    jne [0x029e], 0x2a80, $fail
    shl [A], -123, A*4 + -10
    jne [0x00aa], 0x4000, $fail
    mul [A*4 + -10], A*4 + B, A*2
    jne [0x029e], 0x7f7c, $fail
    shr [A], A*4 + B, G
    jne [0x00aa], 0x001b, $fail
    add [A], A*4 + B, 12345
    jne [0x00aa], 0x339c, $fail
    xor [G], 12345, -123
    jne [0x0155], 0xcfbc, $fail
    sub [A], 0xFADE + A, A*4 + B
    jne [0x00aa], 0xf825, $fail
    ishr [A*4 + B], A*2, G
    jne [0x0363], 0x000a, $fail
    or [A*2], G, 0xFADE + A
    jne [0x0154], 0xfbdd, $fail
    mul [12345], 0xFADE + A, G
    jne [0x3039], 0x0c28, $fail
    imul [A*4 + B], A*4 + B, 0xFADE + A
    jne [0x0363], 0xdd98, $fail
    and [12345], A, G
    jne [0x3039], 0x0000, $fail
    imul [G], G, A*4 + B
    jne [0x0155], 0x82df, $fail
    imul [A*4 + -10], A*2, A*2
    jne [0x029e], 0xc390, $fail
    or [G], 0xFADE + A, -123
    jne [0x0155], 0xff8d, $fail
    imul [A*4 + B], A, A*4 + -10
    jne [0x0363], 0xbcec, $fail
    shr [A*4 + B], A*4 + -10, 12345
    jne [0x0363], 0x0001, $fail
    xor [A*4 + B], A*2, 12345
    jne [0x0363], 0x316d, $fail
    shr [12345], A*4 + -10, 12345
    jne [0x3039], 0x0001, $fail
    shr [A*2], -123, A*4 + -10
    jne [0x0154], 0x0003, $fail
    or [A*2], A, A*2
    jne [0x0154], 0x01fe, $fail
    shr [G], A*4 + B, A*2
    jne [0x0155], 0x0036, $fail
    xor [12345], A*4 + -10, A*4 + B
    jne [0x3039], 0x01fd, $fail
    mul [A*4 + -10], 0xFADE + A, A*4 + -10
    jne [0x029e], 0x4df0, $fail
    imul [A*4 + B], A*2, A*4 + -10
    jne [0x0363], 0x79d8, $fail
    shr [12345], 0xFADE + A, A*4 + -10
    jne [0x3039], 0x0003, $fail
    add [A*4 + -10], A, G
    jne [0x029e], 0x01ff, $fail
    shr [A*4 + B], 0xFADE + A, 12345
    jne [0x0363], 0x007d, $fail
    shr [A*4 + -10], -123, -123
    jne [0x029e], 0x07fc, $fail
    imul [A], -123, 12345
    jne [0x00aa], 0xd49d, $fail
    shl [A*4 + B], A*4 + -10, A*2
    jne [0x0363], 0x29e0, $fail
    xor [A*2], 12345, G
    jne [0x0154], 0x316c, $fail
    xor [12345], A*4 + -10, A*4 + -10
    jne [0x3039], 0x0000, $fail
    xor [A], A*2, -123
    jne [0x00aa], 0xfed1, $fail
    xor [A*2], A*2, G
    jne [0x0154], 0x0001, $fail
    mul [G], 12345, A
    jne [0x0155], 0x05da, $fail
    xor [A*2], 12345, A*2
    jne [0x0154], 0x316d, $fail
    mul [A*2], A*4 + B, 12345
    jne [0x0154], 0x510b, $fail
    and [A*4 + -10], 12345, -123
    jne [0x029e], 0x3001, $fail
    shl [G], A*2, A
    jne [0x0155], 0x5000, $fail
    and [A], 0xFADE + A, A
    jne [0x00aa], 0x0088, $fail
    shl [A*2], A*4 + -10, 0xFADE + A
    jne [0x0154], 0x9e00, $fail
    xor [12345], 12345, -123
    jne [0x3039], 0xcfbc, $fail
    mul [A*4 + -10], A*4 + -10, -123
    jne [0x029e], 0xbe16, $fail
    sub [G], A*2, A*4 + -10
    jne [0x0155], 0xfeb6, $fail
    sub [A*4 + -10], A*4 + B, G
    jne [0x029e], 0x020e, $fail
    xor [A*4 + -10], -123, G
    jne [0x029e], 0xfed0, $fail
    sub [A], A*4 + B, -123
    jne [0x00aa], 0x03de, $fail
    sub [A], A*2, G
    jne [0x00aa], 0xffff, $fail
    sub [A*4 + B], A, 0xFADE + A
    jne [0x0363], 0x0522, $fail
    shl [12345], G, A*4 + -10
    jne [0x3039], 0x4000, $fail
    and [A], -123, -123
    jne [0x00aa], 0xff85, $fail
    xor [A], G, 12345
    jne [0x00aa], 0x316c, $fail
    or [12345], A*2, A*4 + -10
    jne [0x3039], 0x03de, $fail
    or [A], 0xFADE + A, A*2
    jne [0x00aa], 0xfbdc, $fail
    xor [G], A*4 + -10, A*4 + -10
    jne [0x0155], 0x0000, $fail
    xor [A*4 + -10], A, 0xFADE + A
    jne [0x029e], 0xfb22, $fail
    xor [12345], -123, 12345
    jne [0x3039], 0xcfbc, $fail
    shr [A*4 + -10], G, A*4 + B
    jne [0x029e], 0x002a, $fail
    and [A], G, A
    jne [0x00aa], 0x0000, $fail
    sub [A*4 + B], 0xFADE + A, -123
    jne [0x0363], 0xfc03, $fail
    and [12345], A*2, A*2
    jne [0x3039], 0x0154, $fail
    shr [12345], A, 12345
    jne [0x3039], 0x0000, $fail
    imul [A*4 + -10], A*4 + B, A*4 + -10
    jne [0x029e], 0xdd1a, $fail
    shr [12345], A*4 + -10, -123
    jne [0x3039], 0x0014, $fail
    add [G], A, 12345
    jne [0x0155], 0x30e3, $fail
    ishr [12345], A*2, 12345
    jne [0x3039], 0x0000, $fail
    ishr [12345], 0xFADE + A, -123
    jne [0x3039], 0xffdc, $fail
    or [A*4 + -10], G, A
    jne [0x029e], 0x01ff, $fail
    ishr [A*4 + B], A*4 + B, A
    jne [0x0363], 0x0000, $fail
    shl [G], 12345, A*4 + B
    jne [0x0155], 0x81c8, $fail
    mul [A*2], A*4 + -10, A
    jne [0x0154], 0xbcec, $fail
    imul [A*4 + -10], A*4 + -10, 12345
    jne [0x029e], 0x352e, $fail
    xor [12345], -123, A*4 + -10
    jne [0x3039], 0xfd1b, $fail
    or [G], A, 0xFADE + A
    jne [0x0155], 0xfbaa, $fail
    imul [G], G, A*4 + -10
    jne [0x0155], 0x7c76, $fail
    mul [A], 12345, A*4 + -10
    jne [0x00aa], 0x352e, $fail
    or [G], A, A
    jne [0x0155], 0x00aa, $fail
    shr [A*4 + -10], A*2, 0xFADE + A
    jne [0x029e], 0x0001, $fail
    ishr [A], A*4 + -10, A*4 + B
    jne [0x00aa], 0x0053, $fail
    add [A], 12345, A
    jne [0x00aa], 0x30e3, $fail
    ishr [A], -123, A
    jne [0x00aa], 0xffff, $fail
    and [A*2], A, -123
    jne [0x0154], 0x0080, $fail
    xor [A*4 + B], -123, 0xFADE + A
    jne [0x0363], 0x040d, $fail
    add [A], 12345, A*2
    jne [0x00aa], 0x318d, $fail
    add [A*2], G, A*4 + B
    jne [0x0154], 0x04b8, $fail
    or [A], A*4 + B, A
    jne [0x00aa], 0x03eb, $fail
    add [A*2], -123, 12345
    jne [0x0154], 0x2fbe, $fail
    shl [G], A*4 + B, -123
    jne [0x0155], 0x6c60, $fail
    add [A*4 + -10], A*4 + -10, A*4 + B
    jne [0x029e], 0x0601, $fail
    or [A], A*4 + -10, 0xFADE + A
    jne [0x00aa], 0xfb9e, $fail
    shl [A*4 + B], A*2, -123
    jne [0x0363], 0x2a80, $fail
    or [12345], -123, A*4 + B
    jne [0x3039], 0xffe7, $fail
    add [A*2], A*4 + B, A*4 + B
    jne [0x0154], 0x06c6, $fail
    and [A], A*2, A
    jne [0x00aa], 0x0000, $fail
    sub [A], G, -123
    jne [0x00aa], 0x01d0, $fail
    or [A], A*4 + B, A*4 + -10
    jne [0x00aa], 0x03ff, $fail
    xor [A*4 + B], A, A*4 + B
    jne [0x0363], 0x03c9, $fail
    shl [A*2], G, A*4 + -10
    jne [0x0154], 0x4000, $fail
    and [A*4 + -10], 12345, A*2
    jne [0x029e], 0x0010, $fail
    shr [12345], A*4 + B, 0xFADE + A
    jne [0x3039], 0x0003, $fail
    mul [G], A*2, A*4 + B
    jne [0x0155], 0x7f7c, $fail
    shr [A*4 + -10], A*4 + -10, G
    jne [0x029e], 0x0014, $fail
    mul [A], 12345, 0xFADE + A
    jne [0x00aa], 0x8148, $fail
    mul [A*4 + B], -123, A*4 + -10
    jne [0x0363], 0xbe16, $fail
    and [A*4 + B], -123, G
    jne [0x0363], 0x0105, $fail
    shl [12345], 12345, A
    jne [0x3039], 0xe400, $fail
    imul [A], G, A*4 + B
    jne [0x00aa], 0x82df, $fail
    sub [A*4 + -10], -123, A*4 + -10
    jne [0x029e], 0xfce7, $fail
    shl [A*2], A, A*4 + B
    jne [0x0154], 0x0550, $fail
    add [A], A*4 + -10, A*2
    jne [0x00aa], 0x03f2, $fail
    mul [A*2], G, -123
    jne [0x0154], 0x5c29, $fail
    mul [G], -123, 12345
    jne [0x0155], 0xd49d, $fail
    ishr [12345], A*4 + B, A*4 + B
    jne [0x3039], 0x006c, $fail
    add [A*4 + B], -123, A*2
    jne [0x0363], 0x00d9, $fail
    mul [12345], 12345, G
    jne [0x3039], 0x3bed, $fail
    or [12345], A*4 + B, G
    jne [0x3039], 0x0377, $fail
    shl [A*4 + B], -123, 12345
    jne [0x0363], 0x0a00, $fail
    mul [G], -123, A*4 + B
    jne [0x0155], 0x5f6f, $fail
    and [A*4 + -10], 12345, G
    jne [0x029e], 0x0011, $fail
    ishr [A*4 + B], A*2, 0xFADE + A
    jne [0x0363], 0x0001, $fail
    or [A*2], A*2, A*4 + B
    jne [0x0154], 0x0377, $fail
    and [A*4 + B], G, G
    jne [0x0363], 0x0155, $fail
    shl [A*4 + B], A*4 + -10, A*4 + -10
    jne [0x0363], 0x8000, $fail
    sub [A*4 + -10], A*4 + B, -123
    jne [0x029e], 0x03de, $fail
    and [G], G, -123
    jne [0x0155], 0x0105, $fail
    ishr [A*2], A*4 + -10, -123
    jne [0x0154], 0x0014, $fail
    or [12345], A*2, G
    jne [0x3039], 0x0155, $fail
    or [A*4 + B], A, A*2
    jne [0x0363], 0x01fe, $fail
    shr [A*2], A, 12345
    jne [0x0154], 0x0000, $fail
    imul [A*4 + -10], A*4 + -10, 0xFADE + A
    jne [0x029e], 0x4df0, $fail
    shr [A*4 + B], A*4 + -10, G
    jne [0x0363], 0x0014, $fail
    shl [12345], A*4 + B, -123
    jne [0x3039], 0x6c60, $fail
    sub [12345], A*4 + -10, A
    jne [0x3039], 0x01f4, $fail
    sub [G], A*4 + -10, G
    jne [0x0155], 0x0149, $fail
    xor [A], A, A*4 + B
    jne [0x00aa], 0x03c9, $fail
    shr [A], A*2, A*2
    jne [0x00aa], 0x0015, $fail
    add [A*4 + B], 12345, A*2
    jne [0x0363], 0x318d, $fail
    add [G], A*4 + B, A*4 + B
    jne [0x0155], 0x06c6, $fail
    shl [A*4 + B], A*4 + B, A*4 + -10
    jne [0x0363], 0xc000, $fail
    xor [A*4 + -10], A*4 + B, A
    jne [0x029e], 0x03c9, $fail
    mul [A], 0xFADE + A, -123
    jne [0x00aa], 0x25a8, $fail
    and [A*4 + -10], 12345, 0xFADE + A
    jne [0x029e], 0x3008, $fail
    add [A], G, A*2
    jne [0x00aa], 0x02a9, $fail
    sub [G], 0xFADE + A, G
    jne [0x0155], 0xfa33, $fail
    shr [12345], A*4 + -10, 0xFADE + A
    jne [0x3039], 0x0002, $fail
    shr [A*4 + -10], A*2, A*4 + B
    jne [0x029e], 0x002a, $fail
    shr [G], A, A*4 + B
    jne [0x0155], 0x0015, $fail
    imul [A*4 + B], G, A*2
    jne [0x0363], 0xc4e4, $fail
    mul [A*4 + -10], 0xFADE + A, 0xFADE + A
    jne [0x029e], 0xf840, $fail
    add [A*4 + -10], A*4 + B, 12345
    jne [0x029e], 0x339c, $fail
    xor [A*4 + B], G, A*4 + -10
    jne [0x0363], 0x03cb, $fail
    xor [A*2], 0xFADE + A, A
    jne [0x0154], 0xfb22, $fail
    shr [12345], 12345, A*2
    jne [0x3039], 0x0303, $fail
    imul [A*4 + B], G, 12345
    jne [0x0363], 0x3bed, $fail
    xor [12345], -123, A*2
    jne [0x3039], 0xfed1, $fail
    sub [12345], G, 0xFADE + A
    jne [0x3039], 0x05cd, $fail
    xor [A], A*2, 0xFADE + A
    jne [0x00aa], 0xfadc, $fail
    mul [A*2], A*4 + -10, 12345
    jne [0x0154], 0x352e, $fail
    shl [A*4 + B], A*2, A
    jne [0x0363], 0x5000, $fail
    and [G], -123, 0xFADE + A
    jne [0x0155], 0xfb80, $fail
    shr [A], A, A*2
    jne [0x00aa], 0x000a, $fail
    xor [A*4 + -10], A, A*4 + -10
    jne [0x029e], 0x0234, $fail
    shl [A*4 + -10], A*4 + -10, A*2
    jne [0x029e], 0x29e0, $fail
    mul [A], A*4 + -10, -123
    jne [0x00aa], 0xbe16, $fail
    or [G], G, 12345
    jne [0x0155], 0x317d, $fail
    shr [A*4 + B], 0xFADE + A, A*4 + -10
    jne [0x0363], 0x0003, $fail
    mul [A*4 + B], A, 12345
    jne [0x0363], 0x05da, $fail
    and [A*4 + -10], A*2, 12345
    jne [0x029e], 0x0010, $fail
    and [12345], A, A*4 + B
    jne [0x3039], 0x0022, $fail
    imul [G], A*4 + B, G
    jne [0x0155], 0x82df, $fail
    sub [12345], G, A*4 + B
    jne [0x3039], 0xfdf2, $fail
    shr [A*4 + B], G, A*4 + B
    jne [0x0363], 0x002a, $fail
    or [A*4 + -10], G, G
    jne [0x029e], 0x0155, $fail
    xor [A*2], A, G
    jne [0x0154], 0x01ff, $fail
    shr [G], A*4 + -10, -123
    jne [0x0155], 0x0014, $fail
    ishr [12345], G, A
    jne [0x3039], 0x0000, $fail
    mul [A*2], -123, 0xFADE + A
    jne [0x0154], 0x25a8, $fail
    or [A*2], 0xFADE + A, 12345
    jne [0x0154], 0xfbb9, $fail
    imul [A*4 + B], 12345, 0xFADE + A
    jne [0x0363], 0x8148, $fail
    or [A*4 + -10], G, -123
    jne [0x029e], 0xffd5, $fail
    ishr [A*4 + -10], A*2, A
    jne [0x029e], 0x0000, $fail
    and [A*2], A*4 + B, -123
    jne [0x0154], 0x0301, $fail
    or [A], A*2, A*4 + -10
    jne [0x00aa], 0x03de, $fail
    add [G], A*4 + -10, A
    jne [0x0155], 0x0348, $fail
    shl [A*4 + -10], A, 12345
    jne [0x029e], 0x5400, $fail
    shl [A], 0xFADE + A, 0xFADE + A
    jne [0x00aa], 0x8800, $fail
    imul [G], A*4 + -10, 12345
    jne [0x0155], 0x352e, $fail
    add [12345], -123, -123
    jne [0x3039], 0xff0a, $fail
    sub [A*2], A*4 + -10, G
    jne [0x0154], 0x0149, $fail
    ishr [A], 0xFADE + A, G
    jne [0x00aa], 0xffdc, $fail
    xor [A], 0xFADE + A, 12345
    jne [0x00aa], 0xcbb1, $fail
    sub [G], A*2, 0xFADE + A
    jne [0x0155], 0x05cc, $fail
    add [A*4 + B], 12345, 12345
    jne [0x0363], 0x6072, $fail
    sub [A*4 + -10], -123, 0xFADE + A
    jne [0x029e], 0x03fd, $fail
    add [A*2], A*2, A*4 + -10
    jne [0x0154], 0x03f2, $fail
    shr [A], 12345, -123
    jne [0x00aa], 0x0181, $fail
    imul [A*2], A, A*4 + -10
    jne [0x0154], 0xbcec, $fail
    or [A*4 + -10], G, 0xFADE + A
    jne [0x029e], 0xfbdd, $fail
    ishr [G], A, -123
    jne [0x0155], 0x0005, $fail
    ishr [A*2], A, 0xFADE + A
    jne [0x0154], 0x0000, $fail
    shr [12345], -123, A
    jne [0x3039], 0x003f, $fail
    imul [A], A, A*4 + -10
    jne [0x00aa], 0xbcec, $fail
    add [A*4 + B], 0xFADE + A, G
    jne [0x0363], 0xfcdd, $fail
    xor [G], 12345, A*4 + -10
    jne [0x0155], 0x32a7, $fail
    imul [A], 12345, A*4 + B
    jne [0x00aa], 0x510b, $fail
    or [A*4 + -10], 0xFADE + A, G
    jne [0x029e], 0xfbdd, $fail
    sub [A*2], -123, A*2
    jne [0x0154], 0xfe31, $fail
    or [A*4 + B], A*2, A*2
    jne [0x0363], 0x0154, $fail
    imul [12345], A, A*4 + -10
    jne [0x3039], 0xbcec, $fail
    ishr [A*4 + -10], 0xFADE + A, A*4 + B
    jne [0x029e], 0xff71, $fail
    and [12345], A, 0xFADE + A
    jne [0x3039], 0x0088, $fail
    ishr [A], G, G
    jne [0x00aa], 0x000a, $fail
    imul [A], A*4 + -10, A
    jne [0x00aa], 0xbcec, $fail
    or [12345], A*4 + -10, G
    jne [0x3039], 0x03df, $fail
    add [A*2], 12345, 0xFADE + A
    jne [0x0154], 0x2bc1, $fail
    add [12345], -123, 0xFADE + A
    jne [0x3039], 0xfb0d, $fail
    or [G], A, A*2
    jne [0x0155], 0x01fe, $fail
    shl [A*2], A*4 + B, A*2
    jne [0x0154], 0x3630, $fail
    add [12345], A*4 + B, 12345
    jne [0x3039], 0x339c, $fail
    and [A*4 + B], A, -123
    jne [0x0363], 0x0080, $fail
    xor [12345], A, -123
    jne [0x3039], 0xff2f, $fail
    and [A*2], G, 12345
    jne [0x0154], 0x0011, $fail
    and [A*4 + -10], G, A*4 + -10
    jne [0x029e], 0x0014, $fail
    mul [A*4 + -10], A*4 + B, A*4 + B
    jne [0x029e], 0x7849, $fail
    add [A], A*4 + -10, 12345
    jne [0x00aa], 0x32d7, $fail
    add [A*2], 12345, A*4 + -10
    jne [0x0154], 0x32d7, $fail
    xor [A*2], A*4 + -10, A*4 + -10
    jne [0x0154], 0x0000, $fail
    ishr [12345], A, A
    jne [0x3039], 0x0000, $fail
    ishr [12345], 12345, A*4 + -10
    jne [0x3039], 0x0000, $fail
    shl [A], -123, A*2
    jne [0x00aa], 0xf850, $fail
    and [12345], A*2, 0xFADE + A
    jne [0x3039], 0x0100, $fail
    or [A*4 + -10], -123, A
    jne [0x029e], 0xffaf, $fail
    imul [A*2], -123, A
    jne [0x0154], 0xae52, $fail
    mul [A*4 + B], A*4 + B, A*4 + B
    jne [0x0363], 0x7849, $fail
    sub [A*4 + B], A*4 + B, 12345
    jne [0x0363], 0xd32a, $fail
    and [G], -123, A*2
    jne [0x0155], 0x0104, $fail
    imul [A*2], 0xFADE + A, -123
    jne [0x0154], 0x25a8, $fail
    mul [A*2], A*2, 0xFADE + A
    jne [0x0154], 0x10a0, $fail
    sub [G], 12345, G
    jne [0x0155], 0x2ee4, $fail
    mov [A], -123
    jne [0x00aa], 0xff85, $fail
    mov [A*4 + -10], A*4 + -10
    jne [0x029e], 0x029e, $fail
    mov [A*2], A*4 + B
    jne [0x0154], 0x0363, $fail
    mov [12345], -123
    jne [0x3039], 0xff85, $fail
    mov [G], A*4 + -10
    jne [0x0155], 0x029e, $fail
    mov [12345], G
    jne [0x3039], 0x0155, $fail
    mov [G], A*2
    jne [0x0155], 0x0154, $fail
    mov [A*4 + -10], 0xFADE + A
    jne [0x029e], 0xfb88, $fail
    mov [12345], 12345
    jne [0x3039], 0x3039, $fail
    mov [A*4 + -10], G
    jne [0x029e], 0x0155, $fail
    mov [A], G
    jne [0x00aa], 0x0155, $fail
    mov [A*4 + B], A*4 + B
    jne [0x0363], 0x0363, $fail
    mov [A*4 + -10], A*4 + B
    jne [0x029e], 0x0363, $fail
    mov [A*4 + B], A
    jne [0x0363], 0x00aa, $fail
    mov [A*4 + -10], A
    jne [0x029e], 0x00aa, $fail
    mov [A], A
    jne [0x00aa], 0x00aa, $fail
    mov [A*4 + B], 0xFADE + A
    jne [0x0363], 0xfb88, $fail
    mov [A*2], -123
    jne [0x0154], 0xff85, $fail
    mov [A*4 + B], 12345
    jne [0x0363], 0x3039, $fail
    mov [A*4 + -10], -123
    jne [0x029e], 0xff85, $fail
    mov [A*4 + -10], A*2
    jne [0x029e], 0x0154, $fail
    mov [A*2], A*4 + -10
    jne [0x0154], 0x029e, $fail
    mov [12345], A*2
    jne [0x3039], 0x0154, $fail
    mov [A*2], G
    jne [0x0154], 0x0155, $fail
    mov [A*4 + B], G
    jne [0x0363], 0x0155, $fail
    mov [A*2], 0xFADE + A
    jne [0x0154], 0xfb88, $fail
    mov [A], A*4 + -10
    jne [0x00aa], 0x029e, $fail
    mov [12345], A*4 + -10
    jne [0x3039], 0x029e, $fail
    mov [A*4 + B], A*4 + -10
    jne [0x0363], 0x029e, $fail
    mov [12345], 0xFADE + A
    jne [0x3039], 0xfb88, $fail
    mov [A*2], 12345
    jne [0x0154], 0x3039, $fail
    mov [G], -123
    jne [0x0155], 0xff85, $fail
    mov [12345], A*4 + B
    jne [0x3039], 0x0363, $fail
    mov [G], 0xFADE + A
    jne [0x0155], 0xfb88, $fail
    mov [A], 12345
    jne [0x00aa], 0x3039, $fail
    mov [A], A*2
    jne [0x00aa], 0x0154, $fail
    mov [A*4 + -10], 12345
    jne [0x029e], 0x3039, $fail
    mov [G], A
    jne [0x0155], 0x00aa, $fail
    mov [A*2], A
    jne [0x0154], 0x00aa, $fail
    mov [G], G
    jne [0x0155], 0x0155, $fail
    mov [A], A*4 + B
    jne [0x00aa], 0x0363, $fail
    mov [A*4 + B], -123
    jne [0x0363], 0xff85, $fail
    mov [A*4 + B], A*2
    jne [0x0363], 0x0154, $fail
    mov [12345], A
    jne [0x3039], 0x00aa, $fail
    mov [G], 12345
    jne [0x0155], 0x3039, $fail
    mov [A*2], A*2
    jne [0x0154], 0x0154, $fail
    mov [G], A*4 + B
    jne [0x0155], 0x0363, $fail
    mov [A], 0xFADE + A
    jne [0x00aa], 0xfb88, $fail
    push A*4 + B
    pop D
    jne D, 0x0363, $fail
    push -123
    pop D
    jne D, 0xff85, $fail
    push G
    pop D
    jne D, 0x0155, $fail
    push A*4 + -10
    pop D
    jne D, 0x029e, $fail
    push A
    pop D
    jne D, 0x00aa, $fail
    push 0xFADE + A
    pop D
    jne D, 0xfb88, $fail
    push A*2
    pop D
    jne D, 0x0154, $fail
    push 12345
    pop D
    jne D, 0x3039, $fail
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
    mov A, 123
    jne A, 123, $fail
    jeq A, 123, $_test_uop_jmp_3dd_okay
    jmp $fail
    _test_uop_jmp_3dd_okay:
    jne A, 123, $fail

test_uop_jmp_3di:
    mov A, 123
    mov [100], 321
    jeq A, [100], $fail
    jne A, [100], $test_uop_jmp_3di_okay
    jmp $fail
    test_uop_jmp_3di_okay:
    jne A, 123, $fail
    jne [100], 321, $fail

test_uop_jmp_3id:
    mov A, 123
    mov [100], 321
    jeq [100], A, $fail
    jne [100], A, $_test_uop_jmp_3id_okay
    jmp $fail
    _test_uop_jmp_3id_okay:
    jne A, 123, $fail
    jne [100], 321, $fail

test_uop_jmp_3ii:
    mov [200], 123
    mov [100], 321
    jeq [100], [200], $fail
    jne [100], [200], $_test_uop_jmp_3ii_okay
    jmp $fail
    _test_uop_jmp_3ii_okay:
    jne [200], 123, $fail
    jne [100], 321, $fail

test_uop_mov_dd:
    mov A, 123
    jne A, 123, $fail

test_uop_mov_di:
    mov [100], 0xFFDA
    mov A, [100]
    jne A, 0xFFDA, $fail

test_uop_mov_id:
    mov [100], 0xFFFF
    jne [100], 0xFFFF, $fail

test_uop_mov_ii:
    mov A, 20
    mov [120], 0xFDFA
    mov [100], [100+A]
    jne [100], 0xFDFA, $fail

test_uop_bmov_dd:
    bmov A, 0xAFDE
    jne A, 0xDE, $fail
    bmov A, 0xFA
    jne A, 0xFA, $fail

test_uop_bmov_di:
    mov [100], 0xFFDA
    bmov A, [100]
    jne A, 0xDA, $fail

test_uop_bmov_id:
    mov [100], 0xABCD
    mov [102], 0x1234
    mov [104], 0x5678
    bmov [102], 0xDF
    jne [100], 0xABCD, $fail
    jne [102], 0x12DF, $fail
    jne [104], 0x5678, $fail
    bmov [103], 0xB8
    jne [100], 0xABCD, $fail
    jne [102], 0xB8DF, $fail
    jne [104], 0x5678, $fail

test_uop_bmov_ii:
    mov [300], 0xDF
    mov [302], 0xB8

    mov [200], 0xABCD
    mov [202], 0x1234
    mov [204], 0x5678
    bmov [202], [300]
    jne [200], 0xABCD, $fail
    jne [202], 0x12DF, $fail
    jne [204], 0x5678, $fail
    jne [300], 0xDF, $fail
    jne [302], 0xB8, $fail
    bmov [203], [302]
    jne [200], 0xABCD, $fail
    jne [202], 0xB8DF, $fail
    jne [204], 0x5678, $fail
    jne [300], 0xDF, $fail
    jne [302], 0xB8, $fail


test_uop_halt:
    # Can't test!

test_uop_getf: # getf does not support indirection
    cmp 123, 45
    getf A
    jne A, 0b110010, $fail

test_uop_setf: # setf does not support indirection
    setf 0xFFFF
    getf A
    jne A, 0x3F, $fail # masked only 6 bits

test_uop_call_d:
    mov SP, 0x1000
    mov B, $_L_test_uop_call_d_fn
    call B
    jne B, $_L_test_uop_call_d_fn, $fail
    jne A, 0x34FA, $fail
    jmp $_L_test_uop_call_d_okay
    _L_test_uop_call_d_fn:
    mov A, 0x34FA
    ret
    _L_test_uop_call_d_okay:

test_uop_call_i:
    mov SP, 0x1000
    mov B, 100
    mov [B], $_L_test_uop_call_i_fn
    call [B]
    jne [B], $_L_test_uop_call_i_fn, $fail
    jne A, 0xAAD4, $fail
    jmp $_L_test_uop_call_i_okay
    _L_test_uop_call_i_fn:
    mov A, 0xAAD4
    ret
    _L_test_uop_call_i_okay:

test_uop_ret:
    # already tested above

test_uop_push_d:
    mov SP, 0x1000
    mov B, 100
    push B
    jne SP, 0xFFE, $fail
    jne [0xFFE], 100, $fail
    pop C
    jne C, 100, $fail

test_uop_push_i:
    mov SP, 0x1000
    mov B, 100
    mov [B], 400
    push [B]
    jne SP, 0xFFE, $fail
    jne [0xFFE], 400, $fail
    pop C
    jne C, 400, $fail

test_uop_pop_d:
    mov SP, 0x1000
    push 0xFADA
    pop A
    jne A, 0xFADA, $fail

test_uop_pop_i:
    mov SP, 0x1000
    push 0xF2DA
    pop [100]
    jne [100], 0xF2DA, $fail

test_uop_mmap:
    # mmap/umap does not support indirection
    mov [0x3000], 0xFF00
    mov [0x3100], 0xFF01
    mov [0x3200], 0xFF02

    mov [0x4000], 0xDD00
    mov [0x4100], 0xDD01
    mov [0x4200], 0xDD02

    mov [0x5000], 0xEE00
    mov [0x5100], 0xEE01
    mov [0x5200], 0xEE02

    mov A, 0
    mov B, 0x4100
    mmap  0x3100, 0x32FF, 1 # start, end, idx
    jne [0x3100], 0xDD01, $fail
    jne [0x3200], 0xDD02, $fail
    jne [0x3000], 0xFF00, $fail

    mov B, 0x5100
    mmap  0x3200, 0x32FF, 2 # higher priority
    jne [0x3200], 0xEE01, $fail
    jne [0x3000], 0xFF00, $fail
    jne [0x3100], 0xDD01, $fail

    umap 1
    jne [0x3100], 0xFF01, $fail
    jne [0x3200], 0xEE01, $fail
    jne [0x3000], 0xFF00, $fail

    umap 2
    jne [0x3000], 0xFF00, $fail
    jne [0x3100], 0xFF01, $fail
    jne [0x3200], 0xFF02, $fail

test_uop_umap:
    # done above
# END test_uop_rom.asm


# BEGIN test_aux_regs.asm
test_aux_reg:
    mov A, 1
    mov B, 2
    mov C, 3
    mov D, 4

    mov E, 5
    mov F, 6
    mov G, 7
    mov H, 8

    jne A, 1, $fail
    jne B, 2, $fail
    jne C, 3, $fail
    jne D, 4, $fail

    jne E, 5, $fail
    jne F, 6, $fail
    jne G, 7, $fail
    jne H, 8, $fail

    xor H, 0xFF00
    jne H, 0xFF08, $fail
    mov A, H
    jne A, 0xFF08, $fail
    mov E, G
    jne E, 7, $fail
    jne H, 0xFF08, $fail
# END test_aux_regs.asm


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



test_cmp_direct:
    # unsigned
    mov C, 0xFFAB
    mov D, 0x2B
    cmp C, D
    getf A
    # GE GT LE LT NE EQ
    jne A, 0b110010, $fail

    cmp D, C
    getf A
    jne A, 0b001110, $fail

    cmp C, C
    getf A
    jne A, 0b101001, $fail

    # signed
    icmp C, D
    getf A
    # GE GT LE LT NE EQ
    jne A, 0b001110, $fail

    icmp D, C
    getf A
    jne A, 0b110010, $fail

    icmp C, C
    getf A
    jne A, 0b101001, $fail
# END test_cmp.asm

end_of_test:
    mov A, 0xDEAD
    mov B, 0xBEEF
    mul C, A, B
    jmp $success
