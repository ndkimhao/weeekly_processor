                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_start:
60 20 e0 f8 00                 # a000 |   mov A, 0xf8
60 40 00                       # a005 |   mov B, 0
54 00 e0 1c 00 96 01           # a008 |   mmap 0, 0x9600, 0x1
62 e0 1c 00 20 ff              # a00f |   mov [0x2000], 0xff
62 e0 1c 50 20 ff              # a015 |   mov [0x2050], 0xff
62 e0 1c a0 20 ff              # a01b |   mov [0x20a0], 0xff
62 e0 1c f0 20 ff              # a021 |   mov [0x20f0], 0xff
62 e0 1c 40 21 ff              # a027 |   mov [0x2140], 0xff
62 e0 1c 90 21 ff              # a02d |   mov [0x2190], 0xff
62 e0 1c e0 21 ff              # a033 |   mov [0x21e0], 0xff
62 e0 1c 30 22 ff              # a039 |   mov [0x2230], 0xff
62 e0 1c 80 22 ff              # a03f |   mov [0x2280], 0xff
62 e0 1c d0 22 ff              # a045 |   mov [0x22d0], 0xff
60 20 e0 f9 00                 # a04b |   mov A, 0xf9
60 40 00                       # a050 |   mov B, 0
54 00 e0 1c 00 96 01           # a053 |   mmap 0, 0x9600, 0x1
62 e0 1c 20 23 ff              # a05a |   mov [0x2320], 0xff
62 e0 1c 70 23 ff              # a060 |   mov [0x2370], 0xff
62 e0 1c c0 23 ff              # a066 |   mov [0x23c0], 0xff
62 e0 1c 10 24 ff              # a06c |   mov [0x2410], 0xff
62 e0 1c 60 24 ff              # a072 |   mov [0x2460], 0xff
62 e0 1c b0 24 ff              # a078 |   mov [0x24b0], 0xff
62 e0 1c 00 25 ff              # a07e |   mov [0x2500], 0xff
62 e0 1c 50 25 ff              # a084 |   mov [0x2550], 0xff
62 e0 1c a0 25 ff              # a08a |   mov [0x25a0], 0xff
62 e0 1c f0 25 ff              # a090 |   mov [0x25f0], 0xff
60 20 e0 fa 00                 # a096 |   mov A, 0xfa
60 40 00                       # a09b |   mov B, 0
54 00 e0 1c 00 96 01           # a09e |   mmap 0, 0x9600, 0x1
62 e0 1c 40 26 ff              # a0a5 |   mov [0x2640], 0xff
62 e0 1c 90 26 ff              # a0ab |   mov [0x2690], 0xff
62 e0 1c e0 26 ff              # a0b1 |   mov [0x26e0], 0xff
62 e0 1c 30 27 ff              # a0b7 |   mov [0x2730], 0xff
62 e0 1c 80 27 ff              # a0bd |   mov [0x2780], 0xff
62 e0 1c d0 27 ff              # a0c3 |   mov [0x27d0], 0xff
62 e0 1c 20 28 ff              # a0c9 |   mov [0x2820], 0xff
62 e0 1c 70 28 ff              # a0cf |   mov [0x2870], 0xff
62 e0 1c c0 28 ff              # a0d5 |   mov [0x28c0], 0xff
62 e0 1c 10 29 ff              # a0db |   mov [0x2910], 0xff
60 20 e0 fb 00                 # a0e1 |   mov A, 0xfb
60 40 00                       # a0e6 |   mov B, 0
54 00 e0 1c 00 96 01           # a0e9 |   mmap 0, 0x9600, 0x1
62 e0 1c 60 29 ff              # a0f0 |   mov [0x2960], 0xff
62 e0 1c b0 29 ff              # a0f6 |   mov [0x29b0], 0xff
62 e0 1c 00 2a ff              # a0fc |   mov [0x2a00], 0xff
62 e0 1c 50 2a ff              # a102 |   mov [0x2a50], 0xff
62 e0 1c a0 2a ff              # a108 |   mov [0x2aa0], 0xff
62 e0 1c f0 2a ff              # a10e |   mov [0x2af0], 0xff
62 e0 1c 40 2b ff              # a114 |   mov [0x2b40], 0xff
62 e0 1c 90 2b ff              # a11a |   mov [0x2b90], 0xff
62 e0 1c e0 2b ff              # a120 |   mov [0x2be0], 0xff
62 e0 1c 30 2c ff              # a126 |   mov [0x2c30], 0xff
60 20 e0 f8 00                 # a12c |   mov A, 0xf8
60 40 00                       # a131 |   mov B, 0
54 00 e0 1c 00 96 01           # a134 |   mmap 0, 0x9600, 0x1
62 e0 e0 fe 0f ff 00           # a13b |   mov [0xffe], 0xff
62 e0 1c 00 10 ff              # a142 |   mov [0x1000], 0xff
62 e0 e0 02 10 00 ff           # a148 |   mov [0x1002], 0xff00
62 e0 e0 4e 10 ff 00           # a14f |   mov [0x104e], 0xff
62 e0 1c 50 10 ff              # a156 |   mov [0x1050], 0xff
62 e0 e0 52 10 00 ff           # a15c |   mov [0x1052], 0xff00
62 e0 e0 9e 10 ff 00           # a163 |   mov [0x109e], 0xff
62 e0 1c a0 10 ff              # a16a |   mov [0x10a0], 0xff
62 e0 e0 a2 10 00 ff           # a170 |   mov [0x10a2], 0xff00
62 e0 e0 ee 10 ff 00           # a177 |   mov [0x10ee], 0xff
62 e0 1c f0 10 ff              # a17e |   mov [0x10f0], 0xff
62 e0 e0 f2 10 00 ff           # a184 |   mov [0x10f2], 0xff00
62 e0 e0 3e 11 ff 00           # a18b |   mov [0x113e], 0xff
62 e0 1c 40 11 ff              # a192 |   mov [0x1140], 0xff
62 e0 e0 42 11 00 ff           # a198 |   mov [0x1142], 0xff00
62 e0 e0 8e 11 ff 00           # a19f |   mov [0x118e], 0xff
62 e0 1c 90 11 ff              # a1a6 |   mov [0x1190], 0xff
62 e0 e0 92 11 00 ff           # a1ac |   mov [0x1192], 0xff00
62 e0 e0 de 11 ff 00           # a1b3 |   mov [0x11de], 0xff
62 e0 1c e0 11 ff              # a1ba |   mov [0x11e0], 0xff
62 e0 e0 e2 11 00 ff           # a1c0 |   mov [0x11e2], 0xff00
62 e0 e0 2e 12 ff 00           # a1c7 |   mov [0x122e], 0xff
62 e0 1c 30 12 ff              # a1ce |   mov [0x1230], 0xff
62 e0 e0 32 12 00 ff           # a1d4 |   mov [0x1232], 0xff00
62 e0 e0 7e 12 ff 00           # a1db |   mov [0x127e], 0xff
62 e0 1c 80 12 ff              # a1e2 |   mov [0x1280], 0xff
62 e0 e0 82 12 00 ff           # a1e8 |   mov [0x1282], 0xff00
62 e0 e0 ce 12 ff 00           # a1ef |   mov [0x12ce], 0xff
62 e0 1c d0 12 ff              # a1f6 |   mov [0x12d0], 0xff
62 e0 e0 d2 12 00 ff           # a1fc |   mov [0x12d2], 0xff00
62 e0 e0 1e 13 ff 00           # a203 |   mov [0x131e], 0xff
62 e0 1c 20 13 fe              # a20a |   mov [0x1320], 0xfe
62 e0 e0 22 13 00 ff           # a210 |   mov [0x1322], 0xff00
62 e0 e0 6e 13 ff 00           # a217 |   mov [0x136e], 0xff
62 e0 1c 70 13 fe              # a21e |   mov [0x1370], 0xfe
62 e0 e0 72 13 00 ff           # a224 |   mov [0x1372], 0xff00
62 e0 e0 be 13 ff 00           # a22b |   mov [0x13be], 0xff
62 e0 1c c0 13 fe              # a232 |   mov [0x13c0], 0xfe
62 e0 e0 c2 13 00 ff           # a238 |   mov [0x13c2], 0xff00
62 e0 e0 0e 14 ff 00           # a23f |   mov [0x140e], 0xff
62 e0 1c 10 14 fe              # a246 |   mov [0x1410], 0xfe
62 e0 e0 12 14 00 ff           # a24c |   mov [0x1412], 0xff00
62 e0 e0 5e 14 ff 00           # a253 |   mov [0x145e], 0xff
62 e0 1c 60 14 fe              # a25a |   mov [0x1460], 0xfe
62 e0 e0 62 14 00 ff           # a260 |   mov [0x1462], 0xff00
62 e0 e0 ae 14 ff 00           # a267 |   mov [0x14ae], 0xff
62 e0 1c b0 14 fe              # a26e |   mov [0x14b0], 0xfe
62 e0 e0 b2 14 00 ff           # a274 |   mov [0x14b2], 0xff00
62 e0 e0 fe 14 ff 00           # a27b |   mov [0x14fe], 0xff
62 e0 1c 00 15 fe              # a282 |   mov [0x1500], 0xfe
62 e0 e0 02 15 00 ff           # a288 |   mov [0x1502], 0xff00
62 e0 e0 4e 15 ff 00           # a28f |   mov [0x154e], 0xff
62 e0 1c 50 15 fe              # a296 |   mov [0x1550], 0xfe
62 e0 e0 52 15 00 ff           # a29c |   mov [0x1552], 0xff00
62 e0 e0 9e 15 ff 00           # a2a3 |   mov [0x159e], 0xff
62 e0 1c a0 15 fe              # a2aa |   mov [0x15a0], 0xfe
62 e0 e0 a2 15 00 ff           # a2b0 |   mov [0x15a2], 0xff00
62 e0 e0 ee 15 ff 00           # a2b7 |   mov [0x15ee], 0xff
62 e0 1c f0 15 fe              # a2be |   mov [0x15f0], 0xfe
62 e0 e0 f2 15 00 ff           # a2c4 |   mov [0x15f2], 0xff00
62 e0 e0 3e 16 ff 00           # a2cb |   mov [0x163e], 0xff
62 e0 e0 40 16 00 ff           # a2d2 |   mov [0x1640], 0xff00
62 e0 e0 42 16 00 ff           # a2d9 |   mov [0x1642], 0xff00
62 e0 e0 8e 16 ff 00           # a2e0 |   mov [0x168e], 0xff
62 e0 e0 90 16 00 ff           # a2e7 |   mov [0x1690], 0xff00
62 e0 e0 92 16 00 ff           # a2ee |   mov [0x1692], 0xff00
62 e0 e0 de 16 ff 00           # a2f5 |   mov [0x16de], 0xff
62 e0 e0 e0 16 00 ff           # a2fc |   mov [0x16e0], 0xff00
62 e0 e0 e2 16 00 ff           # a303 |   mov [0x16e2], 0xff00
62 e0 e0 2e 17 ff 00           # a30a |   mov [0x172e], 0xff
62 e0 e0 30 17 00 ff           # a311 |   mov [0x1730], 0xff00
62 e0 e0 32 17 00 ff           # a318 |   mov [0x1732], 0xff00
62 e0 e0 7e 17 ff 00           # a31f |   mov [0x177e], 0xff
62 e0 e0 80 17 00 ff           # a326 |   mov [0x1780], 0xff00
62 e0 e0 82 17 00 ff           # a32d |   mov [0x1782], 0xff00
62 e0 e0 ce 17 ff 00           # a334 |   mov [0x17ce], 0xff
62 e0 e0 d0 17 00 ff           # a33b |   mov [0x17d0], 0xff00
62 e0 e0 d2 17 00 ff           # a342 |   mov [0x17d2], 0xff00
62 e0 e0 1e 18 ff 00           # a349 |   mov [0x181e], 0xff
62 e0 e0 20 18 00 ff           # a350 |   mov [0x1820], 0xff00
62 e0 e0 22 18 00 ff           # a357 |   mov [0x1822], 0xff00
62 e0 e0 6e 18 ff 00           # a35e |   mov [0x186e], 0xff
62 e0 e0 70 18 00 ff           # a365 |   mov [0x1870], 0xff00
62 e0 e0 72 18 00 ff           # a36c |   mov [0x1872], 0xff00
62 e0 e0 be 18 ff 00           # a373 |   mov [0x18be], 0xff
62 e0 e0 c0 18 00 ff           # a37a |   mov [0x18c0], 0xff00
62 e0 e0 c2 18 00 ff           # a381 |   mov [0x18c2], 0xff00
62 e0 e0 0e 19 ff 00           # a388 |   mov [0x190e], 0xff
62 e0 e0 10 19 00 ff           # a38f |   mov [0x1910], 0xff00
62 e0 e0 12 19 00 ff           # a396 |   mov [0x1912], 0xff00
62 e0 e0 5e 19 ff 00           # a39d |   mov [0x195e], 0xff
62 e0 e0 60 19 0f 0f           # a3a4 |   mov [0x1960], 0xf0f
62 e0 e0 62 19 00 ff           # a3ab |   mov [0x1962], 0xff00
62 e0 e0 ae 19 ff 00           # a3b2 |   mov [0x19ae], 0xff
62 e0 e0 b0 19 0f 0f           # a3b9 |   mov [0x19b0], 0xf0f
62 e0 e0 b2 19 00 ff           # a3c0 |   mov [0x19b2], 0xff00
62 e0 e0 fe 19 ff 00           # a3c7 |   mov [0x19fe], 0xff
62 e0 e0 00 1a 0f 0f           # a3ce |   mov [0x1a00], 0xf0f
62 e0 e0 02 1a 00 ff           # a3d5 |   mov [0x1a02], 0xff00
62 e0 e0 4e 1a ff 00           # a3dc |   mov [0x1a4e], 0xff
62 e0 e0 50 1a 0f 0f           # a3e3 |   mov [0x1a50], 0xf0f
62 e0 e0 52 1a 00 ff           # a3ea |   mov [0x1a52], 0xff00
62 e0 e0 9e 1a ff 00           # a3f1 |   mov [0x1a9e], 0xff
62 e0 e0 a0 1a 0f 0f           # a3f8 |   mov [0x1aa0], 0xf0f
62 e0 e0 a2 1a 00 ff           # a3ff |   mov [0x1aa2], 0xff00
62 e0 e0 ee 1a ff 00           # a406 |   mov [0x1aee], 0xff
62 e0 e0 f0 1a 0f 0f           # a40d |   mov [0x1af0], 0xf0f
62 e0 e0 f2 1a 00 ff           # a414 |   mov [0x1af2], 0xff00
62 e0 e0 3e 1b ff 00           # a41b |   mov [0x1b3e], 0xff
62 e0 e0 40 1b 0f 0f           # a422 |   mov [0x1b40], 0xf0f
62 e0 e0 42 1b 00 ff           # a429 |   mov [0x1b42], 0xff00
62 e0 e0 8e 1b ff 00           # a430 |   mov [0x1b8e], 0xff
62 e0 e0 90 1b 0f 0f           # a437 |   mov [0x1b90], 0xf0f
62 e0 e0 92 1b 00 ff           # a43e |   mov [0x1b92], 0xff00
62 e0 e0 de 1b ff 00           # a445 |   mov [0x1bde], 0xff
62 e0 e0 e0 1b 0f 0f           # a44c |   mov [0x1be0], 0xf0f
62 e0 e0 e2 1b 00 ff           # a453 |   mov [0x1be2], 0xff00
62 e0 e0 2e 1c ff 00           # a45a |   mov [0x1c2e], 0xff
62 e0 e0 30 1c 0f 0f           # a461 |   mov [0x1c30], 0xf0f
62 e0 e0 32 1c 00 ff           # a468 |   mov [0x1c32], 0xff00
60 fc 00                       # a46f |   mov E, 0
62 e0 00 0a ff                 # a472 |   mov [0xff0a], 0
                               #      | _B_fn_start_1:
60 20 00                       # a477 |   mov A, 0
                               #      | _B_fn_start_2:
e8 20 1c f8 ff 10 00           # a47a |   jeq A, 0xff, ${_E_fn_start_2}:rel + PC
44 20                          # a481 |   inc A
08 40 40                       # a483 |   mul B, B
58 f8 f4 ff                    # a486 |   jmp ${_B_fn_start_2}:rel + PC
                               #      | _E_fn_start_2:
46 e0 0a ff                    # a48a |   inc [0xff0a]
44 fc                          # a48e |   inc E
62 e0 fc 00 10                 # a490 |   mov [0x1000], E
62 e0 fc b0 0f                 # a495 |   mov [0xfb0], E
62 e0 fc 60 0f                 # a49a |   mov [0xf60], E
62 e0 fc 10 0f                 # a49f |   mov [0xf10], E
62 e0 fc c0 0e                 # a4a4 |   mov [0xec0], E
62 e0 fc 70 0e                 # a4a9 |   mov [0xe70], E
62 e0 fc 20 0e                 # a4ae |   mov [0xe20], E
62 e0 fc d0 0d                 # a4b3 |   mov [0xdd0], E
62 e0 fc 80 0d                 # a4b8 |   mov [0xd80], E
62 e0 fc 30 0d                 # a4bd |   mov [0xd30], E
58 f8 b5 ff                    # a4c2 |   jmp ${_B_fn_start_1}:rel + PC
                               #      | _E_fn_start_1:
d8                             # a4c6 |   halt
dc                             # a4c7 |   ret
                               #      | end_fn_start:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
