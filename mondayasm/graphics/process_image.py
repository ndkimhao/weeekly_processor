from pprint import pprint

from PIL import Image, PyAccess
import sys

HEIGHT = 480
WIDTH = 640

if __name__ == '__main__':
    file = sys.argv[1]
    print(f'file = {file}')

    im = Image.open(file).transpose(method=Image.TRANSPOSE)
    print(f'img size = {im.size}')
    print(im.getpalette())

    pix: PyAccess = im.load()
    cid_set = set()
    assert im.size == (HEIGHT, WIDTH)
    for i in range(HEIGHT):
        for j in range(WIDTH):
            cid = pix[i, j]
            cid_set.add(cid)
    print(len(cid_set))
