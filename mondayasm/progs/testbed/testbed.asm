                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_24:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_24:
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
e0 e0 cd a3                    # a012 |   push ${const_data_1}
5c f8 ca 00                    # a016 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01a |   mov SP, SP + 0x2
                               #      | _Z_call_2:
                               #      | _A_call_3:
e0 1c 06                       # a01e |   push 0x6
e0 00                          # a021 |   push 0
5c f8 f7 00                    # a023 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a027 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 e0 0f 0f                    # a02b |   push 0xf0f
e0 00                          # a02f |   push 0
5c f8 0b 01                    # a031 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a035 |   mov SP, SP + 0x4
                               #      | _Z_call_4:
                               #      | _A_call_5:
e0 1c ff                       # a039 |   push 0xff
e0 1c 01                       # a03c |   push 0x1
5c f8 fd 00                    # a03f |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a043 |   mov SP, SP + 0x4
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 1c 05                       # a047 |   push 0x5
e0 1c 02                       # a04a |   push 0x2
5c f8 cd 00                    # a04d |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a051 |   mov SP, SP + 0x4
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 e0 0f 0f                    # a055 |   push 0xf0f
e0 00                          # a059 |   push 0
5c f8 e1 00                    # a05b |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a05f |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 1c ff                       # a063 |   push 0xff
e0 1c 01                       # a066 |   push 0x1
5c f8 d3 00                    # a069 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a06d |   mov SP, SP + 0x4
                               #      | _Z_call_8:
                               #      | _A_for_3:
60 20 00                       # a071 |   mov A, 0
                               #      | _BA_for_3:
                               #      | _A_if_3:
ec 20 00 f8 18 00              # a074 |   jne A, 0, ${_E_if_3}:rel + PC
                               #      | _A_call_9:
e0 1c 07                       # a07a |   push 0x7
e0 1c 05                       # a07d |   push 0x5
5c f8 9a 00                    # a080 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a084 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
58 f8 12 00                    # a088 |   jmp ${_C_if_3}:rel + PC
                               #      | _E_if_3:
                               #      | _A_call_10:
e0 1c 05                       # a08c |   push 0x5
e0 1c 05                       # a08f |   push 0x5
5c f8 88 00                    # a092 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a096 |   mov SP, SP + 0x4
                               #      | _Z_call_10:
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _A_call_11:
e0 e0 0f 0f                    # a09a |   push 0xf0f
e0 00                          # a09e |   push 0
5c f8 9c 00                    # a0a0 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0a4 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 1c ff                       # a0a8 |   push 0xff
e0 1c 01                       # a0ab |   push 0x1
5c f8 8e 00                    # a0ae |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0b2 |   mov SP, SP + 0x4
                               #      | _Z_call_12:
62 e0 00 e0 a8                 # a0b6 |   mov [${var_test_loop_target_v}], 0
                               #      | _A_call_23:
e0 e0 63 a1                    # a0bb |   push ${fn_test_loop_target}
e0 e0 00 87                    # a0bf |   push 0x8700
e0 e0 93 03                    # a0c3 |   push 0x393
e0 00                          # a0c7 |   push 0
5c f8 69 02                    # a0c9 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # a0cd |   mov SP, SP + 0x8
                               #      | _Z_call_23:
                               #      | _BZ_for_3:
3c 20                          # a0d1 |   not A
58 f8 a1 ff                    # a0d3 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_main:
e4 20                          # a0d7 |   pop A
e4 40                          # a0d9 |   pop B
e4 60                          # a0db |   pop C
e4 80                          # a0dd |   pop D
dc                             # a0df |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a0e0 |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a0e2 |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a0e6 |   bmov H, [A]
e8 ff 00 f8 16 00              # a0e9 |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a0ef |   push H
5c f8 11 00                    # a0f1 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a0f5 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a0f9 |   inc A
58 f8 eb ff                    # a0fb |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a0ff |   pop A
dc                             # a101 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a102 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a109 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a10f |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a113 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a119 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # a11a |   push B
e0 20                          # a11c |   push A
61 20 bc 08                    # a11e |   mov A, [SP + 0x8]
60 20 e4 f0 00                 # a122 |   mov A, 0xf0 + A
89 40 bc e0 06 00 05           # a127 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c e0 a3 df a8 01     # a12e |   mmap ${var_VIDEO_ROW_BUFFER}, ${var_VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # a137 |   pop A
e4 40                          # a139 |   pop B
dc                             # a13b |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # a13c |   push A
61 fe bc 06                    # a13e |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # a142 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_2:
60 20 e4 e0 a3                 # a148 |   mov A, ${var_VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_2:
fc 20 e0 f8 e0 a8 13 00        # a14d |   jge A, ${var_VIDEO_ROW_BUFFER} + 0500, ${_C_for_2}:rel + PC
62 20 fe                       # a155 |   mov [A], G
                               #      | _BZ_for_2:
60 20 3c 50                    # a158 |   mov A, A + 0x50
58 f8 f1 ff                    # a15c |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # a160 |   pop A
dc                             # a162 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_test_loop_target:
                               #      | _begin_fn_test_loop_target:
                               #      | _A_if_4:
ee e0 00 f8 e0 a8 21 00        # a163 |   jne [${var_test_loop_target_v}], 0, ${_E_if_4}:rel + PC
46 e0 e2 a8                    # a16b |   inc [${var_var_1}]
                               #      | _A_call_22:
e2 e0 e2 a8                    # a16f |   push [${var_var_1}]
e0 e0 d6 a3                    # a173 |   push ${const_data_2}
5c f8 0e 00                    # a177 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a17b |   mov SP, SP + 0x4
                               #      | _Z_call_22:
c6 e0 00 e0 a8                 # a17f |   inc [${var_test_loop_target_v}], 0
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _cleanup_fn_test_loop_target:
dc                             # a184 |   ret
                               #      | _end_fn_test_loop_target:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # a185 |   push C
e0 40                          # a187 |   push B
e0 20                          # a189 |   push A
60 a0 bc ee                    # a18b |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # a18f |   mov B, SP + 0x1c
                               #      | _A_for_4:
61 20 bc 1a                    # a193 |   mov A, [SP + 0x1a]
                               #      | _BA_for_4:
65 60 20                       # a197 |   bmov C, [A]
e8 60 00 f8 b5 00              # a19a |   jeq C, 0, ${_C_for_4}:rel + PC
                               #      |   # normal char
                               #      | _A_if_6:
e8 60 1c f8 25 15 00           # a1a0 |   jeq C, 0x25, ${_E_if_6}:rel + PC
                               #      | _A_call_13:
e0 60                          # a1a7 |   push C
5c f8 59 ff                    # a1a9 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a1ad |   mov SP, SP + 0x2
                               #      | _Z_call_13:
58 f8 98 00                    # a1b1 |   jmp ${_BZ_for_4}:rel + PC
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      |   # format specifier
44 20                          # a1b5 |   inc A
65 60 20                       # a1b7 |   bmov C, [A]
                               #      | _A_if_7:
ec 60 00 f8 0e 00              # a1ba |   jne C, 0, ${_E_if_7}:rel + PC
58 f8 8f 00                    # a1c0 |   jmp ${_C_for_4}:rel + PC
58 f8 85 00                    # a1c4 |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
ec 60 1c f8 64 25 00           # a1c8 |   jne C, 0x64, ${_E2_if_7}:rel + PC
                               #      |   # format %d
                               #      | _A_call_14:
e0 a0                          # a1cf |   push SP
e2 40                          # a1d1 |   push [B]
5c f8 87 00                    # a1d3 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # a1d7 |   mov SP, SP + 0x4
                               #      | _Z_call_14:
                               #      | _A_call_15:
e0 a0                          # a1db |   push SP
5c f8 03 ff                    # a1dd |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a1e1 |   mov SP, SP + 0x2
                               #      | _Z_call_15:
60 40 5c 02                    # a1e5 |   mov B, B + 0x2
58 f8 60 00                    # a1e9 |   jmp ${_C_if_7}:rel + PC
                               #      | _E2_if_7:
ec 60 1c f8 78 25 00           # a1ed |   jne C, 0x78, ${_E3_if_7}:rel + PC
                               #      |   # format %x
                               #      | _A_call_17:
e0 a0                          # a1f4 |   push SP
e2 40                          # a1f6 |   push [B]
5c f8 af 00                    # a1f8 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a1fc |   mov SP, SP + 0x4
                               #      | _Z_call_17:
                               #      | _A_call_18:
e0 a0                          # a200 |   push SP
5c f8 de fe                    # a202 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a206 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
60 40 5c 02                    # a20a |   mov B, B + 0x2
58 f8 3b 00                    # a20e |   jmp ${_C_if_7}:rel + PC
                               #      | _E3_if_7:
ec 60 1c f8 62 25 00           # a212 |   jne C, 0x62, ${_E4_if_7}:rel + PC
                               #      |   # format %b
                               #      | _A_call_19:
e0 a0                          # a219 |   push SP
e2 40                          # a21b |   push [B]
5c f8 e0 00                    # a21d |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # a221 |   mov SP, SP + 0x4
                               #      | _Z_call_19:
                               #      | _A_call_20:
e0 a0                          # a225 |   push SP
5c f8 b9 fe                    # a227 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a22b |   mov SP, SP + 0x2
                               #      | _Z_call_20:
60 40 5c 02                    # a22f |   mov B, B + 0x2
58 f8 16 00                    # a233 |   jmp ${_C_if_7}:rel + PC
                               #      | _E4_if_7:
ec 60 1c f8 25 12 00           # a237 |   jne C, 0x25, ${_E5_if_7}:rel + PC
                               #      |   # format %%
                               #      | _A_call_21:
e0 1c 25                       # a23e |   push 0x25
5c f8 c1 fe                    # a241 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a245 |   mov SP, SP + 0x2
                               #      | _Z_call_21:
                               #      | _E5_if_7:
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _BZ_for_4:
44 20                          # a249 |   inc A
58 f8 4c ff                    # a24b |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # a24f |   mov SP, SP + 0x12
e4 20                          # a253 |   pop A
e4 40                          # a255 |   pop B
e4 60                          # a257 |   pop C
dc                             # a259 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # a25a |   push C
e0 40                          # a25c |   push B
e0 20                          # a25e |   push A
61 20 bc 0a                    # a260 |   mov A, [SP + 0xa]
62 20 1c 30                    # a264 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # a268 |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # a26c |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # a272 |   div C, B, 0xa
82 20 ff 1c 30                 # a277 |   add [A], H, 0x30
44 20                          # a27c |   inc A
60 40 60                       # a27e |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # a281 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # a285 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # a289 |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # a28f |   dec A
61 40 60                       # a291 |   mov B, [C]
67 60 20                       # a294 |   bmov [C], [A]
66 20 40                       # a297 |   bmov [A], B
44 60                          # a29a |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # a29c |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # a2a0 |   pop A
e4 40                          # a2a2 |   pop B
e4 60                          # a2a4 |   pop C
dc                             # a2a6 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # a2a7 |   push C
e0 40                          # a2a9 |   push B
e0 20                          # a2ab |   push A
61 40 bc 08                    # a2ad |   mov B, [SP + 0x8]
61 60 bc 0a                    # a2b1 |   mov C, [SP + 0xa]
                               #      | _A_for_5:
60 20 1c 03                    # a2b5 |   mov A, 0x3
                               #      | _BA_for_5:
e8 20 1c f8 ff 24 00           # a2b9 |   jeq A, -1, ${_C_for_5}:rel + PC
a0 ff 40 22                    # a2c0 |   shr H, B, A*4
2c ff 1c 0f                    # a2c4 |   and H, 0xf
                               #      | _A_call_16:
e0 ff                          # a2c8 |   push H
5c f8 1a 00                    # a2ca |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # a2ce |   mov SP, SP + 0x2
                               #      | _Z_call_16:
62 60 ff                       # a2d2 |   mov [C], H
44 60                          # a2d5 |   inc C
                               #      | _BZ_for_5:
48 20                          # a2d7 |   dec A
58 f8 e0 ff                    # a2d9 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # a2dd |   pop A
e4 40                          # a2df |   pop B
e4 60                          # a2e1 |   pop C
dc                             # a2e3 |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_8:
fa bc 1c f8 02 09 12 00        # a2e4 |   jgt [SP + 0x2], 0x9, ${_E_if_8}:rel + PC
81 ff bc 1c 02 30              # a2ec |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # a2f2 |   jmp ${_C_if_8}:rel + PC
                               #      | _E_if_8:
81 ff bc 1c 02 57              # a2f6 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # a2fc |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # a2fd |   push C
e0 40                          # a2ff |   push B
e0 20                          # a301 |   push A
61 40 bc 08                    # a303 |   mov B, [SP + 0x8]
61 60 bc 0a                    # a307 |   mov C, [SP + 0xa]
                               #      | _A_for_6:
60 20 1c 0f                    # a30b |   mov A, 0xf
                               #      | _BA_for_6:
e8 20 1c f8 ff 1c 00           # a30f |   jeq A, -1, ${_C_for_6}:rel + PC
a0 ff 40 20                    # a316 |   shr H, B, A
2c ff 1c 01                    # a31a |   and H, 0x1
82 60 ff 1c 30                 # a31e |   add [C], H, 0x30
44 60                          # a323 |   inc C
                               #      | _BZ_for_6:
48 20                          # a325 |   dec A
58 f8 e8 ff                    # a327 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # a32b |   pop A
e4 40                          # a32d |   pop B
e4 60                          # a32f |   pop C
dc                             # a331 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # a332 |   push D
e0 60                          # a334 |   push C
e0 40                          # a336 |   push B
e0 20                          # a338 |   push A
61 40 e0 10 ff                 # a33a |   mov B, [0xff10]
61 60 e0 12 ff                 # a33f |   mov C, [0xff12]
61 80 e0 14 ff                 # a344 |   mov D, [0xff14]
61 20 bc 0e                    # a349 |   mov A, [SP + 0xe]
60 ff 00                       # a34d |   mov H, 0
                               #      | _A_if_9:
fc 28 20 f8 09 00              # a350 |   jge A + B, A, ${_E_if_9}:rel + PC
c4 ff 00                       # a356 |   inc H, 0
                               #      | _E_if_9:
                               #      | _C_if_9:
                               #      | _Z_if_9:
60 40 44                       # a359 |   mov B, B + A
81 20 bc ff 0c                 # a35c |   add A, [SP + 0xc], H
60 ff 00                       # a361 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # a364 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # a36a |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # a370 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # a374 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # a377 |   mov C, C + A
81 20 bc ff 0a                 # a37a |   add A, [SP + 0xa], H
60 80 84                       # a37f |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # a382 |   mov A, [SP + 0x10]
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 14 ff                 # a386 |   mov H, [0xff14]
                               #      | _A_if_12:
f4 ff 80 f8 0a 00              # a38b |   jle H, D, ${_E_if_12}:rel + PC
58 f8 33 00                    # a391 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_12:
ec ff 80 f8 2b 00              # a395 |   jne H, D, ${_E2_if_12}:rel + PC
61 ff e0 12 ff                 # a39b |   mov H, [0xff12]
                               #      | _A_if_13:
f4 ff 60 f8 0a 00              # a3a0 |   jle H, C, ${_E_if_13}:rel + PC
58 f8 1e 00                    # a3a6 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_13:
ec ff 60 f8 16 00              # a3aa |   jne H, C, ${_E2_if_13}:rel + PC
fa e0 40 f8 10 ff 14 00        # a3b0 |   jgt [0xff10], B, ${_C_loop_2}:rel + PC
                               #      | _A_if_15:
e8 20 00 f8 08 00              # a3b8 |   jeq A, 0, ${_E_if_15}:rel + PC
5c 20                          # a3be |   call A
                               #      | _E_if_15:
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _E2_if_13:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _E2_if_12:
                               #      | _C_if_12:
                               #      | _Z_if_12:
                               #      | _BZ_loop_2:
58 f8 c6 ff                    # a3c0 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # a3c4 |   pop A
e4 40                          # a3c6 |   pop B
e4 60                          # a3c8 |   pop C
e4 80                          # a3ca |   pop D
dc                             # a3cc |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_data_1:
54 65 73 74 62 65 64 0a 00     # a3cd |   .data str:"Testbed\n"
                               #      | const_data_2:
64 65 6c 61 79 20 25 64 0a 00  # a3d6 |   .data str:"delay %d\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa3e0
                               #      | SECTION_BEGIN_static_data:
                               #      | var_VIDEO_ROW_BUFFER:
                               # a3e0 |   .bss size:1280 align:16
                               #      | var_test_loop_target_v:
                               # a8e0 |   .bss size:2 align:1
                               #      | var_var_1:
                               # a8e2 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
