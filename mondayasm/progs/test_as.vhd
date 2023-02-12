
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 9;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | SECTION_BEGIN_boot:
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_start:
    x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d000 |   add B, 0xd230, 0xa012
    x"dc",                                           -- d008 |   ret
                                                     --      | end_fn_start:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | SECTION_END_const_data:
                                                     --      | 
                                                     --      | .offset 0x0000
                                                     --      | SECTION_BEGIN_static_data:
                                                     --      | SECTION_END_static_data:
                                                     --      | 

    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
