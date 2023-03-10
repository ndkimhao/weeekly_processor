library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;
--use work.CodeROM.all;

entity ROM is
	port (
		clk  : in std_logic;
		addr : in  TPhyAddr;
		dout : out TData := (others => '0')
--		valid : out std_logic
	);
end ROM;

architecture Behavioral of ROM is

component blk_mem_gen_1
	port (
		clka : in std_logic;
		addra : in std_logic_vector(13 downto 0);
		douta : out std_logic_vector(7 downto 0);
		clkb : in std_logic;
		addrb : in std_logic_vector(13 downto 0);
		doutb : out std_logic_vector(7 downto 0) 
	);
end component;


signal addr0 : std_logic_vector(13 downto 0);
signal addr1 : std_logic_vector(13 downto 0);
--signal addr_valid : std_logic;


begin

	addr0 <= addr(13 downto 0);
	addr1 <= std_logic_vector(unsigned(addr(13 downto 0)) + 1);

	code_rom : blk_mem_gen_1
		port map (
			clka => clk,
			addra => addr0,
			douta => dout(7 downto 0),
			clkb => clk,
			addrb => addr1,
			doutb => dout(15 downto 8)
		);
	
--	addr_valid <= '1' when addr1 < ROMSize else '0';

--	process(clk)
--	begin
	
--		if rising_edge(clk) then

--			if addr_valid = '1' then
--				dout <= arr_rom(to_integer(addr1)) & arr_rom(to_integer(addr0));
--				valid <= '1';
--			else
--				dout <= (others => '0');
--				valid <= '0';
--			end if;
		
--		end if; -- rising_edge(clk)
	
--	end process;

end Behavioral;
