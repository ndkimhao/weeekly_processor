                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_52:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_52:
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
                               #      | _A_call_48:
e2 a0                          # 5021 |   push [SP]
5c f8 36 01                    # 5023 |   call ${fn_tg_tick}:rel + PC
60 a0 bc 02                    # 5027 |   mov SP, SP + 0x2
                               #      | _Z_call_48:
62 bc ff 02                    # 502b |   mov [SP + 0x2], H
                               #      | _A_call_51:
e0 e0 74 57                    # 502f |   push ${fn_handle_keyboard}
e0 e0 c0 27                    # 5033 |   push 0x27c0
e0 1c 09                       # 5037 |   push 0x9
e0 00                          # 503a |   push 0
5c f8 c2 07                    # 503c |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5040 |   mov SP, SP + 0x8
                               #      | _Z_call_51:
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
e0 e0 02 63                    # 505b |   push ${var__board__board_state}
5c f8 44 00                    # 505f |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5063 |   mov SP, SP + 0x6
                               #      | _Z_call_1:
62 e0 00 de 63                 # 5067 |   mov [${var__board__points}], 0
62 e0 00 e0 63                 # 506c |   mov [${var__board__level}], 0
62 e0 00 fa 63                 # 5071 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 fc 63                 # 5076 |   mov [${var__board__lines_remaining}], 0
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
ca e0 00 f2 63                 # 508d |   dec [${var__board__stored}], 0
62 e0 00 f4 63                 # 5092 |   mov [${var__board__stored} + 0002], 0
62 e0 00 f6 63                 # 5097 |   mov [${var__board__stored} + 0004], 0
62 e0 1c f0 63 03              # 509c |   mov [${var__board__next} + 0006], 0x3
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
63 e0 bc 00 63 02              # 50dc |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 50e2 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_3:
e0 1c 08                       # 50e3 |   push 0x8
e0 e0 ea 63                    # 50e6 |   push ${var__board__next}
e0 e0 e2 63                    # 50ea |   push ${var__board__falling}
5c f8 27 00                    # 50ee |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 50f2 |   mov SP, SP + 0x6
                               #      | _Z_call_3:
                               #      |   # fill new Board.next
                               #      | _A_call_4:
5c f8 58 00                    # 50f6 |   call ${fn_rand}:rel + PC
                               #      | _Z_call_4:
90 fe ff 1c 07                 # 50fa |   div G, H, 0x7
c6 e0 ff ea 63                 # 50ff |   inc [${var__board__next}], H
62 e0 00 ec 63                 # 5104 |   mov [${var__board__next} + 0002], 0
62 e0 00 ee 63                 # 5109 |   mov [${var__board__next} + 0004], 0
62 e0 1c f0 63 03              # 510e |   mov [${var__board__next} + 0006], 0x3
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
c5 ff e0 00 63                 # 514e |   inc H, [${var__rand__state}]
62 e0 ff 00 63                 # 5153 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5158 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_26:
5c f8 31 00                    # 5159 |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_26:
                               #      | _A_if_22:
e8 ff 00 f8 0a 00              # 515d |   jeq H, 0, ${_E_if_22}:rel + PC
                               #      | _A_call_30:
5c f8 db 03                    # 5163 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_30:
                               #      | _E_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _A_call_42:
e2 bc 02                       # 5167 |   push [SP + 0x2]
5c f8 b3 04                    # 516a |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 516e |   mov SP, SP + 0x2
                               #      | _Z_call_42:
                               #      | _A_call_43:
5c f8 87 05                    # 5172 |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_43:
                               #      | _A_call_44:
e0 ff                          # 5176 |   push H
5c f8 85 05                    # 5178 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 517c |   mov SP, SP + 0x2
                               #      | _Z_call_44:
                               #      | _A_call_47:
5c f8 7e 05                    # 5180 |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_47:
84 ff 1c ff 01                 # 5184 |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5189 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 518a |   push A
4a e0 fa 63                    # 518c |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_3:
d2 e0 00 fa 63                 # 5190 |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 7e 00                    # 5195 |   jgt ${_E_if_3}:rel + PC
                               #      | _A_call_8:
e0 fd                          # 5199 |   push F
e0 fc                          # 519b |   push E
e0 00                          # 519d |   push 0
5c f8 7a 00                    # 519f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 51a3 |   mov SP, SP + 0x2
e4 fc                          # 51a7 |   pop E
e4 fd                          # 51a9 |   pop F
                               #      | _Z_call_8:
46 e0 e6 63                    # 51ab |   inc [${var__board__falling} + 0004]
                               #      | _A_call_21:
e0 fd                          # 51af |   push F
e0 fc                          # 51b1 |   push E
5c f8 d5 00                    # 51b3 |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 51b7 |   pop E
e4 fd                          # 51b9 |   pop F
                               #      | _Z_call_21:
                               #      | _A_if_21:
ec ff 1c f8 01 17 00           # 51bb |   jne H, 0x1, ${_E_if_21}:rel + PC
61 20 e0 e0 63                 # 51c2 |   mov A, [${var__board__level}]
63 e0 e4 fa 63 86 5d           # 51c7 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 2b 00                    # 51ce |   jmp ${_C_if_21}:rel + PC
                               #      | _E_if_21:
                               #      | _A_call_22:
e0 e0 eb 5d                    # 51d2 |   push ${const__data_3}
5c f8 81 01                    # 51d6 |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # 51da |   mov SP, SP + 0x2
                               #      | _Z_call_22:
4a e0 e6 63                    # 51de |   dec [${var__board__falling} + 0004]
                               #      | _A_call_23:
e0 fd                          # 51e2 |   push F
e0 fc                          # 51e4 |   push E
e0 1c 01                       # 51e6 |   push 0x1
5c f8 30 00                    # 51e9 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 51ed |   mov SP, SP + 0x2
e4 fc                          # 51f1 |   pop E
e4 fd                          # 51f3 |   pop F
                               #      | _Z_call_23:
                               #      | _A_call_24:
5c f8 ee fe                    # 51f5 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_24:
                               #      | _C_if_21:
                               #      | _Z_if_21:
                               #      | _A_call_25:
e0 fd                          # 51f9 |   push F
e0 fc                          # 51fb |   push E
e0 1c 01                       # 51fd |   push 0x1
5c f8 19 00                    # 5200 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5204 |   mov SP, SP + 0x2
e4 fc                          # 5208 |   pop E
e4 fd                          # 520a |   pop F
                               #      | _Z_call_25:
c4 ff 00                       # 520c |   inc H, 0
58 f8 07 00                    # 520f |   jmp ${_C_if_3}:rel + PC
                               #      | _E_if_3:
60 ff 00                       # 5213 |   mov H, 0
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 5216 |   pop A
dc                             # 5218 |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 5219 |   push D
e0 60                          # 521b |   push C
e0 40                          # 521d |   push B
e0 20                          # 521f |   push A
61 20 bc 0a                    # 5221 |   mov A, [SP + 0xa]
c9 40 e0 e2 63                 # 5225 |   dec B, [${var__board__falling}]
81 80 e0 43 e4 63              # 522a |   add D, [${var__board__falling} + 0002], B*8
61 80 f0 4e 5d                 # 5230 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_1:
60 60 00                       # 5235 |   mov C, 0
                               #      | _BA_for_1:
fc 60 1c f8 04 47 00           # 5238 |   jge C, 0x4, ${_C_for_1}:rel + PC
a0 40 80 7e 02                 # 523f |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 5244 |   shr E, D, C*4
2c 40 1c 03                    # 5248 |   and B, 0x3
2c fc 1c 03                    # 524c |   and E, 0x3
81 fe e0 40 e6 63              # 5250 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc e8 63              # 5256 |   add B, [${var__board__falling} + 0006], E
88 fd fe 1c 0a                 # 525c |   mul F, G, 0xa
00 fd e8 02 63                 # 5261 |   add F, ${var__board__board_state} + B
                               #      | _A_if_4:
ee bc 00 f8 0a 0e 00           # 5266 |   jne [SP + 0xa], 0, ${_E_if_4}:rel + PC
66 fd 00                       # 526d |   bmov [F], 0
58 f8 09 00                    # 5270 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
67 fd e0 e2 63                 # 5274 |   bmov [F], [${var__board__falling}]
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _BZ_for_1:
44 60                          # 5279 |   inc C
58 f8 bd ff                    # 527b |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 527f |   pop A
e4 40                          # 5281 |   pop B
e4 60                          # 5283 |   pop C
e4 80                          # 5285 |   pop D
dc                             # 5287 |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 5288 |   push D
e0 60                          # 528a |   push C
e0 40                          # 528c |   push B
e0 20                          # 528e |   push A
c9 40 e0 e2 63                 # 5290 |   dec B, [${var__board__falling}]
81 80 e0 43 e4 63              # 5295 |   add D, [${var__board__falling} + 0002], B*8
61 80 f0 4e 5d                 # 529b |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_call_19:
e2 e0 e8 63                    # 52a0 |   push [${var__board__falling} + 0006]
e2 e0 e6 63                    # 52a4 |   push [${var__board__falling} + 0004]
e2 e0 e4 63                    # 52a8 |   push [${var__board__falling} + 0002]
e2 e0 e2 63                    # 52ac |   push [${var__board__falling}]
e0 e0 ae 5d                    # 52b0 |   push ${const__data_1}
5c f8 a3 00                    # 52b4 |   call ${fn_printf}:rel + PC
60 a0 bc 0a                    # 52b8 |   mov SP, SP + 0xa
                               #      | _Z_call_19:
                               #      | _A_for_6:
60 60 00                       # 52bc |   mov C, 0
                               #      | _BA_for_6:
fc 60 1c f8 04 8c 00           # 52bf |   jge C, 0x4, ${_C_for_6}:rel + PC
a0 20 80 7e 02                 # 52c6 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 52cb |   shr E, D, C*4
2c 20 1c 03                    # 52cf |   and A, 0x3
2c fc 1c 03                    # 52d3 |   and E, 0x3
81 fe e0 20 e6 63              # 52d7 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc e8 63              # 52dd |   add B, [${var__board__falling} + 0006], E
                               #      | _A_call_20:
e0 40                          # 52e3 |   push B
e0 fe                          # 52e5 |   push G
e2 e0 e8 63                    # 52e7 |   push [${var__board__falling} + 0006]
e2 e0 e6 63                    # 52eb |   push [${var__board__falling} + 0004]
e0 fc                          # 52ef |   push E
e0 20                          # 52f1 |   push A
e0 e0 cd 5d                    # 52f3 |   push ${const__data_2}
5c f8 60 00                    # 52f7 |   call ${fn_printf}:rel + PC
60 a0 bc 0e                    # 52fb |   mov SP, SP + 0xe
                               #      | _Z_call_20:
                               #      |   # check if out of board area
60 ff 00                       # 52ff |   mov H, 0
                               #      | _A_if_12:
d0 fe 00                       # 5302 |   icmp G, 0
7c f8 08 00                    # 5305 |   jge ${_E_if_12}:rel + PC
58 f8 45 00                    # 5309 |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_12:
                               #      | _C_if_12:
                               #      | _Z_if_12:
                               #      | _A_if_14:
d0 40 00                       # 530d |   icmp B, 0
7c f8 08 00                    # 5310 |   jge ${_E_if_14}:rel + PC
58 f8 3a 00                    # 5314 |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
                               #      | _A_if_16:
f0 fe 1c f8 16 0b 00           # 5318 |   jlt G, 0x16, ${_E_if_16}:rel + PC
58 f8 2f 00                    # 531f |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _A_if_18:
f0 40 1c f8 0a 0b 00           # 5323 |   jlt B, 0xa, ${_E_if_18}:rel + PC
58 f8 24 00                    # 532a |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_18:
                               #      | _C_if_18:
                               #      | _Z_if_18:
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 532e |   mul F, G, 0xa
00 fd e8 02 63                 # 5333 |   add F, ${var__board__board_state} + B
65 fd fd                       # 5338 |   bmov F, [F]
                               #      | _A_if_20:
e8 fd 00 f8 0a 00              # 533b |   jeq F, 0, ${_E_if_20}:rel + PC
58 f8 0d 00                    # 5341 |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_20:
                               #      | _C_if_20:
                               #      | _Z_if_20:
                               #      | _BZ_for_6:
44 60                          # 5345 |   inc C
58 f8 78 ff                    # 5347 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      |   # done checking, all good
c4 ff 00                       # 534b |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 534e |   pop A
e4 40                          # 5350 |   pop B
e4 60                          # 5352 |   pop C
e4 80                          # 5354 |   pop D
dc                             # 5356 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # 5357 |   push C
e0 40                          # 5359 |   push B
e0 20                          # 535b |   push A
60 a0 bc ee                    # 535d |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # 5361 |   mov B, SP + 0x1c
                               #      | _A_for_2:
61 20 bc 1a                    # 5365 |   mov A, [SP + 0x1a]
                               #      | _BA_for_2:
65 60 20                       # 5369 |   bmov C, [A]
e8 60 00 f8 b5 00              # 536c |   jeq C, 0, ${_C_for_2}:rel + PC
                               #      |   # normal char
                               #      | _A_if_6:
e8 60 1c f8 25 15 00           # 5372 |   jeq C, 0x25, ${_E_if_6}:rel + PC
                               #      | _A_call_9:
e0 60                          # 5379 |   push C
5c f8 b1 00                    # 537b |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 537f |   mov SP, SP + 0x2
                               #      | _Z_call_9:
58 f8 98 00                    # 5383 |   jmp ${_BZ_for_2}:rel + PC
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      |   # format specifier
44 20                          # 5387 |   inc A
65 60 20                       # 5389 |   bmov C, [A]
                               #      | _A_if_8:
ec 60 00 f8 0e 00              # 538c |   jne C, 0, ${_E_if_8}:rel + PC
58 f8 8f 00                    # 5392 |   jmp ${_C_for_2}:rel + PC
58 f8 85 00                    # 5396 |   jmp ${_C_if_8}:rel + PC
                               #      | _E_if_8:
ec 60 1c f8 64 25 00           # 539a |   jne C, 0x64, ${_E2_if_8}:rel + PC
                               #      |   # format %d
                               #      | _A_call_10:
e0 a0                          # 53a1 |   push SP
e2 40                          # 53a3 |   push [B]
5c f8 9f 00                    # 53a5 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # 53a9 |   mov SP, SP + 0x4
                               #      | _Z_call_10:
                               #      | _A_call_12:
e0 a0                          # 53ad |   push SP
5c f8 e2 00                    # 53af |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 53b3 |   mov SP, SP + 0x2
                               #      | _Z_call_12:
60 40 5c 02                    # 53b7 |   mov B, B + 0x2
58 f8 60 00                    # 53bb |   jmp ${_C_if_8}:rel + PC
                               #      | _E2_if_8:
ec 60 1c f8 78 25 00           # 53bf |   jne C, 0x78, ${_E3_if_8}:rel + PC
                               #      |   # format %x
                               #      | _A_call_14:
e0 a0                          # 53c6 |   push SP
e2 40                          # 53c8 |   push [B]
5c f8 e9 00                    # 53ca |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 53ce |   mov SP, SP + 0x4
                               #      | _Z_call_14:
                               #      | _A_call_15:
e0 a0                          # 53d2 |   push SP
5c f8 bd 00                    # 53d4 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 53d8 |   mov SP, SP + 0x2
                               #      | _Z_call_15:
60 40 5c 02                    # 53dc |   mov B, B + 0x2
58 f8 3b 00                    # 53e0 |   jmp ${_C_if_8}:rel + PC
                               #      | _E3_if_8:
ec 60 1c f8 62 25 00           # 53e4 |   jne C, 0x62, ${_E4_if_8}:rel + PC
                               #      |   # format %b
                               #      | _A_call_16:
e0 a0                          # 53eb |   push SP
e2 40                          # 53ed |   push [B]
5c f8 1a 01                    # 53ef |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # 53f3 |   mov SP, SP + 0x4
                               #      | _Z_call_16:
                               #      | _A_call_17:
e0 a0                          # 53f7 |   push SP
5c f8 98 00                    # 53f9 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 53fd |   mov SP, SP + 0x2
                               #      | _Z_call_17:
60 40 5c 02                    # 5401 |   mov B, B + 0x2
58 f8 16 00                    # 5405 |   jmp ${_C_if_8}:rel + PC
                               #      | _E4_if_8:
ec 60 1c f8 25 12 00           # 5409 |   jne C, 0x25, ${_E5_if_8}:rel + PC
                               #      |   # format %%
                               #      | _A_call_18:
e0 1c 25                       # 5410 |   push 0x25
5c f8 19 00                    # 5413 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 5417 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
                               #      | _E5_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _BZ_for_2:
44 20                          # 541b |   inc A
58 f8 4c ff                    # 541d |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # 5421 |   mov SP, SP + 0x12
e4 20                          # 5425 |   pop A
e4 40                          # 5427 |   pop B
e4 60                          # 5429 |   pop C
dc                             # 542b |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # 542c |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # 5433 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # 5439 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # 543d |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # 5443 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # 5444 |   push C
e0 40                          # 5446 |   push B
e0 20                          # 5448 |   push A
61 20 bc 0a                    # 544a |   mov A, [SP + 0xa]
62 20 1c 30                    # 544e |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # 5452 |   mov B, [SP + 0x8]
                               #      | _A_while_4:
                               #      | _BA_while_4:
e8 40 00 f8 19 00              # 5456 |   jeq B, 0, ${_C_while_4}:rel + PC
90 60 40 1c 0a                 # 545c |   div C, B, 0xa
82 20 ff 1c 30                 # 5461 |   add [A], H, 0x30
44 20                          # 5466 |   inc A
60 40 60                       # 5468 |   mov B, C
                               #      | _BZ_while_4:
58 f8 eb ff                    # 546b |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      |   # reverse the string
61 60 bc 0a                    # 546f |   mov C, [SP + 0xa]
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 60 20 f8 17 00              # 5473 |   jge C, A, ${_C_while_5}:rel + PC
48 20                          # 5479 |   dec A
61 40 60                       # 547b |   mov B, [C]
67 60 20                       # 547e |   bmov [C], [A]
66 20 40                       # 5481 |   bmov [A], B
44 60                          # 5484 |   inc C
                               #      | _BZ_while_5:
58 f8 ed ff                    # 5486 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # 548a |   pop A
e4 40                          # 548c |   pop B
e4 60                          # 548e |   pop C
dc                             # 5490 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # 5491 |   push A
                               #      | _A_for_3:
61 20 bc 04                    # 5493 |   mov A, [SP + 0x4]
                               #      | _BA_for_3:
65 ff 20                       # 5497 |   bmov H, [A]
e8 ff 00 f8 16 00              # 549a |   jeq H, 0, ${_C_for_3}:rel + PC
                               #      | _A_call_11:
e0 ff                          # 54a0 |   push H
5c f8 8a ff                    # 54a2 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 54a6 |   mov SP, SP + 0x2
                               #      | _Z_call_11:
                               #      | _BZ_for_3:
44 20                          # 54aa |   inc A
58 f8 eb ff                    # 54ac |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_puts:
e4 20                          # 54b0 |   pop A
dc                             # 54b2 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # 54b3 |   push C
e0 40                          # 54b5 |   push B
e0 20                          # 54b7 |   push A
61 40 bc 08                    # 54b9 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 54bd |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 03                    # 54c1 |   mov A, 0x3
                               #      | _BA_for_4:
e8 20 1c f8 ff 24 00           # 54c5 |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 22                    # 54cc |   shr H, B, A*4
2c ff 1c 0f                    # 54d0 |   and H, 0xf
                               #      | _A_call_13:
e0 ff                          # 54d4 |   push H
5c f8 1a 00                    # 54d6 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # 54da |   mov SP, SP + 0x2
                               #      | _Z_call_13:
62 60 ff                       # 54de |   mov [C], H
44 60                          # 54e1 |   inc C
                               #      | _BZ_for_4:
48 20                          # 54e3 |   dec A
58 f8 e0 ff                    # 54e5 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # 54e9 |   pop A
e4 40                          # 54eb |   pop B
e4 60                          # 54ed |   pop C
dc                             # 54ef |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_10:
fa bc 1c f8 02 09 12 00        # 54f0 |   jgt [SP + 0x2], 0x9, ${_E_if_10}:rel + PC
81 ff bc 1c 02 30              # 54f8 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # 54fe |   jmp ${_C_if_10}:rel + PC
                               #      | _E_if_10:
81 ff bc 1c 02 57              # 5502 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_10:
                               #      | _Z_if_10:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # 5508 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # 5509 |   push C
e0 40                          # 550b |   push B
e0 20                          # 550d |   push A
61 40 bc 08                    # 550f |   mov B, [SP + 0x8]
61 60 bc 0a                    # 5513 |   mov C, [SP + 0xa]
                               #      | _A_for_5:
60 20 1c 0f                    # 5517 |   mov A, 0xf
                               #      | _BA_for_5:
e8 20 1c f8 ff 1c 00           # 551b |   jeq A, -1, ${_C_for_5}:rel + PC
a0 ff 40 20                    # 5522 |   shr H, B, A
2c ff 1c 01                    # 5526 |   and H, 0x1
82 60 ff 1c 30                 # 552a |   add [C], H, 0x30
44 60                          # 552f |   inc C
                               #      | _BZ_for_5:
48 20                          # 5531 |   dec A
58 f8 e8 ff                    # 5533 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # 5537 |   pop A
e4 40                          # 5539 |   pop B
e4 60                          # 553b |   pop C
dc                             # 553d |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 553e |   push D
e0 60                          # 5540 |   push C
e0 40                          # 5542 |   push B
e0 20                          # 5544 |   push A
                               #      | _A_for_7:
60 20 00                       # 5546 |   mov A, 0
                               #      | _BA_for_7:
fc 20 1c f8 16 76 00           # 5549 |   jge A, 0x16, ${_C_for_7}:rel + PC
                               #      | _A_for_8:
c4 60 00                       # 5550 |   inc C, 0
                               #      | _BA_for_8:
fc 60 1c f8 08 66 00           # 5553 |   jge C, 0x8, ${_C_for_8}:rel + PC
                               #      | _A_call_27:
e0 60                          # 555a |   push C
e0 3c 02                       # 555c |   push A + 0x2
5c f8 69 00                    # 555f |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 5563 |   mov SP, SP + 0x4
                               #      | _Z_call_27:
                               #      | _A_for_9:
60 40 00                       # 5567 |   mov B, 0
                               #      | _BA_for_9:
fc 40 1c f8 0a 47 00           # 556a |   jge B, 0xa, ${_C_for_9}:rel + PC
88 80 1c 20 0a                 # 5571 |   mul D, 0xa, A
80 80 88 e0 02 63              # 5576 |   add D, D + B, ${var__board__board_state}
65 80 80                       # 557c |   bmov D, [D]
2c 80 60                       # 557f |   and D, C
c4 ff 00                       # 5582 |   inc H, 0
                               #      | _A_if_23:
e8 80 00 f8 0a 00              # 5585 |   jeq D, 0, ${_E_if_23}:rel + PC
60 ff 1c ff                    # 558b |   mov H, -1
                               #      | _E_if_23:
                               #      | _C_if_23:
                               #      | _Z_if_23:
                               #      | _A_call_28:
e0 ff                          # 558f |   push H
e0 5c 0a                       # 5591 |   push B + 0xa
5c f8 56 00                    # 5594 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # 5598 |   mov SP, SP + 0x4
                               #      | _Z_call_28:
                               #      | _A_call_29:
e0 5c 0a                       # 559c |   push B + 0xa
5c f8 72 00                    # 559f |   call ${fn_get_cell_addr}:rel + PC
60 a0 bc 02                    # 55a3 |   mov SP, SP + 0x2
                               #      | _Z_call_29:
62 ff 1c ff                    # 55a7 |   mov [H], -1
                               #      | _BZ_for_9:
44 40                          # 55ab |   inc B
58 f8 bd ff                    # 55ad |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
                               #      | _BZ_for_8:
28 60 1c 01                    # 55b1 |   shl C, 0x1
58 f8 9e ff                    # 55b5 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _BZ_for_7:
44 20                          # 55b9 |   inc A
58 f8 8e ff                    # 55bb |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_display_board:
e4 20                          # 55bf |   pop A
e4 40                          # 55c1 |   pop B
e4 60                          # 55c3 |   pop C
e4 80                          # 55c5 |   pop D
dc                             # 55c7 |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # 55c8 |   push B
e0 20                          # 55ca |   push A
61 20 bc 08                    # 55cc |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 55d0 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 55d5 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 00 5e ff 62 01     # 55dc |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # 55e5 |   pop A
e4 40                          # 55e7 |   pop B
dc                             # 55e9 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # 55ea |   push A
61 fe bc 06                    # 55ec |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # 55f0 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_10:
60 20 e4 00 5e                 # 55f6 |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_10:
fc 20 e0 f8 00 63 13 00        # 55fb |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_10}:rel + PC
62 20 fe                       # 5603 |   mov [A], G
                               #      | _BZ_for_10:
60 20 3c 50                    # 5606 |   mov A, A + 0x50
58 f8 f1 ff                    # 560a |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # 560e |   pop A
dc                             # 5610 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_get_cell_addr:
                               #      | _begin_fn_get_cell_addr:
a9 ff bc 1c 02 01              # 5611 |   shl H, [SP + 0x2], 0x1
00 ff e0 00 5e                 # 5617 |   add H, ${var__VIDEO_ROW_BUFFER}
                               #      | _cleanup_fn_get_cell_addr:
dc                             # 561c |   ret
                               #      | _end_fn_get_cell_addr:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 561d |   push A
61 20 bc 04                    # 561f |   mov A, [SP + 0x4]
                               #      | _A_if_24:
ec 20 1c f8 01 16 00           # 5623 |   jne A, 0x1, ${_E_if_24}:rel + PC
                               #      | _A_call_34:
e0 1c ff                       # 562a |   push -1
5c f8 30 00                    # 562d |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5631 |   mov SP, SP + 0x2
                               #      | _Z_call_34:
58 f8 25 00                    # 5635 |   jmp ${_C_if_24}:rel + PC
                               #      | _E_if_24:
ec 20 1c f8 02 16 00           # 5639 |   jne A, 0x2, ${_E2_if_24}:rel + PC
                               #      | _A_call_35:
e0 1c 01                       # 5640 |   push 0x1
5c f8 1a 00                    # 5643 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5647 |   mov SP, SP + 0x2
                               #      | _Z_call_35:
58 f8 0f 00                    # 564b |   jmp ${_C_if_24}:rel + PC
                               #      | _E2_if_24:
ec 20 1c f8 05 0b 00           # 564f |   jne A, 0x5, ${_E3_if_24}:rel + PC
                               #      | _A_call_41:
5c f8 4b 00                    # 5656 |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_41:
                               #      | _E3_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 565a |   pop A
dc                             # 565c |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_31:
e0 fd                          # 565d |   push F
e0 fc                          # 565f |   push E
e0 00                          # 5661 |   push 0
5c f8 b6 fb                    # 5663 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5667 |   mov SP, SP + 0x2
e4 fc                          # 566b |   pop E
e4 fd                          # 566d |   pop F
                               #      | _Z_call_31:
03 e0 bc e8 63 02              # 566f |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_32:
e0 fd                          # 5675 |   push F
e0 fc                          # 5677 |   push E
5c f8 0f fc                    # 5679 |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 567d |   pop E
e4 fd                          # 567f |   pop F
                               #      | _Z_call_32:
                               #      | _A_if_25:
ec ff 00 f8 0c 00              # 5681 |   jne H, 0, ${_E_if_25}:rel + PC
07 e0 bc e8 63 02              # 5687 |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _A_call_33:
e0 fd                          # 568d |   push F
e0 fc                          # 568f |   push E
e0 1c 01                       # 5691 |   push 0x1
5c f8 85 fb                    # 5694 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5698 |   mov SP, SP + 0x2
e4 fc                          # 569c |   pop E
e4 fd                          # 569e |   pop F
                               #      | _Z_call_33:
                               #      | _cleanup_fn_tg_move:
dc                             # 56a0 |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_36:
e0 fd                          # 56a1 |   push F
e0 fc                          # 56a3 |   push E
e0 00                          # 56a5 |   push 0
5c f8 72 fb                    # 56a7 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 56ab |   mov SP, SP + 0x2
e4 fc                          # 56af |   pop E
e4 fd                          # 56b1 |   pop F
                               #      | _Z_call_36:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
46 e0 e6 63                    # 56b3 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_37:
e0 fd                          # 56b7 |   push F
e0 fc                          # 56b9 |   push E
5c f8 cd fb                    # 56bb |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 56bf |   pop E
e4 fd                          # 56c1 |   pop F
                               #      | _Z_call_37:
e8 ff 00 f8 0a 00              # 56c3 |   jeq H, 0, ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 ea ff                    # 56c9 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
4a e0 e6 63                    # 56cd |   dec [${var__board__falling} + 0004]
                               #      | _A_call_38:
e2 e0 e6 63                    # 56d1 |   push [${var__board__falling} + 0004]
e0 e0 f5 5d                    # 56d5 |   push ${const__data_4}
5c f8 7e fc                    # 56d9 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 56dd |   mov SP, SP + 0x4
                               #      | _Z_call_38:
                               #      | _A_call_39:
e0 fd                          # 56e1 |   push F
e0 fc                          # 56e3 |   push E
e0 1c 01                       # 56e5 |   push 0x1
5c f8 31 fb                    # 56e8 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 56ec |   mov SP, SP + 0x2
e4 fc                          # 56f0 |   pop E
e4 fd                          # 56f2 |   pop F
                               #      | _Z_call_39:
                               #      | _A_call_40:
5c f8 ef f9                    # 56f4 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_40:
                               #      | _cleanup_fn_tg_down:
dc                             # 56f8 |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 56f9 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 56fc |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 56fd |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 56fe |   push D
e0 60                          # 5700 |   push C
e0 40                          # 5702 |   push B
e0 20                          # 5704 |   push A
60 60 00                       # 5706 |   mov C, 0
                               #      | _A_call_45:
e0 fd                          # 5709 |   push F
e0 fc                          # 570b |   push E
e0 00                          # 570d |   push 0
5c f8 0a fb                    # 570f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5713 |   mov SP, SP + 0x2
e4 fc                          # 5717 |   pop E
e4 fd                          # 5719 |   pop F
                               #      | _Z_call_45:
                               #      | _A_for_11:
60 20 00                       # 571b |   mov A, 0
                               #      | _BA_for_11:
fc 20 1c f8 02 37 00           # 571e |   jge A, 0x2, ${_C_for_11}:rel + PC
                               #      | _A_for_12:
60 40 00                       # 5725 |   mov B, 0
                               #      | _BA_for_12:
fc 40 1c f8 0a 27 00           # 5728 |   jge B, 0xa, ${_C_for_12}:rel + PC
88 80 20 1c 0a                 # 572f |   mul D, A, 0xa
00 80 e8 02 63                 # 5734 |   add D, ${var__board__board_state} + B
65 ff 80                       # 5739 |   bmov H, [D]
                               #      | _A_if_27:
e8 ff 00 f8 0d 00              # 573c |   jeq H, 0, ${_E_if_27}:rel + PC
c4 60 00                       # 5742 |   inc C, 0
58 f8 10 00                    # 5745 |   jmp ${_C_for_11}:rel + PC
                               #      | _E_if_27:
                               #      | _C_if_27:
                               #      | _Z_if_27:
                               #      | _BZ_for_12:
44 40                          # 5749 |   inc B
58 f8 dd ff                    # 574b |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _BZ_for_11:
44 20                          # 574f |   inc A
58 f8 cd ff                    # 5751 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
                               #      | _A_call_46:
e0 fd                          # 5755 |   push F
e0 fc                          # 5757 |   push E
e0 1c 01                       # 5759 |   push 0x1
5c f8 bd fa                    # 575c |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5760 |   mov SP, SP + 0x2
e4 fc                          # 5764 |   pop E
e4 fd                          # 5766 |   pop F
                               #      | _Z_call_46:
60 ff 60                       # 5768 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 576b |   pop A
e4 40                          # 576d |   pop B
e4 60                          # 576f |   pop C
e4 80                          # 5771 |   pop D
dc                             # 5773 |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 fe e0 06 ff                 # 5774 |   mov G, [0xff06]
ac ff fe e0 00 80              # 5779 |   and H, G, 0x8000
e8 ff 00 f8 7e 00              # 577f |   jeq H, 0, ${_C_loop_3}:rel + PC
a9 ff e0 1c fe 63 08           # 5785 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 578c |   and G, 0xff
30 ff fe                       # 5791 |   or H, G
62 e0 ff fe 63                 # 5794 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5799 |   shr G, H, 0x8
2c ff e0 ff 00                 # 579e |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 57a3 |   jeq G, 0xf0, ${_BA_loop_3}:rel + PC
60 fe 00                       # 57ab |   mov G, 0
                               #      | _A_if_30:
ec ff 1c f8 75 0f 00           # 57ae |   jne H, 0x75, ${_E_if_30}:rel + PC
60 fe 1c 03                    # 57b5 |   mov G, 0x3
58 f8 2c 00                    # 57b9 |   jmp ${_C_if_30}:rel + PC
                               #      | _E_if_30:
ec ff 1c f8 74 0f 00           # 57bd |   jne H, 0x74, ${_E2_if_30}:rel + PC
60 fe 1c 02                    # 57c4 |   mov G, 0x2
58 f8 1d 00                    # 57c8 |   jmp ${_C_if_30}:rel + PC
                               #      | _E2_if_30:
ec ff 1c f8 6b 0e 00           # 57cc |   jne H, 0x6b, ${_E3_if_30}:rel + PC
c4 fe 00                       # 57d3 |   inc G, 0
58 f8 0f 00                    # 57d6 |   jmp ${_C_if_30}:rel + PC
                               #      | _E3_if_30:
ec ff 1c f8 72 0b 00           # 57da |   jne H, 0x72, ${_E4_if_30}:rel + PC
60 fe 1c 05                    # 57e1 |   mov G, 0x5
                               #      | _E4_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
                               #      | _A_if_31:
e8 fe 00 f8 14 00              # 57e5 |   jeq G, 0, ${_E_if_31}:rel + PC
                               #      | _A_call_49:
e0 fe                          # 57eb |   push G
5c f8 30 fe                    # 57ed |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 57f1 |   mov SP, SP + 0x2
                               #      | _Z_call_49:
                               #      | _A_call_50:
5c f8 49 fd                    # 57f5 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_50:
                               #      | _E_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
                               #      | _BZ_loop_3:
58 f8 7b ff                    # 57f9 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _cleanup_fn_handle_keyboard:
dc                             # 57fd |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 57fe |   push D
e0 60                          # 5800 |   push C
e0 40                          # 5802 |   push B
e0 20                          # 5804 |   push A
61 40 e0 10 ff                 # 5806 |   mov B, [0xff10]
61 60 e0 12 ff                 # 580b |   mov C, [0xff12]
61 80 e0 14 ff                 # 5810 |   mov D, [0xff14]
61 20 bc 0e                    # 5815 |   mov A, [SP + 0xe]
60 ff 00                       # 5819 |   mov H, 0
                               #      | _A_if_32:
fc 28 20 f8 09 00              # 581c |   jge A + B, A, ${_E_if_32}:rel + PC
c4 ff 00                       # 5822 |   inc H, 0
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
60 40 44                       # 5825 |   mov B, B + A
81 20 bc ff 0c                 # 5828 |   add A, [SP + 0xc], H
60 ff 00                       # 582d |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 5830 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 5836 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 583c |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 5840 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 5843 |   mov C, C + A
81 20 bc ff 0a                 # 5846 |   add A, [SP + 0xa], H
60 80 84                       # 584b |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 584e |   mov A, [SP + 0x10]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
61 ff e0 14 ff                 # 5852 |   mov H, [0xff14]
                               #      | _A_if_35:
f4 ff 80 f8 0a 00              # 5857 |   jle H, D, ${_E_if_35}:rel + PC
58 f8 33 00                    # 585d |   jmp ${_C_loop_4}:rel + PC
                               #      | _E_if_35:
ec ff 80 f8 2b 00              # 5861 |   jne H, D, ${_E2_if_35}:rel + PC
61 ff e0 12 ff                 # 5867 |   mov H, [0xff12]
                               #      | _A_if_36:
f4 ff 60 f8 0a 00              # 586c |   jle H, C, ${_E_if_36}:rel + PC
58 f8 1e 00                    # 5872 |   jmp ${_C_loop_4}:rel + PC
                               #      | _E_if_36:
ec ff 60 f8 16 00              # 5876 |   jne H, C, ${_E2_if_36}:rel + PC
fa e0 40 f8 10 ff 14 00        # 587c |   jgt [0xff10], B, ${_C_loop_4}:rel + PC
                               #      | _A_if_38:
e8 20 00 f8 08 00              # 5884 |   jeq A, 0, ${_E_if_38}:rel + PC
5c 20                          # 588a |   call A
                               #      | _E_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
                               #      | _E2_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _E2_if_35:
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _BZ_loop_4:
58 f8 c6 ff                    # 588c |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5890 |   pop A
e4 40                          # 5892 |   pop B
e4 60                          # 5894 |   pop C
e4 80                          # 5896 |   pop D
dc                             # 5898 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 5899 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # 5c8e |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__TETROMINOS:
67 45 ae 26 ef cd 9d 15 56 04 59 12 6a 45 89 15 56 24 9a 15 68 45 59 01 56 12 56 12 56 12 56 12 45 12 6a 15 89 56 59 04 56 14 69 15 69 45 59 14 56 01 69 25 9a 45 58 14 # 5d4e |   .data list:[0x4567, 0x26ae, 0xcdef, 0x159d, 0x0456, 0x1259, 0x456a, 0x1589, 0x2456, 0x159a, 0x4568, 0x0159, 0x1256, 0x1256, 0x1256, 0x1256, 0x1245, 0x156a, 0x5689, 0x0459, 0x1456, 0x1569, 0x4569, 0x1459, 0x0156, 0x2569, 0x459a, 0x1458]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5d86 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | const__data_1:
66 69 74 73 3a 20 74 3d 25 64 20 6f 3d 25 64 20 72 6f 77 3d 25 64 20 63 6f 6c 3d 25 64 0a 00 # 5dae |   .data str:"fits: t=%d o=%d row=%d col=%d\n"
                               #      | const__data_2:
66 69 74 73 3a 20 25 64 20 25 64 20 3b 20 25 64 20 25 64 20 2d 3e 20 25 64 20 25 64 0a 00 # 5dcd |   .data str:"fits: %d %d ; %d %d -> %d %d\n"
                               #      | const__data_3:
6e 6f 74 20 66 69 74 21 0a 00  # 5deb |   .data str:"not fit!\n"
                               #      | const__data_4:
64 72 6f 70 3a 20 25 64 0a 00  # 5df5 |   .data str:"drop: %d\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5dff
                               #      | SECTION_BEGIN_static_data:
                               # 5dff |   .align dummy_size:1 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5e00 |   .bss size:1280 align:16
                               #      | var__rand__state:
                               # 6300 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 6302 |   .bss size:220 align:1
                               #      | var__board__points:
                               # 63de |   .bss size:2 align:1
                               #      | var__board__level:
                               # 63e0 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 63e2 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 63ea |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 63f2 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 63fa |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 63fc |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 63fe |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
