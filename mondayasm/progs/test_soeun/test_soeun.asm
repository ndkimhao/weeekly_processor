                               #      | .config CODE_OFFSET 0xd000
                               #      | 
                               #      | SECTION_BEGIN_boot:
0b 40 60                       # d000 |   mul [B], [C]
b2 7c 40 20 64                 # d003 |   or [C + 0x64], B, A
44 20                          # d008 |   inc A
c4 40 20                       # d00a |   inc B, A
46 7c 64                       # d00d |   inc [C + 0x64]
c5 60 7c 64                    # d010 |   inc C, [C + 0x64]
48 20                          # d014 |   dec A
c8 40 20                       # d016 |   dec B, A
4a 7c 64                       # d019 |   dec [C + 0x64]
c9 60 7c 64                    # d01c |   dec C, [C + 0x64]
88 20 40 7c 01                 # d020 |   mul A, B, C + 0x1
                               #      | SECTION_END_boot:
                               #      | 
                               #      | SECTION_BEGIN_const_data:
                               #      | SECTION_END_const_data:
                               #      | 
                               #      | SECTION_BEGIN_static_data:
                               #      | SECTION_END_static_data:
                               #      | 
