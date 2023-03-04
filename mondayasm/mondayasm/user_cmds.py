from mondayasm.builder import (
    emit_command as __emit_command,
    emit_command_call as __emit_command_call,
)
from mondayasm.raw_expr import RawIndirect


##################################################
# ALU 2/3 args
##################################################

def ADD(a, b, c=None):
    return __emit_command('add', a, b, c)


def SUB(a, b, c=None):
    return __emit_command('sub', a, b, c)


def MUL(a, b, c=None):
    return __emit_command('mul', a, b, c)


def IMUL(a, b, c=None):
    return __emit_command('imul', a, b, c)


def DIV(a, b, c=None):
    return __emit_command('div', a, b, c)


def IDIV(a, b, c=None):
    return __emit_command('idiv', a, b, c)


def SHR(a, b, c=None):
    return __emit_command('shr', a, b, c)


def ISHR(a, b, c=None):
    return __emit_command('ishr', a, b, c)


def SHL(a, b, c=None):
    return __emit_command('shl', a, b, c)


def AND(a, b, c=None):
    return __emit_command('and', a, b, c)


def OR(a, b, c=None):
    return __emit_command('or', a, b, c)


def XOR(a, b, c=None):
    return __emit_command('xor', a, b, c)


##################################################
# ALU 2/3 args
##################################################

def NEG(a, b=None):
    return __emit_command('neg', a, b)


def NOT(a, b=None):
    return __emit_command('not', a, b)


def BOOL(a, b=None):
    return __emit_command('bool', a, b)


def INC(a, b=None):
    return __emit_command('inc', a, b)


def DEC(a, b=None):
    return __emit_command('dec', a, b)


##################################################
# Conditional Jmp
##################################################
def JEQ(a, b=None, c=None):
    return __emit_command('jeq', a, b, c)


def JNE(a, b=None, c=None):
    return __emit_command('jne', a, b, c)


def JLT(a, b=None, c=None):
    return __emit_command('jlt', a, b, c)


def JLE(a, b=None, c=None):
    return __emit_command('jle', a, b, c)


def JGT(a, b=None, c=None):
    return __emit_command('jgt', a, b, c)


def JGE(a, b=None, c=None):
    return __emit_command('jge', a, b, c)


##################################################
# Others
##################################################

def GETF(a):
    assert not isinstance(a, RawIndirect)
    return __emit_command('getf', a)


def CMP(a, b):
    return __emit_command('cmp', a, b)


def MMAP(a, b, c):
    assert not isinstance(a, RawIndirect)
    assert not isinstance(b, RawIndirect)
    assert not isinstance(c, RawIndirect)
    return __emit_command('mmap', a, b, c)


def JMP(a):
    return __emit_command('jmp', a)


def CALL(a, emit_call: bool = True):
    return __emit_command_call('call', a, emit_call=emit_call)


def MOV(a, b):
    return __emit_command('mov', a, b)


def BMOV(a, b):
    return __emit_command('bmov', a, b)


def SETF(a):
    assert not isinstance(a, RawIndirect)
    return __emit_command('setf', a)


def ICMP(a, b):
    return __emit_command('icmp', a, b)


def UMAP(a):
    assert not isinstance(a, RawIndirect)
    return __emit_command('umap', a)


def HALT():
    return __emit_command('halt')


def RET():
    return __emit_command('ret')


def PUSH(*args):
    for a in args:
        __emit_command('push', a)
    return tuple(args)


def POP(*args):
    if isinstance(args[0], tuple):
        args = args[0]
    for a in reversed(args):
        __emit_command('pop', a)
