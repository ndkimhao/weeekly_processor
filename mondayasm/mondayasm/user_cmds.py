from mondayasm.builder import (
    emit_command as __emit_command,
    emit_command_call as __emit_command_call,
)
from mondayasm.expr import IndirectExpr


##################################################
# ALU 2/3 args
##################################################

def Add(a, b, c=None):
    return __emit_command('add', a, b, c)


def Sub(a, b, c=None):
    return __emit_command('sub', a, b, c)


def Mul(a, b, c=None):
    return __emit_command('mul', a, b, c)


def Imul(a, b, c=None):
    return __emit_command('imul', a, b, c)


def Div(a, b, c=None):
    return __emit_command('div', a, b, c)


def Idiv(a, b, c=None):
    return __emit_command('idiv', a, b, c)


def Shr(a, b, c=None):
    return __emit_command('shr', a, b, c)


def Ishr(a, b, c=None):
    return __emit_command('ishr', a, b, c)


def Shl(a, b, c=None):
    return __emit_command('shl', a, b, c)


def And(a, b, c=None):
    return __emit_command('and', a, b, c)


def Or(a, b, c=None):
    return __emit_command('or', a, b, c)


def Xor(a, b, c=None):
    return __emit_command('xor', a, b, c)


##################################################
# ALU 2/3 args
##################################################

def Neg(a, b=None):
    return __emit_command('neg', a, b)


def Not(a, b=None):
    return __emit_command('not', a, b)


def Bool(a, b=None):
    return __emit_command('bool', a, b)


def Inc(a, b=None):
    return __emit_command('inc', a, b)


def Dec(a, b=None):
    return __emit_command('dec', a, b)


##################################################
# Conditional Jmp
##################################################
def Jeq(a, b, c=None):
    return __emit_command('jeq', a, b, c)


def Jne(a, b, c=None):
    return __emit_command('jne', a, b, c)


def Jlt(a, b, c=None):
    return __emit_command('jlt', a, b, c)


def Jle(a, b, c=None):
    return __emit_command('jle', a, b, c)


def Jgt(a, b, c=None):
    return __emit_command('jgt', a, b, c)


def Jge(a, b, c=None):
    return __emit_command('jge', a, b, c)


##################################################
# Others
##################################################

def Getf(a):
    assert not isinstance(a, IndirectExpr)
    return __emit_command('getf', a)


def Cmp(a, b):
    return __emit_command('cmp', a, b)


def Mmap(a, b, c):
    assert not isinstance(a, IndirectExpr)
    assert not isinstance(b, IndirectExpr)
    assert not isinstance(c, IndirectExpr)
    return __emit_command('mmap', a, b, c)


def Jmp(a):
    return __emit_command('jmp', a)


def Call(a, emit_call: bool = True):
    return __emit_command_call('call', a, emit_call=emit_call)


def Mov(a, b):
    return __emit_command('mov', a, b)


def Bmov(a, b):
    return __emit_command('bmov', a, b)


def Setf(a):
    return __emit_command('setf', a)


def Icmp(a, b):
    return __emit_command('icmp', a, b)


def Umap(a):
    assert not isinstance(a, IndirectExpr)
    return __emit_command('umap', a)


def Halt():
    return __emit_command('halt')


def Ret():
    return __emit_command('ret')


def Push(a):
    return __emit_command('push', a)


def Pop(a):
    return __emit_command('pop', a)
