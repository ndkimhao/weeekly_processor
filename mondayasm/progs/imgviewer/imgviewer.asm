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
e0 e0 64 52                    # 5012 |   push ${const__data_1}
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
e0 e0 76 52                    # 503c |   push ${const__data_3}
e0 00                          # 5040 |   push 0
e0 1c 01                       # 5042 |   push 0x1
60 ff 1c 1c                    # 5045 |   mov H, 0x1c
5e e0 1e ff                    # 5049 |   call [0xff1e]
60 a0 bc 06                    # 504d |   mov SP, SP + 0x6
                               #      | _Z_syscall_5:
                               #      | _C_if_1:
                               #      | _Z_if_1:
62 e0 00 90 57                 # 5051 |   mov [${var__var_1}], 0
                               #      | _A_call_4:
e2 e0 90 57                    # 5056 |   push [${var__var_1}]
5c f8 29 00                    # 505a |   call ${fn_show_image}:rel + PC
60 a0 bc 02                    # 505e |   mov SP, SP + 0x2
                               #      | _Z_call_4:
62 e0 00 b2 5b                 # 5062 |   mov [${var__var_2}], 0
                               #      | _A_call_8:
5c f8 72 01                    # 5067 |   call ${fn_main_loop}:rel + PC
                               #      | _Z_call_8:
                               #      | _cleanup_fn_main:
dc                             # 506b |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_sd_error:
                               #      | _begin_fn_sd_error:
                               #      | _A_syscall_4:
e0 e0 6d 52                    # 506c |   push ${const__data_2}
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
a9 60 bc 1c 0a 08              # 508b |   shl C, [SP + 0xa], 0x8
                               #      | _A_syscall_6:
e0 60                          # 5091 |   push C
e0 1c 01                       # 5093 |   push 0x1
e0 e0 00 02                    # 5096 |   push 0x200
e0 e0 a0 57                    # 509a |   push ${var__g_sd_buf}
60 ff 1c 14                    # 509e |   mov H, 0x14
5e e0 1e ff                    # 50a2 |   call [0xff1e]
60 a0 bc 08                    # 50a6 |   mov SP, SP + 0x8
                               #      | _Z_syscall_6:
                               #      | _A_if_2:
ec fe 00 f8 0a 00              # 50aa |   jne G, 0, ${_E_if_2}:rel + PC
                               #      | _A_call_2:
5c f8 bc ff                    # 50b0 |   call ${fn_sd_error}:rel + PC
                               #      | _Z_call_2:
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      | _A_syscall_7:
e2 e0 a0 57                    # 50b4 |   push [${var__g_sd_buf}]
e2 bc 0c                       # 50b8 |   push [SP + 0xc]
e0 e0 7e 52                    # 50bb |   push ${const__data_4}
60 ff 00                       # 50bf |   mov H, 0
5e e0 1e ff                    # 50c2 |   call [0xff1e]
60 a0 bc 06                    # 50c6 |   mov SP, SP + 0x6
                               #      | _Z_syscall_7:
                               #      | _A_if_3:
ea e0 e0 f8 a0 57 a6 3a 11 00  # 50ca |   jeq [${var__g_sd_buf}], 0x3aa6, ${_E_if_3}:rel + PC
60 fe 00                       # 50d4 |   mov G, 0
58 f8 d7 00                    # 50d7 |   jmp ${_cleanup_fn_show_image}:rel + PC
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
62 e0 00 aa 57                 # 50db |   mov [${var__g_sd_buf} + 000a], 0
62 e0 00 b4 57                 # 50e0 |   mov [${var__g_sd_buf} + 0014], 0
                               #      | _A_syscall_8:
60 ff 1c 1a                    # 50e5 |   mov H, 0x1a
5e e0 1e ff                    # 50e9 |   call [0xff1e]
                               #      | _Z_syscall_8:
                               #      | _A_syscall_9:
e0 e0 a2 57                    # 50ed |   push ${var__g_sd_buf} + 0002
e0 00                          # 50f1 |   push 0
e0 00                          # 50f3 |   push 0
60 ff 1c 1c                    # 50f5 |   mov H, 0x1c
5e e0 1e ff                    # 50f9 |   call [0xff1e]
60 a0 bc 06                    # 50fd |   mov SP, SP + 0x6
                               #      | _Z_syscall_9:
                               #      | _A_syscall_10:
e0 e0 ac 57                    # 5101 |   push ${var__g_sd_buf} + 000c
e0 00                          # 5105 |   push 0
e0 1c 01                       # 5107 |   push 0x1
60 ff 1c 1c                    # 510a |   mov H, 0x1c
5e e0 1e ff                    # 510e |   call [0xff1e]
60 a0 bc 06                    # 5112 |   mov SP, SP + 0x6
                               #      | _Z_syscall_10:
                               #      | _A_call_3:
e0 00                          # 5116 |   push 0
e0 00                          # 5118 |   push 0
5c f8 9d 00                    # 511a |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # 511e |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_syscall_11:
e0 1c 30                       # 5122 |   push 0x30
e0 e0 b6 57                    # 5125 |   push ${var__g_sd_buf} + 0016
e0 e0 90 52                    # 5129 |   push ${var__VIDEO_ROW_BUFFER}
60 ff 1c 0a                    # 512d |   mov H, 0xa
5e e0 1e ff                    # 5131 |   call [0xff1e]
60 a0 bc 06                    # 5135 |   mov SP, SP + 0x6
                               #      | _Z_syscall_11:
60 20 e0 a1 00                 # 5139 |   mov A, 0xa1
60 40 00                       # 513e |   mov B, 0
                               #      | _A_for_1:
c4 80 00                       # 5141 |   inc D, 0
                               #      | _BA_for_1:
fc 80 e0 f8 e2 00 65 00        # 5144 |   jge D, 0xe2, ${_C_for_1}:rel + PC
                               #      | _A_syscall_12:
e0 70                          # 514c |   push C + D
e0 1c 01                       # 514e |   push 0x1
e0 e0 00 02                    # 5151 |   push 0x200
e0 e0 a0 57                    # 5155 |   push ${var__g_sd_buf}
60 ff 1c 14                    # 5159 |   mov H, 0x14
5e e0 1e ff                    # 515d |   call [0xff1e]
60 a0 bc 08                    # 5161 |   mov SP, SP + 0x8
                               #      | _Z_syscall_12:
54 e0 e0 00 b0 59 b0 5b        # 5165 |   mmap ${var__g_vid_chunk}, ${var__g_vid_chunk} + 0200, 0
                               #      | _A_syscall_13:
e0 e0 00 02                    # 516d |   push 0x200
e0 e0 a0 57                    # 5171 |   push ${var__g_sd_buf}
e0 e0 b0 59                    # 5175 |   push ${var__g_vid_chunk}
60 ff 1c 0a                    # 5179 |   mov H, 0xa
5e e0 1e ff                    # 517d |   call [0xff1e]
60 a0 bc 06                    # 5181 |   mov SP, SP + 0x6
                               #      | _Z_syscall_13:
ac ff 20 1c 0f                 # 5185 |   and H, A, 0xf
28 ff 1c 01                    # 518a |   shl H, 0x1
                               #      | _A_if_4:
f4 ff 1c f8 07 0f 00           # 518e |   jle H, 0x7, ${_E_if_4}:rel + PC
c4 ff 00                       # 5195 |   inc H, 0
60 40 e8 00 02                 # 5198 |   mov B, 0x200 + B
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
b0 20 e0 ff a0 00              # 519d |   or A, 0xa0, H
                               #      | _BZ_for_1:
44 80                          # 51a3 |   inc D
58 f8 9f ff                    # 51a5 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
d4 00                          # 51a9 |   umap 0
c4 fe 00                       # 51ab |   inc G, 0
                               #      | _cleanup_fn_show_image:
e4 20                          # 51ae |   pop A
e4 40                          # 51b0 |   pop B
e4 60                          # 51b2 |   pop C
e4 80                          # 51b4 |   pop D
dc                             # 51b6 |   ret
                               #      | _end_fn_show_image:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # 51b7 |   push B
e0 20                          # 51b9 |   push A
61 20 bc 08                    # 51bb |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # 51bf |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # 51c4 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 90 52 8f 57 01     # 51cb |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # 51d4 |   pop A
e4 40                          # 51d6 |   pop B
dc                             # 51d8 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_main_loop:
                               #      | _begin_fn_main_loop:
e0 20                          # 51d9 |   push A
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
61 20 e0 0e ff                 # 51db |   mov A, [0xff0e]
                               #      | _A_if_5:
e9 20 e0 f8 b2 5b 39 00        # 51e0 |   jeq A, [${var__var_2}], ${_E_if_5}:rel + PC
62 e0 20 b2 5b                 # 51e8 |   mov [${var__var_2}], A
98 fe 20 1c 0c                 # 51ed |   getb G, A, 0xc
                               #      | _A_if_6:
e8 fe 00 f8 11 00              # 51f2 |   jeq G, 0, ${_E_if_6}:rel + PC
                               #      | _A_call_6:
e0 1c 01                       # 51f8 |   push 0x1
5c f8 25 00                    # 51fb |   call ${fn_move_slot}:rel + PC
60 a0 bc 02                    # 51ff |   mov SP, SP + 0x2
                               #      | _Z_call_6:
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
98 fe 20 1c 09                 # 5203 |   getb G, A, 0x9
                               #      | _A_if_8:
e8 fe 00 f8 11 00              # 5208 |   jeq G, 0, ${_E_if_8}:rel + PC
                               #      | _A_call_7:
e0 1c ff                       # 520e |   push -1
5c f8 0f 00                    # 5211 |   call ${fn_move_slot}:rel + PC
60 a0 bc 02                    # 5215 |   mov SP, SP + 0x2
                               #      | _Z_call_7:
                               #      | _E_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _BZ_loop_1:
58 f8 c2 ff                    # 5219 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_main_loop:
e4 20                          # 521d |   pop A
dc                             # 521f |   ret
                               #      | _end_fn_main_loop:
                               #      | 
                               #      | fn_move_slot:
                               #      | _begin_fn_move_slot:
e0 20                          # 5220 |   push A
61 20 e0 90 57                 # 5222 |   mov A, [${var__var_1}]
01 20 bc 04                    # 5227 |   add A, [SP + 0x4]
                               #      | _A_call_5:
e0 20                          # 522b |   push A
5c f8 56 fe                    # 522d |   call ${fn_show_image}:rel + PC
60 a0 bc 02                    # 5231 |   mov SP, SP + 0x2
                               #      | _Z_call_5:
                               #      | _A_if_7:
ec fe 1c f8 01 10 00           # 5235 |   jne G, 0x1, ${_E_if_7}:rel + PC
62 e0 20 90 57                 # 523c |   mov [${var__var_1}], A
58 f8 20 00                    # 5241 |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
                               #      | _A_syscall_14:
60 ff 1c 1a                    # 5245 |   mov H, 0x1a
5e e0 1e ff                    # 5249 |   call [0xff1e]
                               #      | _Z_syscall_14:
                               #      | _A_syscall_15:
e0 e0 85 52                    # 524d |   push ${const__data_5}
e0 00                          # 5251 |   push 0
e0 00                          # 5253 |   push 0
60 ff 1c 1c                    # 5255 |   mov H, 0x1c
5e e0 1e ff                    # 5259 |   call [0xff1e]
60 a0 bc 06                    # 525d |   mov SP, SP + 0x6
                               #      | _Z_syscall_15:
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _cleanup_fn_move_slot:
e4 20                          # 5261 |   pop A
dc                             # 5263 |   ret
                               #      | _end_fn_move_slot:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
49 6d 67 20 56 69 65 77 00     # 5264 |   .data str:"Img View"
                               #      | const__data_2:
53 44 20 45 72 72 6f 72 00     # 526d |   .data str:"SD Error"
                               #      | const__data_3:
53 44 20 4f 6b 61 79 00        # 5276 |   .data str:"SD Okay"
                               #      | const__data_4:
25 78 20 25 78 0a 00           # 527e |   .data str:"%x %x\n"
                               #      | const__data_5:
54 68 65 20 65 6e 64 21 00     # 5285 |   .data str:"The end!"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x528e
                               #      | SECTION_BEGIN_static_data:
                               # 528e |   .align dummy_size:2 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # 5290 |   .bss size:1280 align:16
                               #      | var__var_1:
                               # 5790 |   .bss size:2 align:1
                               # 5792 |   .align dummy_size:14 align:16
                               #      | var__g_sd_buf:
                               # 57a0 |   .bss size:514 align:16
                               # 59a2 |   .align dummy_size:14 align:16
                               #      | var__g_vid_chunk:
                               # 59b0 |   .bss size:514 align:16
                               #      | var__var_2:
                               # 5bb2 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
