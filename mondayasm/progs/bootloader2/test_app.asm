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
e0 e0 e8 53                    # 5113 |   push ${const__data_1}
5c f8 a2 00                    # 5117 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 511b |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_syscall_1:
e0 e0 ff aa                    # 511f |   push 0xaaff
e0 1c 7b                       # 5123 |   push 0x7b
e0 e0 f6 53                    # 5126 |   push ${const__data_2}
60 ff 00                       # 512a |   mov H, 0
5e e0 00 01                    # 512d |   call [0x100]
60 a0 bc 06                    # 5131 |   mov SP, SP + 0x6
                               #      | _Z_syscall_1:
                               #      | _A_call_16:
e0 a0                          # 5135 |   push SP
e0 e0 02 54                    # 5137 |   push ${const__data_3}
5c f8 7e 00                    # 513b |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 513f |   mov SP, SP + 0x4
                               #      | _Z_call_16:
                               #      | _A_call_17:
e0 a0                          # 5143 |   push SP
e0 e0 e8 53                    # 5145 |   push ${const__data_1}
5c f8 70 00                    # 5149 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 514d |   mov SP, SP + 0x4
                               #      | _Z_call_17:
                               #      | _A_syscall_2:
e0 e0 ff aa                    # 5151 |   push 0xaaff
e0 1c 0b                       # 5155 |   push 0xb
e0 e0 0f 54                    # 5158 |   push ${const__data_4}
60 ff 00                       # 515c |   mov H, 0
5e e0 00 01                    # 515f |   call [0x100]
60 a0 bc 06                    # 5163 |   mov SP, SP + 0x6
                               #      | _Z_syscall_2:
                               #      | _A_call_18:
e0 a0                          # 5167 |   push SP
e0 e0 02 54                    # 5169 |   push ${const__data_3}
5c f8 4c 00                    # 516d |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # 5171 |   mov SP, SP + 0x4
                               #      | _Z_call_18:
                               #      | _A_syscall_3:
e0 e0 ff aa                    # 5175 |   push 0xaaff
e0 1c 16                       # 5179 |   push 0x16
e0 e0 1d 54                    # 517c |   push ${const__data_5}
60 ff 00                       # 5180 |   mov H, 0
5e e0 00 01                    # 5183 |   call [0x100]
60 a0 bc 06                    # 5187 |   mov SP, SP + 0x6
                               #      | _Z_syscall_3:
                               #      | _A_syscall_4:
e0 e0 ff aa                    # 518b |   push 0xaaff
e0 1c 16                       # 518f |   push 0x16
e0 e0 29 54                    # 5192 |   push ${const__data_6}
60 ff 1c 11                    # 5196 |   mov H, 0x11
5e e0 00 01                    # 519a |   call [0x100]
60 a0 bc 06                    # 519e |   mov SP, SP + 0x6
                               #      | _Z_syscall_4:
                               #      | _A_syscall_5:
e0 e0 ff aa                    # 51a2 |   push 0xaaff
e0 1c 16                       # 51a6 |   push 0x16
e0 e0 1d 54                    # 51a9 |   push ${const__data_5}
60 ff 00                       # 51ad |   mov H, 0
5e e0 00 01                    # 51b0 |   call [0x100]
60 a0 bc 06                    # 51b4 |   mov SP, SP + 0x6
                               #      | _Z_syscall_5:
                               #      | _cleanup_fn_main:
dc                             # 51b8 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # 51b9 |   push C
e0 40                          # 51bb |   push B
e0 20                          # 51bd |   push A
60 a0 bc ee                    # 51bf |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # 51c3 |   mov B, SP + 0x1c
                               #      | _A_for_1:
61 20 bc 1a                    # 51c7 |   mov A, [SP + 0x1a]
                               #      | _BA_for_1:
65 60 20                       # 51cb |   bmov C, [A]
e8 60 00 f8 fd 00              # 51ce |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # 51d4 |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # 51db |   push C
5c f8 f9 00                    # 51dd |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 51e1 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 e0 00                    # 51e5 |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # 51e9 |   inc A
65 60 20                       # 51eb |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # 51ee |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 d7 00                    # 51f4 |   jmp ${_C_for_1}:rel + PC
58 f8 c9 00                    # 51f8 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 25 1a 00           # 51fc |   jne C, 0x25, ${_E2_if_4}:rel + PC
                               #      | _A_call_2:
e0 1c 25                       # 5203 |   push 0x25
5c f8 d0 00                    # 5206 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 520a |   mov SP, SP + 0x2
                               #      | _Z_call_2:
58 f8 b7 00                    # 520e |   jmp ${_BZ_for_1}:rel + PC
58 f8 af 00                    # 5212 |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 64 21 00           # 5216 |   jne C, 0x64, ${_E3_if_4}:rel + PC
                               #      | _A_call_3:
e0 a0                          # 521d |   push SP
e2 40                          # 521f |   push [B]
5c f8 cd 00                    # 5221 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # 5225 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 a0                          # 5229 |   push SP
5c f8 10 01                    # 522b |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 522f |   mov SP, SP + 0x2
                               #      | _Z_call_5:
58 f8 8e 00                    # 5233 |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 78 21 00           # 5237 |   jne C, 0x78, ${_E4_if_4}:rel + PC
                               #      | _A_call_7:
e0 a0                          # 523e |   push SP
e2 40                          # 5240 |   push [B]
5c f8 1b 01                    # 5242 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 5246 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 a0                          # 524a |   push SP
5c f8 ef 00                    # 524c |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 5250 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
58 f8 6d 00                    # 5254 |   jmp ${_C_if_4}:rel + PC
                               #      | _E4_if_4:
ec 60 1c f8 68 22 00           # 5258 |   jne C, 0x68, ${_E5_if_4}:rel + PC
                               #      | _A_call_9:
e0 a0                          # 525f |   push SP
e2 40                          # 5261 |   push [B]
5c f8 fa 00                    # 5263 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # 5267 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 bc 02                       # 526b |   push SP + 0x2
5c f8 cd 00                    # 526e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 5272 |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 4b 00                    # 5276 |   jmp ${_C_if_4}:rel + PC
                               #      | _E5_if_4:
ec 60 1c f8 62 21 00           # 527a |   jne C, 0x62, ${_E6_if_4}:rel + PC
                               #      | _A_call_11:
e0 a0                          # 5281 |   push SP
e2 40                          # 5283 |   push [B]
5c f8 2e 01                    # 5285 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # 5289 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 a0                          # 528d |   push SP
5c f8 ac 00                    # 528f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 5293 |   mov SP, SP + 0x2
                               #      | _Z_call_12:
58 f8 2a 00                    # 5297 |   jmp ${_C_if_4}:rel + PC
                               #      | _E6_if_4:
ec 60 1c f8 73 15 00           # 529b |   jne C, 0x73, ${_E7_if_4}:rel + PC
                               #      | _A_call_13:
e2 40                          # 52a2 |   push [B]
5c f8 97 00                    # 52a4 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # 52a8 |   mov SP, SP + 0x2
                               #      | _Z_call_13:
58 f8 15 00                    # 52ac |   jmp ${_C_if_4}:rel + PC
                               #      | _E7_if_4:
ec 60 1c f8 63 11 00           # 52b0 |   jne C, 0x63, ${_E8_if_4}:rel + PC
                               #      | _A_call_14:
e2 40                          # 52b7 |   push [B]
5c f8 1d 00                    # 52b9 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 52bd |   mov SP, SP + 0x2
                               #      | _Z_call_14:
                               #      | _E8_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
60 40 5c 02                    # 52c1 |   mov B, B + 0x2
                               #      | _BZ_for_1:
44 20                          # 52c5 |   inc A
58 f8 04 ff                    # 52c7 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # 52cb |   mov SP, SP + 0x12
e4 20                          # 52cf |   pop A
e4 40                          # 52d1 |   pop B
e4 60                          # 52d3 |   pop C
dc                             # 52d5 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # 52d6 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # 52dd |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # 52e3 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # 52e7 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # 52ed |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # 52ee |   push C
e0 40                          # 52f0 |   push B
e0 20                          # 52f2 |   push A
61 20 bc 0a                    # 52f4 |   mov A, [SP + 0xa]
62 20 1c 30                    # 52f8 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # 52fc |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # 5300 |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # 5306 |   div C, B, 0xa
82 20 ff 1c 30                 # 530b |   add [A], H, 0x30
44 20                          # 5310 |   inc A
60 40 60                       # 5312 |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # 5315 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # 5319 |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # 531d |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # 5323 |   dec A
61 40 60                       # 5325 |   mov B, [C]
67 60 20                       # 5328 |   bmov [C], [A]
66 20 40                       # 532b |   bmov [A], B
44 60                          # 532e |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # 5330 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # 5334 |   pop A
e4 40                          # 5336 |   pop B
e4 60                          # 5338 |   pop C
dc                             # 533a |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # 533b |   push A
                               #      | _A_for_2:
61 20 bc 04                    # 533d |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # 5341 |   bmov H, [A]
e8 ff 00 f8 16 00              # 5344 |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_4:
e0 ff                          # 534a |   push H
5c f8 8a ff                    # 534c |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # 5350 |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # 5354 |   inc A
58 f8 eb ff                    # 5356 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # 535a |   pop A
dc                             # 535c |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # 535d |   push C
e0 40                          # 535f |   push B
e0 20                          # 5361 |   push A
61 40 bc 08                    # 5363 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 5367 |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # 536b |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # 536f |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # 5376 |   shr H, B, A*4
2c ff 1c 0f                    # 537a |   and H, 0xf
                               #      | _A_call_6:
e0 ff                          # 537e |   push H
5c f8 1a 00                    # 5380 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # 5384 |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 60 ff                       # 5388 |   mov [C], H
44 60                          # 538b |   inc C
                               #      | _BZ_for_3:
48 20                          # 538d |   dec A
58 f8 e0 ff                    # 538f |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # 5393 |   pop A
e4 40                          # 5395 |   pop B
e4 60                          # 5397 |   pop C
dc                             # 5399 |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_6:
fa bc 1c f8 02 09 12 00        # 539a |   jgt [SP + 0x2], 0x9, ${_E_if_6}:rel + PC
81 ff bc 1c 02 30              # 53a2 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # 53a8 |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
81 ff bc 1c 02 57              # 53ac |   add H, [SP + 0x2], 0x57
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # 53b2 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # 53b3 |   push C
e0 40                          # 53b5 |   push B
e0 20                          # 53b7 |   push A
61 40 bc 08                    # 53b9 |   mov B, [SP + 0x8]
61 60 bc 0a                    # 53bd |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # 53c1 |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # 53c5 |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # 53cc |   shr H, B, A
2c ff 1c 01                    # 53d0 |   and H, 0x1
82 60 ff 1c 30                 # 53d4 |   add [C], H, 0x30
44 60                          # 53d9 |   inc C
                               #      | _BZ_for_4:
48 20                          # 53db |   dec A
58 f8 e8 ff                    # 53dd |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # 53e1 |   pop A
e4 40                          # 53e3 |   pop B
e4 60                          # 53e5 |   pop C
dc                             # 53e7 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
62 65 66 6f 72 65 20 53 50 3d 25 78 0a 00 # 53e8 |   .data str:"before SP=%x\n"
                               #      | const__data_2:
74 65 73 74 20 25 64 20 25 78 0a 00 # 53f6 |   .data str:"test %d %x\n"
                               #      | const__data_3:
61 66 74 65 72 20 53 50 3d 25 78 0a 00 # 5402 |   .data str:"after SP=%x\n"
                               #      | const__data_4:
74 65 73 74 20 32 20 25 64 20 25 78 0a 00 # 540f |   .data str:"test 2 %d %x\n"
                               #      | const__data_5:
6f 6b 61 79 20 25 64 20 25 78 0a 00 # 541d |   .data str:"okay %d %x\n"
                               #      | const__data_6:
74 65 73 74 20 70 75 74 73 20 25 64 20 25 78 0a 00 # 5429 |   .data str:"test puts %d %x\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0x543a
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
