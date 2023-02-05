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
.generate 1dx, 1ix, 2dd, 2di, 2id, 2ii, 3dd, 3di, 3id, 3ii
alu_$$:
    ([12]i-) arg K, GET_0
    ([12]i-) mem X, K, LOAD
    ([12]d-) arg X, GET_0

    (1--) alu X, 0, OP_COPY
    (1d-) arg X, PUT
    (1i-) mem K, X, STORE

    ([23]--) arg Y, GET_1
    ([23]-i) mem Y, Y, LOAD

    (2--) alu X, Y, OP_COPY
    (2d-) arg X, PUT
    (2i-) mem K, X, STORE

    (3--) arg Z, GET_2
    (3--) alu Y, Z, OP_COPY
    (3d-) arg Y, PUT
    (3i-) mem K, Y, STORE
.end_generate

# ======================================
# CMP
.generate dd, di, id, ii
cmp_$$:
    (--) arg X, GET_0
    (i-) mem X, X, LOAD
    (--) arg Y, GET_1
    (-i) mem Y, Y, LOAD
    (--) cmp X, Y, OP_COPY
.end_generate

# ======================================
# JMP
jmp_d:
    arg PC, GET_0

jmp_i:
    arg X, GET_0
    mem X, X, LOAD
    mov PC, X

.generate dd, di, id, ii
jmp_3$$:
    (--) arg K, GET_0
    (i-) mem K, K, LOAD

    (--) arg X, GET_1
    (i-) mem X, X, LOAD
    (--) arg Y, GET_2
    (--) cmp X, Y, OP_COPY

    (--) cmv PC, K, COND_COPY
.end_generate

# ======================================
# MOV
.generate dd, di, id, ii
mov_$$:
    (--) arg Y, GET_1
    (-i) mem Y, Y, LOAD
    (d-) arg Y, PUT
    (i-) arg X, GET_0
    (i-) mem X, Y, STORE
.end_generate

# ======================================
# Others
halt:
    mov PC, PC

getf:
    arg FL, PUT

setf:
    arg FL, GET_0
    con X, 0x3F # 6 bits
    alu FL, X, AND

.generate d, i
call_$$:
    (-) arg X, GET_0
    (i) mem X, X, LOAD
    (-) alu SP, 2, SUB
    (-) mem SP, PC, STORE
    (-) mov PC, X
.end_generate

ret:
    mem X, SP, LOAD
    alu SP, 2, ADD
    mov PC, X

.generate d, i
push_$$:
    (-) arg X, GET_0
    (i) mem X, X, LOAD
    (-) alu SP, 2, SUB
    (-) mem SP, PC, STORE
.end_generate

.generate d, i
pop_$$:
    (-) mem Y, SP, LOAD
    (-) alu SP, 2, ADD
    (d) arg Y, PUT
    (i) arg X, GET_0
    (i) mem X, Y, STORE
.end_generate

.generate dd, di, id, ii
mmap_$$: # start, end, slot_idx / Y, Z, X
    (--) arg, Y, GET_0
    (i-) mem, Y, Y, LOAD
    (--) arg, Z, GET_1
    (i-) mem, Z, Z, LOAD
    (--) arg X, GET_2
    (--) mmu
.end_generate

.generate d, i
umap_$$:
    (-) arg, X, GET_0
    (i) mem, X, X, LOAD
    (-) mov Y, 0
    (-) mov Z, 0
    (-) mmu
.end_generate
