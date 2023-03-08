                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_32:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_32:
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
e0 e0 00 aa                    # a012 |   push ${const_data_1}
5c f8 65 01                    # a016 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01a |   mov SP, SP + 0x2
                               #      | _Z_call_2:
60 a0 bc e0                    # a01e |   mov SP, SP + -32
                               #      | _A_call_3:
e0 fd                          # a022 |   push F
e0 fc                          # a024 |   push E
e0 1c 0c                       # a026 |   push 0xc
e0 1c 10                       # a029 |   push 0x10
e0 e0 bc a6                    # a02c |   push ${const_FONT_16_12_COMPRESSED} + 0171
e0 bc 0a                       # a030 |   push SP + 0xa
5c f8 82 01                    # a033 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # a037 |   mov SP, SP + 0x8
e4 fc                          # a03b |   pop E
e4 fd                          # a03d |   pop F
                               #      | _Z_call_3:
                               #      | _A_for_3:
60 20 a0                       # a03f |   mov A, SP
                               #      | _BA_for_3:
e8 20 bc f8 20 1d 00           # a042 |   jeq A, SP + 0x20, ${_C_for_3}:rel + PC
                               #      | _A_call_13:
e2 20                          # a049 |   push [A]
e0 e0 09 aa                    # a04b |   push ${const_data_2}
5c f8 2a 02                    # a04f |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a053 |   mov SP, SP + 0x4
                               #      | _Z_call_13:
                               #      | _BZ_for_3:
60 20 3c 02                    # a057 |   mov A, A + 0x2
58 f8 e7 ff                    # a05b |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _A_call_14:
e0 1c 04                       # a05f |   push 0x4
e0 1c 0a                       # a062 |   push 0xa
5c f8 c1 03                    # a065 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a069 |   mov SP, SP + 0x4
                               #      | _Z_call_14:
                               #      | _A_call_16:
e0 a0                          # a06d |   push SP
e0 1c 01                       # a06f |   push 0x1
5c f8 d6 03                    # a072 |   call ${fn_fill_cell_content}:rel + PC
60 a0 bc 04                    # a076 |   mov SP, SP + 0x4
                               #      | _Z_call_16:
                               #      | _A_call_17:
e0 1c 06                       # a07a |   push 0x6
e0 00                          # a07d |   push 0
5c f8 a7 03                    # a07f |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a083 |   mov SP, SP + 0x4
                               #      | _Z_call_17:
                               #      | _A_call_18:
e0 e0 0f 0f                    # a087 |   push 0xf0f
e0 00                          # a08b |   push 0
5c f8 fc 03                    # a08d |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a091 |   mov SP, SP + 0x4
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 1c ff                       # a095 |   push -1
e0 1c 01                       # a098 |   push 0x1
5c f8 ee 03                    # a09b |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a09f |   mov SP, SP + 0x4
                               #      | _Z_call_19:
                               #      | _A_call_20:
e0 e0 aa aa                    # a0a3 |   push 0xaaaa
e0 1c 02                       # a0a7 |   push 0x2
5c f8 df 03                    # a0aa |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0ae |   mov SP, SP + 0x4
                               #      | _Z_call_20:
                               #      | _A_call_21:
e0 1c 05                       # a0b2 |   push 0x5
e0 1c 02                       # a0b5 |   push 0x2
5c f8 6e 03                    # a0b8 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0bc |   mov SP, SP + 0x4
                               #      | _Z_call_21:
                               #      | _A_call_22:
e0 e0 0f 0f                    # a0c0 |   push 0xf0f
e0 00                          # a0c4 |   push 0
5c f8 c3 03                    # a0c6 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0ca |   mov SP, SP + 0x4
                               #      | _Z_call_22:
                               #      | _A_call_23:
e0 1c ff                       # a0ce |   push -1
e0 1c 01                       # a0d1 |   push 0x1
5c f8 b5 03                    # a0d4 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0d8 |   mov SP, SP + 0x4
                               #      | _Z_call_23:
                               #      | _A_call_24:
e0 e0 aa aa                    # a0dc |   push 0xaaaa
e0 1c 02                       # a0e0 |   push 0x2
5c f8 a6 03                    # a0e3 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0e7 |   mov SP, SP + 0x4
                               #      | _Z_call_24:
                               #      | _A_for_9:
60 20 00                       # a0eb |   mov A, 0
                               #      | _BA_for_9:
                               #      | _A_if_9:
