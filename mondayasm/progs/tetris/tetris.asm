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
                               #      | _A_call_1:
e0 00                          # 500a |   push 0
e0 00                          # 500c |   push 0
5c f8 49 00                    # 500e |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 5012 |   mov SP, SP + 0x4
                               #      | _Z_call_1:
                               #      | _A_call_3:
5c f8 63 00                    # 5016 |   call ${fn_reset_color_palette}:rel + PC
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 00                          # 501a |   push 0
e0 e0 8c 00                    # 501c |   push 0x8c
e0 e0 ff 00                    # 5020 |   push 0xff
e0 1c 07                       # 5024 |   push 0x7
5c f8 b2 00                    # 5027 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 502b |   mov SP, SP + 0x8
                               #      | _Z_call_4:
                               #      | _A_call_11:
5c f8 cb 00                    # 502f |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_11:
                               #      |   # game loop
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
                               #      | _A_call_27:
5c f8 cb 01                    # 5033 |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_27:
e8 ff 00 f8 1f 00              # 5037 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_call_46:
e0 e0 d9 54                    # 503d |   push ${fn_handle_keyboard}
e0 e0 e0 93                    # 5041 |   push 0x93e0
e0 1c 04                       # 5045 |   push 0x4
e0 00                          # 5048 |   push 0
5c f8 18 06                    # 504a |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 504e |   mov SP, SP + 0x8
                               #      | _Z_call_46:
                               #      | _BZ_loop_1:
58 f8 e1 ff                    # 5052 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_main:
dc                             # 5056 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # 5057 |   push B
e0 20                          # 5059 |   push A
61 20 bc 08                    # 505b |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 505f |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 5064 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 60 57 5f 5c 01     # 506b |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # 5074 |   pop A
e4 40                          # 5076 |   pop B
dc                             # 5078 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_reset_color_palette:
                               #      | _begin_fn_reset_color_palette:
e0 80                          # 5079 |   push D
e0 60                          # 507b |   push C
e0 40                          # 507d |   push B
e0 20                          # 507f |   push A
                               #      | _A_for_1:
60 20 00                       # 5081 |   mov A, 0
                               #      | _BA_for_1:
fc 20 1c f8 08 4c 00           # 5084 |   jge A, 0x8, ${_C_for_1}:rel + PC
98 40 20 1c 02                 # 508b |   getb B, A, 0x2
                               #      | _A_if_1:
e8 40 00 f8 0b 00              # 5090 |   jeq B, 0, ${_E_if_1}:rel + PC
60 40 e0 ff 00                 # 5096 |   mov B, 0xff
                               #      | _E_if_1:
                               #      | _C_if_1:
                               #      | _Z_if_1:
98 60 20 1c 01                 # 509b |   getb C, A, 0x1
                               #      | _A_if_2:
e8 60 00 f8 0b 00              # 50a0 |   jeq C, 0, ${_E_if_2}:rel + PC
60 60 e0 ff 00                 # 50a6 |   mov C, 0xff
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
98 80 20 00                    # 50ab |   getb D, A, 0
                               #      | _A_if_3:
e8 80 00 f8 0b 00              # 50af |   jeq D, 0, ${_E_if_3}:rel + PC
60 80 e0 ff 00                 # 50b5 |   mov D, 0xff
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _A_call_2:
e0 80                          # 50ba |   push D
e0 60                          # 50bc |   push C
e0 40                          # 50be |   push B
e0 20                          # 50c0 |   push A
5c f8 17 00                    # 50c2 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 50c6 |   mov SP, SP + 0x8
                               #      | _Z_call_2:
                               #      | _BZ_for_1:
44 20                          # 50ca |   inc A
58 f8 b8 ff                    # 50cc |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_reset_color_palette:
e4 20                          # 50d0 |   pop A
e4 40                          # 50d2 |   pop B
e4 60                          # 50d4 |   pop C
e4 80                          # 50d6 |   pop D
dc                             # 50d8 |   ret
                               #      | _end_fn_reset_color_palette:
                               #      | 
                               #      | fn_set_color_palette:
                               #      | _begin_fn_set_color_palette:
e0 20                          # 50d9 |   push A
ad 20 bc 1c 04 07              # 50db |   and A, [SP + 0x4], 0x7
28 20 1c 01                    # 50e1 |   shl A, 0x1
63 e4 bc 60 57 0a              # 50e5 |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc 70 57 08              # 50eb |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc 80 57 06              # 50f1 |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
                               #      | _cleanup_fn_set_color_palette:
e4 20                          # 50f7 |   pop A
dc                             # 50f9 |   ret
                               #      | _end_fn_set_color_palette:
                               #      | 
                               #      | fn_tg_init:
                               #      | _begin_fn_tg_init:
                               #      | _A_call_5:
e0 e0 dc 00                    # 50fa |   push 0xdc
e0 00                          # 50fe |   push 0
e0 e0 62 5c                    # 5100 |   push ${var__board__board_state}
5c f8 44 00                    # 5104 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5108 |   mov SP, SP + 0x6
                               #      | _Z_call_5:
62 e0 00 3e 5d                 # 510c |   mov [${var__board__points}], 0
62 e0 00 40 5d                 # 5111 |   mov [${var__board__level}], 0
62 e0 00 5a 5d                 # 5116 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 5c 5d                 # 511b |   mov [${var__board__lines_remaining}], 0
                               #      | _A_call_6:
e0 00                          # 5120 |   push 0
5c f8 5f 00                    # 5122 |   call ${fn_srand}:rel + PC
60 a0 bc 02                    # 5126 |   mov SP, SP + 0x2
                               #      | _Z_call_6:
                               #      | _A_call_9:
5c f8 5e 00                    # 512a |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_9:
                               #      | _A_call_10:
5c f8 5a 00                    # 512e |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_10:
ca e0 00 52 5d                 # 5132 |   dec [${var__board__stored}], 0
62 e0 00 54 5d                 # 5137 |   mov [${var__board__stored} + 0002], 0
62 e0 00 56 5d                 # 513c |   mov [${var__board__stored} + 0004], 0
62 e0 1c 50 5d 03              # 5141 |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_init:
dc                             # 5147 |   ret
                               #      | _end_fn_tg_init:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 5148 |   push B
e0 20                          # 514a |   push A
65 fe bc 08                    # 514c |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 5150 |   shl H, G, 0x8
30 ff fe                       # 5155 |   or H, G
61 20 bc 06                    # 5158 |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 515c |   add B, [SP + 0xa], A
                               #      | _A_while_1:
                               #      | _BA_while_1:
f8 3c 40 f8 02 12 00           # 5161 |   jgt A + 0x2, B, ${_C_while_1}:rel + PC
62 20 ff                       # 5168 |   mov [A], H
60 20 3c 02                    # 516b |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 f2 ff                    # 516f |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      | _A_if_4:
fc 20 40 f8 09 00              # 5173 |   jge A, B, ${_E_if_4}:rel + PC
66 20 ff                       # 5179 |   bmov [A], H
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _cleanup_fn_memset:
e4 20                          # 517c |   pop A
e4 40                          # 517e |   pop B
dc                             # 5180 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc 60 5c 02              # 5181 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 5187 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_7:
e0 1c 08                       # 5188 |   push 0x8
e0 e0 4a 5d                    # 518b |   push ${var__board__next}
e0 e0 42 5d                    # 518f |   push ${var__board__falling}
5c f8 27 00                    # 5193 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 5197 |   mov SP, SP + 0x6
                               #      | _Z_call_7:
                               #      |   # fill new Board.next
                               #      | _A_call_8:
5c f8 58 00                    # 519b |   call ${fn_rand}:rel + PC
                               #      | _Z_call_8:
90 fe ff 1c 07                 # 519f |   div G, H, 0x7
c6 e0 ff 4a 5d                 # 51a4 |   inc [${var__board__next}], H
62 e0 00 4c 5d                 # 51a9 |   mov [${var__board__next} + 0002], 0
62 e0 00 4e 5d                 # 51ae |   mov [${var__board__next} + 0004], 0
62 e0 1c 50 5d 03              # 51b3 |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_new_falling:
dc                             # 51b9 |   ret
                               #      | _end_fn_tg_new_falling:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 51ba |   push C
