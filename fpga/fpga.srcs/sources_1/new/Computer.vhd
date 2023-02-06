library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Computer is
    port (
		sysclk : in std_logic;
		cpu_resetn : in std_logic;
		
		led : out std_logic_vector(8-1 downto 0);
		tmds : out  std_logic_vector (3 downto 0);
		tmdsb : out  std_logic_vector (3 downto 0)
	);
end Computer;

architecture Behavioral of Computer is

component clk_wiz_0
	port (
		clk_out1 : out std_logic; -- cpu
		clk_out2 : out std_logic; -- vga 25mhz
		clk_out3 : out std_logic; -- hdmi 125mhz
		clk_out4 : out std_logic; -- hdmi 125mhz phased
		resetn   : in  std_logic;
		locked   : out std_logic;
		clk_in1  : in  std_logic
	);
end component;

signal cpu_clk, cpu_reset : std_logic;
signal vga_clk, hdmi_clk1, hdmi_clk2 : std_logic;

begin

	clock: clk_wiz_0 port map (
		clk_in1 => sysclk,
		resetn => cpu_resetn,
		clk_out1 => cpu_clk,
		clk_out2 => vga_clk,
		clk_out3 => hdmi_clk1,
		clk_out4 => hdmi_clk2
	);

	cpu_reset <= not cpu_resetn;

	cpu: entity work.CPU port map (
		clk => cpu_clk,
		reset => cpu_reset,
		led => led
	);

	display: entity work.video port map ( 
		vga_clk => vga_clk,
		hdmi_clk1 => hdmi_clk1,
		hdmi_clk2 => hdmi_clk2,
		reset_n => cpu_resetn,
		tmds => tmds,
		tmdsb => tmdsb
	); 

end Behavioral;
