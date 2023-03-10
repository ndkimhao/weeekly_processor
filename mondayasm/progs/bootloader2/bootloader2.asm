                               #      | .config CODE_OFFSET 0xe000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | _A_if_51:
e8 c0 e0 f8 00 e0 1d 00        # e000 |   jeq PC, 0xe000, ${_E_if_51}:rel + PC
60 20 e0 ff 00                 # e008 |   mov A, 0xff
60 40 00                       # e00d |   mov B, 0
54 e0 e0 1c 00 e0 ff fa 02     # e010 |   mmap 0xe000, 0xfaff, 0x2
58 e0 00 e0                    # e019 |   jmp 0xe000
                               #      | _E_if_51:
                               #      | _C_if_51:
                               #      | _Z_if_51:
54 e0 e0 1c 00 e0 ff fa 03     # e01d |   mmap 0xe000, 0xfaff, 0x3
d4 1c 02                       # e026 |   umap 0x2
60 a0 e0 00 ff                 # e029 |   mov SP, 0xff00
62 e0 e0 00 01 61 e8           # e02e |   mov [0x100], ${fn_syscall_entry}
                               #      | _A_call_60:
5c f8 40 08                    # e035 |   call ${fn_main}:rel + PC
                               #      | _Z_call_60:
d8                             # e039 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 60                          # e03a |   push C
e0 40                          # e03c |   push B
e0 20                          # e03e |   push A
60 a0 bc ee                    # e040 |   mov SP, SP + -18
                               #      |   # For each letter in fmt
60 40 bc 1c                    # e044 |   mov B, SP + 0x1c
                               #      | _A_for_1:
61 20 bc 1a                    # e048 |   mov A, [SP + 0x1a]
                               #      | _BA_for_1:
65 60 20                       # e04c |   bmov C, [A]
e8 60 00 f8 fd 00              # e04f |   jeq C, 0, ${_C_for_1}:rel + PC
                               #      |   # normal char
                               #      | _A_if_2:
e8 60 1c f8 25 15 00           # e055 |   jeq C, 0x25, ${_E_if_2}:rel + PC
                               #      | _A_call_1:
e0 60                          # e05c |   push C
5c f8 f9 00                    # e05e |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e062 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
58 f8 e0 00                    # e066 |   jmp ${_BZ_for_1}:rel + PC
                               #      | _E_if_2:
                               #      | _C_if_2:
                               #      | _Z_if_2:
                               #      |   # format specifier
44 20                          # e06a |   inc A
65 60 20                       # e06c |   bmov C, [A]
                               #      | _A_if_4:
ec 60 00 f8 0e 00              # e06f |   jne C, 0, ${_E_if_4}:rel + PC
58 f8 d7 00                    # e075 |   jmp ${_C_for_1}:rel + PC
58 f8 c9 00                    # e079 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
ec 60 1c f8 25 1a 00           # e07d |   jne C, 0x25, ${_E2_if_4}:rel + PC
                               #      | _A_call_2:
e0 1c 25                       # e084 |   push 0x25
5c f8 d0 00                    # e087 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e08b |   mov SP, SP + 0x2
                               #      | _Z_call_2:
58 f8 b7 00                    # e08f |   jmp ${_BZ_for_1}:rel + PC
58 f8 af 00                    # e093 |   jmp ${_C_if_4}:rel + PC
                               #      | _E2_if_4:
ec 60 1c f8 64 21 00           # e097 |   jne C, 0x64, ${_E3_if_4}:rel + PC
                               #      | _A_call_3:
e0 a0                          # e09e |   push SP
e2 40                          # e0a0 |   push [B]
5c f8 cd 00                    # e0a2 |   call ${fn_itoa_10}:rel + PC
60 a0 bc 04                    # e0a6 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_5:
e0 a0                          # e0aa |   push SP
5c f8 10 01                    # e0ac |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e0b0 |   mov SP, SP + 0x2
                               #      | _Z_call_5:
58 f8 8e 00                    # e0b4 |   jmp ${_C_if_4}:rel + PC
                               #      | _E3_if_4:
ec 60 1c f8 78 21 00           # e0b8 |   jne C, 0x78, ${_E4_if_4}:rel + PC
                               #      | _A_call_7:
e0 a0                          # e0bf |   push SP
e2 40                          # e0c1 |   push [B]
5c f8 1b 01                    # e0c3 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # e0c7 |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 a0                          # e0cb |   push SP
5c f8 ef 00                    # e0cd |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e0d1 |   mov SP, SP + 0x2
                               #      | _Z_call_8:
58 f8 6d 00                    # e0d5 |   jmp ${_C_if_4}:rel + PC
                               #      | _E4_if_4:
ec 60 1c f8 68 22 00           # e0d9 |   jne C, 0x68, ${_E5_if_4}:rel + PC
                               #      | _A_call_9:
e0 a0                          # e0e0 |   push SP
e2 40                          # e0e2 |   push [B]
5c f8 fa 00                    # e0e4 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # e0e8 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 bc 02                       # e0ec |   push SP + 0x2
5c f8 cd 00                    # e0ef |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e0f3 |   mov SP, SP + 0x2
                               #      | _Z_call_10:
58 f8 4b 00                    # e0f7 |   jmp ${_C_if_4}:rel + PC
                               #      | _E5_if_4:
ec 60 1c f8 62 21 00           # e0fb |   jne C, 0x62, ${_E6_if_4}:rel + PC
                               #      | _A_call_11:
e0 a0                          # e102 |   push SP
e2 40                          # e104 |   push [B]
5c f8 2e 01                    # e106 |   call ${fn_itoa_2}:rel + PC
60 a0 bc 04                    # e10a |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 a0                          # e10e |   push SP
5c f8 ac 00                    # e110 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e114 |   mov SP, SP + 0x2
                               #      | _Z_call_12:
58 f8 2a 00                    # e118 |   jmp ${_C_if_4}:rel + PC
                               #      | _E6_if_4:
ec 60 1c f8 73 15 00           # e11c |   jne C, 0x73, ${_E7_if_4}:rel + PC
                               #      | _A_call_13:
e2 40                          # e123 |   push [B]
5c f8 97 00                    # e125 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e129 |   mov SP, SP + 0x2
                               #      | _Z_call_13:
58 f8 15 00                    # e12d |   jmp ${_C_if_4}:rel + PC
                               #      | _E7_if_4:
ec 60 1c f8 63 11 00           # e131 |   jne C, 0x63, ${_E8_if_4}:rel + PC
                               #      | _A_call_14:
e2 40                          # e138 |   push [B]
5c f8 1d 00                    # e13a |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e13e |   mov SP, SP + 0x2
                               #      | _Z_call_14:
                               #      | _E8_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
60 40 5c 02                    # e142 |   mov B, B + 0x2
                               #      | _BZ_for_1:
44 20                          # e146 |   inc A
58 f8 04 ff                    # e148 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
60 a0 bc 12                    # e14c |   mov SP, SP + 0x12
e4 20                          # e150 |   pop A
e4 40                          # e152 |   pop B
e4 60                          # e154 |   pop C
dc                             # e156 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # e157 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # e15e |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # e164 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # e168 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # e16e |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_itoa_10:
                               #      | _begin_fn_itoa_10:
e0 60                          # e16f |   push C
e0 40                          # e171 |   push B
e0 20                          # e173 |   push A
61 20 bc 0a                    # e175 |   mov A, [SP + 0xa]
62 20 1c 30                    # e179 |   mov [A], 0x30
                               #      |   # convert int to string
61 40 bc 08                    # e17d |   mov B, [SP + 0x8]
                               #      | _A_while_1:
                               #      | _BA_while_1:
e8 40 00 f8 19 00              # e181 |   jeq B, 0, ${_C_while_1}:rel + PC
90 60 40 1c 0a                 # e187 |   div C, B, 0xa
82 20 ff 1c 30                 # e18c |   add [A], H, 0x30
44 20                          # e191 |   inc A
60 40 60                       # e193 |   mov B, C
                               #      | _BZ_while_1:
58 f8 eb ff                    # e196 |   jmp ${_BA_while_1}:rel + PC
                               #      | _C_while_1:
                               #      | _Z_while_1:
                               #      |   # reverse the string
61 60 bc 0a                    # e19a |   mov C, [SP + 0xa]
                               #      | _A_while_2:
                               #      | _BA_while_2:
fc 60 20 f8 17 00              # e19e |   jge C, A, ${_C_while_2}:rel + PC
48 20                          # e1a4 |   dec A
61 40 60                       # e1a6 |   mov B, [C]
67 60 20                       # e1a9 |   bmov [C], [A]
66 20 40                       # e1ac |   bmov [A], B
44 60                          # e1af |   inc C
                               #      | _BZ_while_2:
58 f8 ed ff                    # e1b1 |   jmp ${_BA_while_2}:rel + PC
                               #      | _C_while_2:
                               #      | _Z_while_2:
                               #      | _cleanup_fn_itoa_10:
e4 20                          # e1b5 |   pop A
e4 40                          # e1b7 |   pop B
e4 60                          # e1b9 |   pop C
dc                             # e1bb |   ret
                               #      | _end_fn_itoa_10:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # e1bc |   push A
                               #      | _A_for_2:
61 20 bc 04                    # e1be |   mov A, [SP + 0x4]
                               #      | _BA_for_2:
65 ff 20                       # e1c2 |   bmov H, [A]
e8 ff 00 f8 16 00              # e1c5 |   jeq H, 0, ${_C_for_2}:rel + PC
                               #      | _A_call_4:
e0 ff                          # e1cb |   push H
5c f8 8a ff                    # e1cd |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e1d1 |   mov SP, SP + 0x2
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # e1d5 |   inc A
58 f8 eb ff                    # e1d7 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_puts:
e4 20                          # e1db |   pop A
dc                             # e1dd |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_itoa_16:
                               #      | _begin_fn_itoa_16:
e0 60                          # e1de |   push C
e0 40                          # e1e0 |   push B
e0 20                          # e1e2 |   push A
61 40 bc 08                    # e1e4 |   mov B, [SP + 0x8]
61 60 bc 0a                    # e1e8 |   mov C, [SP + 0xa]
                               #      | _A_for_3:
60 20 1c 03                    # e1ec |   mov A, 0x3
                               #      | _BA_for_3:
e8 20 1c f8 ff 24 00           # e1f0 |   jeq A, -1, ${_C_for_3}:rel + PC
a0 ff 40 22                    # e1f7 |   shr H, B, A*4
2c ff 1c 0f                    # e1fb |   and H, 0xf
                               #      | _A_call_6:
e0 ff                          # e1ff |   push H
5c f8 1a 00                    # e201 |   call ${fn_to_hex_digit}:rel + PC
60 a0 bc 02                    # e205 |   mov SP, SP + 0x2
                               #      | _Z_call_6:
62 60 ff                       # e209 |   mov [C], H
44 60                          # e20c |   inc C
                               #      | _BZ_for_3:
48 20                          # e20e |   dec A
58 f8 e0 ff                    # e210 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_itoa_16:
e4 20                          # e214 |   pop A
e4 40                          # e216 |   pop B
e4 60                          # e218 |   pop C
dc                             # e21a |   ret
                               #      | _end_fn_itoa_16:
                               #      | 
                               #      | fn_to_hex_digit:
                               #      | _begin_fn_to_hex_digit:
                               #      | _A_if_6:
fa bc 1c f8 02 09 12 00        # e21b |   jgt [SP + 0x2], 0x9, ${_E_if_6}:rel + PC
81 ff bc 1c 02 30              # e223 |   add H, [SP + 0x2], 0x30
58 f8 0a 00                    # e229 |   jmp ${_C_if_6}:rel + PC
                               #      | _E_if_6:
81 ff bc 1c 02 57              # e22d |   add H, [SP + 0x2], 0x57
                               #      | _C_if_6:
                               #      | _Z_if_6:
                               #      | _cleanup_fn_to_hex_digit:
dc                             # e233 |   ret
                               #      | _end_fn_to_hex_digit:
                               #      | 
                               #      | fn_itoa_2:
                               #      | _begin_fn_itoa_2:
e0 60                          # e234 |   push C
e0 40                          # e236 |   push B
e0 20                          # e238 |   push A
61 40 bc 08                    # e23a |   mov B, [SP + 0x8]
61 60 bc 0a                    # e23e |   mov C, [SP + 0xa]
                               #      | _A_for_4:
60 20 1c 0f                    # e242 |   mov A, 0xf
                               #      | _BA_for_4:
e8 20 1c f8 ff 1c 00           # e246 |   jeq A, -1, ${_C_for_4}:rel + PC
a0 ff 40 20                    # e24d |   shr H, B, A
2c ff 1c 01                    # e251 |   and H, 0x1
82 60 ff 1c 30                 # e255 |   add [C], H, 0x30
44 60                          # e25a |   inc C
                               #      | _BZ_for_4:
48 20                          # e25c |   dec A
58 f8 e8 ff                    # e25e |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_itoa_2:
e4 20                          # e262 |   pop A
e4 40                          # e264 |   pop B
e4 60                          # e266 |   pop C
dc                             # e268 |   ret
                               #      | _end_fn_itoa_2:
                               #      | 
                               #      | fn_getc:
                               #      | _begin_fn_getc:
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 02 ff                 # e269 |   mov H, [0xff02]
ac fe ff e0 00 80              # e26e |   and G, H, 0x8000
e8 fe 00 f8 f5 ff              # e274 |   jeq G, 0, ${_BA_loop_2}:rel + PC
2c ff e0 ff 00                 # e27a |   and H, 0xff
58 f8 08 00                    # e27f |   jmp ${_C_loop_2}:rel + PC
                               #      | _BZ_loop_2:
58 f8 e6 ff                    # e283 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn_getc:
dc                             # e287 |   ret
                               #      | _end_fn_getc:
                               #      | 
                               #      | fn_from_hex_digit:
                               #      | _begin_fn_from_hex_digit:
b1 fe bc 1c 02 20              # e288 |   or G, [SP + 0x2], 0x20
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 fe 1c f8 30 17 00           # e28e |   jlt G, 0x30, ${_C_scope_1}:rel + PC
f8 fe 1c f8 39 10 00           # e295 |   jgt G, 0x39, ${_C_scope_1}:rel + PC
84 ff fe 1c 30                 # e29c |   sub H, G, 0x30
c4 fe 00                       # e2a1 |   inc G, 0
dc                             # e2a4 |   ret
                               #      | _C_scope_1:
                               #      | _Z_scope_1:
                               #      | _A_scope_2:
                               #      | _B_scope_2:
f0 fe 1c f8 61 17 00           # e2a5 |   jlt G, 0x61, ${_C_scope_2}:rel + PC
f8 fe 1c f8 66 10 00           # e2ac |   jgt G, 0x66, ${_C_scope_2}:rel + PC
80 ff fe 1c a9                 # e2b3 |   add H, G, -87
c4 fe 00                       # e2b8 |   inc G, 0
dc                             # e2bb |   ret
                               #      | _C_scope_2:
                               #      | _Z_scope_2:
60 ff 00                       # e2bc |   mov H, 0
60 fe 00                       # e2bf |   mov G, 0
                               #      | _cleanup_fn_from_hex_digit:
dc                             # e2c2 |   ret
                               #      | _end_fn_from_hex_digit:
                               #      | 
                               #      | fn_atoi_16:
                               #      | _begin_fn_atoi_16:
e0 40                          # e2c3 |   push B
e0 20                          # e2c5 |   push A
60 20 00                       # e2c7 |   mov A, 0
61 40 bc 06                    # e2ca |   mov B, [SP + 0x6]
                               #      | _A_loop_3:
                               #      | _BA_loop_3:
65 ff 40                       # e2ce |   bmov H, [B]
e8 ff 00 f8 23 00              # e2d1 |   jeq H, 0, ${_C_loop_3}:rel + PC
                               #      | _A_call_15:
e0 ff                          # e2d7 |   push H
5c f8 af ff                    # e2d9 |   call ${fn_from_hex_digit}:rel + PC
60 a0 bc 02                    # e2dd |   mov SP, SP + 0x2
                               #      | _Z_call_15:
e8 fe 00 f8 2d 00              # e2e1 |   jeq G, 0, ${_cleanup_fn_atoi_16}:rel + PC
28 20 1c 04                    # e2e7 |   shl A, 0x4
00 20 ff                       # e2eb |   add A, H
44 40                          # e2ee |   inc B
                               #      | _BZ_loop_3:
58 f8 de ff                    # e2f0 |   jmp ${_BA_loop_3}:rel + PC
                               #      | _C_loop_3:
                               #      | _Z_loop_3:
60 fe 00                       # e2f4 |   mov G, 0
                               #      | _A_scope_3:
                               #      | _B_scope_3:
61 ff bc 06                    # e2f7 |   mov H, [SP + 0x6]
e8 40 ff f8 10 00              # e2fb |   jeq B, H, ${_C_scope_3}:rel + PC
f8 5c ff f8 fc 0a 00           # e301 |   jgt B + -4, H, ${_C_scope_3}:rel + PC
c4 fe 00                       # e308 |   inc G, 0
                               #      | _C_scope_3:
                               #      | _Z_scope_3:
60 ff 20                       # e30b |   mov H, A
                               #      | _cleanup_fn_atoi_16:
e4 20                          # e30e |   pop A
e4 40                          # e310 |   pop B
dc                             # e312 |   ret
                               #      | _end_fn_atoi_16:
                               #      | 
                               #      | fn_memset:
                               #      | _begin_fn_memset:
e0 40                          # e313 |   push B
e0 20                          # e315 |   push A
65 fe bc 08                    # e317 |   bmov G, [SP + 0x8]
a8 ff fe 1c 08                 # e31b |   shl H, G, 0x8
30 ff fe                       # e320 |   or H, G
61 20 bc 06                    # e323 |   mov A, [SP + 0x6]
81 40 bc 20 0a                 # e327 |   add B, [SP + 0xa], A
                               #      | _A_while_3:
                               #      | _BA_while_3:
f8 3c 40 f8 02 12 00           # e32c |   jgt A + 0x2, B, ${_C_while_3}:rel + PC
62 20 ff                       # e333 |   mov [A], H
60 20 3c 02                    # e336 |   mov A, A + 0x2
                               #      | _BZ_while_3:
58 f8 f2 ff                    # e33a |   jmp ${_BA_while_3}:rel + PC
                               #      | _C_while_3:
                               #      | _Z_while_3:
                               #      | _A_if_16:
fc 20 40 f8 09 00              # e33e |   jge A, B, ${_E_if_16}:rel + PC
66 20 ff                       # e344 |   bmov [A], H
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _cleanup_fn_memset:
e4 20                          # e347 |   pop A
e4 40                          # e349 |   pop B
dc                             # e34b |   ret
                               #      | _end_fn_memset:
                               #      | 
                               #      | fn_memcpy:
                               #      | _begin_fn_memcpy:
e0 60                          # e34c |   push C
e0 40                          # e34e |   push B
e0 20                          # e350 |   push A
61 20 bc 08                    # e352 |   mov A, [SP + 0x8]
81 40 bc 20 0c                 # e356 |   add B, [SP + 0xc], A
61 60 bc 0a                    # e35b |   mov C, [SP + 0xa]
                               #      | _A_while_4:
                               #      | _BA_while_4:
f8 3c 40 f8 02 16 00           # e35f |   jgt A + 0x2, B, ${_C_while_4}:rel + PC
63 20 60                       # e366 |   mov [A], [C]
60 20 3c 02                    # e369 |   mov A, A + 0x2
60 60 7c 02                    # e36d |   mov C, C + 0x2
                               #      | _BZ_while_4:
58 f8 ee ff                    # e371 |   jmp ${_BA_while_4}:rel + PC
                               #      | _C_while_4:
                               #      | _Z_while_4:
                               #      | _A_if_17:
fc 20 40 f8 09 00              # e375 |   jge A, B, ${_E_if_17}:rel + PC
67 20 60                       # e37b |   bmov [A], [C]
                               #      | _E_if_17:
                               #      | _C_if_17:
                               #      | _Z_if_17:
                               #      | _cleanup_fn_memcpy:
e4 20                          # e37e |   pop A
e4 40                          # e380 |   pop B
e4 60                          # e382 |   pop C
dc                             # e384 |   ret
                               #      | _end_fn_memcpy:
                               #      | 
                               #      | fn_strcmp:
                               #      | _begin_fn_strcmp:
61 fc bc 02                    # e385 |   mov E, [SP + 0x2]
61 fd bc 04                    # e389 |   mov F, [SP + 0x4]
                               #      | _A_loop_4:
                               #      | _BA_loop_4:
65 fe fc                       # e38d |   bmov G, [E]
65 ff fd                       # e390 |   bmov H, [F]
84 ff fe ff                    # e393 |   sub H, G, H
ec ff 00 f8 14 00              # e397 |   jne H, 0, ${_cleanup_fn_strcmp}:rel + PC
e8 fe 00 f8 0e 00              # e39d |   jeq G, 0, ${_cleanup_fn_strcmp}:rel + PC
44 fc                          # e3a3 |   inc E
44 fd                          # e3a5 |   inc F
                               #      | _BZ_loop_4:
58 f8 e6 ff                    # e3a7 |   jmp ${_BA_loop_4}:rel + PC
                               #      | _C_loop_4:
                               #      | _Z_loop_4:
                               #      | _cleanup_fn_strcmp:
dc                             # e3ab |   ret
                               #      | _end_fn_strcmp:
                               #      | 
                               #      | fn_strcasecmp:
                               #      | _begin_fn_strcasecmp:
e0 20                          # e3ac |   push A
61 fc bc 04                    # e3ae |   mov E, [SP + 0x4]
61 fd bc 06                    # e3b2 |   mov F, [SP + 0x6]
                               #      | _A_loop_5:
                               #      | _BA_loop_5:
65 fe fc                       # e3b6 |   bmov G, [E]
65 ff fd                       # e3b9 |   bmov H, [F]
60 20 fe                       # e3bc |   mov A, G
30 fe 1c 20                    # e3bf |   or G, 0x20
30 ff 1c 20                    # e3c3 |   or H, 0x20
84 ff fe ff                    # e3c7 |   sub H, G, H
ec ff 00 f8 14 00              # e3cb |   jne H, 0, ${_cleanup_fn_strcasecmp}:rel + PC
e8 20 00 f8 0e 00              # e3d1 |   jeq A, 0, ${_cleanup_fn_strcasecmp}:rel + PC
44 fc                          # e3d7 |   inc E
44 fd                          # e3d9 |   inc F
                               #      | _BZ_loop_5:
58 f8 db ff                    # e3db |   jmp ${_BA_loop_5}:rel + PC
                               #      | _C_loop_5:
                               #      | _Z_loop_5:
                               #      | _cleanup_fn_strcasecmp:
e4 20                          # e3df |   pop A
dc                             # e3e1 |   ret
                               #      | _end_fn_strcasecmp:
                               #      | 
                               #      | fn_strchr:
                               #      | _begin_fn_strchr:
61 ff bc 02                    # e3e2 |   mov H, [SP + 0x2]
                               #      | _A_loop_6:
                               #      | _BA_loop_6:
65 fe ff                       # e3e6 |   bmov G, [H]
e9 fe bc f8 04 17 00           # e3e9 |   jeq G, [SP + 0x4], ${_cleanup_fn_strchr}:rel + PC
                               #      | _A_if_24:
ec fe 00 f8 0a 00              # e3f0 |   jne G, 0, ${_E_if_24}:rel + PC
60 ff 00                       # e3f6 |   mov H, 0
dc                             # e3f9 |   ret
                               #      | _E_if_24:
                               #      | _C_if_24:
                               #      | _Z_if_24:
44 ff                          # e3fa |   inc H
                               #      | _BZ_loop_6:
58 f8 ea ff                    # e3fc |   jmp ${_BA_loop_6}:rel + PC
                               #      | _C_loop_6:
                               #      | _Z_loop_6:
                               #      | _cleanup_fn_strchr:
dc                             # e400 |   ret
                               #      | _end_fn_strchr:
                               #      | 
                               #      | fn_srand:
                               #      | _begin_fn_srand:
63 e0 bc 00 fb 02              # e401 |   mov [${var__rand__state}], [SP + 0x2]
                               #      | _cleanup_fn_srand:
dc                             # e407 |   ret
                               #      | _end_fn_srand:
                               #      | 
                               #      | fn_rand:
                               #      | _begin_fn_rand:
c5 ff e0 00 fb                 # e408 |   inc H, [${var__rand__state}]
62 e0 ff 00 fb                 # e40d |   mov [${var__rand__state}], H
                               #      | _cleanup_fn_rand:
dc                             # e412 |   ret
                               #      | _end_fn_rand:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # e413 |   push D
e0 60                          # e415 |   push C
e0 40                          # e417 |   push B
e0 20                          # e419 |   push A
61 40 e0 10 ff                 # e41b |   mov B, [0xff10]
61 60 e0 12 ff                 # e420 |   mov C, [0xff12]
61 80 e0 14 ff                 # e425 |   mov D, [0xff14]
61 20 bc 0e                    # e42a |   mov A, [SP + 0xe]
60 ff 00                       # e42e |   mov H, 0
                               #      | _A_if_25:
fc 28 20 f8 09 00              # e431 |   jge A + B, A, ${_E_if_25}:rel + PC
c4 ff 00                       # e437 |   inc H, 0
                               #      | _E_if_25:
                               #      | _C_if_25:
                               #      | _Z_if_25:
60 40 44                       # e43a |   mov B, B + A
81 20 bc ff 0c                 # e43d |   add A, [SP + 0xc], H
60 ff 00                       # e442 |   mov H, 0
                               #      | _A_scope_4:
                               #      | _B_scope_4:
f0 2c 20 f8 10 00              # e445 |   jlt A + C, A, ${_C_scope_4}:rel + PC
f0 20 ff f8 0a 00              # e44b |   jlt A, H, ${_C_scope_4}:rel + PC
58 f8 07 00                    # e451 |   jmp ${_Z_scope_4}:rel + PC
                               #      | _C_scope_4:
c4 ff 00                       # e455 |   inc H, 0
                               #      | _Z_scope_4:
60 60 64                       # e458 |   mov C, C + A
81 20 bc ff 0a                 # e45b |   add A, [SP + 0xa], H
60 80 84                       # e460 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # e463 |   mov A, [SP + 0x10]
                               #      | _A_loop_7:
                               #      | _BA_loop_7:
61 ff e0 14 ff                 # e467 |   mov H, [0xff14]
                               #      | _A_if_28:
f4 ff 80 f8 0a 00              # e46c |   jle H, D, ${_E_if_28}:rel + PC
58 f8 33 00                    # e472 |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_28:
ec ff 80 f8 2b 00              # e476 |   jne H, D, ${_E2_if_28}:rel + PC
61 ff e0 12 ff                 # e47c |   mov H, [0xff12]
                               #      | _A_if_29:
f4 ff 60 f8 0a 00              # e481 |   jle H, C, ${_E_if_29}:rel + PC
58 f8 1e 00                    # e487 |   jmp ${_C_loop_7}:rel + PC
                               #      | _E_if_29:
ec ff 60 f8 16 00              # e48b |   jne H, C, ${_E2_if_29}:rel + PC
fa e0 40 f8 10 ff 14 00        # e491 |   jgt [0xff10], B, ${_C_loop_7}:rel + PC
                               #      | _A_if_31:
e8 20 00 f8 08 00              # e499 |   jeq A, 0, ${_E_if_31}:rel + PC
5c 20                          # e49f |   call A
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
58 f8 c6 ff                    # e4a1 |   jmp ${_BA_loop_7}:rel + PC
                               #      | _C_loop_7:
                               #      | _Z_loop_7:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # e4a5 |   pop A
e4 40                          # e4a7 |   pop B
e4 60                          # e4a9 |   pop C
e4 80                          # e4ab |   pop D
dc                             # e4ad |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | fn_decode_font:
                               #      | _begin_fn_decode_font:
e0 80                          # e4ae |   push D
e0 60                          # e4b0 |   push C
e0 40                          # e4b2 |   push B
e0 20                          # e4b4 |   push A
61 fc bc 0a                    # e4b6 |   mov E, [SP + 0xa]
a9 fd bc 1c 0e 01              # e4ba |   shl F, [SP + 0xe], 0x1
00 fd fc                       # e4c0 |   add F, E
61 fe bc 0c                    # e4c3 |   mov G, [SP + 0xc]
61 40 fe                       # e4c7 |   mov B, [G]
60 60 1c 07                    # e4ca |   mov C, 0x7
60 20 00                       # e4ce |   mov A, 0
60 a0 bc fe                    # e4d1 |   mov SP, SP + -2
                               #      | _A_for_5:
                               #      | _BA_for_5:
fc fc fd f8 90 00              # e4d5 |   jge E, F, ${_C_for_5}:rel + PC
                               #      |   # decode one line
60 20 00                       # e4db |   mov A, 0
62 a0 1c ff                    # e4de |   mov [SP], -1
                               #      | _A_loop_8:
                               #      | _BA_loop_8:
                               #      | _A_if_32:
ec 60 1c f8 ff 10 00           # e4e2 |   jne C, -1, ${_E_if_32}:rel + PC
44 fe                          # e4e9 |   inc G
61 40 fe                       # e4eb |   mov B, [G]
60 60 1c 07                    # e4ee |   mov C, 0x7
                               #      | _E_if_32:
                               #      | _C_if_32:
                               #      | _Z_if_32:
98 80 40 60                    # e4f2 |   getb D, B, C
48 60                          # e4f6 |   dec C
40 80                          # e4f8 |   bool D
b0 20 21 80                    # e4fa |   or A, A*2, D
4a a0                          # e4fe |   dec [SP]
                               #      | _A_if_33:
ee a0 00 f8 1b 00              # e500 |   jne [SP], 0, ${_E_if_33}:rel + PC
                               #      |   # bit pattern
60 ff 20                       # e506 |   mov H, A
b9 20 bc 12                    # e509 |   neg A, [SP + 0x12]
a0 20 1c 3c ff 10              # e50d |   shr A, -1, A + 0x10
ae fc ff 20                    # e513 |   and [E], H, A
58 f8 46 00                    # e517 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E_if_33:
ec 20 00 f8 12 00              # e51b |   jne A, 0, ${_E2_if_33}:rel + PC
                               #      |   # copy line n-1
84 ff fc 1c 02                 # e521 |   sub H, E, 0x2
63 fc ff                       # e526 |   mov [E], [H]
58 f8 34 00                    # e529 |   jmp ${_C_loop_8}:rel + PC
                               #      | _E2_if_33:
ec 20 1c f8 02 13 00           # e52d |   jne A, 0x2, ${_E3_if_33}:rel + PC
                               #      |   # copy line n-2
84 ff fc 1c 04                 # e534 |   sub H, E, 0x4
63 fc ff                       # e539 |   mov [E], [H]
58 f8 21 00                    # e53c |   jmp ${_C_loop_8}:rel + PC
                               #      | _E3_if_33:
ec 20 1c f8 06 0e 00           # e540 |   jne A, 0x6, ${_E4_if_33}:rel + PC
                               #      |   # all zeros
62 fc 00                       # e547 |   mov [E], 0
58 f8 13 00                    # e54a |   jmp ${_C_loop_8}:rel + PC
                               #      | _E4_if_33:
ec 20 1c f8 07 0b 00           # e54e |   jne A, 0x7, ${_E5_if_33}:rel + PC
                               #      |   # bitmap
63 a0 bc 12                    # e555 |   mov [SP], [SP + 0x12]
                               #      | _E5_if_33:
                               #      | _C_if_33:
                               #      | _Z_if_33:
                               #      | _BZ_loop_8:
58 f8 89 ff                    # e559 |   jmp ${_BA_loop_8}:rel + PC
                               #      | _C_loop_8:
                               #      | _Z_loop_8:
                               #      | _BZ_for_5:
00 fc 1c 02                    # e55d |   add E, 0x2
58 f8 74 ff                    # e561 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_decode_font:
60 a0 bc 02                    # e565 |   mov SP, SP + 0x2
e4 20                          # e569 |   pop A
e4 40                          # e56b |   pop B
e4 60                          # e56d |   pop C
e4 80                          # e56f |   pop D
dc                             # e571 |   ret
                               #      | _end_fn_decode_font:
                               #      | 
                               #      | fn_decode_font_16_12:
                               #      | _begin_fn_decode_font_16_12:
e0 40                          # e572 |   push B
e0 20                          # e574 |   push A
61 20 bc 08                    # e576 |   mov A, [SP + 0x8]
60 40 1c 3f                    # e57a |   mov B, 0x3f
                               #      | _A_scope_5:
                               #      | _B_scope_5:
f0 20 1c f8 20 13 00           # e57e |   jlt A, 0x20, ${_C_scope_5}:rel + PC
fc 20 e0 f8 80 00 0c 00        # e585 |   jge A, 0x80, ${_C_scope_5}:rel + PC
60 40 3c e0                    # e58d |   mov B, A + -32
                               #      | _C_scope_5:
                               #      | _Z_scope_5:
28 40 1c 01                    # e591 |   shl B, 0x1
                               #      | _A_call_16:
e0 1c 0c                       # e595 |   push 0xc
e0 1c 10                       # e598 |   push 0x10
e0 e8 fc ea                    # e59b |   push ${const__FONT_16_12_COMPRESSED} + B
e2 bc 0c                       # e59f |   push [SP + 0xc]
5c f8 0c ff                    # e5a2 |   call ${fn_decode_font}:rel + PC
60 a0 bc 08                    # e5a6 |   mov SP, SP + 0x8
                               #      | _Z_call_16:
                               #      | _cleanup_fn_decode_font_16_12:
e4 20                          # e5aa |   pop A
e4 40                          # e5ac |   pop B
dc                             # e5ae |   ret
                               #      | _end_fn_decode_font_16_12:
                               #      | 
                               #      | fn_handle_ping:
                               #      | _begin_fn_handle_ping:
                               #      | _A_call_18:
e0 00                          # e5af |   push 0
5c f8 15 00                    # e5b1 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e5b5 |   mov SP, SP + 0x2
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 e0 fd ef                    # e5b9 |   push ${const__str__PONG__endl}
5c f8 ff fb                    # e5bd |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e5c1 |   mov SP, SP + 0x2
                               #      | _Z_call_19:
                               #      | _cleanup_fn_handle_ping:
dc                             # e5c5 |   ret
                               #      | _end_fn_handle_ping:
                               #      | 
                               #      | fn_check_num_args:
                               #      | _begin_fn_check_num_args:
c4 fe 00                       # e5c6 |   inc G, 0
                               #      | _A_if_36:
eb e0 bc f8 10 00 02 1f 00     # e5c9 |   jeq [${var__g_num_args}], [SP + 0x2], ${_E_if_36}:rel + PC
                               #      | _A_call_17:
e2 e0 10 00                    # e5d2 |   push [${var__g_num_args}]
e2 bc 04                       # e5d6 |   push [SP + 0x4]
e0 e0 d9 ef                    # e5d9 |   push ${const__data_1}
5c f8 5d fa                    # e5dd |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # e5e1 |   mov SP, SP + 0x6
                               #      | _Z_call_17:
60 fe 00                       # e5e5 |   mov G, 0
                               #      | _E_if_36:
                               #      | _C_if_36:
                               #      | _Z_if_36:
                               #      | _cleanup_fn_check_num_args:
dc                             # e5e8 |   ret
                               #      | _end_fn_check_num_args:
                               #      | 
                               #      | fn_handle_read:
                               #      | _begin_fn_handle_read:
e0 80                          # e5e9 |   push D
e0 60                          # e5eb |   push C
e0 40                          # e5ed |   push B
e0 20                          # e5ef |   push A
60 a0 bc fa                    # e5f1 |   mov SP, SP + -6
                               #      | _A_call_20:
e0 1c 02                       # e5f5 |   push 0x2
5c f8 ce ff                    # e5f8 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e5fc |   mov SP, SP + 0x2
                               #      | _Z_call_20:
e8 fe 00 f8 9a 00              # e600 |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
                               #      | _A_call_22:
5c f8 a1 00                    # e606 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_22:
e8 fe 00 f8 90 00              # e60a |   jeq G, 0, ${_cleanup_fn_handle_read}:rel + PC
61 20 e0 12 00                 # e610 |   mov A, [${var__g_args}]
61 40 e0 14 00                 # e615 |   mov B, [${var__g_args} + 0002]
                               #      | _A_call_23:
e0 40                          # e61a |   push B
e0 20                          # e61c |   push A
e0 e0 1f f0                    # e61e |   push ${const__data_2}
5c f8 18 fa                    # e622 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # e626 |   mov SP, SP + 0x6
                               #      | _Z_call_23:
                               #      | _A_if_42:
ee bc 1c f8 10 02 3c 00        # e62a |   jne [SP + 0x10], 0x2, ${_E_if_42}:rel + PC
                               #      | _A_while_5:
                               #      | _BA_while_5:
fc 20 40 f8 30 00              # e632 |   jge A, B, ${_C_while_5}:rel + PC
61 60 20                       # e638 |   mov C, [A]
a0 80 60 1c 08                 # e63b |   shr D, C, 0x8
28 60 1c 08                    # e640 |   shl C, 0x8
                               #      | _A_call_24:
e0 a0                          # e644 |   push SP
e0 8c                          # e646 |   push D + C
5c f8 96 fb                    # e648 |   call ${fn_itoa_16}:rel + PC
60 a0 bc 04                    # e64c |   mov SP, SP + 0x4
                               #      | _Z_call_24:
                               #      | _A_call_25:
e0 a0                          # e650 |   push SP
5c f8 6a fb                    # e652 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e656 |   mov SP, SP + 0x2
                               #      | _Z_call_25:
60 20 3c 02                    # e65a |   mov A, A + 0x2
                               #      | _BZ_while_5:
58 f8 d4 ff                    # e65e |   jmp ${_BA_while_5}:rel + PC
                               #      | _C_while_5:
                               #      | _Z_while_5:
58 f8 2d 00                    # e662 |   jmp ${_C_if_42}:rel + PC
                               #      | _E_if_42:
                               #      | _A_while_6:
                               #      | _BA_while_6:
fc 20 40 f8 29 00              # e666 |   jge A, B, ${_C_while_6}:rel + PC
61 60 20                       # e66c |   mov C, [A]
                               #      | _A_call_26:
e0 60                          # e66f |   push C
5c f8 e6 fa                    # e671 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e675 |   mov SP, SP + 0x2
                               #      | _Z_call_26:
20 60 1c 08                    # e679 |   shr C, 0x8
                               #      | _A_call_27:
e0 60                          # e67d |   push C
5c f8 d8 fa                    # e67f |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e683 |   mov SP, SP + 0x2
                               #      | _Z_call_27:
60 20 3c 02                    # e687 |   mov A, A + 0x2
                               #      | _BZ_while_6:
58 f8 db ff                    # e68b |   jmp ${_BA_while_6}:rel + PC
                               #      | _C_while_6:
                               #      | _Z_while_6:
                               #      | _C_if_42:
                               #      | _Z_if_42:
                               #      | _A_call_28:
e0 1c 0a                       # e68f |   push 0xa
5c f8 c5 fa                    # e692 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # e696 |   mov SP, SP + 0x2
                               #      | _Z_call_28:
                               #      | _cleanup_fn_handle_read:
60 a0 bc 06                    # e69a |   mov SP, SP + 0x6
e4 20                          # e69e |   pop A
e4 40                          # e6a0 |   pop B
e4 60                          # e6a2 |   pop C
e4 80                          # e6a4 |   pop D
dc                             # e6a6 |   ret
                               #      | _end_fn_handle_read:
                               #      | 
                               #      | fn_check_addr_range:
                               #      | _begin_fn_check_addr_range:
e0 60                          # e6a7 |   push C
e0 40                          # e6a9 |   push B
e0 20                          # e6ab |   push A
61 20 e0 12 00                 # e6ad |   mov A, [${var__g_args}]
61 40 e0 14 00                 # e6b2 |   mov B, [${var__g_args} + 0002]
60 60 e0 03 f0                 # e6b7 |   mov C, ${const__str__INVALID_RANGE__endl}
fc 20 40 f8 28 00              # e6bc |   jge A, B, ${_L_fn_check_addr_range_1}:rel + PC
60 60 e0 12 f0                 # e6c2 |   mov C, ${const__str__NOT_ALIGNED__endl}
ac fe 20 1c 01                 # e6c7 |   and G, A, 0x1
ec fe 00 f8 18 00              # e6cc |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
ac fe 40 1c 01                 # e6d2 |   and G, B, 0x1
ec fe 00 f8 0d 00              # e6d7 |   jne G, 0, ${_L_fn_check_addr_range_1}:rel + PC
c4 fe 00                       # e6dd |   inc G, 0
58 f8 11 00                    # e6e0 |   jmp ${_cleanup_fn_check_addr_range}:rel + PC
                               #      | _L_fn_check_addr_range_1:
                               #      | _A_call_21:
e0 60                          # e6e4 |   push C
5c f8 d6 fa                    # e6e6 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e6ea |   mov SP, SP + 0x2
                               #      | _Z_call_21:
60 fe 00                       # e6ee |   mov G, 0
                               #      | _cleanup_fn_check_addr_range:
e4 20                          # e6f1 |   pop A
e4 40                          # e6f3 |   pop B
e4 60                          # e6f5 |   pop C
dc                             # e6f7 |   ret
                               #      | _end_fn_check_addr_range:
                               #      | 
                               #      | fn_handle_write:
                               #      | _begin_fn_handle_write:
e0 80                          # e6f8 |   push D
e0 60                          # e6fa |   push C
e0 40                          # e6fc |   push B
e0 20                          # e6fe |   push A
60 a0 bc fa                    # e700 |   mov SP, SP + -6
                               #      | _A_call_29:
e0 1c 02                       # e704 |   push 0x2
5c f8 bf fe                    # e707 |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e70b |   mov SP, SP + 0x2
                               #      | _Z_call_29:
e8 fe 00 f8 dc 00              # e70f |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
                               #      | _A_call_30:
5c f8 92 ff                    # e715 |   call ${fn_check_addr_range}:rel + PC
                               #      | _Z_call_30:
e8 fe 00 f8 d2 00              # e719 |   jeq G, 0, ${_cleanup_fn_handle_write}:rel + PC
61 20 e0 12 00                 # e71f |   mov A, [${var__g_args}]
61 40 e0 14 00                 # e724 |   mov B, [${var__g_args} + 0002]
                               #      | _A_if_45:
ee bc 1c f8 10 03 55 00        # e729 |   jne [SP + 0x10], 0x3, ${_E_if_45}:rel + PC
                               #      | _A_while_7:
                               #      | _BA_while_7:
fc 20 40 f8 49 00              # e731 |   jge A, B, ${_C_while_7}:rel + PC
                               #      | _A_for_6:
60 80 00                       # e737 |   mov D, 0
                               #      | _BA_for_6:
fc 80 1c f8 04 19 00           # e73a |   jge D, 0x4, ${_C_for_6}:rel + PC
                               #      | _A_call_31:
5c f8 28 fb                    # e741 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_31:
62 e0 ff 00 ff                 # e745 |   mov [0xff00], H
62 b0 ff                       # e74a |   mov [SP + D], H
                               #      | _BZ_for_6:
44 80                          # e74d |   inc D
58 f8 eb ff                    # e74f |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _A_call_32:
e0 a0                          # e753 |   push SP
5c f8 6e fb                    # e755 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # e759 |   mov SP, SP + 0x2
                               #      | _Z_call_32:
e8 fe 00 f8 7f 00              # e75d |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
a8 60 ff 1c 08                 # e763 |   shl C, H, 0x8
20 ff 1c 08                    # e768 |   shr H, 0x8
30 60 ff                       # e76c |   or C, H
62 20 60                       # e76f |   mov [A], C
60 20 3c 02                    # e772 |   mov A, A + 0x2
                               #      | _BZ_while_7:
58 f8 bb ff                    # e776 |   jmp ${_BA_while_7}:rel + PC
                               #      | _C_while_7:
                               #      | _Z_while_7:
58 f8 31 00                    # e77a |   jmp ${_C_if_45}:rel + PC
                               #      | _E_if_45:
                               #      | _A_while_8:
                               #      | _BA_while_8:
fc 20 40 f8 2d 00              # e77e |   jge A, B, ${_C_while_8}:rel + PC
                               #      | _A_call_33:
5c f8 e5 fa                    # e784 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_33:
62 e0 ff 00 ff                 # e788 |   mov [0xff00], H
60 60 ff                       # e78d |   mov C, H
                               #      | _A_call_34:
5c f8 d9 fa                    # e790 |   call ${fn_getc}:rel + PC
                               #      | _Z_call_34:
62 e0 ff 00 ff                 # e794 |   mov [0xff00], H
28 ff 1c 08                    # e799 |   shl H, 0x8
30 60 ff                       # e79d |   or C, H
62 20 60                       # e7a0 |   mov [A], C
60 20 3c 02                    # e7a3 |   mov A, A + 0x2
                               #      | _BZ_while_8:
58 f8 d7 ff                    # e7a7 |   jmp ${_BA_while_8}:rel + PC
                               #      | _C_while_8:
                               #      | _Z_while_8:
                               #      | _C_if_45:
                               #      | _Z_if_45:
                               #      | _A_call_35:
5c f8 be fa                    # e7ab |   call ${fn_getc}:rel + PC
                               #      | _Z_call_35:
62 e0 ff 00 ff                 # e7af |   mov [0xff00], H
                               #      | _A_scope_6:
                               #      | _B_scope_6:
e8 ff 1c f8 0a 12 00           # e7b4 |   jeq H, 0xa, ${_C_scope_6}:rel + PC
e8 ff 1c f8 0d 0b 00           # e7bb |   jeq H, 0xd, ${_C_scope_6}:rel + PC
58 f8 1a 00                    # e7c2 |   jmp ${_L_fn_handle_write_1}:rel + PC
                               #      | _C_scope_6:
                               #      | _Z_scope_6:
                               #      | _A_call_36:
e0 40                          # e7c6 |   push B
e2 e0 12 00                    # e7c8 |   push [${var__g_args}]
e0 e0 2e f0                    # e7cc |   push ${const__data_3}
5c f8 6a f8                    # e7d0 |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # e7d4 |   mov SP, SP + 0x6
                               #      | _Z_call_36:
58 f8 13 00                    # e7d8 |   jmp ${_cleanup_fn_handle_write}:rel + PC
                               #      | _L_fn_handle_write_1:
                               #      | _A_call_37:
e0 e0 3e f0                    # e7dc |   push ${const__data_4}
5c f8 dc f9                    # e7e0 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e7e4 |   mov SP, SP + 0x2
                               #      | _Z_call_37:
60 fe 00                       # e7e8 |   mov G, 0
                               #      | _cleanup_fn_handle_write:
60 a0 bc 06                    # e7eb |   mov SP, SP + 0x6
e4 20                          # e7ef |   pop A
e4 40                          # e7f1 |   pop B
e4 60                          # e7f3 |   pop C
e4 80                          # e7f5 |   pop D
dc                             # e7f7 |   ret
                               #      | _end_fn_handle_write:
                               #      | 
                               #      | fn_handle_jmp:
                               #      | _begin_fn_handle_jmp:
                               #      | _A_call_38:
e0 1c 01                       # e7f8 |   push 0x1
5c f8 cb fd                    # e7fb |   call ${fn_check_num_args}:rel + PC
60 a0 bc 02                    # e7ff |   mov SP, SP + 0x2
                               #      | _Z_call_38:
e8 fe 00 f8 5d 00              # e803 |   jeq G, 0, ${_cleanup_fn_handle_jmp}:rel + PC
                               #      | _A_if_50:
ee bc 1c f8 02 06 1c 00        # e809 |   jne [SP + 0x2], 0x6, ${_E_if_50}:rel + PC
                               #      | _A_call_39:
e2 e0 12 00                    # e811 |   push [${var__g_args}]
e0 e0 4d f0                    # e815 |   push ${const__data_5}
5c f8 21 f8                    # e819 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e81d |   mov SP, SP + 0x4
                               #      | _Z_call_39:
5a f8 f1 17                    # e821 |   jmp [${var__g_args}:rel + PC]
                               #      | _E_if_50:
                               #      | _C_if_50:
                               #      | _Z_if_50:
63 e0 e0 1c ff 12 00           # e825 |   mov [0xff1c], [${var__g_args}]
                               #      | _A_call_40:
e2 e0 1c ff                    # e82c |   push [0xff1c]
e0 e0 58 f0                    # e830 |   push ${const__data_6}
5c f8 06 f8                    # e834 |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e838 |   mov SP, SP + 0x4
                               #      | _Z_call_40:
                               #      | glb_jmp_to_stored_target:
62 e0 00 0a ff                 # e83c |   mov [0xff0a], 0
60 20 00                       # e841 |   mov A, 0
60 40 00                       # e844 |   mov B, 0
60 60 00                       # e847 |   mov C, 0
60 80 00                       # e84a |   mov D, 0
60 a0 00                       # e84d |   mov SP, 0
60 fc 00                       # e850 |   mov E, 0
60 fd 00                       # e853 |   mov F, 0
60 fe 00                       # e856 |   mov G, 0
60 ff 00                       # e859 |   mov H, 0
5a e0 1c ff                    # e85c |   jmp [0xff1c]
                               #      | _cleanup_fn_handle_jmp:
dc                             # e860 |   ret
                               #      | _end_fn_handle_jmp:
                               #      | 
                               #      | fn_syscall_entry:
                               #      | _begin_fn_syscall_entry:
                               #      | _A_if_52:
f0 ff 1c f8 14 08 00           # e861 |   jlt H, 0x14, ${_E_if_52}:rel + PC
dc                             # e868 |   ret
                               #      | _E_if_52:
                               #      | _C_if_52:
                               #      | _Z_if_52:
28 ff 1c 01                    # e869 |   shl H, 0x1
00 ff e0 b1 ef                 # e86d |   add H, ${const__SYSCALL_MAP}
5a ff                          # e872 |   jmp [H]
                               #      | _cleanup_fn_syscall_entry:
dc                             # e874 |   ret
                               #      | _end_fn_syscall_entry:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # e875 |   push B
e0 20                          # e877 |   push A
60 20 e0 fd 00                 # e879 |   mov A, 0xfd
60 40 00                       # e87e |   mov B, 0
54 e0 1c 1c 00 ff ff 02        # e881 |   mmap 0xff00, -1, 0x2
                               #      | _A_call_41:
e0 e0 78 f0                    # e889 |   push ${const__data_7}
5c f8 2f f9                    # e88d |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e891 |   mov SP, SP + 0x2
                               #      | _Z_call_41:
61 20 e0 1c ff                 # e895 |   mov A, [0xff1c]
                               #      | _A_scope_7:
                               #      | _B_scope_7:
e8 20 00 f8 20 00              # e89a |   jeq A, 0, ${_C_scope_7}:rel + PC
e8 20 e0 f8 00 e0 1a 00        # e8a0 |   jeq A, 0xe000, ${_C_scope_7}:rel + PC
                               #      | _A_call_42:
e0 20                          # e8a8 |   push A
e0 e0 ad f0                    # e8aa |   push ${const__data_8}
5c f8 8c f7                    # e8ae |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e8b2 |   mov SP, SP + 0x4
                               #      | _Z_call_42:
58 f8 86 ff                    # e8b6 |   jmp ${glb_jmp_to_stored_target}:rel + PC
                               #      | _C_scope_7:
                               #      | _Z_scope_7:
c6 e0 00 0a ff                 # e8ba |   inc [0xff0a], 0
                               #      | _A_loop_9:
                               #      | _BA_loop_9:
                               #      | _A_call_58:
5c f8 42 00                    # e8bf |   call ${fn_recv_command}:rel + PC
                               #      | _Z_call_58:
46 e0 0a ff                    # e8c3 |   inc [0xff0a]
60 20 ff                       # e8c7 |   mov A, H
                               #      | _A_if_78:
ec fe 00 f8 0a 00              # e8ca |   jne G, 0, ${_E_if_78}:rel + PC
58 f8 ef ff                    # e8d0 |   jmp ${_BA_loop_9}:rel + PC
                               #      | _E_if_78:
                               #      | _C_if_78:
                               #      | _Z_if_78:
                               #      | _A_if_79:
ec 20 00 f8 16 00              # e8d4 |   jne A, 0, ${_E_if_79}:rel + PC
                               #      | _A_call_59:
e0 e0 38 f1                    # e8da |   push ${const__str__UNKNOWN_COMMAND__endl}
5c f8 de f8                    # e8de |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e8e2 |   mov SP, SP + 0x2
                               #      | _Z_call_59:
58 f8 d9 ff                    # e8e6 |   jmp ${_BA_loop_9}:rel + PC
                               #      | _E_if_79:
                               #      | _C_if_79:
                               #      | _Z_if_79:
60 40 21                       # e8ea |   mov B, A*2
60 40 e8 68 f0                 # e8ed |   mov B, ${const__HANDLER_MAP} + -002 + B
e0 20                          # e8f2 |   push A
5e 40                          # e8f4 |   call [B]
e4 20                          # e8f6 |   pop A
                               #      | _BZ_loop_9:
58 f8 c7 ff                    # e8f8 |   jmp ${_BA_loop_9}:rel + PC
                               #      | _C_loop_9:
                               #      | _Z_loop_9:
                               #      | _cleanup_fn_main:
e4 20                          # e8fc |   pop A
e4 40                          # e8fe |   pop B
dc                             # e900 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_recv_command:
                               #      | _begin_fn_recv_command:
e0 80                          # e901 |   push D
e0 60                          # e903 |   push C
e0 40                          # e905 |   push B
e0 20                          # e907 |   push A
60 a0 bc fe                    # e909 |   mov SP, SP + -2
62 a0 00                       # e90d |   mov [SP], 0
60 a0 bc de                    # e910 |   mov SP, SP + -34
62 a0 00                       # e914 |   mov [SP], 0
60 20 a0                       # e917 |   mov A, SP
                               #      | _A_loop_10:
                               #      | _BA_loop_10:
                               #      | _A_call_43:
5c f8 4f f9                    # e91a |   call ${fn_getc}:rel + PC
                               #      | _Z_call_43:
60 60 ff                       # e91e |   mov C, H
62 e0 60 00 ff                 # e921 |   mov [0xff00], C
e8 60 1c f8 0a 30 00           # e926 |   jeq C, 0xa, ${_C_loop_10}:rel + PC
e8 60 1c f8 0d 29 00           # e92d |   jeq C, 0xd, ${_C_loop_10}:rel + PC
                               #      | _A_if_57:
f0 20 bc f8 1f 19 00           # e934 |   jlt A, SP + 0x1f, ${_E_if_57}:rel + PC
                               #      | _A_call_44:
e0 e0 d0 f0                    # e93b |   push ${const__data_9}
5c f8 7d f8                    # e93f |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e943 |   mov SP, SP + 0x2
                               #      | _Z_call_44:
e8 ff 00 f8 d3 00              # e947 |   jeq H, 0, ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_57:
                               #      | _C_if_57:
                               #      | _Z_if_57:
62 20 60                       # e94d |   mov [A], C
44 20                          # e950 |   inc A
                               #      | _BZ_loop_10:
58 f8 c8 ff                    # e952 |   jmp ${_BA_loop_10}:rel + PC
                               #      | _C_loop_10:
                               #      | _Z_loop_10:
                               #      | _A_call_45:
e0 1c 20                       # e956 |   push 0x20
e0 bc 02                       # e959 |   push SP + 0x2
5c f8 86 fa                    # e95c |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # e960 |   mov SP, SP + 0x4
                               #      | _Z_call_45:
60 60 ff                       # e964 |   mov C, H
                               #      | _A_if_59:
e8 60 00 f8 0f 00              # e967 |   jeq C, 0, ${_E_if_59}:rel + PC
66 60 00                       # e96d |   bmov [C], 0
44 60                          # e970 |   inc C
58 f8 08 00                    # e972 |   jmp ${_C_if_59}:rel + PC
                               #      | _E_if_59:
60 60 1c ff                    # e976 |   mov C, -1
                               #      | _C_if_59:
                               #      | _Z_if_59:
                               #      | _A_call_53:
e0 a0                          # e97a |   push SP
5c f8 b1 00                    # e97c |   call ${fn_parse_command_name}:rel + PC
60 a0 bc 02                    # e980 |   mov SP, SP + 0x2
                               #      | _Z_call_53:
e8 ff 00 f8 9c 00              # e984 |   jeq H, 0, ${_cleanup_fn_recv_command}:rel + PC
62 bc ff 22                    # e98a |   mov [SP + 0x22], H
                               #      |   # parse arguments
62 e0 00 10 00                 # e98e |   mov [${var__g_num_args}], 0
                               #      | _A_while_9:
                               #      | _BA_while_9:
fc 60 bc f8 20 7c 00           # e993 |   jge C, SP + 0x20, ${_C_while_9}:rel + PC
                               #      | _A_call_54:
e0 1c 20                       # e99a |   push 0x20
e0 60                          # e99d |   push C
5c f8 43 fa                    # e99f |   call ${fn_strchr}:rel + PC
60 a0 bc 04                    # e9a3 |   mov SP, SP + 0x4
                               #      | _Z_call_54:
60 80 ff                       # e9a7 |   mov D, H
                               #      | _A_if_75:
e8 80 00 f8 0d 00              # e9aa |   jeq D, 0, ${_E_if_75}:rel + PC
66 80 00                       # e9b0 |   bmov [D], 0
58 f8 08 00                    # e9b3 |   jmp ${_C_if_75}:rel + PC
                               #      | _E_if_75:
60 80 1c fe                    # e9b7 |   mov D, -2
                               #      | _C_if_75:
                               #      | _Z_if_75:
61 20 e0 10 00                 # e9bb |   mov A, [${var__g_num_args}]
                               #      | _A_if_76:
f0 20 1c f8 04 17 00           # e9c0 |   jlt A, 0x4, ${_E_if_76}:rel + PC
                               #      | _A_call_55:
e0 e0 0f f1                    # e9c7 |   push ${const__data_10}
5c f8 f1 f7                    # e9cb |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # e9cf |   mov SP, SP + 0x2
                               #      | _Z_call_55:
58 f8 47 00                    # e9d3 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_76:
                               #      | _C_if_76:
                               #      | _Z_if_76:
                               #      | _A_call_56:
e0 60                          # e9d7 |   push C
5c f8 ea f8                    # e9d9 |   call ${fn_atoi_16}:rel + PC
60 a0 bc 02                    # e9dd |   mov SP, SP + 0x2
                               #      | _Z_call_56:
                               #      | _A_if_77:
ec fe 00 f8 18 00              # e9e1 |   jne G, 0, ${_E_if_77}:rel + PC
                               #      | _A_call_57:
e0 20                          # e9e7 |   push A
e0 e0 24 f1                    # e9e9 |   push ${const__data_11}
5c f8 4d f6                    # e9ed |   call ${fn_printf}:rel + PC
60 a0 bc 04                    # e9f1 |   mov SP, SP + 0x4
                               #      | _Z_call_57:
58 f8 25 00                    # e9f5 |   jmp ${_L_fn_recv_command_1}:rel + PC
                               #      | _E_if_77:
                               #      | _C_if_77:
                               #      | _Z_if_77:
a8 40 20 1c 01                 # e9f9 |   shl B, A, 0x1
62 e8 ff 12 00                 # e9fe |   mov [${var__g_args} + B], H
c6 e0 20 10 00                 # ea03 |   inc [${var__g_num_args}], A
c4 60 80                       # ea08 |   inc C, D
                               #      | _BZ_while_9:
58 f8 88 ff                    # ea0b |   jmp ${_BA_while_9}:rel + PC
                               #      | _C_while_9:
                               #      | _Z_while_9:
c4 fe 00                       # ea0f |   inc G, 0
61 ff bc 22                    # ea12 |   mov H, [SP + 0x22]
58 f8 0a 00                    # ea16 |   jmp ${_cleanup_fn_recv_command}:rel + PC
                               #      | _L_fn_recv_command_1:
60 fe 00                       # ea1a |   mov G, 0
60 ff 00                       # ea1d |   mov H, 0
                               #      | _cleanup_fn_recv_command:
60 a0 bc 24                    # ea20 |   mov SP, SP + 0x24
e4 20                          # ea24 |   pop A
e4 40                          # ea26 |   pop B
e4 60                          # ea28 |   pop C
e4 80                          # ea2a |   pop D
dc                             # ea2c |   ret
                               #      | _end_fn_recv_command:
                               #      | 
                               #      | fn_parse_command_name:
                               #      | _begin_fn_parse_command_name:
e0 20                          # ea2d |   push A
61 20 bc 04                    # ea2f |   mov A, [SP + 0x4]
                               #      | _A_call_46:
e0 e0 e2 f0                    # ea33 |   push ${const__str__PING}
e0 20                          # ea37 |   push A
5c f8 73 f9                    # ea39 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # ea3d |   mov SP, SP + 0x4
                               #      | _Z_call_46:
                               #      | _A_if_61:
ec ff 00 f8 0d 00              # ea41 |   jne H, 0, ${_E_if_61}:rel + PC
c4 ff 00                       # ea47 |   inc H, 0
58 f8 af 00                    # ea4a |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_61:
                               #      | _C_if_61:
                               #      | _Z_if_61:
                               #      | _A_call_47:
e0 e0 e7 f0                    # ea4e |   push ${const__str__READ}
e0 20                          # ea52 |   push A
5c f8 58 f9                    # ea54 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # ea58 |   mov SP, SP + 0x4
                               #      | _Z_call_47:
                               #      | _A_if_63:
ec ff 00 f8 0e 00              # ea5c |   jne H, 0, ${_E_if_63}:rel + PC
60 ff 1c 02                    # ea62 |   mov H, 0x2
58 f8 93 00                    # ea66 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_63:
                               #      | _C_if_63:
                               #      | _Z_if_63:
                               #      | _A_call_48:
e0 e0 ec f0                    # ea6a |   push ${const__str__WRITE}
e0 20                          # ea6e |   push A
5c f8 3c f9                    # ea70 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # ea74 |   mov SP, SP + 0x4
                               #      | _Z_call_48:
                               #      | _A_if_65:
ec ff 00 f8 0e 00              # ea78 |   jne H, 0, ${_E_if_65}:rel + PC
60 ff 1c 03                    # ea7e |   mov H, 0x3
58 f8 77 00                    # ea82 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_65:
                               #      | _C_if_65:
                               #      | _Z_if_65:
                               #      | _A_call_49:
e0 e0 f2 f0                    # ea86 |   push ${const__str__READB}
e0 20                          # ea8a |   push A
5c f8 20 f9                    # ea8c |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # ea90 |   mov SP, SP + 0x4
                               #      | _Z_call_49:
                               #      | _A_if_67:
ec ff 00 f8 0e 00              # ea94 |   jne H, 0, ${_E_if_67}:rel + PC
60 ff 1c 04                    # ea9a |   mov H, 0x4
58 f8 5b 00                    # ea9e |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_67:
                               #      | _C_if_67:
                               #      | _Z_if_67:
                               #      | _A_call_50:
e0 e0 f8 f0                    # eaa2 |   push ${const__str__WRITEB}
e0 20                          # eaa6 |   push A
5c f8 04 f9                    # eaa8 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # eaac |   mov SP, SP + 0x4
                               #      | _Z_call_50:
                               #      | _A_if_69:
ec ff 00 f8 0e 00              # eab0 |   jne H, 0, ${_E_if_69}:rel + PC
60 ff 1c 05                    # eab6 |   mov H, 0x5
58 f8 3f 00                    # eaba |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_69:
                               #      | _C_if_69:
                               #      | _Z_if_69:
                               #      | _A_call_51:
e0 e0 ff f0                    # eabe |   push ${const__str__JMP}
e0 20                          # eac2 |   push A
5c f8 e8 f8                    # eac4 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # eac8 |   mov SP, SP + 0x4
                               #      | _Z_call_51:
                               #      | _A_if_71:
ec ff 00 f8 0e 00              # eacc |   jne H, 0, ${_E_if_71}:rel + PC
60 ff 1c 06                    # ead2 |   mov H, 0x6
58 f8 23 00                    # ead6 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_71:
                               #      | _C_if_71:
                               #      | _Z_if_71:
                               #      | _A_call_52:
e0 e0 03 f1                    # eada |   push ${const__str__JMP_PERSIST}
e0 20                          # eade |   push A
5c f8 cc f8                    # eae0 |   call ${fn_strcasecmp}:rel + PC
60 a0 bc 04                    # eae4 |   mov SP, SP + 0x4
                               #      | _Z_call_52:
                               #      | _A_if_73:
ec ff 00 f8 0e 00              # eae8 |   jne H, 0, ${_E_if_73}:rel + PC
60 ff 1c 07                    # eaee |   mov H, 0x7
58 f8 07 00                    # eaf2 |   jmp ${_cleanup_fn_parse_command_name}:rel + PC
                               #      | _E_if_73:
                               #      | _C_if_73:
                               #      | _Z_if_73:
60 ff 00                       # eaf6 |   mov H, 0
                               #      | _cleanup_fn_parse_command_name:
e4 20                          # eaf9 |   pop A
dc                             # eafb |   ret
                               #      | _end_fn_parse_command_name:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # eafc |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # eef1 |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__SYSCALL_MAP:
3a e0 57 e1 69 e2 6f e1 de e1 34 e2 1b e2 88 e2 c3 e2 13 e3 4c e3 85 e3 ac e3 e2 e3 01 e4 08 e4 13 e4 bc e1 ae e4 72 e5 # efb1 |   .data label_list:[$fn_printf, $fn_putc, $fn_getc, $fn_itoa_10, $fn_itoa_16, $fn_itoa_2, $fn_to_hex_digit, $fn_from_hex_digit, $fn_atoi_16, $fn_memset, $fn_memcpy, $fn_strcmp, $fn_strcasecmp, $fn_strchr, $fn_srand, $fn_rand, $fn__delay_impl, $fn_puts, $fn_decode_font, $fn_decode_font_16_12]
                               #      | const__data_1:
57 52 4f 4e 47 5f 4e 55 4d 5f 41 52 47 53 20 6e 65 65 64 3d 25 64 20 70 72 6f 76 69 64 65 64 3d 25 64 0a 00 # efd9 |   .data str:"WRONG_NUM_ARGS need=%d provided=%d\n"
                               #      | const__str__PONG__endl:
50 4f 4e 47 0a 00              # effd |   .data str:"PONG\n"
                               #      | const__str__INVALID_RANGE__endl:
49 4e 56 41 4c 49 44 5f 52 41 4e 47 45 0a 00 # f003 |   .data str:"INVALID_RANGE\n"
                               #      | const__str__NOT_ALIGNED__endl:
4e 4f 54 5f 41 4c 49 47 4e 45 44 0a 00 # f012 |   .data str:"NOT_ALIGNED\n"
                               #      | const__data_2:
52 45 41 44 5f 4f 4b 20 25 78 20 25 78 0a 00 # f01f |   .data str:"READ_OK %x %x\n"
                               #      | const__data_3:
57 52 49 54 45 5f 4f 4b 20 25 78 20 25 78 0a 00 # f02e |   .data str:"WRITE_OK %x %x\n"
                               #      | const__data_4:
24 49 4e 56 41 4c 49 44 5f 44 41 54 41 0a 00 # f03e |   .data str:"$INVALID_DATA\n"
                               #      | const__data_5:
4a 4d 50 5f 54 4f 20 25 78 0a 00 # f04d |   .data str:"JMP_TO %x\n"
                               #      | const__data_6:
4a 4d 50 5f 50 45 52 53 49 53 54 45 44 20 25 78 0a 00 # f058 |   .data str:"JMP_PERSISTED %x\n"
                               #      | const__HANDLER_MAP:
af e5 e9 e5 f8 e6 e9 e5 f8 e6 f8 e7 f8 e7 # f06a |   .data label_list:[$fn_handle_ping, $fn_handle_read, $fn_handle_write, $fn_handle_read, $fn_handle_write, $fn_handle_jmp, $fn_handle_jmp]
                               #      | const__data_7:
57 65 65 65 6b 6c 79 33 30 30 36 20 2d 20 48 61 72 64 77 61 72 65 20 76 31 2e 32 20 2d 20 42 6f 6f 74 6c 6f 61 64 65 72 20 76 32 2e 30 0a 52 45 41 44 59 0a 00 # f078 |   .data str:"Weeekly3006 - Hardware v1.2 - Bootloader v2.0\nREADY\n"
                               #      | const__data_8:
46 6f 75 6e 64 20 70 65 72 73 69 73 74 65 64 20 6a 75 6d 70 20 74 61 72 67 65 74 20 61 74 20 25 78 0a 00 # f0ad |   .data str:"Found persisted jump target at %x\n"
                               #      | const__data_9:
24 4f 56 45 52 46 4c 4f 57 20 6d 61 78 3d 33 31 0a 00 # f0d0 |   .data str:"$OVERFLOW max=31\n"
                               #      | const__str__PING:
50 49 4e 47 00                 # f0e2 |   .data str:"PING"
                               #      | const__str__READ:
52 45 41 44 00                 # f0e7 |   .data str:"READ"
                               #      | const__str__WRITE:
57 52 49 54 45 00              # f0ec |   .data str:"WRITE"
                               #      | const__str__READB:
52 45 41 44 42 00              # f0f2 |   .data str:"READB"
                               #      | const__str__WRITEB:
57 52 49 54 45 42 00           # f0f8 |   .data str:"WRITEB"
                               #      | const__str__JMP:
4a 4d 50 00                    # f0ff |   .data str:"JMP"
                               #      | const__str__JMP_PERSIST:
4a 4d 50 5f 50 45 52 53 49 53 54 00 # f103 |   .data str:"JMP_PERSIST"
                               #      | const__data_10:
54 4f 4f 5f 4d 41 4e 59 5f 41 52 47 53 20 6d 61 78 3d 34 0a 00 # f10f |   .data str:"TOO_MANY_ARGS max=4\n"
                               #      | const__data_11:
49 4e 56 41 4c 49 44 5f 41 52 47 20 69 64 78 3d 25 64 0a 00 # f124 |   .data str:"INVALID_ARG idx=%d\n"
                               #      | const__str__UNKNOWN_COMMAND__endl:
55 4e 4b 4e 4f 57 4e 5f 43 4f 4d 4d 41 4e 44 0a 00 # f138 |   .data str:"UNKNOWN_COMMAND\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xfb00
                               #      | SECTION_BEGIN_static_data:
                               #      | var__rand__state:
                               # fb00 |   .bss size:2 align:1
                               # fb02 |   .align dummy_size:14 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # fb10 |   .bss size:1280 align:16
                               #      | var__g_num_args:
                               # 10010 |   .bss size:2 align:1
                               #      | var__g_args:
                               # 10012 |   .bss size:10 align:2
                               #      | SECTION_END_static_data:
                               #      | 
