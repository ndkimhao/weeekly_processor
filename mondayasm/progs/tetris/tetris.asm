                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_63:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_63:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
62 e0 00 ba 6c                 # 500a |   mov [${var__last_btn_in}], 0
                               #      | _A_call_6:
5c f8 2c 00                    # 500f |   call ${fn_init_tetris_color_palette}:rel + PC
                               #      | _Z_call_6:
                               #      | _A_call_13:
5c f8 05 01                    # 5013 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_13:
                               #      |   # game loop
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
                               #      | _A_call_35:
5c f8 2a 02                    # 5017 |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_35:
e8 ff 00 f8 1f 00              # 501b |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_call_62:
e0 e0 1f 59                    # 5021 |   push ${fn_handle_keyboard}
e0 e0 80 a9                    # 5025 |   push 0xa980
e0 1c 03                       # 5029 |   push 0x3
e0 00                          # 502c |   push 0
5c f8 86 0b                    # 502e |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5032 |   mov SP, SP + 0x8
                               #      | _Z_call_62:
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
54 e0 e0 1c b0 5c af 61 04     # 5089 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
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
63 e4 bc b0 5c 0a              # 5103 |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc c0 5c 08              # 5109 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc d0 5c 06              # 510f |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
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
e0 e0 b2 6b                    # 511e |   push ${var__board__board_state}
5c f8 46 00                    # 5122 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5126 |   mov SP, SP + 0x6
                               #      | _Z_call_7:
62 e0 00 90 6c                 # 512a |   mov [${var__board__points}], 0
62 e0 00 92 6c                 # 512f |   mov [${var__board__level}], 0
62 e0 00 ac 6c                 # 5134 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 ae 6c                 # 5139 |   mov [${var__board__lines_remaining}], 0
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
ca e0 00 a4 6c                 # 5152 |   dec [${var__board__stored}], 0
62 e0 00 a6 6c                 # 5157 |   mov [${var__board__stored} + 0002], 0
62 e0 00 a8 6c                 # 515c |   mov [${var__board__stored} + 0004], 0
62 e0 1c a2 6c 03              # 5161 |   mov [${var__board__next} + 0006], 0x3
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
63 e0 bc b0 6b 02              # 51a1 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 51a7 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_9:
e0 1c 08                       # 51a8 |   push 0x8
e0 e0 9c 6c                    # 51ab |   push ${var__board__next}
e0 e0 94 6c                    # 51af |   push ${var__board__falling}
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
c6 e0 ff 9c 6c                 # 51cf |   inc [${var__board__next}], H
62 e0 00 9e 6c                 # 51d4 |   mov [${var__board__next} + 0002], 0
62 e0 00 a0 6c                 # 51d9 |   mov [${var__board__next} + 0004], 0
62 e0 1c a2 6c 03              # 51de |   mov [${var__board__next} + 0006], 0x3
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
61 ff e0 b0 6b                 # 521e |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 5223 |   shl G, H, 0x7
34 ff fe                       # 5228 |   xor H, G
a0 fe ff 1c 09                 # 522b |   shr G, H, 0x9
34 ff fe                       # 5230 |   xor H, G
a8 fe ff 1c 08                 # 5233 |   shl G, H, 0x8
34 ff fe                       # 5238 |   xor H, G
62 e0 ff b0 6b                 # 523b |   mov [${var__rand__state}], H
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
                               #      | _A_call_29:
5c f8 87 01                    # 524b |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_29:
                               #      | _E_if_15:
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _A_call_30:
5c f8 65 06                    # 524f |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_30:
                               #      | _A_call_31:
e0 ff                          # 5253 |   push H
5c f8 63 06                    # 5255 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5259 |   mov SP, SP + 0x2
                               #      | _Z_call_31:
                               #      | _A_call_34:
5c f8 5c 06                    # 525d |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_34:
84 ff 1c ff 01                 # 5261 |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5266 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 5267 |   push A
4a e0 ac 6c                    # 5269 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_6:
d2 e0 00 ac 6c                 # 526d |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 54 00                    # 5272 |   jgt ${_E_if_6}:rel + PC
                               #      | _A_call_14:
e0 00                          # 5276 |   push 0
5c f8 54 00                    # 5278 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 527c |   mov SP, SP + 0x2
                               #      | _Z_call_14:
46 e0 98 6c                    # 5280 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_15:
5c f8 c4 00                    # 5284 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_15:
                               #      | _A_if_14:
ec ff 1c f8 01 19 00           # 5288 |   jne H, 0x1, ${_E_if_14}:rel + PC
a9 20 e0 1c 92 6c 01           # 528f |   shl A, [${var__board__level}], 0x1
63 e0 e4 ac 6c 87 5c           # 5296 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 529d |   jmp ${_C_if_14}:rel + PC
                               #      | _E_if_14:
4a e0 98 6c                    # 52a1 |   dec [${var__board__falling} + 0004]
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
60 20 e0 94 6c                 # 52d4 |   mov A, ${var__board__falling}
c9 40 20                       # 52d9 |   dec B, [A]
e8 40 1c f8 ff 63 00           # 52dc |   jeq B, -1, ${_cleanup_fn_tg_put}:rel + PC
a9 80 3c 1c 02 01              # 52e3 |   shl D, [A + 0x2], 0x1
60 80 53                       # 52e9 |   mov D, B*8 + D
61 80 f0 4f 5c                 # 52ec |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 52f1 |   inc A, B
                               #      | _A_for_2:
60 60 00                       # 52f4 |   mov C, 0
                               #      | _BA_for_2:
fc 60 1c f8 04 48 00           # 52f7 |   jge C, 0x4, ${_C_for_2}:rel + PC
a0 40 80 7e 02                 # 52fe |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 5303 |   shr E, D, C*4
2c 40 1c 03                    # 5307 |   and B, 0x3
2c fc 1c 03                    # 530b |   and E, 0x3
81 fe e0 40 98 6c              # 530f |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc 9a 6c              # 5315 |   add B, [${var__board__falling} + 0006], E
88 fd 1c fe 0a                 # 531b |   mul F, 0xa, G
00 fd e0 b2 6b                 # 5320 |   add F, ${var__board__board_state}
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
c9 40 e0 94 6c                 # 5350 |   dec B, [${var__board__falling}]
a9 80 e0 1c 96 6c 01           # 5355 |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 535c |   mov D, B*8 + D
61 80 f0 4f 5c                 # 535f |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_3:
60 60 00                       # 5364 |   mov C, 0
                               #      | _BA_for_3:
fc 60 1c f8 04 5f 00           # 5367 |   jge C, 0x4, ${_C_for_3}:rel + PC
a0 20 80 7e 02                 # 536e |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 5373 |   shr E, D, C*4
2c 20 1c 03                    # 5377 |   and A, 0x3
2c fc 1c 03                    # 537b |   and E, 0x3
81 fe e0 20 98 6c              # 537f |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc 9a 6c              # 5385 |   add B, [${var__board__falling} + 0006], E
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
00 fd e8 b2 6b                 # 53af |   add F, ${var__board__board_state} + B
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
                               #      | _A_call_28:
5c f8 05 00                    # 53d2 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_28:
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
5c f8 2c 02                    # 53fb |   call ${fn_switch_screen_page_rgb}:rel + PC
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
80 80 88 e0 b2 6b              # 5431 |   add D, D + B, ${var__board__board_state}
65 20 80                       # 5437 |   bmov A, [D]
60 60 5c 0a                    # 543a |   mov C, B + 0xa
80 60 e0 61 b0 5c              # 543e |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
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
e0 e0 b0 6c                    # 55aa |   push ${var__var_1}
5c f8 ba fb                    # 55ae |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 55b2 |   mov SP, SP + 0x6
                               #      | _Z_call_21:
                               #      | _A_call_22:
e0 1c 01                       # 55b6 |   push 0x1
e0 00                          # 55b9 |   push 0
e0 00                          # 55bb |   push 0
e0 1c 04                       # 55bd |   push 0x4
e0 e0 9c 6c                    # 55c0 |   push ${var__board__next}
e0 e0 b0 6c                    # 55c4 |   push ${var__var_1}
5c f8 99 00                    # 55c8 |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 55cc |   mov SP, SP + 0xc
                               #      | _Z_call_22:
                               #      | _A_call_24:
e0 1c 0a                       # 55d0 |   push 0xa
5c f8 06 01                    # 55d3 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 55d7 |   mov SP, SP + 0x2
                               #      | _Z_call_24:
                               #      | _A_call_25:
e0 1c 08                       # 55db |   push 0x8
e0 00                          # 55de |   push 0
e0 e0 b0 6c                    # 55e0 |   push ${var__var_1}
5c f8 84 fb                    # 55e4 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 55e8 |   mov SP, SP + 0x6
                               #      | _Z_call_25:
                               #      | _A_if_34:
ea e0 1c f8 a4 6c ff 23 00     # 55ec |   jeq [${var__board__stored}], -1, ${_E_if_34}:rel + PC
                               #      | _A_call_26:
e0 1c 01                       # 55f5 |   push 0x1
e0 00                          # 55f8 |   push 0
e0 00                          # 55fa |   push 0
e0 1c 04                       # 55fc |   push 0x4
e0 e0 a4 6c                    # 55ff |   push ${var__board__stored}
e0 e0 b0 6c                    # 5603 |   push ${var__var_1}
5c f8 5a 00                    # 5607 |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 560b |   mov SP, SP + 0xc
                               #      | _Z_call_26:
                               #      | _E_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
                               #      | _A_call_27:
e0 1c 0e                       # 560f |   push 0xe
5c f8 c7 00                    # 5612 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 5616 |   mov SP, SP + 0x2
                               #      | _Z_call_27:
                               #      | _cleanup_fn_display_board:
60 a0 bc 04                    # 561a |   mov SP, SP + 0x4
e4 20                          # 561e |   pop A
e4 40                          # 5620 |   pop B
e4 60                          # 5622 |   pop C
e4 80                          # 5624 |   pop D
dc                             # 5626 |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_page_rgb:
                               #      | _begin_fn_switch_screen_page_rgb:
e0 40                          # 5627 |   push B
e0 20                          # 5629 |   push A
60 20 e0 a1 00                 # 562b |   mov A, 0xa1
89 40 bc e0 06 00 05           # 5630 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c b0 5c af 61 04     # 5637 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
60 20 e0 a2 00                 # 5640 |   mov A, 0xa2
54 e0 e0 1c b0 61 af 66 05     # 5645 |   mmap ${var__VIDEO_ROW_BUFFER} + 0500, ${var__VIDEO_ROW_BUFFER} + 09ff, 0x5
60 20 e0 a4 00                 # 564e |   mov A, 0xa4
54 e0 e0 1c b0 66 af 6b 06     # 5653 |   mmap ${var__VIDEO_ROW_BUFFER} + 0a00, ${var__VIDEO_ROW_BUFFER} + 0eff, 0x6
                               #      | _cleanup_fn_switch_screen_page_rgb:
