                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 00 ff                 # a000 |   mov SP, 0xff00
                               #      | _A_call_41:
5c f8 1f 03                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_41:
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
e0 e0 5d a6                    # a014 |   push ${const__str__PONG__endl}
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
e0 e0 39 a6                    # a034 |   push ${const__data_1}
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
e8 fe 00 f8 80 00              # a28a |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 02 fb                 # a290 |   mov A, [${var__g_args}]
61 40 e0 04 fb                 # a295 |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_9:
ee bc 1c f8 10 02 3c 00        # a29a |   jne [SP + 0x10], 0x2, ${_E_if_9}:rel + PC
                               #      | _A_while_3:
                               #      | _BA_while_3:
fc 20 40 f8 30 00              # a2a2 |   jge A, B, ${_C_while_3}:rel + PC
61 60 20                       # a2a8 |   mov C, [A]
a0 80 60 1c 08                 # a2ab |   shr D, C, 0x8
28 60 1c 08                    # a2b0 |   shl C, 0x8
                               #      | _A_call_19:
e0 a0                          # a2b4 |   push SP
e0 8c                          # a2b6 |   push D + C
5c f8 30 ff                    # a2b8 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a2bc |   mov SP, SP + 0x4
                               #      | _Z_call_19:
                               #      | _A_call_20:
e0 a0                          # a2c0 |   push SP
5c f8 04 ff                    # a2c2 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a2c6 |   mov SP, SP + 0x2
                               #      | _Z_call_20:
60 20 3c 02                    # a2ca |   mov A, A + 0x2
                               #      | _BZ_while_3:
58 f8 d4 ff                    # a2ce |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
58 f8 2d 00                    # a2d2 |   jmp ${_C_if_9}:rel + PC
                               #      | _E_if_9:
                               #      | _A_while_4:
                               #      | _BA_while_4:
fc 20 40 f8 29 00              # a2d6 |   jge A, B, ${_C_while_4}:rel + PC
61 60 20                       # a2dc |   mov C, [A]
                               #      | _A_call_21:
e0 60                          # a2df |   push C
5c f8 80 fe                    # a2e1 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a2e5 |   mov SP, SP + 0x2
                               #      | _Z_call_21:
20 60 1c 08                    # a2e9 |   shr C, 0x8
                               #      | _A_call_22:
e0 60                          # a2ed |   push C
5c f8 72 fe                    # a2ef |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a2f3 |   mov SP, SP + 0x2
                               #      | _Z_call_22:
60 20 3c 02                    # a2f7 |   mov A, A + 0x2
                               #      | _BZ_while_4:
58 f8 db ff                    # a2fb |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      | _C_if_9:
                               #      | _Z_if_9:
                               #      | _A_call_23:
e0 1c 0a                       # a2ff |   push 0xa
5c f8 5f fe                    # a302 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a306 |   mov SP, SP + 0x2
                               #      | _Z_call_23:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # a30a |   mov SP, SP + 0x6
e4 20                          # a30e |   pop A
e4 40                          # a310 |   pop B
e4 60                          # a312 |   pop C
e4 80                          # a314 |   pop D
dc                             # a316 |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
                               #      | _A_call_24:
e0 e0 63 a6                    # a317 |   push ${const__str__write__endl}
5c f8 ab fe                    # a31b |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a31f |   mov SP, SP + 0x2
                               #      | _Z_call_24:
                               #      | _cleanup_fn_handle_write:
dc                             # a323 |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # a324 |   push B
e0 20                          # a326 |   push A
60 20 e0 fd 00                 # a328 |   mov A, 0xfd
60 40 00                       # a32d |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # a330 |   mmap 0xff00, -1, 0x2
                               #      | _A_call_25:
e0 e0 74 a6                    # a338 |   push ${const__data_2}
5c f8 8a fe                    # a33c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a340 |   mov SP, SP + 0x2
                               #      | _Z_call_25:
c6 e0 00 0a ff                 # a344 |   inc [0xff0a], 0
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_call_39:
5c f8 3e 00                    # a349 |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_39:
60 20 ff                       # a34d |   mov A, H
                               #      | _A_if_43:
ec fe 00 f8 0a 00              # a350 |   jne G, 0, ${_E_if_43}:rel + PC
58 f8 f3 ff                    # a356 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _E_if_43:
                               #      | _C_if_43:
                               #      | _Z_if_43:
                               #      | _A_if_44:
ec 20 00 f8 16 00              # a35a |   jne A, 0, ${_E_if_44}:rel + PC
                               #      | _A_call_40:
e0 e0 01 a7                    # a360 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 62 fe                    # a364 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a368 |   mov SP, SP + 0x2
                               #      | _Z_call_40:
58 f8 dd ff                    # a36c |   jmp ${_BA_loop_2}:rel + PC
                               #      | _E_if_44:
                               #      | _C_if_44:
                               #      | _Z_if_44:
60 40 21                       # a370 |   mov B, A*2
60 40 e8 68 a6                 # a373 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # a378 |   push A
5e 40                          # a37a |   call [B]
e4 20                          # a37c |   pop A
                               #      | _BZ_loop_2:
58 f8 cb ff                    # a37e |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_main:
e4 20                          # a382 |   pop A
e4 40                          # a384 |   pop B
dc                             # a386 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # a387 |   push D
e0 60                          # a389 |   push C
e0 40                          # a38b |   push B
e0 20                          # a38d |   push A
60 a0 bc fe                    # a38f |   mov SP, SP + -2
62 a0 00                       # a393 |   mov [SP], 0
60 a0 bc de                    # a396 |   mov SP, SP + -34
62 a0 00                       # a39a |   mov [SP], 0
60 20 a0                       # a39d |   mov A, SP
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 60 e0 02 ff                 # a3a0 |   mov C, [0xff02]
ac 80 60 e0 00 80              # a3a5 |   and D, C, 0x8000
e8 80 00 f8 f5 ff              # a3ab |   jeq D, 0, ${_BA_loop_3}:rel + PC
2c 60 e0 ff 00                 # a3b1 |   and C, 0xff
62 e0 60 00 ff                 # a3b6 |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # a3bb |   jeq C, 0xa, ${_C_loop_3}:rel + PC
e8 60 1c f8 0d 29 00           # a3c2 |   jeq C, 0xd, ${_C_loop_3}:rel + PC
                               #      | _A_if_13:
f0 20 bc f8 1f 19 00           # a3c9 |   jlt A, SP + 0x1f, ${_E_if_13}:rel + PC
                               #      | _A_call_26:
e0 e0 a9 a6                    # a3d0 |   push ${const__data_3}
5c f8 f2 fd                    # a3d4 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a3d8 |   mov SP, SP + 0x2
                               #      | _Z_call_26:
e8 ff 00 f8 d3 00              # a3dc |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_13:
                               #      | _C_if_13:
                               #      | _Z_if_13:
62 20 60                       # a3e2 |   mov [A], C
44 20                          # a3e5 |   inc A
                               #      | _BZ_loop_3:
58 f8 b9 ff                    # a3e7 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _A_call_27:
e0 1c 20                       # a3eb |   push 0x20
e0 bc 02                       # a3ee |   push SP + 0x2
5c f8 d1 00                    # a3f1 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a3f5 |   mov SP, SP + 0x4
                               #      | _Z_call_27:
60 60 ff                       # a3f9 |   mov C, H
                               #      | _A_if_18:
e8 60 00 f8 0f 00              # a3fc |   jeq C, 0, ${_E_if_18}:rel + PC
66 60 00                       # a402 |   bmov [C], 0
44 60                          # a405 |   inc C
58 f8 08 00                    # a407 |   jmp ${_C_if_18}:rel + PC
                               #      | _E_if_18:
60 60 1c ff                    # a40b |   mov C, -1
                               #      | _C_if_18:
                               #      | _Z_if_18:
                               #      | _A_call_33:
e0 a0                          # a40f |   push SP
5c f8 d0 00                    # a411 |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # a415 |   mov SP, SP + 0x2
                               #      | _Z_call_33:
e8 ff 00 f8 9c 00              # a419 |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # a41f |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 00 fb                 # a423 |   mov [${var__g_num_args}], 0
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 60 bc f8 20 7c 00           # a428 |   jge C, SP + 0x20, ${_C_while_5}:rel + PC
                               #      | _A_call_34:
e0 1c 20                       # a42f |   push 0x20
e0 60                          # a432 |   push C
5c f8 8e 00                    # a434 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a438 |   mov SP, SP + 0x4
                               #      | _Z_call_34:
60 80 ff                       # a43c |   mov D, H
                               #      | _A_if_32:
e8 80 00 f8 0d 00              # a43f |   jeq D, 0, ${_E_if_32}:rel + PC
66 80 00                       # a445 |   bmov [D], 0
58 f8 08 00                    # a448 |   jmp ${_C_if_32}:rel + PC
                               #      | _E_if_32:
60 80 1c fe                    # a44c |   mov D, -2
                               #      | _C_if_32:
                               #      | _Z_if_32:
61 20 e0 00 fb                 # a450 |   mov A, [${var__g_num_args}]
                               #      | _A_if_33:
f0 20 1c f8 04 17 00           # a455 |   jlt A, 0x4, ${_E_if_33}:rel + PC
                               #      | _A_call_35:
e0 e0 d8 a6                    # a45c |   push ${const__data_4}
5c f8 66 fd                    # a460 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a464 |   mov SP, SP + 0x2
                               #      | _Z_call_35:
58 f8 47 00                    # a468 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _A_call_37:
e0 60                          # a46c |   push C
5c f8 40 01                    # a46e |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a472 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
                               #      | _A_if_42:
ec fe 00 f8 18 00              # a476 |   jne G, 0, ${_E_if_42}:rel + PC
                               #      | _A_call_38:
e0 20                          # a47c |   push A
e0 e0 ed a6                    # a47e |   push ${const__data_5}
5c f8 c2 fb                    # a482 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a486 |   mov SP, SP + 0x4
                               #      | _Z_call_38:
58 f8 25 00                    # a48a |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_42:
                               #      | _C_if_42:
                               #      | _Z_if_42:
a8 40 20 1c 01                 # a48e |   shl B, A, 0x1
62 e8 ff 02 fb                 # a493 |   mov [${var__g_args} + B], H
c6 e0 20 00 fb                 # a498 |   inc [${var__g_num_args}], A
c4 60 80                       # a49d |   inc C, D
                               #      | _BZ_while_5:
58 f8 88 ff                    # a4a0 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
c4 fe 00                       # a4a4 |   inc G, 0
61 ff bc 22                    # a4a7 |   mov H, [SP + 0x22]
58 f8 0a 00                    # a4ab |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # a4af |   mov G, 0
60 ff 00                       # a4b2 |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # a4b5 |   mov SP, SP + 0x24
e4 20                          # a4b9 |   pop A
e4 40                          # a4bb |   pop B
e4 60                          # a4bd |   pop C
e4 80                          # a4bf |   pop D
dc                             # a4c1 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # a4c2 |   mov H, [SP + 0x2]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
65 fe ff                       # a4c6 |   bmov G, [H]
e9 fe bc f8 04 17 00           # a4c9 |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_17:
ec fe 00 f8 0a 00              # a4d0 |   jne G, 0, ${_E_if_17}:rel + PC
60 ff 00                       # a4d6 |   mov H, 0
dc                             # a4d9 |   ret
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
44 ff                          # a4da |   inc H
                               #      | _BZ_loop_4:
58 f8 ea ff                    # a4dc |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_strchr:
dc                             # a4e0 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # a4e1 |   push A
61 20 bc 04                    # a4e3 |   mov A, [SP + 0x4]
                               #      | _A_call_28:
e0 e0 bb a6                    # a4e7 |   push ${const__str__PING}
e0 20                          # a4eb |   push A
5c f8 8b 00                    # a4ed |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a4f1 |   mov SP, SP + 0x4
                               #      | _Z_call_28:
                               #      | _A_if_22:
ec ff 00 f8 0d 00              # a4f5 |   jne H, 0, ${_E_if_22}:rel + PC
c4 ff 00                       # a4fb |   inc H, 0
58 f8 77 00                    # a4fe |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _A_call_29:
e0 e0 c0 a6                    # a502 |   push ${const__str__READ}
e0 20                          # a506 |   push A
5c f8 70 00                    # a508 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a50c |   mov SP, SP + 0x4
                               #      | _Z_call_29:
                               #      | _A_if_24:
ec ff 00 f8 0e 00              # a510 |   jne H, 0, ${_E_if_24}:rel + PC
60 ff 1c 02                    # a516 |   mov H, 0x2
58 f8 5b 00                    # a51a |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
                               #      | _A_call_30:
e0 e0 c5 a6                    # a51e |   push ${const__str__WRITE}
e0 20                          # a522 |   push A
5c f8 54 00                    # a524 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a528 |   mov SP, SP + 0x4
                               #      | _Z_call_30:
                               #      | _A_if_26:
ec ff 00 f8 0e 00              # a52c |   jne H, 0, ${_E_if_26}:rel + PC
60 ff 1c 03                    # a532 |   mov H, 0x3
58 f8 3f 00                    # a536 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _A_call_31:
e0 e0 cb a6                    # a53a |   push ${const__str__READB}
e0 20                          # a53e |   push A
5c f8 38 00                    # a540 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a544 |   mov SP, SP + 0x4
                               #      | _Z_call_31:
                               #      | _A_if_28:
ec ff 00 f8 0e 00              # a548 |   jne H, 0, ${_E_if_28}:rel + PC
60 ff 1c 04                    # a54e |   mov H, 0x4
58 f8 23 00                    # a552 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_28:
                               #      | _C_if_28:
                               #      | _Z_if_28:
                               #      | _A_call_32:
e0 e0 d1 a6                    # a556 |   push ${const__str__WRITEB}
e0 20                          # a55a |   push A
5c f8 1c 00                    # a55c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a560 |   mov SP, SP + 0x4
                               #      | _Z_call_32:
                               #      | _A_if_30:
ec ff 00 f8 0e 00              # a564 |   jne H, 0, ${_E_if_30}:rel + PC
60 ff 1c 05                    # a56a |   mov H, 0x5
58 f8 07 00                    # a56e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
60 ff 00                       # a572 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # a575 |   pop A
dc                             # a577 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # a578 |   push A
61 fc bc 04                    # a57a |   mov E, [SP + 0x4]
61 fd bc 06                    # a57e |   mov F, [SP + 0x6]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
65 fe fc                       # a582 |   bmov G, [E]
65 ff fd                       # a585 |   bmov H, [F]
60 20 fe                       # a588 |   mov A, G
30 fe 1c 20                    # a58b |   or G, 0x20
30 ff 1c 20                    # a58f |   or H, 0x20
84 ff fe ff                    # a593 |   sub H, G, H
ec ff 00 f8 14 00              # a597 |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # a59d |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # a5a3 |   inc E
44 fd                          # a5a5 |   inc F
                               #      | _BZ_loop_5:
58 f8 db ff                    # a5a7 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # a5ab |   pop A
dc                             # a5ad |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # a5ae |   push B
e0 20                          # a5b0 |   push A
60 20 00                       # a5b2 |   mov A, 0
61 40 bc 06                    # a5b5 |   mov B, [SP + 0x6]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 ff 40                       # a5b9 |   bmov H, [B]
e8 ff 00 f8 23 00              # a5bc |   jeq H, 0, ${_C_loop_6}:rel + PC
                               #      | _A_call_36:
e0 ff                          # a5c2 |   push H
5c f8 3a 00                    # a5c4 |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # a5c8 |   mov SP, SP + 0x2
                               #      | _Z_call_36:
e8 fe 00 f8 2d 00              # a5cc |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # a5d2 |   shl A, 0x4
00 20 ff                       # a5d6 |   add A, H
44 40                          # a5d9 |   inc B
                               #      | _BZ_loop_6:
58 f8 de ff                    # a5db |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
60 fe 00                       # a5df |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # a5e2 |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # a5e6 |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # a5ec |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # a5f3 |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # a5f6 |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # a5f9 |   pop A
e4 40                          # a5fb |   pop B
dc                             # a5fd |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # a5fe |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # a604 |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # a60b |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # a612 |   sub H, G, 0x30
c4 fe 00                       # a617 |   inc G, 0
dc                             # a61a |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # a61b |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # a622 |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # a629 |   add H, G, -87
c4 fe 00                       # a62e |   inc G, 0
dc                             # a631 |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # a632 |   mov H, 0
60 fe 00                       # a635 |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # a638 |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # a639 |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # a65d |   .data str:"PONG\n"
                               #      | const__str__write__endl:
77 72 69 74 65 0a 00           # a663 |   .data str:"write\n"
                               #      | const__HANDLER_MAP:
0a a0 73 a2 17 a3 73 a2 17 a3  # a66a |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write]
                               #      | const__data_2:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 32 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 30 0a 52 45 41 44 59 0a 00 # a674 |   .data str:"Weeekly3006 - Hardware v1.2 - Bootloader v2.0\nREADY\n"
                               #      | const__data_3:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # a6a9 |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # a6bb |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # a6c0 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # a6c5 |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # a6cb |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # a6d1 |   .data str:"WRITEB"
                               #      | const__data_4:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 34 0a 00 # a6d8 |   .data str:"TOO_MANY_ARGS max=4\n"
                               #      | const__data_5:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # a6ed |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # a701 |   .data str:"UNKNOWN_COMMAND\n"
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
