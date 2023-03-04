from enum import Enum, auto


class StmOp(Enum):
    GETF = auto()
    CMP = auto()
    MMAP = auto()
    JMP = auto()
    CALL = auto()
    MOV = auto()
    BMOV = auto()
    SETF = auto()
    ICMP = auto()
    UMAP = auto()
    HALT = auto()
    RET = auto()
    PUSH = auto()
    POP = auto()
    JEQ = auto()
    JNE = auto()
    JLT = auto()
    JLE = auto()
    JGT = auto()
    JGE = auto()

    ADD = auto()
    SUB = auto()
    MUL = auto()
    IMUL = auto()
    DIV = auto()
    IDIV = auto()
    SHR = auto()
    ISHR = auto()
    SHL = auto()
    AND = auto()
    OR = auto()
    XOR = auto()
    NEG = auto()
    NOT = auto()
    BOOL = auto()
    INC = auto()
    DEC = auto()


class ExprOp(Enum):
    NONE = auto()

    # binary ALU
    ADD = auto()
    SUB = auto()
    MUL = auto()
    IMUL = auto()
    DIV = auto()
    IDIV = auto()

    SHR = auto()
    ISHR = auto()
    SHL = auto()
    AND = auto()
    OR = auto()
    XOR = auto()

    # unary ALU
    NEG = auto()
    NOT = auto()
    BOOL = auto()
    INC = auto()
    DEC = auto()


class CmpOp(Enum):
    EQ = auto()
    NE = auto()
    LT = auto()
    LE = auto()
    GT = auto()
    GE = auto()
