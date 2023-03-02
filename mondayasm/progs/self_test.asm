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
b8 40 e0 30 d2                 # d52b |   neg B, 0xd230
ec 40 e0 f8 d0 2d 05 fb        # d530 |   jne B, 0x2dd0, ${fail}:rel + PC
bc 40 e0 30 d2                 # d538 |   not B, 0xd230
ec 40 e0 f8 cf 2d f8 fa        # d53d |   jne B, 0x2dcf, ${fail}:rel + PC
c0 40 e0 30 d2                 # d545 |   bool B, 0xd230
ec 40 1c f8 01 eb fa           # d54a |   jne B, 0x1, ${fail}:rel + PC
c4 40 e0 30 d2                 # d551 |   inc B, 0xd230
ec 40 e0 f8 31 d2 df fa        # d556 |   jne B, 0xd231, ${fail}:rel + PC
c8 40 e0 30 d2                 # d55e |   dec B, 0xd230
ec 40 e0 f8 2f d2 d2 fa        # d563 |   jne B, 0xd22f, ${fail}:rel + PC
60 60 e0 ad 00                 # d56b |   mov C, 0xad
60 80 e0 37 da                 # d570 |   mov D, 0xda37
80 40 60 80                    # d575 |   add B, C, D
ec 40 e0 f8 e4 da bc fa        # d579 |   jne B, 0xdae4, ${fail}:rel + PC
60 60 e0 ad 00                 # d581 |   mov C, 0xad
60 80 e0 37 da                 # d586 |   mov D, 0xda37
84 40 60 80                    # d58b |   sub B, C, D
ec 40 e0 f8 76 26 a6 fa        # d58f |   jne B, 0x2676, ${fail}:rel + PC
60 60 e0 ad 00                 # d597 |   mov C, 0xad
60 80 e0 37 da                 # d59c |   mov D, 0xda37
88 40 60 80                    # d5a1 |   mul B, C, D
ec 40 e0 f8 2b 77 90 fa        # d5a5 |   jne B, 0x772b, ${fail}:rel + PC
ec ff e0 f8 93 00 88 fa        # d5ad |   jne H, 0x93, ${fail}:rel + PC
60 60 e0 ad 00                 # d5b5 |   mov C, 0xad
60 80 e0 37 da                 # d5ba |   mov D, 0xda37
8c 40 60 80                    # d5bf |   imul B, C, D
ec 40 e0 f8 2b 77 72 fa        # d5c3 |   jne B, 0x772b, ${fail}:rel + PC
ec ff 1c f8 e6 6a fa           # d5cb |   jne H, 0xe6, ${fail}:rel + PC
60 60 e0 ad 00                 # d5d2 |   mov C, 0xad
60 80 e0 37 da                 # d5d7 |   mov D, 0xda37
a0 40 60 80                    # d5dc |   shr B, C, D
ec 40 1c f8 01 55 fa           # d5e0 |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad 00                 # d5e7 |   mov C, 0xad
60 80 e0 37 da                 # d5ec |   mov D, 0xda37
a4 40 60 80                    # d5f1 |   ishr B, C, D
ec 40 1c f8 01 40 fa           # d5f5 |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad 00                 # d5fc |   mov C, 0xad
60 80 e0 37 da                 # d601 |   mov D, 0xda37
a8 40 60 80                    # d606 |   shl B, C, D
ec 40 e0 f8 80 56 2b fa        # d60a |   jne B, 0x5680, ${fail}:rel + PC
60 60 e0 ad 00                 # d612 |   mov C, 0xad
60 80 e0 37 da                 # d617 |   mov D, 0xda37
ac 40 60 80                    # d61c |   and B, C, D
ec 40 1c f8 25 15 fa           # d620 |   jne B, 0x25, ${fail}:rel + PC
60 60 e0 ad 00                 # d627 |   mov C, 0xad
60 80 e0 37 da                 # d62c |   mov D, 0xda37
b0 40 60 80                    # d631 |   or B, C, D
ec 40 e0 f8 bf da 00 fa        # d635 |   jne B, 0xdabf, ${fail}:rel + PC
60 60 e0 ad 00                 # d63d |   mov C, 0xad
60 80 e0 37 da                 # d642 |   mov D, 0xda37
b4 40 60 80                    # d647 |   xor B, C, D
ec 40 e0 f8 9a da ea f9        # d64b |   jne B, 0xda9a, ${fail}:rel + PC
b8 40 e0 ad 00                 # d653 |   neg B, 0xad
ec 40 e0 f8 53 ff dd f9        # d658 |   jne B, 0xff53, ${fail}:rel + PC
bc 40 e0 ad 00                 # d660 |   not B, 0xad
ec 40 e0 f8 52 ff d0 f9        # d665 |   jne B, 0xff52, ${fail}:rel + PC
c0 40 e0 ad 00                 # d66d |   bool B, 0xad
ec 40 1c f8 01 c3 f9           # d672 |   jne B, 0x1, ${fail}:rel + PC
c4 40 e0 ad 00                 # d679 |   inc B, 0xad
ec 40 e0 f8 ae 00 b7 f9        # d67e |   jne B, 0xae, ${fail}:rel + PC
c8 40 e0 ad 00                 # d686 |   dec B, 0xad
ec 40 e0 f8 ac 00 aa f9        # d68b |   jne B, 0xac, ${fail}:rel + PC
60 60 e0 ad f0                 # d693 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d698 |   mov D, 0x2a3f
60 40 60                       # d69d |   mov B, C
00 40 80                       # d6a0 |   add B, D
ec 40 e0 f8 ec 1a 92 f9        # d6a3 |   jne B, 0x1aec, ${fail}:rel + PC
60 60 e0 ad f0                 # d6ab |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d6b0 |   mov D, 0x2a3f
60 40 60                       # d6b5 |   mov B, C
04 40 80                       # d6b8 |   sub B, D
ec 40 e0 f8 6e c6 7a f9        # d6bb |   jne B, 0xc66e, ${fail}:rel + PC
60 60 e0 ad f0                 # d6c3 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d6c8 |   mov D, 0x2a3f
60 40 60                       # d6cd |   mov B, C
08 40 80                       # d6d0 |   mul B, D
ec 40 e0 f8 93 9c 62 f9        # d6d3 |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 b7 27 5a f9        # d6db |   jne H, 0x27b7, ${fail}:rel + PC
60 60 e0 ad f0                 # d6e3 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d6e8 |   mov D, 0x2a3f
60 40 60                       # d6ed |   mov B, C
0c 40 80                       # d6f0 |   imul B, D
ec 40 e0 f8 93 9c 42 f9        # d6f3 |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 78 fd 3a f9        # d6fb |   jne H, 0xfd78, ${fail}:rel + PC
60 60 e0 ad f0                 # d703 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d708 |   mov D, 0x2a3f
60 40 60                       # d70d |   mov B, C
20 40 80                       # d710 |   shr B, D
ec 40 1c f8 01 22 f9           # d713 |   jne B, 0x1, ${fail}:rel + PC
60 60 e0 ad f0                 # d71a |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d71f |   mov D, 0x2a3f
60 40 60                       # d724 |   mov B, C
24 40 80                       # d727 |   ishr B, D
ec 40 1c f8 ff 0b f9           # d72a |   jne B, 0xff, ${fail}:rel + PC
60 60 e0 ad f0                 # d731 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d736 |   mov D, 0x2a3f
60 40 60                       # d73b |   mov B, C
28 40 80                       # d73e |   shl B, D
ec 40 e0 f8 00 80 f4 f8        # d741 |   jne B, 0x8000, ${fail}:rel + PC
60 60 e0 ad f0                 # d749 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d74e |   mov D, 0x2a3f
60 40 60                       # d753 |   mov B, C
2c 40 80                       # d756 |   and B, D
ec 40 e0 f8 2d 20 dc f8        # d759 |   jne B, 0x202d, ${fail}:rel + PC
60 60 e0 ad f0                 # d761 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d766 |   mov D, 0x2a3f
60 40 60                       # d76b |   mov B, C
30 40 80                       # d76e |   or B, D
ec 40 e0 f8 bf fa c4 f8        # d771 |   jne B, 0xfabf, ${fail}:rel + PC
60 60 e0 ad f0                 # d779 |   mov C, 0xf0ad
60 80 e0 3f 2a                 # d77e |   mov D, 0x2a3f
60 40 60                       # d783 |   mov B, C
34 40 80                       # d786 |   xor B, D
ec 40 e0 f8 92 da ac f8        # d789 |   jne B, 0xda92, ${fail}:rel + PC
60 40 e0 ad f0                 # d791 |   mov B, 0xf0ad
38 40                          # d796 |   neg B
ec 40 e0 f8 53 0f 9d f8        # d798 |   jne B, 0xf53, ${fail}:rel + PC
60 40 e0 ad f0                 # d7a0 |   mov B, 0xf0ad
3c 40                          # d7a5 |   not B
ec 40 e0 f8 52 0f 8e f8        # d7a7 |   jne B, 0xf52, ${fail}:rel + PC
60 40 e0 ad f0                 # d7af |   mov B, 0xf0ad
40 40                          # d7b4 |   bool B
ec 40 1c f8 01 7f f8           # d7b6 |   jne B, 0x1, ${fail}:rel + PC
60 40 e0 ad f0                 # d7bd |   mov B, 0xf0ad
44 40                          # d7c2 |   inc B
ec 40 e0 f8 ae f0 71 f8        # d7c4 |   jne B, 0xf0ae, ${fail}:rel + PC
60 40 e0 ad f0                 # d7cc |   mov B, 0xf0ad
48 40                          # d7d1 |   dec B
ec 40 e0 f8 ac f0 62 f8        # d7d3 |   jne B, 0xf0ac, ${fail}:rel + PC
60 60 00                       # d7db |   mov C, 0
60 80 e0 ad de                 # d7de |   mov D, 0xdead
60 40 60                       # d7e3 |   mov B, C
00 40 80                       # d7e6 |   add B, D
ec 40 e0 f8 ad de 4c f8        # d7e9 |   jne B, 0xdead, ${fail}:rel + PC
60 60 00                       # d7f1 |   mov C, 0
60 80 e0 ad de                 # d7f4 |   mov D, 0xdead
60 40 60                       # d7f9 |   mov B, C
04 40 80                       # d7fc |   sub B, D
ec 40 e0 f8 53 21 36 f8        # d7ff |   jne B, 0x2153, ${fail}:rel + PC
60 60 00                       # d807 |   mov C, 0
60 80 e0 ad de                 # d80a |   mov D, 0xdead
60 40 60                       # d80f |   mov B, C
08 40 80                       # d812 |   mul B, D
ec 40 00 f8 20 f8              # d815 |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 1a f8              # d81b |   jne H, 0, ${fail}:rel + PC
60 60 00                       # d821 |   mov C, 0
60 80 e0 ad de                 # d824 |   mov D, 0xdead
60 40 60                       # d829 |   mov B, C
0c 40 80                       # d82c |   imul B, D
ec 40 00 f8 06 f8              # d82f |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 00 f8              # d835 |   jne H, 0, ${fail}:rel + PC
60 60 00                       # d83b |   mov C, 0
60 80 e0 ad de                 # d83e |   mov D, 0xdead
60 40 60                       # d843 |   mov B, C
20 40 80                       # d846 |   shr B, D
ec 40 00 f8 ec f7              # d849 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # d84f |   mov C, 0
60 80 e0 ad de                 # d852 |   mov D, 0xdead
60 40 60                       # d857 |   mov B, C
24 40 80                       # d85a |   ishr B, D
ec 40 00 f8 d8 f7              # d85d |   jne B, 0, ${fail}:rel + PC
60 60 00                       # d863 |   mov C, 0
60 80 e0 ad de                 # d866 |   mov D, 0xdead
60 40 60                       # d86b |   mov B, C
28 40 80                       # d86e |   shl B, D
ec 40 00 f8 c4 f7              # d871 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # d877 |   mov C, 0
60 80 e0 ad de                 # d87a |   mov D, 0xdead
60 40 60                       # d87f |   mov B, C
2c 40 80                       # d882 |   and B, D
ec 40 00 f8 b0 f7              # d885 |   jne B, 0, ${fail}:rel + PC
60 60 00                       # d88b |   mov C, 0
60 80 e0 ad de                 # d88e |   mov D, 0xdead
60 40 60                       # d893 |   mov B, C
30 40 80                       # d896 |   or B, D
ec 40 e0 f8 ad de 9c f7        # d899 |   jne B, 0xdead, ${fail}:rel + PC
60 60 00                       # d8a1 |   mov C, 0
60 80 e0 ad de                 # d8a4 |   mov D, 0xdead
60 40 60                       # d8a9 |   mov B, C
34 40 80                       # d8ac |   xor B, D
ec 40 e0 f8 ad de 86 f7        # d8af |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # d8b7 |   mov B, 0
38 40                          # d8ba |   neg B
ec 40 00 f8 79 f7              # d8bc |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d8c2 |   mov B, 0
3c 40                          # d8c5 |   not B
ec 40 1c f8 ff 6e f7           # d8c7 |   jne B, 0xff, ${fail}:rel + PC
60 40 00                       # d8ce |   mov B, 0
40 40                          # d8d1 |   bool B
ec 40 00 f8 62 f7              # d8d3 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d8d9 |   mov B, 0
44 40                          # d8dc |   inc B
ec 40 1c f8 01 57 f7           # d8de |   jne B, 0x1, ${fail}:rel + PC
60 40 00                       # d8e5 |   mov B, 0
48 40                          # d8e8 |   dec B
ec 40 1c f8 ff 4b f7           # d8ea |   jne B, 0xff, ${fail}:rel + PC
                               #      | jmp_test:
e8 1c 1c f8 ab 2b 44 f7        # d8f1 |   jeq 0xab, 0x2b, ${fail}:rel + PC
ec 1c 1c f8 ab 2b 0c 00        # d8f9 |   jne 0xab, 0x2b, ${_L_test_jmp_1}:rel + PC
58 f8 34 f7                    # d901 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_1:
f0 1c 1c f8 ab 2b 30 f7        # d905 |   jlt 0xab, 0x2b, ${fail}:rel + PC
f4 1c 1c f8 ab 2b 28 f7        # d90d |   jle 0xab, 0x2b, ${fail}:rel + PC
f8 1c 1c f8 ab 2b 0c 00        # d915 |   jgt 0xab, 0x2b, ${_L_test_jmp_2}:rel + PC
58 f8 18 f7                    # d91d |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_2:
fc 1c 1c f8 ab 2b 0c 00        # d921 |   jge 0xab, 0x2b, ${_L_test_jmp_3}:rel + PC
58 f8 0c f7                    # d929 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_3:
50 1c 1c ab 2b                 # d92d |   cmp 0xab, 0x2b
68 f8 03 f7                    # d932 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d936 |   jne ${_L_test_jmp_4}:rel + PC
58 f8 fb f6                    # d93a |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_4:
70 f8 f7 f6                    # d93e |   jlt ${fail}:rel + PC
74 f8 f3 f6                    # d942 |   jle ${fail}:rel + PC
78 f8 08 00                    # d946 |   jgt ${_L_test_jmp_5}:rel + PC
58 f8 eb f6                    # d94a |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_5:
7c f8 08 00                    # d94e |   jge ${_L_test_jmp_6}:rel + PC
58 f8 e3 f6                    # d952 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_6:
d0 1c 1c ab 2b                 # d956 |   icmp 0xab, 0x2b
68 f8 da f6                    # d95b |   jeq ${fail}:rel + PC
6c f8 08 00                    # d95f |   jne ${_L_test_jmp_7}:rel + PC
58 f8 d2 f6                    # d963 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_7:
70 f8 08 00                    # d967 |   jlt ${_L_test_jmp_8}:rel + PC
58 f8 ca f6                    # d96b |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_8:
74 f8 08 00                    # d96f |   jle ${_L_test_jmp_9}:rel + PC
58 f8 c2 f6                    # d973 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_9:
78 f8 be f6                    # d977 |   jgt ${fail}:rel + PC
7c f8 ba f6                    # d97b |   jge ${fail}:rel + PC
e8 1c 1c f8 2b ab b6 f6        # d97f |   jeq 0x2b, 0xab, ${fail}:rel + PC
ec 1c 1c f8 2b ab 0c 00        # d987 |   jne 0x2b, 0xab, ${_L_test_jmp_10}:rel + PC
58 f8 a6 f6                    # d98f |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_10:
f0 1c 1c f8 2b ab 0c 00        # d993 |   jlt 0x2b, 0xab, ${_L_test_jmp_11}:rel + PC
58 f8 9a f6                    # d99b |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_11:
f4 1c 1c f8 2b ab 0c 00        # d99f |   jle 0x2b, 0xab, ${_L_test_jmp_12}:rel + PC
58 f8 8e f6                    # d9a7 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_12:
f8 1c 1c f8 2b ab 8a f6        # d9ab |   jgt 0x2b, 0xab, ${fail}:rel + PC
fc 1c 1c f8 2b ab 82 f6        # d9b3 |   jge 0x2b, 0xab, ${fail}:rel + PC
50 1c 1c 2b ab                 # d9bb |   cmp 0x2b, 0xab
68 f8 75 f6                    # d9c0 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d9c4 |   jne ${_L_test_jmp_13}:rel + PC
58 f8 6d f6                    # d9c8 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_13:
70 f8 08 00                    # d9cc |   jlt ${_L_test_jmp_14}:rel + PC
58 f8 65 f6                    # d9d0 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_14:
74 f8 08 00                    # d9d4 |   jle ${_L_test_jmp_15}:rel + PC
58 f8 5d f6                    # d9d8 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_15:
78 f8 59 f6                    # d9dc |   jgt ${fail}:rel + PC
7c f8 55 f6                    # d9e0 |   jge ${fail}:rel + PC
d0 1c 1c 2b ab                 # d9e4 |   icmp 0x2b, 0xab
68 f8 4c f6                    # d9e9 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d9ed |   jne ${_L_test_jmp_16}:rel + PC
58 f8 44 f6                    # d9f1 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_16:
70 f8 40 f6                    # d9f5 |   jlt ${fail}:rel + PC
74 f8 3c f6                    # d9f9 |   jle ${fail}:rel + PC
78 f8 08 00                    # d9fd |   jgt ${_L_test_jmp_17}:rel + PC
58 f8 34 f6                    # da01 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_17:
7c f8 08 00                    # da05 |   jge ${_L_test_jmp_18}:rel + PC
58 f8 2c f6                    # da09 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_18:
e8 1c 1c f8 ab ab 0c 00        # da0d |   jeq 0xab, 0xab, ${_L_test_jmp_19}:rel + PC
58 f8 20 f6                    # da15 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_19:
ec 1c 1c f8 ab ab 1c f6        # da19 |   jne 0xab, 0xab, ${fail}:rel + PC
f0 1c 1c f8 ab ab 14 f6        # da21 |   jlt 0xab, 0xab, ${fail}:rel + PC
f4 1c 1c f8 ab ab 0c 00        # da29 |   jle 0xab, 0xab, ${_L_test_jmp_20}:rel + PC
58 f8 04 f6                    # da31 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_20:
f8 1c 1c f8 ab ab 00 f6        # da35 |   jgt 0xab, 0xab, ${fail}:rel + PC
fc 1c 1c f8 ab ab 0c 00        # da3d |   jge 0xab, 0xab, ${_L_test_jmp_21}:rel + PC
58 f8 f0 f5                    # da45 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_21:
50 1c 1c ab ab                 # da49 |   cmp 0xab, 0xab
68 f8 08 00                    # da4e |   jeq ${_L_test_jmp_22}:rel + PC
58 f8 e3 f5                    # da52 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_22:
6c f8 df f5                    # da56 |   jne ${fail}:rel + PC
70 f8 db f5                    # da5a |   jlt ${fail}:rel + PC
74 f8 08 00                    # da5e |   jle ${_L_test_jmp_23}:rel + PC
58 f8 d3 f5                    # da62 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_23:
78 f8 cf f5                    # da66 |   jgt ${fail}:rel + PC
7c f8 08 00                    # da6a |   jge ${_L_test_jmp_24}:rel + PC
58 f8 c7 f5                    # da6e |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_24:
d0 1c 1c ab ab                 # da72 |   icmp 0xab, 0xab
68 f8 08 00                    # da77 |   jeq ${_L_test_jmp_25}:rel + PC
58 f8 ba f5                    # da7b |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_25:
6c f8 b6 f5                    # da7f |   jne ${fail}:rel + PC
70 f8 b2 f5                    # da83 |   jlt ${fail}:rel + PC
74 f8 08 00                    # da87 |   jle ${_L_test_jmp_26}:rel + PC
58 f8 aa f5                    # da8b |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_26:
78 f8 a6 f5                    # da8f |   jgt ${fail}:rel + PC
7c f8 08 00                    # da93 |   jge ${_L_test_jmp_27}:rel + PC
58 f8 9e f5                    # da97 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_27:
                               #      | test_uop_get_arg:
60 a0 e0 00 70                 # da9b |   mov SP, 0x7000
60 20 e0 aa 00                 # daa0 |   mov A, 0xaa
60 40 e0 bb 00                 # daa5 |   mov B, 0xbb
60 fe e0 55 01                 # daaa |   mov G, 0x155
b6 e0 1c fe 39 30 85           # daaf |   xor [0x3039], -123, G
ee e0 e0 f8 39 30 d0 fe 7f f5  # dab6 |   jne [0x3039], 0xfed0, ${fail}:rel + PC
ae 3e fe 21 f6                 # dac0 |   and [A*4 + -10], G, A*2
ee e0 e0 f8 9e 02 54 01 70 f5  # dac5 |   jne [0x29e], 0x154, ${fail}:rel + PC
86 21 e4 3e de fa f6           # dacf |   sub [A*2], 0xfade + A, A*4 + -10
ee e0 e0 f8 54 01 ea f8 5f f5  # dad6 |   jne [0x154], 0xf8ea, ${fail}:rel + PC
a6 e0 20 21 39 30              # dae0 |   ishr [0x3039], A, A*2
ee e0 1c f8 39 30 0a 4f f5     # dae6 |   jne [0x3039], 0xa, ${fail}:rel + PC
aa fe 2a 3e f6                 # daef |   shl [G], A*4 + B, A*4 + -10
ee e0 e0 f8 55 01 00 c0 41 f5  # daf4 |   jne [0x155], 0xc000, ${fail}:rel + PC
b2 fe 1c fe 85                 # dafe |   or [G], -123, G
ee e0 1c f8 55 01 d5 32 f5     # db03 |   jne [0x155], 0xd5, ${fail}:rel + PC
8a 2a 1c 20 85                 # db0c |   mul [A*4 + B], -123, A
ee e0 e0 f8 63 03 52 ae 24 f5  # db11 |   jne [0x363], 0xae52, ${fail}:rel + PC
a6 e0 e0 2a 39 30 39 30        # db1b |   ishr [0x3039], 0x3039, A*4 + B
ee e0 e0 f8 39 30 07 06 12 f5  # db23 |   jne [0x3039], 0x607, ${fail}:rel + PC
a2 21 e4 21 de fa              # db2d |   shr [A*2], 0xfade + A, A*2
ee e0 e0 f8 54 01 b8 0f 02 f5  # db33 |   jne [0x154], 0xfb8, ${fail}:rel + PC
82 21 fe fe                    # db3d |   add [A*2], G, G
ee e0 e0 f8 54 01 aa 02 f4 f4  # db41 |   jne [0x154], 0x2aa, ${fail}:rel + PC
a6 fe e4 20 de fa              # db4b |   ishr [G], 0xfade + A, A
ee e0 1c f8 55 01 fe e4 f4     # db51 |   jne [0x155], 0xfe, ${fail}:rel + PC
82 e0 e4 2a 39 30 de fa        # db5a |   add [0x3039], 0xfade + A, A*4 + B
ee e0 e0 f8 39 30 eb fe d3 f4  # db62 |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
a6 20 20 20                    # db6c |   ishr [A], A, A
ee e0 00 f8 aa 00 c5 f4        # db70 |   jne [0xaa], 0, ${fail}:rel + PC
82 fe 2a 20                    # db78 |   add [G], A*4 + B, A
ee e0 e0 f8 55 01 0d 04 b9 f4  # db7c |   jne [0x155], 0x40d, ${fail}:rel + PC
b6 fe fe fe                    # db86 |   xor [G], G, G
ee e0 00 f8 55 01 ab f4        # db8a |   jne [0x155], 0, ${fail}:rel + PC
aa 21 fe 21                    # db92 |   shl [A*2], G, A*2
ee e0 e0 f8 54 01 50 15 9f f4  # db96 |   jne [0x154], 0x1550, ${fail}:rel + PC
a6 fe e0 21 39 30              # dba0 |   ishr [G], 0x3039, A*2
ee e0 e0 f8 55 01 03 03 8f f4  # dba6 |   jne [0x155], 0x303, ${fail}:rel + PC
ae 21 2a e4 de fa              # dbb0 |   and [A*2], A*4 + B, 0xfade + A
ee e0 e0 f8 54 01 00 03 7f f4  # dbb6 |   jne [0x154], 0x300, ${fail}:rel + PC
82 20 3e 3e f6 f6              # dbc0 |   add [A], A*4 + -10, A*4 + -10
ee e0 e0 f8 aa 00 3c 05 6f f4  # dbc6 |   jne [0xaa], 0x53c, ${fail}:rel + PC
b2 e0 21 1c 39 30 85           # dbd0 |   or [0x3039], A*2, -123
ee e0 1c f8 39 30 d5 5e f4     # dbd7 |   jne [0x3039], 0xd5, ${fail}:rel + PC
82 e0 fe fe 39 30              # dbe0 |   add [0x3039], G, G
ee e0 e0 f8 39 30 aa 02 4f f4  # dbe6 |   jne [0x3039], 0x2aa, ${fail}:rel + PC
ae fe e0 e4 39 30 de fa        # dbf0 |   and [G], 0x3039, 0xfade + A
ee e0 e0 f8 55 01 08 30 3d f4  # dbf8 |   jne [0x155], 0x3008, ${fail}:rel + PC
8e e0 2a 3e 39 30 f6           # dc02 |   imul [0x3039], A*4 + B, A*4 + -10
ee e0 e0 f8 39 30 1a dd 2c f4  # dc09 |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
b2 21 e0 20 39 30              # dc13 |   or [A*2], 0x3039, A
ee e0 e0 f8 54 01 bb 30 1c f4  # dc19 |   jne [0x154], 0x30bb, ${fail}:rel + PC
8e 21 3e 21 f6                 # dc23 |   imul [A*2], A*4 + -10, A*2
ee e0 e0 f8 54 01 d8 79 0d f4  # dc28 |   jne [0x154], 0x79d8, ${fail}:rel + PC
82 3e 1c 2a f6 85              # dc32 |   add [A*4 + -10], -123, A*4 + B
ee e0 e0 f8 9e 02 e8 02 fd f3  # dc38 |   jne [0x29e], 0x2e8, ${fail}:rel + PC
86 fe e4 21 de fa              # dc42 |   sub [G], 0xfade + A, A*2
ee e0 e0 f8 55 01 34 fa ed f3  # dc48 |   jne [0x155], 0xfa34, ${fail}:rel + PC
b2 2a e4 21 de fa              # dc52 |   or [A*4 + B], 0xfade + A, A*2
ee e0 e0 f8 63 03 dc fb dd f3  # dc58 |   jne [0x363], 0xfbdc, ${fail}:rel + PC
ae 21 21 20                    # dc62 |   and [A*2], A*2, A
ee e0 00 f8 54 01 cf f3        # dc66 |   jne [0x154], 0, ${fail}:rel + PC
86 2a 2a fe                    # dc6e |   sub [A*4 + B], A*4 + B, G
ee e0 e0 f8 63 03 0e 02 c3 f3  # dc72 |   jne [0x363], 0x20e, ${fail}:rel + PC
82 3e 3e 20 f6 f6              # dc7c |   add [A*4 + -10], A*4 + -10, A
ee e0 e0 f8 9e 02 48 03 b3 f3  # dc82 |   jne [0x29e], 0x348, ${fail}:rel + PC
86 21 e0 e0 39 30 39 30        # dc8c |   sub [A*2], 0x3039, 0x3039
ee e0 00 f8 54 01 a1 f3        # dc94 |   jne [0x154], 0, ${fail}:rel + PC
a2 20 1c fe 85                 # dc9c |   shr [A], -123, G
ee e0 e0 f8 aa 00 fc 07 94 f3  # dca1 |   jne [0xaa], 0x7fc, ${fail}:rel + PC
aa 2a 1c 2a 85                 # dcab |   shl [A*4 + B], -123, A*4 + B
ee e0 e0 f8 63 03 28 fc 85 f3  # dcb0 |   jne [0x363], 0xfc28, ${fail}:rel + PC
b2 2a 20 20                    # dcba |   or [A*4 + B], A, A
ee e0 e0 f8 63 03 aa 00 77 f3  # dcbe |   jne [0x363], 0xaa, ${fail}:rel + PC
86 20 20 1c 85                 # dcc8 |   sub [A], A, -123
ee e0 e0 f8 aa 00 25 01 68 f3  # dccd |   jne [0xaa], 0x125, ${fail}:rel + PC
a6 3e e4 21 f6 de fa           # dcd7 |   ishr [A*4 + -10], 0xfade + A, A*2
ee e0 1c f8 9e 02 b8 57 f3     # dcde |   jne [0x29e], 0xb8, ${fail}:rel + PC
86 20 e0 e0 39 30 39 30        # dce7 |   sub [A], 0x3039, 0x3039
ee e0 00 f8 aa 00 46 f3        # dcef |   jne [0xaa], 0, ${fail}:rel + PC
82 fe e0 e0 39 30 39 30        # dcf7 |   add [G], 0x3039, 0x3039
ee e0 e0 f8 55 01 72 60 36 f3  # dcff |   jne [0x155], 0x6072, ${fail}:rel + PC
a2 2a e4 e4 de fa de fa        # dd09 |   shr [A*4 + B], 0xfade + A, 0xfade + A
ee e0 e0 f8 63 03 fb 00 24 f3  # dd11 |   jne [0x363], 0xfb, ${fail}:rel + PC
8e 20 20 fe                    # dd1b |   imul [A], A, G
ee e0 e0 f8 aa 00 72 e2 16 f3  # dd1f |   jne [0xaa], 0xe272, ${fail}:rel + PC
a2 21 e4 2a de fa              # dd29 |   shr [A*2], 0xfade + A, A*4 + B
ee e0 e0 f8 54 01 71 1f 06 f3  # dd2f |   jne [0x154], 0x1f71, ${fail}:rel + PC
a2 2a 2a 1c 85                 # dd39 |   shr [A*4 + B], A*4 + B, -123
ee e0 1c f8 63 03 1b f7 f2     # dd3e |   jne [0x363], 0x1b, ${fail}:rel + PC
a2 20 21 2a                    # dd47 |   shr [A], A*2, A*4 + B
ee e0 1c f8 aa 00 2a ea f2     # dd4b |   jne [0xaa], 0x2a, ${fail}:rel + PC
ae e0 2a 20 39 30              # dd54 |   and [0x3039], A*4 + B, A
ee e0 1c f8 39 30 22 db f2     # dd5a |   jne [0x3039], 0x22, ${fail}:rel + PC
a2 e0 e0 e0 39 30 39 30 39 30  # dd63 |   shr [0x3039], 0x3039, 0x3039
ee e0 1c f8 39 30 18 c8 f2     # dd6d |   jne [0x3039], 0x18, ${fail}:rel + PC
8a 20 fe 3e f6                 # dd76 |   mul [A], G, A*4 + -10
ee e0 e0 f8 aa 00 76 7c ba f2  # dd7b |   jne [0xaa], 0x7c76, ${fail}:rel + PC
82 2a e0 2a 39 30              # dd85 |   add [A*4 + B], 0x3039, A*4 + B
ee e0 e0 f8 63 03 9c 33 aa f2  # dd8b |   jne [0x363], 0x339c, ${fail}:rel + PC
8e fe 3e 2a f6                 # dd95 |   imul [G], A*4 + -10, A*4 + B
ee e0 e0 f8 55 01 1a dd 9b f2  # dd9a |   jne [0x155], 0xdd1a, ${fail}:rel + PC
aa 20 21 e0 39 30              # dda4 |   shl [A], A*2, 0x3039
ee e0 e0 f8 aa 00 00 a8 8b f2  # ddaa |   jne [0xaa], 0xa800, ${fail}:rel + PC
82 21 fe 20                    # ddb4 |   add [A*2], G, A
ee e0 e0 f8 54 01 ff 01 7d f2  # ddb8 |   jne [0x154], 0x1ff, ${fail}:rel + PC
82 2a 2a 21                    # ddc2 |   add [A*4 + B], A*4 + B, A*2
ee e0 e0 f8 63 03 b7 04 6f f2  # ddc6 |   jne [0x363], 0x4b7, ${fail}:rel + PC
a2 20 fe e4 de fa              # ddd0 |   shr [A], G, 0xfade + A
ee e0 1c f8 aa 00 01 5f f2     # ddd6 |   jne [0xaa], 0x1, ${fail}:rel + PC
82 fe 1c 20 85                 # dddf |   add [G], -123, A
ee e0 1c f8 55 01 2f 51 f2     # dde4 |   jne [0x155], 0x2f, ${fail}:rel + PC
8e 3e fe e0 f6 39 30           # dded |   imul [A*4 + -10], G, 0x3039
ee e0 e0 f8 9e 02 ed 3b 41 f2  # ddf4 |   jne [0x29e], 0x3bed, ${fail}:rel + PC
8a fe e4 2a de fa              # ddfe |   mul [G], 0xfade + A, A*4 + B
ee e0 e0 f8 55 01 98 dd 31 f2  # de04 |   jne [0x155], 0xdd98, ${fail}:rel + PC
a2 fe fe 20                    # de0e |   shr [G], G, A
ee e0 00 f8 55 01 23 f2        # de12 |   jne [0x155], 0, ${fail}:rel + PC
b2 21 20 20                    # de1a |   or [A*2], A, A
ee e0 e0 f8 54 01 aa 00 17 f2  # de1e |   jne [0x154], 0xaa, ${fail}:rel + PC
b2 3e 1c 21 f6 85              # de28 |   or [A*4 + -10], -123, A*2
ee e0 1c f8 9e 02 d5 07 f2     # de2e |   jne [0x29e], 0xd5, ${fail}:rel + PC
8a 2a 1c 1c 85 85              # de37 |   mul [A*4 + B], -123, -123
ee e0 e0 f8 63 03 19 3b f8 f1  # de3d |   jne [0x363], 0x3b19, ${fail}:rel + PC
8a e0 e4 21 39 30 de fa        # de47 |   mul [0x3039], 0xfade + A, A*2
ee e0 e0 f8 39 30 a0 10 e6 f1  # de4f |   jne [0x3039], 0x10a0, ${fail}:rel + PC
86 fe 20 3e f6                 # de59 |   sub [G], A, A*4 + -10
ee e0 e0 f8 55 01 0c fe d7 f1  # de5e |   jne [0x155], 0xfe0c, ${fail}:rel + PC
aa 20 2a 21                    # de68 |   shl [A], A*4 + B, A*2
ee e0 e0 f8 aa 00 30 36 c9 f1  # de6c |   jne [0xaa], 0x3630, ${fail}:rel + PC
b6 21 1c 2a 85                 # de76 |   xor [A*2], -123, A*4 + B
ee e0 e0 f8 54 01 e6 fc ba f1  # de7b |   jne [0x154], 0xfce6, ${fail}:rel + PC
86 2a 3e 1c f6 85              # de85 |   sub [A*4 + B], A*4 + -10, -123
ee e0 e0 f8 63 03 19 03 aa f1  # de8b |   jne [0x363], 0x319, ${fail}:rel + PC
86 e0 e0 e4 39 30 39 30 de fa  # de95 |   sub [0x3039], 0x3039, 0xfade + A
ee e0 e0 f8 39 30 b1 34 96 f1  # de9f |   jne [0x3039], 0x34b1, ${fail}:rel + PC
ae fe 2a e4 de fa              # dea9 |   and [G], A*4 + B, 0xfade + A
ee e0 e0 f8 55 01 00 03 86 f1  # deaf |   jne [0x155], 0x300, ${fail}:rel + PC
aa 20 3e fe f6                 # deb9 |   shl [A], A*4 + -10, G
ee e0 e0 f8 aa 00 c0 53 77 f1  # debe |   jne [0xaa], 0x53c0, ${fail}:rel + PC
a6 fe fe e4 de fa              # dec8 |   ishr [G], G, 0xfade + A
ee e0 1c f8 55 01 01 67 f1     # dece |   jne [0x155], 0x1, ${fail}:rel + PC
ae 21 e0 2a 39 30              # ded7 |   and [A*2], 0x3039, A*4 + B
ee e0 1c f8 54 01 21 58 f1     # dedd |   jne [0x154], 0x21, ${fail}:rel + PC
a6 21 21 1c 85                 # dee6 |   ishr [A*2], A*2, -123
ee e0 1c f8 54 01 0a 4a f1     # deeb |   jne [0x154], 0xa, ${fail}:rel + PC
b6 fe 21 e0 39 30              # def4 |   xor [G], A*2, 0x3039
ee e0 e0 f8 55 01 6d 31 3b f1  # defa |   jne [0x155], 0x316d, ${fail}:rel + PC
86 2a 3e 2a f6                 # df04 |   sub [A*4 + B], A*4 + -10, A*4 + B
ee e0 e0 f8 63 03 3b ff 2c f1  # df09 |   jne [0x363], 0xff3b, ${fail}:rel + PC
b2 e0 fe 1c 39 30 85           # df13 |   or [0x3039], G, -123
ee e0 1c f8 39 30 d5 1b f1     # df1a |   jne [0x3039], 0xd5, ${fail}:rel + PC
aa 2a 3e 20 f6                 # df23 |   shl [A*4 + B], A*4 + -10, A
ee e0 e0 f8 63 03 00 78 0d f1  # df28 |   jne [0x363], 0x7800, ${fail}:rel + PC
86 e0 21 20 39 30              # df32 |   sub [0x3039], A*2, A
ee e0 e0 f8 39 30 aa 00 fd f0  # df38 |   jne [0x3039], 0xaa, ${fail}:rel + PC
b6 e0 2a 21 39 30              # df42 |   xor [0x3039], A*4 + B, A*2
ee e0 e0 f8 39 30 37 02 ed f0  # df48 |   jne [0x3039], 0x237, ${fail}:rel + PC
ae 2a e0 1c 39 30 85           # df52 |   and [A*4 + B], 0x3039, -123
ee e0 e0 f8 63 03 01 30 dc f0  # df59 |   jne [0x363], 0x3001, ${fail}:rel + PC
8e fe 2a e0 39 30              # df63 |   imul [G], A*4 + B, 0x3039
ee e0 e0 f8 55 01 0b 51 cc f0  # df69 |   jne [0x155], 0x510b, ${fail}:rel + PC
b2 2a 20 fe                    # df73 |   or [A*4 + B], A, G
ee e0 e0 f8 63 03 ff 01 be f0  # df77 |   jne [0x363], 0x1ff, ${fail}:rel + PC
a6 3e e0 20 f6 39 30           # df81 |   ishr [A*4 + -10], 0x3039, A
ee e0 1c f8 9e 02 0c ad f0     # df88 |   jne [0x29e], 0xc, ${fail}:rel + PC
aa e0 e4 e4 39 30 de fa de fa  # df91 |   shl [0x3039], 0xfade + A, 0xfade + A
ee e0 e0 f8 39 30 00 88 9a f0  # df9b |   jne [0x3039], 0x8800, ${fail}:rel + PC
aa 20 e0 fe 39 30              # dfa5 |   shl [A], 0x3039, G
ee e0 e0 f8 aa 00 20 07 8a f0  # dfab |   jne [0xaa], 0x720, ${fail}:rel + PC
b6 fe 3e 21 f6                 # dfb5 |   xor [G], A*4 + -10, A*2
ee e0 e0 f8 55 01 ca 03 7b f0  # dfba |   jne [0x155], 0x3ca, ${fail}:rel + PC
b2 2a fe 1c 85                 # dfc4 |   or [A*4 + B], G, -123
ee e0 1c f8 63 03 d5 6c f0     # dfc9 |   jne [0x363], 0xd5, ${fail}:rel + PC
86 3e 1c e0 f6 85 39 30        # dfd2 |   sub [A*4 + -10], -123, 0x3039
ee e0 e0 f8 9e 02 4c cf 5b f0  # dfda |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
aa 21 21 21                    # dfe4 |   shl [A*2], A*2, A*2
ee e0 e0 f8 54 01 40 15 4d f0  # dfe8 |   jne [0x154], 0x1540, ${fail}:rel + PC
86 e0 e4 e0 39 30 de fa 39 30  # dff2 |   sub [0x3039], 0xfade + A, 0x3039
ee e0 e0 f8 39 30 4f cb 39 f0  # dffc |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
a2 21 e0 1c 39 30 85           # e006 |   shr [A*2], 0x3039, -123
ee e0 e0 f8 54 01 81 01 28 f0  # e00d |   jne [0x154], 0x181, ${fail}:rel + PC
a6 e0 e4 20 39 30 de fa        # e017 |   ishr [0x3039], 0xfade + A, A
ee e0 1c f8 39 30 fe 16 f0     # e01f |   jne [0x3039], 0xfe, ${fail}:rel + PC
b6 3e e4 e0 f6 de fa 39 30     # e028 |   xor [A*4 + -10], 0xfade + A, 0x3039
ee e0 e0 f8 9e 02 b1 cb 04 f0  # e031 |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
86 3e 21 3e f6 f6              # e03b |   sub [A*4 + -10], A*2, A*4 + -10
ee e0 e0 f8 9e 02 b6 fe f4 ef  # e041 |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
8e fe 1c 3e 85 f6              # e04b |   imul [G], -123, A*4 + -10
ee e0 e0 f8 55 01 16 be e4 ef  # e051 |   jne [0x155], 0xbe16, ${fail}:rel + PC
aa 20 2a 2a                    # e05b |   shl [A], A*4 + B, A*4 + B
ee e0 e0 f8 aa 00 18 1b d6 ef  # e05f |   jne [0xaa], 0x1b18, ${fail}:rel + PC
b6 e0 21 2a 39 30              # e069 |   xor [0x3039], A*2, A*4 + B
ee e0 e0 f8 39 30 37 02 c6 ef  # e06f |   jne [0x3039], 0x237, ${fail}:rel + PC
82 21 21 e0 39 30              # e079 |   add [A*2], A*2, 0x3039
ee e0 e0 f8 54 01 8d 31 b6 ef  # e07f |   jne [0x154], 0x318d, ${fail}:rel + PC
ae 21 2a 20                    # e089 |   and [A*2], A*4 + B, A
ee e0 1c f8 54 01 22 a8 ef     # e08d |   jne [0x154], 0x22, ${fail}:rel + PC
aa 20 2a e4 de fa              # e096 |   shl [A], A*4 + B, 0xfade + A
ee e0 e0 f8 aa 00 00 63 99 ef  # e09c |   jne [0xaa], 0x6300, ${fail}:rel + PC
ae 2a fe 20                    # e0a6 |   and [A*4 + B], G, A
ee e0 00 f8 63 03 8b ef        # e0aa |   jne [0x363], 0, ${fail}:rel + PC
b6 fe 21 1c 85                 # e0b2 |   xor [G], A*2, -123
ee e0 e0 f8 55 01 d1 fe 7e ef  # e0b7 |   jne [0x155], 0xfed1, ${fail}:rel + PC
ae e0 fe 21 39 30              # e0c1 |   and [0x3039], G, A*2
ee e0 e0 f8 39 30 54 01 6e ef  # e0c7 |   jne [0x3039], 0x154, ${fail}:rel + PC
b2 3e e0 2a f6 39 30           # e0d1 |   or [A*4 + -10], 0x3039, A*4 + B
ee e0 e0 f8 9e 02 7b 33 5d ef  # e0d8 |   jne [0x29e], 0x337b, ${fail}:rel + PC
b6 fe e4 3e de fa f6           # e0e2 |   xor [G], 0xfade + A, A*4 + -10
ee e0 e0 f8 55 01 16 f9 4c ef  # e0e9 |   jne [0x155], 0xf916, ${fail}:rel + PC
8e 2a 21 2a                    # e0f3 |   imul [A*4 + B], A*2, A*4 + B
ee e0 e0 f8 63 03 7c 7f 3e ef  # e0f7 |   jne [0x363], 0x7f7c, ${fail}:rel + PC
a6 fe 21 fe                    # e101 |   ishr [G], A*2, G
ee e0 1c f8 55 01 0a 30 ef     # e105 |   jne [0x155], 0xa, ${fail}:rel + PC
8a 21 1c 1c 85 85              # e10e |   mul [A*2], -123, -123
ee e0 e0 f8 54 01 19 3b 21 ef  # e114 |   jne [0x154], 0x3b19, ${fail}:rel + PC
8e 2a e4 20 de fa              # e11e |   imul [A*4 + B], 0xfade + A, A
ee e0 e0 f8 63 03 50 08 11 ef  # e124 |   jne [0x363], 0x850, ${fail}:rel + PC
a2 3e 3e 3e f6 f6 f6           # e12e |   shr [A*4 + -10], A*4 + -10, A*4 + -10
ee e0 00 f8 9e 02 00 ef        # e135 |   jne [0x29e], 0, ${fail}:rel + PC
8a 20 1c e4 85 de fa           # e13d |   mul [A], -123, 0xfade + A
ee e0 e0 f8 aa 00 a8 25 f1 ee  # e144 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
a6 3e 20 21 f6                 # e14e |   ishr [A*4 + -10], A, A*2
ee e0 1c f8 9e 02 0a e2 ee     # e153 |   jne [0x29e], 0xa, ${fail}:rel + PC
b2 3e 20 20 f6                 # e15c |   or [A*4 + -10], A, A
ee e0 e0 f8 9e 02 aa 00 d4 ee  # e161 |   jne [0x29e], 0xaa, ${fail}:rel + PC
82 e0 fe e0 39 30 39 30        # e16b |   add [0x3039], G, 0x3039
ee e0 e0 f8 39 30 8e 31 c2 ee  # e173 |   jne [0x3039], 0x318e, ${fail}:rel + PC
8e 3e e0 3e f6 39 30 f6        # e17d |   imul [A*4 + -10], 0x3039, A*4 + -10
ee e0 e0 f8 9e 02 2e 35 b0 ee  # e185 |   jne [0x29e], 0x352e, ${fail}:rel + PC
a6 fe fe 21                    # e18f |   ishr [G], G, A*2
ee e0 1c f8 55 01 15 a2 ee     # e193 |   jne [0x155], 0x15, ${fail}:rel + PC
8e 20 e4 3e de fa f6           # e19c |   imul [A], 0xfade + A, A*4 + -10
ee e0 e0 f8 aa 00 f0 4d 92 ee  # e1a3 |   jne [0xaa], 0x4df0, ${fail}:rel + PC
a6 fe 20 fe                    # e1ad |   ishr [G], A, G
ee e0 1c f8 55 01 05 84 ee     # e1b1 |   jne [0x155], 0x5, ${fail}:rel + PC
82 2a e0 3e 39 30 f6           # e1ba |   add [A*4 + B], 0x3039, A*4 + -10
ee e0 e0 f8 63 03 d7 32 74 ee  # e1c1 |   jne [0x363], 0x32d7, ${fail}:rel + PC
ae 3e 2a e4 f6 de fa           # e1cb |   and [A*4 + -10], A*4 + B, 0xfade + A
ee e0 e0 f8 9e 02 00 03 63 ee  # e1d2 |   jne [0x29e], 0x300, ${fail}:rel + PC
8e 20 1c 2a 85                 # e1dc |   imul [A], -123, A*4 + B
ee e0 e0 f8 aa 00 6f 5f 54 ee  # e1e1 |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
a2 fe 3e e4 f6 de fa           # e1eb |   shr [G], A*4 + -10, 0xfade + A
ee e0 1c f8 55 01 02 43 ee     # e1f2 |   jne [0x155], 0x2, ${fail}:rel + PC
b2 2a e0 20 39 30              # e1fb |   or [A*4 + B], 0x3039, A
ee e0 e0 f8 63 03 bb 30 34 ee  # e201 |   jne [0x363], 0x30bb, ${fail}:rel + PC
b6 2a e0 fe 39 30              # e20b |   xor [A*4 + B], 0x3039, G
ee e0 e0 f8 63 03 6c 31 24 ee  # e211 |   jne [0x363], 0x316c, ${fail}:rel + PC
8e 20 20 e0 39 30              # e21b |   imul [A], A, 0x3039
ee e0 e0 f8 aa 00 da 05 14 ee  # e221 |   jne [0xaa], 0x5da, ${fail}:rel + PC
b2 21 2a 3e f6                 # e22b |   or [A*2], A*4 + B, A*4 + -10
ee e0 e0 f8 54 01 ff 03 05 ee  # e230 |   jne [0x154], 0x3ff, ${fail}:rel + PC
aa fe e4 e0 de fa 39 30        # e23a |   shl [G], 0xfade + A, 0x3039
ee e0 e0 f8 55 01 00 10 f3 ed  # e242 |   jne [0x155], 0x1000, ${fail}:rel + PC
a6 2a e4 2a de fa              # e24c |   ishr [A*4 + B], 0xfade + A, A*4 + B
ee e0 e0 f8 63 03 71 ff e3 ed  # e252 |   jne [0x363], 0xff71, ${fail}:rel + PC
aa 3e e4 1c f6 de fa 85        # e25c |   shl [A*4 + -10], 0xfade + A, -123
ee e0 e0 f8 9e 02 00 71 d1 ed  # e264 |   jne [0x29e], 0x7100, ${fail}:rel + PC
a2 3e e4 20 f6 de fa           # e26e |   shr [A*4 + -10], 0xfade + A, A
ee e0 1c f8 9e 02 3e c0 ed     # e275 |   jne [0x29e], 0x3e, ${fail}:rel + PC
8a 3e 20 2a f6                 # e27e |   mul [A*4 + -10], A, A*4 + B
ee e0 e0 f8 9e 02 be 3f b2 ed  # e283 |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
b2 21 3e 2a f6                 # e28d |   or [A*2], A*4 + -10, A*4 + B
ee e0 e0 f8 54 01 ff 03 a3 ed  # e292 |   jne [0x154], 0x3ff, ${fail}:rel + PC
8e 3e 21 1c f6 85              # e29c |   imul [A*4 + -10], A*2, -123
ee e0 e0 f8 9e 02 a4 5c 93 ed  # e2a2 |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
aa e0 3e 21 39 30 f6           # e2ac |   shl [0x3039], A*4 + -10, A*2
ee e0 e0 f8 39 30 e0 29 82 ed  # e2b3 |   jne [0x3039], 0x29e0, ${fail}:rel + PC
aa 21 e4 e4 de fa de fa        # e2bd |   shl [A*2], 0xfade + A, 0xfade + A
ee e0 e0 f8 54 01 00 88 70 ed  # e2c5 |   jne [0x154], 0x8800, ${fail}:rel + PC
82 fe 21 21                    # e2cf |   add [G], A*2, A*2
ee e0 e0 f8 55 01 a8 02 62 ed  # e2d3 |   jne [0x155], 0x2a8, ${fail}:rel + PC
ae 21 e4 fe de fa              # e2dd |   and [A*2], 0xfade + A, G
ee e0 e0 f8 54 01 00 01 52 ed  # e2e3 |   jne [0x154], 0x100, ${fail}:rel + PC
ae 3e e0 e0 f6 39 30 39 30     # e2ed |   and [A*4 + -10], 0x3039, 0x3039
ee e0 e0 f8 9e 02 39 30 3f ed  # e2f6 |   jne [0x29e], 0x3039, ${fail}:rel + PC
aa 3e 20 1c f6 85              # e300 |   shl [A*4 + -10], A, -123
ee e0 e0 f8 9e 02 40 15 2f ed  # e306 |   jne [0x29e], 0x1540, ${fail}:rel + PC
ae 2a 3e e4 f6 de fa           # e310 |   and [A*4 + B], A*4 + -10, 0xfade + A
ee e0 e0 f8 63 03 88 02 1e ed  # e317 |   jne [0x363], 0x288, ${fail}:rel + PC
82 fe 1c 1c 85 85              # e321 |   add [G], -123, -123
ee e0 e0 f8 55 01 0a ff 0e ed  # e327 |   jne [0x155], 0xff0a, ${fail}:rel + PC
8a 20 20 e4 de fa              # e331 |   mul [A], A, 0xfade + A
ee e0 e0 f8 aa 00 50 08 fe ec  # e337 |   jne [0xaa], 0x850, ${fail}:rel + PC
b2 21 2a fe                    # e341 |   or [A*2], A*4 + B, G
ee e0 e0 f8 54 01 77 03 f0 ec  # e345 |   jne [0x154], 0x377, ${fail}:rel + PC
86 fe e4 e4 de fa de fa        # e34f |   sub [G], 0xfade + A, 0xfade + A
ee e0 00 f8 55 01 de ec        # e357 |   jne [0x155], 0, ${fail}:rel + PC
a2 2a fe e4 de fa              # e35f |   shr [A*4 + B], G, 0xfade + A
ee e0 1c f8 63 03 01 d0 ec     # e365 |   jne [0x363], 0x1, ${fail}:rel + PC
86 21 1c fe 85                 # e36e |   sub [A*2], -123, G
ee e0 e0 f8 54 01 30 fe c2 ec  # e373 |   jne [0x154], 0xfe30, ${fail}:rel + PC
aa 3e 21 fe f6                 # e37d |   shl [A*4 + -10], A*2, G
ee e0 e0 f8 9e 02 80 2a b3 ec  # e382 |   jne [0x29e], 0x2a80, ${fail}:rel + PC
aa 20 1c 3e 85 f6              # e38c |   shl [A], -123, A*4 + -10
ee e0 e0 f8 aa 00 00 40 a3 ec  # e392 |   jne [0xaa], 0x4000, ${fail}:rel + PC
8a 3e 2a 21 f6                 # e39c |   mul [A*4 + -10], A*4 + B, A*2
ee e0 e0 f8 9e 02 7c 7f 94 ec  # e3a1 |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
a2 20 2a fe                    # e3ab |   shr [A], A*4 + B, G
ee e0 1c f8 aa 00 1b 86 ec     # e3af |   jne [0xaa], 0x1b, ${fail}:rel + PC
82 20 2a e0 39 30              # e3b8 |   add [A], A*4 + B, 0x3039
ee e0 e0 f8 aa 00 9c 33 77 ec  # e3be |   jne [0xaa], 0x339c, ${fail}:rel + PC
b6 fe e0 1c 39 30 85           # e3c8 |   xor [G], 0x3039, -123
ee e0 e0 f8 55 01 bc cf 66 ec  # e3cf |   jne [0x155], 0xcfbc, ${fail}:rel + PC
86 20 e4 2a de fa              # e3d9 |   sub [A], 0xfade + A, A*4 + B
ee e0 e0 f8 aa 00 25 f8 56 ec  # e3df |   jne [0xaa], 0xf825, ${fail}:rel + PC
a6 2a 21 fe                    # e3e9 |   ishr [A*4 + B], A*2, G
ee e0 1c f8 63 03 0a 48 ec     # e3ed |   jne [0x363], 0xa, ${fail}:rel + PC
b2 21 fe e4 de fa              # e3f6 |   or [A*2], G, 0xfade + A
ee e0 e0 f8 54 01 dd fb 39 ec  # e3fc |   jne [0x154], 0xfbdd, ${fail}:rel + PC
8a e0 e4 fe 39 30 de fa        # e406 |   mul [0x3039], 0xfade + A, G
ee e0 e0 f8 39 30 28 0c 27 ec  # e40e |   jne [0x3039], 0xc28, ${fail}:rel + PC
8e 2a 2a e4 de fa              # e418 |   imul [A*4 + B], A*4 + B, 0xfade + A
ee e0 e0 f8 63 03 98 dd 17 ec  # e41e |   jne [0x363], 0xdd98, ${fail}:rel + PC
ae e0 20 fe 39 30              # e428 |   and [0x3039], A, G
ee e0 00 f8 39 30 07 ec        # e42e |   jne [0x3039], 0, ${fail}:rel + PC
8e fe fe 2a                    # e436 |   imul [G], G, A*4 + B
ee e0 e0 f8 55 01 df 82 fb eb  # e43a |   jne [0x155], 0x82df, ${fail}:rel + PC
8e 3e 21 21 f6                 # e444 |   imul [A*4 + -10], A*2, A*2
ee e0 e0 f8 9e 02 90 c3 ec eb  # e449 |   jne [0x29e], 0xc390, ${fail}:rel + PC
b2 fe e4 1c de fa 85           # e453 |   or [G], 0xfade + A, -123
ee e0 1c f8 55 01 8d db eb     # e45a |   jne [0x155], 0x8d, ${fail}:rel + PC
8e 2a 20 3e f6                 # e463 |   imul [A*4 + B], A, A*4 + -10
ee e0 e0 f8 63 03 ec bc cd eb  # e468 |   jne [0x363], 0xbcec, ${fail}:rel + PC
a2 2a 3e e0 f6 39 30           # e472 |   shr [A*4 + B], A*4 + -10, 0x3039
ee e0 1c f8 63 03 01 bc eb     # e479 |   jne [0x363], 0x1, ${fail}:rel + PC
b6 2a 21 e0 39 30              # e482 |   xor [A*4 + B], A*2, 0x3039
ee e0 e0 f8 63 03 6d 31 ad eb  # e488 |   jne [0x363], 0x316d, ${fail}:rel + PC
a2 e0 3e e0 39 30 f6 39 30     # e492 |   shr [0x3039], A*4 + -10, 0x3039
ee e0 1c f8 39 30 01 9a eb     # e49b |   jne [0x3039], 0x1, ${fail}:rel + PC
a2 21 1c 3e 85 f6              # e4a4 |   shr [A*2], -123, A*4 + -10
ee e0 1c f8 54 01 03 8b eb     # e4aa |   jne [0x154], 0x3, ${fail}:rel + PC
b2 21 20 21                    # e4b3 |   or [A*2], A, A*2
ee e0 e0 f8 54 01 fe 01 7e eb  # e4b7 |   jne [0x154], 0x1fe, ${fail}:rel + PC
a2 fe 2a 21                    # e4c1 |   shr [G], A*4 + B, A*2
ee e0 1c f8 55 01 36 70 eb     # e4c5 |   jne [0x155], 0x36, ${fail}:rel + PC
b6 e0 3e 2a 39 30 f6           # e4ce |   xor [0x3039], A*4 + -10, A*4 + B
ee e0 e0 f8 39 30 fd 01 60 eb  # e4d5 |   jne [0x3039], 0x1fd, ${fail}:rel + PC
8a 3e e4 3e f6 de fa f6        # e4df |   mul [A*4 + -10], 0xfade + A, A*4 + -10
ee e0 e0 f8 9e 02 f0 4d 4e eb  # e4e7 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
8e 2a 21 3e f6                 # e4f1 |   imul [A*4 + B], A*2, A*4 + -10
ee e0 e0 f8 63 03 d8 79 3f eb  # e4f6 |   jne [0x363], 0x79d8, ${fail}:rel + PC
a2 e0 e4 3e 39 30 de fa f6     # e500 |   shr [0x3039], 0xfade + A, A*4 + -10
ee e0 1c f8 39 30 03 2c eb     # e509 |   jne [0x3039], 0x3, ${fail}:rel + PC
82 3e 20 fe f6                 # e512 |   add [A*4 + -10], A, G
ee e0 e0 f8 9e 02 ff 01 1e eb  # e517 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a2 2a e4 e0 de fa 39 30        # e521 |   shr [A*4 + B], 0xfade + A, 0x3039
ee e0 1c f8 63 03 7d 0c eb     # e529 |   jne [0x363], 0x7d, ${fail}:rel + PC
a2 3e 1c 1c f6 85 85           # e532 |   shr [A*4 + -10], -123, -123
ee e0 e0 f8 9e 02 fc 07 fc ea  # e539 |   jne [0x29e], 0x7fc, ${fail}:rel + PC
8e 20 1c e0 85 39 30           # e543 |   imul [A], -123, 0x3039
ee e0 e0 f8 aa 00 9d d4 eb ea  # e54a |   jne [0xaa], 0xd49d, ${fail}:rel + PC
aa 2a 3e 21 f6                 # e554 |   shl [A*4 + B], A*4 + -10, A*2
ee e0 e0 f8 63 03 e0 29 dc ea  # e559 |   jne [0x363], 0x29e0, ${fail}:rel + PC
b6 21 e0 fe 39 30              # e563 |   xor [A*2], 0x3039, G
ee e0 e0 f8 54 01 6c 31 cc ea  # e569 |   jne [0x154], 0x316c, ${fail}:rel + PC
b6 e0 3e 3e 39 30 f6 f6        # e573 |   xor [0x3039], A*4 + -10, A*4 + -10
ee e0 00 f8 39 30 ba ea        # e57b |   jne [0x3039], 0, ${fail}:rel + PC
b6 20 21 1c 85                 # e583 |   xor [A], A*2, -123
ee e0 e0 f8 aa 00 d1 fe ad ea  # e588 |   jne [0xaa], 0xfed1, ${fail}:rel + PC
b6 21 21 fe                    # e592 |   xor [A*2], A*2, G
ee e0 1c f8 54 01 01 9f ea     # e596 |   jne [0x154], 0x1, ${fail}:rel + PC
8a fe e0 20 39 30              # e59f |   mul [G], 0x3039, A
ee e0 e0 f8 55 01 da 05 90 ea  # e5a5 |   jne [0x155], 0x5da, ${fail}:rel + PC
b6 21 e0 21 39 30              # e5af |   xor [A*2], 0x3039, A*2
ee e0 e0 f8 54 01 6d 31 80 ea  # e5b5 |   jne [0x154], 0x316d, ${fail}:rel + PC
8a 21 2a e0 39 30              # e5bf |   mul [A*2], A*4 + B, 0x3039
ee e0 e0 f8 54 01 0b 51 70 ea  # e5c5 |   jne [0x154], 0x510b, ${fail}:rel + PC
ae 3e e0 1c f6 39 30 85        # e5cf |   and [A*4 + -10], 0x3039, -123
ee e0 e0 f8 9e 02 01 30 5e ea  # e5d7 |   jne [0x29e], 0x3001, ${fail}:rel + PC
aa fe 21 20                    # e5e1 |   shl [G], A*2, A
ee e0 e0 f8 55 01 00 50 50 ea  # e5e5 |   jne [0x155], 0x5000, ${fail}:rel + PC
ae 20 e4 20 de fa              # e5ef |   and [A], 0xfade + A, A
ee e0 e0 f8 aa 00 88 00 40 ea  # e5f5 |   jne [0xaa], 0x88, ${fail}:rel + PC
aa 21 3e e4 f6 de fa           # e5ff |   shl [A*2], A*4 + -10, 0xfade + A
ee e0 e0 f8 54 01 00 9e 2f ea  # e606 |   jne [0x154], 0x9e00, ${fail}:rel + PC
b6 e0 e0 1c 39 30 39 30 85     # e610 |   xor [0x3039], 0x3039, -123
ee e0 e0 f8 39 30 bc cf 1c ea  # e619 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
8a 3e 3e 1c f6 f6 85           # e623 |   mul [A*4 + -10], A*4 + -10, -123
ee e0 e0 f8 9e 02 16 be 0b ea  # e62a |   jne [0x29e], 0xbe16, ${fail}:rel + PC
86 fe 21 3e f6                 # e634 |   sub [G], A*2, A*4 + -10
ee e0 e0 f8 55 01 b6 fe fc e9  # e639 |   jne [0x155], 0xfeb6, ${fail}:rel + PC
86 3e 2a fe f6                 # e643 |   sub [A*4 + -10], A*4 + B, G
ee e0 e0 f8 9e 02 0e 02 ed e9  # e648 |   jne [0x29e], 0x20e, ${fail}:rel + PC
b6 3e 1c fe f6 85              # e652 |   xor [A*4 + -10], -123, G
ee e0 e0 f8 9e 02 d0 fe dd e9  # e658 |   jne [0x29e], 0xfed0, ${fail}:rel + PC
86 20 2a 1c 85                 # e662 |   sub [A], A*4 + B, -123
ee e0 e0 f8 aa 00 de 03 ce e9  # e667 |   jne [0xaa], 0x3de, ${fail}:rel + PC
86 20 21 fe                    # e671 |   sub [A], A*2, G
ee e0 1c f8 aa 00 ff c0 e9     # e675 |   jne [0xaa], 0xff, ${fail}:rel + PC
86 2a 20 e4 de fa              # e67e |   sub [A*4 + B], A, 0xfade + A
ee e0 e0 f8 63 03 22 05 b1 e9  # e684 |   jne [0x363], 0x522, ${fail}:rel + PC
aa e0 fe 3e 39 30 f6           # e68e |   shl [0x3039], G, A*4 + -10
ee e0 e0 f8 39 30 00 40 a0 e9  # e695 |   jne [0x3039], 0x4000, ${fail}:rel + PC
ae 20 1c 1c 85 85              # e69f |   and [A], -123, -123
ee e0 1c f8 aa 00 85 90 e9     # e6a5 |   jne [0xaa], 0x85, ${fail}:rel + PC
b6 20 fe e0 39 30              # e6ae |   xor [A], G, 0x3039
ee e0 e0 f8 aa 00 6c 31 81 e9  # e6b4 |   jne [0xaa], 0x316c, ${fail}:rel + PC
b2 e0 21 3e 39 30 f6           # e6be |   or [0x3039], A*2, A*4 + -10
ee e0 e0 f8 39 30 de 03 70 e9  # e6c5 |   jne [0x3039], 0x3de, ${fail}:rel + PC
b2 20 e4 21 de fa              # e6cf |   or [A], 0xfade + A, A*2
ee e0 e0 f8 aa 00 dc fb 60 e9  # e6d5 |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
b6 fe 3e 3e f6 f6              # e6df |   xor [G], A*4 + -10, A*4 + -10
ee e0 00 f8 55 01 50 e9        # e6e5 |   jne [0x155], 0, ${fail}:rel + PC
b6 3e 20 e4 f6 de fa           # e6ed |   xor [A*4 + -10], A, 0xfade + A
ee e0 e0 f8 9e 02 22 fb 41 e9  # e6f4 |   jne [0x29e], 0xfb22, ${fail}:rel + PC
b6 e0 1c e0 39 30 85 39 30     # e6fe |   xor [0x3039], -123, 0x3039
ee e0 e0 f8 39 30 bc cf 2e e9  # e707 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
a2 3e fe 2a f6                 # e711 |   shr [A*4 + -10], G, A*4 + B
ee e0 1c f8 9e 02 2a 1f e9     # e716 |   jne [0x29e], 0x2a, ${fail}:rel + PC
ae 20 fe 20                    # e71f |   and [A], G, A
ee e0 00 f8 aa 00 12 e9        # e723 |   jne [0xaa], 0, ${fail}:rel + PC
86 2a e4 1c de fa 85           # e72b |   sub [A*4 + B], 0xfade + A, -123
ee e0 e0 f8 63 03 03 fc 03 e9  # e732 |   jne [0x363], 0xfc03, ${fail}:rel + PC
ae e0 21 21 39 30              # e73c |   and [0x3039], A*2, A*2
ee e0 e0 f8 39 30 54 01 f3 e8  # e742 |   jne [0x3039], 0x154, ${fail}:rel + PC
a2 e0 20 e0 39 30 39 30        # e74c |   shr [0x3039], A, 0x3039
ee e0 00 f8 39 30 e1 e8        # e754 |   jne [0x3039], 0, ${fail}:rel + PC
8e 3e 2a 3e f6 f6              # e75c |   imul [A*4 + -10], A*4 + B, A*4 + -10
ee e0 e0 f8 9e 02 1a dd d3 e8  # e762 |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
a2 e0 3e 1c 39 30 f6 85        # e76c |   shr [0x3039], A*4 + -10, -123
ee e0 1c f8 39 30 14 c1 e8     # e774 |   jne [0x3039], 0x14, ${fail}:rel + PC
82 fe 20 e0 39 30              # e77d |   add [G], A, 0x3039
ee e0 e0 f8 55 01 e3 30 b2 e8  # e783 |   jne [0x155], 0x30e3, ${fail}:rel + PC
a6 e0 21 e0 39 30 39 30        # e78d |   ishr [0x3039], A*2, 0x3039
ee e0 00 f8 39 30 a0 e8        # e795 |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e4 1c 39 30 de fa 85     # e79d |   ishr [0x3039], 0xfade + A, -123
ee e0 1c f8 39 30 dc 8f e8     # e7a6 |   jne [0x3039], 0xdc, ${fail}:rel + PC
b2 3e fe 20 f6                 # e7af |   or [A*4 + -10], G, A
ee e0 e0 f8 9e 02 ff 01 81 e8  # e7b4 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a6 2a 2a 20                    # e7be |   ishr [A*4 + B], A*4 + B, A
ee e0 00 f8 63 03 73 e8        # e7c2 |   jne [0x363], 0, ${fail}:rel + PC
aa fe e0 2a 39 30              # e7ca |   shl [G], 0x3039, A*4 + B
ee e0 e0 f8 55 01 c8 81 65 e8  # e7d0 |   jne [0x155], 0x81c8, ${fail}:rel + PC
8a 21 3e 20 f6                 # e7da |   mul [A*2], A*4 + -10, A
ee e0 e0 f8 54 01 ec bc 56 e8  # e7df |   jne [0x154], 0xbcec, ${fail}:rel + PC
8e 3e 3e e0 f6 f6 39 30        # e7e9 |   imul [A*4 + -10], A*4 + -10, 0x3039
ee e0 e0 f8 9e 02 2e 35 44 e8  # e7f1 |   jne [0x29e], 0x352e, ${fail}:rel + PC
b6 e0 1c 3e 39 30 85 f6        # e7fb |   xor [0x3039], -123, A*4 + -10
ee e0 e0 f8 39 30 1b fd 32 e8  # e803 |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
b2 fe 20 e4 de fa              # e80d |   or [G], A, 0xfade + A
ee e0 e0 f8 55 01 aa fb 22 e8  # e813 |   jne [0x155], 0xfbaa, ${fail}:rel + PC
8e fe fe 3e f6                 # e81d |   imul [G], G, A*4 + -10
ee e0 e0 f8 55 01 76 7c 13 e8  # e822 |   jne [0x155], 0x7c76, ${fail}:rel + PC
8a 20 e0 3e 39 30 f6           # e82c |   mul [A], 0x3039, A*4 + -10
ee e0 e0 f8 aa 00 2e 35 02 e8  # e833 |   jne [0xaa], 0x352e, ${fail}:rel + PC
b2 fe 20 20                    # e83d |   or [G], A, A
ee e0 e0 f8 55 01 aa 00 f4 e7  # e841 |   jne [0x155], 0xaa, ${fail}:rel + PC
a2 3e 21 e4 f6 de fa           # e84b |   shr [A*4 + -10], A*2, 0xfade + A
ee e0 1c f8 9e 02 01 e3 e7     # e852 |   jne [0x29e], 0x1, ${fail}:rel + PC
a6 20 3e 2a f6                 # e85b |   ishr [A], A*4 + -10, A*4 + B
ee e0 1c f8 aa 00 53 d5 e7     # e860 |   jne [0xaa], 0x53, ${fail}:rel + PC
82 20 e0 20 39 30              # e869 |   add [A], 0x3039, A
ee e0 e0 f8 aa 00 e3 30 c6 e7  # e86f |   jne [0xaa], 0x30e3, ${fail}:rel + PC
a6 20 1c 20 85                 # e879 |   ishr [A], -123, A
ee e0 1c f8 aa 00 ff b7 e7     # e87e |   jne [0xaa], 0xff, ${fail}:rel + PC
ae 21 20 1c 85                 # e887 |   and [A*2], A, -123
ee e0 e0 f8 54 01 80 00 a9 e7  # e88c |   jne [0x154], 0x80, ${fail}:rel + PC
b6 2a 1c e4 85 de fa           # e896 |   xor [A*4 + B], -123, 0xfade + A
ee e0 e0 f8 63 03 0d 04 98 e7  # e89d |   jne [0x363], 0x40d, ${fail}:rel + PC
82 20 e0 21 39 30              # e8a7 |   add [A], 0x3039, A*2
ee e0 e0 f8 aa 00 8d 31 88 e7  # e8ad |   jne [0xaa], 0x318d, ${fail}:rel + PC
82 21 fe 2a                    # e8b7 |   add [A*2], G, A*4 + B
ee e0 e0 f8 54 01 b8 04 7a e7  # e8bb |   jne [0x154], 0x4b8, ${fail}:rel + PC
b2 20 2a 20                    # e8c5 |   or [A], A*4 + B, A
ee e0 e0 f8 aa 00 eb 03 6c e7  # e8c9 |   jne [0xaa], 0x3eb, ${fail}:rel + PC
82 21 1c e0 85 39 30           # e8d3 |   add [A*2], -123, 0x3039
ee e0 e0 f8 54 01 be 2f 5b e7  # e8da |   jne [0x154], 0x2fbe, ${fail}:rel + PC
aa fe 2a 1c 85                 # e8e4 |   shl [G], A*4 + B, -123
ee e0 e0 f8 55 01 60 6c 4c e7  # e8e9 |   jne [0x155], 0x6c60, ${fail}:rel + PC
82 3e 3e 2a f6 f6              # e8f3 |   add [A*4 + -10], A*4 + -10, A*4 + B
ee e0 e0 f8 9e 02 01 06 3c e7  # e8f9 |   jne [0x29e], 0x601, ${fail}:rel + PC
b2 20 3e e4 f6 de fa           # e903 |   or [A], A*4 + -10, 0xfade + A
ee e0 e0 f8 aa 00 9e fb 2b e7  # e90a |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
aa 2a 21 1c 85                 # e914 |   shl [A*4 + B], A*2, -123
ee e0 e0 f8 63 03 80 2a 1c e7  # e919 |   jne [0x363], 0x2a80, ${fail}:rel + PC
b2 e0 1c 2a 39 30 85           # e923 |   or [0x3039], -123, A*4 + B
ee e0 1c f8 39 30 e7 0b e7     # e92a |   jne [0x3039], 0xe7, ${fail}:rel + PC
82 21 2a 2a                    # e933 |   add [A*2], A*4 + B, A*4 + B
ee e0 e0 f8 54 01 c6 06 fe e6  # e937 |   jne [0x154], 0x6c6, ${fail}:rel + PC
ae 20 21 20                    # e941 |   and [A], A*2, A
ee e0 00 f8 aa 00 f0 e6        # e945 |   jne [0xaa], 0, ${fail}:rel + PC
86 20 fe 1c 85                 # e94d |   sub [A], G, -123
ee e0 e0 f8 aa 00 d0 01 e3 e6  # e952 |   jne [0xaa], 0x1d0, ${fail}:rel + PC
b2 20 2a 3e f6                 # e95c |   or [A], A*4 + B, A*4 + -10
ee e0 e0 f8 aa 00 ff 03 d4 e6  # e961 |   jne [0xaa], 0x3ff, ${fail}:rel + PC
b6 2a 20 2a                    # e96b |   xor [A*4 + B], A, A*4 + B
ee e0 e0 f8 63 03 c9 03 c6 e6  # e96f |   jne [0x363], 0x3c9, ${fail}:rel + PC
aa 21 fe 3e f6                 # e979 |   shl [A*2], G, A*4 + -10
ee e0 e0 f8 54 01 00 40 b7 e6  # e97e |   jne [0x154], 0x4000, ${fail}:rel + PC
ae 3e e0 21 f6 39 30           # e988 |   and [A*4 + -10], 0x3039, A*2
ee e0 1c f8 9e 02 10 a6 e6     # e98f |   jne [0x29e], 0x10, ${fail}:rel + PC
a2 e0 2a e4 39 30 de fa        # e998 |   shr [0x3039], A*4 + B, 0xfade + A
ee e0 1c f8 39 30 03 95 e6     # e9a0 |   jne [0x3039], 0x3, ${fail}:rel + PC
8a fe 21 2a                    # e9a9 |   mul [G], A*2, A*4 + B
ee e0 e0 f8 55 01 7c 7f 88 e6  # e9ad |   jne [0x155], 0x7f7c, ${fail}:rel + PC
a2 3e 3e fe f6 f6              # e9b7 |   shr [A*4 + -10], A*4 + -10, G
ee e0 1c f8 9e 02 14 78 e6     # e9bd |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 20 e0 e4 39 30 de fa        # e9c6 |   mul [A], 0x3039, 0xfade + A
ee e0 e0 f8 aa 00 48 81 67 e6  # e9ce |   jne [0xaa], 0x8148, ${fail}:rel + PC
8a 2a 1c 3e 85 f6              # e9d8 |   mul [A*4 + B], -123, A*4 + -10
ee e0 e0 f8 63 03 16 be 57 e6  # e9de |   jne [0x363], 0xbe16, ${fail}:rel + PC
ae 2a 1c fe 85                 # e9e8 |   and [A*4 + B], -123, G
ee e0 e0 f8 63 03 05 01 48 e6  # e9ed |   jne [0x363], 0x105, ${fail}:rel + PC
aa e0 e0 20 39 30 39 30        # e9f7 |   shl [0x3039], 0x3039, A
ee e0 e0 f8 39 30 00 e4 36 e6  # e9ff |   jne [0x3039], 0xe400, ${fail}:rel + PC
8e 20 fe 2a                    # ea09 |   imul [A], G, A*4 + B
ee e0 e0 f8 aa 00 df 82 28 e6  # ea0d |   jne [0xaa], 0x82df, ${fail}:rel + PC
86 3e 1c 3e f6 85 f6           # ea17 |   sub [A*4 + -10], -123, A*4 + -10
ee e0 e0 f8 9e 02 e7 fc 17 e6  # ea1e |   jne [0x29e], 0xfce7, ${fail}:rel + PC
aa 21 20 2a                    # ea28 |   shl [A*2], A, A*4 + B
ee e0 e0 f8 54 01 50 05 09 e6  # ea2c |   jne [0x154], 0x550, ${fail}:rel + PC
82 20 3e 21 f6                 # ea36 |   add [A], A*4 + -10, A*2
ee e0 e0 f8 aa 00 f2 03 fa e5  # ea3b |   jne [0xaa], 0x3f2, ${fail}:rel + PC
8a 21 fe 1c 85                 # ea45 |   mul [A*2], G, -123
ee e0 e0 f8 54 01 29 5c eb e5  # ea4a |   jne [0x154], 0x5c29, ${fail}:rel + PC
8a fe 1c e0 85 39 30           # ea54 |   mul [G], -123, 0x3039
ee e0 e0 f8 55 01 9d d4 da e5  # ea5b |   jne [0x155], 0xd49d, ${fail}:rel + PC
a6 e0 2a 2a 39 30              # ea65 |   ishr [0x3039], A*4 + B, A*4 + B
ee e0 1c f8 39 30 6c ca e5     # ea6b |   jne [0x3039], 0x6c, ${fail}:rel + PC
82 2a 1c 21 85                 # ea74 |   add [A*4 + B], -123, A*2
ee e0 e0 f8 63 03 d9 00 bc e5  # ea79 |   jne [0x363], 0xd9, ${fail}:rel + PC
8a e0 e0 fe 39 30 39 30        # ea83 |   mul [0x3039], 0x3039, G
ee e0 e0 f8 39 30 ed 3b aa e5  # ea8b |   jne [0x3039], 0x3bed, ${fail}:rel + PC
b2 e0 2a fe 39 30              # ea95 |   or [0x3039], A*4 + B, G
ee e0 e0 f8 39 30 77 03 9a e5  # ea9b |   jne [0x3039], 0x377, ${fail}:rel + PC
aa 2a 1c e0 85 39 30           # eaa5 |   shl [A*4 + B], -123, 0x3039
ee e0 e0 f8 63 03 00 0a 89 e5  # eaac |   jne [0x363], 0xa00, ${fail}:rel + PC
8a fe 1c 2a 85                 # eab6 |   mul [G], -123, A*4 + B
ee e0 e0 f8 55 01 6f 5f 7a e5  # eabb |   jne [0x155], 0x5f6f, ${fail}:rel + PC
ae 3e e0 fe f6 39 30           # eac5 |   and [A*4 + -10], 0x3039, G
ee e0 1c f8 9e 02 11 69 e5     # eacc |   jne [0x29e], 0x11, ${fail}:rel + PC
a6 2a 21 e4 de fa              # ead5 |   ishr [A*4 + B], A*2, 0xfade + A
ee e0 1c f8 63 03 01 5a e5     # eadb |   jne [0x363], 0x1, ${fail}:rel + PC
b2 21 21 2a                    # eae4 |   or [A*2], A*2, A*4 + B
ee e0 e0 f8 54 01 77 03 4d e5  # eae8 |   jne [0x154], 0x377, ${fail}:rel + PC
ae 2a fe fe                    # eaf2 |   and [A*4 + B], G, G
ee e0 e0 f8 63 03 55 01 3f e5  # eaf6 |   jne [0x363], 0x155, ${fail}:rel + PC
aa 2a 3e 3e f6 f6              # eb00 |   shl [A*4 + B], A*4 + -10, A*4 + -10
ee e0 e0 f8 63 03 00 80 2f e5  # eb06 |   jne [0x363], 0x8000, ${fail}:rel + PC
86 3e 2a 1c f6 85              # eb10 |   sub [A*4 + -10], A*4 + B, -123
ee e0 e0 f8 9e 02 de 03 1f e5  # eb16 |   jne [0x29e], 0x3de, ${fail}:rel + PC
ae fe fe 1c 85                 # eb20 |   and [G], G, -123
ee e0 e0 f8 55 01 05 01 10 e5  # eb25 |   jne [0x155], 0x105, ${fail}:rel + PC
a6 21 3e 1c f6 85              # eb2f |   ishr [A*2], A*4 + -10, -123
ee e0 1c f8 54 01 14 00 e5     # eb35 |   jne [0x154], 0x14, ${fail}:rel + PC
b2 e0 21 fe 39 30              # eb3e |   or [0x3039], A*2, G
ee e0 e0 f8 39 30 55 01 f1 e4  # eb44 |   jne [0x3039], 0x155, ${fail}:rel + PC
b2 2a 20 21                    # eb4e |   or [A*4 + B], A, A*2
ee e0 e0 f8 63 03 fe 01 e3 e4  # eb52 |   jne [0x363], 0x1fe, ${fail}:rel + PC
a2 21 20 e0 39 30              # eb5c |   shr [A*2], A, 0x3039
ee e0 00 f8 54 01 d3 e4        # eb62 |   jne [0x154], 0, ${fail}:rel + PC
8e 3e 3e e4 f6 f6 de fa        # eb6a |   imul [A*4 + -10], A*4 + -10, 0xfade + A
ee e0 e0 f8 9e 02 f0 4d c3 e4  # eb72 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
a2 2a 3e fe f6                 # eb7c |   shr [A*4 + B], A*4 + -10, G
ee e0 1c f8 63 03 14 b4 e4     # eb81 |   jne [0x363], 0x14, ${fail}:rel + PC
aa e0 2a 1c 39 30 85           # eb8a |   shl [0x3039], A*4 + B, -123
ee e0 e0 f8 39 30 60 6c a4 e4  # eb91 |   jne [0x3039], 0x6c60, ${fail}:rel + PC
86 e0 3e 20 39 30 f6           # eb9b |   sub [0x3039], A*4 + -10, A
ee e0 e0 f8 39 30 f4 01 93 e4  # eba2 |   jne [0x3039], 0x1f4, ${fail}:rel + PC
86 fe 3e fe f6                 # ebac |   sub [G], A*4 + -10, G
ee e0 e0 f8 55 01 49 01 84 e4  # ebb1 |   jne [0x155], 0x149, ${fail}:rel + PC
b6 20 20 2a                    # ebbb |   xor [A], A, A*4 + B
ee e0 e0 f8 aa 00 c9 03 76 e4  # ebbf |   jne [0xaa], 0x3c9, ${fail}:rel + PC
a2 20 21 21                    # ebc9 |   shr [A], A*2, A*2
ee e0 1c f8 aa 00 15 68 e4     # ebcd |   jne [0xaa], 0x15, ${fail}:rel + PC
82 2a e0 21 39 30              # ebd6 |   add [A*4 + B], 0x3039, A*2
ee e0 e0 f8 63 03 8d 31 59 e4  # ebdc |   jne [0x363], 0x318d, ${fail}:rel + PC
82 fe 2a 2a                    # ebe6 |   add [G], A*4 + B, A*4 + B
ee e0 e0 f8 55 01 c6 06 4b e4  # ebea |   jne [0x155], 0x6c6, ${fail}:rel + PC
aa 2a 2a 3e f6                 # ebf4 |   shl [A*4 + B], A*4 + B, A*4 + -10
ee e0 e0 f8 63 03 00 c0 3c e4  # ebf9 |   jne [0x363], 0xc000, ${fail}:rel + PC
b6 3e 2a 20 f6                 # ec03 |   xor [A*4 + -10], A*4 + B, A
ee e0 e0 f8 9e 02 c9 03 2d e4  # ec08 |   jne [0x29e], 0x3c9, ${fail}:rel + PC
8a 20 e4 1c de fa 85           # ec12 |   mul [A], 0xfade + A, -123
ee e0 e0 f8 aa 00 a8 25 1c e4  # ec19 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
ae 3e e0 e4 f6 39 30 de fa     # ec23 |   and [A*4 + -10], 0x3039, 0xfade + A
ee e0 e0 f8 9e 02 08 30 09 e4  # ec2c |   jne [0x29e], 0x3008, ${fail}:rel + PC
82 20 fe 21                    # ec36 |   add [A], G, A*2
ee e0 e0 f8 aa 00 a9 02 fb e3  # ec3a |   jne [0xaa], 0x2a9, ${fail}:rel + PC
86 fe e4 fe de fa              # ec44 |   sub [G], 0xfade + A, G
ee e0 e0 f8 55 01 33 fa eb e3  # ec4a |   jne [0x155], 0xfa33, ${fail}:rel + PC
a2 e0 3e e4 39 30 f6 de fa     # ec54 |   shr [0x3039], A*4 + -10, 0xfade + A
ee e0 1c f8 39 30 02 d8 e3     # ec5d |   jne [0x3039], 0x2, ${fail}:rel + PC
a2 3e 21 2a f6                 # ec66 |   shr [A*4 + -10], A*2, A*4 + B
ee e0 1c f8 9e 02 2a ca e3     # ec6b |   jne [0x29e], 0x2a, ${fail}:rel + PC
a2 fe 20 2a                    # ec74 |   shr [G], A, A*4 + B
ee e0 1c f8 55 01 15 bd e3     # ec78 |   jne [0x155], 0x15, ${fail}:rel + PC
8e 2a fe 21                    # ec81 |   imul [A*4 + B], G, A*2
ee e0 e0 f8 63 03 e4 c4 b0 e3  # ec85 |   jne [0x363], 0xc4e4, ${fail}:rel + PC
8a 3e e4 e4 f6 de fa de fa     # ec8f |   mul [A*4 + -10], 0xfade + A, 0xfade + A
ee e0 e0 f8 9e 02 40 f8 9d e3  # ec98 |   jne [0x29e], 0xf840, ${fail}:rel + PC
82 3e 2a e0 f6 39 30           # eca2 |   add [A*4 + -10], A*4 + B, 0x3039
ee e0 e0 f8 9e 02 9c 33 8c e3  # eca9 |   jne [0x29e], 0x339c, ${fail}:rel + PC
b6 2a fe 3e f6                 # ecb3 |   xor [A*4 + B], G, A*4 + -10
ee e0 e0 f8 63 03 cb 03 7d e3  # ecb8 |   jne [0x363], 0x3cb, ${fail}:rel + PC
b6 21 e4 20 de fa              # ecc2 |   xor [A*2], 0xfade + A, A
ee e0 e0 f8 54 01 22 fb 6d e3  # ecc8 |   jne [0x154], 0xfb22, ${fail}:rel + PC
a2 e0 e0 21 39 30 39 30        # ecd2 |   shr [0x3039], 0x3039, A*2
ee e0 e0 f8 39 30 03 03 5b e3  # ecda |   jne [0x3039], 0x303, ${fail}:rel + PC
8e 2a fe e0 39 30              # ece4 |   imul [A*4 + B], G, 0x3039
ee e0 e0 f8 63 03 ed 3b 4b e3  # ecea |   jne [0x363], 0x3bed, ${fail}:rel + PC
b6 e0 1c 21 39 30 85           # ecf4 |   xor [0x3039], -123, A*2
ee e0 e0 f8 39 30 d1 fe 3a e3  # ecfb |   jne [0x3039], 0xfed1, ${fail}:rel + PC
86 e0 fe e4 39 30 de fa        # ed05 |   sub [0x3039], G, 0xfade + A
ee e0 e0 f8 39 30 cd 05 28 e3  # ed0d |   jne [0x3039], 0x5cd, ${fail}:rel + PC
b6 20 21 e4 de fa              # ed17 |   xor [A], A*2, 0xfade + A
ee e0 e0 f8 aa 00 dc fa 18 e3  # ed1d |   jne [0xaa], 0xfadc, ${fail}:rel + PC
8a 21 3e e0 f6 39 30           # ed27 |   mul [A*2], A*4 + -10, 0x3039
ee e0 e0 f8 54 01 2e 35 07 e3  # ed2e |   jne [0x154], 0x352e, ${fail}:rel + PC
aa 2a 21 20                    # ed38 |   shl [A*4 + B], A*2, A
ee e0 e0 f8 63 03 00 50 f9 e2  # ed3c |   jne [0x363], 0x5000, ${fail}:rel + PC
ae fe 1c e4 85 de fa           # ed46 |   and [G], -123, 0xfade + A
ee e0 e0 f8 55 01 80 fb e8 e2  # ed4d |   jne [0x155], 0xfb80, ${fail}:rel + PC
a2 20 20 21                    # ed57 |   shr [A], A, A*2
ee e0 1c f8 aa 00 0a da e2     # ed5b |   jne [0xaa], 0xa, ${fail}:rel + PC
b6 3e 20 3e f6 f6              # ed64 |   xor [A*4 + -10], A, A*4 + -10
ee e0 e0 f8 9e 02 34 02 cb e2  # ed6a |   jne [0x29e], 0x234, ${fail}:rel + PC
aa 3e 3e 21 f6 f6              # ed74 |   shl [A*4 + -10], A*4 + -10, A*2
ee e0 e0 f8 9e 02 e0 29 bb e2  # ed7a |   jne [0x29e], 0x29e0, ${fail}:rel + PC
8a 20 3e 1c f6 85              # ed84 |   mul [A], A*4 + -10, -123
ee e0 e0 f8 aa 00 16 be ab e2  # ed8a |   jne [0xaa], 0xbe16, ${fail}:rel + PC
b2 fe fe e0 39 30              # ed94 |   or [G], G, 0x3039
ee e0 e0 f8 55 01 7d 31 9b e2  # ed9a |   jne [0x155], 0x317d, ${fail}:rel + PC
a2 2a e4 3e de fa f6           # eda4 |   shr [A*4 + B], 0xfade + A, A*4 + -10
ee e0 1c f8 63 03 03 8a e2     # edab |   jne [0x363], 0x3, ${fail}:rel + PC
8a 2a 20 e0 39 30              # edb4 |   mul [A*4 + B], A, 0x3039
ee e0 e0 f8 63 03 da 05 7b e2  # edba |   jne [0x363], 0x5da, ${fail}:rel + PC
ae 3e 21 e0 f6 39 30           # edc4 |   and [A*4 + -10], A*2, 0x3039
ee e0 1c f8 9e 02 10 6a e2     # edcb |   jne [0x29e], 0x10, ${fail}:rel + PC
ae e0 20 2a 39 30              # edd4 |   and [0x3039], A, A*4 + B
ee e0 1c f8 39 30 22 5b e2     # edda |   jne [0x3039], 0x22, ${fail}:rel + PC
8e fe 2a fe                    # ede3 |   imul [G], A*4 + B, G
ee e0 e0 f8 55 01 df 82 4e e2  # ede7 |   jne [0x155], 0x82df, ${fail}:rel + PC
86 e0 fe 2a 39 30              # edf1 |   sub [0x3039], G, A*4 + B
ee e0 e0 f8 39 30 f2 fd 3e e2  # edf7 |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
a2 2a fe 2a                    # ee01 |   shr [A*4 + B], G, A*4 + B
ee e0 1c f8 63 03 2a 30 e2     # ee05 |   jne [0x363], 0x2a, ${fail}:rel + PC
b2 3e fe fe f6                 # ee0e |   or [A*4 + -10], G, G
ee e0 e0 f8 9e 02 55 01 22 e2  # ee13 |   jne [0x29e], 0x155, ${fail}:rel + PC
b6 21 20 fe                    # ee1d |   xor [A*2], A, G
ee e0 e0 f8 54 01 ff 01 14 e2  # ee21 |   jne [0x154], 0x1ff, ${fail}:rel + PC
a2 fe 3e 1c f6 85              # ee2b |   shr [G], A*4 + -10, -123
ee e0 1c f8 55 01 14 04 e2     # ee31 |   jne [0x155], 0x14, ${fail}:rel + PC
a6 e0 fe 20 39 30              # ee3a |   ishr [0x3039], G, A
ee e0 00 f8 39 30 f5 e1        # ee40 |   jne [0x3039], 0, ${fail}:rel + PC
8a 21 1c e4 85 de fa           # ee48 |   mul [A*2], -123, 0xfade + A
ee e0 e0 f8 54 01 a8 25 e6 e1  # ee4f |   jne [0x154], 0x25a8, ${fail}:rel + PC
b2 21 e4 e0 de fa 39 30        # ee59 |   or [A*2], 0xfade + A, 0x3039
ee e0 e0 f8 54 01 b9 fb d4 e1  # ee61 |   jne [0x154], 0xfbb9, ${fail}:rel + PC
8e 2a e0 e4 39 30 de fa        # ee6b |   imul [A*4 + B], 0x3039, 0xfade + A
ee e0 e0 f8 63 03 48 81 c2 e1  # ee73 |   jne [0x363], 0x8148, ${fail}:rel + PC
b2 3e fe 1c f6 85              # ee7d |   or [A*4 + -10], G, -123
ee e0 1c f8 9e 02 d5 b2 e1     # ee83 |   jne [0x29e], 0xd5, ${fail}:rel + PC
a6 3e 21 20 f6                 # ee8c |   ishr [A*4 + -10], A*2, A
ee e0 00 f8 9e 02 a4 e1        # ee91 |   jne [0x29e], 0, ${fail}:rel + PC
ae 21 2a 1c 85                 # ee99 |   and [A*2], A*4 + B, -123
ee e0 e0 f8 54 01 01 03 97 e1  # ee9e |   jne [0x154], 0x301, ${fail}:rel + PC
b2 20 21 3e f6                 # eea8 |   or [A], A*2, A*4 + -10
ee e0 e0 f8 aa 00 de 03 88 e1  # eead |   jne [0xaa], 0x3de, ${fail}:rel + PC
82 fe 3e 20 f6                 # eeb7 |   add [G], A*4 + -10, A
ee e0 e0 f8 55 01 48 03 79 e1  # eebc |   jne [0x155], 0x348, ${fail}:rel + PC
aa 3e 20 e0 f6 39 30           # eec6 |   shl [A*4 + -10], A, 0x3039
ee e0 e0 f8 9e 02 00 54 68 e1  # eecd |   jne [0x29e], 0x5400, ${fail}:rel + PC
aa 20 e4 e4 de fa de fa        # eed7 |   shl [A], 0xfade + A, 0xfade + A
ee e0 e0 f8 aa 00 00 88 56 e1  # eedf |   jne [0xaa], 0x8800, ${fail}:rel + PC
8e fe 3e e0 f6 39 30           # eee9 |   imul [G], A*4 + -10, 0x3039
ee e0 e0 f8 55 01 2e 35 45 e1  # eef0 |   jne [0x155], 0x352e, ${fail}:rel + PC
82 e0 1c 1c 39 30 85 85        # eefa |   add [0x3039], -123, -123
ee e0 e0 f8 39 30 0a ff 33 e1  # ef02 |   jne [0x3039], 0xff0a, ${fail}:rel + PC
86 21 3e fe f6                 # ef0c |   sub [A*2], A*4 + -10, G
ee e0 e0 f8 54 01 49 01 24 e1  # ef11 |   jne [0x154], 0x149, ${fail}:rel + PC
a6 20 e4 fe de fa              # ef1b |   ishr [A], 0xfade + A, G
ee e0 1c f8 aa 00 dc 14 e1     # ef21 |   jne [0xaa], 0xdc, ${fail}:rel + PC
b6 20 e4 e0 de fa 39 30        # ef2a |   xor [A], 0xfade + A, 0x3039
ee e0 e0 f8 aa 00 b1 cb 03 e1  # ef32 |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
86 fe 21 e4 de fa              # ef3c |   sub [G], A*2, 0xfade + A
ee e0 e0 f8 55 01 cc 05 f3 e0  # ef42 |   jne [0x155], 0x5cc, ${fail}:rel + PC
82 2a e0 e0 39 30 39 30        # ef4c |   add [A*4 + B], 0x3039, 0x3039
ee e0 e0 f8 63 03 72 60 e1 e0  # ef54 |   jne [0x363], 0x6072, ${fail}:rel + PC
86 3e 1c e4 f6 85 de fa        # ef5e |   sub [A*4 + -10], -123, 0xfade + A
ee e0 e0 f8 9e 02 fd 03 cf e0  # ef66 |   jne [0x29e], 0x3fd, ${fail}:rel + PC
82 21 21 3e f6                 # ef70 |   add [A*2], A*2, A*4 + -10
ee e0 e0 f8 54 01 f2 03 c0 e0  # ef75 |   jne [0x154], 0x3f2, ${fail}:rel + PC
a2 20 e0 1c 39 30 85           # ef7f |   shr [A], 0x3039, -123
ee e0 e0 f8 aa 00 81 01 af e0  # ef86 |   jne [0xaa], 0x181, ${fail}:rel + PC
8e 21 20 3e f6                 # ef90 |   imul [A*2], A, A*4 + -10
ee e0 e0 f8 54 01 ec bc a0 e0  # ef95 |   jne [0x154], 0xbcec, ${fail}:rel + PC
b2 3e fe e4 f6 de fa           # ef9f |   or [A*4 + -10], G, 0xfade + A
ee e0 e0 f8 9e 02 dd fb 8f e0  # efa6 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
a6 fe 20 1c 85                 # efb0 |   ishr [G], A, -123
ee e0 1c f8 55 01 05 80 e0     # efb5 |   jne [0x155], 0x5, ${fail}:rel + PC
a6 21 20 e4 de fa              # efbe |   ishr [A*2], A, 0xfade + A
ee e0 00 f8 54 01 71 e0        # efc4 |   jne [0x154], 0, ${fail}:rel + PC
a2 e0 1c 20 39 30 85           # efcc |   shr [0x3039], -123, A
ee e0 1c f8 39 30 3f 62 e0     # efd3 |   jne [0x3039], 0x3f, ${fail}:rel + PC
8e 20 20 3e f6                 # efdc |   imul [A], A, A*4 + -10
ee e0 e0 f8 aa 00 ec bc 54 e0  # efe1 |   jne [0xaa], 0xbcec, ${fail}:rel + PC
82 2a e4 fe de fa              # efeb |   add [A*4 + B], 0xfade + A, G
ee e0 e0 f8 63 03 dd fc 44 e0  # eff1 |   jne [0x363], 0xfcdd, ${fail}:rel + PC
b6 fe e0 3e 39 30 f6           # effb |   xor [G], 0x3039, A*4 + -10
ee e0 e0 f8 55 01 a7 32 33 e0  # f002 |   jne [0x155], 0x32a7, ${fail}:rel + PC
8e 20 e0 2a 39 30              # f00c |   imul [A], 0x3039, A*4 + B
ee e0 e0 f8 aa 00 0b 51 23 e0  # f012 |   jne [0xaa], 0x510b, ${fail}:rel + PC
b2 3e e4 fe f6 de fa           # f01c |   or [A*4 + -10], 0xfade + A, G
ee e0 e0 f8 9e 02 dd fb 12 e0  # f023 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
86 21 1c 21 85                 # f02d |   sub [A*2], -123, A*2
ee e0 e0 f8 54 01 31 fe 03 e0  # f032 |   jne [0x154], 0xfe31, ${fail}:rel + PC
b2 2a 21 21                    # f03c |   or [A*4 + B], A*2, A*2
ee e0 e0 f8 63 03 54 01 f5 df  # f040 |   jne [0x363], 0x154, ${fail}:rel + PC
8e e0 20 3e 39 30 f6           # f04a |   imul [0x3039], A, A*4 + -10
ee e0 e0 f8 39 30 ec bc e4 df  # f051 |   jne [0x3039], 0xbcec, ${fail}:rel + PC
a6 3e e4 2a f6 de fa           # f05b |   ishr [A*4 + -10], 0xfade + A, A*4 + B
ee e0 e0 f8 9e 02 71 ff d3 df  # f062 |   jne [0x29e], 0xff71, ${fail}:rel + PC
ae e0 20 e4 39 30 de fa        # f06c |   and [0x3039], A, 0xfade + A
ee e0 e0 f8 39 30 88 00 c1 df  # f074 |   jne [0x3039], 0x88, ${fail}:rel + PC
a6 20 fe fe                    # f07e |   ishr [A], G, G
ee e0 1c f8 aa 00 0a b3 df     # f082 |   jne [0xaa], 0xa, ${fail}:rel + PC
8e 20 3e 20 f6                 # f08b |   imul [A], A*4 + -10, A
ee e0 e0 f8 aa 00 ec bc a5 df  # f090 |   jne [0xaa], 0xbcec, ${fail}:rel + PC
b2 e0 3e fe 39 30 f6           # f09a |   or [0x3039], A*4 + -10, G
ee e0 e0 f8 39 30 df 03 94 df  # f0a1 |   jne [0x3039], 0x3df, ${fail}:rel + PC
82 21 e0 e4 39 30 de fa        # f0ab |   add [A*2], 0x3039, 0xfade + A
ee e0 e0 f8 54 01 c1 2b 82 df  # f0b3 |   jne [0x154], 0x2bc1, ${fail}:rel + PC
82 e0 1c e4 39 30 85 de fa     # f0bd |   add [0x3039], -123, 0xfade + A
ee e0 e0 f8 39 30 0d fb 6f df  # f0c6 |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
b2 fe 20 21                    # f0d0 |   or [G], A, A*2
ee e0 e0 f8 55 01 fe 01 61 df  # f0d4 |   jne [0x155], 0x1fe, ${fail}:rel + PC
aa 21 2a 21                    # f0de |   shl [A*2], A*4 + B, A*2
ee e0 e0 f8 54 01 30 36 53 df  # f0e2 |   jne [0x154], 0x3630, ${fail}:rel + PC
82 e0 2a e0 39 30 39 30        # f0ec |   add [0x3039], A*4 + B, 0x3039
ee e0 e0 f8 39 30 9c 33 41 df  # f0f4 |   jne [0x3039], 0x339c, ${fail}:rel + PC
ae 2a 20 1c 85                 # f0fe |   and [A*4 + B], A, -123
ee e0 e0 f8 63 03 80 00 32 df  # f103 |   jne [0x363], 0x80, ${fail}:rel + PC
b6 e0 20 1c 39 30 85           # f10d |   xor [0x3039], A, -123
ee e0 e0 f8 39 30 2f ff 21 df  # f114 |   jne [0x3039], 0xff2f, ${fail}:rel + PC
ae 21 fe e0 39 30              # f11e |   and [A*2], G, 0x3039
ee e0 1c f8 54 01 11 11 df     # f124 |   jne [0x154], 0x11, ${fail}:rel + PC
ae 3e fe 3e f6 f6              # f12d |   and [A*4 + -10], G, A*4 + -10
ee e0 1c f8 9e 02 14 02 df     # f133 |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 3e 2a 2a f6                 # f13c |   mul [A*4 + -10], A*4 + B, A*4 + B
ee e0 e0 f8 9e 02 49 78 f4 de  # f141 |   jne [0x29e], 0x7849, ${fail}:rel + PC
82 20 3e e0 f6 39 30           # f14b |   add [A], A*4 + -10, 0x3039
ee e0 e0 f8 aa 00 d7 32 e3 de  # f152 |   jne [0xaa], 0x32d7, ${fail}:rel + PC
82 21 e0 3e 39 30 f6           # f15c |   add [A*2], 0x3039, A*4 + -10
ee e0 e0 f8 54 01 d7 32 d2 de  # f163 |   jne [0x154], 0x32d7, ${fail}:rel + PC
b6 21 3e 3e f6 f6              # f16d |   xor [A*2], A*4 + -10, A*4 + -10
ee e0 00 f8 54 01 c2 de        # f173 |   jne [0x154], 0, ${fail}:rel + PC
a6 e0 20 20 39 30              # f17b |   ishr [0x3039], A, A
ee e0 00 f8 39 30 b4 de        # f181 |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e0 3e 39 30 39 30 f6     # f189 |   ishr [0x3039], 0x3039, A*4 + -10
ee e0 00 f8 39 30 a3 de        # f192 |   jne [0x3039], 0, ${fail}:rel + PC
aa 20 1c 21 85                 # f19a |   shl [A], -123, A*2
ee e0 e0 f8 aa 00 50 f8 96 de  # f19f |   jne [0xaa], 0xf850, ${fail}:rel + PC
ae e0 21 e4 39 30 de fa        # f1a9 |   and [0x3039], A*2, 0xfade + A
ee e0 e0 f8 39 30 00 01 84 de  # f1b1 |   jne [0x3039], 0x100, ${fail}:rel + PC
b2 3e 1c 20 f6 85              # f1bb |   or [A*4 + -10], -123, A
ee e0 1c f8 9e 02 af 74 de     # f1c1 |   jne [0x29e], 0xaf, ${fail}:rel + PC
8e 21 1c 20 85                 # f1ca |   imul [A*2], -123, A
ee e0 e0 f8 54 01 52 ae 66 de  # f1cf |   jne [0x154], 0xae52, ${fail}:rel + PC
8a 2a 2a 2a                    # f1d9 |   mul [A*4 + B], A*4 + B, A*4 + B
ee e0 e0 f8 63 03 49 78 58 de  # f1dd |   jne [0x363], 0x7849, ${fail}:rel + PC
86 2a 2a e0 39 30              # f1e7 |   sub [A*4 + B], A*4 + B, 0x3039
ee e0 e0 f8 63 03 2a d3 48 de  # f1ed |   jne [0x363], 0xd32a, ${fail}:rel + PC
ae fe 1c 21 85                 # f1f7 |   and [G], -123, A*2
ee e0 e0 f8 55 01 04 01 39 de  # f1fc |   jne [0x155], 0x104, ${fail}:rel + PC
8e 21 e4 1c de fa 85           # f206 |   imul [A*2], 0xfade + A, -123
ee e0 e0 f8 54 01 a8 25 28 de  # f20d |   jne [0x154], 0x25a8, ${fail}:rel + PC
8a 21 21 e4 de fa              # f217 |   mul [A*2], A*2, 0xfade + A
ee e0 e0 f8 54 01 a0 10 18 de  # f21d |   jne [0x154], 0x10a0, ${fail}:rel + PC
86 fe e0 fe 39 30              # f227 |   sub [G], 0x3039, G
ee e0 e0 f8 55 01 e4 2e 08 de  # f22d |   jne [0x155], 0x2ee4, ${fail}:rel + PC
62 20 1c 85                    # f237 |   mov [A], -123
ee e0 1c f8 aa 00 85 fa dd     # f23b |   jne [0xaa], 0x85, ${fail}:rel + PC
62 3e 3e f6 f6                 # f244 |   mov [A*4 + -10], A*4 + -10
ee e0 e0 f8 9e 02 9e 02 ec dd  # f249 |   jne [0x29e], 0x29e, ${fail}:rel + PC
62 21 2a                       # f253 |   mov [A*2], A*4 + B
ee e0 e0 f8 54 01 63 03 df dd  # f256 |   jne [0x154], 0x363, ${fail}:rel + PC
62 e0 1c 39 30 85              # f260 |   mov [0x3039], -123
ee e0 1c f8 39 30 85 cf dd     # f266 |   jne [0x3039], 0x85, ${fail}:rel + PC
62 fe 3e f6                    # f26f |   mov [G], A*4 + -10
ee e0 e0 f8 55 01 9e 02 c2 dd  # f273 |   jne [0x155], 0x29e, ${fail}:rel + PC
62 e0 fe 39 30                 # f27d |   mov [0x3039], G
ee e0 e0 f8 39 30 55 01 b3 dd  # f282 |   jne [0x3039], 0x155, ${fail}:rel + PC
62 fe 21                       # f28c |   mov [G], A*2
ee e0 e0 f8 55 01 54 01 a6 dd  # f28f |   jne [0x155], 0x154, ${fail}:rel + PC
62 3e e4 f6 de fa              # f299 |   mov [A*4 + -10], 0xfade + A
ee e0 e0 f8 9e 02 88 fb 96 dd  # f29f |   jne [0x29e], 0xfb88, ${fail}:rel + PC
62 e0 e0 39 30 39 30           # f2a9 |   mov [0x3039], 0x3039
ee e0 e0 f8 39 30 39 30 85 dd  # f2b0 |   jne [0x3039], 0x3039, ${fail}:rel + PC
62 3e fe f6                    # f2ba |   mov [A*4 + -10], G
ee e0 e0 f8 9e 02 55 01 77 dd  # f2be |   jne [0x29e], 0x155, ${fail}:rel + PC
62 20 fe                       # f2c8 |   mov [A], G
ee e0 e0 f8 aa 00 55 01 6a dd  # f2cb |   jne [0xaa], 0x155, ${fail}:rel + PC
62 2a 2a                       # f2d5 |   mov [A*4 + B], A*4 + B
ee e0 e0 f8 63 03 63 03 5d dd  # f2d8 |   jne [0x363], 0x363, ${fail}:rel + PC
62 3e 2a f6                    # f2e2 |   mov [A*4 + -10], A*4 + B
ee e0 e0 f8 9e 02 63 03 4f dd  # f2e6 |   jne [0x29e], 0x363, ${fail}:rel + PC
62 2a 20                       # f2f0 |   mov [A*4 + B], A
ee e0 e0 f8 63 03 aa 00 42 dd  # f2f3 |   jne [0x363], 0xaa, ${fail}:rel + PC
62 3e 20 f6                    # f2fd |   mov [A*4 + -10], A
ee e0 e0 f8 9e 02 aa 00 34 dd  # f301 |   jne [0x29e], 0xaa, ${fail}:rel + PC
62 20 20                       # f30b |   mov [A], A
ee e0 e0 f8 aa 00 aa 00 27 dd  # f30e |   jne [0xaa], 0xaa, ${fail}:rel + PC
62 2a e4 de fa                 # f318 |   mov [A*4 + B], 0xfade + A
ee e0 e0 f8 63 03 88 fb 18 dd  # f31d |   jne [0x363], 0xfb88, ${fail}:rel + PC
62 21 1c 85                    # f327 |   mov [A*2], -123
ee e0 1c f8 54 01 85 0a dd     # f32b |   jne [0x154], 0x85, ${fail}:rel + PC
62 2a e0 39 30                 # f334 |   mov [A*4 + B], 0x3039
ee e0 e0 f8 63 03 39 30 fc dc  # f339 |   jne [0x363], 0x3039, ${fail}:rel + PC
62 3e 1c f6 85                 # f343 |   mov [A*4 + -10], -123
ee e0 1c f8 9e 02 85 ed dc     # f348 |   jne [0x29e], 0x85, ${fail}:rel + PC
62 3e 21 f6                    # f351 |   mov [A*4 + -10], A*2
ee e0 e0 f8 9e 02 54 01 e0 dc  # f355 |   jne [0x29e], 0x154, ${fail}:rel + PC
62 21 3e f6                    # f35f |   mov [A*2], A*4 + -10
ee e0 e0 f8 54 01 9e 02 d2 dc  # f363 |   jne [0x154], 0x29e, ${fail}:rel + PC
62 e0 21 39 30                 # f36d |   mov [0x3039], A*2
ee e0 e0 f8 39 30 54 01 c3 dc  # f372 |   jne [0x3039], 0x154, ${fail}:rel + PC
62 21 fe                       # f37c |   mov [A*2], G
ee e0 e0 f8 54 01 55 01 b6 dc  # f37f |   jne [0x154], 0x155, ${fail}:rel + PC
62 2a fe                       # f389 |   mov [A*4 + B], G
ee e0 e0 f8 63 03 55 01 a9 dc  # f38c |   jne [0x363], 0x155, ${fail}:rel + PC
62 21 e4 de fa                 # f396 |   mov [A*2], 0xfade + A
ee e0 e0 f8 54 01 88 fb 9a dc  # f39b |   jne [0x154], 0xfb88, ${fail}:rel + PC
62 20 3e f6                    # f3a5 |   mov [A], A*4 + -10
ee e0 e0 f8 aa 00 9e 02 8c dc  # f3a9 |   jne [0xaa], 0x29e, ${fail}:rel + PC
62 e0 3e 39 30 f6              # f3b3 |   mov [0x3039], A*4 + -10
ee e0 e0 f8 39 30 9e 02 7c dc  # f3b9 |   jne [0x3039], 0x29e, ${fail}:rel + PC
62 2a 3e f6                    # f3c3 |   mov [A*4 + B], A*4 + -10
ee e0 e0 f8 63 03 9e 02 6e dc  # f3c7 |   jne [0x363], 0x29e, ${fail}:rel + PC
62 e0 e4 39 30 de fa           # f3d1 |   mov [0x3039], 0xfade + A
ee e0 e0 f8 39 30 88 fb 5d dc  # f3d8 |   jne [0x3039], 0xfb88, ${fail}:rel + PC
62 21 e0 39 30                 # f3e2 |   mov [A*2], 0x3039
ee e0 e0 f8 54 01 39 30 4e dc  # f3e7 |   jne [0x154], 0x3039, ${fail}:rel + PC
62 fe 1c 85                    # f3f1 |   mov [G], -123
ee e0 1c f8 55 01 85 40 dc     # f3f5 |   jne [0x155], 0x85, ${fail}:rel + PC
62 e0 2a 39 30                 # f3fe |   mov [0x3039], A*4 + B
ee e0 e0 f8 39 30 63 03 32 dc  # f403 |   jne [0x3039], 0x363, ${fail}:rel + PC
62 fe e4 de fa                 # f40d |   mov [G], 0xfade + A
ee e0 e0 f8 55 01 88 fb 23 dc  # f412 |   jne [0x155], 0xfb88, ${fail}:rel + PC
62 20 e0 39 30                 # f41c |   mov [A], 0x3039
ee e0 e0 f8 aa 00 39 30 14 dc  # f421 |   jne [0xaa], 0x3039, ${fail}:rel + PC
62 20 21                       # f42b |   mov [A], A*2
ee e0 e0 f8 aa 00 54 01 07 dc  # f42e |   jne [0xaa], 0x154, ${fail}:rel + PC
62 3e e0 f6 39 30              # f438 |   mov [A*4 + -10], 0x3039
ee e0 e0 f8 9e 02 39 30 f7 db  # f43e |   jne [0x29e], 0x3039, ${fail}:rel + PC
62 fe 20                       # f448 |   mov [G], A
ee e0 e0 f8 55 01 aa 00 ea db  # f44b |   jne [0x155], 0xaa, ${fail}:rel + PC
62 21 20                       # f455 |   mov [A*2], A
ee e0 e0 f8 54 01 aa 00 dd db  # f458 |   jne [0x154], 0xaa, ${fail}:rel + PC
62 fe fe                       # f462 |   mov [G], G
ee e0 e0 f8 55 01 55 01 d0 db  # f465 |   jne [0x155], 0x155, ${fail}:rel + PC
62 20 2a                       # f46f |   mov [A], A*4 + B
ee e0 e0 f8 aa 00 63 03 c3 db  # f472 |   jne [0xaa], 0x363, ${fail}:rel + PC
62 2a 1c 85                    # f47c |   mov [A*4 + B], -123
ee e0 1c f8 63 03 85 b5 db     # f480 |   jne [0x363], 0x85, ${fail}:rel + PC
62 2a 21                       # f489 |   mov [A*4 + B], A*2
ee e0 e0 f8 63 03 54 01 a9 db  # f48c |   jne [0x363], 0x154, ${fail}:rel + PC
62 e0 20 39 30                 # f496 |   mov [0x3039], A
ee e0 e0 f8 39 30 aa 00 9a db  # f49b |   jne [0x3039], 0xaa, ${fail}:rel + PC
62 fe e0 39 30                 # f4a5 |   mov [G], 0x3039
ee e0 e0 f8 55 01 39 30 8b db  # f4aa |   jne [0x155], 0x3039, ${fail}:rel + PC
62 21 21                       # f4b4 |   mov [A*2], A*2
ee e0 e0 f8 54 01 54 01 7e db  # f4b7 |   jne [0x154], 0x154, ${fail}:rel + PC
62 fe 2a                       # f4c1 |   mov [G], A*4 + B
ee e0 e0 f8 55 01 63 03 71 db  # f4c4 |   jne [0x155], 0x363, ${fail}:rel + PC
62 20 e4 de fa                 # f4ce |   mov [A], 0xfade + A
ee e0 e0 f8 aa 00 88 fb 62 db  # f4d3 |   jne [0xaa], 0xfb88, ${fail}:rel + PC
e0 2a                          # f4dd |   push A*4 + B
e4 80                          # f4df |   pop D
ec 80 e0 f8 63 03 54 db        # f4e1 |   jne D, 0x363, ${fail}:rel + PC
e0 1c 85                       # f4e9 |   push -123
e4 80                          # f4ec |   pop D
ec 80 1c f8 85 47 db           # f4ee |   jne D, 0x85, ${fail}:rel + PC
e0 fe                          # f4f5 |   push G
e4 80                          # f4f7 |   pop D
ec 80 e0 f8 55 01 3c db        # f4f9 |   jne D, 0x155, ${fail}:rel + PC
e0 3e f6                       # f501 |   push A*4 + -10
e4 80                          # f504 |   pop D
ec 80 e0 f8 9e 02 2f db        # f506 |   jne D, 0x29e, ${fail}:rel + PC
e0 20                          # f50e |   push A
e4 80                          # f510 |   pop D
ec 80 e0 f8 aa 00 23 db        # f512 |   jne D, 0xaa, ${fail}:rel + PC
e0 e4 de fa                    # f51a |   push 0xfade + A
e4 80                          # f51e |   pop D
ec 80 e0 f8 88 fb 15 db        # f520 |   jne D, 0xfb88, ${fail}:rel + PC
e0 21                          # f528 |   push A*2
e4 80                          # f52a |   pop D
ec 80 e0 f8 54 01 09 db        # f52c |   jne D, 0x154, ${fail}:rel + PC
e0 e0 39 30                    # f534 |   push 0x3039
e4 80                          # f538 |   pop D
ec 80 e0 f8 39 30 fb da        # f53a |   jne D, 0x3039, ${fail}:rel + PC
5c f8 10 00                    # f542 |   call ${_L_test_uop_get_arg_1}:rel + PC
ec 60 e0 f8 fe ad ef da        # f546 |   jne C, 0xadfe, ${fail}:rel + PC
58 f8 0e 00                    # f54e |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                               #      | _L_test_uop_get_arg_1:
60 60 e0 fe ad                 # f552 |   mov C, 0xadfe
dc                             # f557 |   ret
58 f8 dd da                    # f558 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_get_arg_2:
                               #      | test_uop_alu_2dd:
60 20 e0 cd ab                 # f55c |   mov A, 0xabcd
00 20 e0 ab cd                 # f561 |   add A, 0xcdab
ec 20 e0 f8 78 79 cf da        # f566 |   jne A, 0x7978, ${fail}:rel + PC
                               #      | test_uop_alu_2di:
60 20 e0 00 10                 # f56e |   mov A, 0x1000
62 e0 e0 00 10 bc 0a           # f573 |   mov [0x1000], 0xabc
01 20 20                       # f57a |   add A, [A]
ec 20 e0 f8 bc 1a b8 da        # f57d |   jne A, 0x1abc, ${fail}:rel + PC
                               #      | test_uop_alu_2id:
62 e0 e0 00 10 34 12           # f585 |   mov [0x1000], 0x1234
02 e0 e0 00 10 21 43           # f58c |   add [0x1000], 0x4321
61 20 e0 00 10                 # f593 |   mov A, [0x1000]
ec 20 e0 f8 55 55 9d da        # f598 |   jne A, 0x5555, ${fail}:rel + PC
                               #      | test_uop_alu_2ii:
62 e0 e0 00 10 34 12           # f5a0 |   mov [0x1000], 0x1234
62 e0 e0 05 10 aa aa           # f5a7 |   mov [0x1005], 0xaaaa
03 e0 e0 05 10 00 10           # f5ae |   add [0x1005], [0x1000]
ee e0 e0 f8 05 10 de bc 80 da  # f5b5 |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                               #      | test_uop_alu_3dd:
60 20 e0 fe ab                 # f5bf |   mov A, 0xabfe
60 40 e0 55 55                 # f5c4 |   mov B, 0x5555
80 60 20 40                    # f5c9 |   add C, A, B
ec 20 e0 f8 fe ab 68 da        # f5cd |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 60 da        # f5d5 |   jne B, 0x5555, ${fail}:rel + PC
ec 60 e0 f8 53 01 58 da        # f5dd |   jne C, 0x153, ${fail}:rel + PC
                               #      | test_uop_alu_3di:
62 e0 e0 00 10 aa 12           # f5e5 |   mov [0x1000], 0x12aa
60 40 e0 de fa                 # f5ec |   mov B, 0xfade
b5 20 e0 40 00 10              # f5f1 |   xor A, [0x1000], B
ee e0 e0 f8 00 10 aa 12 3e da  # f5f7 |   jne [0x1000], 0x12aa, ${fail}:rel + PC
ec 40 e0 f8 de fa 34 da        # f601 |   jne B, 0xfade, ${fail}:rel + PC
ec 20 e0 f8 74 e8 2c da        # f609 |   jne A, 0xe874, ${fail}:rel + PC
                               #      | test_uop_alu_3id:
60 20 e0 fe ab                 # f611 |   mov A, 0xabfe
60 40 e0 55 55                 # f616 |   mov B, 0x5555
86 e0 20 40 00 10              # f61b |   sub [0x1000], A, B
ec 20 e0 f8 fe ab 14 da        # f621 |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 0c da        # f629 |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 00 10 a9 56 04 da  # f631 |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                               #      | test_uop_alu_3ii:
62 e0 e0 00 10 fe ab           # f63b |   mov [0x1000], 0xabfe
60 40 e0 55 55                 # f642 |   mov B, 0x5555
af e0 e0 40 02 10 00 10        # f647 |   and [0x1002], [0x1000], B
ee e0 e0 f8 00 10 fe ab e6 d9  # f64f |   jne [0x1000], 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 dc d9        # f659 |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 02 10 54 01 d4 d9  # f661 |   jne [0x1002], 0x154, ${fail}:rel + PC
                               #      | test_uop_alu_single_1dx:
60 20 e0 00 ff                 # f66b |   mov A, 0xff00
3c 20                          # f670 |   not A
ec 20 e0 f8 ff 00 c3 d9        # f672 |   jne A, 0xff, ${fail}:rel + PC
                               #      | test_uop_alu_single_1ix:
62 1c e0 64 34 12              # f67a |   mov [0x64], 0x1234
3a 1c 64                       # f680 |   neg [0x64]
ee 1c e0 f8 64 cc ed b2 d9     # f683 |   jne [0x64], 0xedcc, ${fail}:rel + PC
                               #      | test_uop_alu_single_2dd:
60 40 e0 ff 00                 # f68c |   mov B, 0xff
bc 20 40                       # f691 |   not A, B
ec 40 e0 f8 ff 00 a1 d9        # f694 |   jne B, 0xff, ${fail}:rel + PC
ec 20 e0 f8 00 ff 99 d9        # f69c |   jne A, 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2di:
62 1c e0 64 34 12              # f6a4 |   mov [0x64], 0x1234
bd 20 1c 64                    # f6aa |   not A, [0x64]
ee 1c e0 f8 64 34 12 87 d9     # f6ae |   jne [0x64], 0x1234, ${fail}:rel + PC
ec 20 e0 f8 cb ed 7e d9        # f6b7 |   jne A, 0xedcb, ${fail}:rel + PC
                               #      | test_uop_alu_single_2id:
60 40 e0 ff 00                 # f6bf |   mov B, 0xff
be 1c 40 64                    # f6c4 |   not [0x64], B
ec 40 e0 f8 ff 00 6d d9        # f6c8 |   jne B, 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff 65 d9     # f6d0 |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2ii:
62 1c e0 66 ff 00              # f6d9 |   mov [0x66], 0xff
bf 1c 1c 64 66                 # f6df |   not [0x64], [0x66]
ee 1c e0 f8 66 ff 00 51 d9     # f6e4 |   jne [0x66], 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff 48 d9     # f6ed |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_cmp_dd:
60 40 1c 7b                    # f6f6 |   mov B, 0x7b
50 40 e0 c8 01                 # f6fa |   cmp B, 0x1c8
4c 20                          # f6ff |   getf A
ec 40 1c f8 7b 34 d9           # f701 |   jne B, 0x7b, ${fail}:rel + PC
ec 20 1c f8 0e 2d d9           # f708 |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_di:
62 1c 1c 64 85                 # f70f |   mov [0x64], -123
60 40 e0 c8 01                 # f714 |   mov B, 0x1c8
d1 40 1c 64                    # f719 |   icmp B, [0x64]
4c 20                          # f71d |   getf A
ec 40 e0 f8 c8 01 16 d9        # f71f |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 32 0e d9           # f727 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_cmp_id:
62 1c 1c 64 85                 # f72e |   mov [0x64], -123
60 40 e0 c8 01                 # f733 |   mov B, 0x1c8
d2 1c 40 64                    # f738 |   icmp [0x64], B
4c 20                          # f73c |   getf A
ec 40 e0 f8 c8 01 f7 d8        # f73e |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 0e ef d8           # f746 |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_ii:
62 1c 1c 64 85                 # f74d |   mov [0x64], -123
62 1c e0 66 38 fe              # f752 |   mov [0x66], 0xfe38
d3 1c 1c 64 66                 # f758 |   icmp [0x64], [0x66]
4c 20                          # f75d |   getf A
ee 1c 1c f8 64 85 d6 d8        # f75f |   jne [0x64], -123, ${fail}:rel + PC
ee 1c e0 f8 66 38 fe ce d8     # f767 |   jne [0x66], 0xfe38, ${fail}:rel + PC
ec 20 1c f8 32 c5 d8           # f770 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_jmp_d:
60 20 e0 82 f7                 # f777 |   mov A, ${_L_test_uop_jmp_d_okay}
58 20                          # f77c |   jmp A
58 f8 b7 d8                    # f77e |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_d_okay:
                               #      | test_uop_jmp_i:
62 1c e0 64 8f f7              # f782 |   mov [0x64], ${_L_test_uop_jmp_i_okay}
5a 1c 64                       # f788 |   jmp [0x64]
58 f8 aa d8                    # f78b |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_i_okay:
ee 1c e0 f8 64 8f f7 a6 d8     # f78f |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_i:
62 1c e0 64 ae f7              # f798 |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
50 1c 1c 01 02                 # f79e |   cmp 0x1, 0x2
68 f8 92 d8                    # f7a3 |   jeq ${fail}:rel + PC
6e 1c 64                       # f7a7 |   jne [0x64]
58 f8 8b d8                    # f7aa |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_i_okay:
ee 1c e0 f8 64 ae f7 87 d8     # f7ae |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_d:
60 20 e0 cb f7                 # f7b7 |   mov A, ${_L_test_uop_jmp_cond_d_okay}
50 1c 1c 01 01                 # f7bc |   cmp 0x1, 0x1
6c f8 74 d8                    # f7c1 |   jne ${fail}:rel + PC
68 20                          # f7c5 |   jeq A
58 f8 6e d8                    # f7c7 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_d_okay:
ec 20 e0 f8 cb f7 6a d8        # f7cb |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_3dd:
60 20 1c 7b                    # f7d3 |   mov A, 0x7b
ec 20 1c f8 7b 5e d8           # f7d7 |   jne A, 0x7b, ${fail}:rel + PC
e8 20 1c f8 7b 0b 00           # f7de |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
58 f8 50 d8                    # f7e5 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3dd_okay:
ec 20 1c f8 7b 4c d8           # f7e9 |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_jmp_3di:
60 20 1c 7b                    # f7f0 |   mov A, 0x7b
62 1c e0 64 41 01              # f7f4 |   mov [0x64], 0x141
e9 20 1c f8 64 3b d8           # f7fa |   jeq A, [0x64], ${fail}:rel + PC
ed 20 1c f8 64 0b 00           # f801 |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
58 f8 2d d8                    # f808 |   jmp ${fail}:rel + PC
                               #      | test_uop_jmp_3di_okay:
ec 20 1c f8 7b 29 d8           # f80c |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 22 d8     # f813 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3id:
60 20 1c 7b                    # f81c |   mov A, 0x7b
62 1c e0 64 41 01              # f820 |   mov [0x64], 0x141
ea 1c 20 f8 64 0f d8           # f826 |   jeq [0x64], A, ${fail}:rel + PC
ee 1c 20 f8 64 0b 00           # f82d |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
58 f8 01 d8                    # f834 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3id_okay:
ec 20 1c f8 7b fd d7           # f838 |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 f6 d7     # f83f |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3ii:
62 e0 1c c8 00 7b              # f848 |   mov [0xc8], 0x7b
62 1c e0 64 41 01              # f84e |   mov [0x64], 0x141
eb 1c e0 f8 64 c8 00 e1 d7     # f854 |   jeq [0x64], [0xc8], ${fail}:rel + PC
ef 1c e0 f8 64 c8 00 0d 00     # f85d |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
58 f8 cf d7                    # f866 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3ii_okay:
ee e0 1c f8 c8 00 7b cb d7     # f86a |   jne [0xc8], 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 c2 d7     # f873 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_mov_dd:
60 20 1c 7b                    # f87c |   mov A, 0x7b
ec 20 1c f8 7b b5 d7           # f880 |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_mov_di:
62 1c 1c 64 da                 # f887 |   mov [0x64], 0xda
61 20 1c 64                    # f88c |   mov A, [0x64]
ec 20 1c f8 da a5 d7           # f890 |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_mov_id:
62 1c 1c 64 ff                 # f897 |   mov [0x64], 0xff
ee 1c 1c f8 64 ff 99 d7        # f89c |   jne [0x64], 0xff, ${fail}:rel + PC
                               #      | test_uop_mov_ii:
60 20 1c 14                    # f8a4 |   mov A, 0x14
62 1c e0 78 fa fd              # f8a8 |   mov [0x78], 0xfdfa
63 1c 3c 64 64                 # f8ae |   mov [0x64], [A + 0x64]
ee 1c e0 f8 64 fa fd 82 d7     # f8b3 |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                               #      | test_uop_bmov_dd:
64 20 e0 de af                 # f8bc |   bmov A, 0xafde
ec 20 e0 f8 de 00 74 d7        # f8c1 |   jne A, 0xde, ${fail}:rel + PC
64 20 e0 fa 00                 # f8c9 |   bmov A, 0xfa
ec 20 e0 f8 fa 00 67 d7        # f8ce |   jne A, 0xfa, ${fail}:rel + PC
                               #      | test_uop_bmov_di:
62 1c 1c 64 da                 # f8d6 |   mov [0x64], 0xda
65 20 1c 64                    # f8db |   bmov A, [0x64]
ec 20 e0 f8 da 00 56 d7        # f8df |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_bmov_id:
62 1c e0 64 cd ab              # f8e7 |   mov [0x64], 0xabcd
62 1c e0 66 34 12              # f8ed |   mov [0x66], 0x1234
62 1c e0 68 78 56              # f8f3 |   mov [0x68], 0x5678
66 1c e0 66 df 00              # f8f9 |   bmov [0x66], 0xdf
ee 1c e0 f8 64 cd ab 36 d7     # f8ff |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df 12 2d d7     # f908 |   jne [0x66], 0x12df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 24 d7     # f911 |   jne [0x68], 0x5678, ${fail}:rel + PC
66 1c e0 67 b8 00              # f91a |   bmov [0x67], 0xb8
ee 1c e0 f8 64 cd ab 15 d7     # f920 |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df b8 0c d7     # f929 |   jne [0x66], 0xb8df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 03 d7     # f932 |   jne [0x68], 0x5678, ${fail}:rel + PC
                               #      | test_uop_bmov_ii:
62 e0 e0 2c 01 df 00           # f93b |   mov [0x12c], 0xdf
62 e0 e0 2e 01 b8 00           # f942 |   mov [0x12e], 0xb8
62 e0 e0 c8 00 cd ab           # f949 |   mov [0xc8], 0xabcd
62 e0 e0 ca 00 34 12           # f950 |   mov [0xca], 0x1234
62 e0 e0 cc 00 78 56           # f957 |   mov [0xcc], 0x5678
67 e0 e0 ca 00 2c 01           # f95e |   bmov [0xca], [0x12c]
ee e0 e0 f8 c8 00 cd ab d0 d6  # f965 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df 12 c6 d6  # f96f |   jne [0xca], 0x12df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 bc d6  # f979 |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 b2 d6  # f983 |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 a8 d6  # f98d |   jne [0x12e], 0xb8, ${fail}:rel + PC
67 e0 e0 cb 00 2e 01           # f997 |   bmov [0xcb], [0x12e]
ee e0 e0 f8 c8 00 cd ab 97 d6  # f99e |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df b8 8d d6  # f9a8 |   jne [0xca], 0xb8df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 83 d6  # f9b2 |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 79 d6  # f9bc |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 6f d6  # f9c6 |   jne [0x12e], 0xb8, ${fail}:rel + PC
                               #      | test_uop_halt:
                               #      | test_uop_getf:
50 1c 1c 7b 2d                 # f9d0 |   cmp 0x7b, 0x2d
4c 20                          # f9d5 |   getf A
ec 20 1c f8 32 5e d6           # f9d7 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_setf:
cc 1c ff                       # f9de |   setf 0xff
4c 20                          # f9e1 |   getf A
ec 20 1c f8 3f 52 d6           # f9e3 |   jne A, 0x3f, ${fail}:rel + PC
                               #      | test_uop_call_d:
60 a0 e0 00 10                 # f9ea |   mov SP, 0x1000
60 40 e0 0a fa                 # f9ef |   mov B, ${_L_test_uop_call_d_fn}
5c 40                          # f9f4 |   call B
ec 40 e0 f8 0a fa 3f d6        # f9f6 |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
ec 20 e0 f8 fa 34 37 d6        # f9fe |   jne A, 0x34fa, ${fail}:rel + PC
58 f8 0a 00                    # fa06 |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                               #      | _L_test_uop_call_d_fn:
60 20 e0 fa 34                 # fa0a |   mov A, 0x34fa
dc                             # fa0f |   ret
                               #      | _L_test_uop_call_d_okay:
                               #      | test_uop_call_i:
60 a0 e0 00 10                 # fa10 |   mov SP, 0x1000
60 40 1c 64                    # fa15 |   mov B, 0x64
62 40 e0 34 fa                 # fa19 |   mov [B], ${_L_test_uop_call_i_fn}
5e 40                          # fa1e |   call [B]
ee 40 e0 f8 34 fa 15 d6        # fa20 |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
ec 20 e0 f8 d4 aa 0d d6        # fa28 |   jne A, 0xaad4, ${fail}:rel + PC
58 f8 0a 00                    # fa30 |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                               #      | _L_test_uop_call_i_fn:
60 20 e0 d4 aa                 # fa34 |   mov A, 0xaad4
dc                             # fa39 |   ret
                               #      | _L_test_uop_call_i_okay:
                               #      | test_uop_ret:
                               #      | test_uop_push_d:
60 a0 e0 00 10                 # fa3a |   mov SP, 0x1000
60 40 1c 64                    # fa3f |   mov B, 0x64
e0 40                          # fa43 |   push B
ec a0 e0 f8 fe 0f f0 d5        # fa45 |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 1c f8 fe 0f 64 e8 d5     # fa4d |   jne [0xffe], 0x64, ${fail}:rel + PC
e4 60                          # fa56 |   pop C
ec 60 1c f8 64 dd d5           # fa58 |   jne C, 0x64, ${fail}:rel + PC
                               #      | test_uop_push_i:
60 a0 e0 00 10                 # fa5f |   mov SP, 0x1000
60 40 1c 64                    # fa64 |   mov B, 0x64
62 40 e0 90 01                 # fa68 |   mov [B], 0x190
e2 40                          # fa6d |   push [B]
ec a0 e0 f8 fe 0f c6 d5        # fa6f |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 90 01 be d5  # fa77 |   jne [0xffe], 0x190, ${fail}:rel + PC
e4 60                          # fa81 |   pop C
ec 60 e0 f8 90 01 b2 d5        # fa83 |   jne C, 0x190, ${fail}:rel + PC
                               #      | test_uop_pop_d:
60 a0 e0 00 10                 # fa8b |   mov SP, 0x1000
e0 e0 da fa                    # fa90 |   push 0xfada
e4 20                          # fa94 |   pop A
ec 20 e0 f8 da fa 9f d5        # fa96 |   jne A, 0xfada, ${fail}:rel + PC
                               #      | test_uop_pop_i:
60 a0 e0 00 10                 # fa9e |   mov SP, 0x1000
e0 e0 da f2                    # faa3 |   push 0xf2da
e6 1c 64                       # faa7 |   pop [0x64]
ee 1c e0 f8 64 da f2 8b d5     # faaa |   jne [0x64], 0xf2da, ${fail}:rel + PC
                               #      | test_uop_mmap:
62 e0 e0 00 30 00 ff           # fab3 |   mov [0x3000], 0xff00
62 e0 e0 00 31 01 ff           # faba |   mov [0x3100], 0xff01
62 e0 e0 00 32 02 ff           # fac1 |   mov [0x3200], 0xff02
62 e0 e0 00 40 00 dd           # fac8 |   mov [0x4000], 0xdd00
62 e0 e0 00 41 01 dd           # facf |   mov [0x4100], 0xdd01
62 e0 e0 00 42 02 dd           # fad6 |   mov [0x4200], 0xdd02
62 e0 e0 00 50 00 ee           # fadd |   mov [0x5000], 0xee00
62 e0 e0 00 51 01 ee           # fae4 |   mov [0x5100], 0xee01
62 e0 e0 00 52 02 ee           # faeb |   mov [0x5200], 0xee02
60 20 00                       # faf2 |   mov A, 0
60 40 e0 00 41                 # faf5 |   mov B, 0x4100
54 e0 e0 1c 00 31 ff 32 01     # fafa |   mmap 0x3100, 0x32ff, 0x1
ee e0 e0 f8 00 31 01 dd 32 d5  # fb03 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 dd 28 d5  # fb0d |   jne [0x3200], 0xdd02, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff 1e d5  # fb17 |   jne [0x3000], 0xff00, ${fail}:rel + PC
60 40 e0 00 51                 # fb21 |   mov B, 0x5100
54 e0 e0 1c 00 32 ff 32 02     # fb26 |   mmap 0x3200, 0x32ff, 0x2
ee e0 e0 f8 00 32 01 ee 06 d5  # fb2f |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff fc d4  # fb39 |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 dd f2 d4  # fb43 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
d4 1c 01                       # fb4d |   umap 0x1
ee e0 e0 f8 00 31 01 ff e5 d4  # fb50 |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 01 ee db d4  # fb5a |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff d1 d4  # fb64 |   jne [0x3000], 0xff00, ${fail}:rel + PC
d4 1c 02                       # fb6e |   umap 0x2
ee e0 e0 f8 00 30 00 ff c4 d4  # fb71 |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 ff ba d4  # fb7b |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 ff b0 d4  # fb85 |   jne [0x3200], 0xff02, ${fail}:rel + PC
                               #      | test_uop_umap:
                               #      | test_aux_reg:
60 20 1c 01                    # fb8f |   mov A, 0x1
60 40 1c 02                    # fb93 |   mov B, 0x2
60 60 1c 03                    # fb97 |   mov C, 0x3
60 80 1c 04                    # fb9b |   mov D, 0x4
60 fc 1c 05                    # fb9f |   mov E, 0x5
60 fd 1c 06                    # fba3 |   mov F, 0x6
60 fe 1c 07                    # fba7 |   mov G, 0x7
60 ff 1c 08                    # fbab |   mov H, 0x8
ec 20 1c f8 01 86 d4           # fbaf |   jne A, 0x1, ${fail}:rel + PC
ec 40 1c f8 02 7f d4           # fbb6 |   jne B, 0x2, ${fail}:rel + PC
ec 60 1c f8 03 78 d4           # fbbd |   jne C, 0x3, ${fail}:rel + PC
ec 80 1c f8 04 71 d4           # fbc4 |   jne D, 0x4, ${fail}:rel + PC
ec fc 1c f8 05 6a d4           # fbcb |   jne E, 0x5, ${fail}:rel + PC
ec fd 1c f8 06 63 d4           # fbd2 |   jne F, 0x6, ${fail}:rel + PC
ec fe 1c f8 07 5c d4           # fbd9 |   jne G, 0x7, ${fail}:rel + PC
ec ff 1c f8 08 55 d4           # fbe0 |   jne H, 0x8, ${fail}:rel + PC
34 ff e0 00 ff                 # fbe7 |   xor H, 0xff00
ec ff e0 f8 08 ff 49 d4        # fbec |   jne H, 0xff08, ${fail}:rel + PC
60 20 ff                       # fbf4 |   mov A, H
ec 20 e0 f8 08 ff 3e d4        # fbf7 |   jne A, 0xff08, ${fail}:rel + PC
60 fc fe                       # fbff |   mov E, G
ec fc 1c f8 07 33 d4           # fc02 |   jne E, 0x7, ${fail}:rel + PC
ec ff e0 f8 08 ff 2c d4        # fc09 |   jne H, 0xff08, ${fail}:rel + PC
                               #      | test_call_ret:
60 a0 e0 00 10                 # fc11 |   mov SP, 0x1000
5c f8 77 00                    # fc16 |   call ${fn_test_target}:rel + PC
ec a0 e0 f8 00 10 1b d4        # fc1a |   jne SP, 0x1000, ${fail}:rel + PC
60 20 1c 0a                    # fc22 |   mov A, 0xa
60 40 00                       # fc26 |   mov B, 0
60 60 00                       # fc29 |   mov C, 0
60 80 00                       # fc2c |   mov D, 0
5c f8 2d 00                    # fc2f |   call ${fn_recursive}:rel + PC
ec 20 00 f8 02 d4              # fc33 |   jne A, 0, ${fail}:rel + PC
ec 40 e0 f8 3f cf fc d3        # fc39 |   jne B, 0xcf3f, ${fail}:rel + PC
ec 60 1c f8 2d f4 d3           # fc41 |   jne C, 0x2d, ${fail}:rel + PC
ec 80 e0 f8 97 45 ed d3        # fc48 |   jne D, 0x4597, ${fail}:rel + PC
ec a0 e0 f8 00 10 e5 d3        # fc50 |   jne SP, 0x1000, ${fail}:rel + PC
58 f8 42 00                    # fc58 |   jmp ${test_call_ret_end}:rel + PC
                               #      | fn_recursive:
04 20 1c 01                    # fc5c |   sub A, 0x1
5c f8 25 00                    # fc60 |   call ${fn_process_c}:rel + PC
e8 20 00 f8 1c 00              # fc64 |   jeq A, 0, ${fn_recursive_end}:rel + PC
5c f8 f2 ff                    # fc6a |   call ${fn_recursive}:rel + PC
00 80 60                       # fc6e |   add D, C
08 80 1c 03                    # fc71 |   mul D, 0x3
00 40 80                       # fc75 |   add B, D
e0 80                          # fc78 |   push D
08 40 1c 05                    # fc7a |   mul B, 0x5
e4 80                          # fc7e |   pop D
                               #      | fn_recursive_end:
dc                             # fc80 |   ret
58 f8 b4 d3                    # fc81 |   jmp ${fail}:rel + PC
                               #      | fn_process_c:
00 60 20                       # fc85 |   add C, A
dc                             # fc88 |   ret
58 f8 ac d3                    # fc89 |   jmp ${fail}:rel + PC
                               #      | fn_test_target:
ec a0 e0 f8 fe 0f a8 d3        # fc8d |   jne SP, 0xffe, ${fail}:rel + PC
dc                             # fc95 |   ret
58 f8 9f d3                    # fc96 |   jmp ${fail}:rel + PC
                               #      | test_call_ret_end:
                               #      | test_mem_access:
62 e0 1c 00 01 ed              # fc9a |   mov [0x100], 0xed
ee e0 e0 f8 00 01 aa 00 0e 00  # fca0 |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
58 f8 8b d3                    # fcaa |   jmp ${fail}:rel + PC
                               #      | test_mem_access_check_jmp:
62 e0 00 00 10                 # fcae |   mov [0x1000], 0
60 a0 e0 00 10                 # fcb3 |   mov SP, 0x1000
ee a0 00 f8 7d d3              # fcb8 |   jne [SP], 0, ${fail}:rel + PC
e0 00                          # fcbe |   push 0
e0 00                          # fcc0 |   push 0
e0 00                          # fcc2 |   push 0
e4 20                          # fcc4 |   pop A
e4 20                          # fcc6 |   pop A
e4 20                          # fcc8 |   pop A
ec a0 e0 f8 00 10 6b d3        # fcca |   jne SP, 0x1000, ${fail}:rel + PC
ec 20 00 f8 63 d3              # fcd2 |   jne A, 0, ${fail}:rel + PC
e0 e0 02 01                    # fcd8 |   push 0x102
ec a0 e0 f8 fe 0f 59 d3        # fcdc |   jne SP, 0xffe, ${fail}:rel + PC
e0 e0 04 03                    # fce4 |   push 0x304
ec a0 e0 f8 fc 0f 4d d3        # fce8 |   jne SP, 0xffc, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 02 01 45 d3  # fcf0 |   jne [0xffe], 0x102, ${fail}:rel + PC
ee e0 e0 f8 fc 0f 04 03 3b d3  # fcfa |   jne [0xffc], 0x304, ${fail}:rel + PC
ee e0 e0 f8 fb 0f 00 04 31 d3  # fd04 |   jne [0xffb], 0x400, ${fail}:rel + PC
ee e0 e0 f8 fd 0f 03 02 27 d3  # fd0e |   jne [0xffd], 0x203, ${fail}:rel + PC
ee e0 1c f8 ff 0f 01 1d d3     # fd18 |   jne [0xfff], 0x1, ${fail}:rel + PC
e4 20                          # fd21 |   pop A
ec 20 e0 f8 04 03 12 d3        # fd23 |   jne A, 0x304, ${fail}:rel + PC
ec a0 e0 f8 fe 0f 0a d3        # fd2b |   jne SP, 0xffe, ${fail}:rel + PC
e4 20                          # fd33 |   pop A
ec 20 e0 f8 02 01 00 d3        # fd35 |   jne A, 0x102, ${fail}:rel + PC
ec a0 e0 f8 00 10 f8 d2        # fd3d |   jne SP, 0x1000, ${fail}:rel + PC
                               #      | test_cmp:
cc 1c ff                       # fd45 |   setf 0xff
4c 20                          # fd48 |   getf A
ec 20 1c f8 3f eb d2           # fd4a |   jne A, 0x3f, ${fail}:rel + PC
cc e0 ab ab                    # fd51 |   setf 0xabab
4c 20                          # fd55 |   getf A
ec 20 1c f8 2b de d2           # fd57 |   jne A, 0x2b, ${fail}:rel + PC
50 1c 1c ab 2b                 # fd5e |   cmp 0xab, 0x2b
4c 20                          # fd63 |   getf A
ec 20 1c f8 32 d0 d2           # fd65 |   jne A, 0x32, ${fail}:rel + PC
50 1c 1c 2b ab                 # fd6c |   cmp 0x2b, 0xab
4c 20                          # fd71 |   getf A
ec 20 1c f8 0e c2 d2           # fd73 |   jne A, 0xe, ${fail}:rel + PC
50 1c 1c ab ab                 # fd7a |   cmp 0xab, 0xab
4c 20                          # fd7f |   getf A
ec 20 1c f8 29 b4 d2           # fd81 |   jne A, 0x29, ${fail}:rel + PC
d0 1c 1c ab 2b                 # fd88 |   icmp 0xab, 0x2b
4c 20                          # fd8d |   getf A
ec 20 1c f8 0e a6 d2           # fd8f |   jne A, 0xe, ${fail}:rel + PC
d0 1c 1c 2b ab                 # fd96 |   icmp 0x2b, 0xab
4c 20                          # fd9b |   getf A
ec 20 1c f8 32 98 d2           # fd9d |   jne A, 0x32, ${fail}:rel + PC
d0 1c 1c ab ab                 # fda4 |   icmp 0xab, 0xab
4c 20                          # fda9 |   getf A
ec 20 1c f8 29 8a d2           # fdab |   jne A, 0x29, ${fail}:rel + PC
                               #      | test_cmp_direct:
60 60 1c ab                    # fdb2 |   mov C, 0xab
60 80 1c 2b                    # fdb6 |   mov D, 0x2b
50 60 80                       # fdba |   cmp C, D
4c 20                          # fdbd |   getf A
ec 20 1c f8 32 76 d2           # fdbf |   jne A, 0x32, ${fail}:rel + PC
50 80 60                       # fdc6 |   cmp D, C
4c 20                          # fdc9 |   getf A
ec 20 1c f8 0e 6a d2           # fdcb |   jne A, 0xe, ${fail}:rel + PC
50 60 60                       # fdd2 |   cmp C, C
4c 20                          # fdd5 |   getf A
ec 20 1c f8 29 5e d2           # fdd7 |   jne A, 0x29, ${fail}:rel + PC
d0 60 80                       # fdde |   icmp C, D
4c 20                          # fde1 |   getf A
ec 20 1c f8 0e 52 d2           # fde3 |   jne A, 0xe, ${fail}:rel + PC
d0 80 60                       # fdea |   icmp D, C
4c 20                          # fded |   getf A
ec 20 1c f8 32 46 d2           # fdef |   jne A, 0x32, ${fail}:rel + PC
d0 60 60                       # fdf6 |   icmp C, C
4c 20                          # fdf9 |   getf A
ec 20 1c f8 29 3a d2           # fdfb |   jne A, 0x29, ${fail}:rel + PC
                               #      | end_of_test:
60 20 e0 ad de                 # fe02 |   mov A, 0xdead
60 40 e0 ef be                 # fe07 |   mov B, 0xbeef
88 60 20 40                    # fe0c |   mul C, A, B
58 f8 2a d2                    # fe10 |   jmp ${success}:rel + PC
dc                             # fe14 |   ret
                               #      | end_fn_self_test:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x0000
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
