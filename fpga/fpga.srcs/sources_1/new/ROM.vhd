library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity ROM is
	port (
		clk  : in std_logic;
		addr : in  TPhyAddr;
		dout : out TData := (others => '0');
		valid : out std_logic
	);
end ROM;

architecture Behavioral of ROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 105;
type TArrROM is array (0 to ROMSize-1) of TByte;
signal arr_rom : TArrROM := (
	/*   0 */                                  -- .offset 0x8000
	/*   0 */                                  --
	/*   0 */                                  -- boot:
	/*   0 */ x"62",x"1c",x"e0",x"fa",x"23",x"01", --     mov [0xFA], 0x123
	/*   6 */ x"61",x"20",x"1c",x"fa",         --     mov A, [0xFA]
	/*   a */ x"00",x"20",x"e0",x"21",x"03",   --     add A, 0x321
	/*   f */ x"60",x"60",x"e0",x"33",x"03",   --     mov C, 0x333
	/*  14 */ x"84",x"80",x"20",x"60",         --     sub D, A, C
	/*  18 */ x"58",x"e0",x"20",x"80",         --     jmp $hello
	/*  1c */                                  --
	/*  1c */                                  -- function_a:
	/*  1c */ x"00",x"20",x"40",               --     add A, B
	/*  1f */ x"dc",                           --     ret
	/*  20 */                                  --
	/*  20 */                                  -- hello:
	/*  20 */ x"60",x"60",x"e0",x"52",x"80",   --     mov C, $text_abc
	/*  25 */ x"60",x"20",x"e0",x"d2",x"04",   --     mov A, 1234     # comment asd
	/*  2a */ x"60",x"40",x"3e",x"05",         --     mov B, 2*A + 5  # comment asd
	/*  2e */ x"60",x"40",x"3e",x"05",         --     mov B, A*2 + 5  # comment asd
	/*  32 */ x"61",x"40",x"3c",x"05",         --     mov B, [A + 5]
	/*  36 */ x"60",x"40",x"1c",x"7b",         --     mov B, 123
	/*  3a */ x"60",x"40",x"e0",x"39",x"30",   --     mov B, 12345
	/*  3f */ x"60",x"40",x"1c",x"ff",         --     mov B, 0xFF
	/*  43 */ x"60",x"40",x"e0",x"aa",x"ff",   --     mov B, 0xFFAA
	/*  48 */ x"80",x"80",x"3c",x"72",x"ea",   --     add D, A + 234, C*2 + D
	/*  4d */ x"5c",x"e0",x"1c",x"80",         --     call $function_a
	/*  51 */ x"d8",                           --     halt
	/*  52 */                                  --
	/*  52 */                                  -- text_abc:
	/*  52 */ x"48",x"65",x"6c",x"6c",x"6f",x"20",x"57",x"6f",x"72",x"6c",x"64",x"21",x"0a",x"00", --     .string "Hello World!\n" # null-terminated
	/*  60 */                                  --
	/*  60 */                                  -- data:
	/*  60 */ x"d2",x"04",x"22",x"ff",         --     .dw 1234, 0xFF22
	/*  64 */ x"01",x"03",x"05",x"61",         --     .db 1, 3, 0x5, 'a'
	/*  68 */                                  --
	/*  68 */ x"d8"                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################


signal addr0 : unsigned(PhyAddrWidth-1 downto 0);
signal addr1 : unsigned(PhyAddrWidth-1 downto 0);
signal addr_valid : std_logic;


begin

	addr0 <= unsigned(addr);
	addr1 <= unsigned(addr) + 1;
	addr_valid <= '1' when addr1 < ROMSize else '0';

	process(clk)
	begin
	
		if rising_edge(clk) then

			if addr_valid = '1' then
				dout <= arr_rom(to_integer(addr1)) & arr_rom(to_integer(addr0));
				valid <= '1';
			else
				dout <= (others => '0');
				valid <= '0';
			end if;
		
		end if; -- rising_edge(clk)
	
	end process;

end Behavioral;
