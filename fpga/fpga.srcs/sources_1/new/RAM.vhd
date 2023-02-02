library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity RAM is
	port (
		clk  : in std_logic;
		en   : in std_logic;
		wr   : in std_logic;
		addr : in  TPhyAddr;
		din  : in  TData;
		dout : out TData := (others => '0')
	);
end RAM;

architecture Behavioral of RAM is

type TArrRam is array (RAMSize-1 downto 0) of TByte;

signal a_ram : TArrRam := (others => (others => '0'));

begin

	process(clk)
	begin
	
		if en = '1' and rising_edge(clk) then
			if wr = '1' then
				a_ram(to_integer(unsigned(addr))    ) <= din(7 downto 0);
				a_ram(to_integer(unsigned(addr)) + 1) <= din(15 downto 8);
				dout <= din;
			else
				dout <= a_ram(to_integer(unsigned(addr)) + 1) & a_ram(to_integer(unsigned(addr)));
			end if;
		end if;
	
	end process;

end Behavioral;
