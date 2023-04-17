                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_13:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_13:
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
                               #      | _A_call_11:
5c f8 93 00                    # 5017 |   call ${fn_demo_video}:rel + PC
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 00                          # 501b |   push 0
e0 e0 00 87                    # 501d |   push 0x8700
e0 e0 93 03                    # 5021 |   push 0x393
e0 00                          # 5025 |   push 0
5c f8 4c 02                    # 5027 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 502b |   mov SP, SP + 0x8
                               #      | _Z_call_12:
                               #      | _A_syscall_6:
e0 e0 9e 53                    # 502f |   push ${const__str__Finished__endl}
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
e0 e0 5d 53                    # 5047 |   push ${const__data_9}
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
60 60 e0 4f 53                 # 506a |   mov C, ${const__data_1}
                               #      | _A_syscall_2:
e2 2d                          # 506f |   push [A*2 + C]
e0 40                          # 5071 |   push B
e0 e0 6b 53                    # 5073 |   push ${const__data_10}
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
e0 e0 76 53                    # 508e |   push ${const__data_11}
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
                               #      | _A_call_7:
5c f8 46 00                    # 50ae |   call ${fn_init_video}:rel + PC
                               #      | _Z_call_7:
                               #      | _A_for_5:
60 20 00                       # 50b2 |   mov A, 0
                               #      | _BA_for_5:
fc 20 1c f8 07 25 00           # 50b5 |   jge A, 0x7, ${_C_for_5}:rel + PC
60 60 e0 4f 53                 # 50bc |   mov C, ${const__data_1}
                               #      | _A_call_9:
e2 2d                          # 50c1 |   push [A*2 + C]
e0 1c 03                       # 50c3 |   push 0x3
e0 1c 0a                       # 50c6 |   push 0xa
e0 3c 0a                       # 50c9 |   push A + 0xa
5c f8 28 01                    # 50cc |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 50d0 |   mov SP, SP + 0x8
                               #      | _Z_call_9:
                               #      | _BZ_for_5:
44 20                          # 50d4 |   inc A
58 f8 df ff                    # 50d6 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _A_call_10:
e0 e0 81 53                    # 50da |   push ${const__data_12}
e0 1c 02                       # 50de |   push 0x2
e0 1c 0a                       # 50e1 |   push 0xa
e0 1c 12                       # 50e4 |   push 0x12
5c f8 0d 01                    # 50e7 |   call ${fn_draw_string}:rel + PC
60 a0 bc 08                    # 50eb |   mov SP, SP + 0x8
                               #      | _Z_call_10:
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
5c f8 36 00                    # 50fa |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 50fe |   mov SP, SP + 0x4
                               #      | _Z_call_2:
                               #      | _A_call_4:
5c f8 50 00                    # 5102 |   call ${fn_reset_color_palette}:rel + PC
                               #      | _Z_call_4:
                               #      | _A_for_3:
60 20 00                       # 5106 |   mov A, 0
                               #      | _BA_for_3:
fc 20 1c f8 1e 24 00           # 5109 |   jge A, 0x1e, ${_C_for_3}:rel + PC
                               #      | _A_call_5:
e0 1c 08                       # 5110 |   push 0x8
e0 20                          # 5113 |   push A
5c f8 1b 00                    # 5115 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5119 |   mov SP, SP + 0x4
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 00                          # 511d |   push 0
5c f8 b4 00                    # 511f |   call ${fn_fill_page}:rel + PC
60 a0 bc 02                    # 5123 |   mov SP, SP + 0x2
                               #      | _Z_call_6:
                               #      | _BZ_for_3:
44 20                          # 5127 |   inc A
58 f8 e0 ff                    # 5129 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_init_video:
e4 20                          # 512d |   pop A
dc                             # 512f |   ret
                               #      | _end_fn_init_video:
                               #      | 
                               #      | fn_switch_screen_page:
                               #      | _begin_fn_switch_screen_page:
