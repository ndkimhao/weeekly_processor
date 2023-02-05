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
    con H, 1
    mov F, 0
    mov G, 0
    alu G, H, SUB

    mov E, 0
    mmu # phy=A:B, idx=E, start=F, end=G

    mov G, 0
    alu E, H, ADD
    mmu # idx=1

    alu E, H, ADD
    mmu # idx=2

    alu E, H, ADD
    mmu # idx=3

    nop # wait 1 cycle to write MMU config

    # --------------------
    # reset Fetcher
    mov PC, 0
    con PC, 0xFFF0

alu2_ii:
    mov A,  0, !FALLTHROUGH
alu2_ir:
    mov A,  0
