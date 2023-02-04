    NULL # dummy instruction at index 0 & 1
    NULL, FALLTHROUGH

reset:
    # reset arch registers
    MOV A,  0
    MOV B,  0
    MOV C,  0
    MOV D,  0
    MOV SP, 0
    MOV FL, 0

    MOV PC, 0
    ALU PC, 2, SUB
    ALU PC, 2, SUB # reset vector PC=0xFFFB

    # reset MMU
    MOV F, 0
    MOV G, 0
    ALU G, 1, SUB

    MOV E, 0
    MMU # phy=A:B, idx=E, start=F, end=G

    MOV G, 0
    ALU E, 1, ADD
    MMU # idx=1

    ALU E, 1, ADD
    MMU # idx=2

    ALU E, 1, ADD
    MMU # idx=3

alu2_ii:
    MOV A,  0
alu2_ir:
    MOV A,  0
