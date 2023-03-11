                               #      | .config CODE_OFFSET 0x9000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 fe 8f                 # 9000 |   mov SP, 0x8ffe
                               #      | _A_call_103:
5c f8 4e 0c                    # 9005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_103:
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
                               #      | _A_scope_4:
                               #      | _B_scope_4:
f0 fe 1c f8 41 12 00           # 93b9 |   jlt G, 0x41, ${_C_scope_4}:rel + PC
f8 fe 1c f8 5a 0b 00           # 93c0 |   jgt G, 0x5a, ${_C_scope_4}:rel + PC
30 fe 1c 20                    # 93c7 |   or G, 0x20
                               #      | _C_scope_4:
                               #      | _Z_scope_4:
                               #      | _A_scope_5:
                               #      | _B_scope_5:
f0 ff 1c f8 41 12 00           # 93cb |   jlt H, 0x41, ${_C_scope_5}:rel + PC
f8 ff 1c f8 5a 0b 00           # 93d2 |   jgt H, 0x5a, ${_C_scope_5}:rel + PC
30 ff 1c 20                    # 93d9 |   or H, 0x20
                               #      | _C_scope_5:
                               #      | _Z_scope_5:
84 ff fe ff                    # 93dd |   sub H, G, H
ec ff 00 f8 14 00              # 93e1 |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # 93e7 |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # 93ed |   inc E
44 fd                          # 93ef |   inc F
                               #      | _BZ_loop_5:
58 f8 bf ff                    # 93f1 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # 93f5 |   pop A
dc                             # 93f7 |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # 93f8 |   mov H, [SP + 0x2]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 fe ff                       # 93fc |   bmov G, [H]
e9 fe bc f8 04 17 00           # 93ff |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_28:
ec fe 00 f8 0a 00              # 9406 |   jne G, 0, ${_E_if_28}:rel + PC
60 ff 00                       # 940c |   mov H, 0
dc                             # 940f |   ret
                               #      | _E_if_28:
                               #      | _C_if_28:
                               #      | _Z_if_28:
44 ff                          # 9410 |   inc H
                               #      | _BZ_loop_6:
58 f8 ea ff                    # 9412 |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _cleanup_fn_strchr:
dc                             # 9416 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc 6c a6 02              # 9417 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # 941d |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 6c a6                 # 941e |   inc H, [${var__rand__state}]
62 e0 ff 6c a6                 # 9423 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # 9428 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # 9429 |   push D
e0 60                          # 942b |   push C
e0 40                          # 942d |   push B
e0 20                          # 942f |   push A
61 40 e0 10 ff                 # 9431 |   mov B, [0xff10]
61 60 e0 12 ff                 # 9436 |   mov C, [0xff12]
61 80 e0 14 ff                 # 943b |   mov D, [0xff14]
61 20 bc 0e                    # 9440 |   mov A, [SP + 0xe]
60 ff 00                       # 9444 |   mov H, 0
                               #      | _A_if_29:
fc 28 20 f8 09 00              # 9447 |   jge A + B, A, ${_E_if_29}:rel + PC
c4 ff 00                       # 944d |   inc H, 0
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
60 40 44                       # 9450 |   mov B, B + A
81 20 bc ff 0c                 # 9453 |   add A, [SP + 0xc], H
60 ff 00                       # 9458 |   mov H, 0
                               #      | _A_scope_6:
                               #      | _B_scope_6:
f0 2c 20 f8 10 00              # 945b |   jlt A + C, A, ${_C_scope_6}:rel + PC
f0 20 ff f8 0a 00              # 9461 |   jlt A, H, ${_C_scope_6}:rel + PC
58 f8 07 00                    # 9467 |   jmp ${_Z_scope_6}:rel + PC
                               #      | _C_scope_6:
c4 ff 00                       # 946b |   inc H, 0
                               #      | _Z_scope_6:
60 60 64                       # 946e |   mov C, C + A
81 20 bc ff 0a                 # 9471 |   add A, [SP + 0xa], H
60 80 84                       # 9476 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # 9479 |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 14 ff                 # 947d |   mov H, [0xff14]
                               #      | _A_if_32:
f4 ff 80 f8 0a 00              # 9482 |   jle H, D, ${_E_if_32}:rel + PC
58 f8 33 00                    # 9488 |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_32:
ec ff 80 f8 2b 00              # 948c |   jne H, D, ${_E2_if_32}:rel + PC
61 ff e0 12 ff                 # 9492 |   mov H, [0xff12]
                               #      | _A_if_33:
f4 ff 60 f8 0a 00              # 9497 |   jle H, C, ${_E_if_33}:rel + PC
58 f8 1e 00                    # 949d |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_33:
ec ff 60 f8 16 00              # 94a1 |   jne H, C, ${_E2_if_33}:rel + PC
fa e0 40 f8 10 ff 14 00        # 94a7 |   jgt [0xff10], B, ${_C_loop_7}:rel + PC
                               #      | _A_if_35:
e8 20 00 f8 08 00              # 94af |   jeq A, 0, ${_E_if_35}:rel + PC
5c 20                          # 94b5 |   call A
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
58 f8 c6 ff                    # 94b7 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # 94bb |   pop A
e4 40                          # 94bd |   pop B
e4 60                          # 94bf |   pop C
e4 80                          # 94c1 |   pop D
dc                             # 94c3 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # 94c4 |   push D
e0 60                          # 94c6 |   push C
e0 40                          # 94c8 |   push B
e0 20                          # 94ca |   push A
61 fc bc 0a                    # 94cc |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # 94d0 |   shl F, [SP + 0xe], 0x1
00 fd fc                       # 94d6 |   add F, E
61 fe bc 0c                    # 94d9 |   mov G, [SP + 0xc]
61 40 fe                       # 94dd |   mov B, [G]
60 60 1c 07                    # 94e0 |   mov C, 0x7
60 20 00                       # 94e4 |   mov A, 0
60 a0 bc fe                    # 94e7 |   mov SP, SP + -2
                               #      | _A_for_5:
                               #      | _BA_for_5:
fc fc fd f8 9e 00              # 94eb |   jge E, F, ${_C_for_5}:rel + PC
                               #      |   # decode one line
60 20 00                       # 94f1 |   mov A, 0
62 a0 1c ff                    # 94f4 |   mov [SP], -1
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
                               #      | _A_if_36:
ec 60 1c f8 ff 10 00           # 94f8 |   jne C, -1, ${_E_if_36}:rel + PC
44 fe                          # 94ff |   inc G
61 40 fe                       # 9501 |   mov B, [G]
60 60 1c 07                    # 9504 |   mov C, 0x7
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
98 80 40 60                    # 9508 |   getb D, B, C
48 60                          # 950c |   dec C
40 80                          # 950e |   bool D
b0 20 21 80                    # 9510 |   or A, A*2, D
4a a0                          # 9514 |   dec [SP]
                               #      | _A_if_37:
ee a0 00 f8 1b 00              # 9516 |   jne [SP], 0, ${_E_if_37}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # 951c |   mov H, A
b9 20 bc 12                    # 951f |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # 9523 |   shr A, -1, A + 0x10
ae fc ff 20                    # 9529 |   and [E], H, A
58 f8 54 00                    # 952d |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_37:
ec 20 00 f8 20 00              # 9531 |   jne A, 0, ${_E2_if_37}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # 9537 |   sub H, E, 0x2
                               #      | _A_if_38:
f1 ff bc f8 0c 0e 00           # 953c |   jlt H, [SP + 0xc], ${_E_if_38}:rel + PC
63 fc ff                       # 9543 |   mov [E], [H]
58 f8 07 00                    # 9546 |   jmp ${_C_if_38}:rel + PC
                               #      | _E_if_38:
62 fc 00                       # 954a |   mov [E], 0
                               #      | _C_if_38:
                               #      | _Z_if_38:
58 f8 34 00                    # 954d |   jmp ${_C_loop_8}:rel + PC
                               #      | _E2_if_37:
ec 20 1c f8 02 13 00           # 9551 |   jne A, 0x2, ${_E3_if_37}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # 9558 |   sub H, E, 0x4
63 fc ff                       # 955d |   mov [E], [H]
58 f8 21 00                    # 9560 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E3_if_37:
ec 20 1c f8 06 0e 00           # 9564 |   jne A, 0x6, ${_E4_if_37}:rel + PC
                               #      |   # all zeros
62 fc 00                       # 956b |   mov [E], 0
58 f8 13 00                    # 956e |   jmp ${_C_loop_8}:rel + PC
                               #      | _E4_if_37:
ec 20 1c f8 07 0b 00           # 9572 |   jne A, 0x7, ${_E5_if_37}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # 9579 |   mov [SP], [SP + 0x12]
                               #      | _E5_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _BZ_loop_8:
58 f8 7b ff                    # 957d |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _BZ_for_5:
00 fc 1c 02                    # 9581 |   add E, 0x2
58 f8 66 ff                    # 9585 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # 9589 |   mov SP, SP + 0x2
e4 20                          # 958d |   pop A
e4 40                          # 958f |   pop B
e4 60                          # 9591 |   pop C
e4 80                          # 9593 |   pop D
dc                             # 9595 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # 9596 |   push B
e0 20                          # 9598 |   push A
61 20 bc 08                    # 959a |   mov A, [SP + 0x8]
60 40 1c 1f                    # 959e |   mov B, 0x1f
                               #      | _A_scope_7:
                               #      | _B_scope_7:
f0 20 1c f8 20 13 00           # 95a2 |   jlt A, 0x20, ${_C_scope_7}:rel + PC
fc 20 e0 f8 80 00 0c 00        # 95a9 |   jge A, 0x80, ${_C_scope_7}:rel + PC
60 40 3c e0                    # 95b1 |   mov B, A + -32
                               #      | _C_scope_7:
                               #      | _Z_scope_7:
28 40 1c 01                    # 95b5 |   shl B, 0x1
61 40 e8 c2 a3                 # 95b9 |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_18:
e0 1c 0c                       # 95be |   push 0xc
e0 1c 10                       # 95c1 |   push 0x10
e0 e8 cd 9f                    # 95c4 |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # 95c8 |   push [SP + 0xc]
5c f8 f9 fe                    # 95cb |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # 95cf |   mov SP, SP + 0x8
                               #      | _Z_call_18:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # 95d3 |   pop A
e4 40                          # 95d5 |   pop B
dc                             # 95d7 |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_20:
e0 00                          # 95d8 |   push 0
5c f8 15 00                    # 95da |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 95de |   mov SP, SP + 0x2
                               #      | _Z_call_20:
                               #      | _A_call_21:
e0 e0 ce a4                    # 95e2 |   push ${const__str__PONG__endl}
5c f8 d0 fb                    # 95e6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 95ea |   mov SP, SP + 0x2
                               #      | _Z_call_21:
                               #      | _cleanup_fn_handle_ping:
dc                             # 95ee |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # 95ef |   inc G, 0
                               #      | _A_if_41:
eb e0 bc f8 6e a6 02 1f 00     # 95f2 |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_41}:rel + PC
                               #      | _A_call_19:
e2 e0 6e a6                    # 95fb |   push [${var__g_num_args}]
e2 bc 04                       # 95ff |   push [SP + 0x4]
e0 e0 aa a4                    # 9602 |   push ${const__data_1}
5c f8 04 fa                    # 9606 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 960a |   mov SP, SP + 0x6
                               #      | _Z_call_19:
60 fe 00                       # 960e |   mov G, 0
                               #      | _E_if_41:
                               #      | _C_if_41:
                               #      | _Z_if_41:
                               #      | _cleanup_fn_check_num_args:
dc                             # 9611 |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # 9612 |   push D
e0 60                          # 9614 |   push C
e0 40                          # 9616 |   push B
e0 20                          # 9618 |   push A
60 a0 bc fa                    # 961a |   mov SP, SP + -6
                               #      | _A_call_22:
e0 1c 02                       # 961e |   push 0x2
5c f8 ce ff                    # 9621 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9625 |   mov SP, SP + 0x2
                               #      | _Z_call_22:
e8 fe 00 f8 9f 00              # 9629 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_24:
5c f8 a6 00                    # 962f |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_24:
e8 fe 00 f8 95 00              # 9633 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 70 a6                 # 9639 |   mov A, [${var__g_args}]
61 40 e0 72 a6                 # 963e |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_25:
e0 40                          # 9643 |   push B
e0 20                          # 9645 |   push A
e0 e0 f0 a4                    # 9647 |   push ${const__data_2}
5c f8 bf f9                    # 964b |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 964f |   mov SP, SP + 0x6
                               #      | _Z_call_25:
                               #      | _A_if_47:
ee bc 1c f8 10 04 35 00        # 9653 |   jne [SP + 0x10], 0x4, ${_E_if_47}:rel + PC
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 20 40 f8 29 00              # 965b |   jge A, B, ${_C_while_5}:rel + PC
61 60 20                       # 9661 |   mov C, [A]
                               #      | _A_call_26:
e0 60                          # 9664 |   push C
5c f8 eb fa                    # 9666 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 966a |   mov SP, SP + 0x2
                               #      | _Z_call_26:
20 60 1c 08                    # 966e |   shr C, 0x8
                               #      | _A_call_27:
e0 60                          # 9672 |   push C
5c f8 dd fa                    # 9674 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 9678 |   mov SP, SP + 0x2
                               #      | _Z_call_27:
60 20 3c 02                    # 967c |   mov A, A + 0x2
                               #      | _BZ_while_5:
58 f8 db ff                    # 9680 |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
58 f8 39 00                    # 9684 |   jmp ${_C_if_47}:rel + PC
                               #      | _E_if_47:
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc 20 40 f8 35 00              # 9688 |   jge A, B, ${_C_while_6}:rel + PC
95 80 20 1c 08                 # 968e |   ror D, [A], 0x8
                               #      | _A_if_48:
ee bc 1c f8 10 0b 0c 00        # 9693 |   jne [SP + 0x10], 0xb, ${_E_if_48}:rel + PC
14 80 1c 08                    # 969b |   ror D, 0x8
                               #      | _E_if_48:
                               #      | _C_if_48:
                               #      | _Z_if_48:
                               #      | _A_call_28:
e0 a0                          # 969f |   push SP
e0 80                          # 96a1 |   push D
5c f8 35 fb                    # 96a3 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 96a7 |   mov SP, SP + 0x4
                               #      | _Z_call_28:
                               #      | _A_call_29:
e0 a0                          # 96ab |   push SP
5c f8 09 fb                    # 96ad |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 96b1 |   mov SP, SP + 0x2
                               #      | _Z_call_29:
60 20 3c 02                    # 96b5 |   mov A, A + 0x2
                               #      | _BZ_while_6:
58 f8 cf ff                    # 96b9 |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
                               #      | _C_if_47:
                               #      | _Z_if_47:
                               #      | _A_call_30:
e0 1c 0a                       # 96bd |   push 0xa
5c f8 91 fa                    # 96c0 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 96c4 |   mov SP, SP + 0x2
                               #      | _Z_call_30:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # 96c8 |   mov SP, SP + 0x6
e4 20                          # 96cc |   pop A
e4 40                          # 96ce |   pop B
e4 60                          # 96d0 |   pop C
e4 80                          # 96d2 |   pop D
dc                             # 96d4 |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # 96d5 |   push C
e0 40                          # 96d7 |   push B
e0 20                          # 96d9 |   push A
61 20 e0 70 a6                 # 96db |   mov A, [${var__g_args}]
61 40 e0 72 a6                 # 96e0 |   mov B, [${var__g_args} + 0002]
60 60 e0 d4 a4                 # 96e5 |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # 96ea |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 e3 a4                 # 96f0 |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # 96f5 |   and G, A, 0x1
ec fe 00 f8 18 00              # 96fa |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # 9700 |   and G, B, 0x1
ec fe 00 f8 0d 00              # 9705 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # 970b |   inc G, 0
58 f8 11 00                    # 970e |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_23:
e0 60                          # 9712 |   push C
5c f8 a2 fa                    # 9714 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9718 |   mov SP, SP + 0x2
                               #      | _Z_call_23:
60 fe 00                       # 971c |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # 971f |   pop A
e4 40                          # 9721 |   pop B
e4 60                          # 9723 |   pop C
dc                             # 9725 |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # 9726 |   push D
e0 60                          # 9728 |   push C
e0 40                          # 972a |   push B
e0 20                          # 972c |   push A
60 a0 bc fa                    # 972e |   mov SP, SP + -6
                               #      | _A_call_31:
e0 1c 02                       # 9732 |   push 0x2
5c f8 ba fe                    # 9735 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 9739 |   mov SP, SP + 0x2
                               #      | _Z_call_31:
e8 fe 00 f8 dc 00              # 973d |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_32:
5c f8 92 ff                    # 9743 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_32:
e8 fe 00 f8 d2 00              # 9747 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 70 a6                 # 974d |   mov A, [${var__g_args}]
61 40 e0 72 a6                 # 9752 |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_51:
ee bc 1c f8 10 03 55 00        # 9757 |   jne [SP + 0x10], 0x3, ${_E_if_51}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 49 00              # 975f |   jge A, B, ${_C_while_7}:rel + PC
                               #      | _A_for_6:
60 80 00                       # 9765 |   mov D, 0
                               #      | _BA_for_6:
fc 80 1c f8 04 19 00           # 9768 |   jge D, 0x4, ${_C_for_6}:rel + PC
                               #      | _A_call_33:
5c f8 f4 fa                    # 976f |   call ${fn_getc}:rel + PC
                               #      | _Z_call_33:
62 e0 ff 00 ff                 # 9773 |   mov [0xff00], H
62 b0 ff                       # 9778 |   mov [SP + D], H
                               #      | _BZ_for_6:
44 80                          # 977b |   inc D
58 f8 eb ff                    # 977d |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_34:
e0 a0                          # 9781 |   push SP
5c f8 3a fb                    # 9783 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9787 |   mov SP, SP + 0x2
                               #      | _Z_call_34:
e8 fe 00 f8 7f 00              # 978b |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # 9791 |   shl C, H, 0x8
20 ff 1c 08                    # 9796 |   shr H, 0x8
30 60 ff                       # 979a |   or C, H
62 20 60                       # 979d |   mov [A], C
60 20 3c 02                    # 97a0 |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 bb ff                    # 97a4 |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 31 00                    # 97a8 |   jmp ${_C_if_51}:rel + PC
                               #      | _E_if_51:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 2d 00              # 97ac |   jge A, B, ${_C_while_8}:rel + PC
                               #      | _A_call_35:
5c f8 b1 fa                    # 97b2 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_35:
62 e0 ff 00 ff                 # 97b6 |   mov [0xff00], H
60 60 ff                       # 97bb |   mov C, H
                               #      | _A_call_36:
5c f8 a5 fa                    # 97be |   call ${fn_getc}:rel + PC
                               #      | _Z_call_36:
62 e0 ff 00 ff                 # 97c2 |   mov [0xff00], H
28 ff 1c 08                    # 97c7 |   shl H, 0x8
30 60 ff                       # 97cb |   or C, H
62 20 60                       # 97ce |   mov [A], C
60 20 3c 02                    # 97d1 |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 d7 ff                    # 97d5 |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_51:
                               #      | _Z_if_51:
                               #      | _A_call_37:
5c f8 8a fa                    # 97d9 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_37:
62 e0 ff 00 ff                 # 97dd |   mov [0xff00], H
                               #      | _A_scope_8:
                               #      | _B_scope_8:
e8 ff 1c f8 0a 12 00           # 97e2 |   jeq H, 0xa, ${_C_scope_8}:rel + PC
e8 ff 1c f8 0d 0b 00           # 97e9 |   jeq H, 0xd, ${_C_scope_8}:rel + PC
58 f8 1a 00                    # 97f0 |   jmp ${_L_fn_handle_write_1}:rel + PC
                               #      | _C_scope_8:
                               #      | _Z_scope_8:
                               #      | _A_call_38:
e0 40                          # 97f4 |   push B
e2 e0 70 a6                    # 97f6 |   push [${var__g_args}]
e0 e0 ff a4                    # 97fa |   push ${const__data_3}
5c f8 0c f8                    # 97fe |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # 9802 |   mov SP, SP + 0x6
                               #      | _Z_call_38:
58 f8 13 00                    # 9806 |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_39:
e0 e0 0f a5                    # 980a |   push ${const__data_4}
5c f8 a8 f9                    # 980e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9812 |   mov SP, SP + 0x2
                               #      | _Z_call_39:
60 fe 00                       # 9816 |   mov G, 0
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # 9819 |   mov SP, SP + 0x6
e4 20                          # 981d |   pop A
e4 40                          # 981f |   pop B
e4 60                          # 9821 |   pop C
e4 80                          # 9823 |   pop D
dc                             # 9825 |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
                               #      | _A_call_40:
e0 1c 01                       # 9826 |   push 0x1
5c f8 c6 fd                    # 9829 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 982d |   mov SP, SP + 0x2
                               #      | _Z_call_40:
e8 fe 00 f8 5d 00              # 9831 |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_if_56:
ee bc 1c f8 02 06 1c 00        # 9837 |   jne [SP + 0x2], 0x6, ${_E_if_56}:rel + PC
                               #      | _A_call_41:
e2 e0 70 a6                    # 983f |   push [${var__g_args}]
e0 e0 1e a5                    # 9843 |   push ${const__data_5}
5c f8 c3 f7                    # 9847 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 984b |   mov SP, SP + 0x4
                               #      | _Z_call_41:
5a f8 21 0e                    # 984f |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_56:
                               #      | _C_if_56:
                               #      | _Z_if_56:
63 e0 e0 1c ff 70 a6           # 9853 |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_42:
e2 e0 1c ff                    # 985a |   push [0xff1c]
e0 e0 29 a5                    # 985e |   push ${const__data_6}
5c f8 a8 f7                    # 9862 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9866 |   mov SP, SP + 0x4
                               #      | _Z_call_42:
                               #      | glb_jmp_to_stored_target:
62 e0 00 0a ff                 # 986a |   mov [0xff0a], 0
60 20 00                       # 986f |   mov A, 0
60 40 00                       # 9872 |   mov B, 0
60 60 00                       # 9875 |   mov C, 0
60 80 00                       # 9878 |   mov D, 0
60 a0 00                       # 987b |   mov SP, 0
60 fc 00                       # 987e |   mov E, 0
60 fd 00                       # 9881 |   mov F, 0
60 fe 00                       # 9884 |   mov G, 0
60 ff 00                       # 9887 |   mov H, 0
5a e0 1c ff                    # 988a |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # 988e |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_handle_init_sd:
                               #      | _begin_fn_handle_init_sd:
e0 60                          # 988f |   push C
e0 40                          # 9891 |   push B
e0 20                          # 9893 |   push A
1e e0 1c 24 ff 0c              # 9895 |   setb [0xff24], 0xc
1e e0 1c 24 ff 1f              # 989b |   setb [0xff24], 0x1f
                               #      | _A_call_43:
e0 00                          # 98a1 |   push 0
e0 e0 60 ea                    # 98a3 |   push 0xea60
e0 00                          # 98a7 |   push 0
e0 00                          # 98a9 |   push 0
5c f8 7e fb                    # 98ab |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 98af |   mov SP, SP + 0x8
                               #      | _Z_call_43:
1e e0 1c 24 ff 0f              # 98b3 |   setb [0xff24], 0xf
1e e0 1c 24 ff 1c              # 98b9 |   setb [0xff24], 0x1c
                               #      | _A_for_7:
60 60 00                       # 98bf |   mov C, 0
                               #      | _BA_for_7:
fc 60 1c f8 0a 30 00           # 98c2 |   jge C, 0xa, ${_C_for_7}:rel + PC
                               #      | _A_for_8:
60 20 00                       # 98c9 |   mov A, 0
                               #      | _BA_for_8:
fc 20 1c f8 ff 1a 00           # 98cc |   jge A, -1, ${_C_for_8}:rel + PC
99 40 e0 1c 26 ff 09           # 98d3 |   getb B, [0xff26], 0x9
e8 40 00 f8 0c 00              # 98da |   jeq B, 0, ${_C_for_8}:rel + PC
                               #      | _BZ_for_8:
44 20                          # 98e0 |   inc A
58 f8 ea ff                    # 98e2 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
e8 40 00 f8 0c 00              # 98e6 |   jeq B, 0, ${_C_for_7}:rel + PC
                               #      | _BZ_for_7:
44 60                          # 98ec |   inc C
58 f8 d4 ff                    # 98ee |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _A_if_59:
e8 40 00 f8 16 00              # 98f2 |   jeq B, 0, ${_E_if_59}:rel + PC
                               #      | _A_call_44:
e0 e0 3b a5                    # 98f8 |   push ${const__str__TIMEOUT__endl}
5c f8 ba f8                    # 98fc |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9900 |   mov SP, SP + 0x2
                               #      | _Z_call_44:
58 f8 10 00                    # 9904 |   jmp ${_cleanup_fn_handle_init_sd}:rel + PC
                               #      | _E_if_59:
                               #      | _C_if_59:
                               #      | _Z_if_59:
                               #      | _A_call_45:
e0 e0 44 a5                    # 9908 |   push ${const__str__INIT_OK__endl}
5c f8 aa f8                    # 990c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9910 |   mov SP, SP + 0x2
                               #      | _Z_call_45:
                               #      | _cleanup_fn_handle_init_sd:
e4 20                          # 9914 |   pop A
e4 40                          # 9916 |   pop B
e4 60                          # 9918 |   pop C
dc                             # 991a |   ret
                               #      | _end_fn_handle_init_sd:
                               #      | 
                               #      | fn_handle_read_sd:
                               #      | _begin_fn_handle_read_sd:
e0 80                          # 991b |   push D
e0 60                          # 991d |   push C
e0 40                          # 991f |   push B
e0 20                          # 9921 |   push A
60 a0 f4 fe fd                 # 9923 |   mov SP, 0xfdfe + SP
                               #      | _A_call_46:
e0 1c 02                       # 9928 |   push 0x2
5c f8 c4 fc                    # 992b |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # 992f |   mov SP, SP + 0x2
                               #      | _Z_call_46:
e8 fe 00 f8 6b 00              # 9933 |   jeq G, 0, ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _A_call_47:
e2 e0 72 a6                    # 9939 |   push [${var__g_args} + 0002]
e2 e0 70 a6                    # 993d |   push [${var__g_args}]
e0 bc 04                       # 9941 |   push SP + 0x4
5c f8 68 00                    # 9944 |   call ${fn_read_sd}:rel + PC
60 a0 bc 06                    # 9948 |   mov SP, SP + 0x6
                               #      | _Z_call_47:
                               #      | _A_if_68:
ec fe 00 f8 16 00              # 994c |   jne G, 0, ${_E_if_68}:rel + PC
                               #      | _A_call_48:
e0 e0 3b a5                    # 9952 |   push ${const__str__TIMEOUT__endl}
5c f8 60 f8                    # 9956 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 995a |   mov SP, SP + 0x2
                               #      | _Z_call_48:
58 f8 40 00                    # 995e |   jmp ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _E_if_68:
                               #      | _C_if_68:
                               #      | _Z_if_68:
60 20 ff                       # 9962 |   mov A, H
                               #      | _A_call_49:
e0 20                          # 9965 |   push A
e0 e0 4d a5                    # 9967 |   push ${const__data_7}
5c f8 9f f6                    # 996b |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 996f |   mov SP, SP + 0x4
                               #      | _Z_call_49:
00 20 a0                       # 9973 |   add A, SP
                               #      | _A_for_11:
60 40 a0                       # 9976 |   mov B, SP
                               #      | _BA_for_11:
fc 40 20 f8 1a 00              # 9979 |   jge B, A, ${_C_for_11}:rel + PC
                               #      | _A_call_50:
e2 40                          # 997f |   push [B]
e0 e0 5c a5                    # 9981 |   push ${const__data_8}
5c f8 85 f6                    # 9985 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9989 |   mov SP, SP + 0x4
                               #      | _Z_call_50:
                               #      | _BZ_for_11:
44 40                          # 998d |   inc B
58 f8 ea ff                    # 998f |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
                               #      | _A_call_51:
e0 1c 0a                       # 9993 |   push 0xa
5c f8 bb f7                    # 9996 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 999a |   mov SP, SP + 0x2
                               #      | _Z_call_51:
                               #      | _cleanup_fn_handle_read_sd:
60 a0 f4 02 02                 # 999e |   mov SP, 0x202 + SP
e4 20                          # 99a3 |   pop A
e4 40                          # 99a5 |   pop B
e4 60                          # 99a7 |   pop C
e4 80                          # 99a9 |   pop D
dc                             # 99ab |   ret
                               #      | _end_fn_handle_read_sd:
                               #      | 
                               #      | fn_read_sd:
                               #      | _begin_fn_read_sd:
e0 80                          # 99ac |   push D
e0 60                          # 99ae |   push C
e0 40                          # 99b0 |   push B
e0 20                          # 99b2 |   push A
63 e0 bc 22 ff 0c              # 99b4 |   mov [0xff22], [SP + 0xc]
63 e0 bc 20 ff 0e              # 99ba |   mov [0xff20], [SP + 0xe]
1e e0 1c 24 ff 09              # 99c0 |   setb [0xff24], 0x9
                               #      | _A_for_9:
60 80 00                       # 99c6 |   mov D, 0
                               #      | _BA_for_9:
fc 80 1c f8 ff 1a 00           # 99c9 |   jge D, -1, ${_C_for_9}:rel + PC
99 40 e0 1c 26 ff 09           # 99d0 |   getb B, [0xff26], 0x9
ec 40 00 f8 0c 00              # 99d7 |   jne B, 0, ${_C_for_9}:rel + PC
                               #      | _BZ_for_9:
44 80                          # 99dd |   inc D
58 f8 ea ff                    # 99df |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
e8 40 00 f8 82 00              # 99e3 |   jeq B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 19              # 99e9 |   setb [0xff24], 0x19
61 fc bc 0a                    # 99ef |   mov E, [SP + 0xa]
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
44 80                          # 99f3 |   inc D
e8 80 1c f8 ff 70 00           # 99f5 |   jeq D, -1, ${_L_fn_read_sd_1}:rel + PC
61 60 e0 26 ff                 # 99fc |   mov C, [0xff26]
98 20 60 1c 09                 # 9a01 |   getb A, C, 0x9
e8 20 00 f8 51 00              # 9a06 |   jeq A, 0, ${_C_loop_9}:rel + PC
98 20 60 1c 08                 # 9a0c |   getb A, C, 0x8
e8 20 00 f8 e2 ff              # 9a11 |   jeq A, 0, ${_BA_loop_9}:rel + PC
1e e0 1c 24 ff 08              # 9a17 |   setb [0xff24], 0x8
                               #      | _A_for_10:
60 80 00                       # 9a1d |   mov D, 0
                               #      | _BA_for_10:
fc 80 1c f8 ff 1a 00           # 9a20 |   jge D, -1, ${_C_for_10}:rel + PC
99 40 e0 1c 26 ff 08           # 9a27 |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # 9a2e |   jeq B, 0, ${_C_for_10}:rel + PC
                               #      | _BZ_for_10:
44 80                          # 9a34 |   inc D
58 f8 ea ff                    # 9a36 |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
ec 40 00 f8 2b 00              # 9a3a |   jne B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 18              # 9a40 |   setb [0xff24], 0x18
2c 60 e0 ff 00                 # 9a46 |   and C, 0xff
62 fc 60                       # 9a4b |   mov [E], C
44 fc                          # 9a4e |   inc E
60 80 00                       # 9a50 |   mov D, 0
                               #      | _BZ_loop_9:
58 f8 a0 ff                    # 9a53 |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
c4 fe 00                       # 9a57 |   inc G, 0
b9 ff bc 0a                    # 9a5a |   neg H, [SP + 0xa]
00 ff fc                       # 9a5e |   add H, E
58 f8 0a 00                    # 9a61 |   jmp ${_cleanup_fn_read_sd}:rel + PC
                               #      | _L_fn_read_sd_1:
60 fe 00                       # 9a65 |   mov G, 0
60 ff 00                       # 9a68 |   mov H, 0
                               #      | _cleanup_fn_read_sd:
e4 20                          # 9a6b |   pop A
e4 40                          # 9a6d |   pop B
e4 60                          # 9a6f |   pop C
e4 80                          # 9a71 |   pop D
dc                             # 9a73 |   ret
                               #      | _end_fn_read_sd:
                               #      | 
                               #      | fn_handle_init_oled:
                               #      | _begin_fn_handle_init_oled:
                               #      | _A_call_68:
5c f8 11 00                    # 9a74 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_68:
                               #      | _A_call_69:
e0 e0 60 a5                    # 9a78 |   push ${const__str__DONE__endl}
5c f8 3a f7                    # 9a7c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9a80 |   mov SP, SP + 0x2
                               #      | _Z_call_69:
                               #      | _cleanup_fn_handle_init_oled:
dc                             # 9a84 |   ret
                               #      | _end_fn_handle_init_oled:
                               #      | 
                               #      | fn_init_oled:
                               #      | _begin_fn_init_oled:
e0 80                          # 9a85 |   push D
60 80 e0 32 ff                 # 9a87 |   mov D, 0xff32
62 80 00                       # 9a8c |   mov [D], 0
1e 80 1c 0f                    # 9a8f |   setb [D], 0xf
                               #      | _A_call_53:
5c f8 72 00                    # 9a93 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_53:
                               #      | _A_call_55:
e0 e0 ae 00                    # 9a97 |   push 0xae
5c f8 7d 00                    # 9a9b |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9a9f |   mov SP, SP + 0x2
                               #      | _Z_call_55:
1e 80 1c 0d                    # 9aa3 |   setb [D], 0xd
                               #      | _A_call_56:
5c f8 5e 00                    # 9aa7 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_56:
1e 80 1c 1d                    # 9aab |   setb [D], 0x1d
                               #      | _A_call_57:
5c f8 56 00                    # 9aaf |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_57:
                               #      | _A_call_59:
e0 e0 f1 00                    # 9ab3 |   push 0xf1
e0 e0 d9 00                    # 9ab7 |   push 0xd9
e0 1c 14                       # 9abb |   push 0x14
e0 e0 8d 00                    # 9abe |   push 0x8d
e0 1c 04                       # 9ac2 |   push 0x4
5c f8 ae 00                    # 9ac5 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0a                    # 9ac9 |   mov SP, SP + 0xa
                               #      | _Z_call_59:
1e 80 1c 0e                    # 9acd |   setb [D], 0xe
                               #      | _A_call_61:
5c f8 d0 00                    # 9ad1 |   call ${fn_delay_10ms}:rel + PC
                               #      | _Z_call_61:
                               #      | _A_call_62:
e0 00                          # 9ad5 |   push 0
e0 1c 20                       # 9ad7 |   push 0x20
e0 e0 af 00                    # 9ada |   push 0xaf
e0 00                          # 9ade |   push 0
e0 e0 da 00                    # 9ae0 |   push 0xda
e0 e0 c0 00                    # 9ae4 |   push 0xc0
e0 e0 a0 00                    # 9ae8 |   push 0xa0
e0 1c 0f                       # 9aec |   push 0xf
e0 e0 81 00                    # 9aef |   push 0x81
e0 1c 09                       # 9af3 |   push 0x9
5c f8 7d 00                    # 9af6 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 14                    # 9afa |   mov SP, SP + 0x14
                               #      | _Z_call_62:
                               #      | _A_call_67:
5c f8 b7 00                    # 9afe |   call ${fn_clear_oled}:rel + PC
                               #      | _Z_call_67:
                               #      | _cleanup_fn_init_oled:
e4 80                          # 9b02 |   pop D
dc                             # 9b04 |   ret
                               #      | _end_fn_init_oled:
                               #      | 
                               #      | fn_delay_1ms:
                               #      | _begin_fn_delay_1ms:
                               #      | _A_call_52:
e0 00                          # 9b05 |   push 0
e0 e0 60 ea                    # 9b07 |   push 0xea60
e0 00                          # 9b0b |   push 0
e0 00                          # 9b0d |   push 0
5c f8 1a f9                    # 9b0f |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 9b13 |   mov SP, SP + 0x8
                               #      | _Z_call_52:
                               #      | _cleanup_fn_delay_1ms:
dc                             # 9b17 |   ret
                               #      | _end_fn_delay_1ms:
                               #      | 
                               #      | fn_send_oled_cmd:
                               #      | _begin_fn_send_oled_cmd:
                               #      | _A_call_54:
e2 bc 02                       # 9b18 |   push [SP + 0x2]
e0 00                          # 9b1b |   push 0
5c f8 09 00                    # 9b1d |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9b21 |   mov SP, SP + 0x4
                               #      | _Z_call_54:
                               #      | _cleanup_fn_send_oled_cmd:
dc                             # 9b25 |   ret
                               #      | _end_fn_send_oled_cmd:
                               #      | 
                               #      | fn_send_oled_data_or_cmd:
                               #      | _begin_fn_send_oled_data_or_cmd:
e0 40                          # 9b26 |   push B
e0 20                          # 9b28 |   push A
                               #      | _A_loop_10:
                               #      | _BA_loop_10:
99 40 e0 1c 30 ff 08           # 9b2a |   getb B, [0xff30], 0x8
ec 40 00 f8 0a 00              # 9b31 |   jne B, 0, ${_C_loop_10}:rel + PC
                               #      | _BZ_loop_10:
58 f8 f3 ff                    # 9b37 |   jmp ${_BA_loop_10}:rel + PC
                               #      | _C_loop_10:
                               #      | _Z_loop_10:
ad 40 bc e0 08 ff 00           # 9b3b |   and B, [SP + 0x8], 0xff
ad 20 e0 e0 32 ff 00 ff        # 9b42 |   and A, [0xff32], 0xff00
30 20 e8 00 01                 # 9b4a |   or A, 0x100 + B
                               #      | _A_if_70:
ee bc 00 f8 06 0f 00           # 9b4f |   jne [SP + 0x6], 0, ${_E_if_70}:rel + PC
1c 20 1c 1c                    # 9b56 |   setb A, 0x1c
58 f8 08 00                    # 9b5a |   jmp ${_C_if_70}:rel + PC
                               #      | _E_if_70:
1c 20 1c 0c                    # 9b5e |   setb A, 0xc
                               #      | _C_if_70:
                               #      | _Z_if_70:
62 e0 20 32 ff                 # 9b62 |   mov [0xff32], A
9e e0 20 1c 32 ff 18           # 9b67 |   setb [0xff32], A, 0x18
                               #      | _cleanup_fn_send_oled_data_or_cmd:
e4 20                          # 9b6e |   pop A
e4 40                          # 9b70 |   pop B
dc                             # 9b72 |   ret
                               #      | _end_fn_send_oled_data_or_cmd:
                               #      | 
                               #      | fn_send_oled_cmd_sequence:
                               #      | _begin_fn_send_oled_cmd_sequence:
e0 40                          # 9b73 |   push B
e0 20                          # 9b75 |   push A
60 20 bc 08                    # 9b77 |   mov A, SP + 0x8
61 40 bc 06                    # 9b7b |   mov B, [SP + 0x6]
60 40 45                       # 9b7f |   mov B, B*2 + A
                               #      | _A_for_12:
                               #      | _BA_for_12:
fc 20 40 f8 1a 00              # 9b82 |   jge A, B, ${_C_for_12}:rel + PC
                               #      | _A_call_58:
e2 20                          # 9b88 |   push [A]
e0 00                          # 9b8a |   push 0
5c f8 9a ff                    # 9b8c |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9b90 |   mov SP, SP + 0x4
                               #      | _Z_call_58:
                               #      | _BZ_for_12:
60 20 3c 02                    # 9b94 |   mov A, A + 0x2
58 f8 ea ff                    # 9b98 |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _cleanup_fn_send_oled_cmd_sequence:
e4 20                          # 9b9c |   pop A
e4 40                          # 9b9e |   pop B
dc                             # 9ba0 |   ret
                               #      | _end_fn_send_oled_cmd_sequence:
                               #      | 
                               #      | fn_delay_10ms:
                               #      | _begin_fn_delay_10ms:
                               #      | _A_call_60:
e0 00                          # 9ba1 |   push 0
e0 e0 c0 27                    # 9ba3 |   push 0x27c0
e0 1c 09                       # 9ba7 |   push 0x9
e0 00                          # 9baa |   push 0
5c f8 7d f8                    # 9bac |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # 9bb0 |   mov SP, SP + 0x8
                               #      | _Z_call_60:
                               #      | _cleanup_fn_delay_10ms:
dc                             # 9bb4 |   ret
                               #      | _end_fn_delay_10ms:
                               #      | 
                               #      | fn_clear_oled:
                               #      | _begin_fn_clear_oled:
e0 20                          # 9bb5 |   push A
                               #      | _A_call_63:
e0 1c 03                       # 9bb7 |   push 0x3
e0 00                          # 9bba |   push 0
e0 1c 22                       # 9bbc |   push 0x22
e0 1c 7f                       # 9bbf |   push 0x7f
e0 00                          # 9bc2 |   push 0
e0 1c 21                       # 9bc4 |   push 0x21
e0 1c 06                       # 9bc7 |   push 0x6
5c f8 a9 ff                    # 9bca |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # 9bce |   mov SP, SP + 0xe
                               #      | _Z_call_63:
                               #      | _A_for_13:
60 20 00                       # 9bd2 |   mov A, 0
                               #      | _BA_for_13:
fc 20 e0 f8 00 02 18 00        # 9bd5 |   jge A, 0x200, ${_C_for_13}:rel + PC
                               #      | _A_call_65:
e0 00                          # 9bdd |   push 0
5c f8 2d 00                    # 9bdf |   call ${fn_send_oled_data}:rel + PC
60 a0 bc 02                    # 9be3 |   mov SP, SP + 0x2
                               #      | _Z_call_65:
                               #      | _BZ_for_13:
44 20                          # 9be7 |   inc A
58 f8 ec ff                    # 9be9 |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
                               #      | _A_for_14:
60 20 00                       # 9bed |   mov A, 0
                               #      | _BA_for_14:
fc 20 1c f8 20 19 00           # 9bf0 |   jge A, 0x20, ${_C_for_14}:rel + PC
                               #      | _A_call_66:
e0 e0 aa 00                    # 9bf7 |   push 0xaa
5c f8 11 00                    # 9bfb |   call ${fn_send_oled_data}:rel + PC
60 a0 bc 02                    # 9bff |   mov SP, SP + 0x2
                               #      | _Z_call_66:
                               #      | _BZ_for_14:
44 20                          # 9c03 |   inc A
58 f8 eb ff                    # 9c05 |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
                               #      | _Z_for_14:
                               #      | _cleanup_fn_clear_oled:
e4 20                          # 9c09 |   pop A
dc                             # 9c0b |   ret
                               #      | _end_fn_clear_oled:
                               #      | 
                               #      | fn_send_oled_data:
                               #      | _begin_fn_send_oled_data:
                               #      | _A_call_64:
e2 bc 02                       # 9c0c |   push [SP + 0x2]
e0 1c 01                       # 9c0f |   push 0x1
5c f8 14 ff                    # 9c12 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # 9c16 |   mov SP, SP + 0x4
                               #      | _Z_call_64:
                               #      | _cleanup_fn_send_oled_data:
dc                             # 9c1a |   ret
                               #      | _end_fn_send_oled_data:
                               #      | 
                               #      | fn_handle_deinit_oled:
                               #      | _begin_fn_handle_deinit_oled:
                               #      | _A_call_72:
5c f8 11 00                    # 9c1b |   call ${fn_deinit_oled}:rel + PC
                               #      | _Z_call_72:
                               #      | _A_call_73:
e0 e0 60 a5                    # 9c1f |   push ${const__str__DONE__endl}
5c f8 93 f5                    # 9c23 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9c27 |   mov SP, SP + 0x2
                               #      | _Z_call_73:
                               #      | _cleanup_fn_handle_deinit_oled:
dc                             # 9c2b |   ret
                               #      | _end_fn_handle_deinit_oled:
                               #      | 
                               #      | fn_deinit_oled:
                               #      | _begin_fn_deinit_oled:
e0 80                          # 9c2c |   push D
60 80 e0 32 ff                 # 9c2e |   mov D, 0xff32
                               #      | _A_call_70:
e0 e0 ae 00                    # 9c33 |   push 0xae
5c f8 e1 fe                    # 9c37 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9c3b |   mov SP, SP + 0x2
                               #      | _Z_call_70:
1e 80 1c 1e                    # 9c3f |   setb [D], 0x1e
                               #      | _A_call_71:
5c f8 5e ff                    # 9c43 |   call ${fn_delay_10ms}:rel + PC
                               #      | _Z_call_71:
1e 80 1c 1f                    # 9c47 |   setb [D], 0x1f
62 e0 00 32 ff                 # 9c4b |   mov [0xff32], 0
                               #      | _cleanup_fn_deinit_oled:
e4 80                          # 9c50 |   pop D
dc                             # 9c52 |   ret
                               #      | _end_fn_deinit_oled:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # 9c53 |   push B
e0 20                          # 9c55 |   push A
60 20 e0 fd 00                 # 9c57 |   mov A, 0xfd
60 40 00                       # 9c5c |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # 9c5f |   mmap 0xff00, -1, 0x2
62 e0 e0 1e ff 1a 9d           # 9c67 |   mov [0xff1e], ${fn_syscall_entry}
                               #      | _A_call_75:
5c f8 c0 00                    # 9c6e |   call ${fn_quick_deinit_oled}:rel + PC
                               #      | _Z_call_75:
                               #      | _A_call_76:
e0 e0 7e a5                    # 9c72 |   push ${const__data_9}
5c f8 40 f5                    # 9c76 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9c7a |   mov SP, SP + 0x2
                               #      | _Z_call_76:
61 20 e0 1c ff                 # 9c7e |   mov A, [0xff1c]
                               #      | _A_scope_9:
                               #      | _B_scope_9:
e8 20 00 f8 40 00              # 9c83 |   jeq A, 0, ${_C_scope_9}:rel + PC
e8 20 e0 f8 00 90 3a 00        # 9c89 |   jeq A, 0x9000, ${_C_scope_9}:rel + PC
61 40 e0 0c ff                 # 9c91 |   mov B, [0xff0c]
2c 40 e0 00 01                 # 9c96 |   and B, 0x100
                               #      | _A_if_74:
e8 40 00 f8 16 00              # 9c9b |   jeq B, 0, ${_E_if_74}:rel + PC
                               #      | _A_call_77:
e0 e0 ad a5                    # 9ca1 |   push ${const__str__FORCED_BOOTLOADER__endl}
5c f8 65 f3                    # 9ca5 |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # 9ca9 |   mov SP, SP + 0x2
                               #      | _Z_call_77:
58 f8 16 00                    # 9cad |   jmp ${_C_scope_9}:rel + PC
                               #      | _E_if_74:
                               #      | _C_if_74:
                               #      | _Z_if_74:
                               #      | _A_call_78:
e0 20                          # 9cb1 |   push A
e0 e0 1e a5                    # 9cb3 |   push ${const__data_5}
5c f8 53 f3                    # 9cb7 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9cbb |   mov SP, SP + 0x4
                               #      | _Z_call_78:
58 f8 ab fb                    # 9cbf |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_9:
                               #      | _Z_scope_9:
                               #      | _A_call_79:
5c f8 c2 fd                    # 9cc3 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_79:
                               #      | _A_call_80:
e0 e0 c0 a5                    # 9cc7 |   push ${const__str__READY__endl}
5c f8 eb f4                    # 9ccb |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9ccf |   mov SP, SP + 0x2
                               #      | _Z_call_80:
c6 e0 00 0a ff                 # 9cd3 |   inc [0xff0a], 0
                               #      | _A_loop_11:
                               #      | _BA_loop_11:
                               #      | _A_call_101:
5c f8 6e 00                    # 9cd8 |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_101:
46 e0 0a ff                    # 9cdc |   inc [0xff0a]
60 20 ff                       # 9ce0 |   mov A, H
                               #      | _A_if_108:
ec fe 00 f8 0a 00              # 9ce3 |   jne G, 0, ${_E_if_108}:rel + PC
58 f8 ef ff                    # 9ce9 |   jmp ${_BA_loop_11}:rel + PC
                               #      | _E_if_108:
                               #      | _C_if_108:
                               #      | _Z_if_108:
                               #      | _A_if_109:
ec 20 00 f8 16 00              # 9ced |   jne A, 0, ${_E_if_109}:rel + PC
                               #      | _A_call_102:
e0 e0 5b a6                    # 9cf3 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 bf f4                    # 9cf7 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9cfb |   mov SP, SP + 0x2
                               #      | _Z_call_102:
58 f8 d9 ff                    # 9cff |   jmp ${_BA_loop_11}:rel + PC
                               #      | _E_if_109:
                               #      | _C_if_109:
                               #      | _Z_if_109:
60 40 21                       # 9d03 |   mov B, A*2
60 40 e8 64 a5                 # 9d06 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # 9d0b |   push A
5e 40                          # 9d0d |   call [B]
e4 20                          # 9d0f |   pop A
                               #      | _BZ_loop_11:
58 f8 c7 ff                    # 9d11 |   jmp ${_BA_loop_11}:rel + PC
                               #      | _C_loop_11:
                               #      | _Z_loop_11:
                               #      | _cleanup_fn_main:
e4 20                          # 9d15 |   pop A
e4 40                          # 9d17 |   pop B
dc                             # 9d19 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_71:
f0 ff 1c f8 14 08 00           # 9d1a |   jlt H, 0x14, ${_E_if_71}:rel + PC
dc                             # 9d21 |   ret
                               #      | _E_if_71:
                               #      | _C_if_71:
                               #      | _Z_if_71:
28 ff 1c 01                    # 9d22 |   shl H, 0x1
00 ff e0 82 a4                 # 9d26 |   add H, ${const__SYSCALL_MAP}
5a ff                          # 9d2b |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # 9d2d |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_quick_deinit_oled:
                               #      | _begin_fn_quick_deinit_oled:
1e e0 1c 32 ff 0f              # 9d2e |   setb [0xff32], 0xf
                               #      | _A_call_74:
e0 e0 ae 00                    # 9d34 |   push 0xae
5c f8 e0 fd                    # 9d38 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # 9d3c |   mov SP, SP + 0x2
                               #      | _Z_call_74:
62 e0 00 32 ff                 # 9d40 |   mov [0xff32], 0
                               #      | _cleanup_fn_quick_deinit_oled:
dc                             # 9d45 |   ret
                               #      | _end_fn_quick_deinit_oled:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # 9d46 |   push D