e0 40                          # 51bc |   push B
e0 20                          # 51be |   push A
61 20 bc 08                    # 51c0 |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 51c4 |   add B, [SP + 0xc], A
61 60 bc 0a                    # 51c9 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
f8 3c 40 f8 02 16 00           # 51cd |   jgt A + 0x2, B, ${_C_while_2}:rel + PC
63 20 60                       # 51d4 |   mov [A], [C]
60 20 3c 02                    # 51d7 |   mov A, A + 0x2
60 60 7c 02                    # 51db |   mov C, C + 0x2
                               #      | _BZ_while_2:
58 f8 ee ff                    # 51df |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _A_if_5:
fc 20 40 f8 09 00              # 51e3 |   jge A, B, ${_E_if_5}:rel + PC
67 20 60                       # 51e9 |   bmov [A], [C]
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 51ec |   pop A
e4 40                          # 51ee |   pop B
e4 60                          # 51f0 |   pop C
dc                             # 51f2 |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 60 5c                 # 51f3 |   inc H, [${var__rand__state}]
62 e0 ff 60 5c                 # 51f8 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 51fd |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_17:
5c f8 26 00                    # 51fe |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_17:
                               #      | _A_if_14:
e8 ff 00 f8 0a 00              # 5202 |   jeq H, 0, ${_E_if_14}:rel + PC
                               #      | _A_call_21:
5c f8 7b 01                    # 5208 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_21:
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
                               #      | _A_call_22:
5c f8 62 02                    # 520c |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_22:
                               #      | _A_call_23:
e0 ff                          # 5210 |   push H
5c f8 60 02                    # 5212 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5216 |   mov SP, SP + 0x2
                               #      | _Z_call_23:
                               #      | _A_call_26:
5c f8 59 02                    # 521a |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_26:
84 ff 1c ff 01                 # 521e |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5223 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 5224 |   push A
4a e0 5a 5d                    # 5226 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_6:
d2 e0 00 5a 5d                 # 522a |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 54 00                    # 522f |   jgt ${_E_if_6}:rel + PC
                               #      | _A_call_12:
e0 00                          # 5233 |   push 0
5c f8 54 00                    # 5235 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5239 |   mov SP, SP + 0x2
                               #      | _Z_call_12:
46 e0 46 5d                    # 523d |   inc [${var__board__falling} + 0004]
                               #      | _A_call_13:
5c f8 bb 00                    # 5241 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_13:
                               #      | _A_if_13:
ec ff 1c f8 01 19 00           # 5245 |   jne H, 0x1, ${_E_if_13}:rel + PC
a9 20 e0 1c 40 5d 01           # 524c |   shl A, [${var__board__level}], 0x1
63 e0 e4 5a 5d 35 57           # 5253 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 525a |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
4a e0 46 5d                    # 525e |   dec [${var__board__falling} + 0004]
                               #      | _A_call_14:
e0 1c 01                       # 5262 |   push 0x1
5c f8 24 00                    # 5265 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5269 |   mov SP, SP + 0x2
                               #      | _Z_call_14:
                               #      | _A_call_15:
5c f8 1b ff                    # 526d |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_15:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _A_call_16:
e0 1c 01                       # 5271 |   push 0x1
5c f8 15 00                    # 5274 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5278 |   mov SP, SP + 0x2
                               #      | _Z_call_16:
c4 ff 00                       # 527c |   inc H, 0
58 f8 07 00                    # 527f |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
60 ff 00                       # 5283 |   mov H, 0
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 5286 |   pop A
dc                             # 5288 |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 5289 |   push D
e0 60                          # 528b |   push C
e0 40                          # 528d |   push B
e0 20                          # 528f |   push A
61 20 bc 0a                    # 5291 |   mov A, [SP + 0xa]
c9 40 e0 42 5d                 # 5295 |   dec B, [${var__board__falling}]
a9 80 e0 1c 44 5d 01           # 529a |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 52a1 |   mov D, B*8 + D
61 80 f0 fd 56                 # 52a4 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_2:
60 60 00                       # 52a9 |   mov C, 0
                               #      | _BA_for_2:
fc 60 1c f8 04 47 00           # 52ac |   jge C, 0x4, ${_C_for_2}:rel + PC
a0 40 80 7e 02                 # 52b3 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 52b8 |   shr E, D, C*4
2c 40 1c 03                    # 52bc |   and B, 0x3
2c fc 1c 03                    # 52c0 |   and E, 0x3
81 fe e0 40 46 5d              # 52c4 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc 48 5d              # 52ca |   add B, [${var__board__falling} + 0006], E
88 fd fe 1c 0a                 # 52d0 |   mul F, G, 0xa
00 fd e8 62 5c                 # 52d5 |   add F, ${var__board__board_state} + B
                               #      | _A_if_7:
ee bc 00 f8 0a 0e 00           # 52da |   jne [SP + 0xa], 0, ${_E_if_7}:rel + PC
66 fd 00                       # 52e1 |   bmov [F], 0
58 f8 09 00                    # 52e4 |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
67 fd e0 42 5d                 # 52e8 |   bmov [F], [${var__board__falling}]
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _BZ_for_2:
44 60                          # 52ed |   inc C
58 f8 bd ff                    # 52ef |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 52f3 |   pop A
e4 40                          # 52f5 |   pop B
e4 60                          # 52f7 |   pop C
e4 80                          # 52f9 |   pop D
dc                             # 52fb |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 52fc |   push D
e0 60                          # 52fe |   push C
e0 40                          # 5300 |   push B
e0 20                          # 5302 |   push A
c9 40 e0 42 5d                 # 5304 |   dec B, [${var__board__falling}]
a9 80 e0 1c 44 5d 01           # 5309 |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 5310 |   mov D, B*8 + D
61 80 f0 fd 56                 # 5313 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_3:
60 60 00                       # 5318 |   mov C, 0
                               #      | _BA_for_3:
fc 60 1c f8 04 5c 00           # 531b |   jge C, 0x4, ${_C_for_3}:rel + PC
a0 20 80 7e 02                 # 5322 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 5327 |   shr E, D, C*4
2c 20 1c 03                    # 532b |   and A, 0x3
2c fc 1c 03                    # 532f |   and E, 0x3
81 fe e0 20 46 5d              # 5333 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc 48 5d              # 5339 |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 533f |   mov H, 0
d0 fe 00                       # 5342 |   icmp G, 0
70 f8 35 00                    # 5345 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 5349 |   icmp B, 0
70 f8 2e 00                    # 534c |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2a 00           # 5350 |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 23 00           # 5357 |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 535e |   mul F, G, 0xa
00 fd e8 62 5c                 # 5363 |   add F, ${var__board__board_state} + B
65 fd fd                       # 5368 |   bmov F, [F]
ec fd 00 f8 0f 00              # 536b |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_3:
44 60                          # 5371 |   inc C
58 f8 a8 ff                    # 5373 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      |   # done checking, all good
c4 ff 00                       # 5377 |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 537a |   pop A
e4 40                          # 537c |   pop B
e4 60                          # 537e |   pop C
e4 80                          # 5380 |   pop D
dc                             # 5382 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 5383 |   push D
e0 60                          # 5385 |   push C
e0 40                          # 5387 |   push B
e0 20                          # 5389 |   push A
                               #      | _A_for_4:
60 20 00                       # 538b |   mov A, 0
                               #      | _BA_for_4:
fc 20 1c f8 16 a4 00           # 538e |   jge A, 0x16, ${_C_for_4}:rel + PC
                               #      | _A_for_5:
c4 60 00                       # 5395 |   inc C, 0
                               #      | _BA_for_5:
fc 60 1c f8 08 94 00           # 5398 |   jge C, 0x8, ${_C_for_5}:rel + PC
                               #      | _A_call_18:
e0 60                          # 539f |   push C
e0 3c 02                       # 53a1 |   push A + 0x2
5c f8 b3 fc                    # 53a4 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 53a8 |   mov SP, SP + 0x4
                               #      | _Z_call_18:
                               #      | _A_for_6:
60 40 00                       # 53ac |   mov B, 0
                               #      | _BA_for_6:
fc 40 1c f8 0a 75 00           # 53af |   jge B, 0xa, ${_C_for_6}:rel + PC
88 80 1c 20 0a                 # 53b6 |   mul D, 0xa, A
80 80 88 e0 62 5c              # 53bb |   add D, D + B, ${var__board__board_state}
65 80 80                       # 53c1 |   bmov D, [D]
2c 80 60                       # 53c4 |   and D, C
60 ff 00                       # 53c7 |   mov H, 0
                               #      | _A_if_15:
e8 80 00 f8 0a 00              # 53ca |   jeq D, 0, ${_E_if_15}:rel + PC
60 ff 1c ff                    # 53d0 |   mov H, -1
                               #      | _E_if_15:
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _A_if_16:
ec 60 1c f8 01 17 00           # 53d4 |   jne C, 0x1, ${_E_if_16}:rel + PC
30 ff 1c 01                    # 53db |   or H, 0x1
                               #      | _A_if_17:
ec 40 1c f8 09 0c 00           # 53df |   jne B, 0x9, ${_E_if_17}:rel + PC
30 ff e0 00 80                 # 53e6 |   or H, 0x8000
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _A_call_19:
e0 ff                          # 53eb |   push H
e0 5c 0a                       # 53ed |   push B + 0xa
5c f8 4b 00                    # 53f0 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # 53f4 |   mov SP, SP + 0x4
                               #      | _Z_call_19:
                               #      | _A_if_18:
ec 60 1c f8 01 26 00           # 53f8 |   jne C, 0x1, ${_E_if_18}:rel + PC
                               #      | _A_call_20:
e0 5c 0a                       # 53ff |   push B + 0xa
5c f8 60 00                    # 5402 |   call ${fn_get_cell_addr}:rel + PC
60 a0 bc 02                    # 5406 |   mov SP, SP + 0x2
                               #      | _Z_call_20:
62 ff 1c ff                    # 540a |   mov [H], -1
                               #      | _A_if_19:
ec 20 1c f8 15 10 00           # 540e |   jne A, 0x15, ${_E_if_19}:rel + PC
00 ff e0 b0 04                 # 5415 |   add H, 0x4b0
62 ff 1c ff                    # 541a |   mov [H], -1
                               #      | _E_if_19:
                               #      | _C_if_19:
                               #      | _Z_if_19:
                               #      | _E_if_18:
                               #      | _C_if_18:
                               #      | _Z_if_18:
                               #      | _BZ_for_6:
44 40                          # 541e |   inc B
58 f8 8f ff                    # 5420 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _BZ_for_5:
28 60 1c 01                    # 5424 |   shl C, 0x1
58 f8 70 ff                    # 5428 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _BZ_for_4:
44 20                          # 542c |   inc A
58 f8 60 ff                    # 542e |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_display_board:
e4 20                          # 5432 |   pop A
e4 40                          # 5434 |   pop B
e4 60                          # 5436 |   pop C
e4 80                          # 5438 |   pop D
dc                             # 543a |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # 543b |   push A
61 fe bc 06                    # 543d |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # 5441 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_7:
60 20 e4 60 57                 # 5447 |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_7:
fc 20 e0 f8 60 5c 13 00        # 544c |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_7}:rel + PC
62 20 fe                       # 5454 |   mov [A], G
                               #      | _BZ_for_7:
60 20 3c 50                    # 5457 |   mov A, A + 0x50
58 f8 f1 ff                    # 545b |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # 545f |   pop A
dc                             # 5461 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_get_cell_addr:
                               #      | _begin_fn_get_cell_addr:
a9 ff bc 1c 02 01              # 5462 |   shl H, [SP + 0x2], 0x1
00 ff e0 60 57                 # 5468 |   add H, ${var__VIDEO_ROW_BUFFER}
                               #      | _cleanup_fn_get_cell_addr:
dc                             # 546d |   ret
                               #      | _end_fn_get_cell_addr:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 546e |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 5471 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 5472 |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 5473 |   push D
e0 60                          # 5475 |   push C
e0 40                          # 5477 |   push B
e0 20                          # 5479 |   push A
60 60 00                       # 547b |   mov C, 0
                               #      | _A_call_24:
e0 00                          # 547e |   push 0
5c f8 09 fe                    # 5480 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5484 |   mov SP, SP + 0x2
                               #      | _Z_call_24:
                               #      | _A_for_8:
60 20 00                       # 5488 |   mov A, 0
                               #      | _BA_for_8:
fc 20 1c f8 02 37 00           # 548b |   jge A, 0x2, ${_C_for_8}:rel + PC
                               #      | _A_for_9:
60 40 00                       # 5492 |   mov B, 0
                               #      | _BA_for_9:
fc 40 1c f8 0a 27 00           # 5495 |   jge B, 0xa, ${_C_for_9}:rel + PC
88 80 20 1c 0a                 # 549c |   mul D, A, 0xa
00 80 e8 62 5c                 # 54a1 |   add D, ${var__board__board_state} + B
65 ff 80                       # 54a6 |   bmov H, [D]
                               #      | _A_if_20:
e8 ff 00 f8 0d 00              # 54a9 |   jeq H, 0, ${_E_if_20}:rel + PC
c4 60 00                       # 54af |   inc C, 0
58 f8 10 00                    # 54b2 |   jmp ${_C_for_8}:rel + PC
                               #      | _E_if_20:
                               #      | _C_if_20:
                               #      | _Z_if_20:
                               #      | _BZ_for_9:
44 40                          # 54b6 |   inc B
58 f8 dd ff                    # 54b8 |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
                               #      | _BZ_for_8:
44 20                          # 54bc |   inc A
58 f8 cd ff                    # 54be |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _A_call_25:
e0 1c 01                       # 54c2 |   push 0x1
5c f8 c4 fd                    # 54c5 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54c9 |   mov SP, SP + 0x2
                               #      | _Z_call_25:
60 ff 60                       # 54cd |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 54d0 |   pop A
e4 40                          # 54d2 |   pop B
e4 60                          # 54d4 |   pop C
e4 80                          # 54d6 |   pop D
dc                             # 54d8 |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 fe e0 06 ff                 # 54d9 |   mov G, [0xff06]
ac ff fe e0 00 80              # 54de |   and H, G, 0x8000
e8 ff 00 f8 7e 00              # 54e4 |   jeq H, 0, ${_C_loop_2}:rel + PC
a9 ff e0 1c 5e 5d 08           # 54ea |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 54f1 |   and G, 0xff
30 ff fe                       # 54f6 |   or H, G
62 e0 ff 5e 5d                 # 54f9 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 54fe |   shr G, H, 0x8
2c ff e0 ff 00                 # 5503 |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 5508 |   jeq G, 0xf0, ${_BA_loop_2}:rel + PC
60 fe 00                       # 5510 |   mov G, 0
                               #      | _A_if_24:
ec ff 1c f8 75 0f 00           # 5513 |   jne H, 0x75, ${_E_if_24}:rel + PC
60 fe 1c 03                    # 551a |   mov G, 0x3
58 f8 2c 00                    # 551e |   jmp ${_C_if_24}:rel + PC
                               #      | _E_if_24:
ec ff 1c f8 74 0f 00           # 5522 |   jne H, 0x74, ${_E2_if_24}:rel + PC
60 fe 1c 02                    # 5529 |   mov G, 0x2
58 f8 1d 00                    # 552d |   jmp ${_C_if_24}:rel + PC
                               #      | _E2_if_24:
ec ff 1c f8 6b 0e 00           # 5531 |   jne H, 0x6b, ${_E3_if_24}:rel + PC
c4 fe 00                       # 5538 |   inc G, 0
58 f8 0f 00                    # 553b |   jmp ${_C_if_24}:rel + PC
                               #      | _E3_if_24:
ec ff 1c f8 72 0b 00           # 553f |   jne H, 0x72, ${_E4_if_24}:rel + PC
60 fe 1c 04                    # 5546 |   mov G, 0x4
                               #      | _E4_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
                               #      | _A_if_25:
e8 fe 00 f8 14 00              # 554a |   jeq G, 0, ${_E_if_25}:rel + PC
                               #      | _A_call_44:
e0 fe                          # 5550 |   push G
5c f8 11 00                    # 5552 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5556 |   mov SP, SP + 0x2
                               #      | _Z_call_44:
                               #      | _A_call_45:
5c f8 29 fe                    # 555a |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_45:
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _BZ_loop_2:
58 f8 7b ff                    # 555e |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_handle_keyboard:
dc                             # 5562 |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 5563 |   push A
61 20 bc 04                    # 5565 |   mov A, [SP + 0x4]
                               #      | _A_if_26:
ec 20 1c f8 01 16 00           # 5569 |   jne A, 0x1, ${_E_if_26}:rel + PC
                               #      | _A_call_31:
e0 1c ff                       # 5570 |   push -1
5c f8 3f 00                    # 5573 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5577 |   mov SP, SP + 0x2
                               #      | _Z_call_31:
58 f8 34 00                    # 557b |   jmp ${_C_if_26}:rel + PC
                               #      | _E_if_26:
ec 20 1c f8 02 16 00           # 557f |   jne A, 0x2, ${_E2_if_26}:rel + PC
                               #      | _A_call_32:
e0 1c 01                       # 5586 |   push 0x1
5c f8 29 00                    # 5589 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 558d |   mov SP, SP + 0x2
                               #      | _Z_call_32:
58 f8 1e 00                    # 5591 |   jmp ${_C_if_26}:rel + PC
                               #      | _E2_if_26:
ec 20 1c f8 04 0f 00           # 5595 |   jne A, 0x4, ${_E3_if_26}:rel + PC
                               #      | _A_call_37:
5c f8 42 00                    # 559c |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_37:
58 f8 0f 00                    # 55a0 |   jmp ${_C_if_26}:rel + PC
                               #      | _E3_if_26:
ec 20 1c f8 03 0b 00           # 55a4 |   jne A, 0x3, ${_E4_if_26}:rel + PC
                               #      | _A_call_43:
5c f8 63 00                    # 55ab |   call ${fn_tg_rotate}:rel + PC
                               #      | _Z_call_43:
                               #      | _E4_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 55af |   pop A
dc                             # 55b1 |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_28:
e0 00                          # 55b2 |   push 0
5c f8 d5 fc                    # 55b4 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 55b8 |   mov SP, SP + 0x2
                               #      | _Z_call_28:
03 e0 bc 48 5d 02              # 55bc |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_29:
5c f8 3a fd                    # 55c2 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_29:
                               #      | _A_if_27:
ec ff 00 f8 0c 00              # 55c6 |   jne H, 0, ${_E_if_27}:rel + PC
07 e0 bc 48 5d 02              # 55cc |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_27:
                               #      | _C_if_27:
                               #      | _Z_if_27:
                               #      | _A_call_30:
e0 1c 01                       # 55d2 |   push 0x1
5c f8 b4 fc                    # 55d5 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 55d9 |   mov SP, SP + 0x2
                               #      | _Z_call_30:
                               #      | _cleanup_fn_tg_move:
dc                             # 55dd |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_33:
e0 00                          # 55de |   push 0
5c f8 a9 fc                    # 55e0 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 55e4 |   mov SP, SP + 0x2
                               #      | _Z_call_33:
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
46 e0 46 5d                    # 55e8 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_34:
5c f8 10 fd                    # 55ec |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_34:
e8 ff 00 f8 0a 00              # 55f0 |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _BZ_loop_3:
58 f8 f2 ff                    # 55f6 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
4a e0 46 5d                    # 55fa |   dec [${var__board__falling} + 0004]
                               #      | _A_call_35:
e0 1c 01                       # 55fe |   push 0x1
5c f8 88 fc                    # 5601 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5605 |   mov SP, SP + 0x2
                               #      | _Z_call_35:
                               #      | _A_call_36:
5c f8 7f fb                    # 5609 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_36:
                               #      | _cleanup_fn_tg_down:
dc                             # 560d |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_38:
e0 00                          # 560e |   push 0
5c f8 79 fc                    # 5610 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5614 |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
c5 ff e0 44 5d                 # 5618 |   inc H, [${var__board__falling} + 0002]
2c ff 1c 03                    # 561d |   and H, 0x3
62 e0 ff 44 5d                 # 5621 |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_39:
5c f8 d6 fc                    # 5626 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_39:
ec ff 00 f8 2c 00              # 562a |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 48 5d                    # 5630 |   dec [${var__board__falling} + 0006]
                               #      | _A_call_40:
5c f8 c8 fc                    # 5634 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_40:
ec ff 00 f8 1e 00              # 5638 |   jne H, 0, ${_C_loop_4}:rel + PC
02 e0 1c 48 5d 02              # 563e |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_41:
5c f8 b8 fc                    # 5644 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_41:
ec ff 00 f8 0e 00              # 5648 |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 48 5d                    # 564e |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_4:
58 f8 c6 ff                    # 5652 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _A_call_42:
e0 1c 01                       # 5656 |   push 0x1
5c f8 30 fc                    # 5659 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 565d |   mov SP, SP + 0x2
                               #      | _Z_call_42:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 5661 |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5662 |   push D
e0 60                          # 5664 |   push C
e0 40                          # 5666 |   push B
e0 20                          # 5668 |   push A
61 40 e0 10 ff                 # 566a |   mov B, [0xff10]
61 60 e0 12 ff                 # 566f |   mov C, [0xff12]
61 80 e0 14 ff                 # 5674 |   mov D, [0xff14]
61 20 bc 0e                    # 5679 |   mov A, [SP + 0xe]
60 ff 00                       # 567d |   mov H, 0
                               #      | _A_if_32:
fc 28 20 f8 09 00              # 5680 |   jge A + B, A, ${_E_if_32}:rel + PC
c4 ff 00                       # 5686 |   inc H, 0
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
60 40 44                       # 5689 |   mov B, B + A
81 20 bc ff 0c                 # 568c |   add A, [SP + 0xc], H
60 ff 00                       # 5691 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 5694 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 569a |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 56a0 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 56a4 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 56a7 |   mov C, C + A
81 20 bc ff 0a                 # 56aa |   add A, [SP + 0xa], H
60 80 84                       # 56af |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 56b2 |   mov A, [SP + 0x10]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
61 ff e0 14 ff                 # 56b6 |   mov H, [0xff14]
                               #      | _A_if_35:
f4 ff 80 f8 0a 00              # 56bb |   jle H, D, ${_E_if_35}:rel + PC
58 f8 33 00                    # 56c1 |   jmp ${_C_loop_5}:rel + PC
                               #      | _E_if_35:
ec ff 80 f8 2b 00              # 56c5 |   jne H, D, ${_E2_if_35}:rel + PC
61 ff e0 12 ff                 # 56cb |   mov H, [0xff12]
                               #      | _A_if_36:
f4 ff 60 f8 0a 00              # 56d0 |   jle H, C, ${_E_if_36}:rel + PC
58 f8 1e 00                    # 56d6 |   jmp ${_C_loop_5}:rel + PC
                               #      | _E_if_36:
ec ff 60 f8 16 00              # 56da |   jne H, C, ${_E2_if_36}:rel + PC
fa e0 40 f8 10 ff 14 00        # 56e0 |   jgt [0xff10], B, ${_C_loop_5}:rel + PC
                               #      | _A_if_38:
e8 20 00 f8 08 00              # 56e8 |   jeq A, 0, ${_E_if_38}:rel + PC
5c 20                          # 56ee |   call A
                               #      | _E_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
                               #      | _E2_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _E2_if_35:
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _BZ_loop_5:
58 f8 c6 ff                    # 56f0 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 56f4 |   pop A
e4 40                          # 56f6 |   pop B
e4 60                          # 56f8 |   pop C
e4 80                          # 56fa |   pop D
dc                             # 56fc |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 56fd |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5735 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x575d
                               #      | SECTION_BEGIN_static_data:
                               # 575d |   .align dummy_size:3 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5760 |   .bss size:1280 align:16
                               #      | var__rand__state:
                               # 5c60 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 5c62 |   .bss size:220 align:1
                               #      | var__board__points:
                               # 5d3e |   .bss size:2 align:1
                               #      | var__board__level:
                               # 5d40 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 5d42 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 5d4a |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 5d52 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 5d5a |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 5d5c |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 5d5e |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
