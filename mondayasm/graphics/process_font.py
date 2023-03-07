from PIL import Image

if __name__ == '__main__':
    im = Image.open('font_12x16.png').transpose(method=Image.TRANSPOSE)
    pix = im.load()
    ROWS = 6
    COLS = 16
    HEIGHT = 16
    WIDTH = 12
    ALL_ZEROS = '0' * WIDTH
    all_encodes = []
    print(f'img size = {im.size}')
    assert im.size == (ROWS * HEIGHT, COLS * WIDTH)
    for i in range(ROWS):
        for j in range(HEIGHT):
            print(f'{i}, {j}:')
            encode_bits = []
            prev_lines = [ALL_ZEROS, ALL_ZEROS]
            for x in range(HEIGHT):
                line_bits = []
                for y in range(WIDTH):
                    p = pix[i * HEIGHT + x, j * WIDTH + y]
                    white = p == 0
                    line_bits.append('1' if white else '0')
                    if white:
                        print('⬜', end='')
                    else:
                        print('⬛', end='')
                print()
                line = ''.join(line_bits)
                if line == prev_lines[-1]:
                    encode_bits.append('0')
                elif line == prev_lines[-2]:
                    encode_bits.append('10')
                elif line == ALL_ZEROS:
                    encode_bits.append('110')
                else:
                    encode_bits.append(f'111{line}')
                prev_lines.append(line)

            print(' '.join(encode_bits))
            raw_encode = ''.join(encode_bits)
            all_encodes.append(raw_encode)

    all_bits = ''.join(all_encodes)
    ba_encode = bytearray()
    while len(all_bits) % 8 != 0:
        all_bits += '0'
    for i in range(0, len(all_bits), 8):
        ba_encode.append(int(all_bits[i:i + 8], 2))
    print(f'total bytes = {len(ba_encode)}')
    print(ba_encode.hex())
