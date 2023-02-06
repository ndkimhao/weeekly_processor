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

type TArrayInrage is array(MMUSlots-1 downto 0) of std_logic;
signal s_inrange : TArrayInrage;

begin

	process (clk)
	begin

		if rising_edge(clk) then
			if cfg_write = '1' then
				a_phy(to_integer(unsigned(cfg_index)))    := unsigned(cfg_phy_addr(PhyAddrWidth-1 downto PageW));
				a_vstart(to_integer(unsigned(cfg_index))) := unsigned(cfg_virt_start(AddrWidth-1 downto PageW));
				a_vend(to_integer(unsigned(cfg_index)))   := unsigned(cfg_virt_end(AddrWidth-1 downto PageW));
			end if; -- cfg_write = '1'
		end if;

	end process;

	-- concurrent

	gen_s_inrange : for i in 0 to MMUSlots-1 generate
		s_inrange(i) <= '1' when a_vstart(i) <= unsigned(virt_addr(AddrWidth-1 downto PageW)) and 
							  	 a_vend(i)   >= unsigned(virt_addr(AddrWidth-1 downto PageW))
						else '0';
	end generate gen_s_inrange;


	r_start <= 
		a_vstart(3) when s_inrange(3) = '1' else		
		a_vstart(2) when s_inrange(2) = '1' else		
		a_vstart(1) when s_inrange(1) = '1' else		
		a_vstart(0) when s_inrange(0) = '1' else
		(others => '0');

	r_phy <= 
		a_phy(3) when s_inrange(3) = '1' else		
		a_phy(2) when s_inrange(2) = '1' else		
		a_phy(1) when s_inrange(1) = '1' else		
		a_phy(0) when s_inrange(0) = '1' else
		(others => '0');

	phy_addr <= std_logic_vector(r_phy + unsigned(virt_addr(AddrWidth-1 downto PageW)) - r_start)
					& virt_addr(PageW-1 downto 0);

end Behavioral;
