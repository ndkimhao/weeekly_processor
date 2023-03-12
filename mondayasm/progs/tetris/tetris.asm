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
62 e0 00 ce 5d                 # 500a |   mov [${var__last_btn_in}], 0
                               #      | _A_call_1:
e0 00                          # 500f |   push 0
e0 00                          # 5011 |   push 0
5c f8 49 00                    # 5013 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 5017 |   mov SP, SP + 0x4
                               #      | _Z_call_1:
                               #      | _A_call_3:
5c f8 63 00                    # 501b |   call ${fn_reset_color_palette}:rel + PC
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 00                          # 501f |   push 0
e0 e0 8c 00                    # 5021 |   push 0x8c
e0 e0 ff 00                    # 5025 |   push 0xff
e0 1c 07                       # 5029 |   push 0x7
5c f8 b2 00                    # 502c |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 5030 |   mov SP, SP + 0x8
                               #      | _Z_call_4:
                               #      | _A_call_11:
5c f8 cb 00                    # 5034 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_11:
                               #      |   # game loop
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
                               #      | _A_call_27:
5c f8 cb 01                    # 5038 |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_27:
e8 ff 00 f8 1f 00              # 503c |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_call_48:
e0 e0 de 54                    # 5042 |   push ${fn_handle_keyboard}
e0 e0 e0 93                    # 5046 |   push 0x93e0
e0 1c 04                       # 504a |   push 0x4
e0 00                          # 504d |   push 0
5c f8 80 06                    # 504f |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5053 |   mov SP, SP + 0x8
                               #      | _Z_call_48:
                               #      | _BZ_loop_1:
58 f8 e1 ff                    # 5057 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_main:
dc                             # 505b |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # 505c |   push B
e0 20                          # 505e |   push A
61 20 bc 08                    # 5060 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 5064 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 5069 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c d0 57 cf 5c 01     # 5070 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # 5079 |   pop A
e4 40                          # 507b |   pop B
dc                             # 507d |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_reset_color_palette:
                               #      | _begin_fn_reset_color_palette:
e0 80                          # 507e |   push D
e0 60                          # 5080 |   push C
e0 40                          # 5082 |   push B
e0 20                          # 5084 |   push A
                               #      | _A_for_1:
60 20 00                       # 5086 |   mov A, 0
                               #      | _BA_for_1:
fc 20 1c f8 08 4c 00           # 5089 |   jge A, 0x8, ${_C_for_1}:rel + PC
98 40 20 1c 02                 # 5090 |   getb B, A, 0x2
                               #      | _A_if_1:
e8 40 00 f8 0b 00              # 5095 |   jeq B, 0, ${_E_if_1}:rel + PC
60 40 e0 ff 00                 # 509b |   mov B, 0xff
                               #      | _E_if_1:
                               #      | _C_if_1:
                               #      | _Z_if_1:
98 60 20 1c 01                 # 50a0 |   getb C, A, 0x1
                               #      | _A_if_2:
e8 60 00 f8 0b 00              # 50a5 |   jeq C, 0, ${_E_if_2}:rel + PC
60 60 e0 ff 00                 # 50ab |   mov C, 0xff
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
98 80 20 00                    # 50b0 |   getb D, A, 0
                               #      | _A_if_3:
e8 80 00 f8 0b 00              # 50b4 |   jeq D, 0, ${_E_if_3}:rel + PC
60 80 e0 ff 00                 # 50ba |   mov D, 0xff
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _A_call_2:
e0 80                          # 50bf |   push D
e0 60                          # 50c1 |   push C
e0 40                          # 50c3 |   push B
e0 20                          # 50c5 |   push A
5c f8 17 00                    # 50c7 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 50cb |   mov SP, SP + 0x8
                               #      | _Z_call_2:
                               #      | _BZ_for_1:
44 20                          # 50cf |   inc A
58 f8 b8 ff                    # 50d1 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_reset_color_palette:
e4 20                          # 50d5 |   pop A
e4 40                          # 50d7 |   pop B
e4 60                          # 50d9 |   pop C
e4 80                          # 50db |   pop D
dc                             # 50dd |   ret
                               #      | _end_fn_reset_color_palette:
                               #      | 
                               #      | fn_set_color_palette:
                               #      | _begin_fn_set_color_palette:
e0 20                          # 50de |   push A
ad 20 bc 1c 04 07              # 50e0 |   and A, [SP + 0x4], 0x7
28 20 1c 01                    # 50e6 |   shl A, 0x1
63 e4 bc d0 57 0a              # 50ea |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc e0 57 08              # 50f0 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc f0 57 06              # 50f6 |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
                               #      | _cleanup_fn_set_color_palette:
