                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_self_test:
                               #      | .boot:
60 20 1c fa                    # a000 |   mov A, 0xfa
ec 20 e0 f8 fa 00 54 00        # a004 |   jne A, 0xfa, ${start_test}:rel + PC
                               #      | fail:
d8                             # a00c |   halt
58 f8 ff ff                    # a00d |   jmp ${fail}:rel + PC
                               #      | success:
ec 20 e0 f8 ad de fb ff        # a011 |   jne A, 0xdead, ${fail}:rel + PC
ec 40 e0 f8 ef be f3 ff        # a019 |   jne B, 0xbeef, ${fail}:rel + PC
ec 60 e0 f8 83 49 eb ff        # a021 |   jne C, 0x4983, ${fail}:rel + PC
ec ff e0 f8 14 a6 e3 ff        # a029 |   jne H, 0xa614, ${fail}:rel + PC
60 80 ff                       # a031 |   mov D, H
00 20 e0 ab ac                 # a034 |   add A, 0xacab
00 40 e0 cc 41                 # a039 |   add B, 0x41cc
08 20 80                       # a03e |   mul A, D
34 20 e0 4a f2                 # a041 |   xor A, 0xf24a
34 60 e0 4f 49                 # a046 |   xor C, 0x494f
34 ff e0 30 5a                 # a04b |   xor H, 0x5a30
60 80 ff                       # a050 |   mov D, H
5c f8 d9 2d                    # a053 |   call ${fn_led_loop}:rel + PC
d8                             # a057 |   halt
                               #      | start_test:
                               #      | alu_test:
80 40 e0 e0 30 d2 12 a0        # a058 |   add B, 0xd230, 0xa012
ec 40 e0 f8 42 72 ac ff        # a060 |   jne B, 0x7242, ${fail}:rel + PC
84 40 e0 e0 30 d2 12 a0        # a068 |   sub B, 0xd230, 0xa012
ec 40 e0 f8 1e 32 9c ff        # a070 |   jne B, 0x321e, ${fail}:rel + PC
88 40 e0 e0 30 d2 12 a0        # a078 |   mul B, 0xd230, 0xa012
ec 40 e0 f8 60 c7 8c ff        # a080 |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 6c 83 84 ff        # a088 |   jne H, 0x836c, ${fail}:rel + PC
8c 40 e0 e0 30 d2 12 a0        # a090 |   imul B, 0xd230, 0xa012
ec 40 e0 f8 60 c7 74 ff        # a098 |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 2a 11 6c ff        # a0a0 |   jne H, 0x112a, ${fail}:rel + PC
a0 40 e0 e0 30 d2 12 a0        # a0a8 |   shr B, 0xd230, 0xa012
ec 40 e0 f8 8c 34 5c ff        # a0b0 |   jne B, 0x348c, ${fail}:rel + PC
a4 40 e0 e0 30 d2 12 a0        # a0b8 |   ishr B, 0xd230, 0xa012
ec 40 e0 f8 8c f4 4c ff        # a0c0 |   jne B, 0xf48c, ${fail}:rel + PC
a8 40 e0 e0 30 d2 12 a0        # a0c8 |   shl B, 0xd230, 0xa012
ec 40 e0 f8 c0 48 3c ff        # a0d0 |   jne B, 0x48c0, ${fail}:rel + PC
ac 40 e0 e0 30 d2 12 a0        # a0d8 |   and B, 0xd230, 0xa012
ec 40 e0 f8 10 80 2c ff        # a0e0 |   jne B, 0x8010, ${fail}:rel + PC
b0 40 e0 e0 30 d2 12 a0        # a0e8 |   or B, 0xd230, 0xa012
ec 40 e0 f8 32 f2 1c ff        # a0f0 |   jne B, 0xf232, ${fail}:rel + PC
b4 40 e0 e0 30 d2 12 a0        # a0f8 |   xor B, 0xd230, 0xa012
ec 40 e0 f8 22 72 0c ff        # a100 |   jne B, 0x7222, ${fail}:rel + PC
b8 40 e0 30 d2                 # a108 |   neg B, 0xd230
ec 40 e0 f8 d0 2d ff fe        # a10d |   jne B, 0x2dd0, ${fail}:rel + PC
bc 40 e0 30 d2                 # a115 |   not B, 0xd230
ec 40 e0 f8 cf 2d f2 fe        # a11a |   jne B, 0x2dcf, ${fail}:rel + PC
c0 40 e0 30 d2                 # a122 |   bool B, 0xd230
ec 40 1c f8 01 e5 fe           # a127 |   jne B, 0x1, ${fail}:rel + PC
c4 40 e0 30 d2                 # a12e |   inc B, 0xd230
ec 40 e0 f8 31 d2 d9 fe        # a133 |   jne B, 0xd231, ${fail}:rel + PC
c8 40 e0 30 d2                 # a13b |   dec B, 0xd230
ec 40 e0 f8 2f d2 cc fe        # a140 |   jne B, 0xd22f, ${fail}:rel + PC
80 40 e0 e0 ad 00 37 da        # a148 |   add B, 0xad, 0xda37
ec 40 e0 f8 e4 da bc fe        # a150 |   jne B, 0xdae4, ${fail}:rel + PC
84 40 e0 e0 ad 00 37 da        # a158 |   sub B, 0xad, 0xda37
ec 40 e0 f8 76 26 ac fe        # a160 |   jne B, 0x2676, ${fail}:rel + PC
88 40 e0 e0 ad 00 37 da        # a168 |   mul B, 0xad, 0xda37
ec 40 e0 f8 2b 77 9c fe        # a170 |   jne B, 0x772b, ${fail}:rel + PC
ec ff e0 f8 93 00 94 fe        # a178 |   jne H, 0x93, ${fail}:rel + PC
8c 40 e0 e0 ad 00 37 da        # a180 |   imul B, 0xad, 0xda37
ec 40 e0 f8 2b 77 84 fe        # a188 |   jne B, 0x772b, ${fail}:rel + PC
ec ff 1c f8 e6 7c fe           # a190 |   jne H, 0xe6, ${fail}:rel + PC
a0 40 e0 e0 ad 00 37 da        # a197 |   shr B, 0xad, 0xda37
ec 40 1c f8 01 6d fe           # a19f |   jne B, 0x1, ${fail}:rel + PC
a4 40 e0 e0 ad 00 37 da        # a1a6 |   ishr B, 0xad, 0xda37
ec 40 1c f8 01 5e fe           # a1ae |   jne B, 0x1, ${fail}:rel + PC
a8 40 e0 e0 ad 00 37 da        # a1b5 |   shl B, 0xad, 0xda37
ec 40 e0 f8 80 56 4f fe        # a1bd |   jne B, 0x5680, ${fail}:rel + PC
ac 40 e0 e0 ad 00 37 da        # a1c5 |   and B, 0xad, 0xda37
ec 40 1c f8 25 3f fe           # a1cd |   jne B, 0x25, ${fail}:rel + PC
b0 40 e0 e0 ad 00 37 da        # a1d4 |   or B, 0xad, 0xda37
ec 40 e0 f8 bf da 30 fe        # a1dc |   jne B, 0xdabf, ${fail}:rel + PC
b4 40 e0 e0 ad 00 37 da        # a1e4 |   xor B, 0xad, 0xda37
ec 40 e0 f8 9a da 20 fe        # a1ec |   jne B, 0xda9a, ${fail}:rel + PC
b8 40 e0 ad 00                 # a1f4 |   neg B, 0xad
ec 40 e0 f8 53 ff 13 fe        # a1f9 |   jne B, 0xff53, ${fail}:rel + PC
bc 40 e0 ad 00                 # a201 |   not B, 0xad
ec 40 e0 f8 52 ff 06 fe        # a206 |   jne B, 0xff52, ${fail}:rel + PC
c0 40 e0 ad 00                 # a20e |   bool B, 0xad
ec 40 1c f8 01 f9 fd           # a213 |   jne B, 0x1, ${fail}:rel + PC
c4 40 e0 ad 00                 # a21a |   inc B, 0xad
ec 40 e0 f8 ae 00 ed fd        # a21f |   jne B, 0xae, ${fail}:rel + PC
c8 40 e0 ad 00                 # a227 |   dec B, 0xad
ec 40 e0 f8 ac 00 e0 fd        # a22c |   jne B, 0xac, ${fail}:rel + PC
60 40 e0 ad f0                 # a234 |   mov B, 0xf0ad
00 40 e0 3f 2a                 # a239 |   add B, 0x2a3f
ec 40 e0 f8 ec 1a ce fd        # a23e |   jne B, 0x1aec, ${fail}:rel + PC
60 40 e0 ad f0                 # a246 |   mov B, 0xf0ad
04 40 e0 3f 2a                 # a24b |   sub B, 0x2a3f
ec 40 e0 f8 6e c6 bc fd        # a250 |   jne B, 0xc66e, ${fail}:rel + PC
60 40 e0 ad f0                 # a258 |   mov B, 0xf0ad
08 40 e0 3f 2a                 # a25d |   mul B, 0x2a3f
ec 40 e0 f8 93 9c aa fd        # a262 |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 b7 27 a2 fd        # a26a |   jne H, 0x27b7, ${fail}:rel + PC
60 40 e0 ad f0                 # a272 |   mov B, 0xf0ad
0c 40 e0 3f 2a                 # a277 |   imul B, 0x2a3f
ec 40 e0 f8 93 9c 90 fd        # a27c |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 78 fd 88 fd        # a284 |   jne H, 0xfd78, ${fail}:rel + PC
60 40 e0 ad f0                 # a28c |   mov B, 0xf0ad
20 40 e0 3f 2a                 # a291 |   shr B, 0x2a3f
ec 40 1c f8 01 76 fd           # a296 |   jne B, 0x1, ${fail}:rel + PC
60 40 e0 ad f0                 # a29d |   mov B, 0xf0ad
24 40 e0 3f 2a                 # a2a2 |   ishr B, 0x2a3f
ec 40 1c f8 ff 65 fd           # a2a7 |   jne B, 0xff, ${fail}:rel + PC
60 40 e0 ad f0                 # a2ae |   mov B, 0xf0ad
28 40 e0 3f 2a                 # a2b3 |   shl B, 0x2a3f
ec 40 e0 f8 00 80 54 fd        # a2b8 |   jne B, 0x8000, ${fail}:rel + PC
60 40 e0 ad f0                 # a2c0 |   mov B, 0xf0ad
2c 40 e0 3f 2a                 # a2c5 |   and B, 0x2a3f
ec 40 e0 f8 2d 20 42 fd        # a2ca |   jne B, 0x202d, ${fail}:rel + PC
60 40 e0 ad f0                 # a2d2 |   mov B, 0xf0ad
30 40 e0 3f 2a                 # a2d7 |   or B, 0x2a3f
ec 40 e0 f8 bf fa 30 fd        # a2dc |   jne B, 0xfabf, ${fail}:rel + PC
60 40 e0 ad f0                 # a2e4 |   mov B, 0xf0ad
34 40 e0 3f 2a                 # a2e9 |   xor B, 0x2a3f
ec 40 e0 f8 92 da 1e fd        # a2ee |   jne B, 0xda92, ${fail}:rel + PC
60 40 e0 ad f0                 # a2f6 |   mov B, 0xf0ad
38 40                          # a2fb |   neg B
ec 40 e0 f8 53 0f 0f fd        # a2fd |   jne B, 0xf53, ${fail}:rel + PC
60 40 e0 ad f0                 # a305 |   mov B, 0xf0ad
3c 40                          # a30a |   not B
ec 40 e0 f8 52 0f 00 fd        # a30c |   jne B, 0xf52, ${fail}:rel + PC
60 40 e0 ad f0                 # a314 |   mov B, 0xf0ad
40 40                          # a319 |   bool B
ec 40 1c f8 01 f1 fc           # a31b |   jne B, 0x1, ${fail}:rel + PC
60 40 e0 ad f0                 # a322 |   mov B, 0xf0ad
44 40                          # a327 |   inc B
ec 40 e0 f8 ae f0 e3 fc        # a329 |   jne B, 0xf0ae, ${fail}:rel + PC
60 40 e0 ad f0                 # a331 |   mov B, 0xf0ad
48 40                          # a336 |   dec B
ec 40 e0 f8 ac f0 d4 fc        # a338 |   jne B, 0xf0ac, ${fail}:rel + PC
60 40 00                       # a340 |   mov B, 0
00 40 e0 ad de                 # a343 |   add B, 0xdead
ec 40 e0 f8 ad de c4 fc        # a348 |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # a350 |   mov B, 0
04 40 e0 ad de                 # a353 |   sub B, 0xdead
ec 40 e0 f8 53 21 b4 fc        # a358 |   jne B, 0x2153, ${fail}:rel + PC
60 40 00                       # a360 |   mov B, 0
08 40 e0 ad de                 # a363 |   mul B, 0xdead
ec 40 00 f8 a4 fc              # a368 |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 9e fc              # a36e |   jne H, 0, ${fail}:rel + PC
60 40 00                       # a374 |   mov B, 0
0c 40 e0 ad de                 # a377 |   imul B, 0xdead
ec 40 00 f8 90 fc              # a37c |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 8a fc              # a382 |   jne H, 0, ${fail}:rel + PC
60 40 00                       # a388 |   mov B, 0
20 40 e0 ad de                 # a38b |   shr B, 0xdead
ec 40 00 f8 7c fc              # a390 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # a396 |   mov B, 0
24 40 e0 ad de                 # a399 |   ishr B, 0xdead
ec 40 00 f8 6e fc              # a39e |   jne B, 0, ${fail}:rel + PC
60 40 00                       # a3a4 |   mov B, 0
28 40 e0 ad de                 # a3a7 |   shl B, 0xdead
ec 40 00 f8 60 fc              # a3ac |   jne B, 0, ${fail}:rel + PC
60 40 00                       # a3b2 |   mov B, 0
2c 40 e0 ad de                 # a3b5 |   and B, 0xdead
ec 40 00 f8 52 fc              # a3ba |   jne B, 0, ${fail}:rel + PC
60 40 00                       # a3c0 |   mov B, 0
30 40 e0 ad de                 # a3c3 |   or B, 0xdead
ec 40 e0 f8 ad de 44 fc        # a3c8 |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # a3d0 |   mov B, 0
34 40 e0 ad de                 # a3d3 |   xor B, 0xdead
ec 40 e0 f8 ad de 34 fc        # a3d8 |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # a3e0 |   mov B, 0
38 40                          # a3e3 |   neg B
ec 40 00 f8 27 fc              # a3e5 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # a3eb |   mov B, 0
3c 40                          # a3ee |   not B
ec 40 1c f8 ff 1c fc           # a3f0 |   jne B, 0xff, ${fail}:rel + PC
60 40 00                       # a3f7 |   mov B, 0
40 40                          # a3fa |   bool B
ec 40 00 f8 10 fc              # a3fc |   jne B, 0, ${fail}:rel + PC
60 40 00                       # a402 |   mov B, 0
44 40                          # a405 |   inc B
ec 40 1c f8 01 05 fc           # a407 |   jne B, 0x1, ${fail}:rel + PC
60 40 00                       # a40e |   mov B, 0
48 40                          # a411 |   dec B
ec 40 1c f8 ff f9 fb           # a413 |   jne B, 0xff, ${fail}:rel + PC
                               #      | alu_test_direct_reg:
60 60 e0 30 d2                 # a41a |   mov C, 0xd230
60 80 e0 12 a0                 # a41f |   mov D, 0xa012
80 40 60 80                    # a424 |   add B, C, D
ec 40 e0 f8 42 72 e4 fb        # a428 |   jne B, 0x7242, ${fail}:rel + PC
60 60 e0 30 d2                 # a430 |   mov C, 0xd230
60 80 e0 12 a0                 # a435 |   mov D, 0xa012
84 40 60 80                    # a43a |   sub B, C, D
ec 40 e0 f8 1e 32 ce fb        # a43e |   jne B, 0x321e, ${fail}:rel + PC
60 60 e0 30 d2                 # a446 |   mov C, 0xd230
60 80 e0 12 a0                 # a44b |   mov D, 0xa012
88 40 60 80                    # a450 |   mul B, C, D
ec 40 e0 f8 60 c7 b8 fb        # a454 |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 6c 83 b0 fb        # a45c |   jne H, 0x836c, ${fail}:rel + PC
60 60 e0 30 d2                 # a464 |   mov C, 0xd230
60 80 e0 12 a0                 # a469 |   mov D, 0xa012
8c 40 60 80                    # a46e |   imul B, C, D
ec 40 e0 f8 60 c7 9a fb        # a472 |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 2a 11 92 fb        # a47a |   jne H, 0x112a, ${fail}:rel + PC
60 60 e0 30 d2                 # a482 |   mov C, 0xd230
60 80 e0 12 a0                 # a487 |   mov D, 0xa012
a0 40 60 80                    # a48c |   shr B, C, D
ec 40 e0 f8 8c 34 7c fb        # a490 |   jne B, 0x348c, ${fail}:rel + PC
60 60 e0 30 d2                 # a498 |   mov C, 0xd230
60 80 e0 12 a0                 # a49d |   mov D, 0xa012
a4 40 60 80                    # a4a2 |   ishr B, C, D
ec 40 e0 f8 8c f4 66 fb        # a4a6 |   jne B, 0xf48c, ${fail}:rel + PC
60 60 e0 30 d2                 # a4ae |   mov C, 0xd230
60 80 e0 12 a0                 # a4b3 |   mov D, 0xa012
a8 40 60 80                    # a4b8 |   shl B, C, D
ec 40 e0 f8 c0 48 50 fb        # a4bc |   jne B, 0x48c0, ${fail}:rel + PC
60 60 e0 30 d2                 # a4c4 |   mov C, 0xd230
60 80 e0 12 a0                 # a4c9 |   mov D, 0xa012
ac 40 60 80                    # a4ce |   and B, C, D
ec 40 e0 f8 10 80 3a fb        # a4d2 |   jne B, 0x8010, ${fail}:rel + PC
60 60 e0 30 d2                 # a4da |   mov C, 0xd230
60 80 e0 12 a0                 # a4df |   mov D, 0xa012
b0 40 60 80                    # a4e4 |   or B, C, D
ec 40 e0 f8 32 f2 24 fb        # a4e8 |   jne B, 0xf232, ${fail}:rel + PC
60 60 e0 30 d2                 # a4f0 |   mov C, 0xd230
60 80 e0 12 a0                 # a4f5 |   mov D, 0xa012
b4 40 60 80                    # a4fa |   xor B, C, D
ec 40 e0 f8 22 72 0e fb        # a4fe |   jne B, 0x7222, ${fail}:rel + PC
60 60 e0 30 d2                 # a506 |   mov C, 0xd230
b8 40 60                       # a50b |   neg B, C
ec 40 e0 f8 d0 2d fe fa        # a50e |   jne B, 0x2dd0, ${fail}:rel + PC
60 60 e0 30 d2                 # a516 |   mov C, 0xd230
bc 40 60                       # a51b |   not B, C
ec 40 e0 f8 cf 2d ee fa        # a51e |   jne B, 0x2dcf, ${fail}:rel + PC
60 60 e0 30 d2                 # a526 |   mov C, 0xd230
c0 40 60                       # a52b |   bool B, C
ec 40 1c f8 01 de fa           # a52e |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 30 d2                 # a535 |   mov C, 0xd230
c4 40 60                       # a53a |   inc B, C
ec 40 e0 f8 31 d2 cf fa        # a53d |   jne B, 0xd231, ${fail}:rel + PC
60 60 e0 30 d2                 # a545 |   mov C, 0xd230
c8 40 60                       # a54a |   dec B, C
ec 40 e0 f8 2f d2 bf fa        # a54d |   jne B, 0xd22f, ${fail}:rel + PC
60 60 e0 ad 00                 # a555 |   mov C, 0xad
60 80 e0 37 da                 # a55a |   mov D, 0xda37
80 40 60 80                    # a55f |   add B, C, D
ec 40 e0 f8 e4 da a9 fa        # a563 |   jne B, 0xdae4, ${fail}:rel + PC
60 60 e0 ad 00                 # a56b |   mov C, 0xad
60 80 e0 37 da                 # a570 |   mov D, 0xda37
84 40 60 80                    # a575 |   sub B, C, D
ec 40 e0 f8 76 26 93 fa        # a579 |   jne B, 0x2676, ${fail}:rel + PC
60 60 e0 ad 00                 # a581 |   mov C, 0xad
60 80 e0 37 da                 # a586 |   mov D, 0xda37
88 40 60 80                    # a58b |   mul B, C, D
ec 40 e0 f8 2b 77 7d fa        # a58f |   jne B, 0x772b, ${fail}:rel + PC
ec ff e0 f8 93 00 75 fa        # a597 |   jne H, 0x93, ${fail}:rel + PC
60 60 e0 ad 00                 # a59f |   mov C, 0xad
60 80 e0 37 da                 # a5a4 |   mov D, 0xda37
8c 40 60 80                    # a5a9 |   imul B, C, D
ec 40 e0 f8 2b 77 5f fa        # a5ad |   jne B, 0x772b, ${fail}:rel + PC
ec ff 1c f8 e6 57 fa           # a5b5 |   jne H, 0xe6, ${fail}:rel + PC
60 60 e0 ad 00                 # a5bc |   mov C, 0xad
60 80 e0 37 da                 # a5c1 |   mov D, 0xda37
a0 40 60 80                    # a5c6 |   shr B, C, D
ec 40 1c f8 01 42 fa           # a5ca |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad 00                 # a5d1 |   mov C, 0xad
60 80 e0 37 da                 # a5d6 |   mov D, 0xda37
a4 40 60 80                    # a5db |   ishr B, C, D
ec 40 1c f8 01 2d fa           # a5df |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad 00                 # a5e6 |   mov C, 0xad
60 80 e0 37 da                 # a5eb |   mov D, 0xda37
a8 40 60 80                    # a5f0 |   shl B, C, D
ec 40 e0 f8 80 56 18 fa        # a5f4 |   jne B, 0x5680, ${fail}:rel + PC
60 60 e0 ad 00                 # a5fc |   mov C, 0xad
60 80 e0 37 da                 # a601 |   mov D, 0xda37
ac 40 60 80                    # a606 |   and B, C, D
ec 40 1c f8 25 02 fa           # a60a |   jne B, 0x25, ${fail}:rel + PC
60 60 e0 ad 00                 # a611 |   mov C, 0xad
60 80 e0 37 da                 # a616 |   mov D, 0xda37
b0 40 60 80                    # a61b |   or B, C, D
ec 40 e0 f8 bf da ed f9        # a61f |   jne B, 0xdabf, ${fail}:rel + PC
60 60 e0 ad 00                 # a627 |   mov C, 0xad
60 80 e0 37 da                 # a62c |   mov D, 0xda37
b4 40 60 80                    # a631 |   xor B, C, D
ec 40 e0 f8 9a da d7 f9        # a635 |   jne B, 0xda9a, ${fail}:rel + PC
60 60 e0 ad 00                 # a63d |   mov C, 0xad
b8 40 60                       # a642 |   neg B, C
ec 40 e0 f8 53 ff c7 f9        # a645 |   jne B, 0xff53, ${fail}:rel + PC
60 60 e0 ad 00                 # a64d |   mov C, 0xad
bc 40 60                       # a652 |   not B, C
ec 40 e0 f8 52 ff b7 f9        # a655 |   jne B, 0xff52, ${fail}:rel + PC
60 60 e0 ad 00                 # a65d |   mov C, 0xad
c0 40 60                       # a662 |   bool B, C
ec 40 1c f8 01 a7 f9           # a665 |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad 00                 # a66c |   mov C, 0xad
c4 40 60                       # a671 |   inc B, C
ec 40 e0 f8 ae 00 98 f9        # a674 |   jne B, 0xae, ${fail}:rel + PC
60 60 e0 ad 00                 # a67c |   mov C, 0xad
c8 40 60                       # a681 |   dec B, C
ec 40 e0 f8 ac 00 88 f9        # a684 |   jne B, 0xac, ${fail}:rel + PC
60 60 e0 ad f0                 # a68c |   mov C, 0xf0ad
60 80 e0 3f 2a                 # a691 |   mov D, 0x2a3f
60 40 60                       # a696 |   mov B, C
00 40 80                       # a699 |   add B, D
ec 40 e0 f8 ec 1a 70 f9        # a69c |   jne B, 0x1aec, ${fail}:rel + PC
60 60 e0 ad f0                 # a6a4 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # a6a9 |   mov D, 0x2a3f
60 40 60                       # a6ae |   mov B, C
04 40 80                       # a6b1 |   sub B, D
ec 40 e0 f8 6e c6 58 f9        # a6b4 |   jne B, 0xc66e, ${fail}:rel + PC
60 60 e0 ad f0                 # a6bc |   mov C, 0xf0ad
60 80 e0 3f 2a                 # a6c1 |   mov D, 0x2a3f
60 40 60                       # a6c6 |   mov B, C
08 40 80                       # a6c9 |   mul B, D
ec 40 e0 f8 93 9c 40 f9        # a6cc |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 b7 27 38 f9        # a6d4 |   jne H, 0x27b7, ${fail}:rel + PC
60 60 e0 ad f0                 # a6dc |   mov C, 0xf0ad
60 80 e0 3f 2a                 # a6e1 |   mov D, 0x2a3f
60 40 60                       # a6e6 |   mov B, C
0c 40 80                       # a6e9 |   imul B, D
ec 40 e0 f8 93 9c 20 f9        # a6ec |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 78 fd 18 f9        # a6f4 |   jne H, 0xfd78, ${fail}:rel + PC
60 60 e0 ad f0                 # a6fc |   mov C, 0xf0ad
60 80 e0 3f 2a                 # a701 |   mov D, 0x2a3f
60 40 60                       # a706 |   mov B, C
20 40 80                       # a709 |   shr B, D
ec 40 1c f8 01 00 f9           # a70c |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad f0                 # a713 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # a718 |   mov D, 0x2a3f
60 40 60                       # a71d |   mov B, C
24 40 80                       # a720 |   ishr B, D
ec 40 1c f8 ff e9 f8           # a723 |   jne B, 0xff, ${fail}:rel + PC
60 60 e0 ad f0                 # a72a |   mov C, 0xf0ad
60 80 e0 3f 2a                 # a72f |   mov D, 0x2a3f
60 40 60                       # a734 |   mov B, C
28 40 80                       # a737 |   shl B, D
ec 40 e0 f8 00 80 d2 f8        # a73a |   jne B, 0x8000, ${fail}:rel + PC
60 60 e0 ad f0                 # a742 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # a747 |   mov D, 0x2a3f
60 40 60                       # a74c |   mov B, C
2c 40 80                       # a74f |   and B, D
ec 40 e0 f8 2d 20 ba f8        # a752 |   jne B, 0x202d, ${fail}:rel + PC
60 60 e0 ad f0                 # a75a |   mov C, 0xf0ad
60 80 e0 3f 2a                 # a75f |   mov D, 0x2a3f
60 40 60                       # a764 |   mov B, C
30 40 80                       # a767 |   or B, D
ec 40 e0 f8 bf fa a2 f8        # a76a |   jne B, 0xfabf, ${fail}:rel + PC
60 60 e0 ad f0                 # a772 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # a777 |   mov D, 0x2a3f
60 40 60                       # a77c |   mov B, C
34 40 80                       # a77f |   xor B, D
ec 40 e0 f8 92 da 8a f8        # a782 |   jne B, 0xda92, ${fail}:rel + PC
60 60 e0 ad f0                 # a78a |   mov C, 0xf0ad
60 40 60                       # a78f |   mov B, C
38 40                          # a792 |   neg B
ec 40 e0 f8 53 0f 78 f8        # a794 |   jne B, 0xf53, ${fail}:rel + PC
60 60 e0 ad f0                 # a79c |   mov C, 0xf0ad
60 40 60                       # a7a1 |   mov B, C
3c 40                          # a7a4 |   not B
ec 40 e0 f8 52 0f 66 f8        # a7a6 |   jne B, 0xf52, ${fail}:rel + PC
60 60 e0 ad f0                 # a7ae |   mov C, 0xf0ad
60 40 60                       # a7b3 |   mov B, C
40 40                          # a7b6 |   bool B
ec 40 1c f8 01 54 f8           # a7b8 |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad f0                 # a7bf |   mov C, 0xf0ad
60 40 60                       # a7c4 |   mov B, C
44 40                          # a7c7 |   inc B
ec 40 e0 f8 ae f0 43 f8        # a7c9 |   jne B, 0xf0ae, ${fail}:rel + PC
60 60 e0 ad f0                 # a7d1 |   mov C, 0xf0ad
60 40 60                       # a7d6 |   mov B, C
48 40                          # a7d9 |   dec B
ec 40 e0 f8 ac f0 31 f8        # a7db |   jne B, 0xf0ac, ${fail}:rel + PC
60 60 00                       # a7e3 |   mov C, 0
60 80 e0 ad de                 # a7e6 |   mov D, 0xdead
60 40 60                       # a7eb |   mov B, C
00 40 80                       # a7ee |   add B, D
ec 40 e0 f8 ad de 1b f8        # a7f1 |   jne B, 0xdead, ${fail}:rel + PC
60 60 00                       # a7f9 |   mov C, 0
60 80 e0 ad de                 # a7fc |   mov D, 0xdead
60 40 60                       # a801 |   mov B, C
04 40 80                       # a804 |   sub B, D
ec 40 e0 f8 53 21 05 f8        # a807 |   jne B, 0x2153, ${fail}:rel + PC
60 60 00                       # a80f |   mov C, 0
60 80 e0 ad de                 # a812 |   mov D, 0xdead
60 40 60                       # a817 |   mov B, C
08 40 80                       # a81a |   mul B, D
ec 40 00 f8 ef f7              # a81d |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 e9 f7              # a823 |   jne H, 0, ${fail}:rel + PC
60 60 00                       # a829 |   mov C, 0
60 80 e0 ad de                 # a82c |   mov D, 0xdead
60 40 60                       # a831 |   mov B, C
0c 40 80                       # a834 |   imul B, D
ec 40 00 f8 d5 f7              # a837 |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 cf f7              # a83d |   jne H, 0, ${fail}:rel + PC
60 60 00                       # a843 |   mov C, 0
60 80 e0 ad de                 # a846 |   mov D, 0xdead
60 40 60                       # a84b |   mov B, C
20 40 80                       # a84e |   shr B, D
ec 40 00 f8 bb f7              # a851 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # a857 |   mov C, 0
60 80 e0 ad de                 # a85a |   mov D, 0xdead
60 40 60                       # a85f |   mov B, C
24 40 80                       # a862 |   ishr B, D
ec 40 00 f8 a7 f7              # a865 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # a86b |   mov C, 0
60 80 e0 ad de                 # a86e |   mov D, 0xdead
60 40 60                       # a873 |   mov B, C
28 40 80                       # a876 |   shl B, D
ec 40 00 f8 93 f7              # a879 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # a87f |   mov C, 0
60 80 e0 ad de                 # a882 |   mov D, 0xdead
60 40 60                       # a887 |   mov B, C
2c 40 80                       # a88a |   and B, D
ec 40 00 f8 7f f7              # a88d |   jne B, 0, ${fail}:rel + PC
60 60 00                       # a893 |   mov C, 0
60 80 e0 ad de                 # a896 |   mov D, 0xdead
60 40 60                       # a89b |   mov B, C
30 40 80                       # a89e |   or B, D
ec 40 e0 f8 ad de 6b f7        # a8a1 |   jne B, 0xdead, ${fail}:rel + PC
60 60 00                       # a8a9 |   mov C, 0
60 80 e0 ad de                 # a8ac |   mov D, 0xdead
60 40 60                       # a8b1 |   mov B, C
34 40 80                       # a8b4 |   xor B, D
ec 40 e0 f8 ad de 55 f7        # a8b7 |   jne B, 0xdead, ${fail}:rel + PC
60 60 00                       # a8bf |   mov C, 0
60 40 60                       # a8c2 |   mov B, C
38 40                          # a8c5 |   neg B
ec 40 00 f8 45 f7              # a8c7 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # a8cd |   mov C, 0
60 40 60                       # a8d0 |   mov B, C
3c 40                          # a8d3 |   not B
ec 40 1c f8 ff 37 f7           # a8d5 |   jne B, 0xff, ${fail}:rel + PC
60 60 00                       # a8dc |   mov C, 0
60 40 60                       # a8df |   mov B, C
40 40                          # a8e2 |   bool B
ec 40 00 f8 28 f7              # a8e4 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # a8ea |   mov C, 0
60 40 60                       # a8ed |   mov B, C
44 40                          # a8f0 |   inc B
ec 40 1c f8 01 1a f7           # a8f2 |   jne B, 0x1, ${fail}:rel + PC
60 60 00                       # a8f9 |   mov C, 0
60 40 60                       # a8fc |   mov B, C
48 40                          # a8ff |   dec B
ec 40 1c f8 ff 0b f7           # a901 |   jne B, 0xff, ${fail}:rel + PC
                               #      | jmp_test:
e8 1c 1c f8 ab 2b 04 f7        # a908 |   jeq 0xab, 0x2b, ${fail}:rel + PC
ec 1c 1c f8 ab 2b 0c 00        # a910 |   jne 0xab, 0x2b, ${_L_test_jmp_1}:rel + PC
58 f8 f4 f6                    # a918 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_1:
f0 1c 1c f8 ab 2b f0 f6        # a91c |   jlt 0xab, 0x2b, ${fail}:rel + PC
f4 1c 1c f8 ab 2b e8 f6        # a924 |   jle 0xab, 0x2b, ${fail}:rel + PC
f8 1c 1c f8 ab 2b 0c 00        # a92c |   jgt 0xab, 0x2b, ${_L_test_jmp_2}:rel + PC
58 f8 d8 f6                    # a934 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_2:
fc 1c 1c f8 ab 2b 0c 00        # a938 |   jge 0xab, 0x2b, ${_L_test_jmp_3}:rel + PC
58 f8 cc f6                    # a940 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_3:
50 1c 1c ab 2b                 # a944 |   cmp 0xab, 0x2b
68 f8 c3 f6                    # a949 |   jeq ${fail}:rel + PC
6c f8 08 00                    # a94d |   jne ${_L_test_jmp_4}:rel + PC
58 f8 bb f6                    # a951 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_4:
70 f8 b7 f6                    # a955 |   jlt ${fail}:rel + PC
74 f8 b3 f6                    # a959 |   jle ${fail}:rel + PC
78 f8 08 00                    # a95d |   jgt ${_L_test_jmp_5}:rel + PC
58 f8 ab f6                    # a961 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_5:
7c f8 08 00                    # a965 |   jge ${_L_test_jmp_6}:rel + PC
58 f8 a3 f6                    # a969 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_6:
d0 1c 1c ab 2b                 # a96d |   icmp 0xab, 0x2b
68 f8 9a f6                    # a972 |   jeq ${fail}:rel + PC
6c f8 08 00                    # a976 |   jne ${_L_test_jmp_7}:rel + PC
58 f8 92 f6                    # a97a |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_7:
70 f8 08 00                    # a97e |   jlt ${_L_test_jmp_8}:rel + PC
58 f8 8a f6                    # a982 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_8:
74 f8 08 00                    # a986 |   jle ${_L_test_jmp_9}:rel + PC
58 f8 82 f6                    # a98a |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_9:
78 f8 7e f6                    # a98e |   jgt ${fail}:rel + PC
7c f8 7a f6                    # a992 |   jge ${fail}:rel + PC
e8 1c 1c f8 2b ab 76 f6        # a996 |   jeq 0x2b, 0xab, ${fail}:rel + PC
ec 1c 1c f8 2b ab 0c 00        # a99e |   jne 0x2b, 0xab, ${_L_test_jmp_10}:rel + PC
58 f8 66 f6                    # a9a6 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_10:
f0 1c 1c f8 2b ab 0c 00        # a9aa |   jlt 0x2b, 0xab, ${_L_test_jmp_11}:rel + PC
58 f8 5a f6                    # a9b2 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_11:
f4 1c 1c f8 2b ab 0c 00        # a9b6 |   jle 0x2b, 0xab, ${_L_test_jmp_12}:rel + PC
58 f8 4e f6                    # a9be |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_12:
f8 1c 1c f8 2b ab 4a f6        # a9c2 |   jgt 0x2b, 0xab, ${fail}:rel + PC
fc 1c 1c f8 2b ab 42 f6        # a9ca |   jge 0x2b, 0xab, ${fail}:rel + PC
50 1c 1c 2b ab                 # a9d2 |   cmp 0x2b, 0xab
68 f8 35 f6                    # a9d7 |   jeq ${fail}:rel + PC
6c f8 08 00                    # a9db |   jne ${_L_test_jmp_13}:rel + PC
58 f8 2d f6                    # a9df |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_13:
70 f8 08 00                    # a9e3 |   jlt ${_L_test_jmp_14}:rel + PC
58 f8 25 f6                    # a9e7 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_14:
74 f8 08 00                    # a9eb |   jle ${_L_test_jmp_15}:rel + PC
58 f8 1d f6                    # a9ef |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_15:
78 f8 19 f6                    # a9f3 |   jgt ${fail}:rel + PC
7c f8 15 f6                    # a9f7 |   jge ${fail}:rel + PC
d0 1c 1c 2b ab                 # a9fb |   icmp 0x2b, 0xab
68 f8 0c f6                    # aa00 |   jeq ${fail}:rel + PC
6c f8 08 00                    # aa04 |   jne ${_L_test_jmp_16}:rel + PC
58 f8 04 f6                    # aa08 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_16:
70 f8 00 f6                    # aa0c |   jlt ${fail}:rel + PC
74 f8 fc f5                    # aa10 |   jle ${fail}:rel + PC
78 f8 08 00                    # aa14 |   jgt ${_L_test_jmp_17}:rel + PC
58 f8 f4 f5                    # aa18 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_17:
7c f8 08 00                    # aa1c |   jge ${_L_test_jmp_18}:rel + PC
58 f8 ec f5                    # aa20 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_18:
e8 1c 1c f8 ab ab 0c 00        # aa24 |   jeq 0xab, 0xab, ${_L_test_jmp_19}:rel + PC
58 f8 e0 f5                    # aa2c |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_19:
ec 1c 1c f8 ab ab dc f5        # aa30 |   jne 0xab, 0xab, ${fail}:rel + PC
f0 1c 1c f8 ab ab d4 f5        # aa38 |   jlt 0xab, 0xab, ${fail}:rel + PC
f4 1c 1c f8 ab ab 0c 00        # aa40 |   jle 0xab, 0xab, ${_L_test_jmp_20}:rel + PC
58 f8 c4 f5                    # aa48 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_20:
f8 1c 1c f8 ab ab c0 f5        # aa4c |   jgt 0xab, 0xab, ${fail}:rel + PC
fc 1c 1c f8 ab ab 0c 00        # aa54 |   jge 0xab, 0xab, ${_L_test_jmp_21}:rel + PC
58 f8 b0 f5                    # aa5c |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_21:
50 1c 1c ab ab                 # aa60 |   cmp 0xab, 0xab
68 f8 08 00                    # aa65 |   jeq ${_L_test_jmp_22}:rel + PC
58 f8 a3 f5                    # aa69 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_22:
6c f8 9f f5                    # aa6d |   jne ${fail}:rel + PC
70 f8 9b f5                    # aa71 |   jlt ${fail}:rel + PC
74 f8 08 00                    # aa75 |   jle ${_L_test_jmp_23}:rel + PC
58 f8 93 f5                    # aa79 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_23:
78 f8 8f f5                    # aa7d |   jgt ${fail}:rel + PC
7c f8 08 00                    # aa81 |   jge ${_L_test_jmp_24}:rel + PC
58 f8 87 f5                    # aa85 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_24:
d0 1c 1c ab ab                 # aa89 |   icmp 0xab, 0xab
68 f8 08 00                    # aa8e |   jeq ${_L_test_jmp_25}:rel + PC
58 f8 7a f5                    # aa92 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_25:
6c f8 76 f5                    # aa96 |   jne ${fail}:rel + PC
70 f8 72 f5                    # aa9a |   jlt ${fail}:rel + PC
74 f8 08 00                    # aa9e |   jle ${_L_test_jmp_26}:rel + PC
58 f8 6a f5                    # aaa2 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_26:
78 f8 66 f5                    # aaa6 |   jgt ${fail}:rel + PC
7c f8 08 00                    # aaaa |   jge ${_L_test_jmp_27}:rel + PC
58 f8 5e f5                    # aaae |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_27:
                               #      | test_uop_get_arg:
60 a0 e0 00 70                 # aab2 |   mov SP, 0x7000
60 20 e0 aa 00                 # aab7 |   mov A, 0xaa
60 40 e0 bb 00                 # aabc |   mov B, 0xbb
60 fe e0 55 01                 # aac1 |   mov G, 0x155
b6 e0 1c fe 39 30 85           # aac6 |   xor [0x3039], -123, G
ee e0 e0 f8 39 30 d0 fe 3f f5  # aacd |   jne [0x3039], 0xfed0, ${fail}:rel + PC
ae 3e fe 21 f6                 # aad7 |   and [A*4 + -10], G, A*2
ee e0 e0 f8 9e 02 54 01 30 f5  # aadc |   jne [0x29e], 0x154, ${fail}:rel + PC
86 21 e4 3e de fa f6           # aae6 |   sub [A*2], 0xfade + A, A*4 + -10
ee e0 e0 f8 54 01 ea f8 1f f5  # aaed |   jne [0x154], 0xf8ea, ${fail}:rel + PC
a6 e0 20 21 39 30              # aaf7 |   ishr [0x3039], A, A*2
ee e0 1c f8 39 30 0a 0f f5     # aafd |   jne [0x3039], 0xa, ${fail}:rel + PC
aa fe 2a 3e f6                 # ab06 |   shl [G], A*4 + B, A*4 + -10
ee e0 e0 f8 55 01 00 c0 01 f5  # ab0b |   jne [0x155], 0xc000, ${fail}:rel + PC
b2 fe 1c fe 85                 # ab15 |   or [G], -123, G
ee e0 1c f8 55 01 d5 f2 f4     # ab1a |   jne [0x155], 0xd5, ${fail}:rel + PC
8a 2a 1c 20 85                 # ab23 |   mul [A*4 + B], -123, A
ee e0 e0 f8 63 03 52 ae e4 f4  # ab28 |   jne [0x363], 0xae52, ${fail}:rel + PC
a6 e0 e0 2a 39 30 39 30        # ab32 |   ishr [0x3039], 0x3039, A*4 + B
ee e0 e0 f8 39 30 07 06 d2 f4  # ab3a |   jne [0x3039], 0x607, ${fail}:rel + PC
a2 21 e4 21 de fa              # ab44 |   shr [A*2], 0xfade + A, A*2
ee e0 e0 f8 54 01 b8 0f c2 f4  # ab4a |   jne [0x154], 0xfb8, ${fail}:rel + PC
82 21 fe fe                    # ab54 |   add [A*2], G, G
ee e0 e0 f8 54 01 aa 02 b4 f4  # ab58 |   jne [0x154], 0x2aa, ${fail}:rel + PC
a6 fe e4 20 de fa              # ab62 |   ishr [G], 0xfade + A, A
ee e0 1c f8 55 01 fe a4 f4     # ab68 |   jne [0x155], 0xfe, ${fail}:rel + PC
82 e0 e4 2a 39 30 de fa        # ab71 |   add [0x3039], 0xfade + A, A*4 + B
ee e0 e0 f8 39 30 eb fe 93 f4  # ab79 |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
a6 20 20 20                    # ab83 |   ishr [A], A, A
ee e0 00 f8 aa 00 85 f4        # ab87 |   jne [0xaa], 0, ${fail}:rel + PC
82 fe 2a 20                    # ab8f |   add [G], A*4 + B, A
ee e0 e0 f8 55 01 0d 04 79 f4  # ab93 |   jne [0x155], 0x40d, ${fail}:rel + PC
b6 fe fe fe                    # ab9d |   xor [G], G, G
ee e0 00 f8 55 01 6b f4        # aba1 |   jne [0x155], 0, ${fail}:rel + PC
aa 21 fe 21                    # aba9 |   shl [A*2], G, A*2
ee e0 e0 f8 54 01 50 15 5f f4  # abad |   jne [0x154], 0x1550, ${fail}:rel + PC
a6 fe e0 21 39 30              # abb7 |   ishr [G], 0x3039, A*2
ee e0 e0 f8 55 01 03 03 4f f4  # abbd |   jne [0x155], 0x303, ${fail}:rel + PC
ae 21 2a e4 de fa              # abc7 |   and [A*2], A*4 + B, 0xfade + A
ee e0 e0 f8 54 01 00 03 3f f4  # abcd |   jne [0x154], 0x300, ${fail}:rel + PC
82 20 3e 3e f6 f6              # abd7 |   add [A], A*4 + -10, A*4 + -10
ee e0 e0 f8 aa 00 3c 05 2f f4  # abdd |   jne [0xaa], 0x53c, ${fail}:rel + PC
b2 e0 21 1c 39 30 85           # abe7 |   or [0x3039], A*2, -123
ee e0 1c f8 39 30 d5 1e f4     # abee |   jne [0x3039], 0xd5, ${fail}:rel + PC
82 e0 fe fe 39 30              # abf7 |   add [0x3039], G, G
ee e0 e0 f8 39 30 aa 02 0f f4  # abfd |   jne [0x3039], 0x2aa, ${fail}:rel + PC
ae fe e0 e4 39 30 de fa        # ac07 |   and [G], 0x3039, 0xfade + A
ee e0 e0 f8 55 01 08 30 fd f3  # ac0f |   jne [0x155], 0x3008, ${fail}:rel + PC
8e e0 2a 3e 39 30 f6           # ac19 |   imul [0x3039], A*4 + B, A*4 + -10
ee e0 e0 f8 39 30 1a dd ec f3  # ac20 |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
b2 21 e0 20 39 30              # ac2a |   or [A*2], 0x3039, A
ee e0 e0 f8 54 01 bb 30 dc f3  # ac30 |   jne [0x154], 0x30bb, ${fail}:rel + PC
8e 21 3e 21 f6                 # ac3a |   imul [A*2], A*4 + -10, A*2
ee e0 e0 f8 54 01 d8 79 cd f3  # ac3f |   jne [0x154], 0x79d8, ${fail}:rel + PC
82 3e 1c 2a f6 85              # ac49 |   add [A*4 + -10], -123, A*4 + B
ee e0 e0 f8 9e 02 e8 02 bd f3  # ac4f |   jne [0x29e], 0x2e8, ${fail}:rel + PC
86 fe e4 21 de fa              # ac59 |   sub [G], 0xfade + A, A*2
ee e0 e0 f8 55 01 34 fa ad f3  # ac5f |   jne [0x155], 0xfa34, ${fail}:rel + PC
b2 2a e4 21 de fa              # ac69 |   or [A*4 + B], 0xfade + A, A*2
ee e0 e0 f8 63 03 dc fb 9d f3  # ac6f |   jne [0x363], 0xfbdc, ${fail}:rel + PC
ae 21 21 20                    # ac79 |   and [A*2], A*2, A
ee e0 00 f8 54 01 8f f3        # ac7d |   jne [0x154], 0, ${fail}:rel + PC
86 2a 2a fe                    # ac85 |   sub [A*4 + B], A*4 + B, G
ee e0 e0 f8 63 03 0e 02 83 f3  # ac89 |   jne [0x363], 0x20e, ${fail}:rel + PC
82 3e 3e 20 f6 f6              # ac93 |   add [A*4 + -10], A*4 + -10, A
ee e0 e0 f8 9e 02 48 03 73 f3  # ac99 |   jne [0x29e], 0x348, ${fail}:rel + PC
86 21 e0 e0 39 30 39 30        # aca3 |   sub [A*2], 0x3039, 0x3039
ee e0 00 f8 54 01 61 f3        # acab |   jne [0x154], 0, ${fail}:rel + PC
a2 20 1c fe 85                 # acb3 |   shr [A], -123, G
ee e0 e0 f8 aa 00 fc 07 54 f3  # acb8 |   jne [0xaa], 0x7fc, ${fail}:rel + PC
aa 2a 1c 2a 85                 # acc2 |   shl [A*4 + B], -123, A*4 + B
ee e0 e0 f8 63 03 28 fc 45 f3  # acc7 |   jne [0x363], 0xfc28, ${fail}:rel + PC
b2 2a 20 20                    # acd1 |   or [A*4 + B], A, A
ee e0 e0 f8 63 03 aa 00 37 f3  # acd5 |   jne [0x363], 0xaa, ${fail}:rel + PC
86 20 20 1c 85                 # acdf |   sub [A], A, -123
ee e0 e0 f8 aa 00 25 01 28 f3  # ace4 |   jne [0xaa], 0x125, ${fail}:rel + PC
a6 3e e4 21 f6 de fa           # acee |   ishr [A*4 + -10], 0xfade + A, A*2
ee e0 1c f8 9e 02 b8 17 f3     # acf5 |   jne [0x29e], 0xb8, ${fail}:rel + PC
86 20 e0 e0 39 30 39 30        # acfe |   sub [A], 0x3039, 0x3039
ee e0 00 f8 aa 00 06 f3        # ad06 |   jne [0xaa], 0, ${fail}:rel + PC
82 fe e0 e0 39 30 39 30        # ad0e |   add [G], 0x3039, 0x3039
ee e0 e0 f8 55 01 72 60 f6 f2  # ad16 |   jne [0x155], 0x6072, ${fail}:rel + PC
a2 2a e4 e4 de fa de fa        # ad20 |   shr [A*4 + B], 0xfade + A, 0xfade + A
ee e0 e0 f8 63 03 fb 00 e4 f2  # ad28 |   jne [0x363], 0xfb, ${fail}:rel + PC
8e 20 20 fe                    # ad32 |   imul [A], A, G
ee e0 e0 f8 aa 00 72 e2 d6 f2  # ad36 |   jne [0xaa], 0xe272, ${fail}:rel + PC
a2 21 e4 2a de fa              # ad40 |   shr [A*2], 0xfade + A, A*4 + B
ee e0 e0 f8 54 01 71 1f c6 f2  # ad46 |   jne [0x154], 0x1f71, ${fail}:rel + PC
a2 2a 2a 1c 85                 # ad50 |   shr [A*4 + B], A*4 + B, -123
ee e0 1c f8 63 03 1b b7 f2     # ad55 |   jne [0x363], 0x1b, ${fail}:rel + PC
a2 20 21 2a                    # ad5e |   shr [A], A*2, A*4 + B
ee e0 1c f8 aa 00 2a aa f2     # ad62 |   jne [0xaa], 0x2a, ${fail}:rel + PC
ae e0 2a 20 39 30              # ad6b |   and [0x3039], A*4 + B, A
ee e0 1c f8 39 30 22 9b f2     # ad71 |   jne [0x3039], 0x22, ${fail}:rel + PC
a2 e0 e0 e0 39 30 39 30 39 30  # ad7a |   shr [0x3039], 0x3039, 0x3039
ee e0 1c f8 39 30 18 88 f2     # ad84 |   jne [0x3039], 0x18, ${fail}:rel + PC
8a 20 fe 3e f6                 # ad8d |   mul [A], G, A*4 + -10
ee e0 e0 f8 aa 00 76 7c 7a f2  # ad92 |   jne [0xaa], 0x7c76, ${fail}:rel + PC
82 2a e0 2a 39 30              # ad9c |   add [A*4 + B], 0x3039, A*4 + B
ee e0 e0 f8 63 03 9c 33 6a f2  # ada2 |   jne [0x363], 0x339c, ${fail}:rel + PC
8e fe 3e 2a f6                 # adac |   imul [G], A*4 + -10, A*4 + B
ee e0 e0 f8 55 01 1a dd 5b f2  # adb1 |   jne [0x155], 0xdd1a, ${fail}:rel + PC
aa 20 21 e0 39 30              # adbb |   shl [A], A*2, 0x3039
ee e0 e0 f8 aa 00 00 a8 4b f2  # adc1 |   jne [0xaa], 0xa800, ${fail}:rel + PC
82 21 fe 20                    # adcb |   add [A*2], G, A
ee e0 e0 f8 54 01 ff 01 3d f2  # adcf |   jne [0x154], 0x1ff, ${fail}:rel + PC
82 2a 2a 21                    # add9 |   add [A*4 + B], A*4 + B, A*2
ee e0 e0 f8 63 03 b7 04 2f f2  # addd |   jne [0x363], 0x4b7, ${fail}:rel + PC
a2 20 fe e4 de fa              # ade7 |   shr [A], G, 0xfade + A
ee e0 1c f8 aa 00 01 1f f2     # aded |   jne [0xaa], 0x1, ${fail}:rel + PC
82 fe 1c 20 85                 # adf6 |   add [G], -123, A
ee e0 1c f8 55 01 2f 11 f2     # adfb |   jne [0x155], 0x2f, ${fail}:rel + PC
8e 3e fe e0 f6 39 30           # ae04 |   imul [A*4 + -10], G, 0x3039
ee e0 e0 f8 9e 02 ed 3b 01 f2  # ae0b |   jne [0x29e], 0x3bed, ${fail}:rel + PC
8a fe e4 2a de fa              # ae15 |   mul [G], 0xfade + A, A*4 + B
ee e0 e0 f8 55 01 98 dd f1 f1  # ae1b |   jne [0x155], 0xdd98, ${fail}:rel + PC
a2 fe fe 20                    # ae25 |   shr [G], G, A
ee e0 00 f8 55 01 e3 f1        # ae29 |   jne [0x155], 0, ${fail}:rel + PC
b2 21 20 20                    # ae31 |   or [A*2], A, A
ee e0 e0 f8 54 01 aa 00 d7 f1  # ae35 |   jne [0x154], 0xaa, ${fail}:rel + PC
b2 3e 1c 21 f6 85              # ae3f |   or [A*4 + -10], -123, A*2
ee e0 1c f8 9e 02 d5 c7 f1     # ae45 |   jne [0x29e], 0xd5, ${fail}:rel + PC
8a 2a 1c 1c 85 85              # ae4e |   mul [A*4 + B], -123, -123
ee e0 e0 f8 63 03 19 3b b8 f1  # ae54 |   jne [0x363], 0x3b19, ${fail}:rel + PC
8a e0 e4 21 39 30 de fa        # ae5e |   mul [0x3039], 0xfade + A, A*2
ee e0 e0 f8 39 30 a0 10 a6 f1  # ae66 |   jne [0x3039], 0x10a0, ${fail}:rel + PC
86 fe 20 3e f6                 # ae70 |   sub [G], A, A*4 + -10
ee e0 e0 f8 55 01 0c fe 97 f1  # ae75 |   jne [0x155], 0xfe0c, ${fail}:rel + PC
aa 20 2a 21                    # ae7f |   shl [A], A*4 + B, A*2
ee e0 e0 f8 aa 00 30 36 89 f1  # ae83 |   jne [0xaa], 0x3630, ${fail}:rel + PC
b6 21 1c 2a 85                 # ae8d |   xor [A*2], -123, A*4 + B
ee e0 e0 f8 54 01 e6 fc 7a f1  # ae92 |   jne [0x154], 0xfce6, ${fail}:rel + PC
86 2a 3e 1c f6 85              # ae9c |   sub [A*4 + B], A*4 + -10, -123
ee e0 e0 f8 63 03 19 03 6a f1  # aea2 |   jne [0x363], 0x319, ${fail}:rel + PC
86 e0 e0 e4 39 30 39 30 de fa  # aeac |   sub [0x3039], 0x3039, 0xfade + A
ee e0 e0 f8 39 30 b1 34 56 f1  # aeb6 |   jne [0x3039], 0x34b1, ${fail}:rel + PC
ae fe 2a e4 de fa              # aec0 |   and [G], A*4 + B, 0xfade + A
ee e0 e0 f8 55 01 00 03 46 f1  # aec6 |   jne [0x155], 0x300, ${fail}:rel + PC
aa 20 3e fe f6                 # aed0 |   shl [A], A*4 + -10, G
ee e0 e0 f8 aa 00 c0 53 37 f1  # aed5 |   jne [0xaa], 0x53c0, ${fail}:rel + PC
a6 fe fe e4 de fa              # aedf |   ishr [G], G, 0xfade + A
ee e0 1c f8 55 01 01 27 f1     # aee5 |   jne [0x155], 0x1, ${fail}:rel + PC
ae 21 e0 2a 39 30              # aeee |   and [A*2], 0x3039, A*4 + B
ee e0 1c f8 54 01 21 18 f1     # aef4 |   jne [0x154], 0x21, ${fail}:rel + PC
a6 21 21 1c 85                 # aefd |   ishr [A*2], A*2, -123
ee e0 1c f8 54 01 0a 0a f1     # af02 |   jne [0x154], 0xa, ${fail}:rel + PC
b6 fe 21 e0 39 30              # af0b |   xor [G], A*2, 0x3039
ee e0 e0 f8 55 01 6d 31 fb f0  # af11 |   jne [0x155], 0x316d, ${fail}:rel + PC
86 2a 3e 2a f6                 # af1b |   sub [A*4 + B], A*4 + -10, A*4 + B
ee e0 e0 f8 63 03 3b ff ec f0  # af20 |   jne [0x363], 0xff3b, ${fail}:rel + PC
b2 e0 fe 1c 39 30 85           # af2a |   or [0x3039], G, -123
ee e0 1c f8 39 30 d5 db f0     # af31 |   jne [0x3039], 0xd5, ${fail}:rel + PC
aa 2a 3e 20 f6                 # af3a |   shl [A*4 + B], A*4 + -10, A
ee e0 e0 f8 63 03 00 78 cd f0  # af3f |   jne [0x363], 0x7800, ${fail}:rel + PC
86 e0 21 20 39 30              # af49 |   sub [0x3039], A*2, A
ee e0 e0 f8 39 30 aa 00 bd f0  # af4f |   jne [0x3039], 0xaa, ${fail}:rel + PC
b6 e0 2a 21 39 30              # af59 |   xor [0x3039], A*4 + B, A*2
ee e0 e0 f8 39 30 37 02 ad f0  # af5f |   jne [0x3039], 0x237, ${fail}:rel + PC
ae 2a e0 1c 39 30 85           # af69 |   and [A*4 + B], 0x3039, -123
ee e0 e0 f8 63 03 01 30 9c f0  # af70 |   jne [0x363], 0x3001, ${fail}:rel + PC
8e fe 2a e0 39 30              # af7a |   imul [G], A*4 + B, 0x3039
ee e0 e0 f8 55 01 0b 51 8c f0  # af80 |   jne [0x155], 0x510b, ${fail}:rel + PC
b2 2a 20 fe                    # af8a |   or [A*4 + B], A, G
ee e0 e0 f8 63 03 ff 01 7e f0  # af8e |   jne [0x363], 0x1ff, ${fail}:rel + PC
a6 3e e0 20 f6 39 30           # af98 |   ishr [A*4 + -10], 0x3039, A
ee e0 1c f8 9e 02 0c 6d f0     # af9f |   jne [0x29e], 0xc, ${fail}:rel + PC
aa e0 e4 e4 39 30 de fa de fa  # afa8 |   shl [0x3039], 0xfade + A, 0xfade + A
ee e0 e0 f8 39 30 00 88 5a f0  # afb2 |   jne [0x3039], 0x8800, ${fail}:rel + PC
aa 20 e0 fe 39 30              # afbc |   shl [A], 0x3039, G
ee e0 e0 f8 aa 00 20 07 4a f0  # afc2 |   jne [0xaa], 0x720, ${fail}:rel + PC
b6 fe 3e 21 f6                 # afcc |   xor [G], A*4 + -10, A*2
ee e0 e0 f8 55 01 ca 03 3b f0  # afd1 |   jne [0x155], 0x3ca, ${fail}:rel + PC
b2 2a fe 1c 85                 # afdb |   or [A*4 + B], G, -123
ee e0 1c f8 63 03 d5 2c f0     # afe0 |   jne [0x363], 0xd5, ${fail}:rel + PC
86 3e 1c e0 f6 85 39 30        # afe9 |   sub [A*4 + -10], -123, 0x3039
ee e0 e0 f8 9e 02 4c cf 1b f0  # aff1 |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
aa 21 21 21                    # affb |   shl [A*2], A*2, A*2
ee e0 e0 f8 54 01 40 15 0d f0  # afff |   jne [0x154], 0x1540, ${fail}:rel + PC
86 e0 e4 e0 39 30 de fa 39 30  # b009 |   sub [0x3039], 0xfade + A, 0x3039
ee e0 e0 f8 39 30 4f cb f9 ef  # b013 |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
a2 21 e0 1c 39 30 85           # b01d |   shr [A*2], 0x3039, -123
ee e0 e0 f8 54 01 81 01 e8 ef  # b024 |   jne [0x154], 0x181, ${fail}:rel + PC
a6 e0 e4 20 39 30 de fa        # b02e |   ishr [0x3039], 0xfade + A, A
ee e0 1c f8 39 30 fe d6 ef     # b036 |   jne [0x3039], 0xfe, ${fail}:rel + PC
b6 3e e4 e0 f6 de fa 39 30     # b03f |   xor [A*4 + -10], 0xfade + A, 0x3039
ee e0 e0 f8 9e 02 b1 cb c4 ef  # b048 |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
86 3e 21 3e f6 f6              # b052 |   sub [A*4 + -10], A*2, A*4 + -10
ee e0 e0 f8 9e 02 b6 fe b4 ef  # b058 |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
8e fe 1c 3e 85 f6              # b062 |   imul [G], -123, A*4 + -10
ee e0 e0 f8 55 01 16 be a4 ef  # b068 |   jne [0x155], 0xbe16, ${fail}:rel + PC
aa 20 2a 2a                    # b072 |   shl [A], A*4 + B, A*4 + B
ee e0 e0 f8 aa 00 18 1b 96 ef  # b076 |   jne [0xaa], 0x1b18, ${fail}:rel + PC
b6 e0 21 2a 39 30              # b080 |   xor [0x3039], A*2, A*4 + B
ee e0 e0 f8 39 30 37 02 86 ef  # b086 |   jne [0x3039], 0x237, ${fail}:rel + PC
82 21 21 e0 39 30              # b090 |   add [A*2], A*2, 0x3039
ee e0 e0 f8 54 01 8d 31 76 ef  # b096 |   jne [0x154], 0x318d, ${fail}:rel + PC
ae 21 2a 20                    # b0a0 |   and [A*2], A*4 + B, A
ee e0 1c f8 54 01 22 68 ef     # b0a4 |   jne [0x154], 0x22, ${fail}:rel + PC
aa 20 2a e4 de fa              # b0ad |   shl [A], A*4 + B, 0xfade + A
ee e0 e0 f8 aa 00 00 63 59 ef  # b0b3 |   jne [0xaa], 0x6300, ${fail}:rel + PC
ae 2a fe 20                    # b0bd |   and [A*4 + B], G, A
ee e0 00 f8 63 03 4b ef        # b0c1 |   jne [0x363], 0, ${fail}:rel + PC
b6 fe 21 1c 85                 # b0c9 |   xor [G], A*2, -123
ee e0 e0 f8 55 01 d1 fe 3e ef  # b0ce |   jne [0x155], 0xfed1, ${fail}:rel + PC
ae e0 fe 21 39 30              # b0d8 |   and [0x3039], G, A*2
ee e0 e0 f8 39 30 54 01 2e ef  # b0de |   jne [0x3039], 0x154, ${fail}:rel + PC
b2 3e e0 2a f6 39 30           # b0e8 |   or [A*4 + -10], 0x3039, A*4 + B
ee e0 e0 f8 9e 02 7b 33 1d ef  # b0ef |   jne [0x29e], 0x337b, ${fail}:rel + PC
b6 fe e4 3e de fa f6           # b0f9 |   xor [G], 0xfade + A, A*4 + -10
ee e0 e0 f8 55 01 16 f9 0c ef  # b100 |   jne [0x155], 0xf916, ${fail}:rel + PC
8e 2a 21 2a                    # b10a |   imul [A*4 + B], A*2, A*4 + B
ee e0 e0 f8 63 03 7c 7f fe ee  # b10e |   jne [0x363], 0x7f7c, ${fail}:rel + PC
a6 fe 21 fe                    # b118 |   ishr [G], A*2, G
ee e0 1c f8 55 01 0a f0 ee     # b11c |   jne [0x155], 0xa, ${fail}:rel + PC
8a 21 1c 1c 85 85              # b125 |   mul [A*2], -123, -123
ee e0 e0 f8 54 01 19 3b e1 ee  # b12b |   jne [0x154], 0x3b19, ${fail}:rel + PC
8e 2a e4 20 de fa              # b135 |   imul [A*4 + B], 0xfade + A, A
ee e0 e0 f8 63 03 50 08 d1 ee  # b13b |   jne [0x363], 0x850, ${fail}:rel + PC
a2 3e 3e 3e f6 f6 f6           # b145 |   shr [A*4 + -10], A*4 + -10, A*4 + -10
ee e0 00 f8 9e 02 c0 ee        # b14c |   jne [0x29e], 0, ${fail}:rel + PC
8a 20 1c e4 85 de fa           # b154 |   mul [A], -123, 0xfade + A
ee e0 e0 f8 aa 00 a8 25 b1 ee  # b15b |   jne [0xaa], 0x25a8, ${fail}:rel + PC
a6 3e 20 21 f6                 # b165 |   ishr [A*4 + -10], A, A*2
ee e0 1c f8 9e 02 0a a2 ee     # b16a |   jne [0x29e], 0xa, ${fail}:rel + PC
b2 3e 20 20 f6                 # b173 |   or [A*4 + -10], A, A
ee e0 e0 f8 9e 02 aa 00 94 ee  # b178 |   jne [0x29e], 0xaa, ${fail}:rel + PC
82 e0 fe e0 39 30 39 30        # b182 |   add [0x3039], G, 0x3039
ee e0 e0 f8 39 30 8e 31 82 ee  # b18a |   jne [0x3039], 0x318e, ${fail}:rel + PC
8e 3e e0 3e f6 39 30 f6        # b194 |   imul [A*4 + -10], 0x3039, A*4 + -10
ee e0 e0 f8 9e 02 2e 35 70 ee  # b19c |   jne [0x29e], 0x352e, ${fail}:rel + PC
a6 fe fe 21                    # b1a6 |   ishr [G], G, A*2
ee e0 1c f8 55 01 15 62 ee     # b1aa |   jne [0x155], 0x15, ${fail}:rel + PC
8e 20 e4 3e de fa f6           # b1b3 |   imul [A], 0xfade + A, A*4 + -10
ee e0 e0 f8 aa 00 f0 4d 52 ee  # b1ba |   jne [0xaa], 0x4df0, ${fail}:rel + PC
a6 fe 20 fe                    # b1c4 |   ishr [G], A, G
ee e0 1c f8 55 01 05 44 ee     # b1c8 |   jne [0x155], 0x5, ${fail}:rel + PC
82 2a e0 3e 39 30 f6           # b1d1 |   add [A*4 + B], 0x3039, A*4 + -10
ee e0 e0 f8 63 03 d7 32 34 ee  # b1d8 |   jne [0x363], 0x32d7, ${fail}:rel + PC
ae 3e 2a e4 f6 de fa           # b1e2 |   and [A*4 + -10], A*4 + B, 0xfade + A
ee e0 e0 f8 9e 02 00 03 23 ee  # b1e9 |   jne [0x29e], 0x300, ${fail}:rel + PC
8e 20 1c 2a 85                 # b1f3 |   imul [A], -123, A*4 + B
ee e0 e0 f8 aa 00 6f 5f 14 ee  # b1f8 |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
a2 fe 3e e4 f6 de fa           # b202 |   shr [G], A*4 + -10, 0xfade + A
ee e0 1c f8 55 01 02 03 ee     # b209 |   jne [0x155], 0x2, ${fail}:rel + PC
b2 2a e0 20 39 30              # b212 |   or [A*4 + B], 0x3039, A
ee e0 e0 f8 63 03 bb 30 f4 ed  # b218 |   jne [0x363], 0x30bb, ${fail}:rel + PC
b6 2a e0 fe 39 30              # b222 |   xor [A*4 + B], 0x3039, G
ee e0 e0 f8 63 03 6c 31 e4 ed  # b228 |   jne [0x363], 0x316c, ${fail}:rel + PC
8e 20 20 e0 39 30              # b232 |   imul [A], A, 0x3039
ee e0 e0 f8 aa 00 da 05 d4 ed  # b238 |   jne [0xaa], 0x5da, ${fail}:rel + PC
b2 21 2a 3e f6                 # b242 |   or [A*2], A*4 + B, A*4 + -10
ee e0 e0 f8 54 01 ff 03 c5 ed  # b247 |   jne [0x154], 0x3ff, ${fail}:rel + PC
aa fe e4 e0 de fa 39 30        # b251 |   shl [G], 0xfade + A, 0x3039
ee e0 e0 f8 55 01 00 10 b3 ed  # b259 |   jne [0x155], 0x1000, ${fail}:rel + PC
a6 2a e4 2a de fa              # b263 |   ishr [A*4 + B], 0xfade + A, A*4 + B
ee e0 e0 f8 63 03 71 ff a3 ed  # b269 |   jne [0x363], 0xff71, ${fail}:rel + PC
aa 3e e4 1c f6 de fa 85        # b273 |   shl [A*4 + -10], 0xfade + A, -123
ee e0 e0 f8 9e 02 00 71 91 ed  # b27b |   jne [0x29e], 0x7100, ${fail}:rel + PC
a2 3e e4 20 f6 de fa           # b285 |   shr [A*4 + -10], 0xfade + A, A
ee e0 1c f8 9e 02 3e 80 ed     # b28c |   jne [0x29e], 0x3e, ${fail}:rel + PC
8a 3e 20 2a f6                 # b295 |   mul [A*4 + -10], A, A*4 + B
ee e0 e0 f8 9e 02 be 3f 72 ed  # b29a |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
b2 21 3e 2a f6                 # b2a4 |   or [A*2], A*4 + -10, A*4 + B
ee e0 e0 f8 54 01 ff 03 63 ed  # b2a9 |   jne [0x154], 0x3ff, ${fail}:rel + PC
8e 3e 21 1c f6 85              # b2b3 |   imul [A*4 + -10], A*2, -123
ee e0 e0 f8 9e 02 a4 5c 53 ed  # b2b9 |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
aa e0 3e 21 39 30 f6           # b2c3 |   shl [0x3039], A*4 + -10, A*2
ee e0 e0 f8 39 30 e0 29 42 ed  # b2ca |   jne [0x3039], 0x29e0, ${fail}:rel + PC
aa 21 e4 e4 de fa de fa        # b2d4 |   shl [A*2], 0xfade + A, 0xfade + A
ee e0 e0 f8 54 01 00 88 30 ed  # b2dc |   jne [0x154], 0x8800, ${fail}:rel + PC
82 fe 21 21                    # b2e6 |   add [G], A*2, A*2
ee e0 e0 f8 55 01 a8 02 22 ed  # b2ea |   jne [0x155], 0x2a8, ${fail}:rel + PC
ae 21 e4 fe de fa              # b2f4 |   and [A*2], 0xfade + A, G
ee e0 e0 f8 54 01 00 01 12 ed  # b2fa |   jne [0x154], 0x100, ${fail}:rel + PC
ae 3e e0 e0 f6 39 30 39 30     # b304 |   and [A*4 + -10], 0x3039, 0x3039
ee e0 e0 f8 9e 02 39 30 ff ec  # b30d |   jne [0x29e], 0x3039, ${fail}:rel + PC
aa 3e 20 1c f6 85              # b317 |   shl [A*4 + -10], A, -123
ee e0 e0 f8 9e 02 40 15 ef ec  # b31d |   jne [0x29e], 0x1540, ${fail}:rel + PC
ae 2a 3e e4 f6 de fa           # b327 |   and [A*4 + B], A*4 + -10, 0xfade + A
ee e0 e0 f8 63 03 88 02 de ec  # b32e |   jne [0x363], 0x288, ${fail}:rel + PC
82 fe 1c 1c 85 85              # b338 |   add [G], -123, -123
ee e0 e0 f8 55 01 0a ff ce ec  # b33e |   jne [0x155], 0xff0a, ${fail}:rel + PC
8a 20 20 e4 de fa              # b348 |   mul [A], A, 0xfade + A
ee e0 e0 f8 aa 00 50 08 be ec  # b34e |   jne [0xaa], 0x850, ${fail}:rel + PC
b2 21 2a fe                    # b358 |   or [A*2], A*4 + B, G
ee e0 e0 f8 54 01 77 03 b0 ec  # b35c |   jne [0x154], 0x377, ${fail}:rel + PC
86 fe e4 e4 de fa de fa        # b366 |   sub [G], 0xfade + A, 0xfade + A
ee e0 00 f8 55 01 9e ec        # b36e |   jne [0x155], 0, ${fail}:rel + PC
a2 2a fe e4 de fa              # b376 |   shr [A*4 + B], G, 0xfade + A
ee e0 1c f8 63 03 01 90 ec     # b37c |   jne [0x363], 0x1, ${fail}:rel + PC
86 21 1c fe 85                 # b385 |   sub [A*2], -123, G
ee e0 e0 f8 54 01 30 fe 82 ec  # b38a |   jne [0x154], 0xfe30, ${fail}:rel + PC
aa 3e 21 fe f6                 # b394 |   shl [A*4 + -10], A*2, G
ee e0 e0 f8 9e 02 80 2a 73 ec  # b399 |   jne [0x29e], 0x2a80, ${fail}:rel + PC
aa 20 1c 3e 85 f6              # b3a3 |   shl [A], -123, A*4 + -10
ee e0 e0 f8 aa 00 00 40 63 ec  # b3a9 |   jne [0xaa], 0x4000, ${fail}:rel + PC
8a 3e 2a 21 f6                 # b3b3 |   mul [A*4 + -10], A*4 + B, A*2
ee e0 e0 f8 9e 02 7c 7f 54 ec  # b3b8 |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
a2 20 2a fe                    # b3c2 |   shr [A], A*4 + B, G
ee e0 1c f8 aa 00 1b 46 ec     # b3c6 |   jne [0xaa], 0x1b, ${fail}:rel + PC
82 20 2a e0 39 30              # b3cf |   add [A], A*4 + B, 0x3039
ee e0 e0 f8 aa 00 9c 33 37 ec  # b3d5 |   jne [0xaa], 0x339c, ${fail}:rel + PC
b6 fe e0 1c 39 30 85           # b3df |   xor [G], 0x3039, -123
ee e0 e0 f8 55 01 bc cf 26 ec  # b3e6 |   jne [0x155], 0xcfbc, ${fail}:rel + PC
86 20 e4 2a de fa              # b3f0 |   sub [A], 0xfade + A, A*4 + B
ee e0 e0 f8 aa 00 25 f8 16 ec  # b3f6 |   jne [0xaa], 0xf825, ${fail}:rel + PC
a6 2a 21 fe                    # b400 |   ishr [A*4 + B], A*2, G
ee e0 1c f8 63 03 0a 08 ec     # b404 |   jne [0x363], 0xa, ${fail}:rel + PC
b2 21 fe e4 de fa              # b40d |   or [A*2], G, 0xfade + A
ee e0 e0 f8 54 01 dd fb f9 eb  # b413 |   jne [0x154], 0xfbdd, ${fail}:rel + PC
8a e0 e4 fe 39 30 de fa        # b41d |   mul [0x3039], 0xfade + A, G
ee e0 e0 f8 39 30 28 0c e7 eb  # b425 |   jne [0x3039], 0xc28, ${fail}:rel + PC
8e 2a 2a e4 de fa              # b42f |   imul [A*4 + B], A*4 + B, 0xfade + A
ee e0 e0 f8 63 03 98 dd d7 eb  # b435 |   jne [0x363], 0xdd98, ${fail}:rel + PC
ae e0 20 fe 39 30              # b43f |   and [0x3039], A, G
ee e0 00 f8 39 30 c7 eb        # b445 |   jne [0x3039], 0, ${fail}:rel + PC
8e fe fe 2a                    # b44d |   imul [G], G, A*4 + B
ee e0 e0 f8 55 01 df 82 bb eb  # b451 |   jne [0x155], 0x82df, ${fail}:rel + PC
8e 3e 21 21 f6                 # b45b |   imul [A*4 + -10], A*2, A*2
ee e0 e0 f8 9e 02 90 c3 ac eb  # b460 |   jne [0x29e], 0xc390, ${fail}:rel + PC
b2 fe e4 1c de fa 85           # b46a |   or [G], 0xfade + A, -123
ee e0 1c f8 55 01 8d 9b eb     # b471 |   jne [0x155], 0x8d, ${fail}:rel + PC
8e 2a 20 3e f6                 # b47a |   imul [A*4 + B], A, A*4 + -10
ee e0 e0 f8 63 03 ec bc 8d eb  # b47f |   jne [0x363], 0xbcec, ${fail}:rel + PC
a2 2a 3e e0 f6 39 30           # b489 |   shr [A*4 + B], A*4 + -10, 0x3039
ee e0 1c f8 63 03 01 7c eb     # b490 |   jne [0x363], 0x1, ${fail}:rel + PC
b6 2a 21 e0 39 30              # b499 |   xor [A*4 + B], A*2, 0x3039
ee e0 e0 f8 63 03 6d 31 6d eb  # b49f |   jne [0x363], 0x316d, ${fail}:rel + PC
a2 e0 3e e0 39 30 f6 39 30     # b4a9 |   shr [0x3039], A*4 + -10, 0x3039
ee e0 1c f8 39 30 01 5a eb     # b4b2 |   jne [0x3039], 0x1, ${fail}:rel + PC
a2 21 1c 3e 85 f6              # b4bb |   shr [A*2], -123, A*4 + -10
ee e0 1c f8 54 01 03 4b eb     # b4c1 |   jne [0x154], 0x3, ${fail}:rel + PC
b2 21 20 21                    # b4ca |   or [A*2], A, A*2
ee e0 e0 f8 54 01 fe 01 3e eb  # b4ce |   jne [0x154], 0x1fe, ${fail}:rel + PC
a2 fe 2a 21                    # b4d8 |   shr [G], A*4 + B, A*2
ee e0 1c f8 55 01 36 30 eb     # b4dc |   jne [0x155], 0x36, ${fail}:rel + PC
b6 e0 3e 2a 39 30 f6           # b4e5 |   xor [0x3039], A*4 + -10, A*4 + B
ee e0 e0 f8 39 30 fd 01 20 eb  # b4ec |   jne [0x3039], 0x1fd, ${fail}:rel + PC
8a 3e e4 3e f6 de fa f6        # b4f6 |   mul [A*4 + -10], 0xfade + A, A*4 + -10
ee e0 e0 f8 9e 02 f0 4d 0e eb  # b4fe |   jne [0x29e], 0x4df0, ${fail}:rel + PC
8e 2a 21 3e f6                 # b508 |   imul [A*4 + B], A*2, A*4 + -10
ee e0 e0 f8 63 03 d8 79 ff ea  # b50d |   jne [0x363], 0x79d8, ${fail}:rel + PC
a2 e0 e4 3e 39 30 de fa f6     # b517 |   shr [0x3039], 0xfade + A, A*4 + -10
ee e0 1c f8 39 30 03 ec ea     # b520 |   jne [0x3039], 0x3, ${fail}:rel + PC
82 3e 20 fe f6                 # b529 |   add [A*4 + -10], A, G
ee e0 e0 f8 9e 02 ff 01 de ea  # b52e |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a2 2a e4 e0 de fa 39 30        # b538 |   shr [A*4 + B], 0xfade + A, 0x3039
ee e0 1c f8 63 03 7d cc ea     # b540 |   jne [0x363], 0x7d, ${fail}:rel + PC
a2 3e 1c 1c f6 85 85           # b549 |   shr [A*4 + -10], -123, -123
ee e0 e0 f8 9e 02 fc 07 bc ea  # b550 |   jne [0x29e], 0x7fc, ${fail}:rel + PC
8e 20 1c e0 85 39 30           # b55a |   imul [A], -123, 0x3039
ee e0 e0 f8 aa 00 9d d4 ab ea  # b561 |   jne [0xaa], 0xd49d, ${fail}:rel + PC
aa 2a 3e 21 f6                 # b56b |   shl [A*4 + B], A*4 + -10, A*2
ee e0 e0 f8 63 03 e0 29 9c ea  # b570 |   jne [0x363], 0x29e0, ${fail}:rel + PC
b6 21 e0 fe 39 30              # b57a |   xor [A*2], 0x3039, G
ee e0 e0 f8 54 01 6c 31 8c ea  # b580 |   jne [0x154], 0x316c, ${fail}:rel + PC
b6 e0 3e 3e 39 30 f6 f6        # b58a |   xor [0x3039], A*4 + -10, A*4 + -10
ee e0 00 f8 39 30 7a ea        # b592 |   jne [0x3039], 0, ${fail}:rel + PC
b6 20 21 1c 85                 # b59a |   xor [A], A*2, -123
ee e0 e0 f8 aa 00 d1 fe 6d ea  # b59f |   jne [0xaa], 0xfed1, ${fail}:rel + PC
b6 21 21 fe                    # b5a9 |   xor [A*2], A*2, G
ee e0 1c f8 54 01 01 5f ea     # b5ad |   jne [0x154], 0x1, ${fail}:rel + PC
8a fe e0 20 39 30              # b5b6 |   mul [G], 0x3039, A
ee e0 e0 f8 55 01 da 05 50 ea  # b5bc |   jne [0x155], 0x5da, ${fail}:rel + PC
b6 21 e0 21 39 30              # b5c6 |   xor [A*2], 0x3039, A*2
ee e0 e0 f8 54 01 6d 31 40 ea  # b5cc |   jne [0x154], 0x316d, ${fail}:rel + PC
8a 21 2a e0 39 30              # b5d6 |   mul [A*2], A*4 + B, 0x3039
ee e0 e0 f8 54 01 0b 51 30 ea  # b5dc |   jne [0x154], 0x510b, ${fail}:rel + PC
ae 3e e0 1c f6 39 30 85        # b5e6 |   and [A*4 + -10], 0x3039, -123
ee e0 e0 f8 9e 02 01 30 1e ea  # b5ee |   jne [0x29e], 0x3001, ${fail}:rel + PC
aa fe 21 20                    # b5f8 |   shl [G], A*2, A
ee e0 e0 f8 55 01 00 50 10 ea  # b5fc |   jne [0x155], 0x5000, ${fail}:rel + PC
ae 20 e4 20 de fa              # b606 |   and [A], 0xfade + A, A
ee e0 e0 f8 aa 00 88 00 00 ea  # b60c |   jne [0xaa], 0x88, ${fail}:rel + PC
aa 21 3e e4 f6 de fa           # b616 |   shl [A*2], A*4 + -10, 0xfade + A
ee e0 e0 f8 54 01 00 9e ef e9  # b61d |   jne [0x154], 0x9e00, ${fail}:rel + PC
b6 e0 e0 1c 39 30 39 30 85     # b627 |   xor [0x3039], 0x3039, -123
ee e0 e0 f8 39 30 bc cf dc e9  # b630 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
8a 3e 3e 1c f6 f6 85           # b63a |   mul [A*4 + -10], A*4 + -10, -123
ee e0 e0 f8 9e 02 16 be cb e9  # b641 |   jne [0x29e], 0xbe16, ${fail}:rel + PC
86 fe 21 3e f6                 # b64b |   sub [G], A*2, A*4 + -10
ee e0 e0 f8 55 01 b6 fe bc e9  # b650 |   jne [0x155], 0xfeb6, ${fail}:rel + PC
86 3e 2a fe f6                 # b65a |   sub [A*4 + -10], A*4 + B, G
ee e0 e0 f8 9e 02 0e 02 ad e9  # b65f |   jne [0x29e], 0x20e, ${fail}:rel + PC
b6 3e 1c fe f6 85              # b669 |   xor [A*4 + -10], -123, G
ee e0 e0 f8 9e 02 d0 fe 9d e9  # b66f |   jne [0x29e], 0xfed0, ${fail}:rel + PC
86 20 2a 1c 85                 # b679 |   sub [A], A*4 + B, -123
ee e0 e0 f8 aa 00 de 03 8e e9  # b67e |   jne [0xaa], 0x3de, ${fail}:rel + PC
86 20 21 fe                    # b688 |   sub [A], A*2, G
ee e0 1c f8 aa 00 ff 80 e9     # b68c |   jne [0xaa], 0xff, ${fail}:rel + PC
86 2a 20 e4 de fa              # b695 |   sub [A*4 + B], A, 0xfade + A
ee e0 e0 f8 63 03 22 05 71 e9  # b69b |   jne [0x363], 0x522, ${fail}:rel + PC
aa e0 fe 3e 39 30 f6           # b6a5 |   shl [0x3039], G, A*4 + -10
ee e0 e0 f8 39 30 00 40 60 e9  # b6ac |   jne [0x3039], 0x4000, ${fail}:rel + PC
ae 20 1c 1c 85 85              # b6b6 |   and [A], -123, -123
ee e0 1c f8 aa 00 85 50 e9     # b6bc |   jne [0xaa], 0x85, ${fail}:rel + PC
b6 20 fe e0 39 30              # b6c5 |   xor [A], G, 0x3039
ee e0 e0 f8 aa 00 6c 31 41 e9  # b6cb |   jne [0xaa], 0x316c, ${fail}:rel + PC
b2 e0 21 3e 39 30 f6           # b6d5 |   or [0x3039], A*2, A*4 + -10
ee e0 e0 f8 39 30 de 03 30 e9  # b6dc |   jne [0x3039], 0x3de, ${fail}:rel + PC
b2 20 e4 21 de fa              # b6e6 |   or [A], 0xfade + A, A*2
ee e0 e0 f8 aa 00 dc fb 20 e9  # b6ec |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
b6 fe 3e 3e f6 f6              # b6f6 |   xor [G], A*4 + -10, A*4 + -10
ee e0 00 f8 55 01 10 e9        # b6fc |   jne [0x155], 0, ${fail}:rel + PC
b6 3e 20 e4 f6 de fa           # b704 |   xor [A*4 + -10], A, 0xfade + A
ee e0 e0 f8 9e 02 22 fb 01 e9  # b70b |   jne [0x29e], 0xfb22, ${fail}:rel + PC
b6 e0 1c e0 39 30 85 39 30     # b715 |   xor [0x3039], -123, 0x3039
ee e0 e0 f8 39 30 bc cf ee e8  # b71e |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
a2 3e fe 2a f6                 # b728 |   shr [A*4 + -10], G, A*4 + B
ee e0 1c f8 9e 02 2a df e8     # b72d |   jne [0x29e], 0x2a, ${fail}:rel + PC
ae 20 fe 20                    # b736 |   and [A], G, A
ee e0 00 f8 aa 00 d2 e8        # b73a |   jne [0xaa], 0, ${fail}:rel + PC
86 2a e4 1c de fa 85           # b742 |   sub [A*4 + B], 0xfade + A, -123
ee e0 e0 f8 63 03 03 fc c3 e8  # b749 |   jne [0x363], 0xfc03, ${fail}:rel + PC
ae e0 21 21 39 30              # b753 |   and [0x3039], A*2, A*2
ee e0 e0 f8 39 30 54 01 b3 e8  # b759 |   jne [0x3039], 0x154, ${fail}:rel + PC
a2 e0 20 e0 39 30 39 30        # b763 |   shr [0x3039], A, 0x3039
ee e0 00 f8 39 30 a1 e8        # b76b |   jne [0x3039], 0, ${fail}:rel + PC
8e 3e 2a 3e f6 f6              # b773 |   imul [A*4 + -10], A*4 + B, A*4 + -10
ee e0 e0 f8 9e 02 1a dd 93 e8  # b779 |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
a2 e0 3e 1c 39 30 f6 85        # b783 |   shr [0x3039], A*4 + -10, -123
ee e0 1c f8 39 30 14 81 e8     # b78b |   jne [0x3039], 0x14, ${fail}:rel + PC
82 fe 20 e0 39 30              # b794 |   add [G], A, 0x3039
ee e0 e0 f8 55 01 e3 30 72 e8  # b79a |   jne [0x155], 0x30e3, ${fail}:rel + PC
a6 e0 21 e0 39 30 39 30        # b7a4 |   ishr [0x3039], A*2, 0x3039
ee e0 00 f8 39 30 60 e8        # b7ac |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e4 1c 39 30 de fa 85     # b7b4 |   ishr [0x3039], 0xfade + A, -123
ee e0 1c f8 39 30 dc 4f e8     # b7bd |   jne [0x3039], 0xdc, ${fail}:rel + PC
b2 3e fe 20 f6                 # b7c6 |   or [A*4 + -10], G, A
ee e0 e0 f8 9e 02 ff 01 41 e8  # b7cb |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a6 2a 2a 20                    # b7d5 |   ishr [A*4 + B], A*4 + B, A
ee e0 00 f8 63 03 33 e8        # b7d9 |   jne [0x363], 0, ${fail}:rel + PC
aa fe e0 2a 39 30              # b7e1 |   shl [G], 0x3039, A*4 + B
ee e0 e0 f8 55 01 c8 81 25 e8  # b7e7 |   jne [0x155], 0x81c8, ${fail}:rel + PC
8a 21 3e 20 f6                 # b7f1 |   mul [A*2], A*4 + -10, A
ee e0 e0 f8 54 01 ec bc 16 e8  # b7f6 |   jne [0x154], 0xbcec, ${fail}:rel + PC
8e 3e 3e e0 f6 f6 39 30        # b800 |   imul [A*4 + -10], A*4 + -10, 0x3039
ee e0 e0 f8 9e 02 2e 35 04 e8  # b808 |   jne [0x29e], 0x352e, ${fail}:rel + PC
b6 e0 1c 3e 39 30 85 f6        # b812 |   xor [0x3039], -123, A*4 + -10
ee e0 e0 f8 39 30 1b fd f2 e7  # b81a |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
b2 fe 20 e4 de fa              # b824 |   or [G], A, 0xfade + A
ee e0 e0 f8 55 01 aa fb e2 e7  # b82a |   jne [0x155], 0xfbaa, ${fail}:rel + PC
8e fe fe 3e f6                 # b834 |   imul [G], G, A*4 + -10
ee e0 e0 f8 55 01 76 7c d3 e7  # b839 |   jne [0x155], 0x7c76, ${fail}:rel + PC
8a 20 e0 3e 39 30 f6           # b843 |   mul [A], 0x3039, A*4 + -10
ee e0 e0 f8 aa 00 2e 35 c2 e7  # b84a |   jne [0xaa], 0x352e, ${fail}:rel + PC
b2 fe 20 20                    # b854 |   or [G], A, A
ee e0 e0 f8 55 01 aa 00 b4 e7  # b858 |   jne [0x155], 0xaa, ${fail}:rel + PC
a2 3e 21 e4 f6 de fa           # b862 |   shr [A*4 + -10], A*2, 0xfade + A
ee e0 1c f8 9e 02 01 a3 e7     # b869 |   jne [0x29e], 0x1, ${fail}:rel + PC
a6 20 3e 2a f6                 # b872 |   ishr [A], A*4 + -10, A*4 + B
ee e0 1c f8 aa 00 53 95 e7     # b877 |   jne [0xaa], 0x53, ${fail}:rel + PC
82 20 e0 20 39 30              # b880 |   add [A], 0x3039, A
ee e0 e0 f8 aa 00 e3 30 86 e7  # b886 |   jne [0xaa], 0x30e3, ${fail}:rel + PC
a6 20 1c 20 85                 # b890 |   ishr [A], -123, A
ee e0 1c f8 aa 00 ff 77 e7     # b895 |   jne [0xaa], 0xff, ${fail}:rel + PC
ae 21 20 1c 85                 # b89e |   and [A*2], A, -123
ee e0 e0 f8 54 01 80 00 69 e7  # b8a3 |   jne [0x154], 0x80, ${fail}:rel + PC
b6 2a 1c e4 85 de fa           # b8ad |   xor [A*4 + B], -123, 0xfade + A
ee e0 e0 f8 63 03 0d 04 58 e7  # b8b4 |   jne [0x363], 0x40d, ${fail}:rel + PC
82 20 e0 21 39 30              # b8be |   add [A], 0x3039, A*2
ee e0 e0 f8 aa 00 8d 31 48 e7  # b8c4 |   jne [0xaa], 0x318d, ${fail}:rel + PC
82 21 fe 2a                    # b8ce |   add [A*2], G, A*4 + B
ee e0 e0 f8 54 01 b8 04 3a e7  # b8d2 |   jne [0x154], 0x4b8, ${fail}:rel + PC
b2 20 2a 20                    # b8dc |   or [A], A*4 + B, A
ee e0 e0 f8 aa 00 eb 03 2c e7  # b8e0 |   jne [0xaa], 0x3eb, ${fail}:rel + PC
82 21 1c e0 85 39 30           # b8ea |   add [A*2], -123, 0x3039
ee e0 e0 f8 54 01 be 2f 1b e7  # b8f1 |   jne [0x154], 0x2fbe, ${fail}:rel + PC
aa fe 2a 1c 85                 # b8fb |   shl [G], A*4 + B, -123
ee e0 e0 f8 55 01 60 6c 0c e7  # b900 |   jne [0x155], 0x6c60, ${fail}:rel + PC
82 3e 3e 2a f6 f6              # b90a |   add [A*4 + -10], A*4 + -10, A*4 + B
ee e0 e0 f8 9e 02 01 06 fc e6  # b910 |   jne [0x29e], 0x601, ${fail}:rel + PC
b2 20 3e e4 f6 de fa           # b91a |   or [A], A*4 + -10, 0xfade + A
ee e0 e0 f8 aa 00 9e fb eb e6  # b921 |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
aa 2a 21 1c 85                 # b92b |   shl [A*4 + B], A*2, -123
ee e0 e0 f8 63 03 80 2a dc e6  # b930 |   jne [0x363], 0x2a80, ${fail}:rel + PC
b2 e0 1c 2a 39 30 85           # b93a |   or [0x3039], -123, A*4 + B
ee e0 1c f8 39 30 e7 cb e6     # b941 |   jne [0x3039], 0xe7, ${fail}:rel + PC
82 21 2a 2a                    # b94a |   add [A*2], A*4 + B, A*4 + B
ee e0 e0 f8 54 01 c6 06 be e6  # b94e |   jne [0x154], 0x6c6, ${fail}:rel + PC
ae 20 21 20                    # b958 |   and [A], A*2, A
ee e0 00 f8 aa 00 b0 e6        # b95c |   jne [0xaa], 0, ${fail}:rel + PC
86 20 fe 1c 85                 # b964 |   sub [A], G, -123
ee e0 e0 f8 aa 00 d0 01 a3 e6  # b969 |   jne [0xaa], 0x1d0, ${fail}:rel + PC
b2 20 2a 3e f6                 # b973 |   or [A], A*4 + B, A*4 + -10
ee e0 e0 f8 aa 00 ff 03 94 e6  # b978 |   jne [0xaa], 0x3ff, ${fail}:rel + PC
b6 2a 20 2a                    # b982 |   xor [A*4 + B], A, A*4 + B
ee e0 e0 f8 63 03 c9 03 86 e6  # b986 |   jne [0x363], 0x3c9, ${fail}:rel + PC
aa 21 fe 3e f6                 # b990 |   shl [A*2], G, A*4 + -10
ee e0 e0 f8 54 01 00 40 77 e6  # b995 |   jne [0x154], 0x4000, ${fail}:rel + PC
ae 3e e0 21 f6 39 30           # b99f |   and [A*4 + -10], 0x3039, A*2
ee e0 1c f8 9e 02 10 66 e6     # b9a6 |   jne [0x29e], 0x10, ${fail}:rel + PC
a2 e0 2a e4 39 30 de fa        # b9af |   shr [0x3039], A*4 + B, 0xfade + A
ee e0 1c f8 39 30 03 55 e6     # b9b7 |   jne [0x3039], 0x3, ${fail}:rel + PC
8a fe 21 2a                    # b9c0 |   mul [G], A*2, A*4 + B
ee e0 e0 f8 55 01 7c 7f 48 e6  # b9c4 |   jne [0x155], 0x7f7c, ${fail}:rel + PC
a2 3e 3e fe f6 f6              # b9ce |   shr [A*4 + -10], A*4 + -10, G
ee e0 1c f8 9e 02 14 38 e6     # b9d4 |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 20 e0 e4 39 30 de fa        # b9dd |   mul [A], 0x3039, 0xfade + A
ee e0 e0 f8 aa 00 48 81 27 e6  # b9e5 |   jne [0xaa], 0x8148, ${fail}:rel + PC
8a 2a 1c 3e 85 f6              # b9ef |   mul [A*4 + B], -123, A*4 + -10
ee e0 e0 f8 63 03 16 be 17 e6  # b9f5 |   jne [0x363], 0xbe16, ${fail}:rel + PC
ae 2a 1c fe 85                 # b9ff |   and [A*4 + B], -123, G
ee e0 e0 f8 63 03 05 01 08 e6  # ba04 |   jne [0x363], 0x105, ${fail}:rel + PC
aa e0 e0 20 39 30 39 30        # ba0e |   shl [0x3039], 0x3039, A
ee e0 e0 f8 39 30 00 e4 f6 e5  # ba16 |   jne [0x3039], 0xe400, ${fail}:rel + PC
8e 20 fe 2a                    # ba20 |   imul [A], G, A*4 + B
ee e0 e0 f8 aa 00 df 82 e8 e5  # ba24 |   jne [0xaa], 0x82df, ${fail}:rel + PC
86 3e 1c 3e f6 85 f6           # ba2e |   sub [A*4 + -10], -123, A*4 + -10
ee e0 e0 f8 9e 02 e7 fc d7 e5  # ba35 |   jne [0x29e], 0xfce7, ${fail}:rel + PC
aa 21 20 2a                    # ba3f |   shl [A*2], A, A*4 + B
ee e0 e0 f8 54 01 50 05 c9 e5  # ba43 |   jne [0x154], 0x550, ${fail}:rel + PC
82 20 3e 21 f6                 # ba4d |   add [A], A*4 + -10, A*2
ee e0 e0 f8 aa 00 f2 03 ba e5  # ba52 |   jne [0xaa], 0x3f2, ${fail}:rel + PC
8a 21 fe 1c 85                 # ba5c |   mul [A*2], G, -123
ee e0 e0 f8 54 01 29 5c ab e5  # ba61 |   jne [0x154], 0x5c29, ${fail}:rel + PC
8a fe 1c e0 85 39 30           # ba6b |   mul [G], -123, 0x3039
ee e0 e0 f8 55 01 9d d4 9a e5  # ba72 |   jne [0x155], 0xd49d, ${fail}:rel + PC
a6 e0 2a 2a 39 30              # ba7c |   ishr [0x3039], A*4 + B, A*4 + B
ee e0 1c f8 39 30 6c 8a e5     # ba82 |   jne [0x3039], 0x6c, ${fail}:rel + PC
82 2a 1c 21 85                 # ba8b |   add [A*4 + B], -123, A*2
ee e0 e0 f8 63 03 d9 00 7c e5  # ba90 |   jne [0x363], 0xd9, ${fail}:rel + PC
8a e0 e0 fe 39 30 39 30        # ba9a |   mul [0x3039], 0x3039, G
ee e0 e0 f8 39 30 ed 3b 6a e5  # baa2 |   jne [0x3039], 0x3bed, ${fail}:rel + PC
b2 e0 2a fe 39 30              # baac |   or [0x3039], A*4 + B, G
ee e0 e0 f8 39 30 77 03 5a e5  # bab2 |   jne [0x3039], 0x377, ${fail}:rel + PC
aa 2a 1c e0 85 39 30           # babc |   shl [A*4 + B], -123, 0x3039
ee e0 e0 f8 63 03 00 0a 49 e5  # bac3 |   jne [0x363], 0xa00, ${fail}:rel + PC
8a fe 1c 2a 85                 # bacd |   mul [G], -123, A*4 + B
ee e0 e0 f8 55 01 6f 5f 3a e5  # bad2 |   jne [0x155], 0x5f6f, ${fail}:rel + PC
ae 3e e0 fe f6 39 30           # badc |   and [A*4 + -10], 0x3039, G
ee e0 1c f8 9e 02 11 29 e5     # bae3 |   jne [0x29e], 0x11, ${fail}:rel + PC
a6 2a 21 e4 de fa              # baec |   ishr [A*4 + B], A*2, 0xfade + A
ee e0 1c f8 63 03 01 1a e5     # baf2 |   jne [0x363], 0x1, ${fail}:rel + PC
b2 21 21 2a                    # bafb |   or [A*2], A*2, A*4 + B
ee e0 e0 f8 54 01 77 03 0d e5  # baff |   jne [0x154], 0x377, ${fail}:rel + PC
ae 2a fe fe                    # bb09 |   and [A*4 + B], G, G
ee e0 e0 f8 63 03 55 01 ff e4  # bb0d |   jne [0x363], 0x155, ${fail}:rel + PC
aa 2a 3e 3e f6 f6              # bb17 |   shl [A*4 + B], A*4 + -10, A*4 + -10
ee e0 e0 f8 63 03 00 80 ef e4  # bb1d |   jne [0x363], 0x8000, ${fail}:rel + PC
86 3e 2a 1c f6 85              # bb27 |   sub [A*4 + -10], A*4 + B, -123
ee e0 e0 f8 9e 02 de 03 df e4  # bb2d |   jne [0x29e], 0x3de, ${fail}:rel + PC
ae fe fe 1c 85                 # bb37 |   and [G], G, -123
ee e0 e0 f8 55 01 05 01 d0 e4  # bb3c |   jne [0x155], 0x105, ${fail}:rel + PC
a6 21 3e 1c f6 85              # bb46 |   ishr [A*2], A*4 + -10, -123
ee e0 1c f8 54 01 14 c0 e4     # bb4c |   jne [0x154], 0x14, ${fail}:rel + PC
b2 e0 21 fe 39 30              # bb55 |   or [0x3039], A*2, G
ee e0 e0 f8 39 30 55 01 b1 e4  # bb5b |   jne [0x3039], 0x155, ${fail}:rel + PC
b2 2a 20 21                    # bb65 |   or [A*4 + B], A, A*2
ee e0 e0 f8 63 03 fe 01 a3 e4  # bb69 |   jne [0x363], 0x1fe, ${fail}:rel + PC
a2 21 20 e0 39 30              # bb73 |   shr [A*2], A, 0x3039
ee e0 00 f8 54 01 93 e4        # bb79 |   jne [0x154], 0, ${fail}:rel + PC
8e 3e 3e e4 f6 f6 de fa        # bb81 |   imul [A*4 + -10], A*4 + -10, 0xfade + A
ee e0 e0 f8 9e 02 f0 4d 83 e4  # bb89 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
a2 2a 3e fe f6                 # bb93 |   shr [A*4 + B], A*4 + -10, G
ee e0 1c f8 63 03 14 74 e4     # bb98 |   jne [0x363], 0x14, ${fail}:rel + PC
aa e0 2a 1c 39 30 85           # bba1 |   shl [0x3039], A*4 + B, -123
ee e0 e0 f8 39 30 60 6c 64 e4  # bba8 |   jne [0x3039], 0x6c60, ${fail}:rel + PC
86 e0 3e 20 39 30 f6           # bbb2 |   sub [0x3039], A*4 + -10, A
ee e0 e0 f8 39 30 f4 01 53 e4  # bbb9 |   jne [0x3039], 0x1f4, ${fail}:rel + PC
86 fe 3e fe f6                 # bbc3 |   sub [G], A*4 + -10, G
ee e0 e0 f8 55 01 49 01 44 e4  # bbc8 |   jne [0x155], 0x149, ${fail}:rel + PC
b6 20 20 2a                    # bbd2 |   xor [A], A, A*4 + B
ee e0 e0 f8 aa 00 c9 03 36 e4  # bbd6 |   jne [0xaa], 0x3c9, ${fail}:rel + PC
a2 20 21 21                    # bbe0 |   shr [A], A*2, A*2
ee e0 1c f8 aa 00 15 28 e4     # bbe4 |   jne [0xaa], 0x15, ${fail}:rel + PC
82 2a e0 21 39 30              # bbed |   add [A*4 + B], 0x3039, A*2
ee e0 e0 f8 63 03 8d 31 19 e4  # bbf3 |   jne [0x363], 0x318d, ${fail}:rel + PC
82 fe 2a 2a                    # bbfd |   add [G], A*4 + B, A*4 + B
ee e0 e0 f8 55 01 c6 06 0b e4  # bc01 |   jne [0x155], 0x6c6, ${fail}:rel + PC
aa 2a 2a 3e f6                 # bc0b |   shl [A*4 + B], A*4 + B, A*4 + -10
ee e0 e0 f8 63 03 00 c0 fc e3  # bc10 |   jne [0x363], 0xc000, ${fail}:rel + PC
b6 3e 2a 20 f6                 # bc1a |   xor [A*4 + -10], A*4 + B, A
ee e0 e0 f8 9e 02 c9 03 ed e3  # bc1f |   jne [0x29e], 0x3c9, ${fail}:rel + PC
8a 20 e4 1c de fa 85           # bc29 |   mul [A], 0xfade + A, -123
ee e0 e0 f8 aa 00 a8 25 dc e3  # bc30 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
ae 3e e0 e4 f6 39 30 de fa     # bc3a |   and [A*4 + -10], 0x3039, 0xfade + A
ee e0 e0 f8 9e 02 08 30 c9 e3  # bc43 |   jne [0x29e], 0x3008, ${fail}:rel + PC
82 20 fe 21                    # bc4d |   add [A], G, A*2
ee e0 e0 f8 aa 00 a9 02 bb e3  # bc51 |   jne [0xaa], 0x2a9, ${fail}:rel + PC
86 fe e4 fe de fa              # bc5b |   sub [G], 0xfade + A, G
ee e0 e0 f8 55 01 33 fa ab e3  # bc61 |   jne [0x155], 0xfa33, ${fail}:rel + PC
a2 e0 3e e4 39 30 f6 de fa     # bc6b |   shr [0x3039], A*4 + -10, 0xfade + A
ee e0 1c f8 39 30 02 98 e3     # bc74 |   jne [0x3039], 0x2, ${fail}:rel + PC
a2 3e 21 2a f6                 # bc7d |   shr [A*4 + -10], A*2, A*4 + B
ee e0 1c f8 9e 02 2a 8a e3     # bc82 |   jne [0x29e], 0x2a, ${fail}:rel + PC
a2 fe 20 2a                    # bc8b |   shr [G], A, A*4 + B
ee e0 1c f8 55 01 15 7d e3     # bc8f |   jne [0x155], 0x15, ${fail}:rel + PC
8e 2a fe 21                    # bc98 |   imul [A*4 + B], G, A*2
ee e0 e0 f8 63 03 e4 c4 70 e3  # bc9c |   jne [0x363], 0xc4e4, ${fail}:rel + PC
8a 3e e4 e4 f6 de fa de fa     # bca6 |   mul [A*4 + -10], 0xfade + A, 0xfade + A
ee e0 e0 f8 9e 02 40 f8 5d e3  # bcaf |   jne [0x29e], 0xf840, ${fail}:rel + PC
82 3e 2a e0 f6 39 30           # bcb9 |   add [A*4 + -10], A*4 + B, 0x3039
ee e0 e0 f8 9e 02 9c 33 4c e3  # bcc0 |   jne [0x29e], 0x339c, ${fail}:rel + PC
b6 2a fe 3e f6                 # bcca |   xor [A*4 + B], G, A*4 + -10
ee e0 e0 f8 63 03 cb 03 3d e3  # bccf |   jne [0x363], 0x3cb, ${fail}:rel + PC
b6 21 e4 20 de fa              # bcd9 |   xor [A*2], 0xfade + A, A
ee e0 e0 f8 54 01 22 fb 2d e3  # bcdf |   jne [0x154], 0xfb22, ${fail}:rel + PC
a2 e0 e0 21 39 30 39 30        # bce9 |   shr [0x3039], 0x3039, A*2
ee e0 e0 f8 39 30 03 03 1b e3  # bcf1 |   jne [0x3039], 0x303, ${fail}:rel + PC
8e 2a fe e0 39 30              # bcfb |   imul [A*4 + B], G, 0x3039
ee e0 e0 f8 63 03 ed 3b 0b e3  # bd01 |   jne [0x363], 0x3bed, ${fail}:rel + PC
b6 e0 1c 21 39 30 85           # bd0b |   xor [0x3039], -123, A*2
ee e0 e0 f8 39 30 d1 fe fa e2  # bd12 |   jne [0x3039], 0xfed1, ${fail}:rel + PC
86 e0 fe e4 39 30 de fa        # bd1c |   sub [0x3039], G, 0xfade + A
ee e0 e0 f8 39 30 cd 05 e8 e2  # bd24 |   jne [0x3039], 0x5cd, ${fail}:rel + PC
b6 20 21 e4 de fa              # bd2e |   xor [A], A*2, 0xfade + A
ee e0 e0 f8 aa 00 dc fa d8 e2  # bd34 |   jne [0xaa], 0xfadc, ${fail}:rel + PC
8a 21 3e e0 f6 39 30           # bd3e |   mul [A*2], A*4 + -10, 0x3039
ee e0 e0 f8 54 01 2e 35 c7 e2  # bd45 |   jne [0x154], 0x352e, ${fail}:rel + PC
aa 2a 21 20                    # bd4f |   shl [A*4 + B], A*2, A
ee e0 e0 f8 63 03 00 50 b9 e2  # bd53 |   jne [0x363], 0x5000, ${fail}:rel + PC
ae fe 1c e4 85 de fa           # bd5d |   and [G], -123, 0xfade + A
ee e0 e0 f8 55 01 80 fb a8 e2  # bd64 |   jne [0x155], 0xfb80, ${fail}:rel + PC
a2 20 20 21                    # bd6e |   shr [A], A, A*2
ee e0 1c f8 aa 00 0a 9a e2     # bd72 |   jne [0xaa], 0xa, ${fail}:rel + PC
b6 3e 20 3e f6 f6              # bd7b |   xor [A*4 + -10], A, A*4 + -10
ee e0 e0 f8 9e 02 34 02 8b e2  # bd81 |   jne [0x29e], 0x234, ${fail}:rel + PC
aa 3e 3e 21 f6 f6              # bd8b |   shl [A*4 + -10], A*4 + -10, A*2
ee e0 e0 f8 9e 02 e0 29 7b e2  # bd91 |   jne [0x29e], 0x29e0, ${fail}:rel + PC
8a 20 3e 1c f6 85              # bd9b |   mul [A], A*4 + -10, -123
ee e0 e0 f8 aa 00 16 be 6b e2  # bda1 |   jne [0xaa], 0xbe16, ${fail}:rel + PC
b2 fe fe e0 39 30              # bdab |   or [G], G, 0x3039
ee e0 e0 f8 55 01 7d 31 5b e2  # bdb1 |   jne [0x155], 0x317d, ${fail}:rel + PC
a2 2a e4 3e de fa f6           # bdbb |   shr [A*4 + B], 0xfade + A, A*4 + -10
ee e0 1c f8 63 03 03 4a e2     # bdc2 |   jne [0x363], 0x3, ${fail}:rel + PC
8a 2a 20 e0 39 30              # bdcb |   mul [A*4 + B], A, 0x3039
ee e0 e0 f8 63 03 da 05 3b e2  # bdd1 |   jne [0x363], 0x5da, ${fail}:rel + PC
ae 3e 21 e0 f6 39 30           # bddb |   and [A*4 + -10], A*2, 0x3039
ee e0 1c f8 9e 02 10 2a e2     # bde2 |   jne [0x29e], 0x10, ${fail}:rel + PC
ae e0 20 2a 39 30              # bdeb |   and [0x3039], A, A*4 + B
ee e0 1c f8 39 30 22 1b e2     # bdf1 |   jne [0x3039], 0x22, ${fail}:rel + PC
8e fe 2a fe                    # bdfa |   imul [G], A*4 + B, G
ee e0 e0 f8 55 01 df 82 0e e2  # bdfe |   jne [0x155], 0x82df, ${fail}:rel + PC
86 e0 fe 2a 39 30              # be08 |   sub [0x3039], G, A*4 + B
ee e0 e0 f8 39 30 f2 fd fe e1  # be0e |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
a2 2a fe 2a                    # be18 |   shr [A*4 + B], G, A*4 + B
ee e0 1c f8 63 03 2a f0 e1     # be1c |   jne [0x363], 0x2a, ${fail}:rel + PC
b2 3e fe fe f6                 # be25 |   or [A*4 + -10], G, G
ee e0 e0 f8 9e 02 55 01 e2 e1  # be2a |   jne [0x29e], 0x155, ${fail}:rel + PC
b6 21 20 fe                    # be34 |   xor [A*2], A, G
ee e0 e0 f8 54 01 ff 01 d4 e1  # be38 |   jne [0x154], 0x1ff, ${fail}:rel + PC
a2 fe 3e 1c f6 85              # be42 |   shr [G], A*4 + -10, -123
ee e0 1c f8 55 01 14 c4 e1     # be48 |   jne [0x155], 0x14, ${fail}:rel + PC
a6 e0 fe 20 39 30              # be51 |   ishr [0x3039], G, A
ee e0 00 f8 39 30 b5 e1        # be57 |   jne [0x3039], 0, ${fail}:rel + PC
8a 21 1c e4 85 de fa           # be5f |   mul [A*2], -123, 0xfade + A
ee e0 e0 f8 54 01 a8 25 a6 e1  # be66 |   jne [0x154], 0x25a8, ${fail}:rel + PC
b2 21 e4 e0 de fa 39 30        # be70 |   or [A*2], 0xfade + A, 0x3039
ee e0 e0 f8 54 01 b9 fb 94 e1  # be78 |   jne [0x154], 0xfbb9, ${fail}:rel + PC
8e 2a e0 e4 39 30 de fa        # be82 |   imul [A*4 + B], 0x3039, 0xfade + A
ee e0 e0 f8 63 03 48 81 82 e1  # be8a |   jne [0x363], 0x8148, ${fail}:rel + PC
b2 3e fe 1c f6 85              # be94 |   or [A*4 + -10], G, -123
ee e0 1c f8 9e 02 d5 72 e1     # be9a |   jne [0x29e], 0xd5, ${fail}:rel + PC
a6 3e 21 20 f6                 # bea3 |   ishr [A*4 + -10], A*2, A
ee e0 00 f8 9e 02 64 e1        # bea8 |   jne [0x29e], 0, ${fail}:rel + PC
ae 21 2a 1c 85                 # beb0 |   and [A*2], A*4 + B, -123
ee e0 e0 f8 54 01 01 03 57 e1  # beb5 |   jne [0x154], 0x301, ${fail}:rel + PC
b2 20 21 3e f6                 # bebf |   or [A], A*2, A*4 + -10
ee e0 e0 f8 aa 00 de 03 48 e1  # bec4 |   jne [0xaa], 0x3de, ${fail}:rel + PC
82 fe 3e 20 f6                 # bece |   add [G], A*4 + -10, A
ee e0 e0 f8 55 01 48 03 39 e1  # bed3 |   jne [0x155], 0x348, ${fail}:rel + PC
aa 3e 20 e0 f6 39 30           # bedd |   shl [A*4 + -10], A, 0x3039
ee e0 e0 f8 9e 02 00 54 28 e1  # bee4 |   jne [0x29e], 0x5400, ${fail}:rel + PC
aa 20 e4 e4 de fa de fa        # beee |   shl [A], 0xfade + A, 0xfade + A
ee e0 e0 f8 aa 00 00 88 16 e1  # bef6 |   jne [0xaa], 0x8800, ${fail}:rel + PC
8e fe 3e e0 f6 39 30           # bf00 |   imul [G], A*4 + -10, 0x3039
ee e0 e0 f8 55 01 2e 35 05 e1  # bf07 |   jne [0x155], 0x352e, ${fail}:rel + PC
82 e0 1c 1c 39 30 85 85        # bf11 |   add [0x3039], -123, -123
ee e0 e0 f8 39 30 0a ff f3 e0  # bf19 |   jne [0x3039], 0xff0a, ${fail}:rel + PC
86 21 3e fe f6                 # bf23 |   sub [A*2], A*4 + -10, G
ee e0 e0 f8 54 01 49 01 e4 e0  # bf28 |   jne [0x154], 0x149, ${fail}:rel + PC
a6 20 e4 fe de fa              # bf32 |   ishr [A], 0xfade + A, G
ee e0 1c f8 aa 00 dc d4 e0     # bf38 |   jne [0xaa], 0xdc, ${fail}:rel + PC
b6 20 e4 e0 de fa 39 30        # bf41 |   xor [A], 0xfade + A, 0x3039
ee e0 e0 f8 aa 00 b1 cb c3 e0  # bf49 |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
86 fe 21 e4 de fa              # bf53 |   sub [G], A*2, 0xfade + A
ee e0 e0 f8 55 01 cc 05 b3 e0  # bf59 |   jne [0x155], 0x5cc, ${fail}:rel + PC
82 2a e0 e0 39 30 39 30        # bf63 |   add [A*4 + B], 0x3039, 0x3039
ee e0 e0 f8 63 03 72 60 a1 e0  # bf6b |   jne [0x363], 0x6072, ${fail}:rel + PC
86 3e 1c e4 f6 85 de fa        # bf75 |   sub [A*4 + -10], -123, 0xfade + A
ee e0 e0 f8 9e 02 fd 03 8f e0  # bf7d |   jne [0x29e], 0x3fd, ${fail}:rel + PC
82 21 21 3e f6                 # bf87 |   add [A*2], A*2, A*4 + -10
ee e0 e0 f8 54 01 f2 03 80 e0  # bf8c |   jne [0x154], 0x3f2, ${fail}:rel + PC
a2 20 e0 1c 39 30 85           # bf96 |   shr [A], 0x3039, -123
ee e0 e0 f8 aa 00 81 01 6f e0  # bf9d |   jne [0xaa], 0x181, ${fail}:rel + PC
8e 21 20 3e f6                 # bfa7 |   imul [A*2], A, A*4 + -10
ee e0 e0 f8 54 01 ec bc 60 e0  # bfac |   jne [0x154], 0xbcec, ${fail}:rel + PC
b2 3e fe e4 f6 de fa           # bfb6 |   or [A*4 + -10], G, 0xfade + A
ee e0 e0 f8 9e 02 dd fb 4f e0  # bfbd |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
a6 fe 20 1c 85                 # bfc7 |   ishr [G], A, -123
ee e0 1c f8 55 01 05 40 e0     # bfcc |   jne [0x155], 0x5, ${fail}:rel + PC
a6 21 20 e4 de fa              # bfd5 |   ishr [A*2], A, 0xfade + A
ee e0 00 f8 54 01 31 e0        # bfdb |   jne [0x154], 0, ${fail}:rel + PC
a2 e0 1c 20 39 30 85           # bfe3 |   shr [0x3039], -123, A
ee e0 1c f8 39 30 3f 22 e0     # bfea |   jne [0x3039], 0x3f, ${fail}:rel + PC
8e 20 20 3e f6                 # bff3 |   imul [A], A, A*4 + -10
ee e0 e0 f8 aa 00 ec bc 14 e0  # bff8 |   jne [0xaa], 0xbcec, ${fail}:rel + PC
82 2a e4 fe de fa              # c002 |   add [A*4 + B], 0xfade + A, G
ee e0 e0 f8 63 03 dd fc 04 e0  # c008 |   jne [0x363], 0xfcdd, ${fail}:rel + PC
b6 fe e0 3e 39 30 f6           # c012 |   xor [G], 0x3039, A*4 + -10
ee e0 e0 f8 55 01 a7 32 f3 df  # c019 |   jne [0x155], 0x32a7, ${fail}:rel + PC
8e 20 e0 2a 39 30              # c023 |   imul [A], 0x3039, A*4 + B
ee e0 e0 f8 aa 00 0b 51 e3 df  # c029 |   jne [0xaa], 0x510b, ${fail}:rel + PC
b2 3e e4 fe f6 de fa           # c033 |   or [A*4 + -10], 0xfade + A, G
ee e0 e0 f8 9e 02 dd fb d2 df  # c03a |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
86 21 1c 21 85                 # c044 |   sub [A*2], -123, A*2
ee e0 e0 f8 54 01 31 fe c3 df  # c049 |   jne [0x154], 0xfe31, ${fail}:rel + PC
b2 2a 21 21                    # c053 |   or [A*4 + B], A*2, A*2
ee e0 e0 f8 63 03 54 01 b5 df  # c057 |   jne [0x363], 0x154, ${fail}:rel + PC
8e e0 20 3e 39 30 f6           # c061 |   imul [0x3039], A, A*4 + -10
ee e0 e0 f8 39 30 ec bc a4 df  # c068 |   jne [0x3039], 0xbcec, ${fail}:rel + PC
a6 3e e4 2a f6 de fa           # c072 |   ishr [A*4 + -10], 0xfade + A, A*4 + B
ee e0 e0 f8 9e 02 71 ff 93 df  # c079 |   jne [0x29e], 0xff71, ${fail}:rel + PC
ae e0 20 e4 39 30 de fa        # c083 |   and [0x3039], A, 0xfade + A
ee e0 e0 f8 39 30 88 00 81 df  # c08b |   jne [0x3039], 0x88, ${fail}:rel + PC
a6 20 fe fe                    # c095 |   ishr [A], G, G
ee e0 1c f8 aa 00 0a 73 df     # c099 |   jne [0xaa], 0xa, ${fail}:rel + PC
8e 20 3e 20 f6                 # c0a2 |   imul [A], A*4 + -10, A
ee e0 e0 f8 aa 00 ec bc 65 df  # c0a7 |   jne [0xaa], 0xbcec, ${fail}:rel + PC
b2 e0 3e fe 39 30 f6           # c0b1 |   or [0x3039], A*4 + -10, G
ee e0 e0 f8 39 30 df 03 54 df  # c0b8 |   jne [0x3039], 0x3df, ${fail}:rel + PC
82 21 e0 e4 39 30 de fa        # c0c2 |   add [A*2], 0x3039, 0xfade + A
ee e0 e0 f8 54 01 c1 2b 42 df  # c0ca |   jne [0x154], 0x2bc1, ${fail}:rel + PC
82 e0 1c e4 39 30 85 de fa     # c0d4 |   add [0x3039], -123, 0xfade + A
ee e0 e0 f8 39 30 0d fb 2f df  # c0dd |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
b2 fe 20 21                    # c0e7 |   or [G], A, A*2
ee e0 e0 f8 55 01 fe 01 21 df  # c0eb |   jne [0x155], 0x1fe, ${fail}:rel + PC
aa 21 2a 21                    # c0f5 |   shl [A*2], A*4 + B, A*2
ee e0 e0 f8 54 01 30 36 13 df  # c0f9 |   jne [0x154], 0x3630, ${fail}:rel + PC
82 e0 2a e0 39 30 39 30        # c103 |   add [0x3039], A*4 + B, 0x3039
ee e0 e0 f8 39 30 9c 33 01 df  # c10b |   jne [0x3039], 0x339c, ${fail}:rel + PC
ae 2a 20 1c 85                 # c115 |   and [A*4 + B], A, -123
ee e0 e0 f8 63 03 80 00 f2 de  # c11a |   jne [0x363], 0x80, ${fail}:rel + PC
b6 e0 20 1c 39 30 85           # c124 |   xor [0x3039], A, -123
ee e0 e0 f8 39 30 2f ff e1 de  # c12b |   jne [0x3039], 0xff2f, ${fail}:rel + PC
ae 21 fe e0 39 30              # c135 |   and [A*2], G, 0x3039
ee e0 1c f8 54 01 11 d1 de     # c13b |   jne [0x154], 0x11, ${fail}:rel + PC
ae 3e fe 3e f6 f6              # c144 |   and [A*4 + -10], G, A*4 + -10
ee e0 1c f8 9e 02 14 c2 de     # c14a |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 3e 2a 2a f6                 # c153 |   mul [A*4 + -10], A*4 + B, A*4 + B
ee e0 e0 f8 9e 02 49 78 b4 de  # c158 |   jne [0x29e], 0x7849, ${fail}:rel + PC
82 20 3e e0 f6 39 30           # c162 |   add [A], A*4 + -10, 0x3039
ee e0 e0 f8 aa 00 d7 32 a3 de  # c169 |   jne [0xaa], 0x32d7, ${fail}:rel + PC
82 21 e0 3e 39 30 f6           # c173 |   add [A*2], 0x3039, A*4 + -10
ee e0 e0 f8 54 01 d7 32 92 de  # c17a |   jne [0x154], 0x32d7, ${fail}:rel + PC
b6 21 3e 3e f6 f6              # c184 |   xor [A*2], A*4 + -10, A*4 + -10
ee e0 00 f8 54 01 82 de        # c18a |   jne [0x154], 0, ${fail}:rel + PC
a6 e0 20 20 39 30              # c192 |   ishr [0x3039], A, A
ee e0 00 f8 39 30 74 de        # c198 |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e0 3e 39 30 39 30 f6     # c1a0 |   ishr [0x3039], 0x3039, A*4 + -10
ee e0 00 f8 39 30 63 de        # c1a9 |   jne [0x3039], 0, ${fail}:rel + PC
aa 20 1c 21 85                 # c1b1 |   shl [A], -123, A*2
ee e0 e0 f8 aa 00 50 f8 56 de  # c1b6 |   jne [0xaa], 0xf850, ${fail}:rel + PC
ae e0 21 e4 39 30 de fa        # c1c0 |   and [0x3039], A*2, 0xfade + A
ee e0 e0 f8 39 30 00 01 44 de  # c1c8 |   jne [0x3039], 0x100, ${fail}:rel + PC
b2 3e 1c 20 f6 85              # c1d2 |   or [A*4 + -10], -123, A
ee e0 1c f8 9e 02 af 34 de     # c1d8 |   jne [0x29e], 0xaf, ${fail}:rel + PC
8e 21 1c 20 85                 # c1e1 |   imul [A*2], -123, A
ee e0 e0 f8 54 01 52 ae 26 de  # c1e6 |   jne [0x154], 0xae52, ${fail}:rel + PC
8a 2a 2a 2a                    # c1f0 |   mul [A*4 + B], A*4 + B, A*4 + B
ee e0 e0 f8 63 03 49 78 18 de  # c1f4 |   jne [0x363], 0x7849, ${fail}:rel + PC
86 2a 2a e0 39 30              # c1fe |   sub [A*4 + B], A*4 + B, 0x3039
ee e0 e0 f8 63 03 2a d3 08 de  # c204 |   jne [0x363], 0xd32a, ${fail}:rel + PC
ae fe 1c 21 85                 # c20e |   and [G], -123, A*2
ee e0 e0 f8 55 01 04 01 f9 dd  # c213 |   jne [0x155], 0x104, ${fail}:rel + PC
8e 21 e4 1c de fa 85           # c21d |   imul [A*2], 0xfade + A, -123
ee e0 e0 f8 54 01 a8 25 e8 dd  # c224 |   jne [0x154], 0x25a8, ${fail}:rel + PC
8a 21 21 e4 de fa              # c22e |   mul [A*2], A*2, 0xfade + A
ee e0 e0 f8 54 01 a0 10 d8 dd  # c234 |   jne [0x154], 0x10a0, ${fail}:rel + PC
86 fe e0 fe 39 30              # c23e |   sub [G], 0x3039, G
ee e0 e0 f8 55 01 e4 2e c8 dd  # c244 |   jne [0x155], 0x2ee4, ${fail}:rel + PC
62 20 1c 85                    # c24e |   mov [A], -123
ee e0 1c f8 aa 00 85 ba dd     # c252 |   jne [0xaa], 0x85, ${fail}:rel + PC
62 3e 3e f6 f6                 # c25b |   mov [A*4 + -10], A*4 + -10
ee e0 e0 f8 9e 02 9e 02 ac dd  # c260 |   jne [0x29e], 0x29e, ${fail}:rel + PC
62 21 2a                       # c26a |   mov [A*2], A*4 + B
ee e0 e0 f8 54 01 63 03 9f dd  # c26d |   jne [0x154], 0x363, ${fail}:rel + PC
62 e0 1c 39 30 85              # c277 |   mov [0x3039], -123
ee e0 1c f8 39 30 85 8f dd     # c27d |   jne [0x3039], 0x85, ${fail}:rel + PC
62 fe 3e f6                    # c286 |   mov [G], A*4 + -10
ee e0 e0 f8 55 01 9e 02 82 dd  # c28a |   jne [0x155], 0x29e, ${fail}:rel + PC
62 e0 fe 39 30                 # c294 |   mov [0x3039], G
ee e0 e0 f8 39 30 55 01 73 dd  # c299 |   jne [0x3039], 0x155, ${fail}:rel + PC
62 fe 21                       # c2a3 |   mov [G], A*2
ee e0 e0 f8 55 01 54 01 66 dd  # c2a6 |   jne [0x155], 0x154, ${fail}:rel + PC
62 3e e4 f6 de fa              # c2b0 |   mov [A*4 + -10], 0xfade + A
ee e0 e0 f8 9e 02 88 fb 56 dd  # c2b6 |   jne [0x29e], 0xfb88, ${fail}:rel + PC
62 e0 e0 39 30 39 30           # c2c0 |   mov [0x3039], 0x3039
ee e0 e0 f8 39 30 39 30 45 dd  # c2c7 |   jne [0x3039], 0x3039, ${fail}:rel + PC
62 3e fe f6                    # c2d1 |   mov [A*4 + -10], G
ee e0 e0 f8 9e 02 55 01 37 dd  # c2d5 |   jne [0x29e], 0x155, ${fail}:rel + PC
62 20 fe                       # c2df |   mov [A], G
ee e0 e0 f8 aa 00 55 01 2a dd  # c2e2 |   jne [0xaa], 0x155, ${fail}:rel + PC
62 2a 2a                       # c2ec |   mov [A*4 + B], A*4 + B
ee e0 e0 f8 63 03 63 03 1d dd  # c2ef |   jne [0x363], 0x363, ${fail}:rel + PC
62 3e 2a f6                    # c2f9 |   mov [A*4 + -10], A*4 + B
ee e0 e0 f8 9e 02 63 03 0f dd  # c2fd |   jne [0x29e], 0x363, ${fail}:rel + PC
62 2a 20                       # c307 |   mov [A*4 + B], A
ee e0 e0 f8 63 03 aa 00 02 dd  # c30a |   jne [0x363], 0xaa, ${fail}:rel + PC
62 3e 20 f6                    # c314 |   mov [A*4 + -10], A
ee e0 e0 f8 9e 02 aa 00 f4 dc  # c318 |   jne [0x29e], 0xaa, ${fail}:rel + PC
62 20 20                       # c322 |   mov [A], A
ee e0 e0 f8 aa 00 aa 00 e7 dc  # c325 |   jne [0xaa], 0xaa, ${fail}:rel + PC
62 2a e4 de fa                 # c32f |   mov [A*4 + B], 0xfade + A
ee e0 e0 f8 63 03 88 fb d8 dc  # c334 |   jne [0x363], 0xfb88, ${fail}:rel + PC
62 21 1c 85                    # c33e |   mov [A*2], -123
ee e0 1c f8 54 01 85 ca dc     # c342 |   jne [0x154], 0x85, ${fail}:rel + PC
62 2a e0 39 30                 # c34b |   mov [A*4 + B], 0x3039
ee e0 e0 f8 63 03 39 30 bc dc  # c350 |   jne [0x363], 0x3039, ${fail}:rel + PC
62 3e 1c f6 85                 # c35a |   mov [A*4 + -10], -123
ee e0 1c f8 9e 02 85 ad dc     # c35f |   jne [0x29e], 0x85, ${fail}:rel + PC
62 3e 21 f6                    # c368 |   mov [A*4 + -10], A*2
ee e0 e0 f8 9e 02 54 01 a0 dc  # c36c |   jne [0x29e], 0x154, ${fail}:rel + PC
62 21 3e f6                    # c376 |   mov [A*2], A*4 + -10
ee e0 e0 f8 54 01 9e 02 92 dc  # c37a |   jne [0x154], 0x29e, ${fail}:rel + PC
62 e0 21 39 30                 # c384 |   mov [0x3039], A*2
ee e0 e0 f8 39 30 54 01 83 dc  # c389 |   jne [0x3039], 0x154, ${fail}:rel + PC
62 21 fe                       # c393 |   mov [A*2], G
ee e0 e0 f8 54 01 55 01 76 dc  # c396 |   jne [0x154], 0x155, ${fail}:rel + PC
62 2a fe                       # c3a0 |   mov [A*4 + B], G
ee e0 e0 f8 63 03 55 01 69 dc  # c3a3 |   jne [0x363], 0x155, ${fail}:rel + PC
62 21 e4 de fa                 # c3ad |   mov [A*2], 0xfade + A
ee e0 e0 f8 54 01 88 fb 5a dc  # c3b2 |   jne [0x154], 0xfb88, ${fail}:rel + PC
62 20 3e f6                    # c3bc |   mov [A], A*4 + -10
ee e0 e0 f8 aa 00 9e 02 4c dc  # c3c0 |   jne [0xaa], 0x29e, ${fail}:rel + PC
62 e0 3e 39 30 f6              # c3ca |   mov [0x3039], A*4 + -10
ee e0 e0 f8 39 30 9e 02 3c dc  # c3d0 |   jne [0x3039], 0x29e, ${fail}:rel + PC
62 2a 3e f6                    # c3da |   mov [A*4 + B], A*4 + -10
ee e0 e0 f8 63 03 9e 02 2e dc  # c3de |   jne [0x363], 0x29e, ${fail}:rel + PC
62 e0 e4 39 30 de fa           # c3e8 |   mov [0x3039], 0xfade + A
ee e0 e0 f8 39 30 88 fb 1d dc  # c3ef |   jne [0x3039], 0xfb88, ${fail}:rel + PC
62 21 e0 39 30                 # c3f9 |   mov [A*2], 0x3039
ee e0 e0 f8 54 01 39 30 0e dc  # c3fe |   jne [0x154], 0x3039, ${fail}:rel + PC
62 fe 1c 85                    # c408 |   mov [G], -123
ee e0 1c f8 55 01 85 00 dc     # c40c |   jne [0x155], 0x85, ${fail}:rel + PC
62 e0 2a 39 30                 # c415 |   mov [0x3039], A*4 + B
ee e0 e0 f8 39 30 63 03 f2 db  # c41a |   jne [0x3039], 0x363, ${fail}:rel + PC
62 fe e4 de fa                 # c424 |   mov [G], 0xfade + A
ee e0 e0 f8 55 01 88 fb e3 db  # c429 |   jne [0x155], 0xfb88, ${fail}:rel + PC
62 20 e0 39 30                 # c433 |   mov [A], 0x3039
ee e0 e0 f8 aa 00 39 30 d4 db  # c438 |   jne [0xaa], 0x3039, ${fail}:rel + PC
62 20 21                       # c442 |   mov [A], A*2
ee e0 e0 f8 aa 00 54 01 c7 db  # c445 |   jne [0xaa], 0x154, ${fail}:rel + PC
62 3e e0 f6 39 30              # c44f |   mov [A*4 + -10], 0x3039
ee e0 e0 f8 9e 02 39 30 b7 db  # c455 |   jne [0x29e], 0x3039, ${fail}:rel + PC
62 fe 20                       # c45f |   mov [G], A
ee e0 e0 f8 55 01 aa 00 aa db  # c462 |   jne [0x155], 0xaa, ${fail}:rel + PC
62 21 20                       # c46c |   mov [A*2], A
ee e0 e0 f8 54 01 aa 00 9d db  # c46f |   jne [0x154], 0xaa, ${fail}:rel + PC
62 fe fe                       # c479 |   mov [G], G
ee e0 e0 f8 55 01 55 01 90 db  # c47c |   jne [0x155], 0x155, ${fail}:rel + PC
62 20 2a                       # c486 |   mov [A], A*4 + B
ee e0 e0 f8 aa 00 63 03 83 db  # c489 |   jne [0xaa], 0x363, ${fail}:rel + PC
62 2a 1c 85                    # c493 |   mov [A*4 + B], -123
ee e0 1c f8 63 03 85 75 db     # c497 |   jne [0x363], 0x85, ${fail}:rel + PC
62 2a 21                       # c4a0 |   mov [A*4 + B], A*2
ee e0 e0 f8 63 03 54 01 69 db  # c4a3 |   jne [0x363], 0x154, ${fail}:rel + PC
62 e0 20 39 30                 # c4ad |   mov [0x3039], A
ee e0 e0 f8 39 30 aa 00 5a db  # c4b2 |   jne [0x3039], 0xaa, ${fail}:rel + PC
62 fe e0 39 30                 # c4bc |   mov [G], 0x3039
ee e0 e0 f8 55 01 39 30 4b db  # c4c1 |   jne [0x155], 0x3039, ${fail}:rel + PC
62 21 21                       # c4cb |   mov [A*2], A*2
ee e0 e0 f8 54 01 54 01 3e db  # c4ce |   jne [0x154], 0x154, ${fail}:rel + PC
62 fe 2a                       # c4d8 |   mov [G], A*4 + B
ee e0 e0 f8 55 01 63 03 31 db  # c4db |   jne [0x155], 0x363, ${fail}:rel + PC
62 20 e4 de fa                 # c4e5 |   mov [A], 0xfade + A
ee e0 e0 f8 aa 00 88 fb 22 db  # c4ea |   jne [0xaa], 0xfb88, ${fail}:rel + PC
e0 2a                          # c4f4 |   push A*4 + B
e4 80                          # c4f6 |   pop D
ec 80 e0 f8 63 03 14 db        # c4f8 |   jne D, 0x363, ${fail}:rel + PC
e0 1c 85                       # c500 |   push -123
e4 80                          # c503 |   pop D
ec 80 1c f8 85 07 db           # c505 |   jne D, 0x85, ${fail}:rel + PC
e0 fe                          # c50c |   push G
e4 80                          # c50e |   pop D
ec 80 e0 f8 55 01 fc da        # c510 |   jne D, 0x155, ${fail}:rel + PC
e0 3e f6                       # c518 |   push A*4 + -10
e4 80                          # c51b |   pop D
ec 80 e0 f8 9e 02 ef da        # c51d |   jne D, 0x29e, ${fail}:rel + PC
e0 20                          # c525 |   push A
e4 80                          # c527 |   pop D
ec 80 e0 f8 aa 00 e3 da        # c529 |   jne D, 0xaa, ${fail}:rel + PC
e0 e4 de fa                    # c531 |   push 0xfade + A
e4 80                          # c535 |   pop D
ec 80 e0 f8 88 fb d5 da        # c537 |   jne D, 0xfb88, ${fail}:rel + PC
e0 21                          # c53f |   push A*2
e4 80                          # c541 |   pop D
ec 80 e0 f8 54 01 c9 da        # c543 |   jne D, 0x154, ${fail}:rel + PC
e0 e0 39 30                    # c54b |   push 0x3039
e4 80                          # c54f |   pop D
ec 80 e0 f8 39 30 bb da        # c551 |   jne D, 0x3039, ${fail}:rel + PC
5c f8 10 00                    # c559 |   call ${_L_test_uop_get_arg_1}:rel + PC
ec 60 e0 f8 fe ad af da        # c55d |   jne C, 0xadfe, ${fail}:rel + PC
58 f8 0e 00                    # c565 |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                               #      | _L_test_uop_get_arg_1:
60 60 e0 fe ad                 # c569 |   mov C, 0xadfe
dc                             # c56e |   ret
58 f8 9d da                    # c56f |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_get_arg_2:
                               #      | test_uop_alu_2dd:
