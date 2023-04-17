                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_14:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_14:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 20                          # 500a |   push A
                               #      | _A_call_1:
e0 1c 0a                       # 500c |   push 0xa
5c f8 32 00                    # 500f |   call ${fn_demo_uart}:rel + PC
60 a0 bc 02                    # 5013 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _A_call_12:
5c f8 93 00                    # 5017 |   call ${fn_demo_video}:rel + PC
                               #      | _Z_call_12:
                               #      | _A_call_13:
e0 00                          # 501b |   push 0
e0 e0 00 87                    # 501d |   push 0x8700
e0 e0 93 03                    # 5021 |   push 0x393
e0 00                          # 5025 |   push 0
5c f8 6a 02                    # 5027 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 502b |   mov SP, SP + 0x8
                               #      | _Z_call_13:
                               #      | _A_syscall_6:
e0 e0 bc 53                    # 502f |   push ${const__str__Finished__endl}
60 ff 00                       # 5033 |   mov H, 0
5e e0 1e ff                    # 5036 |   call [0xff1e]
60 a0 bc 02                    # 503a |   mov SP, SP + 0x2
                               #      | _Z_syscall_6:
                               #      | _cleanup_fn_main:
e4 20                          # 503e |   pop A
dc                             # 5040 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_demo_uart:
                               #      | _begin_fn_demo_uart:
e0 60                          # 5041 |   push C
e0 40                          # 5043 |   push B
e0 20                          # 5045 |   push A
                               #      | _A_syscall_1:
e0 e0 7b 53                    # 5047 |   push ${const__data_9}
60 ff 00                       # 504b |   mov H, 0
5e e0 1e ff                    # 504e |   call [0xff1e]
60 a0 bc 02                    # 5052 |   mov SP, SP + 0x2
                               #      | _Z_syscall_1:
                               #      | _A_for_1:
60 20 00                       # 5056 |   mov A, 0
                               #      | _BA_for_1:
fd 20 bc f8 08 4a 00           # 5059 |   jge A, [SP + 0x8], ${_C_for_1}:rel + PC
c4 40 20                       # 5060 |   inc B, A
                               #      | _A_if_1:
fc 20 1c f8 07 23 00           # 5063 |   jge A, 0x7, ${_E_if_1}:rel + PC
60 60 e0 6d 53                 # 506a |   mov C, ${const__data_1}
                               #      | _A_syscall_2:
e2 2d                          # 506f |   push [A*2 + C]
e0 40                          # 5071 |   push B
e0 e0 89 53                    # 5073 |   push ${const__data_10}
60 ff 00                       # 5077 |   mov H, 0
5e e0 1e ff                    # 507a |   call [0xff1e]
60 a0 bc 06                    # 507e |   mov SP, SP + 0x6
                               #      | _Z_syscall_2:
58 f8 1b 00                    # 5082 |   jmp ${_C_if_1}:rel + PC
                               #      | _E_if_1:
88 60 40 40                    # 5086 |   mul C, B, B
                               #      | _A_syscall_3:
e0 60                          # 508a |   push C
e0 40                          # 508c |   push B
e0 e0 94 53                    # 508e |   push ${const__data_11}
60 ff 00                       # 5092 |   mov H, 0
5e e0 1e ff                    # 5095 |   call [0xff1e]
60 a0 bc 06                    # 5099 |   mov SP, SP + 0x6
                               #      | _Z_syscall_3:
                               #      | _C_if_1:
                               #      | _Z_if_1:
                               #      | _BZ_for_1:
44 20                          # 509d |   inc A
58 f8 ba ff                    # 509f |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_demo_uart:
e4 20                          # 50a3 |   pop A
e4 40                          # 50a5 |   pop B
e4 60                          # 50a7 |   pop C
dc                             # 50a9 |   ret
                               #      | _end_fn_demo_uart:
                               #      | 
                               #      | fn_demo_video:
                               #      | _begin_fn_demo_video:
e0 60                          # 50aa |   push C
e0 20                          # 50ac |   push A
                               #      | _A_call_8:
