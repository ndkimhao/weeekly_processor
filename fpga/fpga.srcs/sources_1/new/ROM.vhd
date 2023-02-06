library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity ROM is
	port (
		clk  : in std_logic;
		addr : in  TPhyAddr;
		dout : out TData := (others => '0');
		valid : out std_logic
	);
end ROM;

architecture Behavioral of ROM is



-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 66;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*   0 */                                  -- .offset 0x8000
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
	/*  1d */ x"00",x"40",x"1c",x"10",         --         add B, 16
	/*  21 */ x"00",x"80",x"1c",x"02",         --         add D, 2
	/*  25 */ x"f0",x"e0",x"40",x"e0",x"1a",x"80",x"80",x"02", --         jlt $loop_col, B, 640
	/*  2d */                                  --
	/*  2d */ x"00",x"60",x"1c",x"01",         --     add C, 1
	/*  31 */ x"f0",x"e0",x"60",x"e0",x"17",x"80",x"e0",x"01", --     jlt $loop_row, C, 480
	/*  39 */                                  --
	/*  39 */ x"00",x"20",x"1c",x"01",         --     add A, 1
	/*  3d */ x"58",x"e0",x"11",x"80",         --     jmp $loop_outer
	/*  41 */                                  --
	/*  41 */ x"d8"                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################




signal addr0 : unsigned(PhyAddrWidth-1 downto 0);
signal addr1 : unsigned(PhyAddrWidth-1 downto 0);
signal addr_valid : std_logic;


begin

	addr0 <= unsigned(addr);
	addr1 <= unsigned(addr) + 1;
	addr_valid <= '1' when addr1 < ROMSize else '0';

	process(clk)
	begin
	
		if rising_edge(clk) then

			if addr_valid = '1' then
				dout <= arr_rom(to_integer(addr1)) & arr_rom(to_integer(addr0));
				valid <= '1';
			else
				dout <= (others => '0');
				valid <= '0';
			end if;
		
		end if; -- rising_edge(clk)
	
	end process;

end Behavioral;
