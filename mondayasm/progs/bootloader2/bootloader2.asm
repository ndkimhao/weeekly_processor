                               #      | .config CODE_OFFSET 0x9000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 fe 8f                 # 9000 |   mov SP, 0x8ffe
                               #      | _A_call_117:
5c f8 67 0c                    # 9005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_117:
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
63 e0 bc cd a7 02              # 9439 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 943f |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 cd a7                 # 9440 |   inc H, [${var__rand__state}]
62 e0 ff cd a7                 # 9445 |   mov [${var__rand__state}], H
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
61 40 e8 16 a5                 # 95db |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_20:
e0 1c 0c                       # 95e0 |   push 0xc
e0 1c 10                       # 95e3 |   push 0x10
e0 e8 21 a1                    # 95e6 |   push ${const__FONT_16_12_COMPRESSED} + B
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
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_22:
e0 00                          # 95fa |   push 0
5c f8 15 00                    # 95fc |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9600 |   mov SP, SP + 0x2
                               #      | _Z_call_22:
                               #      | _A_call_23:
e0 e0 22 a6                    # 9604 |   push ${const__str__PONG__endl}
5c f8 d0 fb                    # 9608 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 960c |   mov SP, SP + 0x2
                               #      | _Z_call_23:
                               #      | _cleanup_fn_handle_ping:
dc                             # 9610 |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # 9611 |   inc G, 0
                               #      | _A_if_41:
eb e0 bc f8 cf a7 02 1f 00     # 9614 |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_41}:rel + PC
                               #      | _A_call_21:
e2 e0 cf a7                    # 961d |   push [${var__g_num_args}]
e2 bc 04                       # 9621 |   push [SP + 0x4]
e0 e0 fe a5                    # 9624 |   push ${const__data_1}
5c f8 e2 f9                    # 9628 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 962c |   mov SP, SP + 0x6
                               #      | _Z_call_21:
60 fe 00                       # 9630 |   mov G, 0
                               #      | _E_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
                               #      | _cleanup_fn_check_num_args:
dc                             # 9633 |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # 9634 |   push D
e0 60                          # 9636 |   push C
e0 40                          # 9638 |   push B
e0 20                          # 963a |   push A
60 a0 bc fa                    # 963c |   mov SP, SP + -6
                               #      | _A_call_24:
e0 1c 02                       # 9640 |   push 0x2
5c f8 ce ff                    # 9643 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9647 |   mov SP, SP + 0x2
                               #      | _Z_call_24:
e8 fe 00 f8 9f 00              # 964b |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_26:
5c f8 a6 00                    # 9651 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_26:
e8 fe 00 f8 95 00              # 9655 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 d2 a7                 # 965b |   mov A, [${var__g_args}]
61 40 e0 d4 a7                 # 9660 |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_27:
e0 40                          # 9665 |   push B
e0 20                          # 9667 |   push A
e0 e0 44 a6                    # 9669 |   push ${const__data_2}
5c f8 9d f9                    # 966d |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9671 |   mov SP, SP + 0x6
                               #      | _Z_call_27:
                               #      | _A_if_47:
ee bc 1c f8 10 04 35 00        # 9675 |   jne [SP + 0x10], 0x4, ${_E_if_47}:rel + PC
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 20 40 f8 29 00              # 967d |   jge A, B, ${_C_while_5}:rel + PC
61 60 20                       # 9683 |   mov C, [A]
                               #      | _A_call_28:
e0 60                          # 9686 |   push C
5c f8 eb fa                    # 9688 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 968c |   mov SP, SP + 0x2
                               #      | _Z_call_28:
20 60 1c 08                    # 9690 |   shr C, 0x8
                               #      | _A_call_29:
e0 60                          # 9694 |   push C
5c f8 dd fa                    # 9696 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 969a |   mov SP, SP + 0x2
                               #      | _Z_call_29:
60 20 3c 02                    # 969e |   mov A, A + 0x2
                               #      | _BZ_while_5:
58 f8 db ff                    # 96a2 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
58 f8 39 00                    # 96a6 |   jmp ${_C_if_47}:rel + PC
                               #      | _E_if_47:
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc 20 40 f8 35 00              # 96aa |   jge A, B, ${_C_while_6}:rel + PC
95 80 20 1c 08                 # 96b0 |   ror D, [A], 0x8
                               #      | _A_if_48:
ee bc 1c f8 10 0b 0c 00        # 96b5 |   jne [SP + 0x10], 0xb, ${_E_if_48}:rel + PC
14 80 1c 08                    # 96bd |   ror D, 0x8
                               #      | _E_if_48:
                               #      | _C_if_48:
                               #      | _Z_if_48:
                               #      | _A_call_30:
e0 a0                          # 96c1 |   push SP
e0 80                          # 96c3 |   push D
5c f8 35 fb                    # 96c5 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 96c9 |   mov SP, SP + 0x4
                               #      | _Z_call_30:
                               #      | _A_call_31:
e0 a0                          # 96cd |   push SP
5c f8 09 fb                    # 96cf |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 96d3 |   mov SP, SP + 0x2
                               #      | _Z_call_31:
60 20 3c 02                    # 96d7 |   mov A, A + 0x2
                               #      | _BZ_while_6:
58 f8 cf ff                    # 96db |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
                               #      | _C_if_47:
                               #      | _Z_if_47:
                               #      | _A_call_32:
e0 1c 0a                       # 96df |   push 0xa
5c f8 91 fa                    # 96e2 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 96e6 |   mov SP, SP + 0x2
                               #      | _Z_call_32:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # 96ea |   mov SP, SP + 0x6
e4 20                          # 96ee |   pop A
e4 40                          # 96f0 |   pop B
e4 60                          # 96f2 |   pop C
e4 80                          # 96f4 |   pop D
dc                             # 96f6 |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # 96f7 |   push C
e0 40                          # 96f9 |   push B
e0 20                          # 96fb |   push A
61 20 e0 d2 a7                 # 96fd |   mov A, [${var__g_args}]
61 40 e0 d4 a7                 # 9702 |   mov B, [${var__g_args} + 0002]
60 60 e0 28 a6                 # 9707 |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # 970c |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 37 a6                 # 9712 |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # 9717 |   and G, A, 0x1
ec fe 00 f8 18 00              # 971c |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # 9722 |   and G, B, 0x1
ec fe 00 f8 0d 00              # 9727 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # 972d |   inc G, 0
58 f8 11 00                    # 9730 |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_25:
e0 60                          # 9734 |   push C
5c f8 a2 fa                    # 9736 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 973a |   mov SP, SP + 0x2
                               #      | _Z_call_25:
60 fe 00                       # 973e |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # 9741 |   pop A
e4 40                          # 9743 |   pop B
e4 60                          # 9745 |   pop C
dc                             # 9747 |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # 9748 |   push D
e0 60                          # 974a |   push C
e0 40                          # 974c |   push B
e0 20                          # 974e |   push A
60 a0 bc fa                    # 9750 |   mov SP, SP + -6
                               #      | _A_call_33:
e0 1c 02                       # 9754 |   push 0x2
5c f8 ba fe                    # 9757 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 975b |   mov SP, SP + 0x2
                               #      | _Z_call_33:
e8 fe 00 f8 dc 00              # 975f |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_34:
5c f8 92 ff                    # 9765 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_34:
e8 fe 00 f8 d2 00              # 9769 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 d2 a7                 # 976f |   mov A, [${var__g_args}]
61 40 e0 d4 a7                 # 9774 |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_51:
ee bc 1c f8 10 03 55 00        # 9779 |   jne [SP + 0x10], 0x3, ${_E_if_51}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 49 00              # 9781 |   jge A, B, ${_C_while_7}:rel + PC
                               #      | _A_for_6:
60 80 00                       # 9787 |   mov D, 0
                               #      | _BA_for_6:
fc 80 1c f8 04 19 00           # 978a |   jge D, 0x4, ${_C_for_6}:rel + PC
                               #      | _A_call_35:
5c f8 f4 fa                    # 9791 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_35:
62 e0 ff 00 ff                 # 9795 |   mov [0xff00], H
62 b0 ff                       # 979a |   mov [SP + D], H
                               #      | _BZ_for_6:
44 80                          # 979d |   inc D
58 f8 eb ff                    # 979f |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_36:
e0 a0                          # 97a3 |   push SP
5c f8 3a fb                    # 97a5 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 97a9 |   mov SP, SP + 0x2
                               #      | _Z_call_36:
e8 fe 00 f8 7f 00              # 97ad |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # 97b3 |   shl C, H, 0x8
20 ff 1c 08                    # 97b8 |   shr H, 0x8
30 60 ff                       # 97bc |   or C, H
62 20 60                       # 97bf |   mov [A], C
60 20 3c 02                    # 97c2 |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 bb ff                    # 97c6 |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 31 00                    # 97ca |   jmp ${_C_if_51}:rel + PC
                               #      | _E_if_51:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 2d 00              # 97ce |   jge A, B, ${_C_while_8}:rel + PC
                               #      | _A_call_37:
5c f8 b1 fa                    # 97d4 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_37:
62 e0 ff 00 ff                 # 97d8 |   mov [0xff00], H
60 60 ff                       # 97dd |   mov C, H
                               #      | _A_call_38:
5c f8 a5 fa                    # 97e0 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_38:
62 e0 ff 00 ff                 # 97e4 |   mov [0xff00], H
28 ff 1c 08                    # 97e9 |   shl H, 0x8
30 60 ff                       # 97ed |   or C, H
62 20 60                       # 97f0 |   mov [A], C
60 20 3c 02                    # 97f3 |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 d7 ff                    # 97f7 |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_51:
                               #      | _Z_if_51:
                               #      | _A_call_39:
5c f8 8a fa                    # 97fb |   call ${fn_getc}:rel + PC
                               #      | _Z_call_39:
62 e0 ff 00 ff                 # 97ff |   mov [0xff00], H
                               #      | _A_scope_8:
                               #      | _B_scope_8:
e8 ff 1c f8 0a 12 00           # 9804 |   jeq H, 0xa, ${_C_scope_8}:rel + PC
e8 ff 1c f8 0d 0b 00           # 980b |   jeq H, 0xd, ${_C_scope_8}:rel + PC
58 f8 1a 00                    # 9812 |   jmp ${_L_fn_handle_write_1}:rel + PC
                               #      | _C_scope_8:
                               #      | _Z_scope_8:
                               #      | _A_call_40:
e0 40                          # 9816 |   push B
e2 e0 d2 a7                    # 9818 |   push [${var__g_args}]
e0 e0 53 a6                    # 981c |   push ${const__data_3}
5c f8 ea f7                    # 9820 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9824 |   mov SP, SP + 0x6
                               #      | _Z_call_40:
58 f8 13 00                    # 9828 |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_41:
e0 e0 63 a6                    # 982c |   push ${const__data_4}
5c f8 a8 f9                    # 9830 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9834 |   mov SP, SP + 0x2
                               #      | _Z_call_41:
60 fe 00                       # 9838 |   mov G, 0
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # 983b |   mov SP, SP + 0x6
e4 20                          # 983f |   pop A
e4 40                          # 9841 |   pop B
e4 60                          # 9843 |   pop C
e4 80                          # 9845 |   pop D
dc                             # 9847 |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
                               #      | _A_call_42:
e0 1c 01                       # 9848 |   push 0x1
5c f8 c6 fd                    # 984b |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 984f |   mov SP, SP + 0x2
                               #      | _Z_call_42:
e8 fe 00 f8 5d 00              # 9853 |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_if_56:
ee bc 1c f8 02 06 1c 00        # 9859 |   jne [SP + 0x2], 0x6, ${_E_if_56}:rel + PC
                               #      | _A_call_43:
e2 e0 d2 a7                    # 9861 |   push [${var__g_args}]
e0 e0 72 a6                    # 9865 |   push ${const__data_5}
5c f8 a1 f7                    # 9869 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 986d |   mov SP, SP + 0x4
                               #      | _Z_call_43:
5a f8 61 0f                    # 9871 |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
63 e0 e0 1c ff d2 a7           # 9875 |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_44:
e2 e0 1c ff                    # 987c |   push [0xff1c]
e0 e0 7d a6                    # 9880 |   push ${const__data_6}
5c f8 86 f7                    # 9884 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9888 |   mov SP, SP + 0x4
                               #      | _Z_call_44:
                               #      | glb_jmp_to_stored_target:
62 e0 00 0a ff                 # 988c |   mov [0xff0a], 0
60 20 00                       # 9891 |   mov A, 0
60 40 00                       # 9894 |   mov B, 0
60 60 00                       # 9897 |   mov C, 0
60 80 00                       # 989a |   mov D, 0
60 a0 00                       # 989d |   mov SP, 0
60 fc 00                       # 98a0 |   mov E, 0
60 fd 00                       # 98a3 |   mov F, 0
60 fe 00                       # 98a6 |   mov G, 0
60 ff 00                       # 98a9 |   mov H, 0
5a e0 1c ff                    # 98ac |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # 98b0 |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_handle_init_sd:
                               #      | _begin_fn_handle_init_sd:
                               #      | _A_call_48:
5c f8 27 00                    # 98b1 |   call ${fn_init_sd}:rel + PC
                               #      | _Z_call_48:
                               #      | _A_if_60:
ec fe 00 f8 16 00              # 98b5 |   jne G, 0, ${_E_if_60}:rel + PC
                               #      | _A_call_49:
e0 e0 8f a6                    # 98bb |   push ${const__str__TIMEOUT__endl}
5c f8 19 f9                    # 98bf |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 98c3 |   mov SP, SP + 0x2
                               #      | _Z_call_49:
58 f8 10 00                    # 98c7 |   jmp ${_C_if_60}:rel + PC
                               #      | _E_if_60:
                               #      | _A_call_50:
e0 e0 98 a6                    # 98cb |   push ${const__str__INIT_OK__endl}
5c f8 09 f9                    # 98cf |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 98d3 |   mov SP, SP + 0x2
                               #      | _Z_call_50:
                               #      | _C_if_60:
                               #      | _Z_if_60:
                               #      | _cleanup_fn_handle_init_sd:
dc                             # 98d7 |   ret
                               #      | _end_fn_handle_init_sd:
                               #      | 
                               #      | fn_init_sd:
                               #      | _begin_fn_init_sd:
                               #      | _A_call_46:
5c f8 09 00                    # 98d8 |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_46:
                               #      | _A_call_47:
5c f8 30 00                    # 98dc |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_47:
                               #      | _cleanup_fn_init_sd:
dc                             # 98e0 |   ret
                               #      | _end_fn_init_sd:
                               #      | 
                               #      | fn_init_sd_head:
                               #      | _begin_fn_init_sd_head:
1e e0 1c 24 ff 0c              # 98e1 |   setb [0xff24], 0xc
1e e0 1c 24 ff 1f              # 98e7 |   setb [0xff24], 0x1f
                               #      | _A_call_45:
e0 00                          # 98ed |   push 0
e0 e0 60 ea                    # 98ef |   push 0xea60
e0 00                          # 98f3 |   push 0
e0 00                          # 98f5 |   push 0
5c f8 54 fb                    # 98f7 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 98fb |   mov SP, SP + 0x8
                               #      | _Z_call_45:
1e e0 1c 24 ff 0f              # 98ff |   setb [0xff24], 0xf
1e e0 1c 24 ff 1c              # 9905 |   setb [0xff24], 0x1c
                               #      | _cleanup_fn_init_sd_head:
dc                             # 990b |   ret
                               #      | _end_fn_init_sd_head:
                               #      | 
                               #      | fn_init_sd_tail:
                               #      | _begin_fn_init_sd_tail:
e0 60                          # 990c |   push C
e0 40                          # 990e |   push B
e0 20                          # 9910 |   push A
                               #      | _A_for_7:
60 60 00                       # 9912 |   mov C, 0
                               #      | _BA_for_7:
fc 60 1c f8 0a 30 00           # 9915 |   jge C, 0xa, ${_C_for_7}:rel + PC
                               #      | _A_for_8:
60 20 00                       # 991c |   mov A, 0
                               #      | _BA_for_8:
fc 20 1c f8 ff 1a 00           # 991f |   jge A, -1, ${_C_for_8}:rel + PC
99 40 e0 1c 26 ff 09           # 9926 |   getb B, [0xff26], 0x9
e8 40 00 f8 0c 00              # 992d |   jeq B, 0, ${_C_for_8}:rel + PC
                               #      | _BZ_for_8:
44 20                          # 9933 |   inc A
58 f8 ea ff                    # 9935 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
e8 40 00 f8 0c 00              # 9939 |   jeq B, 0, ${_C_for_7}:rel + PC
                               #      | _BZ_for_7:
44 60                          # 993f |   inc C
58 f8 d4 ff                    # 9941 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
c4 fe 00                       # 9945 |   inc G, 0
                               #      | _A_if_59:
e8 40 00 f8 09 00              # 9948 |   jeq B, 0, ${_E_if_59}:rel + PC
60 fe 00                       # 994e |   mov G, 0
                               #      | _E_if_59:
                               #      | _C_if_59:
                               #      | _Z_if_59:
                               #      | _cleanup_fn_init_sd_tail:
e4 20                          # 9951 |   pop A
e4 40                          # 9953 |   pop B
e4 60                          # 9955 |   pop C
dc                             # 9957 |   ret
                               #      | _end_fn_init_sd_tail:
                               #      | 
                               #      | fn_handle_read_sd:
                               #      | _begin_fn_handle_read_sd:
e0 40                          # 9958 |   push B
e0 20                          # 995a |   push A
60 a0 f4 fe fd                 # 995c |   mov SP, 0xfdfe + SP
                               #      | _A_call_51:
e0 1c 02                       # 9961 |   push 0x2
5c f8 ad fc                    # 9964 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9968 |   mov SP, SP + 0x2
                               #      | _Z_call_51:
e8 fe 00 f8 6b 00              # 996c |   jeq G, 0, ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _A_call_52:
e2 e0 d4 a7                    # 9972 |   push [${var__g_args} + 0002]
e2 e0 d2 a7                    # 9976 |   push [${var__g_args}]
e0 bc 04                       # 997a |   push SP + 0x4
5c f8 64 00                    # 997d |   call ${fn_read_sd}:rel + PC
60 a0 bc 06                    # 9981 |   mov SP, SP + 0x6
                               #      | _Z_call_52:
                               #      | _A_if_69:
ec fe 00 f8 16 00              # 9985 |   jne G, 0, ${_E_if_69}:rel + PC
                               #      | _A_call_53:
e0 e0 8f a6                    # 998b |   push ${const__str__TIMEOUT__endl}
5c f8 49 f8                    # 998f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9993 |   mov SP, SP + 0x2
                               #      | _Z_call_53:
58 f8 40 00                    # 9997 |   jmp ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _E_if_69:
                               #      | _C_if_69:
                               #      | _Z_if_69:
60 20 ff                       # 999b |   mov A, H
                               #      | _A_call_54:
e0 20                          # 999e |   push A
e0 e0 a1 a6                    # 99a0 |   push ${const__data_7}
5c f8 66 f6                    # 99a4 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 99a8 |   mov SP, SP + 0x4
                               #      | _Z_call_54:
00 20 a0                       # 99ac |   add A, SP
                               #      | _A_for_11:
60 40 a0                       # 99af |   mov B, SP
                               #      | _BA_for_11:
fc 40 20 f8 1a 00              # 99b2 |   jge B, A, ${_C_for_11}:rel + PC
                               #      | _A_call_55:
e2 40                          # 99b8 |   push [B]
e0 e0 b0 a6                    # 99ba |   push ${const__data_8}
5c f8 4c f6                    # 99be |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 99c2 |   mov SP, SP + 0x4
                               #      | _Z_call_55:
                               #      | _BZ_for_11:
44 40                          # 99c6 |   inc B
58 f8 ea ff                    # 99c8 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
                               #      | _A_call_56:
e0 1c 0a                       # 99cc |   push 0xa
5c f8 a4 f7                    # 99cf |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 99d3 |   mov SP, SP + 0x2
                               #      | _Z_call_56:
                               #      | _cleanup_fn_handle_read_sd:
60 a0 f4 02 02                 # 99d7 |   mov SP, 0x202 + SP
e4 20                          # 99dc |   pop A
e4 40                          # 99de |   pop B
dc                             # 99e0 |   ret
                               #      | _end_fn_handle_read_sd:
                               #      | 
                               #      | fn_read_sd:
                               #      | _begin_fn_read_sd:
e0 80                          # 99e1 |   push D
e0 60                          # 99e3 |   push C
e0 40                          # 99e5 |   push B
e0 20                          # 99e7 |   push A
63 e0 bc 22 ff 0c              # 99e9 |   mov [0xff22], [SP + 0xc]
63 e0 bc 20 ff 0e              # 99ef |   mov [0xff20], [SP + 0xe]
1e e0 1c 24 ff 09              # 99f5 |   setb [0xff24], 0x9
                               #      | _A_for_9:
60 80 00                       # 99fb |   mov D, 0
                               #      | _BA_for_9:
fc 80 1c f8 ff 1a 00           # 99fe |   jge D, -1, ${_C_for_9}:rel + PC
99 40 e0 1c 26 ff 09           # 9a05 |   getb B, [0xff26], 0x9
ec 40 00 f8 0c 00              # 9a0c |   jne B, 0, ${_C_for_9}:rel + PC
                               #      | _BZ_for_9:
44 80                          # 9a12 |   inc D
58 f8 ea ff                    # 9a14 |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
e8 40 00 f8 82 00              # 9a18 |   jeq B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 19              # 9a1e |   setb [0xff24], 0x19
61 fc bc 0a                    # 9a24 |   mov E, [SP + 0xa]
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
44 80                          # 9a28 |   inc D
e8 80 1c f8 ff 70 00           # 9a2a |   jeq D, -1, ${_L_fn_read_sd_1}:rel + PC
61 60 e0 26 ff                 # 9a31 |   mov C, [0xff26]
98 20 60 1c 09                 # 9a36 |   getb A, C, 0x9
e8 20 00 f8 51 00              # 9a3b |   jeq A, 0, ${_C_loop_9}:rel + PC
98 20 60 1c 08                 # 9a41 |   getb A, C, 0x8
e8 20 00 f8 e2 ff              # 9a46 |   jeq A, 0, ${_BA_loop_9}:rel + PC
1e e0 1c 24 ff 08              # 9a4c |   setb [0xff24], 0x8
                               #      | _A_for_10:
60 80 00                       # 9a52 |   mov D, 0
                               #      | _BA_for_10:
fc 80 1c f8 ff 1a 00           # 9a55 |   jge D, -1, ${_C_for_10}:rel + PC
99 40 e0 1c 26 ff 08           # 9a5c |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # 9a63 |   jeq B, 0, ${_C_for_10}:rel + PC
                               #      | _BZ_for_10:
44 80                          # 9a69 |   inc D
58 f8 ea ff                    # 9a6b |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
ec 40 00 f8 2b 00              # 9a6f |   jne B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 18              # 9a75 |   setb [0xff24], 0x18
2c 60 e0 ff 00                 # 9a7b |   and C, 0xff
62 fc 60                       # 9a80 |   mov [E], C
44 fc                          # 9a83 |   inc E
60 80 00                       # 9a85 |   mov D, 0
                               #      | _BZ_loop_9:
58 f8 a0 ff                    # 9a88 |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
c4 fe 00                       # 9a8c |   inc G, 0
b9 ff bc 0a                    # 9a8f |   neg H, [SP + 0xa]
00 ff fc                       # 9a93 |   add H, E
58 f8 0a 00                    # 9a96 |   jmp ${_cleanup_fn_read_sd}:rel + PC
                               #      | _L_fn_read_sd_1:
60 fe 00                       # 9a9a |   mov G, 0
60 ff 00                       # 9a9d |   mov H, 0
                               #      | _cleanup_fn_read_sd:
e4 20                          # 9aa0 |   pop A
e4 40                          # 9aa2 |   pop B
e4 60                          # 9aa4 |   pop C
e4 80                          # 9aa6 |   pop D
dc                             # 9aa8 |   ret
                               #      | _end_fn_read_sd:
                               #      | 
                               #      | fn_handle_init_oled:
                               #      | _begin_fn_handle_init_oled:
                               #      | _A_call_72:
5c f8 11 00                    # 9aa9 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_72:
                               #      | _A_call_73:
e0 e0 b4 a6                    # 9aad |   push ${const__str__DONE__endl}
5c f8 27 f7                    # 9ab1 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9ab5 |   mov SP, SP + 0x2
                               #      | _Z_call_73:
                               #      | _cleanup_fn_handle_init_oled:
dc                             # 9ab9 |   ret
                               #      | _end_fn_handle_init_oled:
                               #      | 
                               #      | fn_init_oled:
                               #      | _begin_fn_init_oled:
e0 80                          # 9aba |   push D
60 80 e0 32 ff                 # 9abc |   mov D, 0xff32
62 80 00                       # 9ac1 |   mov [D], 0
1e 80 1c 0f                    # 9ac4 |   setb [D], 0xf
                               #      | _A_call_58:
5c f8 72 00                    # 9ac8 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_58:
                               #      | _A_call_60:
e0 e0 ae 00                    # 9acc |   push 0xae
5c f8 7d 00                    # 9ad0 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9ad4 |   mov SP, SP + 0x2
                               #      | _Z_call_60:
1e 80 1c 0d                    # 9ad8 |   setb [D], 0xd
                               #      | _A_call_61:
5c f8 5e 00                    # 9adc |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_61:
1e 80 1c 1d                    # 9ae0 |   setb [D], 0x1d
                               #      | _A_call_62:
5c f8 56 00                    # 9ae4 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_62:
                               #      | _A_call_64:
e0 e0 f1 00                    # 9ae8 |   push 0xf1
e0 e0 d9 00                    # 9aec |   push 0xd9
e0 1c 14                       # 9af0 |   push 0x14
e0 e0 8d 00                    # 9af3 |   push 0x8d
e0 1c 04                       # 9af7 |   push 0x4
5c f8 ae 00                    # 9afa |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0a                    # 9afe |   mov SP, SP + 0xa
                               #      | _Z_call_64:
1e 80 1c 0e                    # 9b02 |   setb [D], 0xe
                               #      | _A_call_66:
5c f8 d0 00                    # 9b06 |   call ${fn_delay_10ms}:rel + PC
                               #      | _Z_call_66:
                               #      | _A_call_67:
e0 00                          # 9b0a |   push 0
e0 1c 20                       # 9b0c |   push 0x20
e0 e0 af 00                    # 9b0f |   push 0xaf
e0 00                          # 9b13 |   push 0
e0 e0 da 00                    # 9b15 |   push 0xda
e0 e0 c0 00                    # 9b19 |   push 0xc0
e0 e0 a0 00                    # 9b1d |   push 0xa0
e0 1c 0f                       # 9b21 |   push 0xf
e0 e0 81 00                    # 9b24 |   push 0x81
e0 1c 09                       # 9b28 |   push 0x9
5c f8 7d 00                    # 9b2b |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 14                    # 9b2f |   mov SP, SP + 0x14
                               #      | _Z_call_67:
                               #      | _A_call_71:
5c f8 b7 00                    # 9b33 |   call ${fn_clear_oled}:rel + PC
                               #      | _Z_call_71:
                               #      | _cleanup_fn_init_oled:
e4 80                          # 9b37 |   pop D
dc                             # 9b39 |   ret
                               #      | _end_fn_init_oled:
                               #      | 
                               #      | fn_delay_1ms:
                               #      | _begin_fn_delay_1ms:
                               #      | _A_call_57:
e0 00                          # 9b3a |   push 0
e0 e0 60 ea                    # 9b3c |   push 0xea60
e0 00                          # 9b40 |   push 0
e0 00                          # 9b42 |   push 0
5c f8 07 f9                    # 9b44 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 9b48 |   mov SP, SP + 0x8
                               #      | _Z_call_57:
                               #      | _cleanup_fn_delay_1ms:
dc                             # 9b4c |   ret
                               #      | _end_fn_delay_1ms:
                               #      | 
                               #      | fn_send_oled_cmd:
                               #      | _begin_fn_send_oled_cmd:
                               #      | _A_call_59:
e2 bc 02                       # 9b4d |   push [SP + 0x2]
e0 00                          # 9b50 |   push 0
5c f8 09 00                    # 9b52 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9b56 |   mov SP, SP + 0x4
                               #      | _Z_call_59:
                               #      | _cleanup_fn_send_oled_cmd:
dc                             # 9b5a |   ret
                               #      | _end_fn_send_oled_cmd:
                               #      | 
                               #      | fn_send_oled_data_or_cmd:
                               #      | _begin_fn_send_oled_data_or_cmd:
e0 40                          # 9b5b |   push B
e0 20                          # 9b5d |   push A
                               #      | _A_loop_10:
                               #      | _BA_loop_10:
99 40 e0 1c 30 ff 08           # 9b5f |   getb B, [0xff30], 0x8
ec 40 00 f8 0a 00              # 9b66 |   jne B, 0, ${_C_loop_10}:rel + PC
                               #      | _BZ_loop_10:
58 f8 f3 ff                    # 9b6c |   jmp ${_BA_loop_10}:rel + PC
                               #      | _C_loop_10:
                               #      | _Z_loop_10:
ad 40 bc e0 08 ff 00           # 9b70 |   and B, [SP + 0x8], 0xff
ad 20 e0 e0 32 ff 00 ff        # 9b77 |   and A, [0xff32], 0xff00
30 20 e8 00 01                 # 9b7f |   or A, 0x100 + B
                               #      | _A_if_71:
ee bc 00 f8 06 0f 00           # 9b84 |   jne [SP + 0x6], 0, ${_E_if_71}:rel + PC
1c 20 1c 1c                    # 9b8b |   setb A, 0x1c
58 f8 08 00                    # 9b8f |   jmp ${_C_if_71}:rel + PC
                               #      | _E_if_71:
1c 20 1c 0c                    # 9b93 |   setb A, 0xc
                               #      | _C_if_71:
                               #      | _Z_if_71:
62 e0 20 32 ff                 # 9b97 |   mov [0xff32], A
9e e0 20 1c 32 ff 18           # 9b9c |   setb [0xff32], A, 0x18
                               #      | _cleanup_fn_send_oled_data_or_cmd:
e4 20                          # 9ba3 |   pop A
e4 40                          # 9ba5 |   pop B
dc                             # 9ba7 |   ret
                               #      | _end_fn_send_oled_data_or_cmd:
                               #      | 
                               #      | fn_send_oled_cmd_sequence:
                               #      | _begin_fn_send_oled_cmd_sequence:
e0 40                          # 9ba8 |   push B
e0 20                          # 9baa |   push A
60 20 bc 08                    # 9bac |   mov A, SP + 0x8
61 40 bc 06                    # 9bb0 |   mov B, [SP + 0x6]
60 40 45                       # 9bb4 |   mov B, B*2 + A
                               #      | _A_for_12:
                               #      | _BA_for_12:
fc 20 40 f8 1a 00              # 9bb7 |   jge A, B, ${_C_for_12}:rel + PC
                               #      | _A_call_63:
e2 20                          # 9bbd |   push [A]
e0 00                          # 9bbf |   push 0
5c f8 9a ff                    # 9bc1 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9bc5 |   mov SP, SP + 0x4
                               #      | _Z_call_63:
                               #      | _BZ_for_12:
60 20 3c 02                    # 9bc9 |   mov A, A + 0x2
58 f8 ea ff                    # 9bcd |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _cleanup_fn_send_oled_cmd_sequence:
e4 20                          # 9bd1 |   pop A
e4 40                          # 9bd3 |   pop B
dc                             # 9bd5 |   ret
                               #      | _end_fn_send_oled_cmd_sequence:
                               #      | 
                               #      | fn_delay_10ms:
                               #      | _begin_fn_delay_10ms:
                               #      | _A_call_65:
e0 00                          # 9bd6 |   push 0
e0 e0 c0 27                    # 9bd8 |   push 0x27c0
e0 1c 09                       # 9bdc |   push 0x9
e0 00                          # 9bdf |   push 0
5c f8 6a f8                    # 9be1 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 9be5 |   mov SP, SP + 0x8
                               #      | _Z_call_65:
                               #      | _cleanup_fn_delay_10ms:
dc                             # 9be9 |   ret
                               #      | _end_fn_delay_10ms:
                               #      | 
                               #      | fn_clear_oled:
                               #      | _begin_fn_clear_oled:
e0 20                          # 9bea |   push A
                               #      | _A_call_68:
e0 1c 03                       # 9bec |   push 0x3
e0 00                          # 9bef |   push 0
e0 1c 22                       # 9bf1 |   push 0x22
e0 1c 7f                       # 9bf4 |   push 0x7f
e0 00                          # 9bf7 |   push 0
e0 1c 21                       # 9bf9 |   push 0x21
e0 1c 06                       # 9bfc |   push 0x6
5c f8 a9 ff                    # 9bff |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # 9c03 |   mov SP, SP + 0xe
                               #      | _Z_call_68:
                               #      | _A_for_13:
60 20 00                       # 9c07 |   mov A, 0
                               #      | _BA_for_13:
fc 20 e0 f8 00 02 18 00        # 9c0a |   jge A, 0x200, ${_C_for_13}:rel + PC
                               #      | _A_call_70:
e0 00                          # 9c12 |   push 0
5c f8 11 00                    # 9c14 |   call ${fn_send_oled_data}:rel + PC
60 a0 bc 02                    # 9c18 |   mov SP, SP + 0x2
                               #      | _Z_call_70:
                               #      | _BZ_for_13:
44 20                          # 9c1c |   inc A
58 f8 ec ff                    # 9c1e |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
                               #      | _cleanup_fn_clear_oled:
e4 20                          # 9c22 |   pop A
dc                             # 9c24 |   ret
                               #      | _end_fn_clear_oled:
                               #      | 
                               #      | fn_send_oled_data:
                               #      | _begin_fn_send_oled_data:
                               #      | _A_call_69:
e2 bc 02                       # 9c25 |   push [SP + 0x2]
e0 1c 01                       # 9c28 |   push 0x1
5c f8 30 ff                    # 9c2b |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9c2f |   mov SP, SP + 0x4
                               #      | _Z_call_69:
                               #      | _cleanup_fn_send_oled_data:
dc                             # 9c33 |   ret
                               #      | _end_fn_send_oled_data:
                               #      | 
                               #      | fn_handle_deinit_oled:
                               #      | _begin_fn_handle_deinit_oled:
                               #      | _A_call_76:
5c f8 11 00                    # 9c34 |   call ${fn_deinit_oled}:rel + PC
                               #      | _Z_call_76:
                               #      | _A_call_77:
e0 e0 b4 a6                    # 9c38 |   push ${const__str__DONE__endl}
5c f8 9c f5                    # 9c3c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9c40 |   mov SP, SP + 0x2
                               #      | _Z_call_77:
                               #      | _cleanup_fn_handle_deinit_oled:
dc                             # 9c44 |   ret
                               #      | _end_fn_handle_deinit_oled:
                               #      | 
                               #      | fn_deinit_oled:
                               #      | _begin_fn_deinit_oled:
e0 80                          # 9c45 |   push D
60 80 e0 32 ff                 # 9c47 |   mov D, 0xff32
                               #      | _A_call_74:
e0 e0 ae 00                    # 9c4c |   push 0xae
5c f8 fd fe                    # 9c50 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9c54 |   mov SP, SP + 0x2
                               #      | _Z_call_74:
1e 80 1c 1e                    # 9c58 |   setb [D], 0x1e
                               #      | _A_call_75:
5c f8 7a ff                    # 9c5c |   call ${fn_delay_10ms}:rel + PC
                               #      | _Z_call_75:
1e 80 1c 1f                    # 9c60 |   setb [D], 0x1f
62 e0 00 32 ff                 # 9c64 |   mov [0xff32], 0
                               #      | _cleanup_fn_deinit_oled:
e4 80                          # 9c69 |   pop D
dc                             # 9c6b |   ret
                               #      | _end_fn_deinit_oled:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # 9c6c |   push B
e0 20                          # 9c6e |   push A
60 20 e0 fd 00                 # 9c70 |   mov A, 0xfd
60 40 00                       # 9c75 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # 9c78 |   mmap 0xff00, -1, 0x2
62 e0 e0 1e ff 8b 9d           # 9c80 |   mov [0xff1e], ${fn_syscall_entry}
                               #      | _A_call_79:
5c f8 18 01                    # 9c87 |   call ${fn_quick_deinit_oled}:rel + PC
                               #      | _Z_call_79:
                               #      | _A_call_80:
e0 e0 d2 a6                    # 9c8b |   push ${const__data_9}
5c f8 49 f5                    # 9c8f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9c93 |   mov SP, SP + 0x2
                               #      | _Z_call_80:
61 20 e0 1c ff                 # 9c97 |   mov A, [0xff1c]
                               #      | _A_scope_9:
                               #      | _B_scope_9:
e8 20 00 f8 40 00              # 9c9c |   jeq A, 0, ${_C_scope_9}:rel + PC
e8 20 e0 f8 00 90 3a 00        # 9ca2 |   jeq A, 0x9000, ${_C_scope_9}:rel + PC
61 40 e0 0c ff                 # 9caa |   mov B, [0xff0c]
2c 40 e0 00 01                 # 9caf |   and B, 0x100
                               #      | _A_if_75:
e8 40 00 f8 16 00              # 9cb4 |   jeq B, 0, ${_E_if_75}:rel + PC
                               #      | _A_call_81:
e0 e0 01 a7                    # 9cba |   push ${const__str__FORCED_BOOTLOADER__endl}
5c f8 4c f3                    # 9cbe |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # 9cc2 |   mov SP, SP + 0x2
                               #      | _Z_call_81:
58 f8 16 00                    # 9cc6 |   jmp ${_C_scope_9}:rel + PC
                               #      | _E_if_75:
                               #      | _C_if_75:
                               #      | _Z_if_75:
                               #      | _A_call_82:
e0 20                          # 9cca |   push A
e0 e0 72 a6                    # 9ccc |   push ${const__data_5}
5c f8 3a f3                    # 9cd0 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9cd4 |   mov SP, SP + 0x4
                               #      | _Z_call_82:
58 f8 b4 fb                    # 9cd8 |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_9:
                               #      | _Z_scope_9:
                               #      | _A_call_83:
5c f8 05 fc                    # 9cdc |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_83:
                               #      | _A_call_84:
5c f8 da fd                    # 9ce0 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_84:
                               #      | _A_call_89:
e0 e0 14 a7                    # 9ce4 |   push ${const__str__Weeekly}
e0 00                          # 9ce8 |   push 0
e0 00                          # 9cea |   push 0
5c f8 cb 00                    # 9cec |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # 9cf0 |   mov SP, SP + 0x6
                               #      | _Z_call_89:
                               #      | _A_call_90:
e0 e0 1c a7                    # 9cf4 |   push ${const__str__3006}
e0 00                          # 9cf8 |   push 0
e0 1c 01                       # 9cfa |   push 0x1
5c f8 ba 00                    # 9cfd |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # 9d01 |   mov SP, SP + 0x6
                               #      | _Z_call_90:
                               #      | _A_call_91:
5c f8 07 fc                    # 9d05 |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_91:
60 ff 1c 73                    # 9d09 |   mov H, 0x73
                               #      | _A_if_77:
ec fe 00 f8 0a 00              # 9d0d |   jne G, 0, ${_E_if_77}:rel + PC
60 ff 1c 2d                    # 9d13 |   mov H, 0x2d
                               #      | _E_if_77:
                               #      | _C_if_77:
                               #      | _Z_if_77:
                               #      | _A_call_92:
e0 ff                          # 9d17 |   push H
e0 1c 06                       # 9d19 |   push 0x6
e0 1c 01                       # 9d1c |   push 0x1
5c f8 d4 00                    # 9d1f |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 9d23 |   mov SP, SP + 0x6
                               #      | _Z_call_92:
                               #      | _A_call_93:
e0 e0 21 a7                    # 9d27 |   push ${const__str__READY__endl}
5c f8 ad f4                    # 9d2b |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9d2f |   mov SP, SP + 0x2
                               #      | _Z_call_93:
                               #      | _A_call_94:
e0 1c 52                       # 9d33 |   push 0x52
e0 1c 07                       # 9d36 |   push 0x7
e0 1c 01                       # 9d39 |   push 0x1
5c f8 b7 00                    # 9d3c |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 9d40 |   mov SP, SP + 0x6
                               #      | _Z_call_94:
c6 e0 00 0a ff                 # 9d44 |   inc [0xff0a], 0
                               #      | _A_loop_12:
                               #      | _BA_loop_12:
                               #      | _A_call_115:
5c f8 51 01                    # 9d49 |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_115:
46 e0 0a ff                    # 9d4d |   inc [0xff0a]
60 20 ff                       # 9d51 |   mov A, H
                               #      | _A_if_111:
ec fe 00 f8 0a 00              # 9d54 |   jne G, 0, ${_E_if_111}:rel + PC
58 f8 ef ff                    # 9d5a |   jmp ${_BA_loop_12}:rel + PC
                               #      | _E_if_111:
                               #      | _C_if_111:
                               #      | _Z_if_111:
                               #      | _A_if_112:
ec 20 00 f8 16 00              # 9d5e |   jne A, 0, ${_E_if_112}:rel + PC
                               #      | _A_call_116:
e0 e0 bc a7                    # 9d64 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 70 f4                    # 9d68 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9d6c |   mov SP, SP + 0x2
                               #      | _Z_call_116:
58 f8 d9 ff                    # 9d70 |   jmp ${_BA_loop_12}:rel + PC
                               #      | _E_if_112:
                               #      | _C_if_112:
                               #      | _Z_if_112:
60 40 21                       # 9d74 |   mov B, A*2
60 40 e8 b8 a6                 # 9d77 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # 9d7c |   push A
5e 40                          # 9d7e |   call [B]
e4 20                          # 9d80 |   pop A
                               #      | _BZ_loop_12:
58 f8 c7 ff                    # 9d82 |   jmp ${_BA_loop_12}:rel + PC
                               #      | _C_loop_12:
                               #      | _Z_loop_12:
                               #      | _cleanup_fn_main:
e4 20                          # 9d86 |   pop A
e4 40                          # 9d88 |   pop B
dc                             # 9d8a |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_72:
f0 ff 1c f8 14 08 00           # 9d8b |   jlt H, 0x14, ${_E_if_72}:rel + PC
dc                             # 9d92 |   ret
                               #      | _E_if_72:
                               #      | _C_if_72:
                               #      | _Z_if_72:
28 ff 1c 01                    # 9d93 |   shl H, 0x1
00 ff e0 d6 a5                 # 9d97 |   add H, ${const__SYSCALL_MAP}
5a ff                          # 9d9c |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # 9d9e |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_quick_deinit_oled:
                               #      | _begin_fn_quick_deinit_oled:
1e e0 1c 32 ff 0f              # 9d9f |   setb [0xff32], 0xf
                               #      | _A_call_78:
e0 e0 ae 00                    # 9da5 |   push 0xae
5c f8 a4 fd                    # 9da9 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9dad |   mov SP, SP + 0x2
                               #      | _Z_call_78:
62 e0 00 32 ff                 # 9db1 |   mov [0xff32], 0
                               #      | _cleanup_fn_quick_deinit_oled:
dc                             # 9db6 |   ret
                               #      | _end_fn_quick_deinit_oled:
                               #      | 
                               #      | fn_draw_str_oled:
                               #      | _begin_fn_draw_str_oled:
e0 80                          # 9db7 |   push D
e0 60                          # 9db9 |   push C
e0 40                          # 9dbb |   push B
e0 20                          # 9dbd |   push A
61 60 bc 0a                    # 9dbf |   mov C, [SP + 0xa]
61 80 bc 0c                    # 9dc3 |   mov D, [SP + 0xc]
61 20 bc 0e                    # 9dc7 |   mov A, [SP + 0xe]
                               #      | _A_loop_11:
                               #      | _BA_loop_11:
65 40 20                       # 9dcb |   bmov B, [A]
e8 40 00 f8 1c 00              # 9dce |   jeq B, 0, ${_C_loop_11}:rel + PC
                               #      | _A_call_88:
e0 40                          # 9dd4 |   push B
e0 80                          # 9dd6 |   push D
e0 60                          # 9dd8 |   push C
5c f8 19 00                    # 9dda |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # 9dde |   mov SP, SP + 0x6
                               #      | _Z_call_88:
44 20                          # 9de2 |   inc A
44 80                          # 9de4 |   inc D
                               #      | _BZ_loop_11:
58 f8 e5 ff                    # 9de6 |   jmp ${_BA_loop_11}:rel + PC
                               #      | _C_loop_11:
                               #      | _Z_loop_11:
                               #      | _cleanup_fn_draw_str_oled:
e4 20                          # 9dea |   pop A
e4 40                          # 9dec |   pop B
e4 60                          # 9dee |   pop C
e4 80                          # 9df0 |   pop D
dc                             # 9df2 |   ret
                               #      | _end_fn_draw_str_oled:
                               #      | 
                               #      | fn_draw_char_oled:
                               #      | _begin_fn_draw_char_oled:
e0 80                          # 9df3 |   push D
e0 60                          # 9df5 |   push C
e0 40                          # 9df7 |   push B
e0 20                          # 9df9 |   push A
60 a0 bc e0                    # 9dfb |   mov SP, SP + -32
                               #      | _A_call_85:
e2 bc 2e                       # 9dff |   push [SP + 0x2e]
e0 bc 02                       # 9e02 |   push SP + 0x2
5c f8 b3 f7                    # 9e05 |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # 9e09 |   mov SP, SP + 0x4
                               #      | _Z_call_85:
ad 20 bc 1c 2a 01              # 9e0d |   and A, [SP + 0x2a], 0x1
ad 40 bc 1c 2c 07              # 9e13 |   and B, [SP + 0x2c], 0x7
28 40 1c 04                    # 9e19 |   shl B, 0x4
                               #      | _A_call_86:
e0 3d 01                       # 9e1d |   push A*2 + 0x1
e0 21                          # 9e20 |   push A*2
e0 1c 22                       # 9e22 |   push 0x22
e0 5c 0f                       # 9e25 |   push B + 0xf
e0 40                          # 9e28 |   push B
e0 1c 21                       # 9e2a |   push 0x21
e0 1c 06                       # 9e2d |   push 0x6
5c f8 78 fd                    # 9e30 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # 9e34 |   mov SP, SP + 0xe
                               #      | _Z_call_86:
                               #      | _A_for_14:
60 20 00                       # 9e38 |   mov A, 0
                               #      | _BA_for_14:
fc 20 1c f8 10 52 00           # 9e3b |   jge A, 0x10, ${_C_for_14}:rel + PC
80 60 21 a0                    # 9e42 |   add C, A*2, SP
                               #      | _A_for_15:
e0 20                          # 9e46 |   push A
60 40 00                       # 9e48 |   mov B, 0
                               #      | _BA_for_15:
fc 40 1c f8 10 38 00           # 9e4b |   jge B, 0x10, ${_C_for_15}:rel + PC
60 20 00                       # 9e52 |   mov A, 0
                               #      | _A_for_16:
60 80 1c 07                    # 9e55 |   mov D, 0x7
                               #      | _BA_for_16:
e8 80 1c f8 ff 17 00           # 9e59 |   jeq D, -1, ${_C_for_16}:rel + PC
99 fe 8d 40                    # 9e60 |   getb G, [D*2 + C], B
40 fe                          # 9e64 |   bool G
b0 20 21 fe                    # 9e66 |   or A, A*2, G
                               #      | _BZ_for_16:
48 80                          # 9e6a |   dec D
58 f8 ed ff                    # 9e6c |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
                               #      | _Z_for_16:
                               #      | _A_call_87:
e0 20                          # 9e70 |   push A
e0 1c 01                       # 9e72 |   push 0x1
5c f8 e6 fc                    # 9e75 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9e79 |   mov SP, SP + 0x4
                               #      | _Z_call_87:
                               #      | _BZ_for_15:
44 40                          # 9e7d |   inc B
58 f8 cc ff                    # 9e7f |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
e4 20                          # 9e83 |   pop A
                               #      | _Z_for_15:
                               #      | _BZ_for_14:
60 20 3c 08                    # 9e85 |   mov A, A + 0x8
58 f8 b2 ff                    # 9e89 |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
                               #      | _Z_for_14:
                               #      | _cleanup_fn_draw_char_oled:
60 a0 bc 20                    # 9e8d |   mov SP, SP + 0x20
e4 20                          # 9e91 |   pop A
e4 40                          # 9e93 |   pop B
e4 60                          # 9e95 |   pop C
e4 80                          # 9e97 |   pop D
dc                             # 9e99 |   ret
                               #      | _end_fn_draw_char_oled:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # 9e9a |   push D
e0 60                          # 9e9c |   push C
e0 40                          # 9e9e |   push B
e0 20                          # 9ea0 |   push A
60 a0 bc fe                    # 9ea2 |   mov SP, SP + -2
62 a0 00                       # 9ea6 |   mov [SP], 0
60 a0 bc de                    # 9ea9 |   mov SP, SP + -34
62 a0 00                       # 9ead |   mov [SP], 0
60 20 a0                       # 9eb0 |   mov A, SP
                               #      | _A_loop_13:
                               #      | _BA_loop_13:
                               #      | _A_call_95:
5c f8 d2 f3                    # 9eb3 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_95:
60 60 ff                       # 9eb7 |   mov C, H
62 e0 60 00 ff                 # 9eba |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # 9ebf |   jeq C, 0xa, ${_C_loop_13}:rel + PC
e8 60 1c f8 0d 29 00           # 9ec6 |   jeq C, 0xd, ${_C_loop_13}:rel + PC
                               #      | _A_if_80:
f0 20 bc f8 1f 19 00           # 9ecd |   jlt A, SP + 0x1f, ${_E_if_80}:rel + PC
                               #      | _A_call_96:
e0 e0 28 a7                    # 9ed4 |   push ${const__data_10}
5c f8 00 f3                    # 9ed8 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9edc |   mov SP, SP + 0x2
                               #      | _Z_call_96:
e8 ff 00 f8 d3 00              # 9ee0 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_80:
                               #      | _C_if_80:
                               #      | _Z_if_80:
62 20 60                       # 9ee6 |   mov [A], C
44 20                          # 9ee9 |   inc A
                               #      | _BZ_loop_13:
58 f8 c8 ff                    # 9eeb |   jmp ${_BA_loop_13}:rel + PC
                               #      | _C_loop_13:
                               #      | _Z_loop_13:
                               #      | _A_call_97:
e0 1c 20                       # 9eef |   push 0x20
e0 bc 02                       # 9ef2 |   push SP + 0x2
5c f8 25 f5                    # 9ef5 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # 9ef9 |   mov SP, SP + 0x4
                               #      | _Z_call_97:
60 60 ff                       # 9efd |   mov C, H
                               #      | _A_if_82:
e8 60 00 f8 0f 00              # 9f00 |   jeq C, 0, ${_E_if_82}:rel + PC
66 60 00                       # 9f06 |   bmov [C], 0
44 60                          # 9f09 |   inc C
58 f8 08 00                    # 9f0b |   jmp ${_C_if_82}:rel + PC
                               #      | _E_if_82:
60 60 1c ff                    # 9f0f |   mov C, -1
                               #      | _C_if_82:
                               #      | _Z_if_82:
                               #      | _A_call_110:
e0 a0                          # 9f13 |   push SP
5c f8 b1 00                    # 9f15 |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # 9f19 |   mov SP, SP + 0x2
                               #      | _Z_call_110:
e8 ff 00 f8 9c 00              # 9f1d |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # 9f23 |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 cf a7                 # 9f27 |   mov [${var__g_num_args}], 0
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 60 bc f8 20 7c 00           # 9f2c |   jge C, SP + 0x20, ${_C_while_9}:rel + PC
                               #      | _A_call_111:
e0 1c 20                       # 9f33 |   push 0x20
e0 60                          # 9f36 |   push C
5c f8 e2 f4                    # 9f38 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # 9f3c |   mov SP, SP + 0x4
                               #      | _Z_call_111:
60 80 ff                       # 9f40 |   mov D, H
                               #      | _A_if_108:
e8 80 00 f8 0d 00              # 9f43 |   jeq D, 0, ${_E_if_108}:rel + PC
66 80 00                       # 9f49 |   bmov [D], 0
58 f8 08 00                    # 9f4c |   jmp ${_C_if_108}:rel + PC
                               #      | _E_if_108:
60 80 1c fe                    # 9f50 |   mov D, -2
                               #      | _C_if_108:
                               #      | _Z_if_108:
61 20 e0 cf a7                 # 9f54 |   mov A, [${var__g_num_args}]
                               #      | _A_if_109:
f0 20 1c f8 04 17 00           # 9f59 |   jlt A, 0x4, ${_E_if_109}:rel + PC
                               #      | _A_call_112:
e0 e0 93 a7                    # 9f60 |   push ${const__data_11}
5c f8 74 f2                    # 9f64 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9f68 |   mov SP, SP + 0x2
                               #      | _Z_call_112:
58 f8 47 00                    # 9f6c |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_109:
                               #      | _C_if_109:
                               #      | _Z_if_109:
                               #      | _A_call_113:
e0 60                          # 9f70 |   push C
5c f8 6d f3                    # 9f72 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9f76 |   mov SP, SP + 0x2
                               #      | _Z_call_113:
                               #      | _A_if_110:
ec fe 00 f8 18 00              # 9f7a |   jne G, 0, ${_E_if_110}:rel + PC
                               #      | _A_call_114:
e0 20                          # 9f80 |   push A
e0 e0 a8 a7                    # 9f82 |   push ${const__data_12}
5c f8 84 f0                    # 9f86 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9f8a |   mov SP, SP + 0x4
                               #      | _Z_call_114:
58 f8 25 00                    # 9f8e |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_110:
                               #      | _C_if_110:
                               #      | _Z_if_110:
a8 40 20 1c 01                 # 9f92 |   shl B, A, 0x1
62 e8 ff d2 a7                 # 9f97 |   mov [${var__g_args} + B], H
c6 e0 20 cf a7                 # 9f9c |   inc [${var__g_num_args}], A
c4 60 80                       # 9fa1 |   inc C, D
                               #      | _BZ_while_9:
58 f8 88 ff                    # 9fa4 |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
c4 fe 00                       # 9fa8 |   inc G, 0
61 ff bc 22                    # 9fab |   mov H, [SP + 0x22]
58 f8 0a 00                    # 9faf |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # 9fb3 |   mov G, 0
60 ff 00                       # 9fb6 |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # 9fb9 |   mov SP, SP + 0x24
e4 20                          # 9fbd |   pop A
e4 40                          # 9fbf |   pop B
e4 60                          # 9fc1 |   pop C
e4 80                          # 9fc3 |   pop D
dc                             # 9fc5 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # 9fc6 |   push A
61 20 bc 04                    # 9fc8 |   mov A, [SP + 0x4]
                               #      | _A_call_98:
e0 e0 3a a7                    # 9fcc |   push ${const__str__PING}
e0 20                          # 9fd0 |   push A
5c f8 f6 f3                    # 9fd2 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9fd6 |   mov SP, SP + 0x4
                               #      | _Z_call_98:
                               #      | _A_if_84:
ec ff 00 f8 0d 00              # 9fda |   jne H, 0, ${_E_if_84}:rel + PC
c4 ff 00                       # 9fe0 |   inc H, 0
58 f8 3b 01                    # 9fe3 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_84:
                               #      | _C_if_84:
                               #      | _Z_if_84:
                               #      | _A_call_99:
e0 e0 3f a7                    # 9fe7 |   push ${const__str__READ}
e0 20                          # 9feb |   push A
5c f8 db f3                    # 9fed |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9ff1 |   mov SP, SP + 0x4
                               #      | _Z_call_99:
                               #      | _A_if_86:
ec ff 00 f8 0e 00              # 9ff5 |   jne H, 0, ${_E_if_86}:rel + PC
60 ff 1c 02                    # 9ffb |   mov H, 0x2
58 f8 1f 01                    # 9fff |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_86:
                               #      | _C_if_86:
                               #      | _Z_if_86:
                               #      | _A_call_100:
e0 e0 44 a7                    # a003 |   push ${const__str__WRITE}
e0 20                          # a007 |   push A
5c f8 bf f3                    # a009 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a00d |   mov SP, SP + 0x4
                               #      | _Z_call_100:
                               #      | _A_if_88:
ec ff 00 f8 0e 00              # a011 |   jne H, 0, ${_E_if_88}:rel + PC
60 ff 1c 03                    # a017 |   mov H, 0x3
58 f8 03 01                    # a01b |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_88:
                               #      | _C_if_88:
                               #      | _Z_if_88:
                               #      | _A_call_101:
e0 e0 4a a7                    # a01f |   push ${const__str__READB}
e0 20                          # a023 |   push A
5c f8 a3 f3                    # a025 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a029 |   mov SP, SP + 0x4
                               #      | _Z_call_101:
                               #      | _A_if_90:
ec ff 00 f8 0e 00              # a02d |   jne H, 0, ${_E_if_90}:rel + PC
60 ff 1c 04                    # a033 |   mov H, 0x4
58 f8 e7 00                    # a037 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_90:
                               #      | _C_if_90:
                               #      | _Z_if_90:
                               #      | _A_call_102:
e0 e0 50 a7                    # a03b |   push ${const__str__WRITEB}
e0 20                          # a03f |   push A
5c f8 87 f3                    # a041 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a045 |   mov SP, SP + 0x4
                               #      | _Z_call_102:
                               #      | _A_if_92:
ec ff 00 f8 0e 00              # a049 |   jne H, 0, ${_E_if_92}:rel + PC
60 ff 1c 05                    # a04f |   mov H, 0x5
58 f8 cb 00                    # a053 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_92:
                               #      | _C_if_92:
                               #      | _Z_if_92:
                               #      | _A_call_103:
e0 e0 57 a7                    # a057 |   push ${const__str__JMP}
e0 20                          # a05b |   push A
5c f8 6b f3                    # a05d |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a061 |   mov SP, SP + 0x4
                               #      | _Z_call_103:
                               #      | _A_if_94:
ec ff 00 f8 0e 00              # a065 |   jne H, 0, ${_E_if_94}:rel + PC
60 ff 1c 06                    # a06b |   mov H, 0x6
58 f8 af 00                    # a06f |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_94:
                               #      | _C_if_94:
                               #      | _Z_if_94:
                               #      | _A_call_104:
e0 e0 5b a7                    # a073 |   push ${const__str__JMP_PERSIST}
e0 20                          # a077 |   push A
5c f8 4f f3                    # a079 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a07d |   mov SP, SP + 0x4
                               #      | _Z_call_104:
                               #      | _A_if_96:
ec ff 00 f8 0e 00              # a081 |   jne H, 0, ${_E_if_96}:rel + PC
60 ff 1c 07                    # a087 |   mov H, 0x7
58 f8 93 00                    # a08b |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_96:
                               #      | _C_if_96:
                               #      | _Z_if_96:
                               #      | _A_call_105:
e0 e0 67 a7                    # a08f |   push ${const__str__INIT_SD}
e0 20                          # a093 |   push A
5c f8 33 f3                    # a095 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a099 |   mov SP, SP + 0x4
                               #      | _Z_call_105:
                               #      | _A_if_98:
ec ff 00 f8 0e 00              # a09d |   jne H, 0, ${_E_if_98}:rel + PC
60 ff 1c 08                    # a0a3 |   mov H, 0x8
58 f8 77 00                    # a0a7 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_98:
                               #      | _C_if_98:
                               #      | _Z_if_98:
                               #      | _A_call_106:
e0 e0 6f a7                    # a0ab |   push ${const__str__READ_SD}
e0 20                          # a0af |   push A
5c f8 17 f3                    # a0b1 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a0b5 |   mov SP, SP + 0x4
                               #      | _Z_call_106:
                               #      | _A_if_100:
ec ff 00 f8 0e 00              # a0b9 |   jne H, 0, ${_E_if_100}:rel + PC
60 ff 1c 09                    # a0bf |   mov H, 0x9
58 f8 5b 00                    # a0c3 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_100:
                               #      | _C_if_100:
                               #      | _Z_if_100:
                               #      | _A_call_107:
e0 e0 77 a7                    # a0c7 |   push ${const__str__INIT_OLED}
e0 20                          # a0cb |   push A
5c f8 fb f2                    # a0cd |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a0d1 |   mov SP, SP + 0x4
                               #      | _Z_call_107:
                               #      | _A_if_102:
ec ff 00 f8 0e 00              # a0d5 |   jne H, 0, ${_E_if_102}:rel + PC
60 ff 1c 0a                    # a0db |   mov H, 0xa
58 f8 3f 00                    # a0df |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_102:
                               #      | _C_if_102:
                               #      | _Z_if_102:
                               #      | _A_call_108:
e0 e0 81 a7                    # a0e3 |   push ${const__str__READW}
e0 20                          # a0e7 |   push A
5c f8 df f2                    # a0e9 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a0ed |   mov SP, SP + 0x4
                               #      | _Z_call_108:
                               #      | _A_if_104:
ec ff 00 f8 0e 00              # a0f1 |   jne H, 0, ${_E_if_104}:rel + PC
60 ff 1c 0b                    # a0f7 |   mov H, 0xb
58 f8 23 00                    # a0fb |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_104:
                               #      | _C_if_104:
                               #      | _Z_if_104:
                               #      | _A_call_109:
e0 e0 87 a7                    # a0ff |   push ${const__str__DEINIT_OLED}
e0 20                          # a103 |   push A
5c f8 c3 f2                    # a105 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a109 |   mov SP, SP + 0x4
                               #      | _Z_call_109:
                               #      | _A_if_106:
ec ff 00 f8 0e 00              # a10d |   jne H, 0, ${_E_if_106}:rel + PC
60 ff 1c 0c                    # a113 |   mov H, 0xc
58 f8 07 00                    # a117 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_106:
                               #      | _C_if_106:
                               #      | _Z_if_106:
60 ff 00                       # a11b |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # a11e |   pop A
dc                             # a120 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # a121 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # a516 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
0a 90 73 91 85 92 8b 91 fa 91 50 92 37 92 a4 92 df 92 2f 93 68 93 a1 93 c8 93 1a 94 39 94 40 94 4b 94 d8 91 e6 94 b8 95 # a5d6 |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # a5fe |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # a622 |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # a628 |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # a637 |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # a644 |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # a653 |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # a663 |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # a672 |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # a67d |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__str__TIMEOUT__endl:
54 49 4d 45 4f 55 54 0a 00     # a68f |   .data str:"TIMEOUT\n"
                               #      | const__str__INIT_OK__endl:
49 4e 49 54 5f 4f 4b 0a 00     # a698 |   .data str:"INIT_OK\n"
                               #      | const__data_7:
72 65 61 64 20 25 64 20 62 79 74 65 73 0a 00 # a6a1 |   .data str:"read %d bytes\n"
                               #      | const__data_8:
25 68 20 00                    # a6b0 |   .data str:"%h "
                               #      | const__str__DONE__endl:
44 4f 4e 45 0a 00              # a6b4 |   .data str:"DONE\n"
                               #      | const__HANDLER_MAP:
fa 95 34 96 48 97 34 96 48 97 48 98 48 98 b1 98 58 99 a9 9a 34 96 34 9c # a6ba |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp, $fn_handle_init_sd, $fn_handle_read_sd, $fn_handle_init_oled, $fn_handle_read, $fn_handle_deinit_oled]
                               #      | const__data_9:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 34 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 33 0a 00 # a6d2 |   .data str:"Weeekly3006 - Hardware v1.4 - Bootloader v2.3\n"
                               #      | const__str__FORCED_BOOTLOADER__endl:
46 4f 52 43 45 44 5f 42 4f 4f 54 4c 4f 41 44 45 52 0a 00 # a701 |   .data str:"FORCED_BOOTLOADER\n"
                               #      | const__str__Weeekly:
57 65 65 65 6b 6c 79 00        # a714 |   .data str:"Weeekly"
                               #      | const__str__3006:
33 30 30 36 00                 # a71c |   .data str:"3006"
                               #      | const__str__READY__endl:
52 45 41 44 59 0a 00           # a721 |   .data str:"READY\n"
                               #      | const__data_10:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # a728 |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # a73a |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # a73f |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # a744 |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # a74a |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # a750 |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # a757 |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # a75b |   .data str:"JMP_PERSIST"
                               #      | const__str__INIT_SD:
49 4e 49 54 5f 53 44 00        # a767 |   .data str:"INIT_SD"
                               #      | const__str__READ_SD:
52 45 41 44 5f 53 44 00        # a76f |   .data str:"READ_SD"
                               #      | const__str__INIT_OLED:
49 4e 49 54 5f 4f 4c 45 44 00  # a777 |   .data str:"INIT_OLED"
                               #      | const__str__READW:
52 45 41 44 57 00              # a781 |   .data str:"READW"
                               #      | const__str__DEINIT_OLED:
44 45 49 4e 49 54 5f 4f 4c 45 44 00 # a787 |   .data str:"DEINIT_OLED"
                               #      | const__data_11:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 34 0a 00 # a793 |   .data str:"TOO_MANY_ARGS max=4\n"
                               #      | const__data_12:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # a7a8 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # a7bc |   .data str:"UNKNOWN_COMMAND\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa7cd
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # a7cd |   .bss size:2 align:1
                               #      | var__g_num_args:
                               # a7cf |   .bss size:2 align:1
                               # a7d1 |   .align dummy_size:1 align:2
                               #      | var__g_args:
                               # a7d2 |   .bss size:10 align:2
                               #      | SECTION_END_static_data:
                               #      | 
