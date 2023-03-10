                               #      | .config CODE_OFFSET 0x9000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 fe 8f                 # 9000 |   mov SP, 0x8ffe
                               #      | _A_call_74:
5c f8 4a 0a                    # 9005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_74:
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
e8 60 00 f8 2a 01              # 9021 |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # 9027 |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # 902e |   push C
5c f8 28 01                    # 9030 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9034 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 0d 01                    # 9038 |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # 903c |   inc A
65 60 20                       # 903e |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # 9041 |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 04 01                    # 9047 |   jmp ${_C_for_1}:rel + PC
58 f8 f6 00                    # 904b |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 25 1a 00           # 904f |   jne C, 0x25, ${_E2_if_4}:rel + PC
                               #      | _A_call_2:
e0 1c 25                       # 9056 |   push 0x25
5c f8 ff 00                    # 9059 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 905d |   mov SP, SP + 0x2
                               #      | _Z_call_2:
58 f8 e4 00                    # 9061 |   jmp ${_BZ_for_1}:rel + PC
58 f8 dc 00                    # 9065 |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 64 21 00           # 9069 |   jne C, 0x64, ${_E3_if_4}:rel + PC
                               #      | _A_call_3:
e0 a0                          # 9070 |   push SP
e2 40                          # 9072 |   push [B]
5c f8 fc 00                    # 9074 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # 9078 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 a0                          # 907c |   push SP
5c f8 3f 01                    # 907e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9082 |   mov SP, SP + 0x2
                               #      | _Z_call_5:
58 f8 bb 00                    # 9086 |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 78 21 00           # 908a |   jne C, 0x78, ${_E4_if_4}:rel + PC
                               #      | _A_call_7:
e0 a0                          # 9091 |   push SP
e2 40                          # 9093 |   push [B]
5c f8 4a 01                    # 9095 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9099 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 a0                          # 909d |   push SP
5c f8 1e 01                    # 909f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 90a3 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
58 f8 9a 00                    # 90a7 |   jmp ${_C_if_4}:rel + PC
                               #      | _E4_if_4:
ec 60 1c f8 71 2d 00           # 90ab |   jne C, 0x71, ${_E5_if_4}:rel + PC
61 80 40                       # 90b2 |   mov D, [B]
a0 60 80 1c 08                 # 90b5 |   shr C, D, 0x8
28 80 1c 08                    # 90ba |   shl D, 0x8
                               #      | _A_call_9:
e0 a0                          # 90be |   push SP
e0 70                          # 90c0 |   push C + D
5c f8 1d 01                    # 90c2 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 90c6 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 a0                          # 90ca |   push SP
5c f8 f1 00                    # 90cc |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 90d0 |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 6d 00                    # 90d4 |   jmp ${_C_if_4}:rel + PC
                               #      | _E5_if_4:
ec 60 1c f8 68 22 00           # 90d8 |   jne C, 0x68, ${_E6_if_4}:rel + PC
                               #      | _A_call_11:
e0 a0                          # 90df |   push SP
e2 40                          # 90e1 |   push [B]
5c f8 fc 00                    # 90e3 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 90e7 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 bc 02                       # 90eb |   push SP + 0x2
5c f8 cf 00                    # 90ee |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 90f2 |   mov SP, SP + 0x2
                               #      | _Z_call_12:
58 f8 4b 00                    # 90f6 |   jmp ${_C_if_4}:rel + PC
                               #      | _E6_if_4:
ec 60 1c f8 62 21 00           # 90fa |   jne C, 0x62, ${_E7_if_4}:rel + PC
                               #      | _A_call_13:
e0 a0                          # 9101 |   push SP
e2 40                          # 9103 |   push [B]
5c f8 30 01                    # 9105 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # 9109 |   mov SP, SP + 0x4
                               #      | _Z_call_13:
                               #      | _A_call_14:
e0 a0                          # 910d |   push SP
5c f8 ae 00                    # 910f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9113 |   mov SP, SP + 0x2
                               #      | _Z_call_14:
58 f8 2a 00                    # 9117 |   jmp ${_C_if_4}:rel + PC
                               #      | _E7_if_4:
ec 60 1c f8 73 15 00           # 911b |   jne C, 0x73, ${_E8_if_4}:rel + PC
                               #      | _A_call_15:
e2 40                          # 9122 |   push [B]
5c f8 99 00                    # 9124 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9128 |   mov SP, SP + 0x2
                               #      | _Z_call_15:
58 f8 15 00                    # 912c |   jmp ${_C_if_4}:rel + PC
                               #      | _E8_if_4:
ec 60 1c f8 63 11 00           # 9130 |   jne C, 0x63, ${_E9_if_4}:rel + PC
                               #      | _A_call_16:
e2 40                          # 9137 |   push [B]
5c f8 1f 00                    # 9139 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 913d |   mov SP, SP + 0x2
                               #      | _Z_call_16:
                               #      | _E9_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
60 40 5c 02                    # 9141 |   mov B, B + 0x2
                               #      | _BZ_for_1:
44 20                          # 9145 |   inc A
58 f8 d7 fe                    # 9147 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # 914b |   mov SP, SP + 0x12
e4 20                          # 914f |   pop A
e4 40                          # 9151 |   pop B
e4 60                          # 9153 |   pop C
e4 80                          # 9155 |   pop D
dc                             # 9157 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # 9158 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # 915f |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # 9165 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # 9169 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # 916f |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # 9170 |   push C
e0 40                          # 9172 |   push B
e0 20                          # 9174 |   push A
61 20 bc 0a                    # 9176 |   mov A, [SP + 0xa]
62 20 1c 30                    # 917a |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # 917e |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # 9182 |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # 9188 |   div C, B, 0xa
82 20 ff 1c 30                 # 918d |   add [A], H, 0x30
44 20                          # 9192 |   inc A
60 40 60                       # 9194 |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # 9197 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # 919b |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # 919f |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # 91a5 |   dec A
61 40 60                       # 91a7 |   mov B, [C]
67 60 20                       # 91aa |   bmov [C], [A]
66 20 40                       # 91ad |   bmov [A], B
44 60                          # 91b0 |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # 91b2 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # 91b6 |   pop A
e4 40                          # 91b8 |   pop B
e4 60                          # 91ba |   pop C
dc                             # 91bc |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # 91bd |   push A
                               #      | _A_for_2:
61 20 bc 04                    # 91bf |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # 91c3 |   bmov H, [A]
e8 ff 00 f8 16 00              # 91c6 |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_4:
e0 ff                          # 91cc |   push H
5c f8 8a ff                    # 91ce |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 91d2 |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # 91d6 |   inc A
58 f8 eb ff                    # 91d8 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # 91dc |   pop A
dc                             # 91de |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # 91df |   push C
e0 40                          # 91e1 |   push B
e0 20                          # 91e3 |   push A
61 40 bc 08                    # 91e5 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 91e9 |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # 91ed |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # 91f1 |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # 91f8 |   shr H, B, A*4
2c ff 1c 0f                    # 91fc |   and H, 0xf
                               #      | _A_call_6:
e0 ff                          # 9200 |   push H
5c f8 1a 00                    # 9202 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # 9206 |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 60 ff                       # 920a |   mov [C], H
44 60                          # 920d |   inc C
                               #      | _BZ_for_3:
48 20                          # 920f |   dec A
58 f8 e0 ff                    # 9211 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # 9215 |   pop A
e4 40                          # 9217 |   pop B
e4 60                          # 9219 |   pop C
dc                             # 921b |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_6:
fa bc 1c f8 02 09 12 00        # 921c |   jgt [SP + 0x2], 0x9, ${_E_if_6}:rel + PC
81 ff bc 1c 02 30              # 9224 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # 922a |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
81 ff bc 1c 02 57              # 922e |   add H, [SP + 0x2], 0x57
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # 9234 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # 9235 |   push C
e0 40                          # 9237 |   push B
e0 20                          # 9239 |   push A
61 40 bc 08                    # 923b |   mov B, [SP + 0x8]
61 60 bc 0a                    # 923f |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # 9243 |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # 9247 |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # 924e |   shr H, B, A
2c ff 1c 01                    # 9252 |   and H, 0x1
82 60 ff 1c 30                 # 9256 |   add [C], H, 0x30
44 60                          # 925b |   inc C
                               #      | _BZ_for_4:
48 20                          # 925d |   dec A
58 f8 e8 ff                    # 925f |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # 9263 |   pop A
e4 40                          # 9265 |   pop B
e4 60                          # 9267 |   pop C
dc                             # 9269 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_getc:
                               #      | _begin_fn_getc:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 02 ff                 # 926a |   mov H, [0xff02]
ac fe ff e0 00 80              # 926f |   and G, H, 0x8000
e8 fe 00 f8 f5 ff              # 9275 |   jeq G, 0, ${_BA_loop_2}:rel + PC
2c ff e0 ff 00                 # 927b |   and H, 0xff
58 f8 08 00                    # 9280 |   jmp ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 e6 ff                    # 9284 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_getc:
dc                             # 9288 |   ret
                               #      | _end_fn_getc:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # 9289 |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # 928f |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # 9296 |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # 929d |   sub H, G, 0x30
c4 fe 00                       # 92a2 |   inc G, 0
dc                             # 92a5 |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # 92a6 |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # 92ad |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # 92b4 |   add H, G, -87
c4 fe 00                       # 92b9 |   inc G, 0
dc                             # 92bc |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # 92bd |   mov H, 0
60 fe 00                       # 92c0 |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # 92c3 |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # 92c4 |   push B
e0 20                          # 92c6 |   push A
60 20 00                       # 92c8 |   mov A, 0
61 40 bc 06                    # 92cb |   mov B, [SP + 0x6]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
65 ff 40                       # 92cf |   bmov H, [B]
e8 ff 00 f8 23 00              # 92d2 |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_17:
e0 ff                          # 92d8 |   push H
5c f8 af ff                    # 92da |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # 92de |   mov SP, SP + 0x2
                               #      | _Z_call_17:
e8 fe 00 f8 2d 00              # 92e2 |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # 92e8 |   shl A, 0x4
00 20 ff                       # 92ec |   add A, H
44 40                          # 92ef |   inc B
                               #      | _BZ_loop_3:
58 f8 de ff                    # 92f1 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
60 fe 00                       # 92f5 |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # 92f8 |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # 92fc |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # 9302 |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # 9309 |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # 930c |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # 930f |   pop A
e4 40                          # 9311 |   pop B
dc                             # 9313 |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 9314 |   push B
e0 20                          # 9316 |   push A
65 fe bc 08                    # 9318 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 931c |   shl H, G, 0x8
30 ff fe                       # 9321 |   or H, G
61 20 bc 06                    # 9324 |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 9328 |   add B, [SP + 0xa], A
                               #      | _A_while_3:
                               #      | _BA_while_3:
f8 3c 40 f8 02 12 00           # 932d |   jgt A + 0x2, B, ${_C_while_3}:rel + PC
62 20 ff                       # 9334 |   mov [A], H
60 20 3c 02                    # 9337 |   mov A, A + 0x2
                               #      | _BZ_while_3:
58 f8 f2 ff                    # 933b |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _A_if_16:
fc 20 40 f8 09 00              # 933f |   jge A, B, ${_E_if_16}:rel + PC
66 20 ff                       # 9345 |   bmov [A], H
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _cleanup_fn_memset:
e4 20                          # 9348 |   pop A
e4 40                          # 934a |   pop B
dc                             # 934c |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 934d |   push C
e0 40                          # 934f |   push B
e0 20                          # 9351 |   push A
61 20 bc 08                    # 9353 |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 9357 |   add B, [SP + 0xc], A
61 60 bc 0a                    # 935c |   mov C, [SP + 0xa]
                               #      | _A_while_4:
                               #      | _BA_while_4:
f8 3c 40 f8 02 16 00           # 9360 |   jgt A + 0x2, B, ${_C_while_4}:rel + PC
63 20 60                       # 9367 |   mov [A], [C]
60 20 3c 02                    # 936a |   mov A, A + 0x2
60 60 7c 02                    # 936e |   mov C, C + 0x2
                               #      | _BZ_while_4:
58 f8 ee ff                    # 9372 |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      | _A_if_17:
fc 20 40 f8 09 00              # 9376 |   jge A, B, ${_E_if_17}:rel + PC
67 20 60                       # 937c |   bmov [A], [C]
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 937f |   pop A
e4 40                          # 9381 |   pop B
e4 60                          # 9383 |   pop C
dc                             # 9385 |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_strcmp:
                               #      | _begin_fn_strcmp:
61 fc bc 02                    # 9386 |   mov E, [SP + 0x2]
61 fd bc 04                    # 938a |   mov F, [SP + 0x4]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
65 fe fc                       # 938e |   bmov G, [E]
65 ff fd                       # 9391 |   bmov H, [F]
84 ff fe ff                    # 9394 |   sub H, G, H
ec ff 00 f8 14 00              # 9398 |   jne H, 0, ${_cleanup_fn_strcmp}:rel + PC
e8 fe 00 f8 0e 00              # 939e |   jeq G, 0, ${_cleanup_fn_strcmp}:rel + PC
44 fc                          # 93a4 |   inc E
44 fd                          # 93a6 |   inc F
                               #      | _BZ_loop_4:
58 f8 e6 ff                    # 93a8 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_strcmp:
dc                             # 93ac |   ret
                               #      | _end_fn_strcmp:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # 93ad |   push A
61 fc bc 04                    # 93af |   mov E, [SP + 0x4]
61 fd bc 06                    # 93b3 |   mov F, [SP + 0x6]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
65 fe fc                       # 93b7 |   bmov G, [E]
65 ff fd                       # 93ba |   bmov H, [F]
60 20 fe                       # 93bd |   mov A, G
30 fe 1c 20                    # 93c0 |   or G, 0x20
30 ff 1c 20                    # 93c4 |   or H, 0x20
84 ff fe ff                    # 93c8 |   sub H, G, H
ec ff 00 f8 14 00              # 93cc |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # 93d2 |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # 93d8 |   inc E
44 fd                          # 93da |   inc F
                               #      | _BZ_loop_5:
58 f8 db ff                    # 93dc |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # 93e0 |   pop A
dc                             # 93e2 |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # 93e3 |   mov H, [SP + 0x2]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 fe ff                       # 93e7 |   bmov G, [H]
e9 fe bc f8 04 17 00           # 93ea |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_24:
ec fe 00 f8 0a 00              # 93f1 |   jne G, 0, ${_E_if_24}:rel + PC
60 ff 00                       # 93f7 |   mov H, 0
dc                             # 93fa |   ret
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
44 ff                          # 93fb |   inc H
                               #      | _BZ_loop_6:
58 f8 ea ff                    # 93fd |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _cleanup_fn_strchr:
dc                             # 9401 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc ca a3 02              # 9402 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 9408 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 ca a3                 # 9409 |   inc H, [${var__rand__state}]
62 e0 ff ca a3                 # 940e |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 9413 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 9414 |   push D
e0 60                          # 9416 |   push C
e0 40                          # 9418 |   push B
e0 20                          # 941a |   push A
61 40 e0 10 ff                 # 941c |   mov B, [0xff10]
61 60 e0 12 ff                 # 9421 |   mov C, [0xff12]
61 80 e0 14 ff                 # 9426 |   mov D, [0xff14]
61 20 bc 0e                    # 942b |   mov A, [SP + 0xe]
60 ff 00                       # 942f |   mov H, 0
                               #      | _A_if_25:
fc 28 20 f8 09 00              # 9432 |   jge A + B, A, ${_E_if_25}:rel + PC
c4 ff 00                       # 9438 |   inc H, 0
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
60 40 44                       # 943b |   mov B, B + A
81 20 bc ff 0c                 # 943e |   add A, [SP + 0xc], H
60 ff 00                       # 9443 |   mov H, 0
                               #      | _A_scope_4:
                               #      | _B_scope_4:
f0 2c 20 f8 10 00              # 9446 |   jlt A + C, A, ${_C_scope_4}:rel + PC
f0 20 ff f8 0a 00              # 944c |   jlt A, H, ${_C_scope_4}:rel + PC
58 f8 07 00                    # 9452 |   jmp ${_Z_scope_4}:rel + PC
                               #      | _C_scope_4:
c4 ff 00                       # 9456 |   inc H, 0
                               #      | _Z_scope_4:
60 60 64                       # 9459 |   mov C, C + A
81 20 bc ff 0a                 # 945c |   add A, [SP + 0xa], H
60 80 84                       # 9461 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 9464 |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 14 ff                 # 9468 |   mov H, [0xff14]
                               #      | _A_if_28:
f4 ff 80 f8 0a 00              # 946d |   jle H, D, ${_E_if_28}:rel + PC
58 f8 33 00                    # 9473 |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_28:
ec ff 80 f8 2b 00              # 9477 |   jne H, D, ${_E2_if_28}:rel + PC
61 ff e0 12 ff                 # 947d |   mov H, [0xff12]
                               #      | _A_if_29:
f4 ff 60 f8 0a 00              # 9482 |   jle H, C, ${_E_if_29}:rel + PC
58 f8 1e 00                    # 9488 |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_29:
ec ff 60 f8 16 00              # 948c |   jne H, C, ${_E2_if_29}:rel + PC
fa e0 40 f8 10 ff 14 00        # 9492 |   jgt [0xff10], B, ${_C_loop_7}:rel + PC
                               #      | _A_if_31:
e8 20 00 f8 08 00              # 949a |   jeq A, 0, ${_E_if_31}:rel + PC
5c 20                          # 94a0 |   call A
                               #      | _E_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
                               #      | _E2_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
                               #      | _E2_if_28:
                               #      | _C_if_28:
                               #      | _Z_if_28:
                               #      | _BZ_loop_7:
58 f8 c6 ff                    # 94a2 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 94a6 |   pop A
e4 40                          # 94a8 |   pop B
e4 60                          # 94aa |   pop C
e4 80                          # 94ac |   pop D
dc                             # 94ae |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # 94af |   push D
e0 60                          # 94b1 |   push C
e0 40                          # 94b3 |   push B
e0 20                          # 94b5 |   push A
61 fc bc 0a                    # 94b7 |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # 94bb |   shl F, [SP + 0xe], 0x1
00 fd fc                       # 94c1 |   add F, E
61 fe bc 0c                    # 94c4 |   mov G, [SP + 0xc]
61 40 fe                       # 94c8 |   mov B, [G]
60 60 1c 07                    # 94cb |   mov C, 0x7
60 20 00                       # 94cf |   mov A, 0
60 a0 bc fe                    # 94d2 |   mov SP, SP + -2
                               #      | _A_for_5:
                               #      | _BA_for_5:
fc fc fd f8 9e 00              # 94d6 |   jge E, F, ${_C_for_5}:rel + PC
                               #      |   # decode one line
60 20 00                       # 94dc |   mov A, 0
62 a0 1c ff                    # 94df |   mov [SP], -1
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
                               #      | _A_if_32:
ec 60 1c f8 ff 10 00           # 94e3 |   jne C, -1, ${_E_if_32}:rel + PC
44 fe                          # 94ea |   inc G
61 40 fe                       # 94ec |   mov B, [G]
60 60 1c 07                    # 94ef |   mov C, 0x7
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
98 80 40 60                    # 94f3 |   getb D, B, C
48 60                          # 94f7 |   dec C
40 80                          # 94f9 |   bool D
b0 20 21 80                    # 94fb |   or A, A*2, D
4a a0                          # 94ff |   dec [SP]
                               #      | _A_if_33:
ee a0 00 f8 1b 00              # 9501 |   jne [SP], 0, ${_E_if_33}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # 9507 |   mov H, A
b9 20 bc 12                    # 950a |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # 950e |   shr A, -1, A + 0x10
ae fc ff 20                    # 9514 |   and [E], H, A
58 f8 54 00                    # 9518 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_33:
ec 20 00 f8 20 00              # 951c |   jne A, 0, ${_E2_if_33}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # 9522 |   sub H, E, 0x2
                               #      | _A_if_34:
f1 ff bc f8 0c 0e 00           # 9527 |   jlt H, [SP + 0xc], ${_E_if_34}:rel + PC
63 fc ff                       # 952e |   mov [E], [H]
58 f8 07 00                    # 9531 |   jmp ${_C_if_34}:rel + PC
                               #      | _E_if_34:
62 fc 00                       # 9535 |   mov [E], 0
                               #      | _C_if_34:
                               #      | _Z_if_34:
58 f8 34 00                    # 9538 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E2_if_33:
ec 20 1c f8 02 13 00           # 953c |   jne A, 0x2, ${_E3_if_33}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # 9543 |   sub H, E, 0x4
63 fc ff                       # 9548 |   mov [E], [H]
58 f8 21 00                    # 954b |   jmp ${_C_loop_8}:rel + PC
                               #      | _E3_if_33:
ec 20 1c f8 06 0e 00           # 954f |   jne A, 0x6, ${_E4_if_33}:rel + PC
                               #      |   # all zeros
62 fc 00                       # 9556 |   mov [E], 0
58 f8 13 00                    # 9559 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E4_if_33:
ec 20 1c f8 07 0b 00           # 955d |   jne A, 0x7, ${_E5_if_33}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # 9564 |   mov [SP], [SP + 0x12]
                               #      | _E5_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _BZ_loop_8:
58 f8 7b ff                    # 9568 |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _BZ_for_5:
00 fc 1c 02                    # 956c |   add E, 0x2
58 f8 66 ff                    # 9570 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # 9574 |   mov SP, SP + 0x2
e4 20                          # 9578 |   pop A
e4 40                          # 957a |   pop B
e4 60                          # 957c |   pop C
e4 80                          # 957e |   pop D
dc                             # 9580 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # 9581 |   push B
e0 20                          # 9583 |   push A
61 20 bc 08                    # 9585 |   mov A, [SP + 0x8]
60 40 1c 1f                    # 9589 |   mov B, 0x1f
                               #      | _A_scope_5:
                               #      | _B_scope_5:
f0 20 1c f8 20 13 00           # 958d |   jlt A, 0x20, ${_C_scope_5}:rel + PC
fc 20 e0 f8 80 00 0c 00        # 9594 |   jge A, 0x80, ${_C_scope_5}:rel + PC
60 40 3c e0                    # 959c |   mov B, A + -32
                               #      | _C_scope_5:
                               #      | _Z_scope_5:
28 40 1c 01                    # 95a0 |   shl B, 0x1
61 40 e8 4a a1                 # 95a4 |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_18:
e0 1c 0c                       # 95a9 |   push 0xc
e0 1c 10                       # 95ac |   push 0x10
e0 e8 55 9d                    # 95af |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # 95b3 |   push [SP + 0xc]
5c f8 f9 fe                    # 95b6 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # 95ba |   mov SP, SP + 0x8
                               #      | _Z_call_18:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # 95be |   pop A
e4 40                          # 95c0 |   pop B
dc                             # 95c2 |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_20:
e0 00                          # 95c3 |   push 0
5c f8 15 00                    # 95c5 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 95c9 |   mov SP, SP + 0x2
                               #      | _Z_call_20:
                               #      | _A_call_21:
e0 e0 56 a2                    # 95cd |   push ${const__str__PONG__endl}
5c f8 ec fb                    # 95d1 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 95d5 |   mov SP, SP + 0x2
                               #      | _Z_call_21:
                               #      | _cleanup_fn_handle_ping:
dc                             # 95d9 |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # 95da |   inc G, 0
                               #      | _A_if_37:
eb e0 bc f8 cc a3 02 1f 00     # 95dd |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_37}:rel + PC
                               #      | _A_call_19:
e2 e0 cc a3                    # 95e6 |   push [${var__g_num_args}]
e2 bc 04                       # 95ea |   push [SP + 0x4]
e0 e0 32 a2                    # 95ed |   push ${const__data_1}
5c f8 19 fa                    # 95f1 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 95f5 |   mov SP, SP + 0x6
                               #      | _Z_call_19:
60 fe 00                       # 95f9 |   mov G, 0
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _cleanup_fn_check_num_args:
dc                             # 95fc |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # 95fd |   push D
e0 60                          # 95ff |   push C
e0 40                          # 9601 |   push B
e0 20                          # 9603 |   push A
60 a0 bc fa                    # 9605 |   mov SP, SP + -6
                               #      | _A_call_22:
e0 1c 02                       # 9609 |   push 0x2
5c f8 ce ff                    # 960c |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9610 |   mov SP, SP + 0x2
                               #      | _Z_call_22:
e8 fe 00 f8 9a 00              # 9614 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_24:
5c f8 a1 00                    # 961a |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_24:
e8 fe 00 f8 90 00              # 961e |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 ce a3                 # 9624 |   mov A, [${var__g_args}]
61 40 e0 d0 a3                 # 9629 |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_25:
e0 40                          # 962e |   push B
e0 20                          # 9630 |   push A
e0 e0 78 a2                    # 9632 |   push ${const__data_2}
5c f8 d4 f9                    # 9636 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 963a |   mov SP, SP + 0x6
                               #      | _Z_call_25:
                               #      | _A_if_43:
ee bc 1c f8 10 02 3c 00        # 963e |   jne [SP + 0x10], 0x2, ${_E_if_43}:rel + PC
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 20 40 f8 30 00              # 9646 |   jge A, B, ${_C_while_5}:rel + PC
61 60 20                       # 964c |   mov C, [A]
a0 80 60 1c 08                 # 964f |   shr D, C, 0x8
28 60 1c 08                    # 9654 |   shl C, 0x8
                               #      | _A_call_26:
e0 a0                          # 9658 |   push SP
e0 8c                          # 965a |   push D + C
5c f8 83 fb                    # 965c |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9660 |   mov SP, SP + 0x4
                               #      | _Z_call_26:
                               #      | _A_call_27:
e0 a0                          # 9664 |   push SP
5c f8 57 fb                    # 9666 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 966a |   mov SP, SP + 0x2
                               #      | _Z_call_27:
60 20 3c 02                    # 966e |   mov A, A + 0x2
                               #      | _BZ_while_5:
58 f8 d4 ff                    # 9672 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
58 f8 2d 00                    # 9676 |   jmp ${_C_if_43}:rel + PC
                               #      | _E_if_43:
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc 20 40 f8 29 00              # 967a |   jge A, B, ${_C_while_6}:rel + PC
61 60 20                       # 9680 |   mov C, [A]
                               #      | _A_call_28:
e0 60                          # 9683 |   push C
5c f8 d3 fa                    # 9685 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9689 |   mov SP, SP + 0x2
                               #      | _Z_call_28:
20 60 1c 08                    # 968d |   shr C, 0x8
                               #      | _A_call_29:
e0 60                          # 9691 |   push C
5c f8 c5 fa                    # 9693 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9697 |   mov SP, SP + 0x2
                               #      | _Z_call_29:
60 20 3c 02                    # 969b |   mov A, A + 0x2
                               #      | _BZ_while_6:
58 f8 db ff                    # 969f |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
                               #      | _C_if_43:
                               #      | _Z_if_43:
                               #      | _A_call_30:
e0 1c 0a                       # 96a3 |   push 0xa
5c f8 b2 fa                    # 96a6 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 96aa |   mov SP, SP + 0x2
                               #      | _Z_call_30:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # 96ae |   mov SP, SP + 0x6
e4 20                          # 96b2 |   pop A
e4 40                          # 96b4 |   pop B
e4 60                          # 96b6 |   pop C
e4 80                          # 96b8 |   pop D
dc                             # 96ba |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # 96bb |   push C
e0 40                          # 96bd |   push B
e0 20                          # 96bf |   push A
61 20 e0 ce a3                 # 96c1 |   mov A, [${var__g_args}]
61 40 e0 d0 a3                 # 96c6 |   mov B, [${var__g_args} + 0002]
60 60 e0 5c a2                 # 96cb |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # 96d0 |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 6b a2                 # 96d6 |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # 96db |   and G, A, 0x1
ec fe 00 f8 18 00              # 96e0 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # 96e6 |   and G, B, 0x1
ec fe 00 f8 0d 00              # 96eb |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # 96f1 |   inc G, 0
58 f8 11 00                    # 96f4 |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_23:
e0 60                          # 96f8 |   push C
5c f8 c3 fa                    # 96fa |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 96fe |   mov SP, SP + 0x2
                               #      | _Z_call_23:
60 fe 00                       # 9702 |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # 9705 |   pop A
e4 40                          # 9707 |   pop B
e4 60                          # 9709 |   pop C
dc                             # 970b |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # 970c |   push D
e0 60                          # 970e |   push C
e0 40                          # 9710 |   push B
e0 20                          # 9712 |   push A
60 a0 bc fa                    # 9714 |   mov SP, SP + -6
                               #      | _A_call_31:
e0 1c 02                       # 9718 |   push 0x2
5c f8 bf fe                    # 971b |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 971f |   mov SP, SP + 0x2
                               #      | _Z_call_31:
e8 fe 00 f8 dc 00              # 9723 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_32:
5c f8 92 ff                    # 9729 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_32:
e8 fe 00 f8 d2 00              # 972d |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 ce a3                 # 9733 |   mov A, [${var__g_args}]
61 40 e0 d0 a3                 # 9738 |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_46:
ee bc 1c f8 10 03 55 00        # 973d |   jne [SP + 0x10], 0x3, ${_E_if_46}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 49 00              # 9745 |   jge A, B, ${_C_while_7}:rel + PC
                               #      | _A_for_6:
60 80 00                       # 974b |   mov D, 0
                               #      | _BA_for_6:
fc 80 1c f8 04 19 00           # 974e |   jge D, 0x4, ${_C_for_6}:rel + PC
                               #      | _A_call_33:
5c f8 15 fb                    # 9755 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_33:
62 e0 ff 00 ff                 # 9759 |   mov [0xff00], H
62 b0 ff                       # 975e |   mov [SP + D], H
                               #      | _BZ_for_6:
44 80                          # 9761 |   inc D
58 f8 eb ff                    # 9763 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_34:
e0 a0                          # 9767 |   push SP
5c f8 5b fb                    # 9769 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 976d |   mov SP, SP + 0x2
                               #      | _Z_call_34:
e8 fe 00 f8 7f 00              # 9771 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # 9777 |   shl C, H, 0x8
20 ff 1c 08                    # 977c |   shr H, 0x8
30 60 ff                       # 9780 |   or C, H
62 20 60                       # 9783 |   mov [A], C
60 20 3c 02                    # 9786 |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 bb ff                    # 978a |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 31 00                    # 978e |   jmp ${_C_if_46}:rel + PC
                               #      | _E_if_46:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 2d 00              # 9792 |   jge A, B, ${_C_while_8}:rel + PC
                               #      | _A_call_35:
5c f8 d2 fa                    # 9798 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_35:
62 e0 ff 00 ff                 # 979c |   mov [0xff00], H
60 60 ff                       # 97a1 |   mov C, H
                               #      | _A_call_36:
5c f8 c6 fa                    # 97a4 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_36:
62 e0 ff 00 ff                 # 97a8 |   mov [0xff00], H
28 ff 1c 08                    # 97ad |   shl H, 0x8
30 60 ff                       # 97b1 |   or C, H
62 20 60                       # 97b4 |   mov [A], C
60 20 3c 02                    # 97b7 |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 d7 ff                    # 97bb |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_46:
                               #      | _Z_if_46:
                               #      | _A_call_37:
5c f8 ab fa                    # 97bf |   call ${fn_getc}:rel + PC
                               #      | _Z_call_37:
62 e0 ff 00 ff                 # 97c3 |   mov [0xff00], H
                               #      | _A_scope_6:
                               #      | _B_scope_6:
e8 ff 1c f8 0a 12 00           # 97c8 |   jeq H, 0xa, ${_C_scope_6}:rel + PC
e8 ff 1c f8 0d 0b 00           # 97cf |   jeq H, 0xd, ${_C_scope_6}:rel + PC
58 f8 1a 00                    # 97d6 |   jmp ${_L_fn_handle_write_1}:rel + PC
                               #      | _C_scope_6:
                               #      | _Z_scope_6:
                               #      | _A_call_38:
e0 40                          # 97da |   push B
e2 e0 ce a3                    # 97dc |   push [${var__g_args}]
e0 e0 87 a2                    # 97e0 |   push ${const__data_3}
5c f8 26 f8                    # 97e4 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 97e8 |   mov SP, SP + 0x6
                               #      | _Z_call_38:
58 f8 13 00                    # 97ec |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_39:
e0 e0 97 a2                    # 97f0 |   push ${const__data_4}
5c f8 c9 f9                    # 97f4 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 97f8 |   mov SP, SP + 0x2
                               #      | _Z_call_39:
60 fe 00                       # 97fc |   mov G, 0
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # 97ff |   mov SP, SP + 0x6
e4 20                          # 9803 |   pop A
e4 40                          # 9805 |   pop B
e4 60                          # 9807 |   pop C
e4 80                          # 9809 |   pop D
dc                             # 980b |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
                               #      | _A_call_40:
e0 1c 01                       # 980c |   push 0x1
5c f8 cb fd                    # 980f |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9813 |   mov SP, SP + 0x2
                               #      | _Z_call_40:
e8 fe 00 f8 5d 00              # 9817 |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_if_51:
ee bc 1c f8 02 06 1c 00        # 981d |   jne [SP + 0x2], 0x6, ${_E_if_51}:rel + PC
                               #      | _A_call_41:
e2 e0 ce a3                    # 9825 |   push [${var__g_args}]
e0 e0 a6 a2                    # 9829 |   push ${const__data_5}
5c f8 dd f7                    # 982d |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9831 |   mov SP, SP + 0x4
                               #      | _Z_call_41:
5a f8 99 0b                    # 9835 |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_51:
                               #      | _C_if_51:
                               #      | _Z_if_51:
63 e0 e0 1c ff ce a3           # 9839 |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_42:
e2 e0 1c ff                    # 9840 |   push [0xff1c]
e0 e0 b1 a2                    # 9844 |   push ${const__data_6}
5c f8 c2 f7                    # 9848 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 984c |   mov SP, SP + 0x4
                               #      | _Z_call_42:
                               #      | glb_jmp_to_stored_target:
62 e0 00 0a ff                 # 9850 |   mov [0xff0a], 0
60 20 00                       # 9855 |   mov A, 0
60 40 00                       # 9858 |   mov B, 0
60 60 00                       # 985b |   mov C, 0
60 80 00                       # 985e |   mov D, 0
60 a0 00                       # 9861 |   mov SP, 0
60 fc 00                       # 9864 |   mov E, 0
60 fd 00                       # 9867 |   mov F, 0
60 fe 00                       # 986a |   mov G, 0
60 ff 00                       # 986d |   mov H, 0
5a e0 1c ff                    # 9870 |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # 9874 |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_handle_init_sd:
                               #      | _begin_fn_handle_init_sd:
e0 60                          # 9875 |   push C
e0 40                          # 9877 |   push B
e0 20                          # 9879 |   push A
1e e0 1c 24 ff 0c              # 987b |   setb [0xff24], 0xc
1e e0 1c 24 ff 0f              # 9881 |   setb [0xff24], 0xf
                               #      | _A_call_43:
e0 00                          # 9887 |   push 0
e0 e0 60 ea                    # 9889 |   push 0xea60
e0 00                          # 988d |   push 0
e0 00                          # 988f |   push 0
5c f8 83 fb                    # 9891 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 9895 |   mov SP, SP + 0x8
                               #      | _Z_call_43:
1e e0 1c 24 ff 1f              # 9899 |   setb [0xff24], 0x1f
1e e0 1c 24 ff 1c              # 989f |   setb [0xff24], 0x1c
                               #      | _A_for_7:
60 60 00                       # 98a5 |   mov C, 0
                               #      | _BA_for_7:
fc 60 1c f8 0a 30 00           # 98a8 |   jge C, 0xa, ${_C_for_7}:rel + PC
                               #      | _A_for_8:
60 20 00                       # 98af |   mov A, 0
                               #      | _BA_for_8:
fc 20 1c f8 ff 1a 00           # 98b2 |   jge A, -1, ${_C_for_8}:rel + PC
99 40 e0 1c 26 ff 09           # 98b9 |   getb B, [0xff26], 0x9
e8 40 00 f8 0c 00              # 98c0 |   jeq B, 0, ${_C_for_8}:rel + PC
                               #      | _BZ_for_8:
44 20                          # 98c6 |   inc A
58 f8 ea ff                    # 98c8 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
e8 40 00 f8 0c 00              # 98cc |   jeq B, 0, ${_C_for_7}:rel + PC
                               #      | _BZ_for_7:
44 60                          # 98d2 |   inc C
58 f8 d4 ff                    # 98d4 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _A_if_54:
e8 40 00 f8 16 00              # 98d8 |   jeq B, 0, ${_E_if_54}:rel + PC
                               #      | _A_call_44:
e0 e0 c3 a2                    # 98de |   push ${const__str__TIMEOUT__endl}
5c f8 db f8                    # 98e2 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 98e6 |   mov SP, SP + 0x2
                               #      | _Z_call_44:
58 f8 10 00                    # 98ea |   jmp ${_cleanup_fn_handle_init_sd}:rel + PC
                               #      | _E_if_54:
                               #      | _C_if_54:
                               #      | _Z_if_54:
                               #      | _A_call_45:
e0 e0 cc a2                    # 98ee |   push ${const__str__INIT_OK__endl}
5c f8 cb f8                    # 98f2 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 98f6 |   mov SP, SP + 0x2
                               #      | _Z_call_45:
                               #      | _cleanup_fn_handle_init_sd:
e4 20                          # 98fa |   pop A
e4 40                          # 98fc |   pop B
e4 60                          # 98fe |   pop C
dc                             # 9900 |   ret
                               #      | _end_fn_handle_init_sd:
                               #      | 
                               #      | fn_handle_read_sd:
                               #      | _begin_fn_handle_read_sd:
e0 80                          # 9901 |   push D
e0 60                          # 9903 |   push C
e0 40                          # 9905 |   push B
e0 20                          # 9907 |   push A
60 a0 f4 fe fd                 # 9909 |   mov SP, 0xfdfe + SP
                               #      | _A_call_46:
e0 1c 02                       # 990e |   push 0x2
5c f8 c9 fc                    # 9911 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9915 |   mov SP, SP + 0x2
                               #      | _Z_call_46:
e8 fe 00 f8 60 00              # 9919 |   jeq G, 0, ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _A_call_47:
e2 e0 d0 a3                    # 991f |   push [${var__g_args} + 0002]
e2 e0 ce a3                    # 9923 |   push [${var__g_args}]
e0 bc 04                       # 9927 |   push SP + 0x4
5c f8 5d 00                    # 992a |   call ${fn_read_sd}:rel + PC
60 a0 bc 06                    # 992e |   mov SP, SP + 0x6
                               #      | _Z_call_47:
                               #      | _A_if_63:
ec fe 00 f8 16 00              # 9932 |   jne G, 0, ${_E_if_63}:rel + PC
                               #      | _A_call_48:
e0 e0 c3 a2                    # 9938 |   push ${const__str__TIMEOUT__endl}
5c f8 81 f8                    # 993c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9940 |   mov SP, SP + 0x2
                               #      | _Z_call_48:
58 f8 35 00                    # 9944 |   jmp ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _E_if_63:
                               #      | _C_if_63:
                               #      | _Z_if_63:
60 20 ff                       # 9948 |   mov A, H
                               #      | _A_call_49:
e0 20                          # 994b |   push A
e0 e0 d5 a2                    # 994d |   push ${const__data_7}
5c f8 b9 f6                    # 9951 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9955 |   mov SP, SP + 0x4
                               #      | _Z_call_49:
00 20 a0                       # 9959 |   add A, SP
                               #      | _A_for_11:
60 40 a0                       # 995c |   mov B, SP
                               #      | _BA_for_11:
fc 40 20 f8 1a 00              # 995f |   jge B, A, ${_C_for_11}:rel + PC
                               #      | _A_call_50:
e2 40                          # 9965 |   push [B]
e0 e0 e4 a2                    # 9967 |   push ${const__data_8}
5c f8 9f f6                    # 996b |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 996f |   mov SP, SP + 0x4
                               #      | _Z_call_50:
                               #      | _BZ_for_11:
44 40                          # 9973 |   inc B
58 f8 ea ff                    # 9975 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
                               #      | _cleanup_fn_handle_read_sd:
60 a0 f4 02 02                 # 9979 |   mov SP, 0x202 + SP
e4 20                          # 997e |   pop A
e4 40                          # 9980 |   pop B
e4 60                          # 9982 |   pop C
e4 80                          # 9984 |   pop D
dc                             # 9986 |   ret
                               #      | _end_fn_handle_read_sd:
                               #      | 
                               #      | fn_read_sd:
                               #      | _begin_fn_read_sd:
e0 80                          # 9987 |   push D
e0 60                          # 9989 |   push C
e0 40                          # 998b |   push B
e0 20                          # 998d |   push A
63 e0 bc 22 ff 0c              # 998f |   mov [0xff22], [SP + 0xc]
63 e0 bc 20 ff 0e              # 9995 |   mov [0xff20], [SP + 0xe]
1e e0 1c 24 ff 09              # 999b |   setb [0xff24], 0x9
                               #      | _A_for_9:
60 80 00                       # 99a1 |   mov D, 0
                               #      | _BA_for_9:
fc 80 1c f8 ff 1a 00           # 99a4 |   jge D, -1, ${_C_for_9}:rel + PC
99 40 e0 1c 26 ff 09           # 99ab |   getb B, [0xff26], 0x9
ec 40 00 f8 0c 00              # 99b2 |   jne B, 0, ${_C_for_9}:rel + PC
                               #      | _BZ_for_9:
44 80                          # 99b8 |   inc D
58 f8 ea ff                    # 99ba |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
e8 40 00 f8 82 00              # 99be |   jeq B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 19              # 99c4 |   setb [0xff24], 0x19
61 fc bc 0a                    # 99ca |   mov E, [SP + 0xa]
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
44 80                          # 99ce |   inc D
e8 80 1c f8 ff 70 00           # 99d0 |   jeq D, -1, ${_L_fn_read_sd_1}:rel + PC
61 60 e0 26 ff                 # 99d7 |   mov C, [0xff26]
98 20 60 1c 09                 # 99dc |   getb A, C, 0x9
e8 20 00 f8 51 00              # 99e1 |   jeq A, 0, ${_C_loop_9}:rel + PC
98 20 60 1c 08                 # 99e7 |   getb A, C, 0x8
e8 20 00 f8 e2 ff              # 99ec |   jeq A, 0, ${_BA_loop_9}:rel + PC
1e e0 1c 24 ff 08              # 99f2 |   setb [0xff24], 0x8
                               #      | _A_for_10:
60 80 00                       # 99f8 |   mov D, 0
                               #      | _BA_for_10:
fc 80 1c f8 ff 1a 00           # 99fb |   jge D, -1, ${_C_for_10}:rel + PC
99 40 e0 1c 26 ff 08           # 9a02 |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # 9a09 |   jeq B, 0, ${_C_for_10}:rel + PC
                               #      | _BZ_for_10:
44 80                          # 9a0f |   inc D
58 f8 ea ff                    # 9a11 |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
ec 40 00 f8 2b 00              # 9a15 |   jne B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 18              # 9a1b |   setb [0xff24], 0x18
2c 60 e0 ff 00                 # 9a21 |   and C, 0xff
62 fc 60                       # 9a26 |   mov [E], C
44 fc                          # 9a29 |   inc E
60 80 00                       # 9a2b |   mov D, 0
                               #      | _BZ_loop_9:
58 f8 a0 ff                    # 9a2e |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
c4 fe 00                       # 9a32 |   inc G, 0
b9 ff bc 0a                    # 9a35 |   neg H, [SP + 0xa]
00 ff fc                       # 9a39 |   add H, E
58 f8 0a 00                    # 9a3c |   jmp ${_cleanup_fn_read_sd}:rel + PC
                               #      | _L_fn_read_sd_1:
60 fe 00                       # 9a40 |   mov G, 0
60 ff 00                       # 9a43 |   mov H, 0
                               #      | _cleanup_fn_read_sd:
e4 20                          # 9a46 |   pop A
e4 40                          # 9a48 |   pop B
e4 60                          # 9a4a |   pop C
e4 80                          # 9a4c |   pop D
dc                             # 9a4e |   ret
                               #      | _end_fn_read_sd:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # 9a4f |   push B
e0 20                          # 9a51 |   push A
60 20 e0 fd 00                 # 9a53 |   mov A, 0xfd
60 40 00                       # 9a58 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # 9a5b |   mmap 0xff00, -1, 0x2
62 e0 e0 1e ff 0e 9b           # 9a63 |   mov [0xff1e], ${fn_syscall_entry}
                               #      | _A_call_51:
e0 e0 fa a2                    # 9a6a |   push ${const__data_9}
5c f8 4f f7                    # 9a6e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9a72 |   mov SP, SP + 0x2
                               #      | _Z_call_51:
61 20 e0 1c ff                 # 9a76 |   mov A, [0xff1c]
                               #      | _A_scope_7:
                               #      | _B_scope_7:
e8 20 00 f8 40 00              # 9a7b |   jeq A, 0, ${_C_scope_7}:rel + PC
e8 20 e0 f8 00 90 3a 00        # 9a81 |   jeq A, 0x9000, ${_C_scope_7}:rel + PC
61 40 e0 0c ff                 # 9a89 |   mov B, [0xff0c]
2c 40 e0 00 01                 # 9a8e |   and B, 0x100
                               #      | _A_if_67:
e8 40 00 f8 16 00              # 9a93 |   jeq B, 0, ${_E_if_67}:rel + PC
                               #      | _A_call_52:
e0 e0 29 a3                    # 9a99 |   push ${const__str__FORCED_BOOTLOADER__endl}
5c f8 6d f5                    # 9a9d |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # 9aa1 |   mov SP, SP + 0x2
                               #      | _Z_call_52:
58 f8 16 00                    # 9aa5 |   jmp ${_C_scope_7}:rel + PC
                               #      | _E_if_67:
                               #      | _C_if_67:
                               #      | _Z_if_67:
                               #      | _A_call_53:
e0 20                          # 9aa9 |   push A
e0 e0 a6 a2                    # 9aab |   push ${const__data_5}
5c f8 5b f5                    # 9aaf |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9ab3 |   mov SP, SP + 0x4
                               #      | _Z_call_53:
58 f8 99 fd                    # 9ab7 |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_7:
                               #      | _Z_scope_7:
                               #      | _A_call_54:
e0 e0 3c a3                    # 9abb |   push ${const__str__READY__endl}
5c f8 fe f6                    # 9abf |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9ac3 |   mov SP, SP + 0x2
                               #      | _Z_call_54:
c6 e0 00 0a ff                 # 9ac7 |   inc [0xff0a], 0
                               #      | _A_loop_10:
                               #      | _BA_loop_10:
                               #      | _A_call_72:
5c f8 56 00                    # 9acc |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_72:
46 e0 0a ff                    # 9ad0 |   inc [0xff0a]
60 20 ff                       # 9ad4 |   mov A, H
                               #      | _A_if_95:
ec fe 00 f8 0a 00              # 9ad7 |   jne G, 0, ${_E_if_95}:rel + PC
58 f8 ef ff                    # 9add |   jmp ${_BA_loop_10}:rel + PC
                               #      | _E_if_95:
                               #      | _C_if_95:
                               #      | _Z_if_95:
                               #      | _A_if_96:
ec 20 00 f8 16 00              # 9ae1 |   jne A, 0, ${_E_if_96}:rel + PC
                               #      | _A_call_73:
e0 e0 b9 a3                    # 9ae7 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 d2 f6                    # 9aeb |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9aef |   mov SP, SP + 0x2
                               #      | _Z_call_73:
58 f8 d9 ff                    # 9af3 |   jmp ${_BA_loop_10}:rel + PC
                               #      | _E_if_96:
                               #      | _C_if_96:
                               #      | _Z_if_96:
60 40 21                       # 9af7 |   mov B, A*2
60 40 e8 e6 a2                 # 9afa |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # 9aff |   push A
5e 40                          # 9b01 |   call [B]
e4 20                          # 9b03 |   pop A
                               #      | _BZ_loop_10:
58 f8 c7 ff                    # 9b05 |   jmp ${_BA_loop_10}:rel + PC
                               #      | _C_loop_10:
                               #      | _Z_loop_10:
                               #      | _cleanup_fn_main:
e4 20                          # 9b09 |   pop A
e4 40                          # 9b0b |   pop B
dc                             # 9b0d |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_64:
f0 ff 1c f8 14 08 00           # 9b0e |   jlt H, 0x14, ${_E_if_64}:rel + PC
dc                             # 9b15 |   ret
                               #      | _E_if_64:
                               #      | _C_if_64:
                               #      | _Z_if_64:
28 ff 1c 01                    # 9b16 |   shl H, 0x1
00 ff e0 0a a2                 # 9b1a |   add H, ${const__SYSCALL_MAP}
5a ff                          # 9b1f |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # 9b21 |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # 9b22 |   push D
e0 60                          # 9b24 |   push C
e0 40                          # 9b26 |   push B
e0 20                          # 9b28 |   push A
60 a0 bc fe                    # 9b2a |   mov SP, SP + -2
62 a0 00                       # 9b2e |   mov [SP], 0
60 a0 bc de                    # 9b31 |   mov SP, SP + -34
62 a0 00                       # 9b35 |   mov [SP], 0
60 20 a0                       # 9b38 |   mov A, SP
                               #      | _A_loop_11:
                               #      | _BA_loop_11:
                               #      | _A_call_55:
5c f8 2f f7                    # 9b3b |   call ${fn_getc}:rel + PC
                               #      | _Z_call_55:
60 60 ff                       # 9b3f |   mov C, H
62 e0 60 00 ff                 # 9b42 |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # 9b47 |   jeq C, 0xa, ${_C_loop_11}:rel + PC
e8 60 1c f8 0d 29 00           # 9b4e |   jeq C, 0xd, ${_C_loop_11}:rel + PC
                               #      | _A_if_70:
f0 20 bc f8 1f 19 00           # 9b55 |   jlt A, SP + 0x1f, ${_E_if_70}:rel + PC
                               #      | _A_call_56:
e0 e0 43 a3                    # 9b5c |   push ${const__data_10}
5c f8 5d f6                    # 9b60 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9b64 |   mov SP, SP + 0x2
                               #      | _Z_call_56:
e8 ff 00 f8 d3 00              # 9b68 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_70:
                               #      | _C_if_70:
                               #      | _Z_if_70:
62 20 60                       # 9b6e |   mov [A], C
44 20                          # 9b71 |   inc A
                               #      | _BZ_loop_11:
58 f8 c8 ff                    # 9b73 |   jmp ${_BA_loop_11}:rel + PC
                               #      | _C_loop_11:
                               #      | _Z_loop_11:
                               #      | _A_call_57:
e0 1c 20                       # 9b77 |   push 0x20
e0 bc 02                       # 9b7a |   push SP + 0x2
5c f8 66 f8                    # 9b7d |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # 9b81 |   mov SP, SP + 0x4
                               #      | _Z_call_57:
60 60 ff                       # 9b85 |   mov C, H
                               #      | _A_if_72:
e8 60 00 f8 0f 00              # 9b88 |   jeq C, 0, ${_E_if_72}:rel + PC
66 60 00                       # 9b8e |   bmov [C], 0
44 60                          # 9b91 |   inc C
58 f8 08 00                    # 9b93 |   jmp ${_C_if_72}:rel + PC
                               #      | _E_if_72:
60 60 1c ff                    # 9b97 |   mov C, -1
                               #      | _C_if_72:
                               #      | _Z_if_72:
                               #      | _A_call_67:
e0 a0                          # 9b9b |   push SP
5c f8 b1 00                    # 9b9d |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # 9ba1 |   mov SP, SP + 0x2
                               #      | _Z_call_67:
e8 ff 00 f8 9c 00              # 9ba5 |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # 9bab |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 cc a3                 # 9baf |   mov [${var__g_num_args}], 0
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 60 bc f8 20 7c 00           # 9bb4 |   jge C, SP + 0x20, ${_C_while_9}:rel + PC
                               #      | _A_call_68:
e0 1c 20                       # 9bbb |   push 0x20
e0 60                          # 9bbe |   push C
5c f8 23 f8                    # 9bc0 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # 9bc4 |   mov SP, SP + 0x4
                               #      | _Z_call_68:
60 80 ff                       # 9bc8 |   mov D, H
                               #      | _A_if_92:
e8 80 00 f8 0d 00              # 9bcb |   jeq D, 0, ${_E_if_92}:rel + PC
66 80 00                       # 9bd1 |   bmov [D], 0
58 f8 08 00                    # 9bd4 |   jmp ${_C_if_92}:rel + PC
                               #      | _E_if_92:
60 80 1c fe                    # 9bd8 |   mov D, -2
                               #      | _C_if_92:
                               #      | _Z_if_92:
61 20 e0 cc a3                 # 9bdc |   mov A, [${var__g_num_args}]
                               #      | _A_if_93:
f0 20 1c f8 04 17 00           # 9be1 |   jlt A, 0x4, ${_E_if_93}:rel + PC
                               #      | _A_call_69:
e0 e0 90 a3                    # 9be8 |   push ${const__data_11}
5c f8 d1 f5                    # 9bec |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9bf0 |   mov SP, SP + 0x2
                               #      | _Z_call_69:
58 f8 47 00                    # 9bf4 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_93:
                               #      | _C_if_93:
                               #      | _Z_if_93:
                               #      | _A_call_70:
e0 60                          # 9bf8 |   push C
5c f8 ca f6                    # 9bfa |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9bfe |   mov SP, SP + 0x2
                               #      | _Z_call_70:
                               #      | _A_if_94:
ec fe 00 f8 18 00              # 9c02 |   jne G, 0, ${_E_if_94}:rel + PC
                               #      | _A_call_71:
e0 20                          # 9c08 |   push A
e0 e0 a5 a3                    # 9c0a |   push ${const__data_12}
5c f8 fc f3                    # 9c0e |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9c12 |   mov SP, SP + 0x4
                               #      | _Z_call_71:
58 f8 25 00                    # 9c16 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_94:
                               #      | _C_if_94:
                               #      | _Z_if_94:
a8 40 20 1c 01                 # 9c1a |   shl B, A, 0x1
62 e8 ff ce a3                 # 9c1f |   mov [${var__g_args} + B], H
c6 e0 20 cc a3                 # 9c24 |   inc [${var__g_num_args}], A
c4 60 80                       # 9c29 |   inc C, D
                               #      | _BZ_while_9:
58 f8 88 ff                    # 9c2c |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
c4 fe 00                       # 9c30 |   inc G, 0
61 ff bc 22                    # 9c33 |   mov H, [SP + 0x22]
58 f8 0a 00                    # 9c37 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # 9c3b |   mov G, 0
60 ff 00                       # 9c3e |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # 9c41 |   mov SP, SP + 0x24
e4 20                          # 9c45 |   pop A
e4 40                          # 9c47 |   pop B
e4 60                          # 9c49 |   pop C
e4 80                          # 9c4b |   pop D
dc                             # 9c4d |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # 9c4e |   push A
61 20 bc 04                    # 9c50 |   mov A, [SP + 0x4]
                               #      | _A_call_58:
e0 e0 55 a3                    # 9c54 |   push ${const__str__PING}
e0 20                          # 9c58 |   push A
5c f8 53 f7                    # 9c5a |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9c5e |   mov SP, SP + 0x4
                               #      | _Z_call_58:
                               #      | _A_if_74:
ec ff 00 f8 0d 00              # 9c62 |   jne H, 0, ${_E_if_74}:rel + PC
c4 ff 00                       # 9c68 |   inc H, 0
58 f8 e7 00                    # 9c6b |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_74:
                               #      | _C_if_74:
                               #      | _Z_if_74:
                               #      | _A_call_59:
e0 e0 5a a3                    # 9c6f |   push ${const__str__READ}
e0 20                          # 9c73 |   push A
5c f8 38 f7                    # 9c75 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9c79 |   mov SP, SP + 0x4
                               #      | _Z_call_59:
                               #      | _A_if_76:
ec ff 00 f8 0e 00              # 9c7d |   jne H, 0, ${_E_if_76}:rel + PC
60 ff 1c 02                    # 9c83 |   mov H, 0x2
58 f8 cb 00                    # 9c87 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_76:
                               #      | _C_if_76:
                               #      | _Z_if_76:
                               #      | _A_call_60:
e0 e0 5f a3                    # 9c8b |   push ${const__str__WRITE}
e0 20                          # 9c8f |   push A
5c f8 1c f7                    # 9c91 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9c95 |   mov SP, SP + 0x4
                               #      | _Z_call_60:
                               #      | _A_if_78:
ec ff 00 f8 0e 00              # 9c99 |   jne H, 0, ${_E_if_78}:rel + PC
60 ff 1c 03                    # 9c9f |   mov H, 0x3
58 f8 af 00                    # 9ca3 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_78:
                               #      | _C_if_78:
                               #      | _Z_if_78:
                               #      | _A_call_61:
e0 e0 65 a3                    # 9ca7 |   push ${const__str__READB}
e0 20                          # 9cab |   push A
5c f8 00 f7                    # 9cad |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9cb1 |   mov SP, SP + 0x4
                               #      | _Z_call_61:
                               #      | _A_if_80:
ec ff 00 f8 0e 00              # 9cb5 |   jne H, 0, ${_E_if_80}:rel + PC
60 ff 1c 04                    # 9cbb |   mov H, 0x4
58 f8 93 00                    # 9cbf |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_80:
                               #      | _C_if_80:
                               #      | _Z_if_80:
                               #      | _A_call_62:
e0 e0 6b a3                    # 9cc3 |   push ${const__str__WRITEB}
e0 20                          # 9cc7 |   push A
5c f8 e4 f6                    # 9cc9 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9ccd |   mov SP, SP + 0x4
                               #      | _Z_call_62:
                               #      | _A_if_82:
ec ff 00 f8 0e 00              # 9cd1 |   jne H, 0, ${_E_if_82}:rel + PC
60 ff 1c 05                    # 9cd7 |   mov H, 0x5
58 f8 77 00                    # 9cdb |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_82:
                               #      | _C_if_82:
                               #      | _Z_if_82:
                               #      | _A_call_63:
e0 e0 72 a3                    # 9cdf |   push ${const__str__JMP}
e0 20                          # 9ce3 |   push A
5c f8 c8 f6                    # 9ce5 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9ce9 |   mov SP, SP + 0x4
                               #      | _Z_call_63:
                               #      | _A_if_84:
ec ff 00 f8 0e 00              # 9ced |   jne H, 0, ${_E_if_84}:rel + PC
60 ff 1c 06                    # 9cf3 |   mov H, 0x6
58 f8 5b 00                    # 9cf7 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_84:
                               #      | _C_if_84:
                               #      | _Z_if_84:
                               #      | _A_call_64:
e0 e0 76 a3                    # 9cfb |   push ${const__str__JMP_PERSIST}
e0 20                          # 9cff |   push A
5c f8 ac f6                    # 9d01 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9d05 |   mov SP, SP + 0x4
                               #      | _Z_call_64:
                               #      | _A_if_86:
ec ff 00 f8 0e 00              # 9d09 |   jne H, 0, ${_E_if_86}:rel + PC
60 ff 1c 07                    # 9d0f |   mov H, 0x7
58 f8 3f 00                    # 9d13 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_86:
                               #      | _C_if_86:
                               #      | _Z_if_86:
                               #      | _A_call_65:
e0 e0 82 a3                    # 9d17 |   push ${const__str__INITSD}
e0 20                          # 9d1b |   push A
5c f8 90 f6                    # 9d1d |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9d21 |   mov SP, SP + 0x4
                               #      | _Z_call_65:
                               #      | _A_if_88:
ec ff 00 f8 0e 00              # 9d25 |   jne H, 0, ${_E_if_88}:rel + PC
60 ff 1c 08                    # 9d2b |   mov H, 0x8
58 f8 23 00                    # 9d2f |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_88:
                               #      | _C_if_88:
                               #      | _Z_if_88:
                               #      | _A_call_66:
e0 e0 89 a3                    # 9d33 |   push ${const__str__READSD}
e0 20                          # 9d37 |   push A
5c f8 74 f6                    # 9d39 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9d3d |   mov SP, SP + 0x4
                               #      | _Z_call_66:
                               #      | _A_if_90:
ec ff 00 f8 0e 00              # 9d41 |   jne H, 0, ${_E_if_90}:rel + PC
60 ff 1c 09                    # 9d47 |   mov H, 0x9
58 f8 07 00                    # 9d4b |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_90:
                               #      | _C_if_90:
                               #      | _Z_if_90:
60 ff 00                       # 9d4f |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # 9d52 |   pop A
dc                             # 9d54 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 9d55 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # a14a |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
0a 90 58 91 6a 92 70 91 df 91 35 92 1c 92 89 92 c4 92 14 93 4d 93 86 93 ad 93 e3 93 02 94 09 94 14 94 bd 91 af 94 81 95 # a20a |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # a232 |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # a256 |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # a25c |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # a26b |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # a278 |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # a287 |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # a297 |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # a2a6 |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # a2b1 |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__str__TIMEOUT__endl:
54 49 4d 45 4f 55 54 0a 00     # a2c3 |   .data str:"TIMEOUT\n"
                               #      | const__str__INIT_OK__endl:
49 4e 49 54 5f 4f 4b 0a 00     # a2cc |   .data str:"INIT_OK\n"
                               #      | const__data_7:
72 65 61 64 20 25 64 20 62 79 74 65 73 0a 00 # a2d5 |   .data str:"read %d bytes\n"
                               #      | const__data_8:
25 68 20 00                    # a2e4 |   .data str:"%h "
                               #      | const__HANDLER_MAP:
c3 95 fd 95 0c 97 fd 95 0c 97 0c 98 0c 98 75 98 01 99 # a2e8 |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp, $fn_handle_init_sd, $fn_handle_read_sd]
                               #      | const__data_9:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 33 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 32 0a 00 # a2fa |   .data str:"Weeekly3006 - Hardware v1.3 - Bootloader v2.2\n"
                               #      | const__str__FORCED_BOOTLOADER__endl:
46 4f 52 43 45 44 5f 42 4f 4f 54 4c 4f 41 44 45 52 0a 00 # a329 |   .data str:"FORCED_BOOTLOADER\n"
                               #      | const__str__READY__endl:
52 45 41 44 59 0a 00           # a33c |   .data str:"READY\n"
                               #      | const__data_10:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # a343 |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # a355 |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # a35a |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # a35f |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # a365 |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # a36b |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # a372 |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # a376 |   .data str:"JMP_PERSIST"
                               #      | const__str__INITSD:
49 4e 49 54 53 44 00           # a382 |   .data str:"INITSD"
                               #      | const__str__READSD:
52 45 41 44 53 44 00           # a389 |   .data str:"READSD"
                               #      | const__data_11:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 34 0a 00 # a390 |   .data str:"TOO_MANY_ARGS max=4\n"
                               #      | const__data_12:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # a3a5 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # a3b9 |   .data str:"UNKNOWN_COMMAND\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa3ca
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # a3ca |   .bss size:2 align:1
                               #      | var__g_num_args:
                               # a3cc |   .bss size:2 align:1
                               #      | var__g_args:
                               # a3ce |   .bss size:10 align:2
                               #      | SECTION_END_static_data:
                               #      | 