e4 20                          # 50fc |   pop A
dc                             # 50fe |   ret
                               #      | _end_fn_set_color_palette:
                               #      | 
                               #      | fn_tg_init:
                               #      | _begin_fn_tg_init:
                               #      | _A_call_5:
e0 e0 dc 00                    # 50ff |   push 0xdc
e0 00                          # 5103 |   push 0
e0 e0 d2 5c                    # 5105 |   push ${var__board__board_state}
5c f8 44 00                    # 5109 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 510d |   mov SP, SP + 0x6
                               #      | _Z_call_5:
62 e0 00 ae 5d                 # 5111 |   mov [${var__board__points}], 0
62 e0 00 b0 5d                 # 5116 |   mov [${var__board__level}], 0
62 e0 00 ca 5d                 # 511b |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 cc 5d                 # 5120 |   mov [${var__board__lines_remaining}], 0
                               #      | _A_call_6:
e0 00                          # 5125 |   push 0
5c f8 5f 00                    # 5127 |   call ${fn_srand}:rel + PC
60 a0 bc 02                    # 512b |   mov SP, SP + 0x2
                               #      | _Z_call_6:
                               #      | _A_call_9:
5c f8 5e 00                    # 512f |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_9:
                               #      | _A_call_10:
5c f8 5a 00                    # 5133 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_10:
ca e0 00 c2 5d                 # 5137 |   dec [${var__board__stored}], 0
62 e0 00 c4 5d                 # 513c |   mov [${var__board__stored} + 0002], 0
62 e0 00 c6 5d                 # 5141 |   mov [${var__board__stored} + 0004], 0
62 e0 1c c0 5d 03              # 5146 |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_init:
dc                             # 514c |   ret
                               #      | _end_fn_tg_init:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 514d |   push B
e0 20                          # 514f |   push A
65 fe bc 08                    # 5151 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 5155 |   shl H, G, 0x8
30 ff fe                       # 515a |   or H, G
61 20 bc 06                    # 515d |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 5161 |   add B, [SP + 0xa], A
                               #      | _A_while_1:
                               #      | _BA_while_1:
f8 3c 40 f8 02 12 00           # 5166 |   jgt A + 0x2, B, ${_C_while_1}:rel + PC
62 20 ff                       # 516d |   mov [A], H
60 20 3c 02                    # 5170 |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 f2 ff                    # 5174 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      | _A_if_4:
fc 20 40 f8 09 00              # 5178 |   jge A, B, ${_E_if_4}:rel + PC
66 20 ff                       # 517e |   bmov [A], H
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _cleanup_fn_memset:
e4 20                          # 5181 |   pop A
e4 40                          # 5183 |   pop B
dc                             # 5185 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc d0 5c 02              # 5186 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 518c |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_7:
e0 1c 08                       # 518d |   push 0x8
e0 e0 ba 5d                    # 5190 |   push ${var__board__next}
e0 e0 b2 5d                    # 5194 |   push ${var__board__falling}
5c f8 27 00                    # 5198 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 519c |   mov SP, SP + 0x6
                               #      | _Z_call_7:
                               #      |   # fill new Board.next
                               #      | _A_call_8:
5c f8 58 00                    # 51a0 |   call ${fn_rand}:rel + PC
                               #      | _Z_call_8:
90 fe ff 1c 07                 # 51a4 |   div G, H, 0x7
c6 e0 ff ba 5d                 # 51a9 |   inc [${var__board__next}], H
62 e0 00 bc 5d                 # 51ae |   mov [${var__board__next} + 0002], 0
62 e0 00 be 5d                 # 51b3 |   mov [${var__board__next} + 0004], 0
62 e0 1c c0 5d 03              # 51b8 |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_new_falling:
dc                             # 51be |   ret
                               #      | _end_fn_tg_new_falling:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 51bf |   push C
e0 40                          # 51c1 |   push B
e0 20                          # 51c3 |   push A
61 20 bc 08                    # 51c5 |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 51c9 |   add B, [SP + 0xc], A
61 60 bc 0a                    # 51ce |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
f8 3c 40 f8 02 16 00           # 51d2 |   jgt A + 0x2, B, ${_C_while_2}:rel + PC
63 20 60                       # 51d9 |   mov [A], [C]
60 20 3c 02                    # 51dc |   mov A, A + 0x2
60 60 7c 02                    # 51e0 |   mov C, C + 0x2
                               #      | _BZ_while_2:
58 f8 ee ff                    # 51e4 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _A_if_5:
fc 20 40 f8 09 00              # 51e8 |   jge A, B, ${_E_if_5}:rel + PC
67 20 60                       # 51ee |   bmov [A], [C]
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 51f1 |   pop A
e4 40                          # 51f3 |   pop B
e4 60                          # 51f5 |   pop C
dc                             # 51f7 |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 d0 5c                 # 51f8 |   inc H, [${var__rand__state}]
62 e0 ff d0 5c                 # 51fd |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5202 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_17:
5c f8 26 00                    # 5203 |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_17:
                               #      | _A_if_14:
e8 ff 00 f8 0a 00              # 5207 |   jeq H, 0, ${_E_if_14}:rel + PC
                               #      | _A_call_21:
5c f8 7b 01                    # 520d |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_21:
                               #      | _E_if_14:
                               #      | _C_if_14:
                               #      | _Z_if_14:
                               #      | _A_call_22:
5c f8 62 02                    # 5211 |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_22:
                               #      | _A_call_23:
e0 ff                          # 5215 |   push H
5c f8 60 02                    # 5217 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 521b |   mov SP, SP + 0x2
                               #      | _Z_call_23:
                               #      | _A_call_26:
5c f8 59 02                    # 521f |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_26:
84 ff 1c ff 01                 # 5223 |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 5228 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 5229 |   push A
4a e0 ca 5d                    # 522b |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_6:
d2 e0 00 ca 5d                 # 522f |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 54 00                    # 5234 |   jgt ${_E_if_6}:rel + PC
                               #      | _A_call_12:
e0 00                          # 5238 |   push 0
5c f8 54 00                    # 523a |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 523e |   mov SP, SP + 0x2
                               #      | _Z_call_12:
46 e0 b6 5d                    # 5242 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_13:
5c f8 bb 00                    # 5246 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_13:
                               #      | _A_if_13:
ec ff 1c f8 01 19 00           # 524a |   jne H, 0x1, ${_E_if_13}:rel + PC
a9 20 e0 1c b0 5d 01           # 5251 |   shl A, [${var__board__level}], 0x1
63 e0 e4 ca 5d a2 57           # 5258 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 525f |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
4a e0 b6 5d                    # 5263 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_14:
e0 1c 01                       # 5267 |   push 0x1
5c f8 24 00                    # 526a |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 526e |   mov SP, SP + 0x2
                               #      | _Z_call_14:
                               #      | _A_call_15:
5c f8 1b ff                    # 5272 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_15:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _A_call_16:
e0 1c 01                       # 5276 |   push 0x1
5c f8 15 00                    # 5279 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 527d |   mov SP, SP + 0x2
                               #      | _Z_call_16:
c4 ff 00                       # 5281 |   inc H, 0
58 f8 07 00                    # 5284 |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
60 ff 00                       # 5288 |   mov H, 0
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 528b |   pop A
dc                             # 528d |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 528e |   push D
e0 60                          # 5290 |   push C
e0 40                          # 5292 |   push B
e0 20                          # 5294 |   push A
61 20 bc 0a                    # 5296 |   mov A, [SP + 0xa]
c9 40 e0 b2 5d                 # 529a |   dec B, [${var__board__falling}]
a9 80 e0 1c b4 5d 01           # 529f |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 52a6 |   mov D, B*8 + D
61 80 f0 6a 57                 # 52a9 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_2:
60 60 00                       # 52ae |   mov C, 0
                               #      | _BA_for_2:
fc 60 1c f8 04 47 00           # 52b1 |   jge C, 0x4, ${_C_for_2}:rel + PC
a0 40 80 7e 02                 # 52b8 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 52bd |   shr E, D, C*4
2c 40 1c 03                    # 52c1 |   and B, 0x3
2c fc 1c 03                    # 52c5 |   and E, 0x3
81 fe e0 40 b6 5d              # 52c9 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc b8 5d              # 52cf |   add B, [${var__board__falling} + 0006], E
88 fd fe 1c 0a                 # 52d5 |   mul F, G, 0xa
00 fd e8 d2 5c                 # 52da |   add F, ${var__board__board_state} + B
                               #      | _A_if_7:
ee bc 00 f8 0a 0e 00           # 52df |   jne [SP + 0xa], 0, ${_E_if_7}:rel + PC
66 fd 00                       # 52e6 |   bmov [F], 0
58 f8 09 00                    # 52e9 |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
67 fd e0 b2 5d                 # 52ed |   bmov [F], [${var__board__falling}]
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _BZ_for_2:
44 60                          # 52f2 |   inc C
58 f8 bd ff                    # 52f4 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 52f8 |   pop A
e4 40                          # 52fa |   pop B
e4 60                          # 52fc |   pop C
e4 80                          # 52fe |   pop D
dc                             # 5300 |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 5301 |   push D
e0 60                          # 5303 |   push C
e0 40                          # 5305 |   push B
e0 20                          # 5307 |   push A
c9 40 e0 b2 5d                 # 5309 |   dec B, [${var__board__falling}]
a9 80 e0 1c b4 5d 01           # 530e |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 5315 |   mov D, B*8 + D
61 80 f0 6a 57                 # 5318 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_3:
60 60 00                       # 531d |   mov C, 0
                               #      | _BA_for_3:
fc 60 1c f8 04 5c 00           # 5320 |   jge C, 0x4, ${_C_for_3}:rel + PC
a0 20 80 7e 02                 # 5327 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 532c |   shr E, D, C*4
2c 20 1c 03                    # 5330 |   and A, 0x3
2c fc 1c 03                    # 5334 |   and E, 0x3
81 fe e0 20 b6 5d              # 5338 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc b8 5d              # 533e |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 5344 |   mov H, 0
d0 fe 00                       # 5347 |   icmp G, 0
70 f8 35 00                    # 534a |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 534e |   icmp B, 0
70 f8 2e 00                    # 5351 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2a 00           # 5355 |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 23 00           # 535c |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 5363 |   mul F, G, 0xa
00 fd e8 d2 5c                 # 5368 |   add F, ${var__board__board_state} + B
65 fd fd                       # 536d |   bmov F, [F]
ec fd 00 f8 0f 00              # 5370 |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_3:
44 60                          # 5376 |   inc C
58 f8 a8 ff                    # 5378 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      |   # done checking, all good
c4 ff 00                       # 537c |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 537f |   pop A
e4 40                          # 5381 |   pop B
e4 60                          # 5383 |   pop C
e4 80                          # 5385 |   pop D
dc                             # 5387 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 5388 |   push D
e0 60                          # 538a |   push C
e0 40                          # 538c |   push B
e0 20                          # 538e |   push A
                               #      | _A_for_4:
60 20 00                       # 5390 |   mov A, 0
                               #      | _BA_for_4:
fc 20 1c f8 16 a4 00           # 5393 |   jge A, 0x16, ${_C_for_4}:rel + PC
                               #      | _A_for_5:
c4 60 00                       # 539a |   inc C, 0
                               #      | _BA_for_5:
fc 60 1c f8 08 94 00           # 539d |   jge C, 0x8, ${_C_for_5}:rel + PC
                               #      | _A_call_18:
e0 60                          # 53a4 |   push C
e0 3c 02                       # 53a6 |   push A + 0x2
5c f8 b3 fc                    # 53a9 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 53ad |   mov SP, SP + 0x4
                               #      | _Z_call_18:
                               #      | _A_for_6:
60 40 00                       # 53b1 |   mov B, 0
                               #      | _BA_for_6:
fc 40 1c f8 0a 75 00           # 53b4 |   jge B, 0xa, ${_C_for_6}:rel + PC
88 80 1c 20 0a                 # 53bb |   mul D, 0xa, A
80 80 88 e0 d2 5c              # 53c0 |   add D, D + B, ${var__board__board_state}
65 80 80                       # 53c6 |   bmov D, [D]
2c 80 60                       # 53c9 |   and D, C
60 ff 00                       # 53cc |   mov H, 0
                               #      | _A_if_15:
e8 80 00 f8 0a 00              # 53cf |   jeq D, 0, ${_E_if_15}:rel + PC
60 ff 1c ff                    # 53d5 |   mov H, -1
                               #      | _E_if_15:
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _A_if_16:
ec 60 1c f8 01 17 00           # 53d9 |   jne C, 0x1, ${_E_if_16}:rel + PC
30 ff 1c 01                    # 53e0 |   or H, 0x1
                               #      | _A_if_17:
ec 40 1c f8 09 0c 00           # 53e4 |   jne B, 0x9, ${_E_if_17}:rel + PC
30 ff e0 00 80                 # 53eb |   or H, 0x8000
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _A_call_19:
e0 ff                          # 53f0 |   push H
e0 5c 0a                       # 53f2 |   push B + 0xa
5c f8 4b 00                    # 53f5 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # 53f9 |   mov SP, SP + 0x4
                               #      | _Z_call_19:
                               #      | _A_if_18:
ec 60 1c f8 01 26 00           # 53fd |   jne C, 0x1, ${_E_if_18}:rel + PC
                               #      | _A_call_20:
e0 5c 0a                       # 5404 |   push B + 0xa
5c f8 60 00                    # 5407 |   call ${fn_get_cell_addr}:rel + PC
60 a0 bc 02                    # 540b |   mov SP, SP + 0x2
                               #      | _Z_call_20:
62 ff 1c ff                    # 540f |   mov [H], -1
                               #      | _A_if_19:
ec 20 1c f8 15 10 00           # 5413 |   jne A, 0x15, ${_E_if_19}:rel + PC
00 ff e0 b0 04                 # 541a |   add H, 0x4b0
62 ff 1c ff                    # 541f |   mov [H], -1
                               #      | _E_if_19:
                               #      | _C_if_19:
                               #      | _Z_if_19:
                               #      | _E_if_18:
                               #      | _C_if_18:
                               #      | _Z_if_18:
                               #      | _BZ_for_6:
44 40                          # 5423 |   inc B
58 f8 8f ff                    # 5425 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _BZ_for_5:
28 60 1c 01                    # 5429 |   shl C, 0x1
58 f8 70 ff                    # 542d |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _BZ_for_4:
44 20                          # 5431 |   inc A
58 f8 60 ff                    # 5433 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_display_board:
e4 20                          # 5437 |   pop A
e4 40                          # 5439 |   pop B
e4 60                          # 543b |   pop C
e4 80                          # 543d |   pop D
dc                             # 543f |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # 5440 |   push A
61 fe bc 06                    # 5442 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # 5446 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_7:
60 20 e4 d0 57                 # 544c |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_7:
fc 20 e0 f8 d0 5c 13 00        # 5451 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_7}:rel + PC
62 20 fe                       # 5459 |   mov [A], G
                               #      | _BZ_for_7:
60 20 3c 50                    # 545c |   mov A, A + 0x50
58 f8 f1 ff                    # 5460 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # 5464 |   pop A
dc                             # 5466 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_get_cell_addr:
                               #      | _begin_fn_get_cell_addr:
a9 ff bc 1c 02 01              # 5467 |   shl H, [SP + 0x2], 0x1
00 ff e0 d0 57                 # 546d |   add H, ${var__VIDEO_ROW_BUFFER}
                               #      | _cleanup_fn_get_cell_addr:
dc                             # 5472 |   ret
                               #      | _end_fn_get_cell_addr:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 5473 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 5476 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 5477 |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 5478 |   push D
e0 60                          # 547a |   push C
e0 40                          # 547c |   push B
e0 20                          # 547e |   push A
60 60 00                       # 5480 |   mov C, 0
                               #      | _A_call_24:
e0 00                          # 5483 |   push 0
5c f8 09 fe                    # 5485 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5489 |   mov SP, SP + 0x2
                               #      | _Z_call_24:
                               #      | _A_for_8:
60 20 00                       # 548d |   mov A, 0
                               #      | _BA_for_8:
fc 20 1c f8 02 37 00           # 5490 |   jge A, 0x2, ${_C_for_8}:rel + PC
                               #      | _A_for_9:
60 40 00                       # 5497 |   mov B, 0
                               #      | _BA_for_9:
fc 40 1c f8 0a 27 00           # 549a |   jge B, 0xa, ${_C_for_9}:rel + PC
88 80 20 1c 0a                 # 54a1 |   mul D, A, 0xa
00 80 e8 d2 5c                 # 54a6 |   add D, ${var__board__board_state} + B
65 ff 80                       # 54ab |   bmov H, [D]
                               #      | _A_if_20:
e8 ff 00 f8 0d 00              # 54ae |   jeq H, 0, ${_E_if_20}:rel + PC
c4 60 00                       # 54b4 |   inc C, 0
58 f8 10 00                    # 54b7 |   jmp ${_C_for_8}:rel + PC
                               #      | _E_if_20:
                               #      | _C_if_20:
                               #      | _Z_if_20:
                               #      | _BZ_for_9:
44 40                          # 54bb |   inc B
58 f8 dd ff                    # 54bd |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
                               #      | _BZ_for_8:
44 20                          # 54c1 |   inc A
58 f8 cd ff                    # 54c3 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _A_call_25:
e0 1c 01                       # 54c7 |   push 0x1
5c f8 c4 fd                    # 54ca |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 54ce |   mov SP, SP + 0x2
                               #      | _Z_call_25:
60 ff 60                       # 54d2 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 54d5 |   pop A
e4 40                          # 54d7 |   pop B
e4 60                          # 54d9 |   pop C
e4 80                          # 54db |   pop D
dc                             # 54dd |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
e0 20                          # 54de |   push A
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 fe e0 06 ff                 # 54e0 |   mov G, [0xff06]
ac ff fe e0 00 80              # 54e5 |   and H, G, 0x8000
e8 ff 00 f8 7e 00              # 54eb |   jeq H, 0, ${_C_loop_2}:rel + PC
a9 ff e0 1c d0 5d 08           # 54f1 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 54f8 |   and G, 0xff
30 ff fe                       # 54fd |   or H, G
62 e0 ff d0 5d                 # 5500 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5505 |   shr G, H, 0x8
2c ff e0 ff 00                 # 550a |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 550f |   jeq G, 0xf0, ${_BA_loop_2}:rel + PC
60 fe 00                       # 5517 |   mov G, 0
                               #      | _A_if_24:
ec ff 1c f8 75 0f 00           # 551a |   jne H, 0x75, ${_E_if_24}:rel + PC
60 fe 1c 03                    # 5521 |   mov G, 0x3
58 f8 2c 00                    # 5525 |   jmp ${_C_if_24}:rel + PC
                               #      | _E_if_24:
ec ff 1c f8 74 0f 00           # 5529 |   jne H, 0x74, ${_E2_if_24}:rel + PC
60 fe 1c 02                    # 5530 |   mov G, 0x2
58 f8 1d 00                    # 5534 |   jmp ${_C_if_24}:rel + PC
                               #      | _E2_if_24:
ec ff 1c f8 6b 0e 00           # 5538 |   jne H, 0x6b, ${_E3_if_24}:rel + PC
c4 fe 00                       # 553f |   inc G, 0
58 f8 0f 00                    # 5542 |   jmp ${_C_if_24}:rel + PC
                               #      | _E3_if_24:
ec ff 1c f8 72 0b 00           # 5546 |   jne H, 0x72, ${_E4_if_24}:rel + PC
60 fe 1c 04                    # 554d |   mov G, 0x4
                               #      | _E4_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
                               #      | _A_if_25:
e8 fe 00 f8 14 00              # 5551 |   jeq G, 0, ${_E_if_25}:rel + PC
                               #      | _A_call_44:
e0 fe                          # 5557 |   push G
5c f8 77 00                    # 5559 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 555d |   mov SP, SP + 0x2
                               #      | _Z_call_44:
                               #      | _A_call_45:
5c f8 27 fe                    # 5561 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_45:
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _BZ_loop_2:
58 f8 7b ff                    # 5565 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
61 ff e0 0e ff                 # 5569 |   mov H, [0xff0e]
                               #      | _A_if_32:
e9 ff e0 f8 ce 5d 5f 00        # 556e |   jeq H, [${var__last_btn_in}], ${_E_if_32}:rel + PC
62 e0 ff ce 5d                 # 5576 |   mov [${var__last_btn_in}], H
60 fe 00                       # 557b |   mov G, 0
98 20 ff 1c 0c                 # 557e |   getb A, H, 0xc
                               #      | _A_if_33:
e8 20 00 f8 0a 00              # 5583 |   jeq A, 0, ${_E_if_33}:rel + PC
60 fe 1c 03                    # 5589 |   mov G, 0x3
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
98 20 ff 1c 0b                 # 558d |   getb A, H, 0xb
                               #      | _A_if_34:
e8 20 00 f8 0a 00              # 5592 |   jeq A, 0, ${_E_if_34}:rel + PC
60 fe 1c 02                    # 5598 |   mov G, 0x2
                               #      | _E_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
98 20 ff 1c 0a                 # 559c |   getb A, H, 0xa
                               #      | _A_if_35:
e8 20 00 f8 09 00              # 55a1 |   jeq A, 0, ${_E_if_35}:rel + PC
c4 fe 00                       # 55a7 |   inc G, 0
                               #      | _E_if_35:
                               #      | _C_if_35:
                               #      | _Z_if_35:
98 20 ff 1c 09                 # 55aa |   getb A, H, 0x9
                               #      | _A_if_36:
e8 20 00 f8 0a 00              # 55af |   jeq A, 0, ${_E_if_36}:rel + PC
60 fe 1c 04                    # 55b5 |   mov G, 0x4
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _A_if_37:
e8 fe 00 f8 14 00              # 55b9 |   jeq G, 0, ${_E_if_37}:rel + PC
                               #      | _A_call_46:
e0 fe                          # 55bf |   push G
5c f8 0f 00                    # 55c1 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 55c5 |   mov SP, SP + 0x2
                               #      | _Z_call_46:
                               #      | _A_call_47:
5c f8 bf fd                    # 55c9 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_47:
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _cleanup_fn_handle_keyboard:
e4 20                          # 55cd |   pop A
dc                             # 55cf |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 55d0 |   push A
61 20 bc 04                    # 55d2 |   mov A, [SP + 0x4]
                               #      | _A_if_26:
ec 20 1c f8 01 16 00           # 55d6 |   jne A, 0x1, ${_E_if_26}:rel + PC
                               #      | _A_call_31:
e0 1c ff                       # 55dd |   push -1
5c f8 3f 00                    # 55e0 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 55e4 |   mov SP, SP + 0x2
                               #      | _Z_call_31:
58 f8 34 00                    # 55e8 |   jmp ${_C_if_26}:rel + PC
                               #      | _E_if_26:
ec 20 1c f8 02 16 00           # 55ec |   jne A, 0x2, ${_E2_if_26}:rel + PC
                               #      | _A_call_32:
e0 1c 01                       # 55f3 |   push 0x1
5c f8 29 00                    # 55f6 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 55fa |   mov SP, SP + 0x2
                               #      | _Z_call_32:
58 f8 1e 00                    # 55fe |   jmp ${_C_if_26}:rel + PC
                               #      | _E2_if_26:
ec 20 1c f8 04 0f 00           # 5602 |   jne A, 0x4, ${_E3_if_26}:rel + PC
                               #      | _A_call_37:
5c f8 42 00                    # 5609 |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_37:
58 f8 0f 00                    # 560d |   jmp ${_C_if_26}:rel + PC
                               #      | _E3_if_26:
ec 20 1c f8 03 0b 00           # 5611 |   jne A, 0x3, ${_E4_if_26}:rel + PC
                               #      | _A_call_43:
5c f8 63 00                    # 5618 |   call ${fn_tg_rotate}:rel + PC
                               #      | _Z_call_43:
                               #      | _E4_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 561c |   pop A
dc                             # 561e |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_28:
e0 00                          # 561f |   push 0
5c f8 6d fc                    # 5621 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5625 |   mov SP, SP + 0x2
                               #      | _Z_call_28:
03 e0 bc b8 5d 02              # 5629 |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_29:
5c f8 d2 fc                    # 562f |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_29:
                               #      | _A_if_27:
ec ff 00 f8 0c 00              # 5633 |   jne H, 0, ${_E_if_27}:rel + PC
07 e0 bc b8 5d 02              # 5639 |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_27:
                               #      | _C_if_27:
                               #      | _Z_if_27:
                               #      | _A_call_30:
e0 1c 01                       # 563f |   push 0x1
5c f8 4c fc                    # 5642 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5646 |   mov SP, SP + 0x2
                               #      | _Z_call_30:
                               #      | _cleanup_fn_tg_move:
dc                             # 564a |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_33:
e0 00                          # 564b |   push 0
5c f8 41 fc                    # 564d |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5651 |   mov SP, SP + 0x2
                               #      | _Z_call_33:
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
46 e0 b6 5d                    # 5655 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_34:
5c f8 a8 fc                    # 5659 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_34:
e8 ff 00 f8 0a 00              # 565d |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _BZ_loop_3:
58 f8 f2 ff                    # 5663 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
4a e0 b6 5d                    # 5667 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_35:
e0 1c 01                       # 566b |   push 0x1
5c f8 20 fc                    # 566e |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5672 |   mov SP, SP + 0x2
                               #      | _Z_call_35:
                               #      | _A_call_36:
5c f8 17 fb                    # 5676 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_36:
                               #      | _cleanup_fn_tg_down:
dc                             # 567a |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_38:
e0 00                          # 567b |   push 0
5c f8 11 fc                    # 567d |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5681 |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
c5 ff e0 b4 5d                 # 5685 |   inc H, [${var__board__falling} + 0002]
2c ff 1c 03                    # 568a |   and H, 0x3
62 e0 ff b4 5d                 # 568e |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_39:
5c f8 6e fc                    # 5693 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_39:
ec ff 00 f8 2c 00              # 5697 |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 b8 5d                    # 569d |   dec [${var__board__falling} + 0006]
                               #      | _A_call_40:
