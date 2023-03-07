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
