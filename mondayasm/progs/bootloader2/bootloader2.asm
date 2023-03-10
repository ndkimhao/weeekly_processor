                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 00 ff                 # a000 |   mov SP, 0xff00
                               #      | _A_call_57:
5c f8 80 05                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_57:
d8                             # a009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_16:
e0 00                          # a00a |   push 0
5c f8 15 00                    # a00c |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a010 |   mov SP, SP + 0x2
                               #      | _Z_call_16:
                               #      | _A_call_17:
e0 e0 60 a8                    # a014 |   push ${const__str__PONG__endl}
5c f8 ae 01                    # a018 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01c |   mov SP, SP + 0x2
                               #      | _Z_call_17:
                               #      | _cleanup_fn_handle_ping:
dc                             # a020 |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # a021 |   inc G, 0
                               #      | _A_if_1:
eb e0 bc f8 00 fb 02 1f 00     # a024 |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_1}:rel + PC
                               #      | _A_call_15:
e2 e0 00 fb                    # a02d |   push [${var__g_num_args}]
e2 bc 04                       # a031 |   push [SP + 0x4]
e0 e0 3c a8                    # a034 |   push ${const__data_1}
5c f8 0c 00                    # a038 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a03c |   mov SP, SP + 0x6
                               #      | _Z_call_15:
60 fe 00                       # a040 |   mov G, 0
                               #      | _E_if_1:
                               #      | _C_if_1:
                               #      | _Z_if_1:
                               #      | _cleanup_fn_check_num_args:
dc                             # a043 |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # a044 |   push C
e0 40                          # a046 |   push B
e0 20                          # a048 |   push A
60 a0 bc ee                    # a04a |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # a04e |   mov B, SP + 0x1c
                               #      | _A_for_1:
61 20 bc 1a                    # a052 |   mov A, [SP + 0x1a]
                               #      | _BA_for_1:
65 60 20                       # a056 |   bmov C, [A]
e8 60 00 f8 fd 00              # a059 |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_3:
e8 60 1c f8 25 15 00           # a05f |   jeq C, 0x25, ${_E_if_3}:rel + PC
                               #      | _A_call_1:
e0 60                          # a066 |   push C
5c f8 f9 00                    # a068 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a06c |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 e0 00                    # a070 |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      |   # format specifier
44 20                          # a074 |   inc A
65 60 20                       # a076 |   bmov C, [A]
                               #      | _A_if_5:
ec 60 00 f8 0e 00              # a079 |   jne C, 0, ${_E_if_5}:rel + PC
58 f8 d7 00                    # a07f |   jmp ${_C_for_1}:rel + PC
58 f8 c9 00                    # a083 |   jmp ${_C_if_5}:rel + PC
                               #      | _E_if_5:
ec 60 1c f8 25 1a 00           # a087 |   jne C, 0x25, ${_E2_if_5}:rel + PC
                               #      | _A_call_2:
e0 1c 25                       # a08e |   push 0x25
5c f8 d0 00                    # a091 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a095 |   mov SP, SP + 0x2
                               #      | _Z_call_2:
58 f8 b7 00                    # a099 |   jmp ${_BZ_for_1}:rel + PC
58 f8 af 00                    # a09d |   jmp ${_C_if_5}:rel + PC
                               #      | _E2_if_5:
ec 60 1c f8 64 21 00           # a0a1 |   jne C, 0x64, ${_E3_if_5}:rel + PC
                               #      | _A_call_3:
e0 a0                          # a0a8 |   push SP
e2 40                          # a0aa |   push [B]
5c f8 cd 00                    # a0ac |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # a0b0 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 a0                          # a0b4 |   push SP
5c f8 10 01                    # a0b6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0ba |   mov SP, SP + 0x2
                               #      | _Z_call_5:
58 f8 8e 00                    # a0be |   jmp ${_C_if_5}:rel + PC
                               #      | _E3_if_5:
ec 60 1c f8 78 21 00           # a0c2 |   jne C, 0x78, ${_E4_if_5}:rel + PC
                               #      | _A_call_7:
e0 a0                          # a0c9 |   push SP
e2 40                          # a0cb |   push [B]
5c f8 1b 01                    # a0cd |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a0d1 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 a0                          # a0d5 |   push SP
5c f8 ef 00                    # a0d7 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0db |   mov SP, SP + 0x2
                               #      | _Z_call_8:
58 f8 6d 00                    # a0df |   jmp ${_C_if_5}:rel + PC
                               #      | _E4_if_5:
ec 60 1c f8 68 22 00           # a0e3 |   jne C, 0x68, ${_E5_if_5}:rel + PC
                               #      | _A_call_9:
e0 a0                          # a0ea |   push SP
e2 40                          # a0ec |   push [B]
5c f8 fa 00                    # a0ee |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a0f2 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 bc 02                       # a0f6 |   push SP + 0x2
5c f8 cd 00                    # a0f9 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0fd |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 4b 00                    # a101 |   jmp ${_C_if_5}:rel + PC
                               #      | _E5_if_5:
ec 60 1c f8 62 21 00           # a105 |   jne C, 0x62, ${_E6_if_5}:rel + PC
                               #      | _A_call_11:
e0 a0                          # a10c |   push SP
e2 40                          # a10e |   push [B]
5c f8 2e 01                    # a110 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # a114 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 a0                          # a118 |   push SP
5c f8 ac 00                    # a11a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a11e |   mov SP, SP + 0x2
                               #      | _Z_call_12:
58 f8 2a 00                    # a122 |   jmp ${_C_if_5}:rel + PC
                               #      | _E6_if_5:
ec 60 1c f8 73 15 00           # a126 |   jne C, 0x73, ${_E7_if_5}:rel + PC
                               #      | _A_call_13:
e2 40                          # a12d |   push [B]
5c f8 97 00                    # a12f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a133 |   mov SP, SP + 0x2
                               #      | _Z_call_13:
58 f8 15 00                    # a137 |   jmp ${_C_if_5}:rel + PC
                               #      | _E7_if_5:
ec 60 1c f8 63 11 00           # a13b |   jne C, 0x63, ${_E8_if_5}:rel + PC
                               #      | _A_call_14:
e2 40                          # a142 |   push [B]
5c f8 1d 00                    # a144 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a148 |   mov SP, SP + 0x2
                               #      | _Z_call_14:
                               #      | _E8_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
60 40 5c 02                    # a14c |   mov B, B + 0x2
                               #      | _BZ_for_1:
44 20                          # a150 |   inc A
58 f8 04 ff                    # a152 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # a156 |   mov SP, SP + 0x12
e4 20                          # a15a |   pop A
e4 40                          # a15c |   pop B
e4 60                          # a15e |   pop C
dc                             # a160 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a161 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a168 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a16e |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a172 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a178 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # a179 |   push C
e0 40                          # a17b |   push B
e0 20                          # a17d |   push A
61 20 bc 0a                    # a17f |   mov A, [SP + 0xa]
62 20 1c 30                    # a183 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # a187 |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # a18b |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # a191 |   div C, B, 0xa
82 20 ff 1c 30                 # a196 |   add [A], H, 0x30
44 20                          # a19b |   inc A
60 40 60                       # a19d |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # a1a0 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # a1a4 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # a1a8 |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # a1ae |   dec A
61 40 60                       # a1b0 |   mov B, [C]
67 60 20                       # a1b3 |   bmov [C], [A]
66 20 40                       # a1b6 |   bmov [A], B
44 60                          # a1b9 |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # a1bb |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # a1bf |   pop A
e4 40                          # a1c1 |   pop B
e4 60                          # a1c3 |   pop C
dc                             # a1c5 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a1c6 |   push A
                               #      | _A_for_2:
61 20 bc 04                    # a1c8 |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # a1cc |   bmov H, [A]
e8 ff 00 f8 16 00              # a1cf |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_4:
e0 ff                          # a1d5 |   push H
5c f8 8a ff                    # a1d7 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a1db |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # a1df |   inc A
58 f8 eb ff                    # a1e1 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # a1e5 |   pop A
dc                             # a1e7 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # a1e8 |   push C
e0 40                          # a1ea |   push B
e0 20                          # a1ec |   push A
61 40 bc 08                    # a1ee |   mov B, [SP + 0x8]
61 60 bc 0a                    # a1f2 |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # a1f6 |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # a1fa |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # a201 |   shr H, B, A*4
2c ff 1c 0f                    # a205 |   and H, 0xf
                               #      | _A_call_6:
e0 ff                          # a209 |   push H
5c f8 1a 00                    # a20b |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # a20f |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 60 ff                       # a213 |   mov [C], H
44 60                          # a216 |   inc C
                               #      | _BZ_for_3:
48 20                          # a218 |   dec A
58 f8 e0 ff                    # a21a |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # a21e |   pop A
e4 40                          # a220 |   pop B
e4 60                          # a222 |   pop C
dc                             # a224 |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_7:
fa bc 1c f8 02 09 12 00        # a225 |   jgt [SP + 0x2], 0x9, ${_E_if_7}:rel + PC
81 ff bc 1c 02 30              # a22d |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # a233 |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
81 ff bc 1c 02 57              # a237 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # a23d |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # a23e |   push C
e0 40                          # a240 |   push B
e0 20                          # a242 |   push A
61 40 bc 08                    # a244 |   mov B, [SP + 0x8]
61 60 bc 0a                    # a248 |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # a24c |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # a250 |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # a257 |   shr H, B, A
2c ff 1c 01                    # a25b |   and H, 0x1
82 60 ff 1c 30                 # a25f |   add [C], H, 0x30
44 60                          # a264 |   inc C
                               #      | _BZ_for_4:
48 20                          # a266 |   dec A
58 f8 e8 ff                    # a268 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # a26c |   pop A
e4 40                          # a26e |   pop B
e4 60                          # a270 |   pop C
dc                             # a272 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # a273 |   push D
e0 60                          # a275 |   push C
e0 40                          # a277 |   push B
e0 20                          # a279 |   push A
60 a0 bc fa                    # a27b |   mov SP, SP + -6
                               #      | _A_call_18:
e0 1c 02                       # a27f |   push 0x2
5c f8 9f fd                    # a282 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a286 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
e8 fe 00 f8 8a 00              # a28a |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_20:
5c f8 91 00                    # a290 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_20:
e8 fe 00 f8 80 00              # a294 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 02 fb                 # a29a |   mov A, [${var__g_args}]
61 40 e0 04 fb                 # a29f |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_13:
ee bc 1c f8 10 02 3c 00        # a2a4 |   jne [SP + 0x10], 0x2, ${_E_if_13}:rel + PC
                               #      | _A_while_3:
                               #      | _BA_while_3:
fc 20 40 f8 30 00              # a2ac |   jge A, B, ${_C_while_3}:rel + PC
61 60 20                       # a2b2 |   mov C, [A]
a0 80 60 1c 08                 # a2b5 |   shr D, C, 0x8
28 60 1c 08                    # a2ba |   shl C, 0x8
                               #      | _A_call_21:
e0 a0                          # a2be |   push SP
e0 8c                          # a2c0 |   push D + C
5c f8 26 ff                    # a2c2 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a2c6 |   mov SP, SP + 0x4
                               #      | _Z_call_21:
                               #      | _A_call_22:
e0 a0                          # a2ca |   push SP
5c f8 fa fe                    # a2cc |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a2d0 |   mov SP, SP + 0x2
                               #      | _Z_call_22:
60 20 3c 02                    # a2d4 |   mov A, A + 0x2
                               #      | _BZ_while_3:
58 f8 d4 ff                    # a2d8 |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
58 f8 2d 00                    # a2dc |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
                               #      | _A_while_4:
                               #      | _BA_while_4:
fc 20 40 f8 29 00              # a2e0 |   jge A, B, ${_C_while_4}:rel + PC
61 60 20                       # a2e6 |   mov C, [A]
                               #      | _A_call_23:
e0 60                          # a2e9 |   push C
5c f8 76 fe                    # a2eb |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a2ef |   mov SP, SP + 0x2
                               #      | _Z_call_23:
20 60 1c 08                    # a2f3 |   shr C, 0x8
                               #      | _A_call_24:
e0 60                          # a2f7 |   push C
5c f8 68 fe                    # a2f9 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a2fd |   mov SP, SP + 0x2
                               #      | _Z_call_24:
60 20 3c 02                    # a301 |   mov A, A + 0x2
                               #      | _BZ_while_4:
58 f8 db ff                    # a305 |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _A_call_25:
e0 1c 0a                       # a309 |   push 0xa
5c f8 55 fe                    # a30c |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a310 |   mov SP, SP + 0x2
                               #      | _Z_call_25:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # a314 |   mov SP, SP + 0x6
e4 20                          # a318 |   pop A
e4 40                          # a31a |   pop B
e4 60                          # a31c |   pop C
e4 80                          # a31e |   pop D
dc                             # a320 |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # a321 |   push C
e0 40                          # a323 |   push B
e0 20                          # a325 |   push A
61 20 e0 02 fb                 # a327 |   mov A, [${var__g_args}]
61 40 e0 04 fb                 # a32c |   mov B, [${var__g_args} + 0002]
60 60 e0 66 a8                 # a331 |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # a336 |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 75 a8                 # a33c |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # a341 |   and G, A, 0x1
ec fe 00 f8 18 00              # a346 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # a34c |   and G, B, 0x1
ec fe 00 f8 0d 00              # a351 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # a357 |   inc G, 0
58 f8 11 00                    # a35a |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_19:
e0 60                          # a35e |   push C
5c f8 66 fe                    # a360 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a364 |   mov SP, SP + 0x2
                               #      | _Z_call_19:
60 fe 00                       # a368 |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # a36b |   pop A
e4 40                          # a36d |   pop B
e4 60                          # a36f |   pop C
dc                             # a371 |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # a372 |   push D
e0 60                          # a374 |   push C
e0 40                          # a376 |   push B
e0 20                          # a378 |   push A
60 a0 bc fa                    # a37a |   mov SP, SP + -6
                               #      | _A_call_26:
e0 1c 02                       # a37e |   push 0x2
5c f8 a0 fc                    # a381 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a385 |   mov SP, SP + 0x2
                               #      | _Z_call_26:
e8 fe 00 f8 dc 00              # a389 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_27:
5c f8 92 ff                    # a38f |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_27:
e8 fe 00 f8 d2 00              # a393 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 02 fb                 # a399 |   mov A, [${var__g_args}]
61 40 e0 04 fb                 # a39e |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_16:
ee bc 1c f8 10 03 55 00        # a3a3 |   jne [SP + 0x10], 0x3, ${_E_if_16}:rel + PC
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 20 40 f8 49 00              # a3ab |   jge A, B, ${_C_while_5}:rel + PC
                               #      | _A_for_5:
60 80 00                       # a3b1 |   mov D, 0
                               #      | _BA_for_5:
fc 80 1c f8 04 19 00           # a3b4 |   jge D, 0x4, ${_C_for_5}:rel + PC
                               #      | _A_call_28:
5c f8 b7 00                    # a3bb |   call ${fn_getc}:rel + PC
                               #      | _Z_call_28:
62 e0 ff 00 ff                 # a3bf |   mov [0xff00], H
62 b0 ff                       # a3c4 |   mov [SP + D], H
                               #      | _BZ_for_5:
44 80                          # a3c7 |   inc D
58 f8 eb ff                    # a3c9 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _A_call_30:
e0 a0                          # a3cd |   push SP
5c f8 c2 00                    # a3cf |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a3d3 |   mov SP, SP + 0x2
                               #      | _Z_call_30:
e8 fe 00 f8 7f 00              # a3d7 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # a3dd |   shl C, H, 0x8
20 ff 1c 08                    # a3e2 |   shr H, 0x8
30 60 ff                       # a3e6 |   or C, H
62 20 60                       # a3e9 |   mov [A], C
60 20 3c 02                    # a3ec |   mov A, A + 0x2
                               #      | _BZ_while_5:
58 f8 bb ff                    # a3f0 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
58 f8 31 00                    # a3f4 |   jmp ${_C_if_16}:rel + PC
                               #      | _E_if_16:
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc 20 40 f8 2d 00              # a3f8 |   jge A, B, ${_C_while_6}:rel + PC
                               #      | _A_call_31:
5c f8 74 00                    # a3fe |   call ${fn_getc}:rel + PC
                               #      | _Z_call_31:
62 e0 ff 00 ff                 # a402 |   mov [0xff00], H
60 60 ff                       # a407 |   mov C, H
                               #      | _A_call_32:
5c f8 68 00                    # a40a |   call ${fn_getc}:rel + PC
                               #      | _Z_call_32:
62 e0 ff 00 ff                 # a40e |   mov [0xff00], H
28 ff 1c 08                    # a413 |   shl H, 0x8
30 60 ff                       # a417 |   or C, H
62 20 60                       # a41a |   mov [A], C
60 20 3c 02                    # a41d |   mov A, A + 0x2
                               #      | _BZ_while_6:
58 f8 d7 ff                    # a421 |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _A_call_33:
5c f8 4d 00                    # a425 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_33:
62 e0 ff 00 ff                 # a429 |   mov [0xff00], H
                               #      | _A_scope_4:
                               #      | _B_scope_4:
e8 ff 1c f8 0a 12 00           # a42e |   jeq H, 0xa, ${_C_scope_4}:rel + PC
e8 ff 1c f8 0d 0b 00           # a435 |   jeq H, 0xd, ${_C_scope_4}:rel + PC
58 f8 1a 00                    # a43c |   jmp ${_L_fn_handle_write_1}:rel + PC
                               #      | _C_scope_4:
                               #      | _Z_scope_4:
                               #      | _A_call_34:
e0 40                          # a440 |   push B
e2 e0 02 fb                    # a442 |   push [${var__g_args}]
e0 e0 82 a8                    # a446 |   push ${const__data_2}
5c f8 fa fb                    # a44a |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a44e |   mov SP, SP + 0x6
                               #      | _Z_call_34:
58 f8 13 00                    # a452 |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_35:
e0 e0 92 a8                    # a456 |   push ${const__data_3}
5c f8 6c fd                    # a45a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a45e |   mov SP, SP + 0x2
                               #      | _Z_call_35:
60 fe 00                       # a462 |   mov G, 0
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # a465 |   mov SP, SP + 0x6
e4 20                          # a469 |   pop A
e4 40                          # a46b |   pop B
e4 60                          # a46d |   pop C
e4 80                          # a46f |   pop D
dc                             # a471 |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_getc:
                               #      | _begin_fn_getc:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 02 ff                 # a472 |   mov H, [0xff02]
ac fe ff e0 00 80              # a477 |   and G, H, 0x8000
e8 fe 00 f8 f5 ff              # a47d |   jeq G, 0, ${_BA_loop_2}:rel + PC
2c ff e0 ff 00                 # a483 |   and H, 0xff
58 f8 08 00                    # a488 |   jmp ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 e6 ff                    # a48c |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_getc:
dc                             # a490 |   ret
                               #      | _end_fn_getc:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # a491 |   push B
e0 20                          # a493 |   push A
60 20 00                       # a495 |   mov A, 0
61 40 bc 06                    # a498 |   mov B, [SP + 0x6]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
65 ff 40                       # a49c |   bmov H, [B]
e8 ff 00 f8 23 00              # a49f |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_29:
e0 ff                          # a4a5 |   push H
5c f8 3a 00                    # a4a7 |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # a4ab |   mov SP, SP + 0x2
                               #      | _Z_call_29:
e8 fe 00 f8 2d 00              # a4af |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # a4b5 |   shl A, 0x4
00 20 ff                       # a4b9 |   add A, H
44 40                          # a4bc |   inc B
                               #      | _BZ_loop_3:
58 f8 de ff                    # a4be |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
60 fe 00                       # a4c2 |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # a4c5 |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # a4c9 |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # a4cf |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # a4d6 |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # a4d9 |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # a4dc |   pop A
e4 40                          # a4de |   pop B
dc                             # a4e0 |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # a4e1 |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # a4e7 |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # a4ee |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # a4f5 |   sub H, G, 0x30
c4 fe 00                       # a4fa |   inc G, 0
dc                             # a4fd |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # a4fe |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # a505 |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # a50c |   add H, G, -87
c4 fe 00                       # a511 |   inc G, 0
dc                             # a514 |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # a515 |   mov H, 0
60 fe 00                       # a518 |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # a51b |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
                               #      | _A_call_36:
e0 1c 01                       # a51c |   push 0x1
5c f8 02 fb                    # a51f |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a523 |   mov SP, SP + 0x2
                               #      | _Z_call_36:
e8 fe 00 f8 5d 00              # a527 |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_if_30:
ee bc 1c f8 02 06 1c 00        # a52d |   jne [SP + 0x2], 0x6, ${_E_if_30}:rel + PC
                               #      | _A_call_37:
e2 e0 02 fb                    # a535 |   push [${var__g_args}]
e0 e0 a1 a8                    # a539 |   push ${const__data_4}
5c f8 07 fb                    # a53d |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a541 |   mov SP, SP + 0x4
                               #      | _Z_call_37:
5a f8 bd 55                    # a545 |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
63 e0 e0 1c ff 02 fb           # a549 |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_38:
e2 e0 1c ff                    # a550 |   push [0xff1c]
e0 e0 ac a8                    # a554 |   push ${const__data_5}
5c f8 ec fa                    # a558 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a55c |   mov SP, SP + 0x4
                               #      | _Z_call_38:
62 e0 00 0a ff                 # a560 |   mov [0xff0a], 0
60 20 00                       # a565 |   mov A, 0
60 40 00                       # a568 |   mov B, 0
60 60 00                       # a56b |   mov C, 0
60 80 00                       # a56e |   mov D, 0
60 a0 00                       # a571 |   mov SP, 0
60 fc 00                       # a574 |   mov E, 0
60 fd 00                       # a577 |   mov F, 0
60 fe 00                       # a57a |   mov G, 0
60 ff 00                       # a57d |   mov H, 0
5a e0 1c ff                    # a580 |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # a584 |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # a585 |   push B
e0 20                          # a587 |   push A
60 20 e0 fd 00                 # a589 |   mov A, 0xfd
60 40 00                       # a58e |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # a591 |   mmap 0xff00, -1, 0x2
                               #      | _A_call_39:
e0 e0 cc a8                    # a599 |   push ${const__data_6}
5c f8 29 fc                    # a59d |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a5a1 |   mov SP, SP + 0x2
                               #      | _Z_call_39:
c6 e0 00 0a ff                 # a5a5 |   inc [0xff0a], 0
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
                               #      | _A_call_55:
5c f8 42 00                    # a5aa |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_55:
46 e0 0a ff                    # a5ae |   inc [0xff0a]
60 20 ff                       # a5b2 |   mov A, H
                               #      | _A_if_59:
ec fe 00 f8 0a 00              # a5b5 |   jne G, 0, ${_E_if_59}:rel + PC
58 f8 ef ff                    # a5bb |   jmp ${_BA_loop_4}:rel + PC
                               #      | _E_if_59:
                               #      | _C_if_59:
                               #      | _Z_if_59:
                               #      | _A_if_60:
ec 20 00 f8 16 00              # a5bf |   jne A, 0, ${_E_if_60}:rel + PC
                               #      | _A_call_56:
e0 e0 69 a9                    # a5c5 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 fd fb                    # a5c9 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a5cd |   mov SP, SP + 0x2
                               #      | _Z_call_56:
58 f8 d9 ff                    # a5d1 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _E_if_60:
                               #      | _C_if_60:
                               #      | _Z_if_60:
60 40 21                       # a5d5 |   mov B, A*2
60 40 e8 bc a8                 # a5d8 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # a5dd |   push A
5e 40                          # a5df |   call [B]
e4 20                          # a5e1 |   pop A
                               #      | _BZ_loop_4:
58 f8 c7 ff                    # a5e3 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_main:
e4 20                          # a5e7 |   pop A
e4 40                          # a5e9 |   pop B
dc                             # a5eb |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # a5ec |   push D
e0 60                          # a5ee |   push C
e0 40                          # a5f0 |   push B
e0 20                          # a5f2 |   push A
60 a0 bc fe                    # a5f4 |   mov SP, SP + -2
62 a0 00                       # a5f8 |   mov [SP], 0
60 a0 bc de                    # a5fb |   mov SP, SP + -34
62 a0 00                       # a5ff |   mov [SP], 0
60 20 a0                       # a602 |   mov A, SP
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
                               #      | _A_call_40:
5c f8 6d fe                    # a605 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_40:
60 60 ff                       # a609 |   mov C, H
62 e0 60 00 ff                 # a60c |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # a611 |   jeq C, 0xa, ${_C_loop_5}:rel + PC
e8 60 1c f8 0d 29 00           # a618 |   jeq C, 0xd, ${_C_loop_5}:rel + PC
                               #      | _A_if_33:
f0 20 bc f8 1f 19 00           # a61f |   jlt A, SP + 0x1f, ${_E_if_33}:rel + PC
                               #      | _A_call_41:
e0 e0 01 a9                    # a626 |   push ${const__data_7}
5c f8 9c fb                    # a62a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a62e |   mov SP, SP + 0x2
                               #      | _Z_call_41:
e8 ff 00 f8 d3 00              # a632 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
62 20 60                       # a638 |   mov [A], C
44 20                          # a63b |   inc A
                               #      | _BZ_loop_5:
58 f8 c8 ff                    # a63d |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _A_call_42:
e0 1c 20                       # a641 |   push 0x20
e0 bc 02                       # a644 |   push SP + 0x2
5c f8 d1 00                    # a647 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a64b |   mov SP, SP + 0x4
                               #      | _Z_call_42:
60 60 ff                       # a64f |   mov C, H
                               #      | _A_if_38:
e8 60 00 f8 0f 00              # a652 |   jeq C, 0, ${_E_if_38}:rel + PC
66 60 00                       # a658 |   bmov [C], 0
44 60                          # a65b |   inc C
58 f8 08 00                    # a65d |   jmp ${_C_if_38}:rel + PC
                               #      | _E_if_38:
60 60 1c ff                    # a661 |   mov C, -1
                               #      | _C_if_38:
                               #      | _Z_if_38:
                               #      | _A_call_50:
e0 a0                          # a665 |   push SP
5c f8 d0 00                    # a667 |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # a66b |   mov SP, SP + 0x2
                               #      | _Z_call_50:
e8 ff 00 f8 9c 00              # a66f |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # a675 |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 00 fb                 # a679 |   mov [${var__g_num_args}], 0
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 60 bc f8 20 7c 00           # a67e |   jge C, SP + 0x20, ${_C_while_7}:rel + PC
                               #      | _A_call_51:
e0 1c 20                       # a685 |   push 0x20
e0 60                          # a688 |   push C
5c f8 8e 00                    # a68a |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a68e |   mov SP, SP + 0x4
                               #      | _Z_call_51:
60 80 ff                       # a692 |   mov D, H
                               #      | _A_if_56:
e8 80 00 f8 0d 00              # a695 |   jeq D, 0, ${_E_if_56}:rel + PC
66 80 00                       # a69b |   bmov [D], 0
58 f8 08 00                    # a69e |   jmp ${_C_if_56}:rel + PC
                               #      | _E_if_56:
60 80 1c fe                    # a6a2 |   mov D, -2
                               #      | _C_if_56:
                               #      | _Z_if_56:
61 20 e0 00 fb                 # a6a6 |   mov A, [${var__g_num_args}]
                               #      | _A_if_57:
f0 20 1c f8 04 17 00           # a6ab |   jlt A, 0x4, ${_E_if_57}:rel + PC
                               #      | _A_call_52:
e0 e0 40 a9                    # a6b2 |   push ${const__data_8}
5c f8 10 fb                    # a6b6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a6ba |   mov SP, SP + 0x2
                               #      | _Z_call_52:
58 f8 47 00                    # a6be |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_57:
                               #      | _C_if_57:
                               #      | _Z_if_57:
                               #      | _A_call_53:
e0 60                          # a6c2 |   push C
5c f8 cd fd                    # a6c4 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a6c8 |   mov SP, SP + 0x2
                               #      | _Z_call_53:
                               #      | _A_if_58:
ec fe 00 f8 18 00              # a6cc |   jne G, 0, ${_E_if_58}:rel + PC
                               #      | _A_call_54:
e0 20                          # a6d2 |   push A
e0 e0 55 a9                    # a6d4 |   push ${const__data_9}
5c f8 6c f9                    # a6d8 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a6dc |   mov SP, SP + 0x4
                               #      | _Z_call_54:
58 f8 25 00                    # a6e0 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_58:
                               #      | _C_if_58:
                               #      | _Z_if_58:
a8 40 20 1c 01                 # a6e4 |   shl B, A, 0x1
62 e8 ff 02 fb                 # a6e9 |   mov [${var__g_args} + B], H
c6 e0 20 00 fb                 # a6ee |   inc [${var__g_num_args}], A
c4 60 80                       # a6f3 |   inc C, D
                               #      | _BZ_while_7:
58 f8 88 ff                    # a6f6 |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
c4 fe 00                       # a6fa |   inc G, 0
61 ff bc 22                    # a6fd |   mov H, [SP + 0x22]
58 f8 0a 00                    # a701 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # a705 |   mov G, 0
60 ff 00                       # a708 |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # a70b |   mov SP, SP + 0x24
e4 20                          # a70f |   pop A
e4 40                          # a711 |   pop B
e4 60                          # a713 |   pop C
e4 80                          # a715 |   pop D
dc                             # a717 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # a718 |   mov H, [SP + 0x2]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 fe ff                       # a71c |   bmov G, [H]
e9 fe bc f8 04 17 00           # a71f |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_37:
ec fe 00 f8 0a 00              # a726 |   jne G, 0, ${_E_if_37}:rel + PC
60 ff 00                       # a72c |   mov H, 0
dc                             # a72f |   ret
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
44 ff                          # a730 |   inc H
                               #      | _BZ_loop_6:
58 f8 ea ff                    # a732 |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _cleanup_fn_strchr:
dc                             # a736 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # a737 |   push A
61 20 bc 04                    # a739 |   mov A, [SP + 0x4]
                               #      | _A_call_43:
e0 e0 13 a9                    # a73d |   push ${const__str__PING}
e0 20                          # a741 |   push A
5c f8 c3 00                    # a743 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a747 |   mov SP, SP + 0x4
                               #      | _Z_call_43:
                               #      | _A_if_42:
ec ff 00 f8 0d 00              # a74b |   jne H, 0, ${_E_if_42}:rel + PC
c4 ff 00                       # a751 |   inc H, 0
58 f8 af 00                    # a754 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_42:
                               #      | _C_if_42:
                               #      | _Z_if_42:
                               #      | _A_call_44:
e0 e0 18 a9                    # a758 |   push ${const__str__READ}
e0 20                          # a75c |   push A
5c f8 a8 00                    # a75e |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a762 |   mov SP, SP + 0x4
                               #      | _Z_call_44:
                               #      | _A_if_44:
ec ff 00 f8 0e 00              # a766 |   jne H, 0, ${_E_if_44}:rel + PC
60 ff 1c 02                    # a76c |   mov H, 0x2
58 f8 93 00                    # a770 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_44:
                               #      | _C_if_44:
                               #      | _Z_if_44:
                               #      | _A_call_45:
e0 e0 1d a9                    # a774 |   push ${const__str__WRITE}
e0 20                          # a778 |   push A
5c f8 8c 00                    # a77a |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a77e |   mov SP, SP + 0x4
                               #      | _Z_call_45:
                               #      | _A_if_46:
ec ff 00 f8 0e 00              # a782 |   jne H, 0, ${_E_if_46}:rel + PC
60 ff 1c 03                    # a788 |   mov H, 0x3
58 f8 77 00                    # a78c |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_46:
                               #      | _C_if_46:
                               #      | _Z_if_46:
                               #      | _A_call_46:
