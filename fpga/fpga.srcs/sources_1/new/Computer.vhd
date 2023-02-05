library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Computer is
    port (
		clk : in std_logic;
		reset_n : in std_logic
	);
end Computer;

architecture Behavioral of Computer is

component clk_wiz_0
	port (
		clk_out1 : out std_logic;
		resetn   : in  std_logic;
		locked   : out std_logic;
		clk_in1  : in  std_logic
	);
end component;

signal cpu_clk, cpu_reset : std_logic;

begin

	clock: clk_wiz_0 port map (
		clk_in1 => clk,
		resetn => reset_n,
		clk_out1 => cpu_clk);

	cpu_reset <= not reset_n;

	cpu: entity work.CPU port map (
		clk => cpu_clk,
		reset => cpu_reset
	);

end Behavioral;
