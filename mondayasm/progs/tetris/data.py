# How many cells in a tetromino?
from soeunasm import const

CELLS_PER_TETROMINOS = 4
# How many tetrominos?
NUM_TETROMINOS = 7
# How many orientations of a tetromino?
NUM_ORIENTATIONS = 4
# Level constants.
MAX_LEVEL = 19
LINES_PER_LEVEL = 10

TETROMINOS_PY = [  # [NUM_TETROMINOS][NUM_ORIENTATIONS][TETRIS]
    # J
    [[[0, 0], [1, 0], [1, 1], [1, 2]],
     [[0, 1], [0, 2], [1, 1], [2, 1]],
     [[1, 0], [1, 1], [1, 2], [2, 2]],
     [[0, 1], [1, 1], [2, 0], [2, 1]]],
    # S
    [[[0, 1], [0, 2], [1, 0], [1, 1]],
     [[0, 1], [1, 1], [1, 2], [2, 2]],
     [[1, 1], [1, 2], [2, 0], [2, 1]],
     [[0, 0], [1, 0], [1, 1], [2, 1]]],
    # I
    [[[1, 0], [1, 1], [1, 2], [1, 3]],
     [[0, 2], [1, 2], [2, 2], [3, 2]],
     [[3, 0], [3, 1], [3, 2], [3, 3]],
     [[0, 1], [1, 1], [2, 1], [3, 1]]],
    # Z
    [[[0, 0], [0, 1], [1, 1], [1, 2]],
     [[0, 2], [1, 1], [1, 2], [2, 1]],
     [[1, 0], [1, 1], [2, 1], [2, 2]],
     [[0, 1], [1, 0], [1, 1], [2, 0]]],
    # T
    [[[0, 1], [1, 0], [1, 1], [1, 2]],
     [[0, 1], [1, 1], [1, 2], [2, 1]],
     [[1, 0], [1, 1], [1, 2], [2, 1]],
     [[0, 1], [1, 0], [1, 1], [2, 1]]],
    # O
    [[[0, 1], [0, 2], [1, 1], [1, 2]],
     [[0, 1], [0, 2], [1, 1], [1, 2]],
     [[0, 1], [0, 2], [1, 1], [1, 2]],
     [[0, 1], [0, 2], [1, 1], [1, 2]]],
    # L
    [[[0, 2], [1, 0], [1, 1], [1, 2]],
     [[0, 1], [1, 1], [2, 1], [2, 2]],
     [[1, 0], [1, 1], [1, 2], [2, 0]],
     [[0, 0], [0, 1], [1, 1], [2, 1]]],
]


def _process_tetrominos(tetrominos):
    ret = []
    for piece in tetrominos:
        for orientation in piece:
            p = 0
            for x, y in orientation:
                assert 0 <= x < 4 and 0 <= y < 4
                p = (p << 2) | x
                p = (p << 2) | y
            assert p <= 0xFFFF
            ret.append(p)
    return ret


TETROMINOS = const('TETROMINOS', _process_tetrominos(TETROMINOS_PY))

GRAVITY_LEVELS_PY = [
    # 0,  1,  2,  3,  4,  5,  6,  7,  8,  9,
    50, 48, 46, 44, 42, 40, 38, 36, 34, 32,
    # 10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
    30, 28, 26, 24, 22, 20, 16, 12, 8, 4
]

GRAVITY_LEVELS = const('GRAVITY_LEVELS', GRAVITY_LEVELS_PY)
