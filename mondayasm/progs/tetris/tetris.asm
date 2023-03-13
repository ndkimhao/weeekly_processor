                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_79:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_79:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
62 e0 00 1a 74                 # 500a |   mov [${var__last_btn_in}], 0
                               #      | _A_call_6:
5c f8 2c 00                    # 500f |   call ${fn_init_tetris_color_palette}:rel + PC
                               #      | _Z_call_6:
                               #      | _A_call_26:
5c f8 05 01                    # 5013 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_26:
                               #      |   # game loop
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
                               #      | _A_call_49:
5c f8 47 04                    # 5017 |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_49:
e8 ff 00 f8 1f 00              # 501b |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_78:
e0 e0 45 5b                    # 5021 |   push ${fn_handle_keyboard}
e0 e0 c0 27                    # 5025 |   push 0x27c0
e0 1c 09                       # 5029 |   push 0x9
e0 00                          # 502c |   push 0
5c f8 0b 0e                    # 502e |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5032 |   mov SP, SP + 0x8
                               #      | _Z_call_78:
                               #      | _BZ_loop_3:
58 f8 e1 ff                    # 5036 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _cleanup_fn_main:
dc                             # 503a |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_init_tetris_color_palette:
                               #      | _begin_fn_init_tetris_color_palette:
                               #      | _A_call_1:
e0 00                          # 503b |   push 0
e0 00                          # 503d |   push 0
5c f8 36 00                    # 503f |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5043 |   mov SP, SP + 0x4
                               #      | _Z_call_1:
                               #      | _A_call_3:
5c f8 50 00                    # 5047 |   call ${fn_reset_color_palette}:rel + PC
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 e0 f0 00                    # 504b |   push 0xf0
e0 00                          # 504f |   push 0
e0 e0 a0 00                    # 5051 |   push 0xa0
e0 1c 04                       # 5055 |   push 0x4
5c f8 9f 00                    # 5058 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 505c |   mov SP, SP + 0x8
                               #      | _Z_call_4:
                               #      | _A_call_5:
e0 1c 70                       # 5060 |   push 0x70
e0 1c 70                       # 5063 |   push 0x70
e0 1c 70                       # 5066 |   push 0x70
e0 1c 07                       # 5069 |   push 0x7
5c f8 8b 00                    # 506c |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 5070 |   mov SP, SP + 0x8
                               #      | _Z_call_5:
                               #      | _cleanup_fn_init_tetris_color_palette:
dc                             # 5074 |   ret
                               #      | _end_fn_init_tetris_color_palette:
                               #      | 
                               #      | fn_switch_screen_page:
                               #      | _begin_fn_switch_screen_page:
e0 40                          # 5075 |   push B
e0 20                          # 5077 |   push A
61 20 bc 08                    # 5079 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 507d |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 5082 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 10 64 0f 69 04     # 5089 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
                               #      | _cleanup_fn_switch_screen_page:
e4 20                          # 5092 |   pop A
e4 40                          # 5094 |   pop B
dc                             # 5096 |   ret
                               #      | _end_fn_switch_screen_page:
                               #      | 
                               #      | fn_reset_color_palette:
                               #      | _begin_fn_reset_color_palette:
e0 80                          # 5097 |   push D
e0 60                          # 5099 |   push C
e0 40                          # 509b |   push B
e0 20                          # 509d |   push A
                               #      | _A_for_1:
60 20 00                       # 509f |   mov A, 0
                               #      | _BA_for_1:
fc 20 1c f8 08 4c 00           # 50a2 |   jge A, 0x8, ${_C_for_1}:rel + PC
98 40 20 1c 02                 # 50a9 |   getb B, A, 0x2
                               #      | _A_if_1:
e8 40 00 f8 0b 00              # 50ae |   jeq B, 0, ${_E_if_1}:rel + PC
60 40 e0 ff 00                 # 50b4 |   mov B, 0xff
                               #      | _E_if_1:
                               #      | _C_if_1:
                               #      | _Z_if_1:
98 60 20 1c 01                 # 50b9 |   getb C, A, 0x1
                               #      | _A_if_2:
e8 60 00 f8 0b 00              # 50be |   jeq C, 0, ${_E_if_2}:rel + PC
60 60 e0 ff 00                 # 50c4 |   mov C, 0xff
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
98 80 20 00                    # 50c9 |   getb D, A, 0
                               #      | _A_if_3:
e8 80 00 f8 0b 00              # 50cd |   jeq D, 0, ${_E_if_3}:rel + PC
60 80 e0 ff 00                 # 50d3 |   mov D, 0xff
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _A_call_2:
e0 80                          # 50d8 |   push D
e0 60                          # 50da |   push C
e0 40                          # 50dc |   push B
e0 20                          # 50de |   push A
5c f8 17 00                    # 50e0 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 50e4 |   mov SP, SP + 0x8
                               #      | _Z_call_2:
                               #      | _BZ_for_1:
44 20                          # 50e8 |   inc A
58 f8 b8 ff                    # 50ea |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_reset_color_palette:
e4 20                          # 50ee |   pop A
e4 40                          # 50f0 |   pop B
e4 60                          # 50f2 |   pop C
e4 80                          # 50f4 |   pop D
dc                             # 50f6 |   ret
                               #      | _end_fn_reset_color_palette:
                               #      | 
                               #      | fn_set_color_palette:
                               #      | _begin_fn_set_color_palette:
e0 20                          # 50f7 |   push A
ad 20 bc 1c 04 07              # 50f9 |   and A, [SP + 0x4], 0x7
28 20 1c 01                    # 50ff |   shl A, 0x1
63 e4 bc 10 64 0a              # 5103 |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc 20 64 08              # 5109 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc 30 64 06              # 510f |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
                               #      | _cleanup_fn_set_color_palette:
e4 20                          # 5115 |   pop A
dc                             # 5117 |   ret
                               #      | _end_fn_set_color_palette:
                               #      | 
                               #      | fn_tg_init:
                               #      | _begin_fn_tg_init:
                               #      | _A_call_7:
e0 e0 dc 00                    # 5118 |   push 0xdc
e0 00                          # 511c |   push 0
e0 e0 12 73                    # 511e |   push ${var__board__board_state}
5c f8 4a 00                    # 5122 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5126 |   mov SP, SP + 0x6
                               #      | _Z_call_7:
62 e0 00 f0 73                 # 512a |   mov [${var__board__points}], 0
62 e0 00 f2 73                 # 512f |   mov [${var__board__level}], 0
62 e0 00 0c 74                 # 5134 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 0e 74                 # 5139 |   mov [${var__board__lines_remaining}], 0
                               #      | _A_call_8:
e0 e0 be 0b                    # 513e |   push 0xbbe
5c f8 63 00                    # 5142 |   call ${fn_srand}:rel + PC
60 a0 bc 02                    # 5146 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
                               #      | _A_call_11:
5c f8 62 00                    # 514a |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_11:
                               #      | _A_call_12:
5c f8 5e 00                    # 514e |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_12:
ca e0 00 04 74                 # 5152 |   dec [${var__board__stored}], 0
62 e0 00 06 74                 # 5157 |   mov [${var__board__stored} + 0002], 0
62 e0 00 08 74                 # 515c |   mov [${var__board__stored} + 0004], 0
62 e0 1c 02 74 03              # 5161 |   mov [${var__board__next} + 0006], 0x3
                               #      | _A_call_25:
5c f8 de 00                    # 5167 |   call ${fn_draw_main_interface}:rel + PC
                               #      | _Z_call_25:
                               #      | _cleanup_fn_tg_init:
dc                             # 516b |   ret
                               #      | _end_fn_tg_init:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 516c |   push B
e0 20                          # 516e |   push A
65 fe bc 08                    # 5170 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 5174 |   shl H, G, 0x8
30 ff fe                       # 5179 |   or H, G
61 20 bc 06                    # 517c |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 5180 |   add B, [SP + 0xa], A
                               #      | _A_while_1:
                               #      | _BA_while_1:
f8 3c 40 f8 02 12 00           # 5185 |   jgt A + 0x2, B, ${_C_while_1}:rel + PC
62 20 ff                       # 518c |   mov [A], H
60 20 3c 02                    # 518f |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 f2 ff                    # 5193 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      | _A_if_4:
fc 20 40 f8 09 00              # 5197 |   jge A, B, ${_E_if_4}:rel + PC
66 20 ff                       # 519d |   bmov [A], H
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _cleanup_fn_memset:
e4 20                          # 51a0 |   pop A
e4 40                          # 51a2 |   pop B
dc                             # 51a4 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc 10 73 02              # 51a5 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 51ab |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_9:
e0 1c 08                       # 51ac |   push 0x8
e0 e0 fc 73                    # 51af |   push ${var__board__next}
e0 e0 f4 73                    # 51b3 |   push ${var__board__falling}
5c f8 32 00                    # 51b7 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 51bb |   mov SP, SP + 0x6
                               #      | _Z_call_9:
                               #      |   # fill new Board.next
                               #      | _A_call_10:
5c f8 63 00                    # 51bf |   call ${fn_rand}:rel + PC
                               #      | _Z_call_10:
b5 fe e0 ff 10 ff              # 51c3 |   xor G, [0xff10], H
08 fe e0 4f c3                 # 51c9 |   mul G, 0xc34f
90 fe ff 1c 07                 # 51ce |   div G, H, 0x7
c6 e0 ff fc 73                 # 51d3 |   inc [${var__board__next}], H
62 e0 00 fe 73                 # 51d8 |   mov [${var__board__next} + 0002], 0
62 e0 00 00 74                 # 51dd |   mov [${var__board__next} + 0004], 0
62 e0 1c 02 74 03              # 51e2 |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_new_falling:
dc                             # 51e8 |   ret
                               #      | _end_fn_tg_new_falling:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 51e9 |   push C
