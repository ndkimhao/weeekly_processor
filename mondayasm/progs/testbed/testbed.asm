                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_27:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_27:
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
e0 e0 17 a4                    # a014 |   push ${const__str__Testbed__endl}
5c f8 a1 01                    # a018 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01c |   mov SP, SP + 0x2
e4 fc                          # a020 |   pop E
                               #      | _Z_call_2:
                               #      | _A_call_3:
e0 fc                          # a022 |   push E
e0 00                          # a024 |   push 0
e0 00                          # a026 |   push 0
5c f8 cb 01                    # a028 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a02c |   mov SP, SP + 0x4
e4 fc                          # a030 |   pop E
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 fc                          # a032 |   push E
5c f8 e1 01                    # a034 |   call ${fn_reset_color_palette}:rel + PC
e4 fc                          # a038 |   pop E
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 fc                          # a03a |   push E
e0 00                          # a03c |   push 0
e0 e0 8c 00                    # a03e |   push 0x8c
e0 e0 ff 00                    # a042 |   push 0xff
e0 1c 01                       # a046 |   push 0x1
5c f8 2c 02                    # a049 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # a04d |   mov SP, SP + 0x8
e4 fc                          # a051 |   pop E
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 fc                          # a053 |   push E
e0 1c 06                       # a055 |   push 0x6
e0 00                          # a058 |   push 0
5c f8 99 01                    # a05a |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a05e |   mov SP, SP + 0x4
e4 fc                          # a062 |   pop E
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 fc                          # a064 |   push E
e0 e0 0f 0f                    # a066 |   push 0xf0f
e0 00                          # a06a |   push 0
5c f8 2a 02                    # a06c |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a070 |   mov SP, SP + 0x4
e4 fc                          # a074 |   pop E
                               #      | _Z_call_8:
                               #      | _A_call_9:
e0 fc                          # a076 |   push E
e0 1c ff                       # a078 |   push -1
e0 1c 01                       # a07b |   push 0x1
5c f8 18 02                    # a07e |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a082 |   mov SP, SP + 0x4
e4 fc                          # a086 |   pop E
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 fc                          # a088 |   push E
e0 e0 aa aa                    # a08a |   push 0xaaaa
e0 1c 02                       # a08e |   push 0x2
5c f8 05 02                    # a091 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a095 |   mov SP, SP + 0x4
e4 fc                          # a099 |   pop E
                               #      | _Z_call_10:
                               #      | _A_call_11:
e0 fc                          # a09b |   push E
e0 1c 05                       # a09d |   push 0x5
e0 1c 02                       # a0a0 |   push 0x2
5c f8 50 01                    # a0a3 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0a7 |   mov SP, SP + 0x4
e4 fc                          # a0ab |   pop E
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 fc                          # a0ad |   push E
e0 e0 0f 0f                    # a0af |   push 0xf0f
e0 00                          # a0b3 |   push 0
5c f8 e1 01                    # a0b5 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0b9 |   mov SP, SP + 0x4
e4 fc                          # a0bd |   pop E
                               #      | _Z_call_12:
                               #      | _A_call_13:
e0 fc                          # a0bf |   push E
e0 1c ff                       # a0c1 |   push -1
e0 1c 01                       # a0c4 |   push 0x1
5c f8 cf 01                    # a0c7 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0cb |   mov SP, SP + 0x4
e4 fc                          # a0cf |   pop E
                               #      | _Z_call_13:
                               #      | _A_call_14:
e0 fc                          # a0d1 |   push E
e0 e0 aa aa                    # a0d3 |   push 0xaaaa
e0 1c 02                       # a0d7 |   push 0x2
5c f8 bc 01                    # a0da |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0de |   mov SP, SP + 0x4
e4 fc                          # a0e2 |   pop E
                               #      | _Z_call_14:
                               #      | _A_call_15:
e0 fc                          # a0e4 |   push E
e0 1c 07                       # a0e6 |   push 0x7
e0 1c 07                       # a0e9 |   push 0x7
5c f8 07 01                    # a0ec |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0f0 |   mov SP, SP + 0x4
e4 fc                          # a0f4 |   pop E
                               #      | _Z_call_15:
                               #      | _A_call_16:
e0 fc                          # a0f6 |   push E
e0 e0 00 ff                    # a0f8 |   push 0xff00
e0 1c 01                       # a0fc |   push 0x1
5c f8 97 01                    # a0ff |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a103 |   mov SP, SP + 0x4
e4 fc                          # a107 |   pop E
                               #      | _Z_call_16:
                               #      | _A_for_4:
60 20 00                       # a109 |   mov A, 0
                               #      | _BA_for_4:
                               #      | _A_call_19:
e0 fc                          # a10c |   push E
5c f8 af 01                    # a10e |   call ${fn_gen_font}:rel + PC
e4 fc                          # a112 |   pop E
                               #      | _Z_call_19:
                               #      | _A_if_7:
ec 20 00 f8 1c 00              # a114 |   jne A, 0, ${_E_if_7}:rel + PC
                               #      | _A_call_20:
e0 fc                          # a11a |   push E
e0 1c 0f                       # a11c |   push 0xf
e0 1c 05                       # a11f |   push 0x5
5c f8 d1 00                    # a122 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a126 |   mov SP, SP + 0x4
e4 fc                          # a12a |   pop E
                               #      | _Z_call_20:
58 f8 16 00                    # a12c |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
                               #      | _A_call_21:
e0 fc                          # a130 |   push E
e0 1c 0c                       # a132 |   push 0xc
e0 1c 05                       # a135 |   push 0x5
5c f8 bb 00                    # a138 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a13c |   mov SP, SP + 0x4
e4 fc                          # a140 |   pop E
                               #      | _Z_call_21:
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _A_call_22:
e0 fc                          # a142 |   push E
e0 e0 0f 0f                    # a144 |   push 0xf0f
e0 00                          # a148 |   push 0
5c f8 4c 01                    # a14a |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a14e |   mov SP, SP + 0x4
e4 fc                          # a152 |   pop E
                               #      | _Z_call_22:
                               #      | _A_call_23:
e0 fc                          # a154 |   push E
e0 e0 a0 a0                    # a156 |   push 0xa0a0
e0 1c 01                       # a15a |   push 0x1
5c f8 39 01                    # a15d |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a161 |   mov SP, SP + 0x4
e4 fc                          # a165 |   pop E
                               #      | _Z_call_23:
                               #      | _A_call_24:
e0 fc                          # a167 |   push E
e0 e0 cc cc                    # a169 |   push 0xcccc
e0 1c 02                       # a16d |   push 0x2
5c f8 26 01                    # a170 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a174 |   mov SP, SP + 0x4
e4 fc                          # a178 |   pop E
                               #      | _Z_call_24:
                               #      | _A_call_25:
e0 fc                          # a17a |   push E
e0 e0 aa aa                    # a17c |   push 0xaaaa
e0 1c 03                       # a180 |   push 0x3
5c f8 13 01                    # a183 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a187 |   mov SP, SP + 0x4
e4 fc                          # a18b |   pop E
                               #      | _Z_call_25:
62 e0 00 20 a9                 # a18d |   mov [${var__test_loop_target_v}], 0
                               #      | _A_call_26:
e0 fc                          # a192 |   push E
e0 00                          # a194 |   push 0
e0 e0 00 87                    # a196 |   push 0x8700
e0 e0 93 03                    # a19a |   push 0x393
e0 00                          # a19e |   push 0
5c f8 dc 01                    # a1a0 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # a1a4 |   mov SP, SP + 0x8
e4 fc                          # a1a8 |   pop E
                               #      | _Z_call_26:
                               #      | _BZ_for_4:
3c 20                          # a1aa |   not A
58 f8 60 ff                    # a1ac |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_main:
e4 20                          # a1b0 |   pop A
e4 40                          # a1b2 |   pop B
e4 60                          # a1b4 |   pop C
e4 80                          # a1b6 |   pop D
dc                             # a1b8 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a1b9 |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a1bb |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a1bf |   bmov H, [A]
e8 ff 00 f8 16 00              # a1c2 |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a1c8 |   push H
5c f8 11 00                    # a1ca |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a1ce |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a1d2 |   inc A
58 f8 eb ff                    # a1d4 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a1d8 |   pop A
dc                             # a1da |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a1db |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a1e2 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a1e8 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a1ec |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a1f2 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # a1f3 |   push B
e0 20                          # a1f5 |   push A
61 20 bc 08                    # a1f7 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # a1fb |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # a200 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 20 a4 1f a9 01     # a207 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # a210 |   pop A
e4 40                          # a212 |   pop B
dc                             # a214 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_reset_color_palette:
                               #      | _begin_fn_reset_color_palette:
e0 80                          # a215 |   push D
e0 60                          # a217 |   push C
e0 40                          # a219 |   push B
e0 20                          # a21b |   push A
                               #      | _A_for_2:
60 20 00                       # a21d |   mov A, 0
                               #      | _BA_for_2:
fc 20 1c f8 08 4c 00           # a220 |   jge A, 0x8, ${_C_for_2}:rel + PC
98 40 20 1c 02                 # a227 |   getb B, A, 0x2
                               #      | _A_if_3:
e8 40 00 f8 0b 00              # a22c |   jeq B, 0, ${_E_if_3}:rel + PC
60 40 e0 ff 00                 # a232 |   mov B, 0xff
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
98 60 20 1c 01                 # a237 |   getb C, A, 0x1
                               #      | _A_if_4:
e8 60 00 f8 0b 00              # a23c |   jeq C, 0, ${_E_if_4}:rel + PC
60 60 e0 ff 00                 # a242 |   mov C, 0xff
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
98 80 20 00                    # a247 |   getb D, A, 0
                               #      | _A_if_5:
e8 80 00 f8 0b 00              # a24b |   jeq D, 0, ${_E_if_5}:rel + PC
60 80 e0 ff 00                 # a251 |   mov D, 0xff
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _A_call_4:
e0 80                          # a256 |   push D
e0 60                          # a258 |   push C
e0 40                          # a25a |   push B
e0 20                          # a25c |   push A
5c f8 17 00                    # a25e |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # a262 |   mov SP, SP + 0x8
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # a266 |   inc A
58 f8 b8 ff                    # a268 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_reset_color_palette:
e4 20                          # a26c |   pop A
e4 40                          # a26e |   pop B
e4 60                          # a270 |   pop C
e4 80                          # a272 |   pop D
dc                             # a274 |   ret
                               #      | _end_fn_reset_color_palette:
                               #      | 
                               #      | fn_set_color_palette:
                               #      | _begin_fn_set_color_palette:
e0 20                          # a275 |   push A
ad 20 bc 1c 04 07              # a277 |   and A, [SP + 0x4], 0x7
28 20 1c 01                    # a27d |   shl A, 0x1
63 e4 bc 20 a4 0a              # a281 |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc 30 a4 08              # a287 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc 40 a4 06              # a28d |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
                               #      | _cleanup_fn_set_color_palette:
e4 20                          # a293 |   pop A
dc                             # a295 |   ret
                               #      | _end_fn_set_color_palette:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # a296 |   push A
61 fe bc 06                    # a298 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # a29c |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_3:
60 20 e4 20 a4                 # a2a2 |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_3:
fc 20 e0 f8 20 a9 13 00        # a2a7 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_3}:rel + PC
62 20 fe                       # a2af |   mov [A], G
                               #      | _BZ_for_3:
60 20 3c 50                    # a2b2 |   mov A, A + 0x50
58 f8 f1 ff                    # a2b6 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # a2ba |   pop A
dc                             # a2bc |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_gen_font:
                               #      | _begin_fn_gen_font:
e0 80                          # a2bd |   push D
e0 60                          # a2bf |   push C
e0 40                          # a2c1 |   push B
e0 20                          # a2c3 |   push A
60 a0 bc e0                    # a2c5 |   mov SP, SP + -32
60 60 1c 20                    # a2c9 |   mov C, 0x20
                               #      | _A_for_5:
60 20 00                       # a2cd |   mov A, 0
                               #      | _BA_for_5:
fc 20 1c f8 06 70 00           # a2d0 |   jge A, 0x6, ${_C_for_5}:rel + PC
                               #      | _A_if_6:
f2 e0 1c f8 22 a9 07 0e 00     # a2d7 |   jlt [${var__var_1}], 0x7, ${_E_if_6}:rel + PC
62 e0 00 22 a9                 # a2e0 |   mov [${var__var_1}], 0
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
46 e0 22 a9                    # a2e5 |   inc [${var__var_1}]
81 fc e0 1c 22 a9 08           # a2e9 |   add E, [${var__var_1}], 0x8
                               #      | _A_call_17:
e0 fc                          # a2f0 |   push E
e0 fc                          # a2f2 |   push E
e0 3c 01                       # a2f4 |   push A + 0x1
5c f8 fc fe                    # a2f7 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a2fb |   mov SP, SP + 0x4
e4 fc                          # a2ff |   pop E
                               #      | _Z_call_17:
                               #      | _A_for_6:
60 40 00                       # a301 |   mov B, 0
                               #      | _BA_for_6:
fc 40 1c f8 10 36 00           # a304 |   jge B, 0x10, ${_C_for_6}:rel + PC
                               #      | _A_syscall_1:
e0 fc                          # a30b |   push E
e0 60                          # a30d |   push C
e0 bc 04                       # a30f |   push SP + 0x4
60 ff 1c 13                    # a312 |   mov H, 0x13
5e e0 1e ff                    # a316 |   call [0xff1e]
60 a0 bc 04                    # a31a |   mov SP, SP + 0x4
e4 fc                          # a31e |   pop E
                               #      | _Z_syscall_1:
                               #      | _A_call_18:
e0 fc                          # a320 |   push E
e0 bc 02                       # a322 |   push SP + 0x2
e0 5c 0a                       # a325 |   push B + 0xa
5c f8 25 00                    # a328 |   call ${fn_fill_cell_content}:rel + PC
60 a0 bc 04                    # a32c |   mov SP, SP + 0x4
e4 fc                          # a330 |   pop E
                               #      | _Z_call_18:
44 60                          # a332 |   inc C
                               #      | _BZ_for_6:
44 40                          # a334 |   inc B
58 f8 ce ff                    # a336 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _BZ_for_5:
44 20                          # a33a |   inc A
58 f8 94 ff                    # a33c |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_gen_font:
60 a0 bc 20                    # a340 |   mov SP, SP + 0x20
e4 20                          # a344 |   pop A
e4 40                          # a346 |   pop B
e4 60                          # a348 |   pop C
e4 80                          # a34a |   pop D
dc                             # a34c |   ret
                               #      | _end_fn_gen_font:
                               #      | 
                               #      | fn_fill_cell_content:
                               #      | _begin_fn_fill_cell_content:
e0 40                          # a34d |   push B
e0 20                          # a34f |   push A
a9 20 bc 1c 06 01              # a351 |   shl A, [SP + 0x6], 0x1
61 40 bc 08                    # a357 |   mov B, [SP + 0x8]
                               #      | _A_for_7:
60 20 e4 20 a4                 # a35b |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_7:
fc 20 e0 f8 20 a9 17 00        # a360 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_7}:rel + PC
63 20 40                       # a368 |   mov [A], [B]
                               #      | _BZ_for_7:
60 20 3c 50                    # a36b |   mov A, A + 0x50
60 40 5c 02                    # a36f |   mov B, B + 0x2
58 f8 ed ff                    # a373 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_fill_cell_content:
e4 20                          # a377 |   pop A
e4 40                          # a379 |   pop B
dc                             # a37b |   ret
                               #      | _end_fn_fill_cell_content:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # a37c |   push D
e0 60                          # a37e |   push C
e0 40                          # a380 |   push B
e0 20                          # a382 |   push A
61 40 e0 10 ff                 # a384 |   mov B, [0xff10]
61 60 e0 12 ff                 # a389 |   mov C, [0xff12]
61 80 e0 14 ff                 # a38e |   mov D, [0xff14]
61 20 bc 0e                    # a393 |   mov A, [SP + 0xe]
60 ff 00                       # a397 |   mov H, 0
                               #      | _A_if_8:
fc 28 20 f8 09 00              # a39a |   jge A + B, A, ${_E_if_8}:rel + PC
c4 ff 00                       # a3a0 |   inc H, 0
                               #      | _E_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
60 40 44                       # a3a3 |   mov B, B + A
81 20 bc ff 0c                 # a3a6 |   add A, [SP + 0xc], H
60 ff 00                       # a3ab |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # a3ae |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # a3b4 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # a3ba |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # a3be |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # a3c1 |   mov C, C + A
81 20 bc ff 0a                 # a3c4 |   add A, [SP + 0xa], H
60 80 84                       # a3c9 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # a3cc |   mov A, [SP + 0x10]
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 14 ff                 # a3d0 |   mov H, [0xff14]
                               #      | _A_if_11:
f4 ff 80 f8 0a 00              # a3d5 |   jle H, D, ${_E_if_11}:rel + PC
58 f8 33 00                    # a3db |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_11:
ec ff 80 f8 2b 00              # a3df |   jne H, D, ${_E2_if_11}:rel + PC
61 ff e0 12 ff                 # a3e5 |   mov H, [0xff12]
                               #      | _A_if_12:
f4 ff 60 f8 0a 00              # a3ea |   jle H, C, ${_E_if_12}:rel + PC
58 f8 1e 00                    # a3f0 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_12:
ec ff 60 f8 16 00              # a3f4 |   jne H, C, ${_E2_if_12}:rel + PC
fa e0 40 f8 10 ff 14 00        # a3fa |   jgt [0xff10], B, ${_C_loop_2}:rel + PC
                               #      | _A_if_14:
e8 20 00 f8 08 00              # a402 |   jeq A, 0, ${_E_if_14}:rel + PC
5c 20                          # a408 |   call A
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
58 f8 c6 ff                    # a40a |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # a40e |   pop A
e4 40                          # a410 |   pop B
e4 60                          # a412 |   pop C
e4 80                          # a414 |   pop D
dc                             # a416 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__str__Testbed__endl:
54 65 73 74 62 65 64 0a 00     # a417 |   .data str:"Testbed\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa420
                               #      | SECTION_BEGIN_static_data:
                               #      | var__VIDEO_ROW_BUFFER:
                               # a420 |   .bss size:1280 align:16
                               #      | var__test_loop_target_v:
                               # a920 |   .bss size:2 align:1
                               #      | var__var_1:
                               # a922 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
