                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_start:
60 a0 e0 00 9f                 # a000 |   mov SP, 0x9f00
60 20 e0 4c ab                 # a005 |   mov A, ${const_data_1}
5c f8 59 0a                    # a00a |   call ${fn_send_data}:rel + PC
60 20 e0 f0 00                 # a00e |   mov A, 0xf0
60 40 00                       # a013 |   mov B, 0
54 00 e0 1c 00 96 01           # a016 |   mmap 0, 0x9600, 0x1
62 e0 1c 00 20 ff              # a01d |   mov [0x2000], 0xff
02 e0 e0 00 20 f0 f0           # a023 |   add [0x2000], 0xf0f0
2e e0 e0 00 20 fd bf           # a02a |   and [0x2000], 0xbffd
62 e0 1c 50 20 ff              # a031 |   mov [0x2050], 0xff
02 e0 e0 50 20 f0 f0           # a037 |   add [0x2050], 0xf0f0
2e e0 e0 50 20 fd bf           # a03e |   and [0x2050], 0xbffd
62 e0 1c a0 20 ff              # a045 |   mov [0x20a0], 0xff
02 e0 e0 a0 20 f0 f0           # a04b |   add [0x20a0], 0xf0f0
2e e0 e0 a0 20 fd bf           # a052 |   and [0x20a0], 0xbffd
62 e0 1c f0 20 ff              # a059 |   mov [0x20f0], 0xff
02 e0 e0 f0 20 f0 f0           # a05f |   add [0x20f0], 0xf0f0
2e e0 e0 f0 20 fd bf           # a066 |   and [0x20f0], 0xbffd
62 e0 1c 40 21 ff              # a06d |   mov [0x2140], 0xff
02 e0 e0 40 21 f0 f0           # a073 |   add [0x2140], 0xf0f0
2e e0 e0 40 21 fd bf           # a07a |   and [0x2140], 0xbffd
62 e0 1c 90 21 ff              # a081 |   mov [0x2190], 0xff
02 e0 e0 90 21 f0 f0           # a087 |   add [0x2190], 0xf0f0
2e e0 e0 90 21 fd bf           # a08e |   and [0x2190], 0xbffd
62 e0 1c e0 21 ff              # a095 |   mov [0x21e0], 0xff
02 e0 e0 e0 21 f0 f0           # a09b |   add [0x21e0], 0xf0f0
2e e0 e0 e0 21 fd bf           # a0a2 |   and [0x21e0], 0xbffd
62 e0 1c 30 22 ff              # a0a9 |   mov [0x2230], 0xff
02 e0 e0 30 22 f0 f0           # a0af |   add [0x2230], 0xf0f0
2e e0 e0 30 22 fd bf           # a0b6 |   and [0x2230], 0xbffd
62 e0 1c 80 22 ff              # a0bd |   mov [0x2280], 0xff
02 e0 e0 80 22 f0 f0           # a0c3 |   add [0x2280], 0xf0f0
2e e0 e0 80 22 fd bf           # a0ca |   and [0x2280], 0xbffd
62 e0 1c d0 22 ff              # a0d1 |   mov [0x22d0], 0xff
02 e0 e0 d0 22 f0 f0           # a0d7 |   add [0x22d0], 0xf0f0
2e e0 e0 d0 22 fd bf           # a0de |   and [0x22d0], 0xbffd
60 20 e0 f1 00                 # a0e5 |   mov A, 0xf1
60 40 00                       # a0ea |   mov B, 0
54 00 e0 1c 00 96 01           # a0ed |   mmap 0, 0x9600, 0x1
62 e0 1c 20 23 ff              # a0f4 |   mov [0x2320], 0xff
02 e0 e0 20 23 f0 f0           # a0fa |   add [0x2320], 0xf0f0
2e e0 e0 20 23 fd bf           # a101 |   and [0x2320], 0xbffd
62 e0 1c 70 23 ff              # a108 |   mov [0x2370], 0xff
02 e0 e0 70 23 f0 f0           # a10e |   add [0x2370], 0xf0f0
2e e0 e0 70 23 fd bf           # a115 |   and [0x2370], 0xbffd
62 e0 1c c0 23 ff              # a11c |   mov [0x23c0], 0xff
02 e0 e0 c0 23 f0 f0           # a122 |   add [0x23c0], 0xf0f0
2e e0 e0 c0 23 fd bf           # a129 |   and [0x23c0], 0xbffd
62 e0 1c 10 24 ff              # a130 |   mov [0x2410], 0xff
02 e0 e0 10 24 f0 f0           # a136 |   add [0x2410], 0xf0f0
2e e0 e0 10 24 fd bf           # a13d |   and [0x2410], 0xbffd
62 e0 1c 60 24 ff              # a144 |   mov [0x2460], 0xff
02 e0 e0 60 24 f0 f0           # a14a |   add [0x2460], 0xf0f0
2e e0 e0 60 24 fd bf           # a151 |   and [0x2460], 0xbffd
62 e0 1c b0 24 ff              # a158 |   mov [0x24b0], 0xff
02 e0 e0 b0 24 f0 f0           # a15e |   add [0x24b0], 0xf0f0
2e e0 e0 b0 24 fd bf           # a165 |   and [0x24b0], 0xbffd
62 e0 1c 00 25 ff              # a16c |   mov [0x2500], 0xff
02 e0 e0 00 25 f0 f0           # a172 |   add [0x2500], 0xf0f0
2e e0 e0 00 25 fd bf           # a179 |   and [0x2500], 0xbffd
62 e0 1c 50 25 ff              # a180 |   mov [0x2550], 0xff
02 e0 e0 50 25 f0 f0           # a186 |   add [0x2550], 0xf0f0
2e e0 e0 50 25 fd bf           # a18d |   and [0x2550], 0xbffd
62 e0 1c a0 25 ff              # a194 |   mov [0x25a0], 0xff
02 e0 e0 a0 25 f0 f0           # a19a |   add [0x25a0], 0xf0f0
2e e0 e0 a0 25 fd bf           # a1a1 |   and [0x25a0], 0xbffd
62 e0 1c f0 25 ff              # a1a8 |   mov [0x25f0], 0xff
02 e0 e0 f0 25 f0 f0           # a1ae |   add [0x25f0], 0xf0f0
2e e0 e0 f0 25 fd bf           # a1b5 |   and [0x25f0], 0xbffd
60 20 e0 f2 00                 # a1bc |   mov A, 0xf2
60 40 00                       # a1c1 |   mov B, 0
54 00 e0 1c 00 96 01           # a1c4 |   mmap 0, 0x9600, 0x1
62 e0 1c 40 26 ff              # a1cb |   mov [0x2640], 0xff
02 e0 e0 40 26 f0 f0           # a1d1 |   add [0x2640], 0xf0f0
2e e0 e0 40 26 fd bf           # a1d8 |   and [0x2640], 0xbffd
62 e0 1c 90 26 ff              # a1df |   mov [0x2690], 0xff
02 e0 e0 90 26 f0 f0           # a1e5 |   add [0x2690], 0xf0f0
2e e0 e0 90 26 fd bf           # a1ec |   and [0x2690], 0xbffd
62 e0 1c e0 26 ff              # a1f3 |   mov [0x26e0], 0xff
02 e0 e0 e0 26 f0 f0           # a1f9 |   add [0x26e0], 0xf0f0
2e e0 e0 e0 26 fd bf           # a200 |   and [0x26e0], 0xbffd
62 e0 1c 30 27 ff              # a207 |   mov [0x2730], 0xff
02 e0 e0 30 27 f0 f0           # a20d |   add [0x2730], 0xf0f0
2e e0 e0 30 27 fd bf           # a214 |   and [0x2730], 0xbffd
62 e0 1c 80 27 ff              # a21b |   mov [0x2780], 0xff
02 e0 e0 80 27 f0 f0           # a221 |   add [0x2780], 0xf0f0
2e e0 e0 80 27 fd bf           # a228 |   and [0x2780], 0xbffd
62 e0 1c d0 27 ff              # a22f |   mov [0x27d0], 0xff
02 e0 e0 d0 27 f0 f0           # a235 |   add [0x27d0], 0xf0f0
2e e0 e0 d0 27 fd bf           # a23c |   and [0x27d0], 0xbffd
62 e0 1c 20 28 ff              # a243 |   mov [0x2820], 0xff
02 e0 e0 20 28 f0 f0           # a249 |   add [0x2820], 0xf0f0
2e e0 e0 20 28 fd bf           # a250 |   and [0x2820], 0xbffd
62 e0 1c 70 28 ff              # a257 |   mov [0x2870], 0xff
02 e0 e0 70 28 f0 f0           # a25d |   add [0x2870], 0xf0f0
2e e0 e0 70 28 fd bf           # a264 |   and [0x2870], 0xbffd
62 e0 1c c0 28 ff              # a26b |   mov [0x28c0], 0xff
02 e0 e0 c0 28 f0 f0           # a271 |   add [0x28c0], 0xf0f0
2e e0 e0 c0 28 fd bf           # a278 |   and [0x28c0], 0xbffd
62 e0 1c 10 29 ff              # a27f |   mov [0x2910], 0xff
02 e0 e0 10 29 f0 f0           # a285 |   add [0x2910], 0xf0f0
2e e0 e0 10 29 fd bf           # a28c |   and [0x2910], 0xbffd
60 20 e0 f3 00                 # a293 |   mov A, 0xf3
60 40 00                       # a298 |   mov B, 0
54 00 e0 1c 00 96 01           # a29b |   mmap 0, 0x9600, 0x1
62 e0 1c 60 29 ff              # a2a2 |   mov [0x2960], 0xff
02 e0 e0 60 29 f0 f0           # a2a8 |   add [0x2960], 0xf0f0
2e e0 e0 60 29 fd bf           # a2af |   and [0x2960], 0xbffd
62 e0 1c b0 29 ff              # a2b6 |   mov [0x29b0], 0xff
02 e0 e0 b0 29 f0 f0           # a2bc |   add [0x29b0], 0xf0f0
2e e0 e0 b0 29 fd bf           # a2c3 |   and [0x29b0], 0xbffd
62 e0 1c 00 2a ff              # a2ca |   mov [0x2a00], 0xff
02 e0 e0 00 2a f0 f0           # a2d0 |   add [0x2a00], 0xf0f0
2e e0 e0 00 2a fd bf           # a2d7 |   and [0x2a00], 0xbffd
62 e0 1c 50 2a ff              # a2de |   mov [0x2a50], 0xff
02 e0 e0 50 2a f0 f0           # a2e4 |   add [0x2a50], 0xf0f0
2e e0 e0 50 2a fd bf           # a2eb |   and [0x2a50], 0xbffd
62 e0 1c a0 2a ff              # a2f2 |   mov [0x2aa0], 0xff
02 e0 e0 a0 2a f0 f0           # a2f8 |   add [0x2aa0], 0xf0f0
2e e0 e0 a0 2a fd bf           # a2ff |   and [0x2aa0], 0xbffd
62 e0 1c f0 2a ff              # a306 |   mov [0x2af0], 0xff
02 e0 e0 f0 2a f0 f0           # a30c |   add [0x2af0], 0xf0f0
2e e0 e0 f0 2a fd bf           # a313 |   and [0x2af0], 0xbffd
62 e0 1c 40 2b ff              # a31a |   mov [0x2b40], 0xff
02 e0 e0 40 2b f0 f0           # a320 |   add [0x2b40], 0xf0f0
2e e0 e0 40 2b fd bf           # a327 |   and [0x2b40], 0xbffd
62 e0 1c 90 2b ff              # a32e |   mov [0x2b90], 0xff
02 e0 e0 90 2b f0 f0           # a334 |   add [0x2b90], 0xf0f0
2e e0 e0 90 2b fd bf           # a33b |   and [0x2b90], 0xbffd
62 e0 1c e0 2b ff              # a342 |   mov [0x2be0], 0xff
02 e0 e0 e0 2b f0 f0           # a348 |   add [0x2be0], 0xf0f0
2e e0 e0 e0 2b fd bf           # a34f |   and [0x2be0], 0xbffd
62 e0 1c 30 2c ff              # a356 |   mov [0x2c30], 0xff
02 e0 e0 30 2c f0 f0           # a35c |   add [0x2c30], 0xf0f0
2e e0 e0 30 2c fd bf           # a363 |   and [0x2c30], 0xbffd
60 20 e0 f4 00                 # a36a |   mov A, 0xf4
60 40 00                       # a36f |   mov B, 0
54 00 e0 1c 00 96 01           # a372 |   mmap 0, 0x9600, 0x1
62 e0 1c 80 2c ff              # a379 |   mov [0x2c80], 0xff
02 e0 e0 80 2c f0 f0           # a37f |   add [0x2c80], 0xf0f0
2e e0 e0 80 2c fd bf           # a386 |   and [0x2c80], 0xbffd
62 e0 1c d0 2c ff              # a38d |   mov [0x2cd0], 0xff
02 e0 e0 d0 2c f0 f0           # a393 |   add [0x2cd0], 0xf0f0
2e e0 e0 d0 2c fd bf           # a39a |   and [0x2cd0], 0xbffd
62 e0 1c 20 2d ff              # a3a1 |   mov [0x2d20], 0xff
02 e0 e0 20 2d f0 f0           # a3a7 |   add [0x2d20], 0xf0f0
2e e0 e0 20 2d fd bf           # a3ae |   and [0x2d20], 0xbffd
62 e0 1c 70 2d ff              # a3b5 |   mov [0x2d70], 0xff
02 e0 e0 70 2d f0 f0           # a3bb |   add [0x2d70], 0xf0f0
2e e0 e0 70 2d fd bf           # a3c2 |   and [0x2d70], 0xbffd
62 e0 1c c0 2d ff              # a3c9 |   mov [0x2dc0], 0xff
02 e0 e0 c0 2d f0 f0           # a3cf |   add [0x2dc0], 0xf0f0
2e e0 e0 c0 2d fd bf           # a3d6 |   and [0x2dc0], 0xbffd
62 e0 1c 10 2e ff              # a3dd |   mov [0x2e10], 0xff
02 e0 e0 10 2e f0 f0           # a3e3 |   add [0x2e10], 0xf0f0
2e e0 e0 10 2e fd bf           # a3ea |   and [0x2e10], 0xbffd
62 e0 1c 60 2e ff              # a3f1 |   mov [0x2e60], 0xff
02 e0 e0 60 2e f0 f0           # a3f7 |   add [0x2e60], 0xf0f0
2e e0 e0 60 2e fd bf           # a3fe |   and [0x2e60], 0xbffd
62 e0 1c b0 2e ff              # a405 |   mov [0x2eb0], 0xff
02 e0 e0 b0 2e f0 f0           # a40b |   add [0x2eb0], 0xf0f0
2e e0 e0 b0 2e fd bf           # a412 |   and [0x2eb0], 0xbffd
62 e0 1c 00 2f ff              # a419 |   mov [0x2f00], 0xff
02 e0 e0 00 2f f0 f0           # a41f |   add [0x2f00], 0xf0f0
2e e0 e0 00 2f fd bf           # a426 |   and [0x2f00], 0xbffd
62 e0 1c 50 2f ff              # a42d |   mov [0x2f50], 0xff
02 e0 e0 50 2f f0 f0           # a433 |   add [0x2f50], 0xf0f0
2e e0 e0 50 2f fd bf           # a43a |   and [0x2f50], 0xbffd
60 20 e0 f5 00                 # a441 |   mov A, 0xf5
60 40 00                       # a446 |   mov B, 0
54 00 e0 1c 00 96 01           # a449 |   mmap 0, 0x9600, 0x1
62 e0 1c a0 2f ff              # a450 |   mov [0x2fa0], 0xff
02 e0 e0 a0 2f f0 f0           # a456 |   add [0x2fa0], 0xf0f0
2e e0 e0 a0 2f fd bf           # a45d |   and [0x2fa0], 0xbffd
62 e0 1c f0 2f ff              # a464 |   mov [0x2ff0], 0xff
02 e0 e0 f0 2f f0 f0           # a46a |   add [0x2ff0], 0xf0f0
2e e0 e0 f0 2f fd bf           # a471 |   and [0x2ff0], 0xbffd
62 e0 1c 40 30 ff              # a478 |   mov [0x3040], 0xff
02 e0 e0 40 30 f0 f0           # a47e |   add [0x3040], 0xf0f0
2e e0 e0 40 30 fd bf           # a485 |   and [0x3040], 0xbffd
62 e0 1c 90 30 ff              # a48c |   mov [0x3090], 0xff
02 e0 e0 90 30 f0 f0           # a492 |   add [0x3090], 0xf0f0
2e e0 e0 90 30 fd bf           # a499 |   and [0x3090], 0xbffd
62 e0 1c e0 30 ff              # a4a0 |   mov [0x30e0], 0xff
02 e0 e0 e0 30 f0 f0           # a4a6 |   add [0x30e0], 0xf0f0
2e e0 e0 e0 30 fd bf           # a4ad |   and [0x30e0], 0xbffd
62 e0 1c 30 31 ff              # a4b4 |   mov [0x3130], 0xff
02 e0 e0 30 31 f0 f0           # a4ba |   add [0x3130], 0xf0f0
2e e0 e0 30 31 fd bf           # a4c1 |   and [0x3130], 0xbffd
62 e0 1c 80 31 ff              # a4c8 |   mov [0x3180], 0xff
02 e0 e0 80 31 f0 f0           # a4ce |   add [0x3180], 0xf0f0
2e e0 e0 80 31 fd bf           # a4d5 |   and [0x3180], 0xbffd
62 e0 1c d0 31 ff              # a4dc |   mov [0x31d0], 0xff
02 e0 e0 d0 31 f0 f0           # a4e2 |   add [0x31d0], 0xf0f0
2e e0 e0 d0 31 fd bf           # a4e9 |   and [0x31d0], 0xbffd
62 e0 1c 20 32 ff              # a4f0 |   mov [0x3220], 0xff
02 e0 e0 20 32 f0 f0           # a4f6 |   add [0x3220], 0xf0f0
2e e0 e0 20 32 fd bf           # a4fd |   and [0x3220], 0xbffd
62 e0 1c 70 32 ff              # a504 |   mov [0x3270], 0xff
02 e0 e0 70 32 f0 f0           # a50a |   add [0x3270], 0xf0f0
2e e0 e0 70 32 fd bf           # a511 |   and [0x3270], 0xbffd
60 20 e0 f6 00                 # a518 |   mov A, 0xf6
60 40 00                       # a51d |   mov B, 0
54 00 e0 1c 00 96 01           # a520 |   mmap 0, 0x9600, 0x1
62 e0 1c c0 32 ff              # a527 |   mov [0x32c0], 0xff
02 e0 e0 c0 32 f0 f0           # a52d |   add [0x32c0], 0xf0f0
2e e0 e0 c0 32 fd bf           # a534 |   and [0x32c0], 0xbffd
62 e0 1c 10 33 ff              # a53b |   mov [0x3310], 0xff
02 e0 e0 10 33 f0 f0           # a541 |   add [0x3310], 0xf0f0
2e e0 e0 10 33 fd bf           # a548 |   and [0x3310], 0xbffd
62 e0 1c 60 33 ff              # a54f |   mov [0x3360], 0xff
02 e0 e0 60 33 f0 f0           # a555 |   add [0x3360], 0xf0f0
2e e0 e0 60 33 fd bf           # a55c |   and [0x3360], 0xbffd
62 e0 1c b0 33 ff              # a563 |   mov [0x33b0], 0xff
02 e0 e0 b0 33 f0 f0           # a569 |   add [0x33b0], 0xf0f0
2e e0 e0 b0 33 fd bf           # a570 |   and [0x33b0], 0xbffd
62 e0 1c 00 34 ff              # a577 |   mov [0x3400], 0xff
02 e0 e0 00 34 f0 f0           # a57d |   add [0x3400], 0xf0f0
2e e0 e0 00 34 fd bf           # a584 |   and [0x3400], 0xbffd
62 e0 1c 50 34 ff              # a58b |   mov [0x3450], 0xff
02 e0 e0 50 34 f0 f0           # a591 |   add [0x3450], 0xf0f0
2e e0 e0 50 34 fd bf           # a598 |   and [0x3450], 0xbffd
62 e0 1c a0 34 ff              # a59f |   mov [0x34a0], 0xff
02 e0 e0 a0 34 f0 f0           # a5a5 |   add [0x34a0], 0xf0f0
2e e0 e0 a0 34 fd bf           # a5ac |   and [0x34a0], 0xbffd
62 e0 1c f0 34 ff              # a5b3 |   mov [0x34f0], 0xff
02 e0 e0 f0 34 f0 f0           # a5b9 |   add [0x34f0], 0xf0f0
2e e0 e0 f0 34 fd bf           # a5c0 |   and [0x34f0], 0xbffd
62 e0 1c 40 35 ff              # a5c7 |   mov [0x3540], 0xff
02 e0 e0 40 35 f0 f0           # a5cd |   add [0x3540], 0xf0f0
2e e0 e0 40 35 fd bf           # a5d4 |   and [0x3540], 0xbffd
62 e0 1c 90 35 ff              # a5db |   mov [0x3590], 0xff
02 e0 e0 90 35 f0 f0           # a5e1 |   add [0x3590], 0xf0f0
2e e0 e0 90 35 fd bf           # a5e8 |   and [0x3590], 0xbffd
60 20 e0 f7 00                 # a5ef |   mov A, 0xf7
60 40 00                       # a5f4 |   mov B, 0
54 00 e0 1c 00 96 01           # a5f7 |   mmap 0, 0x9600, 0x1
62 e0 1c e0 35 ff              # a5fe |   mov [0x35e0], 0xff
02 e0 e0 e0 35 f0 f0           # a604 |   add [0x35e0], 0xf0f0
2e e0 e0 e0 35 fd bf           # a60b |   and [0x35e0], 0xbffd
62 e0 1c 30 36 ff              # a612 |   mov [0x3630], 0xff
02 e0 e0 30 36 f0 f0           # a618 |   add [0x3630], 0xf0f0
2e e0 e0 30 36 fd bf           # a61f |   and [0x3630], 0xbffd
62 e0 1c 80 36 ff              # a626 |   mov [0x3680], 0xff
02 e0 e0 80 36 f0 f0           # a62c |   add [0x3680], 0xf0f0
2e e0 e0 80 36 fd bf           # a633 |   and [0x3680], 0xbffd
62 e0 1c d0 36 ff              # a63a |   mov [0x36d0], 0xff
02 e0 e0 d0 36 f0 f0           # a640 |   add [0x36d0], 0xf0f0
2e e0 e0 d0 36 fd bf           # a647 |   and [0x36d0], 0xbffd
62 e0 1c 20 37 ff              # a64e |   mov [0x3720], 0xff
02 e0 e0 20 37 f0 f0           # a654 |   add [0x3720], 0xf0f0
2e e0 e0 20 37 fd bf           # a65b |   and [0x3720], 0xbffd
62 e0 1c 70 37 ff              # a662 |   mov [0x3770], 0xff
02 e0 e0 70 37 f0 f0           # a668 |   add [0x3770], 0xf0f0
2e e0 e0 70 37 fd bf           # a66f |   and [0x3770], 0xbffd
62 e0 1c c0 37 ff              # a676 |   mov [0x37c0], 0xff
02 e0 e0 c0 37 f0 f0           # a67c |   add [0x37c0], 0xf0f0
2e e0 e0 c0 37 fd bf           # a683 |   and [0x37c0], 0xbffd
62 e0 1c 10 38 ff              # a68a |   mov [0x3810], 0xff
02 e0 e0 10 38 f0 f0           # a690 |   add [0x3810], 0xf0f0
2e e0 e0 10 38 fd bf           # a697 |   and [0x3810], 0xbffd
62 e0 1c 60 38 ff              # a69e |   mov [0x3860], 0xff
02 e0 e0 60 38 f0 f0           # a6a4 |   add [0x3860], 0xf0f0
2e e0 e0 60 38 fd bf           # a6ab |   and [0x3860], 0xbffd
62 e0 1c b0 38 ff              # a6b2 |   mov [0x38b0], 0xff
02 e0 e0 b0 38 f0 f0           # a6b8 |   add [0x38b0], 0xf0f0
2e e0 e0 b0 38 fd bf           # a6bf |   and [0x38b0], 0xbffd
60 20 e0 f3 00                 # a6c6 |   mov A, 0xf3
60 40 00                       # a6cb |   mov B, 0
54 00 e0 1c 00 96 01           # a6ce |   mmap 0, 0x9600, 0x1
62 e0 e0 fe 0f ff 00           # a6d5 |   mov [0xffe], 0xff
62 e0 1c 00 10 ff              # a6dc |   mov [0x1000], 0xff
62 e0 e0 02 10 00 ff           # a6e2 |   mov [0x1002], 0xff00
62 e0 e0 4e 10 ff 00           # a6e9 |   mov [0x104e], 0xff
62 e0 1c 50 10 ff              # a6f0 |   mov [0x1050], 0xff
62 e0 e0 52 10 00 ff           # a6f6 |   mov [0x1052], 0xff00
62 e0 e0 9e 10 ff 00           # a6fd |   mov [0x109e], 0xff
62 e0 1c a0 10 ff              # a704 |   mov [0x10a0], 0xff
62 e0 e0 a2 10 00 ff           # a70a |   mov [0x10a2], 0xff00
62 e0 e0 ee 10 ff 00           # a711 |   mov [0x10ee], 0xff
62 e0 1c f0 10 ff              # a718 |   mov [0x10f0], 0xff
62 e0 e0 f2 10 00 ff           # a71e |   mov [0x10f2], 0xff00
62 e0 e0 3e 11 ff 00           # a725 |   mov [0x113e], 0xff
62 e0 1c 40 11 ff              # a72c |   mov [0x1140], 0xff
62 e0 e0 42 11 00 ff           # a732 |   mov [0x1142], 0xff00
62 e0 e0 8e 11 ff 00           # a739 |   mov [0x118e], 0xff
62 e0 1c 90 11 ff              # a740 |   mov [0x1190], 0xff
62 e0 e0 92 11 00 ff           # a746 |   mov [0x1192], 0xff00
62 e0 e0 de 11 ff 00           # a74d |   mov [0x11de], 0xff
62 e0 1c e0 11 ff              # a754 |   mov [0x11e0], 0xff
62 e0 e0 e2 11 00 ff           # a75a |   mov [0x11e2], 0xff00
62 e0 e0 2e 12 ff 00           # a761 |   mov [0x122e], 0xff
62 e0 1c 30 12 ff              # a768 |   mov [0x1230], 0xff
62 e0 e0 32 12 00 ff           # a76e |   mov [0x1232], 0xff00
62 e0 e0 7e 12 ff 00           # a775 |   mov [0x127e], 0xff
62 e0 1c 80 12 ff              # a77c |   mov [0x1280], 0xff
62 e0 e0 82 12 00 ff           # a782 |   mov [0x1282], 0xff00
62 e0 e0 ce 12 ff 00           # a789 |   mov [0x12ce], 0xff
62 e0 1c d0 12 ff              # a790 |   mov [0x12d0], 0xff
62 e0 e0 d2 12 00 ff           # a796 |   mov [0x12d2], 0xff00
62 e0 e0 1e 13 ff 00           # a79d |   mov [0x131e], 0xff
62 e0 1c 20 13 fe              # a7a4 |   mov [0x1320], 0xfe
62 e0 e0 22 13 00 ff           # a7aa |   mov [0x1322], 0xff00
62 e0 e0 6e 13 ff 00           # a7b1 |   mov [0x136e], 0xff
62 e0 1c 70 13 fe              # a7b8 |   mov [0x1370], 0xfe
62 e0 e0 72 13 00 ff           # a7be |   mov [0x1372], 0xff00
62 e0 e0 be 13 ff 00           # a7c5 |   mov [0x13be], 0xff
62 e0 1c c0 13 fe              # a7cc |   mov [0x13c0], 0xfe
62 e0 e0 c2 13 00 ff           # a7d2 |   mov [0x13c2], 0xff00
62 e0 e0 0e 14 ff 00           # a7d9 |   mov [0x140e], 0xff
62 e0 1c 10 14 fe              # a7e0 |   mov [0x1410], 0xfe
62 e0 e0 12 14 00 ff           # a7e6 |   mov [0x1412], 0xff00
62 e0 e0 5e 14 ff 00           # a7ed |   mov [0x145e], 0xff
62 e0 1c 60 14 fe              # a7f4 |   mov [0x1460], 0xfe
62 e0 e0 62 14 00 ff           # a7fa |   mov [0x1462], 0xff00
62 e0 e0 ae 14 ff 00           # a801 |   mov [0x14ae], 0xff
62 e0 1c b0 14 fe              # a808 |   mov [0x14b0], 0xfe
62 e0 e0 b2 14 00 ff           # a80e |   mov [0x14b2], 0xff00
62 e0 e0 fe 14 ff 00           # a815 |   mov [0x14fe], 0xff
62 e0 1c 00 15 fe              # a81c |   mov [0x1500], 0xfe
62 e0 e0 02 15 00 ff           # a822 |   mov [0x1502], 0xff00
62 e0 e0 4e 15 ff 00           # a829 |   mov [0x154e], 0xff
62 e0 1c 50 15 fe              # a830 |   mov [0x1550], 0xfe
62 e0 e0 52 15 00 ff           # a836 |   mov [0x1552], 0xff00
62 e0 e0 9e 15 ff 00           # a83d |   mov [0x159e], 0xff
62 e0 1c a0 15 fe              # a844 |   mov [0x15a0], 0xfe
62 e0 e0 a2 15 00 ff           # a84a |   mov [0x15a2], 0xff00
62 e0 e0 ee 15 ff 00           # a851 |   mov [0x15ee], 0xff
62 e0 1c f0 15 fe              # a858 |   mov [0x15f0], 0xfe
62 e0 e0 f2 15 00 ff           # a85e |   mov [0x15f2], 0xff00
62 e0 e0 3e 16 ff 00           # a865 |   mov [0x163e], 0xff
62 e0 e0 40 16 00 ff           # a86c |   mov [0x1640], 0xff00
62 e0 e0 42 16 00 ff           # a873 |   mov [0x1642], 0xff00
62 e0 e0 8e 16 ff 00           # a87a |   mov [0x168e], 0xff
62 e0 e0 90 16 00 ff           # a881 |   mov [0x1690], 0xff00
62 e0 e0 92 16 00 ff           # a888 |   mov [0x1692], 0xff00
62 e0 e0 de 16 ff 00           # a88f |   mov [0x16de], 0xff
62 e0 e0 e0 16 00 ff           # a896 |   mov [0x16e0], 0xff00
62 e0 e0 e2 16 00 ff           # a89d |   mov [0x16e2], 0xff00
62 e0 e0 2e 17 ff 00           # a8a4 |   mov [0x172e], 0xff
62 e0 e0 30 17 00 ff           # a8ab |   mov [0x1730], 0xff00
62 e0 e0 32 17 00 ff           # a8b2 |   mov [0x1732], 0xff00
62 e0 e0 7e 17 ff 00           # a8b9 |   mov [0x177e], 0xff
62 e0 e0 80 17 00 ff           # a8c0 |   mov [0x1780], 0xff00
62 e0 e0 82 17 00 ff           # a8c7 |   mov [0x1782], 0xff00
62 e0 e0 ce 17 ff 00           # a8ce |   mov [0x17ce], 0xff
62 e0 e0 d0 17 00 ff           # a8d5 |   mov [0x17d0], 0xff00
62 e0 e0 d2 17 00 ff           # a8dc |   mov [0x17d2], 0xff00
62 e0 e0 1e 18 ff 00           # a8e3 |   mov [0x181e], 0xff
62 e0 e0 20 18 00 ff           # a8ea |   mov [0x1820], 0xff00
62 e0 e0 22 18 00 ff           # a8f1 |   mov [0x1822], 0xff00
62 e0 e0 6e 18 ff 00           # a8f8 |   mov [0x186e], 0xff
62 e0 e0 70 18 00 ff           # a8ff |   mov [0x1870], 0xff00
62 e0 e0 72 18 00 ff           # a906 |   mov [0x1872], 0xff00
62 e0 e0 be 18 ff 00           # a90d |   mov [0x18be], 0xff
62 e0 e0 c0 18 00 ff           # a914 |   mov [0x18c0], 0xff00
62 e0 e0 c2 18 00 ff           # a91b |   mov [0x18c2], 0xff00
62 e0 e0 0e 19 ff 00           # a922 |   mov [0x190e], 0xff
62 e0 e0 10 19 00 ff           # a929 |   mov [0x1910], 0xff00
62 e0 e0 12 19 00 ff           # a930 |   mov [0x1912], 0xff00
62 e0 e0 5e 19 ff 00           # a937 |   mov [0x195e], 0xff
62 e0 e0 60 19 0f 0f           # a93e |   mov [0x1960], 0xf0f
62 e0 e0 62 19 00 ff           # a945 |   mov [0x1962], 0xff00
62 e0 e0 ae 19 ff 00           # a94c |   mov [0x19ae], 0xff
62 e0 e0 b0 19 0f 0f           # a953 |   mov [0x19b0], 0xf0f
62 e0 e0 b2 19 00 ff           # a95a |   mov [0x19b2], 0xff00
62 e0 e0 fe 19 ff 00           # a961 |   mov [0x19fe], 0xff
62 e0 e0 00 1a 0f 0f           # a968 |   mov [0x1a00], 0xf0f
62 e0 e0 02 1a 00 ff           # a96f |   mov [0x1a02], 0xff00
62 e0 e0 4e 1a ff 00           # a976 |   mov [0x1a4e], 0xff
62 e0 e0 50 1a 0f 0f           # a97d |   mov [0x1a50], 0xf0f
62 e0 e0 52 1a 00 ff           # a984 |   mov [0x1a52], 0xff00
62 e0 e0 9e 1a ff 00           # a98b |   mov [0x1a9e], 0xff
62 e0 e0 a0 1a 0f 0f           # a992 |   mov [0x1aa0], 0xf0f
62 e0 e0 a2 1a 00 ff           # a999 |   mov [0x1aa2], 0xff00
62 e0 e0 ee 1a ff 00           # a9a0 |   mov [0x1aee], 0xff
62 e0 e0 f0 1a 0f 0f           # a9a7 |   mov [0x1af0], 0xf0f
62 e0 e0 f2 1a 00 ff           # a9ae |   mov [0x1af2], 0xff00
62 e0 e0 3e 1b ff 00           # a9b5 |   mov [0x1b3e], 0xff
62 e0 e0 40 1b 0f 0f           # a9bc |   mov [0x1b40], 0xf0f
62 e0 e0 42 1b 00 ff           # a9c3 |   mov [0x1b42], 0xff00
62 e0 e0 8e 1b ff 00           # a9ca |   mov [0x1b8e], 0xff
62 e0 e0 90 1b 0f 0f           # a9d1 |   mov [0x1b90], 0xf0f
62 e0 e0 92 1b 00 ff           # a9d8 |   mov [0x1b92], 0xff00
62 e0 e0 de 1b ff 00           # a9df |   mov [0x1bde], 0xff
62 e0 e0 e0 1b 0f 0f           # a9e6 |   mov [0x1be0], 0xf0f
62 e0 e0 e2 1b 00 ff           # a9ed |   mov [0x1be2], 0xff00
62 e0 e0 2e 1c ff 00           # a9f4 |   mov [0x1c2e], 0xff
62 e0 e0 30 1c 0f 0f           # a9fb |   mov [0x1c30], 0xf0f
62 e0 e0 32 1c 00 ff           # aa02 |   mov [0x1c32], 0xff00
60 fc 00                       # aa09 |   mov E, 0
62 e0 00 0a ff                 # aa0c |   mov [0xff0a], 0
                               #      | _B_fn_start_1:
