                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_17:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_17:
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
5c f8 32 00                    # 5012 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_7:
60 a0 bc fc                    # 5016 |   mov SP, SP + -4
                               #      |   # game loop
                               #      | _A_while_3:
                               #      | _BA_while_3:
ea bc 00 f8 02 1d 00           # 501a |   jeq [SP + 0x2], 0, ${_C_while_3}:rel + PC
                               #      | _A_call_13:
e2 a0                          # 5021 |   push [SP]
5c f8 20 01                    # 5023 |   call ${fn_tg_tick}:rel + PC
60 a0 bc 02                    # 5027 |   mov SP, SP + 0x2
                               #      | _Z_call_13:
62 bc ff 02                    # 502b |   mov [SP + 0x2], H
                               #      | _A_call_16:
5c f8 48 01                    # 502f |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_16:
                               #      | _BZ_while_3:
58 f8 e7 ff                    # 5033 |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _cleanup_fn_main:
60 a0 bc 04                    # 5037 |   mov SP, SP + 0x4
e4 20                          # 503b |   pop A
e4 40                          # 503d |   pop B
e4 60                          # 503f |   pop C
e4 80                          # 5041 |   pop D
dc                             # 5043 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_tg_init:
                               #      | _begin_fn_tg_init:
                               #      | _A_call_1:
e0 e0 dc 00                    # 5044 |   push 0xdc
e0 00                          # 5048 |   push 0
e0 e0 f2 5b                    # 504a |   push ${var__board__board_state}
5c f8 44 00                    # 504e |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5052 |   mov SP, SP + 0x6
                               #      | _Z_call_1:
62 e0 00 ce 5c                 # 5056 |   mov [${var__board__points}], 0
62 e0 00 d0 5c                 # 505b |   mov [${var__board__level}], 0
62 e0 00 ea 5c                 # 5060 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 ec 5c                 # 5065 |   mov [${var__board__lines_remaining}], 0
                               #      | _A_call_2:
e0 00                          # 506a |   push 0
5c f8 5f 00                    # 506c |   call ${fn_srand}:rel + PC
60 a0 bc 02                    # 5070 |   mov SP, SP + 0x2
                               #      | _Z_call_2:
                               #      | _A_call_5:
5c f8 5e 00                    # 5074 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_5:
                               #      | _A_call_6:
5c f8 5a 00                    # 5078 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_6:
ca e0 00 e2 5c                 # 507c |   dec [${var__board__stored}], 0
62 e0 00 e4 5c                 # 5081 |   mov [${var__board__stored} + 0002], 0
62 e0 00 e6 5c                 # 5086 |   mov [${var__board__stored} + 0004], 0
62 e0 1c e0 5c 09              # 508b |   mov [${var__board__next} + 0006], 0x9
                               #      | _cleanup_fn_tg_init:
dc                             # 5091 |   ret
                               #      | _end_fn_tg_init:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 5092 |   push B
e0 20                          # 5094 |   push A
65 fe bc 08                    # 5096 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 509a |   shl H, G, 0x8
30 ff fe                       # 509f |   or H, G
61 20 bc 06                    # 50a2 |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 50a6 |   add B, [SP + 0xa], A
                               #      | _A_while_1:
                               #      | _BA_while_1:
f8 3c 40 f8 02 12 00           # 50ab |   jgt A + 0x2, B, ${_C_while_1}:rel + PC
62 20 ff                       # 50b2 |   mov [A], H
60 20 3c 02                    # 50b5 |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 f2 ff                    # 50b9 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      | _A_if_1:
fc 20 40 f8 09 00              # 50bd |   jge A, B, ${_E_if_1}:rel + PC
66 20 ff                       # 50c3 |   bmov [A], H
                               #      | _E_if_1:
                               #      | _C_if_1:
                               #      | _Z_if_1:
                               #      | _cleanup_fn_memset:
e4 20                          # 50c6 |   pop A
e4 40                          # 50c8 |   pop B
dc                             # 50ca |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc f0 5b 02              # 50cb |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 50d1 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      | _A_call_3:
e0 1c 08                       # 50d2 |   push 0x8
e0 e0 da 5c                    # 50d5 |   push ${var__board__next}
e0 e0 d2 5c                    # 50d9 |   push ${var__board__falling}
5c f8 22 00                    # 50dd |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 50e1 |   mov SP, SP + 0x6
                               #      | _Z_call_3:
                               #      | _A_call_4:
5c f8 53 00                    # 50e5 |   call ${fn_rand}:rel + PC
                               #      | _Z_call_4:
62 e0 ff da 5c                 # 50e9 |   mov [${var__board__next}], H
62 e0 00 dc 5c                 # 50ee |   mov [${var__board__next} + 0002], 0
62 e0 00 de 5c                 # 50f3 |   mov [${var__board__next} + 0004], 0
62 e0 1c e0 5c 03              # 50f8 |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_new_falling:
dc                             # 50fe |   ret
                               #      | _end_fn_tg_new_falling:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 50ff |   push C
e0 40                          # 5101 |   push B
e0 20                          # 5103 |   push A
61 20 bc 08                    # 5105 |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 5109 |   add B, [SP + 0xc], A
61 60 bc 0a                    # 510e |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
f8 3c 40 f8 02 16 00           # 5112 |   jgt A + 0x2, B, ${_C_while_2}:rel + PC
63 20 60                       # 5119 |   mov [A], [C]
60 20 3c 02                    # 511c |   mov A, A + 0x2
60 60 7c 02                    # 5120 |   mov C, C + 0x2
                               #      | _BZ_while_2:
58 f8 ee ff                    # 5124 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _A_if_2:
fc 20 40 f8 09 00              # 5128 |   jge A, B, ${_E_if_2}:rel + PC
67 20 60                       # 512e |   bmov [A], [C]
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 5131 |   pop A
e4 40                          # 5133 |   pop B
e4 60                          # 5135 |   pop C
dc                             # 5137 |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 f0 5b                 # 5138 |   inc H, [${var__rand__state}]
62 e0 ff f0 5b                 # 513d |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5142 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_8:
5c f8 29 00                    # 5143 |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_8:
                               #      | _A_call_9:
e2 bc 02                       # 5147 |   push [SP + 0x2]
5c f8 23 00                    # 514a |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 514e |   mov SP, SP + 0x2
                               #      | _Z_call_9:
                               #      | _A_call_10:
5c f8 1c 00                    # 5152 |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_10:
                               #      | _A_call_11:
e0 ff                          # 5156 |   push H
5c f8 1a 00                    # 5158 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 515c |   mov SP, SP + 0x2
                               #      | _Z_call_11:
                               #      | _A_call_12:
5c f8 13 00                    # 5160 |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_12:
40 ff                          # 5164 |   bool H
84 ff 1c ff 01                 # 5166 |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 516b |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
                               #      | _cleanup_fn_tg_do_gravity_tick:
dc                             # 516c |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
                               #      | _cleanup_fn_tg_handle_move:
dc                             # 516d |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 516e |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 5171 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 5172 |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
60 ff 00                       # 5173 |   mov H, 0
                               #      | _cleanup_fn_tg_game_over:
dc                             # 5176 |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 5177 |   push D
e0 60                          # 5179 |   push C
e0 40                          # 517b |   push B
e0 20                          # 517d |   push A
                               #      | _A_for_1:
60 20 00                       # 517f |   mov A, 0
                               #      | _BA_for_1:
fc 20 1c f8 16 5c 00           # 5182 |   jge A, 0x16, ${_C_for_1}:rel + PC
                               #      | _A_for_2:
60 60 00                       # 5189 |   mov C, 0
                               #      | _BA_for_2:
fc 60 1c f8 08 4c 00           # 518c |   jge C, 0x8, ${_C_for_2}:rel + PC
                               #      | _A_call_14:
e0 60                          # 5193 |   push C
e0 3c 02                       # 5195 |   push A + 0x2
5c f8 4f 00                    # 5198 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 519c |   mov SP, SP + 0x4
                               #      | _Z_call_14:
                               #      | _A_for_3:
60 40 00                       # 51a0 |   mov B, 0
                               #      | _BA_for_3:
fc 40 1c f8 0a 2f 00           # 51a3 |   jge B, 0xa, ${_C_for_3}:rel + PC
88 80 1c 20 0a                 # 51aa |   mul D, 0xa, A
80 80 88 e0 f2 5b              # 51af |   add D, D + B, ${var__board__board_state}
65 80 80                       # 51b5 |   bmov D, [D]
                               #      | _A_if_3:
ec 80 60 f8 14 00              # 51b8 |   jne D, C, ${_E_if_3}:rel + PC
                               #      | _A_call_15:
e0 1c ff                       # 51be |   push -1
e0 5c 0a                       # 51c1 |   push B + 0xa
5c f8 45 00                    # 51c4 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # 51c8 |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _BZ_for_3:
44 40                          # 51cc |   inc B
58 f8 d5 ff                    # 51ce |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _BZ_for_2:
44 60                          # 51d2 |   inc C
58 f8 b8 ff                    # 51d4 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _BZ_for_1:
44 20                          # 51d8 |   inc A
58 f8 a8 ff                    # 51da |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_display_board:
e4 20                          # 51de |   pop A
e4 40                          # 51e0 |   pop B
e4 60                          # 51e2 |   pop C
e4 80                          # 51e4 |   pop D
dc                             # 51e6 |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # 51e7 |   push B
e0 20                          # 51e9 |   push A
61 20 bc 08                    # 51eb |   mov A, [SP + 0x8]
60 20 e4 f0 00                 # 51ef |   mov A, 0xf0 + A
89 40 bc e0 06 00 05           # 51f4 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c f0 56 ef 5b 01     # 51fb |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # 5204 |   pop A
e4 40                          # 5206 |   pop B
dc                             # 5208 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # 5209 |   push A
61 fe bc 06                    # 520b |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # 520f |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_4:
60 20 e4 f0 56                 # 5215 |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_4:
fc 20 e0 f8 f0 5b 13 00        # 521a |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_4}:rel + PC
62 20 fe                       # 5222 |   mov [A], G
                               #      | _BZ_for_4:
60 20 3c 50                    # 5225 |   mov A, A + 0x50
58 f8 f1 ff                    # 5229 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # 522d |   pop A
dc                             # 522f |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 5230 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # 5625 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x56e5
                               #      | SECTION_BEGIN_static_data:
                               # 56e5 |   .align dummy_size:11 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 56f0 |   .bss size:1280 align:16
                               #      | var__rand__state:
                               # 5bf0 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 5bf2 |   .bss size:220 align:1
                               #      | var__board__points:
                               # 5cce |   .bss size:2 align:1
                               #      | var__board__level:
                               # 5cd0 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 5cd2 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 5cda |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 5ce2 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 5cea |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 5cec |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
