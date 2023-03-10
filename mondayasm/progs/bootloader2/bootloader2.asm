                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 00 ff                 # a000 |   mov SP, 0xff00
62 e0 e0 00 01 37 a7           # a005 |   mov [0x100], ${fn_syscall_entry}
                               #      | _A_call_59:
5c f8 44 07                    # a00c |   call ${fn_main}:rel + PC
                               #      | _Z_call_59:
d8                             # a010 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # a011 |   push C
e0 40                          # a013 |   push B
e0 20                          # a015 |   push A
60 a0 bc ee                    # a017 |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # a01b |   mov B, SP + 0x1c
                               #      | _A_for_1:
61 20 bc 1a                    # a01f |   mov A, [SP + 0x1a]
                               #      | _BA_for_1:
65 60 20                       # a023 |   bmov C, [A]
e8 60 00 f8 fd 00              # a026 |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # a02c |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # a033 |   push C
5c f8 f9 00                    # a035 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a039 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 e0 00                    # a03d |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # a041 |   inc A
65 60 20                       # a043 |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # a046 |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 d7 00                    # a04c |   jmp ${_C_for_1}:rel + PC
58 f8 c9 00                    # a050 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 25 1a 00           # a054 |   jne C, 0x25, ${_E2_if_4}:rel + PC
                               #      | _A_call_2:
e0 1c 25                       # a05b |   push 0x25
5c f8 d0 00                    # a05e |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a062 |   mov SP, SP + 0x2
                               #      | _Z_call_2:
58 f8 b7 00                    # a066 |   jmp ${_BZ_for_1}:rel + PC
58 f8 af 00                    # a06a |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 64 21 00           # a06e |   jne C, 0x64, ${_E3_if_4}:rel + PC
                               #      | _A_call_3:
e0 a0                          # a075 |   push SP
e2 40                          # a077 |   push [B]
5c f8 cd 00                    # a079 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # a07d |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 a0                          # a081 |   push SP
5c f8 10 01                    # a083 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a087 |   mov SP, SP + 0x2
                               #      | _Z_call_5:
58 f8 8e 00                    # a08b |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 78 21 00           # a08f |   jne C, 0x78, ${_E4_if_4}:rel + PC
                               #      | _A_call_7:
e0 a0                          # a096 |   push SP
e2 40                          # a098 |   push [B]
5c f8 1b 01                    # a09a |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a09e |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 a0                          # a0a2 |   push SP
5c f8 ef 00                    # a0a4 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0a8 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
58 f8 6d 00                    # a0ac |   jmp ${_C_if_4}:rel + PC
                               #      | _E4_if_4:
ec 60 1c f8 68 22 00           # a0b0 |   jne C, 0x68, ${_E5_if_4}:rel + PC
                               #      | _A_call_9:
e0 a0                          # a0b7 |   push SP
e2 40                          # a0b9 |   push [B]
5c f8 fa 00                    # a0bb |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a0bf |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 bc 02                       # a0c3 |   push SP + 0x2
5c f8 cd 00                    # a0c6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0ca |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 4b 00                    # a0ce |   jmp ${_C_if_4}:rel + PC
                               #      | _E5_if_4:
ec 60 1c f8 62 21 00           # a0d2 |   jne C, 0x62, ${_E6_if_4}:rel + PC
                               #      | _A_call_11:
e0 a0                          # a0d9 |   push SP
e2 40                          # a0db |   push [B]
5c f8 2e 01                    # a0dd |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # a0e1 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 a0                          # a0e5 |   push SP
5c f8 ac 00                    # a0e7 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0eb |   mov SP, SP + 0x2
                               #      | _Z_call_12:
58 f8 2a 00                    # a0ef |   jmp ${_C_if_4}:rel + PC
                               #      | _E6_if_4:
ec 60 1c f8 73 15 00           # a0f3 |   jne C, 0x73, ${_E7_if_4}:rel + PC
                               #      | _A_call_13:
e2 40                          # a0fa |   push [B]
5c f8 97 00                    # a0fc |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a100 |   mov SP, SP + 0x2
                               #      | _Z_call_13:
58 f8 15 00                    # a104 |   jmp ${_C_if_4}:rel + PC
                               #      | _E7_if_4:
ec 60 1c f8 63 11 00           # a108 |   jne C, 0x63, ${_E8_if_4}:rel + PC
                               #      | _A_call_14:
e2 40                          # a10f |   push [B]
5c f8 1d 00                    # a111 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a115 |   mov SP, SP + 0x2
                               #      | _Z_call_14:
                               #      | _E8_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
60 40 5c 02                    # a119 |   mov B, B + 0x2
                               #      | _BZ_for_1:
44 20                          # a11d |   inc A
58 f8 04 ff                    # a11f |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # a123 |   mov SP, SP + 0x12
e4 20                          # a127 |   pop A
e4 40                          # a129 |   pop B
e4 60                          # a12b |   pop C
dc                             # a12d |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a12e |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a135 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a13b |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a13f |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a145 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # a146 |   push C
e0 40                          # a148 |   push B
e0 20                          # a14a |   push A
61 20 bc 0a                    # a14c |   mov A, [SP + 0xa]
62 20 1c 30                    # a150 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # a154 |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # a158 |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # a15e |   div C, B, 0xa
82 20 ff 1c 30                 # a163 |   add [A], H, 0x30
44 20                          # a168 |   inc A
60 40 60                       # a16a |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # a16d |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # a171 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # a175 |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # a17b |   dec A
61 40 60                       # a17d |   mov B, [C]
67 60 20                       # a180 |   bmov [C], [A]
66 20 40                       # a183 |   bmov [A], B
44 60                          # a186 |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # a188 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # a18c |   pop A
e4 40                          # a18e |   pop B
e4 60                          # a190 |   pop C
dc                             # a192 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a193 |   push A
                               #      | _A_for_2:
61 20 bc 04                    # a195 |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # a199 |   bmov H, [A]
e8 ff 00 f8 16 00              # a19c |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_4:
e0 ff                          # a1a2 |   push H
5c f8 8a ff                    # a1a4 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a1a8 |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # a1ac |   inc A
58 f8 eb ff                    # a1ae |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # a1b2 |   pop A
dc                             # a1b4 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # a1b5 |   push C
e0 40                          # a1b7 |   push B
e0 20                          # a1b9 |   push A
61 40 bc 08                    # a1bb |   mov B, [SP + 0x8]
61 60 bc 0a                    # a1bf |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # a1c3 |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # a1c7 |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # a1ce |   shr H, B, A*4
2c ff 1c 0f                    # a1d2 |   and H, 0xf
                               #      | _A_call_6:
e0 ff                          # a1d6 |   push H
5c f8 1a 00                    # a1d8 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # a1dc |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 60 ff                       # a1e0 |   mov [C], H
44 60                          # a1e3 |   inc C
                               #      | _BZ_for_3:
48 20                          # a1e5 |   dec A
58 f8 e0 ff                    # a1e7 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # a1eb |   pop A
e4 40                          # a1ed |   pop B
e4 60                          # a1ef |   pop C
dc                             # a1f1 |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_6:
fa bc 1c f8 02 09 12 00        # a1f2 |   jgt [SP + 0x2], 0x9, ${_E_if_6}:rel + PC
81 ff bc 1c 02 30              # a1fa |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # a200 |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
81 ff bc 1c 02 57              # a204 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # a20a |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # a20b |   push C
e0 40                          # a20d |   push B
e0 20                          # a20f |   push A
61 40 bc 08                    # a211 |   mov B, [SP + 0x8]
61 60 bc 0a                    # a215 |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # a219 |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # a21d |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # a224 |   shr H, B, A
2c ff 1c 01                    # a228 |   and H, 0x1
82 60 ff 1c 30                 # a22c |   add [C], H, 0x30
44 60                          # a231 |   inc C
                               #      | _BZ_for_4:
48 20                          # a233 |   dec A
58 f8 e8 ff                    # a235 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # a239 |   pop A
e4 40                          # a23b |   pop B
e4 60                          # a23d |   pop C
dc                             # a23f |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_getc:
                               #      | _begin_fn_getc:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 02 ff                 # a240 |   mov H, [0xff02]
ac fe ff e0 00 80              # a245 |   and G, H, 0x8000
e8 fe 00 f8 f5 ff              # a24b |   jeq G, 0, ${_BA_loop_2}:rel + PC
2c ff e0 ff 00                 # a251 |   and H, 0xff
58 f8 08 00                    # a256 |   jmp ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 e6 ff                    # a25a |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_getc:
dc                             # a25e |   ret
                               #      | _end_fn_getc:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # a25f |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # a265 |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # a26c |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # a273 |   sub H, G, 0x30
c4 fe 00                       # a278 |   inc G, 0
dc                             # a27b |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # a27c |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # a283 |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # a28a |   add H, G, -87
c4 fe 00                       # a28f |   inc G, 0
dc                             # a292 |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # a293 |   mov H, 0
60 fe 00                       # a296 |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # a299 |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # a29a |   push B
e0 20                          # a29c |   push A
60 20 00                       # a29e |   mov A, 0
61 40 bc 06                    # a2a1 |   mov B, [SP + 0x6]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
65 ff 40                       # a2a5 |   bmov H, [B]
e8 ff 00 f8 23 00              # a2a8 |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_15:
e0 ff                          # a2ae |   push H
5c f8 af ff                    # a2b0 |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # a2b4 |   mov SP, SP + 0x2
                               #      | _Z_call_15:
e8 fe 00 f8 2d 00              # a2b8 |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # a2be |   shl A, 0x4
00 20 ff                       # a2c2 |   add A, H
44 40                          # a2c5 |   inc B
                               #      | _BZ_loop_3:
58 f8 de ff                    # a2c7 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
60 fe 00                       # a2cb |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # a2ce |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # a2d2 |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # a2d8 |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # a2df |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # a2e2 |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # a2e5 |   pop A
e4 40                          # a2e7 |   pop B
dc                             # a2e9 |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # a2ea |   push B
e0 20                          # a2ec |   push A
65 fe bc 08                    # a2ee |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # a2f2 |   shl H, G, 0x8
30 ff fe                       # a2f7 |   or H, G
61 20 bc 06                    # a2fa |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # a2fe |   add B, [SP + 0xa], A
                               #      | _A_while_3:
                               #      | _BA_while_3:
f8 3c 40 f8 02 12 00           # a303 |   jgt A + 0x2, B, ${_C_while_3}:rel + PC
62 20 ff                       # a30a |   mov [A], H
60 20 3c 02                    # a30d |   mov A, A + 0x2
                               #      | _BZ_while_3:
58 f8 f2 ff                    # a311 |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _A_if_16:
fc 20 40 f8 09 00              # a315 |   jge A, B, ${_E_if_16}:rel + PC
66 20 ff                       # a31b |   bmov [A], H
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _cleanup_fn_memset:
e4 20                          # a31e |   pop A
e4 40                          # a320 |   pop B
dc                             # a322 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # a323 |   push C
e0 40                          # a325 |   push B
e0 20                          # a327 |   push A
61 20 bc 08                    # a329 |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # a32d |   add B, [SP + 0xc], A
61 60 bc 0a                    # a332 |   mov C, [SP + 0xa]
                               #      | _A_while_4:
                               #      | _BA_while_4:
