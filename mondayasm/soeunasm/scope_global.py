g_stack = []
g_sp_offset = 0


def inc_stack_offset(amount):
    global g_sp_offset
    assert amount >= 0
    g_sp_offset += amount


def dec_stack_offset(amount):
    global g_sp_offset
    assert amount >= 0
    g_sp_offset -= amount
    assert g_sp_offset >= 0


def cur_stack_offset():
    return g_sp_offset


def push_global_scope(blk):
    g_stack.append(blk)


def pop_global_scope(blk):
    assert g_stack[-1] is blk
    g_stack.pop()


# noinspection PyPep8Naming
def Cleanup(*args, **kwargs):
    blk = g_stack[-1]
    blk.inner_ctx.Cleanup(*args, **kwargs)


# noinspection PyPep8Naming
def Break(*args, **kwargs):
    blk = __find_ctx('break')
    blk.inner_ctx.Break(*args, **kwargs)


# noinspection PyPep8Naming
def BreakIf(*args, **kwargs):
    blk = __find_ctx('break')
    blk.inner_ctx.BreakIf(*args, **kwargs)


# noinspection PyPep8Naming
def Continue(*args, **kwargs):
    blk = __find_ctx('continue')
    blk.inner_ctx.Continue(*args, **kwargs)


# noinspection PyPep8Naming
def ContinueIf(*args, **kwargs):
    blk = __find_ctx('continue')
    blk.inner_ctx.ContinueIf(*args, **kwargs)


def __find_ctx(bypass: str):
    for blk in reversed(g_stack):
        if hasattr(blk, 'FUNCTION_BYPASS') and bypass in blk.FUNCTION_BYPASS:
            continue
        return blk
    assert False
