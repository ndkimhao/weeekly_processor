library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity MemoryController is
	port (
		clk  : in std_logic;
		en   : in std_logic;
		wr   : in std_logic;
		addr : in  TPhyAddr;
		din  : in  TData;
		dout : out TData := (others => '0')
	);
end MemoryController;

architecture Behavioral of MemoryController is

signal a : unsigned(PhyAddrWidth-1 downto 0);
signal en_ram, en_rom : std_logic;
signal ram_out, rom_out : TData;

begin
	a <= unsigned(addr);
	en_ram <= en when a < RAMSize else '0';
	en_rom <= en when x"FE0000" <= a and a < x"FF0000" else '0';

	ram : entity work.RAM port map (
		clk => clk,
		en => en_ram,
		wr => wr,
		addr => addr,
		din => din,
		dout => ram_out
	);

	rom : entity work.ROM port map (
		clk => clk,
		addr => addr,
		dout => rom_out
	);

	dout <= ram_out when en_ram = '1' else
			rom_out when en_rom = '1' else
			(others => '0');

end Behavioral;
