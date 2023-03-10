                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 00 50                 # 5000 |   mov SP, 0x5000
                               #      | _A_call_1:
5c f8 05 00                    # 5005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_1:
d8                             # 5009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
                               #      | _A_syscall_1:
e0 e0 ff aa                    # 500a |   push 0xaaff
e0 1c 7b                       # 500e |   push 0x7b
e0 e0 20 50                    # 5011 |   push ${const__data_1}
e0 00                          # 5015 |   push 0
5e e0 00 01                    # 5017 |   call [0x100]
60 a0 bc 08                    # 501b |   mov SP, SP + 0x8
                               #      | _Z_syscall_1:
                               #      | _cleanup_fn_main:
dc                             # 501f |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
74 65 73 74 20 25 64 20 25 78 0a 00 # 5020 |   .data str:"test %d %x\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x502c
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
