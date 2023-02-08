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
