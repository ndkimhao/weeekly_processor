.offset 0xD000
.boot:
    mov A, 0xFFFA
    jne A, 0x00FA, $start_test
fail:
    # register A contains failed test
    halt
    jmp $fail
success:
    mov A, 0xAB
    mov B, 0xCD
    mov C, 0xEF
    mov D, 0x55
    halt
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
    jmp $success

# BEGIN drive_led.asm
drive_led:
    mov A, 0xCC
    mov C, 0
drive_led_loop:
    mov B, 0
    drive_led_inner_loop:
        add B, 1
        jne B, 0xFFFF, $drive_led_inner_loop

    add C, 1
    shr A, C, 4
    jmp $drive_led_loop
# END drive_led.asm

