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
62 e0 e0 0a ff af 00           # 510a |   mov [0xff0a], 0xaf
                               #      | _A_syscall_1:
e0 e0 ff aa                    # 5111 |   push 0xaaff
e0 1c 7b                       # 5115 |   push 0x7b
e0 e0 81 51                    # 5118 |   push ${const__data_1}
60 ff 00                       # 511c |   mov H, 0
5e e0 1e ff                    # 511f |   call [0xff1e]
60 a0 bc 06                    # 5123 |   mov SP, SP + 0x6
                               #      | _Z_syscall_1:
                               #      | _A_syscall_2:
e0 e0 ff aa                    # 5127 |   push 0xaaff
e0 1c 0b                       # 512b |   push 0xb
e0 e0 8d 51                    # 512e |   push ${const__data_2}
60 ff 00                       # 5132 |   mov H, 0
5e e0 1e ff                    # 5135 |   call [0xff1e]
60 a0 bc 06                    # 5139 |   mov SP, SP + 0x6
                               #      | _Z_syscall_2:
                               #      | _A_syscall_3:
e0 e0 ff aa                    # 513d |   push 0xaaff
e0 1c 16                       # 5141 |   push 0x16
e0 e0 9b 51                    # 5144 |   push ${const__data_3}
60 ff 00                       # 5148 |   mov H, 0
5e e0 1e ff                    # 514b |   call [0xff1e]
60 a0 bc 06                    # 514f |   mov SP, SP + 0x6
                               #      | _Z_syscall_3:
                               #      | _A_syscall_4:
e0 e0 ff aa                    # 5153 |   push 0xaaff
e0 1c 16                       # 5157 |   push 0x16
e0 e0 a7 51                    # 515a |   push ${const__data_4}
60 ff 1c 11                    # 515e |   mov H, 0x11
5e e0 1e ff                    # 5162 |   call [0xff1e]
60 a0 bc 06                    # 5166 |   mov SP, SP + 0x6
                               #      | _Z_syscall_4:
                               #      | _A_syscall_5:
e0 e0 ff aa                    # 516a |   push 0xaaff
e0 1c 16                       # 516e |   push 0x16
e0 e0 9b 51                    # 5171 |   push ${const__data_3}
60 ff 00                       # 5175 |   mov H, 0
5e e0 1e ff                    # 5178 |   call [0xff1e]
60 a0 bc 06                    # 517c |   mov SP, SP + 0x6
                               #      | _Z_syscall_5:
                               #      | _cleanup_fn_main:
dc                             # 5180 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
74 65 73 74 20 25 64 20 25 78 0a 00 # 5181 |   .data str:"test %d %x\n"
                               #      | const__data_2:
74 65 73 74 20 32 20 25 64 20 25 78 0a 00 # 518d |   .data str:"test 2 %d %x\n"
                               #      | const__data_3:
6f 6b 61 79 20 25 64 20 25 78 0a 00 # 519b |   .data str:"okay %d %x\n"
                               #      | const__data_4:
74 65 73 74 20 70 75 74 73 20 25 64 20 25 78 0a 00 # 51a7 |   .data str:"test puts %d %x\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x51b8
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
