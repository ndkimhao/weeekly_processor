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
e0 e0 d7 59                    # 5012 |   push ${const__data_1}
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
e0 e0 e9 59                    # 503c |   push ${const__data_3}
e0 00                          # 5040 |   push 0
e0 1c 01                       # 5042 |   push 0x1
60 ff 1c 1c                    # 5045 |   mov H, 0x1c
5e e0 1e ff                    # 5049 |   call [0xff1e]
60 a0 bc 06                    # 504d |   mov SP, SP + 0x6
                               #      | _Z_syscall_6:
                               #      | _C_if_1:
                               #      | _Z_if_1:
62 e0 00 00 69                 # 5051 |   mov [${var__var_1}], 0
                               #      | _A_call_14:
e2 e0 00 69                    # 5056 |   push [${var__var_1}]
5c f8 31 00                    # 505a |   call ${fn_show_image}:rel + PC
60 a0 bc 02                    # 505e |   mov SP, SP + 0x2
                               #      | _Z_call_14:
62 e0 00 30 6d                 # 5062 |   mov [${var__var_2}], 0
                               #      | _A_call_18:
5c f8 31 04                    # 5067 |   call ${fn_main_loop}:rel + PC
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
e0 e0 e0 59                    # 5074 |   push ${const__data_2}
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
e0 e0 10 69                    # 50ab |   push ${var__g_sd_buf}
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
ea e0 e0 f8 10 69 a6 3a 11 00  # 50c5 |   jeq [${var__g_sd_buf}], 0x3aa6, ${_E_if_3}:rel + PC
60 fe 00                       # 50cf |   mov G, 0
58 f8 1d 01                    # 50d2 |   jmp ${_cleanup_fn_show_image}:rel + PC
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
62 e0 00 1a 69                 # 50d6 |   mov [${var__g_sd_buf} + 000a], 0
62 e0 00 24 69                 # 50db |   mov [${var__g_sd_buf} + 0014], 0
                               #      | _A_syscall_8:
60 ff 1c 1a                    # 50e0 |   mov H, 0x1a
5e e0 1e ff                    # 50e4 |   call [0xff1e]
                               #      | _Z_syscall_8:
                               #      | _A_syscall_9:
e0 e0 12 69                    # 50e8 |   push ${var__g_sd_buf} + 0002
e0 00                          # 50ec |   push 0
e0 00                          # 50ee |   push 0
60 ff 1c 1c                    # 50f0 |   mov H, 0x1c
5e e0 1e ff                    # 50f4 |   call [0xff1e]
60 a0 bc 06                    # 50f8 |   mov SP, SP + 0x6
                               #      | _Z_syscall_9:
                               #      | _A_syscall_10:
e0 e0 1c 69                    # 50fc |   push ${var__g_sd_buf} + 000c
e0 00                          # 5100 |   push 0
e0 1c 01                       # 5102 |   push 0x1
60 ff 1c 1c                    # 5105 |   mov H, 0x1c
5e e0 1e ff                    # 5109 |   call [0xff1e]
60 a0 bc 06                    # 510d |   mov SP, SP + 0x6
                               #      | _Z_syscall_10:
                               #      | _A_call_9:
e0 1c 4c                       # 5111 |   push 0x4c
5c f8 f9 00                    # 5114 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # 5118 |   mov SP, SP + 0x2
                               #      | _Z_call_9:
                               #      | _A_for_6:
60 20 00                       # 511c |   mov A, 0
                               #      | _BA_for_6:
fc 20 1c f8 1e 24 00           # 511f |   jge A, 0x1e, ${_C_for_6}:rel + PC
                               #      | _A_call_10:
e0 1c 08                       # 5126 |   push 0x8
e0 20                          # 5129 |   push A
5c f8 2a 03                    # 512b |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 512f |   mov SP, SP + 0x4
                               #      | _Z_call_10:
                               #      | _A_call_11:
e0 00                          # 5133 |   push 0
5c f8 42 03                    # 5135 |   call ${fn_fill_page}:rel + PC
60 a0 bc 02                    # 5139 |   mov SP, SP + 0x2
                               #      | _Z_call_11:
                               #      | _BZ_for_6:
44 20                          # 513d |   inc A
58 f8 e0 ff                    # 513f |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_12:
e0 00                          # 5143 |   push 0
e0 00                          # 5145 |   push 0
5c f8 0e 03                    # 5147 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 514b |   mov SP, SP + 0x4
                               #      | _Z_call_12:
                               #      | _A_syscall_11:
e0 1c 30                       # 514f |   push 0x30
e0 e0 26 69                    # 5152 |   push ${var__g_sd_buf} + 0016
e0 e0 00 5a                    # 5156 |   push ${var__VIDEO_ROW_BUFFER}
60 ff 1c 0a                    # 515a |   mov H, 0xa
5e e0 1e ff                    # 515e |   call [0xff1e]
60 a0 bc 06                    # 5162 |   mov SP, SP + 0x6
                               #      | _Z_syscall_11:
60 20 e0 a1 00                 # 5166 |   mov A, 0xa1
60 40 00                       # 516b |   mov B, 0
                               #      | _A_for_8:
c4 80 00                       # 516e |   inc D, 0
                               #      | _BA_for_8:
fc 80 e0 f8 e2 00 7b 00        # 5171 |   jge D, 0xe2, ${_C_for_8}:rel + PC
                               #      | _A_syscall_12:
e0 70                          # 5179 |   push C + D
e0 1c 01                       # 517b |   push 0x1
e0 e0 00 02                    # 517e |   push 0x200
e0 e0 10 69                    # 5182 |   push ${var__g_sd_buf}
60 ff 1c 14                    # 5186 |   mov H, 0x14
5e e0 1e ff                    # 518a |   call [0xff1e]
60 a0 bc 08                    # 518e |   mov SP, SP + 0x8
                               #      | _Z_syscall_12:
54 e0 e0 00 20 6b 20 6d        # 5192 |   mmap ${var__g_vid_chunk}, ${var__g_vid_chunk} + 0200, 0
                               #      | _A_syscall_13:
e0 e0 00 02                    # 519a |   push 0x200
e0 e0 10 69                    # 519e |   push ${var__g_sd_buf}
e0 e0 20 6b                    # 51a2 |   push ${var__g_vid_chunk}
60 ff 1c 0a                    # 51a6 |   mov H, 0xa
5e e0 1e ff                    # 51aa |   call [0xff1e]
60 a0 bc 06                    # 51ae |   mov SP, SP + 0x6
                               #      | _Z_syscall_13:
ac ff 20 1c 0f                 # 51b2 |   and H, A, 0xf
28 ff 1c 01                    # 51b7 |   shl H, 0x1
                               #      | _A_if_11:
f4 ff 1c f8 07 0f 00           # 51bb |   jle H, 0x7, ${_E_if_11}:rel + PC
c4 ff 00                       # 51c2 |   inc H, 0
60 40 e8 00 02                 # 51c5 |   mov B, 0x200 + B
                               #      | _E_if_11:
                               #      | _C_if_11:
                               #      | _Z_if_11:
b0 20 e0 ff a0 00              # 51ca |   or A, 0xa0, H
61 ff e0 0e ff                 # 51d0 |   mov H, [0xff0e]
2d ff a0                       # 51d5 |   and H, [SP]
                               #      | _A_if_12:
e8 ff 00 f8 0e 00              # 51d8 |   jeq H, 0, ${_E_if_12}:rel + PC
60 fe 1c 02                    # 51de |   mov G, 0x2
58 f8 0d 00                    # 51e2 |   jmp ${_cleanup_fn_show_image}:rel + PC
                               #      | _E_if_12:
                               #      | _C_if_12:
                               #      | _Z_if_12:
                               #      | _BZ_for_8:
44 80                          # 51e6 |   inc D
58 f8 89 ff                    # 51e8 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
c4 fe 00                       # 51ec |   inc G, 0
                               #      | _cleanup_fn_show_image:
d4 00                          # 51ef |   umap 0
                               #      | _A_scope_2:
e0 fe                          # 51f1 |   push G
                               #      | _B_scope_2:
                               #      | _A_call_13:
e0 1c 44                       # 51f3 |   push 0x44
5c f8 17 00                    # 51f6 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # 51fa |   mov SP, SP + 0x2
                               #      | _Z_call_13:
                               #      | _C_scope_2:
e4 fe                          # 51fe |   pop G
                               #      | _Z_scope_2:
60 a0 bc 02                    # 5200 |   mov SP, SP + 0x2
e4 20                          # 5204 |   pop A
e4 40                          # 5206 |   pop B
e4 60                          # 5208 |   pop C
e4 80                          # 520a |   pop D
dc                             # 520c |   ret
                               #      | _end_fn_show_image:
                               #      | 
                               #      | fn_show_status:
                               #      | _begin_fn_show_status:
                               #      | _A_call_8:
e2 bc 02                       # 520d |   push [SP + 0x2]
e0 1c 07                       # 5210 |   push 0x7
e0 1c 01                       # 5213 |   push 0x1
5c f8 09 00                    # 5216 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 521a |   mov SP, SP + 0x6
                               #      | _Z_call_8:
                               #      | _cleanup_fn_show_status:
dc                             # 521e |   ret
                               #      | _end_fn_show_status:
                               #      | 
                               #      | fn_draw_char_oled:
                               #      | _begin_fn_draw_char_oled:
e0 80                          # 521f |   push D
e0 60                          # 5221 |   push C
e0 40                          # 5223 |   push B
e0 20                          # 5225 |   push A
60 a0 bc e0                    # 5227 |   mov SP, SP + -32
                               #      | _A_call_4:
e2 bc 2e                       # 522b |   push [SP + 0x2e]
e0 bc 02                       # 522e |   push SP + 0x2
5c f8 95 00                    # 5231 |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # 5235 |   mov SP, SP + 0x4
                               #      | _Z_call_4:
ad 20 bc 1c 2a 01              # 5239 |   and A, [SP + 0x2a], 0x1
ad 40 bc 1c 2c 07              # 523f |   and B, [SP + 0x2c], 0x7
28 40 1c 04                    # 5245 |   shl B, 0x4
                               #      | _A_call_6:
e0 3d 01                       # 5249 |   push A*2 + 0x1
e0 21                          # 524c |   push A*2
e0 1c 22                       # 524e |   push 0x22
e0 5c 0f                       # 5251 |   push B + 0xf
e0 40                          # 5254 |   push B
e0 1c 21                       # 5256 |   push 0x21
e0 1c 06                       # 5259 |   push 0x6
5c f8 7e 01                    # 525c |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # 5260 |   mov SP, SP + 0xe
                               #      | _Z_call_6:
                               #      | _A_for_3:
60 20 00                       # 5264 |   mov A, 0
                               #      | _BA_for_3:
fc 20 1c f8 10 52 00           # 5267 |   jge A, 0x10, ${_C_for_3}:rel + PC
80 60 21 a0                    # 526e |   add C, A*2, SP
                               #      | _A_for_4:
e0 20                          # 5272 |   push A
60 40 00                       # 5274 |   mov B, 0
                               #      | _BA_for_4:
fc 40 1c f8 10 38 00           # 5277 |   jge B, 0x10, ${_C_for_4}:rel + PC
60 20 00                       # 527e |   mov A, 0
                               #      | _A_for_5:
60 80 1c 07                    # 5281 |   mov D, 0x7
                               #      | _BA_for_5:
e8 80 1c f8 ff 17 00           # 5285 |   jeq D, -1, ${_C_for_5}:rel + PC
99 fe 8d 40                    # 528c |   getb G, [D*2 + C], B
40 fe                          # 5290 |   bool G
b0 20 21 fe                    # 5292 |   or A, A*2, G
                               #      | _BZ_for_5:
48 80                          # 5296 |   dec D
58 f8 ed ff                    # 5298 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _A_call_7:
e0 20                          # 529c |   push A
e0 1c 01                       # 529e |   push 0x1
5c f8 67 01                    # 52a1 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 52a5 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _BZ_for_4:
44 40                          # 52a9 |   inc B
58 f8 cc ff                    # 52ab |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
e4 20                          # 52af |   pop A
                               #      | _Z_for_4:
                               #      | _BZ_for_3:
60 20 3c 08                    # 52b1 |   mov A, A + 0x8
58 f8 b2 ff                    # 52b5 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_draw_char_oled:
60 a0 bc 20                    # 52b9 |   mov SP, SP + 0x20
e4 20                          # 52bd |   pop A
e4 40                          # 52bf |   pop B
e4 60                          # 52c1 |   pop C
e4 80                          # 52c3 |   pop D
dc                             # 52c5 |   ret
                               #      | _end_fn_draw_char_oled:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # 52c6 |   push B
