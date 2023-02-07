
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is
-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 1931;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*   0 */                                                  -- .offset 0xD000
	/*   0 */                                                  -- .boot:
	/*   0 */ x"60",x"20",x"e0",x"fa",x"ff",                   --     mov A, 0xFFFA
	/*   5 */ x"ec",x"20",x"1c",x"e0",x"fa",x"22",x"d0",       --     jne A, 0x00FA, $start_test
	/*   c */                                                  -- fail:
	/*   c */                                                  --     # register A contains failed test
	/*   c */ x"d8",                                           --     halt
	/*   d */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/*  11 */                                                  -- success:
	/*  11 */ x"60",x"20",x"1c",x"ab",                         --     mov A, 0xAB
	/*  15 */ x"60",x"40",x"1c",x"cd",                         --     mov B, 0xCD
	/*  19 */ x"60",x"60",x"1c",x"ef",                         --     mov C, 0xEF
	/*  1d */ x"60",x"80",x"1c",x"55",                         --     mov D, 0x55
	/*  21 */ x"d8",                                           --     halt
	/*  22 */                                                  -- start_test:
	/*  22 */                                                  -- alu_test:
	/*  22 */                                                  --      # t=True, a=d230, b=a012
	/*  22 */ x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     add B, 0xd230, 0xa012
	/*  2a */ x"ec",x"40",x"e0",x"e0",x"42",x"72",x"0c",x"d0", --     jne B, 0x7242, $fail
	/*  32 */                                                  --
	/*  32 */ x"84",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     sub B, 0xd230, 0xa012
	/*  3a */ x"ec",x"40",x"e0",x"e0",x"1e",x"32",x"0c",x"d0", --     jne B, 0x321e, $fail
	/*  42 */                                                  --
	/*  42 */ x"88",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     mul B, 0xd230, 0xa012
	/*  4a */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0c",x"d0", --     jne B, 0xc760, $fail
	/*  52 */ x"ec",x"80",x"e0",x"e0",x"6c",x"83",x"0c",x"d0", --     jne D, 0x836c, $fail
	/*  5a */                                                  --
	/*  5a */ x"8c",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     imul B, 0xd230, 0xa012
	/*  62 */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0c",x"d0", --     jne B, 0xc760, $fail
	/*  6a */ x"ec",x"80",x"e0",x"e0",x"2a",x"11",x"0c",x"d0", --     jne D, 0x112a, $fail
	/*  72 */                                                  --
	/*  72 */ x"a0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shr B, 0xd230, 0xa012
	/*  7a */ x"ec",x"40",x"e0",x"e0",x"8c",x"34",x"0c",x"d0", --     jne B, 0x348c, $fail
	/*  82 */                                                  --
	/*  82 */ x"a4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     ishr B, 0xd230, 0xa012
	/*  8a */ x"ec",x"40",x"e0",x"e0",x"8c",x"f4",x"0c",x"d0", --     jne B, 0xf48c, $fail
	/*  92 */                                                  --
	/*  92 */ x"a8",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shl B, 0xd230, 0xa012
	/*  9a */ x"ec",x"40",x"e0",x"e0",x"c0",x"48",x"0c",x"d0", --     jne B, 0x48c0, $fail
	/*  a2 */                                                  --
	/*  a2 */ x"ac",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     and B, 0xd230, 0xa012
	/*  aa */ x"ec",x"40",x"e0",x"e0",x"10",x"80",x"0c",x"d0", --     jne B, 0x8010, $fail
	/*  b2 */                                                  --
	/*  b2 */ x"b0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     or B, 0xd230, 0xa012
	/*  ba */ x"ec",x"40",x"e0",x"e0",x"32",x"f2",x"0c",x"d0", --     jne B, 0xf232, $fail
	/*  c2 */                                                  --
	/*  c2 */ x"b4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     xor B, 0xd230, 0xa012
	/*  ca */ x"ec",x"40",x"e0",x"e0",x"22",x"72",x"0c",x"d0", --     jne B, 0x7222, $fail
	/*  d2 */                                                  --
	/*  d2 */ x"b8",x"40",x"e0",x"30",x"d2",                   --     neg B, 0xd230
	/*  d7 */ x"ec",x"40",x"e0",x"e0",x"d0",x"2d",x"0c",x"d0", --     jne B, 0x2dd0, $fail
	/*  df */                                                  --
	/*  df */ x"bc",x"40",x"e0",x"30",x"d2",                   --     not B, 0xd230
	/*  e4 */ x"ec",x"40",x"e0",x"e0",x"cf",x"2d",x"0c",x"d0", --     jne B, 0x2dcf, $fail
	/*  ec */                                                  --
	/*  ec */ x"c0",x"40",x"e0",x"30",x"d2",                   --     bool B, 0xd230
	/*  f1 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/*  f8 */                                                  --
	/*  f8 */ x"c4",x"40",x"e0",x"30",x"d2",                   --     inc B, 0xd230
	/*  fd */ x"ec",x"40",x"e0",x"e0",x"31",x"d2",x"0c",x"d0", --     jne B, 0xd231, $fail
	/* 105 */                                                  --
	/* 105 */ x"c8",x"40",x"e0",x"30",x"d2",                   --     dec B, 0xd230
	/* 10a */ x"ec",x"40",x"e0",x"e0",x"2f",x"d2",x"0c",x"d0", --     jne B, 0xd22f, $fail
	/* 112 */                                                  --
	/* 112 */                                                  --      # t=True, a=00ad, b=da37
	/* 112 */ x"80",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     add B, 0x00ad, 0xda37
	/* 119 */ x"ec",x"40",x"e0",x"e0",x"e4",x"da",x"0c",x"d0", --     jne B, 0xdae4, $fail
	/* 121 */                                                  --
	/* 121 */ x"84",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     sub B, 0x00ad, 0xda37
	/* 128 */ x"ec",x"40",x"e0",x"e0",x"76",x"26",x"0c",x"d0", --     jne B, 0x2676, $fail
	/* 130 */                                                  --
	/* 130 */ x"88",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     mul B, 0x00ad, 0xda37
	/* 137 */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0c",x"d0", --     jne B, 0x772b, $fail
	/* 13f */ x"ec",x"80",x"1c",x"e0",x"93",x"0c",x"d0",       --     jne D, 0x0093, $fail
	/* 146 */                                                  --
	/* 146 */ x"8c",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     imul B, 0x00ad, 0xda37
	/* 14d */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0c",x"d0", --     jne B, 0x772b, $fail
	/* 155 */ x"ec",x"80",x"e0",x"e0",x"e6",x"ff",x"0c",x"d0", --     jne D, 0xffe6, $fail
	/* 15d */                                                  --
	/* 15d */ x"a0",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     shr B, 0x00ad, 0xda37
	/* 164 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 16b */                                                  --
	/* 16b */ x"a4",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     ishr B, 0x00ad, 0xda37
	/* 172 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 179 */                                                  --
	/* 179 */ x"a8",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     shl B, 0x00ad, 0xda37
	/* 180 */ x"ec",x"40",x"e0",x"e0",x"80",x"56",x"0c",x"d0", --     jne B, 0x5680, $fail
	/* 188 */                                                  --
	/* 188 */ x"ac",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     and B, 0x00ad, 0xda37
	/* 18f */ x"ec",x"40",x"1c",x"e0",x"25",x"0c",x"d0",       --     jne B, 0x0025, $fail
	/* 196 */                                                  --
	/* 196 */ x"b0",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     or B, 0x00ad, 0xda37
	/* 19d */ x"ec",x"40",x"e0",x"e0",x"bf",x"da",x"0c",x"d0", --     jne B, 0xdabf, $fail
	/* 1a5 */                                                  --
	/* 1a5 */ x"b4",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     xor B, 0x00ad, 0xda37
	/* 1ac */ x"ec",x"40",x"e0",x"e0",x"9a",x"da",x"0c",x"d0", --     jne B, 0xda9a, $fail
	/* 1b4 */                                                  --
	/* 1b4 */ x"b8",x"40",x"1c",x"ad",                         --     neg B, 0x00ad
	/* 1b8 */ x"ec",x"40",x"e0",x"e0",x"53",x"ff",x"0c",x"d0", --     jne B, 0xff53, $fail
	/* 1c0 */                                                  --
	/* 1c0 */ x"bc",x"40",x"1c",x"ad",                         --     not B, 0x00ad
	/* 1c4 */ x"ec",x"40",x"e0",x"e0",x"52",x"ff",x"0c",x"d0", --     jne B, 0xff52, $fail
	/* 1cc */                                                  --
	/* 1cc */ x"c0",x"40",x"1c",x"ad",                         --     bool B, 0x00ad
	/* 1d0 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 1d7 */                                                  --
	/* 1d7 */ x"c4",x"40",x"1c",x"ad",                         --     inc B, 0x00ad
	/* 1db */ x"ec",x"40",x"1c",x"e0",x"ae",x"0c",x"d0",       --     jne B, 0x00ae, $fail
	/* 1e2 */                                                  --
	/* 1e2 */ x"c8",x"40",x"1c",x"ad",                         --     dec B, 0x00ad
	/* 1e6 */ x"ec",x"40",x"1c",x"e0",x"ac",x"0c",x"d0",       --     jne B, 0x00ac, $fail
	/* 1ed */                                                  --
	/* 1ed */                                                  --      # t=False, a=f0ad, b=2a3f
	/* 1ed */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 1f2 */ x"00",x"40",x"e0",x"3f",x"2a",                   --     add B, 0x2a3f
	/* 1f7 */ x"ec",x"40",x"e0",x"e0",x"ec",x"1a",x"0c",x"d0", --     jne B, 0x1aec, $fail
	/* 1ff */                                                  --
	/* 1ff */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 204 */ x"04",x"40",x"e0",x"3f",x"2a",                   --     sub B, 0x2a3f
	/* 209 */ x"ec",x"40",x"e0",x"e0",x"6e",x"c6",x"0c",x"d0", --     jne B, 0xc66e, $fail
	/* 211 */                                                  --
	/* 211 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 216 */ x"08",x"40",x"e0",x"3f",x"2a",                   --     mul B, 0x2a3f
	/* 21b */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0c",x"d0", --     jne B, 0x9c93, $fail
	/* 223 */ x"ec",x"80",x"e0",x"e0",x"b7",x"27",x"0c",x"d0", --     jne D, 0x27b7, $fail
	/* 22b */                                                  --
	/* 22b */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 230 */ x"0c",x"40",x"e0",x"3f",x"2a",                   --     imul B, 0x2a3f
	/* 235 */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0c",x"d0", --     jne B, 0x9c93, $fail
	/* 23d */ x"ec",x"80",x"e0",x"e0",x"78",x"fd",x"0c",x"d0", --     jne D, 0xfd78, $fail
	/* 245 */                                                  --
	/* 245 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 24a */ x"20",x"40",x"e0",x"3f",x"2a",                   --     shr B, 0x2a3f
	/* 24f */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 256 */                                                  --
	/* 256 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 25b */ x"24",x"40",x"e0",x"3f",x"2a",                   --     ishr B, 0x2a3f
	/* 260 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0c",x"d0", --     jne B, 0xffff, $fail
	/* 268 */                                                  --
	/* 268 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 26d */ x"28",x"40",x"e0",x"3f",x"2a",                   --     shl B, 0x2a3f
	/* 272 */ x"ec",x"40",x"e0",x"e0",x"00",x"80",x"0c",x"d0", --     jne B, 0x8000, $fail
	/* 27a */                                                  --
	/* 27a */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 27f */ x"2c",x"40",x"e0",x"3f",x"2a",                   --     and B, 0x2a3f
	/* 284 */ x"ec",x"40",x"e0",x"e0",x"2d",x"20",x"0c",x"d0", --     jne B, 0x202d, $fail
	/* 28c */                                                  --
	/* 28c */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 291 */ x"30",x"40",x"e0",x"3f",x"2a",                   --     or B, 0x2a3f
	/* 296 */ x"ec",x"40",x"e0",x"e0",x"bf",x"fa",x"0c",x"d0", --     jne B, 0xfabf, $fail
	/* 29e */                                                  --
	/* 29e */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2a3 */ x"34",x"40",x"e0",x"3f",x"2a",                   --     xor B, 0x2a3f
	/* 2a8 */ x"ec",x"40",x"e0",x"e0",x"92",x"da",x"0c",x"d0", --     jne B, 0xda92, $fail
	/* 2b0 */                                                  --
	/* 2b0 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2b5 */ x"38",x"40",                                     --     neg B
	/* 2b7 */ x"ec",x"40",x"e0",x"e0",x"53",x"0f",x"0c",x"d0", --     jne B, 0x0f53, $fail
	/* 2bf */                                                  --
	/* 2bf */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2c4 */ x"3c",x"40",                                     --     not B
	/* 2c6 */ x"ec",x"40",x"e0",x"e0",x"52",x"0f",x"0c",x"d0", --     jne B, 0x0f52, $fail
	/* 2ce */                                                  --
	/* 2ce */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2d3 */ x"40",x"40",                                     --     bool B
	/* 2d5 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 2dc */                                                  --
	/* 2dc */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2e1 */ x"44",x"40",                                     --     inc B
	/* 2e3 */ x"ec",x"40",x"e0",x"e0",x"ae",x"f0",x"0c",x"d0", --     jne B, 0xf0ae, $fail
	/* 2eb */                                                  --
	/* 2eb */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2f0 */ x"48",x"40",                                     --     dec B
	/* 2f2 */ x"ec",x"40",x"e0",x"e0",x"ac",x"f0",x"0c",x"d0", --     jne B, 0xf0ac, $fail
	/* 2fa */                                                  --
	/* 2fa */                                                  --      # t=False, a=0000, b=dead
	/* 2fa */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 2fe */ x"00",x"40",x"e0",x"ad",x"de",                   --     add B, 0xdead
	/* 303 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0c",x"d0", --     jne B, 0xdead, $fail
	/* 30b */                                                  --
	/* 30b */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 30f */ x"04",x"40",x"e0",x"ad",x"de",                   --     sub B, 0xdead
	/* 314 */ x"ec",x"40",x"e0",x"e0",x"53",x"21",x"0c",x"d0", --     jne B, 0x2153, $fail
	/* 31c */                                                  --
	/* 31c */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 320 */ x"08",x"40",x"e0",x"ad",x"de",                   --     mul B, 0xdead
	/* 325 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 32c */ x"ec",x"80",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne D, 0x0000, $fail
	/* 333 */                                                  --
	/* 333 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 337 */ x"0c",x"40",x"e0",x"ad",x"de",                   --     imul B, 0xdead
	/* 33c */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 343 */ x"ec",x"80",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne D, 0x0000, $fail
	/* 34a */                                                  --
	/* 34a */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 34e */ x"20",x"40",x"e0",x"ad",x"de",                   --     shr B, 0xdead
	/* 353 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 35a */                                                  --
	/* 35a */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 35e */ x"24",x"40",x"e0",x"ad",x"de",                   --     ishr B, 0xdead
	/* 363 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 36a */                                                  --
	/* 36a */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 36e */ x"28",x"40",x"e0",x"ad",x"de",                   --     shl B, 0xdead
	/* 373 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 37a */                                                  --
	/* 37a */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 37e */ x"2c",x"40",x"e0",x"ad",x"de",                   --     and B, 0xdead
	/* 383 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 38a */                                                  --
	/* 38a */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 38e */ x"30",x"40",x"e0",x"ad",x"de",                   --     or B, 0xdead
	/* 393 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0c",x"d0", --     jne B, 0xdead, $fail
	/* 39b */                                                  --
	/* 39b */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 39f */ x"34",x"40",x"e0",x"ad",x"de",                   --     xor B, 0xdead
	/* 3a4 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0c",x"d0", --     jne B, 0xdead, $fail
	/* 3ac */                                                  --
	/* 3ac */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3b0 */ x"38",x"40",                                     --     neg B
	/* 3b2 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 3b9 */                                                  --
	/* 3b9 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3bd */ x"3c",x"40",                                     --     not B
	/* 3bf */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0c",x"d0", --     jne B, 0xffff, $fail
	/* 3c7 */                                                  --
	/* 3c7 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3cb */ x"40",x"40",                                     --     bool B
	/* 3cd */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 3d4 */                                                  --
	/* 3d4 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3d8 */ x"44",x"40",                                     --     inc B
	/* 3da */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 3e1 */                                                  --
	/* 3e1 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3e5 */ x"48",x"40",                                     --     dec B
	/* 3e7 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0c",x"d0", --     jne B, 0xffff, $fail
	/* 3ef */                                                  --
	/* 3ef */                                                  -- jmp_test:
	/* 3ef */ x"e8",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0c",x"d0", --     jeq 0xffab, 0x002b, $fail
	/* 3f8 */ x"ec",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"05",x"d4", --     jne 0xffab, 0x002b, $_L_test_jmp_1
	/* 401 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 405 */                                                  -- _L_test_jmp_1:
	/* 405 */ x"f0",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0c",x"d0", --     jlt 0xffab, 0x002b, $fail
	/* 40e */ x"f4",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0c",x"d0", --     jle 0xffab, 0x002b, $fail
	/* 417 */ x"f8",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"24",x"d4", --     jgt 0xffab, 0x002b, $_L_test_jmp_2
	/* 420 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 424 */                                                  -- _L_test_jmp_2:
	/* 424 */ x"fc",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"31",x"d4", --     jge 0xffab, 0x002b, $_L_test_jmp_3
	/* 42d */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 431 */                                                  -- _L_test_jmp_3:
	/* 431 */ x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             --     cmp 0xffab, 0x002b
	/* 437 */ x"68",x"e0",x"0c",x"d0",                         --     jeq $fail
	/* 43b */ x"6c",x"e0",x"43",x"d4",                         --     jne $_L_test_jmp_4
	/* 43f */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 443 */                                                  -- _L_test_jmp_4:
	/* 443 */ x"70",x"e0",x"0c",x"d0",                         --     jlt $fail
	/* 447 */ x"74",x"e0",x"0c",x"d0",                         --     jle $fail
	/* 44b */ x"78",x"e0",x"53",x"d4",                         --     jgt $_L_test_jmp_5
	/* 44f */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 453 */                                                  -- _L_test_jmp_5:
	/* 453 */ x"7c",x"e0",x"5b",x"d4",                         --     jge $_L_test_jmp_6
	/* 457 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 45b */                                                  -- _L_test_jmp_6:
	/* 45b */ x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             --     icmp 0xffab, 0x002b
	/* 461 */ x"68",x"e0",x"0c",x"d0",                         --     jeq $fail
	/* 465 */ x"6c",x"e0",x"6d",x"d4",                         --     jne $_L_test_jmp_7
	/* 469 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 46d */                                                  -- _L_test_jmp_7:
	/* 46d */ x"70",x"e0",x"75",x"d4",                         --     jlt $_L_test_jmp_8
	/* 471 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 475 */                                                  -- _L_test_jmp_8:
	/* 475 */ x"74",x"e0",x"7d",x"d4",                         --     jle $_L_test_jmp_9
	/* 479 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 47d */                                                  -- _L_test_jmp_9:
	/* 47d */ x"78",x"e0",x"0c",x"d0",                         --     jgt $fail
	/* 481 */ x"7c",x"e0",x"0c",x"d0",                         --     jge $fail
	/* 485 */ x"e8",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0c",x"d0", --     jeq 0x002b, 0xffab, $fail
	/* 48e */ x"ec",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"9b",x"d4", --     jne 0x002b, 0xffab, $_L_test_jmp_10
	/* 497 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 49b */                                                  -- _L_test_jmp_10:
	/* 49b */ x"f0",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"a8",x"d4", --     jlt 0x002b, 0xffab, $_L_test_jmp_11
	/* 4a4 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 4a8 */                                                  -- _L_test_jmp_11:
	/* 4a8 */ x"f4",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"b5",x"d4", --     jle 0x002b, 0xffab, $_L_test_jmp_12
	/* 4b1 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 4b5 */                                                  -- _L_test_jmp_12:
	/* 4b5 */ x"f8",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0c",x"d0", --     jgt 0x002b, 0xffab, $fail
	/* 4be */ x"fc",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0c",x"d0", --     jge 0x002b, 0xffab, $fail
	/* 4c7 */ x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             --     cmp 0x002b, 0xffab
	/* 4cd */ x"68",x"e0",x"0c",x"d0",                         --     jeq $fail
	/* 4d1 */ x"6c",x"e0",x"d9",x"d4",                         --     jne $_L_test_jmp_13
	/* 4d5 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 4d9 */                                                  -- _L_test_jmp_13:
	/* 4d9 */ x"70",x"e0",x"e1",x"d4",                         --     jlt $_L_test_jmp_14
	/* 4dd */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 4e1 */                                                  -- _L_test_jmp_14:
	/* 4e1 */ x"74",x"e0",x"e9",x"d4",                         --     jle $_L_test_jmp_15
	/* 4e5 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 4e9 */                                                  -- _L_test_jmp_15:
	/* 4e9 */ x"78",x"e0",x"0c",x"d0",                         --     jgt $fail
	/* 4ed */ x"7c",x"e0",x"0c",x"d0",                         --     jge $fail
	/* 4f1 */ x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             --     icmp 0x002b, 0xffab
	/* 4f7 */ x"68",x"e0",x"0c",x"d0",                         --     jeq $fail
	/* 4fb */ x"6c",x"e0",x"03",x"d5",                         --     jne $_L_test_jmp_16
	/* 4ff */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 503 */                                                  -- _L_test_jmp_16:
	/* 503 */ x"70",x"e0",x"0c",x"d0",                         --     jlt $fail
	/* 507 */ x"74",x"e0",x"0c",x"d0",                         --     jle $fail
	/* 50b */ x"78",x"e0",x"13",x"d5",                         --     jgt $_L_test_jmp_17
	/* 50f */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 513 */                                                  -- _L_test_jmp_17:
	/* 513 */ x"7c",x"e0",x"1b",x"d5",                         --     jge $_L_test_jmp_18
	/* 517 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 51b */                                                  -- _L_test_jmp_18:
	/* 51b */ x"e8",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"29",x"d5", --     jeq 0xffab, 0xffab, $_L_test_jmp_19
	/* 525 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 529 */                                                  -- _L_test_jmp_19:
	/* 529 */ x"ec",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0c",x"d0", --     jne 0xffab, 0xffab, $fail
	/* 533 */ x"f0",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0c",x"d0", --     jlt 0xffab, 0xffab, $fail
	/* 53d */ x"f4",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"4b",x"d5", --     jle 0xffab, 0xffab, $_L_test_jmp_20
	/* 547 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 54b */                                                  -- _L_test_jmp_20:
	/* 54b */ x"f8",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0c",x"d0", --     jgt 0xffab, 0xffab, $fail
	/* 555 */ x"fc",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"63",x"d5", --     jge 0xffab, 0xffab, $_L_test_jmp_21
	/* 55f */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 563 */                                                  -- _L_test_jmp_21:
	/* 563 */ x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     cmp 0xffab, 0xffab
	/* 56a */ x"68",x"e0",x"72",x"d5",                         --     jeq $_L_test_jmp_22
	/* 56e */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 572 */                                                  -- _L_test_jmp_22:
	/* 572 */ x"6c",x"e0",x"0c",x"d0",                         --     jne $fail
	/* 576 */ x"70",x"e0",x"0c",x"d0",                         --     jlt $fail
	/* 57a */ x"74",x"e0",x"82",x"d5",                         --     jle $_L_test_jmp_23
	/* 57e */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 582 */                                                  -- _L_test_jmp_23:
	/* 582 */ x"78",x"e0",x"0c",x"d0",                         --     jgt $fail
	/* 586 */ x"7c",x"e0",x"8e",x"d5",                         --     jge $_L_test_jmp_24
	/* 58a */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 58e */                                                  -- _L_test_jmp_24:
	/* 58e */ x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     icmp 0xffab, 0xffab
	/* 595 */ x"68",x"e0",x"9d",x"d5",                         --     jeq $_L_test_jmp_25
	/* 599 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 59d */                                                  -- _L_test_jmp_25:
	/* 59d */ x"6c",x"e0",x"0c",x"d0",                         --     jne $fail
	/* 5a1 */ x"70",x"e0",x"0c",x"d0",                         --     jlt $fail
	/* 5a5 */ x"74",x"e0",x"ad",x"d5",                         --     jle $_L_test_jmp_26
	/* 5a9 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 5ad */                                                  -- _L_test_jmp_26:
	/* 5ad */ x"78",x"e0",x"0c",x"d0",                         --     jgt $fail
	/* 5b1 */ x"7c",x"e0",x"b9",x"d5",                         --     jge $_L_test_jmp_27
	/* 5b5 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 5b9 */                                                  -- _L_test_jmp_27:
	/* 5b9 */                                                  --
	/* 5b9 */                                                  -- # BEGIN test_call_ret.asm
	/* 5b9 */                                                  -- test_call_ret:
	/* 5b9 */                                                  --
	/* 5b9 */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* 5be */ x"5c",x"e0",x"35",x"d6",                         --     call $fn_test_target
	/* 5c2 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0c",x"d0", --     jne SP, 0x1000, $fail
	/* 5ca */                                                  --
	/* 5ca */ x"60",x"20",x"1c",x"0a",                         --     mov A, 10
	/* 5ce */ x"60",x"40",x"00",                               --     mov B, 0
	/* 5d1 */ x"60",x"60",x"00",                               --     mov C, 0
	/* 5d4 */ x"60",x"80",x"00",                               --     mov D, 0
	/* 5d7 */ x"5c",x"e0",x"04",x"d6",                         --     call $fn_recursive
	/* 5db */                                                  --
	/* 5db */ x"ec",x"20",x"00",x"e0",x"0c",x"d0",             --     jne A, 0, $fail
	/* 5e1 */ x"ec",x"40",x"e0",x"e0",x"3f",x"cf",x"0c",x"d0", --     jne B, 0xcf3f, $fail
	/* 5e9 */ x"ec",x"60",x"1c",x"e0",x"2d",x"0c",x"d0",       --     jne C, 0x002d, $fail
	/* 5f0 */ x"ec",x"80",x"e0",x"e0",x"97",x"45",x"0c",x"d0", --     jne D, 0x4597, $fail
	/* 5f8 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0c",x"d0", --     jne SP, 0x1000, $fail
	/* 600 */                                                  --
	/* 600 */ x"58",x"e0",x"42",x"d6",                         --     jmp $test_call_ret_end
	/* 604 */                                                  --
	/* 604 */                                                  -- fn_recursive:
	/* 604 */ x"04",x"20",x"1c",x"01",                         --     sub A, 1
	/* 608 */ x"5c",x"e0",x"2d",x"d6",                         --     call $fn_process_c
	/* 60c */ x"e8",x"20",x"00",x"e0",x"28",x"d6",             --     jeq A, 0, $fn_recursive_end
	/* 612 */ x"5c",x"e0",x"04",x"d6",                         --     call $fn_recursive
	/* 616 */ x"00",x"80",x"60",                               --     add D, C
	/* 619 */ x"08",x"80",x"1c",x"03",                         --     mul D, 3
	/* 61d */ x"00",x"40",x"80",                               --     add B, D
	/* 620 */ x"e0",x"80",                                     --     push D
	/* 622 */ x"08",x"40",x"1c",x"05",                         --     mul B, 5
	/* 626 */ x"e4",x"80",                                     --     pop D
	/* 628 */                                                  -- fn_recursive_end:
	/* 628 */ x"dc",                                           --     ret
	/* 629 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 62d */                                                  --
	/* 62d */                                                  -- fn_process_c:
	/* 62d */ x"00",x"60",x"20",                               --     add C, A
	/* 630 */ x"dc",                                           --     ret
	/* 631 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 635 */                                                  --
	/* 635 */                                                  -- fn_test_target:
	/* 635 */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0c",x"d0", --     jne SP, 0x0ffe, $fail
	/* 63d */ x"dc",                                           --     ret
	/* 63e */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 642 */                                                  --
	/* 642 */                                                  -- test_call_ret_end:
	/* 642 */                                                  -- # END test_call_ret.asm
	/* 642 */                                                  --
	/* 642 */                                                  --
	/* 642 */                                                  -- # BEGIN test_mem_access.asm
	/* 642 */                                                  -- test_mem_access:
	/* 642 */ x"62",x"e0",x"e0",x"00",x"01",x"ed",x"ff",       --     mov [0x100], 0xFFED
	/* 649 */ x"ee",x"e0",x"1c",x"e0",x"00",x"01",x"aa",x"56",x"d6", --     jne [0x100], 0x00AA, $test_mem_access_check_jmp
	/* 652 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 656 */                                                  -- test_mem_access_check_jmp:
	/* 656 */                                                  --
	/* 656 */ x"62",x"e0",x"00",x"00",x"10",                   --     mov [0x1000], 0
	/* 65b */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* 660 */ x"ee",x"a0",x"00",x"e0",x"0c",x"d0",             --     jne [SP], 0, $fail
	/* 666 */ x"e0",x"00",                                     --     push 0
	/* 668 */ x"e0",x"00",                                     --     push 0
	/* 66a */ x"e0",x"00",                                     --     push 0
	/* 66c */ x"e4",x"20",                                     --     pop A
	/* 66e */ x"e4",x"20",                                     --     pop A
	/* 670 */ x"e4",x"20",                                     --     pop A
	/* 672 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0c",x"d0", --     jne SP, 0x1000, $fail
	/* 67a */ x"ec",x"20",x"00",x"e0",x"0c",x"d0",             --     jne A, 0, $fail
	/* 680 */                                                  --
	/* 680 */ x"e0",x"e0",x"02",x"01",                         --     push 0x0102
	/* 684 */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0c",x"d0", --     jne SP, 0xFFE, $fail
	/* 68c */ x"e0",x"e0",x"04",x"03",                         --     push 0x0304
	/* 690 */ x"ec",x"a0",x"e0",x"e0",x"fc",x"0f",x"0c",x"d0", --     jne SP, 0xFFC, $fail
	/* 698 */                                                  --
	/* 698 */ x"ee",x"e0",x"e0",x"e0",x"fe",x"0f",x"02",x"01",x"0c",x"d0", --     jne [0xFFE], 0x0102, $fail
	/* 6a2 */ x"ee",x"e0",x"e0",x"e0",x"fc",x"0f",x"04",x"03",x"0c",x"d0", --     jne [0xFFC], 0x0304, $fail
	/* 6ac */                                                  --
	/* 6ac */                                                  --     # unaligned
	/* 6ac */ x"ee",x"e0",x"e0",x"e0",x"fb",x"0f",x"00",x"04",x"0c",x"d0", --     jne [0xFFB], 0x0400, $fail
	/* 6b6 */ x"ee",x"e0",x"e0",x"e0",x"fd",x"0f",x"03",x"02",x"0c",x"d0", --     jne [0xFFD], 0x0203, $fail
	/* 6c0 */ x"ee",x"e0",x"1c",x"e0",x"ff",x"0f",x"01",x"0c",x"d0", --     jne [0xFFF], 0x0001, $fail
	/* 6c9 */                                                  --
	/* 6c9 */ x"e4",x"20",                                     --     pop A
	/* 6cb */ x"ec",x"20",x"e0",x"e0",x"04",x"03",x"0c",x"d0", --     jne A, 0x0304, $fail
	/* 6d3 */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0c",x"d0", --     jne SP, 0xFFE, $fail
	/* 6db */ x"e4",x"20",                                     --     pop A
	/* 6dd */ x"ec",x"20",x"e0",x"e0",x"02",x"01",x"0c",x"d0", --     jne A, 0x0102, $fail
	/* 6e5 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0c",x"d0", --     jne SP, 0x1000, $fail
	/* 6ed */                                                  --
	/* 6ed */                                                  -- # END test_mem_access.asm
	/* 6ed */                                                  --
	/* 6ed */                                                  --
	/* 6ed */                                                  -- # BEGIN test_cmp.asm
	/* 6ed */                                                  -- test_cmp:
	/* 6ed */ x"cc",x"e0",x"ff",x"ff",                         --     setf 0xFFFF
	/* 6f1 */ x"4c",x"20",                                     --     getf A
	/* 6f3 */ x"ec",x"20",x"1c",x"e0",x"3f",x"0c",x"d0",       --     jne A, 0x3F, $fail
	/* 6fa */                                                  --
	/* 6fa */ x"cc",x"e0",x"ab",x"ab",                         --     setf 0xABAB
	/* 6fe */ x"4c",x"20",                                     --     getf A
	/* 700 */ x"ec",x"20",x"1c",x"e0",x"2b",x"0c",x"d0",       --     jne A, 0x2B, $fail
	/* 707 */                                                  --
	/* 707 */                                                  --     # unsigned
	/* 707 */ x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             --     cmp 0xFFAB, 0x2B
	/* 70d */ x"4c",x"20",                                     --     getf A
	/* 70f */                                                  --     # GE GT LE LT NE EQ
	/* 70f */ x"ec",x"20",x"1c",x"e0",x"32",x"0c",x"d0",       --     jne A, 0b110010, $fail
	/* 716 */                                                  --
	/* 716 */ x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             --     cmp 0x2B, 0xFFAB
	/* 71c */ x"4c",x"20",                                     --     getf A
	/* 71e */ x"ec",x"20",x"1c",x"e0",x"0e",x"0c",x"d0",       --     jne A, 0b001110, $fail
	/* 725 */                                                  --
	/* 725 */ x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     cmp 0xFFAB, 0xFFAB
	/* 72c */ x"4c",x"20",                                     --     getf A
	/* 72e */ x"ec",x"20",x"1c",x"e0",x"29",x"0c",x"d0",       --     jne A, 0b101001, $fail
	/* 735 */                                                  --
	/* 735 */                                                  --     # signed
	/* 735 */ x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             --     icmp 0xFFAB, 0x2B
	/* 73b */ x"4c",x"20",                                     --     getf A
	/* 73d */                                                  --     # GE GT LE LT NE EQ
	/* 73d */ x"ec",x"20",x"1c",x"e0",x"0e",x"0c",x"d0",       --     jne A, 0b001110, $fail
	/* 744 */                                                  --
	/* 744 */ x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             --     icmp 0x2B, 0xFFAB
	/* 74a */ x"4c",x"20",                                     --     getf A
	/* 74c */ x"ec",x"20",x"1c",x"e0",x"32",x"0c",x"d0",       --     jne A, 0b110010, $fail
	/* 753 */                                                  --
	/* 753 */ x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     icmp 0xFFAB, 0xFFAB
	/* 75a */ x"4c",x"20",                                     --     getf A
	/* 75c */ x"ec",x"20",x"1c",x"e0",x"29",x"0c",x"d0",       --     jne A, 0b101001, $fail
	/* 763 */                                                  -- # END test_cmp.asm
	/* 763 */                                                  --
	/* 763 */                                                  -- end_of_test:
	/* 763 */ x"58",x"e0",x"11",x"d0",                         --     jmp $success
	/* 767 */                                                  --
	/* 767 */                                                  -- # BEGIN drive_led.asm
	/* 767 */                                                  -- drive_led:
	/* 767 */ x"60",x"20",x"1c",x"cc",                         --     mov A, 0xCC
	/* 76b */ x"60",x"60",x"00",                               --     mov C, 0
	/* 76e */                                                  -- drive_led_loop:
	/* 76e */ x"60",x"40",x"00",                               --     mov B, 0
	/* 771 */                                                  --     drive_led_inner_loop:
	/* 771 */ x"00",x"40",x"1c",x"01",                         --         add B, 1
	/* 775 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"71",x"d7", --         jne B, 0xFFFF, $drive_led_inner_loop
	/* 77d */                                                  --
	/* 77d */ x"00",x"60",x"1c",x"01",                         --     add C, 1
	/* 781 */ x"a0",x"20",x"60",x"1c",x"04",                   --     shr A, C, 4
	/* 786 */ x"58",x"e0",x"6e",x"d7",                         --     jmp $drive_led_loop
	/* 78a */                                                  -- # END drive_led.asm
	/* 78a */                                                  --
	/* 78a */                                                  --
	/* 78a */ x"d8"                                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
