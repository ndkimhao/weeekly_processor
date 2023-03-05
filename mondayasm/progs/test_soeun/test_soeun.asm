                               #      | .config CODE_OFFSET 0xd000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 bc fc                    # d000 |   mov SP, SP + -4
0b 40 60                       # d004 |   mul [B], [C]
b2 7c 40 20 64                 # d007 |   or [C + 0x64], B, A
44 20                          # d00c |   inc A
c4 40 20                       # d00e |   inc B, A
46 7c 64                       # d011 |   inc [C + 0x64]
c5 60 7c 64                    # d014 |   inc C, [C + 0x64]
48 20                          # d018 |   dec A
c8 40 20                       # d01a |   dec B, A
4a 7c 64                       # d01d |   dec [C + 0x64]
c9 60 7c 64                    # d020 |   dec C, [C + 0x64]
88 20 40 7c 01                 # d024 |   mul A, B, C + 0x1
66 20 40                       # d029 |   bmov [A], B
                               #      |   # s1 @= 2
62 bc 1c 02 02                 # d02c |   mov [SP + 0x2], 0x2
62 a0 1c 03                    # d031 |   mov [SP], 0x3
                               #      | _A_if_1:
e0 20                          # d035 |   push A
e0 40                          # d037 |   push B
fc 20 40 f8 17 00              # d039 |   jge A, B, ${_E_if_1}:rel + PC
62 bc 1c 06 04                 # d03f |   mov [SP + 0x6], 0x4
62 bc 1c 04 05                 # d044 |   mov [SP + 0x4], 0x5
60 20 40                       # d049 |   mov A, B
58 f8 20 00                    # d04c |   jmp ${_C_if_1}:rel + PC
                               #      | _E_if_1:
ec 40 1c f8 02 19 00           # d050 |   jne B, 0x2, ${_E2_if_1}:rel + PC
60 20 41                       # d057 |   mov A, B*2
                               #      | _A_if_2:
ec 40 1c f8 03 0b 00           # d05a |   jne B, 0x3, ${_E_if_2}:rel + PC
58 f8 0b 00                    # d061 |   jmp ${_C_if_1}:rel + PC
                               #      | _E_if_2:
                               #      | _Z_if_2:
58 f8 07 00                    # d065 |   jmp ${_C_if_1}:rel + PC
                               #      | _E2_if_1:
c4 20 40                       # d069 |   inc A, B
                               #      | _C_if_1:
e4 40                          # d06c |   pop B
e4 20                          # d06e |   pop A
                               #      | _Z_if_1:
                               #      | test:
50 20 40                       # d070 |   cmp A, B
6a f8 fd ff                    # d073 |   jeq [${test}:rel + PC]
e8 20 40 f8 f9 ff              # d077 |   jeq A, B, ${test}:rel + PC
                               #      | _A_scope_1:
e0 40                          # d07d |   push B
e0 60                          # d07f |   push C
60 20 28                       # d081 |   mov A, A + B
fa 3c e0 f8 01 e8 03 0d 00     # d084 |   jgt [A + 0x1], 0x3e8, ${_C_scope_1}:rel + PC
81 40 20 2c                    # d08d |   add B, [A], A + C
                               #      | _C_scope_1:
60 20 00                       # d091 |   mov A, 0
e4 60                          # d094 |   pop C
e4 40                          # d096 |   pop B
                               #      | _Z_scope_1:
                               #      | _A_for_1:
e0 60                          # d098 |   push C
                               #      | _BA_for_1:
fc 20 1c f8 0a 28 00           # d09a |   jge A, 0xa, ${_C_for_1}:rel + PC
60 40 41                       # d0a1 |   mov B, B*2
                               #      | _A_if_5:
ec 40 e0 f8 d2 04 10 00        # d0a4 |   jne B, 0x4d2, ${_E_if_5}:rel + PC
60 60 1c 64                    # d0ac |   mov C, 0x64
58 f8 12 00                    # d0b0 |   jmp ${_C_for_1}:rel + PC
                               #      | _E_if_5:
                               #      | _Z_if_5:
58 f8 08 00                    # d0b4 |   jmp ${_BZ_for_1}:rel + PC
88 40 60 20                    # d0b8 |   mul B, C, A
                               #      |   # test comment
                               #      | _BZ_for_1:
44 20                          # d0bc |   inc A
58 f8 dc ff                    # d0be |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
c4 20 00                       # d0c2 |   inc A, 0
e4 60                          # d0c5 |   pop C
                               #      | _Z_for_1:
                               #      | _A_while_1:
e0 60                          # d0c7 |   push C
                               #      | _BA_while_1:
fc 20 1c f8 0a 1c 00           # d0c9 |   jge A, 0xa, ${_C_while_1}:rel + PC
44 20                          # d0d0 |   inc A
e8 40 1c f8 64 13 00           # d0d2 |   jeq B, 0x64, ${_C_while_1}:rel + PC
58 f8 f0 ff                    # d0d9 |   jmp ${_BA_while_1}:rel + PC
60 20 3c 02                    # d0dd |   mov A, A + 0x2
                               #      | _BZ_while_1:
58 f8 e8 ff                    # d0e1 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
e4 60                          # d0e5 |   pop C
                               #      | _Z_while_1:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
