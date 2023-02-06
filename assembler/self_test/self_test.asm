.offset 0xD000
.boot:
    jmp $start_test
    halt
fail:
    # A register contains failed test
    halt
success:
    mov A, 0xAB
    mov B, 0xCD
    mov C, 0xEF
    mov D, 0x55
    halt
start_test:
     # t=3, a=d230, b=a012
    add B, 0xd230, 0xa012
    mov A, 0x0001 # test_1
    jne $fail, B, 0x7242
    sub B, 0xd230, 0xa012
    mov A, 0x0002 # test_2
    jne $fail, B, 0x321e
    mul B, 0xd230, 0xa012
    mov A, 0x0003 # test_3
    jne $fail, B, 0xc760
    jne $fail, D, 0x836c
    imul B, 0xd230, 0xa012
    mov A, 0x0004 # test_4
    jne $fail, B, 0xc760
    jne $fail, D, 0x112a
    shr B, 0xd230, 0xa012
    mov A, 0x0005 # test_5
    jne $fail, B, 0x348c
    ishr B, 0xd230, 0xa012
    mov A, 0x0006 # test_6
    jne $fail, B, 0xf48c
     # t=3, a=00ad, b=da37
    add B, 0x00ad, 0xda37
    mov A, 0x0007 # test_7
    jne $fail, B, 0xdae4
    sub B, 0x00ad, 0xda37
    mov A, 0x0008 # test_8
    jne $fail, B, 0x2676
    mul B, 0x00ad, 0xda37
    mov A, 0x0009 # test_9
    jne $fail, B, 0x772b
    jne $fail, D, 0x0093
    imul B, 0x00ad, 0xda37
    mov A, 0x000a # test_10
    jne $fail, B, 0x772b
    jne $fail, D, 0xffe6
    shr B, 0x00ad, 0xda37
    mov A, 0x000b # test_11
    jne $fail, B, 0x0001
    ishr B, 0x00ad, 0xda37
    mov A, 0x000c # test_12
    jne $fail, B, 0x0001
     # t=2, a=f0ad, b=2a3f
    mov B, 0xf0ad
    add B, 0x2a3f
    mov A, 0x000d # test_13
    jne $fail, B, 0x1aec
    mov B, 0xf0ad
    sub B, 0x2a3f
    mov A, 0x000e # test_14
    jne $fail, B, 0xc66e
    mov B, 0xf0ad
    mul B, 0x2a3f
    mov A, 0x000f # test_15
    jne $fail, B, 0x9c93
    jne $fail, D, 0x27b7
    mov B, 0xf0ad
    imul B, 0x2a3f
    mov A, 0x0010 # test_16
    jne $fail, B, 0x9c93
    jne $fail, D, 0xfd78
    mov B, 0xf0ad
    shr B, 0x2a3f
    mov A, 0x0011 # test_17
    jne $fail, B, 0x0001
    mov B, 0xf0ad
    ishr B, 0x2a3f
    mov A, 0x0012 # test_18
    jne $fail, B, 0xffff
end_of_test::
    jmp $success