5c f8 60 fc                    # 56a1 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_40:
ec ff 00 f8 1e 00              # 56a5 |   jne H, 0, ${_C_loop_4}:rel + PC
02 e0 1c b8 5d 02              # 56ab |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_41:
5c f8 50 fc                    # 56b1 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_41:
ec ff 00 f8 0e 00              # 56b5 |   jne H, 0, ${_C_loop_4}:rel + PC
4a e0 b8 5d                    # 56bb |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_4:
58 f8 c6 ff                    # 56bf |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _A_call_42:
e0 1c 01                       # 56c3 |   push 0x1
5c f8 c8 fb                    # 56c6 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 56ca |   mov SP, SP + 0x2
                               #      | _Z_call_42:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 56ce |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 56cf |   push D
e0 60                          # 56d1 |   push C
e0 40                          # 56d3 |   push B
e0 20                          # 56d5 |   push A
61 40 e0 10 ff                 # 56d7 |   mov B, [0xff10]
61 60 e0 12 ff                 # 56dc |   mov C, [0xff12]
61 80 e0 14 ff                 # 56e1 |   mov D, [0xff14]
61 20 bc 0e                    # 56e6 |   mov A, [SP + 0xe]
60 ff 00                       # 56ea |   mov H, 0
                               #      | _A_if_38:
fc 28 20 f8 09 00              # 56ed |   jge A + B, A, ${_E_if_38}:rel + PC
c4 ff 00                       # 56f3 |   inc H, 0
                               #      | _E_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
60 40 44                       # 56f6 |   mov B, B + A
81 20 bc ff 0c                 # 56f9 |   add A, [SP + 0xc], H
60 ff 00                       # 56fe |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 5701 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 5707 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 570d |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 5711 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 5714 |   mov C, C + A
81 20 bc ff 0a                 # 5717 |   add A, [SP + 0xa], H
60 80 84                       # 571c |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 571f |   mov A, [SP + 0x10]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
61 ff e0 14 ff                 # 5723 |   mov H, [0xff14]
                               #      | _A_if_41:
f4 ff 80 f8 0a 00              # 5728 |   jle H, D, ${_E_if_41}:rel + PC
58 f8 33 00                    # 572e |   jmp ${_C_loop_5}:rel + PC
                               #      | _E_if_41:
ec ff 80 f8 2b 00              # 5732 |   jne H, D, ${_E2_if_41}:rel + PC
61 ff e0 12 ff                 # 5738 |   mov H, [0xff12]
                               #      | _A_if_42:
f4 ff 60 f8 0a 00              # 573d |   jle H, C, ${_E_if_42}:rel + PC
58 f8 1e 00                    # 5743 |   jmp ${_C_loop_5}:rel + PC
                               #      | _E_if_42:
ec ff 60 f8 16 00              # 5747 |   jne H, C, ${_E2_if_42}:rel + PC
fa e0 40 f8 10 ff 14 00        # 574d |   jgt [0xff10], B, ${_C_loop_5}:rel + PC
                               #      | _A_if_44:
e8 20 00 f8 08 00              # 5755 |   jeq A, 0, ${_E_if_44}:rel + PC
5c 20                          # 575b |   call A
                               #      | _E_if_44:
                               #      | _C_if_44:
                               #      | _Z_if_44:
                               #      | _E2_if_42:
                               #      | _C_if_42:
                               #      | _Z_if_42:
                               #      | _E2_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
                               #      | _BZ_loop_5:
58 f8 c6 ff                    # 575d |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5761 |   pop A
e4 40                          # 5763 |   pop B
e4 60                          # 5765 |   pop C
e4 80                          # 5767 |   pop D
dc                             # 5769 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 576a |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 57a2 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x57ca
                               #      | SECTION_BEGIN_static_data:
                               # 57ca |   .align dummy_size:6 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 57d0 |   .bss size:1280 align:16
                               #      | var__rand__state:
                               # 5cd0 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 5cd2 |   .bss size:220 align:1
                               #      | var__board__points:
                               # 5dae |   .bss size:2 align:1
                               #      | var__board__level:
                               # 5db0 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 5db2 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 5dba |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 5dc2 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 5dca |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 5dcc |   .bss size:2 align:1
                               #      | var__last_btn_in:
                               # 5dce |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 5dd0 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
