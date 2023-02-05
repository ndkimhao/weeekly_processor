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
    # phy=A:B, idx=E, start=F, end=G
    con H, 1
    mov E, H
    mov F, 0
    con G, 0xFFFF
    mmu # idx=1, 0000-FFFF to 0000-FFFF

    mov G, 0
    alu E, H, ADD
    mmu # idx=1

    con A, 0xFF # and B = 0
    con F, 0x8000
    con G, 0xFFFF
    alu E, H, ADD
    mmu # idx=2

    mov A, 0
    mov F, 0
    mov G, 0
    alu E, H, ADD
    mmu # idx=3

    nop # wait 1 cycle to write MMU config

    # --------------------
    # reset Fetcher
    mov PC, 0
    con PC, 0x8000

# ======================================
# ALU ops
alu2_dd:
    con A,  0xCA
    mov B, 2
    mov C, 2
    mov D, 2
    mov E, 2
alu2_di:
    con A,  1
alu2_id:
    con A,  1
alu2_ii:
    con A,  1

alu3_dd:
    mov A,  0
alu3_di:
    mov A,  0
alu3_id:
    mov A,  0
alu3_ii:
    mov A,  0

# ======================================
# Misc
halt:
    mov PC, PC
