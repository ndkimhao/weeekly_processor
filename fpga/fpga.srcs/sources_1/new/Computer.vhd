library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Computer is
--  Port ( );
end Computer;

architecture Behavioral of Computer is

signal clk         : std_logic;
signal reset       : std_logic;
signal virt_addr   : TAddr := (others => '0');
signal phy_addr    : TPhyAddr := (others => '0');
signal cfg_index   : std_logic_vector(MMUIdxWidth-1 downto 0) := (others => '0');
signal cfg_virt_end: TAddr := (others => '0');
signal cfg_phy_addr: TPhyAddr := (others => '0');
signal cfg_write   : std_logic := '0';

begin


	mmu: entity work.MMU port map (
		clk          => clk         ,
		reset        => reset       ,
		virt_addr    => virt_addr   ,
		phy_addr     => phy_addr    ,
		cfg_index    => cfg_index   ,
		cfg_virt_end => cfg_virt_end,
		cfg_phy_addr => cfg_phy_addr,
		cfg_write    => cfg_write   
	);

end Behavioral;
