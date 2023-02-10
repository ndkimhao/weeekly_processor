from mondayasm.expr import (
    Expr,
    A, B, C, D, SP, PC, E, F, G, H,
    MemoryMagicInstance as M,
    ConstLabel,
)
from mondayasm.user_cmds import *
from mondayasm.builder import (
    Label,
    EmitLabel,
    DeclLabel,
    DeclAnonLabel,
    AnonLabel,
    ConstData,
    StaticVar,
    Block,
)
from mondayasm.codegen import CodeGen

GLOBALS = (A, B, C, D, SP, PC, E, F, G, H, M,)
