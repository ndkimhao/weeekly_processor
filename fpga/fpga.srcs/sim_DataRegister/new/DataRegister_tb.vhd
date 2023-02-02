library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity DataRegister_tb is
end DataRegister_tb;

architecture Behavioral of DataRegister_tb is

signal clk   : std_logic;
signal reset : std_logic;
signal write : std_logic := '0';
signal D : std_logic_vector (16-1 downto 0) := (others => '0');
signal Q : std_logic_vector (16-1 downto 0);

begin

	dr: entity work.DataRegister port map (
		clk => clk,
		reset => reset,
		write => write,
		D => D,
		Q => Q
	);

	process -- clock
	begin
		clk <= '0'; wait for 500ns;
		clk <= '1'; wait for 500ns;
	end process;

	process -- test
	begin
		-- reset
		reset <= '1'; wait for 1us;
		reset <= '0'; wait for 1us;
		
		D <= x"ABCD";
		wait for 1us;
		
		write <= '1';
		wait for 1us;
		write <= '0';
		
		D <= x"1000";
		wait for 2us;
		
		write <= '1';
		wait for 1us;
		write <= '0';

		reset <= '1'; wait for 1us;
		reset <= '0'; wait for 1us;

		wait for 1us;
		std.env.finish;
	end process;
end Behavioral;
