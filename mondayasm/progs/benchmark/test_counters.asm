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
                               #      | _A_for_1:
60 20 00                       # 500c |   mov A, 0
                               #      | _BA_for_1:
fc 20 1c f8 05 25 00           # 500f |   jge A, 0x5, ${_C_for_1}:rel + PC
                               #      | _A_call_2:
5c f8 21 00                    # 5016 |   call ${fn_test_clk}:rel + PC
                               #      | _Z_call_2:
                               #      | _A_call_4:
5c f8 aa 00                    # 501a |   call ${fn_test_inst}:rel + PC
                               #      | _Z_call_4:
                               #      | _A_syscall_5:
e0 e0 3b 51                    # 501e |   push ${const__str____endl}
60 ff 1c 11                    # 5022 |   mov H, 0x11
5e e0 1e ff                    # 5026 |   call [0xff1e]
60 a0 bc 02                    # 502a |   mov SP, SP + 0x2
                               #      | _Z_syscall_5:
                               #      | _BZ_for_1:
44 20                          # 502e |   inc A
58 f8 df ff                    # 5030 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_main:
e4 20                          # 5034 |   pop A
dc                             # 5036 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_test_clk:
                               #      | _begin_fn_test_clk:
e0 80                          # 5037 |   push D
e0 60                          # 5039 |   push C
e0 40                          # 503b |   push B
e0 20                          # 503d |   push A
61 40 e0 10 ff                 # 503f |   mov B, [0xff10]
61 60 e0 12 ff                 # 5044 |   mov C, [0xff12]
61 80 e0 14 ff                 # 5049 |   mov D, [0xff14]
                               #      | _A_syscall_1:
e0 40                          # 504e |   push B
e0 60                          # 5050 |   push C
e0 80                          # 5052 |   push D
e0 e0 1c 51                    # 5054 |   push ${const__data_1}
60 ff 00                       # 5058 |   mov H, 0
5e e0 1e ff                    # 505b |   call [0xff1e]
60 a0 bc 08                    # 505f |   mov SP, SP + 0x8
                               #      | _Z_syscall_1:
                               #      | _A_call_1:
5c f8 2c 00                    # 5063 |   call ${fn_delay_raw}:rel + PC
                               #      | _Z_call_1:
61 60 e0 12 ff                 # 5067 |   mov C, [0xff12]
61 80 e0 14 ff                 # 506c |   mov D, [0xff14]
                               #      | _A_syscall_2:
e0 40                          # 5071 |   push B
e0 60                          # 5073 |   push C
e0 80                          # 5075 |   push D
e0 e0 1c 51                    # 5077 |   push ${const__data_1}
60 ff 00                       # 507b |   mov H, 0
5e e0 1e ff                    # 507e |   call [0xff1e]
60 a0 bc 08                    # 5082 |   mov SP, SP + 0x8
                               #      | _Z_syscall_2:
                               #      | _cleanup_fn_test_clk:
e4 20                          # 5086 |   pop A
e4 40                          # 5088 |   pop B
e4 60                          # 508a |   pop C
e4 80                          # 508c |   pop D
dc                             # 508e |   ret
                               #      | _end_fn_test_clk:
                               #      | 
                               #      | fn_delay_raw:
                               #      | _begin_fn_delay_raw:
e0 40                          # 508f |   push B
e0 20                          # 5091 |   push A
                               #      | _A_for_2:
60 20 00                       # 5093 |   mov A, 0
                               #      | _BA_for_2:
fc 20 1c f8 fe 24 00           # 5096 |   jge A, -2, ${_C_for_2}:rel + PC
                               #      | _A_for_3:
60 40 00                       # 509d |   mov B, 0
                               #      | _BA_for_3:
fc 40 1c f8 20 14 00           # 50a0 |   jge B, 0x20, ${_C_for_3}:rel + PC
a2 e0 20 1c 0a ff 08           # 50a7 |   shr [0xff0a], A, 0x8
                               #      | _BZ_for_3:
44 40                          # 50ae |   inc B
58 f8 f0 ff                    # 50b0 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _BZ_for_2:
44 20                          # 50b4 |   inc A
58 f8 e0 ff                    # 50b6 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
62 e0 00 0a ff                 # 50ba |   mov [0xff0a], 0
                               #      | _cleanup_fn_delay_raw:
e4 20                          # 50bf |   pop A
e4 40                          # 50c1 |   pop B
dc                             # 50c3 |   ret
                               #      | _end_fn_delay_raw:
                               #      | 
                               #      | fn_test_inst:
                               #      | _begin_fn_test_inst:
e0 80                          # 50c4 |   push D
e0 60                          # 50c6 |   push C
e0 40                          # 50c8 |   push B
e0 20                          # 50ca |   push A
61 40 e0 16 ff                 # 50cc |   mov B, [0xff16]
61 60 e0 18 ff                 # 50d1 |   mov C, [0xff18]
61 80 e0 1a ff                 # 50d6 |   mov D, [0xff1a]
                               #      | _A_syscall_3:
e0 40                          # 50db |   push B
e0 60                          # 50dd |   push C
e0 80                          # 50df |   push D
e0 e0 2b 51                    # 50e1 |   push ${const__data_2}
60 ff 00                       # 50e5 |   mov H, 0
5e e0 1e ff                    # 50e8 |   call [0xff1e]
60 a0 bc 08                    # 50ec |   mov SP, SP + 0x8
                               #      | _Z_syscall_3:
                               #      | _A_call_3:
5c f8 9f ff                    # 50f0 |   call ${fn_delay_raw}:rel + PC
                               #      | _Z_call_3:
61 60 e0 18 ff                 # 50f4 |   mov C, [0xff18]
61 80 e0 1a ff                 # 50f9 |   mov D, [0xff1a]
                               #      | _A_syscall_4:
e0 40                          # 50fe |   push B
e0 60                          # 5100 |   push C
e0 80                          # 5102 |   push D
e0 e0 2b 51                    # 5104 |   push ${const__data_2}
60 ff 00                       # 5108 |   mov H, 0
5e e0 1e ff                    # 510b |   call [0xff1e]
60 a0 bc 08                    # 510f |   mov SP, SP + 0x8
                               #      | _Z_syscall_4:
                               #      | _cleanup_fn_test_inst:
e4 20                          # 5113 |   pop A
e4 40                          # 5115 |   pop B
e4 60                          # 5117 |   pop C
e4 80                          # 5119 |   pop D
dc                             # 511b |   ret
                               #      | _end_fn_test_inst:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
43 4c 4b 3a 20 25 78 20 25 78 20 25 78 0a 00 # 511c |   .data str:"CLK: %x %x %x\n"
                               #      | const__data_2:
49 4e 53 54 3a 20 25 78 20 25 78 20 25 78 0a 00 # 512b |   .data str:"INST: %x %x %x\n"
                               #      | const__str____endl:
0a 00                          # 513b |   .data str:"\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x513d
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
