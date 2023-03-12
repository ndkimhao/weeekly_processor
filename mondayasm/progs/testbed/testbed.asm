                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_25:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_25:
d8                             # a009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 80                          # a00a |   push D
e0 60                          # a00c |   push C
e0 40                          # a00e |   push B
e0 20                          # a010 |   push A
                               #      | _A_call_2:
e0 fc                          # a012 |   push E
e0 e0 f2 a3                    # a014 |   push ${const__str__Testbed__endl}
5c f8 7c 01                    # a018 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01c |   mov SP, SP + 0x2
e4 fc                          # a020 |   pop E
                               #      | _Z_call_2:
                               #      | _A_call_3:
e0 fc                          # a022 |   push E
e0 00                          # a024 |   push 0
e0 00                          # a026 |   push 0
5c f8 a6 01                    # a028 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a02c |   mov SP, SP + 0x4
e4 fc                          # a030 |   pop E
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 fc                          # a032 |   push E
5c f8 bc 01                    # a034 |   call ${fn_reset_color_palette}:rel + PC
e4 fc                          # a038 |   pop E
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 fc                          # a03a |   push E
e0 00                          # a03c |   push 0
e0 e0 8c 00                    # a03e |   push 0x8c
e0 e0 ff 00                    # a042 |   push 0xff
e0 1c 01                       # a046 |   push 0x1
5c f8 07 02                    # a049 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # a04d |   mov SP, SP + 0x8
e4 fc                          # a051 |   pop E
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 fc                          # a053 |   push E
e0 1c 06                       # a055 |   push 0x6
e0 00                          # a058 |   push 0
5c f8 74 01                    # a05a |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a05e |   mov SP, SP + 0x4
e4 fc                          # a062 |   pop E
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 fc                          # a064 |   push E
e0 e0 0f 0f                    # a066 |   push 0xf0f
e0 00                          # a06a |   push 0
5c f8 05 02                    # a06c |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a070 |   mov SP, SP + 0x4
e4 fc                          # a074 |   pop E
                               #      | _Z_call_8:
                               #      | _A_call_9:
e0 fc                          # a076 |   push E
e0 1c ff                       # a078 |   push -1
e0 1c 01                       # a07b |   push 0x1
5c f8 f3 01                    # a07e |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a082 |   mov SP, SP + 0x4
e4 fc                          # a086 |   pop E
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 fc                          # a088 |   push E
e0 e0 aa aa                    # a08a |   push 0xaaaa
e0 1c 02                       # a08e |   push 0x2
5c f8 e0 01                    # a091 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a095 |   mov SP, SP + 0x4
e4 fc                          # a099 |   pop E
                               #      | _Z_call_10:
                               #      | _A_call_11:
e0 fc                          # a09b |   push E
e0 1c 05                       # a09d |   push 0x5
e0 1c 02                       # a0a0 |   push 0x2
5c f8 2b 01                    # a0a3 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0a7 |   mov SP, SP + 0x4
e4 fc                          # a0ab |   pop E
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 fc                          # a0ad |   push E
e0 e0 0f 0f                    # a0af |   push 0xf0f
e0 00                          # a0b3 |   push 0
5c f8 bc 01                    # a0b5 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0b9 |   mov SP, SP + 0x4
e4 fc                          # a0bd |   pop E
                               #      | _Z_call_12:
                               #      | _A_call_13:
e0 fc                          # a0bf |   push E
e0 1c ff                       # a0c1 |   push -1
e0 1c 01                       # a0c4 |   push 0x1
5c f8 aa 01                    # a0c7 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0cb |   mov SP, SP + 0x4
e4 fc                          # a0cf |   pop E
                               #      | _Z_call_13:
                               #      | _A_call_14:
e0 fc                          # a0d1 |   push E
e0 e0 aa aa                    # a0d3 |   push 0xaaaa
e0 1c 02                       # a0d7 |   push 0x2
5c f8 97 01                    # a0da |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0de |   mov SP, SP + 0x4
e4 fc                          # a0e2 |   pop E
                               #      | _Z_call_14:
                               #      | _A_for_4:
60 20 00                       # a0e4 |   mov A, 0
                               #      | _BA_for_4:
                               #      | _A_call_17:
e0 fc                          # a0e7 |   push E
5c f8 af 01                    # a0e9 |   call ${fn_gen_font}:rel + PC
e4 fc                          # a0ed |   pop E
                               #      | _Z_call_17:
                               #      | _A_if_7:
ec 20 00 f8 1c 00              # a0ef |   jne A, 0, ${_E_if_7}:rel + PC
                               #      | _A_call_18:
