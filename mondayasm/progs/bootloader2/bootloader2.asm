                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 00 ff                 # a000 |   mov SP, 0xff00
                               #      | _A_call_29:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_29:
d8                             # a009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # a00a |   push B
e0 20                          # a00c |   push A
60 20 e0 fd 00                 # a00e |   mov A, 0xfd
60 40 00                       # a013 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # a016 |   mmap 0xff00, -1, 0x2
                               #      | _A_call_2:
e0 e0 fc a4                    # a01e |   push ${const__data_1}
5c f8 4b 00                    # a022 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a026 |   mov SP, SP + 0x2
                               #      | _Z_call_2:
c6 e0 00 0a ff                 # a02a |   inc [0xff0a], 0
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_call_26:
5c f8 78 00                    # a02f |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_26:
60 20 ff                       # a033 |   mov A, H
                               #      | _A_if_36:
ec fe 00 f8 0a 00              # a036 |   jne G, 0, ${_E_if_36}:rel + PC
58 f8 f3 ff                    # a03c |   jmp ${_BA_loop_2}:rel + PC
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _A_if_37:
ec 20 00 f8 16 00              # a040 |   jne A, 0, ${_E_if_37}:rel + PC
                               #      | _A_call_27:
e0 e0 75 a5                    # a046 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 23 00                    # a04a |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a04e |   mov SP, SP + 0x2
                               #      | _Z_call_27:
58 f8 dd ff                    # a052 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _A_call_28:
e0 ff                          # a056 |   push H
e0 e0 86 a5                    # a058 |   push ${const__data_5}
5c f8 cd 02                    # a05c |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a060 |   mov SP, SP + 0x4
                               #      | _Z_call_28:
                               #      | _BZ_loop_2:
58 f8 cb ff                    # a064 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_main:
e4 20                          # a068 |   pop A
e4 40                          # a06a |   pop B
dc                             # a06c |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a06d |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a06f |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a073 |   bmov H, [A]
e8 ff 00 f8 16 00              # a076 |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a07c |   push H
5c f8 11 00                    # a07e |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a082 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a086 |   inc A
58 f8 eb ff                    # a088 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a08c |   pop A
dc                             # a08e |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a08f |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a096 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a09c |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a0a0 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a0a6 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # a0a7 |   push D
e0 60                          # a0a9 |   push C
e0 20                          # a0ab |   push A
60 a0 bc fe                    # a0ad |   mov SP, SP + -2
60 a0 bc de                    # a0b1 |   mov SP, SP + -34
62 a0 00                       # a0b5 |   mov [SP], 0
60 20 a0                       # a0b8 |   mov A, SP
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 60 e0 02 ff                 # a0bb |   mov C, [0xff02]
ac 80 60 e0 00 80              # a0c0 |   and D, C, 0x8000
e8 80 00 f8 f5 ff              # a0c6 |   jeq D, 0, ${_BA_loop_3}:rel + PC
2c 60 e0 ff 00                 # a0cc |   and C, 0xff
62 e0 60 00 ff                 # a0d1 |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # a0d6 |   jeq C, 0xa, ${_C_loop_3}:rel + PC
e8 60 1c f8 0d 29 00           # a0dd |   jeq C, 0xd, ${_C_loop_3}:rel + PC
                               #      | _A_if_6:
f0 20 bc f8 1f 19 00           # a0e4 |   jlt A, SP + 0x1f, ${_E_if_6}:rel + PC
                               #      | _A_call_3:
e0 e0 31 a5                    # a0eb |   push ${const__data_2}
5c f8 7e ff                    # a0ef |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0f3 |   mov SP, SP + 0x2
                               #      | _Z_call_3:
e8 ff 00 f8 e2 00              # a0f7 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
62 20 60                       # a0fd |   mov [A], C
44 20                          # a100 |   inc A
                               #      | _BZ_loop_3:
58 f8 b9 ff                    # a102 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _A_call_4:
e0 1c 20                       # a106 |   push 0x20
e0 bc 02                       # a109 |   push SP + 0x2
5c f8 de 00                    # a10c |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a110 |   mov SP, SP + 0x4
                               #      | _Z_call_4:
60 60 ff                       # a114 |   mov C, H
                               #      | _A_if_11:
e8 60 00 f8 0f 00              # a117 |   jeq C, 0, ${_E_if_11}:rel + PC
66 60 00                       # a11d |   bmov [C], 0
44 60                          # a120 |   inc C
58 f8 08 00                    # a122 |   jmp ${_C_if_11}:rel + PC
                               #      | _E_if_11:
60 60 1c ff                    # a126 |   mov C, -1
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _A_call_8:
e0 a0                          # a12a |   push SP
5c f8 dd 00                    # a12c |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # a130 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
e8 ff 00 f8 ab 00              # a134 |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # a13a |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 00 fb                 # a13e |   mov [${var__g_num_args}], 0
                               #      | _A_while_1:
                               #      | _BA_while_1:
fc 60 bc f8 20 8b 00           # a143 |   jge C, SP + 0x20, ${_C_while_1}:rel + PC
                               #      | _A_call_9:
e0 1c 20                       # a14a |   push 0x20
e0 60                          # a14d |   push C
5c f8 9b 00                    # a14f |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a153 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
60 80 ff                       # a157 |   mov D, H
                               #      | _A_if_21:
e8 80 00 f8 0d 00              # a15a |   jeq D, 0, ${_E_if_21}:rel + PC
66 80 00                       # a160 |   bmov [D], 0
58 f8 08 00                    # a163 |   jmp ${_C_if_21}:rel + PC
                               #      | _E_if_21:
60 80 1c fe                    # a167 |   mov D, -2
                               #      | _C_if_21:
                               #      | _Z_if_21:
61 20 e0 00 fb                 # a16b |   mov A, [${var__g_num_args}]
                               #      | _A_if_22:
f0 20 1c f8 04 17 00           # a170 |   jlt A, 0x4, ${_E_if_22}:rel + PC
                               #      | _A_call_10:
e0 e0 4c a5                    # a177 |   push ${const__str__TOO_MANY_ARGS__endl}
5c f8 f2 fe                    # a17b |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a17f |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 56 00                    # a183 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _A_call_12:
e0 60                          # a187 |   push C
5c f8 15 01                    # a189 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a18d |   mov SP, SP + 0x2
                               #      | _Z_call_12:
                               #      | _A_if_31:
ec fe 00 f8 18 00              # a191 |   jne G, 0, ${_E_if_31}:rel + PC
                               #      | _A_call_24:
e0 20                          # a197 |   push A
e0 e0 5b a5                    # a199 |   push ${const__data_3}
5c f8 8c 01                    # a19d |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a1a1 |   mov SP, SP + 0x4
                               #      | _Z_call_24:
58 f8 34 00                    # a1a5 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
62 e4 ff 02 fb                 # a1a9 |   mov [${var__g_args} + A], H
                               #      | _A_call_25:
e2 e4 02 fb                    # a1ae |   push [${var__g_args} + A]
e2 e0 00 fb                    # a1b2 |   push [${var__g_num_args}]
e0 e0 6b a5                    # a1b6 |   push ${const__data_4}
5c f8 6f 01                    # a1ba |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a1be |   mov SP, SP + 0x6
                               #      | _Z_call_25:
c6 e0 20 00 fb                 # a1c2 |   inc [${var__g_num_args}], A
c4 60 80                       # a1c7 |   inc C, D
                               #      | _BZ_while_1:
58 f8 79 ff                    # a1ca |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
c4 fe 00                       # a1ce |   inc G, 0
61 ff bc 22                    # a1d1 |   mov H, [SP + 0x22]
58 f8 0a 00                    # a1d5 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # a1d9 |   mov G, 0
60 ff 00                       # a1dc |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # a1df |   mov SP, SP + 0x24
e4 20                          # a1e3 |   pop A
e4 60                          # a1e5 |   pop C
e4 80                          # a1e7 |   pop D
dc                             # a1e9 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # a1ea |   mov H, [SP + 0x2]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
65 fe ff                       # a1ee |   bmov G, [H]
e9 fe bc f8 04 17 00           # a1f1 |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_10:
ec fe 00 f8 0a 00              # a1f8 |   jne G, 0, ${_E_if_10}:rel + PC
60 ff 00                       # a1fe |   mov H, 0
dc                             # a201 |   ret
                               #      | _E_if_10:
                               #      | _C_if_10:
                               #      | _Z_if_10:
44 ff                          # a202 |   inc H
                               #      | _BZ_loop_4:
58 f8 ea ff                    # a204 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_strchr:
dc                             # a208 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # a209 |   push A
61 20 bc 04                    # a20b |   mov A, [SP + 0x4]
                               #      | _A_call_5:
e0 e0 3c a5                    # a20f |   push ${const__str__PING}
e0 20                          # a213 |   push A
5c f8 53 00                    # a215 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a219 |   mov SP, SP + 0x4
                               #      | _Z_call_5:
                               #      | _A_if_15:
ec ff 00 f8 0d 00              # a21d |   jne H, 0, ${_E_if_15}:rel + PC
c4 ff 00                       # a223 |   inc H, 0
58 f8 3f 00                    # a226 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_15:
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _A_call_6:
e0 e0 41 a5                    # a22a |   push ${const__str__READ}
e0 20                          # a22e |   push A
5c f8 38 00                    # a230 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a234 |   mov SP, SP + 0x4
                               #      | _Z_call_6:
                               #      | _A_if_17:
ec ff 00 f8 0e 00              # a238 |   jne H, 0, ${_E_if_17}:rel + PC
60 ff 1c 02                    # a23e |   mov H, 0x2
58 f8 23 00                    # a242 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _A_call_7:
e0 e0 46 a5                    # a246 |   push ${const__str__WRITE}
e0 20                          # a24a |   push A
5c f8 1c 00                    # a24c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a250 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_if_19:
ec ff 00 f8 0e 00              # a254 |   jne H, 0, ${_E_if_19}:rel + PC
60 ff 1c 03                    # a25a |   mov H, 0x3
58 f8 07 00                    # a25e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_19:
                               #      | _C_if_19:
                               #      | _Z_if_19:
60 ff 00                       # a262 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # a265 |   pop A
dc                             # a267 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # a268 |   push A
61 fc bc 04                    # a26a |   mov E, [SP + 0x4]
61 fd bc 06                    # a26e |   mov F, [SP + 0x6]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
65 fe fc                       # a272 |   bmov G, [E]
65 ff fd                       # a275 |   bmov H, [F]
60 20 fe                       # a278 |   mov A, G
30 fe 1c 20                    # a27b |   or G, 0x20
30 ff 1c 20                    # a27f |   or H, 0x20
84 ff fe ff                    # a283 |   sub H, G, H
ec ff 00 f8 14 00              # a287 |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # a28d |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # a293 |   inc E
44 fd                          # a295 |   inc F
                               #      | _BZ_loop_5:
58 f8 db ff                    # a297 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # a29b |   pop A
dc                             # a29d |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # a29e |   push B
e0 20                          # a2a0 |   push A
60 20 00                       # a2a2 |   mov A, 0
61 40 bc 06                    # a2a5 |   mov B, [SP + 0x6]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 ff 40                       # a2a9 |   bmov H, [B]
e8 ff 00 f8 23 00              # a2ac |   jeq H, 0, ${_C_loop_6}:rel + PC
                               #      | _A_call_11:
e0 ff                          # a2b2 |   push H
5c f8 3a 00                    # a2b4 |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # a2b8 |   mov SP, SP + 0x2
                               #      | _Z_call_11:
e8 fe 00 f8 2d 00              # a2bc |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # a2c2 |   shl A, 0x4
00 20 ff                       # a2c6 |   add A, H
44 40                          # a2c9 |   inc B
                               #      | _BZ_loop_6:
58 f8 de ff                    # a2cb |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
60 fe 00                       # a2cf |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # a2d2 |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # a2d6 |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # a2dc |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # a2e3 |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # a2e6 |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # a2e9 |   pop A
e4 40                          # a2eb |   pop B
dc                             # a2ed |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # a2ee |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # a2f4 |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # a2fb |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # a302 |   sub H, G, 0x30
c4 fe 00                       # a307 |   inc G, 0
dc                             # a30a |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # a30b |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # a312 |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # a319 |   add H, G, -87
c4 fe 00                       # a31e |   inc G, 0
dc                             # a321 |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # a322 |   mov H, 0
60 fe 00                       # a325 |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # a328 |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # a329 |   push C
e0 40                          # a32b |   push B
e0 20                          # a32d |   push A
60 a0 bc ee                    # a32f |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # a333 |   mov B, SP + 0x1c
                               #      | _A_for_2:
61 20 bc 1a                    # a337 |   mov A, [SP + 0x1a]
                               #      | _BA_for_2:
65 60 20                       # a33b |   bmov C, [A]
e8 60 00 f8 db 00              # a33e |   jeq C, 0, ${_C_for_2}:rel + PC
                               #      |   # normal char
                               #      | _A_if_33:
e8 60 1c f8 25 15 00           # a344 |   jeq C, 0x25, ${_E_if_33}:rel + PC
                               #      | _A_call_13:
e0 60                          # a34b |   push C
5c f8 42 fd                    # a34d |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a351 |   mov SP, SP + 0x2
                               #      | _Z_call_13:
58 f8 be 00                    # a355 |   jmp ${_BZ_for_2}:rel + PC
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      |   # format specifier
44 20                          # a359 |   inc A
65 60 20                       # a35b |   bmov C, [A]
                               #      | _A_if_34:
ec 60 00 f8 0e 00              # a35e |   jne C, 0, ${_E_if_34}:rel + PC
58 f8 b5 00                    # a364 |   jmp ${_C_for_2}:rel + PC
58 f8 a7 00                    # a368 |   jmp ${_C_if_34}:rel + PC
                               #      | _E_if_34:
ec 60 1c f8 25 1a 00           # a36c |   jne C, 0x25, ${_E2_if_34}:rel + PC
                               #      | _A_call_14:
e0 1c 25                       # a373 |   push 0x25
5c f8 19 fd                    # a376 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a37a |   mov SP, SP + 0x2
                               #      | _Z_call_14:
58 f8 95 00                    # a37e |   jmp ${_BZ_for_2}:rel + PC
58 f8 8d 00                    # a382 |   jmp ${_C_if_34}:rel + PC
                               #      | _E2_if_34:
ec 60 1c f8 64 21 00           # a386 |   jne C, 0x64, ${_E3_if_34}:rel + PC
                               #      | _A_call_15:
e0 a0                          # a38d |   push SP
e2 40                          # a38f |   push [B]
5c f8 93 00                    # a391 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # a395 |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_call_16:
e0 a0                          # a399 |   push SP
5c f8 d2 fc                    # a39b |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a39f |   mov SP, SP + 0x2
                               #      | _Z_call_16:
58 f8 6c 00                    # a3a3 |   jmp ${_C_if_34}:rel + PC
                               #      | _E3_if_34:
ec 60 1c f8 78 21 00           # a3a7 |   jne C, 0x78, ${_E4_if_34}:rel + PC
                               #      | _A_call_18:
e0 a0                          # a3ae |   push SP
e2 40                          # a3b0 |   push [B]
5c f8 bf 00                    # a3b2 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a3b6 |   mov SP, SP + 0x4
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 a0                          # a3ba |   push SP
5c f8 b1 fc                    # a3bc |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a3c0 |   mov SP, SP + 0x2
                               #      | _Z_call_19:
58 f8 4b 00                    # a3c4 |   jmp ${_C_if_34}:rel + PC
                               #      | _E4_if_34:
ec 60 1c f8 62 21 00           # a3c8 |   jne C, 0x62, ${_E5_if_34}:rel + PC
                               #      | _A_call_20:
e0 a0                          # a3cf |   push SP
e2 40                          # a3d1 |   push [B]
5c f8 f4 00                    # a3d3 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # a3d7 |   mov SP, SP + 0x4
                               #      | _Z_call_20:
                               #      | _A_call_21:
e0 a0                          # a3db |   push SP
5c f8 90 fc                    # a3dd |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a3e1 |   mov SP, SP + 0x2
                               #      | _Z_call_21:
58 f8 2a 00                    # a3e5 |   jmp ${_C_if_34}:rel + PC
                               #      | _E5_if_34:
ec 60 1c f8 73 15 00           # a3e9 |   jne C, 0x73, ${_E6_if_34}:rel + PC
                               #      | _A_call_22:
e2 40                          # a3f0 |   push [B]
5c f8 7b fc                    # a3f2 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a3f6 |   mov SP, SP + 0x2
                               #      | _Z_call_22:
58 f8 15 00                    # a3fa |   jmp ${_C_if_34}:rel + PC
                               #      | _E6_if_34:
ec 60 1c f8 63 11 00           # a3fe |   jne C, 0x63, ${_E7_if_34}:rel + PC
                               #      | _A_call_23:
e2 40                          # a405 |   push [B]
5c f8 88 fc                    # a407 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a40b |   mov SP, SP + 0x2
                               #      | _Z_call_23:
                               #      | _E7_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
60 40 5c 02                    # a40f |   mov B, B + 0x2
                               #      | _BZ_for_2:
44 20                          # a413 |   inc A
58 f8 26 ff                    # a415 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # a419 |   mov SP, SP + 0x12
e4 20                          # a41d |   pop A
e4 40                          # a41f |   pop B
e4 60                          # a421 |   pop C
dc                             # a423 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # a424 |   push C
e0 40                          # a426 |   push B
e0 20                          # a428 |   push A
61 20 bc 0a                    # a42a |   mov A, [SP + 0xa]
62 20 1c 30                    # a42e |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # a432 |   mov B, [SP + 0x8]
                               #      | _A_while_2:
                               #      | _BA_while_2:
e8 40 00 f8 19 00              # a436 |   jeq B, 0, ${_C_while_2}:rel + PC
90 60 40 1c 0a                 # a43c |   div C, B, 0xa
82 20 ff 1c 30                 # a441 |   add [A], H, 0x30
44 20                          # a446 |   inc A
60 40 60                       # a448 |   mov B, C
                               #      | _BZ_while_2:
58 f8 eb ff                    # a44b |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      |   # reverse the string
61 60 bc 0a                    # a44f |   mov C, [SP + 0xa]
                               #      | _A_while_3:
                               #      | _BA_while_3:
fc 60 20 f8 17 00              # a453 |   jge C, A, ${_C_while_3}:rel + PC
48 20                          # a459 |   dec A
61 40 60                       # a45b |   mov B, [C]
67 60 20                       # a45e |   bmov [C], [A]
66 20 40                       # a461 |   bmov [A], B
44 60                          # a464 |   inc C
                               #      | _BZ_while_3:
58 f8 ed ff                    # a466 |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # a46a |   pop A
e4 40                          # a46c |   pop B
e4 60                          # a46e |   pop C
dc                             # a470 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # a471 |   push C
e0 40                          # a473 |   push B
e0 20                          # a475 |   push A
61 40 bc 08                    # a477 |   mov B, [SP + 0x8]
61 60 bc 0a                    # a47b |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # a47f |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # a483 |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # a48a |   shr H, B, A*4
2c ff 1c 0f                    # a48e |   and H, 0xf
                               #      | _A_call_17:
e0 ff                          # a492 |   push H
5c f8 1a 00                    # a494 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # a498 |   mov SP, SP + 0x2
                               #      | _Z_call_17:
62 60 ff                       # a49c |   mov [C], H
44 60                          # a49f |   inc C
                               #      | _BZ_for_3:
48 20                          # a4a1 |   dec A
58 f8 e0 ff                    # a4a3 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # a4a7 |   pop A
e4 40                          # a4a9 |   pop B
e4 60                          # a4ab |   pop C
dc                             # a4ad |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_35:
fa bc 1c f8 02 09 12 00        # a4ae |   jgt [SP + 0x2], 0x9, ${_E_if_35}:rel + PC
81 ff bc 1c 02 30              # a4b6 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # a4bc |   jmp ${_C_if_35}:rel + PC
                               #      | _E_if_35:
81 ff bc 1c 02 57              # a4c0 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # a4c6 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # a4c7 |   push C
e0 40                          # a4c9 |   push B
e0 20                          # a4cb |   push A
61 40 bc 08                    # a4cd |   mov B, [SP + 0x8]
61 60 bc 0a                    # a4d1 |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # a4d5 |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # a4d9 |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # a4e0 |   shr H, B, A
2c ff 1c 01                    # a4e4 |   and H, 0x1
82 60 ff 1c 30                 # a4e8 |   add [C], H, 0x30
44 60                          # a4ed |   inc C
                               #      | _BZ_for_4:
48 20                          # a4ef |   dec A
58 f8 e8 ff                    # a4f1 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # a4f5 |   pop A
e4 40                          # a4f7 |   pop B
e4 60                          # a4f9 |   pop C
dc                             # a4fb |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__data_1:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 32 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 30 0a 52 45 41 44 59 0a 00 # a4fc |   .data str:"Weeekly3006 - Hardware v1.2 - Bootloader v2.0\nREADY\n"
                               #      | const__data_2:
24 4f 56 45 52 46 4c 4f 57 0a 00 # a531 |   .data str:"$OVERFLOW\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # a53c |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # a541 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # a546 |   .data str:"WRITE"
                               #      | const__str__TOO_MANY_ARGS__endl:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 0a 00 # a54c |   .data str:"TOO_MANY_ARGS\n"
                               #      | const__data_3:
49 4e 56 41 4c 49 44 5f 41 52 47 20 25 64 0a 00 # a55b |   .data str:"INVALID_ARG %d\n"
                               #      | const__data_4:
61 72 67 25 64 3d 25 78 0a 00  # a56b |   .data str:"arg%d=%x\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # a575 |   .data str:"UNKNOWN_COMMAND\n"
                               #      | const__data_5:
72 65 63 76 3a 20 25 64 0a 00  # a586 |   .data str:"recv: %d\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xfb00
                               #      | SECTION_BEGIN_static_data:
                               #      | var__g_num_args:
                               # fb00 |   .bss size:2 align:1
                               #      | var__g_args:
                               # fb02 |   .bss size:10 align:2
                               #      | SECTION_END_static_data:
                               #      | 