e0 40                          # 5130 |   push B
e0 20                          # 5132 |   push A
61 20 bc 08                    # 5134 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 5138 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 513d |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c b0 53 af 58 04     # 5144 |   mmap ${var__VIDEO_PAGE_BUFFER}, ${var__VIDEO_PAGE_BUFFER} + 04ff, 0x4
                               #      | _cleanup_fn_switch_screen_page:
e4 20                          # 514d |   pop A
e4 40                          # 514f |   pop B
dc                             # 5151 |   ret
                               #      | _end_fn_switch_screen_page:
                               #      | 
                               #      | fn_reset_color_palette:
                               #      | _begin_fn_reset_color_palette:
e0 80                          # 5152 |   push D
e0 60                          # 5154 |   push C
e0 40                          # 5156 |   push B
e0 20                          # 5158 |   push A
                               #      | _A_for_2:
60 20 00                       # 515a |   mov A, 0
                               #      | _BA_for_2:
fc 20 1c f8 08 4c 00           # 515d |   jge A, 0x8, ${_C_for_2}:rel + PC
98 40 20 1c 02                 # 5164 |   getb B, A, 0x2
                               #      | _A_if_2:
e8 40 00 f8 0b 00              # 5169 |   jeq B, 0, ${_E_if_2}:rel + PC
60 40 e0 ff 00                 # 516f |   mov B, 0xff
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
98 60 20 1c 01                 # 5174 |   getb C, A, 0x1
                               #      | _A_if_3:
e8 60 00 f8 0b 00              # 5179 |   jeq C, 0, ${_E_if_3}:rel + PC
60 60 e0 ff 00                 # 517f |   mov C, 0xff
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
98 80 20 00                    # 5184 |   getb D, A, 0
                               #      | _A_if_4:
e8 80 00 f8 0b 00              # 5188 |   jeq D, 0, ${_E_if_4}:rel + PC
60 80 e0 ff 00                 # 518e |   mov D, 0xff
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _A_call_3:
e0 80                          # 5193 |   push D
e0 60                          # 5195 |   push C
e0 40                          # 5197 |   push B
e0 20                          # 5199 |   push A
5c f8 17 00                    # 519b |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # 519f |   mov SP, SP + 0x8
                               #      | _Z_call_3:
                               #      | _BZ_for_2:
44 20                          # 51a3 |   inc A
58 f8 b8 ff                    # 51a5 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_reset_color_palette:
e4 20                          # 51a9 |   pop A
e4 40                          # 51ab |   pop B
e4 60                          # 51ad |   pop C
e4 80                          # 51af |   pop D
dc                             # 51b1 |   ret
                               #      | _end_fn_reset_color_palette:
                               #      | 
                               #      | fn_set_color_palette:
                               #      | _begin_fn_set_color_palette:
e0 20                          # 51b2 |   push A
ad 20 bc 1c 04 07              # 51b4 |   and A, [SP + 0x4], 0x7
28 20 1c 01                    # 51ba |   shl A, 0x1
63 e4 bc b0 53 0a              # 51be |   mov [${var__VIDEO_PAGE_BUFFER} + A], [SP + 0xa]
63 e4 bc c0 53 08              # 51c4 |   mov [${var__VIDEO_PAGE_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc d0 53 06              # 51ca |   mov [${var__VIDEO_PAGE_BUFFER} + 0020 + A], [SP + 0x6]
                               #      | _cleanup_fn_set_color_palette:
e4 20                          # 51d0 |   pop A
dc                             # 51d2 |   ret
                               #      | _end_fn_set_color_palette:
                               #      | 
                               #      | fn_fill_page:
                               #      | _begin_fn_fill_page:
e0 20                          # 51d3 |   push A
61 fe bc 04                    # 51d5 |   mov G, [SP + 0x4]
                               #      | _A_for_4:
60 20 e0 b0 53                 # 51d9 |   mov A, ${var__VIDEO_PAGE_BUFFER}
                               #      | _BA_for_4:
fc 20 e0 f8 b0 58 13 00        # 51de |   jge A, ${var__VIDEO_PAGE_BUFFER} + 0500, ${_C_for_4}:rel + PC
62 20 fe                       # 51e6 |   mov [A], G
                               #      | _BZ_for_4:
60 20 3c 02                    # 51e9 |   mov A, A + 0x2
58 f8 f1 ff                    # 51ed |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_fill_page:
e4 20                          # 51f1 |   pop A
dc                             # 51f3 |   ret
                               #      | _end_fn_fill_page:
                               #      | 
                               #      | fn_draw_string:
                               #      | _begin_fn_draw_string:
e0 80                          # 51f4 |   push D
e0 60                          # 51f6 |   push C
e0 40                          # 51f8 |   push B
e0 20                          # 51fa |   push A
61 20 bc 0a                    # 51fc |   mov A, [SP + 0xa]
61 40 bc 10                    # 5200 |   mov B, [SP + 0x10]
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
65 ff 40                       # 5204 |   bmov H, [B]
e8 ff 00 f8 63 00              # 5207 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _A_syscall_4:
e0 1c 0a                       # 520d |   push 0xa
e0 40                          # 5210 |   push B
60 ff 1c 0d                    # 5212 |   mov H, 0xd
5e e0 1e ff                    # 5216 |   call [0xff1e]
60 a0 bc 04                    # 521a |   mov SP, SP + 0x4
                               #      | _Z_syscall_4:
                               #      | _A_if_6:
ec ff 00 f8 0d 00              # 521e |   jne H, 0, ${_E_if_6}:rel + PC
60 80 00                       # 5224 |   mov D, 0
58 f8 0d 00                    # 5227 |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
60 60 ff                       # 522b |   mov C, H
65 80 60                       # 522e |   bmov D, [C]
66 60 00                       # 5231 |   bmov [C], 0
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _A_call_8:
e2 bc 0e                       # 5234 |   push [SP + 0xe]
e2 bc 0c                       # 5237 |   push [SP + 0xc]
5c f8 f6 fe                    # 523a |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 523e |   mov SP, SP + 0x4
                               #      | _Z_call_8:
                               #      | _A_syscall_5:
e0 40                          # 5242 |   push B
e2 bc 0e                       # 5244 |   push [SP + 0xe]
e0 e0 b0 53                    # 5247 |   push ${var__VIDEO_PAGE_BUFFER}
60 ff 1c 1e                    # 524b |   mov H, 0x1e
5e e0 1e ff                    # 524f |   call [0xff1e]
60 a0 bc 06                    # 5253 |   mov SP, SP + 0x6
                               #      | _Z_syscall_5:
e8 80 00 f8 13 00              # 5257 |   jeq D, 0, ${_C_loop_1}:rel + PC
66 60 80                       # 525d |   bmov [C], D
c4 40 60                       # 5260 |   inc B, C
46 bc 0a                       # 5263 |   inc [SP + 0xa]
                               #      | _BZ_loop_1:
58 f8 9e ff                    # 5266 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_draw_string:
e4 20                          # 526a |   pop A
e4 40                          # 526c |   pop B
e4 60                          # 526e |   pop C
e4 80                          # 5270 |   pop D
dc                             # 5272 |   ret
                               #      | _end_fn_draw_string:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 5273 |   push D
e0 60                          # 5275 |   push C
e0 40                          # 5277 |   push B
e0 20                          # 5279 |   push A
61 40 e0 10 ff                 # 527b |   mov B, [0xff10]
61 60 e0 12 ff                 # 5280 |   mov C, [0xff12]
61 80 e0 14 ff                 # 5285 |   mov D, [0xff14]
61 20 bc 0e                    # 528a |   mov A, [SP + 0xe]
60 ff 00                       # 528e |   mov H, 0
                               #      | _A_if_8:
fc 28 20 f8 09 00              # 5291 |   jge A + B, A, ${_E_if_8}:rel + PC
c4 ff 00                       # 5297 |   inc H, 0
                               #      | _E_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
