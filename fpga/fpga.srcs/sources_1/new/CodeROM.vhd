
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is
-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 1356;
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
	/*  22 */                                                  --      # t=True, a=d230, b=a012
	/*  22 */ x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     add B, 0xd230, 0xa012
	/*  2a */ x"60",x"20",x"1c",x"01",                         --     mov A, 0x0001 # test_1
	/*  2e */ x"ec",x"40",x"e0",x"e0",x"42",x"72",x"0c",x"d0", --     jne B, 0x7242, $fail
	/*  36 */                                                  --
	/*  36 */ x"84",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     sub B, 0xd230, 0xa012
	/*  3e */ x"60",x"20",x"1c",x"02",                         --     mov A, 0x0002 # test_2
	/*  42 */ x"ec",x"40",x"e0",x"e0",x"1e",x"32",x"0c",x"d0", --     jne B, 0x321e, $fail
	/*  4a */                                                  --
	/*  4a */ x"88",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     mul B, 0xd230, 0xa012
	/*  52 */ x"60",x"20",x"1c",x"03",                         --     mov A, 0x0003 # test_3
	/*  56 */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0c",x"d0", --     jne B, 0xc760, $fail
	/*  5e */ x"ec",x"80",x"e0",x"e0",x"6c",x"83",x"0c",x"d0", --     jne D, 0x836c, $fail
	/*  66 */                                                  --
	/*  66 */ x"8c",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     imul B, 0xd230, 0xa012
	/*  6e */ x"60",x"20",x"1c",x"04",                         --     mov A, 0x0004 # test_4
	/*  72 */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0c",x"d0", --     jne B, 0xc760, $fail
	/*  7a */ x"ec",x"80",x"e0",x"e0",x"2a",x"11",x"0c",x"d0", --     jne D, 0x112a, $fail
	/*  82 */                                                  --
	/*  82 */ x"a0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shr B, 0xd230, 0xa012
	/*  8a */ x"60",x"20",x"1c",x"05",                         --     mov A, 0x0005 # test_5
	/*  8e */ x"ec",x"40",x"e0",x"e0",x"8c",x"34",x"0c",x"d0", --     jne B, 0x348c, $fail
	/*  96 */                                                  --
	/*  96 */ x"a4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     ishr B, 0xd230, 0xa012
	/*  9e */ x"60",x"20",x"1c",x"06",                         --     mov A, 0x0006 # test_6
	/*  a2 */ x"ec",x"40",x"e0",x"e0",x"8c",x"f4",x"0c",x"d0", --     jne B, 0xf48c, $fail
	/*  aa */                                                  --
	/*  aa */ x"a8",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shl B, 0xd230, 0xa012
	/*  b2 */ x"60",x"20",x"1c",x"07",                         --     mov A, 0x0007 # test_7
	/*  b6 */ x"ec",x"40",x"e0",x"e0",x"c0",x"48",x"0c",x"d0", --     jne B, 0x48c0, $fail
	/*  be */                                                  --
	/*  be */ x"ac",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     and B, 0xd230, 0xa012
	/*  c6 */ x"60",x"20",x"1c",x"08",                         --     mov A, 0x0008 # test_8
	/*  ca */ x"ec",x"40",x"e0",x"e0",x"10",x"80",x"0c",x"d0", --     jne B, 0x8010, $fail
	/*  d2 */                                                  --
	/*  d2 */ x"b0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     or B, 0xd230, 0xa012
	/*  da */ x"60",x"20",x"1c",x"09",                         --     mov A, 0x0009 # test_9
	/*  de */ x"ec",x"40",x"e0",x"e0",x"32",x"f2",x"0c",x"d0", --     jne B, 0xf232, $fail
	/*  e6 */                                                  --
	/*  e6 */ x"b4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     xor B, 0xd230, 0xa012
	/*  ee */ x"60",x"20",x"1c",x"0a",                         --     mov A, 0x000a # test_10
	/*  f2 */ x"ec",x"40",x"e0",x"e0",x"22",x"72",x"0c",x"d0", --     jne B, 0x7222, $fail
	/*  fa */                                                  --
	/*  fa */ x"b8",x"40",x"e0",x"30",x"d2",                   --     neg B, 0xd230
	/*  ff */ x"60",x"20",x"1c",x"0b",                         --     mov A, 0x000b # test_11
	/* 103 */ x"ec",x"40",x"e0",x"e0",x"d0",x"2d",x"0c",x"d0", --     jne B, 0x2dd0, $fail
	/* 10b */                                                  --
	/* 10b */ x"bc",x"40",x"e0",x"30",x"d2",                   --     not B, 0xd230
	/* 110 */ x"60",x"20",x"1c",x"0c",                         --     mov A, 0x000c # test_12
	/* 114 */ x"ec",x"40",x"e0",x"e0",x"cf",x"2d",x"0c",x"d0", --     jne B, 0x2dcf, $fail
	/* 11c */                                                  --
	/* 11c */ x"c0",x"40",x"e0",x"30",x"d2",                   --     bool B, 0xd230
	/* 121 */ x"60",x"20",x"1c",x"0d",                         --     mov A, 0x000d # test_13
	/* 125 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 12c */                                                  --
	/* 12c */ x"c4",x"40",x"e0",x"30",x"d2",                   --     inc B, 0xd230
	/* 131 */ x"60",x"20",x"1c",x"0e",                         --     mov A, 0x000e # test_14
	/* 135 */ x"ec",x"40",x"e0",x"e0",x"31",x"d2",x"0c",x"d0", --     jne B, 0xd231, $fail
	/* 13d */                                                  --
	/* 13d */ x"c8",x"40",x"e0",x"30",x"d2",                   --     dec B, 0xd230
	/* 142 */ x"60",x"20",x"1c",x"0f",                         --     mov A, 0x000f # test_15
	/* 146 */ x"ec",x"40",x"e0",x"e0",x"2f",x"d2",x"0c",x"d0", --     jne B, 0xd22f, $fail
	/* 14e */                                                  --
	/* 14e */                                                  --      # t=True, a=00ad, b=da37
	/* 14e */ x"80",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     add B, 0x00ad, 0xda37
	/* 155 */ x"60",x"20",x"1c",x"10",                         --     mov A, 0x0010 # test_16
	/* 159 */ x"ec",x"40",x"e0",x"e0",x"e4",x"da",x"0c",x"d0", --     jne B, 0xdae4, $fail
	/* 161 */                                                  --
	/* 161 */ x"84",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     sub B, 0x00ad, 0xda37
	/* 168 */ x"60",x"20",x"1c",x"11",                         --     mov A, 0x0011 # test_17
	/* 16c */ x"ec",x"40",x"e0",x"e0",x"76",x"26",x"0c",x"d0", --     jne B, 0x2676, $fail
	/* 174 */                                                  --
	/* 174 */ x"88",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     mul B, 0x00ad, 0xda37
	/* 17b */ x"60",x"20",x"1c",x"12",                         --     mov A, 0x0012 # test_18
	/* 17f */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0c",x"d0", --     jne B, 0x772b, $fail
	/* 187 */ x"ec",x"80",x"1c",x"e0",x"93",x"0c",x"d0",       --     jne D, 0x0093, $fail
	/* 18e */                                                  --
	/* 18e */ x"8c",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     imul B, 0x00ad, 0xda37
	/* 195 */ x"60",x"20",x"1c",x"13",                         --     mov A, 0x0013 # test_19
	/* 199 */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0c",x"d0", --     jne B, 0x772b, $fail
	/* 1a1 */ x"ec",x"80",x"e0",x"e0",x"e6",x"ff",x"0c",x"d0", --     jne D, 0xffe6, $fail
	/* 1a9 */                                                  --
	/* 1a9 */ x"a0",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     shr B, 0x00ad, 0xda37
	/* 1b0 */ x"60",x"20",x"1c",x"14",                         --     mov A, 0x0014 # test_20
	/* 1b4 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 1bb */                                                  --
	/* 1bb */ x"a4",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     ishr B, 0x00ad, 0xda37
	/* 1c2 */ x"60",x"20",x"1c",x"15",                         --     mov A, 0x0015 # test_21
	/* 1c6 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 1cd */                                                  --
	/* 1cd */ x"a8",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     shl B, 0x00ad, 0xda37
	/* 1d4 */ x"60",x"20",x"1c",x"16",                         --     mov A, 0x0016 # test_22
	/* 1d8 */ x"ec",x"40",x"e0",x"e0",x"80",x"56",x"0c",x"d0", --     jne B, 0x5680, $fail
	/* 1e0 */                                                  --
	/* 1e0 */ x"ac",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     and B, 0x00ad, 0xda37
	/* 1e7 */ x"60",x"20",x"1c",x"17",                         --     mov A, 0x0017 # test_23
	/* 1eb */ x"ec",x"40",x"1c",x"e0",x"25",x"0c",x"d0",       --     jne B, 0x0025, $fail
	/* 1f2 */                                                  --
	/* 1f2 */ x"b0",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     or B, 0x00ad, 0xda37
	/* 1f9 */ x"60",x"20",x"1c",x"18",                         --     mov A, 0x0018 # test_24
	/* 1fd */ x"ec",x"40",x"e0",x"e0",x"bf",x"da",x"0c",x"d0", --     jne B, 0xdabf, $fail
	/* 205 */                                                  --
	/* 205 */ x"b4",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     xor B, 0x00ad, 0xda37
	/* 20c */ x"60",x"20",x"1c",x"19",                         --     mov A, 0x0019 # test_25
	/* 210 */ x"ec",x"40",x"e0",x"e0",x"9a",x"da",x"0c",x"d0", --     jne B, 0xda9a, $fail
	/* 218 */                                                  --
	/* 218 */ x"b8",x"40",x"1c",x"ad",                         --     neg B, 0x00ad
	/* 21c */ x"60",x"20",x"1c",x"1a",                         --     mov A, 0x001a # test_26
	/* 220 */ x"ec",x"40",x"e0",x"e0",x"53",x"ff",x"0c",x"d0", --     jne B, 0xff53, $fail
	/* 228 */                                                  --
	/* 228 */ x"bc",x"40",x"1c",x"ad",                         --     not B, 0x00ad
	/* 22c */ x"60",x"20",x"1c",x"1b",                         --     mov A, 0x001b # test_27
	/* 230 */ x"ec",x"40",x"e0",x"e0",x"52",x"ff",x"0c",x"d0", --     jne B, 0xff52, $fail
	/* 238 */                                                  --
	/* 238 */ x"c0",x"40",x"1c",x"ad",                         --     bool B, 0x00ad
	/* 23c */ x"60",x"20",x"1c",x"1c",                         --     mov A, 0x001c # test_28
	/* 240 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 247 */                                                  --
	/* 247 */ x"c4",x"40",x"1c",x"ad",                         --     inc B, 0x00ad
	/* 24b */ x"60",x"20",x"1c",x"1d",                         --     mov A, 0x001d # test_29
	/* 24f */ x"ec",x"40",x"1c",x"e0",x"ae",x"0c",x"d0",       --     jne B, 0x00ae, $fail
	/* 256 */                                                  --
	/* 256 */ x"c8",x"40",x"1c",x"ad",                         --     dec B, 0x00ad
	/* 25a */ x"60",x"20",x"1c",x"1e",                         --     mov A, 0x001e # test_30
	/* 25e */ x"ec",x"40",x"1c",x"e0",x"ac",x"0c",x"d0",       --     jne B, 0x00ac, $fail
	/* 265 */                                                  --
	/* 265 */                                                  --      # t=False, a=f0ad, b=2a3f
	/* 265 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 26a */ x"00",x"40",x"e0",x"3f",x"2a",                   --     add B, 0x2a3f
	/* 26f */ x"60",x"20",x"1c",x"1f",                         --     mov A, 0x001f # test_31
	/* 273 */ x"ec",x"40",x"e0",x"e0",x"ec",x"1a",x"0c",x"d0", --     jne B, 0x1aec, $fail
	/* 27b */                                                  --
	/* 27b */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 280 */ x"04",x"40",x"e0",x"3f",x"2a",                   --     sub B, 0x2a3f
	/* 285 */ x"60",x"20",x"1c",x"20",                         --     mov A, 0x0020 # test_32
	/* 289 */ x"ec",x"40",x"e0",x"e0",x"6e",x"c6",x"0c",x"d0", --     jne B, 0xc66e, $fail
	/* 291 */                                                  --
	/* 291 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 296 */ x"08",x"40",x"e0",x"3f",x"2a",                   --     mul B, 0x2a3f
	/* 29b */ x"60",x"20",x"1c",x"21",                         --     mov A, 0x0021 # test_33
	/* 29f */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0c",x"d0", --     jne B, 0x9c93, $fail
	/* 2a7 */ x"ec",x"80",x"e0",x"e0",x"b7",x"27",x"0c",x"d0", --     jne D, 0x27b7, $fail
	/* 2af */                                                  --
	/* 2af */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2b4 */ x"0c",x"40",x"e0",x"3f",x"2a",                   --     imul B, 0x2a3f
	/* 2b9 */ x"60",x"20",x"1c",x"22",                         --     mov A, 0x0022 # test_34
	/* 2bd */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0c",x"d0", --     jne B, 0x9c93, $fail
	/* 2c5 */ x"ec",x"80",x"e0",x"e0",x"78",x"fd",x"0c",x"d0", --     jne D, 0xfd78, $fail
	/* 2cd */                                                  --
	/* 2cd */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2d2 */ x"20",x"40",x"e0",x"3f",x"2a",                   --     shr B, 0x2a3f
	/* 2d7 */ x"60",x"20",x"1c",x"23",                         --     mov A, 0x0023 # test_35
	/* 2db */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 2e2 */                                                  --
	/* 2e2 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2e7 */ x"24",x"40",x"e0",x"3f",x"2a",                   --     ishr B, 0x2a3f
	/* 2ec */ x"60",x"20",x"1c",x"24",                         --     mov A, 0x0024 # test_36
	/* 2f0 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0c",x"d0", --     jne B, 0xffff, $fail
	/* 2f8 */                                                  --
	/* 2f8 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2fd */ x"28",x"40",x"e0",x"3f",x"2a",                   --     shl B, 0x2a3f
	/* 302 */ x"60",x"20",x"1c",x"25",                         --     mov A, 0x0025 # test_37
	/* 306 */ x"ec",x"40",x"e0",x"e0",x"00",x"80",x"0c",x"d0", --     jne B, 0x8000, $fail
	/* 30e */                                                  --
	/* 30e */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 313 */ x"2c",x"40",x"e0",x"3f",x"2a",                   --     and B, 0x2a3f
	/* 318 */ x"60",x"20",x"1c",x"26",                         --     mov A, 0x0026 # test_38
	/* 31c */ x"ec",x"40",x"e0",x"e0",x"2d",x"20",x"0c",x"d0", --     jne B, 0x202d, $fail
	/* 324 */                                                  --
	/* 324 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 329 */ x"30",x"40",x"e0",x"3f",x"2a",                   --     or B, 0x2a3f
	/* 32e */ x"60",x"20",x"1c",x"27",                         --     mov A, 0x0027 # test_39
	/* 332 */ x"ec",x"40",x"e0",x"e0",x"bf",x"fa",x"0c",x"d0", --     jne B, 0xfabf, $fail
	/* 33a */                                                  --
	/* 33a */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 33f */ x"34",x"40",x"e0",x"3f",x"2a",                   --     xor B, 0x2a3f
	/* 344 */ x"60",x"20",x"1c",x"28",                         --     mov A, 0x0028 # test_40
	/* 348 */ x"ec",x"40",x"e0",x"e0",x"92",x"da",x"0c",x"d0", --     jne B, 0xda92, $fail
	/* 350 */                                                  --
	/* 350 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 355 */ x"38",x"40",                                     --     neg B
	/* 357 */ x"60",x"20",x"1c",x"29",                         --     mov A, 0x0029 # test_41
	/* 35b */ x"ec",x"40",x"e0",x"e0",x"53",x"0f",x"0c",x"d0", --     jne B, 0x0f53, $fail
	/* 363 */                                                  --
	/* 363 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 368 */ x"3c",x"40",                                     --     not B
	/* 36a */ x"60",x"20",x"1c",x"2a",                         --     mov A, 0x002a # test_42
	/* 36e */ x"ec",x"40",x"e0",x"e0",x"52",x"0f",x"0c",x"d0", --     jne B, 0x0f52, $fail
	/* 376 */                                                  --
	/* 376 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 37b */ x"40",x"40",                                     --     bool B
	/* 37d */ x"60",x"20",x"1c",x"2b",                         --     mov A, 0x002b # test_43
	/* 381 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 388 */                                                  --
	/* 388 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 38d */ x"44",x"40",                                     --     inc B
	/* 38f */ x"60",x"20",x"1c",x"2c",                         --     mov A, 0x002c # test_44
	/* 393 */ x"ec",x"40",x"e0",x"e0",x"ae",x"f0",x"0c",x"d0", --     jne B, 0xf0ae, $fail
	/* 39b */                                                  --
	/* 39b */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 3a0 */ x"48",x"40",                                     --     dec B
	/* 3a2 */ x"60",x"20",x"1c",x"2d",                         --     mov A, 0x002d # test_45
	/* 3a6 */ x"ec",x"40",x"e0",x"e0",x"ac",x"f0",x"0c",x"d0", --     jne B, 0xf0ac, $fail
	/* 3ae */                                                  --
	/* 3ae */                                                  --      # t=False, a=0000, b=dead
	/* 3ae */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3b2 */ x"00",x"40",x"e0",x"ad",x"de",                   --     add B, 0xdead
	/* 3b7 */ x"60",x"20",x"1c",x"2e",                         --     mov A, 0x002e # test_46
	/* 3bb */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0c",x"d0", --     jne B, 0xdead, $fail
	/* 3c3 */                                                  --
	/* 3c3 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3c7 */ x"04",x"40",x"e0",x"ad",x"de",                   --     sub B, 0xdead
	/* 3cc */ x"60",x"20",x"1c",x"2f",                         --     mov A, 0x002f # test_47
	/* 3d0 */ x"ec",x"40",x"e0",x"e0",x"53",x"21",x"0c",x"d0", --     jne B, 0x2153, $fail
	/* 3d8 */                                                  --
	/* 3d8 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3dc */ x"08",x"40",x"e0",x"ad",x"de",                   --     mul B, 0xdead
	/* 3e1 */ x"60",x"20",x"1c",x"30",                         --     mov A, 0x0030 # test_48
	/* 3e5 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 3ec */ x"ec",x"80",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne D, 0x0000, $fail
	/* 3f3 */                                                  --
	/* 3f3 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3f7 */ x"0c",x"40",x"e0",x"ad",x"de",                   --     imul B, 0xdead
	/* 3fc */ x"60",x"20",x"1c",x"31",                         --     mov A, 0x0031 # test_49
	/* 400 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 407 */ x"ec",x"80",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne D, 0x0000, $fail
	/* 40e */                                                  --
	/* 40e */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 412 */ x"20",x"40",x"e0",x"ad",x"de",                   --     shr B, 0xdead
	/* 417 */ x"60",x"20",x"1c",x"32",                         --     mov A, 0x0032 # test_50
	/* 41b */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 422 */                                                  --
	/* 422 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 426 */ x"24",x"40",x"e0",x"ad",x"de",                   --     ishr B, 0xdead
	/* 42b */ x"60",x"20",x"1c",x"33",                         --     mov A, 0x0033 # test_51
	/* 42f */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 436 */                                                  --
	/* 436 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 43a */ x"28",x"40",x"e0",x"ad",x"de",                   --     shl B, 0xdead
	/* 43f */ x"60",x"20",x"1c",x"34",                         --     mov A, 0x0034 # test_52
	/* 443 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 44a */                                                  --
	/* 44a */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 44e */ x"2c",x"40",x"e0",x"ad",x"de",                   --     and B, 0xdead
	/* 453 */ x"60",x"20",x"1c",x"35",                         --     mov A, 0x0035 # test_53
	/* 457 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 45e */                                                  --
	/* 45e */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 462 */ x"30",x"40",x"e0",x"ad",x"de",                   --     or B, 0xdead
	/* 467 */ x"60",x"20",x"1c",x"36",                         --     mov A, 0x0036 # test_54
	/* 46b */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0c",x"d0", --     jne B, 0xdead, $fail
	/* 473 */                                                  --
	/* 473 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 477 */ x"34",x"40",x"e0",x"ad",x"de",                   --     xor B, 0xdead
	/* 47c */ x"60",x"20",x"1c",x"37",                         --     mov A, 0x0037 # test_55
	/* 480 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0c",x"d0", --     jne B, 0xdead, $fail
	/* 488 */                                                  --
	/* 488 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 48c */ x"38",x"40",                                     --     neg B
	/* 48e */ x"60",x"20",x"1c",x"38",                         --     mov A, 0x0038 # test_56
	/* 492 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 499 */                                                  --
	/* 499 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 49d */ x"3c",x"40",                                     --     not B
	/* 49f */ x"60",x"20",x"1c",x"39",                         --     mov A, 0x0039 # test_57
	/* 4a3 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0c",x"d0", --     jne B, 0xffff, $fail
	/* 4ab */                                                  --
	/* 4ab */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 4af */ x"40",x"40",                                     --     bool B
	/* 4b1 */ x"60",x"20",x"1c",x"3a",                         --     mov A, 0x003a # test_58
	/* 4b5 */ x"ec",x"40",x"1c",x"e0",x"00",x"0c",x"d0",       --     jne B, 0x0000, $fail
	/* 4bc */                                                  --
	/* 4bc */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 4c0 */ x"44",x"40",                                     --     inc B
	/* 4c2 */ x"60",x"20",x"1c",x"3b",                         --     mov A, 0x003b # test_59
	/* 4c6 */ x"ec",x"40",x"1c",x"e0",x"01",x"0c",x"d0",       --     jne B, 0x0001, $fail
	/* 4cd */                                                  --
	/* 4cd */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 4d1 */ x"48",x"40",                                     --     dec B
	/* 4d3 */ x"60",x"20",x"1c",x"3c",                         --     mov A, 0x003c # test_60
	/* 4d7 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0c",x"d0", --     jne B, 0xffff, $fail
	/* 4df */                                                  --
	/* 4df */                                                  -- test_call_ret:
	/* 4df */                                                  --
	/* 4df */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* 4e4 */ x"60",x"20",x"1c",x"0a",                         --     mov A, 10
	/* 4e8 */ x"60",x"40",x"00",                               --     mov B, 0
	/* 4eb */ x"60",x"60",x"00",                               --     mov C, 0
	/* 4ee */ x"60",x"80",x"00",                               --     mov D, 0
	/* 4f1 */ x"5c",x"e0",x"16",x"d5",                         --     call $fn_recursive
	/* 4f5 */                                                  --
	/* 4f5 */ x"ec",x"20",x"00",x"e0",x"0c",x"d0",             --     jne A, 0, $fail
	/* 4fb */ x"ec",x"40",x"e0",x"e0",x"3f",x"cf",x"0c",x"d0", --     jne B, 0xcf3f, $fail
	/* 503 */ x"ec",x"60",x"1c",x"e0",x"2d",x"0c",x"d0",       --     jne C, 0x002d, $fail
	/* 50a */ x"ec",x"80",x"e0",x"e0",x"97",x"45",x"0c",x"d0", --     jne D, 0x4597, $fail
	/* 512 */                                                  --
	/* 512 */ x"58",x"e0",x"11",x"d0",                         --     jmp $success
	/* 516 */                                                  --
	/* 516 */                                                  -- fn_recursive:
	/* 516 */ x"04",x"20",x"1c",x"01",                         --     sub A, 1
	/* 51a */ x"5c",x"e0",x"3f",x"d5",                         --     call $fn_process_c
	/* 51e */ x"e8",x"20",x"00",x"e0",x"3a",x"d5",             --     jeq A, 0, $fn_recursive_end
	/* 524 */ x"5c",x"e0",x"16",x"d5",                         --     call $fn_recursive
	/* 528 */ x"00",x"80",x"60",                               --     add D, C
	/* 52b */ x"08",x"80",x"1c",x"03",                         --     mul D, 3
	/* 52f */ x"00",x"40",x"80",                               --     add B, D
	/* 532 */ x"e0",x"80",                                     --     push D
	/* 534 */ x"08",x"40",x"1c",x"05",                         --     mul B, 5
	/* 538 */ x"e4",x"80",                                     --     pop D
	/* 53a */                                                  -- fn_recursive_end:
	/* 53a */ x"dc",                                           --     ret
	/* 53b */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 53f */                                                  --
	/* 53f */                                                  -- fn_process_c:
	/* 53f */ x"00",x"60",x"20",                               --     add C, A
	/* 542 */ x"dc",                                           --     ret
	/* 543 */ x"58",x"e0",x"0c",x"d0",                         --     jmp $fail
	/* 547 */                                                  --
	/* 547 */                                                  -- end_of_test::
	/* 547 */ x"58",x"e0",x"11",x"d0",                         --     jmp $success
	/* 54b */                                                  --
	/* 54b */ x"d8"                                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
