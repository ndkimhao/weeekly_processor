from soeunasm import global_var
from soeunasm.scope_func import Return

state = global_var('rand__state')


def srand(seed):
    state @ seed


# http://www.retroprogramming.com/2017/07/xorshift-pseudorandom-numbers-in-z80.html
def rand(G, H):
    H @= state

    G @= H << 7
    H ^= G

    G @= H >> 9
    H ^= G

    G @= H << 8
    H ^= G

    state @ H
