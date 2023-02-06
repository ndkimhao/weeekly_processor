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
     # t=True, a=d230, b=a012
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

    shl B, 0xd230, 0xa012
    mov A, 0x0007 # test_7
    jne $fail, B, 0x48c0

    and B, 0xd230, 0xa012
    mov A, 0x0008 # test_8
    jne $fail, B, 0x8010

    or B, 0xd230, 0xa012
    mov A, 0x0009 # test_9
    jne $fail, B, 0xf232

    xor B, 0xd230, 0xa012
    mov A, 0x000a # test_10
    jne $fail, B, 0x7222

    neg B, 0xd230
    mov A, 0x000b # test_11
    jne $fail, B, 0x2dd0

    not B, 0xd230
    mov A, 0x000c # test_12
    jne $fail, B, 0x2dcf

    bool B, 0xd230
    mov A, 0x000d # test_13
    jne $fail, B, 0x0001

    inc B, 0xd230
    mov A, 0x000e # test_14
    jne $fail, B, 0xd231

    dec B, 0xd230
    mov A, 0x000f # test_15
    jne $fail, B, 0xd22f

     # t=True, a=00ad, b=da37
    add B, 0x00ad, 0xda37
    mov A, 0x0010 # test_16
    jne $fail, B, 0xdae4

    sub B, 0x00ad, 0xda37
    mov A, 0x0011 # test_17
    jne $fail, B, 0x2676

    mul B, 0x00ad, 0xda37
    mov A, 0x0012 # test_18
    jne $fail, B, 0x772b
    jne $fail, D, 0x0093

    imul B, 0x00ad, 0xda37
    mov A, 0x0013 # test_19
    jne $fail, B, 0x772b
    jne $fail, D, 0xffe6

    shr B, 0x00ad, 0xda37
    mov A, 0x0014 # test_20
    jne $fail, B, 0x0001

    ishr B, 0x00ad, 0xda37
    mov A, 0x0015 # test_21
    jne $fail, B, 0x0001

    shl B, 0x00ad, 0xda37
    mov A, 0x0016 # test_22
    jne $fail, B, 0x5680

    and B, 0x00ad, 0xda37
    mov A, 0x0017 # test_23
    jne $fail, B, 0x0025

    or B, 0x00ad, 0xda37
    mov A, 0x0018 # test_24
    jne $fail, B, 0xdabf

    xor B, 0x00ad, 0xda37
    mov A, 0x0019 # test_25
    jne $fail, B, 0xda9a

    neg B, 0x00ad
    mov A, 0x001a # test_26
    jne $fail, B, 0xff53

    not B, 0x00ad
    mov A, 0x001b # test_27
    jne $fail, B, 0xff52

    bool B, 0x00ad
    mov A, 0x001c # test_28
    jne $fail, B, 0x0001

    inc B, 0x00ad
    mov A, 0x001d # test_29
    jne $fail, B, 0x00ae

    dec B, 0x00ad
    mov A, 0x001e # test_30
    jne $fail, B, 0x00ac

     # t=False, a=f0ad, b=2a3f
    mov B, 0xf0ad
    add B, 0x2a3f
    mov A, 0x001f # test_31
    jne $fail, B, 0x1aec

    mov B, 0xf0ad
    sub B, 0x2a3f
    mov A, 0x0020 # test_32
    jne $fail, B, 0xc66e

    mov B, 0xf0ad
    mul B, 0x2a3f
    mov A, 0x0021 # test_33
    jne $fail, B, 0x9c93
    jne $fail, D, 0x27b7

    mov B, 0xf0ad
    imul B, 0x2a3f
    mov A, 0x0022 # test_34
    jne $fail, B, 0x9c93
    jne $fail, D, 0xfd78

    mov B, 0xf0ad
    shr B, 0x2a3f
    mov A, 0x0023 # test_35
    jne $fail, B, 0x0001

    mov B, 0xf0ad
    ishr B, 0x2a3f
    mov A, 0x0024 # test_36
    jne $fail, B, 0xffff

    mov B, 0xf0ad
    shl B, 0x2a3f
    mov A, 0x0025 # test_37
    jne $fail, B, 0x8000

    mov B, 0xf0ad
    and B, 0x2a3f
    mov A, 0x0026 # test_38
    jne $fail, B, 0x202d

    mov B, 0xf0ad
    or B, 0x2a3f
    mov A, 0x0027 # test_39
    jne $fail, B, 0xfabf

    mov B, 0xf0ad
    xor B, 0x2a3f
    mov A, 0x0028 # test_40
    jne $fail, B, 0xda92

    mov B, 0xf0ad
    neg B
    mov A, 0x0029 # test_41
    jne $fail, B, 0x0f53

    mov B, 0xf0ad
    not B
    mov A, 0x002a # test_42
    jne $fail, B, 0x0f52

    mov B, 0xf0ad
    bool B
    mov A, 0x002b # test_43
    jne $fail, B, 0x0001

    mov B, 0xf0ad
    inc B
    mov A, 0x002c # test_44
    jne $fail, B, 0xf0ae

    mov B, 0xf0ad
    dec B
    mov A, 0x002d # test_45
    jne $fail, B, 0xf0ac

     # t=False, a=0000, b=dead
    mov B, 0x0000
    add B, 0xdead
    mov A, 0x002e # test_46
    jne $fail, B, 0xdead

    mov B, 0x0000
    sub B, 0xdead
    mov A, 0x002f # test_47
    jne $fail, B, 0x2153

    mov B, 0x0000
    mul B, 0xdead
    mov A, 0x0030 # test_48
    jne $fail, B, 0x0000
    jne $fail, D, 0x0000

    mov B, 0x0000
    imul B, 0xdead
    mov A, 0x0031 # test_49
    jne $fail, B, 0x0000
    jne $fail, D, 0x0000

    mov B, 0x0000
    shr B, 0xdead
    mov A, 0x0032 # test_50
    jne $fail, B, 0x0000

    mov B, 0x0000
    ishr B, 0xdead
    mov A, 0x0033 # test_51
    jne $fail, B, 0x0000

    mov B, 0x0000
    shl B, 0xdead
    mov A, 0x0034 # test_52
    jne $fail, B, 0x0000

    mov B, 0x0000
    and B, 0xdead
    mov A, 0x0035 # test_53
    jne $fail, B, 0x0000

    mov B, 0x0000
    or B, 0xdead
    mov A, 0x0036 # test_54
    jne $fail, B, 0xdead

    mov B, 0x0000
    xor B, 0xdead
    mov A, 0x0037 # test_55
    jne $fail, B, 0xdead

    mov B, 0x0000
    neg B
    mov A, 0x0038 # test_56
    jne $fail, B, 0x0000

    mov B, 0x0000
    not B
    mov A, 0x0039 # test_57
    jne $fail, B, 0xffff

    mov B, 0x0000
    bool B
    mov A, 0x003a # test_58
    jne $fail, B, 0x0000

    mov B, 0x0000
    inc B
    mov A, 0x003b # test_59
    jne $fail, B, 0x0001

    mov B, 0x0000
    dec B
    mov A, 0x003c # test_60
    jne $fail, B, 0xffff

end_of_test::
    jmp $success
