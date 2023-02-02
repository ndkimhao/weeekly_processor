library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity RAM_tb is
end RAM_tb;

architecture Behavioral of RAM_tb is

signal clk  : std_logic;
signal en   : std_logic := '0';
signal wr   : std_logic := '0';
signal addr : TPhyAddr := (others => '0');
signal din  : TData := (others => '0');
signal dout : TData := (others => '0');

begin

	ram : entity work.RAM port map (
		clk  => clk, 
		en   => en, 
		wr   => wr,
		addr => addr,
		din  => din,
		dout => dout
	);

	process -- clock
	begin
		clk <= '0'; wait for 500ns;
		clk <= '1'; wait for 500ns;
	end process;

	process -- test
	begin
		wait for 1us;
		en <= '1';

		-- Write ABCD to addr FF25
		wait for 1us;
		wr <= '1';
		addr <= x"00FF25";
		din <= x"ABCD";
		wait for 1us;
		wr <= '0';
		din <= x"0000";
		wait for 1us;
		
		-- Read test
		addr <= x"00FF24";
		wait for 1us;
		addr <= x"00FF25";
		wait for 1us;
		addr <= x"00FF26";
		wait for 1us;

		-- Write 1234 to addr FF26
		wr <= '1';
		addr <= x"00FF26";
		din <= x"1234";
		wait for 1us;
		wr <= '0';
		din <= x"0000";
		wait for 1us;

		-- Read test
		addr <= x"00FF24";
		wait for 1us;
		addr <= x"00FF25";
		wait for 1us;
		addr <= x"00FF26";
		wait for 1us;

		wait for 1us;
		std.env.finish;
	end process;
end Behavioral;
