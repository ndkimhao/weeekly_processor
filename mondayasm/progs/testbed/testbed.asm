                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_7:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_7:
d8                             # a009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # a00a |   push B
e0 20                          # a00c |   push A
60 20 e0 39 30                 # a00e |   mov A, 0x3039
60 40 e0 c8 01                 # a013 |   mov B, 0x1c8
                               #      | _A_call_5:
e0 e0 66 a5                    # a018 |   push 0xa566
e0 e0 43 01                    # a01c |   push 0x143
e0 40                          # a020 |   push B
e0 20                          # a022 |   push A
e0 e0 7b a1                    # a024 |   push ${const_data_1}
5c f8 1d 00                    # a028 |   call ${fn_printf}:rel + PC
60 a0 bc 0a                    # a02c |   mov SP, SP + 0xa
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 40                          # a030 |   push B
e0 20                          # a032 |   push A
e0 e0 a3 a1                    # a034 |   push ${const_data_2}
5c f8 0d 00                    # a038 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a03c |   mov SP, SP + 0x6
                               #      | _Z_call_6:
                               #      | _cleanup_fn_main:
e4 20                          # a040 |   pop A
e4 40                          # a042 |   pop B
dc                             # a044 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 80                          # a045 |   push D
e0 60                          # a047 |   push C
e0 40                          # a049 |   push B
e0 20                          # a04b |   push A
60 a0 bc fa                    # a04d |   mov SP, SP + -6
                               #      |   # For each letter in fmt
60 40 bc 12                    # a051 |   mov B, SP + 0x12
                               #      | _A_for_1:
61 20 bc 10                    # a055 |   mov A, [SP + 0x10]
                               #      | _BA_for_1:
65 60 20                       # a059 |   bmov C, [A]
e8 60 00 f8 8c 00              # a05c |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # a062 |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # a069 |   push C
5c f8 8a 00                    # a06b |   call ${fn_send_char}:rel + PC
60 a0 bc 02                    # a06f |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 6f 00                    # a073 |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # a077 |   inc A
65 60 20                       # a079 |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # a07c |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 66 00                    # a082 |   jmp ${_C_for_1}:rel + PC
58 f8 5c 00                    # a086 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 64 37 00           # a08a |   jne C, 0x64, ${_E2_if_4}:rel + PC
                               #      |   # format %d
                               #      | _A_call_2:
e0 a0                          # a091 |   push SP
e2 40                          # a093 |   push [B]
5c f8 78 00                    # a095 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # a099 |   mov SP, SP + 0x4
                               #      | _Z_call_2:
                               #      | _A_for_2:
60 80 a0                       # a09d |   mov D, SP
                               #      | _BA_for_2:
65 ff 80                       # a0a0 |   bmov H, [D]
e8 ff 00 f8 16 00              # a0a3 |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_3:
e0 ff                          # a0a9 |   push H
5c f8 4a 00                    # a0ab |   call ${fn_send_char}:rel + PC
60 a0 bc 02                    # a0af |   mov SP, SP + 0x2
                               #      | _Z_call_3:
                               #      | _BZ_for_2:
44 80                          # a0b3 |   inc D
58 f8 eb ff                    # a0b5 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
60 40 5c 02                    # a0b9 |   mov B, B + 0x2
58 f8 25 00                    # a0bd |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 78 0f 00           # a0c1 |   jne C, 0x78, ${_E3_if_4}:rel + PC
                               #      |   # format %x
60 40 5c 02                    # a0c8 |   mov B, B + 0x2
58 f8 16 00                    # a0cc |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 25 12 00           # a0d0 |   jne C, 0x25, ${_E4_if_4}:rel + PC
                               #      |   # format %%
                               #      | _A_call_4:
e0 1c 25                       # a0d7 |   push 0x25
5c f8 1b 00                    # a0da |   call ${fn_send_char}:rel + PC
60 a0 bc 02                    # a0de |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _E4_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _BZ_for_1:
44 20                          # a0e2 |   inc A
58 f8 75 ff                    # a0e4 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 06                    # a0e8 |   mov SP, SP + 0x6
e4 20                          # a0ec |   pop A
e4 40                          # a0ee |   pop B
e4 60                          # a0f0 |   pop C
e4 80                          # a0f2 |   pop D
dc                             # a0f4 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_send_char:
                               #      | _begin_fn_send_char:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a0f5 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a0fc |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a102 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a106 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_send_char:
dc                             # a10c |   ret
                               #      | _end_fn_send_char:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # a10d |   push C
e0 40                          # a10f |   push B
e0 20                          # a111 |   push A
61 20 bc 0a                    # a113 |   mov A, [SP + 0xa]
62 20 1c 30                    # a117 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # a11b |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 3a 00              # a11f |   jeq B, 0, ${_C_while_1}:rel + PC
88 fe 40 e0 99 19              # a125 |   mul G, B, 0x1999
60 60 ff                       # a12b |   mov C, H
88 fe ff 1c 0a                 # a12e |   mul G, H, 0xa
84 ff 40 fe                    # a133 |   sub H, B, G
                               #      | _A_if_5:
f8 fe 5c f8 f6 14 00           # a137 |   jgt G, B + -10, ${_E_if_5}:rel + PC
f0 40 1c f8 0a 0d 00           # a13e |   jlt B, 0xa, ${_C_if_5}:rel + PC
44 60                          # a145 |   inc C
04 ff 1c 0a                    # a147 |   sub H, 0xa
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
82 20 ff 1c 30                 # a14b |   add [A], H, 0x30
44 20                          # a150 |   inc A
60 40 60                       # a152 |   mov B, C
                               #      | _BZ_while_1:
58 f8 ca ff                    # a155 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # a159 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # a15d |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # a163 |   dec A
61 40 60                       # a165 |   mov B, [C]
67 60 20                       # a168 |   bmov [C], [A]
66 20 40                       # a16b |   bmov [A], B
44 60                          # a16e |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # a170 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # a174 |   pop A
e4 40                          # a176 |   pop B
e4 60                          # a178 |   pop C
dc                             # a17a |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_data_1:
48 65 6c 6c 6f 20 57 6f 72 6c 64 3a 20 25 25 61 3d 25 64 20 25 25 62 3d 25 78 20 76 31 3d 25 64 20 76 32 3d 25 64 0a 00 # a17b |   .data str:"Hello World: %%a=%d %%b=%x v1=%d v2=%d\n"
                               #      | const_data_2:
66 72 6f 6d 20 73 6f 65 75 6e 61 73 6d 20 69 6d 70 6f 72 74 20 63 61 6c 6c 2c 20 68 61 6c 74 2c 20 69 6e 69 74 5f 63 6f 64 65 5f 67 65 6e 2c 20 52 65 67 0a 00 # a1a3 |   .data str:"from soeunasm import call, halt, init_code_gen, Reg\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
