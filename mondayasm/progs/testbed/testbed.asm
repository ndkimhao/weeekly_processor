                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_29:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_29:
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
e0 e0 eb a8                    # a014 |   push ${const__str__Testbed__endl}
5c f8 cf 01                    # a018 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01c |   mov SP, SP + 0x2
e4 fc                          # a020 |   pop E
                               #      | _Z_call_2:
                               #      | _A_for_2:
60 20 00                       # a022 |   mov A, 0
                               #      | _BA_for_2:
fc 20 1c f8 1e 2c 00           # a025 |   jge A, 0x1e, ${_C_for_2}:rel + PC
                               #      | _A_call_3:
e0 fc                          # a02c |   push E
e0 1c 08                       # a02e |   push 0x8
e0 20                          # a031 |   push A
5c f8 ee 01                    # a033 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # a037 |   mov SP, SP + 0x4
e4 fc                          # a03b |   pop E
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 fc                          # a03d |   push E
e0 00                          # a03f |   push 0
5c f8 02 02                    # a041 |   call ${fn_fill_page}:rel + PC
60 a0 bc 02                    # a045 |   mov SP, SP + 0x2
e4 fc                          # a049 |   pop E
                               #      | _Z_call_4:
                               #      | _BZ_for_2:
44 20                          # a04b |   inc A
58 f8 d8 ff                    # a04d |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _A_call_5:
e0 fc                          # a051 |   push E
e0 00                          # a053 |   push 0
e0 00                          # a055 |   push 0
5c f8 ca 01                    # a057 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # a05b |   mov SP, SP + 0x4
e4 fc                          # a05f |   pop E
                               #      | _Z_call_5:
                               #      | _A_call_7:
e0 fc                          # a061 |   push E
5c f8 01 02                    # a063 |   call ${fn_reset_color_palette}:rel + PC
e4 fc                          # a067 |   pop E
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 fc                          # a069 |   push E
e0 00                          # a06b |   push 0
e0 e0 8c 00                    # a06d |   push 0x8c
e0 e0 ff 00                    # a071 |   push 0xff
e0 1c 01                       # a075 |   push 0x1
5c f8 4c 02                    # a078 |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # a07c |   mov SP, SP + 0x8
e4 fc                          # a080 |   pop E
                               #      | _Z_call_8:
                               #      | _A_call_9:
e0 fc                          # a082 |   push E
e0 1c 06                       # a084 |   push 0x6
e0 00                          # a087 |   push 0
5c f8 98 01                    # a089 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # a08d |   mov SP, SP + 0x4
e4 fc                          # a091 |   pop E
                               #      | _Z_call_9:
                               #      | _A_call_10:
e0 fc                          # a093 |   push E
e0 e0 0f 0f                    # a095 |   push 0xf0f
e0 00                          # a099 |   push 0
5c f8 4a 02                    # a09b |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a09f |   mov SP, SP + 0x4
e4 fc                          # a0a3 |   pop E
                               #      | _Z_call_10:
                               #      | _A_call_11:
e0 fc                          # a0a5 |   push E
e0 1c ff                       # a0a7 |   push -1
e0 1c 01                       # a0aa |   push 0x1
5c f8 38 02                    # a0ad |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0b1 |   mov SP, SP + 0x4
e4 fc                          # a0b5 |   pop E
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 fc                          # a0b7 |   push E
e0 e0 aa aa                    # a0b9 |   push 0xaaaa
e0 1c 02                       # a0bd |   push 0x2
5c f8 25 02                    # a0c0 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0c4 |   mov SP, SP + 0x4
e4 fc                          # a0c8 |   pop E
                               #      | _Z_call_12:
                               #      | _A_call_13:
e0 fc                          # a0ca |   push E
e0 1c 05                       # a0cc |   push 0x5
e0 1c 02                       # a0cf |   push 0x2
5c f8 4f 01                    # a0d2 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # a0d6 |   mov SP, SP + 0x4
e4 fc                          # a0da |   pop E
                               #      | _Z_call_13:
                               #      | _A_call_14:
e0 fc                          # a0dc |   push E
e0 e0 0f 0f                    # a0de |   push 0xf0f
e0 00                          # a0e2 |   push 0
5c f8 01 02                    # a0e4 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0e8 |   mov SP, SP + 0x4
e4 fc                          # a0ec |   pop E
                               #      | _Z_call_14:
                               #      | _A_call_15:
e0 fc                          # a0ee |   push E
e0 1c ff                       # a0f0 |   push -1
e0 1c 01                       # a0f3 |   push 0x1
5c f8 ef 01                    # a0f6 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0fa |   mov SP, SP + 0x4
e4 fc                          # a0fe |   pop E
                               #      | _Z_call_15:
                               #      | _A_call_16:
e0 fc                          # a100 |   push E
e0 e0 aa aa                    # a102 |   push 0xaaaa
e0 1c 02                       # a106 |   push 0x2
5c f8 dc 01                    # a109 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a10d |   mov SP, SP + 0x4
e4 fc                          # a111 |   pop E
                               #      | _Z_call_16:
                               #      | _A_call_17:
e0 fc                          # a113 |   push E
e0 1c 07                       # a115 |   push 0x7
e0 1c 07                       # a118 |   push 0x7
5c f8 06 01                    # a11b |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # a11f |   mov SP, SP + 0x4
e4 fc                          # a123 |   pop E
                               #      | _Z_call_17:
                               #      | _A_call_18:
e0 fc                          # a125 |   push E
e0 1c a0                       # a127 |   push -96
e0 1c 01                       # a12a |   push 0x1
5c f8 b8 01                    # a12d |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a131 |   mov SP, SP + 0x4
e4 fc                          # a135 |   pop E
                               #      | _Z_call_18:
                               #      | _A_for_6:
60 20 00                       # a137 |   mov A, 0
                               #      | _BA_for_6:
                               #      | _A_call_21:
e0 fc                          # a13a |   push E
5c f8 d0 01                    # a13c |   call ${fn_gen_font}:rel + PC
e4 fc                          # a140 |   pop E
                               #      | _Z_call_21:
                               #      | _A_if_7:
ec 20 00 f8 1c 00              # a142 |   jne A, 0, ${_E_if_7}:rel + PC
                               #      | _A_call_22:
e0 fc                          # a148 |   push E
e0 1c 0f                       # a14a |   push 0xf
e0 1c 05                       # a14d |   push 0x5
5c f8 d1 00                    # a150 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # a154 |   mov SP, SP + 0x4
e4 fc                          # a158 |   pop E
                               #      | _Z_call_22:
58 f8 16 00                    # a15a |   jmp ${_C_if_7}:rel + PC
                               #      | _E_if_7:
                               #      | _A_call_23:
e0 fc                          # a15e |   push E
e0 1c 0c                       # a160 |   push 0xc
e0 1c 05                       # a163 |   push 0x5
5c f8 bb 00                    # a166 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # a16a |   mov SP, SP + 0x4
e4 fc                          # a16e |   pop E
                               #      | _Z_call_23:
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _A_call_24:
e0 fc                          # a170 |   push E
e0 e0 0f 0f                    # a172 |   push 0xf0f
e0 00                          # a176 |   push 0
5c f8 6d 01                    # a178 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a17c |   mov SP, SP + 0x4
e4 fc                          # a180 |   pop E
                               #      | _Z_call_24:
                               #      | _A_call_25:
e0 fc                          # a182 |   push E
e0 e0 a0 a0                    # a184 |   push 0xa0a0
e0 1c 01                       # a188 |   push 0x1
5c f8 5a 01                    # a18b |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a18f |   mov SP, SP + 0x4
e4 fc                          # a193 |   pop E
                               #      | _Z_call_25:
                               #      | _A_call_26:
e0 fc                          # a195 |   push E
e0 e0 cc cc                    # a197 |   push 0xcccc
e0 1c 02                       # a19b |   push 0x2
5c f8 47 01                    # a19e |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a1a2 |   mov SP, SP + 0x4
e4 fc                          # a1a6 |   pop E
                               #      | _Z_call_26:
                               #      | _A_call_27:
e0 fc                          # a1a8 |   push E
e0 e0 aa aa                    # a1aa |   push 0xaaaa
e0 1c 03                       # a1ae |   push 0x3
5c f8 34 01                    # a1b1 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a1b5 |   mov SP, SP + 0x4
e4 fc                          # a1b9 |   pop E
                               #      | _Z_call_27:
62 e0 00 00 b8                 # a1bb |   mov [${var__test_loop_target_v}], 0
                               #      | _A_call_28:
e0 fc                          # a1c0 |   push E
e0 00                          # a1c2 |   push 0
e0 e0 00 87                    # a1c4 |   push 0x8700
e0 e0 93 03                    # a1c8 |   push 0x393
e0 00                          # a1cc |   push 0
5c f8 ca 01                    # a1ce |   call ${fn__delay_impl}:rel + PC
60 a0 bc 08                    # a1d2 |   mov SP, SP + 0x8
e4 fc                          # a1d6 |   pop E
                               #      | _Z_call_28:
                               #      | _BZ_for_6:
3c 20                          # a1d8 |   not A
58 f8 60 ff                    # a1da |   jmp ${_BA_for_6}:rel + PC
                               #      | _C_for_6:
                               #      | _Z_for_6:
                               #      | _cleanup_fn_main:
e4 20                          # a1de |   pop A
e4 40                          # a1e0 |   pop B
e4 60                          # a1e2 |   pop C
e4 80                          # a1e4 |   pop D
dc                             # a1e6 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a1e7 |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a1e9 |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a1ed |   bmov H, [A]
e8 ff 00 f8 16 00              # a1f0 |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a1f6 |   push H
5c f8 11 00                    # a1f8 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a1fc |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a200 |   inc A
58 f8 eb ff                    # a202 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a206 |   pop A
dc                             # a208 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a209 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a210 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a216 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a21a |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a220 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_switch_screen_page:
                               #      | _begin_fn_switch_screen_page:
e0 40                          # a221 |   push B
e0 20                          # a223 |   push A
61 20 bc 08                    # a225 |   mov A, [SP + 0x8]
60 20 e4 a0 00                 # a229 |   mov A, 0xa0 + A
89 40 bc e0 06 00 05           # a22e |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 00 a9 ff ad 04     # a235 |   mmap ${var__VIDEO_PAGE_BUFFER}, ${var__VIDEO_PAGE_BUFFER} + 04ff, 0x4
                               #      | _cleanup_fn_switch_screen_page:
e4 20                          # a23e |   pop A
e4 40                          # a240 |   pop B
dc                             # a242 |   ret
                               #      | _end_fn_switch_screen_page:
                               #      | 
                               #      | fn_fill_page:
                               #      | _begin_fn_fill_page:
e0 20                          # a243 |   push A
61 fe bc 04                    # a245 |   mov G, [SP + 0x4]
                               #      | _A_for_3:
60 20 e0 00 a9                 # a249 |   mov A, ${var__VIDEO_PAGE_BUFFER}
                               #      | _BA_for_3:
fc 20 e0 f8 00 ae 13 00        # a24e |   jge A, ${var__VIDEO_PAGE_BUFFER} + 0500, ${_C_for_3}:rel + PC
62 20 fe                       # a256 |   mov [A], G
                               #      | _BZ_for_3:
60 20 3c 02                    # a259 |   mov A, A + 0x2
58 f8 f1 ff                    # a25d |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_fill_page:
e4 20                          # a261 |   pop A
dc                             # a263 |   ret
                               #      | _end_fn_fill_page:
                               #      | 
                               #      | fn_reset_color_palette:
                               #      | _begin_fn_reset_color_palette:
e0 80                          # a264 |   push D
e0 60                          # a266 |   push C
e0 40                          # a268 |   push B
e0 20                          # a26a |   push A
                               #      | _A_for_4:
60 20 00                       # a26c |   mov A, 0
                               #      | _BA_for_4:
fc 20 1c f8 08 4c 00           # a26f |   jge A, 0x8, ${_C_for_4}:rel + PC
98 40 20 1c 02                 # a276 |   getb B, A, 0x2
                               #      | _A_if_3:
e8 40 00 f8 0b 00              # a27b |   jeq B, 0, ${_E_if_3}:rel + PC
60 40 e0 ff 00                 # a281 |   mov B, 0xff
                               #      | _E_if_3:
                               #      | _C_if_3:
                               #      | _Z_if_3:
98 60 20 1c 01                 # a286 |   getb C, A, 0x1
                               #      | _A_if_4:
e8 60 00 f8 0b 00              # a28b |   jeq C, 0, ${_E_if_4}:rel + PC
60 60 e0 ff 00                 # a291 |   mov C, 0xff
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
98 80 20 00                    # a296 |   getb D, A, 0
                               #      | _A_if_5:
e8 80 00 f8 0b 00              # a29a |   jeq D, 0, ${_E_if_5}:rel + PC
60 80 e0 ff 00                 # a2a0 |   mov D, 0xff
                               #      | _E_if_5:
                               #      | _C_if_5:
                               #      | _Z_if_5:
                               #      | _A_call_6:
e0 80                          # a2a5 |   push D
e0 60                          # a2a7 |   push C
e0 40                          # a2a9 |   push B
e0 20                          # a2ab |   push A
5c f8 17 00                    # a2ad |   call ${fn_set_color_palette}:rel + PC
60 a0 bc 08                    # a2b1 |   mov SP, SP + 0x8
                               #      | _Z_call_6:
                               #      | _BZ_for_4:
44 20                          # a2b5 |   inc A
58 f8 b8 ff                    # a2b7 |   jmp ${_BA_for_4}:rel + PC
                               #      | _C_for_4:
                               #      | _Z_for_4:
                               #      | _cleanup_fn_reset_color_palette:
e4 20                          # a2bb |   pop A
e4 40                          # a2bd |   pop B
e4 60                          # a2bf |   pop C
e4 80                          # a2c1 |   pop D
dc                             # a2c3 |   ret
                               #      | _end_fn_reset_color_palette:
                               #      | 
                               #      | fn_set_color_palette:
                               #      | _begin_fn_set_color_palette:
e0 20                          # a2c4 |   push A
ad 20 bc 1c 04 07              # a2c6 |   and A, [SP + 0x4], 0x7
28 20 1c 01                    # a2cc |   shl A, 0x1
63 e4 bc 00 a9 0a              # a2d0 |   mov [${var__VIDEO_PAGE_BUFFER} + A], [SP + 0xa]
63 e4 bc 10 a9 08              # a2d6 |   mov [${var__VIDEO_PAGE_BUFFER} + 0010 + A], [SP + 0x8]
63 e4 bc 20 a9 06              # a2dc |   mov [${var__VIDEO_PAGE_BUFFER} + 0020 + A], [SP + 0x6]
                               #      | _cleanup_fn_set_color_palette:
e4 20                          # a2e2 |   pop A
dc                             # a2e4 |   ret
                               #      | _end_fn_set_color_palette:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # a2e5 |   push A
61 fe bc 06                    # a2e7 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # a2eb |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_5:
60 20 e4 00 a9                 # a2f1 |   mov A, ${var__VIDEO_PAGE_BUFFER} + A
                               #      | _BA_for_5:
fc 20 e0 f8 00 ae 13 00        # a2f6 |   jge A, ${var__VIDEO_PAGE_BUFFER} + 0500, ${_C_for_5}:rel + PC
62 20 fe                       # a2fe |   mov [A], G
                               #      | _BZ_for_5:
60 20 3c 50                    # a301 |   mov A, A + 0x50
58 f8 f1 ff                    # a305 |   jmp ${_BA_for_5}:rel + PC
                               #      | _C_for_5:
                               #      | _Z_for_5:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # a309 |   pop A
