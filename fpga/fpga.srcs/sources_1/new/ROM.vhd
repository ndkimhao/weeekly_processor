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

constant ROMSize : integer := 167;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
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
	/*  20 */ x"60",x"60",x"e0",x"90",x"80",   --     mov C, $text_abc
	/*  25 */ x"60",x"20",x"e0",x"d2",x"04",   --     mov A, 1234     # comment asd
	/*  2a */ x"60",x"40",x"3e",x"05",         --     mov B, 2*A + 5  # comment asd
	/*  2e */ x"60",x"40",x"3e",x"05",         --     mov B, A*2 + 5  # comment asd
	/*  32 */ x"61",x"40",x"3d",x"05",         --     mov B, [A + 5]
	/*  36 */ x"60",x"40",x"1c",x"7b",         --     mov B, 123
	/*  3a */ x"60",x"40",x"e0",x"39",x"30",   --     mov B, 12345
	/*  3f */ x"60",x"40",x"1c",x"ff",         --     mov B, 0xFF
	/*  43 */ x"60",x"40",x"e0",x"aa",x"ff",   --     mov B, 0xFFAA
	/*  48 */ x"80",x"80",x"3d",x"72",x"ea",   --     add D, A + 234, C*2 + D
	/*  4d */                                  --     # call $function_a
	/*  4d */                                  --
	/*  4d */ x"60",x"a0",x"1c",x"ff",         --     mov SP, 0x00FF
	/*  51 */                                  --
	/*  51 */ x"60",x"20",x"1c",x"f0",         --     mov A, 0x00F0
	/*  55 */ x"60",x"60",x"20",               --     mov C, A
	/*  58 */ x"e0",x"60",                     --     push C
	/*  5a */ x"e4",x"60",                     --     pop C
	/*  5c */ x"60",x"20",x"7d",x"01",         --     mov A, C+1
	/*  60 */ x"60",x"60",x"20",               --     mov C, A
	/*  63 */                                  -- loop_outmost:
	/*  63 */ x"e0",x"60",                     --     push C
	/*  65 */                                  --
	/*  65 */ x"60",x"80",x"00",               --     mov D, 0
	/*  68 */                                  --     loop_outer:
	/*  68 */ x"60",x"40",x"00",               --         mov B, 0
	/*  6b */                                  --         loop_1:
	/*  6b */ x"00",x"40",x"1c",x"01",         --             add B, 1
	/*  6f */ x"ec",x"e0",x"40",x"e0",x"6b",x"80",x"ff",x"ff", --             jne $loop_1, B, 0xFFFF
	/*  77 */ x"00",x"80",x"1c",x"01",         --         add D, 1
	/*  7b */ x"ec",x"e0",x"80",x"1c",x"68",x"80",x"05", --         jne $loop_outer, D, 5
	/*  82 */                                  --
	/*  82 */ x"e4",x"60",                     --     pop C
	/*  84 */ x"60",x"20",x"7d",x"01",         --     mov A, C+1
	/*  88 */ x"60",x"60",x"20",               --     mov C, A
	/*  8b */ x"58",x"e0",x"63",x"80",         --     jmp $loop_outmost
	/*  8f */ x"d8",                           --     halt
	/*  90 */                                  --
	/*  90 */                                  -- text_abc:
	/*  90 */ x"48",x"65",x"6c",x"6c",x"6f",x"20",x"57",x"6f",x"72",x"6c",x"64",x"21",x"0a",x"00", --     .string "Hello World!\n" # null-terminated
	/*  9e */                                  --
	/*  9e */                                  -- data:
	/*  9e */ x"d2",x"04",x"22",x"ff",         --     .dw 1234, 0xFF22
	/*  a2 */ x"01",x"03",x"05",x"61",         --     .db 1, 3, 0x5, 'a'
	/*  a6 */                                  --
	/*  a6 */ x"d8"                            -- __end_of_rom: halt
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
