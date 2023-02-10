
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 158;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | SECTION_BEGIN_boot:
    x"60",x"a0",x"e0",x"00",x"20",                   -- d000 |   mov SP, 0x2000
    x"5c",x"e0",x"0a",x"d0",                         -- d005 |   call $fn_start
    x"d8",                                           -- d009 |   halt
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_start:
    x"60",x"20",x"e0",x"fd",x"00",                   -- d00a |   mov A, 0xfd
    x"60",x"40",x"00",                               -- d00f |   mov B, 0
    x"54",x"e0",x"e0",x"1c",x"00",x"30",x"00",x"30",x"02", -- d012 |   mmap 0x3000, 0x3000, 0x2
    x"60",x"ff",x"00",                               -- d01b |   mov H, 0
                                                     --      | _B_fn_start_1:
    x"60",x"20",x"e0",x"91",x"d0",                   -- d01e |   mov A, $const_data_1
    x"5c",x"e0",x"31",x"d0",                         -- d023 |   call $fn_send_data
    x"44",x"ff",                                     -- d027 |   inc H
    x"f0",x"ff",x"1c",x"e0",x"04",x"1e",x"d0",       -- d029 |   jlt H, 0x4, $_B_fn_start_1
                                                     --      | _E_fn_start_1:
    x"dc",                                           -- d030 |   ret
                                                     --      | end_fn_start:
                                                     --      | 
                                                     --      | fn_send_data:
    x"e0",x"40",                                     -- d031 |   push B
    x"e0",x"60",                                     -- d033 |   push C
    x"60",x"60",x"1c",x"11",                         -- d035 |   mov C, 0x11
                                                     --      | _B_fn_send_data_1:
    x"61",x"40",x"20",                               -- d039 |   mov B, [A]
    x"2c",x"40",x"e0",x"ff",x"00",                   -- d03c |   and B, 0xff
    x"e8",x"40",x"00",x"e0",x"6f",x"d0",             -- d041 |   jeq B, 0, $_E_fn_send_data_1
    x"5c",x"e0",x"74",x"d0",                         -- d047 |   call $fn_check_recv
                                                     --      | _B_fn_send_data_2:
    x"f0",x"60",x"1c",x"e0",x"10",x"5f",x"d0",       -- d04b |   jlt C, 0x10, $_E_fn_send_data_2
    x"61",x"60",x"e0",x"04",x"30",                   -- d052 |   mov C, [0x3004]
    x"2c",x"60",x"1c",x"3f",                         -- d057 |   and C, 0x3f
    x"58",x"e0",x"4b",x"d0",                         -- d05b |   jmp $_B_fn_send_data_2
                                                     --      | _E_fn_send_data_2:
    x"62",x"e0",x"40",x"00",x"30",                   -- d05f |   mov [0x3000], B
    x"60",x"fc",x"40",                               -- d064 |   mov E, B
    x"44",x"20",                                     -- d067 |   inc A
    x"44",x"60",                                     -- d069 |   inc C
    x"58",x"e0",x"39",x"d0",                         -- d06b |   jmp $_B_fn_send_data_1
                                                     --      | _E_fn_send_data_1:
    x"e4",x"60",                                     -- d06f |   pop C
    x"e4",x"40",                                     -- d071 |   pop B
    x"dc",                                           -- d073 |   ret
                                                     --      | end_fn_send_data:
                                                     --      | 
                                                     --      | fn_check_recv:
    x"e0",x"60",                                     -- d074 |   push C
    x"e0",x"80",                                     -- d076 |   push D
    x"61",x"60",x"e0",x"02",x"30",                   -- d078 |   mov C, [0x3002]
    x"ac",x"80",x"60",x"e0",x"00",x"80",             -- d07d |   and D, C, 0x8000
                                                     --      | _B_fn_check_recv_1:
    x"e8",x"80",x"00",x"e0",x"8c",x"d0",             -- d083 |   jeq D, 0, $_E_fn_check_recv_1
    x"60",x"fd",x"60",                               -- d089 |   mov F, C
                                                     --      | _E_fn_check_recv_1:
    x"e4",x"80",                                     -- d08c |   pop D
    x"e4",x"60",                                     -- d08e |   pop C
    x"dc",                                           -- d090 |   ret
                                                     --      | end_fn_check_recv:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | const_data_1:
    x"48",x"65",x"6c",x"6c",x"6f",x"20",x"57",x"6f",x"72",x"6c",x"64",x"21",x"00", -- d091 |   .data str:"Hello\ World!"
                                                     --      | SECTION_END_const_data:
                                                     --      | 
                                                     --      | .offset 0x0000
                                                     --      | SECTION_BEGIN_static_data:
                                                     --      | var_recv_buf:
                                                     --    0 |   .bss size:18
                                                     --      | var_send_buf:
                                                     --   12 |   .bss size:18
                                                     --      | SECTION_END_static_data:
                                                     --      | 

    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
