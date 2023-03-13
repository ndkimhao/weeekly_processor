                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_11:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_11:
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
e0 e0 b8 52                    # 5012 |   push ${const__data_1}
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
e0 e0 ca 52                    # 503c |   push ${const__data_3}
e0 00                          # 5040 |   push 0
e0 1c 01                       # 5042 |   push 0x1
60 ff 1c 1c                    # 5045 |   mov H, 0x1c
5e e0 1e ff                    # 5049 |   call [0xff1e]
60 a0 bc 06                    # 504d |   mov SP, SP + 0x6
                               #      | _Z_syscall_5:
                               #      | _C_if_1:
                               #      | _Z_if_1:
62 e0 00 e0 61                 # 5051 |   mov [${var__var_1}], 0
                               #      | _A_call_6:
e2 e0 e0 61                    # 5056 |   push [${var__var_1}]
5c f8 29 00                    # 505a |   call ${fn_show_image}:rel + PC
60 a0 bc 02                    # 505e |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 e0 00 10 66                 # 5062 |   mov [${var__var_2}], 0
                               #      | _A_call_10:
5c f8 c7 01                    # 5067 |   call ${fn_main_loop}:rel + PC
                               #      | _Z_call_10:
                               #      | _cleanup_fn_main:
dc                             # 506b |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_sd_error:
                               #      | _begin_fn_sd_error:
                               #      | _A_syscall_4:
e0 e0 c1 52                    # 506c |   push ${const__data_2}
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
e0 e0 f0 61                    # 50a3 |   push ${var__g_sd_buf}
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
ea e0 e0 f8 f0 61 a6 3a 11 00  # 50bd |   jeq [${var__g_sd_buf}], 0x3aa6, ${_E_if_3}:rel + PC
60 fe 00                       # 50c7 |   mov G, 0
58 f8 12 01                    # 50ca |   jmp ${_cleanup_fn_show_image}:rel + PC
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
62 e0 00 fa 61                 # 50ce |   mov [${var__g_sd_buf} + 000a], 0
62 e0 00 04 62                 # 50d3 |   mov [${var__g_sd_buf} + 0014], 0
                               #      | _A_syscall_7:
60 ff 1c 1a                    # 50d8 |   mov H, 0x1a
5e e0 1e ff                    # 50dc |   call [0xff1e]
                               #      | _Z_syscall_7:
                               #      | _A_syscall_8:
e0 e0 f2 61                    # 50e0 |   push ${var__g_sd_buf} + 0002
e0 00                          # 50e4 |   push 0
e0 00                          # 50e6 |   push 0
60 ff 1c 1c                    # 50e8 |   mov H, 0x1c
5e e0 1e ff                    # 50ec |   call [0xff1e]
60 a0 bc 06                    # 50f0 |   mov SP, SP + 0x6
                               #      | _Z_syscall_8:
                               #      | _A_syscall_9:
e0 e0 fc 61                    # 50f4 |   push ${var__g_sd_buf} + 000c
e0 00                          # 50f8 |   push 0
e0 1c 01                       # 50fa |   push 0x1
60 ff 1c 1c                    # 50fd |   mov H, 0x1c
5e e0 1e ff                    # 5101 |   call [0xff1e]
60 a0 bc 06                    # 5105 |   mov SP, SP + 0x6
                               #      | _Z_syscall_9:
                               #      | _A_for_1:
60 20 00                       # 5109 |   mov A, 0
                               #      | _BA_for_1:
fc 20 1c f8 1e 24 00           # 510c |   jge A, 0x1e, ${_C_for_1}:rel + PC
                               #      | _A_call_3:
e0 1c 08                       # 5113 |   push 0x8
e0 20                          # 5116 |   push A
5c f8 d3 00                    # 5118 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 511c |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 00                          # 5120 |   push 0
5c f8 eb 00                    # 5122 |   call ${fn_fill_page}:rel + PC
60 a0 bc 02                    # 5126 |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_1:
44 20                          # 512a |   inc A
58 f8 e0 ff                    # 512c |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _A_call_5:
e0 00                          # 5130 |   push 0
e0 00                          # 5132 |   push 0
5c f8 b7 00                    # 5134 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # 5138 |   mov SP, SP + 0x4
                               #      | _Z_call_5:
                               #      | _A_syscall_10:
e0 1c 30                       # 513c |   push 0x30
e0 e0 06 62                    # 513f |   push ${var__g_sd_buf} + 0016
e0 e0 e0 52                    # 5143 |   push ${var__VIDEO_ROW_BUFFER}
60 ff 1c 0a                    # 5147 |   mov H, 0xa
5e e0 1e ff                    # 514b |   call [0xff1e]
60 a0 bc 06                    # 514f |   mov SP, SP + 0x6
                               #      | _Z_syscall_10:
60 20 e0 a1 00                 # 5153 |   mov A, 0xa1
60 40 00                       # 5158 |   mov B, 0
                               #      | _A_for_3:
c4 80 00                       # 515b |   inc D, 0
                               #      | _BA_for_3:
fc 80 e0 f8 e2 00 7b 00        # 515e |   jge D, 0xe2, ${_C_for_3}:rel + PC
                               #      | _A_syscall_11:
e0 70                          # 5166 |   push C + D
e0 1c 01                       # 5168 |   push 0x1
e0 e0 00 02                    # 516b |   push 0x200
e0 e0 f0 61                    # 516f |   push ${var__g_sd_buf}
60 ff 1c 14                    # 5173 |   mov H, 0x14
5e e0 1e ff                    # 5177 |   call [0xff1e]
60 a0 bc 08                    # 517b |   mov SP, SP + 0x8
                               #      | _Z_syscall_11:
54 e0 e0 00 00 64 00 66        # 517f |   mmap ${var__g_vid_chunk}, ${var__g_vid_chunk} + 0200, 0
                               #      | _A_syscall_12:
e0 e0 00 02                    # 5187 |   push 0x200
e0 e0 f0 61                    # 518b |   push ${var__g_sd_buf}
e0 e0 00 64                    # 518f |   push ${var__g_vid_chunk}
60 ff 1c 0a                    # 5193 |   mov H, 0xa
5e e0 1e ff                    # 5197 |   call [0xff1e]
60 a0 bc 06                    # 519b |   mov SP, SP + 0x6
                               #      | _Z_syscall_12:
ac ff 20 1c 0f                 # 519f |   and H, A, 0xf
28 ff 1c 01                    # 51a4 |   shl H, 0x1
                               #      | _A_if_4:
f4 ff 1c f8 07 0f 00           # 51a8 |   jle H, 0x7, ${_E_if_4}:rel + PC
c4 ff 00                       # 51af |   inc H, 0
60 40 e8 00 02                 # 51b2 |   mov B, 0x200 + B
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
b0 20 e0 ff a0 00              # 51b7 |   or A, 0xa0, H
61 ff e0 0e ff                 # 51bd |   mov H, [0xff0e]
2d ff a0                       # 51c2 |   and H, [SP]
                               #      | _A_if_5:
e8 ff 00 f8 0e 00              # 51c5 |   jeq H, 0, ${_E_if_5}:rel + PC
60 fe 1c 02                    # 51cb |   mov G, 0x2
58 f8 0d 00                    # 51cf |   jmp ${_cleanup_fn_show_image}:rel + PC
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _BZ_for_3:
44 80                          # 51d3 |   inc D
58 f8 89 ff                    # 51d5 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
c4 fe 00                       # 51d9 |   inc G, 0
                               #      | _cleanup_fn_show_image:
d4 00                          # 51dc |   umap 0
60 a0 bc 02                    # 51de |   mov SP, SP + 0x2
e4 20                          # 51e2 |   pop A
e4 40                          # 51e4 |   pop B
e4 60                          # 51e6 |   pop C
e4 80                          # 51e8 |   pop D
dc                             # 51ea |   ret
                               #      | _end_fn_show_image:
                               #      | 
                               #      | fn_switch_screen_page:
                               #      | _begin_fn_switch_screen_page:
e0 40                          # 51eb |   push B
e0 20                          # 51ed |   push A
61 20 bc 08                    # 51ef |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 51f3 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 51f8 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c e0 52 df 57 04     # 51ff |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x4
                               #      | _cleanup_fn_switch_screen_page:
e4 20                          # 5208 |   pop A
e4 40                          # 520a |   pop B
dc                             # 520c |   ret
                               #      | _end_fn_switch_screen_page:
                               #      | 
                               #      | fn_fill_page:
                               #      | _begin_fn_fill_page:
e0 20                          # 520d |   push A
61 fe bc 04                    # 520f |   mov G, [SP + 0x4]
                               #      | _A_for_2:
60 20 e0 e0 52                 # 5213 |   mov A, ${var__VIDEO_ROW_BUFFER}
                               #      | _BA_for_2:
fc 20 e0 f8 e0 57 13 00        # 5218 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_2}:rel + PC
62 20 fe                       # 5220 |   mov [A], G
                               #      | _BZ_for_2:
60 20 3c 02                    # 5223 |   mov A, A + 0x2
58 f8 f1 ff                    # 5227 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_fill_page:
e4 20                          # 522b |   pop A
dc                             # 522d |   ret
                               #      | _end_fn_fill_page:
                               #      | 
                               #      | fn_main_loop:
                               #      | _begin_fn_main_loop:
e0 20                          # 522e |   push A
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
61 20 e0 0e ff                 # 5230 |   mov A, [0xff0e]
                               #      | _A_if_6:
e9 20 e0 f8 10 66 39 00        # 5235 |   jeq A, [${var__var_2}], ${_E_if_6}:rel + PC
62 e0 20 10 66                 # 523d |   mov [${var__var_2}], A
98 fe 20 1c 0c                 # 5242 |   getb G, A, 0xc
                               #      | _A_if_7:
e8 fe 00 f8 11 00              # 5247 |   jeq G, 0, ${_E_if_7}:rel + PC
                               #      | _A_call_8:
e0 1c ff                       # 524d |   push -1
5c f8 25 00                    # 5250 |   call ${fn_move_slot}:rel + PC
60 a0 bc 02                    # 5254 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
                               #      | _E_if_7:
                               #      | _C_if_7:
                               #      | _Z_if_7:
98 fe 20 1c 09                 # 5258 |   getb G, A, 0x9
                               #      | _A_if_9:
e8 fe 00 f8 11 00              # 525d |   jeq G, 0, ${_E_if_9}:rel + PC
                               #      | _A_call_9:
e0 1c 01                       # 5263 |   push 0x1
5c f8 0f 00                    # 5266 |   call ${fn_move_slot}:rel + PC
60 a0 bc 02                    # 526a |   mov SP, SP + 0x2
                               #      | _Z_call_9:
                               #      | _E_if_9:
                               #      | _C_if_9:
                               #      | _Z_if_9:
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _BZ_loop_1:
58 f8 c2 ff                    # 526e |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_main_loop:
e4 20                          # 5272 |   pop A
dc                             # 5274 |   ret
                               #      | _end_fn_main_loop:
                               #      | 
                               #      | fn_move_slot:
                               #      | _begin_fn_move_slot:
e0 20                          # 5275 |   push A
61 20 e0 e0 61                 # 5277 |   mov A, [${var__var_1}]
01 20 bc 04                    # 527c |   add A, [SP + 0x4]
                               #      | _A_call_7:
e0 20                          # 5280 |   push A
5c f8 01 fe                    # 5282 |   call ${fn_show_image}:rel + PC
60 a0 bc 02                    # 5286 |   mov SP, SP + 0x2
                               #      | _Z_call_7:
                               #      | _A_if_8:
ec fe 00 f8 26 00              # 528a |   jne G, 0, ${_E_if_8}:rel + PC
                               #      | _A_syscall_13:
60 ff 1c 1a                    # 5290 |   mov H, 0x1a
5e e0 1e ff                    # 5294 |   call [0xff1e]
                               #      | _Z_syscall_13:
                               #      | _A_syscall_14:
e0 e0 d2 52                    # 5298 |   push ${const__data_4}
e0 00                          # 529c |   push 0
e0 00                          # 529e |   push 0
60 ff 1c 1c                    # 52a0 |   mov H, 0x1c
5e e0 1e ff                    # 52a4 |   call [0xff1e]
60 a0 bc 06                    # 52a8 |   mov SP, SP + 0x6
                               #      | _Z_syscall_14:
58 f8 09 00                    # 52ac |   jmp ${_C_if_8}:rel + PC
                               #      | _E_if_8:
62 e0 20 e0 61                 # 52b0 |   mov [${var__var_1}], A
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _cleanup_fn_move_slot:
e4 20                          # 52b5 |   pop A
dc                             # 52b7 |   ret
                               #      | _end_fn_move_slot:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
49 6d 67 20 56 69 65 77 00     # 52b8 |   .data str:"Img View"
                               #      | const__data_2:
53 44 20 45 72 72 6f 72 00     # 52c1 |   .data str:"SD Error"
                               #      | const__data_3:
53 44 20 4f 6b 61 79 00        # 52ca |   .data str:"SD Okay"
                               #      | const__data_4:
54 68 65 20 65 6e 64 21 00     # 52d2 |   .data str:"The end!"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x52db
                               #      | SECTION_BEGIN_static_data:
                               # 52db |   .align dummy_size:5 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 52e0 |   .bss size:3840 align:16
                               #      | var__var_1:
                               # 61e0 |   .bss size:2 align:1
                               # 61e2 |   .align dummy_size:14 align:16
                               #      | var__g_sd_buf:
                               # 61f0 |   .bss size:528 align:16
                               #      | var__g_vid_chunk:
                               # 6400 |   .bss size:528 align:16
                               #      | var__var_2:
                               # 6610 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
