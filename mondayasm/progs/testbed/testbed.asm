                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_9:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_9:
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
e0 e0 fd a0                    # a012 |   push ${const_data_1}
5c f8 64 00                    # a016 |   call ${fn_puts}:rel + PC
60 a0 bc 02                    # a01a |   mov SP, SP + 0x2
                               #      | _Z_call_2:
                               #      | _A_call_3:
e0 1c 06                       # a01e |   push 0x6
e0 00                          # a021 |   push 0
5c f8 91 00                    # a023 |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a027 |   mov SP, SP + 0x4
                               #      | _Z_call_3:
                               #      | _A_call_4:
e0 e0 0f 0f                    # a02b |   push 0xf0f
e0 00                          # a02f |   push 0
5c f8 a5 00                    # a031 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a035 |   mov SP, SP + 0x4
                               #      | _Z_call_4:
                               #      | _A_call_5:
e0 1c ff                       # a039 |   push 0xff
e0 1c 01                       # a03c |   push 0x1
5c f8 97 00                    # a03f |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a043 |   mov SP, SP + 0x4
                               #      | _Z_call_5:
                               #      | _A_call_6:
e0 1c 05                       # a047 |   push 0x5
e0 1c 02                       # a04a |   push 0x2
5c f8 67 00                    # a04d |   call ${fn_switch_screen_row}:rel + PC
60 a0 bc 04                    # a051 |   mov SP, SP + 0x4
                               #      | _Z_call_6:
                               #      | _A_call_7:
e0 e0 0f 0f                    # a055 |   push 0xf0f
e0 00                          # a059 |   push 0
5c f8 7b 00                    # a05b |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a05f |   mov SP, SP + 0x4
                               #      | _Z_call_7:
                               #      | _A_call_8:
e0 1c ff                       # a063 |   push 0xff
e0 1c 01                       # a066 |   push 0x1
5c f8 6d 00                    # a069 |   call ${fn_fill_cell}:rel + PC
60 a0 bc 04                    # a06d |   mov SP, SP + 0x4
                               #      | _Z_call_8:
                               #      | _cleanup_fn_main:
e4 20                          # a071 |   pop A
e4 40                          # a073 |   pop B
e4 60                          # a075 |   pop C
e4 80                          # a077 |   pop D
dc                             # a079 |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_puts:
                               #      | _begin_fn_puts:
e0 20                          # a07a |   push A
                               #      | _A_for_1:
61 20 bc 04                    # a07c |   mov A, [SP + 0x4]
                               #      | _BA_for_1:
65 ff 20                       # a080 |   bmov H, [A]
e8 ff 00 f8 16 00              # a083 |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a089 |   push H
5c f8 11 00                    # a08b |   call ${fn_putc}:rel + PC
60 a0 bc 02                    # a08f |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a093 |   inc A
58 f8 eb ff                    # a095 |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_puts:
e4 20                          # a099 |   pop A
dc                             # a09b |   ret
                               #      | _end_fn_puts:
                               #      | 
                               #      | fn_putc:
                               #      | _begin_fn_putc:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a09c |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a0a3 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a0a9 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a0ad |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_putc:
dc                             # a0b3 |   ret
                               #      | _end_fn_putc:
                               #      | 
                               #      | fn_switch_screen_row:
                               #      | _begin_fn_switch_screen_row:
e0 40                          # a0b4 |   push B
e0 20                          # a0b6 |   push A
61 20 bc 08                    # a0b8 |   mov A, [SP + 0x8]
60 20 e4 f0 00                 # a0bc |   mov A, 0xf0 + A
89 40 bc e0 06 00 05           # a0c1 |   mul B, [SP + 0x6], 0x500
54 e0 e0 1c 10 a1 0f a6 01     # a0c8 |   mmap ${var_VIDEO_ROW_BUFFER}, ${var_VIDEO_ROW_BUFFER} + 04ff, 0x1
                               #      | _cleanup_fn_switch_screen_row:
e4 20                          # a0d1 |   pop A
e4 40                          # a0d3 |   pop B
dc                             # a0d5 |   ret
                               #      | _end_fn_switch_screen_row:
                               #      | 
                               #      | fn_fill_cell:
                               #      | _begin_fn_fill_cell:
e0 20                          # a0d6 |   push A
61 fe bc 06                    # a0d8 |   mov G, [SP + 0x6]
a9 20 bc 1c 04 01              # a0dc |   shl A, [SP + 0x4], 0x1
                               #      | _A_for_2:
60 20 e4 10 a1                 # a0e2 |   mov A, ${var_VIDEO_ROW_BUFFER} + A
                               #      | _BA_for_2:
fc 20 e0 f8 10 a6 13 00        # a0e7 |   jge A, ${var_VIDEO_ROW_BUFFER} + 0500, ${_C_for_2}:rel + PC
62 20 fe                       # a0ef |   mov [A], G
                               #      | _BZ_for_2:
60 20 3c 50                    # a0f2 |   mov A, A + 0x50
58 f8 f1 ff                    # a0f6 |   jmp ${_BA_for_2}:rel + PC
                               #      | _C_for_2:
                               #      | _Z_for_2:
                               #      | _cleanup_fn_fill_cell:
e4 20                          # a0fa |   pop A
dc                             # a0fc |   ret
                               #      | _end_fn_fill_cell:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_data_1:
54 65 73 74 62 65 64 0a 00     # a0fd |   .data str:"Testbed\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | .offset 0xa106
                               #      | SECTION_BEGIN_static_data:
                               # a106 |   .align dummy_size:10 align:16
                               #      | var_VIDEO_ROW_BUFFER:
                               # a110 |   .bss size:1280 align:16
                               #      | SECTION_END_static_data:
                               #      | 
