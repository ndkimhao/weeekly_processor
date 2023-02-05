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

type TArrRam is array (RAMSize/2-1 downto 0) of TByte;

signal ram_a : TArrRam := (others => (others => '0'));
signal ram_b : TArrRam := (others => (others => '0'));

signal addr2 : unsigned(PhyAddrWidth-2 downto 0);

begin

	addr2 <= unsigned(addr(PhyAddrWidth-1 downto 1));

	process(clk)
	begin
	
		if rising_edge(clk) then
			if en = '1' then
				if addr(0) = '0' then
					if wr = '1' then
						ram_b(to_integer(addr2)) <= din(15 downto 8);
						ram_a(to_integer(addr2)) <= din(7 downto 0);
						dout <= din;
					else
						dout <= ram_b(to_integer(addr2)) & ram_a(to_integer(addr2));
					end if;
				else
					if wr = '1' then
						ram_a(to_integer(addr2)+1) <= din(15 downto 8);
						ram_b(to_integer(addr2)) <= din(7 downto 0);
						dout <= din;
					else
						dout <= ram_a(to_integer(addr2)+1) & ram_b(to_integer(addr2));
					end if;
				end if;
			else
				dout <= (others => '0');
			end if;
		end if;
	
	end process;

end Behavioral;
