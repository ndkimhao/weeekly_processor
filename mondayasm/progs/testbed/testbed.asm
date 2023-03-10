                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_21:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_21:
d8                             # a009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 80                          # a00a |   push D
e0 60                          # a00c |   push C
e0 40                          # a00e |   push B
e0 20                          # a010 |   push A
                               #      | _A_call_2:
e0 fc                          # a012 |   push E
e0 e0 40 a3                    # a014 |   push ${const__str__Testbed__endl}
5c f8 4b 01                    # a018 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01c |   mov SP, SP + 0x2
e4 fc                          # a020 |   pop E
                               #      | _Z_call_2:
                               #      | _A_call_3:
e0 fc                          # a022 |   push E
e0 1c 06                       # a024 |   push 0x6
e0 00                          # a027 |   push 0
5c f8 74 01                    # a029 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a02d |   mov SP, SP + 0x4
e4 fc                          # a031 |   pop E
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 fc                          # a033 |   push E
e0 e0 0f 0f                    # a035 |   push 0xf0f
e0 00                          # a039 |   push 0
5c f8 84 01                    # a03b |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a03f |   mov SP, SP + 0x4
e4 fc                          # a043 |   pop E
                               #      | _Z_call_4:
                               #      | _A_call_5:
e0 fc                          # a045 |   push E
e0 1c ff                       # a047 |   push -1
e0 1c 01                       # a04a |   push 0x1
5c f8 72 01                    # a04d |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a051 |   mov SP, SP + 0x4
e4 fc                          # a055 |   pop E
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 fc                          # a057 |   push E
e0 e0 aa aa                    # a059 |   push 0xaaaa
e0 1c 02                       # a05d |   push 0x2
5c f8 5f 01                    # a060 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a064 |   mov SP, SP + 0x4
e4 fc                          # a068 |   pop E
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 fc                          # a06a |   push E
e0 1c 05                       # a06c |   push 0x5
e0 1c 02                       # a06f |   push 0x2
5c f8 2b 01                    # a072 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a076 |   mov SP, SP + 0x4
e4 fc                          # a07a |   pop E
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 fc                          # a07c |   push E
e0 e0 0f 0f                    # a07e |   push 0xf0f
e0 00                          # a082 |   push 0
5c f8 3b 01                    # a084 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a088 |   mov SP, SP + 0x4
e4 fc                          # a08c |   pop E
                               #      | _Z_call_8:
                               #      | _A_call_9:
e0 fc                          # a08e |   push E
e0 1c ff                       # a090 |   push -1
e0 1c 01                       # a093 |   push 0x1
5c f8 29 01                    # a096 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a09a |   mov SP, SP + 0x4
e4 fc                          # a09e |   pop E
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 fc                          # a0a0 |   push E
e0 e0 aa aa                    # a0a2 |   push 0xaaaa
e0 1c 02                       # a0a6 |   push 0x2
5c f8 16 01                    # a0a9 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0ad |   mov SP, SP + 0x4
e4 fc                          # a0b1 |   pop E
                               #      | _Z_call_10:
                               #      | _A_for_3:
60 20 00                       # a0b3 |   mov A, 0
                               #      | _BA_for_3:
                               #      | _A_call_13:
e0 fc                          # a0b6 |   push E
5c f8 2e 01                    # a0b8 |   call ${fn_gen_font}:rel + PC
e4 fc                          # a0bc |   pop E
                               #      | _Z_call_13:
                               #      | _A_if_4:
ec 20 00 f8 1c 00              # a0be |   jne A, 0, ${_E_if_4}:rel + PC
                               #      | _A_call_14:
e0 fc                          # a0c4 |   push E
e0 1c 0f                       # a0c6 |   push 0xf
e0 1c 05                       # a0c9 |   push 0x5
5c f8 d1 00                    # a0cc |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0d0 |   mov SP, SP + 0x4
e4 fc                          # a0d4 |   pop E
                               #      | _Z_call_14:
58 f8 16 00                    # a0d6 |   jmp ${_C_if_4}:rel + PC
                               #      | _E_if_4:
                               #      | _A_call_15:
e0 fc                          # a0da |   push E
e0 1c 0c                       # a0dc |   push 0xc
e0 1c 05                       # a0df |   push 0x5
5c f8 bb 00                    # a0e2 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a0e6 |   mov SP, SP + 0x4
e4 fc                          # a0ea |   pop E
                               #      | _Z_call_15:
                               #      | _C_if_4:
                               #      | _Z_if_4:
                               #      | _A_call_16:
e0 fc                          # a0ec |   push E
e0 e0 0f 0f                    # a0ee |   push 0xf0f
e0 00                          # a0f2 |   push 0
5c f8 cb 00                    # a0f4 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0f8 |   mov SP, SP + 0x4
e4 fc                          # a0fc |   pop E
                               #      | _Z_call_16:
                               #      | _A_call_17:
e0 fc                          # a0fe |   push E
e0 e0 a0 a0                    # a100 |   push 0xa0a0
e0 1c 01                       # a104 |   push 0x1
5c f8 b8 00                    # a107 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a10b |   mov SP, SP + 0x4
e4 fc                          # a10f |   pop E
                               #      | _Z_call_17:
                               #      | _A_call_18:
e0 fc                          # a111 |   push E
e0 e0 cc cc                    # a113 |   push 0xcccc
e0 1c 02                       # a117 |   push 0x2
5c f8 a5 00                    # a11a |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a11e |   mov SP, SP + 0x4
e4 fc                          # a122 |   pop E
                               #      | _Z_call_18:
                               #      | _A_call_19:
e0 fc                          # a124 |   push E
e0 e0 aa aa                    # a126 |   push 0xaaaa
e0 1c 03                       # a12a |   push 0x3
5c f8 92 00                    # a12d |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a131 |   mov SP, SP + 0x4
e4 fc                          # a135 |   pop E
                               #      | _Z_call_19:
62 e0 00 50 a8                 # a137 |   mov [${var__test_loop_target_v}], 0
                               #      | _A_call_20:
e0 fc                          # a13c |   push E
e0 00                          # a13e |   push 0
e0 e0 00 87                    # a140 |   push 0x8700
e0 e0 93 03                    # a144 |   push 0x393
e0 00                          # a148 |   push 0
5c f8 5b 01                    # a14a |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # a14e |   mov SP, SP + 0x8
e4 fc                          # a152 |   pop E
                               #      | _Z_call_20:
                               #      | _BZ_for_3:
3c 20                          # a154 |   not A
58 f8 60 ff                    # a156 |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_main:
e4 20                          # a15a |   pop A
e4 40                          # a15c |   pop B
e4 60                          # a15e |   pop C
e4 80                          # a160 |   pop D
dc                             # a162 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a163 |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a165 |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a169 |   bmov H, [A]
e8 ff 00 f8 16 00              # a16c |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a172 |   push H
5c f8 11 00                    # a174 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a178 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a17c |   inc A
58 f8 eb ff                    # a17e |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a182 |   pop A
dc                             # a184 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a185 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a18c |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a192 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a196 |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a19c |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # a19d |   push B
e0 20                          # a19f |   push A
61 20 bc 08                    # a1a1 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # a1a5 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # a1aa |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 50 a3 4f a8 01     # a1b1 |   mmap ${var__VIDEO_ROW_BUFFER}, ${var__VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # a1ba |   pop A
e4 40                          # a1bc |   pop B
dc                             # a1be |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # a1bf |   push A
61 fe bc 06                    # a1c1 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # a1c5 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_2:
60 20 e4 50 a3                 # a1cb |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_2:
fc 20 e0 f8 50 a8 13 00        # a1d0 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_2}:rel + PC
62 20 fe                       # a1d8 |   mov [A], G
                               #      | _BZ_for_2:
60 20 3c 50                    # a1db |   mov A, A + 0x50
58 f8 f1 ff                    # a1df |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # a1e3 |   pop A
dc                             # a1e5 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_gen_font:
                               #      | _begin_fn_gen_font:
e0 80                          # a1e6 |   push D
e0 60                          # a1e8 |   push C
e0 40                          # a1ea |   push B
e0 20                          # a1ec |   push A
60 a0 bc e0                    # a1ee |   mov SP, SP + -32
60 60 1c 20                    # a1f2 |   mov C, 0x20
                               #      | _A_for_4:
60 20 00                       # a1f6 |   mov A, 0
                               #      | _BA_for_4:
fc 20 1c f8 06 70 00           # a1f9 |   jge A, 0x6, ${_C_for_4}:rel + PC
                               #      | _A_if_3:
f2 e0 1c f8 52 a8 07 0e 00     # a200 |   jlt [${var__var_1}], 0x7, ${_E_if_3}:rel + PC
62 e0 00 52 a8                 # a209 |   mov [${var__var_1}], 0
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
46 e0 52 a8                    # a20e |   inc [${var__var_1}]
81 fc e0 1c 52 a8 08           # a212 |   add E, [${var__var_1}], 0x8
                               #      | _A_call_11:
e0 fc                          # a219 |   push E
e0 fc                          # a21b |   push E
e0 3c 01                       # a21d |   push A + 0x1
5c f8 7d ff                    # a220 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a224 |   mov SP, SP + 0x4
e4 fc                          # a228 |   pop E
                               #      | _Z_call_11:
                               #      | _A_for_5:
60 40 00                       # a22a |   mov B, 0
                               #      | _BA_for_5:
fc 40 1c f8 10 36 00           # a22d |   jge B, 0x10, ${_C_for_5}:rel + PC
                               #      | _A_syscall_1:
e0 fc                          # a234 |   push E
e0 60                          # a236 |   push C
e0 bc 04                       # a238 |   push SP + 0x4
60 ff 1c 13                    # a23b |   mov H, 0x13
5e e0 1e ff                    # a23f |   call [0xff1e]
60 a0 bc 04                    # a243 |   mov SP, SP + 0x4
e4 fc                          # a247 |   pop E
                               #      | _Z_syscall_1:
                               #      | _A_call_12:
e0 fc                          # a249 |   push E
e0 bc 02                       # a24b |   push SP + 0x2
e0 5c 0a                       # a24e |   push B + 0xa
5c f8 25 00                    # a251 |   call ${fn_fill_cell_content}:rel + PC
60 a0 bc 04                    # a255 |   mov SP, SP + 0x4
e4 fc                          # a259 |   pop E
                               #      | _Z_call_12:
44 60                          # a25b |   inc C
                               #      | _BZ_for_5:
44 40                          # a25d |   inc B
58 f8 ce ff                    # a25f |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _BZ_for_4:
44 20                          # a263 |   inc A
58 f8 94 ff                    # a265 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_gen_font:
60 a0 bc 20                    # a269 |   mov SP, SP + 0x20
e4 20                          # a26d |   pop A
e4 40                          # a26f |   pop B
e4 60                          # a271 |   pop C
e4 80                          # a273 |   pop D
dc                             # a275 |   ret
                               #      | _end_fn_gen_font:
                               #      | 
                               #      | fn_fill_cell_content:
                               #      | _begin_fn_fill_cell_content:
e0 40                          # a276 |   push B
e0 20                          # a278 |   push A
a9 20 bc 1c 06 01              # a27a |   shl A, [SP + 0x6], 0x1
61 40 bc 08                    # a280 |   mov B, [SP + 0x8]
                               #      | _A_for_6:
60 20 e4 50 a3                 # a284 |   mov A, ${var__VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_6:
fc 20 e0 f8 50 a8 17 00        # a289 |   jge A, ${var__VIDEO_ROW_BUFFER} + 0500, ${_C_for_6}:rel + PC
63 20 40                       # a291 |   mov [A], [B]
                               #      | _BZ_for_6:
60 20 3c 50                    # a294 |   mov A, A + 0x50
60 40 5c 02                    # a298 |   mov B, B + 0x2
58 f8 ed ff                    # a29c |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _cleanup_fn_fill_cell_content:
e4 20                          # a2a0 |   pop A
e4 40                          # a2a2 |   pop B
dc                             # a2a4 |   ret
                               #      | _end_fn_fill_cell_content:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # a2a5 |   push D
e0 60                          # a2a7 |   push C
e0 40                          # a2a9 |   push B
e0 20                          # a2ab |   push A
61 40 e0 10 ff                 # a2ad |   mov B, [0xff10]
61 60 e0 12 ff                 # a2b2 |   mov C, [0xff12]
61 80 e0 14 ff                 # a2b7 |   mov D, [0xff14]
61 20 bc 0e                    # a2bc |   mov A, [SP + 0xe]
60 ff 00                       # a2c0 |   mov H, 0
                               #      | _A_if_5:
fc 28 20 f8 09 00              # a2c3 |   jge A + B, A, ${_E_if_5}:rel + PC
c4 ff 00                       # a2c9 |   inc H, 0
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
60 40 44                       # a2cc |   mov B, B + A
81 20 bc ff 0c                 # a2cf |   add A, [SP + 0xc], H
60 ff 00                       # a2d4 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # a2d7 |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # a2dd |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # a2e3 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # a2e7 |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # a2ea |   mov C, C + A
81 20 bc ff 0a                 # a2ed |   add A, [SP + 0xa], H
60 80 84                       # a2f2 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # a2f5 |   mov A, [SP + 0x10]
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 14 ff                 # a2f9 |   mov H, [0xff14]
                               #      | _A_if_8:
f4 ff 80 f8 0a 00              # a2fe |   jle H, D, ${_E_if_8}:rel + PC
58 f8 33 00                    # a304 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_8:
ec ff 80 f8 2b 00              # a308 |   jne H, D, ${_E2_if_8}:rel + PC
61 ff e0 12 ff                 # a30e |   mov H, [0xff12]
                               #      | _A_if_9:
f4 ff 60 f8 0a 00              # a313 |   jle H, C, ${_E_if_9}:rel + PC
58 f8 1e 00                    # a319 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_9:
ec ff 60 f8 16 00              # a31d |   jne H, C, ${_E2_if_9}:rel + PC
fa e0 40 f8 10 ff 14 00        # a323 |   jgt [0xff10], B, ${_C_loop_2}:rel + PC
                               #      | _A_if_11:
e8 20 00 f8 08 00              # a32b |   jeq A, 0, ${_E_if_11}:rel + PC
5c 20                          # a331 |   call A
                               #      | _E_if_11:
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _E2_if_9:
                               #      | _C_if_9:
                               #      | _Z_if_9:
                               #      | _E2_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _BZ_loop_2:
58 f8 c6 ff                    # a333 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # a337 |   pop A
e4 40                          # a339 |   pop B
e4 60                          # a33b |   pop C
e4 80                          # a33d |   pop D
dc                             # a33f |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__str__Testbed__endl:
54 65 73 74 62 65 64 0a 00     # a340 |   .data str:"Testbed\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa349
                               #      | SECTION_BEGIN_static_data:
                               # a349 |   .align dummy_size:7 align:16
                               #      | var__VIDEO_ROW_BUFFER:
                               # a350 |   .bss size:1280 align:16
                               #      | var__test_loop_target_v:
                               # a850 |   .bss size:2 align:1
                               #      | var__var_1:
                               # a852 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
