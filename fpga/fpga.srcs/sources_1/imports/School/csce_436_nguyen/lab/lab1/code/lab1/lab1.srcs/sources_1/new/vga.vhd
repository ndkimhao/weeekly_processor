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
		buf_addr_bank : in std_logic_vector(4-1 downto 0); -- wr_all/red/green/blue
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

signal imm_row, imm_col: unsigned(9 downto 0);
signal imm_idx: TIndex;

signal maddr : std_logic_vector(14 downto 0);
signal mdata_r, mdata_g, mdata_b : TData;

signal pixel_data_r : std_logic;
signal pixel_data_g : std_logic;
signal pixel_data_b : std_logic;

signal buf_dout_r : TData;
signal buf_dout_g : TData;
signal buf_dout_b : TData;

signal buf_din_r : TData;
signal buf_din_g : TData;
signal buf_din_b : TData;

signal buf_wr_r : std_logic;
signal buf_wr_g : std_logic;
signal buf_wr_b : std_logic;

signal masked_dout_r : TData;
signal masked_dout_g : TData;
signal masked_dout_b : TData;

signal last_buf_addr_bank : std_logic_vector(4-1 downto 0);

signal palette_idx : unsigned(3-1 downto 0);
type TPaletteArr is array(8-1 downto 0) of TByte;
signal color_palette_r, color_palette_g, color_palette_b : TPaletteArr;

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

				imm_row <= buf_row;
				imm_col <= buf_col;
				imm_idx <= buf_idx;

				row <= imm_row;
				col <= imm_col;
				idx <= imm_idx;

				r <= color_palette_r(to_integer(palette_idx));
				g <= color_palette_g(to_integer(palette_idx));
				b <= color_palette_b(to_integer(palette_idx));
			end if;
		end if; -- rising_edge(clk)
	end process;

	h_sync <= '0' when col >= 656 and col < 752 else '1';
	v_sync <= '0' when row >= 490 and row < 492 else '1';

	h_blank <= '1' when col >= 640 else '0';
	v_blank <= '1' when row >= 480 else '0';
	blank <= h_blank or v_blank;

	-- vga read

	maddr <= std_logic_vector(next_idx(19-1 downto 4));

	pixel_data_r <= mdata_r(to_integer(imm_idx(3 downto 0)));
	pixel_data_g <= mdata_g(to_integer(imm_idx(3 downto 0)));
	pixel_data_b <= mdata_b(to_integer(imm_idx(3 downto 0)));

	palette_idx <= pixel_data_r & pixel_data_g & pixel_data_b;

	-- host read/write
	
	process(buf_clk)
	begin
		if rising_edge(buf_clk) then
			last_buf_addr_bank <= buf_addr_bank;
			
			if buf_en = '1' and buf_wr = '1' and buf_addr_bank = "0000" then -- update color palette
				case buf_addr(5 downto 4) is
					when "10" =>
						color_palette_r(to_integer(unsigned(buf_addr(3 downto 1)))) <= buf_din(7 downto 0);
					when "01" =>
						color_palette_g(to_integer(unsigned(buf_addr(3 downto 1)))) <= buf_din(7 downto 0);
					when "00" =>
						color_palette_b(to_integer(unsigned(buf_addr(3 downto 1)))) <= buf_din(7 downto 0);
					when others =>
						null;
				end case;
			end if;
			
		end if; -- rising_edge(buf_clk)
	end process;
	
	masked_dout_r <= (others => '1') when last_buf_addr_bank(2) = '1' else (others => '0');
	masked_dout_g <= (others => '1') when last_buf_addr_bank(1) = '1' else (others => '0');
	masked_dout_b <= (others => '1') when last_buf_addr_bank(0) = '1' else (others => '0');

	buf_dout <= not (
					(masked_dout_r xor buf_dout_r) or
					(masked_dout_g xor buf_dout_g) or
					(masked_dout_b xor buf_dout_b)
				);

	buf_din_r <= buf_din when buf_addr_bank(2) = '1' else (others => '0');
	buf_din_g <= buf_din when buf_addr_bank(1) = '1' else (others => '0');
	buf_din_b <= buf_din when buf_addr_bank(0) = '1' else (others => '0');

	buf_wr_r <= buf_wr and (buf_addr_bank(2) or buf_addr_bank(3));
	buf_wr_g <= buf_wr and (buf_addr_bank(1) or buf_addr_bank(3));
	buf_wr_b <= buf_wr and (buf_addr_bank(0) or buf_addr_bank(3));

	video_buffer_r : blk_mem_gen_video_buffer port map (
		clka => clk,
		ena => '1',
		wea => "0",
		addra => maddr,
		dina => (others => '0'),
		douta => mdata_r,

		clkb => buf_clk,
		enb => buf_en,
		web => buf_wr_r & "",
		addrb => buf_addr(15 downto 1),
		dinb => buf_din_r,
		doutb => buf_dout_r
	);
	video_buffer_g : blk_mem_gen_video_buffer port map (
		clka => clk,
		ena => '1',
		wea => "0",
		addra => maddr,
		dina => (others => '0'),
		douta => mdata_g,

		clkb => buf_clk,
		enb => buf_en,
		web => buf_wr_g & "",
		addrb => buf_addr(15 downto 1),
		dinb => buf_din_g,
		doutb => buf_dout_g
	);
	video_buffer_b : blk_mem_gen_video_buffer port map (
		clka => clk,
		ena => '1',
		wea => "0",
		addra => maddr,
		dina => (others => '0'),
		douta => mdata_b,

		clkb => buf_clk,
		enb => buf_en,
		web => buf_wr_b & "",
		addrb => buf_addr(15 downto 1),
		dinb => buf_din_b,
		doutb => buf_dout_b
	);
end structure;
