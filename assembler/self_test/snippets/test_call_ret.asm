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

fn_test_target:
    jne SP, 0x0ffe, $fail
    ret
    jmp $fail