60 20 e0 cd ab                 # c573 |   mov A, 0xabcd
00 20 e0 ab cd                 # c578 |   add A, 0xcdab
ec 20 e0 f8 78 79 8f da        # c57d |   jne A, 0x7978, ${fail}:rel + PC
                               #      | test_uop_alu_2di:
60 20 e0 00 10                 # c585 |   mov A, 0x1000
62 e0 e0 00 10 bc 0a           # c58a |   mov [0x1000], 0xabc
01 20 20                       # c591 |   add A, [A]
ec 20 e0 f8 bc 1a 78 da        # c594 |   jne A, 0x1abc, ${fail}:rel + PC
                               #      | test_uop_alu_2id:
62 e0 e0 00 10 34 12           # c59c |   mov [0x1000], 0x1234
02 e0 e0 00 10 21 43           # c5a3 |   add [0x1000], 0x4321
61 20 e0 00 10                 # c5aa |   mov A, [0x1000]
ec 20 e0 f8 55 55 5d da        # c5af |   jne A, 0x5555, ${fail}:rel + PC
                               #      | test_uop_alu_2ii:
62 e0 e0 00 10 34 12           # c5b7 |   mov [0x1000], 0x1234
62 e0 e0 05 10 aa aa           # c5be |   mov [0x1005], 0xaaaa
03 e0 e0 05 10 00 10           # c5c5 |   add [0x1005], [0x1000]
ee e0 e0 f8 05 10 de bc 40 da  # c5cc |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                               #      | test_uop_alu_3dd:
60 20 e0 fe ab                 # c5d6 |   mov A, 0xabfe
60 40 e0 55 55                 # c5db |   mov B, 0x5555
80 60 20 40                    # c5e0 |   add C, A, B
ec 20 e0 f8 fe ab 28 da        # c5e4 |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 20 da        # c5ec |   jne B, 0x5555, ${fail}:rel + PC
ec 60 e0 f8 53 01 18 da        # c5f4 |   jne C, 0x153, ${fail}:rel + PC
                               #      | test_uop_alu_3di:
62 e0 e0 00 10 aa 12           # c5fc |   mov [0x1000], 0x12aa
60 40 e0 de fa                 # c603 |   mov B, 0xfade
b5 20 e0 40 00 10              # c608 |   xor A, [0x1000], B
ee e0 e0 f8 00 10 aa 12 fe d9  # c60e |   jne [0x1000], 0x12aa, ${fail}:rel + PC
ec 40 e0 f8 de fa f4 d9        # c618 |   jne B, 0xfade, ${fail}:rel + PC
ec 20 e0 f8 74 e8 ec d9        # c620 |   jne A, 0xe874, ${fail}:rel + PC
                               #      | test_uop_alu_3id:
60 20 e0 fe ab                 # c628 |   mov A, 0xabfe
60 40 e0 55 55                 # c62d |   mov B, 0x5555
86 e0 20 40 00 10              # c632 |   sub [0x1000], A, B
ec 20 e0 f8 fe ab d4 d9        # c638 |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 cc d9        # c640 |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 00 10 a9 56 c4 d9  # c648 |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                               #      | test_uop_alu_3ii:
62 e0 e0 00 10 fe ab           # c652 |   mov [0x1000], 0xabfe
60 40 e0 55 55                 # c659 |   mov B, 0x5555
af e0 e0 40 02 10 00 10        # c65e |   and [0x1002], [0x1000], B
ee e0 e0 f8 00 10 fe ab a6 d9  # c666 |   jne [0x1000], 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 9c d9        # c670 |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 02 10 54 01 94 d9  # c678 |   jne [0x1002], 0x154, ${fail}:rel + PC
                               #      | test_uop_alu_single_1dx:
60 20 e0 00 ff                 # c682 |   mov A, 0xff00
3c 20                          # c687 |   not A
ec 20 e0 f8 ff 00 83 d9        # c689 |   jne A, 0xff, ${fail}:rel + PC
                               #      | test_uop_alu_single_1ix:
62 1c e0 64 34 12              # c691 |   mov [0x64], 0x1234
3a 1c 64                       # c697 |   neg [0x64]
ee 1c e0 f8 64 cc ed 72 d9     # c69a |   jne [0x64], 0xedcc, ${fail}:rel + PC
                               #      | test_uop_alu_single_2dd:
60 40 e0 ff 00                 # c6a3 |   mov B, 0xff
bc 20 40                       # c6a8 |   not A, B
ec 40 e0 f8 ff 00 61 d9        # c6ab |   jne B, 0xff, ${fail}:rel + PC
ec 20 e0 f8 00 ff 59 d9        # c6b3 |   jne A, 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2di:
62 1c e0 64 34 12              # c6bb |   mov [0x64], 0x1234
bd 20 1c 64                    # c6c1 |   not A, [0x64]
ee 1c e0 f8 64 34 12 47 d9     # c6c5 |   jne [0x64], 0x1234, ${fail}:rel + PC
ec 20 e0 f8 cb ed 3e d9        # c6ce |   jne A, 0xedcb, ${fail}:rel + PC
                               #      | test_uop_alu_single_2id:
60 40 e0 ff 00                 # c6d6 |   mov B, 0xff
be 1c 40 64                    # c6db |   not [0x64], B
ec 40 e0 f8 ff 00 2d d9        # c6df |   jne B, 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff 25 d9     # c6e7 |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2ii:
62 1c e0 66 ff 00              # c6f0 |   mov [0x66], 0xff
bf 1c 1c 64 66                 # c6f6 |   not [0x64], [0x66]
ee 1c e0 f8 66 ff 00 11 d9     # c6fb |   jne [0x66], 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff 08 d9     # c704 |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_cmp_dd:
60 40 1c 7b                    # c70d |   mov B, 0x7b
50 40 e0 c8 01                 # c711 |   cmp B, 0x1c8
4c 20                          # c716 |   getf A
ec 40 1c f8 7b f4 d8           # c718 |   jne B, 0x7b, ${fail}:rel + PC
ec 20 1c f8 0e ed d8           # c71f |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_di:
62 1c 1c 64 85                 # c726 |   mov [0x64], -123
60 40 e0 c8 01                 # c72b |   mov B, 0x1c8
d1 40 1c 64                    # c730 |   icmp B, [0x64]
4c 20                          # c734 |   getf A
ec 40 e0 f8 c8 01 d6 d8        # c736 |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 32 ce d8           # c73e |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_cmp_id:
62 1c 1c 64 85                 # c745 |   mov [0x64], -123
60 40 e0 c8 01                 # c74a |   mov B, 0x1c8
d2 1c 40 64                    # c74f |   icmp [0x64], B
4c 20                          # c753 |   getf A
ec 40 e0 f8 c8 01 b7 d8        # c755 |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 0e af d8           # c75d |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_ii:
62 1c 1c 64 85                 # c764 |   mov [0x64], -123
62 1c e0 66 38 fe              # c769 |   mov [0x66], 0xfe38
d3 1c 1c 64 66                 # c76f |   icmp [0x64], [0x66]
4c 20                          # c774 |   getf A
ee 1c 1c f8 64 85 96 d8        # c776 |   jne [0x64], -123, ${fail}:rel + PC
ee 1c e0 f8 66 38 fe 8e d8     # c77e |   jne [0x66], 0xfe38, ${fail}:rel + PC
ec 20 1c f8 32 85 d8           # c787 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_jmp_d:
60 20 e0 99 c7                 # c78e |   mov A, ${_L_test_uop_jmp_d_okay}
58 20                          # c793 |   jmp A
58 f8 77 d8                    # c795 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_d_okay:
                               #      | test_uop_jmp_i:
62 1c e0 64 a6 c7              # c799 |   mov [0x64], ${_L_test_uop_jmp_i_okay}
5a 1c 64                       # c79f |   jmp [0x64]
58 f8 6a d8                    # c7a2 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_i_okay:
ee 1c e0 f8 64 a6 c7 66 d8     # c7a6 |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_i:
62 1c e0 64 c5 c7              # c7af |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
50 1c 1c 01 02                 # c7b5 |   cmp 0x1, 0x2
68 f8 52 d8                    # c7ba |   jeq ${fail}:rel + PC
6e 1c 64                       # c7be |   jne [0x64]
58 f8 4b d8                    # c7c1 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_i_okay:
ee 1c e0 f8 64 c5 c7 47 d8     # c7c5 |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_d:
60 20 e0 e2 c7                 # c7ce |   mov A, ${_L_test_uop_jmp_cond_d_okay}
50 1c 1c 01 01                 # c7d3 |   cmp 0x1, 0x1
6c f8 34 d8                    # c7d8 |   jne ${fail}:rel + PC
68 20                          # c7dc |   jeq A
58 f8 2e d8                    # c7de |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_d_okay:
ec 20 e0 f8 e2 c7 2a d8        # c7e2 |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_3dd:
60 20 1c 7b                    # c7ea |   mov A, 0x7b
ec 20 1c f8 7b 1e d8           # c7ee |   jne A, 0x7b, ${fail}:rel + PC
e8 20 1c f8 7b 0b 00           # c7f5 |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
58 f8 10 d8                    # c7fc |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3dd_okay:
ec 20 1c f8 7b 0c d8           # c800 |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_jmp_3di:
60 20 1c 7b                    # c807 |   mov A, 0x7b
62 1c e0 64 41 01              # c80b |   mov [0x64], 0x141
e9 20 1c f8 64 fb d7           # c811 |   jeq A, [0x64], ${fail}:rel + PC
ed 20 1c f8 64 0b 00           # c818 |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
58 f8 ed d7                    # c81f |   jmp ${fail}:rel + PC
                               #      | test_uop_jmp_3di_okay:
ec 20 1c f8 7b e9 d7           # c823 |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 e2 d7     # c82a |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3id:
60 20 1c 7b                    # c833 |   mov A, 0x7b
62 1c e0 64 41 01              # c837 |   mov [0x64], 0x141
ea 1c 20 f8 64 cf d7           # c83d |   jeq [0x64], A, ${fail}:rel + PC
ee 1c 20 f8 64 0b 00           # c844 |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
58 f8 c1 d7                    # c84b |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3id_okay:
ec 20 1c f8 7b bd d7           # c84f |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 b6 d7     # c856 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3ii:
62 e0 1c c8 00 7b              # c85f |   mov [0xc8], 0x7b
62 1c e0 64 41 01              # c865 |   mov [0x64], 0x141
eb 1c e0 f8 64 c8 00 a1 d7     # c86b |   jeq [0x64], [0xc8], ${fail}:rel + PC
ef 1c e0 f8 64 c8 00 0d 00     # c874 |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
58 f8 8f d7                    # c87d |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3ii_okay:
ee e0 1c f8 c8 00 7b 8b d7     # c881 |   jne [0xc8], 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 82 d7     # c88a |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_mov_dd:
60 20 1c 7b                    # c893 |   mov A, 0x7b
ec 20 1c f8 7b 75 d7           # c897 |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_mov_di:
62 1c 1c 64 da                 # c89e |   mov [0x64], 0xda
61 20 1c 64                    # c8a3 |   mov A, [0x64]
ec 20 1c f8 da 65 d7           # c8a7 |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_mov_id:
62 1c 1c 64 ff                 # c8ae |   mov [0x64], 0xff
ee 1c 1c f8 64 ff 59 d7        # c8b3 |   jne [0x64], 0xff, ${fail}:rel + PC
                               #      | test_uop_mov_ii:
60 20 1c 14                    # c8bb |   mov A, 0x14
62 1c e0 78 fa fd              # c8bf |   mov [0x78], 0xfdfa
63 1c 3c 64 64                 # c8c5 |   mov [0x64], [A + 0x64]
ee 1c e0 f8 64 fa fd 42 d7     # c8ca |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                               #      | test_uop_bmov_dd:
64 20 e0 de af                 # c8d3 |   bmov A, 0xafde
ec 20 e0 f8 de 00 34 d7        # c8d8 |   jne A, 0xde, ${fail}:rel + PC
64 20 e0 fa 00                 # c8e0 |   bmov A, 0xfa
ec 20 e0 f8 fa 00 27 d7        # c8e5 |   jne A, 0xfa, ${fail}:rel + PC
                               #      | test_uop_bmov_di:
62 1c 1c 64 da                 # c8ed |   mov [0x64], 0xda
65 20 1c 64                    # c8f2 |   bmov A, [0x64]
ec 20 e0 f8 da 00 16 d7        # c8f6 |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_bmov_id:
62 1c e0 64 cd ab              # c8fe |   mov [0x64], 0xabcd
62 1c e0 66 34 12              # c904 |   mov [0x66], 0x1234
62 1c e0 68 78 56              # c90a |   mov [0x68], 0x5678
66 1c e0 66 df 00              # c910 |   bmov [0x66], 0xdf
ee 1c e0 f8 64 cd ab f6 d6     # c916 |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df 12 ed d6     # c91f |   jne [0x66], 0x12df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 e4 d6     # c928 |   jne [0x68], 0x5678, ${fail}:rel + PC
66 1c e0 67 b8 00              # c931 |   bmov [0x67], 0xb8
ee 1c e0 f8 64 cd ab d5 d6     # c937 |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df b8 cc d6     # c940 |   jne [0x66], 0xb8df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 c3 d6     # c949 |   jne [0x68], 0x5678, ${fail}:rel + PC
                               #      | test_uop_bmov_ii:
62 e0 e0 2c 01 df 00           # c952 |   mov [0x12c], 0xdf
62 e0 e0 2e 01 b8 00           # c959 |   mov [0x12e], 0xb8
62 e0 e0 c8 00 cd ab           # c960 |   mov [0xc8], 0xabcd
62 e0 e0 ca 00 34 12           # c967 |   mov [0xca], 0x1234
62 e0 e0 cc 00 78 56           # c96e |   mov [0xcc], 0x5678
67 e0 e0 ca 00 2c 01           # c975 |   bmov [0xca], [0x12c]
ee e0 e0 f8 c8 00 cd ab 90 d6  # c97c |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df 12 86 d6  # c986 |   jne [0xca], 0x12df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 7c d6  # c990 |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 72 d6  # c99a |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 68 d6  # c9a4 |   jne [0x12e], 0xb8, ${fail}:rel + PC
67 e0 e0 cb 00 2e 01           # c9ae |   bmov [0xcb], [0x12e]
ee e0 e0 f8 c8 00 cd ab 57 d6  # c9b5 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df b8 4d d6  # c9bf |   jne [0xca], 0xb8df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 43 d6  # c9c9 |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 39 d6  # c9d3 |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 2f d6  # c9dd |   jne [0x12e], 0xb8, ${fail}:rel + PC
                               #      | test_uop_halt:
                               #      | test_uop_getf:
50 1c 1c 7b 2d                 # c9e7 |   cmp 0x7b, 0x2d
4c 20                          # c9ec |   getf A
ec 20 1c f8 32 1e d6           # c9ee |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_setf:
cc 1c ff                       # c9f5 |   setf 0xff
4c 20                          # c9f8 |   getf A
ec 20 1c f8 3f 12 d6           # c9fa |   jne A, 0x3f, ${fail}:rel + PC
                               #      | test_uop_call_d:
60 a0 e0 00 10                 # ca01 |   mov SP, 0x1000
60 40 e0 21 ca                 # ca06 |   mov B, ${_L_test_uop_call_d_fn}
5c 40                          # ca0b |   call B
ec 40 e0 f8 21 ca ff d5        # ca0d |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
ec 20 e0 f8 fa 34 f7 d5        # ca15 |   jne A, 0x34fa, ${fail}:rel + PC
58 f8 0a 00                    # ca1d |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                               #      | _L_test_uop_call_d_fn:
60 20 e0 fa 34                 # ca21 |   mov A, 0x34fa
dc                             # ca26 |   ret
                               #      | _L_test_uop_call_d_okay:
                               #      | test_uop_call_i:
60 a0 e0 00 10                 # ca27 |   mov SP, 0x1000
60 40 1c 64                    # ca2c |   mov B, 0x64
62 40 e0 4b ca                 # ca30 |   mov [B], ${_L_test_uop_call_i_fn}
5e 40                          # ca35 |   call [B]
ee 40 e0 f8 4b ca d5 d5        # ca37 |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
ec 20 e0 f8 d4 aa cd d5        # ca3f |   jne A, 0xaad4, ${fail}:rel + PC
58 f8 0a 00                    # ca47 |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                               #      | _L_test_uop_call_i_fn:
60 20 e0 d4 aa                 # ca4b |   mov A, 0xaad4
dc                             # ca50 |   ret
                               #      | _L_test_uop_call_i_okay:
                               #      | test_uop_ret:
                               #      | test_uop_push_d:
60 a0 e0 00 10                 # ca51 |   mov SP, 0x1000
60 40 1c 64                    # ca56 |   mov B, 0x64
e0 40                          # ca5a |   push B
ec a0 e0 f8 fe 0f b0 d5        # ca5c |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 1c f8 fe 0f 64 a8 d5     # ca64 |   jne [0xffe], 0x64, ${fail}:rel + PC
e4 60                          # ca6d |   pop C
ec 60 1c f8 64 9d d5           # ca6f |   jne C, 0x64, ${fail}:rel + PC
                               #      | test_uop_push_i:
60 a0 e0 00 10                 # ca76 |   mov SP, 0x1000
60 40 1c 64                    # ca7b |   mov B, 0x64
62 40 e0 90 01                 # ca7f |   mov [B], 0x190
e2 40                          # ca84 |   push [B]
ec a0 e0 f8 fe 0f 86 d5        # ca86 |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 90 01 7e d5  # ca8e |   jne [0xffe], 0x190, ${fail}:rel + PC
e4 60                          # ca98 |   pop C
ec 60 e0 f8 90 01 72 d5        # ca9a |   jne C, 0x190, ${fail}:rel + PC
                               #      | test_uop_pop_d:
60 a0 e0 00 10                 # caa2 |   mov SP, 0x1000
e0 e0 da fa                    # caa7 |   push 0xfada
e4 20                          # caab |   pop A
ec 20 e0 f8 da fa 5f d5        # caad |   jne A, 0xfada, ${fail}:rel + PC
                               #      | test_uop_pop_i:
60 a0 e0 00 10                 # cab5 |   mov SP, 0x1000
e0 e0 da f2                    # caba |   push 0xf2da
e6 1c 64                       # cabe |   pop [0x64]
ee 1c e0 f8 64 da f2 4b d5     # cac1 |   jne [0x64], 0xf2da, ${fail}:rel + PC
                               #      | test_uop_mmap:
62 e0 e0 00 30 00 ff           # caca |   mov [0x3000], 0xff00
62 e0 e0 00 31 01 ff           # cad1 |   mov [0x3100], 0xff01
62 e0 e0 00 32 02 ff           # cad8 |   mov [0x3200], 0xff02
62 e0 e0 00 40 00 dd           # cadf |   mov [0x4000], 0xdd00
62 e0 e0 00 41 01 dd           # cae6 |   mov [0x4100], 0xdd01
62 e0 e0 00 42 02 dd           # caed |   mov [0x4200], 0xdd02
62 e0 e0 00 50 00 ee           # caf4 |   mov [0x5000], 0xee00
62 e0 e0 00 51 01 ee           # cafb |   mov [0x5100], 0xee01
62 e0 e0 00 52 02 ee           # cb02 |   mov [0x5200], 0xee02
60 20 00                       # cb09 |   mov A, 0
60 40 e0 00 41                 # cb0c |   mov B, 0x4100
54 e0 e0 1c 00 31 ff 32 01     # cb11 |   mmap 0x3100, 0x32ff, 0x1
ee e0 e0 f8 00 31 01 dd f2 d4  # cb1a |   jne [0x3100], 0xdd01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 dd e8 d4  # cb24 |   jne [0x3200], 0xdd02, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff de d4  # cb2e |   jne [0x3000], 0xff00, ${fail}:rel + PC
60 40 e0 00 51                 # cb38 |   mov B, 0x5100
54 e0 e0 1c 00 32 ff 32 02     # cb3d |   mmap 0x3200, 0x32ff, 0x2
ee e0 e0 f8 00 32 01 ee c6 d4  # cb46 |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff bc d4  # cb50 |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 dd b2 d4  # cb5a |   jne [0x3100], 0xdd01, ${fail}:rel + PC
d4 1c 01                       # cb64 |   umap 0x1
ee e0 e0 f8 00 31 01 ff a5 d4  # cb67 |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 01 ee 9b d4  # cb71 |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff 91 d4  # cb7b |   jne [0x3000], 0xff00, ${fail}:rel + PC
d4 1c 02                       # cb85 |   umap 0x2
ee e0 e0 f8 00 30 00 ff 84 d4  # cb88 |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 ff 7a d4  # cb92 |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 ff 70 d4  # cb9c |   jne [0x3200], 0xff02, ${fail}:rel + PC
                               #      | test_uop_umap:
                               #      | test_aux_reg:
60 20 1c 01                    # cba6 |   mov A, 0x1
60 40 1c 02                    # cbaa |   mov B, 0x2
60 60 1c 03                    # cbae |   mov C, 0x3
60 80 1c 04                    # cbb2 |   mov D, 0x4
60 fc 1c 05                    # cbb6 |   mov E, 0x5
60 fd 1c 06                    # cbba |   mov F, 0x6
60 fe 1c 07                    # cbbe |   mov G, 0x7
60 ff 1c 08                    # cbc2 |   mov H, 0x8
ec 20 1c f8 01 46 d4           # cbc6 |   jne A, 0x1, ${fail}:rel + PC
ec 40 1c f8 02 3f d4           # cbcd |   jne B, 0x2, ${fail}:rel + PC
ec 60 1c f8 03 38 d4           # cbd4 |   jne C, 0x3, ${fail}:rel + PC
ec 80 1c f8 04 31 d4           # cbdb |   jne D, 0x4, ${fail}:rel + PC
ec fc 1c f8 05 2a d4           # cbe2 |   jne E, 0x5, ${fail}:rel + PC
ec fd 1c f8 06 23 d4           # cbe9 |   jne F, 0x6, ${fail}:rel + PC
ec fe 1c f8 07 1c d4           # cbf0 |   jne G, 0x7, ${fail}:rel + PC
ec ff 1c f8 08 15 d4           # cbf7 |   jne H, 0x8, ${fail}:rel + PC
34 ff e0 00 ff                 # cbfe |   xor H, 0xff00
ec ff e0 f8 08 ff 09 d4        # cc03 |   jne H, 0xff08, ${fail}:rel + PC
60 20 ff                       # cc0b |   mov A, H
ec 20 e0 f8 08 ff fe d3        # cc0e |   jne A, 0xff08, ${fail}:rel + PC
60 fc fe                       # cc16 |   mov E, G
ec fc 1c f8 07 f3 d3           # cc19 |   jne E, 0x7, ${fail}:rel + PC
ec ff e0 f8 08 ff ec d3        # cc20 |   jne H, 0xff08, ${fail}:rel + PC
                               #      | test_call_ret:
60 a0 e0 00 10                 # cc28 |   mov SP, 0x1000
5c f8 77 00                    # cc2d |   call ${fn_test_target}:rel + PC
ec a0 e0 f8 00 10 db d3        # cc31 |   jne SP, 0x1000, ${fail}:rel + PC
60 20 1c 0a                    # cc39 |   mov A, 0xa
60 40 00                       # cc3d |   mov B, 0
60 60 00                       # cc40 |   mov C, 0
60 80 00                       # cc43 |   mov D, 0
5c f8 2d 00                    # cc46 |   call ${fn_recursive}:rel + PC
ec 20 00 f8 c2 d3              # cc4a |   jne A, 0, ${fail}:rel + PC
ec 40 e0 f8 3f cf bc d3        # cc50 |   jne B, 0xcf3f, ${fail}:rel + PC
ec 60 1c f8 2d b4 d3           # cc58 |   jne C, 0x2d, ${fail}:rel + PC
ec 80 e0 f8 97 45 ad d3        # cc5f |   jne D, 0x4597, ${fail}:rel + PC
ec a0 e0 f8 00 10 a5 d3        # cc67 |   jne SP, 0x1000, ${fail}:rel + PC
58 f8 42 00                    # cc6f |   jmp ${test_call_ret_end}:rel + PC
                               #      | fn_recursive:
04 20 1c 01                    # cc73 |   sub A, 0x1
5c f8 25 00                    # cc77 |   call ${fn_process_c}:rel + PC
e8 20 00 f8 1c 00              # cc7b |   jeq A, 0, ${fn_recursive_end}:rel + PC
5c f8 f2 ff                    # cc81 |   call ${fn_recursive}:rel + PC
00 80 60                       # cc85 |   add D, C
08 80 1c 03                    # cc88 |   mul D, 0x3
00 40 80                       # cc8c |   add B, D
e0 80                          # cc8f |   push D
08 40 1c 05                    # cc91 |   mul B, 0x5
e4 80                          # cc95 |   pop D
                               #      | fn_recursive_end:
dc                             # cc97 |   ret
58 f8 74 d3                    # cc98 |   jmp ${fail}:rel + PC
                               #      | fn_process_c:
00 60 20                       # cc9c |   add C, A
dc                             # cc9f |   ret
58 f8 6c d3                    # cca0 |   jmp ${fail}:rel + PC
                               #      | fn_test_target:
ec a0 e0 f8 fe 0f 68 d3        # cca4 |   jne SP, 0xffe, ${fail}:rel + PC
dc                             # ccac |   ret
58 f8 5f d3                    # ccad |   jmp ${fail}:rel + PC
                               #      | test_call_ret_end:
                               #      | test_mem_access:
62 e0 1c 00 01 ed              # ccb1 |   mov [0x100], 0xed
ee e0 e0 f8 00 01 aa 00 0e 00  # ccb7 |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
58 f8 4b d3                    # ccc1 |   jmp ${fail}:rel + PC
                               #      | test_mem_access_check_jmp:
62 e0 00 00 10                 # ccc5 |   mov [0x1000], 0
60 a0 e0 00 10                 # ccca |   mov SP, 0x1000
ee a0 00 f8 3d d3              # cccf |   jne [SP], 0, ${fail}:rel + PC
e0 00                          # ccd5 |   push 0
e0 00                          # ccd7 |   push 0
e0 00                          # ccd9 |   push 0
e4 20                          # ccdb |   pop A
e4 20                          # ccdd |   pop A
e4 20                          # ccdf |   pop A
ec a0 e0 f8 00 10 2b d3        # cce1 |   jne SP, 0x1000, ${fail}:rel + PC
ec 20 00 f8 23 d3              # cce9 |   jne A, 0, ${fail}:rel + PC
e0 e0 02 01                    # ccef |   push 0x102
ec a0 e0 f8 fe 0f 19 d3        # ccf3 |   jne SP, 0xffe, ${fail}:rel + PC
e0 e0 04 03                    # ccfb |   push 0x304
ec a0 e0 f8 fc 0f 0d d3        # ccff |   jne SP, 0xffc, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 02 01 05 d3  # cd07 |   jne [0xffe], 0x102, ${fail}:rel + PC
ee e0 e0 f8 fc 0f 04 03 fb d2  # cd11 |   jne [0xffc], 0x304, ${fail}:rel + PC
ee e0 e0 f8 fb 0f 00 04 f1 d2  # cd1b |   jne [0xffb], 0x400, ${fail}:rel + PC
ee e0 e0 f8 fd 0f 03 02 e7 d2  # cd25 |   jne [0xffd], 0x203, ${fail}:rel + PC
ee e0 1c f8 ff 0f 01 dd d2     # cd2f |   jne [0xfff], 0x1, ${fail}:rel + PC
e4 20                          # cd38 |   pop A
ec 20 e0 f8 04 03 d2 d2        # cd3a |   jne A, 0x304, ${fail}:rel + PC
ec a0 e0 f8 fe 0f ca d2        # cd42 |   jne SP, 0xffe, ${fail}:rel + PC
e4 20                          # cd4a |   pop A
ec 20 e0 f8 02 01 c0 d2        # cd4c |   jne A, 0x102, ${fail}:rel + PC
ec a0 e0 f8 00 10 b8 d2        # cd54 |   jne SP, 0x1000, ${fail}:rel + PC
                               #      | test_cmp:
cc 1c ff                       # cd5c |   setf 0xff
4c 20                          # cd5f |   getf A
ec 20 1c f8 3f ab d2           # cd61 |   jne A, 0x3f, ${fail}:rel + PC
cc e0 ab ab                    # cd68 |   setf 0xabab
4c 20                          # cd6c |   getf A
ec 20 1c f8 2b 9e d2           # cd6e |   jne A, 0x2b, ${fail}:rel + PC
50 1c 1c ab 2b                 # cd75 |   cmp 0xab, 0x2b
4c 20                          # cd7a |   getf A
ec 20 1c f8 32 90 d2           # cd7c |   jne A, 0x32, ${fail}:rel + PC
50 1c 1c 2b ab                 # cd83 |   cmp 0x2b, 0xab
4c 20                          # cd88 |   getf A
ec 20 1c f8 0e 82 d2           # cd8a |   jne A, 0xe, ${fail}:rel + PC
50 1c 1c ab ab                 # cd91 |   cmp 0xab, 0xab
4c 20                          # cd96 |   getf A
ec 20 1c f8 29 74 d2           # cd98 |   jne A, 0x29, ${fail}:rel + PC
d0 1c 1c ab 2b                 # cd9f |   icmp 0xab, 0x2b
4c 20                          # cda4 |   getf A
ec 20 1c f8 0e 66 d2           # cda6 |   jne A, 0xe, ${fail}:rel + PC
d0 1c 1c 2b ab                 # cdad |   icmp 0x2b, 0xab
4c 20                          # cdb2 |   getf A
ec 20 1c f8 32 58 d2           # cdb4 |   jne A, 0x32, ${fail}:rel + PC
d0 1c 1c ab ab                 # cdbb |   icmp 0xab, 0xab
4c 20                          # cdc0 |   getf A
ec 20 1c f8 29 4a d2           # cdc2 |   jne A, 0x29, ${fail}:rel + PC
                               #      | test_cmp_direct:
60 60 1c ab                    # cdc9 |   mov C, 0xab
60 80 1c 2b                    # cdcd |   mov D, 0x2b
50 60 80                       # cdd1 |   cmp C, D
4c 20                          # cdd4 |   getf A
ec 20 1c f8 32 36 d2           # cdd6 |   jne A, 0x32, ${fail}:rel + PC
50 80 60                       # cddd |   cmp D, C
4c 20                          # cde0 |   getf A
ec 20 1c f8 0e 2a d2           # cde2 |   jne A, 0xe, ${fail}:rel + PC
50 60 60                       # cde9 |   cmp C, C
4c 20                          # cdec |   getf A
ec 20 1c f8 29 1e d2           # cdee |   jne A, 0x29, ${fail}:rel + PC
d0 60 80                       # cdf5 |   icmp C, D
4c 20                          # cdf8 |   getf A
ec 20 1c f8 0e 12 d2           # cdfa |   jne A, 0xe, ${fail}:rel + PC
d0 80 60                       # ce01 |   icmp D, C
4c 20                          # ce04 |   getf A
ec 20 1c f8 32 06 d2           # ce06 |   jne A, 0x32, ${fail}:rel + PC
d0 60 60                       # ce0d |   icmp C, C
4c 20                          # ce10 |   getf A
ec 20 1c f8 29 fa d1           # ce12 |   jne A, 0x29, ${fail}:rel + PC
                               #      | end_of_test:
60 20 e0 ad de                 # ce19 |   mov A, 0xdead
60 40 e0 ef be                 # ce1e |   mov B, 0xbeef
88 60 20 40                    # ce23 |   mul C, A, B
58 f8 ea d1                    # ce27 |   jmp ${success}:rel + PC
dc                             # ce2b |   ret
                               #      | end_fn_self_test:
                               #      | 
                               #      | fn_led_loop:
ec 20 e0 f8 aa 00 e0 d1        # ce2c |   jne A, 0xaa, ${fail}:rel + PC
ec 40 e0 f8 bb 00 d8 d1        # ce34 |   jne B, 0xbb, ${fail}:rel + PC
ec 60 e0 f8 cc 00 d0 d1        # ce3c |   jne C, 0xcc, ${fail}:rel + PC
ec 80 1c f8 55 c8 d1           # ce44 |   jne D, 0x55, ${fail}:rel + PC
60 20 e0 fd 00                 # ce4b |   mov A, 0xfd
60 40 00                       # ce50 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # ce53 |   mmap 0xff00, 0xff, 0x2
62 e0 00 0a ff                 # ce5b |   mov [0xff0a], 0
                               #      | _B_fn_led_loop_1:
60 20 00                       # ce60 |   mov A, 0
                               #      | _B_fn_led_loop_2:
e8 20 1c f8 ff 10 00           # ce63 |   jeq A, 0xff, ${_E_fn_led_loop_2}:rel + PC
44 20                          # ce6a |   inc A
08 40 40                       # ce6c |   mul B, B
58 f8 f4 ff                    # ce6f |   jmp ${_B_fn_led_loop_2}:rel + PC
                               #      | _E_fn_led_loop_2:
46 e0 0a ff                    # ce73 |   inc [0xff0a]
58 f8 e9 ff                    # ce77 |   jmp ${_B_fn_led_loop_1}:rel + PC
                               #      | _E_fn_led_loop_1:
d8                             # ce7b |   halt
dc                             # ce7c |   ret
                               #      | end_fn_led_loop:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
