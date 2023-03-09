from progs.stdlib import printf
from progs.stdlib.memory import memset, memcpy
from progs.stdlib.random import srand, rand
from progs.tetris.data import CELLS_PER_TETROMINOS, TETROMINOS, NUM_ORIENTATIONS
from progs.tetris.defs import N_ROWS, N_COLS
from progs.tetris.types import TeCell, TeBlock
from soeunasm import global_var, call, const, local_var, If, cmt, Else, ForRange, M


class Board:
    state = global_var('board__board_state', size=N_ROWS * N_COLS)
    points = global_var('board__points')
    level = global_var('board__level')

    falling = TeBlock(global_var('board__falling', size=TeBlock.SIZE))
    next = TeBlock(global_var('board__next', size=TeBlock.SIZE))
    stored = TeBlock(global_var('board__stored', size=TeBlock.SIZE))

    ticks_till_gravity = global_var('board__ticks_till_gravity')
    lines_remaining = global_var('board__lines_remaining')


def tg_init():
    call(memset, Board.state.addr(), TeCell.EMPTY, N_ROWS * N_COLS)

    Board.points @= 0
    Board.level @= 0
    Board.ticks_till_gravity @= 0
    Board.lines_remaining @= 0

    call(srand, 0)
    call(tg_new_falling)
    call(tg_new_falling)

    Board.stored.typ @= -1
    Board.stored.ori @= 0
    Board.stored.loc.row @= 0
    Board.next.loc.col @= N_ROWS // 2 - 2


def tg_new_falling(H):
    cmt('Board.falling = Board.next')
    call(memcpy, Board.falling.addr(), Board.next.addr(), TeBlock.SIZE)
    cmt('fill new Board.next')
    call(rand)
    Board.next.typ @= H
    Board.next.ori @= 0
    Board.next.loc.row @= 0
    Board.next.loc.col @= N_COLS // 2 - 2


def tg_tick(move, H):
    # Handle gravity.
    call(tg_do_gravity_tick)
    # Handle input.
    call(tg_handle_move, move)
    # Check for cleared lines
    call(tg_check_lines)  # H == lines_cleared
    call(tg_adjust_score, H)
    #  Return whether the game will continue (NOT whether it's over)
    call(tg_game_over)
    H @= H.bool()
    H @= 1 - H


def tg_do_gravity_tick():
    Board.ticks_till_gravity -= 1
    with If(Board.ticks_till_gravity <= 0, signed=True):
        call(tg_put, Board.falling.addr(), 0)
        Board.falling.loc.row += 1
        call(tg_put, Board.falling.addr(), 1)


# put_or_clear: 0 = clear, 1 = put
def tg_put(ptr_teblock, put_or_clear,
           A, B, C, D, E, F, G, H):
    A @= ptr_teblock
    teblk = TeBlock(M[A])

    B @= teblk.typ - 1
    D @= teblk.ori + (B * NUM_ORIENTATIONS * 2)
    D @= [TETROMINOS + D]
    # call(printf, const('t=%d o=%d blk=%x\n'), B, teblk.ori, D)
    with ForRange(C, 0, CELLS_PER_TETROMINOS):
        B @= D >> (C * 4 + 2)  # reuse B
        E @= D >> (C * 4)
        B &= 0x03
        E &= 0x03
        G @= teblk.loc.row + B
        B @= teblk.loc.col + E  # reuse B
        # call(printf, const('%d %d ; %d %d -> %d %d\n'), B, E, teblk.loc.row, teblk.loc.col, G, B)

        F @= G * N_COLS
        F += B + Board.state.addr()
        # call(printf, const('%x: '), F)
        with If(put_or_clear == 0):
            M[F].byte() @ TeCell.EMPTY
            Else()
            M[F].byte() @ teblk.typ
            # call(printf, const('%x\n'), [F])


def tg_handle_move(move):
    ...


def tg_adjust_score(lines_cleared):
    ...


def tg_game_over(H):
    H @= 0


def tg_check_lines(H):
    H @= 0
