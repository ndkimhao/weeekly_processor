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