dc                             # a30b |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn_gen_font:
                               #      | _begin_fn_gen_font:
e0 80                          # a30c |   push D
e0 60                          # a30e |   push C
e0 40                          # a310 |   push B
e0 20                          # a312 |   push A
60 60 1c 20                    # a314 |   mov C, 0x20
                               #      | _A_for_7:
60 20 00                       # a318 |   mov A, 0
                               #      | _BA_for_7:
fc 20 1c f8 06 74 00           # a31b |   jge A, 0x6, ${_C_for_7}:rel + PC
                               #      | _A_if_6:
f2 e0 1c f8 02 b8 07 0e 00     # a322 |   jlt [${var__var_1}], 0x7, ${_E_if_6}:rel + PC
62 e0 00 02 b8                 # a32b |   mov [${var__var_1}], 0
                               #      | _E_if_6:
                               #      | _C_if_6:
                               #      | _Z_if_6:
46 e0 02 b8                    # a330 |   inc [${var__var_1}]
81 fc e0 1c 02 b8 08           # a334 |   add E, [${var__var_1}], 0x8
                               #      | _A_call_19:
e0 fc                          # a33b |   push E
e0 fc                          # a33d |   push E
e0 3c 01                       # a33f |   push A + 0x1
5c f8 df fe                    # a342 |   call ${fn_switch_screen_page}:rel + PC
60 a0 bc 04                    # a346 |   mov SP, SP + 0x4
e4 fc                          # a34a |   pop E
                               #      | _Z_call_19:
                               #      | _A_call_20:
e0 fc                          # a34c |   push E
e0 1c ff                       # a34e |   push -1
e0 1c 0a                       # a351 |   push 0xa
5c f8 91 ff                    # a354 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a358 |   mov SP, SP + 0x4
e4 fc                          # a35c |   pop E
                               #      | _Z_call_20:
                               #      | _A_for_8:
60 40 00                       # a35e |   mov B, 0
                               #      | _BA_for_8:
fc 40 1c f8 10 28 00           # a361 |   jge B, 0x10, ${_C_for_8}:rel + PC
                               #      | _A_syscall_1:
e0 fc                          # a368 |   push E
e0 60                          # a36a |   push C
e0 5c 0a                       # a36c |   push B + 0xa
e0 e0 00 a9                    # a36f |   push ${var__VIDEO_PAGE_BUFFER}
60 ff 1c 1d                    # a373 |   mov H, 0x1d
5e e0 1e ff                    # a377 |   call [0xff1e]
60 a0 bc 06                    # a37b |   mov SP, SP + 0x6
e4 fc                          # a37f |   pop E
                               #      | _Z_syscall_1:
44 60                          # a381 |   inc C
                               #      | _BZ_for_8:
44 40                          # a383 |   inc B
58 f8 dc ff                    # a385 |   jmp ${_BA_for_8}:rel + PC
                               #      | _C_for_8:
                               #      | _Z_for_8:
                               #      | _BZ_for_7:
44 20                          # a389 |   inc A
58 f8 90 ff                    # a38b |   jmp ${_BA_for_7}:rel + PC
                               #      | _C_for_7:
                               #      | _Z_for_7:
                               #      | _cleanup_fn_gen_font:
e4 20                          # a38f |   pop A
e4 40                          # a391 |   pop B
e4 60                          # a393 |   pop C
e4 80                          # a395 |   pop D
dc                             # a397 |   ret
                               #      | _end_fn_gen_font:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # a398 |   push D
e0 60                          # a39a |   push C
e0 40                          # a39c |   push B
e0 20                          # a39e |   push A
61 40 e0 10 ff                 # a3a0 |   mov B, [0xff10]
61 60 e0 12 ff                 # a3a5 |   mov C, [0xff12]
61 80 e0 14 ff                 # a3aa |   mov D, [0xff14]
61 20 bc 0e                    # a3af |   mov A, [SP + 0xe]
60 ff 00                       # a3b3 |   mov H, 0
                               #      | _A_if_8:
fc 28 20 f8 09 00              # a3b6 |   jge A + B, A, ${_E_if_8}:rel + PC
c4 ff 00                       # a3bc |   inc H, 0
                               #      | _E_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
60 40 44                       # a3bf |   mov B, B + A
81 20 bc ff 0c                 # a3c2 |   add A, [SP + 0xc], H
60 ff 00                       # a3c7 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # a3ca |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # a3d0 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # a3d6 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # a3da |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # a3dd |   mov C, C + A
81 20 bc ff 0a                 # a3e0 |   add A, [SP + 0xa], H
60 80 84                       # a3e5 |   mov D, D + A
                               #      |   # delay loop
61 20 bc 10                    # a3e8 |   mov A, [SP + 0x10]
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 10 ff                 # a3ec |   mov H, [0xff10]
61 fe e0 12 ff                 # a3f1 |   mov G, [0xff12]
61 fc e0 14 ff                 # a3f6 |   mov E, [0xff14]
                               #      | _A_if_11:
e8 fc 80 f8 10 00              # a3fb |   jeq E, D, ${_E_if_11}:rel + PC
f8 fc 80 f8 2c 00              # a401 |   jgt E, D, ${_C_loop_2}:rel + PC
58 f8 22 00                    # a407 |   jmp ${_C_if_11}:rel + PC
                               #      | _E_if_11:
                               #      | _A_if_13:
e8 fe 60 f8 10 00              # a40b |   jeq G, C, ${_E_if_13}:rel + PC
f8 fe 60 f8 1c 00              # a411 |   jgt G, C, ${_C_loop_2}:rel + PC
58 f8 12 00                    # a417 |   jmp ${_C_if_13}:rel + PC
                               #      | _E_if_13:
f8 ff 40 f8 12 00              # a41b |   jgt H, B, ${_C_loop_2}:rel + PC
                               #      | _A_if_16:
e8 20 00 f8 08 00              # a421 |   jeq A, 0, ${_E_if_16}:rel + PC
5c 20                          # a427 |   call A
                               #      | _E_if_16:
                               #      | _C_if_16:
                               #      | _Z_if_16:
                               #      | _C_if_13:
                               #      | _Z_if_13:
                               #      | _C_if_11:
                               #      | _Z_if_11:
                               #      | _BZ_loop_2:
58 f8 c3 ff                    # a429 |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # a42d |   pop A
e4 40                          # a42f |   pop B
e4 60                          # a431 |   pop C
e4 80                          # a433 |   pop D
dc                             # a435 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const__FONT_16_12_COMPRESSED:
00 00 38 20 01 8e 08 10 e0 88 60 00 38 22 1c 7f e3 8f fc 60 38 08 70 fe e2 23 c0 45 c3 fb 88 81 c4 47 87 f7 01 0c 1c 81 f8 83 f0 80 e0 81 c0 83 80 87 00 8e 00 9c 70 b8 e0 e0 38 1c 70 44 70 38 e0 21 d0 e3 9e 27 10 43 bf c6 00 e0 80 e0 61 80 00 38 c0 70 60 e0 20 07 06 0e 30 18 38 06 70 30 e0 80 07 03 0e 01 98 0e c1 9c 6c 38 20 77 fc b8 d8 76 0c c0 07 04 07 7f c9 80 00 1c 04 1c 03 30 01 c7 f2 00 00 0e 02 10 38 80 38 40 70 40 70 20 70 10 70 08 e0 08 c0 38 7c 71 04 71 84 e2 89 c4 93 88 a7 10 ce 20 8e 1f 18 38 20 70 70 e0 99 c1 00 0e 3f 98 38 7c 71 04 71 00 38 70 70 18 e0 08 e3 f9 80 38 7c 71 04 e2 00 70 f0 8e 20 9c 3e 30 38 c0 71 40 e2 41 c4 43 88 47 10 43 8f e7 10 06 00 38 fe 70 04 38 7e 71 00 1c 41 38 7c 60 38 3c 70 04 38 7e 71 04 0e 1f 18 38 fe 71 04 e2 01 c2 01 c1 01 c0 81 c0 41 80 38 7c 71 04 1c 3e 21 c3 e3 00 38 7c 71 04 0e 3f 1c 40 1c 30 38 1e 60 07 01 08 38 08 40 07 01 08 38 08 38 06 60 1c c0 38 60 70 30 e0 19 c0 0e e0 61 c3 03 98 06 00 07 1f c8 e3 f9 00 1c 00 f8 06 70 30 e1 81 cc 02 e0 61 c0 33 80 1e 00 38 7c 71 04 71 00 70 e0 e0 20 ce 02 10 38 7c 71 04 e3 c9 c4 50 38 f2 70 04 e3 f1 80 38 7c 71 04 1c 7f 20 c0 38 7e 71 04 38 7e 41 c3 f3 00 38 7c 71 04 e0 08 07 10 4e 1f 18 38 1e 70 c4 e2 08 07 0c 4e 07 98 38 fe 70 04 1c 1f 21 c7 f3 00 38 fe 70 04 1c 1f 20 c0 38 7c 71 04 e0 08 71 c4 e2 08 38 7c 60 38 82 07 1f c8 30 38 f8 70 40 00 e3 e1 80 38 e0 71 00 03 88 23 87 c6 00 38 82 70 84 e0 89 c0 93 80 a7 00 cb 81 27 04 4e 10 9c 41 30 38 02 00 38 fe 60 38 80 f1 83 e2 8b c4 a7 88 8f 10 10 60 38 82 38 86 71 14 e2 49 c5 13 8c 27 10 41 80 38 7c 71 04 00 e1 f1 80 38 7e 71 04 1c 3f 38 02 06 00 38 7c 71 04 00 e1 f1 c1 83 8c 06 38 7e 71 04 1c 3f 38 0a 70 24 e0 89 c2 13 88 26 00 38 7c 71 04 e0 08 70 f8 e2 00 71 04 e1 f1 80 3b fe 70 40 00 60 38 82 00 38 7c 60 38 80 9c 20 9c 11 1c 0a 1c 04 18 38 80 83 88 8f 12 9e 28 bc 60 f8 80 e0 38 80 f0 82 e0 89 c0 a3 80 81 c0 a3 82 27 08 2e 20 38 38 80 f0 82 e0 89 c0 a3 80 80 18 38 fe 71 00 70 80 e0 81 c0 83 80 87 00 8e 00 8e 3f 98 38 38 70 10 00 e0 e1 80 1c 01 38 04 70 10 e0 41 c1 03 84 07 10 0e 40 1d 00 3c 00 60 38 0e 70 10 00 e0 39 80 70 30 e1 99 cc 0f 00 00 00 03 8f e4 e0 20 e0 c1 80 00 07 0f 0e 20 0e 3f 1c 41 0e 3f 18 38 02 1c 3f 38 82 03 87 e6 00 07 0f 8e 20 9c 01 07 10 4e 1f 18 38 80 1c 7e 38 82 03 8f c6 00 07 0f 8e 20 87 1f ce 00 9c 41 38 7c 60 38 f0 70 10 70 7c 80 c0 07 1f 8e 20 80 e3 f1 c4 01 c3 f0 38 02 1c 3f 38 82 01 80 38 20 4e 0e 1c 10 01 c7 c3 00 38 20 4e 08 00 1c 11 38 1c 00 38 02 1c 61 38 32 70 1c e0 19 c0 d3 86 27 10 4e 40 98 38 38 70 40 00 e3 e1 80 07 0f fe 22 20 60 07 0f ce 20 80 60 07 0f 8e 20 80 e1 f1 80 07 0f ce 20 80 e1 f9 c0 10 07 1f 8e 20 80 e3 f1 c4 00 07 1e 4e 03 9c 01 01 80 07 0f 8e 20 9c 01 38 7c 71 00 71 04 e1 f1 80 38 08 1c 7f 20 71 e0 c0 07 10 40 38 fc 60 07 10 17 08 27 04 47 02 8e 02 18 07 10 13 88 88 e1 dd 80 07 10 1e 10 5c 11 38 1c 70 28 e0 89 c2 0b 88 0e 00 07 10 40 38 fc 71 00 70 f0 07 1f ce 20 1c 20 38 20 70 20 e0 21 c0 23 8f e6 00 38 f0 70 10 1c 03 21 c7 83 00 38 20 00 18 38 1e 70 40 1c 60 21 c0 f3 00 71 38 e1 c9 80 00 00 00 # a436 |   .data raw:
                               #      | const__FONT_16_12_INDEX:
00 00 02 00 08 00 0c 00 14 00 26 00 3a 00 4b 00 51 00 5c 00 67 00 74 00 7a 00 80 00 84 00 88 00 97 00 a9 00 b4 00 c3 00 d0 00 e1 00 ee 00 f9 00 08 01 12 01 1f 01 25 01 2d 01 3e 01 44 01 55 01 62 01 71 01 79 01 83 01 8e 01 99 01 a3 01 ab 01 b8 01 be 01 c6 01 d0 01 e4 01 ea 01 f7 01 06 02 0e 02 18 02 23 02 34 02 43 02 49 02 4f 02 5a 02 67 02 79 02 84 02 96 02 9e 02 b2 02 ba 02 c2 02 c6 02 cc 02 d7 02 e1 02 ec 02 f6 02 03 03 0b 03 16 03 1e 03 28 03 32 03 44 03 4c 03 52 03 58 03 60 03 69 03 72 03 7a 03 89 03 91 03 97 03 a2 03 aa 03 bb 03 c4 03 d5 03 df 03 e3 03 ed 03 f3 03 # a82b |   .data list:[0x0000, 0x0002, 0x0008, 0x000c, 0x0014, 0x0026, 0x003a, 0x004b, 0x0051, 0x005c, 0x0067, 0x0074, 0x007a, 0x0080, 0x0084, 0x0088, 0x0097, 0x00a9, 0x00b4, 0x00c3, 0x00d0, 0x00e1, 0x00ee, 0x00f9, 0x0108, 0x0112, 0x011f, 0x0125, 0x012d, 0x013e, 0x0144, 0x0155, 0x0162, 0x0171, 0x0179, 0x0183, 0x018e, 0x0199, 0x01a3, 0x01ab, 0x01b8, 0x01be, 0x01c6, 0x01d0, 0x01e4, 0x01ea, 0x01f7, 0x0206, 0x020e, 0x0218, 0x0223, 0x0234, 0x0243, 0x0249, 0x024f, 0x025a, 0x0267, 0x0279, 0x0284, 0x0296, 0x029e, 0x02b2, 0x02ba, 0x02c2, 0x02c6, 0x02cc, 0x02d7, 0x02e1, 0x02ec, 0x02f6, 0x0303, 0x030b, 0x0316, 0x031e, 0x0328, 0x0332, 0x0344, 0x034c, 0x0352, 0x0358, 0x0360, 0x0369, 0x0372, 0x037a, 0x0389, 0x0391, 0x0397, 0x03a2, 0x03aa, 0x03bb, 0x03c4, 0x03d5, 0x03df, 0x03e3, 0x03ed, 0x03f3]
                               #      | const__str__Testbed__endl:
54 65 73 74 62 65 64 0a 00     # a8eb |   .data str:"Testbed\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa8f4
                               #      | SECTION_BEGIN_static_data:
                               # a8f4 |   .align dummy_size:12 align:16
                               #      | var__VIDEO_PAGE_BUFFER:
                               # a900 |   .bss size:3840 align:16
                               #      | var__test_loop_target_v:
                               # b800 |   .bss size:2 align:1
                               #      | var__var_1:
                               # b802 |   .bss size:2 align:1
                               #      | SECTION_END_static_data:
                               #      | 
