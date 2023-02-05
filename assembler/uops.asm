    nop # dummy instruction at index 0 & 1
    nop, !FALLTHROUGH

# ======================================
# pre-boot code
reset:
    # --------------------
    # reset arch registers
    mov A,  0
    mov B,  0
    mov C,  0
    mov D,  0
    mov SP, 0
    mov PC, 0
    mov FL, 0

    # --------------------
    # reset MMU
    # phy=A:B, idx=X, start=Y, end=Z
    con K, 1
    mov X, K
    mov Y, 0
    con Z, 0xFFFF
    mmu # idx=1, 0000-FFFF to 0000-FFFF

    mov Z, 0
    alu X, K, ADD
    mmu # idx=1

    con A, 0xFF # and B = 0
    con Y, 0x8000
    con Z, 0xFFFF
    alu X, K, ADD
    mmu # idx=2

    mov A, 0
    mov Y, 0
    mov Z, 0
    alu X, K, ADD
    mmu # idx=3

    nop # wait 1 cycle to write MMU config

    # --------------------
    # reset Fetcher
    mov PC, 0
    con PC, 0x8000

# ======================================
# ALU
alu2_dd:
    arg X, GET_0
    arg Y, GET_1
    alu X, Y, OP_COPY
    arg X, PUT

alu2_di:
    arg X, GET_0
    arg Y, GET_1
    mem Y, Y, LOAD
    alu X, Y, OP_COPY
    arg X, PUT

alu2_id:
    arg X, GET_0
    arg Y, GET_1
    mem K, X, LOAD
    alu K, Y, OP_COPY
    mem X, K, STORE

alu2_ii:
    arg X, GET_0
    arg Y, GET_1
    mem K, X, LOAD
    mem Y, Y, LOAD
    alu K, Y, OP_COPY
    mem X, K, STORE

alu3_dd:
    arg X, GET_1
    arg Y, GET_2
    alu X, Y, OP_COPY
    arg X, PUT

alu3_di:
    arg X, GET_1
    arg Y, GET_2
    mem X, X, LOAD
    alu X, Y, OP_COPY
    arg X, PUT

alu3_id:
    arg Z, GET_0
    arg X, GET_1
    arg Y, GET_2
    alu X, Y, OP_COPY
    mem Z, X, STORE

alu3_ii:
    arg Z, GET_0
    arg X, GET_1
    arg Y, GET_2
    mem X, X, LOAD
    alu X, Y, OP_COPY
    mem Z, X, STORE

# ======================================
# JMP
jmp_d:
    arg PC, GET_0

jmp_i:
    arg X, GET_0
    mem X, X, LOAD
    mov PC, X

# ======================================
# MOV
mov_dd:
    arg Y, GET_1
    arg Y, PUT

mov_di:
    arg Y, GET_1
    mem Y, Y, LOAD
    arg Y, PUT

mov_id:
    arg X, GET_0
    arg Y, GET_1
    mem X, Y, STORE

mov_ii:
    arg X, GET_0
    arg Y, GET_1
    mem Y, Y, LOAD
    mem X, Y, STORE

halt:
    mov PC, PC
