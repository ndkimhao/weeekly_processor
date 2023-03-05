from mondayasm import *

# Caller save: H
# Callee save: A, B, C, D, SP, E, F, G
#   Arg passing: A -> H
#   Return: H (optionally G, F, E)

###

DEV_ADDR = 0xFF00
M_PS2_RECV = M[DEV_ADDR + 0x06]


###

def start():
    # map device range
    MOV(A, 0xFD)
    MOV(B, 0)
    MMAP(DEV_ADDR, DEV_ADDR + 0xFF, 2)

    with Block() as blk:
        MOV(A, 0)

        MOV(G, M_PS2_RECV)
        AND(H, G, 0x8000)
        JEQ(H, 0, blk.begin)
        AND(A, G, 0xFF)
        MOV(B, A)
        JMP(blk.begin)

    HALT()


START_ADDR = 0xA000
END_ADDR = 0xF000

if __name__ == '__main__':
    with Block() as check_mmap:
        JEQ(PC, START_ADDR, check_mmap.end)  # MUST be the first instruction
        MOV(A, 0xFF)
        MOV(B, 0)
        MMAP(START_ADDR, END_ADDR, 2)  # tmp slot 2
        JMP(START_ADDR)

    # PC == START_ADDR
    MMAP(START_ADDR, END_ADDR, 3)
    UMAP(2)

    MOV(SP, DEV_ADDR)
    CALL(start)
    HALT()

    cg = CodeGen()
    cg.code_offset = START_ADDR
    cg.var_offset = (END_ADDR + 0xF) & 0xFFF0
    cg.compile().write_vhd('test_ps2_sim.vhd')
