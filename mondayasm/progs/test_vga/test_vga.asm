                               #      | .config CODE_OFFSET 0x5000
                               #      | 
                               #      | SECTION_BEGIN_boot:
                               #      | SECTION_END_boot:
                               #      | 
                               #      | fn_start:
62 e0 e0 0a ff f0 f0           # 5000 |   mov [0xff0a], 0xf0f0
d8                             # 5007 |   halt
dc                             # 5008 |   ret
                               #      | end_fn_start:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
