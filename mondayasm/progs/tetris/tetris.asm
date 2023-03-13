                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_54:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_54:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
62 e0 00 da 6b                 # 500a |   mov [${var__last_btn_in}], 0
                               #      | _A_call_6:
5c f8 2c 00                    # 500f |   call ${fn_init_tetris_color_palette}:rel + PC
                               #      | _Z_call_6:
                               #      | _A_call_13:
5c f8 05 01                    # 5013 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_13:
                               #      |   # game loop
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
                               #      | _A_call_32:
5c f8 2a 02                    # 5017 |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_32:
e8 ff 00 f8 1f 00              # 501b |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_call_53:
e0 e0 e0 58                    # 5021 |   push ${fn_handle_keyboard}
e0 e0 80 a9                    # 5025 |   push 0xa980
e0 1c 03                       # 5029 |   push 0x3
e0 00                          # 502c |   push 0
5c f8 a3 0a                    # 502e |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5032 |   mov SP, SP + 0x8
                               #      | _Z_call_53:
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
54 e0 e0 1c d0 5b cf 60 04     # 5089 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
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
63 e4 bc d0 5b 0a              # 5103 |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc e0 5b 08              # 5109 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc f0 5b 06              # 510f |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
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
e0 e0 d2 6a                    # 511e |   push ${var__board__board_state}
5c f8 46 00                    # 5122 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5126 |   mov SP, SP + 0x6
                               #      | _Z_call_7:
62 e0 00 b0 6b                 # 512a |   mov [${var__board__points}], 0
62 e0 00 b2 6b                 # 512f |   mov [${var__board__level}], 0
62 e0 00 cc 6b                 # 5134 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 ce 6b                 # 5139 |   mov [${var__board__lines_remaining}], 0
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
ca e0 00 c4 6b                 # 5152 |   dec [${var__board__stored}], 0
62 e0 00 c6 6b                 # 5157 |   mov [${var__board__stored} + 0002], 0
62 e0 00 c8 6b                 # 515c |   mov [${var__board__stored} + 0004], 0
62 e0 1c c2 6b 03              # 5161 |   mov [${var__board__next} + 0006], 0x3
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
63 e0 bc d0 6a 02              # 51a1 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 51a7 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_9:
e0 1c 08                       # 51a8 |   push 0x8
e0 e0 bc 6b                    # 51ab |   push ${var__board__next}
e0 e0 b4 6b                    # 51af |   push ${var__board__falling}
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
c6 e0 ff bc 6b                 # 51cf |   inc [${var__board__next}], H
62 e0 00 be 6b                 # 51d4 |   mov [${var__board__next} + 0002], 0
62 e0 00 c0 6b                 # 51d9 |   mov [${var__board__next} + 0004], 0
62 e0 1c c2 6b 03              # 51de |   mov [${var__board__next} + 0006], 0x3
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
61 ff e0 d0 6a                 # 521e |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 5223 |   shl G, H, 0x7
34 ff fe                       # 5228 |   xor H, G
a0 fe ff 1c 09                 # 522b |   shr G, H, 0x9
34 ff fe                       # 5230 |   xor H, G
a8 fe ff 1c 08                 # 5233 |   shl G, H, 0x8
34 ff fe                       # 5238 |   xor H, G
62 e0 ff d0 6a                 # 523b |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5240 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_19:
5c f8 26 00                    # 5241 |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_19:
                               #      | _A_if_15:
e8 ff 00 f8 0a 00              # 5245 |   jeq H, 0, ${_E_if_15}:rel + PC
                               #      | _A_call_26:
5c f8 87 01                    # 524b |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_26:
                               #      | _E_if_15:
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _A_call_27:
5c f8 26 06                    # 524f |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_27:
                               #      | _A_call_28:
e0 ff                          # 5253 |   push H
5c f8 24 06                    # 5255 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5259 |   mov SP, SP + 0x2
                               #      | _Z_call_28:
                               #      | _A_call_31:
5c f8 1d 06                    # 525d |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_31:
84 ff 1c ff 01                 # 5261 |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5266 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 5267 |   push A
4a e0 cc 6b                    # 5269 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_6:
d2 e0 00 cc 6b                 # 526d |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 54 00                    # 5272 |   jgt ${_E_if_6}:rel + PC
                               #      | _A_call_14:
e0 00                          # 5276 |   push 0
5c f8 54 00                    # 5278 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 527c |   mov SP, SP + 0x2
                               #      | _Z_call_14:
46 e0 b8 6b                    # 5280 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_15:
5c f8 c4 00                    # 5284 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_15:
                               #      | _A_if_14:
ec ff 1c f8 01 19 00           # 5288 |   jne H, 0x1, ${_E_if_14}:rel + PC
a9 20 e0 1c b2 6b 01           # 528f |   shl A, [${var__board__level}], 0x1
63 e0 e4 cc 6b a4 5b           # 5296 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 529d |   jmp ${_C_if_14}:rel + PC
                               #      | _E_if_14:
4a e0 b8 6b                    # 52a1 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_16:
e0 1c 01                       # 52a5 |   push 0x1
5c f8 24 00                    # 52a8 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 52ac |   mov SP, SP + 0x2
                               #      | _Z_call_16:
                               #      | _A_call_17:
5c f8 f8 fe                    # 52b0 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_17:
                               #      | _C_if_14:
                               #      | _Z_if_14:
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
60 20 e0 b4 6b                 # 52d4 |   mov A, ${var__board__falling}
c9 40 20                       # 52d9 |   dec B, [A]
e8 40 1c f8 ff 63 00           # 52dc |   jeq B, -1, ${_cleanup_fn_tg_put}:rel + PC
a9 80 3c 1c 02 01              # 52e3 |   shl D, [A + 0x2], 0x1
60 80 53                       # 52e9 |   mov D, B*8 + D
61 80 f0 6c 5b                 # 52ec |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 52f1 |   inc A, B
                               #      | _A_for_2:
60 60 00                       # 52f4 |   mov C, 0
                               #      | _BA_for_2:
fc 60 1c f8 04 48 00           # 52f7 |   jge C, 0x4, ${_C_for_2}:rel + PC
a0 40 80 7e 02                 # 52fe |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 5303 |   shr E, D, C*4
2c 40 1c 03                    # 5307 |   and B, 0x3
2c fc 1c 03                    # 530b |   and E, 0x3
81 fe e0 40 b8 6b              # 530f |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc ba 6b              # 5315 |   add B, [${var__board__falling} + 0006], E
88 fd 1c fe 0a                 # 531b |   mul F, 0xa, G
00 fd e0 d2 6a                 # 5320 |   add F, ${var__board__board_state}
00 fd 40                       # 5325 |   add F, B
                               #      | _A_if_8:
ee bc 00 f8 0a 0e 00           # 5328 |   jne [SP + 0xa], 0, ${_E_if_8}:rel + PC
66 fd 00                       # 532f |   bmov [F], 0
58 f8 07 00                    # 5332 |   jmp ${_C_if_8}:rel + PC
                               #      | _E_if_8:
66 fd 20                       # 5336 |   bmov [F], A
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _BZ_for_2:
44 60                          # 5339 |   inc C
58 f8 bc ff                    # 533b |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 533f |   pop A
e4 40                          # 5341 |   pop B
e4 60                          # 5343 |   pop C
e4 80                          # 5345 |   pop D
dc                             # 5347 |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 5348 |   push D
e0 60                          # 534a |   push C
e0 40                          # 534c |   push B
e0 20                          # 534e |   push A
c9 40 e0 b4 6b                 # 5350 |   dec B, [${var__board__falling}]
a9 80 e0 1c b6 6b 01           # 5355 |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 535c |   mov D, B*8 + D
61 80 f0 6c 5b                 # 535f |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_3:
60 60 00                       # 5364 |   mov C, 0
                               #      | _BA_for_3:
fc 60 1c f8 04 5f 00           # 5367 |   jge C, 0x4, ${_C_for_3}:rel + PC
a0 20 80 7e 02                 # 536e |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 5373 |   shr E, D, C*4
2c 20 1c 03                    # 5377 |   and A, 0x3
2c fc 1c 03                    # 537b |   and E, 0x3
81 fe e0 20 b8 6b              # 537f |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc ba 6b              # 5385 |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 538b |   mov H, 0
d0 fe 00                       # 538e |   icmp G, 0
70 f8 38 00                    # 5391 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 5395 |   icmp B, 0
70 f8 31 00                    # 5398 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2d 00           # 539c |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 26 00           # 53a3 |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 53aa |   mul F, G, 0xa
00 fd e8 d2 6a                 # 53af |   add F, ${var__board__board_state} + B
65 fd fd                       # 53b4 |   bmov F, [F]
60 ff 00                       # 53b7 |   mov H, 0
ec fd 00 f8 0f 00              # 53ba |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_3:
44 60                          # 53c0 |   inc C
58 f8 a5 ff                    # 53c2 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      |   # done checking, all good
c4 ff 00                       # 53c6 |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 53c9 |   pop A
e4 40                          # 53cb |   pop B
e4 60                          # 53cd |   pop C
e4 80                          # 53cf |   pop D
dc                             # 53d1 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_tg_display:
                               #      | _begin_fn_tg_display:
                               #      | _A_call_25:
5c f8 05 00                    # 53d2 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_25:
                               #      | _cleanup_fn_tg_display:
dc                             # 53d6 |   ret
                               #      | _end_fn_tg_display:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 53d7 |   push D
e0 60                          # 53d9 |   push C
e0 40                          # 53db |   push B
e0 20                          # 53dd |   push A
60 a0 bc fc                    # 53df |   mov SP, SP + -4
62 a0 1c 15                    # 53e3 |   mov [SP], 0x15
                               #      | _A_for_4:
60 20 00                       # 53e7 |   mov A, 0
                               #      | _BA_for_4:
fc 20 1c f8 16 bb 01           # 53ea |   jge A, 0x16, ${_C_for_4}:rel + PC
62 bc 20 02                    # 53f1 |   mov [SP + 0x2], A
60 fe 3c 02                    # 53f5 |   mov G, A + 0x2
                               #      | _A_call_20:
e0 fe                          # 53f9 |   push G
5c f8 ed 01                    # 53fb |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 53ff |   mov SP, SP + 0x2
                               #      | _Z_call_20:
                               #      | _A_for_5:
e0 20                          # 5403 |   push A
60 40 00                       # 5405 |   mov B, 0
                               #      | _BA_for_5:
fc 40 1c f8 0a 95 01           # 5408 |   jge B, 0xa, ${_C_for_5}:rel + PC
60 60 1c 0a                    # 540f |   mov C, 0xa
60 fe 00                       # 5413 |   mov G, 0
                               #      | _A_if_16:
ec 40 7c f8 ff 0c 00           # 5416 |   jne B, C + -1, ${_E_if_16}:rel + PC
60 fe e0 00 80                 # 541d |   mov G, 0x8000
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _A_if_17:
ec 40 00 f8 0a 00              # 5422 |   jne B, 0, ${_E_if_17}:rel + PC
30 fe 1c 01                    # 5428 |   or G, 0x1
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
89 80 bc 60 04                 # 542c |   mul D, [SP + 0x4], C
80 80 88 e0 d2 6a              # 5431 |   add D, D + B, ${var__board__board_state}
65 20 80                       # 5437 |   bmov A, [D]
60 60 5c 0a                    # 543a |   mov C, B + 0xa
80 60 e0 61 d0 5b              # 543e |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_18:
ec 20 00 f8 4f 00              # 5444 |   jne A, 0, ${_E_if_18}:rel + PC
                               #      | _A_for_6:
60 80 00                       # 544a |   mov D, 0
                               #      | _BA_for_6:
fc 80 e0 f8 00 0f 16 00        # 544d |   jge D, 0xf00, ${_C_for_6}:rel + PC
b2 70 1c fe 01                 # 5455 |   or [C + D], 0x1, G
                               #      | _BZ_for_6:
60 80 f0 a0 00                 # 545a |   mov D, 0xa0 + D
58 f8 ee ff                    # 545f |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_for_7:
60 80 1c 50                    # 5463 |   mov D, 0x50
                               #      | _BA_for_7:
fc 80 e0 f8 00 0f 15 00        # 5467 |   jge D, 0xf00, ${_C_for_7}:rel + PC
b2 70 00 fe                    # 546f |   or [C + D], 0, G
                               #      | _BZ_for_7:
60 80 f0 a0 00                 # 5473 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5478 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
62 60 e0 55 55                 # 547c |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 5481 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 5488 |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 548f |   jmp ${_C_if_18}:rel + PC
                               #      | _E_if_18:
98 ff 20 00                    # 5493 |   getb H, A, 0
                               #      | _A_if_19:
e8 ff 00 f8 0b 00              # 5497 |   jeq H, 0, ${_E_if_19}:rel + PC
60 ff e0 ff 7f                 # 549d |   mov H, 0x7fff
                               #      | _E_if_19:
                               #      | _C_if_19:
                               #      | _Z_if_19:
                               #      | _A_for_8:
60 80 00                       # 54a2 |   mov D, 0
                               #      | _BA_for_8:
fc 80 e0 f8 b0 04 15 00        # 54a5 |   jge D, 0x4b0, ${_C_for_8}:rel + PC
b2 70 ff fe                    # 54ad |   or [C + D], H, G
                               #      | _BZ_for_8:
60 80 f0 a0 00                 # 54b1 |   mov D, 0xa0 + D
58 f8 ef ff                    # 54b6 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _A_for_9:
60 80 1c 50                    # 54ba |   mov D, 0x50
                               #      | _BA_for_9:
fc 80 e0 f8 b0 04 15 00        # 54be |   jge D, 0x4b0, ${_C_for_9}:rel + PC
b2 70 ff fe                    # 54c6 |   or [C + D], H, G
                               #      | _BZ_for_9:
60 80 f0 a0 00                 # 54ca |   mov D, 0xa0 + D
58 f8 ef ff                    # 54cf |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
62 70 00                       # 54d3 |   mov [C + D], 0
98 ff 20 1c 01                 # 54d6 |   getb H, A, 0x1
                               #      | _A_if_20:
e8 ff 00 f8 0b 00              # 54db |   jeq H, 0, ${_E_if_20}:rel + PC
60 ff e0 ff 7f                 # 54e1 |   mov H, 0x7fff
                               #      | _E_if_20:
                               #      | _C_if_20:
                               #      | _Z_if_20:
                               #      | _A_for_10:
60 80 e0 00 05                 # 54e6 |   mov D, 0x500
                               #      | _BA_for_10:
fc 80 e0 f8 b0 09 15 00        # 54eb |   jge D, 0x9b0, ${_C_for_10}:rel + PC
b2 70 ff fe                    # 54f3 |   or [C + D], H, G
                               #      | _BZ_for_10:
60 80 f0 a0 00                 # 54f7 |   mov D, 0xa0 + D
58 f8 ef ff                    # 54fc |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
                               #      | _A_for_11:
60 80 e0 50 05                 # 5500 |   mov D, 0x550
                               #      | _BA_for_11:
fc 80 e0 f8 b0 09 15 00        # 5505 |   jge D, 0x9b0, ${_C_for_11}:rel + PC
b2 70 ff fe                    # 550d |   or [C + D], H, G
                               #      | _BZ_for_11:
60 80 f0 a0 00                 # 5511 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5516 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
62 70 00                       # 551a |   mov [C + D], 0
98 ff 20 1c 02                 # 551d |   getb H, A, 0x2
                               #      | _A_if_21:
e8 ff 00 f8 0b 00              # 5522 |   jeq H, 0, ${_E_if_21}:rel + PC
60 ff e0 ff 7f                 # 5528 |   mov H, 0x7fff
                               #      | _E_if_21:
                               #      | _C_if_21:
                               #      | _Z_if_21:
                               #      | _A_for_12:
60 80 e0 00 0a                 # 552d |   mov D, 0xa00
                               #      | _BA_for_12:
fc 80 e0 f8 b0 0e 15 00        # 5532 |   jge D, 0xeb0, ${_C_for_12}:rel + PC
b2 70 ff fe                    # 553a |   or [C + D], H, G
                               #      | _BZ_for_12:
60 80 f0 a0 00                 # 553e |   mov D, 0xa0 + D
58 f8 ef ff                    # 5543 |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _A_for_13:
60 80 e0 50 0a                 # 5547 |   mov D, 0xa50
                               #      | _BA_for_13:
fc 80 e0 f8 b0 0e 15 00        # 554c |   jge D, 0xeb0, ${_C_for_13}:rel + PC
b2 70 ff fe                    # 5554 |   or [C + D], H, G
                               #      | _BZ_for_13:
60 80 f0 a0 00                 # 5558 |   mov D, 0xa0 + D
58 f8 ef ff                    # 555d |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
62 70 00                       # 5561 |   mov [C + D], 0
                               #      | _C_if_18:
                               #      | _Z_if_18:
61 20 bc 04                    # 5564 |   mov A, [SP + 0x4]
                               #      | _A_if_22:
ed 20 bc f8 02 19 00           # 5568 |   jne A, [SP + 0x2], ${_E_if_22}:rel + PC
62 ec 1c b0 04 ff              # 556f |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 5575 |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 557b |   mov [0xeb0 + C], -1
                               #      | _E_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _A_if_23:
ec 20 00 f8 16 00              # 5581 |   jne A, 0, ${_E_if_23}:rel + PC
62 60 1c ff                    # 5587 |   mov [C], -1
62 ec 1c 00 05 ff              # 558b |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 5591 |   mov [0xa00 + C], -1
                               #      | _E_if_23:
                               #      | _C_if_23:
                               #      | _Z_if_23:
                               #      | _BZ_for_5:
44 40                          # 5597 |   inc B
58 f8 6f fe                    # 5599 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
e4 20                          # 559d |   pop A
                               #      | _Z_for_5:
                               #      | _BZ_for_4:
44 20                          # 559f |   inc A
58 f8 49 fe                    # 55a1 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _A_call_21:
e0 1c 08                       # 55a5 |   push 0x8
e0 00                          # 55a8 |   push 0
e0 e0 d0 6b                    # 55aa |   push ${var__var_1}
5c f8 ba fb                    # 55ae |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 55b2 |   mov SP, SP + 0x6
                               #      | _Z_call_21:
                               #      | _A_call_22:
e0 1c 01                       # 55b6 |   push 0x1
e0 00                          # 55b9 |   push 0
e0 00                          # 55bb |   push 0
e0 1c 04                       # 55bd |   push 0x4
e0 e0 bc 6b                    # 55c0 |   push ${var__board__next}
e0 e0 d0 6b                    # 55c4 |   push ${var__var_1}
5c f8 5a 00                    # 55c8 |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 55cc |   mov SP, SP + 0xc
                               #      | _Z_call_22:
                               #      | _A_call_24:
e0 1c 0a                       # 55d0 |   push 0xa
5c f8 c7 00                    # 55d3 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 55d7 |   mov SP, SP + 0x2
                               #      | _Z_call_24:
                               #      | _cleanup_fn_display_board:
60 a0 bc 04                    # 55db |   mov SP, SP + 0x4
e4 20                          # 55df |   pop A
e4 40                          # 55e1 |   pop B
e4 60                          # 55e3 |   pop C
e4 80                          # 55e5 |   pop D
dc                             # 55e7 |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_page_rgb:
                               #      | _begin_fn_switch_screen_page_rgb:
e0 40                          # 55e8 |   push B
e0 20                          # 55ea |   push A
60 20 e0 a1 00                 # 55ec |   mov A, 0xa1
89 40 bc e0 06 00 05           # 55f1 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c d0 5b cf 60 04     # 55f8 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
60 20 e0 a2 00                 # 5601 |   mov A, 0xa2
54 e0 e0 1c d0 60 cf 65 05     # 5606 |   mmap ${var__VIDEO_ROW_BUFFER} + 0500, ${var__VIDEO_ROW_BUFFER} + 09ff, 0x5
60 20 e0 a4 00                 # 560f |   mov A, 0xa4
54 e0 e0 1c d0 65 cf 6a 06     # 5614 |   mmap ${var__VIDEO_ROW_BUFFER} + 0a00, ${var__VIDEO_ROW_BUFFER} + 0eff, 0x6
                               #      | _cleanup_fn_switch_screen_page_rgb:
e4 20                          # 561d |   pop A
e4 40                          # 561f |   pop B
dc                             # 5621 |   ret
                               #      | _end_fn_switch_screen_page_rgb:
                               #      | 
                               #      | fn_tg_put_generic:
                               #      | _begin_fn_tg_put_generic:
e0 80                          # 5622 |   push D
e0 60                          # 5624 |   push C
e0 40                          # 5626 |   push B
e0 20                          # 5628 |   push A
61 20 bc 0c                    # 562a |   mov A, [SP + 0xc]
c9 40 20                       # 562e |   dec B, [A]
e8 40 1c f8 ff 60 00           # 5631 |   jeq B, -1, ${_cleanup_fn_tg_put_generic}:rel + PC
a9 80 3c 1c 02 01              # 5638 |   shl D, [A + 0x2], 0x1
60 80 53                       # 563e |   mov D, B*8 + D
61 80 f0 6c 5b                 # 5641 |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 5646 |   inc A, B
                               #      | _A_for_14:
60 60 00                       # 5649 |   mov C, 0
                               #      | _BA_for_14:
fc 60 1c f8 04 45 00           # 564c |   jge C, 0x4, ${_C_for_14}:rel + PC
a0 40 80 7e 02                 # 5653 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 5658 |   shr E, D, C*4
2c 40 1c 03                    # 565c |   and B, 0x3
2c fc 1c 03                    # 5660 |   and E, 0x3
81 fe bc 40 10                 # 5664 |   add G, [SP + 0x10], B
81 40 bc fc 12                 # 5669 |   add B, [SP + 0x12], E
89 fd bc fe 0e                 # 566e |   mul F, [SP + 0xe], G
01 fd bc 0a                    # 5673 |   add F, [SP + 0xa]
00 fd 40                       # 5677 |   add F, B
                               #      | _A_if_25:
ee bc 00 f8 14 0e 00           # 567a |   jne [SP + 0x14], 0, ${_E_if_25}:rel + PC
66 fd 00                       # 5681 |   bmov [F], 0
58 f8 07 00                    # 5684 |   jmp ${_C_if_25}:rel + PC
                               #      | _E_if_25:
66 fd 20                       # 5688 |   bmov [F], A
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _BZ_for_14:
44 60                          # 568b |   inc C
58 f8 bf ff                    # 568d |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
                               #      | _Z_for_14:
                               #      | _cleanup_fn_tg_put_generic:
e4 20                          # 5691 |   pop A
e4 40                          # 5693 |   pop B
e4 60                          # 5695 |   pop C
e4 80                          # 5697 |   pop D
dc                             # 5699 |   ret
                               #      | _end_fn_tg_put_generic:
                               #      | 
                               #      | fn_draw_small_board:
                               #      | _begin_fn_draw_small_board:
e0 80                          # 569a |   push D
e0 60                          # 569c |   push C
e0 40                          # 569e |   push B
e0 20                          # 56a0 |   push A
60 a0 bc fc                    # 56a2 |   mov SP, SP + -4
c6 a0 00                       # 56a6 |   inc [SP], 0
                               #      | _A_for_15:
60 20 00                       # 56a9 |   mov A, 0
                               #      | _BA_for_15:
fc 20 1c f8 02 bc 01           # 56ac |   jge A, 0x2, ${_C_for_15}:rel + PC
62 bc 20 02                    # 56b3 |   mov [SP + 0x2], A
81 fe bc 20 0e                 # 56b7 |   add G, [SP + 0xe], A
                               #      | _A_call_23:
e0 fe                          # 56bc |   push G
5c f8 2a ff                    # 56be |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 56c2 |   mov SP, SP + 0x2
                               #      | _Z_call_23:
                               #      | _A_for_16:
e0 20                          # 56c6 |   push A
60 40 00                       # 56c8 |   mov B, 0
                               #      | _BA_for_16:
fc 40 1c f8 04 95 01           # 56cb |   jge B, 0x4, ${_C_for_16}:rel + PC
60 60 1c 04                    # 56d2 |   mov C, 0x4
60 fe 00                       # 56d6 |   mov G, 0
                               #      | _A_if_26:
ec 40 7c f8 ff 0c 00           # 56d9 |   jne B, C + -1, ${_E_if_26}:rel + PC
60 fe e0 00 80                 # 56e0 |   mov G, 0x8000
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _A_if_27:
ec 40 00 f8 0a 00              # 56e5 |   jne B, 0, ${_E_if_27}:rel + PC
30 fe 1c 01                    # 56eb |   or G, 0x1
                               #      | _E_if_27:
                               #      | _C_if_27:
                               #      | _Z_if_27:
89 80 bc 60 04                 # 56ef |   mul D, [SP + 0x4], C
80 80 88 e0 d0 6b              # 56f4 |   add D, D + B, ${var__var_1}
65 20 80                       # 56fa |   bmov A, [D]
60 60 5c 16                    # 56fd |   mov C, B + 0x16
80 60 e0 61 d0 5b              # 5701 |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_28:
ec 20 00 f8 4f 00              # 5707 |   jne A, 0, ${_E_if_28}:rel + PC
                               #      | _A_for_17:
60 80 00                       # 570d |   mov D, 0
                               #      | _BA_for_17:
fc 80 e0 f8 00 0f 16 00        # 5710 |   jge D, 0xf00, ${_C_for_17}:rel + PC
b2 70 1c fe 01                 # 5718 |   or [C + D], 0x1, G
                               #      | _BZ_for_17:
60 80 f0 a0 00                 # 571d |   mov D, 0xa0 + D
58 f8 ee ff                    # 5722 |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
                               #      | _Z_for_17:
                               #      | _A_for_18:
60 80 1c 50                    # 5726 |   mov D, 0x50
                               #      | _BA_for_18:
fc 80 e0 f8 00 0f 15 00        # 572a |   jge D, 0xf00, ${_C_for_18}:rel + PC
b2 70 00 fe                    # 5732 |   or [C + D], 0, G
                               #      | _BZ_for_18:
60 80 f0 a0 00                 # 5736 |   mov D, 0xa0 + D
58 f8 ef ff                    # 573b |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
                               #      | _Z_for_18:
62 60 e0 55 55                 # 573f |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 5744 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 574b |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 5752 |   jmp ${_C_if_28}:rel + PC
                               #      | _E_if_28:
98 ff 20 00                    # 5756 |   getb H, A, 0
                               #      | _A_if_29:
e8 ff 00 f8 0b 00              # 575a |   jeq H, 0, ${_E_if_29}:rel + PC
60 ff e0 ff 7f                 # 5760 |   mov H, 0x7fff
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _A_for_19:
60 80 00                       # 5765 |   mov D, 0
                               #      | _BA_for_19:
fc 80 e0 f8 b0 04 15 00        # 5768 |   jge D, 0x4b0, ${_C_for_19}:rel + PC
b2 70 ff fe                    # 5770 |   or [C + D], H, G
                               #      | _BZ_for_19:
60 80 f0 a0 00                 # 5774 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5779 |   jmp ${_BA_for_19}:rel + PC
                               #      | _C_for_19:
                               #      | _Z_for_19:
                               #      | _A_for_20:
60 80 1c 50                    # 577d |   mov D, 0x50
                               #      | _BA_for_20:
fc 80 e0 f8 b0 04 15 00        # 5781 |   jge D, 0x4b0, ${_C_for_20}:rel + PC
b2 70 ff fe                    # 5789 |   or [C + D], H, G
                               #      | _BZ_for_20:
60 80 f0 a0 00                 # 578d |   mov D, 0xa0 + D
58 f8 ef ff                    # 5792 |   jmp ${_BA_for_20}:rel + PC
                               #      | _C_for_20:
                               #      | _Z_for_20:
62 70 00                       # 5796 |   mov [C + D], 0
98 ff 20 1c 01                 # 5799 |   getb H, A, 0x1
                               #      | _A_if_30:
e8 ff 00 f8 0b 00              # 579e |   jeq H, 0, ${_E_if_30}:rel + PC
60 ff e0 ff 7f                 # 57a4 |   mov H, 0x7fff
                               #      | _E_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
                               #      | _A_for_21:
60 80 e0 00 05                 # 57a9 |   mov D, 0x500
                               #      | _BA_for_21:
fc 80 e0 f8 b0 09 15 00        # 57ae |   jge D, 0x9b0, ${_C_for_21}:rel + PC
b2 70 ff fe                    # 57b6 |   or [C + D], H, G
                               #      | _BZ_for_21:
60 80 f0 a0 00                 # 57ba |   mov D, 0xa0 + D
58 f8 ef ff                    # 57bf |   jmp ${_BA_for_21}:rel + PC
                               #      | _C_for_21:
                               #      | _Z_for_21:
                               #      | _A_for_22:
60 80 e0 50 05                 # 57c3 |   mov D, 0x550
                               #      | _BA_for_22:
fc 80 e0 f8 b0 09 15 00        # 57c8 |   jge D, 0x9b0, ${_C_for_22}:rel + PC
b2 70 ff fe                    # 57d0 |   or [C + D], H, G
                               #      | _BZ_for_22:
60 80 f0 a0 00                 # 57d4 |   mov D, 0xa0 + D
58 f8 ef ff                    # 57d9 |   jmp ${_BA_for_22}:rel + PC
                               #      | _C_for_22:
                               #      | _Z_for_22:
62 70 00                       # 57dd |   mov [C + D], 0
98 ff 20 1c 02                 # 57e0 |   getb H, A, 0x2
                               #      | _A_if_31:
e8 ff 00 f8 0b 00              # 57e5 |   jeq H, 0, ${_E_if_31}:rel + PC
60 ff e0 ff 7f                 # 57eb |   mov H, 0x7fff
                               #      | _E_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
                               #      | _A_for_23:
60 80 e0 00 0a                 # 57f0 |   mov D, 0xa00
                               #      | _BA_for_23:
fc 80 e0 f8 b0 0e 15 00        # 57f5 |   jge D, 0xeb0, ${_C_for_23}:rel + PC
b2 70 ff fe                    # 57fd |   or [C + D], H, G
                               #      | _BZ_for_23:
60 80 f0 a0 00                 # 5801 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5806 |   jmp ${_BA_for_23}:rel + PC
                               #      | _C_for_23:
                               #      | _Z_for_23:
                               #      | _A_for_24:
60 80 e0 50 0a                 # 580a |   mov D, 0xa50
                               #      | _BA_for_24:
fc 80 e0 f8 b0 0e 15 00        # 580f |   jge D, 0xeb0, ${_C_for_24}:rel + PC
b2 70 ff fe                    # 5817 |   or [C + D], H, G
                               #      | _BZ_for_24:
60 80 f0 a0 00                 # 581b |   mov D, 0xa0 + D
58 f8 ef ff                    # 5820 |   jmp ${_BA_for_24}:rel + PC
                               #      | _C_for_24:
                               #      | _Z_for_24:
62 70 00                       # 5824 |   mov [C + D], 0
                               #      | _C_if_28:
                               #      | _Z_if_28:
61 20 bc 04                    # 5827 |   mov A, [SP + 0x4]
                               #      | _A_if_32:
ed 20 bc f8 02 19 00           # 582b |   jne A, [SP + 0x2], ${_E_if_32}:rel + PC
62 ec 1c b0 04 ff              # 5832 |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 5838 |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 583e |   mov [0xeb0 + C], -1
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _A_if_33:
ec 20 00 f8 16 00              # 5844 |   jne A, 0, ${_E_if_33}:rel + PC
62 60 1c ff                    # 584a |   mov [C], -1
62 ec 1c 00 05 ff              # 584e |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 5854 |   mov [0xa00 + C], -1
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _BZ_for_16:
44 40                          # 585a |   inc B
58 f8 6f fe                    # 585c |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
e4 20                          # 5860 |   pop A
                               #      | _Z_for_16:
                               #      | _BZ_for_15:
44 20                          # 5862 |   inc A
58 f8 48 fe                    # 5864 |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
                               #      | _cleanup_fn_draw_small_board:
60 a0 bc 04                    # 5868 |   mov SP, SP + 0x4
e4 20                          # 586c |   pop A
e4 40                          # 586e |   pop B
e4 60                          # 5870 |   pop C
e4 80                          # 5872 |   pop D
dc                             # 5874 |   ret
                               #      | _end_fn_draw_small_board:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 5875 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 5878 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 5879 |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 587a |   push D
e0 60                          # 587c |   push C
e0 40                          # 587e |   push B
e0 20                          # 5880 |   push A
60 60 00                       # 5882 |   mov C, 0
                               #      | _A_call_29:
e0 00                          # 5885 |   push 0
5c f8 45 fa                    # 5887 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 588b |   mov SP, SP + 0x2
                               #      | _Z_call_29:
                               #      | _A_for_25:
60 20 00                       # 588f |   mov A, 0
                               #      | _BA_for_25:
fc 20 1c f8 02 37 00           # 5892 |   jge A, 0x2, ${_C_for_25}:rel + PC
                               #      | _A_for_26:
60 40 00                       # 5899 |   mov B, 0
                               #      | _BA_for_26:
fc 40 1c f8 0a 27 00           # 589c |   jge B, 0xa, ${_C_for_26}:rel + PC
88 80 20 1c 0a                 # 58a3 |   mul D, A, 0xa
00 80 e8 d2 6a                 # 58a8 |   add D, ${var__board__board_state} + B
65 ff 80                       # 58ad |   bmov H, [D]
                               #      | _A_if_34:
e8 ff 00 f8 0d 00              # 58b0 |   jeq H, 0, ${_E_if_34}:rel + PC
c4 60 00                       # 58b6 |   inc C, 0
58 f8 10 00                    # 58b9 |   jmp ${_C_for_25}:rel + PC
                               #      | _E_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
                               #      | _BZ_for_26:
44 40                          # 58bd |   inc B
58 f8 dd ff                    # 58bf |   jmp ${_BA_for_26}:rel + PC
                               #      | _C_for_26:
                               #      | _Z_for_26:
                               #      | _BZ_for_25:
44 20                          # 58c3 |   inc A
58 f8 cd ff                    # 58c5 |   jmp ${_BA_for_25}:rel + PC
                               #      | _C_for_25:
                               #      | _Z_for_25:
                               #      | _A_call_30:
e0 1c 01                       # 58c9 |   push 0x1
5c f8 00 fa                    # 58cc |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 58d0 |   mov SP, SP + 0x2
                               #      | _Z_call_30:
60 ff 60                       # 58d4 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 58d7 |   pop A
e4 40                          # 58d9 |   pop B
e4 60                          # 58db |   pop C
e4 80                          # 58dd |   pop D
dc                             # 58df |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
e0 20                          # 58e0 |   push A
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 fe e0 06 ff                 # 58e2 |   mov G, [0xff06]
ac ff fe e0 00 80              # 58e7 |   and H, G, 0x8000
e8 ff 00 f8 7e 00              # 58ed |   jeq H, 0, ${_C_loop_2}:rel + PC
a9 ff e0 1c dc 6b 08           # 58f3 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 58fa |   and G, 0xff
30 ff fe                       # 58ff |   or H, G
62 e0 ff dc 6b                 # 5902 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5907 |   shr G, H, 0x8
2c ff e0 ff 00                 # 590c |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 5911 |   jeq G, 0xf0, ${_BA_loop_2}:rel + PC
60 fe 00                       # 5919 |   mov G, 0
                               #      | _A_if_38:
ec ff 1c f8 75 0f 00           # 591c |   jne H, 0x75, ${_E_if_38}:rel + PC
60 fe 1c 03                    # 5923 |   mov G, 0x3
58 f8 2c 00                    # 5927 |   jmp ${_C_if_38}:rel + PC
                               #      | _E_if_38:
ec ff 1c f8 74 0f 00           # 592b |   jne H, 0x74, ${_E2_if_38}:rel + PC
60 fe 1c 02                    # 5932 |   mov G, 0x2
58 f8 1d 00                    # 5936 |   jmp ${_C_if_38}:rel + PC
                               #      | _E2_if_38:
ec ff 1c f8 6b 0e 00           # 593a |   jne H, 0x6b, ${_E3_if_38}:rel + PC
c4 fe 00                       # 5941 |   inc G, 0
58 f8 0f 00                    # 5944 |   jmp ${_C_if_38}:rel + PC
                               #      | _E3_if_38:
ec ff 1c f8 72 0b 00           # 5948 |   jne H, 0x72, ${_E4_if_38}:rel + PC
60 fe 1c 04                    # 594f |   mov G, 0x4
                               #      | _E4_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
                               #      | _A_if_39:
e8 fe 00 f8 14 00              # 5953 |   jeq G, 0, ${_E_if_39}:rel + PC
                               #      | _A_call_49:
e0 fe                          # 5959 |   push G
5c f8 77 00                    # 595b |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 595f |   mov SP, SP + 0x2
                               #      | _Z_call_49:
                               #      | _A_call_50:
5c f8 6f fa                    # 5963 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_50:
                               #      | _E_if_39:
                               #      | _C_if_39:
                               #      | _Z_if_39:
                               #      | _BZ_loop_2:
58 f8 7b ff                    # 5967 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
61 ff e0 0e ff                 # 596b |   mov H, [0xff0e]
                               #      | _A_if_46:
e9 ff e0 f8 da 6b 5f 00        # 5970 |   jeq H, [${var__last_btn_in}], ${_E_if_46}:rel + PC
62 e0 ff da 6b                 # 5978 |   mov [${var__last_btn_in}], H
60 fe 00                       # 597d |   mov G, 0
98 20 ff 1c 0c                 # 5980 |   getb A, H, 0xc
                               #      | _A_if_47:
e8 20 00 f8 0a 00              # 5985 |   jeq A, 0, ${_E_if_47}:rel + PC
60 fe 1c 03                    # 598b |   mov G, 0x3
                               #      | _E_if_47:
                               #      | _C_if_47:
                               #      | _Z_if_47:
98 20 ff 1c 0b                 # 598f |   getb A, H, 0xb
                               #      | _A_if_48:
e8 20 00 f8 0a 00              # 5994 |   jeq A, 0, ${_E_if_48}:rel + PC
60 fe 1c 02                    # 599a |   mov G, 0x2
                               #      | _E_if_48:
                               #      | _C_if_48:
                               #      | _Z_if_48:
98 20 ff 1c 0a                 # 599e |   getb A, H, 0xa
                               #      | _A_if_49:
e8 20 00 f8 09 00              # 59a3 |   jeq A, 0, ${_E_if_49}:rel + PC
c4 fe 00                       # 59a9 |   inc G, 0
                               #      | _E_if_49:
                               #      | _C_if_49:
                               #      | _Z_if_49:
98 20 ff 1c 09                 # 59ac |   getb A, H, 0x9
                               #      | _A_if_50:
e8 20 00 f8 0a 00              # 59b1 |   jeq A, 0, ${_E_if_50}:rel + PC
60 fe 1c 04                    # 59b7 |   mov G, 0x4
                               #      | _E_if_50:
                               #      | _C_if_50:
                               #      | _Z_if_50:
                               #      | _A_if_51:
e8 fe 00 f8 14 00              # 59bb |   jeq G, 0, ${_E_if_51}:rel + PC
                               #      | _A_call_51:
e0 fe                          # 59c1 |   push G
5c f8 0f 00                    # 59c3 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 59c7 |   mov SP, SP + 0x2
                               #      | _Z_call_51:
                               #      | _A_call_52:
5c f8 07 fa                    # 59cb |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_52:
                               #      | _E_if_51:
                               #      | _C_if_51:
                               #      | _Z_if_51:
                               #      | _E_if_46:
                               #      | _C_if_46:
                               #      | _Z_if_46:
                               #      | _cleanup_fn_handle_keyboard:
e4 20                          # 59cf |   pop A
dc                             # 59d1 |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 59d2 |   push A
61 20 bc 04                    # 59d4 |   mov A, [SP + 0x4]
                               #      | _A_if_40:
ec 20 1c f8 01 16 00           # 59d8 |   jne A, 0x1, ${_E_if_40}:rel + PC
                               #      | _A_call_36:
e0 1c ff                       # 59df |   push -1
5c f8 3f 00                    # 59e2 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 59e6 |   mov SP, SP + 0x2
                               #      | _Z_call_36:
58 f8 34 00                    # 59ea |   jmp ${_C_if_40}:rel + PC
                               #      | _E_if_40:
ec 20 1c f8 02 16 00           # 59ee |   jne A, 0x2, ${_E2_if_40}:rel + PC
                               #      | _A_call_37:
e0 1c 01                       # 59f5 |   push 0x1
5c f8 29 00                    # 59f8 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 59fc |   mov SP, SP + 0x2
                               #      | _Z_call_37:
58 f8 1e 00                    # 5a00 |   jmp ${_C_if_40}:rel + PC
                               #      | _E2_if_40:
ec 20 1c f8 04 0f 00           # 5a04 |   jne A, 0x4, ${_E3_if_40}:rel + PC
                               #      | _A_call_42:
5c f8 42 00                    # 5a0b |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_42:
58 f8 0f 00                    # 5a0f |   jmp ${_C_if_40}:rel + PC
                               #      | _E3_if_40:
ec 20 1c f8 03 0b 00           # 5a13 |   jne A, 0x3, ${_E4_if_40}:rel + PC
                               #      | _A_call_48:
5c f8 63 00                    # 5a1a |   call ${fn_tg_rotate}:rel + PC
                               #      | _Z_call_48:
                               #      | _E4_if_40:
                               #      | _C_if_40:
                               #      | _Z_if_40:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 5a1e |   pop A
dc                             # 5a20 |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_33:
e0 00                          # 5a21 |   push 0
5c f8 a9 f8                    # 5a23 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5a27 |   mov SP, SP + 0x2
                               #      | _Z_call_33:
03 e0 bc ba 6b 02              # 5a2b |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_34:
5c f8 17 f9                    # 5a31 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_34:
                               #      | _A_if_41:
ec ff 00 f8 0c 00              # 5a35 |   jne H, 0, ${_E_if_41}:rel + PC
07 e0 bc ba 6b 02              # 5a3b |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
                               #      | _A_call_35:
e0 1c 01                       # 5a41 |   push 0x1
5c f8 88 f8                    # 5a44 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5a48 |   mov SP, SP + 0x2
                               #      | _Z_call_35:
                               #      | _cleanup_fn_tg_move:
dc                             # 5a4c |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_38:
e0 00                          # 5a4d |   push 0
5c f8 7d f8                    # 5a4f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5a53 |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
46 e0 b8 6b                    # 5a57 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_39:
5c f8 ed f8                    # 5a5b |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_39:
e8 ff 00 f8 0a 00              # 5a5f |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _BZ_loop_3:
58 f8 f2 ff                    # 5a65 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
4a e0 b8 6b                    # 5a69 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_40:
e0 1c 01                       # 5a6d |   push 0x1
5c f8 5c f8                    # 5a70 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5a74 |   mov SP, SP + 0x2
                               #      | _Z_call_40:
                               #      | _A_call_41:
5c f8 30 f7                    # 5a78 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_41:
                               #      | _cleanup_fn_tg_down:
dc                             # 5a7c |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_43:
e0 00                          # 5a7d |   push 0
5c f8 4d f8                    # 5a7f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5a83 |   mov SP, SP + 0x2
                               #      | _Z_call_43:
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
c5 ff e0 b6 6b                 # 5a87 |   inc H, [${var__board__falling} + 0002]
2c ff 1c 03                    # 5a8c |   and H, 0x3
62 e0 ff b6 6b                 # 5a90 |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_44:
5c f8 b3 f8                    # 5a95 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_44:
ec ff 00 f8 2c 00              # 5a99 |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 ba 6b                    # 5a9f |   dec [${var__board__falling} + 0006]
                               #      | _A_call_45:
5c f8 a5 f8                    # 5aa3 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_45:
ec ff 00 f8 1e 00              # 5aa7 |   jne H, 0, ${_C_loop_4}:rel + PC
02 e0 1c ba 6b 02              # 5aad |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_46:
5c f8 95 f8                    # 5ab3 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_46:
ec ff 00 f8 0e 00              # 5ab7 |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 ba 6b                    # 5abd |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_4:
58 f8 c6 ff                    # 5ac1 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _A_call_47:
e0 1c 01                       # 5ac5 |   push 0x1
5c f8 04 f8                    # 5ac8 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5acc |   mov SP, SP + 0x2
                               #      | _Z_call_47:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 5ad0 |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5ad1 |   push D
e0 60                          # 5ad3 |   push C
e0 40                          # 5ad5 |   push B
e0 20                          # 5ad7 |   push A
61 40 e0 10 ff                 # 5ad9 |   mov B, [0xff10]
61 60 e0 12 ff                 # 5ade |   mov C, [0xff12]
61 80 e0 14 ff                 # 5ae3 |   mov D, [0xff14]
61 20 bc 0e                    # 5ae8 |   mov A, [SP + 0xe]
60 ff 00                       # 5aec |   mov H, 0
                               #      | _A_if_52:
fc 28 20 f8 09 00              # 5aef |   jge A + B, A, ${_E_if_52}:rel + PC
c4 ff 00                       # 5af5 |   inc H, 0
                               #      | _E_if_52:
                               #      | _C_if_52:
                               #      | _Z_if_52:
60 40 44                       # 5af8 |   mov B, B + A
81 20 bc ff 0c                 # 5afb |   add A, [SP + 0xc], H
60 ff 00                       # 5b00 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 5b03 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 5b09 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 5b0f |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 5b13 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 5b16 |   mov C, C + A
81 20 bc ff 0a                 # 5b19 |   add A, [SP + 0xa], H
60 80 84                       # 5b1e |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 5b21 |   mov A, [SP + 0x10]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
61 ff e0 14 ff                 # 5b25 |   mov H, [0xff14]
                               #      | _A_if_55:
f4 ff 80 f8 0a 00              # 5b2a |   jle H, D, ${_E_if_55}:rel + PC
58 f8 33 00                    # 5b30 |   jmp ${_C_loop_5}:rel + PC
                               #      | _E_if_55:
ec ff 80 f8 2b 00              # 5b34 |   jne H, D, ${_E2_if_55}:rel + PC
61 ff e0 12 ff                 # 5b3a |   mov H, [0xff12]
                               #      | _A_if_56:
f4 ff 60 f8 0a 00              # 5b3f |   jle H, C, ${_E_if_56}:rel + PC
58 f8 1e 00                    # 5b45 |   jmp ${_C_loop_5}:rel + PC
                               #      | _E_if_56:
ec ff 60 f8 16 00              # 5b49 |   jne H, C, ${_E2_if_56}:rel + PC
fa e0 40 f8 10 ff 14 00        # 5b4f |   jgt [0xff10], B, ${_C_loop_5}:rel + PC
                               #      | _A_if_58:
e8 20 00 f8 08 00              # 5b57 |   jeq A, 0, ${_E_if_58}:rel + PC
5c 20                          # 5b5d |   call A
                               #      | _E_if_58:
                               #      | _C_if_58:
                               #      | _Z_if_58:
                               #      | _E2_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
                               #      | _E2_if_55:
                               #      | _C_if_55:
                               #      | _Z_if_55:
                               #      | _BZ_loop_5:
58 f8 c6 ff                    # 5b5f |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5b63 |   pop A
e4 40                          # 5b65 |   pop B
e4 60                          # 5b67 |   pop C
e4 80                          # 5b69 |   pop D
dc                             # 5b6b |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 5b6c |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5ba4 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5bcc
                               #      | SECTION_BEGIN_static_data:
                               # 5bcc |   .align dummy_size:4 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5bd0 |   .bss size:3840 align:16
                               #      | var__rand__state:
                               # 6ad0 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 6ad2 |   .bss size:222 align:1
                               #      | var__board__points:
                               # 6bb0 |   .bss size:2 align:1
                               #      | var__board__level:
                               # 6bb2 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 6bb4 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 6bbc |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 6bc4 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 6bcc |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 6bce |   .bss size:2 align:1
                               #      | var__var_1:
                               # 6bd0 |   .bss size:10 align:1
                               #      | var__last_btn_in:
                               # 6bda |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 6bdc |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
