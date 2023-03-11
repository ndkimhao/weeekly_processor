                               #      | .config CODE_OFFSET 0x9000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 fe 8f                 # 9000 |   mov SP, 0x8ffe
                               #      | _A_call_75:
5c f8 47 0a                    # 9005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_75:
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
e8 60 00 f8 23 01              # 9021 |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # 9027 |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # 902e |   push C
5c f8 21 01                    # 9030 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9034 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 06 01                    # 9038 |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # 903c |   inc A
65 60 20                       # 903e |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # 9041 |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 fd 00                    # 9047 |   jmp ${_C_for_1}:rel + PC
58 f8 ef 00                    # 904b |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 25 1a 00           # 904f |   jne C, 0x25, ${_E2_if_4}:rel + PC
                               #      | _A_call_2:
e0 1c 25                       # 9056 |   push 0x25
5c f8 f8 00                    # 9059 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 905d |   mov SP, SP + 0x2
                               #      | _Z_call_2:
58 f8 dd 00                    # 9061 |   jmp ${_BZ_for_1}:rel + PC
58 f8 d5 00                    # 9065 |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 64 21 00           # 9069 |   jne C, 0x64, ${_E3_if_4}:rel + PC
                               #      | _A_call_3:
e0 a0                          # 9070 |   push SP
e2 40                          # 9072 |   push [B]
5c f8 f5 00                    # 9074 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # 9078 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 a0                          # 907c |   push SP
5c f8 38 01                    # 907e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9082 |   mov SP, SP + 0x2
                               #      | _Z_call_5:
58 f8 b4 00                    # 9086 |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 78 21 00           # 908a |   jne C, 0x78, ${_E4_if_4}:rel + PC
                               #      | _A_call_7:
e0 a0                          # 9091 |   push SP
e2 40                          # 9093 |   push [B]
5c f8 43 01                    # 9095 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9099 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 a0                          # 909d |   push SP
5c f8 17 01                    # 909f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 90a3 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
58 f8 93 00                    # 90a7 |   jmp ${_C_if_4}:rel + PC
                               #      | _E4_if_4:
ec 60 1c f8 71 26 00           # 90ab |   jne C, 0x71, ${_E5_if_4}:rel + PC
95 80 40 1c 08                 # 90b2 |   ror D, [B], 0x8
                               #      | _A_call_9:
e0 a0                          # 90b7 |   push SP
e0 80                          # 90b9 |   push D
5c f8 1d 01                    # 90bb |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 90bf |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 a0                          # 90c3 |   push SP
5c f8 f1 00                    # 90c5 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 90c9 |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 6d 00                    # 90cd |   jmp ${_C_if_4}:rel + PC
                               #      | _E5_if_4:
ec 60 1c f8 68 22 00           # 90d1 |   jne C, 0x68, ${_E6_if_4}:rel + PC
                               #      | _A_call_11:
e0 a0                          # 90d8 |   push SP
e2 40                          # 90da |   push [B]
5c f8 fc 00                    # 90dc |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 90e0 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 bc 02                       # 90e4 |   push SP + 0x2
5c f8 cf 00                    # 90e7 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 90eb |   mov SP, SP + 0x2
                               #      | _Z_call_12:
58 f8 4b 00                    # 90ef |   jmp ${_C_if_4}:rel + PC
                               #      | _E6_if_4:
ec 60 1c f8 62 21 00           # 90f3 |   jne C, 0x62, ${_E7_if_4}:rel + PC
                               #      | _A_call_13:
e0 a0                          # 90fa |   push SP
e2 40                          # 90fc |   push [B]
5c f8 30 01                    # 90fe |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # 9102 |   mov SP, SP + 0x4
                               #      | _Z_call_13:
                               #      | _A_call_14:
e0 a0                          # 9106 |   push SP
5c f8 ae 00                    # 9108 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 910c |   mov SP, SP + 0x2
                               #      | _Z_call_14:
58 f8 2a 00                    # 9110 |   jmp ${_C_if_4}:rel + PC
                               #      | _E7_if_4:
ec 60 1c f8 73 15 00           # 9114 |   jne C, 0x73, ${_E8_if_4}:rel + PC
                               #      | _A_call_15:
e2 40                          # 911b |   push [B]
5c f8 99 00                    # 911d |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9121 |   mov SP, SP + 0x2
                               #      | _Z_call_15:
58 f8 15 00                    # 9125 |   jmp ${_C_if_4}:rel + PC
                               #      | _E8_if_4:
ec 60 1c f8 63 11 00           # 9129 |   jne C, 0x63, ${_E9_if_4}:rel + PC
                               #      | _A_call_16:
e2 40                          # 9130 |   push [B]
5c f8 1f 00                    # 9132 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9136 |   mov SP, SP + 0x2
                               #      | _Z_call_16:
                               #      | _E9_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
60 40 5c 02                    # 913a |   mov B, B + 0x2
                               #      | _BZ_for_1:
44 20                          # 913e |   inc A
58 f8 de fe                    # 9140 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # 9144 |   mov SP, SP + 0x12
e4 20                          # 9148 |   pop A
e4 40                          # 914a |   pop B
e4 60                          # 914c |   pop C
e4 80                          # 914e |   pop D
dc                             # 9150 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # 9151 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # 9158 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # 915e |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # 9162 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # 9168 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # 9169 |   push C
e0 40                          # 916b |   push B
e0 20                          # 916d |   push A
61 20 bc 0a                    # 916f |   mov A, [SP + 0xa]
62 20 1c 30                    # 9173 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # 9177 |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # 917b |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # 9181 |   div C, B, 0xa
82 20 ff 1c 30                 # 9186 |   add [A], H, 0x30
44 20                          # 918b |   inc A
60 40 60                       # 918d |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # 9190 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # 9194 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # 9198 |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # 919e |   dec A
61 40 60                       # 91a0 |   mov B, [C]
67 60 20                       # 91a3 |   bmov [C], [A]
66 20 40                       # 91a6 |   bmov [A], B
44 60                          # 91a9 |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # 91ab |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # 91af |   pop A
e4 40                          # 91b1 |   pop B
e4 60                          # 91b3 |   pop C
dc                             # 91b5 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # 91b6 |   push A
                               #      | _A_for_2:
61 20 bc 04                    # 91b8 |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # 91bc |   bmov H, [A]
e8 ff 00 f8 16 00              # 91bf |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_4:
e0 ff                          # 91c5 |   push H
5c f8 8a ff                    # 91c7 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 91cb |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # 91cf |   inc A
58 f8 eb ff                    # 91d1 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # 91d5 |   pop A
dc                             # 91d7 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # 91d8 |   push C
e0 40                          # 91da |   push B
e0 20                          # 91dc |   push A
61 40 bc 08                    # 91de |   mov B, [SP + 0x8]
61 60 bc 0a                    # 91e2 |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # 91e6 |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # 91ea |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # 91f1 |   shr H, B, A*4
2c ff 1c 0f                    # 91f5 |   and H, 0xf
                               #      | _A_call_6:
e0 ff                          # 91f9 |   push H
5c f8 1a 00                    # 91fb |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # 91ff |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 60 ff                       # 9203 |   mov [C], H
44 60                          # 9206 |   inc C
                               #      | _BZ_for_3:
48 20                          # 9208 |   dec A
58 f8 e0 ff                    # 920a |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # 920e |   pop A
e4 40                          # 9210 |   pop B
e4 60                          # 9212 |   pop C
dc                             # 9214 |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_6:
fa bc 1c f8 02 09 12 00        # 9215 |   jgt [SP + 0x2], 0x9, ${_E_if_6}:rel + PC
81 ff bc 1c 02 30              # 921d |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # 9223 |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
81 ff bc 1c 02 57              # 9227 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # 922d |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # 922e |   push C
e0 40                          # 9230 |   push B
e0 20                          # 9232 |   push A
61 40 bc 08                    # 9234 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 9238 |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # 923c |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # 9240 |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # 9247 |   shr H, B, A
2c ff 1c 01                    # 924b |   and H, 0x1
82 60 ff 1c 30                 # 924f |   add [C], H, 0x30
44 60                          # 9254 |   inc C
                               #      | _BZ_for_4:
48 20                          # 9256 |   dec A
58 f8 e8 ff                    # 9258 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # 925c |   pop A
e4 40                          # 925e |   pop B
e4 60                          # 9260 |   pop C
dc                             # 9262 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_getc:
                               #      | _begin_fn_getc:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 02 ff                 # 9263 |   mov H, [0xff02]
ac fe ff e0 00 80              # 9268 |   and G, H, 0x8000
e8 fe 00 f8 f5 ff              # 926e |   jeq G, 0, ${_BA_loop_2}:rel + PC
2c ff e0 ff 00                 # 9274 |   and H, 0xff
58 f8 08 00                    # 9279 |   jmp ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 e6 ff                    # 927d |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_getc:
dc                             # 9281 |   ret
                               #      | _end_fn_getc:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # 9282 |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # 9288 |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # 928f |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # 9296 |   sub H, G, 0x30
c4 fe 00                       # 929b |   inc G, 0
dc                             # 929e |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # 929f |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # 92a6 |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # 92ad |   add H, G, -87
c4 fe 00                       # 92b2 |   inc G, 0
dc                             # 92b5 |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # 92b6 |   mov H, 0
60 fe 00                       # 92b9 |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # 92bc |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # 92bd |   push B
e0 20                          # 92bf |   push A
60 20 00                       # 92c1 |   mov A, 0
61 40 bc 06                    # 92c4 |   mov B, [SP + 0x6]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
65 ff 40                       # 92c8 |   bmov H, [B]
e8 ff 00 f8 23 00              # 92cb |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_17:
e0 ff                          # 92d1 |   push H
5c f8 af ff                    # 92d3 |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # 92d7 |   mov SP, SP + 0x2
                               #      | _Z_call_17:
e8 fe 00 f8 2d 00              # 92db |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # 92e1 |   shl A, 0x4
00 20 ff                       # 92e5 |   add A, H
44 40                          # 92e8 |   inc B
                               #      | _BZ_loop_3:
58 f8 de ff                    # 92ea |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
60 fe 00                       # 92ee |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # 92f1 |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # 92f5 |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # 92fb |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # 9302 |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # 9305 |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # 9308 |   pop A
e4 40                          # 930a |   pop B
dc                             # 930c |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # 930d |   push B
e0 20                          # 930f |   push A
65 fe bc 08                    # 9311 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # 9315 |   shl H, G, 0x8
30 ff fe                       # 931a |   or H, G
61 20 bc 06                    # 931d |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # 9321 |   add B, [SP + 0xa], A
                               #      | _A_while_3:
                               #      | _BA_while_3:
f8 3c 40 f8 02 12 00           # 9326 |   jgt A + 0x2, B, ${_C_while_3}:rel + PC
62 20 ff                       # 932d |   mov [A], H
60 20 3c 02                    # 9330 |   mov A, A + 0x2
                               #      | _BZ_while_3:
58 f8 f2 ff                    # 9334 |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _A_if_16:
fc 20 40 f8 09 00              # 9338 |   jge A, B, ${_E_if_16}:rel + PC
66 20 ff                       # 933e |   bmov [A], H
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _cleanup_fn_memset:
e4 20                          # 9341 |   pop A
e4 40                          # 9343 |   pop B
dc                             # 9345 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # 9346 |   push C
e0 40                          # 9348 |   push B
e0 20                          # 934a |   push A
61 20 bc 08                    # 934c |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # 9350 |   add B, [SP + 0xc], A
61 60 bc 0a                    # 9355 |   mov C, [SP + 0xa]
                               #      | _A_while_4:
                               #      | _BA_while_4:
f8 3c 40 f8 02 16 00           # 9359 |   jgt A + 0x2, B, ${_C_while_4}:rel + PC
63 20 60                       # 9360 |   mov [A], [C]
60 20 3c 02                    # 9363 |   mov A, A + 0x2
60 60 7c 02                    # 9367 |   mov C, C + 0x2
                               #      | _BZ_while_4:
58 f8 ee ff                    # 936b |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      | _A_if_17:
fc 20 40 f8 09 00              # 936f |   jge A, B, ${_E_if_17}:rel + PC
67 20 60                       # 9375 |   bmov [A], [C]
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _cleanup_fn_memcpy:
e4 20                          # 9378 |   pop A
e4 40                          # 937a |   pop B
e4 60                          # 937c |   pop C
dc                             # 937e |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_strcmp:
                               #      | _begin_fn_strcmp:
61 fc bc 02                    # 937f |   mov E, [SP + 0x2]
61 fd bc 04                    # 9383 |   mov F, [SP + 0x4]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
65 fe fc                       # 9387 |   bmov G, [E]
65 ff fd                       # 938a |   bmov H, [F]
84 ff fe ff                    # 938d |   sub H, G, H
ec ff 00 f8 14 00              # 9391 |   jne H, 0, ${_cleanup_fn_strcmp}:rel + PC
e8 fe 00 f8 0e 00              # 9397 |   jeq G, 0, ${_cleanup_fn_strcmp}:rel + PC
44 fc                          # 939d |   inc E
44 fd                          # 939f |   inc F
                               #      | _BZ_loop_4:
58 f8 e6 ff                    # 93a1 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_strcmp:
dc                             # 93a5 |   ret
                               #      | _end_fn_strcmp:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # 93a6 |   push A
61 fc bc 04                    # 93a8 |   mov E, [SP + 0x4]
61 fd bc 06                    # 93ac |   mov F, [SP + 0x6]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
65 fe fc                       # 93b0 |   bmov G, [E]
65 ff fd                       # 93b3 |   bmov H, [F]
60 20 fe                       # 93b6 |   mov A, G
30 fe 1c 20                    # 93b9 |   or G, 0x20
30 ff 1c 20                    # 93bd |   or H, 0x20
84 ff fe ff                    # 93c1 |   sub H, G, H
ec ff 00 f8 14 00              # 93c5 |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # 93cb |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # 93d1 |   inc E
44 fd                          # 93d3 |   inc F
                               #      | _BZ_loop_5:
58 f8 db ff                    # 93d5 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # 93d9 |   pop A
dc                             # 93db |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # 93dc |   mov H, [SP + 0x2]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 fe ff                       # 93e0 |   bmov G, [H]
e9 fe bc f8 04 17 00           # 93e3 |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_24:
ec fe 00 f8 0a 00              # 93ea |   jne G, 0, ${_E_if_24}:rel + PC
60 ff 00                       # 93f0 |   mov H, 0
dc                             # 93f3 |   ret
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
44 ff                          # 93f4 |   inc H
                               #      | _BZ_loop_6:
58 f8 ea ff                    # 93f6 |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _cleanup_fn_strchr:
dc                             # 93fa |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc c7 a3 02              # 93fb |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 9401 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 c7 a3                 # 9402 |   inc H, [${var__rand__state}]
62 e0 ff c7 a3                 # 9407 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 940c |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 940d |   push D
e0 60                          # 940f |   push C
e0 40                          # 9411 |   push B
e0 20                          # 9413 |   push A
61 40 e0 10 ff                 # 9415 |   mov B, [0xff10]
61 60 e0 12 ff                 # 941a |   mov C, [0xff12]
61 80 e0 14 ff                 # 941f |   mov D, [0xff14]
61 20 bc 0e                    # 9424 |   mov A, [SP + 0xe]
60 ff 00                       # 9428 |   mov H, 0
                               #      | _A_if_25:
fc 28 20 f8 09 00              # 942b |   jge A + B, A, ${_E_if_25}:rel + PC
c4 ff 00                       # 9431 |   inc H, 0
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
60 40 44                       # 9434 |   mov B, B + A
81 20 bc ff 0c                 # 9437 |   add A, [SP + 0xc], H
60 ff 00                       # 943c |   mov H, 0
                               #      | _A_scope_4:
                               #      | _B_scope_4:
f0 2c 20 f8 10 00              # 943f |   jlt A + C, A, ${_C_scope_4}:rel + PC
f0 20 ff f8 0a 00              # 9445 |   jlt A, H, ${_C_scope_4}:rel + PC
58 f8 07 00                    # 944b |   jmp ${_Z_scope_4}:rel + PC
                               #      | _C_scope_4:
c4 ff 00                       # 944f |   inc H, 0
                               #      | _Z_scope_4:
60 60 64                       # 9452 |   mov C, C + A
81 20 bc ff 0a                 # 9455 |   add A, [SP + 0xa], H
60 80 84                       # 945a |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 945d |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 14 ff                 # 9461 |   mov H, [0xff14]
                               #      | _A_if_28:
f4 ff 80 f8 0a 00              # 9466 |   jle H, D, ${_E_if_28}:rel + PC
58 f8 33 00                    # 946c |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_28:
ec ff 80 f8 2b 00              # 9470 |   jne H, D, ${_E2_if_28}:rel + PC
61 ff e0 12 ff                 # 9476 |   mov H, [0xff12]
                               #      | _A_if_29:
f4 ff 60 f8 0a 00              # 947b |   jle H, C, ${_E_if_29}:rel + PC
58 f8 1e 00                    # 9481 |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_29:
ec ff 60 f8 16 00              # 9485 |   jne H, C, ${_E2_if_29}:rel + PC
fa e0 40 f8 10 ff 14 00        # 948b |   jgt [0xff10], B, ${_C_loop_7}:rel + PC
                               #      | _A_if_31:
e8 20 00 f8 08 00              # 9493 |   jeq A, 0, ${_E_if_31}:rel + PC
5c 20                          # 9499 |   call A
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
58 f8 c6 ff                    # 949b |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 949f |   pop A
e4 40                          # 94a1 |   pop B
e4 60                          # 94a3 |   pop C
e4 80                          # 94a5 |   pop D
dc                             # 94a7 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # 94a8 |   push D
e0 60                          # 94aa |   push C
e0 40                          # 94ac |   push B
e0 20                          # 94ae |   push A
61 fc bc 0a                    # 94b0 |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # 94b4 |   shl F, [SP + 0xe], 0x1
00 fd fc                       # 94ba |   add F, E
61 fe bc 0c                    # 94bd |   mov G, [SP + 0xc]
61 40 fe                       # 94c1 |   mov B, [G]
60 60 1c 07                    # 94c4 |   mov C, 0x7
60 20 00                       # 94c8 |   mov A, 0
60 a0 bc fe                    # 94cb |   mov SP, SP + -2
                               #      | _A_for_5:
                               #      | _BA_for_5:
fc fc fd f8 9e 00              # 94cf |   jge E, F, ${_C_for_5}:rel + PC
                               #      |   # decode one line
60 20 00                       # 94d5 |   mov A, 0
62 a0 1c ff                    # 94d8 |   mov [SP], -1
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
                               #      | _A_if_32:
ec 60 1c f8 ff 10 00           # 94dc |   jne C, -1, ${_E_if_32}:rel + PC
44 fe                          # 94e3 |   inc G
61 40 fe                       # 94e5 |   mov B, [G]
60 60 1c 07                    # 94e8 |   mov C, 0x7
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
98 80 40 60                    # 94ec |   getb D, B, C
48 60                          # 94f0 |   dec C
40 80                          # 94f2 |   bool D
b0 20 21 80                    # 94f4 |   or A, A*2, D
4a a0                          # 94f8 |   dec [SP]
                               #      | _A_if_33:
ee a0 00 f8 1b 00              # 94fa |   jne [SP], 0, ${_E_if_33}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # 9500 |   mov H, A
b9 20 bc 12                    # 9503 |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # 9507 |   shr A, -1, A + 0x10
ae fc ff 20                    # 950d |   and [E], H, A
58 f8 54 00                    # 9511 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_33:
ec 20 00 f8 20 00              # 9515 |   jne A, 0, ${_E2_if_33}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # 951b |   sub H, E, 0x2
                               #      | _A_if_34:
f1 ff bc f8 0c 0e 00           # 9520 |   jlt H, [SP + 0xc], ${_E_if_34}:rel + PC
63 fc ff                       # 9527 |   mov [E], [H]
58 f8 07 00                    # 952a |   jmp ${_C_if_34}:rel + PC
                               #      | _E_if_34:
62 fc 00                       # 952e |   mov [E], 0
                               #      | _C_if_34:
                               #      | _Z_if_34:
58 f8 34 00                    # 9531 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E2_if_33:
ec 20 1c f8 02 13 00           # 9535 |   jne A, 0x2, ${_E3_if_33}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # 953c |   sub H, E, 0x4
63 fc ff                       # 9541 |   mov [E], [H]
58 f8 21 00                    # 9544 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E3_if_33:
ec 20 1c f8 06 0e 00           # 9548 |   jne A, 0x6, ${_E4_if_33}:rel + PC
                               #      |   # all zeros
62 fc 00                       # 954f |   mov [E], 0
58 f8 13 00                    # 9552 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E4_if_33:
ec 20 1c f8 07 0b 00           # 9556 |   jne A, 0x7, ${_E5_if_33}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # 955d |   mov [SP], [SP + 0x12]
                               #      | _E5_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _BZ_loop_8:
58 f8 7b ff                    # 9561 |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _BZ_for_5:
00 fc 1c 02                    # 9565 |   add E, 0x2
58 f8 66 ff                    # 9569 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # 956d |   mov SP, SP + 0x2
e4 20                          # 9571 |   pop A
e4 40                          # 9573 |   pop B
e4 60                          # 9575 |   pop C
e4 80                          # 9577 |   pop D
dc                             # 9579 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # 957a |   push B
e0 20                          # 957c |   push A
61 20 bc 08                    # 957e |   mov A, [SP + 0x8]
60 40 1c 1f                    # 9582 |   mov B, 0x1f
                               #      | _A_scope_5:
                               #      | _B_scope_5:
f0 20 1c f8 20 13 00           # 9586 |   jlt A, 0x20, ${_C_scope_5}:rel + PC
fc 20 e0 f8 80 00 0c 00        # 958d |   jge A, 0x80, ${_C_scope_5}:rel + PC
60 40 3c e0                    # 9595 |   mov B, A + -32
                               #      | _C_scope_5:
                               #      | _Z_scope_5:
28 40 1c 01                    # 9599 |   shl B, 0x1
61 40 e8 47 a1                 # 959d |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_18:
e0 1c 0c                       # 95a2 |   push 0xc
e0 1c 10                       # 95a5 |   push 0x10
e0 e8 52 9d                    # 95a8 |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # 95ac |   push [SP + 0xc]
5c f8 f9 fe                    # 95af |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # 95b3 |   mov SP, SP + 0x8
                               #      | _Z_call_18:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # 95b7 |   pop A
e4 40                          # 95b9 |   pop B
dc                             # 95bb |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_20:
e0 00                          # 95bc |   push 0
5c f8 15 00                    # 95be |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 95c2 |   mov SP, SP + 0x2
                               #      | _Z_call_20:
                               #      | _A_call_21:
e0 e0 53 a2                    # 95c6 |   push ${const__str__PONG__endl}
5c f8 ec fb                    # 95ca |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 95ce |   mov SP, SP + 0x2
                               #      | _Z_call_21:
                               #      | _cleanup_fn_handle_ping:
dc                             # 95d2 |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # 95d3 |   inc G, 0
                               #      | _A_if_37:
eb e0 bc f8 c9 a3 02 1f 00     # 95d6 |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_37}:rel + PC
                               #      | _A_call_19:
e2 e0 c9 a3                    # 95df |   push [${var__g_num_args}]
e2 bc 04                       # 95e3 |   push [SP + 0x4]
e0 e0 2f a2                    # 95e6 |   push ${const__data_1}
5c f8 20 fa                    # 95ea |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 95ee |   mov SP, SP + 0x6
                               #      | _Z_call_19:
60 fe 00                       # 95f2 |   mov G, 0
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _cleanup_fn_check_num_args:
dc                             # 95f5 |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # 95f6 |   push D
e0 60                          # 95f8 |   push C
e0 40                          # 95fa |   push B
e0 20                          # 95fc |   push A
60 a0 bc fa                    # 95fe |   mov SP, SP + -6
                               #      | _A_call_22:
e0 1c 02                       # 9602 |   push 0x2
5c f8 ce ff                    # 9605 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9609 |   mov SP, SP + 0x2
                               #      | _Z_call_22:
e8 fe 00 f8 93 00              # 960d |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_24:
5c f8 9a 00                    # 9613 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_24:
e8 fe 00 f8 89 00              # 9617 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 cc a3                 # 961d |   mov A, [${var__g_args}]
61 40 e0 ce a3                 # 9622 |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_25:
e0 40                          # 9627 |   push B
e0 20                          # 9629 |   push A
e0 e0 75 a2                    # 962b |   push ${const__data_2}
5c f8 db f9                    # 962f |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9633 |   mov SP, SP + 0x6
                               #      | _Z_call_25:
                               #      | _A_if_43:
ee bc 1c f8 10 02 35 00        # 9637 |   jne [SP + 0x10], 0x2, ${_E_if_43}:rel + PC
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 20 40 f8 29 00              # 963f |   jge A, B, ${_C_while_5}:rel + PC
95 80 20 1c 08                 # 9645 |   ror D, [A], 0x8
                               #      | _A_call_26:
e0 a0                          # 964a |   push SP
e0 80                          # 964c |   push D
5c f8 8a fb                    # 964e |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 9652 |   mov SP, SP + 0x4
                               #      | _Z_call_26:
                               #      | _A_call_27:
e0 a0                          # 9656 |   push SP
5c f8 5e fb                    # 9658 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 965c |   mov SP, SP + 0x2
                               #      | _Z_call_27:
60 20 3c 02                    # 9660 |   mov A, A + 0x2
                               #      | _BZ_while_5:
58 f8 db ff                    # 9664 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
58 f8 2d 00                    # 9668 |   jmp ${_C_if_43}:rel + PC
                               #      | _E_if_43:
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc 20 40 f8 29 00              # 966c |   jge A, B, ${_C_while_6}:rel + PC
61 60 20                       # 9672 |   mov C, [A]
                               #      | _A_call_28:
e0 60                          # 9675 |   push C
5c f8 da fa                    # 9677 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 967b |   mov SP, SP + 0x2
                               #      | _Z_call_28:
20 60 1c 08                    # 967f |   shr C, 0x8
                               #      | _A_call_29:
e0 60                          # 9683 |   push C
5c f8 cc fa                    # 9685 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9689 |   mov SP, SP + 0x2
                               #      | _Z_call_29:
60 20 3c 02                    # 968d |   mov A, A + 0x2
                               #      | _BZ_while_6:
58 f8 db ff                    # 9691 |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
                               #      | _C_if_43:
                               #      | _Z_if_43:
                               #      | _A_call_30:
e0 1c 0a                       # 9695 |   push 0xa
5c f8 b9 fa                    # 9698 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 969c |   mov SP, SP + 0x2
                               #      | _Z_call_30:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # 96a0 |   mov SP, SP + 0x6
e4 20                          # 96a4 |   pop A
e4 40                          # 96a6 |   pop B
e4 60                          # 96a8 |   pop C
e4 80                          # 96aa |   pop D
dc                             # 96ac |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # 96ad |   push C
e0 40                          # 96af |   push B
e0 20                          # 96b1 |   push A
61 20 e0 cc a3                 # 96b3 |   mov A, [${var__g_args}]
61 40 e0 ce a3                 # 96b8 |   mov B, [${var__g_args} + 0002]
60 60 e0 59 a2                 # 96bd |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # 96c2 |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 68 a2                 # 96c8 |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # 96cd |   and G, A, 0x1
ec fe 00 f8 18 00              # 96d2 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # 96d8 |   and G, B, 0x1
ec fe 00 f8 0d 00              # 96dd |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # 96e3 |   inc G, 0
58 f8 11 00                    # 96e6 |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_23:
e0 60                          # 96ea |   push C
5c f8 ca fa                    # 96ec |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 96f0 |   mov SP, SP + 0x2
                               #      | _Z_call_23:
60 fe 00                       # 96f4 |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # 96f7 |   pop A
e4 40                          # 96f9 |   pop B
e4 60                          # 96fb |   pop C
dc                             # 96fd |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # 96fe |   push D
e0 60                          # 9700 |   push C
e0 40                          # 9702 |   push B
e0 20                          # 9704 |   push A
60 a0 bc fa                    # 9706 |   mov SP, SP + -6
                               #      | _A_call_31:
e0 1c 02                       # 970a |   push 0x2
5c f8 c6 fe                    # 970d |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9711 |   mov SP, SP + 0x2
                               #      | _Z_call_31:
e8 fe 00 f8 dc 00              # 9715 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_32:
5c f8 92 ff                    # 971b |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_32:
e8 fe 00 f8 d2 00              # 971f |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 cc a3                 # 9725 |   mov A, [${var__g_args}]
61 40 e0 ce a3                 # 972a |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_46:
ee bc 1c f8 10 03 55 00        # 972f |   jne [SP + 0x10], 0x3, ${_E_if_46}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 49 00              # 9737 |   jge A, B, ${_C_while_7}:rel + PC
                               #      | _A_for_6:
60 80 00                       # 973d |   mov D, 0
                               #      | _BA_for_6:
fc 80 1c f8 04 19 00           # 9740 |   jge D, 0x4, ${_C_for_6}:rel + PC
                               #      | _A_call_33:
5c f8 1c fb                    # 9747 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_33:
62 e0 ff 00 ff                 # 974b |   mov [0xff00], H
62 b0 ff                       # 9750 |   mov [SP + D], H
                               #      | _BZ_for_6:
44 80                          # 9753 |   inc D
58 f8 eb ff                    # 9755 |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_34:
e0 a0                          # 9759 |   push SP
5c f8 62 fb                    # 975b |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 975f |   mov SP, SP + 0x2
                               #      | _Z_call_34:
e8 fe 00 f8 7f 00              # 9763 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # 9769 |   shl C, H, 0x8
20 ff 1c 08                    # 976e |   shr H, 0x8
30 60 ff                       # 9772 |   or C, H
62 20 60                       # 9775 |   mov [A], C
60 20 3c 02                    # 9778 |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 bb ff                    # 977c |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 31 00                    # 9780 |   jmp ${_C_if_46}:rel + PC
                               #      | _E_if_46:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 2d 00              # 9784 |   jge A, B, ${_C_while_8}:rel + PC
                               #      | _A_call_35:
5c f8 d9 fa                    # 978a |   call ${fn_getc}:rel + PC
                               #      | _Z_call_35:
62 e0 ff 00 ff                 # 978e |   mov [0xff00], H
60 60 ff                       # 9793 |   mov C, H
                               #      | _A_call_36:
5c f8 cd fa                    # 9796 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_36:
62 e0 ff 00 ff                 # 979a |   mov [0xff00], H
28 ff 1c 08                    # 979f |   shl H, 0x8
30 60 ff                       # 97a3 |   or C, H
62 20 60                       # 97a6 |   mov [A], C
60 20 3c 02                    # 97a9 |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 d7 ff                    # 97ad |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_46:
                               #      | _Z_if_46:
                               #      | _A_call_37:
5c f8 b2 fa                    # 97b1 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_37:
62 e0 ff 00 ff                 # 97b5 |   mov [0xff00], H
                               #      | _A_scope_6:
                               #      | _B_scope_6:
e8 ff 1c f8 0a 12 00           # 97ba |   jeq H, 0xa, ${_C_scope_6}:rel + PC
e8 ff 1c f8 0d 0b 00           # 97c1 |   jeq H, 0xd, ${_C_scope_6}:rel + PC
58 f8 1a 00                    # 97c8 |   jmp ${_L_fn_handle_write_1}:rel + PC
                               #      | _C_scope_6:
                               #      | _Z_scope_6:
                               #      | _A_call_38:
e0 40                          # 97cc |   push B
e2 e0 cc a3                    # 97ce |   push [${var__g_args}]
e0 e0 84 a2                    # 97d2 |   push ${const__data_3}
5c f8 34 f8                    # 97d6 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 97da |   mov SP, SP + 0x6
                               #      | _Z_call_38:
58 f8 13 00                    # 97de |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_39:
e0 e0 94 a2                    # 97e2 |   push ${const__data_4}
5c f8 d0 f9                    # 97e6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 97ea |   mov SP, SP + 0x2
                               #      | _Z_call_39:
60 fe 00                       # 97ee |   mov G, 0
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # 97f1 |   mov SP, SP + 0x6
e4 20                          # 97f5 |   pop A
e4 40                          # 97f7 |   pop B
e4 60                          # 97f9 |   pop C
e4 80                          # 97fb |   pop D
dc                             # 97fd |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
                               #      | _A_call_40:
e0 1c 01                       # 97fe |   push 0x1
5c f8 d2 fd                    # 9801 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9805 |   mov SP, SP + 0x2
                               #      | _Z_call_40:
e8 fe 00 f8 5d 00              # 9809 |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_if_51:
ee bc 1c f8 02 06 1c 00        # 980f |   jne [SP + 0x2], 0x6, ${_E_if_51}:rel + PC
                               #      | _A_call_41:
e2 e0 cc a3                    # 9817 |   push [${var__g_args}]
e0 e0 a3 a2                    # 981b |   push ${const__data_5}
5c f8 eb f7                    # 981f |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9823 |   mov SP, SP + 0x4
                               #      | _Z_call_41:
5a f8 a5 0b                    # 9827 |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_51:
                               #      | _C_if_51:
                               #      | _Z_if_51:
63 e0 e0 1c ff cc a3           # 982b |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_42:
e2 e0 1c ff                    # 9832 |   push [0xff1c]
e0 e0 ae a2                    # 9836 |   push ${const__data_6}
5c f8 d0 f7                    # 983a |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 983e |   mov SP, SP + 0x4
                               #      | _Z_call_42:
                               #      | glb_jmp_to_stored_target:
62 e0 00 0a ff                 # 9842 |   mov [0xff0a], 0
60 20 00                       # 9847 |   mov A, 0
60 40 00                       # 984a |   mov B, 0
60 60 00                       # 984d |   mov C, 0
60 80 00                       # 9850 |   mov D, 0
60 a0 00                       # 9853 |   mov SP, 0
60 fc 00                       # 9856 |   mov E, 0
60 fd 00                       # 9859 |   mov F, 0
60 fe 00                       # 985c |   mov G, 0
60 ff 00                       # 985f |   mov H, 0
5a e0 1c ff                    # 9862 |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # 9866 |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_handle_init_sd:
                               #      | _begin_fn_handle_init_sd:
e0 60                          # 9867 |   push C
e0 40                          # 9869 |   push B
e0 20                          # 986b |   push A
1e e0 1c 24 ff 0c              # 986d |   setb [0xff24], 0xc
1e e0 1c 24 ff 1f              # 9873 |   setb [0xff24], 0x1f
                               #      | _A_call_43:
e0 00                          # 9879 |   push 0
e0 e0 60 ea                    # 987b |   push 0xea60
e0 00                          # 987f |   push 0
e0 00                          # 9881 |   push 0
5c f8 8a fb                    # 9883 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 9887 |   mov SP, SP + 0x8
                               #      | _Z_call_43:
1e e0 1c 24 ff 0f              # 988b |   setb [0xff24], 0xf
1e e0 1c 24 ff 1c              # 9891 |   setb [0xff24], 0x1c
                               #      | _A_for_7:
60 60 00                       # 9897 |   mov C, 0
                               #      | _BA_for_7:
fc 60 1c f8 0a 30 00           # 989a |   jge C, 0xa, ${_C_for_7}:rel + PC
                               #      | _A_for_8:
60 20 00                       # 98a1 |   mov A, 0
                               #      | _BA_for_8:
fc 20 1c f8 ff 1a 00           # 98a4 |   jge A, -1, ${_C_for_8}:rel + PC
99 40 e0 1c 26 ff 09           # 98ab |   getb B, [0xff26], 0x9
e8 40 00 f8 0c 00              # 98b2 |   jeq B, 0, ${_C_for_8}:rel + PC
                               #      | _BZ_for_8:
44 20                          # 98b8 |   inc A
58 f8 ea ff                    # 98ba |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
e8 40 00 f8 0c 00              # 98be |   jeq B, 0, ${_C_for_7}:rel + PC
                               #      | _BZ_for_7:
44 60                          # 98c4 |   inc C
58 f8 d4 ff                    # 98c6 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _A_if_54:
e8 40 00 f8 16 00              # 98ca |   jeq B, 0, ${_E_if_54}:rel + PC
                               #      | _A_call_44:
e0 e0 c0 a2                    # 98d0 |   push ${const__str__TIMEOUT__endl}
5c f8 e2 f8                    # 98d4 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 98d8 |   mov SP, SP + 0x2
                               #      | _Z_call_44:
58 f8 10 00                    # 98dc |   jmp ${_cleanup_fn_handle_init_sd}:rel + PC
                               #      | _E_if_54:
                               #      | _C_if_54:
                               #      | _Z_if_54:
                               #      | _A_call_45:
e0 e0 c9 a2                    # 98e0 |   push ${const__str__INIT_OK__endl}
5c f8 d2 f8                    # 98e4 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 98e8 |   mov SP, SP + 0x2
                               #      | _Z_call_45:
                               #      | _cleanup_fn_handle_init_sd:
e4 20                          # 98ec |   pop A
e4 40                          # 98ee |   pop B
e4 60                          # 98f0 |   pop C
dc                             # 98f2 |   ret
                               #      | _end_fn_handle_init_sd:
                               #      | 
                               #      | fn_handle_read_sd:
                               #      | _begin_fn_handle_read_sd:
e0 80                          # 98f3 |   push D
e0 60                          # 98f5 |   push C
e0 40                          # 98f7 |   push B
e0 20                          # 98f9 |   push A
60 a0 f4 fe fd                 # 98fb |   mov SP, 0xfdfe + SP
                               #      | _A_call_46:
e0 1c 02                       # 9900 |   push 0x2
5c f8 d0 fc                    # 9903 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9907 |   mov SP, SP + 0x2
                               #      | _Z_call_46:
e8 fe 00 f8 6b 00              # 990b |   jeq G, 0, ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _A_call_47:
e2 e0 ce a3                    # 9911 |   push [${var__g_args} + 0002]
e2 e0 cc a3                    # 9915 |   push [${var__g_args}]
e0 bc 04                       # 9919 |   push SP + 0x4
5c f8 68 00                    # 991c |   call ${fn_read_sd}:rel + PC
60 a0 bc 06                    # 9920 |   mov SP, SP + 0x6
                               #      | _Z_call_47:
                               #      | _A_if_63:
ec fe 00 f8 16 00              # 9924 |   jne G, 0, ${_E_if_63}:rel + PC
                               #      | _A_call_48:
e0 e0 c0 a2                    # 992a |   push ${const__str__TIMEOUT__endl}
5c f8 88 f8                    # 992e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9932 |   mov SP, SP + 0x2
                               #      | _Z_call_48:
58 f8 40 00                    # 9936 |   jmp ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _E_if_63:
                               #      | _C_if_63:
                               #      | _Z_if_63:
60 20 ff                       # 993a |   mov A, H
                               #      | _A_call_49:
e0 20                          # 993d |   push A
e0 e0 d2 a2                    # 993f |   push ${const__data_7}
5c f8 c7 f6                    # 9943 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9947 |   mov SP, SP + 0x4
                               #      | _Z_call_49:
00 20 a0                       # 994b |   add A, SP
                               #      | _A_for_11:
60 40 a0                       # 994e |   mov B, SP
                               #      | _BA_for_11:
fc 40 20 f8 1a 00              # 9951 |   jge B, A, ${_C_for_11}:rel + PC
                               #      | _A_call_50:
