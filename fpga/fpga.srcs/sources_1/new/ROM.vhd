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

constant ROMSize : integer := 186;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*   0 */                                  -- .offset 0x8000
	/*   0 */                                  --
	/*   0 */                                  -- boot:
	/*   0 */ x"60",x"20",x"e0",x"33",x"12",   --     mov A, 0x1233
	/*   5 */ x"60",x"40",x"e0",x"21",x"f3",   --     mov B, 0xF321
	/*   a */ x"88",x"60",x"20",x"40",         --     mul C, A, B
	/*   e */ x"8c",x"60",x"20",x"40",         --     imul C, A, B
	/*  12 */ x"d8",                           --     halt
	/*  13 */ x"62",x"1c",x"e0",x"fa",x"23",x"01", --     mov [0xFA], 0x123
	/*  19 */ x"61",x"20",x"1c",x"fa",         --     mov A, [0xFA]
	/*  1d */ x"00",x"20",x"e0",x"21",x"03",   --     add A, 0x321
	/*  22 */ x"60",x"60",x"e0",x"33",x"03",   --     mov C, 0x333
	/*  27 */ x"84",x"80",x"20",x"60",         --     sub D, A, C
	/*  2b */ x"58",x"e0",x"33",x"80",         --     jmp $hello
	/*  2f */                                  --
	/*  2f */                                  -- function_a:
	/*  2f */ x"00",x"20",x"40",               --     add A, B
	/*  32 */ x"dc",                           --     ret
	/*  33 */                                  --
	/*  33 */                                  -- hello:
	/*  33 */ x"60",x"60",x"e0",x"a3",x"80",   --     mov C, $text_abc
	/*  38 */ x"60",x"20",x"e0",x"d2",x"04",   --     mov A, 1234     # comment asd
	/*  3d */ x"60",x"40",x"3e",x"05",         --     mov B, 2*A + 5  # comment asd
	/*  41 */ x"60",x"40",x"3e",x"05",         --     mov B, A*2 + 5  # comment asd
	/*  45 */ x"61",x"40",x"3d",x"05",         --     mov B, [A + 5]
	/*  49 */ x"60",x"40",x"1c",x"7b",         --     mov B, 123
	/*  4d */ x"60",x"40",x"e0",x"39",x"30",   --     mov B, 12345
	/*  52 */ x"60",x"40",x"1c",x"ff",         --     mov B, 0xFF
	/*  56 */ x"60",x"40",x"e0",x"aa",x"ff",   --     mov B, 0xFFAA
	/*  5b */ x"80",x"80",x"3d",x"72",x"ea",   --     add D, A + 234, C*2 + D
	/*  60 */                                  --     # call $function_a
	/*  60 */                                  --
	/*  60 */ x"60",x"a0",x"1c",x"ff",         --     mov SP, 0x00FF
	/*  64 */                                  --
	/*  64 */ x"60",x"20",x"1c",x"f0",         --     mov A, 0x00F0
	/*  68 */ x"60",x"60",x"20",               --     mov C, A
	/*  6b */ x"e0",x"60",                     --     push C
	/*  6d */ x"e4",x"60",                     --     pop C
	/*  6f */ x"60",x"20",x"7d",x"01",         --     mov A, C+1
	/*  73 */ x"60",x"60",x"20",               --     mov C, A
	/*  76 */                                  -- loop_outmost:
	/*  76 */ x"e0",x"60",                     --     push C
	/*  78 */                                  --
	/*  78 */ x"60",x"80",x"00",               --     mov D, 0
	/*  7b */                                  --     loop_outer:
	/*  7b */ x"60",x"40",x"00",               --         mov B, 0
	/*  7e */                                  --         loop_1:
	/*  7e */ x"00",x"40",x"1c",x"01",         --             add B, 1
	/*  82 */ x"ec",x"e0",x"40",x"e0",x"7e",x"80",x"ff",x"ff", --             jne $loop_1, B, 0xFFFF
	/*  8a */ x"00",x"80",x"1c",x"01",         --         add D, 1
	/*  8e */ x"ec",x"e0",x"80",x"1c",x"7b",x"80",x"05", --         jne $loop_outer, D, 5
	/*  95 */                                  --
	/*  95 */ x"e4",x"60",                     --     pop C
	/*  97 */ x"60",x"20",x"7d",x"01",         --     mov A, C+1
	/*  9b */ x"60",x"60",x"20",               --     mov C, A
	/*  9e */ x"58",x"e0",x"76",x"80",         --     jmp $loop_outmost
	/*  a2 */ x"d8",                           --     halt
	/*  a3 */                                  --
	/*  a3 */                                  -- text_abc:
	/*  a3 */ x"48",x"65",x"6c",x"6c",x"6f",x"20",x"57",x"6f",x"72",x"6c",x"64",x"21",x"0a",x"00", --     .string "Hello World!\n" # null-terminated
	/*  b1 */                                  --
	/*  b1 */                                  -- data:
	/*  b1 */ x"d2",x"04",x"22",x"ff",         --     .dw 1234, 0xFF22
	/*  b5 */ x"01",x"03",x"05",x"61",         --     .db 1, 3, 0x5, 'a'
	/*  b9 */                                  --
	/*  b9 */ x"d8"                            -- __end_of_rom: halt
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
