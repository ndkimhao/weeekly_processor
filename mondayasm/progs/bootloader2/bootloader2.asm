                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 00 ff                 # a000 |   mov SP, 0xff00
                               #      | _A_call_31:
5c f8 66 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_31:
d8                             # a009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_2:
e0 e0 2c a5                    # a00a |   push ${const__str__PONG__endl}
5c f8 09 00                    # a00e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a012 |   mov SP, SP + 0x2
                               #      | _Z_call_2:
                               #      | _cleanup_fn_handle_ping:
dc                             # a016 |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a017 |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a019 |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a01d |   bmov H, [A]
e8 ff 00 f8 16 00              # a020 |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a026 |   push H
5c f8 11 00                    # a028 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a02c |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a030 |   inc A
58 f8 eb ff                    # a032 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a036 |   pop A
dc                             # a038 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a039 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a040 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a046 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a04a |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a050 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
                               #      | _A_call_3:
e0 e0 32 a5                    # a051 |   push ${const__str__read__endl}
5c f8 c2 ff                    # a055 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a059 |   mov SP, SP + 0x2
                               #      | _Z_call_3:
                               #      | _cleanup_fn_handle_read:
dc                             # a05d |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
                               #      | _A_call_4:
e0 e0 38 a5                    # a05e |   push ${const__str__write__endl}
5c f8 b5 ff                    # a062 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a066 |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _cleanup_fn_handle_write:
dc                             # a06a |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # a06b |   push B
e0 20                          # a06d |   push A
60 20 e0 fd 00                 # a06f |   mov A, 0xfd
60 40 00                       # a074 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # a077 |   mmap 0xff00, -1, 0x2
                               #      | _A_call_5:
e0 e0 45 a5                    # a07f |   push ${const__data_1}
5c f8 94 ff                    # a083 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a087 |   mov SP, SP + 0x2
                               #      | _Z_call_5:
c6 e0 00 0a ff                 # a08b |   inc [0xff0a], 0
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
                               #      | _A_call_29:
5c f8 3b 00                    # a090 |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_29:
60 20 ff                       # a094 |   mov A, H
                               #      | _A_if_36:
ec fe 00 f8 0a 00              # a097 |   jne G, 0, ${_E_if_36}:rel + PC
58 f8 f3 ff                    # a09d |   jmp ${_BA_loop_2}:rel + PC
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _A_if_37:
ec 20 00 f8 16 00              # a0a1 |   jne A, 0, ${_E_if_37}:rel + PC
                               #      | _A_call_30:
e0 e0 be a5                    # a0a7 |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 6c ff                    # a0ab |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a0af |   mov SP, SP + 0x2
                               #      | _Z_call_30:
58 f8 dd ff                    # a0b3 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
28 20 1c 01                    # a0b7 |   shl A, 0x1
60 20 e4 3d a5                 # a0bb |   mov A, ${const__HANDLER_MAP} + -002 + A
5e 20                          # a0c0 |   call [A]
                               #      | _BZ_loop_2:
58 f8 ce ff                    # a0c2 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_main:
e4 20                          # a0c6 |   pop A
e4 40                          # a0c8 |   pop B
dc                             # a0ca |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # a0cb |   push D
e0 60                          # a0cd |   push C
e0 40                          # a0cf |   push B
e0 20                          # a0d1 |   push A
60 a0 bc fe                    # a0d3 |   mov SP, SP + -2
62 a0 00                       # a0d7 |   mov [SP], 0
60 a0 bc de                    # a0da |   mov SP, SP + -34
62 a0 00                       # a0de |   mov [SP], 0
60 20 a0                       # a0e1 |   mov A, SP
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
61 60 e0 02 ff                 # a0e4 |   mov C, [0xff02]
ac 80 60 e0 00 80              # a0e9 |   and D, C, 0x8000
e8 80 00 f8 f5 ff              # a0ef |   jeq D, 0, ${_BA_loop_3}:rel + PC
2c 60 e0 ff 00                 # a0f5 |   and C, 0xff
62 e0 60 00 ff                 # a0fa |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # a0ff |   jeq C, 0xa, ${_C_loop_3}:rel + PC
e8 60 1c f8 0d 29 00           # a106 |   jeq C, 0xd, ${_C_loop_3}:rel + PC
                               #      | _A_if_6:
f0 20 bc f8 1f 19 00           # a10d |   jlt A, SP + 0x1f, ${_E_if_6}:rel + PC
                               #      | _A_call_6:
e0 e0 7a a5                    # a114 |   push ${const__data_2}
5c f8 ff fe                    # a118 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a11c |   mov SP, SP + 0x2
                               #      | _Z_call_6:
e8 ff 00 f8 e7 00              # a120 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
62 20 60                       # a126 |   mov [A], C
44 20                          # a129 |   inc A
                               #      | _BZ_loop_3:
58 f8 b9 ff                    # a12b |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
                               #      | _A_call_7:
e0 1c 20                       # a12f |   push 0x20
e0 bc 02                       # a132 |   push SP + 0x2
5c f8 e5 00                    # a135 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a139 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
60 60 ff                       # a13d |   mov C, H
                               #      | _A_if_11:
e8 60 00 f8 0f 00              # a140 |   jeq C, 0, ${_E_if_11}:rel + PC
66 60 00                       # a146 |   bmov [C], 0
44 60                          # a149 |   inc C
58 f8 08 00                    # a14b |   jmp ${_C_if_11}:rel + PC
                               #      | _E_if_11:
60 60 1c ff                    # a14f |   mov C, -1
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _A_call_11:
e0 a0                          # a153 |   push SP
5c f8 e4 00                    # a155 |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # a159 |   mov SP, SP + 0x2
                               #      | _Z_call_11:
e8 ff 00 f8 b0 00              # a15d |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # a163 |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 00 fb                 # a167 |   mov [${var__g_num_args}], 0
                               #      | _A_while_1:
                               #      | _BA_while_1:
fc 60 bc f8 20 90 00           # a16c |   jge C, SP + 0x20, ${_C_while_1}:rel + PC
                               #      | _A_call_12:
e0 1c 20                       # a173 |   push 0x20
e0 60                          # a176 |   push C
5c f8 a2 00                    # a178 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # a17c |   mov SP, SP + 0x4
                               #      | _Z_call_12:
60 80 ff                       # a180 |   mov D, H
                               #      | _A_if_21:
e8 80 00 f8 0d 00              # a183 |   jeq D, 0, ${_E_if_21}:rel + PC
66 80 00                       # a189 |   bmov [D], 0
58 f8 08 00                    # a18c |   jmp ${_C_if_21}:rel + PC
                               #      | _E_if_21:
60 80 1c fe                    # a190 |   mov D, -2
                               #      | _C_if_21:
                               #      | _Z_if_21:
61 20 e0 00 fb                 # a194 |   mov A, [${var__g_num_args}]
                               #      | _A_if_22:
f0 20 1c f8 04 17 00           # a199 |   jlt A, 0x4, ${_E_if_22}:rel + PC
                               #      | _A_call_13:
e0 e0 95 a5                    # a1a0 |   push ${const__str__TOO_MANY_ARGS__endl}
5c f8 73 fe                    # a1a4 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a1a8 |   mov SP, SP + 0x2
                               #      | _Z_call_13:
58 f8 5b 00                    # a1ac |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_22:
                               #      | _C_if_22:
                               #      | _Z_if_22:
                               #      | _A_call_15:
e0 60                          # a1b0 |   push C
5c f8 1c 01                    # a1b2 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # a1b6 |   mov SP, SP + 0x2
                               #      | _Z_call_15:
                               #      | _A_if_31:
ec fe 00 f8 18 00              # a1ba |   jne G, 0, ${_E_if_31}:rel + PC
                               #      | _A_call_27:
e0 20                          # a1c0 |   push A
e0 e0 a4 a5                    # a1c2 |   push ${const__data_3}
5c f8 93 01                    # a1c6 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # a1ca |   mov SP, SP + 0x4
                               #      | _Z_call_27:
58 f8 39 00                    # a1ce |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_31:
                               #      | _C_if_31:
                               #      | _Z_if_31:
a8 40 20 1c 01                 # a1d2 |   shl B, A, 0x1
62 e8 ff 02 fb                 # a1d7 |   mov [${var__g_args} + B], H
                               #      | _A_call_28:
e2 e8 02 fb                    # a1dc |   push [${var__g_args} + B]
e2 e0 00 fb                    # a1e0 |   push [${var__g_num_args}]
e0 e0 b4 a5                    # a1e4 |   push ${const__data_4}
5c f8 71 01                    # a1e8 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a1ec |   mov SP, SP + 0x6
                               #      | _Z_call_28:
c6 e0 20 00 fb                 # a1f0 |   inc [${var__g_num_args}], A
c4 60 80                       # a1f5 |   inc C, D
                               #      | _BZ_while_1:
58 f8 74 ff                    # a1f8 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
c4 fe 00                       # a1fc |   inc G, 0
61 ff bc 22                    # a1ff |   mov H, [SP + 0x22]
58 f8 0a 00                    # a203 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # a207 |   mov G, 0
60 ff 00                       # a20a |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # a20d |   mov SP, SP + 0x24
e4 20                          # a211 |   pop A
e4 40                          # a213 |   pop B
e4 60                          # a215 |   pop C
e4 80                          # a217 |   pop D
dc                             # a219 |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # a21a |   mov H, [SP + 0x2]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
65 fe ff                       # a21e |   bmov G, [H]
e9 fe bc f8 04 17 00           # a221 |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_10:
ec fe 00 f8 0a 00              # a228 |   jne G, 0, ${_E_if_10}:rel + PC
60 ff 00                       # a22e |   mov H, 0
dc                             # a231 |   ret
                               #      | _E_if_10:
                               #      | _C_if_10:
                               #      | _Z_if_10:
44 ff                          # a232 |   inc H
                               #      | _BZ_loop_4:
58 f8 ea ff                    # a234 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_strchr:
dc                             # a238 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # a239 |   push A
61 20 bc 04                    # a23b |   mov A, [SP + 0x4]
                               #      | _A_call_8:
e0 e0 85 a5                    # a23f |   push ${const__str__PING}
e0 20                          # a243 |   push A
5c f8 53 00                    # a245 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a249 |   mov SP, SP + 0x4
                               #      | _Z_call_8:
                               #      | _A_if_15:
ec ff 00 f8 0d 00              # a24d |   jne H, 0, ${_E_if_15}:rel + PC
c4 ff 00                       # a253 |   inc H, 0
58 f8 3f 00                    # a256 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_15:
                               #      | _C_if_15:
                               #      | _Z_if_15:
                               #      | _A_call_9:
e0 e0 8a a5                    # a25a |   push ${const__str__READ}
e0 20                          # a25e |   push A
5c f8 38 00                    # a260 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a264 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_if_17:
ec ff 00 f8 0e 00              # a268 |   jne H, 0, ${_E_if_17}:rel + PC
60 ff 1c 02                    # a26e |   mov H, 0x2
58 f8 23 00                    # a272 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _A_call_10:
e0 e0 8f a5                    # a276 |   push ${const__str__WRITE}
e0 20                          # a27a |   push A
5c f8 1c 00                    # a27c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # a280 |   mov SP, SP + 0x4
                               #      | _Z_call_10:
                               #      | _A_if_19:
ec ff 00 f8 0e 00              # a284 |   jne H, 0, ${_E_if_19}:rel + PC
60 ff 1c 03                    # a28a |   mov H, 0x3
58 f8 07 00                    # a28e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_19:
                               #      | _C_if_19:
                               #      | _Z_if_19:
60 ff 00                       # a292 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # a295 |   pop A
dc                             # a297 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # a298 |   push A
61 fc bc 04                    # a29a |   mov E, [SP + 0x4]
61 fd bc 06                    # a29e |   mov F, [SP + 0x6]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
65 fe fc                       # a2a2 |   bmov G, [E]
65 ff fd                       # a2a5 |   bmov H, [F]
60 20 fe                       # a2a8 |   mov A, G
30 fe 1c 20                    # a2ab |   or G, 0x20
30 ff 1c 20                    # a2af |   or H, 0x20
84 ff fe ff                    # a2b3 |   sub H, G, H
ec ff 00 f8 14 00              # a2b7 |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # a2bd |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # a2c3 |   inc E
44 fd                          # a2c5 |   inc F
                               #      | _BZ_loop_5:
58 f8 db ff                    # a2c7 |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # a2cb |   pop A
dc                             # a2cd |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # a2ce |   push B
e0 20                          # a2d0 |   push A
60 20 00                       # a2d2 |   mov A, 0
61 40 bc 06                    # a2d5 |   mov B, [SP + 0x6]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 ff 40                       # a2d9 |   bmov H, [B]
e8 ff 00 f8 23 00              # a2dc |   jeq H, 0, ${_C_loop_6}:rel + PC
                               #      | _A_call_14:
e0 ff                          # a2e2 |   push H
5c f8 3a 00                    # a2e4 |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # a2e8 |   mov SP, SP + 0x2
                               #      | _Z_call_14:
e8 fe 00 f8 2d 00              # a2ec |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # a2f2 |   shl A, 0x4
00 20 ff                       # a2f6 |   add A, H
44 40                          # a2f9 |   inc B
                               #      | _BZ_loop_6:
58 f8 de ff                    # a2fb |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
60 fe 00                       # a2ff |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # a302 |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # a306 |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # a30c |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # a313 |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # a316 |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # a319 |   pop A
e4 40                          # a31b |   pop B
dc                             # a31d |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # a31e |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # a324 |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # a32b |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # a332 |   sub H, G, 0x30
c4 fe 00                       # a337 |   inc G, 0
dc                             # a33a |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # a33b |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # a342 |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # a349 |   add H, G, -87
c4 fe 00                       # a34e |   inc G, 0
dc                             # a351 |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # a352 |   mov H, 0
60 fe 00                       # a355 |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # a358 |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # a359 |   push C
e0 40                          # a35b |   push B
e0 20                          # a35d |   push A
60 a0 bc ee                    # a35f |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # a363 |   mov B, SP + 0x1c
                               #      | _A_for_2:
61 20 bc 1a                    # a367 |   mov A, [SP + 0x1a]
                               #      | _BA_for_2:
65 60 20                       # a36b |   bmov C, [A]
e8 60 00 f8 db 00              # a36e |   jeq C, 0, ${_C_for_2}:rel + PC
                               #      |   # normal char
                               #      | _A_if_33:
e8 60 1c f8 25 15 00           # a374 |   jeq C, 0x25, ${_E_if_33}:rel + PC
                               #      | _A_call_16:
e0 60                          # a37b |   push C
5c f8 bc fc                    # a37d |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a381 |   mov SP, SP + 0x2
                               #      | _Z_call_16:
58 f8 be 00                    # a385 |   jmp ${_BZ_for_2}:rel + PC
                               #      | _E_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      |   # format specifier
44 20                          # a389 |   inc A
65 60 20                       # a38b |   bmov C, [A]
                               #      | _A_if_34:
ec 60 00 f8 0e 00              # a38e |   jne C, 0, ${_E_if_34}:rel + PC
58 f8 b5 00                    # a394 |   jmp ${_C_for_2}:rel + PC
58 f8 a7 00                    # a398 |   jmp ${_C_if_34}:rel + PC
                               #      | _E_if_34:
ec 60 1c f8 25 1a 00           # a39c |   jne C, 0x25, ${_E2_if_34}:rel + PC
                               #      | _A_call_17:
e0 1c 25                       # a3a3 |   push 0x25
5c f8 93 fc                    # a3a6 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a3aa |   mov SP, SP + 0x2
                               #      | _Z_call_17:
58 f8 95 00                    # a3ae |   jmp ${_BZ_for_2}:rel + PC
58 f8 8d 00                    # a3b2 |   jmp ${_C_if_34}:rel + PC
                               #      | _E2_if_34:
ec 60 1c f8 64 21 00           # a3b6 |   jne C, 0x64, ${_E3_if_34}:rel + PC
                               #      | _A_call_18:
e0 a0                          # a3bd |   push SP
e2 40                          # a3bf |   push [B]
5c f8 93 00                    # a3c1 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # a3c5 |   mov SP, SP + 0x4
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 a0                          # a3c9 |   push SP
5c f8 4c fc                    # a3cb |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a3cf |   mov SP, SP + 0x2
                               #      | _Z_call_19:
58 f8 6c 00                    # a3d3 |   jmp ${_C_if_34}:rel + PC
                               #      | _E3_if_34:
ec 60 1c f8 78 21 00           # a3d7 |   jne C, 0x78, ${_E4_if_34}:rel + PC
                               #      | _A_call_21:
e0 a0                          # a3de |   push SP
e2 40                          # a3e0 |   push [B]
5c f8 bf 00                    # a3e2 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # a3e6 |   mov SP, SP + 0x4
                               #      | _Z_call_21:
                               #      | _A_call_22:
e0 a0                          # a3ea |   push SP
5c f8 2b fc                    # a3ec |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a3f0 |   mov SP, SP + 0x2
                               #      | _Z_call_22:
58 f8 4b 00                    # a3f4 |   jmp ${_C_if_34}:rel + PC
                               #      | _E4_if_34:
ec 60 1c f8 62 21 00           # a3f8 |   jne C, 0x62, ${_E5_if_34}:rel + PC
                               #      | _A_call_23:
e0 a0                          # a3ff |   push SP
e2 40                          # a401 |   push [B]
5c f8 f4 00                    # a403 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # a407 |   mov SP, SP + 0x4
                               #      | _Z_call_23:
                               #      | _A_call_24:
e0 a0                          # a40b |   push SP
5c f8 0a fc                    # a40d |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a411 |   mov SP, SP + 0x2
                               #      | _Z_call_24:
58 f8 2a 00                    # a415 |   jmp ${_C_if_34}:rel + PC
                               #      | _E5_if_34:
ec 60 1c f8 73 15 00           # a419 |   jne C, 0x73, ${_E6_if_34}:rel + PC
                               #      | _A_call_25:
e2 40                          # a420 |   push [B]
5c f8 f5 fb                    # a422 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a426 |   mov SP, SP + 0x2
                               #      | _Z_call_25:
58 f8 15 00                    # a42a |   jmp ${_C_if_34}:rel + PC
                               #      | _E6_if_34:
ec 60 1c f8 63 11 00           # a42e |   jne C, 0x63, ${_E7_if_34}:rel + PC
                               #      | _A_call_26:
e2 40                          # a435 |   push [B]
5c f8 02 fc                    # a437 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a43b |   mov SP, SP + 0x2
                               #      | _Z_call_26:
                               #      | _E7_if_34:
                               #      | _C_if_34:
                               #      | _Z_if_34:
60 40 5c 02                    # a43f |   mov B, B + 0x2
                               #      | _BZ_for_2:
44 20                          # a443 |   inc A
58 f8 26 ff                    # a445 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # a449 |   mov SP, SP + 0x12
e4 20                          # a44d |   pop A
e4 40                          # a44f |   pop B
e4 60                          # a451 |   pop C
dc                             # a453 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # a454 |   push C
e0 40                          # a456 |   push B
e0 20                          # a458 |   push A
61 20 bc 0a                    # a45a |   mov A, [SP + 0xa]
62 20 1c 30                    # a45e |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # a462 |   mov B, [SP + 0x8]
                               #      | _A_while_2:
                               #      | _BA_while_2:
e8 40 00 f8 19 00              # a466 |   jeq B, 0, ${_C_while_2}:rel + PC
90 60 40 1c 0a                 # a46c |   div C, B, 0xa
82 20 ff 1c 30                 # a471 |   add [A], H, 0x30
44 20                          # a476 |   inc A
60 40 60                       # a478 |   mov B, C
                               #      | _BZ_while_2:
58 f8 eb ff                    # a47b |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      |   # reverse the string
61 60 bc 0a                    # a47f |   mov C, [SP + 0xa]
                               #      | _A_while_3:
                               #      | _BA_while_3:
fc 60 20 f8 17 00              # a483 |   jge C, A, ${_C_while_3}:rel + PC
48 20                          # a489 |   dec A
61 40 60                       # a48b |   mov B, [C]
67 60 20                       # a48e |   bmov [C], [A]
66 20 40                       # a491 |   bmov [A], B
44 60                          # a494 |   inc C
                               #      | _BZ_while_3:
58 f8 ed ff                    # a496 |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # a49a |   pop A
e4 40                          # a49c |   pop B
e4 60                          # a49e |   pop C
dc                             # a4a0 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # a4a1 |   push C
e0 40                          # a4a3 |   push B
e0 20                          # a4a5 |   push A
61 40 bc 08                    # a4a7 |   mov B, [SP + 0x8]
61 60 bc 0a                    # a4ab |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # a4af |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # a4b3 |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # a4ba |   shr H, B, A*4
2c ff 1c 0f                    # a4be |   and H, 0xf
                               #      | _A_call_20:
e0 ff                          # a4c2 |   push H
5c f8 1a 00                    # a4c4 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # a4c8 |   mov SP, SP + 0x2
                               #      | _Z_call_20:
62 60 ff                       # a4cc |   mov [C], H
44 60                          # a4cf |   inc C
                               #      | _BZ_for_3:
48 20                          # a4d1 |   dec A
58 f8 e0 ff                    # a4d3 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # a4d7 |   pop A
e4 40                          # a4d9 |   pop B
e4 60                          # a4db |   pop C
dc                             # a4dd |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_35:
fa bc 1c f8 02 09 12 00        # a4de |   jgt [SP + 0x2], 0x9, ${_E_if_35}:rel + PC
81 ff bc 1c 02 30              # a4e6 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # a4ec |   jmp ${_C_if_35}:rel + PC
                               #      | _E_if_35:
81 ff bc 1c 02 57              # a4f0 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_35:
                               #      | _Z_if_35:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # a4f6 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # a4f7 |   push C
e0 40                          # a4f9 |   push B
e0 20                          # a4fb |   push A
61 40 bc 08                    # a4fd |   mov B, [SP + 0x8]
61 60 bc 0a                    # a501 |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # a505 |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # a509 |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # a510 |   shr H, B, A
2c ff 1c 01                    # a514 |   and H, 0x1
82 60 ff 1c 30                 # a518 |   add [C], H, 0x30
44 60                          # a51d |   inc C
                               #      | _BZ_for_4:
48 20                          # a51f |   dec A
58 f8 e8 ff                    # a521 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # a525 |   pop A
e4 40                          # a527 |   pop B
e4 60                          # a529 |   pop C
dc                             # a52b |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # a52c |   .data str:"PONG\n"
                               #      | const__str__read__endl:
72 65 61 64 0a 00              # a532 |   .data str:"read\n"
                               #      | const__str__write__endl:
77 72 69 74 65 0a 00           # a538 |   .data str:"write\n"
                               #      | const__HANDLER_MAP:
0a a0 51 a0 5e a0              # a53f |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write]
                               #      | const__data_1:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 32 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 30 0a 52 45 41 44 59 0a 00 # a545 |   .data str:"Weeekly3006 - Hardware v1.2 - Bootloader v2.0\nREADY\n"
                               #      | const__data_2:
24 4f 56 45 52 46 4c 4f 57 0a 00 # a57a |   .data str:"$OVERFLOW\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # a585 |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # a58a |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # a58f |   .data str:"WRITE"
                               #      | const__str__TOO_MANY_ARGS__endl:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 0a 00 # a595 |   .data str:"TOO_MANY_ARGS\n"
                               #      | const__data_3:
49 4e 56 41 4c 49 44 5f 41 52 47 20 25 64 0a 00 # a5a4 |   .data str:"INVALID_ARG %d\n"
                               #      | const__data_4:
61 72 67 25 64 3d 25 78 0a 00  # a5b4 |   .data str:"arg%d=%x\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # a5be |   .data str:"UNKNOWN_COMMAND\n"
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