e0 40                          # 51eb |   push B
e0 20                          # 51ed |   push A
61 20 bc 08                    # 51ef |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 51f3 |   add B, [SP + 0xc], A
61 60 bc 0a                    # 51f8 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
f8 3c 40 f8 02 16 00           # 51fc |   jgt A + 0x2, B, ${_C_while_2}:rel + PC
63 20 60                       # 5203 |   mov [A], [C]
60 20 3c 02                    # 5206 |   mov A, A + 0x2
60 60 7c 02                    # 520a |   mov C, C + 0x2
                               #      | _BZ_while_2:
58 f8 ee ff                    # 520e |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _A_if_5:
fc 20 40 f8 09 00              # 5212 |   jge A, B, ${_E_if_5}:rel + PC
67 20 60                       # 5218 |   bmov [A], [C]
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 521b |   pop A
e4 40                          # 521d |   pop B
e4 60                          # 521f |   pop C
dc                             # 5221 |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
61 ff e0 10 73                 # 5222 |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 5227 |   shl G, H, 0x7
34 ff fe                       # 522c |   xor H, G
a0 fe ff 1c 09                 # 522f |   shr G, H, 0x9
34 ff fe                       # 5234 |   xor H, G
a8 fe ff 1c 08                 # 5237 |   shl G, H, 0x8
34 ff fe                       # 523c |   xor H, G
62 e0 ff 10 73                 # 523f |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5244 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_draw_main_interface:
                               #      | _begin_fn_draw_main_interface:
                               #      | _A_call_13:
e0 1c 07                       # 5245 |   push 0x7
e0 1c 02                       # 5248 |   push 0x2
5c f8 2a fe                    # 524b |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 524f |   mov SP, SP + 0x4
                               #      | _Z_call_13:
                               #      | _A_call_18:
e0 e0 ec 63                    # 5253 |   push ${const__data_1}
e0 1c 15                       # 5257 |   push 0x15
5c f8 60 00                    # 525a |   call ${fn_draw_str}:rel + PC
60 a0 bc 04                    # 525e |   mov SP, SP + 0x4
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 1c 07                       # 5262 |   push 0x7
e0 1c 03                       # 5265 |   push 0x3
5c f8 0d fe                    # 5268 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 526c |   mov SP, SP + 0x4
                               #      | _Z_call_19:
                               #      | _A_call_20:
e0 e0 f9 63                    # 5270 |   push ${const__data_2}
e0 1c 15                       # 5274 |   push 0x15
5c f8 43 00                    # 5277 |   call ${fn_draw_str}:rel + PC
60 a0 bc 04                    # 527b |   mov SP, SP + 0x4
                               #      | _Z_call_20:
                               #      | _A_call_21:
e0 1c 07                       # 527f |   push 0x7
e0 1c 09                       # 5282 |   push 0x9
5c f8 f0 fd                    # 5285 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5289 |   mov SP, SP + 0x4
                               #      | _Z_call_21:
                               #      | _A_call_22:
e0 e0 05 64                    # 528d |   push ${const__str__Next}
e0 1c 16                       # 5291 |   push 0x16
5c f8 26 00                    # 5294 |   call ${fn_draw_str}:rel + PC
60 a0 bc 04                    # 5298 |   mov SP, SP + 0x4
                               #      | _Z_call_22:
                               #      | _A_call_23:
e0 1c 07                       # 529c |   push 0x7
e0 1c 0d                       # 529f |   push 0xd
5c f8 d3 fd                    # 52a2 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 52a6 |   mov SP, SP + 0x4
                               #      | _Z_call_23:
                               #      | _A_call_24:
e0 e0 0a 64                    # 52aa |   push ${const__str__Held}
e0 1c 16                       # 52ae |   push 0x16
5c f8 09 00                    # 52b1 |   call ${fn_draw_str}:rel + PC
60 a0 bc 04                    # 52b5 |   mov SP, SP + 0x4
                               #      | _Z_call_24:
                               #      | _cleanup_fn_draw_main_interface:
dc                             # 52b9 |   ret
                               #      | _end_fn_draw_main_interface:
                               #      | 
                               #      | fn_draw_str:
                               #      | _begin_fn_draw_str:
e0 40                          # 52ba |   push B
e0 20                          # 52bc |   push A
61 20 bc 06                    # 52be |   mov A, [SP + 0x6]
61 40 bc 08                    # 52c2 |   mov B, [SP + 0x8]
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
fc 20 1c f8 28 24 00           # 52c6 |   jge A, 0x28, ${_C_loop_1}:rel + PC
65 ff 40                       # 52cd |   bmov H, [B]
e8 ff 00 f8 1a 00              # 52d0 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_call_17:
e0 ff                          # 52d6 |   push H
e0 20                          # 52d8 |   push A
5c f8 15 00                    # 52da |   call ${fn_draw_char}:rel + PC
60 a0 bc 04                    # 52de |   mov SP, SP + 0x4
                               #      | _Z_call_17:
44 20                          # 52e2 |   inc A
44 40                          # 52e4 |   inc B
                               #      | _BZ_loop_1:
58 f8 e0 ff                    # 52e6 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_draw_str:
e4 20                          # 52ea |   pop A
e4 40                          # 52ec |   pop B
dc                             # 52ee |   ret
                               #      | _end_fn_draw_str:
                               #      | 
                               #      | fn_draw_char:
                               #      | _begin_fn_draw_char:
e0 40                          # 52ef |   push B
e0 20                          # 52f1 |   push A
60 a0 bc e0                    # 52f3 |   mov SP, SP + -32
                               #      | _A_call_15:
e2 bc 28                       # 52f7 |   push [SP + 0x28]
e0 bc 02                       # 52fa |   push SP + 0x2
5c f8 1e 00                    # 52fd |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # 5301 |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_call_16:
e0 a0                          # 5305 |   push SP
e2 bc 28                       # 5307 |   push [SP + 0x28]
5c f8 25 01                    # 530a |   call ${fn_fill_cell_content}:rel + PC
60 a0 bc 04                    # 530e |   mov SP, SP + 0x4
                               #      | _Z_call_16:
                               #      | _cleanup_fn_draw_char:
60 a0 bc 20                    # 5312 |   mov SP, SP + 0x20
e4 20                          # 5316 |   pop A
e4 40                          # 5318 |   pop B
dc                             # 531a |   ret
                               #      | _end_fn_draw_char:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # 531b |   push B
e0 20                          # 531d |   push A
61 20 bc 08                    # 531f |   mov A, [SP + 0x8]
60 40 1c 1f                    # 5323 |   mov B, 0x1f
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 20 1c f8 20 13 00           # 5327 |   jlt A, 0x20, ${_C_scope_1}:rel + PC
fc 20 e0 f8 80 00 0c 00        # 532e |   jge A, 0x80, ${_C_scope_1}:rel + PC
60 40 3c e0                    # 5336 |   mov B, A + -32
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
28 40 1c 01                    # 533a |   shl B, 0x1
61 40 e8 2c 63                 # 533e |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_14:
e0 1c 0c                       # 5343 |   push 0xc
e0 1c 10                       # 5346 |   push 0x10
e0 e8 37 5f                    # 5349 |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # 534d |   push [SP + 0xc]
5c f8 0d 00                    # 5350 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # 5354 |   mov SP, SP + 0x8
                               #      | _Z_call_14:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # 5358 |   pop A
e4 40                          # 535a |   pop B
dc                             # 535c |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # 535d |   push D
e0 60                          # 535f |   push C
e0 40                          # 5361 |   push B
e0 20                          # 5363 |   push A
61 fc bc 0a                    # 5365 |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # 5369 |   shl F, [SP + 0xe], 0x1
00 fd fc                       # 536f |   add F, E
61 fe bc 0c                    # 5372 |   mov G, [SP + 0xc]
61 40 fe                       # 5376 |   mov B, [G]
60 60 1c 07                    # 5379 |   mov C, 0x7
60 20 00                       # 537d |   mov A, 0
60 a0 bc fe                    # 5380 |   mov SP, SP + -2
                               #      | _A_for_2:
                               #      | _BA_for_2:
fc fc fd f8 9e 00              # 5384 |   jge E, F, ${_C_for_2}:rel + PC
                               #      |   # decode one line
60 20 00                       # 538a |   mov A, 0
62 a0 1c ff                    # 538d |   mov [SP], -1
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_if_10:
ec 60 1c f8 ff 10 00           # 5391 |   jne C, -1, ${_E_if_10}:rel + PC
44 fe                          # 5398 |   inc G
61 40 fe                       # 539a |   mov B, [G]
60 60 1c 07                    # 539d |   mov C, 0x7
                               #      | _E_if_10:
                               #      | _C_if_10:
                               #      | _Z_if_10:
98 80 40 60                    # 53a1 |   getb D, B, C
48 60                          # 53a5 |   dec C
40 80                          # 53a7 |   bool D
b0 20 21 80                    # 53a9 |   or A, A*2, D
4a a0                          # 53ad |   dec [SP]
                               #      | _A_if_11:
ee a0 00 f8 1b 00              # 53af |   jne [SP], 0, ${_E_if_11}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # 53b5 |   mov H, A
b9 20 bc 12                    # 53b8 |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # 53bc |   shr A, -1, A + 0x10
ae fc ff 20                    # 53c2 |   and [E], H, A
58 f8 54 00                    # 53c6 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_11:
ec 20 00 f8 20 00              # 53ca |   jne A, 0, ${_E2_if_11}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # 53d0 |   sub H, E, 0x2
                               #      | _A_if_12:
f1 ff bc f8 0c 0e 00           # 53d5 |   jlt H, [SP + 0xc], ${_E_if_12}:rel + PC
63 fc ff                       # 53dc |   mov [E], [H]
58 f8 07 00                    # 53df |   jmp ${_C_if_12}:rel + PC
                               #      | _E_if_12:
62 fc 00                       # 53e3 |   mov [E], 0
                               #      | _C_if_12:
                               #      | _Z_if_12:
58 f8 34 00                    # 53e6 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E2_if_11:
ec 20 1c f8 02 13 00           # 53ea |   jne A, 0x2, ${_E3_if_11}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # 53f1 |   sub H, E, 0x4
63 fc ff                       # 53f6 |   mov [E], [H]
58 f8 21 00                    # 53f9 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E3_if_11:
ec 20 1c f8 06 0e 00           # 53fd |   jne A, 0x6, ${_E4_if_11}:rel + PC
                               #      |   # all zeros
62 fc 00                       # 5404 |   mov [E], 0
58 f8 13 00                    # 5407 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E4_if_11:
ec 20 1c f8 07 0b 00           # 540b |   jne A, 0x7, ${_E5_if_11}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # 5412 |   mov [SP], [SP + 0x12]
                               #      | _E5_if_11:
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _BZ_loop_2:
58 f8 7b ff                    # 5416 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _BZ_for_2:
00 fc 1c 02                    # 541a |   add E, 0x2
58 f8 66 ff                    # 541e |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # 5422 |   mov SP, SP + 0x2
e4 20                          # 5426 |   pop A
e4 40                          # 5428 |   pop B
e4 60                          # 542a |   pop C
e4 80                          # 542c |   pop D
dc                             # 542e |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_fill_cell_content:
                               #      | _begin_fn_fill_cell_content:
e0 40                          # 542f |   push B
e0 20                          # 5431 |   push A
a9 20 bc 1c 06 01              # 5433 |   shl A, [SP + 0x6], 0x1
61 40 bc 08                    # 5439 |   mov B, [SP + 0x8]
                               #      | _A_for_3:
60 20 e4 10 64                 # 543d |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_3:
fc 20 e0 f8 10 69 17 00        # 5442 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_3}:rel + PC
63 20 40                       # 544a |   mov [A], [B]
                               #      | _BZ_for_3:
60 20 3c 50                    # 544d |   mov A, A + 0x50
60 40 5c 02                    # 5451 |   mov B, B + 0x2
58 f8 ed ff                    # 5455 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_fill_cell_content:
e4 20                          # 5459 |   pop A
e4 40                          # 545b |   pop B
dc                             # 545d |   ret
                               #      | _end_fn_fill_cell_content:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_33:
5c f8 26 00                    # 545e |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_33:
                               #      | _A_if_22:
e8 ff 00 f8 0a 00              # 5462 |   jeq H, 0, ${_E_if_22}:rel + PC
                               #      | _A_call_43:
5c f8 90 01                    # 5468 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_43:
                               #      | _E_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _A_call_44:
5c f8 6e 06                    # 546c |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_44:
                               #      | _A_call_45:
e0 ff                          # 5470 |   push H
5c f8 6c 06                    # 5472 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5476 |   mov SP, SP + 0x2
                               #      | _Z_call_45:
                               #      | _A_call_48:
5c f8 65 06                    # 547a |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_48:
84 ff 1c ff 01                 # 547e |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5483 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 5484 |   push A
4a e0 0c 74                    # 5486 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_13:
d2 e0 00 0c 74                 # 548a |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 0f 00                    # 548f |   jgt ${_E_if_13}:rel + PC
                               #      | _A_call_32:
5c f8 11 00                    # 5493 |   call ${fn_tg_soft_drop}:rel + PC
                               #      | _Z_call_32:
c4 ff 00                       # 5497 |   inc H, 0
58 f8 07 00                    # 549a |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
60 ff 00                       # 549e |   mov H, 0
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 54a1 |   pop A
dc                             # 54a3 |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_soft_drop:
                               #      | _begin_fn_tg_soft_drop:
e0 20                          # 54a4 |   push A
                               #      | _A_call_27:
e0 00                          # 54a6 |   push 0
5c f8 4a 00                    # 54a8 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54ac |   mov SP, SP + 0x2
                               #      | _Z_call_27:
46 e0 f8 73                    # 54b0 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_28:
5c f8 ba 00                    # 54b4 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_28:
                               #      | _A_if_21:
ec ff 1c f8 01 19 00           # 54b8 |   jne H, 0x1, ${_E_if_21}:rel + PC
a9 20 e0 1c f2 73 01           # 54bf |   shl A, [${var__board__level}], 0x1
63 e0 e4 0c 74 0f 5f           # 54c6 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 54cd |   jmp ${_C_if_21}:rel + PC
                               #      | _E_if_21:
4a e0 f8 73                    # 54d1 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_29:
e0 1c 01                       # 54d5 |   push 0x1
5c f8 1a 00                    # 54d8 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54dc |   mov SP, SP + 0x2
                               #      | _Z_call_29:
                               #      | _A_call_30:
5c f8 cc fc                    # 54e0 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_30:
                               #      | _C_if_21:
                               #      | _Z_if_21:
                               #      | _A_call_31:
e0 1c 01                       # 54e4 |   push 0x1
5c f8 0b 00                    # 54e7 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54eb |   mov SP, SP + 0x2
                               #      | _Z_call_31:
                               #      | _cleanup_fn_tg_soft_drop:
e4 20                          # 54ef |   pop A
dc                             # 54f1 |   ret
                               #      | _end_fn_tg_soft_drop:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 54f2 |   push D
e0 60                          # 54f4 |   push C
e0 40                          # 54f6 |   push B
e0 20                          # 54f8 |   push A
60 20 e0 f4 73                 # 54fa |   mov A, ${var__board__falling}
c9 40 20                       # 54ff |   dec B, [A]
e8 40 1c f8 ff 63 00           # 5502 |   jeq B, -1, ${_cleanup_fn_tg_put}:rel + PC
a9 80 3c 1c 02 01              # 5509 |   shl D, [A + 0x2], 0x1
60 80 53                       # 550f |   mov D, B*8 + D
61 80 f0 d7 5e                 # 5512 |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 5517 |   inc A, B
                               #      | _A_for_4:
60 60 00                       # 551a |   mov C, 0
                               #      | _BA_for_4:
fc 60 1c f8 04 48 00           # 551d |   jge C, 0x4, ${_C_for_4}:rel + PC
a0 40 80 7e 02                 # 5524 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 5529 |   shr E, D, C*4
2c 40 1c 03                    # 552d |   and B, 0x3
2c fc 1c 03                    # 5531 |   and E, 0x3
81 fe e0 40 f8 73              # 5535 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc fa 73              # 553b |   add B, [${var__board__falling} + 0006], E
88 fd 1c fe 0a                 # 5541 |   mul F, 0xa, G
00 fd e0 12 73                 # 5546 |   add F, ${var__board__board_state}
00 fd 40                       # 554b |   add F, B
                               #      | _A_if_15:
ee bc 00 f8 0a 0e 00           # 554e |   jne [SP + 0xa], 0, ${_E_if_15}:rel + PC
66 fd 00                       # 5555 |   bmov [F], 0
58 f8 07 00                    # 5558 |   jmp ${_C_if_15}:rel + PC
                               #      | _E_if_15:
66 fd 20                       # 555c |   bmov [F], A
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _BZ_for_4:
44 60                          # 555f |   inc C
58 f8 bc ff                    # 5561 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 5565 |   pop A
e4 40                          # 5567 |   pop B
e4 60                          # 5569 |   pop C
e4 80                          # 556b |   pop D
dc                             # 556d |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 556e |   push D
e0 60                          # 5570 |   push C
e0 40                          # 5572 |   push B
e0 20                          # 5574 |   push A
c9 40 e0 f4 73                 # 5576 |   dec B, [${var__board__falling}]
a9 80 e0 1c f6 73 01           # 557b |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 5582 |   mov D, B*8 + D
61 80 f0 d7 5e                 # 5585 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_5:
60 60 00                       # 558a |   mov C, 0
                               #      | _BA_for_5:
fc 60 1c f8 04 5f 00           # 558d |   jge C, 0x4, ${_C_for_5}:rel + PC
a0 20 80 7e 02                 # 5594 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 5599 |   shr E, D, C*4
2c 20 1c 03                    # 559d |   and A, 0x3
2c fc 1c 03                    # 55a1 |   and E, 0x3
81 fe e0 20 f8 73              # 55a5 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc fa 73              # 55ab |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 55b1 |   mov H, 0
d0 fe 00                       # 55b4 |   icmp G, 0
70 f8 38 00                    # 55b7 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 55bb |   icmp B, 0
70 f8 31 00                    # 55be |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2d 00           # 55c2 |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 26 00           # 55c9 |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 55d0 |   mul F, G, 0xa
00 fd e8 12 73                 # 55d5 |   add F, ${var__board__board_state} + B
65 fd fd                       # 55da |   bmov F, [F]
60 ff 00                       # 55dd |   mov H, 0
ec fd 00 f8 0f 00              # 55e0 |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_5:
44 60                          # 55e6 |   inc C
58 f8 a5 ff                    # 55e8 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      |   # done checking, all good
c4 ff 00                       # 55ec |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 55ef |   pop A
e4 40                          # 55f1 |   pop B
e4 60                          # 55f3 |   pop C
e4 80                          # 55f5 |   pop D
dc                             # 55f7 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_tg_display:
                               #      | _begin_fn_tg_display:
                               #      | _A_call_42:
5c f8 05 00                    # 55f8 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_42:
                               #      | _cleanup_fn_tg_display:
dc                             # 55fc |   ret
                               #      | _end_fn_tg_display:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 55fd |   push D
