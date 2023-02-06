library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;
use work.CodeROM.all;

entity ROM is
	port (
		clk  : in std_logic;
		addr : in  TPhyAddr;
		dout : out TData := (others => '0');
		valid : out std_logic
	);
end ROM;

architecture Behavioral of ROM is

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
