                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_9:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_9:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
                               #      | _A_syscall_1:
60 ff 1c 1a                    # 500a |   mov H, 0x1a
5e e0 1e ff                    # 500e |   call [0xff1e]
                               #      | _Z_syscall_1:
                               #      | _A_syscall_2:
e0 e0 70 52                    # 5012 |   push ${const__data_1}
e0 00                          # 5016 |   push 0
e0 00                          # 5018 |   push 0
60 ff 1c 1c                    # 501a |   mov H, 0x1c
5e e0 1e ff                    # 501e |   call [0xff1e]
60 a0 bc 06                    # 5022 |   mov SP, SP + 0x6
                               #      | _Z_syscall_2:
                               #      | _A_syscall_3:
60 ff 1c 16                    # 5026 |   mov H, 0x16
5e e0 1e ff                    # 502a |   call [0xff1e]
                               #      | _Z_syscall_3:
                               #      | _A_if_1:
ec fe 00 f8 0e 00              # 502e |   jne G, 0, ${_E_if_1}:rel + PC
                               #      | _A_call_1:
5c f8 38 00                    # 5034 |   call ${fn_sd_error}:rel + PC
                               #      | _Z_call_1:
58 f8 19 00                    # 5038 |   jmp ${_C_if_1}:rel + PC
                               #      | _E_if_1:
                               #      | _A_syscall_5:
e0 e0 82 52                    # 503c |   push ${const__data_3}
e0 00                          # 5040 |   push 0
e0 1c 01                       # 5042 |   push 0x1
60 ff 1c 1c                    # 5045 |   mov H, 0x1c
5e e0 1e ff                    # 5049 |   call [0xff1e]
60 a0 bc 06                    # 504d |   mov SP, SP + 0x6
                               #      | _Z_syscall_5:
                               #      | _C_if_1:
                               #      | _Z_if_1:
62 e0 00 a0 61                 # 5051 |   mov [${var__var_1}], 0
                               #      | _A_call_4:
e2 e0 a0 61                    # 5056 |   push [${var__var_1}]
5c f8 29 00                    # 505a |   call ${fn_show_image}:rel + PC
60 a0 bc 02                    # 505e |   mov SP, SP + 0x2
                               #      | _Z_call_4:
62 e0 00 d0 65                 # 5062 |   mov [${var__var_2}], 0
                               #      | _A_call_8:
5c f8 7f 01                    # 5067 |   call ${fn_main_loop}:rel + PC
                               #      | _Z_call_8:
                               #      | _cleanup_fn_main:
dc                             # 506b |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_sd_error:
                               #      | _begin_fn_sd_error:
                               #      | _A_syscall_4:
e0 e0 79 52                    # 506c |   push ${const__data_2}
e0 00                          # 5070 |   push 0
e0 1c 01                       # 5072 |   push 0x1
60 ff 1c 1c                    # 5075 |   mov H, 0x1c
5e e0 1e ff                    # 5079 |   call [0xff1e]
60 a0 bc 06                    # 507d |   mov SP, SP + 0x6
                               #      | _Z_syscall_4:
d8                             # 5081 |   halt
                               #      | _cleanup_fn_sd_error:
dc                             # 5082 |   ret
                               #      | _end_fn_sd_error:
                               #      | 
                               #      | fn_show_image:
                               #      | _begin_fn_show_image:
e0 80                          # 5083 |   push D
e0 60                          # 5085 |   push C
e0 40                          # 5087 |   push B
e0 20                          # 5089 |   push A
60 a0 bc fe                    # 508b |   mov SP, SP + -2
bf a0 e0 0e ff                 # 508f |   not [SP], [0xff0e]
a9 60 bc 1c 0c 08              # 5094 |   shl C, [SP + 0xc], 0x8
                               #      | _A_syscall_6:
e0 60                          # 509a |   push C
e0 1c 01                       # 509c |   push 0x1
e0 e0 00 02                    # 509f |   push 0x200
e0 e0 b0 61                    # 50a3 |   push ${var__g_sd_buf}
60 ff 1c 14                    # 50a7 |   mov H, 0x14
5e e0 1e ff                    # 50ab |   call [0xff1e]
60 a0 bc 08                    # 50af |   mov SP, SP + 0x8
                               #      | _Z_syscall_6:
                               #      | _A_if_2:
ec fe 00 f8 0a 00              # 50b3 |   jne G, 0, ${_E_if_2}:rel + PC
                               #      | _A_call_2:
5c f8 b3 ff                    # 50b9 |   call ${fn_sd_error}:rel + PC
                               #      | _Z_call_2:
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      | _A_if_3:
ea e0 e0 f8 b0 61 a6 3a 11 00  # 50bd |   jeq [${var__g_sd_buf}], 0x3aa6, ${_E_if_3}:rel + PC
60 fe 00                       # 50c7 |   mov G, 0
58 f8 eb 00                    # 50ca |   jmp ${_cleanup_fn_show_image}:rel + PC
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
62 e0 00 ba 61                 # 50ce |   mov [${var__g_sd_buf} + 000a], 0
62 e0 00 c4 61                 # 50d3 |   mov [${var__g_sd_buf} + 0014], 0
                               #      | _A_syscall_7:
60 ff 1c 1a                    # 50d8 |   mov H, 0x1a
5e e0 1e ff                    # 50dc |   call [0xff1e]
                               #      | _Z_syscall_7:
                               #      | _A_syscall_8:
e0 e0 b2 61                    # 50e0 |   push ${var__g_sd_buf} + 0002
e0 00                          # 50e4 |   push 0
e0 00                          # 50e6 |   push 0
60 ff 1c 1c                    # 50e8 |   mov H, 0x1c
5e e0 1e ff                    # 50ec |   call [0xff1e]
60 a0 bc 06                    # 50f0 |   mov SP, SP + 0x6
                               #      | _Z_syscall_8:
                               #      | _A_syscall_9:
e0 e0 bc 61                    # 50f4 |   push ${var__g_sd_buf} + 000c
e0 00                          # 50f8 |   push 0
e0 1c 01                       # 50fa |   push 0x1
60 ff 1c 1c                    # 50fd |   mov H, 0x1c
5e e0 1e ff                    # 5101 |   call [0xff1e]
60 a0 bc 06                    # 5105 |   mov SP, SP + 0x6
                               #      | _Z_syscall_9:
                               #      | _A_call_3:
e0 00                          # 5109 |   push 0
e0 00                          # 510b |   push 0
5c f8 b7 00                    # 510d |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5111 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_syscall_10:
e0 1c 30                       # 5115 |   push 0x30
e0 e0 c6 61                    # 5118 |   push ${var__g_sd_buf} + 0016
e0 e0 a0 52                    # 511c |   push ${var__VIDEO_ROW_BUFFER}
60 ff 1c 0a                    # 5120 |   mov H, 0xa
5e e0 1e ff                    # 5124 |   call [0xff1e]
60 a0 bc 06                    # 5128 |   mov SP, SP + 0x6
                               #      | _Z_syscall_10:
60 20 e0 a1 00                 # 512c |   mov A, 0xa1
60 40 00                       # 5131 |   mov B, 0
                               #      | _A_for_1:
c4 80 00                       # 5134 |   inc D, 0
                               #      | _BA_for_1:
fc 80 e0 f8 e2 00 7b 00        # 5137 |   jge D, 0xe2, ${_C_for_1}:rel + PC
                               #      | _A_syscall_11:
e0 70                          # 513f |   push C + D
e0 1c 01                       # 5141 |   push 0x1
e0 e0 00 02                    # 5144 |   push 0x200
e0 e0 b0 61                    # 5148 |   push ${var__g_sd_buf}
60 ff 1c 14                    # 514c |   mov H, 0x14
5e e0 1e ff                    # 5150 |   call [0xff1e]
60 a0 bc 08                    # 5154 |   mov SP, SP + 0x8
                               #      | _Z_syscall_11:
54 e0 e0 00 c0 63 c0 65        # 5158 |   mmap ${var__g_vid_chunk}, ${var__g_vid_chunk} + 0200, 0
                               #      | _A_syscall_12:
e0 e0 00 02                    # 5160 |   push 0x200
e0 e0 b0 61                    # 5164 |   push ${var__g_sd_buf}
e0 e0 c0 63                    # 5168 |   push ${var__g_vid_chunk}
60 ff 1c 0a                    # 516c |   mov H, 0xa
5e e0 1e ff                    # 5170 |   call [0xff1e]
60 a0 bc 06                    # 5174 |   mov SP, SP + 0x6
                               #      | _Z_syscall_12:
ac ff 20 1c 0f                 # 5178 |   and H, A, 0xf
28 ff 1c 01                    # 517d |   shl H, 0x1
                               #      | _A_if_4:
f4 ff 1c f8 07 0f 00           # 5181 |   jle H, 0x7, ${_E_if_4}:rel + PC
c4 ff 00                       # 5188 |   inc H, 0
60 40 e8 00 02                 # 518b |   mov B, 0x200 + B
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
b0 20 e0 ff a0 00              # 5190 |   or A, 0xa0, H
61 ff e0 0e ff                 # 5196 |   mov H, [0xff0e]
2d ff a0                       # 519b |   and H, [SP]
                               #      | _A_if_5:
e8 ff 00 f8 0e 00              # 519e |   jeq H, 0, ${_E_if_5}:rel + PC
60 fe 1c 02                    # 51a4 |   mov G, 0x2
58 f8 0d 00                    # 51a8 |   jmp ${_cleanup_fn_show_image}:rel + PC
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _BZ_for_1:
44 80                          # 51ac |   inc D
58 f8 89 ff                    # 51ae |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
c4 fe 00                       # 51b2 |   inc G, 0
                               #      | _cleanup_fn_show_image:
d4 00                          # 51b5 |   umap 0
60 a0 bc 02                    # 51b7 |   mov SP, SP + 0x2
e4 20                          # 51bb |   pop A
e4 40                          # 51bd |   pop B
e4 60                          # 51bf |   pop C
e4 80                          # 51c1 |   pop D
dc                             # 51c3 |   ret
                               #      | _end_fn_show_image:
                               #      | 
                               #      | fn_switch_screen_page:
                               #      | _begin_fn_switch_screen_page:
e0 40                          # 51c4 |   push B
e0 20                          # 51c6 |   push A
61 20 bc 08                    # 51c8 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 51cc |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 51d1 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c a0 52 9f 57 04     # 51d8 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
                               #      | _cleanup_fn_switch_screen_page:
e4 20                          # 51e1 |   pop A
e4 40                          # 51e3 |   pop B
dc                             # 51e5 |   ret
                               #      | _end_fn_switch_screen_page:
                               #      | 
                               #      | fn_main_loop:
                               #      | _begin_fn_main_loop:
e0 20                          # 51e6 |   push A
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
61 20 e0 0e ff                 # 51e8 |   mov A, [0xff0e]
                               #      | _A_if_6:
e9 20 e0 f8 d0 65 39 00        # 51ed |   jeq A, [${var__var_2}], ${_E_if_6}:rel + PC
62 e0 20 d0 65                 # 51f5 |   mov [${var__var_2}], A
98 fe 20 1c 0c                 # 51fa |   getb G, A, 0xc
                               #      | _A_if_7:
e8 fe 00 f8 11 00              # 51ff |   jeq G, 0, ${_E_if_7}:rel + PC
                               #      | _A_call_6:
e0 1c ff                       # 5205 |   push -1
5c f8 25 00                    # 5208 |   call ${fn_move_slot}:rel + PC
60 a0 bc 02                    # 520c |   mov SP, SP + 0x2
                               #      | _Z_call_6:
                               #      | _E_if_7:
                               #      | _C_if_7:
                               #      | _Z_if_7:
98 fe 20 1c 09                 # 5210 |   getb G, A, 0x9
                               #      | _A_if_9:
e8 fe 00 f8 11 00              # 5215 |   jeq G, 0, ${_E_if_9}:rel + PC
                               #      | _A_call_7:
e0 1c 01                       # 521b |   push 0x1
5c f8 0f 00                    # 521e |   call ${fn_move_slot}:rel + PC
60 a0 bc 02                    # 5222 |   mov SP, SP + 0x2
                               #      | _Z_call_7:
                               #      | _E_if_9:
                               #      | _C_if_9:
                               #      | _Z_if_9:
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _BZ_loop_1:
58 f8 c2 ff                    # 5226 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_main_loop:
e4 20                          # 522a |   pop A
dc                             # 522c |   ret
                               #      | _end_fn_main_loop:
                               #      | 
                               #      | fn_move_slot:
                               #      | _begin_fn_move_slot:
e0 20                          # 522d |   push A
61 20 e0 a0 61                 # 522f |   mov A, [${var__var_1}]
01 20 bc 04                    # 5234 |   add A, [SP + 0x4]
                               #      | _A_call_5:
e0 20                          # 5238 |   push A
5c f8 49 fe                    # 523a |   call ${fn_show_image}:rel + PC
60 a0 bc 02                    # 523e |   mov SP, SP + 0x2
                               #      | _Z_call_5:
                               #      | _A_if_8:
ec fe 00 f8 26 00              # 5242 |   jne G, 0, ${_E_if_8}:rel + PC
                               #      | _A_syscall_13:
60 ff 1c 1a                    # 5248 |   mov H, 0x1a
5e e0 1e ff                    # 524c |   call [0xff1e]
                               #      | _Z_syscall_13:
                               #      | _A_syscall_14:
e0 e0 8a 52                    # 5250 |   push ${const__data_4}
e0 00                          # 5254 |   push 0
e0 00                          # 5256 |   push 0
60 ff 1c 1c                    # 5258 |   mov H, 0x1c
5e e0 1e ff                    # 525c |   call [0xff1e]
60 a0 bc 06                    # 5260 |   mov SP, SP + 0x6
                               #      | _Z_syscall_14:
58 f8 09 00                    # 5264 |   jmp ${_C_if_8}:rel + PC
                               #      | _E_if_8:
62 e0 20 a0 61                 # 5268 |   mov [${var__var_1}], A
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _cleanup_fn_move_slot:
e4 20                          # 526d |   pop A
dc                             # 526f |   ret
                               #      | _end_fn_move_slot:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
49 6d 67 20 56 69 65 77 00     # 5270 |   .data str:"Img View"
                               #      | const__data_2:
53 44 20 45 72 72 6f 72 00     # 5279 |   .data str:"SD Error"
                               #      | const__data_3:
53 44 20 4f 6b 61 79 00        # 5282 |   .data str:"SD Okay"
                               #      | const__data_4:
54 68 65 20 65 6e 64 21 00     # 528a |   .data str:"The end!"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5293
                               #      | SECTION_BEGIN_static_data:
                               # 5293 |   .align dummy_size:13 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 52a0 |   .bss size:3840 align:16
                               #      | var__var_1:
                               # 61a0 |   .bss size:2 align:1
                               # 61a2 |   .align dummy_size:14 align:16
                               #      | var__g_sd_buf:
                               # 61b0 |   .bss size:528 align:16
                               #      | var__g_vid_chunk:
                               # 63c0 |   .bss size:528 align:16
                               #      | var__var_2:
                               # 65d0 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
