                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_self_test:
                               #      | .boot:
60 20 e0 fa ff                 # d000 |   mov A, 0xfffa
ec 20 e0 f8 fa 00 50 00        # d005 |   jne A, 0xfa, ${start_test}:rel + PC
                               #      | fail:
d8                             # d00d |   halt
58 f8 ff ff                    # d00e |   jmp ${fail}:rel + PC
                               #      | success:
ec 20 e0 f8 ad de fb ff        # d012 |   jne A, 0xdead, ${fail}:rel + PC
ec 40 e0 f8 ef be f3 ff        # d01a |   jne B, 0xbeef, ${fail}:rel + PC
ec 60 e0 f8 83 49 eb ff        # d022 |   jne C, 0x4983, ${fail}:rel + PC
ec ff e0 f8 14 a6 e3 ff        # d02a |   jne H, 0xa614, ${fail}:rel + PC
60 80 ff                       # d032 |   mov D, H
00 20 e0 ab ac                 # d035 |   add A, 0xacab
00 40 e0 cc 41                 # d03a |   add B, 0x41cc
08 20 80                       # d03f |   mul A, D
34 20 e0 4a f2                 # d042 |   xor A, 0xf24a
34 60 e0 4f 49                 # d047 |   xor C, 0x494f
34 ff e0 30 5a                 # d04c |   xor H, 0x5a30
60 80 ff                       # d051 |   mov D, H
d8                             # d054 |   halt
                               #      | start_test:
                               #      | alu_test:
80 40 e0 e0 30 d2 12 a0        # d055 |   add B, 0xd230, 0xa012
ec 40 e0 f8 42 72 b0 ff        # d05d |   jne B, 0x7242, ${fail}:rel + PC
84 40 e0 e0 30 d2 12 a0        # d065 |   sub B, 0xd230, 0xa012
ec 40 e0 f8 1e 32 a0 ff        # d06d |   jne B, 0x321e, ${fail}:rel + PC
88 40 e0 e0 30 d2 12 a0        # d075 |   mul B, 0xd230, 0xa012
ec 40 e0 f8 60 c7 90 ff        # d07d |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 6c 83 88 ff        # d085 |   jne H, 0x836c, ${fail}:rel + PC
8c 40 e0 e0 30 d2 12 a0        # d08d |   imul B, 0xd230, 0xa012
ec 40 e0 f8 60 c7 78 ff        # d095 |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 2a 11 70 ff        # d09d |   jne H, 0x112a, ${fail}:rel + PC
a0 40 e0 e0 30 d2 12 a0        # d0a5 |   shr B, 0xd230, 0xa012
ec 40 e0 f8 8c 34 60 ff        # d0ad |   jne B, 0x348c, ${fail}:rel + PC
a4 40 e0 e0 30 d2 12 a0        # d0b5 |   ishr B, 0xd230, 0xa012
ec 40 e0 f8 8c f4 50 ff        # d0bd |   jne B, 0xf48c, ${fail}:rel + PC
a8 40 e0 e0 30 d2 12 a0        # d0c5 |   shl B, 0xd230, 0xa012
ec 40 e0 f8 c0 48 40 ff        # d0cd |   jne B, 0x48c0, ${fail}:rel + PC
ac 40 e0 e0 30 d2 12 a0        # d0d5 |   and B, 0xd230, 0xa012
ec 40 e0 f8 10 80 30 ff        # d0dd |   jne B, 0x8010, ${fail}:rel + PC
b0 40 e0 e0 30 d2 12 a0        # d0e5 |   or B, 0xd230, 0xa012
ec 40 e0 f8 32 f2 20 ff        # d0ed |   jne B, 0xf232, ${fail}:rel + PC
b4 40 e0 e0 30 d2 12 a0        # d0f5 |   xor B, 0xd230, 0xa012
ec 40 e0 f8 22 72 10 ff        # d0fd |   jne B, 0x7222, ${fail}:rel + PC
b8 40 e0 30 d2                 # d105 |   neg B, 0xd230
ec 40 e0 f8 d0 2d 03 ff        # d10a |   jne B, 0x2dd0, ${fail}:rel + PC
bc 40 e0 30 d2                 # d112 |   not B, 0xd230
ec 40 e0 f8 cf 2d f6 fe        # d117 |   jne B, 0x2dcf, ${fail}:rel + PC
c0 40 e0 30 d2                 # d11f |   bool B, 0xd230
ec 40 1c f8 01 e9 fe           # d124 |   jne B, 0x1, ${fail}:rel + PC
c4 40 e0 30 d2                 # d12b |   inc B, 0xd230
ec 40 e0 f8 31 d2 dd fe        # d130 |   jne B, 0xd231, ${fail}:rel + PC
c8 40 e0 30 d2                 # d138 |   dec B, 0xd230
ec 40 e0 f8 2f d2 d0 fe        # d13d |   jne B, 0xd22f, ${fail}:rel + PC
80 40 e0 e0 ad 00 37 da        # d145 |   add B, 0xad, 0xda37
ec 40 e0 f8 e4 da c0 fe        # d14d |   jne B, 0xdae4, ${fail}:rel + PC
84 40 e0 e0 ad 00 37 da        # d155 |   sub B, 0xad, 0xda37
ec 40 e0 f8 76 26 b0 fe        # d15d |   jne B, 0x2676, ${fail}:rel + PC
88 40 e0 e0 ad 00 37 da        # d165 |   mul B, 0xad, 0xda37
ec 40 e0 f8 2b 77 a0 fe        # d16d |   jne B, 0x772b, ${fail}:rel + PC
ec ff e0 f8 93 00 98 fe        # d175 |   jne H, 0x93, ${fail}:rel + PC
8c 40 e0 e0 ad 00 37 da        # d17d |   imul B, 0xad, 0xda37
ec 40 e0 f8 2b 77 88 fe        # d185 |   jne B, 0x772b, ${fail}:rel + PC
ec ff e0 f8 e6 ff 80 fe        # d18d |   jne H, 0xffe6, ${fail}:rel + PC
a0 40 e0 e0 ad 00 37 da        # d195 |   shr B, 0xad, 0xda37
ec 40 1c f8 01 70 fe           # d19d |   jne B, 0x1, ${fail}:rel + PC
a4 40 e0 e0 ad 00 37 da        # d1a4 |   ishr B, 0xad, 0xda37
ec 40 1c f8 01 61 fe           # d1ac |   jne B, 0x1, ${fail}:rel + PC
a8 40 e0 e0 ad 00 37 da        # d1b3 |   shl B, 0xad, 0xda37
ec 40 e0 f8 80 56 52 fe        # d1bb |   jne B, 0x5680, ${fail}:rel + PC
ac 40 e0 e0 ad 00 37 da        # d1c3 |   and B, 0xad, 0xda37
ec 40 1c f8 25 42 fe           # d1cb |   jne B, 0x25, ${fail}:rel + PC
b0 40 e0 e0 ad 00 37 da        # d1d2 |   or B, 0xad, 0xda37
ec 40 e0 f8 bf da 33 fe        # d1da |   jne B, 0xdabf, ${fail}:rel + PC
b4 40 e0 e0 ad 00 37 da        # d1e2 |   xor B, 0xad, 0xda37
ec 40 e0 f8 9a da 23 fe        # d1ea |   jne B, 0xda9a, ${fail}:rel + PC
b8 40 e0 ad 00                 # d1f2 |   neg B, 0xad
ec 40 e0 f8 53 ff 16 fe        # d1f7 |   jne B, 0xff53, ${fail}:rel + PC
bc 40 e0 ad 00                 # d1ff |   not B, 0xad
ec 40 e0 f8 52 ff 09 fe        # d204 |   jne B, 0xff52, ${fail}:rel + PC
c0 40 e0 ad 00                 # d20c |   bool B, 0xad
ec 40 1c f8 01 fc fd           # d211 |   jne B, 0x1, ${fail}:rel + PC
c4 40 e0 ad 00                 # d218 |   inc B, 0xad
ec 40 e0 f8 ae 00 f0 fd        # d21d |   jne B, 0xae, ${fail}:rel + PC
c8 40 e0 ad 00                 # d225 |   dec B, 0xad
ec 40 e0 f8 ac 00 e3 fd        # d22a |   jne B, 0xac, ${fail}:rel + PC
60 40 e0 ad f0                 # d232 |   mov B, 0xf0ad
00 40 e0 3f 2a                 # d237 |   add B, 0x2a3f
ec 40 e0 f8 ec 1a d1 fd        # d23c |   jne B, 0x1aec, ${fail}:rel + PC
60 40 e0 ad f0                 # d244 |   mov B, 0xf0ad
04 40 e0 3f 2a                 # d249 |   sub B, 0x2a3f
ec 40 e0 f8 6e c6 bf fd        # d24e |   jne B, 0xc66e, ${fail}:rel + PC
60 40 e0 ad f0                 # d256 |   mov B, 0xf0ad
08 40 e0 3f 2a                 # d25b |   mul B, 0x2a3f
ec 40 e0 f8 93 9c ad fd        # d260 |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 b7 27 a5 fd        # d268 |   jne H, 0x27b7, ${fail}:rel + PC
60 40 e0 ad f0                 # d270 |   mov B, 0xf0ad
0c 40 e0 3f 2a                 # d275 |   imul B, 0x2a3f
ec 40 e0 f8 93 9c 93 fd        # d27a |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 78 fd 8b fd        # d282 |   jne H, 0xfd78, ${fail}:rel + PC
60 40 e0 ad f0                 # d28a |   mov B, 0xf0ad
20 40 e0 3f 2a                 # d28f |   shr B, 0x2a3f
ec 40 1c f8 01 79 fd           # d294 |   jne B, 0x1, ${fail}:rel + PC
60 40 e0 ad f0                 # d29b |   mov B, 0xf0ad
24 40 e0 3f 2a                 # d2a0 |   ishr B, 0x2a3f
ec 40 e0 f8 ff ff 68 fd        # d2a5 |   jne B, 0xffff, ${fail}:rel + PC
60 40 e0 ad f0                 # d2ad |   mov B, 0xf0ad
28 40 e0 3f 2a                 # d2b2 |   shl B, 0x2a3f
ec 40 e0 f8 00 80 56 fd        # d2b7 |   jne B, 0x8000, ${fail}:rel + PC
60 40 e0 ad f0                 # d2bf |   mov B, 0xf0ad
2c 40 e0 3f 2a                 # d2c4 |   and B, 0x2a3f
ec 40 e0 f8 2d 20 44 fd        # d2c9 |   jne B, 0x202d, ${fail}:rel + PC
60 40 e0 ad f0                 # d2d1 |   mov B, 0xf0ad
30 40 e0 3f 2a                 # d2d6 |   or B, 0x2a3f
ec 40 e0 f8 bf fa 32 fd        # d2db |   jne B, 0xfabf, ${fail}:rel + PC
60 40 e0 ad f0                 # d2e3 |   mov B, 0xf0ad
34 40 e0 3f 2a                 # d2e8 |   xor B, 0x2a3f
ec 40 e0 f8 92 da 20 fd        # d2ed |   jne B, 0xda92, ${fail}:rel + PC
60 40 e0 ad f0                 # d2f5 |   mov B, 0xf0ad
38 40                          # d2fa |   neg B
ec 40 e0 f8 53 0f 11 fd        # d2fc |   jne B, 0xf53, ${fail}:rel + PC
60 40 e0 ad f0                 # d304 |   mov B, 0xf0ad
3c 40                          # d309 |   not B
ec 40 e0 f8 52 0f 02 fd        # d30b |   jne B, 0xf52, ${fail}:rel + PC
60 40 e0 ad f0                 # d313 |   mov B, 0xf0ad
40 40                          # d318 |   bool B
ec 40 1c f8 01 f3 fc           # d31a |   jne B, 0x1, ${fail}:rel + PC
60 40 e0 ad f0                 # d321 |   mov B, 0xf0ad
44 40                          # d326 |   inc B
ec 40 e0 f8 ae f0 e5 fc        # d328 |   jne B, 0xf0ae, ${fail}:rel + PC
60 40 e0 ad f0                 # d330 |   mov B, 0xf0ad
48 40                          # d335 |   dec B
ec 40 e0 f8 ac f0 d6 fc        # d337 |   jne B, 0xf0ac, ${fail}:rel + PC
60 40 00                       # d33f |   mov B, 0
00 40 e0 ad de                 # d342 |   add B, 0xdead
ec 40 e0 f8 ad de c6 fc        # d347 |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # d34f |   mov B, 0
04 40 e0 ad de                 # d352 |   sub B, 0xdead
ec 40 e0 f8 53 21 b6 fc        # d357 |   jne B, 0x2153, ${fail}:rel + PC
60 40 00                       # d35f |   mov B, 0
08 40 e0 ad de                 # d362 |   mul B, 0xdead
ec 40 00 f8 a6 fc              # d367 |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 a0 fc              # d36d |   jne H, 0, ${fail}:rel + PC
60 40 00                       # d373 |   mov B, 0
0c 40 e0 ad de                 # d376 |   imul B, 0xdead
ec 40 00 f8 92 fc              # d37b |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 8c fc              # d381 |   jne H, 0, ${fail}:rel + PC
60 40 00                       # d387 |   mov B, 0
20 40 e0 ad de                 # d38a |   shr B, 0xdead
ec 40 00 f8 7e fc              # d38f |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d395 |   mov B, 0
24 40 e0 ad de                 # d398 |   ishr B, 0xdead
ec 40 00 f8 70 fc              # d39d |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3a3 |   mov B, 0
28 40 e0 ad de                 # d3a6 |   shl B, 0xdead
ec 40 00 f8 62 fc              # d3ab |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3b1 |   mov B, 0
2c 40 e0 ad de                 # d3b4 |   and B, 0xdead
ec 40 00 f8 54 fc              # d3b9 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3bf |   mov B, 0
30 40 e0 ad de                 # d3c2 |   or B, 0xdead
ec 40 e0 f8 ad de 46 fc        # d3c7 |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # d3cf |   mov B, 0
34 40 e0 ad de                 # d3d2 |   xor B, 0xdead
ec 40 e0 f8 ad de 36 fc        # d3d7 |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # d3df |   mov B, 0
38 40                          # d3e2 |   neg B
ec 40 00 f8 29 fc              # d3e4 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3ea |   mov B, 0
3c 40                          # d3ed |   not B
ec 40 e0 f8 ff ff 1e fc        # d3ef |   jne B, 0xffff, ${fail}:rel + PC
60 40 00                       # d3f7 |   mov B, 0
40 40                          # d3fa |   bool B
ec 40 00 f8 11 fc              # d3fc |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d402 |   mov B, 0
44 40                          # d405 |   inc B
ec 40 1c f8 01 06 fc           # d407 |   jne B, 0x1, ${fail}:rel + PC
60 40 00                       # d40e |   mov B, 0
48 40                          # d411 |   dec B
ec 40 e0 f8 ff ff fa fb        # d413 |   jne B, 0xffff, ${fail}:rel + PC
                               #      | jmp_test:
e8 e0 1c f8 ab ff 2b f2 fb     # d41b |   jeq 0xffab, 0x2b, ${fail}:rel + PC
ec e0 1c f8 ab ff 2b 0d 00     # d424 |   jne 0xffab, 0x2b, ${_L_test_jmp_1}:rel + PC
58 f8 e0 fb                    # d42d |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_1:
f0 e0 1c f8 ab ff 2b dc fb     # d431 |   jlt 0xffab, 0x2b, ${fail}:rel + PC
f4 e0 1c f8 ab ff 2b d3 fb     # d43a |   jle 0xffab, 0x2b, ${fail}:rel + PC
f8 e0 1c f8 ab ff 2b 0d 00     # d443 |   jgt 0xffab, 0x2b, ${_L_test_jmp_2}:rel + PC
58 f8 c1 fb                    # d44c |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_2:
fc e0 1c f8 ab ff 2b 0d 00     # d450 |   jge 0xffab, 0x2b, ${_L_test_jmp_3}:rel + PC
58 f8 b4 fb                    # d459 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_3:
50 e0 1c ab ff 2b              # d45d |   cmp 0xffab, 0x2b
68 f8 aa fb                    # d463 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d467 |   jne ${_L_test_jmp_4}:rel + PC
58 f8 a2 fb                    # d46b |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_4:
70 f8 9e fb                    # d46f |   jlt ${fail}:rel + PC
74 f8 9a fb                    # d473 |   jle ${fail}:rel + PC
78 f8 08 00                    # d477 |   jgt ${_L_test_jmp_5}:rel + PC
58 f8 92 fb                    # d47b |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_5:
7c f8 08 00                    # d47f |   jge ${_L_test_jmp_6}:rel + PC
58 f8 8a fb                    # d483 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_6:
d0 e0 1c ab ff 2b              # d487 |   icmp 0xffab, 0x2b
68 f8 80 fb                    # d48d |   jeq ${fail}:rel + PC
6c f8 08 00                    # d491 |   jne ${_L_test_jmp_7}:rel + PC
58 f8 78 fb                    # d495 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_7:
70 f8 08 00                    # d499 |   jlt ${_L_test_jmp_8}:rel + PC
58 f8 70 fb                    # d49d |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_8:
74 f8 08 00                    # d4a1 |   jle ${_L_test_jmp_9}:rel + PC
58 f8 68 fb                    # d4a5 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_9:
78 f8 64 fb                    # d4a9 |   jgt ${fail}:rel + PC
7c f8 60 fb                    # d4ad |   jge ${fail}:rel + PC
e8 1c e0 f8 2b ab ff 5c fb     # d4b1 |   jeq 0x2b, 0xffab, ${fail}:rel + PC
ec 1c e0 f8 2b ab ff 0d 00     # d4ba |   jne 0x2b, 0xffab, ${_L_test_jmp_10}:rel + PC
58 f8 4a fb                    # d4c3 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_10:
f0 1c e0 f8 2b ab ff 0d 00     # d4c7 |   jlt 0x2b, 0xffab, ${_L_test_jmp_11}:rel + PC
58 f8 3d fb                    # d4d0 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_11:
f4 1c e0 f8 2b ab ff 0d 00     # d4d4 |   jle 0x2b, 0xffab, ${_L_test_jmp_12}:rel + PC
58 f8 30 fb                    # d4dd |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_12:
f8 1c e0 f8 2b ab ff 2c fb     # d4e1 |   jgt 0x2b, 0xffab, ${fail}:rel + PC
fc 1c e0 f8 2b ab ff 23 fb     # d4ea |   jge 0x2b, 0xffab, ${fail}:rel + PC
50 1c e0 2b ab ff              # d4f3 |   cmp 0x2b, 0xffab
68 f8 14 fb                    # d4f9 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d4fd |   jne ${_L_test_jmp_13}:rel + PC
58 f8 0c fb                    # d501 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_13:
70 f8 08 00                    # d505 |   jlt ${_L_test_jmp_14}:rel + PC
58 f8 04 fb                    # d509 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_14:
74 f8 08 00                    # d50d |   jle ${_L_test_jmp_15}:rel + PC
58 f8 fc fa                    # d511 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_15:
78 f8 f8 fa                    # d515 |   jgt ${fail}:rel + PC
7c f8 f4 fa                    # d519 |   jge ${fail}:rel + PC
d0 1c e0 2b ab ff              # d51d |   icmp 0x2b, 0xffab
68 f8 ea fa                    # d523 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d527 |   jne ${_L_test_jmp_16}:rel + PC
58 f8 e2 fa                    # d52b |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_16:
70 f8 de fa                    # d52f |   jlt ${fail}:rel + PC
74 f8 da fa                    # d533 |   jle ${fail}:rel + PC
78 f8 08 00                    # d537 |   jgt ${_L_test_jmp_17}:rel + PC
58 f8 d2 fa                    # d53b |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_17:
7c f8 08 00                    # d53f |   jge ${_L_test_jmp_18}:rel + PC
58 f8 ca fa                    # d543 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_18:
e8 e0 e0 f8 ab ff ab ff 0e 00  # d547 |   jeq 0xffab, 0xffab, ${_L_test_jmp_19}:rel + PC
58 f8 bc fa                    # d551 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_19:
ec e0 e0 f8 ab ff ab ff b8 fa  # d555 |   jne 0xffab, 0xffab, ${fail}:rel + PC
f0 e0 e0 f8 ab ff ab ff ae fa  # d55f |   jlt 0xffab, 0xffab, ${fail}:rel + PC
f4 e0 e0 f8 ab ff ab ff 0e 00  # d569 |   jle 0xffab, 0xffab, ${_L_test_jmp_20}:rel + PC
58 f8 9a fa                    # d573 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_20:
f8 e0 e0 f8 ab ff ab ff 96 fa  # d577 |   jgt 0xffab, 0xffab, ${fail}:rel + PC
fc e0 e0 f8 ab ff ab ff 0e 00  # d581 |   jge 0xffab, 0xffab, ${_L_test_jmp_21}:rel + PC
58 f8 82 fa                    # d58b |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_21:
50 e0 e0 ab ff ab ff           # d58f |   cmp 0xffab, 0xffab
68 f8 08 00                    # d596 |   jeq ${_L_test_jmp_22}:rel + PC
58 f8 73 fa                    # d59a |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_22:
6c f8 6f fa                    # d59e |   jne ${fail}:rel + PC
70 f8 6b fa                    # d5a2 |   jlt ${fail}:rel + PC
74 f8 08 00                    # d5a6 |   jle ${_L_test_jmp_23}:rel + PC
58 f8 63 fa                    # d5aa |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_23:
78 f8 5f fa                    # d5ae |   jgt ${fail}:rel + PC
7c f8 08 00                    # d5b2 |   jge ${_L_test_jmp_24}:rel + PC
58 f8 57 fa                    # d5b6 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_24:
d0 e0 e0 ab ff ab ff           # d5ba |   icmp 0xffab, 0xffab
68 f8 08 00                    # d5c1 |   jeq ${_L_test_jmp_25}:rel + PC
58 f8 48 fa                    # d5c5 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_25:
6c f8 44 fa                    # d5c9 |   jne ${fail}:rel + PC
70 f8 40 fa                    # d5cd |   jlt ${fail}:rel + PC
74 f8 08 00                    # d5d1 |   jle ${_L_test_jmp_26}:rel + PC
58 f8 38 fa                    # d5d5 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_26:
78 f8 34 fa                    # d5d9 |   jgt ${fail}:rel + PC
7c f8 08 00                    # d5dd |   jge ${_L_test_jmp_27}:rel + PC
58 f8 2c fa                    # d5e1 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_27:
                               #      | test_uop_get_arg:
60 a0 e0 00 70                 # d5e5 |   mov SP, 0x7000
60 20 e0 aa 00                 # d5ea |   mov A, 0xaa
60 40 e0 bb 00                 # d5ef |   mov B, 0xbb
60 fe e0 55 01                 # d5f4 |   mov G, 0x155
b6 e0 1c fe 39 30 85           # d5f9 |   xor [0x3039], -123, G
ee e0 e0 f8 39 30 d0 fe 0d fa  # d600 |   jne [0x3039], 0xfed0, ${fail}:rel + PC
ae 3e fe 21 f6                 # d60a |   and [A*4 + -10], G, A*2
ee e0 e0 f8 9e 02 54 01 fe f9  # d60f |   jne [0x29e], 0x154, ${fail}:rel + PC
86 21 e4 3e de fa f6           # d619 |   sub [A*2], 0xfade + A, A*4 + -10
ee e0 e0 f8 54 01 ea f8 ed f9  # d620 |   jne [0x154], 0xf8ea, ${fail}:rel + PC
a6 e0 20 21 39 30              # d62a |   ishr [0x3039], A, A*2
ee e0 1c f8 39 30 0a dd f9     # d630 |   jne [0x3039], 0xa, ${fail}:rel + PC
aa fe 2a 3e f6                 # d639 |   shl [G], A*4 + B, A*4 + -10
ee e0 e0 f8 55 01 00 c0 cf f9  # d63e |   jne [0x155], 0xc000, ${fail}:rel + PC
b2 fe 1c fe 85                 # d648 |   or [G], -123, G
ee e0 e0 f8 55 01 d5 ff c0 f9  # d64d |   jne [0x155], 0xffd5, ${fail}:rel + PC
8a 2a 1c 20 85                 # d657 |   mul [A*4 + B], -123, A
ee e0 e0 f8 63 03 52 ae b1 f9  # d65c |   jne [0x363], 0xae52, ${fail}:rel + PC
a6 e0 e0 2a 39 30 39 30        # d666 |   ishr [0x3039], 0x3039, A*4 + B
ee e0 e0 f8 39 30 07 06 9f f9  # d66e |   jne [0x3039], 0x607, ${fail}:rel + PC
a2 21 e4 21 de fa              # d678 |   shr [A*2], 0xfade + A, A*2
ee e0 e0 f8 54 01 b8 0f 8f f9  # d67e |   jne [0x154], 0xfb8, ${fail}:rel + PC
82 21 fe fe                    # d688 |   add [A*2], G, G
ee e0 e0 f8 54 01 aa 02 81 f9  # d68c |   jne [0x154], 0x2aa, ${fail}:rel + PC
a6 fe e4 20 de fa              # d696 |   ishr [G], 0xfade + A, A
ee e0 e0 f8 55 01 fe ff 71 f9  # d69c |   jne [0x155], 0xfffe, ${fail}:rel + PC
82 e0 e4 2a 39 30 de fa        # d6a6 |   add [0x3039], 0xfade + A, A*4 + B
ee e0 e0 f8 39 30 eb fe 5f f9  # d6ae |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
a6 20 20 20                    # d6b8 |   ishr [A], A, A
ee e0 00 f8 aa 00 51 f9        # d6bc |   jne [0xaa], 0, ${fail}:rel + PC
82 fe 2a 20                    # d6c4 |   add [G], A*4 + B, A
ee e0 e0 f8 55 01 0d 04 45 f9  # d6c8 |   jne [0x155], 0x40d, ${fail}:rel + PC
b6 fe fe fe                    # d6d2 |   xor [G], G, G
ee e0 00 f8 55 01 37 f9        # d6d6 |   jne [0x155], 0, ${fail}:rel + PC
aa 21 fe 21                    # d6de |   shl [A*2], G, A*2
ee e0 e0 f8 54 01 50 15 2b f9  # d6e2 |   jne [0x154], 0x1550, ${fail}:rel + PC
a6 fe e0 21 39 30              # d6ec |   ishr [G], 0x3039, A*2
ee e0 e0 f8 55 01 03 03 1b f9  # d6f2 |   jne [0x155], 0x303, ${fail}:rel + PC
ae 21 2a e4 de fa              # d6fc |   and [A*2], A*4 + B, 0xfade + A
ee e0 e0 f8 54 01 00 03 0b f9  # d702 |   jne [0x154], 0x300, ${fail}:rel + PC
82 20 3e 3e f6 f6              # d70c |   add [A], A*4 + -10, A*4 + -10
ee e0 e0 f8 aa 00 3c 05 fb f8  # d712 |   jne [0xaa], 0x53c, ${fail}:rel + PC
b2 e0 21 1c 39 30 85           # d71c |   or [0x3039], A*2, -123
ee e0 e0 f8 39 30 d5 ff ea f8  # d723 |   jne [0x3039], 0xffd5, ${fail}:rel + PC
82 e0 fe fe 39 30              # d72d |   add [0x3039], G, G
ee e0 e0 f8 39 30 aa 02 da f8  # d733 |   jne [0x3039], 0x2aa, ${fail}:rel + PC
ae fe e0 e4 39 30 de fa        # d73d |   and [G], 0x3039, 0xfade + A
ee e0 e0 f8 55 01 08 30 c8 f8  # d745 |   jne [0x155], 0x3008, ${fail}:rel + PC
8e e0 2a 3e 39 30 f6           # d74f |   imul [0x3039], A*4 + B, A*4 + -10
ee e0 e0 f8 39 30 1a dd b7 f8  # d756 |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
b2 21 e0 20 39 30              # d760 |   or [A*2], 0x3039, A
ee e0 e0 f8 54 01 bb 30 a7 f8  # d766 |   jne [0x154], 0x30bb, ${fail}:rel + PC
8e 21 3e 21 f6                 # d770 |   imul [A*2], A*4 + -10, A*2
ee e0 e0 f8 54 01 d8 79 98 f8  # d775 |   jne [0x154], 0x79d8, ${fail}:rel + PC
82 3e 1c 2a f6 85              # d77f |   add [A*4 + -10], -123, A*4 + B
ee e0 e0 f8 9e 02 e8 02 88 f8  # d785 |   jne [0x29e], 0x2e8, ${fail}:rel + PC
86 fe e4 21 de fa              # d78f |   sub [G], 0xfade + A, A*2
ee e0 e0 f8 55 01 34 fa 78 f8  # d795 |   jne [0x155], 0xfa34, ${fail}:rel + PC
b2 2a e4 21 de fa              # d79f |   or [A*4 + B], 0xfade + A, A*2
ee e0 e0 f8 63 03 dc fb 68 f8  # d7a5 |   jne [0x363], 0xfbdc, ${fail}:rel + PC
ae 21 21 20                    # d7af |   and [A*2], A*2, A
ee e0 00 f8 54 01 5a f8        # d7b3 |   jne [0x154], 0, ${fail}:rel + PC
86 2a 2a fe                    # d7bb |   sub [A*4 + B], A*4 + B, G
ee e0 e0 f8 63 03 0e 02 4e f8  # d7bf |   jne [0x363], 0x20e, ${fail}:rel + PC
82 3e 3e 20 f6 f6              # d7c9 |   add [A*4 + -10], A*4 + -10, A
ee e0 e0 f8 9e 02 48 03 3e f8  # d7cf |   jne [0x29e], 0x348, ${fail}:rel + PC
86 21 e0 e0 39 30 39 30        # d7d9 |   sub [A*2], 0x3039, 0x3039
ee e0 00 f8 54 01 2c f8        # d7e1 |   jne [0x154], 0, ${fail}:rel + PC
a2 20 1c fe 85                 # d7e9 |   shr [A], -123, G
ee e0 e0 f8 aa 00 fc 07 1f f8  # d7ee |   jne [0xaa], 0x7fc, ${fail}:rel + PC
aa 2a 1c 2a 85                 # d7f8 |   shl [A*4 + B], -123, A*4 + B
ee e0 e0 f8 63 03 28 fc 10 f8  # d7fd |   jne [0x363], 0xfc28, ${fail}:rel + PC
b2 2a 20 20                    # d807 |   or [A*4 + B], A, A
ee e0 e0 f8 63 03 aa 00 02 f8  # d80b |   jne [0x363], 0xaa, ${fail}:rel + PC
86 20 20 1c 85                 # d815 |   sub [A], A, -123
ee e0 e0 f8 aa 00 25 01 f3 f7  # d81a |   jne [0xaa], 0x125, ${fail}:rel + PC
a6 3e e4 21 f6 de fa           # d824 |   ishr [A*4 + -10], 0xfade + A, A*2
ee e0 e0 f8 9e 02 b8 ff e2 f7  # d82b |   jne [0x29e], 0xffb8, ${fail}:rel + PC
86 20 e0 e0 39 30 39 30        # d835 |   sub [A], 0x3039, 0x3039
ee e0 00 f8 aa 00 d0 f7        # d83d |   jne [0xaa], 0, ${fail}:rel + PC
82 fe e0 e0 39 30 39 30        # d845 |   add [G], 0x3039, 0x3039
ee e0 e0 f8 55 01 72 60 c0 f7  # d84d |   jne [0x155], 0x6072, ${fail}:rel + PC
a2 2a e4 e4 de fa de fa        # d857 |   shr [A*4 + B], 0xfade + A, 0xfade + A
ee e0 e0 f8 63 03 fb 00 ae f7  # d85f |   jne [0x363], 0xfb, ${fail}:rel + PC
8e 20 20 fe                    # d869 |   imul [A], A, G
ee e0 e0 f8 aa 00 72 e2 a0 f7  # d86d |   jne [0xaa], 0xe272, ${fail}:rel + PC
a2 21 e4 2a de fa              # d877 |   shr [A*2], 0xfade + A, A*4 + B
ee e0 e0 f8 54 01 71 1f 90 f7  # d87d |   jne [0x154], 0x1f71, ${fail}:rel + PC
a2 2a 2a 1c 85                 # d887 |   shr [A*4 + B], A*4 + B, -123
ee e0 1c f8 63 03 1b 81 f7     # d88c |   jne [0x363], 0x1b, ${fail}:rel + PC
a2 20 21 2a                    # d895 |   shr [A], A*2, A*4 + B
ee e0 1c f8 aa 00 2a 74 f7     # d899 |   jne [0xaa], 0x2a, ${fail}:rel + PC
ae e0 2a 20 39 30              # d8a2 |   and [0x3039], A*4 + B, A
ee e0 1c f8 39 30 22 65 f7     # d8a8 |   jne [0x3039], 0x22, ${fail}:rel + PC
a2 e0 e0 e0 39 30 39 30 39 30  # d8b1 |   shr [0x3039], 0x3039, 0x3039
ee e0 1c f8 39 30 18 52 f7     # d8bb |   jne [0x3039], 0x18, ${fail}:rel + PC
8a 20 fe 3e f6                 # d8c4 |   mul [A], G, A*4 + -10
ee e0 e0 f8 aa 00 76 7c 44 f7  # d8c9 |   jne [0xaa], 0x7c76, ${fail}:rel + PC
82 2a e0 2a 39 30              # d8d3 |   add [A*4 + B], 0x3039, A*4 + B
ee e0 e0 f8 63 03 9c 33 34 f7  # d8d9 |   jne [0x363], 0x339c, ${fail}:rel + PC
8e fe 3e 2a f6                 # d8e3 |   imul [G], A*4 + -10, A*4 + B
ee e0 e0 f8 55 01 1a dd 25 f7  # d8e8 |   jne [0x155], 0xdd1a, ${fail}:rel + PC
aa 20 21 e0 39 30              # d8f2 |   shl [A], A*2, 0x3039
ee e0 e0 f8 aa 00 00 a8 15 f7  # d8f8 |   jne [0xaa], 0xa800, ${fail}:rel + PC
82 21 fe 20                    # d902 |   add [A*2], G, A
ee e0 e0 f8 54 01 ff 01 07 f7  # d906 |   jne [0x154], 0x1ff, ${fail}:rel + PC
82 2a 2a 21                    # d910 |   add [A*4 + B], A*4 + B, A*2
ee e0 e0 f8 63 03 b7 04 f9 f6  # d914 |   jne [0x363], 0x4b7, ${fail}:rel + PC
a2 20 fe e4 de fa              # d91e |   shr [A], G, 0xfade + A
ee e0 1c f8 aa 00 01 e9 f6     # d924 |   jne [0xaa], 0x1, ${fail}:rel + PC
82 fe 1c 20 85                 # d92d |   add [G], -123, A
ee e0 1c f8 55 01 2f db f6     # d932 |   jne [0x155], 0x2f, ${fail}:rel + PC
8e 3e fe e0 f6 39 30           # d93b |   imul [A*4 + -10], G, 0x3039
ee e0 e0 f8 9e 02 ed 3b cb f6  # d942 |   jne [0x29e], 0x3bed, ${fail}:rel + PC
8a fe e4 2a de fa              # d94c |   mul [G], 0xfade + A, A*4 + B
ee e0 e0 f8 55 01 98 dd bb f6  # d952 |   jne [0x155], 0xdd98, ${fail}:rel + PC
a2 fe fe 20                    # d95c |   shr [G], G, A
ee e0 00 f8 55 01 ad f6        # d960 |   jne [0x155], 0, ${fail}:rel + PC
b2 21 20 20                    # d968 |   or [A*2], A, A
ee e0 e0 f8 54 01 aa 00 a1 f6  # d96c |   jne [0x154], 0xaa, ${fail}:rel + PC
b2 3e 1c 21 f6 85              # d976 |   or [A*4 + -10], -123, A*2
ee e0 e0 f8 9e 02 d5 ff 91 f6  # d97c |   jne [0x29e], 0xffd5, ${fail}:rel + PC
8a 2a 1c 1c 85 85              # d986 |   mul [A*4 + B], -123, -123
ee e0 e0 f8 63 03 19 3b 81 f6  # d98c |   jne [0x363], 0x3b19, ${fail}:rel + PC
8a e0 e4 21 39 30 de fa        # d996 |   mul [0x3039], 0xfade + A, A*2
ee e0 e0 f8 39 30 a0 10 6f f6  # d99e |   jne [0x3039], 0x10a0, ${fail}:rel + PC
86 fe 20 3e f6                 # d9a8 |   sub [G], A, A*4 + -10
ee e0 e0 f8 55 01 0c fe 60 f6  # d9ad |   jne [0x155], 0xfe0c, ${fail}:rel + PC
aa 20 2a 21                    # d9b7 |   shl [A], A*4 + B, A*2
ee e0 e0 f8 aa 00 30 36 52 f6  # d9bb |   jne [0xaa], 0x3630, ${fail}:rel + PC
b6 21 1c 2a 85                 # d9c5 |   xor [A*2], -123, A*4 + B
ee e0 e0 f8 54 01 e6 fc 43 f6  # d9ca |   jne [0x154], 0xfce6, ${fail}:rel + PC
86 2a 3e 1c f6 85              # d9d4 |   sub [A*4 + B], A*4 + -10, -123
ee e0 e0 f8 63 03 19 03 33 f6  # d9da |   jne [0x363], 0x319, ${fail}:rel + PC
86 e0 e0 e4 39 30 39 30 de fa  # d9e4 |   sub [0x3039], 0x3039, 0xfade + A
ee e0 e0 f8 39 30 b1 34 1f f6  # d9ee |   jne [0x3039], 0x34b1, ${fail}:rel + PC
ae fe 2a e4 de fa              # d9f8 |   and [G], A*4 + B, 0xfade + A
ee e0 e0 f8 55 01 00 03 0f f6  # d9fe |   jne [0x155], 0x300, ${fail}:rel + PC
aa 20 3e fe f6                 # da08 |   shl [A], A*4 + -10, G
ee e0 e0 f8 aa 00 c0 53 00 f6  # da0d |   jne [0xaa], 0x53c0, ${fail}:rel + PC
a6 fe fe e4 de fa              # da17 |   ishr [G], G, 0xfade + A
ee e0 1c f8 55 01 01 f0 f5     # da1d |   jne [0x155], 0x1, ${fail}:rel + PC
ae 21 e0 2a 39 30              # da26 |   and [A*2], 0x3039, A*4 + B
ee e0 1c f8 54 01 21 e1 f5     # da2c |   jne [0x154], 0x21, ${fail}:rel + PC
a6 21 21 1c 85                 # da35 |   ishr [A*2], A*2, -123
ee e0 1c f8 54 01 0a d3 f5     # da3a |   jne [0x154], 0xa, ${fail}:rel + PC
b6 fe 21 e0 39 30              # da43 |   xor [G], A*2, 0x3039
ee e0 e0 f8 55 01 6d 31 c4 f5  # da49 |   jne [0x155], 0x316d, ${fail}:rel + PC
86 2a 3e 2a f6                 # da53 |   sub [A*4 + B], A*4 + -10, A*4 + B
ee e0 e0 f8 63 03 3b ff b5 f5  # da58 |   jne [0x363], 0xff3b, ${fail}:rel + PC
b2 e0 fe 1c 39 30 85           # da62 |   or [0x3039], G, -123
ee e0 e0 f8 39 30 d5 ff a4 f5  # da69 |   jne [0x3039], 0xffd5, ${fail}:rel + PC
aa 2a 3e 20 f6                 # da73 |   shl [A*4 + B], A*4 + -10, A
ee e0 e0 f8 63 03 00 78 95 f5  # da78 |   jne [0x363], 0x7800, ${fail}:rel + PC
86 e0 21 20 39 30              # da82 |   sub [0x3039], A*2, A
ee e0 e0 f8 39 30 aa 00 85 f5  # da88 |   jne [0x3039], 0xaa, ${fail}:rel + PC
b6 e0 2a 21 39 30              # da92 |   xor [0x3039], A*4 + B, A*2
ee e0 e0 f8 39 30 37 02 75 f5  # da98 |   jne [0x3039], 0x237, ${fail}:rel + PC
ae 2a e0 1c 39 30 85           # daa2 |   and [A*4 + B], 0x3039, -123
ee e0 e0 f8 63 03 01 30 64 f5  # daa9 |   jne [0x363], 0x3001, ${fail}:rel + PC
8e fe 2a e0 39 30              # dab3 |   imul [G], A*4 + B, 0x3039
ee e0 e0 f8 55 01 0b 51 54 f5  # dab9 |   jne [0x155], 0x510b, ${fail}:rel + PC
b2 2a 20 fe                    # dac3 |   or [A*4 + B], A, G
ee e0 e0 f8 63 03 ff 01 46 f5  # dac7 |   jne [0x363], 0x1ff, ${fail}:rel + PC
a6 3e e0 20 f6 39 30           # dad1 |   ishr [A*4 + -10], 0x3039, A
ee e0 1c f8 9e 02 0c 35 f5     # dad8 |   jne [0x29e], 0xc, ${fail}:rel + PC
aa e0 e4 e4 39 30 de fa de fa  # dae1 |   shl [0x3039], 0xfade + A, 0xfade + A
ee e0 e0 f8 39 30 00 88 22 f5  # daeb |   jne [0x3039], 0x8800, ${fail}:rel + PC
aa 20 e0 fe 39 30              # daf5 |   shl [A], 0x3039, G
ee e0 e0 f8 aa 00 20 07 12 f5  # dafb |   jne [0xaa], 0x720, ${fail}:rel + PC
b6 fe 3e 21 f6                 # db05 |   xor [G], A*4 + -10, A*2
ee e0 e0 f8 55 01 ca 03 03 f5  # db0a |   jne [0x155], 0x3ca, ${fail}:rel + PC
b2 2a fe 1c 85                 # db14 |   or [A*4 + B], G, -123
ee e0 e0 f8 63 03 d5 ff f4 f4  # db19 |   jne [0x363], 0xffd5, ${fail}:rel + PC
86 3e 1c e0 f6 85 39 30        # db23 |   sub [A*4 + -10], -123, 0x3039
ee e0 e0 f8 9e 02 4c cf e2 f4  # db2b |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
aa 21 21 21                    # db35 |   shl [A*2], A*2, A*2
ee e0 e0 f8 54 01 40 15 d4 f4  # db39 |   jne [0x154], 0x1540, ${fail}:rel + PC
86 e0 e4 e0 39 30 de fa 39 30  # db43 |   sub [0x3039], 0xfade + A, 0x3039
ee e0 e0 f8 39 30 4f cb c0 f4  # db4d |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
a2 21 e0 1c 39 30 85           # db57 |   shr [A*2], 0x3039, -123
ee e0 e0 f8 54 01 81 01 af f4  # db5e |   jne [0x154], 0x181, ${fail}:rel + PC
a6 e0 e4 20 39 30 de fa        # db68 |   ishr [0x3039], 0xfade + A, A
ee e0 e0 f8 39 30 fe ff 9d f4  # db70 |   jne [0x3039], 0xfffe, ${fail}:rel + PC
b6 3e e4 e0 f6 de fa 39 30     # db7a |   xor [A*4 + -10], 0xfade + A, 0x3039
ee e0 e0 f8 9e 02 b1 cb 8a f4  # db83 |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
86 3e 21 3e f6 f6              # db8d |   sub [A*4 + -10], A*2, A*4 + -10
ee e0 e0 f8 9e 02 b6 fe 7a f4  # db93 |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
8e fe 1c 3e 85 f6              # db9d |   imul [G], -123, A*4 + -10
ee e0 e0 f8 55 01 16 be 6a f4  # dba3 |   jne [0x155], 0xbe16, ${fail}:rel + PC
aa 20 2a 2a                    # dbad |   shl [A], A*4 + B, A*4 + B
ee e0 e0 f8 aa 00 18 1b 5c f4  # dbb1 |   jne [0xaa], 0x1b18, ${fail}:rel + PC
b6 e0 21 2a 39 30              # dbbb |   xor [0x3039], A*2, A*4 + B
ee e0 e0 f8 39 30 37 02 4c f4  # dbc1 |   jne [0x3039], 0x237, ${fail}:rel + PC
82 21 21 e0 39 30              # dbcb |   add [A*2], A*2, 0x3039
ee e0 e0 f8 54 01 8d 31 3c f4  # dbd1 |   jne [0x154], 0x318d, ${fail}:rel + PC
ae 21 2a 20                    # dbdb |   and [A*2], A*4 + B, A
ee e0 1c f8 54 01 22 2e f4     # dbdf |   jne [0x154], 0x22, ${fail}:rel + PC
aa 20 2a e4 de fa              # dbe8 |   shl [A], A*4 + B, 0xfade + A
ee e0 e0 f8 aa 00 00 63 1f f4  # dbee |   jne [0xaa], 0x6300, ${fail}:rel + PC
ae 2a fe 20                    # dbf8 |   and [A*4 + B], G, A
ee e0 00 f8 63 03 11 f4        # dbfc |   jne [0x363], 0, ${fail}:rel + PC
b6 fe 21 1c 85                 # dc04 |   xor [G], A*2, -123
ee e0 e0 f8 55 01 d1 fe 04 f4  # dc09 |   jne [0x155], 0xfed1, ${fail}:rel + PC
ae e0 fe 21 39 30              # dc13 |   and [0x3039], G, A*2
ee e0 e0 f8 39 30 54 01 f4 f3  # dc19 |   jne [0x3039], 0x154, ${fail}:rel + PC
b2 3e e0 2a f6 39 30           # dc23 |   or [A*4 + -10], 0x3039, A*4 + B
ee e0 e0 f8 9e 02 7b 33 e3 f3  # dc2a |   jne [0x29e], 0x337b, ${fail}:rel + PC
b6 fe e4 3e de fa f6           # dc34 |   xor [G], 0xfade + A, A*4 + -10
ee e0 e0 f8 55 01 16 f9 d2 f3  # dc3b |   jne [0x155], 0xf916, ${fail}:rel + PC
8e 2a 21 2a                    # dc45 |   imul [A*4 + B], A*2, A*4 + B
ee e0 e0 f8 63 03 7c 7f c4 f3  # dc49 |   jne [0x363], 0x7f7c, ${fail}:rel + PC
a6 fe 21 fe                    # dc53 |   ishr [G], A*2, G
ee e0 1c f8 55 01 0a b6 f3     # dc57 |   jne [0x155], 0xa, ${fail}:rel + PC
8a 21 1c 1c 85 85              # dc60 |   mul [A*2], -123, -123
ee e0 e0 f8 54 01 19 3b a7 f3  # dc66 |   jne [0x154], 0x3b19, ${fail}:rel + PC
8e 2a e4 20 de fa              # dc70 |   imul [A*4 + B], 0xfade + A, A
ee e0 e0 f8 63 03 50 08 97 f3  # dc76 |   jne [0x363], 0x850, ${fail}:rel + PC
a2 3e 3e 3e f6 f6 f6           # dc80 |   shr [A*4 + -10], A*4 + -10, A*4 + -10
ee e0 00 f8 9e 02 86 f3        # dc87 |   jne [0x29e], 0, ${fail}:rel + PC
8a 20 1c e4 85 de fa           # dc8f |   mul [A], -123, 0xfade + A
ee e0 e0 f8 aa 00 a8 25 77 f3  # dc96 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
a6 3e 20 21 f6                 # dca0 |   ishr [A*4 + -10], A, A*2
ee e0 1c f8 9e 02 0a 68 f3     # dca5 |   jne [0x29e], 0xa, ${fail}:rel + PC
b2 3e 20 20 f6                 # dcae |   or [A*4 + -10], A, A
ee e0 e0 f8 9e 02 aa 00 5a f3  # dcb3 |   jne [0x29e], 0xaa, ${fail}:rel + PC
82 e0 fe e0 39 30 39 30        # dcbd |   add [0x3039], G, 0x3039
ee e0 e0 f8 39 30 8e 31 48 f3  # dcc5 |   jne [0x3039], 0x318e, ${fail}:rel + PC
8e 3e e0 3e f6 39 30 f6        # dccf |   imul [A*4 + -10], 0x3039, A*4 + -10
ee e0 e0 f8 9e 02 2e 35 36 f3  # dcd7 |   jne [0x29e], 0x352e, ${fail}:rel + PC
a6 fe fe 21                    # dce1 |   ishr [G], G, A*2
ee e0 1c f8 55 01 15 28 f3     # dce5 |   jne [0x155], 0x15, ${fail}:rel + PC
8e 20 e4 3e de fa f6           # dcee |   imul [A], 0xfade + A, A*4 + -10
ee e0 e0 f8 aa 00 f0 4d 18 f3  # dcf5 |   jne [0xaa], 0x4df0, ${fail}:rel + PC
a6 fe 20 fe                    # dcff |   ishr [G], A, G
ee e0 1c f8 55 01 05 0a f3     # dd03 |   jne [0x155], 0x5, ${fail}:rel + PC
82 2a e0 3e 39 30 f6           # dd0c |   add [A*4 + B], 0x3039, A*4 + -10
ee e0 e0 f8 63 03 d7 32 fa f2  # dd13 |   jne [0x363], 0x32d7, ${fail}:rel + PC
ae 3e 2a e4 f6 de fa           # dd1d |   and [A*4 + -10], A*4 + B, 0xfade + A
ee e0 e0 f8 9e 02 00 03 e9 f2  # dd24 |   jne [0x29e], 0x300, ${fail}:rel + PC
8e 20 1c 2a 85                 # dd2e |   imul [A], -123, A*4 + B
ee e0 e0 f8 aa 00 6f 5f da f2  # dd33 |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
a2 fe 3e e4 f6 de fa           # dd3d |   shr [G], A*4 + -10, 0xfade + A
ee e0 1c f8 55 01 02 c9 f2     # dd44 |   jne [0x155], 0x2, ${fail}:rel + PC
b2 2a e0 20 39 30              # dd4d |   or [A*4 + B], 0x3039, A
ee e0 e0 f8 63 03 bb 30 ba f2  # dd53 |   jne [0x363], 0x30bb, ${fail}:rel + PC
b6 2a e0 fe 39 30              # dd5d |   xor [A*4 + B], 0x3039, G
ee e0 e0 f8 63 03 6c 31 aa f2  # dd63 |   jne [0x363], 0x316c, ${fail}:rel + PC
8e 20 20 e0 39 30              # dd6d |   imul [A], A, 0x3039
ee e0 e0 f8 aa 00 da 05 9a f2  # dd73 |   jne [0xaa], 0x5da, ${fail}:rel + PC
b2 21 2a 3e f6                 # dd7d |   or [A*2], A*4 + B, A*4 + -10
ee e0 e0 f8 54 01 ff 03 8b f2  # dd82 |   jne [0x154], 0x3ff, ${fail}:rel + PC
aa fe e4 e0 de fa 39 30        # dd8c |   shl [G], 0xfade + A, 0x3039
ee e0 e0 f8 55 01 00 10 79 f2  # dd94 |   jne [0x155], 0x1000, ${fail}:rel + PC
a6 2a e4 2a de fa              # dd9e |   ishr [A*4 + B], 0xfade + A, A*4 + B
ee e0 e0 f8 63 03 71 ff 69 f2  # dda4 |   jne [0x363], 0xff71, ${fail}:rel + PC
aa 3e e4 1c f6 de fa 85        # ddae |   shl [A*4 + -10], 0xfade + A, -123
ee e0 e0 f8 9e 02 00 71 57 f2  # ddb6 |   jne [0x29e], 0x7100, ${fail}:rel + PC
a2 3e e4 20 f6 de fa           # ddc0 |   shr [A*4 + -10], 0xfade + A, A
ee e0 1c f8 9e 02 3e 46 f2     # ddc7 |   jne [0x29e], 0x3e, ${fail}:rel + PC
8a 3e 20 2a f6                 # ddd0 |   mul [A*4 + -10], A, A*4 + B
ee e0 e0 f8 9e 02 be 3f 38 f2  # ddd5 |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
b2 21 3e 2a f6                 # dddf |   or [A*2], A*4 + -10, A*4 + B
ee e0 e0 f8 54 01 ff 03 29 f2  # dde4 |   jne [0x154], 0x3ff, ${fail}:rel + PC
8e 3e 21 1c f6 85              # ddee |   imul [A*4 + -10], A*2, -123
ee e0 e0 f8 9e 02 a4 5c 19 f2  # ddf4 |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
aa e0 3e 21 39 30 f6           # ddfe |   shl [0x3039], A*4 + -10, A*2
ee e0 e0 f8 39 30 e0 29 08 f2  # de05 |   jne [0x3039], 0x29e0, ${fail}:rel + PC
aa 21 e4 e4 de fa de fa        # de0f |   shl [A*2], 0xfade + A, 0xfade + A
ee e0 e0 f8 54 01 00 88 f6 f1  # de17 |   jne [0x154], 0x8800, ${fail}:rel + PC
82 fe 21 21                    # de21 |   add [G], A*2, A*2
ee e0 e0 f8 55 01 a8 02 e8 f1  # de25 |   jne [0x155], 0x2a8, ${fail}:rel + PC
ae 21 e4 fe de fa              # de2f |   and [A*2], 0xfade + A, G
ee e0 e0 f8 54 01 00 01 d8 f1  # de35 |   jne [0x154], 0x100, ${fail}:rel + PC
ae 3e e0 e0 f6 39 30 39 30     # de3f |   and [A*4 + -10], 0x3039, 0x3039
ee e0 e0 f8 9e 02 39 30 c5 f1  # de48 |   jne [0x29e], 0x3039, ${fail}:rel + PC
aa 3e 20 1c f6 85              # de52 |   shl [A*4 + -10], A, -123
ee e0 e0 f8 9e 02 40 15 b5 f1  # de58 |   jne [0x29e], 0x1540, ${fail}:rel + PC
ae 2a 3e e4 f6 de fa           # de62 |   and [A*4 + B], A*4 + -10, 0xfade + A
ee e0 e0 f8 63 03 88 02 a4 f1  # de69 |   jne [0x363], 0x288, ${fail}:rel + PC
82 fe 1c 1c 85 85              # de73 |   add [G], -123, -123
ee e0 e0 f8 55 01 0a ff 94 f1  # de79 |   jne [0x155], 0xff0a, ${fail}:rel + PC
8a 20 20 e4 de fa              # de83 |   mul [A], A, 0xfade + A
ee e0 e0 f8 aa 00 50 08 84 f1  # de89 |   jne [0xaa], 0x850, ${fail}:rel + PC
b2 21 2a fe                    # de93 |   or [A*2], A*4 + B, G
ee e0 e0 f8 54 01 77 03 76 f1  # de97 |   jne [0x154], 0x377, ${fail}:rel + PC
86 fe e4 e4 de fa de fa        # dea1 |   sub [G], 0xfade + A, 0xfade + A
ee e0 00 f8 55 01 64 f1        # dea9 |   jne [0x155], 0, ${fail}:rel + PC
a2 2a fe e4 de fa              # deb1 |   shr [A*4 + B], G, 0xfade + A
ee e0 1c f8 63 03 01 56 f1     # deb7 |   jne [0x363], 0x1, ${fail}:rel + PC
86 21 1c fe 85                 # dec0 |   sub [A*2], -123, G
ee e0 e0 f8 54 01 30 fe 48 f1  # dec5 |   jne [0x154], 0xfe30, ${fail}:rel + PC
aa 3e 21 fe f6                 # decf |   shl [A*4 + -10], A*2, G
ee e0 e0 f8 9e 02 80 2a 39 f1  # ded4 |   jne [0x29e], 0x2a80, ${fail}:rel + PC
aa 20 1c 3e 85 f6              # dede |   shl [A], -123, A*4 + -10
ee e0 e0 f8 aa 00 00 40 29 f1  # dee4 |   jne [0xaa], 0x4000, ${fail}:rel + PC
8a 3e 2a 21 f6                 # deee |   mul [A*4 + -10], A*4 + B, A*2
ee e0 e0 f8 9e 02 7c 7f 1a f1  # def3 |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
a2 20 2a fe                    # defd |   shr [A], A*4 + B, G
ee e0 1c f8 aa 00 1b 0c f1     # df01 |   jne [0xaa], 0x1b, ${fail}:rel + PC
82 20 2a e0 39 30              # df0a |   add [A], A*4 + B, 0x3039
ee e0 e0 f8 aa 00 9c 33 fd f0  # df10 |   jne [0xaa], 0x339c, ${fail}:rel + PC
b6 fe e0 1c 39 30 85           # df1a |   xor [G], 0x3039, -123
ee e0 e0 f8 55 01 bc cf ec f0  # df21 |   jne [0x155], 0xcfbc, ${fail}:rel + PC
86 20 e4 2a de fa              # df2b |   sub [A], 0xfade + A, A*4 + B
ee e0 e0 f8 aa 00 25 f8 dc f0  # df31 |   jne [0xaa], 0xf825, ${fail}:rel + PC
a6 2a 21 fe                    # df3b |   ishr [A*4 + B], A*2, G
ee e0 1c f8 63 03 0a ce f0     # df3f |   jne [0x363], 0xa, ${fail}:rel + PC
b2 21 fe e4 de fa              # df48 |   or [A*2], G, 0xfade + A
ee e0 e0 f8 54 01 dd fb bf f0  # df4e |   jne [0x154], 0xfbdd, ${fail}:rel + PC
8a e0 e4 fe 39 30 de fa        # df58 |   mul [0x3039], 0xfade + A, G
ee e0 e0 f8 39 30 28 0c ad f0  # df60 |   jne [0x3039], 0xc28, ${fail}:rel + PC
8e 2a 2a e4 de fa              # df6a |   imul [A*4 + B], A*4 + B, 0xfade + A
ee e0 e0 f8 63 03 98 dd 9d f0  # df70 |   jne [0x363], 0xdd98, ${fail}:rel + PC
ae e0 20 fe 39 30              # df7a |   and [0x3039], A, G
ee e0 00 f8 39 30 8d f0        # df80 |   jne [0x3039], 0, ${fail}:rel + PC
8e fe fe 2a                    # df88 |   imul [G], G, A*4 + B
ee e0 e0 f8 55 01 df 82 81 f0  # df8c |   jne [0x155], 0x82df, ${fail}:rel + PC
8e 3e 21 21 f6                 # df96 |   imul [A*4 + -10], A*2, A*2
ee e0 e0 f8 9e 02 90 c3 72 f0  # df9b |   jne [0x29e], 0xc390, ${fail}:rel + PC
b2 fe e4 1c de fa 85           # dfa5 |   or [G], 0xfade + A, -123
ee e0 e0 f8 55 01 8d ff 61 f0  # dfac |   jne [0x155], 0xff8d, ${fail}:rel + PC
8e 2a 20 3e f6                 # dfb6 |   imul [A*4 + B], A, A*4 + -10
ee e0 e0 f8 63 03 ec bc 52 f0  # dfbb |   jne [0x363], 0xbcec, ${fail}:rel + PC
a2 2a 3e e0 f6 39 30           # dfc5 |   shr [A*4 + B], A*4 + -10, 0x3039
ee e0 1c f8 63 03 01 41 f0     # dfcc |   jne [0x363], 0x1, ${fail}:rel + PC
b6 2a 21 e0 39 30              # dfd5 |   xor [A*4 + B], A*2, 0x3039
ee e0 e0 f8 63 03 6d 31 32 f0  # dfdb |   jne [0x363], 0x316d, ${fail}:rel + PC
a2 e0 3e e0 39 30 f6 39 30     # dfe5 |   shr [0x3039], A*4 + -10, 0x3039
ee e0 1c f8 39 30 01 1f f0     # dfee |   jne [0x3039], 0x1, ${fail}:rel + PC
a2 21 1c 3e 85 f6              # dff7 |   shr [A*2], -123, A*4 + -10
ee e0 1c f8 54 01 03 10 f0     # dffd |   jne [0x154], 0x3, ${fail}:rel + PC
b2 21 20 21                    # e006 |   or [A*2], A, A*2
ee e0 e0 f8 54 01 fe 01 03 f0  # e00a |   jne [0x154], 0x1fe, ${fail}:rel + PC
a2 fe 2a 21                    # e014 |   shr [G], A*4 + B, A*2
ee e0 1c f8 55 01 36 f5 ef     # e018 |   jne [0x155], 0x36, ${fail}:rel + PC
b6 e0 3e 2a 39 30 f6           # e021 |   xor [0x3039], A*4 + -10, A*4 + B
ee e0 e0 f8 39 30 fd 01 e5 ef  # e028 |   jne [0x3039], 0x1fd, ${fail}:rel + PC
8a 3e e4 3e f6 de fa f6        # e032 |   mul [A*4 + -10], 0xfade + A, A*4 + -10
ee e0 e0 f8 9e 02 f0 4d d3 ef  # e03a |   jne [0x29e], 0x4df0, ${fail}:rel + PC
8e 2a 21 3e f6                 # e044 |   imul [A*4 + B], A*2, A*4 + -10
ee e0 e0 f8 63 03 d8 79 c4 ef  # e049 |   jne [0x363], 0x79d8, ${fail}:rel + PC
a2 e0 e4 3e 39 30 de fa f6     # e053 |   shr [0x3039], 0xfade + A, A*4 + -10
ee e0 1c f8 39 30 03 b1 ef     # e05c |   jne [0x3039], 0x3, ${fail}:rel + PC
82 3e 20 fe f6                 # e065 |   add [A*4 + -10], A, G
ee e0 e0 f8 9e 02 ff 01 a3 ef  # e06a |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a2 2a e4 e0 de fa 39 30        # e074 |   shr [A*4 + B], 0xfade + A, 0x3039
ee e0 1c f8 63 03 7d 91 ef     # e07c |   jne [0x363], 0x7d, ${fail}:rel + PC
a2 3e 1c 1c f6 85 85           # e085 |   shr [A*4 + -10], -123, -123
ee e0 e0 f8 9e 02 fc 07 81 ef  # e08c |   jne [0x29e], 0x7fc, ${fail}:rel + PC
8e 20 1c e0 85 39 30           # e096 |   imul [A], -123, 0x3039
ee e0 e0 f8 aa 00 9d d4 70 ef  # e09d |   jne [0xaa], 0xd49d, ${fail}:rel + PC
aa 2a 3e 21 f6                 # e0a7 |   shl [A*4 + B], A*4 + -10, A*2
ee e0 e0 f8 63 03 e0 29 61 ef  # e0ac |   jne [0x363], 0x29e0, ${fail}:rel + PC
b6 21 e0 fe 39 30              # e0b6 |   xor [A*2], 0x3039, G
ee e0 e0 f8 54 01 6c 31 51 ef  # e0bc |   jne [0x154], 0x316c, ${fail}:rel + PC
b6 e0 3e 3e 39 30 f6 f6        # e0c6 |   xor [0x3039], A*4 + -10, A*4 + -10
ee e0 00 f8 39 30 3f ef        # e0ce |   jne [0x3039], 0, ${fail}:rel + PC
b6 20 21 1c 85                 # e0d6 |   xor [A], A*2, -123
ee e0 e0 f8 aa 00 d1 fe 32 ef  # e0db |   jne [0xaa], 0xfed1, ${fail}:rel + PC
b6 21 21 fe                    # e0e5 |   xor [A*2], A*2, G
ee e0 1c f8 54 01 01 24 ef     # e0e9 |   jne [0x154], 0x1, ${fail}:rel + PC
8a fe e0 20 39 30              # e0f2 |   mul [G], 0x3039, A
ee e0 e0 f8 55 01 da 05 15 ef  # e0f8 |   jne [0x155], 0x5da, ${fail}:rel + PC
b6 21 e0 21 39 30              # e102 |   xor [A*2], 0x3039, A*2
ee e0 e0 f8 54 01 6d 31 05 ef  # e108 |   jne [0x154], 0x316d, ${fail}:rel + PC
8a 21 2a e0 39 30              # e112 |   mul [A*2], A*4 + B, 0x3039
ee e0 e0 f8 54 01 0b 51 f5 ee  # e118 |   jne [0x154], 0x510b, ${fail}:rel + PC
ae 3e e0 1c f6 39 30 85        # e122 |   and [A*4 + -10], 0x3039, -123
ee e0 e0 f8 9e 02 01 30 e3 ee  # e12a |   jne [0x29e], 0x3001, ${fail}:rel + PC
aa fe 21 20                    # e134 |   shl [G], A*2, A
ee e0 e0 f8 55 01 00 50 d5 ee  # e138 |   jne [0x155], 0x5000, ${fail}:rel + PC
ae 20 e4 20 de fa              # e142 |   and [A], 0xfade + A, A
ee e0 e0 f8 aa 00 88 00 c5 ee  # e148 |   jne [0xaa], 0x88, ${fail}:rel + PC
aa 21 3e e4 f6 de fa           # e152 |   shl [A*2], A*4 + -10, 0xfade + A
ee e0 e0 f8 54 01 00 9e b4 ee  # e159 |   jne [0x154], 0x9e00, ${fail}:rel + PC
b6 e0 e0 1c 39 30 39 30 85     # e163 |   xor [0x3039], 0x3039, -123
ee e0 e0 f8 39 30 bc cf a1 ee  # e16c |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
8a 3e 3e 1c f6 f6 85           # e176 |   mul [A*4 + -10], A*4 + -10, -123
ee e0 e0 f8 9e 02 16 be 90 ee  # e17d |   jne [0x29e], 0xbe16, ${fail}:rel + PC
86 fe 21 3e f6                 # e187 |   sub [G], A*2, A*4 + -10
ee e0 e0 f8 55 01 b6 fe 81 ee  # e18c |   jne [0x155], 0xfeb6, ${fail}:rel + PC
86 3e 2a fe f6                 # e196 |   sub [A*4 + -10], A*4 + B, G
ee e0 e0 f8 9e 02 0e 02 72 ee  # e19b |   jne [0x29e], 0x20e, ${fail}:rel + PC
b6 3e 1c fe f6 85              # e1a5 |   xor [A*4 + -10], -123, G
ee e0 e0 f8 9e 02 d0 fe 62 ee  # e1ab |   jne [0x29e], 0xfed0, ${fail}:rel + PC
86 20 2a 1c 85                 # e1b5 |   sub [A], A*4 + B, -123
ee e0 e0 f8 aa 00 de 03 53 ee  # e1ba |   jne [0xaa], 0x3de, ${fail}:rel + PC
86 20 21 fe                    # e1c4 |   sub [A], A*2, G
ee e0 e0 f8 aa 00 ff ff 45 ee  # e1c8 |   jne [0xaa], 0xffff, ${fail}:rel + PC
86 2a 20 e4 de fa              # e1d2 |   sub [A*4 + B], A, 0xfade + A
ee e0 e0 f8 63 03 22 05 35 ee  # e1d8 |   jne [0x363], 0x522, ${fail}:rel + PC
aa e0 fe 3e 39 30 f6           # e1e2 |   shl [0x3039], G, A*4 + -10
ee e0 e0 f8 39 30 00 40 24 ee  # e1e9 |   jne [0x3039], 0x4000, ${fail}:rel + PC
ae 20 1c 1c 85 85              # e1f3 |   and [A], -123, -123
ee e0 e0 f8 aa 00 85 ff 14 ee  # e1f9 |   jne [0xaa], 0xff85, ${fail}:rel + PC
b6 20 fe e0 39 30              # e203 |   xor [A], G, 0x3039
ee e0 e0 f8 aa 00 6c 31 04 ee  # e209 |   jne [0xaa], 0x316c, ${fail}:rel + PC
b2 e0 21 3e 39 30 f6           # e213 |   or [0x3039], A*2, A*4 + -10
ee e0 e0 f8 39 30 de 03 f3 ed  # e21a |   jne [0x3039], 0x3de, ${fail}:rel + PC
b2 20 e4 21 de fa              # e224 |   or [A], 0xfade + A, A*2
ee e0 e0 f8 aa 00 dc fb e3 ed  # e22a |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
b6 fe 3e 3e f6 f6              # e234 |   xor [G], A*4 + -10, A*4 + -10
ee e0 00 f8 55 01 d3 ed        # e23a |   jne [0x155], 0, ${fail}:rel + PC
b6 3e 20 e4 f6 de fa           # e242 |   xor [A*4 + -10], A, 0xfade + A
ee e0 e0 f8 9e 02 22 fb c4 ed  # e249 |   jne [0x29e], 0xfb22, ${fail}:rel + PC
b6 e0 1c e0 39 30 85 39 30     # e253 |   xor [0x3039], -123, 0x3039
ee e0 e0 f8 39 30 bc cf b1 ed  # e25c |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
a2 3e fe 2a f6                 # e266 |   shr [A*4 + -10], G, A*4 + B
ee e0 1c f8 9e 02 2a a2 ed     # e26b |   jne [0x29e], 0x2a, ${fail}:rel + PC
ae 20 fe 20                    # e274 |   and [A], G, A
ee e0 00 f8 aa 00 95 ed        # e278 |   jne [0xaa], 0, ${fail}:rel + PC
86 2a e4 1c de fa 85           # e280 |   sub [A*4 + B], 0xfade + A, -123
ee e0 e0 f8 63 03 03 fc 86 ed  # e287 |   jne [0x363], 0xfc03, ${fail}:rel + PC
ae e0 21 21 39 30              # e291 |   and [0x3039], A*2, A*2
ee e0 e0 f8 39 30 54 01 76 ed  # e297 |   jne [0x3039], 0x154, ${fail}:rel + PC
a2 e0 20 e0 39 30 39 30        # e2a1 |   shr [0x3039], A, 0x3039
ee e0 00 f8 39 30 64 ed        # e2a9 |   jne [0x3039], 0, ${fail}:rel + PC
8e 3e 2a 3e f6 f6              # e2b1 |   imul [A*4 + -10], A*4 + B, A*4 + -10
ee e0 e0 f8 9e 02 1a dd 56 ed  # e2b7 |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
a2 e0 3e 1c 39 30 f6 85        # e2c1 |   shr [0x3039], A*4 + -10, -123
ee e0 1c f8 39 30 14 44 ed     # e2c9 |   jne [0x3039], 0x14, ${fail}:rel + PC
82 fe 20 e0 39 30              # e2d2 |   add [G], A, 0x3039
ee e0 e0 f8 55 01 e3 30 35 ed  # e2d8 |   jne [0x155], 0x30e3, ${fail}:rel + PC
a6 e0 21 e0 39 30 39 30        # e2e2 |   ishr [0x3039], A*2, 0x3039
ee e0 00 f8 39 30 23 ed        # e2ea |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e4 1c 39 30 de fa 85     # e2f2 |   ishr [0x3039], 0xfade + A, -123
ee e0 e0 f8 39 30 dc ff 12 ed  # e2fb |   jne [0x3039], 0xffdc, ${fail}:rel + PC
b2 3e fe 20 f6                 # e305 |   or [A*4 + -10], G, A
ee e0 e0 f8 9e 02 ff 01 03 ed  # e30a |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a6 2a 2a 20                    # e314 |   ishr [A*4 + B], A*4 + B, A
ee e0 00 f8 63 03 f5 ec        # e318 |   jne [0x363], 0, ${fail}:rel + PC
aa fe e0 2a 39 30              # e320 |   shl [G], 0x3039, A*4 + B
ee e0 e0 f8 55 01 c8 81 e7 ec  # e326 |   jne [0x155], 0x81c8, ${fail}:rel + PC
8a 21 3e 20 f6                 # e330 |   mul [A*2], A*4 + -10, A
ee e0 e0 f8 54 01 ec bc d8 ec  # e335 |   jne [0x154], 0xbcec, ${fail}:rel + PC
8e 3e 3e e0 f6 f6 39 30        # e33f |   imul [A*4 + -10], A*4 + -10, 0x3039
ee e0 e0 f8 9e 02 2e 35 c6 ec  # e347 |   jne [0x29e], 0x352e, ${fail}:rel + PC
b6 e0 1c 3e 39 30 85 f6        # e351 |   xor [0x3039], -123, A*4 + -10
ee e0 e0 f8 39 30 1b fd b4 ec  # e359 |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
b2 fe 20 e4 de fa              # e363 |   or [G], A, 0xfade + A
ee e0 e0 f8 55 01 aa fb a4 ec  # e369 |   jne [0x155], 0xfbaa, ${fail}:rel + PC
8e fe fe 3e f6                 # e373 |   imul [G], G, A*4 + -10
ee e0 e0 f8 55 01 76 7c 95 ec  # e378 |   jne [0x155], 0x7c76, ${fail}:rel + PC
8a 20 e0 3e 39 30 f6           # e382 |   mul [A], 0x3039, A*4 + -10
ee e0 e0 f8 aa 00 2e 35 84 ec  # e389 |   jne [0xaa], 0x352e, ${fail}:rel + PC
b2 fe 20 20                    # e393 |   or [G], A, A
ee e0 e0 f8 55 01 aa 00 76 ec  # e397 |   jne [0x155], 0xaa, ${fail}:rel + PC
a2 3e 21 e4 f6 de fa           # e3a1 |   shr [A*4 + -10], A*2, 0xfade + A
ee e0 1c f8 9e 02 01 65 ec     # e3a8 |   jne [0x29e], 0x1, ${fail}:rel + PC
a6 20 3e 2a f6                 # e3b1 |   ishr [A], A*4 + -10, A*4 + B
ee e0 1c f8 aa 00 53 57 ec     # e3b6 |   jne [0xaa], 0x53, ${fail}:rel + PC
82 20 e0 20 39 30              # e3bf |   add [A], 0x3039, A
ee e0 e0 f8 aa 00 e3 30 48 ec  # e3c5 |   jne [0xaa], 0x30e3, ${fail}:rel + PC
a6 20 1c 20 85                 # e3cf |   ishr [A], -123, A
ee e0 e0 f8 aa 00 ff ff 39 ec  # e3d4 |   jne [0xaa], 0xffff, ${fail}:rel + PC
ae 21 20 1c 85                 # e3de |   and [A*2], A, -123
ee e0 e0 f8 54 01 80 00 2a ec  # e3e3 |   jne [0x154], 0x80, ${fail}:rel + PC
b6 2a 1c e4 85 de fa           # e3ed |   xor [A*4 + B], -123, 0xfade + A
ee e0 e0 f8 63 03 0d 04 19 ec  # e3f4 |   jne [0x363], 0x40d, ${fail}:rel + PC
82 20 e0 21 39 30              # e3fe |   add [A], 0x3039, A*2
ee e0 e0 f8 aa 00 8d 31 09 ec  # e404 |   jne [0xaa], 0x318d, ${fail}:rel + PC
82 21 fe 2a                    # e40e |   add [A*2], G, A*4 + B
ee e0 e0 f8 54 01 b8 04 fb eb  # e412 |   jne [0x154], 0x4b8, ${fail}:rel + PC
b2 20 2a 20                    # e41c |   or [A], A*4 + B, A
ee e0 e0 f8 aa 00 eb 03 ed eb  # e420 |   jne [0xaa], 0x3eb, ${fail}:rel + PC
82 21 1c e0 85 39 30           # e42a |   add [A*2], -123, 0x3039
ee e0 e0 f8 54 01 be 2f dc eb  # e431 |   jne [0x154], 0x2fbe, ${fail}:rel + PC
aa fe 2a 1c 85                 # e43b |   shl [G], A*4 + B, -123
ee e0 e0 f8 55 01 60 6c cd eb  # e440 |   jne [0x155], 0x6c60, ${fail}:rel + PC
82 3e 3e 2a f6 f6              # e44a |   add [A*4 + -10], A*4 + -10, A*4 + B
ee e0 e0 f8 9e 02 01 06 bd eb  # e450 |   jne [0x29e], 0x601, ${fail}:rel + PC
b2 20 3e e4 f6 de fa           # e45a |   or [A], A*4 + -10, 0xfade + A
ee e0 e0 f8 aa 00 9e fb ac eb  # e461 |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
aa 2a 21 1c 85                 # e46b |   shl [A*4 + B], A*2, -123
ee e0 e0 f8 63 03 80 2a 9d eb  # e470 |   jne [0x363], 0x2a80, ${fail}:rel + PC
b2 e0 1c 2a 39 30 85           # e47a |   or [0x3039], -123, A*4 + B
ee e0 e0 f8 39 30 e7 ff 8c eb  # e481 |   jne [0x3039], 0xffe7, ${fail}:rel + PC
82 21 2a 2a                    # e48b |   add [A*2], A*4 + B, A*4 + B
ee e0 e0 f8 54 01 c6 06 7e eb  # e48f |   jne [0x154], 0x6c6, ${fail}:rel + PC
ae 20 21 20                    # e499 |   and [A], A*2, A
ee e0 00 f8 aa 00 70 eb        # e49d |   jne [0xaa], 0, ${fail}:rel + PC
86 20 fe 1c 85                 # e4a5 |   sub [A], G, -123
ee e0 e0 f8 aa 00 d0 01 63 eb  # e4aa |   jne [0xaa], 0x1d0, ${fail}:rel + PC
b2 20 2a 3e f6                 # e4b4 |   or [A], A*4 + B, A*4 + -10
ee e0 e0 f8 aa 00 ff 03 54 eb  # e4b9 |   jne [0xaa], 0x3ff, ${fail}:rel + PC
b6 2a 20 2a                    # e4c3 |   xor [A*4 + B], A, A*4 + B
ee e0 e0 f8 63 03 c9 03 46 eb  # e4c7 |   jne [0x363], 0x3c9, ${fail}:rel + PC
aa 21 fe 3e f6                 # e4d1 |   shl [A*2], G, A*4 + -10
ee e0 e0 f8 54 01 00 40 37 eb  # e4d6 |   jne [0x154], 0x4000, ${fail}:rel + PC
ae 3e e0 21 f6 39 30           # e4e0 |   and [A*4 + -10], 0x3039, A*2
ee e0 1c f8 9e 02 10 26 eb     # e4e7 |   jne [0x29e], 0x10, ${fail}:rel + PC
a2 e0 2a e4 39 30 de fa        # e4f0 |   shr [0x3039], A*4 + B, 0xfade + A
ee e0 1c f8 39 30 03 15 eb     # e4f8 |   jne [0x3039], 0x3, ${fail}:rel + PC
8a fe 21 2a                    # e501 |   mul [G], A*2, A*4 + B
ee e0 e0 f8 55 01 7c 7f 08 eb  # e505 |   jne [0x155], 0x7f7c, ${fail}:rel + PC
a2 3e 3e fe f6 f6              # e50f |   shr [A*4 + -10], A*4 + -10, G
ee e0 1c f8 9e 02 14 f8 ea     # e515 |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 20 e0 e4 39 30 de fa        # e51e |   mul [A], 0x3039, 0xfade + A
ee e0 e0 f8 aa 00 48 81 e7 ea  # e526 |   jne [0xaa], 0x8148, ${fail}:rel + PC
8a 2a 1c 3e 85 f6              # e530 |   mul [A*4 + B], -123, A*4 + -10
ee e0 e0 f8 63 03 16 be d7 ea  # e536 |   jne [0x363], 0xbe16, ${fail}:rel + PC
ae 2a 1c fe 85                 # e540 |   and [A*4 + B], -123, G
ee e0 e0 f8 63 03 05 01 c8 ea  # e545 |   jne [0x363], 0x105, ${fail}:rel + PC
aa e0 e0 20 39 30 39 30        # e54f |   shl [0x3039], 0x3039, A
ee e0 e0 f8 39 30 00 e4 b6 ea  # e557 |   jne [0x3039], 0xe400, ${fail}:rel + PC
8e 20 fe 2a                    # e561 |   imul [A], G, A*4 + B
ee e0 e0 f8 aa 00 df 82 a8 ea  # e565 |   jne [0xaa], 0x82df, ${fail}:rel + PC
86 3e 1c 3e f6 85 f6           # e56f |   sub [A*4 + -10], -123, A*4 + -10
ee e0 e0 f8 9e 02 e7 fc 97 ea  # e576 |   jne [0x29e], 0xfce7, ${fail}:rel + PC
aa 21 20 2a                    # e580 |   shl [A*2], A, A*4 + B
ee e0 e0 f8 54 01 50 05 89 ea  # e584 |   jne [0x154], 0x550, ${fail}:rel + PC
82 20 3e 21 f6                 # e58e |   add [A], A*4 + -10, A*2
ee e0 e0 f8 aa 00 f2 03 7a ea  # e593 |   jne [0xaa], 0x3f2, ${fail}:rel + PC
8a 21 fe 1c 85                 # e59d |   mul [A*2], G, -123
ee e0 e0 f8 54 01 29 5c 6b ea  # e5a2 |   jne [0x154], 0x5c29, ${fail}:rel + PC
8a fe 1c e0 85 39 30           # e5ac |   mul [G], -123, 0x3039
ee e0 e0 f8 55 01 9d d4 5a ea  # e5b3 |   jne [0x155], 0xd49d, ${fail}:rel + PC
a6 e0 2a 2a 39 30              # e5bd |   ishr [0x3039], A*4 + B, A*4 + B
ee e0 1c f8 39 30 6c 4a ea     # e5c3 |   jne [0x3039], 0x6c, ${fail}:rel + PC
82 2a 1c 21 85                 # e5cc |   add [A*4 + B], -123, A*2
ee e0 e0 f8 63 03 d9 00 3c ea  # e5d1 |   jne [0x363], 0xd9, ${fail}:rel + PC
8a e0 e0 fe 39 30 39 30        # e5db |   mul [0x3039], 0x3039, G
ee e0 e0 f8 39 30 ed 3b 2a ea  # e5e3 |   jne [0x3039], 0x3bed, ${fail}:rel + PC
b2 e0 2a fe 39 30              # e5ed |   or [0x3039], A*4 + B, G
ee e0 e0 f8 39 30 77 03 1a ea  # e5f3 |   jne [0x3039], 0x377, ${fail}:rel + PC
aa 2a 1c e0 85 39 30           # e5fd |   shl [A*4 + B], -123, 0x3039
ee e0 e0 f8 63 03 00 0a 09 ea  # e604 |   jne [0x363], 0xa00, ${fail}:rel + PC
8a fe 1c 2a 85                 # e60e |   mul [G], -123, A*4 + B
ee e0 e0 f8 55 01 6f 5f fa e9  # e613 |   jne [0x155], 0x5f6f, ${fail}:rel + PC
ae 3e e0 fe f6 39 30           # e61d |   and [A*4 + -10], 0x3039, G
ee e0 1c f8 9e 02 11 e9 e9     # e624 |   jne [0x29e], 0x11, ${fail}:rel + PC
a6 2a 21 e4 de fa              # e62d |   ishr [A*4 + B], A*2, 0xfade + A
ee e0 1c f8 63 03 01 da e9     # e633 |   jne [0x363], 0x1, ${fail}:rel + PC
b2 21 21 2a                    # e63c |   or [A*2], A*2, A*4 + B
ee e0 e0 f8 54 01 77 03 cd e9  # e640 |   jne [0x154], 0x377, ${fail}:rel + PC
ae 2a fe fe                    # e64a |   and [A*4 + B], G, G
ee e0 e0 f8 63 03 55 01 bf e9  # e64e |   jne [0x363], 0x155, ${fail}:rel + PC
aa 2a 3e 3e f6 f6              # e658 |   shl [A*4 + B], A*4 + -10, A*4 + -10
ee e0 e0 f8 63 03 00 80 af e9  # e65e |   jne [0x363], 0x8000, ${fail}:rel + PC
86 3e 2a 1c f6 85              # e668 |   sub [A*4 + -10], A*4 + B, -123
ee e0 e0 f8 9e 02 de 03 9f e9  # e66e |   jne [0x29e], 0x3de, ${fail}:rel + PC
ae fe fe 1c 85                 # e678 |   and [G], G, -123
ee e0 e0 f8 55 01 05 01 90 e9  # e67d |   jne [0x155], 0x105, ${fail}:rel + PC
a6 21 3e 1c f6 85              # e687 |   ishr [A*2], A*4 + -10, -123
ee e0 1c f8 54 01 14 80 e9     # e68d |   jne [0x154], 0x14, ${fail}:rel + PC
b2 e0 21 fe 39 30              # e696 |   or [0x3039], A*2, G
ee e0 e0 f8 39 30 55 01 71 e9  # e69c |   jne [0x3039], 0x155, ${fail}:rel + PC
b2 2a 20 21                    # e6a6 |   or [A*4 + B], A, A*2
ee e0 e0 f8 63 03 fe 01 63 e9  # e6aa |   jne [0x363], 0x1fe, ${fail}:rel + PC
a2 21 20 e0 39 30              # e6b4 |   shr [A*2], A, 0x3039
ee e0 00 f8 54 01 53 e9        # e6ba |   jne [0x154], 0, ${fail}:rel + PC
8e 3e 3e e4 f6 f6 de fa        # e6c2 |   imul [A*4 + -10], A*4 + -10, 0xfade + A
ee e0 e0 f8 9e 02 f0 4d 43 e9  # e6ca |   jne [0x29e], 0x4df0, ${fail}:rel + PC
a2 2a 3e fe f6                 # e6d4 |   shr [A*4 + B], A*4 + -10, G
ee e0 1c f8 63 03 14 34 e9     # e6d9 |   jne [0x363], 0x14, ${fail}:rel + PC
aa e0 2a 1c 39 30 85           # e6e2 |   shl [0x3039], A*4 + B, -123
ee e0 e0 f8 39 30 60 6c 24 e9  # e6e9 |   jne [0x3039], 0x6c60, ${fail}:rel + PC
86 e0 3e 20 39 30 f6           # e6f3 |   sub [0x3039], A*4 + -10, A
ee e0 e0 f8 39 30 f4 01 13 e9  # e6fa |   jne [0x3039], 0x1f4, ${fail}:rel + PC
86 fe 3e fe f6                 # e704 |   sub [G], A*4 + -10, G
ee e0 e0 f8 55 01 49 01 04 e9  # e709 |   jne [0x155], 0x149, ${fail}:rel + PC
b6 20 20 2a                    # e713 |   xor [A], A, A*4 + B
ee e0 e0 f8 aa 00 c9 03 f6 e8  # e717 |   jne [0xaa], 0x3c9, ${fail}:rel + PC
a2 20 21 21                    # e721 |   shr [A], A*2, A*2
ee e0 1c f8 aa 00 15 e8 e8     # e725 |   jne [0xaa], 0x15, ${fail}:rel + PC
82 2a e0 21 39 30              # e72e |   add [A*4 + B], 0x3039, A*2
ee e0 e0 f8 63 03 8d 31 d9 e8  # e734 |   jne [0x363], 0x318d, ${fail}:rel + PC
82 fe 2a 2a                    # e73e |   add [G], A*4 + B, A*4 + B
ee e0 e0 f8 55 01 c6 06 cb e8  # e742 |   jne [0x155], 0x6c6, ${fail}:rel + PC
aa 2a 2a 3e f6                 # e74c |   shl [A*4 + B], A*4 + B, A*4 + -10
ee e0 e0 f8 63 03 00 c0 bc e8  # e751 |   jne [0x363], 0xc000, ${fail}:rel + PC
b6 3e 2a 20 f6                 # e75b |   xor [A*4 + -10], A*4 + B, A
ee e0 e0 f8 9e 02 c9 03 ad e8  # e760 |   jne [0x29e], 0x3c9, ${fail}:rel + PC
8a 20 e4 1c de fa 85           # e76a |   mul [A], 0xfade + A, -123
ee e0 e0 f8 aa 00 a8 25 9c e8  # e771 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
ae 3e e0 e4 f6 39 30 de fa     # e77b |   and [A*4 + -10], 0x3039, 0xfade + A
ee e0 e0 f8 9e 02 08 30 89 e8  # e784 |   jne [0x29e], 0x3008, ${fail}:rel + PC
82 20 fe 21                    # e78e |   add [A], G, A*2
ee e0 e0 f8 aa 00 a9 02 7b e8  # e792 |   jne [0xaa], 0x2a9, ${fail}:rel + PC
86 fe e4 fe de fa              # e79c |   sub [G], 0xfade + A, G
ee e0 e0 f8 55 01 33 fa 6b e8  # e7a2 |   jne [0x155], 0xfa33, ${fail}:rel + PC
a2 e0 3e e4 39 30 f6 de fa     # e7ac |   shr [0x3039], A*4 + -10, 0xfade + A
ee e0 1c f8 39 30 02 58 e8     # e7b5 |   jne [0x3039], 0x2, ${fail}:rel + PC
a2 3e 21 2a f6                 # e7be |   shr [A*4 + -10], A*2, A*4 + B
ee e0 1c f8 9e 02 2a 4a e8     # e7c3 |   jne [0x29e], 0x2a, ${fail}:rel + PC
a2 fe 20 2a                    # e7cc |   shr [G], A, A*4 + B
ee e0 1c f8 55 01 15 3d e8     # e7d0 |   jne [0x155], 0x15, ${fail}:rel + PC
8e 2a fe 21                    # e7d9 |   imul [A*4 + B], G, A*2
ee e0 e0 f8 63 03 e4 c4 30 e8  # e7dd |   jne [0x363], 0xc4e4, ${fail}:rel + PC
8a 3e e4 e4 f6 de fa de fa     # e7e7 |   mul [A*4 + -10], 0xfade + A, 0xfade + A
ee e0 e0 f8 9e 02 40 f8 1d e8  # e7f0 |   jne [0x29e], 0xf840, ${fail}:rel + PC
82 3e 2a e0 f6 39 30           # e7fa |   add [A*4 + -10], A*4 + B, 0x3039
ee e0 e0 f8 9e 02 9c 33 0c e8  # e801 |   jne [0x29e], 0x339c, ${fail}:rel + PC
b6 2a fe 3e f6                 # e80b |   xor [A*4 + B], G, A*4 + -10
ee e0 e0 f8 63 03 cb 03 fd e7  # e810 |   jne [0x363], 0x3cb, ${fail}:rel + PC
b6 21 e4 20 de fa              # e81a |   xor [A*2], 0xfade + A, A
ee e0 e0 f8 54 01 22 fb ed e7  # e820 |   jne [0x154], 0xfb22, ${fail}:rel + PC
a2 e0 e0 21 39 30 39 30        # e82a |   shr [0x3039], 0x3039, A*2
ee e0 e0 f8 39 30 03 03 db e7  # e832 |   jne [0x3039], 0x303, ${fail}:rel + PC
8e 2a fe e0 39 30              # e83c |   imul [A*4 + B], G, 0x3039
ee e0 e0 f8 63 03 ed 3b cb e7  # e842 |   jne [0x363], 0x3bed, ${fail}:rel + PC
b6 e0 1c 21 39 30 85           # e84c |   xor [0x3039], -123, A*2
ee e0 e0 f8 39 30 d1 fe ba e7  # e853 |   jne [0x3039], 0xfed1, ${fail}:rel + PC
86 e0 fe e4 39 30 de fa        # e85d |   sub [0x3039], G, 0xfade + A
ee e0 e0 f8 39 30 cd 05 a8 e7  # e865 |   jne [0x3039], 0x5cd, ${fail}:rel + PC
b6 20 21 e4 de fa              # e86f |   xor [A], A*2, 0xfade + A
ee e0 e0 f8 aa 00 dc fa 98 e7  # e875 |   jne [0xaa], 0xfadc, ${fail}:rel + PC
8a 21 3e e0 f6 39 30           # e87f |   mul [A*2], A*4 + -10, 0x3039
ee e0 e0 f8 54 01 2e 35 87 e7  # e886 |   jne [0x154], 0x352e, ${fail}:rel + PC
aa 2a 21 20                    # e890 |   shl [A*4 + B], A*2, A
ee e0 e0 f8 63 03 00 50 79 e7  # e894 |   jne [0x363], 0x5000, ${fail}:rel + PC
ae fe 1c e4 85 de fa           # e89e |   and [G], -123, 0xfade + A
ee e0 e0 f8 55 01 80 fb 68 e7  # e8a5 |   jne [0x155], 0xfb80, ${fail}:rel + PC
a2 20 20 21                    # e8af |   shr [A], A, A*2
ee e0 1c f8 aa 00 0a 5a e7     # e8b3 |   jne [0xaa], 0xa, ${fail}:rel + PC
b6 3e 20 3e f6 f6              # e8bc |   xor [A*4 + -10], A, A*4 + -10
ee e0 e0 f8 9e 02 34 02 4b e7  # e8c2 |   jne [0x29e], 0x234, ${fail}:rel + PC
aa 3e 3e 21 f6 f6              # e8cc |   shl [A*4 + -10], A*4 + -10, A*2
ee e0 e0 f8 9e 02 e0 29 3b e7  # e8d2 |   jne [0x29e], 0x29e0, ${fail}:rel + PC
8a 20 3e 1c f6 85              # e8dc |   mul [A], A*4 + -10, -123
ee e0 e0 f8 aa 00 16 be 2b e7  # e8e2 |   jne [0xaa], 0xbe16, ${fail}:rel + PC
b2 fe fe e0 39 30              # e8ec |   or [G], G, 0x3039
ee e0 e0 f8 55 01 7d 31 1b e7  # e8f2 |   jne [0x155], 0x317d, ${fail}:rel + PC
a2 2a e4 3e de fa f6           # e8fc |   shr [A*4 + B], 0xfade + A, A*4 + -10
ee e0 1c f8 63 03 03 0a e7     # e903 |   jne [0x363], 0x3, ${fail}:rel + PC
8a 2a 20 e0 39 30              # e90c |   mul [A*4 + B], A, 0x3039
ee e0 e0 f8 63 03 da 05 fb e6  # e912 |   jne [0x363], 0x5da, ${fail}:rel + PC
ae 3e 21 e0 f6 39 30           # e91c |   and [A*4 + -10], A*2, 0x3039
ee e0 1c f8 9e 02 10 ea e6     # e923 |   jne [0x29e], 0x10, ${fail}:rel + PC
ae e0 20 2a 39 30              # e92c |   and [0x3039], A, A*4 + B
ee e0 1c f8 39 30 22 db e6     # e932 |   jne [0x3039], 0x22, ${fail}:rel + PC
8e fe 2a fe                    # e93b |   imul [G], A*4 + B, G
ee e0 e0 f8 55 01 df 82 ce e6  # e93f |   jne [0x155], 0x82df, ${fail}:rel + PC
86 e0 fe 2a 39 30              # e949 |   sub [0x3039], G, A*4 + B
ee e0 e0 f8 39 30 f2 fd be e6  # e94f |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
a2 2a fe 2a                    # e959 |   shr [A*4 + B], G, A*4 + B
ee e0 1c f8 63 03 2a b0 e6     # e95d |   jne [0x363], 0x2a, ${fail}:rel + PC
b2 3e fe fe f6                 # e966 |   or [A*4 + -10], G, G
ee e0 e0 f8 9e 02 55 01 a2 e6  # e96b |   jne [0x29e], 0x155, ${fail}:rel + PC
b6 21 20 fe                    # e975 |   xor [A*2], A, G
ee e0 e0 f8 54 01 ff 01 94 e6  # e979 |   jne [0x154], 0x1ff, ${fail}:rel + PC
a2 fe 3e 1c f6 85              # e983 |   shr [G], A*4 + -10, -123
ee e0 1c f8 55 01 14 84 e6     # e989 |   jne [0x155], 0x14, ${fail}:rel + PC
a6 e0 fe 20 39 30              # e992 |   ishr [0x3039], G, A
ee e0 00 f8 39 30 75 e6        # e998 |   jne [0x3039], 0, ${fail}:rel + PC
8a 21 1c e4 85 de fa           # e9a0 |   mul [A*2], -123, 0xfade + A
ee e0 e0 f8 54 01 a8 25 66 e6  # e9a7 |   jne [0x154], 0x25a8, ${fail}:rel + PC
b2 21 e4 e0 de fa 39 30        # e9b1 |   or [A*2], 0xfade + A, 0x3039
ee e0 e0 f8 54 01 b9 fb 54 e6  # e9b9 |   jne [0x154], 0xfbb9, ${fail}:rel + PC
8e 2a e0 e4 39 30 de fa        # e9c3 |   imul [A*4 + B], 0x3039, 0xfade + A
ee e0 e0 f8 63 03 48 81 42 e6  # e9cb |   jne [0x363], 0x8148, ${fail}:rel + PC
b2 3e fe 1c f6 85              # e9d5 |   or [A*4 + -10], G, -123
ee e0 e0 f8 9e 02 d5 ff 32 e6  # e9db |   jne [0x29e], 0xffd5, ${fail}:rel + PC
a6 3e 21 20 f6                 # e9e5 |   ishr [A*4 + -10], A*2, A
ee e0 00 f8 9e 02 23 e6        # e9ea |   jne [0x29e], 0, ${fail}:rel + PC
ae 21 2a 1c 85                 # e9f2 |   and [A*2], A*4 + B, -123
ee e0 e0 f8 54 01 01 03 16 e6  # e9f7 |   jne [0x154], 0x301, ${fail}:rel + PC
b2 20 21 3e f6                 # ea01 |   or [A], A*2, A*4 + -10
ee e0 e0 f8 aa 00 de 03 07 e6  # ea06 |   jne [0xaa], 0x3de, ${fail}:rel + PC
82 fe 3e 20 f6                 # ea10 |   add [G], A*4 + -10, A
ee e0 e0 f8 55 01 48 03 f8 e5  # ea15 |   jne [0x155], 0x348, ${fail}:rel + PC
aa 3e 20 e0 f6 39 30           # ea1f |   shl [A*4 + -10], A, 0x3039
ee e0 e0 f8 9e 02 00 54 e7 e5  # ea26 |   jne [0x29e], 0x5400, ${fail}:rel + PC
aa 20 e4 e4 de fa de fa        # ea30 |   shl [A], 0xfade + A, 0xfade + A
ee e0 e0 f8 aa 00 00 88 d5 e5  # ea38 |   jne [0xaa], 0x8800, ${fail}:rel + PC
8e fe 3e e0 f6 39 30           # ea42 |   imul [G], A*4 + -10, 0x3039
ee e0 e0 f8 55 01 2e 35 c4 e5  # ea49 |   jne [0x155], 0x352e, ${fail}:rel + PC
82 e0 1c 1c 39 30 85 85        # ea53 |   add [0x3039], -123, -123
ee e0 e0 f8 39 30 0a ff b2 e5  # ea5b |   jne [0x3039], 0xff0a, ${fail}:rel + PC
86 21 3e fe f6                 # ea65 |   sub [A*2], A*4 + -10, G
ee e0 e0 f8 54 01 49 01 a3 e5  # ea6a |   jne [0x154], 0x149, ${fail}:rel + PC
a6 20 e4 fe de fa              # ea74 |   ishr [A], 0xfade + A, G
ee e0 e0 f8 aa 00 dc ff 93 e5  # ea7a |   jne [0xaa], 0xffdc, ${fail}:rel + PC
b6 20 e4 e0 de fa 39 30        # ea84 |   xor [A], 0xfade + A, 0x3039
ee e0 e0 f8 aa 00 b1 cb 81 e5  # ea8c |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
86 fe 21 e4 de fa              # ea96 |   sub [G], A*2, 0xfade + A
ee e0 e0 f8 55 01 cc 05 71 e5  # ea9c |   jne [0x155], 0x5cc, ${fail}:rel + PC
82 2a e0 e0 39 30 39 30        # eaa6 |   add [A*4 + B], 0x3039, 0x3039
ee e0 e0 f8 63 03 72 60 5f e5  # eaae |   jne [0x363], 0x6072, ${fail}:rel + PC
86 3e 1c e4 f6 85 de fa        # eab8 |   sub [A*4 + -10], -123, 0xfade + A
ee e0 e0 f8 9e 02 fd 03 4d e5  # eac0 |   jne [0x29e], 0x3fd, ${fail}:rel + PC
82 21 21 3e f6                 # eaca |   add [A*2], A*2, A*4 + -10
ee e0 e0 f8 54 01 f2 03 3e e5  # eacf |   jne [0x154], 0x3f2, ${fail}:rel + PC
a2 20 e0 1c 39 30 85           # ead9 |   shr [A], 0x3039, -123
ee e0 e0 f8 aa 00 81 01 2d e5  # eae0 |   jne [0xaa], 0x181, ${fail}:rel + PC
8e 21 20 3e f6                 # eaea |   imul [A*2], A, A*4 + -10
ee e0 e0 f8 54 01 ec bc 1e e5  # eaef |   jne [0x154], 0xbcec, ${fail}:rel + PC
b2 3e fe e4 f6 de fa           # eaf9 |   or [A*4 + -10], G, 0xfade + A
ee e0 e0 f8 9e 02 dd fb 0d e5  # eb00 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
a6 fe 20 1c 85                 # eb0a |   ishr [G], A, -123
ee e0 1c f8 55 01 05 fe e4     # eb0f |   jne [0x155], 0x5, ${fail}:rel + PC
a6 21 20 e4 de fa              # eb18 |   ishr [A*2], A, 0xfade + A
ee e0 00 f8 54 01 ef e4        # eb1e |   jne [0x154], 0, ${fail}:rel + PC
a2 e0 1c 20 39 30 85           # eb26 |   shr [0x3039], -123, A
ee e0 1c f8 39 30 3f e0 e4     # eb2d |   jne [0x3039], 0x3f, ${fail}:rel + PC
8e 20 20 3e f6                 # eb36 |   imul [A], A, A*4 + -10
ee e0 e0 f8 aa 00 ec bc d2 e4  # eb3b |   jne [0xaa], 0xbcec, ${fail}:rel + PC
82 2a e4 fe de fa              # eb45 |   add [A*4 + B], 0xfade + A, G
ee e0 e0 f8 63 03 dd fc c2 e4  # eb4b |   jne [0x363], 0xfcdd, ${fail}:rel + PC
b6 fe e0 3e 39 30 f6           # eb55 |   xor [G], 0x3039, A*4 + -10
ee e0 e0 f8 55 01 a7 32 b1 e4  # eb5c |   jne [0x155], 0x32a7, ${fail}:rel + PC
8e 20 e0 2a 39 30              # eb66 |   imul [A], 0x3039, A*4 + B
ee e0 e0 f8 aa 00 0b 51 a1 e4  # eb6c |   jne [0xaa], 0x510b, ${fail}:rel + PC
b2 3e e4 fe f6 de fa           # eb76 |   or [A*4 + -10], 0xfade + A, G
ee e0 e0 f8 9e 02 dd fb 90 e4  # eb7d |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
86 21 1c 21 85                 # eb87 |   sub [A*2], -123, A*2
ee e0 e0 f8 54 01 31 fe 81 e4  # eb8c |   jne [0x154], 0xfe31, ${fail}:rel + PC
b2 2a 21 21                    # eb96 |   or [A*4 + B], A*2, A*2
ee e0 e0 f8 63 03 54 01 73 e4  # eb9a |   jne [0x363], 0x154, ${fail}:rel + PC
8e e0 20 3e 39 30 f6           # eba4 |   imul [0x3039], A, A*4 + -10
ee e0 e0 f8 39 30 ec bc 62 e4  # ebab |   jne [0x3039], 0xbcec, ${fail}:rel + PC
a6 3e e4 2a f6 de fa           # ebb5 |   ishr [A*4 + -10], 0xfade + A, A*4 + B
ee e0 e0 f8 9e 02 71 ff 51 e4  # ebbc |   jne [0x29e], 0xff71, ${fail}:rel + PC
ae e0 20 e4 39 30 de fa        # ebc6 |   and [0x3039], A, 0xfade + A
ee e0 e0 f8 39 30 88 00 3f e4  # ebce |   jne [0x3039], 0x88, ${fail}:rel + PC
a6 20 fe fe                    # ebd8 |   ishr [A], G, G
ee e0 1c f8 aa 00 0a 31 e4     # ebdc |   jne [0xaa], 0xa, ${fail}:rel + PC
8e 20 3e 20 f6                 # ebe5 |   imul [A], A*4 + -10, A
ee e0 e0 f8 aa 00 ec bc 23 e4  # ebea |   jne [0xaa], 0xbcec, ${fail}:rel + PC
b2 e0 3e fe 39 30 f6           # ebf4 |   or [0x3039], A*4 + -10, G
ee e0 e0 f8 39 30 df 03 12 e4  # ebfb |   jne [0x3039], 0x3df, ${fail}:rel + PC
82 21 e0 e4 39 30 de fa        # ec05 |   add [A*2], 0x3039, 0xfade + A
ee e0 e0 f8 54 01 c1 2b 00 e4  # ec0d |   jne [0x154], 0x2bc1, ${fail}:rel + PC
82 e0 1c e4 39 30 85 de fa     # ec17 |   add [0x3039], -123, 0xfade + A
ee e0 e0 f8 39 30 0d fb ed e3  # ec20 |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
b2 fe 20 21                    # ec2a |   or [G], A, A*2
ee e0 e0 f8 55 01 fe 01 df e3  # ec2e |   jne [0x155], 0x1fe, ${fail}:rel + PC
aa 21 2a 21                    # ec38 |   shl [A*2], A*4 + B, A*2
ee e0 e0 f8 54 01 30 36 d1 e3  # ec3c |   jne [0x154], 0x3630, ${fail}:rel + PC
82 e0 2a e0 39 30 39 30        # ec46 |   add [0x3039], A*4 + B, 0x3039
ee e0 e0 f8 39 30 9c 33 bf e3  # ec4e |   jne [0x3039], 0x339c, ${fail}:rel + PC
ae 2a 20 1c 85                 # ec58 |   and [A*4 + B], A, -123
ee e0 e0 f8 63 03 80 00 b0 e3  # ec5d |   jne [0x363], 0x80, ${fail}:rel + PC
b6 e0 20 1c 39 30 85           # ec67 |   xor [0x3039], A, -123
ee e0 e0 f8 39 30 2f ff 9f e3  # ec6e |   jne [0x3039], 0xff2f, ${fail}:rel + PC
ae 21 fe e0 39 30              # ec78 |   and [A*2], G, 0x3039
ee e0 1c f8 54 01 11 8f e3     # ec7e |   jne [0x154], 0x11, ${fail}:rel + PC
ae 3e fe 3e f6 f6              # ec87 |   and [A*4 + -10], G, A*4 + -10
ee e0 1c f8 9e 02 14 80 e3     # ec8d |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 3e 2a 2a f6                 # ec96 |   mul [A*4 + -10], A*4 + B, A*4 + B
ee e0 e0 f8 9e 02 49 78 72 e3  # ec9b |   jne [0x29e], 0x7849, ${fail}:rel + PC
82 20 3e e0 f6 39 30           # eca5 |   add [A], A*4 + -10, 0x3039
ee e0 e0 f8 aa 00 d7 32 61 e3  # ecac |   jne [0xaa], 0x32d7, ${fail}:rel + PC
82 21 e0 3e 39 30 f6           # ecb6 |   add [A*2], 0x3039, A*4 + -10
ee e0 e0 f8 54 01 d7 32 50 e3  # ecbd |   jne [0x154], 0x32d7, ${fail}:rel + PC
b6 21 3e 3e f6 f6              # ecc7 |   xor [A*2], A*4 + -10, A*4 + -10
ee e0 00 f8 54 01 40 e3        # eccd |   jne [0x154], 0, ${fail}:rel + PC
a6 e0 20 20 39 30              # ecd5 |   ishr [0x3039], A, A
ee e0 00 f8 39 30 32 e3        # ecdb |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e0 3e 39 30 39 30 f6     # ece3 |   ishr [0x3039], 0x3039, A*4 + -10
ee e0 00 f8 39 30 21 e3        # ecec |   jne [0x3039], 0, ${fail}:rel + PC
aa 20 1c 21 85                 # ecf4 |   shl [A], -123, A*2
ee e0 e0 f8 aa 00 50 f8 14 e3  # ecf9 |   jne [0xaa], 0xf850, ${fail}:rel + PC
ae e0 21 e4 39 30 de fa        # ed03 |   and [0x3039], A*2, 0xfade + A
ee e0 e0 f8 39 30 00 01 02 e3  # ed0b |   jne [0x3039], 0x100, ${fail}:rel + PC
b2 3e 1c 20 f6 85              # ed15 |   or [A*4 + -10], -123, A
ee e0 e0 f8 9e 02 af ff f2 e2  # ed1b |   jne [0x29e], 0xffaf, ${fail}:rel + PC
8e 21 1c 20 85                 # ed25 |   imul [A*2], -123, A
ee e0 e0 f8 54 01 52 ae e3 e2  # ed2a |   jne [0x154], 0xae52, ${fail}:rel + PC
8a 2a 2a 2a                    # ed34 |   mul [A*4 + B], A*4 + B, A*4 + B
ee e0 e0 f8 63 03 49 78 d5 e2  # ed38 |   jne [0x363], 0x7849, ${fail}:rel + PC
86 2a 2a e0 39 30              # ed42 |   sub [A*4 + B], A*4 + B, 0x3039
ee e0 e0 f8 63 03 2a d3 c5 e2  # ed48 |   jne [0x363], 0xd32a, ${fail}:rel + PC
ae fe 1c 21 85                 # ed52 |   and [G], -123, A*2
ee e0 e0 f8 55 01 04 01 b6 e2  # ed57 |   jne [0x155], 0x104, ${fail}:rel + PC
8e 21 e4 1c de fa 85           # ed61 |   imul [A*2], 0xfade + A, -123
ee e0 e0 f8 54 01 a8 25 a5 e2  # ed68 |   jne [0x154], 0x25a8, ${fail}:rel + PC
8a 21 21 e4 de fa              # ed72 |   mul [A*2], A*2, 0xfade + A
ee e0 e0 f8 54 01 a0 10 95 e2  # ed78 |   jne [0x154], 0x10a0, ${fail}:rel + PC
86 fe e0 fe 39 30              # ed82 |   sub [G], 0x3039, G
ee e0 e0 f8 55 01 e4 2e 85 e2  # ed88 |   jne [0x155], 0x2ee4, ${fail}:rel + PC
62 20 1c 85                    # ed92 |   mov [A], -123
ee e0 e0 f8 aa 00 85 ff 77 e2  # ed96 |   jne [0xaa], 0xff85, ${fail}:rel + PC
62 3e 3e f6 f6                 # eda0 |   mov [A*4 + -10], A*4 + -10
ee e0 e0 f8 9e 02 9e 02 68 e2  # eda5 |   jne [0x29e], 0x29e, ${fail}:rel + PC
62 21 2a                       # edaf |   mov [A*2], A*4 + B
ee e0 e0 f8 54 01 63 03 5b e2  # edb2 |   jne [0x154], 0x363, ${fail}:rel + PC
62 e0 1c 39 30 85              # edbc |   mov [0x3039], -123
ee e0 e0 f8 39 30 85 ff 4b e2  # edc2 |   jne [0x3039], 0xff85, ${fail}:rel + PC
62 fe 3e f6                    # edcc |   mov [G], A*4 + -10
ee e0 e0 f8 55 01 9e 02 3d e2  # edd0 |   jne [0x155], 0x29e, ${fail}:rel + PC
62 e0 fe 39 30                 # edda |   mov [0x3039], G
ee e0 e0 f8 39 30 55 01 2e e2  # eddf |   jne [0x3039], 0x155, ${fail}:rel + PC
62 fe 21                       # ede9 |   mov [G], A*2
ee e0 e0 f8 55 01 54 01 21 e2  # edec |   jne [0x155], 0x154, ${fail}:rel + PC
62 3e e4 f6 de fa              # edf6 |   mov [A*4 + -10], 0xfade + A
ee e0 e0 f8 9e 02 88 fb 11 e2  # edfc |   jne [0x29e], 0xfb88, ${fail}:rel + PC
62 e0 e0 39 30 39 30           # ee06 |   mov [0x3039], 0x3039
ee e0 e0 f8 39 30 39 30 00 e2  # ee0d |   jne [0x3039], 0x3039, ${fail}:rel + PC
62 3e fe f6                    # ee17 |   mov [A*4 + -10], G
ee e0 e0 f8 9e 02 55 01 f2 e1  # ee1b |   jne [0x29e], 0x155, ${fail}:rel + PC
62 20 fe                       # ee25 |   mov [A], G
ee e0 e0 f8 aa 00 55 01 e5 e1  # ee28 |   jne [0xaa], 0x155, ${fail}:rel + PC
62 2a 2a                       # ee32 |   mov [A*4 + B], A*4 + B
ee e0 e0 f8 63 03 63 03 d8 e1  # ee35 |   jne [0x363], 0x363, ${fail}:rel + PC
62 3e 2a f6                    # ee3f |   mov [A*4 + -10], A*4 + B
ee e0 e0 f8 9e 02 63 03 ca e1  # ee43 |   jne [0x29e], 0x363, ${fail}:rel + PC
62 2a 20                       # ee4d |   mov [A*4 + B], A
ee e0 e0 f8 63 03 aa 00 bd e1  # ee50 |   jne [0x363], 0xaa, ${fail}:rel + PC
62 3e 20 f6                    # ee5a |   mov [A*4 + -10], A
ee e0 e0 f8 9e 02 aa 00 af e1  # ee5e |   jne [0x29e], 0xaa, ${fail}:rel + PC
62 20 20                       # ee68 |   mov [A], A
ee e0 e0 f8 aa 00 aa 00 a2 e1  # ee6b |   jne [0xaa], 0xaa, ${fail}:rel + PC
62 2a e4 de fa                 # ee75 |   mov [A*4 + B], 0xfade + A
ee e0 e0 f8 63 03 88 fb 93 e1  # ee7a |   jne [0x363], 0xfb88, ${fail}:rel + PC
62 21 1c 85                    # ee84 |   mov [A*2], -123
ee e0 e0 f8 54 01 85 ff 85 e1  # ee88 |   jne [0x154], 0xff85, ${fail}:rel + PC
62 2a e0 39 30                 # ee92 |   mov [A*4 + B], 0x3039
ee e0 e0 f8 63 03 39 30 76 e1  # ee97 |   jne [0x363], 0x3039, ${fail}:rel + PC
62 3e 1c f6 85                 # eea1 |   mov [A*4 + -10], -123
ee e0 e0 f8 9e 02 85 ff 67 e1  # eea6 |   jne [0x29e], 0xff85, ${fail}:rel + PC
62 3e 21 f6                    # eeb0 |   mov [A*4 + -10], A*2
ee e0 e0 f8 9e 02 54 01 59 e1  # eeb4 |   jne [0x29e], 0x154, ${fail}:rel + PC
62 21 3e f6                    # eebe |   mov [A*2], A*4 + -10
ee e0 e0 f8 54 01 9e 02 4b e1  # eec2 |   jne [0x154], 0x29e, ${fail}:rel + PC
62 e0 21 39 30                 # eecc |   mov [0x3039], A*2
ee e0 e0 f8 39 30 54 01 3c e1  # eed1 |   jne [0x3039], 0x154, ${fail}:rel + PC
62 21 fe                       # eedb |   mov [A*2], G
ee e0 e0 f8 54 01 55 01 2f e1  # eede |   jne [0x154], 0x155, ${fail}:rel + PC
62 2a fe                       # eee8 |   mov [A*4 + B], G
ee e0 e0 f8 63 03 55 01 22 e1  # eeeb |   jne [0x363], 0x155, ${fail}:rel + PC
62 21 e4 de fa                 # eef5 |   mov [A*2], 0xfade + A
ee e0 e0 f8 54 01 88 fb 13 e1  # eefa |   jne [0x154], 0xfb88, ${fail}:rel + PC
62 20 3e f6                    # ef04 |   mov [A], A*4 + -10
ee e0 e0 f8 aa 00 9e 02 05 e1  # ef08 |   jne [0xaa], 0x29e, ${fail}:rel + PC
62 e0 3e 39 30 f6              # ef12 |   mov [0x3039], A*4 + -10
ee e0 e0 f8 39 30 9e 02 f5 e0  # ef18 |   jne [0x3039], 0x29e, ${fail}:rel + PC
62 2a 3e f6                    # ef22 |   mov [A*4 + B], A*4 + -10
ee e0 e0 f8 63 03 9e 02 e7 e0  # ef26 |   jne [0x363], 0x29e, ${fail}:rel + PC
62 e0 e4 39 30 de fa           # ef30 |   mov [0x3039], 0xfade + A
ee e0 e0 f8 39 30 88 fb d6 e0  # ef37 |   jne [0x3039], 0xfb88, ${fail}:rel + PC
62 21 e0 39 30                 # ef41 |   mov [A*2], 0x3039
ee e0 e0 f8 54 01 39 30 c7 e0  # ef46 |   jne [0x154], 0x3039, ${fail}:rel + PC
62 fe 1c 85                    # ef50 |   mov [G], -123
ee e0 e0 f8 55 01 85 ff b9 e0  # ef54 |   jne [0x155], 0xff85, ${fail}:rel + PC
62 e0 2a 39 30                 # ef5e |   mov [0x3039], A*4 + B
ee e0 e0 f8 39 30 63 03 aa e0  # ef63 |   jne [0x3039], 0x363, ${fail}:rel + PC
62 fe e4 de fa                 # ef6d |   mov [G], 0xfade + A
ee e0 e0 f8 55 01 88 fb 9b e0  # ef72 |   jne [0x155], 0xfb88, ${fail}:rel + PC
62 20 e0 39 30                 # ef7c |   mov [A], 0x3039
ee e0 e0 f8 aa 00 39 30 8c e0  # ef81 |   jne [0xaa], 0x3039, ${fail}:rel + PC
62 20 21                       # ef8b |   mov [A], A*2
ee e0 e0 f8 aa 00 54 01 7f e0  # ef8e |   jne [0xaa], 0x154, ${fail}:rel + PC
62 3e e0 f6 39 30              # ef98 |   mov [A*4 + -10], 0x3039
ee e0 e0 f8 9e 02 39 30 6f e0  # ef9e |   jne [0x29e], 0x3039, ${fail}:rel + PC
62 fe 20                       # efa8 |   mov [G], A
ee e0 e0 f8 55 01 aa 00 62 e0  # efab |   jne [0x155], 0xaa, ${fail}:rel + PC
62 21 20                       # efb5 |   mov [A*2], A
ee e0 e0 f8 54 01 aa 00 55 e0  # efb8 |   jne [0x154], 0xaa, ${fail}:rel + PC
62 fe fe                       # efc2 |   mov [G], G
ee e0 e0 f8 55 01 55 01 48 e0  # efc5 |   jne [0x155], 0x155, ${fail}:rel + PC
62 20 2a                       # efcf |   mov [A], A*4 + B
ee e0 e0 f8 aa 00 63 03 3b e0  # efd2 |   jne [0xaa], 0x363, ${fail}:rel + PC
62 2a 1c 85                    # efdc |   mov [A*4 + B], -123
ee e0 e0 f8 63 03 85 ff 2d e0  # efe0 |   jne [0x363], 0xff85, ${fail}:rel + PC
62 2a 21                       # efea |   mov [A*4 + B], A*2
ee e0 e0 f8 63 03 54 01 20 e0  # efed |   jne [0x363], 0x154, ${fail}:rel + PC
62 e0 20 39 30                 # eff7 |   mov [0x3039], A
ee e0 e0 f8 39 30 aa 00 11 e0  # effc |   jne [0x3039], 0xaa, ${fail}:rel + PC
62 fe e0 39 30                 # f006 |   mov [G], 0x3039
ee e0 e0 f8 55 01 39 30 02 e0  # f00b |   jne [0x155], 0x3039, ${fail}:rel + PC
62 21 21                       # f015 |   mov [A*2], A*2
ee e0 e0 f8 54 01 54 01 f5 df  # f018 |   jne [0x154], 0x154, ${fail}:rel + PC
62 fe 2a                       # f022 |   mov [G], A*4 + B
ee e0 e0 f8 55 01 63 03 e8 df  # f025 |   jne [0x155], 0x363, ${fail}:rel + PC
62 20 e4 de fa                 # f02f |   mov [A], 0xfade + A
ee e0 e0 f8 aa 00 88 fb d9 df  # f034 |   jne [0xaa], 0xfb88, ${fail}:rel + PC
e0 2a                          # f03e |   push A*4 + B
e4 80                          # f040 |   pop D
ec 80 e0 f8 63 03 cb df        # f042 |   jne D, 0x363, ${fail}:rel + PC
e0 1c 85                       # f04a |   push -123
e4 80                          # f04d |   pop D
ec 80 e0 f8 85 ff be df        # f04f |   jne D, 0xff85, ${fail}:rel + PC
e0 fe                          # f057 |   push G
e4 80                          # f059 |   pop D
ec 80 e0 f8 55 01 b2 df        # f05b |   jne D, 0x155, ${fail}:rel + PC
e0 3e f6                       # f063 |   push A*4 + -10
e4 80                          # f066 |   pop D
ec 80 e0 f8 9e 02 a5 df        # f068 |   jne D, 0x29e, ${fail}:rel + PC
e0 20                          # f070 |   push A
e4 80                          # f072 |   pop D
ec 80 e0 f8 aa 00 99 df        # f074 |   jne D, 0xaa, ${fail}:rel + PC
e0 e4 de fa                    # f07c |   push 0xfade + A
e4 80                          # f080 |   pop D
ec 80 e0 f8 88 fb 8b df        # f082 |   jne D, 0xfb88, ${fail}:rel + PC
e0 21                          # f08a |   push A*2
e4 80                          # f08c |   pop D
ec 80 e0 f8 54 01 7f df        # f08e |   jne D, 0x154, ${fail}:rel + PC
e0 e0 39 30                    # f096 |   push 0x3039
e4 80                          # f09a |   pop D
ec 80 e0 f8 39 30 71 df        # f09c |   jne D, 0x3039, ${fail}:rel + PC
5c f8 10 00                    # f0a4 |   call ${_L_test_uop_get_arg_1}:rel + PC
ec 60 e0 f8 fe ad 65 df        # f0a8 |   jne C, 0xadfe, ${fail}:rel + PC
58 f8 0e 00                    # f0b0 |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                               #      | _L_test_uop_get_arg_1:
60 60 e0 fe ad                 # f0b4 |   mov C, 0xadfe
dc                             # f0b9 |   ret
58 f8 53 df                    # f0ba |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_get_arg_2:
                               #      | test_uop_alu_2dd:
60 20 e0 cd ab                 # f0be |   mov A, 0xabcd
00 20 e0 ab cd                 # f0c3 |   add A, 0xcdab
ec 20 e0 f8 78 79 45 df        # f0c8 |   jne A, 0x7978, ${fail}:rel + PC
                               #      | test_uop_alu_2di:
60 20 e0 00 10                 # f0d0 |   mov A, 0x1000
62 e0 e0 00 10 bc 0a           # f0d5 |   mov [0x1000], 0xabc
01 20 20                       # f0dc |   add A, [A]
ec 20 e0 f8 bc 1a 2e df        # f0df |   jne A, 0x1abc, ${fail}:rel + PC
                               #      | test_uop_alu_2id:
62 e0 e0 00 10 34 12           # f0e7 |   mov [0x1000], 0x1234
02 e0 e0 00 10 21 43           # f0ee |   add [0x1000], 0x4321
61 20 e0 00 10                 # f0f5 |   mov A, [0x1000]
ec 20 e0 f8 55 55 13 df        # f0fa |   jne A, 0x5555, ${fail}:rel + PC
                               #      | test_uop_alu_2ii:
62 e0 e0 00 10 34 12           # f102 |   mov [0x1000], 0x1234
62 e0 e0 05 10 aa aa           # f109 |   mov [0x1005], 0xaaaa
03 e0 e0 05 10 00 10           # f110 |   add [0x1005], [0x1000]
ee e0 e0 f8 05 10 de bc f6 de  # f117 |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                               #      | test_uop_alu_3dd:
60 20 e0 fe ab                 # f121 |   mov A, 0xabfe
60 40 e0 55 55                 # f126 |   mov B, 0x5555
80 60 20 40                    # f12b |   add C, A, B
ec 20 e0 f8 fe ab de de        # f12f |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 d6 de        # f137 |   jne B, 0x5555, ${fail}:rel + PC
ec 60 e0 f8 53 01 ce de        # f13f |   jne C, 0x153, ${fail}:rel + PC
                               #      | test_uop_alu_3di:
62 e0 e0 00 10 aa 12           # f147 |   mov [0x1000], 0x12aa
60 40 e0 de fa                 # f14e |   mov B, 0xfade
b5 20 e0 40 00 10              # f153 |   xor A, [0x1000], B
ee e0 e0 f8 00 10 aa 12 b4 de  # f159 |   jne [0x1000], 0x12aa, ${fail}:rel + PC
ec 40 e0 f8 de fa aa de        # f163 |   jne B, 0xfade, ${fail}:rel + PC
ec 20 e0 f8 74 e8 a2 de        # f16b |   jne A, 0xe874, ${fail}:rel + PC
                               #      | test_uop_alu_3id:
60 20 e0 fe ab                 # f173 |   mov A, 0xabfe
60 40 e0 55 55                 # f178 |   mov B, 0x5555
86 e0 20 40 00 10              # f17d |   sub [0x1000], A, B
ec 20 e0 f8 fe ab 8a de        # f183 |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 82 de        # f18b |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 00 10 a9 56 7a de  # f193 |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                               #      | test_uop_alu_3ii:
62 e0 e0 00 10 fe ab           # f19d |   mov [0x1000], 0xabfe
60 40 e0 55 55                 # f1a4 |   mov B, 0x5555
af e0 e0 40 02 10 00 10        # f1a9 |   and [0x1002], [0x1000], B
ee e0 e0 f8 00 10 fe ab 5c de  # f1b1 |   jne [0x1000], 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 52 de        # f1bb |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 02 10 54 01 4a de  # f1c3 |   jne [0x1002], 0x154, ${fail}:rel + PC
                               #      | test_uop_alu_single_1dx:
60 20 e0 00 ff                 # f1cd |   mov A, 0xff00
3c 20                          # f1d2 |   not A
ec 20 e0 f8 ff 00 39 de        # f1d4 |   jne A, 0xff, ${fail}:rel + PC
                               #      | test_uop_alu_single_1ix:
62 1c e0 64 34 12              # f1dc |   mov [0x64], 0x1234
3a 1c 64                       # f1e2 |   neg [0x64]
ee 1c e0 f8 64 cc ed 28 de     # f1e5 |   jne [0x64], 0xedcc, ${fail}:rel + PC
                               #      | test_uop_alu_single_2dd:
60 40 e0 ff 00                 # f1ee |   mov B, 0xff
bc 20 40                       # f1f3 |   not A, B
ec 40 e0 f8 ff 00 17 de        # f1f6 |   jne B, 0xff, ${fail}:rel + PC
ec 20 e0 f8 00 ff 0f de        # f1fe |   jne A, 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2di:
62 1c e0 64 34 12              # f206 |   mov [0x64], 0x1234
bd 20 1c 64                    # f20c |   not A, [0x64]
ee 1c e0 f8 64 34 12 fd dd     # f210 |   jne [0x64], 0x1234, ${fail}:rel + PC
ec 20 e0 f8 cb ed f4 dd        # f219 |   jne A, 0xedcb, ${fail}:rel + PC
                               #      | test_uop_alu_single_2id:
60 40 e0 ff 00                 # f221 |   mov B, 0xff
be 1c 40 64                    # f226 |   not [0x64], B
ec 40 e0 f8 ff 00 e3 dd        # f22a |   jne B, 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff db dd     # f232 |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2ii:
62 1c e0 66 ff 00              # f23b |   mov [0x66], 0xff
bf 1c 1c 64 66                 # f241 |   not [0x64], [0x66]
ee 1c e0 f8 66 ff 00 c7 dd     # f246 |   jne [0x66], 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff be dd     # f24f |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_cmp_dd:
60 40 1c 7b                    # f258 |   mov B, 0x7b
50 40 e0 c8 01                 # f25c |   cmp B, 0x1c8
4c 20                          # f261 |   getf A
ec 40 1c f8 7b aa dd           # f263 |   jne B, 0x7b, ${fail}:rel + PC
ec 20 1c f8 0e a3 dd           # f26a |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_di:
62 1c 1c 64 85                 # f271 |   mov [0x64], -123
60 40 e0 c8 01                 # f276 |   mov B, 0x1c8
d1 40 1c 64                    # f27b |   icmp B, [0x64]
4c 20                          # f27f |   getf A
ec 40 e0 f8 c8 01 8c dd        # f281 |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 32 84 dd           # f289 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_cmp_id:
62 1c 1c 64 85                 # f290 |   mov [0x64], -123
60 40 e0 c8 01                 # f295 |   mov B, 0x1c8
d2 1c 40 64                    # f29a |   icmp [0x64], B
4c 20                          # f29e |   getf A
ec 40 e0 f8 c8 01 6d dd        # f2a0 |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 0e 65 dd           # f2a8 |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_ii:
62 1c 1c 64 85                 # f2af |   mov [0x64], -123
62 1c e0 66 38 fe              # f2b4 |   mov [0x66], 0xfe38
d3 1c 1c 64 66                 # f2ba |   icmp [0x64], [0x66]
4c 20                          # f2bf |   getf A
ee 1c 1c f8 64 85 4c dd        # f2c1 |   jne [0x64], -123, ${fail}:rel + PC
ee 1c e0 f8 66 38 fe 44 dd     # f2c9 |   jne [0x66], 0xfe38, ${fail}:rel + PC
ec 20 1c f8 32 3b dd           # f2d2 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_jmp_d:
60 20 e0 e4 f2                 # f2d9 |   mov A, ${_L_test_uop_jmp_d_okay}
58 20                          # f2de |   jmp A
58 f8 2d dd                    # f2e0 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_d_okay:
                               #      | test_uop_jmp_i:
62 1c e0 64 f1 f2              # f2e4 |   mov [0x64], ${_L_test_uop_jmp_i_okay}
5a 1c 64                       # f2ea |   jmp [0x64]
58 f8 20 dd                    # f2ed |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_i_okay:
ee 1c e0 f8 64 f1 f2 1c dd     # f2f1 |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_i:
62 1c e0 64 10 f3              # f2fa |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
50 1c 1c 01 02                 # f300 |   cmp 0x1, 0x2
68 f8 08 dd                    # f305 |   jeq ${fail}:rel + PC
6e 1c 64                       # f309 |   jne [0x64]
58 f8 01 dd                    # f30c |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_i_okay:
ee 1c e0 f8 64 10 f3 fd dc     # f310 |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_d:
60 20 e0 2d f3                 # f319 |   mov A, ${_L_test_uop_jmp_cond_d_okay}
50 1c 1c 01 01                 # f31e |   cmp 0x1, 0x1
6c f8 ea dc                    # f323 |   jne ${fail}:rel + PC
68 20                          # f327 |   jeq A
58 f8 e4 dc                    # f329 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_d_okay:
ec 20 e0 f8 2d f3 e0 dc        # f32d |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_3dd:
60 20 1c 7b                    # f335 |   mov A, 0x7b
ec 20 1c f8 7b d4 dc           # f339 |   jne A, 0x7b, ${fail}:rel + PC
e8 20 1c f8 7b 0b 00           # f340 |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
58 f8 c6 dc                    # f347 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3dd_okay:
ec 20 1c f8 7b c2 dc           # f34b |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_jmp_3di:
60 20 1c 7b                    # f352 |   mov A, 0x7b
62 1c e0 64 41 01              # f356 |   mov [0x64], 0x141
e9 20 1c f8 64 b1 dc           # f35c |   jeq A, [0x64], ${fail}:rel + PC
ed 20 1c f8 64 0b 00           # f363 |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
58 f8 a3 dc                    # f36a |   jmp ${fail}:rel + PC
                               #      | test_uop_jmp_3di_okay:
ec 20 1c f8 7b 9f dc           # f36e |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 98 dc     # f375 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3id:
60 20 1c 7b                    # f37e |   mov A, 0x7b
62 1c e0 64 41 01              # f382 |   mov [0x64], 0x141
ea 1c 20 f8 64 85 dc           # f388 |   jeq [0x64], A, ${fail}:rel + PC
ee 1c 20 f8 64 0b 00           # f38f |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
58 f8 77 dc                    # f396 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3id_okay:
ec 20 1c f8 7b 73 dc           # f39a |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 6c dc     # f3a1 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3ii:
62 e0 1c c8 00 7b              # f3aa |   mov [0xc8], 0x7b
62 1c e0 64 41 01              # f3b0 |   mov [0x64], 0x141
eb 1c e0 f8 64 c8 00 57 dc     # f3b6 |   jeq [0x64], [0xc8], ${fail}:rel + PC
ef 1c e0 f8 64 c8 00 0d 00     # f3bf |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
58 f8 45 dc                    # f3c8 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3ii_okay:
ee e0 1c f8 c8 00 7b 41 dc     # f3cc |   jne [0xc8], 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 38 dc     # f3d5 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_mov_dd:
60 20 1c 7b                    # f3de |   mov A, 0x7b
ec 20 1c f8 7b 2b dc           # f3e2 |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_mov_di:
62 1c e0 64 da ff              # f3e9 |   mov [0x64], 0xffda
61 20 1c 64                    # f3ef |   mov A, [0x64]
ec 20 e0 f8 da ff 1a dc        # f3f3 |   jne A, 0xffda, ${fail}:rel + PC
                               #      | test_uop_mov_id:
62 1c e0 64 ff ff              # f3fb |   mov [0x64], 0xffff
ee 1c e0 f8 64 ff ff 0c dc     # f401 |   jne [0x64], 0xffff, ${fail}:rel + PC
                               #      | test_uop_mov_ii:
60 20 1c 14                    # f40a |   mov A, 0x14
62 1c e0 78 fa fd              # f40e |   mov [0x78], 0xfdfa
63 1c 3c 64 64                 # f414 |   mov [0x64], [A + 0x64]
ee 1c e0 f8 64 fa fd f4 db     # f419 |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                               #      | test_uop_bmov_dd:
64 20 e0 de af                 # f422 |   bmov A, 0xafde
ec 20 e0 f8 de 00 e6 db        # f427 |   jne A, 0xde, ${fail}:rel + PC
64 20 e0 fa 00                 # f42f |   bmov A, 0xfa
ec 20 e0 f8 fa 00 d9 db        # f434 |   jne A, 0xfa, ${fail}:rel + PC
                               #      | test_uop_bmov_di:
62 1c e0 64 da ff              # f43c |   mov [0x64], 0xffda
65 20 1c 64                    # f442 |   bmov A, [0x64]
ec 20 e0 f8 da 00 c7 db        # f446 |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_bmov_id:
62 1c e0 64 cd ab              # f44e |   mov [0x64], 0xabcd
62 1c e0 66 34 12              # f454 |   mov [0x66], 0x1234
62 1c e0 68 78 56              # f45a |   mov [0x68], 0x5678
66 1c e0 66 df 00              # f460 |   bmov [0x66], 0xdf
ee 1c e0 f8 64 cd ab a7 db     # f466 |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df 12 9e db     # f46f |   jne [0x66], 0x12df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 95 db     # f478 |   jne [0x68], 0x5678, ${fail}:rel + PC
66 1c e0 67 b8 00              # f481 |   bmov [0x67], 0xb8
ee 1c e0 f8 64 cd ab 86 db     # f487 |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df b8 7d db     # f490 |   jne [0x66], 0xb8df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 74 db     # f499 |   jne [0x68], 0x5678, ${fail}:rel + PC
                               #      | test_uop_bmov_ii:
62 e0 e0 2c 01 df 00           # f4a2 |   mov [0x12c], 0xdf
62 e0 e0 2e 01 b8 00           # f4a9 |   mov [0x12e], 0xb8
62 e0 e0 c8 00 cd ab           # f4b0 |   mov [0xc8], 0xabcd
62 e0 e0 ca 00 34 12           # f4b7 |   mov [0xca], 0x1234
62 e0 e0 cc 00 78 56           # f4be |   mov [0xcc], 0x5678
67 e0 e0 ca 00 2c 01           # f4c5 |   bmov [0xca], [0x12c]
ee e0 e0 f8 c8 00 cd ab 41 db  # f4cc |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df 12 37 db  # f4d6 |   jne [0xca], 0x12df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 2d db  # f4e0 |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 23 db  # f4ea |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 19 db  # f4f4 |   jne [0x12e], 0xb8, ${fail}:rel + PC
67 e0 e0 cb 00 2e 01           # f4fe |   bmov [0xcb], [0x12e]
ee e0 e0 f8 c8 00 cd ab 08 db  # f505 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df b8 fe da  # f50f |   jne [0xca], 0xb8df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 f4 da  # f519 |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 ea da  # f523 |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 e0 da  # f52d |   jne [0x12e], 0xb8, ${fail}:rel + PC
                               #      | test_uop_halt:
                               #      | test_uop_getf:
50 1c 1c 7b 2d                 # f537 |   cmp 0x7b, 0x2d
4c 20                          # f53c |   getf A
ec 20 1c f8 32 cf da           # f53e |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_setf:
cc e0 ff ff                    # f545 |   setf 0xffff
4c 20                          # f549 |   getf A
ec 20 1c f8 3f c2 da           # f54b |   jne A, 0x3f, ${fail}:rel + PC
                               #      | test_uop_call_d:
60 a0 e0 00 10                 # f552 |   mov SP, 0x1000
60 40 e0 72 f5                 # f557 |   mov B, ${_L_test_uop_call_d_fn}
5c 40                          # f55c |   call B
ec 40 e0 f8 72 f5 af da        # f55e |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
ec 20 e0 f8 fa 34 a7 da        # f566 |   jne A, 0x34fa, ${fail}:rel + PC
58 f8 0a 00                    # f56e |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                               #      | _L_test_uop_call_d_fn:
60 20 e0 fa 34                 # f572 |   mov A, 0x34fa
dc                             # f577 |   ret
                               #      | _L_test_uop_call_d_okay:
                               #      | test_uop_call_i:
60 a0 e0 00 10                 # f578 |   mov SP, 0x1000
60 40 1c 64                    # f57d |   mov B, 0x64
62 40 e0 9c f5                 # f581 |   mov [B], ${_L_test_uop_call_i_fn}
5e 40                          # f586 |   call [B]
ee 40 e0 f8 9c f5 85 da        # f588 |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
ec 20 e0 f8 d4 aa 7d da        # f590 |   jne A, 0xaad4, ${fail}:rel + PC
58 f8 0a 00                    # f598 |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                               #      | _L_test_uop_call_i_fn:
60 20 e0 d4 aa                 # f59c |   mov A, 0xaad4
dc                             # f5a1 |   ret
                               #      | _L_test_uop_call_i_okay:
                               #      | test_uop_ret:
                               #      | test_uop_push_d:
60 a0 e0 00 10                 # f5a2 |   mov SP, 0x1000
60 40 1c 64                    # f5a7 |   mov B, 0x64
e0 40                          # f5ab |   push B
ec a0 e0 f8 fe 0f 60 da        # f5ad |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 1c f8 fe 0f 64 58 da     # f5b5 |   jne [0xffe], 0x64, ${fail}:rel + PC
e4 60                          # f5be |   pop C
ec 60 1c f8 64 4d da           # f5c0 |   jne C, 0x64, ${fail}:rel + PC
                               #      | test_uop_push_i:
60 a0 e0 00 10                 # f5c7 |   mov SP, 0x1000
60 40 1c 64                    # f5cc |   mov B, 0x64
62 40 e0 90 01                 # f5d0 |   mov [B], 0x190
e2 40                          # f5d5 |   push [B]
ec a0 e0 f8 fe 0f 36 da        # f5d7 |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 90 01 2e da  # f5df |   jne [0xffe], 0x190, ${fail}:rel + PC
e4 60                          # f5e9 |   pop C
ec 60 e0 f8 90 01 22 da        # f5eb |   jne C, 0x190, ${fail}:rel + PC
                               #      | test_uop_pop_d:
60 a0 e0 00 10                 # f5f3 |   mov SP, 0x1000
e0 e0 da fa                    # f5f8 |   push 0xfada
e4 20                          # f5fc |   pop A
ec 20 e0 f8 da fa 0f da        # f5fe |   jne A, 0xfada, ${fail}:rel + PC
                               #      | test_uop_pop_i:
60 a0 e0 00 10                 # f606 |   mov SP, 0x1000
e0 e0 da f2                    # f60b |   push 0xf2da
e6 1c 64                       # f60f |   pop [0x64]
ee 1c e0 f8 64 da f2 fb d9     # f612 |   jne [0x64], 0xf2da, ${fail}:rel + PC
                               #      | test_uop_mmap:
62 e0 e0 00 30 00 ff           # f61b |   mov [0x3000], 0xff00
62 e0 e0 00 31 01 ff           # f622 |   mov [0x3100], 0xff01
62 e0 e0 00 32 02 ff           # f629 |   mov [0x3200], 0xff02
62 e0 e0 00 40 00 dd           # f630 |   mov [0x4000], 0xdd00
62 e0 e0 00 41 01 dd           # f637 |   mov [0x4100], 0xdd01
62 e0 e0 00 42 02 dd           # f63e |   mov [0x4200], 0xdd02
62 e0 e0 00 50 00 ee           # f645 |   mov [0x5000], 0xee00
62 e0 e0 00 51 01 ee           # f64c |   mov [0x5100], 0xee01
62 e0 e0 00 52 02 ee           # f653 |   mov [0x5200], 0xee02
60 20 00                       # f65a |   mov A, 0
60 40 e0 00 41                 # f65d |   mov B, 0x4100
54 e0 e0 1c 00 31 ff 32 01     # f662 |   mmap 0x3100, 0x32ff, 0x1
ee e0 e0 f8 00 31 01 dd a2 d9  # f66b |   jne [0x3100], 0xdd01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 dd 98 d9  # f675 |   jne [0x3200], 0xdd02, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff 8e d9  # f67f |   jne [0x3000], 0xff00, ${fail}:rel + PC
60 40 e0 00 51                 # f689 |   mov B, 0x5100
54 e0 e0 1c 00 32 ff 32 02     # f68e |   mmap 0x3200, 0x32ff, 0x2
ee e0 e0 f8 00 32 01 ee 76 d9  # f697 |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff 6c d9  # f6a1 |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 dd 62 d9  # f6ab |   jne [0x3100], 0xdd01, ${fail}:rel + PC
d4 1c 01                       # f6b5 |   umap 0x1
ee e0 e0 f8 00 31 01 ff 55 d9  # f6b8 |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 01 ee 4b d9  # f6c2 |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff 41 d9  # f6cc |   jne [0x3000], 0xff00, ${fail}:rel + PC
d4 1c 02                       # f6d6 |   umap 0x2
ee e0 e0 f8 00 30 00 ff 34 d9  # f6d9 |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 ff 2a d9  # f6e3 |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 ff 20 d9  # f6ed |   jne [0x3200], 0xff02, ${fail}:rel + PC
                               #      | test_uop_umap:
                               #      | test_aux_reg:
60 20 1c 01                    # f6f7 |   mov A, 0x1
60 40 1c 02                    # f6fb |   mov B, 0x2
60 60 1c 03                    # f6ff |   mov C, 0x3
60 80 1c 04                    # f703 |   mov D, 0x4
60 fc 1c 05                    # f707 |   mov E, 0x5
60 fd 1c 06                    # f70b |   mov F, 0x6
60 fe 1c 07                    # f70f |   mov G, 0x7
60 ff 1c 08                    # f713 |   mov H, 0x8
ec 20 1c f8 01 f6 d8           # f717 |   jne A, 0x1, ${fail}:rel + PC
ec 40 1c f8 02 ef d8           # f71e |   jne B, 0x2, ${fail}:rel + PC
ec 60 1c f8 03 e8 d8           # f725 |   jne C, 0x3, ${fail}:rel + PC
ec 80 1c f8 04 e1 d8           # f72c |   jne D, 0x4, ${fail}:rel + PC
ec fc 1c f8 05 da d8           # f733 |   jne E, 0x5, ${fail}:rel + PC
ec fd 1c f8 06 d3 d8           # f73a |   jne F, 0x6, ${fail}:rel + PC
ec fe 1c f8 07 cc d8           # f741 |   jne G, 0x7, ${fail}:rel + PC
ec ff 1c f8 08 c5 d8           # f748 |   jne H, 0x8, ${fail}:rel + PC
34 ff e0 00 ff                 # f74f |   xor H, 0xff00
ec ff e0 f8 08 ff b9 d8        # f754 |   jne H, 0xff08, ${fail}:rel + PC
60 20 ff                       # f75c |   mov A, H
ec 20 e0 f8 08 ff ae d8        # f75f |   jne A, 0xff08, ${fail}:rel + PC
60 fc fe                       # f767 |   mov E, G
ec fc 1c f8 07 a3 d8           # f76a |   jne E, 0x7, ${fail}:rel + PC
ec ff e0 f8 08 ff 9c d8        # f771 |   jne H, 0xff08, ${fail}:rel + PC
                               #      | test_call_ret:
60 a0 e0 00 10                 # f779 |   mov SP, 0x1000
5c f8 77 00                    # f77e |   call ${fn_test_target}:rel + PC
ec a0 e0 f8 00 10 8b d8        # f782 |   jne SP, 0x1000, ${fail}:rel + PC
60 20 1c 0a                    # f78a |   mov A, 0xa
60 40 00                       # f78e |   mov B, 0
60 60 00                       # f791 |   mov C, 0
60 80 00                       # f794 |   mov D, 0
5c f8 2d 00                    # f797 |   call ${fn_recursive}:rel + PC
ec 20 00 f8 72 d8              # f79b |   jne A, 0, ${fail}:rel + PC
ec 40 e0 f8 3f cf 6c d8        # f7a1 |   jne B, 0xcf3f, ${fail}:rel + PC
ec 60 1c f8 2d 64 d8           # f7a9 |   jne C, 0x2d, ${fail}:rel + PC
ec 80 e0 f8 97 45 5d d8        # f7b0 |   jne D, 0x4597, ${fail}:rel + PC
ec a0 e0 f8 00 10 55 d8        # f7b8 |   jne SP, 0x1000, ${fail}:rel + PC
58 f8 42 00                    # f7c0 |   jmp ${test_call_ret_end}:rel + PC
                               #      | fn_recursive:
04 20 1c 01                    # f7c4 |   sub A, 0x1
5c f8 25 00                    # f7c8 |   call ${fn_process_c}:rel + PC
e8 20 00 f8 1c 00              # f7cc |   jeq A, 0, ${fn_recursive_end}:rel + PC
5c f8 f2 ff                    # f7d2 |   call ${fn_recursive}:rel + PC
00 80 60                       # f7d6 |   add D, C
08 80 1c 03                    # f7d9 |   mul D, 0x3
00 40 80                       # f7dd |   add B, D
e0 80                          # f7e0 |   push D
08 40 1c 05                    # f7e2 |   mul B, 0x5
e4 80                          # f7e6 |   pop D
                               #      | fn_recursive_end:
dc                             # f7e8 |   ret
58 f8 24 d8                    # f7e9 |   jmp ${fail}:rel + PC
                               #      | fn_process_c:
00 60 20                       # f7ed |   add C, A
dc                             # f7f0 |   ret
58 f8 1c d8                    # f7f1 |   jmp ${fail}:rel + PC
                               #      | fn_test_target:
ec a0 e0 f8 fe 0f 18 d8        # f7f5 |   jne SP, 0xffe, ${fail}:rel + PC
dc                             # f7fd |   ret
58 f8 0f d8                    # f7fe |   jmp ${fail}:rel + PC
                               #      | test_call_ret_end:
                               #      | test_mem_access:
62 e0 e0 00 01 ed ff           # f802 |   mov [0x100], 0xffed
ee e0 e0 f8 00 01 aa 00 0e 00  # f809 |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
58 f8 fa d7                    # f813 |   jmp ${fail}:rel + PC
                               #      | test_mem_access_check_jmp:
62 e0 00 00 10                 # f817 |   mov [0x1000], 0
60 a0 e0 00 10                 # f81c |   mov SP, 0x1000
ee a0 00 f8 ec d7              # f821 |   jne [SP], 0, ${fail}:rel + PC
e0 00                          # f827 |   push 0
e0 00                          # f829 |   push 0
e0 00                          # f82b |   push 0
e4 20                          # f82d |   pop A
e4 20                          # f82f |   pop A
e4 20                          # f831 |   pop A
ec a0 e0 f8 00 10 da d7        # f833 |   jne SP, 0x1000, ${fail}:rel + PC
ec 20 00 f8 d2 d7              # f83b |   jne A, 0, ${fail}:rel + PC
e0 e0 02 01                    # f841 |   push 0x102
ec a0 e0 f8 fe 0f c8 d7        # f845 |   jne SP, 0xffe, ${fail}:rel + PC
e0 e0 04 03                    # f84d |   push 0x304
ec a0 e0 f8 fc 0f bc d7        # f851 |   jne SP, 0xffc, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 02 01 b4 d7  # f859 |   jne [0xffe], 0x102, ${fail}:rel + PC
ee e0 e0 f8 fc 0f 04 03 aa d7  # f863 |   jne [0xffc], 0x304, ${fail}:rel + PC
ee e0 e0 f8 fb 0f 00 04 a0 d7  # f86d |   jne [0xffb], 0x400, ${fail}:rel + PC
ee e0 e0 f8 fd 0f 03 02 96 d7  # f877 |   jne [0xffd], 0x203, ${fail}:rel + PC
ee e0 1c f8 ff 0f 01 8c d7     # f881 |   jne [0xfff], 0x1, ${fail}:rel + PC
e4 20                          # f88a |   pop A
ec 20 e0 f8 04 03 81 d7        # f88c |   jne A, 0x304, ${fail}:rel + PC
ec a0 e0 f8 fe 0f 79 d7        # f894 |   jne SP, 0xffe, ${fail}:rel + PC
e4 20                          # f89c |   pop A
ec 20 e0 f8 02 01 6f d7        # f89e |   jne A, 0x102, ${fail}:rel + PC
ec a0 e0 f8 00 10 67 d7        # f8a6 |   jne SP, 0x1000, ${fail}:rel + PC
                               #      | test_cmp:
cc e0 ff ff                    # f8ae |   setf 0xffff
4c 20                          # f8b2 |   getf A
ec 20 1c f8 3f 59 d7           # f8b4 |   jne A, 0x3f, ${fail}:rel + PC
cc e0 ab ab                    # f8bb |   setf 0xabab
4c 20                          # f8bf |   getf A
ec 20 1c f8 2b 4c d7           # f8c1 |   jne A, 0x2b, ${fail}:rel + PC
50 e0 1c ab ff 2b              # f8c8 |   cmp 0xffab, 0x2b
4c 20                          # f8ce |   getf A
ec 20 1c f8 32 3d d7           # f8d0 |   jne A, 0x32, ${fail}:rel + PC
50 1c e0 2b ab ff              # f8d7 |   cmp 0x2b, 0xffab
4c 20                          # f8dd |   getf A
ec 20 1c f8 0e 2e d7           # f8df |   jne A, 0xe, ${fail}:rel + PC
50 e0 e0 ab ff ab ff           # f8e6 |   cmp 0xffab, 0xffab
4c 20                          # f8ed |   getf A
ec 20 1c f8 29 1e d7           # f8ef |   jne A, 0x29, ${fail}:rel + PC
d0 e0 1c ab ff 2b              # f8f6 |   icmp 0xffab, 0x2b
4c 20                          # f8fc |   getf A
ec 20 1c f8 0e 0f d7           # f8fe |   jne A, 0xe, ${fail}:rel + PC
d0 1c e0 2b ab ff              # f905 |   icmp 0x2b, 0xffab
4c 20                          # f90b |   getf A
ec 20 1c f8 32 00 d7           # f90d |   jne A, 0x32, ${fail}:rel + PC
d0 e0 e0 ab ff ab ff           # f914 |   icmp 0xffab, 0xffab
4c 20                          # f91b |   getf A
ec 20 1c f8 29 f0 d6           # f91d |   jne A, 0x29, ${fail}:rel + PC
                               #      | end_of_test:
60 20 e0 ad de                 # f924 |   mov A, 0xdead
60 40 e0 ef be                 # f929 |   mov B, 0xbeef
88 60 20 40                    # f92e |   mul C, A, B
58 f8 e0 d6                    # f932 |   jmp ${success}:rel + PC
dc                             # f936 |   ret
                               #      | end_fn_self_test:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x0000
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
