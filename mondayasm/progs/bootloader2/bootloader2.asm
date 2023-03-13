                               #      | .config CODE_OFFSET 0x9000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 fe 8f                 # 9000 |   mov SP, 0x8ffe
                               #      | _A_call_155:
5c f8 f6 11                    # 9005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_155:
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
63 e0 bc c7 ad 02              # 9439 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 943f |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
61 ff e0 c7 ad                 # 9440 |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 9445 |   shl G, H, 0x7
34 ff fe                       # 944a |   xor H, G
a0 fe ff 1c 09                 # 944d |   shr G, H, 0x9
34 ff fe                       # 9452 |   xor H, G
a8 fe ff 1c 08                 # 9455 |   shl G, H, 0x8
34 ff fe                       # 945a |   xor H, G
62 e0 ff c7 ad                 # 945d |   mov [${var__rand__state}], H
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
61 40 e8 6e aa                 # 95f6 |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_20:
e0 1c 0c                       # 95fb |   push 0xc
e0 1c 10                       # 95fe |   push 0x10
e0 e8 79 a6                    # 9601 |   push ${const__FONT_16_12_COMPRESSED} + B
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
e0 e0 90 ab                    # 9b9e |   push ${const__str__PONG__endl}
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
eb e0 bc f8 c9 ad 02 1f 00     # 9bae |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_68}:rel + PC
                               #      | _A_call_50:
e2 e0 c9 ad                    # 9bb7 |   push [${var__g_num_args}]
e2 bc 04                       # 9bbb |   push [SP + 0x4]
e0 e0 6c ab                    # 9bbe |   push ${const__data_1}
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
61 20 e0 cc ad                 # 9bf5 |   mov A, [${var__g_args}]
61 40 e0 ce ad                 # 9bfa |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_56:
e0 40                          # 9bff |   push B
e0 20                          # 9c01 |   push A
e0 e0 b2 ab                    # 9c03 |   push ${const__data_2}
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
61 20 e0 cc ad                 # 9c97 |   mov A, [${var__g_args}]
61 40 e0 ce ad                 # 9c9c |   mov B, [${var__g_args} + 0002]
60 60 e0 96 ab                 # 9ca1 |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # 9ca6 |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 a5 ab                 # 9cac |   mov C, ${const__str__NOT_ALIGNED__endl}
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
61 20 e0 cc ad                 # 9d09 |   mov A, [${var__g_args}]
61 40 e0 ce ad                 # 9d0e |   mov B, [${var__g_args} + 0002]
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
e2 e0 cc ad                    # 9da7 |   push [${var__g_args}]
e0 e0 c1 ab                    # 9dab |   push ${const__data_3}
5c f8 5b f2                    # 9daf |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9db3 |   mov SP, SP + 0x6
                               #      | _Z_call_69:
58 f8 10 00                    # 9db7 |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_70:
e0 e0 d1 ab                    # 9dbb |   push ${const__data_4}
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
                               #      | _A_call_71:
e0 1c 01                       # 9dd4 |   push 0x1
5c f8 d4 fd                    # 9dd7 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9ddb |   mov SP, SP + 0x2
                               #      | _Z_call_71:
e8 fe 00 f8 68 00              # 9ddf |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_call_73:
e0 1c 52                       # 9de5 |   push 0x52
5c f8 60 00                    # 9de8 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # 9dec |   mov SP, SP + 0x2
                               #      | _Z_call_73:
62 e0 00 0a ff                 # 9df0 |   mov [0xff0a], 0
                               #      | _A_if_82:
ee bc 1c f8 02 06 1c 00        # 9df5 |   jne [SP + 0x2], 0x6, ${_E_if_82}:rel + PC
                               #      | _A_call_74:
e2 e0 cc ad                    # 9dfd |   push [${var__g_args}]
e0 e0 e0 ab                    # 9e01 |   push ${const__data_5}
5c f8 05 f2                    # 9e05 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9e09 |   mov SP, SP + 0x4
                               #      | _Z_call_74:
5a f8 bf 0f                    # 9e0d |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_82:
                               #      | _C_if_82:
                               #      | _Z_if_82:
63 e0 e0 1c ff cc ad           # 9e11 |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_75:
e2 e0 1c ff                    # 9e18 |   push [0xff1c]
e0 e0 eb ab                    # 9e1c |   push ${const__data_6}
5c f8 ea f1                    # 9e20 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9e24 |   mov SP, SP + 0x4
                               #      | _Z_call_75:
                               #      | glb_jmp_to_stored_target:
60 20 00                       # 9e28 |   mov A, 0
60 40 00                       # 9e2b |   mov B, 0
60 60 00                       # 9e2e |   mov C, 0
60 80 00                       # 9e31 |   mov D, 0
60 a0 00                       # 9e34 |   mov SP, 0
60 fc 00                       # 9e37 |   mov E, 0
60 fd 00                       # 9e3a |   mov F, 0
60 fe 00                       # 9e3d |   mov G, 0
60 ff 00                       # 9e40 |   mov H, 0
5a e0 1c ff                    # 9e43 |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # 9e47 |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_show_status:
                               #      | _begin_fn_show_status:
                               #      | _A_call_72:
e2 bc 02                       # 9e48 |   push [SP + 0x2]
e0 1c 07                       # 9e4b |   push 0x7
e0 1c 01                       # 9e4e |   push 0x1
5c f8 c4 fb                    # 9e51 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 9e55 |   mov SP, SP + 0x6
                               #      | _Z_call_72:
                               #      | _cleanup_fn_show_status:
dc                             # 9e59 |   ret
                               #      | _end_fn_show_status:
                               #      | 
                               #      | fn_handle_init_sd:
                               #      | _begin_fn_handle_init_sd:
                               #      | _A_call_76:
5c f8 96 f9                    # 9e5a |   call ${fn_init_sd}:rel + PC
                               #      | _Z_call_76:
                               #      | _A_if_83:
ec fe 00 f8 16 00              # 9e5e |   jne G, 0, ${_E_if_83}:rel + PC
                               #      | _A_call_77:
e0 e0 fd ab                    # 9e64 |   push ${const__str__TIMEOUT__endl}
5c f8 70 f3                    # 9e68 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e6c |   mov SP, SP + 0x2
                               #      | _Z_call_77:
58 f8 10 00                    # 9e70 |   jmp ${_C_if_83}:rel + PC
                               #      | _E_if_83:
                               #      | _A_call_78:
e0 e0 06 ac                    # 9e74 |   push ${const__str__INIT_OK__endl}
5c f8 60 f3                    # 9e78 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e7c |   mov SP, SP + 0x2
                               #      | _Z_call_78:
                               #      | _C_if_83:
                               #      | _Z_if_83:
                               #      | _cleanup_fn_handle_init_sd:
dc                             # 9e80 |   ret
                               #      | _end_fn_handle_init_sd:
                               #      | 
                               #      | fn_handle_read_sd:
                               #      | _begin_fn_handle_read_sd:
e0 40                          # 9e81 |   push B
e0 20                          # 9e83 |   push A
60 a0 bc fa                    # 9e85 |   mov SP, SP + -6
60 a0 f4 fe fd                 # 9e89 |   mov SP, 0xfdfe + SP
                               #      | _A_call_79:
e0 1c 02                       # 9e8e |   push 0x2
5c f8 1a fd                    # 9e91 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9e95 |   mov SP, SP + 0x2
                               #      | _Z_call_79:
e8 fe 00 f8 7d 00              # 9e99 |   jeq G, 0, ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _A_call_80:
e2 e0 ce ad                    # 9e9f |   push [${var__g_args} + 0002]
e2 e0 cc ad                    # 9ea3 |   push [${var__g_args}]
e0 e0 00 02                    # 9ea7 |   push 0x200
e0 bc 06                       # 9eab |   push SP + 0x6
5c f8 67 f7                    # 9eae |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # 9eb2 |   mov SP, SP + 0x8
                               #      | _Z_call_80:
                               #      | _A_if_85:
ec fe 00 f8 16 00              # 9eb6 |   jne G, 0, ${_E_if_85}:rel + PC
                               #      | _A_call_81:
e0 e0 fd ab                    # 9ebc |   push ${const__str__TIMEOUT__endl}
5c f8 18 f3                    # 9ec0 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9ec4 |   mov SP, SP + 0x2
                               #      | _Z_call_81:
58 f8 4e 00                    # 9ec8 |   jmp ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _E_if_85:
                               #      | _C_if_85:
                               #      | _Z_if_85:
                               #      | _A_call_82:
e2 e0 ce ad                    # 9ecc |   push [${var__g_args} + 0002]
e2 e0 cc ad                    # 9ed0 |   push [${var__g_args}]
e0 e0 0f ac                    # 9ed4 |   push ${const__data_7}
5c f8 32 f1                    # 9ed8 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9edc |   mov SP, SP + 0x6
                               #      | _Z_call_82:
                               #      | _A_for_18:
60 40 a0                       # 9ee0 |   mov B, SP
                               #      | _BA_for_18:
fc 40 f4 f8 00 02 28 00        # 9ee3 |   jge B, 0x200 + SP, ${_C_for_18}:rel + PC
                               #      | _A_call_83:
e0 f4 02 02                    # 9eeb |   push 0x202 + SP
e2 40                          # 9eef |   push [B]
5c f8 09 f3                    # 9ef1 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9ef5 |   mov SP, SP + 0x4
                               #      | _Z_call_83:
                               #      | _A_call_84:
e0 f4 04 02                    # 9ef9 |   push 0x204 + SP
5c f8 db f2                    # 9efd |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9f01 |   mov SP, SP + 0x2
                               #      | _Z_call_84:
                               #      | _BZ_for_18:
44 40                          # 9f05 |   inc B
58 f8 dc ff                    # 9f07 |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
                               #      | _Z_for_18:
                               #      | _A_call_85:
e0 1c 0a                       # 9f0b |   push 0xa
5c f8 65 f2                    # 9f0e |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9f12 |   mov SP, SP + 0x2
                               #      | _Z_call_85:
                               #      | _cleanup_fn_handle_read_sd:
60 a0 f4 08 02                 # 9f16 |   mov SP, 0x208 + SP
e4 20                          # 9f1b |   pop A
e4 40                          # 9f1d |   pop B
dc                             # 9f1f |   ret
                               #      | _end_fn_handle_read_sd:
                               #      | 
                               #      | fn_handle_init_oled:
                               #      | _begin_fn_handle_init_oled:
                               #      | _A_call_86:
5c f8 50 f9                    # 9f20 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_86:
                               #      | _A_call_87:
e0 e0 21 ac                    # 9f24 |   push ${const__str__DONE__endl}
5c f8 b0 f2                    # 9f28 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9f2c |   mov SP, SP + 0x2
                               #      | _Z_call_87:
                               #      | _cleanup_fn_handle_init_oled:
dc                             # 9f30 |   ret
                               #      | _end_fn_handle_init_oled:
                               #      | 
                               #      | fn_handle_deinit_oled:
                               #      | _begin_fn_handle_deinit_oled:
                               #      | _A_call_88:
5c f8 a5 fa                    # 9f31 |   call ${fn_deinit_oled}:rel + PC
                               #      | _Z_call_88:
                               #      | _A_call_89:
e0 e0 21 ac                    # 9f35 |   push ${const__str__DONE__endl}
5c f8 9f f2                    # 9f39 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9f3d |   mov SP, SP + 0x2
                               #      | _Z_call_89:
                               #      | _cleanup_fn_handle_deinit_oled:
dc                             # 9f41 |   ret
                               #      | _end_fn_handle_deinit_oled:
                               #      | 
                               #      | fn_handle_write_sd:
                               #      | _begin_fn_handle_write_sd:
e0 80                          # 9f42 |   push D
e0 60                          # 9f44 |   push C
e0 40                          # 9f46 |   push B
e0 20                          # 9f48 |   push A
60 a0 bc fa                    # 9f4a |   mov SP, SP + -6
60 a0 f4 fe fd                 # 9f4e |   mov SP, 0xfdfe + SP
                               #      | _A_call_90:
e0 1c 02                       # 9f53 |   push 0x2
5c f8 55 fc                    # 9f56 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9f5a |   mov SP, SP + 0x2
                               #      | _Z_call_90:
e8 fe 00 f8 c9 00              # 9f5e |   jeq G, 0, ${_cleanup_fn_handle_write_sd}:rel + PC
60 20 a0                       # 9f64 |   mov A, SP
                               #      | _A_while_11:
                               #      | _BA_while_11:
fc 20 f4 f8 00 02 5f 00        # 9f67 |   jge A, 0x200 + SP, ${_C_while_11}:rel + PC
                               #      | _A_if_87:
ee f4 1c f8 12 02 0d 45 00     # 9f6f |   jne [0x212 + SP], 0xd, ${_E_if_87}:rel + PC
                               #      | _A_for_19:
60 80 00                       # 9f78 |   mov D, 0
                               #      | _BA_for_19:
fc 80 1c f8 02 1e 00           # 9f7b |   jge D, 0x2, ${_C_for_19}:rel + PC
                               #      | _A_call_91:
5c f8 03 f3                    # 9f82 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_91:
62 e0 ff 00 ff                 # 9f86 |   mov [0xff00], H
60 60 f4 02 02                 # 9f8b |   mov C, 0x202 + SP
62 70 ff                       # 9f90 |   mov [C + D], H
                               #      | _BZ_for_19:
44 80                          # 9f93 |   inc D
58 f8 e6 ff                    # 9f95 |   jmp ${_BA_for_19}:rel + PC
                               #      | _C_for_19:
                               #      | _Z_for_19:
                               #      | _A_call_92:
e0 f4 02 02                    # 9f99 |   push 0x202 + SP
5c f8 42 f3                    # 9f9d |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9fa1 |   mov SP, SP + 0x2
                               #      | _Z_call_92:
e8 fe 00 f8 76 00              # 9fa5 |   jeq G, 0, ${_L_fn_handle_write_sd_1}:rel + PC
62 20 ff                       # 9fab |   mov [A], H
44 20                          # 9fae |   inc A
58 f8 12 00                    # 9fb0 |   jmp ${_C_if_87}:rel + PC
                               #      | _E_if_87:
                               #      | _A_call_93:
5c f8 d1 f2                    # 9fb4 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_93:
62 e0 ff 00 ff                 # 9fb8 |   mov [0xff00], H
62 20 ff                       # 9fbd |   mov [A], H
44 20                          # 9fc0 |   inc A
                               #      | _C_if_87:
                               #      | _Z_if_87:
                               #      | _BZ_while_11:
58 f8 a5 ff                    # 9fc2 |   jmp ${_BA_while_11}:rel + PC
                               #      | _C_while_11:
                               #      | _Z_while_11:
                               #      | _A_call_94:
5c f8 bf f2                    # 9fc6 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_94:
62 e0 ff 00 ff                 # 9fca |   mov [0xff00], H
ec ff 1c f8 0a 4c 00           # 9fcf |   jne H, 0xa, ${_L_fn_handle_write_sd_1}:rel + PC
                               #      | _A_call_95:
e2 e0 ce ad                    # 9fd6 |   push [${var__g_args} + 0002]
e2 e0 cc ad                    # 9fda |   push [${var__g_args}]
e0 e0 00 02                    # 9fde |   push 0x200
e0 bc 06                       # 9fe2 |   push SP + 0x6
5c f8 4f f7                    # 9fe5 |   call ${fn_write_sd}:rel + PC
60 a0 bc 08                    # 9fe9 |   mov SP, SP + 0x8
                               #      | _Z_call_95:
                               #      | _A_if_90:
ec fe 00 f8 16 00              # 9fed |   jne G, 0, ${_E_if_90}:rel + PC
                               #      | _A_call_96:
e0 e0 fd ab                    # 9ff3 |   push ${const__str__TIMEOUT__endl}
5c f8 e1 f1                    # 9ff7 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9ffb |   mov SP, SP + 0x2
                               #      | _Z_call_96:
58 f8 28 00                    # 9fff |   jmp ${_cleanup_fn_handle_write_sd}:rel + PC
                               #      | _E_if_90:
                               #      | _C_if_90:
                               #      | _Z_if_90:
                               #      | _A_call_97:
e2 e0 ce ad                    # a003 |   push [${var__g_args} + 0002]
e2 e0 cc ad                    # a007 |   push [${var__g_args}]
e0 e0 27 ac                    # a00b |   push ${const__data_8}
5c f8 fb ef                    # a00f |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a013 |   mov SP, SP + 0x6
                               #      | _Z_call_97:
58 f8 10 00                    # a017 |   jmp ${_cleanup_fn_handle_write_sd}:rel + PC
                               #      | _L_fn_handle_write_sd_1:
                               #      | _A_call_98:
e0 e0 d1 ab                    # a01b |   push ${const__data_4}
5c f8 b9 f1                    # a01f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a023 |   mov SP, SP + 0x2
                               #      | _Z_call_98:
                               #      | _cleanup_fn_handle_write_sd:
60 a0 f4 08 02                 # a027 |   mov SP, 0x208 + SP
e4 20                          # a02c |   pop A
e4 40                          # a02e |   pop B
e4 60                          # a030 |   pop C
e4 80                          # a032 |   pop D
dc                             # a034 |   ret
                               #      | _end_fn_handle_write_sd:
                               #      | 
                               #      | fn_handle_mmap:
                               #      | _begin_fn_handle_mmap:
e0 80                          # a035 |   push D
e0 60                          # a037 |   push C
e0 40                          # a039 |   push B
e0 20                          # a03b |   push A
                               #      | _A_call_99:
e0 fc                          # a03d |   push E
e0 1c 05                       # a03f |   push 0x5
5c f8 69 fb                    # a042 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a046 |   mov SP, SP + 0x2
e4 fc                          # a04a |   pop E
                               #      | _Z_call_99:
e8 fe 00 f8 3f 00              # a04c |   jeq G, 0, ${_cleanup_fn_handle_mmap}:rel + PC
61 20 e0 cc ad                 # a052 |   mov A, [${var__g_args}]
61 40 e0 ce ad                 # a057 |   mov B, [${var__g_args} + 0002]
61 60 e0 d0 ad                 # a05c |   mov C, [${var__g_args} + 0004]
61 80 e0 d2 ad                 # a061 |   mov D, [${var__g_args} + 0006]
ad fc e0 1c d4 ad 03           # a066 |   and E, [${var__g_args} + 0008], 0x3
54 60 80 fc                    # a06d |   mmap C, D, E
                               #      | _A_call_100:
e0 fc                          # a071 |   push E
e0 fc                          # a073 |   push E
e0 80                          # a075 |   push D
e0 60                          # a077 |   push C
e0 40                          # a079 |   push B
e0 20                          # a07b |   push A
e0 e0 3a ac                    # a07d |   push ${const__data_9}
5c f8 89 ef                    # a081 |   call ${fn_printf}:rel + PC
60 a0 bc 0c                    # a085 |   mov SP, SP + 0xc
e4 fc                          # a089 |   pop E
                               #      | _Z_call_100:
                               #      | _cleanup_fn_handle_mmap:
e4 20                          # a08b |   pop A
e4 40                          # a08d |   pop B
e4 60                          # a08f |   pop C
e4 80                          # a091 |   pop D
dc                             # a093 |   ret
                               #      | _end_fn_handle_mmap:
                               #      | 
                               #      | fn_handle_umap:
                               #      | _begin_fn_handle_umap:
e0 20                          # a094 |   push A
                               #      | _A_call_101:
e0 1c 01                       # a096 |   push 0x1
5c f8 12 fb                    # a099 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a09d |   mov SP, SP + 0x2
                               #      | _Z_call_101:
e8 fe 00 f8 1d 00              # a0a1 |   jeq G, 0, ${_cleanup_fn_handle_umap}:rel + PC
ad 20 e0 1c cc ad 03           # a0a7 |   and A, [${var__g_args}], 0x3
d4 20                          # a0ae |   umap A
                               #      | _A_call_102:
e0 20                          # a0b0 |   push A
e0 e0 52 ac                    # a0b2 |   push ${const__data_10}
5c f8 54 ef                    # a0b6 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a0ba |   mov SP, SP + 0x4
                               #      | _Z_call_102:
                               #      | _cleanup_fn_handle_umap:
e4 20                          # a0be |   pop A
dc                             # a0c0 |   ret
                               #      | _end_fn_handle_umap:
                               #      | 
                               #      | fn_handle_show_img:
                               #      | _begin_fn_handle_show_img:
                               #      | _A_call_103:
e0 1c 02                       # a0c1 |   push 0x2
5c f8 e7 fa                    # a0c4 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # a0c8 |   mov SP, SP + 0x2
                               #      | _Z_call_103:
e8 fe 00 f8 4e 00              # a0cc |   jeq G, 0, ${_cleanup_fn_handle_show_img}:rel + PC
                               #      | _A_if_94:
ee e0 00 f8 da ad 15 00        # a0d2 |   jne [${var__var_1}], 0, ${_E_if_94}:rel + PC
                               #      | _A_call_104:
e0 e0 5e ac                    # a0da |   push ${const__str__NO_SD__endl}
5c f8 fa f0                    # a0de |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0e2 |   mov SP, SP + 0x2
                               #      | _Z_call_104:
dc                             # a0e6 |   ret
                               #      | _E_if_94:
                               #      | _C_if_94:
                               #      | _Z_if_94:
                               #      | _A_call_109:
e2 e0 ce ad                    # a0e7 |   push [${var__g_args} + 0002]
e2 e0 cc ad                    # a0eb |   push [${var__g_args}]
5c f8 2c 00                    # a0ef |   call ${fn_display_image}:rel + PC
60 a0 bc 04                    # a0f3 |   mov SP, SP + 0x4
                               #      | _Z_call_109:
                               #      | _A_if_99:
ec fe 1c f8 01 17 00           # a0f7 |   jne G, 0x1, ${_E_if_99}:rel + PC
                               #      | _A_call_110:
e0 e0 65 ac                    # a0fe |   push ${const__str__SHOW_IMG_OK__endl}
5c f8 d6 f0                    # a102 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a106 |   mov SP, SP + 0x2
                               #      | _Z_call_110:
58 f8 10 00                    # a10a |   jmp ${_C_if_99}:rel + PC
                               #      | _E_if_99:
                               #      | _A_call_111:
e0 e0 72 ac                    # a10e |   push ${const__str__SHOW_IMG_ERROR__endl}
5c f8 c6 f0                    # a112 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a116 |   mov SP, SP + 0x2
                               #      | _Z_call_111:
                               #      | _C_if_99:
                               #      | _Z_if_99:
                               #      | _cleanup_fn_handle_show_img:
dc                             # a11a |   ret
                               #      | _end_fn_handle_show_img:
                               #      | 
                               #      | fn_display_image:
                               #      | _begin_fn_display_image:
e0 80                          # a11b |   push D
e0 60                          # a11d |   push C
e0 40                          # a11f |   push B
e0 20                          # a121 |   push A
60 a0 f4 f0 fd                 # a123 |   mov SP, 0xfdf0 + SP
a9 60 f4 1c 1c 02 08           # a128 |   shl C, [0x21c + SP], 0x8
                               #      | _A_call_105:
e0 60                          # a12f |   push C
e2 f4 1c 02                    # a131 |   push [0x21c + SP]
e0 e0 00 02                    # a135 |   push 0x200
e0 bc 06                       # a139 |   push SP + 0x6
5c f8 d9 f4                    # a13c |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # a140 |   mov SP, SP + 0x8
                               #      | _Z_call_105:
e8 fe 00 f8 a6 00              # a144 |   jeq G, 0, ${_cleanup_fn_display_image}:rel + PC
                               #      | _A_if_96:
ea a0 e0 f8 a6 3a 0f 00        # a14a |   jeq [SP], 0x3aa6, ${_E_if_96}:rel + PC
60 fe 00                       # a152 |   mov G, 0
58 f8 95 00                    # a155 |   jmp ${_cleanup_fn_display_image}:rel + PC
                               #      | _E_if_96:
                               #      | _C_if_96:
                               #      | _Z_if_96:
60 20 e0 a0 00                 # a159 |   mov A, 0xa0
60 40 00                       # a15e |   mov B, 0
54 e0 e0 1c 00 01 00 03 04     # a161 |   mmap 0x100, 0x300, 0x4
                               #      | _A_call_106:
e0 1c 30                       # a16a |   push 0x30
e0 bc 18                       # a16d |   push SP + 0x18
e0 e0 00 01                    # a170 |   push 0x100
5c f8 f4 f1                    # a174 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # a178 |   mov SP, SP + 0x6
                               #      | _Z_call_106:
60 20 e0 a1 00                 # a17c |   mov A, 0xa1
60 40 00                       # a181 |   mov B, 0
                               #      | _A_for_20:
c4 80 00                       # a184 |   inc D, 0
                               #      | _BA_for_20:
fc 80 e0 f8 e2 00 63 00        # a187 |   jge D, 0xe2, ${_C_for_20}:rel + PC
                               #      | _A_call_107:
e0 70                          # a18f |   push C + D
e2 f4 1c 02                    # a191 |   push [0x21c + SP]
e0 e0 00 02                    # a195 |   push 0x200
e0 bc 06                       # a199 |   push SP + 0x6
5c f8 79 f4                    # a19c |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # a1a0 |   mov SP, SP + 0x8
                               #      | _Z_call_107:
e8 fe 00 f8 46 00              # a1a4 |   jeq G, 0, ${_cleanup_fn_display_image}:rel + PC
54 e0 e0 1c 00 01 00 03 04     # a1aa |   mmap 0x100, 0x300, 0x4
                               #      | _A_call_108:
e0 e0 00 02                    # a1b3 |   push 0x200
e0 bc 02                       # a1b7 |   push SP + 0x2
e0 e0 00 01                    # a1ba |   push 0x100
5c f8 aa f1                    # a1be |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # a1c2 |   mov SP, SP + 0x6
                               #      | _Z_call_108:
ac ff 20 1c 0f                 # a1c6 |   and H, A, 0xf
28 ff 1c 01                    # a1cb |   shl H, 0x1
                               #      | _A_if_98:
f4 ff 1c f8 07 0f 00           # a1cf |   jle H, 0x7, ${_E_if_98}:rel + PC
c4 ff 00                       # a1d6 |   inc H, 0
60 40 e8 00 02                 # a1d9 |   mov B, 0x200 + B
                               #      | _E_if_98:
                               #      | _C_if_98:
                               #      | _Z_if_98:
b0 20 e0 ff a0 00              # a1de |   or A, 0xa0, H
                               #      | _BZ_for_20:
44 80                          # a1e4 |   inc D
58 f8 a1 ff                    # a1e6 |   jmp ${_BA_for_20}:rel + PC
                               #      | _C_for_20:
                               #      | _Z_for_20:
                               #      | _cleanup_fn_display_image:
d4 1c 04                       # a1ea |   umap 0x4
60 a0 f4 10 02                 # a1ed |   mov SP, 0x210 + SP
e4 20                          # a1f2 |   pop A
e4 40                          # a1f4 |   pop B
e4 60                          # a1f6 |   pop C
e4 80                          # a1f8 |   pop D
dc                             # a1fa |   ret
                               #      | _end_fn_display_image:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # a1fb |   push B
e0 20                          # a1fd |   push A
60 20 e0 fd 00                 # a1ff |   mov A, 0xfd
60 40 00                       # a204 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # a207 |   mmap 0xff00, -1, 0x2
62 e0 e0 1e ff 88 a2           # a20f |   mov [0xff1e], ${fn_syscall_entry}
                               #      | _A_call_112:
e0 e0 a4 ac                    # a216 |   push ${const__data_11}
5c f8 be ef                    # a21a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a21e |   mov SP, SP + 0x2
                               #      | _Z_call_112:
                               #      | _A_call_119:
5c f8 7a 00                    # a222 |   call ${fn_init_sd_and_oled}:rel + PC
                               #      | _Z_call_119:
                               #      | _A_call_124:
5c f8 cc 00                    # a226 |   call ${fn_check_persisted_target}:rel + PC
                               #      | _Z_call_124:
                               #      | _A_if_105:
ee e0 1c f8 da ad 01 21 00     # a22a |   jne [${var__var_1}], 0x1, ${_E_if_105}:rel + PC
                               #      | _A_call_125:
e0 00                          # a233 |   push 0
e0 1c 02                       # a235 |   push 0x2
5c f8 e3 fe                    # a238 |   call ${fn_display_image}:rel + PC
60 a0 bc 04                    # a23c |   mov SP, SP + 0x4
                               #      | _Z_call_125:
                               #      | _A_call_126:
e0 1c 2d                       # a240 |   push 0x2d
5c f8 05 fc                    # a243 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a247 |   mov SP, SP + 0x2
                               #      | _Z_call_126:
                               #      | _E_if_105:
                               #      | _C_if_105:
                               #      | _Z_if_105:
                               #      | _A_call_127:
e0 e0 f5 ac                    # a24b |   push ${const__str__READY__endl}
5c f8 89 ef                    # a24f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a253 |   mov SP, SP + 0x2
                               #      | _Z_call_127:
c6 e0 00 0a ff                 # a257 |   inc [0xff0a], 0
                               #      | _A_loop_12:
                               #      | _BA_loop_12:
                               #      | _A_call_154:
5c f8 fa 00                    # a25c |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_154:
46 e0 0a ff                    # a260 |   inc [0xff0a]
60 20 ff                       # a264 |   mov A, H
                               #      | _A_if_149:
ec fe 00 f8 0a 00              # a267 |   jne G, 0, ${_E_if_149}:rel + PC
58 f8 ef ff                    # a26d |   jmp ${_BA_loop_12}:rel + PC
                               #      | _E_if_149:
                               #      | _C_if_149:
                               #      | _Z_if_149:
60 40 21                       # a271 |   mov B, A*2
60 40 e8 80 ac                 # a274 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # a279 |   push A
5e 40                          # a27b |   call [B]
e4 20                          # a27d |   pop A
                               #      | _BZ_loop_12:
58 f8 dd ff                    # a27f |   jmp ${_BA_loop_12}:rel + PC
                               #      | _C_loop_12:
                               #      | _Z_loop_12:
                               #      | _cleanup_fn_main:
e4 20                          # a283 |   pop A
e4 40                          # a285 |   pop B
dc                             # a287 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_100:
f0 ff 1c f8 1f 08 00           # a288 |   jlt H, 0x1f, ${_E_if_100}:rel + PC
dc                             # a28f |   ret
                               #      | _E_if_100:
                               #      | _C_if_100:
                               #      | _Z_if_100:
28 ff 1c 01                    # a290 |   shl H, 0x1
00 ff e0 2e ab                 # a294 |   add H, ${const__SYSCALL_MAP}
5a ff                          # a299 |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # a29b |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_init_sd_and_oled:
                               #      | _begin_fn_init_sd_and_oled:
                               #      | _A_call_113:
5c f8 5d f5                    # a29c |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_113:
                               #      | _A_call_114:
5c f8 d0 f5                    # a2a0 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_114:
                               #      | _A_call_115:
e0 e0 d3 ac                    # a2a4 |   push ${const__str__Weeekly}
e0 00                          # a2a8 |   push 0
e0 00                          # a2aa |   push 0
5c f8 10 f8                    # a2ac |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # a2b0 |   mov SP, SP + 0x6
                               #      | _Z_call_115:
                               #      | _A_call_116:
e0 e0 db ac                    # a2b4 |   push ${const__data_12}
e0 00                          # a2b8 |   push 0
e0 1c 01                       # a2ba |   push 0x1
5c f8 ff f7                    # a2bd |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # a2c1 |   mov SP, SP + 0x6
                               #      | _Z_call_116:
                               #      | _A_call_117:
5c f8 5f f5                    # a2c5 |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_117:
60 ff 1c 53                    # a2c9 |   mov H, 0x53
c6 e0 00 da ad                 # a2cd |   inc [${var__var_1}], 0
                               #      | _A_if_101:
ec fe 00 f8 0f 00              # a2d2 |   jne G, 0, ${_E_if_101}:rel + PC
60 ff 1c 2d                    # a2d8 |   mov H, 0x2d
62 e0 00 da ad                 # a2dc |   mov [${var__var_1}], 0
                               #      | _E_if_101:
                               #      | _C_if_101:
                               #      | _Z_if_101:
                               #      | _A_call_118:
e0 ff                          # a2e1 |   push H
e0 1c 06                       # a2e3 |   push 0x6
e0 1c 01                       # a2e6 |   push 0x1
5c f8 2c f7                    # a2e9 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # a2ed |   mov SP, SP + 0x6
                               #      | _Z_call_118:
                               #      | _cleanup_fn_init_sd_and_oled:
dc                             # a2f1 |   ret
                               #      | _end_fn_init_sd_and_oled:
                               #      | 
                               #      | fn_check_persisted_target:
                               #      | _begin_fn_check_persisted_target:
e0 40                          # a2f2 |   push B
e0 20                          # a2f4 |   push A
61 20 e0 1c ff                 # a2f6 |   mov A, [0xff1c]
                               #      | _A_scope_8:
                               #      | _B_scope_8:
e8 20 00 f8 56 00              # a2fb |   jeq A, 0, ${_C_scope_8}:rel + PC
e8 20 e0 f8 00 90 50 00        # a301 |   jeq A, 0x9000, ${_C_scope_8}:rel + PC
61 40 e0 0c ff                 # a309 |   mov B, [0xff0c]
2c 40 e0 00 01                 # a30e |   and B, 0x100
                               #      | _A_if_104:
e8 40 00 f8 21 00              # a313 |   jeq B, 0, ${_E_if_104}:rel + PC
                               #      | _A_call_120:
e0 e0 e2 ac                    # a319 |   push ${const__str__FORCED_BOOTLOADER__endl}
5c f8 ed ec                    # a31d |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # a321 |   mov SP, SP + 0x2
                               #      | _Z_call_120:
                               #      | _A_call_121:
e0 1c 46                       # a325 |   push 0x46
5c f8 20 fb                    # a328 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a32c |   mov SP, SP + 0x2
                               #      | _Z_call_121:
58 f8 21 00                    # a330 |   jmp ${_C_scope_8}:rel + PC
                               #      | _E_if_104:
                               #      | _C_if_104:
                               #      | _Z_if_104:
                               #      | _A_call_122:
e0 20                          # a334 |   push A
e0 e0 e0 ab                    # a336 |   push ${const__data_5}
5c f8 d0 ec                    # a33a |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a33e |   mov SP, SP + 0x4
                               #      | _Z_call_122:
                               #      | _A_call_123:
e0 1c 50                       # a342 |   push 0x50
5c f8 03 fb                    # a345 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a349 |   mov SP, SP + 0x2
                               #      | _Z_call_123:
58 f8 db fa                    # a34d |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_8:
                               #      | _Z_scope_8:
                               #      | _cleanup_fn_check_persisted_target:
e4 20                          # a351 |   pop A
e4 40                          # a353 |   pop B
dc                             # a355 |   ret
                               #      | _end_fn_check_persisted_target:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # a356 |   push D
e0 60                          # a358 |   push C
e0 40                          # a35a |   push B
e0 20                          # a35c |   push A
60 a0 bc fe                    # a35e |   mov SP, SP + -2
62 a0 00                       # a362 |   mov [SP], 0
60 a0 bc de                    # a365 |   mov SP, SP + -34
62 a0 00                       # a369 |   mov [SP], 0
60 20 a0                       # a36c |   mov A, SP
                               #      | _A_loop_13:
                               #      | _BA_loop_13:
                               #      | _A_call_128:
5c f8 16 ef                    # a36f |   call ${fn_getc}:rel + PC
                               #      | _Z_call_128:
60 60 ff                       # a373 |   mov C, H
62 e0 60 00 ff                 # a376 |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # a37b |   jeq C, 0xa, ${_C_loop_13}:rel + PC
e8 60 1c f8 0d 29 00           # a382 |   jeq C, 0xd, ${_C_loop_13}:rel + PC
                               #      | _A_if_108:
f0 20 bc f8 1f 19 00           # a389 |   jlt A, SP + 0x1f, ${_E_if_108}:rel + PC
                               #      | _A_call_129:
e0 e0 fc ac                    # a390 |   push ${const__data_13}
5c f8 44 ee                    # a394 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a398 |   mov SP, SP + 0x2
                               #      | _Z_call_129:
e8 ff 00 f8 e3 00              # a39c |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_108:
                               #      | _C_if_108:
                               #      | _Z_if_108:
62 20 60                       # a3a2 |   mov [A], C
44 20                          # a3a5 |   inc A
                               #      | _BZ_loop_13:
58 f8 c8 ff                    # a3a7 |   jmp ${_BA_loop_13}:rel + PC
                               #      | _C_loop_13:
                               #      | _Z_loop_13:
                               #      | _A_call_130:
e0 1c 20                       # a3ab |   push 0x20
e0 bc 02                       # a3ae |   push SP + 0x2
5c f8 69 f0                    # a3b1 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a3b5 |   mov SP, SP + 0x4
                               #      | _Z_call_130:
60 60 ff                       # a3b9 |   mov C, H
                               #      | _A_if_110:
e8 60 00 f8 0f 00              # a3bc |   jeq C, 0, ${_E_if_110}:rel + PC
66 60 00                       # a3c2 |   bmov [C], 0
44 60                          # a3c5 |   inc C
58 f8 08 00                    # a3c7 |   jmp ${_C_if_110}:rel + PC
                               #      | _E_if_110:
60 60 1c ff                    # a3cb |   mov C, -1
                               #      | _C_if_110:
                               #      | _Z_if_110:
                               #      | _A_call_148:
e0 a0                          # a3cf |   push SP
5c f8 c1 00                    # a3d1 |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # a3d5 |   mov SP, SP + 0x2
                               #      | _Z_call_148:
                               #      | _A_if_145:
ec ff 00 f8 16 00              # a3d9 |   jne H, 0, ${_E_if_145}:rel + PC
                               #      | _A_call_149:
e0 e0 8d ad                    # a3df |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 f5 ed                    # a3e3 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a3e7 |   mov SP, SP + 0x2
                               #      | _Z_call_149:
58 f8 94 00                    # a3eb |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_145:
                               #      | _C_if_145:
                               #      | _Z_if_145:
62 bc ff 22                    # a3ef |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 c9 ad                 # a3f3 |   mov [${var__g_num_args}], 0
                               #      | _A_while_12:
                               #      | _BA_while_12:
fc 60 bc f8 20 7c 00           # a3f8 |   jge C, SP + 0x20, ${_C_while_12}:rel + PC
                               #      | _A_call_150:
e0 1c 20                       # a3ff |   push 0x20
e0 60                          # a402 |   push C
5c f8 16 f0                    # a404 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a408 |   mov SP, SP + 0x4
                               #      | _Z_call_150:
60 80 ff                       # a40c |   mov D, H
                               #      | _A_if_146:
e8 80 00 f8 0d 00              # a40f |   jeq D, 0, ${_E_if_146}:rel + PC
66 80 00                       # a415 |   bmov [D], 0
58 f8 08 00                    # a418 |   jmp ${_C_if_146}:rel + PC
                               #      | _E_if_146:
60 80 1c fe                    # a41c |   mov D, -2
                               #      | _C_if_146:
                               #      | _Z_if_146:
61 20 e0 c9 ad                 # a420 |   mov A, [${var__g_num_args}]
                               #      | _A_if_147:
f0 20 1c f8 06 17 00           # a425 |   jlt A, 0x6, ${_E_if_147}:rel + PC
                               #      | _A_call_151:
e0 e0 9e ad                    # a42c |   push ${const__data_14}
5c f8 a8 ed                    # a430 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a434 |   mov SP, SP + 0x2
                               #      | _Z_call_151:
58 f8 47 00                    # a438 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_147:
                               #      | _C_if_147:
                               #      | _Z_if_147:
                               #      | _A_call_152:
e0 60                          # a43c |   push C
5c f8 a1 ee                    # a43e |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a442 |   mov SP, SP + 0x2
                               #      | _Z_call_152:
                               #      | _A_if_148:
ec fe 00 f8 18 00              # a446 |   jne G, 0, ${_E_if_148}:rel + PC
                               #      | _A_call_153:
e0 20                          # a44c |   push A
e0 e0 b3 ad                    # a44e |   push ${const__data_15}
5c f8 b8 eb                    # a452 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a456 |   mov SP, SP + 0x4
                               #      | _Z_call_153:
58 f8 25 00                    # a45a |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_148:
                               #      | _C_if_148:
                               #      | _Z_if_148:
a8 40 20 1c 01                 # a45e |   shl B, A, 0x1
62 e8 ff cc ad                 # a463 |   mov [${var__g_args} + B], H
c6 e0 20 c9 ad                 # a468 |   inc [${var__g_num_args}], A
c4 60 80                       # a46d |   inc C, D
                               #      | _BZ_while_12:
58 f8 88 ff                    # a470 |   jmp ${_BA_while_12}:rel + PC
                               #      | _C_while_12:
                               #      | _Z_while_12:
c4 fe 00                       # a474 |   inc G, 0
61 ff bc 22                    # a477 |   mov H, [SP + 0x22]
58 f8 0a 00                    # a47b |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # a47f |   mov G, 0
60 ff 00                       # a482 |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # a485 |   mov SP, SP + 0x24
e4 20                          # a489 |   pop A
e4 40                          # a48b |   pop B
e4 60                          # a48d |   pop C
e4 80                          # a48f |   pop D
dc                             # a491 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # a492 |   push A
61 20 bc 04                    # a494 |   mov A, [SP + 0x4]
                               #      | _A_call_131:
e0 e0 0e ad                    # a498 |   push ${const__str__PING}
e0 20                          # a49c |   push A
5c f8 2a ef                    # a49e |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a4a2 |   mov SP, SP + 0x4
                               #      | _Z_call_131:
                               #      | _A_if_112:
ec ff 00 f8 0d 00              # a4a6 |   jne H, 0, ${_E_if_112}:rel + PC
c4 ff 00                       # a4ac |   inc H, 0
58 f8 c7 01                    # a4af |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_112:
                               #      | _C_if_112:
                               #      | _Z_if_112:
                               #      | _A_call_132:
e0 e0 13 ad                    # a4b3 |   push ${const__str__READ}
e0 20                          # a4b7 |   push A
5c f8 0f ef                    # a4b9 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a4bd |   mov SP, SP + 0x4
                               #      | _Z_call_132:
                               #      | _A_if_114:
ec ff 00 f8 0e 00              # a4c1 |   jne H, 0, ${_E_if_114}:rel + PC
60 ff 1c 02                    # a4c7 |   mov H, 0x2
58 f8 ab 01                    # a4cb |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_114:
                               #      | _C_if_114:
                               #      | _Z_if_114:
                               #      | _A_call_133:
e0 e0 18 ad                    # a4cf |   push ${const__str__WRITE}
e0 20                          # a4d3 |   push A
5c f8 f3 ee                    # a4d5 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a4d9 |   mov SP, SP + 0x4
                               #      | _Z_call_133:
                               #      | _A_if_116:
ec ff 00 f8 0e 00              # a4dd |   jne H, 0, ${_E_if_116}:rel + PC
60 ff 1c 03                    # a4e3 |   mov H, 0x3
58 f8 8f 01                    # a4e7 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_116:
                               #      | _C_if_116:
                               #      | _Z_if_116:
                               #      | _A_call_134:
e0 e0 1e ad                    # a4eb |   push ${const__str__READB}
e0 20                          # a4ef |   push A
5c f8 d7 ee                    # a4f1 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a4f5 |   mov SP, SP + 0x4
                               #      | _Z_call_134:
                               #      | _A_if_118:
ec ff 00 f8 0e 00              # a4f9 |   jne H, 0, ${_E_if_118}:rel + PC
60 ff 1c 04                    # a4ff |   mov H, 0x4
58 f8 73 01                    # a503 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_118:
                               #      | _C_if_118:
                               #      | _Z_if_118:
                               #      | _A_call_135:
e0 e0 24 ad                    # a507 |   push ${const__str__WRITEB}
e0 20                          # a50b |   push A
5c f8 bb ee                    # a50d |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a511 |   mov SP, SP + 0x4
                               #      | _Z_call_135:
                               #      | _A_if_120:
ec ff 00 f8 0e 00              # a515 |   jne H, 0, ${_E_if_120}:rel + PC
60 ff 1c 05                    # a51b |   mov H, 0x5
58 f8 57 01                    # a51f |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_120:
                               #      | _C_if_120:
                               #      | _Z_if_120:
                               #      | _A_call_136:
e0 e0 2b ad                    # a523 |   push ${const__str__JMP}
e0 20                          # a527 |   push A
5c f8 9f ee                    # a529 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a52d |   mov SP, SP + 0x4
                               #      | _Z_call_136:
                               #      | _A_if_122:
ec ff 00 f8 0e 00              # a531 |   jne H, 0, ${_E_if_122}:rel + PC
60 ff 1c 06                    # a537 |   mov H, 0x6
58 f8 3b 01                    # a53b |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_122:
                               #      | _C_if_122:
                               #      | _Z_if_122:
                               #      | _A_call_137:
e0 e0 2f ad                    # a53f |   push ${const__str__JMP_PERSIST}
e0 20                          # a543 |   push A
5c f8 83 ee                    # a545 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a549 |   mov SP, SP + 0x4
                               #      | _Z_call_137:
                               #      | _A_if_124:
ec ff 00 f8 0e 00              # a54d |   jne H, 0, ${_E_if_124}:rel + PC
60 ff 1c 07                    # a553 |   mov H, 0x7
58 f8 1f 01                    # a557 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_124:
                               #      | _C_if_124:
                               #      | _Z_if_124:
                               #      | _A_call_138:
e0 e0 3b ad                    # a55b |   push ${const__str__INIT_SD}
e0 20                          # a55f |   push A
5c f8 67 ee                    # a561 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a565 |   mov SP, SP + 0x4
                               #      | _Z_call_138:
                               #      | _A_if_126:
ec ff 00 f8 0e 00              # a569 |   jne H, 0, ${_E_if_126}:rel + PC
60 ff 1c 08                    # a56f |   mov H, 0x8
58 f8 03 01                    # a573 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_126:
                               #      | _C_if_126:
                               #      | _Z_if_126:
                               #      | _A_call_139:
e0 e0 43 ad                    # a577 |   push ${const__str__READ_SD}
e0 20                          # a57b |   push A
5c f8 4b ee                    # a57d |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a581 |   mov SP, SP + 0x4
                               #      | _Z_call_139:
                               #      | _A_if_128:
ec ff 00 f8 0e 00              # a585 |   jne H, 0, ${_E_if_128}:rel + PC
60 ff 1c 09                    # a58b |   mov H, 0x9
58 f8 e7 00                    # a58f |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_128:
                               #      | _C_if_128:
                               #      | _Z_if_128:
                               #      | _A_call_140:
e0 e0 4b ad                    # a593 |   push ${const__str__INIT_OLED}
e0 20                          # a597 |   push A
5c f8 2f ee                    # a599 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a59d |   mov SP, SP + 0x4
                               #      | _Z_call_140:
                               #      | _A_if_130:
ec ff 00 f8 0e 00              # a5a1 |   jne H, 0, ${_E_if_130}:rel + PC
60 ff 1c 0a                    # a5a7 |   mov H, 0xa
58 f8 cb 00                    # a5ab |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_130:
                               #      | _C_if_130:
                               #      | _Z_if_130:
                               #      | _A_call_141:
e0 e0 55 ad                    # a5af |   push ${const__str__READW}
e0 20                          # a5b3 |   push A
5c f8 13 ee                    # a5b5 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a5b9 |   mov SP, SP + 0x4
                               #      | _Z_call_141:
                               #      | _A_if_132:
ec ff 00 f8 0e 00              # a5bd |   jne H, 0, ${_E_if_132}:rel + PC
60 ff 1c 0b                    # a5c3 |   mov H, 0xb
58 f8 af 00                    # a5c7 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_132:
                               #      | _C_if_132:
                               #      | _Z_if_132:
                               #      | _A_call_142:
e0 e0 5b ad                    # a5cb |   push ${const__str__DEINIT_OLED}
e0 20                          # a5cf |   push A
5c f8 f7 ed                    # a5d1 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a5d5 |   mov SP, SP + 0x4
                               #      | _Z_call_142:
                               #      | _A_if_134:
ec ff 00 f8 0e 00              # a5d9 |   jne H, 0, ${_E_if_134}:rel + PC
60 ff 1c 0c                    # a5df |   mov H, 0xc
58 f8 93 00                    # a5e3 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_134:
                               #      | _C_if_134:
                               #      | _Z_if_134:
                               #      | _A_call_143:
e0 e0 67 ad                    # a5e7 |   push ${const__str__WRITE_SD}
e0 20                          # a5eb |   push A
5c f8 db ed                    # a5ed |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a5f1 |   mov SP, SP + 0x4
                               #      | _Z_call_143:
                               #      | _A_if_136:
ec ff 00 f8 0e 00              # a5f5 |   jne H, 0, ${_E_if_136}:rel + PC
60 ff 1c 0d                    # a5fb |   mov H, 0xd
58 f8 77 00                    # a5ff |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_136:
                               #      | _C_if_136:
                               #      | _Z_if_136:
                               #      | _A_call_144:
e0 e0 70 ad                    # a603 |   push ${const__str__MMAP}
e0 20                          # a607 |   push A
5c f8 bf ed                    # a609 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a60d |   mov SP, SP + 0x4
                               #      | _Z_call_144:
                               #      | _A_if_138:
ec ff 00 f8 0e 00              # a611 |   jne H, 0, ${_E_if_138}:rel + PC
60 ff 1c 0e                    # a617 |   mov H, 0xe
58 f8 5b 00                    # a61b |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_138:
                               #      | _C_if_138:
                               #      | _Z_if_138:
                               #      | _A_call_145:
e0 e0 75 ad                    # a61f |   push ${const__str__UMAP}
e0 20                          # a623 |   push A
5c f8 a3 ed                    # a625 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a629 |   mov SP, SP + 0x4
                               #      | _Z_call_145:
                               #      | _A_if_140:
ec ff 00 f8 0e 00              # a62d |   jne H, 0, ${_E_if_140}:rel + PC
60 ff 1c 0f                    # a633 |   mov H, 0xf
58 f8 3f 00                    # a637 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_140:
                               #      | _C_if_140:
                               #      | _Z_if_140:
                               #      | _A_call_146:
e0 e0 7a ad                    # a63b |   push ${const__str__WRITEB_SD}
e0 20                          # a63f |   push A
5c f8 87 ed                    # a641 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a645 |   mov SP, SP + 0x4
                               #      | _Z_call_146:
                               #      | _A_if_142:
ec ff 00 f8 0e 00              # a649 |   jne H, 0, ${_E_if_142}:rel + PC
60 ff 1c 10                    # a64f |   mov H, 0x10
58 f8 23 00                    # a653 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_142:
                               #      | _C_if_142:
                               #      | _Z_if_142:
                               #      | _A_call_147:
e0 e0 84 ad                    # a657 |   push ${const__str__SHOW_IMG}
e0 20                          # a65b |   push A
5c f8 6b ed                    # a65d |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a661 |   mov SP, SP + 0x4
                               #      | _Z_call_147:
                               #      | _A_if_144:
ec ff 00 f8 0e 00              # a665 |   jne H, 0, ${_E_if_144}:rel + PC
60 ff 1c 11                    # a66b |   mov H, 0x11
58 f8 07 00                    # a66f |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_144:
                               #      | _C_if_144:
                               #      | _Z_if_144:
60 ff 00                       # a673 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # a676 |   pop A
dc                             # a678 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # a679 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # aa6e |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
0a 90 73 91 85 92 8b 91 fa 91 50 92 37 92 a4 92 df 92 2f 93 68 93 a1 93 c8 93 1a 94 39 94 40 94 63 94 d8 91 01 95 d3 95 15 96 34 97 f0 97 70 98 d6 99 fd 99 8c 99 15 9a bc 9a f8 9a 5c 9b # ab2e |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12, $fn_read_sd, $fn_write_sd, $fn_init_sd, $fn_init_oled, $fn_deinit_oled, $fn_quick_deinit_oled, $fn_clear_oled, $fn_draw_char_oled, $fn_draw_str_oled, $fn_draw_char, $fn_draw_str]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # ab6c |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # ab90 |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # ab96 |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # aba5 |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # abb2 |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # abc1 |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # abd1 |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # abe0 |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # abeb |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__str__TIMEOUT__endl:
54 49 4d 45 4f 55 54 0a 00     # abfd |   .data str:"TIMEOUT\n"
                               #      | const__str__INIT_OK__endl:
49 4e 49 54 5f 4f 4b 0a 00     # ac06 |   .data str:"INIT_OK\n"
                               #      | const__data_7:
52 45 41 44 5f 53 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # ac0f |   .data str:"READ_SD_OK %x %x\n"
                               #      | const__str__DONE__endl:
44 4f 4e 45 0a 00              # ac21 |   .data str:"DONE\n"
                               #      | const__data_8:
57 52 49 54 45 5f 53 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # ac27 |   .data str:"WRITE_SD_OK %x %x\n"
                               #      | const__data_9:
4d 4d 41 50 5f 4f 4b 20 25 78 20 25 78 20 25 78 20 25 78 20 25 78 0a 00 # ac3a |   .data str:"MMAP_OK %x %x %x %x %x\n"
                               #      | const__data_10:
55 4d 41 50 5f 4f 4b 20 25 78 0a 00 # ac52 |   .data str:"UMAP_OK %x\n"
                               #      | const__str__NO_SD__endl:
4e 4f 5f 53 44 0a 00           # ac5e |   .data str:"NO_SD\n"
                               #      | const__str__SHOW_IMG_OK__endl:
53 48 4f 57 5f 49 4d 47 5f 4f 4b 0a 00 # ac65 |   .data str:"SHOW_IMG_OK\n"
                               #      | const__str__SHOW_IMG_ERROR__endl:
53 48 4f 57 5f 49 4d 47 5f 45 52 52 4f 52 0a 00 # ac72 |   .data str:"SHOW_IMG_ERROR\n"
                               #      | const__HANDLER_MAP:
94 9b ce 9b e2 9c ce 9b e2 9c d4 9d d4 9d 5a 9e 81 9e 20 9f ce 9b 31 9f 42 9f 35 a0 94 a0 42 9f c1 a0 # ac82 |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp, $fn_handle_init_sd, $fn_handle_read_sd, $fn_handle_init_oled, $fn_handle_read, $fn_handle_deinit_oled, $fn_handle_write_sd, $fn_handle_mmap, $fn_handle_umap, $fn_handle_write_sd, $fn_handle_show_img]
                               #      | const__data_11:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 32 2e 30 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 33 2e 36 0a 00 # aca4 |   .data str:"Weeekly3006 - Hardware v2.0 - Bootloader v3.6\n"
                               #      | const__str__Weeekly:
57 65 65 65 6b 6c 79 00        # acd3 |   .data str:"Weeekly"
                               #      | const__data_12:
33 30 30 36 20 36 00           # acdb |   .data str:"3006 6"
                               #      | const__str__FORCED_BOOTLOADER__endl:
46 4f 52 43 45 44 5f 42 4f 4f 54 4c 4f 41 44 45 52 0a 00 # ace2 |   .data str:"FORCED_BOOTLOADER\n"
                               #      | const__str__READY__endl:
52 45 41 44 59 0a 00           # acf5 |   .data str:"READY\n"
                               #      | const__data_13:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # acfc |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # ad0e |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # ad13 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # ad18 |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # ad1e |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # ad24 |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # ad2b |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # ad2f |   .data str:"JMP_PERSIST"
                               #      | const__str__INIT_SD:
49 4e 49 54 5f 53 44 00        # ad3b |   .data str:"INIT_SD"
                               #      | const__str__READ_SD:
52 45 41 44 5f 53 44 00        # ad43 |   .data str:"READ_SD"
                               #      | const__str__INIT_OLED:
49 4e 49 54 5f 4f 4c 45 44 00  # ad4b |   .data str:"INIT_OLED"
                               #      | const__str__READW:
52 45 41 44 57 00              # ad55 |   .data str:"READW"
                               #      | const__str__DEINIT_OLED:
44 45 49 4e 49 54 5f 4f 4c 45 44 00 # ad5b |   .data str:"DEINIT_OLED"
                               #      | const__str__WRITE_SD:
57 52 49 54 45 5f 53 44 00     # ad67 |   .data str:"WRITE_SD"
                               #      | const__str__MMAP:
4d 4d 41 50 00                 # ad70 |   .data str:"MMAP"
                               #      | const__str__UMAP:
55 4d 41 50 00                 # ad75 |   .data str:"UMAP"
                               #      | const__str__WRITEB_SD:
57 52 49 54 45 42 5f 53 44 00  # ad7a |   .data str:"WRITEB_SD"
                               #      | const__str__SHOW_IMG:
53 48 4f 57 5f 49 4d 47 00     # ad84 |   .data str:"SHOW_IMG"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # ad8d |   .data str:"UNKNOWN_COMMAND\n"
                               #      | const__data_14:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 36 0a 00 # ad9e |   .data str:"TOO_MANY_ARGS max=6\n"
                               #      | const__data_15:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # adb3 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xadc7
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # adc7 |   .bss size:2 align:1
                               #      | var__g_num_args:
                               # adc9 |   .bss size:2 align:1
                               # adcb |   .align dummy_size:1 align:2
                               #      | var__g_args:
                               # adcc |   .bss size:14 align:2
                               #      | var__var_1:
                               # adda |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
