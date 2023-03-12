import argparse
import os

import serial
from PIL import Image

from uploader2 import Communicator, SEP

HEIGHT = 480
WIDTH = 640


# ### Conversion script (fsh)
# set cnt 0
# for f in ../Temp_Images/*
#     echo $cnt ': ' $f
#     convert "$f" -resize 640x480 -background (../dominantcolor "$f") -compose Copy \
#           -gravity center -extent 640x480 -colors 8 $cnt.png
#     set cnt (math $cnt+1)
# end

def upload_img(comm: Communicator, args: argparse.ArgumentParser, image_path: str):
    conf_page = bytearray()
    conf_page.append(0xa6)
    conf_page.append(0x3a)

    print(f'=== FILE = {image_path}')
    name: str = os.path.basename(image_path) if args.name is None else args.name
    name = name.removesuffix('.png')
    name_lines = name.split(' - ')
    if len(name_lines) < 3:
        name_lines.append(name_lines[0].strip() + '.png')
    name_lines = [(n + ' ' * 12)[:8] for n in name_lines]
    slot = args.slot
    if slot is None:
        slot = int(name_lines[0].strip()) - 1
    name_lines = name_lines[1:]
    print(name_lines)
    print(f'slot = {slot}')

    for i in range(2):
        for j in range(8):
            conf_page.append(ord(name_lines[i][j]))
        conf_page.extend([0, 0])

    im = Image.open(image_path).transpose(method=Image.TRANSPOSE)
    pix = im.load()
    assert im.size == (HEIGHT, WIDTH)
    print(f'img size = {im.size}')
    print(im.getpalette())
    print(im.getcolors())

    im_palette = im.getpalette()
    palette_conf = bytearray()
    for i in reversed(range(3)):
        for j in range(i, 8 * 3 + i, 3):
            palette_conf.append(im_palette[j])
            palette_conf.append(0)
    print(len(palette_conf), palette_conf.hex())

    conf_page.extend(palette_conf)
    print(len(conf_page), conf_page.hex())
    while len(conf_page) < 512:
        conf_page.append(0)

    chunk_idx = int(slot) << 8
    comm.send_cmd(f'WRITE_SD 0001 {chunk_idx:04x}')
    comm.send_cmd(conf_page.hex(),
                  f'WRITE_SD_OK 0001 {chunk_idx:04x}')

    if args.header_only:
        return

    chunk_idx += 1
    chunk = [bytearray(), bytearray(), bytearray()]
    for i in range(HEIGHT):
        for j in range(15, WIDTH + 15, 16):
            for color_bit in range(3):
                t = 0
                for k in range(16):
                    color_idx = pix[i, j - k]
                    assert 0 <= color_idx < 8
                    if color_idx & (1 << color_bit) != 0:
                        t = (t << 1) + 1
                    else:
                        t = t << 1
                chunk[color_bit].append(t & 0xFF)
                chunk[color_bit].append(t >> 8)
            if len(chunk[0]) == 512:
                for q in range(3):
                    write_cmd = 'WRITE_SD' if args.hex else 'WRITEB_SD'
                    comm.send_cmd(f'{write_cmd} 0001 {chunk_idx:04x}')
                    comm.send_cmd(chunk[q].hex() if args.hex else bytes(chunk[q]),
                                  f'WRITE_SD_OK 0001 {chunk_idx:04x}')
                    chunk_idx += 1
                chunk = [bytearray(), bytearray(), bytearray()]
    assert len(chunk[0]) == 0


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-p', '--port', help='COM port', required=True)
    parser.add_argument('-s', '--slot', help='Image slot on SD card')
    parser.add_argument('-i', '--image', help='Image file', required=True)
    parser.add_argument('-n', '--name', help='Stored name')
    parser.add_argument('-t', '--verify', help='Verify uploaded data',
                        default=True, action=argparse.BooleanOptionalAction)
    parser.add_argument('--hex', help='Use hex transfer mode',
                        default=False, action=argparse.BooleanOptionalAction)
    parser.add_argument('--header-only', help='Only write header',
                        default=False, action=argparse.BooleanOptionalAction)
    args = parser.parse_args()

    with serial.Serial(args.port, 115200, timeout=0.5) as ser:
        comm = Communicator(ser)
        comm.send_cmd('PING', 'PONG')
        print(f'\nPinged device at {args.port}\n\n{SEP}\n')

        image = args.image
        if os.path.isfile(image):
            upload_img(comm, args, image)
        else:
            args.slot = None
            for filename in os.listdir(image):
                upload_img(comm, args, os.path.join(image, filename))


if __name__ == '__main__':
    main()