5c f8 46 00                    # 50ae |   call ${fn_init_video}:rel + PC
                               #      | _Z_call_8:
                               #      | _A_for_5:
60 20 00                       # 50b2 |   mov A, 0
                               #      | _BA_for_5:
fc 20 1c f8 07 25 00           # 50b5 |   jge A, 0x7, ${_C_for_5}:rel + PC
60 60 e0 6d 53                 # 50bc |   mov C, ${const__data_1}
                               #      | _A_call_10:
e2 2d                          # 50c1 |   push [A*2 + C]
e0 3c 01                       # 50c3 |   push A + 0x1
e0 1c 0a                       # 50c6 |   push 0xa
e0 3c 0a                       # 50c9 |   push A + 0xa
5c f8 3d 01                    # 50cc |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 50d0 |   mov SP, SP + 0x8
                               #      | _Z_call_10:
                               #      | _BZ_for_5:
44 20                          # 50d4 |   inc A
58 f8 df ff                    # 50d6 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _A_call_11:
e0 e0 9f 53                    # 50da |   push ${const__data_12}
e0 1c 02                       # 50de |   push 0x2
e0 1c 0a                       # 50e1 |   push 0xa
e0 1c 12                       # 50e4 |   push 0x12
5c f8 22 01                    # 50e7 |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 50eb |   mov SP, SP + 0x8
                               #      | _Z_call_11:
                               #      | _cleanup_fn_demo_video:
e4 20                          # 50ef |   pop A
e4 60                          # 50f1 |   pop C
dc                             # 50f3 |   ret
                               #      | _end_fn_demo_video:
                               #      | 
                               #      | fn_init_video:
                               #      | _begin_fn_init_video:
e0 20                          # 50f4 |   push A
                               #      | _A_call_2:
e0 00                          # 50f6 |   push 0
e0 00                          # 50f8 |   push 0
5c f8 4b 00                    # 50fa |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 50fe |   mov SP, SP + 0x4
                               #      | _Z_call_2:
                               #      | _A_call_4:
5c f8 65 00                    # 5102 |   call ${fn_reset_color_palette}:rel + PC
                               #      | _Z_call_4:
                               #      | _A_call_5:
e0 00                          # 5106 |   push 0
e0 e0 a5 00                    # 5108 |   push 0xa5
e0 e0 ff 00                    # 510c |   push 0xff
e0 1c 01                       # 5110 |   push 0x1
5c f8 b4 00                    # 5113 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 5117 |   mov SP, SP + 0x8
                               #      | _Z_call_5:
                               #      | _A_for_3:
60 20 00                       # 511b |   mov A, 0
                               #      | _BA_for_3:
fc 20 1c f8 1e 24 00           # 511e |   jge A, 0x1e, ${_C_for_3}:rel + PC
                               #      | _A_call_6:
e0 1c 08                       # 5125 |   push 0x8
e0 20                          # 5128 |   push A
5c f8 1b 00                    # 512a |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 512e |   mov SP, SP + 0x4
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 00                          # 5132 |   push 0
5c f8 b4 00                    # 5134 |   call ${fn_fill_page}:rel + PC
60 a0 bc 02                    # 5138 |   mov SP, SP + 0x2
                               #      | _Z_call_7:
                               #      | _BZ_for_3:
44 20                          # 513c |   inc A
58 f8 e0 ff                    # 513e |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_init_video:
e4 20                          # 5142 |   pop A
dc                             # 5144 |   ret
                               #      | _end_fn_init_video:
                               #      | 
                               #      | fn_switch_screen_page:
                               #      | _begin_fn_switch_screen_page:
e0 40                          # 5145 |   push B
e0 20                          # 5147 |   push A
61 20 bc 08                    # 5149 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 514d |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 5152 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c d0 53 cf 58 04     # 5159 |   mmap ${var__VIDEO_PAGE_BUFFER}, ${var__VIDEO_PAGE_BUFFER} + 04ff, 0x4
                               #      | _cleanup_fn_switch_screen_page:
e4 20                          # 5162 |   pop A
e4 40                          # 5164 |   pop B
dc                             # 5166 |   ret
                               #      | _end_fn_switch_screen_page:
                               #      | 
                               #      | fn_reset_color_palette:
                               #      | _begin_fn_reset_color_palette:
e0 80                          # 5167 |   push D
e0 60                          # 5169 |   push C
e0 40                          # 516b |   push B
e0 20                          # 516d |   push A
                               #      | _A_for_2:
60 20 00                       # 516f |   mov A, 0
                               #      | _BA_for_2:
fc 20 1c f8 08 4c 00           # 5172 |   jge A, 0x8, ${_C_for_2}:rel + PC
98 40 20 1c 02                 # 5179 |   getb B, A, 0x2
                               #      | _A_if_2:
e8 40 00 f8 0b 00              # 517e |   jeq B, 0, ${_E_if_2}:rel + PC
60 40 e0 ff 00                 # 5184 |   mov B, 0xff
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
98 60 20 1c 01                 # 5189 |   getb C, A, 0x1
                               #      | _A_if_3:
e8 60 00 f8 0b 00              # 518e |   jeq C, 0, ${_E_if_3}:rel + PC
60 60 e0 ff 00                 # 5194 |   mov C, 0xff
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
98 80 20 00                    # 5199 |   getb D, A, 0
                               #      | _A_if_4:
e8 80 00 f8 0b 00              # 519d |   jeq D, 0, ${_E_if_4}:rel + PC
60 80 e0 ff 00                 # 51a3 |   mov D, 0xff
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _A_call_3:
e0 80                          # 51a8 |   push D
e0 60                          # 51aa |   push C
e0 40                          # 51ac |   push B
e0 20                          # 51ae |   push A
5c f8 17 00                    # 51b0 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 51b4 |   mov SP, SP + 0x8
                               #      | _Z_call_3:
                               #      | _BZ_for_2:
44 20                          # 51b8 |   inc A
58 f8 b8 ff                    # 51ba |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_reset_color_palette:
e4 20                          # 51be |   pop A
e4 40                          # 51c0 |   pop B
e4 60                          # 51c2 |   pop C
e4 80                          # 51c4 |   pop D
dc                             # 51c6 |   ret
                               #      | _end_fn_reset_color_palette:
                               #      | 
                               #      | fn_set_color_palette:
                               #      | _begin_fn_set_color_palette:
e0 20                          # 51c7 |   push A
ad 20 bc 1c 04 07              # 51c9 |   and A, [SP + 0x4], 0x7
28 20 1c 01                    # 51cf |   shl A, 0x1
63 e4 bc d0 53 0a              # 51d3 |   mov [${var__VIDEO_PAGE_BUFFER} + A], [SP + 0xa]
63 e4 bc e0 53 08              # 51d9 |   mov [${var__VIDEO_PAGE_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc f0 53 06              # 51df |   mov [${var__VIDEO_PAGE_BUFFER} + 0020 + A], [SP + 0x6]
                               #      | _cleanup_fn_set_color_palette:
e4 20                          # 51e5 |   pop A
dc                             # 51e7 |   ret
                               #      | _end_fn_set_color_palette:
                               #      | 
                               #      | fn_fill_page:
                               #      | _begin_fn_fill_page:
e0 20                          # 51e8 |   push A
61 fe bc 04                    # 51ea |   mov G, [SP + 0x4]
                               #      | _A_for_4:
60 20 e0 d0 53                 # 51ee |   mov A, ${var__VIDEO_PAGE_BUFFER}
                               #      | _BA_for_4:
fc 20 e0 f8 d0 58 13 00        # 51f3 |   jge A, ${var__VIDEO_PAGE_BUFFER} + 0500, ${_C_for_4}:rel + PC
62 20 fe                       # 51fb |   mov [A], G
                               #      | _BZ_for_4:
60 20 3c 02                    # 51fe |   mov A, A + 0x2
58 f8 f1 ff                    # 5202 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_fill_page:
e4 20                          # 5206 |   pop A
dc                             # 5208 |   ret
                               #      | _end_fn_fill_page:
                               #      | 
                               #      | fn_draw_string:
                               #      | _begin_fn_draw_string:
e0 80                          # 5209 |   push D
e0 60                          # 520b |   push C
e0 40                          # 520d |   push B
e0 20                          # 520f |   push A
61 20 bc 0a                    # 5211 |   mov A, [SP + 0xa]
61 40 bc 10                    # 5215 |   mov B, [SP + 0x10]
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
65 ff 40                       # 5219 |   bmov H, [B]
e8 ff 00 f8 6c 00              # 521c |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_syscall_4:
e0 1c 0a                       # 5222 |   push 0xa
e0 40                          # 5225 |   push B
60 ff 1c 0d                    # 5227 |   mov H, 0xd
5e e0 1e ff                    # 522b |   call [0xff1e]
60 a0 bc 04                    # 522f |   mov SP, SP + 0x4
                               #      | _Z_syscall_4:
                               #      | _A_if_6:
ec ff 00 f8 0d 00              # 5233 |   jne H, 0, ${_E_if_6}:rel + PC
60 80 00                       # 5239 |   mov D, 0
58 f8 0d 00                    # 523c |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
60 60 ff                       # 5240 |   mov C, H
65 80 60                       # 5243 |   bmov D, [C]
66 60 00                       # 5246 |   bmov [C], 0
                               #      | _C_if_6:
                               #      | _Z_if_6:
ad ff bc 1c 0e 07              # 5249 |   and H, [SP + 0xe], 0x7
00 ff 1c 08                    # 524f |   add H, 0x8
                               #      | _A_call_9:
e0 ff                          # 5253 |   push H
e2 bc 0c                       # 5255 |   push [SP + 0xc]
5c f8 ed fe                    # 5258 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 525c |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_syscall_5:
e0 40                          # 5260 |   push B
e2 bc 0e                       # 5262 |   push [SP + 0xe]
e0 e0 d0 53                    # 5265 |   push ${var__VIDEO_PAGE_BUFFER}
60 ff 1c 1e                    # 5269 |   mov H, 0x1e
5e e0 1e ff                    # 526d |   call [0xff1e]
60 a0 bc 06                    # 5271 |   mov SP, SP + 0x6
                               #      | _Z_syscall_5:
e8 80 00 f8 13 00              # 5275 |   jeq D, 0, ${_C_loop_1}:rel + PC
66 60 80                       # 527b |   bmov [C], D
c4 40 60                       # 527e |   inc B, C
46 bc 0a                       # 5281 |   inc [SP + 0xa]
                               #      | _BZ_loop_1:
58 f8 95 ff                    # 5284 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_draw_string:
e4 20                          # 5288 |   pop A
e4 40                          # 528a |   pop B
e4 60                          # 528c |   pop C
e4 80                          # 528e |   pop D
dc                             # 5290 |   ret
                               #      | _end_fn_draw_string:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5291 |   push D
e0 60                          # 5293 |   push C
e0 40                          # 5295 |   push B
e0 20                          # 5297 |   push A
61 40 e0 10 ff                 # 5299 |   mov B, [0xff10]
61 60 e0 12 ff                 # 529e |   mov C, [0xff12]
61 80 e0 14 ff                 # 52a3 |   mov D, [0xff14]
61 20 bc 0e                    # 52a8 |   mov A, [SP + 0xe]
60 ff 00                       # 52ac |   mov H, 0
                               #      | _A_if_8:
fc 28 20 f8 09 00              # 52af |   jge A + B, A, ${_E_if_8}:rel + PC
c4 ff 00                       # 52b5 |   inc H, 0
                               #      | _E_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
