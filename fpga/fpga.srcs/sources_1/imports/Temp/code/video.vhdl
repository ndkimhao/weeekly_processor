library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

library unisim;
use unisim.vcomponents.all;


entity video is
    port (
		vga_clk : in  std_logic;
		hdmi_clk1 : in  std_logic;
		hdmi_clk2 : in  std_logic;
		reset : in  std_logic;
		tmds : out  std_logic_vector (3 downto 0);
		tmdsb : out  std_logic_vector (3 downto 0);

		buf_clk : in  std_logic;
		buf_en : in std_logic;
		buf_wr : in std_logic;
		buf_addr_bank : in std_logic_vector(4-1 downto 0);
		buf_addr : in TAddr;
		buf_din : in TData;
		buf_dout : out TData
	);
end video;

architecture structure of video is

	signal red, green, blue: std_logic_vector(7 downto 0);
	signal blank, h_sync, v_sync: std_logic;
	signal clock_s, red_s, green_s, blue_s: std_logic;
	signal h_synch, v_synch: std_logic;


begin

	vga: entity work.vga PORT MAP (
		clk => vga_clk,
		reset => reset,
		h_sync => h_sync,
		v_sync => v_sync,
		blank => blank,
		r => red,
		g => green,
		b => blue,

		buf_clk  => buf_clk,
		buf_en   => buf_en,
		buf_wr   => buf_wr,
		buf_addr_bank => buf_addr_bank,
		buf_addr => buf_addr,
		buf_din  => buf_din,
		buf_dout => buf_dout
	);


    dvid: entity work.dvid  port map(
    	clk       => hdmi_clk1,
		clk_n     => hdmi_clk2, 
		clk_pixel => vga_clk,
		red_p     => red,
		green_p   => green,
		blue_p    => blue,
		blank     => blank,
		hsync     => h_sync,
		vsync     => v_sync,
		red_s     => red_s,
		green_s   => green_s,
		blue_s    => blue_s,
		clock_s   => clock_s
	);


	------------------------------------------------------------------------------
	-- This HDMI signals are high speed so buffer to insure signal integrity.
	------------------------------------------------------------------------------
	OBUFDS_blue  : OBUFDS port map
        ( O  => TMDS(0), OB => TMDSB(0), I  => blue_s  );
	OBUFDS_red   : OBUFDS port map
        ( O  => TMDS(1), OB => TMDSB(1), I  => green_s );
	OBUFDS_green : OBUFDS port map
        ( O  => TMDS(2), OB => TMDSB(2), I  => red_s   );
	OBUFDS_clock : OBUFDS port map
        ( O  => TMDS(3), OB => TMDSB(3), I  => clock_s );

end structure;
