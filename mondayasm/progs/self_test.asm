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
                               #      | jmp_test:
e8 1c 1c f8 ab 2b f6 fb        # d43f |   jeq 0xab, 0x2b, ${fail}:rel + PC
ec 1c 1c f8 ab 2b 0c 00        # d447 |   jne 0xab, 0x2b, ${_L_test_jmp_1}:rel + PC
58 f8 e6 fb                    # d44f |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_1:
f0 1c 1c f8 ab 2b e2 fb        # d453 |   jlt 0xab, 0x2b, ${fail}:rel + PC
f4 1c 1c f8 ab 2b da fb        # d45b |   jle 0xab, 0x2b, ${fail}:rel + PC
f8 1c 1c f8 ab 2b 0c 00        # d463 |   jgt 0xab, 0x2b, ${_L_test_jmp_2}:rel + PC
58 f8 ca fb                    # d46b |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_2:
fc 1c 1c f8 ab 2b 0c 00        # d46f |   jge 0xab, 0x2b, ${_L_test_jmp_3}:rel + PC
58 f8 be fb                    # d477 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_3:
50 1c 1c ab 2b                 # d47b |   cmp 0xab, 0x2b
68 f8 b5 fb                    # d480 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d484 |   jne ${_L_test_jmp_4}:rel + PC
58 f8 ad fb                    # d488 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_4:
70 f8 a9 fb                    # d48c |   jlt ${fail}:rel + PC
74 f8 a5 fb                    # d490 |   jle ${fail}:rel + PC
78 f8 08 00                    # d494 |   jgt ${_L_test_jmp_5}:rel + PC
58 f8 9d fb                    # d498 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_5:
7c f8 08 00                    # d49c |   jge ${_L_test_jmp_6}:rel + PC
58 f8 95 fb                    # d4a0 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_6:
d0 1c 1c ab 2b                 # d4a4 |   icmp 0xab, 0x2b
68 f8 8c fb                    # d4a9 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d4ad |   jne ${_L_test_jmp_7}:rel + PC
58 f8 84 fb                    # d4b1 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_7:
70 f8 08 00                    # d4b5 |   jlt ${_L_test_jmp_8}:rel + PC
58 f8 7c fb                    # d4b9 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_8:
74 f8 08 00                    # d4bd |   jle ${_L_test_jmp_9}:rel + PC
58 f8 74 fb                    # d4c1 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_9:
78 f8 70 fb                    # d4c5 |   jgt ${fail}:rel + PC
7c f8 6c fb                    # d4c9 |   jge ${fail}:rel + PC
e8 1c 1c f8 2b ab 68 fb        # d4cd |   jeq 0x2b, 0xab, ${fail}:rel + PC
ec 1c 1c f8 2b ab 0c 00        # d4d5 |   jne 0x2b, 0xab, ${_L_test_jmp_10}:rel + PC
58 f8 58 fb                    # d4dd |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_10:
f0 1c 1c f8 2b ab 0c 00        # d4e1 |   jlt 0x2b, 0xab, ${_L_test_jmp_11}:rel + PC
58 f8 4c fb                    # d4e9 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_11:
f4 1c 1c f8 2b ab 0c 00        # d4ed |   jle 0x2b, 0xab, ${_L_test_jmp_12}:rel + PC
58 f8 40 fb                    # d4f5 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_12:
f8 1c 1c f8 2b ab 3c fb        # d4f9 |   jgt 0x2b, 0xab, ${fail}:rel + PC
fc 1c 1c f8 2b ab 34 fb        # d501 |   jge 0x2b, 0xab, ${fail}:rel + PC
50 1c 1c 2b ab                 # d509 |   cmp 0x2b, 0xab
68 f8 27 fb                    # d50e |   jeq ${fail}:rel + PC
6c f8 08 00                    # d512 |   jne ${_L_test_jmp_13}:rel + PC
58 f8 1f fb                    # d516 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_13:
70 f8 08 00                    # d51a |   jlt ${_L_test_jmp_14}:rel + PC
58 f8 17 fb                    # d51e |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_14:
74 f8 08 00                    # d522 |   jle ${_L_test_jmp_15}:rel + PC
58 f8 0f fb                    # d526 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_15:
78 f8 0b fb                    # d52a |   jgt ${fail}:rel + PC
7c f8 07 fb                    # d52e |   jge ${fail}:rel + PC
d0 1c 1c 2b ab                 # d532 |   icmp 0x2b, 0xab
68 f8 fe fa                    # d537 |   jeq ${fail}:rel + PC
6c f8 08 00                    # d53b |   jne ${_L_test_jmp_16}:rel + PC
58 f8 f6 fa                    # d53f |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_16:
70 f8 f2 fa                    # d543 |   jlt ${fail}:rel + PC
74 f8 ee fa                    # d547 |   jle ${fail}:rel + PC
78 f8 08 00                    # d54b |   jgt ${_L_test_jmp_17}:rel + PC
58 f8 e6 fa                    # d54f |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_17:
7c f8 08 00                    # d553 |   jge ${_L_test_jmp_18}:rel + PC
58 f8 de fa                    # d557 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_18:
e8 1c 1c f8 ab ab 0c 00        # d55b |   jeq 0xab, 0xab, ${_L_test_jmp_19}:rel + PC
58 f8 d2 fa                    # d563 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_19:
ec 1c 1c f8 ab ab ce fa        # d567 |   jne 0xab, 0xab, ${fail}:rel + PC
f0 1c 1c f8 ab ab c6 fa        # d56f |   jlt 0xab, 0xab, ${fail}:rel + PC
f4 1c 1c f8 ab ab 0c 00        # d577 |   jle 0xab, 0xab, ${_L_test_jmp_20}:rel + PC
58 f8 b6 fa                    # d57f |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_20:
f8 1c 1c f8 ab ab b2 fa        # d583 |   jgt 0xab, 0xab, ${fail}:rel + PC
fc 1c 1c f8 ab ab 0c 00        # d58b |   jge 0xab, 0xab, ${_L_test_jmp_21}:rel + PC
58 f8 a2 fa                    # d593 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_21:
50 1c 1c ab ab                 # d597 |   cmp 0xab, 0xab
68 f8 08 00                    # d59c |   jeq ${_L_test_jmp_22}:rel + PC
58 f8 95 fa                    # d5a0 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_22:
6c f8 91 fa                    # d5a4 |   jne ${fail}:rel + PC
70 f8 8d fa                    # d5a8 |   jlt ${fail}:rel + PC
74 f8 08 00                    # d5ac |   jle ${_L_test_jmp_23}:rel + PC
58 f8 85 fa                    # d5b0 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_23:
78 f8 81 fa                    # d5b4 |   jgt ${fail}:rel + PC
7c f8 08 00                    # d5b8 |   jge ${_L_test_jmp_24}:rel + PC
58 f8 79 fa                    # d5bc |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_24:
d0 1c 1c ab ab                 # d5c0 |   icmp 0xab, 0xab
68 f8 08 00                    # d5c5 |   jeq ${_L_test_jmp_25}:rel + PC
58 f8 6c fa                    # d5c9 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_25:
6c f8 68 fa                    # d5cd |   jne ${fail}:rel + PC
70 f8 64 fa                    # d5d1 |   jlt ${fail}:rel + PC
74 f8 08 00                    # d5d5 |   jle ${_L_test_jmp_26}:rel + PC
58 f8 5c fa                    # d5d9 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_26:
78 f8 58 fa                    # d5dd |   jgt ${fail}:rel + PC
7c f8 08 00                    # d5e1 |   jge ${_L_test_jmp_27}:rel + PC
58 f8 50 fa                    # d5e5 |   jmp ${fail}:rel + PC
                               #      | _L_test_jmp_27:
                               #      | test_uop_get_arg:
60 a0 e0 00 70                 # d5e9 |   mov SP, 0x7000
60 20 e0 aa 00                 # d5ee |   mov A, 0xaa
60 40 e0 bb 00                 # d5f3 |   mov B, 0xbb
60 fe e0 55 01                 # d5f8 |   mov G, 0x155
b6 e0 1c fe 39 30 85           # d5fd |   xor [0x3039], -123, G
ee e0 e0 f8 39 30 d0 fe 31 fa  # d604 |   jne [0x3039], 0xfed0, ${fail}:rel + PC
ae 3e fe 21 f6                 # d60e |   and [A*4 + -10], G, A*2
ee e0 e0 f8 9e 02 54 01 22 fa  # d613 |   jne [0x29e], 0x154, ${fail}:rel + PC
86 21 e4 3e de fa f6           # d61d |   sub [A*2], 0xfade + A, A*4 + -10
ee e0 e0 f8 54 01 ea f8 11 fa  # d624 |   jne [0x154], 0xf8ea, ${fail}:rel + PC
a6 e0 20 21 39 30              # d62e |   ishr [0x3039], A, A*2
ee e0 1c f8 39 30 0a 01 fa     # d634 |   jne [0x3039], 0xa, ${fail}:rel + PC
aa fe 2a 3e f6                 # d63d |   shl [G], A*4 + B, A*4 + -10
ee e0 e0 f8 55 01 00 c0 f3 f9  # d642 |   jne [0x155], 0xc000, ${fail}:rel + PC
b2 fe 1c fe 85                 # d64c |   or [G], -123, G
ee e0 1c f8 55 01 d5 e4 f9     # d651 |   jne [0x155], 0xd5, ${fail}:rel + PC
8a 2a 1c 20 85                 # d65a |   mul [A*4 + B], -123, A
ee e0 e0 f8 63 03 52 ae d6 f9  # d65f |   jne [0x363], 0xae52, ${fail}:rel + PC
a6 e0 e0 2a 39 30 39 30        # d669 |   ishr [0x3039], 0x3039, A*4 + B
ee e0 e0 f8 39 30 07 06 c4 f9  # d671 |   jne [0x3039], 0x607, ${fail}:rel + PC
a2 21 e4 21 de fa              # d67b |   shr [A*2], 0xfade + A, A*2
ee e0 e0 f8 54 01 b8 0f b4 f9  # d681 |   jne [0x154], 0xfb8, ${fail}:rel + PC
82 21 fe fe                    # d68b |   add [A*2], G, G
ee e0 e0 f8 54 01 aa 02 a6 f9  # d68f |   jne [0x154], 0x2aa, ${fail}:rel + PC
a6 fe e4 20 de fa              # d699 |   ishr [G], 0xfade + A, A
ee e0 1c f8 55 01 fe 96 f9     # d69f |   jne [0x155], 0xfe, ${fail}:rel + PC
82 e0 e4 2a 39 30 de fa        # d6a8 |   add [0x3039], 0xfade + A, A*4 + B
ee e0 e0 f8 39 30 eb fe 85 f9  # d6b0 |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
a6 20 20 20                    # d6ba |   ishr [A], A, A
ee e0 00 f8 aa 00 77 f9        # d6be |   jne [0xaa], 0, ${fail}:rel + PC
82 fe 2a 20                    # d6c6 |   add [G], A*4 + B, A
ee e0 e0 f8 55 01 0d 04 6b f9  # d6ca |   jne [0x155], 0x40d, ${fail}:rel + PC
b6 fe fe fe                    # d6d4 |   xor [G], G, G
ee e0 00 f8 55 01 5d f9        # d6d8 |   jne [0x155], 0, ${fail}:rel + PC
aa 21 fe 21                    # d6e0 |   shl [A*2], G, A*2
ee e0 e0 f8 54 01 50 15 51 f9  # d6e4 |   jne [0x154], 0x1550, ${fail}:rel + PC
a6 fe e0 21 39 30              # d6ee |   ishr [G], 0x3039, A*2
ee e0 e0 f8 55 01 03 03 41 f9  # d6f4 |   jne [0x155], 0x303, ${fail}:rel + PC
ae 21 2a e4 de fa              # d6fe |   and [A*2], A*4 + B, 0xfade + A
ee e0 e0 f8 54 01 00 03 31 f9  # d704 |   jne [0x154], 0x300, ${fail}:rel + PC
82 20 3e 3e f6 f6              # d70e |   add [A], A*4 + -10, A*4 + -10
ee e0 e0 f8 aa 00 3c 05 21 f9  # d714 |   jne [0xaa], 0x53c, ${fail}:rel + PC
b2 e0 21 1c 39 30 85           # d71e |   or [0x3039], A*2, -123
ee e0 1c f8 39 30 d5 10 f9     # d725 |   jne [0x3039], 0xd5, ${fail}:rel + PC
82 e0 fe fe 39 30              # d72e |   add [0x3039], G, G
ee e0 e0 f8 39 30 aa 02 01 f9  # d734 |   jne [0x3039], 0x2aa, ${fail}:rel + PC
ae fe e0 e4 39 30 de fa        # d73e |   and [G], 0x3039, 0xfade + A
ee e0 e0 f8 55 01 08 30 ef f8  # d746 |   jne [0x155], 0x3008, ${fail}:rel + PC
8e e0 2a 3e 39 30 f6           # d750 |   imul [0x3039], A*4 + B, A*4 + -10
ee e0 e0 f8 39 30 1a dd de f8  # d757 |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
b2 21 e0 20 39 30              # d761 |   or [A*2], 0x3039, A
ee e0 e0 f8 54 01 bb 30 ce f8  # d767 |   jne [0x154], 0x30bb, ${fail}:rel + PC
8e 21 3e 21 f6                 # d771 |   imul [A*2], A*4 + -10, A*2
ee e0 e0 f8 54 01 d8 79 bf f8  # d776 |   jne [0x154], 0x79d8, ${fail}:rel + PC
82 3e 1c 2a f6 85              # d780 |   add [A*4 + -10], -123, A*4 + B
ee e0 e0 f8 9e 02 e8 02 af f8  # d786 |   jne [0x29e], 0x2e8, ${fail}:rel + PC
86 fe e4 21 de fa              # d790 |   sub [G], 0xfade + A, A*2
ee e0 e0 f8 55 01 34 fa 9f f8  # d796 |   jne [0x155], 0xfa34, ${fail}:rel + PC
b2 2a e4 21 de fa              # d7a0 |   or [A*4 + B], 0xfade + A, A*2
ee e0 e0 f8 63 03 dc fb 8f f8  # d7a6 |   jne [0x363], 0xfbdc, ${fail}:rel + PC
ae 21 21 20                    # d7b0 |   and [A*2], A*2, A
ee e0 00 f8 54 01 81 f8        # d7b4 |   jne [0x154], 0, ${fail}:rel + PC
86 2a 2a fe                    # d7bc |   sub [A*4 + B], A*4 + B, G
ee e0 e0 f8 63 03 0e 02 75 f8  # d7c0 |   jne [0x363], 0x20e, ${fail}:rel + PC
82 3e 3e 20 f6 f6              # d7ca |   add [A*4 + -10], A*4 + -10, A
ee e0 e0 f8 9e 02 48 03 65 f8  # d7d0 |   jne [0x29e], 0x348, ${fail}:rel + PC
86 21 e0 e0 39 30 39 30        # d7da |   sub [A*2], 0x3039, 0x3039
ee e0 00 f8 54 01 53 f8        # d7e2 |   jne [0x154], 0, ${fail}:rel + PC
a2 20 1c fe 85                 # d7ea |   shr [A], -123, G
ee e0 e0 f8 aa 00 fc 07 46 f8  # d7ef |   jne [0xaa], 0x7fc, ${fail}:rel + PC
aa 2a 1c 2a 85                 # d7f9 |   shl [A*4 + B], -123, A*4 + B
ee e0 e0 f8 63 03 28 fc 37 f8  # d7fe |   jne [0x363], 0xfc28, ${fail}:rel + PC
b2 2a 20 20                    # d808 |   or [A*4 + B], A, A
ee e0 e0 f8 63 03 aa 00 29 f8  # d80c |   jne [0x363], 0xaa, ${fail}:rel + PC
86 20 20 1c 85                 # d816 |   sub [A], A, -123
ee e0 e0 f8 aa 00 25 01 1a f8  # d81b |   jne [0xaa], 0x125, ${fail}:rel + PC
a6 3e e4 21 f6 de fa           # d825 |   ishr [A*4 + -10], 0xfade + A, A*2
ee e0 1c f8 9e 02 b8 09 f8     # d82c |   jne [0x29e], 0xb8, ${fail}:rel + PC
86 20 e0 e0 39 30 39 30        # d835 |   sub [A], 0x3039, 0x3039
ee e0 00 f8 aa 00 f8 f7        # d83d |   jne [0xaa], 0, ${fail}:rel + PC
82 fe e0 e0 39 30 39 30        # d845 |   add [G], 0x3039, 0x3039
ee e0 e0 f8 55 01 72 60 e8 f7  # d84d |   jne [0x155], 0x6072, ${fail}:rel + PC
a2 2a e4 e4 de fa de fa        # d857 |   shr [A*4 + B], 0xfade + A, 0xfade + A
ee e0 e0 f8 63 03 fb 00 d6 f7  # d85f |   jne [0x363], 0xfb, ${fail}:rel + PC
8e 20 20 fe                    # d869 |   imul [A], A, G
ee e0 e0 f8 aa 00 72 e2 c8 f7  # d86d |   jne [0xaa], 0xe272, ${fail}:rel + PC
a2 21 e4 2a de fa              # d877 |   shr [A*2], 0xfade + A, A*4 + B
ee e0 e0 f8 54 01 71 1f b8 f7  # d87d |   jne [0x154], 0x1f71, ${fail}:rel + PC
a2 2a 2a 1c 85                 # d887 |   shr [A*4 + B], A*4 + B, -123
ee e0 1c f8 63 03 1b a9 f7     # d88c |   jne [0x363], 0x1b, ${fail}:rel + PC
a2 20 21 2a                    # d895 |   shr [A], A*2, A*4 + B
ee e0 1c f8 aa 00 2a 9c f7     # d899 |   jne [0xaa], 0x2a, ${fail}:rel + PC
ae e0 2a 20 39 30              # d8a2 |   and [0x3039], A*4 + B, A
ee e0 1c f8 39 30 22 8d f7     # d8a8 |   jne [0x3039], 0x22, ${fail}:rel + PC
a2 e0 e0 e0 39 30 39 30 39 30  # d8b1 |   shr [0x3039], 0x3039, 0x3039
ee e0 1c f8 39 30 18 7a f7     # d8bb |   jne [0x3039], 0x18, ${fail}:rel + PC
8a 20 fe 3e f6                 # d8c4 |   mul [A], G, A*4 + -10
ee e0 e0 f8 aa 00 76 7c 6c f7  # d8c9 |   jne [0xaa], 0x7c76, ${fail}:rel + PC
82 2a e0 2a 39 30              # d8d3 |   add [A*4 + B], 0x3039, A*4 + B
ee e0 e0 f8 63 03 9c 33 5c f7  # d8d9 |   jne [0x363], 0x339c, ${fail}:rel + PC
8e fe 3e 2a f6                 # d8e3 |   imul [G], A*4 + -10, A*4 + B
ee e0 e0 f8 55 01 1a dd 4d f7  # d8e8 |   jne [0x155], 0xdd1a, ${fail}:rel + PC
aa 20 21 e0 39 30              # d8f2 |   shl [A], A*2, 0x3039
ee e0 e0 f8 aa 00 00 a8 3d f7  # d8f8 |   jne [0xaa], 0xa800, ${fail}:rel + PC
82 21 fe 20                    # d902 |   add [A*2], G, A
ee e0 e0 f8 54 01 ff 01 2f f7  # d906 |   jne [0x154], 0x1ff, ${fail}:rel + PC
82 2a 2a 21                    # d910 |   add [A*4 + B], A*4 + B, A*2
ee e0 e0 f8 63 03 b7 04 21 f7  # d914 |   jne [0x363], 0x4b7, ${fail}:rel + PC
a2 20 fe e4 de fa              # d91e |   shr [A], G, 0xfade + A
ee e0 1c f8 aa 00 01 11 f7     # d924 |   jne [0xaa], 0x1, ${fail}:rel + PC
82 fe 1c 20 85                 # d92d |   add [G], -123, A
ee e0 1c f8 55 01 2f 03 f7     # d932 |   jne [0x155], 0x2f, ${fail}:rel + PC
8e 3e fe e0 f6 39 30           # d93b |   imul [A*4 + -10], G, 0x3039
ee e0 e0 f8 9e 02 ed 3b f3 f6  # d942 |   jne [0x29e], 0x3bed, ${fail}:rel + PC
8a fe e4 2a de fa              # d94c |   mul [G], 0xfade + A, A*4 + B
ee e0 e0 f8 55 01 98 dd e3 f6  # d952 |   jne [0x155], 0xdd98, ${fail}:rel + PC
a2 fe fe 20                    # d95c |   shr [G], G, A
ee e0 00 f8 55 01 d5 f6        # d960 |   jne [0x155], 0, ${fail}:rel + PC
b2 21 20 20                    # d968 |   or [A*2], A, A
ee e0 e0 f8 54 01 aa 00 c9 f6  # d96c |   jne [0x154], 0xaa, ${fail}:rel + PC
b2 3e 1c 21 f6 85              # d976 |   or [A*4 + -10], -123, A*2
ee e0 1c f8 9e 02 d5 b9 f6     # d97c |   jne [0x29e], 0xd5, ${fail}:rel + PC
8a 2a 1c 1c 85 85              # d985 |   mul [A*4 + B], -123, -123
ee e0 e0 f8 63 03 19 3b aa f6  # d98b |   jne [0x363], 0x3b19, ${fail}:rel + PC
8a e0 e4 21 39 30 de fa        # d995 |   mul [0x3039], 0xfade + A, A*2
ee e0 e0 f8 39 30 a0 10 98 f6  # d99d |   jne [0x3039], 0x10a0, ${fail}:rel + PC
86 fe 20 3e f6                 # d9a7 |   sub [G], A, A*4 + -10
ee e0 e0 f8 55 01 0c fe 89 f6  # d9ac |   jne [0x155], 0xfe0c, ${fail}:rel + PC
aa 20 2a 21                    # d9b6 |   shl [A], A*4 + B, A*2
ee e0 e0 f8 aa 00 30 36 7b f6  # d9ba |   jne [0xaa], 0x3630, ${fail}:rel + PC
b6 21 1c 2a 85                 # d9c4 |   xor [A*2], -123, A*4 + B
ee e0 e0 f8 54 01 e6 fc 6c f6  # d9c9 |   jne [0x154], 0xfce6, ${fail}:rel + PC
86 2a 3e 1c f6 85              # d9d3 |   sub [A*4 + B], A*4 + -10, -123
ee e0 e0 f8 63 03 19 03 5c f6  # d9d9 |   jne [0x363], 0x319, ${fail}:rel + PC
86 e0 e0 e4 39 30 39 30 de fa  # d9e3 |   sub [0x3039], 0x3039, 0xfade + A
ee e0 e0 f8 39 30 b1 34 48 f6  # d9ed |   jne [0x3039], 0x34b1, ${fail}:rel + PC
ae fe 2a e4 de fa              # d9f7 |   and [G], A*4 + B, 0xfade + A
ee e0 e0 f8 55 01 00 03 38 f6  # d9fd |   jne [0x155], 0x300, ${fail}:rel + PC
aa 20 3e fe f6                 # da07 |   shl [A], A*4 + -10, G
ee e0 e0 f8 aa 00 c0 53 29 f6  # da0c |   jne [0xaa], 0x53c0, ${fail}:rel + PC
a6 fe fe e4 de fa              # da16 |   ishr [G], G, 0xfade + A
ee e0 1c f8 55 01 01 19 f6     # da1c |   jne [0x155], 0x1, ${fail}:rel + PC
ae 21 e0 2a 39 30              # da25 |   and [A*2], 0x3039, A*4 + B
ee e0 1c f8 54 01 21 0a f6     # da2b |   jne [0x154], 0x21, ${fail}:rel + PC
a6 21 21 1c 85                 # da34 |   ishr [A*2], A*2, -123
ee e0 1c f8 54 01 0a fc f5     # da39 |   jne [0x154], 0xa, ${fail}:rel + PC
b6 fe 21 e0 39 30              # da42 |   xor [G], A*2, 0x3039
ee e0 e0 f8 55 01 6d 31 ed f5  # da48 |   jne [0x155], 0x316d, ${fail}:rel + PC
86 2a 3e 2a f6                 # da52 |   sub [A*4 + B], A*4 + -10, A*4 + B
ee e0 e0 f8 63 03 3b ff de f5  # da57 |   jne [0x363], 0xff3b, ${fail}:rel + PC
b2 e0 fe 1c 39 30 85           # da61 |   or [0x3039], G, -123
ee e0 1c f8 39 30 d5 cd f5     # da68 |   jne [0x3039], 0xd5, ${fail}:rel + PC
aa 2a 3e 20 f6                 # da71 |   shl [A*4 + B], A*4 + -10, A
ee e0 e0 f8 63 03 00 78 bf f5  # da76 |   jne [0x363], 0x7800, ${fail}:rel + PC
86 e0 21 20 39 30              # da80 |   sub [0x3039], A*2, A
ee e0 e0 f8 39 30 aa 00 af f5  # da86 |   jne [0x3039], 0xaa, ${fail}:rel + PC
b6 e0 2a 21 39 30              # da90 |   xor [0x3039], A*4 + B, A*2
ee e0 e0 f8 39 30 37 02 9f f5  # da96 |   jne [0x3039], 0x237, ${fail}:rel + PC
ae 2a e0 1c 39 30 85           # daa0 |   and [A*4 + B], 0x3039, -123
ee e0 e0 f8 63 03 01 30 8e f5  # daa7 |   jne [0x363], 0x3001, ${fail}:rel + PC
8e fe 2a e0 39 30              # dab1 |   imul [G], A*4 + B, 0x3039
ee e0 e0 f8 55 01 0b 51 7e f5  # dab7 |   jne [0x155], 0x510b, ${fail}:rel + PC
b2 2a 20 fe                    # dac1 |   or [A*4 + B], A, G
ee e0 e0 f8 63 03 ff 01 70 f5  # dac5 |   jne [0x363], 0x1ff, ${fail}:rel + PC
a6 3e e0 20 f6 39 30           # dacf |   ishr [A*4 + -10], 0x3039, A
ee e0 1c f8 9e 02 0c 5f f5     # dad6 |   jne [0x29e], 0xc, ${fail}:rel + PC
aa e0 e4 e4 39 30 de fa de fa  # dadf |   shl [0x3039], 0xfade + A, 0xfade + A
ee e0 e0 f8 39 30 00 88 4c f5  # dae9 |   jne [0x3039], 0x8800, ${fail}:rel + PC
aa 20 e0 fe 39 30              # daf3 |   shl [A], 0x3039, G
ee e0 e0 f8 aa 00 20 07 3c f5  # daf9 |   jne [0xaa], 0x720, ${fail}:rel + PC
b6 fe 3e 21 f6                 # db03 |   xor [G], A*4 + -10, A*2
ee e0 e0 f8 55 01 ca 03 2d f5  # db08 |   jne [0x155], 0x3ca, ${fail}:rel + PC
b2 2a fe 1c 85                 # db12 |   or [A*4 + B], G, -123
ee e0 1c f8 63 03 d5 1e f5     # db17 |   jne [0x363], 0xd5, ${fail}:rel + PC
86 3e 1c e0 f6 85 39 30        # db20 |   sub [A*4 + -10], -123, 0x3039
ee e0 e0 f8 9e 02 4c cf 0d f5  # db28 |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
aa 21 21 21                    # db32 |   shl [A*2], A*2, A*2
ee e0 e0 f8 54 01 40 15 ff f4  # db36 |   jne [0x154], 0x1540, ${fail}:rel + PC
86 e0 e4 e0 39 30 de fa 39 30  # db40 |   sub [0x3039], 0xfade + A, 0x3039
ee e0 e0 f8 39 30 4f cb eb f4  # db4a |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
a2 21 e0 1c 39 30 85           # db54 |   shr [A*2], 0x3039, -123
ee e0 e0 f8 54 01 81 01 da f4  # db5b |   jne [0x154], 0x181, ${fail}:rel + PC
a6 e0 e4 20 39 30 de fa        # db65 |   ishr [0x3039], 0xfade + A, A
ee e0 1c f8 39 30 fe c8 f4     # db6d |   jne [0x3039], 0xfe, ${fail}:rel + PC
b6 3e e4 e0 f6 de fa 39 30     # db76 |   xor [A*4 + -10], 0xfade + A, 0x3039
ee e0 e0 f8 9e 02 b1 cb b6 f4  # db7f |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
86 3e 21 3e f6 f6              # db89 |   sub [A*4 + -10], A*2, A*4 + -10
ee e0 e0 f8 9e 02 b6 fe a6 f4  # db8f |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
8e fe 1c 3e 85 f6              # db99 |   imul [G], -123, A*4 + -10
ee e0 e0 f8 55 01 16 be 96 f4  # db9f |   jne [0x155], 0xbe16, ${fail}:rel + PC
aa 20 2a 2a                    # dba9 |   shl [A], A*4 + B, A*4 + B
ee e0 e0 f8 aa 00 18 1b 88 f4  # dbad |   jne [0xaa], 0x1b18, ${fail}:rel + PC
b6 e0 21 2a 39 30              # dbb7 |   xor [0x3039], A*2, A*4 + B
ee e0 e0 f8 39 30 37 02 78 f4  # dbbd |   jne [0x3039], 0x237, ${fail}:rel + PC
82 21 21 e0 39 30              # dbc7 |   add [A*2], A*2, 0x3039
ee e0 e0 f8 54 01 8d 31 68 f4  # dbcd |   jne [0x154], 0x318d, ${fail}:rel + PC
ae 21 2a 20                    # dbd7 |   and [A*2], A*4 + B, A
ee e0 1c f8 54 01 22 5a f4     # dbdb |   jne [0x154], 0x22, ${fail}:rel + PC
aa 20 2a e4 de fa              # dbe4 |   shl [A], A*4 + B, 0xfade + A
ee e0 e0 f8 aa 00 00 63 4b f4  # dbea |   jne [0xaa], 0x6300, ${fail}:rel + PC
ae 2a fe 20                    # dbf4 |   and [A*4 + B], G, A
ee e0 00 f8 63 03 3d f4        # dbf8 |   jne [0x363], 0, ${fail}:rel + PC
b6 fe 21 1c 85                 # dc00 |   xor [G], A*2, -123
ee e0 e0 f8 55 01 d1 fe 30 f4  # dc05 |   jne [0x155], 0xfed1, ${fail}:rel + PC
ae e0 fe 21 39 30              # dc0f |   and [0x3039], G, A*2
ee e0 e0 f8 39 30 54 01 20 f4  # dc15 |   jne [0x3039], 0x154, ${fail}:rel + PC
b2 3e e0 2a f6 39 30           # dc1f |   or [A*4 + -10], 0x3039, A*4 + B
ee e0 e0 f8 9e 02 7b 33 0f f4  # dc26 |   jne [0x29e], 0x337b, ${fail}:rel + PC
b6 fe e4 3e de fa f6           # dc30 |   xor [G], 0xfade + A, A*4 + -10
ee e0 e0 f8 55 01 16 f9 fe f3  # dc37 |   jne [0x155], 0xf916, ${fail}:rel + PC
8e 2a 21 2a                    # dc41 |   imul [A*4 + B], A*2, A*4 + B
ee e0 e0 f8 63 03 7c 7f f0 f3  # dc45 |   jne [0x363], 0x7f7c, ${fail}:rel + PC
a6 fe 21 fe                    # dc4f |   ishr [G], A*2, G
ee e0 1c f8 55 01 0a e2 f3     # dc53 |   jne [0x155], 0xa, ${fail}:rel + PC
8a 21 1c 1c 85 85              # dc5c |   mul [A*2], -123, -123
ee e0 e0 f8 54 01 19 3b d3 f3  # dc62 |   jne [0x154], 0x3b19, ${fail}:rel + PC
8e 2a e4 20 de fa              # dc6c |   imul [A*4 + B], 0xfade + A, A
ee e0 e0 f8 63 03 50 08 c3 f3  # dc72 |   jne [0x363], 0x850, ${fail}:rel + PC
a2 3e 3e 3e f6 f6 f6           # dc7c |   shr [A*4 + -10], A*4 + -10, A*4 + -10
ee e0 00 f8 9e 02 b2 f3        # dc83 |   jne [0x29e], 0, ${fail}:rel + PC
8a 20 1c e4 85 de fa           # dc8b |   mul [A], -123, 0xfade + A
ee e0 e0 f8 aa 00 a8 25 a3 f3  # dc92 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
a6 3e 20 21 f6                 # dc9c |   ishr [A*4 + -10], A, A*2
ee e0 1c f8 9e 02 0a 94 f3     # dca1 |   jne [0x29e], 0xa, ${fail}:rel + PC
b2 3e 20 20 f6                 # dcaa |   or [A*4 + -10], A, A
ee e0 e0 f8 9e 02 aa 00 86 f3  # dcaf |   jne [0x29e], 0xaa, ${fail}:rel + PC
82 e0 fe e0 39 30 39 30        # dcb9 |   add [0x3039], G, 0x3039
ee e0 e0 f8 39 30 8e 31 74 f3  # dcc1 |   jne [0x3039], 0x318e, ${fail}:rel + PC
8e 3e e0 3e f6 39 30 f6        # dccb |   imul [A*4 + -10], 0x3039, A*4 + -10
ee e0 e0 f8 9e 02 2e 35 62 f3  # dcd3 |   jne [0x29e], 0x352e, ${fail}:rel + PC
a6 fe fe 21                    # dcdd |   ishr [G], G, A*2
ee e0 1c f8 55 01 15 54 f3     # dce1 |   jne [0x155], 0x15, ${fail}:rel + PC
8e 20 e4 3e de fa f6           # dcea |   imul [A], 0xfade + A, A*4 + -10
ee e0 e0 f8 aa 00 f0 4d 44 f3  # dcf1 |   jne [0xaa], 0x4df0, ${fail}:rel + PC
a6 fe 20 fe                    # dcfb |   ishr [G], A, G
ee e0 1c f8 55 01 05 36 f3     # dcff |   jne [0x155], 0x5, ${fail}:rel + PC
82 2a e0 3e 39 30 f6           # dd08 |   add [A*4 + B], 0x3039, A*4 + -10
ee e0 e0 f8 63 03 d7 32 26 f3  # dd0f |   jne [0x363], 0x32d7, ${fail}:rel + PC
ae 3e 2a e4 f6 de fa           # dd19 |   and [A*4 + -10], A*4 + B, 0xfade + A
ee e0 e0 f8 9e 02 00 03 15 f3  # dd20 |   jne [0x29e], 0x300, ${fail}:rel + PC
8e 20 1c 2a 85                 # dd2a |   imul [A], -123, A*4 + B
ee e0 e0 f8 aa 00 6f 5f 06 f3  # dd2f |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
a2 fe 3e e4 f6 de fa           # dd39 |   shr [G], A*4 + -10, 0xfade + A
ee e0 1c f8 55 01 02 f5 f2     # dd40 |   jne [0x155], 0x2, ${fail}:rel + PC
b2 2a e0 20 39 30              # dd49 |   or [A*4 + B], 0x3039, A
ee e0 e0 f8 63 03 bb 30 e6 f2  # dd4f |   jne [0x363], 0x30bb, ${fail}:rel + PC
b6 2a e0 fe 39 30              # dd59 |   xor [A*4 + B], 0x3039, G
ee e0 e0 f8 63 03 6c 31 d6 f2  # dd5f |   jne [0x363], 0x316c, ${fail}:rel + PC
8e 20 20 e0 39 30              # dd69 |   imul [A], A, 0x3039
ee e0 e0 f8 aa 00 da 05 c6 f2  # dd6f |   jne [0xaa], 0x5da, ${fail}:rel + PC
b2 21 2a 3e f6                 # dd79 |   or [A*2], A*4 + B, A*4 + -10
ee e0 e0 f8 54 01 ff 03 b7 f2  # dd7e |   jne [0x154], 0x3ff, ${fail}:rel + PC
aa fe e4 e0 de fa 39 30        # dd88 |   shl [G], 0xfade + A, 0x3039
ee e0 e0 f8 55 01 00 10 a5 f2  # dd90 |   jne [0x155], 0x1000, ${fail}:rel + PC
a6 2a e4 2a de fa              # dd9a |   ishr [A*4 + B], 0xfade + A, A*4 + B
ee e0 e0 f8 63 03 71 ff 95 f2  # dda0 |   jne [0x363], 0xff71, ${fail}:rel + PC
aa 3e e4 1c f6 de fa 85        # ddaa |   shl [A*4 + -10], 0xfade + A, -123
ee e0 e0 f8 9e 02 00 71 83 f2  # ddb2 |   jne [0x29e], 0x7100, ${fail}:rel + PC
a2 3e e4 20 f6 de fa           # ddbc |   shr [A*4 + -10], 0xfade + A, A
ee e0 1c f8 9e 02 3e 72 f2     # ddc3 |   jne [0x29e], 0x3e, ${fail}:rel + PC
8a 3e 20 2a f6                 # ddcc |   mul [A*4 + -10], A, A*4 + B
ee e0 e0 f8 9e 02 be 3f 64 f2  # ddd1 |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
b2 21 3e 2a f6                 # dddb |   or [A*2], A*4 + -10, A*4 + B
ee e0 e0 f8 54 01 ff 03 55 f2  # dde0 |   jne [0x154], 0x3ff, ${fail}:rel + PC
8e 3e 21 1c f6 85              # ddea |   imul [A*4 + -10], A*2, -123
ee e0 e0 f8 9e 02 a4 5c 45 f2  # ddf0 |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
aa e0 3e 21 39 30 f6           # ddfa |   shl [0x3039], A*4 + -10, A*2
ee e0 e0 f8 39 30 e0 29 34 f2  # de01 |   jne [0x3039], 0x29e0, ${fail}:rel + PC
aa 21 e4 e4 de fa de fa        # de0b |   shl [A*2], 0xfade + A, 0xfade + A
ee e0 e0 f8 54 01 00 88 22 f2  # de13 |   jne [0x154], 0x8800, ${fail}:rel + PC
82 fe 21 21                    # de1d |   add [G], A*2, A*2
ee e0 e0 f8 55 01 a8 02 14 f2  # de21 |   jne [0x155], 0x2a8, ${fail}:rel + PC
ae 21 e4 fe de fa              # de2b |   and [A*2], 0xfade + A, G
ee e0 e0 f8 54 01 00 01 04 f2  # de31 |   jne [0x154], 0x100, ${fail}:rel + PC
ae 3e e0 e0 f6 39 30 39 30     # de3b |   and [A*4 + -10], 0x3039, 0x3039
ee e0 e0 f8 9e 02 39 30 f1 f1  # de44 |   jne [0x29e], 0x3039, ${fail}:rel + PC
aa 3e 20 1c f6 85              # de4e |   shl [A*4 + -10], A, -123
ee e0 e0 f8 9e 02 40 15 e1 f1  # de54 |   jne [0x29e], 0x1540, ${fail}:rel + PC
ae 2a 3e e4 f6 de fa           # de5e |   and [A*4 + B], A*4 + -10, 0xfade + A
ee e0 e0 f8 63 03 88 02 d0 f1  # de65 |   jne [0x363], 0x288, ${fail}:rel + PC
82 fe 1c 1c 85 85              # de6f |   add [G], -123, -123
ee e0 e0 f8 55 01 0a ff c0 f1  # de75 |   jne [0x155], 0xff0a, ${fail}:rel + PC
8a 20 20 e4 de fa              # de7f |   mul [A], A, 0xfade + A
ee e0 e0 f8 aa 00 50 08 b0 f1  # de85 |   jne [0xaa], 0x850, ${fail}:rel + PC
b2 21 2a fe                    # de8f |   or [A*2], A*4 + B, G
ee e0 e0 f8 54 01 77 03 a2 f1  # de93 |   jne [0x154], 0x377, ${fail}:rel + PC
86 fe e4 e4 de fa de fa        # de9d |   sub [G], 0xfade + A, 0xfade + A
ee e0 00 f8 55 01 90 f1        # dea5 |   jne [0x155], 0, ${fail}:rel + PC
a2 2a fe e4 de fa              # dead |   shr [A*4 + B], G, 0xfade + A
ee e0 1c f8 63 03 01 82 f1     # deb3 |   jne [0x363], 0x1, ${fail}:rel + PC
86 21 1c fe 85                 # debc |   sub [A*2], -123, G
ee e0 e0 f8 54 01 30 fe 74 f1  # dec1 |   jne [0x154], 0xfe30, ${fail}:rel + PC
aa 3e 21 fe f6                 # decb |   shl [A*4 + -10], A*2, G
ee e0 e0 f8 9e 02 80 2a 65 f1  # ded0 |   jne [0x29e], 0x2a80, ${fail}:rel + PC
aa 20 1c 3e 85 f6              # deda |   shl [A], -123, A*4 + -10
ee e0 e0 f8 aa 00 00 40 55 f1  # dee0 |   jne [0xaa], 0x4000, ${fail}:rel + PC
8a 3e 2a 21 f6                 # deea |   mul [A*4 + -10], A*4 + B, A*2
ee e0 e0 f8 9e 02 7c 7f 46 f1  # deef |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
a2 20 2a fe                    # def9 |   shr [A], A*4 + B, G
ee e0 1c f8 aa 00 1b 38 f1     # defd |   jne [0xaa], 0x1b, ${fail}:rel + PC
82 20 2a e0 39 30              # df06 |   add [A], A*4 + B, 0x3039
ee e0 e0 f8 aa 00 9c 33 29 f1  # df0c |   jne [0xaa], 0x339c, ${fail}:rel + PC
b6 fe e0 1c 39 30 85           # df16 |   xor [G], 0x3039, -123
ee e0 e0 f8 55 01 bc cf 18 f1  # df1d |   jne [0x155], 0xcfbc, ${fail}:rel + PC
86 20 e4 2a de fa              # df27 |   sub [A], 0xfade + A, A*4 + B
ee e0 e0 f8 aa 00 25 f8 08 f1  # df2d |   jne [0xaa], 0xf825, ${fail}:rel + PC
a6 2a 21 fe                    # df37 |   ishr [A*4 + B], A*2, G
ee e0 1c f8 63 03 0a fa f0     # df3b |   jne [0x363], 0xa, ${fail}:rel + PC
b2 21 fe e4 de fa              # df44 |   or [A*2], G, 0xfade + A
ee e0 e0 f8 54 01 dd fb eb f0  # df4a |   jne [0x154], 0xfbdd, ${fail}:rel + PC
8a e0 e4 fe 39 30 de fa        # df54 |   mul [0x3039], 0xfade + A, G
ee e0 e0 f8 39 30 28 0c d9 f0  # df5c |   jne [0x3039], 0xc28, ${fail}:rel + PC
8e 2a 2a e4 de fa              # df66 |   imul [A*4 + B], A*4 + B, 0xfade + A
ee e0 e0 f8 63 03 98 dd c9 f0  # df6c |   jne [0x363], 0xdd98, ${fail}:rel + PC
ae e0 20 fe 39 30              # df76 |   and [0x3039], A, G
ee e0 00 f8 39 30 b9 f0        # df7c |   jne [0x3039], 0, ${fail}:rel + PC
8e fe fe 2a                    # df84 |   imul [G], G, A*4 + B
ee e0 e0 f8 55 01 df 82 ad f0  # df88 |   jne [0x155], 0x82df, ${fail}:rel + PC
8e 3e 21 21 f6                 # df92 |   imul [A*4 + -10], A*2, A*2
ee e0 e0 f8 9e 02 90 c3 9e f0  # df97 |   jne [0x29e], 0xc390, ${fail}:rel + PC
b2 fe e4 1c de fa 85           # dfa1 |   or [G], 0xfade + A, -123
ee e0 1c f8 55 01 8d 8d f0     # dfa8 |   jne [0x155], 0x8d, ${fail}:rel + PC
8e 2a 20 3e f6                 # dfb1 |   imul [A*4 + B], A, A*4 + -10
ee e0 e0 f8 63 03 ec bc 7f f0  # dfb6 |   jne [0x363], 0xbcec, ${fail}:rel + PC
a2 2a 3e e0 f6 39 30           # dfc0 |   shr [A*4 + B], A*4 + -10, 0x3039
ee e0 1c f8 63 03 01 6e f0     # dfc7 |   jne [0x363], 0x1, ${fail}:rel + PC
b6 2a 21 e0 39 30              # dfd0 |   xor [A*4 + B], A*2, 0x3039
ee e0 e0 f8 63 03 6d 31 5f f0  # dfd6 |   jne [0x363], 0x316d, ${fail}:rel + PC
a2 e0 3e e0 39 30 f6 39 30     # dfe0 |   shr [0x3039], A*4 + -10, 0x3039
ee e0 1c f8 39 30 01 4c f0     # dfe9 |   jne [0x3039], 0x1, ${fail}:rel + PC
a2 21 1c 3e 85 f6              # dff2 |   shr [A*2], -123, A*4 + -10
ee e0 1c f8 54 01 03 3d f0     # dff8 |   jne [0x154], 0x3, ${fail}:rel + PC
b2 21 20 21                    # e001 |   or [A*2], A, A*2
ee e0 e0 f8 54 01 fe 01 30 f0  # e005 |   jne [0x154], 0x1fe, ${fail}:rel + PC
a2 fe 2a 21                    # e00f |   shr [G], A*4 + B, A*2
ee e0 1c f8 55 01 36 22 f0     # e013 |   jne [0x155], 0x36, ${fail}:rel + PC
b6 e0 3e 2a 39 30 f6           # e01c |   xor [0x3039], A*4 + -10, A*4 + B
ee e0 e0 f8 39 30 fd 01 12 f0  # e023 |   jne [0x3039], 0x1fd, ${fail}:rel + PC
8a 3e e4 3e f6 de fa f6        # e02d |   mul [A*4 + -10], 0xfade + A, A*4 + -10
ee e0 e0 f8 9e 02 f0 4d 00 f0  # e035 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
8e 2a 21 3e f6                 # e03f |   imul [A*4 + B], A*2, A*4 + -10
ee e0 e0 f8 63 03 d8 79 f1 ef  # e044 |   jne [0x363], 0x79d8, ${fail}:rel + PC
a2 e0 e4 3e 39 30 de fa f6     # e04e |   shr [0x3039], 0xfade + A, A*4 + -10
ee e0 1c f8 39 30 03 de ef     # e057 |   jne [0x3039], 0x3, ${fail}:rel + PC
82 3e 20 fe f6                 # e060 |   add [A*4 + -10], A, G
ee e0 e0 f8 9e 02 ff 01 d0 ef  # e065 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a2 2a e4 e0 de fa 39 30        # e06f |   shr [A*4 + B], 0xfade + A, 0x3039
ee e0 1c f8 63 03 7d be ef     # e077 |   jne [0x363], 0x7d, ${fail}:rel + PC
a2 3e 1c 1c f6 85 85           # e080 |   shr [A*4 + -10], -123, -123
ee e0 e0 f8 9e 02 fc 07 ae ef  # e087 |   jne [0x29e], 0x7fc, ${fail}:rel + PC
8e 20 1c e0 85 39 30           # e091 |   imul [A], -123, 0x3039
ee e0 e0 f8 aa 00 9d d4 9d ef  # e098 |   jne [0xaa], 0xd49d, ${fail}:rel + PC
aa 2a 3e 21 f6                 # e0a2 |   shl [A*4 + B], A*4 + -10, A*2
ee e0 e0 f8 63 03 e0 29 8e ef  # e0a7 |   jne [0x363], 0x29e0, ${fail}:rel + PC
b6 21 e0 fe 39 30              # e0b1 |   xor [A*2], 0x3039, G
ee e0 e0 f8 54 01 6c 31 7e ef  # e0b7 |   jne [0x154], 0x316c, ${fail}:rel + PC
b6 e0 3e 3e 39 30 f6 f6        # e0c1 |   xor [0x3039], A*4 + -10, A*4 + -10
ee e0 00 f8 39 30 6c ef        # e0c9 |   jne [0x3039], 0, ${fail}:rel + PC
b6 20 21 1c 85                 # e0d1 |   xor [A], A*2, -123
ee e0 e0 f8 aa 00 d1 fe 5f ef  # e0d6 |   jne [0xaa], 0xfed1, ${fail}:rel + PC
b6 21 21 fe                    # e0e0 |   xor [A*2], A*2, G
ee e0 1c f8 54 01 01 51 ef     # e0e4 |   jne [0x154], 0x1, ${fail}:rel + PC
8a fe e0 20 39 30              # e0ed |   mul [G], 0x3039, A
ee e0 e0 f8 55 01 da 05 42 ef  # e0f3 |   jne [0x155], 0x5da, ${fail}:rel + PC
b6 21 e0 21 39 30              # e0fd |   xor [A*2], 0x3039, A*2
ee e0 e0 f8 54 01 6d 31 32 ef  # e103 |   jne [0x154], 0x316d, ${fail}:rel + PC
8a 21 2a e0 39 30              # e10d |   mul [A*2], A*4 + B, 0x3039
ee e0 e0 f8 54 01 0b 51 22 ef  # e113 |   jne [0x154], 0x510b, ${fail}:rel + PC
ae 3e e0 1c f6 39 30 85        # e11d |   and [A*4 + -10], 0x3039, -123
ee e0 e0 f8 9e 02 01 30 10 ef  # e125 |   jne [0x29e], 0x3001, ${fail}:rel + PC
aa fe 21 20                    # e12f |   shl [G], A*2, A
ee e0 e0 f8 55 01 00 50 02 ef  # e133 |   jne [0x155], 0x5000, ${fail}:rel + PC
ae 20 e4 20 de fa              # e13d |   and [A], 0xfade + A, A
ee e0 e0 f8 aa 00 88 00 f2 ee  # e143 |   jne [0xaa], 0x88, ${fail}:rel + PC
aa 21 3e e4 f6 de fa           # e14d |   shl [A*2], A*4 + -10, 0xfade + A
ee e0 e0 f8 54 01 00 9e e1 ee  # e154 |   jne [0x154], 0x9e00, ${fail}:rel + PC
b6 e0 e0 1c 39 30 39 30 85     # e15e |   xor [0x3039], 0x3039, -123
ee e0 e0 f8 39 30 bc cf ce ee  # e167 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
8a 3e 3e 1c f6 f6 85           # e171 |   mul [A*4 + -10], A*4 + -10, -123
ee e0 e0 f8 9e 02 16 be bd ee  # e178 |   jne [0x29e], 0xbe16, ${fail}:rel + PC
86 fe 21 3e f6                 # e182 |   sub [G], A*2, A*4 + -10
ee e0 e0 f8 55 01 b6 fe ae ee  # e187 |   jne [0x155], 0xfeb6, ${fail}:rel + PC
86 3e 2a fe f6                 # e191 |   sub [A*4 + -10], A*4 + B, G
ee e0 e0 f8 9e 02 0e 02 9f ee  # e196 |   jne [0x29e], 0x20e, ${fail}:rel + PC
b6 3e 1c fe f6 85              # e1a0 |   xor [A*4 + -10], -123, G
ee e0 e0 f8 9e 02 d0 fe 8f ee  # e1a6 |   jne [0x29e], 0xfed0, ${fail}:rel + PC
86 20 2a 1c 85                 # e1b0 |   sub [A], A*4 + B, -123
ee e0 e0 f8 aa 00 de 03 80 ee  # e1b5 |   jne [0xaa], 0x3de, ${fail}:rel + PC
86 20 21 fe                    # e1bf |   sub [A], A*2, G
ee e0 1c f8 aa 00 ff 72 ee     # e1c3 |   jne [0xaa], 0xff, ${fail}:rel + PC
86 2a 20 e4 de fa              # e1cc |   sub [A*4 + B], A, 0xfade + A
ee e0 e0 f8 63 03 22 05 63 ee  # e1d2 |   jne [0x363], 0x522, ${fail}:rel + PC
aa e0 fe 3e 39 30 f6           # e1dc |   shl [0x3039], G, A*4 + -10
ee e0 e0 f8 39 30 00 40 52 ee  # e1e3 |   jne [0x3039], 0x4000, ${fail}:rel + PC
ae 20 1c 1c 85 85              # e1ed |   and [A], -123, -123
ee e0 1c f8 aa 00 85 42 ee     # e1f3 |   jne [0xaa], 0x85, ${fail}:rel + PC
b6 20 fe e0 39 30              # e1fc |   xor [A], G, 0x3039
ee e0 e0 f8 aa 00 6c 31 33 ee  # e202 |   jne [0xaa], 0x316c, ${fail}:rel + PC
b2 e0 21 3e 39 30 f6           # e20c |   or [0x3039], A*2, A*4 + -10
ee e0 e0 f8 39 30 de 03 22 ee  # e213 |   jne [0x3039], 0x3de, ${fail}:rel + PC
b2 20 e4 21 de fa              # e21d |   or [A], 0xfade + A, A*2
ee e0 e0 f8 aa 00 dc fb 12 ee  # e223 |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
b6 fe 3e 3e f6 f6              # e22d |   xor [G], A*4 + -10, A*4 + -10
ee e0 00 f8 55 01 02 ee        # e233 |   jne [0x155], 0, ${fail}:rel + PC
b6 3e 20 e4 f6 de fa           # e23b |   xor [A*4 + -10], A, 0xfade + A
ee e0 e0 f8 9e 02 22 fb f3 ed  # e242 |   jne [0x29e], 0xfb22, ${fail}:rel + PC
b6 e0 1c e0 39 30 85 39 30     # e24c |   xor [0x3039], -123, 0x3039
ee e0 e0 f8 39 30 bc cf e0 ed  # e255 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
a2 3e fe 2a f6                 # e25f |   shr [A*4 + -10], G, A*4 + B
ee e0 1c f8 9e 02 2a d1 ed     # e264 |   jne [0x29e], 0x2a, ${fail}:rel + PC
ae 20 fe 20                    # e26d |   and [A], G, A
ee e0 00 f8 aa 00 c4 ed        # e271 |   jne [0xaa], 0, ${fail}:rel + PC
86 2a e4 1c de fa 85           # e279 |   sub [A*4 + B], 0xfade + A, -123
ee e0 e0 f8 63 03 03 fc b5 ed  # e280 |   jne [0x363], 0xfc03, ${fail}:rel + PC
ae e0 21 21 39 30              # e28a |   and [0x3039], A*2, A*2
ee e0 e0 f8 39 30 54 01 a5 ed  # e290 |   jne [0x3039], 0x154, ${fail}:rel + PC
a2 e0 20 e0 39 30 39 30        # e29a |   shr [0x3039], A, 0x3039
ee e0 00 f8 39 30 93 ed        # e2a2 |   jne [0x3039], 0, ${fail}:rel + PC
8e 3e 2a 3e f6 f6              # e2aa |   imul [A*4 + -10], A*4 + B, A*4 + -10
ee e0 e0 f8 9e 02 1a dd 85 ed  # e2b0 |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
a2 e0 3e 1c 39 30 f6 85        # e2ba |   shr [0x3039], A*4 + -10, -123
ee e0 1c f8 39 30 14 73 ed     # e2c2 |   jne [0x3039], 0x14, ${fail}:rel + PC
82 fe 20 e0 39 30              # e2cb |   add [G], A, 0x3039
ee e0 e0 f8 55 01 e3 30 64 ed  # e2d1 |   jne [0x155], 0x30e3, ${fail}:rel + PC
a6 e0 21 e0 39 30 39 30        # e2db |   ishr [0x3039], A*2, 0x3039
ee e0 00 f8 39 30 52 ed        # e2e3 |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e4 1c 39 30 de fa 85     # e2eb |   ishr [0x3039], 0xfade + A, -123
ee e0 1c f8 39 30 dc 41 ed     # e2f4 |   jne [0x3039], 0xdc, ${fail}:rel + PC
b2 3e fe 20 f6                 # e2fd |   or [A*4 + -10], G, A
ee e0 e0 f8 9e 02 ff 01 33 ed  # e302 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
a6 2a 2a 20                    # e30c |   ishr [A*4 + B], A*4 + B, A
ee e0 00 f8 63 03 25 ed        # e310 |   jne [0x363], 0, ${fail}:rel + PC
aa fe e0 2a 39 30              # e318 |   shl [G], 0x3039, A*4 + B
ee e0 e0 f8 55 01 c8 81 17 ed  # e31e |   jne [0x155], 0x81c8, ${fail}:rel + PC
8a 21 3e 20 f6                 # e328 |   mul [A*2], A*4 + -10, A
ee e0 e0 f8 54 01 ec bc 08 ed  # e32d |   jne [0x154], 0xbcec, ${fail}:rel + PC
8e 3e 3e e0 f6 f6 39 30        # e337 |   imul [A*4 + -10], A*4 + -10, 0x3039
ee e0 e0 f8 9e 02 2e 35 f6 ec  # e33f |   jne [0x29e], 0x352e, ${fail}:rel + PC
b6 e0 1c 3e 39 30 85 f6        # e349 |   xor [0x3039], -123, A*4 + -10
ee e0 e0 f8 39 30 1b fd e4 ec  # e351 |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
b2 fe 20 e4 de fa              # e35b |   or [G], A, 0xfade + A
ee e0 e0 f8 55 01 aa fb d4 ec  # e361 |   jne [0x155], 0xfbaa, ${fail}:rel + PC
8e fe fe 3e f6                 # e36b |   imul [G], G, A*4 + -10
ee e0 e0 f8 55 01 76 7c c5 ec  # e370 |   jne [0x155], 0x7c76, ${fail}:rel + PC
8a 20 e0 3e 39 30 f6           # e37a |   mul [A], 0x3039, A*4 + -10
ee e0 e0 f8 aa 00 2e 35 b4 ec  # e381 |   jne [0xaa], 0x352e, ${fail}:rel + PC
b2 fe 20 20                    # e38b |   or [G], A, A
ee e0 e0 f8 55 01 aa 00 a6 ec  # e38f |   jne [0x155], 0xaa, ${fail}:rel + PC
a2 3e 21 e4 f6 de fa           # e399 |   shr [A*4 + -10], A*2, 0xfade + A
ee e0 1c f8 9e 02 01 95 ec     # e3a0 |   jne [0x29e], 0x1, ${fail}:rel + PC
a6 20 3e 2a f6                 # e3a9 |   ishr [A], A*4 + -10, A*4 + B
ee e0 1c f8 aa 00 53 87 ec     # e3ae |   jne [0xaa], 0x53, ${fail}:rel + PC
82 20 e0 20 39 30              # e3b7 |   add [A], 0x3039, A
ee e0 e0 f8 aa 00 e3 30 78 ec  # e3bd |   jne [0xaa], 0x30e3, ${fail}:rel + PC
a6 20 1c 20 85                 # e3c7 |   ishr [A], -123, A
ee e0 1c f8 aa 00 ff 69 ec     # e3cc |   jne [0xaa], 0xff, ${fail}:rel + PC
ae 21 20 1c 85                 # e3d5 |   and [A*2], A, -123
ee e0 e0 f8 54 01 80 00 5b ec  # e3da |   jne [0x154], 0x80, ${fail}:rel + PC
b6 2a 1c e4 85 de fa           # e3e4 |   xor [A*4 + B], -123, 0xfade + A
ee e0 e0 f8 63 03 0d 04 4a ec  # e3eb |   jne [0x363], 0x40d, ${fail}:rel + PC
82 20 e0 21 39 30              # e3f5 |   add [A], 0x3039, A*2
ee e0 e0 f8 aa 00 8d 31 3a ec  # e3fb |   jne [0xaa], 0x318d, ${fail}:rel + PC
82 21 fe 2a                    # e405 |   add [A*2], G, A*4 + B
ee e0 e0 f8 54 01 b8 04 2c ec  # e409 |   jne [0x154], 0x4b8, ${fail}:rel + PC
b2 20 2a 20                    # e413 |   or [A], A*4 + B, A
ee e0 e0 f8 aa 00 eb 03 1e ec  # e417 |   jne [0xaa], 0x3eb, ${fail}:rel + PC
82 21 1c e0 85 39 30           # e421 |   add [A*2], -123, 0x3039
ee e0 e0 f8 54 01 be 2f 0d ec  # e428 |   jne [0x154], 0x2fbe, ${fail}:rel + PC
aa fe 2a 1c 85                 # e432 |   shl [G], A*4 + B, -123
ee e0 e0 f8 55 01 60 6c fe eb  # e437 |   jne [0x155], 0x6c60, ${fail}:rel + PC
82 3e 3e 2a f6 f6              # e441 |   add [A*4 + -10], A*4 + -10, A*4 + B
ee e0 e0 f8 9e 02 01 06 ee eb  # e447 |   jne [0x29e], 0x601, ${fail}:rel + PC
b2 20 3e e4 f6 de fa           # e451 |   or [A], A*4 + -10, 0xfade + A
ee e0 e0 f8 aa 00 9e fb dd eb  # e458 |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
aa 2a 21 1c 85                 # e462 |   shl [A*4 + B], A*2, -123
ee e0 e0 f8 63 03 80 2a ce eb  # e467 |   jne [0x363], 0x2a80, ${fail}:rel + PC
b2 e0 1c 2a 39 30 85           # e471 |   or [0x3039], -123, A*4 + B
ee e0 1c f8 39 30 e7 bd eb     # e478 |   jne [0x3039], 0xe7, ${fail}:rel + PC
82 21 2a 2a                    # e481 |   add [A*2], A*4 + B, A*4 + B
ee e0 e0 f8 54 01 c6 06 b0 eb  # e485 |   jne [0x154], 0x6c6, ${fail}:rel + PC
ae 20 21 20                    # e48f |   and [A], A*2, A
ee e0 00 f8 aa 00 a2 eb        # e493 |   jne [0xaa], 0, ${fail}:rel + PC
86 20 fe 1c 85                 # e49b |   sub [A], G, -123
ee e0 e0 f8 aa 00 d0 01 95 eb  # e4a0 |   jne [0xaa], 0x1d0, ${fail}:rel + PC
b2 20 2a 3e f6                 # e4aa |   or [A], A*4 + B, A*4 + -10
ee e0 e0 f8 aa 00 ff 03 86 eb  # e4af |   jne [0xaa], 0x3ff, ${fail}:rel + PC
b6 2a 20 2a                    # e4b9 |   xor [A*4 + B], A, A*4 + B
ee e0 e0 f8 63 03 c9 03 78 eb  # e4bd |   jne [0x363], 0x3c9, ${fail}:rel + PC
aa 21 fe 3e f6                 # e4c7 |   shl [A*2], G, A*4 + -10
ee e0 e0 f8 54 01 00 40 69 eb  # e4cc |   jne [0x154], 0x4000, ${fail}:rel + PC
ae 3e e0 21 f6 39 30           # e4d6 |   and [A*4 + -10], 0x3039, A*2
ee e0 1c f8 9e 02 10 58 eb     # e4dd |   jne [0x29e], 0x10, ${fail}:rel + PC
a2 e0 2a e4 39 30 de fa        # e4e6 |   shr [0x3039], A*4 + B, 0xfade + A
ee e0 1c f8 39 30 03 47 eb     # e4ee |   jne [0x3039], 0x3, ${fail}:rel + PC
8a fe 21 2a                    # e4f7 |   mul [G], A*2, A*4 + B
ee e0 e0 f8 55 01 7c 7f 3a eb  # e4fb |   jne [0x155], 0x7f7c, ${fail}:rel + PC
a2 3e 3e fe f6 f6              # e505 |   shr [A*4 + -10], A*4 + -10, G
ee e0 1c f8 9e 02 14 2a eb     # e50b |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 20 e0 e4 39 30 de fa        # e514 |   mul [A], 0x3039, 0xfade + A
ee e0 e0 f8 aa 00 48 81 19 eb  # e51c |   jne [0xaa], 0x8148, ${fail}:rel + PC
8a 2a 1c 3e 85 f6              # e526 |   mul [A*4 + B], -123, A*4 + -10
ee e0 e0 f8 63 03 16 be 09 eb  # e52c |   jne [0x363], 0xbe16, ${fail}:rel + PC
ae 2a 1c fe 85                 # e536 |   and [A*4 + B], -123, G
ee e0 e0 f8 63 03 05 01 fa ea  # e53b |   jne [0x363], 0x105, ${fail}:rel + PC
aa e0 e0 20 39 30 39 30        # e545 |   shl [0x3039], 0x3039, A
ee e0 e0 f8 39 30 00 e4 e8 ea  # e54d |   jne [0x3039], 0xe400, ${fail}:rel + PC
8e 20 fe 2a                    # e557 |   imul [A], G, A*4 + B
ee e0 e0 f8 aa 00 df 82 da ea  # e55b |   jne [0xaa], 0x82df, ${fail}:rel + PC
86 3e 1c 3e f6 85 f6           # e565 |   sub [A*4 + -10], -123, A*4 + -10
ee e0 e0 f8 9e 02 e7 fc c9 ea  # e56c |   jne [0x29e], 0xfce7, ${fail}:rel + PC
aa 21 20 2a                    # e576 |   shl [A*2], A, A*4 + B
ee e0 e0 f8 54 01 50 05 bb ea  # e57a |   jne [0x154], 0x550, ${fail}:rel + PC
82 20 3e 21 f6                 # e584 |   add [A], A*4 + -10, A*2
ee e0 e0 f8 aa 00 f2 03 ac ea  # e589 |   jne [0xaa], 0x3f2, ${fail}:rel + PC
8a 21 fe 1c 85                 # e593 |   mul [A*2], G, -123
ee e0 e0 f8 54 01 29 5c 9d ea  # e598 |   jne [0x154], 0x5c29, ${fail}:rel + PC
8a fe 1c e0 85 39 30           # e5a2 |   mul [G], -123, 0x3039
ee e0 e0 f8 55 01 9d d4 8c ea  # e5a9 |   jne [0x155], 0xd49d, ${fail}:rel + PC
a6 e0 2a 2a 39 30              # e5b3 |   ishr [0x3039], A*4 + B, A*4 + B
ee e0 1c f8 39 30 6c 7c ea     # e5b9 |   jne [0x3039], 0x6c, ${fail}:rel + PC
82 2a 1c 21 85                 # e5c2 |   add [A*4 + B], -123, A*2
ee e0 e0 f8 63 03 d9 00 6e ea  # e5c7 |   jne [0x363], 0xd9, ${fail}:rel + PC
8a e0 e0 fe 39 30 39 30        # e5d1 |   mul [0x3039], 0x3039, G
ee e0 e0 f8 39 30 ed 3b 5c ea  # e5d9 |   jne [0x3039], 0x3bed, ${fail}:rel + PC
b2 e0 2a fe 39 30              # e5e3 |   or [0x3039], A*4 + B, G
ee e0 e0 f8 39 30 77 03 4c ea  # e5e9 |   jne [0x3039], 0x377, ${fail}:rel + PC
aa 2a 1c e0 85 39 30           # e5f3 |   shl [A*4 + B], -123, 0x3039
ee e0 e0 f8 63 03 00 0a 3b ea  # e5fa |   jne [0x363], 0xa00, ${fail}:rel + PC
8a fe 1c 2a 85                 # e604 |   mul [G], -123, A*4 + B
ee e0 e0 f8 55 01 6f 5f 2c ea  # e609 |   jne [0x155], 0x5f6f, ${fail}:rel + PC
ae 3e e0 fe f6 39 30           # e613 |   and [A*4 + -10], 0x3039, G
ee e0 1c f8 9e 02 11 1b ea     # e61a |   jne [0x29e], 0x11, ${fail}:rel + PC
a6 2a 21 e4 de fa              # e623 |   ishr [A*4 + B], A*2, 0xfade + A
ee e0 1c f8 63 03 01 0c ea     # e629 |   jne [0x363], 0x1, ${fail}:rel + PC
b2 21 21 2a                    # e632 |   or [A*2], A*2, A*4 + B
ee e0 e0 f8 54 01 77 03 ff e9  # e636 |   jne [0x154], 0x377, ${fail}:rel + PC
ae 2a fe fe                    # e640 |   and [A*4 + B], G, G
ee e0 e0 f8 63 03 55 01 f1 e9  # e644 |   jne [0x363], 0x155, ${fail}:rel + PC
aa 2a 3e 3e f6 f6              # e64e |   shl [A*4 + B], A*4 + -10, A*4 + -10
ee e0 e0 f8 63 03 00 80 e1 e9  # e654 |   jne [0x363], 0x8000, ${fail}:rel + PC
86 3e 2a 1c f6 85              # e65e |   sub [A*4 + -10], A*4 + B, -123
ee e0 e0 f8 9e 02 de 03 d1 e9  # e664 |   jne [0x29e], 0x3de, ${fail}:rel + PC
ae fe fe 1c 85                 # e66e |   and [G], G, -123
ee e0 e0 f8 55 01 05 01 c2 e9  # e673 |   jne [0x155], 0x105, ${fail}:rel + PC
a6 21 3e 1c f6 85              # e67d |   ishr [A*2], A*4 + -10, -123
ee e0 1c f8 54 01 14 b2 e9     # e683 |   jne [0x154], 0x14, ${fail}:rel + PC
b2 e0 21 fe 39 30              # e68c |   or [0x3039], A*2, G
ee e0 e0 f8 39 30 55 01 a3 e9  # e692 |   jne [0x3039], 0x155, ${fail}:rel + PC
b2 2a 20 21                    # e69c |   or [A*4 + B], A, A*2
ee e0 e0 f8 63 03 fe 01 95 e9  # e6a0 |   jne [0x363], 0x1fe, ${fail}:rel + PC
a2 21 20 e0 39 30              # e6aa |   shr [A*2], A, 0x3039
ee e0 00 f8 54 01 85 e9        # e6b0 |   jne [0x154], 0, ${fail}:rel + PC
8e 3e 3e e4 f6 f6 de fa        # e6b8 |   imul [A*4 + -10], A*4 + -10, 0xfade + A
ee e0 e0 f8 9e 02 f0 4d 75 e9  # e6c0 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
a2 2a 3e fe f6                 # e6ca |   shr [A*4 + B], A*4 + -10, G
ee e0 1c f8 63 03 14 66 e9     # e6cf |   jne [0x363], 0x14, ${fail}:rel + PC
aa e0 2a 1c 39 30 85           # e6d8 |   shl [0x3039], A*4 + B, -123
ee e0 e0 f8 39 30 60 6c 56 e9  # e6df |   jne [0x3039], 0x6c60, ${fail}:rel + PC
86 e0 3e 20 39 30 f6           # e6e9 |   sub [0x3039], A*4 + -10, A
ee e0 e0 f8 39 30 f4 01 45 e9  # e6f0 |   jne [0x3039], 0x1f4, ${fail}:rel + PC
86 fe 3e fe f6                 # e6fa |   sub [G], A*4 + -10, G
ee e0 e0 f8 55 01 49 01 36 e9  # e6ff |   jne [0x155], 0x149, ${fail}:rel + PC
b6 20 20 2a                    # e709 |   xor [A], A, A*4 + B
ee e0 e0 f8 aa 00 c9 03 28 e9  # e70d |   jne [0xaa], 0x3c9, ${fail}:rel + PC
a2 20 21 21                    # e717 |   shr [A], A*2, A*2
ee e0 1c f8 aa 00 15 1a e9     # e71b |   jne [0xaa], 0x15, ${fail}:rel + PC
82 2a e0 21 39 30              # e724 |   add [A*4 + B], 0x3039, A*2
ee e0 e0 f8 63 03 8d 31 0b e9  # e72a |   jne [0x363], 0x318d, ${fail}:rel + PC
82 fe 2a 2a                    # e734 |   add [G], A*4 + B, A*4 + B
ee e0 e0 f8 55 01 c6 06 fd e8  # e738 |   jne [0x155], 0x6c6, ${fail}:rel + PC
aa 2a 2a 3e f6                 # e742 |   shl [A*4 + B], A*4 + B, A*4 + -10
ee e0 e0 f8 63 03 00 c0 ee e8  # e747 |   jne [0x363], 0xc000, ${fail}:rel + PC
b6 3e 2a 20 f6                 # e751 |   xor [A*4 + -10], A*4 + B, A
ee e0 e0 f8 9e 02 c9 03 df e8  # e756 |   jne [0x29e], 0x3c9, ${fail}:rel + PC
8a 20 e4 1c de fa 85           # e760 |   mul [A], 0xfade + A, -123
ee e0 e0 f8 aa 00 a8 25 ce e8  # e767 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
ae 3e e0 e4 f6 39 30 de fa     # e771 |   and [A*4 + -10], 0x3039, 0xfade + A
ee e0 e0 f8 9e 02 08 30 bb e8  # e77a |   jne [0x29e], 0x3008, ${fail}:rel + PC
82 20 fe 21                    # e784 |   add [A], G, A*2
ee e0 e0 f8 aa 00 a9 02 ad e8  # e788 |   jne [0xaa], 0x2a9, ${fail}:rel + PC
86 fe e4 fe de fa              # e792 |   sub [G], 0xfade + A, G
ee e0 e0 f8 55 01 33 fa 9d e8  # e798 |   jne [0x155], 0xfa33, ${fail}:rel + PC
a2 e0 3e e4 39 30 f6 de fa     # e7a2 |   shr [0x3039], A*4 + -10, 0xfade + A
ee e0 1c f8 39 30 02 8a e8     # e7ab |   jne [0x3039], 0x2, ${fail}:rel + PC
a2 3e 21 2a f6                 # e7b4 |   shr [A*4 + -10], A*2, A*4 + B
ee e0 1c f8 9e 02 2a 7c e8     # e7b9 |   jne [0x29e], 0x2a, ${fail}:rel + PC
a2 fe 20 2a                    # e7c2 |   shr [G], A, A*4 + B
ee e0 1c f8 55 01 15 6f e8     # e7c6 |   jne [0x155], 0x15, ${fail}:rel + PC
8e 2a fe 21                    # e7cf |   imul [A*4 + B], G, A*2
ee e0 e0 f8 63 03 e4 c4 62 e8  # e7d3 |   jne [0x363], 0xc4e4, ${fail}:rel + PC
8a 3e e4 e4 f6 de fa de fa     # e7dd |   mul [A*4 + -10], 0xfade + A, 0xfade + A
ee e0 e0 f8 9e 02 40 f8 4f e8  # e7e6 |   jne [0x29e], 0xf840, ${fail}:rel + PC
82 3e 2a e0 f6 39 30           # e7f0 |   add [A*4 + -10], A*4 + B, 0x3039
ee e0 e0 f8 9e 02 9c 33 3e e8  # e7f7 |   jne [0x29e], 0x339c, ${fail}:rel + PC
b6 2a fe 3e f6                 # e801 |   xor [A*4 + B], G, A*4 + -10
ee e0 e0 f8 63 03 cb 03 2f e8  # e806 |   jne [0x363], 0x3cb, ${fail}:rel + PC
b6 21 e4 20 de fa              # e810 |   xor [A*2], 0xfade + A, A
ee e0 e0 f8 54 01 22 fb 1f e8  # e816 |   jne [0x154], 0xfb22, ${fail}:rel + PC
a2 e0 e0 21 39 30 39 30        # e820 |   shr [0x3039], 0x3039, A*2
ee e0 e0 f8 39 30 03 03 0d e8  # e828 |   jne [0x3039], 0x303, ${fail}:rel + PC
8e 2a fe e0 39 30              # e832 |   imul [A*4 + B], G, 0x3039
ee e0 e0 f8 63 03 ed 3b fd e7  # e838 |   jne [0x363], 0x3bed, ${fail}:rel + PC
b6 e0 1c 21 39 30 85           # e842 |   xor [0x3039], -123, A*2
ee e0 e0 f8 39 30 d1 fe ec e7  # e849 |   jne [0x3039], 0xfed1, ${fail}:rel + PC
86 e0 fe e4 39 30 de fa        # e853 |   sub [0x3039], G, 0xfade + A
ee e0 e0 f8 39 30 cd 05 da e7  # e85b |   jne [0x3039], 0x5cd, ${fail}:rel + PC
b6 20 21 e4 de fa              # e865 |   xor [A], A*2, 0xfade + A
ee e0 e0 f8 aa 00 dc fa ca e7  # e86b |   jne [0xaa], 0xfadc, ${fail}:rel + PC
8a 21 3e e0 f6 39 30           # e875 |   mul [A*2], A*4 + -10, 0x3039
ee e0 e0 f8 54 01 2e 35 b9 e7  # e87c |   jne [0x154], 0x352e, ${fail}:rel + PC
aa 2a 21 20                    # e886 |   shl [A*4 + B], A*2, A
ee e0 e0 f8 63 03 00 50 ab e7  # e88a |   jne [0x363], 0x5000, ${fail}:rel + PC
ae fe 1c e4 85 de fa           # e894 |   and [G], -123, 0xfade + A
ee e0 e0 f8 55 01 80 fb 9a e7  # e89b |   jne [0x155], 0xfb80, ${fail}:rel + PC
a2 20 20 21                    # e8a5 |   shr [A], A, A*2
ee e0 1c f8 aa 00 0a 8c e7     # e8a9 |   jne [0xaa], 0xa, ${fail}:rel + PC
b6 3e 20 3e f6 f6              # e8b2 |   xor [A*4 + -10], A, A*4 + -10
ee e0 e0 f8 9e 02 34 02 7d e7  # e8b8 |   jne [0x29e], 0x234, ${fail}:rel + PC
aa 3e 3e 21 f6 f6              # e8c2 |   shl [A*4 + -10], A*4 + -10, A*2
ee e0 e0 f8 9e 02 e0 29 6d e7  # e8c8 |   jne [0x29e], 0x29e0, ${fail}:rel + PC
8a 20 3e 1c f6 85              # e8d2 |   mul [A], A*4 + -10, -123
ee e0 e0 f8 aa 00 16 be 5d e7  # e8d8 |   jne [0xaa], 0xbe16, ${fail}:rel + PC
b2 fe fe e0 39 30              # e8e2 |   or [G], G, 0x3039
ee e0 e0 f8 55 01 7d 31 4d e7  # e8e8 |   jne [0x155], 0x317d, ${fail}:rel + PC
a2 2a e4 3e de fa f6           # e8f2 |   shr [A*4 + B], 0xfade + A, A*4 + -10
ee e0 1c f8 63 03 03 3c e7     # e8f9 |   jne [0x363], 0x3, ${fail}:rel + PC
8a 2a 20 e0 39 30              # e902 |   mul [A*4 + B], A, 0x3039
ee e0 e0 f8 63 03 da 05 2d e7  # e908 |   jne [0x363], 0x5da, ${fail}:rel + PC
ae 3e 21 e0 f6 39 30           # e912 |   and [A*4 + -10], A*2, 0x3039
ee e0 1c f8 9e 02 10 1c e7     # e919 |   jne [0x29e], 0x10, ${fail}:rel + PC
ae e0 20 2a 39 30              # e922 |   and [0x3039], A, A*4 + B
ee e0 1c f8 39 30 22 0d e7     # e928 |   jne [0x3039], 0x22, ${fail}:rel + PC
8e fe 2a fe                    # e931 |   imul [G], A*4 + B, G
ee e0 e0 f8 55 01 df 82 00 e7  # e935 |   jne [0x155], 0x82df, ${fail}:rel + PC
86 e0 fe 2a 39 30              # e93f |   sub [0x3039], G, A*4 + B
ee e0 e0 f8 39 30 f2 fd f0 e6  # e945 |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
a2 2a fe 2a                    # e94f |   shr [A*4 + B], G, A*4 + B
ee e0 1c f8 63 03 2a e2 e6     # e953 |   jne [0x363], 0x2a, ${fail}:rel + PC
b2 3e fe fe f6                 # e95c |   or [A*4 + -10], G, G
ee e0 e0 f8 9e 02 55 01 d4 e6  # e961 |   jne [0x29e], 0x155, ${fail}:rel + PC
b6 21 20 fe                    # e96b |   xor [A*2], A, G
ee e0 e0 f8 54 01 ff 01 c6 e6  # e96f |   jne [0x154], 0x1ff, ${fail}:rel + PC
a2 fe 3e 1c f6 85              # e979 |   shr [G], A*4 + -10, -123
ee e0 1c f8 55 01 14 b6 e6     # e97f |   jne [0x155], 0x14, ${fail}:rel + PC
a6 e0 fe 20 39 30              # e988 |   ishr [0x3039], G, A
ee e0 00 f8 39 30 a7 e6        # e98e |   jne [0x3039], 0, ${fail}:rel + PC
8a 21 1c e4 85 de fa           # e996 |   mul [A*2], -123, 0xfade + A
ee e0 e0 f8 54 01 a8 25 98 e6  # e99d |   jne [0x154], 0x25a8, ${fail}:rel + PC
b2 21 e4 e0 de fa 39 30        # e9a7 |   or [A*2], 0xfade + A, 0x3039
ee e0 e0 f8 54 01 b9 fb 86 e6  # e9af |   jne [0x154], 0xfbb9, ${fail}:rel + PC
8e 2a e0 e4 39 30 de fa        # e9b9 |   imul [A*4 + B], 0x3039, 0xfade + A
ee e0 e0 f8 63 03 48 81 74 e6  # e9c1 |   jne [0x363], 0x8148, ${fail}:rel + PC
b2 3e fe 1c f6 85              # e9cb |   or [A*4 + -10], G, -123
ee e0 1c f8 9e 02 d5 64 e6     # e9d1 |   jne [0x29e], 0xd5, ${fail}:rel + PC
a6 3e 21 20 f6                 # e9da |   ishr [A*4 + -10], A*2, A
ee e0 00 f8 9e 02 56 e6        # e9df |   jne [0x29e], 0, ${fail}:rel + PC
ae 21 2a 1c 85                 # e9e7 |   and [A*2], A*4 + B, -123
ee e0 e0 f8 54 01 01 03 49 e6  # e9ec |   jne [0x154], 0x301, ${fail}:rel + PC
b2 20 21 3e f6                 # e9f6 |   or [A], A*2, A*4 + -10
ee e0 e0 f8 aa 00 de 03 3a e6  # e9fb |   jne [0xaa], 0x3de, ${fail}:rel + PC
82 fe 3e 20 f6                 # ea05 |   add [G], A*4 + -10, A
ee e0 e0 f8 55 01 48 03 2b e6  # ea0a |   jne [0x155], 0x348, ${fail}:rel + PC
aa 3e 20 e0 f6 39 30           # ea14 |   shl [A*4 + -10], A, 0x3039
ee e0 e0 f8 9e 02 00 54 1a e6  # ea1b |   jne [0x29e], 0x5400, ${fail}:rel + PC
aa 20 e4 e4 de fa de fa        # ea25 |   shl [A], 0xfade + A, 0xfade + A
ee e0 e0 f8 aa 00 00 88 08 e6  # ea2d |   jne [0xaa], 0x8800, ${fail}:rel + PC
8e fe 3e e0 f6 39 30           # ea37 |   imul [G], A*4 + -10, 0x3039
ee e0 e0 f8 55 01 2e 35 f7 e5  # ea3e |   jne [0x155], 0x352e, ${fail}:rel + PC
82 e0 1c 1c 39 30 85 85        # ea48 |   add [0x3039], -123, -123
ee e0 e0 f8 39 30 0a ff e5 e5  # ea50 |   jne [0x3039], 0xff0a, ${fail}:rel + PC
86 21 3e fe f6                 # ea5a |   sub [A*2], A*4 + -10, G
ee e0 e0 f8 54 01 49 01 d6 e5  # ea5f |   jne [0x154], 0x149, ${fail}:rel + PC
a6 20 e4 fe de fa              # ea69 |   ishr [A], 0xfade + A, G
ee e0 1c f8 aa 00 dc c6 e5     # ea6f |   jne [0xaa], 0xdc, ${fail}:rel + PC
b6 20 e4 e0 de fa 39 30        # ea78 |   xor [A], 0xfade + A, 0x3039
ee e0 e0 f8 aa 00 b1 cb b5 e5  # ea80 |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
86 fe 21 e4 de fa              # ea8a |   sub [G], A*2, 0xfade + A
ee e0 e0 f8 55 01 cc 05 a5 e5  # ea90 |   jne [0x155], 0x5cc, ${fail}:rel + PC
82 2a e0 e0 39 30 39 30        # ea9a |   add [A*4 + B], 0x3039, 0x3039
ee e0 e0 f8 63 03 72 60 93 e5  # eaa2 |   jne [0x363], 0x6072, ${fail}:rel + PC
86 3e 1c e4 f6 85 de fa        # eaac |   sub [A*4 + -10], -123, 0xfade + A
ee e0 e0 f8 9e 02 fd 03 81 e5  # eab4 |   jne [0x29e], 0x3fd, ${fail}:rel + PC
82 21 21 3e f6                 # eabe |   add [A*2], A*2, A*4 + -10
ee e0 e0 f8 54 01 f2 03 72 e5  # eac3 |   jne [0x154], 0x3f2, ${fail}:rel + PC
a2 20 e0 1c 39 30 85           # eacd |   shr [A], 0x3039, -123
ee e0 e0 f8 aa 00 81 01 61 e5  # ead4 |   jne [0xaa], 0x181, ${fail}:rel + PC
8e 21 20 3e f6                 # eade |   imul [A*2], A, A*4 + -10
ee e0 e0 f8 54 01 ec bc 52 e5  # eae3 |   jne [0x154], 0xbcec, ${fail}:rel + PC
b2 3e fe e4 f6 de fa           # eaed |   or [A*4 + -10], G, 0xfade + A
ee e0 e0 f8 9e 02 dd fb 41 e5  # eaf4 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
a6 fe 20 1c 85                 # eafe |   ishr [G], A, -123
ee e0 1c f8 55 01 05 32 e5     # eb03 |   jne [0x155], 0x5, ${fail}:rel + PC
a6 21 20 e4 de fa              # eb0c |   ishr [A*2], A, 0xfade + A
ee e0 00 f8 54 01 23 e5        # eb12 |   jne [0x154], 0, ${fail}:rel + PC
a2 e0 1c 20 39 30 85           # eb1a |   shr [0x3039], -123, A
ee e0 1c f8 39 30 3f 14 e5     # eb21 |   jne [0x3039], 0x3f, ${fail}:rel + PC
8e 20 20 3e f6                 # eb2a |   imul [A], A, A*4 + -10
ee e0 e0 f8 aa 00 ec bc 06 e5  # eb2f |   jne [0xaa], 0xbcec, ${fail}:rel + PC
82 2a e4 fe de fa              # eb39 |   add [A*4 + B], 0xfade + A, G
ee e0 e0 f8 63 03 dd fc f6 e4  # eb3f |   jne [0x363], 0xfcdd, ${fail}:rel + PC
b6 fe e0 3e 39 30 f6           # eb49 |   xor [G], 0x3039, A*4 + -10
ee e0 e0 f8 55 01 a7 32 e5 e4  # eb50 |   jne [0x155], 0x32a7, ${fail}:rel + PC
8e 20 e0 2a 39 30              # eb5a |   imul [A], 0x3039, A*4 + B
ee e0 e0 f8 aa 00 0b 51 d5 e4  # eb60 |   jne [0xaa], 0x510b, ${fail}:rel + PC
b2 3e e4 fe f6 de fa           # eb6a |   or [A*4 + -10], 0xfade + A, G
ee e0 e0 f8 9e 02 dd fb c4 e4  # eb71 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
86 21 1c 21 85                 # eb7b |   sub [A*2], -123, A*2
ee e0 e0 f8 54 01 31 fe b5 e4  # eb80 |   jne [0x154], 0xfe31, ${fail}:rel + PC
b2 2a 21 21                    # eb8a |   or [A*4 + B], A*2, A*2
ee e0 e0 f8 63 03 54 01 a7 e4  # eb8e |   jne [0x363], 0x154, ${fail}:rel + PC
8e e0 20 3e 39 30 f6           # eb98 |   imul [0x3039], A, A*4 + -10
ee e0 e0 f8 39 30 ec bc 96 e4  # eb9f |   jne [0x3039], 0xbcec, ${fail}:rel + PC
a6 3e e4 2a f6 de fa           # eba9 |   ishr [A*4 + -10], 0xfade + A, A*4 + B
ee e0 e0 f8 9e 02 71 ff 85 e4  # ebb0 |   jne [0x29e], 0xff71, ${fail}:rel + PC
ae e0 20 e4 39 30 de fa        # ebba |   and [0x3039], A, 0xfade + A
ee e0 e0 f8 39 30 88 00 73 e4  # ebc2 |   jne [0x3039], 0x88, ${fail}:rel + PC
a6 20 fe fe                    # ebcc |   ishr [A], G, G
ee e0 1c f8 aa 00 0a 65 e4     # ebd0 |   jne [0xaa], 0xa, ${fail}:rel + PC
8e 20 3e 20 f6                 # ebd9 |   imul [A], A*4 + -10, A
ee e0 e0 f8 aa 00 ec bc 57 e4  # ebde |   jne [0xaa], 0xbcec, ${fail}:rel + PC
b2 e0 3e fe 39 30 f6           # ebe8 |   or [0x3039], A*4 + -10, G
ee e0 e0 f8 39 30 df 03 46 e4  # ebef |   jne [0x3039], 0x3df, ${fail}:rel + PC
82 21 e0 e4 39 30 de fa        # ebf9 |   add [A*2], 0x3039, 0xfade + A
ee e0 e0 f8 54 01 c1 2b 34 e4  # ec01 |   jne [0x154], 0x2bc1, ${fail}:rel + PC
82 e0 1c e4 39 30 85 de fa     # ec0b |   add [0x3039], -123, 0xfade + A
ee e0 e0 f8 39 30 0d fb 21 e4  # ec14 |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
b2 fe 20 21                    # ec1e |   or [G], A, A*2
ee e0 e0 f8 55 01 fe 01 13 e4  # ec22 |   jne [0x155], 0x1fe, ${fail}:rel + PC
aa 21 2a 21                    # ec2c |   shl [A*2], A*4 + B, A*2
ee e0 e0 f8 54 01 30 36 05 e4  # ec30 |   jne [0x154], 0x3630, ${fail}:rel + PC
82 e0 2a e0 39 30 39 30        # ec3a |   add [0x3039], A*4 + B, 0x3039
ee e0 e0 f8 39 30 9c 33 f3 e3  # ec42 |   jne [0x3039], 0x339c, ${fail}:rel + PC
ae 2a 20 1c 85                 # ec4c |   and [A*4 + B], A, -123
ee e0 e0 f8 63 03 80 00 e4 e3  # ec51 |   jne [0x363], 0x80, ${fail}:rel + PC
b6 e0 20 1c 39 30 85           # ec5b |   xor [0x3039], A, -123
ee e0 e0 f8 39 30 2f ff d3 e3  # ec62 |   jne [0x3039], 0xff2f, ${fail}:rel + PC
ae 21 fe e0 39 30              # ec6c |   and [A*2], G, 0x3039
ee e0 1c f8 54 01 11 c3 e3     # ec72 |   jne [0x154], 0x11, ${fail}:rel + PC
ae 3e fe 3e f6 f6              # ec7b |   and [A*4 + -10], G, A*4 + -10
ee e0 1c f8 9e 02 14 b4 e3     # ec81 |   jne [0x29e], 0x14, ${fail}:rel + PC
8a 3e 2a 2a f6                 # ec8a |   mul [A*4 + -10], A*4 + B, A*4 + B
ee e0 e0 f8 9e 02 49 78 a6 e3  # ec8f |   jne [0x29e], 0x7849, ${fail}:rel + PC
82 20 3e e0 f6 39 30           # ec99 |   add [A], A*4 + -10, 0x3039
ee e0 e0 f8 aa 00 d7 32 95 e3  # eca0 |   jne [0xaa], 0x32d7, ${fail}:rel + PC
82 21 e0 3e 39 30 f6           # ecaa |   add [A*2], 0x3039, A*4 + -10
ee e0 e0 f8 54 01 d7 32 84 e3  # ecb1 |   jne [0x154], 0x32d7, ${fail}:rel + PC
b6 21 3e 3e f6 f6              # ecbb |   xor [A*2], A*4 + -10, A*4 + -10
ee e0 00 f8 54 01 74 e3        # ecc1 |   jne [0x154], 0, ${fail}:rel + PC
a6 e0 20 20 39 30              # ecc9 |   ishr [0x3039], A, A
ee e0 00 f8 39 30 66 e3        # eccf |   jne [0x3039], 0, ${fail}:rel + PC
a6 e0 e0 3e 39 30 39 30 f6     # ecd7 |   ishr [0x3039], 0x3039, A*4 + -10
ee e0 00 f8 39 30 55 e3        # ece0 |   jne [0x3039], 0, ${fail}:rel + PC
aa 20 1c 21 85                 # ece8 |   shl [A], -123, A*2
ee e0 e0 f8 aa 00 50 f8 48 e3  # eced |   jne [0xaa], 0xf850, ${fail}:rel + PC
ae e0 21 e4 39 30 de fa        # ecf7 |   and [0x3039], A*2, 0xfade + A
ee e0 e0 f8 39 30 00 01 36 e3  # ecff |   jne [0x3039], 0x100, ${fail}:rel + PC
b2 3e 1c 20 f6 85              # ed09 |   or [A*4 + -10], -123, A
ee e0 1c f8 9e 02 af 26 e3     # ed0f |   jne [0x29e], 0xaf, ${fail}:rel + PC
8e 21 1c 20 85                 # ed18 |   imul [A*2], -123, A
ee e0 e0 f8 54 01 52 ae 18 e3  # ed1d |   jne [0x154], 0xae52, ${fail}:rel + PC
8a 2a 2a 2a                    # ed27 |   mul [A*4 + B], A*4 + B, A*4 + B
ee e0 e0 f8 63 03 49 78 0a e3  # ed2b |   jne [0x363], 0x7849, ${fail}:rel + PC
86 2a 2a e0 39 30              # ed35 |   sub [A*4 + B], A*4 + B, 0x3039
ee e0 e0 f8 63 03 2a d3 fa e2  # ed3b |   jne [0x363], 0xd32a, ${fail}:rel + PC
ae fe 1c 21 85                 # ed45 |   and [G], -123, A*2
ee e0 e0 f8 55 01 04 01 eb e2  # ed4a |   jne [0x155], 0x104, ${fail}:rel + PC
8e 21 e4 1c de fa 85           # ed54 |   imul [A*2], 0xfade + A, -123
ee e0 e0 f8 54 01 a8 25 da e2  # ed5b |   jne [0x154], 0x25a8, ${fail}:rel + PC
8a 21 21 e4 de fa              # ed65 |   mul [A*2], A*2, 0xfade + A
ee e0 e0 f8 54 01 a0 10 ca e2  # ed6b |   jne [0x154], 0x10a0, ${fail}:rel + PC
86 fe e0 fe 39 30              # ed75 |   sub [G], 0x3039, G
ee e0 e0 f8 55 01 e4 2e ba e2  # ed7b |   jne [0x155], 0x2ee4, ${fail}:rel + PC
62 20 1c 85                    # ed85 |   mov [A], -123
ee e0 1c f8 aa 00 85 ac e2     # ed89 |   jne [0xaa], 0x85, ${fail}:rel + PC
62 3e 3e f6 f6                 # ed92 |   mov [A*4 + -10], A*4 + -10
ee e0 e0 f8 9e 02 9e 02 9e e2  # ed97 |   jne [0x29e], 0x29e, ${fail}:rel + PC
62 21 2a                       # eda1 |   mov [A*2], A*4 + B
ee e0 e0 f8 54 01 63 03 91 e2  # eda4 |   jne [0x154], 0x363, ${fail}:rel + PC
62 e0 1c 39 30 85              # edae |   mov [0x3039], -123
ee e0 1c f8 39 30 85 81 e2     # edb4 |   jne [0x3039], 0x85, ${fail}:rel + PC
62 fe 3e f6                    # edbd |   mov [G], A*4 + -10
ee e0 e0 f8 55 01 9e 02 74 e2  # edc1 |   jne [0x155], 0x29e, ${fail}:rel + PC
62 e0 fe 39 30                 # edcb |   mov [0x3039], G
ee e0 e0 f8 39 30 55 01 65 e2  # edd0 |   jne [0x3039], 0x155, ${fail}:rel + PC
62 fe 21                       # edda |   mov [G], A*2
ee e0 e0 f8 55 01 54 01 58 e2  # eddd |   jne [0x155], 0x154, ${fail}:rel + PC
62 3e e4 f6 de fa              # ede7 |   mov [A*4 + -10], 0xfade + A
ee e0 e0 f8 9e 02 88 fb 48 e2  # eded |   jne [0x29e], 0xfb88, ${fail}:rel + PC
62 e0 e0 39 30 39 30           # edf7 |   mov [0x3039], 0x3039
ee e0 e0 f8 39 30 39 30 37 e2  # edfe |   jne [0x3039], 0x3039, ${fail}:rel + PC
62 3e fe f6                    # ee08 |   mov [A*4 + -10], G
ee e0 e0 f8 9e 02 55 01 29 e2  # ee0c |   jne [0x29e], 0x155, ${fail}:rel + PC
62 20 fe                       # ee16 |   mov [A], G
ee e0 e0 f8 aa 00 55 01 1c e2  # ee19 |   jne [0xaa], 0x155, ${fail}:rel + PC
62 2a 2a                       # ee23 |   mov [A*4 + B], A*4 + B
ee e0 e0 f8 63 03 63 03 0f e2  # ee26 |   jne [0x363], 0x363, ${fail}:rel + PC
62 3e 2a f6                    # ee30 |   mov [A*4 + -10], A*4 + B
ee e0 e0 f8 9e 02 63 03 01 e2  # ee34 |   jne [0x29e], 0x363, ${fail}:rel + PC
62 2a 20                       # ee3e |   mov [A*4 + B], A
ee e0 e0 f8 63 03 aa 00 f4 e1  # ee41 |   jne [0x363], 0xaa, ${fail}:rel + PC
62 3e 20 f6                    # ee4b |   mov [A*4 + -10], A
ee e0 e0 f8 9e 02 aa 00 e6 e1  # ee4f |   jne [0x29e], 0xaa, ${fail}:rel + PC
62 20 20                       # ee59 |   mov [A], A
ee e0 e0 f8 aa 00 aa 00 d9 e1  # ee5c |   jne [0xaa], 0xaa, ${fail}:rel + PC
62 2a e4 de fa                 # ee66 |   mov [A*4 + B], 0xfade + A
ee e0 e0 f8 63 03 88 fb ca e1  # ee6b |   jne [0x363], 0xfb88, ${fail}:rel + PC
62 21 1c 85                    # ee75 |   mov [A*2], -123
ee e0 1c f8 54 01 85 bc e1     # ee79 |   jne [0x154], 0x85, ${fail}:rel + PC
62 2a e0 39 30                 # ee82 |   mov [A*4 + B], 0x3039
ee e0 e0 f8 63 03 39 30 ae e1  # ee87 |   jne [0x363], 0x3039, ${fail}:rel + PC
62 3e 1c f6 85                 # ee91 |   mov [A*4 + -10], -123
ee e0 1c f8 9e 02 85 9f e1     # ee96 |   jne [0x29e], 0x85, ${fail}:rel + PC
62 3e 21 f6                    # ee9f |   mov [A*4 + -10], A*2
ee e0 e0 f8 9e 02 54 01 92 e1  # eea3 |   jne [0x29e], 0x154, ${fail}:rel + PC
62 21 3e f6                    # eead |   mov [A*2], A*4 + -10
ee e0 e0 f8 54 01 9e 02 84 e1  # eeb1 |   jne [0x154], 0x29e, ${fail}:rel + PC
62 e0 21 39 30                 # eebb |   mov [0x3039], A*2
ee e0 e0 f8 39 30 54 01 75 e1  # eec0 |   jne [0x3039], 0x154, ${fail}:rel + PC
62 21 fe                       # eeca |   mov [A*2], G
ee e0 e0 f8 54 01 55 01 68 e1  # eecd |   jne [0x154], 0x155, ${fail}:rel + PC
62 2a fe                       # eed7 |   mov [A*4 + B], G
ee e0 e0 f8 63 03 55 01 5b e1  # eeda |   jne [0x363], 0x155, ${fail}:rel + PC
62 21 e4 de fa                 # eee4 |   mov [A*2], 0xfade + A
ee e0 e0 f8 54 01 88 fb 4c e1  # eee9 |   jne [0x154], 0xfb88, ${fail}:rel + PC
62 20 3e f6                    # eef3 |   mov [A], A*4 + -10
ee e0 e0 f8 aa 00 9e 02 3e e1  # eef7 |   jne [0xaa], 0x29e, ${fail}:rel + PC
62 e0 3e 39 30 f6              # ef01 |   mov [0x3039], A*4 + -10
ee e0 e0 f8 39 30 9e 02 2e e1  # ef07 |   jne [0x3039], 0x29e, ${fail}:rel + PC
62 2a 3e f6                    # ef11 |   mov [A*4 + B], A*4 + -10
ee e0 e0 f8 63 03 9e 02 20 e1  # ef15 |   jne [0x363], 0x29e, ${fail}:rel + PC
62 e0 e4 39 30 de fa           # ef1f |   mov [0x3039], 0xfade + A
ee e0 e0 f8 39 30 88 fb 0f e1  # ef26 |   jne [0x3039], 0xfb88, ${fail}:rel + PC
62 21 e0 39 30                 # ef30 |   mov [A*2], 0x3039
ee e0 e0 f8 54 01 39 30 00 e1  # ef35 |   jne [0x154], 0x3039, ${fail}:rel + PC
62 fe 1c 85                    # ef3f |   mov [G], -123
ee e0 1c f8 55 01 85 f2 e0     # ef43 |   jne [0x155], 0x85, ${fail}:rel + PC
62 e0 2a 39 30                 # ef4c |   mov [0x3039], A*4 + B
ee e0 e0 f8 39 30 63 03 e4 e0  # ef51 |   jne [0x3039], 0x363, ${fail}:rel + PC
62 fe e4 de fa                 # ef5b |   mov [G], 0xfade + A
ee e0 e0 f8 55 01 88 fb d5 e0  # ef60 |   jne [0x155], 0xfb88, ${fail}:rel + PC
62 20 e0 39 30                 # ef6a |   mov [A], 0x3039
ee e0 e0 f8 aa 00 39 30 c6 e0  # ef6f |   jne [0xaa], 0x3039, ${fail}:rel + PC
62 20 21                       # ef79 |   mov [A], A*2
ee e0 e0 f8 aa 00 54 01 b9 e0  # ef7c |   jne [0xaa], 0x154, ${fail}:rel + PC
62 3e e0 f6 39 30              # ef86 |   mov [A*4 + -10], 0x3039
ee e0 e0 f8 9e 02 39 30 a9 e0  # ef8c |   jne [0x29e], 0x3039, ${fail}:rel + PC
62 fe 20                       # ef96 |   mov [G], A
ee e0 e0 f8 55 01 aa 00 9c e0  # ef99 |   jne [0x155], 0xaa, ${fail}:rel + PC
62 21 20                       # efa3 |   mov [A*2], A
ee e0 e0 f8 54 01 aa 00 8f e0  # efa6 |   jne [0x154], 0xaa, ${fail}:rel + PC
62 fe fe                       # efb0 |   mov [G], G
ee e0 e0 f8 55 01 55 01 82 e0  # efb3 |   jne [0x155], 0x155, ${fail}:rel + PC
62 20 2a                       # efbd |   mov [A], A*4 + B
ee e0 e0 f8 aa 00 63 03 75 e0  # efc0 |   jne [0xaa], 0x363, ${fail}:rel + PC
62 2a 1c 85                    # efca |   mov [A*4 + B], -123
ee e0 1c f8 63 03 85 67 e0     # efce |   jne [0x363], 0x85, ${fail}:rel + PC
62 2a 21                       # efd7 |   mov [A*4 + B], A*2
ee e0 e0 f8 63 03 54 01 5b e0  # efda |   jne [0x363], 0x154, ${fail}:rel + PC
62 e0 20 39 30                 # efe4 |   mov [0x3039], A
ee e0 e0 f8 39 30 aa 00 4c e0  # efe9 |   jne [0x3039], 0xaa, ${fail}:rel + PC
62 fe e0 39 30                 # eff3 |   mov [G], 0x3039
ee e0 e0 f8 55 01 39 30 3d e0  # eff8 |   jne [0x155], 0x3039, ${fail}:rel + PC
62 21 21                       # f002 |   mov [A*2], A*2
ee e0 e0 f8 54 01 54 01 30 e0  # f005 |   jne [0x154], 0x154, ${fail}:rel + PC
62 fe 2a                       # f00f |   mov [G], A*4 + B
ee e0 e0 f8 55 01 63 03 23 e0  # f012 |   jne [0x155], 0x363, ${fail}:rel + PC
62 20 e4 de fa                 # f01c |   mov [A], 0xfade + A
ee e0 e0 f8 aa 00 88 fb 14 e0  # f021 |   jne [0xaa], 0xfb88, ${fail}:rel + PC
e0 2a                          # f02b |   push A*4 + B
e4 80                          # f02d |   pop D
ec 80 e0 f8 63 03 06 e0        # f02f |   jne D, 0x363, ${fail}:rel + PC
e0 1c 85                       # f037 |   push -123
e4 80                          # f03a |   pop D
ec 80 1c f8 85 f9 df           # f03c |   jne D, 0x85, ${fail}:rel + PC
e0 fe                          # f043 |   push G
e4 80                          # f045 |   pop D
ec 80 e0 f8 55 01 ee df        # f047 |   jne D, 0x155, ${fail}:rel + PC
e0 3e f6                       # f04f |   push A*4 + -10
e4 80                          # f052 |   pop D
ec 80 e0 f8 9e 02 e1 df        # f054 |   jne D, 0x29e, ${fail}:rel + PC
e0 20                          # f05c |   push A
e4 80                          # f05e |   pop D
ec 80 e0 f8 aa 00 d5 df        # f060 |   jne D, 0xaa, ${fail}:rel + PC
e0 e4 de fa                    # f068 |   push 0xfade + A
e4 80                          # f06c |   pop D
ec 80 e0 f8 88 fb c7 df        # f06e |   jne D, 0xfb88, ${fail}:rel + PC
e0 21                          # f076 |   push A*2
e4 80                          # f078 |   pop D
ec 80 e0 f8 54 01 bb df        # f07a |   jne D, 0x154, ${fail}:rel + PC
e0 e0 39 30                    # f082 |   push 0x3039
e4 80                          # f086 |   pop D
ec 80 e0 f8 39 30 ad df        # f088 |   jne D, 0x3039, ${fail}:rel + PC
5c f8 10 00                    # f090 |   call ${_L_test_uop_get_arg_1}:rel + PC
ec 60 e0 f8 fe ad a1 df        # f094 |   jne C, 0xadfe, ${fail}:rel + PC
58 f8 0e 00                    # f09c |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                               #      | _L_test_uop_get_arg_1:
60 60 e0 fe ad                 # f0a0 |   mov C, 0xadfe
dc                             # f0a5 |   ret
58 f8 8f df                    # f0a6 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_get_arg_2:
                               #      | test_uop_alu_2dd:
60 20 e0 cd ab                 # f0aa |   mov A, 0xabcd
00 20 e0 ab cd                 # f0af |   add A, 0xcdab
ec 20 e0 f8 78 79 81 df        # f0b4 |   jne A, 0x7978, ${fail}:rel + PC
                               #      | test_uop_alu_2di:
60 20 e0 00 10                 # f0bc |   mov A, 0x1000
62 e0 e0 00 10 bc 0a           # f0c1 |   mov [0x1000], 0xabc
01 20 20                       # f0c8 |   add A, [A]
ec 20 e0 f8 bc 1a 6a df        # f0cb |   jne A, 0x1abc, ${fail}:rel + PC
                               #      | test_uop_alu_2id:
62 e0 e0 00 10 34 12           # f0d3 |   mov [0x1000], 0x1234
02 e0 e0 00 10 21 43           # f0da |   add [0x1000], 0x4321
61 20 e0 00 10                 # f0e1 |   mov A, [0x1000]
ec 20 e0 f8 55 55 4f df        # f0e6 |   jne A, 0x5555, ${fail}:rel + PC
                               #      | test_uop_alu_2ii:
62 e0 e0 00 10 34 12           # f0ee |   mov [0x1000], 0x1234
62 e0 e0 05 10 aa aa           # f0f5 |   mov [0x1005], 0xaaaa
03 e0 e0 05 10 00 10           # f0fc |   add [0x1005], [0x1000]
ee e0 e0 f8 05 10 de bc 32 df  # f103 |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                               #      | test_uop_alu_3dd:
60 20 e0 fe ab                 # f10d |   mov A, 0xabfe
60 40 e0 55 55                 # f112 |   mov B, 0x5555
80 60 20 40                    # f117 |   add C, A, B
ec 20 e0 f8 fe ab 1a df        # f11b |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 12 df        # f123 |   jne B, 0x5555, ${fail}:rel + PC
ec 60 e0 f8 53 01 0a df        # f12b |   jne C, 0x153, ${fail}:rel + PC
                               #      | test_uop_alu_3di:
62 e0 e0 00 10 aa 12           # f133 |   mov [0x1000], 0x12aa
60 40 e0 de fa                 # f13a |   mov B, 0xfade
b5 20 e0 40 00 10              # f13f |   xor A, [0x1000], B
ee e0 e0 f8 00 10 aa 12 f0 de  # f145 |   jne [0x1000], 0x12aa, ${fail}:rel + PC
ec 40 e0 f8 de fa e6 de        # f14f |   jne B, 0xfade, ${fail}:rel + PC
ec 20 e0 f8 74 e8 de de        # f157 |   jne A, 0xe874, ${fail}:rel + PC
                               #      | test_uop_alu_3id:
60 20 e0 fe ab                 # f15f |   mov A, 0xabfe
60 40 e0 55 55                 # f164 |   mov B, 0x5555
86 e0 20 40 00 10              # f169 |   sub [0x1000], A, B
ec 20 e0 f8 fe ab c6 de        # f16f |   jne A, 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 be de        # f177 |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 00 10 a9 56 b6 de  # f17f |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                               #      | test_uop_alu_3ii:
62 e0 e0 00 10 fe ab           # f189 |   mov [0x1000], 0xabfe
60 40 e0 55 55                 # f190 |   mov B, 0x5555
af e0 e0 40 02 10 00 10        # f195 |   and [0x1002], [0x1000], B
ee e0 e0 f8 00 10 fe ab 98 de  # f19d |   jne [0x1000], 0xabfe, ${fail}:rel + PC
ec 40 e0 f8 55 55 8e de        # f1a7 |   jne B, 0x5555, ${fail}:rel + PC
ee e0 e0 f8 02 10 54 01 86 de  # f1af |   jne [0x1002], 0x154, ${fail}:rel + PC
                               #      | test_uop_alu_single_1dx:
60 20 e0 00 ff                 # f1b9 |   mov A, 0xff00
3c 20                          # f1be |   not A
ec 20 e0 f8 ff 00 75 de        # f1c0 |   jne A, 0xff, ${fail}:rel + PC
                               #      | test_uop_alu_single_1ix:
62 1c e0 64 34 12              # f1c8 |   mov [0x64], 0x1234
3a 1c 64                       # f1ce |   neg [0x64]
ee 1c e0 f8 64 cc ed 64 de     # f1d1 |   jne [0x64], 0xedcc, ${fail}:rel + PC
                               #      | test_uop_alu_single_2dd:
60 40 e0 ff 00                 # f1da |   mov B, 0xff
bc 20 40                       # f1df |   not A, B
ec 40 e0 f8 ff 00 53 de        # f1e2 |   jne B, 0xff, ${fail}:rel + PC
ec 20 e0 f8 00 ff 4b de        # f1ea |   jne A, 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2di:
62 1c e0 64 34 12              # f1f2 |   mov [0x64], 0x1234
bd 20 1c 64                    # f1f8 |   not A, [0x64]
ee 1c e0 f8 64 34 12 39 de     # f1fc |   jne [0x64], 0x1234, ${fail}:rel + PC
ec 20 e0 f8 cb ed 30 de        # f205 |   jne A, 0xedcb, ${fail}:rel + PC
                               #      | test_uop_alu_single_2id:
60 40 e0 ff 00                 # f20d |   mov B, 0xff
be 1c 40 64                    # f212 |   not [0x64], B
ec 40 e0 f8 ff 00 1f de        # f216 |   jne B, 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff 17 de     # f21e |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_alu_single_2ii:
62 1c e0 66 ff 00              # f227 |   mov [0x66], 0xff
bf 1c 1c 64 66                 # f22d |   not [0x64], [0x66]
ee 1c e0 f8 66 ff 00 03 de     # f232 |   jne [0x66], 0xff, ${fail}:rel + PC
ee 1c e0 f8 64 00 ff fa dd     # f23b |   jne [0x64], 0xff00, ${fail}:rel + PC
                               #      | test_uop_cmp_dd:
60 40 1c 7b                    # f244 |   mov B, 0x7b
50 40 e0 c8 01                 # f248 |   cmp B, 0x1c8
4c 20                          # f24d |   getf A
ec 40 1c f8 7b e6 dd           # f24f |   jne B, 0x7b, ${fail}:rel + PC
ec 20 1c f8 0e df dd           # f256 |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_di:
62 1c 1c 64 85                 # f25d |   mov [0x64], -123
60 40 e0 c8 01                 # f262 |   mov B, 0x1c8
d1 40 1c 64                    # f267 |   icmp B, [0x64]
4c 20                          # f26b |   getf A
ec 40 e0 f8 c8 01 c8 dd        # f26d |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 32 c0 dd           # f275 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_cmp_id:
62 1c 1c 64 85                 # f27c |   mov [0x64], -123
60 40 e0 c8 01                 # f281 |   mov B, 0x1c8
d2 1c 40 64                    # f286 |   icmp [0x64], B
4c 20                          # f28a |   getf A
ec 40 e0 f8 c8 01 a9 dd        # f28c |   jne B, 0x1c8, ${fail}:rel + PC
ec 20 1c f8 0e a1 dd           # f294 |   jne A, 0xe, ${fail}:rel + PC
                               #      | test_uop_cmp_ii:
62 1c 1c 64 85                 # f29b |   mov [0x64], -123
62 1c e0 66 38 fe              # f2a0 |   mov [0x66], 0xfe38
d3 1c 1c 64 66                 # f2a6 |   icmp [0x64], [0x66]
4c 20                          # f2ab |   getf A
ee 1c 1c f8 64 85 88 dd        # f2ad |   jne [0x64], -123, ${fail}:rel + PC
ee 1c e0 f8 66 38 fe 80 dd     # f2b5 |   jne [0x66], 0xfe38, ${fail}:rel + PC
ec 20 1c f8 32 77 dd           # f2be |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_jmp_d:
60 20 e0 d0 f2                 # f2c5 |   mov A, ${_L_test_uop_jmp_d_okay}
58 20                          # f2ca |   jmp A
58 f8 69 dd                    # f2cc |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_d_okay:
                               #      | test_uop_jmp_i:
62 1c e0 64 dd f2              # f2d0 |   mov [0x64], ${_L_test_uop_jmp_i_okay}
5a 1c 64                       # f2d6 |   jmp [0x64]
58 f8 5c dd                    # f2d9 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_i_okay:
ee 1c e0 f8 64 dd f2 58 dd     # f2dd |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_i:
62 1c e0 64 fc f2              # f2e6 |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
50 1c 1c 01 02                 # f2ec |   cmp 0x1, 0x2
68 f8 44 dd                    # f2f1 |   jeq ${fail}:rel + PC
6e 1c 64                       # f2f5 |   jne [0x64]
58 f8 3d dd                    # f2f8 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_i_okay:
ee 1c e0 f8 64 fc f2 39 dd     # f2fc |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_cond_d:
60 20 e0 19 f3                 # f305 |   mov A, ${_L_test_uop_jmp_cond_d_okay}
50 1c 1c 01 01                 # f30a |   cmp 0x1, 0x1
6c f8 26 dd                    # f30f |   jne ${fail}:rel + PC
68 20                          # f313 |   jeq A
58 f8 20 dd                    # f315 |   jmp ${fail}:rel + PC
                               #      | _L_test_uop_jmp_cond_d_okay:
ec 20 e0 f8 19 f3 1c dd        # f319 |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                               #      | test_uop_jmp_3dd:
60 20 1c 7b                    # f321 |   mov A, 0x7b
ec 20 1c f8 7b 10 dd           # f325 |   jne A, 0x7b, ${fail}:rel + PC
e8 20 1c f8 7b 0b 00           # f32c |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
58 f8 02 dd                    # f333 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3dd_okay:
ec 20 1c f8 7b fe dc           # f337 |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_jmp_3di:
60 20 1c 7b                    # f33e |   mov A, 0x7b
62 1c e0 64 41 01              # f342 |   mov [0x64], 0x141
e9 20 1c f8 64 ed dc           # f348 |   jeq A, [0x64], ${fail}:rel + PC
ed 20 1c f8 64 0b 00           # f34f |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
58 f8 df dc                    # f356 |   jmp ${fail}:rel + PC
                               #      | test_uop_jmp_3di_okay:
ec 20 1c f8 7b db dc           # f35a |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 d4 dc     # f361 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3id:
60 20 1c 7b                    # f36a |   mov A, 0x7b
62 1c e0 64 41 01              # f36e |   mov [0x64], 0x141
ea 1c 20 f8 64 c1 dc           # f374 |   jeq [0x64], A, ${fail}:rel + PC
ee 1c 20 f8 64 0b 00           # f37b |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
58 f8 b3 dc                    # f382 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3id_okay:
ec 20 1c f8 7b af dc           # f386 |   jne A, 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 a8 dc     # f38d |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_jmp_3ii:
62 e0 1c c8 00 7b              # f396 |   mov [0xc8], 0x7b
62 1c e0 64 41 01              # f39c |   mov [0x64], 0x141
eb 1c e0 f8 64 c8 00 93 dc     # f3a2 |   jeq [0x64], [0xc8], ${fail}:rel + PC
ef 1c e0 f8 64 c8 00 0d 00     # f3ab |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
58 f8 81 dc                    # f3b4 |   jmp ${fail}:rel + PC
                               #      | _test_uop_jmp_3ii_okay:
ee e0 1c f8 c8 00 7b 7d dc     # f3b8 |   jne [0xc8], 0x7b, ${fail}:rel + PC
ee 1c e0 f8 64 41 01 74 dc     # f3c1 |   jne [0x64], 0x141, ${fail}:rel + PC
                               #      | test_uop_mov_dd:
60 20 1c 7b                    # f3ca |   mov A, 0x7b
ec 20 1c f8 7b 67 dc           # f3ce |   jne A, 0x7b, ${fail}:rel + PC
                               #      | test_uop_mov_di:
62 1c 1c 64 da                 # f3d5 |   mov [0x64], 0xda
61 20 1c 64                    # f3da |   mov A, [0x64]
ec 20 1c f8 da 57 dc           # f3de |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_mov_id:
62 1c 1c 64 ff                 # f3e5 |   mov [0x64], 0xff
ee 1c 1c f8 64 ff 4b dc        # f3ea |   jne [0x64], 0xff, ${fail}:rel + PC
                               #      | test_uop_mov_ii:
60 20 1c 14                    # f3f2 |   mov A, 0x14
62 1c e0 78 fa fd              # f3f6 |   mov [0x78], 0xfdfa
63 1c 3c 64 64                 # f3fc |   mov [0x64], [A + 0x64]
ee 1c e0 f8 64 fa fd 34 dc     # f401 |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                               #      | test_uop_bmov_dd:
64 20 e0 de af                 # f40a |   bmov A, 0xafde
ec 20 e0 f8 de 00 26 dc        # f40f |   jne A, 0xde, ${fail}:rel + PC
64 20 e0 fa 00                 # f417 |   bmov A, 0xfa
ec 20 e0 f8 fa 00 19 dc        # f41c |   jne A, 0xfa, ${fail}:rel + PC
                               #      | test_uop_bmov_di:
62 1c 1c 64 da                 # f424 |   mov [0x64], 0xda
65 20 1c 64                    # f429 |   bmov A, [0x64]
ec 20 e0 f8 da 00 08 dc        # f42d |   jne A, 0xda, ${fail}:rel + PC
                               #      | test_uop_bmov_id:
62 1c e0 64 cd ab              # f435 |   mov [0x64], 0xabcd
62 1c e0 66 34 12              # f43b |   mov [0x66], 0x1234
62 1c e0 68 78 56              # f441 |   mov [0x68], 0x5678
66 1c e0 66 df 00              # f447 |   bmov [0x66], 0xdf
ee 1c e0 f8 64 cd ab e8 db     # f44d |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df 12 df db     # f456 |   jne [0x66], 0x12df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 d6 db     # f45f |   jne [0x68], 0x5678, ${fail}:rel + PC
66 1c e0 67 b8 00              # f468 |   bmov [0x67], 0xb8
ee 1c e0 f8 64 cd ab c7 db     # f46e |   jne [0x64], 0xabcd, ${fail}:rel + PC
ee 1c e0 f8 66 df b8 be db     # f477 |   jne [0x66], 0xb8df, ${fail}:rel + PC
ee 1c e0 f8 68 78 56 b5 db     # f480 |   jne [0x68], 0x5678, ${fail}:rel + PC
                               #      | test_uop_bmov_ii:
62 e0 e0 2c 01 df 00           # f489 |   mov [0x12c], 0xdf
62 e0 e0 2e 01 b8 00           # f490 |   mov [0x12e], 0xb8
62 e0 e0 c8 00 cd ab           # f497 |   mov [0xc8], 0xabcd
62 e0 e0 ca 00 34 12           # f49e |   mov [0xca], 0x1234
62 e0 e0 cc 00 78 56           # f4a5 |   mov [0xcc], 0x5678
67 e0 e0 ca 00 2c 01           # f4ac |   bmov [0xca], [0x12c]
ee e0 e0 f8 c8 00 cd ab 82 db  # f4b3 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df 12 78 db  # f4bd |   jne [0xca], 0x12df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 6e db  # f4c7 |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 64 db  # f4d1 |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 5a db  # f4db |   jne [0x12e], 0xb8, ${fail}:rel + PC
67 e0 e0 cb 00 2e 01           # f4e5 |   bmov [0xcb], [0x12e]
ee e0 e0 f8 c8 00 cd ab 49 db  # f4ec |   jne [0xc8], 0xabcd, ${fail}:rel + PC
ee e0 e0 f8 ca 00 df b8 3f db  # f4f6 |   jne [0xca], 0xb8df, ${fail}:rel + PC
ee e0 e0 f8 cc 00 78 56 35 db  # f500 |   jne [0xcc], 0x5678, ${fail}:rel + PC
ee e0 e0 f8 2c 01 df 00 2b db  # f50a |   jne [0x12c], 0xdf, ${fail}:rel + PC
ee e0 e0 f8 2e 01 b8 00 21 db  # f514 |   jne [0x12e], 0xb8, ${fail}:rel + PC
                               #      | test_uop_halt:
                               #      | test_uop_getf:
50 1c 1c 7b 2d                 # f51e |   cmp 0x7b, 0x2d
4c 20                          # f523 |   getf A
ec 20 1c f8 32 10 db           # f525 |   jne A, 0x32, ${fail}:rel + PC
                               #      | test_uop_setf:
cc 1c ff                       # f52c |   setf 0xff
4c 20                          # f52f |   getf A
ec 20 1c f8 3f 04 db           # f531 |   jne A, 0x3f, ${fail}:rel + PC
                               #      | test_uop_call_d:
60 a0 e0 00 10                 # f538 |   mov SP, 0x1000
60 40 e0 58 f5                 # f53d |   mov B, ${_L_test_uop_call_d_fn}
5c 40                          # f542 |   call B
ec 40 e0 f8 58 f5 f1 da        # f544 |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
ec 20 e0 f8 fa 34 e9 da        # f54c |   jne A, 0x34fa, ${fail}:rel + PC
58 f8 0a 00                    # f554 |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                               #      | _L_test_uop_call_d_fn:
60 20 e0 fa 34                 # f558 |   mov A, 0x34fa
dc                             # f55d |   ret
                               #      | _L_test_uop_call_d_okay:
                               #      | test_uop_call_i:
60 a0 e0 00 10                 # f55e |   mov SP, 0x1000
60 40 1c 64                    # f563 |   mov B, 0x64
62 40 e0 82 f5                 # f567 |   mov [B], ${_L_test_uop_call_i_fn}
5e 40                          # f56c |   call [B]
ee 40 e0 f8 82 f5 c7 da        # f56e |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
ec 20 e0 f8 d4 aa bf da        # f576 |   jne A, 0xaad4, ${fail}:rel + PC
58 f8 0a 00                    # f57e |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                               #      | _L_test_uop_call_i_fn:
60 20 e0 d4 aa                 # f582 |   mov A, 0xaad4
dc                             # f587 |   ret
                               #      | _L_test_uop_call_i_okay:
                               #      | test_uop_ret:
                               #      | test_uop_push_d:
60 a0 e0 00 10                 # f588 |   mov SP, 0x1000
60 40 1c 64                    # f58d |   mov B, 0x64
e0 40                          # f591 |   push B
ec a0 e0 f8 fe 0f a2 da        # f593 |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 1c f8 fe 0f 64 9a da     # f59b |   jne [0xffe], 0x64, ${fail}:rel + PC
e4 60                          # f5a4 |   pop C
ec 60 1c f8 64 8f da           # f5a6 |   jne C, 0x64, ${fail}:rel + PC
                               #      | test_uop_push_i:
60 a0 e0 00 10                 # f5ad |   mov SP, 0x1000
60 40 1c 64                    # f5b2 |   mov B, 0x64
62 40 e0 90 01                 # f5b6 |   mov [B], 0x190
e2 40                          # f5bb |   push [B]
ec a0 e0 f8 fe 0f 78 da        # f5bd |   jne SP, 0xffe, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 90 01 70 da  # f5c5 |   jne [0xffe], 0x190, ${fail}:rel + PC
e4 60                          # f5cf |   pop C
ec 60 e0 f8 90 01 64 da        # f5d1 |   jne C, 0x190, ${fail}:rel + PC
                               #      | test_uop_pop_d:
60 a0 e0 00 10                 # f5d9 |   mov SP, 0x1000
e0 e0 da fa                    # f5de |   push 0xfada
e4 20                          # f5e2 |   pop A
ec 20 e0 f8 da fa 51 da        # f5e4 |   jne A, 0xfada, ${fail}:rel + PC
                               #      | test_uop_pop_i:
60 a0 e0 00 10                 # f5ec |   mov SP, 0x1000
e0 e0 da f2                    # f5f1 |   push 0xf2da
e6 1c 64                       # f5f5 |   pop [0x64]
ee 1c e0 f8 64 da f2 3d da     # f5f8 |   jne [0x64], 0xf2da, ${fail}:rel + PC
                               #      | test_uop_mmap:
62 e0 e0 00 30 00 ff           # f601 |   mov [0x3000], 0xff00
62 e0 e0 00 31 01 ff           # f608 |   mov [0x3100], 0xff01
62 e0 e0 00 32 02 ff           # f60f |   mov [0x3200], 0xff02
62 e0 e0 00 40 00 dd           # f616 |   mov [0x4000], 0xdd00
62 e0 e0 00 41 01 dd           # f61d |   mov [0x4100], 0xdd01
62 e0 e0 00 42 02 dd           # f624 |   mov [0x4200], 0xdd02
62 e0 e0 00 50 00 ee           # f62b |   mov [0x5000], 0xee00
62 e0 e0 00 51 01 ee           # f632 |   mov [0x5100], 0xee01
62 e0 e0 00 52 02 ee           # f639 |   mov [0x5200], 0xee02
60 20 00                       # f640 |   mov A, 0
60 40 e0 00 41                 # f643 |   mov B, 0x4100
54 e0 e0 1c 00 31 ff 32 01     # f648 |   mmap 0x3100, 0x32ff, 0x1
ee e0 e0 f8 00 31 01 dd e4 d9  # f651 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 dd da d9  # f65b |   jne [0x3200], 0xdd02, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff d0 d9  # f665 |   jne [0x3000], 0xff00, ${fail}:rel + PC
60 40 e0 00 51                 # f66f |   mov B, 0x5100
54 e0 e0 1c 00 32 ff 32 02     # f674 |   mmap 0x3200, 0x32ff, 0x2
ee e0 e0 f8 00 32 01 ee b8 d9  # f67d |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff ae d9  # f687 |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 dd a4 d9  # f691 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
d4 1c 01                       # f69b |   umap 0x1
ee e0 e0 f8 00 31 01 ff 97 d9  # f69e |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 01 ee 8d d9  # f6a8 |   jne [0x3200], 0xee01, ${fail}:rel + PC
ee e0 e0 f8 00 30 00 ff 83 d9  # f6b2 |   jne [0x3000], 0xff00, ${fail}:rel + PC
d4 1c 02                       # f6bc |   umap 0x2
ee e0 e0 f8 00 30 00 ff 76 d9  # f6bf |   jne [0x3000], 0xff00, ${fail}:rel + PC
ee e0 e0 f8 00 31 01 ff 6c d9  # f6c9 |   jne [0x3100], 0xff01, ${fail}:rel + PC
ee e0 e0 f8 00 32 02 ff 62 d9  # f6d3 |   jne [0x3200], 0xff02, ${fail}:rel + PC
                               #      | test_uop_umap:
                               #      | test_aux_reg:
60 20 1c 01                    # f6dd |   mov A, 0x1
60 40 1c 02                    # f6e1 |   mov B, 0x2
60 60 1c 03                    # f6e5 |   mov C, 0x3
60 80 1c 04                    # f6e9 |   mov D, 0x4
60 fc 1c 05                    # f6ed |   mov E, 0x5
60 fd 1c 06                    # f6f1 |   mov F, 0x6
60 fe 1c 07                    # f6f5 |   mov G, 0x7
60 ff 1c 08                    # f6f9 |   mov H, 0x8
ec 20 1c f8 01 38 d9           # f6fd |   jne A, 0x1, ${fail}:rel + PC
ec 40 1c f8 02 31 d9           # f704 |   jne B, 0x2, ${fail}:rel + PC
ec 60 1c f8 03 2a d9           # f70b |   jne C, 0x3, ${fail}:rel + PC
ec 80 1c f8 04 23 d9           # f712 |   jne D, 0x4, ${fail}:rel + PC
ec fc 1c f8 05 1c d9           # f719 |   jne E, 0x5, ${fail}:rel + PC
ec fd 1c f8 06 15 d9           # f720 |   jne F, 0x6, ${fail}:rel + PC
ec fe 1c f8 07 0e d9           # f727 |   jne G, 0x7, ${fail}:rel + PC
ec ff 1c f8 08 07 d9           # f72e |   jne H, 0x8, ${fail}:rel + PC
34 ff e0 00 ff                 # f735 |   xor H, 0xff00
ec ff e0 f8 08 ff fb d8        # f73a |   jne H, 0xff08, ${fail}:rel + PC
60 20 ff                       # f742 |   mov A, H
ec 20 e0 f8 08 ff f0 d8        # f745 |   jne A, 0xff08, ${fail}:rel + PC
60 fc fe                       # f74d |   mov E, G
ec fc 1c f8 07 e5 d8           # f750 |   jne E, 0x7, ${fail}:rel + PC
ec ff e0 f8 08 ff de d8        # f757 |   jne H, 0xff08, ${fail}:rel + PC
                               #      | test_call_ret:
60 a0 e0 00 10                 # f75f |   mov SP, 0x1000
5c f8 77 00                    # f764 |   call ${fn_test_target}:rel + PC
ec a0 e0 f8 00 10 cd d8        # f768 |   jne SP, 0x1000, ${fail}:rel + PC
60 20 1c 0a                    # f770 |   mov A, 0xa
60 40 00                       # f774 |   mov B, 0
60 60 00                       # f777 |   mov C, 0
60 80 00                       # f77a |   mov D, 0
5c f8 2d 00                    # f77d |   call ${fn_recursive}:rel + PC
ec 20 00 f8 b4 d8              # f781 |   jne A, 0, ${fail}:rel + PC
ec 40 e0 f8 3f cf ae d8        # f787 |   jne B, 0xcf3f, ${fail}:rel + PC
ec 60 1c f8 2d a6 d8           # f78f |   jne C, 0x2d, ${fail}:rel + PC
ec 80 e0 f8 97 45 9f d8        # f796 |   jne D, 0x4597, ${fail}:rel + PC
ec a0 e0 f8 00 10 97 d8        # f79e |   jne SP, 0x1000, ${fail}:rel + PC
58 f8 42 00                    # f7a6 |   jmp ${test_call_ret_end}:rel + PC
                               #      | fn_recursive:
04 20 1c 01                    # f7aa |   sub A, 0x1
5c f8 25 00                    # f7ae |   call ${fn_process_c}:rel + PC
e8 20 00 f8 1c 00              # f7b2 |   jeq A, 0, ${fn_recursive_end}:rel + PC
5c f8 f2 ff                    # f7b8 |   call ${fn_recursive}:rel + PC
00 80 60                       # f7bc |   add D, C
08 80 1c 03                    # f7bf |   mul D, 0x3
00 40 80                       # f7c3 |   add B, D
e0 80                          # f7c6 |   push D
08 40 1c 05                    # f7c8 |   mul B, 0x5
e4 80                          # f7cc |   pop D
                               #      | fn_recursive_end:
dc                             # f7ce |   ret
58 f8 66 d8                    # f7cf |   jmp ${fail}:rel + PC
                               #      | fn_process_c:
00 60 20                       # f7d3 |   add C, A
dc                             # f7d6 |   ret
58 f8 5e d8                    # f7d7 |   jmp ${fail}:rel + PC
                               #      | fn_test_target:
ec a0 e0 f8 fe 0f 5a d8        # f7db |   jne SP, 0xffe, ${fail}:rel + PC
dc                             # f7e3 |   ret
58 f8 51 d8                    # f7e4 |   jmp ${fail}:rel + PC
                               #      | test_call_ret_end:
                               #      | test_mem_access:
62 e0 1c 00 01 ed              # f7e8 |   mov [0x100], 0xed
ee e0 e0 f8 00 01 aa 00 0e 00  # f7ee |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
58 f8 3d d8                    # f7f8 |   jmp ${fail}:rel + PC
                               #      | test_mem_access_check_jmp:
62 e0 00 00 10                 # f7fc |   mov [0x1000], 0
60 a0 e0 00 10                 # f801 |   mov SP, 0x1000
ee a0 00 f8 2f d8              # f806 |   jne [SP], 0, ${fail}:rel + PC
e0 00                          # f80c |   push 0
e0 00                          # f80e |   push 0
e0 00                          # f810 |   push 0
e4 20                          # f812 |   pop A
e4 20                          # f814 |   pop A
e4 20                          # f816 |   pop A
ec a0 e0 f8 00 10 1d d8        # f818 |   jne SP, 0x1000, ${fail}:rel + PC
ec 20 00 f8 15 d8              # f820 |   jne A, 0, ${fail}:rel + PC
e0 e0 02 01                    # f826 |   push 0x102
ec a0 e0 f8 fe 0f 0b d8        # f82a |   jne SP, 0xffe, ${fail}:rel + PC
e0 e0 04 03                    # f832 |   push 0x304
ec a0 e0 f8 fc 0f ff d7        # f836 |   jne SP, 0xffc, ${fail}:rel + PC
ee e0 e0 f8 fe 0f 02 01 f7 d7  # f83e |   jne [0xffe], 0x102, ${fail}:rel + PC
ee e0 e0 f8 fc 0f 04 03 ed d7  # f848 |   jne [0xffc], 0x304, ${fail}:rel + PC
ee e0 e0 f8 fb 0f 00 04 e3 d7  # f852 |   jne [0xffb], 0x400, ${fail}:rel + PC
ee e0 e0 f8 fd 0f 03 02 d9 d7  # f85c |   jne [0xffd], 0x203, ${fail}:rel + PC
ee e0 1c f8 ff 0f 01 cf d7     # f866 |   jne [0xfff], 0x1, ${fail}:rel + PC
e4 20                          # f86f |   pop A
ec 20 e0 f8 04 03 c4 d7        # f871 |   jne A, 0x304, ${fail}:rel + PC
ec a0 e0 f8 fe 0f bc d7        # f879 |   jne SP, 0xffe, ${fail}:rel + PC
e4 20                          # f881 |   pop A
ec 20 e0 f8 02 01 b2 d7        # f883 |   jne A, 0x102, ${fail}:rel + PC
ec a0 e0 f8 00 10 aa d7        # f88b |   jne SP, 0x1000, ${fail}:rel + PC
                               #      | test_cmp:
cc 1c ff                       # f893 |   setf 0xff
4c 20                          # f896 |   getf A
ec 20 1c f8 3f 9d d7           # f898 |   jne A, 0x3f, ${fail}:rel + PC
cc e0 ab ab                    # f89f |   setf 0xabab
4c 20                          # f8a3 |   getf A
ec 20 1c f8 2b 90 d7           # f8a5 |   jne A, 0x2b, ${fail}:rel + PC
50 1c 1c ab 2b                 # f8ac |   cmp 0xab, 0x2b
4c 20                          # f8b1 |   getf A
ec 20 1c f8 32 82 d7           # f8b3 |   jne A, 0x32, ${fail}:rel + PC
50 1c 1c 2b ab                 # f8ba |   cmp 0x2b, 0xab
4c 20                          # f8bf |   getf A
ec 20 1c f8 0e 74 d7           # f8c1 |   jne A, 0xe, ${fail}:rel + PC
50 1c 1c ab ab                 # f8c8 |   cmp 0xab, 0xab
4c 20                          # f8cd |   getf A
ec 20 1c f8 29 66 d7           # f8cf |   jne A, 0x29, ${fail}:rel + PC
d0 1c 1c ab 2b                 # f8d6 |   icmp 0xab, 0x2b
4c 20                          # f8db |   getf A
ec 20 1c f8 0e 58 d7           # f8dd |   jne A, 0xe, ${fail}:rel + PC
d0 1c 1c 2b ab                 # f8e4 |   icmp 0x2b, 0xab
4c 20                          # f8e9 |   getf A
ec 20 1c f8 32 4a d7           # f8eb |   jne A, 0x32, ${fail}:rel + PC
d0 1c 1c ab ab                 # f8f2 |   icmp 0xab, 0xab
4c 20                          # f8f7 |   getf A
ec 20 1c f8 29 3c d7           # f8f9 |   jne A, 0x29, ${fail}:rel + PC
                               #      | end_of_test:
60 20 e0 ad de                 # f900 |   mov A, 0xdead
60 40 e0 ef be                 # f905 |   mov B, 0xbeef
88 60 20 40                    # f90a |   mul C, A, B
58 f8 2c d7                    # f90e |   jmp ${success}:rel + PC
dc                             # f912 |   ret
                               #      | end_fn_self_test:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x0000
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
