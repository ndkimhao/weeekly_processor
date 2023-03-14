                               #      | .config CODE_OFFSET 0x9000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 fe 8f                 # 9000 |   mov SP, 0x8ffe
                               #      | _A_call_183:
5c f8 4c 12                    # 9005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_183:
d8                             # 9009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 80                          # 900a |   push D
e0 60                          # 900c |   push C
e0 40                          # 900e |   push B
e0 20                          # 9010 |   push A
60 a0 bc ee                    # 9012 |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1e                    # 9016 |   mov B, SP + 0x1e
                               #      | _A_for_1:
61 20 bc 1c                    # 901a |   mov A, [SP + 0x1c]
                               #      | _BA_for_1:
65 60 20                       # 901e |   bmov C, [A]
e8 60 00 f8 45 01              # 9021 |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # 9027 |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # 902e |   push C
5c f8 43 01                    # 9030 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9034 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 28 01                    # 9038 |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # 903c |   inc A
65 60 20                       # 903e |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # 9041 |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 1f 01                    # 9047 |   jmp ${_C_for_1}:rel + PC
58 f8 11 01                    # 904b |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 25 1a 00           # 904f |   jne C, 0x25, ${_E2_if_4}:rel + PC
                               #      | _A_call_2:
e0 1c 25                       # 9056 |   push 0x25
5c f8 1a 01                    # 9059 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 905d |   mov SP, SP + 0x2
                               #      | _Z_call_2:
58 f8 ff 00                    # 9061 |   jmp ${_BZ_for_1}:rel + PC
58 f8 f7 00                    # 9065 |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 64 21 00           # 9069 |   jne C, 0x64, ${_E3_if_4}:rel + PC
                               #      | _A_call_3:
e0 a0                          # 9070 |   push SP
e2 40                          # 9072 |   push [B]
5c f8 17 01                    # 9074 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # 9078 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 a0                          # 907c |   push SP
5c f8 5a 01                    # 907e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9082 |   mov SP, SP + 0x2
                               #      | _Z_call_5:
58 f8 d6 00                    # 9086 |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 78 21 00           # 908a |   jne C, 0x78, ${_E4_if_4}:rel + PC
                               #      | _A_call_7:
e0 a0                          # 9091 |   push SP
e2 40                          # 9093 |   push [B]
5c f8 65 01                    # 9095 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9099 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 a0                          # 909d |   push SP
5c f8 39 01                    # 909f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 90a3 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
58 f8 b5 00                    # 90a7 |   jmp ${_C_if_4}:rel + PC
                               #      | _E4_if_4:
ec 60 1c f8 71 26 00           # 90ab |   jne C, 0x71, ${_E5_if_4}:rel + PC
95 80 40 1c 08                 # 90b2 |   ror D, [B], 0x8
                               #      | _A_call_9:
e0 a0                          # 90b7 |   push SP
e0 80                          # 90b9 |   push D
5c f8 3f 01                    # 90bb |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 90bf |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 a0                          # 90c3 |   push SP
5c f8 13 01                    # 90c5 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 90c9 |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 8f 00                    # 90cd |   jmp ${_C_if_4}:rel + PC
                               #      | _E5_if_4:
ec 60 1c f8 68 22 00           # 90d1 |   jne C, 0x68, ${_E6_if_4}:rel + PC
                               #      | _A_call_11:
e0 a0                          # 90d8 |   push SP
e2 40                          # 90da |   push [B]
5c f8 1e 01                    # 90dc |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 90e0 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 bc 02                       # 90e4 |   push SP + 0x2
5c f8 f1 00                    # 90e7 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 90eb |   mov SP, SP + 0x2
                               #      | _Z_call_12:
58 f8 6d 00                    # 90ef |   jmp ${_C_if_4}:rel + PC
                               #      | _E6_if_4:
ec 60 1c f8 62 21 00           # 90f3 |   jne C, 0x62, ${_E7_if_4}:rel + PC
                               #      | _A_call_13:
e0 a0                          # 90fa |   push SP
e2 40                          # 90fc |   push [B]
5c f8 52 01                    # 90fe |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # 9102 |   mov SP, SP + 0x4
                               #      | _Z_call_13:
                               #      | _A_call_14:
e0 a0                          # 9106 |   push SP
5c f8 d0 00                    # 9108 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 910c |   mov SP, SP + 0x2
                               #      | _Z_call_14:
58 f8 4c 00                    # 9110 |   jmp ${_C_if_4}:rel + PC
                               #      | _E7_if_4:
ec 60 1c f8 7a 22 00           # 9114 |   jne C, 0x7a, ${_E8_if_4}:rel + PC
                               #      | _A_call_15:
e0 a0                          # 911b |   push SP
e2 40                          # 911d |   push [B]
5c f8 31 01                    # 911f |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # 9123 |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_call_16:
e0 bc 08                       # 9127 |   push SP + 0x8
5c f8 ae 00                    # 912a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 912e |   mov SP, SP + 0x2
                               #      | _Z_call_16:
58 f8 2a 00                    # 9132 |   jmp ${_C_if_4}:rel + PC
                               #      | _E8_if_4:
ec 60 1c f8 73 15 00           # 9136 |   jne C, 0x73, ${_E9_if_4}:rel + PC
                               #      | _A_call_17:
e2 40                          # 913d |   push [B]
5c f8 99 00                    # 913f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9143 |   mov SP, SP + 0x2
                               #      | _Z_call_17:
58 f8 15 00                    # 9147 |   jmp ${_C_if_4}:rel + PC
                               #      | _E9_if_4:
ec 60 1c f8 63 11 00           # 914b |   jne C, 0x63, ${_E10_if_4}:rel + PC
                               #      | _A_call_18:
e2 40                          # 9152 |   push [B]
5c f8 1f 00                    # 9154 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9158 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
                               #      | _E10_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
60 40 5c 02                    # 915c |   mov B, B + 0x2
                               #      | _BZ_for_1:
44 20                          # 9160 |   inc A
58 f8 bc fe                    # 9162 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # 9166 |   mov SP, SP + 0x12
e4 20                          # 916a |   pop A
e4 40                          # 916c |   pop B
e4 60                          # 916e |   pop C
e4 80                          # 9170 |   pop D
dc                             # 9172 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # 9173 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # 917a |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # 9180 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # 9184 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # 918a |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # 918b |   push C
e0 40                          # 918d |   push B
e0 20                          # 918f |   push A
61 20 bc 0a                    # 9191 |   mov A, [SP + 0xa]
62 20 1c 30                    # 9195 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # 9199 |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # 919d |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # 91a3 |   div C, B, 0xa
82 20 ff 1c 30                 # 91a8 |   add [A], H, 0x30
44 20                          # 91ad |   inc A
60 40 60                       # 91af |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # 91b2 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # 91b6 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # 91ba |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # 91c0 |   dec A
61 40 60                       # 91c2 |   mov B, [C]
67 60 20                       # 91c5 |   bmov [C], [A]
66 20 40                       # 91c8 |   bmov [A], B
44 60                          # 91cb |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # 91cd |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # 91d1 |   pop A
e4 40                          # 91d3 |   pop B
e4 60                          # 91d5 |   pop C
dc                             # 91d7 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # 91d8 |   push A
                               #      | _A_for_2:
61 20 bc 04                    # 91da |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # 91de |   bmov H, [A]
e8 ff 00 f8 16 00              # 91e1 |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_4:
e0 ff                          # 91e7 |   push H
5c f8 8a ff                    # 91e9 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 91ed |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # 91f1 |   inc A
58 f8 eb ff                    # 91f3 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # 91f7 |   pop A
dc                             # 91f9 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # 91fa |   push C
e0 40                          # 91fc |   push B
e0 20                          # 91fe |   push A
61 40 bc 08                    # 9200 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 9204 |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # 9208 |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # 920c |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # 9213 |   shr H, B, A*4
2c ff 1c 0f                    # 9217 |   and H, 0xf
                               #      | _A_call_6:
e0 ff                          # 921b |   push H
5c f8 1a 00                    # 921d |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # 9221 |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 60 ff                       # 9225 |   mov [C], H
44 60                          # 9228 |   inc C
                               #      | _BZ_for_3:
48 20                          # 922a |   dec A
58 f8 e0 ff                    # 922c |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # 9230 |   pop A
e4 40                          # 9232 |   pop B
e4 60                          # 9234 |   pop C
dc                             # 9236 |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_6:
fa bc 1c f8 02 09 12 00        # 9237 |   jgt [SP + 0x2], 0x9, ${_E_if_6}:rel + PC
81 ff bc 1c 02 30              # 923f |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # 9245 |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
81 ff bc 1c 02 57              # 9249 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # 924f |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # 9250 |   push C
e0 40                          # 9252 |   push B
e0 20                          # 9254 |   push A
61 40 bc 08                    # 9256 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 925a |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # 925e |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # 9262 |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # 9269 |   shr H, B, A
2c ff 1c 01                    # 926d |   and H, 0x1
82 60 ff 1c 30                 # 9271 |   add [C], H, 0x30
44 60                          # 9276 |   inc C
                               #      | _BZ_for_4:
48 20                          # 9278 |   dec A
58 f8 e8 ff                    # 927a |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # 927e |   pop A
e4 40                          # 9280 |   pop B
e4 60                          # 9282 |   pop C
dc                             # 9284 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_getc:
                               #      | _begin_fn_getc:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 02 ff                 # 9285 |   mov H, [0xff02]
ac fe ff e0 00 80              # 928a |   and G, H, 0x8000
e8 fe 00 f8 f5 ff              # 9290 |   jeq G, 0, ${_BA_loop_2}:rel + PC
2c ff e0 ff 00                 # 9296 |   and H, 0xff
58 f8 08 00                    # 929b |   jmp ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 e6 ff                    # 929f |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_getc:
dc                             # 92a3 |   ret
                               #      | _end_fn_getc:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # 92a4 |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # 92aa |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # 92b1 |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # 92b8 |   sub H, G, 0x30
c4 fe 00                       # 92bd |   inc G, 0
dc                             # 92c0 |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # 92c1 |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # 92c8 |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # 92cf |   add H, G, -87
c4 fe 00                       # 92d4 |   inc G, 0
dc                             # 92d7 |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # 92d8 |   mov H, 0
60 fe 00                       # 92db |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # 92de |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # 92df |   push B
e0 20                          # 92e1 |   push A
60 20 00                       # 92e3 |   mov A, 0
61 40 bc 06                    # 92e6 |   mov B, [SP + 0x6]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
65 ff 40                       # 92ea |   bmov H, [B]
e8 ff 00 f8 23 00              # 92ed |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_19:
e0 ff                          # 92f3 |   push H
5c f8 af ff                    # 92f5 |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # 92f9 |   mov SP, SP + 0x2
                               #      | _Z_call_19:
e8 fe 00 f8 2d 00              # 92fd |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # 9303 |   shl A, 0x4
00 20 ff                       # 9307 |   add A, H
44 40                          # 930a |   inc B
                               #      | _BZ_loop_3:
58 f8 de ff                    # 930c |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
60 fe 00                       # 9310 |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # 9313 |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # 9317 |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # 931d |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # 9324 |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # 9327 |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # 932a |   pop A
e4 40                          # 932c |   pop B
dc                             # 932e |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 932f |   push B
e0 20                          # 9331 |   push A
65 fe bc 08                    # 9333 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 9337 |   shl H, G, 0x8
30 ff fe                       # 933c |   or H, G
61 20 bc 06                    # 933f |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 9343 |   add B, [SP + 0xa], A
                               #      | _A_while_3:
                               #      | _BA_while_3:
f8 3c 40 f8 02 12 00           # 9348 |   jgt A + 0x2, B, ${_C_while_3}:rel + PC
62 20 ff                       # 934f |   mov [A], H
60 20 3c 02                    # 9352 |   mov A, A + 0x2
                               #      | _BZ_while_3:
58 f8 f2 ff                    # 9356 |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _A_if_16:
fc 20 40 f8 09 00              # 935a |   jge A, B, ${_E_if_16}:rel + PC
66 20 ff                       # 9360 |   bmov [A], H
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _cleanup_fn_memset:
e4 20                          # 9363 |   pop A
e4 40                          # 9365 |   pop B
dc                             # 9367 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 9368 |   push C
e0 40                          # 936a |   push B
e0 20                          # 936c |   push A
61 20 bc 08                    # 936e |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 9372 |   add B, [SP + 0xc], A
61 60 bc 0a                    # 9377 |   mov C, [SP + 0xa]
                               #      | _A_while_4:
                               #      | _BA_while_4:
f8 3c 40 f8 02 16 00           # 937b |   jgt A + 0x2, B, ${_C_while_4}:rel + PC
63 20 60                       # 9382 |   mov [A], [C]
60 20 3c 02                    # 9385 |   mov A, A + 0x2
60 60 7c 02                    # 9389 |   mov C, C + 0x2
                               #      | _BZ_while_4:
58 f8 ee ff                    # 938d |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      | _A_if_17:
fc 20 40 f8 09 00              # 9391 |   jge A, B, ${_E_if_17}:rel + PC
67 20 60                       # 9397 |   bmov [A], [C]
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 939a |   pop A
e4 40                          # 939c |   pop B
e4 60                          # 939e |   pop C
dc                             # 93a0 |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_strcmp:
                               #      | _begin_fn_strcmp:
61 fc bc 02                    # 93a1 |   mov E, [SP + 0x2]
61 fd bc 04                    # 93a5 |   mov F, [SP + 0x4]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
65 fe fc                       # 93a9 |   bmov G, [E]
65 ff fd                       # 93ac |   bmov H, [F]
84 ff fe ff                    # 93af |   sub H, G, H
ec ff 00 f8 14 00              # 93b3 |   jne H, 0, ${_cleanup_fn_strcmp}:rel + PC
e8 fe 00 f8 0e 00              # 93b9 |   jeq G, 0, ${_cleanup_fn_strcmp}:rel + PC
44 fc                          # 93bf |   inc E
44 fd                          # 93c1 |   inc F
                               #      | _BZ_loop_4:
58 f8 e6 ff                    # 93c3 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_strcmp:
dc                             # 93c7 |   ret
                               #      | _end_fn_strcmp:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # 93c8 |   push A
61 fc bc 04                    # 93ca |   mov E, [SP + 0x4]
61 fd bc 06                    # 93ce |   mov F, [SP + 0x6]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
65 fe fc                       # 93d2 |   bmov G, [E]
65 ff fd                       # 93d5 |   bmov H, [F]
60 20 fe                       # 93d8 |   mov A, G
                               #      | _A_scope_4:
                               #      | _B_scope_4:
f0 fe 1c f8 41 12 00           # 93db |   jlt G, 0x41, ${_C_scope_4}:rel + PC
f8 fe 1c f8 5a 0b 00           # 93e2 |   jgt G, 0x5a, ${_C_scope_4}:rel + PC
30 fe 1c 20                    # 93e9 |   or G, 0x20
                               #      | _C_scope_4:
                               #      | _Z_scope_4:
                               #      | _A_scope_5:
                               #      | _B_scope_5:
f0 ff 1c f8 41 12 00           # 93ed |   jlt H, 0x41, ${_C_scope_5}:rel + PC
f8 ff 1c f8 5a 0b 00           # 93f4 |   jgt H, 0x5a, ${_C_scope_5}:rel + PC
30 ff 1c 20                    # 93fb |   or H, 0x20
                               #      | _C_scope_5:
                               #      | _Z_scope_5:
84 ff fe ff                    # 93ff |   sub H, G, H
ec ff 00 f8 14 00              # 9403 |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # 9409 |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # 940f |   inc E
44 fd                          # 9411 |   inc F
                               #      | _BZ_loop_5:
58 f8 bf ff                    # 9413 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # 9417 |   pop A
dc                             # 9419 |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # 941a |   mov H, [SP + 0x2]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 fe ff                       # 941e |   bmov G, [H]
e9 fe bc f8 04 17 00           # 9421 |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_28:
ec fe 00 f8 0a 00              # 9428 |   jne G, 0, ${_E_if_28}:rel + PC
60 ff 00                       # 942e |   mov H, 0
dc                             # 9431 |   ret
                               #      | _E_if_28:
                               #      | _C_if_28:
                               #      | _Z_if_28:
44 ff                          # 9432 |   inc H
                               #      | _BZ_loop_6:
58 f8 ea ff                    # 9434 |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _cleanup_fn_strchr:
dc                             # 9438 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc c1 b0 02              # 9439 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 943f |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
61 ff e0 c1 b0                 # 9440 |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 9445 |   shl G, H, 0x7
34 ff fe                       # 944a |   xor H, G
a0 fe ff 1c 09                 # 944d |   shr G, H, 0x9
34 ff fe                       # 9452 |   xor H, G
a8 fe ff 1c 08                 # 9455 |   shl G, H, 0x8
34 ff fe                       # 945a |   xor H, G
62 e0 ff c1 b0                 # 945d |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 9462 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 9463 |   push D
e0 60                          # 9465 |   push C
e0 40                          # 9467 |   push B
e0 20                          # 9469 |   push A
61 40 e0 10 ff                 # 946b |   mov B, [0xff10]
61 60 e0 12 ff                 # 9470 |   mov C, [0xff12]
61 80 e0 14 ff                 # 9475 |   mov D, [0xff14]
61 20 bc 0e                    # 947a |   mov A, [SP + 0xe]
60 ff 00                       # 947e |   mov H, 0
                               #      | _A_if_29:
fc 28 20 f8 09 00              # 9481 |   jge A + B, A, ${_E_if_29}:rel + PC
c4 ff 00                       # 9487 |   inc H, 0
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
60 40 44                       # 948a |   mov B, B + A
81 20 bc ff 0c                 # 948d |   add A, [SP + 0xc], H
60 ff 00                       # 9492 |   mov H, 0
                               #      | _A_scope_6:
                               #      | _B_scope_6:
f0 2c 20 f8 10 00              # 9495 |   jlt A + C, A, ${_C_scope_6}:rel + PC
f0 20 ff f8 0a 00              # 949b |   jlt A, H, ${_C_scope_6}:rel + PC
58 f8 07 00                    # 94a1 |   jmp ${_Z_scope_6}:rel + PC
                               #      | _C_scope_6:
c4 ff 00                       # 94a5 |   inc H, 0
                               #      | _Z_scope_6:
60 60 64                       # 94a8 |   mov C, C + A
81 20 bc ff 0a                 # 94ab |   add A, [SP + 0xa], H
60 80 84                       # 94b0 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 94b3 |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 10 ff                 # 94b7 |   mov H, [0xff10]
61 fe e0 12 ff                 # 94bc |   mov G, [0xff12]
61 fc e0 14 ff                 # 94c1 |   mov E, [0xff14]
                               #      | _A_if_32:
e8 fc 80 f8 10 00              # 94c6 |   jeq E, D, ${_E_if_32}:rel + PC
f8 fc 80 f8 2c 00              # 94cc |   jgt E, D, ${_C_loop_7}:rel + PC
58 f8 22 00                    # 94d2 |   jmp ${_C_if_32}:rel + PC
                               #      | _E_if_32:
                               #      | _A_if_34:
e8 fe 60 f8 10 00              # 94d6 |   jeq G, C, ${_E_if_34}:rel + PC
f8 fe 60 f8 1c 00              # 94dc |   jgt G, C, ${_C_loop_7}:rel + PC
58 f8 12 00                    # 94e2 |   jmp ${_C_if_34}:rel + PC
                               #      | _E_if_34:
f8 ff 40 f8 12 00              # 94e6 |   jgt H, B, ${_C_loop_7}:rel + PC
                               #      | _A_if_37:
e8 20 00 f8 08 00              # 94ec |   jeq A, 0, ${_E_if_37}:rel + PC
5c 20                          # 94f2 |   call A
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _C_if_34:
                               #      | _Z_if_34:
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _BZ_loop_7:
58 f8 c3 ff                    # 94f4 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 94f8 |   pop A
e4 40                          # 94fa |   pop B
e4 60                          # 94fc |   pop C
e4 80                          # 94fe |   pop D
dc                             # 9500 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # 9501 |   push D
e0 60                          # 9503 |   push C
e0 40                          # 9505 |   push B
e0 20                          # 9507 |   push A
61 fc bc 0a                    # 9509 |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # 950d |   shl F, [SP + 0xe], 0x1
00 fd fc                       # 9513 |   add F, E
61 fe bc 0c                    # 9516 |   mov G, [SP + 0xc]
61 40 fe                       # 951a |   mov B, [G]
60 60 1c 07                    # 951d |   mov C, 0x7
60 20 00                       # 9521 |   mov A, 0
60 a0 bc fe                    # 9524 |   mov SP, SP + -2
                               #      | _A_for_5:
                               #      | _BA_for_5:
fc fc fd f8 9e 00              # 9528 |   jge E, F, ${_C_for_5}:rel + PC
                               #      |   # decode one line
60 20 00                       # 952e |   mov A, 0
62 a0 1c ff                    # 9531 |   mov [SP], -1
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
                               #      | _A_if_38:
ec 60 1c f8 ff 10 00           # 9535 |   jne C, -1, ${_E_if_38}:rel + PC
44 fe                          # 953c |   inc G
61 40 fe                       # 953e |   mov B, [G]
60 60 1c 07                    # 9541 |   mov C, 0x7
                               #      | _E_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
98 80 40 60                    # 9545 |   getb D, B, C
48 60                          # 9549 |   dec C
40 80                          # 954b |   bool D
b0 20 21 80                    # 954d |   or A, A*2, D
4a a0                          # 9551 |   dec [SP]
                               #      | _A_if_39:
ee a0 00 f8 1b 00              # 9553 |   jne [SP], 0, ${_E_if_39}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # 9559 |   mov H, A
b9 20 bc 12                    # 955c |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # 9560 |   shr A, -1, A + 0x10
ae fc ff 20                    # 9566 |   and [E], H, A
58 f8 54 00                    # 956a |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_39:
ec 20 00 f8 20 00              # 956e |   jne A, 0, ${_E2_if_39}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # 9574 |   sub H, E, 0x2
                               #      | _A_if_40:
f1 ff bc f8 0c 0e 00           # 9579 |   jlt H, [SP + 0xc], ${_E_if_40}:rel + PC
63 fc ff                       # 9580 |   mov [E], [H]
58 f8 07 00                    # 9583 |   jmp ${_C_if_40}:rel + PC
                               #      | _E_if_40:
62 fc 00                       # 9587 |   mov [E], 0
                               #      | _C_if_40:
                               #      | _Z_if_40:
58 f8 34 00                    # 958a |   jmp ${_C_loop_8}:rel + PC
                               #      | _E2_if_39:
ec 20 1c f8 02 13 00           # 958e |   jne A, 0x2, ${_E3_if_39}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # 9595 |   sub H, E, 0x4
63 fc ff                       # 959a |   mov [E], [H]
58 f8 21 00                    # 959d |   jmp ${_C_loop_8}:rel + PC
                               #      | _E3_if_39:
ec 20 1c f8 06 0e 00           # 95a1 |   jne A, 0x6, ${_E4_if_39}:rel + PC
                               #      |   # all zeros
62 fc 00                       # 95a8 |   mov [E], 0
58 f8 13 00                    # 95ab |   jmp ${_C_loop_8}:rel + PC
                               #      | _E4_if_39:
ec 20 1c f8 07 0b 00           # 95af |   jne A, 0x7, ${_E5_if_39}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # 95b6 |   mov [SP], [SP + 0x12]
                               #      | _E5_if_39:
                               #      | _C_if_39:
                               #      | _Z_if_39:
                               #      | _BZ_loop_8:
58 f8 7b ff                    # 95ba |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _BZ_for_5:
00 fc 1c 02                    # 95be |   add E, 0x2
58 f8 66 ff                    # 95c2 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # 95c6 |   mov SP, SP + 0x2
e4 20                          # 95ca |   pop A
e4 40                          # 95cc |   pop B
e4 60                          # 95ce |   pop C
e4 80                          # 95d0 |   pop D
dc                             # 95d2 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # 95d3 |   push B
e0 20                          # 95d5 |   push A
61 20 bc 08                    # 95d7 |   mov A, [SP + 0x8]
60 40 1c 1f                    # 95db |   mov B, 0x1f
                               #      | _A_scope_7:
                               #      | _B_scope_7:
f0 20 1c f8 20 13 00           # 95df |   jlt A, 0x20, ${_C_scope_7}:rel + PC
fc 20 e0 f8 80 00 0c 00        # 95e6 |   jge A, 0x80, ${_C_scope_7}:rel + PC
60 40 3c e0                    # 95ee |   mov B, A + -32
                               #      | _C_scope_7:
                               #      | _Z_scope_7:
28 40 1c 01                    # 95f2 |   shl B, 0x1
61 40 e8 25 ad                 # 95f6 |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_20:
e0 1c 0c                       # 95fb |   push 0xc
e0 1c 10                       # 95fe |   push 0x10
e0 e8 30 a9                    # 9601 |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # 9605 |   push [SP + 0xc]
5c f8 f9 fe                    # 9608 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # 960c |   mov SP, SP + 0x8
                               #      | _Z_call_20:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # 9610 |   pop A
e4 40                          # 9612 |   pop B
dc                             # 9614 |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_read_sd:
                               #      | _begin_fn_read_sd:
e0 80                          # 9615 |   push D
e0 60                          # 9617 |   push C
e0 40                          # 9619 |   push B
e0 20                          # 961b |   push A
                               #      | _A_call_21:
e0 fc                          # 961d |   push E
e0 fd                          # 961f |   push F
e2 bc 14                       # 9621 |   push [SP + 0x14]
e2 bc 14                       # 9624 |   push [SP + 0x14]
e0 00                          # 9627 |   push 0
5c f8 ab 00                    # 9629 |   call ${fn_send_sd_cmd}:rel + PC
60 a0 bc 06                    # 962d |   mov SP, SP + 0x6
e4 fd                          # 9631 |   pop F
e4 fc                          # 9633 |   pop E
                               #      | _Z_call_21:
e8 fe 00 f8 90 00              # 9635 |   jeq G, 0, ${_L_fn_read_sd_1}:rel + PC
61 fc bc 0a                    # 963b |   mov E, [SP + 0xa]
60 fd 00                       # 963f |   mov F, 0
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc fd e0 f8 00 02 75 00        # 9642 |   jge F, 0x200, ${_C_while_5}:rel + PC
44 80                          # 964a |   inc D
e8 80 1c f8 ff 79 00           # 964c |   jeq D, -1, ${_L_fn_read_sd_1}:rel + PC
61 60 e0 26 ff                 # 9653 |   mov C, [0xff26]
98 20 60 1c 09                 # 9658 |   getb A, C, 0x9
e8 20 00 f8 5a 00              # 965d |   jeq A, 0, ${_C_while_5}:rel + PC
98 20 60 1c 08                 # 9663 |   getb A, C, 0x8
e8 20 00 f8 da ff              # 9668 |   jeq A, 0, ${_BA_while_5}:rel + PC
1e e0 1c 24 ff 08              # 966e |   setb [0xff24], 0x8
                               #      | _A_for_7:
60 80 00                       # 9674 |   mov D, 0
                               #      | _BA_for_7:
fc 80 1c f8 ff 1a 00           # 9677 |   jge D, -1, ${_C_for_7}:rel + PC
99 40 e0 1c 26 ff 08           # 967e |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # 9685 |   jeq B, 0, ${_C_for_7}:rel + PC
                               #      | _BZ_for_7:
44 80                          # 968b |   inc D
58 f8 ea ff                    # 968d |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
ec 40 00 f8 34 00              # 9691 |   jne B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 18              # 9697 |   setb [0xff24], 0x18
2c 60 e0 ff 00                 # 969d |   and C, 0xff
                               #      | _A_if_52:
fd fd bc f8 0c 0c 00           # 96a2 |   jge F, [SP + 0xc], ${_E_if_52}:rel + PC
62 fc 60                       # 96a9 |   mov [E], C
44 fc                          # 96ac |   inc E
                               #      | _E_if_52:
                               #      | _C_if_52:
                               #      | _Z_if_52:
44 fd                          # 96ae |   inc F
60 80 00                       # 96b0 |   mov D, 0
                               #      | _BZ_while_5:
58 f8 8f ff                    # 96b3 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
c4 fe 00                       # 96b7 |   inc G, 0
b9 ff bc 0a                    # 96ba |   neg H, [SP + 0xa]
00 ff fc                       # 96be |   add H, E
58 f8 0a 00                    # 96c1 |   jmp ${_cleanup_fn_read_sd}:rel + PC
                               #      | _L_fn_read_sd_1:
60 fe 00                       # 96c5 |   mov G, 0
60 ff 00                       # 96c8 |   mov H, 0
                               #      | _cleanup_fn_read_sd:
e4 20                          # 96cb |   pop A
e4 40                          # 96cd |   pop B
e4 60                          # 96cf |   pop C
e4 80                          # 96d1 |   pop D
dc                             # 96d3 |   ret
                               #      | _end_fn_read_sd:
                               #      | 
                               #      | fn_send_sd_cmd:
                               #      | _begin_fn_send_sd_cmd:
e0 80                          # 96d4 |   push D
e0 40                          # 96d6 |   push B
e0 20                          # 96d8 |   push A
60 20 1c 09                    # 96da |   mov A, 0x9
                               #      | _A_if_43:
ee bc 1c f8 08 01 0c 00        # 96de |   jne [SP + 0x8], 0x1, ${_E_if_43}:rel + PC
60 20 1c 0a                    # 96e6 |   mov A, 0xa
                               #      | _E_if_43:
                               #      | _C_if_43:
                               #      | _Z_if_43:
63 e0 bc 22 ff 0a              # 96ea |   mov [0xff22], [SP + 0xa]
63 e0 bc 20 ff 0c              # 96f0 |   mov [0xff20], [SP + 0xc]
1e e0 20 24 ff                 # 96f6 |   setb [0xff24], A
                               #      | _A_for_6:
60 80 00                       # 96fb |   mov D, 0
                               #      | _BA_for_6:
fc 80 1c f8 ff 1a 00           # 96fe |   jge D, -1, ${_C_for_6}:rel + PC
99 40 e0 1c 26 ff 09           # 9705 |   getb B, [0xff26], 0x9
ec 40 00 f8 0c 00              # 970c |   jne B, 0, ${_C_for_6}:rel + PC
                               #      | _BZ_for_6:
44 80                          # 9712 |   inc D
58 f8 ea ff                    # 9714 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
60 20 3c 10                    # 9718 |   mov A, A + 0x10
1e e0 20 24 ff                 # 971c |   setb [0xff24], A
c4 fe 00                       # 9721 |   inc G, 0
                               #      | _A_if_45:
ec 40 00 f8 09 00              # 9724 |   jne B, 0, ${_E_if_45}:rel + PC
60 fe 00                       # 972a |   mov G, 0
                               #      | _E_if_45:
                               #      | _C_if_45:
                               #      | _Z_if_45:
                               #      | _cleanup_fn_send_sd_cmd:
e4 20                          # 972d |   pop A
e4 40                          # 972f |   pop B
e4 80                          # 9731 |   pop D
dc                             # 9733 |   ret
                               #      | _end_fn_send_sd_cmd:
                               #      | 
                               #      | fn_write_sd:
                               #      | _begin_fn_write_sd:
e0 80                          # 9734 |   push D
e0 60                          # 9736 |   push C
e0 40                          # 9738 |   push B
e0 20                          # 973a |   push A
                               #      | _A_call_22:
e0 fc                          # 973c |   push E
e0 fd                          # 973e |   push F
e2 bc 14                       # 9740 |   push [SP + 0x14]
e2 bc 14                       # 9743 |   push [SP + 0x14]
e0 1c 01                       # 9746 |   push 0x1
5c f8 8b ff                    # 9749 |   call ${fn_send_sd_cmd}:rel + PC
60 a0 bc 06                    # 974d |   mov SP, SP + 0x6
e4 fd                          # 9751 |   pop F
e4 fc                          # 9753 |   pop E
                               #      | _Z_call_22:
e8 fe 00 f8 8f 00              # 9755 |   jeq G, 0, ${_L_fn_write_sd_1}:rel + PC
61 fc bc 0a                    # 975b |   mov E, [SP + 0xa]
60 fd 00                       # 975f |   mov F, 0
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc fd e0 f8 00 02 7b 00        # 9762 |   jge F, 0x200, ${_C_while_6}:rel + PC
44 80                          # 976a |   inc D
e8 80 1c f8 ff 78 00           # 976c |   jeq D, -1, ${_L_fn_write_sd_1}:rel + PC
61 60 e0 26 ff                 # 9773 |   mov C, [0xff26]
98 20 60 1c 09                 # 9778 |   getb A, C, 0x9
e8 20 00 f8 60 00              # 977d |   jeq A, 0, ${_C_while_6}:rel + PC
98 20 60 1c 08                 # 9783 |   getb A, C, 0x8
e8 20 00 f8 da ff              # 9788 |   jeq A, 0, ${_BA_while_6}:rel + PC
60 60 00                       # 978e |   mov C, 0
                               #      | _A_if_57:
fd fd bc f8 0c 0c 00           # 9791 |   jge F, [SP + 0xc], ${_E_if_57}:rel + PC
65 60 fc                       # 9798 |   bmov C, [E]
44 fc                          # 979b |   inc E
                               #      | _E_if_57:
                               #      | _C_if_57:
                               #      | _Z_if_57:
ad 20 e0 e0 24 ff 00 fe        # 979d |   and A, [0xff24], 0xfe00
9e e0 2c 1c 24 ff 08           # 97a5 |   setb [0xff24], A + C, 0x8
                               #      | _A_for_8:
60 80 00                       # 97ac |   mov D, 0
                               #      | _BA_for_8:
fc 80 1c f8 ff 1a 00           # 97af |   jge D, -1, ${_C_for_8}:rel + PC
99 40 e0 1c 26 ff 08           # 97b6 |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # 97bd |   jeq B, 0, ${_C_for_8}:rel + PC
                               #      | _BZ_for_8:
44 80                          # 97c3 |   inc D
58 f8 ea ff                    # 97c5 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
ec 40 00 f8 1b 00              # 97c9 |   jne B, 0, ${_L_fn_write_sd_1}:rel + PC
62 e0 20 24 ff                 # 97cf |   mov [0xff24], A
44 fd                          # 97d4 |   inc F
60 80 00                       # 97d6 |   mov D, 0
                               #      | _BZ_while_6:
58 f8 89 ff                    # 97d9 |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
c4 fe 00                       # 97dd |   inc G, 0
58 f8 07 00                    # 97e0 |   jmp ${_cleanup_fn_write_sd}:rel + PC
                               #      | _L_fn_write_sd_1:
60 fe 00                       # 97e4 |   mov G, 0
                               #      | _cleanup_fn_write_sd:
e4 20                          # 97e7 |   pop A
e4 40                          # 97e9 |   pop B
e4 60                          # 97eb |   pop C
e4 80                          # 97ed |   pop D
dc                             # 97ef |   ret
                               #      | _end_fn_write_sd:
                               #      | 
                               #      | fn_init_sd:
                               #      | _begin_fn_init_sd:
                               #      | _A_call_24:
5c f8 09 00                    # 97f0 |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_24:
                               #      | _A_call_25:
5c f8 30 00                    # 97f4 |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_25:
                               #      | _cleanup_fn_init_sd:
dc                             # 97f8 |   ret
                               #      | _end_fn_init_sd:
                               #      | 
                               #      | fn_init_sd_head:
                               #      | _begin_fn_init_sd_head:
1e e0 1c 24 ff 0c              # 97f9 |   setb [0xff24], 0xc
1e e0 1c 24 ff 1f              # 97ff |   setb [0xff24], 0x1f
                               #      | _A_call_23:
e0 00                          # 9805 |   push 0
e0 e0 60 ea                    # 9807 |   push 0xea60
e0 00                          # 980b |   push 0
e0 00                          # 980d |   push 0
5c f8 54 fc                    # 980f |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 9813 |   mov SP, SP + 0x8
                               #      | _Z_call_23:
1e e0 1c 24 ff 0f              # 9817 |   setb [0xff24], 0xf
1e e0 1c 24 ff 1c              # 981d |   setb [0xff24], 0x1c
                               #      | _cleanup_fn_init_sd_head:
dc                             # 9823 |   ret
                               #      | _end_fn_init_sd_head:
                               #      | 
                               #      | fn_init_sd_tail:
                               #      | _begin_fn_init_sd_tail:
e0 60                          # 9824 |   push C
e0 40                          # 9826 |   push B
e0 20                          # 9828 |   push A
                               #      | _A_for_9:
60 60 00                       # 982a |   mov C, 0
                               #      | _BA_for_9:
fc 60 1c f8 0a 30 00           # 982d |   jge C, 0xa, ${_C_for_9}:rel + PC
                               #      | _A_for_10:
60 20 00                       # 9834 |   mov A, 0
                               #      | _BA_for_10:
fc 20 1c f8 ff 1a 00           # 9837 |   jge A, -1, ${_C_for_10}:rel + PC
99 40 e0 1c 26 ff 09           # 983e |   getb B, [0xff26], 0x9
e8 40 00 f8 0c 00              # 9845 |   jeq B, 0, ${_C_for_10}:rel + PC
                               #      | _BZ_for_10:
44 20                          # 984b |   inc A
58 f8 ea ff                    # 984d |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
e8 40 00 f8 0c 00              # 9851 |   jeq B, 0, ${_C_for_9}:rel + PC
                               #      | _BZ_for_9:
44 60                          # 9857 |   inc C
58 f8 d4 ff                    # 9859 |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
c4 fe 00                       # 985d |   inc G, 0
                               #      | _A_if_62:
e8 40 00 f8 09 00              # 9860 |   jeq B, 0, ${_E_if_62}:rel + PC
60 fe 00                       # 9866 |   mov G, 0
                               #      | _E_if_62:
                               #      | _C_if_62:
                               #      | _Z_if_62:
                               #      | _cleanup_fn_init_sd_tail:
e4 20                          # 9869 |   pop A
e4 40                          # 986b |   pop B
e4 60                          # 986d |   pop C
dc                             # 986f |   ret
                               #      | _end_fn_init_sd_tail:
                               #      | 
                               #      | fn_init_oled:
                               #      | _begin_fn_init_oled:
e0 80                          # 9870 |   push D
60 80 e0 32 ff                 # 9872 |   mov D, 0xff32
62 80 00                       # 9877 |   mov [D], 0
1e 80 1c 0f                    # 987a |   setb [D], 0xf
                               #      | _A_call_27:
5c f8 72 00                    # 987e |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_27:
                               #      | _A_call_29:
e0 e0 ae 00                    # 9882 |   push 0xae
5c f8 7d 00                    # 9886 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 988a |   mov SP, SP + 0x2
                               #      | _Z_call_29:
1e 80 1c 0d                    # 988e |   setb [D], 0xd
                               #      | _A_call_30:
5c f8 5e 00                    # 9892 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_30:
1e 80 1c 1d                    # 9896 |   setb [D], 0x1d
                               #      | _A_call_31:
5c f8 56 00                    # 989a |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_31:
                               #      | _A_call_33:
e0 e0 f1 00                    # 989e |   push 0xf1
e0 e0 d9 00                    # 98a2 |   push 0xd9
e0 1c 14                       # 98a6 |   push 0x14
e0 e0 8d 00                    # 98a9 |   push 0x8d
e0 1c 04                       # 98ad |   push 0x4
5c f8 ae 00                    # 98b0 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0a                    # 98b4 |   mov SP, SP + 0xa
                               #      | _Z_call_33:
1e 80 1c 0e                    # 98b8 |   setb [D], 0xe
                               #      | _A_call_34:
5c f8 34 00                    # 98bc |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_34:
                               #      | _A_call_35:
e0 00                          # 98c0 |   push 0
e0 1c 20                       # 98c2 |   push 0x20
e0 e0 af 00                    # 98c5 |   push 0xaf
e0 00                          # 98c9 |   push 0
e0 e0 da 00                    # 98cb |   push 0xda
e0 e0 c0 00                    # 98cf |   push 0xc0
e0 e0 a0 00                    # 98d3 |   push 0xa0
e0 1c 0f                       # 98d7 |   push 0xf
e0 e0 81 00                    # 98da |   push 0x81
e0 1c 09                       # 98de |   push 0x9
5c f8 7d 00                    # 98e1 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 14                    # 98e5 |   mov SP, SP + 0x14
                               #      | _Z_call_35:
                               #      | _A_call_39:
5c f8 a3 00                    # 98e9 |   call ${fn_clear_oled}:rel + PC
                               #      | _Z_call_39:
                               #      | _cleanup_fn_init_oled:
e4 80                          # 98ed |   pop D
dc                             # 98ef |   ret
                               #      | _end_fn_init_oled:
                               #      | 
                               #      | fn_delay_1ms:
                               #      | _begin_fn_delay_1ms:
                               #      | _A_call_26:
e0 00                          # 98f0 |   push 0
e0 e0 60 ea                    # 98f2 |   push 0xea60
e0 00                          # 98f6 |   push 0
e0 00                          # 98f8 |   push 0
5c f8 69 fb                    # 98fa |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 98fe |   mov SP, SP + 0x8
                               #      | _Z_call_26:
                               #      | _cleanup_fn_delay_1ms:
dc                             # 9902 |   ret
                               #      | _end_fn_delay_1ms:
                               #      | 
                               #      | fn_send_oled_cmd:
                               #      | _begin_fn_send_oled_cmd:
                               #      | _A_call_28:
e2 bc 02                       # 9903 |   push [SP + 0x2]
e0 00                          # 9906 |   push 0
5c f8 09 00                    # 9908 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 990c |   mov SP, SP + 0x4
                               #      | _Z_call_28:
                               #      | _cleanup_fn_send_oled_cmd:
dc                             # 9910 |   ret
                               #      | _end_fn_send_oled_cmd:
                               #      | 
                               #      | fn_send_oled_data_or_cmd:
                               #      | _begin_fn_send_oled_data_or_cmd:
e0 40                          # 9911 |   push B
e0 20                          # 9913 |   push A
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
99 40 e0 1c 30 ff 08           # 9915 |   getb B, [0xff30], 0x8
ec 40 00 f8 0a 00              # 991c |   jne B, 0, ${_C_loop_9}:rel + PC
                               #      | _BZ_loop_9:
58 f8 f3 ff                    # 9922 |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
ad 40 bc e0 08 ff 00           # 9926 |   and B, [SP + 0x8], 0xff
ad 20 e0 e0 32 ff 00 ff        # 992d |   and A, [0xff32], 0xff00
30 20 e8 00 01                 # 9935 |   or A, 0x100 + B
                               #      | _A_if_64:
ee bc 00 f8 06 0f 00           # 993a |   jne [SP + 0x6], 0, ${_E_if_64}:rel + PC
1c 20 1c 1c                    # 9941 |   setb A, 0x1c
58 f8 08 00                    # 9945 |   jmp ${_C_if_64}:rel + PC
                               #      | _E_if_64:
1c 20 1c 0c                    # 9949 |   setb A, 0xc
                               #      | _C_if_64:
                               #      | _Z_if_64:
62 e0 20 32 ff                 # 994d |   mov [0xff32], A
9e e0 20 1c 32 ff 18           # 9952 |   setb [0xff32], A, 0x18
                               #      | _cleanup_fn_send_oled_data_or_cmd:
e4 20                          # 9959 |   pop A
e4 40                          # 995b |   pop B
dc                             # 995d |   ret
                               #      | _end_fn_send_oled_data_or_cmd:
                               #      | 
                               #      | fn_send_oled_cmd_sequence:
                               #      | _begin_fn_send_oled_cmd_sequence:
e0 40                          # 995e |   push B
e0 20                          # 9960 |   push A
60 20 bc 08                    # 9962 |   mov A, SP + 0x8
61 40 bc 06                    # 9966 |   mov B, [SP + 0x6]
60 40 45                       # 996a |   mov B, B*2 + A
                               #      | _A_for_11:
                               #      | _BA_for_11:
fc 20 40 f8 1a 00              # 996d |   jge A, B, ${_C_for_11}:rel + PC
                               #      | _A_call_32:
e2 20                          # 9973 |   push [A]
e0 00                          # 9975 |   push 0
5c f8 9a ff                    # 9977 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 997b |   mov SP, SP + 0x4
                               #      | _Z_call_32:
                               #      | _BZ_for_11:
60 20 3c 02                    # 997f |   mov A, A + 0x2
58 f8 ea ff                    # 9983 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
                               #      | _cleanup_fn_send_oled_cmd_sequence:
e4 20                          # 9987 |   pop A
e4 40                          # 9989 |   pop B
dc                             # 998b |   ret
                               #      | _end_fn_send_oled_cmd_sequence:
                               #      | 
                               #      | fn_clear_oled:
                               #      | _begin_fn_clear_oled:
e0 20                          # 998c |   push A
                               #      | _A_call_36:
e0 1c 03                       # 998e |   push 0x3
e0 00                          # 9991 |   push 0
e0 1c 22                       # 9993 |   push 0x22
e0 1c 7f                       # 9996 |   push 0x7f
e0 00                          # 9999 |   push 0
e0 1c 21                       # 999b |   push 0x21
e0 1c 06                       # 999e |   push 0x6
5c f8 bd ff                    # 99a1 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # 99a5 |   mov SP, SP + 0xe
                               #      | _Z_call_36:
                               #      | _A_for_12:
60 20 00                       # 99a9 |   mov A, 0
                               #      | _BA_for_12:
fc 20 e0 f8 00 02 18 00        # 99ac |   jge A, 0x200, ${_C_for_12}:rel + PC
                               #      | _A_call_38:
e0 00                          # 99b4 |   push 0
5c f8 11 00                    # 99b6 |   call ${fn_send_oled_data}:rel + PC
60 a0 bc 02                    # 99ba |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _BZ_for_12:
44 20                          # 99be |   inc A
58 f8 ec ff                    # 99c0 |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _cleanup_fn_clear_oled:
e4 20                          # 99c4 |   pop A
dc                             # 99c6 |   ret
                               #      | _end_fn_clear_oled:
                               #      | 
                               #      | fn_send_oled_data:
                               #      | _begin_fn_send_oled_data:
                               #      | _A_call_37:
e2 bc 02                       # 99c7 |   push [SP + 0x2]
e0 1c 01                       # 99ca |   push 0x1
5c f8 44 ff                    # 99cd |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 99d1 |   mov SP, SP + 0x4
                               #      | _Z_call_37:
                               #      | _cleanup_fn_send_oled_data:
dc                             # 99d5 |   ret
                               #      | _end_fn_send_oled_data:
                               #      | 
                               #      | fn_deinit_oled:
                               #      | _begin_fn_deinit_oled:
e0 80                          # 99d6 |   push D
60 80 e0 32 ff                 # 99d8 |   mov D, 0xff32
                               #      | _A_call_40:
e0 e0 ae 00                    # 99dd |   push 0xae
5c f8 22 ff                    # 99e1 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 99e5 |   mov SP, SP + 0x2
                               #      | _Z_call_40:
1e 80 1c 1e                    # 99e9 |   setb [D], 0x1e
                               #      | _A_call_41:
5c f8 03 ff                    # 99ed |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_41:
1e 80 1c 1f                    # 99f1 |   setb [D], 0x1f
62 e0 00 32 ff                 # 99f5 |   mov [0xff32], 0
                               #      | _cleanup_fn_deinit_oled:
e4 80                          # 99fa |   pop D
dc                             # 99fc |   ret
                               #      | _end_fn_deinit_oled:
                               #      | 
                               #      | fn_quick_deinit_oled:
                               #      | _begin_fn_quick_deinit_oled:
1e e0 1c 32 ff 0f              # 99fd |   setb [0xff32], 0xf
                               #      | _A_call_42:
e0 e0 ae 00                    # 9a03 |   push 0xae
5c f8 fc fe                    # 9a07 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9a0b |   mov SP, SP + 0x2
                               #      | _Z_call_42:
62 e0 00 32 ff                 # 9a0f |   mov [0xff32], 0
                               #      | _cleanup_fn_quick_deinit_oled:
dc                             # 9a14 |   ret
                               #      | _end_fn_quick_deinit_oled:
                               #      | 
                               #      | fn_draw_char_oled:
                               #      | _begin_fn_draw_char_oled:
e0 80                          # 9a15 |   push D
e0 60                          # 9a17 |   push C
e0 40                          # 9a19 |   push B
e0 20                          # 9a1b |   push A
60 a0 bc e0                    # 9a1d |   mov SP, SP + -32
                               #      | _A_call_43:
e2 bc 2e                       # 9a21 |   push [SP + 0x2e]
e0 bc 02                       # 9a24 |   push SP + 0x2
5c f8 ac fb                    # 9a27 |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # 9a2b |   mov SP, SP + 0x4
                               #      | _Z_call_43:
ad 20 bc 1c 2a 01              # 9a2f |   and A, [SP + 0x2a], 0x1
ad 40 bc 1c 2c 07              # 9a35 |   and B, [SP + 0x2c], 0x7
28 40 1c 04                    # 9a3b |   shl B, 0x4
                               #      | _A_call_44:
e0 3d 01                       # 9a3f |   push A*2 + 0x1
e0 21                          # 9a42 |   push A*2
e0 1c 22                       # 9a44 |   push 0x22
e0 5c 0f                       # 9a47 |   push B + 0xf
e0 40                          # 9a4a |   push B
e0 1c 21                       # 9a4c |   push 0x21
e0 1c 06                       # 9a4f |   push 0x6
5c f8 0c ff                    # 9a52 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # 9a56 |   mov SP, SP + 0xe
                               #      | _Z_call_44:
                               #      | _A_for_13:
60 20 00                       # 9a5a |   mov A, 0
                               #      | _BA_for_13:
fc 20 1c f8 10 52 00           # 9a5d |   jge A, 0x10, ${_C_for_13}:rel + PC
80 60 21 a0                    # 9a64 |   add C, A*2, SP
                               #      | _A_for_14:
e0 20                          # 9a68 |   push A
60 40 00                       # 9a6a |   mov B, 0
                               #      | _BA_for_14:
fc 40 1c f8 10 38 00           # 9a6d |   jge B, 0x10, ${_C_for_14}:rel + PC
60 20 00                       # 9a74 |   mov A, 0
                               #      | _A_for_15:
60 80 1c 07                    # 9a77 |   mov D, 0x7
                               #      | _BA_for_15:
e8 80 1c f8 ff 17 00           # 9a7b |   jeq D, -1, ${_C_for_15}:rel + PC
99 fe 8d 40                    # 9a82 |   getb G, [D*2 + C], B
40 fe                          # 9a86 |   bool G
b0 20 21 fe                    # 9a88 |   or A, A*2, G
                               #      | _BZ_for_15:
48 80                          # 9a8c |   dec D
58 f8 ed ff                    # 9a8e |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
                               #      | _A_call_45:
e0 20                          # 9a92 |   push A
e0 1c 01                       # 9a94 |   push 0x1
5c f8 7a fe                    # 9a97 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9a9b |   mov SP, SP + 0x4
                               #      | _Z_call_45:
                               #      | _BZ_for_14:
44 40                          # 9a9f |   inc B
58 f8 cc ff                    # 9aa1 |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
e4 20                          # 9aa5 |   pop A
                               #      | _Z_for_14:
                               #      | _BZ_for_13:
60 20 3c 08                    # 9aa7 |   mov A, A + 0x8
58 f8 b2 ff                    # 9aab |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
                               #      | _cleanup_fn_draw_char_oled:
60 a0 bc 20                    # 9aaf |   mov SP, SP + 0x20
e4 20                          # 9ab3 |   pop A
e4 40                          # 9ab5 |   pop B
e4 60                          # 9ab7 |   pop C
e4 80                          # 9ab9 |   pop D
dc                             # 9abb |   ret
                               #      | _end_fn_draw_char_oled:
                               #      | 
                               #      | fn_draw_str_oled:
                               #      | _begin_fn_draw_str_oled:
e0 80                          # 9abc |   push D
e0 60                          # 9abe |   push C
e0 40                          # 9ac0 |   push B
e0 20                          # 9ac2 |   push A
61 60 bc 0a                    # 9ac4 |   mov C, [SP + 0xa]
61 80 bc 0c                    # 9ac8 |   mov D, [SP + 0xc]
61 20 bc 0e                    # 9acc |   mov A, [SP + 0xe]
                               #      | _A_loop_10:
                               #      | _BA_loop_10:
65 40 20                       # 9ad0 |   bmov B, [A]
e8 40 00 f8 1c 00              # 9ad3 |   jeq B, 0, ${_C_loop_10}:rel + PC
                               #      | _A_call_46:
e0 40                          # 9ad9 |   push B
e0 80                          # 9adb |   push D
e0 60                          # 9add |   push C
5c f8 36 ff                    # 9adf |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 9ae3 |   mov SP, SP + 0x6
                               #      | _Z_call_46:
44 20                          # 9ae7 |   inc A
44 80                          # 9ae9 |   inc D
                               #      | _BZ_loop_10:
58 f8 e5 ff                    # 9aeb |   jmp ${_BA_loop_10}:rel + PC
                               #      | _C_loop_10:
                               #      | _Z_loop_10:
                               #      | _cleanup_fn_draw_str_oled:
