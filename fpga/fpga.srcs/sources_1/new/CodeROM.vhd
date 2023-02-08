
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is
-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 7204;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*      */                                                  --
	/*      */                                                  -- # BEGIN preamble.asm
	/*      */                                                  -- .offset 0xD000
	/*      */                                                  -- .boot:
	/* d000 */ x"60",x"20",x"e0",x"fa",x"ff",                   --     mov A, 0xFFFA
	/* d005 */ x"ec",x"20",x"e0",x"e0",x"fa",x"00",x"4f",x"d0", --     jne A, 0x00FA, $start_test
	/*      */                                                  -- fail:
	/*      */                                                  --     # register A contains failed test
	/* d00d */ x"d8",                                           --     halt
	/* d00e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- success:
	/* d012 */ x"ec",x"20",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne A, 0xDEAD, $fail  # check cookie
	/* d01a */ x"ec",x"40",x"e0",x"e0",x"ef",x"be",x"0d",x"d0", --     jne B, 0xBEEF, $fail
	/* d022 */ x"ec",x"60",x"e0",x"e0",x"83",x"49",x"0d",x"d0", --     jne C, 0x4983, $fail
	/* d02a */ x"ec",x"80",x"e0",x"e0",x"14",x"a6",x"0d",x"d0", --     jne D, 0xA614, $fail
	/*      */                                                  --     # okay!
	/* d032 */ x"00",x"20",x"e0",x"ab",x"ac",                   --     add A, 0xACAB
	/* d037 */ x"00",x"40",x"e0",x"cc",x"41",                   --     add B, 0x41CC
	/* d03c */ x"08",x"20",x"80",                               --     mul A, D
	/* d03f */ x"34",x"20",x"e0",x"4a",x"f2",                   --     xor A, 0xF24A
	/* d044 */ x"34",x"60",x"e0",x"4f",x"49",                   --     xor C, 0x494F
	/* d049 */ x"34",x"80",x"e0",x"30",x"5a",                   --     xor D, 0x5A30
	/*      */                                                  --     # A = 0x00aa
	/*      */                                                  --     # B = 0x00bb
	/*      */                                                  --     # C = 0x00cc
	/*      */                                                  --     # D = 0x0055
	/* d04e */ x"d8",                                           --     halt
	/*      */                                                  -- # END preamble.asm
	/*      */                                                  --
	/*      */                                                  -- start_test:
	/*      */                                                  -- alu_test:
	/*      */                                                  --      # t=True, a=d230, b=a012
	/* d04f */ x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     add B, 0xd230, 0xa012
	/* d057 */ x"ec",x"40",x"e0",x"e0",x"42",x"72",x"0d",x"d0", --     jne B, 0x7242, $fail
	/*      */                                                  --
	/* d05f */ x"84",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     sub B, 0xd230, 0xa012
	/* d067 */ x"ec",x"40",x"e0",x"e0",x"1e",x"32",x"0d",x"d0", --     jne B, 0x321e, $fail
	/*      */                                                  --
	/* d06f */ x"88",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     mul B, 0xd230, 0xa012
	/* d077 */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0d",x"d0", --     jne B, 0xc760, $fail
	/* d07f */ x"ec",x"80",x"e0",x"e0",x"6c",x"83",x"0d",x"d0", --     jne D, 0x836c, $fail
	/*      */                                                  --
	/* d087 */ x"8c",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     imul B, 0xd230, 0xa012
	/* d08f */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0d",x"d0", --     jne B, 0xc760, $fail
	/* d097 */ x"ec",x"80",x"e0",x"e0",x"2a",x"11",x"0d",x"d0", --     jne D, 0x112a, $fail
	/*      */                                                  --
	/* d09f */ x"a0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shr B, 0xd230, 0xa012
	/* d0a7 */ x"ec",x"40",x"e0",x"e0",x"8c",x"34",x"0d",x"d0", --     jne B, 0x348c, $fail
	/*      */                                                  --
	/* d0af */ x"a4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     ishr B, 0xd230, 0xa012
	/* d0b7 */ x"ec",x"40",x"e0",x"e0",x"8c",x"f4",x"0d",x"d0", --     jne B, 0xf48c, $fail
	/*      */                                                  --
	/* d0bf */ x"a8",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shl B, 0xd230, 0xa012
	/* d0c7 */ x"ec",x"40",x"e0",x"e0",x"c0",x"48",x"0d",x"d0", --     jne B, 0x48c0, $fail
	/*      */                                                  --
	/* d0cf */ x"ac",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     and B, 0xd230, 0xa012
	/* d0d7 */ x"ec",x"40",x"e0",x"e0",x"10",x"80",x"0d",x"d0", --     jne B, 0x8010, $fail
	/*      */                                                  --
	/* d0df */ x"b0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     or B, 0xd230, 0xa012
	/* d0e7 */ x"ec",x"40",x"e0",x"e0",x"32",x"f2",x"0d",x"d0", --     jne B, 0xf232, $fail
	/*      */                                                  --
	/* d0ef */ x"b4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     xor B, 0xd230, 0xa012
	/* d0f7 */ x"ec",x"40",x"e0",x"e0",x"22",x"72",x"0d",x"d0", --     jne B, 0x7222, $fail
	/*      */                                                  --
	/* d0ff */ x"b8",x"40",x"e0",x"30",x"d2",                   --     neg B, 0xd230
	/* d104 */ x"ec",x"40",x"e0",x"e0",x"d0",x"2d",x"0d",x"d0", --     jne B, 0x2dd0, $fail
	/*      */                                                  --
	/* d10c */ x"bc",x"40",x"e0",x"30",x"d2",                   --     not B, 0xd230
	/* d111 */ x"ec",x"40",x"e0",x"e0",x"cf",x"2d",x"0d",x"d0", --     jne B, 0x2dcf, $fail
	/*      */                                                  --
	/* d119 */ x"c0",x"40",x"e0",x"30",x"d2",                   --     bool B, 0xd230
	/* d11e */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d125 */ x"c4",x"40",x"e0",x"30",x"d2",                   --     inc B, 0xd230
	/* d12a */ x"ec",x"40",x"e0",x"e0",x"31",x"d2",x"0d",x"d0", --     jne B, 0xd231, $fail
	/*      */                                                  --
	/* d132 */ x"c8",x"40",x"e0",x"30",x"d2",                   --     dec B, 0xd230
	/* d137 */ x"ec",x"40",x"e0",x"e0",x"2f",x"d2",x"0d",x"d0", --     jne B, 0xd22f, $fail
	/*      */                                                  --
	/*      */                                                  --      # t=True, a=00ad, b=da37
	/* d13f */ x"80",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     add B, 0x00ad, 0xda37
	/* d147 */ x"ec",x"40",x"e0",x"e0",x"e4",x"da",x"0d",x"d0", --     jne B, 0xdae4, $fail
	/*      */                                                  --
	/* d14f */ x"84",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     sub B, 0x00ad, 0xda37
	/* d157 */ x"ec",x"40",x"e0",x"e0",x"76",x"26",x"0d",x"d0", --     jne B, 0x2676, $fail
	/*      */                                                  --
	/* d15f */ x"88",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     mul B, 0x00ad, 0xda37
	/* d167 */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0d",x"d0", --     jne B, 0x772b, $fail
	/* d16f */ x"ec",x"80",x"e0",x"e0",x"93",x"00",x"0d",x"d0", --     jne D, 0x0093, $fail
	/*      */                                                  --
	/* d177 */ x"8c",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     imul B, 0x00ad, 0xda37
	/* d17f */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0d",x"d0", --     jne B, 0x772b, $fail
	/* d187 */ x"ec",x"80",x"e0",x"e0",x"e6",x"ff",x"0d",x"d0", --     jne D, 0xffe6, $fail
	/*      */                                                  --
	/* d18f */ x"a0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     shr B, 0x00ad, 0xda37
	/* d197 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d19e */ x"a4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     ishr B, 0x00ad, 0xda37
	/* d1a6 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d1ad */ x"a8",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     shl B, 0x00ad, 0xda37
	/* d1b5 */ x"ec",x"40",x"e0",x"e0",x"80",x"56",x"0d",x"d0", --     jne B, 0x5680, $fail
	/*      */                                                  --
	/* d1bd */ x"ac",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     and B, 0x00ad, 0xda37
	/* d1c5 */ x"ec",x"40",x"1c",x"e0",x"25",x"0d",x"d0",       --     jne B, 0x0025, $fail
	/*      */                                                  --
	/* d1cc */ x"b0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     or B, 0x00ad, 0xda37
	/* d1d4 */ x"ec",x"40",x"e0",x"e0",x"bf",x"da",x"0d",x"d0", --     jne B, 0xdabf, $fail
	/*      */                                                  --
	/* d1dc */ x"b4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     xor B, 0x00ad, 0xda37
	/* d1e4 */ x"ec",x"40",x"e0",x"e0",x"9a",x"da",x"0d",x"d0", --     jne B, 0xda9a, $fail
	/*      */                                                  --
	/* d1ec */ x"b8",x"40",x"e0",x"ad",x"00",                   --     neg B, 0x00ad
	/* d1f1 */ x"ec",x"40",x"e0",x"e0",x"53",x"ff",x"0d",x"d0", --     jne B, 0xff53, $fail
	/*      */                                                  --
	/* d1f9 */ x"bc",x"40",x"e0",x"ad",x"00",                   --     not B, 0x00ad
	/* d1fe */ x"ec",x"40",x"e0",x"e0",x"52",x"ff",x"0d",x"d0", --     jne B, 0xff52, $fail
	/*      */                                                  --
	/* d206 */ x"c0",x"40",x"e0",x"ad",x"00",                   --     bool B, 0x00ad
	/* d20b */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d212 */ x"c4",x"40",x"e0",x"ad",x"00",                   --     inc B, 0x00ad
	/* d217 */ x"ec",x"40",x"e0",x"e0",x"ae",x"00",x"0d",x"d0", --     jne B, 0x00ae, $fail
	/*      */                                                  --
	/* d21f */ x"c8",x"40",x"e0",x"ad",x"00",                   --     dec B, 0x00ad
	/* d224 */ x"ec",x"40",x"e0",x"e0",x"ac",x"00",x"0d",x"d0", --     jne B, 0x00ac, $fail
	/*      */                                                  --
	/*      */                                                  --      # t=False, a=f0ad, b=2a3f
	/* d22c */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d231 */ x"00",x"40",x"e0",x"3f",x"2a",                   --     add B, 0x2a3f
	/* d236 */ x"ec",x"40",x"e0",x"e0",x"ec",x"1a",x"0d",x"d0", --     jne B, 0x1aec, $fail
	/*      */                                                  --
	/* d23e */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d243 */ x"04",x"40",x"e0",x"3f",x"2a",                   --     sub B, 0x2a3f
	/* d248 */ x"ec",x"40",x"e0",x"e0",x"6e",x"c6",x"0d",x"d0", --     jne B, 0xc66e, $fail
	/*      */                                                  --
	/* d250 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d255 */ x"08",x"40",x"e0",x"3f",x"2a",                   --     mul B, 0x2a3f
	/* d25a */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0d",x"d0", --     jne B, 0x9c93, $fail
	/* d262 */ x"ec",x"80",x"e0",x"e0",x"b7",x"27",x"0d",x"d0", --     jne D, 0x27b7, $fail
	/*      */                                                  --
	/* d26a */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d26f */ x"0c",x"40",x"e0",x"3f",x"2a",                   --     imul B, 0x2a3f
	/* d274 */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0d",x"d0", --     jne B, 0x9c93, $fail
	/* d27c */ x"ec",x"80",x"e0",x"e0",x"78",x"fd",x"0d",x"d0", --     jne D, 0xfd78, $fail
	/*      */                                                  --
	/* d284 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d289 */ x"20",x"40",x"e0",x"3f",x"2a",                   --     shr B, 0x2a3f
	/* d28e */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d295 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d29a */ x"24",x"40",x"e0",x"3f",x"2a",                   --     ishr B, 0x2a3f
	/* d29f */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*      */                                                  --
	/* d2a7 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2ac */ x"28",x"40",x"e0",x"3f",x"2a",                   --     shl B, 0x2a3f
	/* d2b1 */ x"ec",x"40",x"e0",x"e0",x"00",x"80",x"0d",x"d0", --     jne B, 0x8000, $fail
	/*      */                                                  --
	/* d2b9 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2be */ x"2c",x"40",x"e0",x"3f",x"2a",                   --     and B, 0x2a3f
	/* d2c3 */ x"ec",x"40",x"e0",x"e0",x"2d",x"20",x"0d",x"d0", --     jne B, 0x202d, $fail
	/*      */                                                  --
	/* d2cb */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2d0 */ x"30",x"40",x"e0",x"3f",x"2a",                   --     or B, 0x2a3f
	/* d2d5 */ x"ec",x"40",x"e0",x"e0",x"bf",x"fa",x"0d",x"d0", --     jne B, 0xfabf, $fail
	/*      */                                                  --
	/* d2dd */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2e2 */ x"34",x"40",x"e0",x"3f",x"2a",                   --     xor B, 0x2a3f
	/* d2e7 */ x"ec",x"40",x"e0",x"e0",x"92",x"da",x"0d",x"d0", --     jne B, 0xda92, $fail
	/*      */                                                  --
	/* d2ef */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2f4 */ x"38",x"40",                                     --     neg B
	/* d2f6 */ x"ec",x"40",x"e0",x"e0",x"53",x"0f",x"0d",x"d0", --     jne B, 0x0f53, $fail
	/*      */                                                  --
	/* d2fe */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d303 */ x"3c",x"40",                                     --     not B
	/* d305 */ x"ec",x"40",x"e0",x"e0",x"52",x"0f",x"0d",x"d0", --     jne B, 0x0f52, $fail
	/*      */                                                  --
	/* d30d */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d312 */ x"40",x"40",                                     --     bool B
	/* d314 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d31b */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d320 */ x"44",x"40",                                     --     inc B
	/* d322 */ x"ec",x"40",x"e0",x"e0",x"ae",x"f0",x"0d",x"d0", --     jne B, 0xf0ae, $fail
	/*      */                                                  --
	/* d32a */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d32f */ x"48",x"40",                                     --     dec B
	/* d331 */ x"ec",x"40",x"e0",x"e0",x"ac",x"f0",x"0d",x"d0", --     jne B, 0xf0ac, $fail
	/*      */                                                  --
	/*      */                                                  --      # t=False, a=0000, b=dead
	/* d339 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d33d */ x"00",x"40",x"e0",x"ad",x"de",                   --     add B, 0xdead
	/* d342 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*      */                                                  --
	/* d34a */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d34e */ x"04",x"40",x"e0",x"ad",x"de",                   --     sub B, 0xdead
	/* d353 */ x"ec",x"40",x"e0",x"e0",x"53",x"21",x"0d",x"d0", --     jne B, 0x2153, $fail
	/*      */                                                  --
	/* d35b */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d35f */ x"08",x"40",x"e0",x"ad",x"de",                   --     mul B, 0xdead
	/* d364 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/* d36b */ x"ec",x"80",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne D, 0x0000, $fail
	/*      */                                                  --
	/* d372 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d376 */ x"0c",x"40",x"e0",x"ad",x"de",                   --     imul B, 0xdead
	/* d37b */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/* d382 */ x"ec",x"80",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne D, 0x0000, $fail
	/*      */                                                  --
	/* d389 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d38d */ x"20",x"40",x"e0",x"ad",x"de",                   --     shr B, 0xdead
	/* d392 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d399 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d39d */ x"24",x"40",x"e0",x"ad",x"de",                   --     ishr B, 0xdead
	/* d3a2 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d3a9 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3ad */ x"28",x"40",x"e0",x"ad",x"de",                   --     shl B, 0xdead
	/* d3b2 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d3b9 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3bd */ x"2c",x"40",x"e0",x"ad",x"de",                   --     and B, 0xdead
	/* d3c2 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d3c9 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3cd */ x"30",x"40",x"e0",x"ad",x"de",                   --     or B, 0xdead
	/* d3d2 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*      */                                                  --
	/* d3da */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3de */ x"34",x"40",x"e0",x"ad",x"de",                   --     xor B, 0xdead
	/* d3e3 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*      */                                                  --
	/* d3eb */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3ef */ x"38",x"40",                                     --     neg B
	/* d3f1 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d3f8 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3fc */ x"3c",x"40",                                     --     not B
	/* d3fe */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*      */                                                  --
	/* d406 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d40a */ x"40",x"40",                                     --     bool B
	/* d40c */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d413 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d417 */ x"44",x"40",                                     --     inc B
	/* d419 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d420 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d424 */ x"48",x"40",                                     --     dec B
	/* d426 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*      */                                                  --
	/*      */                                                  -- jmp_test:
	/* d42e */ x"e8",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jeq 0xffab, 0x002b, $fail
	/* d437 */ x"ec",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"44",x"d4", --     jne 0xffab, 0x002b, $_L_test_jmp_1
	/* d440 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_1:
	/* d444 */ x"f0",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jlt 0xffab, 0x002b, $fail
	/* d44d */ x"f4",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jle 0xffab, 0x002b, $fail
	/* d456 */ x"f8",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"63",x"d4", --     jgt 0xffab, 0x002b, $_L_test_jmp_2
	/* d45f */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_2:
	/* d463 */ x"fc",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"70",x"d4", --     jge 0xffab, 0x002b, $_L_test_jmp_3
	/* d46c */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_3:
	/* d470 */ x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             --     cmp 0xffab, 0x002b
	/* d476 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* d47a */ x"6c",x"e0",x"82",x"d4",                         --     jne $_L_test_jmp_4
	/* d47e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_4:
	/* d482 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* d486 */ x"74",x"e0",x"0d",x"d0",                         --     jle $fail
	/* d48a */ x"78",x"e0",x"92",x"d4",                         --     jgt $_L_test_jmp_5
	/* d48e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_5:
	/* d492 */ x"7c",x"e0",x"9a",x"d4",                         --     jge $_L_test_jmp_6
	/* d496 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_6:
	/* d49a */ x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             --     icmp 0xffab, 0x002b
	/* d4a0 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* d4a4 */ x"6c",x"e0",x"ac",x"d4",                         --     jne $_L_test_jmp_7
	/* d4a8 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_7:
	/* d4ac */ x"70",x"e0",x"b4",x"d4",                         --     jlt $_L_test_jmp_8
	/* d4b0 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_8:
	/* d4b4 */ x"74",x"e0",x"bc",x"d4",                         --     jle $_L_test_jmp_9
	/* d4b8 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_9:
	/* d4bc */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* d4c0 */ x"7c",x"e0",x"0d",x"d0",                         --     jge $fail
	/* d4c4 */ x"e8",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jeq 0x002b, 0xffab, $fail
	/* d4cd */ x"ec",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"da",x"d4", --     jne 0x002b, 0xffab, $_L_test_jmp_10
	/* d4d6 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_10:
	/* d4da */ x"f0",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"e7",x"d4", --     jlt 0x002b, 0xffab, $_L_test_jmp_11
	/* d4e3 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_11:
	/* d4e7 */ x"f4",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"f4",x"d4", --     jle 0x002b, 0xffab, $_L_test_jmp_12
	/* d4f0 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_12:
	/* d4f4 */ x"f8",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jgt 0x002b, 0xffab, $fail
	/* d4fd */ x"fc",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jge 0x002b, 0xffab, $fail
	/* d506 */ x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             --     cmp 0x002b, 0xffab
	/* d50c */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* d510 */ x"6c",x"e0",x"18",x"d5",                         --     jne $_L_test_jmp_13
	/* d514 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_13:
	/* d518 */ x"70",x"e0",x"20",x"d5",                         --     jlt $_L_test_jmp_14
	/* d51c */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_14:
	/* d520 */ x"74",x"e0",x"28",x"d5",                         --     jle $_L_test_jmp_15
	/* d524 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_15:
	/* d528 */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* d52c */ x"7c",x"e0",x"0d",x"d0",                         --     jge $fail
	/* d530 */ x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             --     icmp 0x002b, 0xffab
	/* d536 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* d53a */ x"6c",x"e0",x"42",x"d5",                         --     jne $_L_test_jmp_16
	/* d53e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_16:
	/* d542 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* d546 */ x"74",x"e0",x"0d",x"d0",                         --     jle $fail
	/* d54a */ x"78",x"e0",x"52",x"d5",                         --     jgt $_L_test_jmp_17
	/* d54e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_17:
	/* d552 */ x"7c",x"e0",x"5a",x"d5",                         --     jge $_L_test_jmp_18
	/* d556 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_18:
	/* d55a */ x"e8",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"68",x"d5", --     jeq 0xffab, 0xffab, $_L_test_jmp_19
	/* d564 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_19:
	/* d568 */ x"ec",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jne 0xffab, 0xffab, $fail
	/* d572 */ x"f0",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jlt 0xffab, 0xffab, $fail
	/* d57c */ x"f4",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"8a",x"d5", --     jle 0xffab, 0xffab, $_L_test_jmp_20
	/* d586 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_20:
	/* d58a */ x"f8",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jgt 0xffab, 0xffab, $fail
	/* d594 */ x"fc",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"a2",x"d5", --     jge 0xffab, 0xffab, $_L_test_jmp_21
	/* d59e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_21:
	/* d5a2 */ x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     cmp 0xffab, 0xffab
	/* d5a9 */ x"68",x"e0",x"b1",x"d5",                         --     jeq $_L_test_jmp_22
	/* d5ad */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_22:
	/* d5b1 */ x"6c",x"e0",x"0d",x"d0",                         --     jne $fail
	/* d5b5 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* d5b9 */ x"74",x"e0",x"c1",x"d5",                         --     jle $_L_test_jmp_23
	/* d5bd */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_23:
	/* d5c1 */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* d5c5 */ x"7c",x"e0",x"cd",x"d5",                         --     jge $_L_test_jmp_24
	/* d5c9 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_24:
	/* d5cd */ x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     icmp 0xffab, 0xffab
	/* d5d4 */ x"68",x"e0",x"dc",x"d5",                         --     jeq $_L_test_jmp_25
	/* d5d8 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_25:
	/* d5dc */ x"6c",x"e0",x"0d",x"d0",                         --     jne $fail
	/* d5e0 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* d5e4 */ x"74",x"e0",x"ec",x"d5",                         --     jle $_L_test_jmp_26
	/* d5e8 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_26:
	/* d5ec */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* d5f0 */ x"7c",x"e0",x"f8",x"d5",                         --     jge $_L_test_jmp_27
	/* d5f4 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_27:
	/*      */                                                  -- test_uop_get_arg:
	/* d5f8 */ x"60",x"a0",x"e0",x"00",x"70",                   --     mov SP, 0x7000
	/* d5fd */ x"60",x"20",x"e0",x"aa",x"00",                   --     mov A, 0x00aa
	/* d602 */ x"60",x"40",x"e0",x"bb",x"00",                   --     mov B, 0x00bb
	/* d607 */ x"b6",x"20",x"3f",x"22",x"f6",                   --     xor [A], A*4 + -10, A*2
	/* d60c */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"ca",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03ca, $fail
	/* d616 */ x"b6",x"22",x"3f",x"1c",x"f6",x"85",             --     xor [A*2], A*4 + -10, -123
	/* d61c */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"1b",x"fd",x"0d",x"d0", --     jne [0x0154], 0xfd1b, $fail
	/* d626 */ x"b6",x"e0",x"3f",x"22",x"39",x"30",x"f6",       --     xor [12345], A*4 + -10, A*2
	/* d62d */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"ca",x"03",x"0d",x"d0", --     jne [0x3039], 0x03ca, $fail
	/* d637 */ x"b6",x"3f",x"e0",x"2b",x"f6",x"39",x"30",       --     xor [A*4 + -10], 12345, A*4 + B
	/* d63e */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"5a",x"33",x"0d",x"d0", --     jne [0x029e], 0x335a, $fail
	/* d648 */ x"b6",x"e0",x"2b",x"e4",x"39",x"30",x"de",x"fa", --     xor [12345], A*4 + B, 0xFADE + A
	/* d650 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"eb",x"f8",x"0d",x"d0", --     jne [0x3039], 0xf8eb, $fail
	/* d65a */ x"b6",x"2b",x"3f",x"20",x"f6",                   --     xor [A*4 + B], A*4 + -10, A
	/* d65f */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"34",x"02",x"0d",x"d0", --     jne [0x0363], 0x0234, $fail
	/* d669 */ x"b6",x"22",x"e0",x"22",x"39",x"30",             --     xor [A*2], 12345, A*2
	/* d66f */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"6d",x"31",x"0d",x"d0", --     jne [0x0154], 0x316d, $fail
	/* d679 */ x"b6",x"e0",x"3f",x"20",x"39",x"30",x"f6",       --     xor [12345], A*4 + -10, A
	/* d680 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"34",x"02",x"0d",x"d0", --     jne [0x3039], 0x0234, $fail
	/* d68a */ x"b6",x"3f",x"e4",x"22",x"f6",x"de",x"fa",       --     xor [A*4 + -10], 0xFADE + A, A*2
	/* d691 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"dc",x"fa",x"0d",x"d0", --     jne [0x029e], 0xfadc, $fail
	/* d69b */ x"b6",x"e0",x"e4",x"e4",x"39",x"30",x"de",x"fa",x"de",x"fa", --     xor [12345], 0xFADE + A, 0xFADE + A
	/* d6a5 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* d6ae */ x"b6",x"3f",x"20",x"e4",x"f6",x"de",x"fa",       --     xor [A*4 + -10], A, 0xFADE + A
	/* d6b5 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"22",x"fb",x"0d",x"d0", --     jne [0x029e], 0xfb22, $fail
	/* d6bf */ x"b6",x"22",x"2b",x"20",                         --     xor [A*2], A*4 + B, A
	/* d6c3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"c9",x"03",x"0d",x"d0", --     jne [0x0154], 0x03c9, $fail
	/* d6cd */ x"b6",x"22",x"3f",x"22",x"f6",                   --     xor [A*2], A*4 + -10, A*2
	/* d6d2 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ca",x"03",x"0d",x"d0", --     jne [0x0154], 0x03ca, $fail
	/* d6dc */ x"b6",x"2b",x"2b",x"20",                         --     xor [A*4 + B], A*4 + B, A
	/* d6e0 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"c9",x"03",x"0d",x"d0", --     jne [0x0363], 0x03c9, $fail
	/* d6ea */ x"b6",x"3f",x"1c",x"20",x"f6",x"85",             --     xor [A*4 + -10], -123, A
	/* d6f0 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"2f",x"ff",x"0d",x"d0", --     jne [0x029e], 0xff2f, $fail
	/* d6fa */ x"b6",x"22",x"1c",x"22",x"85",                   --     xor [A*2], -123, A*2
	/* d6ff */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"d1",x"fe",x"0d",x"d0", --     jne [0x0154], 0xfed1, $fail
	/* d709 */ x"b6",x"e0",x"20",x"3f",x"39",x"30",x"f6",       --     xor [12345], A, A*4 + -10
	/* d710 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"34",x"02",x"0d",x"d0", --     jne [0x3039], 0x0234, $fail
	/* d71a */ x"b6",x"2b",x"e4",x"e4",x"de",x"fa",x"de",x"fa", --     xor [A*4 + B], 0xFADE + A, 0xFADE + A
	/* d722 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* d72b */ x"b6",x"e0",x"1c",x"22",x"39",x"30",x"85",       --     xor [12345], -123, A*2
	/* d732 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"d1",x"fe",x"0d",x"d0", --     jne [0x3039], 0xfed1, $fail
	/* d73c */ x"b6",x"2b",x"22",x"2b",                         --     xor [A*4 + B], A*2, A*4 + B
	/* d740 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"37",x"02",x"0d",x"d0", --     jne [0x0363], 0x0237, $fail
	/* d74a */ x"b6",x"22",x"e4",x"e4",x"de",x"fa",x"de",x"fa", --     xor [A*2], 0xFADE + A, 0xFADE + A
	/* d752 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* d75b */ x"b6",x"20",x"20",x"20",                         --     xor [A], A, A
	/* d75f */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* d768 */ x"b6",x"22",x"2b",x"2b",                         --     xor [A*2], A*4 + B, A*4 + B
	/* d76c */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* d775 */ x"b6",x"20",x"e0",x"e0",x"39",x"30",x"39",x"30", --     xor [A], 12345, 12345
	/* d77d */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* d786 */ x"b6",x"e0",x"1c",x"e0",x"39",x"30",x"85",x"39",x"30", --     xor [12345], -123, 12345
	/* d78f */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"bc",x"cf",x"0d",x"d0", --     jne [0x3039], 0xcfbc, $fail
	/* d799 */ x"b6",x"20",x"e4",x"22",x"de",x"fa",             --     xor [A], 0xFADE + A, A*2
	/* d79f */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"dc",x"fa",x"0d",x"d0", --     jne [0x00aa], 0xfadc, $fail
	/* d7a9 */ x"b6",x"e0",x"20",x"2b",x"39",x"30",             --     xor [12345], A, A*4 + B
	/* d7af */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"c9",x"03",x"0d",x"d0", --     jne [0x3039], 0x03c9, $fail
	/* d7b9 */ x"b6",x"20",x"e0",x"22",x"39",x"30",             --     xor [A], 12345, A*2
	/* d7bf */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"6d",x"31",x"0d",x"d0", --     jne [0x00aa], 0x316d, $fail
	/* d7c9 */ x"b6",x"22",x"2b",x"1c",x"85",                   --     xor [A*2], A*4 + B, -123
	/* d7ce */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"e6",x"fc",x"0d",x"d0", --     jne [0x0154], 0xfce6, $fail
	/* d7d8 */ x"b6",x"e0",x"20",x"1c",x"39",x"30",x"85",       --     xor [12345], A, -123
	/* d7df */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"2f",x"ff",x"0d",x"d0", --     jne [0x3039], 0xff2f, $fail
	/* d7e9 */ x"b6",x"2b",x"e4",x"e0",x"de",x"fa",x"39",x"30", --     xor [A*4 + B], 0xFADE + A, 12345
	/* d7f1 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"b1",x"cb",x"0d",x"d0", --     jne [0x0363], 0xcbb1, $fail
	/* d7fb */ x"b6",x"2b",x"22",x"e0",x"39",x"30",             --     xor [A*4 + B], A*2, 12345
	/* d801 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"6d",x"31",x"0d",x"d0", --     jne [0x0363], 0x316d, $fail
	/* d80b */ x"b6",x"3f",x"2b",x"20",x"f6",                   --     xor [A*4 + -10], A*4 + B, A
	/* d810 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"c9",x"03",x"0d",x"d0", --     jne [0x029e], 0x03c9, $fail
	/* d81a */ x"b6",x"22",x"e4",x"1c",x"de",x"fa",x"85",       --     xor [A*2], 0xFADE + A, -123
	/* d821 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"0d",x"04",x"0d",x"d0", --     jne [0x0154], 0x040d, $fail
	/* d82b */ x"b6",x"e0",x"22",x"1c",x"39",x"30",x"85",       --     xor [12345], A*2, -123
	/* d832 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"d1",x"fe",x"0d",x"d0", --     jne [0x3039], 0xfed1, $fail
	/* d83c */ x"b6",x"20",x"e0",x"2b",x"39",x"30",             --     xor [A], 12345, A*4 + B
	/* d842 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"5a",x"33",x"0d",x"d0", --     jne [0x00aa], 0x335a, $fail
	/* d84c */ x"b6",x"22",x"1c",x"e0",x"85",x"39",x"30",       --     xor [A*2], -123, 12345
	/* d853 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"bc",x"cf",x"0d",x"d0", --     jne [0x0154], 0xcfbc, $fail
	/* d85d */ x"b6",x"20",x"20",x"22",                         --     xor [A], A, A*2
	/* d861 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"fe",x"01",x"0d",x"d0", --     jne [0x00aa], 0x01fe, $fail
	/* d86b */ x"b6",x"2b",x"3f",x"e0",x"f6",x"39",x"30",       --     xor [A*4 + B], A*4 + -10, 12345
	/* d872 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"a7",x"32",x"0d",x"d0", --     jne [0x0363], 0x32a7, $fail
	/* d87c */ x"b6",x"2b",x"e0",x"20",x"39",x"30",             --     xor [A*4 + B], 12345, A
	/* d882 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"93",x"30",x"0d",x"d0", --     jne [0x0363], 0x3093, $fail
	/* d88c */ x"b6",x"3f",x"e4",x"e4",x"f6",x"de",x"fa",x"de",x"fa", --     xor [A*4 + -10], 0xFADE + A, 0xFADE + A
	/* d895 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* d89e */ x"b6",x"22",x"2b",x"e4",x"de",x"fa",             --     xor [A*2], A*4 + B, 0xFADE + A
	/* d8a4 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"eb",x"f8",x"0d",x"d0", --     jne [0x0154], 0xf8eb, $fail
	/* d8ae */ x"b6",x"22",x"22",x"20",                         --     xor [A*2], A*2, A
	/* d8b2 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"fe",x"01",x"0d",x"d0", --     jne [0x0154], 0x01fe, $fail
	/* d8bc */ x"b6",x"22",x"e0",x"3f",x"39",x"30",x"f6",       --     xor [A*2], 12345, A*4 + -10
	/* d8c3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"a7",x"32",x"0d",x"d0", --     jne [0x0154], 0x32a7, $fail
	/* d8cd */ x"b6",x"22",x"e0",x"1c",x"39",x"30",x"85",       --     xor [A*2], 12345, -123
	/* d8d4 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"bc",x"cf",x"0d",x"d0", --     jne [0x0154], 0xcfbc, $fail
	/* d8de */ x"b6",x"3f",x"2b",x"22",x"f6",                   --     xor [A*4 + -10], A*4 + B, A*2
	/* d8e3 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"37",x"02",x"0d",x"d0", --     jne [0x029e], 0x0237, $fail
	/* d8ed */ x"b6",x"22",x"20",x"20",                         --     xor [A*2], A, A
	/* d8f1 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* d8fa */ x"b6",x"e0",x"e0",x"2b",x"39",x"30",x"39",x"30", --     xor [12345], 12345, A*4 + B
	/* d902 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"5a",x"33",x"0d",x"d0", --     jne [0x3039], 0x335a, $fail
	/* d90c */ x"b6",x"22",x"3f",x"20",x"f6",                   --     xor [A*2], A*4 + -10, A
	/* d911 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"34",x"02",x"0d",x"d0", --     jne [0x0154], 0x0234, $fail
	/* d91b */ x"b6",x"20",x"3f",x"2b",x"f6",                   --     xor [A], A*4 + -10, A*4 + B
	/* d920 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"fd",x"01",x"0d",x"d0", --     jne [0x00aa], 0x01fd, $fail
	/* d92a */ x"b6",x"e0",x"2b",x"20",x"39",x"30",             --     xor [12345], A*4 + B, A
	/* d930 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"c9",x"03",x"0d",x"d0", --     jne [0x3039], 0x03c9, $fail
	/* d93a */ x"b6",x"2b",x"e4",x"20",x"de",x"fa",             --     xor [A*4 + B], 0xFADE + A, A
	/* d940 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"22",x"fb",x"0d",x"d0", --     jne [0x0363], 0xfb22, $fail
	/* d94a */ x"b6",x"2b",x"e4",x"1c",x"de",x"fa",x"85",       --     xor [A*4 + B], 0xFADE + A, -123
	/* d951 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"0d",x"04",x"0d",x"d0", --     jne [0x0363], 0x040d, $fail
	/* d95b */ x"b6",x"3f",x"3f",x"e4",x"f6",x"f6",x"de",x"fa", --     xor [A*4 + -10], A*4 + -10, 0xFADE + A
	/* d963 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"16",x"f9",x"0d",x"d0", --     jne [0x029e], 0xf916, $fail
	/* d96d */ x"b6",x"3f",x"20",x"e0",x"f6",x"39",x"30",       --     xor [A*4 + -10], A, 12345
	/* d974 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"93",x"30",x"0d",x"d0", --     jne [0x029e], 0x3093, $fail
	/* d97e */ x"b6",x"20",x"20",x"1c",x"85",                   --     xor [A], A, -123
	/* d983 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"2f",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xff2f, $fail
	/* d98d */ x"b6",x"20",x"1c",x"e4",x"85",x"de",x"fa",       --     xor [A], -123, 0xFADE + A
	/* d994 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"0d",x"04",x"0d",x"d0", --     jne [0x00aa], 0x040d, $fail
	/* d99e */ x"b6",x"22",x"20",x"3f",x"f6",                   --     xor [A*2], A, A*4 + -10
	/* d9a3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"34",x"02",x"0d",x"d0", --     jne [0x0154], 0x0234, $fail
	/* d9ad */ x"b6",x"2b",x"20",x"3f",x"f6",                   --     xor [A*4 + B], A, A*4 + -10
	/* d9b2 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"34",x"02",x"0d",x"d0", --     jne [0x0363], 0x0234, $fail
	/* d9bc */ x"b6",x"2b",x"1c",x"22",x"85",                   --     xor [A*4 + B], -123, A*2
	/* d9c1 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"d1",x"fe",x"0d",x"d0", --     jne [0x0363], 0xfed1, $fail
	/* d9cb */ x"b6",x"20",x"1c",x"20",x"85",                   --     xor [A], -123, A
	/* d9d0 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"2f",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xff2f, $fail
	/* d9da */ x"b6",x"22",x"20",x"2b",                         --     xor [A*2], A, A*4 + B
	/* d9de */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"c9",x"03",x"0d",x"d0", --     jne [0x0154], 0x03c9, $fail
	/* d9e8 */ x"b6",x"2b",x"1c",x"20",x"85",                   --     xor [A*4 + B], -123, A
	/* d9ed */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"2f",x"ff",x"0d",x"d0", --     jne [0x0363], 0xff2f, $fail
	/* d9f7 */ x"b6",x"e0",x"20",x"20",x"39",x"30",             --     xor [12345], A, A
	/* d9fd */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* da06 */ x"b6",x"20",x"22",x"2b",                         --     xor [A], A*2, A*4 + B
	/* da0a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"37",x"02",x"0d",x"d0", --     jne [0x00aa], 0x0237, $fail
	/* da14 */ x"b6",x"22",x"e4",x"3f",x"de",x"fa",x"f6",       --     xor [A*2], 0xFADE + A, A*4 + -10
	/* da1b */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"16",x"f9",x"0d",x"d0", --     jne [0x0154], 0xf916, $fail
	/* da25 */ x"b6",x"e0",x"e0",x"1c",x"39",x"30",x"39",x"30",x"85", --     xor [12345], 12345, -123
	/* da2e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"bc",x"cf",x"0d",x"d0", --     jne [0x3039], 0xcfbc, $fail
	/* da38 */ x"b6",x"e0",x"2b",x"22",x"39",x"30",             --     xor [12345], A*4 + B, A*2
	/* da3e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"37",x"02",x"0d",x"d0", --     jne [0x3039], 0x0237, $fail
	/* da48 */ x"b6",x"20",x"1c",x"1c",x"85",x"85",             --     xor [A], -123, -123
	/* da4e */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* da57 */ x"b6",x"2b",x"3f",x"3f",x"f6",x"f6",             --     xor [A*4 + B], A*4 + -10, A*4 + -10
	/* da5d */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* da66 */ x"b6",x"22",x"2b",x"22",                         --     xor [A*2], A*4 + B, A*2
	/* da6a */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"37",x"02",x"0d",x"d0", --     jne [0x0154], 0x0237, $fail
	/* da74 */ x"b6",x"20",x"1c",x"e0",x"85",x"39",x"30",       --     xor [A], -123, 12345
	/* da7b */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"bc",x"cf",x"0d",x"d0", --     jne [0x00aa], 0xcfbc, $fail
	/* da85 */ x"b6",x"e0",x"2b",x"e0",x"39",x"30",x"39",x"30", --     xor [12345], A*4 + B, 12345
	/* da8d */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"5a",x"33",x"0d",x"d0", --     jne [0x3039], 0x335a, $fail
	/* da97 */ x"b6",x"20",x"e4",x"3f",x"de",x"fa",x"f6",       --     xor [A], 0xFADE + A, A*4 + -10
	/* da9e */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"16",x"f9",x"0d",x"d0", --     jne [0x00aa], 0xf916, $fail
	/* daa8 */ x"b6",x"22",x"3f",x"3f",x"f6",x"f6",             --     xor [A*2], A*4 + -10, A*4 + -10
	/* daae */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* dab7 */ x"b6",x"2b",x"1c",x"1c",x"85",x"85",             --     xor [A*4 + B], -123, -123
	/* dabd */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* dac6 */ x"b6",x"2b",x"3f",x"22",x"f6",                   --     xor [A*4 + B], A*4 + -10, A*2
	/* dacb */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"ca",x"03",x"0d",x"d0", --     jne [0x0363], 0x03ca, $fail
	/* dad5 */ x"b6",x"20",x"e4",x"e0",x"de",x"fa",x"39",x"30", --     xor [A], 0xFADE + A, 12345
	/* dadd */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"b1",x"cb",x"0d",x"d0", --     jne [0x00aa], 0xcbb1, $fail
	/* dae7 */ x"b6",x"3f",x"20",x"22",x"f6",                   --     xor [A*4 + -10], A, A*2
	/* daec */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"fe",x"01",x"0d",x"d0", --     jne [0x029e], 0x01fe, $fail
	/* daf6 */ x"b6",x"3f",x"3f",x"1c",x"f6",x"f6",x"85",       --     xor [A*4 + -10], A*4 + -10, -123
	/* dafd */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"1b",x"fd",x"0d",x"d0", --     jne [0x029e], 0xfd1b, $fail
	/* db07 */ x"b6",x"20",x"22",x"1c",x"85",                   --     xor [A], A*2, -123
	/* db0c */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"d1",x"fe",x"0d",x"d0", --     jne [0x00aa], 0xfed1, $fail
	/* db16 */ x"b6",x"3f",x"3f",x"e0",x"f6",x"f6",x"39",x"30", --     xor [A*4 + -10], A*4 + -10, 12345
	/* db1e */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"a7",x"32",x"0d",x"d0", --     jne [0x029e], 0x32a7, $fail
	/* db28 */ x"b6",x"20",x"e0",x"e4",x"39",x"30",x"de",x"fa", --     xor [A], 12345, 0xFADE + A
	/* db30 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"b1",x"cb",x"0d",x"d0", --     jne [0x00aa], 0xcbb1, $fail
	/* db3a */ x"b6",x"3f",x"20",x"20",x"f6",                   --     xor [A*4 + -10], A, A
	/* db3f */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* db48 */ x"b6",x"3f",x"20",x"2b",x"f6",                   --     xor [A*4 + -10], A, A*4 + B
	/* db4d */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"c9",x"03",x"0d",x"d0", --     jne [0x029e], 0x03c9, $fail
	/* db57 */ x"b6",x"3f",x"3f",x"22",x"f6",x"f6",             --     xor [A*4 + -10], A*4 + -10, A*2
	/* db5d */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"ca",x"03",x"0d",x"d0", --     jne [0x029e], 0x03ca, $fail
	/* db67 */ x"b6",x"e0",x"e0",x"20",x"39",x"30",x"39",x"30", --     xor [12345], 12345, A
	/* db6f */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"93",x"30",x"0d",x"d0", --     jne [0x3039], 0x3093, $fail
	/* db79 */ x"b6",x"20",x"20",x"2b",                         --     xor [A], A, A*4 + B
	/* db7d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"c9",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03c9, $fail
	/* db87 */ x"b6",x"2b",x"22",x"3f",x"f6",                   --     xor [A*4 + B], A*2, A*4 + -10
	/* db8c */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"ca",x"03",x"0d",x"d0", --     jne [0x0363], 0x03ca, $fail
	/* db96 */ x"b6",x"20",x"3f",x"e4",x"f6",x"de",x"fa",       --     xor [A], A*4 + -10, 0xFADE + A
	/* db9d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"16",x"f9",x"0d",x"d0", --     jne [0x00aa], 0xf916, $fail
	/* dba7 */ x"b6",x"20",x"e4",x"1c",x"de",x"fa",x"85",       --     xor [A], 0xFADE + A, -123
	/* dbae */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"0d",x"04",x"0d",x"d0", --     jne [0x00aa], 0x040d, $fail
	/* dbb8 */ x"b6",x"2b",x"e0",x"e4",x"39",x"30",x"de",x"fa", --     xor [A*4 + B], 12345, 0xFADE + A
	/* dbc0 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"b1",x"cb",x"0d",x"d0", --     jne [0x0363], 0xcbb1, $fail
	/* dbca */ x"b6",x"22",x"1c",x"1c",x"85",x"85",             --     xor [A*2], -123, -123
	/* dbd0 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* dbd9 */ x"b6",x"3f",x"3f",x"20",x"f6",x"f6",             --     xor [A*4 + -10], A*4 + -10, A
	/* dbdf */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"34",x"02",x"0d",x"d0", --     jne [0x029e], 0x0234, $fail
	/* dbe9 */ x"b6",x"2b",x"e0",x"1c",x"39",x"30",x"85",       --     xor [A*4 + B], 12345, -123
	/* dbf0 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"bc",x"cf",x"0d",x"d0", --     jne [0x0363], 0xcfbc, $fail
	/* dbfa */ x"b6",x"e0",x"1c",x"3f",x"39",x"30",x"85",x"f6", --     xor [12345], -123, A*4 + -10
	/* dc02 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"1b",x"fd",x"0d",x"d0", --     jne [0x3039], 0xfd1b, $fail
	/* dc0c */ x"b6",x"e0",x"22",x"20",x"39",x"30",             --     xor [12345], A*2, A
	/* dc12 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"fe",x"01",x"0d",x"d0", --     jne [0x3039], 0x01fe, $fail
	/* dc1c */ x"b6",x"22",x"e4",x"e0",x"de",x"fa",x"39",x"30", --     xor [A*2], 0xFADE + A, 12345
	/* dc24 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"b1",x"cb",x"0d",x"d0", --     jne [0x0154], 0xcbb1, $fail
	/* dc2e */ x"b6",x"3f",x"22",x"e0",x"f6",x"39",x"30",       --     xor [A*4 + -10], A*2, 12345
	/* dc35 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"6d",x"31",x"0d",x"d0", --     jne [0x029e], 0x316d, $fail
	/* dc3f */ x"b6",x"e0",x"e0",x"3f",x"39",x"30",x"39",x"30",x"f6", --     xor [12345], 12345, A*4 + -10
	/* dc48 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"a7",x"32",x"0d",x"d0", --     jne [0x3039], 0x32a7, $fail
	/* dc52 */ x"b6",x"2b",x"20",x"20",                         --     xor [A*4 + B], A, A
	/* dc56 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* dc5f */ x"b6",x"3f",x"1c",x"e4",x"f6",x"85",x"de",x"fa", --     xor [A*4 + -10], -123, 0xFADE + A
	/* dc67 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"0d",x"04",x"0d",x"d0", --     jne [0x029e], 0x040d, $fail
	/* dc71 */ x"b6",x"20",x"1c",x"3f",x"85",x"f6",             --     xor [A], -123, A*4 + -10
	/* dc77 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"1b",x"fd",x"0d",x"d0", --     jne [0x00aa], 0xfd1b, $fail
	/* dc81 */ x"b6",x"20",x"2b",x"2b",                         --     xor [A], A*4 + B, A*4 + B
	/* dc85 */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* dc8e */ x"b6",x"e0",x"22",x"e0",x"39",x"30",x"39",x"30", --     xor [12345], A*2, 12345
	/* dc96 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"6d",x"31",x"0d",x"d0", --     jne [0x3039], 0x316d, $fail
	/* dca0 */ x"b6",x"3f",x"1c",x"e0",x"f6",x"85",x"39",x"30", --     xor [A*4 + -10], -123, 12345
	/* dca8 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"bc",x"cf",x"0d",x"d0", --     jne [0x029e], 0xcfbc, $fail
	/* dcb2 */ x"b6",x"20",x"2b",x"20",                         --     xor [A], A*4 + B, A
	/* dcb6 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"c9",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03c9, $fail
	/* dcc0 */ x"b6",x"e0",x"e4",x"22",x"39",x"30",x"de",x"fa", --     xor [12345], 0xFADE + A, A*2
	/* dcc8 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"dc",x"fa",x"0d",x"d0", --     jne [0x3039], 0xfadc, $fail
	/* dcd2 */ x"b6",x"2b",x"e4",x"3f",x"de",x"fa",x"f6",       --     xor [A*4 + B], 0xFADE + A, A*4 + -10
	/* dcd9 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"16",x"f9",x"0d",x"d0", --     jne [0x0363], 0xf916, $fail
	/* dce3 */ x"b6",x"3f",x"20",x"1c",x"f6",x"85",             --     xor [A*4 + -10], A, -123
	/* dce9 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"2f",x"ff",x"0d",x"d0", --     jne [0x029e], 0xff2f, $fail
	/* dcf3 */ x"b6",x"2b",x"1c",x"2b",x"85",                   --     xor [A*4 + B], -123, A*4 + B
	/* dcf8 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"e6",x"fc",x"0d",x"d0", --     jne [0x0363], 0xfce6, $fail
	/* dd02 */ x"b6",x"3f",x"1c",x"1c",x"f6",x"85",x"85",       --     xor [A*4 + -10], -123, -123
	/* dd09 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* dd12 */ x"b6",x"2b",x"3f",x"2b",x"f6",                   --     xor [A*4 + B], A*4 + -10, A*4 + B
	/* dd17 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"fd",x"01",x"0d",x"d0", --     jne [0x0363], 0x01fd, $fail
	/* dd21 */ x"b6",x"3f",x"e0",x"22",x"f6",x"39",x"30",       --     xor [A*4 + -10], 12345, A*2
	/* dd28 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"6d",x"31",x"0d",x"d0", --     jne [0x029e], 0x316d, $fail
	/* dd32 */ x"b6",x"e0",x"3f",x"e0",x"39",x"30",x"f6",x"39",x"30", --     xor [12345], A*4 + -10, 12345
	/* dd3b */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"a7",x"32",x"0d",x"d0", --     jne [0x3039], 0x32a7, $fail
	/* dd45 */ x"b6",x"20",x"2b",x"22",                         --     xor [A], A*4 + B, A*2
	/* dd49 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"37",x"02",x"0d",x"d0", --     jne [0x00aa], 0x0237, $fail
	/* dd53 */ x"b6",x"e0",x"22",x"2b",x"39",x"30",             --     xor [12345], A*2, A*4 + B
	/* dd59 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"37",x"02",x"0d",x"d0", --     jne [0x3039], 0x0237, $fail
	/* dd63 */ x"b6",x"22",x"e0",x"20",x"39",x"30",             --     xor [A*2], 12345, A
	/* dd69 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"93",x"30",x"0d",x"d0", --     jne [0x0154], 0x3093, $fail
	/* dd73 */ x"b6",x"22",x"20",x"e0",x"39",x"30",             --     xor [A*2], A, 12345
	/* dd79 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"93",x"30",x"0d",x"d0", --     jne [0x0154], 0x3093, $fail
	/* dd83 */ x"b6",x"3f",x"22",x"3f",x"f6",x"f6",             --     xor [A*4 + -10], A*2, A*4 + -10
	/* dd89 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"ca",x"03",x"0d",x"d0", --     jne [0x029e], 0x03ca, $fail
	/* dd93 */ x"b6",x"2b",x"1c",x"e4",x"85",x"de",x"fa",       --     xor [A*4 + B], -123, 0xFADE + A
	/* dd9a */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"0d",x"04",x"0d",x"d0", --     jne [0x0363], 0x040d, $fail
	/* dda4 */ x"b6",x"20",x"3f",x"20",x"f6",                   --     xor [A], A*4 + -10, A
	/* dda9 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"34",x"02",x"0d",x"d0", --     jne [0x00aa], 0x0234, $fail
	/* ddb3 */ x"b6",x"e0",x"2b",x"3f",x"39",x"30",x"f6",       --     xor [12345], A*4 + B, A*4 + -10
	/* ddba */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"fd",x"01",x"0d",x"d0", --     jne [0x3039], 0x01fd, $fail
	/* ddc4 */ x"b6",x"3f",x"e0",x"1c",x"f6",x"39",x"30",x"85", --     xor [A*4 + -10], 12345, -123
	/* ddcc */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"bc",x"cf",x"0d",x"d0", --     jne [0x029e], 0xcfbc, $fail
	/* ddd6 */ x"b6",x"22",x"1c",x"3f",x"85",x"f6",             --     xor [A*2], -123, A*4 + -10
	/* dddc */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"1b",x"fd",x"0d",x"d0", --     jne [0x0154], 0xfd1b, $fail
	/* dde6 */ x"b6",x"20",x"22",x"22",                         --     xor [A], A*2, A*2
	/* ddea */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* ddf3 */ x"b6",x"20",x"22",x"20",                         --     xor [A], A*2, A
	/* ddf7 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"fe",x"01",x"0d",x"d0", --     jne [0x00aa], 0x01fe, $fail
	/* de01 */ x"b6",x"20",x"e4",x"20",x"de",x"fa",             --     xor [A], 0xFADE + A, A
	/* de07 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"22",x"fb",x"0d",x"d0", --     jne [0x00aa], 0xfb22, $fail
	/* de11 */ x"b6",x"20",x"e0",x"1c",x"39",x"30",x"85",       --     xor [A], 12345, -123
	/* de18 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"bc",x"cf",x"0d",x"d0", --     jne [0x00aa], 0xcfbc, $fail
	/* de22 */ x"b6",x"e0",x"22",x"3f",x"39",x"30",x"f6",       --     xor [12345], A*2, A*4 + -10
	/* de29 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"ca",x"03",x"0d",x"d0", --     jne [0x3039], 0x03ca, $fail
	/* de33 */ x"b6",x"2b",x"20",x"2b",                         --     xor [A*4 + B], A, A*4 + B
	/* de37 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"c9",x"03",x"0d",x"d0", --     jne [0x0363], 0x03c9, $fail
	/* de41 */ x"b6",x"3f",x"e4",x"e0",x"f6",x"de",x"fa",x"39",x"30", --     xor [A*4 + -10], 0xFADE + A, 12345
	/* de4a */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"b1",x"cb",x"0d",x"d0", --     jne [0x029e], 0xcbb1, $fail
	/* de54 */ x"b6",x"3f",x"e0",x"3f",x"f6",x"39",x"30",x"f6", --     xor [A*4 + -10], 12345, A*4 + -10
	/* de5c */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"a7",x"32",x"0d",x"d0", --     jne [0x029e], 0x32a7, $fail
	/* de66 */ x"b6",x"e0",x"2b",x"2b",x"39",x"30",             --     xor [12345], A*4 + B, A*4 + B
	/* de6c */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* de75 */ x"b6",x"20",x"e0",x"20",x"39",x"30",             --     xor [A], 12345, A
	/* de7b */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"93",x"30",x"0d",x"d0", --     jne [0x00aa], 0x3093, $fail
	/* de85 */ x"b6",x"3f",x"22",x"e4",x"f6",x"de",x"fa",       --     xor [A*4 + -10], A*2, 0xFADE + A
	/* de8c */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"dc",x"fa",x"0d",x"d0", --     jne [0x029e], 0xfadc, $fail
	/* de96 */ x"b6",x"3f",x"2b",x"2b",x"f6",                   --     xor [A*4 + -10], A*4 + B, A*4 + B
	/* de9b */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* dea4 */ x"b6",x"3f",x"22",x"22",x"f6",                   --     xor [A*4 + -10], A*2, A*2
	/* dea9 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* deb2 */ x"b6",x"22",x"22",x"22",                         --     xor [A*2], A*2, A*2
	/* deb6 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* debf */ x"b6",x"20",x"20",x"e0",x"39",x"30",             --     xor [A], A, 12345
	/* dec5 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"93",x"30",x"0d",x"d0", --     jne [0x00aa], 0x3093, $fail
	/* decf */ x"b6",x"3f",x"e4",x"3f",x"f6",x"de",x"fa",x"f6", --     xor [A*4 + -10], 0xFADE + A, A*4 + -10
	/* ded7 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"16",x"f9",x"0d",x"d0", --     jne [0x029e], 0xf916, $fail
	/* dee1 */ x"b6",x"3f",x"1c",x"22",x"f6",x"85",             --     xor [A*4 + -10], -123, A*2
	/* dee7 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"d1",x"fe",x"0d",x"d0", --     jne [0x029e], 0xfed1, $fail
	/* def1 */ x"b6",x"e0",x"e4",x"3f",x"39",x"30",x"de",x"fa",x"f6", --     xor [12345], 0xFADE + A, A*4 + -10
	/* defa */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"16",x"f9",x"0d",x"d0", --     jne [0x3039], 0xf916, $fail
	/* df04 */ x"b6",x"20",x"22",x"e0",x"39",x"30",             --     xor [A], A*2, 12345
	/* df0a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"6d",x"31",x"0d",x"d0", --     jne [0x00aa], 0x316d, $fail
	/* df14 */ x"b6",x"22",x"e4",x"22",x"de",x"fa",             --     xor [A*2], 0xFADE + A, A*2
	/* df1a */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"dc",x"fa",x"0d",x"d0", --     jne [0x0154], 0xfadc, $fail
	/* df24 */ x"b6",x"22",x"22",x"e4",x"de",x"fa",             --     xor [A*2], A*2, 0xFADE + A
	/* df2a */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"dc",x"fa",x"0d",x"d0", --     jne [0x0154], 0xfadc, $fail
	/* df34 */ x"b6",x"e0",x"22",x"e4",x"39",x"30",x"de",x"fa", --     xor [12345], A*2, 0xFADE + A
	/* df3c */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"dc",x"fa",x"0d",x"d0", --     jne [0x3039], 0xfadc, $fail
	/* df46 */ x"b6",x"e0",x"3f",x"e4",x"39",x"30",x"f6",x"de",x"fa", --     xor [12345], A*4 + -10, 0xFADE + A
	/* df4f */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"16",x"f9",x"0d",x"d0", --     jne [0x3039], 0xf916, $fail
	/* df59 */ x"b6",x"20",x"2b",x"e0",x"39",x"30",             --     xor [A], A*4 + B, 12345
	/* df5f */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"5a",x"33",x"0d",x"d0", --     jne [0x00aa], 0x335a, $fail
	/* df69 */ x"b6",x"22",x"2b",x"e0",x"39",x"30",             --     xor [A*2], A*4 + B, 12345
	/* df6f */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"5a",x"33",x"0d",x"d0", --     jne [0x0154], 0x335a, $fail
	/* df79 */ x"b6",x"2b",x"20",x"e0",x"39",x"30",             --     xor [A*4 + B], A, 12345
	/* df7f */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"93",x"30",x"0d",x"d0", --     jne [0x0363], 0x3093, $fail
	/* df89 */ x"b6",x"22",x"1c",x"e4",x"85",x"de",x"fa",       --     xor [A*2], -123, 0xFADE + A
	/* df90 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"0d",x"04",x"0d",x"d0", --     jne [0x0154], 0x040d, $fail
	/* df9a */ x"b6",x"20",x"3f",x"3f",x"f6",x"f6",             --     xor [A], A*4 + -10, A*4 + -10
	/* dfa0 */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* dfa9 */ x"b6",x"2b",x"e0",x"2b",x"39",x"30",             --     xor [A*4 + B], 12345, A*4 + B
	/* dfaf */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"5a",x"33",x"0d",x"d0", --     jne [0x0363], 0x335a, $fail
	/* dfb9 */ x"b6",x"3f",x"1c",x"2b",x"f6",x"85",             --     xor [A*4 + -10], -123, A*4 + B
	/* dfbf */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"e6",x"fc",x"0d",x"d0", --     jne [0x029e], 0xfce6, $fail
	/* dfc9 */ x"b6",x"22",x"22",x"3f",x"f6",                   --     xor [A*2], A*2, A*4 + -10
	/* dfce */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ca",x"03",x"0d",x"d0", --     jne [0x0154], 0x03ca, $fail
	/* dfd8 */ x"b6",x"3f",x"e4",x"1c",x"f6",x"de",x"fa",x"85", --     xor [A*4 + -10], 0xFADE + A, -123
	/* dfe0 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"0d",x"04",x"0d",x"d0", --     jne [0x029e], 0x040d, $fail
	/* dfea */ x"b6",x"e0",x"20",x"22",x"39",x"30",             --     xor [12345], A, A*2
	/* dff0 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"fe",x"01",x"0d",x"d0", --     jne [0x3039], 0x01fe, $fail
	/* dffa */ x"b6",x"2b",x"e4",x"2b",x"de",x"fa",             --     xor [A*4 + B], 0xFADE + A, A*4 + B
	/* e000 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"eb",x"f8",x"0d",x"d0", --     jne [0x0363], 0xf8eb, $fail
	/* e00a */ x"b6",x"22",x"e4",x"2b",x"de",x"fa",             --     xor [A*2], 0xFADE + A, A*4 + B
	/* e010 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"eb",x"f8",x"0d",x"d0", --     jne [0x0154], 0xf8eb, $fail
	/* e01a */ x"b6",x"3f",x"2b",x"3f",x"f6",x"f6",             --     xor [A*4 + -10], A*4 + B, A*4 + -10
	/* e020 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"fd",x"01",x"0d",x"d0", --     jne [0x029e], 0x01fd, $fail
	/* e02a */ x"b6",x"e0",x"1c",x"2b",x"39",x"30",x"85",       --     xor [12345], -123, A*4 + B
	/* e031 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"e6",x"fc",x"0d",x"d0", --     jne [0x3039], 0xfce6, $fail
	/* e03b */ x"b6",x"3f",x"20",x"3f",x"f6",x"f6",             --     xor [A*4 + -10], A, A*4 + -10
	/* e041 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"34",x"02",x"0d",x"d0", --     jne [0x029e], 0x0234, $fail
	/* e04b */ x"b6",x"2b",x"1c",x"3f",x"85",x"f6",             --     xor [A*4 + B], -123, A*4 + -10
	/* e051 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"1b",x"fd",x"0d",x"d0", --     jne [0x0363], 0xfd1b, $fail
	/* e05b */ x"b6",x"3f",x"1c",x"3f",x"f6",x"85",x"f6",       --     xor [A*4 + -10], -123, A*4 + -10
	/* e062 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"1b",x"fd",x"0d",x"d0", --     jne [0x029e], 0xfd1b, $fail
	/* e06c */ x"b6",x"e0",x"20",x"e4",x"39",x"30",x"de",x"fa", --     xor [12345], A, 0xFADE + A
	/* e074 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"22",x"fb",x"0d",x"d0", --     jne [0x3039], 0xfb22, $fail
	/* e07e */ x"b6",x"e0",x"1c",x"20",x"39",x"30",x"85",       --     xor [12345], -123, A
	/* e085 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"2f",x"ff",x"0d",x"d0", --     jne [0x3039], 0xff2f, $fail
	/* e08f */ x"b6",x"2b",x"2b",x"3f",x"f6",                   --     xor [A*4 + B], A*4 + B, A*4 + -10
	/* e094 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"fd",x"01",x"0d",x"d0", --     jne [0x0363], 0x01fd, $fail
	/* e09e */ x"b6",x"2b",x"20",x"22",                         --     xor [A*4 + B], A, A*2
	/* e0a2 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"fe",x"01",x"0d",x"d0", --     jne [0x0363], 0x01fe, $fail
	/* e0ac */ x"b6",x"3f",x"22",x"2b",x"f6",                   --     xor [A*4 + -10], A*2, A*4 + B
	/* e0b1 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"37",x"02",x"0d",x"d0", --     jne [0x029e], 0x0237, $fail
	/* e0bb */ x"b6",x"3f",x"e0",x"e0",x"f6",x"39",x"30",x"39",x"30", --     xor [A*4 + -10], 12345, 12345
	/* e0c4 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* e0cd */ x"b6",x"2b",x"2b",x"e4",x"de",x"fa",             --     xor [A*4 + B], A*4 + B, 0xFADE + A
	/* e0d3 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"eb",x"f8",x"0d",x"d0", --     jne [0x0363], 0xf8eb, $fail
	/* e0dd */ x"b6",x"22",x"3f",x"2b",x"f6",                   --     xor [A*2], A*4 + -10, A*4 + B
	/* e0e2 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"fd",x"01",x"0d",x"d0", --     jne [0x0154], 0x01fd, $fail
	/* e0ec */ x"b6",x"3f",x"22",x"1c",x"f6",x"85",             --     xor [A*4 + -10], A*2, -123
	/* e0f2 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"d1",x"fe",x"0d",x"d0", --     jne [0x029e], 0xfed1, $fail
	/* e0fc */ x"b6",x"e0",x"20",x"e0",x"39",x"30",x"39",x"30", --     xor [12345], A, 12345
	/* e104 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"93",x"30",x"0d",x"d0", --     jne [0x3039], 0x3093, $fail
	/* e10e */ x"b6",x"20",x"e4",x"2b",x"de",x"fa",             --     xor [A], 0xFADE + A, A*4 + B
	/* e114 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"eb",x"f8",x"0d",x"d0", --     jne [0x00aa], 0xf8eb, $fail
	/* e11e */ x"b6",x"22",x"20",x"e4",x"de",x"fa",             --     xor [A*2], A, 0xFADE + A
	/* e124 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"22",x"fb",x"0d",x"d0", --     jne [0x0154], 0xfb22, $fail
	/* e12e */ x"b6",x"e0",x"e0",x"e4",x"39",x"30",x"39",x"30",x"de",x"fa", --     xor [12345], 12345, 0xFADE + A
	/* e138 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"b1",x"cb",x"0d",x"d0", --     jne [0x3039], 0xcbb1, $fail
	/* e142 */ x"b6",x"3f",x"e0",x"20",x"f6",x"39",x"30",       --     xor [A*4 + -10], 12345, A
	/* e149 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"93",x"30",x"0d",x"d0", --     jne [0x029e], 0x3093, $fail
	/* e153 */ x"b6",x"20",x"e0",x"3f",x"39",x"30",x"f6",       --     xor [A], 12345, A*4 + -10
	/* e15a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"a7",x"32",x"0d",x"d0", --     jne [0x00aa], 0x32a7, $fail
	/* e164 */ x"b6",x"e0",x"e4",x"e0",x"39",x"30",x"de",x"fa",x"39",x"30", --     xor [12345], 0xFADE + A, 12345
	/* e16e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"b1",x"cb",x"0d",x"d0", --     jne [0x3039], 0xcbb1, $fail
	/* e178 */ x"b6",x"3f",x"e4",x"20",x"f6",x"de",x"fa",       --     xor [A*4 + -10], 0xFADE + A, A
	/* e17f */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"22",x"fb",x"0d",x"d0", --     jne [0x029e], 0xfb22, $fail
	/* e189 */ x"b6",x"22",x"20",x"1c",x"85",                   --     xor [A*2], A, -123
	/* e18e */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"2f",x"ff",x"0d",x"d0", --     jne [0x0154], 0xff2f, $fail
	/* e198 */ x"b6",x"2b",x"2b",x"e0",x"39",x"30",             --     xor [A*4 + B], A*4 + B, 12345
	/* e19e */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"5a",x"33",x"0d",x"d0", --     jne [0x0363], 0x335a, $fail
	/* e1a8 */ x"b6",x"20",x"22",x"e4",x"de",x"fa",             --     xor [A], A*2, 0xFADE + A
	/* e1ae */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"dc",x"fa",x"0d",x"d0", --     jne [0x00aa], 0xfadc, $fail
	/* e1b8 */ x"b6",x"22",x"e0",x"e0",x"39",x"30",x"39",x"30", --     xor [A*2], 12345, 12345
	/* e1c0 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* e1c9 */ x"b6",x"e0",x"e4",x"1c",x"39",x"30",x"de",x"fa",x"85", --     xor [12345], 0xFADE + A, -123
	/* e1d2 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"0d",x"04",x"0d",x"d0", --     jne [0x3039], 0x040d, $fail
	/* e1dc */ x"b6",x"2b",x"3f",x"e4",x"f6",x"de",x"fa",       --     xor [A*4 + B], A*4 + -10, 0xFADE + A
	/* e1e3 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"16",x"f9",x"0d",x"d0", --     jne [0x0363], 0xf916, $fail
	/* e1ed */ x"b6",x"22",x"3f",x"e0",x"f6",x"39",x"30",       --     xor [A*2], A*4 + -10, 12345
	/* e1f4 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"a7",x"32",x"0d",x"d0", --     jne [0x0154], 0x32a7, $fail
	/* e1fe */ x"b6",x"2b",x"2b",x"2b",                         --     xor [A*4 + B], A*4 + B, A*4 + B
	/* e202 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* e20b */ x"b6",x"2b",x"e0",x"22",x"39",x"30",             --     xor [A*4 + B], 12345, A*2
	/* e211 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"6d",x"31",x"0d",x"d0", --     jne [0x0363], 0x316d, $fail
	/* e21b */ x"b6",x"e0",x"1c",x"1c",x"39",x"30",x"85",x"85", --     xor [12345], -123, -123
	/* e223 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* e22c */ x"b6",x"e0",x"2b",x"1c",x"39",x"30",x"85",       --     xor [12345], A*4 + B, -123
	/* e233 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"e6",x"fc",x"0d",x"d0", --     jne [0x3039], 0xfce6, $fail
	/* e23d */ x"b6",x"20",x"3f",x"e0",x"f6",x"39",x"30",       --     xor [A], A*4 + -10, 12345
	/* e244 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"a7",x"32",x"0d",x"d0", --     jne [0x00aa], 0x32a7, $fail
	/* e24e */ x"b6",x"3f",x"3f",x"2b",x"f6",x"f6",             --     xor [A*4 + -10], A*4 + -10, A*4 + B
	/* e254 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"fd",x"01",x"0d",x"d0", --     jne [0x029e], 0x01fd, $fail
	/* e25e */ x"b6",x"20",x"20",x"3f",x"f6",                   --     xor [A], A, A*4 + -10
	/* e263 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"34",x"02",x"0d",x"d0", --     jne [0x00aa], 0x0234, $fail
	/* e26d */ x"b6",x"2b",x"e4",x"22",x"de",x"fa",             --     xor [A*4 + B], 0xFADE + A, A*2
	/* e273 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"dc",x"fa",x"0d",x"d0", --     jne [0x0363], 0xfadc, $fail
	/* e27d */ x"b6",x"20",x"2b",x"3f",x"f6",                   --     xor [A], A*4 + B, A*4 + -10
	/* e282 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"fd",x"01",x"0d",x"d0", --     jne [0x00aa], 0x01fd, $fail
	/* e28c */ x"b6",x"22",x"2b",x"3f",x"f6",                   --     xor [A*2], A*4 + B, A*4 + -10
	/* e291 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"fd",x"01",x"0d",x"d0", --     jne [0x0154], 0x01fd, $fail
	/* e29b */ x"b6",x"2b",x"3f",x"1c",x"f6",x"85",             --     xor [A*4 + B], A*4 + -10, -123
	/* e2a1 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"1b",x"fd",x"0d",x"d0", --     jne [0x0363], 0xfd1b, $fail
	/* e2ab */ x"b6",x"3f",x"22",x"20",x"f6",                   --     xor [A*4 + -10], A*2, A
	/* e2b0 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"fe",x"01",x"0d",x"d0", --     jne [0x029e], 0x01fe, $fail
	/* e2ba */ x"b6",x"e0",x"22",x"22",x"39",x"30",             --     xor [12345], A*2, A*2
	/* e2c0 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* e2c9 */ x"b6",x"2b",x"20",x"1c",x"85",                   --     xor [A*4 + B], A, -123
	/* e2ce */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"2f",x"ff",x"0d",x"d0", --     jne [0x0363], 0xff2f, $fail
	/* e2d8 */ x"b6",x"3f",x"2b",x"e4",x"f6",x"de",x"fa",       --     xor [A*4 + -10], A*4 + B, 0xFADE + A
	/* e2df */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"eb",x"f8",x"0d",x"d0", --     jne [0x029e], 0xf8eb, $fail
	/* e2e9 */ x"b6",x"22",x"e0",x"e4",x"39",x"30",x"de",x"fa", --     xor [A*2], 12345, 0xFADE + A
	/* e2f1 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"b1",x"cb",x"0d",x"d0", --     jne [0x0154], 0xcbb1, $fail
	/* e2fb */ x"b6",x"e0",x"3f",x"3f",x"39",x"30",x"f6",x"f6", --     xor [12345], A*4 + -10, A*4 + -10
	/* e303 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* e30c */ x"b6",x"2b",x"22",x"e4",x"de",x"fa",             --     xor [A*4 + B], A*2, 0xFADE + A
	/* e312 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"dc",x"fa",x"0d",x"d0", --     jne [0x0363], 0xfadc, $fail
	/* e31c */ x"b6",x"2b",x"22",x"1c",x"85",                   --     xor [A*4 + B], A*2, -123
	/* e321 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"d1",x"fe",x"0d",x"d0", --     jne [0x0363], 0xfed1, $fail
	/* e32b */ x"b6",x"20",x"3f",x"1c",x"f6",x"85",             --     xor [A], A*4 + -10, -123
	/* e331 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"1b",x"fd",x"0d",x"d0", --     jne [0x00aa], 0xfd1b, $fail
	/* e33b */ x"b6",x"22",x"1c",x"2b",x"85",                   --     xor [A*2], -123, A*4 + B
	/* e340 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"e6",x"fc",x"0d",x"d0", --     jne [0x0154], 0xfce6, $fail
	/* e34a */ x"b6",x"2b",x"20",x"e4",x"de",x"fa",             --     xor [A*4 + B], A, 0xFADE + A
	/* e350 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"22",x"fb",x"0d",x"d0", --     jne [0x0363], 0xfb22, $fail
	/* e35a */ x"b6",x"20",x"1c",x"22",x"85",                   --     xor [A], -123, A*2
	/* e35f */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"d1",x"fe",x"0d",x"d0", --     jne [0x00aa], 0xfed1, $fail
	/* e369 */ x"b6",x"22",x"e0",x"2b",x"39",x"30",             --     xor [A*2], 12345, A*4 + B
	/* e36f */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"5a",x"33",x"0d",x"d0", --     jne [0x0154], 0x335a, $fail
	/* e379 */ x"b6",x"20",x"2b",x"1c",x"85",                   --     xor [A], A*4 + B, -123
	/* e37e */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"e6",x"fc",x"0d",x"d0", --     jne [0x00aa], 0xfce6, $fail
	/* e388 */ x"b6",x"20",x"1c",x"2b",x"85",                   --     xor [A], -123, A*4 + B
	/* e38d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"e6",x"fc",x"0d",x"d0", --     jne [0x00aa], 0xfce6, $fail
	/* e397 */ x"b6",x"22",x"1c",x"20",x"85",                   --     xor [A*2], -123, A
	/* e39c */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"2f",x"ff",x"0d",x"d0", --     jne [0x0154], 0xff2f, $fail
	/* e3a6 */ x"b6",x"2b",x"e0",x"e0",x"39",x"30",x"39",x"30", --     xor [A*4 + B], 12345, 12345
	/* e3ae */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* e3b7 */ x"b6",x"22",x"22",x"e0",x"39",x"30",             --     xor [A*2], A*2, 12345
	/* e3bd */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"6d",x"31",x"0d",x"d0", --     jne [0x0154], 0x316d, $fail
	/* e3c7 */ x"b6",x"3f",x"2b",x"1c",x"f6",x"85",             --     xor [A*4 + -10], A*4 + B, -123
	/* e3cd */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"e6",x"fc",x"0d",x"d0", --     jne [0x029e], 0xfce6, $fail
	/* e3d7 */ x"b6",x"2b",x"22",x"22",                         --     xor [A*4 + B], A*2, A*2
	/* e3db */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* e3e4 */ x"b6",x"22",x"e4",x"20",x"de",x"fa",             --     xor [A*2], 0xFADE + A, A
	/* e3ea */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"22",x"fb",x"0d",x"d0", --     jne [0x0154], 0xfb22, $fail
	/* e3f4 */ x"b6",x"3f",x"2b",x"e0",x"f6",x"39",x"30",       --     xor [A*4 + -10], A*4 + B, 12345
	/* e3fb */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"5a",x"33",x"0d",x"d0", --     jne [0x029e], 0x335a, $fail
	/* e405 */ x"b6",x"e0",x"1c",x"e4",x"39",x"30",x"85",x"de",x"fa", --     xor [12345], -123, 0xFADE + A
	/* e40e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"0d",x"04",x"0d",x"d0", --     jne [0x3039], 0x040d, $fail
	/* e418 */ x"b6",x"20",x"20",x"e4",x"de",x"fa",             --     xor [A], A, 0xFADE + A
	/* e41e */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"22",x"fb",x"0d",x"d0", --     jne [0x00aa], 0xfb22, $fail
	/* e428 */ x"b6",x"3f",x"e4",x"2b",x"f6",x"de",x"fa",       --     xor [A*4 + -10], 0xFADE + A, A*4 + B
	/* e42f */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"eb",x"f8",x"0d",x"d0", --     jne [0x029e], 0xf8eb, $fail
	/* e439 */ x"b6",x"22",x"22",x"1c",x"85",                   --     xor [A*2], A*2, -123
	/* e43e */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"d1",x"fe",x"0d",x"d0", --     jne [0x0154], 0xfed1, $fail
	/* e448 */ x"b6",x"2b",x"2b",x"22",                         --     xor [A*4 + B], A*4 + B, A*2
	/* e44c */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"37",x"02",x"0d",x"d0", --     jne [0x0363], 0x0237, $fail
	/* e456 */ x"b6",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"39",x"30", --     xor [12345], 12345, 12345
	/* e460 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* e469 */ x"b6",x"2b",x"2b",x"1c",x"85",                   --     xor [A*4 + B], A*4 + B, -123
	/* e46e */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"e6",x"fc",x"0d",x"d0", --     jne [0x0363], 0xfce6, $fail
	/* e478 */ x"b6",x"20",x"22",x"3f",x"f6",                   --     xor [A], A*2, A*4 + -10
	/* e47d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"ca",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03ca, $fail
	/* e487 */ x"b6",x"20",x"e4",x"e4",x"de",x"fa",x"de",x"fa", --     xor [A], 0xFADE + A, 0xFADE + A
	/* e48f */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* e498 */ x"b6",x"e0",x"e4",x"2b",x"39",x"30",x"de",x"fa", --     xor [12345], 0xFADE + A, A*4 + B
	/* e4a0 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"eb",x"f8",x"0d",x"d0", --     jne [0x3039], 0xf8eb, $fail
	/* e4aa */ x"b6",x"22",x"3f",x"e4",x"f6",x"de",x"fa",       --     xor [A*2], A*4 + -10, 0xFADE + A
	/* e4b1 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"16",x"f9",x"0d",x"d0", --     jne [0x0154], 0xf916, $fail
	/* e4bb */ x"b6",x"e0",x"e4",x"20",x"39",x"30",x"de",x"fa", --     xor [12345], 0xFADE + A, A
	/* e4c3 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"22",x"fb",x"0d",x"d0", --     jne [0x3039], 0xfb22, $fail
	/* e4cd */ x"b6",x"3f",x"e0",x"e4",x"f6",x"39",x"30",x"de",x"fa", --     xor [A*4 + -10], 12345, 0xFADE + A
	/* e4d6 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"b1",x"cb",x"0d",x"d0", --     jne [0x029e], 0xcbb1, $fail
	/* e4e0 */ x"b6",x"2b",x"22",x"20",                         --     xor [A*4 + B], A*2, A
	/* e4e4 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"fe",x"01",x"0d",x"d0", --     jne [0x0363], 0x01fe, $fail
	/* e4ee */ x"b6",x"2b",x"1c",x"e0",x"85",x"39",x"30",       --     xor [A*4 + B], -123, 12345
	/* e4f5 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"bc",x"cf",x"0d",x"d0", --     jne [0x0363], 0xcfbc, $fail
	/* e4ff */ x"b6",x"20",x"2b",x"e4",x"de",x"fa",             --     xor [A], A*4 + B, 0xFADE + A
	/* e505 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"eb",x"f8",x"0d",x"d0", --     jne [0x00aa], 0xf8eb, $fail
	/* e50f */ x"b6",x"e0",x"3f",x"1c",x"39",x"30",x"f6",x"85", --     xor [12345], A*4 + -10, -123
	/* e517 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"1b",x"fd",x"0d",x"d0", --     jne [0x3039], 0xfd1b, $fail
	/* e521 */ x"b6",x"e0",x"3f",x"2b",x"39",x"30",x"f6",       --     xor [12345], A*4 + -10, A*4 + B
	/* e528 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"fd",x"01",x"0d",x"d0", --     jne [0x3039], 0x01fd, $fail
	/* e532 */ x"b6",x"e0",x"e0",x"22",x"39",x"30",x"39",x"30", --     xor [12345], 12345, A*2
	/* e53a */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"6d",x"31",x"0d",x"d0", --     jne [0x3039], 0x316d, $fail
	/* e544 */ x"b6",x"22",x"20",x"22",                         --     xor [A*2], A, A*2
	/* e548 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"fe",x"01",x"0d",x"d0", --     jne [0x0154], 0x01fe, $fail
	/* e552 */ x"b6",x"2b",x"e0",x"3f",x"39",x"30",x"f6",       --     xor [A*4 + B], 12345, A*4 + -10
	/* e559 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"a7",x"32",x"0d",x"d0", --     jne [0x0363], 0x32a7, $fail
	/* e563 */ x"b6",x"3f",x"3f",x"3f",x"f6",x"f6",x"f6",       --     xor [A*4 + -10], A*4 + -10, A*4 + -10
	/* e56a */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* e573 */ x"b6",x"22",x"22",x"2b",                         --     xor [A*2], A*2, A*4 + B
	/* e577 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"37",x"02",x"0d",x"d0", --     jne [0x0154], 0x0237, $fail
	/* e581 */ x"62",x"20",x"1c",x"85",                         --     mov [A], -123
	/* e585 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"85",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xff85, $fail
	/* e58f */ x"62",x"2b",x"e0",x"39",x"30",                   --     mov [A*4 + B], 12345
	/* e594 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"39",x"30",x"0d",x"d0", --     jne [0x0363], 0x3039, $fail
	/* e59e */ x"62",x"2b",x"e4",x"de",x"fa",                   --     mov [A*4 + B], 0xFADE + A
	/* e5a3 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"88",x"fb",x"0d",x"d0", --     jne [0x0363], 0xfb88, $fail
	/* e5ad */ x"62",x"20",x"3f",x"f6",                         --     mov [A], A*4 + -10
	/* e5b1 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"9e",x"02",x"0d",x"d0", --     jne [0x00aa], 0x029e, $fail
	/* e5bb */ x"62",x"22",x"e0",x"39",x"30",                   --     mov [A*2], 12345
	/* e5c0 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"39",x"30",x"0d",x"d0", --     jne [0x0154], 0x3039, $fail
	/* e5ca */ x"62",x"3f",x"22",x"f6",                         --     mov [A*4 + -10], A*2
	/* e5ce */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"54",x"01",x"0d",x"d0", --     jne [0x029e], 0x0154, $fail
	/* e5d8 */ x"62",x"e0",x"3f",x"39",x"30",x"f6",             --     mov [12345], A*4 + -10
	/* e5de */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"9e",x"02",x"0d",x"d0", --     jne [0x3039], 0x029e, $fail
	/* e5e8 */ x"62",x"22",x"3f",x"f6",                         --     mov [A*2], A*4 + -10
	/* e5ec */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"9e",x"02",x"0d",x"d0", --     jne [0x0154], 0x029e, $fail
	/* e5f6 */ x"62",x"e0",x"20",x"39",x"30",                   --     mov [12345], A
	/* e5fb */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"aa",x"00",x"0d",x"d0", --     jne [0x3039], 0x00aa, $fail
	/* e605 */ x"62",x"3f",x"3f",x"f6",x"f6",                   --     mov [A*4 + -10], A*4 + -10
	/* e60a */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"9e",x"02",x"0d",x"d0", --     jne [0x029e], 0x029e, $fail
	/* e614 */ x"62",x"20",x"e4",x"de",x"fa",                   --     mov [A], 0xFADE + A
	/* e619 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"88",x"fb",x"0d",x"d0", --     jne [0x00aa], 0xfb88, $fail
	/* e623 */ x"62",x"2b",x"20",                               --     mov [A*4 + B], A
	/* e626 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"aa",x"00",x"0d",x"d0", --     jne [0x0363], 0x00aa, $fail
	/* e630 */ x"62",x"3f",x"e4",x"f6",x"de",x"fa",             --     mov [A*4 + -10], 0xFADE + A
	/* e636 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"88",x"fb",x"0d",x"d0", --     jne [0x029e], 0xfb88, $fail
	/* e640 */ x"62",x"2b",x"22",                               --     mov [A*4 + B], A*2
	/* e643 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"54",x"01",x"0d",x"d0", --     jne [0x0363], 0x0154, $fail
	/* e64d */ x"62",x"20",x"20",                               --     mov [A], A
	/* e650 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"aa",x"00",x"0d",x"d0", --     jne [0x00aa], 0x00aa, $fail
	/* e65a */ x"62",x"22",x"2b",                               --     mov [A*2], A*4 + B
	/* e65d */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"63",x"03",x"0d",x"d0", --     jne [0x0154], 0x0363, $fail
	/* e667 */ x"62",x"20",x"2b",                               --     mov [A], A*4 + B
	/* e66a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"63",x"03",x"0d",x"d0", --     jne [0x00aa], 0x0363, $fail
	/* e674 */ x"62",x"22",x"e4",x"de",x"fa",                   --     mov [A*2], 0xFADE + A
	/* e679 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"88",x"fb",x"0d",x"d0", --     jne [0x0154], 0xfb88, $fail
	/* e683 */ x"62",x"e0",x"2b",x"39",x"30",                   --     mov [12345], A*4 + B
	/* e688 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"63",x"03",x"0d",x"d0", --     jne [0x3039], 0x0363, $fail
	/* e692 */ x"62",x"22",x"22",                               --     mov [A*2], A*2
	/* e695 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"54",x"01",x"0d",x"d0", --     jne [0x0154], 0x0154, $fail
	/* e69f */ x"62",x"22",x"1c",x"85",                         --     mov [A*2], -123
	/* e6a3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"85",x"ff",x"0d",x"d0", --     jne [0x0154], 0xff85, $fail
	/* e6ad */ x"62",x"20",x"22",                               --     mov [A], A*2
	/* e6b0 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"54",x"01",x"0d",x"d0", --     jne [0x00aa], 0x0154, $fail
	/* e6ba */ x"62",x"3f",x"1c",x"f6",x"85",                   --     mov [A*4 + -10], -123
	/* e6bf */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"85",x"ff",x"0d",x"d0", --     jne [0x029e], 0xff85, $fail
	/* e6c9 */ x"62",x"20",x"e0",x"39",x"30",                   --     mov [A], 12345
	/* e6ce */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"39",x"30",x"0d",x"d0", --     jne [0x00aa], 0x3039, $fail
	/* e6d8 */ x"62",x"2b",x"3f",x"f6",                         --     mov [A*4 + B], A*4 + -10
	/* e6dc */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"9e",x"02",x"0d",x"d0", --     jne [0x0363], 0x029e, $fail
	/* e6e6 */ x"62",x"e0",x"22",x"39",x"30",                   --     mov [12345], A*2
	/* e6eb */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"54",x"01",x"0d",x"d0", --     jne [0x3039], 0x0154, $fail
	/* e6f5 */ x"62",x"3f",x"20",x"f6",                         --     mov [A*4 + -10], A
	/* e6f9 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"aa",x"00",x"0d",x"d0", --     jne [0x029e], 0x00aa, $fail
	/* e703 */ x"62",x"3f",x"e0",x"f6",x"39",x"30",             --     mov [A*4 + -10], 12345
	/* e709 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"39",x"30",x"0d",x"d0", --     jne [0x029e], 0x3039, $fail
	/* e713 */ x"62",x"2b",x"2b",                               --     mov [A*4 + B], A*4 + B
	/* e716 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"63",x"03",x"0d",x"d0", --     jne [0x0363], 0x0363, $fail
	/* e720 */ x"62",x"3f",x"2b",x"f6",                         --     mov [A*4 + -10], A*4 + B
	/* e724 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"63",x"03",x"0d",x"d0", --     jne [0x029e], 0x0363, $fail
	/* e72e */ x"62",x"22",x"20",                               --     mov [A*2], A
	/* e731 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"aa",x"00",x"0d",x"d0", --     jne [0x0154], 0x00aa, $fail
	/* e73b */ x"62",x"2b",x"1c",x"85",                         --     mov [A*4 + B], -123
	/* e73f */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"85",x"ff",x"0d",x"d0", --     jne [0x0363], 0xff85, $fail
	/* e749 */ x"62",x"e0",x"1c",x"39",x"30",x"85",             --     mov [12345], -123
	/* e74f */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"85",x"ff",x"0d",x"d0", --     jne [0x3039], 0xff85, $fail
	/* e759 */ x"62",x"e0",x"e0",x"39",x"30",x"39",x"30",       --     mov [12345], 12345
	/* e760 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"0d",x"d0", --     jne [0x3039], 0x3039, $fail
	/* e76a */ x"62",x"e0",x"e4",x"39",x"30",x"de",x"fa",       --     mov [12345], 0xFADE + A
	/* e771 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"88",x"fb",x"0d",x"d0", --     jne [0x3039], 0xfb88, $fail
	/* e77b */ x"e0",x"e4",x"de",x"fa",                         --     push 0xFADE + A
	/* e77f */ x"e4",x"80",                                     --     pop D
	/* e781 */ x"ec",x"80",x"e0",x"e0",x"88",x"fb",x"0d",x"d0", --     jne D, 0xfb88, $fail
	/* e789 */ x"e0",x"22",                                     --     push A*2
	/* e78b */ x"e4",x"80",                                     --     pop D
	/* e78d */ x"ec",x"80",x"e0",x"e0",x"54",x"01",x"0d",x"d0", --     jne D, 0x0154, $fail
	/* e795 */ x"e0",x"3f",x"f6",                               --     push A*4 + -10
	/* e798 */ x"e4",x"80",                                     --     pop D
	/* e79a */ x"ec",x"80",x"e0",x"e0",x"9e",x"02",x"0d",x"d0", --     jne D, 0x029e, $fail
	/* e7a2 */ x"e0",x"20",                                     --     push A
	/* e7a4 */ x"e4",x"80",                                     --     pop D
	/* e7a6 */ x"ec",x"80",x"e0",x"e0",x"aa",x"00",x"0d",x"d0", --     jne D, 0x00aa, $fail
	/* e7ae */ x"e0",x"2b",                                     --     push A*4 + B
	/* e7b0 */ x"e4",x"80",                                     --     pop D
	/* e7b2 */ x"ec",x"80",x"e0",x"e0",x"63",x"03",x"0d",x"d0", --     jne D, 0x0363, $fail
	/* e7ba */ x"e0",x"e0",x"39",x"30",                         --     push 12345
	/* e7be */ x"e4",x"80",                                     --     pop D
	/* e7c0 */ x"ec",x"80",x"e0",x"e0",x"39",x"30",x"0d",x"d0", --     jne D, 0x3039, $fail
	/* e7c8 */ x"e0",x"1c",x"85",                               --     push -123
	/* e7cb */ x"e4",x"80",                                     --     pop D
	/* e7cd */ x"ec",x"80",x"e0",x"e0",x"85",x"ff",x"0d",x"d0", --     jne D, 0xff85, $fail
	/* e7d5 */ x"5c",x"e0",x"e5",x"e7",                         --     call $_L_test_uop_get_arg_1
	/* e7d9 */ x"ec",x"60",x"e0",x"e0",x"fe",x"ad",x"0d",x"d0", --     jne C, 0xADFE, $fail
	/* e7e1 */ x"58",x"e0",x"ef",x"e7",                         --     jmp $_L_test_uop_get_arg_2
	/*      */                                                  -- _L_test_uop_get_arg_1:
	/* e7e5 */ x"60",x"60",x"e0",x"fe",x"ad",                   --     mov C, 0xADFE
	/* e7ea */ x"dc",                                           --     ret
	/* e7eb */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_uop_get_arg_2:
	/*      */                                                  --
	/*      */                                                  -- # BEGIN test_uop_rom.asm
	/*      */                                                  -- test_uop_alu_2dd:
	/* e7ef */ x"60",x"20",x"e0",x"cd",x"ab",                   --     mov A, 0xABCD
	/* e7f4 */ x"00",x"20",x"e0",x"ab",x"cd",                   --     add A, 0xCDAB # TEST
	/* e7f9 */ x"ec",x"20",x"e0",x"e0",x"78",x"79",x"0d",x"d0", --     jne A, 0x7978, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_2di:
	/* e801 */ x"60",x"20",x"e0",x"00",x"10",                   --     mov A, 0x1000
	/* e806 */ x"62",x"e0",x"e0",x"00",x"10",x"bc",x"0a",       --     mov [0x1000], 0x0ABC
	/* e80d */ x"01",x"20",x"20",                               --     add A, [A]  # TEST
	/* e810 */ x"ec",x"20",x"e0",x"e0",x"bc",x"1a",x"0d",x"d0", --     jne A, 0x1ABC, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_2id:
	/* e818 */ x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       --     mov [0x1000], 0x1234
	/* e81f */ x"02",x"e0",x"e0",x"00",x"10",x"21",x"43",       --     add [0x1000], 0x4321  # TEST
	/* e826 */ x"61",x"20",x"e0",x"00",x"10",                   --     mov A, [0x1000]
	/* e82b */ x"ec",x"20",x"e0",x"e0",x"55",x"55",x"0d",x"d0", --     jne A, 0x5555, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_2ii:
	/* e833 */ x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       --     mov [0x1000], 0x1234
	/* e83a */ x"62",x"e0",x"e0",x"05",x"10",x"aa",x"aa",       --     mov [0x1005], 0xAAAA
	/* e841 */ x"03",x"e0",x"e0",x"05",x"10",x"00",x"10",       --     add [0x1005], [0x1000]  # TEST
	/* e848 */ x"ee",x"e0",x"e0",x"e0",x"05",x"10",x"de",x"bc",x"0d",x"d0", --     jne [0x1005], 0xBCDE, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_3dd:
	/* e852 */ x"60",x"20",x"e0",x"fe",x"ab",                   --     mov A, 0xABFE
	/* e857 */ x"60",x"40",x"e0",x"55",x"55",                   --     mov B, 0x5555
	/* e85c */ x"80",x"60",x"20",x"40",                         --     add C, A, B # TEST
	/* e860 */ x"ec",x"20",x"e0",x"e0",x"fe",x"ab",x"0d",x"d0", --     jne A, 0xABFE, $fail
	/* e868 */ x"ec",x"40",x"e0",x"e0",x"55",x"55",x"0d",x"d0", --     jne B, 0x5555, $fail
	/* e870 */ x"ec",x"60",x"e0",x"e0",x"53",x"01",x"0d",x"d0", --     jne C, 0x0153, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_3di:
	/* e878 */ x"62",x"e0",x"e0",x"00",x"10",x"aa",x"12",       --     mov [0x1000], 0x12AA
	/* e87f */ x"60",x"40",x"e0",x"de",x"fa",                   --     mov B, 0xFADE
	/* e884 */ x"b5",x"20",x"e0",x"40",x"00",x"10",             --     xor A, [0x1000], B # TEST
	/* e88a */ x"ee",x"e0",x"e0",x"e0",x"00",x"10",x"aa",x"12",x"0d",x"d0", --     jne [0x1000], 0x12AA, $fail
	/* e894 */ x"ec",x"40",x"e0",x"e0",x"de",x"fa",x"0d",x"d0", --     jne B, 0xFADE, $fail
	/* e89c */ x"ec",x"20",x"e0",x"e0",x"74",x"e8",x"0d",x"d0", --     jne A, 0xE874, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_3id:
	/* e8a4 */ x"60",x"20",x"e0",x"fe",x"ab",                   --     mov A, 0xABFE
	/* e8a9 */ x"60",x"40",x"e0",x"55",x"55",                   --     mov B, 0x5555
	/* e8ae */ x"86",x"e0",x"20",x"40",x"00",x"10",             --     sub [0x1000], A, B # TEST
	/* e8b4 */ x"ec",x"20",x"e0",x"e0",x"fe",x"ab",x"0d",x"d0", --     jne A, 0xABFE, $fail
	/* e8bc */ x"ec",x"40",x"e0",x"e0",x"55",x"55",x"0d",x"d0", --     jne B, 0x5555, $fail
	/* e8c4 */ x"ee",x"e0",x"e0",x"e0",x"00",x"10",x"a9",x"56",x"0d",x"d0", --     jne [0x1000], 0x56A9, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_3ii:
	/* e8ce */ x"62",x"e0",x"e0",x"00",x"10",x"fe",x"ab",       --     mov [0x1000], 0xABFE
	/* e8d5 */ x"60",x"40",x"e0",x"55",x"55",                   --     mov B, 0x5555
	/* e8da */ x"af",x"e0",x"e0",x"40",x"02",x"10",x"00",x"10", --     and [0x1002], [0x1000], B # TEST
	/* e8e2 */ x"ee",x"e0",x"e0",x"e0",x"00",x"10",x"fe",x"ab",x"0d",x"d0", --     jne [0x1000], 0xABFE, $fail
	/* e8ec */ x"ec",x"40",x"e0",x"e0",x"55",x"55",x"0d",x"d0", --     jne B, 0x5555, $fail
	/* e8f4 */ x"ee",x"e0",x"e0",x"e0",x"02",x"10",x"54",x"01",x"0d",x"d0", --     jne [0x1002], 0x0154, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_1dx:
	/* e8fe */ x"60",x"20",x"e0",x"00",x"ff",                   --     mov A, 0xFF00
	/* e903 */ x"3c",x"20",                                     --     not A # TEST
	/* e905 */ x"ec",x"20",x"e0",x"e0",x"ff",x"00",x"0d",x"d0", --     jne A, 0x00FF, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_1ix:
	/* e90d */ x"62",x"1c",x"e0",x"64",x"34",x"12",             --     mov [100], 0x1234
	/* e913 */ x"3a",x"1c",x"64",                               --     neg [100] # TEST
	/* e916 */ x"ee",x"1c",x"e0",x"e0",x"64",x"cc",x"ed",x"0d",x"d0", --     jne [100], 0xEDCC, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_2dd:
	/* e91f */ x"60",x"40",x"e0",x"ff",x"00",                   --     mov B, 0x00FF
	/* e924 */ x"bc",x"20",x"40",                               --     not A, B # TEST
	/* e927 */ x"ec",x"40",x"e0",x"e0",x"ff",x"00",x"0d",x"d0", --     jne B, 0x00FF, $fail
	/* e92f */ x"ec",x"20",x"e0",x"e0",x"00",x"ff",x"0d",x"d0", --     jne A, 0xFF00, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_2di:
	/* e937 */ x"62",x"1c",x"e0",x"64",x"34",x"12",             --     mov [100], 0x1234
	/* e93d */ x"bd",x"20",x"1c",x"64",                         --     not A, [100]
	/* e941 */ x"ee",x"1c",x"e0",x"e0",x"64",x"34",x"12",x"0d",x"d0", --     jne [100], 0x1234, $fail
	/* e94a */ x"ec",x"20",x"e0",x"e0",x"cb",x"ed",x"0d",x"d0", --     jne A, 0xEDCB, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_2id:
	/* e952 */ x"60",x"40",x"e0",x"ff",x"00",                   --     mov B, 0x00FF
	/* e957 */ x"be",x"1c",x"40",x"64",                         --     not [100], B # TEST
	/* e95b */ x"ec",x"40",x"e0",x"e0",x"ff",x"00",x"0d",x"d0", --     jne B, 0x00FF, $fail
	/* e963 */ x"ee",x"1c",x"e0",x"e0",x"64",x"00",x"ff",x"0d",x"d0", --     jne [100], 0xFF00, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_2ii:
	/* e96c */ x"62",x"1c",x"e0",x"66",x"ff",x"00",             --     mov [102], 0x00FF
	/* e972 */ x"bf",x"1c",x"1c",x"64",x"66",                   --     not [100], [102] # TEST
	/* e977 */ x"ee",x"1c",x"e0",x"e0",x"66",x"ff",x"00",x"0d",x"d0", --     jne [102], 0x00FF, $fail
	/* e980 */ x"ee",x"1c",x"e0",x"e0",x"64",x"00",x"ff",x"0d",x"d0", --     jne [100], 0xFF00, $fail
	/*      */                                                  --
	/*      */                                                  -- # GE GT LE LT NE EQ
	/*      */                                                  -- test_uop_cmp_dd:
	/* e989 */ x"60",x"40",x"1c",x"7b",                         --     mov B, 123
	/* e98d */ x"50",x"40",x"e0",x"c8",x"01",                   --     cmp B, 456 # TEST
	/* e992 */ x"4c",x"20",                                     --     getf A
	/* e994 */ x"ec",x"40",x"1c",x"e0",x"7b",x"0d",x"d0",       --     jne B, 123, $fail
	/* e99b */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_cmp_di:
	/* e9a2 */ x"62",x"1c",x"1c",x"64",x"85",                   --     mov [100], -123
	/* e9a7 */ x"60",x"40",x"e0",x"c8",x"01",                   --     mov B, 456
	/* e9ac */ x"d1",x"40",x"1c",x"64",                         --     icmp B, [100] # TEST
	/* e9b0 */ x"4c",x"20",                                     --     getf A
	/* e9b2 */ x"ec",x"40",x"e0",x"e0",x"c8",x"01",x"0d",x"d0", --     jne B, 456, $fail
	/* e9ba */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_cmp_id:
	/* e9c1 */ x"62",x"1c",x"1c",x"64",x"85",                   --     mov [100], -123
	/* e9c6 */ x"60",x"40",x"e0",x"c8",x"01",                   --     mov B, 456
	/* e9cb */ x"d2",x"1c",x"40",x"64",                         --     icmp [100], B # TEST
	/* e9cf */ x"4c",x"20",                                     --     getf A
	/* e9d1 */ x"ec",x"40",x"e0",x"e0",x"c8",x"01",x"0d",x"d0", --     jne B, 456, $fail
	/* e9d9 */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_cmp_ii:
	/* e9e0 */ x"62",x"1c",x"1c",x"64",x"85",                   --     mov [100], -123
	/* e9e5 */ x"62",x"1c",x"e0",x"66",x"38",x"fe",             --     mov [102], -456
	/* e9eb */ x"d3",x"1c",x"1c",x"64",x"66",                   --     icmp [100], [102]  # TEST
	/* e9f0 */ x"4c",x"20",                                     --     getf A
	/* e9f2 */ x"ee",x"1c",x"1c",x"e0",x"64",x"85",x"0d",x"d0", --     jne [100], -123, $fail
	/* e9fa */ x"ee",x"1c",x"e0",x"e0",x"66",x"38",x"fe",x"0d",x"d0", --     jne [102], -456, $fail
	/* ea03 */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_d:
	/* ea0a */ x"60",x"20",x"e0",x"15",x"ea",                   --     mov A, $_L_test_uop_jmp_d_okay
	/* ea0f */ x"58",x"20",                                     --     jmp A  # TEST
	/* ea11 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _L_test_uop_jmp_d_okay:
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_i:
	/* ea15 */ x"62",x"1c",x"e0",x"64",x"22",x"ea",             --     mov [100], $_L_test_uop_jmp_i_okay
	/* ea1b */ x"5a",x"1c",x"64",                               --     jmp [100]  # TEST
	/* ea1e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _L_test_uop_jmp_i_okay:
	/* ea22 */ x"ee",x"1c",x"e0",x"e0",x"64",x"22",x"ea",x"0d",x"d0", --     jne [100], $_L_test_uop_jmp_i_okay, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_cond_i:
	/* ea2b */ x"62",x"1c",x"e0",x"64",x"41",x"ea",             --     mov [100], $_L_test_uop_jmp_cond_i_okay
	/* ea31 */ x"50",x"1c",x"1c",x"01",x"02",                   --     cmp 1, 2
	/* ea36 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* ea3a */ x"6e",x"1c",x"64",                               --     jne [100]  # TEST
	/* ea3d */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _L_test_uop_jmp_cond_i_okay:
	/* ea41 */ x"ee",x"1c",x"e0",x"e0",x"64",x"41",x"ea",x"0d",x"d0", --     jne [100], $_L_test_uop_jmp_cond_i_okay, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_cond_d:
	/* ea4a */ x"60",x"20",x"e0",x"5e",x"ea",                   --     mov A, $_L_test_uop_jmp_cond_d_okay
	/* ea4f */ x"50",x"1c",x"1c",x"01",x"01",                   --     cmp 1, 1
	/* ea54 */ x"6c",x"e0",x"0d",x"d0",                         --     jne $fail
	/* ea58 */ x"68",x"20",                                     --     jeq A  # TEST
	/* ea5a */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _L_test_uop_jmp_cond_d_okay:
	/* ea5e */ x"ec",x"20",x"e0",x"e0",x"5e",x"ea",x"0d",x"d0", --     jne A, $_L_test_uop_jmp_cond_d_okay, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_3dd:
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_3di:
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_3id:
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_3ii:
	/*      */                                                  --
	/*      */                                                  -- test_uop_mov_dd:
	/*      */                                                  --
	/*      */                                                  -- test_uop_mov_di:
	/*      */                                                  --
	/*      */                                                  -- test_uop_mov_id:
	/*      */                                                  --
	/*      */                                                  -- test_uop_mov_ii:
	/*      */                                                  --
	/*      */                                                  -- test_uop_halt:
	/*      */                                                  --
	/*      */                                                  -- test_uop_getf:
	/*      */                                                  --
	/*      */                                                  -- test_uop_setf:
	/*      */                                                  --
	/*      */                                                  -- test_uop_call_d:
	/*      */                                                  --
	/*      */                                                  -- test_uop_call_i:
	/*      */                                                  --
	/*      */                                                  -- test_uop_ret:
	/*      */                                                  --
	/*      */                                                  -- test_uop_push_d:
	/*      */                                                  --
	/*      */                                                  -- test_uop_push_i:
	/*      */                                                  --
	/*      */                                                  -- test_uop_pop_d:
	/*      */                                                  --
	/*      */                                                  -- test_uop_pop_i:
	/*      */                                                  --
	/*      */                                                  -- test_uop_mmap:
	/*      */                                                  --
	/*      */                                                  -- test_uop_umap:
	/*      */                                                  -- # END test_uop_rom.asm
	/*      */                                                  --
	/*      */                                                  --
	/*      */                                                  -- # BEGIN test_call_ret.asm
	/*      */                                                  -- test_call_ret:
	/*      */                                                  --
	/* ea66 */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* ea6b */ x"5c",x"e0",x"e2",x"ea",                         --     call $fn_test_target
	/* ea6f */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*      */                                                  --
	/* ea77 */ x"60",x"20",x"1c",x"0a",                         --     mov A, 10
	/* ea7b */ x"60",x"40",x"00",                               --     mov B, 0
	/* ea7e */ x"60",x"60",x"00",                               --     mov C, 0
	/* ea81 */ x"60",x"80",x"00",                               --     mov D, 0
	/* ea84 */ x"5c",x"e0",x"b1",x"ea",                         --     call $fn_recursive
	/*      */                                                  --
	/* ea88 */ x"ec",x"20",x"00",x"e0",x"0d",x"d0",             --     jne A, 0, $fail
	/* ea8e */ x"ec",x"40",x"e0",x"e0",x"3f",x"cf",x"0d",x"d0", --     jne B, 0xcf3f, $fail
	/* ea96 */ x"ec",x"60",x"1c",x"e0",x"2d",x"0d",x"d0",       --     jne C, 0x002d, $fail
	/* ea9d */ x"ec",x"80",x"e0",x"e0",x"97",x"45",x"0d",x"d0", --     jne D, 0x4597, $fail
	/* eaa5 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*      */                                                  --
	/* eaad */ x"58",x"e0",x"ef",x"ea",                         --     jmp $test_call_ret_end
	/*      */                                                  --
	/*      */                                                  -- fn_recursive:
	/* eab1 */ x"04",x"20",x"1c",x"01",                         --     sub A, 1
	/* eab5 */ x"5c",x"e0",x"da",x"ea",                         --     call $fn_process_c
	/* eab9 */ x"e8",x"20",x"00",x"e0",x"d5",x"ea",             --     jeq A, 0, $fn_recursive_end
	/* eabf */ x"5c",x"e0",x"b1",x"ea",                         --     call $fn_recursive
	/* eac3 */ x"00",x"80",x"60",                               --     add D, C
	/* eac6 */ x"08",x"80",x"1c",x"03",                         --     mul D, 3
	/* eaca */ x"00",x"40",x"80",                               --     add B, D
	/* eacd */ x"e0",x"80",                                     --     push D
	/* eacf */ x"08",x"40",x"1c",x"05",                         --     mul B, 5
	/* ead3 */ x"e4",x"80",                                     --     pop D
	/*      */                                                  -- fn_recursive_end:
	/* ead5 */ x"dc",                                           --     ret
	/* ead6 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --
	/*      */                                                  -- fn_process_c:
	/* eada */ x"00",x"60",x"20",                               --     add C, A
	/* eadd */ x"dc",                                           --     ret
	/* eade */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --
	/*      */                                                  -- fn_test_target:
	/* eae2 */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0x0ffe, $fail
	/* eaea */ x"dc",                                           --     ret
	/* eaeb */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --
	/*      */                                                  -- test_call_ret_end:
	/*      */                                                  -- # END test_call_ret.asm
	/*      */                                                  --
	/*      */                                                  --
	/*      */                                                  -- # BEGIN test_mem_access.asm
	/*      */                                                  -- test_mem_access:
	/* eaef */ x"62",x"e0",x"e0",x"00",x"01",x"ed",x"ff",       --     mov [0x100], 0xFFED
	/* eaf6 */ x"ee",x"e0",x"e0",x"e0",x"00",x"01",x"aa",x"00",x"04",x"eb", --     jne [0x100], 0x00AA, $test_mem_access_check_jmp
	/* eb00 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- test_mem_access_check_jmp:
	/*      */                                                  --
	/* eb04 */ x"62",x"e0",x"00",x"00",x"10",                   --     mov [0x1000], 0
	/* eb09 */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* eb0e */ x"ee",x"a0",x"00",x"e0",x"0d",x"d0",             --     jne [SP], 0, $fail
	/* eb14 */ x"e0",x"00",                                     --     push 0
	/* eb16 */ x"e0",x"00",                                     --     push 0
	/* eb18 */ x"e0",x"00",                                     --     push 0
	/* eb1a */ x"e4",x"20",                                     --     pop A
	/* eb1c */ x"e4",x"20",                                     --     pop A
	/* eb1e */ x"e4",x"20",                                     --     pop A
	/* eb20 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/* eb28 */ x"ec",x"20",x"00",x"e0",x"0d",x"d0",             --     jne A, 0, $fail
	/*      */                                                  --
	/* eb2e */ x"e0",x"e0",x"02",x"01",                         --     push 0x0102
	/* eb32 */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0xFFE, $fail
	/* eb3a */ x"e0",x"e0",x"04",x"03",                         --     push 0x0304
	/* eb3e */ x"ec",x"a0",x"e0",x"e0",x"fc",x"0f",x"0d",x"d0", --     jne SP, 0xFFC, $fail
	/*      */                                                  --
	/* eb46 */ x"ee",x"e0",x"e0",x"e0",x"fe",x"0f",x"02",x"01",x"0d",x"d0", --     jne [0xFFE], 0x0102, $fail
	/* eb50 */ x"ee",x"e0",x"e0",x"e0",x"fc",x"0f",x"04",x"03",x"0d",x"d0", --     jne [0xFFC], 0x0304, $fail
	/*      */                                                  --
	/*      */                                                  --     # unaligned
	/* eb5a */ x"ee",x"e0",x"e0",x"e0",x"fb",x"0f",x"00",x"04",x"0d",x"d0", --     jne [0xFFB], 0x0400, $fail
	/* eb64 */ x"ee",x"e0",x"e0",x"e0",x"fd",x"0f",x"03",x"02",x"0d",x"d0", --     jne [0xFFD], 0x0203, $fail
	/* eb6e */ x"ee",x"e0",x"1c",x"e0",x"ff",x"0f",x"01",x"0d",x"d0", --     jne [0xFFF], 0x0001, $fail
	/*      */                                                  --
	/* eb77 */ x"e4",x"20",                                     --     pop A
	/* eb79 */ x"ec",x"20",x"e0",x"e0",x"04",x"03",x"0d",x"d0", --     jne A, 0x0304, $fail
	/* eb81 */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0xFFE, $fail
	/* eb89 */ x"e4",x"20",                                     --     pop A
	/* eb8b */ x"ec",x"20",x"e0",x"e0",x"02",x"01",x"0d",x"d0", --     jne A, 0x0102, $fail
	/* eb93 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*      */                                                  --
	/*      */                                                  -- # END test_mem_access.asm
	/*      */                                                  --
	/*      */                                                  --
	/*      */                                                  -- # BEGIN test_cmp.asm
	/*      */                                                  -- test_cmp:
	/* eb9b */ x"cc",x"e0",x"ff",x"ff",                         --     setf 0xFFFF
	/* eb9f */ x"4c",x"20",                                     --     getf A
	/* eba1 */ x"ec",x"20",x"1c",x"e0",x"3f",x"0d",x"d0",       --     jne A, 0x3F, $fail
	/*      */                                                  --
	/* eba8 */ x"cc",x"e0",x"ab",x"ab",                         --     setf 0xABAB
	/* ebac */ x"4c",x"20",                                     --     getf A
	/* ebae */ x"ec",x"20",x"1c",x"e0",x"2b",x"0d",x"d0",       --     jne A, 0x2B, $fail
	/*      */                                                  --
	/*      */                                                  --     # unsigned
	/* ebb5 */ x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             --     cmp 0xFFAB, 0x2B
	/* ebbb */ x"4c",x"20",                                     --     getf A
	/*      */                                                  --     # GE GT LE LT NE EQ
	/* ebbd */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*      */                                                  --
	/* ebc4 */ x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             --     cmp 0x2B, 0xFFAB
	/* ebca */ x"4c",x"20",                                     --     getf A
	/* ebcc */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*      */                                                  --
	/* ebd3 */ x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     cmp 0xFFAB, 0xFFAB
	/* ebda */ x"4c",x"20",                                     --     getf A
	/* ebdc */ x"ec",x"20",x"1c",x"e0",x"29",x"0d",x"d0",       --     jne A, 0b101001, $fail
	/*      */                                                  --
	/*      */                                                  --     # signed
	/* ebe3 */ x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             --     icmp 0xFFAB, 0x2B
	/* ebe9 */ x"4c",x"20",                                     --     getf A
	/*      */                                                  --     # GE GT LE LT NE EQ
	/* ebeb */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*      */                                                  --
	/* ebf2 */ x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             --     icmp 0x2B, 0xFFAB
	/* ebf8 */ x"4c",x"20",                                     --     getf A
	/* ebfa */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*      */                                                  --
	/* ec01 */ x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     icmp 0xFFAB, 0xFFAB
	/* ec08 */ x"4c",x"20",                                     --     getf A
	/* ec0a */ x"ec",x"20",x"1c",x"e0",x"29",x"0d",x"d0",       --     jne A, 0b101001, $fail
	/*      */                                                  -- # END test_cmp.asm
	/*      */                                                  --
	/*      */                                                  -- end_of_test:
	/* ec11 */ x"60",x"20",x"e0",x"ad",x"de",                   --     mov A, 0xDEAD
	/* ec16 */ x"60",x"40",x"e0",x"ef",x"be",                   --     mov B, 0xBEEF
	/* ec1b */ x"88",x"60",x"20",x"40",                         --     mul C, A, B
	/* ec1f */ x"58",x"e0",x"12",x"d0",                         --     jmp $success
	/*      */                                                  --
	/* ec23 */ x"d8"                                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
