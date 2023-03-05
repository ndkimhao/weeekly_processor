_g_stack = []


def _push_global_scope(blk):
    _g_stack.append(blk)


def _pop_global_scope(blk):
    assert _g_stack[-1] is blk
    _g_stack.pop()


# noinspection PyPep8Naming
def Cleanup(*args, **kwargs):
    blk = _g_stack[-1]
    blk.inner_ctx.Cleanup(*args, **kwargs)


# noinspection PyPep8Naming
def Break(*args, **kwargs):
    blk = _g_stack[-1]
    blk.inner_ctx.Break(*args, **kwargs)


# noinspection PyPep8Naming
def BreakIf(*args, **kwargs):
    blk = _g_stack[-1]
    blk.inner_ctx.BreakIf(*args, **kwargs)


# noinspection PyPep8Naming
def Continue(*args, **kwargs):
    blk = _g_stack[-1]
    blk.inner_ctx.Continue(*args, **kwargs)


# noinspection PyPep8Naming
def ContinueIf(*args, **kwargs):
    blk = _g_stack[-1]
    blk.inner_ctx.ContinueIf(*args, **kwargs)