60 40 44                       # 52b8 |   mov B, B + A
81 20 bc ff 0c                 # 52bb |   add A, [SP + 0xc], H
60 ff 00                       # 52c0 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 52c3 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 52c9 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 52cf |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 52d3 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 52d6 |   mov C, C + A
81 20 bc ff 0a                 # 52d9 |   add A, [SP + 0xa], H
60 80 84                       # 52de |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 52e1 |   mov A, [SP + 0x10]
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 10 ff                 # 52e5 |   mov H, [0xff10]
61 fe e0 12 ff                 # 52ea |   mov G, [0xff12]
61 fc e0 14 ff                 # 52ef |   mov E, [0xff14]
                               #      | _A_if_11:
e8 fc 80 f8 10 00              # 52f4 |   jeq E, D, ${_E_if_11}:rel + PC
f8 fc 80 f8 2c 00              # 52fa |   jgt E, D, ${_C_loop_2}:rel + PC
58 f8 22 00                    # 5300 |   jmp ${_C_if_11}:rel + PC
                               #      | _E_if_11:
                               #      | _A_if_13:
e8 fe 60 f8 10 00              # 5304 |   jeq G, C, ${_E_if_13}:rel + PC
f8 fe 60 f8 1c 00              # 530a |   jgt G, C, ${_C_loop_2}:rel + PC
58 f8 12 00                    # 5310 |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
f8 ff 40 f8 12 00              # 5314 |   jgt H, B, ${_C_loop_2}:rel + PC
                               #      | _A_if_16:
e8 20 00 f8 08 00              # 531a |   jeq A, 0, ${_E_if_16}:rel + PC
5c 20                          # 5320 |   call A
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _BZ_loop_2:
58 f8 c3 ff                    # 5322 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5326 |   pop A
e4 40                          # 5328 |   pop B
e4 60                          # 532a |   pop C
e4 80                          # 532c |   pop D
dc                             # 532e |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_2:
4c 65 65 20 53 6f 6f 6a 69 6e 00 # 532f |   .data str:"Lee Soojin"
                               #      | const__data_3:
4d 6f 6e 64 61 79 00           # 533a |   .data str:"Monday"
                               #      | const__data_4:
50 61 72 6b 20 53 6f 65 75 6e 00 # 5341 |   .data str:"Park Soeun"
                               #      | const__data_5:
4c 65 65 20 4a 61 65 68 65 65 00 # 534c |   .data str:"Lee Jaehee"
                               #      | const__data_6:
4a 69 68 61 6e 00              # 5357 |   .data str:"Jihan"
                               #      | const__data_7:
5a 6f 61 00                    # 535d |   .data str:"Zoa"
                               #      | const__data_8:
53 68 69 6e 20 4a 69 79 6f 6f 6e 00 # 5361 |   .data str:"Shin Jiyoon"
                               #      | const__data_1:
2f 53 3a 53 41 53 4c 53 57 53 5d 53 61 53 # 536d |   .data str_list:["Lee Soojin", "Monday", "Park Soeun", "Lee Jaehee", "Jihan", "Zoa", "Shin Jiyoon"]
                               #      | const__data_9:
48 65 6c 6c 6f 20 57 6f 72 6c 64 21 0a 00 # 537b |   .data str:"Hello World!\n"
                               #      | const__data_10:
25 64 20 2d 2d 3e 20 25 73 0a 00 # 5389 |   .data str:"%d --> %s\n"
                               #      | const__data_11:
25 64 20 2d 2d 3e 20 25 64 0a 00 # 5394 |   .data str:"%d --> %d\n"
                               #      | const__data_12:
45 76 65 72 79 64 61 79 20 57 65 65 65 6b 6c 79 21 0a 48 65 6c 6c 6f 21 40 23 24 25 00 # 539f |   .data str:"Everyday Weeekly!\nHello!@#$%"
                               #      | const__str__Finished__endl:
46 69 6e 69 73 68 65 64 0a 00  # 53bc |   .data str:"Finished\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x53c6
                               #      | SECTION_BEGIN_static_data:
                               # 53c6 |   .align dummy_size:10 align:16
                               #      | var__VIDEO_PAGE_BUFFER:
                               # 53d0 |   .bss size:3840 align:16
                               #      | SECTION_END_static_data:
                               #      | 
