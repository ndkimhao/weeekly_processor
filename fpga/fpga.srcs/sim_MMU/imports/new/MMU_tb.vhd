library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity MMU_tb is
end MMU_tb;

architecture Behavioral of MMU_tb is

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

	process -- clock
	begin
		clk <= '0'; wait for 500ns;
		clk <= '1'; wait for 500ns;
	end process;

	process -- test
	begin
		reset <= '1'; wait for 1us;
		reset <= '0'; wait for 1us;
		
		-- read
		virt_addr <= x"1000"; wait for 1us;
		virt_addr <= x"2000"; wait for 1us;

		-- config
		virt_addr    <= x"1000";
		cfg_index    <= "01"; -- idx=1
		cfg_virt_end <= x"2000";
		cfg_phy_addr <= x"A20000";
		cfg_write    <= '1';
		wait for 1us;
		cfg_write    <= '0';

		-- read
		virt_addr <= x"1000"; wait for 1us;
		virt_addr <= x"2000"; wait for 1us;
		virt_addr <= x"11AB"; wait for 1us;
		
		-- config
		virt_addr    <= x"1500";
		cfg_index    <= "10"; -- idx=2
		cfg_virt_end <= x"4000";
		cfg_phy_addr <= x"F21111";
		cfg_write    <= '1';
		wait for 1us;
		cfg_write    <= '0';
		
		-- read
		virt_addr <= x"14FF"; wait for 1us;
		virt_addr <= x"1500"; wait for 1us;
		virt_addr <= x"1533"; wait for 1us;
		
		-- reset
		reset <= '1'; wait for 1us;
		reset <= '0';
		virt_addr <= x"1234"; wait for 1us;
		virt_addr <= x"3000"; wait for 1us;
		
		wait for 1us;
		std.env.finish;
	end process;
end Behavioral;
