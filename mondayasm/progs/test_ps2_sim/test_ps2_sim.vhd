
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 102;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | .config CODE_OFFSET 0xa000
                                                     --      | 
                                                     --      | SECTION_BEGIN_boot:
                                                     --      | _B_boot_1:
    x"e8",x"c0",x"e0",x"f8",x"00",x"a0",x"1d",x"00", -- a000 |   jeq PC, 0xa000, ${_E_boot_1}:rel + PC
    x"60",x"20",x"e0",x"ff",x"00",                   -- a008 |   mov A, 0xff
    x"60",x"40",x"00",                               -- a00d |   mov B, 0
    x"54",x"e0",x"e0",x"1c",x"00",x"a0",x"00",x"f0",x"02", -- a010 |   mmap 0xa000, 0xf000, 0x2
    x"58",x"e0",x"00",x"a0",                         -- a019 |   jmp 0xa000
                                                     --      | _E_boot_1:
    x"54",x"e0",x"e0",x"1c",x"00",x"a0",x"00",x"f0",x"03", -- a01d |   mmap 0xa000, 0xf000, 0x3
    x"d4",x"1c",x"02",                               -- a026 |   umap 0x2
    x"60",x"a0",x"e0",x"00",x"ff",                   -- a029 |   mov SP, 0xff00
    x"5c",x"f8",x"05",x"00",                         -- a02e |   call ${fn_start}:rel + PC
    x"d8",                                           -- a032 |   halt
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_start:
    x"60",x"20",x"e0",x"fd",x"00",                   -- a033 |   mov A, 0xfd
    x"60",x"40",x"00",                               -- a038 |   mov B, 0
    x"54",x"e0",x"1c",x"1c",x"00",x"ff",x"ff",x"02", -- a03b |   mmap 0xff00, 0xff, 0x2
                                                     --      | _B_fn_start_1:
    x"60",x"20",x"00",                               -- a043 |   mov A, 0
    x"61",x"fe",x"e0",x"06",x"ff",                   -- a046 |   mov G, [0xff06]
    x"ac",x"ff",x"fe",x"e0",x"00",x"80",             -- a04b |   and H, G, 0x8000
    x"e8",x"ff",x"00",x"f8",x"f2",x"ff",             -- a051 |   jeq H, 0, ${_B_fn_start_1}:rel + PC
    x"ac",x"20",x"fe",x"e0",x"ff",x"00",             -- a057 |   and A, G, 0xff
    x"60",x"40",x"20",                               -- a05d |   mov B, A
    x"58",x"f8",x"e3",x"ff",                         -- a060 |   jmp ${_B_fn_start_1}:rel + PC
                                                     --      | _E_fn_start_1:
    x"d8",                                           -- a064 |   halt
    x"dc",                                           -- a065 |   ret
                                                     --      | end_fn_start:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | SECTION_END_const_data:
                                                     --      | 
                                                     --      | .offset 0xf000
                                                     --      | SECTION_BEGIN_static_data:
                                                     --      | SECTION_END_static_data:
                                                     --      | 

    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
