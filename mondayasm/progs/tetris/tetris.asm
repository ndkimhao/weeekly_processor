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
e0 e0 4e 55                    # 502f |   push ${fn_handle_keyboard}
e0 e0 e0 93                    # 5033 |   push 0x93e0
e0 1c 04                       # 5037 |   push 0x4
e0 00                          # 503a |   push 0
5c f8 9c 05                    # 503c |   call ${fn__delay_impl}:rel + PC
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
e0 e0 92 60                    # 505b |   push ${var__board__board_state}
5c f8 44 00                    # 505f |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5063 |   mov SP, SP + 0x6
                               #      | _Z_call_1:
62 e0 00 6e 61                 # 5067 |   mov [${var__board__points}], 0
62 e0 00 70 61                 # 506c |   mov [${var__board__level}], 0
62 e0 00 8a 61                 # 5071 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 8c 61                 # 5076 |   mov [${var__board__lines_remaining}], 0
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
ca e0 00 82 61                 # 508d |   dec [${var__board__stored}], 0
62 e0 00 84 61                 # 5092 |   mov [${var__board__stored} + 0002], 0
62 e0 00 86 61                 # 5097 |   mov [${var__board__stored} + 0004], 0
62 e0 1c 80 61 03              # 509c |   mov [${var__board__next} + 0006], 0x3
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
63 e0 bc 90 60 02              # 50dc |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 50e2 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_3:
e0 1c 08                       # 50e3 |   push 0x8
e0 e0 7a 61                    # 50e6 |   push ${var__board__next}
e0 e0 72 61                    # 50ea |   push ${var__board__falling}
5c f8 27 00                    # 50ee |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 50f2 |   mov SP, SP + 0x6
                               #      | _Z_call_3:
                               #      |   # fill new Board.next
                               #      | _A_call_4:
5c f8 58 00                    # 50f6 |   call ${fn_rand}:rel + PC
                               #      | _Z_call_4:
90 fe ff 1c 07                 # 50fa |   div G, H, 0x7
c6 e0 ff 7a 61                 # 50ff |   inc [${var__board__next}], H
62 e0 00 7c 61                 # 5104 |   mov [${var__board__next} + 0002], 0
62 e0 00 7e 61                 # 5109 |   mov [${var__board__next} + 0004], 0
62 e0 1c 80 61 03              # 510e |   mov [${var__board__next} + 0006], 0x3
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
c5 ff e0 90 60                 # 514e |   inc H, [${var__rand__state}]
62 e0 ff 90 60                 # 5153 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5158 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_13:
5c f8 31 00                    # 5159 |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_13:
                               #      | _A_if_11:
e8 ff 00 f8 0a 00              # 515d |   jeq H, 0, ${_E_if_11}:rel + PC
                               #      | _A_call_17:
5c f8 86 01                    # 5163 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_17:
                               #      | _E_if_11:
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _A_call_34:
e2 bc 02                       # 5167 |   push [SP + 0x2]
5c f8 7a 02                    # 516a |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 516e |   mov SP, SP + 0x2
                               #      | _Z_call_34:
                               #      | _A_call_35:
5c f8 71 03                    # 5172 |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_35:
                               #      | _A_call_36:
e0 ff                          # 5176 |   push H
5c f8 6f 03                    # 5178 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 517c |   mov SP, SP + 0x2
                               #      | _Z_call_36:
                               #      | _A_call_39:
5c f8 68 03                    # 5180 |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_39:
84 ff 1c ff 01                 # 5184 |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5189 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 518a |   push A
4a e0 8a 61                    # 518c |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_3:
d2 e0 00 8a 61                 # 5190 |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 54 00                    # 5195 |   jgt ${_E_if_3}:rel + PC
                               #      | _A_call_8:
e0 00                          # 5199 |   push 0
5c f8 54 00                    # 519b |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 519f |   mov SP, SP + 0x2
                               #      | _Z_call_8:
46 e0 76 61                    # 51a3 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_9:
5c f8 bb 00                    # 51a7 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_9:
                               #      | _A_if_10:
ec ff 1c f8 01 19 00           # 51ab |   jne H, 0x1, ${_E_if_10}:rel + PC
a9 20 e0 1c 70 61 01           # 51b2 |   shl A, [${var__board__level}], 0x1
63 e0 e4 8a 61 60 5b           # 51b9 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 51c0 |   jmp ${_C_if_10}:rel + PC
                               #      | _E_if_10:
4a e0 76 61                    # 51c4 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_10:
e0 1c 01                       # 51c8 |   push 0x1
5c f8 24 00                    # 51cb |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 51cf |   mov SP, SP + 0x2
                               #      | _Z_call_10:
                               #      | _A_call_11:
5c f8 10 ff                    # 51d3 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_11:
                               #      | _C_if_10:
                               #      | _Z_if_10:
                               #      | _A_call_12:
e0 1c 01                       # 51d7 |   push 0x1
5c f8 15 00                    # 51da |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 51de |   mov SP, SP + 0x2
                               #      | _Z_call_12:
c4 ff 00                       # 51e2 |   inc H, 0
58 f8 07 00                    # 51e5 |   jmp ${_C_if_3}:rel + PC
                               #      | _E_if_3:
60 ff 00                       # 51e9 |   mov H, 0
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 51ec |   pop A
dc                             # 51ee |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 51ef |   push D
e0 60                          # 51f1 |   push C
e0 40                          # 51f3 |   push B
e0 20                          # 51f5 |   push A
61 20 bc 0a                    # 51f7 |   mov A, [SP + 0xa]
c9 40 e0 72 61                 # 51fb |   dec B, [${var__board__falling}]
a9 80 e0 1c 74 61 01           # 5200 |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 5207 |   mov D, B*8 + D
61 80 f0 28 5b                 # 520a |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_1:
60 60 00                       # 520f |   mov C, 0
                               #      | _BA_for_1:
fc 60 1c f8 04 47 00           # 5212 |   jge C, 0x4, ${_C_for_1}:rel + PC
a0 40 80 7e 02                 # 5219 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 521e |   shr E, D, C*4
2c 40 1c 03                    # 5222 |   and B, 0x3
2c fc 1c 03                    # 5226 |   and E, 0x3
81 fe e0 40 76 61              # 522a |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc 78 61              # 5230 |   add B, [${var__board__falling} + 0006], E
88 fd fe 1c 0a                 # 5236 |   mul F, G, 0xa
00 fd e8 92 60                 # 523b |   add F, ${var__board__board_state} + B
                               #      | _A_if_4:
ee bc 00 f8 0a 0e 00           # 5240 |   jne [SP + 0xa], 0, ${_E_if_4}:rel + PC
66 fd 00                       # 5247 |   bmov [F], 0
58 f8 09 00                    # 524a |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
67 fd e0 72 61                 # 524e |   bmov [F], [${var__board__falling}]
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _BZ_for_1:
44 60                          # 5253 |   inc C
58 f8 bd ff                    # 5255 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 5259 |   pop A
e4 40                          # 525b |   pop B
e4 60                          # 525d |   pop C
e4 80                          # 525f |   pop D
dc                             # 5261 |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 5262 |   push D
e0 60                          # 5264 |   push C
e0 40                          # 5266 |   push B
e0 20                          # 5268 |   push A
c9 40 e0 72 61                 # 526a |   dec B, [${var__board__falling}]
a9 80 e0 1c 74 61 01           # 526f |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 5276 |   mov D, B*8 + D
61 80 f0 28 5b                 # 5279 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_2:
60 60 00                       # 527e |   mov C, 0
                               #      | _BA_for_2:
fc 60 1c f8 04 5c 00           # 5281 |   jge C, 0x4, ${_C_for_2}:rel + PC
a0 20 80 7e 02                 # 5288 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 528d |   shr E, D, C*4
2c 20 1c 03                    # 5291 |   and A, 0x3
2c fc 1c 03                    # 5295 |   and E, 0x3
81 fe e0 20 76 61              # 5299 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc 78 61              # 529f |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 52a5 |   mov H, 0
d0 fe 00                       # 52a8 |   icmp G, 0
70 f8 35 00                    # 52ab |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 52af |   icmp B, 0
70 f8 2e 00                    # 52b2 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2a 00           # 52b6 |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 23 00           # 52bd |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 52c4 |   mul F, G, 0xa
00 fd e8 92 60                 # 52c9 |   add F, ${var__board__board_state} + B
65 fd fd                       # 52ce |   bmov F, [F]
ec fd 00 f8 0f 00              # 52d1 |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_2:
44 60                          # 52d7 |   inc C
58 f8 a8 ff                    # 52d9 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      |   # done checking, all good
c4 ff 00                       # 52dd |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 52e0 |   pop A
e4 40                          # 52e2 |   pop B
e4 60                          # 52e4 |   pop C
e4 80                          # 52e6 |   pop D
dc                             # 52e8 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 52e9 |   push D
e0 60                          # 52eb |   push C
e0 40                          # 52ed |   push B
e0 20                          # 52ef |   push A
                               #      | _A_for_3:
60 20 00                       # 52f1 |   mov A, 0
                               #      | _BA_for_3:
fc 20 1c f8 16 92 00           # 52f4 |   jge A, 0x16, ${_C_for_3}:rel + PC
                               #      | _A_for_4:
c4 60 00                       # 52fb |   inc C, 0
                               #      | _BA_for_4:
fc 60 1c f8 08 82 00           # 52fe |   jge C, 0x8, ${_C_for_4}:rel + PC
                               #      | _A_call_14:
e0 60                          # 5305 |   push C
e0 3c 02                       # 5307 |   push A + 0x2
5c f8 85 00                    # 530a |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 530e |   mov SP, SP + 0x4
                               #      | _Z_call_14:
                               #      | _A_for_5:
60 40 00                       # 5312 |   mov B, 0
                               #      | _BA_for_5:
fc 40 1c f8 0a 63 00           # 5315 |   jge B, 0xa, ${_C_for_5}:rel + PC
88 80 1c 20 0a                 # 531c |   mul D, 0xa, A
80 80 88 e0 92 60              # 5321 |   add D, D + B, ${var__board__board_state}
65 80 80                       # 5327 |   bmov D, [D]
2c 80 60                       # 532a |   and D, C
c4 ff 00                       # 532d |   inc H, 0
                               #      | _A_if_12:
e8 80 00 f8 0a 00              # 5330 |   jeq D, 0, ${_E_if_12}:rel + PC
60 ff 1c ff                    # 5336 |   mov H, -1
                               #      | _E_if_12:
                               #      | _C_if_12:
                               #      | _Z_if_12:
                               #      | _A_if_13:
ec 40 1c f8 09 0c 00           # 533a |   jne B, 0x9, ${_E_if_13}:rel + PC
30 ff e0 00 80                 # 5341 |   or H, 0x8000
                               #      | _E_if_13:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _A_call_15:
e0 ff                          # 5346 |   push H
e0 5c 0a                       # 5348 |   push B + 0xa
5c f8 66 00                    # 534b |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # 534f |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_call_16:
e0 5c 0a                       # 5353 |   push B + 0xa
5c f8 82 00                    # 5356 |   call ${fn_get_cell_addr}:rel + PC
60 a0 bc 02                    # 535a |   mov SP, SP + 0x2
                               #      | _Z_call_16:
62 ff 1c ff                    # 535e |   mov [H], -1
                               #      | _A_if_14:
ec 20 1c f8 15 10 00           # 5362 |   jne A, 0x15, ${_E_if_14}:rel + PC
00 ff e0 b0 04                 # 5369 |   add H, 0x4b0
62 ff 1c ff                    # 536e |   mov [H], -1
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
                               #      | _BZ_for_5:
44 40                          # 5372 |   inc B
58 f8 a1 ff                    # 5374 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _BZ_for_4:
28 60 1c 01                    # 5378 |   shl C, 0x1
58 f8 82 ff                    # 537c |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _BZ_for_3:
44 20                          # 5380 |   inc A
58 f8 72 ff                    # 5382 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_display_board:
e4 20                          # 5386 |   pop A
e4 40                          # 5388 |   pop B
e4 60                          # 538a |   pop C
e4 80                          # 538c |   pop D
dc                             # 538e |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # 538f |   push B
e0 20                          # 5391 |   push A
61 20 bc 08                    # 5393 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 5397 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 539c |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 90 5b 8f 60 01     # 53a3 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # 53ac |   pop A
e4 40                          # 53ae |   pop B
dc                             # 53b0 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # 53b1 |   push A
61 fe bc 06                    # 53b3 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # 53b7 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_6:
60 20 e4 90 5b                 # 53bd |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_6:
fc 20 e0 f8 90 60 13 00        # 53c2 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_6}:rel + PC
62 20 fe                       # 53ca |   mov [A], G
                               #      | _BZ_for_6:
60 20 3c 50                    # 53cd |   mov A, A + 0x50
58 f8 f1 ff                    # 53d1 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # 53d5 |   pop A
dc                             # 53d7 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_get_cell_addr:
                               #      | _begin_fn_get_cell_addr:
a9 ff bc 1c 02 01              # 53d8 |   shl H, [SP + 0x2], 0x1
00 ff e0 90 5b                 # 53de |   add H, ${var__VIDEO_ROW_BUFFER}
                               #      | _cleanup_fn_get_cell_addr:
dc                             # 53e3 |   ret
                               #      | _end_fn_get_cell_addr:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 53e4 |   push A
61 20 bc 04                    # 53e6 |   mov A, [SP + 0x4]
                               #      | _A_if_15:
ec 20 1c f8 01 16 00           # 53ea |   jne A, 0x1, ${_E_if_15}:rel + PC
                               #      | _A_call_21:
e0 1c ff                       # 53f1 |   push -1
5c f8 3f 00                    # 53f4 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 53f8 |   mov SP, SP + 0x2
                               #      | _Z_call_21:
58 f8 34 00                    # 53fc |   jmp ${_C_if_15}:rel + PC
                               #      | _E_if_15:
ec 20 1c f8 02 16 00           # 5400 |   jne A, 0x2, ${_E2_if_15}:rel + PC
                               #      | _A_call_22:
e0 1c 01                       # 5407 |   push 0x1
5c f8 29 00                    # 540a |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 540e |   mov SP, SP + 0x2
                               #      | _Z_call_22:
58 f8 1e 00                    # 5412 |   jmp ${_C_if_15}:rel + PC
                               #      | _E2_if_15:
ec 20 1c f8 04 0f 00           # 5416 |   jne A, 0x4, ${_E3_if_15}:rel + PC
                               #      | _A_call_27:
5c f8 42 00                    # 541d |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_27:
58 f8 0f 00                    # 5421 |   jmp ${_C_if_15}:rel + PC
                               #      | _E3_if_15:
ec 20 1c f8 03 0b 00           # 5425 |   jne A, 0x3, ${_E4_if_15}:rel + PC
                               #      | _A_call_33:
5c f8 63 00                    # 542c |   call ${fn_tg_rotate}:rel + PC
                               #      | _Z_call_33:
                               #      | _E4_if_15:
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 5430 |   pop A
dc                             # 5432 |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_18:
e0 00                          # 5433 |   push 0
5c f8 ba fd                    # 5435 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5439 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
03 e0 bc 78 61 02              # 543d |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_19:
5c f8 1f fe                    # 5443 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_19:
                               #      | _A_if_16:
ec ff 00 f8 0c 00              # 5447 |   jne H, 0, ${_E_if_16}:rel + PC
07 e0 bc 78 61 02              # 544d |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _A_call_20:
e0 1c 01                       # 5453 |   push 0x1
5c f8 99 fd                    # 5456 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 545a |   mov SP, SP + 0x2
                               #      | _Z_call_20:
                               #      | _cleanup_fn_tg_move:
dc                             # 545e |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_23:
e0 00                          # 545f |   push 0
5c f8 8e fd                    # 5461 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5465 |   mov SP, SP + 0x2
                               #      | _Z_call_23:
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
46 e0 76 61                    # 5469 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_24:
5c f8 f5 fd                    # 546d |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_24:
e8 ff 00 f8 0a 00              # 5471 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f2 ff                    # 5477 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
4a e0 76 61                    # 547b |   dec [${var__board__falling} + 0004]
                               #      | _A_call_25:
e0 1c 01                       # 547f |   push 0x1
5c f8 6d fd                    # 5482 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5486 |   mov SP, SP + 0x2
                               #      | _Z_call_25:
                               #      | _A_call_26:
5c f8 59 fc                    # 548a |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_26:
                               #      | _cleanup_fn_tg_down:
dc                             # 548e |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_28:
e0 00                          # 548f |   push 0
5c f8 5e fd                    # 5491 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5495 |   mov SP, SP + 0x2
                               #      | _Z_call_28:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
c5 ff e0 74 61                 # 5499 |   inc H, [${var__board__falling} + 0002]
2c ff 1c 03                    # 549e |   and H, 0x3
62 e0 ff 74 61                 # 54a2 |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_29:
5c f8 bb fd                    # 54a7 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_29:
ec ff 00 f8 2c 00              # 54ab |   jne H, 0, ${_C_loop_2}:rel + PC
4a e0 78 61                    # 54b1 |   dec [${var__board__falling} + 0006]
                               #      | _A_call_30:
5c f8 ad fd                    # 54b5 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_30:
ec ff 00 f8 1e 00              # 54b9 |   jne H, 0, ${_C_loop_2}:rel + PC
02 e0 1c 78 61 02              # 54bf |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_31:
5c f8 9d fd                    # 54c5 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_31:
ec ff 00 f8 0e 00              # 54c9 |   jne H, 0, ${_C_loop_2}:rel + PC
4a e0 78 61                    # 54cf |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_2:
58 f8 c6 ff                    # 54d3 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _A_call_32:
e0 1c 01                       # 54d7 |   push 0x1
5c f8 15 fd                    # 54da |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54de |   mov SP, SP + 0x2
                               #      | _Z_call_32:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 54e2 |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 54e3 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 54e6 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 54e7 |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 54e8 |   push D
e0 60                          # 54ea |   push C
e0 40                          # 54ec |   push B
e0 20                          # 54ee |   push A
60 60 00                       # 54f0 |   mov C, 0
                               #      | _A_call_37:
e0 00                          # 54f3 |   push 0
5c f8 fa fc                    # 54f5 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54f9 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
                               #      | _A_for_7:
60 20 00                       # 54fd |   mov A, 0
                               #      | _BA_for_7:
fc 20 1c f8 02 37 00           # 5500 |   jge A, 0x2, ${_C_for_7}:rel + PC
                               #      | _A_for_8:
60 40 00                       # 5507 |   mov B, 0
                               #      | _BA_for_8:
fc 40 1c f8 0a 27 00           # 550a |   jge B, 0xa, ${_C_for_8}:rel + PC
88 80 20 1c 0a                 # 5511 |   mul D, A, 0xa
00 80 e8 92 60                 # 5516 |   add D, ${var__board__board_state} + B
65 ff 80                       # 551b |   bmov H, [D]
                               #      | _A_if_21:
e8 ff 00 f8 0d 00              # 551e |   jeq H, 0, ${_E_if_21}:rel + PC
c4 60 00                       # 5524 |   inc C, 0
58 f8 10 00                    # 5527 |   jmp ${_C_for_7}:rel + PC
                               #      | _E_if_21:
                               #      | _C_if_21:
                               #      | _Z_if_21:
                               #      | _BZ_for_8:
44 40                          # 552b |   inc B
58 f8 dd ff                    # 552d |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _BZ_for_7:
44 20                          # 5531 |   inc A
58 f8 cd ff                    # 5533 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _A_call_38:
e0 1c 01                       # 5537 |   push 0x1
5c f8 b5 fc                    # 553a |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 553e |   mov SP, SP + 0x2
                               #      | _Z_call_38:
60 ff 60                       # 5542 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 5545 |   pop A
e4 40                          # 5547 |   pop B
e4 60                          # 5549 |   pop C
e4 80                          # 554b |   pop D
dc                             # 554d |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 fe e0 06 ff                 # 554e |   mov G, [0xff06]
ac ff fe e0 00 80              # 5553 |   and H, G, 0x8000
e8 ff 00 f8 7e 00              # 5559 |   jeq H, 0, ${_C_loop_3}:rel + PC
a9 ff e0 1c 8e 61 08           # 555f |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 5566 |   and G, 0xff
30 ff fe                       # 556b |   or H, G
62 e0 ff 8e 61                 # 556e |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5573 |   shr G, H, 0x8
2c ff e0 ff 00                 # 5578 |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 557d |   jeq G, 0xf0, ${_BA_loop_3}:rel + PC
60 fe 00                       # 5585 |   mov G, 0
                               #      | _A_if_24:
ec ff 1c f8 75 0f 00           # 5588 |   jne H, 0x75, ${_E_if_24}:rel + PC
60 fe 1c 03                    # 558f |   mov G, 0x3
58 f8 2c 00                    # 5593 |   jmp ${_C_if_24}:rel + PC
                               #      | _E_if_24:
ec ff 1c f8 74 0f 00           # 5597 |   jne H, 0x74, ${_E2_if_24}:rel + PC
60 fe 1c 02                    # 559e |   mov G, 0x2
58 f8 1d 00                    # 55a2 |   jmp ${_C_if_24}:rel + PC
                               #      | _E2_if_24:
ec ff 1c f8 6b 0e 00           # 55a6 |   jne H, 0x6b, ${_E3_if_24}:rel + PC
c4 fe 00                       # 55ad |   inc G, 0
58 f8 0f 00                    # 55b0 |   jmp ${_C_if_24}:rel + PC
                               #      | _E3_if_24:
ec ff 1c f8 72 0b 00           # 55b4 |   jne H, 0x72, ${_E4_if_24}:rel + PC
60 fe 1c 04                    # 55bb |   mov G, 0x4
                               #      | _E4_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
                               #      | _A_if_25:
e8 fe 00 f8 14 00              # 55bf |   jeq G, 0, ${_E_if_25}:rel + PC
                               #      | _A_call_41:
e0 fe                          # 55c5 |   push G
5c f8 1d fe                    # 55c7 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 55cb |   mov SP, SP + 0x2
                               #      | _Z_call_41:
                               #      | _A_call_42:
5c f8 1a fd                    # 55cf |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_42:
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _BZ_loop_3:
58 f8 7b ff                    # 55d3 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _cleanup_fn_handle_keyboard:
dc                             # 55d7 |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 55d8 |   push D
e0 60                          # 55da |   push C
e0 40                          # 55dc |   push B
e0 20                          # 55de |   push A
61 40 e0 10 ff                 # 55e0 |   mov B, [0xff10]
61 60 e0 12 ff                 # 55e5 |   mov C, [0xff12]
61 80 e0 14 ff                 # 55ea |   mov D, [0xff14]
61 20 bc 0e                    # 55ef |   mov A, [SP + 0xe]
60 ff 00                       # 55f3 |   mov H, 0
                               #      | _A_if_26:
fc 28 20 f8 09 00              # 55f6 |   jge A + B, A, ${_E_if_26}:rel + PC
c4 ff 00                       # 55fc |   inc H, 0
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
60 40 44                       # 55ff |   mov B, B + A
81 20 bc ff 0c                 # 5602 |   add A, [SP + 0xc], H
60 ff 00                       # 5607 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 560a |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 5610 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 5616 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 561a |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 561d |   mov C, C + A
81 20 bc ff 0a                 # 5620 |   add A, [SP + 0xa], H
60 80 84                       # 5625 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 5628 |   mov A, [SP + 0x10]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
61 ff e0 14 ff                 # 562c |   mov H, [0xff14]
                               #      | _A_if_29:
f4 ff 80 f8 0a 00              # 5631 |   jle H, D, ${_E_if_29}:rel + PC
58 f8 33 00                    # 5637 |   jmp ${_C_loop_4}:rel + PC
                               #      | _E_if_29:
ec ff 80 f8 2b 00              # 563b |   jne H, D, ${_E2_if_29}:rel + PC
61 ff e0 12 ff                 # 5641 |   mov H, [0xff12]
                               #      | _A_if_30:
f4 ff 60 f8 0a 00              # 5646 |   jle H, C, ${_E_if_30}:rel + PC
58 f8 1e 00                    # 564c |   jmp ${_C_loop_4}:rel + PC
                               #      | _E_if_30:
ec ff 60 f8 16 00              # 5650 |   jne H, C, ${_E2_if_30}:rel + PC
fa e0 40 f8 10 ff 14 00        # 5656 |   jgt [0xff10], B, ${_C_loop_4}:rel + PC
                               #      | _A_if_32:
e8 20 00 f8 08 00              # 565e |   jeq A, 0, ${_E_if_32}:rel + PC
5c 20                          # 5664 |   call A
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _E2_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
                               #      | _E2_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _BZ_loop_4:
58 f8 c6 ff                    # 5666 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 566a |   pop A
e4 40                          # 566c |   pop B
e4 60                          # 566e |   pop C
e4 80                          # 5670 |   pop D
dc                             # 5672 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 5673 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # 5a68 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 5b28 |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5b60 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5b88
                               #      | SECTION_BEGIN_static_data:
                               # 5b88 |   .align dummy_size:8 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5b90 |   .bss size:1280 align:16
                               #      | var__rand__state:
                               # 6090 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 6092 |   .bss size:220 align:1
                               #      | var__board__points:
                               # 616e |   .bss size:2 align:1
                               #      | var__board__level:
                               # 6170 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 6172 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 617a |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 6182 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 618a |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 618c |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 618e |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
