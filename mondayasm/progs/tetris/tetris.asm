                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_51:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_51:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
62 e0 00 ee 5d                 # 500a |   mov [${var__last_btn_in}], 0
                               #      | _A_call_6:
5c f8 2c 00                    # 500f |   call ${fn_init_tetris_color_palette}:rel + PC
                               #      | _Z_call_6:
                               #      | _A_call_13:
5c f8 05 01                    # 5013 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_13:
                               #      |   # game loop
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
                               #      | _A_call_29:
5c f8 05 02                    # 5017 |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_29:
e8 ff 00 f8 1f 00              # 501b |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_call_50:
e0 e0 00 55                    # 5021 |   push ${fn_handle_keyboard}
e0 e0 e0 93                    # 5025 |   push 0x93e0
e0 1c 04                       # 5029 |   push 0x4
e0 00                          # 502c |   push 0
5c f8 c3 06                    # 502e |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5032 |   mov SP, SP + 0x8
                               #      | _Z_call_50:
                               #      | _BZ_loop_1:
58 f8 e1 ff                    # 5036 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_main:
dc                             # 503a |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_init_tetris_color_palette:
                               #      | _begin_fn_init_tetris_color_palette:
                               #      | _A_call_1:
e0 00                          # 503b |   push 0
e0 00                          # 503d |   push 0
5c f8 36 00                    # 503f |   call ${fn_switch_screen_row}:rel + PC
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
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # 5075 |   push B
e0 20                          # 5077 |   push A
61 20 bc 08                    # 5079 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 507d |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 5082 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c f0 57 ef 5c 01     # 5089 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # 5092 |   pop A
e4 40                          # 5094 |   pop B
dc                             # 5096 |   ret
                               #      | _end_fn_switch_screen_row:
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
63 e4 bc f0 57 0a              # 5103 |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc 00 58 08              # 5109 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc 10 58 06              # 510f |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
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
e0 e0 f2 5c                    # 511e |   push ${var__board__board_state}
5c f8 44 00                    # 5122 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5126 |   mov SP, SP + 0x6
                               #      | _Z_call_7:
62 e0 00 ce 5d                 # 512a |   mov [${var__board__points}], 0
62 e0 00 d0 5d                 # 512f |   mov [${var__board__level}], 0
62 e0 00 ea 5d                 # 5134 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 ec 5d                 # 5139 |   mov [${var__board__lines_remaining}], 0
                               #      | _A_call_8:
e0 00                          # 513e |   push 0
5c f8 5f 00                    # 5140 |   call ${fn_srand}:rel + PC
60 a0 bc 02                    # 5144 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
                               #      | _A_call_11:
5c f8 5e 00                    # 5148 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_11:
                               #      | _A_call_12:
5c f8 5a 00                    # 514c |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_12:
ca e0 00 e2 5d                 # 5150 |   dec [${var__board__stored}], 0
62 e0 00 e4 5d                 # 5155 |   mov [${var__board__stored} + 0002], 0
62 e0 00 e6 5d                 # 515a |   mov [${var__board__stored} + 0004], 0
62 e0 1c e0 5d 03              # 515f |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_init:
dc                             # 5165 |   ret
                               #      | _end_fn_tg_init:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 5166 |   push B
e0 20                          # 5168 |   push A
65 fe bc 08                    # 516a |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 516e |   shl H, G, 0x8
30 ff fe                       # 5173 |   or H, G
61 20 bc 06                    # 5176 |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 517a |   add B, [SP + 0xa], A
                               #      | _A_while_1:
                               #      | _BA_while_1:
f8 3c 40 f8 02 12 00           # 517f |   jgt A + 0x2, B, ${_C_while_1}:rel + PC
62 20 ff                       # 5186 |   mov [A], H
60 20 3c 02                    # 5189 |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 f2 ff                    # 518d |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      | _A_if_4:
fc 20 40 f8 09 00              # 5191 |   jge A, B, ${_E_if_4}:rel + PC
66 20 ff                       # 5197 |   bmov [A], H
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _cleanup_fn_memset:
e4 20                          # 519a |   pop A
e4 40                          # 519c |   pop B
dc                             # 519e |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc f0 5c 02              # 519f |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 51a5 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_9:
e0 1c 08                       # 51a6 |   push 0x8
e0 e0 da 5d                    # 51a9 |   push ${var__board__next}
e0 e0 d2 5d                    # 51ad |   push ${var__board__falling}
5c f8 27 00                    # 51b1 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 51b5 |   mov SP, SP + 0x6
                               #      | _Z_call_9:
                               #      |   # fill new Board.next
                               #      | _A_call_10:
5c f8 58 00                    # 51b9 |   call ${fn_rand}:rel + PC
                               #      | _Z_call_10:
90 fe ff 1c 07                 # 51bd |   div G, H, 0x7
c6 e0 ff da 5d                 # 51c2 |   inc [${var__board__next}], H
62 e0 00 dc 5d                 # 51c7 |   mov [${var__board__next} + 0002], 0
62 e0 00 de 5d                 # 51cc |   mov [${var__board__next} + 0004], 0
62 e0 1c e0 5d 03              # 51d1 |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_new_falling:
dc                             # 51d7 |   ret
                               #      | _end_fn_tg_new_falling:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 51d8 |   push C
e0 40                          # 51da |   push B
e0 20                          # 51dc |   push A
61 20 bc 08                    # 51de |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 51e2 |   add B, [SP + 0xc], A
61 60 bc 0a                    # 51e7 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
f8 3c 40 f8 02 16 00           # 51eb |   jgt A + 0x2, B, ${_C_while_2}:rel + PC
63 20 60                       # 51f2 |   mov [A], [C]
60 20 3c 02                    # 51f5 |   mov A, A + 0x2
60 60 7c 02                    # 51f9 |   mov C, C + 0x2
                               #      | _BZ_while_2:
58 f8 ee ff                    # 51fd |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _A_if_5:
fc 20 40 f8 09 00              # 5201 |   jge A, B, ${_E_if_5}:rel + PC
67 20 60                       # 5207 |   bmov [A], [C]
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 520a |   pop A
e4 40                          # 520c |   pop B
e4 60                          # 520e |   pop C
dc                             # 5210 |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 f0 5c                 # 5211 |   inc H, [${var__rand__state}]
62 e0 ff f0 5c                 # 5216 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 521b |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_19:
5c f8 26 00                    # 521c |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_19:
                               #      | _A_if_14:
e8 ff 00 f8 0a 00              # 5220 |   jeq H, 0, ${_E_if_14}:rel + PC
                               #      | _A_call_23:
5c f8 7b 01                    # 5226 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_23:
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
                               #      | _A_call_24:
5c f8 6b 02                    # 522a |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_24:
                               #      | _A_call_25:
e0 ff                          # 522e |   push H
5c f8 69 02                    # 5230 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5234 |   mov SP, SP + 0x2
                               #      | _Z_call_25:
                               #      | _A_call_28:
5c f8 62 02                    # 5238 |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_28:
84 ff 1c ff 01                 # 523c |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5241 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 5242 |   push A
4a e0 ea 5d                    # 5244 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_6:
d2 e0 00 ea 5d                 # 5248 |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 54 00                    # 524d |   jgt ${_E_if_6}:rel + PC
                               #      | _A_call_14:
e0 00                          # 5251 |   push 0
5c f8 54 00                    # 5253 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5257 |   mov SP, SP + 0x2
                               #      | _Z_call_14:
46 e0 d6 5d                    # 525b |   inc [${var__board__falling} + 0004]
                               #      | _A_call_15:
5c f8 bb 00                    # 525f |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_15:
                               #      | _A_if_13:
ec ff 1c f8 01 19 00           # 5263 |   jne H, 0x1, ${_E_if_13}:rel + PC
a9 20 e0 1c d0 5d 01           # 526a |   shl A, [${var__board__level}], 0x1
63 e0 e4 ea 5d c4 57           # 5271 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 5278 |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
4a e0 d6 5d                    # 527c |   dec [${var__board__falling} + 0004]
                               #      | _A_call_16:
e0 1c 01                       # 5280 |   push 0x1
5c f8 24 00                    # 5283 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5287 |   mov SP, SP + 0x2
                               #      | _Z_call_16:
                               #      | _A_call_17:
5c f8 1b ff                    # 528b |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_17:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _A_call_18:
e0 1c 01                       # 528f |   push 0x1
5c f8 15 00                    # 5292 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5296 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
c4 ff 00                       # 529a |   inc H, 0
58 f8 07 00                    # 529d |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
60 ff 00                       # 52a1 |   mov H, 0
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 52a4 |   pop A
dc                             # 52a6 |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 52a7 |   push D
e0 60                          # 52a9 |   push C
e0 40                          # 52ab |   push B
e0 20                          # 52ad |   push A
61 20 bc 0a                    # 52af |   mov A, [SP + 0xa]
c9 40 e0 d2 5d                 # 52b3 |   dec B, [${var__board__falling}]
a9 80 e0 1c d4 5d 01           # 52b8 |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 52bf |   mov D, B*8 + D
61 80 f0 8c 57                 # 52c2 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_2:
60 60 00                       # 52c7 |   mov C, 0
                               #      | _BA_for_2:
fc 60 1c f8 04 47 00           # 52ca |   jge C, 0x4, ${_C_for_2}:rel + PC
a0 40 80 7e 02                 # 52d1 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 52d6 |   shr E, D, C*4
2c 40 1c 03                    # 52da |   and B, 0x3
2c fc 1c 03                    # 52de |   and E, 0x3
81 fe e0 40 d6 5d              # 52e2 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc d8 5d              # 52e8 |   add B, [${var__board__falling} + 0006], E
88 fd fe 1c 0a                 # 52ee |   mul F, G, 0xa
00 fd e8 f2 5c                 # 52f3 |   add F, ${var__board__board_state} + B
                               #      | _A_if_7:
ee bc 00 f8 0a 0e 00           # 52f8 |   jne [SP + 0xa], 0, ${_E_if_7}:rel + PC
66 fd 00                       # 52ff |   bmov [F], 0
58 f8 09 00                    # 5302 |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
67 fd e0 d2 5d                 # 5306 |   bmov [F], [${var__board__falling}]
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _BZ_for_2:
44 60                          # 530b |   inc C
58 f8 bd ff                    # 530d |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 5311 |   pop A
e4 40                          # 5313 |   pop B
e4 60                          # 5315 |   pop C
e4 80                          # 5317 |   pop D
dc                             # 5319 |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 531a |   push D
e0 60                          # 531c |   push C
e0 40                          # 531e |   push B
e0 20                          # 5320 |   push A
c9 40 e0 d2 5d                 # 5322 |   dec B, [${var__board__falling}]
a9 80 e0 1c d4 5d 01           # 5327 |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 532e |   mov D, B*8 + D
61 80 f0 8c 57                 # 5331 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_3:
60 60 00                       # 5336 |   mov C, 0
                               #      | _BA_for_3:
fc 60 1c f8 04 5c 00           # 5339 |   jge C, 0x4, ${_C_for_3}:rel + PC
a0 20 80 7e 02                 # 5340 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 5345 |   shr E, D, C*4
2c 20 1c 03                    # 5349 |   and A, 0x3
2c fc 1c 03                    # 534d |   and E, 0x3
81 fe e0 20 d6 5d              # 5351 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc d8 5d              # 5357 |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 535d |   mov H, 0
d0 fe 00                       # 5360 |   icmp G, 0
70 f8 35 00                    # 5363 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 5367 |   icmp B, 0
70 f8 2e 00                    # 536a |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2a 00           # 536e |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 23 00           # 5375 |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 537c |   mul F, G, 0xa
00 fd e8 f2 5c                 # 5381 |   add F, ${var__board__board_state} + B
65 fd fd                       # 5386 |   bmov F, [F]
ec fd 00 f8 0f 00              # 5389 |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_3:
44 60                          # 538f |   inc C
58 f8 a8 ff                    # 5391 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      |   # done checking, all good
c4 ff 00                       # 5395 |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 5398 |   pop A
e4 40                          # 539a |   pop B
e4 60                          # 539c |   pop C
e4 80                          # 539e |   pop D
dc                             # 53a0 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 53a1 |   push D
e0 60                          # 53a3 |   push C
e0 40                          # 53a5 |   push B
e0 20                          # 53a7 |   push A
                               #      | _A_for_4:
60 20 00                       # 53a9 |   mov A, 0
                               #      | _BA_for_4:
fc 20 1c f8 16 ad 00           # 53ac |   jge A, 0x16, ${_C_for_4}:rel + PC
                               #      | _A_for_5:
c4 60 00                       # 53b3 |   inc C, 0
                               #      | _BA_for_5:
fc 60 1c f8 08 9d 00           # 53b6 |   jge C, 0x8, ${_C_for_5}:rel + PC
                               #      | _A_call_20:
e0 60                          # 53bd |   push C
e0 3c 02                       # 53bf |   push A + 0x2
5c f8 b3 fc                    # 53c2 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 53c6 |   mov SP, SP + 0x4
                               #      | _Z_call_20:
                               #      | _A_for_6:
60 40 00                       # 53ca |   mov B, 0
                               #      | _BA_for_6:
fc 40 1c f8 0a 7e 00           # 53cd |   jge B, 0xa, ${_C_for_6}:rel + PC
88 80 1c 20 0a                 # 53d4 |   mul D, 0xa, A
80 80 88 e0 f2 5c              # 53d9 |   add D, D + B, ${var__board__board_state}
65 fe 80                       # 53df |   bmov G, [D]
ac 80 fe 60                    # 53e2 |   and D, G, C
60 ff 00                       # 53e6 |   mov H, 0
                               #      | _A_if_15:
ec fe 00 f8 15 00              # 53e9 |   jne G, 0, ${_E_if_15}:rel + PC
c4 ff 00                       # 53ef |   inc H, 0
                               #      | _A_if_16:
ec 40 1c f8 09 0c 00           # 53f2 |   jne B, 0x9, ${_E_if_16}:rel + PC
30 ff e0 00 80                 # 53f9 |   or H, 0x8000
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _E_if_15:
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _A_if_17:
e8 80 00 f8 0b 00              # 53fe |   jeq D, 0, ${_E_if_17}:rel + PC
30 ff e0 ff 7f                 # 5404 |   or H, 0x7fff
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
60 80 ff                       # 5409 |   mov D, H
                               #      | _A_call_21:
e0 5c 0a                       # 540c |   push B + 0xa
5c f8 53 00                    # 540f |   call ${fn_get_cell_addr}:rel + PC
60 a0 bc 02                    # 5413 |   mov SP, SP + 0x2
                               #      | _Z_call_21:
62 ff 1c ff                    # 5417 |   mov [H], -1
00 ff e0 b0 04                 # 541b |   add H, 0x4b0
                               #      | _A_if_18:
ec 20 1c f8 15 0f 00           # 5420 |   jne A, 0x15, ${_E_if_18}:rel + PC
60 fe 1c ff                    # 5427 |   mov G, -1
58 f8 09 00                    # 542b |   jmp ${_C_if_18}:rel + PC
                               #      | _E_if_18:
60 fe e0 01 80                 # 542f |   mov G, 0x8001
                               #      | _C_if_18:
                               #      | _Z_if_18:
62 ff 1c ff                    # 5434 |   mov [H], -1
                               #      | _A_call_22:
e0 80                          # 5438 |   push D
e0 5c 0a                       # 543a |   push B + 0xa
5c f8 31 00                    # 543d |   call ${fn_fill_cell_except_first_and_last_row}:rel + PC
60 a0 bc 04                    # 5441 |   mov SP, SP + 0x4
                               #      | _Z_call_22:
                               #      | _BZ_for_6:
44 40                          # 5445 |   inc B
58 f8 86 ff                    # 5447 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _BZ_for_5:
28 60 1c 01                    # 544b |   shl C, 0x1
58 f8 67 ff                    # 544f |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _BZ_for_4:
44 20                          # 5453 |   inc A
58 f8 57 ff                    # 5455 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_display_board:
e4 20                          # 5459 |   pop A
e4 40                          # 545b |   pop B
e4 60                          # 545d |   pop C
e4 80                          # 545f |   pop D
dc                             # 5461 |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_get_cell_addr:
                               #      | _begin_fn_get_cell_addr:
a9 ff bc 1c 02 01              # 5462 |   shl H, [SP + 0x2], 0x1
00 ff e0 f0 57                 # 5468 |   add H, ${var__VIDEO_ROW_BUFFER}
                               #      | _cleanup_fn_get_cell_addr:
dc                             # 546d |   ret
                               #      | _end_fn_get_cell_addr:
                               #      | 
                               #      | fn_fill_cell_except_first_and_last_row:
                               #      | _begin_fn_fill_cell_except_first_and_last_row:
e0 20                          # 546e |   push A
61 fe bc 06                    # 5470 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # 5474 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_7:
60 20 e4 40 58                 # 547a |   mov A, ${var__VIDEO_ROW_BUFFER} + 0050 + A
                               #      | _BA_for_7:
fc 20 e0 f8 a0 5c 13 00        # 547f |   jge A, ${var__VIDEO_ROW_BUFFER} + 04b0, ${_C_for_7}:rel + PC
62 20 fe                       # 5487 |   mov [A], G
                               #      | _BZ_for_7:
60 20 3c 50                    # 548a |   mov A, A + 0x50
58 f8 f1 ff                    # 548e |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_fill_cell_except_first_and_last_row:
e4 20                          # 5492 |   pop A
dc                             # 5494 |   ret
                               #      | _end_fn_fill_cell_except_first_and_last_row:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 5495 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 5498 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 5499 |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 549a |   push D
e0 60                          # 549c |   push C
e0 40                          # 549e |   push B
e0 20                          # 54a0 |   push A
60 60 00                       # 54a2 |   mov C, 0
                               #      | _A_call_26:
e0 00                          # 54a5 |   push 0
5c f8 00 fe                    # 54a7 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54ab |   mov SP, SP + 0x2
                               #      | _Z_call_26:
                               #      | _A_for_8:
60 20 00                       # 54af |   mov A, 0
                               #      | _BA_for_8:
fc 20 1c f8 02 37 00           # 54b2 |   jge A, 0x2, ${_C_for_8}:rel + PC
                               #      | _A_for_9:
60 40 00                       # 54b9 |   mov B, 0
                               #      | _BA_for_9:
fc 40 1c f8 0a 27 00           # 54bc |   jge B, 0xa, ${_C_for_9}:rel + PC
88 80 20 1c 0a                 # 54c3 |   mul D, A, 0xa
00 80 e8 f2 5c                 # 54c8 |   add D, ${var__board__board_state} + B
65 ff 80                       # 54cd |   bmov H, [D]
                               #      | _A_if_19:
e8 ff 00 f8 0d 00              # 54d0 |   jeq H, 0, ${_E_if_19}:rel + PC
c4 60 00                       # 54d6 |   inc C, 0
58 f8 10 00                    # 54d9 |   jmp ${_C_for_8}:rel + PC
                               #      | _E_if_19:
                               #      | _C_if_19:
                               #      | _Z_if_19:
                               #      | _BZ_for_9:
44 40                          # 54dd |   inc B
58 f8 dd ff                    # 54df |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
                               #      | _BZ_for_8:
44 20                          # 54e3 |   inc A
58 f8 cd ff                    # 54e5 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _A_call_27:
e0 1c 01                       # 54e9 |   push 0x1
5c f8 bb fd                    # 54ec |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54f0 |   mov SP, SP + 0x2
                               #      | _Z_call_27:
60 ff 60                       # 54f4 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 54f7 |   pop A
e4 40                          # 54f9 |   pop B
e4 60                          # 54fb |   pop C
e4 80                          # 54fd |   pop D
dc                             # 54ff |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
e0 20                          # 5500 |   push A
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 fe e0 06 ff                 # 5502 |   mov G, [0xff06]
ac ff fe e0 00 80              # 5507 |   and H, G, 0x8000
e8 ff 00 f8 7e 00              # 550d |   jeq H, 0, ${_C_loop_2}:rel + PC
a9 ff e0 1c f0 5d 08           # 5513 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 551a |   and G, 0xff
30 ff fe                       # 551f |   or H, G
62 e0 ff f0 5d                 # 5522 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5527 |   shr G, H, 0x8
2c ff e0 ff 00                 # 552c |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 5531 |   jeq G, 0xf0, ${_BA_loop_2}:rel + PC
60 fe 00                       # 5539 |   mov G, 0
                               #      | _A_if_23:
ec ff 1c f8 75 0f 00           # 553c |   jne H, 0x75, ${_E_if_23}:rel + PC
60 fe 1c 03                    # 5543 |   mov G, 0x3
58 f8 2c 00                    # 5547 |   jmp ${_C_if_23}:rel + PC
                               #      | _E_if_23:
ec ff 1c f8 74 0f 00           # 554b |   jne H, 0x74, ${_E2_if_23}:rel + PC
60 fe 1c 02                    # 5552 |   mov G, 0x2
58 f8 1d 00                    # 5556 |   jmp ${_C_if_23}:rel + PC
                               #      | _E2_if_23:
ec ff 1c f8 6b 0e 00           # 555a |   jne H, 0x6b, ${_E3_if_23}:rel + PC
c4 fe 00                       # 5561 |   inc G, 0
58 f8 0f 00                    # 5564 |   jmp ${_C_if_23}:rel + PC
                               #      | _E3_if_23:
ec ff 1c f8 72 0b 00           # 5568 |   jne H, 0x72, ${_E4_if_23}:rel + PC
60 fe 1c 04                    # 556f |   mov G, 0x4
                               #      | _E4_if_23:
                               #      | _C_if_23:
                               #      | _Z_if_23:
                               #      | _A_if_24:
e8 fe 00 f8 14 00              # 5573 |   jeq G, 0, ${_E_if_24}:rel + PC
                               #      | _A_call_46:
e0 fe                          # 5579 |   push G
5c f8 77 00                    # 557b |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 557f |   mov SP, SP + 0x2
                               #      | _Z_call_46:
                               #      | _A_call_47:
5c f8 1e fe                    # 5583 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_47:
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
                               #      | _BZ_loop_2:
58 f8 7b ff                    # 5587 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
61 ff e0 0e ff                 # 558b |   mov H, [0xff0e]
                               #      | _A_if_31:
e9 ff e0 f8 ee 5d 5f 00        # 5590 |   jeq H, [${var__last_btn_in}], ${_E_if_31}:rel + PC
62 e0 ff ee 5d                 # 5598 |   mov [${var__last_btn_in}], H
60 fe 00                       # 559d |   mov G, 0
98 20 ff 1c 0c                 # 55a0 |   getb A, H, 0xc
                               #      | _A_if_32:
e8 20 00 f8 0a 00              # 55a5 |   jeq A, 0, ${_E_if_32}:rel + PC
60 fe 1c 03                    # 55ab |   mov G, 0x3
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
98 20 ff 1c 0b                 # 55af |   getb A, H, 0xb
                               #      | _A_if_33:
e8 20 00 f8 0a 00              # 55b4 |   jeq A, 0, ${_E_if_33}:rel + PC
60 fe 1c 02                    # 55ba |   mov G, 0x2
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
98 20 ff 1c 0a                 # 55be |   getb A, H, 0xa
                               #      | _A_if_34:
e8 20 00 f8 09 00              # 55c3 |   jeq A, 0, ${_E_if_34}:rel + PC
c4 fe 00                       # 55c9 |   inc G, 0
                               #      | _E_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
98 20 ff 1c 09                 # 55cc |   getb A, H, 0x9
                               #      | _A_if_35:
e8 20 00 f8 0a 00              # 55d1 |   jeq A, 0, ${_E_if_35}:rel + PC
60 fe 1c 04                    # 55d7 |   mov G, 0x4
                               #      | _E_if_35:
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _A_if_36:
e8 fe 00 f8 14 00              # 55db |   jeq G, 0, ${_E_if_36}:rel + PC
                               #      | _A_call_48:
e0 fe                          # 55e1 |   push G
5c f8 0f 00                    # 55e3 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 55e7 |   mov SP, SP + 0x2
                               #      | _Z_call_48:
                               #      | _A_call_49:
5c f8 b6 fd                    # 55eb |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_49:
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _E_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
                               #      | _cleanup_fn_handle_keyboard:
e4 20                          # 55ef |   pop A
dc                             # 55f1 |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 55f2 |   push A
61 20 bc 04                    # 55f4 |   mov A, [SP + 0x4]
                               #      | _A_if_25:
ec 20 1c f8 01 16 00           # 55f8 |   jne A, 0x1, ${_E_if_25}:rel + PC
                               #      | _A_call_33:
e0 1c ff                       # 55ff |   push -1
5c f8 3f 00                    # 5602 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5606 |   mov SP, SP + 0x2
                               #      | _Z_call_33:
58 f8 34 00                    # 560a |   jmp ${_C_if_25}:rel + PC
                               #      | _E_if_25:
ec 20 1c f8 02 16 00           # 560e |   jne A, 0x2, ${_E2_if_25}:rel + PC
                               #      | _A_call_34:
e0 1c 01                       # 5615 |   push 0x1
5c f8 29 00                    # 5618 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 561c |   mov SP, SP + 0x2
                               #      | _Z_call_34:
58 f8 1e 00                    # 5620 |   jmp ${_C_if_25}:rel + PC
                               #      | _E2_if_25:
ec 20 1c f8 04 0f 00           # 5624 |   jne A, 0x4, ${_E3_if_25}:rel + PC
                               #      | _A_call_39:
5c f8 42 00                    # 562b |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_39:
58 f8 0f 00                    # 562f |   jmp ${_C_if_25}:rel + PC
                               #      | _E3_if_25:
ec 20 1c f8 03 0b 00           # 5633 |   jne A, 0x3, ${_E4_if_25}:rel + PC
                               #      | _A_call_45:
5c f8 63 00                    # 563a |   call ${fn_tg_rotate}:rel + PC
                               #      | _Z_call_45:
                               #      | _E4_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 563e |   pop A
dc                             # 5640 |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_30:
e0 00                          # 5641 |   push 0
5c f8 64 fc                    # 5643 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5647 |   mov SP, SP + 0x2
                               #      | _Z_call_30:
03 e0 bc d8 5d 02              # 564b |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_31:
5c f8 c9 fc                    # 5651 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_31:
                               #      | _A_if_26:
ec ff 00 f8 0c 00              # 5655 |   jne H, 0, ${_E_if_26}:rel + PC
07 e0 bc d8 5d 02              # 565b |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _A_call_32:
e0 1c 01                       # 5661 |   push 0x1
5c f8 43 fc                    # 5664 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5668 |   mov SP, SP + 0x2
                               #      | _Z_call_32:
                               #      | _cleanup_fn_tg_move:
dc                             # 566c |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_35:
e0 00                          # 566d |   push 0
5c f8 38 fc                    # 566f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5673 |   mov SP, SP + 0x2
                               #      | _Z_call_35:
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
46 e0 d6 5d                    # 5677 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_36:
5c f8 9f fc                    # 567b |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_36:
e8 ff 00 f8 0a 00              # 567f |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _BZ_loop_3:
58 f8 f2 ff                    # 5685 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
4a e0 d6 5d                    # 5689 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_37:
e0 1c 01                       # 568d |   push 0x1
5c f8 17 fc                    # 5690 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5694 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
                               #      | _A_call_38:
5c f8 0e fb                    # 5698 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_38:
                               #      | _cleanup_fn_tg_down:
dc                             # 569c |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_40:
e0 00                          # 569d |   push 0
5c f8 08 fc                    # 569f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 56a3 |   mov SP, SP + 0x2
                               #      | _Z_call_40:
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
c5 ff e0 d4 5d                 # 56a7 |   inc H, [${var__board__falling} + 0002]
2c ff 1c 03                    # 56ac |   and H, 0x3
62 e0 ff d4 5d                 # 56b0 |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_41:
5c f8 65 fc                    # 56b5 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_41:
ec ff 00 f8 2c 00              # 56b9 |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 d8 5d                    # 56bf |   dec [${var__board__falling} + 0006]
                               #      | _A_call_42:
5c f8 57 fc                    # 56c3 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_42:
ec ff 00 f8 1e 00              # 56c7 |   jne H, 0, ${_C_loop_4}:rel + PC
02 e0 1c d8 5d 02              # 56cd |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_43:
5c f8 47 fc                    # 56d3 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_43:
ec ff 00 f8 0e 00              # 56d7 |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 d8 5d                    # 56dd |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_4:
58 f8 c6 ff                    # 56e1 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _A_call_44:
e0 1c 01                       # 56e5 |   push 0x1
5c f8 bf fb                    # 56e8 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 56ec |   mov SP, SP + 0x2
                               #      | _Z_call_44:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 56f0 |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 56f1 |   push D
e0 60                          # 56f3 |   push C
e0 40                          # 56f5 |   push B
e0 20                          # 56f7 |   push A
61 40 e0 10 ff                 # 56f9 |   mov B, [0xff10]
61 60 e0 12 ff                 # 56fe |   mov C, [0xff12]
61 80 e0 14 ff                 # 5703 |   mov D, [0xff14]
61 20 bc 0e                    # 5708 |   mov A, [SP + 0xe]
60 ff 00                       # 570c |   mov H, 0
                               #      | _A_if_37:
fc 28 20 f8 09 00              # 570f |   jge A + B, A, ${_E_if_37}:rel + PC
c4 ff 00                       # 5715 |   inc H, 0
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
60 40 44                       # 5718 |   mov B, B + A
81 20 bc ff 0c                 # 571b |   add A, [SP + 0xc], H
60 ff 00                       # 5720 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 5723 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 5729 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 572f |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 5733 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 5736 |   mov C, C + A
81 20 bc ff 0a                 # 5739 |   add A, [SP + 0xa], H
60 80 84                       # 573e |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 5741 |   mov A, [SP + 0x10]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
61 ff e0 14 ff                 # 5745 |   mov H, [0xff14]
                               #      | _A_if_40:
f4 ff 80 f8 0a 00              # 574a |   jle H, D, ${_E_if_40}:rel + PC
58 f8 33 00                    # 5750 |   jmp ${_C_loop_5}:rel + PC
                               #      | _E_if_40:
ec ff 80 f8 2b 00              # 5754 |   jne H, D, ${_E2_if_40}:rel + PC
61 ff e0 12 ff                 # 575a |   mov H, [0xff12]
                               #      | _A_if_41:
f4 ff 60 f8 0a 00              # 575f |   jle H, C, ${_E_if_41}:rel + PC
58 f8 1e 00                    # 5765 |   jmp ${_C_loop_5}:rel + PC
                               #      | _E_if_41:
ec ff 60 f8 16 00              # 5769 |   jne H, C, ${_E2_if_41}:rel + PC
fa e0 40 f8 10 ff 14 00        # 576f |   jgt [0xff10], B, ${_C_loop_5}:rel + PC
                               #      | _A_if_43:
e8 20 00 f8 08 00              # 5777 |   jeq A, 0, ${_E_if_43}:rel + PC
5c 20                          # 577d |   call A
                               #      | _E_if_43:
                               #      | _C_if_43:
                               #      | _Z_if_43:
                               #      | _E2_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
                               #      | _E2_if_40:
                               #      | _C_if_40:
                               #      | _Z_if_40:
                               #      | _BZ_loop_5:
58 f8 c6 ff                    # 577f |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5783 |   pop A
e4 40                          # 5785 |   pop B
e4 60                          # 5787 |   pop C
e4 80                          # 5789 |   pop D
dc                             # 578b |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 578c |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 57c4 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x57ec
                               #      | SECTION_BEGIN_static_data:
                               # 57ec |   .align dummy_size:4 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 57f0 |   .bss size:1280 align:16
                               #      | var__rand__state:
                               # 5cf0 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 5cf2 |   .bss size:220 align:1
                               #      | var__board__points:
                               # 5dce |   .bss size:2 align:1
                               #      | var__board__level:
                               # 5dd0 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 5dd2 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 5dda |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 5de2 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 5dea |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 5dec |   .bss size:2 align:1
                               #      | var__last_btn_in:
                               # 5dee |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 5df0 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
