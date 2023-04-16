                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 4f                 # 5000 |   mov SP, 0x4ff0
                               #      | _A_call_5:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_5:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 20                          # 500a |   push A
                               #      | _A_syscall_1:
e0 e0 3b 51                    # 500c |   push ${const__data_1}
60 ff 1c 11                    # 5010 |   mov H, 0x11
5e e0 1e ff                    # 5014 |   call [0xff1e]
60 a0 bc 02                    # 5018 |   mov SP, SP + 0x2
                               #      | _Z_syscall_1:
                               #      | _A_for_1:
60 20 00                       # 501c |   mov A, 0
                               #      | _BA_for_1:
fc 20 1c f8 05 11 00           # 501f |   jge A, 0x5, ${_C_for_1}:rel + PC
                               #      | _A_call_4:
5c f8 32 00                    # 5026 |   call ${fn_find_fib}:rel + PC
                               #      | _Z_call_4:
                               #      | _BZ_for_1:
44 20                          # 502a |   inc A
58 f8 f3 ff                    # 502c |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _A_syscall_4:
e0 e0 c5 3f                    # 5030 |   push 0x3fc5
e0 ff                          # 5034 |   push H
e0 e0 57 51                    # 5036 |   push ${const__data_3}
60 ff 00                       # 503a |   mov H, 0
5e e0 1e ff                    # 503d |   call [0xff1e]
60 a0 bc 06                    # 5041 |   mov SP, SP + 0x6
                               #      | _Z_syscall_4:
                               #      | _A_syscall_5:
e0 e0 6d 51                    # 5045 |   push ${const__str____endl__endl}
60 ff 1c 11                    # 5049 |   mov H, 0x11
5e e0 1e ff                    # 504d |   call [0xff1e]
60 a0 bc 02                    # 5051 |   mov SP, SP + 0x2
                               #      | _Z_syscall_5:
                               #      | _cleanup_fn_main:
e4 20                          # 5055 |   pop A
dc                             # 5057 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_find_fib:
                               #      | _begin_fn_find_fib:
e0 80                          # 5058 |   push D
e0 60                          # 505a |   push C
e0 40                          # 505c |   push B
e0 20                          # 505e |   push A
                               #      | _A_call_1:
e0 fc                          # 5060 |   push E
e0 fd                          # 5062 |   push F
5c f8 73 00                    # 5064 |   call ${fn_wait_clean_uart_buffer}:rel + PC
e4 fd                          # 5068 |   pop F
e4 fc                          # 506a |   pop E
                               #      | _Z_call_1:
                               #      | _A_call_2:
e0 fc                          # 506c |   push E
e0 fd                          # 506e |   push F
5c f8 79 00                    # 5070 |   call ${fn_print_time}:rel + PC
e4 fd                          # 5074 |   pop F
e4 fc                          # 5076 |   pop E
                               #      | _Z_call_2:
60 20 00                       # 5078 |   mov A, 0
c4 40 00                       # 507b |   inc B, 0
                               #      | _A_for_2:
60 fc 00                       # 507e |   mov E, 0
                               #      | _BA_for_2:
fc fc e0 f8 90 01 28 00        # 5081 |   jge E, 0x190, ${_C_for_2}:rel + PC
                               #      | _A_for_3:
60 fd 00                       # 5089 |   mov F, 0
                               #      | _BA_for_3:
fc fd e0 f8 50 c3 17 00        # 508c |   jge F, 0xc350, ${_C_for_3}:rel + PC
60 60 28                       # 5094 |   mov C, A + B
60 20 40                       # 5097 |   mov A, B
60 40 60                       # 509a |   mov B, C
                               #      | _BZ_for_3:
44 fd                          # 509d |   inc F
58 f8 ed ff                    # 509f |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _BZ_for_2:
44 fc                          # 50a3 |   inc E
58 f8 dc ff                    # 50a5 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _A_call_3:
e0 fc                          # 50a9 |   push E
e0 fd                          # 50ab |   push F
5c f8 3c 00                    # 50ad |   call ${fn_print_time}:rel + PC
e4 fd                          # 50b1 |   pop F
e4 fc                          # 50b3 |   pop E
                               #      | _Z_call_3:
                               #      | _A_syscall_3:
e0 fc                          # 50b5 |   push E
e0 fd                          # 50b7 |   push F
e0 1c 0a                       # 50b9 |   push 0xa
c4 ff 00                       # 50bc |   inc H, 0
5e e0 1e ff                    # 50bf |   call [0xff1e]
60 a0 bc 02                    # 50c3 |   mov SP, SP + 0x2
e4 fd                          # 50c7 |   pop F
e4 fc                          # 50c9 |   pop E
                               #      | _Z_syscall_3:
60 ff 20                       # 50cb |   mov H, A
                               #      | _cleanup_fn_find_fib:
e4 20                          # 50ce |   pop A
e4 40                          # 50d0 |   pop B
e4 60                          # 50d2 |   pop C
e4 80                          # 50d4 |   pop D
dc                             # 50d6 |   ret
                               #      | _end_fn_find_fib:
                               #      | 
                               #      | fn_wait_clean_uart_buffer:
                               #      | _begin_fn_wait_clean_uart_buffer:
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 40           # 50d7 |   and H, [0xff04], 0x40
ec ff 00 f8 0a 00              # 50de |   jne H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # 50e4 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_wait_clean_uart_buffer:
dc                             # 50e8 |   ret
                               #      | _end_fn_wait_clean_uart_buffer:
                               #      | 
                               #      | fn_print_time:
                               #      | _begin_fn_print_time:
e0 80                          # 50e9 |   push D
e0 60                          # 50eb |   push C
e0 40                          # 50ed |   push B
e0 20                          # 50ef |   push A
61 20 e0 10 ff                 # 50f1 |   mov A, [0xff10]
61 40 e0 12 ff                 # 50f6 |   mov B, [0xff12]
61 60 e0 14 ff                 # 50fb |   mov C, [0xff14]
61 80 e0 16 ff                 # 5100 |   mov D, [0xff16]
61 fc e0 18 ff                 # 5105 |   mov E, [0xff18]
61 fd e0 1a ff                 # 510a |   mov F, [0xff1a]
                               #      | _A_syscall_2:
e0 fc                          # 510f |   push E
e0 fd                          # 5111 |   push F
e0 80                          # 5113 |   push D
e0 fc                          # 5115 |   push E
e0 fd                          # 5117 |   push F
e0 20                          # 5119 |   push A
e0 40                          # 511b |   push B
e0 60                          # 511d |   push C
e0 e0 46 51                    # 511f |   push ${const__data_2}
60 ff 00                       # 5123 |   mov H, 0
5e e0 1e ff                    # 5126 |   call [0xff1e]
60 a0 bc 0e                    # 512a |   mov SP, SP + 0xe
e4 fd                          # 512e |   pop F
e4 fc                          # 5130 |   pop E
                               #      | _Z_syscall_2:
                               #      | _cleanup_fn_print_time:
e4 20                          # 5132 |   pop A
e4 40                          # 5134 |   pop B
e4 60                          # 5136 |   pop C
e4 80                          # 5138 |   pop D
dc                             # 513a |   ret
                               #      | _end_fn_print_time:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
66 69 6e 64 5f 66 69 62 3a 0a 00 # 513b |   .data str:"find_fib:\n"
                               #      | const__data_2:
25 78 25 78 25 78 2c 20 25 78 25 78 25 78 2c 20 00 # 5146 |   .data str:"%x%x%x, %x%x%x, "
                               #      | const__data_3:
72 65 73 20 3d 20 25 64 2c 20 74 72 75 74 68 20 3d 20 25 64 0a 00 # 5157 |   .data str:"res = %d, truth = %d\n"
                               #      | const__str____endl__endl:
0a 0a 00                       # 516d |   .data str:"\n\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5170
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
