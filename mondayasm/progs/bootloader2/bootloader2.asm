                               #      | .config CODE_OFFSET 0xe000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | _A_if_52:
e8 c0 e0 f8 00 e0 1d 00        # e000 |   jeq PC, 0xe000, ${_E_if_52}:rel + PC
60 20 e0 ff 00                 # e008 |   mov A, 0xff
60 40 00                       # e00d |   mov B, 0
54 e0 e0 1c 00 e0 ff fa 02     # e010 |   mmap 0xe000, 0xfaff, 0x2
58 e0 00 e0                    # e019 |   jmp 0xe000
                               #      | _E_if_52:
                               #      | _C_if_52:
                               #      | _Z_if_52:
54 e0 e0 1c 00 e0 ff fa 03     # e01d |   mmap 0xe000, 0xfaff, 0x3
d4 1c 02                       # e026 |   umap 0x2
60 a0 e0 00 ff                 # e029 |   mov SP, 0xff00
                               #      | _A_call_62:
5c f8 3f 08                    # e02e |   call ${fn_main}:rel + PC
                               #      | _Z_call_62:
d8                             # e032 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # e033 |   push C
e0 40                          # e035 |   push B
e0 20                          # e037 |   push A
60 a0 bc ee                    # e039 |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # e03d |   mov B, SP + 0x1c
                               #      | _A_for_1:
61 20 bc 1a                    # e041 |   mov A, [SP + 0x1a]
                               #      | _BA_for_1:
65 60 20                       # e045 |   bmov C, [A]
e8 60 00 f8 fd 00              # e048 |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # e04e |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # e055 |   push C
5c f8 f9 00                    # e057 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e05b |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 e0 00                    # e05f |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # e063 |   inc A
65 60 20                       # e065 |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # e068 |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 d7 00                    # e06e |   jmp ${_C_for_1}:rel + PC
58 f8 c9 00                    # e072 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 25 1a 00           # e076 |   jne C, 0x25, ${_E2_if_4}:rel + PC
                               #      | _A_call_2:
e0 1c 25                       # e07d |   push 0x25
5c f8 d0 00                    # e080 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e084 |   mov SP, SP + 0x2
                               #      | _Z_call_2:
58 f8 b7 00                    # e088 |   jmp ${_BZ_for_1}:rel + PC
58 f8 af 00                    # e08c |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 64 21 00           # e090 |   jne C, 0x64, ${_E3_if_4}:rel + PC
                               #      | _A_call_3:
e0 a0                          # e097 |   push SP
e2 40                          # e099 |   push [B]
5c f8 cd 00                    # e09b |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # e09f |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 a0                          # e0a3 |   push SP
5c f8 10 01                    # e0a5 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e0a9 |   mov SP, SP + 0x2
                               #      | _Z_call_5:
58 f8 8e 00                    # e0ad |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 78 21 00           # e0b1 |   jne C, 0x78, ${_E4_if_4}:rel + PC
                               #      | _A_call_7:
e0 a0                          # e0b8 |   push SP
e2 40                          # e0ba |   push [B]
5c f8 1b 01                    # e0bc |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # e0c0 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 a0                          # e0c4 |   push SP
5c f8 ef 00                    # e0c6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e0ca |   mov SP, SP + 0x2
                               #      | _Z_call_8:
58 f8 6d 00                    # e0ce |   jmp ${_C_if_4}:rel + PC
                               #      | _E4_if_4:
ec 60 1c f8 68 22 00           # e0d2 |   jne C, 0x68, ${_E5_if_4}:rel + PC
                               #      | _A_call_9:
e0 a0                          # e0d9 |   push SP
e2 40                          # e0db |   push [B]
5c f8 fa 00                    # e0dd |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # e0e1 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 bc 02                       # e0e5 |   push SP + 0x2
5c f8 cd 00                    # e0e8 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e0ec |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 4b 00                    # e0f0 |   jmp ${_C_if_4}:rel + PC
                               #      | _E5_if_4:
ec 60 1c f8 62 21 00           # e0f4 |   jne C, 0x62, ${_E6_if_4}:rel + PC
                               #      | _A_call_11:
e0 a0                          # e0fb |   push SP
e2 40                          # e0fd |   push [B]
5c f8 2e 01                    # e0ff |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # e103 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 a0                          # e107 |   push SP
5c f8 ac 00                    # e109 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e10d |   mov SP, SP + 0x2
                               #      | _Z_call_12:
58 f8 2a 00                    # e111 |   jmp ${_C_if_4}:rel + PC
                               #      | _E6_if_4:
ec 60 1c f8 73 15 00           # e115 |   jne C, 0x73, ${_E7_if_4}:rel + PC
                               #      | _A_call_13:
e2 40                          # e11c |   push [B]
5c f8 97 00                    # e11e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e122 |   mov SP, SP + 0x2
                               #      | _Z_call_13:
58 f8 15 00                    # e126 |   jmp ${_C_if_4}:rel + PC
                               #      | _E7_if_4:
ec 60 1c f8 63 11 00           # e12a |   jne C, 0x63, ${_E8_if_4}:rel + PC
                               #      | _A_call_14:
e2 40                          # e131 |   push [B]
5c f8 1d 00                    # e133 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e137 |   mov SP, SP + 0x2
                               #      | _Z_call_14:
                               #      | _E8_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
60 40 5c 02                    # e13b |   mov B, B + 0x2
                               #      | _BZ_for_1:
44 20                          # e13f |   inc A
58 f8 04 ff                    # e141 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # e145 |   mov SP, SP + 0x12
e4 20                          # e149 |   pop A
e4 40                          # e14b |   pop B
e4 60                          # e14d |   pop C
dc                             # e14f |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # e150 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # e157 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # e15d |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # e161 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # e167 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # e168 |   push C
e0 40                          # e16a |   push B
e0 20                          # e16c |   push A
61 20 bc 0a                    # e16e |   mov A, [SP + 0xa]
62 20 1c 30                    # e172 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # e176 |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # e17a |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # e180 |   div C, B, 0xa
82 20 ff 1c 30                 # e185 |   add [A], H, 0x30
44 20                          # e18a |   inc A
60 40 60                       # e18c |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # e18f |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # e193 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # e197 |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # e19d |   dec A
61 40 60                       # e19f |   mov B, [C]
67 60 20                       # e1a2 |   bmov [C], [A]
66 20 40                       # e1a5 |   bmov [A], B
44 60                          # e1a8 |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # e1aa |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # e1ae |   pop A
e4 40                          # e1b0 |   pop B
e4 60                          # e1b2 |   pop C
dc                             # e1b4 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # e1b5 |   push A
                               #      | _A_for_2:
61 20 bc 04                    # e1b7 |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # e1bb |   bmov H, [A]
e8 ff 00 f8 16 00              # e1be |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_4:
e0 ff                          # e1c4 |   push H
5c f8 8a ff                    # e1c6 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e1ca |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # e1ce |   inc A
58 f8 eb ff                    # e1d0 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # e1d4 |   pop A
dc                             # e1d6 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # e1d7 |   push C
e0 40                          # e1d9 |   push B
e0 20                          # e1db |   push A
61 40 bc 08                    # e1dd |   mov B, [SP + 0x8]
61 60 bc 0a                    # e1e1 |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # e1e5 |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # e1e9 |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # e1f0 |   shr H, B, A*4
2c ff 1c 0f                    # e1f4 |   and H, 0xf
                               #      | _A_call_6:
e0 ff                          # e1f8 |   push H
5c f8 1a 00                    # e1fa |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # e1fe |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 60 ff                       # e202 |   mov [C], H
44 60                          # e205 |   inc C
                               #      | _BZ_for_3:
48 20                          # e207 |   dec A
58 f8 e0 ff                    # e209 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # e20d |   pop A
e4 40                          # e20f |   pop B
e4 60                          # e211 |   pop C
dc                             # e213 |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_6:
fa bc 1c f8 02 09 12 00        # e214 |   jgt [SP + 0x2], 0x9, ${_E_if_6}:rel + PC
81 ff bc 1c 02 30              # e21c |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # e222 |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
81 ff bc 1c 02 57              # e226 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # e22c |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # e22d |   push C
e0 40                          # e22f |   push B
e0 20                          # e231 |   push A
61 40 bc 08                    # e233 |   mov B, [SP + 0x8]
61 60 bc 0a                    # e237 |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # e23b |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # e23f |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # e246 |   shr H, B, A
2c ff 1c 01                    # e24a |   and H, 0x1
82 60 ff 1c 30                 # e24e |   add [C], H, 0x30
44 60                          # e253 |   inc C
                               #      | _BZ_for_4:
48 20                          # e255 |   dec A
58 f8 e8 ff                    # e257 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # e25b |   pop A
e4 40                          # e25d |   pop B
e4 60                          # e25f |   pop C
dc                             # e261 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_getc:
                               #      | _begin_fn_getc:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 02 ff                 # e262 |   mov H, [0xff02]
ac fe ff e0 00 80              # e267 |   and G, H, 0x8000
e8 fe 00 f8 f5 ff              # e26d |   jeq G, 0, ${_BA_loop_2}:rel + PC
2c ff e0 ff 00                 # e273 |   and H, 0xff
58 f8 08 00                    # e278 |   jmp ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 e6 ff                    # e27c |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_getc:
dc                             # e280 |   ret
                               #      | _end_fn_getc:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # e281 |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # e287 |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # e28e |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # e295 |   sub H, G, 0x30
c4 fe 00                       # e29a |   inc G, 0
dc                             # e29d |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # e29e |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # e2a5 |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # e2ac |   add H, G, -87
c4 fe 00                       # e2b1 |   inc G, 0
dc                             # e2b4 |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # e2b5 |   mov H, 0
60 fe 00                       # e2b8 |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # e2bb |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # e2bc |   push B
e0 20                          # e2be |   push A
60 20 00                       # e2c0 |   mov A, 0
61 40 bc 06                    # e2c3 |   mov B, [SP + 0x6]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
65 ff 40                       # e2c7 |   bmov H, [B]
e8 ff 00 f8 23 00              # e2ca |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_15:
e0 ff                          # e2d0 |   push H
5c f8 af ff                    # e2d2 |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # e2d6 |   mov SP, SP + 0x2
                               #      | _Z_call_15:
e8 fe 00 f8 2d 00              # e2da |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # e2e0 |   shl A, 0x4
00 20 ff                       # e2e4 |   add A, H
44 40                          # e2e7 |   inc B
                               #      | _BZ_loop_3:
58 f8 de ff                    # e2e9 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
60 fe 00                       # e2ed |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # e2f0 |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # e2f4 |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # e2fa |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # e301 |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # e304 |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # e307 |   pop A
e4 40                          # e309 |   pop B
dc                             # e30b |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # e30c |   push B
e0 20                          # e30e |   push A
65 fe bc 08                    # e310 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # e314 |   shl H, G, 0x8
30 ff fe                       # e319 |   or H, G
61 20 bc 06                    # e31c |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # e320 |   add B, [SP + 0xa], A
                               #      | _A_while_3:
                               #      | _BA_while_3:
f8 3c 40 f8 02 12 00           # e325 |   jgt A + 0x2, B, ${_C_while_3}:rel + PC
62 20 ff                       # e32c |   mov [A], H
60 20 3c 02                    # e32f |   mov A, A + 0x2
                               #      | _BZ_while_3:
58 f8 f2 ff                    # e333 |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _A_if_16:
fc 20 40 f8 09 00              # e337 |   jge A, B, ${_E_if_16}:rel + PC
66 20 ff                       # e33d |   bmov [A], H
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _cleanup_fn_memset:
e4 20                          # e340 |   pop A
e4 40                          # e342 |   pop B
dc                             # e344 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # e345 |   push C
e0 40                          # e347 |   push B
e0 20                          # e349 |   push A
61 20 bc 08                    # e34b |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # e34f |   add B, [SP + 0xc], A
61 60 bc 0a                    # e354 |   mov C, [SP + 0xa]
                               #      | _A_while_4:
                               #      | _BA_while_4:
f8 3c 40 f8 02 16 00           # e358 |   jgt A + 0x2, B, ${_C_while_4}:rel + PC
63 20 60                       # e35f |   mov [A], [C]
60 20 3c 02                    # e362 |   mov A, A + 0x2
60 60 7c 02                    # e366 |   mov C, C + 0x2
                               #      | _BZ_while_4:
58 f8 ee ff                    # e36a |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      | _A_if_17:
fc 20 40 f8 09 00              # e36e |   jge A, B, ${_E_if_17}:rel + PC
67 20 60                       # e374 |   bmov [A], [C]
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _cleanup_fn_memcpy:
e4 20                          # e377 |   pop A
e4 40                          # e379 |   pop B
e4 60                          # e37b |   pop C
dc                             # e37d |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_strcmp:
                               #      | _begin_fn_strcmp:
61 fc bc 02                    # e37e |   mov E, [SP + 0x2]
61 fd bc 04                    # e382 |   mov F, [SP + 0x4]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
65 fe fc                       # e386 |   bmov G, [E]
65 ff fd                       # e389 |   bmov H, [F]
84 ff fe ff                    # e38c |   sub H, G, H
ec ff 00 f8 14 00              # e390 |   jne H, 0, ${_cleanup_fn_strcmp}:rel + PC
e8 fe 00 f8 0e 00              # e396 |   jeq G, 0, ${_cleanup_fn_strcmp}:rel + PC
44 fc                          # e39c |   inc E
44 fd                          # e39e |   inc F
                               #      | _BZ_loop_4:
58 f8 e6 ff                    # e3a0 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_strcmp:
dc                             # e3a4 |   ret
                               #      | _end_fn_strcmp:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # e3a5 |   push A
61 fc bc 04                    # e3a7 |   mov E, [SP + 0x4]
61 fd bc 06                    # e3ab |   mov F, [SP + 0x6]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
65 fe fc                       # e3af |   bmov G, [E]
65 ff fd                       # e3b2 |   bmov H, [F]
60 20 fe                       # e3b5 |   mov A, G
30 fe 1c 20                    # e3b8 |   or G, 0x20
30 ff 1c 20                    # e3bc |   or H, 0x20
84 ff fe ff                    # e3c0 |   sub H, G, H
ec ff 00 f8 14 00              # e3c4 |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # e3ca |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # e3d0 |   inc E
44 fd                          # e3d2 |   inc F
                               #      | _BZ_loop_5:
58 f8 db ff                    # e3d4 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # e3d8 |   pop A
dc                             # e3da |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # e3db |   mov H, [SP + 0x2]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 fe ff                       # e3df |   bmov G, [H]
e9 fe bc f8 04 17 00           # e3e2 |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_24:
ec fe 00 f8 0a 00              # e3e9 |   jne G, 0, ${_E_if_24}:rel + PC
60 ff 00                       # e3ef |   mov H, 0
dc                             # e3f2 |   ret
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
44 ff                          # e3f3 |   inc H
                               #      | _BZ_loop_6:
58 f8 ea ff                    # e3f5 |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _cleanup_fn_strchr:
dc                             # e3f9 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc 00 fb 02              # e3fa |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # e400 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 00 fb                 # e401 |   inc H, [${var__rand__state}]
62 e0 ff 00 fb                 # e406 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # e40b |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # e40c |   push D
e0 60                          # e40e |   push C
e0 40                          # e410 |   push B
e0 20                          # e412 |   push A
61 40 e0 10 ff                 # e414 |   mov B, [0xff10]
61 60 e0 12 ff                 # e419 |   mov C, [0xff12]
61 80 e0 14 ff                 # e41e |   mov D, [0xff14]
61 20 bc 0e                    # e423 |   mov A, [SP + 0xe]
60 ff 00                       # e427 |   mov H, 0
                               #      | _A_if_25:
fc 28 20 f8 09 00              # e42a |   jge A + B, A, ${_E_if_25}:rel + PC
c4 ff 00                       # e430 |   inc H, 0
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
60 40 44                       # e433 |   mov B, B + A
81 20 bc ff 0c                 # e436 |   add A, [SP + 0xc], H
60 ff 00                       # e43b |   mov H, 0
                               #      | _A_scope_4:
                               #      | _B_scope_4:
f0 2c 20 f8 10 00              # e43e |   jlt A + C, A, ${_C_scope_4}:rel + PC
f0 20 ff f8 0a 00              # e444 |   jlt A, H, ${_C_scope_4}:rel + PC
58 f8 07 00                    # e44a |   jmp ${_Z_scope_4}:rel + PC
                               #      | _C_scope_4:
c4 ff 00                       # e44e |   inc H, 0
                               #      | _Z_scope_4:
60 60 64                       # e451 |   mov C, C + A
81 20 bc ff 0a                 # e454 |   add A, [SP + 0xa], H
60 80 84                       # e459 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # e45c |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 14 ff                 # e460 |   mov H, [0xff14]
                               #      | _A_if_28:
f4 ff 80 f8 0a 00              # e465 |   jle H, D, ${_E_if_28}:rel + PC
58 f8 33 00                    # e46b |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_28:
ec ff 80 f8 2b 00              # e46f |   jne H, D, ${_E2_if_28}:rel + PC
61 ff e0 12 ff                 # e475 |   mov H, [0xff12]
                               #      | _A_if_29:
f4 ff 60 f8 0a 00              # e47a |   jle H, C, ${_E_if_29}:rel + PC
58 f8 1e 00                    # e480 |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_29:
ec ff 60 f8 16 00              # e484 |   jne H, C, ${_E2_if_29}:rel + PC
fa e0 40 f8 10 ff 14 00        # e48a |   jgt [0xff10], B, ${_C_loop_7}:rel + PC
                               #      | _A_if_31:
e8 20 00 f8 08 00              # e492 |   jeq A, 0, ${_E_if_31}:rel + PC
5c 20                          # e498 |   call A
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
58 f8 c6 ff                    # e49a |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # e49e |   pop A
e4 40                          # e4a0 |   pop B
e4 60                          # e4a2 |   pop C
e4 80                          # e4a4 |   pop D
dc                             # e4a6 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # e4a7 |   push D
e0 60                          # e4a9 |   push C
e0 40                          # e4ab |   push B
e0 20                          # e4ad |   push A
61 fc bc 0a                    # e4af |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # e4b3 |   shl F, [SP + 0xe], 0x1
00 fd fc                       # e4b9 |   add F, E
61 fe bc 0c                    # e4bc |   mov G, [SP + 0xc]
61 40 fe                       # e4c0 |   mov B, [G]
60 60 1c 07                    # e4c3 |   mov C, 0x7
60 20 00                       # e4c7 |   mov A, 0
60 a0 bc fe                    # e4ca |   mov SP, SP + -2
                               #      | _A_for_5:
                               #      | _BA_for_5:
fc fc fd f8 9e 00              # e4ce |   jge E, F, ${_C_for_5}:rel + PC
                               #      |   # decode one line
60 20 00                       # e4d4 |   mov A, 0
62 a0 1c ff                    # e4d7 |   mov [SP], -1
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
                               #      | _A_if_32:
ec 60 1c f8 ff 10 00           # e4db |   jne C, -1, ${_E_if_32}:rel + PC
44 fe                          # e4e2 |   inc G
61 40 fe                       # e4e4 |   mov B, [G]
60 60 1c 07                    # e4e7 |   mov C, 0x7
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
98 80 40 60                    # e4eb |   getb D, B, C
48 60                          # e4ef |   dec C
40 80                          # e4f1 |   bool D
b0 20 21 80                    # e4f3 |   or A, A*2, D
4a a0                          # e4f7 |   dec [SP]
                               #      | _A_if_33:
ee a0 00 f8 1b 00              # e4f9 |   jne [SP], 0, ${_E_if_33}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # e4ff |   mov H, A
b9 20 bc 12                    # e502 |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # e506 |   shr A, -1, A + 0x10
ae fc ff 20                    # e50c |   and [E], H, A
58 f8 54 00                    # e510 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_33:
ec 20 00 f8 20 00              # e514 |   jne A, 0, ${_E2_if_33}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # e51a |   sub H, E, 0x2
                               #      | _A_if_34:
f1 ff bc f8 0c 0e 00           # e51f |   jlt H, [SP + 0xc], ${_E_if_34}:rel + PC
63 fc ff                       # e526 |   mov [E], [H]
58 f8 07 00                    # e529 |   jmp ${_C_if_34}:rel + PC
                               #      | _E_if_34:
62 fc 00                       # e52d |   mov [E], 0
                               #      | _C_if_34:
                               #      | _Z_if_34:
58 f8 34 00                    # e530 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E2_if_33:
ec 20 1c f8 02 13 00           # e534 |   jne A, 0x2, ${_E3_if_33}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # e53b |   sub H, E, 0x4
63 fc ff                       # e540 |   mov [E], [H]
58 f8 21 00                    # e543 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E3_if_33:
ec 20 1c f8 06 0e 00           # e547 |   jne A, 0x6, ${_E4_if_33}:rel + PC
                               #      |   # all zeros
62 fc 00                       # e54e |   mov [E], 0
58 f8 13 00                    # e551 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E4_if_33:
ec 20 1c f8 07 0b 00           # e555 |   jne A, 0x7, ${_E5_if_33}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # e55c |   mov [SP], [SP + 0x12]
                               #      | _E5_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _BZ_loop_8:
58 f8 7b ff                    # e560 |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _BZ_for_5:
00 fc 1c 02                    # e564 |   add E, 0x2
58 f8 66 ff                    # e568 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # e56c |   mov SP, SP + 0x2
e4 20                          # e570 |   pop A
e4 40                          # e572 |   pop B
e4 60                          # e574 |   pop C
e4 80                          # e576 |   pop D
dc                             # e578 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # e579 |   push B
e0 20                          # e57b |   push A
61 20 bc 08                    # e57d |   mov A, [SP + 0x8]
60 40 1c 1f                    # e581 |   mov B, 0x1f
                               #      | _A_scope_5:
                               #      | _B_scope_5:
f0 20 1c f8 20 13 00           # e585 |   jlt A, 0x20, ${_C_scope_5}:rel + PC
fc 20 e0 f8 80 00 0c 00        # e58c |   jge A, 0x80, ${_C_scope_5}:rel + PC
60 40 3c e0                    # e594 |   mov B, A + -32
                               #      | _C_scope_5:
                               #      | _Z_scope_5:
28 40 1c 01                    # e598 |   shl B, 0x1
61 40 e8 30 ef                 # e59c |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_16:
e0 1c 0c                       # e5a1 |   push 0xc
e0 1c 10                       # e5a4 |   push 0x10
e0 e8 3b eb                    # e5a7 |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # e5ab |   push [SP + 0xc]
5c f8 f9 fe                    # e5ae |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # e5b2 |   mov SP, SP + 0x8
                               #      | _Z_call_16:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # e5b6 |   pop A
e4 40                          # e5b8 |   pop B
dc                             # e5ba |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_18:
e0 00                          # e5bb |   push 0
5c f8 15 00                    # e5bd |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e5c1 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 e0 3c f0                    # e5c5 |   push ${const__str__PONG__endl}
5c f8 ec fb                    # e5c9 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e5cd |   mov SP, SP + 0x2
                               #      | _Z_call_19:
                               #      | _cleanup_fn_handle_ping:
dc                             # e5d1 |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # e5d2 |   inc G, 0
                               #      | _A_if_37:
eb e0 bc f8 02 fb 02 1f 00     # e5d5 |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_37}:rel + PC
                               #      | _A_call_17:
e2 e0 02 fb                    # e5de |   push [${var__g_num_args}]
e2 bc 04                       # e5e2 |   push [SP + 0x4]
e0 e0 18 f0                    # e5e5 |   push ${const__data_1}
5c f8 4a fa                    # e5e9 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # e5ed |   mov SP, SP + 0x6
                               #      | _Z_call_17:
60 fe 00                       # e5f1 |   mov G, 0
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _cleanup_fn_check_num_args:
dc                             # e5f4 |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # e5f5 |   push D
e0 60                          # e5f7 |   push C
e0 40                          # e5f9 |   push B
e0 20                          # e5fb |   push A
60 a0 bc fa                    # e5fd |   mov SP, SP + -6
                               #      | _A_call_20:
e0 1c 02                       # e601 |   push 0x2
5c f8 ce ff                    # e604 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e608 |   mov SP, SP + 0x2
                               #      | _Z_call_20:
e8 fe 00 f8 9a 00              # e60c |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_22:
5c f8 a1 00                    # e612 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_22:
e8 fe 00 f8 90 00              # e616 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 04 fb                 # e61c |   mov A, [${var__g_args}]
61 40 e0 06 fb                 # e621 |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_23:
e0 40                          # e626 |   push B
e0 20                          # e628 |   push A
e0 e0 5e f0                    # e62a |   push ${const__data_2}
5c f8 05 fa                    # e62e |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # e632 |   mov SP, SP + 0x6
                               #      | _Z_call_23:
                               #      | _A_if_43:
ee bc 1c f8 10 02 3c 00        # e636 |   jne [SP + 0x10], 0x2, ${_E_if_43}:rel + PC
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 20 40 f8 30 00              # e63e |   jge A, B, ${_C_while_5}:rel + PC
61 60 20                       # e644 |   mov C, [A]
a0 80 60 1c 08                 # e647 |   shr D, C, 0x8
28 60 1c 08                    # e64c |   shl C, 0x8
                               #      | _A_call_24:
e0 a0                          # e650 |   push SP
e0 8c                          # e652 |   push D + C
5c f8 83 fb                    # e654 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # e658 |   mov SP, SP + 0x4
                               #      | _Z_call_24:
                               #      | _A_call_25:
e0 a0                          # e65c |   push SP
5c f8 57 fb                    # e65e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e662 |   mov SP, SP + 0x2
                               #      | _Z_call_25:
60 20 3c 02                    # e666 |   mov A, A + 0x2
                               #      | _BZ_while_5:
58 f8 d4 ff                    # e66a |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
58 f8 2d 00                    # e66e |   jmp ${_C_if_43}:rel + PC
                               #      | _E_if_43:
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc 20 40 f8 29 00              # e672 |   jge A, B, ${_C_while_6}:rel + PC
61 60 20                       # e678 |   mov C, [A]
                               #      | _A_call_26:
e0 60                          # e67b |   push C
5c f8 d3 fa                    # e67d |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e681 |   mov SP, SP + 0x2
                               #      | _Z_call_26:
20 60 1c 08                    # e685 |   shr C, 0x8
                               #      | _A_call_27:
e0 60                          # e689 |   push C
5c f8 c5 fa                    # e68b |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e68f |   mov SP, SP + 0x2
                               #      | _Z_call_27:
60 20 3c 02                    # e693 |   mov A, A + 0x2
                               #      | _BZ_while_6:
58 f8 db ff                    # e697 |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
                               #      | _C_if_43:
                               #      | _Z_if_43:
                               #      | _A_call_28:
e0 1c 0a                       # e69b |   push 0xa
5c f8 b2 fa                    # e69e |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e6a2 |   mov SP, SP + 0x2
                               #      | _Z_call_28:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # e6a6 |   mov SP, SP + 0x6
e4 20                          # e6aa |   pop A
e4 40                          # e6ac |   pop B
e4 60                          # e6ae |   pop C
e4 80                          # e6b0 |   pop D
dc                             # e6b2 |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # e6b3 |   push C
e0 40                          # e6b5 |   push B
e0 20                          # e6b7 |   push A
61 20 e0 04 fb                 # e6b9 |   mov A, [${var__g_args}]
61 40 e0 06 fb                 # e6be |   mov B, [${var__g_args} + 0002]
60 60 e0 42 f0                 # e6c3 |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # e6c8 |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 51 f0                 # e6ce |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # e6d3 |   and G, A, 0x1
ec fe 00 f8 18 00              # e6d8 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # e6de |   and G, B, 0x1
ec fe 00 f8 0d 00              # e6e3 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # e6e9 |   inc G, 0
58 f8 11 00                    # e6ec |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_21:
e0 60                          # e6f0 |   push C
5c f8 c3 fa                    # e6f2 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e6f6 |   mov SP, SP + 0x2
                               #      | _Z_call_21:
60 fe 00                       # e6fa |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # e6fd |   pop A
e4 40                          # e6ff |   pop B
e4 60                          # e701 |   pop C
dc                             # e703 |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # e704 |   push D
e0 60                          # e706 |   push C
e0 40                          # e708 |   push B
e0 20                          # e70a |   push A
60 a0 bc fa                    # e70c |   mov SP, SP + -6
                               #      | _A_call_29:
e0 1c 02                       # e710 |   push 0x2
5c f8 bf fe                    # e713 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e717 |   mov SP, SP + 0x2
                               #      | _Z_call_29:
e8 fe 00 f8 dc 00              # e71b |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_30:
5c f8 92 ff                    # e721 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_30:
e8 fe 00 f8 d2 00              # e725 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 04 fb                 # e72b |   mov A, [${var__g_args}]
61 40 e0 06 fb                 # e730 |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_46:
ee bc 1c f8 10 03 55 00        # e735 |   jne [SP + 0x10], 0x3, ${_E_if_46}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 49 00              # e73d |   jge A, B, ${_C_while_7}:rel + PC
                               #      | _A_for_6:
60 80 00                       # e743 |   mov D, 0
                               #      | _BA_for_6:
fc 80 1c f8 04 19 00           # e746 |   jge D, 0x4, ${_C_for_6}:rel + PC
                               #      | _A_call_31:
5c f8 15 fb                    # e74d |   call ${fn_getc}:rel + PC
                               #      | _Z_call_31:
62 e0 ff 00 ff                 # e751 |   mov [0xff00], H
62 b0 ff                       # e756 |   mov [SP + D], H
                               #      | _BZ_for_6:
44 80                          # e759 |   inc D
58 f8 eb ff                    # e75b |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_32:
e0 a0                          # e75f |   push SP
5c f8 5b fb                    # e761 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # e765 |   mov SP, SP + 0x2
                               #      | _Z_call_32:
e8 fe 00 f8 7f 00              # e769 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # e76f |   shl C, H, 0x8
20 ff 1c 08                    # e774 |   shr H, 0x8
30 60 ff                       # e778 |   or C, H
62 20 60                       # e77b |   mov [A], C
60 20 3c 02                    # e77e |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 bb ff                    # e782 |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 31 00                    # e786 |   jmp ${_C_if_46}:rel + PC
                               #      | _E_if_46:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 2d 00              # e78a |   jge A, B, ${_C_while_8}:rel + PC
                               #      | _A_call_33:
5c f8 d2 fa                    # e790 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_33:
62 e0 ff 00 ff                 # e794 |   mov [0xff00], H
60 60 ff                       # e799 |   mov C, H
                               #      | _A_call_34:
5c f8 c6 fa                    # e79c |   call ${fn_getc}:rel + PC
                               #      | _Z_call_34:
62 e0 ff 00 ff                 # e7a0 |   mov [0xff00], H
28 ff 1c 08                    # e7a5 |   shl H, 0x8
30 60 ff                       # e7a9 |   or C, H
62 20 60                       # e7ac |   mov [A], C
60 20 3c 02                    # e7af |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 d7 ff                    # e7b3 |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_46:
                               #      | _Z_if_46:
                               #      | _A_call_35:
5c f8 ab fa                    # e7b7 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_35:
62 e0 ff 00 ff                 # e7bb |   mov [0xff00], H
                               #      | _A_scope_6:
                               #      | _B_scope_6:
e8 ff 1c f8 0a 12 00           # e7c0 |   jeq H, 0xa, ${_C_scope_6}:rel + PC
e8 ff 1c f8 0d 0b 00           # e7c7 |   jeq H, 0xd, ${_C_scope_6}:rel + PC
58 f8 1a 00                    # e7ce |   jmp ${_L_fn_handle_write_1}:rel + PC
                               #      | _C_scope_6:
                               #      | _Z_scope_6:
                               #      | _A_call_36:
e0 40                          # e7d2 |   push B
e2 e0 04 fb                    # e7d4 |   push [${var__g_args}]
e0 e0 6d f0                    # e7d8 |   push ${const__data_3}
5c f8 57 f8                    # e7dc |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # e7e0 |   mov SP, SP + 0x6
                               #      | _Z_call_36:
58 f8 13 00                    # e7e4 |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_37:
e0 e0 7d f0                    # e7e8 |   push ${const__data_4}
5c f8 c9 f9                    # e7ec |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e7f0 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
60 fe 00                       # e7f4 |   mov G, 0
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # e7f7 |   mov SP, SP + 0x6
e4 20                          # e7fb |   pop A
e4 40                          # e7fd |   pop B
e4 60                          # e7ff |   pop C
e4 80                          # e801 |   pop D
dc                             # e803 |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
                               #      | _A_call_38:
e0 1c 01                       # e804 |   push 0x1
5c f8 cb fd                    # e807 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e80b |   mov SP, SP + 0x2
                               #      | _Z_call_38:
e8 fe 00 f8 5d 00              # e80f |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_if_51:
ee bc 1c f8 02 06 1c 00        # e815 |   jne [SP + 0x2], 0x6, ${_E_if_51}:rel + PC
                               #      | _A_call_39:
e2 e0 04 fb                    # e81d |   push [${var__g_args}]
e0 e0 8c f0                    # e821 |   push ${const__data_5}
5c f8 0e f8                    # e825 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e829 |   mov SP, SP + 0x4
                               #      | _Z_call_39:
5a f8 d7 12                    # e82d |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_51:
                               #      | _C_if_51:
                               #      | _Z_if_51:
63 e0 e0 1c ff 04 fb           # e831 |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_40:
e2 e0 1c ff                    # e838 |   push [0xff1c]
e0 e0 97 f0                    # e83c |   push ${const__data_6}
5c f8 f3 f7                    # e840 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e844 |   mov SP, SP + 0x4
                               #      | _Z_call_40:
                               #      | glb_jmp_to_stored_target:
62 e0 00 0a ff                 # e848 |   mov [0xff0a], 0
60 20 00                       # e84d |   mov A, 0
60 40 00                       # e850 |   mov B, 0
60 60 00                       # e853 |   mov C, 0
60 80 00                       # e856 |   mov D, 0
60 a0 00                       # e859 |   mov SP, 0
60 fc 00                       # e85c |   mov E, 0
60 fd 00                       # e85f |   mov F, 0
60 fe 00                       # e862 |   mov G, 0
60 ff 00                       # e865 |   mov H, 0
5a e0 1c ff                    # e868 |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # e86c |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # e86d |   push B
e0 20                          # e86f |   push A
60 20 e0 fd 00                 # e871 |   mov A, 0xfd
60 40 00                       # e876 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # e879 |   mmap 0xff00, -1, 0x2
62 e0 e0 1e ff 2c e9           # e881 |   mov [0xff1e], ${fn_syscall_entry}
                               #      | _A_call_41:
e0 e0 b7 f0                    # e888 |   push ${const__data_7}
5c f8 29 f9                    # e88c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e890 |   mov SP, SP + 0x2
                               #      | _Z_call_41:
61 20 e0 1c ff                 # e894 |   mov A, [0xff1c]
                               #      | _A_scope_7:
                               #      | _B_scope_7:
e8 20 00 f8 40 00              # e899 |   jeq A, 0, ${_C_scope_7}:rel + PC
e8 20 e0 f8 00 e0 3a 00        # e89f |   jeq A, 0xe000, ${_C_scope_7}:rel + PC
61 40 e0 0c ff                 # e8a7 |   mov B, [0xff0c]
2c 40 e0 00 01                 # e8ac |   and B, 0x100
                               #      | _A_if_56:
e8 40 00 f8 16 00              # e8b1 |   jeq B, 0, ${_E_if_56}:rel + PC
                               #      | _A_call_42:
e0 e0 e6 f0                    # e8b7 |   push ${const__str__FORCED_BOOTLOADER__endl}
5c f8 78 f7                    # e8bb |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # e8bf |   mov SP, SP + 0x2
                               #      | _Z_call_42:
58 f8 16 00                    # e8c3 |   jmp ${_C_scope_7}:rel + PC
                               #      | _E_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
                               #      | _A_call_43:
e0 20                          # e8c7 |   push A
e0 e0 8c f0                    # e8c9 |   push ${const__data_5}
5c f8 66 f7                    # e8cd |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e8d1 |   mov SP, SP + 0x4
                               #      | _Z_call_43:
58 f8 73 ff                    # e8d5 |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_7:
                               #      | _Z_scope_7:
                               #      | _A_call_44:
e0 e0 f9 f0                    # e8d9 |   push ${const__str__READY__endl}
5c f8 d8 f8                    # e8dd |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e8e1 |   mov SP, SP + 0x2
                               #      | _Z_call_44:
c6 e0 00 0a ff                 # e8e5 |   inc [0xff0a], 0
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
                               #      | _A_call_60:
5c f8 56 00                    # e8ea |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_60:
46 e0 0a ff                    # e8ee |   inc [0xff0a]
60 20 ff                       # e8f2 |   mov A, H
                               #      | _A_if_80:
ec fe 00 f8 0a 00              # e8f5 |   jne G, 0, ${_E_if_80}:rel + PC
58 f8 ef ff                    # e8fb |   jmp ${_BA_loop_9}:rel + PC
                               #      | _E_if_80:
                               #      | _C_if_80:
                               #      | _Z_if_80:
                               #      | _A_if_81:
ec 20 00 f8 16 00              # e8ff |   jne A, 0, ${_E_if_81}:rel + PC
                               #      | _A_call_61:
e0 e0 68 f1                    # e905 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 ac f8                    # e909 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e90d |   mov SP, SP + 0x2
                               #      | _Z_call_61:
58 f8 d9 ff                    # e911 |   jmp ${_BA_loop_9}:rel + PC
                               #      | _E_if_81:
                               #      | _C_if_81:
                               #      | _Z_if_81:
60 40 21                       # e915 |   mov B, A*2
60 40 e8 a7 f0                 # e918 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # e91d |   push A
5e 40                          # e91f |   call [B]
e4 20                          # e921 |   pop A
                               #      | _BZ_loop_9:
58 f8 c7 ff                    # e923 |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
                               #      | _cleanup_fn_main:
e4 20                          # e927 |   pop A
e4 40                          # e929 |   pop B
dc                             # e92b |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_53:
f0 ff 1c f8 14 08 00           # e92c |   jlt H, 0x14, ${_E_if_53}:rel + PC
dc                             # e933 |   ret
                               #      | _E_if_53:
                               #      | _C_if_53:
                               #      | _Z_if_53:
28 ff 1c 01                    # e934 |   shl H, 0x1
00 ff e0 f0 ef                 # e938 |   add H, ${const__SYSCALL_MAP}
5a ff                          # e93d |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # e93f |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # e940 |   push D
e0 60                          # e942 |   push C
e0 40                          # e944 |   push B
e0 20                          # e946 |   push A
60 a0 bc fe                    # e948 |   mov SP, SP + -2
62 a0 00                       # e94c |   mov [SP], 0
60 a0 bc de                    # e94f |   mov SP, SP + -34
62 a0 00                       # e953 |   mov [SP], 0
60 20 a0                       # e956 |   mov A, SP
                               #      | _A_loop_10:
                               #      | _BA_loop_10:
                               #      | _A_call_45:
5c f8 09 f9                    # e959 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_45:
60 60 ff                       # e95d |   mov C, H
62 e0 60 00 ff                 # e960 |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # e965 |   jeq C, 0xa, ${_C_loop_10}:rel + PC
e8 60 1c f8 0d 29 00           # e96c |   jeq C, 0xd, ${_C_loop_10}:rel + PC
                               #      | _A_if_59:
f0 20 bc f8 1f 19 00           # e973 |   jlt A, SP + 0x1f, ${_E_if_59}:rel + PC
                               #      | _A_call_46:
e0 e0 00 f1                    # e97a |   push ${const__data_8}
5c f8 37 f8                    # e97e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e982 |   mov SP, SP + 0x2
                               #      | _Z_call_46:
e8 ff 00 f8 d3 00              # e986 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_59:
                               #      | _C_if_59:
                               #      | _Z_if_59:
62 20 60                       # e98c |   mov [A], C
44 20                          # e98f |   inc A
                               #      | _BZ_loop_10:
58 f8 c8 ff                    # e991 |   jmp ${_BA_loop_10}:rel + PC
                               #      | _C_loop_10:
                               #      | _Z_loop_10:
                               #      | _A_call_47:
e0 1c 20                       # e995 |   push 0x20
e0 bc 02                       # e998 |   push SP + 0x2
5c f8 40 fa                    # e99b |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # e99f |   mov SP, SP + 0x4
                               #      | _Z_call_47:
60 60 ff                       # e9a3 |   mov C, H
                               #      | _A_if_61:
e8 60 00 f8 0f 00              # e9a6 |   jeq C, 0, ${_E_if_61}:rel + PC
66 60 00                       # e9ac |   bmov [C], 0
44 60                          # e9af |   inc C
58 f8 08 00                    # e9b1 |   jmp ${_C_if_61}:rel + PC
                               #      | _E_if_61:
60 60 1c ff                    # e9b5 |   mov C, -1
                               #      | _C_if_61:
                               #      | _Z_if_61:
                               #      | _A_call_55:
e0 a0                          # e9b9 |   push SP
5c f8 b1 00                    # e9bb |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # e9bf |   mov SP, SP + 0x2
                               #      | _Z_call_55:
e8 ff 00 f8 9c 00              # e9c3 |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # e9c9 |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 02 fb                 # e9cd |   mov [${var__g_num_args}], 0
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 60 bc f8 20 7c 00           # e9d2 |   jge C, SP + 0x20, ${_C_while_9}:rel + PC
                               #      | _A_call_56:
e0 1c 20                       # e9d9 |   push 0x20
e0 60                          # e9dc |   push C
5c f8 fd f9                    # e9de |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # e9e2 |   mov SP, SP + 0x4
                               #      | _Z_call_56:
60 80 ff                       # e9e6 |   mov D, H
                               #      | _A_if_77:
e8 80 00 f8 0d 00              # e9e9 |   jeq D, 0, ${_E_if_77}:rel + PC
66 80 00                       # e9ef |   bmov [D], 0
58 f8 08 00                    # e9f2 |   jmp ${_C_if_77}:rel + PC
                               #      | _E_if_77:
60 80 1c fe                    # e9f6 |   mov D, -2
                               #      | _C_if_77:
                               #      | _Z_if_77:
61 20 e0 02 fb                 # e9fa |   mov A, [${var__g_num_args}]
                               #      | _A_if_78:
f0 20 1c f8 04 17 00           # e9ff |   jlt A, 0x4, ${_E_if_78}:rel + PC
                               #      | _A_call_57:
e0 e0 3f f1                    # ea06 |   push ${const__data_9}
5c f8 ab f7                    # ea0a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # ea0e |   mov SP, SP + 0x2
                               #      | _Z_call_57:
58 f8 47 00                    # ea12 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_78:
                               #      | _C_if_78:
                               #      | _Z_if_78:
                               #      | _A_call_58:
e0 60                          # ea16 |   push C
5c f8 a4 f8                    # ea18 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # ea1c |   mov SP, SP + 0x2
                               #      | _Z_call_58:
                               #      | _A_if_79:
ec fe 00 f8 18 00              # ea20 |   jne G, 0, ${_E_if_79}:rel + PC
                               #      | _A_call_59:
e0 20                          # ea26 |   push A
e0 e0 54 f1                    # ea28 |   push ${const__data_10}
5c f8 07 f6                    # ea2c |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # ea30 |   mov SP, SP + 0x4
                               #      | _Z_call_59:
58 f8 25 00                    # ea34 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_79:
                               #      | _C_if_79:
                               #      | _Z_if_79:
a8 40 20 1c 01                 # ea38 |   shl B, A, 0x1
62 e8 ff 04 fb                 # ea3d |   mov [${var__g_args} + B], H
c6 e0 20 02 fb                 # ea42 |   inc [${var__g_num_args}], A
c4 60 80                       # ea47 |   inc C, D
                               #      | _BZ_while_9:
58 f8 88 ff                    # ea4a |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
c4 fe 00                       # ea4e |   inc G, 0
61 ff bc 22                    # ea51 |   mov H, [SP + 0x22]
58 f8 0a 00                    # ea55 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # ea59 |   mov G, 0
60 ff 00                       # ea5c |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # ea5f |   mov SP, SP + 0x24
e4 20                          # ea63 |   pop A
e4 40                          # ea65 |   pop B
e4 60                          # ea67 |   pop C
e4 80                          # ea69 |   pop D
dc                             # ea6b |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # ea6c |   push A
61 20 bc 04                    # ea6e |   mov A, [SP + 0x4]
                               #      | _A_call_48:
e0 e0 12 f1                    # ea72 |   push ${const__str__PING}
e0 20                          # ea76 |   push A
5c f8 2d f9                    # ea78 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # ea7c |   mov SP, SP + 0x4
                               #      | _Z_call_48:
                               #      | _A_if_63:
ec ff 00 f8 0d 00              # ea80 |   jne H, 0, ${_E_if_63}:rel + PC
c4 ff 00                       # ea86 |   inc H, 0
58 f8 af 00                    # ea89 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_63:
                               #      | _C_if_63:
                               #      | _Z_if_63:
                               #      | _A_call_49:
e0 e0 17 f1                    # ea8d |   push ${const__str__READ}
e0 20                          # ea91 |   push A
5c f8 12 f9                    # ea93 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # ea97 |   mov SP, SP + 0x4
                               #      | _Z_call_49:
                               #      | _A_if_65:
ec ff 00 f8 0e 00              # ea9b |   jne H, 0, ${_E_if_65}:rel + PC
60 ff 1c 02                    # eaa1 |   mov H, 0x2
58 f8 93 00                    # eaa5 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_65:
                               #      | _C_if_65:
                               #      | _Z_if_65:
                               #      | _A_call_50:
e0 e0 1c f1                    # eaa9 |   push ${const__str__WRITE}
e0 20                          # eaad |   push A
5c f8 f6 f8                    # eaaf |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # eab3 |   mov SP, SP + 0x4
                               #      | _Z_call_50:
                               #      | _A_if_67:
ec ff 00 f8 0e 00              # eab7 |   jne H, 0, ${_E_if_67}:rel + PC
60 ff 1c 03                    # eabd |   mov H, 0x3
58 f8 77 00                    # eac1 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_67:
                               #      | _C_if_67:
                               #      | _Z_if_67:
                               #      | _A_call_51:
e0 e0 22 f1                    # eac5 |   push ${const__str__READB}
e0 20                          # eac9 |   push A
5c f8 da f8                    # eacb |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # eacf |   mov SP, SP + 0x4
                               #      | _Z_call_51:
                               #      | _A_if_69:
ec ff 00 f8 0e 00              # ead3 |   jne H, 0, ${_E_if_69}:rel + PC
60 ff 1c 04                    # ead9 |   mov H, 0x4
58 f8 5b 00                    # eadd |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_69:
                               #      | _C_if_69:
                               #      | _Z_if_69:
                               #      | _A_call_52:
e0 e0 28 f1                    # eae1 |   push ${const__str__WRITEB}
e0 20                          # eae5 |   push A
5c f8 be f8                    # eae7 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # eaeb |   mov SP, SP + 0x4
                               #      | _Z_call_52:
                               #      | _A_if_71:
ec ff 00 f8 0e 00              # eaef |   jne H, 0, ${_E_if_71}:rel + PC
60 ff 1c 05                    # eaf5 |   mov H, 0x5
58 f8 3f 00                    # eaf9 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_71:
                               #      | _C_if_71:
                               #      | _Z_if_71:
                               #      | _A_call_53:
e0 e0 2f f1                    # eafd |   push ${const__str__JMP}
e0 20                          # eb01 |   push A
5c f8 a2 f8                    # eb03 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # eb07 |   mov SP, SP + 0x4
                               #      | _Z_call_53:
                               #      | _A_if_73:
ec ff 00 f8 0e 00              # eb0b |   jne H, 0, ${_E_if_73}:rel + PC
60 ff 1c 06                    # eb11 |   mov H, 0x6
58 f8 23 00                    # eb15 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_73:
                               #      | _C_if_73:
                               #      | _Z_if_73:
                               #      | _A_call_54:
e0 e0 33 f1                    # eb19 |   push ${const__str__JMP_PERSIST}
e0 20                          # eb1d |   push A
5c f8 86 f8                    # eb1f |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # eb23 |   mov SP, SP + 0x4
                               #      | _Z_call_54:
                               #      | _A_if_75:
ec ff 00 f8 0e 00              # eb27 |   jne H, 0, ${_E_if_75}:rel + PC
60 ff 1c 07                    # eb2d |   mov H, 0x7
58 f8 07 00                    # eb31 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_75:
                               #      | _C_if_75:
                               #      | _Z_if_75:
60 ff 00                       # eb35 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # eb38 |   pop A
dc                             # eb3a |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # eb3b |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # ef30 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
33 e0 50 e1 62 e2 68 e1 d7 e1 2d e2 14 e2 81 e2 bc e2 0c e3 45 e3 7e e3 a5 e3 db e3 fa e3 01 e4 0c e4 b5 e1 a7 e4 79 e5 # eff0 |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # f018 |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # f03c |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # f042 |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # f051 |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # f05e |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # f06d |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # f07d |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # f08c |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # f097 |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__HANDLER_MAP:
bb e5 f5 e5 04 e7 f5 e5 04 e7 04 e8 04 e8 # f0a9 |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp]
                               #      | const__data_7:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 33 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 31 0a 00 # f0b7 |   .data str:"Weeekly3006 - Hardware v1.3 - Bootloader v2.1\n"
                               #      | const__str__FORCED_BOOTLOADER__endl:
46 4f 52 43 45 44 5f 42 4f 4f 54 4c 4f 41 44 45 52 0a 00 # f0e6 |   .data str:"FORCED_BOOTLOADER\n"
                               #      | const__str__READY__endl:
52 45 41 44 59 0a 00           # f0f9 |   .data str:"READY\n"
                               #      | const__data_8:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # f100 |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # f112 |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # f117 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # f11c |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # f122 |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # f128 |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # f12f |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # f133 |   .data str:"JMP_PERSIST"
                               #      | const__data_9:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 34 0a 00 # f13f |   .data str:"TOO_MANY_ARGS max=4\n"
                               #      | const__data_10:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # f154 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # f168 |   .data str:"UNKNOWN_COMMAND\n"
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
