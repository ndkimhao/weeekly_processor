library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity CPU_tb is
end CPU_tb;

architecture Behavioral of CPU_tb is

signal clk : std_logic;
signal reset : std_logic;

begin

	cpu : entity work.CPU port map (
		clk => clk,
		reset => reset
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
		
		wait for 100us;

		wait for 1us;
		std.env.finish;
	end process;
end Behavioral;
