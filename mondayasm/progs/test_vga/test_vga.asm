                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_start:
60 a0 e0 00 9f                 # a000 |   mov SP, 0x9f00
60 20 e0 ec a6                 # a005 |   mov A, ${const_data_1}
5c f8 f9 05                    # a00a |   call ${fn_send_data}:rel + PC
60 20 e0 f0 00                 # a00e |   mov A, 0xf0
60 40 00                       # a013 |   mov B, 0
54 00 e0 1c 00 96 01           # a016 |   mmap 0, 0x9600, 0x1
62 e0 1c 00 20 ff              # a01d |   mov [0x2000], 0xff
62 e0 1c 50 20 ff              # a023 |   mov [0x2050], 0xff
62 e0 1c a0 20 ff              # a029 |   mov [0x20a0], 0xff
62 e0 1c f0 20 ff              # a02f |   mov [0x20f0], 0xff
62 e0 1c 40 21 ff              # a035 |   mov [0x2140], 0xff
62 e0 1c 90 21 ff              # a03b |   mov [0x2190], 0xff
62 e0 1c e0 21 ff              # a041 |   mov [0x21e0], 0xff
62 e0 1c 30 22 ff              # a047 |   mov [0x2230], 0xff
62 e0 1c 80 22 ff              # a04d |   mov [0x2280], 0xff
62 e0 1c d0 22 ff              # a053 |   mov [0x22d0], 0xff
60 20 e0 f1 00                 # a059 |   mov A, 0xf1
60 40 00                       # a05e |   mov B, 0
54 00 e0 1c 00 96 01           # a061 |   mmap 0, 0x9600, 0x1
62 e0 1c 20 23 ff              # a068 |   mov [0x2320], 0xff
62 e0 1c 70 23 ff              # a06e |   mov [0x2370], 0xff
62 e0 1c c0 23 ff              # a074 |   mov [0x23c0], 0xff
62 e0 1c 10 24 ff              # a07a |   mov [0x2410], 0xff
62 e0 1c 60 24 ff              # a080 |   mov [0x2460], 0xff
62 e0 1c b0 24 ff              # a086 |   mov [0x24b0], 0xff
62 e0 1c 00 25 ff              # a08c |   mov [0x2500], 0xff
62 e0 1c 50 25 ff              # a092 |   mov [0x2550], 0xff
62 e0 1c a0 25 ff              # a098 |   mov [0x25a0], 0xff
62 e0 1c f0 25 ff              # a09e |   mov [0x25f0], 0xff
60 20 e0 f2 00                 # a0a4 |   mov A, 0xf2
60 40 00                       # a0a9 |   mov B, 0
54 00 e0 1c 00 96 01           # a0ac |   mmap 0, 0x9600, 0x1
62 e0 1c 40 26 ff              # a0b3 |   mov [0x2640], 0xff
62 e0 1c 90 26 ff              # a0b9 |   mov [0x2690], 0xff
62 e0 1c e0 26 ff              # a0bf |   mov [0x26e0], 0xff
62 e0 1c 30 27 ff              # a0c5 |   mov [0x2730], 0xff
62 e0 1c 80 27 ff              # a0cb |   mov [0x2780], 0xff
62 e0 1c d0 27 ff              # a0d1 |   mov [0x27d0], 0xff
62 e0 1c 20 28 ff              # a0d7 |   mov [0x2820], 0xff
62 e0 1c 70 28 ff              # a0dd |   mov [0x2870], 0xff
62 e0 1c c0 28 ff              # a0e3 |   mov [0x28c0], 0xff
62 e0 1c 10 29 ff              # a0e9 |   mov [0x2910], 0xff
60 20 e0 f3 00                 # a0ef |   mov A, 0xf3
60 40 00                       # a0f4 |   mov B, 0
54 00 e0 1c 00 96 01           # a0f7 |   mmap 0, 0x9600, 0x1
62 e0 1c 60 29 ff              # a0fe |   mov [0x2960], 0xff
62 e0 1c b0 29 ff              # a104 |   mov [0x29b0], 0xff
62 e0 1c 00 2a ff              # a10a |   mov [0x2a00], 0xff
62 e0 1c 50 2a ff              # a110 |   mov [0x2a50], 0xff
62 e0 1c a0 2a ff              # a116 |   mov [0x2aa0], 0xff
62 e0 1c f0 2a ff              # a11c |   mov [0x2af0], 0xff
62 e0 1c 40 2b ff              # a122 |   mov [0x2b40], 0xff
62 e0 1c 90 2b ff              # a128 |   mov [0x2b90], 0xff
62 e0 1c e0 2b ff              # a12e |   mov [0x2be0], 0xff
62 e0 1c 30 2c ff              # a134 |   mov [0x2c30], 0xff
60 20 e0 f4 00                 # a13a |   mov A, 0xf4
60 40 00                       # a13f |   mov B, 0
54 00 e0 1c 00 96 01           # a142 |   mmap 0, 0x9600, 0x1
62 e0 1c 80 2c ff              # a149 |   mov [0x2c80], 0xff
62 e0 1c d0 2c ff              # a14f |   mov [0x2cd0], 0xff
62 e0 1c 20 2d ff              # a155 |   mov [0x2d20], 0xff
62 e0 1c 70 2d ff              # a15b |   mov [0x2d70], 0xff
62 e0 1c c0 2d ff              # a161 |   mov [0x2dc0], 0xff
62 e0 1c 10 2e ff              # a167 |   mov [0x2e10], 0xff
62 e0 1c 60 2e ff              # a16d |   mov [0x2e60], 0xff
62 e0 1c b0 2e ff              # a173 |   mov [0x2eb0], 0xff
62 e0 1c 00 2f ff              # a179 |   mov [0x2f00], 0xff
62 e0 1c 50 2f ff              # a17f |   mov [0x2f50], 0xff
60 20 e0 f5 00                 # a185 |   mov A, 0xf5
60 40 00                       # a18a |   mov B, 0
54 00 e0 1c 00 96 01           # a18d |   mmap 0, 0x9600, 0x1
62 e0 1c a0 2f ff              # a194 |   mov [0x2fa0], 0xff
62 e0 1c f0 2f ff              # a19a |   mov [0x2ff0], 0xff
62 e0 1c 40 30 ff              # a1a0 |   mov [0x3040], 0xff
62 e0 1c 90 30 ff              # a1a6 |   mov [0x3090], 0xff
62 e0 1c e0 30 ff              # a1ac |   mov [0x30e0], 0xff
62 e0 1c 30 31 ff              # a1b2 |   mov [0x3130], 0xff
62 e0 1c 80 31 ff              # a1b8 |   mov [0x3180], 0xff
62 e0 1c d0 31 ff              # a1be |   mov [0x31d0], 0xff
62 e0 1c 20 32 ff              # a1c4 |   mov [0x3220], 0xff
62 e0 1c 70 32 ff              # a1ca |   mov [0x3270], 0xff
60 20 e0 f6 00                 # a1d0 |   mov A, 0xf6
60 40 00                       # a1d5 |   mov B, 0
54 00 e0 1c 00 96 01           # a1d8 |   mmap 0, 0x9600, 0x1
62 e0 1c c0 32 ff              # a1df |   mov [0x32c0], 0xff
62 e0 1c 10 33 ff              # a1e5 |   mov [0x3310], 0xff
62 e0 1c 60 33 ff              # a1eb |   mov [0x3360], 0xff
62 e0 1c b0 33 ff              # a1f1 |   mov [0x33b0], 0xff
62 e0 1c 00 34 ff              # a1f7 |   mov [0x3400], 0xff
62 e0 1c 50 34 ff              # a1fd |   mov [0x3450], 0xff
62 e0 1c a0 34 ff              # a203 |   mov [0x34a0], 0xff
62 e0 1c f0 34 ff              # a209 |   mov [0x34f0], 0xff
62 e0 1c 40 35 ff              # a20f |   mov [0x3540], 0xff
62 e0 1c 90 35 ff              # a215 |   mov [0x3590], 0xff
60 20 e0 f7 00                 # a21b |   mov A, 0xf7
60 40 00                       # a220 |   mov B, 0
54 00 e0 1c 00 96 01           # a223 |   mmap 0, 0x9600, 0x1
62 e0 1c e0 35 ff              # a22a |   mov [0x35e0], 0xff
62 e0 1c 30 36 ff              # a230 |   mov [0x3630], 0xff
62 e0 1c 80 36 ff              # a236 |   mov [0x3680], 0xff
62 e0 1c d0 36 ff              # a23c |   mov [0x36d0], 0xff
62 e0 1c 20 37 ff              # a242 |   mov [0x3720], 0xff
62 e0 1c 70 37 ff              # a248 |   mov [0x3770], 0xff
62 e0 1c c0 37 ff              # a24e |   mov [0x37c0], 0xff
62 e0 1c 10 38 ff              # a254 |   mov [0x3810], 0xff
62 e0 1c 60 38 ff              # a25a |   mov [0x3860], 0xff
62 e0 1c b0 38 ff              # a260 |   mov [0x38b0], 0xff
60 20 e0 f3 00                 # a266 |   mov A, 0xf3
60 40 00                       # a26b |   mov B, 0
54 00 e0 1c 00 96 01           # a26e |   mmap 0, 0x9600, 0x1
62 e0 e0 fe 0f ff 00           # a275 |   mov [0xffe], 0xff
62 e0 1c 00 10 ff              # a27c |   mov [0x1000], 0xff
62 e0 e0 02 10 00 ff           # a282 |   mov [0x1002], 0xff00
62 e0 e0 4e 10 ff 00           # a289 |   mov [0x104e], 0xff
62 e0 1c 50 10 ff              # a290 |   mov [0x1050], 0xff
62 e0 e0 52 10 00 ff           # a296 |   mov [0x1052], 0xff00
62 e0 e0 9e 10 ff 00           # a29d |   mov [0x109e], 0xff
62 e0 1c a0 10 ff              # a2a4 |   mov [0x10a0], 0xff
62 e0 e0 a2 10 00 ff           # a2aa |   mov [0x10a2], 0xff00
62 e0 e0 ee 10 ff 00           # a2b1 |   mov [0x10ee], 0xff
62 e0 1c f0 10 ff              # a2b8 |   mov [0x10f0], 0xff
62 e0 e0 f2 10 00 ff           # a2be |   mov [0x10f2], 0xff00
62 e0 e0 3e 11 ff 00           # a2c5 |   mov [0x113e], 0xff
62 e0 1c 40 11 ff              # a2cc |   mov [0x1140], 0xff
62 e0 e0 42 11 00 ff           # a2d2 |   mov [0x1142], 0xff00
62 e0 e0 8e 11 ff 00           # a2d9 |   mov [0x118e], 0xff
62 e0 1c 90 11 ff              # a2e0 |   mov [0x1190], 0xff
62 e0 e0 92 11 00 ff           # a2e6 |   mov [0x1192], 0xff00
62 e0 e0 de 11 ff 00           # a2ed |   mov [0x11de], 0xff
62 e0 1c e0 11 ff              # a2f4 |   mov [0x11e0], 0xff
62 e0 e0 e2 11 00 ff           # a2fa |   mov [0x11e2], 0xff00
62 e0 e0 2e 12 ff 00           # a301 |   mov [0x122e], 0xff
62 e0 1c 30 12 ff              # a308 |   mov [0x1230], 0xff
62 e0 e0 32 12 00 ff           # a30e |   mov [0x1232], 0xff00
62 e0 e0 7e 12 ff 00           # a315 |   mov [0x127e], 0xff
62 e0 1c 80 12 ff              # a31c |   mov [0x1280], 0xff
62 e0 e0 82 12 00 ff           # a322 |   mov [0x1282], 0xff00
62 e0 e0 ce 12 ff 00           # a329 |   mov [0x12ce], 0xff
62 e0 1c d0 12 ff              # a330 |   mov [0x12d0], 0xff
62 e0 e0 d2 12 00 ff           # a336 |   mov [0x12d2], 0xff00
62 e0 e0 1e 13 ff 00           # a33d |   mov [0x131e], 0xff
62 e0 1c 20 13 fe              # a344 |   mov [0x1320], 0xfe
62 e0 e0 22 13 00 ff           # a34a |   mov [0x1322], 0xff00
62 e0 e0 6e 13 ff 00           # a351 |   mov [0x136e], 0xff
62 e0 1c 70 13 fe              # a358 |   mov [0x1370], 0xfe
62 e0 e0 72 13 00 ff           # a35e |   mov [0x1372], 0xff00
62 e0 e0 be 13 ff 00           # a365 |   mov [0x13be], 0xff
62 e0 1c c0 13 fe              # a36c |   mov [0x13c0], 0xfe
62 e0 e0 c2 13 00 ff           # a372 |   mov [0x13c2], 0xff00
62 e0 e0 0e 14 ff 00           # a379 |   mov [0x140e], 0xff
62 e0 1c 10 14 fe              # a380 |   mov [0x1410], 0xfe
62 e0 e0 12 14 00 ff           # a386 |   mov [0x1412], 0xff00
62 e0 e0 5e 14 ff 00           # a38d |   mov [0x145e], 0xff
62 e0 1c 60 14 fe              # a394 |   mov [0x1460], 0xfe
62 e0 e0 62 14 00 ff           # a39a |   mov [0x1462], 0xff00
62 e0 e0 ae 14 ff 00           # a3a1 |   mov [0x14ae], 0xff
62 e0 1c b0 14 fe              # a3a8 |   mov [0x14b0], 0xfe
62 e0 e0 b2 14 00 ff           # a3ae |   mov [0x14b2], 0xff00
62 e0 e0 fe 14 ff 00           # a3b5 |   mov [0x14fe], 0xff
62 e0 1c 00 15 fe              # a3bc |   mov [0x1500], 0xfe
62 e0 e0 02 15 00 ff           # a3c2 |   mov [0x1502], 0xff00
62 e0 e0 4e 15 ff 00           # a3c9 |   mov [0x154e], 0xff
62 e0 1c 50 15 fe              # a3d0 |   mov [0x1550], 0xfe
62 e0 e0 52 15 00 ff           # a3d6 |   mov [0x1552], 0xff00
62 e0 e0 9e 15 ff 00           # a3dd |   mov [0x159e], 0xff
62 e0 1c a0 15 fe              # a3e4 |   mov [0x15a0], 0xfe
62 e0 e0 a2 15 00 ff           # a3ea |   mov [0x15a2], 0xff00
62 e0 e0 ee 15 ff 00           # a3f1 |   mov [0x15ee], 0xff
62 e0 1c f0 15 fe              # a3f8 |   mov [0x15f0], 0xfe
62 e0 e0 f2 15 00 ff           # a3fe |   mov [0x15f2], 0xff00
62 e0 e0 3e 16 ff 00           # a405 |   mov [0x163e], 0xff
62 e0 e0 40 16 00 ff           # a40c |   mov [0x1640], 0xff00
62 e0 e0 42 16 00 ff           # a413 |   mov [0x1642], 0xff00
62 e0 e0 8e 16 ff 00           # a41a |   mov [0x168e], 0xff
62 e0 e0 90 16 00 ff           # a421 |   mov [0x1690], 0xff00
62 e0 e0 92 16 00 ff           # a428 |   mov [0x1692], 0xff00
62 e0 e0 de 16 ff 00           # a42f |   mov [0x16de], 0xff
62 e0 e0 e0 16 00 ff           # a436 |   mov [0x16e0], 0xff00
62 e0 e0 e2 16 00 ff           # a43d |   mov [0x16e2], 0xff00
62 e0 e0 2e 17 ff 00           # a444 |   mov [0x172e], 0xff
62 e0 e0 30 17 00 ff           # a44b |   mov [0x1730], 0xff00
62 e0 e0 32 17 00 ff           # a452 |   mov [0x1732], 0xff00
62 e0 e0 7e 17 ff 00           # a459 |   mov [0x177e], 0xff
62 e0 e0 80 17 00 ff           # a460 |   mov [0x1780], 0xff00
62 e0 e0 82 17 00 ff           # a467 |   mov [0x1782], 0xff00
62 e0 e0 ce 17 ff 00           # a46e |   mov [0x17ce], 0xff
62 e0 e0 d0 17 00 ff           # a475 |   mov [0x17d0], 0xff00
62 e0 e0 d2 17 00 ff           # a47c |   mov [0x17d2], 0xff00
62 e0 e0 1e 18 ff 00           # a483 |   mov [0x181e], 0xff
62 e0 e0 20 18 00 ff           # a48a |   mov [0x1820], 0xff00
62 e0 e0 22 18 00 ff           # a491 |   mov [0x1822], 0xff00
62 e0 e0 6e 18 ff 00           # a498 |   mov [0x186e], 0xff
62 e0 e0 70 18 00 ff           # a49f |   mov [0x1870], 0xff00
62 e0 e0 72 18 00 ff           # a4a6 |   mov [0x1872], 0xff00
62 e0 e0 be 18 ff 00           # a4ad |   mov [0x18be], 0xff
62 e0 e0 c0 18 00 ff           # a4b4 |   mov [0x18c0], 0xff00
62 e0 e0 c2 18 00 ff           # a4bb |   mov [0x18c2], 0xff00
62 e0 e0 0e 19 ff 00           # a4c2 |   mov [0x190e], 0xff
62 e0 e0 10 19 00 ff           # a4c9 |   mov [0x1910], 0xff00
62 e0 e0 12 19 00 ff           # a4d0 |   mov [0x1912], 0xff00
62 e0 e0 5e 19 ff 00           # a4d7 |   mov [0x195e], 0xff
62 e0 e0 60 19 0f 0f           # a4de |   mov [0x1960], 0xf0f
62 e0 e0 62 19 00 ff           # a4e5 |   mov [0x1962], 0xff00
62 e0 e0 ae 19 ff 00           # a4ec |   mov [0x19ae], 0xff
62 e0 e0 b0 19 0f 0f           # a4f3 |   mov [0x19b0], 0xf0f
62 e0 e0 b2 19 00 ff           # a4fa |   mov [0x19b2], 0xff00
62 e0 e0 fe 19 ff 00           # a501 |   mov [0x19fe], 0xff
62 e0 e0 00 1a 0f 0f           # a508 |   mov [0x1a00], 0xf0f
62 e0 e0 02 1a 00 ff           # a50f |   mov [0x1a02], 0xff00
62 e0 e0 4e 1a ff 00           # a516 |   mov [0x1a4e], 0xff
62 e0 e0 50 1a 0f 0f           # a51d |   mov [0x1a50], 0xf0f
62 e0 e0 52 1a 00 ff           # a524 |   mov [0x1a52], 0xff00
62 e0 e0 9e 1a ff 00           # a52b |   mov [0x1a9e], 0xff
62 e0 e0 a0 1a 0f 0f           # a532 |   mov [0x1aa0], 0xf0f
62 e0 e0 a2 1a 00 ff           # a539 |   mov [0x1aa2], 0xff00
62 e0 e0 ee 1a ff 00           # a540 |   mov [0x1aee], 0xff
62 e0 e0 f0 1a 0f 0f           # a547 |   mov [0x1af0], 0xf0f
62 e0 e0 f2 1a 00 ff           # a54e |   mov [0x1af2], 0xff00
62 e0 e0 3e 1b ff 00           # a555 |   mov [0x1b3e], 0xff
62 e0 e0 40 1b 0f 0f           # a55c |   mov [0x1b40], 0xf0f
62 e0 e0 42 1b 00 ff           # a563 |   mov [0x1b42], 0xff00
62 e0 e0 8e 1b ff 00           # a56a |   mov [0x1b8e], 0xff
62 e0 e0 90 1b 0f 0f           # a571 |   mov [0x1b90], 0xf0f
62 e0 e0 92 1b 00 ff           # a578 |   mov [0x1b92], 0xff00
62 e0 e0 de 1b ff 00           # a57f |   mov [0x1bde], 0xff
62 e0 e0 e0 1b 0f 0f           # a586 |   mov [0x1be0], 0xf0f
62 e0 e0 e2 1b 00 ff           # a58d |   mov [0x1be2], 0xff00
62 e0 e0 2e 1c ff 00           # a594 |   mov [0x1c2e], 0xff
62 e0 e0 30 1c 0f 0f           # a59b |   mov [0x1c30], 0xf0f
62 e0 e0 32 1c 00 ff           # a5a2 |   mov [0x1c32], 0xff00
60 fc 00                       # a5a9 |   mov E, 0
62 e0 00 0a ff                 # a5ac |   mov [0xff0a], 0
                               #      | _B_fn_start_1:
60 20 00                       # a5b1 |   mov A, 0
                               #      | _B_fn_start_2:
e8 20 1c f8 ff 11 00           # a5b4 |   jeq A, 0xff, ${_E_fn_start_2}:rel + PC
44 20                          # a5bb |   inc A
5c f8 86 00                    # a5bd |   call ${fn_check_ps2}:rel + PC
58 f8 f3 ff                    # a5c1 |   jmp ${_B_fn_start_2}:rel + PC
                               #      | _E_fn_start_2:
46 e0 0a ff                    # a5c5 |   inc [0xff0a]
44 fc                          # a5c9 |   inc E
62 e0 fc 00 10                 # a5cb |   mov [0x1000], E
62 e0 fc b0 0f                 # a5d0 |   mov [0xfb0], E
62 e0 fc 60 0f                 # a5d5 |   mov [0xf60], E
62 e0 fc 10 0f                 # a5da |   mov [0xf10], E
62 e0 fc c0 0e                 # a5df |   mov [0xec0], E
62 e0 fc 70 0e                 # a5e4 |   mov [0xe70], E
62 e0 fc 20 0e                 # a5e9 |   mov [0xe20], E
62 e0 fc d0 0d                 # a5ee |   mov [0xdd0], E
62 e0 fc 80 0d                 # a5f3 |   mov [0xd80], E
62 e0 fc 30 0d                 # a5f8 |   mov [0xd30], E
58 f8 b4 ff                    # a5fd |   jmp ${_B_fn_start_1}:rel + PC
                               #      | _E_fn_start_1:
d8                             # a601 |   halt
dc                             # a602 |   ret
                               #      | end_fn_start:
                               #      | 
                               #      | fn_send_data:
e0 20                          # a603 |   push A
e0 40                          # a605 |   push B
e0 60                          # a607 |   push C
60 60 1c 11                    # a609 |   mov C, 0x11
                               #      | _B_fn_send_data_1:
61 40 20                       # a60d |   mov B, [A]
2c 40 e0 ff 00                 # a610 |   and B, 0xff
e8 40 00 f8 27 00              # a615 |   jeq B, 0, ${_E_fn_send_data_1}:rel + PC
                               #      | _B_fn_send_data_2:
f0 60 1c f8 10 14 00           # a61b |   jlt C, 0x10, ${_E_fn_send_data_2}:rel + PC
61 60 e0 04 ff                 # a622 |   mov C, [0xff04]
2c 60 1c 3f                    # a627 |   and C, 0x3f
58 f8 f0 ff                    # a62b |   jmp ${_B_fn_send_data_2}:rel + PC
                               #      | _E_fn_send_data_2:
62 e0 40 00 ff                 # a62f |   mov [0xff00], B
44 20                          # a634 |   inc A
44 60                          # a636 |   inc C
58 f8 d5 ff                    # a638 |   jmp ${_B_fn_send_data_1}:rel + PC
                               #      | _E_fn_send_data_1:
e4 60                          # a63c |   pop C
e4 40                          # a63e |   pop B
e4 20                          # a640 |   pop A
dc                             # a642 |   ret
                               #      | end_fn_send_data:
                               #      | 
                               #      | fn_check_ps2:
e0 20                          # a643 |   push A
e0 40                          # a645 |   push B
e0 fe                          # a647 |   push G
e0 ff                          # a649 |   push H
                               #      | _B_fn_check_ps2_1:
61 fe e0 06 ff                 # a64b |   mov G, [0xff06]
ac ff fe e0 00 80              # a650 |   and H, G, 0x8000
e8 ff 00 f8 28 00              # a656 |   jeq H, 0, ${_E_fn_check_ps2_1}:rel + PC
60 20 e0 fa a6                 # a65c |   mov A, ${const_data_2}
5c f8 a2 ff                    # a661 |   call ${fn_send_data}:rel + PC
60 20 e0 08 a7                 # a665 |   mov A, ${var_uart_buf}
60 40 fe                       # a66a |   mov B, G
5c f8 1a 00                    # a66d |   call ${fn_put_hex_16}:rel + PC
5c f8 92 ff                    # a671 |   call ${fn_send_data}:rel + PC
60 20 e0 00 a7                 # a675 |   mov A, ${const_data_3}
5c f8 89 ff                    # a67a |   call ${fn_send_data}:rel + PC
                               #      | _E_fn_check_ps2_1:
e4 ff                          # a67e |   pop H
e4 fe                          # a680 |   pop G
e4 40                          # a682 |   pop B
e4 20                          # a684 |   pop A
dc                             # a686 |   ret
                               #      | end_fn_check_ps2:
                               #      | 
                               #      | fn_put_hex_16:
e0 20                          # a687 |   push A
e0 40                          # a689 |   push B
e0 60                          # a68b |   push C
60 60 40                       # a68d |   mov C, B
a0 40 60 1c 0c                 # a690 |   shr B, C, 0xc
2c 40 1c 0f                    # a695 |   and B, 0xf
5c f8 39 00                    # a699 |   call ${fn_put_hex_4}:rel + PC
44 20                          # a69d |   inc A
a0 40 60 1c 08                 # a69f |   shr B, C, 0x8
2c 40 1c 0f                    # a6a4 |   and B, 0xf
5c f8 2a 00                    # a6a8 |   call ${fn_put_hex_4}:rel + PC
44 20                          # a6ac |   inc A
a0 40 60 1c 04                 # a6ae |   shr B, C, 0x4
2c 40 1c 0f                    # a6b3 |   and B, 0xf
5c f8 1b 00                    # a6b7 |   call ${fn_put_hex_4}:rel + PC
44 20                          # a6bb |   inc A
a0 40 60 00                    # a6bd |   shr B, C, 0
2c 40 1c 0f                    # a6c1 |   and B, 0xf
5c f8 0d 00                    # a6c5 |   call ${fn_put_hex_4}:rel + PC
44 20                          # a6c9 |   inc A
e4 60                          # a6cb |   pop C
e4 40                          # a6cd |   pop B
e4 20                          # a6cf |   pop A
dc                             # a6d1 |   ret
                               #      | end_fn_put_hex_16:
                               #      | 
                               #      | fn_put_hex_4:
60 ff 40                       # a6d2 |   mov H, B
                               #      | _B_fn_put_hex_4_2:
f8 ff 1c f8 09 0f 00           # a6d5 |   jgt H, 0x9, ${_E_fn_put_hex_4_2}:rel + PC
00 ff 1c 30                    # a6dc |   add H, 0x30
58 f8 08 00                    # a6e0 |   jmp ${_L_fn_put_hex_4_1}:rel + PC
                               #      | _E_fn_put_hex_4_2:
00 ff 1c 57                    # a6e4 |   add H, 0x57
                               #      | _L_fn_put_hex_4_1:
62 20 ff                       # a6e8 |   mov [A], H
dc                             # a6eb |   ret
                               #      | end_fn_put_hex_4:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_data_1:
48 65 6c 6c 6f 20 57 6f 72 6c 64 21 0a 00 # a6ec |   .data str:"Hello World!\n"
                               #      | const_data_2:
50 53 32 3a 20 00              # a6fa |   .data str:"PS2: "
                               #      | const_data_3:
0a 00                          # a700 |   .data str:"\n"
                               #      | const_data_4:
7b 00 c8 01 15 03              # a702 |   .data list:[0x007b, 0x01c8, 0x0315]
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | var_uart_buf:
                               # a708 |   .bss size:130
                               #      | SECTION_END_static_data:
                               #      | 
