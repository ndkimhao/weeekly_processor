                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_49:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_49:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
62 e0 00 8e 68                 # 500a |   mov [${var__last_btn_in}], 0
                               #      | _A_call_6:
5c f8 2c 00                    # 500f |   call ${fn_init_tetris_color_palette}:rel + PC
                               #      | _Z_call_6:
                               #      | _A_call_13:
5c f8 05 01                    # 5013 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_13:
                               #      |   # game loop
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
                               #      | _A_call_27:
5c f8 2a 02                    # 5017 |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_27:
e8 ff 00 f8 1f 00              # 501b |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_call_48:
e0 e0 a3 55                    # 5021 |   push ${fn_handle_keyboard}
e0 e0 e0 93                    # 5025 |   push 0x93e0
e0 1c 04                       # 5029 |   push 0x4
e0 00                          # 502c |   push 0
5c f8 66 07                    # 502e |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5032 |   mov SP, SP + 0x8
                               #      | _Z_call_48:
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
54 e0 e0 1c 90 58 8f 5d 04     # 5089 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
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
63 e4 bc 90 58 0a              # 5103 |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc a0 58 08              # 5109 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc b0 58 06              # 510f |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
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
e0 e0 92 67                    # 511e |   push ${var__board__board_state}
5c f8 46 00                    # 5122 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5126 |   mov SP, SP + 0x6
                               #      | _Z_call_7:
62 e0 00 6e 68                 # 512a |   mov [${var__board__points}], 0
62 e0 00 70 68                 # 512f |   mov [${var__board__level}], 0
62 e0 00 8a 68                 # 5134 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 8c 68                 # 5139 |   mov [${var__board__lines_remaining}], 0
                               #      | _A_call_8:
e0 e0 be 0b                    # 513e |   push 0xbbe
5c f8 5f 00                    # 5142 |   call ${fn_srand}:rel + PC
60 a0 bc 02                    # 5146 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
                               #      | _A_call_11:
5c f8 5e 00                    # 514a |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_11:
                               #      | _A_call_12:
5c f8 5a 00                    # 514e |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_12:
ca e0 00 82 68                 # 5152 |   dec [${var__board__stored}], 0
62 e0 00 84 68                 # 5157 |   mov [${var__board__stored} + 0002], 0
62 e0 00 86 68                 # 515c |   mov [${var__board__stored} + 0004], 0
62 e0 1c 80 68 03              # 5161 |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_init:
dc                             # 5167 |   ret
                               #      | _end_fn_tg_init:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 5168 |   push B
e0 20                          # 516a |   push A
65 fe bc 08                    # 516c |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 5170 |   shl H, G, 0x8
30 ff fe                       # 5175 |   or H, G
61 20 bc 06                    # 5178 |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 517c |   add B, [SP + 0xa], A
                               #      | _A_while_1:
                               #      | _BA_while_1:
f8 3c 40 f8 02 12 00           # 5181 |   jgt A + 0x2, B, ${_C_while_1}:rel + PC
62 20 ff                       # 5188 |   mov [A], H
60 20 3c 02                    # 518b |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 f2 ff                    # 518f |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      | _A_if_4:
fc 20 40 f8 09 00              # 5193 |   jge A, B, ${_E_if_4}:rel + PC
66 20 ff                       # 5199 |   bmov [A], H
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _cleanup_fn_memset:
e4 20                          # 519c |   pop A
e4 40                          # 519e |   pop B
dc                             # 51a0 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc 90 67 02              # 51a1 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 51a7 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_9:
e0 1c 08                       # 51a8 |   push 0x8
e0 e0 7a 68                    # 51ab |   push ${var__board__next}
e0 e0 72 68                    # 51af |   push ${var__board__falling}
5c f8 32 00                    # 51b3 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 51b7 |   mov SP, SP + 0x6
                               #      | _Z_call_9:
                               #      |   # fill new Board.next
                               #      | _A_call_10:
5c f8 63 00                    # 51bb |   call ${fn_rand}:rel + PC
                               #      | _Z_call_10:
b5 fe e0 ff 10 ff              # 51bf |   xor G, [0xff10], H
08 fe e0 4f c3                 # 51c5 |   mul G, 0xc34f
90 fe ff 1c 07                 # 51ca |   div G, H, 0x7
c6 e0 ff 7a 68                 # 51cf |   inc [${var__board__next}], H
62 e0 00 7c 68                 # 51d4 |   mov [${var__board__next} + 0002], 0
62 e0 00 7e 68                 # 51d9 |   mov [${var__board__next} + 0004], 0
62 e0 1c 80 68 03              # 51de |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_new_falling:
dc                             # 51e4 |   ret
                               #      | _end_fn_tg_new_falling:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 51e5 |   push C
e0 40                          # 51e7 |   push B
e0 20                          # 51e9 |   push A
61 20 bc 08                    # 51eb |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 51ef |   add B, [SP + 0xc], A
61 60 bc 0a                    # 51f4 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
f8 3c 40 f8 02 16 00           # 51f8 |   jgt A + 0x2, B, ${_C_while_2}:rel + PC
63 20 60                       # 51ff |   mov [A], [C]
60 20 3c 02                    # 5202 |   mov A, A + 0x2
60 60 7c 02                    # 5206 |   mov C, C + 0x2
                               #      | _BZ_while_2:
58 f8 ee ff                    # 520a |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _A_if_5:
fc 20 40 f8 09 00              # 520e |   jge A, B, ${_E_if_5}:rel + PC
67 20 60                       # 5214 |   bmov [A], [C]
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 5217 |   pop A
e4 40                          # 5219 |   pop B
e4 60                          # 521b |   pop C
dc                             # 521d |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
61 ff e0 90 67                 # 521e |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 5223 |   shl G, H, 0x7
34 ff fe                       # 5228 |   xor H, G
a0 fe ff 1c 09                 # 522b |   shr G, H, 0x9
34 ff fe                       # 5230 |   xor H, G
a8 fe ff 1c 08                 # 5233 |   shl G, H, 0x8
34 ff fe                       # 5238 |   xor H, G
62 e0 ff 90 67                 # 523b |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5240 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_19:
5c f8 26 00                    # 5241 |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_19:
                               #      | _A_if_14:
e8 ff 00 f8 0a 00              # 5245 |   jeq H, 0, ${_E_if_14}:rel + PC
                               #      | _A_call_21:
5c f8 7e 01                    # 524b |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_21:
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
                               #      | _A_call_22:
5c f8 e9 02                    # 524f |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_22:
                               #      | _A_call_23:
e0 ff                          # 5253 |   push H
5c f8 e7 02                    # 5255 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5259 |   mov SP, SP + 0x2
                               #      | _Z_call_23:
                               #      | _A_call_26:
5c f8 e0 02                    # 525d |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_26:
84 ff 1c ff 01                 # 5261 |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5266 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 5267 |   push A
4a e0 8a 68                    # 5269 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_6:
d2 e0 00 8a 68                 # 526d |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 54 00                    # 5272 |   jgt ${_E_if_6}:rel + PC
                               #      | _A_call_14:
e0 00                          # 5276 |   push 0
5c f8 54 00                    # 5278 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 527c |   mov SP, SP + 0x2
                               #      | _Z_call_14:
46 e0 76 68                    # 5280 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_15:
5c f8 bb 00                    # 5284 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_15:
                               #      | _A_if_13:
ec ff 1c f8 01 19 00           # 5288 |   jne H, 0x1, ${_E_if_13}:rel + PC
a9 20 e0 1c 70 68 01           # 528f |   shl A, [${var__board__level}], 0x1
63 e0 e4 8a 68 67 58           # 5296 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 529d |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
4a e0 76 68                    # 52a1 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_16:
e0 1c 01                       # 52a5 |   push 0x1
5c f8 24 00                    # 52a8 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 52ac |   mov SP, SP + 0x2
                               #      | _Z_call_16:
                               #      | _A_call_17:
5c f8 f8 fe                    # 52b0 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_17:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _A_call_18:
e0 1c 01                       # 52b4 |   push 0x1
5c f8 15 00                    # 52b7 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 52bb |   mov SP, SP + 0x2
                               #      | _Z_call_18:
c4 ff 00                       # 52bf |   inc H, 0
58 f8 07 00                    # 52c2 |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
60 ff 00                       # 52c6 |   mov H, 0
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 52c9 |   pop A
dc                             # 52cb |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 52cc |   push D
e0 60                          # 52ce |   push C
e0 40                          # 52d0 |   push B
e0 20                          # 52d2 |   push A
61 20 bc 0a                    # 52d4 |   mov A, [SP + 0xa]
c9 40 e0 72 68                 # 52d8 |   dec B, [${var__board__falling}]
a9 80 e0 1c 74 68 01           # 52dd |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 52e4 |   mov D, B*8 + D
61 80 f0 2f 58                 # 52e7 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_2:
60 60 00                       # 52ec |   mov C, 0
                               #      | _BA_for_2:
fc 60 1c f8 04 47 00           # 52ef |   jge C, 0x4, ${_C_for_2}:rel + PC
a0 40 80 7e 02                 # 52f6 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 52fb |   shr E, D, C*4
2c 40 1c 03                    # 52ff |   and B, 0x3
2c fc 1c 03                    # 5303 |   and E, 0x3
81 fe e0 40 76 68              # 5307 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc 78 68              # 530d |   add B, [${var__board__falling} + 0006], E
88 fd fe 1c 0a                 # 5313 |   mul F, G, 0xa
00 fd e8 92 67                 # 5318 |   add F, ${var__board__board_state} + B
                               #      | _A_if_7:
ee bc 00 f8 0a 0e 00           # 531d |   jne [SP + 0xa], 0, ${_E_if_7}:rel + PC
66 fd 00                       # 5324 |   bmov [F], 0
58 f8 09 00                    # 5327 |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
67 fd e0 72 68                 # 532b |   bmov [F], [${var__board__falling}]
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _BZ_for_2:
44 60                          # 5330 |   inc C
58 f8 bd ff                    # 5332 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 5336 |   pop A
e4 40                          # 5338 |   pop B
e4 60                          # 533a |   pop C
e4 80                          # 533c |   pop D
dc                             # 533e |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 533f |   push D
e0 60                          # 5341 |   push C
e0 40                          # 5343 |   push B
e0 20                          # 5345 |   push A
c9 40 e0 72 68                 # 5347 |   dec B, [${var__board__falling}]
a9 80 e0 1c 74 68 01           # 534c |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 5353 |   mov D, B*8 + D
61 80 f0 2f 58                 # 5356 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_3:
60 60 00                       # 535b |   mov C, 0
                               #      | _BA_for_3:
fc 60 1c f8 04 5f 00           # 535e |   jge C, 0x4, ${_C_for_3}:rel + PC
a0 20 80 7e 02                 # 5365 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 536a |   shr E, D, C*4
2c 20 1c 03                    # 536e |   and A, 0x3
2c fc 1c 03                    # 5372 |   and E, 0x3
81 fe e0 20 76 68              # 5376 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc 78 68              # 537c |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 5382 |   mov H, 0
d0 fe 00                       # 5385 |   icmp G, 0
70 f8 38 00                    # 5388 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 538c |   icmp B, 0
70 f8 31 00                    # 538f |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2d 00           # 5393 |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 26 00           # 539a |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 53a1 |   mul F, G, 0xa
00 fd e8 92 67                 # 53a6 |   add F, ${var__board__board_state} + B
65 fd fd                       # 53ab |   bmov F, [F]
60 ff 00                       # 53ae |   mov H, 0
ec fd 00 f8 0f 00              # 53b1 |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_3:
44 60                          # 53b7 |   inc C
58 f8 a5 ff                    # 53b9 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      |   # done checking, all good
c4 ff 00                       # 53bd |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 53c0 |   pop A
e4 40                          # 53c2 |   pop B
e4 60                          # 53c4 |   pop C
e4 80                          # 53c6 |   pop D
dc                             # 53c8 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 53c9 |   push D
e0 60                          # 53cb |   push C
e0 40                          # 53cd |   push B
e0 20                          # 53cf |   push A
60 a0 bc fe                    # 53d1 |   mov SP, SP + -2
                               #      | _A_for_4:
60 20 00                       # 53d5 |   mov A, 0
                               #      | _BA_for_4:
fc 20 1c f8 16 19 01           # 53d8 |   jge A, 0x16, ${_C_for_4}:rel + PC
62 a0 20                       # 53df |   mov [SP], A
                               #      | _A_call_20:
e0 3c 02                       # 53e2 |   push A + 0x2
5c f8 19 01                    # 53e5 |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 53e9 |   mov SP, SP + 0x2
                               #      | _Z_call_20:
                               #      | _A_for_5:
e0 20                          # 53ed |   push A
60 40 00                       # 53ef |   mov B, 0
                               #      | _BA_for_5:
fc 40 1c f8 0a f7 00           # 53f2 |   jge B, 0xa, ${_C_for_5}:rel + PC
89 80 bc 1c 02 0a              # 53f9 |   mul D, [SP + 0x2], 0xa
80 80 88 e0 92 67              # 53ff |   add D, D + B, ${var__board__board_state}
65 20 80                       # 5405 |   bmov A, [D]
a8 60 5c 1c 0a 01              # 5408 |   shl C, B + 0xa, 0x1
60 60 ec 90 58                 # 540e |   mov C, ${var__VIDEO_ROW_BUFFER} + C
                               #      | _A_if_15:
ec 20 00 f8 52 00              # 5413 |   jne A, 0, ${_E_if_15}:rel + PC
                               #      | _A_for_6:
60 80 00                       # 5419 |   mov D, 0
                               #      | _BA_for_6:
fc 80 e0 f8 00 0f 14 00        # 541c |   jge D, 0xf00, ${_C_for_6}:rel + PC
c6 70 00                       # 5424 |   inc [C + D], 0
                               #      | _BZ_for_6:
60 80 f0 a0 00                 # 5427 |   mov D, 0xa0 + D
58 f8 f0 ff                    # 542c |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_for_7:
60 80 1c 50                    # 5430 |   mov D, 0x50
                               #      | _BA_for_7:
fc 80 e0 f8 00 0f 14 00        # 5434 |   jge D, 0xf00, ${_C_for_7}:rel + PC
62 70 00                       # 543c |   mov [C + D], 0
                               #      | _BZ_for_7:
60 80 f0 a0 00                 # 543f |   mov D, 0xa0 + D
58 f8 f0 ff                    # 5444 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _A_for_8:
60 80 00                       # 5448 |   mov D, 0
                               #      | _BA_for_8:
fc 80 e0 f8 00 0f 16 00        # 544b |   jge D, 0xf00, ${_C_for_8}:rel + PC
62 70 e0 55 55                 # 5453 |   mov [C + D], 0x5555
                               #      | _BZ_for_8:
60 80 f0 00 05                 # 5458 |   mov D, 0x500 + D
58 f8 ee ff                    # 545d |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
58 f8 82 00                    # 5461 |   jmp ${_C_if_15}:rel + PC
                               #      | _E_if_15:
98 ff 20 00                    # 5465 |   getb H, A, 0
                               #      | _A_if_16:
e8 ff 00 f8 0b 00              # 5469 |   jeq H, 0, ${_E_if_16}:rel + PC
60 ff e0 ff 7f                 # 546f |   mov H, 0x7fff
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _A_for_9:
60 80 00                       # 5474 |   mov D, 0
                               #      | _BA_for_9:
fc 80 e0 f8 b0 04 13 00        # 5477 |   jge D, 0x4b0, ${_C_for_9}:rel + PC
62 70 ff                       # 547f |   mov [C + D], H
                               #      | _BZ_for_9:
60 80 9c 50                    # 5482 |   mov D, D + 0x50
58 f8 f1 ff                    # 5486 |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
62 70 00                       # 548a |   mov [C + D], 0
98 ff 20 1c 01                 # 548d |   getb H, A, 0x1
                               #      | _A_if_17:
e8 ff 00 f8 0b 00              # 5492 |   jeq H, 0, ${_E_if_17}:rel + PC
60 ff e0 ff 7f                 # 5498 |   mov H, 0x7fff
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _A_for_10:
60 80 e0 00 05                 # 549d |   mov D, 0x500
                               #      | _BA_for_10:
fc 80 e0 f8 b0 09 13 00        # 54a2 |   jge D, 0x9b0, ${_C_for_10}:rel + PC
62 70 ff                       # 54aa |   mov [C + D], H
                               #      | _BZ_for_10:
60 80 9c 50                    # 54ad |   mov D, D + 0x50
58 f8 f1 ff                    # 54b1 |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
62 70 00                       # 54b5 |   mov [C + D], 0
98 ff 20 1c 02                 # 54b8 |   getb H, A, 0x2
                               #      | _A_if_18:
e8 ff 00 f8 0b 00              # 54bd |   jeq H, 0, ${_E_if_18}:rel + PC
60 ff e0 ff 7f                 # 54c3 |   mov H, 0x7fff
                               #      | _E_if_18:
                               #      | _C_if_18:
                               #      | _Z_if_18:
                               #      | _A_for_11:
60 80 e0 00 0a                 # 54c8 |   mov D, 0xa00
                               #      | _BA_for_11:
fc 80 e0 f8 b0 0e 13 00        # 54cd |   jge D, 0xeb0, ${_C_for_11}:rel + PC
62 70 ff                       # 54d5 |   mov [C + D], H
                               #      | _BZ_for_11:
60 80 9c 50                    # 54d8 |   mov D, D + 0x50
58 f8 f1 ff                    # 54dc |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
62 70 00                       # 54e0 |   mov [C + D], 0
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _BZ_for_5:
44 40                          # 54e3 |   inc B
58 f8 0d ff                    # 54e5 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
e4 20                          # 54e9 |   pop A
                               #      | _Z_for_5:
                               #      | _BZ_for_4:
44 20                          # 54eb |   inc A
58 f8 eb fe                    # 54ed |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_display_board:
60 a0 bc 02                    # 54f1 |   mov SP, SP + 0x2
e4 20                          # 54f5 |   pop A
e4 40                          # 54f7 |   pop B
e4 60                          # 54f9 |   pop C
e4 80                          # 54fb |   pop D
dc                             # 54fd |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_page_rgb:
                               #      | _begin_fn_switch_screen_page_rgb:
e0 40                          # 54fe |   push B
e0 20                          # 5500 |   push A
60 20 e0 a1 00                 # 5502 |   mov A, 0xa1
89 40 bc e0 06 00 05           # 5507 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 90 58 8f 5d 04     # 550e |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
60 20 e0 a2 00                 # 5517 |   mov A, 0xa2
54 e0 e0 1c 90 5d 8f 62 05     # 551c |   mmap ${var__VIDEO_ROW_BUFFER} + 0500, ${var__VIDEO_ROW_BUFFER} + 09ff, 0x5
60 20 e0 a4 00                 # 5525 |   mov A, 0xa4
54 e0 e0 1c 90 62 8f 67 06     # 552a |   mmap ${var__VIDEO_ROW_BUFFER} + 0a00, ${var__VIDEO_ROW_BUFFER} + 0eff, 0x6
                               #      | _cleanup_fn_switch_screen_page_rgb:
e4 20                          # 5533 |   pop A
e4 40                          # 5535 |   pop B
dc                             # 5537 |   ret
                               #      | _end_fn_switch_screen_page_rgb:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 5538 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 553b |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 553c |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 553d |   push D
e0 60                          # 553f |   push C
e0 40                          # 5541 |   push B
e0 20                          # 5543 |   push A
60 60 00                       # 5545 |   mov C, 0
                               #      | _A_call_24:
e0 00                          # 5548 |   push 0
5c f8 82 fd                    # 554a |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 554e |   mov SP, SP + 0x2
                               #      | _Z_call_24:
                               #      | _A_for_12:
60 20 00                       # 5552 |   mov A, 0
                               #      | _BA_for_12:
fc 20 1c f8 02 37 00           # 5555 |   jge A, 0x2, ${_C_for_12}:rel + PC
                               #      | _A_for_13:
60 40 00                       # 555c |   mov B, 0
                               #      | _BA_for_13:
fc 40 1c f8 0a 27 00           # 555f |   jge B, 0xa, ${_C_for_13}:rel + PC
88 80 20 1c 0a                 # 5566 |   mul D, A, 0xa
00 80 e8 92 67                 # 556b |   add D, ${var__board__board_state} + B
65 ff 80                       # 5570 |   bmov H, [D]
                               #      | _A_if_19:
e8 ff 00 f8 0d 00              # 5573 |   jeq H, 0, ${_E_if_19}:rel + PC
c4 60 00                       # 5579 |   inc C, 0
58 f8 10 00                    # 557c |   jmp ${_C_for_12}:rel + PC
                               #      | _E_if_19:
                               #      | _C_if_19:
                               #      | _Z_if_19:
                               #      | _BZ_for_13:
44 40                          # 5580 |   inc B
58 f8 dd ff                    # 5582 |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
                               #      | _BZ_for_12:
44 20                          # 5586 |   inc A
58 f8 cd ff                    # 5588 |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _A_call_25:
e0 1c 01                       # 558c |   push 0x1
5c f8 3d fd                    # 558f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5593 |   mov SP, SP + 0x2
                               #      | _Z_call_25:
60 ff 60                       # 5597 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 559a |   pop A
e4 40                          # 559c |   pop B
e4 60                          # 559e |   pop C
e4 80                          # 55a0 |   pop D
dc                             # 55a2 |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
e0 20                          # 55a3 |   push A
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 fe e0 06 ff                 # 55a5 |   mov G, [0xff06]
ac ff fe e0 00 80              # 55aa |   and H, G, 0x8000
e8 ff 00 f8 7e 00              # 55b0 |   jeq H, 0, ${_C_loop_2}:rel + PC
a9 ff e0 1c 90 68 08           # 55b6 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 55bd |   and G, 0xff
30 ff fe                       # 55c2 |   or H, G
62 e0 ff 90 68                 # 55c5 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 55ca |   shr G, H, 0x8
2c ff e0 ff 00                 # 55cf |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 55d4 |   jeq G, 0xf0, ${_BA_loop_2}:rel + PC
60 fe 00                       # 55dc |   mov G, 0
                               #      | _A_if_23:
ec ff 1c f8 75 0f 00           # 55df |   jne H, 0x75, ${_E_if_23}:rel + PC
60 fe 1c 03                    # 55e6 |   mov G, 0x3
58 f8 2c 00                    # 55ea |   jmp ${_C_if_23}:rel + PC
                               #      | _E_if_23:
ec ff 1c f8 74 0f 00           # 55ee |   jne H, 0x74, ${_E2_if_23}:rel + PC
60 fe 1c 02                    # 55f5 |   mov G, 0x2
58 f8 1d 00                    # 55f9 |   jmp ${_C_if_23}:rel + PC
                               #      | _E2_if_23:
ec ff 1c f8 6b 0e 00           # 55fd |   jne H, 0x6b, ${_E3_if_23}:rel + PC
c4 fe 00                       # 5604 |   inc G, 0
58 f8 0f 00                    # 5607 |   jmp ${_C_if_23}:rel + PC
                               #      | _E3_if_23:
ec ff 1c f8 72 0b 00           # 560b |   jne H, 0x72, ${_E4_if_23}:rel + PC
60 fe 1c 04                    # 5612 |   mov G, 0x4
                               #      | _E4_if_23:
                               #      | _C_if_23:
                               #      | _Z_if_23:
                               #      | _A_if_24:
e8 fe 00 f8 14 00              # 5616 |   jeq G, 0, ${_E_if_24}:rel + PC
                               #      | _A_call_44:
e0 fe                          # 561c |   push G
5c f8 77 00                    # 561e |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5622 |   mov SP, SP + 0x2
                               #      | _Z_call_44:
                               #      | _A_call_45:
5c f8 a3 fd                    # 5626 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_45:
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
                               #      | _BZ_loop_2:
58 f8 7b ff                    # 562a |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
61 ff e0 0e ff                 # 562e |   mov H, [0xff0e]
                               #      | _A_if_31:
e9 ff e0 f8 8e 68 5f 00        # 5633 |   jeq H, [${var__last_btn_in}], ${_E_if_31}:rel + PC
62 e0 ff 8e 68                 # 563b |   mov [${var__last_btn_in}], H
60 fe 00                       # 5640 |   mov G, 0
98 20 ff 1c 0c                 # 5643 |   getb A, H, 0xc
                               #      | _A_if_32:
e8 20 00 f8 0a 00              # 5648 |   jeq A, 0, ${_E_if_32}:rel + PC
60 fe 1c 03                    # 564e |   mov G, 0x3
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
98 20 ff 1c 0b                 # 5652 |   getb A, H, 0xb
                               #      | _A_if_33:
e8 20 00 f8 0a 00              # 5657 |   jeq A, 0, ${_E_if_33}:rel + PC
60 fe 1c 02                    # 565d |   mov G, 0x2
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
98 20 ff 1c 0a                 # 5661 |   getb A, H, 0xa
                               #      | _A_if_34:
e8 20 00 f8 09 00              # 5666 |   jeq A, 0, ${_E_if_34}:rel + PC
c4 fe 00                       # 566c |   inc G, 0
                               #      | _E_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
98 20 ff 1c 09                 # 566f |   getb A, H, 0x9
                               #      | _A_if_35:
e8 20 00 f8 0a 00              # 5674 |   jeq A, 0, ${_E_if_35}:rel + PC
60 fe 1c 04                    # 567a |   mov G, 0x4
                               #      | _E_if_35:
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _A_if_36:
e8 fe 00 f8 14 00              # 567e |   jeq G, 0, ${_E_if_36}:rel + PC
                               #      | _A_call_46:
e0 fe                          # 5684 |   push G
5c f8 0f 00                    # 5686 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 568a |   mov SP, SP + 0x2
                               #      | _Z_call_46:
                               #      | _A_call_47:
5c f8 3b fd                    # 568e |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_47:
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _E_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
                               #      | _cleanup_fn_handle_keyboard:
e4 20                          # 5692 |   pop A
dc                             # 5694 |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 5695 |   push A
61 20 bc 04                    # 5697 |   mov A, [SP + 0x4]
                               #      | _A_if_25:
ec 20 1c f8 01 16 00           # 569b |   jne A, 0x1, ${_E_if_25}:rel + PC
                               #      | _A_call_31:
e0 1c ff                       # 56a2 |   push -1
5c f8 3f 00                    # 56a5 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 56a9 |   mov SP, SP + 0x2
                               #      | _Z_call_31:
58 f8 34 00                    # 56ad |   jmp ${_C_if_25}:rel + PC
                               #      | _E_if_25:
ec 20 1c f8 02 16 00           # 56b1 |   jne A, 0x2, ${_E2_if_25}:rel + PC
                               #      | _A_call_32:
e0 1c 01                       # 56b8 |   push 0x1
5c f8 29 00                    # 56bb |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 56bf |   mov SP, SP + 0x2
                               #      | _Z_call_32:
58 f8 1e 00                    # 56c3 |   jmp ${_C_if_25}:rel + PC
                               #      | _E2_if_25:
ec 20 1c f8 04 0f 00           # 56c7 |   jne A, 0x4, ${_E3_if_25}:rel + PC
                               #      | _A_call_37:
5c f8 42 00                    # 56ce |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_37:
58 f8 0f 00                    # 56d2 |   jmp ${_C_if_25}:rel + PC
                               #      | _E3_if_25:
ec 20 1c f8 03 0b 00           # 56d6 |   jne A, 0x3, ${_E4_if_25}:rel + PC
                               #      | _A_call_43:
5c f8 63 00                    # 56dd |   call ${fn_tg_rotate}:rel + PC
                               #      | _Z_call_43:
                               #      | _E4_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 56e1 |   pop A
dc                             # 56e3 |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_28:
e0 00                          # 56e4 |   push 0
5c f8 e6 fb                    # 56e6 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 56ea |   mov SP, SP + 0x2
                               #      | _Z_call_28:
03 e0 bc 78 68 02              # 56ee |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_29:
5c f8 4b fc                    # 56f4 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_29:
                               #      | _A_if_26:
ec ff 00 f8 0c 00              # 56f8 |   jne H, 0, ${_E_if_26}:rel + PC
07 e0 bc 78 68 02              # 56fe |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _A_call_30:
e0 1c 01                       # 5704 |   push 0x1
5c f8 c5 fb                    # 5707 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 570b |   mov SP, SP + 0x2
                               #      | _Z_call_30:
                               #      | _cleanup_fn_tg_move:
dc                             # 570f |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_33:
e0 00                          # 5710 |   push 0
5c f8 ba fb                    # 5712 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5716 |   mov SP, SP + 0x2
                               #      | _Z_call_33:
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
46 e0 76 68                    # 571a |   inc [${var__board__falling} + 0004]
                               #      | _A_call_34:
5c f8 21 fc                    # 571e |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_34:
e8 ff 00 f8 0a 00              # 5722 |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _BZ_loop_3:
58 f8 f2 ff                    # 5728 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
4a e0 76 68                    # 572c |   dec [${var__board__falling} + 0004]
                               #      | _A_call_35:
e0 1c 01                       # 5730 |   push 0x1
5c f8 99 fb                    # 5733 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5737 |   mov SP, SP + 0x2
                               #      | _Z_call_35:
                               #      | _A_call_36:
5c f8 6d fa                    # 573b |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_36:
                               #      | _cleanup_fn_tg_down:
dc                             # 573f |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_38:
e0 00                          # 5740 |   push 0
5c f8 8a fb                    # 5742 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5746 |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
c5 ff e0 74 68                 # 574a |   inc H, [${var__board__falling} + 0002]
2c ff 1c 03                    # 574f |   and H, 0x3
62 e0 ff 74 68                 # 5753 |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_39:
5c f8 e7 fb                    # 5758 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_39:
ec ff 00 f8 2c 00              # 575c |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 78 68                    # 5762 |   dec [${var__board__falling} + 0006]
                               #      | _A_call_40:
5c f8 d9 fb                    # 5766 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_40:
ec ff 00 f8 1e 00              # 576a |   jne H, 0, ${_C_loop_4}:rel + PC
02 e0 1c 78 68 02              # 5770 |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_41:
5c f8 c9 fb                    # 5776 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_41:
ec ff 00 f8 0e 00              # 577a |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 78 68                    # 5780 |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_4:
58 f8 c6 ff                    # 5784 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _A_call_42:
e0 1c 01                       # 5788 |   push 0x1
5c f8 41 fb                    # 578b |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 578f |   mov SP, SP + 0x2
                               #      | _Z_call_42:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 5793 |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5794 |   push D
e0 60                          # 5796 |   push C
e0 40                          # 5798 |   push B
e0 20                          # 579a |   push A
61 40 e0 10 ff                 # 579c |   mov B, [0xff10]
61 60 e0 12 ff                 # 57a1 |   mov C, [0xff12]
61 80 e0 14 ff                 # 57a6 |   mov D, [0xff14]
61 20 bc 0e                    # 57ab |   mov A, [SP + 0xe]
60 ff 00                       # 57af |   mov H, 0
                               #      | _A_if_37:
fc 28 20 f8 09 00              # 57b2 |   jge A + B, A, ${_E_if_37}:rel + PC
c4 ff 00                       # 57b8 |   inc H, 0
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
60 40 44                       # 57bb |   mov B, B + A
81 20 bc ff 0c                 # 57be |   add A, [SP + 0xc], H
60 ff 00                       # 57c3 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 57c6 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 57cc |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 57d2 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 57d6 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 57d9 |   mov C, C + A
81 20 bc ff 0a                 # 57dc |   add A, [SP + 0xa], H
60 80 84                       # 57e1 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 57e4 |   mov A, [SP + 0x10]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
61 ff e0 14 ff                 # 57e8 |   mov H, [0xff14]
                               #      | _A_if_40:
f4 ff 80 f8 0a 00              # 57ed |   jle H, D, ${_E_if_40}:rel + PC
58 f8 33 00                    # 57f3 |   jmp ${_C_loop_5}:rel + PC
                               #      | _E_if_40:
ec ff 80 f8 2b 00              # 57f7 |   jne H, D, ${_E2_if_40}:rel + PC
61 ff e0 12 ff                 # 57fd |   mov H, [0xff12]
                               #      | _A_if_41:
f4 ff 60 f8 0a 00              # 5802 |   jle H, C, ${_E_if_41}:rel + PC
58 f8 1e 00                    # 5808 |   jmp ${_C_loop_5}:rel + PC
                               #      | _E_if_41:
ec ff 60 f8 16 00              # 580c |   jne H, C, ${_E2_if_41}:rel + PC
fa e0 40 f8 10 ff 14 00        # 5812 |   jgt [0xff10], B, ${_C_loop_5}:rel + PC
                               #      | _A_if_43:
e8 20 00 f8 08 00              # 581a |   jeq A, 0, ${_E_if_43}:rel + PC
5c 20                          # 5820 |   call A
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
58 f8 c6 ff                    # 5822 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5826 |   pop A
e4 40                          # 5828 |   pop B
e4 60                          # 582a |   pop C
e4 80                          # 582c |   pop D
dc                             # 582e |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 582f |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5867 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x588f
                               #      | SECTION_BEGIN_static_data:
                               # 588f |   .align dummy_size:1 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5890 |   .bss size:3840 align:16
                               #      | var__rand__state:
                               # 6790 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 6792 |   .bss size:220 align:1
                               #      | var__board__points:
                               # 686e |   .bss size:2 align:1
                               #      | var__board__level:
                               # 6870 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 6872 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 687a |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 6882 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 688a |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 688c |   .bss size:2 align:1
                               #      | var__last_btn_in:
                               # 688e |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 6890 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
