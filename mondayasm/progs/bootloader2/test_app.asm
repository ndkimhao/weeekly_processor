                               #      | .config CODE_OFFSET 0x5100
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 00 51                 # 5100 |   mov SP, 0x5100
                               #      | _A_call_19:
5c f8 05 00                    # 5105 |   call ${fn_main}:rel + PC
                               #      | _Z_call_19:
d8                             # 5109 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
62 e0 e0 0a ff af 00           # 510a |   mov [0xff0a], 0xaf
                               #      | _A_call_15:
e0 a0                          # 5111 |   push SP
e0 e0 b8 53                    # 5113 |   push ${const__data_1}
5c f8 72 00                    # 5117 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 511b |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_syscall_1:
e0 e0 ff aa                    # 511f |   push 0xaaff
e0 1c 7b                       # 5123 |   push 0x7b
e0 e0 c6 53                    # 5126 |   push ${const__data_2}
e0 00                          # 512a |   push 0
5e e0 00 01                    # 512c |   call [0x100]
60 a0 bc 06                    # 5130 |   mov SP, SP + 0x6
                               #      | _Z_syscall_1:
                               #      | _A_call_16:
e0 a0                          # 5134 |   push SP
e0 e0 d2 53                    # 5136 |   push ${const__data_3}
5c f8 4f 00                    # 513a |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 513e |   mov SP, SP + 0x4
                               #      | _Z_call_16:
                               #      | _A_call_17:
e0 a0                          # 5142 |   push SP
e0 e0 b8 53                    # 5144 |   push ${const__data_1}
5c f8 41 00                    # 5148 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 514c |   mov SP, SP + 0x4
                               #      | _Z_call_17:
                               #      | _A_syscall_2:
e0 e0 ff aa                    # 5150 |   push 0xaaff
e0 1c 0b                       # 5154 |   push 0xb
e0 e0 df 53                    # 5157 |   push ${const__data_4}
e0 00                          # 515b |   push 0
5e e0 00 01                    # 515d |   call [0x100]
60 a0 bc 06                    # 5161 |   mov SP, SP + 0x6
                               #      | _Z_syscall_2:
                               #      | _A_call_18:
e0 a0                          # 5165 |   push SP
e0 e0 d2 53                    # 5167 |   push ${const__data_3}
5c f8 1e 00                    # 516b |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 516f |   mov SP, SP + 0x4
                               #      | _Z_call_18:
                               #      | _A_syscall_3:
e0 e0 ff aa                    # 5173 |   push 0xaaff
e0 1c 16                       # 5177 |   push 0x16
e0 e0 ed 53                    # 517a |   push ${const__data_5}
e0 00                          # 517e |   push 0
5e e0 00 01                    # 5180 |   call [0x100]
60 a0 bc 06                    # 5184 |   mov SP, SP + 0x6
                               #      | _Z_syscall_3:
                               #      | _cleanup_fn_main:
dc                             # 5188 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # 5189 |   push C
e0 40                          # 518b |   push B
e0 20                          # 518d |   push A
60 a0 bc ee                    # 518f |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # 5193 |   mov B, SP + 0x1c
                               #      | _A_for_1:
61 20 bc 1a                    # 5197 |   mov A, [SP + 0x1a]
                               #      | _BA_for_1:
65 60 20                       # 519b |   bmov C, [A]
e8 60 00 f8 fd 00              # 519e |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # 51a4 |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # 51ab |   push C
5c f8 f9 00                    # 51ad |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 51b1 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 e0 00                    # 51b5 |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # 51b9 |   inc A
65 60 20                       # 51bb |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # 51be |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 d7 00                    # 51c4 |   jmp ${_C_for_1}:rel + PC
58 f8 c9 00                    # 51c8 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 25 1a 00           # 51cc |   jne C, 0x25, ${_E2_if_4}:rel + PC
                               #      | _A_call_2:
e0 1c 25                       # 51d3 |   push 0x25
5c f8 d0 00                    # 51d6 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 51da |   mov SP, SP + 0x2
                               #      | _Z_call_2:
58 f8 b7 00                    # 51de |   jmp ${_BZ_for_1}:rel + PC
58 f8 af 00                    # 51e2 |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 64 21 00           # 51e6 |   jne C, 0x64, ${_E3_if_4}:rel + PC
                               #      | _A_call_3:
e0 a0                          # 51ed |   push SP
e2 40                          # 51ef |   push [B]
5c f8 cd 00                    # 51f1 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # 51f5 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 a0                          # 51f9 |   push SP
5c f8 10 01                    # 51fb |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 51ff |   mov SP, SP + 0x2
                               #      | _Z_call_5:
58 f8 8e 00                    # 5203 |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 78 21 00           # 5207 |   jne C, 0x78, ${_E4_if_4}:rel + PC
                               #      | _A_call_7:
e0 a0                          # 520e |   push SP
e2 40                          # 5210 |   push [B]
5c f8 1b 01                    # 5212 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 5216 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 a0                          # 521a |   push SP
5c f8 ef 00                    # 521c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 5220 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
58 f8 6d 00                    # 5224 |   jmp ${_C_if_4}:rel + PC
                               #      | _E4_if_4:
ec 60 1c f8 68 22 00           # 5228 |   jne C, 0x68, ${_E5_if_4}:rel + PC
                               #      | _A_call_9:
e0 a0                          # 522f |   push SP
e2 40                          # 5231 |   push [B]
5c f8 fa 00                    # 5233 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 5237 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 bc 02                       # 523b |   push SP + 0x2
5c f8 cd 00                    # 523e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 5242 |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 4b 00                    # 5246 |   jmp ${_C_if_4}:rel + PC
                               #      | _E5_if_4:
ec 60 1c f8 62 21 00           # 524a |   jne C, 0x62, ${_E6_if_4}:rel + PC
                               #      | _A_call_11:
e0 a0                          # 5251 |   push SP
e2 40                          # 5253 |   push [B]
5c f8 2e 01                    # 5255 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # 5259 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 a0                          # 525d |   push SP
5c f8 ac 00                    # 525f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 5263 |   mov SP, SP + 0x2
                               #      | _Z_call_12:
58 f8 2a 00                    # 5267 |   jmp ${_C_if_4}:rel + PC
                               #      | _E6_if_4:
ec 60 1c f8 73 15 00           # 526b |   jne C, 0x73, ${_E7_if_4}:rel + PC
                               #      | _A_call_13:
e2 40                          # 5272 |   push [B]
5c f8 97 00                    # 5274 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 5278 |   mov SP, SP + 0x2
                               #      | _Z_call_13:
58 f8 15 00                    # 527c |   jmp ${_C_if_4}:rel + PC
                               #      | _E7_if_4:
ec 60 1c f8 63 11 00           # 5280 |   jne C, 0x63, ${_E8_if_4}:rel + PC
                               #      | _A_call_14:
e2 40                          # 5287 |   push [B]
5c f8 1d 00                    # 5289 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 528d |   mov SP, SP + 0x2
                               #      | _Z_call_14:
                               #      | _E8_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
60 40 5c 02                    # 5291 |   mov B, B + 0x2
                               #      | _BZ_for_1:
44 20                          # 5295 |   inc A
58 f8 04 ff                    # 5297 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # 529b |   mov SP, SP + 0x12
e4 20                          # 529f |   pop A
e4 40                          # 52a1 |   pop B
e4 60                          # 52a3 |   pop C
dc                             # 52a5 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # 52a6 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # 52ad |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # 52b3 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # 52b7 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # 52bd |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # 52be |   push C
e0 40                          # 52c0 |   push B
e0 20                          # 52c2 |   push A
61 20 bc 0a                    # 52c4 |   mov A, [SP + 0xa]
62 20 1c 30                    # 52c8 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # 52cc |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # 52d0 |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # 52d6 |   div C, B, 0xa
82 20 ff 1c 30                 # 52db |   add [A], H, 0x30
44 20                          # 52e0 |   inc A
60 40 60                       # 52e2 |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # 52e5 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # 52e9 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # 52ed |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # 52f3 |   dec A
61 40 60                       # 52f5 |   mov B, [C]
67 60 20                       # 52f8 |   bmov [C], [A]
66 20 40                       # 52fb |   bmov [A], B
44 60                          # 52fe |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # 5300 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # 5304 |   pop A
e4 40                          # 5306 |   pop B
e4 60                          # 5308 |   pop C
dc                             # 530a |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # 530b |   push A
                               #      | _A_for_2:
61 20 bc 04                    # 530d |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # 5311 |   bmov H, [A]
e8 ff 00 f8 16 00              # 5314 |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_4:
e0 ff                          # 531a |   push H
5c f8 8a ff                    # 531c |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 5320 |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # 5324 |   inc A
58 f8 eb ff                    # 5326 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # 532a |   pop A
dc                             # 532c |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # 532d |   push C
e0 40                          # 532f |   push B
e0 20                          # 5331 |   push A
61 40 bc 08                    # 5333 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 5337 |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # 533b |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # 533f |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # 5346 |   shr H, B, A*4
2c ff 1c 0f                    # 534a |   and H, 0xf
                               #      | _A_call_6:
e0 ff                          # 534e |   push H
5c f8 1a 00                    # 5350 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # 5354 |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 60 ff                       # 5358 |   mov [C], H
44 60                          # 535b |   inc C
                               #      | _BZ_for_3:
48 20                          # 535d |   dec A
58 f8 e0 ff                    # 535f |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # 5363 |   pop A
e4 40                          # 5365 |   pop B
e4 60                          # 5367 |   pop C
dc                             # 5369 |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_6:
fa bc 1c f8 02 09 12 00        # 536a |   jgt [SP + 0x2], 0x9, ${_E_if_6}:rel + PC
81 ff bc 1c 02 30              # 5372 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # 5378 |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
81 ff bc 1c 02 57              # 537c |   add H, [SP + 0x2], 0x57
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # 5382 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # 5383 |   push C
e0 40                          # 5385 |   push B
e0 20                          # 5387 |   push A
61 40 bc 08                    # 5389 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 538d |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # 5391 |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # 5395 |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # 539c |   shr H, B, A
2c ff 1c 01                    # 53a0 |   and H, 0x1
82 60 ff 1c 30                 # 53a4 |   add [C], H, 0x30
44 60                          # 53a9 |   inc C
                               #      | _BZ_for_4:
48 20                          # 53ab |   dec A
58 f8 e8 ff                    # 53ad |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # 53b1 |   pop A
e4 40                          # 53b3 |   pop B
e4 60                          # 53b5 |   pop C
dc                             # 53b7 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
62 65 66 6f 72 65 20 53 50 3d 25 78 0a 00 # 53b8 |   .data str:"before SP=%x\n"
                               #      | const__data_2:
74 65 73 74 20 25 64 20 25 78 0a 00 # 53c6 |   .data str:"test %d %x\n"
                               #      | const__data_3:
61 66 74 65 72 20 53 50 3d 25 78 0a 00 # 53d2 |   .data str:"after SP=%x\n"
                               #      | const__data_4:
74 65 73 74 20 32 20 25 64 20 25 78 0a 00 # 53df |   .data str:"test 2 %d %x\n"
                               #      | const__data_5:
6f 6b 61 79 20 25 64 20 25 78 0a 00 # 53ed |   .data str:"okay %d %x\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x53f9
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
