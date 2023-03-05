library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity vga is
	port(	
		clk: in  std_logic;
		reset : in  std_logic;
		h_sync : out  std_logic;
		v_sync : out  std_logic;
		blank : out  std_logic;
		r: out std_logic_vector(7 downto 0);
		g: out std_logic_vector(7 downto 0);
		b: out std_logic_vector(7 downto 0);
		
		buf_clk : in  std_logic;
		buf_en : in std_logic;
		buf_wr : in std_logic;
		buf_addr_bank : in std_logic_vector(1 downto 0); -- all/red/green/blue
		buf_addr : in TAddr;
		buf_din : in TData;
		buf_dout : out TData
	);
end vga;

architecture structure of vga is


component blk_mem_gen_video_buffer
	port (
		clka : in std_logic;
		ena : in std_logic;
		wea : in std_logic_vector(0 downto 0);
		addra : in std_logic_vector(14 downto 0);
		dina : in std_logic_vector(15 downto 0);
		douta : out std_logic_vector(15 downto 0);
		clkb : in std_logic;
		enb : in std_logic;
		web : in std_logic_vector(0 downto 0);
		addrb : in std_logic_vector(14 downto 0);
		dinb : in std_logic_vector(15 downto 0);
		doutb : out std_logic_vector(15 downto 0)
	);
end component;


signal h_blank, v_blank : std_logic;
signal sr, sg, sb : std_logic_vector(7 downto 0);

subtype TIndex is  unsigned(19-1 downto 0);

signal row, col: unsigned(9 downto 0);
signal idx: TIndex;

signal next_row: unsigned(9 downto 0) := (others => '0');
signal next_col: unsigned(9 downto 0) := (others => '0');
signal next_idx: TIndex := (others => '0');

signal buf_row, buf_col: unsigned(9 downto 0);
signal buf_idx: TIndex;

signal maddr : std_logic_vector(14 downto 0);
signal mdin_r : TData;
signal mdin_g : TData;
signal mdin_b : TData;

signal pixel_data_r : std_logic;
signal pixel_data_g : std_logic;
signal pixel_data_b : std_logic;

signal buf_wr_r : std_logic;
signal buf_wr_g : std_logic;
signal buf_wr_b : std_logic;

signal buf_dout_r : TData;
signal buf_dout_g : TData;
signal buf_dout_b : TData;

signal last_buf_addr_bank : std_logic_vector(1 downto 0);

begin

	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				next_row <= (others => '0');
				next_col <= (others => '0');
				next_idx <= (others => '0');
			else
				if next_col < 640 and next_row < 480 then
					next_idx <= next_idx + 1;
				end if;
				if next_col < 799 then
					next_col <= next_col + 1;
				elsif next_row < 524 then
					next_col <= (others => '0');
					next_row <= next_row + 1;
				else
					next_col <= (others => '0');
					next_row <= (others => '0');
					next_idx <= (others => '0');
				end if;
	
				buf_row <= next_row;
				buf_col <= next_col;
				buf_idx <= next_idx;

				row <= buf_row;
				col <= buf_col;
				idx <= buf_idx;
			end if;
		end if; -- rising_edge(clk)
	end process;

	h_sync <= '0' when col >= 656 and col < 752 else '1';
	v_sync <= '0' when row >= 490 and row < 492 else '1';

	h_blank <= '1' when col >= 640 else '0';
	v_blank <= '1' when row >= 480 else '0';
	blank <= h_blank or v_blank;

	r <= x"FF" when pixel_data_r = '1' else x"00";
	g <= x"FF" when pixel_data_g = '1' else x"00";
	b <= x"FF" when pixel_data_b = '1' else x"00";

	-- memory
	
	process(buf_clk)
	begin
		if rising_edge(buf_clk) then
			last_buf_addr_bank <= buf_addr_bank;
		end if; -- rising_edge(buf_clk)
	end process;
	
	buf_dout <=
		(buf_dout_r and buf_dout_g and buf_dout_b) when last_buf_addr_bank = "00" else
		buf_dout_r when last_buf_addr_bank = "01" else
		buf_dout_g when last_buf_addr_bank = "10" else
		buf_dout_b when last_buf_addr_bank = "11" else
		(others => '0');
	
	buf_wr_r <= '1' when buf_addr_bank = "00" or buf_addr_bank = "01" else '0';
	buf_wr_g <= '1' when buf_addr_bank = "00" or buf_addr_bank = "10" else '0';
	buf_wr_b <= '1' when buf_addr_bank = "00" or buf_addr_bank = "11" else '0';

	maddr <= std_logic_vector(next_idx(19-1 downto 4));

	pixel_data_r <= mdin_r(to_integer(idx(3 downto 0)));
	pixel_data_g <= mdin_g(to_integer(idx(3 downto 0)));
	pixel_data_b <= mdin_b(to_integer(idx(3 downto 0)));

	video_buffer_r : blk_mem_gen_video_buffer port map (
		clka => clk,
		ena => '1',
		wea => "0",
		addra => maddr,
		dina => (others => '0'),
		douta => mdin_r,

		clkb => buf_clk,
		enb => buf_en,
		web => buf_wr_r & "",
		addrb => buf_addr(15 downto 1),
		dinb => buf_din,
		doutb => buf_dout_r
	);
	video_buffer_g : blk_mem_gen_video_buffer port map (
		clka => clk,
		ena => '1',
		wea => "0",
		addra => maddr,
		dina => (others => '0'),
		douta => mdin_g,

		clkb => buf_clk,
		enb => buf_en,
		web => buf_wr_g & "",
		addrb => buf_addr(15 downto 1),
		dinb => buf_din,
		doutb => buf_dout_g
	);
	video_buffer_b : blk_mem_gen_video_buffer port map (
		clka => clk,
		ena => '1',
		wea => "0",
		addra => maddr,
		dina => (others => '0'),
		douta => mdin_b,

		clkb => buf_clk,
		enb => buf_en,
		web => buf_wr_b & "",
		addrb => buf_addr(15 downto 1),
		dinb => buf_din,
		doutb => buf_dout_b
	);
end structure;
