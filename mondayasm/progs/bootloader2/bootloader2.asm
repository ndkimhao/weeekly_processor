                               #      | .config CODE_OFFSET 0xd000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | _A_if_102:
e8 c0 e0 f8 00 d0 1d 00        # d000 |   jeq PC, 0xd000, ${_E_if_102}:rel + PC
60 20 e0 ff 00                 # d008 |   mov A, 0xff
60 40 00                       # d00d |   mov B, 0
54 e0 e0 1c 00 d0 ff f9 02     # d010 |   mmap 0xd000, 0xf9ff, 0x2
58 e0 00 d0                    # d019 |   jmp 0xd000
                               #      | _E_if_102:
                               #      | _C_if_102:
                               #      | _Z_if_102:
54 e0 e0 1c 00 d0 ff f9 03     # d01d |   mmap 0xd000, 0xf9ff, 0x3
d4 1c 02                       # d026 |   umap 0x2
60 a0 e0 00 ff                 # d029 |   mov SP, 0xff00
                               #      | _A_call_183:
5c f8 4c 12                    # d02e |   call ${fn_main}:rel + PC
                               #      | _Z_call_183:
d8                             # d032 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 80                          # d033 |   push D
e0 60                          # d035 |   push C
e0 40                          # d037 |   push B
e0 20                          # d039 |   push A
60 a0 bc ee                    # d03b |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1e                    # d03f |   mov B, SP + 0x1e
                               #      | _A_for_1:
61 20 bc 1c                    # d043 |   mov A, [SP + 0x1c]
                               #      | _BA_for_1:
65 60 20                       # d047 |   bmov C, [A]
e8 60 00 f8 45 01              # d04a |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # d050 |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # d057 |   push C
5c f8 43 01                    # d059 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # d05d |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 28 01                    # d061 |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # d065 |   inc A
65 60 20                       # d067 |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # d06a |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 1f 01                    # d070 |   jmp ${_C_for_1}:rel + PC
58 f8 11 01                    # d074 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 25 1a 00           # d078 |   jne C, 0x25, ${_E2_if_4}:rel + PC
                               #      | _A_call_2:
e0 1c 25                       # d07f |   push 0x25
5c f8 1a 01                    # d082 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # d086 |   mov SP, SP + 0x2
                               #      | _Z_call_2:
58 f8 ff 00                    # d08a |   jmp ${_BZ_for_1}:rel + PC
58 f8 f7 00                    # d08e |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 64 21 00           # d092 |   jne C, 0x64, ${_E3_if_4}:rel + PC
                               #      | _A_call_3:
e0 a0                          # d099 |   push SP
e2 40                          # d09b |   push [B]
5c f8 17 01                    # d09d |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # d0a1 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 a0                          # d0a5 |   push SP
5c f8 5a 01                    # d0a7 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # d0ab |   mov SP, SP + 0x2
                               #      | _Z_call_5:
58 f8 d6 00                    # d0af |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 78 21 00           # d0b3 |   jne C, 0x78, ${_E4_if_4}:rel + PC
                               #      | _A_call_7:
e0 a0                          # d0ba |   push SP
e2 40                          # d0bc |   push [B]
5c f8 65 01                    # d0be |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # d0c2 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 a0                          # d0c6 |   push SP
5c f8 39 01                    # d0c8 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # d0cc |   mov SP, SP + 0x2
                               #      | _Z_call_8:
58 f8 b5 00                    # d0d0 |   jmp ${_C_if_4}:rel + PC
                               #      | _E4_if_4:
ec 60 1c f8 71 26 00           # d0d4 |   jne C, 0x71, ${_E5_if_4}:rel + PC
95 80 40 1c 08                 # d0db |   ror D, [B], 0x8
                               #      | _A_call_9:
e0 a0                          # d0e0 |   push SP
e0 80                          # d0e2 |   push D
5c f8 3f 01                    # d0e4 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # d0e8 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 a0                          # d0ec |   push SP
5c f8 13 01                    # d0ee |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # d0f2 |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 8f 00                    # d0f6 |   jmp ${_C_if_4}:rel + PC
                               #      | _E5_if_4:
ec 60 1c f8 68 22 00           # d0fa |   jne C, 0x68, ${_E6_if_4}:rel + PC
                               #      | _A_call_11:
e0 a0                          # d101 |   push SP
e2 40                          # d103 |   push [B]
5c f8 1e 01                    # d105 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # d109 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 bc 02                       # d10d |   push SP + 0x2
5c f8 f1 00                    # d110 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # d114 |   mov SP, SP + 0x2
                               #      | _Z_call_12:
58 f8 6d 00                    # d118 |   jmp ${_C_if_4}:rel + PC
                               #      | _E6_if_4:
ec 60 1c f8 62 21 00           # d11c |   jne C, 0x62, ${_E7_if_4}:rel + PC
                               #      | _A_call_13:
e0 a0                          # d123 |   push SP
e2 40                          # d125 |   push [B]
5c f8 52 01                    # d127 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # d12b |   mov SP, SP + 0x4
                               #      | _Z_call_13:
                               #      | _A_call_14:
e0 a0                          # d12f |   push SP
5c f8 d0 00                    # d131 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # d135 |   mov SP, SP + 0x2
                               #      | _Z_call_14:
58 f8 4c 00                    # d139 |   jmp ${_C_if_4}:rel + PC
                               #      | _E7_if_4:
ec 60 1c f8 7a 22 00           # d13d |   jne C, 0x7a, ${_E8_if_4}:rel + PC
                               #      | _A_call_15:
e0 a0                          # d144 |   push SP
e2 40                          # d146 |   push [B]
5c f8 31 01                    # d148 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # d14c |   mov SP, SP + 0x4
                               #      | _Z_call_15:
                               #      | _A_call_16:
e0 bc 08                       # d150 |   push SP + 0x8
5c f8 ae 00                    # d153 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # d157 |   mov SP, SP + 0x2
                               #      | _Z_call_16:
58 f8 2a 00                    # d15b |   jmp ${_C_if_4}:rel + PC
                               #      | _E8_if_4:
ec 60 1c f8 73 15 00           # d15f |   jne C, 0x73, ${_E9_if_4}:rel + PC
                               #      | _A_call_17:
e2 40                          # d166 |   push [B]
5c f8 99 00                    # d168 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # d16c |   mov SP, SP + 0x2
                               #      | _Z_call_17:
58 f8 15 00                    # d170 |   jmp ${_C_if_4}:rel + PC
                               #      | _E9_if_4:
ec 60 1c f8 63 11 00           # d174 |   jne C, 0x63, ${_E10_if_4}:rel + PC
                               #      | _A_call_18:
e2 40                          # d17b |   push [B]
5c f8 1f 00                    # d17d |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # d181 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
                               #      | _E10_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
60 40 5c 02                    # d185 |   mov B, B + 0x2
                               #      | _BZ_for_1:
44 20                          # d189 |   inc A
58 f8 bc fe                    # d18b |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # d18f |   mov SP, SP + 0x12
e4 20                          # d193 |   pop A
e4 40                          # d195 |   pop B
e4 60                          # d197 |   pop C
e4 80                          # d199 |   pop D
dc                             # d19b |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # d19c |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # d1a3 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # d1a9 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # d1ad |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # d1b3 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # d1b4 |   push C
e0 40                          # d1b6 |   push B
e0 20                          # d1b8 |   push A
61 20 bc 0a                    # d1ba |   mov A, [SP + 0xa]
62 20 1c 30                    # d1be |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # d1c2 |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # d1c6 |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # d1cc |   div C, B, 0xa
82 20 ff 1c 30                 # d1d1 |   add [A], H, 0x30
44 20                          # d1d6 |   inc A
60 40 60                       # d1d8 |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # d1db |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # d1df |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # d1e3 |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # d1e9 |   dec A
61 40 60                       # d1eb |   mov B, [C]
67 60 20                       # d1ee |   bmov [C], [A]
66 20 40                       # d1f1 |   bmov [A], B
44 60                          # d1f4 |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # d1f6 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # d1fa |   pop A
e4 40                          # d1fc |   pop B
e4 60                          # d1fe |   pop C
dc                             # d200 |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # d201 |   push A
                               #      | _A_for_2:
61 20 bc 04                    # d203 |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # d207 |   bmov H, [A]
e8 ff 00 f8 16 00              # d20a |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_4:
e0 ff                          # d210 |   push H
5c f8 8a ff                    # d212 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # d216 |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # d21a |   inc A
58 f8 eb ff                    # d21c |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # d220 |   pop A
dc                             # d222 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # d223 |   push C
e0 40                          # d225 |   push B
e0 20                          # d227 |   push A
61 40 bc 08                    # d229 |   mov B, [SP + 0x8]
61 60 bc 0a                    # d22d |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # d231 |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # d235 |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # d23c |   shr H, B, A*4
2c ff 1c 0f                    # d240 |   and H, 0xf
                               #      | _A_call_6:
e0 ff                          # d244 |   push H
5c f8 1a 00                    # d246 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # d24a |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 60 ff                       # d24e |   mov [C], H
44 60                          # d251 |   inc C
                               #      | _BZ_for_3:
48 20                          # d253 |   dec A
58 f8 e0 ff                    # d255 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # d259 |   pop A
e4 40                          # d25b |   pop B
e4 60                          # d25d |   pop C
dc                             # d25f |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_6:
fa bc 1c f8 02 09 12 00        # d260 |   jgt [SP + 0x2], 0x9, ${_E_if_6}:rel + PC
81 ff bc 1c 02 30              # d268 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # d26e |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
81 ff bc 1c 02 57              # d272 |   add H, [SP + 0x2], 0x57
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # d278 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # d279 |   push C
e0 40                          # d27b |   push B
e0 20                          # d27d |   push A
61 40 bc 08                    # d27f |   mov B, [SP + 0x8]
61 60 bc 0a                    # d283 |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # d287 |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # d28b |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # d292 |   shr H, B, A
2c ff 1c 01                    # d296 |   and H, 0x1
82 60 ff 1c 30                 # d29a |   add [C], H, 0x30
44 60                          # d29f |   inc C
                               #      | _BZ_for_4:
48 20                          # d2a1 |   dec A
58 f8 e8 ff                    # d2a3 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # d2a7 |   pop A
e4 40                          # d2a9 |   pop B
e4 60                          # d2ab |   pop C
dc                             # d2ad |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_getc:
                               #      | _begin_fn_getc:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 02 ff                 # d2ae |   mov H, [0xff02]
ac fe ff e0 00 80              # d2b3 |   and G, H, 0x8000
e8 fe 00 f8 f5 ff              # d2b9 |   jeq G, 0, ${_BA_loop_2}:rel + PC
2c ff e0 ff 00                 # d2bf |   and H, 0xff
58 f8 08 00                    # d2c4 |   jmp ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 e6 ff                    # d2c8 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_getc:
dc                             # d2cc |   ret
                               #      | _end_fn_getc:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # d2cd |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # d2d3 |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # d2da |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # d2e1 |   sub H, G, 0x30
c4 fe 00                       # d2e6 |   inc G, 0
dc                             # d2e9 |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # d2ea |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # d2f1 |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # d2f8 |   add H, G, -87
c4 fe 00                       # d2fd |   inc G, 0
dc                             # d300 |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # d301 |   mov H, 0
60 fe 00                       # d304 |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # d307 |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # d308 |   push B
e0 20                          # d30a |   push A
60 20 00                       # d30c |   mov A, 0
61 40 bc 06                    # d30f |   mov B, [SP + 0x6]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
65 ff 40                       # d313 |   bmov H, [B]
e8 ff 00 f8 23 00              # d316 |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_19:
e0 ff                          # d31c |   push H
5c f8 af ff                    # d31e |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # d322 |   mov SP, SP + 0x2
                               #      | _Z_call_19:
e8 fe 00 f8 2d 00              # d326 |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # d32c |   shl A, 0x4
00 20 ff                       # d330 |   add A, H
44 40                          # d333 |   inc B
                               #      | _BZ_loop_3:
58 f8 de ff                    # d335 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
60 fe 00                       # d339 |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # d33c |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # d340 |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # d346 |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # d34d |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # d350 |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # d353 |   pop A
e4 40                          # d355 |   pop B
dc                             # d357 |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # d358 |   push B
e0 20                          # d35a |   push A
65 fe bc 08                    # d35c |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # d360 |   shl H, G, 0x8
30 ff fe                       # d365 |   or H, G
61 20 bc 06                    # d368 |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # d36c |   add B, [SP + 0xa], A
                               #      | _A_while_3:
                               #      | _BA_while_3:
f8 3c 40 f8 02 12 00           # d371 |   jgt A + 0x2, B, ${_C_while_3}:rel + PC
62 20 ff                       # d378 |   mov [A], H
60 20 3c 02                    # d37b |   mov A, A + 0x2
                               #      | _BZ_while_3:
58 f8 f2 ff                    # d37f |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _A_if_16:
fc 20 40 f8 09 00              # d383 |   jge A, B, ${_E_if_16}:rel + PC
66 20 ff                       # d389 |   bmov [A], H
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _cleanup_fn_memset:
e4 20                          # d38c |   pop A
e4 40                          # d38e |   pop B
dc                             # d390 |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # d391 |   push C
e0 40                          # d393 |   push B
e0 20                          # d395 |   push A
61 20 bc 08                    # d397 |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # d39b |   add B, [SP + 0xc], A
61 60 bc 0a                    # d3a0 |   mov C, [SP + 0xa]
                               #      | _A_while_4:
                               #      | _BA_while_4:
f8 3c 40 f8 02 16 00           # d3a4 |   jgt A + 0x2, B, ${_C_while_4}:rel + PC
63 20 60                       # d3ab |   mov [A], [C]
60 20 3c 02                    # d3ae |   mov A, A + 0x2
60 60 7c 02                    # d3b2 |   mov C, C + 0x2
                               #      | _BZ_while_4:
58 f8 ee ff                    # d3b6 |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      | _A_if_17:
fc 20 40 f8 09 00              # d3ba |   jge A, B, ${_E_if_17}:rel + PC
67 20 60                       # d3c0 |   bmov [A], [C]
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _cleanup_fn_memcpy:
e4 20                          # d3c3 |   pop A
e4 40                          # d3c5 |   pop B
e4 60                          # d3c7 |   pop C
dc                             # d3c9 |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_strcmp:
                               #      | _begin_fn_strcmp:
61 fc bc 02                    # d3ca |   mov E, [SP + 0x2]
61 fd bc 04                    # d3ce |   mov F, [SP + 0x4]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
65 fe fc                       # d3d2 |   bmov G, [E]
65 ff fd                       # d3d5 |   bmov H, [F]
84 ff fe ff                    # d3d8 |   sub H, G, H
ec ff 00 f8 14 00              # d3dc |   jne H, 0, ${_cleanup_fn_strcmp}:rel + PC
e8 fe 00 f8 0e 00              # d3e2 |   jeq G, 0, ${_cleanup_fn_strcmp}:rel + PC
44 fc                          # d3e8 |   inc E
44 fd                          # d3ea |   inc F
                               #      | _BZ_loop_4:
58 f8 e6 ff                    # d3ec |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_strcmp:
dc                             # d3f0 |   ret
                               #      | _end_fn_strcmp:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # d3f1 |   push A
61 fc bc 04                    # d3f3 |   mov E, [SP + 0x4]
61 fd bc 06                    # d3f7 |   mov F, [SP + 0x6]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
65 fe fc                       # d3fb |   bmov G, [E]
65 ff fd                       # d3fe |   bmov H, [F]
60 20 fe                       # d401 |   mov A, G
                               #      | _A_scope_4:
                               #      | _B_scope_4:
f0 fe 1c f8 41 12 00           # d404 |   jlt G, 0x41, ${_C_scope_4}:rel + PC
f8 fe 1c f8 5a 0b 00           # d40b |   jgt G, 0x5a, ${_C_scope_4}:rel + PC
30 fe 1c 20                    # d412 |   or G, 0x20
                               #      | _C_scope_4:
                               #      | _Z_scope_4:
                               #      | _A_scope_5:
                               #      | _B_scope_5:
f0 ff 1c f8 41 12 00           # d416 |   jlt H, 0x41, ${_C_scope_5}:rel + PC
f8 ff 1c f8 5a 0b 00           # d41d |   jgt H, 0x5a, ${_C_scope_5}:rel + PC
30 ff 1c 20                    # d424 |   or H, 0x20
                               #      | _C_scope_5:
                               #      | _Z_scope_5:
84 ff fe ff                    # d428 |   sub H, G, H
ec ff 00 f8 14 00              # d42c |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # d432 |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # d438 |   inc E
44 fd                          # d43a |   inc F
                               #      | _BZ_loop_5:
58 f8 bf ff                    # d43c |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # d440 |   pop A
dc                             # d442 |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # d443 |   mov H, [SP + 0x2]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 fe ff                       # d447 |   bmov G, [H]
e9 fe bc f8 04 17 00           # d44a |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_28:
ec fe 00 f8 0a 00              # d451 |   jne G, 0, ${_E_if_28}:rel + PC
60 ff 00                       # d457 |   mov H, 0
dc                             # d45a |   ret
                               #      | _E_if_28:
                               #      | _C_if_28:
                               #      | _Z_if_28:
44 ff                          # d45b |   inc H
                               #      | _BZ_loop_6:
58 f8 ea ff                    # d45d |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _cleanup_fn_strchr:
dc                             # d461 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc 00 fa 02              # d462 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # d468 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
61 ff e0 00 fa                 # d469 |   mov H, [${var__rand__state}]
a8 fe ff 1c 07                 # d46e |   shl G, H, 0x7
34 ff fe                       # d473 |   xor H, G
a0 fe ff 1c 09                 # d476 |   shr G, H, 0x9
34 ff fe                       # d47b |   xor H, G
a8 fe ff 1c 08                 # d47e |   shl G, H, 0x8
34 ff fe                       # d483 |   xor H, G
62 e0 ff 00 fa                 # d486 |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # d48b |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # d48c |   push D
e0 60                          # d48e |   push C
e0 40                          # d490 |   push B
e0 20                          # d492 |   push A
61 40 e0 10 ff                 # d494 |   mov B, [0xff10]
61 60 e0 12 ff                 # d499 |   mov C, [0xff12]
61 80 e0 14 ff                 # d49e |   mov D, [0xff14]
61 20 bc 0e                    # d4a3 |   mov A, [SP + 0xe]
60 ff 00                       # d4a7 |   mov H, 0
                               #      | _A_if_29:
fc 28 20 f8 09 00              # d4aa |   jge A + B, A, ${_E_if_29}:rel + PC
c4 ff 00                       # d4b0 |   inc H, 0
                               #      | _E_if_29:
                               #      | _C_if_29:
                               #      | _Z_if_29:
60 40 44                       # d4b3 |   mov B, B + A
81 20 bc ff 0c                 # d4b6 |   add A, [SP + 0xc], H
60 ff 00                       # d4bb |   mov H, 0
                               #      | _A_scope_6:
                               #      | _B_scope_6:
f0 2c 20 f8 10 00              # d4be |   jlt A + C, A, ${_C_scope_6}:rel + PC
f0 20 ff f8 0a 00              # d4c4 |   jlt A, H, ${_C_scope_6}:rel + PC
58 f8 07 00                    # d4ca |   jmp ${_Z_scope_6}:rel + PC
                               #      | _C_scope_6:
c4 ff 00                       # d4ce |   inc H, 0
                               #      | _Z_scope_6:
60 60 64                       # d4d1 |   mov C, C + A
81 20 bc ff 0a                 # d4d4 |   add A, [SP + 0xa], H
60 80 84                       # d4d9 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # d4dc |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 10 ff                 # d4e0 |   mov H, [0xff10]
61 fe e0 12 ff                 # d4e5 |   mov G, [0xff12]
61 fc e0 14 ff                 # d4ea |   mov E, [0xff14]
                               #      | _A_if_32:
e8 fc 80 f8 10 00              # d4ef |   jeq E, D, ${_E_if_32}:rel + PC
f8 fc 80 f8 2c 00              # d4f5 |   jgt E, D, ${_C_loop_7}:rel + PC
58 f8 22 00                    # d4fb |   jmp ${_C_if_32}:rel + PC
                               #      | _E_if_32:
                               #      | _A_if_34:
e8 fe 60 f8 10 00              # d4ff |   jeq G, C, ${_E_if_34}:rel + PC
f8 fe 60 f8 1c 00              # d505 |   jgt G, C, ${_C_loop_7}:rel + PC
58 f8 12 00                    # d50b |   jmp ${_C_if_34}:rel + PC
                               #      | _E_if_34:
f8 ff 40 f8 12 00              # d50f |   jgt H, B, ${_C_loop_7}:rel + PC
                               #      | _A_if_37:
e8 20 00 f8 08 00              # d515 |   jeq A, 0, ${_E_if_37}:rel + PC
5c 20                          # d51b |   call A
                               #      | _E_if_37:
                               #      | _C_if_37:
                               #      | _Z_if_37:
                               #      | _C_if_34:
                               #      | _Z_if_34:
                               #      | _C_if_32:
                               #      | _Z_if_32:
                               #      | _BZ_loop_7:
58 f8 c3 ff                    # d51d |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # d521 |   pop A
e4 40                          # d523 |   pop B
e4 60                          # d525 |   pop C
e4 80                          # d527 |   pop D
dc                             # d529 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # d52a |   push D
e0 60                          # d52c |   push C
e0 40                          # d52e |   push B
e0 20                          # d530 |   push A
61 fc bc 0a                    # d532 |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # d536 |   shl F, [SP + 0xe], 0x1
00 fd fc                       # d53c |   add F, E
61 fe bc 0c                    # d53f |   mov G, [SP + 0xc]
61 40 fe                       # d543 |   mov B, [G]
60 60 1c 07                    # d546 |   mov C, 0x7
60 20 00                       # d54a |   mov A, 0
60 a0 bc fe                    # d54d |   mov SP, SP + -2
                               #      | _A_for_5:
                               #      | _BA_for_5:
fc fc fd f8 9e 00              # d551 |   jge E, F, ${_C_for_5}:rel + PC
                               #      |   # decode one line
60 20 00                       # d557 |   mov A, 0
62 a0 1c ff                    # d55a |   mov [SP], -1
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
                               #      | _A_if_38:
ec 60 1c f8 ff 10 00           # d55e |   jne C, -1, ${_E_if_38}:rel + PC
44 fe                          # d565 |   inc G
61 40 fe                       # d567 |   mov B, [G]
60 60 1c 07                    # d56a |   mov C, 0x7
                               #      | _E_if_38:
                               #      | _C_if_38:
                               #      | _Z_if_38:
98 80 40 60                    # d56e |   getb D, B, C
48 60                          # d572 |   dec C
40 80                          # d574 |   bool D
b0 20 21 80                    # d576 |   or A, A*2, D
4a a0                          # d57a |   dec [SP]
                               #      | _A_if_39:
ee a0 00 f8 1b 00              # d57c |   jne [SP], 0, ${_E_if_39}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # d582 |   mov H, A
b9 20 bc 12                    # d585 |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # d589 |   shr A, -1, A + 0x10
ae fc ff 20                    # d58f |   and [E], H, A
58 f8 54 00                    # d593 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_39:
ec 20 00 f8 20 00              # d597 |   jne A, 0, ${_E2_if_39}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # d59d |   sub H, E, 0x2
                               #      | _A_if_40:
f1 ff bc f8 0c 0e 00           # d5a2 |   jlt H, [SP + 0xc], ${_E_if_40}:rel + PC
63 fc ff                       # d5a9 |   mov [E], [H]
58 f8 07 00                    # d5ac |   jmp ${_C_if_40}:rel + PC
                               #      | _E_if_40:
62 fc 00                       # d5b0 |   mov [E], 0
                               #      | _C_if_40:
                               #      | _Z_if_40:
58 f8 34 00                    # d5b3 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E2_if_39:
ec 20 1c f8 02 13 00           # d5b7 |   jne A, 0x2, ${_E3_if_39}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # d5be |   sub H, E, 0x4
63 fc ff                       # d5c3 |   mov [E], [H]
58 f8 21 00                    # d5c6 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E3_if_39:
ec 20 1c f8 06 0e 00           # d5ca |   jne A, 0x6, ${_E4_if_39}:rel + PC
                               #      |   # all zeros
62 fc 00                       # d5d1 |   mov [E], 0
58 f8 13 00                    # d5d4 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E4_if_39:
ec 20 1c f8 07 0b 00           # d5d8 |   jne A, 0x7, ${_E5_if_39}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # d5df |   mov [SP], [SP + 0x12]
                               #      | _E5_if_39:
                               #      | _C_if_39:
                               #      | _Z_if_39:
                               #      | _BZ_loop_8:
58 f8 7b ff                    # d5e3 |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _BZ_for_5:
00 fc 1c 02                    # d5e7 |   add E, 0x2
58 f8 66 ff                    # d5eb |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # d5ef |   mov SP, SP + 0x2
e4 20                          # d5f3 |   pop A
e4 40                          # d5f5 |   pop B
e4 60                          # d5f7 |   pop C
e4 80                          # d5f9 |   pop D
dc                             # d5fb |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # d5fc |   push B
e0 20                          # d5fe |   push A
61 20 bc 08                    # d600 |   mov A, [SP + 0x8]
60 40 1c 1f                    # d604 |   mov B, 0x1f
                               #      | _A_scope_7:
                               #      | _B_scope_7:
f0 20 1c f8 20 13 00           # d608 |   jlt A, 0x20, ${_C_scope_7}:rel + PC
fc 20 e0 f8 80 00 0c 00        # d60f |   jge A, 0x80, ${_C_scope_7}:rel + PC
60 40 3c e0                    # d617 |   mov B, A + -32
                               #      | _C_scope_7:
                               #      | _Z_scope_7:
28 40 1c 01                    # d61b |   shl B, 0x1
61 40 e8 4e ed                 # d61f |   mov B, [${const__FONT_16_12_INDEX} + B]
                               #      | _A_call_20:
e0 1c 0c                       # d624 |   push 0xc
e0 1c 10                       # d627 |   push 0x10
e0 e8 59 e9                    # d62a |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # d62e |   push [SP + 0xc]
5c f8 f9 fe                    # d631 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # d635 |   mov SP, SP + 0x8
                               #      | _Z_call_20:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # d639 |   pop A
e4 40                          # d63b |   pop B
dc                             # d63d |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_read_sd:
                               #      | _begin_fn_read_sd:
e0 80                          # d63e |   push D
e0 60                          # d640 |   push C
e0 40                          # d642 |   push B
e0 20                          # d644 |   push A
                               #      | _A_call_21:
e0 fc                          # d646 |   push E
e0 fd                          # d648 |   push F
e2 bc 14                       # d64a |   push [SP + 0x14]
e2 bc 14                       # d64d |   push [SP + 0x14]
e0 00                          # d650 |   push 0
5c f8 ab 00                    # d652 |   call ${fn_send_sd_cmd}:rel + PC
60 a0 bc 06                    # d656 |   mov SP, SP + 0x6
e4 fd                          # d65a |   pop F
e4 fc                          # d65c |   pop E
                               #      | _Z_call_21:
e8 fe 00 f8 90 00              # d65e |   jeq G, 0, ${_L_fn_read_sd_1}:rel + PC
61 fc bc 0a                    # d664 |   mov E, [SP + 0xa]
60 fd 00                       # d668 |   mov F, 0
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc fd e0 f8 00 02 75 00        # d66b |   jge F, 0x200, ${_C_while_5}:rel + PC
44 80                          # d673 |   inc D
e8 80 1c f8 ff 79 00           # d675 |   jeq D, -1, ${_L_fn_read_sd_1}:rel + PC
61 60 e0 26 ff                 # d67c |   mov C, [0xff26]
98 20 60 1c 09                 # d681 |   getb A, C, 0x9
e8 20 00 f8 5a 00              # d686 |   jeq A, 0, ${_C_while_5}:rel + PC
98 20 60 1c 08                 # d68c |   getb A, C, 0x8
e8 20 00 f8 da ff              # d691 |   jeq A, 0, ${_BA_while_5}:rel + PC
1e e0 1c 24 ff 08              # d697 |   setb [0xff24], 0x8
                               #      | _A_for_7:
60 80 00                       # d69d |   mov D, 0
                               #      | _BA_for_7:
fc 80 1c f8 ff 1a 00           # d6a0 |   jge D, -1, ${_C_for_7}:rel + PC
99 40 e0 1c 26 ff 08           # d6a7 |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # d6ae |   jeq B, 0, ${_C_for_7}:rel + PC
                               #      | _BZ_for_7:
44 80                          # d6b4 |   inc D
58 f8 ea ff                    # d6b6 |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
ec 40 00 f8 34 00              # d6ba |   jne B, 0, ${_L_fn_read_sd_1}:rel + PC
1e e0 1c 24 ff 18              # d6c0 |   setb [0xff24], 0x18
2c 60 e0 ff 00                 # d6c6 |   and C, 0xff
                               #      | _A_if_52:
fd fd bc f8 0c 0c 00           # d6cb |   jge F, [SP + 0xc], ${_E_if_52}:rel + PC
62 fc 60                       # d6d2 |   mov [E], C
44 fc                          # d6d5 |   inc E
                               #      | _E_if_52:
                               #      | _C_if_52:
                               #      | _Z_if_52:
44 fd                          # d6d7 |   inc F
60 80 00                       # d6d9 |   mov D, 0
                               #      | _BZ_while_5:
58 f8 8f ff                    # d6dc |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
c4 fe 00                       # d6e0 |   inc G, 0
b9 ff bc 0a                    # d6e3 |   neg H, [SP + 0xa]
00 ff fc                       # d6e7 |   add H, E
58 f8 0a 00                    # d6ea |   jmp ${_cleanup_fn_read_sd}:rel + PC
                               #      | _L_fn_read_sd_1:
60 fe 00                       # d6ee |   mov G, 0
60 ff 00                       # d6f1 |   mov H, 0
                               #      | _cleanup_fn_read_sd:
e4 20                          # d6f4 |   pop A
e4 40                          # d6f6 |   pop B
e4 60                          # d6f8 |   pop C
e4 80                          # d6fa |   pop D
dc                             # d6fc |   ret
                               #      | _end_fn_read_sd:
                               #      | 
                               #      | fn_send_sd_cmd:
                               #      | _begin_fn_send_sd_cmd:
e0 80                          # d6fd |   push D
e0 40                          # d6ff |   push B
e0 20                          # d701 |   push A
60 20 1c 09                    # d703 |   mov A, 0x9
                               #      | _A_if_43:
ee bc 1c f8 08 01 0c 00        # d707 |   jne [SP + 0x8], 0x1, ${_E_if_43}:rel + PC
60 20 1c 0a                    # d70f |   mov A, 0xa
                               #      | _E_if_43:
                               #      | _C_if_43:
                               #      | _Z_if_43:
63 e0 bc 22 ff 0a              # d713 |   mov [0xff22], [SP + 0xa]
63 e0 bc 20 ff 0c              # d719 |   mov [0xff20], [SP + 0xc]
1e e0 20 24 ff                 # d71f |   setb [0xff24], A
                               #      | _A_for_6:
60 80 00                       # d724 |   mov D, 0
                               #      | _BA_for_6:
fc 80 1c f8 ff 1a 00           # d727 |   jge D, -1, ${_C_for_6}:rel + PC
99 40 e0 1c 26 ff 09           # d72e |   getb B, [0xff26], 0x9
ec 40 00 f8 0c 00              # d735 |   jne B, 0, ${_C_for_6}:rel + PC
                               #      | _BZ_for_6:
44 80                          # d73b |   inc D
58 f8 ea ff                    # d73d |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
60 20 3c 10                    # d741 |   mov A, A + 0x10
1e e0 20 24 ff                 # d745 |   setb [0xff24], A
c4 fe 00                       # d74a |   inc G, 0
                               #      | _A_if_45:
ec 40 00 f8 09 00              # d74d |   jne B, 0, ${_E_if_45}:rel + PC
60 fe 00                       # d753 |   mov G, 0
                               #      | _E_if_45:
                               #      | _C_if_45:
                               #      | _Z_if_45:
                               #      | _cleanup_fn_send_sd_cmd:
e4 20                          # d756 |   pop A
e4 40                          # d758 |   pop B
e4 80                          # d75a |   pop D
dc                             # d75c |   ret
                               #      | _end_fn_send_sd_cmd:
                               #      | 
                               #      | fn_write_sd:
                               #      | _begin_fn_write_sd:
e0 80                          # d75d |   push D
e0 60                          # d75f |   push C
e0 40                          # d761 |   push B
e0 20                          # d763 |   push A
                               #      | _A_call_22:
e0 fc                          # d765 |   push E
e0 fd                          # d767 |   push F
e2 bc 14                       # d769 |   push [SP + 0x14]
e2 bc 14                       # d76c |   push [SP + 0x14]
e0 1c 01                       # d76f |   push 0x1
5c f8 8b ff                    # d772 |   call ${fn_send_sd_cmd}:rel + PC
60 a0 bc 06                    # d776 |   mov SP, SP + 0x6
e4 fd                          # d77a |   pop F
e4 fc                          # d77c |   pop E
                               #      | _Z_call_22:
e8 fe 00 f8 8f 00              # d77e |   jeq G, 0, ${_L_fn_write_sd_1}:rel + PC
61 fc bc 0a                    # d784 |   mov E, [SP + 0xa]
60 fd 00                       # d788 |   mov F, 0
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc fd e0 f8 00 02 7b 00        # d78b |   jge F, 0x200, ${_C_while_6}:rel + PC
44 80                          # d793 |   inc D
e8 80 1c f8 ff 78 00           # d795 |   jeq D, -1, ${_L_fn_write_sd_1}:rel + PC
61 60 e0 26 ff                 # d79c |   mov C, [0xff26]
98 20 60 1c 09                 # d7a1 |   getb A, C, 0x9
e8 20 00 f8 60 00              # d7a6 |   jeq A, 0, ${_C_while_6}:rel + PC
98 20 60 1c 08                 # d7ac |   getb A, C, 0x8
e8 20 00 f8 da ff              # d7b1 |   jeq A, 0, ${_BA_while_6}:rel + PC
60 60 00                       # d7b7 |   mov C, 0
                               #      | _A_if_57:
fd fd bc f8 0c 0c 00           # d7ba |   jge F, [SP + 0xc], ${_E_if_57}:rel + PC
65 60 fc                       # d7c1 |   bmov C, [E]
44 fc                          # d7c4 |   inc E
                               #      | _E_if_57:
                               #      | _C_if_57:
                               #      | _Z_if_57:
ad 20 e0 e0 24 ff 00 fe        # d7c6 |   and A, [0xff24], 0xfe00
9e e0 2c 1c 24 ff 08           # d7ce |   setb [0xff24], A + C, 0x8
                               #      | _A_for_8:
60 80 00                       # d7d5 |   mov D, 0
                               #      | _BA_for_8:
fc 80 1c f8 ff 1a 00           # d7d8 |   jge D, -1, ${_C_for_8}:rel + PC
99 40 e0 1c 26 ff 08           # d7df |   getb B, [0xff26], 0x8
e8 40 00 f8 0c 00              # d7e6 |   jeq B, 0, ${_C_for_8}:rel + PC
                               #      | _BZ_for_8:
44 80                          # d7ec |   inc D
58 f8 ea ff                    # d7ee |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
ec 40 00 f8 1b 00              # d7f2 |   jne B, 0, ${_L_fn_write_sd_1}:rel + PC
62 e0 20 24 ff                 # d7f8 |   mov [0xff24], A
44 fd                          # d7fd |   inc F
60 80 00                       # d7ff |   mov D, 0
                               #      | _BZ_while_6:
58 f8 89 ff                    # d802 |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
c4 fe 00                       # d806 |   inc G, 0
58 f8 07 00                    # d809 |   jmp ${_cleanup_fn_write_sd}:rel + PC
                               #      | _L_fn_write_sd_1:
60 fe 00                       # d80d |   mov G, 0
                               #      | _cleanup_fn_write_sd:
e4 20                          # d810 |   pop A
e4 40                          # d812 |   pop B
e4 60                          # d814 |   pop C
e4 80                          # d816 |   pop D
dc                             # d818 |   ret
                               #      | _end_fn_write_sd:
                               #      | 
                               #      | fn_init_sd:
                               #      | _begin_fn_init_sd:
                               #      | _A_call_24:
5c f8 09 00                    # d819 |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_24:
                               #      | _A_call_25:
5c f8 30 00                    # d81d |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_25:
                               #      | _cleanup_fn_init_sd:
dc                             # d821 |   ret
                               #      | _end_fn_init_sd:
                               #      | 
                               #      | fn_init_sd_head:
                               #      | _begin_fn_init_sd_head:
1e e0 1c 24 ff 0c              # d822 |   setb [0xff24], 0xc
1e e0 1c 24 ff 1f              # d828 |   setb [0xff24], 0x1f
                               #      | _A_call_23:
e0 00                          # d82e |   push 0
e0 e0 60 ea                    # d830 |   push 0xea60
e0 00                          # d834 |   push 0
e0 00                          # d836 |   push 0
5c f8 54 fc                    # d838 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # d83c |   mov SP, SP + 0x8
                               #      | _Z_call_23:
1e e0 1c 24 ff 0f              # d840 |   setb [0xff24], 0xf
1e e0 1c 24 ff 1c              # d846 |   setb [0xff24], 0x1c
                               #      | _cleanup_fn_init_sd_head:
dc                             # d84c |   ret
                               #      | _end_fn_init_sd_head:
                               #      | 
                               #      | fn_init_sd_tail:
                               #      | _begin_fn_init_sd_tail:
e0 60                          # d84d |   push C
e0 40                          # d84f |   push B
e0 20                          # d851 |   push A
                               #      | _A_for_9:
60 60 00                       # d853 |   mov C, 0
                               #      | _BA_for_9:
fc 60 1c f8 0a 30 00           # d856 |   jge C, 0xa, ${_C_for_9}:rel + PC
                               #      | _A_for_10:
60 20 00                       # d85d |   mov A, 0
                               #      | _BA_for_10:
fc 20 1c f8 ff 1a 00           # d860 |   jge A, -1, ${_C_for_10}:rel + PC
99 40 e0 1c 26 ff 09           # d867 |   getb B, [0xff26], 0x9
e8 40 00 f8 0c 00              # d86e |   jeq B, 0, ${_C_for_10}:rel + PC
                               #      | _BZ_for_10:
44 20                          # d874 |   inc A
58 f8 ea ff                    # d876 |   jmp ${_BA_for_10}:rel + PC
                               #      | _C_for_10:
                               #      | _Z_for_10:
e8 40 00 f8 0c 00              # d87a |   jeq B, 0, ${_C_for_9}:rel + PC
                               #      | _BZ_for_9:
44 60                          # d880 |   inc C
58 f8 d4 ff                    # d882 |   jmp ${_BA_for_9}:rel + PC
                               #      | _C_for_9:
                               #      | _Z_for_9:
c4 fe 00                       # d886 |   inc G, 0
                               #      | _A_if_62:
e8 40 00 f8 09 00              # d889 |   jeq B, 0, ${_E_if_62}:rel + PC
60 fe 00                       # d88f |   mov G, 0
                               #      | _E_if_62:
                               #      | _C_if_62:
                               #      | _Z_if_62:
                               #      | _cleanup_fn_init_sd_tail:
e4 20                          # d892 |   pop A
e4 40                          # d894 |   pop B
e4 60                          # d896 |   pop C
dc                             # d898 |   ret
                               #      | _end_fn_init_sd_tail:
                               #      | 
                               #      | fn_init_oled:
                               #      | _begin_fn_init_oled:
e0 80                          # d899 |   push D
60 80 e0 32 ff                 # d89b |   mov D, 0xff32
62 80 00                       # d8a0 |   mov [D], 0
1e 80 1c 0f                    # d8a3 |   setb [D], 0xf
                               #      | _A_call_27:
5c f8 72 00                    # d8a7 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_27:
                               #      | _A_call_29:
e0 e0 ae 00                    # d8ab |   push 0xae
5c f8 7d 00                    # d8af |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # d8b3 |   mov SP, SP + 0x2
                               #      | _Z_call_29:
1e 80 1c 0d                    # d8b7 |   setb [D], 0xd
                               #      | _A_call_30:
5c f8 5e 00                    # d8bb |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_30:
1e 80 1c 1d                    # d8bf |   setb [D], 0x1d
                               #      | _A_call_31:
5c f8 56 00                    # d8c3 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_31:
                               #      | _A_call_33:
e0 e0 f1 00                    # d8c7 |   push 0xf1
e0 e0 d9 00                    # d8cb |   push 0xd9
e0 1c 14                       # d8cf |   push 0x14
e0 e0 8d 00                    # d8d2 |   push 0x8d
e0 1c 04                       # d8d6 |   push 0x4
5c f8 ae 00                    # d8d9 |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0a                    # d8dd |   mov SP, SP + 0xa
                               #      | _Z_call_33:
1e 80 1c 0e                    # d8e1 |   setb [D], 0xe
                               #      | _A_call_34:
5c f8 34 00                    # d8e5 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_34:
                               #      | _A_call_35:
e0 00                          # d8e9 |   push 0
e0 1c 20                       # d8eb |   push 0x20
e0 e0 af 00                    # d8ee |   push 0xaf
e0 00                          # d8f2 |   push 0
e0 e0 da 00                    # d8f4 |   push 0xda
e0 e0 c0 00                    # d8f8 |   push 0xc0
e0 e0 a0 00                    # d8fc |   push 0xa0
e0 1c 0f                       # d900 |   push 0xf
e0 e0 81 00                    # d903 |   push 0x81
e0 1c 09                       # d907 |   push 0x9
5c f8 7d 00                    # d90a |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 14                    # d90e |   mov SP, SP + 0x14
                               #      | _Z_call_35:
                               #      | _A_call_39:
5c f8 a3 00                    # d912 |   call ${fn_clear_oled}:rel + PC
                               #      | _Z_call_39:
                               #      | _cleanup_fn_init_oled:
e4 80                          # d916 |   pop D
dc                             # d918 |   ret
                               #      | _end_fn_init_oled:
                               #      | 
                               #      | fn_delay_1ms:
                               #      | _begin_fn_delay_1ms:
                               #      | _A_call_26:
e0 00                          # d919 |   push 0
e0 e0 60 ea                    # d91b |   push 0xea60
e0 00                          # d91f |   push 0
e0 00                          # d921 |   push 0
5c f8 69 fb                    # d923 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # d927 |   mov SP, SP + 0x8
                               #      | _Z_call_26:
                               #      | _cleanup_fn_delay_1ms:
dc                             # d92b |   ret
                               #      | _end_fn_delay_1ms:
                               #      | 
                               #      | fn_send_oled_cmd:
                               #      | _begin_fn_send_oled_cmd:
                               #      | _A_call_28:
e2 bc 02                       # d92c |   push [SP + 0x2]
e0 00                          # d92f |   push 0
5c f8 09 00                    # d931 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # d935 |   mov SP, SP + 0x4
                               #      | _Z_call_28:
                               #      | _cleanup_fn_send_oled_cmd:
dc                             # d939 |   ret
                               #      | _end_fn_send_oled_cmd:
                               #      | 
                               #      | fn_send_oled_data_or_cmd:
                               #      | _begin_fn_send_oled_data_or_cmd:
e0 40                          # d93a |   push B
e0 20                          # d93c |   push A
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
99 40 e0 1c 30 ff 08           # d93e |   getb B, [0xff30], 0x8
ec 40 00 f8 0a 00              # d945 |   jne B, 0, ${_C_loop_9}:rel + PC
                               #      | _BZ_loop_9:
58 f8 f3 ff                    # d94b |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
ad 40 bc e0 08 ff 00           # d94f |   and B, [SP + 0x8], 0xff
ad 20 e0 e0 32 ff 00 ff        # d956 |   and A, [0xff32], 0xff00
30 20 e8 00 01                 # d95e |   or A, 0x100 + B
                               #      | _A_if_64:
ee bc 00 f8 06 0f 00           # d963 |   jne [SP + 0x6], 0, ${_E_if_64}:rel + PC
1c 20 1c 1c                    # d96a |   setb A, 0x1c
58 f8 08 00                    # d96e |   jmp ${_C_if_64}:rel + PC
                               #      | _E_if_64:
1c 20 1c 0c                    # d972 |   setb A, 0xc
                               #      | _C_if_64:
                               #      | _Z_if_64:
62 e0 20 32 ff                 # d976 |   mov [0xff32], A
9e e0 20 1c 32 ff 18           # d97b |   setb [0xff32], A, 0x18
                               #      | _cleanup_fn_send_oled_data_or_cmd:
e4 20                          # d982 |   pop A
e4 40                          # d984 |   pop B
dc                             # d986 |   ret
                               #      | _end_fn_send_oled_data_or_cmd:
                               #      | 
                               #      | fn_send_oled_cmd_sequence:
                               #      | _begin_fn_send_oled_cmd_sequence:
e0 40                          # d987 |   push B
e0 20                          # d989 |   push A
60 20 bc 08                    # d98b |   mov A, SP + 0x8
61 40 bc 06                    # d98f |   mov B, [SP + 0x6]
60 40 45                       # d993 |   mov B, B*2 + A
                               #      | _A_for_11:
                               #      | _BA_for_11:
fc 20 40 f8 1a 00              # d996 |   jge A, B, ${_C_for_11}:rel + PC
                               #      | _A_call_32:
e2 20                          # d99c |   push [A]
e0 00                          # d99e |   push 0
5c f8 9a ff                    # d9a0 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # d9a4 |   mov SP, SP + 0x4
                               #      | _Z_call_32:
                               #      | _BZ_for_11:
60 20 3c 02                    # d9a8 |   mov A, A + 0x2
58 f8 ea ff                    # d9ac |   jmp ${_BA_for_11}:rel + PC
                               #      | _C_for_11:
                               #      | _Z_for_11:
                               #      | _cleanup_fn_send_oled_cmd_sequence:
e4 20                          # d9b0 |   pop A
e4 40                          # d9b2 |   pop B
dc                             # d9b4 |   ret
                               #      | _end_fn_send_oled_cmd_sequence:
                               #      | 
                               #      | fn_clear_oled:
                               #      | _begin_fn_clear_oled:
e0 20                          # d9b5 |   push A
                               #      | _A_call_36:
e0 1c 03                       # d9b7 |   push 0x3
e0 00                          # d9ba |   push 0
e0 1c 22                       # d9bc |   push 0x22
e0 1c 7f                       # d9bf |   push 0x7f
e0 00                          # d9c2 |   push 0
e0 1c 21                       # d9c4 |   push 0x21
e0 1c 06                       # d9c7 |   push 0x6
5c f8 bd ff                    # d9ca |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # d9ce |   mov SP, SP + 0xe
                               #      | _Z_call_36:
                               #      | _A_for_12:
60 20 00                       # d9d2 |   mov A, 0
                               #      | _BA_for_12:
fc 20 e0 f8 00 02 18 00        # d9d5 |   jge A, 0x200, ${_C_for_12}:rel + PC
                               #      | _A_call_38:
e0 00                          # d9dd |   push 0
5c f8 11 00                    # d9df |   call ${fn_send_oled_data}:rel + PC
60 a0 bc 02                    # d9e3 |   mov SP, SP + 0x2
                               #      | _Z_call_38:
                               #      | _BZ_for_12:
44 20                          # d9e7 |   inc A
58 f8 ec ff                    # d9e9 |   jmp ${_BA_for_12}:rel + PC
                               #      | _C_for_12:
                               #      | _Z_for_12:
                               #      | _cleanup_fn_clear_oled:
e4 20                          # d9ed |   pop A
dc                             # d9ef |   ret
                               #      | _end_fn_clear_oled:
                               #      | 
                               #      | fn_send_oled_data:
                               #      | _begin_fn_send_oled_data:
                               #      | _A_call_37:
e2 bc 02                       # d9f0 |   push [SP + 0x2]
e0 1c 01                       # d9f3 |   push 0x1
5c f8 44 ff                    # d9f6 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # d9fa |   mov SP, SP + 0x4
                               #      | _Z_call_37:
                               #      | _cleanup_fn_send_oled_data:
dc                             # d9fe |   ret
                               #      | _end_fn_send_oled_data:
                               #      | 
                               #      | fn_deinit_oled:
                               #      | _begin_fn_deinit_oled:
e0 80                          # d9ff |   push D
60 80 e0 32 ff                 # da01 |   mov D, 0xff32
                               #      | _A_call_40:
e0 e0 ae 00                    # da06 |   push 0xae
5c f8 22 ff                    # da0a |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # da0e |   mov SP, SP + 0x2
                               #      | _Z_call_40:
1e 80 1c 1e                    # da12 |   setb [D], 0x1e
                               #      | _A_call_41:
5c f8 03 ff                    # da16 |   call ${fn_delay_1ms}:rel + PC
                               #      | _Z_call_41:
1e 80 1c 1f                    # da1a |   setb [D], 0x1f
62 e0 00 32 ff                 # da1e |   mov [0xff32], 0
                               #      | _cleanup_fn_deinit_oled:
e4 80                          # da23 |   pop D
dc                             # da25 |   ret
                               #      | _end_fn_deinit_oled:
                               #      | 
                               #      | fn_quick_deinit_oled:
                               #      | _begin_fn_quick_deinit_oled:
1e e0 1c 32 ff 0f              # da26 |   setb [0xff32], 0xf
                               #      | _A_call_42:
e0 e0 ae 00                    # da2c |   push 0xae
5c f8 fc fe                    # da30 |   call ${fn_send_oled_cmd}:rel + PC
60 a0 bc 02                    # da34 |   mov SP, SP + 0x2
                               #      | _Z_call_42:
62 e0 00 32 ff                 # da38 |   mov [0xff32], 0
                               #      | _cleanup_fn_quick_deinit_oled:
dc                             # da3d |   ret
                               #      | _end_fn_quick_deinit_oled:
                               #      | 
                               #      | fn_draw_char_oled:
                               #      | _begin_fn_draw_char_oled:
e0 80                          # da3e |   push D
e0 60                          # da40 |   push C
e0 40                          # da42 |   push B
e0 20                          # da44 |   push A
60 a0 bc e0                    # da46 |   mov SP, SP + -32
                               #      | _A_call_43:
e2 bc 2e                       # da4a |   push [SP + 0x2e]
e0 bc 02                       # da4d |   push SP + 0x2
5c f8 ac fb                    # da50 |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # da54 |   mov SP, SP + 0x4
                               #      | _Z_call_43:
ad 20 bc 1c 2a 01              # da58 |   and A, [SP + 0x2a], 0x1
ad 40 bc 1c 2c 07              # da5e |   and B, [SP + 0x2c], 0x7
28 40 1c 04                    # da64 |   shl B, 0x4
                               #      | _A_call_44:
e0 3d 01                       # da68 |   push A*2 + 0x1
e0 21                          # da6b |   push A*2
e0 1c 22                       # da6d |   push 0x22
e0 5c 0f                       # da70 |   push B + 0xf
e0 40                          # da73 |   push B
e0 1c 21                       # da75 |   push 0x21
e0 1c 06                       # da78 |   push 0x6
5c f8 0c ff                    # da7b |   call ${fn_send_oled_cmd_sequence}:rel + PC
60 a0 bc 0e                    # da7f |   mov SP, SP + 0xe
                               #      | _Z_call_44:
                               #      | _A_for_13:
60 20 00                       # da83 |   mov A, 0
                               #      | _BA_for_13:
fc 20 1c f8 10 52 00           # da86 |   jge A, 0x10, ${_C_for_13}:rel + PC
80 60 21 a0                    # da8d |   add C, A*2, SP
                               #      | _A_for_14:
e0 20                          # da91 |   push A
60 40 00                       # da93 |   mov B, 0
                               #      | _BA_for_14:
fc 40 1c f8 10 38 00           # da96 |   jge B, 0x10, ${_C_for_14}:rel + PC
60 20 00                       # da9d |   mov A, 0
                               #      | _A_for_15:
60 80 1c 07                    # daa0 |   mov D, 0x7
                               #      | _BA_for_15:
e8 80 1c f8 ff 17 00           # daa4 |   jeq D, -1, ${_C_for_15}:rel + PC
99 fe 8d 40                    # daab |   getb G, [D*2 + C], B
40 fe                          # daaf |   bool G
b0 20 21 fe                    # dab1 |   or A, A*2, G
                               #      | _BZ_for_15:
48 80                          # dab5 |   dec D
58 f8 ed ff                    # dab7 |   jmp ${_BA_for_15}:rel + PC
                               #      | _C_for_15:
                               #      | _Z_for_15:
                               #      | _A_call_45:
e0 20                          # dabb |   push A
e0 1c 01                       # dabd |   push 0x1
5c f8 7a fe                    # dac0 |   call ${fn_send_oled_data_or_cmd}:rel + PC
60 a0 bc 04                    # dac4 |   mov SP, SP + 0x4
                               #      | _Z_call_45:
                               #      | _BZ_for_14:
44 40                          # dac8 |   inc B
58 f8 cc ff                    # daca |   jmp ${_BA_for_14}:rel + PC
                               #      | _C_for_14:
e4 20                          # dace |   pop A
                               #      | _Z_for_14:
                               #      | _BZ_for_13:
60 20 3c 08                    # dad0 |   mov A, A + 0x8
58 f8 b2 ff                    # dad4 |   jmp ${_BA_for_13}:rel + PC
                               #      | _C_for_13:
                               #      | _Z_for_13:
                               #      | _cleanup_fn_draw_char_oled:
60 a0 bc 20                    # dad8 |   mov SP, SP + 0x20
e4 20                          # dadc |   pop A
e4 40                          # dade |   pop B
e4 60                          # dae0 |   pop C
e4 80                          # dae2 |   pop D
dc                             # dae4 |   ret
                               #      | _end_fn_draw_char_oled:
                               #      | 
                               #      | fn_draw_str_oled:
                               #      | _begin_fn_draw_str_oled:
e0 80                          # dae5 |   push D
e0 60                          # dae7 |   push C
e0 40                          # dae9 |   push B
e0 20                          # daeb |   push A
61 60 bc 0a                    # daed |   mov C, [SP + 0xa]
61 80 bc 0c                    # daf1 |   mov D, [SP + 0xc]
61 20 bc 0e                    # daf5 |   mov A, [SP + 0xe]
                               #      | _A_loop_10:
                               #      | _BA_loop_10:
65 40 20                       # daf9 |   bmov B, [A]
e8 40 00 f8 1c 00              # dafc |   jeq B, 0, ${_C_loop_10}:rel + PC
                               #      | _A_call_46:
e0 40                          # db02 |   push B
e0 80                          # db04 |   push D
e0 60                          # db06 |   push C
5c f8 36 ff                    # db08 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # db0c |   mov SP, SP + 0x6
                               #      | _Z_call_46:
44 20                          # db10 |   inc A
44 80                          # db12 |   inc D
                               #      | _BZ_loop_10:
58 f8 e5 ff                    # db14 |   jmp ${_BA_loop_10}:rel + PC
                               #      | _C_loop_10:
                               #      | _Z_loop_10:
                               #      | _cleanup_fn_draw_str_oled:
e4 20                          # db18 |   pop A
e4 40                          # db1a |   pop B
e4 60                          # db1c |   pop C
e4 80                          # db1e |   pop D
dc                             # db20 |   ret
                               #      | _end_fn_draw_str_oled:
                               #      | 
                               #      | fn_draw_char:
                               #      | _begin_fn_draw_char:
e0 40                          # db21 |   push B
e0 20                          # db23 |   push A
60 a0 bc e0                    # db25 |   mov SP, SP + -32
                               #      | _A_call_47:
e2 bc 2a                       # db29 |   push [SP + 0x2a]
e0 bc 02                       # db2c |   push SP + 0x2
5c f8 cd fa                    # db2f |   call ${fn_decode_font_16_12}:rel + PC
60 a0 bc 04                    # db33 |   mov SP, SP + 0x4
                               #      | _Z_call_47:
                               #      | _A_call_48:
e0 a0                          # db37 |   push SP
e2 bc 2a                       # db39 |   push [SP + 0x2a]
e2 bc 2a                       # db3c |   push [SP + 0x2a]
5c f8 11 00                    # db3f |   call ${fn_fill_cell_content}:rel + PC
60 a0 bc 06                    # db43 |   mov SP, SP + 0x6
                               #      | _Z_call_48:
                               #      | _cleanup_fn_draw_char:
60 a0 bc 20                    # db47 |   mov SP, SP + 0x20
e4 20                          # db4b |   pop A
e4 40                          # db4d |   pop B
dc                             # db4f |   ret
                               #      | _end_fn_draw_char:
                               #      | 
                               #      | fn_fill_cell_content:
                               #      | _begin_fn_fill_cell_content:
e0 60                          # db50 |   push C
e0 40                          # db52 |   push B
e0 20                          # db54 |   push A
a9 20 bc 1c 0a 01              # db56 |   shl A, [SP + 0xa], 0x1
01 20 bc 08                    # db5c |   add A, [SP + 0x8]
60 60 e4 00 05                 # db60 |   mov C, 0x500 + A
61 40 bc 0c                    # db65 |   mov B, [SP + 0xc]
                               #      | _A_for_16:
                               #      | _BA_for_16:
fc 20 60 f8 15 00              # db69 |   jge A, C, ${_C_for_16}:rel + PC
63 20 40                       # db6f |   mov [A], [B]
                               #      | _BZ_for_16:
60 20 3c 50                    # db72 |   mov A, A + 0x50
60 40 5c 02                    # db76 |   mov B, B + 0x2
58 f8 ef ff                    # db7a |   jmp ${_BA_for_16}:rel + PC
                               #      | _C_for_16:
                               #      | _Z_for_16:
                               #      | _cleanup_fn_fill_cell_content:
e4 20                          # db7e |   pop A
e4 40                          # db80 |   pop B
e4 60                          # db82 |   pop C
dc                             # db84 |   ret
                               #      | _end_fn_fill_cell_content:
                               #      | 
                               #      | fn_draw_str:
                               #      | _begin_fn_draw_str:
e0 40                          # db85 |   push B
e0 20                          # db87 |   push A
61 20 bc 08                    # db89 |   mov A, [SP + 0x8]
61 40 bc 0a                    # db8d |   mov B, [SP + 0xa]
                               #      | _A_loop_11:
                               #      | _BA_loop_11:
fc 20 1c f8 28 27 00           # db91 |   jge A, 0x28, ${_C_loop_11}:rel + PC
65 ff 40                       # db98 |   bmov H, [B]
e8 ff 00 f8 1d 00              # db9b |   jeq H, 0, ${_C_loop_11}:rel + PC
                               #      | _A_call_49:
e0 ff                          # dba1 |   push H
e0 20                          # dba3 |   push A
e2 bc 0a                       # dba5 |   push [SP + 0xa]
5c f8 79 ff                    # dba8 |   call ${fn_draw_char}:rel + PC
60 a0 bc 06                    # dbac |   mov SP, SP + 0x6
                               #      | _Z_call_49:
44 20                          # dbb0 |   inc A
44 40                          # dbb2 |   inc B
                               #      | _BZ_loop_11:
58 f8 dd ff                    # dbb4 |   jmp ${_BA_loop_11}:rel + PC
                               #      | _C_loop_11:
                               #      | _Z_loop_11:
                               #      | _cleanup_fn_draw_str:
e4 20                          # dbb8 |   pop A
e4 40                          # dbba |   pop B
dc                             # dbbc |   ret
                               #      | _end_fn_draw_str:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_51:
e0 00                          # dbbd |   push 0
5c f8 15 00                    # dbbf |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # dbc3 |   mov SP, SP + 0x2
                               #      | _Z_call_51:
                               #      | _A_call_52:
e0 e0 70 ee                    # dbc7 |   push ${const__str__PONG__endl}
5c f8 36 f6                    # dbcb |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # dbcf |   mov SP, SP + 0x2
                               #      | _Z_call_52:
                               #      | _cleanup_fn_handle_ping:
dc                             # dbd3 |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # dbd4 |   inc G, 0
                               #      | _A_if_68:
eb e0 bc f8 02 fa 02 1f 00     # dbd7 |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_68}:rel + PC
                               #      | _A_call_50:
e2 e0 02 fa                    # dbe0 |   push [${var__g_num_args}]
e2 bc 04                       # dbe4 |   push [SP + 0x4]
e0 e0 4c ee                    # dbe7 |   push ${const__data_1}
5c f8 48 f4                    # dbeb |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # dbef |   mov SP, SP + 0x6
                               #      | _Z_call_50:
60 fe 00                       # dbf3 |   mov G, 0
                               #      | _E_if_68:
                               #      | _C_if_68:
                               #      | _Z_if_68:
                               #      | _cleanup_fn_check_num_args:
dc                             # dbf6 |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # dbf7 |   push D
e0 60                          # dbf9 |   push C
e0 40                          # dbfb |   push B
e0 20                          # dbfd |   push A
60 a0 bc fa                    # dbff |   mov SP, SP + -6
                               #      | _A_call_53:
e0 1c 02                       # dc03 |   push 0x2
5c f8 ce ff                    # dc06 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # dc0a |   mov SP, SP + 0x2
                               #      | _Z_call_53:
e8 fe 00 f8 9f 00              # dc0e |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_55:
5c f8 a6 00                    # dc14 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_55:
e8 fe 00 f8 95 00              # dc18 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 04 fa                 # dc1e |   mov A, [${var__g_args}]
61 40 e0 06 fa                 # dc23 |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_56:
e0 40                          # dc28 |   push B
e0 20                          # dc2a |   push A
e0 e0 92 ee                    # dc2c |   push ${const__data_2}
5c f8 03 f4                    # dc30 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # dc34 |   mov SP, SP + 0x6
                               #      | _Z_call_56:
                               #      | _A_if_74:
ee bc 1c f8 10 04 35 00        # dc38 |   jne [SP + 0x10], 0x4, ${_E_if_74}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 29 00              # dc40 |   jge A, B, ${_C_while_7}:rel + PC
61 60 20                       # dc46 |   mov C, [A]
                               #      | _A_call_57:
e0 60                          # dc49 |   push C
5c f8 51 f5                    # dc4b |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # dc4f |   mov SP, SP + 0x2
                               #      | _Z_call_57:
20 60 1c 08                    # dc53 |   shr C, 0x8
                               #      | _A_call_58:
e0 60                          # dc57 |   push C
5c f8 43 f5                    # dc59 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # dc5d |   mov SP, SP + 0x2
                               #      | _Z_call_58:
60 20 3c 02                    # dc61 |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 db ff                    # dc65 |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 39 00                    # dc69 |   jmp ${_C_if_74}:rel + PC
                               #      | _E_if_74:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 35 00              # dc6d |   jge A, B, ${_C_while_8}:rel + PC
95 80 20 1c 08                 # dc73 |   ror D, [A], 0x8
                               #      | _A_if_75:
ee bc 1c f8 10 0b 0c 00        # dc78 |   jne [SP + 0x10], 0xb, ${_E_if_75}:rel + PC
14 80 1c 08                    # dc80 |   ror D, 0x8
                               #      | _E_if_75:
                               #      | _C_if_75:
                               #      | _Z_if_75:
                               #      | _A_call_59:
e0 a0                          # dc84 |   push SP
e0 80                          # dc86 |   push D
5c f8 9b f5                    # dc88 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # dc8c |   mov SP, SP + 0x4
                               #      | _Z_call_59:
                               #      | _A_call_60:
e0 a0                          # dc90 |   push SP
5c f8 6f f5                    # dc92 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # dc96 |   mov SP, SP + 0x2
                               #      | _Z_call_60:
60 20 3c 02                    # dc9a |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 cf ff                    # dc9e |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_74:
                               #      | _Z_if_74:
                               #      | _A_call_61:
e0 1c 0a                       # dca2 |   push 0xa
5c f8 f7 f4                    # dca5 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # dca9 |   mov SP, SP + 0x2
                               #      | _Z_call_61:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # dcad |   mov SP, SP + 0x6
e4 20                          # dcb1 |   pop A
e4 40                          # dcb3 |   pop B
e4 60                          # dcb5 |   pop C
e4 80                          # dcb7 |   pop D
dc                             # dcb9 |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # dcba |   push C
e0 40                          # dcbc |   push B
e0 20                          # dcbe |   push A
61 20 e0 04 fa                 # dcc0 |   mov A, [${var__g_args}]
61 40 e0 06 fa                 # dcc5 |   mov B, [${var__g_args} + 0002]
60 60 e0 76 ee                 # dcca |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # dccf |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 85 ee                 # dcd5 |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # dcda |   and G, A, 0x1
ec fe 00 f8 18 00              # dcdf |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # dce5 |   and G, B, 0x1
ec fe 00 f8 0d 00              # dcea |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # dcf0 |   inc G, 0
58 f8 11 00                    # dcf3 |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_54:
e0 60                          # dcf7 |   push C
5c f8 08 f5                    # dcf9 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # dcfd |   mov SP, SP + 0x2
                               #      | _Z_call_54:
60 fe 00                       # dd01 |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # dd04 |   pop A
e4 40                          # dd06 |   pop B
e4 60                          # dd08 |   pop C
dc                             # dd0a |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # dd0b |   push D
e0 60                          # dd0d |   push C
e0 40                          # dd0f |   push B
e0 20                          # dd11 |   push A
60 a0 bc fa                    # dd13 |   mov SP, SP + -6
                               #      | _A_call_62:
e0 1c 02                       # dd17 |   push 0x2
5c f8 ba fe                    # dd1a |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # dd1e |   mov SP, SP + 0x2
                               #      | _Z_call_62:
e8 fe 00 f8 ce 00              # dd22 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_63:
5c f8 92 ff                    # dd28 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_63:
e8 fe 00 f8 c4 00              # dd2c |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 04 fa                 # dd32 |   mov A, [${var__g_args}]
61 40 e0 06 fa                 # dd37 |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_78:
ee bc 1c f8 10 03 55 00        # dd3c |   jne [SP + 0x10], 0x3, ${_E_if_78}:rel + PC
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 20 40 f8 49 00              # dd44 |   jge A, B, ${_C_while_9}:rel + PC
                               #      | _A_for_17:
60 80 00                       # dd4a |   mov D, 0
                               #      | _BA_for_17:
fc 80 1c f8 04 19 00           # dd4d |   jge D, 0x4, ${_C_for_17}:rel + PC
                               #      | _A_call_64:
5c f8 5a f5                    # dd54 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_64:
62 e0 ff 00 ff                 # dd58 |   mov [0xff00], H
62 b0 ff                       # dd5d |   mov [SP + D], H
                               #      | _BZ_for_17:
44 80                          # dd60 |   inc D
58 f8 eb ff                    # dd62 |   jmp ${_BA_for_17}:rel + PC
                               #      | _C_for_17:
                               #      | _Z_for_17:
                               #      | _A_call_65:
e0 a0                          # dd66 |   push SP
5c f8 a0 f5                    # dd68 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # dd6c |   mov SP, SP + 0x2
                               #      | _Z_call_65:
e8 fe 00 f8 74 00              # dd70 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # dd76 |   shl C, H, 0x8
20 ff 1c 08                    # dd7b |   shr H, 0x8
30 60 ff                       # dd7f |   or C, H
62 20 60                       # dd82 |   mov [A], C
60 20 3c 02                    # dd85 |   mov A, A + 0x2
                               #      | _BZ_while_9:
58 f8 bb ff                    # dd89 |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
58 f8 31 00                    # dd8d |   jmp ${_C_if_78}:rel + PC
                               #      | _E_if_78:
                               #      | _A_while_10:
                               #      | _BA_while_10:
fc 20 40 f8 2d 00              # dd91 |   jge A, B, ${_C_while_10}:rel + PC
                               #      | _A_call_66:
5c f8 17 f5                    # dd97 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_66:
62 e0 ff 00 ff                 # dd9b |   mov [0xff00], H
60 60 ff                       # dda0 |   mov C, H
                               #      | _A_call_67:
5c f8 0b f5                    # dda3 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_67:
62 e0 ff 00 ff                 # dda7 |   mov [0xff00], H
28 ff 1c 08                    # ddac |   shl H, 0x8
30 60 ff                       # ddb0 |   or C, H
62 20 60                       # ddb3 |   mov [A], C
60 20 3c 02                    # ddb6 |   mov A, A + 0x2
                               #      | _BZ_while_10:
58 f8 d7 ff                    # ddba |   jmp ${_BA_while_10}:rel + PC
                               #      | _C_while_10:
                               #      | _Z_while_10:
                               #      | _C_if_78:
                               #      | _Z_if_78:
                               #      | _A_call_68:
5c f8 f0 f4                    # ddbe |   call ${fn_getc}:rel + PC
                               #      | _Z_call_68:
62 e0 ff 00 ff                 # ddc2 |   mov [0xff00], H
ec ff 1c f8 0a 1d 00           # ddc7 |   jne H, 0xa, ${_L_fn_handle_write_1}:rel + PC
                               #      | _A_call_69:
e0 40                          # ddce |   push B
e2 e0 04 fa                    # ddd0 |   push [${var__g_args}]
e0 e0 a1 ee                    # ddd4 |   push ${const__data_3}
5c f8 5b f2                    # ddd8 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # dddc |   mov SP, SP + 0x6
                               #      | _Z_call_69:
58 f8 10 00                    # dde0 |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_70:
e0 e0 b1 ee                    # dde4 |   push ${const__data_4}
5c f8 19 f4                    # dde8 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # ddec |   mov SP, SP + 0x2
                               #      | _Z_call_70:
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # ddf0 |   mov SP, SP + 0x6
e4 20                          # ddf4 |   pop A
e4 40                          # ddf6 |   pop B
e4 60                          # ddf8 |   pop C
e4 80                          # ddfa |   pop D
dc                             # ddfc |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
e0 20                          # ddfd |   push A
                               #      | _A_call_71:
e0 1c 01                       # ddff |   push 0x1
5c f8 d2 fd                    # de02 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # de06 |   mov SP, SP + 0x2
                               #      | _Z_call_71:
e8 fe 00 f8 4b 00              # de0a |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_call_73:
e0 1c 52                       # de10 |   push 0x52
5c f8 45 00                    # de13 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # de17 |   mov SP, SP + 0x2
                               #      | _Z_call_73:
62 e0 00 0a ff                 # de1b |   mov [0xff0a], 0
61 20 e0 04 fa                 # de20 |   mov A, [${var__g_args}]
                               #      | _A_if_82:
ee bc 1c f8 04 06 18 00        # de25 |   jne [SP + 0x4], 0x6, ${_E_if_82}:rel + PC
                               #      | _A_call_74:
e0 20                          # de2d |   push A
e0 e0 c0 ee                    # de2f |   push ${const__data_5}
5c f8 00 f2                    # de33 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # de37 |   mov SP, SP + 0x4
                               #      | _Z_call_74:
58 20                          # de3b |   jmp A
                               #      | _E_if_82:
                               #      | _C_if_82:
                               #      | _Z_if_82:
                               #      | _A_call_75:
e0 20                          # de3d |   push A
e0 e0 cb ee                    # de3f |   push ${const__data_6}
5c f8 f0 f1                    # de43 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # de47 |   mov SP, SP + 0x4
                               #      | _Z_call_75:
                               #      | _A_call_76:
e0 20                          # de4b |   push A
5c f8 1d 00                    # de4d |   call ${fn_jmp_to_target_persisted}:rel + PC
60 a0 bc 02                    # de51 |   mov SP, SP + 0x2
                               #      | _Z_call_76:
                               #      | _cleanup_fn_handle_jmp:
e4 20                          # de55 |   pop A
dc                             # de57 |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_show_status:
                               #      | _begin_fn_show_status:
                               #      | _A_call_72:
e2 bc 02                       # de58 |   push [SP + 0x2]
e0 1c 07                       # de5b |   push 0x7
e0 1c 01                       # de5e |   push 0x1
5c f8 dd fb                    # de61 |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # de65 |   mov SP, SP + 0x6
                               #      | _Z_call_72:
                               #      | _cleanup_fn_show_status:
dc                             # de69 |   ret
                               #      | _end_fn_show_status:
                               #      | 
                               #      | fn_jmp_to_target_persisted:
                               #      | _begin_fn_jmp_to_target_persisted:
63 e0 bc 1c ff 02              # de6a |   mov [0xff1c], [SP + 0x2]
                               #      | glb_jmp_to_stored_target:
60 20 00                       # de70 |   mov A, 0
60 40 00                       # de73 |   mov B, 0
60 60 00                       # de76 |   mov C, 0
60 80 00                       # de79 |   mov D, 0
60 a0 00                       # de7c |   mov SP, 0
60 fc 00                       # de7f |   mov E, 0
60 fd 00                       # de82 |   mov F, 0
60 fe 00                       # de85 |   mov G, 0
60 ff 00                       # de88 |   mov H, 0
5a e0 1c ff                    # de8b |   jmp [0xff1c]
                               #      | _cleanup_fn_jmp_to_target_persisted:
dc                             # de8f |   ret
                               #      | _end_fn_jmp_to_target_persisted:
                               #      | 
                               #      | fn_handle_init_sd:
                               #      | _begin_fn_handle_init_sd:
                               #      | _A_call_77:
5c f8 89 f9                    # de90 |   call ${fn_init_sd}:rel + PC
                               #      | _Z_call_77:
                               #      | _A_if_83:
ec fe 00 f8 16 00              # de94 |   jne G, 0, ${_E_if_83}:rel + PC
                               #      | _A_call_78:
e0 e0 dd ee                    # de9a |   push ${const__str__TIMEOUT__endl}
5c f8 63 f3                    # de9e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # dea2 |   mov SP, SP + 0x2
                               #      | _Z_call_78:
58 f8 10 00                    # dea6 |   jmp ${_C_if_83}:rel + PC
                               #      | _E_if_83:
                               #      | _A_call_79:
e0 e0 e6 ee                    # deaa |   push ${const__str__INIT_OK__endl}
5c f8 53 f3                    # deae |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # deb2 |   mov SP, SP + 0x2
                               #      | _Z_call_79:
                               #      | _C_if_83:
                               #      | _Z_if_83:
                               #      | _cleanup_fn_handle_init_sd:
dc                             # deb6 |   ret
                               #      | _end_fn_handle_init_sd:
                               #      | 
                               #      | fn_handle_read_sd:
                               #      | _begin_fn_handle_read_sd:
e0 40                          # deb7 |   push B
e0 20                          # deb9 |   push A
60 a0 bc fa                    # debb |   mov SP, SP + -6
60 a0 f4 f0 fd                 # debf |   mov SP, 0xfdf0 + SP
                               #      | _A_call_80:
e0 1c 02                       # dec4 |   push 0x2
5c f8 0d fd                    # dec7 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # decb |   mov SP, SP + 0x2
                               #      | _Z_call_80:
e8 fe 00 f8 7d 00              # decf |   jeq G, 0, ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _A_call_81:
e2 e0 06 fa                    # ded5 |   push [${var__g_args} + 0002]
e2 e0 04 fa                    # ded9 |   push [${var__g_args}]
e0 e0 00 02                    # dedd |   push 0x200
e0 bc 06                       # dee1 |   push SP + 0x6
5c f8 5a f7                    # dee4 |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # dee8 |   mov SP, SP + 0x8
                               #      | _Z_call_81:
                               #      | _A_if_85:
ec fe 00 f8 16 00              # deec |   jne G, 0, ${_E_if_85}:rel + PC
                               #      | _A_call_82:
e0 e0 dd ee                    # def2 |   push ${const__str__TIMEOUT__endl}
5c f8 0b f3                    # def6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # defa |   mov SP, SP + 0x2
                               #      | _Z_call_82:
58 f8 4e 00                    # defe |   jmp ${_cleanup_fn_handle_read_sd}:rel + PC
                               #      | _E_if_85:
                               #      | _C_if_85:
                               #      | _Z_if_85:
                               #      | _A_call_83:
e2 e0 06 fa                    # df02 |   push [${var__g_args} + 0002]
e2 e0 04 fa                    # df06 |   push [${var__g_args}]
e0 e0 ef ee                    # df0a |   push ${const__data_7}
5c f8 25 f1                    # df0e |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # df12 |   mov SP, SP + 0x6
                               #      | _Z_call_83:
                               #      | _A_for_18:
60 40 a0                       # df16 |   mov B, SP
                               #      | _BA_for_18:
fc 40 f4 f8 00 02 28 00        # df19 |   jge B, 0x200 + SP, ${_C_for_18}:rel + PC
                               #      | _A_call_84:
e0 f4 10 02                    # df21 |   push 0x210 + SP
e2 40                          # df25 |   push [B]
5c f8 fc f2                    # df27 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # df2b |   mov SP, SP + 0x4
                               #      | _Z_call_84:
                               #      | _A_call_85:
e0 f4 12 02                    # df2f |   push 0x212 + SP
5c f8 ce f2                    # df33 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # df37 |   mov SP, SP + 0x2
                               #      | _Z_call_85:
                               #      | _BZ_for_18:
44 40                          # df3b |   inc B
58 f8 dc ff                    # df3d |   jmp ${_BA_for_18}:rel + PC
                               #      | _C_for_18:
                               #      | _Z_for_18:
                               #      | _A_call_86:
e0 1c 0a                       # df41 |   push 0xa
5c f8 58 f2                    # df44 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # df48 |   mov SP, SP + 0x2
                               #      | _Z_call_86:
                               #      | _cleanup_fn_handle_read_sd:
60 a0 f4 16 02                 # df4c |   mov SP, 0x216 + SP
e4 20                          # df51 |   pop A
e4 40                          # df53 |   pop B
dc                             # df55 |   ret
                               #      | _end_fn_handle_read_sd:
                               #      | 
                               #      | fn_handle_init_oled:
                               #      | _begin_fn_handle_init_oled:
                               #      | _A_call_87:
5c f8 43 f9                    # df56 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_87:
                               #      | _A_call_88:
e0 e0 01 ef                    # df5a |   push ${const__str__DONE__endl}
5c f8 a3 f2                    # df5e |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # df62 |   mov SP, SP + 0x2
                               #      | _Z_call_88:
                               #      | _cleanup_fn_handle_init_oled:
dc                             # df66 |   ret
                               #      | _end_fn_handle_init_oled:
                               #      | 
                               #      | fn_handle_deinit_oled:
                               #      | _begin_fn_handle_deinit_oled:
                               #      | _A_call_89:
5c f8 98 fa                    # df67 |   call ${fn_deinit_oled}:rel + PC
                               #      | _Z_call_89:
                               #      | _A_call_90:
e0 e0 01 ef                    # df6b |   push ${const__str__DONE__endl}
5c f8 92 f2                    # df6f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # df73 |   mov SP, SP + 0x2
                               #      | _Z_call_90:
                               #      | _cleanup_fn_handle_deinit_oled:
dc                             # df77 |   ret
                               #      | _end_fn_handle_deinit_oled:
                               #      | 
                               #      | fn_handle_write_sd:
                               #      | _begin_fn_handle_write_sd:
e0 80                          # df78 |   push D
e0 60                          # df7a |   push C
e0 40                          # df7c |   push B
e0 20                          # df7e |   push A
60 a0 bc fa                    # df80 |   mov SP, SP + -6
60 a0 f4 f0 fd                 # df84 |   mov SP, 0xfdf0 + SP
                               #      | _A_call_91:
e0 1c 02                       # df89 |   push 0x2
5c f8 48 fc                    # df8c |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # df90 |   mov SP, SP + 0x2
                               #      | _Z_call_91:
e8 fe 00 f8 c9 00              # df94 |   jeq G, 0, ${_cleanup_fn_handle_write_sd}:rel + PC
60 20 a0                       # df9a |   mov A, SP
                               #      | _A_while_11:
                               #      | _BA_while_11:
fc 20 f4 f8 00 02 5f 00        # df9d |   jge A, 0x200 + SP, ${_C_while_11}:rel + PC
                               #      | _A_if_87:
ee f4 1c f8 20 02 0d 45 00     # dfa5 |   jne [0x220 + SP], 0xd, ${_E_if_87}:rel + PC
                               #      | _A_for_19:
60 80 00                       # dfae |   mov D, 0
                               #      | _BA_for_19:
fc 80 1c f8 02 1e 00           # dfb1 |   jge D, 0x2, ${_C_for_19}:rel + PC
                               #      | _A_call_92:
5c f8 f6 f2                    # dfb8 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_92:
62 e0 ff 00 ff                 # dfbc |   mov [0xff00], H
60 60 f4 10 02                 # dfc1 |   mov C, 0x210 + SP
62 70 ff                       # dfc6 |   mov [C + D], H
                               #      | _BZ_for_19:
44 80                          # dfc9 |   inc D
58 f8 e6 ff                    # dfcb |   jmp ${_BA_for_19}:rel + PC
                               #      | _C_for_19:
                               #      | _Z_for_19:
                               #      | _A_call_93:
e0 f4 10 02                    # dfcf |   push 0x210 + SP
5c f8 35 f3                    # dfd3 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # dfd7 |   mov SP, SP + 0x2
                               #      | _Z_call_93:
e8 fe 00 f8 76 00              # dfdb |   jeq G, 0, ${_L_fn_handle_write_sd_1}:rel + PC
62 20 ff                       # dfe1 |   mov [A], H
44 20                          # dfe4 |   inc A
58 f8 12 00                    # dfe6 |   jmp ${_C_if_87}:rel + PC
                               #      | _E_if_87:
                               #      | _A_call_94:
5c f8 c4 f2                    # dfea |   call ${fn_getc}:rel + PC
                               #      | _Z_call_94:
62 e0 ff 00 ff                 # dfee |   mov [0xff00], H
62 20 ff                       # dff3 |   mov [A], H
44 20                          # dff6 |   inc A
                               #      | _C_if_87:
                               #      | _Z_if_87:
                               #      | _BZ_while_11:
58 f8 a5 ff                    # dff8 |   jmp ${_BA_while_11}:rel + PC
                               #      | _C_while_11:
                               #      | _Z_while_11:
                               #      | _A_call_95:
5c f8 b2 f2                    # dffc |   call ${fn_getc}:rel + PC
                               #      | _Z_call_95:
62 e0 ff 00 ff                 # e000 |   mov [0xff00], H
ec ff 1c f8 0a 4c 00           # e005 |   jne H, 0xa, ${_L_fn_handle_write_sd_1}:rel + PC
                               #      | _A_call_96:
e2 e0 06 fa                    # e00c |   push [${var__g_args} + 0002]
e2 e0 04 fa                    # e010 |   push [${var__g_args}]
e0 e0 00 02                    # e014 |   push 0x200
e0 bc 06                       # e018 |   push SP + 0x6
5c f8 42 f7                    # e01b |   call ${fn_write_sd}:rel + PC
60 a0 bc 08                    # e01f |   mov SP, SP + 0x8
                               #      | _Z_call_96:
                               #      | _A_if_90:
ec fe 00 f8 16 00              # e023 |   jne G, 0, ${_E_if_90}:rel + PC
                               #      | _A_call_97:
e0 e0 dd ee                    # e029 |   push ${const__str__TIMEOUT__endl}
5c f8 d4 f1                    # e02d |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e031 |   mov SP, SP + 0x2
                               #      | _Z_call_97:
58 f8 28 00                    # e035 |   jmp ${_cleanup_fn_handle_write_sd}:rel + PC
                               #      | _E_if_90:
                               #      | _C_if_90:
                               #      | _Z_if_90:
                               #      | _A_call_98:
e2 e0 06 fa                    # e039 |   push [${var__g_args} + 0002]
e2 e0 04 fa                    # e03d |   push [${var__g_args}]
e0 e0 07 ef                    # e041 |   push ${const__data_8}
5c f8 ee ef                    # e045 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # e049 |   mov SP, SP + 0x6
                               #      | _Z_call_98:
58 f8 10 00                    # e04d |   jmp ${_cleanup_fn_handle_write_sd}:rel + PC
                               #      | _L_fn_handle_write_sd_1:
                               #      | _A_call_99:
e0 e0 b1 ee                    # e051 |   push ${const__data_4}
5c f8 ac f1                    # e055 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e059 |   mov SP, SP + 0x2
                               #      | _Z_call_99:
                               #      | _cleanup_fn_handle_write_sd:
60 a0 f4 16 02                 # e05d |   mov SP, 0x216 + SP
e4 20                          # e062 |   pop A
e4 40                          # e064 |   pop B
e4 60                          # e066 |   pop C
e4 80                          # e068 |   pop D
dc                             # e06a |   ret
                               #      | _end_fn_handle_write_sd:
                               #      | 
                               #      | fn_handle_mmap:
                               #      | _begin_fn_handle_mmap:
e0 80                          # e06b |   push D
e0 60                          # e06d |   push C
e0 40                          # e06f |   push B
e0 20                          # e071 |   push A
                               #      | _A_call_100:
e0 fc                          # e073 |   push E
e0 1c 05                       # e075 |   push 0x5
5c f8 5c fb                    # e078 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e07c |   mov SP, SP + 0x2
e4 fc                          # e080 |   pop E
                               #      | _Z_call_100:
e8 fe 00 f8 3f 00              # e082 |   jeq G, 0, ${_cleanup_fn_handle_mmap}:rel + PC
61 20 e0 04 fa                 # e088 |   mov A, [${var__g_args}]
61 40 e0 06 fa                 # e08d |   mov B, [${var__g_args} + 0002]
61 60 e0 08 fa                 # e092 |   mov C, [${var__g_args} + 0004]
61 80 e0 0a fa                 # e097 |   mov D, [${var__g_args} + 0006]
ad fc e0 1c 0c fa 03           # e09c |   and E, [${var__g_args} + 0008], 0x3
54 60 80 fc                    # e0a3 |   mmap C, D, E
                               #      | _A_call_101:
e0 fc                          # e0a7 |   push E
e0 fc                          # e0a9 |   push E
e0 80                          # e0ab |   push D
e0 60                          # e0ad |   push C
e0 40                          # e0af |   push B
e0 20                          # e0b1 |   push A
e0 e0 1a ef                    # e0b3 |   push ${const__data_9}
5c f8 7c ef                    # e0b7 |   call ${fn_printf}:rel + PC
60 a0 bc 0c                    # e0bb |   mov SP, SP + 0xc
e4 fc                          # e0bf |   pop E
                               #      | _Z_call_101:
                               #      | _cleanup_fn_handle_mmap:
e4 20                          # e0c1 |   pop A
e4 40                          # e0c3 |   pop B
e4 60                          # e0c5 |   pop C
e4 80                          # e0c7 |   pop D
dc                             # e0c9 |   ret
                               #      | _end_fn_handle_mmap:
                               #      | 
                               #      | fn_handle_umap:
                               #      | _begin_fn_handle_umap:
e0 20                          # e0ca |   push A
                               #      | _A_call_102:
e0 1c 01                       # e0cc |   push 0x1
5c f8 05 fb                    # e0cf |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e0d3 |   mov SP, SP + 0x2
                               #      | _Z_call_102:
e8 fe 00 f8 1d 00              # e0d7 |   jeq G, 0, ${_cleanup_fn_handle_umap}:rel + PC
ad 20 e0 1c 04 fa 03           # e0dd |   and A, [${var__g_args}], 0x3
d4 20                          # e0e4 |   umap A
                               #      | _A_call_103:
e0 20                          # e0e6 |   push A
e0 e0 32 ef                    # e0e8 |   push ${const__data_10}
5c f8 47 ef                    # e0ec |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e0f0 |   mov SP, SP + 0x4
                               #      | _Z_call_103:
                               #      | _cleanup_fn_handle_umap:
e4 20                          # e0f4 |   pop A
dc                             # e0f6 |   ret
                               #      | _end_fn_handle_umap:
                               #      | 
                               #      | fn_handle_show_img:
                               #      | _begin_fn_handle_show_img:
                               #      | _A_call_104:
e0 1c 02                       # e0f7 |   push 0x2
5c f8 da fa                    # e0fa |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e0fe |   mov SP, SP + 0x2
                               #      | _Z_call_104:
e8 fe 00 f8 4e 00              # e102 |   jeq G, 0, ${_cleanup_fn_handle_show_img}:rel + PC
                               #      | _A_if_94:
ee e0 00 f8 12 fa 15 00        # e108 |   jne [${var__g_has_sd_card}], 0, ${_E_if_94}:rel + PC
                               #      | _A_call_105:
e0 e0 3e ef                    # e110 |   push ${const__str__NO_SD__endl}
5c f8 ed f0                    # e114 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e118 |   mov SP, SP + 0x2
                               #      | _Z_call_105:
dc                             # e11c |   ret
                               #      | _E_if_94:
                               #      | _C_if_94:
                               #      | _Z_if_94:
                               #      | _A_call_110:
e2 e0 06 fa                    # e11d |   push [${var__g_args} + 0002]
e2 e0 04 fa                    # e121 |   push [${var__g_args}]
5c f8 2c 00                    # e125 |   call ${fn_display_image}:rel + PC
60 a0 bc 04                    # e129 |   mov SP, SP + 0x4
                               #      | _Z_call_110:
                               #      | _A_if_99:
ec fe 1c f8 01 17 00           # e12d |   jne G, 0x1, ${_E_if_99}:rel + PC
                               #      | _A_call_111:
e0 e0 45 ef                    # e134 |   push ${const__str__SHOW_IMG_OK__endl}
5c f8 c9 f0                    # e138 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e13c |   mov SP, SP + 0x2
                               #      | _Z_call_111:
58 f8 10 00                    # e140 |   jmp ${_C_if_99}:rel + PC
                               #      | _E_if_99:
                               #      | _A_call_112:
e0 e0 52 ef                    # e144 |   push ${const__str__SHOW_IMG_ERROR__endl}
5c f8 b9 f0                    # e148 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e14c |   mov SP, SP + 0x2
                               #      | _Z_call_112:
                               #      | _C_if_99:
                               #      | _Z_if_99:
                               #      | _cleanup_fn_handle_show_img:
dc                             # e150 |   ret
                               #      | _end_fn_handle_show_img:
                               #      | 
                               #      | fn_display_image:
                               #      | _begin_fn_display_image:
e0 80                          # e151 |   push D
e0 60                          # e153 |   push C
e0 40                          # e155 |   push B
e0 20                          # e157 |   push A
60 a0 f4 f0 fd                 # e159 |   mov SP, 0xfdf0 + SP
a9 60 f4 1c 1c 02 08           # e15e |   shl C, [0x21c + SP], 0x8
                               #      | _A_call_106:
e0 60                          # e165 |   push C
e2 f4 1c 02                    # e167 |   push [0x21c + SP]
e0 e0 00 02                    # e16b |   push 0x200
e0 bc 06                       # e16f |   push SP + 0x6
5c f8 cc f4                    # e172 |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # e176 |   mov SP, SP + 0x8
                               #      | _Z_call_106:
e8 fe 00 f8 a6 00              # e17a |   jeq G, 0, ${_cleanup_fn_display_image}:rel + PC
                               #      | _A_if_96:
ea a0 e0 f8 a6 3a 0f 00        # e180 |   jeq [SP], 0x3aa6, ${_E_if_96}:rel + PC
60 fe 00                       # e188 |   mov G, 0
58 f8 95 00                    # e18b |   jmp ${_cleanup_fn_display_image}:rel + PC
                               #      | _E_if_96:
                               #      | _C_if_96:
                               #      | _Z_if_96:
60 20 e0 a0 00                 # e18f |   mov A, 0xa0
60 40 00                       # e194 |   mov B, 0
54 e0 e0 1c 00 01 00 03 04     # e197 |   mmap 0x100, 0x300, 0x4
                               #      | _A_call_107:
e0 1c 30                       # e1a0 |   push 0x30
e0 bc 18                       # e1a3 |   push SP + 0x18
e0 e0 00 01                    # e1a6 |   push 0x100
5c f8 e7 f1                    # e1aa |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # e1ae |   mov SP, SP + 0x6
                               #      | _Z_call_107:
60 20 e0 a1 00                 # e1b2 |   mov A, 0xa1
60 40 00                       # e1b7 |   mov B, 0
                               #      | _A_for_20:
c4 80 00                       # e1ba |   inc D, 0
                               #      | _BA_for_20:
fc 80 e0 f8 e2 00 63 00        # e1bd |   jge D, 0xe2, ${_C_for_20}:rel + PC
                               #      | _A_call_108:
e0 70                          # e1c5 |   push C + D
e2 f4 1c 02                    # e1c7 |   push [0x21c + SP]
e0 e0 00 02                    # e1cb |   push 0x200
e0 bc 06                       # e1cf |   push SP + 0x6
5c f8 6c f4                    # e1d2 |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # e1d6 |   mov SP, SP + 0x8
                               #      | _Z_call_108:
e8 fe 00 f8 46 00              # e1da |   jeq G, 0, ${_cleanup_fn_display_image}:rel + PC
54 e0 e0 1c 00 01 00 03 04     # e1e0 |   mmap 0x100, 0x300, 0x4
                               #      | _A_call_109:
e0 e0 00 02                    # e1e9 |   push 0x200
e0 bc 02                       # e1ed |   push SP + 0x2
e0 e0 00 01                    # e1f0 |   push 0x100
5c f8 9d f1                    # e1f4 |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # e1f8 |   mov SP, SP + 0x6
                               #      | _Z_call_109:
ac ff 20 1c 0f                 # e1fc |   and H, A, 0xf
28 ff 1c 01                    # e201 |   shl H, 0x1
                               #      | _A_if_98:
f4 ff 1c f8 07 0f 00           # e205 |   jle H, 0x7, ${_E_if_98}:rel + PC
c4 ff 00                       # e20c |   inc H, 0
60 40 e8 00 02                 # e20f |   mov B, 0x200 + B
                               #      | _E_if_98:
                               #      | _C_if_98:
                               #      | _Z_if_98:
b0 20 e0 ff a0 00              # e214 |   or A, 0xa0, H
                               #      | _BZ_for_20:
44 80                          # e21a |   inc D
58 f8 a1 ff                    # e21c |   jmp ${_BA_for_20}:rel + PC
                               #      | _C_for_20:
                               #      | _Z_for_20:
                               #      | _cleanup_fn_display_image:
d4 1c 04                       # e220 |   umap 0x4
60 a0 f4 10 02                 # e223 |   mov SP, 0x210 + SP
e4 20                          # e228 |   pop A
e4 40                          # e22a |   pop B
e4 60                          # e22c |   pop C
e4 80                          # e22e |   pop D
dc                             # e230 |   ret
                               #      | _end_fn_display_image:
                               #      | 
                               #      | fn_handle_erase_sd:
                               #      | _begin_fn_handle_erase_sd:
                               #      | _A_call_113:
e0 1c 02                       # e231 |   push 0x2
5c f8 a0 f9                    # e234 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e238 |   mov SP, SP + 0x2
                               #      | _Z_call_113:
e8 fe 00 f8 3d 00              # e23c |   jeq G, 0, ${_cleanup_fn_handle_erase_sd}:rel + PC
                               #      | _A_call_114:
e2 e0 06 fa                    # e242 |   push [${var__g_args} + 0002]
e2 e0 04 fa                    # e246 |   push [${var__g_args}]
e0 00                          # e24a |   push 0
e0 00                          # e24c |   push 0
5c f8 0f f5                    # e24e |   call ${fn_write_sd}:rel + PC
60 a0 bc 08                    # e252 |   mov SP, SP + 0x8
                               #      | _Z_call_114:
                               #      | _A_if_101:
ec fe 1c f8 01 17 00           # e256 |   jne G, 0x1, ${_E_if_101}:rel + PC
                               #      | _A_call_115:
e0 e0 62 ef                    # e25d |   push ${const__str__ERASE_SD_OK__endl}
5c f8 a0 ef                    # e261 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e265 |   mov SP, SP + 0x2
                               #      | _Z_call_115:
58 f8 10 00                    # e269 |   jmp ${_C_if_101}:rel + PC
                               #      | _E_if_101:
                               #      | _A_call_116:
e0 e0 6f ef                    # e26d |   push ${const__str__ERASE_SD_ERROR__endl}
5c f8 90 ef                    # e271 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e275 |   mov SP, SP + 0x2
                               #      | _Z_call_116:
                               #      | _C_if_101:
                               #      | _Z_if_101:
                               #      | _cleanup_fn_handle_erase_sd:
dc                             # e279 |   ret
                               #      | _end_fn_handle_erase_sd:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # e27a |   push B
e0 20                          # e27c |   push A
60 20 e0 fd 00                 # e27e |   mov A, 0xfd
60 40 00                       # e283 |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # e286 |   mmap 0xff00, -1, 0x2
62 e0 e0 1e ff 0c e3           # e28e |   mov [0xff1e], ${fn_syscall_entry}
                               #      | _A_call_117:
e0 e0 a3 ef                    # e295 |   push ${const__data_11}
5c f8 68 ef                    # e299 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e29d |   mov SP, SP + 0x2
                               #      | _Z_call_117:
                               #      | _A_call_121:
5c f8 7f 00                    # e2a1 |   call ${fn_init_sd_and_oled}:rel + PC
                               #      | _Z_call_121:
                               #      | _A_call_125:
5c f8 8d 00                    # e2a5 |   call ${fn_display_default_oled_screen}:rel + PC
                               #      | _Z_call_125:
ca e0 00 14 fa                 # e2a9 |   dec [${var__g_sd_slot}], 0
62 e0 00 18 fa                 # e2ae |   mov [${var__g_last_button_state}], 0
                               #      | _A_call_130:
5c f8 c1 00                    # e2b3 |   call ${fn_check_persisted_target}:rel + PC
                               #      | _Z_call_130:
                               #      | _A_if_108:
ee e0 1c f8 12 fa 01 18 00     # e2b7 |   jne [${var__g_has_sd_card}], 0x1, ${_E_if_108}:rel + PC
                               #      | _A_call_132:
5c f8 18 01                    # e2c0 |   call ${fn_display_splash_screen}:rel + PC
                               #      | _Z_call_132:
                               #      | _A_call_133:
e0 1c 2d                       # e2c4 |   push 0x2d
5c f8 91 fb                    # e2c7 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # e2cb |   mov SP, SP + 0x2
                               #      | _Z_call_133:
                               #      | _E_if_108:
                               #      | _C_if_108:
                               #      | _Z_if_108:
                               #      | _A_call_134:
e0 e0 f4 ef                    # e2cf |   push ${const__str__READY__endl}
5c f8 2e ef                    # e2d3 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e2d7 |   mov SP, SP + 0x2
                               #      | _Z_call_134:
c6 e0 00 0a ff                 # e2db |   inc [0xff0a], 0
                               #      | _A_loop_12:
                               #      | _BA_loop_12:
                               #      | _A_call_182:
5c f8 06 01                    # e2e0 |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_182:
46 e0 0a ff                    # e2e4 |   inc [0xff0a]
60 20 ff                       # e2e8 |   mov A, H
                               #      | _A_if_172:
ec fe 00 f8 0a 00              # e2eb |   jne G, 0, ${_E_if_172}:rel + PC
58 f8 ef ff                    # e2f1 |   jmp ${_BA_loop_12}:rel + PC
                               #      | _E_if_172:
                               #      | _C_if_172:
                               #      | _Z_if_172:
60 40 21                       # e2f5 |   mov B, A*2
60 40 e8 7d ef                 # e2f8 |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # e2fd |   push A
5e 40                          # e2ff |   call [B]
e4 20                          # e301 |   pop A
                               #      | _BZ_loop_12:
58 f8 dd ff                    # e303 |   jmp ${_BA_loop_12}:rel + PC
                               #      | _C_loop_12:
                               #      | _Z_loop_12:
                               #      | _cleanup_fn_main:
e4 20                          # e307 |   pop A
e4 40                          # e309 |   pop B
dc                             # e30b |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_103:
f0 ff 1c f8 1f 08 00           # e30c |   jlt H, 0x1f, ${_E_if_103}:rel + PC
dc                             # e313 |   ret
                               #      | _E_if_103:
                               #      | _C_if_103:
                               #      | _Z_if_103:
28 ff 1c 01                    # e314 |   shl H, 0x1
00 ff e0 0e ee                 # e318 |   add H, ${const__SYSCALL_MAP}
5a ff                          # e31d |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # e31f |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_init_sd_and_oled:
                               #      | _begin_fn_init_sd_and_oled:
                               #      | _A_call_118:
5c f8 02 f5                    # e320 |   call ${fn_init_sd_head}:rel + PC
                               #      | _Z_call_118:
                               #      | _A_call_119:
5c f8 75 f5                    # e324 |   call ${fn_init_oled}:rel + PC
                               #      | _Z_call_119:
                               #      | _A_call_120:
5c f8 25 f5                    # e328 |   call ${fn_init_sd_tail}:rel + PC
                               #      | _Z_call_120:
62 e0 fe 12 fa                 # e32c |   mov [${var__g_has_sd_card}], G
                               #      | _cleanup_fn_init_sd_and_oled:
dc                             # e331 |   ret
                               #      | _end_fn_init_sd_and_oled:
                               #      | 
                               #      | fn_display_default_oled_screen:
                               #      | _begin_fn_display_default_oled_screen:
                               #      | _A_call_122:
e0 e0 d2 ef                    # e332 |   push ${const__str__Weeekly}
e0 00                          # e336 |   push 0
e0 00                          # e338 |   push 0
5c f8 ab f7                    # e33a |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # e33e |   mov SP, SP + 0x6
                               #      | _Z_call_122:
                               #      | _A_call_123:
e0 e0 da ef                    # e342 |   push ${const__data_12}
e0 00                          # e346 |   push 0
e0 1c 01                       # e348 |   push 0x1
5c f8 9a f7                    # e34b |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # e34f |   mov SP, SP + 0x6
                               #      | _Z_call_123:
60 ff 1c 53                    # e353 |   mov H, 0x53
                               #      | _A_if_104:
ee e0 00 f8 12 fa 0c 00        # e357 |   jne [${var__g_has_sd_card}], 0, ${_E_if_104}:rel + PC
60 ff 1c 2d                    # e35f |   mov H, 0x2d
                               #      | _E_if_104:
                               #      | _C_if_104:
                               #      | _Z_if_104:
                               #      | _A_call_124:
e0 ff                          # e363 |   push H
e0 1c 06                       # e365 |   push 0x6
e0 1c 01                       # e368 |   push 0x1
5c f8 d3 f6                    # e36b |   call ${fn_draw_char_oled}:rel + PC
60 a0 bc 06                    # e36f |   mov SP, SP + 0x6
                               #      | _Z_call_124:
                               #      | _cleanup_fn_display_default_oled_screen:
dc                             # e373 |   ret
                               #      | _end_fn_display_default_oled_screen:
                               #      | 
                               #      | fn_check_persisted_target:
                               #      | _begin_fn_check_persisted_target:
e0 40                          # e374 |   push B
e0 20                          # e376 |   push A
61 20 e0 1c ff                 # e378 |   mov A, [0xff1c]
                               #      | _A_scope_8:
                               #      | _B_scope_8:
e8 20 00 f8 56 00              # e37d |   jeq A, 0, ${_C_scope_8}:rel + PC
e8 20 e0 f8 00 d0 50 00        # e383 |   jeq A, 0xd000, ${_C_scope_8}:rel + PC
61 40 e0 0c ff                 # e38b |   mov B, [0xff0c]
2c 40 e0 00 01                 # e390 |   and B, 0x100
                               #      | _A_if_107:
e8 40 00 f8 21 00              # e395 |   jeq B, 0, ${_E_if_107}:rel + PC
                               #      | _A_call_126:
e0 e0 e1 ef                    # e39b |   push ${const__str__FORCED_BOOTLOADER__endl}
5c f8 94 ec                    # e39f |   call ${fn_printf}:rel + PC
60 a0 bc 02                    # e3a3 |   mov SP, SP + 0x2
                               #      | _Z_call_126:
                               #      | _A_call_127:
e0 1c 46                       # e3a7 |   push 0x46
5c f8 ae fa                    # e3aa |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # e3ae |   mov SP, SP + 0x2
                               #      | _Z_call_127:
58 f8 21 00                    # e3b2 |   jmp ${_C_scope_8}:rel + PC
                               #      | _E_if_107:
                               #      | _C_if_107:
                               #      | _Z_if_107:
                               #      | _A_call_128:
e0 20                          # e3b6 |   push A
e0 e0 c0 ee                    # e3b8 |   push ${const__data_5}
5c f8 77 ec                    # e3bc |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e3c0 |   mov SP, SP + 0x4
                               #      | _Z_call_128:
                               #      | _A_call_129:
e0 1c 50                       # e3c4 |   push 0x50
5c f8 91 fa                    # e3c7 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # e3cb |   mov SP, SP + 0x2
                               #      | _Z_call_129:
58 f8 a1 fa                    # e3cf |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_8:
                               #      | _Z_scope_8:
                               #      | _cleanup_fn_check_persisted_target:
e4 20                          # e3d3 |   pop A
e4 40                          # e3d5 |   pop B
dc                             # e3d7 |   ret
                               #      | _end_fn_check_persisted_target:
                               #      | 
                               #      | fn_display_splash_screen:
                               #      | _begin_fn_display_splash_screen:
                               #      | _A_call_131:
e0 00                          # e3d8 |   push 0
e0 1c 02                       # e3da |   push 0x2
5c f8 74 fd                    # e3dd |   call ${fn_display_image}:rel + PC
60 a0 bc 04                    # e3e1 |   mov SP, SP + 0x4
                               #      | _Z_call_131:
                               #      | _cleanup_fn_display_splash_screen:
dc                             # e3e5 |   ret
                               #      | _end_fn_display_splash_screen:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # e3e6 |   push D
e0 60                          # e3e8 |   push C
e0 40                          # e3ea |   push B
e0 20                          # e3ec |   push A
60 a0 bc fe                    # e3ee |   mov SP, SP + -2
62 a0 00                       # e3f2 |   mov [SP], 0
60 a0 bc de                    # e3f5 |   mov SP, SP + -34
62 a0 00                       # e3f9 |   mov [SP], 0
60 20 a0                       # e3fc |   mov A, SP
                               #      | _A_loop_13:
                               #      | _BA_loop_13:
                               #      | _A_call_135:
5c f8 31 01                    # e3ff |   call ${fn_getc_nonblocking}:rel + PC
                               #      | _Z_call_135:
                               #      | _A_if_110:
ec fe 00 f8 0e 00              # e403 |   jne G, 0, ${_E_if_110}:rel + PC
                               #      | _A_call_155:
5c f8 41 01                    # e409 |   call ${fn_check_button_pressed}:rel + PC
                               #      | _Z_call_155:
58 f8 f2 ff                    # e40d |   jmp ${_BA_loop_13}:rel + PC
                               #      | _E_if_110:
                               #      | _C_if_110:
                               #      | _Z_if_110:
60 60 ff                       # e411 |   mov C, H
62 e0 60 00 ff                 # e414 |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # e419 |   jeq C, 0xa, ${_C_loop_13}:rel + PC
e8 60 1c f8 0d 29 00           # e420 |   jeq C, 0xd, ${_C_loop_13}:rel + PC
                               #      | _A_if_129:
f0 20 bc f8 1f 19 00           # e427 |   jlt A, SP + 0x1f, ${_E_if_129}:rel + PC
                               #      | _A_call_156:
e0 e0 15 f0                    # e42e |   push ${const__data_15}
5c f8 cf ed                    # e432 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e436 |   mov SP, SP + 0x2
                               #      | _Z_call_156:
e8 ff 00 f8 e3 00              # e43a |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_129:
                               #      | _C_if_129:
                               #      | _Z_if_129:
62 20 60                       # e440 |   mov [A], C
44 20                          # e443 |   inc A
                               #      | _BZ_loop_13:
58 f8 ba ff                    # e445 |   jmp ${_BA_loop_13}:rel + PC
                               #      | _C_loop_13:
                               #      | _Z_loop_13:
                               #      | _A_call_157:
e0 1c 20                       # e449 |   push 0x20
e0 bc 02                       # e44c |   push SP + 0x2
5c f8 f4 ef                    # e44f |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # e453 |   mov SP, SP + 0x4
                               #      | _Z_call_157:
60 60 ff                       # e457 |   mov C, H
                               #      | _A_if_131:
e8 60 00 f8 0f 00              # e45a |   jeq C, 0, ${_E_if_131}:rel + PC
66 60 00                       # e460 |   bmov [C], 0
44 60                          # e463 |   inc C
58 f8 08 00                    # e465 |   jmp ${_C_if_131}:rel + PC
                               #      | _E_if_131:
60 60 1c ff                    # e469 |   mov C, -1
                               #      | _C_if_131:
                               #      | _Z_if_131:
                               #      | _A_call_176:
e0 a0                          # e46d |   push SP
5c f8 e7 02                    # e46f |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # e473 |   mov SP, SP + 0x2
                               #      | _Z_call_176:
                               #      | _A_if_168:
ec ff 00 f8 16 00              # e477 |   jne H, 0, ${_E_if_168}:rel + PC
                               #      | _A_call_177:
e0 e0 af f0                    # e47d |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 80 ed                    # e481 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e485 |   mov SP, SP + 0x2
                               #      | _Z_call_177:
58 f8 94 00                    # e489 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_168:
                               #      | _C_if_168:
                               #      | _Z_if_168:
62 bc ff 22                    # e48d |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 02 fa                 # e491 |   mov [${var__g_num_args}], 0
                               #      | _A_while_12:
                               #      | _BA_while_12:
fc 60 bc f8 20 7c 00           # e496 |   jge C, SP + 0x20, ${_C_while_12}:rel + PC
                               #      | _A_call_178:
e0 1c 20                       # e49d |   push 0x20
e0 60                          # e4a0 |   push C
5c f8 a1 ef                    # e4a2 |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # e4a6 |   mov SP, SP + 0x4
                               #      | _Z_call_178:
60 80 ff                       # e4aa |   mov D, H
                               #      | _A_if_169:
e8 80 00 f8 0d 00              # e4ad |   jeq D, 0, ${_E_if_169}:rel + PC
66 80 00                       # e4b3 |   bmov [D], 0
58 f8 08 00                    # e4b6 |   jmp ${_C_if_169}:rel + PC
                               #      | _E_if_169:
60 80 1c fe                    # e4ba |   mov D, -2
                               #      | _C_if_169:
                               #      | _Z_if_169:
61 20 e0 02 fa                 # e4be |   mov A, [${var__g_num_args}]
                               #      | _A_if_170:
f0 20 1c f8 06 17 00           # e4c3 |   jlt A, 0x6, ${_E_if_170}:rel + PC
                               #      | _A_call_179:
e0 e0 c0 f0                    # e4ca |   push ${const__data_16}
5c f8 33 ed                    # e4ce |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e4d2 |   mov SP, SP + 0x2
                               #      | _Z_call_179:
58 f8 47 00                    # e4d6 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_170:
                               #      | _C_if_170:
                               #      | _Z_if_170:
                               #      | _A_call_180:
e0 60                          # e4da |   push C
5c f8 2c ee                    # e4dc |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # e4e0 |   mov SP, SP + 0x2
                               #      | _Z_call_180:
                               #      | _A_if_171:
ec fe 00 f8 18 00              # e4e4 |   jne G, 0, ${_E_if_171}:rel + PC
                               #      | _A_call_181:
e0 20                          # e4ea |   push A
e0 e0 d5 f0                    # e4ec |   push ${const__data_17}
5c f8 43 eb                    # e4f0 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e4f4 |   mov SP, SP + 0x4
                               #      | _Z_call_181:
58 f8 25 00                    # e4f8 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_171:
                               #      | _C_if_171:
                               #      | _Z_if_171:
a8 40 20 1c 01                 # e4fc |   shl B, A, 0x1
62 e8 ff 04 fa                 # e501 |   mov [${var__g_args} + B], H
c6 e0 20 02 fa                 # e506 |   inc [${var__g_num_args}], A
c4 60 80                       # e50b |   inc C, D
                               #      | _BZ_while_12:
58 f8 88 ff                    # e50e |   jmp ${_BA_while_12}:rel + PC
                               #      | _C_while_12:
                               #      | _Z_while_12:
c4 fe 00                       # e512 |   inc G, 0
61 ff bc 22                    # e515 |   mov H, [SP + 0x22]
58 f8 0a 00                    # e519 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # e51d |   mov G, 0
60 ff 00                       # e520 |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # e523 |   mov SP, SP + 0x24
e4 20                          # e527 |   pop A
e4 40                          # e529 |   pop B
e4 60                          # e52b |   pop C
e4 80                          # e52d |   pop D
dc                             # e52f |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_getc_nonblocking:
                               #      | _begin_fn_getc_nonblocking:
61 ff e0 02 ff                 # e530 |   mov H, [0xff02]
ac fe ff e0 00 80              # e535 |   and G, H, 0x8000
e8 fe 00 f8 0e 00              # e53b |   jeq G, 0, ${_cleanup_fn_getc_nonblocking}:rel + PC
2c ff e0 ff 00                 # e541 |   and H, 0xff
c4 fe 00                       # e546 |   inc G, 0
                               #      | _cleanup_fn_getc_nonblocking:
dc                             # e549 |   ret
                               #      | _end_fn_getc_nonblocking:
                               #      | 
                               #      | fn_check_button_pressed:
                               #      | _begin_fn_check_button_pressed:
e0 20                          # e54a |   push A
61 20 e0 0e ff                 # e54c |   mov A, [0xff0e]
e9 20 e0 f8 18 fa 50 00        # e551 |   jeq A, [${var__g_last_button_state}], ${_cleanup_fn_check_button_pressed}:rel + PC
62 e0 20 18 fa                 # e559 |   mov [${var__g_last_button_state}], A
98 fe 20 1c 0c                 # e55e |   getb G, A, 0xc
                               #      | _A_if_112:
e8 fe 00 f8 1c 00              # e563 |   jeq G, 0, ${_E_if_112}:rel + PC
61 fe e0 14 fa                 # e569 |   mov G, [${var__g_sd_slot}]
                               #      | _A_if_113:
f0 fe 00 f8 11 00              # e56e |   jlt G, 0, ${_E_if_113}:rel + PC
48 fe                          # e574 |   dec G
62 e0 fe 14 fa                 # e576 |   mov [${var__g_sd_slot}], G
                               #      | _A_call_144:
5c f8 29 00                    # e57b |   call ${fn_update_code_index_screen}:rel + PC
                               #      | _Z_call_144:
                               #      | _E_if_113:
                               #      | _C_if_113:
                               #      | _Z_if_113:
                               #      | _E_if_112:
                               #      | _C_if_112:
                               #      | _Z_if_112:
98 fe 20 1c 09                 # e57f |   getb G, A, 0x9
                               #      | _A_if_118:
e8 fe 00 f8 0e 00              # e584 |   jeq G, 0, ${_E_if_118}:rel + PC
46 e0 14 fa                    # e58a |   inc [${var__g_sd_slot}]
                               #      | _A_call_145:
5c f8 16 00                    # e58e |   call ${fn_update_code_index_screen}:rel + PC
                               #      | _Z_call_145:
                               #      | _E_if_118:
                               #      | _C_if_118:
                               #      | _Z_if_118:
98 fe 20 1c 08                 # e592 |   getb G, A, 0x8
                               #      | _A_if_119:
e8 fe 00 f8 0a 00              # e597 |   jeq G, 0, ${_E_if_119}:rel + PC
                               #      | _A_call_154:
5c f8 c7 00                    # e59d |   call ${fn_load_code_from_sd}:rel + PC
                               #      | _Z_call_154:
                               #      | _E_if_119:
                               #      | _C_if_119:
                               #      | _Z_if_119:
                               #      | _cleanup_fn_check_button_pressed:
e4 20                          # e5a1 |   pop A
dc                             # e5a3 |   ret
                               #      | _end_fn_check_button_pressed:
                               #      | 
                               #      | fn_update_code_index_screen:
                               #      | _begin_fn_update_code_index_screen:
e0 60                          # e5a4 |   push C
60 a0 f4 f0 fd                 # e5a6 |   mov SP, 0xfdf0 + SP
60 a0 bc f6                    # e5ab |   mov SP, SP + -10
61 60 e0 14 fa                 # e5af |   mov C, [${var__g_sd_slot}]
e8 60 1c f8 ff 94 00           # e5b4 |   jeq C, -1, ${_L_fn_update_code_index_screen_2}:rel + PC
28 60 1c 08                    # e5bb |   shl C, 0x8
                               #      | _A_call_136:
e0 60                          # e5bf |   push C
e0 1c 03                       # e5c1 |   push 0x3
e0 e0 00 02                    # e5c4 |   push 0x200
e0 bc 10                       # e5c8 |   push SP + 0x10
5c f8 73 f0                    # e5cb |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # e5cf |   mov SP, SP + 0x8
                               #      | _Z_call_136:
e8 fe 00 f8 66 00              # e5d3 |   jeq G, 0, ${_L_fn_update_code_index_screen_1}:rel + PC
ee bc e0 f8 0a b6 3b 6f 00     # e5d9 |   jne [SP + 0xa], 0x3bb6, ${_L_fn_update_code_index_screen_2}:rel + PC
63 e0 bc 16 fa 0c              # e5e2 |   mov [${var__g_sd_jmp_target}], [SP + 0xc]
62 bc 00 16                    # e5e8 |   mov [SP + 0x16], 0
                               #      | _A_call_137:
5c f8 c9 f3                    # e5ec |   call ${fn_clear_oled}:rel + PC
                               #      | _Z_call_137:
                               #      | _A_call_138:
e0 bc 0e                       # e5f0 |   push SP + 0xe
e0 00                          # e5f3 |   push 0
e0 00                          # e5f5 |   push 0
5c f8 ee f4                    # e5f7 |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # e5fb |   mov SP, SP + 0x6
                               #      | _Z_call_138:
c5 fe e0 14 fa                 # e5ff |   inc G, [${var__g_sd_slot}]
                               #      | _A_call_139:
e0 a0                          # e604 |   push SP
e0 fe                          # e606 |   push G
5c f8 ac eb                    # e608 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # e60c |   mov SP, SP + 0x4
                               #      | _Z_call_139:
60 fe a0                       # e610 |   mov G, SP
                               #      | _A_loop_14:
                               #      | _BA_loop_14:
65 ff fe                       # e613 |   bmov H, [G]
e8 ff 00 f8 0c 00              # e616 |   jeq H, 0, ${_C_loop_14}:rel + PC
44 fe                          # e61c |   inc G
                               #      | _BZ_loop_14:
58 f8 f5 ff                    # e61e |   jmp ${_BA_loop_14}:rel + PC
                               #      | _C_loop_14:
                               #      | _Z_loop_14:
62 fe 1c 2e                    # e622 |   mov [G], 0x2e
                               #      | _A_call_140:
e0 a0                          # e626 |   push SP
e0 00                          # e628 |   push 0
e0 1c 01                       # e62a |   push 0x1
5c f8 b8 f4                    # e62d |   call ${fn_draw_str_oled}:rel + PC
60 a0 bc 06                    # e631 |   mov SP, SP + 0x6
                               #      | _Z_call_140:
58 f8 27 00                    # e635 |   jmp ${_cleanup_fn_update_code_index_screen}:rel + PC
                               #      | _L_fn_update_code_index_screen_1:
                               #      | _A_call_141:
e0 1c 45                       # e639 |   push 0x45
5c f8 1c f8                    # e63c |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # e640 |   mov SP, SP + 0x2
                               #      | _Z_call_141:
58 f8 18 00                    # e644 |   jmp ${_cleanup_fn_update_code_index_screen}:rel + PC
                               #      | _L_fn_update_code_index_screen_2:
ca e0 00 14 fa                 # e648 |   dec [${var__g_sd_slot}], 0
                               #      | _A_call_142:
5c f8 e5 fc                    # e64d |   call ${fn_display_default_oled_screen}:rel + PC
                               #      | _Z_call_142:
                               #      | _A_call_143:
e0 1c 2d                       # e651 |   push 0x2d
5c f8 04 f8                    # e654 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # e658 |   mov SP, SP + 0x2
                               #      | _Z_call_143:
                               #      | _cleanup_fn_update_code_index_screen:
60 a0 f4 1a 02                 # e65c |   mov SP, 0x21a + SP
e4 60                          # e661 |   pop C
dc                             # e663 |   ret
                               #      | _end_fn_update_code_index_screen:
                               #      | 
                               #      | fn_load_code_from_sd:
                               #      | _begin_fn_load_code_from_sd:
e0 80                          # e664 |   push D
e0 60                          # e666 |   push C
e0 40                          # e668 |   push B
e0 20                          # e66a |   push A
60 a0 f4 f0 fd                 # e66c |   mov SP, 0xfdf0 + SP
61 60 e0 14 fa                 # e671 |   mov C, [${var__g_sd_slot}]
e8 60 1c f8 ff d2 00           # e676 |   jeq C, -1, ${_cleanup_fn_load_code_from_sd}:rel + PC
                               #      | _A_call_146:
e0 1c 2d                       # e67d |   push 0x2d
5c f8 d8 f7                    # e680 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # e684 |   mov SP, SP + 0x2
                               #      | _Z_call_146:
28 60 1c 08                    # e688 |   shl C, 0x8
                               #      | _A_for_21:
c4 40 00                       # e68c |   inc B, 0
                               #      | _BA_for_21:
fc 40 e0 f8 00 01 6a 00        # e68f |   jge B, 0x100, ${_C_for_21}:rel + PC
                               #      | _A_call_147:
e0 4c                          # e697 |   push B + C
e0 1c 03                       # e699 |   push 0x3
e0 e0 00 02                    # e69c |   push 0x200
e0 bc 06                       # e6a0 |   push SP + 0x6
5c f8 9b ef                    # e6a3 |   call ${fn_read_sd}:rel + PC
60 a0 bc 08                    # e6a7 |   mov SP, SP + 0x8
                               #      | _Z_call_147:
e8 fe 00 f8 8e 00              # e6ab |   jeq G, 0, ${_L_fn_load_code_from_sd_1}:rel + PC
61 20 a0                       # e6b1 |   mov A, [SP]
61 80 bc 02                    # e6b4 |   mov D, [SP + 0x2]
                               #      | _A_scope_9:
                               #      | _B_scope_9:
ec 20 00 f8 10 00              # e6b8 |   jne A, 0, ${_C_scope_9}:rel + PC
ec 80 00 f8 0a 00              # e6be |   jne D, 0, ${_C_scope_9}:rel + PC
58 f8 35 00                    # e6c4 |   jmp ${_C_for_21}:rel + PC
                               #      | _C_scope_9:
                               #      | _Z_scope_9:
84 fe 80 20                    # e6c8 |   sub G, D, A
f8 fe e0 f8 fc 01 6d 00        # e6cc |   jgt G, 0x1fc, ${_L_fn_load_code_from_sd_1}:rel + PC
                               #      | _A_call_148:
e0 fe                          # e6d4 |   push G
e0 bc 06                       # e6d6 |   push SP + 0x6
e0 20                          # e6d9 |   push A
5c f8 b6 ec                    # e6db |   call ${fn_memcpy}:rel + PC
60 a0 bc 06                    # e6df |   mov SP, SP + 0x6
                               #      | _Z_call_148:
                               #      | _A_call_149:
e0 80                          # e6e3 |   push D
e0 20                          # e6e5 |   push A
e0 e0 fb ef                    # e6e7 |   push ${const__data_13}
5c f8 48 e9                    # e6eb |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # e6ef |   mov SP, SP + 0x6
                               #      | _Z_call_149:
                               #      | _BZ_for_21:
44 40                          # e6f3 |   inc B
58 f8 9a ff                    # e6f5 |   jmp ${_BA_for_21}:rel + PC
                               #      | _C_for_21:
                               #      | _Z_for_21:
e8 40 e0 f8 00 01 40 00        # e6f9 |   jeq B, 0x100, ${_L_fn_load_code_from_sd_1}:rel + PC
99 fe e0 1c 0c ff 0a           # e701 |   getb G, [0xff0c], 0xa
                               #      | _A_if_126:
ec fe 00 f8 2d 00              # e708 |   jne G, 0, ${_E_if_126}:rel + PC
                               #      | _A_call_150:
e0 1c 52                       # e70e |   push 0x52
5c f8 47 f7                    # e711 |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # e715 |   mov SP, SP + 0x2
                               #      | _Z_call_150:
                               #      | _A_call_151:
e2 e0 16 fa                    # e719 |   push [${var__g_sd_jmp_target}]
e0 e0 0a f0                    # e71d |   push ${const__data_14}
5c f8 12 e9                    # e721 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e725 |   mov SP, SP + 0x4
                               #      | _Z_call_151:
                               #      | _A_call_152:
e2 e0 16 fa                    # e729 |   push [${var__g_sd_jmp_target}]
5c f8 3d f7                    # e72d |   call ${fn_jmp_to_target_persisted}:rel + PC
60 a0 bc 02                    # e731 |   mov SP, SP + 0x2
                               #      | _Z_call_152:
                               #      | _E_if_126:
                               #      | _C_if_126:
                               #      | _Z_if_126:
58 f8 13 00                    # e735 |   jmp ${_cleanup_fn_load_code_from_sd}:rel + PC
                               #      | _L_fn_load_code_from_sd_1:
                               #      | _A_call_153:
e0 1c 45                       # e739 |   push 0x45
5c f8 1c f7                    # e73c |   call ${fn_show_status}:rel + PC
60 a0 bc 02                    # e740 |   mov SP, SP + 0x2
                               #      | _Z_call_153:
58 f8 04 00                    # e744 |   jmp ${_cleanup_fn_load_code_from_sd}:rel + PC
                               #      | _cleanup_fn_load_code_from_sd:
60 a0 f4 10 02                 # e748 |   mov SP, 0x210 + SP
e4 20                          # e74d |   pop A
e4 40                          # e74f |   pop B
e4 60                          # e751 |   pop C
e4 80                          # e753 |   pop D
dc                             # e755 |   ret
                               #      | _end_fn_load_code_from_sd:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # e756 |   push A
61 20 bc 04                    # e758 |   mov A, [SP + 0x4]
                               #      | _A_call_158:
e0 e0 27 f0                    # e75c |   push ${const__str__PING}
e0 20                          # e760 |   push A
5c f8 8f ec                    # e762 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e766 |   mov SP, SP + 0x4
                               #      | _Z_call_158:
                               #      | _A_if_133:
ec ff 00 f8 0d 00              # e76a |   jne H, 0, ${_E_if_133}:rel + PC
c4 ff 00                       # e770 |   inc H, 0
58 f8 e3 01                    # e773 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_133:
                               #      | _C_if_133:
                               #      | _Z_if_133:
                               #      | _A_call_159:
e0 e0 2c f0                    # e777 |   push ${const__str__READ}
e0 20                          # e77b |   push A
5c f8 74 ec                    # e77d |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e781 |   mov SP, SP + 0x4
                               #      | _Z_call_159:
                               #      | _A_if_135:
ec ff 00 f8 0e 00              # e785 |   jne H, 0, ${_E_if_135}:rel + PC
60 ff 1c 02                    # e78b |   mov H, 0x2
58 f8 c7 01                    # e78f |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_135:
                               #      | _C_if_135:
                               #      | _Z_if_135:
                               #      | _A_call_160:
e0 e0 31 f0                    # e793 |   push ${const__str__WRITE}
e0 20                          # e797 |   push A
5c f8 58 ec                    # e799 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e79d |   mov SP, SP + 0x4
                               #      | _Z_call_160:
                               #      | _A_if_137:
ec ff 00 f8 0e 00              # e7a1 |   jne H, 0, ${_E_if_137}:rel + PC
60 ff 1c 03                    # e7a7 |   mov H, 0x3
58 f8 ab 01                    # e7ab |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_137:
                               #      | _C_if_137:
                               #      | _Z_if_137:
                               #      | _A_call_161:
e0 e0 37 f0                    # e7af |   push ${const__str__READB}
e0 20                          # e7b3 |   push A
5c f8 3c ec                    # e7b5 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e7b9 |   mov SP, SP + 0x4
                               #      | _Z_call_161:
                               #      | _A_if_139:
ec ff 00 f8 0e 00              # e7bd |   jne H, 0, ${_E_if_139}:rel + PC
60 ff 1c 04                    # e7c3 |   mov H, 0x4
58 f8 8f 01                    # e7c7 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_139:
                               #      | _C_if_139:
                               #      | _Z_if_139:
                               #      | _A_call_162:
e0 e0 3d f0                    # e7cb |   push ${const__str__WRITEB}
e0 20                          # e7cf |   push A
5c f8 20 ec                    # e7d1 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e7d5 |   mov SP, SP + 0x4
                               #      | _Z_call_162:
                               #      | _A_if_141:
ec ff 00 f8 0e 00              # e7d9 |   jne H, 0, ${_E_if_141}:rel + PC
60 ff 1c 05                    # e7df |   mov H, 0x5
58 f8 73 01                    # e7e3 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_141:
                               #      | _C_if_141:
                               #      | _Z_if_141:
                               #      | _A_call_163:
e0 e0 44 f0                    # e7e7 |   push ${const__str__JMP}
e0 20                          # e7eb |   push A
5c f8 04 ec                    # e7ed |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e7f1 |   mov SP, SP + 0x4
                               #      | _Z_call_163:
                               #      | _A_if_143:
ec ff 00 f8 0e 00              # e7f5 |   jne H, 0, ${_E_if_143}:rel + PC
60 ff 1c 06                    # e7fb |   mov H, 0x6
58 f8 57 01                    # e7ff |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_143:
                               #      | _C_if_143:
                               #      | _Z_if_143:
                               #      | _A_call_164:
e0 e0 48 f0                    # e803 |   push ${const__str__JMP_PERSIST}
e0 20                          # e807 |   push A
5c f8 e8 eb                    # e809 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e80d |   mov SP, SP + 0x4
                               #      | _Z_call_164:
                               #      | _A_if_145:
ec ff 00 f8 0e 00              # e811 |   jne H, 0, ${_E_if_145}:rel + PC
60 ff 1c 07                    # e817 |   mov H, 0x7
58 f8 3b 01                    # e81b |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_145:
                               #      | _C_if_145:
                               #      | _Z_if_145:
                               #      | _A_call_165:
e0 e0 54 f0                    # e81f |   push ${const__str__INIT_SD}
e0 20                          # e823 |   push A
5c f8 cc eb                    # e825 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e829 |   mov SP, SP + 0x4
                               #      | _Z_call_165:
                               #      | _A_if_147:
ec ff 00 f8 0e 00              # e82d |   jne H, 0, ${_E_if_147}:rel + PC
60 ff 1c 08                    # e833 |   mov H, 0x8
58 f8 1f 01                    # e837 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_147:
                               #      | _C_if_147:
                               #      | _Z_if_147:
                               #      | _A_call_166:
e0 e0 5c f0                    # e83b |   push ${const__str__READ_SD}
e0 20                          # e83f |   push A
5c f8 b0 eb                    # e841 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e845 |   mov SP, SP + 0x4
                               #      | _Z_call_166:
                               #      | _A_if_149:
ec ff 00 f8 0e 00              # e849 |   jne H, 0, ${_E_if_149}:rel + PC
60 ff 1c 09                    # e84f |   mov H, 0x9
58 f8 03 01                    # e853 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_149:
                               #      | _C_if_149:
                               #      | _Z_if_149:
                               #      | _A_call_167:
e0 e0 64 f0                    # e857 |   push ${const__str__INIT_OLED}
e0 20                          # e85b |   push A
5c f8 94 eb                    # e85d |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e861 |   mov SP, SP + 0x4
                               #      | _Z_call_167:
                               #      | _A_if_151:
ec ff 00 f8 0e 00              # e865 |   jne H, 0, ${_E_if_151}:rel + PC
60 ff 1c 0a                    # e86b |   mov H, 0xa
58 f8 e7 00                    # e86f |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_151:
                               #      | _C_if_151:
                               #      | _Z_if_151:
                               #      | _A_call_168:
e0 e0 6e f0                    # e873 |   push ${const__str__READW}
e0 20                          # e877 |   push A
5c f8 78 eb                    # e879 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e87d |   mov SP, SP + 0x4
                               #      | _Z_call_168:
                               #      | _A_if_153:
ec ff 00 f8 0e 00              # e881 |   jne H, 0, ${_E_if_153}:rel + PC
60 ff 1c 0b                    # e887 |   mov H, 0xb
58 f8 cb 00                    # e88b |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_153:
                               #      | _C_if_153:
                               #      | _Z_if_153:
                               #      | _A_call_169:
e0 e0 74 f0                    # e88f |   push ${const__str__DEINIT_OLED}
e0 20                          # e893 |   push A
5c f8 5c eb                    # e895 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e899 |   mov SP, SP + 0x4
                               #      | _Z_call_169:
                               #      | _A_if_155:
ec ff 00 f8 0e 00              # e89d |   jne H, 0, ${_E_if_155}:rel + PC
60 ff 1c 0c                    # e8a3 |   mov H, 0xc
58 f8 af 00                    # e8a7 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_155:
                               #      | _C_if_155:
                               #      | _Z_if_155:
                               #      | _A_call_170:
e0 e0 80 f0                    # e8ab |   push ${const__str__WRITE_SD}
e0 20                          # e8af |   push A
5c f8 40 eb                    # e8b1 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e8b5 |   mov SP, SP + 0x4
                               #      | _Z_call_170:
                               #      | _A_if_157:
ec ff 00 f8 0e 00              # e8b9 |   jne H, 0, ${_E_if_157}:rel + PC
60 ff 1c 0d                    # e8bf |   mov H, 0xd
58 f8 93 00                    # e8c3 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_157:
                               #      | _C_if_157:
                               #      | _Z_if_157:
                               #      | _A_call_171:
e0 e0 89 f0                    # e8c7 |   push ${const__str__MMAP}
e0 20                          # e8cb |   push A
5c f8 24 eb                    # e8cd |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e8d1 |   mov SP, SP + 0x4
                               #      | _Z_call_171:
                               #      | _A_if_159:
ec ff 00 f8 0e 00              # e8d5 |   jne H, 0, ${_E_if_159}:rel + PC
60 ff 1c 0e                    # e8db |   mov H, 0xe
58 f8 77 00                    # e8df |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_159:
                               #      | _C_if_159:
                               #      | _Z_if_159:
                               #      | _A_call_172:
e0 e0 8e f0                    # e8e3 |   push ${const__str__UMAP}
e0 20                          # e8e7 |   push A
5c f8 08 eb                    # e8e9 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e8ed |   mov SP, SP + 0x4
                               #      | _Z_call_172:
                               #      | _A_if_161:
ec ff 00 f8 0e 00              # e8f1 |   jne H, 0, ${_E_if_161}:rel + PC
60 ff 1c 0f                    # e8f7 |   mov H, 0xf
58 f8 5b 00                    # e8fb |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_161:
                               #      | _C_if_161:
                               #      | _Z_if_161:
                               #      | _A_call_173:
e0 e0 93 f0                    # e8ff |   push ${const__str__WRITEB_SD}
e0 20                          # e903 |   push A
5c f8 ec ea                    # e905 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e909 |   mov SP, SP + 0x4
                               #      | _Z_call_173:
                               #      | _A_if_163:
ec ff 00 f8 0e 00              # e90d |   jne H, 0, ${_E_if_163}:rel + PC
60 ff 1c 10                    # e913 |   mov H, 0x10
58 f8 3f 00                    # e917 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_163:
                               #      | _C_if_163:
                               #      | _Z_if_163:
                               #      | _A_call_174:
e0 e0 9d f0                    # e91b |   push ${const__str__SHOW_IMG}
e0 20                          # e91f |   push A
5c f8 d0 ea                    # e921 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e925 |   mov SP, SP + 0x4
                               #      | _Z_call_174:
                               #      | _A_if_165:
ec ff 00 f8 0e 00              # e929 |   jne H, 0, ${_E_if_165}:rel + PC
60 ff 1c 11                    # e92f |   mov H, 0x11
58 f8 23 00                    # e933 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_165:
                               #      | _C_if_165:
                               #      | _Z_if_165:
                               #      | _A_call_175:
e0 e0 a6 f0                    # e937 |   push ${const__str__ERASE_SD}
e0 20                          # e93b |   push A
5c f8 b4 ea                    # e93d |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # e941 |   mov SP, SP + 0x4
                               #      | _Z_call_175:
                               #      | _A_if_167:
ec ff 00 f8 0e 00              # e945 |   jne H, 0, ${_E_if_167}:rel + PC
60 ff 1c 12                    # e94b |   mov H, 0x12
58 f8 07 00                    # e94f |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_167:
                               #      | _C_if_167:
                               #      | _Z_if_167:
60 ff 00                       # e953 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # e956 |   pop A
dc                             # e958 |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # e959 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # ed4e |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
33 d0 9c d1 ae d2 b4 d1 23 d2 79 d2 60 d2 cd d2 08 d3 58 d3 91 d3 ca d3 f1 d3 43 d4 62 d4 69 d4 8c d4 01 d2 2a d5 fc d5 3e d6 5d d7 19 d8 99 d8 ff d9 26 da b5 d9 3e da e5 da 21 db 85 db # ee0e |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12, $fn_read_sd, $fn_write_sd, $fn_init_sd, $fn_init_oled, $fn_deinit_oled, $fn_quick_deinit_oled, $fn_clear_oled, $fn_draw_char_oled, $fn_draw_str_oled, $fn_draw_char, $fn_draw_str]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # ee4c |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # ee70 |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # ee76 |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # ee85 |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # ee92 |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # eea1 |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # eeb1 |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # eec0 |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # eecb |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__str__TIMEOUT__endl:
54 49 4d 45 4f 55 54 0a 00     # eedd |   .data str:"TIMEOUT\n"
                               #      | const__str__INIT_OK__endl:
49 4e 49 54 5f 4f 4b 0a 00     # eee6 |   .data str:"INIT_OK\n"
                               #      | const__data_7:
52 45 41 44 5f 53 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # eeef |   .data str:"READ_SD_OK %x %x\n"
                               #      | const__str__DONE__endl:
44 4f 4e 45 0a 00              # ef01 |   .data str:"DONE\n"
                               #      | const__data_8:
57 52 49 54 45 5f 53 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # ef07 |   .data str:"WRITE_SD_OK %x %x\n"
                               #      | const__data_9:
4d 4d 41 50 5f 4f 4b 20 25 78 20 25 78 20 25 78 20 25 78 20 25 78 0a 00 # ef1a |   .data str:"MMAP_OK %x %x %x %x %x\n"
                               #      | const__data_10:
55 4d 41 50 5f 4f 4b 20 25 78 0a 00 # ef32 |   .data str:"UMAP_OK %x\n"
                               #      | const__str__NO_SD__endl:
4e 4f 5f 53 44 0a 00           # ef3e |   .data str:"NO_SD\n"
                               #      | const__str__SHOW_IMG_OK__endl:
53 48 4f 57 5f 49 4d 47 5f 4f 4b 0a 00 # ef45 |   .data str:"SHOW_IMG_OK\n"
                               #      | const__str__SHOW_IMG_ERROR__endl:
53 48 4f 57 5f 49 4d 47 5f 45 52 52 4f 52 0a 00 # ef52 |   .data str:"SHOW_IMG_ERROR\n"
                               #      | const__str__ERASE_SD_OK__endl:
45 52 41 53 45 5f 53 44 5f 4f 4b 0a 00 # ef62 |   .data str:"ERASE_SD_OK\n"
                               #      | const__str__ERASE_SD_ERROR__endl:
45 52 41 53 45 5f 53 44 5f 45 52 52 4f 52 0a 00 # ef6f |   .data str:"ERASE_SD_ERROR\n"
                               #      | const__HANDLER_MAP:
bd db f7 db 0b dd f7 db 0b dd fd dd fd dd 90 de b7 de 56 df f7 db 67 df 78 df 6b e0 ca e0 78 df f7 e0 31 e2 # ef7f |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp, $fn_handle_init_sd, $fn_handle_read_sd, $fn_handle_init_oled, $fn_handle_read, $fn_handle_deinit_oled, $fn_handle_write_sd, $fn_handle_mmap, $fn_handle_umap, $fn_handle_write_sd, $fn_handle_show_img, $fn_handle_erase_sd]
                               #      | const__data_11:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 32 2e 30 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 33 2e 36 0a 00 # efa3 |   .data str:"Weeekly3006 - Hardware v2.0 - Bootloader v3.6\n"
                               #      | const__str__Weeekly:
57 65 65 65 6b 6c 79 00        # efd2 |   .data str:"Weeekly"
                               #      | const__data_12:
33 30 30 36 20 36 00           # efda |   .data str:"3006 6"
                               #      | const__str__FORCED_BOOTLOADER__endl:
46 4f 52 43 45 44 5f 42 4f 4f 54 4c 4f 41 44 45 52 0a 00 # efe1 |   .data str:"FORCED_BOOTLOADER\n"
                               #      | const__str__READY__endl:
52 45 41 44 59 0a 00           # eff4 |   .data str:"READY\n"
                               #      | const__data_13:
53 44 5f 4c 4f 41 44 20 25 78 20 25 78 0a 00 # effb |   .data str:"SD_LOAD %x %x\n"
                               #      | const__data_14:
53 44 5f 4a 4d 50 20 25 78 0a 00 # f00a |   .data str:"SD_JMP %x\n"
                               #      | const__data_15:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # f015 |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # f027 |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # f02c |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # f031 |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # f037 |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # f03d |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # f044 |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # f048 |   .data str:"JMP_PERSIST"
                               #      | const__str__INIT_SD:
49 4e 49 54 5f 53 44 00        # f054 |   .data str:"INIT_SD"
                               #      | const__str__READ_SD:
52 45 41 44 5f 53 44 00        # f05c |   .data str:"READ_SD"
                               #      | const__str__INIT_OLED:
49 4e 49 54 5f 4f 4c 45 44 00  # f064 |   .data str:"INIT_OLED"
                               #      | const__str__READW:
52 45 41 44 57 00              # f06e |   .data str:"READW"
                               #      | const__str__DEINIT_OLED:
44 45 49 4e 49 54 5f 4f 4c 45 44 00 # f074 |   .data str:"DEINIT_OLED"
                               #      | const__str__WRITE_SD:
57 52 49 54 45 5f 53 44 00     # f080 |   .data str:"WRITE_SD"
                               #      | const__str__MMAP:
4d 4d 41 50 00                 # f089 |   .data str:"MMAP"
                               #      | const__str__UMAP:
55 4d 41 50 00                 # f08e |   .data str:"UMAP"
                               #      | const__str__WRITEB_SD:
57 52 49 54 45 42 5f 53 44 00  # f093 |   .data str:"WRITEB_SD"
                               #      | const__str__SHOW_IMG:
53 48 4f 57 5f 49 4d 47 00     # f09d |   .data str:"SHOW_IMG"
                               #      | const__str__ERASE_SD:
45 52 41 53 45 5f 53 44 00     # f0a6 |   .data str:"ERASE_SD"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # f0af |   .data str:"UNKNOWN_COMMAND\n"
                               #      | const__data_16:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 36 0a 00 # f0c0 |   .data str:"TOO_MANY_ARGS max=6\n"
                               #      | const__data_17:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # f0d5 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xfa00
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # fa00 |   .bss size:2 align:1
                               #      | var__g_num_args:
                               # fa02 |   .bss size:2 align:1
                               #      | var__g_args:
                               # fa04 |   .bss size:14 align:2
                               #      | var__g_has_sd_card:
                               # fa12 |   .bss size:2 align:1
                               #      | var__g_sd_slot:
                               # fa14 |   .bss size:2 align:1
                               #      | var__g_sd_jmp_target:
                               # fa16 |   .bss size:2 align:1
                               #      | var__g_last_button_state:
                               # fa18 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
