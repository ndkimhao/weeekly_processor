from soeunasm import global_var
from soeunasm.scope_func import Return

state = global_var('rand__state')


def srand(seed):
    state @ seed


def rand(H):
    H @ (state + 1)
    state @ H