e2 40                          # 9957 |   push [B]
e0 e0 e1 a2                    # 9959 |   push ${const__data_8}
5c f8 ad f6                    # 995d |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9961 |   mov SP, SP + 0x4
                               #      | _Z_call_50:
                               #      | _BZ_for_11:
44 40                          # 9965 |   inc B
58 f8 ea ff                    # 9967 |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
                               #      | _A_call_51:
e0 1c 0a                       # 996b |   push 0xa
5c f8 e3 f7                    # 996e |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9972 |   mov SP, SP + 0x2
                               #      | _Z_call_51:
                               #      | _cleanup_fn_handle_read_sd:
60 a0 f4 02 02                 # 9976 |   mov SP, 0x202 + SP
e4 20                          # 997b |   pop A
e4 40                          # 997d |   pop B
e4 60                          # 997f |   pop C
e4 80                          # 9981 |   pop D
dc                             # 9983 |   ret
                               #      | _end_fn_handle_read_sd:
                               #      | 
                               #      | fn_read_sd:
                               #      | _begin_fn_read_sd:
e0 80                          # 9984 |   push D
e0 60                          # 9986 |   push C
e0 40                          # 9988 |   push B
e0 20                          # 998a |   push A
63 e0 bc 22 ff 0c              # 998c |   mov [0xff22], [SP + 0xc]
63 e0 bc 20 ff 0e              # 9992 |   mov [0xff20], [SP + 0xe]
1e e0 1c 24 ff 09              # 9998 |   setb [0xff24], 0x9
                               #      | _A_for_9:
60 80 00                       # 999e |   mov D, 0
                               #      | _BA_for_9:
fc 80 1c f8 ff 1a 00           # 99a1 |   jge D, -1, ${_C_for_9}:rel + PC
99 40 e0 1c 26 ff 09           # 99a8 |   getb B, [0xff26], 0x9
ec 40 00 f8 0c 00              # 99af |   jne B, 0, ${_C_for_9}:rel + PC
                               #      | _BZ_for_9:
44 80                          # 99b5 |   inc D
58 f8 ea ff                    # 99b7 |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
e8 40 00 f8 82 00              # 99bb |   jeq B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 19              # 99c1 |   setb [0xff24], 0x19
61 fc bc 0a                    # 99c7 |   mov E, [SP + 0xa]
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
44 80                          # 99cb |   inc D
e8 80 1c f8 ff 70 00           # 99cd |   jeq D, -1, ${_L_fn_read_sd_1}:rel + PC
61 60 e0 26 ff                 # 99d4 |   mov C, [0xff26]
98 20 60 1c 09                 # 99d9 |   getb A, C, 0x9
e8 20 00 f8 51 00              # 99de |   jeq A, 0, ${_C_loop_9}:rel + PC
98 20 60 1c 08                 # 99e4 |   getb A, C, 0x8
e8 20 00 f8 e2 ff              # 99e9 |   jeq A, 0, ${_BA_loop_9}:rel + PC
1e e0 1c 24 ff 08              # 99ef |   setb [0xff24], 0x8
                               #      | _A_for_10:
60 80 00                       # 99f5 |   mov D, 0
                               #      | _BA_for_10:
fc 80 1c f8 ff 1a 00           # 99f8 |   jge D, -1, ${_C_for_10}:rel + PC
99 40 e0 1c 26 ff 08           # 99ff |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # 9a06 |   jeq B, 0, ${_C_for_10}:rel + PC
                               #      | _BZ_for_10:
44 80                          # 9a0c |   inc D
58 f8 ea ff                    # 9a0e |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
ec 40 00 f8 2b 00              # 9a12 |   jne B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 18              # 9a18 |   setb [0xff24], 0x18
2c 60 e0 ff 00                 # 9a1e |   and C, 0xff
62 fc 60                       # 9a23 |   mov [E], C
44 fc                          # 9a26 |   inc E
60 80 00                       # 9a28 |   mov D, 0
                               #      | _BZ_loop_9:
58 f8 a0 ff                    # 9a2b |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
c4 fe 00                       # 9a2f |   inc G, 0
b9 ff bc 0a                    # 9a32 |   neg H, [SP + 0xa]
00 ff fc                       # 9a36 |   add H, E
58 f8 0a 00                    # 9a39 |   jmp ${_cleanup_fn_read_sd}:rel + PC
                               #      | _L_fn_read_sd_1:
60 fe 00                       # 9a3d |   mov G, 0
60 ff 00                       # 9a40 |   mov H, 0
                               #      | _cleanup_fn_read_sd:
e4 20                          # 9a43 |   pop A
e4 40                          # 9a45 |   pop B
e4 60                          # 9a47 |   pop C
e4 80                          # 9a49 |   pop D
dc                             # 9a4b |   ret
                               #      | _end_fn_read_sd:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # 9a4c |   push B
e0 20                          # 9a4e |   push A
60 20 e0 fd 00                 # 9a50 |   mov A, 0xfd
60 40 00                       # 9a55 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # 9a58 |   mmap 0xff00, -1, 0x2
62 e0 e0 1e ff 0b 9b           # 9a60 |   mov [0xff1e], ${fn_syscall_entry}
                               #      | _A_call_52:
e0 e0 f7 a2                    # 9a67 |   push ${const__data_9}
5c f8 4b f7                    # 9a6b |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9a6f |   mov SP, SP + 0x2
                               #      | _Z_call_52:
61 20 e0 1c ff                 # 9a73 |   mov A, [0xff1c]
                               #      | _A_scope_7:
                               #      | _B_scope_7:
e8 20 00 f8 40 00              # 9a78 |   jeq A, 0, ${_C_scope_7}:rel + PC
e8 20 e0 f8 00 90 3a 00        # 9a7e |   jeq A, 0x9000, ${_C_scope_7}:rel + PC
61 40 e0 0c ff                 # 9a86 |   mov B, [0xff0c]
2c 40 e0 00 01                 # 9a8b |   and B, 0x100
                               #      | _A_if_67:
e8 40 00 f8 16 00              # 9a90 |   jeq B, 0, ${_E_if_67}:rel + PC
                               #      | _A_call_53:
e0 e0 26 a3                    # 9a96 |   push ${const__str__FORCED_BOOTLOADER__endl}
5c f8 70 f5                    # 9a9a |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # 9a9e |   mov SP, SP + 0x2
                               #      | _Z_call_53:
58 f8 16 00                    # 9aa2 |   jmp ${_C_scope_7}:rel + PC
                               #      | _E_if_67:
                               #      | _C_if_67:
                               #      | _Z_if_67:
                               #      | _A_call_54:
e0 20                          # 9aa6 |   push A
e0 e0 a3 a2                    # 9aa8 |   push ${const__data_5}
5c f8 5e f5                    # 9aac |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9ab0 |   mov SP, SP + 0x4
                               #      | _Z_call_54:
58 f8 8e fd                    # 9ab4 |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_7:
                               #      | _Z_scope_7:
                               #      | _A_call_55:
e0 e0 39 a3                    # 9ab8 |   push ${const__str__READY__endl}
5c f8 fa f6                    # 9abc |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9ac0 |   mov SP, SP + 0x2
                               #      | _Z_call_55:
c6 e0 00 0a ff                 # 9ac4 |   inc [0xff0a], 0
                               #      | _A_loop_10:
                               #      | _BA_loop_10:
                               #      | _A_call_73:
5c f8 56 00                    # 9ac9 |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_73:
46 e0 0a ff                    # 9acd |   inc [0xff0a]
60 20 ff                       # 9ad1 |   mov A, H
                               #      | _A_if_95:
ec fe 00 f8 0a 00              # 9ad4 |   jne G, 0, ${_E_if_95}:rel + PC
58 f8 ef ff                    # 9ada |   jmp ${_BA_loop_10}:rel + PC
                               #      | _E_if_95:
                               #      | _C_if_95:
                               #      | _Z_if_95:
                               #      | _A_if_96:
ec 20 00 f8 16 00              # 9ade |   jne A, 0, ${_E_if_96}:rel + PC
                               #      | _A_call_74:
e0 e0 b6 a3                    # 9ae4 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 ce f6                    # 9ae8 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9aec |   mov SP, SP + 0x2
                               #      | _Z_call_74:
58 f8 d9 ff                    # 9af0 |   jmp ${_BA_loop_10}:rel + PC
                               #      | _E_if_96:
                               #      | _C_if_96:
                               #      | _Z_if_96:
60 40 21                       # 9af4 |   mov B, A*2
60 40 e8 e3 a2                 # 9af7 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # 9afc |   push A
5e 40                          # 9afe |   call [B]
e4 20                          # 9b00 |   pop A
                               #      | _BZ_loop_10:
58 f8 c7 ff                    # 9b02 |   jmp ${_BA_loop_10}:rel + PC
                               #      | _C_loop_10:
                               #      | _Z_loop_10:
                               #      | _cleanup_fn_main:
e4 20                          # 9b06 |   pop A
e4 40                          # 9b08 |   pop B
dc                             # 9b0a |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_64:
f0 ff 1c f8 14 08 00           # 9b0b |   jlt H, 0x14, ${_E_if_64}:rel + PC
dc                             # 9b12 |   ret
                               #      | _E_if_64:
                               #      | _C_if_64:
                               #      | _Z_if_64:
28 ff 1c 01                    # 9b13 |   shl H, 0x1
00 ff e0 07 a2                 # 9b17 |   add H, ${const__SYSCALL_MAP}
5a ff                          # 9b1c |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # 9b1e |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # 9b1f |   push D
e0 60                          # 9b21 |   push C
e0 40                          # 9b23 |   push B
e0 20                          # 9b25 |   push A
60 a0 bc fe                    # 9b27 |   mov SP, SP + -2
62 a0 00                       # 9b2b |   mov [SP], 0
60 a0 bc de                    # 9b2e |   mov SP, SP + -34
62 a0 00                       # 9b32 |   mov [SP], 0
60 20 a0                       # 9b35 |   mov A, SP
                               #      | _A_loop_11:
                               #      | _BA_loop_11:
                               #      | _A_call_56:
5c f8 2b f7                    # 9b38 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_56:
60 60 ff                       # 9b3c |   mov C, H
62 e0 60 00 ff                 # 9b3f |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # 9b44 |   jeq C, 0xa, ${_C_loop_11}:rel + PC
e8 60 1c f8 0d 29 00           # 9b4b |   jeq C, 0xd, ${_C_loop_11}:rel + PC
                               #      | _A_if_70:
f0 20 bc f8 1f 19 00           # 9b52 |   jlt A, SP + 0x1f, ${_E_if_70}:rel + PC
                               #      | _A_call_57:
e0 e0 40 a3                    # 9b59 |   push ${const__data_10}
5c f8 59 f6                    # 9b5d |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9b61 |   mov SP, SP + 0x2
                               #      | _Z_call_57:
e8 ff 00 f8 d3 00              # 9b65 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_70:
                               #      | _C_if_70:
                               #      | _Z_if_70:
62 20 60                       # 9b6b |   mov [A], C
44 20                          # 9b6e |   inc A
                               #      | _BZ_loop_11:
58 f8 c8 ff                    # 9b70 |   jmp ${_BA_loop_11}:rel + PC
                               #      | _C_loop_11:
                               #      | _Z_loop_11:
                               #      | _A_call_58:
e0 1c 20                       # 9b74 |   push 0x20
e0 bc 02                       # 9b77 |   push SP + 0x2
5c f8 62 f8                    # 9b7a |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # 9b7e |   mov SP, SP + 0x4
                               #      | _Z_call_58:
60 60 ff                       # 9b82 |   mov C, H
                               #      | _A_if_72:
e8 60 00 f8 0f 00              # 9b85 |   jeq C, 0, ${_E_if_72}:rel + PC
66 60 00                       # 9b8b |   bmov [C], 0
44 60                          # 9b8e |   inc C
58 f8 08 00                    # 9b90 |   jmp ${_C_if_72}:rel + PC
                               #      | _E_if_72:
60 60 1c ff                    # 9b94 |   mov C, -1
                               #      | _C_if_72:
                               #      | _Z_if_72:
                               #      | _A_call_68:
e0 a0                          # 9b98 |   push SP
5c f8 b1 00                    # 9b9a |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # 9b9e |   mov SP, SP + 0x2
                               #      | _Z_call_68:
e8 ff 00 f8 9c 00              # 9ba2 |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # 9ba8 |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 c9 a3                 # 9bac |   mov [${var__g_num_args}], 0
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 60 bc f8 20 7c 00           # 9bb1 |   jge C, SP + 0x20, ${_C_while_9}:rel + PC
                               #      | _A_call_69:
e0 1c 20                       # 9bb8 |   push 0x20
e0 60                          # 9bbb |   push C
5c f8 1f f8                    # 9bbd |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # 9bc1 |   mov SP, SP + 0x4
                               #      | _Z_call_69:
60 80 ff                       # 9bc5 |   mov D, H
                               #      | _A_if_92:
e8 80 00 f8 0d 00              # 9bc8 |   jeq D, 0, ${_E_if_92}:rel + PC
66 80 00                       # 9bce |   bmov [D], 0
58 f8 08 00                    # 9bd1 |   jmp ${_C_if_92}:rel + PC
                               #      | _E_if_92:
60 80 1c fe                    # 9bd5 |   mov D, -2
                               #      | _C_if_92:
                               #      | _Z_if_92:
61 20 e0 c9 a3                 # 9bd9 |   mov A, [${var__g_num_args}]
                               #      | _A_if_93:
f0 20 1c f8 04 17 00           # 9bde |   jlt A, 0x4, ${_E_if_93}:rel + PC
                               #      | _A_call_70:
e0 e0 8d a3                    # 9be5 |   push ${const__data_11}
5c f8 cd f5                    # 9be9 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9bed |   mov SP, SP + 0x2
                               #      | _Z_call_70:
58 f8 47 00                    # 9bf1 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_93:
                               #      | _C_if_93:
                               #      | _Z_if_93:
                               #      | _A_call_71:
e0 60                          # 9bf5 |   push C
5c f8 c6 f6                    # 9bf7 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9bfb |   mov SP, SP + 0x2
                               #      | _Z_call_71:
                               #      | _A_if_94:
ec fe 00 f8 18 00              # 9bff |   jne G, 0, ${_E_if_94}:rel + PC
                               #      | _A_call_72:
e0 20                          # 9c05 |   push A
e0 e0 a2 a3                    # 9c07 |   push ${const__data_12}
5c f8 ff f3                    # 9c0b |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9c0f |   mov SP, SP + 0x4
                               #      | _Z_call_72:
58 f8 25 00                    # 9c13 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_94:
                               #      | _C_if_94:
                               #      | _Z_if_94:
a8 40 20 1c 01                 # 9c17 |   shl B, A, 0x1
62 e8 ff cc a3                 # 9c1c |   mov [${var__g_args} + B], H
c6 e0 20 c9 a3                 # 9c21 |   inc [${var__g_num_args}], A
c4 60 80                       # 9c26 |   inc C, D
                               #      | _BZ_while_9:
58 f8 88 ff                    # 9c29 |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
c4 fe 00                       # 9c2d |   inc G, 0
61 ff bc 22                    # 9c30 |   mov H, [SP + 0x22]
58 f8 0a 00                    # 9c34 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # 9c38 |   mov G, 0
60 ff 00                       # 9c3b |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # 9c3e |   mov SP, SP + 0x24
e4 20                          # 9c42 |   pop A
e4 40                          # 9c44 |   pop B
e4 60                          # 9c46 |   pop C
e4 80                          # 9c48 |   pop D
dc                             # 9c4a |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # 9c4b |   push A
61 20 bc 04                    # 9c4d |   mov A, [SP + 0x4]
                               #      | _A_call_59:
e0 e0 52 a3                    # 9c51 |   push ${const__str__PING}
e0 20                          # 9c55 |   push A
5c f8 4f f7                    # 9c57 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9c5b |   mov SP, SP + 0x4
                               #      | _Z_call_59:
                               #      | _A_if_74:
ec ff 00 f8 0d 00              # 9c5f |   jne H, 0, ${_E_if_74}:rel + PC
c4 ff 00                       # 9c65 |   inc H, 0
58 f8 e7 00                    # 9c68 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_74:
                               #      | _C_if_74:
                               #      | _Z_if_74:
                               #      | _A_call_60:
e0 e0 57 a3                    # 9c6c |   push ${const__str__READ}
e0 20                          # 9c70 |   push A
5c f8 34 f7                    # 9c72 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9c76 |   mov SP, SP + 0x4
                               #      | _Z_call_60:
                               #      | _A_if_76:
ec ff 00 f8 0e 00              # 9c7a |   jne H, 0, ${_E_if_76}:rel + PC
60 ff 1c 02                    # 9c80 |   mov H, 0x2
58 f8 cb 00                    # 9c84 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_76:
                               #      | _C_if_76:
                               #      | _Z_if_76:
                               #      | _A_call_61:
e0 e0 5c a3                    # 9c88 |   push ${const__str__WRITE}
e0 20                          # 9c8c |   push A
5c f8 18 f7                    # 9c8e |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9c92 |   mov SP, SP + 0x4
                               #      | _Z_call_61:
                               #      | _A_if_78:
ec ff 00 f8 0e 00              # 9c96 |   jne H, 0, ${_E_if_78}:rel + PC
60 ff 1c 03                    # 9c9c |   mov H, 0x3
58 f8 af 00                    # 9ca0 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_78:
                               #      | _C_if_78:
                               #      | _Z_if_78:
                               #      | _A_call_62:
e0 e0 62 a3                    # 9ca4 |   push ${const__str__READB}
e0 20                          # 9ca8 |   push A
5c f8 fc f6                    # 9caa |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9cae |   mov SP, SP + 0x4
                               #      | _Z_call_62:
                               #      | _A_if_80:
ec ff 00 f8 0e 00              # 9cb2 |   jne H, 0, ${_E_if_80}:rel + PC
60 ff 1c 04                    # 9cb8 |   mov H, 0x4
58 f8 93 00                    # 9cbc |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_80:
                               #      | _C_if_80:
                               #      | _Z_if_80:
                               #      | _A_call_63:
e0 e0 68 a3                    # 9cc0 |   push ${const__str__WRITEB}
e0 20                          # 9cc4 |   push A
5c f8 e0 f6                    # 9cc6 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9cca |   mov SP, SP + 0x4
                               #      | _Z_call_63:
                               #      | _A_if_82:
ec ff 00 f8 0e 00              # 9cce |   jne H, 0, ${_E_if_82}:rel + PC
60 ff 1c 05                    # 9cd4 |   mov H, 0x5
58 f8 77 00                    # 9cd8 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_82:
                               #      | _C_if_82:
                               #      | _Z_if_82:
                               #      | _A_call_64:
e0 e0 6f a3                    # 9cdc |   push ${const__str__JMP}
e0 20                          # 9ce0 |   push A
5c f8 c4 f6                    # 9ce2 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9ce6 |   mov SP, SP + 0x4
                               #      | _Z_call_64:
                               #      | _A_if_84:
ec ff 00 f8 0e 00              # 9cea |   jne H, 0, ${_E_if_84}:rel + PC
60 ff 1c 06                    # 9cf0 |   mov H, 0x6
58 f8 5b 00                    # 9cf4 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_84:
                               #      | _C_if_84:
                               #      | _Z_if_84:
                               #      | _A_call_65:
e0 e0 73 a3                    # 9cf8 |   push ${const__str__JMP_PERSIST}
e0 20                          # 9cfc |   push A
5c f8 a8 f6                    # 9cfe |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9d02 |   mov SP, SP + 0x4
                               #      | _Z_call_65:
                               #      | _A_if_86:
ec ff 00 f8 0e 00              # 9d06 |   jne H, 0, ${_E_if_86}:rel + PC
60 ff 1c 07                    # 9d0c |   mov H, 0x7
58 f8 3f 00                    # 9d10 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_86:
                               #      | _C_if_86:
                               #      | _Z_if_86:
                               #      | _A_call_66:
e0 e0 7f a3                    # 9d14 |   push ${const__str__INITSD}
e0 20                          # 9d18 |   push A
5c f8 8c f6                    # 9d1a |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9d1e |   mov SP, SP + 0x4
                               #      | _Z_call_66:
                               #      | _A_if_88:
ec ff 00 f8 0e 00              # 9d22 |   jne H, 0, ${_E_if_88}:rel + PC
60 ff 1c 08                    # 9d28 |   mov H, 0x8
58 f8 23 00                    # 9d2c |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_88:
                               #      | _C_if_88:
                               #      | _Z_if_88:
                               #      | _A_call_67:
e0 e0 86 a3                    # 9d30 |   push ${const__str__READSD}
e0 20                          # 9d34 |   push A
5c f8 70 f6                    # 9d36 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9d3a |   mov SP, SP + 0x4
                               #      | _Z_call_67:
                               #      | _A_if_90:
ec ff 00 f8 0e 00              # 9d3e |   jne H, 0, ${_E_if_90}:rel + PC
60 ff 1c 09                    # 9d44 |   mov H, 0x9
58 f8 07 00                    # 9d48 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_90:
                               #      | _C_if_90:
                               #      | _Z_if_90:
60 ff 00                       # 9d4c |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # 9d4f |   pop A
dc                             # 9d51 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 9d52 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # a147 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
0a 90 51 91 63 92 69 91 d8 91 2e 92 15 92 82 92 bd 92 0d 93 46 93 7f 93 a6 93 dc 93 fb 93 02 94 0d 94 b6 91 a8 94 7a 95 # a207 |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # a22f |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # a253 |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # a259 |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # a268 |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # a275 |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # a284 |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # a294 |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # a2a3 |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # a2ae |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__str__TIMEOUT__endl:
54 49 4d 45 4f 55 54 0a 00     # a2c0 |   .data str:"TIMEOUT\n"
                               #      | const__str__INIT_OK__endl:
49 4e 49 54 5f 4f 4b 0a 00     # a2c9 |   .data str:"INIT_OK\n"
                               #      | const__data_7:
72 65 61 64 20 25 64 20 62 79 74 65 73 0a 00 # a2d2 |   .data str:"read %d bytes\n"
                               #      | const__data_8:
25 68 20 00                    # a2e1 |   .data str:"%h "
                               #      | const__HANDLER_MAP:
bc 95 f6 95 fe 96 f6 95 fe 96 fe 97 fe 97 67 98 f3 98 # a2e5 |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp, $fn_handle_init_sd, $fn_handle_read_sd]
                               #      | const__data_9:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 34 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 33 0a 00 # a2f7 |   .data str:"Weeekly3006 - Hardware v1.4 - Bootloader v2.3\n"
                               #      | const__str__FORCED_BOOTLOADER__endl:
46 4f 52 43 45 44 5f 42 4f 4f 54 4c 4f 41 44 45 52 0a 00 # a326 |   .data str:"FORCED_BOOTLOADER\n"
                               #      | const__str__READY__endl:
52 45 41 44 59 0a 00           # a339 |   .data str:"READY\n"
                               #      | const__data_10:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # a340 |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # a352 |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # a357 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # a35c |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # a362 |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # a368 |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # a36f |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # a373 |   .data str:"JMP_PERSIST"
                               #      | const__str__INITSD:
49 4e 49 54 53 44 00           # a37f |   .data str:"INITSD"
                               #      | const__str__READSD:
52 45 41 44 53 44 00           # a386 |   .data str:"READSD"
                               #      | const__data_11:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 34 0a 00 # a38d |   .data str:"TOO_MANY_ARGS max=4\n"
                               #      | const__data_12:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # a3a2 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # a3b6 |   .data str:"UNKNOWN_COMMAND\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa3c7
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # a3c7 |   .bss size:2 align:1
                               #      | var__g_num_args:
                               # a3c9 |   .bss size:2 align:1
                               # a3cb |   .align dummy_size:1 align:2
                               #      | var__g_args:
                               # a3cc |   .bss size:10 align:2
                               #      | SECTION_END_static_data:
                               #      | 
