
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is
-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 1241;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*   0 */                                                  -- .offset 0xD000
	/*   0 */                                                  -- .boot:
	/*   0 */ x"58",x"e0",x"17",x"d0",                         --     jmp $start_test
	/*   4 */ x"d8",                                           --     halt
	/*   5 */                                                  -- fail:
	/*   5 */                                                  --     # A register contains failed test
	/*   5 */ x"d8",                                           --     halt
	/*   6 */                                                  -- success:
	/*   6 */ x"60",x"20",x"1c",x"ab",                         --     mov A, 0xAB
	/*   a */ x"60",x"40",x"1c",x"cd",                         --     mov B, 0xCD
	/*   e */ x"60",x"60",x"1c",x"ef",                         --     mov C, 0xEF
	/*  12 */ x"60",x"80",x"1c",x"55",                         --     mov D, 0x55
	/*  16 */ x"d8",                                           --     halt
	/*  17 */                                                  -- start_test:
	/*  17 */                                                  --      # t=True, a=d230, b=a012
	/*  17 */ x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     add B, 0xd230, 0xa012
	/*  1f */ x"60",x"20",x"1c",x"01",                         --     mov A, 0x0001 # test_1
	/*  23 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"42",x"72", --     jne $fail, B, 0x7242
	/*  2b */                                                  --
	/*  2b */ x"84",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     sub B, 0xd230, 0xa012
	/*  33 */ x"60",x"20",x"1c",x"02",                         --     mov A, 0x0002 # test_2
	/*  37 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"1e",x"32", --     jne $fail, B, 0x321e
	/*  3f */                                                  --
	/*  3f */ x"88",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     mul B, 0xd230, 0xa012
	/*  47 */ x"60",x"20",x"1c",x"03",                         --     mov A, 0x0003 # test_3
	/*  4b */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"60",x"c7", --     jne $fail, B, 0xc760
	/*  53 */ x"ec",x"e0",x"80",x"e0",x"05",x"d0",x"6c",x"83", --     jne $fail, D, 0x836c
	/*  5b */                                                  --
	/*  5b */ x"8c",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     imul B, 0xd230, 0xa012
	/*  63 */ x"60",x"20",x"1c",x"04",                         --     mov A, 0x0004 # test_4
	/*  67 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"60",x"c7", --     jne $fail, B, 0xc760
	/*  6f */ x"ec",x"e0",x"80",x"e0",x"05",x"d0",x"2a",x"11", --     jne $fail, D, 0x112a
	/*  77 */                                                  --
	/*  77 */ x"a0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shr B, 0xd230, 0xa012
	/*  7f */ x"60",x"20",x"1c",x"05",                         --     mov A, 0x0005 # test_5
	/*  83 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"8c",x"34", --     jne $fail, B, 0x348c
	/*  8b */                                                  --
	/*  8b */ x"a4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     ishr B, 0xd230, 0xa012
	/*  93 */ x"60",x"20",x"1c",x"06",                         --     mov A, 0x0006 # test_6
	/*  97 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"8c",x"f4", --     jne $fail, B, 0xf48c
	/*  9f */                                                  --
	/*  9f */ x"a8",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shl B, 0xd230, 0xa012
	/*  a7 */ x"60",x"20",x"1c",x"07",                         --     mov A, 0x0007 # test_7
	/*  ab */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"c0",x"48", --     jne $fail, B, 0x48c0
	/*  b3 */                                                  --
	/*  b3 */ x"ac",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     and B, 0xd230, 0xa012
	/*  bb */ x"60",x"20",x"1c",x"08",                         --     mov A, 0x0008 # test_8
	/*  bf */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"10",x"80", --     jne $fail, B, 0x8010
	/*  c7 */                                                  --
	/*  c7 */ x"b0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     or B, 0xd230, 0xa012
	/*  cf */ x"60",x"20",x"1c",x"09",                         --     mov A, 0x0009 # test_9
	/*  d3 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"32",x"f2", --     jne $fail, B, 0xf232
	/*  db */                                                  --
	/*  db */ x"b4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     xor B, 0xd230, 0xa012
	/*  e3 */ x"60",x"20",x"1c",x"0a",                         --     mov A, 0x000a # test_10
	/*  e7 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"22",x"72", --     jne $fail, B, 0x7222
	/*  ef */                                                  --
	/*  ef */ x"b8",x"40",x"e0",x"30",x"d2",                   --     neg B, 0xd230
	/*  f4 */ x"60",x"20",x"1c",x"0b",                         --     mov A, 0x000b # test_11
	/*  f8 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"d0",x"2d", --     jne $fail, B, 0x2dd0
	/* 100 */                                                  --
	/* 100 */ x"bc",x"40",x"e0",x"30",x"d2",                   --     not B, 0xd230
	/* 105 */ x"60",x"20",x"1c",x"0c",                         --     mov A, 0x000c # test_12
	/* 109 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"cf",x"2d", --     jne $fail, B, 0x2dcf
	/* 111 */                                                  --
	/* 111 */ x"c0",x"40",x"e0",x"30",x"d2",                   --     bool B, 0xd230
	/* 116 */ x"60",x"20",x"1c",x"0d",                         --     mov A, 0x000d # test_13
	/* 11a */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"01",       --     jne $fail, B, 0x0001
	/* 121 */                                                  --
	/* 121 */ x"c4",x"40",x"e0",x"30",x"d2",                   --     inc B, 0xd230
	/* 126 */ x"60",x"20",x"1c",x"0e",                         --     mov A, 0x000e # test_14
	/* 12a */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"31",x"d2", --     jne $fail, B, 0xd231
	/* 132 */                                                  --
	/* 132 */ x"c8",x"40",x"e0",x"30",x"d2",                   --     dec B, 0xd230
	/* 137 */ x"60",x"20",x"1c",x"0f",                         --     mov A, 0x000f # test_15
	/* 13b */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"2f",x"d2", --     jne $fail, B, 0xd22f
	/* 143 */                                                  --
	/* 143 */                                                  --      # t=True, a=00ad, b=da37
	/* 143 */ x"80",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     add B, 0x00ad, 0xda37
	/* 14a */ x"60",x"20",x"1c",x"10",                         --     mov A, 0x0010 # test_16
	/* 14e */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"e4",x"da", --     jne $fail, B, 0xdae4
	/* 156 */                                                  --
	/* 156 */ x"84",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     sub B, 0x00ad, 0xda37
	/* 15d */ x"60",x"20",x"1c",x"11",                         --     mov A, 0x0011 # test_17
	/* 161 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"76",x"26", --     jne $fail, B, 0x2676
	/* 169 */                                                  --
	/* 169 */ x"88",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     mul B, 0x00ad, 0xda37
	/* 170 */ x"60",x"20",x"1c",x"12",                         --     mov A, 0x0012 # test_18
	/* 174 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"2b",x"77", --     jne $fail, B, 0x772b
	/* 17c */ x"ec",x"e0",x"80",x"1c",x"05",x"d0",x"93",       --     jne $fail, D, 0x0093
	/* 183 */                                                  --
	/* 183 */ x"8c",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     imul B, 0x00ad, 0xda37
	/* 18a */ x"60",x"20",x"1c",x"13",                         --     mov A, 0x0013 # test_19
	/* 18e */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"2b",x"77", --     jne $fail, B, 0x772b
	/* 196 */ x"ec",x"e0",x"80",x"e0",x"05",x"d0",x"e6",x"ff", --     jne $fail, D, 0xffe6
	/* 19e */                                                  --
	/* 19e */ x"a0",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     shr B, 0x00ad, 0xda37
	/* 1a5 */ x"60",x"20",x"1c",x"14",                         --     mov A, 0x0014 # test_20
	/* 1a9 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"01",       --     jne $fail, B, 0x0001
	/* 1b0 */                                                  --
	/* 1b0 */ x"a4",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     ishr B, 0x00ad, 0xda37
	/* 1b7 */ x"60",x"20",x"1c",x"15",                         --     mov A, 0x0015 # test_21
	/* 1bb */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"01",       --     jne $fail, B, 0x0001
	/* 1c2 */                                                  --
	/* 1c2 */ x"a8",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     shl B, 0x00ad, 0xda37
	/* 1c9 */ x"60",x"20",x"1c",x"16",                         --     mov A, 0x0016 # test_22
	/* 1cd */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"80",x"56", --     jne $fail, B, 0x5680
	/* 1d5 */                                                  --
	/* 1d5 */ x"ac",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     and B, 0x00ad, 0xda37
	/* 1dc */ x"60",x"20",x"1c",x"17",                         --     mov A, 0x0017 # test_23
	/* 1e0 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"25",       --     jne $fail, B, 0x0025
	/* 1e7 */                                                  --
	/* 1e7 */ x"b0",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     or B, 0x00ad, 0xda37
	/* 1ee */ x"60",x"20",x"1c",x"18",                         --     mov A, 0x0018 # test_24
	/* 1f2 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"bf",x"da", --     jne $fail, B, 0xdabf
	/* 1fa */                                                  --
	/* 1fa */ x"b4",x"40",x"1c",x"e0",x"ad",x"37",x"da",       --     xor B, 0x00ad, 0xda37
	/* 201 */ x"60",x"20",x"1c",x"19",                         --     mov A, 0x0019 # test_25
	/* 205 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"9a",x"da", --     jne $fail, B, 0xda9a
	/* 20d */                                                  --
	/* 20d */ x"b8",x"40",x"1c",x"ad",                         --     neg B, 0x00ad
	/* 211 */ x"60",x"20",x"1c",x"1a",                         --     mov A, 0x001a # test_26
	/* 215 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"53",x"ff", --     jne $fail, B, 0xff53
	/* 21d */                                                  --
	/* 21d */ x"bc",x"40",x"1c",x"ad",                         --     not B, 0x00ad
	/* 221 */ x"60",x"20",x"1c",x"1b",                         --     mov A, 0x001b # test_27
	/* 225 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"52",x"ff", --     jne $fail, B, 0xff52
	/* 22d */                                                  --
	/* 22d */ x"c0",x"40",x"1c",x"ad",                         --     bool B, 0x00ad
	/* 231 */ x"60",x"20",x"1c",x"1c",                         --     mov A, 0x001c # test_28
	/* 235 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"01",       --     jne $fail, B, 0x0001
	/* 23c */                                                  --
	/* 23c */ x"c4",x"40",x"1c",x"ad",                         --     inc B, 0x00ad
	/* 240 */ x"60",x"20",x"1c",x"1d",                         --     mov A, 0x001d # test_29
	/* 244 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"ae",       --     jne $fail, B, 0x00ae
	/* 24b */                                                  --
	/* 24b */ x"c8",x"40",x"1c",x"ad",                         --     dec B, 0x00ad
	/* 24f */ x"60",x"20",x"1c",x"1e",                         --     mov A, 0x001e # test_30
	/* 253 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"ac",       --     jne $fail, B, 0x00ac
	/* 25a */                                                  --
	/* 25a */                                                  --      # t=False, a=f0ad, b=2a3f
	/* 25a */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 25f */ x"00",x"40",x"e0",x"3f",x"2a",                   --     add B, 0x2a3f
	/* 264 */ x"60",x"20",x"1c",x"1f",                         --     mov A, 0x001f # test_31
	/* 268 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"ec",x"1a", --     jne $fail, B, 0x1aec
	/* 270 */                                                  --
	/* 270 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 275 */ x"04",x"40",x"e0",x"3f",x"2a",                   --     sub B, 0x2a3f
	/* 27a */ x"60",x"20",x"1c",x"20",                         --     mov A, 0x0020 # test_32
	/* 27e */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"6e",x"c6", --     jne $fail, B, 0xc66e
	/* 286 */                                                  --
	/* 286 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 28b */ x"08",x"40",x"e0",x"3f",x"2a",                   --     mul B, 0x2a3f
	/* 290 */ x"60",x"20",x"1c",x"21",                         --     mov A, 0x0021 # test_33
	/* 294 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"93",x"9c", --     jne $fail, B, 0x9c93
	/* 29c */ x"ec",x"e0",x"80",x"e0",x"05",x"d0",x"b7",x"27", --     jne $fail, D, 0x27b7
	/* 2a4 */                                                  --
	/* 2a4 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2a9 */ x"0c",x"40",x"e0",x"3f",x"2a",                   --     imul B, 0x2a3f
	/* 2ae */ x"60",x"20",x"1c",x"22",                         --     mov A, 0x0022 # test_34
	/* 2b2 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"93",x"9c", --     jne $fail, B, 0x9c93
	/* 2ba */ x"ec",x"e0",x"80",x"e0",x"05",x"d0",x"78",x"fd", --     jne $fail, D, 0xfd78
	/* 2c2 */                                                  --
	/* 2c2 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2c7 */ x"20",x"40",x"e0",x"3f",x"2a",                   --     shr B, 0x2a3f
	/* 2cc */ x"60",x"20",x"1c",x"23",                         --     mov A, 0x0023 # test_35
	/* 2d0 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"01",       --     jne $fail, B, 0x0001
	/* 2d7 */                                                  --
	/* 2d7 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2dc */ x"24",x"40",x"e0",x"3f",x"2a",                   --     ishr B, 0x2a3f
	/* 2e1 */ x"60",x"20",x"1c",x"24",                         --     mov A, 0x0024 # test_36
	/* 2e5 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"ff",x"ff", --     jne $fail, B, 0xffff
	/* 2ed */                                                  --
	/* 2ed */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2f2 */ x"28",x"40",x"e0",x"3f",x"2a",                   --     shl B, 0x2a3f
	/* 2f7 */ x"60",x"20",x"1c",x"25",                         --     mov A, 0x0025 # test_37
	/* 2fb */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"00",x"80", --     jne $fail, B, 0x8000
	/* 303 */                                                  --
	/* 303 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 308 */ x"2c",x"40",x"e0",x"3f",x"2a",                   --     and B, 0x2a3f
	/* 30d */ x"60",x"20",x"1c",x"26",                         --     mov A, 0x0026 # test_38
	/* 311 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"2d",x"20", --     jne $fail, B, 0x202d
	/* 319 */                                                  --
	/* 319 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 31e */ x"30",x"40",x"e0",x"3f",x"2a",                   --     or B, 0x2a3f
	/* 323 */ x"60",x"20",x"1c",x"27",                         --     mov A, 0x0027 # test_39
	/* 327 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"bf",x"fa", --     jne $fail, B, 0xfabf
	/* 32f */                                                  --
	/* 32f */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 334 */ x"34",x"40",x"e0",x"3f",x"2a",                   --     xor B, 0x2a3f
	/* 339 */ x"60",x"20",x"1c",x"28",                         --     mov A, 0x0028 # test_40
	/* 33d */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"92",x"da", --     jne $fail, B, 0xda92
	/* 345 */                                                  --
	/* 345 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 34a */ x"38",x"40",                                     --     neg B
	/* 34c */ x"60",x"20",x"1c",x"29",                         --     mov A, 0x0029 # test_41
	/* 350 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"53",x"0f", --     jne $fail, B, 0x0f53
	/* 358 */                                                  --
	/* 358 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 35d */ x"3c",x"40",                                     --     not B
	/* 35f */ x"60",x"20",x"1c",x"2a",                         --     mov A, 0x002a # test_42
	/* 363 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"52",x"0f", --     jne $fail, B, 0x0f52
	/* 36b */                                                  --
	/* 36b */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 370 */ x"40",x"40",                                     --     bool B
	/* 372 */ x"60",x"20",x"1c",x"2b",                         --     mov A, 0x002b # test_43
	/* 376 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"01",       --     jne $fail, B, 0x0001
	/* 37d */                                                  --
	/* 37d */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 382 */ x"44",x"40",                                     --     inc B
	/* 384 */ x"60",x"20",x"1c",x"2c",                         --     mov A, 0x002c # test_44
	/* 388 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"ae",x"f0", --     jne $fail, B, 0xf0ae
	/* 390 */                                                  --
	/* 390 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 395 */ x"48",x"40",                                     --     dec B
	/* 397 */ x"60",x"20",x"1c",x"2d",                         --     mov A, 0x002d # test_45
	/* 39b */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"ac",x"f0", --     jne $fail, B, 0xf0ac
	/* 3a3 */                                                  --
	/* 3a3 */                                                  --      # t=False, a=0000, b=dead
	/* 3a3 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3a7 */ x"00",x"40",x"e0",x"ad",x"de",                   --     add B, 0xdead
	/* 3ac */ x"60",x"20",x"1c",x"2e",                         --     mov A, 0x002e # test_46
	/* 3b0 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"ad",x"de", --     jne $fail, B, 0xdead
	/* 3b8 */                                                  --
	/* 3b8 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3bc */ x"04",x"40",x"e0",x"ad",x"de",                   --     sub B, 0xdead
	/* 3c1 */ x"60",x"20",x"1c",x"2f",                         --     mov A, 0x002f # test_47
	/* 3c5 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"53",x"21", --     jne $fail, B, 0x2153
	/* 3cd */                                                  --
	/* 3cd */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3d1 */ x"08",x"40",x"e0",x"ad",x"de",                   --     mul B, 0xdead
	/* 3d6 */ x"60",x"20",x"1c",x"30",                         --     mov A, 0x0030 # test_48
	/* 3da */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"00",       --     jne $fail, B, 0x0000
	/* 3e1 */ x"ec",x"e0",x"80",x"1c",x"05",x"d0",x"00",       --     jne $fail, D, 0x0000
	/* 3e8 */                                                  --
	/* 3e8 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3ec */ x"0c",x"40",x"e0",x"ad",x"de",                   --     imul B, 0xdead
	/* 3f1 */ x"60",x"20",x"1c",x"31",                         --     mov A, 0x0031 # test_49
	/* 3f5 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"00",       --     jne $fail, B, 0x0000
	/* 3fc */ x"ec",x"e0",x"80",x"1c",x"05",x"d0",x"00",       --     jne $fail, D, 0x0000
	/* 403 */                                                  --
	/* 403 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 407 */ x"20",x"40",x"e0",x"ad",x"de",                   --     shr B, 0xdead
	/* 40c */ x"60",x"20",x"1c",x"32",                         --     mov A, 0x0032 # test_50
	/* 410 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"00",       --     jne $fail, B, 0x0000
	/* 417 */                                                  --
	/* 417 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 41b */ x"24",x"40",x"e0",x"ad",x"de",                   --     ishr B, 0xdead
	/* 420 */ x"60",x"20",x"1c",x"33",                         --     mov A, 0x0033 # test_51
	/* 424 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"00",       --     jne $fail, B, 0x0000
	/* 42b */                                                  --
	/* 42b */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 42f */ x"28",x"40",x"e0",x"ad",x"de",                   --     shl B, 0xdead
	/* 434 */ x"60",x"20",x"1c",x"34",                         --     mov A, 0x0034 # test_52
	/* 438 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"00",       --     jne $fail, B, 0x0000
	/* 43f */                                                  --
	/* 43f */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 443 */ x"2c",x"40",x"e0",x"ad",x"de",                   --     and B, 0xdead
	/* 448 */ x"60",x"20",x"1c",x"35",                         --     mov A, 0x0035 # test_53
	/* 44c */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"00",       --     jne $fail, B, 0x0000
	/* 453 */                                                  --
	/* 453 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 457 */ x"30",x"40",x"e0",x"ad",x"de",                   --     or B, 0xdead
	/* 45c */ x"60",x"20",x"1c",x"36",                         --     mov A, 0x0036 # test_54
	/* 460 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"ad",x"de", --     jne $fail, B, 0xdead
	/* 468 */                                                  --
	/* 468 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 46c */ x"34",x"40",x"e0",x"ad",x"de",                   --     xor B, 0xdead
	/* 471 */ x"60",x"20",x"1c",x"37",                         --     mov A, 0x0037 # test_55
	/* 475 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"ad",x"de", --     jne $fail, B, 0xdead
	/* 47d */                                                  --
	/* 47d */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 481 */ x"38",x"40",                                     --     neg B
	/* 483 */ x"60",x"20",x"1c",x"38",                         --     mov A, 0x0038 # test_56
	/* 487 */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"00",       --     jne $fail, B, 0x0000
	/* 48e */                                                  --
	/* 48e */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 492 */ x"3c",x"40",                                     --     not B
	/* 494 */ x"60",x"20",x"1c",x"39",                         --     mov A, 0x0039 # test_57
	/* 498 */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"ff",x"ff", --     jne $fail, B, 0xffff
	/* 4a0 */                                                  --
	/* 4a0 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 4a4 */ x"40",x"40",                                     --     bool B
	/* 4a6 */ x"60",x"20",x"1c",x"3a",                         --     mov A, 0x003a # test_58
	/* 4aa */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"00",       --     jne $fail, B, 0x0000
	/* 4b1 */                                                  --
	/* 4b1 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 4b5 */ x"44",x"40",                                     --     inc B
	/* 4b7 */ x"60",x"20",x"1c",x"3b",                         --     mov A, 0x003b # test_59
	/* 4bb */ x"ec",x"e0",x"40",x"1c",x"05",x"d0",x"01",       --     jne $fail, B, 0x0001
	/* 4c2 */                                                  --
	/* 4c2 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 4c6 */ x"48",x"40",                                     --     dec B
	/* 4c8 */ x"60",x"20",x"1c",x"3c",                         --     mov A, 0x003c # test_60
	/* 4cc */ x"ec",x"e0",x"40",x"e0",x"05",x"d0",x"ff",x"ff", --     jne $fail, B, 0xffff
	/* 4d4 */                                                  --
	/* 4d4 */                                                  -- end_of_test::
	/* 4d4 */ x"58",x"e0",x"06",x"d0",                         --     jmp $success
	/* 4d8 */                                                  --
	/* 4d8 */ x"d8"                                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
