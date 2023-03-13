                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_76:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_76:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
62 e0 00 ba 73                 # 500a |   mov [${var__last_btn_in}], 0
                               #      | _A_call_6:
5c f8 2c 00                    # 500f |   call ${fn_init_tetris_color_palette}:rel + PC
                               #      | _Z_call_6:
                               #      | _A_call_26:
5c f8 05 01                    # 5013 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_26:
                               #      |   # game loop
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
                               #      | _A_call_48:
5c f8 47 04                    # 5017 |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_48:
e8 ff 00 f8 1f 00              # 501b |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_75:
e0 e0 3c 5b                    # 5021 |   push ${fn_handle_keyboard}
e0 e0 80 a9                    # 5025 |   push 0xa980
e0 1c 03                       # 5029 |   push 0x3
e0 00                          # 502c |   push 0
5c f8 a3 0d                    # 502e |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5032 |   mov SP, SP + 0x8
                               #      | _Z_call_75:
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
54 e0 e0 1c b0 63 af 68 04     # 5089 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
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
63 e4 bc b0 63 0a              # 5103 |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc c0 63 08              # 5109 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc d0 63 06              # 510f |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
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
e0 e0 b2 72                    # 511e |   push ${var__board__board_state}
5c f8 4a 00                    # 5122 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5126 |   mov SP, SP + 0x6
                               #      | _Z_call_7:
62 e0 00 90 73                 # 512a |   mov [${var__board__points}], 0
62 e0 00 92 73                 # 512f |   mov [${var__board__level}], 0
62 e0 00 ac 73                 # 5134 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 ae 73                 # 5139 |   mov [${var__board__lines_remaining}], 0
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
ca e0 00 a4 73                 # 5152 |   dec [${var__board__stored}], 0
62 e0 00 a6 73                 # 5157 |   mov [${var__board__stored} + 0002], 0
62 e0 00 a8 73                 # 515c |   mov [${var__board__stored} + 0004], 0
62 e0 1c a2 73 03              # 5161 |   mov [${var__board__next} + 0006], 0x3
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
63 e0 bc b0 72 02              # 51a5 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 51ab |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_9:
e0 1c 08                       # 51ac |   push 0x8
e0 e0 9c 73                    # 51af |   push ${var__board__next}
e0 e0 94 73                    # 51b3 |   push ${var__board__falling}
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
c6 e0 ff 9c 73                 # 51d3 |   inc [${var__board__next}], H
62 e0 00 9e 73                 # 51d8 |   mov [${var__board__next} + 0002], 0
62 e0 00 a0 73                 # 51dd |   mov [${var__board__next} + 0004], 0
62 e0 1c a2 73 03              # 51e2 |   mov [${var__board__next} + 0006], 0x3
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
61 ff e0 b0 72                 # 5222 |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 5227 |   shl G, H, 0x7
34 ff fe                       # 522c |   xor H, G
a0 fe ff 1c 09                 # 522f |   shr G, H, 0x9
34 ff fe                       # 5234 |   xor H, G
a8 fe ff 1c 08                 # 5237 |   shl G, H, 0x8
34 ff fe                       # 523c |   xor H, G
62 e0 ff b0 72                 # 523f |   mov [${var__rand__state}], H
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
e0 e0 81 63                    # 5253 |   push ${const__data_1}
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
e0 e0 8e 63                    # 5270 |   push ${const__data_2}
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
e0 e0 9a 63                    # 528d |   push ${const__str__Next}
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
e0 e0 9f 63                    # 52aa |   push ${const__str__Held}
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
61 40 e8 c1 62                 # 533e |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_14:
e0 1c 0c                       # 5343 |   push 0xc
e0 1c 10                       # 5346 |   push 0x10
e0 e8 cc 5e                    # 5349 |   push ${const__FONT_16_12_COMPRESSED} + B
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
60 20 e4 b0 63                 # 543d |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_3:
fc 20 e0 f8 b0 68 17 00        # 5442 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_3}:rel + PC
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
                               #      | _A_call_32:
5c f8 26 00                    # 545e |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_32:
                               #      | _A_if_22:
e8 ff 00 f8 0a 00              # 5462 |   jeq H, 0, ${_E_if_22}:rel + PC
                               #      | _A_call_42:
5c f8 87 01                    # 5468 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_42:
                               #      | _E_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _A_call_43:
5c f8 65 06                    # 546c |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_43:
                               #      | _A_call_44:
e0 ff                          # 5470 |   push H
5c f8 63 06                    # 5472 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5476 |   mov SP, SP + 0x2
                               #      | _Z_call_44:
                               #      | _A_call_47:
5c f8 5c 06                    # 547a |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_47:
84 ff 1c ff 01                 # 547e |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5483 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 5484 |   push A
4a e0 ac 73                    # 5486 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_13:
d2 e0 00 ac 73                 # 548a |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 54 00                    # 548f |   jgt ${_E_if_13}:rel + PC
                               #      | _A_call_27:
e0 00                          # 5493 |   push 0
5c f8 54 00                    # 5495 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5499 |   mov SP, SP + 0x2
                               #      | _Z_call_27:
46 e0 98 73                    # 549d |   inc [${var__board__falling} + 0004]
                               #      | _A_call_28:
5c f8 c4 00                    # 54a1 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_28:
                               #      | _A_if_21:
ec ff 1c f8 01 19 00           # 54a5 |   jne H, 0x1, ${_E_if_21}:rel + PC
a9 20 e0 1c 92 73 01           # 54ac |   shl A, [${var__board__level}], 0x1
63 e0 e4 ac 73 a4 5e           # 54b3 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 54ba |   jmp ${_C_if_21}:rel + PC
                               #      | _E_if_21:
4a e0 98 73                    # 54be |   dec [${var__board__falling} + 0004]
                               #      | _A_call_29:
e0 1c 01                       # 54c2 |   push 0x1
5c f8 24 00                    # 54c5 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54c9 |   mov SP, SP + 0x2
                               #      | _Z_call_29:
                               #      | _A_call_30:
5c f8 df fc                    # 54cd |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_30:
                               #      | _C_if_21:
                               #      | _Z_if_21:
                               #      | _A_call_31:
e0 1c 01                       # 54d1 |   push 0x1
5c f8 15 00                    # 54d4 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54d8 |   mov SP, SP + 0x2
                               #      | _Z_call_31:
c4 ff 00                       # 54dc |   inc H, 0
58 f8 07 00                    # 54df |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
60 ff 00                       # 54e3 |   mov H, 0
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 54e6 |   pop A
dc                             # 54e8 |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 54e9 |   push D
e0 60                          # 54eb |   push C
e0 40                          # 54ed |   push B
e0 20                          # 54ef |   push A
60 20 e0 94 73                 # 54f1 |   mov A, ${var__board__falling}
c9 40 20                       # 54f6 |   dec B, [A]
e8 40 1c f8 ff 63 00           # 54f9 |   jeq B, -1, ${_cleanup_fn_tg_put}:rel + PC
a9 80 3c 1c 02 01              # 5500 |   shl D, [A + 0x2], 0x1
60 80 53                       # 5506 |   mov D, B*8 + D
61 80 f0 6c 5e                 # 5509 |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 550e |   inc A, B
                               #      | _A_for_4:
60 60 00                       # 5511 |   mov C, 0
                               #      | _BA_for_4:
fc 60 1c f8 04 48 00           # 5514 |   jge C, 0x4, ${_C_for_4}:rel + PC
a0 40 80 7e 02                 # 551b |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 5520 |   shr E, D, C*4
2c 40 1c 03                    # 5524 |   and B, 0x3
2c fc 1c 03                    # 5528 |   and E, 0x3
81 fe e0 40 98 73              # 552c |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc 9a 73              # 5532 |   add B, [${var__board__falling} + 0006], E
88 fd 1c fe 0a                 # 5538 |   mul F, 0xa, G
00 fd e0 b2 72                 # 553d |   add F, ${var__board__board_state}
00 fd 40                       # 5542 |   add F, B
                               #      | _A_if_15:
ee bc 00 f8 0a 0e 00           # 5545 |   jne [SP + 0xa], 0, ${_E_if_15}:rel + PC
66 fd 00                       # 554c |   bmov [F], 0
58 f8 07 00                    # 554f |   jmp ${_C_if_15}:rel + PC
                               #      | _E_if_15:
66 fd 20                       # 5553 |   bmov [F], A
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _BZ_for_4:
44 60                          # 5556 |   inc C
58 f8 bc ff                    # 5558 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 555c |   pop A
e4 40                          # 555e |   pop B
e4 60                          # 5560 |   pop C
e4 80                          # 5562 |   pop D
dc                             # 5564 |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 5565 |   push D
e0 60                          # 5567 |   push C
e0 40                          # 5569 |   push B
e0 20                          # 556b |   push A
c9 40 e0 94 73                 # 556d |   dec B, [${var__board__falling}]
a9 80 e0 1c 96 73 01           # 5572 |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 5579 |   mov D, B*8 + D
61 80 f0 6c 5e                 # 557c |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_5:
60 60 00                       # 5581 |   mov C, 0
                               #      | _BA_for_5:
fc 60 1c f8 04 5f 00           # 5584 |   jge C, 0x4, ${_C_for_5}:rel + PC
a0 20 80 7e 02                 # 558b |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 5590 |   shr E, D, C*4
2c 20 1c 03                    # 5594 |   and A, 0x3
2c fc 1c 03                    # 5598 |   and E, 0x3
81 fe e0 20 98 73              # 559c |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc 9a 73              # 55a2 |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 55a8 |   mov H, 0
d0 fe 00                       # 55ab |   icmp G, 0
70 f8 38 00                    # 55ae |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 55b2 |   icmp B, 0
70 f8 31 00                    # 55b5 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2d 00           # 55b9 |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 26 00           # 55c0 |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 55c7 |   mul F, G, 0xa
00 fd e8 b2 72                 # 55cc |   add F, ${var__board__board_state} + B
65 fd fd                       # 55d1 |   bmov F, [F]
60 ff 00                       # 55d4 |   mov H, 0
ec fd 00 f8 0f 00              # 55d7 |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_5:
44 60                          # 55dd |   inc C
58 f8 a5 ff                    # 55df |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      |   # done checking, all good
c4 ff 00                       # 55e3 |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 55e6 |   pop A
e4 40                          # 55e8 |   pop B
e4 60                          # 55ea |   pop C
e4 80                          # 55ec |   pop D
dc                             # 55ee |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_tg_display:
                               #      | _begin_fn_tg_display:
                               #      | _A_call_41:
5c f8 05 00                    # 55ef |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_41:
                               #      | _cleanup_fn_tg_display:
dc                             # 55f3 |   ret
                               #      | _end_fn_tg_display:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 55f4 |   push D
e0 60                          # 55f6 |   push C
e0 40                          # 55f8 |   push B
e0 20                          # 55fa |   push A
60 a0 bc fc                    # 55fc |   mov SP, SP + -4
62 a0 1c 15                    # 5600 |   mov [SP], 0x15
                               #      | _A_for_6:
60 20 00                       # 5604 |   mov A, 0
                               #      | _BA_for_6:
fc 20 1c f8 16 bb 01           # 5607 |   jge A, 0x16, ${_C_for_6}:rel + PC
62 bc 20 02                    # 560e |   mov [SP + 0x2], A
60 fe 3c 02                    # 5612 |   mov G, A + 0x2
                               #      | _A_call_33:
e0 fe                          # 5616 |   push G
5c f8 2c 02                    # 5618 |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 561c |   mov SP, SP + 0x2
                               #      | _Z_call_33:
                               #      | _A_for_7:
e0 20                          # 5620 |   push A
60 40 00                       # 5622 |   mov B, 0
                               #      | _BA_for_7:
fc 40 1c f8 0a 95 01           # 5625 |   jge B, 0xa, ${_C_for_7}:rel + PC
60 60 1c 0a                    # 562c |   mov C, 0xa
60 fe 00                       # 5630 |   mov G, 0
                               #      | _A_if_23:
ec 40 7c f8 ff 0c 00           # 5633 |   jne B, C + -1, ${_E_if_23}:rel + PC
60 fe e0 00 80                 # 563a |   mov G, 0x8000
                               #      | _E_if_23:
                               #      | _C_if_23:
                               #      | _Z_if_23:
                               #      | _A_if_24:
ec 40 00 f8 0a 00              # 563f |   jne B, 0, ${_E_if_24}:rel + PC
30 fe 1c 01                    # 5645 |   or G, 0x1
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
89 80 bc 60 04                 # 5649 |   mul D, [SP + 0x4], C
80 80 88 e0 b2 72              # 564e |   add D, D + B, ${var__board__board_state}
65 20 80                       # 5654 |   bmov A, [D]
60 60 5c 0a                    # 5657 |   mov C, B + 0xa
80 60 e0 61 b0 63              # 565b |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_25:
ec 20 00 f8 4f 00              # 5661 |   jne A, 0, ${_E_if_25}:rel + PC
                               #      | _A_for_8:
60 80 00                       # 5667 |   mov D, 0
                               #      | _BA_for_8:
fc 80 e0 f8 00 0f 16 00        # 566a |   jge D, 0xf00, ${_C_for_8}:rel + PC
b2 70 1c fe 01                 # 5672 |   or [C + D], 0x1, G
                               #      | _BZ_for_8:
60 80 f0 a0 00                 # 5677 |   mov D, 0xa0 + D
58 f8 ee ff                    # 567c |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _A_for_9:
60 80 1c 50                    # 5680 |   mov D, 0x50
                               #      | _BA_for_9:
fc 80 e0 f8 00 0f 15 00        # 5684 |   jge D, 0xf00, ${_C_for_9}:rel + PC
b2 70 00 fe                    # 568c |   or [C + D], 0, G
                               #      | _BZ_for_9:
60 80 f0 a0 00                 # 5690 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5695 |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
62 60 e0 55 55                 # 5699 |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 569e |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 56a5 |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 56ac |   jmp ${_C_if_25}:rel + PC
                               #      | _E_if_25:
98 ff 20 00                    # 56b0 |   getb H, A, 0
                               #      | _A_if_26:
