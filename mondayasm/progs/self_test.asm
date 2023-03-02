                               #      | SECTION_BEGIN_boot:
                               #      | _B_boot_1:
e8 c0 e0 f8 00 d0 1d 00        # d000 |   jeq PC, 0xd000, ${_E_boot_1}:rel + PC
60 20 e0 ff 00                 # d008 |   mov A, 0xff
60 40 00                       # d00d |   mov B, 0
54 e0 e0 1c 00 d0 ff fe 02     # d010 |   mmap 0xd000, 0xfeff, 0x2
58 e0 00 d0                    # d019 |   jmp 0xd000
                               #      | _E_boot_1:
54 e0 e0 1c 00 d0 ff fe 03     # d01d |   mmap 0xd000, 0xfeff, 0x3
d4 1c 02                       # d026 |   umap 0x2
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_self_test:
                               #      | .boot:
60 20 1c fa                    # d029 |   mov A, 0xfa
ec 20 e0 f8 fa 00 50 00        # d02d |   jne A, 0xfa, ${start_test}:rel + PC
                               #      | fail:
d8                             # d035 |   halt
58 f8 ff ff                    # d036 |   jmp ${fail}:rel + PC
                               #      | success:
ec 20 e0 f8 ad de fb ff        # d03a |   jne A, 0xdead, ${fail}:rel + PC
ec 40 e0 f8 ef be f3 ff        # d042 |   jne B, 0xbeef, ${fail}:rel + PC
ec 60 e0 f8 83 49 eb ff        # d04a |   jne C, 0x4983, ${fail}:rel + PC
ec ff e0 f8 14 a6 e3 ff        # d052 |   jne H, 0xa614, ${fail}:rel + PC
60 80 ff                       # d05a |   mov D, H
00 20 e0 ab ac                 # d05d |   add A, 0xacab
00 40 e0 cc 41                 # d062 |   add B, 0x41cc
08 20 80                       # d067 |   mul A, D
34 20 e0 4a f2                 # d06a |   xor A, 0xf24a
34 60 e0 4f 49                 # d06f |   xor C, 0x494f
34 ff e0 30 5a                 # d074 |   xor H, 0x5a30
60 80 ff                       # d079 |   mov D, H
d8                             # d07c |   halt
                               #      | start_test:
                               #      | alu_test:
80 40 e0 e0 30 d2 12 a0        # d07d |   add B, 0xd230, 0xa012
ec 40 e0 f8 42 72 b0 ff        # d085 |   jne B, 0x7242, ${fail}:rel + PC
84 40 e0 e0 30 d2 12 a0        # d08d |   sub B, 0xd230, 0xa012
ec 40 e0 f8 1e 32 a0 ff        # d095 |   jne B, 0x321e, ${fail}:rel + PC
88 40 e0 e0 30 d2 12 a0        # d09d |   mul B, 0xd230, 0xa012
ec 40 e0 f8 60 c7 90 ff        # d0a5 |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 6c 83 88 ff        # d0ad |   jne H, 0x836c, ${fail}:rel + PC
8c 40 e0 e0 30 d2 12 a0        # d0b5 |   imul B, 0xd230, 0xa012
ec 40 e0 f8 60 c7 78 ff        # d0bd |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 2a 11 70 ff        # d0c5 |   jne H, 0x112a, ${fail}:rel + PC
a0 40 e0 e0 30 d2 12 a0        # d0cd |   shr B, 0xd230, 0xa012
ec 40 e0 f8 8c 34 60 ff        # d0d5 |   jne B, 0x348c, ${fail}:rel + PC
a4 40 e0 e0 30 d2 12 a0        # d0dd |   ishr B, 0xd230, 0xa012
ec 40 e0 f8 8c f4 50 ff        # d0e5 |   jne B, 0xf48c, ${fail}:rel + PC
a8 40 e0 e0 30 d2 12 a0        # d0ed |   shl B, 0xd230, 0xa012
ec 40 e0 f8 c0 48 40 ff        # d0f5 |   jne B, 0x48c0, ${fail}:rel + PC
ac 40 e0 e0 30 d2 12 a0        # d0fd |   and B, 0xd230, 0xa012
ec 40 e0 f8 10 80 30 ff        # d105 |   jne B, 0x8010, ${fail}:rel + PC
b0 40 e0 e0 30 d2 12 a0        # d10d |   or B, 0xd230, 0xa012
ec 40 e0 f8 32 f2 20 ff        # d115 |   jne B, 0xf232, ${fail}:rel + PC
b4 40 e0 e0 30 d2 12 a0        # d11d |   xor B, 0xd230, 0xa012
ec 40 e0 f8 22 72 10 ff        # d125 |   jne B, 0x7222, ${fail}:rel + PC
b8 40 e0 30 d2                 # d12d |   neg B, 0xd230
ec 40 e0 f8 d0 2d 03 ff        # d132 |   jne B, 0x2dd0, ${fail}:rel + PC
bc 40 e0 30 d2                 # d13a |   not B, 0xd230
ec 40 e0 f8 cf 2d f6 fe        # d13f |   jne B, 0x2dcf, ${fail}:rel + PC
c0 40 e0 30 d2                 # d147 |   bool B, 0xd230
ec 40 1c f8 01 e9 fe           # d14c |   jne B, 0x1, ${fail}:rel + PC
c4 40 e0 30 d2                 # d153 |   inc B, 0xd230
ec 40 e0 f8 31 d2 dd fe        # d158 |   jne B, 0xd231, ${fail}:rel + PC
c8 40 e0 30 d2                 # d160 |   dec B, 0xd230
ec 40 e0 f8 2f d2 d0 fe        # d165 |   jne B, 0xd22f, ${fail}:rel + PC
80 40 e0 e0 ad 00 37 da        # d16d |   add B, 0xad, 0xda37
ec 40 e0 f8 e4 da c0 fe        # d175 |   jne B, 0xdae4, ${fail}:rel + PC
84 40 e0 e0 ad 00 37 da        # d17d |   sub B, 0xad, 0xda37
ec 40 e0 f8 76 26 b0 fe        # d185 |   jne B, 0x2676, ${fail}:rel + PC
88 40 e0 e0 ad 00 37 da        # d18d |   mul B, 0xad, 0xda37
ec 40 e0 f8 2b 77 a0 fe        # d195 |   jne B, 0x772b, ${fail}:rel + PC
ec ff e0 f8 93 00 98 fe        # d19d |   jne H, 0x93, ${fail}:rel + PC
8c 40 e0 e0 ad 00 37 da        # d1a5 |   imul B, 0xad, 0xda37
ec 40 e0 f8 2b 77 88 fe        # d1ad |   jne B, 0x772b, ${fail}:rel + PC
ec ff 1c f8 e6 80 fe           # d1b5 |   jne H, 0xe6, ${fail}:rel + PC
a0 40 e0 e0 ad 00 37 da        # d1bc |   shr B, 0xad, 0xda37
ec 40 1c f8 01 71 fe           # d1c4 |   jne B, 0x1, ${fail}:rel + PC
a4 40 e0 e0 ad 00 37 da        # d1cb |   ishr B, 0xad, 0xda37
ec 40 1c f8 01 62 fe           # d1d3 |   jne B, 0x1, ${fail}:rel + PC
a8 40 e0 e0 ad 00 37 da        # d1da |   shl B, 0xad, 0xda37
ec 40 e0 f8 80 56 53 fe        # d1e2 |   jne B, 0x5680, ${fail}:rel + PC
ac 40 e0 e0 ad 00 37 da        # d1ea |   and B, 0xad, 0xda37
ec 40 1c f8 25 43 fe           # d1f2 |   jne B, 0x25, ${fail}:rel + PC
b0 40 e0 e0 ad 00 37 da        # d1f9 |   or B, 0xad, 0xda37
ec 40 e0 f8 bf da 34 fe        # d201 |   jne B, 0xdabf, ${fail}:rel + PC
b4 40 e0 e0 ad 00 37 da        # d209 |   xor B, 0xad, 0xda37
ec 40 e0 f8 9a da 24 fe        # d211 |   jne B, 0xda9a, ${fail}:rel + PC
b8 40 e0 ad 00                 # d219 |   neg B, 0xad
ec 40 e0 f8 53 ff 17 fe        # d21e |   jne B, 0xff53, ${fail}:rel + PC
bc 40 e0 ad 00                 # d226 |   not B, 0xad
ec 40 e0 f8 52 ff 0a fe        # d22b |   jne B, 0xff52, ${fail}:rel + PC
c0 40 e0 ad 00                 # d233 |   bool B, 0xad
ec 40 1c f8 01 fd fd           # d238 |   jne B, 0x1, ${fail}:rel + PC
c4 40 e0 ad 00                 # d23f |   inc B, 0xad
ec 40 e0 f8 ae 00 f1 fd        # d244 |   jne B, 0xae, ${fail}:rel + PC
c8 40 e0 ad 00                 # d24c |   dec B, 0xad
ec 40 e0 f8 ac 00 e4 fd        # d251 |   jne B, 0xac, ${fail}:rel + PC
60 40 e0 ad f0                 # d259 |   mov B, 0xf0ad
00 40 e0 3f 2a                 # d25e |   add B, 0x2a3f
ec 40 e0 f8 ec 1a d2 fd        # d263 |   jne B, 0x1aec, ${fail}:rel + PC
60 40 e0 ad f0                 # d26b |   mov B, 0xf0ad
04 40 e0 3f 2a                 # d270 |   sub B, 0x2a3f
ec 40 e0 f8 6e c6 c0 fd        # d275 |   jne B, 0xc66e, ${fail}:rel + PC
60 40 e0 ad f0                 # d27d |   mov B, 0xf0ad
08 40 e0 3f 2a                 # d282 |   mul B, 0x2a3f
ec 40 e0 f8 93 9c ae fd        # d287 |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 b7 27 a6 fd        # d28f |   jne H, 0x27b7, ${fail}:rel + PC
60 40 e0 ad f0                 # d297 |   mov B, 0xf0ad
0c 40 e0 3f 2a                 # d29c |   imul B, 0x2a3f
ec 40 e0 f8 93 9c 94 fd        # d2a1 |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 78 fd 8c fd        # d2a9 |   jne H, 0xfd78, ${fail}:rel + PC
60 40 e0 ad f0                 # d2b1 |   mov B, 0xf0ad
20 40 e0 3f 2a                 # d2b6 |   shr B, 0x2a3f
ec 40 1c f8 01 7a fd           # d2bb |   jne B, 0x1, ${fail}:rel + PC
60 40 e0 ad f0                 # d2c2 |   mov B, 0xf0ad
24 40 e0 3f 2a                 # d2c7 |   ishr B, 0x2a3f
ec 40 1c f8 ff 69 fd           # d2cc |   jne B, 0xff, ${fail}:rel + PC
60 40 e0 ad f0                 # d2d3 |   mov B, 0xf0ad
28 40 e0 3f 2a                 # d2d8 |   shl B, 0x2a3f
ec 40 e0 f8 00 80 58 fd        # d2dd |   jne B, 0x8000, ${fail}:rel + PC
60 40 e0 ad f0                 # d2e5 |   mov B, 0xf0ad
2c 40 e0 3f 2a                 # d2ea |   and B, 0x2a3f
ec 40 e0 f8 2d 20 46 fd        # d2ef |   jne B, 0x202d, ${fail}:rel + PC
60 40 e0 ad f0                 # d2f7 |   mov B, 0xf0ad
30 40 e0 3f 2a                 # d2fc |   or B, 0x2a3f
ec 40 e0 f8 bf fa 34 fd        # d301 |   jne B, 0xfabf, ${fail}:rel + PC
60 40 e0 ad f0                 # d309 |   mov B, 0xf0ad
34 40 e0 3f 2a                 # d30e |   xor B, 0x2a3f
ec 40 e0 f8 92 da 22 fd        # d313 |   jne B, 0xda92, ${fail}:rel + PC
60 40 e0 ad f0                 # d31b |   mov B, 0xf0ad
38 40                          # d320 |   neg B
ec 40 e0 f8 53 0f 13 fd        # d322 |   jne B, 0xf53, ${fail}:rel + PC
60 40 e0 ad f0                 # d32a |   mov B, 0xf0ad
3c 40                          # d32f |   not B
ec 40 e0 f8 52 0f 04 fd        # d331 |   jne B, 0xf52, ${fail}:rel + PC
60 40 e0 ad f0                 # d339 |   mov B, 0xf0ad
40 40                          # d33e |   bool B
ec 40 1c f8 01 f5 fc           # d340 |   jne B, 0x1, ${fail}:rel + PC
60 40 e0 ad f0                 # d347 |   mov B, 0xf0ad
44 40                          # d34c |   inc B
ec 40 e0 f8 ae f0 e7 fc        # d34e |   jne B, 0xf0ae, ${fail}:rel + PC
60 40 e0 ad f0                 # d356 |   mov B, 0xf0ad
48 40                          # d35b |   dec B
ec 40 e0 f8 ac f0 d8 fc        # d35d |   jne B, 0xf0ac, ${fail}:rel + PC
60 40 00                       # d365 |   mov B, 0
00 40 e0 ad de                 # d368 |   add B, 0xdead
ec 40 e0 f8 ad de c8 fc        # d36d |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # d375 |   mov B, 0
04 40 e0 ad de                 # d378 |   sub B, 0xdead
ec 40 e0 f8 53 21 b8 fc        # d37d |   jne B, 0x2153, ${fail}:rel + PC
60 40 00                       # d385 |   mov B, 0
08 40 e0 ad de                 # d388 |   mul B, 0xdead
ec 40 00 f8 a8 fc              # d38d |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 a2 fc              # d393 |   jne H, 0, ${fail}:rel + PC
60 40 00                       # d399 |   mov B, 0
0c 40 e0 ad de                 # d39c |   imul B, 0xdead
ec 40 00 f8 94 fc              # d3a1 |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 8e fc              # d3a7 |   jne H, 0, ${fail}:rel + PC
60 40 00                       # d3ad |   mov B, 0
20 40 e0 ad de                 # d3b0 |   shr B, 0xdead
ec 40 00 f8 80 fc              # d3b5 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3bb |   mov B, 0
24 40 e0 ad de                 # d3be |   ishr B, 0xdead
ec 40 00 f8 72 fc              # d3c3 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3c9 |   mov B, 0
28 40 e0 ad de                 # d3cc |   shl B, 0xdead
ec 40 00 f8 64 fc              # d3d1 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3d7 |   mov B, 0
2c 40 e0 ad de                 # d3da |   and B, 0xdead
ec 40 00 f8 56 fc              # d3df |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3e5 |   mov B, 0
30 40 e0 ad de                 # d3e8 |   or B, 0xdead
ec 40 e0 f8 ad de 48 fc        # d3ed |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # d3f5 |   mov B, 0
34 40 e0 ad de                 # d3f8 |   xor B, 0xdead
ec 40 e0 f8 ad de 38 fc        # d3fd |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # d405 |   mov B, 0
38 40                          # d408 |   neg B
ec 40 00 f8 2b fc              # d40a |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d410 |   mov B, 0
3c 40                          # d413 |   not B
ec 40 1c f8 ff 20 fc           # d415 |   jne B, 0xff, ${fail}:rel + PC
60 40 00                       # d41c |   mov B, 0
40 40                          # d41f |   bool B
ec 40 00 f8 14 fc              # d421 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d427 |   mov B, 0
44 40                          # d42a |   inc B
ec 40 1c f8 01 09 fc           # d42c |   jne B, 0x1, ${fail}:rel + PC
60 40 00                       # d433 |   mov B, 0
48 40                          # d436 |   dec B
ec 40 1c f8 ff fd fb           # d438 |   jne B, 0xff, ${fail}:rel + PC
                               #      | alu_test_direct_reg:
