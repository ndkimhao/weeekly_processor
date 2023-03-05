                               #      | .config CODE_OFFSET 0xd000
                               #      | 
                               #      | SECTION_BEGIN_boot:
0b 40 60                       # d000 |   mul [B], [C]
b2 7c 40 20 64                 # d003 |   or [C + 0x64], B, A
44 20                          # d008 |   inc A
c4 40 20                       # d00a |   inc B, A
46 7c 64                       # d00d |   inc [C + 0x64]
c5 60 7c 64                    # d010 |   inc C, [C + 0x64]
48 20                          # d014 |   dec A
c8 40 20                       # d016 |   dec B, A
4a 7c 64                       # d019 |   dec [C + 0x64]
c9 60 7c 64                    # d01c |   dec C, [C + 0x64]
88 20 40 7c 01                 # d020 |   mul A, B, C + 0x1
66 20 40                       # d025 |   bmov [A], B
                               #      | _A_if_1:
e0 20                          # d028 |   push A
e0 40                          # d02a |   push B
fc 20 40 f8 0d 00              # d02c |   jge A, B, ${_E_if_1}:rel + PC
60 20 40                       # d032 |   mov A, B
58 f8 20 00                    # d035 |   jmp ${_C_if_1}:rel + PC
                               #      | _E_if_1:
ec 40 1c f8 02 19 00           # d039 |   jne B, 0x2, ${_E2_if_1}:rel + PC
60 20 41                       # d040 |   mov A, B*2
                               #      | _A_if_2:
ec 40 1c f8 03 0b 00           # d043 |   jne B, 0x3, ${_E_if_2}:rel + PC
58 f8 0b 00                    # d04a |   jmp ${_C_if_1}:rel + PC
                               #      | _E_if_2:
                               #      | _Z_if_2:
58 f8 07 00                    # d04e |   jmp ${_C_if_1}:rel + PC
                               #      | _E2_if_1:
c4 20 40                       # d052 |   inc A, B
                               #      | _C_if_1:
e4 40                          # d055 |   pop B
e4 20                          # d057 |   pop A
                               #      | _Z_if_1:
                               #      | test:
50 20 40                       # d059 |   cmp A, B
6a f8 fd ff                    # d05c |   jeq [${test}:rel + PC]
e8 20 40 f8 f9 ff              # d060 |   jeq A, B, ${test}:rel + PC
                               #      | _A_scope_1:
e0 40                          # d066 |   push B
e0 60                          # d068 |   push C
60 20 28                       # d06a |   mov A, A + B
f8 20 e0 f8 e8 03 0c 00        # d06d |   jgt A, 0x3e8, ${_C_scope_1}:rel + PC
81 40 20 2c                    # d075 |   add B, [A], A + C
                               #      | _C_scope_1:
60 20 00                       # d079 |   mov A, 0
e4 60                          # d07c |   pop C
e4 40                          # d07e |   pop B
                               #      | _Z_scope_1:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
