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
62 e0 00 3a 74                 # 500a |   mov [${var__last_btn_in}], 0
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
5c f8 63 04                    # 5017 |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_49:
e8 ff 00 f8 1f 00              # 501b |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_78:
e0 e0 61 5b                    # 5021 |   push ${fn_handle_keyboard}
e0 e0 c0 27                    # 5025 |   push 0x27c0
e0 1c 09                       # 5029 |   push 0x9
e0 00                          # 502c |   push 0
5c f8 27 0e                    # 502e |   call ${fn__delay_impl}:rel + PC
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
54 e0 e0 1c 30 64 2f 69 04     # 5089 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
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
63 e4 bc 30 64 0a              # 5103 |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc 40 64 08              # 5109 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc 50 64 06              # 510f |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
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
e0 e0 32 73                    # 511e |   push ${var__board__board_state}
5c f8 4a 00                    # 5122 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5126 |   mov SP, SP + 0x6
                               #      | _Z_call_7:
62 e0 00 10 74                 # 512a |   mov [${var__board__points}], 0
62 e0 00 12 74                 # 512f |   mov [${var__board__level}], 0
62 e0 00 2c 74                 # 5134 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 2e 74                 # 5139 |   mov [${var__board__lines_remaining}], 0
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
ca e0 00 24 74                 # 5152 |   dec [${var__board__stored}], 0
62 e0 00 26 74                 # 5157 |   mov [${var__board__stored} + 0002], 0
62 e0 00 28 74                 # 515c |   mov [${var__board__stored} + 0004], 0
62 e0 1c 22 74 03              # 5161 |   mov [${var__board__next} + 0006], 0x3
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
63 e0 bc 30 73 02              # 51a5 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 51ab |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_9:
e0 1c 08                       # 51ac |   push 0x8
e0 e0 1c 74                    # 51af |   push ${var__board__next}
e0 e0 14 74                    # 51b3 |   push ${var__board__falling}
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
c6 e0 ff 1c 74                 # 51d3 |   inc [${var__board__next}], H
62 e0 00 1e 74                 # 51d8 |   mov [${var__board__next} + 0002], 0
62 e0 00 20 74                 # 51dd |   mov [${var__board__next} + 0004], 0
62 e0 1c 22 74 03              # 51e2 |   mov [${var__board__next} + 0006], 0x3
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
61 ff e0 30 73                 # 5222 |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 5227 |   shl G, H, 0x7
34 ff fe                       # 522c |   xor H, G
a0 fe ff 1c 09                 # 522f |   shr G, H, 0x9
34 ff fe                       # 5234 |   xor H, G
a8 fe ff 1c 08                 # 5237 |   shl G, H, 0x8
34 ff fe                       # 523c |   xor H, G
62 e0 ff 30 73                 # 523f |   mov [${var__rand__state}], H
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
e0 e0 08 64                    # 5253 |   push ${const__data_1}
e0 1c 15                       # 5257 |   push 0x15
e0 e0 30 64                    # 525a |   push ${var__VIDEO_ROW_BUFFER}
5c f8 6c 00                    # 525e |   call ${fn_draw_str}:rel + PC
60 a0 bc 06                    # 5262 |   mov SP, SP + 0x6
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 1c 07                       # 5266 |   push 0x7
e0 1c 03                       # 5269 |   push 0x3
5c f8 09 fe                    # 526c |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5270 |   mov SP, SP + 0x4
                               #      | _Z_call_19:
                               #      | _A_call_20:
e0 e0 15 64                    # 5274 |   push ${const__data_2}
e0 1c 15                       # 5278 |   push 0x15
e0 e0 30 64                    # 527b |   push ${var__VIDEO_ROW_BUFFER}
5c f8 4b 00                    # 527f |   call ${fn_draw_str}:rel + PC
60 a0 bc 06                    # 5283 |   mov SP, SP + 0x6
                               #      | _Z_call_20:
                               #      | _A_call_21:
e0 1c 07                       # 5287 |   push 0x7
e0 1c 09                       # 528a |   push 0x9
5c f8 e8 fd                    # 528d |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5291 |   mov SP, SP + 0x4
                               #      | _Z_call_21:
                               #      | _A_call_22:
e0 e0 21 64                    # 5295 |   push ${const__str__Next}
e0 1c 16                       # 5299 |   push 0x16
e0 e0 30 64                    # 529c |   push ${var__VIDEO_ROW_BUFFER}
5c f8 2a 00                    # 52a0 |   call ${fn_draw_str}:rel + PC
60 a0 bc 06                    # 52a4 |   mov SP, SP + 0x6
                               #      | _Z_call_22:
                               #      | _A_call_23:
e0 1c 07                       # 52a8 |   push 0x7
e0 1c 0d                       # 52ab |   push 0xd
5c f8 c7 fd                    # 52ae |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 52b2 |   mov SP, SP + 0x4
                               #      | _Z_call_23:
                               #      | _A_call_24:
e0 e0 26 64                    # 52b6 |   push ${const__str__Held}
e0 1c 16                       # 52ba |   push 0x16
e0 e0 30 64                    # 52bd |   push ${var__VIDEO_ROW_BUFFER}
5c f8 09 00                    # 52c1 |   call ${fn_draw_str}:rel + PC
60 a0 bc 06                    # 52c5 |   mov SP, SP + 0x6
                               #      | _Z_call_24:
                               #      | _cleanup_fn_draw_main_interface:
dc                             # 52c9 |   ret
                               #      | _end_fn_draw_main_interface:
                               #      | 
                               #      | fn_draw_str:
                               #      | _begin_fn_draw_str:
e0 40                          # 52ca |   push B
e0 20                          # 52cc |   push A
61 20 bc 08                    # 52ce |   mov A, [SP + 0x8]
61 40 bc 0a                    # 52d2 |   mov B, [SP + 0xa]
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
fc 20 1c f8 28 27 00           # 52d6 |   jge A, 0x28, ${_C_loop_1}:rel + PC
65 ff 40                       # 52dd |   bmov H, [B]
e8 ff 00 f8 1d 00              # 52e0 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_call_17:
e0 ff                          # 52e6 |   push H
e0 20                          # 52e8 |   push A
e2 bc 0a                       # 52ea |   push [SP + 0xa]
5c f8 15 00                    # 52ed |   call ${fn_draw_char}:rel + PC
60 a0 bc 06                    # 52f1 |   mov SP, SP + 0x6
                               #      | _Z_call_17:
44 20                          # 52f5 |   inc A
44 40                          # 52f7 |   inc B
                               #      | _BZ_loop_1:
58 f8 dd ff                    # 52f9 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_draw_str:
e4 20                          # 52fd |   pop A
e4 40                          # 52ff |   pop B
dc                             # 5301 |   ret
                               #      | _end_fn_draw_str:
                               #      | 
                               #      | fn_draw_char:
                               #      | _begin_fn_draw_char:
e0 40                          # 5302 |   push B
e0 20                          # 5304 |   push A
60 a0 bc e0                    # 5306 |   mov SP, SP + -32
                               #      | _A_call_15:
e2 bc 2a                       # 530a |   push [SP + 0x2a]
e0 bc 02                       # 530d |   push SP + 0x2
5c f8 21 00                    # 5310 |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # 5314 |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_call_16:
e0 a0                          # 5318 |   push SP
e2 bc 2a                       # 531a |   push [SP + 0x2a]
e2 bc 2a                       # 531d |   push [SP + 0x2a]
5c f8 25 01                    # 5320 |   call ${fn_fill_cell_content}:rel + PC
60 a0 bc 06                    # 5324 |   mov SP, SP + 0x6
                               #      | _Z_call_16:
                               #      | _cleanup_fn_draw_char:
60 a0 bc 20                    # 5328 |   mov SP, SP + 0x20
e4 20                          # 532c |   pop A
e4 40                          # 532e |   pop B
dc                             # 5330 |   ret
                               #      | _end_fn_draw_char:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # 5331 |   push B
e0 20                          # 5333 |   push A
61 20 bc 08                    # 5335 |   mov A, [SP + 0x8]
60 40 1c 1f                    # 5339 |   mov B, 0x1f
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 20 1c f8 20 13 00           # 533d |   jlt A, 0x20, ${_C_scope_1}:rel + PC
fc 20 e0 f8 80 00 0c 00        # 5344 |   jge A, 0x80, ${_C_scope_1}:rel + PC
60 40 3c e0                    # 534c |   mov B, A + -32
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
28 40 1c 01                    # 5350 |   shl B, 0x1
61 40 e8 48 63                 # 5354 |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_14:
e0 1c 0c                       # 5359 |   push 0xc
e0 1c 10                       # 535c |   push 0x10
e0 e8 53 5f                    # 535f |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # 5363 |   push [SP + 0xc]
5c f8 0d 00                    # 5366 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # 536a |   mov SP, SP + 0x8
                               #      | _Z_call_14:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # 536e |   pop A
e4 40                          # 5370 |   pop B
dc                             # 5372 |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # 5373 |   push D
e0 60                          # 5375 |   push C
e0 40                          # 5377 |   push B
e0 20                          # 5379 |   push A
61 fc bc 0a                    # 537b |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # 537f |   shl F, [SP + 0xe], 0x1
00 fd fc                       # 5385 |   add F, E
61 fe bc 0c                    # 5388 |   mov G, [SP + 0xc]
61 40 fe                       # 538c |   mov B, [G]
60 60 1c 07                    # 538f |   mov C, 0x7
60 20 00                       # 5393 |   mov A, 0
60 a0 bc fe                    # 5396 |   mov SP, SP + -2
                               #      | _A_for_2:
                               #      | _BA_for_2:
fc fc fd f8 9e 00              # 539a |   jge E, F, ${_C_for_2}:rel + PC
                               #      |   # decode one line
60 20 00                       # 53a0 |   mov A, 0
62 a0 1c ff                    # 53a3 |   mov [SP], -1
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_if_10:
ec 60 1c f8 ff 10 00           # 53a7 |   jne C, -1, ${_E_if_10}:rel + PC
44 fe                          # 53ae |   inc G
61 40 fe                       # 53b0 |   mov B, [G]
60 60 1c 07                    # 53b3 |   mov C, 0x7
                               #      | _E_if_10:
                               #      | _C_if_10:
                               #      | _Z_if_10:
98 80 40 60                    # 53b7 |   getb D, B, C
48 60                          # 53bb |   dec C
40 80                          # 53bd |   bool D
b0 20 21 80                    # 53bf |   or A, A*2, D
4a a0                          # 53c3 |   dec [SP]
                               #      | _A_if_11:
ee a0 00 f8 1b 00              # 53c5 |   jne [SP], 0, ${_E_if_11}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # 53cb |   mov H, A
b9 20 bc 12                    # 53ce |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # 53d2 |   shr A, -1, A + 0x10
ae fc ff 20                    # 53d8 |   and [E], H, A
58 f8 54 00                    # 53dc |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_11:
ec 20 00 f8 20 00              # 53e0 |   jne A, 0, ${_E2_if_11}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # 53e6 |   sub H, E, 0x2
                               #      | _A_if_12:
f1 ff bc f8 0c 0e 00           # 53eb |   jlt H, [SP + 0xc], ${_E_if_12}:rel + PC
63 fc ff                       # 53f2 |   mov [E], [H]
58 f8 07 00                    # 53f5 |   jmp ${_C_if_12}:rel + PC
                               #      | _E_if_12:
62 fc 00                       # 53f9 |   mov [E], 0
                               #      | _C_if_12:
                               #      | _Z_if_12:
58 f8 34 00                    # 53fc |   jmp ${_C_loop_2}:rel + PC
                               #      | _E2_if_11:
ec 20 1c f8 02 13 00           # 5400 |   jne A, 0x2, ${_E3_if_11}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # 5407 |   sub H, E, 0x4
63 fc ff                       # 540c |   mov [E], [H]
58 f8 21 00                    # 540f |   jmp ${_C_loop_2}:rel + PC
                               #      | _E3_if_11:
ec 20 1c f8 06 0e 00           # 5413 |   jne A, 0x6, ${_E4_if_11}:rel + PC
                               #      |   # all zeros
62 fc 00                       # 541a |   mov [E], 0
58 f8 13 00                    # 541d |   jmp ${_C_loop_2}:rel + PC
                               #      | _E4_if_11:
ec 20 1c f8 07 0b 00           # 5421 |   jne A, 0x7, ${_E5_if_11}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # 5428 |   mov [SP], [SP + 0x12]
                               #      | _E5_if_11:
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _BZ_loop_2:
58 f8 7b ff                    # 542c |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _BZ_for_2:
00 fc 1c 02                    # 5430 |   add E, 0x2
58 f8 66 ff                    # 5434 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # 5438 |   mov SP, SP + 0x2
e4 20                          # 543c |   pop A
e4 40                          # 543e |   pop B
e4 60                          # 5440 |   pop C
e4 80                          # 5442 |   pop D
dc                             # 5444 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_fill_cell_content:
                               #      | _begin_fn_fill_cell_content:
e0 60                          # 5445 |   push C
e0 40                          # 5447 |   push B
e0 20                          # 5449 |   push A
a9 20 bc 1c 0a 01              # 544b |   shl A, [SP + 0xa], 0x1
01 20 bc 08                    # 5451 |   add A, [SP + 0x8]
60 60 e4 00 05                 # 5455 |   mov C, 0x500 + A
61 40 bc 0c                    # 545a |   mov B, [SP + 0xc]
                               #      | _A_for_3:
                               #      | _BA_for_3:
fc 20 60 f8 15 00              # 545e |   jge A, C, ${_C_for_3}:rel + PC
63 20 40                       # 5464 |   mov [A], [B]
                               #      | _BZ_for_3:
60 20 3c 50                    # 5467 |   mov A, A + 0x50
60 40 5c 02                    # 546b |   mov B, B + 0x2
58 f8 ef ff                    # 546f |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_fill_cell_content:
e4 20                          # 5473 |   pop A
e4 40                          # 5475 |   pop B
e4 60                          # 5477 |   pop C
dc                             # 5479 |   ret
                               #      | _end_fn_fill_cell_content:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_33:
5c f8 26 00                    # 547a |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_33:
                               #      | _A_if_22:
e8 ff 00 f8 0a 00              # 547e |   jeq H, 0, ${_E_if_22}:rel + PC
                               #      | _A_call_43:
5c f8 90 01                    # 5484 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_43:
                               #      | _E_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _A_call_44:
5c f8 6e 06                    # 5488 |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_44:
                               #      | _A_call_45:
e0 ff                          # 548c |   push H
5c f8 6c 06                    # 548e |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5492 |   mov SP, SP + 0x2
                               #      | _Z_call_45:
                               #      | _A_call_48:
5c f8 65 06                    # 5496 |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_48:
84 ff 1c ff 01                 # 549a |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 549f |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 54a0 |   push A
4a e0 2c 74                    # 54a2 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_13:
d2 e0 00 2c 74                 # 54a6 |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 0f 00                    # 54ab |   jgt ${_E_if_13}:rel + PC
                               #      | _A_call_32:
5c f8 11 00                    # 54af |   call ${fn_tg_soft_drop}:rel + PC
                               #      | _Z_call_32:
c4 ff 00                       # 54b3 |   inc H, 0
58 f8 07 00                    # 54b6 |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
60 ff 00                       # 54ba |   mov H, 0
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 54bd |   pop A
dc                             # 54bf |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_soft_drop:
                               #      | _begin_fn_tg_soft_drop:
e0 20                          # 54c0 |   push A
                               #      | _A_call_27:
e0 00                          # 54c2 |   push 0
5c f8 4a 00                    # 54c4 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54c8 |   mov SP, SP + 0x2
                               #      | _Z_call_27:
46 e0 18 74                    # 54cc |   inc [${var__board__falling} + 0004]
                               #      | _A_call_28:
5c f8 ba 00                    # 54d0 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_28:
                               #      | _A_if_21:
ec ff 1c f8 01 19 00           # 54d4 |   jne H, 0x1, ${_E_if_21}:rel + PC
a9 20 e0 1c 12 74 01           # 54db |   shl A, [${var__board__level}], 0x1
63 e0 e4 2c 74 2b 5f           # 54e2 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 54e9 |   jmp ${_C_if_21}:rel + PC
                               #      | _E_if_21:
4a e0 18 74                    # 54ed |   dec [${var__board__falling} + 0004]
                               #      | _A_call_29:
e0 1c 01                       # 54f1 |   push 0x1
5c f8 1a 00                    # 54f4 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54f8 |   mov SP, SP + 0x2
                               #      | _Z_call_29:
                               #      | _A_call_30:
5c f8 b0 fc                    # 54fc |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_30:
                               #      | _C_if_21:
                               #      | _Z_if_21:
                               #      | _A_call_31:
e0 1c 01                       # 5500 |   push 0x1
5c f8 0b 00                    # 5503 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5507 |   mov SP, SP + 0x2
                               #      | _Z_call_31:
                               #      | _cleanup_fn_tg_soft_drop:
e4 20                          # 550b |   pop A
dc                             # 550d |   ret
                               #      | _end_fn_tg_soft_drop:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 550e |   push D
