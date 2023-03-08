library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity video_tb is
end video_tb;

architecture Behavioral of video_tb is

signal clk : std_logic;
signal reset : std_logic;


signal vbuf_clk : std_logic;
signal vbuf_en : std_logic := '0';
signal vbuf_wr : std_logic;
signal vbuf_addr_bank :  std_logic_vector(2 downto 0);
signal vbuf_addr :  TAddr;
signal vbuf_din : TData;
signal vbuf_dout : TData;

begin

	display: entity work.video port map ( 
		vga_clk => clk,
		hdmi_clk1 => '0',
		hdmi_clk2 => '0',
		reset => reset,
		
		buf_clk => clk,
		buf_en   => vbuf_en,
		buf_wr   => vbuf_wr,
		buf_addr_bank => vbuf_addr_bank,
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
		
		vbuf_en <= '1';
		vbuf_wr <= '1';
		vbuf_addr_bank <= "111";
		vbuf_addr <= (others => '0');
		vbuf_din <= x"aaff";
		wait for 1us;
		vbuf_en <= '0';
		vbuf_wr <= '0';
		
		wait for 100us;
		std.env.finish;
	end process;
end Behavioral;