ec 20 00 f8 18 00              # a0ee |   jne A, 0, ${_E_if_9}:rel + PC
                               #      | _A_call_25:
e0 1c 07                       # a0f4 |   push 0x7
e0 1c 05                       # a0f7 |   push 0x5
5c f8 2c 03                    # a0fa |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0fe |   mov SP, SP + 0x4
                               #      | _Z_call_25:
58 f8 12 00                    # a102 |   jmp ${_C_if_9}:rel + PC
                               #      | _E_if_9:
                               #      | _A_call_26:
e0 1c 04                       # a106 |   push 0x4
e0 1c 05                       # a109 |   push 0x5
5c f8 1a 03                    # a10c |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a110 |   mov SP, SP + 0x4
                               #      | _Z_call_26:
                               #      | _C_if_9:
                               #      | _Z_if_9:
                               #      | _A_call_27:
e0 e0 0f 0f                    # a114 |   push 0xf0f
e0 00                          # a118 |   push 0
5c f8 6f 03                    # a11a |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a11e |   mov SP, SP + 0x4
                               #      | _Z_call_27:
                               #      | _A_call_28:
e0 e0 a0 a0                    # a122 |   push 0xa0a0
e0 1c 01                       # a126 |   push 0x1
5c f8 60 03                    # a129 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a12d |   mov SP, SP + 0x4
                               #      | _Z_call_28:
                               #      | _A_call_29:
e0 e0 cc cc                    # a131 |   push 0xcccc
e0 1c 02                       # a135 |   push 0x2
5c f8 51 03                    # a138 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a13c |   mov SP, SP + 0x4
                               #      | _Z_call_29:
                               #      | _A_call_30:
e0 e0 aa aa                    # a140 |   push 0xaaaa
e0 1c 03                       # a144 |   push 0x3
5c f8 42 03                    # a147 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a14b |   mov SP, SP + 0x4
                               #      | _Z_call_30:
62 e0 00 20 af                 # a14f |   mov [${var_test_loop_target_v}], 0
                               #      | _A_call_31:
e0 00                          # a154 |   push 0
e0 e0 00 87                    # a156 |   push 0x8700
e0 e0 93 03                    # a15a |   push 0x393
e0 00                          # a15e |   push 0
5c f8 50 03                    # a160 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # a164 |   mov SP, SP + 0x8
                               #      | _Z_call_31:
                               #      | _BZ_for_9:
3c 20                          # a168 |   not A
58 f8 84 ff                    # a16a |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
                               #      | _cleanup_fn_main:
60 a0 bc 20                    # a16e |   mov SP, SP + 0x20
e4 20                          # a172 |   pop A
e4 40                          # a174 |   pop B
e4 60                          # a176 |   pop C
e4 80                          # a178 |   pop D
dc                             # a17a |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a17b |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a17d |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a181 |   bmov H, [A]
e8 ff 00 f8 16 00              # a184 |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a18a |   push H
5c f8 11 00                    # a18c |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a190 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a194 |   inc A
58 f8 eb ff                    # a196 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a19a |   pop A
dc                             # a19c |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a19d |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a1a4 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a1aa |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a1ae |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a1b4 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # a1b5 |   push D
e0 60                          # a1b7 |   push C
e0 40                          # a1b9 |   push B
e0 20                          # a1bb |   push A
61 fc bc 0a                    # a1bd |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # a1c1 |   shl F, [SP + 0xe], 0x1
00 fd fc                       # a1c7 |   add F, E
61 fe bc 0c                    # a1ca |   mov G, [SP + 0xc]
61 40 fe                       # a1ce |   mov B, [G]
60 60 1c 07                    # a1d1 |   mov C, 0x7
60 20 00                       # a1d5 |   mov A, 0
60 a0 bc fe                    # a1d8 |   mov SP, SP + -2
                               #      | _A_for_2:
                               #      | _BA_for_2:
fc fc fd f8 90 00              # a1dc |   jge E, F, ${_C_for_2}:rel + PC
                               #      |   # decode one line
