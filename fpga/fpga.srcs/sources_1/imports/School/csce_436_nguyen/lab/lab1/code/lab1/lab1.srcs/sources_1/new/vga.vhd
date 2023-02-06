library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga is
	port(	
		clk: in  std_logic;
		reset_n : in  std_logic;
		h_sync : out  std_logic;
		v_sync : out  std_logic;
		blank : out  std_logic;
		r: out std_logic_vector(7 downto 0);
		g: out std_logic_vector(7 downto 0);
		b: out std_logic_vector(7 downto 0)
	);
end vga;

architecture structure of vga is

signal h_blank, v_blank : std_logic;
signal sr, sg, sb : std_logic_vector(7 downto 0);
signal col, row: unsigned(9 downto 0);

begin

	process(clk)
	begin
		if reset_n = '0' then
				col <= (others => '0');
				row <= (others => '0');
		elsif rising_edge(clk) then

			if col < 799 then
				col <= col + 1;
			elsif row < 524 then
				col <= (others => '0');
				row <= row + 1;
			else
				col <= (others => '0');
				row <= (others => '0');
			end if;

		end if;
	end process;

	h_sync <= '0' when col >= 656 and col < 752 else '1';
	v_sync <= '0' when row >= 490 and row < 492 else '1';

	h_blank <= '1' when col >= 640 else '0';
	v_blank <= '1' when row >= 480 else '0';
	blank <= h_blank or v_blank;

	r <= x"FF" when row < col else x"00";
	g <= x"FF" when row > col else x"00";
	b <= x"00";

end structure;
