library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity MemoryController is
	port (
		clk  : in std_logic;
		en   : in std_logic;
		wr   : in std_logic;
		addr : in  TPhyAddr;
		din  : in  TData;
		dout : out TData := (others => '0');

		vbuf_en : out std_logic;
		vbuf_wr : out std_logic;
		vbuf_addr : out TAddr;
		vbuf_dout : out TData;
		vbuf_din : in TData
	);
end MemoryController;

architecture Behavioral of MemoryController is

signal a : unsigned(PhyAddrWidth-1 downto 0);

signal en_ram, en_rom, en_vid : std_logic;
signal last_en_ram, last_en_rom, last_en_vid : std_logic;

signal ram_out, rom_out : TData;
signal rom_addr : TPhyAddr;

begin
	a <= unsigned(addr);

	en_ram <= en when a < RAMSize else '0';
	en_rom <= en when x"FF0000" <= a and a < x"FF8000" else '0';
	en_vid <= en when x"FE0000" <= a and a < x"FE9600" else '0';

	rom_addr <= x"00" & addr(15 downto 0);
	vbuf_addr <= addr(15 downto 0);

	vbuf_wr <= wr;
	vbuf_en <= en_rom;

	ram : entity work.RAM port map (
		clk => clk,
		en => en_ram,
		wr => wr,
		addr => addr,
		din => din,
		dout => ram_out
	);

	rom : entity work.ROM port map (
		clk => clk,
		addr => rom_addr,
		dout => rom_out
	);

	dout <= ram_out when last_en_ram = '1' else
			rom_out when last_en_rom = '1' else
			vbuf_din when last_en_vid = '1' else
			(others => '0');

	vbuf_dout <= din;

	process(clk)
	begin
		if rising_edge(clk) then
			last_en_ram <= en_ram;
			last_en_rom <= en_rom;
			last_en_vid <= en_vid;
		end if;
	end process;

end Behavioral;