f8 3c 40 f8 02 16 00           # a336 |   jgt A + 0x2, B, ${_C_while_4}:rel + PC
63 20 60                       # a33d |   mov [A], [C]
60 20 3c 02                    # a340 |   mov A, A + 0x2
60 60 7c 02                    # a344 |   mov C, C + 0x2
                               #      | _BZ_while_4:
58 f8 ee ff                    # a348 |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      | _A_if_17:
fc 20 40 f8 09 00              # a34c |   jge A, B, ${_E_if_17}:rel + PC
67 20 60                       # a352 |   bmov [A], [C]
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _cleanup_fn_memcpy:
e4 20                          # a355 |   pop A
e4 40                          # a357 |   pop B
e4 60                          # a359 |   pop C
dc                             # a35b |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_strcmp:
                               #      | _begin_fn_strcmp:
61 fc bc 02                    # a35c |   mov E, [SP + 0x2]
61 fd bc 04                    # a360 |   mov F, [SP + 0x4]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
65 fe fc                       # a364 |   bmov G, [E]
65 ff fd                       # a367 |   bmov H, [F]
84 ff fe ff                    # a36a |   sub H, G, H
ec ff 00 f8 14 00              # a36e |   jne H, 0, ${_cleanup_fn_strcmp}:rel + PC
e8 fe 00 f8 0e 00              # a374 |   jeq G, 0, ${_cleanup_fn_strcmp}:rel + PC
44 fc                          # a37a |   inc E
44 fd                          # a37c |   inc F
                               #      | _BZ_loop_4:
58 f8 e6 ff                    # a37e |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_strcmp:
dc                             # a382 |   ret
                               #      | _end_fn_strcmp:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # a383 |   push A
61 fc bc 04                    # a385 |   mov E, [SP + 0x4]
61 fd bc 06                    # a389 |   mov F, [SP + 0x6]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
65 fe fc                       # a38d |   bmov G, [E]
65 ff fd                       # a390 |   bmov H, [F]
60 20 fe                       # a393 |   mov A, G
30 fe 1c 20                    # a396 |   or G, 0x20
30 ff 1c 20                    # a39a |   or H, 0x20
84 ff fe ff                    # a39e |   sub H, G, H
ec ff 00 f8 14 00              # a3a2 |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # a3a8 |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # a3ae |   inc E
44 fd                          # a3b0 |   inc F
                               #      | _BZ_loop_5:
58 f8 db ff                    # a3b2 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # a3b6 |   pop A
dc                             # a3b8 |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # a3b9 |   mov H, [SP + 0x2]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 fe ff                       # a3bd |   bmov G, [H]
e9 fe bc f8 04 17 00           # a3c0 |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_24:
ec fe 00 f8 0a 00              # a3c7 |   jne G, 0, ${_E_if_24}:rel + PC
60 ff 00                       # a3cd |   mov H, 0
dc                             # a3d0 |   ret
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
44 ff                          # a3d1 |   inc H
                               #      | _BZ_loop_6:
58 f8 ea ff                    # a3d3 |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _cleanup_fn_strchr:
dc                             # a3d7 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc 00 fb 02              # a3d8 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # a3de |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 00 fb                 # a3df |   inc H, [${var__rand__state}]
62 e0 ff 00 fb                 # a3e4 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # a3e9 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # a3ea |   push D
e0 60                          # a3ec |   push C
e0 40                          # a3ee |   push B
e0 20                          # a3f0 |   push A
61 40 e0 10 ff                 # a3f2 |   mov B, [0xff10]
61 60 e0 12 ff                 # a3f7 |   mov C, [0xff12]
61 80 e0 14 ff                 # a3fc |   mov D, [0xff14]
61 20 bc 0e                    # a401 |   mov A, [SP + 0xe]
60 ff 00                       # a405 |   mov H, 0
                               #      | _A_if_25:
fc 28 20 f8 09 00              # a408 |   jge A + B, A, ${_E_if_25}:rel + PC
c4 ff 00                       # a40e |   inc H, 0
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
60 40 44                       # a411 |   mov B, B + A
81 20 bc ff 0c                 # a414 |   add A, [SP + 0xc], H
60 ff 00                       # a419 |   mov H, 0
                               #      | _A_scope_4:
                               #      | _B_scope_4:
f0 2c 20 f8 10 00              # a41c |   jlt A + C, A, ${_C_scope_4}:rel + PC
f0 20 ff f8 0a 00              # a422 |   jlt A, H, ${_C_scope_4}:rel + PC
58 f8 07 00                    # a428 |   jmp ${_Z_scope_4}:rel + PC
                               #      | _C_scope_4:
c4 ff 00                       # a42c |   inc H, 0
                               #      | _Z_scope_4:
60 60 64                       # a42f |   mov C, C + A
81 20 bc ff 0a                 # a432 |   add A, [SP + 0xa], H
60 80 84                       # a437 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # a43a |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 14 ff                 # a43e |   mov H, [0xff14]
                               #      | _A_if_28:
f4 ff 80 f8 0a 00              # a443 |   jle H, D, ${_E_if_28}:rel + PC
58 f8 33 00                    # a449 |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_28:
ec ff 80 f8 2b 00              # a44d |   jne H, D, ${_E2_if_28}:rel + PC
61 ff e0 12 ff                 # a453 |   mov H, [0xff12]
                               #      | _A_if_29:
f4 ff 60 f8 0a 00              # a458 |   jle H, C, ${_E_if_29}:rel + PC
58 f8 1e 00                    # a45e |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_29:
ec ff 60 f8 16 00              # a462 |   jne H, C, ${_E2_if_29}:rel + PC
fa e0 40 f8 10 ff 14 00        # a468 |   jgt [0xff10], B, ${_C_loop_7}:rel + PC
                               #      | _A_if_31:
e8 20 00 f8 08 00              # a470 |   jeq A, 0, ${_E_if_31}:rel + PC
5c 20                          # a476 |   call A
                               #      | _E_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
                               #      | _E2_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _E2_if_28:
                               #      | _C_if_28:
                               #      | _Z_if_28:
                               #      | _BZ_loop_7:
58 f8 c6 ff                    # a478 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # a47c |   pop A
e4 40                          # a47e |   pop B
e4 60                          # a480 |   pop C
e4 80                          # a482 |   pop D
dc                             # a484 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_17:
e0 00                          # a485 |   push 0
5c f8 15 00                    # a487 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a48b |   mov SP, SP + 0x2
                               #      | _Z_call_17:
                               #      | _A_call_18:
e0 e0 1d aa                    # a48f |   push ${const__str__PONG__endl}
5c f8 00 fd                    # a493 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a497 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
                               #      | _cleanup_fn_handle_ping:
dc                             # a49b |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # a49c |   inc G, 0
                               #      | _A_if_32:
eb e0 bc f8 02 fb 02 1f 00     # a49f |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_32}:rel + PC
                               #      | _A_call_16:
e2 e0 02 fb                    # a4a8 |   push [${var__g_num_args}]
e2 bc 04                       # a4ac |   push [SP + 0x4]
e0 e0 f9 a9                    # a4af |   push ${const__data_1}
5c f8 5e fb                    # a4b3 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a4b7 |   mov SP, SP + 0x6
                               #      | _Z_call_16:
60 fe 00                       # a4bb |   mov G, 0
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _cleanup_fn_check_num_args:
dc                             # a4be |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # a4bf |   push D
e0 60                          # a4c1 |   push C
e0 40                          # a4c3 |   push B
e0 20                          # a4c5 |   push A
60 a0 bc fa                    # a4c7 |   mov SP, SP + -6
                               #      | _A_call_19:
e0 1c 02                       # a4cb |   push 0x2
5c f8 ce ff                    # a4ce |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a4d2 |   mov SP, SP + 0x2
                               #      | _Z_call_19:
e8 fe 00 f8 9a 00              # a4d6 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_21:
5c f8 a1 00                    # a4dc |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_21:
e8 fe 00 f8 90 00              # a4e0 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 04 fb                 # a4e6 |   mov A, [${var__g_args}]
61 40 e0 06 fb                 # a4eb |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_22:
e0 40                          # a4f0 |   push B
e0 20                          # a4f2 |   push A
e0 e0 3f aa                    # a4f4 |   push ${const__data_2}
5c f8 19 fb                    # a4f8 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a4fc |   mov SP, SP + 0x6
                               #      | _Z_call_22:
                               #      | _A_if_38:
ee bc 1c f8 10 02 3c 00        # a500 |   jne [SP + 0x10], 0x2, ${_E_if_38}:rel + PC
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 20 40 f8 30 00              # a508 |   jge A, B, ${_C_while_5}:rel + PC
61 60 20                       # a50e |   mov C, [A]
a0 80 60 1c 08                 # a511 |   shr D, C, 0x8
28 60 1c 08                    # a516 |   shl C, 0x8
                               #      | _A_call_23:
e0 a0                          # a51a |   push SP
e0 8c                          # a51c |   push D + C
5c f8 97 fc                    # a51e |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a522 |   mov SP, SP + 0x4
                               #      | _Z_call_23:
                               #      | _A_call_24:
e0 a0                          # a526 |   push SP
5c f8 6b fc                    # a528 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a52c |   mov SP, SP + 0x2
                               #      | _Z_call_24:
60 20 3c 02                    # a530 |   mov A, A + 0x2
                               #      | _BZ_while_5:
58 f8 d4 ff                    # a534 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
58 f8 2d 00                    # a538 |   jmp ${_C_if_38}:rel + PC
                               #      | _E_if_38:
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc 20 40 f8 29 00              # a53c |   jge A, B, ${_C_while_6}:rel + PC
61 60 20                       # a542 |   mov C, [A]
                               #      | _A_call_25:
e0 60                          # a545 |   push C
5c f8 e7 fb                    # a547 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a54b |   mov SP, SP + 0x2
                               #      | _Z_call_25:
20 60 1c 08                    # a54f |   shr C, 0x8
                               #      | _A_call_26:
e0 60                          # a553 |   push C
5c f8 d9 fb                    # a555 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a559 |   mov SP, SP + 0x2
                               #      | _Z_call_26:
60 20 3c 02                    # a55d |   mov A, A + 0x2
                               #      | _BZ_while_6:
58 f8 db ff                    # a561 |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
                               #      | _C_if_38:
                               #      | _Z_if_38:
                               #      | _A_call_27:
e0 1c 0a                       # a565 |   push 0xa
5c f8 c6 fb                    # a568 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a56c |   mov SP, SP + 0x2
                               #      | _Z_call_27:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # a570 |   mov SP, SP + 0x6
