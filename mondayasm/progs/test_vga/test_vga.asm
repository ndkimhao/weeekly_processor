                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_start:
62 e0 e0 0a ff f0 00           # 5000 |   mov [0xff0a], 0xf0
                               #      | _B_fn_start_1:
60 20 00                       # 5007 |   mov A, 0
                               #      | _B_fn_start_2:
e8 20 1c f8 ff 10 00           # 500a |   jeq A, 0xff, ${_E_fn_start_2}:rel + PC
44 20                          # 5011 |   inc A
08 40 40                       # 5013 |   mul B, B
58 f8 f4 ff                    # 5016 |   jmp ${_B_fn_start_2}:rel + PC
                               #      | _E_fn_start_2:
46 e0 0a ff                    # 501a |   inc [0xff0a]
58 f8 e9 ff                    # 501e |   jmp ${_B_fn_start_1}:rel + PC
                               #      | _E_fn_start_1:
d8                             # 5022 |   halt
dc                             # 5023 |   ret
                               #      | end_fn_start:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