e0 60                          # 55ff |   push C
e0 40                          # 5601 |   push B
e0 20                          # 5603 |   push A
60 a0 bc fc                    # 5605 |   mov SP, SP + -4
62 a0 1c 15                    # 5609 |   mov [SP], 0x15
                               #      | _A_for_6:
60 20 00                       # 560d |   mov A, 0
                               #      | _BA_for_6:
fc 20 1c f8 16 bb 01           # 5610 |   jge A, 0x16, ${_C_for_6}:rel + PC
62 bc 20 02                    # 5617 |   mov [SP + 0x2], A
60 fe 3c 02                    # 561b |   mov G, A + 0x2
                               #      | _A_call_34:
e0 fe                          # 561f |   push G
5c f8 2c 02                    # 5621 |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 5625 |   mov SP, SP + 0x2
                               #      | _Z_call_34:
                               #      | _A_for_7:
e0 20                          # 5629 |   push A
60 40 00                       # 562b |   mov B, 0
                               #      | _BA_for_7:
fc 40 1c f8 0a 95 01           # 562e |   jge B, 0xa, ${_C_for_7}:rel + PC
60 60 1c 0a                    # 5635 |   mov C, 0xa
60 fe 00                       # 5639 |   mov G, 0
                               #      | _A_if_23:
ec 40 7c f8 ff 0c 00           # 563c |   jne B, C + -1, ${_E_if_23}:rel + PC
60 fe e0 00 80                 # 5643 |   mov G, 0x8000
                               #      | _E_if_23:
                               #      | _C_if_23:
                               #      | _Z_if_23:
                               #      | _A_if_24:
ec 40 00 f8 0a 00              # 5648 |   jne B, 0, ${_E_if_24}:rel + PC
30 fe 1c 01                    # 564e |   or G, 0x1
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
89 80 bc 60 04                 # 5652 |   mul D, [SP + 0x4], C
80 80 88 e0 12 73              # 5657 |   add D, D + B, ${var__board__board_state}
65 20 80                       # 565d |   bmov A, [D]
60 60 5c 0a                    # 5660 |   mov C, B + 0xa
80 60 e0 61 10 64              # 5664 |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_25:
ec 20 00 f8 4f 00              # 566a |   jne A, 0, ${_E_if_25}:rel + PC
                               #      | _A_for_8:
60 80 00                       # 5670 |   mov D, 0
                               #      | _BA_for_8:
fc 80 e0 f8 00 0f 16 00        # 5673 |   jge D, 0xf00, ${_C_for_8}:rel + PC
b2 70 1c fe 01                 # 567b |   or [C + D], 0x1, G
                               #      | _BZ_for_8:
60 80 f0 a0 00                 # 5680 |   mov D, 0xa0 + D
58 f8 ee ff                    # 5685 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _A_for_9:
60 80 1c 50                    # 5689 |   mov D, 0x50
                               #      | _BA_for_9:
fc 80 e0 f8 00 0f 15 00        # 568d |   jge D, 0xf00, ${_C_for_9}:rel + PC
b2 70 00 fe                    # 5695 |   or [C + D], 0, G
                               #      | _BZ_for_9:
60 80 f0 a0 00                 # 5699 |   mov D, 0xa0 + D
58 f8 ef ff                    # 569e |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
62 60 e0 55 55                 # 56a2 |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 56a7 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 56ae |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 56b5 |   jmp ${_C_if_25}:rel + PC
                               #      | _E_if_25:
98 ff 20 00                    # 56b9 |   getb H, A, 0
                               #      | _A_if_26:
e8 ff 00 f8 0b 00              # 56bd |   jeq H, 0, ${_E_if_26}:rel + PC
60 ff e0 ff 7f                 # 56c3 |   mov H, 0x7fff
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _A_for_10:
60 80 00                       # 56c8 |   mov D, 0
                               #      | _BA_for_10:
fc 80 e0 f8 b0 04 15 00        # 56cb |   jge D, 0x4b0, ${_C_for_10}:rel + PC
b2 70 ff fe                    # 56d3 |   or [C + D], H, G
                               #      | _BZ_for_10:
60 80 f0 a0 00                 # 56d7 |   mov D, 0xa0 + D
58 f8 ef ff                    # 56dc |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
                               #      | _A_for_11:
60 80 1c 50                    # 56e0 |   mov D, 0x50
                               #      | _BA_for_11:
fc 80 e0 f8 b0 04 15 00        # 56e4 |   jge D, 0x4b0, ${_C_for_11}:rel + PC
b2 70 ff fe                    # 56ec |   or [C + D], H, G
                               #      | _BZ_for_11:
60 80 f0 a0 00                 # 56f0 |   mov D, 0xa0 + D
58 f8 ef ff                    # 56f5 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
62 70 00                       # 56f9 |   mov [C + D], 0
98 ff 20 1c 01                 # 56fc |   getb H, A, 0x1
                               #      | _A_if_27:
e8 ff 00 f8 0b 00              # 5701 |   jeq H, 0, ${_E_if_27}:rel + PC
60 ff e0 ff 7f                 # 5707 |   mov H, 0x7fff
                               #      | _E_if_27:
                               #      | _C_if_27:
                               #      | _Z_if_27:
                               #      | _A_for_12:
60 80 e0 00 05                 # 570c |   mov D, 0x500
                               #      | _BA_for_12:
fc 80 e0 f8 b0 09 15 00        # 5711 |   jge D, 0x9b0, ${_C_for_12}:rel + PC
b2 70 ff fe                    # 5719 |   or [C + D], H, G
                               #      | _BZ_for_12:
60 80 f0 a0 00                 # 571d |   mov D, 0xa0 + D
58 f8 ef ff                    # 5722 |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _A_for_13:
60 80 e0 50 05                 # 5726 |   mov D, 0x550
                               #      | _BA_for_13:
fc 80 e0 f8 b0 09 15 00        # 572b |   jge D, 0x9b0, ${_C_for_13}:rel + PC
b2 70 ff fe                    # 5733 |   or [C + D], H, G
                               #      | _BZ_for_13:
60 80 f0 a0 00                 # 5737 |   mov D, 0xa0 + D
58 f8 ef ff                    # 573c |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
62 70 00                       # 5740 |   mov [C + D], 0
98 ff 20 1c 02                 # 5743 |   getb H, A, 0x2
                               #      | _A_if_28:
e8 ff 00 f8 0b 00              # 5748 |   jeq H, 0, ${_E_if_28}:rel + PC
60 ff e0 ff 7f                 # 574e |   mov H, 0x7fff
                               #      | _E_if_28:
                               #      | _C_if_28:
                               #      | _Z_if_28:
                               #      | _A_for_14:
60 80 e0 00 0a                 # 5753 |   mov D, 0xa00
                               #      | _BA_for_14:
fc 80 e0 f8 b0 0e 15 00        # 5758 |   jge D, 0xeb0, ${_C_for_14}:rel + PC
b2 70 ff fe                    # 5760 |   or [C + D], H, G
                               #      | _BZ_for_14:
60 80 f0 a0 00                 # 5764 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5769 |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
                               #      | _Z_for_14:
                               #      | _A_for_15:
60 80 e0 50 0a                 # 576d |   mov D, 0xa50
                               #      | _BA_for_15:
fc 80 e0 f8 b0 0e 15 00        # 5772 |   jge D, 0xeb0, ${_C_for_15}:rel + PC
b2 70 ff fe                    # 577a |   or [C + D], H, G
                               #      | _BZ_for_15:
60 80 f0 a0 00                 # 577e |   mov D, 0xa0 + D
58 f8 ef ff                    # 5783 |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
62 70 00                       # 5787 |   mov [C + D], 0
                               #      | _C_if_25:
                               #      | _Z_if_25:
61 20 bc 04                    # 578a |   mov A, [SP + 0x4]
                               #      | _A_if_29:
ed 20 bc f8 02 19 00           # 578e |   jne A, [SP + 0x2], ${_E_if_29}:rel + PC
62 ec 1c b0 04 ff              # 5795 |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 579b |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 57a1 |   mov [0xeb0 + C], -1
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _A_if_30:
ec 20 00 f8 16 00              # 57a7 |   jne A, 0, ${_E_if_30}:rel + PC
62 60 1c ff                    # 57ad |   mov [C], -1
62 ec 1c 00 05 ff              # 57b1 |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 57b7 |   mov [0xa00 + C], -1
                               #      | _E_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
                               #      | _BZ_for_7:
44 40                          # 57bd |   inc B
58 f8 6f fe                    # 57bf |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
e4 20                          # 57c3 |   pop A
                               #      | _Z_for_7:
                               #      | _BZ_for_6:
44 20                          # 57c5 |   inc A
58 f8 49 fe                    # 57c7 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_35:
e0 1c 08                       # 57cb |   push 0x8
e0 00                          # 57ce |   push 0
e0 e0 10 74                    # 57d0 |   push ${var__var_1}
5c f8 98 f9                    # 57d4 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 57d8 |   mov SP, SP + 0x6
                               #      | _Z_call_35:
                               #      | _A_call_36:
e0 1c 01                       # 57dc |   push 0x1
e0 00                          # 57df |   push 0
e0 00                          # 57e1 |   push 0
e0 1c 04                       # 57e3 |   push 0x4
e0 e0 fc 73                    # 57e6 |   push ${var__board__next}
e0 e0 10 74                    # 57ea |   push ${var__var_1}
5c f8 99 00                    # 57ee |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 57f2 |   mov SP, SP + 0xc
                               #      | _Z_call_36:
                               #      | _A_call_38:
e0 1c 0a                       # 57f6 |   push 0xa
5c f8 06 01                    # 57f9 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 57fd |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _A_call_39:
e0 1c 08                       # 5801 |   push 0x8
e0 00                          # 5804 |   push 0
e0 e0 10 74                    # 5806 |   push ${var__var_1}
5c f8 62 f9                    # 580a |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 580e |   mov SP, SP + 0x6
                               #      | _Z_call_39:
                               #      | _A_if_41:
ea e0 1c f8 04 74 ff 23 00     # 5812 |   jeq [${var__board__stored}], -1, ${_E_if_41}:rel + PC
                               #      | _A_call_40:
e0 1c 01                       # 581b |   push 0x1
e0 00                          # 581e |   push 0
e0 00                          # 5820 |   push 0
e0 1c 04                       # 5822 |   push 0x4
e0 e0 04 74                    # 5825 |   push ${var__board__stored}
e0 e0 10 74                    # 5829 |   push ${var__var_1}
5c f8 5a 00                    # 582d |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 5831 |   mov SP, SP + 0xc
                               #      | _Z_call_40:
                               #      | _E_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
                               #      | _A_call_41:
e0 1c 0e                       # 5835 |   push 0xe
5c f8 c7 00                    # 5838 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 583c |   mov SP, SP + 0x2
                               #      | _Z_call_41:
                               #      | _cleanup_fn_display_board:
60 a0 bc 04                    # 5840 |   mov SP, SP + 0x4
e4 20                          # 5844 |   pop A
e4 40                          # 5846 |   pop B
e4 60                          # 5848 |   pop C
e4 80                          # 584a |   pop D
dc                             # 584c |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_page_rgb:
                               #      | _begin_fn_switch_screen_page_rgb:
e0 40                          # 584d |   push B
e0 20                          # 584f |   push A
60 20 e0 a1 00                 # 5851 |   mov A, 0xa1
89 40 bc e0 06 00 05           # 5856 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 10 64 0f 69 04     # 585d |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
60 20 e0 a2 00                 # 5866 |   mov A, 0xa2
54 e0 e0 1c 10 69 0f 6e 05     # 586b |   mmap ${var__VIDEO_ROW_BUFFER} + 0500, ${var__VIDEO_ROW_BUFFER} + 09ff, 0x5
60 20 e0 a4 00                 # 5874 |   mov A, 0xa4
54 e0 e0 1c 10 6e 0f 73 06     # 5879 |   mmap ${var__VIDEO_ROW_BUFFER} + 0a00, ${var__VIDEO_ROW_BUFFER} + 0eff, 0x6
                               #      | _cleanup_fn_switch_screen_page_rgb:
e4 20                          # 5882 |   pop A
e4 40                          # 5884 |   pop B
dc                             # 5886 |   ret
                               #      | _end_fn_switch_screen_page_rgb:
                               #      | 
                               #      | fn_tg_put_generic:
                               #      | _begin_fn_tg_put_generic:
e0 80                          # 5887 |   push D
e0 60                          # 5889 |   push C
e0 40                          # 588b |   push B
e0 20                          # 588d |   push A
61 20 bc 0c                    # 588f |   mov A, [SP + 0xc]
c9 40 20                       # 5893 |   dec B, [A]
e8 40 1c f8 ff 60 00           # 5896 |   jeq B, -1, ${_cleanup_fn_tg_put_generic}:rel + PC
a9 80 3c 1c 02 01              # 589d |   shl D, [A + 0x2], 0x1
60 80 53                       # 58a3 |   mov D, B*8 + D
61 80 f0 d7 5e                 # 58a6 |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 58ab |   inc A, B
                               #      | _A_for_16:
60 60 00                       # 58ae |   mov C, 0
                               #      | _BA_for_16:
fc 60 1c f8 04 45 00           # 58b1 |   jge C, 0x4, ${_C_for_16}:rel + PC
a0 40 80 7e 02                 # 58b8 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 58bd |   shr E, D, C*4
2c 40 1c 03                    # 58c1 |   and B, 0x3
2c fc 1c 03                    # 58c5 |   and E, 0x3
81 fe bc 40 10                 # 58c9 |   add G, [SP + 0x10], B
81 40 bc fc 12                 # 58ce |   add B, [SP + 0x12], E
89 fd bc fe 0e                 # 58d3 |   mul F, [SP + 0xe], G
01 fd bc 0a                    # 58d8 |   add F, [SP + 0xa]
00 fd 40                       # 58dc |   add F, B
                               #      | _A_if_32:
ee bc 00 f8 14 0e 00           # 58df |   jne [SP + 0x14], 0, ${_E_if_32}:rel + PC
66 fd 00                       # 58e6 |   bmov [F], 0
58 f8 07 00                    # 58e9 |   jmp ${_C_if_32}:rel + PC
                               #      | _E_if_32:
66 fd 20                       # 58ed |   bmov [F], A
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _BZ_for_16:
44 60                          # 58f0 |   inc C
58 f8 bf ff                    # 58f2 |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
                               #      | _Z_for_16:
                               #      | _cleanup_fn_tg_put_generic:
e4 20                          # 58f6 |   pop A
e4 40                          # 58f8 |   pop B
e4 60                          # 58fa |   pop C
e4 80                          # 58fc |   pop D
dc                             # 58fe |   ret
                               #      | _end_fn_tg_put_generic:
                               #      | 
                               #      | fn_draw_small_board:
                               #      | _begin_fn_draw_small_board:
e0 80                          # 58ff |   push D
e0 60                          # 5901 |   push C
e0 40                          # 5903 |   push B
e0 20                          # 5905 |   push A
60 a0 bc fc                    # 5907 |   mov SP, SP + -4
c6 a0 00                       # 590b |   inc [SP], 0
                               #      | _A_for_17:
60 20 00                       # 590e |   mov A, 0
                               #      | _BA_for_17:
fc 20 1c f8 02 bc 01           # 5911 |   jge A, 0x2, ${_C_for_17}:rel + PC
62 bc 20 02                    # 5918 |   mov [SP + 0x2], A
81 fe bc 20 0e                 # 591c |   add G, [SP + 0xe], A
                               #      | _A_call_37:
e0 fe                          # 5921 |   push G
5c f8 2a ff                    # 5923 |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 5927 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
                               #      | _A_for_18:
e0 20                          # 592b |   push A
60 40 00                       # 592d |   mov B, 0
                               #      | _BA_for_18:
fc 40 1c f8 04 95 01           # 5930 |   jge B, 0x4, ${_C_for_18}:rel + PC
60 60 1c 04                    # 5937 |   mov C, 0x4
60 fe 00                       # 593b |   mov G, 0
                               #      | _A_if_33:
ec 40 7c f8 ff 0c 00           # 593e |   jne B, C + -1, ${_E_if_33}:rel + PC
60 fe e0 00 80                 # 5945 |   mov G, 0x8000
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _A_if_34:
ec 40 00 f8 0a 00              # 594a |   jne B, 0, ${_E_if_34}:rel + PC
30 fe 1c 01                    # 5950 |   or G, 0x1
                               #      | _E_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
89 80 bc 60 04                 # 5954 |   mul D, [SP + 0x4], C
80 80 88 e0 10 74              # 5959 |   add D, D + B, ${var__var_1}
65 20 80                       # 595f |   bmov A, [D]
60 60 5c 16                    # 5962 |   mov C, B + 0x16
80 60 e0 61 10 64              # 5966 |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_35:
ec 20 00 f8 4f 00              # 596c |   jne A, 0, ${_E_if_35}:rel + PC
                               #      | _A_for_19:
60 80 00                       # 5972 |   mov D, 0
                               #      | _BA_for_19:
fc 80 e0 f8 00 0f 16 00        # 5975 |   jge D, 0xf00, ${_C_for_19}:rel + PC
b2 70 1c fe 01                 # 597d |   or [C + D], 0x1, G
                               #      | _BZ_for_19:
60 80 f0 a0 00                 # 5982 |   mov D, 0xa0 + D
58 f8 ee ff                    # 5987 |   jmp ${_BA_for_19}:rel + PC
                               #      | _C_for_19:
                               #      | _Z_for_19:
                               #      | _A_for_20:
60 80 1c 50                    # 598b |   mov D, 0x50
                               #      | _BA_for_20:
fc 80 e0 f8 00 0f 15 00        # 598f |   jge D, 0xf00, ${_C_for_20}:rel + PC
b2 70 00 fe                    # 5997 |   or [C + D], 0, G
                               #      | _BZ_for_20:
60 80 f0 a0 00                 # 599b |   mov D, 0xa0 + D
58 f8 ef ff                    # 59a0 |   jmp ${_BA_for_20}:rel + PC
                               #      | _C_for_20:
                               #      | _Z_for_20:
62 60 e0 55 55                 # 59a4 |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 59a9 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 59b0 |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 59b7 |   jmp ${_C_if_35}:rel + PC
                               #      | _E_if_35:
98 ff 20 00                    # 59bb |   getb H, A, 0
                               #      | _A_if_36:
e8 ff 00 f8 0b 00              # 59bf |   jeq H, 0, ${_E_if_36}:rel + PC
60 ff e0 ff 7f                 # 59c5 |   mov H, 0x7fff
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _A_for_21:
60 80 00                       # 59ca |   mov D, 0
                               #      | _BA_for_21:
fc 80 e0 f8 b0 04 15 00        # 59cd |   jge D, 0x4b0, ${_C_for_21}:rel + PC
b2 70 ff fe                    # 59d5 |   or [C + D], H, G
                               #      | _BZ_for_21:
60 80 f0 a0 00                 # 59d9 |   mov D, 0xa0 + D
58 f8 ef ff                    # 59de |   jmp ${_BA_for_21}:rel + PC
                               #      | _C_for_21:
                               #      | _Z_for_21:
                               #      | _A_for_22:
60 80 1c 50                    # 59e2 |   mov D, 0x50
                               #      | _BA_for_22:
fc 80 e0 f8 b0 04 15 00        # 59e6 |   jge D, 0x4b0, ${_C_for_22}:rel + PC
b2 70 ff fe                    # 59ee |   or [C + D], H, G
                               #      | _BZ_for_22:
60 80 f0 a0 00                 # 59f2 |   mov D, 0xa0 + D
58 f8 ef ff                    # 59f7 |   jmp ${_BA_for_22}:rel + PC
                               #      | _C_for_22:
                               #      | _Z_for_22:
62 70 00                       # 59fb |   mov [C + D], 0
98 ff 20 1c 01                 # 59fe |   getb H, A, 0x1
                               #      | _A_if_37:
e8 ff 00 f8 0b 00              # 5a03 |   jeq H, 0, ${_E_if_37}:rel + PC
60 ff e0 ff 7f                 # 5a09 |   mov H, 0x7fff
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _A_for_23:
60 80 e0 00 05                 # 5a0e |   mov D, 0x500
                               #      | _BA_for_23:
fc 80 e0 f8 b0 09 15 00        # 5a13 |   jge D, 0x9b0, ${_C_for_23}:rel + PC
b2 70 ff fe                    # 5a1b |   or [C + D], H, G
                               #      | _BZ_for_23:
60 80 f0 a0 00                 # 5a1f |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a24 |   jmp ${_BA_for_23}:rel + PC
                               #      | _C_for_23:
                               #      | _Z_for_23:
                               #      | _A_for_24:
60 80 e0 50 05                 # 5a28 |   mov D, 0x550
                               #      | _BA_for_24:
fc 80 e0 f8 b0 09 15 00        # 5a2d |   jge D, 0x9b0, ${_C_for_24}:rel + PC
b2 70 ff fe                    # 5a35 |   or [C + D], H, G
                               #      | _BZ_for_24:
60 80 f0 a0 00                 # 5a39 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a3e |   jmp ${_BA_for_24}:rel + PC
                               #      | _C_for_24:
                               #      | _Z_for_24:
62 70 00                       # 5a42 |   mov [C + D], 0
98 ff 20 1c 02                 # 5a45 |   getb H, A, 0x2
                               #      | _A_if_38:
e8 ff 00 f8 0b 00              # 5a4a |   jeq H, 0, ${_E_if_38}:rel + PC
60 ff e0 ff 7f                 # 5a50 |   mov H, 0x7fff
                               #      | _E_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
                               #      | _A_for_25:
60 80 e0 00 0a                 # 5a55 |   mov D, 0xa00
                               #      | _BA_for_25:
fc 80 e0 f8 b0 0e 15 00        # 5a5a |   jge D, 0xeb0, ${_C_for_25}:rel + PC
b2 70 ff fe                    # 5a62 |   or [C + D], H, G
                               #      | _BZ_for_25:
60 80 f0 a0 00                 # 5a66 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a6b |   jmp ${_BA_for_25}:rel + PC
                               #      | _C_for_25:
                               #      | _Z_for_25:
                               #      | _A_for_26:
60 80 e0 50 0a                 # 5a6f |   mov D, 0xa50
                               #      | _BA_for_26:
fc 80 e0 f8 b0 0e 15 00        # 5a74 |   jge D, 0xeb0, ${_C_for_26}:rel + PC
b2 70 ff fe                    # 5a7c |   or [C + D], H, G
                               #      | _BZ_for_26:
60 80 f0 a0 00                 # 5a80 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a85 |   jmp ${_BA_for_26}:rel + PC
                               #      | _C_for_26:
                               #      | _Z_for_26:
62 70 00                       # 5a89 |   mov [C + D], 0
                               #      | _C_if_35:
                               #      | _Z_if_35:
61 20 bc 04                    # 5a8c |   mov A, [SP + 0x4]
                               #      | _A_if_39:
ed 20 bc f8 02 19 00           # 5a90 |   jne A, [SP + 0x2], ${_E_if_39}:rel + PC
62 ec 1c b0 04 ff              # 5a97 |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 5a9d |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 5aa3 |   mov [0xeb0 + C], -1
                               #      | _E_if_39:
                               #      | _C_if_39:
                               #      | _Z_if_39:
                               #      | _A_if_40:
ec 20 00 f8 16 00              # 5aa9 |   jne A, 0, ${_E_if_40}:rel + PC
62 60 1c ff                    # 5aaf |   mov [C], -1
62 ec 1c 00 05 ff              # 5ab3 |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 5ab9 |   mov [0xa00 + C], -1
                               #      | _E_if_40:
                               #      | _C_if_40:
                               #      | _Z_if_40:
                               #      | _BZ_for_18:
44 40                          # 5abf |   inc B
58 f8 6f fe                    # 5ac1 |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
e4 20                          # 5ac5 |   pop A
                               #      | _Z_for_18:
                               #      | _BZ_for_17:
44 20                          # 5ac7 |   inc A
58 f8 48 fe                    # 5ac9 |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
                               #      | _Z_for_17:
                               #      | _cleanup_fn_draw_small_board:
60 a0 bc 04                    # 5acd |   mov SP, SP + 0x4
e4 20                          # 5ad1 |   pop A
e4 40                          # 5ad3 |   pop B
e4 60                          # 5ad5 |   pop C
e4 80                          # 5ad7 |   pop D
dc                             # 5ad9 |   ret
                               #      | _end_fn_draw_small_board:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 5ada |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 5add |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 5ade |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 5adf |   push D
e0 60                          # 5ae1 |   push C
e0 40                          # 5ae3 |   push B
e0 20                          # 5ae5 |   push A
60 60 00                       # 5ae7 |   mov C, 0
                               #      | _A_call_46:
e0 00                          # 5aea |   push 0
5c f8 06 fa                    # 5aec |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5af0 |   mov SP, SP + 0x2
                               #      | _Z_call_46:
                               #      | _A_for_27:
60 20 00                       # 5af4 |   mov A, 0
                               #      | _BA_for_27:
fc 20 1c f8 02 37 00           # 5af7 |   jge A, 0x2, ${_C_for_27}:rel + PC
                               #      | _A_for_28:
60 40 00                       # 5afe |   mov B, 0
                               #      | _BA_for_28:
fc 40 1c f8 0a 27 00           # 5b01 |   jge B, 0xa, ${_C_for_28}:rel + PC
88 80 20 1c 0a                 # 5b08 |   mul D, A, 0xa
00 80 e8 12 73                 # 5b0d |   add D, ${var__board__board_state} + B
65 ff 80                       # 5b12 |   bmov H, [D]
                               #      | _A_if_42:
e8 ff 00 f8 0d 00              # 5b15 |   jeq H, 0, ${_E_if_42}:rel + PC
c4 60 00                       # 5b1b |   inc C, 0
58 f8 10 00                    # 5b1e |   jmp ${_C_for_27}:rel + PC
                               #      | _E_if_42:
                               #      | _C_if_42:
                               #      | _Z_if_42:
                               #      | _BZ_for_28:
44 40                          # 5b22 |   inc B
58 f8 dd ff                    # 5b24 |   jmp ${_BA_for_28}:rel + PC
                               #      | _C_for_28:
                               #      | _Z_for_28:
                               #      | _BZ_for_27:
44 20                          # 5b28 |   inc A
58 f8 cd ff                    # 5b2a |   jmp ${_BA_for_27}:rel + PC
                               #      | _C_for_27:
                               #      | _Z_for_27:
                               #      | _A_call_47:
e0 1c 01                       # 5b2e |   push 0x1
5c f8 c1 f9                    # 5b31 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5b35 |   mov SP, SP + 0x2
                               #      | _Z_call_47:
60 ff 60                       # 5b39 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 5b3c |   pop A
e4 40                          # 5b3e |   pop B
e4 60                          # 5b40 |   pop C
e4 80                          # 5b42 |   pop D
dc                             # 5b44 |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
e0 20                          # 5b45 |   push A
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
61 fe e0 06 ff                 # 5b47 |   mov G, [0xff06]
ac ff fe e0 00 80              # 5b4c |   and H, G, 0x8000
e8 ff 00 f8 ba 00              # 5b52 |   jeq H, 0, ${_C_loop_4}:rel + PC
a9 ff e0 1c 1c 74 08           # 5b58 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 5b5f |   and G, 0xff
30 ff fe                       # 5b64 |   or H, G
62 e0 ff 1c 74                 # 5b67 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5b6c |   shr G, H, 0x8
2c ff e0 ff 00                 # 5b71 |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 5b76 |   jeq G, 0xf0, ${_BA_loop_4}:rel + PC
60 fe 00                       # 5b7e |   mov G, 0
                               #      | _A_if_46:
ec ff 1c f8 75 0f 00           # 5b81 |   jne H, 0x75, ${_E_if_46}:rel + PC
60 fe 1c 03                    # 5b88 |   mov G, 0x3
58 f8 68 00                    # 5b8c |   jmp ${_C_if_46}:rel + PC
                               #      | _E_if_46:
ec ff 1c f8 74 0f 00           # 5b90 |   jne H, 0x74, ${_E2_if_46}:rel + PC
60 fe 1c 02                    # 5b97 |   mov G, 0x2
58 f8 59 00                    # 5b9b |   jmp ${_C_if_46}:rel + PC
                               #      | _E2_if_46:
ec ff 1c f8 6b 0e 00           # 5b9f |   jne H, 0x6b, ${_E3_if_46}:rel + PC
c4 fe 00                       # 5ba6 |   inc G, 0
58 f8 4b 00                    # 5ba9 |   jmp ${_C_if_46}:rel + PC
                               #      | _E3_if_46:
