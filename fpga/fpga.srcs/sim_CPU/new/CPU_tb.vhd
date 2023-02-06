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


signal vbuf_clk : std_logic;
signal vbuf_en : std_logic;
signal vbuf_wr : std_logic;
signal vbuf_addr :  TAddr;
signal vbuf_din : TData;
signal vbuf_dout : TData;


begin

	cpu : entity work.CPU port map (
		clk => clk,
		reset => reset,

		vbuf_en => vbuf_en,
		vbuf_wr => vbuf_wr,
		vbuf_addr => vbuf_addr,
		vbuf_dout => vbuf_din,
		vbuf_din => vbuf_dout
	);

	display: entity work.video port map ( 
		vga_clk => clk,
		hdmi_clk1 => '0',
		hdmi_clk2 => '0',
		reset => reset,
		
		buf_clk => clk,
		buf_en   => vbuf_en,
		buf_wr   => vbuf_wr,
		buf_addr => vbuf_addr,
		buf_din  => vbuf_din,
		buf_dout => vbuf_dout
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
		
		wait for 10000us;

		wait;
	end process;
end Behavioral;
