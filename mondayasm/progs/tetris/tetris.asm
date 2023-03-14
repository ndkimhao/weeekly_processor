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
62 e0 00 da 6e                 # 500a |   mov [${var__last_btn_in}], 0
62 e0 00 0a ff                 # 500f |   mov [0xff0a], 0
                               #      | _A_call_8:
5c f8 2c 00                    # 5014 |   call ${fn_tg_init_video}:rel + PC
                               #      | _Z_call_8:
                               #      | _A_call_22:
5c f8 51 01                    # 5018 |   call ${fn_tg_init}:rel + PC
                               #      | _Z_call_22:
                               #      |   # game loop
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_call_45:
5c f8 63 03                    # 501c |   call ${fn_tg_tick}:rel + PC
                               #      | _Z_call_45:
e8 ff 00 f8 1f 00              # 5020 |   jeq H, 0, ${_C_loop_2}:rel + PC
                               #      | _A_call_74:
e0 e0 66 5a                    # 5026 |   push ${fn_handle_keyboard}
e0 e0 c0 27                    # 502a |   push 0x27c0
e0 1c 09                       # 502e |   push 0x9
e0 00                          # 5031 |   push 0
5c f8 27 0d                    # 5033 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 5037 |   mov SP, SP + 0x8
                               #      | _Z_call_74:
                               #      | _BZ_loop_2:
58 f8 e1 ff                    # 503b |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_main:
dc                             # 503f |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_tg_init_video:
                               #      | _begin_fn_tg_init_video:
e0 20                          # 5040 |   push A
                               #      | _A_call_1:
e0 00                          # 5042 |   push 0
e0 00                          # 5044 |   push 0
5c f8 5f 00                    # 5046 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 504a |   mov SP, SP + 0x4
                               #      | _Z_call_1:
                               #      | _A_call_3:
5c f8 79 00                    # 504e |   call ${fn_reset_color_palette}:rel + PC
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 e0 f0 00                    # 5052 |   push 0xf0
e0 00                          # 5056 |   push 0
e0 e0 a0 00                    # 5058 |   push 0xa0
e0 1c 04                       # 505c |   push 0x4
5c f8 c8 00                    # 505f |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 5063 |   mov SP, SP + 0x8
                               #      | _Z_call_4:
                               #      | _A_call_5:
e0 1c 70                       # 5067 |   push 0x70
e0 1c 70                       # 506a |   push 0x70
e0 1c 70                       # 506d |   push 0x70
e0 1c 07                       # 5070 |   push 0x7
5c f8 b4 00                    # 5073 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 5077 |   mov SP, SP + 0x8
                               #      | _Z_call_5:
                               #      | _A_for_2:
60 20 00                       # 507b |   mov A, 0
                               #      | _BA_for_2:
fc 20 1c f8 1e 24 00           # 507e |   jge A, 0x1e, ${_C_for_2}:rel + PC
                               #      | _A_call_6:
e0 1c 08                       # 5085 |   push 0x8
e0 20                          # 5088 |   push A
5c f8 1b 00                    # 508a |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 508e |   mov SP, SP + 0x4
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 00                          # 5092 |   push 0
5c f8 b4 00                    # 5094 |   call ${fn_fill_page}:rel + PC
60 a0 bc 02                    # 5098 |   mov SP, SP + 0x2
                               #      | _Z_call_7:
                               #      | _BZ_for_2:
44 20                          # 509c |   inc A
58 f8 e0 ff                    # 509e |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_tg_init_video:
e4 20                          # 50a2 |   pop A
dc                             # 50a4 |   ret
                               #      | _end_fn_tg_init_video:
                               #      | 
                               #      | fn_switch_screen_page:
                               #      | _begin_fn_switch_screen_page:
e0 40                          # 50a5 |   push B
e0 20                          # 50a7 |   push A
61 20 bc 08                    # 50a9 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 50ad |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 50b2 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c d0 5e cf 63 04     # 50b9 |   mmap ${var__VIDEO_PAGE_BUFFER}, ${var__VIDEO_PAGE_BUFFER} + 04ff, 0x4
                               #      | _cleanup_fn_switch_screen_page:
e4 20                          # 50c2 |   pop A
e4 40                          # 50c4 |   pop B
dc                             # 50c6 |   ret
                               #      | _end_fn_switch_screen_page:
                               #      | 
                               #      | fn_reset_color_palette:
                               #      | _begin_fn_reset_color_palette:
e0 80                          # 50c7 |   push D
e0 60                          # 50c9 |   push C
e0 40                          # 50cb |   push B
e0 20                          # 50cd |   push A
                               #      | _A_for_1:
60 20 00                       # 50cf |   mov A, 0
                               #      | _BA_for_1:
fc 20 1c f8 08 4c 00           # 50d2 |   jge A, 0x8, ${_C_for_1}:rel + PC
98 40 20 1c 02                 # 50d9 |   getb B, A, 0x2
                               #      | _A_if_1:
e8 40 00 f8 0b 00              # 50de |   jeq B, 0, ${_E_if_1}:rel + PC
60 40 e0 ff 00                 # 50e4 |   mov B, 0xff
                               #      | _E_if_1:
                               #      | _C_if_1:
                               #      | _Z_if_1:
98 60 20 1c 01                 # 50e9 |   getb C, A, 0x1
                               #      | _A_if_2:
e8 60 00 f8 0b 00              # 50ee |   jeq C, 0, ${_E_if_2}:rel + PC
60 60 e0 ff 00                 # 50f4 |   mov C, 0xff
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
98 80 20 00                    # 50f9 |   getb D, A, 0
                               #      | _A_if_3:
e8 80 00 f8 0b 00              # 50fd |   jeq D, 0, ${_E_if_3}:rel + PC
60 80 e0 ff 00                 # 5103 |   mov D, 0xff
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _A_call_2:
e0 80                          # 5108 |   push D
e0 60                          # 510a |   push C
e0 40                          # 510c |   push B
e0 20                          # 510e |   push A
5c f8 17 00                    # 5110 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 5114 |   mov SP, SP + 0x8
                               #      | _Z_call_2:
                               #      | _BZ_for_1:
44 20                          # 5118 |   inc A
58 f8 b8 ff                    # 511a |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_reset_color_palette:
e4 20                          # 511e |   pop A
e4 40                          # 5120 |   pop B
e4 60                          # 5122 |   pop C
e4 80                          # 5124 |   pop D
dc                             # 5126 |   ret
                               #      | _end_fn_reset_color_palette:
                               #      | 
                               #      | fn_set_color_palette:
                               #      | _begin_fn_set_color_palette:
e0 20                          # 5127 |   push A
ad 20 bc 1c 04 07              # 5129 |   and A, [SP + 0x4], 0x7
28 20 1c 01                    # 512f |   shl A, 0x1
63 e4 bc d0 5e 0a              # 5133 |   mov [${var__VIDEO_PAGE_BUFFER} + A], [SP + 0xa]
63 e4 bc e0 5e 08              # 5139 |   mov [${var__VIDEO_PAGE_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc f0 5e 06              # 513f |   mov [${var__VIDEO_PAGE_BUFFER} + 0020 + A], [SP + 0x6]
                               #      | _cleanup_fn_set_color_palette:
e4 20                          # 5145 |   pop A
dc                             # 5147 |   ret
                               #      | _end_fn_set_color_palette:
                               #      | 
                               #      | fn_fill_page:
                               #      | _begin_fn_fill_page:
e0 20                          # 5148 |   push A
61 fe bc 04                    # 514a |   mov G, [SP + 0x4]
                               #      | _A_for_3:
60 20 e0 d0 5e                 # 514e |   mov A, ${var__VIDEO_PAGE_BUFFER}
                               #      | _BA_for_3:
fc 20 e0 f8 d0 63 13 00        # 5153 |   jge A, ${var__VIDEO_PAGE_BUFFER} + 0500, ${_C_for_3}:rel + PC
62 20 fe                       # 515b |   mov [A], G
                               #      | _BZ_for_3:
60 20 3c 02                    # 515e |   mov A, A + 0x2
58 f8 f1 ff                    # 5162 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_fill_page:
e4 20                          # 5166 |   pop A
dc                             # 5168 |   ret
                               #      | _end_fn_fill_page:
                               #      | 
                               #      | fn_tg_init:
                               #      | _begin_fn_tg_init:
                               #      | _A_call_9:
e0 e0 dc 00                    # 5169 |   push 0xdc
e0 00                          # 516d |   push 0
e0 e0 d2 6d                    # 516f |   push ${var__board__board_state}
5c f8 4a 00                    # 5173 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 5177 |   mov SP, SP + 0x6
                               #      | _Z_call_9:
62 e0 00 b0 6e                 # 517b |   mov [${var__board__points}], 0
62 e0 00 b2 6e                 # 5180 |   mov [${var__board__level}], 0
62 e0 00 cc 6e                 # 5185 |   mov [${var__board__ticks_till_gravity}], 0
62 e0 00 ce 6e                 # 518a |   mov [${var__board__lines_remaining}], 0
                               #      | _A_call_10:
e0 e0 be 0b                    # 518f |   push 0xbbe
5c f8 63 00                    # 5193 |   call ${fn_srand}:rel + PC
60 a0 bc 02                    # 5197 |   mov SP, SP + 0x2
                               #      | _Z_call_10:
                               #      | _A_call_13:
5c f8 62 00                    # 519b |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_13:
                               #      | _A_call_14:
5c f8 5e 00                    # 519f |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_14:
ca e0 00 c4 6e                 # 51a3 |   dec [${var__board__stored}], 0
62 e0 00 c6 6e                 # 51a8 |   mov [${var__board__stored} + 0002], 0
62 e0 00 c8 6e                 # 51ad |   mov [${var__board__stored} + 0004], 0
62 e0 1c c2 6e 03              # 51b2 |   mov [${var__board__next} + 0006], 0x3
                               #      | _A_call_21:
5c f8 de 00                    # 51b8 |   call ${fn_draw_main_interface}:rel + PC
                               #      | _Z_call_21:
                               #      | _cleanup_fn_tg_init:
dc                             # 51bc |   ret
                               #      | _end_fn_tg_init:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 51bd |   push B
e0 20                          # 51bf |   push A
65 fe bc 08                    # 51c1 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 51c5 |   shl H, G, 0x8
30 ff fe                       # 51ca |   or H, G
61 20 bc 06                    # 51cd |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 51d1 |   add B, [SP + 0xa], A
                               #      | _A_while_1:
                               #      | _BA_while_1:
f8 3c 40 f8 02 12 00           # 51d6 |   jgt A + 0x2, B, ${_C_while_1}:rel + PC
62 20 ff                       # 51dd |   mov [A], H
60 20 3c 02                    # 51e0 |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 f2 ff                    # 51e4 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      | _A_if_4:
fc 20 40 f8 09 00              # 51e8 |   jge A, B, ${_E_if_4}:rel + PC
66 20 ff                       # 51ee |   bmov [A], H
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _cleanup_fn_memset:
e4 20                          # 51f1 |   pop A
e4 40                          # 51f3 |   pop B
dc                             # 51f5 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc d0 6d 02              # 51f6 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 51fc |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_tg_new_falling:
                               #      | _begin_fn_tg_new_falling:
                               #      |   # Board.falling = Board.next
                               #      | _A_call_11:
e0 1c 08                       # 51fd |   push 0x8
e0 e0 bc 6e                    # 5200 |   push ${var__board__next}
e0 e0 b4 6e                    # 5204 |   push ${var__board__falling}
5c f8 32 00                    # 5208 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 520c |   mov SP, SP + 0x6
                               #      | _Z_call_11:
                               #      |   # fill new Board.next
                               #      | _A_call_12:
5c f8 63 00                    # 5210 |   call ${fn_rand}:rel + PC
                               #      | _Z_call_12:
b5 fe e0 ff 10 ff              # 5214 |   xor G, [0xff10], H
08 fe e0 4f c3                 # 521a |   mul G, 0xc34f
90 fe ff 1c 07                 # 521f |   div G, H, 0x7
c6 e0 ff bc 6e                 # 5224 |   inc [${var__board__next}], H
62 e0 00 be 6e                 # 5229 |   mov [${var__board__next} + 0002], 0
62 e0 00 c0 6e                 # 522e |   mov [${var__board__next} + 0004], 0
62 e0 1c c2 6e 03              # 5233 |   mov [${var__board__next} + 0006], 0x3
                               #      | _cleanup_fn_tg_new_falling:
dc                             # 5239 |   ret
                               #      | _end_fn_tg_new_falling:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 523a |   push C
e0 40                          # 523c |   push B
e0 20                          # 523e |   push A
61 20 bc 08                    # 5240 |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 5244 |   add B, [SP + 0xc], A
61 60 bc 0a                    # 5249 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
f8 3c 40 f8 02 16 00           # 524d |   jgt A + 0x2, B, ${_C_while_2}:rel + PC
63 20 60                       # 5254 |   mov [A], [C]
60 20 3c 02                    # 5257 |   mov A, A + 0x2
60 60 7c 02                    # 525b |   mov C, C + 0x2
                               #      | _BZ_while_2:
58 f8 ee ff                    # 525f |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _A_if_5:
fc 20 40 f8 09 00              # 5263 |   jge A, B, ${_E_if_5}:rel + PC
67 20 60                       # 5269 |   bmov [A], [C]
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 526c |   pop A
e4 40                          # 526e |   pop B
e4 60                          # 5270 |   pop C
dc                             # 5272 |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
61 ff e0 d0 6d                 # 5273 |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 5278 |   shl G, H, 0x7
34 ff fe                       # 527d |   xor H, G
a0 fe ff 1c 09                 # 5280 |   shr G, H, 0x9
34 ff fe                       # 5285 |   xor H, G
a8 fe ff 1c 08                 # 5288 |   shl G, H, 0x8
34 ff fe                       # 528d |   xor H, G
62 e0 ff d0 6d                 # 5290 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 5295 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn_draw_main_interface:
                               #      | _begin_fn_draw_main_interface:
                               #      | _A_call_16:
e0 e0 58 5e                    # 5296 |   push ${const__data_1}
e0 1c 07                       # 529a |   push 0x7
e0 1c 11                       # 529d |   push 0x11
e0 1c 02                       # 52a0 |   push 0x2
5c f8 5d 00                    # 52a3 |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 52a7 |   mov SP, SP + 0x8
                               #      | _Z_call_16:
                               #      | _A_call_17:
e0 e0 65 5e                    # 52ab |   push ${const__data_2}
e0 1c 07                       # 52af |   push 0x7
e0 1c 11                       # 52b2 |   push 0x11
e0 1c 03                       # 52b5 |   push 0x3
5c f8 48 00                    # 52b8 |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 52bc |   mov SP, SP + 0x8
                               #      | _Z_call_17:
                               #      | _A_call_18:
e0 e0 71 5e                    # 52c0 |   push ${const__str__Next}
e0 1c 07                       # 52c4 |   push 0x7
e0 1c 12                       # 52c7 |   push 0x12
e0 1c 07                       # 52ca |   push 0x7
5c f8 33 00                    # 52cd |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 52d1 |   mov SP, SP + 0x8
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 e0 76 5e                    # 52d5 |   push ${const__str__Hold}
e0 1c 07                       # 52d9 |   push 0x7
e0 1c 12                       # 52dc |   push 0x12
e0 1c 0b                       # 52df |   push 0xb
5c f8 1e 00                    # 52e2 |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 52e6 |   mov SP, SP + 0x8
                               #      | _Z_call_19:
                               #      | _A_call_20:
e0 e0 7b 5e                    # 52ea |   push ${const__data_3}
e0 1c 07                       # 52ee |   push 0x7
e0 1c 12                       # 52f1 |   push 0x12
e0 1c 10                       # 52f4 |   push 0x10
5c f8 09 00                    # 52f7 |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 52fb |   mov SP, SP + 0x8
                               #      | _Z_call_20:
                               #      | _cleanup_fn_draw_main_interface:
dc                             # 52ff |   ret
                               #      | _end_fn_draw_main_interface:
                               #      | 
                               #      | fn_draw_string:
                               #      | _begin_fn_draw_string:
e0 80                          # 5300 |   push D
e0 60                          # 5302 |   push C
e0 40                          # 5304 |   push B
e0 20                          # 5306 |   push A
61 20 bc 0a                    # 5308 |   mov A, [SP + 0xa]
61 40 bc 10                    # 530c |   mov B, [SP + 0x10]
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
65 ff 40                       # 5310 |   bmov H, [B]
e8 ff 00 f8 63 00              # 5313 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_syscall_1:
e0 1c 0a                       # 5319 |   push 0xa
e0 40                          # 531c |   push B
60 ff 1c 0d                    # 531e |   mov H, 0xd
5e e0 1e ff                    # 5322 |   call [0xff1e]
60 a0 bc 04                    # 5326 |   mov SP, SP + 0x4
                               #      | _Z_syscall_1:
                               #      | _A_if_7:
ec ff 00 f8 0d 00              # 532a |   jne H, 0, ${_E_if_7}:rel + PC
60 80 00                       # 5330 |   mov D, 0
58 f8 0d 00                    # 5333 |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
60 60 ff                       # 5337 |   mov C, H
65 80 60                       # 533a |   bmov D, [C]
66 60 00                       # 533d |   bmov [C], 0
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _A_call_15:
e2 bc 0e                       # 5340 |   push [SP + 0xe]
e2 bc 0c                       # 5343 |   push [SP + 0xc]
5c f8 5f fd                    # 5346 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 534a |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_syscall_2:
e0 40                          # 534e |   push B
e2 bc 0e                       # 5350 |   push [SP + 0xe]
e0 e0 d0 5e                    # 5353 |   push ${var__VIDEO_PAGE_BUFFER}
60 ff 1c 1e                    # 5357 |   mov H, 0x1e
5e e0 1e ff                    # 535b |   call [0xff1e]
60 a0 bc 06                    # 535f |   mov SP, SP + 0x6
                               #      | _Z_syscall_2:
e8 80 00 f8 13 00              # 5363 |   jeq D, 0, ${_C_loop_1}:rel + PC
66 60 80                       # 5369 |   bmov [C], D
c4 40 60                       # 536c |   inc B, C
46 bc 0a                       # 536f |   inc [SP + 0xa]
                               #      | _BZ_loop_1:
58 f8 9e ff                    # 5372 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_draw_string:
e4 20                          # 5376 |   pop A
e4 40                          # 5378 |   pop B
e4 60                          # 537a |   pop C
e4 80                          # 537c |   pop D
dc                             # 537e |   ret
                               #      | _end_fn_draw_string:
                               #      | 
                               #      | fn_tg_tick:
                               #      | _begin_fn_tg_tick:
                               #      | _A_call_29:
5c f8 26 00                    # 537f |   call ${fn_tg_do_gravity_tick}:rel + PC
                               #      | _Z_call_29:
                               #      | _A_if_18:
e8 ff 00 f8 0a 00              # 5383 |   jeq H, 0, ${_E_if_18}:rel + PC
                               #      | _A_call_39:
5c f8 90 01                    # 5389 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_39:
                               #      | _E_if_18:
                               #      | _C_if_18:
                               #      | _Z_if_18:
                               #      | _A_call_40:
5c f8 6e 06                    # 538d |   call ${fn_tg_check_lines}:rel + PC
                               #      | _Z_call_40:
                               #      | _A_call_41:
e0 ff                          # 5391 |   push H
5c f8 6c 06                    # 5393 |   call ${fn_tg_adjust_score}:rel + PC
60 a0 bc 02                    # 5397 |   mov SP, SP + 0x2
                               #      | _Z_call_41:
                               #      | _A_call_44:
5c f8 65 06                    # 539b |   call ${fn_tg_game_over}:rel + PC
                               #      | _Z_call_44:
84 ff 1c ff 01                 # 539f |   sub H, 0x1, H
                               #      | _cleanup_fn_tg_tick:
dc                             # 53a4 |   ret
                               #      | _end_fn_tg_tick:
                               #      | 
                               #      | fn_tg_do_gravity_tick:
                               #      | _begin_fn_tg_do_gravity_tick:
e0 20                          # 53a5 |   push A
4a e0 cc 6e                    # 53a7 |   dec [${var__board__ticks_till_gravity}]
                               #      | _A_if_9:
d2 e0 00 cc 6e                 # 53ab |   icmp [${var__board__ticks_till_gravity}], 0
78 f8 0f 00                    # 53b0 |   jgt ${_E_if_9}:rel + PC
                               #      | _A_call_28:
5c f8 11 00                    # 53b4 |   call ${fn_tg_soft_drop}:rel + PC
                               #      | _Z_call_28:
c4 ff 00                       # 53b8 |   inc H, 0
58 f8 07 00                    # 53bb |   jmp ${_C_if_9}:rel + PC
                               #      | _E_if_9:
60 ff 00                       # 53bf |   mov H, 0
                               #      | _C_if_9:
                               #      | _Z_if_9:
                               #      | _cleanup_fn_tg_do_gravity_tick:
e4 20                          # 53c2 |   pop A
dc                             # 53c4 |   ret
                               #      | _end_fn_tg_do_gravity_tick:
                               #      | 
                               #      | fn_tg_soft_drop:
                               #      | _begin_fn_tg_soft_drop:
e0 20                          # 53c5 |   push A
                               #      | _A_call_23:
e0 00                          # 53c7 |   push 0
5c f8 4a 00                    # 53c9 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 53cd |   mov SP, SP + 0x2
                               #      | _Z_call_23:
46 e0 b8 6e                    # 53d1 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_24:
5c f8 ba 00                    # 53d5 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_24:
                               #      | _A_if_17:
ec ff 1c f8 01 19 00           # 53d9 |   jne H, 0x1, ${_E_if_17}:rel + PC
a9 20 e0 1c b2 6e 01           # 53e0 |   shl A, [${var__board__level}], 0x1
63 e0 e4 cc 6e 30 5e           # 53e7 |   mov [${var__board__ticks_till_gravity}], [${const__GRAVITY_LEVELS} + A]
58 f8 17 00                    # 53ee |   jmp ${_C_if_17}:rel + PC
                               #      | _E_if_17:
4a e0 b8 6e                    # 53f2 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_25:
e0 1c 01                       # 53f6 |   push 0x1
5c f8 1a 00                    # 53f9 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 53fd |   mov SP, SP + 0x2
                               #      | _Z_call_25:
                               #      | _A_call_26:
5c f8 fc fd                    # 5401 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_26:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _A_call_27:
e0 1c 01                       # 5405 |   push 0x1
5c f8 0b 00                    # 5408 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 540c |   mov SP, SP + 0x2
                               #      | _Z_call_27:
                               #      | _cleanup_fn_tg_soft_drop:
e4 20                          # 5410 |   pop A
dc                             # 5412 |   ret
                               #      | _end_fn_tg_soft_drop:
                               #      | 
                               #      | fn_tg_put:
                               #      | _begin_fn_tg_put:
e0 80                          # 5413 |   push D
e0 60                          # 5415 |   push C
e0 40                          # 5417 |   push B
e0 20                          # 5419 |   push A
60 20 e0 b4 6e                 # 541b |   mov A, ${var__board__falling}
c9 40 20                       # 5420 |   dec B, [A]
e8 40 1c f8 ff 63 00           # 5423 |   jeq B, -1, ${_cleanup_fn_tg_put}:rel + PC
a9 80 3c 1c 02 01              # 542a |   shl D, [A + 0x2], 0x1
60 80 53                       # 5430 |   mov D, B*8 + D
61 80 f0 f8 5d                 # 5433 |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 5438 |   inc A, B
                               #      | _A_for_4:
60 60 00                       # 543b |   mov C, 0
                               #      | _BA_for_4:
fc 60 1c f8 04 48 00           # 543e |   jge C, 0x4, ${_C_for_4}:rel + PC
a0 40 80 7e 02                 # 5445 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 544a |   shr E, D, C*4
2c 40 1c 03                    # 544e |   and B, 0x3
2c fc 1c 03                    # 5452 |   and E, 0x3
81 fe e0 40 b8 6e              # 5456 |   add G, [${var__board__falling} + 0004], B
81 40 e0 fc ba 6e              # 545c |   add B, [${var__board__falling} + 0006], E
88 fd 1c fe 0a                 # 5462 |   mul F, 0xa, G
00 fd e0 d2 6d                 # 5467 |   add F, ${var__board__board_state}
00 fd 40                       # 546c |   add F, B
                               #      | _A_if_11:
ee bc 00 f8 0a 0e 00           # 546f |   jne [SP + 0xa], 0, ${_E_if_11}:rel + PC
66 fd 00                       # 5476 |   bmov [F], 0
58 f8 07 00                    # 5479 |   jmp ${_C_if_11}:rel + PC
                               #      | _E_if_11:
66 fd 20                       # 547d |   bmov [F], A
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _BZ_for_4:
44 60                          # 5480 |   inc C
58 f8 bc ff                    # 5482 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_tg_put:
e4 20                          # 5486 |   pop A
e4 40                          # 5488 |   pop B
e4 60                          # 548a |   pop C
e4 80                          # 548c |   pop D
dc                             # 548e |   ret
                               #      | _end_fn_tg_put:
                               #      | 
                               #      | fn_tg_fits:
                               #      | _begin_fn_tg_fits:
e0 80                          # 548f |   push D
e0 60                          # 5491 |   push C
e0 40                          # 5493 |   push B
e0 20                          # 5495 |   push A
c9 40 e0 b4 6e                 # 5497 |   dec B, [${var__board__falling}]
a9 80 e0 1c b6 6e 01           # 549c |   shl D, [${var__board__falling} + 0002], 0x1
60 80 53                       # 54a3 |   mov D, B*8 + D
61 80 f0 f8 5d                 # 54a6 |   mov D, [${const__TETROMINOS} + D]
                               #      | _A_for_5:
60 60 00                       # 54ab |   mov C, 0
                               #      | _BA_for_5:
fc 60 1c f8 04 5f 00           # 54ae |   jge C, 0x4, ${_C_for_5}:rel + PC
a0 20 80 7e 02                 # 54b5 |   shr A, D, C*4 + 0x2
a0 fc 80 62                    # 54ba |   shr E, D, C*4
2c 20 1c 03                    # 54be |   and A, 0x3
2c fc 1c 03                    # 54c2 |   and E, 0x3
81 fe e0 20 b8 6e              # 54c6 |   add G, [${var__board__falling} + 0004], A
81 40 e0 fc ba 6e              # 54cc |   add B, [${var__board__falling} + 0006], E
                               #      |   # check if out of board area
60 ff 00                       # 54d2 |   mov H, 0
d0 fe 00                       # 54d5 |   icmp G, 0
70 f8 38 00                    # 54d8 |   jlt ${_cleanup_fn_tg_fits}:rel + PC
d0 40 00                       # 54dc |   icmp B, 0
70 f8 31 00                    # 54df |   jlt ${_cleanup_fn_tg_fits}:rel + PC
fc fe 1c f8 16 2d 00           # 54e3 |   jge G, 0x16, ${_cleanup_fn_tg_fits}:rel + PC
fc 40 1c f8 0a 26 00           # 54ea |   jge B, 0xa, ${_cleanup_fn_tg_fits}:rel + PC
                               #      |   # check if cell is occupied
88 fd fe 1c 0a                 # 54f1 |   mul F, G, 0xa
00 fd e8 d2 6d                 # 54f6 |   add F, ${var__board__board_state} + B
65 fd fd                       # 54fb |   bmov F, [F]
60 ff 00                       # 54fe |   mov H, 0
ec fd 00 f8 0f 00              # 5501 |   jne F, 0, ${_cleanup_fn_tg_fits}:rel + PC
                               #      | _BZ_for_5:
44 60                          # 5507 |   inc C
58 f8 a5 ff                    # 5509 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      |   # done checking, all good
c4 ff 00                       # 550d |   inc H, 0
                               #      | _cleanup_fn_tg_fits:
e4 20                          # 5510 |   pop A
e4 40                          # 5512 |   pop B
e4 60                          # 5514 |   pop C
e4 80                          # 5516 |   pop D
dc                             # 5518 |   ret
                               #      | _end_fn_tg_fits:
                               #      | 
                               #      | fn_tg_display:
                               #      | _begin_fn_tg_display:
                               #      | _A_call_38:
5c f8 05 00                    # 5519 |   call ${fn_display_board}:rel + PC
                               #      | _Z_call_38:
                               #      | _cleanup_fn_tg_display:
dc                             # 551d |   ret
                               #      | _end_fn_tg_display:
                               #      | 
                               #      | fn_display_board:
                               #      | _begin_fn_display_board:
e0 80                          # 551e |   push D
e0 60                          # 5520 |   push C
e0 40                          # 5522 |   push B
e0 20                          # 5524 |   push A
60 a0 bc fc                    # 5526 |   mov SP, SP + -4
62 a0 1c 15                    # 552a |   mov [SP], 0x15
                               #      | _A_for_6:
60 20 00                       # 552e |   mov A, 0
                               #      | _BA_for_6:
fc 20 1c f8 16 bb 01           # 5531 |   jge A, 0x16, ${_C_for_6}:rel + PC
62 bc 20 02                    # 5538 |   mov [SP + 0x2], A
60 fe 3c 02                    # 553c |   mov G, A + 0x2
                               #      | _A_call_30:
e0 fe                          # 5540 |   push G
5c f8 2c 02                    # 5542 |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 5546 |   mov SP, SP + 0x2
                               #      | _Z_call_30:
                               #      | _A_for_7:
e0 20                          # 554a |   push A
60 40 00                       # 554c |   mov B, 0
                               #      | _BA_for_7:
fc 40 1c f8 0a 95 01           # 554f |   jge B, 0xa, ${_C_for_7}:rel + PC
60 60 1c 0a                    # 5556 |   mov C, 0xa
60 fe 00                       # 555a |   mov G, 0
                               #      | _A_if_19:
ec 40 7c f8 ff 0c 00           # 555d |   jne B, C + -1, ${_E_if_19}:rel + PC
60 fe e0 00 80                 # 5564 |   mov G, 0x8000
                               #      | _E_if_19:
                               #      | _C_if_19:
                               #      | _Z_if_19:
                               #      | _A_if_20:
ec 40 00 f8 0a 00              # 5569 |   jne B, 0, ${_E_if_20}:rel + PC
30 fe 1c 01                    # 556f |   or G, 0x1
                               #      | _E_if_20:
                               #      | _C_if_20:
                               #      | _Z_if_20:
89 80 bc 60 04                 # 5573 |   mul D, [SP + 0x4], C
80 80 88 e0 d2 6d              # 5578 |   add D, D + B, ${var__board__board_state}
65 20 80                       # 557e |   bmov A, [D]
60 60 5c 06                    # 5581 |   mov C, B + 0x6
80 60 e0 61 d0 5e              # 5585 |   add C, ${var__VIDEO_PAGE_BUFFER}, C*2
                               #      | _A_if_21:
ec 20 00 f8 4f 00              # 558b |   jne A, 0, ${_E_if_21}:rel + PC
                               #      | _A_for_8:
60 80 00                       # 5591 |   mov D, 0
                               #      | _BA_for_8:
fc 80 e0 f8 00 0f 16 00        # 5594 |   jge D, 0xf00, ${_C_for_8}:rel + PC
b2 70 1c fe 01                 # 559c |   or [C + D], 0x1, G
                               #      | _BZ_for_8:
60 80 f0 a0 00                 # 55a1 |   mov D, 0xa0 + D
58 f8 ee ff                    # 55a6 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _A_for_9:
60 80 1c 50                    # 55aa |   mov D, 0x50
                               #      | _BA_for_9:
fc 80 e0 f8 00 0f 15 00        # 55ae |   jge D, 0xf00, ${_C_for_9}:rel + PC
b2 70 00 fe                    # 55b6 |   or [C + D], 0, G
                               #      | _BZ_for_9:
60 80 f0 a0 00                 # 55ba |   mov D, 0xa0 + D
58 f8 ef ff                    # 55bf |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
62 60 e0 55 55                 # 55c3 |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 55c8 |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 55cf |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 55d6 |   jmp ${_C_if_21}:rel + PC
                               #      | _E_if_21:
98 ff 20 00                    # 55da |   getb H, A, 0
                               #      | _A_if_22:
e8 ff 00 f8 0b 00              # 55de |   jeq H, 0, ${_E_if_22}:rel + PC
60 ff e0 ff 7f                 # 55e4 |   mov H, 0x7fff
                               #      | _E_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _A_for_10:
60 80 00                       # 55e9 |   mov D, 0
                               #      | _BA_for_10:
fc 80 e0 f8 b0 04 15 00        # 55ec |   jge D, 0x4b0, ${_C_for_10}:rel + PC
b2 70 ff fe                    # 55f4 |   or [C + D], H, G
                               #      | _BZ_for_10:
60 80 f0 a0 00                 # 55f8 |   mov D, 0xa0 + D
58 f8 ef ff                    # 55fd |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
                               #      | _A_for_11:
60 80 1c 50                    # 5601 |   mov D, 0x50
                               #      | _BA_for_11:
fc 80 e0 f8 b0 04 15 00        # 5605 |   jge D, 0x4b0, ${_C_for_11}:rel + PC
b2 70 ff fe                    # 560d |   or [C + D], H, G
                               #      | _BZ_for_11:
60 80 f0 a0 00                 # 5611 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5616 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
62 70 00                       # 561a |   mov [C + D], 0
98 ff 20 1c 01                 # 561d |   getb H, A, 0x1
                               #      | _A_if_23:
e8 ff 00 f8 0b 00              # 5622 |   jeq H, 0, ${_E_if_23}:rel + PC
60 ff e0 ff 7f                 # 5628 |   mov H, 0x7fff
                               #      | _E_if_23:
                               #      | _C_if_23:
                               #      | _Z_if_23:
                               #      | _A_for_12:
60 80 e0 00 05                 # 562d |   mov D, 0x500
                               #      | _BA_for_12:
fc 80 e0 f8 b0 09 15 00        # 5632 |   jge D, 0x9b0, ${_C_for_12}:rel + PC
b2 70 ff fe                    # 563a |   or [C + D], H, G
                               #      | _BZ_for_12:
60 80 f0 a0 00                 # 563e |   mov D, 0xa0 + D
58 f8 ef ff                    # 5643 |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _A_for_13:
60 80 e0 50 05                 # 5647 |   mov D, 0x550
                               #      | _BA_for_13:
fc 80 e0 f8 b0 09 15 00        # 564c |   jge D, 0x9b0, ${_C_for_13}:rel + PC
b2 70 ff fe                    # 5654 |   or [C + D], H, G
                               #      | _BZ_for_13:
60 80 f0 a0 00                 # 5658 |   mov D, 0xa0 + D
58 f8 ef ff                    # 565d |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
62 70 00                       # 5661 |   mov [C + D], 0
98 ff 20 1c 02                 # 5664 |   getb H, A, 0x2
                               #      | _A_if_24:
e8 ff 00 f8 0b 00              # 5669 |   jeq H, 0, ${_E_if_24}:rel + PC
60 ff e0 ff 7f                 # 566f |   mov H, 0x7fff
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
                               #      | _A_for_14:
60 80 e0 00 0a                 # 5674 |   mov D, 0xa00
                               #      | _BA_for_14:
fc 80 e0 f8 b0 0e 15 00        # 5679 |   jge D, 0xeb0, ${_C_for_14}:rel + PC
b2 70 ff fe                    # 5681 |   or [C + D], H, G
                               #      | _BZ_for_14:
60 80 f0 a0 00                 # 5685 |   mov D, 0xa0 + D
58 f8 ef ff                    # 568a |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
                               #      | _Z_for_14:
                               #      | _A_for_15:
60 80 e0 50 0a                 # 568e |   mov D, 0xa50
                               #      | _BA_for_15:
fc 80 e0 f8 b0 0e 15 00        # 5693 |   jge D, 0xeb0, ${_C_for_15}:rel + PC
b2 70 ff fe                    # 569b |   or [C + D], H, G
                               #      | _BZ_for_15:
60 80 f0 a0 00                 # 569f |   mov D, 0xa0 + D
58 f8 ef ff                    # 56a4 |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
62 70 00                       # 56a8 |   mov [C + D], 0
                               #      | _C_if_21:
                               #      | _Z_if_21:
61 20 bc 04                    # 56ab |   mov A, [SP + 0x4]
                               #      | _A_if_25:
ed 20 bc f8 02 19 00           # 56af |   jne A, [SP + 0x2], ${_E_if_25}:rel + PC
62 ec 1c b0 04 ff              # 56b6 |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 56bc |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 56c2 |   mov [0xeb0 + C], -1
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
                               #      | _A_if_26:
ec 20 00 f8 16 00              # 56c8 |   jne A, 0, ${_E_if_26}:rel + PC
62 60 1c ff                    # 56ce |   mov [C], -1
62 ec 1c 00 05 ff              # 56d2 |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 56d8 |   mov [0xa00 + C], -1
                               #      | _E_if_26:
                               #      | _C_if_26:
                               #      | _Z_if_26:
                               #      | _BZ_for_7:
44 40                          # 56de |   inc B
58 f8 6f fe                    # 56e0 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
e4 20                          # 56e4 |   pop A
                               #      | _Z_for_7:
                               #      | _BZ_for_6:
44 20                          # 56e6 |   inc A
58 f8 49 fe                    # 56e8 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_31:
e0 1c 08                       # 56ec |   push 0x8
e0 00                          # 56ef |   push 0
e0 e0 d0 6e                    # 56f1 |   push ${var__var_1}
5c f8 c8 fa                    # 56f5 |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 56f9 |   mov SP, SP + 0x6
                               #      | _Z_call_31:
                               #      | _A_call_32:
e0 1c 01                       # 56fd |   push 0x1
e0 00                          # 5700 |   push 0
e0 00                          # 5702 |   push 0
e0 1c 04                       # 5704 |   push 0x4
e0 e0 bc 6e                    # 5707 |   push ${var__board__next}
e0 e0 d0 6e                    # 570b |   push ${var__var_1}
5c f8 99 00                    # 570f |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 5713 |   mov SP, SP + 0xc
                               #      | _Z_call_32:
                               #      | _A_call_34:
e0 1c 08                       # 5717 |   push 0x8
5c f8 06 01                    # 571a |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 571e |   mov SP, SP + 0x2
                               #      | _Z_call_34:
                               #      | _A_call_35:
e0 1c 08                       # 5722 |   push 0x8
e0 00                          # 5725 |   push 0
e0 e0 d0 6e                    # 5727 |   push ${var__var_1}
5c f8 92 fa                    # 572b |   call ${fn_memset}:rel + PC
60 a0 bc 06                    # 572f |   mov SP, SP + 0x6
                               #      | _Z_call_35:
                               #      | _A_if_37:
ea e0 1c f8 c4 6e ff 23 00     # 5733 |   jeq [${var__board__stored}], -1, ${_E_if_37}:rel + PC
                               #      | _A_call_36:
e0 1c 01                       # 573c |   push 0x1
e0 00                          # 573f |   push 0
e0 00                          # 5741 |   push 0
e0 1c 04                       # 5743 |   push 0x4
e0 e0 c4 6e                    # 5746 |   push ${var__board__stored}
e0 e0 d0 6e                    # 574a |   push ${var__var_1}
5c f8 5a 00                    # 574e |   call ${fn_tg_put_generic}:rel + PC
60 a0 bc 0c                    # 5752 |   mov SP, SP + 0xc
                               #      | _Z_call_36:
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _A_call_37:
e0 1c 0c                       # 5756 |   push 0xc
5c f8 c7 00                    # 5759 |   call ${fn_draw_small_board}:rel + PC
60 a0 bc 02                    # 575d |   mov SP, SP + 0x2
                               #      | _Z_call_37:
                               #      | _cleanup_fn_display_board:
60 a0 bc 04                    # 5761 |   mov SP, SP + 0x4
e4 20                          # 5765 |   pop A
e4 40                          # 5767 |   pop B
e4 60                          # 5769 |   pop C
e4 80                          # 576b |   pop D
dc                             # 576d |   ret
                               #      | _end_fn_display_board:
                               #      | 
                               #      | fn_switch_screen_page_rgb:
                               #      | _begin_fn_switch_screen_page_rgb:
e0 40                          # 576e |   push B
e0 20                          # 5770 |   push A
60 20 e0 a1 00                 # 5772 |   mov A, 0xa1
89 40 bc e0 06 00 05           # 5777 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c d0 5e cf 63 04     # 577e |   mmap ${var__VIDEO_PAGE_BUFFER}, ${var__VIDEO_PAGE_BUFFER} + 04ff, 0x4
60 20 e0 a2 00                 # 5787 |   mov A, 0xa2
54 e0 e0 1c d0 63 cf 68 05     # 578c |   mmap ${var__VIDEO_PAGE_BUFFER} + 0500, ${var__VIDEO_PAGE_BUFFER} + 09ff, 0x5
60 20 e0 a4 00                 # 5795 |   mov A, 0xa4
54 e0 e0 1c d0 68 cf 6d 06     # 579a |   mmap ${var__VIDEO_PAGE_BUFFER} + 0a00, ${var__VIDEO_PAGE_BUFFER} + 0eff, 0x6
                               #      | _cleanup_fn_switch_screen_page_rgb:
e4 20                          # 57a3 |   pop A
e4 40                          # 57a5 |   pop B
dc                             # 57a7 |   ret
                               #      | _end_fn_switch_screen_page_rgb:
                               #      | 
                               #      | fn_tg_put_generic:
                               #      | _begin_fn_tg_put_generic:
e0 80                          # 57a8 |   push D
e0 60                          # 57aa |   push C
e0 40                          # 57ac |   push B
e0 20                          # 57ae |   push A
61 20 bc 0c                    # 57b0 |   mov A, [SP + 0xc]
c9 40 20                       # 57b4 |   dec B, [A]
e8 40 1c f8 ff 60 00           # 57b7 |   jeq B, -1, ${_cleanup_fn_tg_put_generic}:rel + PC
a9 80 3c 1c 02 01              # 57be |   shl D, [A + 0x2], 0x1
60 80 53                       # 57c4 |   mov D, B*8 + D
61 80 f0 f8 5d                 # 57c7 |   mov D, [${const__TETROMINOS} + D]
c4 20 40                       # 57cc |   inc A, B
                               #      | _A_for_16:
60 60 00                       # 57cf |   mov C, 0
                               #      | _BA_for_16:
fc 60 1c f8 04 45 00           # 57d2 |   jge C, 0x4, ${_C_for_16}:rel + PC
a0 40 80 7e 02                 # 57d9 |   shr B, D, C*4 + 0x2
a0 fc 80 62                    # 57de |   shr E, D, C*4
2c 40 1c 03                    # 57e2 |   and B, 0x3
2c fc 1c 03                    # 57e6 |   and E, 0x3
81 fe bc 40 10                 # 57ea |   add G, [SP + 0x10], B
81 40 bc fc 12                 # 57ef |   add B, [SP + 0x12], E
89 fd bc fe 0e                 # 57f4 |   mul F, [SP + 0xe], G
01 fd bc 0a                    # 57f9 |   add F, [SP + 0xa]
00 fd 40                       # 57fd |   add F, B
                               #      | _A_if_28:
ee bc 00 f8 14 0e 00           # 5800 |   jne [SP + 0x14], 0, ${_E_if_28}:rel + PC
66 fd 00                       # 5807 |   bmov [F], 0
58 f8 07 00                    # 580a |   jmp ${_C_if_28}:rel + PC
                               #      | _E_if_28:
66 fd 20                       # 580e |   bmov [F], A
                               #      | _C_if_28:
                               #      | _Z_if_28:
                               #      | _BZ_for_16:
44 60                          # 5811 |   inc C
58 f8 bf ff                    # 5813 |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
                               #      | _Z_for_16:
                               #      | _cleanup_fn_tg_put_generic:
e4 20                          # 5817 |   pop A
e4 40                          # 5819 |   pop B
e4 60                          # 581b |   pop C
e4 80                          # 581d |   pop D
dc                             # 581f |   ret
                               #      | _end_fn_tg_put_generic:
                               #      | 
                               #      | fn_draw_small_board:
                               #      | _begin_fn_draw_small_board:
e0 80                          # 5820 |   push D
e0 60                          # 5822 |   push C
e0 40                          # 5824 |   push B
e0 20                          # 5826 |   push A
60 a0 bc fc                    # 5828 |   mov SP, SP + -4
c6 a0 00                       # 582c |   inc [SP], 0
                               #      | _A_for_17:
60 20 00                       # 582f |   mov A, 0
                               #      | _BA_for_17:
fc 20 1c f8 02 bc 01           # 5832 |   jge A, 0x2, ${_C_for_17}:rel + PC
62 bc 20 02                    # 5839 |   mov [SP + 0x2], A
81 fe bc 20 0e                 # 583d |   add G, [SP + 0xe], A
                               #      | _A_call_33:
e0 fe                          # 5842 |   push G
5c f8 2a ff                    # 5844 |   call ${fn_switch_screen_page_rgb}:rel + PC
60 a0 bc 02                    # 5848 |   mov SP, SP + 0x2
                               #      | _Z_call_33:
                               #      | _A_for_18:
e0 20                          # 584c |   push A
60 40 00                       # 584e |   mov B, 0
                               #      | _BA_for_18:
fc 40 1c f8 04 95 01           # 5851 |   jge B, 0x4, ${_C_for_18}:rel + PC
60 60 1c 04                    # 5858 |   mov C, 0x4
60 fe 00                       # 585c |   mov G, 0
                               #      | _A_if_29:
ec 40 7c f8 ff 0c 00           # 585f |   jne B, C + -1, ${_E_if_29}:rel + PC
60 fe e0 00 80                 # 5866 |   mov G, 0x8000
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _A_if_30:
ec 40 00 f8 0a 00              # 586b |   jne B, 0, ${_E_if_30}:rel + PC
30 fe 1c 01                    # 5871 |   or G, 0x1
                               #      | _E_if_30:
                               #      | _C_if_30:
                               #      | _Z_if_30:
89 80 bc 60 04                 # 5875 |   mul D, [SP + 0x4], C
80 80 88 e0 d0 6e              # 587a |   add D, D + B, ${var__var_1}
65 20 80                       # 5880 |   bmov A, [D]
60 60 5c 12                    # 5883 |   mov C, B + 0x12
80 60 e0 61 d0 5e              # 5887 |   add C, ${var__VIDEO_PAGE_BUFFER}, C*2
                               #      | _A_if_31:
ec 20 00 f8 4f 00              # 588d |   jne A, 0, ${_E_if_31}:rel + PC
                               #      | _A_for_19:
60 80 00                       # 5893 |   mov D, 0
                               #      | _BA_for_19:
fc 80 e0 f8 00 0f 16 00        # 5896 |   jge D, 0xf00, ${_C_for_19}:rel + PC
b2 70 1c fe 01                 # 589e |   or [C + D], 0x1, G
                               #      | _BZ_for_19:
60 80 f0 a0 00                 # 58a3 |   mov D, 0xa0 + D
58 f8 ee ff                    # 58a8 |   jmp ${_BA_for_19}:rel + PC
                               #      | _C_for_19:
                               #      | _Z_for_19:
                               #      | _A_for_20:
60 80 1c 50                    # 58ac |   mov D, 0x50
                               #      | _BA_for_20:
fc 80 e0 f8 00 0f 15 00        # 58b0 |   jge D, 0xf00, ${_C_for_20}:rel + PC
b2 70 00 fe                    # 58b8 |   or [C + D], 0, G
                               #      | _BZ_for_20:
60 80 f0 a0 00                 # 58bc |   mov D, 0xa0 + D
58 f8 ef ff                    # 58c1 |   jmp ${_BA_for_20}:rel + PC
                               #      | _C_for_20:
                               #      | _Z_for_20:
62 60 e0 55 55                 # 58c5 |   mov [C], 0x5555
62 ec e0 00 05 55 55           # 58ca |   mov [0x500 + C], 0x5555
62 ec e0 00 0a 55 55           # 58d1 |   mov [0xa00 + C], 0x5555
58 f8 d5 00                    # 58d8 |   jmp ${_C_if_31}:rel + PC
                               #      | _E_if_31:
98 ff 20 00                    # 58dc |   getb H, A, 0
                               #      | _A_if_32:
e8 ff 00 f8 0b 00              # 58e0 |   jeq H, 0, ${_E_if_32}:rel + PC
60 ff e0 ff 7f                 # 58e6 |   mov H, 0x7fff
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _A_for_21:
60 80 00                       # 58eb |   mov D, 0
                               #      | _BA_for_21:
fc 80 e0 f8 b0 04 15 00        # 58ee |   jge D, 0x4b0, ${_C_for_21}:rel + PC
b2 70 ff fe                    # 58f6 |   or [C + D], H, G
                               #      | _BZ_for_21:
60 80 f0 a0 00                 # 58fa |   mov D, 0xa0 + D
58 f8 ef ff                    # 58ff |   jmp ${_BA_for_21}:rel + PC
                               #      | _C_for_21:
                               #      | _Z_for_21:
                               #      | _A_for_22:
60 80 1c 50                    # 5903 |   mov D, 0x50
                               #      | _BA_for_22:
fc 80 e0 f8 b0 04 15 00        # 5907 |   jge D, 0x4b0, ${_C_for_22}:rel + PC
b2 70 ff fe                    # 590f |   or [C + D], H, G
                               #      | _BZ_for_22:
60 80 f0 a0 00                 # 5913 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5918 |   jmp ${_BA_for_22}:rel + PC
                               #      | _C_for_22:
                               #      | _Z_for_22:
62 70 00                       # 591c |   mov [C + D], 0
98 ff 20 1c 01                 # 591f |   getb H, A, 0x1
                               #      | _A_if_33:
e8 ff 00 f8 0b 00              # 5924 |   jeq H, 0, ${_E_if_33}:rel + PC
60 ff e0 ff 7f                 # 592a |   mov H, 0x7fff
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _A_for_23:
60 80 e0 00 05                 # 592f |   mov D, 0x500
                               #      | _BA_for_23:
fc 80 e0 f8 b0 09 15 00        # 5934 |   jge D, 0x9b0, ${_C_for_23}:rel + PC
b2 70 ff fe                    # 593c |   or [C + D], H, G
                               #      | _BZ_for_23:
60 80 f0 a0 00                 # 5940 |   mov D, 0xa0 + D
58 f8 ef ff                    # 5945 |   jmp ${_BA_for_23}:rel + PC
                               #      | _C_for_23:
                               #      | _Z_for_23:
                               #      | _A_for_24:
60 80 e0 50 05                 # 5949 |   mov D, 0x550
                               #      | _BA_for_24:
fc 80 e0 f8 b0 09 15 00        # 594e |   jge D, 0x9b0, ${_C_for_24}:rel + PC
b2 70 ff fe                    # 5956 |   or [C + D], H, G
                               #      | _BZ_for_24:
60 80 f0 a0 00                 # 595a |   mov D, 0xa0 + D
58 f8 ef ff                    # 595f |   jmp ${_BA_for_24}:rel + PC
                               #      | _C_for_24:
                               #      | _Z_for_24:
62 70 00                       # 5963 |   mov [C + D], 0
98 ff 20 1c 02                 # 5966 |   getb H, A, 0x2
                               #      | _A_if_34:
e8 ff 00 f8 0b 00              # 596b |   jeq H, 0, ${_E_if_34}:rel + PC
60 ff e0 ff 7f                 # 5971 |   mov H, 0x7fff
                               #      | _E_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
                               #      | _A_for_25:
60 80 e0 00 0a                 # 5976 |   mov D, 0xa00
                               #      | _BA_for_25:
fc 80 e0 f8 b0 0e 15 00        # 597b |   jge D, 0xeb0, ${_C_for_25}:rel + PC
b2 70 ff fe                    # 5983 |   or [C + D], H, G
                               #      | _BZ_for_25:
60 80 f0 a0 00                 # 5987 |   mov D, 0xa0 + D
58 f8 ef ff                    # 598c |   jmp ${_BA_for_25}:rel + PC
                               #      | _C_for_25:
                               #      | _Z_for_25:
                               #      | _A_for_26:
60 80 e0 50 0a                 # 5990 |   mov D, 0xa50
                               #      | _BA_for_26:
fc 80 e0 f8 b0 0e 15 00        # 5995 |   jge D, 0xeb0, ${_C_for_26}:rel + PC
b2 70 ff fe                    # 599d |   or [C + D], H, G
                               #      | _BZ_for_26:
60 80 f0 a0 00                 # 59a1 |   mov D, 0xa0 + D
58 f8 ef ff                    # 59a6 |   jmp ${_BA_for_26}:rel + PC
                               #      | _C_for_26:
                               #      | _Z_for_26:
62 70 00                       # 59aa |   mov [C + D], 0
                               #      | _C_if_31:
                               #      | _Z_if_31:
61 20 bc 04                    # 59ad |   mov A, [SP + 0x4]
                               #      | _A_if_35:
ed 20 bc f8 02 19 00           # 59b1 |   jne A, [SP + 0x2], ${_E_if_35}:rel + PC
62 ec 1c b0 04 ff              # 59b8 |   mov [0x4b0 + C], -1
62 ec 1c b0 09 ff              # 59be |   mov [0x9b0 + C], -1
62 ec 1c b0 0e ff              # 59c4 |   mov [0xeb0 + C], -1
                               #      | _E_if_35:
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _A_if_36:
ec 20 00 f8 16 00              # 59ca |   jne A, 0, ${_E_if_36}:rel + PC
62 60 1c ff                    # 59d0 |   mov [C], -1
62 ec 1c 00 05 ff              # 59d4 |   mov [0x500 + C], -1
62 ec 1c 00 0a ff              # 59da |   mov [0xa00 + C], -1
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _BZ_for_18:
44 40                          # 59e0 |   inc B
58 f8 6f fe                    # 59e2 |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
e4 20                          # 59e6 |   pop A
                               #      | _Z_for_18:
                               #      | _BZ_for_17:
44 20                          # 59e8 |   inc A
58 f8 48 fe                    # 59ea |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
                               #      | _Z_for_17:
                               #      | _cleanup_fn_draw_small_board:
60 a0 bc 04                    # 59ee |   mov SP, SP + 0x4
e4 20                          # 59f2 |   pop A
e4 40                          # 59f4 |   pop B
e4 60                          # 59f6 |   pop C
e4 80                          # 59f8 |   pop D
dc                             # 59fa |   ret
                               #      | _end_fn_draw_small_board:
                               #      | 
                               #      | fn_tg_check_lines:
                               #      | _begin_fn_tg_check_lines:
60 ff 00                       # 59fb |   mov H, 0
                               #      | _cleanup_fn_tg_check_lines:
dc                             # 59fe |   ret
                               #      | _end_fn_tg_check_lines:
                               #      | 
                               #      | fn_tg_adjust_score:
                               #      | _begin_fn_tg_adjust_score:
                               #      | _cleanup_fn_tg_adjust_score:
dc                             # 59ff |   ret
                               #      | _end_fn_tg_adjust_score:
                               #      | 
                               #      | fn_tg_game_over:
                               #      | _begin_fn_tg_game_over:
e0 80                          # 5a00 |   push D
e0 60                          # 5a02 |   push C
e0 40                          # 5a04 |   push B
e0 20                          # 5a06 |   push A
60 60 00                       # 5a08 |   mov C, 0
                               #      | _A_call_42:
e0 00                          # 5a0b |   push 0
5c f8 06 fa                    # 5a0d |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5a11 |   mov SP, SP + 0x2
                               #      | _Z_call_42:
                               #      | _A_for_27:
60 20 00                       # 5a15 |   mov A, 0
                               #      | _BA_for_27:
fc 20 1c f8 02 37 00           # 5a18 |   jge A, 0x2, ${_C_for_27}:rel + PC
                               #      | _A_for_28:
60 40 00                       # 5a1f |   mov B, 0
                               #      | _BA_for_28:
fc 40 1c f8 0a 27 00           # 5a22 |   jge B, 0xa, ${_C_for_28}:rel + PC
88 80 20 1c 0a                 # 5a29 |   mul D, A, 0xa
00 80 e8 d2 6d                 # 5a2e |   add D, ${var__board__board_state} + B
65 ff 80                       # 5a33 |   bmov H, [D]
                               #      | _A_if_38:
e8 ff 00 f8 0d 00              # 5a36 |   jeq H, 0, ${_E_if_38}:rel + PC
c4 60 00                       # 5a3c |   inc C, 0
58 f8 10 00                    # 5a3f |   jmp ${_C_for_27}:rel + PC
                               #      | _E_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
                               #      | _BZ_for_28:
44 40                          # 5a43 |   inc B
58 f8 dd ff                    # 5a45 |   jmp ${_BA_for_28}:rel + PC
                               #      | _C_for_28:
                               #      | _Z_for_28:
                               #      | _BZ_for_27:
44 20                          # 5a49 |   inc A
58 f8 cd ff                    # 5a4b |   jmp ${_BA_for_27}:rel + PC
                               #      | _C_for_27:
                               #      | _Z_for_27:
                               #      | _A_call_43:
e0 1c 01                       # 5a4f |   push 0x1
5c f8 c1 f9                    # 5a52 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5a56 |   mov SP, SP + 0x2
                               #      | _Z_call_43:
60 ff 60                       # 5a5a |   mov H, C
                               #      | _cleanup_fn_tg_game_over:
e4 20                          # 5a5d |   pop A
e4 40                          # 5a5f |   pop B
e4 60                          # 5a61 |   pop C
e4 80                          # 5a63 |   pop D
dc                             # 5a65 |   ret
                               #      | _end_fn_tg_game_over:
                               #      | 
                               #      | fn_handle_keyboard:
                               #      | _begin_fn_handle_keyboard:
e0 20                          # 5a66 |   push A
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 fe e0 06 ff                 # 5a68 |   mov G, [0xff06]
ac ff fe e0 00 80              # 5a6d |   and H, G, 0x8000
e8 ff 00 f8 ba 00              # 5a73 |   jeq H, 0, ${_C_loop_3}:rel + PC
a9 ff e0 1c dc 6e 08           # 5a79 |   shl H, [${var__handle_keyboard__scan_code}], 0x8
2c fe e0 ff 00                 # 5a80 |   and G, 0xff
30 ff fe                       # 5a85 |   or H, G
62 e0 ff dc 6e                 # 5a88 |   mov [${var__handle_keyboard__scan_code}], H
a0 fe ff 1c 08                 # 5a8d |   shr G, H, 0x8
2c ff e0 ff 00                 # 5a92 |   and H, 0xff
e8 fe e0 f8 f0 00 d1 ff        # 5a97 |   jeq G, 0xf0, ${_BA_loop_3}:rel + PC
60 fe 00                       # 5a9f |   mov G, 0
                               #      | _A_if_42:
ec ff 1c f8 75 0f 00           # 5aa2 |   jne H, 0x75, ${_E_if_42}:rel + PC
60 fe 1c 03                    # 5aa9 |   mov G, 0x3
58 f8 68 00                    # 5aad |   jmp ${_C_if_42}:rel + PC
                               #      | _E_if_42:
ec ff 1c f8 74 0f 00           # 5ab1 |   jne H, 0x74, ${_E2_if_42}:rel + PC
60 fe 1c 02                    # 5ab8 |   mov G, 0x2
58 f8 59 00                    # 5abc |   jmp ${_C_if_42}:rel + PC
                               #      | _E2_if_42:
ec ff 1c f8 6b 0e 00           # 5ac0 |   jne H, 0x6b, ${_E3_if_42}:rel + PC
c4 fe 00                       # 5ac7 |   inc G, 0
58 f8 4b 00                    # 5aca |   jmp ${_C_if_42}:rel + PC
                               #      | _E3_if_42:
ec ff 1c f8 72 0f 00           # 5ace |   jne H, 0x72, ${_E4_if_42}:rel + PC
60 fe 1c 06                    # 5ad5 |   mov G, 0x6
58 f8 3c 00                    # 5ad9 |   jmp ${_C_if_42}:rel + PC
                               #      | _E4_if_42:
ec ff 1c f8 21 0f 00           # 5add |   jne H, 0x21, ${_E5_if_42}:rel + PC
60 fe 1c 07                    # 5ae4 |   mov G, 0x7
58 f8 2d 00                    # 5ae8 |   jmp ${_C_if_42}:rel + PC
                               #      | _E5_if_42:
ec ff 1c f8 1a 0f 00           # 5aec |   jne H, 0x1a, ${_E6_if_42}:rel + PC
60 fe 1c 04                    # 5af3 |   mov G, 0x4
58 f8 1e 00                    # 5af7 |   jmp ${_C_if_42}:rel + PC
                               #      | _E6_if_42:
ec ff 1c f8 22 0f 00           # 5afb |   jne H, 0x22, ${_E7_if_42}:rel + PC
60 fe 1c 03                    # 5b02 |   mov G, 0x3
58 f8 0f 00                    # 5b06 |   jmp ${_C_if_42}:rel + PC
                               #      | _E7_if_42:
ec ff 1c f8 29 0b 00           # 5b0a |   jne H, 0x29, ${_E8_if_42}:rel + PC
60 fe 1c 05                    # 5b11 |   mov G, 0x5
                               #      | _E8_if_42:
                               #      | _C_if_42:
                               #      | _Z_if_42:
                               #      | _A_if_43:
e8 fe 00 f8 14 00              # 5b15 |   jeq G, 0, ${_E_if_43}:rel + PC
                               #      | _A_call_70:
e0 fe                          # 5b1b |   push G
5c f8 86 00                    # 5b1d |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5b21 |   mov SP, SP + 0x2
                               #      | _Z_call_70:
                               #      | _A_call_71:
5c f8 f4 f9                    # 5b25 |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_71:
                               #      | _E_if_43:
                               #      | _C_if_43:
                               #      | _Z_if_43:
                               #      | _BZ_loop_3:
58 f8 3f ff                    # 5b29 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
61 ff e0 0e ff                 # 5b2d |   mov H, [0xff0e]
                               #      | _A_if_52:
e9 ff e0 f8 da 6e 6e 00        # 5b32 |   jeq H, [${var__last_btn_in}], ${_E_if_52}:rel + PC
62 e0 ff da 6e                 # 5b3a |   mov [${var__last_btn_in}], H
60 fe 00                       # 5b3f |   mov G, 0
98 20 ff 1c 0c                 # 5b42 |   getb A, H, 0xc
                               #      | _A_if_53:
e8 20 00 f8 0a 00              # 5b47 |   jeq A, 0, ${_E_if_53}:rel + PC
60 fe 1c 03                    # 5b4d |   mov G, 0x3
                               #      | _E_if_53:
                               #      | _C_if_53:
                               #      | _Z_if_53:
98 20 ff 1c 0b                 # 5b51 |   getb A, H, 0xb
                               #      | _A_if_54:
e8 20 00 f8 0a 00              # 5b56 |   jeq A, 0, ${_E_if_54}:rel + PC
60 fe 1c 02                    # 5b5c |   mov G, 0x2
                               #      | _E_if_54:
                               #      | _C_if_54:
                               #      | _Z_if_54:
98 20 ff 1c 0a                 # 5b60 |   getb A, H, 0xa
                               #      | _A_if_55:
e8 20 00 f8 09 00              # 5b65 |   jeq A, 0, ${_E_if_55}:rel + PC
c4 fe 00                       # 5b6b |   inc G, 0
                               #      | _E_if_55:
                               #      | _C_if_55:
                               #      | _Z_if_55:
98 20 ff 1c 09                 # 5b6e |   getb A, H, 0x9
                               #      | _A_if_56:
e8 20 00 f8 0a 00              # 5b73 |   jeq A, 0, ${_E_if_56}:rel + PC
60 fe 1c 05                    # 5b79 |   mov G, 0x5
                               #      | _E_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
98 20 ff 1c 08                 # 5b7d |   getb A, H, 0x8
                               #      | _A_if_57:
e8 20 00 f8 0a 00              # 5b82 |   jeq A, 0, ${_E_if_57}:rel + PC
60 fe 1c 07                    # 5b88 |   mov G, 0x7
                               #      | _E_if_57:
                               #      | _C_if_57:
                               #      | _Z_if_57:
                               #      | _A_if_58:
e8 fe 00 f8 14 00              # 5b8c |   jeq G, 0, ${_E_if_58}:rel + PC
                               #      | _A_call_72:
e0 fe                          # 5b92 |   push G
5c f8 0f 00                    # 5b94 |   call ${fn_tg_handle_move}:rel + PC
60 a0 bc 02                    # 5b98 |   mov SP, SP + 0x2
                               #      | _Z_call_72:
                               #      | _A_call_73:
5c f8 7d f9                    # 5b9c |   call ${fn_tg_display}:rel + PC
                               #      | _Z_call_73:
                               #      | _E_if_58:
                               #      | _C_if_58:
                               #      | _Z_if_58:
                               #      | _E_if_52:
                               #      | _C_if_52:
                               #      | _Z_if_52:
                               #      | _cleanup_fn_handle_keyboard:
e4 20                          # 5ba0 |   pop A
dc                             # 5ba2 |   ret
                               #      | _end_fn_handle_keyboard:
                               #      | 
                               #      | fn_tg_handle_move:
                               #      | _begin_fn_tg_handle_move:
e0 20                          # 5ba3 |   push A
61 20 bc 04                    # 5ba5 |   mov A, [SP + 0x4]
                               #      | _A_if_44:
ec 20 1c f8 01 16 00           # 5ba9 |   jne A, 0x1, ${_E_if_44}:rel + PC
                               #      | _A_call_49:
e0 1c ff                       # 5bb0 |   push -1
5c f8 7a 00                    # 5bb3 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5bb7 |   mov SP, SP + 0x2
                               #      | _Z_call_49:
58 f8 6f 00                    # 5bbb |   jmp ${_C_if_44}:rel + PC
                               #      | _E_if_44:
ec 20 1c f8 02 16 00           # 5bbf |   jne A, 0x2, ${_E2_if_44}:rel + PC
                               #      | _A_call_50:
e0 1c 01                       # 5bc6 |   push 0x1
5c f8 64 00                    # 5bc9 |   call ${fn_tg_move}:rel + PC
60 a0 bc 02                    # 5bcd |   mov SP, SP + 0x2
                               #      | _Z_call_50:
58 f8 59 00                    # 5bd1 |   jmp ${_C_if_44}:rel + PC
                               #      | _E2_if_44:
ec 20 1c f8 05 0f 00           # 5bd5 |   jne A, 0x5, ${_E3_if_44}:rel + PC
                               #      | _A_call_55:
5c f8 7d 00                    # 5bdc |   call ${fn_tg_down}:rel + PC
                               #      | _Z_call_55:
58 f8 4a 00                    # 5be0 |   jmp ${_C_if_44}:rel + PC
                               #      | _E3_if_44:
ec 20 1c f8 03 16 00           # 5be4 |   jne A, 0x3, ${_E4_if_44}:rel + PC
                               #      | _A_call_61:
e0 1c 01                       # 5beb |   push 0x1
5c f8 9b 00                    # 5bee |   call ${fn_tg_rotate}:rel + PC
60 a0 bc 02                    # 5bf2 |   mov SP, SP + 0x2
                               #      | _Z_call_61:
58 f8 34 00                    # 5bf6 |   jmp ${_C_if_44}:rel + PC
                               #      | _E4_if_44:
ec 20 1c f8 04 16 00           # 5bfa |   jne A, 0x4, ${_E5_if_44}:rel + PC
                               #      | _A_call_62:
e0 1c ff                       # 5c01 |   push -1
5c f8 85 00                    # 5c04 |   call ${fn_tg_rotate}:rel + PC
60 a0 bc 02                    # 5c08 |   mov SP, SP + 0x2
                               #      | _Z_call_62:
58 f8 1e 00                    # 5c0c |   jmp ${_C_if_44}:rel + PC
                               #      | _E5_if_44:
ec 20 1c f8 07 0f 00           # 5c10 |   jne A, 0x7, ${_E6_if_44}:rel + PC
                               #      | _A_call_68:
5c f8 cc 00                    # 5c17 |   call ${fn_tg_hold}:rel + PC
                               #      | _Z_call_68:
58 f8 0f 00                    # 5c1b |   jmp ${_C_if_44}:rel + PC
                               #      | _E6_if_44:
ec 20 1c f8 06 0b 00           # 5c1f |   jne A, 0x6, ${_E7_if_44}:rel + PC
                               #      | _A_call_69:
5c f8 9f f7                    # 5c26 |   call ${fn_tg_soft_drop}:rel + PC
                               #      | _Z_call_69:
                               #      | _E7_if_44:
                               #      | _C_if_44:
                               #      | _Z_if_44:
                               #      | _cleanup_fn_tg_handle_move:
e4 20                          # 5c2a |   pop A
dc                             # 5c2c |   ret
                               #      | _end_fn_tg_handle_move:
                               #      | 
                               #      | fn_tg_move:
                               #      | _begin_fn_tg_move:
                               #      | _A_call_46:
e0 00                          # 5c2d |   push 0
5c f8 e4 f7                    # 5c2f |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5c33 |   mov SP, SP + 0x2
                               #      | _Z_call_46:
03 e0 bc ba 6e 02              # 5c37 |   add [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _A_call_47:
5c f8 52 f8                    # 5c3d |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_47:
                               #      | _A_if_45:
ec ff 00 f8 0c 00              # 5c41 |   jne H, 0, ${_E_if_45}:rel + PC
07 e0 bc ba 6e 02              # 5c47 |   sub [${var__board__falling} + 0006], [SP + 0x2]
                               #      | _E_if_45:
                               #      | _C_if_45:
                               #      | _Z_if_45:
                               #      | _A_call_48:
e0 1c 01                       # 5c4d |   push 0x1
5c f8 c3 f7                    # 5c50 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5c54 |   mov SP, SP + 0x2
                               #      | _Z_call_48:
                               #      | _cleanup_fn_tg_move:
dc                             # 5c58 |   ret
                               #      | _end_fn_tg_move:
                               #      | 
                               #      | fn_tg_down:
                               #      | _begin_fn_tg_down:
                               #      | _A_call_51:
e0 00                          # 5c59 |   push 0
5c f8 b8 f7                    # 5c5b |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5c5f |   mov SP, SP + 0x2
                               #      | _Z_call_51:
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
46 e0 b8 6e                    # 5c63 |   inc [${var__board__falling} + 0004]
                               #      | _A_call_52:
5c f8 28 f8                    # 5c67 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_52:
e8 ff 00 f8 0a 00              # 5c6b |   jeq H, 0, ${_C_loop_4}:rel + PC
                               #      | _BZ_loop_4:
58 f8 f2 ff                    # 5c71 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
4a e0 b8 6e                    # 5c75 |   dec [${var__board__falling} + 0004]
                               #      | _A_call_53:
e0 1c 01                       # 5c79 |   push 0x1
5c f8 97 f7                    # 5c7c |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5c80 |   mov SP, SP + 0x2
                               #      | _Z_call_53:
                               #      | _A_call_54:
5c f8 79 f5                    # 5c84 |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_54:
                               #      | _cleanup_fn_tg_down:
dc                             # 5c88 |   ret
                               #      | _end_fn_tg_down:
                               #      | 
                               #      | fn_tg_rotate:
                               #      | _begin_fn_tg_rotate:
                               #      | _A_call_56:
e0 00                          # 5c89 |   push 0
5c f8 88 f7                    # 5c8b |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5c8f |   mov SP, SP + 0x2
                               #      | _Z_call_56:
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
81 ff e0 1c b6 6e 04           # 5c93 |   add H, [${var__board__falling} + 0002], 0x4
01 ff bc 02                    # 5c9a |   add H, [SP + 0x2]
2c ff 1c 03                    # 5c9e |   and H, 0x3
62 e0 ff b6 6e                 # 5ca2 |   mov [${var__board__falling} + 0002], H
                               #      | _A_call_57:
5c f8 e8 f7                    # 5ca7 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_57:
ec ff 00 f8 2c 00              # 5cab |   jne H, 0, ${_C_loop_5}:rel + PC
4a e0 ba 6e                    # 5cb1 |   dec [${var__board__falling} + 0006]
                               #      | _A_call_58:
5c f8 da f7                    # 5cb5 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_58:
ec ff 00 f8 1e 00              # 5cb9 |   jne H, 0, ${_C_loop_5}:rel + PC
02 e0 1c ba 6e 02              # 5cbf |   add [${var__board__falling} + 0006], 0x2
                               #      | _A_call_59:
5c f8 ca f7                    # 5cc5 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_59:
ec ff 00 f8 0e 00              # 5cc9 |   jne H, 0, ${_C_loop_5}:rel + PC
4a e0 ba 6e                    # 5ccf |   dec [${var__board__falling} + 0006]
                               #      | _BZ_loop_5:
58 f8 c0 ff                    # 5cd3 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _A_call_60:
e0 1c 01                       # 5cd7 |   push 0x1
5c f8 39 f7                    # 5cda |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5cde |   mov SP, SP + 0x2
                               #      | _Z_call_60:
                               #      | _cleanup_fn_tg_rotate:
dc                             # 5ce2 |   ret
                               #      | _end_fn_tg_rotate:
                               #      | 
                               #      | fn_tg_hold:
                               #      | _begin_fn_tg_hold:
e0 40                          # 5ce3 |   push B
e0 20                          # 5ce5 |   push A
                               #      | _A_call_63:
e0 00                          # 5ce7 |   push 0
5c f8 2a f7                    # 5ce9 |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5ced |   mov SP, SP + 0x2
                               #      | _Z_call_63:
                               #      | _A_if_50:
ee e0 1c f8 c4 6e ff 24 00     # 5cf1 |   jne [${var__board__stored}], -1, ${_E_if_50}:rel + PC
                               #      | _A_call_64:
e0 1c 08                       # 5cfa |   push 0x8
e0 e0 b4 6e                    # 5cfd |   push ${var__board__falling}
e0 e0 c4 6e                    # 5d01 |   push ${var__board__stored}
5c f8 35 f5                    # 5d05 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # 5d09 |   mov SP, SP + 0x6
                               #      | _Z_call_64:
                               #      | _A_call_65:
5c f8 f0 f4                    # 5d0d |   call ${fn_tg_new_falling}:rel + PC
                               #      | _Z_call_65:
58 f8 39 00                    # 5d11 |   jmp ${_C_if_50}:rel + PC
                               #      | _E_if_50:
61 20 e0 b4 6e                 # 5d15 |   mov A, [${var__board__falling}]
61 40 e0 b6 6e                 # 5d1a |   mov B, [${var__board__falling} + 0002]
63 e0 e0 b4 6e c4 6e           # 5d1f |   mov [${var__board__falling}], [${var__board__stored}]
63 e0 e0 b6 6e c6 6e           # 5d26 |   mov [${var__board__falling} + 0002], [${var__board__stored} + 0002]
62 e0 20 c4 6e                 # 5d2d |   mov [${var__board__stored}], A
62 e0 40 c6 6e                 # 5d32 |   mov [${var__board__stored} + 0002], B
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
                               #      | _A_call_66:
5c f8 58 f7                    # 5d37 |   call ${fn_tg_fits}:rel + PC
                               #      | _Z_call_66:
e8 ff 1c f8 01 0f 00           # 5d3b |   jeq H, 0x1, ${_C_loop_6}:rel + PC
4a e0 b8 6e                    # 5d42 |   dec [${var__board__falling} + 0004]
                               #      | _BZ_loop_6:
58 f8 f1 ff                    # 5d46 |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _C_if_50:
                               #      | _Z_if_50:
                               #      | _A_call_67:
e0 1c 01                       # 5d4a |   push 0x1
5c f8 c6 f6                    # 5d4d |   call ${fn_tg_put}:rel + PC
60 a0 bc 02                    # 5d51 |   mov SP, SP + 0x2
                               #      | _Z_call_67:
                               #      | _cleanup_fn_tg_hold:
e4 20                          # 5d55 |   pop A
e4 40                          # 5d57 |   pop B
dc                             # 5d59 |   ret
                               #      | _end_fn_tg_hold:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5d5a |   push D
e0 60                          # 5d5c |   push C
e0 40                          # 5d5e |   push B
e0 20                          # 5d60 |   push A
61 40 e0 10 ff                 # 5d62 |   mov B, [0xff10]
61 60 e0 12 ff                 # 5d67 |   mov C, [0xff12]
61 80 e0 14 ff                 # 5d6c |   mov D, [0xff14]
61 20 bc 0e                    # 5d71 |   mov A, [SP + 0xe]
60 ff 00                       # 5d75 |   mov H, 0
                               #      | _A_if_59:
fc 28 20 f8 09 00              # 5d78 |   jge A + B, A, ${_E_if_59}:rel + PC
c4 ff 00                       # 5d7e |   inc H, 0
                               #      | _E_if_59:
                               #      | _C_if_59:
                               #      | _Z_if_59:
60 40 44                       # 5d81 |   mov B, B + A
81 20 bc ff 0c                 # 5d84 |   add A, [SP + 0xc], H
60 ff 00                       # 5d89 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 5d8c |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 5d92 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 5d98 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 5d9c |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 5d9f |   mov C, C + A
81 20 bc ff 0a                 # 5da2 |   add A, [SP + 0xa], H
60 80 84                       # 5da7 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 5daa |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 10 ff                 # 5dae |   mov H, [0xff10]
61 fe e0 12 ff                 # 5db3 |   mov G, [0xff12]
61 fc e0 14 ff                 # 5db8 |   mov E, [0xff14]
                               #      | _A_if_62:
e8 fc 80 f8 10 00              # 5dbd |   jeq E, D, ${_E_if_62}:rel + PC
f8 fc 80 f8 2c 00              # 5dc3 |   jgt E, D, ${_C_loop_7}:rel + PC
58 f8 22 00                    # 5dc9 |   jmp ${_C_if_62}:rel + PC
                               #      | _E_if_62:
                               #      | _A_if_64:
e8 fe 60 f8 10 00              # 5dcd |   jeq G, C, ${_E_if_64}:rel + PC
f8 fe 60 f8 1c 00              # 5dd3 |   jgt G, C, ${_C_loop_7}:rel + PC
58 f8 12 00                    # 5dd9 |   jmp ${_C_if_64}:rel + PC
                               #      | _E_if_64:
f8 ff 40 f8 12 00              # 5ddd |   jgt H, B, ${_C_loop_7}:rel + PC
                               #      | _A_if_67:
e8 20 00 f8 08 00              # 5de3 |   jeq A, 0, ${_E_if_67}:rel + PC
5c 20                          # 5de9 |   call A
                               #      | _E_if_67:
                               #      | _C_if_67:
                               #      | _Z_if_67:
                               #      | _C_if_64:
                               #      | _Z_if_64:
                               #      | _C_if_62:
                               #      | _Z_if_62:
                               #      | _BZ_loop_7:
58 f8 c3 ff                    # 5deb |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5def |   pop A
e4 40                          # 5df1 |   pop B
e4 60                          # 5df3 |   pop C
e4 80                          # 5df5 |   pop D
dc                             # 5df7 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__TETROMINOS:
56 04 59 12 6a 45 89 15 45 12 6a 15 89 56 59 04 67 45 ae 26 ef cd 9d 15 56 01 69 25 9a 45 58 14 56 14 69 15 69 45 59 14 56 12 56 12 56 12 56 12 56 24 9a 15 68 45 59 01 # 5df8 |   .data list:[0x0456, 0x1259, 0x456a, 0x1589, 0x1245, 0x156a, 0x5689, 0x0459, 0x4567, 0x26ae, 0xcdef, 0x159d, 0x0156, 0x2569, 0x459a, 0x1458, 0x1456, 0x1569, 0x4569, 0x1459, 0x1256, 0x1256, 0x1256, 0x1256, 0x2456, 0x159a, 0x4568, 0x0159]
                               #      | const__GRAVITY_LEVELS:
32 00 30 00 2e 00 2c 00 2a 00 28 00 26 00 24 00 22 00 20 00 1e 00 1c 00 1a 00 18 00 16 00 14 00 10 00 0c 00 08 00 04 00 # 5e30 |   .data list:[0x0032, 0x0030, 0x002e, 0x002c, 0x002a, 0x0028, 0x0026, 0x0024, 0x0022, 0x0020, 0x001e, 0x001c, 0x001a, 0x0018, 0x0016, 0x0014, 0x0010, 0x000c, 0x0008, 0x0004]
                               #      | const__data_1:
57 65 65 65 6b 6c 79 20 33 30 30 36 00 # 5e58 |   .data str:"Weeekly 3006"
                               #      | const__data_2:
54 65 74 72 69 73 20 44 65 6d 6f 00 # 5e65 |   .data str:"Tetris Demo"
                               #      | const__str__Next:
4e 65 78 74 00                 # 5e71 |   .data str:"Next"
                               #      | const__str__Hold:
48 6f 6c 64 00                 # 5e76 |   .data str:"Hold"
                               #      | const__data_3:
3e 3a 4c 65 66 74 0a 3c 3a 52 69 67 68 74 0a 76 3a 44 6f 77 6e 0a 7a 3a 52 6f 74 61 74 65 20 4c 65 66 74 0a 78 3a 52 6f 74 61 74 65 20 52 69 67 68 74 0a 63 3a 48 6f 6c 64 20 42 6c 6f 63 6b 0a 53 42 3a 44 72 6f 70 00 # 5e7b |   .data str:">:Left\n<:Right\nv:Down\nz:Rotate Left\nx:Rotate Right\nc:Hold Block\nSB:Drop"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5ec3
                               #      | SECTION_BEGIN_static_data:
                               # 5ec3 |   .align dummy_size:13 align:16
                               #      | var__VIDEO_PAGE_BUFFER:
                               # 5ed0 |   .bss size:3840 align:16
                               #      | var__rand__state:
                               # 6dd0 |   .bss size:2 align:1
                               #      | var__board__board_state:
                               # 6dd2 |   .bss size:222 align:1
                               #      | var__board__points:
                               # 6eb0 |   .bss size:2 align:1
                               #      | var__board__level:
                               # 6eb2 |   .bss size:2 align:1
                               #      | var__board__falling:
                               # 6eb4 |   .bss size:8 align:1
                               #      | var__board__next:
                               # 6ebc |   .bss size:8 align:1
                               #      | var__board__stored:
                               # 6ec4 |   .bss size:8 align:1
                               #      | var__board__ticks_till_gravity:
                               # 6ecc |   .bss size:2 align:1
                               #      | var__board__lines_remaining:
                               # 6ece |   .bss size:2 align:1
                               #      | var__var_1:
                               # 6ed0 |   .bss size:10 align:1
                               #      | var__last_btn_in:
                               # 6eda |   .bss size:2 align:1
                               #      | var__handle_keyboard__scan_code:
                               # 6edc |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
