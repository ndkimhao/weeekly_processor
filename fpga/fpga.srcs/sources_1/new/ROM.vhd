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

constant ROMSize : integer := 6;
type TArrROM is array(0 to ROMSize) of TByte;
signal data_rom : TArrROM := (
	x"00", x"00", x"00", -- ADD 0, 0
	x"D8", -- HALT
	others => x"00"
);

begin

	process(clk)
	begin
	
		if rising_edge(clk) then
		
			if unsigned(addr) < ROMSize - 1 then
				dout <= data_rom(to_integer(unsigned(addr)) + 1) & data_rom(to_integer(unsigned(addr)));
				valid <= '1';
			else
				dout <= (others => '0');
				valid <= '0';
			end if;
		
		end if; -- rising_edge(clk)
	
	end process;

end Behavioral;
