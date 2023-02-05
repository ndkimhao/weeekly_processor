library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Engine_tb is
end Engine_tb;

architecture Behavioral of Engine_tb is

signal clk : std_logic;
signal reset : std_logic;

signal ready : std_logic;
signal brk : std_logic;
signal uop   : TUop;
signal used_len : TInstBufferIdx;

begin

	decoder: entity work.Decoder port map (
		clk => clk,
		reset => reset,
		
		hold => '0',
		
		avail => (others => '0'),
		inst => (others => (others => '0')),
		
		ready => ready,
		brk => brk,
		uop => uop,
		used_len => used_len
	);

	engine : entity work.Engine port map (
		clk => clk,
		reset => reset,
		
		uop_ready => ready,
		uop => uop
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
		
		wait for 30us;
		
		wait for 1us;
		std.env.finish;
	end process;
end Behavioral;