60 40 44                       # 529a |   mov B, B + A
81 20 bc ff 0c                 # 529d |   add A, [SP + 0xc], H
60 ff 00                       # 52a2 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # 52a5 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # 52ab |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # 52b1 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # 52b5 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # 52b8 |   mov C, C + A
81 20 bc ff 0a                 # 52bb |   add A, [SP + 0xa], H
60 80 84                       # 52c0 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 52c3 |   mov A, [SP + 0x10]
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 10 ff                 # 52c7 |   mov H, [0xff10]
61 fe e0 12 ff                 # 52cc |   mov G, [0xff12]
61 fc e0 14 ff                 # 52d1 |   mov E, [0xff14]
                               #      | _A_if_11:
e8 fc 80 f8 10 00              # 52d6 |   jeq E, D, ${_E_if_11}:rel + PC
f8 fc 80 f8 2c 00              # 52dc |   jgt E, D, ${_C_loop_2}:rel + PC
58 f8 22 00                    # 52e2 |   jmp ${_C_if_11}:rel + PC
                               #      | _E_if_11:
                               #      | _A_if_13:
e8 fe 60 f8 10 00              # 52e6 |   jeq G, C, ${_E_if_13}:rel + PC
f8 fe 60 f8 1c 00              # 52ec |   jgt G, C, ${_C_loop_2}:rel + PC
58 f8 12 00                    # 52f2 |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
f8 ff 40 f8 12 00              # 52f6 |   jgt H, B, ${_C_loop_2}:rel + PC
                               #      | _A_if_16:
e8 20 00 f8 08 00              # 52fc |   jeq A, 0, ${_E_if_16}:rel + PC
5c 20                          # 5302 |   call A
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _BZ_loop_2:
58 f8 c3 ff                    # 5304 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 5308 |   pop A
e4 40                          # 530a |   pop B
e4 60                          # 530c |   pop C
e4 80                          # 530e |   pop D
dc                             # 5310 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_2:
4c 65 65 20 53 6f 6f 6a 69 6e 00 # 5311 |   .data str:"Lee Soojin"
                               #      | const__data_3:
4d 6f 6e 64 61 79 00           # 531c |   .data str:"Monday"
                               #      | const__data_4:
50 61 72 6b 20 53 6f 65 75 6e 00 # 5323 |   .data str:"Park Soeun"
                               #      | const__data_5:
4c 65 65 20 4a 61 65 68 65 65 00 # 532e |   .data str:"Lee Jaehee"
                               #      | const__data_6:
4a 69 68 61 6e 00              # 5339 |   .data str:"Jihan"
                               #      | const__data_7:
5a 6f 61 00                    # 533f |   .data str:"Zoa"
                               #      | const__data_8:
53 68 69 6e 20 4a 69 79 6f 6f 6e 00 # 5343 |   .data str:"Shin Jiyoon"
                               #      | const__data_1:
11 53 1c 53 23 53 2e 53 39 53 3f 53 43 53 # 534f |   .data str_list:["Lee Soojin", "Monday", "Park Soeun", "Lee Jaehee", "Jihan", "Zoa", "Shin Jiyoon"]
                               #      | const__data_9:
48 65 6c 6c 6f 20 57 6f 72 6c 64 21 0a 00 # 535d |   .data str:"Hello World!\n"
                               #      | const__data_10:
25 64 20 2d 2d 3e 20 25 73 0a 00 # 536b |   .data str:"%d --> %s\n"
                               #      | const__data_11:
25 64 20 2d 2d 3e 20 25 64 0a 00 # 5376 |   .data str:"%d --> %d\n"
                               #      | const__data_12:
45 76 65 72 79 64 61 79 20 57 65 65 65 6b 6c 79 21 0a 48 65 6c 6c 6f 21 40 23 24 25 00 # 5381 |   .data str:"Everyday Weeekly!\nHello!@#$%"
                               #      | const__str__Finished__endl:
46 69 6e 69 73 68 65 64 0a 00  # 539e |   .data str:"Finished\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x53a8
                               #      | SECTION_BEGIN_static_data:
                               # 53a8 |   .align dummy_size:8 align:16
                               #      | var__VIDEO_PAGE_BUFFER:
                               # 53b0 |   .bss size:3840 align:16
                               #      | SECTION_END_static_data:
                               #      | 
