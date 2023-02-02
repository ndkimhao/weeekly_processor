library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity MMU is
	port (
		clk : in std_logic;
		reset : in std_logic := '0';

		virt_addr   : in  TAddr;
		phy_addr    : out TPhyAddr;

		cfg_index   : in std_logic_vector(MMUIdxWidth-1 downto 0);
		cfg_virt_end: in TAddr;
		cfg_phy_addr: in TPhyAddr;
		cfg_write   : in std_logic
	);
end MMU;

architecture Behavioral of MMU is

type TArrPhyAddr is array(MMUSlots-1 downto 0) of TPhyAddr;
type TArrAddr is array(MMUSlots-1 downto 0) of TAddr;

signal a_phy    : TArrPhyAddr;
signal a_vstart : TArrAddr;
signal a_vend   : TArrAddr;

begin

	process (clk, reset)
	variable r_start : TAddr;
	variable r_phy   : TPhyAddr;
	begin
	
		if reset = '1' then
			a_phy <= (others => (others => '0'));
			a_vstart <= (others => (others => '0'));
			a_vend <= (0 => (others => '1'), others => (others => '0'));
		elsif rising_edge(clk) then
			phy_addr <= (others => '0');
			for i in 0 to MMUSlots-1 loop
				if cfg_write = '1' then
					if cfg_index = std_logic_vector(to_unsigned(i, MMUIdxWidth)) then
						a_phy(i)    <= cfg_phy_addr;
						a_vstart(i) <= virt_addr;
						a_vend(i)   <= cfg_virt_end;
					end if; -- cfg_index
				else -- cfg_write = '0'
					if a_vstart(i) <= virt_addr and virt_addr <= a_vend(i) then
						r_start := a_vstart(i);
						r_phy   := a_phy(i);
					end if;
				end if; -- cfg_write
			end loop;
			phy_addr <= std_logic_vector(unsigned(r_phy) + unsigned(virt_addr) - unsigned(r_start));
		end if;
	
	end process;

end Behavioral;
