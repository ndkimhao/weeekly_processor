                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_start:
60 20 e0 fe 00                 # a000 |   mov A, 0xfe
60 40 00                       # a005 |   mov B, 0
54 00 e0 1c 00 96 01           # a008 |   mmap 0, 0x9600, 0x1
62 e0 e0 fe 0f ff 00           # a00f |   mov [0xffe], 0xff
62 e0 1c 00 10 ff              # a016 |   mov [0x1000], 0xff
62 e0 e0 02 10 00 ff           # a01c |   mov [0x1002], 0xff00
62 e0 e0 4e 10 ff 00           # a023 |   mov [0x104e], 0xff
62 e0 1c 50 10 ff              # a02a |   mov [0x1050], 0xff
62 e0 e0 52 10 00 ff           # a030 |   mov [0x1052], 0xff00
62 e0 e0 9e 10 ff 00           # a037 |   mov [0x109e], 0xff
62 e0 1c a0 10 ff              # a03e |   mov [0x10a0], 0xff
62 e0 e0 a2 10 00 ff           # a044 |   mov [0x10a2], 0xff00
62 e0 e0 ee 10 ff 00           # a04b |   mov [0x10ee], 0xff
62 e0 1c f0 10 ff              # a052 |   mov [0x10f0], 0xff
62 e0 e0 f2 10 00 ff           # a058 |   mov [0x10f2], 0xff00
62 e0 e0 3e 11 ff 00           # a05f |   mov [0x113e], 0xff
62 e0 1c 40 11 ff              # a066 |   mov [0x1140], 0xff
62 e0 e0 42 11 00 ff           # a06c |   mov [0x1142], 0xff00
62 e0 e0 8e 11 ff 00           # a073 |   mov [0x118e], 0xff
62 e0 1c 90 11 ff              # a07a |   mov [0x1190], 0xff
62 e0 e0 92 11 00 ff           # a080 |   mov [0x1192], 0xff00
62 e0 e0 de 11 ff 00           # a087 |   mov [0x11de], 0xff
62 e0 1c e0 11 ff              # a08e |   mov [0x11e0], 0xff
62 e0 e0 e2 11 00 ff           # a094 |   mov [0x11e2], 0xff00
62 e0 e0 2e 12 ff 00           # a09b |   mov [0x122e], 0xff
62 e0 1c 30 12 ff              # a0a2 |   mov [0x1230], 0xff
62 e0 e0 32 12 00 ff           # a0a8 |   mov [0x1232], 0xff00
62 e0 e0 7e 12 ff 00           # a0af |   mov [0x127e], 0xff
62 e0 1c 80 12 ff              # a0b6 |   mov [0x1280], 0xff
62 e0 e0 82 12 00 ff           # a0bc |   mov [0x1282], 0xff00
62 e0 e0 ce 12 ff 00           # a0c3 |   mov [0x12ce], 0xff
62 e0 1c d0 12 ff              # a0ca |   mov [0x12d0], 0xff
62 e0 e0 d2 12 00 ff           # a0d0 |   mov [0x12d2], 0xff00
62 e0 e0 1e 13 ff 00           # a0d7 |   mov [0x131e], 0xff
62 e0 1c 20 13 fe              # a0de |   mov [0x1320], 0xfe
62 e0 e0 22 13 00 ff           # a0e4 |   mov [0x1322], 0xff00
62 e0 e0 6e 13 ff 00           # a0eb |   mov [0x136e], 0xff
62 e0 1c 70 13 fe              # a0f2 |   mov [0x1370], 0xfe
62 e0 e0 72 13 00 ff           # a0f8 |   mov [0x1372], 0xff00
62 e0 e0 be 13 ff 00           # a0ff |   mov [0x13be], 0xff
62 e0 1c c0 13 fe              # a106 |   mov [0x13c0], 0xfe
62 e0 e0 c2 13 00 ff           # a10c |   mov [0x13c2], 0xff00
62 e0 e0 0e 14 ff 00           # a113 |   mov [0x140e], 0xff
62 e0 1c 10 14 fe              # a11a |   mov [0x1410], 0xfe
62 e0 e0 12 14 00 ff           # a120 |   mov [0x1412], 0xff00
62 e0 e0 5e 14 ff 00           # a127 |   mov [0x145e], 0xff
62 e0 1c 60 14 fe              # a12e |   mov [0x1460], 0xfe
62 e0 e0 62 14 00 ff           # a134 |   mov [0x1462], 0xff00
62 e0 e0 ae 14 ff 00           # a13b |   mov [0x14ae], 0xff
62 e0 1c b0 14 fe              # a142 |   mov [0x14b0], 0xfe
62 e0 e0 b2 14 00 ff           # a148 |   mov [0x14b2], 0xff00
62 e0 e0 fe 14 ff 00           # a14f |   mov [0x14fe], 0xff
62 e0 1c 00 15 fe              # a156 |   mov [0x1500], 0xfe
62 e0 e0 02 15 00 ff           # a15c |   mov [0x1502], 0xff00
62 e0 e0 4e 15 ff 00           # a163 |   mov [0x154e], 0xff
62 e0 1c 50 15 fe              # a16a |   mov [0x1550], 0xfe
62 e0 e0 52 15 00 ff           # a170 |   mov [0x1552], 0xff00
62 e0 e0 9e 15 ff 00           # a177 |   mov [0x159e], 0xff
62 e0 1c a0 15 fe              # a17e |   mov [0x15a0], 0xfe
62 e0 e0 a2 15 00 ff           # a184 |   mov [0x15a2], 0xff00
62 e0 e0 ee 15 ff 00           # a18b |   mov [0x15ee], 0xff
62 e0 1c f0 15 fe              # a192 |   mov [0x15f0], 0xfe
62 e0 e0 f2 15 00 ff           # a198 |   mov [0x15f2], 0xff00
62 e0 e0 3e 16 ff 00           # a19f |   mov [0x163e], 0xff
62 e0 e0 40 16 00 ff           # a1a6 |   mov [0x1640], 0xff00
62 e0 e0 42 16 00 ff           # a1ad |   mov [0x1642], 0xff00
62 e0 e0 8e 16 ff 00           # a1b4 |   mov [0x168e], 0xff
62 e0 e0 90 16 00 ff           # a1bb |   mov [0x1690], 0xff00
62 e0 e0 92 16 00 ff           # a1c2 |   mov [0x1692], 0xff00
62 e0 e0 de 16 ff 00           # a1c9 |   mov [0x16de], 0xff
62 e0 e0 e0 16 00 ff           # a1d0 |   mov [0x16e0], 0xff00
62 e0 e0 e2 16 00 ff           # a1d7 |   mov [0x16e2], 0xff00
62 e0 e0 2e 17 ff 00           # a1de |   mov [0x172e], 0xff
62 e0 e0 30 17 00 ff           # a1e5 |   mov [0x1730], 0xff00
62 e0 e0 32 17 00 ff           # a1ec |   mov [0x1732], 0xff00
62 e0 e0 7e 17 ff 00           # a1f3 |   mov [0x177e], 0xff
62 e0 e0 80 17 00 ff           # a1fa |   mov [0x1780], 0xff00
62 e0 e0 82 17 00 ff           # a201 |   mov [0x1782], 0xff00
62 e0 e0 ce 17 ff 00           # a208 |   mov [0x17ce], 0xff
62 e0 e0 d0 17 00 ff           # a20f |   mov [0x17d0], 0xff00
62 e0 e0 d2 17 00 ff           # a216 |   mov [0x17d2], 0xff00
62 e0 e0 1e 18 ff 00           # a21d |   mov [0x181e], 0xff
62 e0 e0 20 18 00 ff           # a224 |   mov [0x1820], 0xff00
62 e0 e0 22 18 00 ff           # a22b |   mov [0x1822], 0xff00
62 e0 e0 6e 18 ff 00           # a232 |   mov [0x186e], 0xff
62 e0 e0 70 18 00 ff           # a239 |   mov [0x1870], 0xff00
62 e0 e0 72 18 00 ff           # a240 |   mov [0x1872], 0xff00
62 e0 e0 be 18 ff 00           # a247 |   mov [0x18be], 0xff
62 e0 e0 c0 18 00 ff           # a24e |   mov [0x18c0], 0xff00
62 e0 e0 c2 18 00 ff           # a255 |   mov [0x18c2], 0xff00
62 e0 e0 0e 19 ff 00           # a25c |   mov [0x190e], 0xff
62 e0 e0 10 19 00 ff           # a263 |   mov [0x1910], 0xff00
62 e0 e0 12 19 00 ff           # a26a |   mov [0x1912], 0xff00
62 e0 e0 5e 19 ff 00           # a271 |   mov [0x195e], 0xff
62 e0 e0 60 19 0f 0f           # a278 |   mov [0x1960], 0xf0f
62 e0 e0 62 19 00 ff           # a27f |   mov [0x1962], 0xff00
62 e0 e0 ae 19 ff 00           # a286 |   mov [0x19ae], 0xff
62 e0 e0 b0 19 0f 0f           # a28d |   mov [0x19b0], 0xf0f
62 e0 e0 b2 19 00 ff           # a294 |   mov [0x19b2], 0xff00
62 e0 e0 fe 19 ff 00           # a29b |   mov [0x19fe], 0xff
62 e0 e0 00 1a 0f 0f           # a2a2 |   mov [0x1a00], 0xf0f
62 e0 e0 02 1a 00 ff           # a2a9 |   mov [0x1a02], 0xff00
62 e0 e0 4e 1a ff 00           # a2b0 |   mov [0x1a4e], 0xff
62 e0 e0 50 1a 0f 0f           # a2b7 |   mov [0x1a50], 0xf0f
62 e0 e0 52 1a 00 ff           # a2be |   mov [0x1a52], 0xff00
62 e0 e0 9e 1a ff 00           # a2c5 |   mov [0x1a9e], 0xff
62 e0 e0 a0 1a 0f 0f           # a2cc |   mov [0x1aa0], 0xf0f
62 e0 e0 a2 1a 00 ff           # a2d3 |   mov [0x1aa2], 0xff00
62 e0 e0 ee 1a ff 00           # a2da |   mov [0x1aee], 0xff
62 e0 e0 f0 1a 0f 0f           # a2e1 |   mov [0x1af0], 0xf0f
62 e0 e0 f2 1a 00 ff           # a2e8 |   mov [0x1af2], 0xff00
62 e0 e0 3e 1b ff 00           # a2ef |   mov [0x1b3e], 0xff
62 e0 e0 40 1b 0f 0f           # a2f6 |   mov [0x1b40], 0xf0f
62 e0 e0 42 1b 00 ff           # a2fd |   mov [0x1b42], 0xff00
62 e0 e0 8e 1b ff 00           # a304 |   mov [0x1b8e], 0xff
62 e0 e0 90 1b 0f 0f           # a30b |   mov [0x1b90], 0xf0f
62 e0 e0 92 1b 00 ff           # a312 |   mov [0x1b92], 0xff00
62 e0 e0 de 1b ff 00           # a319 |   mov [0x1bde], 0xff
62 e0 e0 e0 1b 0f 0f           # a320 |   mov [0x1be0], 0xf0f
62 e0 e0 e2 1b 00 ff           # a327 |   mov [0x1be2], 0xff00
62 e0 e0 2e 1c ff 00           # a32e |   mov [0x1c2e], 0xff
62 e0 e0 30 1c 0f 0f           # a335 |   mov [0x1c30], 0xf0f
62 e0 e0 32 1c 00 ff           # a33c |   mov [0x1c32], 0xff00
60 fc 00                       # a343 |   mov E, 0
62 e0 00 0a ff                 # a346 |   mov [0xff0a], 0
                               #      | _B_fn_start_1:
60 20 00                       # a34b |   mov A, 0
                               #      | _B_fn_start_2:
e8 20 1c f8 ff 10 00           # a34e |   jeq A, 0xff, ${_E_fn_start_2}:rel + PC
44 20                          # a355 |   inc A
08 40 40                       # a357 |   mul B, B
58 f8 f4 ff                    # a35a |   jmp ${_B_fn_start_2}:rel + PC
                               #      | _E_fn_start_2:
46 e0 0a ff                    # a35e |   inc [0xff0a]
44 fc                          # a362 |   inc E
62 e0 fc 00 10                 # a364 |   mov [0x1000], E
62 e0 fc b0 0f                 # a369 |   mov [0xfb0], E
62 e0 fc 60 0f                 # a36e |   mov [0xf60], E
62 e0 fc 10 0f                 # a373 |   mov [0xf10], E
62 e0 fc c0 0e                 # a378 |   mov [0xec0], E
62 e0 fc 70 0e                 # a37d |   mov [0xe70], E
62 e0 fc 20 0e                 # a382 |   mov [0xe20], E
62 e0 fc d0 0d                 # a387 |   mov [0xdd0], E
62 e0 fc 80 0d                 # a38c |   mov [0xd80], E
62 e0 fc 30 0d                 # a391 |   mov [0xd30], E
58 f8 b5 ff                    # a396 |   jmp ${_B_fn_start_1}:rel + PC
                               #      | _E_fn_start_1:
d8                             # a39a |   halt
dc                             # a39b |   ret
                               #      | end_fn_start:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