60 20 00                       # aa11 |   mov A, 0
                               #      | _B_fn_start_2:
e8 20 1c f8 ff 11 00           # aa14 |   jeq A, 0xff, ${_E_fn_start_2}:rel + PC
44 20                          # aa1b |   inc A
5c f8 86 00                    # aa1d |   call ${fn_check_ps2}:rel + PC
58 f8 f3 ff                    # aa21 |   jmp ${_B_fn_start_2}:rel + PC
                               #      | _E_fn_start_2:
46 e0 0a ff                    # aa25 |   inc [0xff0a]
44 fc                          # aa29 |   inc E
62 e0 fc 00 10                 # aa2b |   mov [0x1000], E
62 e0 fc b0 0f                 # aa30 |   mov [0xfb0], E
62 e0 fc 60 0f                 # aa35 |   mov [0xf60], E
62 e0 fc 10 0f                 # aa3a |   mov [0xf10], E
62 e0 fc c0 0e                 # aa3f |   mov [0xec0], E
62 e0 fc 70 0e                 # aa44 |   mov [0xe70], E
62 e0 fc 20 0e                 # aa49 |   mov [0xe20], E
62 e0 fc d0 0d                 # aa4e |   mov [0xdd0], E
62 e0 fc 80 0d                 # aa53 |   mov [0xd80], E
62 e0 fc 30 0d                 # aa58 |   mov [0xd30], E
58 f8 b4 ff                    # aa5d |   jmp ${_B_fn_start_1}:rel + PC
                               #      | _E_fn_start_1:
d8                             # aa61 |   halt
dc                             # aa62 |   ret
                               #      | end_fn_start:
                               #      | 
                               #      | fn_send_data:
e0 20                          # aa63 |   push A
e0 40                          # aa65 |   push B
e0 60                          # aa67 |   push C
60 60 1c 11                    # aa69 |   mov C, 0x11
                               #      | _B_fn_send_data_1:
61 40 20                       # aa6d |   mov B, [A]
2c 40 e0 ff 00                 # aa70 |   and B, 0xff
e8 40 00 f8 27 00              # aa75 |   jeq B, 0, ${_E_fn_send_data_1}:rel + PC
                               #      | _B_fn_send_data_2:
f0 60 1c f8 10 14 00           # aa7b |   jlt C, 0x10, ${_E_fn_send_data_2}:rel + PC
61 60 e0 04 ff                 # aa82 |   mov C, [0xff04]
2c 60 1c 3f                    # aa87 |   and C, 0x3f
58 f8 f0 ff                    # aa8b |   jmp ${_B_fn_send_data_2}:rel + PC
                               #      | _E_fn_send_data_2:
62 e0 40 00 ff                 # aa8f |   mov [0xff00], B
44 20                          # aa94 |   inc A
44 60                          # aa96 |   inc C
58 f8 d5 ff                    # aa98 |   jmp ${_B_fn_send_data_1}:rel + PC
                               #      | _E_fn_send_data_1:
e4 60                          # aa9c |   pop C
e4 40                          # aa9e |   pop B
e4 20                          # aaa0 |   pop A
dc                             # aaa2 |   ret
                               #      | end_fn_send_data:
                               #      | 
                               #      | fn_check_ps2:
e0 20                          # aaa3 |   push A
e0 40                          # aaa5 |   push B
e0 fe                          # aaa7 |   push G
e0 ff                          # aaa9 |   push H
                               #      | _B_fn_check_ps2_1:
61 fe e0 06 ff                 # aaab |   mov G, [0xff06]
ac ff fe e0 00 80              # aab0 |   and H, G, 0x8000
e8 ff 00 f8 28 00              # aab6 |   jeq H, 0, ${_E_fn_check_ps2_1}:rel + PC
60 20 e0 5a ab                 # aabc |   mov A, ${const_data_2}
5c f8 a2 ff                    # aac1 |   call ${fn_send_data}:rel + PC
60 20 e0 62 ab                 # aac5 |   mov A, ${var_uart_buf}
60 40 fe                       # aaca |   mov B, G
5c f8 1a 00                    # aacd |   call ${fn_put_hex_16}:rel + PC
5c f8 92 ff                    # aad1 |   call ${fn_send_data}:rel + PC
60 20 e0 60 ab                 # aad5 |   mov A, ${const_data_3}
5c f8 89 ff                    # aada |   call ${fn_send_data}:rel + PC
                               #      | _E_fn_check_ps2_1:
e4 ff                          # aade |   pop H
e4 fe                          # aae0 |   pop G
e4 40                          # aae2 |   pop B
e4 20                          # aae4 |   pop A
dc                             # aae6 |   ret
                               #      | end_fn_check_ps2:
                               #      | 
                               #      | fn_put_hex_16:
e0 20                          # aae7 |   push A
e0 40                          # aae9 |   push B
e0 60                          # aaeb |   push C
60 60 40                       # aaed |   mov C, B
a0 40 60 1c 0c                 # aaf0 |   shr B, C, 0xc
2c 40 1c 0f                    # aaf5 |   and B, 0xf
5c f8 39 00                    # aaf9 |   call ${fn_put_hex_4}:rel + PC
44 20                          # aafd |   inc A
a0 40 60 1c 08                 # aaff |   shr B, C, 0x8
2c 40 1c 0f                    # ab04 |   and B, 0xf
5c f8 2a 00                    # ab08 |   call ${fn_put_hex_4}:rel + PC
44 20                          # ab0c |   inc A
a0 40 60 1c 04                 # ab0e |   shr B, C, 0x4
2c 40 1c 0f                    # ab13 |   and B, 0xf
5c f8 1b 00                    # ab17 |   call ${fn_put_hex_4}:rel + PC
44 20                          # ab1b |   inc A
a0 40 60 00                    # ab1d |   shr B, C, 0
2c 40 1c 0f                    # ab21 |   and B, 0xf
5c f8 0d 00                    # ab25 |   call ${fn_put_hex_4}:rel + PC
44 20                          # ab29 |   inc A
e4 60                          # ab2b |   pop C
e4 40                          # ab2d |   pop B
e4 20                          # ab2f |   pop A
dc                             # ab31 |   ret
                               #      | end_fn_put_hex_16:
                               #      | 
                               #      | fn_put_hex_4:
60 ff 40                       # ab32 |   mov H, B
                               #      | _B_fn_put_hex_4_2:
f8 ff 1c f8 09 0f 00           # ab35 |   jgt H, 0x9, ${_E_fn_put_hex_4_2}:rel + PC
00 ff 1c 30                    # ab3c |   add H, 0x30
58 f8 08 00                    # ab40 |   jmp ${_L_fn_put_hex_4_1}:rel + PC
                               #      | _E_fn_put_hex_4_2:
00 ff 1c 57                    # ab44 |   add H, 0x57
                               #      | _L_fn_put_hex_4_1:
62 20 ff                       # ab48 |   mov [A], H
dc                             # ab4b |   ret
                               #      | end_fn_put_hex_4:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_data_1:
48 65 6c 6c 6f 20 57 6f 72 6c 64 21 0a 00 # ab4c |   .data str:"Hello World!\n"
                               #      | const_data_2:
50 53 32 3a 20 00              # ab5a |   .data str:"PS2: "
                               #      | const_data_3:
0a 00                          # ab60 |   .data str:"\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | var_uart_buf:
                               # ab62 |   .bss size:130
                               #      | SECTION_END_static_data:
                               #      | 
