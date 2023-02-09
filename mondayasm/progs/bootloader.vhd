
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 53;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | SECTION_BEGIN_boot:
    x"60",x"a0",x"e0",x"00",x"20",                   -- d000 |   mov SP, 0x2000
    x"5c",x"e0",x"0a",x"d0",                         -- d005 |   call $fn_start
    x"d8",                                           -- d009 |   halt
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_start:
    x"e0",x"20",                                     -- d00a |   push A
    x"e0",x"40",                                     -- d00c |   push B
    x"e0",x"60",                                     -- d00e |   push C
    x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d010 |   add B, 0xd230, 0xa012
                                                     --      | _B_fn_start_1:
    x"e8",x"20",x"1c",x"e0",x"7b",x"20",x"d0",       -- d018 |   jeq A, 0x7b, $_E_fn_start_1
    x"dc",                                           -- d01f |   ret
                                                     --      | _E_fn_start_1:
    x"60",x"40",x"e0",x"35",x"d0",                   -- d020 |   mov B, $const_data_2
    x"63",x"e0",x"40",x"00",x"a0",                   -- d025 |   mov [$var_data_1], [B]
    x"5c",x"e0",x"0a",x"d0",                         -- d02a |   call $fn_start
    x"e4",x"60",                                     -- d02e |   pop C
    x"e4",x"40",                                     -- d030 |   pop B
    x"e4",x"20",                                     -- d032 |   pop A
    x"dc",                                           -- d034 |   ret
                                                     --      | end_fn_start:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | const_data_2:
    x"52",x"45",x"41",x"44",x"59",x"00",             -- d035 |   .data str:"READY"
                                                     --      | SECTION_END_const_data:
                                                     --      | 
                                                     --      | .offset 0xa000
                                                     --      | SECTION_BEGIN_static_data:
                                                     --      | var_data_1:
                                                     -- a000 |   .bss size:123
                                                     --      | SECTION_END_static_data:
                                                     --      | 

    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