60 60 e0 30 d2                 # d43f |   mov C, 0xd230
60 80 e0 12 a0                 # d444 |   mov D, 0xa012
80 40 60 80                    # d449 |   add B, C, D
ec 40 e0 f8 42 72 e8 fb        # d44d |   jne B, 0x7242, ${fail}:rel + PC
60 60 e0 30 d2                 # d455 |   mov C, 0xd230
60 80 e0 12 a0                 # d45a |   mov D, 0xa012
84 40 60 80                    # d45f |   sub B, C, D
ec 40 e0 f8 1e 32 d2 fb        # d463 |   jne B, 0x321e, ${fail}:rel + PC
60 60 e0 30 d2                 # d46b |   mov C, 0xd230
60 80 e0 12 a0                 # d470 |   mov D, 0xa012
88 40 60 80                    # d475 |   mul B, C, D
ec 40 e0 f8 60 c7 bc fb        # d479 |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 6c 83 b4 fb        # d481 |   jne H, 0x836c, ${fail}:rel + PC
60 60 e0 30 d2                 # d489 |   mov C, 0xd230
60 80 e0 12 a0                 # d48e |   mov D, 0xa012
8c 40 60 80                    # d493 |   imul B, C, D
ec 40 e0 f8 60 c7 9e fb        # d497 |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 2a 11 96 fb        # d49f |   jne H, 0x112a, ${fail}:rel + PC
60 60 e0 30 d2                 # d4a7 |   mov C, 0xd230
60 80 e0 12 a0                 # d4ac |   mov D, 0xa012
a0 40 60 80                    # d4b1 |   shr B, C, D
ec 40 e0 f8 8c 34 80 fb        # d4b5 |   jne B, 0x348c, ${fail}:rel + PC
60 60 e0 30 d2                 # d4bd |   mov C, 0xd230
60 80 e0 12 a0                 # d4c2 |   mov D, 0xa012
a4 40 60 80                    # d4c7 |   ishr B, C, D
ec 40 e0 f8 8c f4 6a fb        # d4cb |   jne B, 0xf48c, ${fail}:rel + PC
60 60 e0 30 d2                 # d4d3 |   mov C, 0xd230
60 80 e0 12 a0                 # d4d8 |   mov D, 0xa012
a8 40 60 80                    # d4dd |   shl B, C, D
ec 40 e0 f8 c0 48 54 fb        # d4e1 |   jne B, 0x48c0, ${fail}:rel + PC
60 60 e0 30 d2                 # d4e9 |   mov C, 0xd230
60 80 e0 12 a0                 # d4ee |   mov D, 0xa012
ac 40 60 80                    # d4f3 |   and B, C, D
ec 40 e0 f8 10 80 3e fb        # d4f7 |   jne B, 0x8010, ${fail}:rel + PC
60 60 e0 30 d2                 # d4ff |   mov C, 0xd230
60 80 e0 12 a0                 # d504 |   mov D, 0xa012
b0 40 60 80                    # d509 |   or B, C, D
ec 40 e0 f8 32 f2 28 fb        # d50d |   jne B, 0xf232, ${fail}:rel + PC
60 60 e0 30 d2                 # d515 |   mov C, 0xd230
60 80 e0 12 a0                 # d51a |   mov D, 0xa012
b4 40 60 80                    # d51f |   xor B, C, D
ec 40 e0 f8 22 72 12 fb        # d523 |   jne B, 0x7222, ${fail}:rel + PC
60 60 e0 30 d2                 # d52b |   mov C, 0xd230
b8 40 60                       # d530 |   neg B, C
ec 40 e0 f8 d0 2d 02 fb        # d533 |   jne B, 0x2dd0, ${fail}:rel + PC
60 60 e0 30 d2                 # d53b |   mov C, 0xd230
bc 40 60                       # d540 |   not B, C
ec 40 e0 f8 cf 2d f2 fa        # d543 |   jne B, 0x2dcf, ${fail}:rel + PC
60 60 e0 30 d2                 # d54b |   mov C, 0xd230
c0 40 60                       # d550 |   bool B, C
ec 40 1c f8 01 e2 fa           # d553 |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 30 d2                 # d55a |   mov C, 0xd230
c4 40 60                       # d55f |   inc B, C
ec 40 e0 f8 31 d2 d3 fa        # d562 |   jne B, 0xd231, ${fail}:rel + PC
60 60 e0 30 d2                 # d56a |   mov C, 0xd230
c8 40 60                       # d56f |   dec B, C
ec 40 e0 f8 2f d2 c3 fa        # d572 |   jne B, 0xd22f, ${fail}:rel + PC
60 60 e0 ad 00                 # d57a |   mov C, 0xad
60 80 e0 37 da                 # d57f |   mov D, 0xda37
80 40 60 80                    # d584 |   add B, C, D
ec 40 e0 f8 e4 da ad fa        # d588 |   jne B, 0xdae4, ${fail}:rel + PC
60 60 e0 ad 00                 # d590 |   mov C, 0xad
60 80 e0 37 da                 # d595 |   mov D, 0xda37
84 40 60 80                    # d59a |   sub B, C, D
ec 40 e0 f8 76 26 97 fa        # d59e |   jne B, 0x2676, ${fail}:rel + PC
60 60 e0 ad 00                 # d5a6 |   mov C, 0xad
60 80 e0 37 da                 # d5ab |   mov D, 0xda37
88 40 60 80                    # d5b0 |   mul B, C, D
ec 40 e0 f8 2b 77 81 fa        # d5b4 |   jne B, 0x772b, ${fail}:rel + PC
ec ff e0 f8 93 00 79 fa        # d5bc |   jne H, 0x93, ${fail}:rel + PC
60 60 e0 ad 00                 # d5c4 |   mov C, 0xad
60 80 e0 37 da                 # d5c9 |   mov D, 0xda37
8c 40 60 80                    # d5ce |   imul B, C, D
ec 40 e0 f8 2b 77 63 fa        # d5d2 |   jne B, 0x772b, ${fail}:rel + PC
ec ff 1c f8 e6 5b fa           # d5da |   jne H, 0xe6, ${fail}:rel + PC
60 60 e0 ad 00                 # d5e1 |   mov C, 0xad
60 80 e0 37 da                 # d5e6 |   mov D, 0xda37
a0 40 60 80                    # d5eb |   shr B, C, D
ec 40 1c f8 01 46 fa           # d5ef |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad 00                 # d5f6 |   mov C, 0xad
60 80 e0 37 da                 # d5fb |   mov D, 0xda37
a4 40 60 80                    # d600 |   ishr B, C, D
ec 40 1c f8 01 31 fa           # d604 |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad 00                 # d60b |   mov C, 0xad
60 80 e0 37 da                 # d610 |   mov D, 0xda37
a8 40 60 80                    # d615 |   shl B, C, D
ec 40 e0 f8 80 56 1c fa        # d619 |   jne B, 0x5680, ${fail}:rel + PC
60 60 e0 ad 00                 # d621 |   mov C, 0xad
60 80 e0 37 da                 # d626 |   mov D, 0xda37
ac 40 60 80                    # d62b |   and B, C, D
ec 40 1c f8 25 06 fa           # d62f |   jne B, 0x25, ${fail}:rel + PC
60 60 e0 ad 00                 # d636 |   mov C, 0xad
60 80 e0 37 da                 # d63b |   mov D, 0xda37
b0 40 60 80                    # d640 |   or B, C, D
ec 40 e0 f8 bf da f1 f9        # d644 |   jne B, 0xdabf, ${fail}:rel + PC
60 60 e0 ad 00                 # d64c |   mov C, 0xad
60 80 e0 37 da                 # d651 |   mov D, 0xda37
b4 40 60 80                    # d656 |   xor B, C, D
ec 40 e0 f8 9a da db f9        # d65a |   jne B, 0xda9a, ${fail}:rel + PC
60 60 e0 ad 00                 # d662 |   mov C, 0xad
b8 40 60                       # d667 |   neg B, C
ec 40 e0 f8 53 ff cb f9        # d66a |   jne B, 0xff53, ${fail}:rel + PC
60 60 e0 ad 00                 # d672 |   mov C, 0xad
bc 40 60                       # d677 |   not B, C
ec 40 e0 f8 52 ff bb f9        # d67a |   jne B, 0xff52, ${fail}:rel + PC
60 60 e0 ad 00                 # d682 |   mov C, 0xad
c0 40 60                       # d687 |   bool B, C
ec 40 1c f8 01 ab f9           # d68a |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad 00                 # d691 |   mov C, 0xad
c4 40 60                       # d696 |   inc B, C
ec 40 e0 f8 ae 00 9c f9        # d699 |   jne B, 0xae, ${fail}:rel + PC
60 60 e0 ad 00                 # d6a1 |   mov C, 0xad
c8 40 60                       # d6a6 |   dec B, C
ec 40 e0 f8 ac 00 8c f9        # d6a9 |   jne B, 0xac, ${fail}:rel + PC
60 60 e0 ad f0                 # d6b1 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d6b6 |   mov D, 0x2a3f
60 40 60                       # d6bb |   mov B, C
00 40 80                       # d6be |   add B, D
ec 40 e0 f8 ec 1a 74 f9        # d6c1 |   jne B, 0x1aec, ${fail}:rel + PC
60 60 e0 ad f0                 # d6c9 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d6ce |   mov D, 0x2a3f
60 40 60                       # d6d3 |   mov B, C
04 40 80                       # d6d6 |   sub B, D
ec 40 e0 f8 6e c6 5c f9        # d6d9 |   jne B, 0xc66e, ${fail}:rel + PC
60 60 e0 ad f0                 # d6e1 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d6e6 |   mov D, 0x2a3f
60 40 60                       # d6eb |   mov B, C
08 40 80                       # d6ee |   mul B, D
ec 40 e0 f8 93 9c 44 f9        # d6f1 |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 b7 27 3c f9        # d6f9 |   jne H, 0x27b7, ${fail}:rel + PC
60 60 e0 ad f0                 # d701 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d706 |   mov D, 0x2a3f
60 40 60                       # d70b |   mov B, C
0c 40 80                       # d70e |   imul B, D
ec 40 e0 f8 93 9c 24 f9        # d711 |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 78 fd 1c f9        # d719 |   jne H, 0xfd78, ${fail}:rel + PC
60 60 e0 ad f0                 # d721 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d726 |   mov D, 0x2a3f
60 40 60                       # d72b |   mov B, C
20 40 80                       # d72e |   shr B, D
ec 40 1c f8 01 04 f9           # d731 |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad f0                 # d738 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d73d |   mov D, 0x2a3f
60 40 60                       # d742 |   mov B, C
24 40 80                       # d745 |   ishr B, D
ec 40 1c f8 ff ed f8           # d748 |   jne B, 0xff, ${fail}:rel + PC
60 60 e0 ad f0                 # d74f |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d754 |   mov D, 0x2a3f
60 40 60                       # d759 |   mov B, C
28 40 80                       # d75c |   shl B, D
ec 40 e0 f8 00 80 d6 f8        # d75f |   jne B, 0x8000, ${fail}:rel + PC
60 60 e0 ad f0                 # d767 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d76c |   mov D, 0x2a3f
60 40 60                       # d771 |   mov B, C
2c 40 80                       # d774 |   and B, D
ec 40 e0 f8 2d 20 be f8        # d777 |   jne B, 0x202d, ${fail}:rel + PC
60 60 e0 ad f0                 # d77f |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d784 |   mov D, 0x2a3f
60 40 60                       # d789 |   mov B, C
30 40 80                       # d78c |   or B, D
ec 40 e0 f8 bf fa a6 f8        # d78f |   jne B, 0xfabf, ${fail}:rel + PC
60 60 e0 ad f0                 # d797 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d79c |   mov D, 0x2a3f
60 40 60                       # d7a1 |   mov B, C
34 40 80                       # d7a4 |   xor B, D
ec 40 e0 f8 92 da 8e f8        # d7a7 |   jne B, 0xda92, ${fail}:rel + PC
60 60 e0 ad f0                 # d7af |   mov C, 0xf0ad
60 40 60                       # d7b4 |   mov B, C
38 40                          # d7b7 |   neg B
ec 40 e0 f8 53 0f 7c f8        # d7b9 |   jne B, 0xf53, ${fail}:rel + PC
60 60 e0 ad f0                 # d7c1 |   mov C, 0xf0ad
60 40 60                       # d7c6 |   mov B, C
3c 40                          # d7c9 |   not B
ec 40 e0 f8 52 0f 6a f8        # d7cb |   jne B, 0xf52, ${fail}:rel + PC
60 60 e0 ad f0                 # d7d3 |   mov C, 0xf0ad
60 40 60                       # d7d8 |   mov B, C
40 40                          # d7db |   bool B
ec 40 1c f8 01 58 f8           # d7dd |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad f0                 # d7e4 |   mov C, 0xf0ad
60 40 60                       # d7e9 |   mov B, C
44 40                          # d7ec |   inc B
ec 40 e0 f8 ae f0 47 f8        # d7ee |   jne B, 0xf0ae, ${fail}:rel + PC
60 60 e0 ad f0                 # d7f6 |   mov C, 0xf0ad
60 40 60                       # d7fb |   mov B, C
48 40                          # d7fe |   dec B
ec 40 e0 f8 ac f0 35 f8        # d800 |   jne B, 0xf0ac, ${fail}:rel + PC
60 60 00                       # d808 |   mov C, 0
60 80 e0 ad de                 # d80b |   mov D, 0xdead
60 40 60                       # d810 |   mov B, C
00 40 80                       # d813 |   add B, D
ec 40 e0 f8 ad de 1f f8        # d816 |   jne B, 0xdead, ${fail}:rel + PC
60 60 00                       # d81e |   mov C, 0
60 80 e0 ad de                 # d821 |   mov D, 0xdead
60 40 60                       # d826 |   mov B, C
04 40 80                       # d829 |   sub B, D
ec 40 e0 f8 53 21 09 f8        # d82c |   jne B, 0x2153, ${fail}:rel + PC
60 60 00                       # d834 |   mov C, 0
60 80 e0 ad de                 # d837 |   mov D, 0xdead
60 40 60                       # d83c |   mov B, C
08 40 80                       # d83f |   mul B, D
ec 40 00 f8 f3 f7              # d842 |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 ed f7              # d848 |   jne H, 0, ${fail}:rel + PC
60 60 00                       # d84e |   mov C, 0
60 80 e0 ad de                 # d851 |   mov D, 0xdead
60 40 60                       # d856 |   mov B, C
0c 40 80                       # d859 |   imul B, D
ec 40 00 f8 d9 f7              # d85c |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 d3 f7              # d862 |   jne H, 0, ${fail}:rel + PC
60 60 00                       # d868 |   mov C, 0
60 80 e0 ad de                 # d86b |   mov D, 0xdead
60 40 60                       # d870 |   mov B, C
20 40 80                       # d873 |   shr B, D
ec 40 00 f8 bf f7              # d876 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # d87c |   mov C, 0
60 80 e0 ad de                 # d87f |   mov D, 0xdead
60 40 60                       # d884 |   mov B, C
24 40 80                       # d887 |   ishr B, D
ec 40 00 f8 ab f7              # d88a |   jne B, 0, ${fail}:rel + PC
60 60 00                       # d890 |   mov C, 0
60 80 e0 ad de                 # d893 |   mov D, 0xdead
60 40 60                       # d898 |   mov B, C
28 40 80                       # d89b |   shl B, D
ec 40 00 f8 97 f7              # d89e |   jne B, 0, ${fail}:rel + PC
60 60 00                       # d8a4 |   mov C, 0
60 80 e0 ad de                 # d8a7 |   mov D, 0xdead
60 40 60                       # d8ac |   mov B, C
2c 40 80                       # d8af |   and B, D
ec 40 00 f8 83 f7              # d8b2 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # d8b8 |   mov C, 0
60 80 e0 ad de                 # d8bb |   mov D, 0xdead
60 40 60                       # d8c0 |   mov B, C
30 40 80                       # d8c3 |   or B, D
ec 40 e0 f8 ad de 6f f7        # d8c6 |   jne B, 0xdead, ${fail}:rel + PC
60 60 00                       # d8ce |   mov C, 0
60 80 e0 ad de                 # d8d1 |   mov D, 0xdead
60 40 60                       # d8d6 |   mov B, C
34 40 80                       # d8d9 |   xor B, D
ec 40 e0 f8 ad de 59 f7        # d8dc |   jne B, 0xdead, ${fail}:rel + PC
60 60 00                       # d8e4 |   mov C, 0
60 40 60                       # d8e7 |   mov B, C
38 40                          # d8ea |   neg B
ec 40 00 f8 49 f7              # d8ec |   jne B, 0, ${fail}:rel + PC
60 60 00                       # d8f2 |   mov C, 0
60 40 60                       # d8f5 |   mov B, C
3c 40                          # d8f8 |   not B
ec 40 1c f8 ff 3b f7           # d8fa |   jne B, 0xff, ${fail}:rel + PC
60 60 00                       # d901 |   mov C, 0
60 40 60                       # d904 |   mov B, C
40 40                          # d907 |   bool B
ec 40 00 f8 2c f7              # d909 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # d90f |   mov C, 0
60 40 60                       # d912 |   mov B, C
44 40                          # d915 |   inc B
ec 40 1c f8 01 1e f7           # d917 |   jne B, 0x1, ${fail}:rel + PC
60 60 00                       # d91e |   mov C, 0
60 40 60                       # d921 |   mov B, C
48 40                          # d924 |   dec B
ec 40 1c f8 ff 0f f7           # d926 |   jne B, 0xff, ${fail}:rel + PC
                               #      | jmp_test:
e8 1c 1c f8 ab 2b 08 f7        # d92d |   jeq 0xab, 0x2b, ${fail}:rel + PC
ec 1c 1c f8 ab 2b 0c 00        # d935 |   jne 0xab, 0x2b, ${_L_test_jmp_1}:rel + PC
58 f8 f8 f6                    # d93d |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_1:
f0 1c 1c f8 ab 2b f4 f6        # d941 |   jlt 0xab, 0x2b, ${fail}:rel + PC
f4 1c 1c f8 ab 2b ec f6        # d949 |   jle 0xab, 0x2b, ${fail}:rel + PC
f8 1c 1c f8 ab 2b 0c 00        # d951 |   jgt 0xab, 0x2b, ${_L_test_jmp_2}:rel + PC
58 f8 dc f6                    # d959 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_2:
fc 1c 1c f8 ab 2b 0c 00        # d95d |   jge 0xab, 0x2b, ${_L_test_jmp_3}:rel + PC
58 f8 d0 f6                    # d965 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_3:
50 1c 1c ab 2b                 # d969 |   cmp 0xab, 0x2b
68 f8 c7 f6                    # d96e |   jeq ${fail}:rel + PC
6c f8 08 00                    # d972 |   jne ${_L_test_jmp_4}:rel + PC
58 f8 bf f6                    # d976 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_4:
70 f8 bb f6                    # d97a |   jlt ${fail}:rel + PC
74 f8 b7 f6                    # d97e |   jle ${fail}:rel + PC
78 f8 08 00                    # d982 |   jgt ${_L_test_jmp_5}:rel + PC
58 f8 af f6                    # d986 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_5:
7c f8 08 00                    # d98a |   jge ${_L_test_jmp_6}:rel + PC
58 f8 a7 f6                    # d98e |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_6:
d0 1c 1c ab 2b                 # d992 |   icmp 0xab, 0x2b
68 f8 9e f6                    # d997 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d99b |   jne ${_L_test_jmp_7}:rel + PC
58 f8 96 f6                    # d99f |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_7:
70 f8 08 00                    # d9a3 |   jlt ${_L_test_jmp_8}:rel + PC
58 f8 8e f6                    # d9a7 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_8:
74 f8 08 00                    # d9ab |   jle ${_L_test_jmp_9}:rel + PC
58 f8 86 f6                    # d9af |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_9:
78 f8 82 f6                    # d9b3 |   jgt ${fail}:rel + PC
7c f8 7e f6                    # d9b7 |   jge ${fail}:rel + PC
e8 1c 1c f8 2b ab 7a f6        # d9bb |   jeq 0x2b, 0xab, ${fail}:rel + PC
ec 1c 1c f8 2b ab 0c 00        # d9c3 |   jne 0x2b, 0xab, ${_L_test_jmp_10}:rel + PC
58 f8 6a f6                    # d9cb |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_10:
f0 1c 1c f8 2b ab 0c 00        # d9cf |   jlt 0x2b, 0xab, ${_L_test_jmp_11}:rel + PC
58 f8 5e f6                    # d9d7 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_11:
f4 1c 1c f8 2b ab 0c 00        # d9db |   jle 0x2b, 0xab, ${_L_test_jmp_12}:rel + PC
58 f8 52 f6                    # d9e3 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_12:
f8 1c 1c f8 2b ab 4e f6        # d9e7 |   jgt 0x2b, 0xab, ${fail}:rel + PC
fc 1c 1c f8 2b ab 46 f6        # d9ef |   jge 0x2b, 0xab, ${fail}:rel + PC
50 1c 1c 2b ab                 # d9f7 |   cmp 0x2b, 0xab
68 f8 39 f6                    # d9fc |   jeq ${fail}:rel + PC
6c f8 08 00                    # da00 |   jne ${_L_test_jmp_13}:rel + PC
58 f8 31 f6                    # da04 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_13:
70 f8 08 00                    # da08 |   jlt ${_L_test_jmp_14}:rel + PC
58 f8 29 f6                    # da0c |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_14:
74 f8 08 00                    # da10 |   jle ${_L_test_jmp_15}:rel + PC
58 f8 21 f6                    # da14 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_15:
78 f8 1d f6                    # da18 |   jgt ${fail}:rel + PC
7c f8 19 f6                    # da1c |   jge ${fail}:rel + PC
d0 1c 1c 2b ab                 # da20 |   icmp 0x2b, 0xab
68 f8 10 f6                    # da25 |   jeq ${fail}:rel + PC
6c f8 08 00                    # da29 |   jne ${_L_test_jmp_16}:rel + PC
58 f8 08 f6                    # da2d |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_16:
70 f8 04 f6                    # da31 |   jlt ${fail}:rel + PC
74 f8 00 f6                    # da35 |   jle ${fail}:rel + PC
78 f8 08 00                    # da39 |   jgt ${_L_test_jmp_17}:rel + PC
58 f8 f8 f5                    # da3d |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_17:
7c f8 08 00                    # da41 |   jge ${_L_test_jmp_18}:rel + PC
58 f8 f0 f5                    # da45 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_18:
e8 1c 1c f8 ab ab 0c 00        # da49 |   jeq 0xab, 0xab, ${_L_test_jmp_19}:rel + PC
58 f8 e4 f5                    # da51 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_19:
ec 1c 1c f8 ab ab e0 f5        # da55 |   jne 0xab, 0xab, ${fail}:rel + PC
f0 1c 1c f8 ab ab d8 f5        # da5d |   jlt 0xab, 0xab, ${fail}:rel + PC
f4 1c 1c f8 ab ab 0c 00        # da65 |   jle 0xab, 0xab, ${_L_test_jmp_20}:rel + PC
58 f8 c8 f5                    # da6d |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_20:
f8 1c 1c f8 ab ab c4 f5        # da71 |   jgt 0xab, 0xab, ${fail}:rel + PC
fc 1c 1c f8 ab ab 0c 00        # da79 |   jge 0xab, 0xab, ${_L_test_jmp_21}:rel + PC
58 f8 b4 f5                    # da81 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_21:
50 1c 1c ab ab                 # da85 |   cmp 0xab, 0xab
68 f8 08 00                    # da8a |   jeq ${_L_test_jmp_22}:rel + PC
58 f8 a7 f5                    # da8e |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_22:
6c f8 a3 f5                    # da92 |   jne ${fail}:rel + PC
70 f8 9f f5                    # da96 |   jlt ${fail}:rel + PC
74 f8 08 00                    # da9a |   jle ${_L_test_jmp_23}:rel + PC
58 f8 97 f5                    # da9e |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_23:
78 f8 93 f5                    # daa2 |   jgt ${fail}:rel + PC
7c f8 08 00                    # daa6 |   jge ${_L_test_jmp_24}:rel + PC
58 f8 8b f5                    # daaa |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_24:
d0 1c 1c ab ab                 # daae |   icmp 0xab, 0xab
68 f8 08 00                    # dab3 |   jeq ${_L_test_jmp_25}:rel + PC
58 f8 7e f5                    # dab7 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_25:
6c f8 7a f5                    # dabb |   jne ${fail}:rel + PC
70 f8 76 f5                    # dabf |   jlt ${fail}:rel + PC
74 f8 08 00                    # dac3 |   jle ${_L_test_jmp_26}:rel + PC
58 f8 6e f5                    # dac7 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_26:
78 f8 6a f5                    # dacb |   jgt ${fail}:rel + PC
7c f8 08 00                    # dacf |   jge ${_L_test_jmp_27}:rel + PC
58 f8 62 f5                    # dad3 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_27:
                               #      | test_uop_get_arg:
60 a0 e0 00 70                 # dad7 |   mov SP, 0x7000
60 20 e0 aa 00                 # dadc |   mov A, 0xaa
60 40 e0 bb 00                 # dae1 |   mov B, 0xbb
60 fe e0 55 01                 # dae6 |   mov G, 0x155
b6 e0 1c fe 39 30 85           # daeb |   xor [0x3039], -123, G
ee e0 e0 f8 39 30 d0 fe 43 f5  # daf2 |   jne [0x3039], 0xfed0, ${fail}:rel + PC
ae 3e fe 21 f6                 # dafc |   and [A*4 + -10], G, A*2
ee e0 e0 f8 9e 02 54 01 34 f5  # db01 |   jne [0x29e], 0x154, ${fail}:rel + PC
86 21 e4 3e de fa f6           # db0b |   sub [A*2], 0xfade + A, A*4 + -10
ee e0 e0 f8 54 01 ea f8 23 f5  # db12 |   jne [0x154], 0xf8ea, ${fail}:rel + PC
a6 e0 20 21 39 30              # db1c |   ishr [0x3039], A, A*2
ee e0 1c f8 39 30 0a 13 f5     # db22 |   jne [0x3039], 0xa, ${fail}:rel + PC
aa fe 2a 3e f6                 # db2b |   shl [G], A*4 + B, A*4 + -10
ee e0 e0 f8 55 01 00 c0 05 f5  # db30 |   jne [0x155], 0xc000, ${fail}:rel + PC
b2 fe 1c fe 85                 # db3a |   or [G], -123, G
ee e0 1c f8 55 01 d5 f6 f4     # db3f |   jne [0x155], 0xd5, ${fail}:rel + PC
8a 2a 1c 20 85                 # db48 |   mul [A*4 + B], -123, A
ee e0 e0 f8 63 03 52 ae e8 f4  # db4d |   jne [0x363], 0xae52, ${fail}:rel + PC
a6 e0 e0 2a 39 30 39 30        # db57 |   ishr [0x3039], 0x3039, A*4 + B
ee e0 e0 f8 39 30 07 06 d6 f4  # db5f |   jne [0x3039], 0x607, ${fail}:rel + PC
a2 21 e4 21 de fa              # db69 |   shr [A*2], 0xfade + A, A*2
ee e0 e0 f8 54 01 b8 0f c6 f4  # db6f |   jne [0x154], 0xfb8, ${fail}:rel + PC
82 21 fe fe                    # db79 |   add [A*2], G, G
ee e0 e0 f8 54 01 aa 02 b8 f4  # db7d |   jne [0x154], 0x2aa, ${fail}:rel + PC
a6 fe e4 20 de fa              # db87 |   ishr [G], 0xfade + A, A
ee e0 1c f8 55 01 fe a8 f4     # db8d |   jne [0x155], 0xfe, ${fail}:rel + PC
82 e0 e4 2a 39 30 de fa        # db96 |   add [0x3039], 0xfade + A, A*4 + B
ee e0 e0 f8 39 30 eb fe 97 f4  # db9e |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
a6 20 20 20                    # dba8 |   ishr [A], A, A
ee e0 00 f8 aa 00 89 f4        # dbac |   jne [0xaa], 0, ${fail}:rel + PC
82 fe 2a 20                    # dbb4 |   add [G], A*4 + B, A
ee e0 e0 f8 55 01 0d 04 7d f4  # dbb8 |   jne [0x155], 0x40d, ${fail}:rel + PC
b6 fe fe fe                    # dbc2 |   xor [G], G, G
ee e0 00 f8 55 01 6f f4        # dbc6 |   jne [0x155], 0, ${fail}:rel + PC
aa 21 fe 21                    # dbce |   shl [A*2], G, A*2
ee e0 e0 f8 54 01 50 15 63 f4  # dbd2 |   jne [0x154], 0x1550, ${fail}:rel + PC
a6 fe e0 21 39 30              # dbdc |   ishr [G], 0x3039, A*2
ee e0 e0 f8 55 01 03 03 53 f4  # dbe2 |   jne [0x155], 0x303, ${fail}:rel + PC
ae 21 2a e4 de fa              # dbec |   and [A*2], A*4 + B, 0xfade + A
ee e0 e0 f8 54 01 00 03 43 f4  # dbf2 |   jne [0x154], 0x300, ${fail}:rel + PC
82 20 3e 3e f6 f6              # dbfc |   add [A], A*4 + -10, A*4 + -10
ee e0 e0 f8 aa 00 3c 05 33 f4  # dc02 |   jne [0xaa], 0x53c, ${fail}:rel + PC
b2 e0 21 1c 39 30 85           # dc0c |   or [0x3039], A*2, -123
ee e0 1c f8 39 30 d5 22 f4     # dc13 |   jne [0x3039], 0xd5, ${fail}:rel + PC
82 e0 fe fe 39 30              # dc1c |   add [0x3039], G, G
ee e0 e0 f8 39 30 aa 02 13 f4  # dc22 |   jne [0x3039], 0x2aa, ${fail}:rel + PC
ae fe e0 e4 39 30 de fa        # dc2c |   and [G], 0x3039, 0xfade + A
ee e0 e0 f8 55 01 08 30 01 f4  # dc34 |   jne [0x155], 0x3008, ${fail}:rel + PC
8e e0 2a 3e 39 30 f6           # dc3e |   imul [0x3039], A*4 + B, A*4 + -10
ee e0 e0 f8 39 30 1a dd f0 f3  # dc45 |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
b2 21 e0 20 39 30              # dc4f |   or [A*2], 0x3039, A
ee e0 e0 f8 54 01 bb 30 e0 f3  # dc55 |   jne [0x154], 0x30bb, ${fail}:rel + PC
8e 21 3e 21 f6                 # dc5f |   imul [A*2], A*4 + -10, A*2
ee e0 e0 f8 54 01 d8 79 d1 f3  # dc64 |   jne [0x154], 0x79d8, ${fail}:rel + PC
82 3e 1c 2a f6 85              # dc6e |   add [A*4 + -10], -123, A*4 + B
ee e0 e0 f8 9e 02 e8 02 c1 f3  # dc74 |   jne [0x29e], 0x2e8, ${fail}:rel + PC
86 fe e4 21 de fa              # dc7e |   sub [G], 0xfade + A, A*2
ee e0 e0 f8 55 01 34 fa b1 f3  # dc84 |   jne [0x155], 0xfa34, ${fail}:rel + PC
b2 2a e4 21 de fa              # dc8e |   or [A*4 + B], 0xfade + A, A*2
ee e0 e0 f8 63 03 dc fb a1 f3  # dc94 |   jne [0x363], 0xfbdc, ${fail}:rel + PC
ae 21 21 20                    # dc9e |   and [A*2], A*2, A
ee e0 00 f8 54 01 93 f3        # dca2 |   jne [0x154], 0, ${fail}:rel + PC
86 2a 2a fe                    # dcaa |   sub [A*4 + B], A*4 + B, G
ee e0 e0 f8 63 03 0e 02 87 f3  # dcae |   jne [0x363], 0x20e, ${fail}:rel + PC
82 3e 3e 20 f6 f6              # dcb8 |   add [A*4 + -10], A*4 + -10, A
ee e0 e0 f8 9e 02 48 03 77 f3  # dcbe |   jne [0x29e], 0x348, ${fail}:rel + PC
86 21 e0 e0 39 30 39 30        # dcc8 |   sub [A*2], 0x3039, 0x3039
ee e0 00 f8 54 01 65 f3        # dcd0 |   jne [0x154], 0, ${fail}:rel + PC
a2 20 1c fe 85                 # dcd8 |   shr [A], -123, G
ee e0 e0 f8 aa 00 fc 07 58 f3  # dcdd |   jne [0xaa], 0x7fc, ${fail}:rel + PC
aa 2a 1c 2a 85                 # dce7 |   shl [A*4 + B], -123, A*4 + B
ee e0 e0 f8 63 03 28 fc 49 f3  # dcec |   jne [0x363], 0xfc28, ${fail}:rel + PC
b2 2a 20 20                    # dcf6 |   or [A*4 + B], A, A
ee e0 e0 f8 63 03 aa 00 3b f3  # dcfa |   jne [0x363], 0xaa, ${fail}:rel + PC
86 20 20 1c 85                 # dd04 |   sub [A], A, -123
ee e0 e0 f8 aa 00 25 01 2c f3  # dd09 |   jne [0xaa], 0x125, ${fail}:rel + PC
a6 3e e4 21 f6 de fa           # dd13 |   ishr [A*4 + -10], 0xfade + A, A*2
ee e0 1c f8 9e 02 b8 1b f3     # dd1a |   jne [0x29e], 0xb8, ${fail}:rel + PC
86 20 e0 e0 39 30 39 30        # dd23 |   sub [A], 0x3039, 0x3039
ee e0 00 f8 aa 00 0a f3        # dd2b |   jne [0xaa], 0, ${fail}:rel + PC
82 fe e0 e0 39 30 39 30        # dd33 |   add [G], 0x3039, 0x3039
ee e0 e0 f8 55 01 72 60 fa f2  # dd3b |   jne [0x155], 0x6072, ${fail}:rel + PC
a2 2a e4 e4 de fa de fa        # dd45 |   shr [A*4 + B], 0xfade + A, 0xfade + A
ee e0 e0 f8 63 03 fb 00 e8 f2  # dd4d |   jne [0x363], 0xfb, ${fail}:rel + PC
8e 20 20 fe                    # dd57 |   imul [A], A, G
ee e0 e0 f8 aa 00 72 e2 da f2  # dd5b |   jne [0xaa], 0xe272, ${fail}:rel + PC
a2 21 e4 2a de fa              # dd65 |   shr [A*2], 0xfade + A, A*4 + B
ee e0 e0 f8 54 01 71 1f ca f2  # dd6b |   jne [0x154], 0x1f71, ${fail}:rel + PC
a2 2a 2a 1c 85                 # dd75 |   shr [A*4 + B], A*4 + B, -123
ee e0 1c f8 63 03 1b bb f2     # dd7a |   jne [0x363], 0x1b, ${fail}:rel + PC
a2 20 21 2a                    # dd83 |   shr [A], A*2, A*4 + B
ee e0 1c f8 aa 00 2a ae f2     # dd87 |   jne [0xaa], 0x2a, ${fail}:rel + PC
ae e0 2a 20 39 30              # dd90 |   and [0x3039], A*4 + B, A
ee e0 1c f8 39 30 22 9f f2     # dd96 |   jne [0x3039], 0x22, ${fail}:rel + PC
a2 e0 e0 e0 39 30 39 30 39 30  # dd9f |   shr [0x3039], 0x3039, 0x3039
ee e0 1c f8 39 30 18 8c f2     # dda9 |   jne [0x3039], 0x18, ${fail}:rel + PC
8a 20 fe 3e f6                 # ddb2 |   mul [A], G, A*4 + -10
ee e0 e0 f8 aa 00 76 7c 7e f2  # ddb7 |   jne [0xaa], 0x7c76, ${fail}:rel + PC
82 2a e0 2a 39 30              # ddc1 |   add [A*4 + B], 0x3039, A*4 + B
ee e0 e0 f8 63 03 9c 33 6e f2  # ddc7 |   jne [0x363], 0x339c, ${fail}:rel + PC
8e fe 3e 2a f6                 # ddd1 |   imul [G], A*4 + -10, A*4 + B
ee e0 e0 f8 55 01 1a dd 5f f2  # ddd6 |   jne [0x155], 0xdd1a, ${fail}:rel + PC
aa 20 21 e0 39 30              # dde0 |   shl [A], A*2, 0x3039
ee e0 e0 f8 aa 00 00 a8 4f f2  # dde6 |   jne [0xaa], 0xa800, ${fail}:rel + PC
82 21 fe 20                    # ddf0 |   add [A*2], G, A
ee e0 e0 f8 54 01 ff 01 41 f2  # ddf4 |   jne [0x154], 0x1ff, ${fail}:rel + PC
82 2a 2a 21                    # ddfe |   add [A*4 + B], A*4 + B, A*2
ee e0 e0 f8 63 03 b7 04 33 f2  # de02 |   jne [0x363], 0x4b7, ${fail}:rel + PC
a2 20 fe e4 de fa              # de0c |   shr [A], G, 0xfade + A
ee e0 1c f8 aa 00 01 23 f2     # de12 |   jne [0xaa], 0x1, ${fail}:rel + PC
82 fe 1c 20 85                 # de1b |   add [G], -123, A
ee e0 1c f8 55 01 2f 15 f2     # de20 |   jne [0x155], 0x2f, ${fail}:rel + PC
8e 3e fe e0 f6 39 30           # de29 |   imul [A*4 + -10], G, 0x3039
ee e0 e0 f8 9e 02 ed 3b 05 f2  # de30 |   jne [0x29e], 0x3bed, ${fail}:rel + PC
8a fe e4 2a de fa              # de3a |   mul [G], 0xfade + A, A*4 + B
ee e0 e0 f8 55 01 98 dd f5 f1  # de40 |   jne [0x155], 0xdd98, ${fail}:rel + PC
a2 fe fe 20                    # de4a |   shr [G], G, A
ee e0 00 f8 55 01 e7 f1        # de4e |   jne [0x155], 0, ${fail}:rel + PC
b2 21 20 20                    # de56 |   or [A*2], A, A
ee e0 e0 f8 54 01 aa 00 db f1  # de5a |   jne [0x154], 0xaa, ${fail}:rel + PC
b2 3e 1c 21 f6 85              # de64 |   or [A*4 + -10], -123, A*2
ee e0 1c f8 9e 02 d5 cb f1     # de6a |   jne [0x29e], 0xd5, ${fail}:rel + PC
8a 2a 1c 1c 85 85              # de73 |   mul [A*4 + B], -123, -123
ee e0 e0 f8 63 03 19 3b bc f1  # de79 |   jne [0x363], 0x3b19, ${fail}:rel + PC
8a e0 e4 21 39 30 de fa        # de83 |   mul [0x3039], 0xfade + A, A*2
ee e0 e0 f8 39 30 a0 10 aa f1  # de8b |   jne [0x3039], 0x10a0, ${fail}:rel + PC
86 fe 20 3e f6                 # de95 |   sub [G], A, A*4 + -10
ee e0 e0 f8 55 01 0c fe 9b f1  # de9a |   jne [0x155], 0xfe0c, ${fail}:rel + PC
aa 20 2a 21                    # dea4 |   shl [A], A*4 + B, A*2
ee e0 e0 f8 aa 00 30 36 8d f1  # dea8 |   jne [0xaa], 0x3630, ${fail}:rel + PC
b6 21 1c 2a 85                 # deb2 |   xor [A*2], -123, A*4 + B
ee e0 e0 f8 54 01 e6 fc 7e f1  # deb7 |   jne [0x154], 0xfce6, ${fail}:rel + PC
86 2a 3e 1c f6 85              # dec1 |   sub [A*4 + B], A*4 + -10, -123
ee e0 e0 f8 63 03 19 03 6e f1  # dec7 |   jne [0x363], 0x319, ${fail}:rel + PC
86 e0 e0 e4 39 30 39 30 de fa  # ded1 |   sub [0x3039], 0x3039, 0xfade + A
ee e0 e0 f8 39 30 b1 34 5a f1  # dedb |   jne [0x3039], 0x34b1, ${fail}:rel + PC
ae fe 2a e4 de fa              # dee5 |   and [G], A*4 + B, 0xfade + A
ee e0 e0 f8 55 01 00 03 4a f1  # deeb |   jne [0x155], 0x300, ${fail}:rel + PC
aa 20 3e fe f6                 # def5 |   shl [A], A*4 + -10, G
ee e0 e0 f8 aa 00 c0 53 3b f1  # defa |   jne [0xaa], 0x53c0, ${fail}:rel + PC
a6 fe fe e4 de fa              # df04 |   ishr [G], G, 0xfade + A
ee e0 1c f8 55 01 01 2b f1     # df0a |   jne [0x155], 0x1, ${fail}:rel + PC
ae 21 e0 2a 39 30              # df13 |   and [A*2], 0x3039, A*4 + B
ee e0 1c f8 54 01 21 1c f1     # df19 |   jne [0x154], 0x21, ${fail}:rel + PC
a6 21 21 1c 85                 # df22 |   ishr [A*2], A*2, -123
ee e0 1c f8 54 01 0a 0e f1     # df27 |   jne [0x154], 0xa, ${fail}:rel + PC
b6 fe 21 e0 39 30              # df30 |   xor [G], A*2, 0x3039
ee e0 e0 f8 55 01 6d 31 ff f0  # df36 |   jne [0x155], 0x316d, ${fail}:rel + PC
86 2a 3e 2a f6                 # df40 |   sub [A*4 + B], A*4 + -10, A*4 + B
ee e0 e0 f8 63 03 3b ff f0 f0  # df45 |   jne [0x363], 0xff3b, ${fail}:rel + PC
b2 e0 fe 1c 39 30 85           # df4f |   or [0x3039], G, -123
ee e0 1c f8 39 30 d5 df f0     # df56 |   jne [0x3039], 0xd5, ${fail}:rel + PC
aa 2a 3e 20 f6                 # df5f |   shl [A*4 + B], A*4 + -10, A
ee e0 e0 f8 63 03 00 78 d1 f0  # df64 |   jne [0x363], 0x7800, ${fail}:rel + PC
86 e0 21 20 39 30              # df6e |   sub [0x3039], A*2, A
ee e0 e0 f8 39 30 aa 00 c1 f0  # df74 |   jne [0x3039], 0xaa, ${fail}:rel + PC
b6 e0 2a 21 39 30              # df7e |   xor [0x3039], A*4 + B, A*2
ee e0 e0 f8 39 30 37 02 b1 f0  # df84 |   jne [0x3039], 0x237, ${fail}:rel + PC
ae 2a e0 1c 39 30 85           # df8e |   and [A*4 + B], 0x3039, -123
ee e0 e0 f8 63 03 01 30 a0 f0  # df95 |   jne [0x363], 0x3001, ${fail}:rel + PC
8e fe 2a e0 39 30              # df9f |   imul [G], A*4 + B, 0x3039
ee e0 e0 f8 55 01 0b 51 90 f0  # dfa5 |   jne [0x155], 0x510b, ${fail}:rel + PC
b2 2a 20 fe                    # dfaf |   or [A*4 + B], A, G
ee e0 e0 f8 63 03 ff 01 82 f0  # dfb3 |   jne [0x363], 0x1ff, ${fail}:rel + PC
a6 3e e0 20 f6 39 30           # dfbd |   ishr [A*4 + -10], 0x3039, A
ee e0 1c f8 9e 02 0c 71 f0     # dfc4 |   jne [0x29e], 0xc, ${fail}:rel + PC
aa e0 e4 e4 39 30 de fa de fa  # dfcd |   shl [0x3039], 0xfade + A, 0xfade + A
ee e0 e0 f8 39 30 00 88 5e f0  # dfd7 |   jne [0x3039], 0x8800, ${fail}:rel + PC
aa 20 e0 fe 39 30              # dfe1 |   shl [A], 0x3039, G
ee e0 e0 f8 aa 00 20 07 4e f0  # dfe7 |   jne [0xaa], 0x720, ${fail}:rel + PC
b6 fe 3e 21 f6                 # dff1 |   xor [G], A*4 + -10, A*2
ee e0 e0 f8 55 01 ca 03 3f f0  # dff6 |   jne [0x155], 0x3ca, ${fail}:rel + PC
b2 2a fe 1c 85                 # e000 |   or [A*4 + B], G, -123
ee e0 1c f8 63 03 d5 30 f0     # e005 |   jne [0x363], 0xd5, ${fail}:rel + PC
86 3e 1c e0 f6 85 39 30        # e00e |   sub [A*4 + -10], -123, 0x3039
ee e0 e0 f8 9e 02 4c cf 1f f0  # e016 |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
aa 21 21 21                    # e020 |   shl [A*2], A*2, A*2
ee e0 e0 f8 54 01 40 15 11 f0  # e024 |   jne [0x154], 0x1540, ${fail}:rel + PC
86 e0 e4 e0 39 30 de fa 39 30  # e02e |   sub [0x3039], 0xfade + A, 0x3039
ee e0 e0 f8 39 30 4f cb fd ef  # e038 |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
a2 21 e0 1c 39 30 85           # e042 |   shr [A*2], 0x3039, -123
ee e0 e0 f8 54 01 81 01 ec ef  # e049 |   jne [0x154], 0x181, ${fail}:rel + PC
a6 e0 e4 20 39 30 de fa        # e053 |   ishr [0x3039], 0xfade + A, A
ee e0 1c f8 39 30 fe da ef     # e05b |   jne [0x3039], 0xfe, ${fail}:rel + PC
b6 3e e4 e0 f6 de fa 39 30     # e064 |   xor [A*4 + -10], 0xfade + A, 0x3039
ee e0 e0 f8 9e 02 b1 cb c8 ef  # e06d |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
86 3e 21 3e f6 f6              # e077 |   sub [A*4 + -10], A*2, A*4 + -10
ee e0 e0 f8 9e 02 b6 fe b8 ef  # e07d |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
8e fe 1c 3e 85 f6              # e087 |   imul [G], -123, A*4 + -10
ee e0 e0 f8 55 01 16 be a8 ef  # e08d |   jne [0x155], 0xbe16, ${fail}:rel + PC
aa 20 2a 2a                    # e097 |   shl [A], A*4 + B, A*4 + B
ee e0 e0 f8 aa 00 18 1b 9a ef  # e09b |   jne [0xaa], 0x1b18, ${fail}:rel + PC
b6 e0 21 2a 39 30              # e0a5 |   xor [0x3039], A*2, A*4 + B
ee e0 e0 f8 39 30 37 02 8a ef  # e0ab |   jne [0x3039], 0x237, ${fail}:rel + PC
82 21 21 e0 39 30              # e0b5 |   add [A*2], A*2, 0x3039
ee e0 e0 f8 54 01 8d 31 7a ef  # e0bb |   jne [0x154], 0x318d, ${fail}:rel + PC
ae 21 2a 20                    # e0c5 |   and [A*2], A*4 + B, A
ee e0 1c f8 54 01 22 6c ef     # e0c9 |   jne [0x154], 0x22, ${fail}:rel + PC
aa 20 2a e4 de fa              # e0d2 |   shl [A], A*4 + B, 0xfade + A
ee e0 e0 f8 aa 00 00 63 5d ef  # e0d8 |   jne [0xaa], 0x6300, ${fail}:rel + PC
ae 2a fe 20                    # e0e2 |   and [A*4 + B], G, A
ee e0 00 f8 63 03 4f ef        # e0e6 |   jne [0x363], 0, ${fail}:rel + PC
b6 fe 21 1c 85                 # e0ee |   xor [G], A*2, -123
ee e0 e0 f8 55 01 d1 fe 42 ef  # e0f3 |   jne [0x155], 0xfed1, ${fail}:rel + PC
ae e0 fe 21 39 30              # e0fd |   and [0x3039], G, A*2
ee e0 e0 f8 39 30 54 01 32 ef  # e103 |   jne [0x3039], 0x154, ${fail}:rel + PC
b2 3e e0 2a f6 39 30           # e10d |   or [A*4 + -10], 0x3039, A*4 + B
ee e0 e0 f8 9e 02 7b 33 21 ef  # e114 |   jne [0x29e], 0x337b, ${fail}:rel + PC
b6 fe e4 3e de fa f6           # e11e |   xor [G], 0xfade + A, A*4 + -10
ee e0 e0 f8 55 01 16 f9 10 ef  # e125 |   jne [0x155], 0xf916, ${fail}:rel + PC
8e 2a 21 2a                    # e12f |   imul [A*4 + B], A*2, A*4 + B
ee e0 e0 f8 63 03 7c 7f 02 ef  # e133 |   jne [0x363], 0x7f7c, ${fail}:rel + PC
a6 fe 21 fe                    # e13d |   ishr [G], A*2, G
ee e0 1c f8 55 01 0a f4 ee     # e141 |   jne [0x155], 0xa, ${fail}:rel + PC
8a 21 1c 1c 85 85              # e14a |   mul [A*2], -123, -123
ee e0 e0 f8 54 01 19 3b e5 ee  # e150 |   jne [0x154], 0x3b19, ${fail}:rel + PC
8e 2a e4 20 de fa              # e15a |   imul [A*4 + B], 0xfade + A, A
ee e0 e0 f8 63 03 50 08 d5 ee  # e160 |   jne [0x363], 0x850, ${fail}:rel + PC
a2 3e 3e 3e f6 f6 f6           # e16a |   shr [A*4 + -10], A*4 + -10, A*4 + -10
ee e0 00 f8 9e 02 c4 ee        # e171 |   jne [0x29e], 0, ${fail}:rel + PC
8a 20 1c e4 85 de fa           # e179 |   mul [A], -123, 0xfade + A
ee e0 e0 f8 aa 00 a8 25 b5 ee  # e180 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
a6 3e 20 21 f6                 # e18a |   ishr [A*4 + -10], A, A*2
ee e0 1c f8 9e 02 0a a6 ee     # e18f |   jne [0x29e], 0xa, ${fail}:rel + PC
b2 3e 20 20 f6                 # e198 |   or [A*4 + -10], A, A
ee e0 e0 f8 9e 02 aa 00 98 ee  # e19d |   jne [0x29e], 0xaa, ${fail}:rel + PC
82 e0 fe e0 39 30 39 30        # e1a7 |   add [0x3039], G, 0x3039
ee e0 e0 f8 39 30 8e 31 86 ee  # e1af |   jne [0x3039], 0x318e, ${fail}:rel + PC
8e 3e e0 3e f6 39 30 f6        # e1b9 |   imul [A*4 + -10], 0x3039, A*4 + -10
ee e0 e0 f8 9e 02 2e 35 74 ee  # e1c1 |   jne [0x29e], 0x352e, ${fail}:rel + PC
a6 fe fe 21                    # e1cb |   ishr [G], G, A*2
ee e0 1c f8 55 01 15 66 ee     # e1cf |   jne [0x155], 0x15, ${fail}:rel + PC
8e 20 e4 3e de fa f6           # e1d8 |   imul [A], 0xfade + A, A*4 + -10
ee e0 e0 f8 aa 00 f0 4d 56 ee  # e1df |   jne [0xaa], 0x4df0, ${fail}:rel + PC
a6 fe 20 fe                    # e1e9 |   ishr [G], A, G
ee e0 1c f8 55 01 05 48 ee     # e1ed |   jne [0x155], 0x5, ${fail}:rel + PC
82 2a e0 3e 39 30 f6           # e1f6 |   add [A*4 + B], 0x3039, A*4 + -10
ee e0 e0 f8 63 03 d7 32 38 ee  # e1fd |   jne [0x363], 0x32d7, ${fail}:rel + PC
ae 3e 2a e4 f6 de fa           # e207 |   and [A*4 + -10], A*4 + B, 0xfade + A
ee e0 e0 f8 9e 02 00 03 27 ee  # e20e |   jne [0x29e], 0x300, ${fail}:rel + PC
8e 20 1c 2a 85                 # e218 |   imul [A], -123, A*4 + B
ee e0 e0 f8 aa 00 6f 5f 18 ee  # e21d |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
a2 fe 3e e4 f6 de fa           # e227 |   shr [G], A*4 + -10, 0xfade + A
ee e0 1c f8 55 01 02 07 ee     # e22e |   jne [0x155], 0x2, ${fail}:rel + PC
b2 2a e0 20 39 30              # e237 |   or [A*4 + B], 0x3039, A
ee e0 e0 f8 63 03 bb 30 f8 ed  # e23d |   jne [0x363], 0x30bb, ${fail}:rel + PC
b6 2a e0 fe 39 30              # e247 |   xor [A*4 + B], 0x3039, G
ee e0 e0 f8 63 03 6c 31 e8 ed  # e24d |   jne [0x363], 0x316c, ${fail}:rel + PC
8e 20 20 e0 39 30              # e257 |   imul [A], A, 0x3039
ee e0 e0 f8 aa 00 da 05 d8 ed  # e25d |   jne [0xaa], 0x5da, ${fail}:rel + PC
b2 21 2a 3e f6                 # e267 |   or [A*2], A*4 + B, A*4 + -10
ee e0 e0 f8 54 01 ff 03 c9 ed  # e26c |   jne [0x154], 0x3ff, ${fail}:rel + PC
aa fe e4 e0 de fa 39 30        # e276 |   shl [G], 0xfade + A, 0x3039
ee e0 e0 f8 55 01 00 10 b7 ed  # e27e |   jne [0x155], 0x1000, ${fail}:rel + PC
a6 2a e4 2a de fa              # e288 |   ishr [A*4 + B], 0xfade + A, A*4 + B
ee e0 e0 f8 63 03 71 ff a7 ed  # e28e |   jne [0x363], 0xff71, ${fail}:rel + PC
aa 3e e4 1c f6 de fa 85        # e298 |   shl [A*4 + -10], 0xfade + A, -123
ee e0 e0 f8 9e 02 00 71 95 ed  # e2a0 |   jne [0x29e], 0x7100, ${fail}:rel + PC
a2 3e e4 20 f6 de fa           # e2aa |   shr [A*4 + -10], 0xfade + A, A
ee e0 1c f8 9e 02 3e 84 ed     # e2b1 |   jne [0x29e], 0x3e, ${fail}:rel + PC
8a 3e 20 2a f6                 # e2ba |   mul [A*4 + -10], A, A*4 + B
ee e0 e0 f8 9e 02 be 3f 76 ed  # e2bf |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
b2 21 3e 2a f6                 # e2c9 |   or [A*2], A*4 + -10, A*4 + B
ee e0 e0 f8 54 01 ff 03 67 ed  # e2ce |   jne [0x154], 0x3ff, ${fail}:rel + PC
8e 3e 21 1c f6 85              # e2d8 |   imul [A*4 + -10], A*2, -123
ee e0 e0 f8 9e 02 a4 5c 57 ed  # e2de |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
aa e0 3e 21 39 30 f6           # e2e8 |   shl [0x3039], A*4 + -10, A*2
ee e0 e0 f8 39 30 e0 29 46 ed  # e2ef |   jne [0x3039], 0x29e0, ${fail}:rel + PC
aa 21 e4 e4 de fa de fa        # e2f9 |   shl [A*2], 0xfade + A, 0xfade + A
ee e0 e0 f8 54 01 00 88 34 ed  # e301 |   jne [0x154], 0x8800, ${fail}:rel + PC
82 fe 21 21                    # e30b |   add [G], A*2, A*2
ee e0 e0 f8 55 01 a8 02 26 ed  # e30f |   jne [0x155], 0x2a8, ${fail}:rel + PC
ae 21 e4 fe de fa              # e319 |   and [A*2], 0xfade + A, G
ee e0 e0 f8 54 01 00 01 16 ed  # e31f |   jne [0x154], 0x100, ${fail}:rel + PC
ae 3e e0 e0 f6 39 30 39 30     # e329 |   and [A*4 + -10], 0x3039, 0x3039
ee e0 e0 f8 9e 02 39 30 03 ed  # e332 |   jne [0x29e], 0x3039, ${fail}:rel + PC
aa 3e 20 1c f6 85              # e33c |   shl [A*4 + -10], A, -123
ee e0 e0 f8 9e 02 40 15 f3 ec  # e342 |   jne [0x29e], 0x1540, ${fail}:rel + PC
ae 2a 3e e4 f6 de fa           # e34c |   and [A*4 + B], A*4 + -10, 0xfade + A
ee e0 e0 f8 63 03 88 02 e2 ec  # e353 |   jne [0x363], 0x288, ${fail}:rel + PC
82 fe 1c 1c 85 85              # e35d |   add [G], -123, -123
ee e0 e0 f8 55 01 0a ff d2 ec  # e363 |   jne [0x155], 0xff0a, ${fail}:rel + PC
8a 20 20 e4 de fa              # e36d |   mul [A], A, 0xfade + A
ee e0 e0 f8 aa 00 50 08 c2 ec  # e373 |   jne [0xaa], 0x850, ${fail}:rel + PC
b2 21 2a fe                    # e37d |   or [A*2], A*4 + B, G
ee e0 e0 f8 54 01 77 03 b4 ec  # e381 |   jne [0x154], 0x377, ${fail}:rel + PC
86 fe e4 e4 de fa de fa        # e38b |   sub [G], 0xfade + A, 0xfade + A
ee e0 00 f8 55 01 a2 ec        # e393 |   jne [0x155], 0, ${fail}:rel + PC
a2 2a fe e4 de fa              # e39b |   shr [A*4 + B], G, 0xfade + A
ee e0 1c f8 63 03 01 94 ec     # e3a1 |   jne [0x363], 0x1, ${fail}:rel + PC
86 21 1c fe 85                 # e3aa |   sub [A*2], -123, G
ee e0 e0 f8 54 01 30 fe 86 ec  # e3af |   jne [0x154], 0xfe30, ${fail}:rel + PC
aa 3e 21 fe f6                 # e3b9 |   shl [A*4 + -10], A*2, G
ee e0 e0 f8 9e 02 80 2a 77 ec  # e3be |   jne [0x29e], 0x2a80, ${fail}:rel + PC
aa 20 1c 3e 85 f6              # e3c8 |   shl [A], -123, A*4 + -10
ee e0 e0 f8 aa 00 00 40 67 ec  # e3ce |   jne [0xaa], 0x4000, ${fail}:rel + PC
8a 3e 2a 21 f6                 # e3d8 |   mul [A*4 + -10], A*4 + B, A*2
ee e0 e0 f8 9e 02 7c 7f 58 ec  # e3dd |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
a2 20 2a fe                    # e3e7 |   shr [A], A*4 + B, G
ee e0 1c f8 aa 00 1b 4a ec     # e3eb |   jne [0xaa], 0x1b, ${fail}:rel + PC
82 20 2a e0 39 30              # e3f4 |   add [A], A*4 + B, 0x3039
ee e0 e0 f8 aa 00 9c 33 3b ec  # e3fa |   jne [0xaa], 0x339c, ${fail}:rel + PC
b6 fe e0 1c 39 30 85           # e404 |   xor [G], 0x3039, -123
ee e0 e0 f8 55 01 bc cf 2a ec  # e40b |   jne [0x155], 0xcfbc, ${fail}:rel + PC
86 20 e4 2a de fa              # e415 |   sub [A], 0xfade + A, A*4 + B
ee e0 e0 f8 aa 00 25 f8 1a ec  # e41b |   jne [0xaa], 0xf825, ${fail}:rel + PC
a6 2a 21 fe                    # e425 |   ishr [A*4 + B], A*2, G
ee e0 1c f8 63 03 0a 0c ec     # e429 |   jne [0x363], 0xa, ${fail}:rel + PC
b2 21 fe e4 de fa              # e432 |   or [A*2], G, 0xfade + A
ee e0 e0 f8 54 01 dd fb fd eb  # e438 |   jne [0x154], 0xfbdd, ${fail}:rel + PC
8a e0 e4 fe 39 30 de fa        # e442 |   mul [0x3039], 0xfade + A, G
ee e0 e0 f8 39 30 28 0c eb eb  # e44a |   jne [0x3039], 0xc28, ${fail}:rel + PC
8e 2a 2a e4 de fa              # e454 |   imul [A*4 + B], A*4 + B, 0xfade + A
ee e0 e0 f8 63 03 98 dd db eb  # e45a |   jne [0x363], 0xdd98, ${fail}:rel + PC
ae e0 20 fe 39 30              # e464 |   and [0x3039], A, G
ee e0 00 f8 39 30 cb eb        # e46a |   jne [0x3039], 0, ${fail}:rel + PC
8e fe fe 2a                    # e472 |   imul [G], G, A*4 + B
ee e0 e0 f8 55 01 df 82 bf eb  # e476 |   jne [0x155], 0x82df, ${fail}:rel + PC
8e 3e 21 21 f6                 # e480 |   imul [A*4 + -10], A*2, A*2
ee e0 e0 f8 9e 02 90 c3 b0 eb  # e485 |   jne [0x29e], 0xc390, ${fail}:rel + PC
b2 fe e4 1c de fa 85           # e48f |   or [G], 0xfade + A, -123
ee e0 1c f8 55 01 8d 9f eb     # e496 |   jne [0x155], 0x8d, ${fail}:rel + PC
8e 2a 20 3e f6                 # e49f |   imul [A*4 + B], A, A*4 + -10
ee e0 e0 f8 63 03 ec bc 91 eb  # e4a4 |   jne [0x363], 0xbcec, ${fail}:rel + PC
a2 2a 3e e0 f6 39 30           # e4ae |   shr [A*4 + B], A*4 + -10, 0x3039
ee e0 1c f8 63 03 01 80 eb     # e4b5 |   jne [0x363], 0x1, ${fail}:rel + PC
b6 2a 21 e0 39 30              # e4be |   xor [A*4 + B], A*2, 0x3039
ee e0 e0 f8 63 03 6d 31 71 eb  # e4c4 |   jne [0x363], 0x316d, ${fail}:rel + PC
a2 e0 3e e0 39 30 f6 39 30     # e4ce |   shr [0x3039], A*4 + -10, 0x3039
ee e0 1c f8 39 30 01 5e eb     # e4d7 |   jne [0x3039], 0x1, ${fail}:rel + PC
a2 21 1c 3e 85 f6              # e4e0 |   shr [A*2], -123, A*4 + -10
ee e0 1c f8 54 01 03 4f eb     # e4e6 |   jne [0x154], 0x3, ${fail}:rel + PC
b2 21 20 21                    # e4ef |   or [A*2], A, A*2
ee e0 e0 f8 54 01 fe 01 42 eb  # e4f3 |   jne [0x154], 0x1fe, ${fail}:rel + PC
a2 fe 2a 21                    # e4fd |   shr [G], A*4 + B, A*2
ee e0 1c f8 55 01 36 34 eb     # e501 |   jne [0x155], 0x36, ${fail}:rel + PC
b6 e0 3e 2a 39 30 f6           # e50a |   xor [0x3039], A*4 + -10, A*4 + B
ee e0 e0 f8 39 30 fd 01 24 eb  # e511 |   jne [0x3039], 0x1fd, ${fail}:rel + PC
8a 3e e4 3e f6 de fa f6        # e51b |   mul [A*4 + -10], 0xfade + A, A*4 + -10
ee e0 e0 f8 9e 02 f0 4d 12 eb  # e523 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
8e 2a 21 3e f6                 # e52d |   imul [A*4 + B], A*2, A*4 + -10
ee e0 e0 f8 63 03 d8 79 03 eb  # e532 |   jne [0x363], 0x79d8, ${fail}:rel + PC
a2 e0 e4 3e 39 30 de fa f6     # e53c |   shr [0x3039], 0xfade + A, A*4 + -10
ee e0 1c f8 39 30 03 f0 ea     # e545 |   jne [0x3039], 0x3, ${fail}:rel + PC
82 3e 20 fe f6                 # e54e |   add [A*4 + -10], A, G
ee e0 e0 f8 9e 02 ff 01 e2 ea  # e553 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a2 2a e4 e0 de fa 39 30        # e55d |   shr [A*4 + B], 0xfade + A, 0x3039
ee e0 1c f8 63 03 7d d0 ea     # e565 |   jne [0x363], 0x7d, ${fail}:rel + PC
a2 3e 1c 1c f6 85 85           # e56e |   shr [A*4 + -10], -123, -123
ee e0 e0 f8 9e 02 fc 07 c0 ea  # e575 |   jne [0x29e], 0x7fc, ${fail}:rel + PC
8e 20 1c e0 85 39 30           # e57f |   imul [A], -123, 0x3039
ee e0 e0 f8 aa 00 9d d4 af ea  # e586 |   jne [0xaa], 0xd49d, ${fail}:rel + PC
aa 2a 3e 21 f6                 # e590 |   shl [A*4 + B], A*4 + -10, A*2
ee e0 e0 f8 63 03 e0 29 a0 ea  # e595 |   jne [0x363], 0x29e0, ${fail}:rel + PC
b6 21 e0 fe 39 30              # e59f |   xor [A*2], 0x3039, G
ee e0 e0 f8 54 01 6c 31 90 ea  # e5a5 |   jne [0x154], 0x316c, ${fail}:rel + PC
b6 e0 3e 3e 39 30 f6 f6        # e5af |   xor [0x3039], A*4 + -10, A*4 + -10
ee e0 00 f8 39 30 7e ea        # e5b7 |   jne [0x3039], 0, ${fail}:rel + PC
b6 20 21 1c 85                 # e5bf |   xor [A], A*2, -123
ee e0 e0 f8 aa 00 d1 fe 71 ea  # e5c4 |   jne [0xaa], 0xfed1, ${fail}:rel + PC
b6 21 21 fe                    # e5ce |   xor [A*2], A*2, G
ee e0 1c f8 54 01 01 63 ea     # e5d2 |   jne [0x154], 0x1, ${fail}:rel + PC
8a fe e0 20 39 30              # e5db |   mul [G], 0x3039, A
ee e0 e0 f8 55 01 da 05 54 ea  # e5e1 |   jne [0x155], 0x5da, ${fail}:rel + PC
b6 21 e0 21 39 30              # e5eb |   xor [A*2], 0x3039, A*2
ee e0 e0 f8 54 01 6d 31 44 ea  # e5f1 |   jne [0x154], 0x316d, ${fail}:rel + PC
8a 21 2a e0 39 30              # e5fb |   mul [A*2], A*4 + B, 0x3039
ee e0 e0 f8 54 01 0b 51 34 ea  # e601 |   jne [0x154], 0x510b, ${fail}:rel + PC
ae 3e e0 1c f6 39 30 85        # e60b |   and [A*4 + -10], 0x3039, -123
ee e0 e0 f8 9e 02 01 30 22 ea  # e613 |   jne [0x29e], 0x3001, ${fail}:rel + PC
aa fe 21 20                    # e61d |   shl [G], A*2, A
ee e0 e0 f8 55 01 00 50 14 ea  # e621 |   jne [0x155], 0x5000, ${fail}:rel + PC
ae 20 e4 20 de fa              # e62b |   and [A], 0xfade + A, A
ee e0 e0 f8 aa 00 88 00 04 ea  # e631 |   jne [0xaa], 0x88, ${fail}:rel + PC
aa 21 3e e4 f6 de fa           # e63b |   shl [A*2], A*4 + -10, 0xfade + A
ee e0 e0 f8 54 01 00 9e f3 e9  # e642 |   jne [0x154], 0x9e00, ${fail}:rel + PC
b6 e0 e0 1c 39 30 39 30 85     # e64c |   xor [0x3039], 0x3039, -123
ee e0 e0 f8 39 30 bc cf e0 e9  # e655 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
8a 3e 3e 1c f6 f6 85           # e65f |   mul [A*4 + -10], A*4 + -10, -123
ee e0 e0 f8 9e 02 16 be cf e9  # e666 |   jne [0x29e], 0xbe16, ${fail}:rel + PC
86 fe 21 3e f6                 # e670 |   sub [G], A*2, A*4 + -10
ee e0 e0 f8 55 01 b6 fe c0 e9  # e675 |   jne [0x155], 0xfeb6, ${fail}:rel + PC
86 3e 2a fe f6                 # e67f |   sub [A*4 + -10], A*4 + B, G
ee e0 e0 f8 9e 02 0e 02 b1 e9  # e684 |   jne [0x29e], 0x20e, ${fail}:rel + PC
b6 3e 1c fe f6 85              # e68e |   xor [A*4 + -10], -123, G
ee e0 e0 f8 9e 02 d0 fe a1 e9  # e694 |   jne [0x29e], 0xfed0, ${fail}:rel + PC
86 20 2a 1c 85                 # e69e |   sub [A], A*4 + B, -123
ee e0 e0 f8 aa 00 de 03 92 e9  # e6a3 |   jne [0xaa], 0x3de, ${fail}:rel + PC
86 20 21 fe                    # e6ad |   sub [A], A*2, G
ee e0 1c f8 aa 00 ff 84 e9     # e6b1 |   jne [0xaa], 0xff, ${fail}:rel + PC
86 2a 20 e4 de fa              # e6ba |   sub [A*4 + B], A, 0xfade + A
ee e0 e0 f8 63 03 22 05 75 e9  # e6c0 |   jne [0x363], 0x522, ${fail}:rel + PC
aa e0 fe 3e 39 30 f6           # e6ca |   shl [0x3039], G, A*4 + -10
ee e0 e0 f8 39 30 00 40 64 e9  # e6d1 |   jne [0x3039], 0x4000, ${fail}:rel + PC
ae 20 1c 1c 85 85              # e6db |   and [A], -123, -123
ee e0 1c f8 aa 00 85 54 e9     # e6e1 |   jne [0xaa], 0x85, ${fail}:rel + PC
b6 20 fe e0 39 30              # e6ea |   xor [A], G, 0x3039
ee e0 e0 f8 aa 00 6c 31 45 e9  # e6f0 |   jne [0xaa], 0x316c, ${fail}:rel + PC
b2 e0 21 3e 39 30 f6           # e6fa |   or [0x3039], A*2, A*4 + -10
ee e0 e0 f8 39 30 de 03 34 e9  # e701 |   jne [0x3039], 0x3de, ${fail}:rel + PC
b2 20 e4 21 de fa              # e70b |   or [A], 0xfade + A, A*2
ee e0 e0 f8 aa 00 dc fb 24 e9  # e711 |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
b6 fe 3e 3e f6 f6              # e71b |   xor [G], A*4 + -10, A*4 + -10
ee e0 00 f8 55 01 14 e9        # e721 |   jne [0x155], 0, ${fail}:rel + PC
b6 3e 20 e4 f6 de fa           # e729 |   xor [A*4 + -10], A, 0xfade + A
ee e0 e0 f8 9e 02 22 fb 05 e9  # e730 |   jne [0x29e], 0xfb22, ${fail}:rel + PC
b6 e0 1c e0 39 30 85 39 30     # e73a |   xor [0x3039], -123, 0x3039
ee e0 e0 f8 39 30 bc cf f2 e8  # e743 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
a2 3e fe 2a f6                 # e74d |   shr [A*4 + -10], G, A*4 + B
ee e0 1c f8 9e 02 2a e3 e8     # e752 |   jne [0x29e], 0x2a, ${fail}:rel + PC
ae 20 fe 20                    # e75b |   and [A], G, A
ee e0 00 f8 aa 00 d6 e8        # e75f |   jne [0xaa], 0, ${fail}:rel + PC
86 2a e4 1c de fa 85           # e767 |   sub [A*4 + B], 0xfade + A, -123
ee e0 e0 f8 63 03 03 fc c7 e8  # e76e |   jne [0x363], 0xfc03, ${fail}:rel + PC
ae e0 21 21 39 30              # e778 |   and [0x3039], A*2, A*2
ee e0 e0 f8 39 30 54 01 b7 e8  # e77e |   jne [0x3039], 0x154, ${fail}:rel + PC
a2 e0 20 e0 39 30 39 30        # e788 |   shr [0x3039], A, 0x3039
ee e0 00 f8 39 30 a5 e8        # e790 |   jne [0x3039], 0, ${fail}:rel + PC
8e 3e 2a 3e f6 f6              # e798 |   imul [A*4 + -10], A*4 + B, A*4 + -10
ee e0 e0 f8 9e 02 1a dd 97 e8  # e79e |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
a2 e0 3e 1c 39 30 f6 85        # e7a8 |   shr [0x3039], A*4 + -10, -123
ee e0 1c f8 39 30 14 85 e8     # e7b0 |   jne [0x3039], 0x14, ${fail}:rel + PC
82 fe 20 e0 39 30              # e7b9 |   add [G], A, 0x3039
ee e0 e0 f8 55 01 e3 30 76 e8  # e7bf |   jne [0x155], 0x30e3, ${fail}:rel + PC
a6 e0 21 e0 39 30 39 30        # e7c9 |   ishr [0x3039], A*2, 0x3039
ee e0 00 f8 39 30 64 e8        # e7d1 |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e4 1c 39 30 de fa 85     # e7d9 |   ishr [0x3039], 0xfade + A, -123
ee e0 1c f8 39 30 dc 53 e8     # e7e2 |   jne [0x3039], 0xdc, ${fail}:rel + PC
b2 3e fe 20 f6                 # e7eb |   or [A*4 + -10], G, A
ee e0 e0 f8 9e 02 ff 01 45 e8  # e7f0 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a6 2a 2a 20                    # e7fa |   ishr [A*4 + B], A*4 + B, A
ee e0 00 f8 63 03 37 e8        # e7fe |   jne [0x363], 0, ${fail}:rel + PC
aa fe e0 2a 39 30              # e806 |   shl [G], 0x3039, A*4 + B
ee e0 e0 f8 55 01 c8 81 29 e8  # e80c |   jne [0x155], 0x81c8, ${fail}:rel + PC
8a 21 3e 20 f6                 # e816 |   mul [A*2], A*4 + -10, A
ee e0 e0 f8 54 01 ec bc 1a e8  # e81b |   jne [0x154], 0xbcec, ${fail}:rel + PC
8e 3e 3e e0 f6 f6 39 30        # e825 |   imul [A*4 + -10], A*4 + -10, 0x3039
ee e0 e0 f8 9e 02 2e 35 08 e8  # e82d |   jne [0x29e], 0x352e, ${fail}:rel + PC
b6 e0 1c 3e 39 30 85 f6        # e837 |   xor [0x3039], -123, A*4 + -10
ee e0 e0 f8 39 30 1b fd f6 e7  # e83f |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
b2 fe 20 e4 de fa              # e849 |   or [G], A, 0xfade + A
ee e0 e0 f8 55 01 aa fb e6 e7  # e84f |   jne [0x155], 0xfbaa, ${fail}:rel + PC
8e fe fe 3e f6                 # e859 |   imul [G], G, A*4 + -10
ee e0 e0 f8 55 01 76 7c d7 e7  # e85e |   jne [0x155], 0x7c76, ${fail}:rel + PC
8a 20 e0 3e 39 30 f6           # e868 |   mul [A], 0x3039, A*4 + -10
ee e0 e0 f8 aa 00 2e 35 c6 e7  # e86f |   jne [0xaa], 0x352e, ${fail}:rel + PC
b2 fe 20 20                    # e879 |   or [G], A, A
ee e0 e0 f8 55 01 aa 00 b8 e7  # e87d |   jne [0x155], 0xaa, ${fail}:rel + PC
a2 3e 21 e4 f6 de fa           # e887 |   shr [A*4 + -10], A*2, 0xfade + A
ee e0 1c f8 9e 02 01 a7 e7     # e88e |   jne [0x29e], 0x1, ${fail}:rel + PC
a6 20 3e 2a f6                 # e897 |   ishr [A], A*4 + -10, A*4 + B
ee e0 1c f8 aa 00 53 99 e7     # e89c |   jne [0xaa], 0x53, ${fail}:rel + PC
82 20 e0 20 39 30              # e8a5 |   add [A], 0x3039, A
ee e0 e0 f8 aa 00 e3 30 8a e7  # e8ab |   jne [0xaa], 0x30e3, ${fail}:rel + PC
a6 20 1c 20 85                 # e8b5 |   ishr [A], -123, A
ee e0 1c f8 aa 00 ff 7b e7     # e8ba |   jne [0xaa], 0xff, ${fail}:rel + PC
ae 21 20 1c 85                 # e8c3 |   and [A*2], A, -123
ee e0 e0 f8 54 01 80 00 6d e7  # e8c8 |   jne [0x154], 0x80, ${fail}:rel + PC
b6 2a 1c e4 85 de fa           # e8d2 |   xor [A*4 + B], -123, 0xfade + A
ee e0 e0 f8 63 03 0d 04 5c e7  # e8d9 |   jne [0x363], 0x40d, ${fail}:rel + PC
82 20 e0 21 39 30              # e8e3 |   add [A], 0x3039, A*2
ee e0 e0 f8 aa 00 8d 31 4c e7  # e8e9 |   jne [0xaa], 0x318d, ${fail}:rel + PC
82 21 fe 2a                    # e8f3 |   add [A*2], G, A*4 + B
ee e0 e0 f8 54 01 b8 04 3e e7  # e8f7 |   jne [0x154], 0x4b8, ${fail}:rel + PC
b2 20 2a 20                    # e901 |   or [A], A*4 + B, A
ee e0 e0 f8 aa 00 eb 03 30 e7  # e905 |   jne [0xaa], 0x3eb, ${fail}:rel + PC
82 21 1c e0 85 39 30           # e90f |   add [A*2], -123, 0x3039
ee e0 e0 f8 54 01 be 2f 1f e7  # e916 |   jne [0x154], 0x2fbe, ${fail}:rel + PC
aa fe 2a 1c 85                 # e920 |   shl [G], A*4 + B, -123
ee e0 e0 f8 55 01 60 6c 10 e7  # e925 |   jne [0x155], 0x6c60, ${fail}:rel + PC
82 3e 3e 2a f6 f6              # e92f |   add [A*4 + -10], A*4 + -10, A*4 + B
ee e0 e0 f8 9e 02 01 06 00 e7  # e935 |   jne [0x29e], 0x601, ${fail}:rel + PC
b2 20 3e e4 f6 de fa           # e93f |   or [A], A*4 + -10, 0xfade + A
ee e0 e0 f8 aa 00 9e fb ef e6  # e946 |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
aa 2a 21 1c 85                 # e950 |   shl [A*4 + B], A*2, -123
ee e0 e0 f8 63 03 80 2a e0 e6  # e955 |   jne [0x363], 0x2a80, ${fail}:rel + PC
b2 e0 1c 2a 39 30 85           # e95f |   or [0x3039], -123, A*4 + B
ee e0 1c f8 39 30 e7 cf e6     # e966 |   jne [0x3039], 0xe7, ${fail}:rel + PC
82 21 2a 2a                    # e96f |   add [A*2], A*4 + B, A*4 + B
ee e0 e0 f8 54 01 c6 06 c2 e6  # e973 |   jne [0x154], 0x6c6, ${fail}:rel + PC
ae 20 21 20                    # e97d |   and [A], A*2, A
ee e0 00 f8 aa 00 b4 e6        # e981 |   jne [0xaa], 0, ${fail}:rel + PC
86 20 fe 1c 85                 # e989 |   sub [A], G, -123
ee e0 e0 f8 aa 00 d0 01 a7 e6  # e98e |   jne [0xaa], 0x1d0, ${fail}:rel + PC
b2 20 2a 3e f6                 # e998 |   or [A], A*4 + B, A*4 + -10
ee e0 e0 f8 aa 00 ff 03 98 e6  # e99d |   jne [0xaa], 0x3ff, ${fail}:rel + PC
b6 2a 20 2a                    # e9a7 |   xor [A*4 + B], A, A*4 + B
ee e0 e0 f8 63 03 c9 03 8a e6  # e9ab |   jne [0x363], 0x3c9, ${fail}:rel + PC
aa 21 fe 3e f6                 # e9b5 |   shl [A*2], G, A*4 + -10
ee e0 e0 f8 54 01 00 40 7b e6  # e9ba |   jne [0x154], 0x4000, ${fail}:rel + PC
ae 3e e0 21 f6 39 30           # e9c4 |   and [A*4 + -10], 0x3039, A*2
ee e0 1c f8 9e 02 10 6a e6     # e9cb |   jne [0x29e], 0x10, ${fail}:rel + PC
a2 e0 2a e4 39 30 de fa        # e9d4 |   shr [0x3039], A*4 + B, 0xfade + A
ee e0 1c f8 39 30 03 59 e6     # e9dc |   jne [0x3039], 0x3, ${fail}:rel + PC
8a fe 21 2a                    # e9e5 |   mul [G], A*2, A*4 + B
ee e0 e0 f8 55 01 7c 7f 4c e6  # e9e9 |   jne [0x155], 0x7f7c, ${fail}:rel + PC
a2 3e 3e fe f6 f6              # e9f3 |   shr [A*4 + -10], A*4 + -10, G
ee e0 1c f8 9e 02 14 3c e6     # e9f9 |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 20 e0 e4 39 30 de fa        # ea02 |   mul [A], 0x3039, 0xfade + A
ee e0 e0 f8 aa 00 48 81 2b e6  # ea0a |   jne [0xaa], 0x8148, ${fail}:rel + PC
8a 2a 1c 3e 85 f6              # ea14 |   mul [A*4 + B], -123, A*4 + -10
ee e0 e0 f8 63 03 16 be 1b e6  # ea1a |   jne [0x363], 0xbe16, ${fail}:rel + PC
ae 2a 1c fe 85                 # ea24 |   and [A*4 + B], -123, G
ee e0 e0 f8 63 03 05 01 0c e6  # ea29 |   jne [0x363], 0x105, ${fail}:rel + PC
aa e0 e0 20 39 30 39 30        # ea33 |   shl [0x3039], 0x3039, A
ee e0 e0 f8 39 30 00 e4 fa e5  # ea3b |   jne [0x3039], 0xe400, ${fail}:rel + PC
8e 20 fe 2a                    # ea45 |   imul [A], G, A*4 + B
ee e0 e0 f8 aa 00 df 82 ec e5  # ea49 |   jne [0xaa], 0x82df, ${fail}:rel + PC
86 3e 1c 3e f6 85 f6           # ea53 |   sub [A*4 + -10], -123, A*4 + -10
ee e0 e0 f8 9e 02 e7 fc db e5  # ea5a |   jne [0x29e], 0xfce7, ${fail}:rel + PC
aa 21 20 2a                    # ea64 |   shl [A*2], A, A*4 + B
ee e0 e0 f8 54 01 50 05 cd e5  # ea68 |   jne [0x154], 0x550, ${fail}:rel + PC
82 20 3e 21 f6                 # ea72 |   add [A], A*4 + -10, A*2
ee e0 e0 f8 aa 00 f2 03 be e5  # ea77 |   jne [0xaa], 0x3f2, ${fail}:rel + PC
8a 21 fe 1c 85                 # ea81 |   mul [A*2], G, -123
ee e0 e0 f8 54 01 29 5c af e5  # ea86 |   jne [0x154], 0x5c29, ${fail}:rel + PC
8a fe 1c e0 85 39 30           # ea90 |   mul [G], -123, 0x3039
ee e0 e0 f8 55 01 9d d4 9e e5  # ea97 |   jne [0x155], 0xd49d, ${fail}:rel + PC
a6 e0 2a 2a 39 30              # eaa1 |   ishr [0x3039], A*4 + B, A*4 + B
ee e0 1c f8 39 30 6c 8e e5     # eaa7 |   jne [0x3039], 0x6c, ${fail}:rel + PC
82 2a 1c 21 85                 # eab0 |   add [A*4 + B], -123, A*2
ee e0 e0 f8 63 03 d9 00 80 e5  # eab5 |   jne [0x363], 0xd9, ${fail}:rel + PC
8a e0 e0 fe 39 30 39 30        # eabf |   mul [0x3039], 0x3039, G
ee e0 e0 f8 39 30 ed 3b 6e e5  # eac7 |   jne [0x3039], 0x3bed, ${fail}:rel + PC
b2 e0 2a fe 39 30              # ead1 |   or [0x3039], A*4 + B, G
ee e0 e0 f8 39 30 77 03 5e e5  # ead7 |   jne [0x3039], 0x377, ${fail}:rel + PC
aa 2a 1c e0 85 39 30           # eae1 |   shl [A*4 + B], -123, 0x3039
ee e0 e0 f8 63 03 00 0a 4d e5  # eae8 |   jne [0x363], 0xa00, ${fail}:rel + PC
8a fe 1c 2a 85                 # eaf2 |   mul [G], -123, A*4 + B
ee e0 e0 f8 55 01 6f 5f 3e e5  # eaf7 |   jne [0x155], 0x5f6f, ${fail}:rel + PC
ae 3e e0 fe f6 39 30           # eb01 |   and [A*4 + -10], 0x3039, G
ee e0 1c f8 9e 02 11 2d e5     # eb08 |   jne [0x29e], 0x11, ${fail}:rel + PC
a6 2a 21 e4 de fa              # eb11 |   ishr [A*4 + B], A*2, 0xfade + A
ee e0 1c f8 63 03 01 1e e5     # eb17 |   jne [0x363], 0x1, ${fail}:rel + PC
b2 21 21 2a                    # eb20 |   or [A*2], A*2, A*4 + B
ee e0 e0 f8 54 01 77 03 11 e5  # eb24 |   jne [0x154], 0x377, ${fail}:rel + PC
ae 2a fe fe                    # eb2e |   and [A*4 + B], G, G
ee e0 e0 f8 63 03 55 01 03 e5  # eb32 |   jne [0x363], 0x155, ${fail}:rel + PC
aa 2a 3e 3e f6 f6              # eb3c |   shl [A*4 + B], A*4 + -10, A*4 + -10
ee e0 e0 f8 63 03 00 80 f3 e4  # eb42 |   jne [0x363], 0x8000, ${fail}:rel + PC
86 3e 2a 1c f6 85              # eb4c |   sub [A*4 + -10], A*4 + B, -123
ee e0 e0 f8 9e 02 de 03 e3 e4  # eb52 |   jne [0x29e], 0x3de, ${fail}:rel + PC
ae fe fe 1c 85                 # eb5c |   and [G], G, -123
ee e0 e0 f8 55 01 05 01 d4 e4  # eb61 |   jne [0x155], 0x105, ${fail}:rel + PC
a6 21 3e 1c f6 85              # eb6b |   ishr [A*2], A*4 + -10, -123
ee e0 1c f8 54 01 14 c4 e4     # eb71 |   jne [0x154], 0x14, ${fail}:rel + PC
b2 e0 21 fe 39 30              # eb7a |   or [0x3039], A*2, G
ee e0 e0 f8 39 30 55 01 b5 e4  # eb80 |   jne [0x3039], 0x155, ${fail}:rel + PC
b2 2a 20 21                    # eb8a |   or [A*4 + B], A, A*2
ee e0 e0 f8 63 03 fe 01 a7 e4  # eb8e |   jne [0x363], 0x1fe, ${fail}:rel + PC
a2 21 20 e0 39 30              # eb98 |   shr [A*2], A, 0x3039
ee e0 00 f8 54 01 97 e4        # eb9e |   jne [0x154], 0, ${fail}:rel + PC
8e 3e 3e e4 f6 f6 de fa        # eba6 |   imul [A*4 + -10], A*4 + -10, 0xfade + A
ee e0 e0 f8 9e 02 f0 4d 87 e4  # ebae |   jne [0x29e], 0x4df0, ${fail}:rel + PC
a2 2a 3e fe f6                 # ebb8 |   shr [A*4 + B], A*4 + -10, G
ee e0 1c f8 63 03 14 78 e4     # ebbd |   jne [0x363], 0x14, ${fail}:rel + PC
aa e0 2a 1c 39 30 85           # ebc6 |   shl [0x3039], A*4 + B, -123
ee e0 e0 f8 39 30 60 6c 68 e4  # ebcd |   jne [0x3039], 0x6c60, ${fail}:rel + PC
86 e0 3e 20 39 30 f6           # ebd7 |   sub [0x3039], A*4 + -10, A
ee e0 e0 f8 39 30 f4 01 57 e4  # ebde |   jne [0x3039], 0x1f4, ${fail}:rel + PC
86 fe 3e fe f6                 # ebe8 |   sub [G], A*4 + -10, G
ee e0 e0 f8 55 01 49 01 48 e4  # ebed |   jne [0x155], 0x149, ${fail}:rel + PC
b6 20 20 2a                    # ebf7 |   xor [A], A, A*4 + B
ee e0 e0 f8 aa 00 c9 03 3a e4  # ebfb |   jne [0xaa], 0x3c9, ${fail}:rel + PC
a2 20 21 21                    # ec05 |   shr [A], A*2, A*2
ee e0 1c f8 aa 00 15 2c e4     # ec09 |   jne [0xaa], 0x15, ${fail}:rel + PC
82 2a e0 21 39 30              # ec12 |   add [A*4 + B], 0x3039, A*2
ee e0 e0 f8 63 03 8d 31 1d e4  # ec18 |   jne [0x363], 0x318d, ${fail}:rel + PC
82 fe 2a 2a                    # ec22 |   add [G], A*4 + B, A*4 + B
ee e0 e0 f8 55 01 c6 06 0f e4  # ec26 |   jne [0x155], 0x6c6, ${fail}:rel + PC
aa 2a 2a 3e f6                 # ec30 |   shl [A*4 + B], A*4 + B, A*4 + -10
ee e0 e0 f8 63 03 00 c0 00 e4  # ec35 |   jne [0x363], 0xc000, ${fail}:rel + PC
b6 3e 2a 20 f6                 # ec3f |   xor [A*4 + -10], A*4 + B, A
ee e0 e0 f8 9e 02 c9 03 f1 e3  # ec44 |   jne [0x29e], 0x3c9, ${fail}:rel + PC
8a 20 e4 1c de fa 85           # ec4e |   mul [A], 0xfade + A, -123
ee e0 e0 f8 aa 00 a8 25 e0 e3  # ec55 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
ae 3e e0 e4 f6 39 30 de fa     # ec5f |   and [A*4 + -10], 0x3039, 0xfade + A
ee e0 e0 f8 9e 02 08 30 cd e3  # ec68 |   jne [0x29e], 0x3008, ${fail}:rel + PC
82 20 fe 21                    # ec72 |   add [A], G, A*2
ee e0 e0 f8 aa 00 a9 02 bf e3  # ec76 |   jne [0xaa], 0x2a9, ${fail}:rel + PC
86 fe e4 fe de fa              # ec80 |   sub [G], 0xfade + A, G
ee e0 e0 f8 55 01 33 fa af e3  # ec86 |   jne [0x155], 0xfa33, ${fail}:rel + PC
a2 e0 3e e4 39 30 f6 de fa     # ec90 |   shr [0x3039], A*4 + -10, 0xfade + A
ee e0 1c f8 39 30 02 9c e3     # ec99 |   jne [0x3039], 0x2, ${fail}:rel + PC
a2 3e 21 2a f6                 # eca2 |   shr [A*4 + -10], A*2, A*4 + B
ee e0 1c f8 9e 02 2a 8e e3     # eca7 |   jne [0x29e], 0x2a, ${fail}:rel + PC
a2 fe 20 2a                    # ecb0 |   shr [G], A, A*4 + B
ee e0 1c f8 55 01 15 81 e3     # ecb4 |   jne [0x155], 0x15, ${fail}:rel + PC
8e 2a fe 21                    # ecbd |   imul [A*4 + B], G, A*2
ee e0 e0 f8 63 03 e4 c4 74 e3  # ecc1 |   jne [0x363], 0xc4e4, ${fail}:rel + PC
8a 3e e4 e4 f6 de fa de fa     # eccb |   mul [A*4 + -10], 0xfade + A, 0xfade + A
ee e0 e0 f8 9e 02 40 f8 61 e3  # ecd4 |   jne [0x29e], 0xf840, ${fail}:rel + PC
82 3e 2a e0 f6 39 30           # ecde |   add [A*4 + -10], A*4 + B, 0x3039
ee e0 e0 f8 9e 02 9c 33 50 e3  # ece5 |   jne [0x29e], 0x339c, ${fail}:rel + PC
b6 2a fe 3e f6                 # ecef |   xor [A*4 + B], G, A*4 + -10
ee e0 e0 f8 63 03 cb 03 41 e3  # ecf4 |   jne [0x363], 0x3cb, ${fail}:rel + PC
b6 21 e4 20 de fa              # ecfe |   xor [A*2], 0xfade + A, A
ee e0 e0 f8 54 01 22 fb 31 e3  # ed04 |   jne [0x154], 0xfb22, ${fail}:rel + PC
a2 e0 e0 21 39 30 39 30        # ed0e |   shr [0x3039], 0x3039, A*2
ee e0 e0 f8 39 30 03 03 1f e3  # ed16 |   jne [0x3039], 0x303, ${fail}:rel + PC
8e 2a fe e0 39 30              # ed20 |   imul [A*4 + B], G, 0x3039
ee e0 e0 f8 63 03 ed 3b 0f e3  # ed26 |   jne [0x363], 0x3bed, ${fail}:rel + PC
b6 e0 1c 21 39 30 85           # ed30 |   xor [0x3039], -123, A*2
ee e0 e0 f8 39 30 d1 fe fe e2  # ed37 |   jne [0x3039], 0xfed1, ${fail}:rel + PC
86 e0 fe e4 39 30 de fa        # ed41 |   sub [0x3039], G, 0xfade + A
ee e0 e0 f8 39 30 cd 05 ec e2  # ed49 |   jne [0x3039], 0x5cd, ${fail}:rel + PC
b6 20 21 e4 de fa              # ed53 |   xor [A], A*2, 0xfade + A
ee e0 e0 f8 aa 00 dc fa dc e2  # ed59 |   jne [0xaa], 0xfadc, ${fail}:rel + PC
8a 21 3e e0 f6 39 30           # ed63 |   mul [A*2], A*4 + -10, 0x3039
ee e0 e0 f8 54 01 2e 35 cb e2  # ed6a |   jne [0x154], 0x352e, ${fail}:rel + PC
aa 2a 21 20                    # ed74 |   shl [A*4 + B], A*2, A
ee e0 e0 f8 63 03 00 50 bd e2  # ed78 |   jne [0x363], 0x5000, ${fail}:rel + PC
ae fe 1c e4 85 de fa           # ed82 |   and [G], -123, 0xfade + A
ee e0 e0 f8 55 01 80 fb ac e2  # ed89 |   jne [0x155], 0xfb80, ${fail}:rel + PC
a2 20 20 21                    # ed93 |   shr [A], A, A*2
ee e0 1c f8 aa 00 0a 9e e2     # ed97 |   jne [0xaa], 0xa, ${fail}:rel + PC
b6 3e 20 3e f6 f6              # eda0 |   xor [A*4 + -10], A, A*4 + -10
ee e0 e0 f8 9e 02 34 02 8f e2  # eda6 |   jne [0x29e], 0x234, ${fail}:rel + PC
aa 3e 3e 21 f6 f6              # edb0 |   shl [A*4 + -10], A*4 + -10, A*2
ee e0 e0 f8 9e 02 e0 29 7f e2  # edb6 |   jne [0x29e], 0x29e0, ${fail}:rel + PC
8a 20 3e 1c f6 85              # edc0 |   mul [A], A*4 + -10, -123
ee e0 e0 f8 aa 00 16 be 6f e2  # edc6 |   jne [0xaa], 0xbe16, ${fail}:rel + PC
b2 fe fe e0 39 30              # edd0 |   or [G], G, 0x3039
ee e0 e0 f8 55 01 7d 31 5f e2  # edd6 |   jne [0x155], 0x317d, ${fail}:rel + PC
a2 2a e4 3e de fa f6           # ede0 |   shr [A*4 + B], 0xfade + A, A*4 + -10
ee e0 1c f8 63 03 03 4e e2     # ede7 |   jne [0x363], 0x3, ${fail}:rel + PC
8a 2a 20 e0 39 30              # edf0 |   mul [A*4 + B], A, 0x3039
ee e0 e0 f8 63 03 da 05 3f e2  # edf6 |   jne [0x363], 0x5da, ${fail}:rel + PC
ae 3e 21 e0 f6 39 30           # ee00 |   and [A*4 + -10], A*2, 0x3039
ee e0 1c f8 9e 02 10 2e e2     # ee07 |   jne [0x29e], 0x10, ${fail}:rel + PC
ae e0 20 2a 39 30              # ee10 |   and [0x3039], A, A*4 + B
ee e0 1c f8 39 30 22 1f e2     # ee16 |   jne [0x3039], 0x22, ${fail}:rel + PC
8e fe 2a fe                    # ee1f |   imul [G], A*4 + B, G
ee e0 e0 f8 55 01 df 82 12 e2  # ee23 |   jne [0x155], 0x82df, ${fail}:rel + PC
86 e0 fe 2a 39 30              # ee2d |   sub [0x3039], G, A*4 + B
ee e0 e0 f8 39 30 f2 fd 02 e2  # ee33 |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
a2 2a fe 2a                    # ee3d |   shr [A*4 + B], G, A*4 + B
ee e0 1c f8 63 03 2a f4 e1     # ee41 |   jne [0x363], 0x2a, ${fail}:rel + PC
b2 3e fe fe f6                 # ee4a |   or [A*4 + -10], G, G
ee e0 e0 f8 9e 02 55 01 e6 e1  # ee4f |   jne [0x29e], 0x155, ${fail}:rel + PC
b6 21 20 fe                    # ee59 |   xor [A*2], A, G
ee e0 e0 f8 54 01 ff 01 d8 e1  # ee5d |   jne [0x154], 0x1ff, ${fail}:rel + PC
a2 fe 3e 1c f6 85              # ee67 |   shr [G], A*4 + -10, -123
ee e0 1c f8 55 01 14 c8 e1     # ee6d |   jne [0x155], 0x14, ${fail}:rel + PC
a6 e0 fe 20 39 30              # ee76 |   ishr [0x3039], G, A
ee e0 00 f8 39 30 b9 e1        # ee7c |   jne [0x3039], 0, ${fail}:rel + PC
8a 21 1c e4 85 de fa           # ee84 |   mul [A*2], -123, 0xfade + A
ee e0 e0 f8 54 01 a8 25 aa e1  # ee8b |   jne [0x154], 0x25a8, ${fail}:rel + PC
b2 21 e4 e0 de fa 39 30        # ee95 |   or [A*2], 0xfade + A, 0x3039
ee e0 e0 f8 54 01 b9 fb 98 e1  # ee9d |   jne [0x154], 0xfbb9, ${fail}:rel + PC
8e 2a e0 e4 39 30 de fa        # eea7 |   imul [A*4 + B], 0x3039, 0xfade + A
ee e0 e0 f8 63 03 48 81 86 e1  # eeaf |   jne [0x363], 0x8148, ${fail}:rel + PC
b2 3e fe 1c f6 85              # eeb9 |   or [A*4 + -10], G, -123
ee e0 1c f8 9e 02 d5 76 e1     # eebf |   jne [0x29e], 0xd5, ${fail}:rel + PC
a6 3e 21 20 f6                 # eec8 |   ishr [A*4 + -10], A*2, A
ee e0 00 f8 9e 02 68 e1        # eecd |   jne [0x29e], 0, ${fail}:rel + PC
ae 21 2a 1c 85                 # eed5 |   and [A*2], A*4 + B, -123
ee e0 e0 f8 54 01 01 03 5b e1  # eeda |   jne [0x154], 0x301, ${fail}:rel + PC
b2 20 21 3e f6                 # eee4 |   or [A], A*2, A*4 + -10
ee e0 e0 f8 aa 00 de 03 4c e1  # eee9 |   jne [0xaa], 0x3de, ${fail}:rel + PC
82 fe 3e 20 f6                 # eef3 |   add [G], A*4 + -10, A
ee e0 e0 f8 55 01 48 03 3d e1  # eef8 |   jne [0x155], 0x348, ${fail}:rel + PC
aa 3e 20 e0 f6 39 30           # ef02 |   shl [A*4 + -10], A, 0x3039
ee e0 e0 f8 9e 02 00 54 2c e1  # ef09 |   jne [0x29e], 0x5400, ${fail}:rel + PC
aa 20 e4 e4 de fa de fa        # ef13 |   shl [A], 0xfade + A, 0xfade + A
ee e0 e0 f8 aa 00 00 88 1a e1  # ef1b |   jne [0xaa], 0x8800, ${fail}:rel + PC
8e fe 3e e0 f6 39 30           # ef25 |   imul [G], A*4 + -10, 0x3039
ee e0 e0 f8 55 01 2e 35 09 e1  # ef2c |   jne [0x155], 0x352e, ${fail}:rel + PC
82 e0 1c 1c 39 30 85 85        # ef36 |   add [0x3039], -123, -123
ee e0 e0 f8 39 30 0a ff f7 e0  # ef3e |   jne [0x3039], 0xff0a, ${fail}:rel + PC
86 21 3e fe f6                 # ef48 |   sub [A*2], A*4 + -10, G
ee e0 e0 f8 54 01 49 01 e8 e0  # ef4d |   jne [0x154], 0x149, ${fail}:rel + PC
a6 20 e4 fe de fa              # ef57 |   ishr [A], 0xfade + A, G
ee e0 1c f8 aa 00 dc d8 e0     # ef5d |   jne [0xaa], 0xdc, ${fail}:rel + PC
b6 20 e4 e0 de fa 39 30        # ef66 |   xor [A], 0xfade + A, 0x3039
ee e0 e0 f8 aa 00 b1 cb c7 e0  # ef6e |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
86 fe 21 e4 de fa              # ef78 |   sub [G], A*2, 0xfade + A
ee e0 e0 f8 55 01 cc 05 b7 e0  # ef7e |   jne [0x155], 0x5cc, ${fail}:rel + PC
82 2a e0 e0 39 30 39 30        # ef88 |   add [A*4 + B], 0x3039, 0x3039
ee e0 e0 f8 63 03 72 60 a5 e0  # ef90 |   jne [0x363], 0x6072, ${fail}:rel + PC
86 3e 1c e4 f6 85 de fa        # ef9a |   sub [A*4 + -10], -123, 0xfade + A
ee e0 e0 f8 9e 02 fd 03 93 e0  # efa2 |   jne [0x29e], 0x3fd, ${fail}:rel + PC
82 21 21 3e f6                 # efac |   add [A*2], A*2, A*4 + -10
ee e0 e0 f8 54 01 f2 03 84 e0  # efb1 |   jne [0x154], 0x3f2, ${fail}:rel + PC
a2 20 e0 1c 39 30 85           # efbb |   shr [A], 0x3039, -123
ee e0 e0 f8 aa 00 81 01 73 e0  # efc2 |   jne [0xaa], 0x181, ${fail}:rel + PC
8e 21 20 3e f6                 # efcc |   imul [A*2], A, A*4 + -10
ee e0 e0 f8 54 01 ec bc 64 e0  # efd1 |   jne [0x154], 0xbcec, ${fail}:rel + PC
b2 3e fe e4 f6 de fa           # efdb |   or [A*4 + -10], G, 0xfade + A
ee e0 e0 f8 9e 02 dd fb 53 e0  # efe2 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
a6 fe 20 1c 85                 # efec |   ishr [G], A, -123
ee e0 1c f8 55 01 05 44 e0     # eff1 |   jne [0x155], 0x5, ${fail}:rel + PC
a6 21 20 e4 de fa              # effa |   ishr [A*2], A, 0xfade + A
ee e0 00 f8 54 01 35 e0        # f000 |   jne [0x154], 0, ${fail}:rel + PC
a2 e0 1c 20 39 30 85           # f008 |   shr [0x3039], -123, A
ee e0 1c f8 39 30 3f 26 e0     # f00f |   jne [0x3039], 0x3f, ${fail}:rel + PC
8e 20 20 3e f6                 # f018 |   imul [A], A, A*4 + -10
ee e0 e0 f8 aa 00 ec bc 18 e0  # f01d |   jne [0xaa], 0xbcec, ${fail}:rel + PC
82 2a e4 fe de fa              # f027 |   add [A*4 + B], 0xfade + A, G
ee e0 e0 f8 63 03 dd fc 08 e0  # f02d |   jne [0x363], 0xfcdd, ${fail}:rel + PC
b6 fe e0 3e 39 30 f6           # f037 |   xor [G], 0x3039, A*4 + -10
ee e0 e0 f8 55 01 a7 32 f7 df  # f03e |   jne [0x155], 0x32a7, ${fail}:rel + PC
8e 20 e0 2a 39 30              # f048 |   imul [A], 0x3039, A*4 + B
ee e0 e0 f8 aa 00 0b 51 e7 df  # f04e |   jne [0xaa], 0x510b, ${fail}:rel + PC
b2 3e e4 fe f6 de fa           # f058 |   or [A*4 + -10], 0xfade + A, G
ee e0 e0 f8 9e 02 dd fb d6 df  # f05f |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
86 21 1c 21 85                 # f069 |   sub [A*2], -123, A*2
ee e0 e0 f8 54 01 31 fe c7 df  # f06e |   jne [0x154], 0xfe31, ${fail}:rel + PC
b2 2a 21 21                    # f078 |   or [A*4 + B], A*2, A*2
ee e0 e0 f8 63 03 54 01 b9 df  # f07c |   jne [0x363], 0x154, ${fail}:rel + PC
8e e0 20 3e 39 30 f6           # f086 |   imul [0x3039], A, A*4 + -10
ee e0 e0 f8 39 30 ec bc a8 df  # f08d |   jne [0x3039], 0xbcec, ${fail}:rel + PC
a6 3e e4 2a f6 de fa           # f097 |   ishr [A*4 + -10], 0xfade + A, A*4 + B
ee e0 e0 f8 9e 02 71 ff 97 df  # f09e |   jne [0x29e], 0xff71, ${fail}:rel + PC
ae e0 20 e4 39 30 de fa        # f0a8 |   and [0x3039], A, 0xfade + A
ee e0 e0 f8 39 30 88 00 85 df  # f0b0 |   jne [0x3039], 0x88, ${fail}:rel + PC
a6 20 fe fe                    # f0ba |   ishr [A], G, G
ee e0 1c f8 aa 00 0a 77 df     # f0be |   jne [0xaa], 0xa, ${fail}:rel + PC
8e 20 3e 20 f6                 # f0c7 |   imul [A], A*4 + -10, A
ee e0 e0 f8 aa 00 ec bc 69 df  # f0cc |   jne [0xaa], 0xbcec, ${fail}:rel + PC
b2 e0 3e fe 39 30 f6           # f0d6 |   or [0x3039], A*4 + -10, G
ee e0 e0 f8 39 30 df 03 58 df  # f0dd |   jne [0x3039], 0x3df, ${fail}:rel + PC
82 21 e0 e4 39 30 de fa        # f0e7 |   add [A*2], 0x3039, 0xfade + A
ee e0 e0 f8 54 01 c1 2b 46 df  # f0ef |   jne [0x154], 0x2bc1, ${fail}:rel + PC
82 e0 1c e4 39 30 85 de fa     # f0f9 |   add [0x3039], -123, 0xfade + A
ee e0 e0 f8 39 30 0d fb 33 df  # f102 |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
b2 fe 20 21                    # f10c |   or [G], A, A*2
ee e0 e0 f8 55 01 fe 01 25 df  # f110 |   jne [0x155], 0x1fe, ${fail}:rel + PC
aa 21 2a 21                    # f11a |   shl [A*2], A*4 + B, A*2
ee e0 e0 f8 54 01 30 36 17 df  # f11e |   jne [0x154], 0x3630, ${fail}:rel + PC
82 e0 2a e0 39 30 39 30        # f128 |   add [0x3039], A*4 + B, 0x3039
ee e0 e0 f8 39 30 9c 33 05 df  # f130 |   jne [0x3039], 0x339c, ${fail}:rel + PC
ae 2a 20 1c 85                 # f13a |   and [A*4 + B], A, -123
ee e0 e0 f8 63 03 80 00 f6 de  # f13f |   jne [0x363], 0x80, ${fail}:rel + PC
b6 e0 20 1c 39 30 85           # f149 |   xor [0x3039], A, -123
ee e0 e0 f8 39 30 2f ff e5 de  # f150 |   jne [0x3039], 0xff2f, ${fail}:rel + PC
ae 21 fe e0 39 30              # f15a |   and [A*2], G, 0x3039
ee e0 1c f8 54 01 11 d5 de     # f160 |   jne [0x154], 0x11, ${fail}:rel + PC
ae 3e fe 3e f6 f6              # f169 |   and [A*4 + -10], G, A*4 + -10
ee e0 1c f8 9e 02 14 c6 de     # f16f |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 3e 2a 2a f6                 # f178 |   mul [A*4 + -10], A*4 + B, A*4 + B
ee e0 e0 f8 9e 02 49 78 b8 de  # f17d |   jne [0x29e], 0x7849, ${fail}:rel + PC
82 20 3e e0 f6 39 30           # f187 |   add [A], A*4 + -10, 0x3039
ee e0 e0 f8 aa 00 d7 32 a7 de  # f18e |   jne [0xaa], 0x32d7, ${fail}:rel + PC
82 21 e0 3e 39 30 f6           # f198 |   add [A*2], 0x3039, A*4 + -10
ee e0 e0 f8 54 01 d7 32 96 de  # f19f |   jne [0x154], 0x32d7, ${fail}:rel + PC
b6 21 3e 3e f6 f6              # f1a9 |   xor [A*2], A*4 + -10, A*4 + -10
ee e0 00 f8 54 01 86 de        # f1af |   jne [0x154], 0, ${fail}:rel + PC
a6 e0 20 20 39 30              # f1b7 |   ishr [0x3039], A, A
ee e0 00 f8 39 30 78 de        # f1bd |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e0 3e 39 30 39 30 f6     # f1c5 |   ishr [0x3039], 0x3039, A*4 + -10
ee e0 00 f8 39 30 67 de        # f1ce |   jne [0x3039], 0, ${fail}:rel + PC
aa 20 1c 21 85                 # f1d6 |   shl [A], -123, A*2
ee e0 e0 f8 aa 00 50 f8 5a de  # f1db |   jne [0xaa], 0xf850, ${fail}:rel + PC
ae e0 21 e4 39 30 de fa        # f1e5 |   and [0x3039], A*2, 0xfade + A
ee e0 e0 f8 39 30 00 01 48 de  # f1ed |   jne [0x3039], 0x100, ${fail}:rel + PC
b2 3e 1c 20 f6 85              # f1f7 |   or [A*4 + -10], -123, A
ee e0 1c f8 9e 02 af 38 de     # f1fd |   jne [0x29e], 0xaf, ${fail}:rel + PC
8e 21 1c 20 85                 # f206 |   imul [A*2], -123, A
ee e0 e0 f8 54 01 52 ae 2a de  # f20b |   jne [0x154], 0xae52, ${fail}:rel + PC
8a 2a 2a 2a                    # f215 |   mul [A*4 + B], A*4 + B, A*4 + B
ee e0 e0 f8 63 03 49 78 1c de  # f219 |   jne [0x363], 0x7849, ${fail}:rel + PC
86 2a 2a e0 39 30              # f223 |   sub [A*4 + B], A*4 + B, 0x3039
ee e0 e0 f8 63 03 2a d3 0c de  # f229 |   jne [0x363], 0xd32a, ${fail}:rel + PC
ae fe 1c 21 85                 # f233 |   and [G], -123, A*2
ee e0 e0 f8 55 01 04 01 fd dd  # f238 |   jne [0x155], 0x104, ${fail}:rel + PC
8e 21 e4 1c de fa 85           # f242 |   imul [A*2], 0xfade + A, -123
ee e0 e0 f8 54 01 a8 25 ec dd  # f249 |   jne [0x154], 0x25a8, ${fail}:rel + PC
8a 21 21 e4 de fa              # f253 |   mul [A*2], A*2, 0xfade + A
ee e0 e0 f8 54 01 a0 10 dc dd  # f259 |   jne [0x154], 0x10a0, ${fail}:rel + PC
86 fe e0 fe 39 30              # f263 |   sub [G], 0x3039, G
ee e0 e0 f8 55 01 e4 2e cc dd  # f269 |   jne [0x155], 0x2ee4, ${fail}:rel + PC
62 20 1c 85                    # f273 |   mov [A], -123
ee e0 1c f8 aa 00 85 be dd     # f277 |   jne [0xaa], 0x85, ${fail}:rel + PC
62 3e 3e f6 f6                 # f280 |   mov [A*4 + -10], A*4 + -10
ee e0 e0 f8 9e 02 9e 02 b0 dd  # f285 |   jne [0x29e], 0x29e, ${fail}:rel + PC
62 21 2a                       # f28f |   mov [A*2], A*4 + B
ee e0 e0 f8 54 01 63 03 a3 dd  # f292 |   jne [0x154], 0x363, ${fail}:rel + PC
62 e0 1c 39 30 85              # f29c |   mov [0x3039], -123
ee e0 1c f8 39 30 85 93 dd     # f2a2 |   jne [0x3039], 0x85, ${fail}:rel + PC
62 fe 3e f6                    # f2ab |   mov [G], A*4 + -10
ee e0 e0 f8 55 01 9e 02 86 dd  # f2af |   jne [0x155], 0x29e, ${fail}:rel + PC
62 e0 fe 39 30                 # f2b9 |   mov [0x3039], G
ee e0 e0 f8 39 30 55 01 77 dd  # f2be |   jne [0x3039], 0x155, ${fail}:rel + PC
62 fe 21                       # f2c8 |   mov [G], A*2
ee e0 e0 f8 55 01 54 01 6a dd  # f2cb |   jne [0x155], 0x154, ${fail}:rel + PC
62 3e e4 f6 de fa              # f2d5 |   mov [A*4 + -10], 0xfade + A
ee e0 e0 f8 9e 02 88 fb 5a dd  # f2db |   jne [0x29e], 0xfb88, ${fail}:rel + PC
62 e0 e0 39 30 39 30           # f2e5 |   mov [0x3039], 0x3039
ee e0 e0 f8 39 30 39 30 49 dd  # f2ec |   jne [0x3039], 0x3039, ${fail}:rel + PC
62 3e fe f6                    # f2f6 |   mov [A*4 + -10], G
ee e0 e0 f8 9e 02 55 01 3b dd  # f2fa |   jne [0x29e], 0x155, ${fail}:rel + PC
62 20 fe                       # f304 |   mov [A], G
ee e0 e0 f8 aa 00 55 01 2e dd  # f307 |   jne [0xaa], 0x155, ${fail}:rel + PC
62 2a 2a                       # f311 |   mov [A*4 + B], A*4 + B
ee e0 e0 f8 63 03 63 03 21 dd  # f314 |   jne [0x363], 0x363, ${fail}:rel + PC
62 3e 2a f6                    # f31e |   mov [A*4 + -10], A*4 + B
ee e0 e0 f8 9e 02 63 03 13 dd  # f322 |   jne [0x29e], 0x363, ${fail}:rel + PC
62 2a 20                       # f32c |   mov [A*4 + B], A
ee e0 e0 f8 63 03 aa 00 06 dd  # f32f |   jne [0x363], 0xaa, ${fail}:rel + PC
62 3e 20 f6                    # f339 |   mov [A*4 + -10], A
ee e0 e0 f8 9e 02 aa 00 f8 dc  # f33d |   jne [0x29e], 0xaa, ${fail}:rel + PC
62 20 20                       # f347 |   mov [A], A
ee e0 e0 f8 aa 00 aa 00 eb dc  # f34a |   jne [0xaa], 0xaa, ${fail}:rel + PC
62 2a e4 de fa                 # f354 |   mov [A*4 + B], 0xfade + A
ee e0 e0 f8 63 03 88 fb dc dc  # f359 |   jne [0x363], 0xfb88, ${fail}:rel + PC
62 21 1c 85                    # f363 |   mov [A*2], -123
ee e0 1c f8 54 01 85 ce dc     # f367 |   jne [0x154], 0x85, ${fail}:rel + PC
62 2a e0 39 30                 # f370 |   mov [A*4 + B], 0x3039
ee e0 e0 f8 63 03 39 30 c0 dc  # f375 |   jne [0x363], 0x3039, ${fail}:rel + PC
62 3e 1c f6 85                 # f37f |   mov [A*4 + -10], -123
ee e0 1c f8 9e 02 85 b1 dc     # f384 |   jne [0x29e], 0x85, ${fail}:rel + PC
62 3e 21 f6                    # f38d |   mov [A*4 + -10], A*2
ee e0 e0 f8 9e 02 54 01 a4 dc  # f391 |   jne [0x29e], 0x154, ${fail}:rel + PC
62 21 3e f6                    # f39b |   mov [A*2], A*4 + -10
ee e0 e0 f8 54 01 9e 02 96 dc  # f39f |   jne [0x154], 0x29e, ${fail}:rel + PC
62 e0 21 39 30                 # f3a9 |   mov [0x3039], A*2
ee e0 e0 f8 39 30 54 01 87 dc  # f3ae |   jne [0x3039], 0x154, ${fail}:rel + PC
62 21 fe                       # f3b8 |   mov [A*2], G
ee e0 e0 f8 54 01 55 01 7a dc  # f3bb |   jne [0x154], 0x155, ${fail}:rel + PC
62 2a fe                       # f3c5 |   mov [A*4 + B], G
ee e0 e0 f8 63 03 55 01 6d dc  # f3c8 |   jne [0x363], 0x155, ${fail}:rel + PC
62 21 e4 de fa                 # f3d2 |   mov [A*2], 0xfade + A
ee e0 e0 f8 54 01 88 fb 5e dc  # f3d7 |   jne [0x154], 0xfb88, ${fail}:rel + PC
62 20 3e f6                    # f3e1 |   mov [A], A*4 + -10
ee e0 e0 f8 aa 00 9e 02 50 dc  # f3e5 |   jne [0xaa], 0x29e, ${fail}:rel + PC
62 e0 3e 39 30 f6              # f3ef |   mov [0x3039], A*4 + -10
ee e0 e0 f8 39 30 9e 02 40 dc  # f3f5 |   jne [0x3039], 0x29e, ${fail}:rel + PC
62 2a 3e f6                    # f3ff |   mov [A*4 + B], A*4 + -10
ee e0 e0 f8 63 03 9e 02 32 dc  # f403 |   jne [0x363], 0x29e, ${fail}:rel + PC
62 e0 e4 39 30 de fa           # f40d |   mov [0x3039], 0xfade + A
ee e0 e0 f8 39 30 88 fb 21 dc  # f414 |   jne [0x3039], 0xfb88, ${fail}:rel + PC
62 21 e0 39 30                 # f41e |   mov [A*2], 0x3039
ee e0 e0 f8 54 01 39 30 12 dc  # f423 |   jne [0x154], 0x3039, ${fail}:rel + PC
62 fe 1c 85                    # f42d |   mov [G], -123
ee e0 1c f8 55 01 85 04 dc     # f431 |   jne [0x155], 0x85, ${fail}:rel + PC
62 e0 2a 39 30                 # f43a |   mov [0x3039], A*4 + B
ee e0 e0 f8 39 30 63 03 f6 db  # f43f |   jne [0x3039], 0x363, ${fail}:rel + PC
62 fe e4 de fa                 # f449 |   mov [G], 0xfade + A
ee e0 e0 f8 55 01 88 fb e7 db  # f44e |   jne [0x155], 0xfb88, ${fail}:rel + PC
62 20 e0 39 30                 # f458 |   mov [A], 0x3039
ee e0 e0 f8 aa 00 39 30 d8 db  # f45d |   jne [0xaa], 0x3039, ${fail}:rel + PC
62 20 21                       # f467 |   mov [A], A*2
ee e0 e0 f8 aa 00 54 01 cb db  # f46a |   jne [0xaa], 0x154, ${fail}:rel + PC
62 3e e0 f6 39 30              # f474 |   mov [A*4 + -10], 0x3039
ee e0 e0 f8 9e 02 39 30 bb db  # f47a |   jne [0x29e], 0x3039, ${fail}:rel + PC
62 fe 20                       # f484 |   mov [G], A
ee e0 e0 f8 55 01 aa 00 ae db  # f487 |   jne [0x155], 0xaa, ${fail}:rel + PC
62 21 20                       # f491 |   mov [A*2], A
ee e0 e0 f8 54 01 aa 00 a1 db  # f494 |   jne [0x154], 0xaa, ${fail}:rel + PC
62 fe fe                       # f49e |   mov [G], G
ee e0 e0 f8 55 01 55 01 94 db  # f4a1 |   jne [0x155], 0x155, ${fail}:rel + PC
62 20 2a                       # f4ab |   mov [A], A*4 + B
ee e0 e0 f8 aa 00 63 03 87 db  # f4ae |   jne [0xaa], 0x363, ${fail}:rel + PC
62 2a 1c 85                    # f4b8 |   mov [A*4 + B], -123
ee e0 1c f8 63 03 85 79 db     # f4bc |   jne [0x363], 0x85, ${fail}:rel + PC
62 2a 21                       # f4c5 |   mov [A*4 + B], A*2
ee e0 e0 f8 63 03 54 01 6d db  # f4c8 |   jne [0x363], 0x154, ${fail}:rel + PC
62 e0 20 39 30                 # f4d2 |   mov [0x3039], A
ee e0 e0 f8 39 30 aa 00 5e db  # f4d7 |   jne [0x3039], 0xaa, ${fail}:rel + PC
62 fe e0 39 30                 # f4e1 |   mov [G], 0x3039
ee e0 e0 f8 55 01 39 30 4f db  # f4e6 |   jne [0x155], 0x3039, ${fail}:rel + PC
62 21 21                       # f4f0 |   mov [A*2], A*2
ee e0 e0 f8 54 01 54 01 42 db  # f4f3 |   jne [0x154], 0x154, ${fail}:rel + PC
62 fe 2a                       # f4fd |   mov [G], A*4 + B
ee e0 e0 f8 55 01 63 03 35 db  # f500 |   jne [0x155], 0x363, ${fail}:rel + PC
62 20 e4 de fa                 # f50a |   mov [A], 0xfade + A
ee e0 e0 f8 aa 00 88 fb 26 db  # f50f |   jne [0xaa], 0xfb88, ${fail}:rel + PC
e0 2a                          # f519 |   push A*4 + B
e4 80                          # f51b |   pop D
ec 80 e0 f8 63 03 18 db        # f51d |   jne D, 0x363, ${fail}:rel + PC
e0 1c 85                       # f525 |   push -123
e4 80                          # f528 |   pop D
ec 80 1c f8 85 0b db           # f52a |   jne D, 0x85, ${fail}:rel + PC
e0 fe                          # f531 |   push G
e4 80                          # f533 |   pop D
ec 80 e0 f8 55 01 00 db        # f535 |   jne D, 0x155, ${fail}:rel + PC
e0 3e f6                       # f53d |   push A*4 + -10
e4 80                          # f540 |   pop D
ec 80 e0 f8 9e 02 f3 da        # f542 |   jne D, 0x29e, ${fail}:rel + PC
e0 20                          # f54a |   push A
e4 80                          # f54c |   pop D
ec 80 e0 f8 aa 00 e7 da        # f54e |   jne D, 0xaa, ${fail}:rel + PC
e0 e4 de fa                    # f556 |   push 0xfade + A
e4 80                          # f55a |   pop D
ec 80 e0 f8 88 fb d9 da        # f55c |   jne D, 0xfb88, ${fail}:rel + PC
e0 21                          # f564 |   push A*2
e4 80                          # f566 |   pop D
ec 80 e0 f8 54 01 cd da        # f568 |   jne D, 0x154, ${fail}:rel + PC
e0 e0 39 30                    # f570 |   push 0x3039
e4 80                          # f574 |   pop D
ec 80 e0 f8 39 30 bf da        # f576 |   jne D, 0x3039, ${fail}:rel + PC
5c f8 10 00                    # f57e |   call ${_L_test_uop_get_arg_1}:rel + PC
ec 60 e0 f8 fe ad b3 da        # f582 |   jne C, 0xadfe, ${fail}:rel + PC
58 f8 0e 00                    # f58a |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                               #      | _L_test_uop_get_arg_1:
60 60 e0 fe ad                 # f58e |   mov C, 0xadfe
dc                             # f593 |   ret
58 f8 a1 da                    # f594 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_get_arg_2:
                               #      | test_uop_alu_2dd:
60 20 e0 cd ab                 # f598 |   mov A, 0xabcd
00 20 e0 ab cd                 # f59d |   add A, 0xcdab
ec 20 e0 f8 78 79 93 da        # f5a2 |   jne A, 0x7978, ${fail}:rel + PC
                               #      | test_uop_alu_2di:
60 20 e0 00 10                 # f5aa |   mov A, 0x1000
62 e0 e0 00 10 bc 0a           # f5af |   mov [0x1000], 0xabc
01 20 20                       # f5b6 |   add A, [A]
ec 20 e0 f8 bc 1a 7c da        # f5b9 |   jne A, 0x1abc, ${fail}:rel + PC
                               #      | test_uop_alu_2id:
62 e0 e0 00 10 34 12           # f5c1 |   mov [0x1000], 0x1234
02 e0 e0 00 10 21 43           # f5c8 |   add [0x1000], 0x4321
61 20 e0 00 10                 # f5cf |   mov A, [0x1000]
ec 20 e0 f8 55 55 61 da        # f5d4 |   jne A, 0x5555, ${fail}:rel + PC
                               #      | test_uop_alu_2ii:
62 e0 e0 00 10 34 12           # f5dc |   mov [0x1000], 0x1234
62 e0 e0 05 10 aa aa           # f5e3 |   mov [0x1005], 0xaaaa
03 e0 e0 05 10 00 10           # f5ea |   add [0x1005], [0x1000]
ee e0 e0 f8 05 10 de bc 44 da  # f5f1 |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                               #      | test_uop_alu_3dd:
60 20 e0 fe ab                 # f5fb |   mov A, 0xabfe
60 40 e0 55 55                 # f600 |   mov B, 0x5555
80 60 20 40                    # f605 |   add C, A, B
ec 20 e0 f8 fe ab 2c da        # f609 |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 24 da        # f611 |   jne B, 0x5555, ${fail}:rel + PC
ec 60 e0 f8 53 01 1c da        # f619 |   jne C, 0x153, ${fail}:rel + PC
                               #      | test_uop_alu_3di:
62 e0 e0 00 10 aa 12           # f621 |   mov [0x1000], 0x12aa
60 40 e0 de fa                 # f628 |   mov B, 0xfade
b5 20 e0 40 00 10              # f62d |   xor A, [0x1000], B
ee e0 e0 f8 00 10 aa 12 02 da  # f633 |   jne [0x1000], 0x12aa, ${fail}:rel + PC
ec 40 e0 f8 de fa f8 d9        # f63d |   jne B, 0xfade, ${fail}:rel + PC
ec 20 e0 f8 74 e8 f0 d9        # f645 |   jne A, 0xe874, ${fail}:rel + PC
                               #      | test_uop_alu_3id:
60 20 e0 fe ab                 # f64d |   mov A, 0xabfe
60 40 e0 55 55                 # f652 |   mov B, 0x5555
86 e0 20 40 00 10              # f657 |   sub [0x1000], A, B
ec 20 e0 f8 fe ab d8 d9        # f65d |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 d0 d9        # f665 |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 00 10 a9 56 c8 d9  # f66d |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                               #      | test_uop_alu_3ii:
62 e0 e0 00 10 fe ab           # f677 |   mov [0x1000], 0xabfe
60 40 e0 55 55                 # f67e |   mov B, 0x5555
af e0 e0 40 02 10 00 10        # f683 |   and [0x1002], [0x1000], B
ee e0 e0 f8 00 10 fe ab aa d9  # f68b |   jne [0x1000], 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 a0 d9        # f695 |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 02 10 54 01 98 d9  # f69d |   jne [0x1002], 0x154, ${fail}:rel + PC
                               #      | test_uop_alu_single_1dx:
60 20 e0 00 ff                 # f6a7 |   mov A, 0xff00
3c 20                          # f6ac |   not A
ec 20 e0 f8 ff 00 87 d9        # f6ae |   jne A, 0xff, ${fail}:rel + PC
                               #      | test_uop_alu_single_1ix:
62 1c e0 64 34 12              # f6b6 |   mov [0x64], 0x1234
3a 1c 64                       # f6bc |   neg [0x64]
ee 1c e0 f8 64 cc ed 76 d9     # f6bf |   jne [0x64], 0xedcc, ${fail}:rel + PC
                               #      | test_uop_alu_single_2dd:
60 40 e0 ff 00                 # f6c8 |   mov B, 0xff
bc 20 40                       # f6cd |   not A, B
ec 40 e0 f8 ff 00 65 d9        # f6d0 |   jne B, 0xff, ${fail}:rel + PC
ec 20 e0 f8 00 ff 5d d9        # f6d8 |   jne A, 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2di:
62 1c e0 64 34 12              # f6e0 |   mov [0x64], 0x1234
bd 20 1c 64                    # f6e6 |   not A, [0x64]
ee 1c e0 f8 64 34 12 4b d9     # f6ea |   jne [0x64], 0x1234, ${fail}:rel + PC
ec 20 e0 f8 cb ed 42 d9        # f6f3 |   jne A, 0xedcb, ${fail}:rel + PC
                               #      | test_uop_alu_single_2id:
60 40 e0 ff 00                 # f6fb |   mov B, 0xff
be 1c 40 64                    # f700 |   not [0x64], B
ec 40 e0 f8 ff 00 31 d9        # f704 |   jne B, 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff 29 d9     # f70c |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2ii:
62 1c e0 66 ff 00              # f715 |   mov [0x66], 0xff
bf 1c 1c 64 66                 # f71b |   not [0x64], [0x66]
ee 1c e0 f8 66 ff 00 15 d9     # f720 |   jne [0x66], 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff 0c d9     # f729 |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_cmp_dd:
60 40 1c 7b                    # f732 |   mov B, 0x7b
50 40 e0 c8 01                 # f736 |   cmp B, 0x1c8
4c 20                          # f73b |   getf A
ec 40 1c f8 7b f8 d8           # f73d |   jne B, 0x7b, ${fail}:rel + PC
ec 20 1c f8 0e f1 d8           # f744 |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_di:
62 1c 1c 64 85                 # f74b |   mov [0x64], -123
60 40 e0 c8 01                 # f750 |   mov B, 0x1c8
d1 40 1c 64                    # f755 |   icmp B, [0x64]
4c 20                          # f759 |   getf A
ec 40 e0 f8 c8 01 da d8        # f75b |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 32 d2 d8           # f763 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_cmp_id:
62 1c 1c 64 85                 # f76a |   mov [0x64], -123
60 40 e0 c8 01                 # f76f |   mov B, 0x1c8
d2 1c 40 64                    # f774 |   icmp [0x64], B
4c 20                          # f778 |   getf A
ec 40 e0 f8 c8 01 bb d8        # f77a |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 0e b3 d8           # f782 |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_ii:
62 1c 1c 64 85                 # f789 |   mov [0x64], -123
62 1c e0 66 38 fe              # f78e |   mov [0x66], 0xfe38
d3 1c 1c 64 66                 # f794 |   icmp [0x64], [0x66]
4c 20                          # f799 |   getf A
ee 1c 1c f8 64 85 9a d8        # f79b |   jne [0x64], -123, ${fail}:rel + PC
ee 1c e0 f8 66 38 fe 92 d8     # f7a3 |   jne [0x66], 0xfe38, ${fail}:rel + PC
ec 20 1c f8 32 89 d8           # f7ac |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_jmp_d:
60 20 e0 be f7                 # f7b3 |   mov A, ${_L_test_uop_jmp_d_okay}
58 20                          # f7b8 |   jmp A
58 f8 7b d8                    # f7ba |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_d_okay:
                               #      | test_uop_jmp_i:
62 1c e0 64 cb f7              # f7be |   mov [0x64], ${_L_test_uop_jmp_i_okay}
5a 1c 64                       # f7c4 |   jmp [0x64]
58 f8 6e d8                    # f7c7 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_i_okay:
ee 1c e0 f8 64 cb f7 6a d8     # f7cb |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_i:
62 1c e0 64 ea f7              # f7d4 |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
50 1c 1c 01 02                 # f7da |   cmp 0x1, 0x2
68 f8 56 d8                    # f7df |   jeq ${fail}:rel + PC
6e 1c 64                       # f7e3 |   jne [0x64]
58 f8 4f d8                    # f7e6 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_i_okay:
ee 1c e0 f8 64 ea f7 4b d8     # f7ea |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_d:
60 20 e0 07 f8                 # f7f3 |   mov A, ${_L_test_uop_jmp_cond_d_okay}
50 1c 1c 01 01                 # f7f8 |   cmp 0x1, 0x1
6c f8 38 d8                    # f7fd |   jne ${fail}:rel + PC
68 20                          # f801 |   jeq A
58 f8 32 d8                    # f803 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_d_okay:
ec 20 e0 f8 07 f8 2e d8        # f807 |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_3dd:
60 20 1c 7b                    # f80f |   mov A, 0x7b
ec 20 1c f8 7b 22 d8           # f813 |   jne A, 0x7b, ${fail}:rel + PC
e8 20 1c f8 7b 0b 00           # f81a |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
58 f8 14 d8                    # f821 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3dd_okay:
ec 20 1c f8 7b 10 d8           # f825 |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_jmp_3di:
60 20 1c 7b                    # f82c |   mov A, 0x7b
62 1c e0 64 41 01              # f830 |   mov [0x64], 0x141
e9 20 1c f8 64 ff d7           # f836 |   jeq A, [0x64], ${fail}:rel + PC
ed 20 1c f8 64 0b 00           # f83d |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
58 f8 f1 d7                    # f844 |   jmp ${fail}:rel + PC
                               #      | test_uop_jmp_3di_okay:
ec 20 1c f8 7b ed d7           # f848 |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 e6 d7     # f84f |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3id:
60 20 1c 7b                    # f858 |   mov A, 0x7b
62 1c e0 64 41 01              # f85c |   mov [0x64], 0x141
ea 1c 20 f8 64 d3 d7           # f862 |   jeq [0x64], A, ${fail}:rel + PC
ee 1c 20 f8 64 0b 00           # f869 |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
58 f8 c5 d7                    # f870 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3id_okay:
ec 20 1c f8 7b c1 d7           # f874 |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 ba d7     # f87b |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3ii:
62 e0 1c c8 00 7b              # f884 |   mov [0xc8], 0x7b
62 1c e0 64 41 01              # f88a |   mov [0x64], 0x141
eb 1c e0 f8 64 c8 00 a5 d7     # f890 |   jeq [0x64], [0xc8], ${fail}:rel + PC
ef 1c e0 f8 64 c8 00 0d 00     # f899 |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
58 f8 93 d7                    # f8a2 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3ii_okay:
ee e0 1c f8 c8 00 7b 8f d7     # f8a6 |   jne [0xc8], 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 86 d7     # f8af |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_mov_dd:
60 20 1c 7b                    # f8b8 |   mov A, 0x7b
ec 20 1c f8 7b 79 d7           # f8bc |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_mov_di:
62 1c 1c 64 da                 # f8c3 |   mov [0x64], 0xda
61 20 1c 64                    # f8c8 |   mov A, [0x64]
ec 20 1c f8 da 69 d7           # f8cc |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_mov_id:
62 1c 1c 64 ff                 # f8d3 |   mov [0x64], 0xff
ee 1c 1c f8 64 ff 5d d7        # f8d8 |   jne [0x64], 0xff, ${fail}:rel + PC
                               #      | test_uop_mov_ii:
60 20 1c 14                    # f8e0 |   mov A, 0x14
62 1c e0 78 fa fd              # f8e4 |   mov [0x78], 0xfdfa
63 1c 3c 64 64                 # f8ea |   mov [0x64], [A + 0x64]
ee 1c e0 f8 64 fa fd 46 d7     # f8ef |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                               #      | test_uop_bmov_dd:
64 20 e0 de af                 # f8f8 |   bmov A, 0xafde
ec 20 e0 f8 de 00 38 d7        # f8fd |   jne A, 0xde, ${fail}:rel + PC
64 20 e0 fa 00                 # f905 |   bmov A, 0xfa
ec 20 e0 f8 fa 00 2b d7        # f90a |   jne A, 0xfa, ${fail}:rel + PC
                               #      | test_uop_bmov_di:
62 1c 1c 64 da                 # f912 |   mov [0x64], 0xda
65 20 1c 64                    # f917 |   bmov A, [0x64]
ec 20 e0 f8 da 00 1a d7        # f91b |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_bmov_id:
62 1c e0 64 cd ab              # f923 |   mov [0x64], 0xabcd
62 1c e0 66 34 12              # f929 |   mov [0x66], 0x1234
62 1c e0 68 78 56              # f92f |   mov [0x68], 0x5678
66 1c e0 66 df 00              # f935 |   bmov [0x66], 0xdf
ee 1c e0 f8 64 cd ab fa d6     # f93b |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df 12 f1 d6     # f944 |   jne [0x66], 0x12df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 e8 d6     # f94d |   jne [0x68], 0x5678, ${fail}:rel + PC
66 1c e0 67 b8 00              # f956 |   bmov [0x67], 0xb8
ee 1c e0 f8 64 cd ab d9 d6     # f95c |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df b8 d0 d6     # f965 |   jne [0x66], 0xb8df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 c7 d6     # f96e |   jne [0x68], 0x5678, ${fail}:rel + PC
                               #      | test_uop_bmov_ii:
62 e0 e0 2c 01 df 00           # f977 |   mov [0x12c], 0xdf
62 e0 e0 2e 01 b8 00           # f97e |   mov [0x12e], 0xb8
62 e0 e0 c8 00 cd ab           # f985 |   mov [0xc8], 0xabcd
62 e0 e0 ca 00 34 12           # f98c |   mov [0xca], 0x1234
62 e0 e0 cc 00 78 56           # f993 |   mov [0xcc], 0x5678
67 e0 e0 ca 00 2c 01           # f99a |   bmov [0xca], [0x12c]
ee e0 e0 f8 c8 00 cd ab 94 d6  # f9a1 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df 12 8a d6  # f9ab |   jne [0xca], 0x12df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 80 d6  # f9b5 |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 76 d6  # f9bf |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 6c d6  # f9c9 |   jne [0x12e], 0xb8, ${fail}:rel + PC
67 e0 e0 cb 00 2e 01           # f9d3 |   bmov [0xcb], [0x12e]
ee e0 e0 f8 c8 00 cd ab 5b d6  # f9da |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df b8 51 d6  # f9e4 |   jne [0xca], 0xb8df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 47 d6  # f9ee |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 3d d6  # f9f8 |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 33 d6  # fa02 |   jne [0x12e], 0xb8, ${fail}:rel + PC
                               #      | test_uop_halt:
                               #      | test_uop_getf:
50 1c 1c 7b 2d                 # fa0c |   cmp 0x7b, 0x2d
4c 20                          # fa11 |   getf A
ec 20 1c f8 32 22 d6           # fa13 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_setf:
cc 1c ff                       # fa1a |   setf 0xff
4c 20                          # fa1d |   getf A
ec 20 1c f8 3f 16 d6           # fa1f |   jne A, 0x3f, ${fail}:rel + PC
                               #      | test_uop_call_d:
60 a0 e0 00 10                 # fa26 |   mov SP, 0x1000
60 40 e0 46 fa                 # fa2b |   mov B, ${_L_test_uop_call_d_fn}
5c 40                          # fa30 |   call B
ec 40 e0 f8 46 fa 03 d6        # fa32 |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
ec 20 e0 f8 fa 34 fb d5        # fa3a |   jne A, 0x34fa, ${fail}:rel + PC
58 f8 0a 00                    # fa42 |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                               #      | _L_test_uop_call_d_fn:
60 20 e0 fa 34                 # fa46 |   mov A, 0x34fa
dc                             # fa4b |   ret
                               #      | _L_test_uop_call_d_okay:
                               #      | test_uop_call_i:
60 a0 e0 00 10                 # fa4c |   mov SP, 0x1000
60 40 1c 64                    # fa51 |   mov B, 0x64
62 40 e0 70 fa                 # fa55 |   mov [B], ${_L_test_uop_call_i_fn}
5e 40                          # fa5a |   call [B]
ee 40 e0 f8 70 fa d9 d5        # fa5c |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
ec 20 e0 f8 d4 aa d1 d5        # fa64 |   jne A, 0xaad4, ${fail}:rel + PC
58 f8 0a 00                    # fa6c |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                               #      | _L_test_uop_call_i_fn:
60 20 e0 d4 aa                 # fa70 |   mov A, 0xaad4
dc                             # fa75 |   ret
                               #      | _L_test_uop_call_i_okay:
                               #      | test_uop_ret:
                               #      | test_uop_push_d:
60 a0 e0 00 10                 # fa76 |   mov SP, 0x1000
60 40 1c 64                    # fa7b |   mov B, 0x64
e0 40                          # fa7f |   push B
ec a0 e0 f8 fe 0f b4 d5        # fa81 |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 1c f8 fe 0f 64 ac d5     # fa89 |   jne [0xffe], 0x64, ${fail}:rel + PC
e4 60                          # fa92 |   pop C
ec 60 1c f8 64 a1 d5           # fa94 |   jne C, 0x64, ${fail}:rel + PC
                               #      | test_uop_push_i:
60 a0 e0 00 10                 # fa9b |   mov SP, 0x1000
60 40 1c 64                    # faa0 |   mov B, 0x64
62 40 e0 90 01                 # faa4 |   mov [B], 0x190
e2 40                          # faa9 |   push [B]
ec a0 e0 f8 fe 0f 8a d5        # faab |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 90 01 82 d5  # fab3 |   jne [0xffe], 0x190, ${fail}:rel + PC
e4 60                          # fabd |   pop C
ec 60 e0 f8 90 01 76 d5        # fabf |   jne C, 0x190, ${fail}:rel + PC
                               #      | test_uop_pop_d:
60 a0 e0 00 10                 # fac7 |   mov SP, 0x1000
e0 e0 da fa                    # facc |   push 0xfada
e4 20                          # fad0 |   pop A
ec 20 e0 f8 da fa 63 d5        # fad2 |   jne A, 0xfada, ${fail}:rel + PC
                               #      | test_uop_pop_i:
60 a0 e0 00 10                 # fada |   mov SP, 0x1000
e0 e0 da f2                    # fadf |   push 0xf2da
e6 1c 64                       # fae3 |   pop [0x64]
ee 1c e0 f8 64 da f2 4f d5     # fae6 |   jne [0x64], 0xf2da, ${fail}:rel + PC
                               #      | test_uop_mmap:
62 e0 e0 00 30 00 ff           # faef |   mov [0x3000], 0xff00
62 e0 e0 00 31 01 ff           # faf6 |   mov [0x3100], 0xff01
62 e0 e0 00 32 02 ff           # fafd |   mov [0x3200], 0xff02
62 e0 e0 00 40 00 dd           # fb04 |   mov [0x4000], 0xdd00
62 e0 e0 00 41 01 dd           # fb0b |   mov [0x4100], 0xdd01
62 e0 e0 00 42 02 dd           # fb12 |   mov [0x4200], 0xdd02
62 e0 e0 00 50 00 ee           # fb19 |   mov [0x5000], 0xee00
62 e0 e0 00 51 01 ee           # fb20 |   mov [0x5100], 0xee01
62 e0 e0 00 52 02 ee           # fb27 |   mov [0x5200], 0xee02
60 20 00                       # fb2e |   mov A, 0
60 40 e0 00 41                 # fb31 |   mov B, 0x4100
54 e0 e0 1c 00 31 ff 32 01     # fb36 |   mmap 0x3100, 0x32ff, 0x1
ee e0 e0 f8 00 31 01 dd f6 d4  # fb3f |   jne [0x3100], 0xdd01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 dd ec d4  # fb49 |   jne [0x3200], 0xdd02, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff e2 d4  # fb53 |   jne [0x3000], 0xff00, ${fail}:rel + PC
60 40 e0 00 51                 # fb5d |   mov B, 0x5100
54 e0 e0 1c 00 32 ff 32 02     # fb62 |   mmap 0x3200, 0x32ff, 0x2
ee e0 e0 f8 00 32 01 ee ca d4  # fb6b |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff c0 d4  # fb75 |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 dd b6 d4  # fb7f |   jne [0x3100], 0xdd01, ${fail}:rel + PC
d4 1c 01                       # fb89 |   umap 0x1
ee e0 e0 f8 00 31 01 ff a9 d4  # fb8c |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 01 ee 9f d4  # fb96 |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff 95 d4  # fba0 |   jne [0x3000], 0xff00, ${fail}:rel + PC
d4 1c 02                       # fbaa |   umap 0x2
ee e0 e0 f8 00 30 00 ff 88 d4  # fbad |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 ff 7e d4  # fbb7 |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 ff 74 d4  # fbc1 |   jne [0x3200], 0xff02, ${fail}:rel + PC
                               #      | test_uop_umap:
                               #      | test_aux_reg:
60 20 1c 01                    # fbcb |   mov A, 0x1
60 40 1c 02                    # fbcf |   mov B, 0x2
60 60 1c 03                    # fbd3 |   mov C, 0x3
60 80 1c 04                    # fbd7 |   mov D, 0x4
60 fc 1c 05                    # fbdb |   mov E, 0x5
60 fd 1c 06                    # fbdf |   mov F, 0x6
60 fe 1c 07                    # fbe3 |   mov G, 0x7
60 ff 1c 08                    # fbe7 |   mov H, 0x8
ec 20 1c f8 01 4a d4           # fbeb |   jne A, 0x1, ${fail}:rel + PC
ec 40 1c f8 02 43 d4           # fbf2 |   jne B, 0x2, ${fail}:rel + PC
ec 60 1c f8 03 3c d4           # fbf9 |   jne C, 0x3, ${fail}:rel + PC
ec 80 1c f8 04 35 d4           # fc00 |   jne D, 0x4, ${fail}:rel + PC
ec fc 1c f8 05 2e d4           # fc07 |   jne E, 0x5, ${fail}:rel + PC
ec fd 1c f8 06 27 d4           # fc0e |   jne F, 0x6, ${fail}:rel + PC
ec fe 1c f8 07 20 d4           # fc15 |   jne G, 0x7, ${fail}:rel + PC
ec ff 1c f8 08 19 d4           # fc1c |   jne H, 0x8, ${fail}:rel + PC
34 ff e0 00 ff                 # fc23 |   xor H, 0xff00
ec ff e0 f8 08 ff 0d d4        # fc28 |   jne H, 0xff08, ${fail}:rel + PC
60 20 ff                       # fc30 |   mov A, H
ec 20 e0 f8 08 ff 02 d4        # fc33 |   jne A, 0xff08, ${fail}:rel + PC
60 fc fe                       # fc3b |   mov E, G
ec fc 1c f8 07 f7 d3           # fc3e |   jne E, 0x7, ${fail}:rel + PC
ec ff e0 f8 08 ff f0 d3        # fc45 |   jne H, 0xff08, ${fail}:rel + PC
                               #      | test_call_ret:
60 a0 e0 00 10                 # fc4d |   mov SP, 0x1000
5c f8 77 00                    # fc52 |   call ${fn_test_target}:rel + PC
ec a0 e0 f8 00 10 df d3        # fc56 |   jne SP, 0x1000, ${fail}:rel + PC
60 20 1c 0a                    # fc5e |   mov A, 0xa
60 40 00                       # fc62 |   mov B, 0
60 60 00                       # fc65 |   mov C, 0
60 80 00                       # fc68 |   mov D, 0
5c f8 2d 00                    # fc6b |   call ${fn_recursive}:rel + PC
ec 20 00 f8 c6 d3              # fc6f |   jne A, 0, ${fail}:rel + PC
ec 40 e0 f8 3f cf c0 d3        # fc75 |   jne B, 0xcf3f, ${fail}:rel + PC
ec 60 1c f8 2d b8 d3           # fc7d |   jne C, 0x2d, ${fail}:rel + PC
ec 80 e0 f8 97 45 b1 d3        # fc84 |   jne D, 0x4597, ${fail}:rel + PC
ec a0 e0 f8 00 10 a9 d3        # fc8c |   jne SP, 0x1000, ${fail}:rel + PC
58 f8 42 00                    # fc94 |   jmp ${test_call_ret_end}:rel + PC
                               #      | fn_recursive:
04 20 1c 01                    # fc98 |   sub A, 0x1
5c f8 25 00                    # fc9c |   call ${fn_process_c}:rel + PC
e8 20 00 f8 1c 00              # fca0 |   jeq A, 0, ${fn_recursive_end}:rel + PC
5c f8 f2 ff                    # fca6 |   call ${fn_recursive}:rel + PC
00 80 60                       # fcaa |   add D, C
08 80 1c 03                    # fcad |   mul D, 0x3
00 40 80                       # fcb1 |   add B, D
e0 80                          # fcb4 |   push D
08 40 1c 05                    # fcb6 |   mul B, 0x5
e4 80                          # fcba |   pop D
                               #      | fn_recursive_end:
dc                             # fcbc |   ret
58 f8 78 d3                    # fcbd |   jmp ${fail}:rel + PC
                               #      | fn_process_c:
00 60 20                       # fcc1 |   add C, A
dc                             # fcc4 |   ret
58 f8 70 d3                    # fcc5 |   jmp ${fail}:rel + PC
                               #      | fn_test_target:
ec a0 e0 f8 fe 0f 6c d3        # fcc9 |   jne SP, 0xffe, ${fail}:rel + PC
dc                             # fcd1 |   ret
58 f8 63 d3                    # fcd2 |   jmp ${fail}:rel + PC
                               #      | test_call_ret_end:
                               #      | test_mem_access:
62 e0 1c 00 01 ed              # fcd6 |   mov [0x100], 0xed
ee e0 e0 f8 00 01 aa 00 0e 00  # fcdc |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
58 f8 4f d3                    # fce6 |   jmp ${fail}:rel + PC
                               #      | test_mem_access_check_jmp:
62 e0 00 00 10                 # fcea |   mov [0x1000], 0
60 a0 e0 00 10                 # fcef |   mov SP, 0x1000
ee a0 00 f8 41 d3              # fcf4 |   jne [SP], 0, ${fail}:rel + PC
e0 00                          # fcfa |   push 0
e0 00                          # fcfc |   push 0
e0 00                          # fcfe |   push 0
e4 20                          # fd00 |   pop A
e4 20                          # fd02 |   pop A
e4 20                          # fd04 |   pop A
ec a0 e0 f8 00 10 2f d3        # fd06 |   jne SP, 0x1000, ${fail}:rel + PC
ec 20 00 f8 27 d3              # fd0e |   jne A, 0, ${fail}:rel + PC
e0 e0 02 01                    # fd14 |   push 0x102
ec a0 e0 f8 fe 0f 1d d3        # fd18 |   jne SP, 0xffe, ${fail}:rel + PC
e0 e0 04 03                    # fd20 |   push 0x304
ec a0 e0 f8 fc 0f 11 d3        # fd24 |   jne SP, 0xffc, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 02 01 09 d3  # fd2c |   jne [0xffe], 0x102, ${fail}:rel + PC
ee e0 e0 f8 fc 0f 04 03 ff d2  # fd36 |   jne [0xffc], 0x304, ${fail}:rel + PC
ee e0 e0 f8 fb 0f 00 04 f5 d2  # fd40 |   jne [0xffb], 0x400, ${fail}:rel + PC
ee e0 e0 f8 fd 0f 03 02 eb d2  # fd4a |   jne [0xffd], 0x203, ${fail}:rel + PC
ee e0 1c f8 ff 0f 01 e1 d2     # fd54 |   jne [0xfff], 0x1, ${fail}:rel + PC
e4 20                          # fd5d |   pop A
ec 20 e0 f8 04 03 d6 d2        # fd5f |   jne A, 0x304, ${fail}:rel + PC
ec a0 e0 f8 fe 0f ce d2        # fd67 |   jne SP, 0xffe, ${fail}:rel + PC
e4 20                          # fd6f |   pop A
ec 20 e0 f8 02 01 c4 d2        # fd71 |   jne A, 0x102, ${fail}:rel + PC
ec a0 e0 f8 00 10 bc d2        # fd79 |   jne SP, 0x1000, ${fail}:rel + PC
                               #      | test_cmp:
cc 1c ff                       # fd81 |   setf 0xff
4c 20                          # fd84 |   getf A
ec 20 1c f8 3f af d2           # fd86 |   jne A, 0x3f, ${fail}:rel + PC
cc e0 ab ab                    # fd8d |   setf 0xabab
4c 20                          # fd91 |   getf A
ec 20 1c f8 2b a2 d2           # fd93 |   jne A, 0x2b, ${fail}:rel + PC
50 1c 1c ab 2b                 # fd9a |   cmp 0xab, 0x2b
4c 20                          # fd9f |   getf A
ec 20 1c f8 32 94 d2           # fda1 |   jne A, 0x32, ${fail}:rel + PC
50 1c 1c 2b ab                 # fda8 |   cmp 0x2b, 0xab
4c 20                          # fdad |   getf A
ec 20 1c f8 0e 86 d2           # fdaf |   jne A, 0xe, ${fail}:rel + PC
50 1c 1c ab ab                 # fdb6 |   cmp 0xab, 0xab
4c 20                          # fdbb |   getf A
ec 20 1c f8 29 78 d2           # fdbd |   jne A, 0x29, ${fail}:rel + PC
d0 1c 1c ab 2b                 # fdc4 |   icmp 0xab, 0x2b
4c 20                          # fdc9 |   getf A
ec 20 1c f8 0e 6a d2           # fdcb |   jne A, 0xe, ${fail}:rel + PC
d0 1c 1c 2b ab                 # fdd2 |   icmp 0x2b, 0xab
4c 20                          # fdd7 |   getf A
ec 20 1c f8 32 5c d2           # fdd9 |   jne A, 0x32, ${fail}:rel + PC
d0 1c 1c ab ab                 # fde0 |   icmp 0xab, 0xab
4c 20                          # fde5 |   getf A
ec 20 1c f8 29 4e d2           # fde7 |   jne A, 0x29, ${fail}:rel + PC
                               #      | test_cmp_direct:
60 60 1c ab                    # fdee |   mov C, 0xab
60 80 1c 2b                    # fdf2 |   mov D, 0x2b
50 60 80                       # fdf6 |   cmp C, D
4c 20                          # fdf9 |   getf A
ec 20 1c f8 32 3a d2           # fdfb |   jne A, 0x32, ${fail}:rel + PC
50 80 60                       # fe02 |   cmp D, C
4c 20                          # fe05 |   getf A
ec 20 1c f8 0e 2e d2           # fe07 |   jne A, 0xe, ${fail}:rel + PC
50 60 60                       # fe0e |   cmp C, C
4c 20                          # fe11 |   getf A
ec 20 1c f8 29 22 d2           # fe13 |   jne A, 0x29, ${fail}:rel + PC
d0 60 80                       # fe1a |   icmp C, D
4c 20                          # fe1d |   getf A
ec 20 1c f8 0e 16 d2           # fe1f |   jne A, 0xe, ${fail}:rel + PC
d0 80 60                       # fe26 |   icmp D, C
4c 20                          # fe29 |   getf A
ec 20 1c f8 32 0a d2           # fe2b |   jne A, 0x32, ${fail}:rel + PC
d0 60 60                       # fe32 |   icmp C, C
4c 20                          # fe35 |   getf A
ec 20 1c f8 29 fe d1           # fe37 |   jne A, 0x29, ${fail}:rel + PC
                               #      | end_of_test:
60 20 e0 ad de                 # fe3e |   mov A, 0xdead
60 40 e0 ef be                 # fe43 |   mov B, 0xbeef
88 60 20 40                    # fe48 |   mul C, A, B
58 f8 ee d1                    # fe4c |   jmp ${success}:rel + PC
dc                             # fe50 |   ret
                               #      | end_fn_self_test:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x0000
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
