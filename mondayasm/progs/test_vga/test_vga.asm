                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_start:
62 e0 00 0a ff                 # 5000 |   mov [0xff0a], 0
                               #      | _B_fn_start_1:
60 20 00                       # 5005 |   mov A, 0
                               #      | _B_fn_start_2:
e8 20 1c f8 ff 10 00           # 5008 |   jeq A, 0xff, ${_E_fn_start_2}:rel + PC
44 20                          # 500f |   inc A
08 40 40                       # 5011 |   mul B, B
58 f8 f4 ff                    # 5014 |   jmp ${_B_fn_start_2}:rel + PC
                               #      | _E_fn_start_2:
46 e0 0a ff                    # 5018 |   inc [0xff0a]
58 f8 e9 ff                    # 501c |   jmp ${_B_fn_start_1}:rel + PC
                               #      | _E_fn_start_1:
d8                             # 5020 |   halt
dc                             # 5021 |   ret
                               #      | end_fn_start:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
