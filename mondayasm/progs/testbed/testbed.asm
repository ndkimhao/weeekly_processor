                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_23:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_23:
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
e0 e0 05 a9                    # a014 |   push ${const__str__Testbed__endl}
5c f8 4b 01                    # a018 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01c |   mov SP, SP + 0x2
e4 fc                          # a020 |   pop E
                               #      | _Z_call_2:
                               #      | _A_call_3:
e0 fc                          # a022 |   push E
e0 1c 06                       # a024 |   push 0x6
e0 00                          # a027 |   push 0
5c f8 74 01                    # a029 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a02d |   mov SP, SP + 0x4
e4 fc                          # a031 |   pop E
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 fc                          # a033 |   push E
e0 e0 0f 0f                    # a035 |   push 0xf0f
e0 00                          # a039 |   push 0
5c f8 84 01                    # a03b |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a03f |   mov SP, SP + 0x4
e4 fc                          # a043 |   pop E
                               #      | _Z_call_4:
                               #      | _A_call_5:
e0 fc                          # a045 |   push E
e0 1c ff                       # a047 |   push -1
e0 1c 01                       # a04a |   push 0x1
5c f8 72 01                    # a04d |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a051 |   mov SP, SP + 0x4
e4 fc                          # a055 |   pop E
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 fc                          # a057 |   push E
e0 e0 aa aa                    # a059 |   push 0xaaaa
e0 1c 02                       # a05d |   push 0x2
5c f8 5f 01                    # a060 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a064 |   mov SP, SP + 0x4
e4 fc                          # a068 |   pop E
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 fc                          # a06a |   push E
e0 1c 05                       # a06c |   push 0x5
e0 1c 02                       # a06f |   push 0x2
5c f8 2b 01                    # a072 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a076 |   mov SP, SP + 0x4
e4 fc                          # a07a |   pop E
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 fc                          # a07c |   push E
e0 e0 0f 0f                    # a07e |   push 0xf0f
e0 00                          # a082 |   push 0
5c f8 3b 01                    # a084 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a088 |   mov SP, SP + 0x4
e4 fc                          # a08c |   pop E
                               #      | _Z_call_8:
                               #      | _A_call_9:
e0 fc                          # a08e |   push E
e0 1c ff                       # a090 |   push -1
e0 1c 01                       # a093 |   push 0x1
5c f8 29 01                    # a096 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a09a |   mov SP, SP + 0x4
e4 fc                          # a09e |   pop E
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 fc                          # a0a0 |   push E
e0 e0 aa aa                    # a0a2 |   push 0xaaaa
e0 1c 02                       # a0a6 |   push 0x2
5c f8 16 01                    # a0a9 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0ad |   mov SP, SP + 0x4
e4 fc                          # a0b1 |   pop E
                               #      | _Z_call_10:
                               #      | _A_for_3:
60 20 00                       # a0b3 |   mov A, 0
                               #      | _BA_for_3:
                               #      | _A_call_15:
e0 fc                          # a0b6 |   push E
5c f8 2e 01                    # a0b8 |   call ${fn_gen_font}:rel + PC
e4 fc                          # a0bc |   pop E
                               #      | _Z_call_15:
                               #      | _A_if_9:
ec 20 00 f8 1c 00              # a0be |   jne A, 0, ${_E_if_9}:rel + PC
                               #      | _A_call_16:
e0 fc                          # a0c4 |   push E
e0 1c 07                       # a0c6 |   push 0x7
e0 1c 05                       # a0c9 |   push 0x5
5c f8 d1 00                    # a0cc |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0d0 |   mov SP, SP + 0x4
e4 fc                          # a0d4 |   pop E
                               #      | _Z_call_16:
58 f8 16 00                    # a0d6 |   jmp ${_C_if_9}:rel + PC
                               #      | _E_if_9:
                               #      | _A_call_17:
e0 fc                          # a0da |   push E
e0 1c 04                       # a0dc |   push 0x4
e0 1c 05                       # a0df |   push 0x5
5c f8 bb 00                    # a0e2 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0e6 |   mov SP, SP + 0x4
e4 fc                          # a0ea |   pop E
                               #      | _Z_call_17:
                               #      | _C_if_9:
                               #      | _Z_if_9:
                               #      | _A_call_18:
