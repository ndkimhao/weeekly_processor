                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_19:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_19:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
                               #      | _A_syscall_1:
60 ff 1c 1a                    # 500a |   mov H, 0x1a
5e e0 1e ff                    # 500e |   call [0xff1e]
                               #      | _Z_syscall_1:
                               #      | _A_syscall_2:
e0 e0 e1 59                    # 5012 |   push ${const__data_1}
e0 00                          # 5016 |   push 0
e0 00                          # 5018 |   push 0
60 ff 1c 1c                    # 501a |   mov H, 0x1c
5e e0 1e ff                    # 501e |   call [0xff1e]
60 a0 bc 06                    # 5022 |   mov SP, SP + 0x6
                               #      | _Z_syscall_2:
                               #      | _A_syscall_3:
60 ff 1c 16                    # 5026 |   mov H, 0x16
5e e0 1e ff                    # 502a |   call [0xff1e]
                               #      | _Z_syscall_3:
                               #      | _A_if_1:
ec fe 00 f8 0e 00              # 502e |   jne G, 0, ${_E_if_1}:rel + PC
                               #      | _A_call_1:
5c f8 38 00                    # 5034 |   call ${fn_sd_error}:rel + PC
                               #      | _Z_call_1:
58 f8 19 00                    # 5038 |   jmp ${_C_if_1}:rel + PC
                               #      | _E_if_1:
                               #      | _A_syscall_6:
e0 e0 f3 59                    # 503c |   push ${const__data_3}
e0 00                          # 5040 |   push 0
e0 1c 01                       # 5042 |   push 0x1
60 ff 1c 1c                    # 5045 |   mov H, 0x1c
5e e0 1e ff                    # 5049 |   call [0xff1e]
60 a0 bc 06                    # 504d |   mov SP, SP + 0x6
                               #      | _Z_syscall_6:
                               #      | _C_if_1:
                               #      | _Z_if_1:
62 e0 00 10 69                 # 5051 |   mov [${var__var_1}], 0
                               #      | _A_call_14:
e2 e0 10 69                    # 5056 |   push [${var__var_1}]
5c f8 31 00                    # 505a |   call ${fn_show_image}:rel + PC
60 a0 bc 02                    # 505e |   mov SP, SP + 0x2
                               #      | _Z_call_14:
62 e0 00 40 6d                 # 5062 |   mov [${var__var_2}], 0
                               #      | _A_call_18:
5c f8 3b 04                    # 5067 |   call ${fn_main_loop}:rel + PC
                               #      | _Z_call_18:
                               #      | _cleanup_fn_main:
dc                             # 506b |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_sd_error:
                               #      | _begin_fn_sd_error:
                               #      | _A_syscall_4:
60 ff 1c 1a                    # 506c |   mov H, 0x1a
5e e0 1e ff                    # 5070 |   call [0xff1e]
                               #      | _Z_syscall_4:
                               #      | _A_syscall_5:
e0 e0 ea 59                    # 5074 |   push ${const__data_2}
e0 00                          # 5078 |   push 0
e0 1c 01                       # 507a |   push 0x1
60 ff 1c 1c                    # 507d |   mov H, 0x1c
5e e0 1e ff                    # 5081 |   call [0xff1e]
60 a0 bc 06                    # 5085 |   mov SP, SP + 0x6
                               #      | _Z_syscall_5:
d8                             # 5089 |   halt
                               #      | _cleanup_fn_sd_error:
dc                             # 508a |   ret
                               #      | _end_fn_sd_error:
                               #      | 
                               #      | fn_show_image:
                               #      | _begin_fn_show_image:
e0 80                          # 508b |   push D
e0 60                          # 508d |   push C
e0 40                          # 508f |   push B
e0 20                          # 5091 |   push A
60 a0 bc fe                    # 5093 |   mov SP, SP + -2
bf a0 e0 0e ff                 # 5097 |   not [SP], [0xff0e]
a9 60 bc 1c 0c 08              # 509c |   shl C, [SP + 0xc], 0x8
                               #      | _A_syscall_7:
e0 60                          # 50a2 |   push C
e0 1c 01                       # 50a4 |   push 0x1
e0 e0 00 02                    # 50a7 |   push 0x200
e0 e0 20 69                    # 50ab |   push ${var__g_sd_buf}
60 ff 1c 14                    # 50af |   mov H, 0x14
5e e0 1e ff                    # 50b3 |   call [0xff1e]
60 a0 bc 08                    # 50b7 |   mov SP, SP + 0x8
                               #      | _Z_syscall_7:
                               #      | _A_if_2:
ec fe 00 f8 0a 00              # 50bb |   jne G, 0, ${_E_if_2}:rel + PC
                               #      | _A_call_2:
5c f8 ab ff                    # 50c1 |   call ${fn_sd_error}:rel + PC
                               #      | _Z_call_2:
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      | _A_if_3:
ea e0 e0 f8 20 69 a6 3a 11 00  # 50c5 |   jeq [${var__g_sd_buf}], 0x3aa6, ${_E_if_3}:rel + PC
60 fe 00                       # 50cf |   mov G, 0
58 f8 22 01                    # 50d2 |   jmp ${_cleanup_fn_show_image}:rel + PC
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
62 e0 00 2a 69                 # 50d6 |   mov [${var__g_sd_buf} + 000a], 0
62 e0 00 34 69                 # 50db |   mov [${var__g_sd_buf} + 0014], 0
                               #      | _A_syscall_8:
60 ff 1c 1a                    # 50e0 |   mov H, 0x1a
5e e0 1e ff                    # 50e4 |   call [0xff1e]
                               #      | _Z_syscall_8:
                               #      | _A_syscall_9:
e0 e0 22 69                    # 50e8 |   push ${var__g_sd_buf} + 0002
e0 00                          # 50ec |   push 0
e0 00                          # 50ee |   push 0
60 ff 1c 1c                    # 50f0 |   mov H, 0x1c
5e e0 1e ff                    # 50f4 |   call [0xff1e]
60 a0 bc 06                    # 50f8 |   mov SP, SP + 0x6
                               #      | _Z_syscall_9:
                               #      | _A_syscall_10:
e0 e0 2c 69                    # 50fc |   push ${var__g_sd_buf} + 000c
e0 00                          # 5100 |   push 0
e0 1c 01                       # 5102 |   push 0x1
60 ff 1c 1c                    # 5105 |   mov H, 0x1c
5e e0 1e ff                    # 5109 |   call [0xff1e]
60 a0 bc 06                    # 510d |   mov SP, SP + 0x6
                               #      | _Z_syscall_10:
                               #      | _A_call_9:
e0 1c 2d                       # 5111 |   push 0x2d
5c f8 03 01                    # 5114 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # 5118 |   mov SP, SP + 0x2
                               #      | _Z_call_9:
c6 e0 00 0a ff                 # 511c |   inc [0xff0a], 0
                               #      | _A_for_6:
60 20 00                       # 5121 |   mov A, 0
                               #      | _BA_for_6:
fc 20 1c f8 1e 24 00           # 5124 |   jge A, 0x1e, ${_C_for_6}:rel + PC
                               #      | _A_call_10:
e0 1c 08                       # 512b |   push 0x8
e0 20                          # 512e |   push A
5c f8 2f 03                    # 5130 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5134 |   mov SP, SP + 0x4
                               #      | _Z_call_10:
                               #      | _A_call_11:
e0 00                          # 5138 |   push 0
5c f8 47 03                    # 513a |   call ${fn_fill_page}:rel + PC
60 a0 bc 02                    # 513e |   mov SP, SP + 0x2
                               #      | _Z_call_11:
                               #      | _BZ_for_6:
44 20                          # 5142 |   inc A
58 f8 e0 ff                    # 5144 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_12:
e0 00                          # 5148 |   push 0
e0 00                          # 514a |   push 0
5c f8 13 03                    # 514c |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5150 |   mov SP, SP + 0x4
                               #      | _Z_call_12:
                               #      | _A_syscall_11:
e0 1c 30                       # 5154 |   push 0x30
e0 e0 36 69                    # 5157 |   push ${var__g_sd_buf} + 0016
e0 e0 10 5a                    # 515b |   push ${var__VIDEO_ROW_BUFFER}
60 ff 1c 0a                    # 515f |   mov H, 0xa
5e e0 1e ff                    # 5163 |   call [0xff1e]
60 a0 bc 06                    # 5167 |   mov SP, SP + 0x6
                               #      | _Z_syscall_11:
60 20 e0 a1 00                 # 516b |   mov A, 0xa1
60 40 00                       # 5170 |   mov B, 0
                               #      | _A_for_8:
c4 80 00                       # 5173 |   inc D, 0
                               #      | _BA_for_8:
fc 80 e0 f8 e2 00 7b 00        # 5176 |   jge D, 0xe2, ${_C_for_8}:rel + PC
                               #      | _A_syscall_12:
e0 70                          # 517e |   push C + D
e0 1c 01                       # 5180 |   push 0x1
e0 e0 00 02                    # 5183 |   push 0x200
e0 e0 20 69                    # 5187 |   push ${var__g_sd_buf}
60 ff 1c 14                    # 518b |   mov H, 0x14
5e e0 1e ff                    # 518f |   call [0xff1e]
60 a0 bc 08                    # 5193 |   mov SP, SP + 0x8
                               #      | _Z_syscall_12:
54 e0 e0 00 30 6b 30 6d        # 5197 |   mmap ${var__g_vid_chunk}, ${var__g_vid_chunk} + 0200, 0
                               #      | _A_syscall_13:
e0 e0 00 02                    # 519f |   push 0x200
e0 e0 20 69                    # 51a3 |   push ${var__g_sd_buf}
e0 e0 30 6b                    # 51a7 |   push ${var__g_vid_chunk}
60 ff 1c 0a                    # 51ab |   mov H, 0xa
5e e0 1e ff                    # 51af |   call [0xff1e]
60 a0 bc 06                    # 51b3 |   mov SP, SP + 0x6
                               #      | _Z_syscall_13:
ac ff 20 1c 0f                 # 51b7 |   and H, A, 0xf
28 ff 1c 01                    # 51bc |   shl H, 0x1
                               #      | _A_if_11:
f4 ff 1c f8 07 0f 00           # 51c0 |   jle H, 0x7, ${_E_if_11}:rel + PC
c4 ff 00                       # 51c7 |   inc H, 0
60 40 e8 00 02                 # 51ca |   mov B, 0x200 + B
                               #      | _E_if_11:
                               #      | _C_if_11:
                               #      | _Z_if_11:
b0 20 e0 ff a0 00              # 51cf |   or A, 0xa0, H
61 ff e0 0e ff                 # 51d5 |   mov H, [0xff0e]
2d ff a0                       # 51da |   and H, [SP]
                               #      | _A_if_12:
e8 ff 00 f8 0e 00              # 51dd |   jeq H, 0, ${_E_if_12}:rel + PC
60 fe 1c 02                    # 51e3 |   mov G, 0x2
58 f8 0d 00                    # 51e7 |   jmp ${_cleanup_fn_show_image}:rel + PC
                               #      | _E_if_12:
                               #      | _C_if_12:
                               #      | _Z_if_12:
                               #      | _BZ_for_8:
44 80                          # 51eb |   inc D
58 f8 89 ff                    # 51ed |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
c4 fe 00                       # 51f1 |   inc G, 0
                               #      | _cleanup_fn_show_image:
d4 00                          # 51f4 |   umap 0
                               #      | _A_scope_2:
e0 fe                          # 51f6 |   push G
                               #      | _B_scope_2:
                               #      | _A_call_13:
e0 1c 44                       # 51f8 |   push 0x44
5c f8 1c 00                    # 51fb |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # 51ff |   mov SP, SP + 0x2
                               #      | _Z_call_13:
62 e0 00 0a ff                 # 5203 |   mov [0xff0a], 0
                               #      | _C_scope_2:
e4 fe                          # 5208 |   pop G
                               #      | _Z_scope_2:
60 a0 bc 02                    # 520a |   mov SP, SP + 0x2
e4 20                          # 520e |   pop A
e4 40                          # 5210 |   pop B
e4 60                          # 5212 |   pop C
e4 80                          # 5214 |   pop D
dc                             # 5216 |   ret
                               #      | _end_fn_show_image:
                               #      | 
                               #      | fn_show_status:
                               #      | _begin_fn_show_status:
                               #      | _A_call_8:
e2 bc 02                       # 5217 |   push [SP + 0x2]
e0 1c 07                       # 521a |   push 0x7
e0 1c 01                       # 521d |   push 0x1
5c f8 09 00                    # 5220 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 5224 |   mov SP, SP + 0x6
                               #      | _Z_call_8:
                               #      | _cleanup_fn_show_status:
dc                             # 5228 |   ret
                               #      | _end_fn_show_status:
                               #      | 
                               #      | fn_draw_char_oled:
                               #      | _begin_fn_draw_char_oled:
e0 80                          # 5229 |   push D
e0 60                          # 522b |   push C
e0 40                          # 522d |   push B
e0 20                          # 522f |   push A
60 a0 bc e0                    # 5231 |   mov SP, SP + -32
                               #      | _A_call_4:
e2 bc 2e                       # 5235 |   push [SP + 0x2e]
e0 bc 02                       # 5238 |   push SP + 0x2
5c f8 95 00                    # 523b |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # 523f |   mov SP, SP + 0x4
                               #      | _Z_call_4:
ad 20 bc 1c 2a 01              # 5243 |   and A, [SP + 0x2a], 0x1
ad 40 bc 1c 2c 07              # 5249 |   and B, [SP + 0x2c], 0x7
28 40 1c 04                    # 524f |   shl B, 0x4
                               #      | _A_call_6:
e0 3d 01                       # 5253 |   push A*2 + 0x1
e0 21                          # 5256 |   push A*2
e0 1c 22                       # 5258 |   push 0x22
e0 5c 0f                       # 525b |   push B + 0xf
e0 40                          # 525e |   push B
e0 1c 21                       # 5260 |   push 0x21
e0 1c 06                       # 5263 |   push 0x6
5c f8 7e 01                    # 5266 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # 526a |   mov SP, SP + 0xe
                               #      | _Z_call_6:
                               #      | _A_for_3:
60 20 00                       # 526e |   mov A, 0
                               #      | _BA_for_3:
fc 20 1c f8 10 52 00           # 5271 |   jge A, 0x10, ${_C_for_3}:rel + PC
80 60 21 a0                    # 5278 |   add C, A*2, SP
                               #      | _A_for_4:
e0 20                          # 527c |   push A
60 40 00                       # 527e |   mov B, 0
                               #      | _BA_for_4:
fc 40 1c f8 10 38 00           # 5281 |   jge B, 0x10, ${_C_for_4}:rel + PC
60 20 00                       # 5288 |   mov A, 0
                               #      | _A_for_5:
60 80 1c 07                    # 528b |   mov D, 0x7
                               #      | _BA_for_5:
e8 80 1c f8 ff 17 00           # 528f |   jeq D, -1, ${_C_for_5}:rel + PC
99 fe 8d 40                    # 5296 |   getb G, [D*2 + C], B
40 fe                          # 529a |   bool G
b0 20 21 fe                    # 529c |   or A, A*2, G
                               #      | _BZ_for_5:
48 80                          # 52a0 |   dec D
58 f8 ed ff                    # 52a2 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _A_call_7:
e0 20                          # 52a6 |   push A
e0 1c 01                       # 52a8 |   push 0x1
5c f8 67 01                    # 52ab |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 52af |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _BZ_for_4:
44 40                          # 52b3 |   inc B
58 f8 cc ff                    # 52b5 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
e4 20                          # 52b9 |   pop A
                               #      | _Z_for_4:
                               #      | _BZ_for_3:
60 20 3c 08                    # 52bb |   mov A, A + 0x8
58 f8 b2 ff                    # 52bf |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_draw_char_oled:
60 a0 bc 20                    # 52c3 |   mov SP, SP + 0x20
e4 20                          # 52c7 |   pop A
e4 40                          # 52c9 |   pop B
e4 60                          # 52cb |   pop C
e4 80                          # 52cd |   pop D
dc                             # 52cf |   ret
                               #      | _end_fn_draw_char_oled:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # 52d0 |   push B
e0 20                          # 52d2 |   push A
61 20 bc 08                    # 52d4 |   mov A, [SP + 0x8]
60 40 1c 1f                    # 52d8 |   mov B, 0x1f
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 20 1c f8 20 13 00           # 52dc |   jlt A, 0x20, ${_C_scope_1}:rel + PC
fc 20 e0 f8 80 00 0c 00        # 52e3 |   jge A, 0x80, ${_C_scope_1}:rel + PC
60 40 3c e0                    # 52eb |   mov B, A + -32
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
28 40 1c 01                    # 52ef |   shl B, 0x1
61 40 e8 21 59                 # 52f3 |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_3:
e0 1c 0c                       # 52f8 |   push 0xc
e0 1c 10                       # 52fb |   push 0x10
e0 e8 2c 55                    # 52fe |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # 5302 |   push [SP + 0xc]
5c f8 0d 00                    # 5305 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # 5309 |   mov SP, SP + 0x8
                               #      | _Z_call_3:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # 530d |   pop A
