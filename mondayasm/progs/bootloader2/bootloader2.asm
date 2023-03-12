                               #      | .config CODE_OFFSET 0x9000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 fe 8f                 # 9000 |   mov SP, 0x8ffe
                               #      | _A_call_138:
5c f8 02 10                    # 9005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_138:
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
63 e0 bc 37 ab 02              # 9439 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 943f |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
61 ff e0 37 ab                 # 9440 |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # 9445 |   shl G, H, 0x7
34 ff fe                       # 944a |   xor H, G
a0 fe ff 1c 09                 # 944d |   shr G, H, 0x9
34 ff fe                       # 9452 |   xor H, G
a8 fe ff 1c 08                 # 9455 |   shl G, H, 0x8
34 ff fe                       # 945a |   xor H, G
62 e0 ff 37 ab                 # 945d |   mov [${var__rand__state}], H
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
61 ff e0 14 ff                 # 94b7 |   mov H, [0xff14]
                               #      | _A_if_32:
f4 ff 80 f8 0a 00              # 94bc |   jle H, D, ${_E_if_32}:rel + PC
58 f8 33 00                    # 94c2 |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_32:
ec ff 80 f8 2b 00              # 94c6 |   jne H, D, ${_E2_if_32}:rel + PC
61 ff e0 12 ff                 # 94cc |   mov H, [0xff12]
                               #      | _A_if_33:
f4 ff 60 f8 0a 00              # 94d1 |   jle H, C, ${_E_if_33}:rel + PC
58 f8 1e 00                    # 94d7 |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_33:
ec ff 60 f8 16 00              # 94db |   jne H, C, ${_E2_if_33}:rel + PC
fa e0 40 f8 10 ff 14 00        # 94e1 |   jgt [0xff10], B, ${_C_loop_7}:rel + PC
                               #      | _A_if_35:
e8 20 00 f8 08 00              # 94e9 |   jeq A, 0, ${_E_if_35}:rel + PC
5c 20                          # 94ef |   call A
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
58 f8 c6 ff                    # 94f1 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 94f5 |   pop A
e4 40                          # 94f7 |   pop B
e4 60                          # 94f9 |   pop C
e4 80                          # 94fb |   pop D
dc                             # 94fd |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # 94fe |   push D
e0 60                          # 9500 |   push C
e0 40                          # 9502 |   push B
e0 20                          # 9504 |   push A
61 fc bc 0a                    # 9506 |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # 950a |   shl F, [SP + 0xe], 0x1
00 fd fc                       # 9510 |   add F, E
61 fe bc 0c                    # 9513 |   mov G, [SP + 0xc]
61 40 fe                       # 9517 |   mov B, [G]
60 60 1c 07                    # 951a |   mov C, 0x7
60 20 00                       # 951e |   mov A, 0
60 a0 bc fe                    # 9521 |   mov SP, SP + -2
                               #      | _A_for_5:
                               #      | _BA_for_5:
fc fc fd f8 9e 00              # 9525 |   jge E, F, ${_C_for_5}:rel + PC
                               #      |   # decode one line
60 20 00                       # 952b |   mov A, 0
62 a0 1c ff                    # 952e |   mov [SP], -1
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
                               #      | _A_if_36:
ec 60 1c f8 ff 10 00           # 9532 |   jne C, -1, ${_E_if_36}:rel + PC
44 fe                          # 9539 |   inc G
61 40 fe                       # 953b |   mov B, [G]
60 60 1c 07                    # 953e |   mov C, 0x7
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
98 80 40 60                    # 9542 |   getb D, B, C
48 60                          # 9546 |   dec C
40 80                          # 9548 |   bool D
b0 20 21 80                    # 954a |   or A, A*2, D
4a a0                          # 954e |   dec [SP]
                               #      | _A_if_37:
ee a0 00 f8 1b 00              # 9550 |   jne [SP], 0, ${_E_if_37}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # 9556 |   mov H, A
b9 20 bc 12                    # 9559 |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # 955d |   shr A, -1, A + 0x10
ae fc ff 20                    # 9563 |   and [E], H, A
58 f8 54 00                    # 9567 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_37:
ec 20 00 f8 20 00              # 956b |   jne A, 0, ${_E2_if_37}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # 9571 |   sub H, E, 0x2
                               #      | _A_if_38:
f1 ff bc f8 0c 0e 00           # 9576 |   jlt H, [SP + 0xc], ${_E_if_38}:rel + PC
63 fc ff                       # 957d |   mov [E], [H]
58 f8 07 00                    # 9580 |   jmp ${_C_if_38}:rel + PC
                               #      | _E_if_38:
62 fc 00                       # 9584 |   mov [E], 0
                               #      | _C_if_38:
                               #      | _Z_if_38:
58 f8 34 00                    # 9587 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E2_if_37:
ec 20 1c f8 02 13 00           # 958b |   jne A, 0x2, ${_E3_if_37}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # 9592 |   sub H, E, 0x4
63 fc ff                       # 9597 |   mov [E], [H]
58 f8 21 00                    # 959a |   jmp ${_C_loop_8}:rel + PC
                               #      | _E3_if_37:
ec 20 1c f8 06 0e 00           # 959e |   jne A, 0x6, ${_E4_if_37}:rel + PC
                               #      |   # all zeros
62 fc 00                       # 95a5 |   mov [E], 0
58 f8 13 00                    # 95a8 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E4_if_37:
ec 20 1c f8 07 0b 00           # 95ac |   jne A, 0x7, ${_E5_if_37}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # 95b3 |   mov [SP], [SP + 0x12]
                               #      | _E5_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _BZ_loop_8:
58 f8 7b ff                    # 95b7 |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _BZ_for_5:
00 fc 1c 02                    # 95bb |   add E, 0x2
58 f8 66 ff                    # 95bf |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # 95c3 |   mov SP, SP + 0x2
e4 20                          # 95c7 |   pop A
e4 40                          # 95c9 |   pop B
e4 60                          # 95cb |   pop C
e4 80                          # 95cd |   pop D
dc                             # 95cf |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # 95d0 |   push B
e0 20                          # 95d2 |   push A
61 20 bc 08                    # 95d4 |   mov A, [SP + 0x8]
60 40 1c 1f                    # 95d8 |   mov B, 0x1f
                               #      | _A_scope_7:
                               #      | _B_scope_7:
f0 20 1c f8 20 13 00           # 95dc |   jlt A, 0x20, ${_C_scope_7}:rel + PC
fc 20 e0 f8 80 00 0c 00        # 95e3 |   jge A, 0x80, ${_C_scope_7}:rel + PC
60 40 3c e0                    # 95eb |   mov B, A + -32
                               #      | _C_scope_7:
                               #      | _Z_scope_7:
28 40 1c 01                    # 95ef |   shl B, 0x1
61 40 e8 1d a8                 # 95f3 |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_20:
e0 1c 0c                       # 95f8 |   push 0xc
e0 1c 10                       # 95fb |   push 0x10
e0 e8 28 a4                    # 95fe |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # 9602 |   push [SP + 0xc]
5c f8 f9 fe                    # 9605 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # 9609 |   mov SP, SP + 0x8
                               #      | _Z_call_20:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # 960d |   pop A
e4 40                          # 960f |   pop B
dc                             # 9611 |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_read_sd:
                               #      | _begin_fn_read_sd:
e0 80                          # 9612 |   push D
e0 60                          # 9614 |   push C
e0 40                          # 9616 |   push B
e0 20                          # 9618 |   push A
                               #      | _A_call_21:
e0 fc                          # 961a |   push E
e0 fd                          # 961c |   push F
e2 bc 14                       # 961e |   push [SP + 0x14]
e2 bc 14                       # 9621 |   push [SP + 0x14]
e0 00                          # 9624 |   push 0
5c f8 ab 00                    # 9626 |   call ${fn_send_sd_cmd}:rel + PC
60 a0 bc 06                    # 962a |   mov SP, SP + 0x6
e4 fd                          # 962e |   pop F
e4 fc                          # 9630 |   pop E
                               #      | _Z_call_21:
e8 fe 00 f8 90 00              # 9632 |   jeq G, 0, ${_L_fn_read_sd_1}:rel + PC
61 fc bc 0a                    # 9638 |   mov E, [SP + 0xa]
60 fd 00                       # 963c |   mov F, 0
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc fd e0 f8 00 02 75 00        # 963f |   jge F, 0x200, ${_C_while_5}:rel + PC
44 80                          # 9647 |   inc D
e8 80 1c f8 ff 79 00           # 9649 |   jeq D, -1, ${_L_fn_read_sd_1}:rel + PC
61 60 e0 26 ff                 # 9650 |   mov C, [0xff26]
98 20 60 1c 09                 # 9655 |   getb A, C, 0x9
e8 20 00 f8 5a 00              # 965a |   jeq A, 0, ${_C_while_5}:rel + PC
98 20 60 1c 08                 # 9660 |   getb A, C, 0x8
e8 20 00 f8 da ff              # 9665 |   jeq A, 0, ${_BA_while_5}:rel + PC
1e e0 1c 24 ff 08              # 966b |   setb [0xff24], 0x8
                               #      | _A_for_7:
60 80 00                       # 9671 |   mov D, 0
                               #      | _BA_for_7:
fc 80 1c f8 ff 1a 00           # 9674 |   jge D, -1, ${_C_for_7}:rel + PC
99 40 e0 1c 26 ff 08           # 967b |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # 9682 |   jeq B, 0, ${_C_for_7}:rel + PC
                               #      | _BZ_for_7:
44 80                          # 9688 |   inc D
58 f8 ea ff                    # 968a |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
ec 40 00 f8 34 00              # 968e |   jne B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 18              # 9694 |   setb [0xff24], 0x18
2c 60 e0 ff 00                 # 969a |   and C, 0xff
                               #      | _A_if_50:
fd fd bc f8 0c 0c 00           # 969f |   jge F, [SP + 0xc], ${_E_if_50}:rel + PC
62 fc 60                       # 96a6 |   mov [E], C
44 fc                          # 96a9 |   inc E
                               #      | _E_if_50:
                               #      | _C_if_50:
                               #      | _Z_if_50:
44 fd                          # 96ab |   inc F
60 80 00                       # 96ad |   mov D, 0
                               #      | _BZ_while_5:
58 f8 8f ff                    # 96b0 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
c4 fe 00                       # 96b4 |   inc G, 0
b9 ff bc 0a                    # 96b7 |   neg H, [SP + 0xa]
00 ff fc                       # 96bb |   add H, E
58 f8 0a 00                    # 96be |   jmp ${_cleanup_fn_read_sd}:rel + PC
                               #      | _L_fn_read_sd_1:
60 fe 00                       # 96c2 |   mov G, 0
60 ff 00                       # 96c5 |   mov H, 0
                               #      | _cleanup_fn_read_sd:
e4 20                          # 96c8 |   pop A
e4 40                          # 96ca |   pop B
e4 60                          # 96cc |   pop C
e4 80                          # 96ce |   pop D
dc                             # 96d0 |   ret
                               #      | _end_fn_read_sd:
                               #      | 
                               #      | fn_send_sd_cmd:
                               #      | _begin_fn_send_sd_cmd:
e0 80                          # 96d1 |   push D
e0 40                          # 96d3 |   push B
e0 20                          # 96d5 |   push A
60 20 1c 09                    # 96d7 |   mov A, 0x9
                               #      | _A_if_41:
ee bc 1c f8 08 01 0c 00        # 96db |   jne [SP + 0x8], 0x1, ${_E_if_41}:rel + PC
60 20 1c 0a                    # 96e3 |   mov A, 0xa
                               #      | _E_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
63 e0 bc 22 ff 0a              # 96e7 |   mov [0xff22], [SP + 0xa]
63 e0 bc 20 ff 0c              # 96ed |   mov [0xff20], [SP + 0xc]
1e e0 20 24 ff                 # 96f3 |   setb [0xff24], A
                               #      | _A_for_6:
60 80 00                       # 96f8 |   mov D, 0
                               #      | _BA_for_6:
fc 80 1c f8 ff 1a 00           # 96fb |   jge D, -1, ${_C_for_6}:rel + PC
99 40 e0 1c 26 ff 09           # 9702 |   getb B, [0xff26], 0x9
ec 40 00 f8 0c 00              # 9709 |   jne B, 0, ${_C_for_6}:rel + PC
                               #      | _BZ_for_6:
44 80                          # 970f |   inc D
58 f8 ea ff                    # 9711 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
60 20 3c 10                    # 9715 |   mov A, A + 0x10
1e e0 20 24 ff                 # 9719 |   setb [0xff24], A
c4 fe 00                       # 971e |   inc G, 0
                               #      | _A_if_43:
ec 40 00 f8 09 00              # 9721 |   jne B, 0, ${_E_if_43}:rel + PC
60 fe 00                       # 9727 |   mov G, 0
                               #      | _E_if_43:
                               #      | _C_if_43:
                               #      | _Z_if_43:
                               #      | _cleanup_fn_send_sd_cmd:
e4 20                          # 972a |   pop A
e4 40                          # 972c |   pop B
e4 80                          # 972e |   pop D
dc                             # 9730 |   ret
                               #      | _end_fn_send_sd_cmd:
                               #      | 
                               #      | fn_write_sd:
                               #      | _begin_fn_write_sd:
e0 80                          # 9731 |   push D
e0 60                          # 9733 |   push C
e0 40                          # 9735 |   push B
e0 20                          # 9737 |   push A
                               #      | _A_call_22:
e0 fc                          # 9739 |   push E
e0 fd                          # 973b |   push F
e2 bc 14                       # 973d |   push [SP + 0x14]
e2 bc 14                       # 9740 |   push [SP + 0x14]
e0 1c 01                       # 9743 |   push 0x1
5c f8 8b ff                    # 9746 |   call ${fn_send_sd_cmd}:rel + PC
60 a0 bc 06                    # 974a |   mov SP, SP + 0x6
e4 fd                          # 974e |   pop F
e4 fc                          # 9750 |   pop E
                               #      | _Z_call_22:
e8 fe 00 f8 8f 00              # 9752 |   jeq G, 0, ${_L_fn_write_sd_1}:rel + PC
61 fc bc 0a                    # 9758 |   mov E, [SP + 0xa]
60 fd 00                       # 975c |   mov F, 0
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc fd e0 f8 00 02 7b 00        # 975f |   jge F, 0x200, ${_C_while_6}:rel + PC
44 80                          # 9767 |   inc D
e8 80 1c f8 ff 78 00           # 9769 |   jeq D, -1, ${_L_fn_write_sd_1}:rel + PC
61 60 e0 26 ff                 # 9770 |   mov C, [0xff26]
98 20 60 1c 09                 # 9775 |   getb A, C, 0x9
e8 20 00 f8 60 00              # 977a |   jeq A, 0, ${_C_while_6}:rel + PC
98 20 60 1c 08                 # 9780 |   getb A, C, 0x8
e8 20 00 f8 da ff              # 9785 |   jeq A, 0, ${_BA_while_6}:rel + PC
60 60 00                       # 978b |   mov C, 0
                               #      | _A_if_55:
fd fd bc f8 0c 0c 00           # 978e |   jge F, [SP + 0xc], ${_E_if_55}:rel + PC
65 60 fc                       # 9795 |   bmov C, [E]
44 fc                          # 9798 |   inc E
                               #      | _E_if_55:
                               #      | _C_if_55:
                               #      | _Z_if_55:
ad 20 e0 e0 24 ff 00 fe        # 979a |   and A, [0xff24], 0xfe00
9e e0 2c 1c 24 ff 08           # 97a2 |   setb [0xff24], A + C, 0x8
                               #      | _A_for_8:
60 80 00                       # 97a9 |   mov D, 0
                               #      | _BA_for_8:
fc 80 1c f8 ff 1a 00           # 97ac |   jge D, -1, ${_C_for_8}:rel + PC
99 40 e0 1c 26 ff 08           # 97b3 |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # 97ba |   jeq B, 0, ${_C_for_8}:rel + PC
                               #      | _BZ_for_8:
44 80                          # 97c0 |   inc D
58 f8 ea ff                    # 97c2 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
ec 40 00 f8 1b 00              # 97c6 |   jne B, 0, ${_L_fn_write_sd_1}:rel + PC
62 e0 20 24 ff                 # 97cc |   mov [0xff24], A
44 fd                          # 97d1 |   inc F
60 80 00                       # 97d3 |   mov D, 0
                               #      | _BZ_while_6:
58 f8 89 ff                    # 97d6 |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
c4 fe 00                       # 97da |   inc G, 0
58 f8 07 00                    # 97dd |   jmp ${_cleanup_fn_write_sd}:rel + PC
                               #      | _L_fn_write_sd_1:
60 fe 00                       # 97e1 |   mov G, 0
                               #      | _cleanup_fn_write_sd:
e4 20                          # 97e4 |   pop A
e4 40                          # 97e6 |   pop B
e4 60                          # 97e8 |   pop C
e4 80                          # 97ea |   pop D
dc                             # 97ec |   ret
                               #      | _end_fn_write_sd:
                               #      | 
                               #      | fn_init_sd:
                               #      | _begin_fn_init_sd:
                               #      | _A_call_24:
5c f8 09 00                    # 97ed |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_24:
                               #      | _A_call_25:
5c f8 30 00                    # 97f1 |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_25:
                               #      | _cleanup_fn_init_sd:
dc                             # 97f5 |   ret
                               #      | _end_fn_init_sd:
                               #      | 
                               #      | fn_init_sd_head:
                               #      | _begin_fn_init_sd_head:
1e e0 1c 24 ff 0c              # 97f6 |   setb [0xff24], 0xc
1e e0 1c 24 ff 1f              # 97fc |   setb [0xff24], 0x1f
                               #      | _A_call_23:
e0 00                          # 9802 |   push 0
e0 e0 60 ea                    # 9804 |   push 0xea60
e0 00                          # 9808 |   push 0
e0 00                          # 980a |   push 0
5c f8 57 fc                    # 980c |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 9810 |   mov SP, SP + 0x8
                               #      | _Z_call_23:
1e e0 1c 24 ff 0f              # 9814 |   setb [0xff24], 0xf
1e e0 1c 24 ff 1c              # 981a |   setb [0xff24], 0x1c
                               #      | _cleanup_fn_init_sd_head:
dc                             # 9820 |   ret
                               #      | _end_fn_init_sd_head:
                               #      | 
                               #      | fn_init_sd_tail:
                               #      | _begin_fn_init_sd_tail:
e0 60                          # 9821 |   push C
e0 40                          # 9823 |   push B
e0 20                          # 9825 |   push A
                               #      | _A_for_9:
60 60 00                       # 9827 |   mov C, 0
                               #      | _BA_for_9:
fc 60 1c f8 0a 30 00           # 982a |   jge C, 0xa, ${_C_for_9}:rel + PC
                               #      | _A_for_10:
60 20 00                       # 9831 |   mov A, 0
                               #      | _BA_for_10:
fc 20 1c f8 ff 1a 00           # 9834 |   jge A, -1, ${_C_for_10}:rel + PC
99 40 e0 1c 26 ff 09           # 983b |   getb B, [0xff26], 0x9
e8 40 00 f8 0c 00              # 9842 |   jeq B, 0, ${_C_for_10}:rel + PC
                               #      | _BZ_for_10:
44 20                          # 9848 |   inc A
58 f8 ea ff                    # 984a |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
e8 40 00 f8 0c 00              # 984e |   jeq B, 0, ${_C_for_9}:rel + PC
                               #      | _BZ_for_9:
44 60                          # 9854 |   inc C
58 f8 d4 ff                    # 9856 |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
c4 fe 00                       # 985a |   inc G, 0
                               #      | _A_if_60:
e8 40 00 f8 09 00              # 985d |   jeq B, 0, ${_E_if_60}:rel + PC
60 fe 00                       # 9863 |   mov G, 0
                               #      | _E_if_60:
                               #      | _C_if_60:
                               #      | _Z_if_60:
                               #      | _cleanup_fn_init_sd_tail:
e4 20                          # 9866 |   pop A
e4 40                          # 9868 |   pop B
e4 60                          # 986a |   pop C
dc                             # 986c |   ret
                               #      | _end_fn_init_sd_tail:
                               #      | 
                               #      | fn_init_oled:
                               #      | _begin_fn_init_oled:
e0 80                          # 986d |   push D
60 80 e0 32 ff                 # 986f |   mov D, 0xff32
62 80 00                       # 9874 |   mov [D], 0
1e 80 1c 0f                    # 9877 |   setb [D], 0xf
                               #      | _A_call_27:
5c f8 72 00                    # 987b |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_27:
                               #      | _A_call_29:
e0 e0 ae 00                    # 987f |   push 0xae
5c f8 7d 00                    # 9883 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9887 |   mov SP, SP + 0x2
                               #      | _Z_call_29:
1e 80 1c 0d                    # 988b |   setb [D], 0xd
                               #      | _A_call_30:
5c f8 5e 00                    # 988f |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_30:
1e 80 1c 1d                    # 9893 |   setb [D], 0x1d
                               #      | _A_call_31:
5c f8 56 00                    # 9897 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_31:
                               #      | _A_call_33:
e0 e0 f1 00                    # 989b |   push 0xf1
e0 e0 d9 00                    # 989f |   push 0xd9
e0 1c 14                       # 98a3 |   push 0x14
e0 e0 8d 00                    # 98a6 |   push 0x8d
e0 1c 04                       # 98aa |   push 0x4
5c f8 ae 00                    # 98ad |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0a                    # 98b1 |   mov SP, SP + 0xa
                               #      | _Z_call_33:
1e 80 1c 0e                    # 98b5 |   setb [D], 0xe
                               #      | _A_call_34:
5c f8 34 00                    # 98b9 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_34:
                               #      | _A_call_35:
e0 00                          # 98bd |   push 0
e0 1c 20                       # 98bf |   push 0x20
e0 e0 af 00                    # 98c2 |   push 0xaf
e0 00                          # 98c6 |   push 0
e0 e0 da 00                    # 98c8 |   push 0xda
e0 e0 c0 00                    # 98cc |   push 0xc0
e0 e0 a0 00                    # 98d0 |   push 0xa0
e0 1c 0f                       # 98d4 |   push 0xf
e0 e0 81 00                    # 98d7 |   push 0x81
e0 1c 09                       # 98db |   push 0x9
5c f8 7d 00                    # 98de |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 14                    # 98e2 |   mov SP, SP + 0x14
                               #      | _Z_call_35:
                               #      | _A_call_39:
5c f8 a3 00                    # 98e6 |   call ${fn_clear_oled}:rel + PC
                               #      | _Z_call_39:
                               #      | _cleanup_fn_init_oled:
e4 80                          # 98ea |   pop D
dc                             # 98ec |   ret
                               #      | _end_fn_init_oled:
                               #      | 
                               #      | fn_delay_1ms:
                               #      | _begin_fn_delay_1ms:
                               #      | _A_call_26:
e0 00                          # 98ed |   push 0
e0 e0 60 ea                    # 98ef |   push 0xea60
e0 00                          # 98f3 |   push 0
e0 00                          # 98f5 |   push 0
5c f8 6c fb                    # 98f7 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 98fb |   mov SP, SP + 0x8
                               #      | _Z_call_26:
                               #      | _cleanup_fn_delay_1ms:
dc                             # 98ff |   ret
                               #      | _end_fn_delay_1ms:
                               #      | 
                               #      | fn_send_oled_cmd:
                               #      | _begin_fn_send_oled_cmd:
                               #      | _A_call_28:
e2 bc 02                       # 9900 |   push [SP + 0x2]
e0 00                          # 9903 |   push 0
5c f8 09 00                    # 9905 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9909 |   mov SP, SP + 0x4
                               #      | _Z_call_28:
                               #      | _cleanup_fn_send_oled_cmd:
dc                             # 990d |   ret
                               #      | _end_fn_send_oled_cmd:
                               #      | 
                               #      | fn_send_oled_data_or_cmd:
                               #      | _begin_fn_send_oled_data_or_cmd:
e0 40                          # 990e |   push B
e0 20                          # 9910 |   push A
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
99 40 e0 1c 30 ff 08           # 9912 |   getb B, [0xff30], 0x8
ec 40 00 f8 0a 00              # 9919 |   jne B, 0, ${_C_loop_9}:rel + PC
                               #      | _BZ_loop_9:
58 f8 f3 ff                    # 991f |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
ad 40 bc e0 08 ff 00           # 9923 |   and B, [SP + 0x8], 0xff
ad 20 e0 e0 32 ff 00 ff        # 992a |   and A, [0xff32], 0xff00
30 20 e8 00 01                 # 9932 |   or A, 0x100 + B
                               #      | _A_if_62:
ee bc 00 f8 06 0f 00           # 9937 |   jne [SP + 0x6], 0, ${_E_if_62}:rel + PC
1c 20 1c 1c                    # 993e |   setb A, 0x1c
58 f8 08 00                    # 9942 |   jmp ${_C_if_62}:rel + PC
                               #      | _E_if_62:
1c 20 1c 0c                    # 9946 |   setb A, 0xc
                               #      | _C_if_62:
                               #      | _Z_if_62:
62 e0 20 32 ff                 # 994a |   mov [0xff32], A
9e e0 20 1c 32 ff 18           # 994f |   setb [0xff32], A, 0x18
                               #      | _cleanup_fn_send_oled_data_or_cmd:
e4 20                          # 9956 |   pop A
e4 40                          # 9958 |   pop B
dc                             # 995a |   ret
                               #      | _end_fn_send_oled_data_or_cmd:
                               #      | 
                               #      | fn_send_oled_cmd_sequence:
                               #      | _begin_fn_send_oled_cmd_sequence:
e0 40                          # 995b |   push B
e0 20                          # 995d |   push A
60 20 bc 08                    # 995f |   mov A, SP + 0x8
61 40 bc 06                    # 9963 |   mov B, [SP + 0x6]
60 40 45                       # 9967 |   mov B, B*2 + A
                               #      | _A_for_11:
                               #      | _BA_for_11:
fc 20 40 f8 1a 00              # 996a |   jge A, B, ${_C_for_11}:rel + PC
                               #      | _A_call_32:
e2 20                          # 9970 |   push [A]
e0 00                          # 9972 |   push 0
5c f8 9a ff                    # 9974 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9978 |   mov SP, SP + 0x4
                               #      | _Z_call_32:
                               #      | _BZ_for_11:
60 20 3c 02                    # 997c |   mov A, A + 0x2
58 f8 ea ff                    # 9980 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
                               #      | _cleanup_fn_send_oled_cmd_sequence:
e4 20                          # 9984 |   pop A
e4 40                          # 9986 |   pop B
dc                             # 9988 |   ret
                               #      | _end_fn_send_oled_cmd_sequence:
                               #      | 
                               #      | fn_clear_oled:
                               #      | _begin_fn_clear_oled:
e0 20                          # 9989 |   push A
                               #      | _A_call_36:
e0 1c 03                       # 998b |   push 0x3
e0 00                          # 998e |   push 0
e0 1c 22                       # 9990 |   push 0x22
e0 1c 7f                       # 9993 |   push 0x7f
e0 00                          # 9996 |   push 0
e0 1c 21                       # 9998 |   push 0x21
e0 1c 06                       # 999b |   push 0x6
5c f8 bd ff                    # 999e |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # 99a2 |   mov SP, SP + 0xe
                               #      | _Z_call_36:
                               #      | _A_for_12:
60 20 00                       # 99a6 |   mov A, 0
                               #      | _BA_for_12:
fc 20 e0 f8 00 02 18 00        # 99a9 |   jge A, 0x200, ${_C_for_12}:rel + PC
                               #      | _A_call_38:
e0 00                          # 99b1 |   push 0
5c f8 11 00                    # 99b3 |   call ${fn_send_oled_data}:rel + PC
60 a0 bc 02                    # 99b7 |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _BZ_for_12:
44 20                          # 99bb |   inc A
58 f8 ec ff                    # 99bd |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _cleanup_fn_clear_oled:
e4 20                          # 99c1 |   pop A
dc                             # 99c3 |   ret
                               #      | _end_fn_clear_oled:
                               #      | 
                               #      | fn_send_oled_data:
                               #      | _begin_fn_send_oled_data:
                               #      | _A_call_37:
e2 bc 02                       # 99c4 |   push [SP + 0x2]
e0 1c 01                       # 99c7 |   push 0x1
5c f8 44 ff                    # 99ca |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 99ce |   mov SP, SP + 0x4
                               #      | _Z_call_37:
                               #      | _cleanup_fn_send_oled_data:
dc                             # 99d2 |   ret
                               #      | _end_fn_send_oled_data:
                               #      | 
                               #      | fn_deinit_oled:
                               #      | _begin_fn_deinit_oled:
e0 80                          # 99d3 |   push D
60 80 e0 32 ff                 # 99d5 |   mov D, 0xff32
                               #      | _A_call_40:
e0 e0 ae 00                    # 99da |   push 0xae
5c f8 22 ff                    # 99de |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 99e2 |   mov SP, SP + 0x2
                               #      | _Z_call_40:
1e 80 1c 1e                    # 99e6 |   setb [D], 0x1e
                               #      | _A_call_41:
5c f8 03 ff                    # 99ea |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_41:
1e 80 1c 1f                    # 99ee |   setb [D], 0x1f
62 e0 00 32 ff                 # 99f2 |   mov [0xff32], 0
                               #      | _cleanup_fn_deinit_oled:
e4 80                          # 99f7 |   pop D
dc                             # 99f9 |   ret
                               #      | _end_fn_deinit_oled:
                               #      | 
                               #      | fn_quick_deinit_oled:
                               #      | _begin_fn_quick_deinit_oled:
1e e0 1c 32 ff 0f              # 99fa |   setb [0xff32], 0xf
                               #      | _A_call_42:
e0 e0 ae 00                    # 9a00 |   push 0xae
5c f8 fc fe                    # 9a04 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9a08 |   mov SP, SP + 0x2
                               #      | _Z_call_42:
62 e0 00 32 ff                 # 9a0c |   mov [0xff32], 0
                               #      | _cleanup_fn_quick_deinit_oled:
dc                             # 9a11 |   ret
                               #      | _end_fn_quick_deinit_oled:
                               #      | 
                               #      | fn_draw_char_oled:
                               #      | _begin_fn_draw_char_oled:
e0 80                          # 9a12 |   push D
e0 60                          # 9a14 |   push C
e0 40                          # 9a16 |   push B
e0 20                          # 9a18 |   push A
60 a0 bc e0                    # 9a1a |   mov SP, SP + -32
                               #      | _A_call_43:
e2 bc 2e                       # 9a1e |   push [SP + 0x2e]
e0 bc 02                       # 9a21 |   push SP + 0x2
5c f8 ac fb                    # 9a24 |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # 9a28 |   mov SP, SP + 0x4
                               #      | _Z_call_43:
ad 20 bc 1c 2a 01              # 9a2c |   and A, [SP + 0x2a], 0x1
ad 40 bc 1c 2c 07              # 9a32 |   and B, [SP + 0x2c], 0x7
28 40 1c 04                    # 9a38 |   shl B, 0x4
                               #      | _A_call_44:
e0 3d 01                       # 9a3c |   push A*2 + 0x1
e0 21                          # 9a3f |   push A*2
e0 1c 22                       # 9a41 |   push 0x22
e0 5c 0f                       # 9a44 |   push B + 0xf
e0 40                          # 9a47 |   push B
e0 1c 21                       # 9a49 |   push 0x21
e0 1c 06                       # 9a4c |   push 0x6
5c f8 0c ff                    # 9a4f |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # 9a53 |   mov SP, SP + 0xe
                               #      | _Z_call_44:
                               #      | _A_for_13:
60 20 00                       # 9a57 |   mov A, 0
                               #      | _BA_for_13:
fc 20 1c f8 10 52 00           # 9a5a |   jge A, 0x10, ${_C_for_13}:rel + PC
80 60 21 a0                    # 9a61 |   add C, A*2, SP
                               #      | _A_for_14:
e0 20                          # 9a65 |   push A
60 40 00                       # 9a67 |   mov B, 0
                               #      | _BA_for_14:
fc 40 1c f8 10 38 00           # 9a6a |   jge B, 0x10, ${_C_for_14}:rel + PC
60 20 00                       # 9a71 |   mov A, 0
                               #      | _A_for_15:
60 80 1c 07                    # 9a74 |   mov D, 0x7
                               #      | _BA_for_15:
e8 80 1c f8 ff 17 00           # 9a78 |   jeq D, -1, ${_C_for_15}:rel + PC
99 fe 8d 40                    # 9a7f |   getb G, [D*2 + C], B
40 fe                          # 9a83 |   bool G
b0 20 21 fe                    # 9a85 |   or A, A*2, G
                               #      | _BZ_for_15:
48 80                          # 9a89 |   dec D
58 f8 ed ff                    # 9a8b |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
                               #      | _A_call_45:
e0 20                          # 9a8f |   push A
e0 1c 01                       # 9a91 |   push 0x1
5c f8 7a fe                    # 9a94 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9a98 |   mov SP, SP + 0x4
                               #      | _Z_call_45:
                               #      | _BZ_for_14:
44 40                          # 9a9c |   inc B
58 f8 cc ff                    # 9a9e |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
e4 20                          # 9aa2 |   pop A
                               #      | _Z_for_14:
                               #      | _BZ_for_13:
60 20 3c 08                    # 9aa4 |   mov A, A + 0x8
58 f8 b2 ff                    # 9aa8 |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
                               #      | _cleanup_fn_draw_char_oled:
60 a0 bc 20                    # 9aac |   mov SP, SP + 0x20
e4 20                          # 9ab0 |   pop A
e4 40                          # 9ab2 |   pop B
e4 60                          # 9ab4 |   pop C
e4 80                          # 9ab6 |   pop D
dc                             # 9ab8 |   ret
                               #      | _end_fn_draw_char_oled:
                               #      | 
                               #      | fn_draw_str_oled:
                               #      | _begin_fn_draw_str_oled:
e0 80                          # 9ab9 |   push D
e0 60                          # 9abb |   push C
e0 40                          # 9abd |   push B
e0 20                          # 9abf |   push A
61 60 bc 0a                    # 9ac1 |   mov C, [SP + 0xa]
61 80 bc 0c                    # 9ac5 |   mov D, [SP + 0xc]
61 20 bc 0e                    # 9ac9 |   mov A, [SP + 0xe]
                               #      | _A_loop_10:
                               #      | _BA_loop_10:
65 40 20                       # 9acd |   bmov B, [A]
e8 40 00 f8 1c 00              # 9ad0 |   jeq B, 0, ${_C_loop_10}:rel + PC
                               #      | _A_call_46:
e0 40                          # 9ad6 |   push B
e0 80                          # 9ad8 |   push D
e0 60                          # 9ada |   push C
5c f8 36 ff                    # 9adc |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 9ae0 |   mov SP, SP + 0x6
                               #      | _Z_call_46:
44 20                          # 9ae4 |   inc A
44 80                          # 9ae6 |   inc D
                               #      | _BZ_loop_10:
58 f8 e5 ff                    # 9ae8 |   jmp ${_BA_loop_10}:rel + PC
                               #      | _C_loop_10:
                               #      | _Z_loop_10:
                               #      | _cleanup_fn_draw_str_oled:
e4 20                          # 9aec |   pop A
e4 40                          # 9aee |   pop B
e4 60                          # 9af0 |   pop C
e4 80                          # 9af2 |   pop D
dc                             # 9af4 |   ret
                               #      | _end_fn_draw_str_oled:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_48:
e0 00                          # 9af5 |   push 0
5c f8 15 00                    # 9af7 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9afb |   mov SP, SP + 0x2
                               #      | _Z_call_48:
                               #      | _A_call_49:
e0 e0 3b a9                    # 9aff |   push ${const__str__PONG__endl}
5c f8 d5 f6                    # 9b03 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9b07 |   mov SP, SP + 0x2
                               #      | _Z_call_49:
                               #      | _cleanup_fn_handle_ping:
dc                             # 9b0b |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # 9b0c |   inc G, 0
                               #      | _A_if_64:
eb e0 bc f8 39 ab 02 1f 00     # 9b0f |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_64}:rel + PC
                               #      | _A_call_47:
e2 e0 39 ab                    # 9b18 |   push [${var__g_num_args}]
e2 bc 04                       # 9b1c |   push [SP + 0x4]
e0 e0 17 a9                    # 9b1f |   push ${const__data_1}
5c f8 e7 f4                    # 9b23 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9b27 |   mov SP, SP + 0x6
                               #      | _Z_call_47:
60 fe 00                       # 9b2b |   mov G, 0
                               #      | _E_if_64:
                               #      | _C_if_64:
                               #      | _Z_if_64:
                               #      | _cleanup_fn_check_num_args:
dc                             # 9b2e |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # 9b2f |   push D
e0 60                          # 9b31 |   push C
e0 40                          # 9b33 |   push B
e0 20                          # 9b35 |   push A
60 a0 bc fa                    # 9b37 |   mov SP, SP + -6
                               #      | _A_call_50:
e0 1c 02                       # 9b3b |   push 0x2
5c f8 ce ff                    # 9b3e |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9b42 |   mov SP, SP + 0x2
                               #      | _Z_call_50:
e8 fe 00 f8 9f 00              # 9b46 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_52:
5c f8 a6 00                    # 9b4c |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_52:
e8 fe 00 f8 95 00              # 9b50 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 3c ab                 # 9b56 |   mov A, [${var__g_args}]
61 40 e0 3e ab                 # 9b5b |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_53:
e0 40                          # 9b60 |   push B
e0 20                          # 9b62 |   push A
e0 e0 5d a9                    # 9b64 |   push ${const__data_2}
5c f8 a2 f4                    # 9b68 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9b6c |   mov SP, SP + 0x6
                               #      | _Z_call_53:
                               #      | _A_if_70:
ee bc 1c f8 10 04 35 00        # 9b70 |   jne [SP + 0x10], 0x4, ${_E_if_70}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 29 00              # 9b78 |   jge A, B, ${_C_while_7}:rel + PC
61 60 20                       # 9b7e |   mov C, [A]
                               #      | _A_call_54:
e0 60                          # 9b81 |   push C
5c f8 f0 f5                    # 9b83 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9b87 |   mov SP, SP + 0x2
                               #      | _Z_call_54:
20 60 1c 08                    # 9b8b |   shr C, 0x8
                               #      | _A_call_55:
e0 60                          # 9b8f |   push C
5c f8 e2 f5                    # 9b91 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9b95 |   mov SP, SP + 0x2
                               #      | _Z_call_55:
60 20 3c 02                    # 9b99 |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 db ff                    # 9b9d |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 39 00                    # 9ba1 |   jmp ${_C_if_70}:rel + PC
                               #      | _E_if_70:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 35 00              # 9ba5 |   jge A, B, ${_C_while_8}:rel + PC
95 80 20 1c 08                 # 9bab |   ror D, [A], 0x8
                               #      | _A_if_71:
ee bc 1c f8 10 0b 0c 00        # 9bb0 |   jne [SP + 0x10], 0xb, ${_E_if_71}:rel + PC
14 80 1c 08                    # 9bb8 |   ror D, 0x8
                               #      | _E_if_71:
                               #      | _C_if_71:
                               #      | _Z_if_71:
                               #      | _A_call_56:
e0 a0                          # 9bbc |   push SP
e0 80                          # 9bbe |   push D
5c f8 3a f6                    # 9bc0 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9bc4 |   mov SP, SP + 0x4
                               #      | _Z_call_56:
                               #      | _A_call_57:
e0 a0                          # 9bc8 |   push SP
5c f8 0e f6                    # 9bca |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9bce |   mov SP, SP + 0x2
                               #      | _Z_call_57:
60 20 3c 02                    # 9bd2 |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 cf ff                    # 9bd6 |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_70:
                               #      | _Z_if_70:
                               #      | _A_call_58:
e0 1c 0a                       # 9bda |   push 0xa
5c f8 96 f5                    # 9bdd |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9be1 |   mov SP, SP + 0x2
                               #      | _Z_call_58:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # 9be5 |   mov SP, SP + 0x6
e4 20                          # 9be9 |   pop A
e4 40                          # 9beb |   pop B
e4 60                          # 9bed |   pop C
e4 80                          # 9bef |   pop D
dc                             # 9bf1 |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # 9bf2 |   push C
e0 40                          # 9bf4 |   push B
e0 20                          # 9bf6 |   push A
61 20 e0 3c ab                 # 9bf8 |   mov A, [${var__g_args}]
61 40 e0 3e ab                 # 9bfd |   mov B, [${var__g_args} + 0002]
60 60 e0 41 a9                 # 9c02 |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # 9c07 |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 50 a9                 # 9c0d |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # 9c12 |   and G, A, 0x1
ec fe 00 f8 18 00              # 9c17 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # 9c1d |   and G, B, 0x1
ec fe 00 f8 0d 00              # 9c22 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # 9c28 |   inc G, 0
58 f8 11 00                    # 9c2b |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_51:
e0 60                          # 9c2f |   push C
5c f8 a7 f5                    # 9c31 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9c35 |   mov SP, SP + 0x2
                               #      | _Z_call_51:
60 fe 00                       # 9c39 |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # 9c3c |   pop A
e4 40                          # 9c3e |   pop B
e4 60                          # 9c40 |   pop C
dc                             # 9c42 |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # 9c43 |   push D
e0 60                          # 9c45 |   push C
e0 40                          # 9c47 |   push B
e0 20                          # 9c49 |   push A
60 a0 bc fa                    # 9c4b |   mov SP, SP + -6
                               #      | _A_call_59:
e0 1c 02                       # 9c4f |   push 0x2
5c f8 ba fe                    # 9c52 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9c56 |   mov SP, SP + 0x2
                               #      | _Z_call_59:
e8 fe 00 f8 ce 00              # 9c5a |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_60:
5c f8 92 ff                    # 9c60 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_60:
e8 fe 00 f8 c4 00              # 9c64 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 3c ab                 # 9c6a |   mov A, [${var__g_args}]
61 40 e0 3e ab                 # 9c6f |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_74:
ee bc 1c f8 10 03 55 00        # 9c74 |   jne [SP + 0x10], 0x3, ${_E_if_74}:rel + PC
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 20 40 f8 49 00              # 9c7c |   jge A, B, ${_C_while_9}:rel + PC
                               #      | _A_for_16:
60 80 00                       # 9c82 |   mov D, 0
                               #      | _BA_for_16:
fc 80 1c f8 04 19 00           # 9c85 |   jge D, 0x4, ${_C_for_16}:rel + PC
                               #      | _A_call_61:
5c f8 f9 f5                    # 9c8c |   call ${fn_getc}:rel + PC
                               #      | _Z_call_61:
62 e0 ff 00 ff                 # 9c90 |   mov [0xff00], H
62 b0 ff                       # 9c95 |   mov [SP + D], H
                               #      | _BZ_for_16:
44 80                          # 9c98 |   inc D
58 f8 eb ff                    # 9c9a |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
                               #      | _Z_for_16:
                               #      | _A_call_62:
e0 a0                          # 9c9e |   push SP
5c f8 3f f6                    # 9ca0 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9ca4 |   mov SP, SP + 0x2
                               #      | _Z_call_62:
e8 fe 00 f8 74 00              # 9ca8 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # 9cae |   shl C, H, 0x8
20 ff 1c 08                    # 9cb3 |   shr H, 0x8
30 60 ff                       # 9cb7 |   or C, H
62 20 60                       # 9cba |   mov [A], C
60 20 3c 02                    # 9cbd |   mov A, A + 0x2
                               #      | _BZ_while_9:
58 f8 bb ff                    # 9cc1 |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
58 f8 31 00                    # 9cc5 |   jmp ${_C_if_74}:rel + PC
                               #      | _E_if_74:
                               #      | _A_while_10:
                               #      | _BA_while_10:
fc 20 40 f8 2d 00              # 9cc9 |   jge A, B, ${_C_while_10}:rel + PC
                               #      | _A_call_63:
5c f8 b6 f5                    # 9ccf |   call ${fn_getc}:rel + PC
                               #      | _Z_call_63:
62 e0 ff 00 ff                 # 9cd3 |   mov [0xff00], H
60 60 ff                       # 9cd8 |   mov C, H
                               #      | _A_call_64:
5c f8 aa f5                    # 9cdb |   call ${fn_getc}:rel + PC
                               #      | _Z_call_64:
62 e0 ff 00 ff                 # 9cdf |   mov [0xff00], H
28 ff 1c 08                    # 9ce4 |   shl H, 0x8
30 60 ff                       # 9ce8 |   or C, H
62 20 60                       # 9ceb |   mov [A], C
60 20 3c 02                    # 9cee |   mov A, A + 0x2
                               #      | _BZ_while_10:
58 f8 d7 ff                    # 9cf2 |   jmp ${_BA_while_10}:rel + PC
                               #      | _C_while_10:
                               #      | _Z_while_10:
                               #      | _C_if_74:
                               #      | _Z_if_74:
                               #      | _A_call_65:
5c f8 8f f5                    # 9cf6 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_65:
62 e0 ff 00 ff                 # 9cfa |   mov [0xff00], H
ec ff 1c f8 0a 1d 00           # 9cff |   jne H, 0xa, ${_L_fn_handle_write_1}:rel + PC
                               #      | _A_call_66:
e0 40                          # 9d06 |   push B
e2 e0 3c ab                    # 9d08 |   push [${var__g_args}]
e0 e0 6c a9                    # 9d0c |   push ${const__data_3}
5c f8 fa f2                    # 9d10 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9d14 |   mov SP, SP + 0x6
                               #      | _Z_call_66:
58 f8 10 00                    # 9d18 |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_67:
e0 e0 7c a9                    # 9d1c |   push ${const__data_4}
5c f8 b8 f4                    # 9d20 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9d24 |   mov SP, SP + 0x2
                               #      | _Z_call_67:
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # 9d28 |   mov SP, SP + 0x6
e4 20                          # 9d2c |   pop A
e4 40                          # 9d2e |   pop B
e4 60                          # 9d30 |   pop C
e4 80                          # 9d32 |   pop D
dc                             # 9d34 |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
                               #      | _A_call_68:
e0 1c 01                       # 9d35 |   push 0x1
5c f8 d4 fd                    # 9d38 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9d3c |   mov SP, SP + 0x2
                               #      | _Z_call_68:
e8 fe 00 f8 68 00              # 9d40 |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_call_70:
e0 1c 52                       # 9d46 |   push 0x52
5c f8 60 00                    # 9d49 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # 9d4d |   mov SP, SP + 0x2
                               #      | _Z_call_70:
                               #      | _A_if_78:
ee bc 1c f8 02 06 1c 00        # 9d51 |   jne [SP + 0x2], 0x6, ${_E_if_78}:rel + PC
                               #      | _A_call_71:
e2 e0 3c ab                    # 9d59 |   push [${var__g_args}]
e0 e0 8b a9                    # 9d5d |   push ${const__data_5}
5c f8 a9 f2                    # 9d61 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9d65 |   mov SP, SP + 0x4
                               #      | _Z_call_71:
5a f8 d3 0d                    # 9d69 |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_78:
                               #      | _C_if_78:
                               #      | _Z_if_78:
63 e0 e0 1c ff 3c ab           # 9d6d |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_72:
e2 e0 1c ff                    # 9d74 |   push [0xff1c]
e0 e0 96 a9                    # 9d78 |   push ${const__data_6}
5c f8 8e f2                    # 9d7c |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9d80 |   mov SP, SP + 0x4
                               #      | _Z_call_72:
                               #      | glb_jmp_to_stored_target:
62 e0 00 0a ff                 # 9d84 |   mov [0xff0a], 0
60 20 00                       # 9d89 |   mov A, 0
60 40 00                       # 9d8c |   mov B, 0
60 60 00                       # 9d8f |   mov C, 0
60 80 00                       # 9d92 |   mov D, 0
60 a0 00                       # 9d95 |   mov SP, 0
60 fc 00                       # 9d98 |   mov E, 0
60 fd 00                       # 9d9b |   mov F, 0
60 fe 00                       # 9d9e |   mov G, 0
60 ff 00                       # 9da1 |   mov H, 0
5a e0 1c ff                    # 9da4 |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # 9da8 |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_show_status:
                               #      | _begin_fn_show_status:
                               #      | _A_call_69:
e2 bc 02                       # 9da9 |   push [SP + 0x2]
e0 1c 07                       # 9dac |   push 0x7
e0 1c 01                       # 9daf |   push 0x1
5c f8 60 fc                    # 9db2 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 9db6 |   mov SP, SP + 0x6
                               #      | _Z_call_69:
                               #      | _cleanup_fn_show_status:
dc                             # 9dba |   ret
                               #      | _end_fn_show_status:
                               #      | 
                               #      | fn_handle_init_sd:
                               #      | _begin_fn_handle_init_sd:
                               #      | _A_call_73:
5c f8 32 fa                    # 9dbb |   call ${fn_init_sd}:rel + PC
                               #      | _Z_call_73:
                               #      | _A_if_79:
ec fe 00 f8 16 00              # 9dbf |   jne G, 0, ${_E_if_79}:rel + PC
                               #      | _A_call_74:
e0 e0 a8 a9                    # 9dc5 |   push ${const__str__TIMEOUT__endl}
5c f8 0f f4                    # 9dc9 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9dcd |   mov SP, SP + 0x2
                               #      | _Z_call_74:
58 f8 10 00                    # 9dd1 |   jmp ${_C_if_79}:rel + PC
                               #      | _E_if_79:
                               #      | _A_call_75:
e0 e0 b1 a9                    # 9dd5 |   push ${const__str__INIT_OK__endl}
5c f8 ff f3                    # 9dd9 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9ddd |   mov SP, SP + 0x2
                               #      | _Z_call_75:
                               #      | _C_if_79:
                               #      | _Z_if_79:
                               #      | _cleanup_fn_handle_init_sd:
dc                             # 9de1 |   ret
                               #      | _end_fn_handle_init_sd:
                               #      | 
                               #      | fn_handle_read_sd:
                               #      | _begin_fn_handle_read_sd:
e0 40                          # 9de2 |   push B
e0 20                          # 9de4 |   push A
60 a0 bc fa                    # 9de6 |   mov SP, SP + -6
60 a0 f4 fe fd                 # 9dea |   mov SP, 0xfdfe + SP
                               #      | _A_call_76:
e0 1c 02                       # 9def |   push 0x2
5c f8 1a fd                    # 9df2 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9df6 |   mov SP, SP + 0x2
                               #      | _Z_call_76:
e8 fe 00 f8 7d 00              # 9dfa |   jeq G, 0, ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _A_call_77:
e2 e0 3e ab                    # 9e00 |   push [${var__g_args} + 0002]
e2 e0 3c ab                    # 9e04 |   push [${var__g_args}]
e0 e0 00 02                    # 9e08 |   push 0x200
e0 bc 06                       # 9e0c |   push SP + 0x6
5c f8 03 f8                    # 9e0f |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # 9e13 |   mov SP, SP + 0x8
                               #      | _Z_call_77:
                               #      | _A_if_81:
ec fe 00 f8 16 00              # 9e17 |   jne G, 0, ${_E_if_81}:rel + PC
                               #      | _A_call_78:
e0 e0 a8 a9                    # 9e1d |   push ${const__str__TIMEOUT__endl}
5c f8 b7 f3                    # 9e21 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e25 |   mov SP, SP + 0x2
                               #      | _Z_call_78:
58 f8 4e 00                    # 9e29 |   jmp ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _E_if_81:
                               #      | _C_if_81:
                               #      | _Z_if_81:
                               #      | _A_call_79:
e2 e0 3e ab                    # 9e2d |   push [${var__g_args} + 0002]
e2 e0 3c ab                    # 9e31 |   push [${var__g_args}]
e0 e0 ba a9                    # 9e35 |   push ${const__data_7}
5c f8 d1 f1                    # 9e39 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9e3d |   mov SP, SP + 0x6
                               #      | _Z_call_79:
                               #      | _A_for_17:
60 40 a0                       # 9e41 |   mov B, SP
                               #      | _BA_for_17:
fc 40 f4 f8 00 02 28 00        # 9e44 |   jge B, 0x200 + SP, ${_C_for_17}:rel + PC
                               #      | _A_call_80:
e0 f4 02 02                    # 9e4c |   push 0x202 + SP
e2 40                          # 9e50 |   push [B]
5c f8 a8 f3                    # 9e52 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9e56 |   mov SP, SP + 0x4
                               #      | _Z_call_80:
                               #      | _A_call_81:
e0 f4 04 02                    # 9e5a |   push 0x204 + SP
5c f8 7a f3                    # 9e5e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e62 |   mov SP, SP + 0x2
                               #      | _Z_call_81:
                               #      | _BZ_for_17:
44 40                          # 9e66 |   inc B
58 f8 dc ff                    # 9e68 |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
                               #      | _Z_for_17:
                               #      | _A_call_82:
e0 1c 0a                       # 9e6c |   push 0xa
5c f8 04 f3                    # 9e6f |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9e73 |   mov SP, SP + 0x2
                               #      | _Z_call_82:
                               #      | _cleanup_fn_handle_read_sd:
60 a0 f4 08 02                 # 9e77 |   mov SP, 0x208 + SP
e4 20                          # 9e7c |   pop A
e4 40                          # 9e7e |   pop B
dc                             # 9e80 |   ret
                               #      | _end_fn_handle_read_sd:
                               #      | 
                               #      | fn_handle_init_oled:
                               #      | _begin_fn_handle_init_oled:
                               #      | _A_call_83:
5c f8 ec f9                    # 9e81 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_83:
                               #      | _A_call_84:
e0 e0 cc a9                    # 9e85 |   push ${const__str__DONE__endl}
5c f8 4f f3                    # 9e89 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e8d |   mov SP, SP + 0x2
                               #      | _Z_call_84:
                               #      | _cleanup_fn_handle_init_oled:
dc                             # 9e91 |   ret
                               #      | _end_fn_handle_init_oled:
                               #      | 
                               #      | fn_handle_deinit_oled:
                               #      | _begin_fn_handle_deinit_oled:
                               #      | _A_call_85:
5c f8 41 fb                    # 9e92 |   call ${fn_deinit_oled}:rel + PC
                               #      | _Z_call_85:
                               #      | _A_call_86:
e0 e0 cc a9                    # 9e96 |   push ${const__str__DONE__endl}
5c f8 3e f3                    # 9e9a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e9e |   mov SP, SP + 0x2
                               #      | _Z_call_86:
                               #      | _cleanup_fn_handle_deinit_oled:
dc                             # 9ea2 |   ret
                               #      | _end_fn_handle_deinit_oled:
                               #      | 
                               #      | fn_handle_write_sd:
                               #      | _begin_fn_handle_write_sd:
e0 80                          # 9ea3 |   push D
e0 60                          # 9ea5 |   push C
e0 40                          # 9ea7 |   push B
e0 20                          # 9ea9 |   push A
60 a0 bc fa                    # 9eab |   mov SP, SP + -6
60 a0 f4 fe fd                 # 9eaf |   mov SP, 0xfdfe + SP
                               #      | _A_call_87:
e0 1c 02                       # 9eb4 |   push 0x2
5c f8 55 fc                    # 9eb7 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9ebb |   mov SP, SP + 0x2
                               #      | _Z_call_87:
e8 fe 00 f8 ae 00              # 9ebf |   jeq G, 0, ${_cleanup_fn_handle_write_sd}:rel + PC
60 20 a0                       # 9ec5 |   mov A, SP
                               #      | _A_while_11:
                               #      | _BA_while_11:
fc 20 f4 f8 00 02 44 00        # 9ec8 |   jge A, 0x200 + SP, ${_C_while_11}:rel + PC
                               #      | _A_for_18:
60 80 00                       # 9ed0 |   mov D, 0
                               #      | _BA_for_18:
fc 80 1c f8 02 1e 00           # 9ed3 |   jge D, 0x2, ${_C_for_18}:rel + PC
                               #      | _A_call_88:
5c f8 ab f3                    # 9eda |   call ${fn_getc}:rel + PC
                               #      | _Z_call_88:
62 e0 ff 00 ff                 # 9ede |   mov [0xff00], H
60 60 f4 02 02                 # 9ee3 |   mov C, 0x202 + SP
62 70 ff                       # 9ee8 |   mov [C + D], H
                               #      | _BZ_for_18:
44 80                          # 9eeb |   inc D
58 f8 e6 ff                    # 9eed |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
                               #      | _Z_for_18:
                               #      | _A_call_89:
e0 f4 02 02                    # 9ef1 |   push 0x202 + SP
5c f8 ea f3                    # 9ef5 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9ef9 |   mov SP, SP + 0x2
                               #      | _Z_call_89:
e8 fe 00 f8 64 00              # 9efd |   jeq G, 0, ${_L_fn_handle_write_sd_1}:rel + PC
62 20 ff                       # 9f03 |   mov [A], H
44 20                          # 9f06 |   inc A
                               #      | _BZ_while_11:
58 f8 c0 ff                    # 9f08 |   jmp ${_BA_while_11}:rel + PC
                               #      | _C_while_11:
                               #      | _Z_while_11:
                               #      | _A_call_90:
5c f8 79 f3                    # 9f0c |   call ${fn_getc}:rel + PC
                               #      | _Z_call_90:
62 e0 ff 00 ff                 # 9f10 |   mov [0xff00], H
ec ff 1c f8 0a 4c 00           # 9f15 |   jne H, 0xa, ${_L_fn_handle_write_sd_1}:rel + PC
                               #      | _A_call_91:
e2 e0 3e ab                    # 9f1c |   push [${var__g_args} + 0002]
e2 e0 3c ab                    # 9f20 |   push [${var__g_args}]
e0 e0 00 02                    # 9f24 |   push 0x200
e0 bc 06                       # 9f28 |   push SP + 0x6
5c f8 06 f8                    # 9f2b |   call ${fn_write_sd}:rel + PC
60 a0 bc 08                    # 9f2f |   mov SP, SP + 0x8
                               #      | _Z_call_91:
                               #      | _A_if_85:
ec fe 00 f8 16 00              # 9f33 |   jne G, 0, ${_E_if_85}:rel + PC
                               #      | _A_call_92:
e0 e0 a8 a9                    # 9f39 |   push ${const__str__TIMEOUT__endl}
5c f8 9b f2                    # 9f3d |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9f41 |   mov SP, SP + 0x2
                               #      | _Z_call_92:
58 f8 28 00                    # 9f45 |   jmp ${_cleanup_fn_handle_write_sd}:rel + PC
                               #      | _E_if_85:
                               #      | _C_if_85:
                               #      | _Z_if_85:
                               #      | _A_call_93:
e2 e0 3e ab                    # 9f49 |   push [${var__g_args} + 0002]
e2 e0 3c ab                    # 9f4d |   push [${var__g_args}]
e0 e0 d2 a9                    # 9f51 |   push ${const__data_8}
5c f8 b5 f0                    # 9f55 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9f59 |   mov SP, SP + 0x6
                               #      | _Z_call_93:
58 f8 10 00                    # 9f5d |   jmp ${_cleanup_fn_handle_write_sd}:rel + PC
                               #      | _L_fn_handle_write_sd_1:
                               #      | _A_call_94:
e0 e0 7c a9                    # 9f61 |   push ${const__data_4}
5c f8 73 f2                    # 9f65 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9f69 |   mov SP, SP + 0x2
                               #      | _Z_call_94:
                               #      | _cleanup_fn_handle_write_sd:
60 a0 f4 08 02                 # 9f6d |   mov SP, 0x208 + SP
e4 20                          # 9f72 |   pop A
e4 40                          # 9f74 |   pop B
e4 60                          # 9f76 |   pop C
e4 80                          # 9f78 |   pop D
dc                             # 9f7a |   ret
                               #      | _end_fn_handle_write_sd:
                               #      | 
                               #      | fn_handle_mmap:
                               #      | _begin_fn_handle_mmap:
e0 80                          # 9f7b |   push D
e0 60                          # 9f7d |   push C
e0 40                          # 9f7f |   push B
e0 20                          # 9f81 |   push A
                               #      | _A_call_95:
e0 fc                          # 9f83 |   push E
e0 1c 05                       # 9f85 |   push 0x5
5c f8 84 fb                    # 9f88 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9f8c |   mov SP, SP + 0x2
e4 fc                          # 9f90 |   pop E
                               #      | _Z_call_95:
e8 fe 00 f8 3f 00              # 9f92 |   jeq G, 0, ${_cleanup_fn_handle_mmap}:rel + PC
61 20 e0 3c ab                 # 9f98 |   mov A, [${var__g_args}]
61 40 e0 3e ab                 # 9f9d |   mov B, [${var__g_args} + 0002]
61 60 e0 40 ab                 # 9fa2 |   mov C, [${var__g_args} + 0004]
61 80 e0 42 ab                 # 9fa7 |   mov D, [${var__g_args} + 0006]
ad fc e0 1c 44 ab 03           # 9fac |   and E, [${var__g_args} + 0008], 0x3
54 60 80 fc                    # 9fb3 |   mmap C, D, E
                               #      | _A_call_96:
e0 fc                          # 9fb7 |   push E
e0 fc                          # 9fb9 |   push E
e0 80                          # 9fbb |   push D
e0 60                          # 9fbd |   push C
e0 40                          # 9fbf |   push B
e0 20                          # 9fc1 |   push A
e0 e0 e5 a9                    # 9fc3 |   push ${const__data_9}
5c f8 43 f0                    # 9fc7 |   call ${fn_printf}:rel + PC
60 a0 bc 0c                    # 9fcb |   mov SP, SP + 0xc
e4 fc                          # 9fcf |   pop E
                               #      | _Z_call_96:
                               #      | _cleanup_fn_handle_mmap:
e4 20                          # 9fd1 |   pop A
e4 40                          # 9fd3 |   pop B
e4 60                          # 9fd5 |   pop C
e4 80                          # 9fd7 |   pop D
dc                             # 9fd9 |   ret
                               #      | _end_fn_handle_mmap:
                               #      | 
                               #      | fn_handle_umap:
                               #      | _begin_fn_handle_umap:
e0 20                          # 9fda |   push A
                               #      | _A_call_97:
e0 1c 01                       # 9fdc |   push 0x1
5c f8 2d fb                    # 9fdf |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9fe3 |   mov SP, SP + 0x2
                               #      | _Z_call_97:
e8 fe 00 f8 1d 00              # 9fe7 |   jeq G, 0, ${_cleanup_fn_handle_umap}:rel + PC
ad 20 e0 1c 3c ab 03           # 9fed |   and A, [${var__g_args}], 0x3
d4 20                          # 9ff4 |   umap A
                               #      | _A_call_98:
e0 20                          # 9ff6 |   push A
e0 e0 fd a9                    # 9ff8 |   push ${const__data_10}
5c f8 0e f0                    # 9ffc |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a000 |   mov SP, SP + 0x4
                               #      | _Z_call_98:
                               #      | _cleanup_fn_handle_umap:
e4 20                          # a004 |   pop A
dc                             # a006 |   ret
                               #      | _end_fn_handle_umap:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # a007 |   push B
e0 20                          # a009 |   push A
60 20 e0 fd 00                 # a00b |   mov A, 0xfd
60 40 00                       # a010 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # a013 |   mmap 0xff00, -1, 0x2
62 e0 e0 1e ff 89 a0           # a01b |   mov [0xff1e], ${fn_syscall_entry}
                               #      | _A_call_99:
e0 e0 27 aa                    # a022 |   push ${const__data_11}
5c f8 b2 f1                    # a026 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a02a |   mov SP, SP + 0x2
                               #      | _Z_call_99:
                               #      | _A_call_106:
5c f8 6f 00                    # a02e |   call ${fn_init_sd_and_oled}:rel + PC
                               #      | _Z_call_106:
                               #      | _A_call_111:
5c f8 b7 00                    # a032 |   call ${fn_check_persisted_target}:rel + PC
                               #      | _Z_call_111:
                               #      | _A_call_112:
e0 e0 78 aa                    # a036 |   push ${const__str__READY__endl}
5c f8 9e f1                    # a03a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a03e |   mov SP, SP + 0x2
                               #      | _Z_call_112:
c6 e0 00 0a ff                 # a042 |   inc [0xff0a], 0
                               #      | _A_loop_11:
                               #      | _BA_loop_11:
                               #      | _A_call_136:
5c f8 06 01                    # a047 |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_136:
46 e0 0a ff                    # a04b |   inc [0xff0a]
60 20 ff                       # a04f |   mov A, H
                               #      | _A_if_132:
ec fe 00 f8 0a 00              # a052 |   jne G, 0, ${_E_if_132}:rel + PC
58 f8 ef ff                    # a058 |   jmp ${_BA_loop_11}:rel + PC
                               #      | _E_if_132:
                               #      | _C_if_132:
                               #      | _Z_if_132:
                               #      | _A_if_133:
ec 20 00 f8 16 00              # a05c |   jne A, 0, ${_E_if_133}:rel + PC
                               #      | _A_call_137:
e0 e0 26 ab                    # a062 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 72 f1                    # a066 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a06a |   mov SP, SP + 0x2
                               #      | _Z_call_137:
58 f8 d9 ff                    # a06e |   jmp ${_BA_loop_11}:rel + PC
                               #      | _E_if_133:
                               #      | _C_if_133:
                               #      | _Z_if_133:
60 40 21                       # a072 |   mov B, A*2
60 40 e8 07 aa                 # a075 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # a07a |   push A
5e 40                          # a07c |   call [B]
e4 20                          # a07e |   pop A
                               #      | _BZ_loop_11:
58 f8 c7 ff                    # a080 |   jmp ${_BA_loop_11}:rel + PC
                               #      | _C_loop_11:
                               #      | _Z_loop_11:
                               #      | _cleanup_fn_main:
e4 20                          # a084 |   pop A
e4 40                          # a086 |   pop B
dc                             # a088 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_88:
f0 ff 1c f8 1d 08 00           # a089 |   jlt H, 0x1d, ${_E_if_88}:rel + PC
dc                             # a090 |   ret
                               #      | _E_if_88:
                               #      | _C_if_88:
                               #      | _Z_if_88:
28 ff 1c 01                    # a091 |   shl H, 0x1
00 ff e0 dd a8                 # a095 |   add H, ${const__SYSCALL_MAP}
5a ff                          # a09a |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # a09c |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_init_sd_and_oled:
                               #      | _begin_fn_init_sd_and_oled:
                               #      | _A_call_100:
5c f8 59 f7                    # a09d |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_100:
                               #      | _A_call_101:
5c f8 cc f7                    # a0a1 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_101:
                               #      | _A_call_102:
e0 e0 56 aa                    # a0a5 |   push ${const__str__Weeekly}
e0 00                          # a0a9 |   push 0
e0 00                          # a0ab |   push 0
5c f8 0c fa                    # a0ad |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # a0b1 |   mov SP, SP + 0x6
                               #      | _Z_call_102:
                               #      | _A_call_103:
e0 e0 5e aa                    # a0b5 |   push ${const__data_12}
e0 00                          # a0b9 |   push 0
e0 1c 01                       # a0bb |   push 0x1
5c f8 fb f9                    # a0be |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # a0c2 |   mov SP, SP + 0x6
                               #      | _Z_call_103:
                               #      | _A_call_104:
5c f8 5b f7                    # a0c6 |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_104:
60 ff 1c 53                    # a0ca |   mov H, 0x53
                               #      | _A_if_89:
ec fe 00 f8 0a 00              # a0ce |   jne G, 0, ${_E_if_89}:rel + PC
60 ff 1c 2d                    # a0d4 |   mov H, 0x2d
                               #      | _E_if_89:
                               #      | _C_if_89:
                               #      | _Z_if_89:
                               #      | _A_call_105:
e0 ff                          # a0d8 |   push H
e0 1c 06                       # a0da |   push 0x6
e0 1c 01                       # a0dd |   push 0x1
5c f8 32 f9                    # a0e0 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # a0e4 |   mov SP, SP + 0x6
                               #      | _Z_call_105:
                               #      | _cleanup_fn_init_sd_and_oled:
dc                             # a0e8 |   ret
                               #      | _end_fn_init_sd_and_oled:
                               #      | 
                               #      | fn_check_persisted_target:
                               #      | _begin_fn_check_persisted_target:
e0 40                          # a0e9 |   push B
e0 20                          # a0eb |   push A
61 20 e0 1c ff                 # a0ed |   mov A, [0xff1c]
                               #      | _A_scope_8:
                               #      | _B_scope_8:
e8 20 00 f8 56 00              # a0f2 |   jeq A, 0, ${_C_scope_8}:rel + PC
e8 20 e0 f8 00 90 50 00        # a0f8 |   jeq A, 0x9000, ${_C_scope_8}:rel + PC
61 40 e0 0c ff                 # a100 |   mov B, [0xff0c]
2c 40 e0 00 01                 # a105 |   and B, 0x100
                               #      | _A_if_92:
e8 40 00 f8 21 00              # a10a |   jeq B, 0, ${_E_if_92}:rel + PC
                               #      | _A_call_107:
e0 e0 65 aa                    # a110 |   push ${const__str__FORCED_BOOTLOADER__endl}
5c f8 f6 ee                    # a114 |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # a118 |   mov SP, SP + 0x2
                               #      | _Z_call_107:
                               #      | _A_call_108:
e0 1c 46                       # a11c |   push 0x46
5c f8 8a fc                    # a11f |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a123 |   mov SP, SP + 0x2
                               #      | _Z_call_108:
58 f8 21 00                    # a127 |   jmp ${_C_scope_8}:rel + PC
                               #      | _E_if_92:
                               #      | _C_if_92:
                               #      | _Z_if_92:
                               #      | _A_call_109:
e0 20                          # a12b |   push A
e0 e0 8b a9                    # a12d |   push ${const__data_5}
5c f8 d9 ee                    # a131 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a135 |   mov SP, SP + 0x4
                               #      | _Z_call_109:
                               #      | _A_call_110:
e0 1c 50                       # a139 |   push 0x50
5c f8 6d fc                    # a13c |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # a140 |   mov SP, SP + 0x2
                               #      | _Z_call_110:
58 f8 40 fc                    # a144 |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_8:
                               #      | _Z_scope_8:
                               #      | _cleanup_fn_check_persisted_target:
e4 20                          # a148 |   pop A
e4 40                          # a14a |   pop B
dc                             # a14c |   ret
                               #      | _end_fn_check_persisted_target:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # a14d |   push D
e0 60                          # a14f |   push C
e0 40                          # a151 |   push B
e0 20                          # a153 |   push A
60 a0 bc fe                    # a155 |   mov SP, SP + -2
62 a0 00                       # a159 |   mov [SP], 0
60 a0 bc de                    # a15c |   mov SP, SP + -34
62 a0 00                       # a160 |   mov [SP], 0
60 20 a0                       # a163 |   mov A, SP
                               #      | _A_loop_12:
                               #      | _BA_loop_12:
                               #      | _A_call_113:
5c f8 1f f1                    # a166 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_113:
60 60 ff                       # a16a |   mov C, H
62 e0 60 00 ff                 # a16d |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # a172 |   jeq C, 0xa, ${_C_loop_12}:rel + PC
e8 60 1c f8 0d 29 00           # a179 |   jeq C, 0xd, ${_C_loop_12}:rel + PC
                               #      | _A_if_95:
f0 20 bc f8 1f 19 00           # a180 |   jlt A, SP + 0x1f, ${_E_if_95}:rel + PC
                               #      | _A_call_114:
e0 e0 7f aa                    # a187 |   push ${const__data_13}
5c f8 4d f0                    # a18b |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a18f |   mov SP, SP + 0x2
                               #      | _Z_call_114:
e8 ff 00 f8 d3 00              # a193 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_95:
                               #      | _C_if_95:
                               #      | _Z_if_95:
62 20 60                       # a199 |   mov [A], C
44 20                          # a19c |   inc A
                               #      | _BZ_loop_12:
58 f8 c8 ff                    # a19e |   jmp ${_BA_loop_12}:rel + PC
                               #      | _C_loop_12:
                               #      | _Z_loop_12:
                               #      | _A_call_115:
e0 1c 20                       # a1a2 |   push 0x20
e0 bc 02                       # a1a5 |   push SP + 0x2
5c f8 72 f2                    # a1a8 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a1ac |   mov SP, SP + 0x4
                               #      | _Z_call_115:
60 60 ff                       # a1b0 |   mov C, H
                               #      | _A_if_97:
e8 60 00 f8 0f 00              # a1b3 |   jeq C, 0, ${_E_if_97}:rel + PC
66 60 00                       # a1b9 |   bmov [C], 0
44 60                          # a1bc |   inc C
58 f8 08 00                    # a1be |   jmp ${_C_if_97}:rel + PC
                               #      | _E_if_97:
60 60 1c ff                    # a1c2 |   mov C, -1
                               #      | _C_if_97:
                               #      | _Z_if_97:
                               #      | _A_call_131:
e0 a0                          # a1c6 |   push SP
5c f8 b1 00                    # a1c8 |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # a1cc |   mov SP, SP + 0x2
                               #      | _Z_call_131:
e8 ff 00 f8 9c 00              # a1d0 |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # a1d6 |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 39 ab                 # a1da |   mov [${var__g_num_args}], 0
                               #      | _A_while_12:
                               #      | _BA_while_12:
fc 60 bc f8 20 7c 00           # a1df |   jge C, SP + 0x20, ${_C_while_12}:rel + PC
                               #      | _A_call_132:
e0 1c 20                       # a1e6 |   push 0x20
e0 60                          # a1e9 |   push C
5c f8 2f f2                    # a1eb |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a1ef |   mov SP, SP + 0x4
                               #      | _Z_call_132:
60 80 ff                       # a1f3 |   mov D, H
                               #      | _A_if_129:
e8 80 00 f8 0d 00              # a1f6 |   jeq D, 0, ${_E_if_129}:rel + PC
66 80 00                       # a1fc |   bmov [D], 0
58 f8 08 00                    # a1ff |   jmp ${_C_if_129}:rel + PC
                               #      | _E_if_129:
60 80 1c fe                    # a203 |   mov D, -2
                               #      | _C_if_129:
                               #      | _Z_if_129:
61 20 e0 39 ab                 # a207 |   mov A, [${var__g_num_args}]
                               #      | _A_if_130:
f0 20 1c f8 06 17 00           # a20c |   jlt A, 0x6, ${_E_if_130}:rel + PC
                               #      | _A_call_133:
e0 e0 fd aa                    # a213 |   push ${const__data_14}
5c f8 c1 ef                    # a217 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a21b |   mov SP, SP + 0x2
                               #      | _Z_call_133:
58 f8 47 00                    # a21f |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_130:
                               #      | _C_if_130:
                               #      | _Z_if_130:
                               #      | _A_call_134:
e0 60                          # a223 |   push C
5c f8 ba f0                    # a225 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a229 |   mov SP, SP + 0x2
                               #      | _Z_call_134:
                               #      | _A_if_131:
ec fe 00 f8 18 00              # a22d |   jne G, 0, ${_E_if_131}:rel + PC
                               #      | _A_call_135:
e0 20                          # a233 |   push A
e0 e0 12 ab                    # a235 |   push ${const__data_15}
5c f8 d1 ed                    # a239 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a23d |   mov SP, SP + 0x4
                               #      | _Z_call_135:
58 f8 25 00                    # a241 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_131:
                               #      | _C_if_131:
                               #      | _Z_if_131:
a8 40 20 1c 01                 # a245 |   shl B, A, 0x1
62 e8 ff 3c ab                 # a24a |   mov [${var__g_args} + B], H
c6 e0 20 39 ab                 # a24f |   inc [${var__g_num_args}], A
c4 60 80                       # a254 |   inc C, D
                               #      | _BZ_while_12:
58 f8 88 ff                    # a257 |   jmp ${_BA_while_12}:rel + PC
                               #      | _C_while_12:
                               #      | _Z_while_12:
c4 fe 00                       # a25b |   inc G, 0
61 ff bc 22                    # a25e |   mov H, [SP + 0x22]
58 f8 0a 00                    # a262 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # a266 |   mov G, 0
60 ff 00                       # a269 |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # a26c |   mov SP, SP + 0x24
e4 20                          # a270 |   pop A
e4 40                          # a272 |   pop B
e4 60                          # a274 |   pop C
e4 80                          # a276 |   pop D
dc                             # a278 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # a279 |   push A
61 20 bc 04                    # a27b |   mov A, [SP + 0x4]
                               #      | _A_call_116:
e0 e0 91 aa                    # a27f |   push ${const__str__PING}
e0 20                          # a283 |   push A
5c f8 43 f1                    # a285 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a289 |   mov SP, SP + 0x4
                               #      | _Z_call_116:
                               #      | _A_if_99:
ec ff 00 f8 0d 00              # a28d |   jne H, 0, ${_E_if_99}:rel + PC
c4 ff 00                       # a293 |   inc H, 0
58 f8 8f 01                    # a296 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_99:
                               #      | _C_if_99:
                               #      | _Z_if_99:
                               #      | _A_call_117:
e0 e0 96 aa                    # a29a |   push ${const__str__READ}
e0 20                          # a29e |   push A
5c f8 28 f1                    # a2a0 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a2a4 |   mov SP, SP + 0x4
                               #      | _Z_call_117:
                               #      | _A_if_101:
ec ff 00 f8 0e 00              # a2a8 |   jne H, 0, ${_E_if_101}:rel + PC
60 ff 1c 02                    # a2ae |   mov H, 0x2
58 f8 73 01                    # a2b2 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_101:
                               #      | _C_if_101:
                               #      | _Z_if_101:
                               #      | _A_call_118:
e0 e0 9b aa                    # a2b6 |   push ${const__str__WRITE}
e0 20                          # a2ba |   push A
5c f8 0c f1                    # a2bc |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a2c0 |   mov SP, SP + 0x4
                               #      | _Z_call_118:
                               #      | _A_if_103:
ec ff 00 f8 0e 00              # a2c4 |   jne H, 0, ${_E_if_103}:rel + PC
60 ff 1c 03                    # a2ca |   mov H, 0x3
58 f8 57 01                    # a2ce |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_103:
                               #      | _C_if_103:
                               #      | _Z_if_103:
                               #      | _A_call_119:
e0 e0 a1 aa                    # a2d2 |   push ${const__str__READB}
e0 20                          # a2d6 |   push A
5c f8 f0 f0                    # a2d8 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a2dc |   mov SP, SP + 0x4
                               #      | _Z_call_119:
                               #      | _A_if_105:
ec ff 00 f8 0e 00              # a2e0 |   jne H, 0, ${_E_if_105}:rel + PC
60 ff 1c 04                    # a2e6 |   mov H, 0x4
58 f8 3b 01                    # a2ea |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_105:
                               #      | _C_if_105:
                               #      | _Z_if_105:
                               #      | _A_call_120:
e0 e0 a7 aa                    # a2ee |   push ${const__str__WRITEB}
e0 20                          # a2f2 |   push A
5c f8 d4 f0                    # a2f4 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a2f8 |   mov SP, SP + 0x4
                               #      | _Z_call_120:
                               #      | _A_if_107:
ec ff 00 f8 0e 00              # a2fc |   jne H, 0, ${_E_if_107}:rel + PC
60 ff 1c 05                    # a302 |   mov H, 0x5
58 f8 1f 01                    # a306 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_107:
                               #      | _C_if_107:
                               #      | _Z_if_107:
                               #      | _A_call_121:
e0 e0 ae aa                    # a30a |   push ${const__str__JMP}
e0 20                          # a30e |   push A
5c f8 b8 f0                    # a310 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a314 |   mov SP, SP + 0x4
                               #      | _Z_call_121:
                               #      | _A_if_109:
ec ff 00 f8 0e 00              # a318 |   jne H, 0, ${_E_if_109}:rel + PC
60 ff 1c 06                    # a31e |   mov H, 0x6
58 f8 03 01                    # a322 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_109:
                               #      | _C_if_109:
                               #      | _Z_if_109:
                               #      | _A_call_122:
e0 e0 b2 aa                    # a326 |   push ${const__str__JMP_PERSIST}
e0 20                          # a32a |   push A
5c f8 9c f0                    # a32c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a330 |   mov SP, SP + 0x4
                               #      | _Z_call_122:
                               #      | _A_if_111:
ec ff 00 f8 0e 00              # a334 |   jne H, 0, ${_E_if_111}:rel + PC
60 ff 1c 07                    # a33a |   mov H, 0x7
58 f8 e7 00                    # a33e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_111:
                               #      | _C_if_111:
                               #      | _Z_if_111:
                               #      | _A_call_123:
e0 e0 be aa                    # a342 |   push ${const__str__INIT_SD}
e0 20                          # a346 |   push A
5c f8 80 f0                    # a348 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a34c |   mov SP, SP + 0x4
                               #      | _Z_call_123:
                               #      | _A_if_113:
ec ff 00 f8 0e 00              # a350 |   jne H, 0, ${_E_if_113}:rel + PC
60 ff 1c 08                    # a356 |   mov H, 0x8
58 f8 cb 00                    # a35a |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_113:
                               #      | _C_if_113:
                               #      | _Z_if_113:
                               #      | _A_call_124:
e0 e0 c6 aa                    # a35e |   push ${const__str__READ_SD}
e0 20                          # a362 |   push A
5c f8 64 f0                    # a364 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a368 |   mov SP, SP + 0x4
                               #      | _Z_call_124:
                               #      | _A_if_115:
ec ff 00 f8 0e 00              # a36c |   jne H, 0, ${_E_if_115}:rel + PC
60 ff 1c 09                    # a372 |   mov H, 0x9
58 f8 af 00                    # a376 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_115:
                               #      | _C_if_115:
                               #      | _Z_if_115:
                               #      | _A_call_125:
e0 e0 ce aa                    # a37a |   push ${const__str__INIT_OLED}
e0 20                          # a37e |   push A
5c f8 48 f0                    # a380 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a384 |   mov SP, SP + 0x4
                               #      | _Z_call_125:
                               #      | _A_if_117:
ec ff 00 f8 0e 00              # a388 |   jne H, 0, ${_E_if_117}:rel + PC
60 ff 1c 0a                    # a38e |   mov H, 0xa
58 f8 93 00                    # a392 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_117:
                               #      | _C_if_117:
                               #      | _Z_if_117:
                               #      | _A_call_126:
e0 e0 d8 aa                    # a396 |   push ${const__str__READW}
e0 20                          # a39a |   push A
5c f8 2c f0                    # a39c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a3a0 |   mov SP, SP + 0x4
                               #      | _Z_call_126:
                               #      | _A_if_119:
ec ff 00 f8 0e 00              # a3a4 |   jne H, 0, ${_E_if_119}:rel + PC
60 ff 1c 0b                    # a3aa |   mov H, 0xb
58 f8 77 00                    # a3ae |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_119:
                               #      | _C_if_119:
                               #      | _Z_if_119:
                               #      | _A_call_127:
e0 e0 de aa                    # a3b2 |   push ${const__str__DEINIT_OLED}
e0 20                          # a3b6 |   push A
5c f8 10 f0                    # a3b8 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a3bc |   mov SP, SP + 0x4
                               #      | _Z_call_127:
                               #      | _A_if_121:
ec ff 00 f8 0e 00              # a3c0 |   jne H, 0, ${_E_if_121}:rel + PC
60 ff 1c 0c                    # a3c6 |   mov H, 0xc
58 f8 5b 00                    # a3ca |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_121:
                               #      | _C_if_121:
                               #      | _Z_if_121:
                               #      | _A_call_128:
e0 e0 ea aa                    # a3ce |   push ${const__str__WRITE_SD}
e0 20                          # a3d2 |   push A
5c f8 f4 ef                    # a3d4 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a3d8 |   mov SP, SP + 0x4
                               #      | _Z_call_128:
                               #      | _A_if_123:
ec ff 00 f8 0e 00              # a3dc |   jne H, 0, ${_E_if_123}:rel + PC
60 ff 1c 0d                    # a3e2 |   mov H, 0xd
58 f8 3f 00                    # a3e6 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_123:
                               #      | _C_if_123:
                               #      | _Z_if_123:
                               #      | _A_call_129:
e0 e0 f3 aa                    # a3ea |   push ${const__str__MMAP}
e0 20                          # a3ee |   push A
5c f8 d8 ef                    # a3f0 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a3f4 |   mov SP, SP + 0x4
                               #      | _Z_call_129:
                               #      | _A_if_125:
ec ff 00 f8 0e 00              # a3f8 |   jne H, 0, ${_E_if_125}:rel + PC
60 ff 1c 0e                    # a3fe |   mov H, 0xe
58 f8 23 00                    # a402 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_125:
                               #      | _C_if_125:
                               #      | _Z_if_125:
                               #      | _A_call_130:
e0 e0 f8 aa                    # a406 |   push ${const__str__UMAP}
e0 20                          # a40a |   push A
5c f8 bc ef                    # a40c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a410 |   mov SP, SP + 0x4
                               #      | _Z_call_130:
                               #      | _A_if_127:
ec ff 00 f8 0e 00              # a414 |   jne H, 0, ${_E_if_127}:rel + PC
60 ff 1c 0f                    # a41a |   mov H, 0xf
58 f8 07 00                    # a41e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_127:
                               #      | _C_if_127:
                               #      | _Z_if_127:
60 ff 00                       # a422 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # a425 |   pop A
dc                             # a427 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # a428 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # a81d |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
0a 90 73 91 85 92 8b 91 fa 91 50 92 37 92 a4 92 df 92 2f 93 68 93 a1 93 c8 93 1a 94 39 94 40 94 63 94 d8 91 fe 94 d0 95 12 96 31 97 ed 97 6d 98 d3 99 fa 99 89 99 12 9a b9 9a # a8dd |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12, $fn_read_sd, $fn_write_sd, $fn_init_sd, $fn_init_oled, $fn_deinit_oled, $fn_quick_deinit_oled, $fn_clear_oled, $fn_draw_char_oled, $fn_draw_str_oled]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # a917 |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # a93b |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # a941 |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # a950 |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # a95d |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # a96c |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # a97c |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # a98b |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # a996 |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__str__TIMEOUT__endl:
54 49 4d 45 4f 55 54 0a 00     # a9a8 |   .data str:"TIMEOUT\n"
                               #      | const__str__INIT_OK__endl:
49 4e 49 54 5f 4f 4b 0a 00     # a9b1 |   .data str:"INIT_OK\n"
                               #      | const__data_7:
52 45 41 44 5f 53 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # a9ba |   .data str:"READ_SD_OK %x %x\n"
                               #      | const__str__DONE__endl:
44 4f 4e 45 0a 00              # a9cc |   .data str:"DONE\n"
                               #      | const__data_8:
57 52 49 54 45 5f 53 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # a9d2 |   .data str:"WRITE_SD_OK %x %x\n"
                               #      | const__data_9:
4d 4d 41 50 5f 4f 4b 20 25 78 20 25 78 20 25 78 20 25 78 20 25 78 0a 00 # a9e5 |   .data str:"MMAP_OK %x %x %x %x %x\n"
                               #      | const__data_10:
55 4d 41 50 5f 4f 4b 20 25 78 0a 00 # a9fd |   .data str:"UMAP_OK %x\n"
                               #      | const__HANDLER_MAP:
f5 9a 2f 9b 43 9c 2f 9b 43 9c 35 9d 35 9d bb 9d e2 9d 81 9e 2f 9b 92 9e a3 9e 7b 9f da 9f # aa09 |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp, $fn_handle_init_sd, $fn_handle_read_sd, $fn_handle_init_oled, $fn_handle_read, $fn_handle_deinit_oled, $fn_handle_write_sd, $fn_handle_mmap, $fn_handle_umap]
                               #      | const__data_11:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 32 2e 30 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 33 2e 32 0a 00 # aa27 |   .data str:"Weeekly3006 - Hardware v2.0 - Bootloader v3.2\n"
                               #      | const__str__Weeekly:
57 65 65 65 6b 6c 79 00        # aa56 |   .data str:"Weeekly"
                               #      | const__data_12:
33 30 30 36 20 32 00           # aa5e |   .data str:"3006 2"
                               #      | const__str__FORCED_BOOTLOADER__endl:
46 4f 52 43 45 44 5f 42 4f 4f 54 4c 4f 41 44 45 52 0a 00 # aa65 |   .data str:"FORCED_BOOTLOADER\n"
                               #      | const__str__READY__endl:
52 45 41 44 59 0a 00           # aa78 |   .data str:"READY\n"
                               #      | const__data_13:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # aa7f |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # aa91 |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # aa96 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # aa9b |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # aaa1 |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # aaa7 |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # aaae |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # aab2 |   .data str:"JMP_PERSIST"
                               #      | const__str__INIT_SD:
49 4e 49 54 5f 53 44 00        # aabe |   .data str:"INIT_SD"
                               #      | const__str__READ_SD:
52 45 41 44 5f 53 44 00        # aac6 |   .data str:"READ_SD"
                               #      | const__str__INIT_OLED:
49 4e 49 54 5f 4f 4c 45 44 00  # aace |   .data str:"INIT_OLED"
                               #      | const__str__READW:
52 45 41 44 57 00              # aad8 |   .data str:"READW"
                               #      | const__str__DEINIT_OLED:
44 45 49 4e 49 54 5f 4f 4c 45 44 00 # aade |   .data str:"DEINIT_OLED"
                               #      | const__str__WRITE_SD:
57 52 49 54 45 5f 53 44 00     # aaea |   .data str:"WRITE_SD"
                               #      | const__str__MMAP:
4d 4d 41 50 00                 # aaf3 |   .data str:"MMAP"
                               #      | const__str__UMAP:
55 4d 41 50 00                 # aaf8 |   .data str:"UMAP"
                               #      | const__data_14:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 36 0a 00 # aafd |   .data str:"TOO_MANY_ARGS max=6\n"
                               #      | const__data_15:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # ab12 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # ab26 |   .data str:"UNKNOWN_COMMAND\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xab37
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # ab37 |   .bss size:2 align:1
                               #      | var__g_num_args:
                               # ab39 |   .bss size:2 align:1
                               # ab3b |   .align dummy_size:1 align:2
                               #      | var__g_args:
                               # ab3c |   .bss size:14 align:2
                               #      | SECTION_END_static_data:
                               #      | 
