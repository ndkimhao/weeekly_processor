-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 194;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*   0 */                                  -- .offset 0x8000
	/*   0 */                                  --
	/*   0 */                                  -- boot:
	/*   0 */ x"60",x"20",x"e0",x"33",x"12",   --     mov A, 0x1233
	/*   5 */ x"60",x"40",x"e0",x"21",x"f3",   --     mov B, 0xF321
	/*   a */ x"90",x"60",x"40",x"20",         --     div C, B, A
	/*   e */ x"94",x"60",x"40",x"20",         --     idiv C, B, A
	/*  12 */ x"88",x"60",x"20",x"40",         --     mul C, A, B
	/*  16 */ x"8c",x"60",x"20",x"40",         --     imul C, A, B
	/*  1a */ x"d8",                           --     halt
	/*  1b */ x"62",x"1c",x"e0",x"fa",x"23",x"01", --     mov [0xFA], 0x123
	/*  21 */ x"61",x"20",x"1c",x"fa",         --     mov A, [0xFA]
	/*  25 */ x"00",x"20",x"e0",x"21",x"03",   --     add A, 0x321
	/*  2a */ x"60",x"60",x"e0",x"33",x"03",   --     mov C, 0x333
	/*  2f */ x"84",x"80",x"20",x"60",         --     sub D, A, C
	/*  33 */ x"58",x"e0",x"3b",x"80",         --     jmp $hello
	/*  37 */                                  --
	/*  37 */                                  -- function_a:
	/*  37 */ x"00",x"20",x"40",               --     add A, B
	/*  3a */ x"dc",                           --     ret
	/*  3b */                                  --
	/*  3b */                                  -- hello:
	/*  3b */ x"60",x"60",x"e0",x"ab",x"80",   --     mov C, $text_abc
	/*  40 */ x"60",x"20",x"e0",x"d2",x"04",   --     mov A, 1234     # comment asd
	/*  45 */ x"60",x"40",x"3e",x"05",         --     mov B, 2*A + 5  # comment asd
	/*  49 */ x"60",x"40",x"3e",x"05",         --     mov B, A*2 + 5  # comment asd
	/*  4d */ x"61",x"40",x"3d",x"05",         --     mov B, [A + 5]
	/*  51 */ x"60",x"40",x"1c",x"7b",         --     mov B, 123
	/*  55 */ x"60",x"40",x"e0",x"39",x"30",   --     mov B, 12345
	/*  5a */ x"60",x"40",x"1c",x"ff",         --     mov B, 0xFF
	/*  5e */ x"60",x"40",x"e0",x"aa",x"ff",   --     mov B, 0xFFAA
	/*  63 */ x"80",x"80",x"3d",x"72",x"ea",   --     add D, A + 234, C*2 + D
	/*  68 */                                  --     # call $function_a
	/*  68 */                                  --
	/*  68 */ x"60",x"a0",x"1c",x"ff",         --     mov SP, 0x00FF
	/*  6c */                                  --
	/*  6c */ x"60",x"20",x"1c",x"f0",         --     mov A, 0x00F0
	/*  70 */ x"60",x"60",x"20",               --     mov C, A
	/*  73 */ x"e0",x"60",                     --     push C
	/*  75 */ x"e4",x"60",                     --     pop C
	/*  77 */ x"60",x"20",x"7d",x"01",         --     mov A, C+1
	/*  7b */ x"60",x"60",x"20",               --     mov C, A
	/*  7e */                                  -- loop_outmost:
	/*  7e */ x"e0",x"60",                     --     push C
	/*  80 */                                  --
	/*  80 */ x"60",x"80",x"00",               --     mov D, 0
	/*  83 */                                  --     loop_outer:
	/*  83 */ x"60",x"40",x"00",               --         mov B, 0
	/*  86 */                                  --         loop_1:
	/*  86 */ x"00",x"40",x"1c",x"01",         --             add B, 1
	/*  8a */ x"ec",x"e0",x"40",x"e0",x"86",x"80",x"ff",x"ff", --             jne $loop_1, B, 0xFFFF
	/*  92 */ x"00",x"80",x"1c",x"01",         --         add D, 1
	/*  96 */ x"ec",x"e0",x"80",x"1c",x"83",x"80",x"05", --         jne $loop_outer, D, 5
	/*  9d */                                  --
	/*  9d */ x"e4",x"60",                     --     pop C
	/*  9f */ x"60",x"20",x"7d",x"01",         --     mov A, C+1
	/*  a3 */ x"60",x"60",x"20",               --     mov C, A
	/*  a6 */ x"58",x"e0",x"7e",x"80",         --     jmp $loop_outmost
	/*  aa */ x"d8",                           --     halt
	/*  ab */                                  --
	/*  ab */                                  -- text_abc:
	/*  ab */ x"48",x"65",x"6c",x"6c",x"6f",x"20",x"57",x"6f",x"72",x"6c",x"64",x"21",x"0a",x"00", --     .string "Hello World!\n" # null-terminated
	/*  b9 */                                  --
	/*  b9 */                                  -- data:
	/*  b9 */ x"d2",x"04",x"22",x"ff",         --     .dw 1234, 0xFF22
	/*  bd */ x"01",x"03",x"05",x"61",         --     .db 1, 3, 0x5, 'a'
	/*  c1 */                                  --
	/*  c1 */ x"d8"                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################