e4 40                          # 530f |   pop B
dc                             # 5311 |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # 5312 |   push D
e0 60                          # 5314 |   push C
e0 40                          # 5316 |   push B
e0 20                          # 5318 |   push A
61 fc bc 0a                    # 531a |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # 531e |   shl F, [SP + 0xe], 0x1
00 fd fc                       # 5324 |   add F, E
61 fe bc 0c                    # 5327 |   mov G, [SP + 0xc]
61 40 fe                       # 532b |   mov B, [G]
60 60 1c 07                    # 532e |   mov C, 0x7
60 20 00                       # 5332 |   mov A, 0
60 a0 bc fe                    # 5335 |   mov SP, SP + -2
                               #      | _A_for_1:
                               #      | _BA_for_1:
fc fc fd f8 9e 00              # 5339 |   jge E, F, ${_C_for_1}:rel + PC
                               #      |   # decode one line
60 20 00                       # 533f |   mov A, 0
62 a0 1c ff                    # 5342 |   mov [SP], -1
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
                               #      | _A_if_6:
ec 60 1c f8 ff 10 00           # 5346 |   jne C, -1, ${_E_if_6}:rel + PC
44 fe                          # 534d |   inc G
61 40 fe                       # 534f |   mov B, [G]
60 60 1c 07                    # 5352 |   mov C, 0x7
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
98 80 40 60                    # 5356 |   getb D, B, C
48 60                          # 535a |   dec C
40 80                          # 535c |   bool D
b0 20 21 80                    # 535e |   or A, A*2, D
4a a0                          # 5362 |   dec [SP]
                               #      | _A_if_7:
ee a0 00 f8 1b 00              # 5364 |   jne [SP], 0, ${_E_if_7}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # 536a |   mov H, A
b9 20 bc 12                    # 536d |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # 5371 |   shr A, -1, A + 0x10
ae fc ff 20                    # 5377 |   and [E], H, A
58 f8 54 00                    # 537b |   jmp ${_C_loop_1}:rel + PC
                               #      | _E_if_7:
ec 20 00 f8 20 00              # 537f |   jne A, 0, ${_E2_if_7}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # 5385 |   sub H, E, 0x2
                               #      | _A_if_8:
f1 ff bc f8 0c 0e 00           # 538a |   jlt H, [SP + 0xc], ${_E_if_8}:rel + PC
63 fc ff                       # 5391 |   mov [E], [H]
58 f8 07 00                    # 5394 |   jmp ${_C_if_8}:rel + PC
                               #      | _E_if_8:
62 fc 00                       # 5398 |   mov [E], 0
                               #      | _C_if_8:
                               #      | _Z_if_8:
58 f8 34 00                    # 539b |   jmp ${_C_loop_1}:rel + PC
                               #      | _E2_if_7:
ec 20 1c f8 02 13 00           # 539f |   jne A, 0x2, ${_E3_if_7}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # 53a6 |   sub H, E, 0x4
63 fc ff                       # 53ab |   mov [E], [H]
58 f8 21 00                    # 53ae |   jmp ${_C_loop_1}:rel + PC
                               #      | _E3_if_7:
ec 20 1c f8 06 0e 00           # 53b2 |   jne A, 0x6, ${_E4_if_7}:rel + PC
                               #      |   # all zeros
62 fc 00                       # 53b9 |   mov [E], 0
58 f8 13 00                    # 53bc |   jmp ${_C_loop_1}:rel + PC
                               #      | _E4_if_7:
ec 20 1c f8 07 0b 00           # 53c0 |   jne A, 0x7, ${_E5_if_7}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # 53c7 |   mov [SP], [SP + 0x12]
                               #      | _E5_if_7:
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _BZ_loop_1:
58 f8 7b ff                    # 53cb |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _BZ_for_1:
00 fc 1c 02                    # 53cf |   add E, 0x2
58 f8 66 ff                    # 53d3 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # 53d7 |   mov SP, SP + 0x2
e4 20                          # 53db |   pop A
e4 40                          # 53dd |   pop B
e4 60                          # 53df |   pop C
e4 80                          # 53e1 |   pop D
dc                             # 53e3 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_send_oled_cmd_sequence:
                               #      | _begin_fn_send_oled_cmd_sequence:
e0 40                          # 53e4 |   push B
e0 20                          # 53e6 |   push A
60 20 bc 08                    # 53e8 |   mov A, SP + 0x8
61 40 bc 06                    # 53ec |   mov B, [SP + 0x6]
60 40 45                       # 53f0 |   mov B, B*2 + A
                               #      | _A_for_2:
                               #      | _BA_for_2:
fc 20 40 f8 1a 00              # 53f3 |   jge A, B, ${_C_for_2}:rel + PC
                               #      | _A_call_5:
e2 20                          # 53f9 |   push [A]
e0 00                          # 53fb |   push 0
5c f8 15 00                    # 53fd |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 5401 |   mov SP, SP + 0x4
                               #      | _Z_call_5:
                               #      | _BZ_for_2:
60 20 3c 02                    # 5405 |   mov A, A + 0x2
58 f8 ea ff                    # 5409 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_send_oled_cmd_sequence:
e4 20                          # 540d |   pop A
e4 40                          # 540f |   pop B
dc                             # 5411 |   ret
                               #      | _end_fn_send_oled_cmd_sequence:
                               #      | 
                               #      | fn_send_oled_data_or_cmd:
                               #      | _begin_fn_send_oled_data_or_cmd:
e0 40                          # 5412 |   push B
e0 20                          # 5414 |   push A
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
99 40 e0 1c 30 ff 08           # 5416 |   getb B, [0xff30], 0x8
ec 40 00 f8 0a 00              # 541d |   jne B, 0, ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 f3 ff                    # 5423 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
ad 40 bc e0 08 ff 00           # 5427 |   and B, [SP + 0x8], 0xff
ad 20 e0 e0 32 ff 00 ff        # 542e |   and A, [0xff32], 0xff00
30 20 e8 00 01                 # 5436 |   or A, 0x100 + B
                               #      | _A_if_10:
ee bc 00 f8 06 0f 00           # 543b |   jne [SP + 0x6], 0, ${_E_if_10}:rel + PC
1c 20 1c 1c                    # 5442 |   setb A, 0x1c
58 f8 08 00                    # 5446 |   jmp ${_C_if_10}:rel + PC
                               #      | _E_if_10:
1c 20 1c 0c                    # 544a |   setb A, 0xc
                               #      | _C_if_10:
                               #      | _Z_if_10:
62 e0 20 32 ff                 # 544e |   mov [0xff32], A
9e e0 20 1c 32 ff 18           # 5453 |   setb [0xff32], A, 0x18
                               #      | _cleanup_fn_send_oled_data_or_cmd:
e4 20                          # 545a |   pop A
e4 40                          # 545c |   pop B
dc                             # 545e |   ret
                               #      | _end_fn_send_oled_data_or_cmd:
                               #      | 
                               #      | fn_switch_screen_page:
                               #      | _begin_fn_switch_screen_page:
e0 40                          # 545f |   push B
e0 20                          # 5461 |   push A
61 20 bc 08                    # 5463 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 5467 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 546c |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 10 5a 0f 5f 04     # 5473 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
                               #      | _cleanup_fn_switch_screen_page:
e4 20                          # 547c |   pop A
e4 40                          # 547e |   pop B
dc                             # 5480 |   ret
                               #      | _end_fn_switch_screen_page:
                               #      | 
                               #      | fn_fill_page:
                               #      | _begin_fn_fill_page:
e0 20                          # 5481 |   push A
61 fe bc 04                    # 5483 |   mov G, [SP + 0x4]
                               #      | _A_for_7:
60 20 e0 10 5a                 # 5487 |   mov A, ${var__VIDEO_ROW_BUFFER}
                               #      | _BA_for_7:
fc 20 e0 f8 10 5f 13 00        # 548c |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_7}:rel + PC
62 20 fe                       # 5494 |   mov [A], G
                               #      | _BZ_for_7:
60 20 3c 02                    # 5497 |   mov A, A + 0x2
58 f8 f1 ff                    # 549b |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_fill_page:
e4 20                          # 549f |   pop A
dc                             # 54a1 |   ret
                               #      | _end_fn_fill_page:
                               #      | 
                               #      | fn_main_loop:
                               #      | _begin_fn_main_loop:
e0 20                          # 54a2 |   push A
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 20 e0 0e ff                 # 54a4 |   mov A, [0xff0e]
                               #      | _A_if_13:
e9 20 e0 f8 40 6d 39 00        # 54a9 |   jeq A, [${var__var_2}], ${_E_if_13}:rel + PC
62 e0 20 40 6d                 # 54b1 |   mov [${var__var_2}], A
98 fe 20 1c 0c                 # 54b6 |   getb G, A, 0xc
                               #      | _A_if_14:
e8 fe 00 f8 11 00              # 54bb |   jeq G, 0, ${_E_if_14}:rel + PC
                               #      | _A_call_16:
e0 1c ff                       # 54c1 |   push -1
5c f8 25 00                    # 54c4 |   call ${fn_move_slot}:rel + PC
60 a0 bc 02                    # 54c8 |   mov SP, SP + 0x2
                               #      | _Z_call_16:
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
98 fe 20 1c 09                 # 54cc |   getb G, A, 0x9
                               #      | _A_if_16:
e8 fe 00 f8 11 00              # 54d1 |   jeq G, 0, ${_E_if_16}:rel + PC
                               #      | _A_call_17:
e0 1c 01                       # 54d7 |   push 0x1
5c f8 0f 00                    # 54da |   call ${fn_move_slot}:rel + PC
60 a0 bc 02                    # 54de |   mov SP, SP + 0x2
                               #      | _Z_call_17:
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _E_if_13:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _BZ_loop_3:
58 f8 c2 ff                    # 54e2 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _cleanup_fn_main_loop:
e4 20                          # 54e6 |   pop A
dc                             # 54e8 |   ret
                               #      | _end_fn_main_loop:
                               #      | 
                               #      | fn_move_slot:
                               #      | _begin_fn_move_slot:
e0 20                          # 54e9 |   push A
61 20 e0 10 69                 # 54eb |   mov A, [${var__var_1}]
01 20 bc 04                    # 54f0 |   add A, [SP + 0x4]
                               #      | _A_call_15:
e0 20                          # 54f4 |   push A
5c f8 95 fb                    # 54f6 |   call ${fn_show_image}:rel + PC
60 a0 bc 02                    # 54fa |   mov SP, SP + 0x2
                               #      | _Z_call_15:
                               #      | _A_if_15:
ec fe 00 f8 26 00              # 54fe |   jne G, 0, ${_E_if_15}:rel + PC
                               #      | _A_syscall_14:
60 ff 1c 1a                    # 5504 |   mov H, 0x1a
5e e0 1e ff                    # 5508 |   call [0xff1e]
                               #      | _Z_syscall_14:
                               #      | _A_syscall_15:
e0 e0 fb 59                    # 550c |   push ${const__data_4}
e0 00                          # 5510 |   push 0
e0 00                          # 5512 |   push 0
60 ff 1c 1c                    # 5514 |   mov H, 0x1c
5e e0 1e ff                    # 5518 |   call [0xff1e]
60 a0 bc 06                    # 551c |   mov SP, SP + 0x6
                               #      | _Z_syscall_15:
58 f8 09 00                    # 5520 |   jmp ${_C_if_15}:rel + PC
                               #      | _E_if_15:
62 e0 20 10 69                 # 5524 |   mov [${var__var_1}], A
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _cleanup_fn_move_slot:
e4 20                          # 5529 |   pop A
dc                             # 552b |   ret
                               #      | _end_fn_move_slot:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 552c |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # 5921 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__data_1:
49 6d 67 20 56 69 65 77 00     # 59e1 |   .data str:"Img View"
                               #      | const__data_2:
53 44 20 45 72 72 6f 72 00     # 59ea |   .data str:"SD Error"
                               #      | const__data_3:
53 44 20 4f 6b 61 79 00        # 59f3 |   .data str:"SD Okay"
                               #      | const__data_4:
54 68 65 20 65 6e 64 21 00     # 59fb |   .data str:"The end!"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5a04
                               #      | SECTION_BEGIN_static_data:
                               # 5a04 |   .align dummy_size:12 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5a10 |   .bss size:3840 align:16
                               #      | var__var_1:
                               # 6910 |   .bss size:2 align:1
                               # 6912 |   .align dummy_size:14 align:16
                               #      | var__g_sd_buf:
                               # 6920 |   .bss size:528 align:16
                               #      | var__g_vid_chunk:
                               # 6b30 |   .bss size:528 align:16
                               #      | var__var_2:
                               # 6d40 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
