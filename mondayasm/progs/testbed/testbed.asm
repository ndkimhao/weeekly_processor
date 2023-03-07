                               #      | .config CODE_OFFSET 0xa000
                               #      | 
                               #      | SECTION_BEGIN_boot:
60 a0 e0 f0 9f                 # a000 |   mov SP, 0x9ff0
                               #      | _A_call_4:
5c f8 05 00                    # a005 |   call ${fn_main}:rel + PC
                               #      | _Z_call_4:
d8                             # a009 |   halt
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_main:
                               #      | _begin_fn_main:
e0 40                          # a00a |   push B
e0 20                          # a00c |   push A
60 20 1c 7b                    # a00e |   mov A, 0x7b
60 40 e0 c8 01                 # a012 |   mov B, 0x1c8
                               #      | _A_call_2:
e0 40                          # a017 |   push B
e0 20                          # a019 |   push A
e0 e0 82 a0                    # a01b |   push ${const_data_1}
5c f8 1d 00                    # a01f |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a023 |   mov SP, SP + 0x6
                               #      | _Z_call_2:
                               #      | _A_call_3:
e0 40                          # a027 |   push B
e0 20                          # a029 |   push A
e0 e0 9a a0                    # a02b |   push ${const_data_2}
5c f8 0d 00                    # a02f |   call ${fn_printf}:rel + PC
60 a0 bc 06                    # a033 |   mov SP, SP + 0x6
                               #      | _Z_call_3:
                               #      | _cleanup_fn_main:
e4 20                          # a037 |   pop A
e4 40                          # a039 |   pop B
dc                             # a03b |   ret
                               #      | _end_fn_main:
                               #      | 
                               #      | fn_printf:
                               #      | _begin_fn_printf:
e0 80                          # a03c |   push D
e0 60                          # a03e |   push C
e0 40                          # a040 |   push B
e0 20                          # a042 |   push A
                               #      |   # For each letter in fmt
                               #      | _A_for_1:
61 20 bc 0a                    # a044 |   mov A, [SP + 0xa]
                               #      | _BA_for_1:
65 ff 20                       # a048 |   bmov H, [A]
e8 ff 00 f8 16 00              # a04b |   jeq H, 0, ${_C_for_1}:rel + PC
                               #      | _A_call_1:
e0 ff                          # a051 |   push H
5c f8 17 00                    # a053 |   call ${fn_send_char}:rel + PC
60 a0 bc 02                    # a057 |   mov SP, SP + 0x2
                               #      | _Z_call_1:
                               #      | _BZ_for_1:
44 20                          # a05b |   inc A
58 f8 eb ff                    # a05d |   jmp ${_BA_for_1}:rel + PC
                               #      | _C_for_1:
                               #      | _Z_for_1:
                               #      | _cleanup_fn_printf:
e4 20                          # a061 |   pop A
e4 40                          # a063 |   pop B
e4 60                          # a065 |   pop C
e4 80                          # a067 |   pop D
dc                             # a069 |   ret
                               #      | _end_fn_printf:
                               #      | 
                               #      | fn_send_char:
                               #      | _begin_fn_send_char:
                               #      |   # wait if uart send buffer is full
                               #      | _A_loop_1:
                               #      | _BA_loop_1:
ad ff e0 1c 04 ff 20           # a06a |   and H, [0xff04], 0x20
e8 ff 00 f8 0a 00              # a071 |   jeq H, 0, ${_C_loop_1}:rel + PC
                               #      | _BZ_loop_1:
58 f8 f3 ff                    # a077 |   jmp ${_BA_loop_1}:rel + PC
                               #      | _C_loop_1:
                               #      | _Z_loop_1:
                               #      |   # send data now
63 e0 bc 00 ff 02              # a07b |   mov [0xff00], [SP + 0x2]
                               #      | _cleanup_fn_send_char:
dc                             # a081 |   ret
                               #      | _end_fn_send_char:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | const_data_1:
48 65 6c 6c 6f 20 57 6f 72 6c 64 3a 20 61 3d 25 64 20 62 3d 25 78 0a 00 # a082 |   .data str:"Hello World: a=%d b=%x\n"
                               #      | const_data_2:
66 72 6f 6d 20 73 6f 65 75 6e 61 73 6d 20 69 6d 70 6f 72 74 20 63 61 6c 6c 2c 20 68 61 6c 74 2c 20 69 6e 69 74 5f 63 6f 64 65 5f 67 65 6e 2c 20 52 65 67 0a 00 # a09a |   .data str:"from soeunasm import call, halt, init_code_gen, Reg\n"
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
