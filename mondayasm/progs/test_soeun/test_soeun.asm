                               #      | .config CODE_OFFSET 0xd000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | _A_call_2:
5c f8 04 00                    # d000 |   call ${fn_main}:rel + PC
                               #      | _Z_call_2:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
60 a0 bc fc                    # d004 |   mov SP, SP + -4
0b 40 60                       # d008 |   mul [B], [C]
b2 7c 40 20 64                 # d00b |   or [C + 0x64], B, A
44 20                          # d010 |   inc A
c4 40 20                       # d012 |   inc B, A
46 7c 64                       # d015 |   inc [C + 0x64]
c5 60 7c 64                    # d018 |   inc C, [C + 0x64]
48 20                          # d01c |   dec A
c8 40 20                       # d01e |   dec B, A
4a 7c 64                       # d021 |   dec [C + 0x64]
c9 60 7c 64                    # d024 |   dec C, [C + 0x64]
88 20 40 7c 01                 # d028 |   mul A, B, C + 0x1
66 20 40                       # d02d |   bmov [A], B
                               #      |   # s1 @= 2
62 bc 1c 02 02                 # d030 |   mov [SP + 0x2], 0x2
62 a0 1c 03                    # d035 |   mov [SP], 0x3
                               #      | _A_if_1:
e0 20                          # d039 |   push A
e0 40                          # d03b |   push B
fc 20 40 f8 25 00              # d03d |   jge A, B, ${_E_if_1}:rel + PC
62 bc 1c 06 04                 # d043 |   mov [SP + 0x6], 0x4
62 bc 1c 04 05                 # d048 |   mov [SP + 0x4], 0x5
                               #      | _A_scope_1:
e0 60                          # d04d |   push C
                               #      | _B_scope_1:
62 bc 1c 08 06                 # d04f |   mov [SP + 0x8], 0x6
                               #      | _C_scope_1:
e4 60                          # d054 |   pop C
                               #      | _Z_scope_1:
62 bc 1c 06 06                 # d056 |   mov [SP + 0x6], 0x6
60 20 40                       # d05b |   mov A, B
58 f8 20 00                    # d05e |   jmp ${_C_if_1}:rel + PC
                               #      | _E_if_1:
ec 40 1c f8 02 19 00           # d062 |   jne B, 0x2, ${_E2_if_1}:rel + PC
60 20 41                       # d069 |   mov A, B*2
                               #      | _A_if_2:
ec 40 1c f8 03 0b 00           # d06c |   jne B, 0x3, ${_E_if_2}:rel + PC
58 f8 0b 00                    # d073 |   jmp ${_C_if_1}:rel + PC
                               #      | _E_if_2:
                               #      | _Z_if_2:
58 f8 07 00                    # d077 |   jmp ${_C_if_1}:rel + PC
                               #      | _E2_if_1:
c4 20 40                       # d07b |   inc A, B
                               #      | _C_if_1:
e4 40                          # d07e |   pop B
e4 20                          # d080 |   pop A
                               #      | _Z_if_1:
                               #      | test:
50 20 40                       # d082 |   cmp A, B
6a f8 fd ff                    # d085 |   jeq [${test}:rel + PC]
e8 20 40 f8 f9 ff              # d089 |   jeq A, B, ${test}:rel + PC
                               #      | _A_scope_2:
e0 40                          # d08f |   push B
e0 60                          # d091 |   push C
                               #      | _B_scope_2:
60 20 28                       # d093 |   mov A, A + B
fa 3c e0 f8 01 e8 03 15 00     # d096 |   jgt [A + 0x1], 0x3e8, ${_C_scope_2}:rel + PC
81 40 20 2c                    # d09f |   add B, [A], A + C
58 f8 f0 ff                    # d0a3 |   jmp ${_B_scope_2}:rel + PC
58 f8 04 00                    # d0a7 |   jmp ${_C_scope_2}:rel + PC
                               #      | _C_scope_2:
60 20 00                       # d0ab |   mov A, 0
e4 60                          # d0ae |   pop C
e4 40                          # d0b0 |   pop B
                               #      | _Z_scope_2:
                               #      | _A_for_1:
e0 60                          # d0b2 |   push C
                               #      | _BA_for_1:
fc 20 1c f8 0a 28 00           # d0b4 |   jge A, 0xa, ${_C_for_1}:rel + PC
60 40 41                       # d0bb |   mov B, B*2
                               #      | _A_if_5:
ec 40 e0 f8 d2 04 10 00        # d0be |   jne B, 0x4d2, ${_E_if_5}:rel + PC
60 60 1c 64                    # d0c6 |   mov C, 0x64
58 f8 12 00                    # d0ca |   jmp ${_C_for_1}:rel + PC
                               #      | _E_if_5:
                               #      | _Z_if_5:
58 f8 08 00                    # d0ce |   jmp ${_BZ_for_1}:rel + PC
88 40 60 20                    # d0d2 |   mul B, C, A
                               #      |   # test comment
                               #      | _BZ_for_1:
44 20                          # d0d6 |   inc A
58 f8 dc ff                    # d0d8 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
c4 20 00                       # d0dc |   inc A, 0
e4 60                          # d0df |   pop C
                               #      | _Z_for_1:
                               #      | _A_while_1:
e0 60                          # d0e1 |   push C
                               #      | _BA_while_1:
fc 20 1c f8 0a 1c 00           # d0e3 |   jge A, 0xa, ${_C_while_1}:rel + PC
44 20                          # d0ea |   inc A
e8 40 1c f8 64 13 00           # d0ec |   jeq B, 0x64, ${_C_while_1}:rel + PC
58 f8 f0 ff                    # d0f3 |   jmp ${_BA_while_1}:rel + PC
60 20 3c 02                    # d0f7 |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 e8 ff                    # d0fb |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
e4 60                          # d0ff |   pop C
                               #      | _Z_while_1:
                               #      | _A_while_true_1:
e0 60                          # d101 |   push C
                               #      | _BA_while_true_1:
44 20                          # d103 |   inc A
58 f8 fe ff                    # d105 |   jmp ${_BA_while_true_1}:rel + PC
58 f8 08 00                    # d109 |   jmp ${_C_while_true_1}:rel + PC
                               #      | _BZ_while_true_1:
58 f8 f6 ff                    # d10d |   jmp ${_BA_while_true_1}:rel + PC
                               #      | _C_while_true_1:
e4 60                          # d111 |   pop C
                               #      | _Z_while_true_1:
                               #      | _A_call_1:
e0 1c 64                       # d113 |   push 0x64
e0 40                          # d116 |   push B
e0 20                          # d118 |   push A
5c f8 0d 00                    # d11a |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # d11e |   mov SP, SP + 0x6
                               #      | _Z_call_1:
                               #      | _cleanup_fn_main:
60 a0 bc 04                    # d122 |   mov SP, SP + 0x4
dc                             # d126 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
61 fc bc 02                    # d127 |   mov E, [SP + 0x2]
61 fd bc 04                    # d12b |   mov F, [SP + 0x4]
60 fe fc                       # d12f |   mov G, E
01 fe bc 06                    # d132 |   add G, [SP + 0x6]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc fc fe f8 15 00              # d136 |   jge E, G, ${_C_while_2}:rel + PC
63 fc fd                       # d13c |   mov [E], [F]
00 fc 1c 02                    # d13f |   add E, 0x2
00 fd 1c 02                    # d143 |   add F, 0x2
                               #      | _BZ_while_2:
58 f8 ef ff                    # d147 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_memcpy:
dc                             # d14b |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
