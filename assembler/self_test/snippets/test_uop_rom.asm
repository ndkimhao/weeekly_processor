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
