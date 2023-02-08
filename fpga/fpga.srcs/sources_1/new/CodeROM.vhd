
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is
-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 120;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*      */                                                  -- .offset 0xD000
	/*      */                                                  --
	/*      */                                                  -- boot:
	/* d000 */ x"60",x"a0",x"e0",x"00",x"a0",                   --     mov SP, 0xA000
	/* d005 */ x"60",x"20",x"e0",x"fe",x"00",                   --     mov A, 0xFE
	/* d00a */ x"60",x"40",x"00",                               --     mov B, 0
	/* d00d */ x"54",x"00",x"e0",x"1c",x"00",x"96",x"01",       --     mmap 0, 0x9600, 1
	/*      */                                                  --
	/* d014 */ x"60",x"20",x"e0",x"a2",x"00",                   --     mov A, 0xA2
	/*      */                                                  -- loop_outer:
	/* d019 */ x"60",x"80",x"00",                               --     mov D, 0
	/* d01c */ x"60",x"60",x"00",                               --     mov C, 0
	/*      */                                                  -- loop_row:
	/* d01f */ x"60",x"40",x"00",                               --     mov B, 0
	/*      */                                                  --
	/*      */                                                  --     loop_col:
	/* d022 */ x"62",x"80",x"e0",x"00",x"ff",                   --         mov [D], 0xFF00
	/* d027 */ x"22",x"80",x"20",                               --         shr [D], A
	/* d02a */ x"00",x"40",x"1c",x"01",                         --         add B, 1
	/* d02e */ x"00",x"80",x"1c",x"02",                         --         add D, 2
	/* d032 */ x"f0",x"40",x"1c",x"e0",x"28",x"22",x"d0",       --         jlt B, 40, $loop_col
	/*      */                                                  --
	/* d039 */ x"00",x"60",x"1c",x"01",                         --     add C, 1
	/* d03d */ x"f0",x"60",x"e0",x"e0",x"e0",x"01",x"1f",x"d0", --     jlt C, 480, $loop_row
	/*      */                                                  --
	/* d045 */ x"00",x"20",x"1c",x"01",                         --     add A, 1
	/* d049 */ x"5c",x"e0",x"51",x"d0",                         --     call $delay_fn
	/* d04d */ x"58",x"e0",x"19",x"d0",                         --     jmp $loop_outer
	/*      */                                                  --
	/*      */                                                  --
	/*      */                                                  -- delay_fn:
	/* d051 */ x"e0",x"40",                                     --     push B
	/* d053 */ x"e0",x"60",                                     --     push C
	/*      */                                                  --
	/* d055 */ x"60",x"60",x"00",                               --     mov C, 0
	/*      */                                                  --     _L_delay_loop:
	/* d058 */ x"60",x"40",x"00",                               --         mov B, 0
	/*      */                                                  --         _L_delay_inner_loop:
	/* d05b */ x"00",x"40",x"1c",x"01",                         --             add B, 1
	/* d05f */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"5b",x"d0", --             jne B, 0xFFFF, $_L_delay_inner_loop
	/*      */                                                  --
	/* d067 */ x"00",x"60",x"1c",x"01",                         --         add C, 1
	/* d06b */ x"f0",x"60",x"1c",x"e0",x"20",x"58",x"d0",       --         jlt C, 32, $_L_delay_loop
	/*      */                                                  --
	/* d072 */ x"e4",x"60",                                     --     pop C
	/* d074 */ x"e4",x"40",                                     --     pop B
	/* d076 */ x"dc",                                           --     ret
	/*      */                                                  --
	/* d077 */ x"d8"                                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
