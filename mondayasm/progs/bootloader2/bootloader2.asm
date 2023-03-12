                               #      | .config CODE_OFFSET 0x9000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 fe 8f                 # 9000 |   mov SP, 0x8ffe
                               #      | _A_call_134:
5c f8 d2 0e                    # 9005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_134:
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
63 e0 bc e3 aa 02              # 9439 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 943f |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 e3 aa                 # 9440 |   inc H, [${var__rand__state}]
62 e0 ff e3 aa                 # 9445 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 944a |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 944b |   push D
e0 60                          # 944d |   push C
e0 40                          # 944f |   push B
e0 20                          # 9451 |   push A
61 40 e0 10 ff                 # 9453 |   mov B, [0xff10]
61 60 e0 12 ff                 # 9458 |   mov C, [0xff12]
61 80 e0 14 ff                 # 945d |   mov D, [0xff14]
61 20 bc 0e                    # 9462 |   mov A, [SP + 0xe]
60 ff 00                       # 9466 |   mov H, 0
                               #      | _A_if_29:
fc 28 20 f8 09 00              # 9469 |   jge A + B, A, ${_E_if_29}:rel + PC
c4 ff 00                       # 946f |   inc H, 0
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
60 40 44                       # 9472 |   mov B, B + A
81 20 bc ff 0c                 # 9475 |   add A, [SP + 0xc], H
60 ff 00                       # 947a |   mov H, 0
                               #      | _A_scope_6:
                               #      | _B_scope_6:
f0 2c 20 f8 10 00              # 947d |   jlt A + C, A, ${_C_scope_6}:rel + PC
f0 20 ff f8 0a 00              # 9483 |   jlt A, H, ${_C_scope_6}:rel + PC
58 f8 07 00                    # 9489 |   jmp ${_Z_scope_6}:rel + PC
                               #      | _C_scope_6:
c4 ff 00                       # 948d |   inc H, 0
                               #      | _Z_scope_6:
60 60 64                       # 9490 |   mov C, C + A
81 20 bc ff 0a                 # 9493 |   add A, [SP + 0xa], H
60 80 84                       # 9498 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 949b |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 14 ff                 # 949f |   mov H, [0xff14]
                               #      | _A_if_32:
f4 ff 80 f8 0a 00              # 94a4 |   jle H, D, ${_E_if_32}:rel + PC
58 f8 33 00                    # 94aa |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_32:
ec ff 80 f8 2b 00              # 94ae |   jne H, D, ${_E2_if_32}:rel + PC
61 ff e0 12 ff                 # 94b4 |   mov H, [0xff12]
                               #      | _A_if_33:
f4 ff 60 f8 0a 00              # 94b9 |   jle H, C, ${_E_if_33}:rel + PC
58 f8 1e 00                    # 94bf |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_33:
ec ff 60 f8 16 00              # 94c3 |   jne H, C, ${_E2_if_33}:rel + PC
fa e0 40 f8 10 ff 14 00        # 94c9 |   jgt [0xff10], B, ${_C_loop_7}:rel + PC
                               #      | _A_if_35:
e8 20 00 f8 08 00              # 94d1 |   jeq A, 0, ${_E_if_35}:rel + PC
5c 20                          # 94d7 |   call A
                               #      | _E_if_35:
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _E2_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _E2_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _BZ_loop_7:
58 f8 c6 ff                    # 94d9 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 94dd |   pop A
e4 40                          # 94df |   pop B
e4 60                          # 94e1 |   pop C
e4 80                          # 94e3 |   pop D
dc                             # 94e5 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # 94e6 |   push D
e0 60                          # 94e8 |   push C
e0 40                          # 94ea |   push B
e0 20                          # 94ec |   push A
61 fc bc 0a                    # 94ee |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # 94f2 |   shl F, [SP + 0xe], 0x1
00 fd fc                       # 94f8 |   add F, E
61 fe bc 0c                    # 94fb |   mov G, [SP + 0xc]
61 40 fe                       # 94ff |   mov B, [G]
60 60 1c 07                    # 9502 |   mov C, 0x7
60 20 00                       # 9506 |   mov A, 0
60 a0 bc fe                    # 9509 |   mov SP, SP + -2
                               #      | _A_for_5:
                               #      | _BA_for_5:
fc fc fd f8 9e 00              # 950d |   jge E, F, ${_C_for_5}:rel + PC
                               #      |   # decode one line
60 20 00                       # 9513 |   mov A, 0
62 a0 1c ff                    # 9516 |   mov [SP], -1
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
                               #      | _A_if_36:
ec 60 1c f8 ff 10 00           # 951a |   jne C, -1, ${_E_if_36}:rel + PC
44 fe                          # 9521 |   inc G
61 40 fe                       # 9523 |   mov B, [G]
60 60 1c 07                    # 9526 |   mov C, 0x7
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
98 80 40 60                    # 952a |   getb D, B, C
48 60                          # 952e |   dec C
40 80                          # 9530 |   bool D
b0 20 21 80                    # 9532 |   or A, A*2, D
4a a0                          # 9536 |   dec [SP]
                               #      | _A_if_37:
ee a0 00 f8 1b 00              # 9538 |   jne [SP], 0, ${_E_if_37}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # 953e |   mov H, A
b9 20 bc 12                    # 9541 |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # 9545 |   shr A, -1, A + 0x10
ae fc ff 20                    # 954b |   and [E], H, A
58 f8 54 00                    # 954f |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_37:
ec 20 00 f8 20 00              # 9553 |   jne A, 0, ${_E2_if_37}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # 9559 |   sub H, E, 0x2
                               #      | _A_if_38:
f1 ff bc f8 0c 0e 00           # 955e |   jlt H, [SP + 0xc], ${_E_if_38}:rel + PC
63 fc ff                       # 9565 |   mov [E], [H]
58 f8 07 00                    # 9568 |   jmp ${_C_if_38}:rel + PC
                               #      | _E_if_38:
62 fc 00                       # 956c |   mov [E], 0
                               #      | _C_if_38:
                               #      | _Z_if_38:
58 f8 34 00                    # 956f |   jmp ${_C_loop_8}:rel + PC
                               #      | _E2_if_37:
ec 20 1c f8 02 13 00           # 9573 |   jne A, 0x2, ${_E3_if_37}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # 957a |   sub H, E, 0x4
63 fc ff                       # 957f |   mov [E], [H]
58 f8 21 00                    # 9582 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E3_if_37:
ec 20 1c f8 06 0e 00           # 9586 |   jne A, 0x6, ${_E4_if_37}:rel + PC
                               #      |   # all zeros
62 fc 00                       # 958d |   mov [E], 0
58 f8 13 00                    # 9590 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E4_if_37:
ec 20 1c f8 07 0b 00           # 9594 |   jne A, 0x7, ${_E5_if_37}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # 959b |   mov [SP], [SP + 0x12]
                               #      | _E5_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _BZ_loop_8:
58 f8 7b ff                    # 959f |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _BZ_for_5:
00 fc 1c 02                    # 95a3 |   add E, 0x2
58 f8 66 ff                    # 95a7 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # 95ab |   mov SP, SP + 0x2
e4 20                          # 95af |   pop A
e4 40                          # 95b1 |   pop B
e4 60                          # 95b3 |   pop C
e4 80                          # 95b5 |   pop D
dc                             # 95b7 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # 95b8 |   push B
e0 20                          # 95ba |   push A
61 20 bc 08                    # 95bc |   mov A, [SP + 0x8]
60 40 1c 1f                    # 95c0 |   mov B, 0x1f
                               #      | _A_scope_7:
                               #      | _B_scope_7:
f0 20 1c f8 20 13 00           # 95c4 |   jlt A, 0x20, ${_C_scope_7}:rel + PC
fc 20 e0 f8 80 00 0c 00        # 95cb |   jge A, 0x80, ${_C_scope_7}:rel + PC
60 40 3c e0                    # 95d3 |   mov B, A + -32
                               #      | _C_scope_7:
                               #      | _Z_scope_7:
28 40 1c 01                    # 95d7 |   shl B, 0x1
61 40 e8 d5 a7                 # 95db |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_20:
e0 1c 0c                       # 95e0 |   push 0xc
e0 1c 10                       # 95e3 |   push 0x10
e0 e8 e0 a3                    # 95e6 |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # 95ea |   push [SP + 0xc]
5c f8 f9 fe                    # 95ed |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # 95f1 |   mov SP, SP + 0x8
                               #      | _Z_call_20:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # 95f5 |   pop A
e4 40                          # 95f7 |   pop B
dc                             # 95f9 |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_read_sd:
                               #      | _begin_fn_read_sd:
e0 80                          # 95fa |   push D
e0 60                          # 95fc |   push C
e0 40                          # 95fe |   push B
e0 20                          # 9600 |   push A
                               #      | _A_call_21:
e0 fc                          # 9602 |   push E
e0 fd                          # 9604 |   push F
e2 bc 14                       # 9606 |   push [SP + 0x14]
e2 bc 14                       # 9609 |   push [SP + 0x14]
e0 00                          # 960c |   push 0
5c f8 ab 00                    # 960e |   call ${fn_send_sd_cmd}:rel + PC
60 a0 bc 06                    # 9612 |   mov SP, SP + 0x6
e4 fd                          # 9616 |   pop F
e4 fc                          # 9618 |   pop E
                               #      | _Z_call_21:
e8 fe 00 f8 90 00              # 961a |   jeq G, 0, ${_L_fn_read_sd_1}:rel + PC
61 fc bc 0a                    # 9620 |   mov E, [SP + 0xa]
60 fd 00                       # 9624 |   mov F, 0
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc fd e0 f8 00 02 75 00        # 9627 |   jge F, 0x200, ${_C_while_5}:rel + PC
44 80                          # 962f |   inc D
e8 80 1c f8 ff 79 00           # 9631 |   jeq D, -1, ${_L_fn_read_sd_1}:rel + PC
61 60 e0 26 ff                 # 9638 |   mov C, [0xff26]
98 20 60 1c 09                 # 963d |   getb A, C, 0x9
e8 20 00 f8 5a 00              # 9642 |   jeq A, 0, ${_C_while_5}:rel + PC
98 20 60 1c 08                 # 9648 |   getb A, C, 0x8
e8 20 00 f8 da ff              # 964d |   jeq A, 0, ${_BA_while_5}:rel + PC
1e e0 1c 24 ff 08              # 9653 |   setb [0xff24], 0x8
                               #      | _A_for_7:
60 80 00                       # 9659 |   mov D, 0
                               #      | _BA_for_7:
fc 80 1c f8 ff 1a 00           # 965c |   jge D, -1, ${_C_for_7}:rel + PC
99 40 e0 1c 26 ff 08           # 9663 |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # 966a |   jeq B, 0, ${_C_for_7}:rel + PC
                               #      | _BZ_for_7:
44 80                          # 9670 |   inc D
58 f8 ea ff                    # 9672 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
ec 40 00 f8 34 00              # 9676 |   jne B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 18              # 967c |   setb [0xff24], 0x18
2c 60 e0 ff 00                 # 9682 |   and C, 0xff
                               #      | _A_if_50:
fd fd bc f8 0c 0c 00           # 9687 |   jge F, [SP + 0xc], ${_E_if_50}:rel + PC
62 fc 60                       # 968e |   mov [E], C
44 fc                          # 9691 |   inc E
                               #      | _E_if_50:
                               #      | _C_if_50:
                               #      | _Z_if_50:
44 fd                          # 9693 |   inc F
60 80 00                       # 9695 |   mov D, 0
                               #      | _BZ_while_5:
58 f8 8f ff                    # 9698 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
c4 fe 00                       # 969c |   inc G, 0
b9 ff bc 0a                    # 969f |   neg H, [SP + 0xa]
00 ff fc                       # 96a3 |   add H, E
58 f8 0a 00                    # 96a6 |   jmp ${_cleanup_fn_read_sd}:rel + PC
                               #      | _L_fn_read_sd_1:
60 fe 00                       # 96aa |   mov G, 0
60 ff 00                       # 96ad |   mov H, 0
                               #      | _cleanup_fn_read_sd:
e4 20                          # 96b0 |   pop A
e4 40                          # 96b2 |   pop B
e4 60                          # 96b4 |   pop C
e4 80                          # 96b6 |   pop D
dc                             # 96b8 |   ret
                               #      | _end_fn_read_sd:
                               #      | 
                               #      | fn_send_sd_cmd:
                               #      | _begin_fn_send_sd_cmd:
e0 80                          # 96b9 |   push D
e0 40                          # 96bb |   push B
e0 20                          # 96bd |   push A
60 20 1c 09                    # 96bf |   mov A, 0x9
                               #      | _A_if_41:
ee bc 1c f8 08 01 0c 00        # 96c3 |   jne [SP + 0x8], 0x1, ${_E_if_41}:rel + PC
60 20 1c 0a                    # 96cb |   mov A, 0xa
                               #      | _E_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
63 e0 bc 22 ff 0a              # 96cf |   mov [0xff22], [SP + 0xa]
63 e0 bc 20 ff 0c              # 96d5 |   mov [0xff20], [SP + 0xc]
1e e0 20 24 ff                 # 96db |   setb [0xff24], A
                               #      | _A_for_6:
60 80 00                       # 96e0 |   mov D, 0
                               #      | _BA_for_6:
fc 80 1c f8 ff 1a 00           # 96e3 |   jge D, -1, ${_C_for_6}:rel + PC
99 40 e0 1c 26 ff 09           # 96ea |   getb B, [0xff26], 0x9
ec 40 00 f8 0c 00              # 96f1 |   jne B, 0, ${_C_for_6}:rel + PC
                               #      | _BZ_for_6:
44 80                          # 96f7 |   inc D
58 f8 ea ff                    # 96f9 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
60 20 3c 10                    # 96fd |   mov A, A + 0x10
1e e0 20 24 ff                 # 9701 |   setb [0xff24], A
c4 fe 00                       # 9706 |   inc G, 0
                               #      | _A_if_43:
ec 40 00 f8 09 00              # 9709 |   jne B, 0, ${_E_if_43}:rel + PC
60 fe 00                       # 970f |   mov G, 0
                               #      | _E_if_43:
                               #      | _C_if_43:
                               #      | _Z_if_43:
                               #      | _cleanup_fn_send_sd_cmd:
e4 20                          # 9712 |   pop A
e4 40                          # 9714 |   pop B
e4 80                          # 9716 |   pop D
dc                             # 9718 |   ret
                               #      | _end_fn_send_sd_cmd:
                               #      | 
                               #      | fn_write_sd:
                               #      | _begin_fn_write_sd:
e0 80                          # 9719 |   push D
e0 60                          # 971b |   push C
e0 40                          # 971d |   push B
e0 20                          # 971f |   push A
                               #      | _A_call_22:
e0 fc                          # 9721 |   push E
e0 fd                          # 9723 |   push F
e2 bc 14                       # 9725 |   push [SP + 0x14]
e2 bc 14                       # 9728 |   push [SP + 0x14]
e0 1c 01                       # 972b |   push 0x1
5c f8 8b ff                    # 972e |   call ${fn_send_sd_cmd}:rel + PC
60 a0 bc 06                    # 9732 |   mov SP, SP + 0x6
e4 fd                          # 9736 |   pop F
e4 fc                          # 9738 |   pop E
                               #      | _Z_call_22:
e8 fe 00 f8 8f 00              # 973a |   jeq G, 0, ${_L_fn_write_sd_1}:rel + PC
61 fc bc 0a                    # 9740 |   mov E, [SP + 0xa]
60 fd 00                       # 9744 |   mov F, 0
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc fd e0 f8 00 02 7b 00        # 9747 |   jge F, 0x200, ${_C_while_6}:rel + PC
44 80                          # 974f |   inc D
e8 80 1c f8 ff 78 00           # 9751 |   jeq D, -1, ${_L_fn_write_sd_1}:rel + PC
61 60 e0 26 ff                 # 9758 |   mov C, [0xff26]
98 20 60 1c 09                 # 975d |   getb A, C, 0x9
e8 20 00 f8 60 00              # 9762 |   jeq A, 0, ${_C_while_6}:rel + PC
98 20 60 1c 08                 # 9768 |   getb A, C, 0x8
e8 20 00 f8 da ff              # 976d |   jeq A, 0, ${_BA_while_6}:rel + PC
60 60 00                       # 9773 |   mov C, 0
                               #      | _A_if_55:
fd fd bc f8 0c 0c 00           # 9776 |   jge F, [SP + 0xc], ${_E_if_55}:rel + PC
65 60 fc                       # 977d |   bmov C, [E]
44 fc                          # 9780 |   inc E
                               #      | _E_if_55:
                               #      | _C_if_55:
                               #      | _Z_if_55:
ad 20 e0 e0 24 ff 00 fe        # 9782 |   and A, [0xff24], 0xfe00
9e e0 2c 1c 24 ff 08           # 978a |   setb [0xff24], A + C, 0x8
                               #      | _A_for_8:
60 80 00                       # 9791 |   mov D, 0
                               #      | _BA_for_8:
fc 80 1c f8 ff 1a 00           # 9794 |   jge D, -1, ${_C_for_8}:rel + PC
99 40 e0 1c 26 ff 08           # 979b |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # 97a2 |   jeq B, 0, ${_C_for_8}:rel + PC
                               #      | _BZ_for_8:
44 80                          # 97a8 |   inc D
58 f8 ea ff                    # 97aa |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
ec 40 00 f8 1b 00              # 97ae |   jne B, 0, ${_L_fn_write_sd_1}:rel + PC
62 e0 20 24 ff                 # 97b4 |   mov [0xff24], A
44 fd                          # 97b9 |   inc F
60 80 00                       # 97bb |   mov D, 0
                               #      | _BZ_while_6:
58 f8 89 ff                    # 97be |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
c4 fe 00                       # 97c2 |   inc G, 0
58 f8 07 00                    # 97c5 |   jmp ${_cleanup_fn_write_sd}:rel + PC
                               #      | _L_fn_write_sd_1:
60 fe 00                       # 97c9 |   mov G, 0
                               #      | _cleanup_fn_write_sd:
e4 20                          # 97cc |   pop A
e4 40                          # 97ce |   pop B
e4 60                          # 97d0 |   pop C
e4 80                          # 97d2 |   pop D
dc                             # 97d4 |   ret
                               #      | _end_fn_write_sd:
                               #      | 
                               #      | fn_init_sd:
                               #      | _begin_fn_init_sd:
                               #      | _A_call_24:
5c f8 09 00                    # 97d5 |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_24:
                               #      | _A_call_25:
5c f8 30 00                    # 97d9 |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_25:
                               #      | _cleanup_fn_init_sd:
dc                             # 97dd |   ret
                               #      | _end_fn_init_sd:
                               #      | 
                               #      | fn_init_sd_head:
                               #      | _begin_fn_init_sd_head:
1e e0 1c 24 ff 0c              # 97de |   setb [0xff24], 0xc
1e e0 1c 24 ff 1f              # 97e4 |   setb [0xff24], 0x1f
                               #      | _A_call_23:
e0 00                          # 97ea |   push 0
e0 e0 60 ea                    # 97ec |   push 0xea60
e0 00                          # 97f0 |   push 0
e0 00                          # 97f2 |   push 0
5c f8 57 fc                    # 97f4 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 97f8 |   mov SP, SP + 0x8
                               #      | _Z_call_23:
1e e0 1c 24 ff 0f              # 97fc |   setb [0xff24], 0xf
1e e0 1c 24 ff 1c              # 9802 |   setb [0xff24], 0x1c
                               #      | _cleanup_fn_init_sd_head:
dc                             # 9808 |   ret
                               #      | _end_fn_init_sd_head:
                               #      | 
                               #      | fn_init_sd_tail:
                               #      | _begin_fn_init_sd_tail:
e0 60                          # 9809 |   push C
e0 40                          # 980b |   push B
e0 20                          # 980d |   push A
                               #      | _A_for_9:
60 60 00                       # 980f |   mov C, 0
                               #      | _BA_for_9:
fc 60 1c f8 0a 30 00           # 9812 |   jge C, 0xa, ${_C_for_9}:rel + PC
                               #      | _A_for_10:
60 20 00                       # 9819 |   mov A, 0
                               #      | _BA_for_10:
fc 20 1c f8 ff 1a 00           # 981c |   jge A, -1, ${_C_for_10}:rel + PC
99 40 e0 1c 26 ff 09           # 9823 |   getb B, [0xff26], 0x9
e8 40 00 f8 0c 00              # 982a |   jeq B, 0, ${_C_for_10}:rel + PC
                               #      | _BZ_for_10:
44 20                          # 9830 |   inc A
58 f8 ea ff                    # 9832 |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
e8 40 00 f8 0c 00              # 9836 |   jeq B, 0, ${_C_for_9}:rel + PC
                               #      | _BZ_for_9:
44 60                          # 983c |   inc C
58 f8 d4 ff                    # 983e |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
c4 fe 00                       # 9842 |   inc G, 0
                               #      | _A_if_60:
e8 40 00 f8 09 00              # 9845 |   jeq B, 0, ${_E_if_60}:rel + PC
60 fe 00                       # 984b |   mov G, 0
                               #      | _E_if_60:
                               #      | _C_if_60:
                               #      | _Z_if_60:
                               #      | _cleanup_fn_init_sd_tail:
e4 20                          # 984e |   pop A
e4 40                          # 9850 |   pop B
e4 60                          # 9852 |   pop C
dc                             # 9854 |   ret
                               #      | _end_fn_init_sd_tail:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_27:
e0 00                          # 9855 |   push 0
5c f8 15 00                    # 9857 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 985b |   mov SP, SP + 0x2
                               #      | _Z_call_27:
                               #      | _A_call_28:
e0 e0 e7 a8                    # 985f |   push ${const__str__PONG__endl}
5c f8 75 f9                    # 9863 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9867 |   mov SP, SP + 0x2
                               #      | _Z_call_28:
                               #      | _cleanup_fn_handle_ping:
dc                             # 986b |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # 986c |   inc G, 0
                               #      | _A_if_61:
eb e0 bc f8 e5 aa 02 1f 00     # 986f |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_61}:rel + PC
                               #      | _A_call_26:
e2 e0 e5 aa                    # 9878 |   push [${var__g_num_args}]
e2 bc 04                       # 987c |   push [SP + 0x4]
e0 e0 c3 a8                    # 987f |   push ${const__data_1}
5c f8 87 f7                    # 9883 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9887 |   mov SP, SP + 0x6
                               #      | _Z_call_26:
60 fe 00                       # 988b |   mov G, 0
                               #      | _E_if_61:
                               #      | _C_if_61:
                               #      | _Z_if_61:
                               #      | _cleanup_fn_check_num_args:
dc                             # 988e |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # 988f |   push D
e0 60                          # 9891 |   push C
e0 40                          # 9893 |   push B
e0 20                          # 9895 |   push A
60 a0 bc fa                    # 9897 |   mov SP, SP + -6
                               #      | _A_call_29:
e0 1c 02                       # 989b |   push 0x2
5c f8 ce ff                    # 989e |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 98a2 |   mov SP, SP + 0x2
                               #      | _Z_call_29:
e8 fe 00 f8 9f 00              # 98a6 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_31:
5c f8 a6 00                    # 98ac |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_31:
e8 fe 00 f8 95 00              # 98b0 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 e8 aa                 # 98b6 |   mov A, [${var__g_args}]
61 40 e0 ea aa                 # 98bb |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_32:
e0 40                          # 98c0 |   push B
e0 20                          # 98c2 |   push A
e0 e0 09 a9                    # 98c4 |   push ${const__data_2}
5c f8 42 f7                    # 98c8 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 98cc |   mov SP, SP + 0x6
                               #      | _Z_call_32:
                               #      | _A_if_67:
ee bc 1c f8 10 04 35 00        # 98d0 |   jne [SP + 0x10], 0x4, ${_E_if_67}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 29 00              # 98d8 |   jge A, B, ${_C_while_7}:rel + PC
61 60 20                       # 98de |   mov C, [A]
                               #      | _A_call_33:
e0 60                          # 98e1 |   push C
5c f8 90 f8                    # 98e3 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 98e7 |   mov SP, SP + 0x2
                               #      | _Z_call_33:
20 60 1c 08                    # 98eb |   shr C, 0x8
                               #      | _A_call_34:
e0 60                          # 98ef |   push C
5c f8 82 f8                    # 98f1 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 98f5 |   mov SP, SP + 0x2
                               #      | _Z_call_34:
60 20 3c 02                    # 98f9 |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 db ff                    # 98fd |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 39 00                    # 9901 |   jmp ${_C_if_67}:rel + PC
                               #      | _E_if_67:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 35 00              # 9905 |   jge A, B, ${_C_while_8}:rel + PC
95 80 20 1c 08                 # 990b |   ror D, [A], 0x8
                               #      | _A_if_68:
ee bc 1c f8 10 0b 0c 00        # 9910 |   jne [SP + 0x10], 0xb, ${_E_if_68}:rel + PC
14 80 1c 08                    # 9918 |   ror D, 0x8
                               #      | _E_if_68:
                               #      | _C_if_68:
                               #      | _Z_if_68:
                               #      | _A_call_35:
e0 a0                          # 991c |   push SP
e0 80                          # 991e |   push D
5c f8 da f8                    # 9920 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9924 |   mov SP, SP + 0x4
                               #      | _Z_call_35:
                               #      | _A_call_36:
e0 a0                          # 9928 |   push SP
5c f8 ae f8                    # 992a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 992e |   mov SP, SP + 0x2
                               #      | _Z_call_36:
60 20 3c 02                    # 9932 |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 cf ff                    # 9936 |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_67:
                               #      | _Z_if_67:
                               #      | _A_call_37:
e0 1c 0a                       # 993a |   push 0xa
5c f8 36 f8                    # 993d |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9941 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # 9945 |   mov SP, SP + 0x6
e4 20                          # 9949 |   pop A
e4 40                          # 994b |   pop B
e4 60                          # 994d |   pop C
e4 80                          # 994f |   pop D
dc                             # 9951 |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # 9952 |   push C
e0 40                          # 9954 |   push B
e0 20                          # 9956 |   push A
61 20 e0 e8 aa                 # 9958 |   mov A, [${var__g_args}]
61 40 e0 ea aa                 # 995d |   mov B, [${var__g_args} + 0002]
60 60 e0 ed a8                 # 9962 |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # 9967 |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 fc a8                 # 996d |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # 9972 |   and G, A, 0x1
ec fe 00 f8 18 00              # 9977 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # 997d |   and G, B, 0x1
ec fe 00 f8 0d 00              # 9982 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # 9988 |   inc G, 0
58 f8 11 00                    # 998b |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_30:
e0 60                          # 998f |   push C
5c f8 47 f8                    # 9991 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9995 |   mov SP, SP + 0x2
                               #      | _Z_call_30:
60 fe 00                       # 9999 |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # 999c |   pop A
e4 40                          # 999e |   pop B
e4 60                          # 99a0 |   pop C
dc                             # 99a2 |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # 99a3 |   push D
e0 60                          # 99a5 |   push C
e0 40                          # 99a7 |   push B
e0 20                          # 99a9 |   push A
60 a0 bc fa                    # 99ab |   mov SP, SP + -6
                               #      | _A_call_38:
e0 1c 02                       # 99af |   push 0x2
5c f8 ba fe                    # 99b2 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 99b6 |   mov SP, SP + 0x2
                               #      | _Z_call_38:
e8 fe 00 f8 ce 00              # 99ba |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_39:
5c f8 92 ff                    # 99c0 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_39:
e8 fe 00 f8 c4 00              # 99c4 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 e8 aa                 # 99ca |   mov A, [${var__g_args}]
61 40 e0 ea aa                 # 99cf |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_71:
ee bc 1c f8 10 03 55 00        # 99d4 |   jne [SP + 0x10], 0x3, ${_E_if_71}:rel + PC
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 20 40 f8 49 00              # 99dc |   jge A, B, ${_C_while_9}:rel + PC
                               #      | _A_for_11:
60 80 00                       # 99e2 |   mov D, 0
                               #      | _BA_for_11:
fc 80 1c f8 04 19 00           # 99e5 |   jge D, 0x4, ${_C_for_11}:rel + PC
                               #      | _A_call_40:
5c f8 99 f8                    # 99ec |   call ${fn_getc}:rel + PC
                               #      | _Z_call_40:
62 e0 ff 00 ff                 # 99f0 |   mov [0xff00], H
62 b0 ff                       # 99f5 |   mov [SP + D], H
                               #      | _BZ_for_11:
44 80                          # 99f8 |   inc D
58 f8 eb ff                    # 99fa |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
                               #      | _A_call_41:
e0 a0                          # 99fe |   push SP
5c f8 df f8                    # 9a00 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9a04 |   mov SP, SP + 0x2
                               #      | _Z_call_41:
e8 fe 00 f8 74 00              # 9a08 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # 9a0e |   shl C, H, 0x8
20 ff 1c 08                    # 9a13 |   shr H, 0x8
30 60 ff                       # 9a17 |   or C, H
62 20 60                       # 9a1a |   mov [A], C
60 20 3c 02                    # 9a1d |   mov A, A + 0x2
                               #      | _BZ_while_9:
58 f8 bb ff                    # 9a21 |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
58 f8 31 00                    # 9a25 |   jmp ${_C_if_71}:rel + PC
                               #      | _E_if_71:
                               #      | _A_while_10:
                               #      | _BA_while_10:
fc 20 40 f8 2d 00              # 9a29 |   jge A, B, ${_C_while_10}:rel + PC
                               #      | _A_call_42:
5c f8 56 f8                    # 9a2f |   call ${fn_getc}:rel + PC
                               #      | _Z_call_42:
62 e0 ff 00 ff                 # 9a33 |   mov [0xff00], H
60 60 ff                       # 9a38 |   mov C, H
                               #      | _A_call_43:
5c f8 4a f8                    # 9a3b |   call ${fn_getc}:rel + PC
                               #      | _Z_call_43:
62 e0 ff 00 ff                 # 9a3f |   mov [0xff00], H
28 ff 1c 08                    # 9a44 |   shl H, 0x8
30 60 ff                       # 9a48 |   or C, H
62 20 60                       # 9a4b |   mov [A], C
60 20 3c 02                    # 9a4e |   mov A, A + 0x2
                               #      | _BZ_while_10:
58 f8 d7 ff                    # 9a52 |   jmp ${_BA_while_10}:rel + PC
                               #      | _C_while_10:
                               #      | _Z_while_10:
                               #      | _C_if_71:
                               #      | _Z_if_71:
                               #      | _A_call_44:
5c f8 2f f8                    # 9a56 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_44:
62 e0 ff 00 ff                 # 9a5a |   mov [0xff00], H
ec ff 1c f8 0a 1d 00           # 9a5f |   jne H, 0xa, ${_L_fn_handle_write_1}:rel + PC
                               #      | _A_call_45:
e0 40                          # 9a66 |   push B
e2 e0 e8 aa                    # 9a68 |   push [${var__g_args}]
e0 e0 18 a9                    # 9a6c |   push ${const__data_3}
5c f8 9a f5                    # 9a70 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9a74 |   mov SP, SP + 0x6
                               #      | _Z_call_45:
58 f8 10 00                    # 9a78 |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_46:
e0 e0 28 a9                    # 9a7c |   push ${const__data_4}
5c f8 58 f7                    # 9a80 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9a84 |   mov SP, SP + 0x2
                               #      | _Z_call_46:
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # 9a88 |   mov SP, SP + 0x6
e4 20                          # 9a8c |   pop A
e4 40                          # 9a8e |   pop B
e4 60                          # 9a90 |   pop C
e4 80                          # 9a92 |   pop D
dc                             # 9a94 |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
                               #      | _A_call_47:
e0 1c 01                       # 9a95 |   push 0x1
5c f8 d4 fd                    # 9a98 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9a9c |   mov SP, SP + 0x2
                               #      | _Z_call_47:
e8 fe 00 f8 5d 00              # 9aa0 |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_if_75:
ee bc 1c f8 02 06 1c 00        # 9aa6 |   jne [SP + 0x2], 0x6, ${_E_if_75}:rel + PC
                               #      | _A_call_48:
e2 e0 e8 aa                    # 9aae |   push [${var__g_args}]
e0 e0 37 a9                    # 9ab2 |   push ${const__data_5}
5c f8 54 f5                    # 9ab6 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9aba |   mov SP, SP + 0x4
                               #      | _Z_call_48:
5a f8 2a 10                    # 9abe |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_75:
                               #      | _C_if_75:
                               #      | _Z_if_75:
63 e0 e0 1c ff e8 aa           # 9ac2 |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_49:
e2 e0 1c ff                    # 9ac9 |   push [0xff1c]
e0 e0 42 a9                    # 9acd |   push ${const__data_6}
5c f8 39 f5                    # 9ad1 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9ad5 |   mov SP, SP + 0x4
                               #      | _Z_call_49:
                               #      | glb_jmp_to_stored_target:
62 e0 00 0a ff                 # 9ad9 |   mov [0xff0a], 0
60 20 00                       # 9ade |   mov A, 0
60 40 00                       # 9ae1 |   mov B, 0
60 60 00                       # 9ae4 |   mov C, 0
60 80 00                       # 9ae7 |   mov D, 0
60 a0 00                       # 9aea |   mov SP, 0
60 fc 00                       # 9aed |   mov E, 0
60 fd 00                       # 9af0 |   mov F, 0
60 fe 00                       # 9af3 |   mov G, 0
60 ff 00                       # 9af6 |   mov H, 0
5a e0 1c ff                    # 9af9 |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # 9afd |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_handle_init_sd:
                               #      | _begin_fn_handle_init_sd:
                               #      | _A_call_50:
5c f8 d7 fc                    # 9afe |   call ${fn_init_sd}:rel + PC
                               #      | _Z_call_50:
                               #      | _A_if_76:
ec fe 00 f8 16 00              # 9b02 |   jne G, 0, ${_E_if_76}:rel + PC
                               #      | _A_call_51:
e0 e0 54 a9                    # 9b08 |   push ${const__str__TIMEOUT__endl}
5c f8 cc f6                    # 9b0c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9b10 |   mov SP, SP + 0x2
                               #      | _Z_call_51:
58 f8 10 00                    # 9b14 |   jmp ${_C_if_76}:rel + PC
                               #      | _E_if_76:
                               #      | _A_call_52:
e0 e0 5d a9                    # 9b18 |   push ${const__str__INIT_OK__endl}
5c f8 bc f6                    # 9b1c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9b20 |   mov SP, SP + 0x2
                               #      | _Z_call_52:
                               #      | _C_if_76:
                               #      | _Z_if_76:
                               #      | _cleanup_fn_handle_init_sd:
dc                             # 9b24 |   ret
                               #      | _end_fn_handle_init_sd:
                               #      | 
                               #      | fn_handle_read_sd:
                               #      | _begin_fn_handle_read_sd:
e0 40                          # 9b25 |   push B
e0 20                          # 9b27 |   push A
60 a0 bc fa                    # 9b29 |   mov SP, SP + -6
60 a0 f4 fe fd                 # 9b2d |   mov SP, 0xfdfe + SP
                               #      | _A_call_53:
e0 1c 02                       # 9b32 |   push 0x2
5c f8 37 fd                    # 9b35 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9b39 |   mov SP, SP + 0x2
                               #      | _Z_call_53:
e8 fe 00 f8 7d 00              # 9b3d |   jeq G, 0, ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _A_call_54:
e2 e0 ea aa                    # 9b43 |   push [${var__g_args} + 0002]
e2 e0 e8 aa                    # 9b47 |   push [${var__g_args}]
e0 e0 00 02                    # 9b4b |   push 0x200
e0 bc 06                       # 9b4f |   push SP + 0x6
5c f8 a8 fa                    # 9b52 |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # 9b56 |   mov SP, SP + 0x8
                               #      | _Z_call_54:
                               #      | _A_if_78:
ec fe 00 f8 16 00              # 9b5a |   jne G, 0, ${_E_if_78}:rel + PC
                               #      | _A_call_55:
e0 e0 54 a9                    # 9b60 |   push ${const__str__TIMEOUT__endl}
5c f8 74 f6                    # 9b64 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9b68 |   mov SP, SP + 0x2
                               #      | _Z_call_55:
58 f8 4e 00                    # 9b6c |   jmp ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _E_if_78:
                               #      | _C_if_78:
                               #      | _Z_if_78:
                               #      | _A_call_56:
e2 e0 ea aa                    # 9b70 |   push [${var__g_args} + 0002]
e2 e0 e8 aa                    # 9b74 |   push [${var__g_args}]
e0 e0 66 a9                    # 9b78 |   push ${const__data_7}
5c f8 8e f4                    # 9b7c |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9b80 |   mov SP, SP + 0x6
                               #      | _Z_call_56:
                               #      | _A_for_12:
60 40 a0                       # 9b84 |   mov B, SP
                               #      | _BA_for_12:
fc 40 f4 f8 00 02 28 00        # 9b87 |   jge B, 0x200 + SP, ${_C_for_12}:rel + PC
                               #      | _A_call_57:
e0 f4 02 02                    # 9b8f |   push 0x202 + SP
e2 40                          # 9b93 |   push [B]
5c f8 65 f6                    # 9b95 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9b99 |   mov SP, SP + 0x4
                               #      | _Z_call_57:
                               #      | _A_call_58:
e0 f4 04 02                    # 9b9d |   push 0x204 + SP
5c f8 37 f6                    # 9ba1 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9ba5 |   mov SP, SP + 0x2
                               #      | _Z_call_58:
                               #      | _BZ_for_12:
44 40                          # 9ba9 |   inc B
58 f8 dc ff                    # 9bab |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _A_call_59:
e0 1c 0a                       # 9baf |   push 0xa
5c f8 c1 f5                    # 9bb2 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9bb6 |   mov SP, SP + 0x2
                               #      | _Z_call_59:
                               #      | _cleanup_fn_handle_read_sd:
60 a0 f4 08 02                 # 9bba |   mov SP, 0x208 + SP
e4 20                          # 9bbf |   pop A
e4 40                          # 9bc1 |   pop B
dc                             # 9bc3 |   ret
                               #      | _end_fn_handle_read_sd:
                               #      | 
                               #      | fn_handle_init_oled:
                               #      | _begin_fn_handle_init_oled:
                               #      | _A_call_74:
5c f8 11 00                    # 9bc4 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_74:
                               #      | _A_call_75:
e0 e0 78 a9                    # 9bc8 |   push ${const__str__DONE__endl}
5c f8 0c f6                    # 9bcc |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9bd0 |   mov SP, SP + 0x2
                               #      | _Z_call_75:
                               #      | _cleanup_fn_handle_init_oled:
dc                             # 9bd4 |   ret
                               #      | _end_fn_handle_init_oled:
                               #      | 
                               #      | fn_init_oled:
                               #      | _begin_fn_init_oled:
e0 80                          # 9bd5 |   push D
60 80 e0 32 ff                 # 9bd7 |   mov D, 0xff32
62 80 00                       # 9bdc |   mov [D], 0
1e 80 1c 0f                    # 9bdf |   setb [D], 0xf
                               #      | _A_call_61:
5c f8 72 00                    # 9be3 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_61:
                               #      | _A_call_63:
e0 e0 ae 00                    # 9be7 |   push 0xae
5c f8 7d 00                    # 9beb |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9bef |   mov SP, SP + 0x2
                               #      | _Z_call_63:
1e 80 1c 0d                    # 9bf3 |   setb [D], 0xd
                               #      | _A_call_64:
5c f8 5e 00                    # 9bf7 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_64:
1e 80 1c 1d                    # 9bfb |   setb [D], 0x1d
                               #      | _A_call_65:
5c f8 56 00                    # 9bff |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_65:
                               #      | _A_call_67:
e0 e0 f1 00                    # 9c03 |   push 0xf1
e0 e0 d9 00                    # 9c07 |   push 0xd9
e0 1c 14                       # 9c0b |   push 0x14
e0 e0 8d 00                    # 9c0e |   push 0x8d
e0 1c 04                       # 9c12 |   push 0x4
5c f8 ae 00                    # 9c15 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0a                    # 9c19 |   mov SP, SP + 0xa
                               #      | _Z_call_67:
1e 80 1c 0e                    # 9c1d |   setb [D], 0xe
                               #      | _A_call_68:
5c f8 34 00                    # 9c21 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_68:
                               #      | _A_call_69:
e0 00                          # 9c25 |   push 0
e0 1c 20                       # 9c27 |   push 0x20
e0 e0 af 00                    # 9c2a |   push 0xaf
e0 00                          # 9c2e |   push 0
e0 e0 da 00                    # 9c30 |   push 0xda
e0 e0 c0 00                    # 9c34 |   push 0xc0
e0 e0 a0 00                    # 9c38 |   push 0xa0
e0 1c 0f                       # 9c3c |   push 0xf
e0 e0 81 00                    # 9c3f |   push 0x81
e0 1c 09                       # 9c43 |   push 0x9
5c f8 7d 00                    # 9c46 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 14                    # 9c4a |   mov SP, SP + 0x14
                               #      | _Z_call_69:
                               #      | _A_call_73:
5c f8 a3 00                    # 9c4e |   call ${fn_clear_oled}:rel + PC
                               #      | _Z_call_73:
                               #      | _cleanup_fn_init_oled:
e4 80                          # 9c52 |   pop D
dc                             # 9c54 |   ret
                               #      | _end_fn_init_oled:
                               #      | 
                               #      | fn_delay_1ms:
                               #      | _begin_fn_delay_1ms:
                               #      | _A_call_60:
e0 00                          # 9c55 |   push 0
e0 e0 60 ea                    # 9c57 |   push 0xea60
e0 00                          # 9c5b |   push 0
e0 00                          # 9c5d |   push 0
5c f8 ec f7                    # 9c5f |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 9c63 |   mov SP, SP + 0x8
                               #      | _Z_call_60:
                               #      | _cleanup_fn_delay_1ms:
dc                             # 9c67 |   ret
                               #      | _end_fn_delay_1ms:
                               #      | 
                               #      | fn_send_oled_cmd:
                               #      | _begin_fn_send_oled_cmd:
                               #      | _A_call_62:
e2 bc 02                       # 9c68 |   push [SP + 0x2]
e0 00                          # 9c6b |   push 0
5c f8 09 00                    # 9c6d |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9c71 |   mov SP, SP + 0x4
                               #      | _Z_call_62:
                               #      | _cleanup_fn_send_oled_cmd:
dc                             # 9c75 |   ret
                               #      | _end_fn_send_oled_cmd:
                               #      | 
                               #      | fn_send_oled_data_or_cmd:
                               #      | _begin_fn_send_oled_data_or_cmd:
e0 40                          # 9c76 |   push B
e0 20                          # 9c78 |   push A
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
99 40 e0 1c 30 ff 08           # 9c7a |   getb B, [0xff30], 0x8
ec 40 00 f8 0a 00              # 9c81 |   jne B, 0, ${_C_loop_9}:rel + PC
                               #      | _BZ_loop_9:
58 f8 f3 ff                    # 9c87 |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
ad 40 bc e0 08 ff 00           # 9c8b |   and B, [SP + 0x8], 0xff
ad 20 e0 e0 32 ff 00 ff        # 9c92 |   and A, [0xff32], 0xff00
30 20 e8 00 01                 # 9c9a |   or A, 0x100 + B
                               #      | _A_if_80:
ee bc 00 f8 06 0f 00           # 9c9f |   jne [SP + 0x6], 0, ${_E_if_80}:rel + PC
1c 20 1c 1c                    # 9ca6 |   setb A, 0x1c
58 f8 08 00                    # 9caa |   jmp ${_C_if_80}:rel + PC
                               #      | _E_if_80:
1c 20 1c 0c                    # 9cae |   setb A, 0xc
                               #      | _C_if_80:
                               #      | _Z_if_80:
62 e0 20 32 ff                 # 9cb2 |   mov [0xff32], A
9e e0 20 1c 32 ff 18           # 9cb7 |   setb [0xff32], A, 0x18
                               #      | _cleanup_fn_send_oled_data_or_cmd:
e4 20                          # 9cbe |   pop A
e4 40                          # 9cc0 |   pop B
dc                             # 9cc2 |   ret
                               #      | _end_fn_send_oled_data_or_cmd:
                               #      | 
                               #      | fn_send_oled_cmd_sequence:
                               #      | _begin_fn_send_oled_cmd_sequence:
e0 40                          # 9cc3 |   push B
e0 20                          # 9cc5 |   push A
60 20 bc 08                    # 9cc7 |   mov A, SP + 0x8
61 40 bc 06                    # 9ccb |   mov B, [SP + 0x6]
60 40 45                       # 9ccf |   mov B, B*2 + A
                               #      | _A_for_13:
                               #      | _BA_for_13:
fc 20 40 f8 1a 00              # 9cd2 |   jge A, B, ${_C_for_13}:rel + PC
                               #      | _A_call_66:
e2 20                          # 9cd8 |   push [A]
e0 00                          # 9cda |   push 0
5c f8 9a ff                    # 9cdc |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9ce0 |   mov SP, SP + 0x4
                               #      | _Z_call_66:
                               #      | _BZ_for_13:
60 20 3c 02                    # 9ce4 |   mov A, A + 0x2
58 f8 ea ff                    # 9ce8 |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
                               #      | _cleanup_fn_send_oled_cmd_sequence:
e4 20                          # 9cec |   pop A
e4 40                          # 9cee |   pop B
dc                             # 9cf0 |   ret
                               #      | _end_fn_send_oled_cmd_sequence:
                               #      | 
                               #      | fn_clear_oled:
                               #      | _begin_fn_clear_oled:
e0 20                          # 9cf1 |   push A
                               #      | _A_call_70:
e0 1c 03                       # 9cf3 |   push 0x3
e0 00                          # 9cf6 |   push 0
e0 1c 22                       # 9cf8 |   push 0x22
e0 1c 7f                       # 9cfb |   push 0x7f
e0 00                          # 9cfe |   push 0
e0 1c 21                       # 9d00 |   push 0x21
e0 1c 06                       # 9d03 |   push 0x6
5c f8 bd ff                    # 9d06 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # 9d0a |   mov SP, SP + 0xe
                               #      | _Z_call_70:
                               #      | _A_for_14:
60 20 00                       # 9d0e |   mov A, 0
                               #      | _BA_for_14:
fc 20 e0 f8 00 02 18 00        # 9d11 |   jge A, 0x200, ${_C_for_14}:rel + PC
                               #      | _A_call_72:
e0 00                          # 9d19 |   push 0
5c f8 11 00                    # 9d1b |   call ${fn_send_oled_data}:rel + PC
60 a0 bc 02                    # 9d1f |   mov SP, SP + 0x2
                               #      | _Z_call_72:
                               #      | _BZ_for_14:
44 20                          # 9d23 |   inc A
58 f8 ec ff                    # 9d25 |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
                               #      | _Z_for_14:
                               #      | _cleanup_fn_clear_oled:
e4 20                          # 9d29 |   pop A
dc                             # 9d2b |   ret
                               #      | _end_fn_clear_oled:
                               #      | 
                               #      | fn_send_oled_data:
                               #      | _begin_fn_send_oled_data:
                               #      | _A_call_71:
e2 bc 02                       # 9d2c |   push [SP + 0x2]
e0 1c 01                       # 9d2f |   push 0x1
5c f8 44 ff                    # 9d32 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9d36 |   mov SP, SP + 0x4
                               #      | _Z_call_71:
                               #      | _cleanup_fn_send_oled_data:
dc                             # 9d3a |   ret
                               #      | _end_fn_send_oled_data:
                               #      | 
                               #      | fn_handle_deinit_oled:
                               #      | _begin_fn_handle_deinit_oled:
                               #      | _A_call_78:
5c f8 11 00                    # 9d3b |   call ${fn_deinit_oled}:rel + PC
                               #      | _Z_call_78:
                               #      | _A_call_79:
e0 e0 78 a9                    # 9d3f |   push ${const__str__DONE__endl}
5c f8 95 f4                    # 9d43 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9d47 |   mov SP, SP + 0x2
                               #      | _Z_call_79:
                               #      | _cleanup_fn_handle_deinit_oled:
dc                             # 9d4b |   ret
                               #      | _end_fn_handle_deinit_oled:
                               #      | 
                               #      | fn_deinit_oled:
                               #      | _begin_fn_deinit_oled:
e0 80                          # 9d4c |   push D
60 80 e0 32 ff                 # 9d4e |   mov D, 0xff32
                               #      | _A_call_76:
e0 e0 ae 00                    # 9d53 |   push 0xae
5c f8 11 ff                    # 9d57 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9d5b |   mov SP, SP + 0x2
                               #      | _Z_call_76:
1e 80 1c 1e                    # 9d5f |   setb [D], 0x1e
                               #      | _A_call_77:
5c f8 f2 fe                    # 9d63 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_77:
1e 80 1c 1f                    # 9d67 |   setb [D], 0x1f
62 e0 00 32 ff                 # 9d6b |   mov [0xff32], 0
                               #      | _cleanup_fn_deinit_oled:
e4 80                          # 9d70 |   pop D
dc                             # 9d72 |   ret
                               #      | _end_fn_deinit_oled:
                               #      | 
                               #      | fn_handle_write_sd:
                               #      | _begin_fn_handle_write_sd:
e0 80                          # 9d73 |   push D
e0 60                          # 9d75 |   push C
e0 40                          # 9d77 |   push B
e0 20                          # 9d79 |   push A
60 a0 bc fa                    # 9d7b |   mov SP, SP + -6
60 a0 f4 fe fd                 # 9d7f |   mov SP, 0xfdfe + SP
                               #      | _A_call_80:
e0 1c 02                       # 9d84 |   push 0x2
5c f8 e5 fa                    # 9d87 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9d8b |   mov SP, SP + 0x2
                               #      | _Z_call_80:
e8 fe 00 f8 ae 00              # 9d8f |   jeq G, 0, ${_cleanup_fn_handle_write_sd}:rel + PC
60 20 a0                       # 9d95 |   mov A, SP
                               #      | _A_while_11:
                               #      | _BA_while_11:
fc 20 f4 f8 00 02 44 00        # 9d98 |   jge A, 0x200 + SP, ${_C_while_11}:rel + PC
                               #      | _A_for_15:
60 80 00                       # 9da0 |   mov D, 0
                               #      | _BA_for_15:
fc 80 1c f8 02 1e 00           # 9da3 |   jge D, 0x2, ${_C_for_15}:rel + PC
                               #      | _A_call_81:
5c f8 db f4                    # 9daa |   call ${fn_getc}:rel + PC
                               #      | _Z_call_81:
62 e0 ff 00 ff                 # 9dae |   mov [0xff00], H
60 60 f4 02 02                 # 9db3 |   mov C, 0x202 + SP
62 70 ff                       # 9db8 |   mov [C + D], H
                               #      | _BZ_for_15:
44 80                          # 9dbb |   inc D
58 f8 e6 ff                    # 9dbd |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
                               #      | _A_call_82:
e0 f4 02 02                    # 9dc1 |   push 0x202 + SP
5c f8 1a f5                    # 9dc5 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9dc9 |   mov SP, SP + 0x2
                               #      | _Z_call_82:
e8 fe 00 f8 64 00              # 9dcd |   jeq G, 0, ${_L_fn_handle_write_sd_1}:rel + PC
62 20 ff                       # 9dd3 |   mov [A], H
44 20                          # 9dd6 |   inc A
                               #      | _BZ_while_11:
58 f8 c0 ff                    # 9dd8 |   jmp ${_BA_while_11}:rel + PC
                               #      | _C_while_11:
                               #      | _Z_while_11:
                               #      | _A_call_83:
5c f8 a9 f4                    # 9ddc |   call ${fn_getc}:rel + PC
                               #      | _Z_call_83:
62 e0 ff 00 ff                 # 9de0 |   mov [0xff00], H
ec ff 1c f8 0a 4c 00           # 9de5 |   jne H, 0xa, ${_L_fn_handle_write_sd_1}:rel + PC
                               #      | _A_call_84:
e2 e0 ea aa                    # 9dec |   push [${var__g_args} + 0002]
e2 e0 e8 aa                    # 9df0 |   push [${var__g_args}]
e0 e0 00 02                    # 9df4 |   push 0x200
e0 bc 06                       # 9df8 |   push SP + 0x6
5c f8 1e f9                    # 9dfb |   call ${fn_write_sd}:rel + PC
60 a0 bc 08                    # 9dff |   mov SP, SP + 0x8
                               #      | _Z_call_84:
                               #      | _A_if_84:
ec fe 00 f8 16 00              # 9e03 |   jne G, 0, ${_E_if_84}:rel + PC
                               #      | _A_call_85:
e0 e0 54 a9                    # 9e09 |   push ${const__str__TIMEOUT__endl}
5c f8 cb f3                    # 9e0d |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e11 |   mov SP, SP + 0x2
                               #      | _Z_call_85:
58 f8 28 00                    # 9e15 |   jmp ${_cleanup_fn_handle_write_sd}:rel + PC
                               #      | _E_if_84:
                               #      | _C_if_84:
                               #      | _Z_if_84:
                               #      | _A_call_86:
e2 e0 ea aa                    # 9e19 |   push [${var__g_args} + 0002]
e2 e0 e8 aa                    # 9e1d |   push [${var__g_args}]
e0 e0 7e a9                    # 9e21 |   push ${const__data_8}
5c f8 e5 f1                    # 9e25 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9e29 |   mov SP, SP + 0x6
                               #      | _Z_call_86:
58 f8 10 00                    # 9e2d |   jmp ${_cleanup_fn_handle_write_sd}:rel + PC
                               #      | _L_fn_handle_write_sd_1:
                               #      | _A_call_87:
e0 e0 28 a9                    # 9e31 |   push ${const__data_4}
5c f8 a3 f3                    # 9e35 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e39 |   mov SP, SP + 0x2
                               #      | _Z_call_87:
                               #      | _cleanup_fn_handle_write_sd:
60 a0 f4 08 02                 # 9e3d |   mov SP, 0x208 + SP
e4 20                          # 9e42 |   pop A
e4 40                          # 9e44 |   pop B
e4 60                          # 9e46 |   pop C
e4 80                          # 9e48 |   pop D
dc                             # 9e4a |   ret
                               #      | _end_fn_handle_write_sd:
                               #      | 
                               #      | fn_handle_mmap:
                               #      | _begin_fn_handle_mmap:
e0 80                          # 9e4b |   push D
e0 60                          # 9e4d |   push C
e0 40                          # 9e4f |   push B
e0 20                          # 9e51 |   push A
                               #      | _A_call_88:
e0 fc                          # 9e53 |   push E
e0 1c 05                       # 9e55 |   push 0x5
5c f8 14 fa                    # 9e58 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9e5c |   mov SP, SP + 0x2
e4 fc                          # 9e60 |   pop E
                               #      | _Z_call_88:
e8 fe 00 f8 3f 00              # 9e62 |   jeq G, 0, ${_cleanup_fn_handle_mmap}:rel + PC
61 20 e0 e8 aa                 # 9e68 |   mov A, [${var__g_args}]
61 40 e0 ea aa                 # 9e6d |   mov B, [${var__g_args} + 0002]
61 60 e0 ec aa                 # 9e72 |   mov C, [${var__g_args} + 0004]
61 80 e0 ee aa                 # 9e77 |   mov D, [${var__g_args} + 0006]
ad fc e0 1c f0 aa 03           # 9e7c |   and E, [${var__g_args} + 0008], 0x3
54 60 80 fc                    # 9e83 |   mmap C, D, E
                               #      | _A_call_89:
e0 fc                          # 9e87 |   push E
e0 fc                          # 9e89 |   push E
e0 80                          # 9e8b |   push D
e0 60                          # 9e8d |   push C
e0 40                          # 9e8f |   push B
e0 20                          # 9e91 |   push A
e0 e0 91 a9                    # 9e93 |   push ${const__data_9}
5c f8 73 f1                    # 9e97 |   call ${fn_printf}:rel + PC
60 a0 bc 0c                    # 9e9b |   mov SP, SP + 0xc
e4 fc                          # 9e9f |   pop E
                               #      | _Z_call_89:
                               #      | _cleanup_fn_handle_mmap:
e4 20                          # 9ea1 |   pop A
e4 40                          # 9ea3 |   pop B
e4 60                          # 9ea5 |   pop C
e4 80                          # 9ea7 |   pop D
dc                             # 9ea9 |   ret
                               #      | _end_fn_handle_mmap:
                               #      | 
                               #      | fn_handle_umap:
                               #      | _begin_fn_handle_umap:
e0 20                          # 9eaa |   push A
                               #      | _A_call_90:
e0 1c 01                       # 9eac |   push 0x1
5c f8 bd f9                    # 9eaf |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9eb3 |   mov SP, SP + 0x2
                               #      | _Z_call_90:
e8 fe 00 f8 1d 00              # 9eb7 |   jeq G, 0, ${_cleanup_fn_handle_umap}:rel + PC
ad 20 e0 1c e8 aa 03           # 9ebd |   and A, [${var__g_args}], 0x3
d4 20                          # 9ec4 |   umap A
                               #      | _A_call_91:
e0 20                          # 9ec6 |   push A
e0 e0 a9 a9                    # 9ec8 |   push ${const__data_10}
5c f8 3e f1                    # 9ecc |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9ed0 |   mov SP, SP + 0x4
                               #      | _Z_call_91:
                               #      | _cleanup_fn_handle_umap:
e4 20                          # 9ed4 |   pop A
dc                             # 9ed6 |   ret
                               #      | _end_fn_handle_umap:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # 9ed7 |   push B
e0 20                          # 9ed9 |   push A
60 20 e0 fd 00                 # 9edb |   mov A, 0xfd
60 40 00                       # 9ee0 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # 9ee3 |   mmap 0xff00, -1, 0x2
62 e0 e0 1e ff f6 9f           # 9eeb |   mov [0xff1e], ${fn_syscall_entry}
                               #      | _A_call_93:
5c f8 18 01                    # 9ef2 |   call ${fn_quick_deinit_oled}:rel + PC
                               #      | _Z_call_93:
                               #      | _A_call_94:
e0 e0 d3 a9                    # 9ef6 |   push ${const__data_11}
5c f8 de f2                    # 9efa |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9efe |   mov SP, SP + 0x2
                               #      | _Z_call_94:
61 20 e0 1c ff                 # 9f02 |   mov A, [0xff1c]
                               #      | _A_scope_8:
                               #      | _B_scope_8:
e8 20 00 f8 40 00              # 9f07 |   jeq A, 0, ${_C_scope_8}:rel + PC
e8 20 e0 f8 00 90 3a 00        # 9f0d |   jeq A, 0x9000, ${_C_scope_8}:rel + PC
61 40 e0 0c ff                 # 9f15 |   mov B, [0xff0c]
2c 40 e0 00 01                 # 9f1a |   and B, 0x100
                               #      | _A_if_90:
e8 40 00 f8 16 00              # 9f1f |   jeq B, 0, ${_E_if_90}:rel + PC
                               #      | _A_call_95:
e0 e0 02 aa                    # 9f25 |   push ${const__str__FORCED_BOOTLOADER__endl}
5c f8 e1 f0                    # 9f29 |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # 9f2d |   mov SP, SP + 0x2
                               #      | _Z_call_95:
58 f8 16 00                    # 9f31 |   jmp ${_C_scope_8}:rel + PC
                               #      | _E_if_90:
                               #      | _C_if_90:
                               #      | _Z_if_90:
                               #      | _A_call_96:
e0 20                          # 9f35 |   push A
e0 e0 37 a9                    # 9f37 |   push ${const__data_5}
5c f8 cf f0                    # 9f3b |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9f3f |   mov SP, SP + 0x4
                               #      | _Z_call_96:
58 f8 96 fb                    # 9f43 |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_8:
                               #      | _Z_scope_8:
                               #      | _A_call_97:
5c f8 97 f8                    # 9f47 |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_97:
                               #      | _A_call_98:
5c f8 8a fc                    # 9f4b |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_98:
                               #      | _A_call_103:
e0 e0 15 aa                    # 9f4f |   push ${const__str__Weeekly}
e0 00                          # 9f53 |   push 0
e0 00                          # 9f55 |   push 0
5c f8 cb 00                    # 9f57 |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # 9f5b |   mov SP, SP + 0x6
                               #      | _Z_call_103:
                               #      | _A_call_104:
e0 e0 1d aa                    # 9f5f |   push ${const__data_12}
e0 00                          # 9f63 |   push 0
e0 1c 01                       # 9f65 |   push 0x1
5c f8 ba 00                    # 9f68 |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # 9f6c |   mov SP, SP + 0x6
                               #      | _Z_call_104:
                               #      | _A_call_105:
5c f8 99 f8                    # 9f70 |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_105:
60 ff 1c 53                    # 9f74 |   mov H, 0x53
                               #      | _A_if_92:
ec fe 00 f8 0a 00              # 9f78 |   jne G, 0, ${_E_if_92}:rel + PC
60 ff 1c 2d                    # 9f7e |   mov H, 0x2d
                               #      | _E_if_92:
                               #      | _C_if_92:
                               #      | _Z_if_92:
                               #      | _A_call_106:
e0 ff                          # 9f82 |   push H
e0 1c 06                       # 9f84 |   push 0x6
e0 1c 01                       # 9f87 |   push 0x1
5c f8 d4 00                    # 9f8a |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 9f8e |   mov SP, SP + 0x6
                               #      | _Z_call_106:
                               #      | _A_call_107:
e0 e0 24 aa                    # 9f92 |   push ${const__str__READY__endl}
5c f8 42 f2                    # 9f96 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9f9a |   mov SP, SP + 0x2
                               #      | _Z_call_107:
                               #      | _A_call_108:
e0 1c 52                       # 9f9e |   push 0x52
e0 1c 07                       # 9fa1 |   push 0x7
e0 1c 01                       # 9fa4 |   push 0x1
5c f8 b7 00                    # 9fa7 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 9fab |   mov SP, SP + 0x6
                               #      | _Z_call_108:
c6 e0 00 0a ff                 # 9faf |   inc [0xff0a], 0
                               #      | _A_loop_11:
                               #      | _BA_loop_11:
                               #      | _A_call_132:
5c f8 51 01                    # 9fb4 |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_132:
46 e0 0a ff                    # 9fb8 |   inc [0xff0a]
60 20 ff                       # 9fbc |   mov A, H
                               #      | _A_if_132:
ec fe 00 f8 0a 00              # 9fbf |   jne G, 0, ${_E_if_132}:rel + PC
58 f8 ef ff                    # 9fc5 |   jmp ${_BA_loop_11}:rel + PC
                               #      | _E_if_132:
                               #      | _C_if_132:
                               #      | _Z_if_132:
                               #      | _A_if_133:
ec 20 00 f8 16 00              # 9fc9 |   jne A, 0, ${_E_if_133}:rel + PC
                               #      | _A_call_133:
e0 e0 d2 aa                    # 9fcf |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 05 f2                    # 9fd3 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9fd7 |   mov SP, SP + 0x2
                               #      | _Z_call_133:
58 f8 d9 ff                    # 9fdb |   jmp ${_BA_loop_11}:rel + PC
                               #      | _E_if_133:
                               #      | _C_if_133:
                               #      | _Z_if_133:
60 40 21                       # 9fdf |   mov B, A*2
60 40 e8 b3 a9                 # 9fe2 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # 9fe7 |   push A
5e 40                          # 9fe9 |   call [B]
e4 20                          # 9feb |   pop A
                               #      | _BZ_loop_11:
58 f8 c7 ff                    # 9fed |   jmp ${_BA_loop_11}:rel + PC
                               #      | _C_loop_11:
                               #      | _Z_loop_11:
                               #      | _cleanup_fn_main:
e4 20                          # 9ff1 |   pop A
e4 40                          # 9ff3 |   pop B
dc                             # 9ff5 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_87:
f0 ff 1c f8 17 08 00           # 9ff6 |   jlt H, 0x17, ${_E_if_87}:rel + PC
dc                             # 9ffd |   ret
                               #      | _E_if_87:
                               #      | _C_if_87:
                               #      | _Z_if_87:
28 ff 1c 01                    # 9ffe |   shl H, 0x1
00 ff e0 95 a8                 # a002 |   add H, ${const__SYSCALL_MAP}
5a ff                          # a007 |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # a009 |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_quick_deinit_oled:
                               #      | _begin_fn_quick_deinit_oled:
1e e0 1c 32 ff 0f              # a00a |   setb [0xff32], 0xf
                               #      | _A_call_92:
e0 e0 ae 00                    # a010 |   push 0xae
5c f8 54 fc                    # a014 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # a018 |   mov SP, SP + 0x2
                               #      | _Z_call_92:
62 e0 00 32 ff                 # a01c |   mov [0xff32], 0
                               #      | _cleanup_fn_quick_deinit_oled:
dc                             # a021 |   ret
                               #      | _end_fn_quick_deinit_oled:
                               #      | 
                               #      | fn_draw_str_oled:
                               #      | _begin_fn_draw_str_oled:
e0 80                          # a022 |   push D
e0 60                          # a024 |   push C
e0 40                          # a026 |   push B
e0 20                          # a028 |   push A
61 60 bc 0a                    # a02a |   mov C, [SP + 0xa]
61 80 bc 0c                    # a02e |   mov D, [SP + 0xc]
61 20 bc 0e                    # a032 |   mov A, [SP + 0xe]
                               #      | _A_loop_10:
                               #      | _BA_loop_10:
65 40 20                       # a036 |   bmov B, [A]
e8 40 00 f8 1c 00              # a039 |   jeq B, 0, ${_C_loop_10}:rel + PC
                               #      | _A_call_102:
e0 40                          # a03f |   push B
e0 80                          # a041 |   push D
e0 60                          # a043 |   push C
5c f8 19 00                    # a045 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # a049 |   mov SP, SP + 0x6
                               #      | _Z_call_102:
44 20                          # a04d |   inc A
44 80                          # a04f |   inc D
                               #      | _BZ_loop_10:
58 f8 e5 ff                    # a051 |   jmp ${_BA_loop_10}:rel + PC
                               #      | _C_loop_10:
                               #      | _Z_loop_10:
                               #      | _cleanup_fn_draw_str_oled:
e4 20                          # a055 |   pop A
e4 40                          # a057 |   pop B
e4 60                          # a059 |   pop C
e4 80                          # a05b |   pop D
dc                             # a05d |   ret
                               #      | _end_fn_draw_str_oled:
                               #      | 
                               #      | fn_draw_char_oled:
                               #      | _begin_fn_draw_char_oled:
e0 80                          # a05e |   push D
e0 60                          # a060 |   push C
e0 40                          # a062 |   push B
e0 20                          # a064 |   push A
60 a0 bc e0                    # a066 |   mov SP, SP + -32
                               #      | _A_call_99:
e2 bc 2e                       # a06a |   push [SP + 0x2e]
e0 bc 02                       # a06d |   push SP + 0x2
5c f8 48 f5                    # a070 |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # a074 |   mov SP, SP + 0x4
                               #      | _Z_call_99:
ad 20 bc 1c 2a 01              # a078 |   and A, [SP + 0x2a], 0x1
ad 40 bc 1c 2c 07              # a07e |   and B, [SP + 0x2c], 0x7
28 40 1c 04                    # a084 |   shl B, 0x4
                               #      | _A_call_100:
e0 3d 01                       # a088 |   push A*2 + 0x1
e0 21                          # a08b |   push A*2
e0 1c 22                       # a08d |   push 0x22
e0 5c 0f                       # a090 |   push B + 0xf
e0 40                          # a093 |   push B
e0 1c 21                       # a095 |   push 0x21
e0 1c 06                       # a098 |   push 0x6
5c f8 28 fc                    # a09b |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # a09f |   mov SP, SP + 0xe
                               #      | _Z_call_100:
                               #      | _A_for_16:
60 20 00                       # a0a3 |   mov A, 0
                               #      | _BA_for_16:
fc 20 1c f8 10 52 00           # a0a6 |   jge A, 0x10, ${_C_for_16}:rel + PC
80 60 21 a0                    # a0ad |   add C, A*2, SP
                               #      | _A_for_17:
e0 20                          # a0b1 |   push A
60 40 00                       # a0b3 |   mov B, 0
                               #      | _BA_for_17:
fc 40 1c f8 10 38 00           # a0b6 |   jge B, 0x10, ${_C_for_17}:rel + PC
60 20 00                       # a0bd |   mov A, 0
                               #      | _A_for_18:
60 80 1c 07                    # a0c0 |   mov D, 0x7
                               #      | _BA_for_18:
e8 80 1c f8 ff 17 00           # a0c4 |   jeq D, -1, ${_C_for_18}:rel + PC
99 fe 8d 40                    # a0cb |   getb G, [D*2 + C], B
40 fe                          # a0cf |   bool G
b0 20 21 fe                    # a0d1 |   or A, A*2, G
                               #      | _BZ_for_18:
48 80                          # a0d5 |   dec D
58 f8 ed ff                    # a0d7 |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
                               #      | _Z_for_18:
                               #      | _A_call_101:
e0 20                          # a0db |   push A
e0 1c 01                       # a0dd |   push 0x1
5c f8 96 fb                    # a0e0 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # a0e4 |   mov SP, SP + 0x4
                               #      | _Z_call_101:
                               #      | _BZ_for_17:
44 40                          # a0e8 |   inc B
58 f8 cc ff                    # a0ea |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
e4 20                          # a0ee |   pop A
                               #      | _Z_for_17:
                               #      | _BZ_for_16:
60 20 3c 08                    # a0f0 |   mov A, A + 0x8
58 f8 b2 ff                    # a0f4 |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
                               #      | _Z_for_16:
                               #      | _cleanup_fn_draw_char_oled:
60 a0 bc 20                    # a0f8 |   mov SP, SP + 0x20
e4 20                          # a0fc |   pop A
e4 40                          # a0fe |   pop B
e4 60                          # a100 |   pop C
e4 80                          # a102 |   pop D
dc                             # a104 |   ret
                               #      | _end_fn_draw_char_oled:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # a105 |   push D
e0 60                          # a107 |   push C
e0 40                          # a109 |   push B
e0 20                          # a10b |   push A
60 a0 bc fe                    # a10d |   mov SP, SP + -2
62 a0 00                       # a111 |   mov [SP], 0
60 a0 bc de                    # a114 |   mov SP, SP + -34
62 a0 00                       # a118 |   mov [SP], 0
60 20 a0                       # a11b |   mov A, SP
                               #      | _A_loop_12:
                               #      | _BA_loop_12:
                               #      | _A_call_109:
5c f8 67 f1                    # a11e |   call ${fn_getc}:rel + PC
                               #      | _Z_call_109:
60 60 ff                       # a122 |   mov C, H
62 e0 60 00 ff                 # a125 |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # a12a |   jeq C, 0xa, ${_C_loop_12}:rel + PC
e8 60 1c f8 0d 29 00           # a131 |   jeq C, 0xd, ${_C_loop_12}:rel + PC
                               #      | _A_if_95:
f0 20 bc f8 1f 19 00           # a138 |   jlt A, SP + 0x1f, ${_E_if_95}:rel + PC
                               #      | _A_call_110:
e0 e0 2b aa                    # a13f |   push ${const__data_13}
5c f8 95 f0                    # a143 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a147 |   mov SP, SP + 0x2
                               #      | _Z_call_110:
e8 ff 00 f8 d3 00              # a14b |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_95:
                               #      | _C_if_95:
                               #      | _Z_if_95:
62 20 60                       # a151 |   mov [A], C
44 20                          # a154 |   inc A
                               #      | _BZ_loop_12:
58 f8 c8 ff                    # a156 |   jmp ${_BA_loop_12}:rel + PC
                               #      | _C_loop_12:
                               #      | _Z_loop_12:
                               #      | _A_call_111:
e0 1c 20                       # a15a |   push 0x20
e0 bc 02                       # a15d |   push SP + 0x2
5c f8 ba f2                    # a160 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a164 |   mov SP, SP + 0x4
                               #      | _Z_call_111:
60 60 ff                       # a168 |   mov C, H
                               #      | _A_if_97:
e8 60 00 f8 0f 00              # a16b |   jeq C, 0, ${_E_if_97}:rel + PC
66 60 00                       # a171 |   bmov [C], 0
44 60                          # a174 |   inc C
58 f8 08 00                    # a176 |   jmp ${_C_if_97}:rel + PC
                               #      | _E_if_97:
60 60 1c ff                    # a17a |   mov C, -1
                               #      | _C_if_97:
                               #      | _Z_if_97:
                               #      | _A_call_127:
e0 a0                          # a17e |   push SP
5c f8 b1 00                    # a180 |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # a184 |   mov SP, SP + 0x2
                               #      | _Z_call_127:
e8 ff 00 f8 9c 00              # a188 |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # a18e |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 e5 aa                 # a192 |   mov [${var__g_num_args}], 0
                               #      | _A_while_12:
                               #      | _BA_while_12:
fc 60 bc f8 20 7c 00           # a197 |   jge C, SP + 0x20, ${_C_while_12}:rel + PC
                               #      | _A_call_128:
e0 1c 20                       # a19e |   push 0x20
e0 60                          # a1a1 |   push C
5c f8 77 f2                    # a1a3 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a1a7 |   mov SP, SP + 0x4
                               #      | _Z_call_128:
60 80 ff                       # a1ab |   mov D, H
                               #      | _A_if_129:
e8 80 00 f8 0d 00              # a1ae |   jeq D, 0, ${_E_if_129}:rel + PC
66 80 00                       # a1b4 |   bmov [D], 0
58 f8 08 00                    # a1b7 |   jmp ${_C_if_129}:rel + PC
                               #      | _E_if_129:
60 80 1c fe                    # a1bb |   mov D, -2
                               #      | _C_if_129:
                               #      | _Z_if_129:
61 20 e0 e5 aa                 # a1bf |   mov A, [${var__g_num_args}]
                               #      | _A_if_130:
f0 20 1c f8 06 17 00           # a1c4 |   jlt A, 0x6, ${_E_if_130}:rel + PC
                               #      | _A_call_129:
e0 e0 a9 aa                    # a1cb |   push ${const__data_14}
5c f8 09 f0                    # a1cf |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a1d3 |   mov SP, SP + 0x2
                               #      | _Z_call_129:
58 f8 47 00                    # a1d7 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_130:
                               #      | _C_if_130:
                               #      | _Z_if_130:
                               #      | _A_call_130:
e0 60                          # a1db |   push C
5c f8 02 f1                    # a1dd |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a1e1 |   mov SP, SP + 0x2
                               #      | _Z_call_130:
                               #      | _A_if_131:
ec fe 00 f8 18 00              # a1e5 |   jne G, 0, ${_E_if_131}:rel + PC
                               #      | _A_call_131:
e0 20                          # a1eb |   push A
e0 e0 be aa                    # a1ed |   push ${const__data_15}
5c f8 19 ee                    # a1f1 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a1f5 |   mov SP, SP + 0x4
                               #      | _Z_call_131:
58 f8 25 00                    # a1f9 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_131:
                               #      | _C_if_131:
                               #      | _Z_if_131:
a8 40 20 1c 01                 # a1fd |   shl B, A, 0x1
62 e8 ff e8 aa                 # a202 |   mov [${var__g_args} + B], H
c6 e0 20 e5 aa                 # a207 |   inc [${var__g_num_args}], A
c4 60 80                       # a20c |   inc C, D
                               #      | _BZ_while_12:
58 f8 88 ff                    # a20f |   jmp ${_BA_while_12}:rel + PC
                               #      | _C_while_12:
                               #      | _Z_while_12:
c4 fe 00                       # a213 |   inc G, 0
61 ff bc 22                    # a216 |   mov H, [SP + 0x22]
58 f8 0a 00                    # a21a |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # a21e |   mov G, 0
60 ff 00                       # a221 |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # a224 |   mov SP, SP + 0x24
e4 20                          # a228 |   pop A
e4 40                          # a22a |   pop B
e4 60                          # a22c |   pop C
e4 80                          # a22e |   pop D
dc                             # a230 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # a231 |   push A
61 20 bc 04                    # a233 |   mov A, [SP + 0x4]
                               #      | _A_call_112:
e0 e0 3d aa                    # a237 |   push ${const__str__PING}
e0 20                          # a23b |   push A
5c f8 8b f1                    # a23d |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a241 |   mov SP, SP + 0x4
                               #      | _Z_call_112:
                               #      | _A_if_99:
ec ff 00 f8 0d 00              # a245 |   jne H, 0, ${_E_if_99}:rel + PC
c4 ff 00                       # a24b |   inc H, 0
58 f8 8f 01                    # a24e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_99:
                               #      | _C_if_99:
                               #      | _Z_if_99:
                               #      | _A_call_113:
e0 e0 42 aa                    # a252 |   push ${const__str__READ}
e0 20                          # a256 |   push A
5c f8 70 f1                    # a258 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a25c |   mov SP, SP + 0x4
                               #      | _Z_call_113:
                               #      | _A_if_101:
ec ff 00 f8 0e 00              # a260 |   jne H, 0, ${_E_if_101}:rel + PC
60 ff 1c 02                    # a266 |   mov H, 0x2
58 f8 73 01                    # a26a |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_101:
                               #      | _C_if_101:
                               #      | _Z_if_101:
                               #      | _A_call_114:
e0 e0 47 aa                    # a26e |   push ${const__str__WRITE}
e0 20                          # a272 |   push A
5c f8 54 f1                    # a274 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a278 |   mov SP, SP + 0x4
                               #      | _Z_call_114:
                               #      | _A_if_103:
ec ff 00 f8 0e 00              # a27c |   jne H, 0, ${_E_if_103}:rel + PC
60 ff 1c 03                    # a282 |   mov H, 0x3
58 f8 57 01                    # a286 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_103:
                               #      | _C_if_103:
                               #      | _Z_if_103:
                               #      | _A_call_115:
e0 e0 4d aa                    # a28a |   push ${const__str__READB}
e0 20                          # a28e |   push A
5c f8 38 f1                    # a290 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a294 |   mov SP, SP + 0x4
                               #      | _Z_call_115:
                               #      | _A_if_105:
ec ff 00 f8 0e 00              # a298 |   jne H, 0, ${_E_if_105}:rel + PC
60 ff 1c 04                    # a29e |   mov H, 0x4
58 f8 3b 01                    # a2a2 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_105:
                               #      | _C_if_105:
                               #      | _Z_if_105:
                               #      | _A_call_116:
e0 e0 53 aa                    # a2a6 |   push ${const__str__WRITEB}
e0 20                          # a2aa |   push A
5c f8 1c f1                    # a2ac |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a2b0 |   mov SP, SP + 0x4
                               #      | _Z_call_116:
                               #      | _A_if_107:
ec ff 00 f8 0e 00              # a2b4 |   jne H, 0, ${_E_if_107}:rel + PC
60 ff 1c 05                    # a2ba |   mov H, 0x5
58 f8 1f 01                    # a2be |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_107:
                               #      | _C_if_107:
                               #      | _Z_if_107:
                               #      | _A_call_117:
e0 e0 5a aa                    # a2c2 |   push ${const__str__JMP}
e0 20                          # a2c6 |   push A
5c f8 00 f1                    # a2c8 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a2cc |   mov SP, SP + 0x4
                               #      | _Z_call_117:
                               #      | _A_if_109:
ec ff 00 f8 0e 00              # a2d0 |   jne H, 0, ${_E_if_109}:rel + PC
60 ff 1c 06                    # a2d6 |   mov H, 0x6
58 f8 03 01                    # a2da |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_109:
                               #      | _C_if_109:
                               #      | _Z_if_109:
                               #      | _A_call_118:
e0 e0 5e aa                    # a2de |   push ${const__str__JMP_PERSIST}
e0 20                          # a2e2 |   push A
5c f8 e4 f0                    # a2e4 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a2e8 |   mov SP, SP + 0x4
                               #      | _Z_call_118:
                               #      | _A_if_111:
ec ff 00 f8 0e 00              # a2ec |   jne H, 0, ${_E_if_111}:rel + PC
60 ff 1c 07                    # a2f2 |   mov H, 0x7
58 f8 e7 00                    # a2f6 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_111:
                               #      | _C_if_111:
                               #      | _Z_if_111:
                               #      | _A_call_119:
e0 e0 6a aa                    # a2fa |   push ${const__str__INIT_SD}
e0 20                          # a2fe |   push A
5c f8 c8 f0                    # a300 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a304 |   mov SP, SP + 0x4
                               #      | _Z_call_119:
                               #      | _A_if_113:
ec ff 00 f8 0e 00              # a308 |   jne H, 0, ${_E_if_113}:rel + PC
60 ff 1c 08                    # a30e |   mov H, 0x8
58 f8 cb 00                    # a312 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_113:
                               #      | _C_if_113:
                               #      | _Z_if_113:
                               #      | _A_call_120:
e0 e0 72 aa                    # a316 |   push ${const__str__READ_SD}
e0 20                          # a31a |   push A
5c f8 ac f0                    # a31c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a320 |   mov SP, SP + 0x4
                               #      | _Z_call_120:
                               #      | _A_if_115:
ec ff 00 f8 0e 00              # a324 |   jne H, 0, ${_E_if_115}:rel + PC
60 ff 1c 09                    # a32a |   mov H, 0x9
58 f8 af 00                    # a32e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_115:
                               #      | _C_if_115:
                               #      | _Z_if_115:
                               #      | _A_call_121:
e0 e0 7a aa                    # a332 |   push ${const__str__INIT_OLED}
e0 20                          # a336 |   push A
5c f8 90 f0                    # a338 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a33c |   mov SP, SP + 0x4
                               #      | _Z_call_121:
                               #      | _A_if_117:
ec ff 00 f8 0e 00              # a340 |   jne H, 0, ${_E_if_117}:rel + PC
60 ff 1c 0a                    # a346 |   mov H, 0xa
58 f8 93 00                    # a34a |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_117:
                               #      | _C_if_117:
                               #      | _Z_if_117:
                               #      | _A_call_122:
e0 e0 84 aa                    # a34e |   push ${const__str__READW}
e0 20                          # a352 |   push A
5c f8 74 f0                    # a354 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a358 |   mov SP, SP + 0x4
                               #      | _Z_call_122:
                               #      | _A_if_119:
ec ff 00 f8 0e 00              # a35c |   jne H, 0, ${_E_if_119}:rel + PC
60 ff 1c 0b                    # a362 |   mov H, 0xb
58 f8 77 00                    # a366 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_119:
                               #      | _C_if_119:
                               #      | _Z_if_119:
                               #      | _A_call_123:
e0 e0 8a aa                    # a36a |   push ${const__str__DEINIT_OLED}
e0 20                          # a36e |   push A
5c f8 58 f0                    # a370 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a374 |   mov SP, SP + 0x4
                               #      | _Z_call_123:
                               #      | _A_if_121:
ec ff 00 f8 0e 00              # a378 |   jne H, 0, ${_E_if_121}:rel + PC
60 ff 1c 0c                    # a37e |   mov H, 0xc
58 f8 5b 00                    # a382 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_121:
                               #      | _C_if_121:
                               #      | _Z_if_121:
                               #      | _A_call_124:
e0 e0 96 aa                    # a386 |   push ${const__str__WRITE_SD}
e0 20                          # a38a |   push A
5c f8 3c f0                    # a38c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a390 |   mov SP, SP + 0x4
                               #      | _Z_call_124:
                               #      | _A_if_123:
ec ff 00 f8 0e 00              # a394 |   jne H, 0, ${_E_if_123}:rel + PC
60 ff 1c 0d                    # a39a |   mov H, 0xd
58 f8 3f 00                    # a39e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_123:
                               #      | _C_if_123:
                               #      | _Z_if_123:
                               #      | _A_call_125:
e0 e0 9f aa                    # a3a2 |   push ${const__str__MMAP}
e0 20                          # a3a6 |   push A
5c f8 20 f0                    # a3a8 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a3ac |   mov SP, SP + 0x4
                               #      | _Z_call_125:
                               #      | _A_if_125:
ec ff 00 f8 0e 00              # a3b0 |   jne H, 0, ${_E_if_125}:rel + PC
60 ff 1c 0e                    # a3b6 |   mov H, 0xe
58 f8 23 00                    # a3ba |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_125:
                               #      | _C_if_125:
                               #      | _Z_if_125:
                               #      | _A_call_126:
e0 e0 a4 aa                    # a3be |   push ${const__str__UMAP}
e0 20                          # a3c2 |   push A
5c f8 04 f0                    # a3c4 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a3c8 |   mov SP, SP + 0x4
                               #      | _Z_call_126:
                               #      | _A_if_127:
ec ff 00 f8 0e 00              # a3cc |   jne H, 0, ${_E_if_127}:rel + PC
60 ff 1c 0f                    # a3d2 |   mov H, 0xf
58 f8 07 00                    # a3d6 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_127:
                               #      | _C_if_127:
                               #      | _Z_if_127:
60 ff 00                       # a3da |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # a3dd |   pop A
dc                             # a3df |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # a3e0 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # a7d5 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
0a 90 73 91 85 92 8b 91 fa 91 50 92 37 92 a4 92 df 92 2f 93 68 93 a1 93 c8 93 1a 94 39 94 40 94 4b 94 d8 91 e6 94 b8 95 fa 95 19 97 d5 97 # a895 |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12, $fn_read_sd, $fn_write_sd, $fn_init_sd]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # a8c3 |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # a8e7 |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # a8ed |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # a8fc |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # a909 |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # a918 |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # a928 |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # a937 |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # a942 |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__str__TIMEOUT__endl:
54 49 4d 45 4f 55 54 0a 00     # a954 |   .data str:"TIMEOUT\n"
                               #      | const__str__INIT_OK__endl:
49 4e 49 54 5f 4f 4b 0a 00     # a95d |   .data str:"INIT_OK\n"
                               #      | const__data_7:
52 45 41 44 5f 53 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # a966 |   .data str:"READ_SD_OK %x %x\n"
                               #      | const__str__DONE__endl:
44 4f 4e 45 0a 00              # a978 |   .data str:"DONE\n"
                               #      | const__data_8:
57 52 49 54 45 5f 53 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # a97e |   .data str:"WRITE_SD_OK %x %x\n"
                               #      | const__data_9:
4d 4d 41 50 5f 4f 4b 20 25 78 20 25 78 20 25 78 20 25 78 20 25 78 0a 00 # a991 |   .data str:"MMAP_OK %x %x %x %x %x\n"
                               #      | const__data_10:
55 4d 41 50 5f 4f 4b 20 25 78 0a 00 # a9a9 |   .data str:"UMAP_OK %x\n"
                               #      | const__HANDLER_MAP:
55 98 8f 98 a3 99 8f 98 a3 99 95 9a 95 9a fe 9a 25 9b c4 9b 8f 98 3b 9d 73 9d 4b 9e aa 9e # a9b5 |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp, $fn_handle_init_sd, $fn_handle_read_sd, $fn_handle_init_oled, $fn_handle_read, $fn_handle_deinit_oled, $fn_handle_write_sd, $fn_handle_mmap, $fn_handle_umap]
                               #      | const__data_11:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 32 2e 30 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 33 2e 31 0a 00 # a9d3 |   .data str:"Weeekly3006 - Hardware v2.0 - Bootloader v3.1\n"
                               #      | const__str__FORCED_BOOTLOADER__endl:
46 4f 52 43 45 44 5f 42 4f 4f 54 4c 4f 41 44 45 52 0a 00 # aa02 |   .data str:"FORCED_BOOTLOADER\n"
                               #      | const__str__Weeekly:
57 65 65 65 6b 6c 79 00        # aa15 |   .data str:"Weeekly"
                               #      | const__data_12:
33 30 30 36 20 31 00           # aa1d |   .data str:"3006 1"
                               #      | const__str__READY__endl:
52 45 41 44 59 0a 00           # aa24 |   .data str:"READY\n"
                               #      | const__data_13:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # aa2b |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # aa3d |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # aa42 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # aa47 |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # aa4d |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # aa53 |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # aa5a |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # aa5e |   .data str:"JMP_PERSIST"
                               #      | const__str__INIT_SD:
49 4e 49 54 5f 53 44 00        # aa6a |   .data str:"INIT_SD"
                               #      | const__str__READ_SD:
52 45 41 44 5f 53 44 00        # aa72 |   .data str:"READ_SD"
                               #      | const__str__INIT_OLED:
49 4e 49 54 5f 4f 4c 45 44 00  # aa7a |   .data str:"INIT_OLED"
                               #      | const__str__READW:
52 45 41 44 57 00              # aa84 |   .data str:"READW"
                               #      | const__str__DEINIT_OLED:
44 45 49 4e 49 54 5f 4f 4c 45 44 00 # aa8a |   .data str:"DEINIT_OLED"
                               #      | const__str__WRITE_SD:
57 52 49 54 45 5f 53 44 00     # aa96 |   .data str:"WRITE_SD"
                               #      | const__str__MMAP:
4d 4d 41 50 00                 # aa9f |   .data str:"MMAP"
                               #      | const__str__UMAP:
55 4d 41 50 00                 # aaa4 |   .data str:"UMAP"
                               #      | const__data_14:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 36 0a 00 # aaa9 |   .data str:"TOO_MANY_ARGS max=6\n"
                               #      | const__data_15:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # aabe |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # aad2 |   .data str:"UNKNOWN_COMMAND\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xaae3
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # aae3 |   .bss size:2 align:1
                               #      | var__g_num_args:
                               # aae5 |   .bss size:2 align:1
                               # aae7 |   .align dummy_size:1 align:2
                               #      | var__g_args:
                               # aae8 |   .bss size:14 align:2
                               #      | SECTION_END_static_data:
                               #      | 
