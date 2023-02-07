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