60 20 00                       # a1e2 |   mov A, 0
62 a0 1c ff                    # a1e5 |   mov [SP], -1
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_if_3:
ec 60 1c f8 ff 10 00           # a1e9 |   jne C, -1, ${_E_if_3}:rel + PC
44 fe                          # a1f0 |   inc G
61 40 fe                       # a1f2 |   mov B, [G]
60 60 1c 07                    # a1f5 |   mov C, 0x7
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
98 80 40 60                    # a1f9 |   getb D, B, C
48 60                          # a1fd |   dec C
40 80                          # a1ff |   bool D
b0 20 21 80                    # a201 |   or A, A*2, D
4a a0                          # a205 |   dec [SP]
                               #      | _A_if_4:
ee a0 00 f8 1b 00              # a207 |   jne [SP], 0, ${_E_if_4}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # a20d |   mov H, A
b9 20 bc 12                    # a210 |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # a214 |   shr A, -1, A + 0x10
ae fc ff 20                    # a21a |   and [E], H, A
58 f8 46 00                    # a21e |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_4:
ec 20 00 f8 12 00              # a222 |   jne A, 0, ${_E2_if_4}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # a228 |   sub H, E, 0x2
63 fc ff                       # a22d |   mov [E], [H]
58 f8 34 00                    # a230 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E2_if_4:
ec 20 1c f8 02 13 00           # a234 |   jne A, 0x2, ${_E3_if_4}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # a23b |   sub H, E, 0x4
63 fc ff                       # a240 |   mov [E], [H]
58 f8 21 00                    # a243 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E3_if_4:
ec 20 1c f8 06 0e 00           # a247 |   jne A, 0x6, ${_E4_if_4}:rel + PC
                               #      |   # all zeros
62 fc 00                       # a24e |   mov [E], 0
58 f8 13 00                    # a251 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E4_if_4:
ec 20 1c f8 07 0b 00           # a255 |   jne A, 0x7, ${_E5_if_4}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # a25c |   mov [SP], [SP + 0x12]
                               #      | _E5_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _BZ_loop_2:
58 f8 89 ff                    # a260 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _BZ_for_2:
00 fc 1c 02                    # a264 |   add E, 0x2
58 f8 74 ff                    # a268 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # a26c |   mov SP, SP + 0x2
e4 20                          # a270 |   pop A
e4 40                          # a272 |   pop B
e4 60                          # a274 |   pop C
e4 80                          # a276 |   pop D
dc                             # a278 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # a279 |   push C
e0 40                          # a27b |   push B
e0 20                          # a27d |   push A
60 a0 bc ee                    # a27f |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # a283 |   mov B, SP + 0x1c
                               #      | _A_for_4:
61 20 bc 1a                    # a287 |   mov A, [SP + 0x1a]
                               #      | _BA_for_4:
65 60 20                       # a28b |   bmov C, [A]
e8 60 00 f8 b5 00              # a28e |   jeq C, 0, ${_C_for_4}:rel + PC
                               #      |   # normal char
                               #      | _A_if_6:
e8 60 1c f8 25 15 00           # a294 |   jeq C, 0x25, ${_E_if_6}:rel + PC
                               #      | _A_call_4:
e0 60                          # a29b |   push C
5c f8 00 ff                    # a29d |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a2a1 |   mov SP, SP + 0x2
                               #      | _Z_call_4:
58 f8 98 00                    # a2a5 |   jmp ${_BZ_for_4}:rel + PC
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      |   # format specifier
44 20                          # a2a9 |   inc A
65 60 20                       # a2ab |   bmov C, [A]
                               #      | _A_if_7:
ec 60 00 f8 0e 00              # a2ae |   jne C, 0, ${_E_if_7}:rel + PC
58 f8 8f 00                    # a2b4 |   jmp ${_C_for_4}:rel + PC
58 f8 85 00                    # a2b8 |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
ec 60 1c f8 64 25 00           # a2bc |   jne C, 0x64, ${_E2_if_7}:rel + PC
                               #      |   # format %d
                               #      | _A_call_5:
e0 a0                          # a2c3 |   push SP
e2 40                          # a2c5 |   push [B]
5c f8 87 00                    # a2c7 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # a2cb |   mov SP, SP + 0x4
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 a0                          # a2cf |   push SP
5c f8 aa fe                    # a2d1 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a2d5 |   mov SP, SP + 0x2
                               #      | _Z_call_6:
60 40 5c 02                    # a2d9 |   mov B, B + 0x2
58 f8 60 00                    # a2dd |   jmp ${_C_if_7}:rel + PC
                               #      | _E2_if_7:
ec 60 1c f8 78 25 00           # a2e1 |   jne C, 0x78, ${_E3_if_7}:rel + PC
                               #      |   # format %x
                               #      | _A_call_8:
e0 a0                          # a2e8 |   push SP
e2 40                          # a2ea |   push [B]
5c f8 af 00                    # a2ec |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a2f0 |   mov SP, SP + 0x4
                               #      | _Z_call_8:
                               #      | _A_call_9:
e0 a0                          # a2f4 |   push SP
5c f8 85 fe                    # a2f6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a2fa |   mov SP, SP + 0x2
                               #      | _Z_call_9:
60 40 5c 02                    # a2fe |   mov B, B + 0x2
58 f8 3b 00                    # a302 |   jmp ${_C_if_7}:rel + PC
                               #      | _E3_if_7:
ec 60 1c f8 62 25 00           # a306 |   jne C, 0x62, ${_E4_if_7}:rel + PC
                               #      |   # format %b
                               #      | _A_call_10:
e0 a0                          # a30d |   push SP
e2 40                          # a30f |   push [B]
5c f8 e0 00                    # a311 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # a315 |   mov SP, SP + 0x4
                               #      | _Z_call_10:
                               #      | _A_call_11:
e0 a0                          # a319 |   push SP
5c f8 60 fe                    # a31b |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a31f |   mov SP, SP + 0x2
                               #      | _Z_call_11:
60 40 5c 02                    # a323 |   mov B, B + 0x2
58 f8 16 00                    # a327 |   jmp ${_C_if_7}:rel + PC
                               #      | _E4_if_7:
ec 60 1c f8 25 12 00           # a32b |   jne C, 0x25, ${_E5_if_7}:rel + PC
                               #      |   # format %%
                               #      | _A_call_12:
e0 1c 25                       # a332 |   push 0x25
5c f8 68 fe                    # a335 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a339 |   mov SP, SP + 0x2
                               #      | _Z_call_12:
                               #      | _E5_if_7:
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _BZ_for_4:
44 20                          # a33d |   inc A
58 f8 4c ff                    # a33f |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # a343 |   mov SP, SP + 0x12
e4 20                          # a347 |   pop A
e4 40                          # a349 |   pop B
e4 60                          # a34b |   pop C
dc                             # a34d |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # a34e |   push C
e0 40                          # a350 |   push B
e0 20                          # a352 |   push A
61 20 bc 0a                    # a354 |   mov A, [SP + 0xa]
62 20 1c 30                    # a358 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # a35c |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # a360 |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # a366 |   div C, B, 0xa
82 20 ff 1c 30                 # a36b |   add [A], H, 0x30
44 20                          # a370 |   inc A
60 40 60                       # a372 |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # a375 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # a379 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # a37d |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # a383 |   dec A
61 40 60                       # a385 |   mov B, [C]
67 60 20                       # a388 |   bmov [C], [A]
66 20 40                       # a38b |   bmov [A], B
44 60                          # a38e |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # a390 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # a394 |   pop A
e4 40                          # a396 |   pop B
e4 60                          # a398 |   pop C
dc                             # a39a |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # a39b |   push C
e0 40                          # a39d |   push B
e0 20                          # a39f |   push A
61 40 bc 08                    # a3a1 |   mov B, [SP + 0x8]
61 60 bc 0a                    # a3a5 |   mov C, [SP + 0xa]
                               #      | _A_for_5:
60 20 1c 03                    # a3a9 |   mov A, 0x3
                               #      | _BA_for_5:
e8 20 1c f8 ff 24 00           # a3ad |   jeq A, -1, ${_C_for_5}:rel + PC
a0 ff 40 22                    # a3b4 |   shr H, B, A*4
2c ff 1c 0f                    # a3b8 |   and H, 0xf
                               #      | _A_call_7:
e0 ff                          # a3bc |   push H
5c f8 1a 00                    # a3be |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # a3c2 |   mov SP, SP + 0x2
                               #      | _Z_call_7:
62 60 ff                       # a3c6 |   mov [C], H
44 60                          # a3c9 |   inc C
                               #      | _BZ_for_5:
48 20                          # a3cb |   dec A
58 f8 e0 ff                    # a3cd |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # a3d1 |   pop A
e4 40                          # a3d3 |   pop B
e4 60                          # a3d5 |   pop C
dc                             # a3d7 |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_8:
fa bc 1c f8 02 09 12 00        # a3d8 |   jgt [SP + 0x2], 0x9, ${_E_if_8}:rel + PC
81 ff bc 1c 02 30              # a3e0 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # a3e6 |   jmp ${_C_if_8}:rel + PC
                               #      | _E_if_8:
81 ff bc 1c 02 57              # a3ea |   add H, [SP + 0x2], 0x57
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # a3f0 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # a3f1 |   push C
e0 40                          # a3f3 |   push B
e0 20                          # a3f5 |   push A
61 40 bc 08                    # a3f7 |   mov B, [SP + 0x8]
61 60 bc 0a                    # a3fb |   mov C, [SP + 0xa]
                               #      | _A_for_6:
60 20 1c 0f                    # a3ff |   mov A, 0xf
                               #      | _BA_for_6:
e8 20 1c f8 ff 1c 00           # a403 |   jeq A, -1, ${_C_for_6}:rel + PC
a0 ff 40 20                    # a40a |   shr H, B, A
2c ff 1c 01                    # a40e |   and H, 0x1
82 60 ff 1c 30                 # a412 |   add [C], H, 0x30
44 60                          # a417 |   inc C
                               #      | _BZ_for_6:
48 20                          # a419 |   dec A
58 f8 e8 ff                    # a41b |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # a41f |   pop A
e4 40                          # a421 |   pop B
e4 60                          # a423 |   pop C
dc                             # a425 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # a426 |   push B
e0 20                          # a428 |   push A
61 20 bc 08                    # a42a |   mov A, [SP + 0x8]
60 20 e4 f0 00                 # a42e |   mov A, 0xf0 + A
89 40 bc e0 06 00 05           # a433 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 20 aa 1f af 01     # a43a |   mmap ${var_VIDEO_ROW_BUFFER}, ${var_VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # a443 |   pop A
e4 40                          # a445 |   pop B
dc                             # a447 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell_content:
                               #      | _begin_fn_fill_cell_content:
e0 40                          # a448 |   push B
e0 20                          # a44a |   push A
a9 20 bc 1c 06 01              # a44c |   shl A, [SP + 0x6], 0x1
61 40 bc 08                    # a452 |   mov B, [SP + 0x8]
                               #      | _A_for_7:
60 20 e4 20 aa                 # a456 |   mov A, ${var_VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_7:
fc 20 e0 f8 20 af 29 00        # a45b |   jge A, ${var_VIDEO_ROW_BUFFER} + 0500, ${_C_for_7}:rel + PC
62 20 e0 ff aa                 # a463 |   mov [A], 0xaaff
                               #      | _A_call_15:
e2 20                          # a468 |   push [A]
e0 20                          # a46a |   push A
e0 e0 0d aa                    # a46c |   push ${const_data_3}
5c f8 09 fe                    # a470 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a474 |   mov SP, SP + 0x6
                               #      | _Z_call_15:
                               #      | _BZ_for_7:
60 20 3c 50                    # a478 |   mov A, A + 0x50
60 40 5c 02                    # a47c |   mov B, B + 0x2
58 f8 db ff                    # a480 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_fill_cell_content:
e4 20                          # a484 |   pop A
e4 40                          # a486 |   pop B
dc                             # a488 |   ret
                               #      | _end_fn_fill_cell_content:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # a489 |   push A
61 fe bc 06                    # a48b |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # a48f |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_8:
60 20 e4 20 aa                 # a495 |   mov A, ${var_VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_8:
fc 20 e0 f8 20 af 13 00        # a49a |   jge A, ${var_VIDEO_ROW_BUFFER} + 0500, ${_C_for_8}:rel + PC
62 20 fe                       # a4a2 |   mov [A], G
                               #      | _BZ_for_8:
60 20 3c 50                    # a4a5 |   mov A, A + 0x50
58 f8 f1 ff                    # a4a9 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # a4ad |   pop A
dc                             # a4af |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # a4b0 |   push D
e0 60                          # a4b2 |   push C
e0 40                          # a4b4 |   push B
e0 20                          # a4b6 |   push A
61 40 e0 10 ff                 # a4b8 |   mov B, [0xff10]
61 60 e0 12 ff                 # a4bd |   mov C, [0xff12]
61 80 e0 14 ff                 # a4c2 |   mov D, [0xff14]
61 20 bc 0e                    # a4c7 |   mov A, [SP + 0xe]
60 ff 00                       # a4cb |   mov H, 0
                               #      | _A_if_10:
fc 28 20 f8 09 00              # a4ce |   jge A + B, A, ${_E_if_10}:rel + PC
c4 ff 00                       # a4d4 |   inc H, 0
                               #      | _E_if_10:
                               #      | _C_if_10:
                               #      | _Z_if_10:
60 40 44                       # a4d7 |   mov B, B + A
81 20 bc ff 0c                 # a4da |   add A, [SP + 0xc], H
60 ff 00                       # a4df |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # a4e2 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # a4e8 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # a4ee |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # a4f2 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # a4f5 |   mov C, C + A
81 20 bc ff 0a                 # a4f8 |   add A, [SP + 0xa], H
60 80 84                       # a4fd |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # a500 |   mov A, [SP + 0x10]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 ff e0 14 ff                 # a504 |   mov H, [0xff14]
                               #      | _A_if_13:
f4 ff 80 f8 0a 00              # a509 |   jle H, D, ${_E_if_13}:rel + PC
58 f8 33 00                    # a50f |   jmp ${_C_loop_3}:rel + PC
                               #      | _E_if_13:
ec ff 80 f8 2b 00              # a513 |   jne H, D, ${_E2_if_13}:rel + PC
61 ff e0 12 ff                 # a519 |   mov H, [0xff12]
                               #      | _A_if_14:
f4 ff 60 f8 0a 00              # a51e |   jle H, C, ${_E_if_14}:rel + PC
58 f8 1e 00                    # a524 |   jmp ${_C_loop_3}:rel + PC
                               #      | _E_if_14:
ec ff 60 f8 16 00              # a528 |   jne H, C, ${_E2_if_14}:rel + PC
fa e0 40 f8 10 ff 14 00        # a52e |   jgt [0xff10], B, ${_C_loop_3}:rel + PC
                               #      | _A_if_16:
e8 20 00 f8 08 00              # a536 |   jeq A, 0, ${_E_if_16}:rel + PC
5c 20                          # a53c |   call A
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
58 f8 c6 ff                    # a53e |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # a542 |   pop A
e4 40                          # a544 |   pop B
e4 60                          # a546 |   pop C
e4 80                          # a548 |   pop D
dc                             # a54a |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_FONT_16_12_COMPRESSED:
00 00 38 10 01 8e 04 10 e4 40 60 00 39 10 1f fe 23 ff c4 60 38 40 77 f0 f1 11 e2 01 df c3 84 41 e2 23 bf 87 08 0c 1f 81 3f 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 0e 3c 1c 60 38 e0 72 20 71 c0 e1 01 c7 0b 91 e7 20 83 8f f6 00 e0 40 e1 81 80 00 38 0c 70 60 e1 00 07 06 0e 03 18 39 80 70 c0 e0 40 07 0c 0e 60 18 0e 60 dc 36 38 10 73 fe b8 6c 73 06 c0 07 02 07 3f e9 80 00 1c 20 1c c0 30 01 cf e2 00 00 0e 10 10 38 04 38 08 70 20 70 40 70 80 71 00 e4 00 c0 38 f8 72 08 72 18 e4 51 c9 23 94 47 30 8e 41 0e 3e 18 38 10 70 e0 e6 41 c0 80 0e 7f 18 38 f8 72 08 70 08 38 38 71 80 e4 00 e7 f1 80 38 f8 72 08 e0 10 70 f0 8e 41 1c 7c 30 38 0c 70 28 e0 91 c2 23 88 47 20 83 9f c7 00 86 00 39 fc 72 00 39 f8 70 08 1c 82 38 f8 60 38 f0 72 00 39 f8 72 08 0e 3e 18 39 fc 72 08 e0 11 c0 41 c0 81 c1 01 c2 01 80 38 f8 72 08 1c 7c 21 c7 c3 00 38 f8 72 08 0e 3f 1c 02 1c 0c 39 e0 60 07 08 08 38 40 40 07 08 08 38 40 39 80 60 1c 03 38 18 70 c0 e6 01 f0 02 e1 81 c0 c3 80 66 00 07 3f 88 e7 f1 00 1f 00 39 80 70 c0 e0 61 c0 32 e1 81 cc 03 e0 06 00 38 f8 72 08 70 08 70 70 e1 00 ce 10 10 38 f8 72 08 e4 f1 ca 20 39 3c 72 00 e3 f1 80 38 f8 72 08 1c fe 20 c0 39 f8 72 08 39 f8 41 cf c3 00 38 f8 72 08 e4 00 07 20 8e 3e 18 39 e0 72 30 e4 10 07 23 0e 78 18 39 fc 72 00 1c f8 21 cf e3 00 39 fc 72 00 1c f8 20 c0 38 f8 72 08 e4 00 72 38 e4 10 38 f8 60 39 04 07 3f 88 30 38 7c 70 20 00 e1 f1 80 38 1c 70 08 03 90 43 8f 86 00 39 04 72 10 e4 41 c9 03 94 07 30 0b 92 07 22 0e 42 1c 82 30 39 00 00 39 fc 60 3c 04 7c 18 f4 51 e5 23 c4 47 80 80 60 39 04 39 84 72 88 e4 91 c8 a3 90 c7 20 81 80 38 f8 72 08 00 e3 e1 80 39 f8 72 08 1c fc 39 00 06 00 38 f8 72 08 00 e3 e1 c1 83 80 c6 39 f8 72 08 1c fc 39 40 72 40 e4 41 c8 43 90 46 00 38 f8 72 08 e4 00 71 f0 e0 10 72 08 e3 e1 80 39 ff 70 20 00 60 39 04 00 38 f8 60 3c 04 1d 04 1c 88 1c 50 1c 20 18 3c 04 03 c4 47 94 8f 45 1f 06 3c 04 60 3c 04 74 10 e4 41 c5 03 84 01 c5 03 91 07 41 0f 01 18 3c 04 74 10 e4 41 c5 03 84 00 18 39 fc 70 08 70 10 e0 41 c1 03 84 07 10 0e 40 0e 7f 18 38 70 70 80 00 e1 c1 80 1c 80 38 80 70 80 e0 81 c0 83 80 87 00 8e 00 9c 00 b8 00 e0 39 c0 70 80 00 e7 01 80 70 c0 e6 61 f0 33 00 00 00 03 9f c4 e1 00 e0 c1 80 00 07 0f 0e 01 0e 3f 1c 82 0e 3f 18 39 00 1c fc 39 04 03 9f 86 00 07 1f 0e 41 1c 80 07 20 8e 3e 18 38 04 1c 7e 39 04 03 8f c6 00 07 1f 0e 41 07 3f 8e 40 1c 82 38 f8 60 38 3c 70 80 73 e0 80 c0 07 1f 8e 41 00 e3 f1 c0 21 cf c0 39 00 1c fc 39 04 01 80 38 10 4e 1c 1c 08 01 c3 e3 00 38 10 4e 04 00 1c 88 38 e0 00 39 00 1c 86 39 30 73 80 e6 01 cb 03 91 87 20 8e 40 98 38 70 70 20 00 e1 f1 80 07 ff 0f 11 00 60 07 3f 0e 41 00 60 07 1f 0e 41 00 e3 e1 80 07 3f 0e 41 00 e7 e1 c8 00 07 1f 8e 41 00 e3 f1 c0 20 07 27 8e 70 1c 80 01 80 07 1f 0e 41 1c 80 38 f8 70 08 72 08 e3 e1 80 38 40 1c fe 20 70 78 c0 07 20 80 38 fc 60 07 80 87 41 07 22 07 14 0e 10 18 07 80 83 c4 40 ee e1 80 07 80 8e 82 1c 88 38 e0 71 40 e4 41 d0 43 c0 46 00 07 20 80 38 fc 70 08 70 f0 07 3f 8e 01 1c 04 38 10 70 40 e1 01 c4 03 9f c6 00 38 3c 70 80 1c c0 21 c1 e3 00 38 10 00 18 39 e0 70 20 1c 06 21 cf 03 00 71 c8 e4 e1 80 00 00 00 # a54b |   .data raw:
                               #      | const_FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # a940 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const_data_1:
54 65 73 74 62 65 64 0a 00     # aa00 |   .data str:"Testbed\n"
                               #      | const_data_2:
25 62 0a 00                    # aa09 |   .data str:"%b\n"
                               #      | const_data_3:
25 78 20 3d 20 25 78 0a 00     # aa0d |   .data str:"%x = %x\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xaa16
                               #      | SECTION_BEGIN_static_data:
                               # aa16 |   .align dummy_size:10 align:16
                               #      | var_VIDEO_ROW_BUFFER:
                               # aa20 |   .bss size:1280 align:16
                               #      | var_test_loop_target_v:
                               # af20 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
