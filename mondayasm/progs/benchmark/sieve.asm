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
e0 60                          # 500a |   push C
e0 40                          # 500c |   push B
e0 20                          # 500e |   push A
                               #      | _A_syscall_1:
e0 e0 99 51                    # 5010 |   push ${const__data_1}
60 ff 1c 11                    # 5014 |   mov H, 0x11
5e e0 1e ff                    # 5018 |   call [0xff1e]
60 a0 bc 02                    # 501c |   mov SP, SP + 0x2
                               #      | _Z_syscall_1:
                               #      | _A_for_1:
60 20 00                       # 5020 |   mov A, 0
                               #      | _BA_for_1:
fc 20 1c f8 05 11 00           # 5023 |   jge A, 0x5, ${_C_for_1}:rel + PC
                               #      | _A_call_4:
5c f8 22 00                    # 502a |   call ${fn_sieve}:rel + PC
                               #      | _Z_call_4:
                               #      | _BZ_for_1:
44 20                          # 502e |   inc A
58 f8 f3 ff                    # 5030 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _A_syscall_4:
e0 ff                          # 5034 |   push H
e0 e0 b5 51                    # 5036 |   push ${const__data_3}
60 ff 00                       # 503a |   mov H, 0
5e e0 1e ff                    # 503d |   call [0xff1e]
60 a0 bc 04                    # 5041 |   mov SP, SP + 0x4
                               #      | _Z_syscall_4:
                               #      | _cleanup_fn_main:
e4 20                          # 5045 |   pop A
e4 40                          # 5047 |   pop B
e4 60                          # 5049 |   pop C
dc                             # 504b |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_sieve:
                               #      | _begin_fn_sieve:
e0 80                          # 504c |   push D
e0 60                          # 504e |   push C
e0 40                          # 5050 |   push B
e0 20                          # 5052 |   push A
                               #      | _A_call_1:
e0 fc                          # 5054 |   push E
e0 fd                          # 5056 |   push F
5c f8 dd 00                    # 5058 |   call ${fn_wait_clean_uart_buffer}:rel + PC
e4 fd                          # 505c |   pop F
e4 fc                          # 505e |   pop E
                               #      | _Z_call_1:
                               #      | _A_call_2:
e0 fc                          # 5060 |   push E
e0 fd                          # 5062 |   push F
5c f8 e3 00                    # 5064 |   call ${fn_print_time}:rel + PC
e4 fd                          # 5068 |   pop F
e4 fc                          # 506a |   pop E
                               #      | _Z_call_2:
                               #      | _A_for_2:
60 20 00                       # 506c |   mov A, 0
                               #      | _BA_for_2:
fc 20 e0 f8 00 20 16 00        # 506f |   jge A, 0x2000, ${_C_for_2}:rel + PC
62 e4 1c c8 51 ff              # 5077 |   mov [${var__is_prime} + A], -1
                               #      | _BZ_for_2:
60 20 3c 02                    # 507d |   mov A, A + 0x2
58 f8 ee ff                    # 5081 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
62 e0 1c c8 51 fc              # 5085 |   mov [${var__is_prime}], -4
                               #      | _A_for_3:
60 20 1c 02                    # 508b |   mov A, 0x2
                               #      | _BA_for_3:
fc 20 e0 f8 ff 00 4d 00        # 508f |   jge A, 0xff, ${_C_for_3}:rel + PC
a0 40 20 1c 04                 # 5097 |   shr B, A, 0x4
28 40 1c 01                    # 509c |   shl B, 0x1
99 60 e8 20 c8 51              # 50a0 |   getb C, [${var__is_prime} + B], A
e8 60 00 f8 30 00              # 50a6 |   jeq C, 0, ${_BZ_for_3}:rel + PC
88 fe 20 20                    # 50ac |   mul G, A, A
                               #      | _A_for_4:
60 80 fe                       # 50b0 |   mov D, G
                               #      | _BA_for_4:
fc 80 e0 f8 e9 fd 23 00        # 50b3 |   jge D, 0xfde9, ${_C_for_4}:rel + PC
a0 40 80 1c 04                 # 50bb |   shr B, D, 0x4
28 40 1c 01                    # 50c0 |   shl B, 0x1
ac 60 80 1c 0f                 # 50c4 |   and C, D, 0xf
1e e8 7c c8 51 10              # 50c9 |   setb [${var__is_prime} + B], C + 0x10
                               #      | _BZ_for_4:
60 80 84                       # 50cf |   mov D, D + A
58 f8 e1 ff                    # 50d2 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _BZ_for_3:
44 20                          # 50d6 |   inc A
58 f8 b7 ff                    # 50d8 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
60 80 00                       # 50dc |   mov D, 0
                               #      | _A_for_5:
60 20 00                       # 50df |   mov A, 0
                               #      | _BA_for_5:
fc 20 e0 f8 e9 fd 25 00        # 50e2 |   jge A, 0xfde9, ${_C_for_5}:rel + PC
a0 40 20 1c 04                 # 50ea |   shr B, A, 0x4
28 40 1c 01                    # 50ef |   shl B, 0x1
99 60 e8 20 c8 51              # 50f3 |   getb C, [${var__is_prime} + B], A
e8 60 00 f8 08 00              # 50f9 |   jeq C, 0, ${_BZ_for_5}:rel + PC
44 80                          # 50ff |   inc D
                               #      | _BZ_for_5:
44 20                          # 5101 |   inc A
58 f8 df ff                    # 5103 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _A_call_3:
e0 fc                          # 5107 |   push E
e0 fd                          # 5109 |   push F
5c f8 3c 00                    # 510b |   call ${fn_print_time}:rel + PC
e4 fd                          # 510f |   pop F
e4 fc                          # 5111 |   pop E
                               #      | _Z_call_3:
                               #      | _A_syscall_3:
e0 fc                          # 5113 |   push E
e0 fd                          # 5115 |   push F
e0 1c 0a                       # 5117 |   push 0xa
c4 ff 00                       # 511a |   inc H, 0
5e e0 1e ff                    # 511d |   call [0xff1e]
60 a0 bc 02                    # 5121 |   mov SP, SP + 0x2
e4 fd                          # 5125 |   pop F
e4 fc                          # 5127 |   pop E
                               #      | _Z_syscall_3:
60 ff 80                       # 5129 |   mov H, D
                               #      | _cleanup_fn_sieve:
e4 20                          # 512c |   pop A
e4 40                          # 512e |   pop B
e4 60                          # 5130 |   pop C
e4 80                          # 5132 |   pop D
dc                             # 5134 |   ret
                               #      | _end_fn_sieve:
                               #      | 
                               #      | fn_wait_clean_uart_buffer:
                               #      | _begin_fn_wait_clean_uart_buffer:
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 40           # 5135 |   and H, [0xff04], 0x40
ec ff 00 f8 0a 00              # 513c |   jne H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # 5142 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      | _cleanup_fn_wait_clean_uart_buffer:
dc                             # 5146 |   ret
                               #      | _end_fn_wait_clean_uart_buffer:
                               #      | 
                               #      | fn_print_time:
                               #      | _begin_fn_print_time:
e0 80                          # 5147 |   push D
e0 60                          # 5149 |   push C
e0 40                          # 514b |   push B
e0 20                          # 514d |   push A
61 20 e0 10 ff                 # 514f |   mov A, [0xff10]
61 40 e0 12 ff                 # 5154 |   mov B, [0xff12]
61 60 e0 14 ff                 # 5159 |   mov C, [0xff14]
61 80 e0 16 ff                 # 515e |   mov D, [0xff16]
61 fc e0 18 ff                 # 5163 |   mov E, [0xff18]
61 fd e0 1a ff                 # 5168 |   mov F, [0xff1a]
                               #      | _A_syscall_2:
e0 fc                          # 516d |   push E
e0 fd                          # 516f |   push F
e0 80                          # 5171 |   push D
e0 fc                          # 5173 |   push E
e0 fd                          # 5175 |   push F
e0 20                          # 5177 |   push A
e0 40                          # 5179 |   push B
e0 60                          # 517b |   push C
e0 e0 a4 51                    # 517d |   push ${const__data_2}
60 ff 00                       # 5181 |   mov H, 0
5e e0 1e ff                    # 5184 |   call [0xff1e]
60 a0 bc 0e                    # 5188 |   mov SP, SP + 0xe
e4 fd                          # 518c |   pop F
e4 fc                          # 518e |   pop E
                               #      | _Z_syscall_2:
                               #      | _cleanup_fn_print_time:
e4 20                          # 5190 |   pop A
e4 40                          # 5192 |   pop B
e4 60                          # 5194 |   pop C
e4 80                          # 5196 |   pop D
dc                             # 5198 |   ret
                               #      | _end_fn_print_time:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
66 69 6e 64 5f 66 69 62 3a 0a 00 # 5199 |   .data str:"find_fib:\n"
                               #      | const__data_2:
25 78 25 78 25 78 2c 20 25 78 25 78 25 78 2c 20 00 # 51a4 |   .data str:"%x%x%x, %x%x%x, "
                               #      | const__data_3:
0a 0a 4e 75 6d 20 70 72 69 6d 65 73 20 3d 20 25 64 0a 00 # 51b5 |   .data str:"\n\nNum primes = %d\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x51c8
                               #      | SECTION_BEGIN_static_data:
                               #      | var__is_prime:
                               # 51c8 |   .bss size:8192 align:1
                               #      | SECTION_END_static_data:
                               #      | 
