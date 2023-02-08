
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is
-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 1955;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*     */                                                  -- .offset 0xD000
	/*     */                                                  -- .boot:
	/*   0 */ x"60",x"20",x"e0",x"fa",x"ff",                   --     mov A, 0xFFFA
	/*   5 */ x"ec",x"20",x"e0",x"e0",x"fa",x"00",x"26",x"d0", --     jne A, 0x00FA, $start_test
	/*     */                                                  -- fail:
	/*     */                                                  --     # register A contains failed test
	/*   d */ x"d8",                                           --     halt
	/*   e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- success:
	/*  12 */ x"60",x"20",x"e0",x"ab",x"00",                   --     mov A, 0xAB
	/*  17 */ x"60",x"40",x"e0",x"cd",x"00",                   --     mov B, 0xCD
	/*  1c */ x"60",x"60",x"e0",x"ef",x"00",                   --     mov C, 0xEF
	/*  21 */ x"60",x"80",x"1c",x"55",                         --     mov D, 0x55
	/*  25 */ x"d8",                                           --     halt
	/*     */                                                  -- start_test:
	/*     */                                                  -- alu_test:
	/*     */                                                  --      # t=True, a=d230, b=a012
	/*  26 */ x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     add B, 0xd230, 0xa012
	/*  2e */ x"ec",x"40",x"e0",x"e0",x"42",x"72",x"0d",x"d0", --     jne B, 0x7242, $fail
	/*     */                                                  --
	/*  36 */ x"84",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     sub B, 0xd230, 0xa012
	/*  3e */ x"ec",x"40",x"e0",x"e0",x"1e",x"32",x"0d",x"d0", --     jne B, 0x321e, $fail
	/*     */                                                  --
	/*  46 */ x"88",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     mul B, 0xd230, 0xa012
	/*  4e */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0d",x"d0", --     jne B, 0xc760, $fail
	/*  56 */ x"ec",x"80",x"e0",x"e0",x"6c",x"83",x"0d",x"d0", --     jne D, 0x836c, $fail
	/*     */                                                  --
	/*  5e */ x"8c",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     imul B, 0xd230, 0xa012
	/*  66 */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0d",x"d0", --     jne B, 0xc760, $fail
	/*  6e */ x"ec",x"80",x"e0",x"e0",x"2a",x"11",x"0d",x"d0", --     jne D, 0x112a, $fail
	/*     */                                                  --
	/*  76 */ x"a0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shr B, 0xd230, 0xa012
	/*  7e */ x"ec",x"40",x"e0",x"e0",x"8c",x"34",x"0d",x"d0", --     jne B, 0x348c, $fail
	/*     */                                                  --
	/*  86 */ x"a4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     ishr B, 0xd230, 0xa012
	/*  8e */ x"ec",x"40",x"e0",x"e0",x"8c",x"f4",x"0d",x"d0", --     jne B, 0xf48c, $fail
	/*     */                                                  --
	/*  96 */ x"a8",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shl B, 0xd230, 0xa012
	/*  9e */ x"ec",x"40",x"e0",x"e0",x"c0",x"48",x"0d",x"d0", --     jne B, 0x48c0, $fail
	/*     */                                                  --
	/*  a6 */ x"ac",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     and B, 0xd230, 0xa012
	/*  ae */ x"ec",x"40",x"e0",x"e0",x"10",x"80",x"0d",x"d0", --     jne B, 0x8010, $fail
	/*     */                                                  --
	/*  b6 */ x"b0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     or B, 0xd230, 0xa012
	/*  be */ x"ec",x"40",x"e0",x"e0",x"32",x"f2",x"0d",x"d0", --     jne B, 0xf232, $fail
	/*     */                                                  --
	/*  c6 */ x"b4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     xor B, 0xd230, 0xa012
	/*  ce */ x"ec",x"40",x"e0",x"e0",x"22",x"72",x"0d",x"d0", --     jne B, 0x7222, $fail
	/*     */                                                  --
	/*  d6 */ x"b8",x"40",x"e0",x"30",x"d2",                   --     neg B, 0xd230
	/*  db */ x"ec",x"40",x"e0",x"e0",x"d0",x"2d",x"0d",x"d0", --     jne B, 0x2dd0, $fail
	/*     */                                                  --
	/*  e3 */ x"bc",x"40",x"e0",x"30",x"d2",                   --     not B, 0xd230
	/*  e8 */ x"ec",x"40",x"e0",x"e0",x"cf",x"2d",x"0d",x"d0", --     jne B, 0x2dcf, $fail
	/*     */                                                  --
	/*  f0 */ x"c0",x"40",x"e0",x"30",x"d2",                   --     bool B, 0xd230
	/*  f5 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/*  fc */ x"c4",x"40",x"e0",x"30",x"d2",                   --     inc B, 0xd230
	/* 101 */ x"ec",x"40",x"e0",x"e0",x"31",x"d2",x"0d",x"d0", --     jne B, 0xd231, $fail
	/*     */                                                  --
	/* 109 */ x"c8",x"40",x"e0",x"30",x"d2",                   --     dec B, 0xd230
	/* 10e */ x"ec",x"40",x"e0",x"e0",x"2f",x"d2",x"0d",x"d0", --     jne B, 0xd22f, $fail
	/*     */                                                  --
	/*     */                                                  --      # t=True, a=00ad, b=da37
	/* 116 */ x"80",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     add B, 0x00ad, 0xda37
	/* 11e */ x"ec",x"40",x"e0",x"e0",x"e4",x"da",x"0d",x"d0", --     jne B, 0xdae4, $fail
	/*     */                                                  --
	/* 126 */ x"84",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     sub B, 0x00ad, 0xda37
	/* 12e */ x"ec",x"40",x"e0",x"e0",x"76",x"26",x"0d",x"d0", --     jne B, 0x2676, $fail
	/*     */                                                  --
	/* 136 */ x"88",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     mul B, 0x00ad, 0xda37
	/* 13e */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0d",x"d0", --     jne B, 0x772b, $fail
	/* 146 */ x"ec",x"80",x"e0",x"e0",x"93",x"00",x"0d",x"d0", --     jne D, 0x0093, $fail
	/*     */                                                  --
	/* 14e */ x"8c",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     imul B, 0x00ad, 0xda37
	/* 156 */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0d",x"d0", --     jne B, 0x772b, $fail
	/* 15e */ x"ec",x"80",x"e0",x"e0",x"e6",x"ff",x"0d",x"d0", --     jne D, 0xffe6, $fail
	/*     */                                                  --
	/* 166 */ x"a0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     shr B, 0x00ad, 0xda37
	/* 16e */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 175 */ x"a4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     ishr B, 0x00ad, 0xda37
	/* 17d */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 184 */ x"a8",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     shl B, 0x00ad, 0xda37
	/* 18c */ x"ec",x"40",x"e0",x"e0",x"80",x"56",x"0d",x"d0", --     jne B, 0x5680, $fail
	/*     */                                                  --
	/* 194 */ x"ac",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     and B, 0x00ad, 0xda37
	/* 19c */ x"ec",x"40",x"1c",x"e0",x"25",x"0d",x"d0",       --     jne B, 0x0025, $fail
	/*     */                                                  --
	/* 1a3 */ x"b0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     or B, 0x00ad, 0xda37
	/* 1ab */ x"ec",x"40",x"e0",x"e0",x"bf",x"da",x"0d",x"d0", --     jne B, 0xdabf, $fail
	/*     */                                                  --
	/* 1b3 */ x"b4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     xor B, 0x00ad, 0xda37
	/* 1bb */ x"ec",x"40",x"e0",x"e0",x"9a",x"da",x"0d",x"d0", --     jne B, 0xda9a, $fail
	/*     */                                                  --
	/* 1c3 */ x"b8",x"40",x"e0",x"ad",x"00",                   --     neg B, 0x00ad
	/* 1c8 */ x"ec",x"40",x"e0",x"e0",x"53",x"ff",x"0d",x"d0", --     jne B, 0xff53, $fail
	/*     */                                                  --
	/* 1d0 */ x"bc",x"40",x"e0",x"ad",x"00",                   --     not B, 0x00ad
	/* 1d5 */ x"ec",x"40",x"e0",x"e0",x"52",x"ff",x"0d",x"d0", --     jne B, 0xff52, $fail
	/*     */                                                  --
	/* 1dd */ x"c0",x"40",x"e0",x"ad",x"00",                   --     bool B, 0x00ad
	/* 1e2 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 1e9 */ x"c4",x"40",x"e0",x"ad",x"00",                   --     inc B, 0x00ad
	/* 1ee */ x"ec",x"40",x"e0",x"e0",x"ae",x"00",x"0d",x"d0", --     jne B, 0x00ae, $fail
	/*     */                                                  --
	/* 1f6 */ x"c8",x"40",x"e0",x"ad",x"00",                   --     dec B, 0x00ad
	/* 1fb */ x"ec",x"40",x"e0",x"e0",x"ac",x"00",x"0d",x"d0", --     jne B, 0x00ac, $fail
	/*     */                                                  --
	/*     */                                                  --      # t=False, a=f0ad, b=2a3f
	/* 203 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 208 */ x"00",x"40",x"e0",x"3f",x"2a",                   --     add B, 0x2a3f
	/* 20d */ x"ec",x"40",x"e0",x"e0",x"ec",x"1a",x"0d",x"d0", --     jne B, 0x1aec, $fail
	/*     */                                                  --
	/* 215 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 21a */ x"04",x"40",x"e0",x"3f",x"2a",                   --     sub B, 0x2a3f
	/* 21f */ x"ec",x"40",x"e0",x"e0",x"6e",x"c6",x"0d",x"d0", --     jne B, 0xc66e, $fail
	/*     */                                                  --
	/* 227 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 22c */ x"08",x"40",x"e0",x"3f",x"2a",                   --     mul B, 0x2a3f
	/* 231 */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0d",x"d0", --     jne B, 0x9c93, $fail
	/* 239 */ x"ec",x"80",x"e0",x"e0",x"b7",x"27",x"0d",x"d0", --     jne D, 0x27b7, $fail
	/*     */                                                  --
	/* 241 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 246 */ x"0c",x"40",x"e0",x"3f",x"2a",                   --     imul B, 0x2a3f
	/* 24b */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0d",x"d0", --     jne B, 0x9c93, $fail
	/* 253 */ x"ec",x"80",x"e0",x"e0",x"78",x"fd",x"0d",x"d0", --     jne D, 0xfd78, $fail
	/*     */                                                  --
	/* 25b */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 260 */ x"20",x"40",x"e0",x"3f",x"2a",                   --     shr B, 0x2a3f
	/* 265 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 26c */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 271 */ x"24",x"40",x"e0",x"3f",x"2a",                   --     ishr B, 0x2a3f
	/* 276 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*     */                                                  --
	/* 27e */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 283 */ x"28",x"40",x"e0",x"3f",x"2a",                   --     shl B, 0x2a3f
	/* 288 */ x"ec",x"40",x"e0",x"e0",x"00",x"80",x"0d",x"d0", --     jne B, 0x8000, $fail
	/*     */                                                  --
	/* 290 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 295 */ x"2c",x"40",x"e0",x"3f",x"2a",                   --     and B, 0x2a3f
	/* 29a */ x"ec",x"40",x"e0",x"e0",x"2d",x"20",x"0d",x"d0", --     jne B, 0x202d, $fail
	/*     */                                                  --
	/* 2a2 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2a7 */ x"30",x"40",x"e0",x"3f",x"2a",                   --     or B, 0x2a3f
	/* 2ac */ x"ec",x"40",x"e0",x"e0",x"bf",x"fa",x"0d",x"d0", --     jne B, 0xfabf, $fail
	/*     */                                                  --
	/* 2b4 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2b9 */ x"34",x"40",x"e0",x"3f",x"2a",                   --     xor B, 0x2a3f
	/* 2be */ x"ec",x"40",x"e0",x"e0",x"92",x"da",x"0d",x"d0", --     jne B, 0xda92, $fail
	/*     */                                                  --
	/* 2c6 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2cb */ x"38",x"40",                                     --     neg B
	/* 2cd */ x"ec",x"40",x"e0",x"e0",x"53",x"0f",x"0d",x"d0", --     jne B, 0x0f53, $fail
	/*     */                                                  --
	/* 2d5 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2da */ x"3c",x"40",                                     --     not B
	/* 2dc */ x"ec",x"40",x"e0",x"e0",x"52",x"0f",x"0d",x"d0", --     jne B, 0x0f52, $fail
	/*     */                                                  --
	/* 2e4 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2e9 */ x"40",x"40",                                     --     bool B
	/* 2eb */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 2f2 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2f7 */ x"44",x"40",                                     --     inc B
	/* 2f9 */ x"ec",x"40",x"e0",x"e0",x"ae",x"f0",x"0d",x"d0", --     jne B, 0xf0ae, $fail
	/*     */                                                  --
	/* 301 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 306 */ x"48",x"40",                                     --     dec B
	/* 308 */ x"ec",x"40",x"e0",x"e0",x"ac",x"f0",x"0d",x"d0", --     jne B, 0xf0ac, $fail
	/*     */                                                  --
	/*     */                                                  --      # t=False, a=0000, b=dead
	/* 310 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 314 */ x"00",x"40",x"e0",x"ad",x"de",                   --     add B, 0xdead
	/* 319 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*     */                                                  --
	/* 321 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 325 */ x"04",x"40",x"e0",x"ad",x"de",                   --     sub B, 0xdead
	/* 32a */ x"ec",x"40",x"e0",x"e0",x"53",x"21",x"0d",x"d0", --     jne B, 0x2153, $fail
	/*     */                                                  --
	/* 332 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 336 */ x"08",x"40",x"e0",x"ad",x"de",                   --     mul B, 0xdead
	/* 33b */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/* 342 */ x"ec",x"80",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne D, 0x0000, $fail
	/*     */                                                  --
	/* 349 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 34d */ x"0c",x"40",x"e0",x"ad",x"de",                   --     imul B, 0xdead
	/* 352 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/* 359 */ x"ec",x"80",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne D, 0x0000, $fail
	/*     */                                                  --
	/* 360 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 364 */ x"20",x"40",x"e0",x"ad",x"de",                   --     shr B, 0xdead
	/* 369 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 370 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 374 */ x"24",x"40",x"e0",x"ad",x"de",                   --     ishr B, 0xdead
	/* 379 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 380 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 384 */ x"28",x"40",x"e0",x"ad",x"de",                   --     shl B, 0xdead
	/* 389 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 390 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 394 */ x"2c",x"40",x"e0",x"ad",x"de",                   --     and B, 0xdead
	/* 399 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 3a0 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3a4 */ x"30",x"40",x"e0",x"ad",x"de",                   --     or B, 0xdead
	/* 3a9 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*     */                                                  --
	/* 3b1 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3b5 */ x"34",x"40",x"e0",x"ad",x"de",                   --     xor B, 0xdead
	/* 3ba */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*     */                                                  --
	/* 3c2 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3c6 */ x"38",x"40",                                     --     neg B
	/* 3c8 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 3cf */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3d3 */ x"3c",x"40",                                     --     not B
	/* 3d5 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*     */                                                  --
	/* 3dd */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3e1 */ x"40",x"40",                                     --     bool B
	/* 3e3 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 3ea */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3ee */ x"44",x"40",                                     --     inc B
	/* 3f0 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 3f7 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3fb */ x"48",x"40",                                     --     dec B
	/* 3fd */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*     */                                                  --
	/*     */                                                  -- jmp_test:
	/* 405 */ x"e8",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jeq 0xffab, 0x002b, $fail
	/* 40e */ x"ec",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"1b",x"d4", --     jne 0xffab, 0x002b, $_L_test_jmp_1
	/* 417 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_1:
	/* 41b */ x"f0",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jlt 0xffab, 0x002b, $fail
	/* 424 */ x"f4",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jle 0xffab, 0x002b, $fail
	/* 42d */ x"f8",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"3a",x"d4", --     jgt 0xffab, 0x002b, $_L_test_jmp_2
	/* 436 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_2:
	/* 43a */ x"fc",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"47",x"d4", --     jge 0xffab, 0x002b, $_L_test_jmp_3
	/* 443 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_3:
	/* 447 */ x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             --     cmp 0xffab, 0x002b
	/* 44d */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* 451 */ x"6c",x"e0",x"59",x"d4",                         --     jne $_L_test_jmp_4
	/* 455 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_4:
	/* 459 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* 45d */ x"74",x"e0",x"0d",x"d0",                         --     jle $fail
	/* 461 */ x"78",x"e0",x"69",x"d4",                         --     jgt $_L_test_jmp_5
	/* 465 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_5:
	/* 469 */ x"7c",x"e0",x"71",x"d4",                         --     jge $_L_test_jmp_6
	/* 46d */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_6:
	/* 471 */ x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             --     icmp 0xffab, 0x002b
	/* 477 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* 47b */ x"6c",x"e0",x"83",x"d4",                         --     jne $_L_test_jmp_7
	/* 47f */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_7:
	/* 483 */ x"70",x"e0",x"8b",x"d4",                         --     jlt $_L_test_jmp_8
	/* 487 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_8:
	/* 48b */ x"74",x"e0",x"93",x"d4",                         --     jle $_L_test_jmp_9
	/* 48f */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_9:
	/* 493 */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* 497 */ x"7c",x"e0",x"0d",x"d0",                         --     jge $fail
	/* 49b */ x"e8",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jeq 0x002b, 0xffab, $fail
	/* 4a4 */ x"ec",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"b1",x"d4", --     jne 0x002b, 0xffab, $_L_test_jmp_10
	/* 4ad */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_10:
	/* 4b1 */ x"f0",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"be",x"d4", --     jlt 0x002b, 0xffab, $_L_test_jmp_11
	/* 4ba */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_11:
	/* 4be */ x"f4",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"cb",x"d4", --     jle 0x002b, 0xffab, $_L_test_jmp_12
	/* 4c7 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_12:
	/* 4cb */ x"f8",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jgt 0x002b, 0xffab, $fail
	/* 4d4 */ x"fc",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jge 0x002b, 0xffab, $fail
	/* 4dd */ x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             --     cmp 0x002b, 0xffab
	/* 4e3 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* 4e7 */ x"6c",x"e0",x"ef",x"d4",                         --     jne $_L_test_jmp_13
	/* 4eb */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_13:
	/* 4ef */ x"70",x"e0",x"f7",x"d4",                         --     jlt $_L_test_jmp_14
	/* 4f3 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_14:
	/* 4f7 */ x"74",x"e0",x"ff",x"d4",                         --     jle $_L_test_jmp_15
	/* 4fb */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_15:
	/* 4ff */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* 503 */ x"7c",x"e0",x"0d",x"d0",                         --     jge $fail
	/* 507 */ x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             --     icmp 0x002b, 0xffab
	/* 50d */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* 511 */ x"6c",x"e0",x"19",x"d5",                         --     jne $_L_test_jmp_16
	/* 515 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_16:
	/* 519 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* 51d */ x"74",x"e0",x"0d",x"d0",                         --     jle $fail
	/* 521 */ x"78",x"e0",x"29",x"d5",                         --     jgt $_L_test_jmp_17
	/* 525 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_17:
	/* 529 */ x"7c",x"e0",x"31",x"d5",                         --     jge $_L_test_jmp_18
	/* 52d */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_18:
	/* 531 */ x"e8",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"3f",x"d5", --     jeq 0xffab, 0xffab, $_L_test_jmp_19
	/* 53b */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_19:
	/* 53f */ x"ec",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jne 0xffab, 0xffab, $fail
	/* 549 */ x"f0",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jlt 0xffab, 0xffab, $fail
	/* 553 */ x"f4",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"61",x"d5", --     jle 0xffab, 0xffab, $_L_test_jmp_20
	/* 55d */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_20:
	/* 561 */ x"f8",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jgt 0xffab, 0xffab, $fail
	/* 56b */ x"fc",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"79",x"d5", --     jge 0xffab, 0xffab, $_L_test_jmp_21
	/* 575 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_21:
	/* 579 */ x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     cmp 0xffab, 0xffab
	/* 580 */ x"68",x"e0",x"88",x"d5",                         --     jeq $_L_test_jmp_22
	/* 584 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_22:
	/* 588 */ x"6c",x"e0",x"0d",x"d0",                         --     jne $fail
	/* 58c */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* 590 */ x"74",x"e0",x"98",x"d5",                         --     jle $_L_test_jmp_23
	/* 594 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_23:
	/* 598 */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* 59c */ x"7c",x"e0",x"a4",x"d5",                         --     jge $_L_test_jmp_24
	/* 5a0 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_24:
	/* 5a4 */ x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     icmp 0xffab, 0xffab
	/* 5ab */ x"68",x"e0",x"b3",x"d5",                         --     jeq $_L_test_jmp_25
	/* 5af */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_25:
	/* 5b3 */ x"6c",x"e0",x"0d",x"d0",                         --     jne $fail
	/* 5b7 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* 5bb */ x"74",x"e0",x"c3",x"d5",                         --     jle $_L_test_jmp_26
	/* 5bf */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_26:
	/* 5c3 */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* 5c7 */ x"7c",x"e0",x"cf",x"d5",                         --     jge $_L_test_jmp_27
	/* 5cb */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_27:
	/*     */                                                  --
	/*     */                                                  -- # BEGIN test_call_ret.asm
	/*     */                                                  -- test_call_ret:
	/*     */                                                  --
	/* 5cf */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* 5d4 */ x"5c",x"e0",x"4b",x"d6",                         --     call $fn_test_target
	/* 5d8 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*     */                                                  --
	/* 5e0 */ x"60",x"20",x"1c",x"0a",                         --     mov A, 10
	/* 5e4 */ x"60",x"40",x"00",                               --     mov B, 0
	/* 5e7 */ x"60",x"60",x"00",                               --     mov C, 0
	/* 5ea */ x"60",x"80",x"00",                               --     mov D, 0
	/* 5ed */ x"5c",x"e0",x"1a",x"d6",                         --     call $fn_recursive
	/*     */                                                  --
	/* 5f1 */ x"ec",x"20",x"00",x"e0",x"0d",x"d0",             --     jne A, 0, $fail
	/* 5f7 */ x"ec",x"40",x"e0",x"e0",x"3f",x"cf",x"0d",x"d0", --     jne B, 0xcf3f, $fail
	/* 5ff */ x"ec",x"60",x"1c",x"e0",x"2d",x"0d",x"d0",       --     jne C, 0x002d, $fail
	/* 606 */ x"ec",x"80",x"e0",x"e0",x"97",x"45",x"0d",x"d0", --     jne D, 0x4597, $fail
	/* 60e */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*     */                                                  --
	/* 616 */ x"58",x"e0",x"58",x"d6",                         --     jmp $test_call_ret_end
	/*     */                                                  --
	/*     */                                                  -- fn_recursive:
	/* 61a */ x"04",x"20",x"1c",x"01",                         --     sub A, 1
	/* 61e */ x"5c",x"e0",x"43",x"d6",                         --     call $fn_process_c
	/* 622 */ x"e8",x"20",x"00",x"e0",x"3e",x"d6",             --     jeq A, 0, $fn_recursive_end
	/* 628 */ x"5c",x"e0",x"1a",x"d6",                         --     call $fn_recursive
	/* 62c */ x"00",x"80",x"60",                               --     add D, C
	/* 62f */ x"08",x"80",x"1c",x"03",                         --     mul D, 3
	/* 633 */ x"00",x"40",x"80",                               --     add B, D
	/* 636 */ x"e0",x"80",                                     --     push D
	/* 638 */ x"08",x"40",x"1c",x"05",                         --     mul B, 5
	/* 63c */ x"e4",x"80",                                     --     pop D
	/*     */                                                  -- fn_recursive_end:
	/* 63e */ x"dc",                                           --     ret
	/* 63f */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  --
	/*     */                                                  -- fn_process_c:
	/* 643 */ x"00",x"60",x"20",                               --     add C, A
	/* 646 */ x"dc",                                           --     ret
	/* 647 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  --
	/*     */                                                  -- fn_test_target:
	/* 64b */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0x0ffe, $fail
	/* 653 */ x"dc",                                           --     ret
	/* 654 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  --
	/*     */                                                  -- test_call_ret_end:
	/*     */                                                  -- # END test_call_ret.asm
	/*     */                                                  --
	/*     */                                                  --
	/*     */                                                  -- # BEGIN test_mem_access.asm
	/*     */                                                  -- test_mem_access:
	/* 658 */ x"62",x"e0",x"e0",x"00",x"01",x"ed",x"ff",       --     mov [0x100], 0xFFED
	/* 65f */ x"ee",x"e0",x"e0",x"e0",x"00",x"01",x"aa",x"00",x"6d",x"d6", --     jne [0x100], 0x00AA, $test_mem_access_check_jmp
	/* 669 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- test_mem_access_check_jmp:
	/*     */                                                  --
	/* 66d */ x"62",x"e0",x"00",x"00",x"10",                   --     mov [0x1000], 0
	/* 672 */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* 677 */ x"ee",x"a0",x"00",x"e0",x"0d",x"d0",             --     jne [SP], 0, $fail
	/* 67d */ x"e0",x"00",                                     --     push 0
	/* 67f */ x"e0",x"00",                                     --     push 0
	/* 681 */ x"e0",x"00",                                     --     push 0
	/* 683 */ x"e4",x"20",                                     --     pop A
	/* 685 */ x"e4",x"20",                                     --     pop A
	/* 687 */ x"e4",x"20",                                     --     pop A
	/* 689 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/* 691 */ x"ec",x"20",x"00",x"e0",x"0d",x"d0",             --     jne A, 0, $fail
	/*     */                                                  --
	/* 697 */ x"e0",x"e0",x"02",x"01",                         --     push 0x0102
	/* 69b */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0xFFE, $fail
	/* 6a3 */ x"e0",x"e0",x"04",x"03",                         --     push 0x0304
	/* 6a7 */ x"ec",x"a0",x"e0",x"e0",x"fc",x"0f",x"0d",x"d0", --     jne SP, 0xFFC, $fail
	/*     */                                                  --
	/* 6af */ x"ee",x"e0",x"e0",x"e0",x"fe",x"0f",x"02",x"01",x"0d",x"d0", --     jne [0xFFE], 0x0102, $fail
	/* 6b9 */ x"ee",x"e0",x"e0",x"e0",x"fc",x"0f",x"04",x"03",x"0d",x"d0", --     jne [0xFFC], 0x0304, $fail
	/*     */                                                  --
	/*     */                                                  --     # unaligned
	/* 6c3 */ x"ee",x"e0",x"e0",x"e0",x"fb",x"0f",x"00",x"04",x"0d",x"d0", --     jne [0xFFB], 0x0400, $fail
	/* 6cd */ x"ee",x"e0",x"e0",x"e0",x"fd",x"0f",x"03",x"02",x"0d",x"d0", --     jne [0xFFD], 0x0203, $fail
	/* 6d7 */ x"ee",x"e0",x"1c",x"e0",x"ff",x"0f",x"01",x"0d",x"d0", --     jne [0xFFF], 0x0001, $fail
	/*     */                                                  --
	/* 6e0 */ x"e4",x"20",                                     --     pop A
	/* 6e2 */ x"ec",x"20",x"e0",x"e0",x"04",x"03",x"0d",x"d0", --     jne A, 0x0304, $fail
	/* 6ea */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0xFFE, $fail
	/* 6f2 */ x"e4",x"20",                                     --     pop A
	/* 6f4 */ x"ec",x"20",x"e0",x"e0",x"02",x"01",x"0d",x"d0", --     jne A, 0x0102, $fail
	/* 6fc */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*     */                                                  --
	/*     */                                                  -- # END test_mem_access.asm
	/*     */                                                  --
	/*     */                                                  --
	/*     */                                                  -- # BEGIN test_cmp.asm
	/*     */                                                  -- test_cmp:
	/* 704 */ x"cc",x"e0",x"ff",x"ff",                         --     setf 0xFFFF
	/* 708 */ x"4c",x"20",                                     --     getf A
	/* 70a */ x"ec",x"20",x"1c",x"e0",x"3f",x"0d",x"d0",       --     jne A, 0x3F, $fail
	/*     */                                                  --
	/* 711 */ x"cc",x"e0",x"ab",x"ab",                         --     setf 0xABAB
	/* 715 */ x"4c",x"20",                                     --     getf A
	/* 717 */ x"ec",x"20",x"1c",x"e0",x"2b",x"0d",x"d0",       --     jne A, 0x2B, $fail
	/*     */                                                  --
	/*     */                                                  --     # unsigned
	/* 71e */ x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             --     cmp 0xFFAB, 0x2B
	/* 724 */ x"4c",x"20",                                     --     getf A
	/*     */                                                  --     # GE GT LE LT NE EQ
	/* 726 */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*     */                                                  --
	/* 72d */ x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             --     cmp 0x2B, 0xFFAB
	/* 733 */ x"4c",x"20",                                     --     getf A
	/* 735 */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*     */                                                  --
	/* 73c */ x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     cmp 0xFFAB, 0xFFAB
	/* 743 */ x"4c",x"20",                                     --     getf A
	/* 745 */ x"ec",x"20",x"1c",x"e0",x"29",x"0d",x"d0",       --     jne A, 0b101001, $fail
	/*     */                                                  --
	/*     */                                                  --     # signed
	/* 74c */ x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             --     icmp 0xFFAB, 0x2B
	/* 752 */ x"4c",x"20",                                     --     getf A
	/*     */                                                  --     # GE GT LE LT NE EQ
	/* 754 */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*     */                                                  --
	/* 75b */ x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             --     icmp 0x2B, 0xFFAB
	/* 761 */ x"4c",x"20",                                     --     getf A
	/* 763 */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*     */                                                  --
	/* 76a */ x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     icmp 0xFFAB, 0xFFAB
	/* 771 */ x"4c",x"20",                                     --     getf A
	/* 773 */ x"ec",x"20",x"1c",x"e0",x"29",x"0d",x"d0",       --     jne A, 0b101001, $fail
	/*     */                                                  -- # END test_cmp.asm
	/*     */                                                  --
	/*     */                                                  -- end_of_test:
	/* 77a */ x"58",x"e0",x"12",x"d0",                         --     jmp $success
	/*     */                                                  --
	/*     */                                                  -- # BEGIN drive_led.asm
	/*     */                                                  -- drive_led:
	/* 77e */ x"60",x"20",x"e0",x"cc",x"00",                   --     mov A, 0xCC
	/* 783 */ x"60",x"60",x"00",                               --     mov C, 0
	/*     */                                                  -- drive_led_loop:
	/* 786 */ x"60",x"40",x"00",                               --     mov B, 0
	/*     */                                                  --     drive_led_inner_loop:
	/* 789 */ x"00",x"40",x"1c",x"01",                         --         add B, 1
	/* 78d */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"89",x"d7", --         jne B, 0xFFFF, $drive_led_inner_loop
	/*     */                                                  --
	/* 795 */ x"00",x"60",x"1c",x"01",                         --     add C, 1
	/* 799 */ x"a0",x"20",x"60",x"1c",x"04",                   --     shr A, C, 4
	/* 79e */ x"58",x"e0",x"86",x"d7",                         --     jmp $drive_led_loop
	/*     */                                                  -- # END drive_led.asm
	/*     */                                                  --
	/*     */                                                  --
	/* 7a2 */ x"d8"                                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
