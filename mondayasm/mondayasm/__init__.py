from mondayasm.expr import (
    Expr,
    A, B, C, D, SP, PC, E, F, G, H,
    MemoryMagicInstance as M,
    ConstLabel,
)
from mondayasm.user_cmds import *
from mondayasm.builder import (
    _Label as Label,
    _AnonLabel as AnonLabel,
    _ConstData as ConstData,
    _StaticVar as StaticVar,
    _Block as Block,
)
from mondayasm.codegen import CodeGen

GLOBALS = (A, B, C, D, SP, PC, E, F, G, H, M,)