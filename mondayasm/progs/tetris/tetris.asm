                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_44:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_44:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 80                          # 500a |   push D
e0 60                          # 500c |   push C
e0 40                          # 500e |   push B
e0 20                          # 5010 |   push A
                               #      | _A_call_7:
5c f8 43 00                    # 5012 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_7:
60 a0 bc fc                    # 5016 |   mov SP, SP + -4
                               #      |   # game loop
                               #      | _A_while_3:
                               #      | _BA_while_3:
ea bc 00 f8 02 2e 00           # 501a |   jeq [SP + 0x2], 0, ${_C_while_3}:rel + PC
                               #      | _A_call_40:
e2 a0                          # 5021 |   push [SP]
5c f8 36 01                    # 5023 |   call ${fn_tg_tick}:rel + PC
60 a0 bc 02                    # 5027 |   mov SP, SP + 0x2
                               #      | _Z_call_40:
62 bc ff 02                    # 502b |   mov [SP + 0x2], H
                               #      | _A_call_43:
e0 e0 e8 55                    # 502f |   push ${fn_handle_keyboard}
e0 e0 e0 93                    # 5033 |   push 0x93e0
e0 1c 04                       # 5037 |   push 0x4
e0 00                          # 503a |   push 0
5c f8 36 06                    # 503c |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5040 |   mov SP, SP + 0x8
                               #      | _Z_call_43:
                               #      | _BZ_while_3:
58 f8 d6 ff                    # 5044 |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _cleanup_fn_main:
60 a0 bc 04                    # 5048 |   mov SP, SP + 0x4
e4 20                          # 504c |   pop A
e4 40                          # 504e |   pop B
e4 60                          # 5050 |   pop C
e4 80                          # 5052 |   pop D
dc                             # 5054 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_tg_init:
                               #      | _begin_fn_tg_init:
                               #      | _A_call_1:
e0 e0 dc 00                    # 5055 |   push 0xdc
e0 00                          # 5059 |   push 0
e0 e0 32 61                    # 505b |   push ${var__board__board_state}
5c f8 44 00                    # 505f |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5063 |   mov SP, SP + 0x6
                               #      | _Z_call_1:
62 e0 00 0e 62                 # 5067 |   mov [${var__board__points}], 0
62 e0 00 10 62                 # 506c |   mov [${var__board__level}], 0
62 e0 00 2a 62                 # 5071 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 2c 62                 # 5076 |   mov [${var__board__lines_remaining}], 0
                               #      | _A_call_2:
e0 00                          # 507b |   push 0
5c f8 5f 00                    # 507d |   call ${fn_srand}:rel + PC
60 a0 bc 02                    # 5081 |   mov SP, SP + 0x2
                               #      | _Z_call_2:
                               #      | _A_call_5:
5c f8 5e 00                    # 5085 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_5:
                               #      | _A_call_6:
5c f8 5a 00                    # 5089 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_6:
ca e0 00 22 62                 # 508d |   dec [${var__board__stored}], 0
62 e0 00 24 62                 # 5092 |   mov [${var__board__stored} + 0002], 0
62 e0 00 26 62                 # 5097 |   mov [${var__board__stored} + 0004], 0
62 e0 1c 20 62 03              # 509c |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_init:
dc                             # 50a2 |   ret
                               #      | _end_fn_tg_init:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 50a3 |   push B
e0 20                          # 50a5 |   push A
65 fe bc 08                    # 50a7 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 50ab |   shl H, G, 0x8
30 ff fe                       # 50b0 |   or H, G
61 20 bc 06                    # 50b3 |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 50b7 |   add B, [SP + 0xa], A
                               #      | _A_while_1:
                               #      | _BA_while_1:
f8 3c 40 f8 02 12 00           # 50bc |   jgt A + 0x2, B, ${_C_while_1}:rel + PC
62 20 ff                       # 50c3 |   mov [A], H
60 20 3c 02                    # 50c6 |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 f2 ff                    # 50ca |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      | _A_if_1:
fc 20 40 f8 09 00              # 50ce |   jge A, B, ${_E_if_1}:rel + PC
66 20 ff                       # 50d4 |   bmov [A], H
                               #      | _E_if_1:
                               #      | _C_if_1:
                               #      | _Z_if_1:
                               #      | _cleanup_fn_memset:
e4 20                          # 50d7 |   pop A
e4 40                          # 50d9 |   pop B
dc                             # 50db |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc 30 61 02              # 50dc |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 50e2 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_3:
e0 1c 08                       # 50e3 |   push 0x8
e0 e0 1a 62                    # 50e6 |   push ${var__board__next}
e0 e0 12 62                    # 50ea |   push ${var__board__falling}
5c f8 27 00                    # 50ee |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 50f2 |   mov SP, SP + 0x6
                               #      | _Z_call_3:
                               #      |   # fill new Board.next
                               #      | _A_call_4:
5c f8 58 00                    # 50f6 |   call ${fn_rand}:rel + PC
                               #      | _Z_call_4:
90 fe ff 1c 07                 # 50fa |   div G, H, 0x7
c6 e0 ff 1a 62                 # 50ff |   inc [${var__board__next}], H
62 e0 00 1c 62                 # 5104 |   mov [${var__board__next} + 0002], 0
62 e0 00 1e 62                 # 5109 |   mov [${var__board__next} + 0004], 0
62 e0 1c 20 62 03              # 510e |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_new_falling:
dc                             # 5114 |   ret
                               #      | _end_fn_tg_new_falling:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 5115 |   push C
e0 40                          # 5117 |   push B
e0 20                          # 5119 |   push A
61 20 bc 08                    # 511b |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 511f |   add B, [SP + 0xc], A
61 60 bc 0a                    # 5124 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
f8 3c 40 f8 02 16 00           # 5128 |   jgt A + 0x2, B, ${_C_while_2}:rel + PC
63 20 60                       # 512f |   mov [A], [C]
60 20 3c 02                    # 5132 |   mov A, A + 0x2
60 60 7c 02                    # 5136 |   mov C, C + 0x2
                               #      | _BZ_while_2:
58 f8 ee ff                    # 513a |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _A_if_2:
fc 20 40 f8 09 00              # 513e |   jge A, B, ${_E_if_2}:rel + PC
67 20 60                       # 5144 |   bmov [A], [C]
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 5147 |   pop A
e4 40                          # 5149 |   pop B
e4 60                          # 514b |   pop C
dc                             # 514d |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 30 61                 # 514e |   inc H, [${var__rand__state}]
62 e0 ff 30 61                 # 5153 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5158 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_13:
5c f8 31 00                    # 5159 |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_13:
                               #      | _A_if_16:
e8 ff 00 f8 0a 00              # 515d |   jeq H, 0, ${_E_if_16}:rel + PC
                               #      | _A_call_17:
5c f8 b8 01                    # 5163 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_17:
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _A_call_34:
e2 bc 02                       # 5167 |   push [SP + 0x2]
5c f8 ac 02                    # 516a |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 516e |   mov SP, SP + 0x2
                               #      | _Z_call_34:
                               #      | _A_call_35:
5c f8 fb 03                    # 5172 |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_35:
                               #      | _A_call_36:
e0 ff                          # 5176 |   push H
5c f8 f9 03                    # 5178 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 517c |   mov SP, SP + 0x2
                               #      | _Z_call_36:
                               #      | _A_call_39:
5c f8 f2 03                    # 5180 |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_39:
84 ff 1c ff 01                 # 5184 |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5189 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 518a |   push A
4a e0 2a 62                    # 518c |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_3:
d2 e0 00 2a 62                 # 5190 |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 72 00                    # 5195 |   jgt ${_E_if_3}:rel + PC
                               #      | _A_call_8:
e0 fd                          # 5199 |   push F
e0 fc                          # 519b |   push E
e0 00                          # 519d |   push 0
5c f8 6e 00                    # 519f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 51a3 |   mov SP, SP + 0x2
e4 fc                          # 51a7 |   pop E
e4 fd                          # 51a9 |   pop F
                               #      | _Z_call_8:
46 e0 16 62                    # 51ab |   inc [${var__board__falling} + 0004]
                               #      | _A_call_9:
e0 fd                          # 51af |   push F
e0 fc                          # 51b1 |   push E
5c f8 cd 00                    # 51b3 |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 51b7 |   pop E
e4 fd                          # 51b9 |   pop F
                               #      | _Z_call_9:
                               #      | _A_if_15:
ec ff 1c f8 01 17 00           # 51bb |   jne H, 0x1, ${_E_if_15}:rel + PC
61 20 e0 10 62                 # 51c2 |   mov A, [${var__board__level}]
63 e0 e4 2a 62 fa 5b           # 51c7 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 1f 00                    # 51ce |   jmp ${_C_if_15}:rel + PC
                               #      | _E_if_15:
4a e0 16 62                    # 51d2 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_10:
e0 fd                          # 51d6 |   push F
e0 fc                          # 51d8 |   push E
e0 1c 01                       # 51da |   push 0x1
5c f8 30 00                    # 51dd |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 51e1 |   mov SP, SP + 0x2
e4 fc                          # 51e5 |   pop E
e4 fd                          # 51e7 |   pop F
                               #      | _Z_call_10:
                               #      | _A_call_11:
5c f8 fa fe                    # 51e9 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_11:
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _A_call_12:
e0 fd                          # 51ed |   push F
e0 fc                          # 51ef |   push E
e0 1c 01                       # 51f1 |   push 0x1
5c f8 19 00                    # 51f4 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 51f8 |   mov SP, SP + 0x2
e4 fc                          # 51fc |   pop E
e4 fd                          # 51fe |   pop F
                               #      | _Z_call_12:
c4 ff 00                       # 5200 |   inc H, 0
58 f8 07 00                    # 5203 |   jmp ${_C_if_3}:rel + PC
                               #      | _E_if_3:
60 ff 00                       # 5207 |   mov H, 0
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 520a |   pop A
dc                             # 520c |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 520d |   push D
e0 60                          # 520f |   push C
e0 40                          # 5211 |   push B
e0 20                          # 5213 |   push A
61 20 bc 0a                    # 5215 |   mov A, [SP + 0xa]
c9 40 e0 12 62                 # 5219 |   dec B, [${var__board__falling}]
a9 80 e0 1c 14 62 01           # 521e |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 5225 |   mov D, B*8 + D
61 80 f0 c2 5b                 # 5228 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_1:
60 60 00                       # 522d |   mov C, 0
                               #      | _BA_for_1:
fc 60 1c f8 04 47 00           # 5230 |   jge C, 0x4, ${_C_for_1}:rel + PC
a0 40 80 7e 02                 # 5237 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 523c |   shr E, D, C*4
2c 40 1c 03                    # 5240 |   and B, 0x3
2c fc 1c 03                    # 5244 |   and E, 0x3
81 fe e0 40 16 62              # 5248 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc 18 62              # 524e |   add B, [${var__board__falling} + 0006], E
88 fd fe 1c 0a                 # 5254 |   mul F, G, 0xa
00 fd e8 32 61                 # 5259 |   add F, ${var__board__board_state} + B
                               #      | _A_if_4:
ee bc 00 f8 0a 0e 00           # 525e |   jne [SP + 0xa], 0, ${_E_if_4}:rel + PC
66 fd 00                       # 5265 |   bmov [F], 0
58 f8 09 00                    # 5268 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
67 fd e0 12 62                 # 526c |   bmov [F], [${var__board__falling}]
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _BZ_for_1:
44 60                          # 5271 |   inc C
58 f8 bd ff                    # 5273 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 5277 |   pop A
e4 40                          # 5279 |   pop B
e4 60                          # 527b |   pop C
e4 80                          # 527d |   pop D
dc                             # 527f |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 5280 |   push D
e0 60                          # 5282 |   push C
e0 40                          # 5284 |   push B
e0 20                          # 5286 |   push A
c9 40 e0 12 62                 # 5288 |   dec B, [${var__board__falling}]
a9 80 e0 1c 14 62 01           # 528d |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 5294 |   mov D, B*8 + D
61 80 f0 c2 5b                 # 5297 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_2:
60 60 00                       # 529c |   mov C, 0
                               #      | _BA_for_2:
fc 60 1c f8 04 70 00           # 529f |   jge C, 0x4, ${_C_for_2}:rel + PC
a0 20 80 7e 02                 # 52a6 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 52ab |   shr E, D, C*4
2c 20 1c 03                    # 52af |   and A, 0x3
2c fc 1c 03                    # 52b3 |   and E, 0x3
81 fe e0 20 16 62              # 52b7 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc 18 62              # 52bd |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 52c3 |   mov H, 0
                               #      | _A_if_6:
d0 fe 00                       # 52c6 |   icmp G, 0
7c f8 08 00                    # 52c9 |   jge ${_E_if_6}:rel + PC
58 f8 45 00                    # 52cd |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _A_if_8:
d0 40 00                       # 52d1 |   icmp B, 0
7c f8 08 00                    # 52d4 |   jge ${_E_if_8}:rel + PC
58 f8 3a 00                    # 52d8 |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _A_if_10:
f0 fe 1c f8 16 0b 00           # 52dc |   jlt G, 0x16, ${_E_if_10}:rel + PC
58 f8 2f 00                    # 52e3 |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_10:
                               #      | _C_if_10:
                               #      | _Z_if_10:
                               #      | _A_if_12:
f0 40 1c f8 0a 0b 00           # 52e7 |   jlt B, 0xa, ${_E_if_12}:rel + PC
58 f8 24 00                    # 52ee |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_12:
                               #      | _C_if_12:
                               #      | _Z_if_12:
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 52f2 |   mul F, G, 0xa
00 fd e8 32 61                 # 52f7 |   add F, ${var__board__board_state} + B
65 fd fd                       # 52fc |   bmov F, [F]
                               #      | _A_if_14:
e8 fd 00 f8 0a 00              # 52ff |   jeq F, 0, ${_E_if_14}:rel + PC
58 f8 0d 00                    # 5305 |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
                               #      | _BZ_for_2:
44 60                          # 5309 |   inc C
58 f8 94 ff                    # 530b |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      |   # done checking, all good
c4 ff 00                       # 530f |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 5312 |   pop A
e4 40                          # 5314 |   pop B
e4 60                          # 5316 |   pop C
e4 80                          # 5318 |   pop D
dc                             # 531a |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 531b |   push D
e0 60                          # 531d |   push C
e0 40                          # 531f |   push B
e0 20                          # 5321 |   push A
                               #      | _A_for_3:
60 20 00                       # 5323 |   mov A, 0
                               #      | _BA_for_3:
fc 20 1c f8 16 92 00           # 5326 |   jge A, 0x16, ${_C_for_3}:rel + PC
                               #      | _A_for_4:
c4 60 00                       # 532d |   inc C, 0
                               #      | _BA_for_4:
fc 60 1c f8 08 82 00           # 5330 |   jge C, 0x8, ${_C_for_4}:rel + PC
                               #      | _A_call_14:
e0 60                          # 5337 |   push C
e0 3c 02                       # 5339 |   push A + 0x2
5c f8 85 00                    # 533c |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 5340 |   mov SP, SP + 0x4
                               #      | _Z_call_14:
                               #      | _A_for_5:
60 40 00                       # 5344 |   mov B, 0
                               #      | _BA_for_5:
fc 40 1c f8 0a 63 00           # 5347 |   jge B, 0xa, ${_C_for_5}:rel + PC
88 80 1c 20 0a                 # 534e |   mul D, 0xa, A
80 80 88 e0 32 61              # 5353 |   add D, D + B, ${var__board__board_state}
65 80 80                       # 5359 |   bmov D, [D]
2c 80 60                       # 535c |   and D, C
c4 ff 00                       # 535f |   inc H, 0
                               #      | _A_if_17:
e8 80 00 f8 0a 00              # 5362 |   jeq D, 0, ${_E_if_17}:rel + PC
60 ff 1c ff                    # 5368 |   mov H, -1
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _A_if_18:
ec 40 1c f8 09 0c 00           # 536c |   jne B, 0x9, ${_E_if_18}:rel + PC
30 ff e0 00 80                 # 5373 |   or H, 0x8000
                               #      | _E_if_18:
                               #      | _C_if_18:
                               #      | _Z_if_18:
                               #      | _A_call_15:
e0 ff                          # 5378 |   push H
e0 5c 0a                       # 537a |   push B + 0xa
5c f8 66 00                    # 537d |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # 5381 |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_call_16:
e0 5c 0a                       # 5385 |   push B + 0xa
5c f8 82 00                    # 5388 |   call ${fn_get_cell_addr}:rel + PC
60 a0 bc 02                    # 538c |   mov SP, SP + 0x2
                               #      | _Z_call_16:
62 ff 1c ff                    # 5390 |   mov [H], -1
                               #      | _A_if_19:
ec 20 1c f8 15 10 00           # 5394 |   jne A, 0x15, ${_E_if_19}:rel + PC
00 ff e0 b0 04                 # 539b |   add H, 0x4b0
62 ff 1c ff                    # 53a0 |   mov [H], -1
                               #      | _E_if_19:
                               #      | _C_if_19:
                               #      | _Z_if_19:
                               #      | _BZ_for_5:
44 40                          # 53a4 |   inc B
58 f8 a1 ff                    # 53a6 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _BZ_for_4:
28 60 1c 01                    # 53aa |   shl C, 0x1
58 f8 82 ff                    # 53ae |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _BZ_for_3:
44 20                          # 53b2 |   inc A
58 f8 72 ff                    # 53b4 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_display_board:
e4 20                          # 53b8 |   pop A
e4 40                          # 53ba |   pop B
e4 60                          # 53bc |   pop C
e4 80                          # 53be |   pop D
dc                             # 53c0 |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # 53c1 |   push B
e0 20                          # 53c3 |   push A
61 20 bc 08                    # 53c5 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 53c9 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 53ce |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 30 5c 2f 61 01     # 53d5 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # 53de |   pop A
e4 40                          # 53e0 |   pop B
dc                             # 53e2 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # 53e3 |   push A
61 fe bc 06                    # 53e5 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # 53e9 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_6:
60 20 e4 30 5c                 # 53ef |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_6:
fc 20 e0 f8 30 61 13 00        # 53f4 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_6}:rel + PC
62 20 fe                       # 53fc |   mov [A], G
                               #      | _BZ_for_6:
60 20 3c 50                    # 53ff |   mov A, A + 0x50
58 f8 f1 ff                    # 5403 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # 5407 |   pop A
dc                             # 5409 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_get_cell_addr:
                               #      | _begin_fn_get_cell_addr:
a9 ff bc 1c 02 01              # 540a |   shl H, [SP + 0x2], 0x1
00 ff e0 30 5c                 # 5410 |   add H, ${var__VIDEO_ROW_BUFFER}
                               #      | _cleanup_fn_get_cell_addr:
dc                             # 5415 |   ret
                               #      | _end_fn_get_cell_addr:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 5416 |   push A
61 20 bc 04                    # 5418 |   mov A, [SP + 0x4]
                               #      | _A_if_20:
ec 20 1c f8 01 16 00           # 541c |   jne A, 0x1, ${_E_if_20}:rel + PC
                               #      | _A_call_21:
e0 1c ff                       # 5423 |   push -1
5c f8 3f 00                    # 5426 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 542a |   mov SP, SP + 0x2
                               #      | _Z_call_21:
58 f8 34 00                    # 542e |   jmp ${_C_if_20}:rel + PC
                               #      | _E_if_20:
ec 20 1c f8 02 16 00           # 5432 |   jne A, 0x2, ${_E2_if_20}:rel + PC
                               #      | _A_call_22:
e0 1c 01                       # 5439 |   push 0x1
5c f8 29 00                    # 543c |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5440 |   mov SP, SP + 0x2
                               #      | _Z_call_22:
58 f8 1e 00                    # 5444 |   jmp ${_C_if_20}:rel + PC
                               #      | _E2_if_20:
ec 20 1c f8 04 0f 00           # 5448 |   jne A, 0x4, ${_E3_if_20}:rel + PC
                               #      | _A_call_27:
5c f8 5a 00                    # 544f |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_27:
58 f8 0f 00                    # 5453 |   jmp ${_C_if_20}:rel + PC
                               #      | _E3_if_20:
ec 20 1c f8 03 0b 00           # 5457 |   jne A, 0x3, ${_E4_if_20}:rel + PC
                               #      | _A_call_33:
5c f8 93 00                    # 545e |   call ${fn_tg_rotate}:rel + PC
                               #      | _Z_call_33:
                               #      | _E4_if_20:
                               #      | _C_if_20:
                               #      | _Z_if_20:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 5462 |   pop A
dc                             # 5464 |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_18:
e0 fd                          # 5465 |   push F
e0 fc                          # 5467 |   push E
e0 00                          # 5469 |   push 0
5c f8 a2 fd                    # 546b |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 546f |   mov SP, SP + 0x2
e4 fc                          # 5473 |   pop E
e4 fd                          # 5475 |   pop F
                               #      | _Z_call_18:
03 e0 bc 18 62 02              # 5477 |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_19:
e0 fd                          # 547d |   push F
e0 fc                          # 547f |   push E
5c f8 ff fd                    # 5481 |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 5485 |   pop E
e4 fd                          # 5487 |   pop F
                               #      | _Z_call_19:
                               #      | _A_if_21:
ec ff 00 f8 0c 00              # 5489 |   jne H, 0, ${_E_if_21}:rel + PC
07 e0 bc 18 62 02              # 548f |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_21:
                               #      | _C_if_21:
                               #      | _Z_if_21:
                               #      | _A_call_20:
e0 fd                          # 5495 |   push F
e0 fc                          # 5497 |   push E
e0 1c 01                       # 5499 |   push 0x1
5c f8 71 fd                    # 549c |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54a0 |   mov SP, SP + 0x2
e4 fc                          # 54a4 |   pop E
e4 fd                          # 54a6 |   pop F
                               #      | _Z_call_20:
                               #      | _cleanup_fn_tg_move:
dc                             # 54a8 |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_23:
e0 fd                          # 54a9 |   push F
e0 fc                          # 54ab |   push E
e0 00                          # 54ad |   push 0
5c f8 5e fd                    # 54af |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54b3 |   mov SP, SP + 0x2
e4 fc                          # 54b7 |   pop E
e4 fd                          # 54b9 |   pop F
                               #      | _Z_call_23:
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
46 e0 16 62                    # 54bb |   inc [${var__board__falling} + 0004]
                               #      | _A_call_24:
e0 fd                          # 54bf |   push F
e0 fc                          # 54c1 |   push E
5c f8 bd fd                    # 54c3 |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 54c7 |   pop E
e4 fd                          # 54c9 |   pop F
                               #      | _Z_call_24:
e8 ff 00 f8 0a 00              # 54cb |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 ea ff                    # 54d1 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
4a e0 16 62                    # 54d5 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_25:
e0 fd                          # 54d9 |   push F
e0 fc                          # 54db |   push E
e0 1c 01                       # 54dd |   push 0x1
5c f8 2d fd                    # 54e0 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54e4 |   mov SP, SP + 0x2
e4 fc                          # 54e8 |   pop E
e4 fd                          # 54ea |   pop F
                               #      | _Z_call_25:
                               #      | _A_call_26:
5c f8 f7 fb                    # 54ec |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_26:
                               #      | _cleanup_fn_tg_down:
dc                             # 54f0 |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_28:
e0 fd                          # 54f1 |   push F
e0 fc                          # 54f3 |   push E
e0 00                          # 54f5 |   push 0
5c f8 16 fd                    # 54f7 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54fb |   mov SP, SP + 0x2
e4 fc                          # 54ff |   pop E
e4 fd                          # 5501 |   pop F
                               #      | _Z_call_28:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
c5 ff e0 14 62                 # 5503 |   inc H, [${var__board__falling} + 0002]
2c ff 1c 03                    # 5508 |   and H, 0x3
62 e0 ff 14 62                 # 550c |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_29:
e0 fd                          # 5511 |   push F
e0 fc                          # 5513 |   push E
5c f8 6b fd                    # 5515 |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 5519 |   pop E
e4 fd                          # 551b |   pop F
                               #      | _Z_call_29:
ec ff 00 f8 3c 00              # 551d |   jne H, 0, ${_C_loop_2}:rel + PC
4a e0 18 62                    # 5523 |   dec [${var__board__falling} + 0006]
                               #      | _A_call_30:
e0 fd                          # 5527 |   push F
e0 fc                          # 5529 |   push E
5c f8 55 fd                    # 552b |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 552f |   pop E
e4 fd                          # 5531 |   pop F
                               #      | _Z_call_30:
ec ff 00 f8 26 00              # 5533 |   jne H, 0, ${_C_loop_2}:rel + PC
02 e0 1c 18 62 02              # 5539 |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_31:
e0 fd                          # 553f |   push F
e0 fc                          # 5541 |   push E
5c f8 3d fd                    # 5543 |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 5547 |   pop E
e4 fd                          # 5549 |   pop F
                               #      | _Z_call_31:
ec ff 00 f8 0e 00              # 554b |   jne H, 0, ${_C_loop_2}:rel + PC
4a e0 18 62                    # 5551 |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_2:
58 f8 ae ff                    # 5555 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _A_call_32:
e0 fd                          # 5559 |   push F
e0 fc                          # 555b |   push E
e0 1c 01                       # 555d |   push 0x1
5c f8 ad fc                    # 5560 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5564 |   mov SP, SP + 0x2
e4 fc                          # 5568 |   pop E
e4 fd                          # 556a |   pop F
                               #      | _Z_call_32:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 556c |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 556d |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 5570 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 5571 |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 5572 |   push D
e0 60                          # 5574 |   push C
e0 40                          # 5576 |   push B
e0 20                          # 5578 |   push A
60 60 00                       # 557a |   mov C, 0
                               #      | _A_call_37:
e0 fd                          # 557d |   push F
e0 fc                          # 557f |   push E
e0 00                          # 5581 |   push 0
5c f8 8a fc                    # 5583 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5587 |   mov SP, SP + 0x2
e4 fc                          # 558b |   pop E
e4 fd                          # 558d |   pop F
                               #      | _Z_call_37:
                               #      | _A_for_7:
60 20 00                       # 558f |   mov A, 0
                               #      | _BA_for_7:
fc 20 1c f8 02 37 00           # 5592 |   jge A, 0x2, ${_C_for_7}:rel + PC
                               #      | _A_for_8:
60 40 00                       # 5599 |   mov B, 0
                               #      | _BA_for_8:
fc 40 1c f8 0a 27 00           # 559c |   jge B, 0xa, ${_C_for_8}:rel + PC
88 80 20 1c 0a                 # 55a3 |   mul D, A, 0xa
00 80 e8 32 61                 # 55a8 |   add D, ${var__board__board_state} + B
65 ff 80                       # 55ad |   bmov H, [D]
                               #      | _A_if_26:
e8 ff 00 f8 0d 00              # 55b0 |   jeq H, 0, ${_E_if_26}:rel + PC
c4 60 00                       # 55b6 |   inc C, 0
58 f8 10 00                    # 55b9 |   jmp ${_C_for_7}:rel + PC
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _BZ_for_8:
44 40                          # 55bd |   inc B
58 f8 dd ff                    # 55bf |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _BZ_for_7:
44 20                          # 55c3 |   inc A
58 f8 cd ff                    # 55c5 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _A_call_38:
e0 fd                          # 55c9 |   push F
e0 fc                          # 55cb |   push E
e0 1c 01                       # 55cd |   push 0x1
5c f8 3d fc                    # 55d0 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 55d4 |   mov SP, SP + 0x2
e4 fc                          # 55d8 |   pop E
e4 fd                          # 55da |   pop F
                               #      | _Z_call_38:
60 ff 60                       # 55dc |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 55df |   pop A
e4 40                          # 55e1 |   pop B
e4 60                          # 55e3 |   pop C
e4 80                          # 55e5 |   pop D
dc                             # 55e7 |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 fe e0 06 ff                 # 55e8 |   mov G, [0xff06]
ac ff fe e0 00 80              # 55ed |   and H, G, 0x8000
e8 ff 00 f8 7e 00              # 55f3 |   jeq H, 0, ${_C_loop_3}:rel + PC
a9 ff e0 1c 2e 62 08           # 55f9 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 5600 |   and G, 0xff
30 ff fe                       # 5605 |   or H, G
62 e0 ff 2e 62                 # 5608 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 560d |   shr G, H, 0x8
2c ff e0 ff 00                 # 5612 |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 5617 |   jeq G, 0xf0, ${_BA_loop_3}:rel + PC
60 fe 00                       # 561f |   mov G, 0
                               #      | _A_if_29:
ec ff 1c f8 75 0f 00           # 5622 |   jne H, 0x75, ${_E_if_29}:rel + PC
60 fe 1c 03                    # 5629 |   mov G, 0x3
58 f8 2c 00                    # 562d |   jmp ${_C_if_29}:rel + PC
                               #      | _E_if_29:
ec ff 1c f8 74 0f 00           # 5631 |   jne H, 0x74, ${_E2_if_29}:rel + PC
60 fe 1c 02                    # 5638 |   mov G, 0x2
58 f8 1d 00                    # 563c |   jmp ${_C_if_29}:rel + PC
                               #      | _E2_if_29:
ec ff 1c f8 6b 0e 00           # 5640 |   jne H, 0x6b, ${_E3_if_29}:rel + PC
c4 fe 00                       # 5647 |   inc G, 0
58 f8 0f 00                    # 564a |   jmp ${_C_if_29}:rel + PC
                               #      | _E3_if_29:
ec ff 1c f8 72 0b 00           # 564e |   jne H, 0x72, ${_E4_if_29}:rel + PC
60 fe 1c 04                    # 5655 |   mov G, 0x4
                               #      | _E4_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _A_if_30:
e8 fe 00 f8 14 00              # 5659 |   jeq G, 0, ${_E_if_30}:rel + PC
                               #      | _A_call_41:
e0 fe                          # 565f |   push G
5c f8 b5 fd                    # 5661 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5665 |   mov SP, SP + 0x2
                               #      | _Z_call_41:
                               #      | _A_call_42:
5c f8 b2 fc                    # 5669 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_42:
                               #      | _E_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
                               #      | _BZ_loop_3:
58 f8 7b ff                    # 566d |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _cleanup_fn_handle_keyboard:
dc                             # 5671 |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5672 |   push D
e0 60                          # 5674 |   push C
e0 40                          # 5676 |   push B
e0 20                          # 5678 |   push A
61 40 e0 10 ff                 # 567a |   mov B, [0xff10]
61 60 e0 12 ff                 # 567f |   mov C, [0xff12]
61 80 e0 14 ff                 # 5684 |   mov D, [0xff14]
61 20 bc 0e                    # 5689 |   mov A, [SP + 0xe]
60 ff 00                       # 568d |   mov H, 0
                               #      | _A_if_31:
fc 28 20 f8 09 00              # 5690 |   jge A + B, A, ${_E_if_31}:rel + PC
c4 ff 00                       # 5696 |   inc H, 0
                               #      | _E_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
60 40 44                       # 5699 |   mov B, B + A
81 20 bc ff 0c                 # 569c |   add A, [SP + 0xc], H
60 ff 00                       # 56a1 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 56a4 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 56aa |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 56b0 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 56b4 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 56b7 |   mov C, C + A
81 20 bc ff 0a                 # 56ba |   add A, [SP + 0xa], H
60 80 84                       # 56bf |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 56c2 |   mov A, [SP + 0x10]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
61 ff e0 14 ff                 # 56c6 |   mov H, [0xff14]
                               #      | _A_if_34:
f4 ff 80 f8 0a 00              # 56cb |   jle H, D, ${_E_if_34}:rel + PC
58 f8 33 00                    # 56d1 |   jmp ${_C_loop_4}:rel + PC
                               #      | _E_if_34:
ec ff 80 f8 2b 00              # 56d5 |   jne H, D, ${_E2_if_34}:rel + PC
61 ff e0 12 ff                 # 56db |   mov H, [0xff12]
                               #      | _A_if_35:
f4 ff 60 f8 0a 00              # 56e0 |   jle H, C, ${_E_if_35}:rel + PC
58 f8 1e 00                    # 56e6 |   jmp ${_C_loop_4}:rel + PC
                               #      | _E_if_35:
ec ff 60 f8 16 00              # 56ea |   jne H, C, ${_E2_if_35}:rel + PC
fa e0 40 f8 10 ff 14 00        # 56f0 |   jgt [0xff10], B, ${_C_loop_4}:rel + PC
                               #      | _A_if_37:
e8 20 00 f8 08 00              # 56f8 |   jeq A, 0, ${_E_if_37}:rel + PC
5c 20                          # 56fe |   call A
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _E2_if_35:
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _E2_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
                               #      | _BZ_loop_4:
58 f8 c6 ff                    # 5700 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5704 |   pop A
e4 40                          # 5706 |   pop B
e4 60                          # 5708 |   pop C
e4 80                          # 570a |   pop D
dc                             # 570c |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 570d |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # 5b02 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 5bc2 |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5bfa |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5c22
                               #      | SECTION_BEGIN_static_data:
                               # 5c22 |   .align dummy_size:14 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5c30 |   .bss size:1280 align:16
                               #      | var__rand__state:
                               # 6130 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 6132 |   .bss size:220 align:1
                               #      | var__board__points:
                               # 620e |   .bss size:2 align:1
                               #      | var__board__level:
                               # 6210 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 6212 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 621a |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 6222 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 622a |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 622c |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 622e |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
