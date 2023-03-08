                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_22:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_22:
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
e0 e0 7a a8                    # a012 |   push ${const_data_1}
5c f8 0d 01                    # a016 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01a |   mov SP, SP + 0x2
                               #      | _Z_call_2:
                               #      | _A_call_3:
e0 1c 06                       # a01e |   push 0x6
e0 00                          # a021 |   push 0
5c f8 3a 01                    # a023 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a027 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 e0 0f 0f                    # a02b |   push 0xf0f
e0 00                          # a02f |   push 0
5c f8 4e 01                    # a031 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a035 |   mov SP, SP + 0x4
                               #      | _Z_call_4:
                               #      | _A_call_5:
e0 1c ff                       # a039 |   push -1
e0 1c 01                       # a03c |   push 0x1
5c f8 40 01                    # a03f |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a043 |   mov SP, SP + 0x4
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 e0 aa aa                    # a047 |   push 0xaaaa
e0 1c 02                       # a04b |   push 0x2
5c f8 31 01                    # a04e |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a052 |   mov SP, SP + 0x4
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 1c 05                       # a056 |   push 0x5
e0 1c 02                       # a059 |   push 0x2
5c f8 01 01                    # a05c |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a060 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 e0 0f 0f                    # a064 |   push 0xf0f
e0 00                          # a068 |   push 0
5c f8 15 01                    # a06a |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a06e |   mov SP, SP + 0x4
                               #      | _Z_call_8:
                               #      | _A_call_9:
e0 1c ff                       # a072 |   push -1
e0 1c 01                       # a075 |   push 0x1
5c f8 07 01                    # a078 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a07c |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 e0 aa aa                    # a080 |   push 0xaaaa
e0 1c 02                       # a084 |   push 0x2
5c f8 f8 00                    # a087 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a08b |   mov SP, SP + 0x4
                               #      | _Z_call_10:
                               #      | _A_for_3:
60 20 00                       # a08f |   mov A, 0
                               #      | _BA_for_3:
                               #      | _A_call_14:
e0 fc                          # a092 |   push E
5c f8 12 01                    # a094 |   call ${fn_gen_font}:rel + PC
e4 fc                          # a098 |   pop E
                               #      | _Z_call_14:
                               #      | _A_if_6:
ec 20 00 f8 18 00              # a09a |   jne A, 0, ${_E_if_6}:rel + PC
                               #      | _A_call_15:
e0 1c 07                       # a0a0 |   push 0x7
e0 1c 05                       # a0a3 |   push 0x5
5c f8 b7 00                    # a0a6 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0aa |   mov SP, SP + 0x4
                               #      | _Z_call_15:
58 f8 12 00                    # a0ae |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
                               #      | _A_call_16:
e0 1c 04                       # a0b2 |   push 0x4
e0 1c 05                       # a0b5 |   push 0x5
5c f8 a5 00                    # a0b8 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0bc |   mov SP, SP + 0x4
                               #      | _Z_call_16:
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _A_call_17:
e0 e0 0f 0f                    # a0c0 |   push 0xf0f
e0 00                          # a0c4 |   push 0
5c f8 b9 00                    # a0c6 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0ca |   mov SP, SP + 0x4
                               #      | _Z_call_17:
                               #      | _A_call_18:
e0 e0 a0 a0                    # a0ce |   push 0xa0a0
e0 1c 01                       # a0d2 |   push 0x1
5c f8 aa 00                    # a0d5 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0d9 |   mov SP, SP + 0x4
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 e0 cc cc                    # a0dd |   push 0xcccc
e0 1c 02                       # a0e1 |   push 0x2
5c f8 9b 00                    # a0e4 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0e8 |   mov SP, SP + 0x4
                               #      | _Z_call_19:
                               #      | _A_call_20:
e0 e0 aa aa                    # a0ec |   push 0xaaaa
e0 1c 03                       # a0f0 |   push 0x3
5c f8 8c 00                    # a0f3 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0f7 |   mov SP, SP + 0x4
                               #      | _Z_call_20:
62 e0 00 90 ad                 # a0fb |   mov [${var_test_loop_target_v}], 0
                               #      | _A_call_21:
e0 00                          # a100 |   push 0
e0 e0 00 87                    # a102 |   push 0x8700
e0 e0 93 03                    # a106 |   push 0x393
e0 00                          # a10a |   push 0
5c f8 1e 02                    # a10c |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # a110 |   mov SP, SP + 0x8
                               #      | _Z_call_21:
                               #      | _BZ_for_3:
3c 20                          # a114 |   not A
58 f8 7c ff                    # a116 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_main:
e4 20                          # a11a |   pop A
e4 40                          # a11c |   pop B
e4 60                          # a11e |   pop C
e4 80                          # a120 |   pop D
dc                             # a122 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a123 |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a125 |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a129 |   bmov H, [A]
e8 ff 00 f8 16 00              # a12c |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a132 |   push H
5c f8 11 00                    # a134 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a138 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a13c |   inc A
58 f8 eb ff                    # a13e |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a142 |   pop A
dc                             # a144 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a145 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a14c |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a152 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a156 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a15c |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # a15d |   push B
e0 20                          # a15f |   push A
61 20 bc 08                    # a161 |   mov A, [SP + 0x8]
60 20 e4 f0 00                 # a165 |   mov A, 0xf0 + A
89 40 bc e0 06 00 05           # a16a |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 90 a8 8f ad 01     # a171 |   mmap ${var_VIDEO_ROW_BUFFER}, ${var_VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # a17a |   pop A
e4 40                          # a17c |   pop B
dc                             # a17e |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # a17f |   push A
61 fe bc 06                    # a181 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # a185 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_2:
60 20 e4 90 a8                 # a18b |   mov A, ${var_VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_2:
fc 20 e0 f8 90 ad 13 00        # a190 |   jge A, ${var_VIDEO_ROW_BUFFER} + 0500, ${_C_for_2}:rel + PC
62 20 fe                       # a198 |   mov [A], G
                               #      | _BZ_for_2:
60 20 3c 50                    # a19b |   mov A, A + 0x50
58 f8 f1 ff                    # a19f |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # a1a3 |   pop A
dc                             # a1a5 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_gen_font:
                               #      | _begin_fn_gen_font:
e0 80                          # a1a6 |   push D
e0 60                          # a1a8 |   push C
e0 40                          # a1aa |   push B
e0 20                          # a1ac |   push A
60 a0 bc e0                    # a1ae |   mov SP, SP + -32
60 60 e0 ba a7                 # a1b2 |   mov C, ${const_FONT_16_12_INDEX}
                               #      | _A_for_4:
60 20 00                       # a1b7 |   mov A, 0
                               #      | _BA_for_4:
fc 20 1c f8 06 70 00           # a1ba |   jge A, 0x6, ${_C_for_4}:rel + PC
                               #      | _A_if_3:
f2 e0 1c f8 92 ad 07 0e 00     # a1c1 |   jlt [${var_var_1}], 0x7, ${_E_if_3}:rel + PC
62 e0 00 92 ad                 # a1ca |   mov [${var_var_1}], 0
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
46 e0 92 ad                    # a1cf |   inc [${var_var_1}]
                               #      | _A_call_11:
e2 e0 92 ad                    # a1d3 |   push [${var_var_1}]
e0 3c 01                       # a1d7 |   push A + 0x1
5c f8 83 ff                    # a1da |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a1de |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_for_5:
60 40 00                       # a1e2 |   mov B, 0
                               #      | _BA_for_5:
fc 40 1c f8 10 3f 00           # a1e5 |   jge B, 0x10, ${_C_for_5}:rel + PC
81 80 60 e0 c5 a3              # a1ec |   add D, [C], ${const_FONT_16_12_COMPRESSED}
60 60 7c 02                    # a1f2 |   mov C, C + 0x2
                               #      | _A_call_12:
e0 fd                          # a1f6 |   push F
e0 fc                          # a1f8 |   push E
e0 1c 0c                       # a1fa |   push 0xc
e0 1c 10                       # a1fd |   push 0x10
e0 80                          # a200 |   push D
e0 bc 0a                       # a202 |   push SP + 0xa
5c f8 32 00                    # a205 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # a209 |   mov SP, SP + 0x8
e4 fc                          # a20d |   pop E
e4 fd                          # a20f |   pop F
                               #      | _Z_call_12:
                               #      | _A_call_13:
e0 a0                          # a211 |   push SP
e0 5c 0a                       # a213 |   push B + 0xa
5c f8 e5 00                    # a216 |   call ${fn_fill_cell_content}:rel + PC
60 a0 bc 04                    # a21a |   mov SP, SP + 0x4
                               #      | _Z_call_13:
                               #      | _BZ_for_5:
44 40                          # a21e |   inc B
58 f8 c5 ff                    # a220 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _BZ_for_4:
44 20                          # a224 |   inc A
58 f8 94 ff                    # a226 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_gen_font:
60 a0 bc 20                    # a22a |   mov SP, SP + 0x20
e4 20                          # a22e |   pop A
e4 40                          # a230 |   pop B
e4 60                          # a232 |   pop C
e4 80                          # a234 |   pop D
dc                             # a236 |   ret
                               #      | _end_fn_gen_font:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # a237 |   push D
e0 60                          # a239 |   push C
e0 40                          # a23b |   push B
e0 20                          # a23d |   push A
61 fc bc 0a                    # a23f |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # a243 |   shl F, [SP + 0xe], 0x1
00 fd fc                       # a249 |   add F, E
61 fe bc 0c                    # a24c |   mov G, [SP + 0xc]
61 40 fe                       # a250 |   mov B, [G]
60 60 1c 07                    # a253 |   mov C, 0x7
60 20 00                       # a257 |   mov A, 0
60 a0 bc fe                    # a25a |   mov SP, SP + -2
                               #      | _A_for_6:
                               #      | _BA_for_6:
fc fc fd f8 90 00              # a25e |   jge E, F, ${_C_for_6}:rel + PC
                               #      |   # decode one line
60 20 00                       # a264 |   mov A, 0
62 a0 1c ff                    # a267 |   mov [SP], -1
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_if_4:
ec 60 1c f8 ff 10 00           # a26b |   jne C, -1, ${_E_if_4}:rel + PC
44 fe                          # a272 |   inc G
61 40 fe                       # a274 |   mov B, [G]
60 60 1c 07                    # a277 |   mov C, 0x7
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
98 80 40 60                    # a27b |   getb D, B, C
48 60                          # a27f |   dec C
40 80                          # a281 |   bool D
b0 20 21 80                    # a283 |   or A, A*2, D
4a a0                          # a287 |   dec [SP]
                               #      | _A_if_5:
ee a0 00 f8 1b 00              # a289 |   jne [SP], 0, ${_E_if_5}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # a28f |   mov H, A
b9 20 bc 12                    # a292 |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # a296 |   shr A, -1, A + 0x10
ae fc ff 20                    # a29c |   and [E], H, A
58 f8 46 00                    # a2a0 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_5:
ec 20 00 f8 12 00              # a2a4 |   jne A, 0, ${_E2_if_5}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # a2aa |   sub H, E, 0x2
63 fc ff                       # a2af |   mov [E], [H]
58 f8 34 00                    # a2b2 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E2_if_5:
ec 20 1c f8 02 13 00           # a2b6 |   jne A, 0x2, ${_E3_if_5}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # a2bd |   sub H, E, 0x4
63 fc ff                       # a2c2 |   mov [E], [H]
58 f8 21 00                    # a2c5 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E3_if_5:
ec 20 1c f8 06 0e 00           # a2c9 |   jne A, 0x6, ${_E4_if_5}:rel + PC
                               #      |   # all zeros
62 fc 00                       # a2d0 |   mov [E], 0
58 f8 13 00                    # a2d3 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E4_if_5:
ec 20 1c f8 07 0b 00           # a2d7 |   jne A, 0x7, ${_E5_if_5}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # a2de |   mov [SP], [SP + 0x12]
                               #      | _E5_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _BZ_loop_2:
58 f8 89 ff                    # a2e2 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _BZ_for_6:
00 fc 1c 02                    # a2e6 |   add E, 0x2
58 f8 74 ff                    # a2ea |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # a2ee |   mov SP, SP + 0x2
e4 20                          # a2f2 |   pop A
e4 40                          # a2f4 |   pop B
e4 60                          # a2f6 |   pop C
e4 80                          # a2f8 |   pop D
dc                             # a2fa |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_fill_cell_content:
                               #      | _begin_fn_fill_cell_content:
e0 40                          # a2fb |   push B
e0 20                          # a2fd |   push A
a9 20 bc 1c 06 01              # a2ff |   shl A, [SP + 0x6], 0x1
61 40 bc 08                    # a305 |   mov B, [SP + 0x8]
                               #      | _A_for_7:
60 20 e4 90 a8                 # a309 |   mov A, ${var_VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_7:
fc 20 e0 f8 90 ad 17 00        # a30e |   jge A, ${var_VIDEO_ROW_BUFFER} + 0500, ${_C_for_7}:rel + PC
63 20 40                       # a316 |   mov [A], [B]
                               #      | _BZ_for_7:
60 20 3c 50                    # a319 |   mov A, A + 0x50
60 40 5c 02                    # a31d |   mov B, B + 0x2
58 f8 ed ff                    # a321 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_fill_cell_content:
e4 20                          # a325 |   pop A
e4 40                          # a327 |   pop B
dc                             # a329 |   ret
                               #      | _end_fn_fill_cell_content:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # a32a |   push D
e0 60                          # a32c |   push C
e0 40                          # a32e |   push B
e0 20                          # a330 |   push A
61 40 e0 10 ff                 # a332 |   mov B, [0xff10]
61 60 e0 12 ff                 # a337 |   mov C, [0xff12]
61 80 e0 14 ff                 # a33c |   mov D, [0xff14]
61 20 bc 0e                    # a341 |   mov A, [SP + 0xe]
60 ff 00                       # a345 |   mov H, 0
                               #      | _A_if_7:
fc 28 20 f8 09 00              # a348 |   jge A + B, A, ${_E_if_7}:rel + PC
c4 ff 00                       # a34e |   inc H, 0
                               #      | _E_if_7:
                               #      | _C_if_7:
                               #      | _Z_if_7:
60 40 44                       # a351 |   mov B, B + A
81 20 bc ff 0c                 # a354 |   add A, [SP + 0xc], H
60 ff 00                       # a359 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # a35c |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # a362 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # a368 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # a36c |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # a36f |   mov C, C + A
81 20 bc ff 0a                 # a372 |   add A, [SP + 0xa], H
60 80 84                       # a377 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # a37a |   mov A, [SP + 0x10]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 ff e0 14 ff                 # a37e |   mov H, [0xff14]
                               #      | _A_if_10:
f4 ff 80 f8 0a 00              # a383 |   jle H, D, ${_E_if_10}:rel + PC
58 f8 33 00                    # a389 |   jmp ${_C_loop_3}:rel + PC
                               #      | _E_if_10:
ec ff 80 f8 2b 00              # a38d |   jne H, D, ${_E2_if_10}:rel + PC
61 ff e0 12 ff                 # a393 |   mov H, [0xff12]
                               #      | _A_if_11:
f4 ff 60 f8 0a 00              # a398 |   jle H, C, ${_E_if_11}:rel + PC
58 f8 1e 00                    # a39e |   jmp ${_C_loop_3}:rel + PC
                               #      | _E_if_11:
ec ff 60 f8 16 00              # a3a2 |   jne H, C, ${_E2_if_11}:rel + PC
fa e0 40 f8 10 ff 14 00        # a3a8 |   jgt [0xff10], B, ${_C_loop_3}:rel + PC
                               #      | _A_if_13:
e8 20 00 f8 08 00              # a3b0 |   jeq A, 0, ${_E_if_13}:rel + PC
5c 20                          # a3b6 |   call A
                               #      | _E_if_13:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _E2_if_11:
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _E2_if_10:
                               #      | _C_if_10:
                               #      | _Z_if_10:
                               #      | _BZ_loop_3:
58 f8 c6 ff                    # a3b8 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # a3bc |   pop A
e4 40                          # a3be |   pop B
e4 60                          # a3c0 |   pop C
e4 80                          # a3c2 |   pop D
dc                             # a3c4 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # a3c5 |   .data raw:
                               #      | const_FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # a7ba |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const_data_1:
54 65 73 74 62 65 64 0a 00     # a87a |   .data str:"Testbed\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa883
                               #      | SECTION_BEGIN_static_data:
                               # a883 |   .align dummy_size:13 align:16
                               #      | var_VIDEO_ROW_BUFFER:
                               # a890 |   .bss size:1280 align:16
                               #      | var_test_loop_target_v:
                               # ad90 |   .bss size:2 align:1
                               #      | var_var_1:
                               # ad92 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
