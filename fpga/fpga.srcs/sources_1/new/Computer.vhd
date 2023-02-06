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
		reset    : in  std_logic;
		locked   : out std_logic;
		clk_in1  : in  std_logic
	);
end component;

signal cpu_clk, reset : std_logic;
signal vga_clk, hdmi_clk1, hdmi_clk2 : std_logic;

signal vbuf_en : std_logic;
signal vbuf_wr : std_logic;
signal vbuf_addr :  TAddr;
signal vbuf_din : TData;
signal vbuf_dout : TData;

begin

	reset <= not cpu_resetn;

	clock: clk_wiz_0 port map (
		clk_in1 => sysclk,
		reset => reset,
		clk_out1 => cpu_clk,
		clk_out2 => vga_clk,
		clk_out3 => hdmi_clk1,
		clk_out4 => hdmi_clk2
	);


	cpu: entity work.CPU port map (
		clk => cpu_clk,
		reset => reset,
		led => led,

		vbuf_en => vbuf_en,
		vbuf_wr => vbuf_wr,
		vbuf_addr => vbuf_addr,
		vbuf_dout => vbuf_din,
		vbuf_din => vbuf_dout
	);

	display: entity work.video port map ( 
		vga_clk => vga_clk,
		hdmi_clk1 => hdmi_clk1,
		hdmi_clk2 => hdmi_clk2,
		reset => reset,
		tmds => tmds,
		tmdsb => tmdsb,

		buf_clk  => cpu_clk,
		buf_en   => vbuf_en,
		buf_wr   => vbuf_wr,
		buf_addr => vbuf_addr,
		buf_din  => vbuf_din,
		buf_dout => vbuf_dout
	); 

end Behavioral;
