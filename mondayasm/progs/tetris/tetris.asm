                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_47:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_47:
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
5c f8 44 00                    # 5012 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_7:
60 a0 bc fc                    # 5016 |   mov SP, SP + -4
                               #      |   # game loop
                               #      | _A_while_3:
                               #      | _BA_while_3:
ea bc 00 f8 02 2f 00           # 501a |   jeq [SP + 0x2], 0, ${_C_while_3}:rel + PC
                               #      | _A_call_42:
e2 a0                          # 5021 |   push [SP]
5c f8 37 01                    # 5023 |   call ${fn_tg_tick}:rel + PC
60 a0 bc 02                    # 5027 |   mov SP, SP + 0x2
                               #      | _Z_call_42:
62 bc ff 02                    # 502b |   mov [SP + 0x2], H
                               #      | _A_call_45:
5c f8 20 06                    # 502f |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_45:
                               #      | _A_call_46:
e0 00                          # 5033 |   push 0
e0 e0 30 75                    # 5035 |   push 0x7530
e0 00                          # 5039 |   push 0
e0 00                          # 503b |   push 0
5c f8 cb 06                    # 503d |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5041 |   mov SP, SP + 0x8
                               #      | _Z_call_46:
                               #      | _BZ_while_3:
58 f8 d5 ff                    # 5045 |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _cleanup_fn_main:
60 a0 bc 04                    # 5049 |   mov SP, SP + 0x4
e4 20                          # 504d |   pop A
e4 40                          # 504f |   pop B
e4 60                          # 5051 |   pop C
e4 80                          # 5053 |   pop D
dc                             # 5055 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_tg_init:
                               #      | _begin_fn_tg_init:
                               #      | _A_call_1:
e0 e0 dc 00                    # 5056 |   push 0xdc
e0 00                          # 505a |   push 0
e0 e0 f2 61                    # 505c |   push ${var__board__board_state}
5c f8 44 00                    # 5060 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5064 |   mov SP, SP + 0x6
                               #      | _Z_call_1:
62 e0 00 ce 62                 # 5068 |   mov [${var__board__points}], 0
62 e0 00 d0 62                 # 506d |   mov [${var__board__level}], 0
62 e0 00 ea 62                 # 5072 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 ec 62                 # 5077 |   mov [${var__board__lines_remaining}], 0
                               #      | _A_call_2:
e0 00                          # 507c |   push 0
5c f8 5f 00                    # 507e |   call ${fn_srand}:rel + PC
60 a0 bc 02                    # 5082 |   mov SP, SP + 0x2
                               #      | _Z_call_2:
                               #      | _A_call_5:
5c f8 5e 00                    # 5086 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_5:
                               #      | _A_call_6:
5c f8 5a 00                    # 508a |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_6:
ca e0 00 e2 62                 # 508e |   dec [${var__board__stored}], 0
62 e0 00 e4 62                 # 5093 |   mov [${var__board__stored} + 0002], 0
62 e0 00 e6 62                 # 5098 |   mov [${var__board__stored} + 0004], 0
62 e0 1c e0 62 03              # 509d |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_init:
dc                             # 50a3 |   ret
                               #      | _end_fn_tg_init:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 50a4 |   push B
e0 20                          # 50a6 |   push A
65 fe bc 08                    # 50a8 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 50ac |   shl H, G, 0x8
30 ff fe                       # 50b1 |   or H, G
61 20 bc 06                    # 50b4 |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 50b8 |   add B, [SP + 0xa], A
                               #      | _A_while_1:
                               #      | _BA_while_1:
f8 3c 40 f8 02 12 00           # 50bd |   jgt A + 0x2, B, ${_C_while_1}:rel + PC
62 20 ff                       # 50c4 |   mov [A], H
60 20 3c 02                    # 50c7 |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 f2 ff                    # 50cb |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      | _A_if_1:
fc 20 40 f8 09 00              # 50cf |   jge A, B, ${_E_if_1}:rel + PC
66 20 ff                       # 50d5 |   bmov [A], H
                               #      | _E_if_1:
                               #      | _C_if_1:
                               #      | _Z_if_1:
                               #      | _cleanup_fn_memset:
e4 20                          # 50d8 |   pop A
e4 40                          # 50da |   pop B
dc                             # 50dc |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc f0 61 02              # 50dd |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 50e3 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_3:
e0 1c 08                       # 50e4 |   push 0x8
e0 e0 da 62                    # 50e7 |   push ${var__board__next}
e0 e0 d2 62                    # 50eb |   push ${var__board__falling}
5c f8 27 00                    # 50ef |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 50f3 |   mov SP, SP + 0x6
                               #      | _Z_call_3:
                               #      |   # fill new Board.next
                               #      | _A_call_4:
5c f8 58 00                    # 50f7 |   call ${fn_rand}:rel + PC
                               #      | _Z_call_4:
90 fe ff 1c 07                 # 50fb |   div G, H, 0x7
c6 e0 ff da 62                 # 5100 |   inc [${var__board__next}], H
62 e0 00 dc 62                 # 5105 |   mov [${var__board__next} + 0002], 0
62 e0 00 de 62                 # 510a |   mov [${var__board__next} + 0004], 0
62 e0 1c e0 62 03              # 510f |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_new_falling:
dc                             # 5115 |   ret
                               #      | _end_fn_tg_new_falling:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 5116 |   push C
e0 40                          # 5118 |   push B
e0 20                          # 511a |   push A
61 20 bc 08                    # 511c |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 5120 |   add B, [SP + 0xc], A
61 60 bc 0a                    # 5125 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
f8 3c 40 f8 02 16 00           # 5129 |   jgt A + 0x2, B, ${_C_while_2}:rel + PC
63 20 60                       # 5130 |   mov [A], [C]
60 20 3c 02                    # 5133 |   mov A, A + 0x2
60 60 7c 02                    # 5137 |   mov C, C + 0x2
                               #      | _BZ_while_2:
58 f8 ee ff                    # 513b |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _A_if_2:
fc 20 40 f8 09 00              # 513f |   jge A, B, ${_E_if_2}:rel + PC
67 20 60                       # 5145 |   bmov [A], [C]
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 5148 |   pop A
e4 40                          # 514a |   pop B
e4 60                          # 514c |   pop C
dc                             # 514e |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 f0 61                 # 514f |   inc H, [${var__rand__state}]
62 e0 ff f0 61                 # 5154 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5159 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_25:
5c f8 27 00                    # 515a |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_25:
                               #      | _A_call_36:
e2 bc 02                       # 515e |   push [SP + 0x2]
5c f8 a7 03                    # 5161 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5165 |   mov SP, SP + 0x2
                               #      | _Z_call_36:
                               #      | _A_call_37:
5c f8 6b 04                    # 5169 |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_37:
                               #      | _A_call_38:
e0 ff                          # 516d |   push H
5c f8 69 04                    # 516f |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5173 |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _A_call_41:
5c f8 62 04                    # 5177 |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_41:
84 ff 1c ff 01                 # 517b |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5180 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 5181 |   push A
4a e0 ea 62                    # 5183 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_3:
d2 e0 00 ea 62                 # 5187 |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 77 00                    # 518c |   jgt ${_E_if_3}:rel + PC
                               #      | _A_call_8:
e0 fd                          # 5190 |   push F
e0 fc                          # 5192 |   push E
e0 00                          # 5194 |   push 0
5c f8 70 00                    # 5196 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 519a |   mov SP, SP + 0x2
e4 fc                          # 519e |   pop E
e4 fd                          # 51a0 |   pop F
                               #      | _Z_call_8:
46 e0 d6 62                    # 51a2 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_20:
e0 fd                          # 51a6 |   push F
e0 fc                          # 51a8 |   push E
5c f8 cb 00                    # 51aa |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 51ae |   pop E
e4 fd                          # 51b0 |   pop F
                               #      | _Z_call_20:
                               #      | _A_if_21:
ec ff 1c f8 01 17 00           # 51b2 |   jne H, 0x1, ${_E_if_21}:rel + PC
61 20 e0 d0 62                 # 51b9 |   mov A, [${var__board__level}]
63 e0 e4 ea 62 90 5c           # 51be |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 2b 00                    # 51c5 |   jmp ${_C_if_21}:rel + PC
                               #      | _E_if_21:
                               #      | _A_call_21:
e0 e0 d7 5c                    # 51c9 |   push ${const__data_2}
5c f8 54 01                    # 51cd |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # 51d1 |   mov SP, SP + 0x2
                               #      | _Z_call_21:
4a e0 d6 62                    # 51d5 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_22:
e0 fd                          # 51d9 |   push F
e0 fc                          # 51db |   push E
e0 1c 01                       # 51dd |   push 0x1
5c f8 26 00                    # 51e0 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 51e4 |   mov SP, SP + 0x2
e4 fc                          # 51e8 |   pop E
e4 fd                          # 51ea |   pop F
                               #      | _Z_call_22:
                               #      | _A_call_23:
5c f8 f8 fe                    # 51ec |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_23:
                               #      | _C_if_21:
                               #      | _Z_if_21:
                               #      | _A_call_24:
e0 fd                          # 51f0 |   push F
e0 fc                          # 51f2 |   push E
e0 1c 01                       # 51f4 |   push 0x1
5c f8 0f 00                    # 51f7 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 51fb |   mov SP, SP + 0x2
e4 fc                          # 51ff |   pop E
e4 fd                          # 5201 |   pop F
                               #      | _Z_call_24:
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 5203 |   pop A
dc                             # 5205 |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 5206 |   push D
e0 60                          # 5208 |   push C
e0 40                          # 520a |   push B
e0 20                          # 520c |   push A
61 20 bc 0a                    # 520e |   mov A, [SP + 0xa]
c9 40 e0 d2 62                 # 5212 |   dec B, [${var__board__falling}]
81 80 e0 43 d4 62              # 5217 |   add D, [${var__board__falling} + 0002], B*8
61 80 f0 58 5c                 # 521d |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_1:
60 60 00                       # 5222 |   mov C, 0
                               #      | _BA_for_1:
fc 60 1c f8 04 47 00           # 5225 |   jge C, 0x4, ${_C_for_1}:rel + PC
a0 40 80 7e 02                 # 522c |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 5231 |   shr E, D, C*4
2c 40 1c 03                    # 5235 |   and B, 0x3
2c fc 1c 03                    # 5239 |   and E, 0x3
81 fe e0 40 d6 62              # 523d |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc d8 62              # 5243 |   add B, [${var__board__falling} + 0006], E
88 fd fe 1c 0a                 # 5249 |   mul F, G, 0xa
00 fd e8 f2 61                 # 524e |   add F, ${var__board__board_state} + B
                               #      | _A_if_4:
ee bc 00 f8 0a 0e 00           # 5253 |   jne [SP + 0xa], 0, ${_E_if_4}:rel + PC
66 fd 00                       # 525a |   bmov [F], 0
58 f8 09 00                    # 525d |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
67 fd e0 d2 62                 # 5261 |   bmov [F], [${var__board__falling}]
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _BZ_for_1:
44 60                          # 5266 |   inc C
58 f8 bd ff                    # 5268 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 526c |   pop A
e4 40                          # 526e |   pop B
e4 60                          # 5270 |   pop C
e4 80                          # 5272 |   pop D
dc                             # 5274 |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 5275 |   push D
e0 60                          # 5277 |   push C
e0 40                          # 5279 |   push B
c9 40 e0 d2 62                 # 527b |   dec B, [${var__board__falling}]
81 80 e0 43 d4 62              # 5280 |   add D, [${var__board__falling} + 0002], B*8
61 80 f0 58 5c                 # 5286 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_call_19:
e2 e0 d8 62                    # 528b |   push [${var__board__falling} + 0006]
e2 e0 d6 62                    # 528f |   push [${var__board__falling} + 0004]
e2 e0 d4 62                    # 5293 |   push [${var__board__falling} + 0002]
e2 e0 d2 62                    # 5297 |   push [${var__board__falling}]
e0 e0 b8 5c                    # 529b |   push ${const__data_1}
5c f8 82 00                    # 529f |   call ${fn_printf}:rel + PC
60 a0 bc 0a                    # 52a3 |   mov SP, SP + 0xa
                               #      | _Z_call_19:
                               #      | _A_for_6:
60 60 00                       # 52a7 |   mov C, 0
                               #      | _BA_for_6:
fc 60 1c f8 04 6d 00           # 52aa |   jge C, 0x4, ${_C_for_6}:rel + PC
a0 40 80 7e 02                 # 52b1 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 52b6 |   shr E, D, C*4
2c 40 1c 03                    # 52ba |   and B, 0x3
2c fc 1c 03                    # 52be |   and E, 0x3
81 fe e0 40 d6 62              # 52c2 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc d8 62              # 52c8 |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 52ce |   mov H, 0
                               #      | _A_if_12:
d0 fe 00                       # 52d1 |   icmp G, 0
7c f8 08 00                    # 52d4 |   jge ${_E_if_12}:rel + PC
58 f8 42 00                    # 52d8 |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_12:
                               #      | _C_if_12:
                               #      | _Z_if_12:
                               #      | _A_if_14:
d0 40 00                       # 52dc |   icmp B, 0
7c f8 08 00                    # 52df |   jge ${_E_if_14}:rel + PC
58 f8 37 00                    # 52e3 |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
                               #      | _A_if_16:
f0 fe 1c f8 16 0b 00           # 52e7 |   jlt G, 0x16, ${_E_if_16}:rel + PC
58 f8 2c 00                    # 52ee |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _A_if_18:
f0 40 1c f8 0a 0b 00           # 52f2 |   jlt B, 0xa, ${_E_if_18}:rel + PC
58 f8 21 00                    # 52f9 |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_18:
                               #      | _C_if_18:
                               #      | _Z_if_18:
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 52fd |   mul F, G, 0xa
00 fd e8 f2 61                 # 5302 |   add F, ${var__board__board_state} + B
                               #      | _A_if_20:
ea fd 00 f8 0a 00              # 5307 |   jeq [F], 0, ${_E_if_20}:rel + PC
58 f8 0d 00                    # 530d |   jmp ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _E_if_20:
                               #      | _C_if_20:
                               #      | _Z_if_20:
                               #      | _BZ_for_6:
44 60                          # 5311 |   inc C
58 f8 97 ff                    # 5313 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      |   # done checking, all good
c4 ff 00                       # 5317 |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 40                          # 531a |   pop B
e4 60                          # 531c |   pop C
e4 80                          # 531e |   pop D
dc                             # 5320 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # 5321 |   push C
e0 40                          # 5323 |   push B
e0 20                          # 5325 |   push A
60 a0 bc ee                    # 5327 |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # 532b |   mov B, SP + 0x1c
                               #      | _A_for_2:
61 20 bc 1a                    # 532f |   mov A, [SP + 0x1a]
                               #      | _BA_for_2:
65 60 20                       # 5333 |   bmov C, [A]
e8 60 00 f8 b5 00              # 5336 |   jeq C, 0, ${_C_for_2}:rel + PC
                               #      |   # normal char
                               #      | _A_if_6:
e8 60 1c f8 25 15 00           # 533c |   jeq C, 0x25, ${_E_if_6}:rel + PC
                               #      | _A_call_9:
e0 60                          # 5343 |   push C
5c f8 b1 00                    # 5345 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 5349 |   mov SP, SP + 0x2
                               #      | _Z_call_9:
58 f8 98 00                    # 534d |   jmp ${_BZ_for_2}:rel + PC
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      |   # format specifier
44 20                          # 5351 |   inc A
65 60 20                       # 5353 |   bmov C, [A]
                               #      | _A_if_8:
ec 60 00 f8 0e 00              # 5356 |   jne C, 0, ${_E_if_8}:rel + PC
58 f8 8f 00                    # 535c |   jmp ${_C_for_2}:rel + PC
58 f8 85 00                    # 5360 |   jmp ${_C_if_8}:rel + PC
                               #      | _E_if_8:
ec 60 1c f8 64 25 00           # 5364 |   jne C, 0x64, ${_E2_if_8}:rel + PC
                               #      |   # format %d
                               #      | _A_call_10:
e0 a0                          # 536b |   push SP
e2 40                          # 536d |   push [B]
5c f8 9f 00                    # 536f |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # 5373 |   mov SP, SP + 0x4
                               #      | _Z_call_10:
                               #      | _A_call_12:
e0 a0                          # 5377 |   push SP
5c f8 e2 00                    # 5379 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 537d |   mov SP, SP + 0x2
                               #      | _Z_call_12:
60 40 5c 02                    # 5381 |   mov B, B + 0x2
58 f8 60 00                    # 5385 |   jmp ${_C_if_8}:rel + PC
                               #      | _E2_if_8:
ec 60 1c f8 78 25 00           # 5389 |   jne C, 0x78, ${_E3_if_8}:rel + PC
                               #      |   # format %x
                               #      | _A_call_14:
e0 a0                          # 5390 |   push SP
e2 40                          # 5392 |   push [B]
5c f8 e9 00                    # 5394 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 5398 |   mov SP, SP + 0x4
                               #      | _Z_call_14:
                               #      | _A_call_15:
e0 a0                          # 539c |   push SP
5c f8 bd 00                    # 539e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 53a2 |   mov SP, SP + 0x2
                               #      | _Z_call_15:
60 40 5c 02                    # 53a6 |   mov B, B + 0x2
58 f8 3b 00                    # 53aa |   jmp ${_C_if_8}:rel + PC
                               #      | _E3_if_8:
ec 60 1c f8 62 25 00           # 53ae |   jne C, 0x62, ${_E4_if_8}:rel + PC
                               #      |   # format %b
                               #      | _A_call_16:
e0 a0                          # 53b5 |   push SP
e2 40                          # 53b7 |   push [B]
5c f8 1a 01                    # 53b9 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # 53bd |   mov SP, SP + 0x4
                               #      | _Z_call_16:
                               #      | _A_call_17:
e0 a0                          # 53c1 |   push SP
5c f8 98 00                    # 53c3 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 53c7 |   mov SP, SP + 0x2
                               #      | _Z_call_17:
60 40 5c 02                    # 53cb |   mov B, B + 0x2
58 f8 16 00                    # 53cf |   jmp ${_C_if_8}:rel + PC
                               #      | _E4_if_8:
ec 60 1c f8 25 12 00           # 53d3 |   jne C, 0x25, ${_E5_if_8}:rel + PC
                               #      |   # format %%
                               #      | _A_call_18:
e0 1c 25                       # 53da |   push 0x25
5c f8 19 00                    # 53dd |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 53e1 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
                               #      | _E5_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _BZ_for_2:
44 20                          # 53e5 |   inc A
58 f8 4c ff                    # 53e7 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # 53eb |   mov SP, SP + 0x12
e4 20                          # 53ef |   pop A
e4 40                          # 53f1 |   pop B
e4 60                          # 53f3 |   pop C
dc                             # 53f5 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # 53f6 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # 53fd |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # 5403 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # 5407 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # 540d |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # 540e |   push C
e0 40                          # 5410 |   push B
e0 20                          # 5412 |   push A
61 20 bc 0a                    # 5414 |   mov A, [SP + 0xa]
62 20 1c 30                    # 5418 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # 541c |   mov B, [SP + 0x8]
                               #      | _A_while_4:
                               #      | _BA_while_4:
e8 40 00 f8 19 00              # 5420 |   jeq B, 0, ${_C_while_4}:rel + PC
90 60 40 1c 0a                 # 5426 |   div C, B, 0xa
82 20 ff 1c 30                 # 542b |   add [A], H, 0x30
44 20                          # 5430 |   inc A
60 40 60                       # 5432 |   mov B, C
                               #      | _BZ_while_4:
58 f8 eb ff                    # 5435 |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      |   # reverse the string
61 60 bc 0a                    # 5439 |   mov C, [SP + 0xa]
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 60 20 f8 17 00              # 543d |   jge C, A, ${_C_while_5}:rel + PC
48 20                          # 5443 |   dec A
61 40 60                       # 5445 |   mov B, [C]
67 60 20                       # 5448 |   bmov [C], [A]
66 20 40                       # 544b |   bmov [A], B
44 60                          # 544e |   inc C
                               #      | _BZ_while_5:
58 f8 ed ff                    # 5450 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # 5454 |   pop A
e4 40                          # 5456 |   pop B
e4 60                          # 5458 |   pop C
dc                             # 545a |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # 545b |   push A
                               #      | _A_for_3:
61 20 bc 04                    # 545d |   mov A, [SP + 0x4]
                               #      | _BA_for_3:
65 ff 20                       # 5461 |   bmov H, [A]
e8 ff 00 f8 16 00              # 5464 |   jeq H, 0, ${_C_for_3}:rel + PC
                               #      | _A_call_11:
e0 ff                          # 546a |   push H
5c f8 8a ff                    # 546c |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 5470 |   mov SP, SP + 0x2
                               #      | _Z_call_11:
                               #      | _BZ_for_3:
44 20                          # 5474 |   inc A
58 f8 eb ff                    # 5476 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_puts:
e4 20                          # 547a |   pop A
dc                             # 547c |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # 547d |   push C
e0 40                          # 547f |   push B
e0 20                          # 5481 |   push A
61 40 bc 08                    # 5483 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 5487 |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 03                    # 548b |   mov A, 0x3
                               #      | _BA_for_4:
e8 20 1c f8 ff 24 00           # 548f |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 22                    # 5496 |   shr H, B, A*4
2c ff 1c 0f                    # 549a |   and H, 0xf
                               #      | _A_call_13:
e0 ff                          # 549e |   push H
5c f8 1a 00                    # 54a0 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # 54a4 |   mov SP, SP + 0x2
                               #      | _Z_call_13:
62 60 ff                       # 54a8 |   mov [C], H
44 60                          # 54ab |   inc C
                               #      | _BZ_for_4:
48 20                          # 54ad |   dec A
58 f8 e0 ff                    # 54af |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # 54b3 |   pop A
e4 40                          # 54b5 |   pop B
e4 60                          # 54b7 |   pop C
dc                             # 54b9 |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_10:
fa bc 1c f8 02 09 12 00        # 54ba |   jgt [SP + 0x2], 0x9, ${_E_if_10}:rel + PC
81 ff bc 1c 02 30              # 54c2 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # 54c8 |   jmp ${_C_if_10}:rel + PC
                               #      | _E_if_10:
81 ff bc 1c 02 57              # 54cc |   add H, [SP + 0x2], 0x57
                               #      | _C_if_10:
                               #      | _Z_if_10:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # 54d2 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # 54d3 |   push C
e0 40                          # 54d5 |   push B
e0 20                          # 54d7 |   push A
61 40 bc 08                    # 54d9 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 54dd |   mov C, [SP + 0xa]
                               #      | _A_for_5:
60 20 1c 0f                    # 54e1 |   mov A, 0xf
                               #      | _BA_for_5:
e8 20 1c f8 ff 1c 00           # 54e5 |   jeq A, -1, ${_C_for_5}:rel + PC
a0 ff 40 20                    # 54ec |   shr H, B, A
2c ff 1c 01                    # 54f0 |   and H, 0x1
82 60 ff 1c 30                 # 54f4 |   add [C], H, 0x30
44 60                          # 54f9 |   inc C
                               #      | _BZ_for_5:
48 20                          # 54fb |   dec A
58 f8 e8 ff                    # 54fd |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # 5501 |   pop A
e4 40                          # 5503 |   pop B
e4 60                          # 5505 |   pop C
dc                             # 5507 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 5508 |   push A
61 20 bc 04                    # 550a |   mov A, [SP + 0x4]
                               #      | _A_if_22:
ec 20 1c f8 01 16 00           # 550e |   jne A, 0x1, ${_E_if_22}:rel + PC
                               #      | _A_call_29:
e0 1c ff                       # 5515 |   push -1
5c f8 30 00                    # 5518 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 551c |   mov SP, SP + 0x2
                               #      | _Z_call_29:
58 f8 25 00                    # 5520 |   jmp ${_C_if_22}:rel + PC
                               #      | _E_if_22:
ec 20 1c f8 02 16 00           # 5524 |   jne A, 0x2, ${_E2_if_22}:rel + PC
                               #      | _A_call_30:
e0 1c 01                       # 552b |   push 0x1
5c f8 1a 00                    # 552e |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5532 |   mov SP, SP + 0x2
                               #      | _Z_call_30:
58 f8 0f 00                    # 5536 |   jmp ${_C_if_22}:rel + PC
                               #      | _E2_if_22:
ec 20 1c f8 05 0b 00           # 553a |   jne A, 0x5, ${_E3_if_22}:rel + PC
                               #      | _A_call_35:
5c f8 4b 00                    # 5541 |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_35:
                               #      | _E3_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 5545 |   pop A
dc                             # 5547 |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_26:
e0 fd                          # 5548 |   push F
e0 fc                          # 554a |   push E
e0 00                          # 554c |   push 0
5c f8 b8 fc                    # 554e |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5552 |   mov SP, SP + 0x2
e4 fc                          # 5556 |   pop E
e4 fd                          # 5558 |   pop F
                               #      | _Z_call_26:
03 e0 bc d8 62 02              # 555a |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_27:
e0 fd                          # 5560 |   push F
e0 fc                          # 5562 |   push E
5c f8 11 fd                    # 5564 |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 5568 |   pop E
e4 fd                          # 556a |   pop F
                               #      | _Z_call_27:
                               #      | _A_if_23:
ec ff 00 f8 0c 00              # 556c |   jne H, 0, ${_E_if_23}:rel + PC
07 e0 bc d8 62 02              # 5572 |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_23:
                               #      | _C_if_23:
                               #      | _Z_if_23:
                               #      | _A_call_28:
e0 fd                          # 5578 |   push F
e0 fc                          # 557a |   push E
e0 1c 01                       # 557c |   push 0x1
5c f8 87 fc                    # 557f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5583 |   mov SP, SP + 0x2
e4 fc                          # 5587 |   pop E
e4 fd                          # 5589 |   pop F
                               #      | _Z_call_28:
                               #      | _cleanup_fn_tg_move:
dc                             # 558b |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_31:
e0 fd                          # 558c |   push F
e0 fc                          # 558e |   push E
e0 00                          # 5590 |   push 0
5c f8 74 fc                    # 5592 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5596 |   mov SP, SP + 0x2
e4 fc                          # 559a |   pop E
e4 fd                          # 559c |   pop F
                               #      | _Z_call_31:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_call_32:
e0 fd                          # 559e |   push F
e0 fc                          # 55a0 |   push E
5c f8 d3 fc                    # 55a2 |   call ${fn_tg_fits}:rel + PC
e4 fc                          # 55a6 |   pop E
e4 fd                          # 55a8 |   pop F
                               #      | _Z_call_32:
e8 ff 00 f8 0e 00              # 55aa |   jeq H, 0, ${_C_loop_2}:rel + PC
46 e0 d6 62                    # 55b0 |   inc [${var__board__falling} + 0004]
                               #      | _BZ_loop_2:
58 f8 ea ff                    # 55b4 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
4a e0 d6 62                    # 55b8 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_33:
e0 fd                          # 55bc |   push F
e0 fc                          # 55be |   push E
e0 1c 01                       # 55c0 |   push 0x1
5c f8 43 fc                    # 55c3 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 55c7 |   mov SP, SP + 0x2
e4 fc                          # 55cb |   pop E
e4 fd                          # 55cd |   pop F
                               #      | _Z_call_33:
                               #      | _A_call_34:
5c f8 15 fb                    # 55cf |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_34:
                               #      | _cleanup_fn_tg_down:
dc                             # 55d3 |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 55d4 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 55d7 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 55d8 |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 55d9 |   push D
e0 60                          # 55db |   push C
e0 40                          # 55dd |   push B
e0 20                          # 55df |   push A
60 60 00                       # 55e1 |   mov C, 0
                               #      | _A_call_39:
e0 fd                          # 55e4 |   push F
e0 fc                          # 55e6 |   push E
e0 00                          # 55e8 |   push 0
5c f8 1c fc                    # 55ea |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 55ee |   mov SP, SP + 0x2
e4 fc                          # 55f2 |   pop E
e4 fd                          # 55f4 |   pop F
                               #      | _Z_call_39:
                               #      | _A_for_7:
60 20 00                       # 55f6 |   mov A, 0
                               #      | _BA_for_7:
fc 20 1c f8 02 37 00           # 55f9 |   jge A, 0x2, ${_C_for_7}:rel + PC
                               #      | _A_for_8:
60 40 00                       # 5600 |   mov B, 0
                               #      | _BA_for_8:
fc 40 1c f8 0a 27 00           # 5603 |   jge B, 0xa, ${_C_for_8}:rel + PC
88 80 20 1c 0a                 # 560a |   mul D, A, 0xa
00 80 e8 f2 61                 # 560f |   add D, ${var__board__board_state} + B
65 ff 80                       # 5614 |   bmov H, [D]
                               #      | _A_if_25:
e8 ff 00 f8 0d 00              # 5617 |   jeq H, 0, ${_E_if_25}:rel + PC
c4 60 00                       # 561d |   inc C, 0
58 f8 10 00                    # 5620 |   jmp ${_C_for_7}:rel + PC
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _BZ_for_8:
44 40                          # 5624 |   inc B
58 f8 dd ff                    # 5626 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _BZ_for_7:
44 20                          # 562a |   inc A
58 f8 cd ff                    # 562c |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _A_call_40:
e0 fd                          # 5630 |   push F
e0 fc                          # 5632 |   push E
e0 1c 01                       # 5634 |   push 0x1
5c f8 cf fb                    # 5637 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 563b |   mov SP, SP + 0x2
e4 fc                          # 563f |   pop E
e4 fd                          # 5641 |   pop F
                               #      | _Z_call_40:
60 ff 60                       # 5643 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 5646 |   pop A
e4 40                          # 5648 |   pop B
e4 60                          # 564a |   pop C
e4 80                          # 564c |   pop D
dc                             # 564e |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 564f |   push D
e0 60                          # 5651 |   push C
e0 40                          # 5653 |   push B
e0 20                          # 5655 |   push A
                               #      | _A_for_9:
60 20 00                       # 5657 |   mov A, 0
                               #      | _BA_for_9:
fc 20 1c f8 16 5c 00           # 565a |   jge A, 0x16, ${_C_for_9}:rel + PC
                               #      | _A_for_10:
60 60 00                       # 5661 |   mov C, 0
                               #      | _BA_for_10:
fc 60 1c f8 08 4c 00           # 5664 |   jge C, 0x8, ${_C_for_10}:rel + PC
                               #      | _A_call_43:
e0 60                          # 566b |   push C
e0 3c 02                       # 566d |   push A + 0x2
5c f8 4f 00                    # 5670 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 5674 |   mov SP, SP + 0x4
                               #      | _Z_call_43:
                               #      | _A_for_11:
60 40 00                       # 5678 |   mov B, 0
                               #      | _BA_for_11:
fc 40 1c f8 0a 2f 00           # 567b |   jge B, 0xa, ${_C_for_11}:rel + PC
88 80 1c 20 0a                 # 5682 |   mul D, 0xa, A
80 80 88 e0 f2 61              # 5687 |   add D, D + B, ${var__board__board_state}
65 80 80                       # 568d |   bmov D, [D]
                               #      | _A_if_26:
ec 80 60 f8 14 00              # 5690 |   jne D, C, ${_E_if_26}:rel + PC
                               #      | _A_call_44:
e0 1c ff                       # 5696 |   push -1
e0 5c 0a                       # 5699 |   push B + 0xa
5c f8 45 00                    # 569c |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # 56a0 |   mov SP, SP + 0x4
                               #      | _Z_call_44:
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _BZ_for_11:
44 40                          # 56a4 |   inc B
58 f8 d5 ff                    # 56a6 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
                               #      | _BZ_for_10:
44 60                          # 56aa |   inc C
58 f8 b8 ff                    # 56ac |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
                               #      | _BZ_for_9:
44 20                          # 56b0 |   inc A
58 f8 a8 ff                    # 56b2 |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
                               #      | _cleanup_fn_display_board:
e4 20                          # 56b6 |   pop A
e4 40                          # 56b8 |   pop B
e4 60                          # 56ba |   pop C
e4 80                          # 56bc |   pop D
dc                             # 56be |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # 56bf |   push B
e0 20                          # 56c1 |   push A
61 20 bc 08                    # 56c3 |   mov A, [SP + 0x8]
60 20 e4 f0 00                 # 56c7 |   mov A, 0xf0 + A
89 40 bc e0 06 00 05           # 56cc |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c f0 5c ef 61 01     # 56d3 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # 56dc |   pop A
e4 40                          # 56de |   pop B
dc                             # 56e0 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # 56e1 |   push A
61 fe bc 06                    # 56e3 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # 56e7 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_12:
60 20 e4 f0 5c                 # 56ed |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_12:
fc 20 e0 f8 f0 61 13 00        # 56f2 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_12}:rel + PC
62 20 fe                       # 56fa |   mov [A], G
                               #      | _BZ_for_12:
60 20 3c 50                    # 56fd |   mov A, A + 0x50
58 f8 f1 ff                    # 5701 |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # 5705 |   pop A
dc                             # 5707 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5708 |   push D
e0 60                          # 570a |   push C
e0 40                          # 570c |   push B
e0 20                          # 570e |   push A
61 40 e0 10 ff                 # 5710 |   mov B, [0xff10]
61 60 e0 12 ff                 # 5715 |   mov C, [0xff12]
61 80 e0 14 ff                 # 571a |   mov D, [0xff14]
61 20 bc 0e                    # 571f |   mov A, [SP + 0xe]
60 ff 00                       # 5723 |   mov H, 0
                               #      | _A_if_27:
fc 28 20 f8 09 00              # 5726 |   jge A + B, A, ${_E_if_27}:rel + PC
c4 ff 00                       # 572c |   inc H, 0
                               #      | _E_if_27:
                               #      | _C_if_27:
                               #      | _Z_if_27:
60 40 44                       # 572f |   mov B, B + A
81 20 bc ff 0c                 # 5732 |   add A, [SP + 0xc], H
60 ff 00                       # 5737 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 573a |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 5740 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 5746 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 574a |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 574d |   mov C, C + A
81 20 bc ff 0a                 # 5750 |   add A, [SP + 0xa], H
60 80 84                       # 5755 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 5758 |   mov A, [SP + 0x10]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 ff e0 14 ff                 # 575c |   mov H, [0xff14]
                               #      | _A_if_30:
f4 ff 80 f8 0a 00              # 5761 |   jle H, D, ${_E_if_30}:rel + PC
58 f8 33 00                    # 5767 |   jmp ${_C_loop_3}:rel + PC
                               #      | _E_if_30:
ec ff 80 f8 2b 00              # 576b |   jne H, D, ${_E2_if_30}:rel + PC
61 ff e0 12 ff                 # 5771 |   mov H, [0xff12]
                               #      | _A_if_31:
f4 ff 60 f8 0a 00              # 5776 |   jle H, C, ${_E_if_31}:rel + PC
58 f8 1e 00                    # 577c |   jmp ${_C_loop_3}:rel + PC
                               #      | _E_if_31:
ec ff 60 f8 16 00              # 5780 |   jne H, C, ${_E2_if_31}:rel + PC
fa e0 40 f8 10 ff 14 00        # 5786 |   jgt [0xff10], B, ${_C_loop_3}:rel + PC
                               #      | _A_if_33:
e8 20 00 f8 08 00              # 578e |   jeq A, 0, ${_E_if_33}:rel + PC
5c 20                          # 5794 |   call A
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _E2_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
                               #      | _E2_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
                               #      | _BZ_loop_3:
58 f8 c6 ff                    # 5796 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 579a |   pop A
e4 40                          # 579c |   pop B
e4 60                          # 579e |   pop C
e4 80                          # 57a0 |   pop D
dc                             # 57a2 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 57a3 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # 5b98 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__TETROMINOS:
67 45 ae 26 ef cd 9d 15 56 04 59 12 6a 45 89 15 56 24 9a 15 68 45 59 01 56 12 56 12 56 12 56 12 45 12 6a 15 89 56 59 04 56 14 69 15 69 45 59 14 56 01 69 25 9a 45 58 14 # 5c58 |   .data list:[0x4567, 0x26ae, 0xcdef, 0x159d, 0x0456, 0x1259, 0x456a, 0x1589, 0x2456, 0x159a, 0x4568, 0x0159, 0x1256, 0x1256, 0x1256, 0x1256, 0x1245, 0x156a, 0x5689, 0x0459, 0x1456, 0x1569, 0x4569, 0x1459, 0x0156, 0x2569, 0x459a, 0x1458]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5c90 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | const__data_1:
66 69 74 73 3a 20 74 3d 25 64 20 6f 3d 25 64 20 72 6f 77 3d 25 64 20 63 6f 6c 3d 25 64 0a 00 # 5cb8 |   .data str:"fits: t=%d o=%d row=%d col=%d\n"
                               #      | const__data_2:
6e 6f 74 20 66 69 74 21 0a 00  # 5cd7 |   .data str:"not fit!\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5ce1
                               #      | SECTION_BEGIN_static_data:
                               # 5ce1 |   .align dummy_size:15 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5cf0 |   .bss size:1280 align:16
                               #      | var__rand__state:
                               # 61f0 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 61f2 |   .bss size:220 align:1
                               #      | var__board__points:
                               # 62ce |   .bss size:2 align:1
                               #      | var__board__level:
                               # 62d0 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 62d2 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 62da |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 62e2 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 62ea |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 62ec |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