ec ff 1c f8 72 0f 00           # 5bad |   jne H, 0x72, ${_E4_if_46}:rel + PC
60 fe 1c 06                    # 5bb4 |   mov G, 0x6
58 f8 3c 00                    # 5bb8 |   jmp ${_C_if_46}:rel + PC
                               #      | _E4_if_46:
ec ff 1c f8 21 0f 00           # 5bbc |   jne H, 0x21, ${_E5_if_46}:rel + PC
60 fe 1c 07                    # 5bc3 |   mov G, 0x7
58 f8 2d 00                    # 5bc7 |   jmp ${_C_if_46}:rel + PC
                               #      | _E5_if_46:
ec ff 1c f8 1a 0f 00           # 5bcb |   jne H, 0x1a, ${_E6_if_46}:rel + PC
60 fe 1c 04                    # 5bd2 |   mov G, 0x4
58 f8 1e 00                    # 5bd6 |   jmp ${_C_if_46}:rel + PC
                               #      | _E6_if_46:
ec ff 1c f8 22 0f 00           # 5bda |   jne H, 0x22, ${_E7_if_46}:rel + PC
60 fe 1c 03                    # 5be1 |   mov G, 0x3
58 f8 0f 00                    # 5be5 |   jmp ${_C_if_46}:rel + PC
                               #      | _E7_if_46:
ec ff 1c f8 11 0b 00           # 5be9 |   jne H, 0x11, ${_E8_if_46}:rel + PC
60 fe 1c 05                    # 5bf0 |   mov G, 0x5
                               #      | _E8_if_46:
                               #      | _C_if_46:
                               #      | _Z_if_46:
                               #      | _A_if_47:
e8 fe 00 f8 14 00              # 5bf4 |   jeq G, 0, ${_E_if_47}:rel + PC
                               #      | _A_call_74:
e0 fe                          # 5bfa |   push G
5c f8 86 00                    # 5bfc |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5c00 |   mov SP, SP + 0x2
                               #      | _Z_call_74:
                               #      | _A_call_75:
5c f8 f4 f9                    # 5c04 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_75:
                               #      | _E_if_47:
                               #      | _C_if_47:
                               #      | _Z_if_47:
                               #      | _BZ_loop_4:
58 f8 3f ff                    # 5c08 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
61 ff e0 0e ff                 # 5c0c |   mov H, [0xff0e]
                               #      | _A_if_56:
e9 ff e0 f8 1a 74 6e 00        # 5c11 |   jeq H, [${var__last_btn_in}], ${_E_if_56}:rel + PC
62 e0 ff 1a 74                 # 5c19 |   mov [${var__last_btn_in}], H
60 fe 00                       # 5c1e |   mov G, 0
98 20 ff 1c 0c                 # 5c21 |   getb A, H, 0xc
                               #      | _A_if_57:
e8 20 00 f8 0a 00              # 5c26 |   jeq A, 0, ${_E_if_57}:rel + PC
60 fe 1c 03                    # 5c2c |   mov G, 0x3
                               #      | _E_if_57:
                               #      | _C_if_57:
                               #      | _Z_if_57:
98 20 ff 1c 0b                 # 5c30 |   getb A, H, 0xb
                               #      | _A_if_58:
e8 20 00 f8 0a 00              # 5c35 |   jeq A, 0, ${_E_if_58}:rel + PC
60 fe 1c 02                    # 5c3b |   mov G, 0x2
                               #      | _E_if_58:
                               #      | _C_if_58:
                               #      | _Z_if_58:
98 20 ff 1c 0a                 # 5c3f |   getb A, H, 0xa
                               #      | _A_if_59:
e8 20 00 f8 09 00              # 5c44 |   jeq A, 0, ${_E_if_59}:rel + PC
c4 fe 00                       # 5c4a |   inc G, 0
                               #      | _E_if_59:
                               #      | _C_if_59:
                               #      | _Z_if_59:
98 20 ff 1c 09                 # 5c4d |   getb A, H, 0x9
                               #      | _A_if_60:
e8 20 00 f8 0a 00              # 5c52 |   jeq A, 0, ${_E_if_60}:rel + PC
60 fe 1c 05                    # 5c58 |   mov G, 0x5
                               #      | _E_if_60:
                               #      | _C_if_60:
                               #      | _Z_if_60:
98 20 ff 1c 08                 # 5c5c |   getb A, H, 0x8
                               #      | _A_if_61:
e8 20 00 f8 0a 00              # 5c61 |   jeq A, 0, ${_E_if_61}:rel + PC
60 fe 1c 07                    # 5c67 |   mov G, 0x7
                               #      | _E_if_61:
                               #      | _C_if_61:
                               #      | _Z_if_61:
                               #      | _A_if_62:
e8 fe 00 f8 14 00              # 5c6b |   jeq G, 0, ${_E_if_62}:rel + PC
                               #      | _A_call_76:
e0 fe                          # 5c71 |   push G
5c f8 0f 00                    # 5c73 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5c77 |   mov SP, SP + 0x2
                               #      | _Z_call_76:
                               #      | _A_call_77:
5c f8 7d f9                    # 5c7b |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_77:
                               #      | _E_if_62:
                               #      | _C_if_62:
                               #      | _Z_if_62:
                               #      | _E_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
                               #      | _cleanup_fn_handle_keyboard:
e4 20                          # 5c7f |   pop A
dc                             # 5c81 |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 5c82 |   push A
61 20 bc 04                    # 5c84 |   mov A, [SP + 0x4]
                               #      | _A_if_48:
ec 20 1c f8 01 16 00           # 5c88 |   jne A, 0x1, ${_E_if_48}:rel + PC
                               #      | _A_call_53:
e0 1c ff                       # 5c8f |   push -1
5c f8 7a 00                    # 5c92 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5c96 |   mov SP, SP + 0x2
                               #      | _Z_call_53:
58 f8 6f 00                    # 5c9a |   jmp ${_C_if_48}:rel + PC
                               #      | _E_if_48:
ec 20 1c f8 02 16 00           # 5c9e |   jne A, 0x2, ${_E2_if_48}:rel + PC
                               #      | _A_call_54:
e0 1c 01                       # 5ca5 |   push 0x1
5c f8 64 00                    # 5ca8 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5cac |   mov SP, SP + 0x2
                               #      | _Z_call_54:
58 f8 59 00                    # 5cb0 |   jmp ${_C_if_48}:rel + PC
                               #      | _E2_if_48:
ec 20 1c f8 05 0f 00           # 5cb4 |   jne A, 0x5, ${_E3_if_48}:rel + PC
                               #      | _A_call_59:
5c f8 7d 00                    # 5cbb |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_59:
58 f8 4a 00                    # 5cbf |   jmp ${_C_if_48}:rel + PC
                               #      | _E3_if_48:
ec 20 1c f8 03 16 00           # 5cc3 |   jne A, 0x3, ${_E4_if_48}:rel + PC
                               #      | _A_call_65:
e0 1c 01                       # 5cca |   push 0x1
5c f8 9b 00                    # 5ccd |   call ${fn_tg_rotate}:rel + PC
60 a0 bc 02                    # 5cd1 |   mov SP, SP + 0x2
                               #      | _Z_call_65:
58 f8 34 00                    # 5cd5 |   jmp ${_C_if_48}:rel + PC
                               #      | _E4_if_48:
ec 20 1c f8 04 16 00           # 5cd9 |   jne A, 0x4, ${_E5_if_48}:rel + PC
                               #      | _A_call_66:
e0 1c ff                       # 5ce0 |   push -1
5c f8 85 00                    # 5ce3 |   call ${fn_tg_rotate}:rel + PC
60 a0 bc 02                    # 5ce7 |   mov SP, SP + 0x2
                               #      | _Z_call_66:
58 f8 1e 00                    # 5ceb |   jmp ${_C_if_48}:rel + PC
                               #      | _E5_if_48:
ec 20 1c f8 07 0f 00           # 5cef |   jne A, 0x7, ${_E6_if_48}:rel + PC
                               #      | _A_call_72:
5c f8 cc 00                    # 5cf6 |   call ${fn_tg_hold}:rel + PC
                               #      | _Z_call_72:
58 f8 0f 00                    # 5cfa |   jmp ${_C_if_48}:rel + PC
                               #      | _E6_if_48:
ec 20 1c f8 06 0b 00           # 5cfe |   jne A, 0x6, ${_E7_if_48}:rel + PC
                               #      | _A_call_73:
5c f8 9f f7                    # 5d05 |   call ${fn_tg_soft_drop}:rel + PC
                               #      | _Z_call_73:
                               #      | _E7_if_48:
                               #      | _C_if_48:
                               #      | _Z_if_48:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 5d09 |   pop A
dc                             # 5d0b |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_50:
e0 00                          # 5d0c |   push 0
5c f8 e4 f7                    # 5d0e |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d12 |   mov SP, SP + 0x2
                               #      | _Z_call_50:
03 e0 bc fa 73 02              # 5d16 |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_51:
5c f8 52 f8                    # 5d1c |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_51:
                               #      | _A_if_49:
ec ff 00 f8 0c 00              # 5d20 |   jne H, 0, ${_E_if_49}:rel + PC
07 e0 bc fa 73 02              # 5d26 |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_49:
                               #      | _C_if_49:
                               #      | _Z_if_49:
                               #      | _A_call_52:
e0 1c 01                       # 5d2c |   push 0x1
5c f8 c3 f7                    # 5d2f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d33 |   mov SP, SP + 0x2
                               #      | _Z_call_52:
                               #      | _cleanup_fn_tg_move:
dc                             # 5d37 |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_55:
e0 00                          # 5d38 |   push 0
5c f8 b8 f7                    # 5d3a |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d3e |   mov SP, SP + 0x2
                               #      | _Z_call_55:
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
46 e0 f8 73                    # 5d42 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_56:
5c f8 28 f8                    # 5d46 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_56:
e8 ff 00 f8 0a 00              # 5d4a |   jeq H, 0, ${_C_loop_5}:rel + PC
                               #      | _BZ_loop_5:
58 f8 f2 ff                    # 5d50 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
4a e0 f8 73                    # 5d54 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_57:
e0 1c 01                       # 5d58 |   push 0x1
5c f8 97 f7                    # 5d5b |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d5f |   mov SP, SP + 0x2
                               #      | _Z_call_57:
                               #      | _A_call_58:
5c f8 49 f4                    # 5d63 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_58:
                               #      | _cleanup_fn_tg_down:
dc                             # 5d67 |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_60:
e0 00                          # 5d68 |   push 0
5c f8 88 f7                    # 5d6a |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d6e |   mov SP, SP + 0x2
                               #      | _Z_call_60:
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
81 ff e0 1c f6 73 04           # 5d72 |   add H, [${var__board__falling} + 0002], 0x4
01 ff bc 02                    # 5d79 |   add H, [SP + 0x2]
2c ff 1c 03                    # 5d7d |   and H, 0x3
62 e0 ff f6 73                 # 5d81 |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_61:
5c f8 e8 f7                    # 5d86 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_61:
ec ff 00 f8 2c 00              # 5d8a |   jne H, 0, ${_C_loop_6}:rel + PC
4a e0 fa 73                    # 5d90 |   dec [${var__board__falling} + 0006]
                               #      | _A_call_62:
5c f8 da f7                    # 5d94 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_62:
ec ff 00 f8 1e 00              # 5d98 |   jne H, 0, ${_C_loop_6}:rel + PC
02 e0 1c fa 73 02              # 5d9e |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_63:
5c f8 ca f7                    # 5da4 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_63:
ec ff 00 f8 0e 00              # 5da8 |   jne H, 0, ${_C_loop_6}:rel + PC
4a e0 fa 73                    # 5dae |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_6:
58 f8 c0 ff                    # 5db2 |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _A_call_64:
e0 1c 01                       # 5db6 |   push 0x1
5c f8 39 f7                    # 5db9 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5dbd |   mov SP, SP + 0x2
                               #      | _Z_call_64:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 5dc1 |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn_tg_hold:
                               #      | _begin_fn_tg_hold:
e0 40                          # 5dc2 |   push B
e0 20                          # 5dc4 |   push A
                               #      | _A_call_67:
e0 00                          # 5dc6 |   push 0
5c f8 2a f7                    # 5dc8 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5dcc |   mov SP, SP + 0x2
                               #      | _Z_call_67:
                               #      | _A_if_54:
ee e0 1c f8 04 74 ff 24 00     # 5dd0 |   jne [${var__board__stored}], -1, ${_E_if_54}:rel + PC
                               #      | _A_call_68:
e0 1c 08                       # 5dd9 |   push 0x8
e0 e0 f4 73                    # 5ddc |   push ${var__board__falling}
e0 e0 04 74                    # 5de0 |   push ${var__board__stored}
5c f8 05 f4                    # 5de4 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 5de8 |   mov SP, SP + 0x6
                               #      | _Z_call_68:
                               #      | _A_call_69:
5c f8 c0 f3                    # 5dec |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_69:
58 f8 39 00                    # 5df0 |   jmp ${_C_if_54}:rel + PC
                               #      | _E_if_54:
61 20 e0 f4 73                 # 5df4 |   mov A, [${var__board__falling}]
61 40 e0 f6 73                 # 5df9 |   mov B, [${var__board__falling} + 0002]
63 e0 e0 f4 73 04 74           # 5dfe |   mov [${var__board__falling}], [${var__board__stored}]
63 e0 e0 f6 73 06 74           # 5e05 |   mov [${var__board__falling} + 0002], [${var__board__stored} + 0002]
62 e0 20 04 74                 # 5e0c |   mov [${var__board__stored}], A
62 e0 40 06 74                 # 5e11 |   mov [${var__board__stored} + 0002], B
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
                               #      | _A_call_70:
5c f8 58 f7                    # 5e16 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_70:
e8 ff 1c f8 01 0f 00           # 5e1a |   jeq H, 0x1, ${_C_loop_7}:rel + PC
4a e0 f8 73                    # 5e21 |   dec [${var__board__falling} + 0004]
                               #      | _BZ_loop_7:
58 f8 f1 ff                    # 5e25 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _C_if_54:
                               #      | _Z_if_54:
                               #      | _A_call_71:
e0 1c 01                       # 5e29 |   push 0x1
5c f8 c6 f6                    # 5e2c |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5e30 |   mov SP, SP + 0x2
                               #      | _Z_call_71:
                               #      | _cleanup_fn_tg_hold:
e4 20                          # 5e34 |   pop A
e4 40                          # 5e36 |   pop B
dc                             # 5e38 |   ret
                               #      | _end_fn_tg_hold:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5e39 |   push D
e0 60                          # 5e3b |   push C
e0 40                          # 5e3d |   push B
e0 20                          # 5e3f |   push A
61 40 e0 10 ff                 # 5e41 |   mov B, [0xff10]
61 60 e0 12 ff                 # 5e46 |   mov C, [0xff12]
61 80 e0 14 ff                 # 5e4b |   mov D, [0xff14]
61 20 bc 0e                    # 5e50 |   mov A, [SP + 0xe]
60 ff 00                       # 5e54 |   mov H, 0
                               #      | _A_if_63:
fc 28 20 f8 09 00              # 5e57 |   jge A + B, A, ${_E_if_63}:rel + PC
c4 ff 00                       # 5e5d |   inc H, 0
                               #      | _E_if_63:
                               #      | _C_if_63:
                               #      | _Z_if_63:
60 40 44                       # 5e60 |   mov B, B + A
81 20 bc ff 0c                 # 5e63 |   add A, [SP + 0xc], H
60 ff 00                       # 5e68 |   mov H, 0
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 2c 20 f8 10 00              # 5e6b |   jlt A + C, A, ${_C_scope_2}:rel + PC
f0 20 ff f8 0a 00              # 5e71 |   jlt A, H, ${_C_scope_2}:rel + PC
58 f8 07 00                    # 5e77 |   jmp ${_Z_scope_2}:rel + PC
                               #      | _C_scope_2:
c4 ff 00                       # 5e7b |   inc H, 0
                               #      | _Z_scope_2:
60 60 64                       # 5e7e |   mov C, C + A
81 20 bc ff 0a                 # 5e81 |   add A, [SP + 0xa], H
60 80 84                       # 5e86 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 5e89 |   mov A, [SP + 0x10]
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
61 ff e0 10 ff                 # 5e8d |   mov H, [0xff10]
61 fe e0 12 ff                 # 5e92 |   mov G, [0xff12]
61 fc e0 14 ff                 # 5e97 |   mov E, [0xff14]
                               #      | _A_if_66:
e8 fc 80 f8 10 00              # 5e9c |   jeq E, D, ${_E_if_66}:rel + PC
f8 fc 80 f8 2c 00              # 5ea2 |   jgt E, D, ${_C_loop_8}:rel + PC
58 f8 22 00                    # 5ea8 |   jmp ${_C_if_66}:rel + PC
                               #      | _E_if_66:
                               #      | _A_if_68:
e8 fe 60 f8 10 00              # 5eac |   jeq G, C, ${_E_if_68}:rel + PC
f8 fe 60 f8 1c 00              # 5eb2 |   jgt G, C, ${_C_loop_8}:rel + PC
58 f8 12 00                    # 5eb8 |   jmp ${_C_if_68}:rel + PC
                               #      | _E_if_68:
f8 ff 40 f8 12 00              # 5ebc |   jgt H, B, ${_C_loop_8}:rel + PC
                               #      | _A_if_71:
e8 20 00 f8 08 00              # 5ec2 |   jeq A, 0, ${_E_if_71}:rel + PC
5c 20                          # 5ec8 |   call A
                               #      | _E_if_71:
                               #      | _C_if_71:
                               #      | _Z_if_71:
                               #      | _C_if_68:
                               #      | _Z_if_68:
                               #      | _C_if_66:
                               #      | _Z_if_66:
                               #      | _BZ_loop_8:
58 f8 c3 ff                    # 5eca |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5ece |   pop A
e4 40                          # 5ed0 |   pop B
e4 60                          # 5ed2 |   pop C
e4 80                          # 5ed4 |   pop D
dc                             # 5ed6 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 5ed7 |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5f0f |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 5f37 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # 632c |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__data_1:
57 65 65 65 6b 6c 79 20 33 30 30 36 00 # 63ec |   .data str:"Weeekly 3006"
                               #      | const__data_2:
54 65 74 72 69 73 20 44 65 6d 6f 00 # 63f9 |   .data str:"Tetris Demo"
                               #      | const__str__Next:
4e 65 78 74 00                 # 6405 |   .data str:"Next"
                               #      | const__str__Held:
48 65 6c 64 00                 # 640a |   .data str:"Held"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x640f
                               #      | SECTION_BEGIN_static_data:
                               # 640f |   .align dummy_size:1 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 6410 |   .bss size:3840 align:16
                               #      | var__rand__state:
                               # 7310 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 7312 |   .bss size:222 align:1
                               #      | var__board__points:
                               # 73f0 |   .bss size:2 align:1
                               #      | var__board__level:
                               # 73f2 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 73f4 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 73fc |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 7404 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 740c |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 740e |   .bss size:2 align:1
                               #      | var__var_1:
                               # 7410 |   .bss size:10 align:1
                               #      | var__last_btn_in:
                               # 741a |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 741c |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