e0 60                          # 5510 |   push C
e0 40                          # 5512 |   push B
e0 20                          # 5514 |   push A
60 20 e0 14 74                 # 5516 |   mov A, ${var__board__falling}
c9 40 20                       # 551b |   dec B, [A]
e8 40 1c f8 ff 63 00           # 551e |   jeq B, -1, ${_cleanup_fn_tg_put}:rel + PC
a9 80 3c 1c 02 01              # 5525 |   shl D, [A + 0x2], 0x1
60 80 53                       # 552b |   mov D, B*8 + D
61 80 f0 f3 5e                 # 552e |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 5533 |   inc A, B
                               #      | _A_for_4:
60 60 00                       # 5536 |   mov C, 0
                               #      | _BA_for_4:
fc 60 1c f8 04 48 00           # 5539 |   jge C, 0x4, ${_C_for_4}:rel + PC
a0 40 80 7e 02                 # 5540 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 5545 |   shr E, D, C*4
2c 40 1c 03                    # 5549 |   and B, 0x3
2c fc 1c 03                    # 554d |   and E, 0x3
81 fe e0 40 18 74              # 5551 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc 1a 74              # 5557 |   add B, [${var__board__falling} + 0006], E
88 fd 1c fe 0a                 # 555d |   mul F, 0xa, G
00 fd e0 32 73                 # 5562 |   add F, ${var__board__board_state}
00 fd 40                       # 5567 |   add F, B
                               #      | _A_if_15:
ee bc 00 f8 0a 0e 00           # 556a |   jne [SP + 0xa], 0, ${_E_if_15}:rel + PC
66 fd 00                       # 5571 |   bmov [F], 0
58 f8 07 00                    # 5574 |   jmp ${_C_if_15}:rel + PC
                               #      | _E_if_15:
66 fd 20                       # 5578 |   bmov [F], A
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _BZ_for_4:
44 60                          # 557b |   inc C
58 f8 bc ff                    # 557d |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 5581 |   pop A
e4 40                          # 5583 |   pop B
e4 60                          # 5585 |   pop C
e4 80                          # 5587 |   pop D
dc                             # 5589 |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 558a |   push D
e0 60                          # 558c |   push C
e0 40                          # 558e |   push B
e0 20                          # 5590 |   push A
c9 40 e0 14 74                 # 5592 |   dec B, [${var__board__falling}]
a9 80 e0 1c 16 74 01           # 5597 |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 559e |   mov D, B*8 + D
61 80 f0 f3 5e                 # 55a1 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_5:
60 60 00                       # 55a6 |   mov C, 0
                               #      | _BA_for_5:
fc 60 1c f8 04 5f 00           # 55a9 |   jge C, 0x4, ${_C_for_5}:rel + PC
a0 20 80 7e 02                 # 55b0 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 55b5 |   shr E, D, C*4
2c 20 1c 03                    # 55b9 |   and A, 0x3
2c fc 1c 03                    # 55bd |   and E, 0x3
81 fe e0 20 18 74              # 55c1 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc 1a 74              # 55c7 |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 55cd |   mov H, 0
d0 fe 00                       # 55d0 |   icmp G, 0
70 f8 38 00                    # 55d3 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 55d7 |   icmp B, 0
70 f8 31 00                    # 55da |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2d 00           # 55de |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 26 00           # 55e5 |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 55ec |   mul F, G, 0xa
00 fd e8 32 73                 # 55f1 |   add F, ${var__board__board_state} + B
65 fd fd                       # 55f6 |   bmov F, [F]
60 ff 00                       # 55f9 |   mov H, 0
ec fd 00 f8 0f 00              # 55fc |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_5:
44 60                          # 5602 |   inc C
58 f8 a5 ff                    # 5604 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      |   # done checking, all good
c4 ff 00                       # 5608 |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 560b |   pop A
e4 40                          # 560d |   pop B
e4 60                          # 560f |   pop C
e4 80                          # 5611 |   pop D
dc                             # 5613 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_tg_display:
                               #      | _begin_fn_tg_display:
                               #      | _A_call_42:
5c f8 05 00                    # 5614 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_42:
                               #      | _cleanup_fn_tg_display:
dc                             # 5618 |   ret
                               #      | _end_fn_tg_display:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 5619 |   push D
e0 60                          # 561b |   push C
e0 40                          # 561d |   push B
e0 20                          # 561f |   push A
60 a0 bc fc                    # 5621 |   mov SP, SP + -4
62 a0 1c 15                    # 5625 |   mov [SP], 0x15
                               #      | _A_for_6:
60 20 00                       # 5629 |   mov A, 0
                               #      | _BA_for_6:
fc 20 1c f8 16 bb 01           # 562c |   jge A, 0x16, ${_C_for_6}:rel + PC
62 bc 20 02                    # 5633 |   mov [SP + 0x2], A
60 fe 3c 02                    # 5637 |   mov G, A + 0x2
                               #      | _A_call_34:
e0 fe                          # 563b |   push G
5c f8 2c 02                    # 563d |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 5641 |   mov SP, SP + 0x2
                               #      | _Z_call_34:
                               #      | _A_for_7:
e0 20                          # 5645 |   push A
60 40 00                       # 5647 |   mov B, 0
                               #      | _BA_for_7:
fc 40 1c f8 0a 95 01           # 564a |   jge B, 0xa, ${_C_for_7}:rel + PC
60 60 1c 0a                    # 5651 |   mov C, 0xa
60 fe 00                       # 5655 |   mov G, 0
                               #      | _A_if_23:
ec 40 7c f8 ff 0c 00           # 5658 |   jne B, C + -1, ${_E_if_23}:rel + PC
60 fe e0 00 80                 # 565f |   mov G, 0x8000
                               #      | _E_if_23:
                               #      | _C_if_23:
                               #      | _Z_if_23:
                               #      | _A_if_24:
ec 40 00 f8 0a 00              # 5664 |   jne B, 0, ${_E_if_24}:rel + PC
30 fe 1c 01                    # 566a |   or G, 0x1
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
89 80 bc 60 04                 # 566e |   mul D, [SP + 0x4], C
80 80 88 e0 32 73              # 5673 |   add D, D + B, ${var__board__board_state}
65 20 80                       # 5679 |   bmov A, [D]
60 60 5c 0a                    # 567c |   mov C, B + 0xa
80 60 e0 61 30 64              # 5680 |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_25:
ec 20 00 f8 4f 00              # 5686 |   jne A, 0, ${_E_if_25}:rel + PC
                               #      | _A_for_8:
60 80 00                       # 568c |   mov D, 0
                               #      | _BA_for_8:
fc 80 e0 f8 00 0f 16 00        # 568f |   jge D, 0xf00, ${_C_for_8}:rel + PC
b2 70 1c fe 01                 # 5697 |   or [C + D], 0x1, G
                               #      | _BZ_for_8:
60 80 f0 a0 00                 # 569c |   mov D, 0xa0 + D
58 f8 ee ff                    # 56a1 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _A_for_9:
60 80 1c 50                    # 56a5 |   mov D, 0x50
                               #      | _BA_for_9:
fc 80 e0 f8 00 0f 15 00        # 56a9 |   jge D, 0xf00, ${_C_for_9}:rel + PC
b2 70 00 fe                    # 56b1 |   or [C + D], 0, G
                               #      | _BZ_for_9:
60 80 f0 a0 00                 # 56b5 |   mov D, 0xa0 + D
58 f8 ef ff                    # 56ba |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
62 60 e0 55 55                 # 56be |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 56c3 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 56ca |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 56d1 |   jmp ${_C_if_25}:rel + PC
                               #      | _E_if_25:
98 ff 20 00                    # 56d5 |   getb H, A, 0
                               #      | _A_if_26:
e8 ff 00 f8 0b 00              # 56d9 |   jeq H, 0, ${_E_if_26}:rel + PC
60 ff e0 ff 7f                 # 56df |   mov H, 0x7fff
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _A_for_10:
60 80 00                       # 56e4 |   mov D, 0
                               #      | _BA_for_10:
fc 80 e0 f8 b0 04 15 00        # 56e7 |   jge D, 0x4b0, ${_C_for_10}:rel + PC
b2 70 ff fe                    # 56ef |   or [C + D], H, G
                               #      | _BZ_for_10:
60 80 f0 a0 00                 # 56f3 |   mov D, 0xa0 + D
58 f8 ef ff                    # 56f8 |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
                               #      | _A_for_11:
60 80 1c 50                    # 56fc |   mov D, 0x50
                               #      | _BA_for_11:
fc 80 e0 f8 b0 04 15 00        # 5700 |   jge D, 0x4b0, ${_C_for_11}:rel + PC
b2 70 ff fe                    # 5708 |   or [C + D], H, G
                               #      | _BZ_for_11:
60 80 f0 a0 00                 # 570c |   mov D, 0xa0 + D
58 f8 ef ff                    # 5711 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
62 70 00                       # 5715 |   mov [C + D], 0
98 ff 20 1c 01                 # 5718 |   getb H, A, 0x1
                               #      | _A_if_27:
e8 ff 00 f8 0b 00              # 571d |   jeq H, 0, ${_E_if_27}:rel + PC
60 ff e0 ff 7f                 # 5723 |   mov H, 0x7fff
                               #      | _E_if_27:
                               #      | _C_if_27:
                               #      | _Z_if_27:
                               #      | _A_for_12:
60 80 e0 00 05                 # 5728 |   mov D, 0x500
                               #      | _BA_for_12:
fc 80 e0 f8 b0 09 15 00        # 572d |   jge D, 0x9b0, ${_C_for_12}:rel + PC
b2 70 ff fe                    # 5735 |   or [C + D], H, G
                               #      | _BZ_for_12:
60 80 f0 a0 00                 # 5739 |   mov D, 0xa0 + D
58 f8 ef ff                    # 573e |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _A_for_13:
60 80 e0 50 05                 # 5742 |   mov D, 0x550
                               #      | _BA_for_13:
fc 80 e0 f8 b0 09 15 00        # 5747 |   jge D, 0x9b0, ${_C_for_13}:rel + PC
b2 70 ff fe                    # 574f |   or [C + D], H, G
                               #      | _BZ_for_13:
60 80 f0 a0 00                 # 5753 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5758 |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
62 70 00                       # 575c |   mov [C + D], 0
98 ff 20 1c 02                 # 575f |   getb H, A, 0x2
                               #      | _A_if_28:
e8 ff 00 f8 0b 00              # 5764 |   jeq H, 0, ${_E_if_28}:rel + PC
60 ff e0 ff 7f                 # 576a |   mov H, 0x7fff
                               #      | _E_if_28:
                               #      | _C_if_28:
                               #      | _Z_if_28:
                               #      | _A_for_14:
60 80 e0 00 0a                 # 576f |   mov D, 0xa00
                               #      | _BA_for_14:
fc 80 e0 f8 b0 0e 15 00        # 5774 |   jge D, 0xeb0, ${_C_for_14}:rel + PC
b2 70 ff fe                    # 577c |   or [C + D], H, G
                               #      | _BZ_for_14:
60 80 f0 a0 00                 # 5780 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5785 |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
                               #      | _Z_for_14:
                               #      | _A_for_15:
60 80 e0 50 0a                 # 5789 |   mov D, 0xa50
                               #      | _BA_for_15:
fc 80 e0 f8 b0 0e 15 00        # 578e |   jge D, 0xeb0, ${_C_for_15}:rel + PC
b2 70 ff fe                    # 5796 |   or [C + D], H, G
                               #      | _BZ_for_15:
60 80 f0 a0 00                 # 579a |   mov D, 0xa0 + D
58 f8 ef ff                    # 579f |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
62 70 00                       # 57a3 |   mov [C + D], 0
                               #      | _C_if_25:
                               #      | _Z_if_25:
61 20 bc 04                    # 57a6 |   mov A, [SP + 0x4]
                               #      | _A_if_29:
ed 20 bc f8 02 19 00           # 57aa |   jne A, [SP + 0x2], ${_E_if_29}:rel + PC
62 ec 1c b0 04 ff              # 57b1 |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 57b7 |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 57bd |   mov [0xeb0 + C], -1
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _A_if_30:
ec 20 00 f8 16 00              # 57c3 |   jne A, 0, ${_E_if_30}:rel + PC
62 60 1c ff                    # 57c9 |   mov [C], -1
62 ec 1c 00 05 ff              # 57cd |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 57d3 |   mov [0xa00 + C], -1
                               #      | _E_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
                               #      | _BZ_for_7:
44 40                          # 57d9 |   inc B
58 f8 6f fe                    # 57db |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
e4 20                          # 57df |   pop A
                               #      | _Z_for_7:
                               #      | _BZ_for_6:
44 20                          # 57e1 |   inc A
58 f8 49 fe                    # 57e3 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_35:
e0 1c 08                       # 57e7 |   push 0x8
e0 00                          # 57ea |   push 0
e0 e0 30 74                    # 57ec |   push ${var__var_1}
5c f8 7c f9                    # 57f0 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 57f4 |   mov SP, SP + 0x6
                               #      | _Z_call_35:
                               #      | _A_call_36:
e0 1c 01                       # 57f8 |   push 0x1
e0 00                          # 57fb |   push 0
e0 00                          # 57fd |   push 0
e0 1c 04                       # 57ff |   push 0x4
e0 e0 1c 74                    # 5802 |   push ${var__board__next}
e0 e0 30 74                    # 5806 |   push ${var__var_1}
5c f8 99 00                    # 580a |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 580e |   mov SP, SP + 0xc
                               #      | _Z_call_36:
                               #      | _A_call_38:
e0 1c 0a                       # 5812 |   push 0xa
5c f8 06 01                    # 5815 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 5819 |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _A_call_39:
e0 1c 08                       # 581d |   push 0x8
e0 00                          # 5820 |   push 0
e0 e0 30 74                    # 5822 |   push ${var__var_1}
5c f8 46 f9                    # 5826 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 582a |   mov SP, SP + 0x6
                               #      | _Z_call_39:
                               #      | _A_if_41:
ea e0 1c f8 24 74 ff 23 00     # 582e |   jeq [${var__board__stored}], -1, ${_E_if_41}:rel + PC
                               #      | _A_call_40:
e0 1c 01                       # 5837 |   push 0x1
e0 00                          # 583a |   push 0
e0 00                          # 583c |   push 0
e0 1c 04                       # 583e |   push 0x4
e0 e0 24 74                    # 5841 |   push ${var__board__stored}
e0 e0 30 74                    # 5845 |   push ${var__var_1}
5c f8 5a 00                    # 5849 |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 584d |   mov SP, SP + 0xc
                               #      | _Z_call_40:
                               #      | _E_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
                               #      | _A_call_41:
e0 1c 0e                       # 5851 |   push 0xe
5c f8 c7 00                    # 5854 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 5858 |   mov SP, SP + 0x2
                               #      | _Z_call_41:
                               #      | _cleanup_fn_display_board:
60 a0 bc 04                    # 585c |   mov SP, SP + 0x4
e4 20                          # 5860 |   pop A
e4 40                          # 5862 |   pop B
e4 60                          # 5864 |   pop C
e4 80                          # 5866 |   pop D
dc                             # 5868 |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_page_rgb:
                               #      | _begin_fn_switch_screen_page_rgb:
e0 40                          # 5869 |   push B
e0 20                          # 586b |   push A
60 20 e0 a1 00                 # 586d |   mov A, 0xa1
89 40 bc e0 06 00 05           # 5872 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 30 64 2f 69 04     # 5879 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
60 20 e0 a2 00                 # 5882 |   mov A, 0xa2
54 e0 e0 1c 30 69 2f 6e 05     # 5887 |   mmap ${var__VIDEO_ROW_BUFFER} + 0500, ${var__VIDEO_ROW_BUFFER} + 09ff, 0x5
60 20 e0 a4 00                 # 5890 |   mov A, 0xa4
54 e0 e0 1c 30 6e 2f 73 06     # 5895 |   mmap ${var__VIDEO_ROW_BUFFER} + 0a00, ${var__VIDEO_ROW_BUFFER} + 0eff, 0x6
                               #      | _cleanup_fn_switch_screen_page_rgb:
e4 20                          # 589e |   pop A
e4 40                          # 58a0 |   pop B
dc                             # 58a2 |   ret
                               #      | _end_fn_switch_screen_page_rgb:
                               #      | 
                               #      | fn_tg_put_generic:
                               #      | _begin_fn_tg_put_generic:
e0 80                          # 58a3 |   push D
e0 60                          # 58a5 |   push C
e0 40                          # 58a7 |   push B
e0 20                          # 58a9 |   push A
61 20 bc 0c                    # 58ab |   mov A, [SP + 0xc]
c9 40 20                       # 58af |   dec B, [A]
e8 40 1c f8 ff 60 00           # 58b2 |   jeq B, -1, ${_cleanup_fn_tg_put_generic}:rel + PC
a9 80 3c 1c 02 01              # 58b9 |   shl D, [A + 0x2], 0x1
60 80 53                       # 58bf |   mov D, B*8 + D
61 80 f0 f3 5e                 # 58c2 |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 58c7 |   inc A, B
                               #      | _A_for_16:
60 60 00                       # 58ca |   mov C, 0
                               #      | _BA_for_16:
fc 60 1c f8 04 45 00           # 58cd |   jge C, 0x4, ${_C_for_16}:rel + PC
a0 40 80 7e 02                 # 58d4 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 58d9 |   shr E, D, C*4
2c 40 1c 03                    # 58dd |   and B, 0x3
2c fc 1c 03                    # 58e1 |   and E, 0x3
81 fe bc 40 10                 # 58e5 |   add G, [SP + 0x10], B
81 40 bc fc 12                 # 58ea |   add B, [SP + 0x12], E
89 fd bc fe 0e                 # 58ef |   mul F, [SP + 0xe], G
01 fd bc 0a                    # 58f4 |   add F, [SP + 0xa]
00 fd 40                       # 58f8 |   add F, B
                               #      | _A_if_32:
ee bc 00 f8 14 0e 00           # 58fb |   jne [SP + 0x14], 0, ${_E_if_32}:rel + PC
66 fd 00                       # 5902 |   bmov [F], 0
58 f8 07 00                    # 5905 |   jmp ${_C_if_32}:rel + PC
                               #      | _E_if_32:
66 fd 20                       # 5909 |   bmov [F], A
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _BZ_for_16:
44 60                          # 590c |   inc C
58 f8 bf ff                    # 590e |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
                               #      | _Z_for_16:
                               #      | _cleanup_fn_tg_put_generic:
e4 20                          # 5912 |   pop A
e4 40                          # 5914 |   pop B
e4 60                          # 5916 |   pop C
e4 80                          # 5918 |   pop D
dc                             # 591a |   ret
                               #      | _end_fn_tg_put_generic:
                               #      | 
                               #      | fn_draw_small_board:
                               #      | _begin_fn_draw_small_board:
e0 80                          # 591b |   push D
e0 60                          # 591d |   push C
e0 40                          # 591f |   push B
e0 20                          # 5921 |   push A
60 a0 bc fc                    # 5923 |   mov SP, SP + -4
c6 a0 00                       # 5927 |   inc [SP], 0
                               #      | _A_for_17:
60 20 00                       # 592a |   mov A, 0
                               #      | _BA_for_17:
fc 20 1c f8 02 bc 01           # 592d |   jge A, 0x2, ${_C_for_17}:rel + PC
62 bc 20 02                    # 5934 |   mov [SP + 0x2], A
81 fe bc 20 0e                 # 5938 |   add G, [SP + 0xe], A
                               #      | _A_call_37:
e0 fe                          # 593d |   push G
5c f8 2a ff                    # 593f |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 5943 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
                               #      | _A_for_18:
e0 20                          # 5947 |   push A
60 40 00                       # 5949 |   mov B, 0
                               #      | _BA_for_18:
fc 40 1c f8 04 95 01           # 594c |   jge B, 0x4, ${_C_for_18}:rel + PC
60 60 1c 04                    # 5953 |   mov C, 0x4
60 fe 00                       # 5957 |   mov G, 0
                               #      | _A_if_33:
ec 40 7c f8 ff 0c 00           # 595a |   jne B, C + -1, ${_E_if_33}:rel + PC
60 fe e0 00 80                 # 5961 |   mov G, 0x8000
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _A_if_34:
ec 40 00 f8 0a 00              # 5966 |   jne B, 0, ${_E_if_34}:rel + PC
30 fe 1c 01                    # 596c |   or G, 0x1
                               #      | _E_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
89 80 bc 60 04                 # 5970 |   mul D, [SP + 0x4], C
80 80 88 e0 30 74              # 5975 |   add D, D + B, ${var__var_1}
65 20 80                       # 597b |   bmov A, [D]
60 60 5c 16                    # 597e |   mov C, B + 0x16
80 60 e0 61 30 64              # 5982 |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_35:
ec 20 00 f8 4f 00              # 5988 |   jne A, 0, ${_E_if_35}:rel + PC
                               #      | _A_for_19:
60 80 00                       # 598e |   mov D, 0
                               #      | _BA_for_19:
fc 80 e0 f8 00 0f 16 00        # 5991 |   jge D, 0xf00, ${_C_for_19}:rel + PC
b2 70 1c fe 01                 # 5999 |   or [C + D], 0x1, G
                               #      | _BZ_for_19:
60 80 f0 a0 00                 # 599e |   mov D, 0xa0 + D
58 f8 ee ff                    # 59a3 |   jmp ${_BA_for_19}:rel + PC
                               #      | _C_for_19:
                               #      | _Z_for_19:
                               #      | _A_for_20:
60 80 1c 50                    # 59a7 |   mov D, 0x50
                               #      | _BA_for_20:
fc 80 e0 f8 00 0f 15 00        # 59ab |   jge D, 0xf00, ${_C_for_20}:rel + PC
b2 70 00 fe                    # 59b3 |   or [C + D], 0, G
                               #      | _BZ_for_20:
60 80 f0 a0 00                 # 59b7 |   mov D, 0xa0 + D
58 f8 ef ff                    # 59bc |   jmp ${_BA_for_20}:rel + PC
                               #      | _C_for_20:
                               #      | _Z_for_20:
62 60 e0 55 55                 # 59c0 |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 59c5 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 59cc |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 59d3 |   jmp ${_C_if_35}:rel + PC
                               #      | _E_if_35:
98 ff 20 00                    # 59d7 |   getb H, A, 0
                               #      | _A_if_36:
e8 ff 00 f8 0b 00              # 59db |   jeq H, 0, ${_E_if_36}:rel + PC
60 ff e0 ff 7f                 # 59e1 |   mov H, 0x7fff
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _A_for_21:
60 80 00                       # 59e6 |   mov D, 0
                               #      | _BA_for_21:
fc 80 e0 f8 b0 04 15 00        # 59e9 |   jge D, 0x4b0, ${_C_for_21}:rel + PC
b2 70 ff fe                    # 59f1 |   or [C + D], H, G
                               #      | _BZ_for_21:
60 80 f0 a0 00                 # 59f5 |   mov D, 0xa0 + D
58 f8 ef ff                    # 59fa |   jmp ${_BA_for_21}:rel + PC
                               #      | _C_for_21:
                               #      | _Z_for_21:
                               #      | _A_for_22:
60 80 1c 50                    # 59fe |   mov D, 0x50
                               #      | _BA_for_22:
fc 80 e0 f8 b0 04 15 00        # 5a02 |   jge D, 0x4b0, ${_C_for_22}:rel + PC
b2 70 ff fe                    # 5a0a |   or [C + D], H, G
                               #      | _BZ_for_22:
60 80 f0 a0 00                 # 5a0e |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a13 |   jmp ${_BA_for_22}:rel + PC
                               #      | _C_for_22:
                               #      | _Z_for_22:
62 70 00                       # 5a17 |   mov [C + D], 0
98 ff 20 1c 01                 # 5a1a |   getb H, A, 0x1
                               #      | _A_if_37:
e8 ff 00 f8 0b 00              # 5a1f |   jeq H, 0, ${_E_if_37}:rel + PC
60 ff e0 ff 7f                 # 5a25 |   mov H, 0x7fff
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _A_for_23:
60 80 e0 00 05                 # 5a2a |   mov D, 0x500
                               #      | _BA_for_23:
fc 80 e0 f8 b0 09 15 00        # 5a2f |   jge D, 0x9b0, ${_C_for_23}:rel + PC
b2 70 ff fe                    # 5a37 |   or [C + D], H, G
                               #      | _BZ_for_23:
60 80 f0 a0 00                 # 5a3b |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a40 |   jmp ${_BA_for_23}:rel + PC
                               #      | _C_for_23:
                               #      | _Z_for_23:
                               #      | _A_for_24:
60 80 e0 50 05                 # 5a44 |   mov D, 0x550
                               #      | _BA_for_24:
fc 80 e0 f8 b0 09 15 00        # 5a49 |   jge D, 0x9b0, ${_C_for_24}:rel + PC
b2 70 ff fe                    # 5a51 |   or [C + D], H, G
                               #      | _BZ_for_24:
60 80 f0 a0 00                 # 5a55 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a5a |   jmp ${_BA_for_24}:rel + PC
                               #      | _C_for_24:
                               #      | _Z_for_24:
62 70 00                       # 5a5e |   mov [C + D], 0
98 ff 20 1c 02                 # 5a61 |   getb H, A, 0x2
                               #      | _A_if_38:
e8 ff 00 f8 0b 00              # 5a66 |   jeq H, 0, ${_E_if_38}:rel + PC
60 ff e0 ff 7f                 # 5a6c |   mov H, 0x7fff
                               #      | _E_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
                               #      | _A_for_25:
60 80 e0 00 0a                 # 5a71 |   mov D, 0xa00
                               #      | _BA_for_25:
fc 80 e0 f8 b0 0e 15 00        # 5a76 |   jge D, 0xeb0, ${_C_for_25}:rel + PC
b2 70 ff fe                    # 5a7e |   or [C + D], H, G
                               #      | _BZ_for_25:
60 80 f0 a0 00                 # 5a82 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5a87 |   jmp ${_BA_for_25}:rel + PC
                               #      | _C_for_25:
                               #      | _Z_for_25:
                               #      | _A_for_26:
60 80 e0 50 0a                 # 5a8b |   mov D, 0xa50
                               #      | _BA_for_26:
fc 80 e0 f8 b0 0e 15 00        # 5a90 |   jge D, 0xeb0, ${_C_for_26}:rel + PC
b2 70 ff fe                    # 5a98 |   or [C + D], H, G
                               #      | _BZ_for_26:
60 80 f0 a0 00                 # 5a9c |   mov D, 0xa0 + D
58 f8 ef ff                    # 5aa1 |   jmp ${_BA_for_26}:rel + PC
                               #      | _C_for_26:
                               #      | _Z_for_26:
62 70 00                       # 5aa5 |   mov [C + D], 0
                               #      | _C_if_35:
                               #      | _Z_if_35:
61 20 bc 04                    # 5aa8 |   mov A, [SP + 0x4]
                               #      | _A_if_39:
ed 20 bc f8 02 19 00           # 5aac |   jne A, [SP + 0x2], ${_E_if_39}:rel + PC
62 ec 1c b0 04 ff              # 5ab3 |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 5ab9 |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 5abf |   mov [0xeb0 + C], -1
                               #      | _E_if_39:
                               #      | _C_if_39:
                               #      | _Z_if_39:
                               #      | _A_if_40:
ec 20 00 f8 16 00              # 5ac5 |   jne A, 0, ${_E_if_40}:rel + PC
62 60 1c ff                    # 5acb |   mov [C], -1
62 ec 1c 00 05 ff              # 5acf |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 5ad5 |   mov [0xa00 + C], -1
                               #      | _E_if_40:
                               #      | _C_if_40:
                               #      | _Z_if_40:
                               #      | _BZ_for_18:
44 40                          # 5adb |   inc B
58 f8 6f fe                    # 5add |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
e4 20                          # 5ae1 |   pop A
                               #      | _Z_for_18:
                               #      | _BZ_for_17:
44 20                          # 5ae3 |   inc A
58 f8 48 fe                    # 5ae5 |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
                               #      | _Z_for_17:
                               #      | _cleanup_fn_draw_small_board:
60 a0 bc 04                    # 5ae9 |   mov SP, SP + 0x4
e4 20                          # 5aed |   pop A
e4 40                          # 5aef |   pop B
e4 60                          # 5af1 |   pop C
e4 80                          # 5af3 |   pop D
dc                             # 5af5 |   ret
                               #      | _end_fn_draw_small_board:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 5af6 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 5af9 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 5afa |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 5afb |   push D
e0 60                          # 5afd |   push C
e0 40                          # 5aff |   push B
e0 20                          # 5b01 |   push A
60 60 00                       # 5b03 |   mov C, 0
                               #      | _A_call_46:
e0 00                          # 5b06 |   push 0
5c f8 06 fa                    # 5b08 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5b0c |   mov SP, SP + 0x2
                               #      | _Z_call_46:
                               #      | _A_for_27:
60 20 00                       # 5b10 |   mov A, 0
                               #      | _BA_for_27:
fc 20 1c f8 02 37 00           # 5b13 |   jge A, 0x2, ${_C_for_27}:rel + PC
                               #      | _A_for_28:
60 40 00                       # 5b1a |   mov B, 0
                               #      | _BA_for_28:
fc 40 1c f8 0a 27 00           # 5b1d |   jge B, 0xa, ${_C_for_28}:rel + PC
88 80 20 1c 0a                 # 5b24 |   mul D, A, 0xa
00 80 e8 32 73                 # 5b29 |   add D, ${var__board__board_state} + B
65 ff 80                       # 5b2e |   bmov H, [D]
                               #      | _A_if_42:
e8 ff 00 f8 0d 00              # 5b31 |   jeq H, 0, ${_E_if_42}:rel + PC
c4 60 00                       # 5b37 |   inc C, 0
58 f8 10 00                    # 5b3a |   jmp ${_C_for_27}:rel + PC
                               #      | _E_if_42:
                               #      | _C_if_42:
                               #      | _Z_if_42:
                               #      | _BZ_for_28:
44 40                          # 5b3e |   inc B
58 f8 dd ff                    # 5b40 |   jmp ${_BA_for_28}:rel + PC
                               #      | _C_for_28:
                               #      | _Z_for_28:
                               #      | _BZ_for_27:
44 20                          # 5b44 |   inc A
58 f8 cd ff                    # 5b46 |   jmp ${_BA_for_27}:rel + PC
                               #      | _C_for_27:
                               #      | _Z_for_27:
                               #      | _A_call_47:
e0 1c 01                       # 5b4a |   push 0x1
5c f8 c1 f9                    # 5b4d |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5b51 |   mov SP, SP + 0x2
                               #      | _Z_call_47:
60 ff 60                       # 5b55 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 5b58 |   pop A
e4 40                          # 5b5a |   pop B
e4 60                          # 5b5c |   pop C
e4 80                          # 5b5e |   pop D
dc                             # 5b60 |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
e0 20                          # 5b61 |   push A
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
61 fe e0 06 ff                 # 5b63 |   mov G, [0xff06]
ac ff fe e0 00 80              # 5b68 |   and H, G, 0x8000
e8 ff 00 f8 ba 00              # 5b6e |   jeq H, 0, ${_C_loop_4}:rel + PC
a9 ff e0 1c 3c 74 08           # 5b74 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 5b7b |   and G, 0xff
30 ff fe                       # 5b80 |   or H, G
62 e0 ff 3c 74                 # 5b83 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5b88 |   shr G, H, 0x8
2c ff e0 ff 00                 # 5b8d |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 5b92 |   jeq G, 0xf0, ${_BA_loop_4}:rel + PC
60 fe 00                       # 5b9a |   mov G, 0
                               #      | _A_if_46:
ec ff 1c f8 75 0f 00           # 5b9d |   jne H, 0x75, ${_E_if_46}:rel + PC
60 fe 1c 03                    # 5ba4 |   mov G, 0x3
58 f8 68 00                    # 5ba8 |   jmp ${_C_if_46}:rel + PC
                               #      | _E_if_46:
ec ff 1c f8 74 0f 00           # 5bac |   jne H, 0x74, ${_E2_if_46}:rel + PC
60 fe 1c 02                    # 5bb3 |   mov G, 0x2
58 f8 59 00                    # 5bb7 |   jmp ${_C_if_46}:rel + PC
                               #      | _E2_if_46:
ec ff 1c f8 6b 0e 00           # 5bbb |   jne H, 0x6b, ${_E3_if_46}:rel + PC
c4 fe 00                       # 5bc2 |   inc G, 0
58 f8 4b 00                    # 5bc5 |   jmp ${_C_if_46}:rel + PC
                               #      | _E3_if_46:
ec ff 1c f8 72 0f 00           # 5bc9 |   jne H, 0x72, ${_E4_if_46}:rel + PC
60 fe 1c 06                    # 5bd0 |   mov G, 0x6
58 f8 3c 00                    # 5bd4 |   jmp ${_C_if_46}:rel + PC
                               #      | _E4_if_46:
ec ff 1c f8 21 0f 00           # 5bd8 |   jne H, 0x21, ${_E5_if_46}:rel + PC
60 fe 1c 07                    # 5bdf |   mov G, 0x7
58 f8 2d 00                    # 5be3 |   jmp ${_C_if_46}:rel + PC
                               #      | _E5_if_46:
ec ff 1c f8 1a 0f 00           # 5be7 |   jne H, 0x1a, ${_E6_if_46}:rel + PC
60 fe 1c 04                    # 5bee |   mov G, 0x4
58 f8 1e 00                    # 5bf2 |   jmp ${_C_if_46}:rel + PC
                               #      | _E6_if_46:
ec ff 1c f8 22 0f 00           # 5bf6 |   jne H, 0x22, ${_E7_if_46}:rel + PC
60 fe 1c 03                    # 5bfd |   mov G, 0x3
58 f8 0f 00                    # 5c01 |   jmp ${_C_if_46}:rel + PC
                               #      | _E7_if_46:
ec ff 1c f8 11 0b 00           # 5c05 |   jne H, 0x11, ${_E8_if_46}:rel + PC
60 fe 1c 05                    # 5c0c |   mov G, 0x5
                               #      | _E8_if_46:
                               #      | _C_if_46:
                               #      | _Z_if_46:
                               #      | _A_if_47:
e8 fe 00 f8 14 00              # 5c10 |   jeq G, 0, ${_E_if_47}:rel + PC
                               #      | _A_call_74:
e0 fe                          # 5c16 |   push G
5c f8 86 00                    # 5c18 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5c1c |   mov SP, SP + 0x2
                               #      | _Z_call_74:
                               #      | _A_call_75:
5c f8 f4 f9                    # 5c20 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_75:
                               #      | _E_if_47:
                               #      | _C_if_47:
                               #      | _Z_if_47:
                               #      | _BZ_loop_4:
58 f8 3f ff                    # 5c24 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
61 ff e0 0e ff                 # 5c28 |   mov H, [0xff0e]
                               #      | _A_if_56:
e9 ff e0 f8 3a 74 6e 00        # 5c2d |   jeq H, [${var__last_btn_in}], ${_E_if_56}:rel + PC
62 e0 ff 3a 74                 # 5c35 |   mov [${var__last_btn_in}], H
60 fe 00                       # 5c3a |   mov G, 0
98 20 ff 1c 0c                 # 5c3d |   getb A, H, 0xc
                               #      | _A_if_57:
e8 20 00 f8 0a 00              # 5c42 |   jeq A, 0, ${_E_if_57}:rel + PC
60 fe 1c 03                    # 5c48 |   mov G, 0x3
                               #      | _E_if_57:
                               #      | _C_if_57:
                               #      | _Z_if_57:
98 20 ff 1c 0b                 # 5c4c |   getb A, H, 0xb
                               #      | _A_if_58:
e8 20 00 f8 0a 00              # 5c51 |   jeq A, 0, ${_E_if_58}:rel + PC
60 fe 1c 02                    # 5c57 |   mov G, 0x2
                               #      | _E_if_58:
                               #      | _C_if_58:
                               #      | _Z_if_58:
98 20 ff 1c 0a                 # 5c5b |   getb A, H, 0xa
                               #      | _A_if_59:
e8 20 00 f8 09 00              # 5c60 |   jeq A, 0, ${_E_if_59}:rel + PC
c4 fe 00                       # 5c66 |   inc G, 0
                               #      | _E_if_59:
                               #      | _C_if_59:
                               #      | _Z_if_59:
98 20 ff 1c 09                 # 5c69 |   getb A, H, 0x9
                               #      | _A_if_60:
e8 20 00 f8 0a 00              # 5c6e |   jeq A, 0, ${_E_if_60}:rel + PC
60 fe 1c 05                    # 5c74 |   mov G, 0x5
                               #      | _E_if_60:
                               #      | _C_if_60:
                               #      | _Z_if_60:
98 20 ff 1c 08                 # 5c78 |   getb A, H, 0x8
                               #      | _A_if_61:
e8 20 00 f8 0a 00              # 5c7d |   jeq A, 0, ${_E_if_61}:rel + PC
60 fe 1c 07                    # 5c83 |   mov G, 0x7
                               #      | _E_if_61:
                               #      | _C_if_61:
                               #      | _Z_if_61:
                               #      | _A_if_62:
e8 fe 00 f8 14 00              # 5c87 |   jeq G, 0, ${_E_if_62}:rel + PC
                               #      | _A_call_76:
e0 fe                          # 5c8d |   push G
5c f8 0f 00                    # 5c8f |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5c93 |   mov SP, SP + 0x2
                               #      | _Z_call_76:
                               #      | _A_call_77:
5c f8 7d f9                    # 5c97 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_77:
                               #      | _E_if_62:
                               #      | _C_if_62:
                               #      | _Z_if_62:
                               #      | _E_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
                               #      | _cleanup_fn_handle_keyboard:
e4 20                          # 5c9b |   pop A
dc                             # 5c9d |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 5c9e |   push A
61 20 bc 04                    # 5ca0 |   mov A, [SP + 0x4]
                               #      | _A_if_48:
ec 20 1c f8 01 16 00           # 5ca4 |   jne A, 0x1, ${_E_if_48}:rel + PC
                               #      | _A_call_53:
e0 1c ff                       # 5cab |   push -1
5c f8 7a 00                    # 5cae |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5cb2 |   mov SP, SP + 0x2
                               #      | _Z_call_53:
58 f8 6f 00                    # 5cb6 |   jmp ${_C_if_48}:rel + PC
                               #      | _E_if_48:
ec 20 1c f8 02 16 00           # 5cba |   jne A, 0x2, ${_E2_if_48}:rel + PC
                               #      | _A_call_54:
e0 1c 01                       # 5cc1 |   push 0x1
5c f8 64 00                    # 5cc4 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5cc8 |   mov SP, SP + 0x2
                               #      | _Z_call_54:
58 f8 59 00                    # 5ccc |   jmp ${_C_if_48}:rel + PC
                               #      | _E2_if_48:
ec 20 1c f8 05 0f 00           # 5cd0 |   jne A, 0x5, ${_E3_if_48}:rel + PC
                               #      | _A_call_59:
5c f8 7d 00                    # 5cd7 |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_59:
58 f8 4a 00                    # 5cdb |   jmp ${_C_if_48}:rel + PC
                               #      | _E3_if_48:
ec 20 1c f8 03 16 00           # 5cdf |   jne A, 0x3, ${_E4_if_48}:rel + PC
                               #      | _A_call_65:
e0 1c 01                       # 5ce6 |   push 0x1
5c f8 9b 00                    # 5ce9 |   call ${fn_tg_rotate}:rel + PC
60 a0 bc 02                    # 5ced |   mov SP, SP + 0x2
                               #      | _Z_call_65:
58 f8 34 00                    # 5cf1 |   jmp ${_C_if_48}:rel + PC
                               #      | _E4_if_48:
ec 20 1c f8 04 16 00           # 5cf5 |   jne A, 0x4, ${_E5_if_48}:rel + PC
                               #      | _A_call_66:
e0 1c ff                       # 5cfc |   push -1
5c f8 85 00                    # 5cff |   call ${fn_tg_rotate}:rel + PC
60 a0 bc 02                    # 5d03 |   mov SP, SP + 0x2
                               #      | _Z_call_66:
58 f8 1e 00                    # 5d07 |   jmp ${_C_if_48}:rel + PC
                               #      | _E5_if_48:
ec 20 1c f8 07 0f 00           # 5d0b |   jne A, 0x7, ${_E6_if_48}:rel + PC
                               #      | _A_call_72:
5c f8 cc 00                    # 5d12 |   call ${fn_tg_hold}:rel + PC
                               #      | _Z_call_72:
58 f8 0f 00                    # 5d16 |   jmp ${_C_if_48}:rel + PC
                               #      | _E6_if_48:
ec 20 1c f8 06 0b 00           # 5d1a |   jne A, 0x6, ${_E7_if_48}:rel + PC
                               #      | _A_call_73:
5c f8 9f f7                    # 5d21 |   call ${fn_tg_soft_drop}:rel + PC
                               #      | _Z_call_73:
                               #      | _E7_if_48:
                               #      | _C_if_48:
                               #      | _Z_if_48:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 5d25 |   pop A
dc                             # 5d27 |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_50:
e0 00                          # 5d28 |   push 0
5c f8 e4 f7                    # 5d2a |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d2e |   mov SP, SP + 0x2
                               #      | _Z_call_50:
03 e0 bc 1a 74 02              # 5d32 |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_51:
5c f8 52 f8                    # 5d38 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_51:
                               #      | _A_if_49:
ec ff 00 f8 0c 00              # 5d3c |   jne H, 0, ${_E_if_49}:rel + PC
07 e0 bc 1a 74 02              # 5d42 |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_49:
                               #      | _C_if_49:
                               #      | _Z_if_49:
                               #      | _A_call_52:
e0 1c 01                       # 5d48 |   push 0x1
5c f8 c3 f7                    # 5d4b |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d4f |   mov SP, SP + 0x2
                               #      | _Z_call_52:
                               #      | _cleanup_fn_tg_move:
dc                             # 5d53 |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_55:
e0 00                          # 5d54 |   push 0
5c f8 b8 f7                    # 5d56 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d5a |   mov SP, SP + 0x2
                               #      | _Z_call_55:
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
46 e0 18 74                    # 5d5e |   inc [${var__board__falling} + 0004]
                               #      | _A_call_56:
5c f8 28 f8                    # 5d62 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_56:
e8 ff 00 f8 0a 00              # 5d66 |   jeq H, 0, ${_C_loop_5}:rel + PC
                               #      | _BZ_loop_5:
58 f8 f2 ff                    # 5d6c |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
4a e0 18 74                    # 5d70 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_57:
e0 1c 01                       # 5d74 |   push 0x1
5c f8 97 f7                    # 5d77 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d7b |   mov SP, SP + 0x2
                               #      | _Z_call_57:
                               #      | _A_call_58:
5c f8 2d f4                    # 5d7f |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_58:
                               #      | _cleanup_fn_tg_down:
dc                             # 5d83 |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_60:
e0 00                          # 5d84 |   push 0
5c f8 88 f7                    # 5d86 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d8a |   mov SP, SP + 0x2
                               #      | _Z_call_60:
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
81 ff e0 1c 16 74 04           # 5d8e |   add H, [${var__board__falling} + 0002], 0x4
01 ff bc 02                    # 5d95 |   add H, [SP + 0x2]
2c ff 1c 03                    # 5d99 |   and H, 0x3
62 e0 ff 16 74                 # 5d9d |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_61:
5c f8 e8 f7                    # 5da2 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_61:
ec ff 00 f8 2c 00              # 5da6 |   jne H, 0, ${_C_loop_6}:rel + PC
4a e0 1a 74                    # 5dac |   dec [${var__board__falling} + 0006]
                               #      | _A_call_62:
5c f8 da f7                    # 5db0 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_62:
ec ff 00 f8 1e 00              # 5db4 |   jne H, 0, ${_C_loop_6}:rel + PC
02 e0 1c 1a 74 02              # 5dba |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_63:
5c f8 ca f7                    # 5dc0 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_63:
ec ff 00 f8 0e 00              # 5dc4 |   jne H, 0, ${_C_loop_6}:rel + PC
4a e0 1a 74                    # 5dca |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_6:
58 f8 c0 ff                    # 5dce |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _A_call_64:
e0 1c 01                       # 5dd2 |   push 0x1
5c f8 39 f7                    # 5dd5 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5dd9 |   mov SP, SP + 0x2
                               #      | _Z_call_64:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 5ddd |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn_tg_hold:
                               #      | _begin_fn_tg_hold:
e0 40                          # 5dde |   push B
e0 20                          # 5de0 |   push A
                               #      | _A_call_67:
e0 00                          # 5de2 |   push 0
5c f8 2a f7                    # 5de4 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5de8 |   mov SP, SP + 0x2
                               #      | _Z_call_67:
                               #      | _A_if_54:
ee e0 1c f8 24 74 ff 24 00     # 5dec |   jne [${var__board__stored}], -1, ${_E_if_54}:rel + PC
                               #      | _A_call_68:
e0 1c 08                       # 5df5 |   push 0x8
e0 e0 14 74                    # 5df8 |   push ${var__board__falling}
e0 e0 24 74                    # 5dfc |   push ${var__board__stored}
5c f8 e9 f3                    # 5e00 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 5e04 |   mov SP, SP + 0x6
                               #      | _Z_call_68:
                               #      | _A_call_69:
5c f8 a4 f3                    # 5e08 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_69:
58 f8 39 00                    # 5e0c |   jmp ${_C_if_54}:rel + PC
                               #      | _E_if_54:
61 20 e0 14 74                 # 5e10 |   mov A, [${var__board__falling}]
61 40 e0 16 74                 # 5e15 |   mov B, [${var__board__falling} + 0002]
63 e0 e0 14 74 24 74           # 5e1a |   mov [${var__board__falling}], [${var__board__stored}]
63 e0 e0 16 74 26 74           # 5e21 |   mov [${var__board__falling} + 0002], [${var__board__stored} + 0002]
62 e0 20 24 74                 # 5e28 |   mov [${var__board__stored}], A
62 e0 40 26 74                 # 5e2d |   mov [${var__board__stored} + 0002], B
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
                               #      | _A_call_70:
5c f8 58 f7                    # 5e32 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_70:
e8 ff 1c f8 01 0f 00           # 5e36 |   jeq H, 0x1, ${_C_loop_7}:rel + PC
4a e0 18 74                    # 5e3d |   dec [${var__board__falling} + 0004]
                               #      | _BZ_loop_7:
58 f8 f1 ff                    # 5e41 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _C_if_54:
                               #      | _Z_if_54:
                               #      | _A_call_71:
e0 1c 01                       # 5e45 |   push 0x1
5c f8 c6 f6                    # 5e48 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5e4c |   mov SP, SP + 0x2
                               #      | _Z_call_71:
                               #      | _cleanup_fn_tg_hold:
e4 20                          # 5e50 |   pop A
e4 40                          # 5e52 |   pop B
dc                             # 5e54 |   ret
                               #      | _end_fn_tg_hold:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5e55 |   push D
e0 60                          # 5e57 |   push C
e0 40                          # 5e59 |   push B
e0 20                          # 5e5b |   push A
61 40 e0 10 ff                 # 5e5d |   mov B, [0xff10]
61 60 e0 12 ff                 # 5e62 |   mov C, [0xff12]
61 80 e0 14 ff                 # 5e67 |   mov D, [0xff14]
61 20 bc 0e                    # 5e6c |   mov A, [SP + 0xe]
60 ff 00                       # 5e70 |   mov H, 0
                               #      | _A_if_63:
fc 28 20 f8 09 00              # 5e73 |   jge A + B, A, ${_E_if_63}:rel + PC
c4 ff 00                       # 5e79 |   inc H, 0
                               #      | _E_if_63:
                               #      | _C_if_63:
                               #      | _Z_if_63:
60 40 44                       # 5e7c |   mov B, B + A
81 20 bc ff 0c                 # 5e7f |   add A, [SP + 0xc], H
60 ff 00                       # 5e84 |   mov H, 0
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 2c 20 f8 10 00              # 5e87 |   jlt A + C, A, ${_C_scope_2}:rel + PC
f0 20 ff f8 0a 00              # 5e8d |   jlt A, H, ${_C_scope_2}:rel + PC
58 f8 07 00                    # 5e93 |   jmp ${_Z_scope_2}:rel + PC
                               #      | _C_scope_2:
c4 ff 00                       # 5e97 |   inc H, 0
                               #      | _Z_scope_2:
60 60 64                       # 5e9a |   mov C, C + A
81 20 bc ff 0a                 # 5e9d |   add A, [SP + 0xa], H
60 80 84                       # 5ea2 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 5ea5 |   mov A, [SP + 0x10]
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
61 ff e0 10 ff                 # 5ea9 |   mov H, [0xff10]
61 fe e0 12 ff                 # 5eae |   mov G, [0xff12]
61 fc e0 14 ff                 # 5eb3 |   mov E, [0xff14]
                               #      | _A_if_66:
e8 fc 80 f8 10 00              # 5eb8 |   jeq E, D, ${_E_if_66}:rel + PC
f8 fc 80 f8 2c 00              # 5ebe |   jgt E, D, ${_C_loop_8}:rel + PC
58 f8 22 00                    # 5ec4 |   jmp ${_C_if_66}:rel + PC
                               #      | _E_if_66:
                               #      | _A_if_68:
e8 fe 60 f8 10 00              # 5ec8 |   jeq G, C, ${_E_if_68}:rel + PC
f8 fe 60 f8 1c 00              # 5ece |   jgt G, C, ${_C_loop_8}:rel + PC
58 f8 12 00                    # 5ed4 |   jmp ${_C_if_68}:rel + PC
                               #      | _E_if_68:
f8 ff 40 f8 12 00              # 5ed8 |   jgt H, B, ${_C_loop_8}:rel + PC
                               #      | _A_if_71:
e8 20 00 f8 08 00              # 5ede |   jeq A, 0, ${_E_if_71}:rel + PC
5c 20                          # 5ee4 |   call A
                               #      | _E_if_71:
                               #      | _C_if_71:
                               #      | _Z_if_71:
                               #      | _C_if_68:
                               #      | _Z_if_68:
                               #      | _C_if_66:
                               #      | _Z_if_66:
                               #      | _BZ_loop_8:
58 f8 c3 ff                    # 5ee6 |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5eea |   pop A
e4 40                          # 5eec |   pop B
e4 60                          # 5eee |   pop C
e4 80                          # 5ef0 |   pop D
dc                             # 5ef2 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 5ef3 |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5f2b |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 5f53 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # 6348 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__data_1:
57 65 65 65 6b 6c 79 20 33 30 30 36 00 # 6408 |   .data str:"Weeekly 3006"
                               #      | const__data_2:
54 65 74 72 69 73 20 44 65 6d 6f 00 # 6415 |   .data str:"Tetris Demo"
                               #      | const__str__Next:
4e 65 78 74 00                 # 6421 |   .data str:"Next"
                               #      | const__str__Held:
48 65 6c 64 00                 # 6426 |   .data str:"Held"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x642b
                               #      | SECTION_BEGIN_static_data:
                               # 642b |   .align dummy_size:5 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 6430 |   .bss size:3840 align:16
                               #      | var__rand__state:
                               # 7330 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 7332 |   .bss size:222 align:1
                               #      | var__board__points:
                               # 7410 |   .bss size:2 align:1
                               #      | var__board__level:
                               # 7412 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 7414 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 741c |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 7424 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 742c |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 742e |   .bss size:2 align:1
                               #      | var__var_1:
                               # 7430 |   .bss size:10 align:1
                               #      | var__last_btn_in:
                               # 743a |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 743c |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
