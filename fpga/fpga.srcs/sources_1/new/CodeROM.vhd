library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;


package CodeROM is



-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 65;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*   0 */                                  -- .offset 0xD000
	/*   0 */                                  --
	/*   0 */                                  -- boot:
	/*   0 */ x"60",x"20",x"1c",x"fe",         --     mov A, 0xFE
	/*   4 */ x"60",x"40",x"00",               --     mov B, 0
	/*   7 */ x"54",x"00",x"e0",x"1c",x"00",x"96",x"01", --     mmap 0, 0x9600, 1
	/*   e */                                  --
	/*   e */ x"60",x"20",x"00",               --     mov A, 0
	/*  11 */                                  -- loop_outer:
	/*  11 */ x"60",x"80",x"00",               --     mov D, 0
	/*  14 */ x"60",x"60",x"00",               --     mov C, 0
	/*  17 */                                  -- loop_row:
	/*  17 */ x"60",x"40",x"00",               --     mov B, 0
	/*  1a */                                  --
	/*  1a */                                  --     loop_col:
	/*  1a */ x"62",x"80",x"45",               --         mov [D], B+A
	/*  1d */ x"00",x"40",x"1c",x"01",         --         add B, 1
	/*  21 */ x"00",x"80",x"1c",x"02",         --         add D, 2
	/*  25 */ x"f0",x"e0",x"40",x"1c",x"1a",x"d0",x"28", --         jlt $loop_col, B, 40
	/*  2c */                                  --
	/*  2c */ x"00",x"60",x"1c",x"01",         --     add C, 1
	/*  30 */ x"f0",x"e0",x"60",x"e0",x"17",x"d0",x"e0",x"01", --     jlt $loop_row, C, 480
	/*  38 */                                  --
	/*  38 */ x"00",x"20",x"1c",x"01",         --     add A, 1
	/*  3c */ x"58",x"e0",x"11",x"d0",         --     jmp $loop_outer
	/*  40 */                                  --
	/*  40 */ x"d8"                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################







end package;