e4 20                          # a574 |   pop A
e4 40                          # a576 |   pop B
e4 60                          # a578 |   pop C
e4 80                          # a57a |   pop D
dc                             # a57c |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # a57d |   push C
e0 40                          # a57f |   push B
e0 20                          # a581 |   push A
61 20 e0 04 fb                 # a583 |   mov A, [${var__g_args}]
61 40 e0 06 fb                 # a588 |   mov B, [${var__g_args} + 0002]
60 60 e0 23 aa                 # a58d |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # a592 |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 32 aa                 # a598 |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # a59d |   and G, A, 0x1
ec fe 00 f8 18 00              # a5a2 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # a5a8 |   and G, B, 0x1
ec fe 00 f8 0d 00              # a5ad |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # a5b3 |   inc G, 0
58 f8 11 00                    # a5b6 |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_20:
e0 60                          # a5ba |   push C
5c f8 d7 fb                    # a5bc |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a5c0 |   mov SP, SP + 0x2
                               #      | _Z_call_20:
60 fe 00                       # a5c4 |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # a5c7 |   pop A
e4 40                          # a5c9 |   pop B
e4 60                          # a5cb |   pop C
dc                             # a5cd |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # a5ce |   push D
e0 60                          # a5d0 |   push C
e0 40                          # a5d2 |   push B
e0 20                          # a5d4 |   push A
60 a0 bc fa                    # a5d6 |   mov SP, SP + -6
                               #      | _A_call_28:
e0 1c 02                       # a5da |   push 0x2
5c f8 bf fe                    # a5dd |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a5e1 |   mov SP, SP + 0x2
                               #      | _Z_call_28:
e8 fe 00 f8 dc 00              # a5e5 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_29:
5c f8 92 ff                    # a5eb |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_29:
e8 fe 00 f8 d2 00              # a5ef |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 04 fb                 # a5f5 |   mov A, [${var__g_args}]
61 40 e0 06 fb                 # a5fa |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_41:
ee bc 1c f8 10 03 55 00        # a5ff |   jne [SP + 0x10], 0x3, ${_E_if_41}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 49 00              # a607 |   jge A, B, ${_C_while_7}:rel + PC
                               #      | _A_for_5:
60 80 00                       # a60d |   mov D, 0
                               #      | _BA_for_5:
fc 80 1c f8 04 19 00           # a610 |   jge D, 0x4, ${_C_for_5}:rel + PC
                               #      | _A_call_30:
5c f8 29 fc                    # a617 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_30:
62 e0 ff 00 ff                 # a61b |   mov [0xff00], H
62 b0 ff                       # a620 |   mov [SP + D], H
                               #      | _BZ_for_5:
44 80                          # a623 |   inc D
58 f8 eb ff                    # a625 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _A_call_31:
e0 a0                          # a629 |   push SP
5c f8 6f fc                    # a62b |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a62f |   mov SP, SP + 0x2
                               #      | _Z_call_31:
e8 fe 00 f8 7f 00              # a633 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # a639 |   shl C, H, 0x8
20 ff 1c 08                    # a63e |   shr H, 0x8
30 60 ff                       # a642 |   or C, H
62 20 60                       # a645 |   mov [A], C
60 20 3c 02                    # a648 |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 bb ff                    # a64c |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 31 00                    # a650 |   jmp ${_C_if_41}:rel + PC
                               #      | _E_if_41:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 2d 00              # a654 |   jge A, B, ${_C_while_8}:rel + PC
                               #      | _A_call_32:
5c f8 e6 fb                    # a65a |   call ${fn_getc}:rel + PC
                               #      | _Z_call_32:
62 e0 ff 00 ff                 # a65e |   mov [0xff00], H
60 60 ff                       # a663 |   mov C, H
                               #      | _A_call_33:
5c f8 da fb                    # a666 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_33:
62 e0 ff 00 ff                 # a66a |   mov [0xff00], H
28 ff 1c 08                    # a66f |   shl H, 0x8
30 60 ff                       # a673 |   or C, H
62 20 60                       # a676 |   mov [A], C
60 20 3c 02                    # a679 |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 d7 ff                    # a67d |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_41:
                               #      | _Z_if_41:
                               #      | _A_call_34:
5c f8 bf fb                    # a681 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_34:
62 e0 ff 00 ff                 # a685 |   mov [0xff00], H
                               #      | _A_scope_5:
                               #      | _B_scope_5:
e8 ff 1c f8 0a 12 00           # a68a |   jeq H, 0xa, ${_C_scope_5}:rel + PC
e8 ff 1c f8 0d 0b 00           # a691 |   jeq H, 0xd, ${_C_scope_5}:rel + PC
58 f8 1a 00                    # a698 |   jmp ${_L_fn_handle_write_1}:rel + PC
                               #      | _C_scope_5:
                               #      | _Z_scope_5:
                               #      | _A_call_35:
e0 40                          # a69c |   push B
e2 e0 04 fb                    # a69e |   push [${var__g_args}]
e0 e0 4e aa                    # a6a2 |   push ${const__data_3}
5c f8 6b f9                    # a6a6 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a6aa |   mov SP, SP + 0x6
                               #      | _Z_call_35:
58 f8 13 00                    # a6ae |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_36:
e0 e0 5e aa                    # a6b2 |   push ${const__data_4}
5c f8 dd fa                    # a6b6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a6ba |   mov SP, SP + 0x2
                               #      | _Z_call_36:
60 fe 00                       # a6be |   mov G, 0
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # a6c1 |   mov SP, SP + 0x6
e4 20                          # a6c5 |   pop A
e4 40                          # a6c7 |   pop B
e4 60                          # a6c9 |   pop C
e4 80                          # a6cb |   pop D
dc                             # a6cd |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
                               #      | _A_call_37:
e0 1c 01                       # a6ce |   push 0x1
5c f8 cb fd                    # a6d1 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a6d5 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
e8 fe 00 f8 5d 00              # a6d9 |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_if_46:
ee bc 1c f8 02 06 1c 00        # a6df |   jne [SP + 0x2], 0x6, ${_E_if_46}:rel + PC
                               #      | _A_call_38:
e2 e0 04 fb                    # a6e7 |   push [${var__g_args}]
e0 e0 6d aa                    # a6eb |   push ${const__data_5}
5c f8 22 f9                    # a6ef |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a6f3 |   mov SP, SP + 0x4
                               #      | _Z_call_38:
5a f8 0d 54                    # a6f7 |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_46:
                               #      | _C_if_46:
                               #      | _Z_if_46:
63 e0 e0 1c ff 04 fb           # a6fb |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_39:
e2 e0 1c ff                    # a702 |   push [0xff1c]
e0 e0 78 aa                    # a706 |   push ${const__data_6}
5c f8 07 f9                    # a70a |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a70e |   mov SP, SP + 0x4
                               #      | _Z_call_39:
                               #      | glb_jmp_to_stored_target:
62 e0 00 0a ff                 # a712 |   mov [0xff0a], 0
60 20 00                       # a717 |   mov A, 0
60 40 00                       # a71a |   mov B, 0
60 60 00                       # a71d |   mov C, 0
60 80 00                       # a720 |   mov D, 0
60 a0 00                       # a723 |   mov SP, 0
60 fc 00                       # a726 |   mov E, 0
60 fd 00                       # a729 |   mov F, 0
60 fe 00                       # a72c |   mov G, 0
60 ff 00                       # a72f |   mov H, 0
5a e0 1c ff                    # a732 |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # a736 |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_47:
f2 bc 1c f8 02 11 09 00        # a737 |   jlt [SP + 0x2], 0x11, ${_E_if_47}:rel + PC
dc                             # a73f |   ret
                               #      | _E_if_47:
                               #      | _C_if_47:
                               #      | _Z_if_47:
a9 ff bc 1c 02 01              # a740 |   shl H, [SP + 0x2], 0x1
00 ff e0 d7 a9                 # a746 |   add H, ${const__SYSCALL_MAP}
e6 a0                          # a74b |   pop [SP]
5a ff                          # a74d |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # a74f |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # a750 |   push B
e0 20                          # a752 |   push A
60 20 e0 fd 00                 # a754 |   mov A, 0xfd
60 40 00                       # a759 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # a75c |   mmap 0xff00, -1, 0x2
                               #      | _A_call_40:
e0 e0 98 aa                    # a764 |   push ${const__data_7}
5c f8 2b fa                    # a768 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a76c |   mov SP, SP + 0x2
                               #      | _Z_call_40:
61 20 e0 1c ff                 # a770 |   mov A, [0xff1c]
                               #      | _A_scope_6:
                               #      | _B_scope_6:
e8 20 00 f8 20 00              # a775 |   jeq A, 0, ${_C_scope_6}:rel + PC
e8 20 e0 f8 00 a0 1a 00        # a77b |   jeq A, 0xa000, ${_C_scope_6}:rel + PC
                               #      | _A_call_41:
e0 20                          # a783 |   push A
e0 e0 cd aa                    # a785 |   push ${const__data_8}
5c f8 88 f8                    # a789 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a78d |   mov SP, SP + 0x4
                               #      | _Z_call_41:
58 f8 81 ff                    # a791 |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_6:
                               #      | _Z_scope_6:
c6 e0 00 0a ff                 # a795 |   inc [0xff0a], 0
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
                               #      | _A_call_57:
5c f8 42 00                    # a79a |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_57:
46 e0 0a ff                    # a79e |   inc [0xff0a]
60 20 ff                       # a7a2 |   mov A, H
                               #      | _A_if_73:
ec fe 00 f8 0a 00              # a7a5 |   jne G, 0, ${_E_if_73}:rel + PC
58 f8 ef ff                    # a7ab |   jmp ${_BA_loop_8}:rel + PC
                               #      | _E_if_73:
                               #      | _C_if_73:
                               #      | _Z_if_73:
                               #      | _A_if_74:
ec 20 00 f8 16 00              # a7af |   jne A, 0, ${_E_if_74}:rel + PC
                               #      | _A_call_58:
e0 e0 58 ab                    # a7b5 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 da f9                    # a7b9 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a7bd |   mov SP, SP + 0x2
                               #      | _Z_call_58:
58 f8 d9 ff                    # a7c1 |   jmp ${_BA_loop_8}:rel + PC
                               #      | _E_if_74:
                               #      | _C_if_74:
                               #      | _Z_if_74:
60 40 21                       # a7c5 |   mov B, A*2
60 40 e8 88 aa                 # a7c8 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # a7cd |   push A
5e 40                          # a7cf |   call [B]
e4 20                          # a7d1 |   pop A
                               #      | _BZ_loop_8:
58 f8 c7 ff                    # a7d3 |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _cleanup_fn_main:
e4 20                          # a7d7 |   pop A
e4 40                          # a7d9 |   pop B
dc                             # a7db |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # a7dc |   push D
e0 60                          # a7de |   push C
e0 40                          # a7e0 |   push B
e0 20                          # a7e2 |   push A
60 a0 bc fe                    # a7e4 |   mov SP, SP + -2
62 a0 00                       # a7e8 |   mov [SP], 0
60 a0 bc de                    # a7eb |   mov SP, SP + -34
62 a0 00                       # a7ef |   mov [SP], 0
60 20 a0                       # a7f2 |   mov A, SP
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
                               #      | _A_call_42:
5c f8 4b fa                    # a7f5 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_42:
60 60 ff                       # a7f9 |   mov C, H
62 e0 60 00 ff                 # a7fc |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # a801 |   jeq C, 0xa, ${_C_loop_9}:rel + PC
e8 60 1c f8 0d 29 00           # a808 |   jeq C, 0xd, ${_C_loop_9}:rel + PC
                               #      | _A_if_52:
f0 20 bc f8 1f 19 00           # a80f |   jlt A, SP + 0x1f, ${_E_if_52}:rel + PC
                               #      | _A_call_43:
e0 e0 f0 aa                    # a816 |   push ${const__data_9}
5c f8 79 f9                    # a81a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a81e |   mov SP, SP + 0x2
                               #      | _Z_call_43:
e8 ff 00 f8 d3 00              # a822 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_52:
                               #      | _C_if_52:
                               #      | _Z_if_52:
62 20 60                       # a828 |   mov [A], C
44 20                          # a82b |   inc A
                               #      | _BZ_loop_9:
58 f8 c8 ff                    # a82d |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
                               #      | _A_call_44:
e0 1c 20                       # a831 |   push 0x20
e0 bc 02                       # a834 |   push SP + 0x2
5c f8 82 fb                    # a837 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a83b |   mov SP, SP + 0x4
                               #      | _Z_call_44:
60 60 ff                       # a83f |   mov C, H
                               #      | _A_if_54:
e8 60 00 f8 0f 00              # a842 |   jeq C, 0, ${_E_if_54}:rel + PC
66 60 00                       # a848 |   bmov [C], 0
44 60                          # a84b |   inc C
58 f8 08 00                    # a84d |   jmp ${_C_if_54}:rel + PC
                               #      | _E_if_54:
60 60 1c ff                    # a851 |   mov C, -1
                               #      | _C_if_54:
                               #      | _Z_if_54:
                               #      | _A_call_52:
e0 a0                          # a855 |   push SP
5c f8 b1 00                    # a857 |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # a85b |   mov SP, SP + 0x2
                               #      | _Z_call_52:
e8 ff 00 f8 9c 00              # a85f |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # a865 |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 02 fb                 # a869 |   mov [${var__g_num_args}], 0
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 60 bc f8 20 7c 00           # a86e |   jge C, SP + 0x20, ${_C_while_9}:rel + PC
                               #      | _A_call_53:
e0 1c 20                       # a875 |   push 0x20
e0 60                          # a878 |   push C
5c f8 3f fb                    # a87a |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a87e |   mov SP, SP + 0x4
                               #      | _Z_call_53:
60 80 ff                       # a882 |   mov D, H
                               #      | _A_if_70:
e8 80 00 f8 0d 00              # a885 |   jeq D, 0, ${_E_if_70}:rel + PC
66 80 00                       # a88b |   bmov [D], 0
58 f8 08 00                    # a88e |   jmp ${_C_if_70}:rel + PC
                               #      | _E_if_70:
60 80 1c fe                    # a892 |   mov D, -2
                               #      | _C_if_70:
                               #      | _Z_if_70:
61 20 e0 02 fb                 # a896 |   mov A, [${var__g_num_args}]
                               #      | _A_if_71:
f0 20 1c f8 04 17 00           # a89b |   jlt A, 0x4, ${_E_if_71}:rel + PC
                               #      | _A_call_54:
e0 e0 2f ab                    # a8a2 |   push ${const__data_10}
5c f8 ed f8                    # a8a6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a8aa |   mov SP, SP + 0x2
                               #      | _Z_call_54:
58 f8 47 00                    # a8ae |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_71:
                               #      | _C_if_71:
                               #      | _Z_if_71:
                               #      | _A_call_55:
e0 60                          # a8b2 |   push C
5c f8 e6 f9                    # a8b4 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a8b8 |   mov SP, SP + 0x2
                               #      | _Z_call_55:
                               #      | _A_if_72:
ec fe 00 f8 18 00              # a8bc |   jne G, 0, ${_E_if_72}:rel + PC
                               #      | _A_call_56:
e0 20                          # a8c2 |   push A
e0 e0 44 ab                    # a8c4 |   push ${const__data_11}
5c f8 49 f7                    # a8c8 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a8cc |   mov SP, SP + 0x4
                               #      | _Z_call_56:
58 f8 25 00                    # a8d0 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_72:
                               #      | _C_if_72:
                               #      | _Z_if_72:
a8 40 20 1c 01                 # a8d4 |   shl B, A, 0x1
62 e8 ff 04 fb                 # a8d9 |   mov [${var__g_args} + B], H
c6 e0 20 02 fb                 # a8de |   inc [${var__g_num_args}], A
c4 60 80                       # a8e3 |   inc C, D
                               #      | _BZ_while_9:
58 f8 88 ff                    # a8e6 |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
c4 fe 00                       # a8ea |   inc G, 0
61 ff bc 22                    # a8ed |   mov H, [SP + 0x22]
58 f8 0a 00                    # a8f1 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # a8f5 |   mov G, 0
60 ff 00                       # a8f8 |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # a8fb |   mov SP, SP + 0x24
e4 20                          # a8ff |   pop A
e4 40                          # a901 |   pop B
e4 60                          # a903 |   pop C
e4 80                          # a905 |   pop D
dc                             # a907 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # a908 |   push A
61 20 bc 04                    # a90a |   mov A, [SP + 0x4]
                               #      | _A_call_45:
e0 e0 02 ab                    # a90e |   push ${const__str__PING}
e0 20                          # a912 |   push A
5c f8 6f fa                    # a914 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a918 |   mov SP, SP + 0x4
                               #      | _Z_call_45:
                               #      | _A_if_56:
ec ff 00 f8 0d 00              # a91c |   jne H, 0, ${_E_if_56}:rel + PC
c4 ff 00                       # a922 |   inc H, 0
58 f8 af 00                    # a925 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
                               #      | _A_call_46:
e0 e0 07 ab                    # a929 |   push ${const__str__READ}
e0 20                          # a92d |   push A
5c f8 54 fa                    # a92f |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a933 |   mov SP, SP + 0x4
                               #      | _Z_call_46:
                               #      | _A_if_58:
ec ff 00 f8 0e 00              # a937 |   jne H, 0, ${_E_if_58}:rel + PC
60 ff 1c 02                    # a93d |   mov H, 0x2
58 f8 93 00                    # a941 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_58:
                               #      | _C_if_58:
                               #      | _Z_if_58:
                               #      | _A_call_47:
e0 e0 0c ab                    # a945 |   push ${const__str__WRITE}
e0 20                          # a949 |   push A
5c f8 38 fa                    # a94b |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a94f |   mov SP, SP + 0x4
                               #      | _Z_call_47:
                               #      | _A_if_60:
ec ff 00 f8 0e 00              # a953 |   jne H, 0, ${_E_if_60}:rel + PC
60 ff 1c 03                    # a959 |   mov H, 0x3
58 f8 77 00                    # a95d |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_60:
                               #      | _C_if_60:
                               #      | _Z_if_60:
                               #      | _A_call_48:
e0 e0 12 ab                    # a961 |   push ${const__str__READB}
e0 20                          # a965 |   push A
5c f8 1c fa                    # a967 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a96b |   mov SP, SP + 0x4
                               #      | _Z_call_48:
                               #      | _A_if_62:
ec ff 00 f8 0e 00              # a96f |   jne H, 0, ${_E_if_62}:rel + PC
60 ff 1c 04                    # a975 |   mov H, 0x4
58 f8 5b 00                    # a979 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_62:
                               #      | _C_if_62:
                               #      | _Z_if_62:
                               #      | _A_call_49:
e0 e0 18 ab                    # a97d |   push ${const__str__WRITEB}
e0 20                          # a981 |   push A
5c f8 00 fa                    # a983 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a987 |   mov SP, SP + 0x4
                               #      | _Z_call_49:
                               #      | _A_if_64:
ec ff 00 f8 0e 00              # a98b |   jne H, 0, ${_E_if_64}:rel + PC
60 ff 1c 05                    # a991 |   mov H, 0x5
58 f8 3f 00                    # a995 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_64:
                               #      | _C_if_64:
                               #      | _Z_if_64:
                               #      | _A_call_50:
e0 e0 1f ab                    # a999 |   push ${const__str__JMP}
e0 20                          # a99d |   push A
5c f8 e4 f9                    # a99f |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a9a3 |   mov SP, SP + 0x4
                               #      | _Z_call_50:
                               #      | _A_if_66:
ec ff 00 f8 0e 00              # a9a7 |   jne H, 0, ${_E_if_66}:rel + PC
60 ff 1c 06                    # a9ad |   mov H, 0x6
58 f8 23 00                    # a9b1 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_66:
                               #      | _C_if_66:
                               #      | _Z_if_66:
                               #      | _A_call_51:
e0 e0 23 ab                    # a9b5 |   push ${const__str__JMP_PERSIST}
e0 20                          # a9b9 |   push A
5c f8 c8 f9                    # a9bb |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a9bf |   mov SP, SP + 0x4
                               #      | _Z_call_51:
                               #      | _A_if_68:
ec ff 00 f8 0e 00              # a9c3 |   jne H, 0, ${_E_if_68}:rel + PC
60 ff 1c 07                    # a9c9 |   mov H, 0x7
58 f8 07 00                    # a9cd |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_68:
                               #      | _C_if_68:
                               #      | _Z_if_68:
60 ff 00                       # a9d1 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # a9d4 |   pop A
dc                             # a9d6 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__SYSCALL_MAP:
11 a0 2e a1 40 a2 46 a1 b5 a1 0b a2 f2 a1 5f a2 9a a2 ea a2 23 a3 5c a3 83 a3 b9 a3 d8 a3 df a3 ea a3 # a9d7 |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # a9f9 |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # aa1d |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # aa23 |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # aa32 |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # aa3f |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # aa4e |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # aa5e |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # aa6d |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # aa78 |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__HANDLER_MAP:
85 a4 bf a4 ce a5 bf a4 ce a5 ce a6 ce a6 # aa8a |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp]
                               #      | const__data_7:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 32 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 30 0a 52 45 41 44 59 0a 00 # aa98 |   .data str:"Weeekly3006 - Hardware v1.2 - Bootloader v2.0\nREADY\n"
                               #      | const__data_8:
46 6f 75 6e 64 20 70 65 72 73 69 73 74 65 64 20 6a 75 6d 70 20 74 61 72 67 65 74 20 61 74 20 25 78 0a 00 # aacd |   .data str:"Found persisted jump target at %x\n"
                               #      | const__data_9:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # aaf0 |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # ab02 |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # ab07 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # ab0c |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # ab12 |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # ab18 |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # ab1f |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # ab23 |   .data str:"JMP_PERSIST"
                               #      | const__data_10:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 34 0a 00 # ab2f |   .data str:"TOO_MANY_ARGS max=4\n"
                               #      | const__data_11:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # ab44 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # ab58 |   .data str:"UNKNOWN_COMMAND\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xfb00
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # fb00 |   .bss size:2 align:1
                               #      | var__g_num_args:
                               # fb02 |   .bss size:2 align:1
                               #      | var__g_args:
                               # fb04 |   .bss size:10 align:2
                               #      | SECTION_END_static_data:
                               #      | 
