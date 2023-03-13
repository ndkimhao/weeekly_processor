                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_75:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_75:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
62 e0 00 ca 6e                 # 500a |   mov [${var__last_btn_in}], 0
                               #      | _A_call_8:
5c f8 2c 00                    # 500f |   call ${fn_tg_init_video}:rel + PC
                               #      | _Z_call_8:
                               #      | _A_call_22:
5c f8 51 01                    # 5013 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_22:
                               #      |   # game loop
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_call_45:
5c f8 63 03                    # 5017 |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_45:
e8 ff 00 f8 1f 00              # 501b |   jeq H, 0, ${_C_loop_2}:rel + PC
                               #      | _A_call_74:
e0 e0 61 5a                    # 5021 |   push ${fn_handle_keyboard}
e0 e0 c0 27                    # 5025 |   push 0x27c0
e0 1c 09                       # 5029 |   push 0x9
e0 00                          # 502c |   push 0
5c f8 27 0d                    # 502e |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5032 |   mov SP, SP + 0x8
                               #      | _Z_call_74:
                               #      | _BZ_loop_2:
58 f8 e1 ff                    # 5036 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_main:
dc                             # 503a |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_tg_init_video:
                               #      | _begin_fn_tg_init_video:
e0 20                          # 503b |   push A
                               #      | _A_call_1:
e0 00                          # 503d |   push 0
e0 00                          # 503f |   push 0
5c f8 5f 00                    # 5041 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5045 |   mov SP, SP + 0x4
                               #      | _Z_call_1:
                               #      | _A_call_3:
5c f8 79 00                    # 5049 |   call ${fn_reset_color_palette}:rel + PC
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 e0 f0 00                    # 504d |   push 0xf0
e0 00                          # 5051 |   push 0
e0 e0 a0 00                    # 5053 |   push 0xa0
e0 1c 04                       # 5057 |   push 0x4
5c f8 c8 00                    # 505a |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 505e |   mov SP, SP + 0x8
                               #      | _Z_call_4:
                               #      | _A_call_5:
e0 1c 70                       # 5062 |   push 0x70
e0 1c 70                       # 5065 |   push 0x70
e0 1c 70                       # 5068 |   push 0x70
e0 1c 07                       # 506b |   push 0x7
5c f8 b4 00                    # 506e |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 5072 |   mov SP, SP + 0x8
                               #      | _Z_call_5:
                               #      | _A_for_2:
60 20 00                       # 5076 |   mov A, 0
                               #      | _BA_for_2:
fc 20 1c f8 1e 24 00           # 5079 |   jge A, 0x1e, ${_C_for_2}:rel + PC
                               #      | _A_call_6:
e0 1c 08                       # 5080 |   push 0x8
e0 20                          # 5083 |   push A
5c f8 1b 00                    # 5085 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5089 |   mov SP, SP + 0x4
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 00                          # 508d |   push 0
5c f8 b4 00                    # 508f |   call ${fn_fill_page}:rel + PC
60 a0 bc 02                    # 5093 |   mov SP, SP + 0x2
                               #      | _Z_call_7:
                               #      | _BZ_for_2:
44 20                          # 5097 |   inc A
58 f8 e0 ff                    # 5099 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_tg_init_video:
e4 20                          # 509d |   pop A
dc                             # 509f |   ret
                               #      | _end_fn_tg_init_video:
                               #      | 
                               #      | fn_switch_screen_page:
                               #      | _begin_fn_switch_screen_page:
e0 40                          # 50a0 |   push B
e0 20                          # 50a2 |   push A
61 20 bc 08                    # 50a4 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 50a8 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 50ad |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c c0 5e bf 63 04     # 50b4 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
                               #      | _cleanup_fn_switch_screen_page:
e4 20                          # 50bd |   pop A
e4 40                          # 50bf |   pop B
dc                             # 50c1 |   ret
                               #      | _end_fn_switch_screen_page:
                               #      | 
                               #      | fn_reset_color_palette:
                               #      | _begin_fn_reset_color_palette:
e0 80                          # 50c2 |   push D
e0 60                          # 50c4 |   push C
e0 40                          # 50c6 |   push B
e0 20                          # 50c8 |   push A
                               #      | _A_for_1:
60 20 00                       # 50ca |   mov A, 0
                               #      | _BA_for_1:
fc 20 1c f8 08 4c 00           # 50cd |   jge A, 0x8, ${_C_for_1}:rel + PC
98 40 20 1c 02                 # 50d4 |   getb B, A, 0x2
                               #      | _A_if_1:
e8 40 00 f8 0b 00              # 50d9 |   jeq B, 0, ${_E_if_1}:rel + PC
60 40 e0 ff 00                 # 50df |   mov B, 0xff
                               #      | _E_if_1:
                               #      | _C_if_1:
                               #      | _Z_if_1:
98 60 20 1c 01                 # 50e4 |   getb C, A, 0x1
                               #      | _A_if_2:
e8 60 00 f8 0b 00              # 50e9 |   jeq C, 0, ${_E_if_2}:rel + PC
60 60 e0 ff 00                 # 50ef |   mov C, 0xff
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
98 80 20 00                    # 50f4 |   getb D, A, 0
                               #      | _A_if_3:
e8 80 00 f8 0b 00              # 50f8 |   jeq D, 0, ${_E_if_3}:rel + PC
60 80 e0 ff 00                 # 50fe |   mov D, 0xff
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _A_call_2:
e0 80                          # 5103 |   push D
e0 60                          # 5105 |   push C
e0 40                          # 5107 |   push B
e0 20                          # 5109 |   push A
5c f8 17 00                    # 510b |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 510f |   mov SP, SP + 0x8
                               #      | _Z_call_2:
                               #      | _BZ_for_1:
44 20                          # 5113 |   inc A
58 f8 b8 ff                    # 5115 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_reset_color_palette:
e4 20                          # 5119 |   pop A
e4 40                          # 511b |   pop B
e4 60                          # 511d |   pop C
e4 80                          # 511f |   pop D
dc                             # 5121 |   ret
                               #      | _end_fn_reset_color_palette:
                               #      | 
                               #      | fn_set_color_palette:
                               #      | _begin_fn_set_color_palette:
e0 20                          # 5122 |   push A
ad 20 bc 1c 04 07              # 5124 |   and A, [SP + 0x4], 0x7
28 20 1c 01                    # 512a |   shl A, 0x1
63 e4 bc c0 5e 0a              # 512e |   mov [${var__VIDEO_ROW_BUFFER} + A], [SP + 0xa]
63 e4 bc d0 5e 08              # 5134 |   mov [${var__VIDEO_ROW_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc e0 5e 06              # 513a |   mov [${var__VIDEO_ROW_BUFFER} + 0020 + A], [SP + 0x6]
                               #      | _cleanup_fn_set_color_palette:
e4 20                          # 5140 |   pop A
dc                             # 5142 |   ret
                               #      | _end_fn_set_color_palette:
                               #      | 
                               #      | fn_fill_page:
                               #      | _begin_fn_fill_page:
e0 20                          # 5143 |   push A
61 fe bc 04                    # 5145 |   mov G, [SP + 0x4]
                               #      | _A_for_3:
60 20 e0 c0 5e                 # 5149 |   mov A, ${var__VIDEO_ROW_BUFFER}
                               #      | _BA_for_3:
fc 20 e0 f8 c0 63 13 00        # 514e |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_3}:rel + PC
62 20 fe                       # 5156 |   mov [A], G
                               #      | _BZ_for_3:
60 20 3c 02                    # 5159 |   mov A, A + 0x2
58 f8 f1 ff                    # 515d |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_fill_page:
e4 20                          # 5161 |   pop A
dc                             # 5163 |   ret
                               #      | _end_fn_fill_page:
                               #      | 
                               #      | fn_tg_init:
                               #      | _begin_fn_tg_init:
                               #      | _A_call_9:
e0 e0 dc 00                    # 5164 |   push 0xdc
e0 00                          # 5168 |   push 0
e0 e0 c2 6d                    # 516a |   push ${var__board__board_state}
5c f8 4a 00                    # 516e |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5172 |   mov SP, SP + 0x6
                               #      | _Z_call_9:
62 e0 00 a0 6e                 # 5176 |   mov [${var__board__points}], 0
62 e0 00 a2 6e                 # 517b |   mov [${var__board__level}], 0
62 e0 00 bc 6e                 # 5180 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 be 6e                 # 5185 |   mov [${var__board__lines_remaining}], 0
                               #      | _A_call_10:
e0 e0 be 0b                    # 518a |   push 0xbbe
5c f8 63 00                    # 518e |   call ${fn_srand}:rel + PC
60 a0 bc 02                    # 5192 |   mov SP, SP + 0x2
                               #      | _Z_call_10:
                               #      | _A_call_13:
5c f8 62 00                    # 5196 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_13:
                               #      | _A_call_14:
5c f8 5e 00                    # 519a |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_14:
ca e0 00 b4 6e                 # 519e |   dec [${var__board__stored}], 0
62 e0 00 b6 6e                 # 51a3 |   mov [${var__board__stored} + 0002], 0
62 e0 00 b8 6e                 # 51a8 |   mov [${var__board__stored} + 0004], 0
62 e0 1c b2 6e 03              # 51ad |   mov [${var__board__next} + 0006], 0x3
                               #      | _A_call_21:
5c f8 de 00                    # 51b3 |   call ${fn_draw_main_interface}:rel + PC
                               #      | _Z_call_21:
                               #      | _cleanup_fn_tg_init:
dc                             # 51b7 |   ret
                               #      | _end_fn_tg_init:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 51b8 |   push B
e0 20                          # 51ba |   push A
65 fe bc 08                    # 51bc |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 51c0 |   shl H, G, 0x8
30 ff fe                       # 51c5 |   or H, G
61 20 bc 06                    # 51c8 |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 51cc |   add B, [SP + 0xa], A
                               #      | _A_while_1:
                               #      | _BA_while_1:
f8 3c 40 f8 02 12 00           # 51d1 |   jgt A + 0x2, B, ${_C_while_1}:rel + PC
62 20 ff                       # 51d8 |   mov [A], H
60 20 3c 02                    # 51db |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 f2 ff                    # 51df |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      | _A_if_4:
fc 20 40 f8 09 00              # 51e3 |   jge A, B, ${_E_if_4}:rel + PC
66 20 ff                       # 51e9 |   bmov [A], H
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _cleanup_fn_memset:
e4 20                          # 51ec |   pop A
e4 40                          # 51ee |   pop B
dc                             # 51f0 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc c0 6d 02              # 51f1 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 51f7 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_11:
e0 1c 08                       # 51f8 |   push 0x8
e0 e0 ac 6e                    # 51fb |   push ${var__board__next}
e0 e0 a4 6e                    # 51ff |   push ${var__board__falling}
5c f8 32 00                    # 5203 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 5207 |   mov SP, SP + 0x6
                               #      | _Z_call_11:
                               #      |   # fill new Board.next
                               #      | _A_call_12:
5c f8 63 00                    # 520b |   call ${fn_rand}:rel + PC
                               #      | _Z_call_12:
b5 fe e0 ff 10 ff              # 520f |   xor G, [0xff10], H
08 fe e0 4f c3                 # 5215 |   mul G, 0xc34f
90 fe ff 1c 07                 # 521a |   div G, H, 0x7
c6 e0 ff ac 6e                 # 521f |   inc [${var__board__next}], H
62 e0 00 ae 6e                 # 5224 |   mov [${var__board__next} + 0002], 0
62 e0 00 b0 6e                 # 5229 |   mov [${var__board__next} + 0004], 0
62 e0 1c b2 6e 03              # 522e |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_new_falling:
dc                             # 5234 |   ret
                               #      | _end_fn_tg_new_falling:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 5235 |   push C
e0 40                          # 5237 |   push B
e0 20                          # 5239 |   push A
61 20 bc 08                    # 523b |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 523f |   add B, [SP + 0xc], A
61 60 bc 0a                    # 5244 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
f8 3c 40 f8 02 16 00           # 5248 |   jgt A + 0x2, B, ${_C_while_2}:rel + PC
63 20 60                       # 524f |   mov [A], [C]
60 20 3c 02                    # 5252 |   mov A, A + 0x2
60 60 7c 02                    # 5256 |   mov C, C + 0x2
                               #      | _BZ_while_2:
58 f8 ee ff                    # 525a |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _A_if_5:
fc 20 40 f8 09 00              # 525e |   jge A, B, ${_E_if_5}:rel + PC
67 20 60                       # 5264 |   bmov [A], [C]
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 5267 |   pop A
e4 40                          # 5269 |   pop B
e4 60                          # 526b |   pop C
dc                             # 526d |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
61 ff e0 c0 6d                 # 526e |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 5273 |   shl G, H, 0x7
34 ff fe                       # 5278 |   xor H, G
a0 fe ff 1c 09                 # 527b |   shr G, H, 0x9
34 ff fe                       # 5280 |   xor H, G
a8 fe ff 1c 08                 # 5283 |   shl G, H, 0x8
34 ff fe                       # 5288 |   xor H, G
62 e0 ff c0 6d                 # 528b |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5290 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_draw_main_interface:
                               #      | _begin_fn_draw_main_interface:
                               #      | _A_call_16:
e0 e0 53 5e                    # 5291 |   push ${const__data_1}
e0 1c 07                       # 5295 |   push 0x7
e0 1c 11                       # 5298 |   push 0x11
e0 1c 02                       # 529b |   push 0x2
5c f8 5d 00                    # 529e |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 52a2 |   mov SP, SP + 0x8
                               #      | _Z_call_16:
                               #      | _A_call_17:
e0 e0 60 5e                    # 52a6 |   push ${const__data_2}
e0 1c 07                       # 52aa |   push 0x7
e0 1c 11                       # 52ad |   push 0x11
e0 1c 03                       # 52b0 |   push 0x3
5c f8 48 00                    # 52b3 |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 52b7 |   mov SP, SP + 0x8
                               #      | _Z_call_17:
                               #      | _A_call_18:
e0 e0 6c 5e                    # 52bb |   push ${const__str__Next}
e0 1c 07                       # 52bf |   push 0x7
e0 1c 12                       # 52c2 |   push 0x12
e0 1c 07                       # 52c5 |   push 0x7
5c f8 33 00                    # 52c8 |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 52cc |   mov SP, SP + 0x8
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 e0 71 5e                    # 52d0 |   push ${const__str__Hold}
e0 1c 07                       # 52d4 |   push 0x7
e0 1c 12                       # 52d7 |   push 0x12
e0 1c 0b                       # 52da |   push 0xb
5c f8 1e 00                    # 52dd |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 52e1 |   mov SP, SP + 0x8
                               #      | _Z_call_19:
                               #      | _A_call_20:
e0 e0 76 5e                    # 52e5 |   push ${const__data_3}
e0 1c 07                       # 52e9 |   push 0x7
e0 1c 12                       # 52ec |   push 0x12
e0 1c 10                       # 52ef |   push 0x10
5c f8 09 00                    # 52f2 |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 52f6 |   mov SP, SP + 0x8
                               #      | _Z_call_20:
                               #      | _cleanup_fn_draw_main_interface:
dc                             # 52fa |   ret
                               #      | _end_fn_draw_main_interface:
                               #      | 
                               #      | fn_draw_string:
                               #      | _begin_fn_draw_string:
e0 80                          # 52fb |   push D
e0 60                          # 52fd |   push C
e0 40                          # 52ff |   push B
e0 20                          # 5301 |   push A
61 20 bc 0a                    # 5303 |   mov A, [SP + 0xa]
61 40 bc 10                    # 5307 |   mov B, [SP + 0x10]
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
65 ff 40                       # 530b |   bmov H, [B]
e8 ff 00 f8 63 00              # 530e |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_syscall_1:
e0 1c 0a                       # 5314 |   push 0xa
e0 40                          # 5317 |   push B
60 ff 1c 0d                    # 5319 |   mov H, 0xd
5e e0 1e ff                    # 531d |   call [0xff1e]
60 a0 bc 04                    # 5321 |   mov SP, SP + 0x4
                               #      | _Z_syscall_1:
                               #      | _A_if_7:
ec ff 00 f8 0d 00              # 5325 |   jne H, 0, ${_E_if_7}:rel + PC
60 80 00                       # 532b |   mov D, 0
58 f8 0d 00                    # 532e |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
60 60 ff                       # 5332 |   mov C, H
65 80 60                       # 5335 |   bmov D, [C]
66 60 00                       # 5338 |   bmov [C], 0
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _A_call_15:
e2 bc 0e                       # 533b |   push [SP + 0xe]
e2 bc 0c                       # 533e |   push [SP + 0xc]
5c f8 5f fd                    # 5341 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5345 |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_syscall_2:
e0 40                          # 5349 |   push B
e2 bc 0e                       # 534b |   push [SP + 0xe]
e0 e0 c0 5e                    # 534e |   push ${var__VIDEO_ROW_BUFFER}
60 ff 1c 1e                    # 5352 |   mov H, 0x1e
5e e0 1e ff                    # 5356 |   call [0xff1e]
60 a0 bc 06                    # 535a |   mov SP, SP + 0x6
                               #      | _Z_syscall_2:
e8 80 00 f8 13 00              # 535e |   jeq D, 0, ${_C_loop_1}:rel + PC
66 60 80                       # 5364 |   bmov [C], D
c4 40 60                       # 5367 |   inc B, C
46 bc 0a                       # 536a |   inc [SP + 0xa]
                               #      | _BZ_loop_1:
58 f8 9e ff                    # 536d |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_draw_string:
e4 20                          # 5371 |   pop A
e4 40                          # 5373 |   pop B
e4 60                          # 5375 |   pop C
e4 80                          # 5377 |   pop D
dc                             # 5379 |   ret
                               #      | _end_fn_draw_string:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_29:
5c f8 26 00                    # 537a |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_29:
                               #      | _A_if_18:
e8 ff 00 f8 0a 00              # 537e |   jeq H, 0, ${_E_if_18}:rel + PC
                               #      | _A_call_39:
5c f8 90 01                    # 5384 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_39:
                               #      | _E_if_18:
                               #      | _C_if_18:
                               #      | _Z_if_18:
                               #      | _A_call_40:
5c f8 6e 06                    # 5388 |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_40:
                               #      | _A_call_41:
e0 ff                          # 538c |   push H
5c f8 6c 06                    # 538e |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5392 |   mov SP, SP + 0x2
                               #      | _Z_call_41:
                               #      | _A_call_44:
5c f8 65 06                    # 5396 |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_44:
84 ff 1c ff 01                 # 539a |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 539f |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 53a0 |   push A
4a e0 bc 6e                    # 53a2 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_9:
d2 e0 00 bc 6e                 # 53a6 |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 0f 00                    # 53ab |   jgt ${_E_if_9}:rel + PC
                               #      | _A_call_28:
5c f8 11 00                    # 53af |   call ${fn_tg_soft_drop}:rel + PC
                               #      | _Z_call_28:
c4 ff 00                       # 53b3 |   inc H, 0
58 f8 07 00                    # 53b6 |   jmp ${_C_if_9}:rel + PC
                               #      | _E_if_9:
60 ff 00                       # 53ba |   mov H, 0
                               #      | _C_if_9:
                               #      | _Z_if_9:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 53bd |   pop A
dc                             # 53bf |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_soft_drop:
                               #      | _begin_fn_tg_soft_drop:
e0 20                          # 53c0 |   push A
                               #      | _A_call_23:
e0 00                          # 53c2 |   push 0
5c f8 4a 00                    # 53c4 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 53c8 |   mov SP, SP + 0x2
                               #      | _Z_call_23:
46 e0 a8 6e                    # 53cc |   inc [${var__board__falling} + 0004]
                               #      | _A_call_24:
5c f8 ba 00                    # 53d0 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_24:
                               #      | _A_if_17:
ec ff 1c f8 01 19 00           # 53d4 |   jne H, 0x1, ${_E_if_17}:rel + PC
a9 20 e0 1c a2 6e 01           # 53db |   shl A, [${var__board__level}], 0x1
63 e0 e4 bc 6e 2b 5e           # 53e2 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 53e9 |   jmp ${_C_if_17}:rel + PC
                               #      | _E_if_17:
4a e0 a8 6e                    # 53ed |   dec [${var__board__falling} + 0004]
                               #      | _A_call_25:
e0 1c 01                       # 53f1 |   push 0x1
5c f8 1a 00                    # 53f4 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 53f8 |   mov SP, SP + 0x2
                               #      | _Z_call_25:
                               #      | _A_call_26:
5c f8 fc fd                    # 53fc |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_26:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _A_call_27:
e0 1c 01                       # 5400 |   push 0x1
5c f8 0b 00                    # 5403 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5407 |   mov SP, SP + 0x2
                               #      | _Z_call_27:
                               #      | _cleanup_fn_tg_soft_drop:
e4 20                          # 540b |   pop A
dc                             # 540d |   ret
                               #      | _end_fn_tg_soft_drop:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 540e |   push D
e0 60                          # 5410 |   push C
e0 40                          # 5412 |   push B
e0 20                          # 5414 |   push A
60 20 e0 a4 6e                 # 5416 |   mov A, ${var__board__falling}
c9 40 20                       # 541b |   dec B, [A]
e8 40 1c f8 ff 63 00           # 541e |   jeq B, -1, ${_cleanup_fn_tg_put}:rel + PC
a9 80 3c 1c 02 01              # 5425 |   shl D, [A + 0x2], 0x1
60 80 53                       # 542b |   mov D, B*8 + D
61 80 f0 f3 5d                 # 542e |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 5433 |   inc A, B
                               #      | _A_for_4:
60 60 00                       # 5436 |   mov C, 0
                               #      | _BA_for_4:
fc 60 1c f8 04 48 00           # 5439 |   jge C, 0x4, ${_C_for_4}:rel + PC
a0 40 80 7e 02                 # 5440 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 5445 |   shr E, D, C*4
2c 40 1c 03                    # 5449 |   and B, 0x3
2c fc 1c 03                    # 544d |   and E, 0x3
81 fe e0 40 a8 6e              # 5451 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc aa 6e              # 5457 |   add B, [${var__board__falling} + 0006], E
88 fd 1c fe 0a                 # 545d |   mul F, 0xa, G
00 fd e0 c2 6d                 # 5462 |   add F, ${var__board__board_state}
00 fd 40                       # 5467 |   add F, B
                               #      | _A_if_11:
ee bc 00 f8 0a 0e 00           # 546a |   jne [SP + 0xa], 0, ${_E_if_11}:rel + PC
66 fd 00                       # 5471 |   bmov [F], 0
58 f8 07 00                    # 5474 |   jmp ${_C_if_11}:rel + PC
                               #      | _E_if_11:
66 fd 20                       # 5478 |   bmov [F], A
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _BZ_for_4:
44 60                          # 547b |   inc C
58 f8 bc ff                    # 547d |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 5481 |   pop A
e4 40                          # 5483 |   pop B
e4 60                          # 5485 |   pop C
e4 80                          # 5487 |   pop D
dc                             # 5489 |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 548a |   push D
e0 60                          # 548c |   push C
e0 40                          # 548e |   push B
e0 20                          # 5490 |   push A
c9 40 e0 a4 6e                 # 5492 |   dec B, [${var__board__falling}]
a9 80 e0 1c a6 6e 01           # 5497 |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 549e |   mov D, B*8 + D
61 80 f0 f3 5d                 # 54a1 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_5:
60 60 00                       # 54a6 |   mov C, 0
                               #      | _BA_for_5:
fc 60 1c f8 04 5f 00           # 54a9 |   jge C, 0x4, ${_C_for_5}:rel + PC
a0 20 80 7e 02                 # 54b0 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 54b5 |   shr E, D, C*4
2c 20 1c 03                    # 54b9 |   and A, 0x3
2c fc 1c 03                    # 54bd |   and E, 0x3
81 fe e0 20 a8 6e              # 54c1 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc aa 6e              # 54c7 |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 54cd |   mov H, 0
d0 fe 00                       # 54d0 |   icmp G, 0
70 f8 38 00                    # 54d3 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 54d7 |   icmp B, 0
70 f8 31 00                    # 54da |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2d 00           # 54de |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 26 00           # 54e5 |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 54ec |   mul F, G, 0xa
00 fd e8 c2 6d                 # 54f1 |   add F, ${var__board__board_state} + B
65 fd fd                       # 54f6 |   bmov F, [F]
60 ff 00                       # 54f9 |   mov H, 0
ec fd 00 f8 0f 00              # 54fc |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_5:
44 60                          # 5502 |   inc C
58 f8 a5 ff                    # 5504 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      |   # done checking, all good
c4 ff 00                       # 5508 |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 550b |   pop A
e4 40                          # 550d |   pop B
e4 60                          # 550f |   pop C
e4 80                          # 5511 |   pop D
dc                             # 5513 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_tg_display:
                               #      | _begin_fn_tg_display:
                               #      | _A_call_38:
5c f8 05 00                    # 5514 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_38:
                               #      | _cleanup_fn_tg_display:
dc                             # 5518 |   ret
                               #      | _end_fn_tg_display:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 5519 |   push D
e0 60                          # 551b |   push C
e0 40                          # 551d |   push B
e0 20                          # 551f |   push A
60 a0 bc fc                    # 5521 |   mov SP, SP + -4
62 a0 1c 15                    # 5525 |   mov [SP], 0x15
                               #      | _A_for_6:
60 20 00                       # 5529 |   mov A, 0
                               #      | _BA_for_6:
fc 20 1c f8 16 bb 01           # 552c |   jge A, 0x16, ${_C_for_6}:rel + PC
62 bc 20 02                    # 5533 |   mov [SP + 0x2], A
60 fe 3c 02                    # 5537 |   mov G, A + 0x2
                               #      | _A_call_30:
e0 fe                          # 553b |   push G
5c f8 2c 02                    # 553d |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 5541 |   mov SP, SP + 0x2
                               #      | _Z_call_30:
                               #      | _A_for_7:
e0 20                          # 5545 |   push A
60 40 00                       # 5547 |   mov B, 0
                               #      | _BA_for_7:
fc 40 1c f8 0a 95 01           # 554a |   jge B, 0xa, ${_C_for_7}:rel + PC
60 60 1c 0a                    # 5551 |   mov C, 0xa
60 fe 00                       # 5555 |   mov G, 0
                               #      | _A_if_19:
ec 40 7c f8 ff 0c 00           # 5558 |   jne B, C + -1, ${_E_if_19}:rel + PC
60 fe e0 00 80                 # 555f |   mov G, 0x8000
                               #      | _E_if_19:
                               #      | _C_if_19:
                               #      | _Z_if_19:
                               #      | _A_if_20:
ec 40 00 f8 0a 00              # 5564 |   jne B, 0, ${_E_if_20}:rel + PC
30 fe 1c 01                    # 556a |   or G, 0x1
                               #      | _E_if_20:
                               #      | _C_if_20:
                               #      | _Z_if_20:
89 80 bc 60 04                 # 556e |   mul D, [SP + 0x4], C
80 80 88 e0 c2 6d              # 5573 |   add D, D + B, ${var__board__board_state}
65 20 80                       # 5579 |   bmov A, [D]
60 60 5c 06                    # 557c |   mov C, B + 0x6
80 60 e0 61 c0 5e              # 5580 |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_21:
ec 20 00 f8 4f 00              # 5586 |   jne A, 0, ${_E_if_21}:rel + PC
                               #      | _A_for_8:
60 80 00                       # 558c |   mov D, 0
                               #      | _BA_for_8:
fc 80 e0 f8 00 0f 16 00        # 558f |   jge D, 0xf00, ${_C_for_8}:rel + PC
b2 70 1c fe 01                 # 5597 |   or [C + D], 0x1, G
                               #      | _BZ_for_8:
60 80 f0 a0 00                 # 559c |   mov D, 0xa0 + D
58 f8 ee ff                    # 55a1 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _A_for_9:
60 80 1c 50                    # 55a5 |   mov D, 0x50
                               #      | _BA_for_9:
fc 80 e0 f8 00 0f 15 00        # 55a9 |   jge D, 0xf00, ${_C_for_9}:rel + PC
b2 70 00 fe                    # 55b1 |   or [C + D], 0, G
                               #      | _BZ_for_9:
60 80 f0 a0 00                 # 55b5 |   mov D, 0xa0 + D
58 f8 ef ff                    # 55ba |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
62 60 e0 55 55                 # 55be |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 55c3 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 55ca |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 55d1 |   jmp ${_C_if_21}:rel + PC
                               #      | _E_if_21:
98 ff 20 00                    # 55d5 |   getb H, A, 0
                               #      | _A_if_22:
e8 ff 00 f8 0b 00              # 55d9 |   jeq H, 0, ${_E_if_22}:rel + PC
60 ff e0 ff 7f                 # 55df |   mov H, 0x7fff
                               #      | _E_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _A_for_10:
60 80 00                       # 55e4 |   mov D, 0
                               #      | _BA_for_10:
fc 80 e0 f8 b0 04 15 00        # 55e7 |   jge D, 0x4b0, ${_C_for_10}:rel + PC
b2 70 ff fe                    # 55ef |   or [C + D], H, G
                               #      | _BZ_for_10:
60 80 f0 a0 00                 # 55f3 |   mov D, 0xa0 + D
58 f8 ef ff                    # 55f8 |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
                               #      | _A_for_11:
60 80 1c 50                    # 55fc |   mov D, 0x50
                               #      | _BA_for_11:
fc 80 e0 f8 b0 04 15 00        # 5600 |   jge D, 0x4b0, ${_C_for_11}:rel + PC
b2 70 ff fe                    # 5608 |   or [C + D], H, G
                               #      | _BZ_for_11:
60 80 f0 a0 00                 # 560c |   mov D, 0xa0 + D
58 f8 ef ff                    # 5611 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
62 70 00                       # 5615 |   mov [C + D], 0
98 ff 20 1c 01                 # 5618 |   getb H, A, 0x1
                               #      | _A_if_23:
e8 ff 00 f8 0b 00              # 561d |   jeq H, 0, ${_E_if_23}:rel + PC
60 ff e0 ff 7f                 # 5623 |   mov H, 0x7fff
                               #      | _E_if_23:
                               #      | _C_if_23:
                               #      | _Z_if_23:
                               #      | _A_for_12:
60 80 e0 00 05                 # 5628 |   mov D, 0x500
                               #      | _BA_for_12:
fc 80 e0 f8 b0 09 15 00        # 562d |   jge D, 0x9b0, ${_C_for_12}:rel + PC
b2 70 ff fe                    # 5635 |   or [C + D], H, G
                               #      | _BZ_for_12:
60 80 f0 a0 00                 # 5639 |   mov D, 0xa0 + D
58 f8 ef ff                    # 563e |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _A_for_13:
60 80 e0 50 05                 # 5642 |   mov D, 0x550
                               #      | _BA_for_13:
fc 80 e0 f8 b0 09 15 00        # 5647 |   jge D, 0x9b0, ${_C_for_13}:rel + PC
b2 70 ff fe                    # 564f |   or [C + D], H, G
                               #      | _BZ_for_13:
60 80 f0 a0 00                 # 5653 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5658 |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
62 70 00                       # 565c |   mov [C + D], 0
98 ff 20 1c 02                 # 565f |   getb H, A, 0x2
                               #      | _A_if_24:
e8 ff 00 f8 0b 00              # 5664 |   jeq H, 0, ${_E_if_24}:rel + PC
60 ff e0 ff 7f                 # 566a |   mov H, 0x7fff
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
                               #      | _A_for_14:
60 80 e0 00 0a                 # 566f |   mov D, 0xa00
                               #      | _BA_for_14:
fc 80 e0 f8 b0 0e 15 00        # 5674 |   jge D, 0xeb0, ${_C_for_14}:rel + PC
b2 70 ff fe                    # 567c |   or [C + D], H, G
                               #      | _BZ_for_14:
60 80 f0 a0 00                 # 5680 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5685 |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
                               #      | _Z_for_14:
                               #      | _A_for_15:
60 80 e0 50 0a                 # 5689 |   mov D, 0xa50
                               #      | _BA_for_15:
fc 80 e0 f8 b0 0e 15 00        # 568e |   jge D, 0xeb0, ${_C_for_15}:rel + PC
b2 70 ff fe                    # 5696 |   or [C + D], H, G
                               #      | _BZ_for_15:
60 80 f0 a0 00                 # 569a |   mov D, 0xa0 + D
58 f8 ef ff                    # 569f |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
62 70 00                       # 56a3 |   mov [C + D], 0
                               #      | _C_if_21:
                               #      | _Z_if_21:
61 20 bc 04                    # 56a6 |   mov A, [SP + 0x4]
                               #      | _A_if_25:
ed 20 bc f8 02 19 00           # 56aa |   jne A, [SP + 0x2], ${_E_if_25}:rel + PC
62 ec 1c b0 04 ff              # 56b1 |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 56b7 |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 56bd |   mov [0xeb0 + C], -1
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _A_if_26:
ec 20 00 f8 16 00              # 56c3 |   jne A, 0, ${_E_if_26}:rel + PC
62 60 1c ff                    # 56c9 |   mov [C], -1
62 ec 1c 00 05 ff              # 56cd |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 56d3 |   mov [0xa00 + C], -1
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _BZ_for_7:
44 40                          # 56d9 |   inc B
58 f8 6f fe                    # 56db |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
e4 20                          # 56df |   pop A
                               #      | _Z_for_7:
                               #      | _BZ_for_6:
44 20                          # 56e1 |   inc A
58 f8 49 fe                    # 56e3 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_31:
e0 1c 08                       # 56e7 |   push 0x8
e0 00                          # 56ea |   push 0
e0 e0 c0 6e                    # 56ec |   push ${var__var_1}
5c f8 c8 fa                    # 56f0 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 56f4 |   mov SP, SP + 0x6
                               #      | _Z_call_31:
                               #      | _A_call_32:
e0 1c 01                       # 56f8 |   push 0x1
e0 00                          # 56fb |   push 0
e0 00                          # 56fd |   push 0
e0 1c 04                       # 56ff |   push 0x4
e0 e0 ac 6e                    # 5702 |   push ${var__board__next}
e0 e0 c0 6e                    # 5706 |   push ${var__var_1}
5c f8 99 00                    # 570a |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 570e |   mov SP, SP + 0xc
                               #      | _Z_call_32:
                               #      | _A_call_34:
e0 1c 08                       # 5712 |   push 0x8
5c f8 06 01                    # 5715 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 5719 |   mov SP, SP + 0x2
                               #      | _Z_call_34:
                               #      | _A_call_35:
e0 1c 08                       # 571d |   push 0x8
e0 00                          # 5720 |   push 0
e0 e0 c0 6e                    # 5722 |   push ${var__var_1}
5c f8 92 fa                    # 5726 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 572a |   mov SP, SP + 0x6
                               #      | _Z_call_35:
                               #      | _A_if_37:
ea e0 1c f8 b4 6e ff 23 00     # 572e |   jeq [${var__board__stored}], -1, ${_E_if_37}:rel + PC
                               #      | _A_call_36:
e0 1c 01                       # 5737 |   push 0x1
e0 00                          # 573a |   push 0
e0 00                          # 573c |   push 0
e0 1c 04                       # 573e |   push 0x4
e0 e0 b4 6e                    # 5741 |   push ${var__board__stored}
e0 e0 c0 6e                    # 5745 |   push ${var__var_1}
5c f8 5a 00                    # 5749 |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 574d |   mov SP, SP + 0xc
                               #      | _Z_call_36:
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _A_call_37:
e0 1c 0c                       # 5751 |   push 0xc
5c f8 c7 00                    # 5754 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 5758 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
                               #      | _cleanup_fn_display_board:
60 a0 bc 04                    # 575c |   mov SP, SP + 0x4
e4 20                          # 5760 |   pop A
e4 40                          # 5762 |   pop B
e4 60                          # 5764 |   pop C
e4 80                          # 5766 |   pop D
dc                             # 5768 |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_page_rgb:
                               #      | _begin_fn_switch_screen_page_rgb:
e0 40                          # 5769 |   push B
e0 20                          # 576b |   push A
60 20 e0 a1 00                 # 576d |   mov A, 0xa1
89 40 bc e0 06 00 05           # 5772 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c c0 5e bf 63 04     # 5779 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
60 20 e0 a2 00                 # 5782 |   mov A, 0xa2
54 e0 e0 1c c0 63 bf 68 05     # 5787 |   mmap ${var__VIDEO_ROW_BUFFER} + 0500, ${var__VIDEO_ROW_BUFFER} + 09ff, 0x5
60 20 e0 a4 00                 # 5790 |   mov A, 0xa4
54 e0 e0 1c c0 68 bf 6d 06     # 5795 |   mmap ${var__VIDEO_ROW_BUFFER} + 0a00, ${var__VIDEO_ROW_BUFFER} + 0eff, 0x6
                               #      | _cleanup_fn_switch_screen_page_rgb:
e4 20                          # 579e |   pop A
e4 40                          # 57a0 |   pop B
dc                             # 57a2 |   ret
                               #      | _end_fn_switch_screen_page_rgb:
                               #      | 
                               #      | fn_tg_put_generic:
                               #      | _begin_fn_tg_put_generic:
e0 80                          # 57a3 |   push D
e0 60                          # 57a5 |   push C
e0 40                          # 57a7 |   push B
e0 20                          # 57a9 |   push A
61 20 bc 0c                    # 57ab |   mov A, [SP + 0xc]
c9 40 20                       # 57af |   dec B, [A]
e8 40 1c f8 ff 60 00           # 57b2 |   jeq B, -1, ${_cleanup_fn_tg_put_generic}:rel + PC
a9 80 3c 1c 02 01              # 57b9 |   shl D, [A + 0x2], 0x1
60 80 53                       # 57bf |   mov D, B*8 + D
61 80 f0 f3 5d                 # 57c2 |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 57c7 |   inc A, B
                               #      | _A_for_16:
60 60 00                       # 57ca |   mov C, 0
                               #      | _BA_for_16:
fc 60 1c f8 04 45 00           # 57cd |   jge C, 0x4, ${_C_for_16}:rel + PC
a0 40 80 7e 02                 # 57d4 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 57d9 |   shr E, D, C*4
2c 40 1c 03                    # 57dd |   and B, 0x3
2c fc 1c 03                    # 57e1 |   and E, 0x3
81 fe bc 40 10                 # 57e5 |   add G, [SP + 0x10], B
81 40 bc fc 12                 # 57ea |   add B, [SP + 0x12], E
89 fd bc fe 0e                 # 57ef |   mul F, [SP + 0xe], G
01 fd bc 0a                    # 57f4 |   add F, [SP + 0xa]
00 fd 40                       # 57f8 |   add F, B
                               #      | _A_if_28:
ee bc 00 f8 14 0e 00           # 57fb |   jne [SP + 0x14], 0, ${_E_if_28}:rel + PC
66 fd 00                       # 5802 |   bmov [F], 0
58 f8 07 00                    # 5805 |   jmp ${_C_if_28}:rel + PC
                               #      | _E_if_28:
66 fd 20                       # 5809 |   bmov [F], A
                               #      | _C_if_28:
                               #      | _Z_if_28:
                               #      | _BZ_for_16:
44 60                          # 580c |   inc C
58 f8 bf ff                    # 580e |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
                               #      | _Z_for_16:
                               #      | _cleanup_fn_tg_put_generic:
e4 20                          # 5812 |   pop A
e4 40                          # 5814 |   pop B
e4 60                          # 5816 |   pop C
e4 80                          # 5818 |   pop D
dc                             # 581a |   ret
                               #      | _end_fn_tg_put_generic:
                               #      | 
                               #      | fn_draw_small_board:
                               #      | _begin_fn_draw_small_board:
e0 80                          # 581b |   push D
e0 60                          # 581d |   push C
e0 40                          # 581f |   push B
e0 20                          # 5821 |   push A
60 a0 bc fc                    # 5823 |   mov SP, SP + -4
c6 a0 00                       # 5827 |   inc [SP], 0
                               #      | _A_for_17:
60 20 00                       # 582a |   mov A, 0
                               #      | _BA_for_17:
fc 20 1c f8 02 bc 01           # 582d |   jge A, 0x2, ${_C_for_17}:rel + PC
62 bc 20 02                    # 5834 |   mov [SP + 0x2], A
81 fe bc 20 0e                 # 5838 |   add G, [SP + 0xe], A
                               #      | _A_call_33:
e0 fe                          # 583d |   push G
5c f8 2a ff                    # 583f |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 5843 |   mov SP, SP + 0x2
                               #      | _Z_call_33:
                               #      | _A_for_18:
e0 20                          # 5847 |   push A
60 40 00                       # 5849 |   mov B, 0
                               #      | _BA_for_18:
fc 40 1c f8 04 95 01           # 584c |   jge B, 0x4, ${_C_for_18}:rel + PC
60 60 1c 04                    # 5853 |   mov C, 0x4
60 fe 00                       # 5857 |   mov G, 0
                               #      | _A_if_29:
ec 40 7c f8 ff 0c 00           # 585a |   jne B, C + -1, ${_E_if_29}:rel + PC
60 fe e0 00 80                 # 5861 |   mov G, 0x8000
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _A_if_30:
ec 40 00 f8 0a 00              # 5866 |   jne B, 0, ${_E_if_30}:rel + PC
30 fe 1c 01                    # 586c |   or G, 0x1
                               #      | _E_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
89 80 bc 60 04                 # 5870 |   mul D, [SP + 0x4], C
80 80 88 e0 c0 6e              # 5875 |   add D, D + B, ${var__var_1}
65 20 80                       # 587b |   bmov A, [D]
60 60 5c 12                    # 587e |   mov C, B + 0x12
80 60 e0 61 c0 5e              # 5882 |   add C, ${var__VIDEO_ROW_BUFFER}, C*2
                               #      | _A_if_31:
ec 20 00 f8 4f 00              # 5888 |   jne A, 0, ${_E_if_31}:rel + PC
                               #      | _A_for_19:
60 80 00                       # 588e |   mov D, 0
                               #      | _BA_for_19:
fc 80 e0 f8 00 0f 16 00        # 5891 |   jge D, 0xf00, ${_C_for_19}:rel + PC
b2 70 1c fe 01                 # 5899 |   or [C + D], 0x1, G
                               #      | _BZ_for_19:
60 80 f0 a0 00                 # 589e |   mov D, 0xa0 + D
58 f8 ee ff                    # 58a3 |   jmp ${_BA_for_19}:rel + PC
                               #      | _C_for_19:
                               #      | _Z_for_19:
                               #      | _A_for_20:
60 80 1c 50                    # 58a7 |   mov D, 0x50
                               #      | _BA_for_20:
fc 80 e0 f8 00 0f 15 00        # 58ab |   jge D, 0xf00, ${_C_for_20}:rel + PC
b2 70 00 fe                    # 58b3 |   or [C + D], 0, G
                               #      | _BZ_for_20:
60 80 f0 a0 00                 # 58b7 |   mov D, 0xa0 + D
58 f8 ef ff                    # 58bc |   jmp ${_BA_for_20}:rel + PC
                               #      | _C_for_20:
                               #      | _Z_for_20:
62 60 e0 55 55                 # 58c0 |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 58c5 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 58cc |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 58d3 |   jmp ${_C_if_31}:rel + PC
                               #      | _E_if_31:
98 ff 20 00                    # 58d7 |   getb H, A, 0
                               #      | _A_if_32:
e8 ff 00 f8 0b 00              # 58db |   jeq H, 0, ${_E_if_32}:rel + PC
60 ff e0 ff 7f                 # 58e1 |   mov H, 0x7fff
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _A_for_21:
60 80 00                       # 58e6 |   mov D, 0
                               #      | _BA_for_21:
fc 80 e0 f8 b0 04 15 00        # 58e9 |   jge D, 0x4b0, ${_C_for_21}:rel + PC
b2 70 ff fe                    # 58f1 |   or [C + D], H, G
                               #      | _BZ_for_21:
60 80 f0 a0 00                 # 58f5 |   mov D, 0xa0 + D
58 f8 ef ff                    # 58fa |   jmp ${_BA_for_21}:rel + PC
                               #      | _C_for_21:
                               #      | _Z_for_21:
                               #      | _A_for_22:
60 80 1c 50                    # 58fe |   mov D, 0x50
                               #      | _BA_for_22:
fc 80 e0 f8 b0 04 15 00        # 5902 |   jge D, 0x4b0, ${_C_for_22}:rel + PC
b2 70 ff fe                    # 590a |   or [C + D], H, G
                               #      | _BZ_for_22:
60 80 f0 a0 00                 # 590e |   mov D, 0xa0 + D
58 f8 ef ff                    # 5913 |   jmp ${_BA_for_22}:rel + PC
                               #      | _C_for_22:
                               #      | _Z_for_22:
62 70 00                       # 5917 |   mov [C + D], 0
98 ff 20 1c 01                 # 591a |   getb H, A, 0x1
                               #      | _A_if_33:
e8 ff 00 f8 0b 00              # 591f |   jeq H, 0, ${_E_if_33}:rel + PC
60 ff e0 ff 7f                 # 5925 |   mov H, 0x7fff
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _A_for_23:
60 80 e0 00 05                 # 592a |   mov D, 0x500
                               #      | _BA_for_23:
fc 80 e0 f8 b0 09 15 00        # 592f |   jge D, 0x9b0, ${_C_for_23}:rel + PC
b2 70 ff fe                    # 5937 |   or [C + D], H, G
                               #      | _BZ_for_23:
60 80 f0 a0 00                 # 593b |   mov D, 0xa0 + D
58 f8 ef ff                    # 5940 |   jmp ${_BA_for_23}:rel + PC
                               #      | _C_for_23:
                               #      | _Z_for_23:
                               #      | _A_for_24:
60 80 e0 50 05                 # 5944 |   mov D, 0x550
                               #      | _BA_for_24:
fc 80 e0 f8 b0 09 15 00        # 5949 |   jge D, 0x9b0, ${_C_for_24}:rel + PC
b2 70 ff fe                    # 5951 |   or [C + D], H, G
                               #      | _BZ_for_24:
60 80 f0 a0 00                 # 5955 |   mov D, 0xa0 + D
58 f8 ef ff                    # 595a |   jmp ${_BA_for_24}:rel + PC
                               #      | _C_for_24:
                               #      | _Z_for_24:
62 70 00                       # 595e |   mov [C + D], 0
98 ff 20 1c 02                 # 5961 |   getb H, A, 0x2
                               #      | _A_if_34:
e8 ff 00 f8 0b 00              # 5966 |   jeq H, 0, ${_E_if_34}:rel + PC
60 ff e0 ff 7f                 # 596c |   mov H, 0x7fff
                               #      | _E_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
                               #      | _A_for_25:
60 80 e0 00 0a                 # 5971 |   mov D, 0xa00
                               #      | _BA_for_25:
fc 80 e0 f8 b0 0e 15 00        # 5976 |   jge D, 0xeb0, ${_C_for_25}:rel + PC
b2 70 ff fe                    # 597e |   or [C + D], H, G
                               #      | _BZ_for_25:
60 80 f0 a0 00                 # 5982 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5987 |   jmp ${_BA_for_25}:rel + PC
                               #      | _C_for_25:
                               #      | _Z_for_25:
                               #      | _A_for_26:
60 80 e0 50 0a                 # 598b |   mov D, 0xa50
                               #      | _BA_for_26:
fc 80 e0 f8 b0 0e 15 00        # 5990 |   jge D, 0xeb0, ${_C_for_26}:rel + PC
b2 70 ff fe                    # 5998 |   or [C + D], H, G
                               #      | _BZ_for_26:
60 80 f0 a0 00                 # 599c |   mov D, 0xa0 + D
58 f8 ef ff                    # 59a1 |   jmp ${_BA_for_26}:rel + PC
                               #      | _C_for_26:
                               #      | _Z_for_26:
62 70 00                       # 59a5 |   mov [C + D], 0
                               #      | _C_if_31:
                               #      | _Z_if_31:
61 20 bc 04                    # 59a8 |   mov A, [SP + 0x4]
                               #      | _A_if_35:
ed 20 bc f8 02 19 00           # 59ac |   jne A, [SP + 0x2], ${_E_if_35}:rel + PC
62 ec 1c b0 04 ff              # 59b3 |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 59b9 |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 59bf |   mov [0xeb0 + C], -1
                               #      | _E_if_35:
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _A_if_36:
ec 20 00 f8 16 00              # 59c5 |   jne A, 0, ${_E_if_36}:rel + PC
62 60 1c ff                    # 59cb |   mov [C], -1
62 ec 1c 00 05 ff              # 59cf |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 59d5 |   mov [0xa00 + C], -1
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _BZ_for_18:
44 40                          # 59db |   inc B
58 f8 6f fe                    # 59dd |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
e4 20                          # 59e1 |   pop A
                               #      | _Z_for_18:
                               #      | _BZ_for_17:
44 20                          # 59e3 |   inc A
58 f8 48 fe                    # 59e5 |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
                               #      | _Z_for_17:
                               #      | _cleanup_fn_draw_small_board:
60 a0 bc 04                    # 59e9 |   mov SP, SP + 0x4
e4 20                          # 59ed |   pop A
e4 40                          # 59ef |   pop B
e4 60                          # 59f1 |   pop C
e4 80                          # 59f3 |   pop D
dc                             # 59f5 |   ret
                               #      | _end_fn_draw_small_board:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 59f6 |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 59f9 |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 59fa |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 59fb |   push D
e0 60                          # 59fd |   push C
e0 40                          # 59ff |   push B
e0 20                          # 5a01 |   push A
60 60 00                       # 5a03 |   mov C, 0
                               #      | _A_call_42:
e0 00                          # 5a06 |   push 0
5c f8 06 fa                    # 5a08 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5a0c |   mov SP, SP + 0x2
                               #      | _Z_call_42:
                               #      | _A_for_27:
60 20 00                       # 5a10 |   mov A, 0
                               #      | _BA_for_27:
fc 20 1c f8 02 37 00           # 5a13 |   jge A, 0x2, ${_C_for_27}:rel + PC
                               #      | _A_for_28:
60 40 00                       # 5a1a |   mov B, 0
                               #      | _BA_for_28:
fc 40 1c f8 0a 27 00           # 5a1d |   jge B, 0xa, ${_C_for_28}:rel + PC
88 80 20 1c 0a                 # 5a24 |   mul D, A, 0xa
00 80 e8 c2 6d                 # 5a29 |   add D, ${var__board__board_state} + B
65 ff 80                       # 5a2e |   bmov H, [D]
                               #      | _A_if_38:
e8 ff 00 f8 0d 00              # 5a31 |   jeq H, 0, ${_E_if_38}:rel + PC
c4 60 00                       # 5a37 |   inc C, 0
58 f8 10 00                    # 5a3a |   jmp ${_C_for_27}:rel + PC
                               #      | _E_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
                               #      | _BZ_for_28:
44 40                          # 5a3e |   inc B
58 f8 dd ff                    # 5a40 |   jmp ${_BA_for_28}:rel + PC
                               #      | _C_for_28:
                               #      | _Z_for_28:
                               #      | _BZ_for_27:
44 20                          # 5a44 |   inc A
58 f8 cd ff                    # 5a46 |   jmp ${_BA_for_27}:rel + PC
                               #      | _C_for_27:
                               #      | _Z_for_27:
                               #      | _A_call_43:
e0 1c 01                       # 5a4a |   push 0x1
5c f8 c1 f9                    # 5a4d |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5a51 |   mov SP, SP + 0x2
                               #      | _Z_call_43:
60 ff 60                       # 5a55 |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 5a58 |   pop A
e4 40                          # 5a5a |   pop B
e4 60                          # 5a5c |   pop C
e4 80                          # 5a5e |   pop D
dc                             # 5a60 |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
e0 20                          # 5a61 |   push A
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 fe e0 06 ff                 # 5a63 |   mov G, [0xff06]
ac ff fe e0 00 80              # 5a68 |   and H, G, 0x8000
e8 ff 00 f8 ba 00              # 5a6e |   jeq H, 0, ${_C_loop_3}:rel + PC
a9 ff e0 1c cc 6e 08           # 5a74 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 5a7b |   and G, 0xff
30 ff fe                       # 5a80 |   or H, G
62 e0 ff cc 6e                 # 5a83 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5a88 |   shr G, H, 0x8
2c ff e0 ff 00                 # 5a8d |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 5a92 |   jeq G, 0xf0, ${_BA_loop_3}:rel + PC
60 fe 00                       # 5a9a |   mov G, 0
                               #      | _A_if_42:
ec ff 1c f8 75 0f 00           # 5a9d |   jne H, 0x75, ${_E_if_42}:rel + PC
60 fe 1c 03                    # 5aa4 |   mov G, 0x3
58 f8 68 00                    # 5aa8 |   jmp ${_C_if_42}:rel + PC
                               #      | _E_if_42:
ec ff 1c f8 74 0f 00           # 5aac |   jne H, 0x74, ${_E2_if_42}:rel + PC
60 fe 1c 02                    # 5ab3 |   mov G, 0x2
58 f8 59 00                    # 5ab7 |   jmp ${_C_if_42}:rel + PC
                               #      | _E2_if_42:
ec ff 1c f8 6b 0e 00           # 5abb |   jne H, 0x6b, ${_E3_if_42}:rel + PC
c4 fe 00                       # 5ac2 |   inc G, 0
58 f8 4b 00                    # 5ac5 |   jmp ${_C_if_42}:rel + PC
                               #      | _E3_if_42:
ec ff 1c f8 72 0f 00           # 5ac9 |   jne H, 0x72, ${_E4_if_42}:rel + PC
60 fe 1c 06                    # 5ad0 |   mov G, 0x6
58 f8 3c 00                    # 5ad4 |   jmp ${_C_if_42}:rel + PC
                               #      | _E4_if_42:
ec ff 1c f8 21 0f 00           # 5ad8 |   jne H, 0x21, ${_E5_if_42}:rel + PC
60 fe 1c 07                    # 5adf |   mov G, 0x7
58 f8 2d 00                    # 5ae3 |   jmp ${_C_if_42}:rel + PC
                               #      | _E5_if_42:
ec ff 1c f8 1a 0f 00           # 5ae7 |   jne H, 0x1a, ${_E6_if_42}:rel + PC
60 fe 1c 04                    # 5aee |   mov G, 0x4
58 f8 1e 00                    # 5af2 |   jmp ${_C_if_42}:rel + PC
                               #      | _E6_if_42:
ec ff 1c f8 22 0f 00           # 5af6 |   jne H, 0x22, ${_E7_if_42}:rel + PC
60 fe 1c 03                    # 5afd |   mov G, 0x3
58 f8 0f 00                    # 5b01 |   jmp ${_C_if_42}:rel + PC
                               #      | _E7_if_42:
ec ff 1c f8 29 0b 00           # 5b05 |   jne H, 0x29, ${_E8_if_42}:rel + PC
60 fe 1c 05                    # 5b0c |   mov G, 0x5
                               #      | _E8_if_42:
                               #      | _C_if_42:
                               #      | _Z_if_42:
                               #      | _A_if_43:
e8 fe 00 f8 14 00              # 5b10 |   jeq G, 0, ${_E_if_43}:rel + PC
                               #      | _A_call_70:
e0 fe                          # 5b16 |   push G
5c f8 86 00                    # 5b18 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5b1c |   mov SP, SP + 0x2
                               #      | _Z_call_70:
                               #      | _A_call_71:
5c f8 f4 f9                    # 5b20 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_71:
                               #      | _E_if_43:
                               #      | _C_if_43:
                               #      | _Z_if_43:
                               #      | _BZ_loop_3:
58 f8 3f ff                    # 5b24 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
61 ff e0 0e ff                 # 5b28 |   mov H, [0xff0e]
                               #      | _A_if_52:
e9 ff e0 f8 ca 6e 6e 00        # 5b2d |   jeq H, [${var__last_btn_in}], ${_E_if_52}:rel + PC
62 e0 ff ca 6e                 # 5b35 |   mov [${var__last_btn_in}], H
60 fe 00                       # 5b3a |   mov G, 0
98 20 ff 1c 0c                 # 5b3d |   getb A, H, 0xc
                               #      | _A_if_53:
e8 20 00 f8 0a 00              # 5b42 |   jeq A, 0, ${_E_if_53}:rel + PC
60 fe 1c 03                    # 5b48 |   mov G, 0x3
                               #      | _E_if_53:
                               #      | _C_if_53:
                               #      | _Z_if_53:
98 20 ff 1c 0b                 # 5b4c |   getb A, H, 0xb
                               #      | _A_if_54:
e8 20 00 f8 0a 00              # 5b51 |   jeq A, 0, ${_E_if_54}:rel + PC
60 fe 1c 02                    # 5b57 |   mov G, 0x2
                               #      | _E_if_54:
                               #      | _C_if_54:
                               #      | _Z_if_54:
98 20 ff 1c 0a                 # 5b5b |   getb A, H, 0xa
                               #      | _A_if_55:
e8 20 00 f8 09 00              # 5b60 |   jeq A, 0, ${_E_if_55}:rel + PC
c4 fe 00                       # 5b66 |   inc G, 0
                               #      | _E_if_55:
                               #      | _C_if_55:
                               #      | _Z_if_55:
98 20 ff 1c 09                 # 5b69 |   getb A, H, 0x9
                               #      | _A_if_56:
e8 20 00 f8 0a 00              # 5b6e |   jeq A, 0, ${_E_if_56}:rel + PC
60 fe 1c 05                    # 5b74 |   mov G, 0x5
                               #      | _E_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
98 20 ff 1c 08                 # 5b78 |   getb A, H, 0x8
                               #      | _A_if_57:
e8 20 00 f8 0a 00              # 5b7d |   jeq A, 0, ${_E_if_57}:rel + PC
60 fe 1c 07                    # 5b83 |   mov G, 0x7
                               #      | _E_if_57:
                               #      | _C_if_57:
                               #      | _Z_if_57:
                               #      | _A_if_58:
e8 fe 00 f8 14 00              # 5b87 |   jeq G, 0, ${_E_if_58}:rel + PC
                               #      | _A_call_72:
e0 fe                          # 5b8d |   push G
5c f8 0f 00                    # 5b8f |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5b93 |   mov SP, SP + 0x2
                               #      | _Z_call_72:
                               #      | _A_call_73:
5c f8 7d f9                    # 5b97 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_73:
                               #      | _E_if_58:
                               #      | _C_if_58:
                               #      | _Z_if_58:
                               #      | _E_if_52:
                               #      | _C_if_52:
                               #      | _Z_if_52:
                               #      | _cleanup_fn_handle_keyboard:
e4 20                          # 5b9b |   pop A
dc                             # 5b9d |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 5b9e |   push A
61 20 bc 04                    # 5ba0 |   mov A, [SP + 0x4]
                               #      | _A_if_44:
ec 20 1c f8 01 16 00           # 5ba4 |   jne A, 0x1, ${_E_if_44}:rel + PC
                               #      | _A_call_49:
e0 1c ff                       # 5bab |   push -1
5c f8 7a 00                    # 5bae |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5bb2 |   mov SP, SP + 0x2
                               #      | _Z_call_49:
58 f8 6f 00                    # 5bb6 |   jmp ${_C_if_44}:rel + PC
                               #      | _E_if_44:
ec 20 1c f8 02 16 00           # 5bba |   jne A, 0x2, ${_E2_if_44}:rel + PC
                               #      | _A_call_50:
e0 1c 01                       # 5bc1 |   push 0x1
5c f8 64 00                    # 5bc4 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5bc8 |   mov SP, SP + 0x2
                               #      | _Z_call_50:
58 f8 59 00                    # 5bcc |   jmp ${_C_if_44}:rel + PC
                               #      | _E2_if_44:
ec 20 1c f8 05 0f 00           # 5bd0 |   jne A, 0x5, ${_E3_if_44}:rel + PC
                               #      | _A_call_55:
5c f8 7d 00                    # 5bd7 |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_55:
58 f8 4a 00                    # 5bdb |   jmp ${_C_if_44}:rel + PC
                               #      | _E3_if_44:
ec 20 1c f8 03 16 00           # 5bdf |   jne A, 0x3, ${_E4_if_44}:rel + PC
                               #      | _A_call_61:
e0 1c 01                       # 5be6 |   push 0x1
5c f8 9b 00                    # 5be9 |   call ${fn_tg_rotate}:rel + PC
60 a0 bc 02                    # 5bed |   mov SP, SP + 0x2
                               #      | _Z_call_61:
58 f8 34 00                    # 5bf1 |   jmp ${_C_if_44}:rel + PC
                               #      | _E4_if_44:
ec 20 1c f8 04 16 00           # 5bf5 |   jne A, 0x4, ${_E5_if_44}:rel + PC
                               #      | _A_call_62:
e0 1c ff                       # 5bfc |   push -1
5c f8 85 00                    # 5bff |   call ${fn_tg_rotate}:rel + PC
60 a0 bc 02                    # 5c03 |   mov SP, SP + 0x2
                               #      | _Z_call_62:
58 f8 1e 00                    # 5c07 |   jmp ${_C_if_44}:rel + PC
                               #      | _E5_if_44:
ec 20 1c f8 07 0f 00           # 5c0b |   jne A, 0x7, ${_E6_if_44}:rel + PC
                               #      | _A_call_68:
5c f8 cc 00                    # 5c12 |   call ${fn_tg_hold}:rel + PC
                               #      | _Z_call_68:
58 f8 0f 00                    # 5c16 |   jmp ${_C_if_44}:rel + PC
                               #      | _E6_if_44:
ec 20 1c f8 06 0b 00           # 5c1a |   jne A, 0x6, ${_E7_if_44}:rel + PC
                               #      | _A_call_69:
5c f8 9f f7                    # 5c21 |   call ${fn_tg_soft_drop}:rel + PC
                               #      | _Z_call_69:
                               #      | _E7_if_44:
                               #      | _C_if_44:
                               #      | _Z_if_44:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 5c25 |   pop A
dc                             # 5c27 |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_46:
e0 00                          # 5c28 |   push 0
5c f8 e4 f7                    # 5c2a |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5c2e |   mov SP, SP + 0x2
                               #      | _Z_call_46:
03 e0 bc aa 6e 02              # 5c32 |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_47:
5c f8 52 f8                    # 5c38 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_47:
                               #      | _A_if_45:
ec ff 00 f8 0c 00              # 5c3c |   jne H, 0, ${_E_if_45}:rel + PC
07 e0 bc aa 6e 02              # 5c42 |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_45:
                               #      | _C_if_45:
                               #      | _Z_if_45:
                               #      | _A_call_48:
e0 1c 01                       # 5c48 |   push 0x1
5c f8 c3 f7                    # 5c4b |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5c4f |   mov SP, SP + 0x2
                               #      | _Z_call_48:
                               #      | _cleanup_fn_tg_move:
dc                             # 5c53 |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_51:
e0 00                          # 5c54 |   push 0
5c f8 b8 f7                    # 5c56 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5c5a |   mov SP, SP + 0x2
                               #      | _Z_call_51:
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
46 e0 a8 6e                    # 5c5e |   inc [${var__board__falling} + 0004]
                               #      | _A_call_52:
5c f8 28 f8                    # 5c62 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_52:
e8 ff 00 f8 0a 00              # 5c66 |   jeq H, 0, ${_C_loop_4}:rel + PC
                               #      | _BZ_loop_4:
58 f8 f2 ff                    # 5c6c |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
4a e0 a8 6e                    # 5c70 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_53:
e0 1c 01                       # 5c74 |   push 0x1
5c f8 97 f7                    # 5c77 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5c7b |   mov SP, SP + 0x2
                               #      | _Z_call_53:
                               #      | _A_call_54:
5c f8 79 f5                    # 5c7f |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_54:
                               #      | _cleanup_fn_tg_down:
dc                             # 5c83 |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_56:
e0 00                          # 5c84 |   push 0
5c f8 88 f7                    # 5c86 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5c8a |   mov SP, SP + 0x2
                               #      | _Z_call_56:
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
81 ff e0 1c a6 6e 04           # 5c8e |   add H, [${var__board__falling} + 0002], 0x4
01 ff bc 02                    # 5c95 |   add H, [SP + 0x2]
2c ff 1c 03                    # 5c99 |   and H, 0x3
62 e0 ff a6 6e                 # 5c9d |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_57:
5c f8 e8 f7                    # 5ca2 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_57:
ec ff 00 f8 2c 00              # 5ca6 |   jne H, 0, ${_C_loop_5}:rel + PC
4a e0 aa 6e                    # 5cac |   dec [${var__board__falling} + 0006]
                               #      | _A_call_58:
5c f8 da f7                    # 5cb0 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_58:
ec ff 00 f8 1e 00              # 5cb4 |   jne H, 0, ${_C_loop_5}:rel + PC
02 e0 1c aa 6e 02              # 5cba |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_59:
5c f8 ca f7                    # 5cc0 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_59:
ec ff 00 f8 0e 00              # 5cc4 |   jne H, 0, ${_C_loop_5}:rel + PC
4a e0 aa 6e                    # 5cca |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_5:
58 f8 c0 ff                    # 5cce |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _A_call_60:
e0 1c 01                       # 5cd2 |   push 0x1
5c f8 39 f7                    # 5cd5 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5cd9 |   mov SP, SP + 0x2
                               #      | _Z_call_60:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 5cdd |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn_tg_hold:
                               #      | _begin_fn_tg_hold:
e0 40                          # 5cde |   push B
e0 20                          # 5ce0 |   push A
                               #      | _A_call_63:
e0 00                          # 5ce2 |   push 0
5c f8 2a f7                    # 5ce4 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5ce8 |   mov SP, SP + 0x2
                               #      | _Z_call_63:
                               #      | _A_if_50:
ee e0 1c f8 b4 6e ff 24 00     # 5cec |   jne [${var__board__stored}], -1, ${_E_if_50}:rel + PC
                               #      | _A_call_64:
e0 1c 08                       # 5cf5 |   push 0x8
e0 e0 a4 6e                    # 5cf8 |   push ${var__board__falling}
e0 e0 b4 6e                    # 5cfc |   push ${var__board__stored}
5c f8 35 f5                    # 5d00 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 5d04 |   mov SP, SP + 0x6
                               #      | _Z_call_64:
                               #      | _A_call_65:
5c f8 f0 f4                    # 5d08 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_65:
58 f8 39 00                    # 5d0c |   jmp ${_C_if_50}:rel + PC
                               #      | _E_if_50:
61 20 e0 a4 6e                 # 5d10 |   mov A, [${var__board__falling}]
61 40 e0 a6 6e                 # 5d15 |   mov B, [${var__board__falling} + 0002]
63 e0 e0 a4 6e b4 6e           # 5d1a |   mov [${var__board__falling}], [${var__board__stored}]
63 e0 e0 a6 6e b6 6e           # 5d21 |   mov [${var__board__falling} + 0002], [${var__board__stored} + 0002]
62 e0 20 b4 6e                 # 5d28 |   mov [${var__board__stored}], A
62 e0 40 b6 6e                 # 5d2d |   mov [${var__board__stored} + 0002], B
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
                               #      | _A_call_66:
5c f8 58 f7                    # 5d32 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_66:
e8 ff 1c f8 01 0f 00           # 5d36 |   jeq H, 0x1, ${_C_loop_6}:rel + PC
4a e0 a8 6e                    # 5d3d |   dec [${var__board__falling} + 0004]
                               #      | _BZ_loop_6:
58 f8 f1 ff                    # 5d41 |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _C_if_50:
                               #      | _Z_if_50:
                               #      | _A_call_67:
e0 1c 01                       # 5d45 |   push 0x1
5c f8 c6 f6                    # 5d48 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d4c |   mov SP, SP + 0x2
                               #      | _Z_call_67:
                               #      | _cleanup_fn_tg_hold:
e4 20                          # 5d50 |   pop A
e4 40                          # 5d52 |   pop B
dc                             # 5d54 |   ret
                               #      | _end_fn_tg_hold:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5d55 |   push D
e0 60                          # 5d57 |   push C
e0 40                          # 5d59 |   push B
e0 20                          # 5d5b |   push A
61 40 e0 10 ff                 # 5d5d |   mov B, [0xff10]
61 60 e0 12 ff                 # 5d62 |   mov C, [0xff12]
61 80 e0 14 ff                 # 5d67 |   mov D, [0xff14]
61 20 bc 0e                    # 5d6c |   mov A, [SP + 0xe]
60 ff 00                       # 5d70 |   mov H, 0
                               #      | _A_if_59:
fc 28 20 f8 09 00              # 5d73 |   jge A + B, A, ${_E_if_59}:rel + PC
c4 ff 00                       # 5d79 |   inc H, 0
                               #      | _E_if_59:
                               #      | _C_if_59:
                               #      | _Z_if_59:
60 40 44                       # 5d7c |   mov B, B + A
81 20 bc ff 0c                 # 5d7f |   add A, [SP + 0xc], H
60 ff 00                       # 5d84 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 5d87 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 5d8d |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 5d93 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 5d97 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 5d9a |   mov C, C + A
81 20 bc ff 0a                 # 5d9d |   add A, [SP + 0xa], H
60 80 84                       # 5da2 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 5da5 |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 10 ff                 # 5da9 |   mov H, [0xff10]
61 fe e0 12 ff                 # 5dae |   mov G, [0xff12]
61 fc e0 14 ff                 # 5db3 |   mov E, [0xff14]
                               #      | _A_if_62:
e8 fc 80 f8 10 00              # 5db8 |   jeq E, D, ${_E_if_62}:rel + PC
f8 fc 80 f8 2c 00              # 5dbe |   jgt E, D, ${_C_loop_7}:rel + PC
58 f8 22 00                    # 5dc4 |   jmp ${_C_if_62}:rel + PC
                               #      | _E_if_62:
                               #      | _A_if_64:
e8 fe 60 f8 10 00              # 5dc8 |   jeq G, C, ${_E_if_64}:rel + PC
f8 fe 60 f8 1c 00              # 5dce |   jgt G, C, ${_C_loop_7}:rel + PC
58 f8 12 00                    # 5dd4 |   jmp ${_C_if_64}:rel + PC
                               #      | _E_if_64:
f8 ff 40 f8 12 00              # 5dd8 |   jgt H, B, ${_C_loop_7}:rel + PC
                               #      | _A_if_67:
e8 20 00 f8 08 00              # 5dde |   jeq A, 0, ${_E_if_67}:rel + PC
5c 20                          # 5de4 |   call A
                               #      | _E_if_67:
                               #      | _C_if_67:
                               #      | _Z_if_67:
                               #      | _C_if_64:
                               #      | _Z_if_64:
                               #      | _C_if_62:
                               #      | _Z_if_62:
                               #      | _BZ_loop_7:
58 f8 c3 ff                    # 5de6 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5dea |   pop A
e4 40                          # 5dec |   pop B
e4 60                          # 5dee |   pop C
e4 80                          # 5df0 |   pop D
dc                             # 5df2 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 5df3 |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5e2b |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | const__data_1:
57 65 65 65 6b 6c 79 20 33 30 30 36 00 # 5e53 |   .data str:"Weeekly 3006"
                               #      | const__data_2:
54 65 74 72 69 73 20 44 65 6d 6f 00 # 5e60 |   .data str:"Tetris Demo"
                               #      | const__str__Next:
4e 65 78 74 00                 # 5e6c |   .data str:"Next"
                               #      | const__str__Hold:
48 6f 6c 64 00                 # 5e71 |   .data str:"Hold"
                               #      | const__data_3:
3e 3a 4c 65 66 74 0a 3c 3a 52 69 67 68 74 0a 76 3a 44 6f 77 6e 0a 7a 3a 52 6f 74 61 74 65 20 4c 65 66 74 0a 78 3a 52 6f 74 61 74 65 20 52 69 67 68 74 0a 63 3a 48 6f 6c 64 20 42 6c 6f 63 6b 0a 53 42 3a 44 72 6f 70 00 # 5e76 |   .data str:">:Left\n<:Right\nv:Down\nz:Rotate Left\nx:Rotate Right\nc:Hold Block\nSB:Drop"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5ebe
                               #      | SECTION_BEGIN_static_data:
                               # 5ebe |   .align dummy_size:2 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5ec0 |   .bss size:3840 align:16
                               #      | var__rand__state:
                               # 6dc0 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 6dc2 |   .bss size:222 align:1
                               #      | var__board__points:
                               # 6ea0 |   .bss size:2 align:1
                               #      | var__board__level:
                               # 6ea2 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 6ea4 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 6eac |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 6eb4 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 6ebc |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 6ebe |   .bss size:2 align:1
                               #      | var__var_1:
                               # 6ec0 |   .bss size:10 align:1
                               #      | var__last_btn_in:
                               # 6eca |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 6ecc |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
