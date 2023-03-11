                               #      | .config CODE_OFFSET 0x5100
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 00 51                 # 5100 |   mov SP, 0x5100
                               #      | _A_call_1:
5c f8 05 00                    # 5105 |   call ${fn_main}:rel + PC
                               #      | _Z_call_1:
d8                             # 5109 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # 510a |   push B
e0 20                          # 510c |   push A
62 e0 e0 0a ff af 00           # 510e |   mov [0xff0a], 0xaf
                               #      | _A_syscall_1:
e0 e0 ff aa                    # 5115 |   push 0xaaff
e0 1c 7b                       # 5119 |   push 0x7b
e0 e0 f7 51                    # 511c |   push ${const__data_1}
60 ff 00                       # 5120 |   mov H, 0
5e e0 1e ff                    # 5123 |   call [0xff1e]
60 a0 bc 06                    # 5127 |   mov SP, SP + 0x6
                               #      | _Z_syscall_1:
                               #      | _A_syscall_2:
e0 e0 ff aa                    # 512b |   push 0xaaff
e0 1c 0b                       # 512f |   push 0xb
e0 e0 03 52                    # 5132 |   push ${const__data_2}
60 ff 00                       # 5136 |   mov H, 0
5e e0 1e ff                    # 5139 |   call [0xff1e]
60 a0 bc 06                    # 513d |   mov SP, SP + 0x6
                               #      | _Z_syscall_2:
                               #      | _A_syscall_3:
e0 e0 ff aa                    # 5141 |   push 0xaaff
e0 1c 16                       # 5145 |   push 0x16
e0 e0 11 52                    # 5148 |   push ${const__data_3}
60 ff 00                       # 514c |   mov H, 0
5e e0 1e ff                    # 514f |   call [0xff1e]
60 a0 bc 06                    # 5153 |   mov SP, SP + 0x6
                               #      | _Z_syscall_3:
                               #      | _A_syscall_4:
e0 e0 ff aa                    # 5157 |   push 0xaaff
e0 1c 16                       # 515b |   push 0x16
e0 e0 1d 52                    # 515e |   push ${const__data_4}
60 ff 1c 11                    # 5162 |   mov H, 0x11
5e e0 1e ff                    # 5166 |   call [0xff1e]
60 a0 bc 06                    # 516a |   mov SP, SP + 0x6
                               #      | _Z_syscall_4:
                               #      | _A_syscall_5:
e0 e0 ff aa                    # 516e |   push 0xaaff
e0 1c 16                       # 5172 |   push 0x16
e0 e0 11 52                    # 5175 |   push ${const__data_3}
60 ff 00                       # 5179 |   mov H, 0
5e e0 1e ff                    # 517c |   call [0xff1e]
60 a0 bc 06                    # 5180 |   mov SP, SP + 0x6
                               #      | _Z_syscall_5:
60 20 e0 1b 8a                 # 5184 |   mov A, 0x8a1b
                               #      | _A_syscall_6:
e0 20                          # 5189 |   push A
e0 e0 2e 52                    # 518b |   push ${const__data_5}
60 ff 00                       # 518f |   mov H, 0
5e e0 1e ff                    # 5192 |   call [0xff1e]
60 a0 bc 04                    # 5196 |   mov SP, SP + 0x4
                               #      | _Z_syscall_6:
94 40 20 1c 04                 # 519a |   ror B, A, 0x4
                               #      | _A_syscall_7:
e0 40                          # 519f |   push B
e0 e0 2e 52                    # 51a1 |   push ${const__data_5}
60 ff 00                       # 51a5 |   mov H, 0
5e e0 1e ff                    # 51a8 |   call [0xff1e]
60 a0 bc 04                    # 51ac |   mov SP, SP + 0x4
                               #      | _Z_syscall_7:
94 40 20 1c 08                 # 51b0 |   ror B, A, 0x8
                               #      | _A_syscall_8:
e0 40                          # 51b5 |   push B
e0 e0 2e 52                    # 51b7 |   push ${const__data_5}
60 ff 00                       # 51bb |   mov H, 0
5e e0 1e ff                    # 51be |   call [0xff1e]
60 a0 bc 04                    # 51c2 |   mov SP, SP + 0x4
                               #      | _Z_syscall_8:
94 40 20 1c 0f                 # 51c6 |   ror B, A, 0xf
                               #      | _A_syscall_9:
e0 40                          # 51cb |   push B
e0 e0 2e 52                    # 51cd |   push ${const__data_5}
60 ff 00                       # 51d1 |   mov H, 0
5e e0 1e ff                    # 51d4 |   call [0xff1e]
60 a0 bc 04                    # 51d8 |   mov SP, SP + 0x4
                               #      | _Z_syscall_9:
94 40 20 1c 10                 # 51dc |   ror B, A, 0x10
                               #      | _A_syscall_10:
e0 40                          # 51e1 |   push B
e0 e0 2e 52                    # 51e3 |   push ${const__data_5}
60 ff 00                       # 51e7 |   mov H, 0
5e e0 1e ff                    # 51ea |   call [0xff1e]
60 a0 bc 04                    # 51ee |   mov SP, SP + 0x4
                               #      | _Z_syscall_10:
                               #      | _cleanup_fn_main:
e4 20                          # 51f2 |   pop A
e4 40                          # 51f4 |   pop B
dc                             # 51f6 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
74 65 73 74 20 25 64 20 25 78 0a 00 # 51f7 |   .data str:"test %d %x\n"
                               #      | const__data_2:
74 65 73 74 20 32 20 25 64 20 25 78 0a 00 # 5203 |   .data str:"test 2 %d %x\n"
                               #      | const__data_3:
6f 6b 61 79 20 25 64 20 25 78 0a 00 # 5211 |   .data str:"okay %d %x\n"
                               #      | const__data_4:
74 65 73 74 20 70 75 74 73 20 25 64 20 25 78 0a 00 # 521d |   .data str:"test puts %d %x\n"
                               #      | const__data_5:
25 78 0a 00                    # 522e |   .data str:"%x\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x5232
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
