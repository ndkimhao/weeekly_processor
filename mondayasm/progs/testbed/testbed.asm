                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_13:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_13:
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
98 80 20 1c 03                 # a020 |   getb D, A, 0x3
9c fc 20 1c 02                 # a025 |   setb E, A, 0x2
                               #      | _A_call_11:
e0 e0 66 a5                    # a02a |   push 0xa566
e0 e0 43 01                    # a02e |   push 0x143
e0 fc                          # a032 |   push E
e0 fc                          # a034 |   push E
e0 80                          # a036 |   push D
e0 80                          # a038 |   push D
e0 ff                          # a03a |   push H
e0 60                          # a03c |   push C
e0 40                          # a03e |   push B
e0 20                          # a040 |   push A
e0 e0 4e a2                    # a042 |   push ${const_data_1}
5c f8 21 00                    # a046 |   call ${fn_printf}:rel + PC
60 a0 bc 16                    # a04a |   mov SP, SP + 0x16
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 40                          # a04e |   push B
e0 20                          # a050 |   push A
e0 e0 90 a2                    # a052 |   push ${const_data_2}
5c f8 11 00                    # a056 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a05a |   mov SP, SP + 0x6
                               #      | _Z_call_12:
                               #      | _cleanup_fn_main:
e4 20                          # a05e |   pop A
e4 40                          # a060 |   pop B
e4 60                          # a062 |   pop C
e4 80                          # a064 |   pop D
dc                             # a066 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # a067 |   push C
e0 40                          # a069 |   push B
e0 20                          # a06b |   push A
60 a0 bc ee                    # a06d |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # a071 |   mov B, SP + 0x1c
                               #      | _A_for_1:
61 20 bc 1a                    # a075 |   mov A, [SP + 0x1a]
                               #      | _BA_for_1:
65 60 20                       # a079 |   bmov C, [A]
e8 60 00 f8 b5 00              # a07c |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # a082 |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # a089 |   push C
5c f8 b1 00                    # a08b |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a08f |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 98 00                    # a093 |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # a097 |   inc A
65 60 20                       # a099 |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # a09c |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 8f 00                    # a0a2 |   jmp ${_C_for_1}:rel + PC
58 f8 85 00                    # a0a6 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 64 25 00           # a0aa |   jne C, 0x64, ${_E2_if_4}:rel + PC
                               #      |   # format %d
                               #      | _A_call_2:
e0 a0                          # a0b1 |   push SP
e2 40                          # a0b3 |   push [B]
5c f8 9f 00                    # a0b5 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # a0b9 |   mov SP, SP + 0x4
                               #      | _Z_call_2:
                               #      | _A_call_4:
e0 a0                          # a0bd |   push SP
5c f8 e2 00                    # a0bf |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0c3 |   mov SP, SP + 0x2
                               #      | _Z_call_4:
60 40 5c 02                    # a0c7 |   mov B, B + 0x2
58 f8 60 00                    # a0cb |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 78 25 00           # a0cf |   jne C, 0x78, ${_E3_if_4}:rel + PC
                               #      |   # format %x
                               #      | _A_call_6:
e0 a0                          # a0d6 |   push SP
e2 40                          # a0d8 |   push [B]
5c f8 e9 00                    # a0da |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a0de |   mov SP, SP + 0x4
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 a0                          # a0e2 |   push SP
5c f8 bd 00                    # a0e4 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0e8 |   mov SP, SP + 0x2
                               #      | _Z_call_7:
60 40 5c 02                    # a0ec |   mov B, B + 0x2
58 f8 3b 00                    # a0f0 |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 62 25 00           # a0f4 |   jne C, 0x62, ${_E4_if_4}:rel + PC
                               #      |   # format %b
                               #      | _A_call_8:
e0 a0                          # a0fb |   push SP
e2 40                          # a0fd |   push [B]
5c f8 1a 01                    # a0ff |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # a103 |   mov SP, SP + 0x4
                               #      | _Z_call_8:
                               #      | _A_call_9:
e0 a0                          # a107 |   push SP
5c f8 98 00                    # a109 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a10d |   mov SP, SP + 0x2
                               #      | _Z_call_9:
60 40 5c 02                    # a111 |   mov B, B + 0x2
58 f8 16 00                    # a115 |   jmp ${_C_if_4}:rel + PC
                               #      | _E4_if_4:
ec 60 1c f8 25 12 00           # a119 |   jne C, 0x25, ${_E5_if_4}:rel + PC
                               #      |   # format %%
                               #      | _A_call_10:
e0 1c 25                       # a120 |   push 0x25
5c f8 19 00                    # a123 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a127 |   mov SP, SP + 0x2
                               #      | _Z_call_10:
                               #      | _E5_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _BZ_for_1:
44 20                          # a12b |   inc A
58 f8 4c ff                    # a12d |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # a131 |   mov SP, SP + 0x12
e4 20                          # a135 |   pop A
e4 40                          # a137 |   pop B
e4 60                          # a139 |   pop C
dc                             # a13b |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a13c |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a143 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a149 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a14d |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a153 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # a154 |   push C
e0 40                          # a156 |   push B
e0 20                          # a158 |   push A
61 20 bc 0a                    # a15a |   mov A, [SP + 0xa]
62 20 1c 30                    # a15e |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # a162 |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # a166 |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # a16c |   div C, B, 0xa
82 20 ff 1c 30                 # a171 |   add [A], H, 0x30
44 20                          # a176 |   inc A
60 40 60                       # a178 |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # a17b |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # a17f |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # a183 |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # a189 |   dec A
61 40 60                       # a18b |   mov B, [C]
67 60 20                       # a18e |   bmov [C], [A]
66 20 40                       # a191 |   bmov [A], B
44 60                          # a194 |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # a196 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # a19a |   pop A
e4 40                          # a19c |   pop B
e4 60                          # a19e |   pop C
dc                             # a1a0 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a1a1 |   push A
                               #      | _A_for_2:
61 20 bc 04                    # a1a3 |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # a1a7 |   bmov H, [A]
e8 ff 00 f8 16 00              # a1aa |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_3:
e0 ff                          # a1b0 |   push H
5c f8 8a ff                    # a1b2 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a1b6 |   mov SP, SP + 0x2
                               #      | _Z_call_3:
                               #      | _BZ_for_2:
44 20                          # a1ba |   inc A
58 f8 eb ff                    # a1bc |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # a1c0 |   pop A
dc                             # a1c2 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # a1c3 |   push C
e0 40                          # a1c5 |   push B
e0 20                          # a1c7 |   push A
61 40 bc 08                    # a1c9 |   mov B, [SP + 0x8]
61 60 bc 0a                    # a1cd |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # a1d1 |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # a1d5 |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # a1dc |   shr H, B, A*4
2c ff 1c 0f                    # a1e0 |   and H, 0xf
                               #      | _A_call_5:
e0 ff                          # a1e4 |   push H
5c f8 1a 00                    # a1e6 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # a1ea |   mov SP, SP + 0x2
                               #      | _Z_call_5:
62 60 ff                       # a1ee |   mov [C], H
44 60                          # a1f1 |   inc C
                               #      | _BZ_for_3:
48 20                          # a1f3 |   dec A
58 f8 e0 ff                    # a1f5 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # a1f9 |   pop A
e4 40                          # a1fb |   pop B
e4 60                          # a1fd |   pop C
dc                             # a1ff |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_6:
fa bc 1c f8 02 09 12 00        # a200 |   jgt [SP + 0x2], 0x9, ${_E_if_6}:rel + PC
81 ff bc 1c 02 30              # a208 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # a20e |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
81 ff bc 1c 02 57              # a212 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # a218 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # a219 |   push C
e0 40                          # a21b |   push B
e0 20                          # a21d |   push A
61 40 bc 08                    # a21f |   mov B, [SP + 0x8]
61 60 bc 0a                    # a223 |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # a227 |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # a22b |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # a232 |   shr H, B, A
2c ff 1c 01                    # a236 |   and H, 0x1
82 60 ff 1c 30                 # a23a |   add [C], H, 0x30
44 60                          # a23f |   inc C
                               #      | _BZ_for_4:
48 20                          # a241 |   dec A
58 f8 e8 ff                    # a243 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # a247 |   pop A
e4 40                          # a249 |   pop B
e4 60                          # a24b |   pop C
dc                             # a24d |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_data_1:
48 65 6c 6c 6f 20 57 6f 72 6c 64 3a 20 25 25 61 3d 25 64 20 62 3d 25 78 20 63 3d 25 64 20 68 3d 25 64 20 64 3d 25 64 28 25 62 29 20 65 3d 25 64 28 25 62 29 20 76 31 3d 25 64 20 76 32 3d 25 64 0a 00 # a24e |   .data str:"Hello World: %%a=%d b=%x c=%d h=%d d=%d(%b) e=%d(%b) v1=%d v2=%d\n"
                               #      | const_data_2:
66 72 6f 6d 20 73 6f 65 75 6e 61 73 6d 20 69 6d 70 6f 72 74 20 63 61 6c 6c 2c 20 68 61 6c 74 2c 20 69 6e 69 74 5f 63 6f 64 65 5f 67 65 6e 2c 20 52 65 67 0a 00 # a290 |   .data str:"from soeunasm import call, halt, init_code_gen, Reg\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
