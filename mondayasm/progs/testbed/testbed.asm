                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_14:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_14:
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
e0 e0 e9 a1                    # a012 |   push ${const_data_1}
5c f8 c1 00                    # a016 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01a |   mov SP, SP + 0x2
                               #      | _Z_call_2:
                               #      | _A_call_3:
e0 1c 06                       # a01e |   push 0x6
e0 00                          # a021 |   push 0
5c f8 ee 00                    # a023 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a027 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 e0 0f 0f                    # a02b |   push 0xf0f
e0 00                          # a02f |   push 0
5c f8 02 01                    # a031 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a035 |   mov SP, SP + 0x4
                               #      | _Z_call_4:
                               #      | _A_call_5:
e0 1c ff                       # a039 |   push 0xff
e0 1c 01                       # a03c |   push 0x1
5c f8 f4 00                    # a03f |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a043 |   mov SP, SP + 0x4
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 1c 05                       # a047 |   push 0x5
e0 1c 02                       # a04a |   push 0x2
5c f8 c4 00                    # a04d |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a051 |   mov SP, SP + 0x4
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 e0 0f 0f                    # a055 |   push 0xf0f
e0 00                          # a059 |   push 0
5c f8 d8 00                    # a05b |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a05f |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 1c ff                       # a063 |   push 0xff
e0 1c 01                       # a066 |   push 0x1
5c f8 ca 00                    # a069 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a06d |   mov SP, SP + 0x4
                               #      | _Z_call_8:
                               #      | _A_for_3:
60 20 00                       # a071 |   mov A, 0
                               #      | _BA_for_3:
                               #      | _A_if_3:
ec 20 00 f8 18 00              # a074 |   jne A, 0, ${_E_if_3}:rel + PC
                               #      | _A_call_9:
e0 1c 07                       # a07a |   push 0x7
e0 1c 05                       # a07d |   push 0x5
5c f8 91 00                    # a080 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a084 |   mov SP, SP + 0x4
                               #      | _Z_call_9:
58 f8 12 00                    # a088 |   jmp ${_C_if_3}:rel + PC
                               #      | _E_if_3:
                               #      | _A_call_10:
e0 1c 05                       # a08c |   push 0x5
e0 1c 05                       # a08f |   push 0x5
5c f8 7f 00                    # a092 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a096 |   mov SP, SP + 0x4
                               #      | _Z_call_10:
                               #      | _C_if_3:
                               #      | _Z_if_3:
                               #      | _A_call_11:
e0 e0 0f 0f                    # a09a |   push 0xf0f
e0 00                          # a09e |   push 0
5c f8 93 00                    # a0a0 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0a4 |   mov SP, SP + 0x4
                               #      | _Z_call_11:
                               #      | _A_call_12:
e0 1c ff                       # a0a8 |   push 0xff
e0 1c 01                       # a0ab |   push 0x1
5c f8 85 00                    # a0ae |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a0b2 |   mov SP, SP + 0x4
                               #      | _Z_call_12:
                               #      | _A_call_13:
e0 e0 00 87                    # a0b6 |   push 0x8700
e0 e0 93 03                    # a0ba |   push 0x393
e0 00                          # a0be |   push 0
5c f8 9a 00                    # a0c0 |   call ${fn__delay_impl}:rel + PC
60 a0 bc 06                    # a0c4 |   mov SP, SP + 0x6
                               #      | _Z_call_13:
                               #      | _BZ_for_3:
3c 20                          # a0c8 |   not A
58 f8 aa ff                    # a0ca |   jmp ${_BA_for_3}:rel + PC
                               #      | _C_for_3:
                               #      | _Z_for_3:
                               #      | _cleanup_fn_main:
e4 20                          # a0ce |   pop A
e4 40                          # a0d0 |   pop B
e4 60                          # a0d2 |   pop C
e4 80                          # a0d4 |   pop D
dc                             # a0d6 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a0d7 |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a0d9 |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a0dd |   bmov H, [A]
e8 ff 00 f8 16 00              # a0e0 |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a0e6 |   push H
5c f8 11 00                    # a0e8 |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a0ec |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a0f0 |   inc A
58 f8 eb ff                    # a0f2 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a0f6 |   pop A
dc                             # a0f8 |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a0f9 |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a100 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a106 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a10a |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a110 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # a111 |   push B
e0 20                          # a113 |   push A
61 20 bc 08                    # a115 |   mov A, [SP + 0x8]
60 20 e4 f0 00                 # a119 |   mov A, 0xf0 + A
89 40 bc e0 06 00 05           # a11e |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 00 a2 ff a6 01     # a125 |   mmap ${var_VIDEO_ROW_BUFFER}, ${var_VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # a12e |   pop A
e4 40                          # a130 |   pop B
dc                             # a132 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # a133 |   push A
61 fe bc 06                    # a135 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # a139 |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_2:
60 20 e4 00 a2                 # a13f |   mov A, ${var_VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_2:
fc 20 e0 f8 00 a7 13 00        # a144 |   jge A, ${var_VIDEO_ROW_BUFFER} + 0500, ${_C_for_2}:rel + PC
62 20 fe                       # a14c |   mov [A], G
                               #      | _BZ_for_2:
60 20 3c 50                    # a14f |   mov A, A + 0x50
58 f8 f1 ff                    # a153 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # a157 |   pop A
dc                             # a159 |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | fn__delay_impl:
                               #      | _begin_fn__delay_impl:
e0 80                          # a15a |   push D
e0 60                          # a15c |   push C
e0 40                          # a15e |   push B
e0 20                          # a160 |   push A
61 40 e0 10 ff                 # a162 |   mov B, [0xff10]
61 60 e0 12 ff                 # a167 |   mov C, [0xff12]
61 80 e0 14 ff                 # a16c |   mov D, [0xff14]
61 20 bc 0e                    # a171 |   mov A, [SP + 0xe]
60 ff 00                       # a175 |   mov H, 0
                               #      | _A_if_4:
fc 28 20 f8 09 00              # a178 |   jge A + B, A, ${_E_if_4}:rel + PC
c4 ff 00                       # a17e |   inc H, 0
                               #      | _E_if_4:
                               #      | _C_if_4:
                               #      | _Z_if_4:
60 40 44                       # a181 |   mov B, B + A
81 20 bc ff 0c                 # a184 |   add A, [SP + 0xc], H
60 ff 00                       # a189 |   mov H, 0
                               #      | _A_scope_1:
                               #      | _B_scope_1:
f0 2c 20 f8 10 00              # a18c |   jlt A + C, A, ${_C_scope_1}:rel + PC
f0 20 ff f8 0a 00              # a192 |   jlt A, H, ${_C_scope_1}:rel + PC
58 f8 07 00                    # a198 |   jmp ${_Z_scope_1}:rel + PC
                               #      | _C_scope_1:
c4 ff 00                       # a19c |   inc H, 0
                               #      | _Z_scope_1:
60 60 64                       # a19f |   mov C, C + A
81 20 bc ff 0a                 # a1a2 |   add A, [SP + 0xa], H
60 80 84                       # a1a7 |   mov D, D + A
                               #      |   # delay loop
                               #      | _A_loop_2:
                               #      | _BA_loop_2:
61 ff e0 14 ff                 # a1aa |   mov H, [0xff14]
                               #      | _A_if_7:
f4 ff 80 f8 0a 00              # a1af |   jle H, D, ${_E_if_7}:rel + PC
58 f8 2b 00                    # a1b5 |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_7:
ec ff 80 f8 23 00              # a1b9 |   jne H, D, ${_E2_if_7}:rel + PC
61 ff e0 12 ff                 # a1bf |   mov H, [0xff12]
                               #      | _A_if_8:
f4 ff 60 f8 0a 00              # a1c4 |   jle H, C, ${_E_if_8}:rel + PC
58 f8 16 00                    # a1ca |   jmp ${_C_loop_2}:rel + PC
                               #      | _E_if_8:
ec ff 60 f8 0e 00              # a1ce |   jne H, C, ${_E2_if_8}:rel + PC
fa e0 40 f8 10 ff 0c 00        # a1d4 |   jgt [0xff10], B, ${_C_loop_2}:rel + PC
                               #      | _E2_if_8:
                               #      | _C_if_8:
                               #      | _Z_if_8:
                               #      | _E2_if_7:
                               #      | _C_if_7:
                               #      | _Z_if_7:
                               #      | _BZ_loop_2:
58 f8 ce ff                    # a1dc |   jmp ${_BA_loop_2}:rel + PC
                               #      | _C_loop_2:
                               #      | _Z_loop_2:
                               #      | _cleanup_fn__delay_impl:
e4 20                          # a1e0 |   pop A
e4 40                          # a1e2 |   pop B
e4 60                          # a1e4 |   pop C
e4 80                          # a1e6 |   pop D
dc                             # a1e8 |   ret
                               #      | _end_fn__delay_impl:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_data_1:
54 65 73 74 62 65 64 0a 00     # a1e9 |   .data str:"Testbed\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa1f2
                               #      | SECTION_BEGIN_static_data:
                               # a1f2 |   .align dummy_size:14 align:16
                               #      | var_VIDEO_ROW_BUFFER:
                               # a200 |   .bss size:1280 align:16
                               #      | SECTION_END_static_data:
                               #      | 