e0 20                          # 52c8 |   push A
61 20 bc 08                    # 52ca |   mov A, [SP + 0x8]
60 40 1c 1f                    # 52ce |   mov B, 0x1f
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 20 1c f8 20 13 00           # 52d2 |   jlt A, 0x20, ${_C_scope_1}:rel + PC
fc 20 e0 f8 80 00 0c 00        # 52d9 |   jge A, 0x80, ${_C_scope_1}:rel + PC
60 40 3c e0                    # 52e1 |   mov B, A + -32
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
28 40 1c 01                    # 52e5 |   shl B, 0x1
61 40 e8 17 59                 # 52e9 |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_3:
e0 1c 0c                       # 52ee |   push 0xc
e0 1c 10                       # 52f1 |   push 0x10
e0 e8 22 55                    # 52f4 |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # 52f8 |   push [SP + 0xc]
5c f8 0d 00                    # 52fb |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # 52ff |   mov SP, SP + 0x8
                               #      | _Z_call_3:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # 5303 |   pop A
e4 40                          # 5305 |   pop B
dc                             # 5307 |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # 5308 |   push D
e0 60                          # 530a |   push C
e0 40                          # 530c |   push B
e0 20                          # 530e |   push A
61 fc bc 0a                    # 5310 |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # 5314 |   shl F, [SP + 0xe], 0x1
00 fd fc                       # 531a |   add F, E
61 fe bc 0c                    # 531d |   mov G, [SP + 0xc]
61 40 fe                       # 5321 |   mov B, [G]
60 60 1c 07                    # 5324 |   mov C, 0x7
60 20 00                       # 5328 |   mov A, 0
60 a0 bc fe                    # 532b |   mov SP, SP + -2
                               #      | _A_for_1:
                               #      | _BA_for_1:
fc fc fd f8 9e 00              # 532f |   jge E, F, ${_C_for_1}:rel + PC
                               #      |   # decode one line
60 20 00                       # 5335 |   mov A, 0
62 a0 1c ff                    # 5338 |   mov [SP], -1
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
                               #      | _A_if_6:
ec 60 1c f8 ff 10 00           # 533c |   jne C, -1, ${_E_if_6}:rel + PC
44 fe                          # 5343 |   inc G
61 40 fe                       # 5345 |   mov B, [G]
60 60 1c 07                    # 5348 |   mov C, 0x7
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
98 80 40 60                    # 534c |   getb D, B, C
48 60                          # 5350 |   dec C
40 80                          # 5352 |   bool D
b0 20 21 80                    # 5354 |   or A, A*2, D
4a a0                          # 5358 |   dec [SP]
                               #      | _A_if_7:
ee a0 00 f8 1b 00              # 535a |   jne [SP], 0, ${_E_if_7}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # 5360 |   mov H, A
b9 20 bc 12                    # 5363 |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # 5367 |   shr A, -1, A + 0x10
ae fc ff 20                    # 536d |   and [E], H, A
58 f8 54 00                    # 5371 |   jmp ${_C_loop_1}:rel + PC
                               #      | _E_if_7:
ec 20 00 f8 20 00              # 5375 |   jne A, 0, ${_E2_if_7}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # 537b |   sub H, E, 0x2
                               #      | _A_if_8:
f1 ff bc f8 0c 0e 00           # 5380 |   jlt H, [SP + 0xc], ${_E_if_8}:rel + PC
63 fc ff                       # 5387 |   mov [E], [H]
58 f8 07 00                    # 538a |   jmp ${_C_if_8}:rel + PC
                               #      | _E_if_8:
62 fc 00                       # 538e |   mov [E], 0
                               #      | _C_if_8:
                               #      | _Z_if_8:
58 f8 34 00                    # 5391 |   jmp ${_C_loop_1}:rel + PC
                               #      | _E2_if_7:
ec 20 1c f8 02 13 00           # 5395 |   jne A, 0x2, ${_E3_if_7}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # 539c |   sub H, E, 0x4
63 fc ff                       # 53a1 |   mov [E], [H]
58 f8 21 00                    # 53a4 |   jmp ${_C_loop_1}:rel + PC
                               #      | _E3_if_7:
ec 20 1c f8 06 0e 00           # 53a8 |   jne A, 0x6, ${_E4_if_7}:rel + PC
                               #      |   # all zeros
62 fc 00                       # 53af |   mov [E], 0
58 f8 13 00                    # 53b2 |   jmp ${_C_loop_1}:rel + PC
                               #      | _E4_if_7:
ec 20 1c f8 07 0b 00           # 53b6 |   jne A, 0x7, ${_E5_if_7}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # 53bd |   mov [SP], [SP + 0x12]
                               #      | _E5_if_7:
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _BZ_loop_1:
58 f8 7b ff                    # 53c1 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _BZ_for_1:
00 fc 1c 02                    # 53c5 |   add E, 0x2
58 f8 66 ff                    # 53c9 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # 53cd |   mov SP, SP + 0x2
e4 20                          # 53d1 |   pop A
e4 40                          # 53d3 |   pop B
e4 60                          # 53d5 |   pop C
e4 80                          # 53d7 |   pop D
dc                             # 53d9 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_send_oled_cmd_sequence:
                               #      | _begin_fn_send_oled_cmd_sequence:
e0 40                          # 53da |   push B
e0 20                          # 53dc |   push A
60 20 bc 08                    # 53de |   mov A, SP + 0x8
61 40 bc 06                    # 53e2 |   mov B, [SP + 0x6]
60 40 45                       # 53e6 |   mov B, B*2 + A
                               #      | _A_for_2:
                               #      | _BA_for_2:
fc 20 40 f8 1a 00              # 53e9 |   jge A, B, ${_C_for_2}:rel + PC
                               #      | _A_call_5:
e2 20                          # 53ef |   push [A]
e0 00                          # 53f1 |   push 0
5c f8 15 00                    # 53f3 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 53f7 |   mov SP, SP + 0x4
                               #      | _Z_call_5:
                               #      | _BZ_for_2:
60 20 3c 02                    # 53fb |   mov A, A + 0x2
58 f8 ea ff                    # 53ff |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_send_oled_cmd_sequence:
e4 20                          # 5403 |   pop A
e4 40                          # 5405 |   pop B
dc                             # 5407 |   ret
                               #      | _end_fn_send_oled_cmd_sequence:
                               #      | 
                               #      | fn_send_oled_data_or_cmd:
                               #      | _begin_fn_send_oled_data_or_cmd:
e0 40                          # 5408 |   push B
e0 20                          # 540a |   push A
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
99 40 e0 1c 30 ff 08           # 540c |   getb B, [0xff30], 0x8
ec 40 00 f8 0a 00              # 5413 |   jne B, 0, ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 f3 ff                    # 5419 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
ad 40 bc e0 08 ff 00           # 541d |   and B, [SP + 0x8], 0xff
ad 20 e0 e0 32 ff 00 ff        # 5424 |   and A, [0xff32], 0xff00
30 20 e8 00 01                 # 542c |   or A, 0x100 + B
                               #      | _A_if_10:
ee bc 00 f8 06 0f 00           # 5431 |   jne [SP + 0x6], 0, ${_E_if_10}:rel + PC
1c 20 1c 1c                    # 5438 |   setb A, 0x1c
58 f8 08 00                    # 543c |   jmp ${_C_if_10}:rel + PC
                               #      | _E_if_10:
1c 20 1c 0c                    # 5440 |   setb A, 0xc
                               #      | _C_if_10:
                               #      | _Z_if_10:
62 e0 20 32 ff                 # 5444 |   mov [0xff32], A
9e e0 20 1c 32 ff 18           # 5449 |   setb [0xff32], A, 0x18
                               #      | _cleanup_fn_send_oled_data_or_cmd:
e4 20                          # 5450 |   pop A
e4 40                          # 5452 |   pop B
dc                             # 5454 |   ret
                               #      | _end_fn_send_oled_data_or_cmd:
                               #      | 
                               #      | fn_switch_screen_page:
                               #      | _begin_fn_switch_screen_page:
e0 40                          # 5455 |   push B
e0 20                          # 5457 |   push A
61 20 bc 08                    # 5459 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 545d |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 5462 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 00 5a ff 5e 04     # 5469 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
                               #      | _cleanup_fn_switch_screen_page:
e4 20                          # 5472 |   pop A
e4 40                          # 5474 |   pop B
dc                             # 5476 |   ret
                               #      | _end_fn_switch_screen_page:
                               #      | 
                               #      | fn_fill_page:
                               #      | _begin_fn_fill_page:
e0 20                          # 5477 |   push A
61 fe bc 04                    # 5479 |   mov G, [SP + 0x4]
                               #      | _A_for_7:
60 20 e0 00 5a                 # 547d |   mov A, ${var__VIDEO_ROW_BUFFER}
                               #      | _BA_for_7:
fc 20 e0 f8 00 5f 13 00        # 5482 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_7}:rel + PC
62 20 fe                       # 548a |   mov [A], G
                               #      | _BZ_for_7:
60 20 3c 02                    # 548d |   mov A, A + 0x2
58 f8 f1 ff                    # 5491 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_fill_page:
e4 20                          # 5495 |   pop A
dc                             # 5497 |   ret
                               #      | _end_fn_fill_page:
                               #      | 
                               #      | fn_main_loop:
                               #      | _begin_fn_main_loop:
e0 20                          # 5498 |   push A
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 20 e0 0e ff                 # 549a |   mov A, [0xff0e]
                               #      | _A_if_13:
e9 20 e0 f8 30 6d 39 00        # 549f |   jeq A, [${var__var_2}], ${_E_if_13}:rel + PC
62 e0 20 30 6d                 # 54a7 |   mov [${var__var_2}], A
98 fe 20 1c 0c                 # 54ac |   getb G, A, 0xc
                               #      | _A_if_14:
e8 fe 00 f8 11 00              # 54b1 |   jeq G, 0, ${_E_if_14}:rel + PC
                               #      | _A_call_16:
e0 1c ff                       # 54b7 |   push -1
5c f8 25 00                    # 54ba |   call ${fn_move_slot}:rel + PC
60 a0 bc 02                    # 54be |   mov SP, SP + 0x2
                               #      | _Z_call_16:
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
98 fe 20 1c 09                 # 54c2 |   getb G, A, 0x9
                               #      | _A_if_16:
e8 fe 00 f8 11 00              # 54c7 |   jeq G, 0, ${_E_if_16}:rel + PC
                               #      | _A_call_17:
e0 1c 01                       # 54cd |   push 0x1
5c f8 0f 00                    # 54d0 |   call ${fn_move_slot}:rel + PC
60 a0 bc 02                    # 54d4 |   mov SP, SP + 0x2
                               #      | _Z_call_17:
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _E_if_13:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _BZ_loop_3:
58 f8 c2 ff                    # 54d8 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _cleanup_fn_main_loop:
e4 20                          # 54dc |   pop A
dc                             # 54de |   ret
                               #      | _end_fn_main_loop:
                               #      | 
                               #      | fn_move_slot:
                               #      | _begin_fn_move_slot:
e0 20                          # 54df |   push A
61 20 e0 00 69                 # 54e1 |   mov A, [${var__var_1}]
01 20 bc 04                    # 54e6 |   add A, [SP + 0x4]
                               #      | _A_call_15:
e0 20                          # 54ea |   push A
5c f8 9f fb                    # 54ec |   call ${fn_show_image}:rel + PC
60 a0 bc 02                    # 54f0 |   mov SP, SP + 0x2
                               #      | _Z_call_15:
                               #      | _A_if_15:
ec fe 00 f8 26 00              # 54f4 |   jne G, 0, ${_E_if_15}:rel + PC
                               #      | _A_syscall_14:
60 ff 1c 1a                    # 54fa |   mov H, 0x1a
5e e0 1e ff                    # 54fe |   call [0xff1e]
                               #      | _Z_syscall_14:
                               #      | _A_syscall_15:
e0 e0 f1 59                    # 5502 |   push ${const__data_4}
e0 00                          # 5506 |   push 0
e0 00                          # 5508 |   push 0
60 ff 1c 1c                    # 550a |   mov H, 0x1c
5e e0 1e ff                    # 550e |   call [0xff1e]
60 a0 bc 06                    # 5512 |   mov SP, SP + 0x6
                               #      | _Z_syscall_15:
58 f8 09 00                    # 5516 |   jmp ${_C_if_15}:rel + PC
                               #      | _E_if_15:
62 e0 20 00 69                 # 551a |   mov [${var__var_1}], A
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _cleanup_fn_move_slot:
e4 20                          # 551f |   pop A
dc                             # 5521 |   ret
                               #      | _end_fn_move_slot:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 5522 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # 5917 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__data_1:
49 6d 67 20 56 69 65 77 00     # 59d7 |   .data str:"Img View"
                               #      | const__data_2:
53 44 20 45 72 72 6f 72 00     # 59e0 |   .data str:"SD Error"
                               #      | const__data_3:
53 44 20 4f 6b 61 79 00        # 59e9 |   .data str:"SD Okay"
                               #      | const__data_4:
54 68 65 20 65 6e 64 21 00     # 59f1 |   .data str:"The end!"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x59fa
                               #      | SECTION_BEGIN_static_data:
                               # 59fa |   .align dummy_size:6 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5a00 |   .bss size:3840 align:16
                               #      | var__var_1:
                               # 6900 |   .bss size:2 align:1
                               # 6902 |   .align dummy_size:14 align:16
                               #      | var__g_sd_buf:
                               # 6910 |   .bss size:528 align:16
                               #      | var__g_vid_chunk:
                               # 6b20 |   .bss size:528 align:16
                               #      | var__var_2:
                               # 6d30 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
