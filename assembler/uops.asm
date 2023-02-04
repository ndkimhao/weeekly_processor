    NULL # dummy instruction at index 0 & 1
    NULL, FALLTHROUGH
# ======================================
# pre-boot code
reset:
    # --------------------
    # reset arch registers
    MOV A,  0
    MOV B,  0
    MOV C,  0
    MOV D,  0
    MOV SP, 0
    CON PC, 0xFFF0
    MOV FL, 0

    # --------------------
    # reset MMU
    CON H, 1
    MOV F, 0
    MOV G, 0
    ALU G, H, SUB

    MOV E, 0
    MMU # phy=A:B, idx=E, start=F, end=G

    MOV G, 0
    ALU E, H, ADD
    MMU # idx=1

    ALU E, H, ADD
    MMU # idx=2

    ALU E, H, ADD
    MMU # idx=3

alu2_ii:
    MOV A,  0
alu2_ir:
    MOV A,  0

    CON B, 0xFFEE