e0 fc                          # a0f5 |   push E
e0 1c 0f                       # a0f7 |   push 0xf
e0 1c 05                       # a0fa |   push 0x5
5c f8 d1 00                    # a0fd |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a101 |   mov SP, SP + 0x4
e4 fc                          # a105 |   pop E
                               #      | _Z_call_18:
58 f8 16 00                    # a107 |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
                               #      | _A_call_19:
e0 fc                          # a10b |   push E
e0 1c 0c                       # a10d |   push 0xc
e0 1c 05                       # a110 |   push 0x5
5c f8 bb 00                    # a113 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a117 |   mov SP, SP + 0x4
e4 fc                          # a11b |   pop E
                               #      | _Z_call_19:
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _A_call_20:
e0 fc                          # a11d |   push E
e0 e0 0f 0f                    # a11f |   push 0xf0f
e0 00                          # a123 |   push 0
5c f8 4c 01                    # a125 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a129 |   mov SP, SP + 0x4
e4 fc                          # a12d |   pop E
                               #      | _Z_call_20:
                               #      | _A_call_21:
e0 fc                          # a12f |   push E
e0 e0 a0 a0                    # a131 |   push 0xa0a0
e0 1c 01                       # a135 |   push 0x1
5c f8 39 01                    # a138 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a13c |   mov SP, SP + 0x4
e4 fc                          # a140 |   pop E
                               #      | _Z_call_21:
                               #      | _A_call_22:
e0 fc                          # a142 |   push E
e0 e0 cc cc                    # a144 |   push 0xcccc
e0 1c 02                       # a148 |   push 0x2
5c f8 26 01                    # a14b |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a14f |   mov SP, SP + 0x4
e4 fc                          # a153 |   pop E
                               #      | _Z_call_22:
                               #      | _A_call_23:
e0 fc                          # a155 |   push E
e0 e0 aa aa                    # a157 |   push 0xaaaa
e0 1c 03                       # a15b |   push 0x3
5c f8 13 01                    # a15e |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a162 |   mov SP, SP + 0x4
e4 fc                          # a166 |   pop E
                               #      | _Z_call_23:
62 e0 00 00 a9                 # a168 |   mov [${var__test_loop_target_v}], 0
                               #      | _A_call_24:
e0 fc                          # a16d |   push E
e0 00                          # a16f |   push 0
e0 e0 00 87                    # a171 |   push 0x8700
e0 e0 93 03                    # a175 |   push 0x393
e0 00                          # a179 |   push 0
5c f8 dc 01                    # a17b |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # a17f |   mov SP, SP + 0x8
e4 fc                          # a183 |   pop E
                               #      | _Z_call_24:
                               #      | _BZ_for_4:
3c 20                          # a185 |   not A
58 f8 60 ff                    # a187 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_main:
e4 20                          # a18b |   pop A
e4 40                          # a18d |   pop B
e4 60                          # a18f |   pop C
e4 80                          # a191 |   pop D
dc                             # a193 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a194 |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a196 |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a19a |   bmov H, [A]
e8 ff 00 f8 16 00              # a19d |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a1a3 |   push H
5c f8 11 00                    # a1a5 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a1a9 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a1ad |   inc A
58 f8 eb ff                    # a1af |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a1b3 |   pop A
dc                             # a1b5 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a1b6 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a1bd |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a1c3 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a1c7 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a1cd |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # a1ce |   push B
e0 20                          # a1d0 |   push A
61 20 bc 08                    # a1d2 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # a1d6 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # a1db |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 00 a4 ff a8 01     # a1e2 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # a1eb |   pop A
e4 40                          # a1ed |   pop B
dc                             # a1ef |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_reset_color_palette:
                               #      | _begin_fn_reset_color_palette:
e0 80                          # a1f0 |   push D
e0 60                          # a1f2 |   push C
e0 40                          # a1f4 |   push B
e0 20                          # a1f6 |   push A
                               #      | _A_for_2:
60 20 00                       # a1f8 |   mov A, 0
                               #      | _BA_for_2:
fc 20 1c f8 08 4c 00           # a1fb |   jge A, 0x8, ${_C_for_2}:rel + PC
98 40 20 1c 02                 # a202 |   getb B, A, 0x2
                               #      | _A_if_3:
e8 40 00 f8 0b 00              # a207 |   jeq B, 0, ${_E_if_3}:rel + PC
60 40 e0 ff 00                 # a20d |   mov B, 0xff
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
98 60 20 1c 01                 # a212 |   getb C, A, 0x1
                               #      | _A_if_4:
e8 60 00 f8 0b 00              # a217 |   jeq C, 0, ${_E_if_4}:rel + PC
60 60 e0 ff 00                 # a21d |   mov C, 0xff
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
98 80 20 00                    # a222 |   getb D, A, 0
                               #      | _A_if_5:
e8 80 00 f8 0b 00              # a226 |   jeq D, 0, ${_E_if_5}:rel + PC
60 80 e0 ff 00                 # a22c |   mov D, 0xff
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _A_call_4:
e0 80                          # a231 |   push D
e0 60                          # a233 |   push C
e0 40                          # a235 |   push B
e0 20                          # a237 |   push A
5c f8 17 00                    # a239 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # a23d |   mov SP, SP + 0x8
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # a241 |   inc A
58 f8 b8 ff                    # a243 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_reset_color_palette:
e4 20                          # a247 |   pop A
e4 40                          # a249 |   pop B
e4 60                          # a24b |   pop C
e4 80                          # a24d |   pop D
dc                             # a24f |   ret
                               #      | _end_fn_reset_color_palette:
                               #      | 
                               #      | fn_set_color_palette:
                               #      | _begin_fn_set_color_palette:
e0 20                          # a250 |   push A
ad 20 bc 1c 04 07              # a252 |   and A, [SP + 0x4], 0x7
28 20 1c 01                    # a258 |   shl A, 0x1
63 e4 bc 00 a4 0a              # a25c |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc 10 a4 08              # a262 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc 20 a4 06              # a268 |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
                               #      | _cleanup_fn_set_color_palette:
e4 20                          # a26e |   pop A
dc                             # a270 |   ret
                               #      | _end_fn_set_color_palette:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # a271 |   push A
61 fe bc 06                    # a273 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # a277 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_3:
60 20 e4 00 a4                 # a27d |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_3:
fc 20 e0 f8 00 a9 13 00        # a282 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_3}:rel + PC
62 20 fe                       # a28a |   mov [A], G
                               #      | _BZ_for_3:
60 20 3c 50                    # a28d |   mov A, A + 0x50
58 f8 f1 ff                    # a291 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # a295 |   pop A
dc                             # a297 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_gen_font:
                               #      | _begin_fn_gen_font:
e0 80                          # a298 |   push D
e0 60                          # a29a |   push C
e0 40                          # a29c |   push B
e0 20                          # a29e |   push A
60 a0 bc e0                    # a2a0 |   mov SP, SP + -32
60 60 1c 20                    # a2a4 |   mov C, 0x20
                               #      | _A_for_5:
60 20 00                       # a2a8 |   mov A, 0
                               #      | _BA_for_5:
fc 20 1c f8 06 70 00           # a2ab |   jge A, 0x6, ${_C_for_5}:rel + PC
                               #      | _A_if_6:
f2 e0 1c f8 02 a9 07 0e 00     # a2b2 |   jlt [${var__var_1}], 0x7, ${_E_if_6}:rel + PC
62 e0 00 02 a9                 # a2bb |   mov [${var__var_1}], 0
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
46 e0 02 a9                    # a2c0 |   inc [${var__var_1}]
81 fc e0 1c 02 a9 08           # a2c4 |   add E, [${var__var_1}], 0x8
                               #      | _A_call_15:
e0 fc                          # a2cb |   push E
e0 fc                          # a2cd |   push E
e0 3c 01                       # a2cf |   push A + 0x1
5c f8 fc fe                    # a2d2 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a2d6 |   mov SP, SP + 0x4
e4 fc                          # a2da |   pop E
                               #      | _Z_call_15:
                               #      | _A_for_6:
60 40 00                       # a2dc |   mov B, 0
                               #      | _BA_for_6:
fc 40 1c f8 10 36 00           # a2df |   jge B, 0x10, ${_C_for_6}:rel + PC
                               #      | _A_syscall_1:
e0 fc                          # a2e6 |   push E
e0 60                          # a2e8 |   push C
e0 bc 04                       # a2ea |   push SP + 0x4
60 ff 1c 13                    # a2ed |   mov H, 0x13
5e e0 1e ff                    # a2f1 |   call [0xff1e]
60 a0 bc 04                    # a2f5 |   mov SP, SP + 0x4
e4 fc                          # a2f9 |   pop E
                               #      | _Z_syscall_1:
                               #      | _A_call_16:
e0 fc                          # a2fb |   push E
e0 bc 02                       # a2fd |   push SP + 0x2
e0 5c 0a                       # a300 |   push B + 0xa
5c f8 25 00                    # a303 |   call ${fn_fill_cell_content}:rel + PC
60 a0 bc 04                    # a307 |   mov SP, SP + 0x4
e4 fc                          # a30b |   pop E
                               #      | _Z_call_16:
44 60                          # a30d |   inc C
                               #      | _BZ_for_6:
44 40                          # a30f |   inc B
58 f8 ce ff                    # a311 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _BZ_for_5:
44 20                          # a315 |   inc A
58 f8 94 ff                    # a317 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_gen_font:
60 a0 bc 20                    # a31b |   mov SP, SP + 0x20
e4 20                          # a31f |   pop A
e4 40                          # a321 |   pop B
e4 60                          # a323 |   pop C
e4 80                          # a325 |   pop D
dc                             # a327 |   ret
                               #      | _end_fn_gen_font:
                               #      | 
                               #      | fn_fill_cell_content:
                               #      | _begin_fn_fill_cell_content:
e0 40                          # a328 |   push B
e0 20                          # a32a |   push A
a9 20 bc 1c 06 01              # a32c |   shl A, [SP + 0x6], 0x1
61 40 bc 08                    # a332 |   mov B, [SP + 0x8]
                               #      | _A_for_7:
60 20 e4 00 a4                 # a336 |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_7:
fc 20 e0 f8 00 a9 17 00        # a33b |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_7}:rel + PC
63 20 40                       # a343 |   mov [A], [B]
                               #      | _BZ_for_7:
60 20 3c 50                    # a346 |   mov A, A + 0x50
60 40 5c 02                    # a34a |   mov B, B + 0x2
58 f8 ed ff                    # a34e |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_fill_cell_content:
e4 20                          # a352 |   pop A
e4 40                          # a354 |   pop B
dc                             # a356 |   ret
                               #      | _end_fn_fill_cell_content:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # a357 |   push D
e0 60                          # a359 |   push C
e0 40                          # a35b |   push B
e0 20                          # a35d |   push A
61 40 e0 10 ff                 # a35f |   mov B, [0xff10]
61 60 e0 12 ff                 # a364 |   mov C, [0xff12]
61 80 e0 14 ff                 # a369 |   mov D, [0xff14]
61 20 bc 0e                    # a36e |   mov A, [SP + 0xe]
60 ff 00                       # a372 |   mov H, 0
                               #      | _A_if_8:
fc 28 20 f8 09 00              # a375 |   jge A + B, A, ${_E_if_8}:rel + PC
c4 ff 00                       # a37b |   inc H, 0
                               #      | _E_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
60 40 44                       # a37e |   mov B, B + A
81 20 bc ff 0c                 # a381 |   add A, [SP + 0xc], H
60 ff 00                       # a386 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # a389 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # a38f |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # a395 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # a399 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # a39c |   mov C, C + A
81 20 bc ff 0a                 # a39f |   add A, [SP + 0xa], H
60 80 84                       # a3a4 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # a3a7 |   mov A, [SP + 0x10]
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 14 ff                 # a3ab |   mov H, [0xff14]
                               #      | _A_if_11:
f4 ff 80 f8 0a 00              # a3b0 |   jle H, D, ${_E_if_11}:rel + PC
58 f8 33 00                    # a3b6 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_11:
ec ff 80 f8 2b 00              # a3ba |   jne H, D, ${_E2_if_11}:rel + PC
61 ff e0 12 ff                 # a3c0 |   mov H, [0xff12]
                               #      | _A_if_12:
f4 ff 60 f8 0a 00              # a3c5 |   jle H, C, ${_E_if_12}:rel + PC
58 f8 1e 00                    # a3cb |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_12:
ec ff 60 f8 16 00              # a3cf |   jne H, C, ${_E2_if_12}:rel + PC
fa e0 40 f8 10 ff 14 00        # a3d5 |   jgt [0xff10], B, ${_C_loop_2}:rel + PC
                               #      | _A_if_14:
e8 20 00 f8 08 00              # a3dd |   jeq A, 0, ${_E_if_14}:rel + PC
5c 20                          # a3e3 |   call A
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
                               #      | _E2_if_12:
                               #      | _C_if_12:
                               #      | _Z_if_12:
                               #      | _E2_if_11:
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _BZ_loop_2:
58 f8 c6 ff                    # a3e5 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # a3e9 |   pop A
e4 40                          # a3eb |   pop B
e4 60                          # a3ed |   pop C
e4 80                          # a3ef |   pop D
dc                             # a3f1 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__str__Testbed__endl:
54 65 73 74 62 65 64 0a 00     # a3f2 |   .data str:"Testbed\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa3fb
                               #      | SECTION_BEGIN_static_data:
                               # a3fb |   .align dummy_size:5 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # a400 |   .bss size:1280 align:16
                               #      | var__test_loop_target_v:
                               # a900 |   .bss size:2 align:1
                               #      | var__var_1:
                               # a902 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
