                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_start:
60 20 e0 f0 00                 # a000 |   mov A, 0xf0
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
60 20 e0 f1 00                 # a04b |   mov A, 0xf1
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
60 20 e0 f2 00                 # a096 |   mov A, 0xf2
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
60 20 e0 f3 00                 # a0e1 |   mov A, 0xf3
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
60 20 e0 f4 00                 # a12c |   mov A, 0xf4
60 40 00                       # a131 |   mov B, 0
54 00 e0 1c 00 96 01           # a134 |   mmap 0, 0x9600, 0x1
62 e0 1c 80 2c ff              # a13b |   mov [0x2c80], 0xff
62 e0 1c d0 2c ff              # a141 |   mov [0x2cd0], 0xff
62 e0 1c 20 2d ff              # a147 |   mov [0x2d20], 0xff
62 e0 1c 70 2d ff              # a14d |   mov [0x2d70], 0xff
62 e0 1c c0 2d ff              # a153 |   mov [0x2dc0], 0xff
62 e0 1c 10 2e ff              # a159 |   mov [0x2e10], 0xff
62 e0 1c 60 2e ff              # a15f |   mov [0x2e60], 0xff
62 e0 1c b0 2e ff              # a165 |   mov [0x2eb0], 0xff
62 e0 1c 00 2f ff              # a16b |   mov [0x2f00], 0xff
62 e0 1c 50 2f ff              # a171 |   mov [0x2f50], 0xff
60 20 e0 f5 00                 # a177 |   mov A, 0xf5
60 40 00                       # a17c |   mov B, 0
54 00 e0 1c 00 96 01           # a17f |   mmap 0, 0x9600, 0x1
62 e0 1c a0 2f ff              # a186 |   mov [0x2fa0], 0xff
62 e0 1c f0 2f ff              # a18c |   mov [0x2ff0], 0xff
62 e0 1c 40 30 ff              # a192 |   mov [0x3040], 0xff
62 e0 1c 90 30 ff              # a198 |   mov [0x3090], 0xff
62 e0 1c e0 30 ff              # a19e |   mov [0x30e0], 0xff
62 e0 1c 30 31 ff              # a1a4 |   mov [0x3130], 0xff
62 e0 1c 80 31 ff              # a1aa |   mov [0x3180], 0xff
62 e0 1c d0 31 ff              # a1b0 |   mov [0x31d0], 0xff
62 e0 1c 20 32 ff              # a1b6 |   mov [0x3220], 0xff
62 e0 1c 70 32 ff              # a1bc |   mov [0x3270], 0xff
60 20 e0 f6 00                 # a1c2 |   mov A, 0xf6
60 40 00                       # a1c7 |   mov B, 0
54 00 e0 1c 00 96 01           # a1ca |   mmap 0, 0x9600, 0x1
62 e0 1c c0 32 ff              # a1d1 |   mov [0x32c0], 0xff
62 e0 1c 10 33 ff              # a1d7 |   mov [0x3310], 0xff
62 e0 1c 60 33 ff              # a1dd |   mov [0x3360], 0xff
62 e0 1c b0 33 ff              # a1e3 |   mov [0x33b0], 0xff
62 e0 1c 00 34 ff              # a1e9 |   mov [0x3400], 0xff
62 e0 1c 50 34 ff              # a1ef |   mov [0x3450], 0xff
62 e0 1c a0 34 ff              # a1f5 |   mov [0x34a0], 0xff
62 e0 1c f0 34 ff              # a1fb |   mov [0x34f0], 0xff
62 e0 1c 40 35 ff              # a201 |   mov [0x3540], 0xff
62 e0 1c 90 35 ff              # a207 |   mov [0x3590], 0xff
60 20 e0 f7 00                 # a20d |   mov A, 0xf7
60 40 00                       # a212 |   mov B, 0
54 00 e0 1c 00 96 01           # a215 |   mmap 0, 0x9600, 0x1
62 e0 1c e0 35 ff              # a21c |   mov [0x35e0], 0xff
62 e0 1c 30 36 ff              # a222 |   mov [0x3630], 0xff
62 e0 1c 80 36 ff              # a228 |   mov [0x3680], 0xff
62 e0 1c d0 36 ff              # a22e |   mov [0x36d0], 0xff
62 e0 1c 20 37 ff              # a234 |   mov [0x3720], 0xff
62 e0 1c 70 37 ff              # a23a |   mov [0x3770], 0xff
62 e0 1c c0 37 ff              # a240 |   mov [0x37c0], 0xff
62 e0 1c 10 38 ff              # a246 |   mov [0x3810], 0xff
62 e0 1c 60 38 ff              # a24c |   mov [0x3860], 0xff
62 e0 1c b0 38 ff              # a252 |   mov [0x38b0], 0xff
60 20 e0 f3 00                 # a258 |   mov A, 0xf3
60 40 00                       # a25d |   mov B, 0
54 00 e0 1c 00 96 01           # a260 |   mmap 0, 0x9600, 0x1
62 e0 e0 fe 0f ff 00           # a267 |   mov [0xffe], 0xff
62 e0 1c 00 10 ff              # a26e |   mov [0x1000], 0xff
62 e0 e0 02 10 00 ff           # a274 |   mov [0x1002], 0xff00
62 e0 e0 4e 10 ff 00           # a27b |   mov [0x104e], 0xff
62 e0 1c 50 10 ff              # a282 |   mov [0x1050], 0xff
62 e0 e0 52 10 00 ff           # a288 |   mov [0x1052], 0xff00
62 e0 e0 9e 10 ff 00           # a28f |   mov [0x109e], 0xff
62 e0 1c a0 10 ff              # a296 |   mov [0x10a0], 0xff
62 e0 e0 a2 10 00 ff           # a29c |   mov [0x10a2], 0xff00
62 e0 e0 ee 10 ff 00           # a2a3 |   mov [0x10ee], 0xff
62 e0 1c f0 10 ff              # a2aa |   mov [0x10f0], 0xff
62 e0 e0 f2 10 00 ff           # a2b0 |   mov [0x10f2], 0xff00
62 e0 e0 3e 11 ff 00           # a2b7 |   mov [0x113e], 0xff
62 e0 1c 40 11 ff              # a2be |   mov [0x1140], 0xff
62 e0 e0 42 11 00 ff           # a2c4 |   mov [0x1142], 0xff00
62 e0 e0 8e 11 ff 00           # a2cb |   mov [0x118e], 0xff
62 e0 1c 90 11 ff              # a2d2 |   mov [0x1190], 0xff
62 e0 e0 92 11 00 ff           # a2d8 |   mov [0x1192], 0xff00
62 e0 e0 de 11 ff 00           # a2df |   mov [0x11de], 0xff
62 e0 1c e0 11 ff              # a2e6 |   mov [0x11e0], 0xff
62 e0 e0 e2 11 00 ff           # a2ec |   mov [0x11e2], 0xff00
62 e0 e0 2e 12 ff 00           # a2f3 |   mov [0x122e], 0xff
62 e0 1c 30 12 ff              # a2fa |   mov [0x1230], 0xff
62 e0 e0 32 12 00 ff           # a300 |   mov [0x1232], 0xff00
62 e0 e0 7e 12 ff 00           # a307 |   mov [0x127e], 0xff
62 e0 1c 80 12 ff              # a30e |   mov [0x1280], 0xff
62 e0 e0 82 12 00 ff           # a314 |   mov [0x1282], 0xff00
62 e0 e0 ce 12 ff 00           # a31b |   mov [0x12ce], 0xff
62 e0 1c d0 12 ff              # a322 |   mov [0x12d0], 0xff
62 e0 e0 d2 12 00 ff           # a328 |   mov [0x12d2], 0xff00
62 e0 e0 1e 13 ff 00           # a32f |   mov [0x131e], 0xff
62 e0 1c 20 13 fe              # a336 |   mov [0x1320], 0xfe
62 e0 e0 22 13 00 ff           # a33c |   mov [0x1322], 0xff00
62 e0 e0 6e 13 ff 00           # a343 |   mov [0x136e], 0xff
62 e0 1c 70 13 fe              # a34a |   mov [0x1370], 0xfe
62 e0 e0 72 13 00 ff           # a350 |   mov [0x1372], 0xff00
62 e0 e0 be 13 ff 00           # a357 |   mov [0x13be], 0xff
62 e0 1c c0 13 fe              # a35e |   mov [0x13c0], 0xfe
62 e0 e0 c2 13 00 ff           # a364 |   mov [0x13c2], 0xff00
62 e0 e0 0e 14 ff 00           # a36b |   mov [0x140e], 0xff
62 e0 1c 10 14 fe              # a372 |   mov [0x1410], 0xfe
62 e0 e0 12 14 00 ff           # a378 |   mov [0x1412], 0xff00
62 e0 e0 5e 14 ff 00           # a37f |   mov [0x145e], 0xff
62 e0 1c 60 14 fe              # a386 |   mov [0x1460], 0xfe
62 e0 e0 62 14 00 ff           # a38c |   mov [0x1462], 0xff00
62 e0 e0 ae 14 ff 00           # a393 |   mov [0x14ae], 0xff
62 e0 1c b0 14 fe              # a39a |   mov [0x14b0], 0xfe
62 e0 e0 b2 14 00 ff           # a3a0 |   mov [0x14b2], 0xff00
62 e0 e0 fe 14 ff 00           # a3a7 |   mov [0x14fe], 0xff
62 e0 1c 00 15 fe              # a3ae |   mov [0x1500], 0xfe
62 e0 e0 02 15 00 ff           # a3b4 |   mov [0x1502], 0xff00
62 e0 e0 4e 15 ff 00           # a3bb |   mov [0x154e], 0xff
62 e0 1c 50 15 fe              # a3c2 |   mov [0x1550], 0xfe
62 e0 e0 52 15 00 ff           # a3c8 |   mov [0x1552], 0xff00
62 e0 e0 9e 15 ff 00           # a3cf |   mov [0x159e], 0xff
62 e0 1c a0 15 fe              # a3d6 |   mov [0x15a0], 0xfe
62 e0 e0 a2 15 00 ff           # a3dc |   mov [0x15a2], 0xff00
62 e0 e0 ee 15 ff 00           # a3e3 |   mov [0x15ee], 0xff
62 e0 1c f0 15 fe              # a3ea |   mov [0x15f0], 0xfe
62 e0 e0 f2 15 00 ff           # a3f0 |   mov [0x15f2], 0xff00
62 e0 e0 3e 16 ff 00           # a3f7 |   mov [0x163e], 0xff
62 e0 e0 40 16 00 ff           # a3fe |   mov [0x1640], 0xff00
62 e0 e0 42 16 00 ff           # a405 |   mov [0x1642], 0xff00
62 e0 e0 8e 16 ff 00           # a40c |   mov [0x168e], 0xff
62 e0 e0 90 16 00 ff           # a413 |   mov [0x1690], 0xff00
62 e0 e0 92 16 00 ff           # a41a |   mov [0x1692], 0xff00
62 e0 e0 de 16 ff 00           # a421 |   mov [0x16de], 0xff
62 e0 e0 e0 16 00 ff           # a428 |   mov [0x16e0], 0xff00
62 e0 e0 e2 16 00 ff           # a42f |   mov [0x16e2], 0xff00
62 e0 e0 2e 17 ff 00           # a436 |   mov [0x172e], 0xff
62 e0 e0 30 17 00 ff           # a43d |   mov [0x1730], 0xff00
62 e0 e0 32 17 00 ff           # a444 |   mov [0x1732], 0xff00
62 e0 e0 7e 17 ff 00           # a44b |   mov [0x177e], 0xff
62 e0 e0 80 17 00 ff           # a452 |   mov [0x1780], 0xff00
62 e0 e0 82 17 00 ff           # a459 |   mov [0x1782], 0xff00
62 e0 e0 ce 17 ff 00           # a460 |   mov [0x17ce], 0xff
62 e0 e0 d0 17 00 ff           # a467 |   mov [0x17d0], 0xff00
62 e0 e0 d2 17 00 ff           # a46e |   mov [0x17d2], 0xff00
62 e0 e0 1e 18 ff 00           # a475 |   mov [0x181e], 0xff
62 e0 e0 20 18 00 ff           # a47c |   mov [0x1820], 0xff00
62 e0 e0 22 18 00 ff           # a483 |   mov [0x1822], 0xff00
62 e0 e0 6e 18 ff 00           # a48a |   mov [0x186e], 0xff
62 e0 e0 70 18 00 ff           # a491 |   mov [0x1870], 0xff00
62 e0 e0 72 18 00 ff           # a498 |   mov [0x1872], 0xff00
62 e0 e0 be 18 ff 00           # a49f |   mov [0x18be], 0xff
62 e0 e0 c0 18 00 ff           # a4a6 |   mov [0x18c0], 0xff00
62 e0 e0 c2 18 00 ff           # a4ad |   mov [0x18c2], 0xff00
62 e0 e0 0e 19 ff 00           # a4b4 |   mov [0x190e], 0xff
62 e0 e0 10 19 00 ff           # a4bb |   mov [0x1910], 0xff00
62 e0 e0 12 19 00 ff           # a4c2 |   mov [0x1912], 0xff00
62 e0 e0 5e 19 ff 00           # a4c9 |   mov [0x195e], 0xff
62 e0 e0 60 19 0f 0f           # a4d0 |   mov [0x1960], 0xf0f
62 e0 e0 62 19 00 ff           # a4d7 |   mov [0x1962], 0xff00
62 e0 e0 ae 19 ff 00           # a4de |   mov [0x19ae], 0xff
62 e0 e0 b0 19 0f 0f           # a4e5 |   mov [0x19b0], 0xf0f
62 e0 e0 b2 19 00 ff           # a4ec |   mov [0x19b2], 0xff00
62 e0 e0 fe 19 ff 00           # a4f3 |   mov [0x19fe], 0xff
62 e0 e0 00 1a 0f 0f           # a4fa |   mov [0x1a00], 0xf0f
62 e0 e0 02 1a 00 ff           # a501 |   mov [0x1a02], 0xff00
62 e0 e0 4e 1a ff 00           # a508 |   mov [0x1a4e], 0xff
62 e0 e0 50 1a 0f 0f           # a50f |   mov [0x1a50], 0xf0f
62 e0 e0 52 1a 00 ff           # a516 |   mov [0x1a52], 0xff00
62 e0 e0 9e 1a ff 00           # a51d |   mov [0x1a9e], 0xff
62 e0 e0 a0 1a 0f 0f           # a524 |   mov [0x1aa0], 0xf0f
62 e0 e0 a2 1a 00 ff           # a52b |   mov [0x1aa2], 0xff00
62 e0 e0 ee 1a ff 00           # a532 |   mov [0x1aee], 0xff
62 e0 e0 f0 1a 0f 0f           # a539 |   mov [0x1af0], 0xf0f
62 e0 e0 f2 1a 00 ff           # a540 |   mov [0x1af2], 0xff00
62 e0 e0 3e 1b ff 00           # a547 |   mov [0x1b3e], 0xff
62 e0 e0 40 1b 0f 0f           # a54e |   mov [0x1b40], 0xf0f
62 e0 e0 42 1b 00 ff           # a555 |   mov [0x1b42], 0xff00
62 e0 e0 8e 1b ff 00           # a55c |   mov [0x1b8e], 0xff
62 e0 e0 90 1b 0f 0f           # a563 |   mov [0x1b90], 0xf0f
62 e0 e0 92 1b 00 ff           # a56a |   mov [0x1b92], 0xff00
62 e0 e0 de 1b ff 00           # a571 |   mov [0x1bde], 0xff
62 e0 e0 e0 1b 0f 0f           # a578 |   mov [0x1be0], 0xf0f
62 e0 e0 e2 1b 00 ff           # a57f |   mov [0x1be2], 0xff00
62 e0 e0 2e 1c ff 00           # a586 |   mov [0x1c2e], 0xff
62 e0 e0 30 1c 0f 0f           # a58d |   mov [0x1c30], 0xf0f
62 e0 e0 32 1c 00 ff           # a594 |   mov [0x1c32], 0xff00
60 fc 00                       # a59b |   mov E, 0
62 e0 00 0a ff                 # a59e |   mov [0xff0a], 0
                               #      | _B_fn_start_1:
60 20 00                       # a5a3 |   mov A, 0
                               #      | _B_fn_start_2:
e8 20 1c f8 ff 10 00           # a5a6 |   jeq A, 0xff, ${_E_fn_start_2}:rel + PC
44 20                          # a5ad |   inc A
08 40 40                       # a5af |   mul B, B
58 f8 f4 ff                    # a5b2 |   jmp ${_B_fn_start_2}:rel + PC
                               #      | _E_fn_start_2:
46 e0 0a ff                    # a5b6 |   inc [0xff0a]
44 fc                          # a5ba |   inc E
62 e0 fc 00 10                 # a5bc |   mov [0x1000], E
62 e0 fc b0 0f                 # a5c1 |   mov [0xfb0], E
62 e0 fc 60 0f                 # a5c6 |   mov [0xf60], E
62 e0 fc 10 0f                 # a5cb |   mov [0xf10], E
62 e0 fc c0 0e                 # a5d0 |   mov [0xec0], E
62 e0 fc 70 0e                 # a5d5 |   mov [0xe70], E
62 e0 fc 20 0e                 # a5da |   mov [0xe20], E
62 e0 fc d0 0d                 # a5df |   mov [0xdd0], E
62 e0 fc 80 0d                 # a5e4 |   mov [0xd80], E
62 e0 fc 30 0d                 # a5e9 |   mov [0xd30], E
58 f8 b5 ff                    # a5ee |   jmp ${_B_fn_start_1}:rel + PC
                               #      | _E_fn_start_1:
d8                             # a5f2 |   halt
dc                             # a5f3 |   ret
                               #      | end_fn_start:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
