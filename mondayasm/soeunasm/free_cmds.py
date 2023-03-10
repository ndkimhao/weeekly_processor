from soeunasm import Statement, StmOp, Expr


def halt():
    return Statement(StmOp.HALT)


def mmap(virt_start, virt_end, slot_idx):
    virt_start = Expr.to_expr(virt_start)
    virt_end = Expr.to_expr(virt_end)
    slot_idx = Expr.to_expr(slot_idx)
    assert virt_start.is_pure
    assert virt_end.is_pure
    assert slot_idx.is_pure
    return Statement(StmOp.MMAP, virt_start.a, virt_end.a, slot_idx.a)


def umap(slot_idx):
    slot_idx = Expr.to_expr(slot_idx)
    assert slot_idx.is_pure
    return Statement(StmOp.UMAP, slot_idx.a)


def getb(a, b, c=None):
    a = Expr.to_expr(a)
    b = Expr.to_expr(b)
    assert a.is_pure
    assert b.is_pure
    a = a.a
    b = b.a
    if c is not None:
        c = Expr.to_expr(c)
        assert c.is_pure
        c = c.a
    return Statement(StmOp.GETB, a, b, c)


def setb(a, b, c=None):
    a = Expr.to_expr(a)
    b = Expr.to_expr(b)
    assert a.is_pure
    assert b.is_pure
    a = a.a
    b = b.a
    if c is not None:
        c = Expr.to_expr(c)
        assert c.is_pure
        c = c.a
    return Statement(StmOp.SETB, a, b, c)


def clrb(a, b, c=None):
    if c is None:
        b += 16
    else:
        c += 16
    return setb(a, b, c)


def jmp(target):
    if not isinstance(target, Expr):
        target = Expr.to_expr(target)
    assert target.is_pure
    return Statement(StmOp.JMP, target.a)