e8 ff 00 f8 0b 00              # 56b4 |   jeq H, 0, ${_E_if_26}:rel + PC
60 ff e0 ff 7f                 # 56ba |   mov H, 0x7fff
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _A_for_10:
60 80 00                       # 56bf |   mov D, 0
                               #      | _BA_for_10:
fc 80 e0 f8 b0 04 15 00        # 56c2 |   jge D, 0x4b0, ${_C_for_10}:rel + PC
b2 70 ff fe                    # 56ca |   or [C + D], H, G
                               #      | _BZ_for_10:
60 80 f0 a0 00                 # 56ce |   mov D, 0xa0 + D
58 f8 ef ff                    # 56d3 |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
                               #      | _A_for_11:
60 80 1c 50                    # 56d7 |   mov D, 0x50
                               #      | _BA_for_11:
fc 80 e0 f8 b0 04 15 00        # 56db |   jge D, 0x4b0, ${_C_for_11}:rel + PC
b2 70 ff fe                    # 56e3 |   or [C + D], H, G
                               #      | _BZ_for_11:
60 80 f0 a0 00                 # 56e7 |   mov D, 0xa0 + D
58 f8 ef ff                    # 56ec |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
62 70 00                       # 56f0 |   mov [C + D], 0
98 ff 20 1c 01                 # 56f3 |   getb H, A, 0x1
                               #      | _A_if_27:
e8 ff 00 f8 0b 00              # 56f8 |   jeq H, 0, ${_E_if_27}:rel + PC
60 ff e0 ff 7f                 # 56fe |   mov H, 0x7fff
                               #      | _E_if_27:
                               #      | _C_if_27:
                               #      | _Z_if_27:
                               #      | _A_for_12:
60 80 e0 00 05                 # 5703 |   mov D, 0x500
                               #      | _BA_for_12:
fc 80 e0 f8 b0 09 15 00        # 5708 |   jge D, 0x9b0, ${_C_for_12}:rel + PC
b2 70 ff fe                    # 5710 |   or [C + D], H, G
                               #      | _BZ_for_12:
60 80 f0 a0 00                 # 5714 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5719 |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _A_for_13:
60 80 e0 50 05                 # 571d |   mov D, 0x550
                               #      | _BA_for_13:
fc 80 e0 f8 b0 09 15 00        # 5722 |   jge D, 0x9b0, ${_C_for_13}:rel + PC
b2 70 ff fe                    # 572a |   or [C + D], H, G
                               #      | _BZ_for_13:
60 80 f0 a0 00                 # 572e |   mov D, 0xa0 + D
58 f8 ef ff                    # 5733 |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
62 70 00                       # 5737 |   mov [C + D], 0
98 ff 20 1c 02                 # 573a |   getb H, A, 0x2
                               #      | _A_if_28:
e8 ff 00 f8 0b 00              # 573f |   jeq H, 0, ${_E_if_28}:rel + PC
60 ff e0 ff 7f                 # 5745 |   mov H, 0x7fff
                               #      | _E_if_28:
                               #      | _C_if_28:
                               #      | _Z_if_28:
                               #      | _A_for_14:
60 80 e0 00 0a                 # 574a |   mov D, 0xa00
                               #      | _BA_for_14:
fc 80 e0 f8 b0 0e 15 00        # 574f |   jge D, 0xeb0, ${_C_for_14}:rel + PC
b2 70 ff fe                    # 5757 |   or [C + D], H, G
                               #      | _BZ_for_14:
60 80 f0 a0 00                 # 575b |   mov D, 0xa0 + D
58 f8 ef ff                    # 5760 |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
                               #      | _Z_for_14:
                               #      | _A_for_15:
60 80 e0 50 0a                 # 5764 |   mov D, 0xa50
                               #      | _BA_for_15:
fc 80 e0 f8 b0 0e 15 00        # 5769 |   jge D, 0xeb0, ${_C_for_15}:rel + PC
b2 70 ff fe                    # 5771 |   or [C + D], H, G
                               #      | _BZ_for_15:
60 80 f0 a0 00                 # 5775 |   mov D, 0xa0 + D
58 f8 ef ff                    # 577a |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
62 70 00                       # 577e |   mov [C + D], 0
                               #      | _C_if_25:
                               #      | _Z_if_25:
61 20 bc 04                    # 5781 |   mov A, [SP + 0x4]
                               #      | _A_if_29:
ed 20 bc f8 02 19 00           # 5785 |   jne A, [SP + 0x2], ${_E_if_29}:rel + PC
62 ec 1c b0 04 ff              # 578c |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 5792 |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 5798 |   mov [0xeb0 + C], -1
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _A_if_30:
ec 20 00 f8 16 00              # 579e |   jne A, 0, ${_E_if_30}:rel + PC
62 60 1c ff                    # 57a4 |   mov [C], -1
62 ec 1c 00 05 ff              # 57a8 |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 57ae |   mov [0xa00 + C], -1
                               #      | _E_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
                               #      | _BZ_for_7:
44 40                          # 57b4 |   inc B
58 f8 6f fe                    # 57b6 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
e4 20                          # 57ba |   pop A
                               #      | _Z_for_7:
                               #      | _BZ_for_6:
44 20                          # 57bc |   inc A
58 f8 49 fe                    # 57be |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_34:
e0 1c 08                       # 57c2 |   push 0x8
e0 00                          # 57c5 |   push 0
e0 e0 b0 73                    # 57c7 |   push ${var__var_1}
5c f8 a1 f9                    # 57cb |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 57cf |   mov SP, SP + 0x6
                               #      | _Z_call_34:
                               #      | _A_call_35:
e0 1c 01                       # 57d3 |   push 0x1
e0 00                          # 57d6 |   push 0
e0 00                          # 57d8 |   push 0
e0 1c 04                       # 57da |   push 0x4
e0 e0 9c 73                    # 57dd |   push ${var__board__next}
e0 e0 b0 73                    # 57e1 |   push ${var__var_1}
5c f8 99 00                    # 57e5 |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 57e9 |   mov SP, SP + 0xc
                               #      | _Z_call_35:
                               #      | _A_call_37:
e0 1c 0a                       # 57ed |   push 0xa
5c f8 06 01                    # 57f0 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 57f4 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
                               #      | _A_call_38:
e0 1c 08                       # 57f8 |   push 0x8
e0 00                          # 57fb |   push 0
e0 e0 b0 73                    # 57fd |   push ${var__var_1}
5c f8 6b f9                    # 5801 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5805 |   mov SP, SP + 0x6
                               #      | _Z_call_38:
                               #      | _A_if_41:
ea e0 1c f8 a4 73 ff 23 00     # 5809 |   jeq [${var__board__stored}], -1, ${_E_if_41}:rel + PC
                               #      | _A_call_39:
e0 1c 01                       # 5812 |   push 0x1
e0 00                          # 5815 |   push 0
e0 00                          # 5817 |   push 0
e0 1c 04                       # 5819 |   push 0x4
e0 e0 a4 73                    # 581c |   push ${var__board__stored}
e0 e0 b0 73                    # 5820 |   push ${var__var_1}
5c f8 5a 00                    # 5824 |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 5828 |   mov SP, SP + 0xc
                               #      | _Z_call_39:
                               #      | _E_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
                               #      | _A_call_40:
e0 1c 0e                       # 582c |   push 0xe
5c f8 c7 00                    # 582f |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 5833 |   mov SP, SP + 0x2
                               #      | _Z_call_40:
                               #      | _cleanup_fn_display_board:
60 a0 bc 04                    # 5837 |   mov SP, SP + 0x4
e4 20                          # 583b |   pop A
e4 40                          # 583d |   pop B
e4 60                          # 583f |   pop C
e4 80                          # 5841 |   pop D
dc                             # 5843 |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_page_rgb:
                               #      | _begin_fn_switch_screen_page_rgb:
e0 40                          # 5844 |   push B
e0 20                          # 5846 |   push A
60 20 e0 a1 00                 # 5848 |   mov A, 0xa1
89 40 bc e0 06 00 05           # 584d |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c b0 63 af 68 04     # 5854 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
60 20 e0 a2 00                 # 585d |   mov A, 0xa2
54 e0 e0 1c b0 68 af 6d 05     # 5862 |   mmap ${var__VIDEO_ROW_BUFFER} + 0500, ${var__VIDEO_ROW_BUFFER} + 09ff, 0x5
60 20 e0 a4 00                 # 586b |   mov A, 0xa4
54 e0 e0 1c b0 6d af 72 06     # 5870 |   mmap ${var__VIDEO_ROW_BUFFER} + 0a00, ${var__VIDEO_ROW_BUFFER} + 0eff, 0x6
                               #      | _cleanup_fn_switch_screen_page_rgb:
e4 20                          # 5879 |   pop A
e4 40                          # 587b |   pop B
dc                             # 587d |   ret
                               #      | _end_fn_switch_screen_page_rgb:
                               #      | 
                               #      | fn_tg_put_generic:
                               #      | _begin_fn_tg_put_generic:
e0 80                          # 587e |   push D
e0 60                          # 5880 |   push C
e0 40                          # 5882 |   push B
e0 20                          # 5884 |   push A
61 20 bc 0c                    # 5886 |   mov A, [SP + 0xc]
c9 40 20                       # 588a |   dec B, [A]
e8 40 1c f8 ff 60 00           # 588d |   jeq B, -1, ${_cleanup_fn_tg_put_generic}:rel + PC
a9 80 3c 1c 02 01              # 5894 |   shl D, [A + 0x2], 0x1
60 80 53                       # 589a |   mov D, B*8 + D
61 80 f0 6c 5e                 # 589d |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 58a2 |   inc A, B
                               #      | _A_for_16:
60 60 00                       # 58a5 |   mov C, 0
                               #      | _BA_for_16:
fc 60 1c f8 04 45 00           # 58a8 |   jge C, 0x4, ${_C_for_16}:rel + PC
a0 40 80 7e 02                 # 58af |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 58b4 |   shr E, D, C*4
2c 40 1c 03                    # 58b8 |   and B, 0x3
2c fc 1c 03                    # 58bc |   and E, 0x3
81 fe bc 40 10                 # 58c0 |   add G, [SP + 0x10], B
81 40 bc fc 12                 # 58c5 |   add B, [SP + 0x12], E
89 fd bc fe 0e                 # 58ca |   mul F, [SP + 0xe], G
01 fd bc 0a                    # 58cf |   add F, [SP + 0xa]
00 fd 40                       # 58d3 |   add F, B
                               #      | _A_if_32:
ee bc 00 f8 14 0e 00           # 58d6 |   jne [SP + 0x14], 0, ${_E_if_32}:rel + PC
66 fd 00                       # 58dd |   bmov [F], 0
58 f8 07 00                    # 58e0 |   jmp ${_C_if_32}:rel + PC
                               #      | _E_if_32:
66 fd 20                       # 58e4 |   bmov [F], A
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _BZ_for_16:
44 60                          # 58e7 |   inc C
58 f8 bf ff                    # 58e9 |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
                               #      | _Z_for_16:
                               #      | _cleanup_fn_tg_put_generic:
e4 20                          # 58ed |   pop A
e4 40                          # 58ef |   pop B
e4 60                          # 58f1 |   pop C
e4 80                          # 58f3 |   pop D
dc                             # 58f5 |   ret
                               #      | _end_fn_tg_put_generic:
                               #      | 
                               #      | fn_draw_small_board:
                               #      | _begin_fn_draw_small_board:
e0 80                          # 58f6 |   push D
e0 60                          # 58f8 |   push C
e0 40                          # 58fa |   push B
e0 20                          # 58fc |   push A
60 a0 bc fc                    # 58fe |   mov SP, SP + -4
c6 a0 00                       # 5902 |   inc [SP], 0
                               #      | _A_for_17:
60 20 00                       # 5905 |   mov A, 0
                               #      | _BA_for_17:
fc 20 1c f8 02 bc 01           # 5908 |   jge A, 0x2, ${_C_for_17}:rel + PC
62 bc 20 02                    # 590f |   mov [SP + 0x2], A
81 fe bc 20 0e                 # 5913 |   add G, [SP + 0xe], A
                               #      | _A_call_36:
e0 fe                          # 5918 |   push G
5c f8 2a ff                    # 591a |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 591e |   mov SP, SP + 0x2
                               #      | _Z_call_36:
                               #      | _A_for_18:
e0 20                          # 5922 |   push A
60 40 00                       # 5924 |   mov B, 0
                               #      | _BA_for_18:
fc 40 1c f8 04 95 01           # 5927 |   jge B, 0x4, ${_C_for_18}:rel + PC
60 60 1c 04                    # 592e |   mov C, 0x4
60 fe 00                       # 5932 |   mov G, 0
                               #      | _A_if_33:
ec 40 7c f8 ff 0c 00           # 5935 |   jne B, C + -1, ${_E_if_33}:rel + PC
60 fe e0 00 80                 # 593c |   mov G, 0x8000
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _A_if_34:
ec 40 00 f8 0a 00              # 5941 |   jne B, 0, ${_E_if_34}:rel + PC
30 fe 1c 01                    # 5947 |   or G, 0x1
                               #      | _E_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
89 80 bc 60 04                 # 594b |   mul D, [SP + 0x4], C
80 80 88 e0 b0 73              # 5950 |   add D, D + B, ${var__var_1}
65 20 80                       # 5956 |   bmov A, [D]
60 60 5c 16                    # 5959 |   mov C, B + 0x16
80 60 e0 61 b0 63              # 595d |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_35:
ec 20 00 f8 4f 00              # 5963 |   jne A, 0, ${_E_if_35}:rel + PC
                               #      | _A_for_19:
60 80 00                       # 5969 |   mov D, 0
                               #      | _BA_for_19:
fc 80 e0 f8 00 0f 16 00        # 596c |   jge D, 0xf00, ${_C_for_19}:rel + PC
b2 70 1c fe 01                 # 5974 |   or [C + D], 0x1, G
                               #      | _BZ_for_19:
60 80 f0 a0 00                 # 5979 |   mov D, 0xa0 + D
58 f8 ee ff                    # 597e |   jmp ${_BA_for_19}:rel + PC
                               #      | _C_for_19:
                               #      | _Z_for_19:
                               #      | _A_for_20:
60 80 1c 50                    # 5982 |   mov D, 0x50
                               #      | _BA_for_20:
fc 80 e0 f8 00 0f 15 00        # 5986 |   jge D, 0xf00, ${_C_for_20}:rel + PC
b2 70 00 fe                    # 598e |   or [C + D], 0, G
                               #      | _BZ_for_20:
60 80 f0 a0 00                 # 5992 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5997 |   jmp ${_BA_for_20}:rel + PC
                               #      | _C_for_20:
                               #      | _Z_for_20:
62 60 e0 55 55                 # 599b |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 59a0 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 59a7 |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 59ae |   jmp ${_C_if_35}:rel + PC
                               #      | _E_if_35:
98 ff 20 00                    # 59b2 |   getb H, A, 0
                               #      | _A_if_36:
e8 ff 00 f8 0b 00              # 59b6 |   jeq H, 0, ${_E_if_36}:rel + PC
60 ff e0 ff 7f                 # 59bc |   mov H, 0x7fff
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _A_for_21:
60 80 00                       # 59c1 |   mov D, 0
                               #      | _BA_for_21:
fc 80 e0 f8 b0 04 15 00        # 59c4 |   jge D, 0x4b0, ${_C_for_21}:rel + PC
b2 70 ff fe                    # 59cc |   or [C + D], H, G
                               #      | _BZ_for_21:
60 80 f0 a0 00                 # 59d0 |   mov D, 0xa0 + D
58 f8 ef ff                    # 59d5 |   jmp ${_BA_for_21}:rel + PC
                               #      | _C_for_21:
                               #      | _Z_for_21:
                               #      | _A_for_22:
60 80 1c 50                    # 59d9 |   mov D, 0x50
                               #      | _BA_for_22:
fc 80 e0 f8 b0 04 15 00        # 59dd |   jge D, 0x4b0, ${_C_for_22}:rel + PC
b2 70 ff fe                    # 59e5 |   or [C + D], H, G
                               #      | _BZ_for_22:
60 80 f0 a0 00                 # 59e9 |   mov D, 0xa0 + D
58 f8 ef ff                    # 59ee |   jmp ${_BA_for_22}:rel + PC
                               #      | _C_for_22:
                               #      | _Z_for_22:
62 70 00                       # 59f2 |   mov [C + D], 0
98 ff 20 1c 01                 # 59f5 |   getb H, A, 0x1
                               #      | _A_if_37:
e8 ff 00 f8 0b 00              # 59fa |   jeq H, 0, ${_E_if_37}:rel + PC
60 ff e0 ff 7f                 # 5a00 |   mov H, 0x7fff
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _A_for_23:
60 80 e0 00 05                 # 5a05 |   mov D, 0x500
                               #      | _BA_for_23:
fc 80 e0 f8 b0 09 15 00        # 5a0a |   jge D, 0x9b0, ${_C_for_23}:rel + PC
b2 70 ff fe                    # 5a12 |   or [C + D], H, G
                               #      | _BZ_for_23:
60 80 f0 a0 00                 # 5a16 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a1b |   jmp ${_BA_for_23}:rel + PC
                               #      | _C_for_23:
                               #      | _Z_for_23:
                               #      | _A_for_24:
60 80 e0 50 05                 # 5a1f |   mov D, 0x550
                               #      | _BA_for_24:
fc 80 e0 f8 b0 09 15 00        # 5a24 |   jge D, 0x9b0, ${_C_for_24}:rel + PC
b2 70 ff fe                    # 5a2c |   or [C + D], H, G
                               #      | _BZ_for_24:
60 80 f0 a0 00                 # 5a30 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a35 |   jmp ${_BA_for_24}:rel + PC
                               #      | _C_for_24:
                               #      | _Z_for_24:
62 70 00                       # 5a39 |   mov [C + D], 0
98 ff 20 1c 02                 # 5a3c |   getb H, A, 0x2
                               #      | _A_if_38:
e8 ff 00 f8 0b 00              # 5a41 |   jeq H, 0, ${_E_if_38}:rel + PC
60 ff e0 ff 7f                 # 5a47 |   mov H, 0x7fff
                               #      | _E_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
                               #      | _A_for_25:
60 80 e0 00 0a                 # 5a4c |   mov D, 0xa00
                               #      | _BA_for_25:
fc 80 e0 f8 b0 0e 15 00        # 5a51 |   jge D, 0xeb0, ${_C_for_25}:rel + PC
b2 70 ff fe                    # 5a59 |   or [C + D], H, G
                               #      | _BZ_for_25:
60 80 f0 a0 00                 # 5a5d |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a62 |   jmp ${_BA_for_25}:rel + PC
                               #      | _C_for_25:
                               #      | _Z_for_25:
                               #      | _A_for_26:
60 80 e0 50 0a                 # 5a66 |   mov D, 0xa50
                               #      | _BA_for_26:
fc 80 e0 f8 b0 0e 15 00        # 5a6b |   jge D, 0xeb0, ${_C_for_26}:rel + PC
b2 70 ff fe                    # 5a73 |   or [C + D], H, G
                               #      | _BZ_for_26:
60 80 f0 a0 00                 # 5a77 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a7c |   jmp ${_BA_for_26}:rel + PC
                               #      | _C_for_26:
                               #      | _Z_for_26:
62 70 00                       # 5a80 |   mov [C + D], 0
                               #      | _C_if_35:
                               #      | _Z_if_35:
61 20 bc 04                    # 5a83 |   mov A, [SP + 0x4]
                               #      | _A_if_39:
ed 20 bc f8 02 19 00           # 5a87 |   jne A, [SP + 0x2], ${_E_if_39}:rel + PC
62 ec 1c b0 04 ff              # 5a8e |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 5a94 |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 5a9a |   mov [0xeb0 + C], -1
                               #      | _E_if_39:
                               #      | _C_if_39:
                               #      | _Z_if_39:
                               #      | _A_if_40:
ec 20 00 f8 16 00              # 5aa0 |   jne A, 0, ${_E_if_40}:rel + PC
62 60 1c ff                    # 5aa6 |   mov [C], -1
62 ec 1c 00 05 ff              # 5aaa |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 5ab0 |   mov [0xa00 + C], -1
                               #      | _E_if_40:
                               #      | _C_if_40:
                               #      | _Z_if_40:
                               #      | _BZ_for_18:
44 40                          # 5ab6 |   inc B
58 f8 6f fe                    # 5ab8 |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
e4 20                          # 5abc |   pop A
                               #      | _Z_for_18:
                               #      | _BZ_for_17:
44 20                          # 5abe |   inc A
58 f8 48 fe                    # 5ac0 |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
                               #      | _Z_for_17:
                               #      | _cleanup_fn_draw_small_board:
60 a0 bc 04                    # 5ac4 |   mov SP, SP + 0x4
e4 20                          # 5ac8 |   pop A
e4 40                          # 5aca |   pop B
e4 60                          # 5acc |   pop C
e4 80                          # 5ace |   pop D
dc                             # 5ad0 |   ret
                               #      | _end_fn_draw_small_board:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 5ad1 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 5ad4 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 5ad5 |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 5ad6 |   push D
