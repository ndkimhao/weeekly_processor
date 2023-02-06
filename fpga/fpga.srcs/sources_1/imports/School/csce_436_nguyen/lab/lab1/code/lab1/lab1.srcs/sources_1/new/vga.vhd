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

signal next_row, next_col: unsigned(9 downto 0);
signal next_idx: TIndex;

signal maddr : std_logic_vector(14 downto 0);
signal mdin : TData;

signal pixel_data : std_logic;

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
	
				row <= next_row;
				col <= next_col;
				idx <= next_idx;
			end if;
		end if; -- rising_edge(clk)
	end process;

	h_sync <= '0' when col >= 656 and col < 752 else '1';
	v_sync <= '0' when row >= 490 and row < 492 else '1';

	h_blank <= '1' when col >= 640 else '0';
	v_blank <= '1' when row >= 480 else '0';
	blank <= h_blank or v_blank;

	r <= x"FF" when pixel_data = '1' else x"00";
	g <= r;
	b <= r;

	-- memory
	maddr <= std_logic_vector(next_idx(19-1 downto 4));

	pixel_data <= mdin(to_integer(idx(3 downto 0)));

	video_buffer : blk_mem_gen_video_buffer port map (
		clka => clk,
		ena => '1',
		wea => "0",
		addra => maddr,
		dina => (others => '0'),
		douta => mdin,

		clkb => buf_clk,
		enb => buf_en,
		web => buf_wr & "",
		addrb => buf_addr(14 downto 0),
		dinb => buf_din,
		doutb => buf_dout
	);
end structure;
