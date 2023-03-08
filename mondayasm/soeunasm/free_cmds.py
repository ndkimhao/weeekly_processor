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
    if c is not None:
        c = Expr.to_expr(c)
        assert c.is_pure
    return Statement(StmOp.GETB)


def setb(a, b, c=None):
    a = Expr.to_expr(a)
    b = Expr.to_expr(b)
    assert a.is_pure
    assert b.is_pure
    if c is not None:
        c = Expr.to_expr(c)
        assert c.is_pure
    return Statement(StmOp.SETB)