e0 60                          # 9d48 |   push C
e0 40                          # 9d4a |   push B
e0 20                          # 9d4c |   push A
60 a0 bc fe                    # 9d4e |   mov SP, SP + -2
62 a0 00                       # 9d52 |   mov [SP], 0
60 a0 bc de                    # 9d55 |   mov SP, SP + -34
62 a0 00                       # 9d59 |   mov [SP], 0
60 20 a0                       # 9d5c |   mov A, SP
                               #      | _A_loop_12:
                               #      | _BA_loop_12:
                               #      | _A_call_81:
5c f8 04 f5                    # 9d5f |   call ${fn_getc}:rel + PC
                               #      | _Z_call_81:
60 60 ff                       # 9d63 |   mov C, H
62 e0 60 00 ff                 # 9d66 |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # 9d6b |   jeq C, 0xa, ${_C_loop_12}:rel + PC
e8 60 1c f8 0d 29 00           # 9d72 |   jeq C, 0xd, ${_C_loop_12}:rel + PC
                               #      | _A_if_77:
f0 20 bc f8 1f 19 00           # 9d79 |   jlt A, SP + 0x1f, ${_E_if_77}:rel + PC
                               #      | _A_call_82:
e0 e0 c7 a5                    # 9d80 |   push ${const__data_10}
5c f8 32 f4                    # 9d84 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9d88 |   mov SP, SP + 0x2
                               #      | _Z_call_82:
e8 ff 00 f8 d3 00              # 9d8c |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_77:
                               #      | _C_if_77:
                               #      | _Z_if_77:
62 20 60                       # 9d92 |   mov [A], C
44 20                          # 9d95 |   inc A
                               #      | _BZ_loop_12:
58 f8 c8 ff                    # 9d97 |   jmp ${_BA_loop_12}:rel + PC
                               #      | _C_loop_12:
                               #      | _Z_loop_12:
                               #      | _A_call_83:
e0 1c 20                       # 9d9b |   push 0x20
e0 bc 02                       # 9d9e |   push SP + 0x2
5c f8 57 f6                    # 9da1 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # 9da5 |   mov SP, SP + 0x4
                               #      | _Z_call_83:
60 60 ff                       # 9da9 |   mov C, H
                               #      | _A_if_79:
e8 60 00 f8 0f 00              # 9dac |   jeq C, 0, ${_E_if_79}:rel + PC
66 60 00                       # 9db2 |   bmov [C], 0
44 60                          # 9db5 |   inc C
58 f8 08 00                    # 9db7 |   jmp ${_C_if_79}:rel + PC
                               #      | _E_if_79:
60 60 1c ff                    # 9dbb |   mov C, -1
                               #      | _C_if_79:
                               #      | _Z_if_79:
                               #      | _A_call_96:
e0 a0                          # 9dbf |   push SP
5c f8 b1 00                    # 9dc1 |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # 9dc5 |   mov SP, SP + 0x2
                               #      | _Z_call_96:
e8 ff 00 f8 9c 00              # 9dc9 |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # 9dcf |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 6e a6                 # 9dd3 |   mov [${var__g_num_args}], 0
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 60 bc f8 20 7c 00           # 9dd8 |   jge C, SP + 0x20, ${_C_while_9}:rel + PC
                               #      | _A_call_97:
e0 1c 20                       # 9ddf |   push 0x20
e0 60                          # 9de2 |   push C
5c f8 14 f6                    # 9de4 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # 9de8 |   mov SP, SP + 0x4
                               #      | _Z_call_97:
60 80 ff                       # 9dec |   mov D, H
                               #      | _A_if_105:
e8 80 00 f8 0d 00              # 9def |   jeq D, 0, ${_E_if_105}:rel + PC
66 80 00                       # 9df5 |   bmov [D], 0
58 f8 08 00                    # 9df8 |   jmp ${_C_if_105}:rel + PC
                               #      | _E_if_105:
60 80 1c fe                    # 9dfc |   mov D, -2
                               #      | _C_if_105:
                               #      | _Z_if_105:
61 20 e0 6e a6                 # 9e00 |   mov A, [${var__g_num_args}]
                               #      | _A_if_106:
f0 20 1c f8 04 17 00           # 9e05 |   jlt A, 0x4, ${_E_if_106}:rel + PC
                               #      | _A_call_98:
e0 e0 32 a6                    # 9e0c |   push ${const__data_11}
5c f8 a6 f3                    # 9e10 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 9e14 |   mov SP, SP + 0x2
                               #      | _Z_call_98:
58 f8 47 00                    # 9e18 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_106:
                               #      | _C_if_106:
                               #      | _Z_if_106:
                               #      | _A_call_99:
e0 60                          # 9e1c |   push C
5c f8 9f f4                    # 9e1e |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # 9e22 |   mov SP, SP + 0x2
                               #      | _Z_call_99:
                               #      | _A_if_107:
ec fe 00 f8 18 00              # 9e26 |   jne G, 0, ${_E_if_107}:rel + PC
                               #      | _A_call_100:
e0 20                          # 9e2c |   push A
e0 e0 47 a6                    # 9e2e |   push ${const__data_12}
5c f8 d8 f1                    # 9e32 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 9e36 |   mov SP, SP + 0x4
                               #      | _Z_call_100:
58 f8 25 00                    # 9e3a |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_107:
                               #      | _C_if_107:
                               #      | _Z_if_107:
a8 40 20 1c 01                 # 9e3e |   shl B, A, 0x1
62 e8 ff 70 a6                 # 9e43 |   mov [${var__g_args} + B], H
c6 e0 20 6e a6                 # 9e48 |   inc [${var__g_num_args}], A
c4 60 80                       # 9e4d |   inc C, D
                               #      | _BZ_while_9:
58 f8 88 ff                    # 9e50 |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
c4 fe 00                       # 9e54 |   inc G, 0
61 ff bc 22                    # 9e57 |   mov H, [SP + 0x22]
58 f8 0a 00                    # 9e5b |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # 9e5f |   mov G, 0
60 ff 00                       # 9e62 |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # 9e65 |   mov SP, SP + 0x24
e4 20                          # 9e69 |   pop A
e4 40                          # 9e6b |   pop B
e4 60                          # 9e6d |   pop C
e4 80                          # 9e6f |   pop D
dc                             # 9e71 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # 9e72 |   push A
61 20 bc 04                    # 9e74 |   mov A, [SP + 0x4]
                               #      | _A_call_84:
e0 e0 d9 a5                    # 9e78 |   push ${const__str__PING}
e0 20                          # 9e7c |   push A
5c f8 28 f5                    # 9e7e |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9e82 |   mov SP, SP + 0x4
                               #      | _Z_call_84:
                               #      | _A_if_81:
ec ff 00 f8 0d 00              # 9e86 |   jne H, 0, ${_E_if_81}:rel + PC
c4 ff 00                       # 9e8c |   inc H, 0
58 f8 3b 01                    # 9e8f |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_81:
                               #      | _C_if_81:
                               #      | _Z_if_81:
                               #      | _A_call_85:
e0 e0 de a5                    # 9e93 |   push ${const__str__READ}
e0 20                          # 9e97 |   push A
5c f8 0d f5                    # 9e99 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9e9d |   mov SP, SP + 0x4
                               #      | _Z_call_85:
                               #      | _A_if_83:
ec ff 00 f8 0e 00              # 9ea1 |   jne H, 0, ${_E_if_83}:rel + PC
60 ff 1c 02                    # 9ea7 |   mov H, 0x2
58 f8 1f 01                    # 9eab |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_83:
                               #      | _C_if_83:
                               #      | _Z_if_83:
                               #      | _A_call_86:
e0 e0 e3 a5                    # 9eaf |   push ${const__str__WRITE}
e0 20                          # 9eb3 |   push A
5c f8 f1 f4                    # 9eb5 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9eb9 |   mov SP, SP + 0x4
                               #      | _Z_call_86:
                               #      | _A_if_85:
ec ff 00 f8 0e 00              # 9ebd |   jne H, 0, ${_E_if_85}:rel + PC
60 ff 1c 03                    # 9ec3 |   mov H, 0x3
58 f8 03 01                    # 9ec7 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_85:
                               #      | _C_if_85:
                               #      | _Z_if_85:
                               #      | _A_call_87:
e0 e0 e9 a5                    # 9ecb |   push ${const__str__READB}
e0 20                          # 9ecf |   push A
5c f8 d5 f4                    # 9ed1 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9ed5 |   mov SP, SP + 0x4
                               #      | _Z_call_87:
                               #      | _A_if_87:
ec ff 00 f8 0e 00              # 9ed9 |   jne H, 0, ${_E_if_87}:rel + PC
60 ff 1c 04                    # 9edf |   mov H, 0x4
58 f8 e7 00                    # 9ee3 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_87:
                               #      | _C_if_87:
                               #      | _Z_if_87:
                               #      | _A_call_88:
e0 e0 ef a5                    # 9ee7 |   push ${const__str__WRITEB}
e0 20                          # 9eeb |   push A
5c f8 b9 f4                    # 9eed |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9ef1 |   mov SP, SP + 0x4
                               #      | _Z_call_88:
                               #      | _A_if_89:
ec ff 00 f8 0e 00              # 9ef5 |   jne H, 0, ${_E_if_89}:rel + PC
60 ff 1c 05                    # 9efb |   mov H, 0x5
58 f8 cb 00                    # 9eff |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_89:
                               #      | _C_if_89:
                               #      | _Z_if_89:
                               #      | _A_call_89:
e0 e0 f6 a5                    # 9f03 |   push ${const__str__JMP}
e0 20                          # 9f07 |   push A
5c f8 9d f4                    # 9f09 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9f0d |   mov SP, SP + 0x4
                               #      | _Z_call_89:
                               #      | _A_if_91:
ec ff 00 f8 0e 00              # 9f11 |   jne H, 0, ${_E_if_91}:rel + PC
60 ff 1c 06                    # 9f17 |   mov H, 0x6
58 f8 af 00                    # 9f1b |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_91:
                               #      | _C_if_91:
                               #      | _Z_if_91:
                               #      | _A_call_90:
e0 e0 fa a5                    # 9f1f |   push ${const__str__JMP_PERSIST}
e0 20                          # 9f23 |   push A
5c f8 81 f4                    # 9f25 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9f29 |   mov SP, SP + 0x4
                               #      | _Z_call_90:
                               #      | _A_if_93:
ec ff 00 f8 0e 00              # 9f2d |   jne H, 0, ${_E_if_93}:rel + PC
60 ff 1c 07                    # 9f33 |   mov H, 0x7
58 f8 93 00                    # 9f37 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_93:
                               #      | _C_if_93:
                               #      | _Z_if_93:
                               #      | _A_call_91:
e0 e0 06 a6                    # 9f3b |   push ${const__str__INIT_SD}
e0 20                          # 9f3f |   push A
5c f8 65 f4                    # 9f41 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9f45 |   mov SP, SP + 0x4
                               #      | _Z_call_91:
                               #      | _A_if_95:
ec ff 00 f8 0e 00              # 9f49 |   jne H, 0, ${_E_if_95}:rel + PC
60 ff 1c 08                    # 9f4f |   mov H, 0x8
58 f8 77 00                    # 9f53 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_95:
                               #      | _C_if_95:
                               #      | _Z_if_95:
                               #      | _A_call_92:
e0 e0 0e a6                    # 9f57 |   push ${const__str__READ_SD}
e0 20                          # 9f5b |   push A
5c f8 49 f4                    # 9f5d |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9f61 |   mov SP, SP + 0x4
                               #      | _Z_call_92:
                               #      | _A_if_97:
ec ff 00 f8 0e 00              # 9f65 |   jne H, 0, ${_E_if_97}:rel + PC
60 ff 1c 09                    # 9f6b |   mov H, 0x9
58 f8 5b 00                    # 9f6f |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_97:
                               #      | _C_if_97:
                               #      | _Z_if_97:
                               #      | _A_call_93:
e0 e0 16 a6                    # 9f73 |   push ${const__str__INIT_OLED}
e0 20                          # 9f77 |   push A
5c f8 2d f4                    # 9f79 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9f7d |   mov SP, SP + 0x4
                               #      | _Z_call_93:
                               #      | _A_if_99:
ec ff 00 f8 0e 00              # 9f81 |   jne H, 0, ${_E_if_99}:rel + PC
60 ff 1c 0a                    # 9f87 |   mov H, 0xa
58 f8 3f 00                    # 9f8b |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_99:
                               #      | _C_if_99:
                               #      | _Z_if_99:
                               #      | _A_call_94:
e0 e0 20 a6                    # 9f8f |   push ${const__str__READW}
e0 20                          # 9f93 |   push A
5c f8 11 f4                    # 9f95 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9f99 |   mov SP, SP + 0x4
                               #      | _Z_call_94:
                               #      | _A_if_101:
ec ff 00 f8 0e 00              # 9f9d |   jne H, 0, ${_E_if_101}:rel + PC
60 ff 1c 0b                    # 9fa3 |   mov H, 0xb
58 f8 23 00                    # 9fa7 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_101:
                               #      | _C_if_101:
                               #      | _Z_if_101:
                               #      | _A_call_95:
e0 e0 26 a6                    # 9fab |   push ${const__str__DEINIT_OLED}
e0 20                          # 9faf |   push A
5c f8 f5 f3                    # 9fb1 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # 9fb5 |   mov SP, SP + 0x4
                               #      | _Z_call_95:
                               #      | _A_if_103:
ec ff 00 f8 0e 00              # 9fb9 |   jne H, 0, ${_E_if_103}:rel + PC
60 ff 1c 0c                    # 9fbf |   mov H, 0xc
58 f8 07 00                    # 9fc3 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_103:
                               #      | _C_if_103:
                               #      | _Z_if_103:
60 ff 00                       # 9fc7 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # 9fca |   pop A
dc                             # 9fcc |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # 9fcd |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # a3c2 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
0a 90 51 91 63 92 69 91 d8 91 2e 92 15 92 82 92 bd 92 0d 93 46 93 7f 93 a6 93 f8 93 17 94 1e 94 29 94 b6 91 c4 94 96 95 # a482 |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # a4aa |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # a4ce |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # a4d4 |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # a4e3 |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # a4f0 |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # a4ff |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # a50f |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # a51e |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # a529 |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__str__TIMEOUT__endl:
54 49 4d 45 4f 55 54 0a 00     # a53b |   .data str:"TIMEOUT\n"
                               #      | const__str__INIT_OK__endl:
49 4e 49 54 5f 4f 4b 0a 00     # a544 |   .data str:"INIT_OK\n"
                               #      | const__data_7:
72 65 61 64 20 25 64 20 62 79 74 65 73 0a 00 # a54d |   .data str:"read %d bytes\n"
                               #      | const__data_8:
25 68 20 00                    # a55c |   .data str:"%h "
                               #      | const__str__DONE__endl:
44 4f 4e 45 0a 00              # a560 |   .data str:"DONE\n"
                               #      | const__HANDLER_MAP:
d8 95 12 96 26 97 12 96 26 97 26 98 26 98 8f 98 1b 99 74 9a 12 96 1b 9c # a566 |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp, $fn_handle_init_sd, $fn_handle_read_sd, $fn_handle_init_oled, $fn_handle_read, $fn_handle_deinit_oled]
                               #      | const__data_9:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 34 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 33 0a 00 # a57e |   .data str:"Weeekly3006 - Hardware v1.4 - Bootloader v2.3\n"
                               #      | const__str__FORCED_BOOTLOADER__endl:
46 4f 52 43 45 44 5f 42 4f 4f 54 4c 4f 41 44 45 52 0a 00 # a5ad |   .data str:"FORCED_BOOTLOADER\n"
                               #      | const__str__READY__endl:
52 45 41 44 59 0a 00           # a5c0 |   .data str:"READY\n"
                               #      | const__data_10:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # a5c7 |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # a5d9 |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # a5de |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # a5e3 |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # a5e9 |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # a5ef |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # a5f6 |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # a5fa |   .data str:"JMP_PERSIST"
                               #      | const__str__INIT_SD:
49 4e 49 54 5f 53 44 00        # a606 |   .data str:"INIT_SD"
                               #      | const__str__READ_SD:
52 45 41 44 5f 53 44 00        # a60e |   .data str:"READ_SD"
                               #      | const__str__INIT_OLED:
49 4e 49 54 5f 4f 4c 45 44 00  # a616 |   .data str:"INIT_OLED"
                               #      | const__str__READW:
52 45 41 44 57 00              # a620 |   .data str:"READW"
                               #      | const__str__DEINIT_OLED:
44 45 49 4e 49 54 5f 4f 4c 45 44 00 # a626 |   .data str:"DEINIT_OLED"
                               #      | const__data_11:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 34 0a 00 # a632 |   .data str:"TOO_MANY_ARGS max=4\n"
                               #      | const__data_12:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # a647 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # a65b |   .data str:"UNKNOWN_COMMAND\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa66c
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # a66c |   .bss size:2 align:1
                               #      | var__g_num_args:
                               # a66e |   .bss size:2 align:1
                               #      | var__g_args:
                               # a670 |   .bss size:10 align:2
                               #      | SECTION_END_static_data:
                               #      | 