e0 60                          # 5ad8 |   push C
e0 40                          # 5ada |   push B
e0 20                          # 5adc |   push A
60 60 00                       # 5ade |   mov C, 0
                               #      | _A_call_45:
e0 00                          # 5ae1 |   push 0
5c f8 06 fa                    # 5ae3 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5ae7 |   mov SP, SP + 0x2
                               #      | _Z_call_45:
                               #      | _A_for_27:
60 20 00                       # 5aeb |   mov A, 0
                               #      | _BA_for_27:
fc 20 1c f8 02 37 00           # 5aee |   jge A, 0x2, ${_C_for_27}:rel + PC
                               #      | _A_for_28:
60 40 00                       # 5af5 |   mov B, 0
                               #      | _BA_for_28:
fc 40 1c f8 0a 27 00           # 5af8 |   jge B, 0xa, ${_C_for_28}:rel + PC
88 80 20 1c 0a                 # 5aff |   mul D, A, 0xa
00 80 e8 b2 72                 # 5b04 |   add D, ${var__board__board_state} + B
65 ff 80                       # 5b09 |   bmov H, [D]
                               #      | _A_if_42:
e8 ff 00 f8 0d 00              # 5b0c |   jeq H, 0, ${_E_if_42}:rel + PC
c4 60 00                       # 5b12 |   inc C, 0
58 f8 10 00                    # 5b15 |   jmp ${_C_for_27}:rel + PC
                               #      | _E_if_42:
                               #      | _C_if_42:
                               #      | _Z_if_42:
                               #      | _BZ_for_28:
44 40                          # 5b19 |   inc B
58 f8 dd ff                    # 5b1b |   jmp ${_BA_for_28}:rel + PC
                               #      | _C_for_28:
                               #      | _Z_for_28:
                               #      | _BZ_for_27:
44 20                          # 5b1f |   inc A
58 f8 cd ff                    # 5b21 |   jmp ${_BA_for_27}:rel + PC
                               #      | _C_for_27:
                               #      | _Z_for_27:
                               #      | _A_call_46:
e0 1c 01                       # 5b25 |   push 0x1
5c f8 c1 f9                    # 5b28 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5b2c |   mov SP, SP + 0x2
                               #      | _Z_call_46:
60 ff 60                       # 5b30 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 5b33 |   pop A
e4 40                          # 5b35 |   pop B
e4 60                          # 5b37 |   pop C
e4 80                          # 5b39 |   pop D
dc                             # 5b3b |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
e0 20                          # 5b3c |   push A
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
61 fe e0 06 ff                 # 5b3e |   mov G, [0xff06]
ac ff fe e0 00 80              # 5b43 |   and H, G, 0x8000
e8 ff 00 f8 8d 00              # 5b49 |   jeq H, 0, ${_C_loop_4}:rel + PC
a9 ff e0 1c bc 73 08           # 5b4f |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 5b56 |   and G, 0xff
30 ff fe                       # 5b5b |   or H, G
62 e0 ff bc 73                 # 5b5e |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5b63 |   shr G, H, 0x8
2c ff e0 ff 00                 # 5b68 |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 5b6d |   jeq G, 0xf0, ${_BA_loop_4}:rel + PC
60 fe 00                       # 5b75 |   mov G, 0
                               #      | _A_if_46:
ec ff 1c f8 75 0f 00           # 5b78 |   jne H, 0x75, ${_E_if_46}:rel + PC
60 fe 1c 03                    # 5b7f |   mov G, 0x3
58 f8 3b 00                    # 5b83 |   jmp ${_C_if_46}:rel + PC
                               #      | _E_if_46:
ec ff 1c f8 74 0f 00           # 5b87 |   jne H, 0x74, ${_E2_if_46}:rel + PC
60 fe 1c 02                    # 5b8e |   mov G, 0x2
58 f8 2c 00                    # 5b92 |   jmp ${_C_if_46}:rel + PC
                               #      | _E2_if_46:
ec ff 1c f8 6b 0e 00           # 5b96 |   jne H, 0x6b, ${_E3_if_46}:rel + PC
c4 fe 00                       # 5b9d |   inc G, 0
58 f8 1e 00                    # 5ba0 |   jmp ${_C_if_46}:rel + PC
                               #      | _E3_if_46:
ec ff 1c f8 72 0f 00           # 5ba4 |   jne H, 0x72, ${_E4_if_46}:rel + PC
60 fe 1c 04                    # 5bab |   mov G, 0x4
58 f8 0f 00                    # 5baf |   jmp ${_C_if_46}:rel + PC
                               #      | _E4_if_46:
ec ff 1c f8 29 0b 00           # 5bb3 |   jne H, 0x29, ${_E5_if_46}:rel + PC
60 fe 1c 05                    # 5bba |   mov G, 0x5
                               #      | _E5_if_46:
                               #      | _C_if_46:
                               #      | _Z_if_46:
                               #      | _A_if_47:
e8 fe 00 f8 14 00              # 5bbe |   jeq G, 0, ${_E_if_47}:rel + PC
                               #      | _A_call_71:
e0 fe                          # 5bc4 |   push G
5c f8 86 00                    # 5bc6 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5bca |   mov SP, SP + 0x2
                               #      | _Z_call_71:
                               #      | _A_call_72:
5c f8 21 fa                    # 5bce |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_72:
                               #      | _E_if_47:
                               #      | _C_if_47:
                               #      | _Z_if_47:
                               #      | _BZ_loop_4:
58 f8 6c ff                    # 5bd2 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
61 ff e0 0e ff                 # 5bd6 |   mov H, [0xff0e]
                               #      | _A_if_56:
e9 ff e0 f8 ba 73 6e 00        # 5bdb |   jeq H, [${var__last_btn_in}], ${_E_if_56}:rel + PC
62 e0 ff ba 73                 # 5be3 |   mov [${var__last_btn_in}], H
60 fe 00                       # 5be8 |   mov G, 0
98 20 ff 1c 0c                 # 5beb |   getb A, H, 0xc
                               #      | _A_if_57:
e8 20 00 f8 0a 00              # 5bf0 |   jeq A, 0, ${_E_if_57}:rel + PC
60 fe 1c 03                    # 5bf6 |   mov G, 0x3
                               #      | _E_if_57:
                               #      | _C_if_57:
                               #      | _Z_if_57:
98 20 ff 1c 0b                 # 5bfa |   getb A, H, 0xb
                               #      | _A_if_58:
e8 20 00 f8 0a 00              # 5bff |   jeq A, 0, ${_E_if_58}:rel + PC
60 fe 1c 02                    # 5c05 |   mov G, 0x2
                               #      | _E_if_58:
                               #      | _C_if_58:
                               #      | _Z_if_58:
98 20 ff 1c 0a                 # 5c09 |   getb A, H, 0xa
                               #      | _A_if_59:
e8 20 00 f8 09 00              # 5c0e |   jeq A, 0, ${_E_if_59}:rel + PC
c4 fe 00                       # 5c14 |   inc G, 0
                               #      | _E_if_59:
                               #      | _C_if_59:
                               #      | _Z_if_59:
98 20 ff 1c 09                 # 5c17 |   getb A, H, 0x9
                               #      | _A_if_60:
e8 20 00 f8 0a 00              # 5c1c |   jeq A, 0, ${_E_if_60}:rel + PC
60 fe 1c 04                    # 5c22 |   mov G, 0x4
                               #      | _E_if_60:
                               #      | _C_if_60:
                               #      | _Z_if_60:
98 20 ff 1c 08                 # 5c26 |   getb A, H, 0x8
                               #      | _A_if_61:
e8 20 00 f8 0a 00              # 5c2b |   jeq A, 0, ${_E_if_61}:rel + PC
60 fe 1c 05                    # 5c31 |   mov G, 0x5
                               #      | _E_if_61:
                               #      | _C_if_61:
                               #      | _Z_if_61:
                               #      | _A_if_62:
e8 fe 00 f8 14 00              # 5c35 |   jeq G, 0, ${_E_if_62}:rel + PC
                               #      | _A_call_73:
e0 fe                          # 5c3b |   push G
5c f8 0f 00                    # 5c3d |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5c41 |   mov SP, SP + 0x2
                               #      | _Z_call_73:
                               #      | _A_call_74:
5c f8 aa f9                    # 5c45 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_74:
                               #      | _E_if_62:
                               #      | _C_if_62:
                               #      | _Z_if_62:
                               #      | _E_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
                               #      | _cleanup_fn_handle_keyboard:
e4 20                          # 5c49 |   pop A
dc                             # 5c4b |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 5c4c |   push A
61 20 bc 04                    # 5c4e |   mov A, [SP + 0x4]
                               #      | _A_if_48:
ec 20 1c f8 01 16 00           # 5c52 |   jne A, 0x1, ${_E_if_48}:rel + PC
                               #      | _A_call_52:
e0 1c ff                       # 5c59 |   push -1
5c f8 4e 00                    # 5c5c |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5c60 |   mov SP, SP + 0x2
                               #      | _Z_call_52:
58 f8 43 00                    # 5c64 |   jmp ${_C_if_48}:rel + PC
                               #      | _E_if_48:
ec 20 1c f8 02 16 00           # 5c68 |   jne A, 0x2, ${_E2_if_48}:rel + PC
                               #      | _A_call_53:
e0 1c 01                       # 5c6f |   push 0x1
5c f8 38 00                    # 5c72 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5c76 |   mov SP, SP + 0x2
                               #      | _Z_call_53:
58 f8 2d 00                    # 5c7a |   jmp ${_C_if_48}:rel + PC
                               #      | _E2_if_48:
ec 20 1c f8 04 0f 00           # 5c7e |   jne A, 0x4, ${_E3_if_48}:rel + PC
                               #      | _A_call_58:
5c f8 51 00                    # 5c85 |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_58:
58 f8 1e 00                    # 5c89 |   jmp ${_C_if_48}:rel + PC
                               #      | _E3_if_48:
ec 20 1c f8 03 0f 00           # 5c8d |   jne A, 0x3, ${_E4_if_48}:rel + PC
                               #      | _A_call_64:
5c f8 72 00                    # 5c94 |   call ${fn_tg_rotate}:rel + PC
                               #      | _Z_call_64:
58 f8 0f 00                    # 5c98 |   jmp ${_C_if_48}:rel + PC
                               #      | _E4_if_48:
ec 20 1c f8 05 0b 00           # 5c9c |   jne A, 0x5, ${_E5_if_48}:rel + PC
                               #      | _A_call_70:
5c f8 b7 00                    # 5ca3 |   call ${fn_tg_hold}:rel + PC
                               #      | _Z_call_70:
                               #      | _E5_if_48:
                               #      | _C_if_48:
                               #      | _Z_if_48:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 5ca7 |   pop A
dc                             # 5ca9 |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_49:
e0 00                          # 5caa |   push 0
5c f8 3d f8                    # 5cac |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5cb0 |   mov SP, SP + 0x2
                               #      | _Z_call_49:
03 e0 bc 9a 73 02              # 5cb4 |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_50:
5c f8 ab f8                    # 5cba |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_50:
                               #      | _A_if_49:
ec ff 00 f8 0c 00              # 5cbe |   jne H, 0, ${_E_if_49}:rel + PC
07 e0 bc 9a 73 02              # 5cc4 |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_49:
                               #      | _C_if_49:
                               #      | _Z_if_49:
                               #      | _A_call_51:
e0 1c 01                       # 5cca |   push 0x1
5c f8 1c f8                    # 5ccd |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5cd1 |   mov SP, SP + 0x2
                               #      | _Z_call_51:
                               #      | _cleanup_fn_tg_move:
dc                             # 5cd5 |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_54:
e0 00                          # 5cd6 |   push 0
5c f8 11 f8                    # 5cd8 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5cdc |   mov SP, SP + 0x2
                               #      | _Z_call_54:
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
46 e0 98 73                    # 5ce0 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_55:
5c f8 81 f8                    # 5ce4 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_55:
e8 ff 00 f8 0a 00              # 5ce8 |   jeq H, 0, ${_C_loop_5}:rel + PC
                               #      | _BZ_loop_5:
58 f8 f2 ff                    # 5cee |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
4a e0 98 73                    # 5cf2 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_56:
e0 1c 01                       # 5cf6 |   push 0x1
5c f8 f0 f7                    # 5cf9 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5cfd |   mov SP, SP + 0x2
                               #      | _Z_call_56:
                               #      | _A_call_57:
5c f8 ab f4                    # 5d01 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_57:
                               #      | _cleanup_fn_tg_down:
dc                             # 5d05 |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_59:
e0 00                          # 5d06 |   push 0
5c f8 e1 f7                    # 5d08 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d0c |   mov SP, SP + 0x2
                               #      | _Z_call_59:
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
c5 ff e0 96 73                 # 5d10 |   inc H, [${var__board__falling} + 0002]
2c ff 1c 03                    # 5d15 |   and H, 0x3
62 e0 ff 96 73                 # 5d19 |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_60:
5c f8 47 f8                    # 5d1e |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_60:
ec ff 00 f8 2c 00              # 5d22 |   jne H, 0, ${_C_loop_6}:rel + PC
4a e0 9a 73                    # 5d28 |   dec [${var__board__falling} + 0006]
                               #      | _A_call_61:
5c f8 39 f8                    # 5d2c |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_61:
ec ff 00 f8 1e 00              # 5d30 |   jne H, 0, ${_C_loop_6}:rel + PC
02 e0 1c 9a 73 02              # 5d36 |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_62:
5c f8 29 f8                    # 5d3c |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_62:
ec ff 00 f8 0e 00              # 5d40 |   jne H, 0, ${_C_loop_6}:rel + PC
4a e0 9a 73                    # 5d46 |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_6:
58 f8 c6 ff                    # 5d4a |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _A_call_63:
e0 1c 01                       # 5d4e |   push 0x1
5c f8 98 f7                    # 5d51 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d55 |   mov SP, SP + 0x2
                               #      | _Z_call_63:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 5d59 |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn_tg_hold:
                               #      | _begin_fn_tg_hold:
e0 40                          # 5d5a |   push B
e0 20                          # 5d5c |   push A
                               #      | _A_call_65:
e0 00                          # 5d5e |   push 0
5c f8 89 f7                    # 5d60 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d64 |   mov SP, SP + 0x2
                               #      | _Z_call_65:
                               #      | _A_if_54:
ee e0 1c f8 a4 73 ff 24 00     # 5d68 |   jne [${var__board__stored}], -1, ${_E_if_54}:rel + PC
                               #      | _A_call_66:
e0 1c 08                       # 5d71 |   push 0x8
e0 e0 94 73                    # 5d74 |   push ${var__board__falling}
e0 e0 a4 73                    # 5d78 |   push ${var__board__stored}
5c f8 6d f4                    # 5d7c |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 5d80 |   mov SP, SP + 0x6
                               #      | _Z_call_66:
                               #      | _A_call_67:
5c f8 28 f4                    # 5d84 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_67:
58 f8 39 00                    # 5d88 |   jmp ${_C_if_54}:rel + PC
                               #      | _E_if_54:
61 20 e0 94 73                 # 5d8c |   mov A, [${var__board__falling}]
61 40 e0 96 73                 # 5d91 |   mov B, [${var__board__falling} + 0002]
63 e0 e0 94 73 a4 73           # 5d96 |   mov [${var__board__falling}], [${var__board__stored}]
63 e0 e0 96 73 a6 73           # 5d9d |   mov [${var__board__falling} + 0002], [${var__board__stored} + 0002]
62 e0 20 a4 73                 # 5da4 |   mov [${var__board__stored}], A
62 e0 40 a6 73                 # 5da9 |   mov [${var__board__stored} + 0002], B
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
                               #      | _A_call_68:
5c f8 b7 f7                    # 5dae |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_68:
e8 ff 1c f8 01 0f 00           # 5db2 |   jeq H, 0x1, ${_C_loop_7}:rel + PC
4a e0 98 73                    # 5db9 |   dec [${var__board__falling} + 0004]
                               #      | _BZ_loop_7:
58 f8 f1 ff                    # 5dbd |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _C_if_54:
                               #      | _Z_if_54:
                               #      | _A_call_69:
e0 1c 01                       # 5dc1 |   push 0x1
5c f8 25 f7                    # 5dc4 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5dc8 |   mov SP, SP + 0x2
                               #      | _Z_call_69:
                               #      | _cleanup_fn_tg_hold:
e4 20                          # 5dcc |   pop A
e4 40                          # 5dce |   pop B
dc                             # 5dd0 |   ret
                               #      | _end_fn_tg_hold:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5dd1 |   push D
e0 60                          # 5dd3 |   push C
e0 40                          # 5dd5 |   push B
e0 20                          # 5dd7 |   push A
61 40 e0 10 ff                 # 5dd9 |   mov B, [0xff10]
61 60 e0 12 ff                 # 5dde |   mov C, [0xff12]
61 80 e0 14 ff                 # 5de3 |   mov D, [0xff14]
61 20 bc 0e                    # 5de8 |   mov A, [SP + 0xe]
60 ff 00                       # 5dec |   mov H, 0
                               #      | _A_if_63:
fc 28 20 f8 09 00              # 5def |   jge A + B, A, ${_E_if_63}:rel + PC
c4 ff 00                       # 5df5 |   inc H, 0
                               #      | _E_if_63:
                               #      | _C_if_63:
                               #      | _Z_if_63:
60 40 44                       # 5df8 |   mov B, B + A
81 20 bc ff 0c                 # 5dfb |   add A, [SP + 0xc], H
60 ff 00                       # 5e00 |   mov H, 0
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 2c 20 f8 10 00              # 5e03 |   jlt A + C, A, ${_C_scope_2}:rel + PC
f0 20 ff f8 0a 00              # 5e09 |   jlt A, H, ${_C_scope_2}:rel + PC
58 f8 07 00                    # 5e0f |   jmp ${_Z_scope_2}:rel + PC
                               #      | _C_scope_2:
c4 ff 00                       # 5e13 |   inc H, 0
                               #      | _Z_scope_2:
60 60 64                       # 5e16 |   mov C, C + A
81 20 bc ff 0a                 # 5e19 |   add A, [SP + 0xa], H
60 80 84                       # 5e1e |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 5e21 |   mov A, [SP + 0x10]
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
61 ff e0 14 ff                 # 5e25 |   mov H, [0xff14]
                               #      | _A_if_66:
f4 ff 80 f8 0a 00              # 5e2a |   jle H, D, ${_E_if_66}:rel + PC
58 f8 33 00                    # 5e30 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_66:
ec ff 80 f8 2b 00              # 5e34 |   jne H, D, ${_E2_if_66}:rel + PC
61 ff e0 12 ff                 # 5e3a |   mov H, [0xff12]
                               #      | _A_if_67:
f4 ff 60 f8 0a 00              # 5e3f |   jle H, C, ${_E_if_67}:rel + PC
58 f8 1e 00                    # 5e45 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_67:
ec ff 60 f8 16 00              # 5e49 |   jne H, C, ${_E2_if_67}:rel + PC
fa e0 40 f8 10 ff 14 00        # 5e4f |   jgt [0xff10], B, ${_C_loop_8}:rel + PC
                               #      | _A_if_69:
e8 20 00 f8 08 00              # 5e57 |   jeq A, 0, ${_E_if_69}:rel + PC
5c 20                          # 5e5d |   call A
                               #      | _E_if_69:
                               #      | _C_if_69:
                               #      | _Z_if_69:
                               #      | _E2_if_67:
                               #      | _C_if_67:
                               #      | _Z_if_67:
                               #      | _E2_if_66:
                               #      | _C_if_66:
                               #      | _Z_if_66:
                               #      | _BZ_loop_8:
58 f8 c6 ff                    # 5e5f |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5e63 |   pop A
e4 40                          # 5e65 |   pop B
e4 60                          # 5e67 |   pop C
e4 80                          # 5e69 |   pop D
dc                             # 5e6b |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 5e6c |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5ea4 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 5ecc |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # 62c1 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__data_1:
57 65 65 65 6b 6c 79 20 33 30 30 36 00 # 6381 |   .data str:"Weeekly 3006"
                               #      | const__data_2:
54 65 74 72 69 73 20 44 65 6d 6f 00 # 638e |   .data str:"Tetris Demo"
                               #      | const__str__Next:
4e 65 78 74 00                 # 639a |   .data str:"Next"
                               #      | const__str__Held:
48 65 6c 64 00                 # 639f |   .data str:"Held"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x63a4
                               #      | SECTION_BEGIN_static_data:
                               # 63a4 |   .align dummy_size:12 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 63b0 |   .bss size:3840 align:16
                               #      | var__rand__state:
                               # 72b0 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 72b2 |   .bss size:222 align:1
                               #      | var__board__points:
                               # 7390 |   .bss size:2 align:1
                               #      | var__board__level:
                               # 7392 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 7394 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 739c |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 73a4 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 73ac |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 73ae |   .bss size:2 align:1
                               #      | var__var_1:
                               # 73b0 |   .bss size:10 align:1
                               #      | var__last_btn_in:
                               # 73ba |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 73bc |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