e4 20                          # 565c |   pop A
e4 40                          # 565e |   pop B
dc                             # 5660 |   ret
                               #      | _end_fn_switch_screen_page_rgb:
                               #      | 
                               #      | fn_tg_put_generic:
                               #      | _begin_fn_tg_put_generic:
e0 80                          # 5661 |   push D
e0 60                          # 5663 |   push C
e0 40                          # 5665 |   push B
e0 20                          # 5667 |   push A
61 20 bc 0c                    # 5669 |   mov A, [SP + 0xc]
c9 40 20                       # 566d |   dec B, [A]
e8 40 1c f8 ff 60 00           # 5670 |   jeq B, -1, ${_cleanup_fn_tg_put_generic}:rel + PC
a9 80 3c 1c 02 01              # 5677 |   shl D, [A + 0x2], 0x1
60 80 53                       # 567d |   mov D, B*8 + D
61 80 f0 4f 5c                 # 5680 |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 5685 |   inc A, B
                               #      | _A_for_14:
60 60 00                       # 5688 |   mov C, 0
                               #      | _BA_for_14:
fc 60 1c f8 04 45 00           # 568b |   jge C, 0x4, ${_C_for_14}:rel + PC
a0 40 80 7e 02                 # 5692 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 5697 |   shr E, D, C*4
2c 40 1c 03                    # 569b |   and B, 0x3
2c fc 1c 03                    # 569f |   and E, 0x3
81 fe bc 40 10                 # 56a3 |   add G, [SP + 0x10], B
81 40 bc fc 12                 # 56a8 |   add B, [SP + 0x12], E
89 fd bc fe 0e                 # 56ad |   mul F, [SP + 0xe], G
01 fd bc 0a                    # 56b2 |   add F, [SP + 0xa]
00 fd 40                       # 56b6 |   add F, B
                               #      | _A_if_25:
ee bc 00 f8 14 0e 00           # 56b9 |   jne [SP + 0x14], 0, ${_E_if_25}:rel + PC
66 fd 00                       # 56c0 |   bmov [F], 0
58 f8 07 00                    # 56c3 |   jmp ${_C_if_25}:rel + PC
                               #      | _E_if_25:
66 fd 20                       # 56c7 |   bmov [F], A
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _BZ_for_14:
44 60                          # 56ca |   inc C
58 f8 bf ff                    # 56cc |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
                               #      | _Z_for_14:
                               #      | _cleanup_fn_tg_put_generic:
e4 20                          # 56d0 |   pop A
e4 40                          # 56d2 |   pop B
e4 60                          # 56d4 |   pop C
e4 80                          # 56d6 |   pop D
dc                             # 56d8 |   ret
                               #      | _end_fn_tg_put_generic:
                               #      | 
                               #      | fn_draw_small_board:
                               #      | _begin_fn_draw_small_board:
e0 80                          # 56d9 |   push D
e0 60                          # 56db |   push C
e0 40                          # 56dd |   push B
e0 20                          # 56df |   push A
60 a0 bc fc                    # 56e1 |   mov SP, SP + -4
c6 a0 00                       # 56e5 |   inc [SP], 0
                               #      | _A_for_15:
60 20 00                       # 56e8 |   mov A, 0
                               #      | _BA_for_15:
fc 20 1c f8 02 bc 01           # 56eb |   jge A, 0x2, ${_C_for_15}:rel + PC
62 bc 20 02                    # 56f2 |   mov [SP + 0x2], A
81 fe bc 20 0e                 # 56f6 |   add G, [SP + 0xe], A
                               #      | _A_call_23:
e0 fe                          # 56fb |   push G
5c f8 2a ff                    # 56fd |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 5701 |   mov SP, SP + 0x2
                               #      | _Z_call_23:
                               #      | _A_for_16:
e0 20                          # 5705 |   push A
60 40 00                       # 5707 |   mov B, 0
                               #      | _BA_for_16:
fc 40 1c f8 04 95 01           # 570a |   jge B, 0x4, ${_C_for_16}:rel + PC
60 60 1c 04                    # 5711 |   mov C, 0x4
60 fe 00                       # 5715 |   mov G, 0
                               #      | _A_if_26:
ec 40 7c f8 ff 0c 00           # 5718 |   jne B, C + -1, ${_E_if_26}:rel + PC
60 fe e0 00 80                 # 571f |   mov G, 0x8000
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _A_if_27:
ec 40 00 f8 0a 00              # 5724 |   jne B, 0, ${_E_if_27}:rel + PC
30 fe 1c 01                    # 572a |   or G, 0x1
                               #      | _E_if_27:
                               #      | _C_if_27:
                               #      | _Z_if_27:
89 80 bc 60 04                 # 572e |   mul D, [SP + 0x4], C
80 80 88 e0 b0 6c              # 5733 |   add D, D + B, ${var__var_1}
65 20 80                       # 5739 |   bmov A, [D]
60 60 5c 16                    # 573c |   mov C, B + 0x16
80 60 e0 61 b0 5c              # 5740 |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_28:
ec 20 00 f8 4f 00              # 5746 |   jne A, 0, ${_E_if_28}:rel + PC
                               #      | _A_for_17:
60 80 00                       # 574c |   mov D, 0
                               #      | _BA_for_17:
fc 80 e0 f8 00 0f 16 00        # 574f |   jge D, 0xf00, ${_C_for_17}:rel + PC
b2 70 1c fe 01                 # 5757 |   or [C + D], 0x1, G
                               #      | _BZ_for_17:
60 80 f0 a0 00                 # 575c |   mov D, 0xa0 + D
58 f8 ee ff                    # 5761 |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
                               #      | _Z_for_17:
                               #      | _A_for_18:
60 80 1c 50                    # 5765 |   mov D, 0x50
                               #      | _BA_for_18:
fc 80 e0 f8 00 0f 15 00        # 5769 |   jge D, 0xf00, ${_C_for_18}:rel + PC
b2 70 00 fe                    # 5771 |   or [C + D], 0, G
                               #      | _BZ_for_18:
60 80 f0 a0 00                 # 5775 |   mov D, 0xa0 + D
58 f8 ef ff                    # 577a |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
                               #      | _Z_for_18:
62 60 e0 55 55                 # 577e |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 5783 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 578a |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 5791 |   jmp ${_C_if_28}:rel + PC
                               #      | _E_if_28:
98 ff 20 00                    # 5795 |   getb H, A, 0
                               #      | _A_if_29:
e8 ff 00 f8 0b 00              # 5799 |   jeq H, 0, ${_E_if_29}:rel + PC
60 ff e0 ff 7f                 # 579f |   mov H, 0x7fff
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _A_for_19:
60 80 00                       # 57a4 |   mov D, 0
                               #      | _BA_for_19:
fc 80 e0 f8 b0 04 15 00        # 57a7 |   jge D, 0x4b0, ${_C_for_19}:rel + PC
b2 70 ff fe                    # 57af |   or [C + D], H, G
                               #      | _BZ_for_19:
60 80 f0 a0 00                 # 57b3 |   mov D, 0xa0 + D
58 f8 ef ff                    # 57b8 |   jmp ${_BA_for_19}:rel + PC
                               #      | _C_for_19:
                               #      | _Z_for_19:
                               #      | _A_for_20:
60 80 1c 50                    # 57bc |   mov D, 0x50
                               #      | _BA_for_20:
fc 80 e0 f8 b0 04 15 00        # 57c0 |   jge D, 0x4b0, ${_C_for_20}:rel + PC
b2 70 ff fe                    # 57c8 |   or [C + D], H, G
                               #      | _BZ_for_20:
60 80 f0 a0 00                 # 57cc |   mov D, 0xa0 + D
58 f8 ef ff                    # 57d1 |   jmp ${_BA_for_20}:rel + PC
                               #      | _C_for_20:
                               #      | _Z_for_20:
62 70 00                       # 57d5 |   mov [C + D], 0
98 ff 20 1c 01                 # 57d8 |   getb H, A, 0x1
                               #      | _A_if_30:
e8 ff 00 f8 0b 00              # 57dd |   jeq H, 0, ${_E_if_30}:rel + PC
60 ff e0 ff 7f                 # 57e3 |   mov H, 0x7fff
                               #      | _E_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
                               #      | _A_for_21:
60 80 e0 00 05                 # 57e8 |   mov D, 0x500
                               #      | _BA_for_21:
fc 80 e0 f8 b0 09 15 00        # 57ed |   jge D, 0x9b0, ${_C_for_21}:rel + PC
b2 70 ff fe                    # 57f5 |   or [C + D], H, G
                               #      | _BZ_for_21:
60 80 f0 a0 00                 # 57f9 |   mov D, 0xa0 + D
58 f8 ef ff                    # 57fe |   jmp ${_BA_for_21}:rel + PC
                               #      | _C_for_21:
                               #      | _Z_for_21:
                               #      | _A_for_22:
60 80 e0 50 05                 # 5802 |   mov D, 0x550
                               #      | _BA_for_22:
fc 80 e0 f8 b0 09 15 00        # 5807 |   jge D, 0x9b0, ${_C_for_22}:rel + PC
b2 70 ff fe                    # 580f |   or [C + D], H, G
                               #      | _BZ_for_22:
60 80 f0 a0 00                 # 5813 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5818 |   jmp ${_BA_for_22}:rel + PC
                               #      | _C_for_22:
                               #      | _Z_for_22:
62 70 00                       # 581c |   mov [C + D], 0
98 ff 20 1c 02                 # 581f |   getb H, A, 0x2
                               #      | _A_if_31:
e8 ff 00 f8 0b 00              # 5824 |   jeq H, 0, ${_E_if_31}:rel + PC
60 ff e0 ff 7f                 # 582a |   mov H, 0x7fff
                               #      | _E_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
                               #      | _A_for_23:
60 80 e0 00 0a                 # 582f |   mov D, 0xa00
                               #      | _BA_for_23:
fc 80 e0 f8 b0 0e 15 00        # 5834 |   jge D, 0xeb0, ${_C_for_23}:rel + PC
b2 70 ff fe                    # 583c |   or [C + D], H, G
                               #      | _BZ_for_23:
60 80 f0 a0 00                 # 5840 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5845 |   jmp ${_BA_for_23}:rel + PC
                               #      | _C_for_23:
                               #      | _Z_for_23:
                               #      | _A_for_24:
60 80 e0 50 0a                 # 5849 |   mov D, 0xa50
                               #      | _BA_for_24:
fc 80 e0 f8 b0 0e 15 00        # 584e |   jge D, 0xeb0, ${_C_for_24}:rel + PC
b2 70 ff fe                    # 5856 |   or [C + D], H, G
                               #      | _BZ_for_24:
60 80 f0 a0 00                 # 585a |   mov D, 0xa0 + D
58 f8 ef ff                    # 585f |   jmp ${_BA_for_24}:rel + PC
                               #      | _C_for_24:
                               #      | _Z_for_24:
62 70 00                       # 5863 |   mov [C + D], 0
                               #      | _C_if_28:
                               #      | _Z_if_28:
61 20 bc 04                    # 5866 |   mov A, [SP + 0x4]
                               #      | _A_if_32:
ed 20 bc f8 02 19 00           # 586a |   jne A, [SP + 0x2], ${_E_if_32}:rel + PC
62 ec 1c b0 04 ff              # 5871 |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 5877 |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 587d |   mov [0xeb0 + C], -1
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _A_if_33:
ec 20 00 f8 16 00              # 5883 |   jne A, 0, ${_E_if_33}:rel + PC
62 60 1c ff                    # 5889 |   mov [C], -1
62 ec 1c 00 05 ff              # 588d |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 5893 |   mov [0xa00 + C], -1
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _BZ_for_16:
44 40                          # 5899 |   inc B
58 f8 6f fe                    # 589b |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
e4 20                          # 589f |   pop A
                               #      | _Z_for_16:
                               #      | _BZ_for_15:
44 20                          # 58a1 |   inc A
58 f8 48 fe                    # 58a3 |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
                               #      | _cleanup_fn_draw_small_board:
60 a0 bc 04                    # 58a7 |   mov SP, SP + 0x4
e4 20                          # 58ab |   pop A
e4 40                          # 58ad |   pop B
e4 60                          # 58af |   pop C
e4 80                          # 58b1 |   pop D
dc                             # 58b3 |   ret
                               #      | _end_fn_draw_small_board:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 58b4 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 58b7 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 58b8 |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 58b9 |   push D
e0 60                          # 58bb |   push C
e0 40                          # 58bd |   push B
e0 20                          # 58bf |   push A
60 60 00                       # 58c1 |   mov C, 0
                               #      | _A_call_32:
e0 00                          # 58c4 |   push 0
5c f8 06 fa                    # 58c6 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 58ca |   mov SP, SP + 0x2
                               #      | _Z_call_32:
                               #      | _A_for_25:
60 20 00                       # 58ce |   mov A, 0
                               #      | _BA_for_25:
fc 20 1c f8 02 37 00           # 58d1 |   jge A, 0x2, ${_C_for_25}:rel + PC
                               #      | _A_for_26:
60 40 00                       # 58d8 |   mov B, 0
                               #      | _BA_for_26:
fc 40 1c f8 0a 27 00           # 58db |   jge B, 0xa, ${_C_for_26}:rel + PC
88 80 20 1c 0a                 # 58e2 |   mul D, A, 0xa
00 80 e8 b2 6b                 # 58e7 |   add D, ${var__board__board_state} + B
65 ff 80                       # 58ec |   bmov H, [D]
                               #      | _A_if_35:
e8 ff 00 f8 0d 00              # 58ef |   jeq H, 0, ${_E_if_35}:rel + PC
c4 60 00                       # 58f5 |   inc C, 0
58 f8 10 00                    # 58f8 |   jmp ${_C_for_25}:rel + PC
                               #      | _E_if_35:
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _BZ_for_26:
44 40                          # 58fc |   inc B
58 f8 dd ff                    # 58fe |   jmp ${_BA_for_26}:rel + PC
                               #      | _C_for_26:
                               #      | _Z_for_26:
                               #      | _BZ_for_25:
44 20                          # 5902 |   inc A
58 f8 cd ff                    # 5904 |   jmp ${_BA_for_25}:rel + PC
                               #      | _C_for_25:
                               #      | _Z_for_25:
                               #      | _A_call_33:
e0 1c 01                       # 5908 |   push 0x1
5c f8 c1 f9                    # 590b |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 590f |   mov SP, SP + 0x2
                               #      | _Z_call_33:
60 ff 60                       # 5913 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 5916 |   pop A
e4 40                          # 5918 |   pop B
e4 60                          # 591a |   pop C
e4 80                          # 591c |   pop D
dc                             # 591e |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
e0 20                          # 591f |   push A
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 fe e0 06 ff                 # 5921 |   mov G, [0xff06]
ac ff fe e0 00 80              # 5926 |   and H, G, 0x8000
e8 ff 00 f8 8d 00              # 592c |   jeq H, 0, ${_C_loop_2}:rel + PC
a9 ff e0 1c bc 6c 08           # 5932 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 5939 |   and G, 0xff
30 ff fe                       # 593e |   or H, G
62 e0 ff bc 6c                 # 5941 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5946 |   shr G, H, 0x8
2c ff e0 ff 00                 # 594b |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 5950 |   jeq G, 0xf0, ${_BA_loop_2}:rel + PC
60 fe 00                       # 5958 |   mov G, 0
                               #      | _A_if_39:
ec ff 1c f8 75 0f 00           # 595b |   jne H, 0x75, ${_E_if_39}:rel + PC
60 fe 1c 03                    # 5962 |   mov G, 0x3
58 f8 3b 00                    # 5966 |   jmp ${_C_if_39}:rel + PC
                               #      | _E_if_39:
ec ff 1c f8 74 0f 00           # 596a |   jne H, 0x74, ${_E2_if_39}:rel + PC
60 fe 1c 02                    # 5971 |   mov G, 0x2
58 f8 2c 00                    # 5975 |   jmp ${_C_if_39}:rel + PC
                               #      | _E2_if_39:
ec ff 1c f8 6b 0e 00           # 5979 |   jne H, 0x6b, ${_E3_if_39}:rel + PC
c4 fe 00                       # 5980 |   inc G, 0
58 f8 1e 00                    # 5983 |   jmp ${_C_if_39}:rel + PC
                               #      | _E3_if_39:
ec ff 1c f8 72 0f 00           # 5987 |   jne H, 0x72, ${_E4_if_39}:rel + PC
60 fe 1c 04                    # 598e |   mov G, 0x4
58 f8 0f 00                    # 5992 |   jmp ${_C_if_39}:rel + PC
                               #      | _E4_if_39:
ec ff 1c f8 29 0b 00           # 5996 |   jne H, 0x29, ${_E5_if_39}:rel + PC
60 fe 1c 05                    # 599d |   mov G, 0x5
                               #      | _E5_if_39:
                               #      | _C_if_39:
                               #      | _Z_if_39:
                               #      | _A_if_40:
e8 fe 00 f8 14 00              # 59a1 |   jeq G, 0, ${_E_if_40}:rel + PC
                               #      | _A_call_58:
e0 fe                          # 59a7 |   push G
5c f8 86 00                    # 59a9 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 59ad |   mov SP, SP + 0x2
                               #      | _Z_call_58:
                               #      | _A_call_59:
5c f8 21 fa                    # 59b1 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_59:
                               #      | _E_if_40:
                               #      | _C_if_40:
                               #      | _Z_if_40:
                               #      | _BZ_loop_2:
58 f8 6c ff                    # 59b5 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
61 ff e0 0e ff                 # 59b9 |   mov H, [0xff0e]
                               #      | _A_if_49:
e9 ff e0 f8 ba 6c 6e 00        # 59be |   jeq H, [${var__last_btn_in}], ${_E_if_49}:rel + PC
62 e0 ff ba 6c                 # 59c6 |   mov [${var__last_btn_in}], H
60 fe 00                       # 59cb |   mov G, 0
98 20 ff 1c 0c                 # 59ce |   getb A, H, 0xc
                               #      | _A_if_50:
e8 20 00 f8 0a 00              # 59d3 |   jeq A, 0, ${_E_if_50}:rel + PC
60 fe 1c 03                    # 59d9 |   mov G, 0x3
                               #      | _E_if_50:
                               #      | _C_if_50:
                               #      | _Z_if_50:
98 20 ff 1c 0b                 # 59dd |   getb A, H, 0xb
                               #      | _A_if_51:
e8 20 00 f8 0a 00              # 59e2 |   jeq A, 0, ${_E_if_51}:rel + PC
60 fe 1c 02                    # 59e8 |   mov G, 0x2
                               #      | _E_if_51:
                               #      | _C_if_51:
                               #      | _Z_if_51:
98 20 ff 1c 0a                 # 59ec |   getb A, H, 0xa
                               #      | _A_if_52:
e8 20 00 f8 09 00              # 59f1 |   jeq A, 0, ${_E_if_52}:rel + PC
c4 fe 00                       # 59f7 |   inc G, 0
                               #      | _E_if_52:
                               #      | _C_if_52:
                               #      | _Z_if_52:
98 20 ff 1c 09                 # 59fa |   getb A, H, 0x9
                               #      | _A_if_53:
e8 20 00 f8 0a 00              # 59ff |   jeq A, 0, ${_E_if_53}:rel + PC
60 fe 1c 04                    # 5a05 |   mov G, 0x4
                               #      | _E_if_53:
                               #      | _C_if_53:
                               #      | _Z_if_53:
98 20 ff 1c 08                 # 5a09 |   getb A, H, 0x8
                               #      | _A_if_54:
e8 20 00 f8 0a 00              # 5a0e |   jeq A, 0, ${_E_if_54}:rel + PC
60 fe 1c 05                    # 5a14 |   mov G, 0x5
                               #      | _E_if_54:
                               #      | _C_if_54:
                               #      | _Z_if_54:
                               #      | _A_if_55:
e8 fe 00 f8 14 00              # 5a18 |   jeq G, 0, ${_E_if_55}:rel + PC
                               #      | _A_call_60:
e0 fe                          # 5a1e |   push G
5c f8 0f 00                    # 5a20 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5a24 |   mov SP, SP + 0x2
                               #      | _Z_call_60:
                               #      | _A_call_61:
5c f8 aa f9                    # 5a28 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_61:
                               #      | _E_if_55:
                               #      | _C_if_55:
                               #      | _Z_if_55:
                               #      | _E_if_49:
                               #      | _C_if_49:
                               #      | _Z_if_49:
                               #      | _cleanup_fn_handle_keyboard:
e4 20                          # 5a2c |   pop A
dc                             # 5a2e |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 5a2f |   push A
61 20 bc 04                    # 5a31 |   mov A, [SP + 0x4]
                               #      | _A_if_41:
ec 20 1c f8 01 16 00           # 5a35 |   jne A, 0x1, ${_E_if_41}:rel + PC
                               #      | _A_call_39:
e0 1c ff                       # 5a3c |   push -1
5c f8 4e 00                    # 5a3f |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5a43 |   mov SP, SP + 0x2
                               #      | _Z_call_39:
58 f8 43 00                    # 5a47 |   jmp ${_C_if_41}:rel + PC
                               #      | _E_if_41:
ec 20 1c f8 02 16 00           # 5a4b |   jne A, 0x2, ${_E2_if_41}:rel + PC
                               #      | _A_call_40:
e0 1c 01                       # 5a52 |   push 0x1
5c f8 38 00                    # 5a55 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5a59 |   mov SP, SP + 0x2
                               #      | _Z_call_40:
58 f8 2d 00                    # 5a5d |   jmp ${_C_if_41}:rel + PC
                               #      | _E2_if_41:
ec 20 1c f8 04 0f 00           # 5a61 |   jne A, 0x4, ${_E3_if_41}:rel + PC
                               #      | _A_call_45:
5c f8 51 00                    # 5a68 |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_45:
58 f8 1e 00                    # 5a6c |   jmp ${_C_if_41}:rel + PC
                               #      | _E3_if_41:
ec 20 1c f8 03 0f 00           # 5a70 |   jne A, 0x3, ${_E4_if_41}:rel + PC
                               #      | _A_call_51:
5c f8 72 00                    # 5a77 |   call ${fn_tg_rotate}:rel + PC
                               #      | _Z_call_51:
58 f8 0f 00                    # 5a7b |   jmp ${_C_if_41}:rel + PC
                               #      | _E4_if_41:
ec 20 1c f8 05 0b 00           # 5a7f |   jne A, 0x5, ${_E5_if_41}:rel + PC
                               #      | _A_call_57:
5c f8 b7 00                    # 5a86 |   call ${fn_tg_hold}:rel + PC
                               #      | _Z_call_57:
                               #      | _E5_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 5a8a |   pop A
dc                             # 5a8c |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_36:
e0 00                          # 5a8d |   push 0
5c f8 3d f8                    # 5a8f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5a93 |   mov SP, SP + 0x2
                               #      | _Z_call_36:
03 e0 bc 9a 6c 02              # 5a97 |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_37:
5c f8 ab f8                    # 5a9d |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_37:
                               #      | _A_if_42:
ec ff 00 f8 0c 00              # 5aa1 |   jne H, 0, ${_E_if_42}:rel + PC
07 e0 bc 9a 6c 02              # 5aa7 |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_42:
                               #      | _C_if_42:
                               #      | _Z_if_42:
                               #      | _A_call_38:
e0 1c 01                       # 5aad |   push 0x1
5c f8 1c f8                    # 5ab0 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5ab4 |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _cleanup_fn_tg_move:
dc                             # 5ab8 |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_41:
e0 00                          # 5ab9 |   push 0
5c f8 11 f8                    # 5abb |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5abf |   mov SP, SP + 0x2
                               #      | _Z_call_41:
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
46 e0 98 6c                    # 5ac3 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_42:
5c f8 81 f8                    # 5ac7 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_42:
e8 ff 00 f8 0a 00              # 5acb |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _BZ_loop_3:
58 f8 f2 ff                    # 5ad1 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
4a e0 98 6c                    # 5ad5 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_43:
e0 1c 01                       # 5ad9 |   push 0x1
5c f8 f0 f7                    # 5adc |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5ae0 |   mov SP, SP + 0x2
                               #      | _Z_call_43:
                               #      | _A_call_44:
5c f8 c4 f6                    # 5ae4 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_44:
                               #      | _cleanup_fn_tg_down:
dc                             # 5ae8 |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_46:
e0 00                          # 5ae9 |   push 0
5c f8 e1 f7                    # 5aeb |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5aef |   mov SP, SP + 0x2
                               #      | _Z_call_46:
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
c5 ff e0 96 6c                 # 5af3 |   inc H, [${var__board__falling} + 0002]
2c ff 1c 03                    # 5af8 |   and H, 0x3
62 e0 ff 96 6c                 # 5afc |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_47:
5c f8 47 f8                    # 5b01 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_47:
ec ff 00 f8 2c 00              # 5b05 |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 9a 6c                    # 5b0b |   dec [${var__board__falling} + 0006]
                               #      | _A_call_48:
5c f8 39 f8                    # 5b0f |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_48:
ec ff 00 f8 1e 00              # 5b13 |   jne H, 0, ${_C_loop_4}:rel + PC
02 e0 1c 9a 6c 02              # 5b19 |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_49:
5c f8 29 f8                    # 5b1f |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_49:
ec ff 00 f8 0e 00              # 5b23 |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 9a 6c                    # 5b29 |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_4:
58 f8 c6 ff                    # 5b2d |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _A_call_50:
e0 1c 01                       # 5b31 |   push 0x1
5c f8 98 f7                    # 5b34 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5b38 |   mov SP, SP + 0x2
                               #      | _Z_call_50:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 5b3c |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn_tg_hold:
                               #      | _begin_fn_tg_hold:
e0 40                          # 5b3d |   push B
e0 20                          # 5b3f |   push A
                               #      | _A_call_52:
e0 00                          # 5b41 |   push 0
5c f8 89 f7                    # 5b43 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5b47 |   mov SP, SP + 0x2
                               #      | _Z_call_52:
                               #      | _A_if_47:
ee e0 1c f8 a4 6c ff 24 00     # 5b4b |   jne [${var__board__stored}], -1, ${_E_if_47}:rel + PC
                               #      | _A_call_53:
e0 1c 08                       # 5b54 |   push 0x8
e0 e0 94 6c                    # 5b57 |   push ${var__board__falling}
e0 e0 a4 6c                    # 5b5b |   push ${var__board__stored}
5c f8 86 f6                    # 5b5f |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 5b63 |   mov SP, SP + 0x6
                               #      | _Z_call_53:
                               #      | _A_call_54:
5c f8 41 f6                    # 5b67 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_54:
58 f8 39 00                    # 5b6b |   jmp ${_C_if_47}:rel + PC
                               #      | _E_if_47:
61 20 e0 94 6c                 # 5b6f |   mov A, [${var__board__falling}]
61 40 e0 96 6c                 # 5b74 |   mov B, [${var__board__falling} + 0002]
63 e0 e0 94 6c a4 6c           # 5b79 |   mov [${var__board__falling}], [${var__board__stored}]
63 e0 e0 96 6c a6 6c           # 5b80 |   mov [${var__board__falling} + 0002], [${var__board__stored} + 0002]
62 e0 20 a4 6c                 # 5b87 |   mov [${var__board__stored}], A
62 e0 40 a6 6c                 # 5b8c |   mov [${var__board__stored} + 0002], B
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
                               #      | _A_call_55:
5c f8 b7 f7                    # 5b91 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_55:
e8 ff 1c f8 01 0f 00           # 5b95 |   jeq H, 0x1, ${_C_loop_5}:rel + PC
4a e0 98 6c                    # 5b9c |   dec [${var__board__falling} + 0004]
                               #      | _BZ_loop_5:
58 f8 f1 ff                    # 5ba0 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _C_if_47:
                               #      | _Z_if_47:
                               #      | _A_call_56:
e0 1c 01                       # 5ba4 |   push 0x1
5c f8 25 f7                    # 5ba7 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5bab |   mov SP, SP + 0x2
                               #      | _Z_call_56:
                               #      | _cleanup_fn_tg_hold:
e4 20                          # 5baf |   pop A
e4 40                          # 5bb1 |   pop B
dc                             # 5bb3 |   ret
                               #      | _end_fn_tg_hold:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5bb4 |   push D
e0 60                          # 5bb6 |   push C
e0 40                          # 5bb8 |   push B
e0 20                          # 5bba |   push A
61 40 e0 10 ff                 # 5bbc |   mov B, [0xff10]
61 60 e0 12 ff                 # 5bc1 |   mov C, [0xff12]
61 80 e0 14 ff                 # 5bc6 |   mov D, [0xff14]
61 20 bc 0e                    # 5bcb |   mov A, [SP + 0xe]
60 ff 00                       # 5bcf |   mov H, 0
                               #      | _A_if_56:
fc 28 20 f8 09 00              # 5bd2 |   jge A + B, A, ${_E_if_56}:rel + PC
c4 ff 00                       # 5bd8 |   inc H, 0
                               #      | _E_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
60 40 44                       # 5bdb |   mov B, B + A
81 20 bc ff 0c                 # 5bde |   add A, [SP + 0xc], H
60 ff 00                       # 5be3 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 5be6 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 5bec |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 5bf2 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 5bf6 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 5bf9 |   mov C, C + A
81 20 bc ff 0a                 # 5bfc |   add A, [SP + 0xa], H
60 80 84                       # 5c01 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 5c04 |   mov A, [SP + 0x10]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
61 ff e0 14 ff                 # 5c08 |   mov H, [0xff14]
                               #      | _A_if_59:
f4 ff 80 f8 0a 00              # 5c0d |   jle H, D, ${_E_if_59}:rel + PC
58 f8 33 00                    # 5c13 |   jmp ${_C_loop_6}:rel + PC
                               #      | _E_if_59:
ec ff 80 f8 2b 00              # 5c17 |   jne H, D, ${_E2_if_59}:rel + PC
61 ff e0 12 ff                 # 5c1d |   mov H, [0xff12]
                               #      | _A_if_60:
f4 ff 60 f8 0a 00              # 5c22 |   jle H, C, ${_E_if_60}:rel + PC
58 f8 1e 00                    # 5c28 |   jmp ${_C_loop_6}:rel + PC
                               #      | _E_if_60:
ec ff 60 f8 16 00              # 5c2c |   jne H, C, ${_E2_if_60}:rel + PC
fa e0 40 f8 10 ff 14 00        # 5c32 |   jgt [0xff10], B, ${_C_loop_6}:rel + PC
                               #      | _A_if_62:
e8 20 00 f8 08 00              # 5c3a |   jeq A, 0, ${_E_if_62}:rel + PC
5c 20                          # 5c40 |   call A
                               #      | _E_if_62:
                               #      | _C_if_62:
                               #      | _Z_if_62:
                               #      | _E2_if_60:
                               #      | _C_if_60:
                               #      | _Z_if_60:
                               #      | _E2_if_59:
                               #      | _C_if_59:
                               #      | _Z_if_59:
                               #      | _BZ_loop_6:
58 f8 c6 ff                    # 5c42 |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5c46 |   pop A
e4 40                          # 5c48 |   pop B
e4 60                          # 5c4a |   pop C
e4 80                          # 5c4c |   pop D
dc                             # 5c4e |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 5c4f |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5c87 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5caf
                               #      | SECTION_BEGIN_static_data:
                               # 5caf |   .align dummy_size:1 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5cb0 |   .bss size:3840 align:16
                               #      | var__rand__state:
                               # 6bb0 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 6bb2 |   .bss size:222 align:1
                               #      | var__board__points:
                               # 6c90 |   .bss size:2 align:1
                               #      | var__board__level:
                               # 6c92 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 6c94 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 6c9c |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 6ca4 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 6cac |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 6cae |   .bss size:2 align:1
                               #      | var__var_1:
                               # 6cb0 |   .bss size:10 align:1
                               #      | var__last_btn_in:
                               # 6cba |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 6cbc |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