e0 fc                          # a0ec |   push E
e0 e0 0f 0f                    # a0ee |   push 0xf0f
e0 00                          # a0f2 |   push 0
5c f8 cb 00                    # a0f4 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0f8 |   mov SP, SP + 0x4
e4 fc                          # a0fc |   pop E
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 fc                          # a0fe |   push E
e0 e0 a0 a0                    # a100 |   push 0xa0a0
e0 1c 01                       # a104 |   push 0x1
5c f8 b8 00                    # a107 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a10b |   mov SP, SP + 0x4
e4 fc                          # a10f |   pop E
                               #      | _Z_call_19:
                               #      | _A_call_20:
e0 fc                          # a111 |   push E
e0 e0 cc cc                    # a113 |   push 0xcccc
e0 1c 02                       # a117 |   push 0x2
5c f8 a5 00                    # a11a |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a11e |   mov SP, SP + 0x4
e4 fc                          # a122 |   pop E
                               #      | _Z_call_20:
                               #      | _A_call_21:
e0 fc                          # a124 |   push E
e0 e0 aa aa                    # a126 |   push 0xaaaa
e0 1c 03                       # a12a |   push 0x3
5c f8 92 00                    # a12d |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a131 |   mov SP, SP + 0x4
e4 fc                          # a135 |   pop E
                               #      | _Z_call_21:
62 e0 00 10 ae                 # a137 |   mov [${var__test_loop_target_v}], 0
                               #      | _A_call_22:
e0 fc                          # a13c |   push E
e0 00                          # a13e |   push 0
e0 e0 00 87                    # a140 |   push 0x8700
e0 e0 93 03                    # a144 |   push 0x393
e0 00                          # a148 |   push 0
5c f8 6b 02                    # a14a |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # a14e |   mov SP, SP + 0x8
e4 fc                          # a152 |   pop E
                               #      | _Z_call_22:
                               #      | _BZ_for_3:
3c 20                          # a154 |   not A
58 f8 60 ff                    # a156 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_main:
e4 20                          # a15a |   pop A
e4 40                          # a15c |   pop B
e4 60                          # a15e |   pop C
e4 80                          # a160 |   pop D
dc                             # a162 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a163 |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a165 |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a169 |   bmov H, [A]
e8 ff 00 f8 16 00              # a16c |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a172 |   push H
5c f8 11 00                    # a174 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a178 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a17c |   inc A
58 f8 eb ff                    # a17e |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a182 |   pop A
dc                             # a184 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a185 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a18c |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a192 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a196 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a19c |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # a19d |   push B
e0 20                          # a19f |   push A
61 20 bc 08                    # a1a1 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # a1a5 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # a1aa |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 10 a9 0f ae 01     # a1b1 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # a1ba |   pop A
e4 40                          # a1bc |   pop B
dc                             # a1be |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # a1bf |   push A
61 fe bc 06                    # a1c1 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # a1c5 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_2:
60 20 e4 10 a9                 # a1cb |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_2:
fc 20 e0 f8 10 ae 13 00        # a1d0 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_2}:rel + PC
62 20 fe                       # a1d8 |   mov [A], G
                               #      | _BZ_for_2:
60 20 3c 50                    # a1db |   mov A, A + 0x50
58 f8 f1 ff                    # a1df |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # a1e3 |   pop A
dc                             # a1e5 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_gen_font:
                               #      | _begin_fn_gen_font:
e0 80                          # a1e6 |   push D
e0 60                          # a1e8 |   push C
e0 40                          # a1ea |   push B
e0 20                          # a1ec |   push A
60 a0 bc e0                    # a1ee |   mov SP, SP + -32
60 60 1c 20                    # a1f2 |   mov C, 0x20
                               #      | _A_for_4:
60 20 00                       # a1f6 |   mov A, 0
                               #      | _BA_for_4:
fc 20 1c f8 06 6c 00           # a1f9 |   jge A, 0x6, ${_C_for_4}:rel + PC
                               #      | _A_if_3:
f2 e0 1c f8 12 ae 07 0e 00     # a200 |   jlt [${var__var_1}], 0x7, ${_E_if_3}:rel + PC
62 e0 00 12 ae                 # a209 |   mov [${var__var_1}], 0
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
46 e0 12 ae                    # a20e |   inc [${var__var_1}]
81 fc e0 1c 12 ae 08           # a212 |   add E, [${var__var_1}], 0x8
                               #      | _A_call_11:
e0 fc                          # a219 |   push E
e0 fc                          # a21b |   push E
e0 3c 01                       # a21d |   push A + 0x1
5c f8 7d ff                    # a220 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a224 |   mov SP, SP + 0x4
e4 fc                          # a228 |   pop E
                               #      | _Z_call_11:
                               #      | _A_for_5:
60 40 00                       # a22a |   mov B, 0
                               #      | _BA_for_5:
fc 40 1c f8 10 32 00           # a22d |   jge B, 0x10, ${_C_for_5}:rel + PC
                               #      | _A_call_13:
e0 fc                          # a234 |   push E
e0 60                          # a236 |   push C
e0 bc 04                       # a238 |   push SP + 0x4
5c f8 37 00                    # a23b |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # a23f |   mov SP, SP + 0x4
e4 fc                          # a243 |   pop E
                               #      | _Z_call_13:
                               #      | _A_call_14:
e0 fc                          # a245 |   push E
e0 bc 02                       # a247 |   push SP + 0x2
e0 5c 0a                       # a24a |   push B + 0xa
5c f8 39 01                    # a24d |   call ${fn_fill_cell_content}:rel + PC
60 a0 bc 04                    # a251 |   mov SP, SP + 0x4
e4 fc                          # a255 |   pop E
                               #      | _Z_call_14:
44 60                          # a257 |   inc C
                               #      | _BZ_for_5:
44 40                          # a259 |   inc B
58 f8 d2 ff                    # a25b |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _BZ_for_4:
44 20                          # a25f |   inc A
58 f8 98 ff                    # a261 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_gen_font:
60 a0 bc 20                    # a265 |   mov SP, SP + 0x20
e4 20                          # a269 |   pop A
e4 40                          # a26b |   pop B
e4 60                          # a26d |   pop C
e4 80                          # a26f |   pop D
dc                             # a271 |   ret
                               #      | _end_fn_gen_font:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # a272 |   push B
e0 20                          # a274 |   push A
61 20 bc 08                    # a276 |   mov A, [SP + 0x8]
60 40 1c 1f                    # a27a |   mov B, 0x1f
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 20 1c f8 20 13 00           # a27e |   jlt A, 0x20, ${_C_scope_1}:rel + PC
fc 20 e0 f8 80 00 0c 00        # a285 |   jge A, 0x80, ${_C_scope_1}:rel + PC
60 40 3c e0                    # a28d |   mov B, A + -32
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
28 40 1c 01                    # a291 |   shl B, 0x1
61 40 e8 45 a8                 # a295 |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_12:
e0 1c 0c                       # a29a |   push 0xc
e0 1c 10                       # a29d |   push 0x10
e0 e8 50 a4                    # a2a0 |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # a2a4 |   push [SP + 0xc]
5c f8 0d 00                    # a2a7 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # a2ab |   mov SP, SP + 0x8
                               #      | _Z_call_12:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # a2af |   pop A
e4 40                          # a2b1 |   pop B
dc                             # a2b3 |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # a2b4 |   push D
e0 60                          # a2b6 |   push C
e0 40                          # a2b8 |   push B
e0 20                          # a2ba |   push A
61 fc bc 0a                    # a2bc |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # a2c0 |   shl F, [SP + 0xe], 0x1
00 fd fc                       # a2c6 |   add F, E
61 fe bc 0c                    # a2c9 |   mov G, [SP + 0xc]
61 40 fe                       # a2cd |   mov B, [G]
60 60 1c 07                    # a2d0 |   mov C, 0x7
60 20 00                       # a2d4 |   mov A, 0
60 a0 bc fe                    # a2d7 |   mov SP, SP + -2
                               #      | _A_for_6:
                               #      | _BA_for_6:
fc fc fd f8 9e 00              # a2db |   jge E, F, ${_C_for_6}:rel + PC
                               #      |   # decode one line
60 20 00                       # a2e1 |   mov A, 0
62 a0 1c ff                    # a2e4 |   mov [SP], -1
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_if_6:
ec 60 1c f8 ff 10 00           # a2e8 |   jne C, -1, ${_E_if_6}:rel + PC
44 fe                          # a2ef |   inc G
61 40 fe                       # a2f1 |   mov B, [G]
60 60 1c 07                    # a2f4 |   mov C, 0x7
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
98 80 40 60                    # a2f8 |   getb D, B, C
48 60                          # a2fc |   dec C
40 80                          # a2fe |   bool D
b0 20 21 80                    # a300 |   or A, A*2, D
4a a0                          # a304 |   dec [SP]
                               #      | _A_if_7:
ee a0 00 f8 1b 00              # a306 |   jne [SP], 0, ${_E_if_7}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # a30c |   mov H, A
b9 20 bc 12                    # a30f |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # a313 |   shr A, -1, A + 0x10
ae fc ff 20                    # a319 |   and [E], H, A
58 f8 54 00                    # a31d |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_7:
ec 20 00 f8 20 00              # a321 |   jne A, 0, ${_E2_if_7}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # a327 |   sub H, E, 0x2
                               #      | _A_if_8:
f1 ff bc f8 0c 0e 00           # a32c |   jlt H, [SP + 0xc], ${_E_if_8}:rel + PC
63 fc ff                       # a333 |   mov [E], [H]
58 f8 07 00                    # a336 |   jmp ${_C_if_8}:rel + PC
                               #      | _E_if_8:
62 fc 00                       # a33a |   mov [E], 0
                               #      | _C_if_8:
                               #      | _Z_if_8:
58 f8 34 00                    # a33d |   jmp ${_C_loop_2}:rel + PC
                               #      | _E2_if_7:
ec 20 1c f8 02 13 00           # a341 |   jne A, 0x2, ${_E3_if_7}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # a348 |   sub H, E, 0x4
63 fc ff                       # a34d |   mov [E], [H]
58 f8 21 00                    # a350 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E3_if_7:
ec 20 1c f8 06 0e 00           # a354 |   jne A, 0x6, ${_E4_if_7}:rel + PC
                               #      |   # all zeros
62 fc 00                       # a35b |   mov [E], 0
58 f8 13 00                    # a35e |   jmp ${_C_loop_2}:rel + PC
                               #      | _E4_if_7:
ec 20 1c f8 07 0b 00           # a362 |   jne A, 0x7, ${_E5_if_7}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # a369 |   mov [SP], [SP + 0x12]
                               #      | _E5_if_7:
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _BZ_loop_2:
58 f8 7b ff                    # a36d |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _BZ_for_6:
00 fc 1c 02                    # a371 |   add E, 0x2
58 f8 66 ff                    # a375 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # a379 |   mov SP, SP + 0x2
e4 20                          # a37d |   pop A
e4 40                          # a37f |   pop B
e4 60                          # a381 |   pop C
e4 80                          # a383 |   pop D
dc                             # a385 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_fill_cell_content:
                               #      | _begin_fn_fill_cell_content:
e0 40                          # a386 |   push B
e0 20                          # a388 |   push A
a9 20 bc 1c 06 01              # a38a |   shl A, [SP + 0x6], 0x1
61 40 bc 08                    # a390 |   mov B, [SP + 0x8]
                               #      | _A_for_7:
60 20 e4 10 a9                 # a394 |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_7:
fc 20 e0 f8 10 ae 17 00        # a399 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_7}:rel + PC
63 20 40                       # a3a1 |   mov [A], [B]
                               #      | _BZ_for_7:
60 20 3c 50                    # a3a4 |   mov A, A + 0x50
60 40 5c 02                    # a3a8 |   mov B, B + 0x2
58 f8 ed ff                    # a3ac |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_fill_cell_content:
e4 20                          # a3b0 |   pop A
e4 40                          # a3b2 |   pop B
dc                             # a3b4 |   ret
                               #      | _end_fn_fill_cell_content:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # a3b5 |   push D
e0 60                          # a3b7 |   push C
e0 40                          # a3b9 |   push B
e0 20                          # a3bb |   push A
61 40 e0 10 ff                 # a3bd |   mov B, [0xff10]
61 60 e0 12 ff                 # a3c2 |   mov C, [0xff12]
61 80 e0 14 ff                 # a3c7 |   mov D, [0xff14]
61 20 bc 0e                    # a3cc |   mov A, [SP + 0xe]
60 ff 00                       # a3d0 |   mov H, 0
                               #      | _A_if_10:
fc 28 20 f8 09 00              # a3d3 |   jge A + B, A, ${_E_if_10}:rel + PC
c4 ff 00                       # a3d9 |   inc H, 0
                               #      | _E_if_10:
                               #      | _C_if_10:
                               #      | _Z_if_10:
60 40 44                       # a3dc |   mov B, B + A
81 20 bc ff 0c                 # a3df |   add A, [SP + 0xc], H
60 ff 00                       # a3e4 |   mov H, 0
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 2c 20 f8 10 00              # a3e7 |   jlt A + C, A, ${_C_scope_2}:rel + PC
f0 20 ff f8 0a 00              # a3ed |   jlt A, H, ${_C_scope_2}:rel + PC
58 f8 07 00                    # a3f3 |   jmp ${_Z_scope_2}:rel + PC
                               #      | _C_scope_2:
c4 ff 00                       # a3f7 |   inc H, 0
                               #      | _Z_scope_2:
60 60 64                       # a3fa |   mov C, C + A
81 20 bc ff 0a                 # a3fd |   add A, [SP + 0xa], H
60 80 84                       # a402 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # a405 |   mov A, [SP + 0x10]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 ff e0 14 ff                 # a409 |   mov H, [0xff14]
                               #      | _A_if_13:
f4 ff 80 f8 0a 00              # a40e |   jle H, D, ${_E_if_13}:rel + PC
58 f8 33 00                    # a414 |   jmp ${_C_loop_3}:rel + PC
                               #      | _E_if_13:
ec ff 80 f8 2b 00              # a418 |   jne H, D, ${_E2_if_13}:rel + PC
61 ff e0 12 ff                 # a41e |   mov H, [0xff12]
                               #      | _A_if_14:
f4 ff 60 f8 0a 00              # a423 |   jle H, C, ${_E_if_14}:rel + PC
58 f8 1e 00                    # a429 |   jmp ${_C_loop_3}:rel + PC
                               #      | _E_if_14:
ec ff 60 f8 16 00              # a42d |   jne H, C, ${_E2_if_14}:rel + PC
fa e0 40 f8 10 ff 14 00        # a433 |   jgt [0xff10], B, ${_C_loop_3}:rel + PC
                               #      | _A_if_16:
e8 20 00 f8 08 00              # a43b |   jeq A, 0, ${_E_if_16}:rel + PC
5c 20                          # a441 |   call A
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _E2_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
                               #      | _E2_if_13:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _BZ_loop_3:
58 f8 c6 ff                    # a443 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # a447 |   pop A
e4 40                          # a449 |   pop B
e4 60                          # a44b |   pop C
e4 80                          # a44d |   pop D
dc                             # a44f |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # a450 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # a845 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__str__Testbed__endl:
54 65 73 74 62 65 64 0a 00     # a905 |   .data str:"Testbed\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa90e
                               #      | SECTION_BEGIN_static_data:
                               # a90e |   .align dummy_size:2 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # a910 |   .bss size:1280 align:16
                               #      | var__test_loop_target_v:
                               # ae10 |   .bss size:2 align:1
                               #      | var__var_1:
                               # ae12 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
