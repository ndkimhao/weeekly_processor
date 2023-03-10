import progs
from progs.stdlib import printf
from progs.stdlib.memory import memset, memcpy
from progs.stdlib.printf import PRINTF
from progs.stdlib.random import srand, rand
from progs.tetris.data import CELLS_PER_TETROMINOS, TETROMINOS, NUM_ORIENTATIONS, GRAVITY_LEVELS
from progs.tetris.defs import N_ROWS, N_COLS
from progs.tetris.te_types import TeCell, TeBlock, TeMove
from soeunasm import global_var, call, const, local_var, If, cmt, Else, ForRange, M, Scope, ElseIf, While, Loop
from soeunasm.scope_func import Return


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
    Board.next.loc.col @= N_COLS // 2 - 2


def tg_new_falling(G, H):
    cmt('Board.falling = Board.next')
    call(memcpy, Board.falling.addr(), Board.next.addr(), TeBlock.SIZE)
    cmt('fill new Board.next')
    call(rand)
    G @= H // 7
    Board.next.typ @= H + 1
    Board.next.ori @= 0
    Board.next.loc.row @= 0
    Board.next.loc.col @= N_COLS // 2 - 2


def tg_tick(move, H):
    # Handle gravity.
    call(tg_do_gravity_tick)
    with If(H != 0):
        call(progs.tetris.display.display_board)
    # Handle input.
    call(tg_handle_move, move)
    # Check for cleared lines
    call(tg_check_lines)  # H == lines_cleared
    call(tg_adjust_score, H)
    #  Return whether the game will continue (NOT whether it's over)
    call(tg_game_over)
    H @= 1 - H


# returns 1 if need update
def tg_do_gravity_tick(A, H):
    Board.ticks_till_gravity -= 1
    with If(Board.ticks_till_gravity <= 0, signed=True):
        call(tg_put, 0)
        Board.falling.loc.row += 1
        call(tg_fits)
        with If(H == 1):
            A @= Board.level << 1
            Board.ticks_till_gravity @= M[GRAVITY_LEVELS + A]

            Else()

            # PRINTF('not fit!\n')
            Board.falling.loc.row -= 1
            call(tg_put, 1)
            call(tg_new_falling)
        ###
        call(tg_put, 1)
        H @= 1

        Else()
        H @= 0


# put_or_clear: 0 = clear, 1 = put
def tg_put(put_or_clear,
           A, B, C, D, E, F, G, H):
    A @= put_or_clear
    teblk = Board.falling

    B @= teblk.typ - 1
    D @= teblk.ori << 1
    D += (B * NUM_ORIENTATIONS * 2)
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


def tg_handle_move(move, A):
    A @= move
    with If(A == TeMove.LEFT.value):
        call(tg_move, -1)

        ElseIf(A == TeMove.RIGHT.value)
        call(tg_move, 1)

        ElseIf(A == TeMove.DROP.value)
        call(tg_down)

        ElseIf(A == TeMove.ROTATE.value)
        call(tg_rotate)


def tg_move(direction, H):
    call(tg_put, 0)
    Board.falling.loc.col += direction
    call(tg_fits)
    with If(H == 0):
        Board.falling.loc.col -= direction
    call(tg_put, 1)


def tg_down(H):
    call(tg_put, 0)
    with Loop():
        Board.falling.loc.row += 1
        call(tg_fits)
        If(H == 0).then_break()
    ###
    Board.falling.loc.row -= 1
    # PRINTF('drop: %d\n', Board.falling.loc.row)
    call(tg_put, 1)
    call(tg_new_falling)


def tg_rotate(H):
    call(tg_put, 0)
    with Loop():
        H @= Board.falling.ori + 1
        H &= (NUM_ORIENTATIONS - 1)
        Board.falling.ori @= H

        # If the new orientation fits, we're done.
        call(tg_fits)
        If(H != 0).then_break()

        # Otherwise, try moving left to make it fit.
        Board.falling.loc.col -= 1
        call(tg_fits)
        If(H != 0).then_break()

        # Finally, try moving right to make it fit.
        Board.falling.loc.col += 2
        call(tg_fits)
        If(H != 0).then_break()

        # Put it back in its original location and try the next orientation.
        Board.falling.loc.col -= 1
        # Worst case, we come back to the original orientation and it fits, so this
        # loop will terminate.

    # PRINTF('rot: t=%d o=%d r=%d c=%d\n',
    #        Board.falling.typ, Board.falling.ori, Board.falling.loc.row, Board.falling.loc.col)
    call(tg_put, 1)


def tg_adjust_score(lines_cleared):
    ...


def tg_game_over(A, B, C, D, H):
    C @= 0
    call(tg_put, 0)
    with ForRange(A, 0, 2) as for_a:
        with ForRange(B, 0, N_COLS):
            D @= A * N_COLS
            D += B + Board.state.addr()
            H @= M[D].byte()
            with If(H != TeCell.EMPTY):
                C @= 1
                for_a.Break()
    call(tg_put, 1)
    H @= C


def tg_check_lines(H):
    H @= 0


def tg_fits(A, B, C, D, E, F, G, H):
    teblk = Board.falling

    B @= teblk.typ - 1
    D @= teblk.ori << 1
    D += (B * NUM_ORIENTATIONS * 2)
    D @= [TETROMINOS + D]
    # call(printf, const('fits: t=%d o=%d row=%d col=%d\n'), teblk.typ, teblk.ori, teblk.loc.row, teblk.loc.col)
    with ForRange(C, 0, CELLS_PER_TETROMINOS):
        A @= D >> (C * 4 + 2)
        E @= D >> (C * 4)
        A &= 0x03
        E &= 0x03
        G @= teblk.loc.row + A
        B @= teblk.loc.col + E
        # call(printf, const('fits: %d %d ; %d %d -> %d %d\n'), A, E, teblk.loc.row, teblk.loc.col, G, B)

        cmt('check if out of board area')
        H @= 0
        If(G < 0, signed=True).then_return()
        If(B < 0, signed=True).then_return()
        If(G >= N_ROWS).then_return()
        If(B >= N_COLS).then_return()

        cmt('check if cell is occupied')
        F @= G * N_COLS
        F += B + Board.state.addr()
        F @= M[F].byte()
        If(F != TeCell.EMPTY).then_return()

    cmt('done checking, all good')
    H @= 1