e0 e0 23 a9                    # a790 |   push ${const__str__READB}
e0 20                          # a794 |   push A
5c f8 70 00                    # a796 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a79a |   mov SP, SP + 0x4
                               #      | _Z_call_46:
                               #      | _A_if_48:
ec ff 00 f8 0e 00              # a79e |   jne H, 0, ${_E_if_48}:rel + PC
60 ff 1c 04                    # a7a4 |   mov H, 0x4
58 f8 5b 00                    # a7a8 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_48:
                               #      | _C_if_48:
                               #      | _Z_if_48:
                               #      | _A_call_47:
e0 e0 29 a9                    # a7ac |   push ${const__str__WRITEB}
e0 20                          # a7b0 |   push A
5c f8 54 00                    # a7b2 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a7b6 |   mov SP, SP + 0x4
                               #      | _Z_call_47:
                               #      | _A_if_50:
ec ff 00 f8 0e 00              # a7ba |   jne H, 0, ${_E_if_50}:rel + PC
60 ff 1c 05                    # a7c0 |   mov H, 0x5
58 f8 3f 00                    # a7c4 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_50:
                               #      | _C_if_50:
                               #      | _Z_if_50:
                               #      | _A_call_48:
e0 e0 30 a9                    # a7c8 |   push ${const__str__JMP}
e0 20                          # a7cc |   push A
5c f8 38 00                    # a7ce |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a7d2 |   mov SP, SP + 0x4
                               #      | _Z_call_48:
                               #      | _A_if_52:
ec ff 00 f8 0e 00              # a7d6 |   jne H, 0, ${_E_if_52}:rel + PC
60 ff 1c 06                    # a7dc |   mov H, 0x6
58 f8 23 00                    # a7e0 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_52:
                               #      | _C_if_52:
                               #      | _Z_if_52:
                               #      | _A_call_49:
e0 e0 34 a9                    # a7e4 |   push ${const__str__JMP_PERSIST}
e0 20                          # a7e8 |   push A
5c f8 1c 00                    # a7ea |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a7ee |   mov SP, SP + 0x4
                               #      | _Z_call_49:
                               #      | _A_if_54:
ec ff 00 f8 0e 00              # a7f2 |   jne H, 0, ${_E_if_54}:rel + PC
60 ff 1c 07                    # a7f8 |   mov H, 0x7
58 f8 07 00                    # a7fc |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_54:
                               #      | _C_if_54:
                               #      | _Z_if_54:
60 ff 00                       # a800 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # a803 |   pop A
dc                             # a805 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # a806 |   push A
61 fc bc 04                    # a808 |   mov E, [SP + 0x4]
61 fd bc 06                    # a80c |   mov F, [SP + 0x6]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
65 fe fc                       # a810 |   bmov G, [E]
65 ff fd                       # a813 |   bmov H, [F]
60 20 fe                       # a816 |   mov A, G
30 fe 1c 20                    # a819 |   or G, 0x20
30 ff 1c 20                    # a81d |   or H, 0x20
84 ff fe ff                    # a821 |   sub H, G, H
ec ff 00 f8 14 00              # a825 |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # a82b |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # a831 |   inc E
44 fd                          # a833 |   inc F
                               #      | _BZ_loop_7:
58 f8 db ff                    # a835 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # a839 |   pop A
dc                             # a83b |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # a83c |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # a860 |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # a866 |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # a875 |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # a882 |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_3:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # a892 |   .data str:"$INVALID_DATA\n"
                               #      | const__data_4:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # a8a1 |   .data str:"JMP_TO %x\n"
                               #      | const__data_5:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # a8ac |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__HANDLER_MAP:
0a a0 73 a2 72 a3 73 a2 72 a3 1c a5 1c a5 # a8be |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp]
                               #      | const__data_6:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 32 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 30 0a 52 45 41 44 59 0a 00 # a8cc |   .data str:"Weeekly3006 - Hardware v1.2 - Bootloader v2.0\nREADY\n"
                               #      | const__data_7:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # a901 |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # a913 |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # a918 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # a91d |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # a923 |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # a929 |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # a930 |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # a934 |   .data str:"JMP_PERSIST"
                               #      | const__data_8:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 34 0a 00 # a940 |   .data str:"TOO_MANY_ARGS max=4\n"
                               #      | const__data_9:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # a955 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # a969 |   .data str:"UNKNOWN_COMMAND\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xfb00
                               #      | SECTION_BEGIN_static_data:
                               #      | var__g_num_args:
                               # fb00 |   .bss size:2 align:1
                               #      | var__g_args:
                               # fb02 |   .bss size:10 align:2
                               #      | SECTION_END_static_data:
                               #      | 
