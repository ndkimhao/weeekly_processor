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
     # t=True, a=d230, b=a012
    add B, 0xd230, 0xa012
    mov A, 0x0001 # test_1
    jne B, 0x7242, $fail

    sub B, 0xd230, 0xa012
    mov A, 0x0002 # test_2
    jne B, 0x321e, $fail

    mul B, 0xd230, 0xa012
    mov A, 0x0003 # test_3
    jne B, 0xc760, $fail
    jne D, 0x836c, $fail

    imul B, 0xd230, 0xa012
    mov A, 0x0004 # test_4
    jne B, 0xc760, $fail
    jne D, 0x112a, $fail

    shr B, 0xd230, 0xa012
    mov A, 0x0005 # test_5
    jne B, 0x348c, $fail

    ishr B, 0xd230, 0xa012
    mov A, 0x0006 # test_6
    jne B, 0xf48c, $fail

    shl B, 0xd230, 0xa012
    mov A, 0x0007 # test_7
    jne B, 0x48c0, $fail

    and B, 0xd230, 0xa012
    mov A, 0x0008 # test_8
    jne B, 0x8010, $fail

    or B, 0xd230, 0xa012
    mov A, 0x0009 # test_9
    jne B, 0xf232, $fail

    xor B, 0xd230, 0xa012
    mov A, 0x000a # test_10
    jne B, 0x7222, $fail

    neg B, 0xd230
    mov A, 0x000b # test_11
    jne B, 0x2dd0, $fail

    not B, 0xd230
    mov A, 0x000c # test_12
    jne B, 0x2dcf, $fail

    bool B, 0xd230
    mov A, 0x000d # test_13
    jne B, 0x0001, $fail

    inc B, 0xd230
    mov A, 0x000e # test_14
    jne B, 0xd231, $fail

    dec B, 0xd230
    mov A, 0x000f # test_15
    jne B, 0xd22f, $fail

     # t=True, a=00ad, b=da37
    add B, 0x00ad, 0xda37
    mov A, 0x0010 # test_16
    jne B, 0xdae4, $fail

    sub B, 0x00ad, 0xda37
    mov A, 0x0011 # test_17
    jne B, 0x2676, $fail

    mul B, 0x00ad, 0xda37
    mov A, 0x0012 # test_18
    jne B, 0x772b, $fail
    jne D, 0x0093, $fail

    imul B, 0x00ad, 0xda37
    mov A, 0x0013 # test_19
    jne B, 0x772b, $fail
    jne D, 0xffe6, $fail

    shr B, 0x00ad, 0xda37
    mov A, 0x0014 # test_20
    jne B, 0x0001, $fail

    ishr B, 0x00ad, 0xda37
    mov A, 0x0015 # test_21
    jne B, 0x0001, $fail

    shl B, 0x00ad, 0xda37
    mov A, 0x0016 # test_22
    jne B, 0x5680, $fail

    and B, 0x00ad, 0xda37
    mov A, 0x0017 # test_23
    jne B, 0x0025, $fail

    or B, 0x00ad, 0xda37
    mov A, 0x0018 # test_24
    jne B, 0xdabf, $fail

    xor B, 0x00ad, 0xda37
    mov A, 0x0019 # test_25
    jne B, 0xda9a, $fail

    neg B, 0x00ad
    mov A, 0x001a # test_26
    jne B, 0xff53, $fail

    not B, 0x00ad
    mov A, 0x001b # test_27
    jne B, 0xff52, $fail

    bool B, 0x00ad
    mov A, 0x001c # test_28
    jne B, 0x0001, $fail

    inc B, 0x00ad
    mov A, 0x001d # test_29
    jne B, 0x00ae, $fail

    dec B, 0x00ad
    mov A, 0x001e # test_30
    jne B, 0x00ac, $fail

     # t=False, a=f0ad, b=2a3f
    mov B, 0xf0ad
    add B, 0x2a3f
    mov A, 0x001f # test_31
    jne B, 0x1aec, $fail

    mov B, 0xf0ad
    sub B, 0x2a3f
    mov A, 0x0020 # test_32
    jne B, 0xc66e, $fail

    mov B, 0xf0ad
    mul B, 0x2a3f
    mov A, 0x0021 # test_33
    jne B, 0x9c93, $fail
    jne D, 0x27b7, $fail

    mov B, 0xf0ad
    imul B, 0x2a3f
    mov A, 0x0022 # test_34
    jne B, 0x9c93, $fail
    jne D, 0xfd78, $fail

    mov B, 0xf0ad
    shr B, 0x2a3f
    mov A, 0x0023 # test_35
    jne B, 0x0001, $fail

    mov B, 0xf0ad
    ishr B, 0x2a3f
    mov A, 0x0024 # test_36
    jne B, 0xffff, $fail

    mov B, 0xf0ad
    shl B, 0x2a3f
    mov A, 0x0025 # test_37
    jne B, 0x8000, $fail

    mov B, 0xf0ad
    and B, 0x2a3f
    mov A, 0x0026 # test_38
    jne B, 0x202d, $fail

    mov B, 0xf0ad
    or B, 0x2a3f
    mov A, 0x0027 # test_39
    jne B, 0xfabf, $fail

    mov B, 0xf0ad
    xor B, 0x2a3f
    mov A, 0x0028 # test_40
    jne B, 0xda92, $fail

    mov B, 0xf0ad
    neg B
    mov A, 0x0029 # test_41
    jne B, 0x0f53, $fail

    mov B, 0xf0ad
    not B
    mov A, 0x002a # test_42
    jne B, 0x0f52, $fail

    mov B, 0xf0ad
    bool B
    mov A, 0x002b # test_43
    jne B, 0x0001, $fail

    mov B, 0xf0ad
    inc B
    mov A, 0x002c # test_44
    jne B, 0xf0ae, $fail

    mov B, 0xf0ad
    dec B
    mov A, 0x002d # test_45
    jne B, 0xf0ac, $fail

     # t=False, a=0000, b=dead
    mov B, 0x0000
    add B, 0xdead
    mov A, 0x002e # test_46
    jne B, 0xdead, $fail

    mov B, 0x0000
    sub B, 0xdead
    mov A, 0x002f # test_47
    jne B, 0x2153, $fail

    mov B, 0x0000
    mul B, 0xdead
    mov A, 0x0030 # test_48
    jne B, 0x0000, $fail
    jne D, 0x0000, $fail

    mov B, 0x0000
    imul B, 0xdead
    mov A, 0x0031 # test_49
    jne B, 0x0000, $fail
    jne D, 0x0000, $fail

    mov B, 0x0000
    shr B, 0xdead
    mov A, 0x0032 # test_50
    jne B, 0x0000, $fail

    mov B, 0x0000
    ishr B, 0xdead
    mov A, 0x0033 # test_51
    jne B, 0x0000, $fail

    mov B, 0x0000
    shl B, 0xdead
    mov A, 0x0034 # test_52
    jne B, 0x0000, $fail

    mov B, 0x0000
    and B, 0xdead
    mov A, 0x0035 # test_53
    jne B, 0x0000, $fail

    mov B, 0x0000
    or B, 0xdead
    mov A, 0x0036 # test_54
    jne B, 0xdead, $fail

    mov B, 0x0000
    xor B, 0xdead
    mov A, 0x0037 # test_55
    jne B, 0xdead, $fail

    mov B, 0x0000
    neg B
    mov A, 0x0038 # test_56
    jne B, 0x0000, $fail

    mov B, 0x0000
    not B
    mov A, 0x0039 # test_57
    jne B, 0xffff, $fail

    mov B, 0x0000
    bool B
    mov A, 0x003a # test_58
    jne B, 0x0000, $fail

    mov B, 0x0000
    inc B
    mov A, 0x003b # test_59
    jne B, 0x0001, $fail

    mov B, 0x0000
    dec B
    mov A, 0x003c # test_60
    jne B, 0xffff, $fail

test_call_ret:

    mov SP, 0x1000
    mov A, 10
    mov B, 0
    mov C, 0
    mov D, 0
    call $fn_recursive

    jne A, 0, $fail
    jne B, 0xcf3f, $fail
    jne C, 0x002d, $fail
    jne D, 0x4597, $fail

    jmp $success

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

end_of_test::
    jmp $success