e4 20                          # 9aef |   pop A
e4 40                          # 9af1 |   pop B
e4 60                          # 9af3 |   pop C
e4 80                          # 9af5 |   pop D
dc                             # 9af7 |   ret
                               #      | _end_fn_draw_str_oled:
                               #      | 
                               #      | fn_draw_char:
                               #      | _begin_fn_draw_char:
e0 40                          # 9af8 |   push B
e0 20                          # 9afa |   push A
60 a0 bc e0                    # 9afc |   mov SP, SP + -32
                               #      | _A_call_47:
e2 bc 2a                       # 9b00 |   push [SP + 0x2a]
e0 bc 02                       # 9b03 |   push SP + 0x2
5c f8 cd fa                    # 9b06 |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # 9b0a |   mov SP, SP + 0x4
                               #      | _Z_call_47:
                               #      | _A_call_48:
e0 a0                          # 9b0e |   push SP
e2 bc 2a                       # 9b10 |   push [SP + 0x2a]
e2 bc 2a                       # 9b13 |   push [SP + 0x2a]
5c f8 11 00                    # 9b16 |   call ${fn_fill_cell_content}:rel + PC
60 a0 bc 06                    # 9b1a |   mov SP, SP + 0x6
                               #      | _Z_call_48:
                               #      | _cleanup_fn_draw_char:
60 a0 bc 20                    # 9b1e |   mov SP, SP + 0x20
e4 20                          # 9b22 |   pop A
e4 40                          # 9b24 |   pop B
dc                             # 9b26 |   ret
                               #      | _end_fn_draw_char:
                               #      | 
                               #      | fn_fill_cell_content:
                               #      | _begin_fn_fill_cell_content:
e0 60                          # 9b27 |   push C
e0 40                          # 9b29 |   push B
e0 20                          # 9b2b |   push A
a9 20 bc 1c 0a 01              # 9b2d |   shl A, [SP + 0xa], 0x1
01 20 bc 08                    # 9b33 |   add A, [SP + 0x8]
60 60 e4 00 05                 # 9b37 |   mov C, 0x500 + A
61 40 bc 0c                    # 9b3c |   mov B, [SP + 0xc]
                               #      | _A_for_16:
                               #      | _BA_for_16:
fc 20 60 f8 15 00              # 9b40 |   jge A, C, ${_C_for_16}:rel + PC
63 20 40                       # 9b46 |   mov [A], [B]
                               #      | _BZ_for_16:
60 20 3c 50                    # 9b49 |   mov A, A + 0x50
60 40 5c 02                    # 9b4d |   mov B, B + 0x2
58 f8 ef ff                    # 9b51 |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
                               #      | _Z_for_16:
                               #      | _cleanup_fn_fill_cell_content:
e4 20                          # 9b55 |   pop A
e4 40                          # 9b57 |   pop B
e4 60                          # 9b59 |   pop C
dc                             # 9b5b |   ret
                               #      | _end_fn_fill_cell_content:
                               #      | 
                               #      | fn_draw_str:
                               #      | _begin_fn_draw_str:
e0 40                          # 9b5c |   push B
e0 20                          # 9b5e |   push A
61 20 bc 08                    # 9b60 |   mov A, [SP + 0x8]
61 40 bc 0a                    # 9b64 |   mov B, [SP + 0xa]
                               #      | _A_loop_11:
                               #      | _BA_loop_11:
fc 20 1c f8 28 27 00           # 9b68 |   jge A, 0x28, ${_C_loop_11}:rel + PC
65 ff 40                       # 9b6f |   bmov H, [B]
e8 ff 00 f8 1d 00              # 9b72 |   jeq H, 0, ${_C_loop_11}:rel + PC
                               #      | _A_call_49:
e0 ff                          # 9b78 |   push H
e0 20                          # 9b7a |   push A
e2 bc 0a                       # 9b7c |   push [SP + 0xa]
5c f8 79 ff                    # 9b7f |   call ${fn_draw_char}:rel + PC
60 a0 bc 06                    # 9b83 |   mov SP, SP + 0x6
                               #      | _Z_call_49:
44 20                          # 9b87 |   inc A
44 40                          # 9b89 |   inc B
                               #      | _BZ_loop_11:
58 f8 dd ff                    # 9b8b |   jmp ${_BA_loop_11}:rel + PC
                               #      | _C_loop_11:
                               #      | _Z_loop_11:
                               #      | _cleanup_fn_draw_str:
e4 20                          # 9b8f |   pop A
e4 40                          # 9b91 |   pop B
dc                             # 9b93 |   ret
                               #      | _end_fn_draw_str:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_51:
e0 00                          # 9b94 |   push 0
5c f8 15 00                    # 9b96 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9b9a |   mov SP, SP + 0x2
                               #      | _Z_call_51:
                               #      | _A_call_52:
e0 e0 47 ae                    # 9b9e |   push ${const__str__PONG__endl}
5c f8 36 f6                    # 9ba2 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9ba6 |   mov SP, SP + 0x2
                               #      | _Z_call_52:
                               #      | _cleanup_fn_handle_ping:
dc                             # 9baa |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # 9bab |   inc G, 0
                               #      | _A_if_68:
eb e0 bc f8 c3 b0 02 1f 00     # 9bae |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_68}:rel + PC
                               #      | _A_call_50:
e2 e0 c3 b0                    # 9bb7 |   push [${var__g_num_args}]
e2 bc 04                       # 9bbb |   push [SP + 0x4]
e0 e0 23 ae                    # 9bbe |   push ${const__data_1}
5c f8 48 f4                    # 9bc2 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9bc6 |   mov SP, SP + 0x6
                               #      | _Z_call_50:
60 fe 00                       # 9bca |   mov G, 0
                               #      | _E_if_68:
                               #      | _C_if_68:
                               #      | _Z_if_68:
                               #      | _cleanup_fn_check_num_args:
dc                             # 9bcd |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # 9bce |   push D
e0 60                          # 9bd0 |   push C
e0 40                          # 9bd2 |   push B
e0 20                          # 9bd4 |   push A
60 a0 bc fa                    # 9bd6 |   mov SP, SP + -6
                               #      | _A_call_53:
e0 1c 02                       # 9bda |   push 0x2
5c f8 ce ff                    # 9bdd |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9be1 |   mov SP, SP + 0x2
                               #      | _Z_call_53:
e8 fe 00 f8 9f 00              # 9be5 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_55:
5c f8 a6 00                    # 9beb |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_55:
e8 fe 00 f8 95 00              # 9bef |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 c6 b0                 # 9bf5 |   mov A, [${var__g_args}]
61 40 e0 c8 b0                 # 9bfa |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_56:
e0 40                          # 9bff |   push B
e0 20                          # 9c01 |   push A
e0 e0 69 ae                    # 9c03 |   push ${const__data_2}
5c f8 03 f4                    # 9c07 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9c0b |   mov SP, SP + 0x6
                               #      | _Z_call_56:
                               #      | _A_if_74:
ee bc 1c f8 10 04 35 00        # 9c0f |   jne [SP + 0x10], 0x4, ${_E_if_74}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 29 00              # 9c17 |   jge A, B, ${_C_while_7}:rel + PC
61 60 20                       # 9c1d |   mov C, [A]
                               #      | _A_call_57:
e0 60                          # 9c20 |   push C
5c f8 51 f5                    # 9c22 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9c26 |   mov SP, SP + 0x2
                               #      | _Z_call_57:
20 60 1c 08                    # 9c2a |   shr C, 0x8
                               #      | _A_call_58:
e0 60                          # 9c2e |   push C
5c f8 43 f5                    # 9c30 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9c34 |   mov SP, SP + 0x2
                               #      | _Z_call_58:
60 20 3c 02                    # 9c38 |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 db ff                    # 9c3c |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 39 00                    # 9c40 |   jmp ${_C_if_74}:rel + PC
                               #      | _E_if_74:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 35 00              # 9c44 |   jge A, B, ${_C_while_8}:rel + PC
95 80 20 1c 08                 # 9c4a |   ror D, [A], 0x8
                               #      | _A_if_75:
ee bc 1c f8 10 0b 0c 00        # 9c4f |   jne [SP + 0x10], 0xb, ${_E_if_75}:rel + PC
14 80 1c 08                    # 9c57 |   ror D, 0x8
                               #      | _E_if_75:
                               #      | _C_if_75:
                               #      | _Z_if_75:
                               #      | _A_call_59:
e0 a0                          # 9c5b |   push SP
e0 80                          # 9c5d |   push D
5c f8 9b f5                    # 9c5f |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9c63 |   mov SP, SP + 0x4
                               #      | _Z_call_59:
                               #      | _A_call_60:
e0 a0                          # 9c67 |   push SP
5c f8 6f f5                    # 9c69 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9c6d |   mov SP, SP + 0x2
                               #      | _Z_call_60:
60 20 3c 02                    # 9c71 |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 cf ff                    # 9c75 |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_74:
                               #      | _Z_if_74:
                               #      | _A_call_61:
e0 1c 0a                       # 9c79 |   push 0xa
5c f8 f7 f4                    # 9c7c |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9c80 |   mov SP, SP + 0x2
                               #      | _Z_call_61:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # 9c84 |   mov SP, SP + 0x6
e4 20                          # 9c88 |   pop A
e4 40                          # 9c8a |   pop B
e4 60                          # 9c8c |   pop C
e4 80                          # 9c8e |   pop D
dc                             # 9c90 |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # 9c91 |   push C
e0 40                          # 9c93 |   push B
e0 20                          # 9c95 |   push A
61 20 e0 c6 b0                 # 9c97 |   mov A, [${var__g_args}]
61 40 e0 c8 b0                 # 9c9c |   mov B, [${var__g_args} + 0002]
60 60 e0 4d ae                 # 9ca1 |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # 9ca6 |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 5c ae                 # 9cac |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # 9cb1 |   and G, A, 0x1
ec fe 00 f8 18 00              # 9cb6 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # 9cbc |   and G, B, 0x1
ec fe 00 f8 0d 00              # 9cc1 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # 9cc7 |   inc G, 0
58 f8 11 00                    # 9cca |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_54:
e0 60                          # 9cce |   push C
5c f8 08 f5                    # 9cd0 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9cd4 |   mov SP, SP + 0x2
                               #      | _Z_call_54:
60 fe 00                       # 9cd8 |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # 9cdb |   pop A
e4 40                          # 9cdd |   pop B
e4 60                          # 9cdf |   pop C
dc                             # 9ce1 |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # 9ce2 |   push D
e0 60                          # 9ce4 |   push C
e0 40                          # 9ce6 |   push B
e0 20                          # 9ce8 |   push A
60 a0 bc fa                    # 9cea |   mov SP, SP + -6
                               #      | _A_call_62:
e0 1c 02                       # 9cee |   push 0x2
5c f8 ba fe                    # 9cf1 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9cf5 |   mov SP, SP + 0x2
                               #      | _Z_call_62:
e8 fe 00 f8 ce 00              # 9cf9 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_63:
5c f8 92 ff                    # 9cff |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_63:
e8 fe 00 f8 c4 00              # 9d03 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 c6 b0                 # 9d09 |   mov A, [${var__g_args}]
61 40 e0 c8 b0                 # 9d0e |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_78:
ee bc 1c f8 10 03 55 00        # 9d13 |   jne [SP + 0x10], 0x3, ${_E_if_78}:rel + PC
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 20 40 f8 49 00              # 9d1b |   jge A, B, ${_C_while_9}:rel + PC
                               #      | _A_for_17:
60 80 00                       # 9d21 |   mov D, 0
                               #      | _BA_for_17:
fc 80 1c f8 04 19 00           # 9d24 |   jge D, 0x4, ${_C_for_17}:rel + PC
                               #      | _A_call_64:
5c f8 5a f5                    # 9d2b |   call ${fn_getc}:rel + PC
                               #      | _Z_call_64:
62 e0 ff 00 ff                 # 9d2f |   mov [0xff00], H
62 b0 ff                       # 9d34 |   mov [SP + D], H
                               #      | _BZ_for_17:
44 80                          # 9d37 |   inc D
58 f8 eb ff                    # 9d39 |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
                               #      | _Z_for_17:
                               #      | _A_call_65:
e0 a0                          # 9d3d |   push SP
5c f8 a0 f5                    # 9d3f |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9d43 |   mov SP, SP + 0x2
                               #      | _Z_call_65:
e8 fe 00 f8 74 00              # 9d47 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # 9d4d |   shl C, H, 0x8
20 ff 1c 08                    # 9d52 |   shr H, 0x8
30 60 ff                       # 9d56 |   or C, H
62 20 60                       # 9d59 |   mov [A], C
60 20 3c 02                    # 9d5c |   mov A, A + 0x2
                               #      | _BZ_while_9:
58 f8 bb ff                    # 9d60 |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
58 f8 31 00                    # 9d64 |   jmp ${_C_if_78}:rel + PC
                               #      | _E_if_78:
                               #      | _A_while_10:
                               #      | _BA_while_10:
fc 20 40 f8 2d 00              # 9d68 |   jge A, B, ${_C_while_10}:rel + PC
                               #      | _A_call_66:
5c f8 17 f5                    # 9d6e |   call ${fn_getc}:rel + PC
                               #      | _Z_call_66:
62 e0 ff 00 ff                 # 9d72 |   mov [0xff00], H
60 60 ff                       # 9d77 |   mov C, H
                               #      | _A_call_67:
5c f8 0b f5                    # 9d7a |   call ${fn_getc}:rel + PC
                               #      | _Z_call_67:
62 e0 ff 00 ff                 # 9d7e |   mov [0xff00], H
28 ff 1c 08                    # 9d83 |   shl H, 0x8
30 60 ff                       # 9d87 |   or C, H
62 20 60                       # 9d8a |   mov [A], C
60 20 3c 02                    # 9d8d |   mov A, A + 0x2
                               #      | _BZ_while_10:
58 f8 d7 ff                    # 9d91 |   jmp ${_BA_while_10}:rel + PC
                               #      | _C_while_10:
                               #      | _Z_while_10:
                               #      | _C_if_78:
                               #      | _Z_if_78:
                               #      | _A_call_68:
5c f8 f0 f4                    # 9d95 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_68:
62 e0 ff 00 ff                 # 9d99 |   mov [0xff00], H
ec ff 1c f8 0a 1d 00           # 9d9e |   jne H, 0xa, ${_L_fn_handle_write_1}:rel + PC
                               #      | _A_call_69:
e0 40                          # 9da5 |   push B
e2 e0 c6 b0                    # 9da7 |   push [${var__g_args}]
e0 e0 78 ae                    # 9dab |   push ${const__data_3}
5c f8 5b f2                    # 9daf |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9db3 |   mov SP, SP + 0x6
                               #      | _Z_call_69:
58 f8 10 00                    # 9db7 |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_70:
e0 e0 88 ae                    # 9dbb |   push ${const__data_4}
5c f8 19 f4                    # 9dbf |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9dc3 |   mov SP, SP + 0x2
                               #      | _Z_call_70:
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # 9dc7 |   mov SP, SP + 0x6
e4 20                          # 9dcb |   pop A
e4 40                          # 9dcd |   pop B
e4 60                          # 9dcf |   pop C
e4 80                          # 9dd1 |   pop D
dc                             # 9dd3 |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
e0 20                          # 9dd4 |   push A
                               #      | _A_call_71:
e0 1c 01                       # 9dd6 |   push 0x1
5c f8 d2 fd                    # 9dd9 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9ddd |   mov SP, SP + 0x2
                               #      | _Z_call_71:
e8 fe 00 f8 4b 00              # 9de1 |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_call_73:
e0 1c 52                       # 9de7 |   push 0x52
5c f8 45 00                    # 9dea |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # 9dee |   mov SP, SP + 0x2
                               #      | _Z_call_73:
62 e0 00 0a ff                 # 9df2 |   mov [0xff0a], 0
61 20 e0 c6 b0                 # 9df7 |   mov A, [${var__g_args}]
                               #      | _A_if_82:
ee bc 1c f8 04 06 18 00        # 9dfc |   jne [SP + 0x4], 0x6, ${_E_if_82}:rel + PC
                               #      | _A_call_74:
e0 20                          # 9e04 |   push A
e0 e0 97 ae                    # 9e06 |   push ${const__data_5}
5c f8 00 f2                    # 9e0a |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9e0e |   mov SP, SP + 0x4
                               #      | _Z_call_74:
58 20                          # 9e12 |   jmp A
                               #      | _E_if_82:
                               #      | _C_if_82:
                               #      | _Z_if_82:
                               #      | _A_call_75:
e0 20                          # 9e14 |   push A
e0 e0 a2 ae                    # 9e16 |   push ${const__data_6}
5c f8 f0 f1                    # 9e1a |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9e1e |   mov SP, SP + 0x4
                               #      | _Z_call_75:
                               #      | _A_call_76:
e0 20                          # 9e22 |   push A
5c f8 1d 00                    # 9e24 |   call ${fn_jmp_to_target_persisted}:rel + PC
60 a0 bc 02                    # 9e28 |   mov SP, SP + 0x2
                               #      | _Z_call_76:
                               #      | _cleanup_fn_handle_jmp:
e4 20                          # 9e2c |   pop A
dc                             # 9e2e |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_show_status:
                               #      | _begin_fn_show_status:
                               #      | _A_call_72:
e2 bc 02                       # 9e2f |   push [SP + 0x2]
e0 1c 07                       # 9e32 |   push 0x7
e0 1c 01                       # 9e35 |   push 0x1
5c f8 dd fb                    # 9e38 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 9e3c |   mov SP, SP + 0x6
                               #      | _Z_call_72:
                               #      | _cleanup_fn_show_status:
dc                             # 9e40 |   ret
                               #      | _end_fn_show_status:
                               #      | 
                               #      | fn_jmp_to_target_persisted:
                               #      | _begin_fn_jmp_to_target_persisted:
63 e0 bc 1c ff 02              # 9e41 |   mov [0xff1c], [SP + 0x2]
                               #      | glb_jmp_to_stored_target:
60 20 00                       # 9e47 |   mov A, 0
60 40 00                       # 9e4a |   mov B, 0
60 60 00                       # 9e4d |   mov C, 0
60 80 00                       # 9e50 |   mov D, 0
60 a0 00                       # 9e53 |   mov SP, 0
60 fc 00                       # 9e56 |   mov E, 0
60 fd 00                       # 9e59 |   mov F, 0
60 fe 00                       # 9e5c |   mov G, 0
60 ff 00                       # 9e5f |   mov H, 0
5a e0 1c ff                    # 9e62 |   jmp [0xff1c]
                               #      | _cleanup_fn_jmp_to_target_persisted:
dc                             # 9e66 |   ret
                               #      | _end_fn_jmp_to_target_persisted:
                               #      | 
                               #      | fn_handle_init_sd:
                               #      | _begin_fn_handle_init_sd:
                               #      | _A_call_77:
5c f8 89 f9                    # 9e67 |   call ${fn_init_sd}:rel + PC
                               #      | _Z_call_77:
                               #      | _A_if_83:
ec fe 00 f8 16 00              # 9e6b |   jne G, 0, ${_E_if_83}:rel + PC
                               #      | _A_call_78:
e0 e0 b4 ae                    # 9e71 |   push ${const__str__TIMEOUT__endl}
5c f8 63 f3                    # 9e75 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e79 |   mov SP, SP + 0x2
                               #      | _Z_call_78:
58 f8 10 00                    # 9e7d |   jmp ${_C_if_83}:rel + PC
                               #      | _E_if_83:
                               #      | _A_call_79:
e0 e0 bd ae                    # 9e81 |   push ${const__str__INIT_OK__endl}
5c f8 53 f3                    # 9e85 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e89 |   mov SP, SP + 0x2
                               #      | _Z_call_79:
                               #      | _C_if_83:
                               #      | _Z_if_83:
                               #      | _cleanup_fn_handle_init_sd:
dc                             # 9e8d |   ret
                               #      | _end_fn_handle_init_sd:
                               #      | 
                               #      | fn_handle_read_sd:
                               #      | _begin_fn_handle_read_sd:
e0 40                          # 9e8e |   push B
e0 20                          # 9e90 |   push A
60 a0 bc fa                    # 9e92 |   mov SP, SP + -6
60 a0 f4 f0 fd                 # 9e96 |   mov SP, 0xfdf0 + SP
                               #      | _A_call_80:
e0 1c 02                       # 9e9b |   push 0x2
5c f8 0d fd                    # 9e9e |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9ea2 |   mov SP, SP + 0x2
                               #      | _Z_call_80:
e8 fe 00 f8 7d 00              # 9ea6 |   jeq G, 0, ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _A_call_81:
e2 e0 c8 b0                    # 9eac |   push [${var__g_args} + 0002]
e2 e0 c6 b0                    # 9eb0 |   push [${var__g_args}]
e0 e0 00 02                    # 9eb4 |   push 0x200
e0 bc 06                       # 9eb8 |   push SP + 0x6
5c f8 5a f7                    # 9ebb |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # 9ebf |   mov SP, SP + 0x8
                               #      | _Z_call_81:
                               #      | _A_if_85:
ec fe 00 f8 16 00              # 9ec3 |   jne G, 0, ${_E_if_85}:rel + PC
                               #      | _A_call_82:
e0 e0 b4 ae                    # 9ec9 |   push ${const__str__TIMEOUT__endl}
5c f8 0b f3                    # 9ecd |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9ed1 |   mov SP, SP + 0x2
                               #      | _Z_call_82:
58 f8 4e 00                    # 9ed5 |   jmp ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _E_if_85:
                               #      | _C_if_85:
                               #      | _Z_if_85:
                               #      | _A_call_83:
e2 e0 c8 b0                    # 9ed9 |   push [${var__g_args} + 0002]
e2 e0 c6 b0                    # 9edd |   push [${var__g_args}]
e0 e0 c6 ae                    # 9ee1 |   push ${const__data_7}
5c f8 25 f1                    # 9ee5 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9ee9 |   mov SP, SP + 0x6
                               #      | _Z_call_83:
                               #      | _A_for_18:
60 40 a0                       # 9eed |   mov B, SP
                               #      | _BA_for_18:
fc 40 f4 f8 00 02 28 00        # 9ef0 |   jge B, 0x200 + SP, ${_C_for_18}:rel + PC
                               #      | _A_call_84:
e0 f4 10 02                    # 9ef8 |   push 0x210 + SP
e2 40                          # 9efc |   push [B]
5c f8 fc f2                    # 9efe |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9f02 |   mov SP, SP + 0x4
                               #      | _Z_call_84:
                               #      | _A_call_85:
e0 f4 12 02                    # 9f06 |   push 0x212 + SP
5c f8 ce f2                    # 9f0a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9f0e |   mov SP, SP + 0x2
                               #      | _Z_call_85:
                               #      | _BZ_for_18:
44 40                          # 9f12 |   inc B
58 f8 dc ff                    # 9f14 |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
                               #      | _Z_for_18:
                               #      | _A_call_86:
e0 1c 0a                       # 9f18 |   push 0xa
5c f8 58 f2                    # 9f1b |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9f1f |   mov SP, SP + 0x2
                               #      | _Z_call_86:
                               #      | _cleanup_fn_handle_read_sd:
60 a0 f4 16 02                 # 9f23 |   mov SP, 0x216 + SP
e4 20                          # 9f28 |   pop A
e4 40                          # 9f2a |   pop B
dc                             # 9f2c |   ret
                               #      | _end_fn_handle_read_sd:
                               #      | 
                               #      | fn_handle_init_oled:
                               #      | _begin_fn_handle_init_oled:
                               #      | _A_call_87:
5c f8 43 f9                    # 9f2d |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_87:
                               #      | _A_call_88:
e0 e0 d8 ae                    # 9f31 |   push ${const__str__DONE__endl}
5c f8 a3 f2                    # 9f35 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9f39 |   mov SP, SP + 0x2
                               #      | _Z_call_88:
                               #      | _cleanup_fn_handle_init_oled:
dc                             # 9f3d |   ret
                               #      | _end_fn_handle_init_oled:
                               #      | 
                               #      | fn_handle_deinit_oled:
                               #      | _begin_fn_handle_deinit_oled:
                               #      | _A_call_89:
5c f8 98 fa                    # 9f3e |   call ${fn_deinit_oled}:rel + PC
                               #      | _Z_call_89:
                               #      | _A_call_90:
e0 e0 d8 ae                    # 9f42 |   push ${const__str__DONE__endl}
5c f8 92 f2                    # 9f46 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9f4a |   mov SP, SP + 0x2
                               #      | _Z_call_90:
                               #      | _cleanup_fn_handle_deinit_oled:
dc                             # 9f4e |   ret
                               #      | _end_fn_handle_deinit_oled:
                               #      | 
                               #      | fn_handle_write_sd:
                               #      | _begin_fn_handle_write_sd:
e0 80                          # 9f4f |   push D
e0 60                          # 9f51 |   push C
e0 40                          # 9f53 |   push B
e0 20                          # 9f55 |   push A
60 a0 bc fa                    # 9f57 |   mov SP, SP + -6
60 a0 f4 f0 fd                 # 9f5b |   mov SP, 0xfdf0 + SP
                               #      | _A_call_91:
e0 1c 02                       # 9f60 |   push 0x2
5c f8 48 fc                    # 9f63 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9f67 |   mov SP, SP + 0x2
                               #      | _Z_call_91:
e8 fe 00 f8 c9 00              # 9f6b |   jeq G, 0, ${_cleanup_fn_handle_write_sd}:rel + PC
60 20 a0                       # 9f71 |   mov A, SP
                               #      | _A_while_11:
                               #      | _BA_while_11:
fc 20 f4 f8 00 02 5f 00        # 9f74 |   jge A, 0x200 + SP, ${_C_while_11}:rel + PC
                               #      | _A_if_87:
ee f4 1c f8 20 02 0d 45 00     # 9f7c |   jne [0x220 + SP], 0xd, ${_E_if_87}:rel + PC
                               #      | _A_for_19:
60 80 00                       # 9f85 |   mov D, 0
                               #      | _BA_for_19:
fc 80 1c f8 02 1e 00           # 9f88 |   jge D, 0x2, ${_C_for_19}:rel + PC
                               #      | _A_call_92:
5c f8 f6 f2                    # 9f8f |   call ${fn_getc}:rel + PC
                               #      | _Z_call_92:
62 e0 ff 00 ff                 # 9f93 |   mov [0xff00], H
60 60 f4 10 02                 # 9f98 |   mov C, 0x210 + SP
62 70 ff                       # 9f9d |   mov [C + D], H
                               #      | _BZ_for_19:
44 80                          # 9fa0 |   inc D
58 f8 e6 ff                    # 9fa2 |   jmp ${_BA_for_19}:rel + PC
                               #      | _C_for_19:
                               #      | _Z_for_19:
                               #      | _A_call_93:
e0 f4 10 02                    # 9fa6 |   push 0x210 + SP
5c f8 35 f3                    # 9faa |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9fae |   mov SP, SP + 0x2
                               #      | _Z_call_93:
e8 fe 00 f8 76 00              # 9fb2 |   jeq G, 0, ${_L_fn_handle_write_sd_1}:rel + PC
62 20 ff                       # 9fb8 |   mov [A], H
44 20                          # 9fbb |   inc A
58 f8 12 00                    # 9fbd |   jmp ${_C_if_87}:rel + PC
                               #      | _E_if_87:
                               #      | _A_call_94:
5c f8 c4 f2                    # 9fc1 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_94:
62 e0 ff 00 ff                 # 9fc5 |   mov [0xff00], H
62 20 ff                       # 9fca |   mov [A], H
44 20                          # 9fcd |   inc A
                               #      | _C_if_87:
                               #      | _Z_if_87:
                               #      | _BZ_while_11:
58 f8 a5 ff                    # 9fcf |   jmp ${_BA_while_11}:rel + PC
                               #      | _C_while_11:
                               #      | _Z_while_11:
                               #      | _A_call_95:
5c f8 b2 f2                    # 9fd3 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_95:
62 e0 ff 00 ff                 # 9fd7 |   mov [0xff00], H
ec ff 1c f8 0a 4c 00           # 9fdc |   jne H, 0xa, ${_L_fn_handle_write_sd_1}:rel + PC
                               #      | _A_call_96:
e2 e0 c8 b0                    # 9fe3 |   push [${var__g_args} + 0002]
e2 e0 c6 b0                    # 9fe7 |   push [${var__g_args}]
e0 e0 00 02                    # 9feb |   push 0x200
e0 bc 06                       # 9fef |   push SP + 0x6
5c f8 42 f7                    # 9ff2 |   call ${fn_write_sd}:rel + PC
60 a0 bc 08                    # 9ff6 |   mov SP, SP + 0x8
                               #      | _Z_call_96:
                               #      | _A_if_90:
ec fe 00 f8 16 00              # 9ffa |   jne G, 0, ${_E_if_90}:rel + PC
                               #      | _A_call_97:
e0 e0 b4 ae                    # a000 |   push ${const__str__TIMEOUT__endl}
5c f8 d4 f1                    # a004 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a008 |   mov SP, SP + 0x2
                               #      | _Z_call_97:
58 f8 28 00                    # a00c |   jmp ${_cleanup_fn_handle_write_sd}:rel + PC
                               #      | _E_if_90:
                               #      | _C_if_90:
                               #      | _Z_if_90:
                               #      | _A_call_98:
e2 e0 c8 b0                    # a010 |   push [${var__g_args} + 0002]
e2 e0 c6 b0                    # a014 |   push [${var__g_args}]
e0 e0 de ae                    # a018 |   push ${const__data_8}
5c f8 ee ef                    # a01c |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a020 |   mov SP, SP + 0x6
                               #      | _Z_call_98:
58 f8 10 00                    # a024 |   jmp ${_cleanup_fn_handle_write_sd}:rel + PC
                               #      | _L_fn_handle_write_sd_1:
                               #      | _A_call_99:
e0 e0 88 ae                    # a028 |   push ${const__data_4}
5c f8 ac f1                    # a02c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a030 |   mov SP, SP + 0x2
                               #      | _Z_call_99:
                               #      | _cleanup_fn_handle_write_sd:
60 a0 f4 16 02                 # a034 |   mov SP, 0x216 + SP
e4 20                          # a039 |   pop A
e4 40                          # a03b |   pop B
e4 60                          # a03d |   pop C
e4 80                          # a03f |   pop D
dc                             # a041 |   ret
                               #      | _end_fn_handle_write_sd:
                               #      | 
                               #      | fn_handle_mmap:
                               #      | _begin_fn_handle_mmap:
e0 80                          # a042 |   push D
e0 60                          # a044 |   push C
e0 40                          # a046 |   push B
e0 20                          # a048 |   push A
                               #      | _A_call_100:
e0 fc                          # a04a |   push E
e0 1c 05                       # a04c |   push 0x5
5c f8 5c fb                    # a04f |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a053 |   mov SP, SP + 0x2
e4 fc                          # a057 |   pop E
                               #      | _Z_call_100:
e8 fe 00 f8 3f 00              # a059 |   jeq G, 0, ${_cleanup_fn_handle_mmap}:rel + PC
61 20 e0 c6 b0                 # a05f |   mov A, [${var__g_args}]
61 40 e0 c8 b0                 # a064 |   mov B, [${var__g_args} + 0002]
61 60 e0 ca b0                 # a069 |   mov C, [${var__g_args} + 0004]
61 80 e0 cc b0                 # a06e |   mov D, [${var__g_args} + 0006]
ad fc e0 1c ce b0 03           # a073 |   and E, [${var__g_args} + 0008], 0x3
54 60 80 fc                    # a07a |   mmap C, D, E
                               #      | _A_call_101:
e0 fc                          # a07e |   push E
e0 fc                          # a080 |   push E
e0 80                          # a082 |   push D
e0 60                          # a084 |   push C
e0 40                          # a086 |   push B
e0 20                          # a088 |   push A
e0 e0 f1 ae                    # a08a |   push ${const__data_9}
5c f8 7c ef                    # a08e |   call ${fn_printf}:rel + PC
60 a0 bc 0c                    # a092 |   mov SP, SP + 0xc
e4 fc                          # a096 |   pop E
                               #      | _Z_call_101:
                               #      | _cleanup_fn_handle_mmap:
e4 20                          # a098 |   pop A
e4 40                          # a09a |   pop B
e4 60                          # a09c |   pop C
e4 80                          # a09e |   pop D
dc                             # a0a0 |   ret
                               #      | _end_fn_handle_mmap:
                               #      | 
                               #      | fn_handle_umap:
                               #      | _begin_fn_handle_umap:
e0 20                          # a0a1 |   push A
                               #      | _A_call_102:
e0 1c 01                       # a0a3 |   push 0x1
5c f8 05 fb                    # a0a6 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a0aa |   mov SP, SP + 0x2
                               #      | _Z_call_102:
e8 fe 00 f8 1d 00              # a0ae |   jeq G, 0, ${_cleanup_fn_handle_umap}:rel + PC
ad 20 e0 1c c6 b0 03           # a0b4 |   and A, [${var__g_args}], 0x3
d4 20                          # a0bb |   umap A
                               #      | _A_call_103:
e0 20                          # a0bd |   push A
e0 e0 09 af                    # a0bf |   push ${const__data_10}
5c f8 47 ef                    # a0c3 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a0c7 |   mov SP, SP + 0x4
                               #      | _Z_call_103:
                               #      | _cleanup_fn_handle_umap:
e4 20                          # a0cb |   pop A
dc                             # a0cd |   ret
                               #      | _end_fn_handle_umap:
                               #      | 
                               #      | fn_handle_show_img:
                               #      | _begin_fn_handle_show_img:
                               #      | _A_call_104:
e0 1c 02                       # a0ce |   push 0x2
5c f8 da fa                    # a0d1 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a0d5 |   mov SP, SP + 0x2
                               #      | _Z_call_104:
e8 fe 00 f8 4e 00              # a0d9 |   jeq G, 0, ${_cleanup_fn_handle_show_img}:rel + PC
                               #      | _A_if_94:
ee e0 00 f8 d4 b0 15 00        # a0df |   jne [${var__g_has_sd_card}], 0, ${_E_if_94}:rel + PC
                               #      | _A_call_105:
e0 e0 15 af                    # a0e7 |   push ${const__str__NO_SD__endl}
5c f8 ed f0                    # a0eb |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0ef |   mov SP, SP + 0x2
                               #      | _Z_call_105:
dc                             # a0f3 |   ret
                               #      | _E_if_94:
                               #      | _C_if_94:
                               #      | _Z_if_94:
                               #      | _A_call_110:
e2 e0 c8 b0                    # a0f4 |   push [${var__g_args} + 0002]
e2 e0 c6 b0                    # a0f8 |   push [${var__g_args}]
5c f8 2c 00                    # a0fc |   call ${fn_display_image}:rel + PC
60 a0 bc 04                    # a100 |   mov SP, SP + 0x4
                               #      | _Z_call_110:
                               #      | _A_if_99:
ec fe 1c f8 01 17 00           # a104 |   jne G, 0x1, ${_E_if_99}:rel + PC
                               #      | _A_call_111:
e0 e0 1c af                    # a10b |   push ${const__str__SHOW_IMG_OK__endl}
5c f8 c9 f0                    # a10f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a113 |   mov SP, SP + 0x2
                               #      | _Z_call_111:
58 f8 10 00                    # a117 |   jmp ${_C_if_99}:rel + PC
                               #      | _E_if_99:
                               #      | _A_call_112:
e0 e0 29 af                    # a11b |   push ${const__str__SHOW_IMG_ERROR__endl}
5c f8 b9 f0                    # a11f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a123 |   mov SP, SP + 0x2
                               #      | _Z_call_112:
                               #      | _C_if_99:
                               #      | _Z_if_99:
                               #      | _cleanup_fn_handle_show_img:
dc                             # a127 |   ret
                               #      | _end_fn_handle_show_img:
                               #      | 
                               #      | fn_display_image:
                               #      | _begin_fn_display_image:
e0 80                          # a128 |   push D
e0 60                          # a12a |   push C
e0 40                          # a12c |   push B
e0 20                          # a12e |   push A
60 a0 f4 f0 fd                 # a130 |   mov SP, 0xfdf0 + SP
a9 60 f4 1c 1c 02 08           # a135 |   shl C, [0x21c + SP], 0x8
                               #      | _A_call_106:
e0 60                          # a13c |   push C
e2 f4 1c 02                    # a13e |   push [0x21c + SP]
e0 e0 00 02                    # a142 |   push 0x200
e0 bc 06                       # a146 |   push SP + 0x6
5c f8 cc f4                    # a149 |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # a14d |   mov SP, SP + 0x8
                               #      | _Z_call_106:
e8 fe 00 f8 a6 00              # a151 |   jeq G, 0, ${_cleanup_fn_display_image}:rel + PC
                               #      | _A_if_96:
ea a0 e0 f8 a6 3a 0f 00        # a157 |   jeq [SP], 0x3aa6, ${_E_if_96}:rel + PC
60 fe 00                       # a15f |   mov G, 0
58 f8 95 00                    # a162 |   jmp ${_cleanup_fn_display_image}:rel + PC
                               #      | _E_if_96:
                               #      | _C_if_96:
                               #      | _Z_if_96:
60 20 e0 a0 00                 # a166 |   mov A, 0xa0
60 40 00                       # a16b |   mov B, 0
54 e0 e0 1c 00 01 00 03 04     # a16e |   mmap 0x100, 0x300, 0x4
                               #      | _A_call_107:
e0 1c 30                       # a177 |   push 0x30
e0 bc 18                       # a17a |   push SP + 0x18
e0 e0 00 01                    # a17d |   push 0x100
5c f8 e7 f1                    # a181 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # a185 |   mov SP, SP + 0x6
                               #      | _Z_call_107:
60 20 e0 a1 00                 # a189 |   mov A, 0xa1
60 40 00                       # a18e |   mov B, 0
                               #      | _A_for_20:
c4 80 00                       # a191 |   inc D, 0
                               #      | _BA_for_20:
fc 80 e0 f8 e2 00 63 00        # a194 |   jge D, 0xe2, ${_C_for_20}:rel + PC
                               #      | _A_call_108:
e0 70                          # a19c |   push C + D
e2 f4 1c 02                    # a19e |   push [0x21c + SP]
e0 e0 00 02                    # a1a2 |   push 0x200
e0 bc 06                       # a1a6 |   push SP + 0x6
5c f8 6c f4                    # a1a9 |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # a1ad |   mov SP, SP + 0x8
                               #      | _Z_call_108:
e8 fe 00 f8 46 00              # a1b1 |   jeq G, 0, ${_cleanup_fn_display_image}:rel + PC
54 e0 e0 1c 00 01 00 03 04     # a1b7 |   mmap 0x100, 0x300, 0x4
                               #      | _A_call_109:
e0 e0 00 02                    # a1c0 |   push 0x200
e0 bc 02                       # a1c4 |   push SP + 0x2
e0 e0 00 01                    # a1c7 |   push 0x100
5c f8 9d f1                    # a1cb |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # a1cf |   mov SP, SP + 0x6
                               #      | _Z_call_109:
ac ff 20 1c 0f                 # a1d3 |   and H, A, 0xf
28 ff 1c 01                    # a1d8 |   shl H, 0x1
                               #      | _A_if_98:
f4 ff 1c f8 07 0f 00           # a1dc |   jle H, 0x7, ${_E_if_98}:rel + PC
c4 ff 00                       # a1e3 |   inc H, 0
60 40 e8 00 02                 # a1e6 |   mov B, 0x200 + B
                               #      | _E_if_98:
                               #      | _C_if_98:
                               #      | _Z_if_98:
b0 20 e0 ff a0 00              # a1eb |   or A, 0xa0, H
                               #      | _BZ_for_20:
44 80                          # a1f1 |   inc D
58 f8 a1 ff                    # a1f3 |   jmp ${_BA_for_20}:rel + PC
                               #      | _C_for_20:
                               #      | _Z_for_20:
                               #      | _cleanup_fn_display_image:
d4 1c 04                       # a1f7 |   umap 0x4
60 a0 f4 10 02                 # a1fa |   mov SP, 0x210 + SP
e4 20                          # a1ff |   pop A
e4 40                          # a201 |   pop B
e4 60                          # a203 |   pop C
e4 80                          # a205 |   pop D
dc                             # a207 |   ret
                               #      | _end_fn_display_image:
                               #      | 
                               #      | fn_handle_erase_sd:
                               #      | _begin_fn_handle_erase_sd:
                               #      | _A_call_113:
e0 1c 02                       # a208 |   push 0x2
5c f8 a0 f9                    # a20b |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a20f |   mov SP, SP + 0x2
                               #      | _Z_call_113:
e8 fe 00 f8 3d 00              # a213 |   jeq G, 0, ${_cleanup_fn_handle_erase_sd}:rel + PC
                               #      | _A_call_114:
e2 e0 c8 b0                    # a219 |   push [${var__g_args} + 0002]
e2 e0 c6 b0                    # a21d |   push [${var__g_args}]
e0 00                          # a221 |   push 0
e0 00                          # a223 |   push 0
5c f8 0f f5                    # a225 |   call ${fn_write_sd}:rel + PC
60 a0 bc 08                    # a229 |   mov SP, SP + 0x8
                               #      | _Z_call_114:
                               #      | _A_if_101:
ec fe 1c f8 01 17 00           # a22d |   jne G, 0x1, ${_E_if_101}:rel + PC
                               #      | _A_call_115:
e0 e0 39 af                    # a234 |   push ${const__str__ERASE_SD_OK__endl}
5c f8 a0 ef                    # a238 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a23c |   mov SP, SP + 0x2
                               #      | _Z_call_115:
58 f8 10 00                    # a240 |   jmp ${_C_if_101}:rel + PC
                               #      | _E_if_101:
                               #      | _A_call_116:
e0 e0 46 af                    # a244 |   push ${const__str__ERASE_SD_ERROR__endl}
5c f8 90 ef                    # a248 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a24c |   mov SP, SP + 0x2
                               #      | _Z_call_116:
                               #      | _C_if_101:
                               #      | _Z_if_101:
                               #      | _cleanup_fn_handle_erase_sd:
dc                             # a250 |   ret
                               #      | _end_fn_handle_erase_sd:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # a251 |   push B
e0 20                          # a253 |   push A
60 20 e0 fd 00                 # a255 |   mov A, 0xfd
60 40 00                       # a25a |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # a25d |   mmap 0xff00, -1, 0x2
62 e0 e0 1e ff e3 a2           # a265 |   mov [0xff1e], ${fn_syscall_entry}
                               #      | _A_call_117:
e0 e0 7a af                    # a26c |   push ${const__data_11}
5c f8 68 ef                    # a270 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a274 |   mov SP, SP + 0x2
                               #      | _Z_call_117:
                               #      | _A_call_121:
5c f8 7f 00                    # a278 |   call ${fn_init_sd_and_oled}:rel + PC
                               #      | _Z_call_121:
                               #      | _A_call_125:
5c f8 8d 00                    # a27c |   call ${fn_display_default_oled_screen}:rel + PC
                               #      | _Z_call_125:
ca e0 00 d6 b0                 # a280 |   dec [${var__g_sd_slot}], 0
62 e0 00 da b0                 # a285 |   mov [${var__g_last_button_state}], 0
                               #      | _A_call_130:
5c f8 c1 00                    # a28a |   call ${fn_check_persisted_target}:rel + PC
                               #      | _Z_call_130:
                               #      | _A_if_107:
ee e0 1c f8 d4 b0 01 18 00     # a28e |   jne [${var__g_has_sd_card}], 0x1, ${_E_if_107}:rel + PC
                               #      | _A_call_132:
5c f8 18 01                    # a297 |   call ${fn_display_splash_screen}:rel + PC
                               #      | _Z_call_132:
                               #      | _A_call_133:
e0 1c 2d                       # a29b |   push 0x2d
5c f8 91 fb                    # a29e |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a2a2 |   mov SP, SP + 0x2
                               #      | _Z_call_133:
                               #      | _E_if_107:
                               #      | _C_if_107:
                               #      | _Z_if_107:
                               #      | _A_call_134:
e0 e0 cc af                    # a2a6 |   push ${const__str__READY__endl}
5c f8 2e ef                    # a2aa |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a2ae |   mov SP, SP + 0x2
                               #      | _Z_call_134:
c6 e0 00 0a ff                 # a2b2 |   inc [0xff0a], 0
                               #      | _A_loop_12:
                               #      | _BA_loop_12:
                               #      | _A_call_182:
5c f8 06 01                    # a2b7 |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_182:
46 e0 0a ff                    # a2bb |   inc [0xff0a]
60 20 ff                       # a2bf |   mov A, H
                               #      | _A_if_171:
ec fe 00 f8 0a 00              # a2c2 |   jne G, 0, ${_E_if_171}:rel + PC
58 f8 ef ff                    # a2c8 |   jmp ${_BA_loop_12}:rel + PC
                               #      | _E_if_171:
                               #      | _C_if_171:
                               #      | _Z_if_171:
60 40 21                       # a2cc |   mov B, A*2
60 40 e8 54 af                 # a2cf |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # a2d4 |   push A
5e 40                          # a2d6 |   call [B]
e4 20                          # a2d8 |   pop A
                               #      | _BZ_loop_12:
58 f8 dd ff                    # a2da |   jmp ${_BA_loop_12}:rel + PC
                               #      | _C_loop_12:
                               #      | _Z_loop_12:
                               #      | _cleanup_fn_main:
e4 20                          # a2de |   pop A
e4 40                          # a2e0 |   pop B
dc                             # a2e2 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_102:
f0 ff 1c f8 1f 08 00           # a2e3 |   jlt H, 0x1f, ${_E_if_102}:rel + PC
dc                             # a2ea |   ret
                               #      | _E_if_102:
                               #      | _C_if_102:
                               #      | _Z_if_102:
28 ff 1c 01                    # a2eb |   shl H, 0x1
00 ff e0 e5 ad                 # a2ef |   add H, ${const__SYSCALL_MAP}
5a ff                          # a2f4 |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # a2f6 |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_init_sd_and_oled:
                               #      | _begin_fn_init_sd_and_oled:
                               #      | _A_call_118:
5c f8 02 f5                    # a2f7 |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_118:
                               #      | _A_call_119:
5c f8 75 f5                    # a2fb |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_119:
                               #      | _A_call_120:
5c f8 25 f5                    # a2ff |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_120:
62 e0 fe d4 b0                 # a303 |   mov [${var__g_has_sd_card}], G
                               #      | _cleanup_fn_init_sd_and_oled:
dc                             # a308 |   ret
                               #      | _end_fn_init_sd_and_oled:
                               #      | 
                               #      | fn_display_default_oled_screen:
                               #      | _begin_fn_display_default_oled_screen:
                               #      | _A_call_122:
e0 e0 a9 af                    # a309 |   push ${const__str__WeeeklyT}
e0 00                          # a30d |   push 0
e0 00                          # a30f |   push 0
5c f8 ab f7                    # a311 |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # a315 |   mov SP, SP + 0x6
                               #      | _Z_call_122:
                               #      | _A_call_123:
e0 e0 b2 af                    # a319 |   push ${const__data_12}
e0 00                          # a31d |   push 0
e0 1c 01                       # a31f |   push 0x1
5c f8 9a f7                    # a322 |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # a326 |   mov SP, SP + 0x6
                               #      | _Z_call_123:
60 ff 1c 53                    # a32a |   mov H, 0x53
                               #      | _A_if_103:
ee e0 00 f8 d4 b0 0c 00        # a32e |   jne [${var__g_has_sd_card}], 0, ${_E_if_103}:rel + PC
60 ff 1c 2d                    # a336 |   mov H, 0x2d
                               #      | _E_if_103:
                               #      | _C_if_103:
                               #      | _Z_if_103:
                               #      | _A_call_124:
e0 ff                          # a33a |   push H
e0 1c 06                       # a33c |   push 0x6
e0 1c 01                       # a33f |   push 0x1
5c f8 d3 f6                    # a342 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # a346 |   mov SP, SP + 0x6
                               #      | _Z_call_124:
                               #      | _cleanup_fn_display_default_oled_screen:
dc                             # a34a |   ret
                               #      | _end_fn_display_default_oled_screen:
                               #      | 
                               #      | fn_check_persisted_target:
                               #      | _begin_fn_check_persisted_target:
e0 40                          # a34b |   push B
e0 20                          # a34d |   push A
61 20 e0 1c ff                 # a34f |   mov A, [0xff1c]
                               #      | _A_scope_8:
                               #      | _B_scope_8:
e8 20 00 f8 56 00              # a354 |   jeq A, 0, ${_C_scope_8}:rel + PC
e8 20 e0 f8 00 90 50 00        # a35a |   jeq A, 0x9000, ${_C_scope_8}:rel + PC
61 40 e0 0c ff                 # a362 |   mov B, [0xff0c]
2c 40 e0 00 01                 # a367 |   and B, 0x100
                               #      | _A_if_106:
e8 40 00 f8 21 00              # a36c |   jeq B, 0, ${_E_if_106}:rel + PC
                               #      | _A_call_126:
e0 e0 b9 af                    # a372 |   push ${const__str__FORCED_BOOTLOADER__endl}
5c f8 94 ec                    # a376 |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # a37a |   mov SP, SP + 0x2
                               #      | _Z_call_126:
                               #      | _A_call_127:
e0 1c 46                       # a37e |   push 0x46
5c f8 ae fa                    # a381 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a385 |   mov SP, SP + 0x2
                               #      | _Z_call_127:
58 f8 21 00                    # a389 |   jmp ${_C_scope_8}:rel + PC
                               #      | _E_if_106:
                               #      | _C_if_106:
                               #      | _Z_if_106:
                               #      | _A_call_128:
e0 20                          # a38d |   push A
e0 e0 97 ae                    # a38f |   push ${const__data_5}
5c f8 77 ec                    # a393 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a397 |   mov SP, SP + 0x4
                               #      | _Z_call_128:
                               #      | _A_call_129:
e0 1c 50                       # a39b |   push 0x50
5c f8 91 fa                    # a39e |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a3a2 |   mov SP, SP + 0x2
                               #      | _Z_call_129:
58 f8 a1 fa                    # a3a6 |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_8:
                               #      | _Z_scope_8:
                               #      | _cleanup_fn_check_persisted_target:
e4 20                          # a3aa |   pop A
e4 40                          # a3ac |   pop B
dc                             # a3ae |   ret
                               #      | _end_fn_check_persisted_target:
                               #      | 
                               #      | fn_display_splash_screen:
                               #      | _begin_fn_display_splash_screen:
                               #      | _A_call_131:
e0 00                          # a3af |   push 0
e0 1c 02                       # a3b1 |   push 0x2
5c f8 74 fd                    # a3b4 |   call ${fn_display_image}:rel + PC
60 a0 bc 04                    # a3b8 |   mov SP, SP + 0x4
                               #      | _Z_call_131:
                               #      | _cleanup_fn_display_splash_screen:
dc                             # a3bc |   ret
                               #      | _end_fn_display_splash_screen:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # a3bd |   push D
e0 60                          # a3bf |   push C
e0 40                          # a3c1 |   push B
e0 20                          # a3c3 |   push A
60 a0 bc fe                    # a3c5 |   mov SP, SP + -2
62 a0 00                       # a3c9 |   mov [SP], 0
60 a0 bc de                    # a3cc |   mov SP, SP + -34
62 a0 00                       # a3d0 |   mov [SP], 0
60 20 a0                       # a3d3 |   mov A, SP
                               #      | _A_loop_13:
                               #      | _BA_loop_13:
                               #      | _A_call_135:
5c f8 31 01                    # a3d6 |   call ${fn_getc_nonblocking}:rel + PC
                               #      | _Z_call_135:
                               #      | _A_if_109:
ec fe 00 f8 0e 00              # a3da |   jne G, 0, ${_E_if_109}:rel + PC
                               #      | _A_call_155:
5c f8 41 01                    # a3e0 |   call ${fn_check_button_pressed}:rel + PC
                               #      | _Z_call_155:
58 f8 f2 ff                    # a3e4 |   jmp ${_BA_loop_13}:rel + PC
                               #      | _E_if_109:
                               #      | _C_if_109:
                               #      | _Z_if_109:
60 60 ff                       # a3e8 |   mov C, H
62 e0 60 00 ff                 # a3eb |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # a3f0 |   jeq C, 0xa, ${_C_loop_13}:rel + PC
e8 60 1c f8 0d 29 00           # a3f7 |   jeq C, 0xd, ${_C_loop_13}:rel + PC
                               #      | _A_if_128:
f0 20 bc f8 1f 19 00           # a3fe |   jlt A, SP + 0x1f, ${_E_if_128}:rel + PC
                               #      | _A_call_156:
e0 e0 ed af                    # a405 |   push ${const__data_15}
5c f8 cf ed                    # a409 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a40d |   mov SP, SP + 0x2
                               #      | _Z_call_156:
e8 ff 00 f8 e3 00              # a411 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_128:
                               #      | _C_if_128:
                               #      | _Z_if_128:
62 20 60                       # a417 |   mov [A], C
44 20                          # a41a |   inc A
                               #      | _BZ_loop_13:
58 f8 ba ff                    # a41c |   jmp ${_BA_loop_13}:rel + PC
                               #      | _C_loop_13:
                               #      | _Z_loop_13:
                               #      | _A_call_157:
e0 1c 20                       # a420 |   push 0x20
e0 bc 02                       # a423 |   push SP + 0x2
5c f8 f4 ef                    # a426 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a42a |   mov SP, SP + 0x4
                               #      | _Z_call_157:
60 60 ff                       # a42e |   mov C, H
                               #      | _A_if_130:
e8 60 00 f8 0f 00              # a431 |   jeq C, 0, ${_E_if_130}:rel + PC
66 60 00                       # a437 |   bmov [C], 0
44 60                          # a43a |   inc C
58 f8 08 00                    # a43c |   jmp ${_C_if_130}:rel + PC
                               #      | _E_if_130:
60 60 1c ff                    # a440 |   mov C, -1
                               #      | _C_if_130:
                               #      | _Z_if_130:
                               #      | _A_call_176:
e0 a0                          # a444 |   push SP
5c f8 e7 02                    # a446 |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # a44a |   mov SP, SP + 0x2
                               #      | _Z_call_176:
                               #      | _A_if_167:
ec ff 00 f8 16 00              # a44e |   jne H, 0, ${_E_if_167}:rel + PC
                               #      | _A_call_177:
e0 e0 87 b0                    # a454 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 80 ed                    # a458 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a45c |   mov SP, SP + 0x2
                               #      | _Z_call_177:
58 f8 94 00                    # a460 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_167:
                               #      | _C_if_167:
                               #      | _Z_if_167:
62 bc ff 22                    # a464 |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 c3 b0                 # a468 |   mov [${var__g_num_args}], 0
                               #      | _A_while_12:
                               #      | _BA_while_12:
fc 60 bc f8 20 7c 00           # a46d |   jge C, SP + 0x20, ${_C_while_12}:rel + PC
                               #      | _A_call_178:
e0 1c 20                       # a474 |   push 0x20
e0 60                          # a477 |   push C
5c f8 a1 ef                    # a479 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a47d |   mov SP, SP + 0x4
                               #      | _Z_call_178:
60 80 ff                       # a481 |   mov D, H
                               #      | _A_if_168:
e8 80 00 f8 0d 00              # a484 |   jeq D, 0, ${_E_if_168}:rel + PC
66 80 00                       # a48a |   bmov [D], 0
58 f8 08 00                    # a48d |   jmp ${_C_if_168}:rel + PC
                               #      | _E_if_168:
60 80 1c fe                    # a491 |   mov D, -2
                               #      | _C_if_168:
                               #      | _Z_if_168:
61 20 e0 c3 b0                 # a495 |   mov A, [${var__g_num_args}]
                               #      | _A_if_169:
f0 20 1c f8 06 17 00           # a49a |   jlt A, 0x6, ${_E_if_169}:rel + PC
                               #      | _A_call_179:
e0 e0 98 b0                    # a4a1 |   push ${const__data_16}
5c f8 33 ed                    # a4a5 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a4a9 |   mov SP, SP + 0x2
                               #      | _Z_call_179:
58 f8 47 00                    # a4ad |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_169:
                               #      | _C_if_169:
                               #      | _Z_if_169:
                               #      | _A_call_180:
e0 60                          # a4b1 |   push C
5c f8 2c ee                    # a4b3 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a4b7 |   mov SP, SP + 0x2
                               #      | _Z_call_180:
                               #      | _A_if_170:
ec fe 00 f8 18 00              # a4bb |   jne G, 0, ${_E_if_170}:rel + PC
                               #      | _A_call_181:
e0 20                          # a4c1 |   push A
e0 e0 ad b0                    # a4c3 |   push ${const__data_17}
5c f8 43 eb                    # a4c7 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a4cb |   mov SP, SP + 0x4
                               #      | _Z_call_181:
58 f8 25 00                    # a4cf |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_170:
                               #      | _C_if_170:
                               #      | _Z_if_170:
a8 40 20 1c 01                 # a4d3 |   shl B, A, 0x1
62 e8 ff c6 b0                 # a4d8 |   mov [${var__g_args} + B], H
c6 e0 20 c3 b0                 # a4dd |   inc [${var__g_num_args}], A
c4 60 80                       # a4e2 |   inc C, D
                               #      | _BZ_while_12:
58 f8 88 ff                    # a4e5 |   jmp ${_BA_while_12}:rel + PC
                               #      | _C_while_12:
                               #      | _Z_while_12:
c4 fe 00                       # a4e9 |   inc G, 0
61 ff bc 22                    # a4ec |   mov H, [SP + 0x22]
58 f8 0a 00                    # a4f0 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # a4f4 |   mov G, 0
60 ff 00                       # a4f7 |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # a4fa |   mov SP, SP + 0x24
e4 20                          # a4fe |   pop A
e4 40                          # a500 |   pop B
e4 60                          # a502 |   pop C
e4 80                          # a504 |   pop D
dc                             # a506 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_getc_nonblocking:
                               #      | _begin_fn_getc_nonblocking:
61 ff e0 02 ff                 # a507 |   mov H, [0xff02]
ac fe ff e0 00 80              # a50c |   and G, H, 0x8000
e8 fe 00 f8 0e 00              # a512 |   jeq G, 0, ${_cleanup_fn_getc_nonblocking}:rel + PC
2c ff e0 ff 00                 # a518 |   and H, 0xff
c4 fe 00                       # a51d |   inc G, 0
                               #      | _cleanup_fn_getc_nonblocking:
dc                             # a520 |   ret
                               #      | _end_fn_getc_nonblocking:
                               #      | 
                               #      | fn_check_button_pressed:
                               #      | _begin_fn_check_button_pressed:
e0 20                          # a521 |   push A
61 20 e0 0e ff                 # a523 |   mov A, [0xff0e]
e9 20 e0 f8 da b0 50 00        # a528 |   jeq A, [${var__g_last_button_state}], ${_cleanup_fn_check_button_pressed}:rel + PC
62 e0 20 da b0                 # a530 |   mov [${var__g_last_button_state}], A
98 fe 20 1c 0c                 # a535 |   getb G, A, 0xc
                               #      | _A_if_111:
e8 fe 00 f8 1c 00              # a53a |   jeq G, 0, ${_E_if_111}:rel + PC
61 fe e0 d6 b0                 # a540 |   mov G, [${var__g_sd_slot}]
                               #      | _A_if_112:
f0 fe 00 f8 11 00              # a545 |   jlt G, 0, ${_E_if_112}:rel + PC
48 fe                          # a54b |   dec G
62 e0 fe d6 b0                 # a54d |   mov [${var__g_sd_slot}], G
                               #      | _A_call_144:
5c f8 29 00                    # a552 |   call ${fn_update_code_index_screen}:rel + PC
                               #      | _Z_call_144:
                               #      | _E_if_112:
                               #      | _C_if_112:
                               #      | _Z_if_112:
                               #      | _E_if_111:
                               #      | _C_if_111:
                               #      | _Z_if_111:
98 fe 20 1c 09                 # a556 |   getb G, A, 0x9
                               #      | _A_if_117:
e8 fe 00 f8 0e 00              # a55b |   jeq G, 0, ${_E_if_117}:rel + PC
46 e0 d6 b0                    # a561 |   inc [${var__g_sd_slot}]
                               #      | _A_call_145:
5c f8 16 00                    # a565 |   call ${fn_update_code_index_screen}:rel + PC
                               #      | _Z_call_145:
                               #      | _E_if_117:
                               #      | _C_if_117:
                               #      | _Z_if_117:
98 fe 20 1c 08                 # a569 |   getb G, A, 0x8
                               #      | _A_if_118:
e8 fe 00 f8 0a 00              # a56e |   jeq G, 0, ${_E_if_118}:rel + PC
                               #      | _A_call_154:
5c f8 c7 00                    # a574 |   call ${fn_load_code_from_sd}:rel + PC
                               #      | _Z_call_154:
                               #      | _E_if_118:
                               #      | _C_if_118:
                               #      | _Z_if_118:
                               #      | _cleanup_fn_check_button_pressed:
e4 20                          # a578 |   pop A
dc                             # a57a |   ret
                               #      | _end_fn_check_button_pressed:
                               #      | 
                               #      | fn_update_code_index_screen:
                               #      | _begin_fn_update_code_index_screen:
e0 60                          # a57b |   push C
60 a0 f4 f0 fd                 # a57d |   mov SP, 0xfdf0 + SP
60 a0 bc f6                    # a582 |   mov SP, SP + -10
61 60 e0 d6 b0                 # a586 |   mov C, [${var__g_sd_slot}]
e8 60 1c f8 ff 94 00           # a58b |   jeq C, -1, ${_L_fn_update_code_index_screen_2}:rel + PC
28 60 1c 08                    # a592 |   shl C, 0x8
                               #      | _A_call_136:
e0 60                          # a596 |   push C
e0 1c 03                       # a598 |   push 0x3
e0 e0 00 02                    # a59b |   push 0x200
e0 bc 10                       # a59f |   push SP + 0x10
5c f8 73 f0                    # a5a2 |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # a5a6 |   mov SP, SP + 0x8
                               #      | _Z_call_136:
e8 fe 00 f8 66 00              # a5aa |   jeq G, 0, ${_L_fn_update_code_index_screen_1}:rel + PC
ee bc e0 f8 0a b6 3b 6f 00     # a5b0 |   jne [SP + 0xa], 0x3bb6, ${_L_fn_update_code_index_screen_2}:rel + PC
63 e0 bc d8 b0 0c              # a5b9 |   mov [${var__g_sd_jmp_target}], [SP + 0xc]
62 bc 00 16                    # a5bf |   mov [SP + 0x16], 0
                               #      | _A_call_137:
5c f8 c9 f3                    # a5c3 |   call ${fn_clear_oled}:rel + PC
                               #      | _Z_call_137:
                               #      | _A_call_138:
e0 bc 0e                       # a5c7 |   push SP + 0xe
e0 00                          # a5ca |   push 0
e0 00                          # a5cc |   push 0
5c f8 ee f4                    # a5ce |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # a5d2 |   mov SP, SP + 0x6
                               #      | _Z_call_138:
c5 fe e0 d6 b0                 # a5d6 |   inc G, [${var__g_sd_slot}]
                               #      | _A_call_139:
e0 a0                          # a5db |   push SP
e0 fe                          # a5dd |   push G
5c f8 ac eb                    # a5df |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # a5e3 |   mov SP, SP + 0x4
                               #      | _Z_call_139:
60 fe a0                       # a5e7 |   mov G, SP
                               #      | _A_loop_14:
                               #      | _BA_loop_14:
65 ff fe                       # a5ea |   bmov H, [G]
e8 ff 00 f8 0c 00              # a5ed |   jeq H, 0, ${_C_loop_14}:rel + PC
44 fe                          # a5f3 |   inc G
                               #      | _BZ_loop_14:
58 f8 f5 ff                    # a5f5 |   jmp ${_BA_loop_14}:rel + PC
                               #      | _C_loop_14:
                               #      | _Z_loop_14:
62 fe 1c 2e                    # a5f9 |   mov [G], 0x2e
                               #      | _A_call_140:
e0 a0                          # a5fd |   push SP
e0 00                          # a5ff |   push 0
e0 1c 01                       # a601 |   push 0x1
5c f8 b8 f4                    # a604 |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # a608 |   mov SP, SP + 0x6
                               #      | _Z_call_140:
58 f8 27 00                    # a60c |   jmp ${_cleanup_fn_update_code_index_screen}:rel + PC
                               #      | _L_fn_update_code_index_screen_1:
                               #      | _A_call_141:
e0 1c 45                       # a610 |   push 0x45
5c f8 1c f8                    # a613 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a617 |   mov SP, SP + 0x2
                               #      | _Z_call_141:
58 f8 18 00                    # a61b |   jmp ${_cleanup_fn_update_code_index_screen}:rel + PC
                               #      | _L_fn_update_code_index_screen_2:
ca e0 00 d6 b0                 # a61f |   dec [${var__g_sd_slot}], 0
                               #      | _A_call_142:
5c f8 e5 fc                    # a624 |   call ${fn_display_default_oled_screen}:rel + PC
                               #      | _Z_call_142:
                               #      | _A_call_143:
e0 1c 2d                       # a628 |   push 0x2d
5c f8 04 f8                    # a62b |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a62f |   mov SP, SP + 0x2
                               #      | _Z_call_143:
                               #      | _cleanup_fn_update_code_index_screen:
60 a0 f4 1a 02                 # a633 |   mov SP, 0x21a + SP
e4 60                          # a638 |   pop C
dc                             # a63a |   ret
                               #      | _end_fn_update_code_index_screen:
                               #      | 
                               #      | fn_load_code_from_sd:
                               #      | _begin_fn_load_code_from_sd:
e0 80                          # a63b |   push D
e0 60                          # a63d |   push C
e0 40                          # a63f |   push B
e0 20                          # a641 |   push A
60 a0 f4 f0 fd                 # a643 |   mov SP, 0xfdf0 + SP
61 60 e0 d6 b0                 # a648 |   mov C, [${var__g_sd_slot}]
e8 60 1c f8 ff d2 00           # a64d |   jeq C, -1, ${_cleanup_fn_load_code_from_sd}:rel + PC
                               #      | _A_call_146:
e0 1c 2d                       # a654 |   push 0x2d
5c f8 d8 f7                    # a657 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a65b |   mov SP, SP + 0x2
                               #      | _Z_call_146:
28 60 1c 08                    # a65f |   shl C, 0x8
                               #      | _A_for_21:
c4 40 00                       # a663 |   inc B, 0
                               #      | _BA_for_21:
fc 40 e0 f8 00 01 6a 00        # a666 |   jge B, 0x100, ${_C_for_21}:rel + PC
                               #      | _A_call_147:
e0 4c                          # a66e |   push B + C
e0 1c 03                       # a670 |   push 0x3
e0 e0 00 02                    # a673 |   push 0x200
e0 bc 06                       # a677 |   push SP + 0x6
5c f8 9b ef                    # a67a |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # a67e |   mov SP, SP + 0x8
                               #      | _Z_call_147:
e8 fe 00 f8 8e 00              # a682 |   jeq G, 0, ${_L_fn_load_code_from_sd_1}:rel + PC
61 20 a0                       # a688 |   mov A, [SP]
61 80 bc 02                    # a68b |   mov D, [SP + 0x2]
                               #      | _A_scope_9:
                               #      | _B_scope_9:
ec 20 00 f8 10 00              # a68f |   jne A, 0, ${_C_scope_9}:rel + PC
ec 80 00 f8 0a 00              # a695 |   jne D, 0, ${_C_scope_9}:rel + PC
58 f8 35 00                    # a69b |   jmp ${_C_for_21}:rel + PC
                               #      | _C_scope_9:
                               #      | _Z_scope_9:
84 fe 80 20                    # a69f |   sub G, D, A
f8 fe e0 f8 fc 01 6d 00        # a6a3 |   jgt G, 0x1fc, ${_L_fn_load_code_from_sd_1}:rel + PC
                               #      | _A_call_148:
e0 fe                          # a6ab |   push G
e0 bc 06                       # a6ad |   push SP + 0x6
e0 20                          # a6b0 |   push A
5c f8 b6 ec                    # a6b2 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # a6b6 |   mov SP, SP + 0x6
                               #      | _Z_call_148:
                               #      | _A_call_149:
e0 80                          # a6ba |   push D
e0 20                          # a6bc |   push A
e0 e0 d3 af                    # a6be |   push ${const__data_13}
5c f8 48 e9                    # a6c2 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a6c6 |   mov SP, SP + 0x6
                               #      | _Z_call_149:
                               #      | _BZ_for_21:
44 40                          # a6ca |   inc B
58 f8 9a ff                    # a6cc |   jmp ${_BA_for_21}:rel + PC
                               #      | _C_for_21:
                               #      | _Z_for_21:
e8 40 e0 f8 00 01 40 00        # a6d0 |   jeq B, 0x100, ${_L_fn_load_code_from_sd_1}:rel + PC
99 fe e0 1c 0c ff 0a           # a6d8 |   getb G, [0xff0c], 0xa
                               #      | _A_if_125:
ec fe 00 f8 2d 00              # a6df |   jne G, 0, ${_E_if_125}:rel + PC
                               #      | _A_call_150:
e0 1c 52                       # a6e5 |   push 0x52
5c f8 47 f7                    # a6e8 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a6ec |   mov SP, SP + 0x2
                               #      | _Z_call_150:
                               #      | _A_call_151:
e2 e0 d8 b0                    # a6f0 |   push [${var__g_sd_jmp_target}]
e0 e0 e2 af                    # a6f4 |   push ${const__data_14}
5c f8 12 e9                    # a6f8 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a6fc |   mov SP, SP + 0x4
                               #      | _Z_call_151:
                               #      | _A_call_152:
e2 e0 d8 b0                    # a700 |   push [${var__g_sd_jmp_target}]
5c f8 3d f7                    # a704 |   call ${fn_jmp_to_target_persisted}:rel + PC
60 a0 bc 02                    # a708 |   mov SP, SP + 0x2
                               #      | _Z_call_152:
                               #      | _E_if_125:
                               #      | _C_if_125:
                               #      | _Z_if_125:
58 f8 13 00                    # a70c |   jmp ${_cleanup_fn_load_code_from_sd}:rel + PC
                               #      | _L_fn_load_code_from_sd_1:
                               #      | _A_call_153:
e0 1c 45                       # a710 |   push 0x45
5c f8 1c f7                    # a713 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a717 |   mov SP, SP + 0x2
                               #      | _Z_call_153:
58 f8 04 00                    # a71b |   jmp ${_cleanup_fn_load_code_from_sd}:rel + PC
                               #      | _cleanup_fn_load_code_from_sd:
60 a0 f4 10 02                 # a71f |   mov SP, 0x210 + SP
e4 20                          # a724 |   pop A
e4 40                          # a726 |   pop B
e4 60                          # a728 |   pop C
e4 80                          # a72a |   pop D
dc                             # a72c |   ret
                               #      | _end_fn_load_code_from_sd:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # a72d |   push A
61 20 bc 04                    # a72f |   mov A, [SP + 0x4]
                               #      | _A_call_158:
e0 e0 ff af                    # a733 |   push ${const__str__PING}
e0 20                          # a737 |   push A
5c f8 8f ec                    # a739 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a73d |   mov SP, SP + 0x4
                               #      | _Z_call_158:
                               #      | _A_if_132:
ec ff 00 f8 0d 00              # a741 |   jne H, 0, ${_E_if_132}:rel + PC
c4 ff 00                       # a747 |   inc H, 0
58 f8 e3 01                    # a74a |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_132:
                               #      | _C_if_132:
                               #      | _Z_if_132:
                               #      | _A_call_159:
e0 e0 04 b0                    # a74e |   push ${const__str__READ}
e0 20                          # a752 |   push A
5c f8 74 ec                    # a754 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a758 |   mov SP, SP + 0x4
                               #      | _Z_call_159:
                               #      | _A_if_134:
ec ff 00 f8 0e 00              # a75c |   jne H, 0, ${_E_if_134}:rel + PC
60 ff 1c 02                    # a762 |   mov H, 0x2
58 f8 c7 01                    # a766 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_134:
                               #      | _C_if_134:
                               #      | _Z_if_134:
                               #      | _A_call_160:
e0 e0 09 b0                    # a76a |   push ${const__str__WRITE}
e0 20                          # a76e |   push A
5c f8 58 ec                    # a770 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a774 |   mov SP, SP + 0x4
                               #      | _Z_call_160:
                               #      | _A_if_136:
ec ff 00 f8 0e 00              # a778 |   jne H, 0, ${_E_if_136}:rel + PC
60 ff 1c 03                    # a77e |   mov H, 0x3
58 f8 ab 01                    # a782 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_136:
                               #      | _C_if_136:
                               #      | _Z_if_136:
                               #      | _A_call_161:
e0 e0 0f b0                    # a786 |   push ${const__str__READB}
e0 20                          # a78a |   push A
5c f8 3c ec                    # a78c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a790 |   mov SP, SP + 0x4
                               #      | _Z_call_161:
                               #      | _A_if_138:
ec ff 00 f8 0e 00              # a794 |   jne H, 0, ${_E_if_138}:rel + PC
60 ff 1c 04                    # a79a |   mov H, 0x4
58 f8 8f 01                    # a79e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_138:
                               #      | _C_if_138:
                               #      | _Z_if_138:
                               #      | _A_call_162:
e0 e0 15 b0                    # a7a2 |   push ${const__str__WRITEB}
e0 20                          # a7a6 |   push A
5c f8 20 ec                    # a7a8 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a7ac |   mov SP, SP + 0x4
                               #      | _Z_call_162:
                               #      | _A_if_140:
ec ff 00 f8 0e 00              # a7b0 |   jne H, 0, ${_E_if_140}:rel + PC
60 ff 1c 05                    # a7b6 |   mov H, 0x5
58 f8 73 01                    # a7ba |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_140:
                               #      | _C_if_140:
                               #      | _Z_if_140:
                               #      | _A_call_163:
e0 e0 1c b0                    # a7be |   push ${const__str__JMP}
e0 20                          # a7c2 |   push A
5c f8 04 ec                    # a7c4 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a7c8 |   mov SP, SP + 0x4
                               #      | _Z_call_163:
                               #      | _A_if_142:
ec ff 00 f8 0e 00              # a7cc |   jne H, 0, ${_E_if_142}:rel + PC
60 ff 1c 06                    # a7d2 |   mov H, 0x6
58 f8 57 01                    # a7d6 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_142:
                               #      | _C_if_142:
                               #      | _Z_if_142:
                               #      | _A_call_164:
e0 e0 20 b0                    # a7da |   push ${const__str__JMP_PERSIST}
e0 20                          # a7de |   push A
5c f8 e8 eb                    # a7e0 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a7e4 |   mov SP, SP + 0x4
                               #      | _Z_call_164:
                               #      | _A_if_144:
ec ff 00 f8 0e 00              # a7e8 |   jne H, 0, ${_E_if_144}:rel + PC
60 ff 1c 07                    # a7ee |   mov H, 0x7
58 f8 3b 01                    # a7f2 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_144:
                               #      | _C_if_144:
                               #      | _Z_if_144:
                               #      | _A_call_165:
e0 e0 2c b0                    # a7f6 |   push ${const__str__INIT_SD}
e0 20                          # a7fa |   push A
5c f8 cc eb                    # a7fc |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a800 |   mov SP, SP + 0x4
                               #      | _Z_call_165:
                               #      | _A_if_146:
ec ff 00 f8 0e 00              # a804 |   jne H, 0, ${_E_if_146}:rel + PC
60 ff 1c 08                    # a80a |   mov H, 0x8
58 f8 1f 01                    # a80e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_146:
                               #      | _C_if_146:
                               #      | _Z_if_146:
                               #      | _A_call_166:
e0 e0 34 b0                    # a812 |   push ${const__str__READ_SD}
e0 20                          # a816 |   push A
5c f8 b0 eb                    # a818 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a81c |   mov SP, SP + 0x4
                               #      | _Z_call_166:
                               #      | _A_if_148:
ec ff 00 f8 0e 00              # a820 |   jne H, 0, ${_E_if_148}:rel + PC
60 ff 1c 09                    # a826 |   mov H, 0x9
58 f8 03 01                    # a82a |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_148:
                               #      | _C_if_148:
                               #      | _Z_if_148:
                               #      | _A_call_167:
e0 e0 3c b0                    # a82e |   push ${const__str__INIT_OLED}
e0 20                          # a832 |   push A
5c f8 94 eb                    # a834 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a838 |   mov SP, SP + 0x4
                               #      | _Z_call_167:
                               #      | _A_if_150:
ec ff 00 f8 0e 00              # a83c |   jne H, 0, ${_E_if_150}:rel + PC
60 ff 1c 0a                    # a842 |   mov H, 0xa
58 f8 e7 00                    # a846 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_150:
                               #      | _C_if_150:
                               #      | _Z_if_150:
                               #      | _A_call_168:
e0 e0 46 b0                    # a84a |   push ${const__str__READW}
e0 20                          # a84e |   push A
5c f8 78 eb                    # a850 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a854 |   mov SP, SP + 0x4
                               #      | _Z_call_168:
                               #      | _A_if_152:
ec ff 00 f8 0e 00              # a858 |   jne H, 0, ${_E_if_152}:rel + PC
60 ff 1c 0b                    # a85e |   mov H, 0xb
58 f8 cb 00                    # a862 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_152:
                               #      | _C_if_152:
                               #      | _Z_if_152:
                               #      | _A_call_169:
e0 e0 4c b0                    # a866 |   push ${const__str__DEINIT_OLED}
e0 20                          # a86a |   push A
5c f8 5c eb                    # a86c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a870 |   mov SP, SP + 0x4
                               #      | _Z_call_169:
                               #      | _A_if_154:
ec ff 00 f8 0e 00              # a874 |   jne H, 0, ${_E_if_154}:rel + PC
60 ff 1c 0c                    # a87a |   mov H, 0xc
58 f8 af 00                    # a87e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_154:
                               #      | _C_if_154:
                               #      | _Z_if_154:
                               #      | _A_call_170:
e0 e0 58 b0                    # a882 |   push ${const__str__WRITE_SD}
e0 20                          # a886 |   push A
5c f8 40 eb                    # a888 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a88c |   mov SP, SP + 0x4
                               #      | _Z_call_170:
                               #      | _A_if_156:
ec ff 00 f8 0e 00              # a890 |   jne H, 0, ${_E_if_156}:rel + PC
60 ff 1c 0d                    # a896 |   mov H, 0xd
58 f8 93 00                    # a89a |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_156:
                               #      | _C_if_156:
                               #      | _Z_if_156:
                               #      | _A_call_171:
e0 e0 61 b0                    # a89e |   push ${const__str__MMAP}
e0 20                          # a8a2 |   push A
5c f8 24 eb                    # a8a4 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a8a8 |   mov SP, SP + 0x4
                               #      | _Z_call_171:
                               #      | _A_if_158:
ec ff 00 f8 0e 00              # a8ac |   jne H, 0, ${_E_if_158}:rel + PC
60 ff 1c 0e                    # a8b2 |   mov H, 0xe
58 f8 77 00                    # a8b6 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_158:
                               #      | _C_if_158:
                               #      | _Z_if_158:
                               #      | _A_call_172:
e0 e0 66 b0                    # a8ba |   push ${const__str__UMAP}
e0 20                          # a8be |   push A
5c f8 08 eb                    # a8c0 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a8c4 |   mov SP, SP + 0x4
                               #      | _Z_call_172:
                               #      | _A_if_160:
ec ff 00 f8 0e 00              # a8c8 |   jne H, 0, ${_E_if_160}:rel + PC
60 ff 1c 0f                    # a8ce |   mov H, 0xf
58 f8 5b 00                    # a8d2 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_160:
                               #      | _C_if_160:
                               #      | _Z_if_160:
                               #      | _A_call_173:
e0 e0 6b b0                    # a8d6 |   push ${const__str__WRITEB_SD}
e0 20                          # a8da |   push A
5c f8 ec ea                    # a8dc |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a8e0 |   mov SP, SP + 0x4
                               #      | _Z_call_173:
                               #      | _A_if_162:
ec ff 00 f8 0e 00              # a8e4 |   jne H, 0, ${_E_if_162}:rel + PC
60 ff 1c 10                    # a8ea |   mov H, 0x10
58 f8 3f 00                    # a8ee |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_162:
                               #      | _C_if_162:
                               #      | _Z_if_162:
                               #      | _A_call_174:
e0 e0 75 b0                    # a8f2 |   push ${const__str__SHOW_IMG}
e0 20                          # a8f6 |   push A
5c f8 d0 ea                    # a8f8 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a8fc |   mov SP, SP + 0x4
                               #      | _Z_call_174:
                               #      | _A_if_164:
ec ff 00 f8 0e 00              # a900 |   jne H, 0, ${_E_if_164}:rel + PC
60 ff 1c 11                    # a906 |   mov H, 0x11
58 f8 23 00                    # a90a |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_164:
                               #      | _C_if_164:
                               #      | _Z_if_164:
                               #      | _A_call_175:
e0 e0 7e b0                    # a90e |   push ${const__str__ERASE_SD}
e0 20                          # a912 |   push A
5c f8 b4 ea                    # a914 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a918 |   mov SP, SP + 0x4
                               #      | _Z_call_175:
                               #      | _A_if_166:
ec ff 00 f8 0e 00              # a91c |   jne H, 0, ${_E_if_166}:rel + PC
60 ff 1c 12                    # a922 |   mov H, 0x12
58 f8 07 00                    # a926 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_166:
                               #      | _C_if_166:
                               #      | _Z_if_166:
60 ff 00                       # a92a |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # a92d |   pop A
dc                             # a92f |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # a930 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # ad25 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
0a 90 73 91 85 92 8b 91 fa 91 50 92 37 92 a4 92 df 92 2f 93 68 93 a1 93 c8 93 1a 94 39 94 40 94 63 94 d8 91 01 95 d3 95 15 96 34 97 f0 97 70 98 d6 99 fd 99 8c 99 15 9a bc 9a f8 9a 5c 9b # ade5 |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12, $fn_read_sd, $fn_write_sd, $fn_init_sd, $fn_init_oled, $fn_deinit_oled, $fn_quick_deinit_oled, $fn_clear_oled, $fn_draw_char_oled, $fn_draw_str_oled, $fn_draw_char, $fn_draw_str]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # ae23 |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # ae47 |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # ae4d |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # ae5c |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # ae69 |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # ae78 |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # ae88 |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # ae97 |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # aea2 |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__str__TIMEOUT__endl:
54 49 4d 45 4f 55 54 0a 00     # aeb4 |   .data str:"TIMEOUT\n"
                               #      | const__str__INIT_OK__endl:
49 4e 49 54 5f 4f 4b 0a 00     # aebd |   .data str:"INIT_OK\n"
                               #      | const__data_7:
52 45 41 44 5f 53 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # aec6 |   .data str:"READ_SD_OK %x %x\n"
                               #      | const__str__DONE__endl:
44 4f 4e 45 0a 00              # aed8 |   .data str:"DONE\n"
                               #      | const__data_8:
57 52 49 54 45 5f 53 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # aede |   .data str:"WRITE_SD_OK %x %x\n"
                               #      | const__data_9:
4d 4d 41 50 5f 4f 4b 20 25 78 20 25 78 20 25 78 20 25 78 20 25 78 0a 00 # aef1 |   .data str:"MMAP_OK %x %x %x %x %x\n"
                               #      | const__data_10:
55 4d 41 50 5f 4f 4b 20 25 78 0a 00 # af09 |   .data str:"UMAP_OK %x\n"
                               #      | const__str__NO_SD__endl:
4e 4f 5f 53 44 0a 00           # af15 |   .data str:"NO_SD\n"
                               #      | const__str__SHOW_IMG_OK__endl:
53 48 4f 57 5f 49 4d 47 5f 4f 4b 0a 00 # af1c |   .data str:"SHOW_IMG_OK\n"
                               #      | const__str__SHOW_IMG_ERROR__endl:
53 48 4f 57 5f 49 4d 47 5f 45 52 52 4f 52 0a 00 # af29 |   .data str:"SHOW_IMG_ERROR\n"
                               #      | const__str__ERASE_SD_OK__endl:
45 52 41 53 45 5f 53 44 5f 4f 4b 0a 00 # af39 |   .data str:"ERASE_SD_OK\n"
                               #      | const__str__ERASE_SD_ERROR__endl:
45 52 41 53 45 5f 53 44 5f 45 52 52 4f 52 0a 00 # af46 |   .data str:"ERASE_SD_ERROR\n"
                               #      | const__HANDLER_MAP:
94 9b ce 9b e2 9c ce 9b e2 9c d4 9d d4 9d 67 9e 8e 9e 2d 9f ce 9b 3e 9f 4f 9f 42 a0 a1 a0 4f 9f ce a0 08 a2 # af56 |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp, $fn_handle_init_sd, $fn_handle_read_sd, $fn_handle_init_oled, $fn_handle_read, $fn_handle_deinit_oled, $fn_handle_write_sd, $fn_handle_mmap, $fn_handle_umap, $fn_handle_write_sd, $fn_handle_show_img, $fn_handle_erase_sd]
                               #      | const__data_11:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 32 2e 31 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 33 2e 37 0a 00 # af7a |   .data str:"Weeekly3006 - Hardware v2.1 - Bootloader v3.7\n"
                               #      | const__str__WeeeklyT:
57 65 65 65 6b 6c 79 54 00     # afa9 |   .data str:"WeeeklyT"
                               #      | const__data_12:
33 30 30 36 20 37 00           # afb2 |   .data str:"3006 7"
                               #      | const__str__FORCED_BOOTLOADER__endl:
46 4f 52 43 45 44 5f 42 4f 4f 54 4c 4f 41 44 45 52 0a 00 # afb9 |   .data str:"FORCED_BOOTLOADER\n"
                               #      | const__str__READY__endl:
52 45 41 44 59 0a 00           # afcc |   .data str:"READY\n"
                               #      | const__data_13:
53 44 5f 4c 4f 41 44 20 25 78 20 25 78 0a 00 # afd3 |   .data str:"SD_LOAD %x %x\n"
                               #      | const__data_14:
53 44 5f 4a 4d 50 20 25 78 0a 00 # afe2 |   .data str:"SD_JMP %x\n"
                               #      | const__data_15:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # afed |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # afff |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # b004 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # b009 |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # b00f |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # b015 |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # b01c |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # b020 |   .data str:"JMP_PERSIST"
                               #      | const__str__INIT_SD:
49 4e 49 54 5f 53 44 00        # b02c |   .data str:"INIT_SD"
                               #      | const__str__READ_SD:
52 45 41 44 5f 53 44 00        # b034 |   .data str:"READ_SD"
                               #      | const__str__INIT_OLED:
49 4e 49 54 5f 4f 4c 45 44 00  # b03c |   .data str:"INIT_OLED"
                               #      | const__str__READW:
52 45 41 44 57 00              # b046 |   .data str:"READW"
                               #      | const__str__DEINIT_OLED:
44 45 49 4e 49 54 5f 4f 4c 45 44 00 # b04c |   .data str:"DEINIT_OLED"
                               #      | const__str__WRITE_SD:
57 52 49 54 45 5f 53 44 00     # b058 |   .data str:"WRITE_SD"
                               #      | const__str__MMAP:
4d 4d 41 50 00                 # b061 |   .data str:"MMAP"
                               #      | const__str__UMAP:
55 4d 41 50 00                 # b066 |   .data str:"UMAP"
                               #      | const__str__WRITEB_SD:
57 52 49 54 45 42 5f 53 44 00  # b06b |   .data str:"WRITEB_SD"
                               #      | const__str__SHOW_IMG:
53 48 4f 57 5f 49 4d 47 00     # b075 |   .data str:"SHOW_IMG"
                               #      | const__str__ERASE_SD:
45 52 41 53 45 5f 53 44 00     # b07e |   .data str:"ERASE_SD"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # b087 |   .data str:"UNKNOWN_COMMAND\n"
                               #      | const__data_16:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 36 0a 00 # b098 |   .data str:"TOO_MANY_ARGS max=6\n"
                               #      | const__data_17:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # b0ad |   .data str:"INVALID_ARG idx=%d\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xb0c1
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # b0c1 |   .bss size:2 align:1
                               #      | var__g_num_args:
                               # b0c3 |   .bss size:2 align:1
                               # b0c5 |   .align dummy_size:1 align:2
                               #      | var__g_args:
                               # b0c6 |   .bss size:14 align:2
                               #      | var__g_has_sd_card:
                               # b0d4 |   .bss size:2 align:1
                               #      | var__g_sd_slot:
                               # b0d6 |   .bss size:2 align:1
                               #      | var__g_sd_jmp_target:
                               # b0d8 |   .bss size:2 align:1
                               #      | var__g_last_button_state:
                               # b0da |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
