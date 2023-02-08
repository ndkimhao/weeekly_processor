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
