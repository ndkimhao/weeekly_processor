                               #    0 | fn_start:
62 20 40                       #    0 |   mov [A], B
                               #    3 | _L_fn_start_1:
58 e0 03 00                    #    3 |   jmp $_L_fn_start_1
                               #    7 | B_for_i_1:
e8 20 e0 5b 88 e0 1e 00        #    7 |   jeq A, 23432, $E_for_i_1
00 40 1c 01                    #    f |   add B, 1
f0 40 e0 00 fa e0 07 00        #   13 |   jlt B, 250, $B_for_i_1
04 60 44                       #   1b |   sub C, B + A
                               #   1e | E_for_i_1:
02 29 ec 30 39                 #   1e |   add [A*2 + B], 0x3039 + C
                               #   23 | end_fn_start:
