CMDS = (
    ("ADD", 2), ("SUB", 2), ("MUL", 2), ("IMUL", 2), ("DIV", 2), ("IDIV", 2), ("GETB", 2), ("SETB", 2),
    ("SHR", 2), ("ISHR", 2), ("SHL", 2), ("AND", 2), ("OR", 2), ("XOR", 2), ("NEG", 1), ("NOT", 1),
    ("BOOL", 1), ("INC", 1), ("DEC", 1), ("GETF", 1), ("CMP", 2), ("MMAP", 3), ("JMP", 1), ("CALL", 1),
    ("MOV", 2), ("BMOV", 2), ("JEQ", 1), ("JNE", 1), ("JLT", 1), ("JLE", 1), ("JGT", 1), ("JGE", 1),
    ("ADD", 3), ("SUB", 3), ("MUL", 3), ("IMUL", 3), ("DIV", 3), ("IDIV", 3), ("GETB", 3), ("SETB", 3),
    ("SHR", 3), ("ISHR", 3), ("SHL", 3), ("AND", 3), ("OR", 3), ("XOR", 3), ("NEG", 2), ("NOT", 2),
    ("BOOL", 2), ("INC", 2), ("DEC", 2), ("SETF", 1), ("ICMP", 2), ("UMAP", 1), ("HALT", 0), ("RET", 0),
    ("PUSH", 1), ("POP", 1), ("JEQ", 3), ("JNE", 3), ("JLT", 3), ("JLE", 3), ("JGT", 3), ("JGE", 3),
)
assert len(CMDS) == 64

REGS = (
    '0', 'A', 'B', 'C', 'D', 'SP', 'PC'
)
assert len(REGS) == 7

AUX_REGS = (
    'E', 'F', 'G', 'H'
)
assert len(AUX_REGS) == 4

FACTORS = (1, 2, 4, 8)
assert len(FACTORS) == 4

###

CMDS_MAP = {v: i for i, v in enumerate(CMDS)}
REGS_MAP = {v: i for i, v in enumerate(REGS)}
AUX_REGS_MAP = {v: i for i, v in enumerate(AUX_REGS)}
FACTORS_MAP = {v: i for i, v in enumerate(FACTORS)}
