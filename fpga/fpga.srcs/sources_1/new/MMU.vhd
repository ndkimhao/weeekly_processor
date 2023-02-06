library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity MMU is
	port (
		clk : in std_logic;

		virt_addr   : in  TAddr;
		phy_addr    : out TPhyAddr;

		cfg_index   : in std_logic_vector(MMUIdxWidth-1 downto 0);
		cfg_virt_start : in TAddr;
		cfg_virt_end: in TAddr;
		cfg_phy_addr: in TPhyAddr;
		cfg_write   : in std_logic
	);
end MMU;

architecture Behavioral of MMU is

constant PageW : integer := 4;

type TArrPhyAddr is array(MMUSlots-1 downto 0) of unsigned(PhyAddrWidth-PageW-1 downto 0);
type TArrAddr is array(MMUSlots-1 downto 0) of unsigned(AddrWidth-PageW-1 downto 0);

shared variable a_phy    : TArrPhyAddr;
shared variable a_vstart : TArrAddr;
shared variable a_vend   : TArrAddr;

signal r_start : unsigned(AddrWidth-4-1 downto 0);
signal r_phy   : unsigned(PhyAddrWidth-4-1 downto 0);
begin

	process (clk)
	begin

		if rising_edge(clk) and cfg_write = '1' then
			for i in 0 to MMUSlots-1 loop
					if cfg_index = std_logic_vector(to_unsigned(i, MMUIdxWidth)) then
						a_phy(i)    := unsigned(cfg_phy_addr(PhyAddrWidth-1 downto PageW));
						a_vstart(i) := unsigned(cfg_virt_start(AddrWidth-1 downto PageW));
						a_vend(i)   := unsigned(cfg_virt_end(AddrWidth-1 downto PageW));
					end if; -- cfg_index
			end loop;
		end if;

	end process;

	process (virt_addr, clk)
	begin
		for i in 0 to MMUSlots-1 loop
			if a_vstart(i) <= unsigned(virt_addr(AddrWidth-1 downto PageW)) and 
							  unsigned(virt_addr(AddrWidth-1 downto PageW)) <= a_vend(i) then
				r_start <= a_vstart(i);
				r_phy   <= a_phy(i);
			end if;
		end loop;
	end process;

	phy_addr <= std_logic_vector(r_phy + unsigned(virt_addr(AddrWidth-1 downto PageW)) - r_start)
					& virt_addr(PageW-1 downto 0);

end Behavioral;
