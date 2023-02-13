                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_self_test:
                               #      | .boot:
60 20 1c fa                    # d000 |   mov A, 0xfa
ec 20 e0 f8 fa 00 50 00        # d004 |   jne A, 0xfa, ${start_test}:rel + PC
                               #      | fail:
d8                             # d00c |   halt
58 f8 ff ff                    # d00d |   jmp ${fail}:rel + PC
                               #      | success:
ec 20 e0 f8 ad de fb ff        # d011 |   jne A, 0xdead, ${fail}:rel + PC
ec 40 e0 f8 ef be f3 ff        # d019 |   jne B, 0xbeef, ${fail}:rel + PC
ec 60 e0 f8 83 49 eb ff        # d021 |   jne C, 0x4983, ${fail}:rel + PC
ec ff e0 f8 14 a6 e3 ff        # d029 |   jne H, 0xa614, ${fail}:rel + PC
60 80 ff                       # d031 |   mov D, H
00 20 e0 ab ac                 # d034 |   add A, 0xacab
00 40 e0 cc 41                 # d039 |   add B, 0x41cc
08 20 80                       # d03e |   mul A, D
34 20 e0 4a f2                 # d041 |   xor A, 0xf24a
34 60 e0 4f 49                 # d046 |   xor C, 0x494f
34 ff e0 30 5a                 # d04b |   xor H, 0x5a30
60 80 ff                       # d050 |   mov D, H
d8                             # d053 |   halt
                               #      | start_test:
                               #      | alu_test:
80 40 e0 e0 30 d2 12 a0        # d054 |   add B, 0xd230, 0xa012
ec 40 e0 f8 42 72 b0 ff        # d05c |   jne B, 0x7242, ${fail}:rel + PC
84 40 e0 e0 30 d2 12 a0        # d064 |   sub B, 0xd230, 0xa012
ec 40 e0 f8 1e 32 a0 ff        # d06c |   jne B, 0x321e, ${fail}:rel + PC
88 40 e0 e0 30 d2 12 a0        # d074 |   mul B, 0xd230, 0xa012
ec 40 e0 f8 60 c7 90 ff        # d07c |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 6c 83 88 ff        # d084 |   jne H, 0x836c, ${fail}:rel + PC
8c 40 e0 e0 30 d2 12 a0        # d08c |   imul B, 0xd230, 0xa012
ec 40 e0 f8 60 c7 78 ff        # d094 |   jne B, 0xc760, ${fail}:rel + PC
ec ff e0 f8 2a 11 70 ff        # d09c |   jne H, 0x112a, ${fail}:rel + PC
a0 40 e0 e0 30 d2 12 a0        # d0a4 |   shr B, 0xd230, 0xa012
ec 40 e0 f8 8c 34 60 ff        # d0ac |   jne B, 0x348c, ${fail}:rel + PC
a4 40 e0 e0 30 d2 12 a0        # d0b4 |   ishr B, 0xd230, 0xa012
ec 40 e0 f8 8c f4 50 ff        # d0bc |   jne B, 0xf48c, ${fail}:rel + PC
a8 40 e0 e0 30 d2 12 a0        # d0c4 |   shl B, 0xd230, 0xa012
ec 40 e0 f8 c0 48 40 ff        # d0cc |   jne B, 0x48c0, ${fail}:rel + PC
ac 40 e0 e0 30 d2 12 a0        # d0d4 |   and B, 0xd230, 0xa012
ec 40 e0 f8 10 80 30 ff        # d0dc |   jne B, 0x8010, ${fail}:rel + PC
b0 40 e0 e0 30 d2 12 a0        # d0e4 |   or B, 0xd230, 0xa012
ec 40 e0 f8 32 f2 20 ff        # d0ec |   jne B, 0xf232, ${fail}:rel + PC
b4 40 e0 e0 30 d2 12 a0        # d0f4 |   xor B, 0xd230, 0xa012
ec 40 e0 f8 22 72 10 ff        # d0fc |   jne B, 0x7222, ${fail}:rel + PC
b8 40 e0 30 d2                 # d104 |   neg B, 0xd230
ec 40 e0 f8 d0 2d 03 ff        # d109 |   jne B, 0x2dd0, ${fail}:rel + PC
bc 40 e0 30 d2                 # d111 |   not B, 0xd230
ec 40 e0 f8 cf 2d f6 fe        # d116 |   jne B, 0x2dcf, ${fail}:rel + PC
c0 40 e0 30 d2                 # d11e |   bool B, 0xd230
ec 40 1c f8 01 e9 fe           # d123 |   jne B, 0x1, ${fail}:rel + PC
c4 40 e0 30 d2                 # d12a |   inc B, 0xd230
ec 40 e0 f8 31 d2 dd fe        # d12f |   jne B, 0xd231, ${fail}:rel + PC
c8 40 e0 30 d2                 # d137 |   dec B, 0xd230
ec 40 e0 f8 2f d2 d0 fe        # d13c |   jne B, 0xd22f, ${fail}:rel + PC
80 40 e0 e0 ad 00 37 da        # d144 |   add B, 0xad, 0xda37
ec 40 e0 f8 e4 da c0 fe        # d14c |   jne B, 0xdae4, ${fail}:rel + PC
84 40 e0 e0 ad 00 37 da        # d154 |   sub B, 0xad, 0xda37
ec 40 e0 f8 76 26 b0 fe        # d15c |   jne B, 0x2676, ${fail}:rel + PC
88 40 e0 e0 ad 00 37 da        # d164 |   mul B, 0xad, 0xda37
ec 40 e0 f8 2b 77 a0 fe        # d16c |   jne B, 0x772b, ${fail}:rel + PC
ec ff e0 f8 93 00 98 fe        # d174 |   jne H, 0x93, ${fail}:rel + PC
8c 40 e0 e0 ad 00 37 da        # d17c |   imul B, 0xad, 0xda37
ec 40 e0 f8 2b 77 88 fe        # d184 |   jne B, 0x772b, ${fail}:rel + PC
ec ff 1c f8 e6 80 fe           # d18c |   jne H, 0xe6, ${fail}:rel + PC
a0 40 e0 e0 ad 00 37 da        # d193 |   shr B, 0xad, 0xda37
ec 40 1c f8 01 71 fe           # d19b |   jne B, 0x1, ${fail}:rel + PC
a4 40 e0 e0 ad 00 37 da        # d1a2 |   ishr B, 0xad, 0xda37
ec 40 1c f8 01 62 fe           # d1aa |   jne B, 0x1, ${fail}:rel + PC
a8 40 e0 e0 ad 00 37 da        # d1b1 |   shl B, 0xad, 0xda37
ec 40 e0 f8 80 56 53 fe        # d1b9 |   jne B, 0x5680, ${fail}:rel + PC
ac 40 e0 e0 ad 00 37 da        # d1c1 |   and B, 0xad, 0xda37
ec 40 1c f8 25 43 fe           # d1c9 |   jne B, 0x25, ${fail}:rel + PC
b0 40 e0 e0 ad 00 37 da        # d1d0 |   or B, 0xad, 0xda37
ec 40 e0 f8 bf da 34 fe        # d1d8 |   jne B, 0xdabf, ${fail}:rel + PC
b4 40 e0 e0 ad 00 37 da        # d1e0 |   xor B, 0xad, 0xda37
ec 40 e0 f8 9a da 24 fe        # d1e8 |   jne B, 0xda9a, ${fail}:rel + PC
b8 40 e0 ad 00                 # d1f0 |   neg B, 0xad
ec 40 e0 f8 53 ff 17 fe        # d1f5 |   jne B, 0xff53, ${fail}:rel + PC
bc 40 e0 ad 00                 # d1fd |   not B, 0xad
ec 40 e0 f8 52 ff 0a fe        # d202 |   jne B, 0xff52, ${fail}:rel + PC
c0 40 e0 ad 00                 # d20a |   bool B, 0xad
ec 40 1c f8 01 fd fd           # d20f |   jne B, 0x1, ${fail}:rel + PC
c4 40 e0 ad 00                 # d216 |   inc B, 0xad
ec 40 e0 f8 ae 00 f1 fd        # d21b |   jne B, 0xae, ${fail}:rel + PC
c8 40 e0 ad 00                 # d223 |   dec B, 0xad
ec 40 e0 f8 ac 00 e4 fd        # d228 |   jne B, 0xac, ${fail}:rel + PC
60 40 e0 ad f0                 # d230 |   mov B, 0xf0ad
00 40 e0 3f 2a                 # d235 |   add B, 0x2a3f
ec 40 e0 f8 ec 1a d2 fd        # d23a |   jne B, 0x1aec, ${fail}:rel + PC
60 40 e0 ad f0                 # d242 |   mov B, 0xf0ad
04 40 e0 3f 2a                 # d247 |   sub B, 0x2a3f
ec 40 e0 f8 6e c6 c0 fd        # d24c |   jne B, 0xc66e, ${fail}:rel + PC
60 40 e0 ad f0                 # d254 |   mov B, 0xf0ad
08 40 e0 3f 2a                 # d259 |   mul B, 0x2a3f
ec 40 e0 f8 93 9c ae fd        # d25e |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 b7 27 a6 fd        # d266 |   jne H, 0x27b7, ${fail}:rel + PC
60 40 e0 ad f0                 # d26e |   mov B, 0xf0ad
0c 40 e0 3f 2a                 # d273 |   imul B, 0x2a3f
ec 40 e0 f8 93 9c 94 fd        # d278 |   jne B, 0x9c93, ${fail}:rel + PC
ec ff e0 f8 78 fd 8c fd        # d280 |   jne H, 0xfd78, ${fail}:rel + PC
60 40 e0 ad f0                 # d288 |   mov B, 0xf0ad
20 40 e0 3f 2a                 # d28d |   shr B, 0x2a3f
ec 40 1c f8 01 7a fd           # d292 |   jne B, 0x1, ${fail}:rel + PC
60 40 e0 ad f0                 # d299 |   mov B, 0xf0ad
24 40 e0 3f 2a                 # d29e |   ishr B, 0x2a3f
ec 40 1c f8 ff 69 fd           # d2a3 |   jne B, 0xff, ${fail}:rel + PC
60 40 e0 ad f0                 # d2aa |   mov B, 0xf0ad
28 40 e0 3f 2a                 # d2af |   shl B, 0x2a3f
ec 40 e0 f8 00 80 58 fd        # d2b4 |   jne B, 0x8000, ${fail}:rel + PC
60 40 e0 ad f0                 # d2bc |   mov B, 0xf0ad
2c 40 e0 3f 2a                 # d2c1 |   and B, 0x2a3f
ec 40 e0 f8 2d 20 46 fd        # d2c6 |   jne B, 0x202d, ${fail}:rel + PC
60 40 e0 ad f0                 # d2ce |   mov B, 0xf0ad
30 40 e0 3f 2a                 # d2d3 |   or B, 0x2a3f
ec 40 e0 f8 bf fa 34 fd        # d2d8 |   jne B, 0xfabf, ${fail}:rel + PC
60 40 e0 ad f0                 # d2e0 |   mov B, 0xf0ad
34 40 e0 3f 2a                 # d2e5 |   xor B, 0x2a3f
ec 40 e0 f8 92 da 22 fd        # d2ea |   jne B, 0xda92, ${fail}:rel + PC
60 40 e0 ad f0                 # d2f2 |   mov B, 0xf0ad
38 40                          # d2f7 |   neg B
ec 40 e0 f8 53 0f 13 fd        # d2f9 |   jne B, 0xf53, ${fail}:rel + PC
60 40 e0 ad f0                 # d301 |   mov B, 0xf0ad
3c 40                          # d306 |   not B
ec 40 e0 f8 52 0f 04 fd        # d308 |   jne B, 0xf52, ${fail}:rel + PC
60 40 e0 ad f0                 # d310 |   mov B, 0xf0ad
40 40                          # d315 |   bool B
ec 40 1c f8 01 f5 fc           # d317 |   jne B, 0x1, ${fail}:rel + PC
60 40 e0 ad f0                 # d31e |   mov B, 0xf0ad
44 40                          # d323 |   inc B
ec 40 e0 f8 ae f0 e7 fc        # d325 |   jne B, 0xf0ae, ${fail}:rel + PC
60 40 e0 ad f0                 # d32d |   mov B, 0xf0ad
48 40                          # d332 |   dec B
ec 40 e0 f8 ac f0 d8 fc        # d334 |   jne B, 0xf0ac, ${fail}:rel + PC
60 40 00                       # d33c |   mov B, 0
00 40 e0 ad de                 # d33f |   add B, 0xdead
ec 40 e0 f8 ad de c8 fc        # d344 |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # d34c |   mov B, 0
04 40 e0 ad de                 # d34f |   sub B, 0xdead
ec 40 e0 f8 53 21 b8 fc        # d354 |   jne B, 0x2153, ${fail}:rel + PC
60 40 00                       # d35c |   mov B, 0
08 40 e0 ad de                 # d35f |   mul B, 0xdead
ec 40 00 f8 a8 fc              # d364 |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 a2 fc              # d36a |   jne H, 0, ${fail}:rel + PC
60 40 00                       # d370 |   mov B, 0
0c 40 e0 ad de                 # d373 |   imul B, 0xdead
ec 40 00 f8 94 fc              # d378 |   jne B, 0, ${fail}:rel + PC
ec ff 00 f8 8e fc              # d37e |   jne H, 0, ${fail}:rel + PC
60 40 00                       # d384 |   mov B, 0
20 40 e0 ad de                 # d387 |   shr B, 0xdead
ec 40 00 f8 80 fc              # d38c |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d392 |   mov B, 0
24 40 e0 ad de                 # d395 |   ishr B, 0xdead
ec 40 00 f8 72 fc              # d39a |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3a0 |   mov B, 0
28 40 e0 ad de                 # d3a3 |   shl B, 0xdead
ec 40 00 f8 64 fc              # d3a8 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3ae |   mov B, 0
2c 40 e0 ad de                 # d3b1 |   and B, 0xdead
ec 40 00 f8 56 fc              # d3b6 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3bc |   mov B, 0
30 40 e0 ad de                 # d3bf |   or B, 0xdead
ec 40 e0 f8 ad de 48 fc        # d3c4 |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # d3cc |   mov B, 0
34 40 e0 ad de                 # d3cf |   xor B, 0xdead
ec 40 e0 f8 ad de 38 fc        # d3d4 |   jne B, 0xdead, ${fail}:rel + PC
60 40 00                       # d3dc |   mov B, 0
38 40                          # d3df |   neg B
ec 40 00 f8 2b fc              # d3e1 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3e7 |   mov B, 0
3c 40                          # d3ea |   not B
ec 40 1c f8 ff 20 fc           # d3ec |   jne B, 0xff, ${fail}:rel + PC
60 40 00                       # d3f3 |   mov B, 0
40 40                          # d3f6 |   bool B
ec 40 00 f8 14 fc              # d3f8 |   jne B, 0, ${fail}:rel + PC
60 40 00                       # d3fe |   mov B, 0
44 40                          # d401 |   inc B
ec 40 1c f8 01 09 fc           # d403 |   jne B, 0x1, ${fail}:rel + PC
60 40 00                       # d40a |   mov B, 0
48 40                          # d40d |   dec B
ec 40 1c f8 ff fd fb           # d40f |   jne B, 0xff, ${fail}:rel + PC
                               #      | jmp_test:
e8 1c 1c f8 ab 2b f6 fb        # d416 |   jeq 0xab, 0x2b, ${fail}:rel + PC
ec 1c 1c f8 ab 2b 0c 00        # d41e |   jne 0xab, 0x2b, ${_L_test_jmp_1}:rel + PC
58 f8 e6 fb                    # d426 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_1:
f0 1c 1c f8 ab 2b e2 fb        # d42a |   jlt 0xab, 0x2b, ${fail}:rel + PC
f4 1c 1c f8 ab 2b da fb        # d432 |   jle 0xab, 0x2b, ${fail}:rel + PC
f8 1c 1c f8 ab 2b 0c 00        # d43a |   jgt 0xab, 0x2b, ${_L_test_jmp_2}:rel + PC
58 f8 ca fb                    # d442 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_2:
fc 1c 1c f8 ab 2b 0c 00        # d446 |   jge 0xab, 0x2b, ${_L_test_jmp_3}:rel + PC
58 f8 be fb                    # d44e |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_3:
50 1c 1c ab 2b                 # d452 |   cmp 0xab, 0x2b
68 f8 b5 fb                    # d457 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d45b |   jne ${_L_test_jmp_4}:rel + PC
58 f8 ad fb                    # d45f |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_4:
70 f8 a9 fb                    # d463 |   jlt ${fail}:rel + PC
74 f8 a5 fb                    # d467 |   jle ${fail}:rel + PC
78 f8 08 00                    # d46b |   jgt ${_L_test_jmp_5}:rel + PC
58 f8 9d fb                    # d46f |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_5:
7c f8 08 00                    # d473 |   jge ${_L_test_jmp_6}:rel + PC
58 f8 95 fb                    # d477 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_6:
d0 1c 1c ab 2b                 # d47b |   icmp 0xab, 0x2b
68 f8 8c fb                    # d480 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d484 |   jne ${_L_test_jmp_7}:rel + PC
58 f8 84 fb                    # d488 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_7:
70 f8 08 00                    # d48c |   jlt ${_L_test_jmp_8}:rel + PC
58 f8 7c fb                    # d490 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_8:
74 f8 08 00                    # d494 |   jle ${_L_test_jmp_9}:rel + PC
58 f8 74 fb                    # d498 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_9:
78 f8 70 fb                    # d49c |   jgt ${fail}:rel + PC
7c f8 6c fb                    # d4a0 |   jge ${fail}:rel + PC
e8 1c 1c f8 2b ab 68 fb        # d4a4 |   jeq 0x2b, 0xab, ${fail}:rel + PC
ec 1c 1c f8 2b ab 0c 00        # d4ac |   jne 0x2b, 0xab, ${_L_test_jmp_10}:rel + PC
58 f8 58 fb                    # d4b4 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_10:
f0 1c 1c f8 2b ab 0c 00        # d4b8 |   jlt 0x2b, 0xab, ${_L_test_jmp_11}:rel + PC
58 f8 4c fb                    # d4c0 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_11:
f4 1c 1c f8 2b ab 0c 00        # d4c4 |   jle 0x2b, 0xab, ${_L_test_jmp_12}:rel + PC
58 f8 40 fb                    # d4cc |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_12:
f8 1c 1c f8 2b ab 3c fb        # d4d0 |   jgt 0x2b, 0xab, ${fail}:rel + PC
fc 1c 1c f8 2b ab 34 fb        # d4d8 |   jge 0x2b, 0xab, ${fail}:rel + PC
50 1c 1c 2b ab                 # d4e0 |   cmp 0x2b, 0xab
68 f8 27 fb                    # d4e5 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d4e9 |   jne ${_L_test_jmp_13}:rel + PC
58 f8 1f fb                    # d4ed |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_13:
70 f8 08 00                    # d4f1 |   jlt ${_L_test_jmp_14}:rel + PC
58 f8 17 fb                    # d4f5 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_14:
74 f8 08 00                    # d4f9 |   jle ${_L_test_jmp_15}:rel + PC
58 f8 0f fb                    # d4fd |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_15:
78 f8 0b fb                    # d501 |   jgt ${fail}:rel + PC
7c f8 07 fb                    # d505 |   jge ${fail}:rel + PC
d0 1c 1c 2b ab                 # d509 |   icmp 0x2b, 0xab
68 f8 fe fa                    # d50e |   jeq ${fail}:rel + PC
6c f8 08 00                    # d512 |   jne ${_L_test_jmp_16}:rel + PC
58 f8 f6 fa                    # d516 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_16:
70 f8 f2 fa                    # d51a |   jlt ${fail}:rel + PC
74 f8 ee fa                    # d51e |   jle ${fail}:rel + PC
78 f8 08 00                    # d522 |   jgt ${_L_test_jmp_17}:rel + PC
58 f8 e6 fa                    # d526 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_17:
7c f8 08 00                    # d52a |   jge ${_L_test_jmp_18}:rel + PC
58 f8 de fa                    # d52e |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_18:
e8 1c 1c f8 ab ab 0c 00        # d532 |   jeq 0xab, 0xab, ${_L_test_jmp_19}:rel + PC
58 f8 d2 fa                    # d53a |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_19:
ec 1c 1c f8 ab ab ce fa        # d53e |   jne 0xab, 0xab, ${fail}:rel + PC
f0 1c 1c f8 ab ab c6 fa        # d546 |   jlt 0xab, 0xab, ${fail}:rel + PC
f4 1c 1c f8 ab ab 0c 00        # d54e |   jle 0xab, 0xab, ${_L_test_jmp_20}:rel + PC
58 f8 b6 fa                    # d556 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_20:
f8 1c 1c f8 ab ab b2 fa        # d55a |   jgt 0xab, 0xab, ${fail}:rel + PC
fc 1c 1c f8 ab ab 0c 00        # d562 |   jge 0xab, 0xab, ${_L_test_jmp_21}:rel + PC
58 f8 a2 fa                    # d56a |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_21:
50 1c 1c ab ab                 # d56e |   cmp 0xab, 0xab
68 f8 08 00                    # d573 |   jeq ${_L_test_jmp_22}:rel + PC
58 f8 95 fa                    # d577 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_22:
6c f8 91 fa                    # d57b |   jne ${fail}:rel + PC
70 f8 8d fa                    # d57f |   jlt ${fail}:rel + PC
74 f8 08 00                    # d583 |   jle ${_L_test_jmp_23}:rel + PC
58 f8 85 fa                    # d587 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_23:
78 f8 81 fa                    # d58b |   jgt ${fail}:rel + PC
7c f8 08 00                    # d58f |   jge ${_L_test_jmp_24}:rel + PC
58 f8 79 fa                    # d593 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_24:
d0 1c 1c ab ab                 # d597 |   icmp 0xab, 0xab
68 f8 08 00                    # d59c |   jeq ${_L_test_jmp_25}:rel + PC
58 f8 6c fa                    # d5a0 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_25:
6c f8 68 fa                    # d5a4 |   jne ${fail}:rel + PC
70 f8 64 fa                    # d5a8 |   jlt ${fail}:rel + PC
74 f8 08 00                    # d5ac |   jle ${_L_test_jmp_26}:rel + PC
58 f8 5c fa                    # d5b0 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_26:
78 f8 58 fa                    # d5b4 |   jgt ${fail}:rel + PC
7c f8 08 00                    # d5b8 |   jge ${_L_test_jmp_27}:rel + PC
58 f8 50 fa                    # d5bc |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_27:
                               #      | test_uop_get_arg:
60 a0 e0 00 70                 # d5c0 |   mov SP, 0x7000
60 20 e0 aa 00                 # d5c5 |   mov A, 0xaa
60 40 e0 bb 00                 # d5ca |   mov B, 0xbb
60 fe e0 55 01                 # d5cf |   mov G, 0x155
b6 e0 1c fe 39 30 85           # d5d4 |   xor [0x3039], -123, G
ee e0 e0 f8 39 30 d0 fe 31 fa  # d5db |   jne [0x3039], 0xfed0, ${fail}:rel + PC
ae 3e fe 21 f6                 # d5e5 |   and [A*4 + -10], G, A*2
ee e0 e0 f8 9e 02 54 01 22 fa  # d5ea |   jne [0x29e], 0x154, ${fail}:rel + PC
86 21 e4 3e de fa f6           # d5f4 |   sub [A*2], 0xfade + A, A*4 + -10
ee e0 e0 f8 54 01 ea f8 11 fa  # d5fb |   jne [0x154], 0xf8ea, ${fail}:rel + PC
a6 e0 20 21 39 30              # d605 |   ishr [0x3039], A, A*2
ee e0 1c f8 39 30 0a 01 fa     # d60b |   jne [0x3039], 0xa, ${fail}:rel + PC
aa fe 2a 3e f6                 # d614 |   shl [G], A*4 + B, A*4 + -10
ee e0 e0 f8 55 01 00 c0 f3 f9  # d619 |   jne [0x155], 0xc000, ${fail}:rel + PC
b2 fe 1c fe 85                 # d623 |   or [G], -123, G
ee e0 1c f8 55 01 d5 e4 f9     # d628 |   jne [0x155], 0xd5, ${fail}:rel + PC
8a 2a 1c 20 85                 # d631 |   mul [A*4 + B], -123, A
ee e0 e0 f8 63 03 52 ae d6 f9  # d636 |   jne [0x363], 0xae52, ${fail}:rel + PC
a6 e0 e0 2a 39 30 39 30        # d640 |   ishr [0x3039], 0x3039, A*4 + B
ee e0 e0 f8 39 30 07 06 c4 f9  # d648 |   jne [0x3039], 0x607, ${fail}:rel + PC
a2 21 e4 21 de fa              # d652 |   shr [A*2], 0xfade + A, A*2
ee e0 e0 f8 54 01 b8 0f b4 f9  # d658 |   jne [0x154], 0xfb8, ${fail}:rel + PC
82 21 fe fe                    # d662 |   add [A*2], G, G
ee e0 e0 f8 54 01 aa 02 a6 f9  # d666 |   jne [0x154], 0x2aa, ${fail}:rel + PC
a6 fe e4 20 de fa              # d670 |   ishr [G], 0xfade + A, A
ee e0 1c f8 55 01 fe 96 f9     # d676 |   jne [0x155], 0xfe, ${fail}:rel + PC
82 e0 e4 2a 39 30 de fa        # d67f |   add [0x3039], 0xfade + A, A*4 + B
ee e0 e0 f8 39 30 eb fe 85 f9  # d687 |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
a6 20 20 20                    # d691 |   ishr [A], A, A
ee e0 00 f8 aa 00 77 f9        # d695 |   jne [0xaa], 0, ${fail}:rel + PC
82 fe 2a 20                    # d69d |   add [G], A*4 + B, A
ee e0 e0 f8 55 01 0d 04 6b f9  # d6a1 |   jne [0x155], 0x40d, ${fail}:rel + PC
b6 fe fe fe                    # d6ab |   xor [G], G, G
ee e0 00 f8 55 01 5d f9        # d6af |   jne [0x155], 0, ${fail}:rel + PC
aa 21 fe 21                    # d6b7 |   shl [A*2], G, A*2
ee e0 e0 f8 54 01 50 15 51 f9  # d6bb |   jne [0x154], 0x1550, ${fail}:rel + PC
a6 fe e0 21 39 30              # d6c5 |   ishr [G], 0x3039, A*2
ee e0 e0 f8 55 01 03 03 41 f9  # d6cb |   jne [0x155], 0x303, ${fail}:rel + PC
ae 21 2a e4 de fa              # d6d5 |   and [A*2], A*4 + B, 0xfade + A
ee e0 e0 f8 54 01 00 03 31 f9  # d6db |   jne [0x154], 0x300, ${fail}:rel + PC
82 20 3e 3e f6 f6              # d6e5 |   add [A], A*4 + -10, A*4 + -10
ee e0 e0 f8 aa 00 3c 05 21 f9  # d6eb |   jne [0xaa], 0x53c, ${fail}:rel + PC
b2 e0 21 1c 39 30 85           # d6f5 |   or [0x3039], A*2, -123
ee e0 1c f8 39 30 d5 10 f9     # d6fc |   jne [0x3039], 0xd5, ${fail}:rel + PC
82 e0 fe fe 39 30              # d705 |   add [0x3039], G, G
ee e0 e0 f8 39 30 aa 02 01 f9  # d70b |   jne [0x3039], 0x2aa, ${fail}:rel + PC
ae fe e0 e4 39 30 de fa        # d715 |   and [G], 0x3039, 0xfade + A
ee e0 e0 f8 55 01 08 30 ef f8  # d71d |   jne [0x155], 0x3008, ${fail}:rel + PC
8e e0 2a 3e 39 30 f6           # d727 |   imul [0x3039], A*4 + B, A*4 + -10
ee e0 e0 f8 39 30 1a dd de f8  # d72e |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
b2 21 e0 20 39 30              # d738 |   or [A*2], 0x3039, A
ee e0 e0 f8 54 01 bb 30 ce f8  # d73e |   jne [0x154], 0x30bb, ${fail}:rel + PC
8e 21 3e 21 f6                 # d748 |   imul [A*2], A*4 + -10, A*2
ee e0 e0 f8 54 01 d8 79 bf f8  # d74d |   jne [0x154], 0x79d8, ${fail}:rel + PC
82 3e 1c 2a f6 85              # d757 |   add [A*4 + -10], -123, A*4 + B
ee e0 e0 f8 9e 02 e8 02 af f8  # d75d |   jne [0x29e], 0x2e8, ${fail}:rel + PC
86 fe e4 21 de fa              # d767 |   sub [G], 0xfade + A, A*2
ee e0 e0 f8 55 01 34 fa 9f f8  # d76d |   jne [0x155], 0xfa34, ${fail}:rel + PC
b2 2a e4 21 de fa              # d777 |   or [A*4 + B], 0xfade + A, A*2
ee e0 e0 f8 63 03 dc fb 8f f8  # d77d |   jne [0x363], 0xfbdc, ${fail}:rel + PC
ae 21 21 20                    # d787 |   and [A*2], A*2, A
ee e0 00 f8 54 01 81 f8        # d78b |   jne [0x154], 0, ${fail}:rel + PC
86 2a 2a fe                    # d793 |   sub [A*4 + B], A*4 + B, G
ee e0 e0 f8 63 03 0e 02 75 f8  # d797 |   jne [0x363], 0x20e, ${fail}:rel + PC
82 3e 3e 20 f6 f6              # d7a1 |   add [A*4 + -10], A*4 + -10, A
ee e0 e0 f8 9e 02 48 03 65 f8  # d7a7 |   jne [0x29e], 0x348, ${fail}:rel + PC
86 21 e0 e0 39 30 39 30        # d7b1 |   sub [A*2], 0x3039, 0x3039
ee e0 00 f8 54 01 53 f8        # d7b9 |   jne [0x154], 0, ${fail}:rel + PC
a2 20 1c fe 85                 # d7c1 |   shr [A], -123, G
ee e0 e0 f8 aa 00 fc 07 46 f8  # d7c6 |   jne [0xaa], 0x7fc, ${fail}:rel + PC
aa 2a 1c 2a 85                 # d7d0 |   shl [A*4 + B], -123, A*4 + B
ee e0 e0 f8 63 03 28 fc 37 f8  # d7d5 |   jne [0x363], 0xfc28, ${fail}:rel + PC
b2 2a 20 20                    # d7df |   or [A*4 + B], A, A
ee e0 e0 f8 63 03 aa 00 29 f8  # d7e3 |   jne [0x363], 0xaa, ${fail}:rel + PC
86 20 20 1c 85                 # d7ed |   sub [A], A, -123
ee e0 e0 f8 aa 00 25 01 1a f8  # d7f2 |   jne [0xaa], 0x125, ${fail}:rel + PC
a6 3e e4 21 f6 de fa           # d7fc |   ishr [A*4 + -10], 0xfade + A, A*2
ee e0 1c f8 9e 02 b8 09 f8     # d803 |   jne [0x29e], 0xb8, ${fail}:rel + PC
86 20 e0 e0 39 30 39 30        # d80c |   sub [A], 0x3039, 0x3039
ee e0 00 f8 aa 00 f8 f7        # d814 |   jne [0xaa], 0, ${fail}:rel + PC
82 fe e0 e0 39 30 39 30        # d81c |   add [G], 0x3039, 0x3039
ee e0 e0 f8 55 01 72 60 e8 f7  # d824 |   jne [0x155], 0x6072, ${fail}:rel + PC
a2 2a e4 e4 de fa de fa        # d82e |   shr [A*4 + B], 0xfade + A, 0xfade + A
ee e0 e0 f8 63 03 fb 00 d6 f7  # d836 |   jne [0x363], 0xfb, ${fail}:rel + PC
8e 20 20 fe                    # d840 |   imul [A], A, G
ee e0 e0 f8 aa 00 72 e2 c8 f7  # d844 |   jne [0xaa], 0xe272, ${fail}:rel + PC
a2 21 e4 2a de fa              # d84e |   shr [A*2], 0xfade + A, A*4 + B
ee e0 e0 f8 54 01 71 1f b8 f7  # d854 |   jne [0x154], 0x1f71, ${fail}:rel + PC
a2 2a 2a 1c 85                 # d85e |   shr [A*4 + B], A*4 + B, -123
ee e0 1c f8 63 03 1b a9 f7     # d863 |   jne [0x363], 0x1b, ${fail}:rel + PC
a2 20 21 2a                    # d86c |   shr [A], A*2, A*4 + B
ee e0 1c f8 aa 00 2a 9c f7     # d870 |   jne [0xaa], 0x2a, ${fail}:rel + PC
ae e0 2a 20 39 30              # d879 |   and [0x3039], A*4 + B, A
ee e0 1c f8 39 30 22 8d f7     # d87f |   jne [0x3039], 0x22, ${fail}:rel + PC
a2 e0 e0 e0 39 30 39 30 39 30  # d888 |   shr [0x3039], 0x3039, 0x3039
ee e0 1c f8 39 30 18 7a f7     # d892 |   jne [0x3039], 0x18, ${fail}:rel + PC
8a 20 fe 3e f6                 # d89b |   mul [A], G, A*4 + -10
ee e0 e0 f8 aa 00 76 7c 6c f7  # d8a0 |   jne [0xaa], 0x7c76, ${fail}:rel + PC
82 2a e0 2a 39 30              # d8aa |   add [A*4 + B], 0x3039, A*4 + B
ee e0 e0 f8 63 03 9c 33 5c f7  # d8b0 |   jne [0x363], 0x339c, ${fail}:rel + PC
8e fe 3e 2a f6                 # d8ba |   imul [G], A*4 + -10, A*4 + B
ee e0 e0 f8 55 01 1a dd 4d f7  # d8bf |   jne [0x155], 0xdd1a, ${fail}:rel + PC
aa 20 21 e0 39 30              # d8c9 |   shl [A], A*2, 0x3039
ee e0 e0 f8 aa 00 00 a8 3d f7  # d8cf |   jne [0xaa], 0xa800, ${fail}:rel + PC
82 21 fe 20                    # d8d9 |   add [A*2], G, A
ee e0 e0 f8 54 01 ff 01 2f f7  # d8dd |   jne [0x154], 0x1ff, ${fail}:rel + PC
82 2a 2a 21                    # d8e7 |   add [A*4 + B], A*4 + B, A*2
ee e0 e0 f8 63 03 b7 04 21 f7  # d8eb |   jne [0x363], 0x4b7, ${fail}:rel + PC
a2 20 fe e4 de fa              # d8f5 |   shr [A], G, 0xfade + A
ee e0 1c f8 aa 00 01 11 f7     # d8fb |   jne [0xaa], 0x1, ${fail}:rel + PC
82 fe 1c 20 85                 # d904 |   add [G], -123, A
ee e0 1c f8 55 01 2f 03 f7     # d909 |   jne [0x155], 0x2f, ${fail}:rel + PC
8e 3e fe e0 f6 39 30           # d912 |   imul [A*4 + -10], G, 0x3039
ee e0 e0 f8 9e 02 ed 3b f3 f6  # d919 |   jne [0x29e], 0x3bed, ${fail}:rel + PC
8a fe e4 2a de fa              # d923 |   mul [G], 0xfade + A, A*4 + B
ee e0 e0 f8 55 01 98 dd e3 f6  # d929 |   jne [0x155], 0xdd98, ${fail}:rel + PC
a2 fe fe 20                    # d933 |   shr [G], G, A
ee e0 00 f8 55 01 d5 f6        # d937 |   jne [0x155], 0, ${fail}:rel + PC
b2 21 20 20                    # d93f |   or [A*2], A, A
ee e0 e0 f8 54 01 aa 00 c9 f6  # d943 |   jne [0x154], 0xaa, ${fail}:rel + PC
b2 3e 1c 21 f6 85              # d94d |   or [A*4 + -10], -123, A*2
ee e0 1c f8 9e 02 d5 b9 f6     # d953 |   jne [0x29e], 0xd5, ${fail}:rel + PC
8a 2a 1c 1c 85 85              # d95c |   mul [A*4 + B], -123, -123
ee e0 e0 f8 63 03 19 3b aa f6  # d962 |   jne [0x363], 0x3b19, ${fail}:rel + PC
8a e0 e4 21 39 30 de fa        # d96c |   mul [0x3039], 0xfade + A, A*2
ee e0 e0 f8 39 30 a0 10 98 f6  # d974 |   jne [0x3039], 0x10a0, ${fail}:rel + PC
86 fe 20 3e f6                 # d97e |   sub [G], A, A*4 + -10
ee e0 e0 f8 55 01 0c fe 89 f6  # d983 |   jne [0x155], 0xfe0c, ${fail}:rel + PC
aa 20 2a 21                    # d98d |   shl [A], A*4 + B, A*2
ee e0 e0 f8 aa 00 30 36 7b f6  # d991 |   jne [0xaa], 0x3630, ${fail}:rel + PC
b6 21 1c 2a 85                 # d99b |   xor [A*2], -123, A*4 + B
ee e0 e0 f8 54 01 e6 fc 6c f6  # d9a0 |   jne [0x154], 0xfce6, ${fail}:rel + PC
86 2a 3e 1c f6 85              # d9aa |   sub [A*4 + B], A*4 + -10, -123
ee e0 e0 f8 63 03 19 03 5c f6  # d9b0 |   jne [0x363], 0x319, ${fail}:rel + PC
86 e0 e0 e4 39 30 39 30 de fa  # d9ba |   sub [0x3039], 0x3039, 0xfade + A
ee e0 e0 f8 39 30 b1 34 48 f6  # d9c4 |   jne [0x3039], 0x34b1, ${fail}:rel + PC
ae fe 2a e4 de fa              # d9ce |   and [G], A*4 + B, 0xfade + A
ee e0 e0 f8 55 01 00 03 38 f6  # d9d4 |   jne [0x155], 0x300, ${fail}:rel + PC
aa 20 3e fe f6                 # d9de |   shl [A], A*4 + -10, G
ee e0 e0 f8 aa 00 c0 53 29 f6  # d9e3 |   jne [0xaa], 0x53c0, ${fail}:rel + PC
a6 fe fe e4 de fa              # d9ed |   ishr [G], G, 0xfade + A
ee e0 1c f8 55 01 01 19 f6     # d9f3 |   jne [0x155], 0x1, ${fail}:rel + PC
ae 21 e0 2a 39 30              # d9fc |   and [A*2], 0x3039, A*4 + B
ee e0 1c f8 54 01 21 0a f6     # da02 |   jne [0x154], 0x21, ${fail}:rel + PC
a6 21 21 1c 85                 # da0b |   ishr [A*2], A*2, -123
ee e0 1c f8 54 01 0a fc f5     # da10 |   jne [0x154], 0xa, ${fail}:rel + PC
b6 fe 21 e0 39 30              # da19 |   xor [G], A*2, 0x3039
ee e0 e0 f8 55 01 6d 31 ed f5  # da1f |   jne [0x155], 0x316d, ${fail}:rel + PC
86 2a 3e 2a f6                 # da29 |   sub [A*4 + B], A*4 + -10, A*4 + B
ee e0 e0 f8 63 03 3b ff de f5  # da2e |   jne [0x363], 0xff3b, ${fail}:rel + PC
b2 e0 fe 1c 39 30 85           # da38 |   or [0x3039], G, -123
ee e0 1c f8 39 30 d5 cd f5     # da3f |   jne [0x3039], 0xd5, ${fail}:rel + PC
aa 2a 3e 20 f6                 # da48 |   shl [A*4 + B], A*4 + -10, A
ee e0 e0 f8 63 03 00 78 bf f5  # da4d |   jne [0x363], 0x7800, ${fail}:rel + PC
86 e0 21 20 39 30              # da57 |   sub [0x3039], A*2, A
ee e0 e0 f8 39 30 aa 00 af f5  # da5d |   jne [0x3039], 0xaa, ${fail}:rel + PC
b6 e0 2a 21 39 30              # da67 |   xor [0x3039], A*4 + B, A*2
ee e0 e0 f8 39 30 37 02 9f f5  # da6d |   jne [0x3039], 0x237, ${fail}:rel + PC
ae 2a e0 1c 39 30 85           # da77 |   and [A*4 + B], 0x3039, -123
ee e0 e0 f8 63 03 01 30 8e f5  # da7e |   jne [0x363], 0x3001, ${fail}:rel + PC
8e fe 2a e0 39 30              # da88 |   imul [G], A*4 + B, 0x3039
ee e0 e0 f8 55 01 0b 51 7e f5  # da8e |   jne [0x155], 0x510b, ${fail}:rel + PC
b2 2a 20 fe                    # da98 |   or [A*4 + B], A, G
ee e0 e0 f8 63 03 ff 01 70 f5  # da9c |   jne [0x363], 0x1ff, ${fail}:rel + PC
a6 3e e0 20 f6 39 30           # daa6 |   ishr [A*4 + -10], 0x3039, A
ee e0 1c f8 9e 02 0c 5f f5     # daad |   jne [0x29e], 0xc, ${fail}:rel + PC
aa e0 e4 e4 39 30 de fa de fa  # dab6 |   shl [0x3039], 0xfade + A, 0xfade + A
ee e0 e0 f8 39 30 00 88 4c f5  # dac0 |   jne [0x3039], 0x8800, ${fail}:rel + PC
aa 20 e0 fe 39 30              # daca |   shl [A], 0x3039, G
ee e0 e0 f8 aa 00 20 07 3c f5  # dad0 |   jne [0xaa], 0x720, ${fail}:rel + PC
b6 fe 3e 21 f6                 # dada |   xor [G], A*4 + -10, A*2
ee e0 e0 f8 55 01 ca 03 2d f5  # dadf |   jne [0x155], 0x3ca, ${fail}:rel + PC
b2 2a fe 1c 85                 # dae9 |   or [A*4 + B], G, -123
ee e0 1c f8 63 03 d5 1e f5     # daee |   jne [0x363], 0xd5, ${fail}:rel + PC
86 3e 1c e0 f6 85 39 30        # daf7 |   sub [A*4 + -10], -123, 0x3039
ee e0 e0 f8 9e 02 4c cf 0d f5  # daff |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
aa 21 21 21                    # db09 |   shl [A*2], A*2, A*2
ee e0 e0 f8 54 01 40 15 ff f4  # db0d |   jne [0x154], 0x1540, ${fail}:rel + PC
86 e0 e4 e0 39 30 de fa 39 30  # db17 |   sub [0x3039], 0xfade + A, 0x3039
ee e0 e0 f8 39 30 4f cb eb f4  # db21 |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
a2 21 e0 1c 39 30 85           # db2b |   shr [A*2], 0x3039, -123
ee e0 e0 f8 54 01 81 01 da f4  # db32 |   jne [0x154], 0x181, ${fail}:rel + PC
a6 e0 e4 20 39 30 de fa        # db3c |   ishr [0x3039], 0xfade + A, A
ee e0 1c f8 39 30 fe c8 f4     # db44 |   jne [0x3039], 0xfe, ${fail}:rel + PC
b6 3e e4 e0 f6 de fa 39 30     # db4d |   xor [A*4 + -10], 0xfade + A, 0x3039
ee e0 e0 f8 9e 02 b1 cb b6 f4  # db56 |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
86 3e 21 3e f6 f6              # db60 |   sub [A*4 + -10], A*2, A*4 + -10
ee e0 e0 f8 9e 02 b6 fe a6 f4  # db66 |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
8e fe 1c 3e 85 f6              # db70 |   imul [G], -123, A*4 + -10
ee e0 e0 f8 55 01 16 be 96 f4  # db76 |   jne [0x155], 0xbe16, ${fail}:rel + PC
aa 20 2a 2a                    # db80 |   shl [A], A*4 + B, A*4 + B
ee e0 e0 f8 aa 00 18 1b 88 f4  # db84 |   jne [0xaa], 0x1b18, ${fail}:rel + PC
b6 e0 21 2a 39 30              # db8e |   xor [0x3039], A*2, A*4 + B
ee e0 e0 f8 39 30 37 02 78 f4  # db94 |   jne [0x3039], 0x237, ${fail}:rel + PC
82 21 21 e0 39 30              # db9e |   add [A*2], A*2, 0x3039
ee e0 e0 f8 54 01 8d 31 68 f4  # dba4 |   jne [0x154], 0x318d, ${fail}:rel + PC
ae 21 2a 20                    # dbae |   and [A*2], A*4 + B, A
ee e0 1c f8 54 01 22 5a f4     # dbb2 |   jne [0x154], 0x22, ${fail}:rel + PC
aa 20 2a e4 de fa              # dbbb |   shl [A], A*4 + B, 0xfade + A
ee e0 e0 f8 aa 00 00 63 4b f4  # dbc1 |   jne [0xaa], 0x6300, ${fail}:rel + PC
ae 2a fe 20                    # dbcb |   and [A*4 + B], G, A
ee e0 00 f8 63 03 3d f4        # dbcf |   jne [0x363], 0, ${fail}:rel + PC
b6 fe 21 1c 85                 # dbd7 |   xor [G], A*2, -123
ee e0 e0 f8 55 01 d1 fe 30 f4  # dbdc |   jne [0x155], 0xfed1, ${fail}:rel + PC
ae e0 fe 21 39 30              # dbe6 |   and [0x3039], G, A*2
ee e0 e0 f8 39 30 54 01 20 f4  # dbec |   jne [0x3039], 0x154, ${fail}:rel + PC
b2 3e e0 2a f6 39 30           # dbf6 |   or [A*4 + -10], 0x3039, A*4 + B
ee e0 e0 f8 9e 02 7b 33 0f f4  # dbfd |   jne [0x29e], 0x337b, ${fail}:rel + PC
b6 fe e4 3e de fa f6           # dc07 |   xor [G], 0xfade + A, A*4 + -10
ee e0 e0 f8 55 01 16 f9 fe f3  # dc0e |   jne [0x155], 0xf916, ${fail}:rel + PC
8e 2a 21 2a                    # dc18 |   imul [A*4 + B], A*2, A*4 + B
ee e0 e0 f8 63 03 7c 7f f0 f3  # dc1c |   jne [0x363], 0x7f7c, ${fail}:rel + PC
a6 fe 21 fe                    # dc26 |   ishr [G], A*2, G
ee e0 1c f8 55 01 0a e2 f3     # dc2a |   jne [0x155], 0xa, ${fail}:rel + PC
8a 21 1c 1c 85 85              # dc33 |   mul [A*2], -123, -123
ee e0 e0 f8 54 01 19 3b d3 f3  # dc39 |   jne [0x154], 0x3b19, ${fail}:rel + PC
8e 2a e4 20 de fa              # dc43 |   imul [A*4 + B], 0xfade + A, A
ee e0 e0 f8 63 03 50 08 c3 f3  # dc49 |   jne [0x363], 0x850, ${fail}:rel + PC
a2 3e 3e 3e f6 f6 f6           # dc53 |   shr [A*4 + -10], A*4 + -10, A*4 + -10
ee e0 00 f8 9e 02 b2 f3        # dc5a |   jne [0x29e], 0, ${fail}:rel + PC
8a 20 1c e4 85 de fa           # dc62 |   mul [A], -123, 0xfade + A
ee e0 e0 f8 aa 00 a8 25 a3 f3  # dc69 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
a6 3e 20 21 f6                 # dc73 |   ishr [A*4 + -10], A, A*2
ee e0 1c f8 9e 02 0a 94 f3     # dc78 |   jne [0x29e], 0xa, ${fail}:rel + PC
b2 3e 20 20 f6                 # dc81 |   or [A*4 + -10], A, A
ee e0 e0 f8 9e 02 aa 00 86 f3  # dc86 |   jne [0x29e], 0xaa, ${fail}:rel + PC
82 e0 fe e0 39 30 39 30        # dc90 |   add [0x3039], G, 0x3039
ee e0 e0 f8 39 30 8e 31 74 f3  # dc98 |   jne [0x3039], 0x318e, ${fail}:rel + PC
8e 3e e0 3e f6 39 30 f6        # dca2 |   imul [A*4 + -10], 0x3039, A*4 + -10
ee e0 e0 f8 9e 02 2e 35 62 f3  # dcaa |   jne [0x29e], 0x352e, ${fail}:rel + PC
a6 fe fe 21                    # dcb4 |   ishr [G], G, A*2
ee e0 1c f8 55 01 15 54 f3     # dcb8 |   jne [0x155], 0x15, ${fail}:rel + PC
8e 20 e4 3e de fa f6           # dcc1 |   imul [A], 0xfade + A, A*4 + -10
ee e0 e0 f8 aa 00 f0 4d 44 f3  # dcc8 |   jne [0xaa], 0x4df0, ${fail}:rel + PC
a6 fe 20 fe                    # dcd2 |   ishr [G], A, G
ee e0 1c f8 55 01 05 36 f3     # dcd6 |   jne [0x155], 0x5, ${fail}:rel + PC
82 2a e0 3e 39 30 f6           # dcdf |   add [A*4 + B], 0x3039, A*4 + -10
ee e0 e0 f8 63 03 d7 32 26 f3  # dce6 |   jne [0x363], 0x32d7, ${fail}:rel + PC
ae 3e 2a e4 f6 de fa           # dcf0 |   and [A*4 + -10], A*4 + B, 0xfade + A
ee e0 e0 f8 9e 02 00 03 15 f3  # dcf7 |   jne [0x29e], 0x300, ${fail}:rel + PC
8e 20 1c 2a 85                 # dd01 |   imul [A], -123, A*4 + B
ee e0 e0 f8 aa 00 6f 5f 06 f3  # dd06 |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
a2 fe 3e e4 f6 de fa           # dd10 |   shr [G], A*4 + -10, 0xfade + A
ee e0 1c f8 55 01 02 f5 f2     # dd17 |   jne [0x155], 0x2, ${fail}:rel + PC
b2 2a e0 20 39 30              # dd20 |   or [A*4 + B], 0x3039, A
ee e0 e0 f8 63 03 bb 30 e6 f2  # dd26 |   jne [0x363], 0x30bb, ${fail}:rel + PC
b6 2a e0 fe 39 30              # dd30 |   xor [A*4 + B], 0x3039, G
ee e0 e0 f8 63 03 6c 31 d6 f2  # dd36 |   jne [0x363], 0x316c, ${fail}:rel + PC
8e 20 20 e0 39 30              # dd40 |   imul [A], A, 0x3039
ee e0 e0 f8 aa 00 da 05 c6 f2  # dd46 |   jne [0xaa], 0x5da, ${fail}:rel + PC
b2 21 2a 3e f6                 # dd50 |   or [A*2], A*4 + B, A*4 + -10
ee e0 e0 f8 54 01 ff 03 b7 f2  # dd55 |   jne [0x154], 0x3ff, ${fail}:rel + PC
aa fe e4 e0 de fa 39 30        # dd5f |   shl [G], 0xfade + A, 0x3039
ee e0 e0 f8 55 01 00 10 a5 f2  # dd67 |   jne [0x155], 0x1000, ${fail}:rel + PC
a6 2a e4 2a de fa              # dd71 |   ishr [A*4 + B], 0xfade + A, A*4 + B
ee e0 e0 f8 63 03 71 ff 95 f2  # dd77 |   jne [0x363], 0xff71, ${fail}:rel + PC
aa 3e e4 1c f6 de fa 85        # dd81 |   shl [A*4 + -10], 0xfade + A, -123
ee e0 e0 f8 9e 02 00 71 83 f2  # dd89 |   jne [0x29e], 0x7100, ${fail}:rel + PC
a2 3e e4 20 f6 de fa           # dd93 |   shr [A*4 + -10], 0xfade + A, A
ee e0 1c f8 9e 02 3e 72 f2     # dd9a |   jne [0x29e], 0x3e, ${fail}:rel + PC
8a 3e 20 2a f6                 # dda3 |   mul [A*4 + -10], A, A*4 + B
ee e0 e0 f8 9e 02 be 3f 64 f2  # dda8 |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
b2 21 3e 2a f6                 # ddb2 |   or [A*2], A*4 + -10, A*4 + B
ee e0 e0 f8 54 01 ff 03 55 f2  # ddb7 |   jne [0x154], 0x3ff, ${fail}:rel + PC
8e 3e 21 1c f6 85              # ddc1 |   imul [A*4 + -10], A*2, -123
ee e0 e0 f8 9e 02 a4 5c 45 f2  # ddc7 |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
aa e0 3e 21 39 30 f6           # ddd1 |   shl [0x3039], A*4 + -10, A*2
ee e0 e0 f8 39 30 e0 29 34 f2  # ddd8 |   jne [0x3039], 0x29e0, ${fail}:rel + PC
aa 21 e4 e4 de fa de fa        # dde2 |   shl [A*2], 0xfade + A, 0xfade + A
ee e0 e0 f8 54 01 00 88 22 f2  # ddea |   jne [0x154], 0x8800, ${fail}:rel + PC
82 fe 21 21                    # ddf4 |   add [G], A*2, A*2
ee e0 e0 f8 55 01 a8 02 14 f2  # ddf8 |   jne [0x155], 0x2a8, ${fail}:rel + PC
ae 21 e4 fe de fa              # de02 |   and [A*2], 0xfade + A, G
ee e0 e0 f8 54 01 00 01 04 f2  # de08 |   jne [0x154], 0x100, ${fail}:rel + PC
ae 3e e0 e0 f6 39 30 39 30     # de12 |   and [A*4 + -10], 0x3039, 0x3039
ee e0 e0 f8 9e 02 39 30 f1 f1  # de1b |   jne [0x29e], 0x3039, ${fail}:rel + PC
aa 3e 20 1c f6 85              # de25 |   shl [A*4 + -10], A, -123
ee e0 e0 f8 9e 02 40 15 e1 f1  # de2b |   jne [0x29e], 0x1540, ${fail}:rel + PC
ae 2a 3e e4 f6 de fa           # de35 |   and [A*4 + B], A*4 + -10, 0xfade + A
ee e0 e0 f8 63 03 88 02 d0 f1  # de3c |   jne [0x363], 0x288, ${fail}:rel + PC
82 fe 1c 1c 85 85              # de46 |   add [G], -123, -123
ee e0 e0 f8 55 01 0a ff c0 f1  # de4c |   jne [0x155], 0xff0a, ${fail}:rel + PC
8a 20 20 e4 de fa              # de56 |   mul [A], A, 0xfade + A
ee e0 e0 f8 aa 00 50 08 b0 f1  # de5c |   jne [0xaa], 0x850, ${fail}:rel + PC
b2 21 2a fe                    # de66 |   or [A*2], A*4 + B, G
ee e0 e0 f8 54 01 77 03 a2 f1  # de6a |   jne [0x154], 0x377, ${fail}:rel + PC
86 fe e4 e4 de fa de fa        # de74 |   sub [G], 0xfade + A, 0xfade + A
ee e0 00 f8 55 01 90 f1        # de7c |   jne [0x155], 0, ${fail}:rel + PC
a2 2a fe e4 de fa              # de84 |   shr [A*4 + B], G, 0xfade + A
ee e0 1c f8 63 03 01 82 f1     # de8a |   jne [0x363], 0x1, ${fail}:rel + PC
86 21 1c fe 85                 # de93 |   sub [A*2], -123, G
ee e0 e0 f8 54 01 30 fe 74 f1  # de98 |   jne [0x154], 0xfe30, ${fail}:rel + PC
aa 3e 21 fe f6                 # dea2 |   shl [A*4 + -10], A*2, G
ee e0 e0 f8 9e 02 80 2a 65 f1  # dea7 |   jne [0x29e], 0x2a80, ${fail}:rel + PC
aa 20 1c 3e 85 f6              # deb1 |   shl [A], -123, A*4 + -10
ee e0 e0 f8 aa 00 00 40 55 f1  # deb7 |   jne [0xaa], 0x4000, ${fail}:rel + PC
8a 3e 2a 21 f6                 # dec1 |   mul [A*4 + -10], A*4 + B, A*2
ee e0 e0 f8 9e 02 7c 7f 46 f1  # dec6 |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
a2 20 2a fe                    # ded0 |   shr [A], A*4 + B, G
ee e0 1c f8 aa 00 1b 38 f1     # ded4 |   jne [0xaa], 0x1b, ${fail}:rel + PC
82 20 2a e0 39 30              # dedd |   add [A], A*4 + B, 0x3039
ee e0 e0 f8 aa 00 9c 33 29 f1  # dee3 |   jne [0xaa], 0x339c, ${fail}:rel + PC
b6 fe e0 1c 39 30 85           # deed |   xor [G], 0x3039, -123
ee e0 e0 f8 55 01 bc cf 18 f1  # def4 |   jne [0x155], 0xcfbc, ${fail}:rel + PC
86 20 e4 2a de fa              # defe |   sub [A], 0xfade + A, A*4 + B
ee e0 e0 f8 aa 00 25 f8 08 f1  # df04 |   jne [0xaa], 0xf825, ${fail}:rel + PC
a6 2a 21 fe                    # df0e |   ishr [A*4 + B], A*2, G
ee e0 1c f8 63 03 0a fa f0     # df12 |   jne [0x363], 0xa, ${fail}:rel + PC
b2 21 fe e4 de fa              # df1b |   or [A*2], G, 0xfade + A
ee e0 e0 f8 54 01 dd fb eb f0  # df21 |   jne [0x154], 0xfbdd, ${fail}:rel + PC
8a e0 e4 fe 39 30 de fa        # df2b |   mul [0x3039], 0xfade + A, G
ee e0 e0 f8 39 30 28 0c d9 f0  # df33 |   jne [0x3039], 0xc28, ${fail}:rel + PC
8e 2a 2a e4 de fa              # df3d |   imul [A*4 + B], A*4 + B, 0xfade + A
ee e0 e0 f8 63 03 98 dd c9 f0  # df43 |   jne [0x363], 0xdd98, ${fail}:rel + PC
ae e0 20 fe 39 30              # df4d |   and [0x3039], A, G
ee e0 00 f8 39 30 b9 f0        # df53 |   jne [0x3039], 0, ${fail}:rel + PC
8e fe fe 2a                    # df5b |   imul [G], G, A*4 + B
ee e0 e0 f8 55 01 df 82 ad f0  # df5f |   jne [0x155], 0x82df, ${fail}:rel + PC
8e 3e 21 21 f6                 # df69 |   imul [A*4 + -10], A*2, A*2
ee e0 e0 f8 9e 02 90 c3 9e f0  # df6e |   jne [0x29e], 0xc390, ${fail}:rel + PC
b2 fe e4 1c de fa 85           # df78 |   or [G], 0xfade + A, -123
ee e0 1c f8 55 01 8d 8d f0     # df7f |   jne [0x155], 0x8d, ${fail}:rel + PC
8e 2a 20 3e f6                 # df88 |   imul [A*4 + B], A, A*4 + -10
ee e0 e0 f8 63 03 ec bc 7f f0  # df8d |   jne [0x363], 0xbcec, ${fail}:rel + PC
a2 2a 3e e0 f6 39 30           # df97 |   shr [A*4 + B], A*4 + -10, 0x3039
ee e0 1c f8 63 03 01 6e f0     # df9e |   jne [0x363], 0x1, ${fail}:rel + PC
b6 2a 21 e0 39 30              # dfa7 |   xor [A*4 + B], A*2, 0x3039
ee e0 e0 f8 63 03 6d 31 5f f0  # dfad |   jne [0x363], 0x316d, ${fail}:rel + PC
a2 e0 3e e0 39 30 f6 39 30     # dfb7 |   shr [0x3039], A*4 + -10, 0x3039
ee e0 1c f8 39 30 01 4c f0     # dfc0 |   jne [0x3039], 0x1, ${fail}:rel + PC
a2 21 1c 3e 85 f6              # dfc9 |   shr [A*2], -123, A*4 + -10
ee e0 1c f8 54 01 03 3d f0     # dfcf |   jne [0x154], 0x3, ${fail}:rel + PC
b2 21 20 21                    # dfd8 |   or [A*2], A, A*2
ee e0 e0 f8 54 01 fe 01 30 f0  # dfdc |   jne [0x154], 0x1fe, ${fail}:rel + PC
a2 fe 2a 21                    # dfe6 |   shr [G], A*4 + B, A*2
ee e0 1c f8 55 01 36 22 f0     # dfea |   jne [0x155], 0x36, ${fail}:rel + PC
b6 e0 3e 2a 39 30 f6           # dff3 |   xor [0x3039], A*4 + -10, A*4 + B
ee e0 e0 f8 39 30 fd 01 12 f0  # dffa |   jne [0x3039], 0x1fd, ${fail}:rel + PC
8a 3e e4 3e f6 de fa f6        # e004 |   mul [A*4 + -10], 0xfade + A, A*4 + -10
ee e0 e0 f8 9e 02 f0 4d 00 f0  # e00c |   jne [0x29e], 0x4df0, ${fail}:rel + PC
8e 2a 21 3e f6                 # e016 |   imul [A*4 + B], A*2, A*4 + -10
ee e0 e0 f8 63 03 d8 79 f1 ef  # e01b |   jne [0x363], 0x79d8, ${fail}:rel + PC
a2 e0 e4 3e 39 30 de fa f6     # e025 |   shr [0x3039], 0xfade + A, A*4 + -10
ee e0 1c f8 39 30 03 de ef     # e02e |   jne [0x3039], 0x3, ${fail}:rel + PC
82 3e 20 fe f6                 # e037 |   add [A*4 + -10], A, G
ee e0 e0 f8 9e 02 ff 01 d0 ef  # e03c |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a2 2a e4 e0 de fa 39 30        # e046 |   shr [A*4 + B], 0xfade + A, 0x3039
ee e0 1c f8 63 03 7d be ef     # e04e |   jne [0x363], 0x7d, ${fail}:rel + PC
a2 3e 1c 1c f6 85 85           # e057 |   shr [A*4 + -10], -123, -123
ee e0 e0 f8 9e 02 fc 07 ae ef  # e05e |   jne [0x29e], 0x7fc, ${fail}:rel + PC
8e 20 1c e0 85 39 30           # e068 |   imul [A], -123, 0x3039
ee e0 e0 f8 aa 00 9d d4 9d ef  # e06f |   jne [0xaa], 0xd49d, ${fail}:rel + PC
aa 2a 3e 21 f6                 # e079 |   shl [A*4 + B], A*4 + -10, A*2
ee e0 e0 f8 63 03 e0 29 8e ef  # e07e |   jne [0x363], 0x29e0, ${fail}:rel + PC
b6 21 e0 fe 39 30              # e088 |   xor [A*2], 0x3039, G
ee e0 e0 f8 54 01 6c 31 7e ef  # e08e |   jne [0x154], 0x316c, ${fail}:rel + PC
b6 e0 3e 3e 39 30 f6 f6        # e098 |   xor [0x3039], A*4 + -10, A*4 + -10
ee e0 00 f8 39 30 6c ef        # e0a0 |   jne [0x3039], 0, ${fail}:rel + PC
b6 20 21 1c 85                 # e0a8 |   xor [A], A*2, -123
ee e0 e0 f8 aa 00 d1 fe 5f ef  # e0ad |   jne [0xaa], 0xfed1, ${fail}:rel + PC
b6 21 21 fe                    # e0b7 |   xor [A*2], A*2, G
ee e0 1c f8 54 01 01 51 ef     # e0bb |   jne [0x154], 0x1, ${fail}:rel + PC
8a fe e0 20 39 30              # e0c4 |   mul [G], 0x3039, A
ee e0 e0 f8 55 01 da 05 42 ef  # e0ca |   jne [0x155], 0x5da, ${fail}:rel + PC
b6 21 e0 21 39 30              # e0d4 |   xor [A*2], 0x3039, A*2
ee e0 e0 f8 54 01 6d 31 32 ef  # e0da |   jne [0x154], 0x316d, ${fail}:rel + PC
8a 21 2a e0 39 30              # e0e4 |   mul [A*2], A*4 + B, 0x3039
ee e0 e0 f8 54 01 0b 51 22 ef  # e0ea |   jne [0x154], 0x510b, ${fail}:rel + PC
ae 3e e0 1c f6 39 30 85        # e0f4 |   and [A*4 + -10], 0x3039, -123
ee e0 e0 f8 9e 02 01 30 10 ef  # e0fc |   jne [0x29e], 0x3001, ${fail}:rel + PC
aa fe 21 20                    # e106 |   shl [G], A*2, A
ee e0 e0 f8 55 01 00 50 02 ef  # e10a |   jne [0x155], 0x5000, ${fail}:rel + PC
ae 20 e4 20 de fa              # e114 |   and [A], 0xfade + A, A
ee e0 e0 f8 aa 00 88 00 f2 ee  # e11a |   jne [0xaa], 0x88, ${fail}:rel + PC
aa 21 3e e4 f6 de fa           # e124 |   shl [A*2], A*4 + -10, 0xfade + A
ee e0 e0 f8 54 01 00 9e e1 ee  # e12b |   jne [0x154], 0x9e00, ${fail}:rel + PC
b6 e0 e0 1c 39 30 39 30 85     # e135 |   xor [0x3039], 0x3039, -123
ee e0 e0 f8 39 30 bc cf ce ee  # e13e |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
8a 3e 3e 1c f6 f6 85           # e148 |   mul [A*4 + -10], A*4 + -10, -123
ee e0 e0 f8 9e 02 16 be bd ee  # e14f |   jne [0x29e], 0xbe16, ${fail}:rel + PC
86 fe 21 3e f6                 # e159 |   sub [G], A*2, A*4 + -10
ee e0 e0 f8 55 01 b6 fe ae ee  # e15e |   jne [0x155], 0xfeb6, ${fail}:rel + PC
86 3e 2a fe f6                 # e168 |   sub [A*4 + -10], A*4 + B, G
ee e0 e0 f8 9e 02 0e 02 9f ee  # e16d |   jne [0x29e], 0x20e, ${fail}:rel + PC
b6 3e 1c fe f6 85              # e177 |   xor [A*4 + -10], -123, G
ee e0 e0 f8 9e 02 d0 fe 8f ee  # e17d |   jne [0x29e], 0xfed0, ${fail}:rel + PC
86 20 2a 1c 85                 # e187 |   sub [A], A*4 + B, -123
ee e0 e0 f8 aa 00 de 03 80 ee  # e18c |   jne [0xaa], 0x3de, ${fail}:rel + PC
86 20 21 fe                    # e196 |   sub [A], A*2, G
ee e0 1c f8 aa 00 ff 72 ee     # e19a |   jne [0xaa], 0xff, ${fail}:rel + PC
86 2a 20 e4 de fa              # e1a3 |   sub [A*4 + B], A, 0xfade + A
ee e0 e0 f8 63 03 22 05 63 ee  # e1a9 |   jne [0x363], 0x522, ${fail}:rel + PC
aa e0 fe 3e 39 30 f6           # e1b3 |   shl [0x3039], G, A*4 + -10
ee e0 e0 f8 39 30 00 40 52 ee  # e1ba |   jne [0x3039], 0x4000, ${fail}:rel + PC
ae 20 1c 1c 85 85              # e1c4 |   and [A], -123, -123
ee e0 1c f8 aa 00 85 42 ee     # e1ca |   jne [0xaa], 0x85, ${fail}:rel + PC
b6 20 fe e0 39 30              # e1d3 |   xor [A], G, 0x3039
ee e0 e0 f8 aa 00 6c 31 33 ee  # e1d9 |   jne [0xaa], 0x316c, ${fail}:rel + PC
b2 e0 21 3e 39 30 f6           # e1e3 |   or [0x3039], A*2, A*4 + -10
ee e0 e0 f8 39 30 de 03 22 ee  # e1ea |   jne [0x3039], 0x3de, ${fail}:rel + PC
b2 20 e4 21 de fa              # e1f4 |   or [A], 0xfade + A, A*2
ee e0 e0 f8 aa 00 dc fb 12 ee  # e1fa |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
b6 fe 3e 3e f6 f6              # e204 |   xor [G], A*4 + -10, A*4 + -10
ee e0 00 f8 55 01 02 ee        # e20a |   jne [0x155], 0, ${fail}:rel + PC
b6 3e 20 e4 f6 de fa           # e212 |   xor [A*4 + -10], A, 0xfade + A
ee e0 e0 f8 9e 02 22 fb f3 ed  # e219 |   jne [0x29e], 0xfb22, ${fail}:rel + PC
b6 e0 1c e0 39 30 85 39 30     # e223 |   xor [0x3039], -123, 0x3039
ee e0 e0 f8 39 30 bc cf e0 ed  # e22c |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
a2 3e fe 2a f6                 # e236 |   shr [A*4 + -10], G, A*4 + B
ee e0 1c f8 9e 02 2a d1 ed     # e23b |   jne [0x29e], 0x2a, ${fail}:rel + PC
ae 20 fe 20                    # e244 |   and [A], G, A
ee e0 00 f8 aa 00 c4 ed        # e248 |   jne [0xaa], 0, ${fail}:rel + PC
86 2a e4 1c de fa 85           # e250 |   sub [A*4 + B], 0xfade + A, -123
ee e0 e0 f8 63 03 03 fc b5 ed  # e257 |   jne [0x363], 0xfc03, ${fail}:rel + PC
ae e0 21 21 39 30              # e261 |   and [0x3039], A*2, A*2
ee e0 e0 f8 39 30 54 01 a5 ed  # e267 |   jne [0x3039], 0x154, ${fail}:rel + PC
a2 e0 20 e0 39 30 39 30        # e271 |   shr [0x3039], A, 0x3039
ee e0 00 f8 39 30 93 ed        # e279 |   jne [0x3039], 0, ${fail}:rel + PC
8e 3e 2a 3e f6 f6              # e281 |   imul [A*4 + -10], A*4 + B, A*4 + -10
ee e0 e0 f8 9e 02 1a dd 85 ed  # e287 |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
a2 e0 3e 1c 39 30 f6 85        # e291 |   shr [0x3039], A*4 + -10, -123
ee e0 1c f8 39 30 14 73 ed     # e299 |   jne [0x3039], 0x14, ${fail}:rel + PC
82 fe 20 e0 39 30              # e2a2 |   add [G], A, 0x3039
ee e0 e0 f8 55 01 e3 30 64 ed  # e2a8 |   jne [0x155], 0x30e3, ${fail}:rel + PC
a6 e0 21 e0 39 30 39 30        # e2b2 |   ishr [0x3039], A*2, 0x3039
ee e0 00 f8 39 30 52 ed        # e2ba |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e4 1c 39 30 de fa 85     # e2c2 |   ishr [0x3039], 0xfade + A, -123
ee e0 1c f8 39 30 dc 41 ed     # e2cb |   jne [0x3039], 0xdc, ${fail}:rel + PC
b2 3e fe 20 f6                 # e2d4 |   or [A*4 + -10], G, A
ee e0 e0 f8 9e 02 ff 01 33 ed  # e2d9 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a6 2a 2a 20                    # e2e3 |   ishr [A*4 + B], A*4 + B, A
ee e0 00 f8 63 03 25 ed        # e2e7 |   jne [0x363], 0, ${fail}:rel + PC
aa fe e0 2a 39 30              # e2ef |   shl [G], 0x3039, A*4 + B
ee e0 e0 f8 55 01 c8 81 17 ed  # e2f5 |   jne [0x155], 0x81c8, ${fail}:rel + PC
8a 21 3e 20 f6                 # e2ff |   mul [A*2], A*4 + -10, A
ee e0 e0 f8 54 01 ec bc 08 ed  # e304 |   jne [0x154], 0xbcec, ${fail}:rel + PC
8e 3e 3e e0 f6 f6 39 30        # e30e |   imul [A*4 + -10], A*4 + -10, 0x3039
ee e0 e0 f8 9e 02 2e 35 f6 ec  # e316 |   jne [0x29e], 0x352e, ${fail}:rel + PC
b6 e0 1c 3e 39 30 85 f6        # e320 |   xor [0x3039], -123, A*4 + -10
ee e0 e0 f8 39 30 1b fd e4 ec  # e328 |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
b2 fe 20 e4 de fa              # e332 |   or [G], A, 0xfade + A
ee e0 e0 f8 55 01 aa fb d4 ec  # e338 |   jne [0x155], 0xfbaa, ${fail}:rel + PC
8e fe fe 3e f6                 # e342 |   imul [G], G, A*4 + -10
ee e0 e0 f8 55 01 76 7c c5 ec  # e347 |   jne [0x155], 0x7c76, ${fail}:rel + PC
8a 20 e0 3e 39 30 f6           # e351 |   mul [A], 0x3039, A*4 + -10
ee e0 e0 f8 aa 00 2e 35 b4 ec  # e358 |   jne [0xaa], 0x352e, ${fail}:rel + PC
b2 fe 20 20                    # e362 |   or [G], A, A
ee e0 e0 f8 55 01 aa 00 a6 ec  # e366 |   jne [0x155], 0xaa, ${fail}:rel + PC
a2 3e 21 e4 f6 de fa           # e370 |   shr [A*4 + -10], A*2, 0xfade + A
ee e0 1c f8 9e 02 01 95 ec     # e377 |   jne [0x29e], 0x1, ${fail}:rel + PC
a6 20 3e 2a f6                 # e380 |   ishr [A], A*4 + -10, A*4 + B
ee e0 1c f8 aa 00 53 87 ec     # e385 |   jne [0xaa], 0x53, ${fail}:rel + PC
82 20 e0 20 39 30              # e38e |   add [A], 0x3039, A
ee e0 e0 f8 aa 00 e3 30 78 ec  # e394 |   jne [0xaa], 0x30e3, ${fail}:rel + PC
a6 20 1c 20 85                 # e39e |   ishr [A], -123, A
ee e0 1c f8 aa 00 ff 69 ec     # e3a3 |   jne [0xaa], 0xff, ${fail}:rel + PC
ae 21 20 1c 85                 # e3ac |   and [A*2], A, -123
ee e0 e0 f8 54 01 80 00 5b ec  # e3b1 |   jne [0x154], 0x80, ${fail}:rel + PC
b6 2a 1c e4 85 de fa           # e3bb |   xor [A*4 + B], -123, 0xfade + A
ee e0 e0 f8 63 03 0d 04 4a ec  # e3c2 |   jne [0x363], 0x40d, ${fail}:rel + PC
82 20 e0 21 39 30              # e3cc |   add [A], 0x3039, A*2
ee e0 e0 f8 aa 00 8d 31 3a ec  # e3d2 |   jne [0xaa], 0x318d, ${fail}:rel + PC
82 21 fe 2a                    # e3dc |   add [A*2], G, A*4 + B
ee e0 e0 f8 54 01 b8 04 2c ec  # e3e0 |   jne [0x154], 0x4b8, ${fail}:rel + PC
b2 20 2a 20                    # e3ea |   or [A], A*4 + B, A
ee e0 e0 f8 aa 00 eb 03 1e ec  # e3ee |   jne [0xaa], 0x3eb, ${fail}:rel + PC
82 21 1c e0 85 39 30           # e3f8 |   add [A*2], -123, 0x3039
ee e0 e0 f8 54 01 be 2f 0d ec  # e3ff |   jne [0x154], 0x2fbe, ${fail}:rel + PC
aa fe 2a 1c 85                 # e409 |   shl [G], A*4 + B, -123
ee e0 e0 f8 55 01 60 6c fe eb  # e40e |   jne [0x155], 0x6c60, ${fail}:rel + PC
82 3e 3e 2a f6 f6              # e418 |   add [A*4 + -10], A*4 + -10, A*4 + B
ee e0 e0 f8 9e 02 01 06 ee eb  # e41e |   jne [0x29e], 0x601, ${fail}:rel + PC
b2 20 3e e4 f6 de fa           # e428 |   or [A], A*4 + -10, 0xfade + A
ee e0 e0 f8 aa 00 9e fb dd eb  # e42f |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
aa 2a 21 1c 85                 # e439 |   shl [A*4 + B], A*2, -123
ee e0 e0 f8 63 03 80 2a ce eb  # e43e |   jne [0x363], 0x2a80, ${fail}:rel + PC
b2 e0 1c 2a 39 30 85           # e448 |   or [0x3039], -123, A*4 + B
ee e0 1c f8 39 30 e7 bd eb     # e44f |   jne [0x3039], 0xe7, ${fail}:rel + PC
82 21 2a 2a                    # e458 |   add [A*2], A*4 + B, A*4 + B
ee e0 e0 f8 54 01 c6 06 b0 eb  # e45c |   jne [0x154], 0x6c6, ${fail}:rel + PC
ae 20 21 20                    # e466 |   and [A], A*2, A
ee e0 00 f8 aa 00 a2 eb        # e46a |   jne [0xaa], 0, ${fail}:rel + PC
86 20 fe 1c 85                 # e472 |   sub [A], G, -123
ee e0 e0 f8 aa 00 d0 01 95 eb  # e477 |   jne [0xaa], 0x1d0, ${fail}:rel + PC
b2 20 2a 3e f6                 # e481 |   or [A], A*4 + B, A*4 + -10
ee e0 e0 f8 aa 00 ff 03 86 eb  # e486 |   jne [0xaa], 0x3ff, ${fail}:rel + PC
b6 2a 20 2a                    # e490 |   xor [A*4 + B], A, A*4 + B
ee e0 e0 f8 63 03 c9 03 78 eb  # e494 |   jne [0x363], 0x3c9, ${fail}:rel + PC
aa 21 fe 3e f6                 # e49e |   shl [A*2], G, A*4 + -10
ee e0 e0 f8 54 01 00 40 69 eb  # e4a3 |   jne [0x154], 0x4000, ${fail}:rel + PC
ae 3e e0 21 f6 39 30           # e4ad |   and [A*4 + -10], 0x3039, A*2
ee e0 1c f8 9e 02 10 58 eb     # e4b4 |   jne [0x29e], 0x10, ${fail}:rel + PC
a2 e0 2a e4 39 30 de fa        # e4bd |   shr [0x3039], A*4 + B, 0xfade + A
ee e0 1c f8 39 30 03 47 eb     # e4c5 |   jne [0x3039], 0x3, ${fail}:rel + PC
8a fe 21 2a                    # e4ce |   mul [G], A*2, A*4 + B
ee e0 e0 f8 55 01 7c 7f 3a eb  # e4d2 |   jne [0x155], 0x7f7c, ${fail}:rel + PC
a2 3e 3e fe f6 f6              # e4dc |   shr [A*4 + -10], A*4 + -10, G
ee e0 1c f8 9e 02 14 2a eb     # e4e2 |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 20 e0 e4 39 30 de fa        # e4eb |   mul [A], 0x3039, 0xfade + A
ee e0 e0 f8 aa 00 48 81 19 eb  # e4f3 |   jne [0xaa], 0x8148, ${fail}:rel + PC
8a 2a 1c 3e 85 f6              # e4fd |   mul [A*4 + B], -123, A*4 + -10
ee e0 e0 f8 63 03 16 be 09 eb  # e503 |   jne [0x363], 0xbe16, ${fail}:rel + PC
ae 2a 1c fe 85                 # e50d |   and [A*4 + B], -123, G
ee e0 e0 f8 63 03 05 01 fa ea  # e512 |   jne [0x363], 0x105, ${fail}:rel + PC
aa e0 e0 20 39 30 39 30        # e51c |   shl [0x3039], 0x3039, A
ee e0 e0 f8 39 30 00 e4 e8 ea  # e524 |   jne [0x3039], 0xe400, ${fail}:rel + PC
8e 20 fe 2a                    # e52e |   imul [A], G, A*4 + B
ee e0 e0 f8 aa 00 df 82 da ea  # e532 |   jne [0xaa], 0x82df, ${fail}:rel + PC
86 3e 1c 3e f6 85 f6           # e53c |   sub [A*4 + -10], -123, A*4 + -10
ee e0 e0 f8 9e 02 e7 fc c9 ea  # e543 |   jne [0x29e], 0xfce7, ${fail}:rel + PC
aa 21 20 2a                    # e54d |   shl [A*2], A, A*4 + B
ee e0 e0 f8 54 01 50 05 bb ea  # e551 |   jne [0x154], 0x550, ${fail}:rel + PC
82 20 3e 21 f6                 # e55b |   add [A], A*4 + -10, A*2
ee e0 e0 f8 aa 00 f2 03 ac ea  # e560 |   jne [0xaa], 0x3f2, ${fail}:rel + PC
8a 21 fe 1c 85                 # e56a |   mul [A*2], G, -123
ee e0 e0 f8 54 01 29 5c 9d ea  # e56f |   jne [0x154], 0x5c29, ${fail}:rel + PC
8a fe 1c e0 85 39 30           # e579 |   mul [G], -123, 0x3039
ee e0 e0 f8 55 01 9d d4 8c ea  # e580 |   jne [0x155], 0xd49d, ${fail}:rel + PC
a6 e0 2a 2a 39 30              # e58a |   ishr [0x3039], A*4 + B, A*4 + B
ee e0 1c f8 39 30 6c 7c ea     # e590 |   jne [0x3039], 0x6c, ${fail}:rel + PC
82 2a 1c 21 85                 # e599 |   add [A*4 + B], -123, A*2
ee e0 e0 f8 63 03 d9 00 6e ea  # e59e |   jne [0x363], 0xd9, ${fail}:rel + PC
8a e0 e0 fe 39 30 39 30        # e5a8 |   mul [0x3039], 0x3039, G
ee e0 e0 f8 39 30 ed 3b 5c ea  # e5b0 |   jne [0x3039], 0x3bed, ${fail}:rel + PC
b2 e0 2a fe 39 30              # e5ba |   or [0x3039], A*4 + B, G
ee e0 e0 f8 39 30 77 03 4c ea  # e5c0 |   jne [0x3039], 0x377, ${fail}:rel + PC
aa 2a 1c e0 85 39 30           # e5ca |   shl [A*4 + B], -123, 0x3039
ee e0 e0 f8 63 03 00 0a 3b ea  # e5d1 |   jne [0x363], 0xa00, ${fail}:rel + PC
8a fe 1c 2a 85                 # e5db |   mul [G], -123, A*4 + B
ee e0 e0 f8 55 01 6f 5f 2c ea  # e5e0 |   jne [0x155], 0x5f6f, ${fail}:rel + PC
ae 3e e0 fe f6 39 30           # e5ea |   and [A*4 + -10], 0x3039, G
ee e0 1c f8 9e 02 11 1b ea     # e5f1 |   jne [0x29e], 0x11, ${fail}:rel + PC
a6 2a 21 e4 de fa              # e5fa |   ishr [A*4 + B], A*2, 0xfade + A
ee e0 1c f8 63 03 01 0c ea     # e600 |   jne [0x363], 0x1, ${fail}:rel + PC
b2 21 21 2a                    # e609 |   or [A*2], A*2, A*4 + B
ee e0 e0 f8 54 01 77 03 ff e9  # e60d |   jne [0x154], 0x377, ${fail}:rel + PC
ae 2a fe fe                    # e617 |   and [A*4 + B], G, G
ee e0 e0 f8 63 03 55 01 f1 e9  # e61b |   jne [0x363], 0x155, ${fail}:rel + PC
aa 2a 3e 3e f6 f6              # e625 |   shl [A*4 + B], A*4 + -10, A*4 + -10
ee e0 e0 f8 63 03 00 80 e1 e9  # e62b |   jne [0x363], 0x8000, ${fail}:rel + PC
86 3e 2a 1c f6 85              # e635 |   sub [A*4 + -10], A*4 + B, -123
ee e0 e0 f8 9e 02 de 03 d1 e9  # e63b |   jne [0x29e], 0x3de, ${fail}:rel + PC
ae fe fe 1c 85                 # e645 |   and [G], G, -123
ee e0 e0 f8 55 01 05 01 c2 e9  # e64a |   jne [0x155], 0x105, ${fail}:rel + PC
a6 21 3e 1c f6 85              # e654 |   ishr [A*2], A*4 + -10, -123
ee e0 1c f8 54 01 14 b2 e9     # e65a |   jne [0x154], 0x14, ${fail}:rel + PC
b2 e0 21 fe 39 30              # e663 |   or [0x3039], A*2, G
ee e0 e0 f8 39 30 55 01 a3 e9  # e669 |   jne [0x3039], 0x155, ${fail}:rel + PC
b2 2a 20 21                    # e673 |   or [A*4 + B], A, A*2
ee e0 e0 f8 63 03 fe 01 95 e9  # e677 |   jne [0x363], 0x1fe, ${fail}:rel + PC
a2 21 20 e0 39 30              # e681 |   shr [A*2], A, 0x3039
ee e0 00 f8 54 01 85 e9        # e687 |   jne [0x154], 0, ${fail}:rel + PC
8e 3e 3e e4 f6 f6 de fa        # e68f |   imul [A*4 + -10], A*4 + -10, 0xfade + A
ee e0 e0 f8 9e 02 f0 4d 75 e9  # e697 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
a2 2a 3e fe f6                 # e6a1 |   shr [A*4 + B], A*4 + -10, G
ee e0 1c f8 63 03 14 66 e9     # e6a6 |   jne [0x363], 0x14, ${fail}:rel + PC
aa e0 2a 1c 39 30 85           # e6af |   shl [0x3039], A*4 + B, -123
ee e0 e0 f8 39 30 60 6c 56 e9  # e6b6 |   jne [0x3039], 0x6c60, ${fail}:rel + PC
86 e0 3e 20 39 30 f6           # e6c0 |   sub [0x3039], A*4 + -10, A
ee e0 e0 f8 39 30 f4 01 45 e9  # e6c7 |   jne [0x3039], 0x1f4, ${fail}:rel + PC
86 fe 3e fe f6                 # e6d1 |   sub [G], A*4 + -10, G
ee e0 e0 f8 55 01 49 01 36 e9  # e6d6 |   jne [0x155], 0x149, ${fail}:rel + PC
b6 20 20 2a                    # e6e0 |   xor [A], A, A*4 + B
ee e0 e0 f8 aa 00 c9 03 28 e9  # e6e4 |   jne [0xaa], 0x3c9, ${fail}:rel + PC
a2 20 21 21                    # e6ee |   shr [A], A*2, A*2
ee e0 1c f8 aa 00 15 1a e9     # e6f2 |   jne [0xaa], 0x15, ${fail}:rel + PC
82 2a e0 21 39 30              # e6fb |   add [A*4 + B], 0x3039, A*2
ee e0 e0 f8 63 03 8d 31 0b e9  # e701 |   jne [0x363], 0x318d, ${fail}:rel + PC
82 fe 2a 2a                    # e70b |   add [G], A*4 + B, A*4 + B
ee e0 e0 f8 55 01 c6 06 fd e8  # e70f |   jne [0x155], 0x6c6, ${fail}:rel + PC
aa 2a 2a 3e f6                 # e719 |   shl [A*4 + B], A*4 + B, A*4 + -10
ee e0 e0 f8 63 03 00 c0 ee e8  # e71e |   jne [0x363], 0xc000, ${fail}:rel + PC
b6 3e 2a 20 f6                 # e728 |   xor [A*4 + -10], A*4 + B, A
ee e0 e0 f8 9e 02 c9 03 df e8  # e72d |   jne [0x29e], 0x3c9, ${fail}:rel + PC
8a 20 e4 1c de fa 85           # e737 |   mul [A], 0xfade + A, -123
ee e0 e0 f8 aa 00 a8 25 ce e8  # e73e |   jne [0xaa], 0x25a8, ${fail}:rel + PC
ae 3e e0 e4 f6 39 30 de fa     # e748 |   and [A*4 + -10], 0x3039, 0xfade + A
ee e0 e0 f8 9e 02 08 30 bb e8  # e751 |   jne [0x29e], 0x3008, ${fail}:rel + PC
82 20 fe 21                    # e75b |   add [A], G, A*2
ee e0 e0 f8 aa 00 a9 02 ad e8  # e75f |   jne [0xaa], 0x2a9, ${fail}:rel + PC
86 fe e4 fe de fa              # e769 |   sub [G], 0xfade + A, G
ee e0 e0 f8 55 01 33 fa 9d e8  # e76f |   jne [0x155], 0xfa33, ${fail}:rel + PC
a2 e0 3e e4 39 30 f6 de fa     # e779 |   shr [0x3039], A*4 + -10, 0xfade + A
ee e0 1c f8 39 30 02 8a e8     # e782 |   jne [0x3039], 0x2, ${fail}:rel + PC
a2 3e 21 2a f6                 # e78b |   shr [A*4 + -10], A*2, A*4 + B
ee e0 1c f8 9e 02 2a 7c e8     # e790 |   jne [0x29e], 0x2a, ${fail}:rel + PC
a2 fe 20 2a                    # e799 |   shr [G], A, A*4 + B
ee e0 1c f8 55 01 15 6f e8     # e79d |   jne [0x155], 0x15, ${fail}:rel + PC
8e 2a fe 21                    # e7a6 |   imul [A*4 + B], G, A*2
ee e0 e0 f8 63 03 e4 c4 62 e8  # e7aa |   jne [0x363], 0xc4e4, ${fail}:rel + PC
8a 3e e4 e4 f6 de fa de fa     # e7b4 |   mul [A*4 + -10], 0xfade + A, 0xfade + A
ee e0 e0 f8 9e 02 40 f8 4f e8  # e7bd |   jne [0x29e], 0xf840, ${fail}:rel + PC
82 3e 2a e0 f6 39 30           # e7c7 |   add [A*4 + -10], A*4 + B, 0x3039
ee e0 e0 f8 9e 02 9c 33 3e e8  # e7ce |   jne [0x29e], 0x339c, ${fail}:rel + PC
b6 2a fe 3e f6                 # e7d8 |   xor [A*4 + B], G, A*4 + -10
ee e0 e0 f8 63 03 cb 03 2f e8  # e7dd |   jne [0x363], 0x3cb, ${fail}:rel + PC
b6 21 e4 20 de fa              # e7e7 |   xor [A*2], 0xfade + A, A
ee e0 e0 f8 54 01 22 fb 1f e8  # e7ed |   jne [0x154], 0xfb22, ${fail}:rel + PC
a2 e0 e0 21 39 30 39 30        # e7f7 |   shr [0x3039], 0x3039, A*2
ee e0 e0 f8 39 30 03 03 0d e8  # e7ff |   jne [0x3039], 0x303, ${fail}:rel + PC
8e 2a fe e0 39 30              # e809 |   imul [A*4 + B], G, 0x3039
ee e0 e0 f8 63 03 ed 3b fd e7  # e80f |   jne [0x363], 0x3bed, ${fail}:rel + PC
b6 e0 1c 21 39 30 85           # e819 |   xor [0x3039], -123, A*2
ee e0 e0 f8 39 30 d1 fe ec e7  # e820 |   jne [0x3039], 0xfed1, ${fail}:rel + PC
86 e0 fe e4 39 30 de fa        # e82a |   sub [0x3039], G, 0xfade + A
ee e0 e0 f8 39 30 cd 05 da e7  # e832 |   jne [0x3039], 0x5cd, ${fail}:rel + PC
b6 20 21 e4 de fa              # e83c |   xor [A], A*2, 0xfade + A
ee e0 e0 f8 aa 00 dc fa ca e7  # e842 |   jne [0xaa], 0xfadc, ${fail}:rel + PC
8a 21 3e e0 f6 39 30           # e84c |   mul [A*2], A*4 + -10, 0x3039
ee e0 e0 f8 54 01 2e 35 b9 e7  # e853 |   jne [0x154], 0x352e, ${fail}:rel + PC
aa 2a 21 20                    # e85d |   shl [A*4 + B], A*2, A
ee e0 e0 f8 63 03 00 50 ab e7  # e861 |   jne [0x363], 0x5000, ${fail}:rel + PC
ae fe 1c e4 85 de fa           # e86b |   and [G], -123, 0xfade + A
ee e0 e0 f8 55 01 80 fb 9a e7  # e872 |   jne [0x155], 0xfb80, ${fail}:rel + PC
a2 20 20 21                    # e87c |   shr [A], A, A*2
ee e0 1c f8 aa 00 0a 8c e7     # e880 |   jne [0xaa], 0xa, ${fail}:rel + PC
b6 3e 20 3e f6 f6              # e889 |   xor [A*4 + -10], A, A*4 + -10
ee e0 e0 f8 9e 02 34 02 7d e7  # e88f |   jne [0x29e], 0x234, ${fail}:rel + PC
aa 3e 3e 21 f6 f6              # e899 |   shl [A*4 + -10], A*4 + -10, A*2
ee e0 e0 f8 9e 02 e0 29 6d e7  # e89f |   jne [0x29e], 0x29e0, ${fail}:rel + PC
8a 20 3e 1c f6 85              # e8a9 |   mul [A], A*4 + -10, -123
ee e0 e0 f8 aa 00 16 be 5d e7  # e8af |   jne [0xaa], 0xbe16, ${fail}:rel + PC
b2 fe fe e0 39 30              # e8b9 |   or [G], G, 0x3039
ee e0 e0 f8 55 01 7d 31 4d e7  # e8bf |   jne [0x155], 0x317d, ${fail}:rel + PC
a2 2a e4 3e de fa f6           # e8c9 |   shr [A*4 + B], 0xfade + A, A*4 + -10
ee e0 1c f8 63 03 03 3c e7     # e8d0 |   jne [0x363], 0x3, ${fail}:rel + PC
8a 2a 20 e0 39 30              # e8d9 |   mul [A*4 + B], A, 0x3039
ee e0 e0 f8 63 03 da 05 2d e7  # e8df |   jne [0x363], 0x5da, ${fail}:rel + PC
ae 3e 21 e0 f6 39 30           # e8e9 |   and [A*4 + -10], A*2, 0x3039
ee e0 1c f8 9e 02 10 1c e7     # e8f0 |   jne [0x29e], 0x10, ${fail}:rel + PC
ae e0 20 2a 39 30              # e8f9 |   and [0x3039], A, A*4 + B
ee e0 1c f8 39 30 22 0d e7     # e8ff |   jne [0x3039], 0x22, ${fail}:rel + PC
8e fe 2a fe                    # e908 |   imul [G], A*4 + B, G
ee e0 e0 f8 55 01 df 82 00 e7  # e90c |   jne [0x155], 0x82df, ${fail}:rel + PC
86 e0 fe 2a 39 30              # e916 |   sub [0x3039], G, A*4 + B
ee e0 e0 f8 39 30 f2 fd f0 e6  # e91c |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
a2 2a fe 2a                    # e926 |   shr [A*4 + B], G, A*4 + B
ee e0 1c f8 63 03 2a e2 e6     # e92a |   jne [0x363], 0x2a, ${fail}:rel + PC
b2 3e fe fe f6                 # e933 |   or [A*4 + -10], G, G
ee e0 e0 f8 9e 02 55 01 d4 e6  # e938 |   jne [0x29e], 0x155, ${fail}:rel + PC
b6 21 20 fe                    # e942 |   xor [A*2], A, G
ee e0 e0 f8 54 01 ff 01 c6 e6  # e946 |   jne [0x154], 0x1ff, ${fail}:rel + PC
a2 fe 3e 1c f6 85              # e950 |   shr [G], A*4 + -10, -123
ee e0 1c f8 55 01 14 b6 e6     # e956 |   jne [0x155], 0x14, ${fail}:rel + PC
a6 e0 fe 20 39 30              # e95f |   ishr [0x3039], G, A
ee e0 00 f8 39 30 a7 e6        # e965 |   jne [0x3039], 0, ${fail}:rel + PC
8a 21 1c e4 85 de fa           # e96d |   mul [A*2], -123, 0xfade + A
ee e0 e0 f8 54 01 a8 25 98 e6  # e974 |   jne [0x154], 0x25a8, ${fail}:rel + PC
b2 21 e4 e0 de fa 39 30        # e97e |   or [A*2], 0xfade + A, 0x3039
ee e0 e0 f8 54 01 b9 fb 86 e6  # e986 |   jne [0x154], 0xfbb9, ${fail}:rel + PC
8e 2a e0 e4 39 30 de fa        # e990 |   imul [A*4 + B], 0x3039, 0xfade + A
ee e0 e0 f8 63 03 48 81 74 e6  # e998 |   jne [0x363], 0x8148, ${fail}:rel + PC
b2 3e fe 1c f6 85              # e9a2 |   or [A*4 + -10], G, -123
ee e0 1c f8 9e 02 d5 64 e6     # e9a8 |   jne [0x29e], 0xd5, ${fail}:rel + PC
a6 3e 21 20 f6                 # e9b1 |   ishr [A*4 + -10], A*2, A
ee e0 00 f8 9e 02 56 e6        # e9b6 |   jne [0x29e], 0, ${fail}:rel + PC
ae 21 2a 1c 85                 # e9be |   and [A*2], A*4 + B, -123
ee e0 e0 f8 54 01 01 03 49 e6  # e9c3 |   jne [0x154], 0x301, ${fail}:rel + PC
b2 20 21 3e f6                 # e9cd |   or [A], A*2, A*4 + -10
ee e0 e0 f8 aa 00 de 03 3a e6  # e9d2 |   jne [0xaa], 0x3de, ${fail}:rel + PC
82 fe 3e 20 f6                 # e9dc |   add [G], A*4 + -10, A
ee e0 e0 f8 55 01 48 03 2b e6  # e9e1 |   jne [0x155], 0x348, ${fail}:rel + PC
aa 3e 20 e0 f6 39 30           # e9eb |   shl [A*4 + -10], A, 0x3039
ee e0 e0 f8 9e 02 00 54 1a e6  # e9f2 |   jne [0x29e], 0x5400, ${fail}:rel + PC
aa 20 e4 e4 de fa de fa        # e9fc |   shl [A], 0xfade + A, 0xfade + A
ee e0 e0 f8 aa 00 00 88 08 e6  # ea04 |   jne [0xaa], 0x8800, ${fail}:rel + PC
8e fe 3e e0 f6 39 30           # ea0e |   imul [G], A*4 + -10, 0x3039
ee e0 e0 f8 55 01 2e 35 f7 e5  # ea15 |   jne [0x155], 0x352e, ${fail}:rel + PC
82 e0 1c 1c 39 30 85 85        # ea1f |   add [0x3039], -123, -123
ee e0 e0 f8 39 30 0a ff e5 e5  # ea27 |   jne [0x3039], 0xff0a, ${fail}:rel + PC
86 21 3e fe f6                 # ea31 |   sub [A*2], A*4 + -10, G
ee e0 e0 f8 54 01 49 01 d6 e5  # ea36 |   jne [0x154], 0x149, ${fail}:rel + PC
a6 20 e4 fe de fa              # ea40 |   ishr [A], 0xfade + A, G
ee e0 1c f8 aa 00 dc c6 e5     # ea46 |   jne [0xaa], 0xdc, ${fail}:rel + PC
b6 20 e4 e0 de fa 39 30        # ea4f |   xor [A], 0xfade + A, 0x3039
ee e0 e0 f8 aa 00 b1 cb b5 e5  # ea57 |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
86 fe 21 e4 de fa              # ea61 |   sub [G], A*2, 0xfade + A
ee e0 e0 f8 55 01 cc 05 a5 e5  # ea67 |   jne [0x155], 0x5cc, ${fail}:rel + PC
82 2a e0 e0 39 30 39 30        # ea71 |   add [A*4 + B], 0x3039, 0x3039
ee e0 e0 f8 63 03 72 60 93 e5  # ea79 |   jne [0x363], 0x6072, ${fail}:rel + PC
86 3e 1c e4 f6 85 de fa        # ea83 |   sub [A*4 + -10], -123, 0xfade + A
ee e0 e0 f8 9e 02 fd 03 81 e5  # ea8b |   jne [0x29e], 0x3fd, ${fail}:rel + PC
82 21 21 3e f6                 # ea95 |   add [A*2], A*2, A*4 + -10
ee e0 e0 f8 54 01 f2 03 72 e5  # ea9a |   jne [0x154], 0x3f2, ${fail}:rel + PC
a2 20 e0 1c 39 30 85           # eaa4 |   shr [A], 0x3039, -123
ee e0 e0 f8 aa 00 81 01 61 e5  # eaab |   jne [0xaa], 0x181, ${fail}:rel + PC
8e 21 20 3e f6                 # eab5 |   imul [A*2], A, A*4 + -10
ee e0 e0 f8 54 01 ec bc 52 e5  # eaba |   jne [0x154], 0xbcec, ${fail}:rel + PC
b2 3e fe e4 f6 de fa           # eac4 |   or [A*4 + -10], G, 0xfade + A
ee e0 e0 f8 9e 02 dd fb 41 e5  # eacb |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
a6 fe 20 1c 85                 # ead5 |   ishr [G], A, -123
ee e0 1c f8 55 01 05 32 e5     # eada |   jne [0x155], 0x5, ${fail}:rel + PC
a6 21 20 e4 de fa              # eae3 |   ishr [A*2], A, 0xfade + A
ee e0 00 f8 54 01 23 e5        # eae9 |   jne [0x154], 0, ${fail}:rel + PC
a2 e0 1c 20 39 30 85           # eaf1 |   shr [0x3039], -123, A
ee e0 1c f8 39 30 3f 14 e5     # eaf8 |   jne [0x3039], 0x3f, ${fail}:rel + PC
8e 20 20 3e f6                 # eb01 |   imul [A], A, A*4 + -10
ee e0 e0 f8 aa 00 ec bc 06 e5  # eb06 |   jne [0xaa], 0xbcec, ${fail}:rel + PC
82 2a e4 fe de fa              # eb10 |   add [A*4 + B], 0xfade + A, G
ee e0 e0 f8 63 03 dd fc f6 e4  # eb16 |   jne [0x363], 0xfcdd, ${fail}:rel + PC
b6 fe e0 3e 39 30 f6           # eb20 |   xor [G], 0x3039, A*4 + -10
ee e0 e0 f8 55 01 a7 32 e5 e4  # eb27 |   jne [0x155], 0x32a7, ${fail}:rel + PC
8e 20 e0 2a 39 30              # eb31 |   imul [A], 0x3039, A*4 + B
ee e0 e0 f8 aa 00 0b 51 d5 e4  # eb37 |   jne [0xaa], 0x510b, ${fail}:rel + PC
b2 3e e4 fe f6 de fa           # eb41 |   or [A*4 + -10], 0xfade + A, G
ee e0 e0 f8 9e 02 dd fb c4 e4  # eb48 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
86 21 1c 21 85                 # eb52 |   sub [A*2], -123, A*2
ee e0 e0 f8 54 01 31 fe b5 e4  # eb57 |   jne [0x154], 0xfe31, ${fail}:rel + PC
b2 2a 21 21                    # eb61 |   or [A*4 + B], A*2, A*2
ee e0 e0 f8 63 03 54 01 a7 e4  # eb65 |   jne [0x363], 0x154, ${fail}:rel + PC
8e e0 20 3e 39 30 f6           # eb6f |   imul [0x3039], A, A*4 + -10
ee e0 e0 f8 39 30 ec bc 96 e4  # eb76 |   jne [0x3039], 0xbcec, ${fail}:rel + PC
a6 3e e4 2a f6 de fa           # eb80 |   ishr [A*4 + -10], 0xfade + A, A*4 + B
ee e0 e0 f8 9e 02 71 ff 85 e4  # eb87 |   jne [0x29e], 0xff71, ${fail}:rel + PC
ae e0 20 e4 39 30 de fa        # eb91 |   and [0x3039], A, 0xfade + A
ee e0 e0 f8 39 30 88 00 73 e4  # eb99 |   jne [0x3039], 0x88, ${fail}:rel + PC
a6 20 fe fe                    # eba3 |   ishr [A], G, G
ee e0 1c f8 aa 00 0a 65 e4     # eba7 |   jne [0xaa], 0xa, ${fail}:rel + PC
8e 20 3e 20 f6                 # ebb0 |   imul [A], A*4 + -10, A
ee e0 e0 f8 aa 00 ec bc 57 e4  # ebb5 |   jne [0xaa], 0xbcec, ${fail}:rel + PC
b2 e0 3e fe 39 30 f6           # ebbf |   or [0x3039], A*4 + -10, G
ee e0 e0 f8 39 30 df 03 46 e4  # ebc6 |   jne [0x3039], 0x3df, ${fail}:rel + PC
82 21 e0 e4 39 30 de fa        # ebd0 |   add [A*2], 0x3039, 0xfade + A
ee e0 e0 f8 54 01 c1 2b 34 e4  # ebd8 |   jne [0x154], 0x2bc1, ${fail}:rel + PC
82 e0 1c e4 39 30 85 de fa     # ebe2 |   add [0x3039], -123, 0xfade + A
ee e0 e0 f8 39 30 0d fb 21 e4  # ebeb |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
b2 fe 20 21                    # ebf5 |   or [G], A, A*2
ee e0 e0 f8 55 01 fe 01 13 e4  # ebf9 |   jne [0x155], 0x1fe, ${fail}:rel + PC
aa 21 2a 21                    # ec03 |   shl [A*2], A*4 + B, A*2
ee e0 e0 f8 54 01 30 36 05 e4  # ec07 |   jne [0x154], 0x3630, ${fail}:rel + PC
82 e0 2a e0 39 30 39 30        # ec11 |   add [0x3039], A*4 + B, 0x3039
ee e0 e0 f8 39 30 9c 33 f3 e3  # ec19 |   jne [0x3039], 0x339c, ${fail}:rel + PC
ae 2a 20 1c 85                 # ec23 |   and [A*4 + B], A, -123
ee e0 e0 f8 63 03 80 00 e4 e3  # ec28 |   jne [0x363], 0x80, ${fail}:rel + PC
b6 e0 20 1c 39 30 85           # ec32 |   xor [0x3039], A, -123
ee e0 e0 f8 39 30 2f ff d3 e3  # ec39 |   jne [0x3039], 0xff2f, ${fail}:rel + PC
ae 21 fe e0 39 30              # ec43 |   and [A*2], G, 0x3039
ee e0 1c f8 54 01 11 c3 e3     # ec49 |   jne [0x154], 0x11, ${fail}:rel + PC
ae 3e fe 3e f6 f6              # ec52 |   and [A*4 + -10], G, A*4 + -10
ee e0 1c f8 9e 02 14 b4 e3     # ec58 |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 3e 2a 2a f6                 # ec61 |   mul [A*4 + -10], A*4 + B, A*4 + B
ee e0 e0 f8 9e 02 49 78 a6 e3  # ec66 |   jne [0x29e], 0x7849, ${fail}:rel + PC
82 20 3e e0 f6 39 30           # ec70 |   add [A], A*4 + -10, 0x3039
ee e0 e0 f8 aa 00 d7 32 95 e3  # ec77 |   jne [0xaa], 0x32d7, ${fail}:rel + PC
82 21 e0 3e 39 30 f6           # ec81 |   add [A*2], 0x3039, A*4 + -10
ee e0 e0 f8 54 01 d7 32 84 e3  # ec88 |   jne [0x154], 0x32d7, ${fail}:rel + PC
b6 21 3e 3e f6 f6              # ec92 |   xor [A*2], A*4 + -10, A*4 + -10
ee e0 00 f8 54 01 74 e3        # ec98 |   jne [0x154], 0, ${fail}:rel + PC
a6 e0 20 20 39 30              # eca0 |   ishr [0x3039], A, A
ee e0 00 f8 39 30 66 e3        # eca6 |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e0 3e 39 30 39 30 f6     # ecae |   ishr [0x3039], 0x3039, A*4 + -10
ee e0 00 f8 39 30 55 e3        # ecb7 |   jne [0x3039], 0, ${fail}:rel + PC
aa 20 1c 21 85                 # ecbf |   shl [A], -123, A*2
ee e0 e0 f8 aa 00 50 f8 48 e3  # ecc4 |   jne [0xaa], 0xf850, ${fail}:rel + PC
ae e0 21 e4 39 30 de fa        # ecce |   and [0x3039], A*2, 0xfade + A
ee e0 e0 f8 39 30 00 01 36 e3  # ecd6 |   jne [0x3039], 0x100, ${fail}:rel + PC
b2 3e 1c 20 f6 85              # ece0 |   or [A*4 + -10], -123, A
ee e0 1c f8 9e 02 af 26 e3     # ece6 |   jne [0x29e], 0xaf, ${fail}:rel + PC
8e 21 1c 20 85                 # ecef |   imul [A*2], -123, A
ee e0 e0 f8 54 01 52 ae 18 e3  # ecf4 |   jne [0x154], 0xae52, ${fail}:rel + PC
8a 2a 2a 2a                    # ecfe |   mul [A*4 + B], A*4 + B, A*4 + B
ee e0 e0 f8 63 03 49 78 0a e3  # ed02 |   jne [0x363], 0x7849, ${fail}:rel + PC
86 2a 2a e0 39 30              # ed0c |   sub [A*4 + B], A*4 + B, 0x3039
ee e0 e0 f8 63 03 2a d3 fa e2  # ed12 |   jne [0x363], 0xd32a, ${fail}:rel + PC
ae fe 1c 21 85                 # ed1c |   and [G], -123, A*2
ee e0 e0 f8 55 01 04 01 eb e2  # ed21 |   jne [0x155], 0x104, ${fail}:rel + PC
8e 21 e4 1c de fa 85           # ed2b |   imul [A*2], 0xfade + A, -123
ee e0 e0 f8 54 01 a8 25 da e2  # ed32 |   jne [0x154], 0x25a8, ${fail}:rel + PC
8a 21 21 e4 de fa              # ed3c |   mul [A*2], A*2, 0xfade + A
ee e0 e0 f8 54 01 a0 10 ca e2  # ed42 |   jne [0x154], 0x10a0, ${fail}:rel + PC
86 fe e0 fe 39 30              # ed4c |   sub [G], 0x3039, G
ee e0 e0 f8 55 01 e4 2e ba e2  # ed52 |   jne [0x155], 0x2ee4, ${fail}:rel + PC
62 20 1c 85                    # ed5c |   mov [A], -123
ee e0 1c f8 aa 00 85 ac e2     # ed60 |   jne [0xaa], 0x85, ${fail}:rel + PC
62 3e 3e f6 f6                 # ed69 |   mov [A*4 + -10], A*4 + -10
ee e0 e0 f8 9e 02 9e 02 9e e2  # ed6e |   jne [0x29e], 0x29e, ${fail}:rel + PC
62 21 2a                       # ed78 |   mov [A*2], A*4 + B
ee e0 e0 f8 54 01 63 03 91 e2  # ed7b |   jne [0x154], 0x363, ${fail}:rel + PC
62 e0 1c 39 30 85              # ed85 |   mov [0x3039], -123
ee e0 1c f8 39 30 85 81 e2     # ed8b |   jne [0x3039], 0x85, ${fail}:rel + PC
62 fe 3e f6                    # ed94 |   mov [G], A*4 + -10
ee e0 e0 f8 55 01 9e 02 74 e2  # ed98 |   jne [0x155], 0x29e, ${fail}:rel + PC
62 e0 fe 39 30                 # eda2 |   mov [0x3039], G
ee e0 e0 f8 39 30 55 01 65 e2  # eda7 |   jne [0x3039], 0x155, ${fail}:rel + PC
62 fe 21                       # edb1 |   mov [G], A*2
ee e0 e0 f8 55 01 54 01 58 e2  # edb4 |   jne [0x155], 0x154, ${fail}:rel + PC
62 3e e4 f6 de fa              # edbe |   mov [A*4 + -10], 0xfade + A
ee e0 e0 f8 9e 02 88 fb 48 e2  # edc4 |   jne [0x29e], 0xfb88, ${fail}:rel + PC
62 e0 e0 39 30 39 30           # edce |   mov [0x3039], 0x3039
ee e0 e0 f8 39 30 39 30 37 e2  # edd5 |   jne [0x3039], 0x3039, ${fail}:rel + PC
62 3e fe f6                    # eddf |   mov [A*4 + -10], G
ee e0 e0 f8 9e 02 55 01 29 e2  # ede3 |   jne [0x29e], 0x155, ${fail}:rel + PC
62 20 fe                       # eded |   mov [A], G
ee e0 e0 f8 aa 00 55 01 1c e2  # edf0 |   jne [0xaa], 0x155, ${fail}:rel + PC
62 2a 2a                       # edfa |   mov [A*4 + B], A*4 + B
ee e0 e0 f8 63 03 63 03 0f e2  # edfd |   jne [0x363], 0x363, ${fail}:rel + PC
62 3e 2a f6                    # ee07 |   mov [A*4 + -10], A*4 + B
ee e0 e0 f8 9e 02 63 03 01 e2  # ee0b |   jne [0x29e], 0x363, ${fail}:rel + PC
62 2a 20                       # ee15 |   mov [A*4 + B], A
ee e0 e0 f8 63 03 aa 00 f4 e1  # ee18 |   jne [0x363], 0xaa, ${fail}:rel + PC
62 3e 20 f6                    # ee22 |   mov [A*4 + -10], A
ee e0 e0 f8 9e 02 aa 00 e6 e1  # ee26 |   jne [0x29e], 0xaa, ${fail}:rel + PC
62 20 20                       # ee30 |   mov [A], A
ee e0 e0 f8 aa 00 aa 00 d9 e1  # ee33 |   jne [0xaa], 0xaa, ${fail}:rel + PC
62 2a e4 de fa                 # ee3d |   mov [A*4 + B], 0xfade + A
ee e0 e0 f8 63 03 88 fb ca e1  # ee42 |   jne [0x363], 0xfb88, ${fail}:rel + PC
62 21 1c 85                    # ee4c |   mov [A*2], -123
ee e0 1c f8 54 01 85 bc e1     # ee50 |   jne [0x154], 0x85, ${fail}:rel + PC
62 2a e0 39 30                 # ee59 |   mov [A*4 + B], 0x3039
ee e0 e0 f8 63 03 39 30 ae e1  # ee5e |   jne [0x363], 0x3039, ${fail}:rel + PC
62 3e 1c f6 85                 # ee68 |   mov [A*4 + -10], -123
ee e0 1c f8 9e 02 85 9f e1     # ee6d |   jne [0x29e], 0x85, ${fail}:rel + PC
62 3e 21 f6                    # ee76 |   mov [A*4 + -10], A*2
ee e0 e0 f8 9e 02 54 01 92 e1  # ee7a |   jne [0x29e], 0x154, ${fail}:rel + PC
62 21 3e f6                    # ee84 |   mov [A*2], A*4 + -10
ee e0 e0 f8 54 01 9e 02 84 e1  # ee88 |   jne [0x154], 0x29e, ${fail}:rel + PC
62 e0 21 39 30                 # ee92 |   mov [0x3039], A*2
ee e0 e0 f8 39 30 54 01 75 e1  # ee97 |   jne [0x3039], 0x154, ${fail}:rel + PC
62 21 fe                       # eea1 |   mov [A*2], G
ee e0 e0 f8 54 01 55 01 68 e1  # eea4 |   jne [0x154], 0x155, ${fail}:rel + PC
62 2a fe                       # eeae |   mov [A*4 + B], G
ee e0 e0 f8 63 03 55 01 5b e1  # eeb1 |   jne [0x363], 0x155, ${fail}:rel + PC
62 21 e4 de fa                 # eebb |   mov [A*2], 0xfade + A
ee e0 e0 f8 54 01 88 fb 4c e1  # eec0 |   jne [0x154], 0xfb88, ${fail}:rel + PC
62 20 3e f6                    # eeca |   mov [A], A*4 + -10
ee e0 e0 f8 aa 00 9e 02 3e e1  # eece |   jne [0xaa], 0x29e, ${fail}:rel + PC
62 e0 3e 39 30 f6              # eed8 |   mov [0x3039], A*4 + -10
ee e0 e0 f8 39 30 9e 02 2e e1  # eede |   jne [0x3039], 0x29e, ${fail}:rel + PC
62 2a 3e f6                    # eee8 |   mov [A*4 + B], A*4 + -10
ee e0 e0 f8 63 03 9e 02 20 e1  # eeec |   jne [0x363], 0x29e, ${fail}:rel + PC
62 e0 e4 39 30 de fa           # eef6 |   mov [0x3039], 0xfade + A
ee e0 e0 f8 39 30 88 fb 0f e1  # eefd |   jne [0x3039], 0xfb88, ${fail}:rel + PC
62 21 e0 39 30                 # ef07 |   mov [A*2], 0x3039
ee e0 e0 f8 54 01 39 30 00 e1  # ef0c |   jne [0x154], 0x3039, ${fail}:rel + PC
62 fe 1c 85                    # ef16 |   mov [G], -123
ee e0 1c f8 55 01 85 f2 e0     # ef1a |   jne [0x155], 0x85, ${fail}:rel + PC
62 e0 2a 39 30                 # ef23 |   mov [0x3039], A*4 + B
ee e0 e0 f8 39 30 63 03 e4 e0  # ef28 |   jne [0x3039], 0x363, ${fail}:rel + PC
62 fe e4 de fa                 # ef32 |   mov [G], 0xfade + A
ee e0 e0 f8 55 01 88 fb d5 e0  # ef37 |   jne [0x155], 0xfb88, ${fail}:rel + PC
62 20 e0 39 30                 # ef41 |   mov [A], 0x3039
ee e0 e0 f8 aa 00 39 30 c6 e0  # ef46 |   jne [0xaa], 0x3039, ${fail}:rel + PC
62 20 21                       # ef50 |   mov [A], A*2
ee e0 e0 f8 aa 00 54 01 b9 e0  # ef53 |   jne [0xaa], 0x154, ${fail}:rel + PC
62 3e e0 f6 39 30              # ef5d |   mov [A*4 + -10], 0x3039
ee e0 e0 f8 9e 02 39 30 a9 e0  # ef63 |   jne [0x29e], 0x3039, ${fail}:rel + PC
62 fe 20                       # ef6d |   mov [G], A
ee e0 e0 f8 55 01 aa 00 9c e0  # ef70 |   jne [0x155], 0xaa, ${fail}:rel + PC
62 21 20                       # ef7a |   mov [A*2], A
ee e0 e0 f8 54 01 aa 00 8f e0  # ef7d |   jne [0x154], 0xaa, ${fail}:rel + PC
62 fe fe                       # ef87 |   mov [G], G
ee e0 e0 f8 55 01 55 01 82 e0  # ef8a |   jne [0x155], 0x155, ${fail}:rel + PC
62 20 2a                       # ef94 |   mov [A], A*4 + B
ee e0 e0 f8 aa 00 63 03 75 e0  # ef97 |   jne [0xaa], 0x363, ${fail}:rel + PC
62 2a 1c 85                    # efa1 |   mov [A*4 + B], -123
ee e0 1c f8 63 03 85 67 e0     # efa5 |   jne [0x363], 0x85, ${fail}:rel + PC
62 2a 21                       # efae |   mov [A*4 + B], A*2
ee e0 e0 f8 63 03 54 01 5b e0  # efb1 |   jne [0x363], 0x154, ${fail}:rel + PC
62 e0 20 39 30                 # efbb |   mov [0x3039], A
ee e0 e0 f8 39 30 aa 00 4c e0  # efc0 |   jne [0x3039], 0xaa, ${fail}:rel + PC
62 fe e0 39 30                 # efca |   mov [G], 0x3039
ee e0 e0 f8 55 01 39 30 3d e0  # efcf |   jne [0x155], 0x3039, ${fail}:rel + PC
62 21 21                       # efd9 |   mov [A*2], A*2
ee e0 e0 f8 54 01 54 01 30 e0  # efdc |   jne [0x154], 0x154, ${fail}:rel + PC
62 fe 2a                       # efe6 |   mov [G], A*4 + B
ee e0 e0 f8 55 01 63 03 23 e0  # efe9 |   jne [0x155], 0x363, ${fail}:rel + PC
62 20 e4 de fa                 # eff3 |   mov [A], 0xfade + A
ee e0 e0 f8 aa 00 88 fb 14 e0  # eff8 |   jne [0xaa], 0xfb88, ${fail}:rel + PC
e0 2a                          # f002 |   push A*4 + B
e4 80                          # f004 |   pop D
ec 80 e0 f8 63 03 06 e0        # f006 |   jne D, 0x363, ${fail}:rel + PC
e0 1c 85                       # f00e |   push -123
e4 80                          # f011 |   pop D
ec 80 1c f8 85 f9 df           # f013 |   jne D, 0x85, ${fail}:rel + PC
e0 fe                          # f01a |   push G
e4 80                          # f01c |   pop D
ec 80 e0 f8 55 01 ee df        # f01e |   jne D, 0x155, ${fail}:rel + PC
e0 3e f6                       # f026 |   push A*4 + -10
e4 80                          # f029 |   pop D
ec 80 e0 f8 9e 02 e1 df        # f02b |   jne D, 0x29e, ${fail}:rel + PC
e0 20                          # f033 |   push A
e4 80                          # f035 |   pop D
ec 80 e0 f8 aa 00 d5 df        # f037 |   jne D, 0xaa, ${fail}:rel + PC
e0 e4 de fa                    # f03f |   push 0xfade + A
e4 80                          # f043 |   pop D
ec 80 e0 f8 88 fb c7 df        # f045 |   jne D, 0xfb88, ${fail}:rel + PC
e0 21                          # f04d |   push A*2
e4 80                          # f04f |   pop D
ec 80 e0 f8 54 01 bb df        # f051 |   jne D, 0x154, ${fail}:rel + PC
e0 e0 39 30                    # f059 |   push 0x3039
e4 80                          # f05d |   pop D
ec 80 e0 f8 39 30 ad df        # f05f |   jne D, 0x3039, ${fail}:rel + PC
5c f8 10 00                    # f067 |   call ${_L_test_uop_get_arg_1}:rel + PC
ec 60 e0 f8 fe ad a1 df        # f06b |   jne C, 0xadfe, ${fail}:rel + PC
58 f8 0e 00                    # f073 |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                               #      | _L_test_uop_get_arg_1:
60 60 e0 fe ad                 # f077 |   mov C, 0xadfe
dc                             # f07c |   ret
58 f8 8f df                    # f07d |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_get_arg_2:
                               #      | test_uop_alu_2dd:
60 20 e0 cd ab                 # f081 |   mov A, 0xabcd
00 20 e0 ab cd                 # f086 |   add A, 0xcdab
ec 20 e0 f8 78 79 81 df        # f08b |   jne A, 0x7978, ${fail}:rel + PC
                               #      | test_uop_alu_2di:
60 20 e0 00 10                 # f093 |   mov A, 0x1000
62 e0 e0 00 10 bc 0a           # f098 |   mov [0x1000], 0xabc
01 20 20                       # f09f |   add A, [A]
ec 20 e0 f8 bc 1a 6a df        # f0a2 |   jne A, 0x1abc, ${fail}:rel + PC
                               #      | test_uop_alu_2id:
62 e0 e0 00 10 34 12           # f0aa |   mov [0x1000], 0x1234
02 e0 e0 00 10 21 43           # f0b1 |   add [0x1000], 0x4321
61 20 e0 00 10                 # f0b8 |   mov A, [0x1000]
ec 20 e0 f8 55 55 4f df        # f0bd |   jne A, 0x5555, ${fail}:rel + PC
                               #      | test_uop_alu_2ii:
62 e0 e0 00 10 34 12           # f0c5 |   mov [0x1000], 0x1234
62 e0 e0 05 10 aa aa           # f0cc |   mov [0x1005], 0xaaaa
03 e0 e0 05 10 00 10           # f0d3 |   add [0x1005], [0x1000]
ee e0 e0 f8 05 10 de bc 32 df  # f0da |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                               #      | test_uop_alu_3dd:
60 20 e0 fe ab                 # f0e4 |   mov A, 0xabfe
60 40 e0 55 55                 # f0e9 |   mov B, 0x5555
80 60 20 40                    # f0ee |   add C, A, B
ec 20 e0 f8 fe ab 1a df        # f0f2 |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 12 df        # f0fa |   jne B, 0x5555, ${fail}:rel + PC
ec 60 e0 f8 53 01 0a df        # f102 |   jne C, 0x153, ${fail}:rel + PC
                               #      | test_uop_alu_3di:
62 e0 e0 00 10 aa 12           # f10a |   mov [0x1000], 0x12aa
60 40 e0 de fa                 # f111 |   mov B, 0xfade
b5 20 e0 40 00 10              # f116 |   xor A, [0x1000], B
ee e0 e0 f8 00 10 aa 12 f0 de  # f11c |   jne [0x1000], 0x12aa, ${fail}:rel + PC
ec 40 e0 f8 de fa e6 de        # f126 |   jne B, 0xfade, ${fail}:rel + PC
ec 20 e0 f8 74 e8 de de        # f12e |   jne A, 0xe874, ${fail}:rel + PC
                               #      | test_uop_alu_3id:
60 20 e0 fe ab                 # f136 |   mov A, 0xabfe
60 40 e0 55 55                 # f13b |   mov B, 0x5555
86 e0 20 40 00 10              # f140 |   sub [0x1000], A, B
ec 20 e0 f8 fe ab c6 de        # f146 |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 be de        # f14e |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 00 10 a9 56 b6 de  # f156 |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                               #      | test_uop_alu_3ii:
62 e0 e0 00 10 fe ab           # f160 |   mov [0x1000], 0xabfe
60 40 e0 55 55                 # f167 |   mov B, 0x5555
af e0 e0 40 02 10 00 10        # f16c |   and [0x1002], [0x1000], B
ee e0 e0 f8 00 10 fe ab 98 de  # f174 |   jne [0x1000], 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 8e de        # f17e |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 02 10 54 01 86 de  # f186 |   jne [0x1002], 0x154, ${fail}:rel + PC
                               #      | test_uop_alu_single_1dx:
60 20 e0 00 ff                 # f190 |   mov A, 0xff00
3c 20                          # f195 |   not A
ec 20 e0 f8 ff 00 75 de        # f197 |   jne A, 0xff, ${fail}:rel + PC
                               #      | test_uop_alu_single_1ix:
62 1c e0 64 34 12              # f19f |   mov [0x64], 0x1234
3a 1c 64                       # f1a5 |   neg [0x64]
ee 1c e0 f8 64 cc ed 64 de     # f1a8 |   jne [0x64], 0xedcc, ${fail}:rel + PC
                               #      | test_uop_alu_single_2dd:
60 40 e0 ff 00                 # f1b1 |   mov B, 0xff
bc 20 40                       # f1b6 |   not A, B
ec 40 e0 f8 ff 00 53 de        # f1b9 |   jne B, 0xff, ${fail}:rel + PC
ec 20 e0 f8 00 ff 4b de        # f1c1 |   jne A, 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2di:
62 1c e0 64 34 12              # f1c9 |   mov [0x64], 0x1234
bd 20 1c 64                    # f1cf |   not A, [0x64]
ee 1c e0 f8 64 34 12 39 de     # f1d3 |   jne [0x64], 0x1234, ${fail}:rel + PC
ec 20 e0 f8 cb ed 30 de        # f1dc |   jne A, 0xedcb, ${fail}:rel + PC
                               #      | test_uop_alu_single_2id:
60 40 e0 ff 00                 # f1e4 |   mov B, 0xff
be 1c 40 64                    # f1e9 |   not [0x64], B
ec 40 e0 f8 ff 00 1f de        # f1ed |   jne B, 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff 17 de     # f1f5 |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2ii:
62 1c e0 66 ff 00              # f1fe |   mov [0x66], 0xff
bf 1c 1c 64 66                 # f204 |   not [0x64], [0x66]
ee 1c e0 f8 66 ff 00 03 de     # f209 |   jne [0x66], 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff fa dd     # f212 |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_cmp_dd:
60 40 1c 7b                    # f21b |   mov B, 0x7b
50 40 e0 c8 01                 # f21f |   cmp B, 0x1c8
4c 20                          # f224 |   getf A
ec 40 1c f8 7b e6 dd           # f226 |   jne B, 0x7b, ${fail}:rel + PC
ec 20 1c f8 0e df dd           # f22d |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_di:
62 1c 1c 64 85                 # f234 |   mov [0x64], -123
60 40 e0 c8 01                 # f239 |   mov B, 0x1c8
d1 40 1c 64                    # f23e |   icmp B, [0x64]
4c 20                          # f242 |   getf A
ec 40 e0 f8 c8 01 c8 dd        # f244 |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 32 c0 dd           # f24c |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_cmp_id:
62 1c 1c 64 85                 # f253 |   mov [0x64], -123
60 40 e0 c8 01                 # f258 |   mov B, 0x1c8
d2 1c 40 64                    # f25d |   icmp [0x64], B
4c 20                          # f261 |   getf A
ec 40 e0 f8 c8 01 a9 dd        # f263 |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 0e a1 dd           # f26b |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_ii:
62 1c 1c 64 85                 # f272 |   mov [0x64], -123
62 1c e0 66 38 fe              # f277 |   mov [0x66], 0xfe38
d3 1c 1c 64 66                 # f27d |   icmp [0x64], [0x66]
4c 20                          # f282 |   getf A
ee 1c 1c f8 64 85 88 dd        # f284 |   jne [0x64], -123, ${fail}:rel + PC
ee 1c e0 f8 66 38 fe 80 dd     # f28c |   jne [0x66], 0xfe38, ${fail}:rel + PC
ec 20 1c f8 32 77 dd           # f295 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_jmp_d:
60 20 e0 a7 f2                 # f29c |   mov A, ${_L_test_uop_jmp_d_okay}
58 20                          # f2a1 |   jmp A
58 f8 69 dd                    # f2a3 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_d_okay:
                               #      | test_uop_jmp_i:
62 1c e0 64 b4 f2              # f2a7 |   mov [0x64], ${_L_test_uop_jmp_i_okay}
5a 1c 64                       # f2ad |   jmp [0x64]
58 f8 5c dd                    # f2b0 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_i_okay:
ee 1c e0 f8 64 b4 f2 58 dd     # f2b4 |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_i:
62 1c e0 64 d3 f2              # f2bd |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
50 1c 1c 01 02                 # f2c3 |   cmp 0x1, 0x2
68 f8 44 dd                    # f2c8 |   jeq ${fail}:rel + PC
6e 1c 64                       # f2cc |   jne [0x64]
58 f8 3d dd                    # f2cf |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_i_okay:
ee 1c e0 f8 64 d3 f2 39 dd     # f2d3 |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_d:
60 20 e0 f0 f2                 # f2dc |   mov A, ${_L_test_uop_jmp_cond_d_okay}
50 1c 1c 01 01                 # f2e1 |   cmp 0x1, 0x1
6c f8 26 dd                    # f2e6 |   jne ${fail}:rel + PC
68 20                          # f2ea |   jeq A
58 f8 20 dd                    # f2ec |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_d_okay:
ec 20 e0 f8 f0 f2 1c dd        # f2f0 |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_3dd:
60 20 1c 7b                    # f2f8 |   mov A, 0x7b
ec 20 1c f8 7b 10 dd           # f2fc |   jne A, 0x7b, ${fail}:rel + PC
e8 20 1c f8 7b 0b 00           # f303 |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
58 f8 02 dd                    # f30a |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3dd_okay:
ec 20 1c f8 7b fe dc           # f30e |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_jmp_3di:
60 20 1c 7b                    # f315 |   mov A, 0x7b
62 1c e0 64 41 01              # f319 |   mov [0x64], 0x141
e9 20 1c f8 64 ed dc           # f31f |   jeq A, [0x64], ${fail}:rel + PC
ed 20 1c f8 64 0b 00           # f326 |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
58 f8 df dc                    # f32d |   jmp ${fail}:rel + PC
                               #      | test_uop_jmp_3di_okay:
ec 20 1c f8 7b db dc           # f331 |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 d4 dc     # f338 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3id:
60 20 1c 7b                    # f341 |   mov A, 0x7b
62 1c e0 64 41 01              # f345 |   mov [0x64], 0x141
ea 1c 20 f8 64 c1 dc           # f34b |   jeq [0x64], A, ${fail}:rel + PC
ee 1c 20 f8 64 0b 00           # f352 |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
58 f8 b3 dc                    # f359 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3id_okay:
ec 20 1c f8 7b af dc           # f35d |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 a8 dc     # f364 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3ii:
62 e0 1c c8 00 7b              # f36d |   mov [0xc8], 0x7b
62 1c e0 64 41 01              # f373 |   mov [0x64], 0x141
eb 1c e0 f8 64 c8 00 93 dc     # f379 |   jeq [0x64], [0xc8], ${fail}:rel + PC
ef 1c e0 f8 64 c8 00 0d 00     # f382 |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
58 f8 81 dc                    # f38b |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3ii_okay:
ee e0 1c f8 c8 00 7b 7d dc     # f38f |   jne [0xc8], 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 74 dc     # f398 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_mov_dd:
60 20 1c 7b                    # f3a1 |   mov A, 0x7b
ec 20 1c f8 7b 67 dc           # f3a5 |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_mov_di:
62 1c 1c 64 da                 # f3ac |   mov [0x64], 0xda
61 20 1c 64                    # f3b1 |   mov A, [0x64]
ec 20 1c f8 da 57 dc           # f3b5 |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_mov_id:
62 1c 1c 64 ff                 # f3bc |   mov [0x64], 0xff
ee 1c 1c f8 64 ff 4b dc        # f3c1 |   jne [0x64], 0xff, ${fail}:rel + PC
                               #      | test_uop_mov_ii:
60 20 1c 14                    # f3c9 |   mov A, 0x14
62 1c e0 78 fa fd              # f3cd |   mov [0x78], 0xfdfa
63 1c 3c 64 64                 # f3d3 |   mov [0x64], [A + 0x64]
ee 1c e0 f8 64 fa fd 34 dc     # f3d8 |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                               #      | test_uop_bmov_dd:
64 20 e0 de af                 # f3e1 |   bmov A, 0xafde
ec 20 e0 f8 de 00 26 dc        # f3e6 |   jne A, 0xde, ${fail}:rel + PC
64 20 e0 fa 00                 # f3ee |   bmov A, 0xfa
ec 20 e0 f8 fa 00 19 dc        # f3f3 |   jne A, 0xfa, ${fail}:rel + PC
                               #      | test_uop_bmov_di:
62 1c 1c 64 da                 # f3fb |   mov [0x64], 0xda
65 20 1c 64                    # f400 |   bmov A, [0x64]
ec 20 e0 f8 da 00 08 dc        # f404 |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_bmov_id:
62 1c e0 64 cd ab              # f40c |   mov [0x64], 0xabcd
62 1c e0 66 34 12              # f412 |   mov [0x66], 0x1234
62 1c e0 68 78 56              # f418 |   mov [0x68], 0x5678
66 1c e0 66 df 00              # f41e |   bmov [0x66], 0xdf
ee 1c e0 f8 64 cd ab e8 db     # f424 |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df 12 df db     # f42d |   jne [0x66], 0x12df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 d6 db     # f436 |   jne [0x68], 0x5678, ${fail}:rel + PC
66 1c e0 67 b8 00              # f43f |   bmov [0x67], 0xb8
ee 1c e0 f8 64 cd ab c7 db     # f445 |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df b8 be db     # f44e |   jne [0x66], 0xb8df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 b5 db     # f457 |   jne [0x68], 0x5678, ${fail}:rel + PC
                               #      | test_uop_bmov_ii:
62 e0 e0 2c 01 df 00           # f460 |   mov [0x12c], 0xdf
62 e0 e0 2e 01 b8 00           # f467 |   mov [0x12e], 0xb8
62 e0 e0 c8 00 cd ab           # f46e |   mov [0xc8], 0xabcd
62 e0 e0 ca 00 34 12           # f475 |   mov [0xca], 0x1234
62 e0 e0 cc 00 78 56           # f47c |   mov [0xcc], 0x5678
67 e0 e0 ca 00 2c 01           # f483 |   bmov [0xca], [0x12c]
ee e0 e0 f8 c8 00 cd ab 82 db  # f48a |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df 12 78 db  # f494 |   jne [0xca], 0x12df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 6e db  # f49e |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 64 db  # f4a8 |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 5a db  # f4b2 |   jne [0x12e], 0xb8, ${fail}:rel + PC
67 e0 e0 cb 00 2e 01           # f4bc |   bmov [0xcb], [0x12e]
ee e0 e0 f8 c8 00 cd ab 49 db  # f4c3 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df b8 3f db  # f4cd |   jne [0xca], 0xb8df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 35 db  # f4d7 |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 2b db  # f4e1 |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 21 db  # f4eb |   jne [0x12e], 0xb8, ${fail}:rel + PC
                               #      | test_uop_halt:
                               #      | test_uop_getf:
50 1c 1c 7b 2d                 # f4f5 |   cmp 0x7b, 0x2d
4c 20                          # f4fa |   getf A
ec 20 1c f8 32 10 db           # f4fc |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_setf:
cc 1c ff                       # f503 |   setf 0xff
4c 20                          # f506 |   getf A
ec 20 1c f8 3f 04 db           # f508 |   jne A, 0x3f, ${fail}:rel + PC
                               #      | test_uop_call_d:
60 a0 e0 00 10                 # f50f |   mov SP, 0x1000
60 40 e0 2f f5                 # f514 |   mov B, ${_L_test_uop_call_d_fn}
5c 40                          # f519 |   call B
ec 40 e0 f8 2f f5 f1 da        # f51b |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
ec 20 e0 f8 fa 34 e9 da        # f523 |   jne A, 0x34fa, ${fail}:rel + PC
58 f8 0a 00                    # f52b |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                               #      | _L_test_uop_call_d_fn:
60 20 e0 fa 34                 # f52f |   mov A, 0x34fa
dc                             # f534 |   ret
                               #      | _L_test_uop_call_d_okay:
                               #      | test_uop_call_i:
60 a0 e0 00 10                 # f535 |   mov SP, 0x1000
60 40 1c 64                    # f53a |   mov B, 0x64
62 40 e0 59 f5                 # f53e |   mov [B], ${_L_test_uop_call_i_fn}
5e 40                          # f543 |   call [B]
ee 40 e0 f8 59 f5 c7 da        # f545 |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
ec 20 e0 f8 d4 aa bf da        # f54d |   jne A, 0xaad4, ${fail}:rel + PC
58 f8 0a 00                    # f555 |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                               #      | _L_test_uop_call_i_fn:
60 20 e0 d4 aa                 # f559 |   mov A, 0xaad4
dc                             # f55e |   ret
                               #      | _L_test_uop_call_i_okay:
                               #      | test_uop_ret:
                               #      | test_uop_push_d:
60 a0 e0 00 10                 # f55f |   mov SP, 0x1000
60 40 1c 64                    # f564 |   mov B, 0x64
e0 40                          # f568 |   push B
ec a0 e0 f8 fe 0f a2 da        # f56a |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 1c f8 fe 0f 64 9a da     # f572 |   jne [0xffe], 0x64, ${fail}:rel + PC
e4 60                          # f57b |   pop C
ec 60 1c f8 64 8f da           # f57d |   jne C, 0x64, ${fail}:rel + PC
                               #      | test_uop_push_i:
60 a0 e0 00 10                 # f584 |   mov SP, 0x1000
60 40 1c 64                    # f589 |   mov B, 0x64
62 40 e0 90 01                 # f58d |   mov [B], 0x190
e2 40                          # f592 |   push [B]
ec a0 e0 f8 fe 0f 78 da        # f594 |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 90 01 70 da  # f59c |   jne [0xffe], 0x190, ${fail}:rel + PC
e4 60                          # f5a6 |   pop C
ec 60 e0 f8 90 01 64 da        # f5a8 |   jne C, 0x190, ${fail}:rel + PC
                               #      | test_uop_pop_d:
60 a0 e0 00 10                 # f5b0 |   mov SP, 0x1000
e0 e0 da fa                    # f5b5 |   push 0xfada
e4 20                          # f5b9 |   pop A
ec 20 e0 f8 da fa 51 da        # f5bb |   jne A, 0xfada, ${fail}:rel + PC
                               #      | test_uop_pop_i:
60 a0 e0 00 10                 # f5c3 |   mov SP, 0x1000
e0 e0 da f2                    # f5c8 |   push 0xf2da
e6 1c 64                       # f5cc |   pop [0x64]
ee 1c e0 f8 64 da f2 3d da     # f5cf |   jne [0x64], 0xf2da, ${fail}:rel + PC
                               #      | test_uop_mmap:
62 e0 e0 00 30 00 ff           # f5d8 |   mov [0x3000], 0xff00
62 e0 e0 00 31 01 ff           # f5df |   mov [0x3100], 0xff01
62 e0 e0 00 32 02 ff           # f5e6 |   mov [0x3200], 0xff02
62 e0 e0 00 40 00 dd           # f5ed |   mov [0x4000], 0xdd00
62 e0 e0 00 41 01 dd           # f5f4 |   mov [0x4100], 0xdd01
62 e0 e0 00 42 02 dd           # f5fb |   mov [0x4200], 0xdd02
62 e0 e0 00 50 00 ee           # f602 |   mov [0x5000], 0xee00
62 e0 e0 00 51 01 ee           # f609 |   mov [0x5100], 0xee01
62 e0 e0 00 52 02 ee           # f610 |   mov [0x5200], 0xee02
60 20 00                       # f617 |   mov A, 0
60 40 e0 00 41                 # f61a |   mov B, 0x4100
54 e0 e0 1c 00 31 ff 32 01     # f61f |   mmap 0x3100, 0x32ff, 0x1
ee e0 e0 f8 00 31 01 dd e4 d9  # f628 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 dd da d9  # f632 |   jne [0x3200], 0xdd02, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff d0 d9  # f63c |   jne [0x3000], 0xff00, ${fail}:rel + PC
60 40 e0 00 51                 # f646 |   mov B, 0x5100
54 e0 e0 1c 00 32 ff 32 02     # f64b |   mmap 0x3200, 0x32ff, 0x2
ee e0 e0 f8 00 32 01 ee b8 d9  # f654 |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff ae d9  # f65e |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 dd a4 d9  # f668 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
d4 1c 01                       # f672 |   umap 0x1
ee e0 e0 f8 00 31 01 ff 97 d9  # f675 |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 01 ee 8d d9  # f67f |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff 83 d9  # f689 |   jne [0x3000], 0xff00, ${fail}:rel + PC
d4 1c 02                       # f693 |   umap 0x2
ee e0 e0 f8 00 30 00 ff 76 d9  # f696 |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 ff 6c d9  # f6a0 |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 ff 62 d9  # f6aa |   jne [0x3200], 0xff02, ${fail}:rel + PC
                               #      | test_uop_umap:
                               #      | test_aux_reg:
60 20 1c 01                    # f6b4 |   mov A, 0x1
60 40 1c 02                    # f6b8 |   mov B, 0x2
60 60 1c 03                    # f6bc |   mov C, 0x3
60 80 1c 04                    # f6c0 |   mov D, 0x4
60 fc 1c 05                    # f6c4 |   mov E, 0x5
60 fd 1c 06                    # f6c8 |   mov F, 0x6
60 fe 1c 07                    # f6cc |   mov G, 0x7
60 ff 1c 08                    # f6d0 |   mov H, 0x8
ec 20 1c f8 01 38 d9           # f6d4 |   jne A, 0x1, ${fail}:rel + PC
ec 40 1c f8 02 31 d9           # f6db |   jne B, 0x2, ${fail}:rel + PC
ec 60 1c f8 03 2a d9           # f6e2 |   jne C, 0x3, ${fail}:rel + PC
ec 80 1c f8 04 23 d9           # f6e9 |   jne D, 0x4, ${fail}:rel + PC
ec fc 1c f8 05 1c d9           # f6f0 |   jne E, 0x5, ${fail}:rel + PC
ec fd 1c f8 06 15 d9           # f6f7 |   jne F, 0x6, ${fail}:rel + PC
ec fe 1c f8 07 0e d9           # f6fe |   jne G, 0x7, ${fail}:rel + PC
ec ff 1c f8 08 07 d9           # f705 |   jne H, 0x8, ${fail}:rel + PC
34 ff e0 00 ff                 # f70c |   xor H, 0xff00
ec ff e0 f8 08 ff fb d8        # f711 |   jne H, 0xff08, ${fail}:rel + PC
60 20 ff                       # f719 |   mov A, H
ec 20 e0 f8 08 ff f0 d8        # f71c |   jne A, 0xff08, ${fail}:rel + PC
60 fc fe                       # f724 |   mov E, G
ec fc 1c f8 07 e5 d8           # f727 |   jne E, 0x7, ${fail}:rel + PC
ec ff e0 f8 08 ff de d8        # f72e |   jne H, 0xff08, ${fail}:rel + PC
                               #      | test_call_ret:
60 a0 e0 00 10                 # f736 |   mov SP, 0x1000
5c f8 77 00                    # f73b |   call ${fn_test_target}:rel + PC
ec a0 e0 f8 00 10 cd d8        # f73f |   jne SP, 0x1000, ${fail}:rel + PC
60 20 1c 0a                    # f747 |   mov A, 0xa
60 40 00                       # f74b |   mov B, 0
60 60 00                       # f74e |   mov C, 0
60 80 00                       # f751 |   mov D, 0
5c f8 2d 00                    # f754 |   call ${fn_recursive}:rel + PC
ec 20 00 f8 b4 d8              # f758 |   jne A, 0, ${fail}:rel + PC
ec 40 e0 f8 3f cf ae d8        # f75e |   jne B, 0xcf3f, ${fail}:rel + PC
ec 60 1c f8 2d a6 d8           # f766 |   jne C, 0x2d, ${fail}:rel + PC
ec 80 e0 f8 97 45 9f d8        # f76d |   jne D, 0x4597, ${fail}:rel + PC
ec a0 e0 f8 00 10 97 d8        # f775 |   jne SP, 0x1000, ${fail}:rel + PC
58 f8 42 00                    # f77d |   jmp ${test_call_ret_end}:rel + PC
                               #      | fn_recursive:
04 20 1c 01                    # f781 |   sub A, 0x1
5c f8 25 00                    # f785 |   call ${fn_process_c}:rel + PC
e8 20 00 f8 1c 00              # f789 |   jeq A, 0, ${fn_recursive_end}:rel + PC
5c f8 f2 ff                    # f78f |   call ${fn_recursive}:rel + PC
00 80 60                       # f793 |   add D, C
08 80 1c 03                    # f796 |   mul D, 0x3
00 40 80                       # f79a |   add B, D
e0 80                          # f79d |   push D
08 40 1c 05                    # f79f |   mul B, 0x5
e4 80                          # f7a3 |   pop D
                               #      | fn_recursive_end:
dc                             # f7a5 |   ret
58 f8 66 d8                    # f7a6 |   jmp ${fail}:rel + PC
                               #      | fn_process_c:
00 60 20                       # f7aa |   add C, A
dc                             # f7ad |   ret
58 f8 5e d8                    # f7ae |   jmp ${fail}:rel + PC
                               #      | fn_test_target:
ec a0 e0 f8 fe 0f 5a d8        # f7b2 |   jne SP, 0xffe, ${fail}:rel + PC
dc                             # f7ba |   ret
58 f8 51 d8                    # f7bb |   jmp ${fail}:rel + PC
                               #      | test_call_ret_end:
                               #      | test_mem_access:
62 e0 1c 00 01 ed              # f7bf |   mov [0x100], 0xed
ee e0 e0 f8 00 01 aa 00 0e 00  # f7c5 |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
58 f8 3d d8                    # f7cf |   jmp ${fail}:rel + PC
                               #      | test_mem_access_check_jmp:
62 e0 00 00 10                 # f7d3 |   mov [0x1000], 0
60 a0 e0 00 10                 # f7d8 |   mov SP, 0x1000
ee a0 00 f8 2f d8              # f7dd |   jne [SP], 0, ${fail}:rel + PC
e0 00                          # f7e3 |   push 0
e0 00                          # f7e5 |   push 0
e0 00                          # f7e7 |   push 0
e4 20                          # f7e9 |   pop A
e4 20                          # f7eb |   pop A
e4 20                          # f7ed |   pop A
ec a0 e0 f8 00 10 1d d8        # f7ef |   jne SP, 0x1000, ${fail}:rel + PC
ec 20 00 f8 15 d8              # f7f7 |   jne A, 0, ${fail}:rel + PC
e0 e0 02 01                    # f7fd |   push 0x102
ec a0 e0 f8 fe 0f 0b d8        # f801 |   jne SP, 0xffe, ${fail}:rel + PC
e0 e0 04 03                    # f809 |   push 0x304
ec a0 e0 f8 fc 0f ff d7        # f80d |   jne SP, 0xffc, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 02 01 f7 d7  # f815 |   jne [0xffe], 0x102, ${fail}:rel + PC
ee e0 e0 f8 fc 0f 04 03 ed d7  # f81f |   jne [0xffc], 0x304, ${fail}:rel + PC
ee e0 e0 f8 fb 0f 00 04 e3 d7  # f829 |   jne [0xffb], 0x400, ${fail}:rel + PC
ee e0 e0 f8 fd 0f 03 02 d9 d7  # f833 |   jne [0xffd], 0x203, ${fail}:rel + PC
ee e0 1c f8 ff 0f 01 cf d7     # f83d |   jne [0xfff], 0x1, ${fail}:rel + PC
e4 20                          # f846 |   pop A
ec 20 e0 f8 04 03 c4 d7        # f848 |   jne A, 0x304, ${fail}:rel + PC
ec a0 e0 f8 fe 0f bc d7        # f850 |   jne SP, 0xffe, ${fail}:rel + PC
e4 20                          # f858 |   pop A
ec 20 e0 f8 02 01 b2 d7        # f85a |   jne A, 0x102, ${fail}:rel + PC
ec a0 e0 f8 00 10 aa d7        # f862 |   jne SP, 0x1000, ${fail}:rel + PC
                               #      | test_cmp:
cc 1c ff                       # f86a |   setf 0xff
4c 20                          # f86d |   getf A
ec 20 1c f8 3f 9d d7           # f86f |   jne A, 0x3f, ${fail}:rel + PC
cc e0 ab ab                    # f876 |   setf 0xabab
4c 20                          # f87a |   getf A
ec 20 1c f8 2b 90 d7           # f87c |   jne A, 0x2b, ${fail}:rel + PC
50 1c 1c ab 2b                 # f883 |   cmp 0xab, 0x2b
4c 20                          # f888 |   getf A
ec 20 1c f8 32 82 d7           # f88a |   jne A, 0x32, ${fail}:rel + PC
50 1c 1c 2b ab                 # f891 |   cmp 0x2b, 0xab
4c 20                          # f896 |   getf A
ec 20 1c f8 0e 74 d7           # f898 |   jne A, 0xe, ${fail}:rel + PC
50 1c 1c ab ab                 # f89f |   cmp 0xab, 0xab
4c 20                          # f8a4 |   getf A
ec 20 1c f8 29 66 d7           # f8a6 |   jne A, 0x29, ${fail}:rel + PC
d0 1c 1c ab 2b                 # f8ad |   icmp 0xab, 0x2b
4c 20                          # f8b2 |   getf A
ec 20 1c f8 0e 58 d7           # f8b4 |   jne A, 0xe, ${fail}:rel + PC
d0 1c 1c 2b ab                 # f8bb |   icmp 0x2b, 0xab
4c 20                          # f8c0 |   getf A
ec 20 1c f8 32 4a d7           # f8c2 |   jne A, 0x32, ${fail}:rel + PC
d0 1c 1c ab ab                 # f8c9 |   icmp 0xab, 0xab
4c 20                          # f8ce |   getf A
ec 20 1c f8 29 3c d7           # f8d0 |   jne A, 0x29, ${fail}:rel + PC
                               #      | end_of_test:
60 20 e0 ad de                 # f8d7 |   mov A, 0xdead
60 40 e0 ef be                 # f8dc |   mov B, 0xbeef
88 60 20 40                    # f8e1 |   mul C, A, B
58 f8 2c d7                    # f8e5 |   jmp ${success}:rel + PC
dc                             # f8e9 |   ret
                               #      | end_fn_self_test:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x0000
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
