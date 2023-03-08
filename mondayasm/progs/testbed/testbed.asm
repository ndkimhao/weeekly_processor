                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_8:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_8:
d8                             # a009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 80                          # a00a |   push D
e0 60                          # a00c |   push C
e0 40                          # a00e |   push B
e0 20                          # a010 |   push A
60 20 e0 39 30                 # a012 |   mov A, 0x3039
60 40 e0 c8 01                 # a017 |   mov B, 0x1c8
90 60 20 40                    # a01c |   div C, A, B
9c 80 20 1c 03                 # a020 |   setb D, A, 0x3
9c fc 20 1c 04                 # a025 |   setb E, A, 0x4
                               #      | _A_call_6:
e0 e0 66 a5                    # a02a |   push 0xa566
e0 e0 43 01                    # a02e |   push 0x143
e0 fc                          # a032 |   push E
e0 80                          # a034 |   push D
e0 ff                          # a036 |   push H
e0 60                          # a038 |   push C
e0 40                          # a03a |   push B
e0 20                          # a03c |   push A
e0 e0 a5 a1                    # a03e |   push ${const_data_1}
5c f8 21 00                    # a042 |   call ${fn_printf}:rel + PC
60 a0 bc 12                    # a046 |   mov SP, SP + 0x12
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 40                          # a04a |   push B
e0 20                          # a04c |   push A
e0 e0 e1 a1                    # a04e |   push ${const_data_2}
5c f8 11 00                    # a052 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a056 |   mov SP, SP + 0x6
                               #      | _Z_call_7:
                               #      | _cleanup_fn_main:
e4 20                          # a05a |   pop A
e4 40                          # a05c |   pop B
e4 60                          # a05e |   pop C
e4 80                          # a060 |   pop D
dc                             # a062 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # a063 |   push C
e0 40                          # a065 |   push B
e0 20                          # a067 |   push A
60 a0 bc fa                    # a069 |   mov SP, SP + -6
                               #      |   # For each letter in fmt
60 40 bc 10                    # a06d |   mov B, SP + 0x10
                               #      | _A_for_1:
61 20 bc 0e                    # a071 |   mov A, [SP + 0xe]
                               #      | _BA_for_1:
65 60 20                       # a075 |   bmov C, [A]
e8 60 00 f8 7a 00              # a078 |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # a07e |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # a085 |   push C
5c f8 76 00                    # a087 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a08b |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 5d 00                    # a08f |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # a093 |   inc A
65 60 20                       # a095 |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # a098 |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 54 00                    # a09e |   jmp ${_C_for_1}:rel + PC
58 f8 4a 00                    # a0a2 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 64 25 00           # a0a6 |   jne C, 0x64, ${_E2_if_4}:rel + PC
                               #      |   # format %d
                               #      | _A_call_2:
e0 a0                          # a0ad |   push SP
e2 40                          # a0af |   push [B]
5c f8 64 00                    # a0b1 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # a0b5 |   mov SP, SP + 0x4
                               #      | _Z_call_2:
                               #      | _A_call_4:
e0 a0                          # a0b9 |   push SP
5c f8 c8 00                    # a0bb |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0bf |   mov SP, SP + 0x2
                               #      | _Z_call_4:
60 40 5c 02                    # a0c3 |   mov B, B + 0x2
58 f8 25 00                    # a0c7 |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 78 0f 00           # a0cb |   jne C, 0x78, ${_E3_if_4}:rel + PC
                               #      |   # format %x
60 40 5c 02                    # a0d2 |   mov B, B + 0x2
58 f8 16 00                    # a0d6 |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 25 12 00           # a0da |   jne C, 0x25, ${_E4_if_4}:rel + PC
                               #      |   # format %%
                               #      | _A_call_5:
e0 1c 25                       # a0e1 |   push 0x25
5c f8 19 00                    # a0e4 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a0e8 |   mov SP, SP + 0x2
                               #      | _Z_call_5:
                               #      | _E4_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _BZ_for_1:
44 20                          # a0ec |   inc A
58 f8 87 ff                    # a0ee |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 06                    # a0f2 |   mov SP, SP + 0x6
e4 20                          # a0f6 |   pop A
e4 40                          # a0f8 |   pop B
e4 60                          # a0fa |   pop C
dc                             # a0fc |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a0fd |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a104 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a10a |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a10e |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a114 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # a115 |   push C
e0 40                          # a117 |   push B
e0 20                          # a119 |   push A
61 20 bc 0a                    # a11b |   mov A, [SP + 0xa]
62 20 1c 30                    # a11f |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # a123 |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 3a 00              # a127 |   jeq B, 0, ${_C_while_1}:rel + PC
88 fe 40 e0 99 19              # a12d |   mul G, B, 0x1999
60 60 ff                       # a133 |   mov C, H
88 fe ff 1c 0a                 # a136 |   mul G, H, 0xa
84 ff 40 fe                    # a13b |   sub H, B, G
                               #      | _A_if_5:
f8 fe 5c f8 f6 14 00           # a13f |   jgt G, B + -10, ${_E_if_5}:rel + PC
f0 40 1c f8 0a 0d 00           # a146 |   jlt B, 0xa, ${_C_if_5}:rel + PC
44 60                          # a14d |   inc C
04 ff 1c 0a                    # a14f |   sub H, 0xa
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
82 20 ff 1c 30                 # a153 |   add [A], H, 0x30
44 20                          # a158 |   inc A
60 40 60                       # a15a |   mov B, C
                               #      | _BZ_while_1:
58 f8 ca ff                    # a15d |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # a161 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # a165 |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # a16b |   dec A
61 40 60                       # a16d |   mov B, [C]
67 60 20                       # a170 |   bmov [C], [A]
66 20 40                       # a173 |   bmov [A], B
44 60                          # a176 |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # a178 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # a17c |   pop A
e4 40                          # a17e |   pop B
e4 60                          # a180 |   pop C
dc                             # a182 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a183 |   push A
                               #      | _A_for_2:
61 20 bc 04                    # a185 |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # a189 |   bmov H, [A]
e8 ff 00 f8 16 00              # a18c |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_3:
e0 ff                          # a192 |   push H
5c f8 69 ff                    # a194 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a198 |   mov SP, SP + 0x2
                               #      | _Z_call_3:
                               #      | _BZ_for_2:
44 20                          # a19c |   inc A
58 f8 eb ff                    # a19e |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # a1a2 |   pop A
dc                             # a1a4 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_data_1:
48 65 6c 6c 6f 20 57 6f 72 6c 64 3a 20 25 25 61 3d 25 64 20 25 25 62 3d 25 78 20 63 3d 25 64 20 68 3d 25 64 20 64 3d 25 64 20 65 3d 25 64 20 76 31 3d 25 64 20 76 32 3d 25 64 0a 00 # a1a5 |   .data str:"Hello World: %%a=%d %%b=%x c=%d h=%d d=%d e=%d v1=%d v2=%d\n"
                               #      | const_data_2:
66 72 6f 6d 20 73 6f 65 75 6e 61 73 6d 20 69 6d 70 6f 72 74 20 63 61 6c 6c 2c 20 68 61 6c 74 2c 20 69 6e 69 74 5f 63 6f 64 65 5f 67 65 6e 2c 20 52 65 67 0a 00 # a1e1 |   .data str:"from soeunasm import call, halt, init_code_gen, Reg\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
