
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is
-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 6573;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*     */                                                  --
	/*     */                                                  -- # BEGIN preamble.asm
	/*     */                                                  -- .offset 0xD000
	/*     */                                                  -- .boot:
	/*   0 */ x"60",x"20",x"e0",x"fa",x"ff",                   --     mov A, 0xFFFA
	/*   5 */ x"ec",x"20",x"e0",x"e0",x"fa",x"00",x"4f",x"d0", --     jne A, 0x00FA, $start_test
	/*     */                                                  -- fail:
	/*     */                                                  --     # register A contains failed test
	/*   d */ x"d8",                                           --     halt
	/*   e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- success:
	/*  12 */ x"ec",x"20",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne A, 0xDEAD, $fail  # check cookie
	/*  1a */ x"ec",x"40",x"e0",x"e0",x"ef",x"be",x"0d",x"d0", --     jne B, 0xBEEF, $fail
	/*  22 */ x"ec",x"60",x"e0",x"e0",x"83",x"49",x"0d",x"d0", --     jne C, 0x4983, $fail
	/*  2a */ x"ec",x"80",x"e0",x"e0",x"14",x"a6",x"0d",x"d0", --     jne D, 0xA614, $fail
	/*     */                                                  --     # okay!
	/*  32 */ x"00",x"20",x"e0",x"ab",x"ac",                   --     add A, 0xACAB
	/*  37 */ x"00",x"40",x"e0",x"cc",x"41",                   --     add B, 0x41CC
	/*  3c */ x"08",x"20",x"80",                               --     mul A, D
	/*  3f */ x"34",x"20",x"e0",x"4a",x"f2",                   --     xor A, 0xF24A
	/*  44 */ x"34",x"60",x"e0",x"4f",x"49",                   --     xor C, 0x494F
	/*  49 */ x"34",x"80",x"e0",x"30",x"5a",                   --     xor D, 0x5A30
	/*     */                                                  --     # A = 0x00aa
	/*     */                                                  --     # B = 0x00bb
	/*     */                                                  --     # C = 0x00cc
	/*     */                                                  --     # D = 0x0055
	/*  4e */ x"d8",                                           --     halt
	/*     */                                                  -- # END preamble.asm
	/*     */                                                  --
	/*     */                                                  -- start_test:
	/*     */                                                  -- alu_test:
	/*     */                                                  --      # t=True, a=d230, b=a012
	/*  4f */ x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     add B, 0xd230, 0xa012
	/*  57 */ x"ec",x"40",x"e0",x"e0",x"42",x"72",x"0d",x"d0", --     jne B, 0x7242, $fail
	/*     */                                                  --
	/*  5f */ x"84",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     sub B, 0xd230, 0xa012
	/*  67 */ x"ec",x"40",x"e0",x"e0",x"1e",x"32",x"0d",x"d0", --     jne B, 0x321e, $fail
	/*     */                                                  --
	/*  6f */ x"88",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     mul B, 0xd230, 0xa012
	/*  77 */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0d",x"d0", --     jne B, 0xc760, $fail
	/*  7f */ x"ec",x"80",x"e0",x"e0",x"6c",x"83",x"0d",x"d0", --     jne D, 0x836c, $fail
	/*     */                                                  --
	/*  87 */ x"8c",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     imul B, 0xd230, 0xa012
	/*  8f */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0d",x"d0", --     jne B, 0xc760, $fail
	/*  97 */ x"ec",x"80",x"e0",x"e0",x"2a",x"11",x"0d",x"d0", --     jne D, 0x112a, $fail
	/*     */                                                  --
	/*  9f */ x"a0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shr B, 0xd230, 0xa012
	/*  a7 */ x"ec",x"40",x"e0",x"e0",x"8c",x"34",x"0d",x"d0", --     jne B, 0x348c, $fail
	/*     */                                                  --
	/*  af */ x"a4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     ishr B, 0xd230, 0xa012
	/*  b7 */ x"ec",x"40",x"e0",x"e0",x"8c",x"f4",x"0d",x"d0", --     jne B, 0xf48c, $fail
	/*     */                                                  --
	/*  bf */ x"a8",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shl B, 0xd230, 0xa012
	/*  c7 */ x"ec",x"40",x"e0",x"e0",x"c0",x"48",x"0d",x"d0", --     jne B, 0x48c0, $fail
	/*     */                                                  --
	/*  cf */ x"ac",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     and B, 0xd230, 0xa012
	/*  d7 */ x"ec",x"40",x"e0",x"e0",x"10",x"80",x"0d",x"d0", --     jne B, 0x8010, $fail
	/*     */                                                  --
	/*  df */ x"b0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     or B, 0xd230, 0xa012
	/*  e7 */ x"ec",x"40",x"e0",x"e0",x"32",x"f2",x"0d",x"d0", --     jne B, 0xf232, $fail
	/*     */                                                  --
	/*  ef */ x"b4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     xor B, 0xd230, 0xa012
	/*  f7 */ x"ec",x"40",x"e0",x"e0",x"22",x"72",x"0d",x"d0", --     jne B, 0x7222, $fail
	/*     */                                                  --
	/*  ff */ x"b8",x"40",x"e0",x"30",x"d2",                   --     neg B, 0xd230
	/* 104 */ x"ec",x"40",x"e0",x"e0",x"d0",x"2d",x"0d",x"d0", --     jne B, 0x2dd0, $fail
	/*     */                                                  --
	/* 10c */ x"bc",x"40",x"e0",x"30",x"d2",                   --     not B, 0xd230
	/* 111 */ x"ec",x"40",x"e0",x"e0",x"cf",x"2d",x"0d",x"d0", --     jne B, 0x2dcf, $fail
	/*     */                                                  --
	/* 119 */ x"c0",x"40",x"e0",x"30",x"d2",                   --     bool B, 0xd230
	/* 11e */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 125 */ x"c4",x"40",x"e0",x"30",x"d2",                   --     inc B, 0xd230
	/* 12a */ x"ec",x"40",x"e0",x"e0",x"31",x"d2",x"0d",x"d0", --     jne B, 0xd231, $fail
	/*     */                                                  --
	/* 132 */ x"c8",x"40",x"e0",x"30",x"d2",                   --     dec B, 0xd230
	/* 137 */ x"ec",x"40",x"e0",x"e0",x"2f",x"d2",x"0d",x"d0", --     jne B, 0xd22f, $fail
	/*     */                                                  --
	/*     */                                                  --      # t=True, a=00ad, b=da37
	/* 13f */ x"80",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     add B, 0x00ad, 0xda37
	/* 147 */ x"ec",x"40",x"e0",x"e0",x"e4",x"da",x"0d",x"d0", --     jne B, 0xdae4, $fail
	/*     */                                                  --
	/* 14f */ x"84",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     sub B, 0x00ad, 0xda37
	/* 157 */ x"ec",x"40",x"e0",x"e0",x"76",x"26",x"0d",x"d0", --     jne B, 0x2676, $fail
	/*     */                                                  --
	/* 15f */ x"88",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     mul B, 0x00ad, 0xda37
	/* 167 */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0d",x"d0", --     jne B, 0x772b, $fail
	/* 16f */ x"ec",x"80",x"e0",x"e0",x"93",x"00",x"0d",x"d0", --     jne D, 0x0093, $fail
	/*     */                                                  --
	/* 177 */ x"8c",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     imul B, 0x00ad, 0xda37
	/* 17f */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0d",x"d0", --     jne B, 0x772b, $fail
	/* 187 */ x"ec",x"80",x"e0",x"e0",x"e6",x"ff",x"0d",x"d0", --     jne D, 0xffe6, $fail
	/*     */                                                  --
	/* 18f */ x"a0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     shr B, 0x00ad, 0xda37
	/* 197 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 19e */ x"a4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     ishr B, 0x00ad, 0xda37
	/* 1a6 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 1ad */ x"a8",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     shl B, 0x00ad, 0xda37
	/* 1b5 */ x"ec",x"40",x"e0",x"e0",x"80",x"56",x"0d",x"d0", --     jne B, 0x5680, $fail
	/*     */                                                  --
	/* 1bd */ x"ac",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     and B, 0x00ad, 0xda37
	/* 1c5 */ x"ec",x"40",x"1c",x"e0",x"25",x"0d",x"d0",       --     jne B, 0x0025, $fail
	/*     */                                                  --
	/* 1cc */ x"b0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     or B, 0x00ad, 0xda37
	/* 1d4 */ x"ec",x"40",x"e0",x"e0",x"bf",x"da",x"0d",x"d0", --     jne B, 0xdabf, $fail
	/*     */                                                  --
	/* 1dc */ x"b4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     xor B, 0x00ad, 0xda37
	/* 1e4 */ x"ec",x"40",x"e0",x"e0",x"9a",x"da",x"0d",x"d0", --     jne B, 0xda9a, $fail
	/*     */                                                  --
	/* 1ec */ x"b8",x"40",x"e0",x"ad",x"00",                   --     neg B, 0x00ad
	/* 1f1 */ x"ec",x"40",x"e0",x"e0",x"53",x"ff",x"0d",x"d0", --     jne B, 0xff53, $fail
	/*     */                                                  --
	/* 1f9 */ x"bc",x"40",x"e0",x"ad",x"00",                   --     not B, 0x00ad
	/* 1fe */ x"ec",x"40",x"e0",x"e0",x"52",x"ff",x"0d",x"d0", --     jne B, 0xff52, $fail
	/*     */                                                  --
	/* 206 */ x"c0",x"40",x"e0",x"ad",x"00",                   --     bool B, 0x00ad
	/* 20b */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 212 */ x"c4",x"40",x"e0",x"ad",x"00",                   --     inc B, 0x00ad
	/* 217 */ x"ec",x"40",x"e0",x"e0",x"ae",x"00",x"0d",x"d0", --     jne B, 0x00ae, $fail
	/*     */                                                  --
	/* 21f */ x"c8",x"40",x"e0",x"ad",x"00",                   --     dec B, 0x00ad
	/* 224 */ x"ec",x"40",x"e0",x"e0",x"ac",x"00",x"0d",x"d0", --     jne B, 0x00ac, $fail
	/*     */                                                  --
	/*     */                                                  --      # t=False, a=f0ad, b=2a3f
	/* 22c */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 231 */ x"00",x"40",x"e0",x"3f",x"2a",                   --     add B, 0x2a3f
	/* 236 */ x"ec",x"40",x"e0",x"e0",x"ec",x"1a",x"0d",x"d0", --     jne B, 0x1aec, $fail
	/*     */                                                  --
	/* 23e */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 243 */ x"04",x"40",x"e0",x"3f",x"2a",                   --     sub B, 0x2a3f
	/* 248 */ x"ec",x"40",x"e0",x"e0",x"6e",x"c6",x"0d",x"d0", --     jne B, 0xc66e, $fail
	/*     */                                                  --
	/* 250 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 255 */ x"08",x"40",x"e0",x"3f",x"2a",                   --     mul B, 0x2a3f
	/* 25a */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0d",x"d0", --     jne B, 0x9c93, $fail
	/* 262 */ x"ec",x"80",x"e0",x"e0",x"b7",x"27",x"0d",x"d0", --     jne D, 0x27b7, $fail
	/*     */                                                  --
	/* 26a */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 26f */ x"0c",x"40",x"e0",x"3f",x"2a",                   --     imul B, 0x2a3f
	/* 274 */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0d",x"d0", --     jne B, 0x9c93, $fail
	/* 27c */ x"ec",x"80",x"e0",x"e0",x"78",x"fd",x"0d",x"d0", --     jne D, 0xfd78, $fail
	/*     */                                                  --
	/* 284 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 289 */ x"20",x"40",x"e0",x"3f",x"2a",                   --     shr B, 0x2a3f
	/* 28e */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 295 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 29a */ x"24",x"40",x"e0",x"3f",x"2a",                   --     ishr B, 0x2a3f
	/* 29f */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*     */                                                  --
	/* 2a7 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2ac */ x"28",x"40",x"e0",x"3f",x"2a",                   --     shl B, 0x2a3f
	/* 2b1 */ x"ec",x"40",x"e0",x"e0",x"00",x"80",x"0d",x"d0", --     jne B, 0x8000, $fail
	/*     */                                                  --
	/* 2b9 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2be */ x"2c",x"40",x"e0",x"3f",x"2a",                   --     and B, 0x2a3f
	/* 2c3 */ x"ec",x"40",x"e0",x"e0",x"2d",x"20",x"0d",x"d0", --     jne B, 0x202d, $fail
	/*     */                                                  --
	/* 2cb */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2d0 */ x"30",x"40",x"e0",x"3f",x"2a",                   --     or B, 0x2a3f
	/* 2d5 */ x"ec",x"40",x"e0",x"e0",x"bf",x"fa",x"0d",x"d0", --     jne B, 0xfabf, $fail
	/*     */                                                  --
	/* 2dd */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2e2 */ x"34",x"40",x"e0",x"3f",x"2a",                   --     xor B, 0x2a3f
	/* 2e7 */ x"ec",x"40",x"e0",x"e0",x"92",x"da",x"0d",x"d0", --     jne B, 0xda92, $fail
	/*     */                                                  --
	/* 2ef */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 2f4 */ x"38",x"40",                                     --     neg B
	/* 2f6 */ x"ec",x"40",x"e0",x"e0",x"53",x"0f",x"0d",x"d0", --     jne B, 0x0f53, $fail
	/*     */                                                  --
	/* 2fe */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 303 */ x"3c",x"40",                                     --     not B
	/* 305 */ x"ec",x"40",x"e0",x"e0",x"52",x"0f",x"0d",x"d0", --     jne B, 0x0f52, $fail
	/*     */                                                  --
	/* 30d */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 312 */ x"40",x"40",                                     --     bool B
	/* 314 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 31b */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 320 */ x"44",x"40",                                     --     inc B
	/* 322 */ x"ec",x"40",x"e0",x"e0",x"ae",x"f0",x"0d",x"d0", --     jne B, 0xf0ae, $fail
	/*     */                                                  --
	/* 32a */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* 32f */ x"48",x"40",                                     --     dec B
	/* 331 */ x"ec",x"40",x"e0",x"e0",x"ac",x"f0",x"0d",x"d0", --     jne B, 0xf0ac, $fail
	/*     */                                                  --
	/*     */                                                  --      # t=False, a=0000, b=dead
	/* 339 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 33d */ x"00",x"40",x"e0",x"ad",x"de",                   --     add B, 0xdead
	/* 342 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*     */                                                  --
	/* 34a */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 34e */ x"04",x"40",x"e0",x"ad",x"de",                   --     sub B, 0xdead
	/* 353 */ x"ec",x"40",x"e0",x"e0",x"53",x"21",x"0d",x"d0", --     jne B, 0x2153, $fail
	/*     */                                                  --
	/* 35b */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 35f */ x"08",x"40",x"e0",x"ad",x"de",                   --     mul B, 0xdead
	/* 364 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/* 36b */ x"ec",x"80",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne D, 0x0000, $fail
	/*     */                                                  --
	/* 372 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 376 */ x"0c",x"40",x"e0",x"ad",x"de",                   --     imul B, 0xdead
	/* 37b */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/* 382 */ x"ec",x"80",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne D, 0x0000, $fail
	/*     */                                                  --
	/* 389 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 38d */ x"20",x"40",x"e0",x"ad",x"de",                   --     shr B, 0xdead
	/* 392 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 399 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 39d */ x"24",x"40",x"e0",x"ad",x"de",                   --     ishr B, 0xdead
	/* 3a2 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 3a9 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3ad */ x"28",x"40",x"e0",x"ad",x"de",                   --     shl B, 0xdead
	/* 3b2 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 3b9 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3bd */ x"2c",x"40",x"e0",x"ad",x"de",                   --     and B, 0xdead
	/* 3c2 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 3c9 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3cd */ x"30",x"40",x"e0",x"ad",x"de",                   --     or B, 0xdead
	/* 3d2 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*     */                                                  --
	/* 3da */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3de */ x"34",x"40",x"e0",x"ad",x"de",                   --     xor B, 0xdead
	/* 3e3 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*     */                                                  --
	/* 3eb */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3ef */ x"38",x"40",                                     --     neg B
	/* 3f1 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 3f8 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 3fc */ x"3c",x"40",                                     --     not B
	/* 3fe */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*     */                                                  --
	/* 406 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 40a */ x"40",x"40",                                     --     bool B
	/* 40c */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*     */                                                  --
	/* 413 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 417 */ x"44",x"40",                                     --     inc B
	/* 419 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*     */                                                  --
	/* 420 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* 424 */ x"48",x"40",                                     --     dec B
	/* 426 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*     */                                                  --
	/*     */                                                  -- jmp_test:
	/* 42e */ x"e8",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jeq 0xffab, 0x002b, $fail
	/* 437 */ x"ec",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"44",x"d4", --     jne 0xffab, 0x002b, $_L_test_jmp_1
	/* 440 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_1:
	/* 444 */ x"f0",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jlt 0xffab, 0x002b, $fail
	/* 44d */ x"f4",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jle 0xffab, 0x002b, $fail
	/* 456 */ x"f8",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"63",x"d4", --     jgt 0xffab, 0x002b, $_L_test_jmp_2
	/* 45f */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_2:
	/* 463 */ x"fc",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"70",x"d4", --     jge 0xffab, 0x002b, $_L_test_jmp_3
	/* 46c */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_3:
	/* 470 */ x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             --     cmp 0xffab, 0x002b
	/* 476 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* 47a */ x"6c",x"e0",x"82",x"d4",                         --     jne $_L_test_jmp_4
	/* 47e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_4:
	/* 482 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* 486 */ x"74",x"e0",x"0d",x"d0",                         --     jle $fail
	/* 48a */ x"78",x"e0",x"92",x"d4",                         --     jgt $_L_test_jmp_5
	/* 48e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_5:
	/* 492 */ x"7c",x"e0",x"9a",x"d4",                         --     jge $_L_test_jmp_6
	/* 496 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_6:
	/* 49a */ x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             --     icmp 0xffab, 0x002b
	/* 4a0 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* 4a4 */ x"6c",x"e0",x"ac",x"d4",                         --     jne $_L_test_jmp_7
	/* 4a8 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_7:
	/* 4ac */ x"70",x"e0",x"b4",x"d4",                         --     jlt $_L_test_jmp_8
	/* 4b0 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_8:
	/* 4b4 */ x"74",x"e0",x"bc",x"d4",                         --     jle $_L_test_jmp_9
	/* 4b8 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_9:
	/* 4bc */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* 4c0 */ x"7c",x"e0",x"0d",x"d0",                         --     jge $fail
	/* 4c4 */ x"e8",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jeq 0x002b, 0xffab, $fail
	/* 4cd */ x"ec",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"da",x"d4", --     jne 0x002b, 0xffab, $_L_test_jmp_10
	/* 4d6 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_10:
	/* 4da */ x"f0",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"e7",x"d4", --     jlt 0x002b, 0xffab, $_L_test_jmp_11
	/* 4e3 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_11:
	/* 4e7 */ x"f4",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"f4",x"d4", --     jle 0x002b, 0xffab, $_L_test_jmp_12
	/* 4f0 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_12:
	/* 4f4 */ x"f8",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jgt 0x002b, 0xffab, $fail
	/* 4fd */ x"fc",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jge 0x002b, 0xffab, $fail
	/* 506 */ x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             --     cmp 0x002b, 0xffab
	/* 50c */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* 510 */ x"6c",x"e0",x"18",x"d5",                         --     jne $_L_test_jmp_13
	/* 514 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_13:
	/* 518 */ x"70",x"e0",x"20",x"d5",                         --     jlt $_L_test_jmp_14
	/* 51c */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_14:
	/* 520 */ x"74",x"e0",x"28",x"d5",                         --     jle $_L_test_jmp_15
	/* 524 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_15:
	/* 528 */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* 52c */ x"7c",x"e0",x"0d",x"d0",                         --     jge $fail
	/* 530 */ x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             --     icmp 0x002b, 0xffab
	/* 536 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* 53a */ x"6c",x"e0",x"42",x"d5",                         --     jne $_L_test_jmp_16
	/* 53e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_16:
	/* 542 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* 546 */ x"74",x"e0",x"0d",x"d0",                         --     jle $fail
	/* 54a */ x"78",x"e0",x"52",x"d5",                         --     jgt $_L_test_jmp_17
	/* 54e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_17:
	/* 552 */ x"7c",x"e0",x"5a",x"d5",                         --     jge $_L_test_jmp_18
	/* 556 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_18:
	/* 55a */ x"e8",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"68",x"d5", --     jeq 0xffab, 0xffab, $_L_test_jmp_19
	/* 564 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_19:
	/* 568 */ x"ec",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jne 0xffab, 0xffab, $fail
	/* 572 */ x"f0",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jlt 0xffab, 0xffab, $fail
	/* 57c */ x"f4",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"8a",x"d5", --     jle 0xffab, 0xffab, $_L_test_jmp_20
	/* 586 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_20:
	/* 58a */ x"f8",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jgt 0xffab, 0xffab, $fail
	/* 594 */ x"fc",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"a2",x"d5", --     jge 0xffab, 0xffab, $_L_test_jmp_21
	/* 59e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_21:
	/* 5a2 */ x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     cmp 0xffab, 0xffab
	/* 5a9 */ x"68",x"e0",x"b1",x"d5",                         --     jeq $_L_test_jmp_22
	/* 5ad */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_22:
	/* 5b1 */ x"6c",x"e0",x"0d",x"d0",                         --     jne $fail
	/* 5b5 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* 5b9 */ x"74",x"e0",x"c1",x"d5",                         --     jle $_L_test_jmp_23
	/* 5bd */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_23:
	/* 5c1 */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* 5c5 */ x"7c",x"e0",x"cd",x"d5",                         --     jge $_L_test_jmp_24
	/* 5c9 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_24:
	/* 5cd */ x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     icmp 0xffab, 0xffab
	/* 5d4 */ x"68",x"e0",x"dc",x"d5",                         --     jeq $_L_test_jmp_25
	/* 5d8 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_25:
	/* 5dc */ x"6c",x"e0",x"0d",x"d0",                         --     jne $fail
	/* 5e0 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* 5e4 */ x"74",x"e0",x"ec",x"d5",                         --     jle $_L_test_jmp_26
	/* 5e8 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_26:
	/* 5ec */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* 5f0 */ x"7c",x"e0",x"f8",x"d5",                         --     jge $_L_test_jmp_27
	/* 5f4 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_jmp_27:
	/*     */                                                  -- test_uop_get_arg:
	/* 5f8 */ x"60",x"a0",x"e0",x"00",x"70",                   --     mov SP, 0x7000
	/* 5fd */ x"60",x"20",x"e0",x"aa",x"00",                   --     mov A, 0x00aa
	/* 602 */ x"60",x"40",x"e0",x"bb",x"00",                   --     mov B, 0x00bb
	/* 607 */ x"b6",x"20",x"3f",x"22",x"f6",                   --     xor [A], A*4 + -10, A*2
	/* 60c */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"ca",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03ca, $fail
	/* 616 */ x"b6",x"22",x"3f",x"1c",x"f6",x"85",             --     xor [A*2], A*4 + -10, -123
	/* 61c */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"1b",x"fd",x"0d",x"d0", --     jne [0x0154], 0xfd1b, $fail
	/* 626 */ x"b6",x"e0",x"3f",x"22",x"39",x"30",x"f6",       --     xor [12345], A*4 + -10, A*2
	/* 62d */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"ca",x"03",x"0d",x"d0", --     jne [0x3039], 0x03ca, $fail
	/* 637 */ x"b6",x"3f",x"e0",x"2b",x"f6",x"39",x"30",       --     xor [A*4 + -10], 12345, A*4 + B
	/* 63e */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"5a",x"33",x"0d",x"d0", --     jne [0x029e], 0x335a, $fail
	/* 648 */ x"b6",x"e0",x"2b",x"e4",x"39",x"30",x"de",x"fa", --     xor [12345], A*4 + B, 0xFADE + A
	/* 650 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"eb",x"f8",x"0d",x"d0", --     jne [0x3039], 0xf8eb, $fail
	/* 65a */ x"b6",x"2b",x"3f",x"20",x"f6",                   --     xor [A*4 + B], A*4 + -10, A
	/* 65f */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"34",x"02",x"0d",x"d0", --     jne [0x0363], 0x0234, $fail
	/* 669 */ x"b6",x"22",x"e0",x"22",x"39",x"30",             --     xor [A*2], 12345, A*2
	/* 66f */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"6d",x"31",x"0d",x"d0", --     jne [0x0154], 0x316d, $fail
	/* 679 */ x"b6",x"e0",x"3f",x"20",x"39",x"30",x"f6",       --     xor [12345], A*4 + -10, A
	/* 680 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"34",x"02",x"0d",x"d0", --     jne [0x3039], 0x0234, $fail
	/* 68a */ x"b6",x"3f",x"e4",x"22",x"f6",x"de",x"fa",       --     xor [A*4 + -10], 0xFADE + A, A*2
	/* 691 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"dc",x"fa",x"0d",x"d0", --     jne [0x029e], 0xfadc, $fail
	/* 69b */ x"b6",x"e0",x"e4",x"e4",x"39",x"30",x"de",x"fa",x"de",x"fa", --     xor [12345], 0xFADE + A, 0xFADE + A
	/* 6a5 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* 6ae */ x"b6",x"3f",x"20",x"e4",x"f6",x"de",x"fa",       --     xor [A*4 + -10], A, 0xFADE + A
	/* 6b5 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"22",x"fb",x"0d",x"d0", --     jne [0x029e], 0xfb22, $fail
	/* 6bf */ x"b6",x"22",x"2b",x"20",                         --     xor [A*2], A*4 + B, A
	/* 6c3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"c9",x"03",x"0d",x"d0", --     jne [0x0154], 0x03c9, $fail
	/* 6cd */ x"b6",x"22",x"3f",x"22",x"f6",                   --     xor [A*2], A*4 + -10, A*2
	/* 6d2 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ca",x"03",x"0d",x"d0", --     jne [0x0154], 0x03ca, $fail
	/* 6dc */ x"b6",x"2b",x"2b",x"20",                         --     xor [A*4 + B], A*4 + B, A
	/* 6e0 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"c9",x"03",x"0d",x"d0", --     jne [0x0363], 0x03c9, $fail
	/* 6ea */ x"b6",x"3f",x"1c",x"20",x"f6",x"85",             --     xor [A*4 + -10], -123, A
	/* 6f0 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"2f",x"ff",x"0d",x"d0", --     jne [0x029e], 0xff2f, $fail
	/* 6fa */ x"b6",x"22",x"1c",x"22",x"85",                   --     xor [A*2], -123, A*2
	/* 6ff */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"d1",x"fe",x"0d",x"d0", --     jne [0x0154], 0xfed1, $fail
	/* 709 */ x"b6",x"e0",x"20",x"3f",x"39",x"30",x"f6",       --     xor [12345], A, A*4 + -10
	/* 710 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"34",x"02",x"0d",x"d0", --     jne [0x3039], 0x0234, $fail
	/* 71a */ x"b6",x"2b",x"e4",x"e4",x"de",x"fa",x"de",x"fa", --     xor [A*4 + B], 0xFADE + A, 0xFADE + A
	/* 722 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* 72b */ x"b6",x"e0",x"1c",x"22",x"39",x"30",x"85",       --     xor [12345], -123, A*2
	/* 732 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"d1",x"fe",x"0d",x"d0", --     jne [0x3039], 0xfed1, $fail
	/* 73c */ x"b6",x"2b",x"22",x"2b",                         --     xor [A*4 + B], A*2, A*4 + B
	/* 740 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"37",x"02",x"0d",x"d0", --     jne [0x0363], 0x0237, $fail
	/* 74a */ x"b6",x"22",x"e4",x"e4",x"de",x"fa",x"de",x"fa", --     xor [A*2], 0xFADE + A, 0xFADE + A
	/* 752 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* 75b */ x"b6",x"20",x"20",x"20",                         --     xor [A], A, A
	/* 75f */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* 768 */ x"b6",x"22",x"2b",x"2b",                         --     xor [A*2], A*4 + B, A*4 + B
	/* 76c */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* 775 */ x"b6",x"20",x"e0",x"e0",x"39",x"30",x"39",x"30", --     xor [A], 12345, 12345
	/* 77d */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* 786 */ x"b6",x"e0",x"1c",x"e0",x"39",x"30",x"85",x"39",x"30", --     xor [12345], -123, 12345
	/* 78f */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"bc",x"cf",x"0d",x"d0", --     jne [0x3039], 0xcfbc, $fail
	/* 799 */ x"b6",x"20",x"e4",x"22",x"de",x"fa",             --     xor [A], 0xFADE + A, A*2
	/* 79f */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"dc",x"fa",x"0d",x"d0", --     jne [0x00aa], 0xfadc, $fail
	/* 7a9 */ x"b6",x"e0",x"20",x"2b",x"39",x"30",             --     xor [12345], A, A*4 + B
	/* 7af */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"c9",x"03",x"0d",x"d0", --     jne [0x3039], 0x03c9, $fail
	/* 7b9 */ x"b6",x"20",x"e0",x"22",x"39",x"30",             --     xor [A], 12345, A*2
	/* 7bf */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"6d",x"31",x"0d",x"d0", --     jne [0x00aa], 0x316d, $fail
	/* 7c9 */ x"b6",x"22",x"2b",x"1c",x"85",                   --     xor [A*2], A*4 + B, -123
	/* 7ce */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"e6",x"fc",x"0d",x"d0", --     jne [0x0154], 0xfce6, $fail
	/* 7d8 */ x"b6",x"e0",x"20",x"1c",x"39",x"30",x"85",       --     xor [12345], A, -123
	/* 7df */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"2f",x"ff",x"0d",x"d0", --     jne [0x3039], 0xff2f, $fail
	/* 7e9 */ x"b6",x"2b",x"e4",x"e0",x"de",x"fa",x"39",x"30", --     xor [A*4 + B], 0xFADE + A, 12345
	/* 7f1 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"b1",x"cb",x"0d",x"d0", --     jne [0x0363], 0xcbb1, $fail
	/* 7fb */ x"b6",x"2b",x"22",x"e0",x"39",x"30",             --     xor [A*4 + B], A*2, 12345
	/* 801 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"6d",x"31",x"0d",x"d0", --     jne [0x0363], 0x316d, $fail
	/* 80b */ x"b6",x"3f",x"2b",x"20",x"f6",                   --     xor [A*4 + -10], A*4 + B, A
	/* 810 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"c9",x"03",x"0d",x"d0", --     jne [0x029e], 0x03c9, $fail
	/* 81a */ x"b6",x"22",x"e4",x"1c",x"de",x"fa",x"85",       --     xor [A*2], 0xFADE + A, -123
	/* 821 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"0d",x"04",x"0d",x"d0", --     jne [0x0154], 0x040d, $fail
	/* 82b */ x"b6",x"e0",x"22",x"1c",x"39",x"30",x"85",       --     xor [12345], A*2, -123
	/* 832 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"d1",x"fe",x"0d",x"d0", --     jne [0x3039], 0xfed1, $fail
	/* 83c */ x"b6",x"20",x"e0",x"2b",x"39",x"30",             --     xor [A], 12345, A*4 + B
	/* 842 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"5a",x"33",x"0d",x"d0", --     jne [0x00aa], 0x335a, $fail
	/* 84c */ x"b6",x"22",x"1c",x"e0",x"85",x"39",x"30",       --     xor [A*2], -123, 12345
	/* 853 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"bc",x"cf",x"0d",x"d0", --     jne [0x0154], 0xcfbc, $fail
	/* 85d */ x"b6",x"20",x"20",x"22",                         --     xor [A], A, A*2
	/* 861 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"fe",x"01",x"0d",x"d0", --     jne [0x00aa], 0x01fe, $fail
	/* 86b */ x"b6",x"2b",x"3f",x"e0",x"f6",x"39",x"30",       --     xor [A*4 + B], A*4 + -10, 12345
	/* 872 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"a7",x"32",x"0d",x"d0", --     jne [0x0363], 0x32a7, $fail
	/* 87c */ x"b6",x"2b",x"e0",x"20",x"39",x"30",             --     xor [A*4 + B], 12345, A
	/* 882 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"93",x"30",x"0d",x"d0", --     jne [0x0363], 0x3093, $fail
	/* 88c */ x"b6",x"3f",x"e4",x"e4",x"f6",x"de",x"fa",x"de",x"fa", --     xor [A*4 + -10], 0xFADE + A, 0xFADE + A
	/* 895 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* 89e */ x"b6",x"22",x"2b",x"e4",x"de",x"fa",             --     xor [A*2], A*4 + B, 0xFADE + A
	/* 8a4 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"eb",x"f8",x"0d",x"d0", --     jne [0x0154], 0xf8eb, $fail
	/* 8ae */ x"b6",x"22",x"22",x"20",                         --     xor [A*2], A*2, A
	/* 8b2 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"fe",x"01",x"0d",x"d0", --     jne [0x0154], 0x01fe, $fail
	/* 8bc */ x"b6",x"22",x"e0",x"3f",x"39",x"30",x"f6",       --     xor [A*2], 12345, A*4 + -10
	/* 8c3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"a7",x"32",x"0d",x"d0", --     jne [0x0154], 0x32a7, $fail
	/* 8cd */ x"b6",x"22",x"e0",x"1c",x"39",x"30",x"85",       --     xor [A*2], 12345, -123
	/* 8d4 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"bc",x"cf",x"0d",x"d0", --     jne [0x0154], 0xcfbc, $fail
	/* 8de */ x"b6",x"3f",x"2b",x"22",x"f6",                   --     xor [A*4 + -10], A*4 + B, A*2
	/* 8e3 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"37",x"02",x"0d",x"d0", --     jne [0x029e], 0x0237, $fail
	/* 8ed */ x"b6",x"22",x"20",x"20",                         --     xor [A*2], A, A
	/* 8f1 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* 8fa */ x"b6",x"e0",x"e0",x"2b",x"39",x"30",x"39",x"30", --     xor [12345], 12345, A*4 + B
	/* 902 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"5a",x"33",x"0d",x"d0", --     jne [0x3039], 0x335a, $fail
	/* 90c */ x"b6",x"22",x"3f",x"20",x"f6",                   --     xor [A*2], A*4 + -10, A
	/* 911 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"34",x"02",x"0d",x"d0", --     jne [0x0154], 0x0234, $fail
	/* 91b */ x"b6",x"20",x"3f",x"2b",x"f6",                   --     xor [A], A*4 + -10, A*4 + B
	/* 920 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"fd",x"01",x"0d",x"d0", --     jne [0x00aa], 0x01fd, $fail
	/* 92a */ x"b6",x"e0",x"2b",x"20",x"39",x"30",             --     xor [12345], A*4 + B, A
	/* 930 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"c9",x"03",x"0d",x"d0", --     jne [0x3039], 0x03c9, $fail
	/* 93a */ x"b6",x"2b",x"e4",x"20",x"de",x"fa",             --     xor [A*4 + B], 0xFADE + A, A
	/* 940 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"22",x"fb",x"0d",x"d0", --     jne [0x0363], 0xfb22, $fail
	/* 94a */ x"b6",x"2b",x"e4",x"1c",x"de",x"fa",x"85",       --     xor [A*4 + B], 0xFADE + A, -123
	/* 951 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"0d",x"04",x"0d",x"d0", --     jne [0x0363], 0x040d, $fail
	/* 95b */ x"b6",x"3f",x"3f",x"e4",x"f6",x"f6",x"de",x"fa", --     xor [A*4 + -10], A*4 + -10, 0xFADE + A
	/* 963 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"16",x"f9",x"0d",x"d0", --     jne [0x029e], 0xf916, $fail
	/* 96d */ x"b6",x"3f",x"20",x"e0",x"f6",x"39",x"30",       --     xor [A*4 + -10], A, 12345
	/* 974 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"93",x"30",x"0d",x"d0", --     jne [0x029e], 0x3093, $fail
	/* 97e */ x"b6",x"20",x"20",x"1c",x"85",                   --     xor [A], A, -123
	/* 983 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"2f",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xff2f, $fail
	/* 98d */ x"b6",x"20",x"1c",x"e4",x"85",x"de",x"fa",       --     xor [A], -123, 0xFADE + A
	/* 994 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"0d",x"04",x"0d",x"d0", --     jne [0x00aa], 0x040d, $fail
	/* 99e */ x"b6",x"22",x"20",x"3f",x"f6",                   --     xor [A*2], A, A*4 + -10
	/* 9a3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"34",x"02",x"0d",x"d0", --     jne [0x0154], 0x0234, $fail
	/* 9ad */ x"b6",x"2b",x"20",x"3f",x"f6",                   --     xor [A*4 + B], A, A*4 + -10
	/* 9b2 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"34",x"02",x"0d",x"d0", --     jne [0x0363], 0x0234, $fail
	/* 9bc */ x"b6",x"2b",x"1c",x"22",x"85",                   --     xor [A*4 + B], -123, A*2
	/* 9c1 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"d1",x"fe",x"0d",x"d0", --     jne [0x0363], 0xfed1, $fail
	/* 9cb */ x"b6",x"20",x"1c",x"20",x"85",                   --     xor [A], -123, A
	/* 9d0 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"2f",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xff2f, $fail
	/* 9da */ x"b6",x"22",x"20",x"2b",                         --     xor [A*2], A, A*4 + B
	/* 9de */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"c9",x"03",x"0d",x"d0", --     jne [0x0154], 0x03c9, $fail
	/* 9e8 */ x"b6",x"2b",x"1c",x"20",x"85",                   --     xor [A*4 + B], -123, A
	/* 9ed */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"2f",x"ff",x"0d",x"d0", --     jne [0x0363], 0xff2f, $fail
	/* 9f7 */ x"b6",x"e0",x"20",x"20",x"39",x"30",             --     xor [12345], A, A
	/* 9fd */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* a06 */ x"b6",x"20",x"22",x"2b",                         --     xor [A], A*2, A*4 + B
	/* a0a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"37",x"02",x"0d",x"d0", --     jne [0x00aa], 0x0237, $fail
	/* a14 */ x"b6",x"22",x"e4",x"3f",x"de",x"fa",x"f6",       --     xor [A*2], 0xFADE + A, A*4 + -10
	/* a1b */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"16",x"f9",x"0d",x"d0", --     jne [0x0154], 0xf916, $fail
	/* a25 */ x"b6",x"e0",x"e0",x"1c",x"39",x"30",x"39",x"30",x"85", --     xor [12345], 12345, -123
	/* a2e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"bc",x"cf",x"0d",x"d0", --     jne [0x3039], 0xcfbc, $fail
	/* a38 */ x"b6",x"e0",x"2b",x"22",x"39",x"30",             --     xor [12345], A*4 + B, A*2
	/* a3e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"37",x"02",x"0d",x"d0", --     jne [0x3039], 0x0237, $fail
	/* a48 */ x"b6",x"20",x"1c",x"1c",x"85",x"85",             --     xor [A], -123, -123
	/* a4e */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* a57 */ x"b6",x"2b",x"3f",x"3f",x"f6",x"f6",             --     xor [A*4 + B], A*4 + -10, A*4 + -10
	/* a5d */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* a66 */ x"b6",x"22",x"2b",x"22",                         --     xor [A*2], A*4 + B, A*2
	/* a6a */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"37",x"02",x"0d",x"d0", --     jne [0x0154], 0x0237, $fail
	/* a74 */ x"b6",x"20",x"1c",x"e0",x"85",x"39",x"30",       --     xor [A], -123, 12345
	/* a7b */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"bc",x"cf",x"0d",x"d0", --     jne [0x00aa], 0xcfbc, $fail
	/* a85 */ x"b6",x"e0",x"2b",x"e0",x"39",x"30",x"39",x"30", --     xor [12345], A*4 + B, 12345
	/* a8d */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"5a",x"33",x"0d",x"d0", --     jne [0x3039], 0x335a, $fail
	/* a97 */ x"b6",x"20",x"e4",x"3f",x"de",x"fa",x"f6",       --     xor [A], 0xFADE + A, A*4 + -10
	/* a9e */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"16",x"f9",x"0d",x"d0", --     jne [0x00aa], 0xf916, $fail
	/* aa8 */ x"b6",x"22",x"3f",x"3f",x"f6",x"f6",             --     xor [A*2], A*4 + -10, A*4 + -10
	/* aae */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* ab7 */ x"b6",x"2b",x"1c",x"1c",x"85",x"85",             --     xor [A*4 + B], -123, -123
	/* abd */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* ac6 */ x"b6",x"2b",x"3f",x"22",x"f6",                   --     xor [A*4 + B], A*4 + -10, A*2
	/* acb */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"ca",x"03",x"0d",x"d0", --     jne [0x0363], 0x03ca, $fail
	/* ad5 */ x"b6",x"20",x"e4",x"e0",x"de",x"fa",x"39",x"30", --     xor [A], 0xFADE + A, 12345
	/* add */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"b1",x"cb",x"0d",x"d0", --     jne [0x00aa], 0xcbb1, $fail
	/* ae7 */ x"b6",x"3f",x"20",x"22",x"f6",                   --     xor [A*4 + -10], A, A*2
	/* aec */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"fe",x"01",x"0d",x"d0", --     jne [0x029e], 0x01fe, $fail
	/* af6 */ x"b6",x"3f",x"3f",x"1c",x"f6",x"f6",x"85",       --     xor [A*4 + -10], A*4 + -10, -123
	/* afd */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"1b",x"fd",x"0d",x"d0", --     jne [0x029e], 0xfd1b, $fail
	/* b07 */ x"b6",x"20",x"22",x"1c",x"85",                   --     xor [A], A*2, -123
	/* b0c */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"d1",x"fe",x"0d",x"d0", --     jne [0x00aa], 0xfed1, $fail
	/* b16 */ x"b6",x"3f",x"3f",x"e0",x"f6",x"f6",x"39",x"30", --     xor [A*4 + -10], A*4 + -10, 12345
	/* b1e */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"a7",x"32",x"0d",x"d0", --     jne [0x029e], 0x32a7, $fail
	/* b28 */ x"b6",x"20",x"e0",x"e4",x"39",x"30",x"de",x"fa", --     xor [A], 12345, 0xFADE + A
	/* b30 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"b1",x"cb",x"0d",x"d0", --     jne [0x00aa], 0xcbb1, $fail
	/* b3a */ x"b6",x"3f",x"20",x"20",x"f6",                   --     xor [A*4 + -10], A, A
	/* b3f */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* b48 */ x"b6",x"3f",x"20",x"2b",x"f6",                   --     xor [A*4 + -10], A, A*4 + B
	/* b4d */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"c9",x"03",x"0d",x"d0", --     jne [0x029e], 0x03c9, $fail
	/* b57 */ x"b6",x"3f",x"3f",x"22",x"f6",x"f6",             --     xor [A*4 + -10], A*4 + -10, A*2
	/* b5d */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"ca",x"03",x"0d",x"d0", --     jne [0x029e], 0x03ca, $fail
	/* b67 */ x"b6",x"e0",x"e0",x"20",x"39",x"30",x"39",x"30", --     xor [12345], 12345, A
	/* b6f */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"93",x"30",x"0d",x"d0", --     jne [0x3039], 0x3093, $fail
	/* b79 */ x"b6",x"20",x"20",x"2b",                         --     xor [A], A, A*4 + B
	/* b7d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"c9",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03c9, $fail
	/* b87 */ x"b6",x"2b",x"22",x"3f",x"f6",                   --     xor [A*4 + B], A*2, A*4 + -10
	/* b8c */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"ca",x"03",x"0d",x"d0", --     jne [0x0363], 0x03ca, $fail
	/* b96 */ x"b6",x"20",x"3f",x"e4",x"f6",x"de",x"fa",       --     xor [A], A*4 + -10, 0xFADE + A
	/* b9d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"16",x"f9",x"0d",x"d0", --     jne [0x00aa], 0xf916, $fail
	/* ba7 */ x"b6",x"20",x"e4",x"1c",x"de",x"fa",x"85",       --     xor [A], 0xFADE + A, -123
	/* bae */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"0d",x"04",x"0d",x"d0", --     jne [0x00aa], 0x040d, $fail
	/* bb8 */ x"b6",x"2b",x"e0",x"e4",x"39",x"30",x"de",x"fa", --     xor [A*4 + B], 12345, 0xFADE + A
	/* bc0 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"b1",x"cb",x"0d",x"d0", --     jne [0x0363], 0xcbb1, $fail
	/* bca */ x"b6",x"22",x"1c",x"1c",x"85",x"85",             --     xor [A*2], -123, -123
	/* bd0 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* bd9 */ x"b6",x"3f",x"3f",x"20",x"f6",x"f6",             --     xor [A*4 + -10], A*4 + -10, A
	/* bdf */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"34",x"02",x"0d",x"d0", --     jne [0x029e], 0x0234, $fail
	/* be9 */ x"b6",x"2b",x"e0",x"1c",x"39",x"30",x"85",       --     xor [A*4 + B], 12345, -123
	/* bf0 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"bc",x"cf",x"0d",x"d0", --     jne [0x0363], 0xcfbc, $fail
	/* bfa */ x"b6",x"e0",x"1c",x"3f",x"39",x"30",x"85",x"f6", --     xor [12345], -123, A*4 + -10
	/* c02 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"1b",x"fd",x"0d",x"d0", --     jne [0x3039], 0xfd1b, $fail
	/* c0c */ x"b6",x"e0",x"22",x"20",x"39",x"30",             --     xor [12345], A*2, A
	/* c12 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"fe",x"01",x"0d",x"d0", --     jne [0x3039], 0x01fe, $fail
	/* c1c */ x"b6",x"22",x"e4",x"e0",x"de",x"fa",x"39",x"30", --     xor [A*2], 0xFADE + A, 12345
	/* c24 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"b1",x"cb",x"0d",x"d0", --     jne [0x0154], 0xcbb1, $fail
	/* c2e */ x"b6",x"3f",x"22",x"e0",x"f6",x"39",x"30",       --     xor [A*4 + -10], A*2, 12345
	/* c35 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"6d",x"31",x"0d",x"d0", --     jne [0x029e], 0x316d, $fail
	/* c3f */ x"b6",x"e0",x"e0",x"3f",x"39",x"30",x"39",x"30",x"f6", --     xor [12345], 12345, A*4 + -10
	/* c48 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"a7",x"32",x"0d",x"d0", --     jne [0x3039], 0x32a7, $fail
	/* c52 */ x"b6",x"2b",x"20",x"20",                         --     xor [A*4 + B], A, A
	/* c56 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* c5f */ x"b6",x"3f",x"1c",x"e4",x"f6",x"85",x"de",x"fa", --     xor [A*4 + -10], -123, 0xFADE + A
	/* c67 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"0d",x"04",x"0d",x"d0", --     jne [0x029e], 0x040d, $fail
	/* c71 */ x"b6",x"20",x"1c",x"3f",x"85",x"f6",             --     xor [A], -123, A*4 + -10
	/* c77 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"1b",x"fd",x"0d",x"d0", --     jne [0x00aa], 0xfd1b, $fail
	/* c81 */ x"b6",x"20",x"2b",x"2b",                         --     xor [A], A*4 + B, A*4 + B
	/* c85 */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* c8e */ x"b6",x"e0",x"22",x"e0",x"39",x"30",x"39",x"30", --     xor [12345], A*2, 12345
	/* c96 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"6d",x"31",x"0d",x"d0", --     jne [0x3039], 0x316d, $fail
	/* ca0 */ x"b6",x"3f",x"1c",x"e0",x"f6",x"85",x"39",x"30", --     xor [A*4 + -10], -123, 12345
	/* ca8 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"bc",x"cf",x"0d",x"d0", --     jne [0x029e], 0xcfbc, $fail
	/* cb2 */ x"b6",x"20",x"2b",x"20",                         --     xor [A], A*4 + B, A
	/* cb6 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"c9",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03c9, $fail
	/* cc0 */ x"b6",x"e0",x"e4",x"22",x"39",x"30",x"de",x"fa", --     xor [12345], 0xFADE + A, A*2
	/* cc8 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"dc",x"fa",x"0d",x"d0", --     jne [0x3039], 0xfadc, $fail
	/* cd2 */ x"b6",x"2b",x"e4",x"3f",x"de",x"fa",x"f6",       --     xor [A*4 + B], 0xFADE + A, A*4 + -10
	/* cd9 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"16",x"f9",x"0d",x"d0", --     jne [0x0363], 0xf916, $fail
	/* ce3 */ x"b6",x"3f",x"20",x"1c",x"f6",x"85",             --     xor [A*4 + -10], A, -123
	/* ce9 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"2f",x"ff",x"0d",x"d0", --     jne [0x029e], 0xff2f, $fail
	/* cf3 */ x"b6",x"2b",x"1c",x"2b",x"85",                   --     xor [A*4 + B], -123, A*4 + B
	/* cf8 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"e6",x"fc",x"0d",x"d0", --     jne [0x0363], 0xfce6, $fail
	/* d02 */ x"b6",x"3f",x"1c",x"1c",x"f6",x"85",x"85",       --     xor [A*4 + -10], -123, -123
	/* d09 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* d12 */ x"b6",x"2b",x"3f",x"2b",x"f6",                   --     xor [A*4 + B], A*4 + -10, A*4 + B
	/* d17 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"fd",x"01",x"0d",x"d0", --     jne [0x0363], 0x01fd, $fail
	/* d21 */ x"b6",x"3f",x"e0",x"22",x"f6",x"39",x"30",       --     xor [A*4 + -10], 12345, A*2
	/* d28 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"6d",x"31",x"0d",x"d0", --     jne [0x029e], 0x316d, $fail
	/* d32 */ x"b6",x"e0",x"3f",x"e0",x"39",x"30",x"f6",x"39",x"30", --     xor [12345], A*4 + -10, 12345
	/* d3b */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"a7",x"32",x"0d",x"d0", --     jne [0x3039], 0x32a7, $fail
	/* d45 */ x"b6",x"20",x"2b",x"22",                         --     xor [A], A*4 + B, A*2
	/* d49 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"37",x"02",x"0d",x"d0", --     jne [0x00aa], 0x0237, $fail
	/* d53 */ x"b6",x"e0",x"22",x"2b",x"39",x"30",             --     xor [12345], A*2, A*4 + B
	/* d59 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"37",x"02",x"0d",x"d0", --     jne [0x3039], 0x0237, $fail
	/* d63 */ x"b6",x"22",x"e0",x"20",x"39",x"30",             --     xor [A*2], 12345, A
	/* d69 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"93",x"30",x"0d",x"d0", --     jne [0x0154], 0x3093, $fail
	/* d73 */ x"b6",x"22",x"20",x"e0",x"39",x"30",             --     xor [A*2], A, 12345
	/* d79 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"93",x"30",x"0d",x"d0", --     jne [0x0154], 0x3093, $fail
	/* d83 */ x"b6",x"3f",x"22",x"3f",x"f6",x"f6",             --     xor [A*4 + -10], A*2, A*4 + -10
	/* d89 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"ca",x"03",x"0d",x"d0", --     jne [0x029e], 0x03ca, $fail
	/* d93 */ x"b6",x"2b",x"1c",x"e4",x"85",x"de",x"fa",       --     xor [A*4 + B], -123, 0xFADE + A
	/* d9a */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"0d",x"04",x"0d",x"d0", --     jne [0x0363], 0x040d, $fail
	/* da4 */ x"b6",x"20",x"3f",x"20",x"f6",                   --     xor [A], A*4 + -10, A
	/* da9 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"34",x"02",x"0d",x"d0", --     jne [0x00aa], 0x0234, $fail
	/* db3 */ x"b6",x"e0",x"2b",x"3f",x"39",x"30",x"f6",       --     xor [12345], A*4 + B, A*4 + -10
	/* dba */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"fd",x"01",x"0d",x"d0", --     jne [0x3039], 0x01fd, $fail
	/* dc4 */ x"b6",x"3f",x"e0",x"1c",x"f6",x"39",x"30",x"85", --     xor [A*4 + -10], 12345, -123
	/* dcc */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"bc",x"cf",x"0d",x"d0", --     jne [0x029e], 0xcfbc, $fail
	/* dd6 */ x"b6",x"22",x"1c",x"3f",x"85",x"f6",             --     xor [A*2], -123, A*4 + -10
	/* ddc */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"1b",x"fd",x"0d",x"d0", --     jne [0x0154], 0xfd1b, $fail
	/* de6 */ x"b6",x"20",x"22",x"22",                         --     xor [A], A*2, A*2
	/* dea */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* df3 */ x"b6",x"20",x"22",x"20",                         --     xor [A], A*2, A
	/* df7 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"fe",x"01",x"0d",x"d0", --     jne [0x00aa], 0x01fe, $fail
	/* e01 */ x"b6",x"20",x"e4",x"20",x"de",x"fa",             --     xor [A], 0xFADE + A, A
	/* e07 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"22",x"fb",x"0d",x"d0", --     jne [0x00aa], 0xfb22, $fail
	/* e11 */ x"b6",x"20",x"e0",x"1c",x"39",x"30",x"85",       --     xor [A], 12345, -123
	/* e18 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"bc",x"cf",x"0d",x"d0", --     jne [0x00aa], 0xcfbc, $fail
	/* e22 */ x"b6",x"e0",x"22",x"3f",x"39",x"30",x"f6",       --     xor [12345], A*2, A*4 + -10
	/* e29 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"ca",x"03",x"0d",x"d0", --     jne [0x3039], 0x03ca, $fail
	/* e33 */ x"b6",x"2b",x"20",x"2b",                         --     xor [A*4 + B], A, A*4 + B
	/* e37 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"c9",x"03",x"0d",x"d0", --     jne [0x0363], 0x03c9, $fail
	/* e41 */ x"b6",x"3f",x"e4",x"e0",x"f6",x"de",x"fa",x"39",x"30", --     xor [A*4 + -10], 0xFADE + A, 12345
	/* e4a */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"b1",x"cb",x"0d",x"d0", --     jne [0x029e], 0xcbb1, $fail
	/* e54 */ x"b6",x"3f",x"e0",x"3f",x"f6",x"39",x"30",x"f6", --     xor [A*4 + -10], 12345, A*4 + -10
	/* e5c */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"a7",x"32",x"0d",x"d0", --     jne [0x029e], 0x32a7, $fail
	/* e66 */ x"b6",x"e0",x"2b",x"2b",x"39",x"30",             --     xor [12345], A*4 + B, A*4 + B
	/* e6c */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* e75 */ x"b6",x"20",x"e0",x"20",x"39",x"30",             --     xor [A], 12345, A
	/* e7b */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"93",x"30",x"0d",x"d0", --     jne [0x00aa], 0x3093, $fail
	/* e85 */ x"b6",x"3f",x"22",x"e4",x"f6",x"de",x"fa",       --     xor [A*4 + -10], A*2, 0xFADE + A
	/* e8c */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"dc",x"fa",x"0d",x"d0", --     jne [0x029e], 0xfadc, $fail
	/* e96 */ x"b6",x"3f",x"2b",x"2b",x"f6",                   --     xor [A*4 + -10], A*4 + B, A*4 + B
	/* e9b */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* ea4 */ x"b6",x"3f",x"22",x"22",x"f6",                   --     xor [A*4 + -10], A*2, A*2
	/* ea9 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* eb2 */ x"b6",x"22",x"22",x"22",                         --     xor [A*2], A*2, A*2
	/* eb6 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* ebf */ x"b6",x"20",x"20",x"e0",x"39",x"30",             --     xor [A], A, 12345
	/* ec5 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"93",x"30",x"0d",x"d0", --     jne [0x00aa], 0x3093, $fail
	/* ecf */ x"b6",x"3f",x"e4",x"3f",x"f6",x"de",x"fa",x"f6", --     xor [A*4 + -10], 0xFADE + A, A*4 + -10
	/* ed7 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"16",x"f9",x"0d",x"d0", --     jne [0x029e], 0xf916, $fail
	/* ee1 */ x"b6",x"3f",x"1c",x"22",x"f6",x"85",             --     xor [A*4 + -10], -123, A*2
	/* ee7 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"d1",x"fe",x"0d",x"d0", --     jne [0x029e], 0xfed1, $fail
	/* ef1 */ x"b6",x"e0",x"e4",x"3f",x"39",x"30",x"de",x"fa",x"f6", --     xor [12345], 0xFADE + A, A*4 + -10
	/* efa */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"16",x"f9",x"0d",x"d0", --     jne [0x3039], 0xf916, $fail
	/* f04 */ x"b6",x"20",x"22",x"e0",x"39",x"30",             --     xor [A], A*2, 12345
	/* f0a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"6d",x"31",x"0d",x"d0", --     jne [0x00aa], 0x316d, $fail
	/* f14 */ x"b6",x"22",x"e4",x"22",x"de",x"fa",             --     xor [A*2], 0xFADE + A, A*2
	/* f1a */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"dc",x"fa",x"0d",x"d0", --     jne [0x0154], 0xfadc, $fail
	/* f24 */ x"b6",x"22",x"22",x"e4",x"de",x"fa",             --     xor [A*2], A*2, 0xFADE + A
	/* f2a */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"dc",x"fa",x"0d",x"d0", --     jne [0x0154], 0xfadc, $fail
	/* f34 */ x"b6",x"e0",x"22",x"e4",x"39",x"30",x"de",x"fa", --     xor [12345], A*2, 0xFADE + A
	/* f3c */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"dc",x"fa",x"0d",x"d0", --     jne [0x3039], 0xfadc, $fail
	/* f46 */ x"b6",x"e0",x"3f",x"e4",x"39",x"30",x"f6",x"de",x"fa", --     xor [12345], A*4 + -10, 0xFADE + A
	/* f4f */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"16",x"f9",x"0d",x"d0", --     jne [0x3039], 0xf916, $fail
	/* f59 */ x"b6",x"20",x"2b",x"e0",x"39",x"30",             --     xor [A], A*4 + B, 12345
	/* f5f */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"5a",x"33",x"0d",x"d0", --     jne [0x00aa], 0x335a, $fail
	/* f69 */ x"b6",x"22",x"2b",x"e0",x"39",x"30",             --     xor [A*2], A*4 + B, 12345
	/* f6f */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"5a",x"33",x"0d",x"d0", --     jne [0x0154], 0x335a, $fail
	/* f79 */ x"b6",x"2b",x"20",x"e0",x"39",x"30",             --     xor [A*4 + B], A, 12345
	/* f7f */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"93",x"30",x"0d",x"d0", --     jne [0x0363], 0x3093, $fail
	/* f89 */ x"b6",x"22",x"1c",x"e4",x"85",x"de",x"fa",       --     xor [A*2], -123, 0xFADE + A
	/* f90 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"0d",x"04",x"0d",x"d0", --     jne [0x0154], 0x040d, $fail
	/* f9a */ x"b6",x"20",x"3f",x"3f",x"f6",x"f6",             --     xor [A], A*4 + -10, A*4 + -10
	/* fa0 */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* fa9 */ x"b6",x"2b",x"e0",x"2b",x"39",x"30",             --     xor [A*4 + B], 12345, A*4 + B
	/* faf */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"5a",x"33",x"0d",x"d0", --     jne [0x0363], 0x335a, $fail
	/* fb9 */ x"b6",x"3f",x"1c",x"2b",x"f6",x"85",             --     xor [A*4 + -10], -123, A*4 + B
	/* fbf */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"e6",x"fc",x"0d",x"d0", --     jne [0x029e], 0xfce6, $fail
	/* fc9 */ x"b6",x"22",x"22",x"3f",x"f6",                   --     xor [A*2], A*2, A*4 + -10
	/* fce */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ca",x"03",x"0d",x"d0", --     jne [0x0154], 0x03ca, $fail
	/* fd8 */ x"b6",x"3f",x"e4",x"1c",x"f6",x"de",x"fa",x"85", --     xor [A*4 + -10], 0xFADE + A, -123
	/* fe0 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"0d",x"04",x"0d",x"d0", --     jne [0x029e], 0x040d, $fail
	/* fea */ x"b6",x"e0",x"20",x"22",x"39",x"30",             --     xor [12345], A, A*2
	/* ff0 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"fe",x"01",x"0d",x"d0", --     jne [0x3039], 0x01fe, $fail
	/* ffa */ x"b6",x"2b",x"e4",x"2b",x"de",x"fa",             --     xor [A*4 + B], 0xFADE + A, A*4 + B
	/* 1000 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"eb",x"f8",x"0d",x"d0", --     jne [0x0363], 0xf8eb, $fail
	/* 100a */ x"b6",x"22",x"e4",x"2b",x"de",x"fa",             --     xor [A*2], 0xFADE + A, A*4 + B
	/* 1010 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"eb",x"f8",x"0d",x"d0", --     jne [0x0154], 0xf8eb, $fail
	/* 101a */ x"b6",x"3f",x"2b",x"3f",x"f6",x"f6",             --     xor [A*4 + -10], A*4 + B, A*4 + -10
	/* 1020 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"fd",x"01",x"0d",x"d0", --     jne [0x029e], 0x01fd, $fail
	/* 102a */ x"b6",x"e0",x"1c",x"2b",x"39",x"30",x"85",       --     xor [12345], -123, A*4 + B
	/* 1031 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"e6",x"fc",x"0d",x"d0", --     jne [0x3039], 0xfce6, $fail
	/* 103b */ x"b6",x"3f",x"20",x"3f",x"f6",x"f6",             --     xor [A*4 + -10], A, A*4 + -10
	/* 1041 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"34",x"02",x"0d",x"d0", --     jne [0x029e], 0x0234, $fail
	/* 104b */ x"b6",x"2b",x"1c",x"3f",x"85",x"f6",             --     xor [A*4 + B], -123, A*4 + -10
	/* 1051 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"1b",x"fd",x"0d",x"d0", --     jne [0x0363], 0xfd1b, $fail
	/* 105b */ x"b6",x"3f",x"1c",x"3f",x"f6",x"85",x"f6",       --     xor [A*4 + -10], -123, A*4 + -10
	/* 1062 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"1b",x"fd",x"0d",x"d0", --     jne [0x029e], 0xfd1b, $fail
	/* 106c */ x"b6",x"e0",x"20",x"e4",x"39",x"30",x"de",x"fa", --     xor [12345], A, 0xFADE + A
	/* 1074 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"22",x"fb",x"0d",x"d0", --     jne [0x3039], 0xfb22, $fail
	/* 107e */ x"b6",x"e0",x"1c",x"20",x"39",x"30",x"85",       --     xor [12345], -123, A
	/* 1085 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"2f",x"ff",x"0d",x"d0", --     jne [0x3039], 0xff2f, $fail
	/* 108f */ x"b6",x"2b",x"2b",x"3f",x"f6",                   --     xor [A*4 + B], A*4 + B, A*4 + -10
	/* 1094 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"fd",x"01",x"0d",x"d0", --     jne [0x0363], 0x01fd, $fail
	/* 109e */ x"b6",x"2b",x"20",x"22",                         --     xor [A*4 + B], A, A*2
	/* 10a2 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"fe",x"01",x"0d",x"d0", --     jne [0x0363], 0x01fe, $fail
	/* 10ac */ x"b6",x"3f",x"22",x"2b",x"f6",                   --     xor [A*4 + -10], A*2, A*4 + B
	/* 10b1 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"37",x"02",x"0d",x"d0", --     jne [0x029e], 0x0237, $fail
	/* 10bb */ x"b6",x"3f",x"e0",x"e0",x"f6",x"39",x"30",x"39",x"30", --     xor [A*4 + -10], 12345, 12345
	/* 10c4 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* 10cd */ x"b6",x"2b",x"2b",x"e4",x"de",x"fa",             --     xor [A*4 + B], A*4 + B, 0xFADE + A
	/* 10d3 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"eb",x"f8",x"0d",x"d0", --     jne [0x0363], 0xf8eb, $fail
	/* 10dd */ x"b6",x"22",x"3f",x"2b",x"f6",                   --     xor [A*2], A*4 + -10, A*4 + B
	/* 10e2 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"fd",x"01",x"0d",x"d0", --     jne [0x0154], 0x01fd, $fail
	/* 10ec */ x"b6",x"3f",x"22",x"1c",x"f6",x"85",             --     xor [A*4 + -10], A*2, -123
	/* 10f2 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"d1",x"fe",x"0d",x"d0", --     jne [0x029e], 0xfed1, $fail
	/* 10fc */ x"b6",x"e0",x"20",x"e0",x"39",x"30",x"39",x"30", --     xor [12345], A, 12345
	/* 1104 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"93",x"30",x"0d",x"d0", --     jne [0x3039], 0x3093, $fail
	/* 110e */ x"b6",x"20",x"e4",x"2b",x"de",x"fa",             --     xor [A], 0xFADE + A, A*4 + B
	/* 1114 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"eb",x"f8",x"0d",x"d0", --     jne [0x00aa], 0xf8eb, $fail
	/* 111e */ x"b6",x"22",x"20",x"e4",x"de",x"fa",             --     xor [A*2], A, 0xFADE + A
	/* 1124 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"22",x"fb",x"0d",x"d0", --     jne [0x0154], 0xfb22, $fail
	/* 112e */ x"b6",x"e0",x"e0",x"e4",x"39",x"30",x"39",x"30",x"de",x"fa", --     xor [12345], 12345, 0xFADE + A
	/* 1138 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"b1",x"cb",x"0d",x"d0", --     jne [0x3039], 0xcbb1, $fail
	/* 1142 */ x"b6",x"3f",x"e0",x"20",x"f6",x"39",x"30",       --     xor [A*4 + -10], 12345, A
	/* 1149 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"93",x"30",x"0d",x"d0", --     jne [0x029e], 0x3093, $fail
	/* 1153 */ x"b6",x"20",x"e0",x"3f",x"39",x"30",x"f6",       --     xor [A], 12345, A*4 + -10
	/* 115a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"a7",x"32",x"0d",x"d0", --     jne [0x00aa], 0x32a7, $fail
	/* 1164 */ x"b6",x"e0",x"e4",x"e0",x"39",x"30",x"de",x"fa",x"39",x"30", --     xor [12345], 0xFADE + A, 12345
	/* 116e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"b1",x"cb",x"0d",x"d0", --     jne [0x3039], 0xcbb1, $fail
	/* 1178 */ x"b6",x"3f",x"e4",x"20",x"f6",x"de",x"fa",       --     xor [A*4 + -10], 0xFADE + A, A
	/* 117f */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"22",x"fb",x"0d",x"d0", --     jne [0x029e], 0xfb22, $fail
	/* 1189 */ x"b6",x"22",x"20",x"1c",x"85",                   --     xor [A*2], A, -123
	/* 118e */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"2f",x"ff",x"0d",x"d0", --     jne [0x0154], 0xff2f, $fail
	/* 1198 */ x"b6",x"2b",x"2b",x"e0",x"39",x"30",             --     xor [A*4 + B], A*4 + B, 12345
	/* 119e */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"5a",x"33",x"0d",x"d0", --     jne [0x0363], 0x335a, $fail
	/* 11a8 */ x"b6",x"20",x"22",x"e4",x"de",x"fa",             --     xor [A], A*2, 0xFADE + A
	/* 11ae */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"dc",x"fa",x"0d",x"d0", --     jne [0x00aa], 0xfadc, $fail
	/* 11b8 */ x"b6",x"22",x"e0",x"e0",x"39",x"30",x"39",x"30", --     xor [A*2], 12345, 12345
	/* 11c0 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* 11c9 */ x"b6",x"e0",x"e4",x"1c",x"39",x"30",x"de",x"fa",x"85", --     xor [12345], 0xFADE + A, -123
	/* 11d2 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"0d",x"04",x"0d",x"d0", --     jne [0x3039], 0x040d, $fail
	/* 11dc */ x"b6",x"2b",x"3f",x"e4",x"f6",x"de",x"fa",       --     xor [A*4 + B], A*4 + -10, 0xFADE + A
	/* 11e3 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"16",x"f9",x"0d",x"d0", --     jne [0x0363], 0xf916, $fail
	/* 11ed */ x"b6",x"22",x"3f",x"e0",x"f6",x"39",x"30",       --     xor [A*2], A*4 + -10, 12345
	/* 11f4 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"a7",x"32",x"0d",x"d0", --     jne [0x0154], 0x32a7, $fail
	/* 11fe */ x"b6",x"2b",x"2b",x"2b",                         --     xor [A*4 + B], A*4 + B, A*4 + B
	/* 1202 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* 120b */ x"b6",x"2b",x"e0",x"22",x"39",x"30",             --     xor [A*4 + B], 12345, A*2
	/* 1211 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"6d",x"31",x"0d",x"d0", --     jne [0x0363], 0x316d, $fail
	/* 121b */ x"b6",x"e0",x"1c",x"1c",x"39",x"30",x"85",x"85", --     xor [12345], -123, -123
	/* 1223 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* 122c */ x"b6",x"e0",x"2b",x"1c",x"39",x"30",x"85",       --     xor [12345], A*4 + B, -123
	/* 1233 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"e6",x"fc",x"0d",x"d0", --     jne [0x3039], 0xfce6, $fail
	/* 123d */ x"b6",x"20",x"3f",x"e0",x"f6",x"39",x"30",       --     xor [A], A*4 + -10, 12345
	/* 1244 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"a7",x"32",x"0d",x"d0", --     jne [0x00aa], 0x32a7, $fail
	/* 124e */ x"b6",x"3f",x"3f",x"2b",x"f6",x"f6",             --     xor [A*4 + -10], A*4 + -10, A*4 + B
	/* 1254 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"fd",x"01",x"0d",x"d0", --     jne [0x029e], 0x01fd, $fail
	/* 125e */ x"b6",x"20",x"20",x"3f",x"f6",                   --     xor [A], A, A*4 + -10
	/* 1263 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"34",x"02",x"0d",x"d0", --     jne [0x00aa], 0x0234, $fail
	/* 126d */ x"b6",x"2b",x"e4",x"22",x"de",x"fa",             --     xor [A*4 + B], 0xFADE + A, A*2
	/* 1273 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"dc",x"fa",x"0d",x"d0", --     jne [0x0363], 0xfadc, $fail
	/* 127d */ x"b6",x"20",x"2b",x"3f",x"f6",                   --     xor [A], A*4 + B, A*4 + -10
	/* 1282 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"fd",x"01",x"0d",x"d0", --     jne [0x00aa], 0x01fd, $fail
	/* 128c */ x"b6",x"22",x"2b",x"3f",x"f6",                   --     xor [A*2], A*4 + B, A*4 + -10
	/* 1291 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"fd",x"01",x"0d",x"d0", --     jne [0x0154], 0x01fd, $fail
	/* 129b */ x"b6",x"2b",x"3f",x"1c",x"f6",x"85",             --     xor [A*4 + B], A*4 + -10, -123
	/* 12a1 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"1b",x"fd",x"0d",x"d0", --     jne [0x0363], 0xfd1b, $fail
	/* 12ab */ x"b6",x"3f",x"22",x"20",x"f6",                   --     xor [A*4 + -10], A*2, A
	/* 12b0 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"fe",x"01",x"0d",x"d0", --     jne [0x029e], 0x01fe, $fail
	/* 12ba */ x"b6",x"e0",x"22",x"22",x"39",x"30",             --     xor [12345], A*2, A*2
	/* 12c0 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* 12c9 */ x"b6",x"2b",x"20",x"1c",x"85",                   --     xor [A*4 + B], A, -123
	/* 12ce */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"2f",x"ff",x"0d",x"d0", --     jne [0x0363], 0xff2f, $fail
	/* 12d8 */ x"b6",x"3f",x"2b",x"e4",x"f6",x"de",x"fa",       --     xor [A*4 + -10], A*4 + B, 0xFADE + A
	/* 12df */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"eb",x"f8",x"0d",x"d0", --     jne [0x029e], 0xf8eb, $fail
	/* 12e9 */ x"b6",x"22",x"e0",x"e4",x"39",x"30",x"de",x"fa", --     xor [A*2], 12345, 0xFADE + A
	/* 12f1 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"b1",x"cb",x"0d",x"d0", --     jne [0x0154], 0xcbb1, $fail
	/* 12fb */ x"b6",x"e0",x"3f",x"3f",x"39",x"30",x"f6",x"f6", --     xor [12345], A*4 + -10, A*4 + -10
	/* 1303 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* 130c */ x"b6",x"2b",x"22",x"e4",x"de",x"fa",             --     xor [A*4 + B], A*2, 0xFADE + A
	/* 1312 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"dc",x"fa",x"0d",x"d0", --     jne [0x0363], 0xfadc, $fail
	/* 131c */ x"b6",x"2b",x"22",x"1c",x"85",                   --     xor [A*4 + B], A*2, -123
	/* 1321 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"d1",x"fe",x"0d",x"d0", --     jne [0x0363], 0xfed1, $fail
	/* 132b */ x"b6",x"20",x"3f",x"1c",x"f6",x"85",             --     xor [A], A*4 + -10, -123
	/* 1331 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"1b",x"fd",x"0d",x"d0", --     jne [0x00aa], 0xfd1b, $fail
	/* 133b */ x"b6",x"22",x"1c",x"2b",x"85",                   --     xor [A*2], -123, A*4 + B
	/* 1340 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"e6",x"fc",x"0d",x"d0", --     jne [0x0154], 0xfce6, $fail
	/* 134a */ x"b6",x"2b",x"20",x"e4",x"de",x"fa",             --     xor [A*4 + B], A, 0xFADE + A
	/* 1350 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"22",x"fb",x"0d",x"d0", --     jne [0x0363], 0xfb22, $fail
	/* 135a */ x"b6",x"20",x"1c",x"22",x"85",                   --     xor [A], -123, A*2
	/* 135f */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"d1",x"fe",x"0d",x"d0", --     jne [0x00aa], 0xfed1, $fail
	/* 1369 */ x"b6",x"22",x"e0",x"2b",x"39",x"30",             --     xor [A*2], 12345, A*4 + B
	/* 136f */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"5a",x"33",x"0d",x"d0", --     jne [0x0154], 0x335a, $fail
	/* 1379 */ x"b6",x"20",x"2b",x"1c",x"85",                   --     xor [A], A*4 + B, -123
	/* 137e */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"e6",x"fc",x"0d",x"d0", --     jne [0x00aa], 0xfce6, $fail
	/* 1388 */ x"b6",x"20",x"1c",x"2b",x"85",                   --     xor [A], -123, A*4 + B
	/* 138d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"e6",x"fc",x"0d",x"d0", --     jne [0x00aa], 0xfce6, $fail
	/* 1397 */ x"b6",x"22",x"1c",x"20",x"85",                   --     xor [A*2], -123, A
	/* 139c */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"2f",x"ff",x"0d",x"d0", --     jne [0x0154], 0xff2f, $fail
	/* 13a6 */ x"b6",x"2b",x"e0",x"e0",x"39",x"30",x"39",x"30", --     xor [A*4 + B], 12345, 12345
	/* 13ae */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* 13b7 */ x"b6",x"22",x"22",x"e0",x"39",x"30",             --     xor [A*2], A*2, 12345
	/* 13bd */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"6d",x"31",x"0d",x"d0", --     jne [0x0154], 0x316d, $fail
	/* 13c7 */ x"b6",x"3f",x"2b",x"1c",x"f6",x"85",             --     xor [A*4 + -10], A*4 + B, -123
	/* 13cd */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"e6",x"fc",x"0d",x"d0", --     jne [0x029e], 0xfce6, $fail
	/* 13d7 */ x"b6",x"2b",x"22",x"22",                         --     xor [A*4 + B], A*2, A*2
	/* 13db */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* 13e4 */ x"b6",x"22",x"e4",x"20",x"de",x"fa",             --     xor [A*2], 0xFADE + A, A
	/* 13ea */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"22",x"fb",x"0d",x"d0", --     jne [0x0154], 0xfb22, $fail
	/* 13f4 */ x"b6",x"3f",x"2b",x"e0",x"f6",x"39",x"30",       --     xor [A*4 + -10], A*4 + B, 12345
	/* 13fb */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"5a",x"33",x"0d",x"d0", --     jne [0x029e], 0x335a, $fail
	/* 1405 */ x"b6",x"e0",x"1c",x"e4",x"39",x"30",x"85",x"de",x"fa", --     xor [12345], -123, 0xFADE + A
	/* 140e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"0d",x"04",x"0d",x"d0", --     jne [0x3039], 0x040d, $fail
	/* 1418 */ x"b6",x"20",x"20",x"e4",x"de",x"fa",             --     xor [A], A, 0xFADE + A
	/* 141e */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"22",x"fb",x"0d",x"d0", --     jne [0x00aa], 0xfb22, $fail
	/* 1428 */ x"b6",x"3f",x"e4",x"2b",x"f6",x"de",x"fa",       --     xor [A*4 + -10], 0xFADE + A, A*4 + B
	/* 142f */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"eb",x"f8",x"0d",x"d0", --     jne [0x029e], 0xf8eb, $fail
	/* 1439 */ x"b6",x"22",x"22",x"1c",x"85",                   --     xor [A*2], A*2, -123
	/* 143e */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"d1",x"fe",x"0d",x"d0", --     jne [0x0154], 0xfed1, $fail
	/* 1448 */ x"b6",x"2b",x"2b",x"22",                         --     xor [A*4 + B], A*4 + B, A*2
	/* 144c */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"37",x"02",x"0d",x"d0", --     jne [0x0363], 0x0237, $fail
	/* 1456 */ x"b6",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"39",x"30", --     xor [12345], 12345, 12345
	/* 1460 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* 1469 */ x"b6",x"2b",x"2b",x"1c",x"85",                   --     xor [A*4 + B], A*4 + B, -123
	/* 146e */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"e6",x"fc",x"0d",x"d0", --     jne [0x0363], 0xfce6, $fail
	/* 1478 */ x"b6",x"20",x"22",x"3f",x"f6",                   --     xor [A], A*2, A*4 + -10
	/* 147d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"ca",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03ca, $fail
	/* 1487 */ x"b6",x"20",x"e4",x"e4",x"de",x"fa",x"de",x"fa", --     xor [A], 0xFADE + A, 0xFADE + A
	/* 148f */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* 1498 */ x"b6",x"e0",x"e4",x"2b",x"39",x"30",x"de",x"fa", --     xor [12345], 0xFADE + A, A*4 + B
	/* 14a0 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"eb",x"f8",x"0d",x"d0", --     jne [0x3039], 0xf8eb, $fail
	/* 14aa */ x"b6",x"22",x"3f",x"e4",x"f6",x"de",x"fa",       --     xor [A*2], A*4 + -10, 0xFADE + A
	/* 14b1 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"16",x"f9",x"0d",x"d0", --     jne [0x0154], 0xf916, $fail
	/* 14bb */ x"b6",x"e0",x"e4",x"20",x"39",x"30",x"de",x"fa", --     xor [12345], 0xFADE + A, A
	/* 14c3 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"22",x"fb",x"0d",x"d0", --     jne [0x3039], 0xfb22, $fail
	/* 14cd */ x"b6",x"3f",x"e0",x"e4",x"f6",x"39",x"30",x"de",x"fa", --     xor [A*4 + -10], 12345, 0xFADE + A
	/* 14d6 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"b1",x"cb",x"0d",x"d0", --     jne [0x029e], 0xcbb1, $fail
	/* 14e0 */ x"b6",x"2b",x"22",x"20",                         --     xor [A*4 + B], A*2, A
	/* 14e4 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"fe",x"01",x"0d",x"d0", --     jne [0x0363], 0x01fe, $fail
	/* 14ee */ x"b6",x"2b",x"1c",x"e0",x"85",x"39",x"30",       --     xor [A*4 + B], -123, 12345
	/* 14f5 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"bc",x"cf",x"0d",x"d0", --     jne [0x0363], 0xcfbc, $fail
	/* 14ff */ x"b6",x"20",x"2b",x"e4",x"de",x"fa",             --     xor [A], A*4 + B, 0xFADE + A
	/* 1505 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"eb",x"f8",x"0d",x"d0", --     jne [0x00aa], 0xf8eb, $fail
	/* 150f */ x"b6",x"e0",x"3f",x"1c",x"39",x"30",x"f6",x"85", --     xor [12345], A*4 + -10, -123
	/* 1517 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"1b",x"fd",x"0d",x"d0", --     jne [0x3039], 0xfd1b, $fail
	/* 1521 */ x"b6",x"e0",x"3f",x"2b",x"39",x"30",x"f6",       --     xor [12345], A*4 + -10, A*4 + B
	/* 1528 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"fd",x"01",x"0d",x"d0", --     jne [0x3039], 0x01fd, $fail
	/* 1532 */ x"b6",x"e0",x"e0",x"22",x"39",x"30",x"39",x"30", --     xor [12345], 12345, A*2
	/* 153a */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"6d",x"31",x"0d",x"d0", --     jne [0x3039], 0x316d, $fail
	/* 1544 */ x"b6",x"22",x"20",x"22",                         --     xor [A*2], A, A*2
	/* 1548 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"fe",x"01",x"0d",x"d0", --     jne [0x0154], 0x01fe, $fail
	/* 1552 */ x"b6",x"2b",x"e0",x"3f",x"39",x"30",x"f6",       --     xor [A*4 + B], 12345, A*4 + -10
	/* 1559 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"a7",x"32",x"0d",x"d0", --     jne [0x0363], 0x32a7, $fail
	/* 1563 */ x"b6",x"3f",x"3f",x"3f",x"f6",x"f6",x"f6",       --     xor [A*4 + -10], A*4 + -10, A*4 + -10
	/* 156a */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* 1573 */ x"b6",x"22",x"22",x"2b",                         --     xor [A*2], A*2, A*4 + B
	/* 1577 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"37",x"02",x"0d",x"d0", --     jne [0x0154], 0x0237, $fail
	/* 1581 */ x"62",x"20",x"1c",x"85",                         --     mov [A], -123
	/* 1585 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"85",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xff85, $fail
	/* 158f */ x"62",x"2b",x"e0",x"39",x"30",                   --     mov [A*4 + B], 12345
	/* 1594 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"39",x"30",x"0d",x"d0", --     jne [0x0363], 0x3039, $fail
	/* 159e */ x"62",x"2b",x"e4",x"de",x"fa",                   --     mov [A*4 + B], 0xFADE + A
	/* 15a3 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"88",x"fb",x"0d",x"d0", --     jne [0x0363], 0xfb88, $fail
	/* 15ad */ x"62",x"20",x"3f",x"f6",                         --     mov [A], A*4 + -10
	/* 15b1 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"9e",x"02",x"0d",x"d0", --     jne [0x00aa], 0x029e, $fail
	/* 15bb */ x"62",x"22",x"e0",x"39",x"30",                   --     mov [A*2], 12345
	/* 15c0 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"39",x"30",x"0d",x"d0", --     jne [0x0154], 0x3039, $fail
	/* 15ca */ x"62",x"3f",x"22",x"f6",                         --     mov [A*4 + -10], A*2
	/* 15ce */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"54",x"01",x"0d",x"d0", --     jne [0x029e], 0x0154, $fail
	/* 15d8 */ x"62",x"e0",x"3f",x"39",x"30",x"f6",             --     mov [12345], A*4 + -10
	/* 15de */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"9e",x"02",x"0d",x"d0", --     jne [0x3039], 0x029e, $fail
	/* 15e8 */ x"62",x"22",x"3f",x"f6",                         --     mov [A*2], A*4 + -10
	/* 15ec */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"9e",x"02",x"0d",x"d0", --     jne [0x0154], 0x029e, $fail
	/* 15f6 */ x"62",x"e0",x"20",x"39",x"30",                   --     mov [12345], A
	/* 15fb */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"aa",x"00",x"0d",x"d0", --     jne [0x3039], 0x00aa, $fail
	/* 1605 */ x"62",x"3f",x"3f",x"f6",x"f6",                   --     mov [A*4 + -10], A*4 + -10
	/* 160a */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"9e",x"02",x"0d",x"d0", --     jne [0x029e], 0x029e, $fail
	/* 1614 */ x"62",x"20",x"e4",x"de",x"fa",                   --     mov [A], 0xFADE + A
	/* 1619 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"88",x"fb",x"0d",x"d0", --     jne [0x00aa], 0xfb88, $fail
	/* 1623 */ x"62",x"2b",x"20",                               --     mov [A*4 + B], A
	/* 1626 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"aa",x"00",x"0d",x"d0", --     jne [0x0363], 0x00aa, $fail
	/* 1630 */ x"62",x"3f",x"e4",x"f6",x"de",x"fa",             --     mov [A*4 + -10], 0xFADE + A
	/* 1636 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"88",x"fb",x"0d",x"d0", --     jne [0x029e], 0xfb88, $fail
	/* 1640 */ x"62",x"2b",x"22",                               --     mov [A*4 + B], A*2
	/* 1643 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"54",x"01",x"0d",x"d0", --     jne [0x0363], 0x0154, $fail
	/* 164d */ x"62",x"20",x"20",                               --     mov [A], A
	/* 1650 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"aa",x"00",x"0d",x"d0", --     jne [0x00aa], 0x00aa, $fail
	/* 165a */ x"62",x"22",x"2b",                               --     mov [A*2], A*4 + B
	/* 165d */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"63",x"03",x"0d",x"d0", --     jne [0x0154], 0x0363, $fail
	/* 1667 */ x"62",x"20",x"2b",                               --     mov [A], A*4 + B
	/* 166a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"63",x"03",x"0d",x"d0", --     jne [0x00aa], 0x0363, $fail
	/* 1674 */ x"62",x"22",x"e4",x"de",x"fa",                   --     mov [A*2], 0xFADE + A
	/* 1679 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"88",x"fb",x"0d",x"d0", --     jne [0x0154], 0xfb88, $fail
	/* 1683 */ x"62",x"e0",x"2b",x"39",x"30",                   --     mov [12345], A*4 + B
	/* 1688 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"63",x"03",x"0d",x"d0", --     jne [0x3039], 0x0363, $fail
	/* 1692 */ x"62",x"22",x"22",                               --     mov [A*2], A*2
	/* 1695 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"54",x"01",x"0d",x"d0", --     jne [0x0154], 0x0154, $fail
	/* 169f */ x"62",x"22",x"1c",x"85",                         --     mov [A*2], -123
	/* 16a3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"85",x"ff",x"0d",x"d0", --     jne [0x0154], 0xff85, $fail
	/* 16ad */ x"62",x"20",x"22",                               --     mov [A], A*2
	/* 16b0 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"54",x"01",x"0d",x"d0", --     jne [0x00aa], 0x0154, $fail
	/* 16ba */ x"62",x"3f",x"1c",x"f6",x"85",                   --     mov [A*4 + -10], -123
	/* 16bf */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"85",x"ff",x"0d",x"d0", --     jne [0x029e], 0xff85, $fail
	/* 16c9 */ x"62",x"20",x"e0",x"39",x"30",                   --     mov [A], 12345
	/* 16ce */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"39",x"30",x"0d",x"d0", --     jne [0x00aa], 0x3039, $fail
	/* 16d8 */ x"62",x"2b",x"3f",x"f6",                         --     mov [A*4 + B], A*4 + -10
	/* 16dc */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"9e",x"02",x"0d",x"d0", --     jne [0x0363], 0x029e, $fail
	/* 16e6 */ x"62",x"e0",x"22",x"39",x"30",                   --     mov [12345], A*2
	/* 16eb */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"54",x"01",x"0d",x"d0", --     jne [0x3039], 0x0154, $fail
	/* 16f5 */ x"62",x"3f",x"20",x"f6",                         --     mov [A*4 + -10], A
	/* 16f9 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"aa",x"00",x"0d",x"d0", --     jne [0x029e], 0x00aa, $fail
	/* 1703 */ x"62",x"3f",x"e0",x"f6",x"39",x"30",             --     mov [A*4 + -10], 12345
	/* 1709 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"39",x"30",x"0d",x"d0", --     jne [0x029e], 0x3039, $fail
	/* 1713 */ x"62",x"2b",x"2b",                               --     mov [A*4 + B], A*4 + B
	/* 1716 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"63",x"03",x"0d",x"d0", --     jne [0x0363], 0x0363, $fail
	/* 1720 */ x"62",x"3f",x"2b",x"f6",                         --     mov [A*4 + -10], A*4 + B
	/* 1724 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"63",x"03",x"0d",x"d0", --     jne [0x029e], 0x0363, $fail
	/* 172e */ x"62",x"22",x"20",                               --     mov [A*2], A
	/* 1731 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"aa",x"00",x"0d",x"d0", --     jne [0x0154], 0x00aa, $fail
	/* 173b */ x"62",x"2b",x"1c",x"85",                         --     mov [A*4 + B], -123
	/* 173f */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"85",x"ff",x"0d",x"d0", --     jne [0x0363], 0xff85, $fail
	/* 1749 */ x"62",x"e0",x"1c",x"39",x"30",x"85",             --     mov [12345], -123
	/* 174f */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"85",x"ff",x"0d",x"d0", --     jne [0x3039], 0xff85, $fail
	/* 1759 */ x"62",x"e0",x"e0",x"39",x"30",x"39",x"30",       --     mov [12345], 12345
	/* 1760 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"0d",x"d0", --     jne [0x3039], 0x3039, $fail
	/* 176a */ x"62",x"e0",x"e4",x"39",x"30",x"de",x"fa",       --     mov [12345], 0xFADE + A
	/* 1771 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"88",x"fb",x"0d",x"d0", --     jne [0x3039], 0xfb88, $fail
	/* 177b */ x"e0",x"e4",x"de",x"fa",                         --     push 0xFADE + A
	/* 177f */ x"e4",x"80",                                     --     pop D
	/* 1781 */ x"ec",x"80",x"e0",x"e0",x"88",x"fb",x"0d",x"d0", --     jne D, 0xfb88, $fail
	/* 1789 */ x"e0",x"22",                                     --     push A*2
	/* 178b */ x"e4",x"80",                                     --     pop D
	/* 178d */ x"ec",x"80",x"e0",x"e0",x"54",x"01",x"0d",x"d0", --     jne D, 0x0154, $fail
	/* 1795 */ x"e0",x"3f",x"f6",                               --     push A*4 + -10
	/* 1798 */ x"e4",x"80",                                     --     pop D
	/* 179a */ x"ec",x"80",x"e0",x"e0",x"9e",x"02",x"0d",x"d0", --     jne D, 0x029e, $fail
	/* 17a2 */ x"e0",x"20",                                     --     push A
	/* 17a4 */ x"e4",x"80",                                     --     pop D
	/* 17a6 */ x"ec",x"80",x"e0",x"e0",x"aa",x"00",x"0d",x"d0", --     jne D, 0x00aa, $fail
	/* 17ae */ x"e0",x"2b",                                     --     push A*4 + B
	/* 17b0 */ x"e4",x"80",                                     --     pop D
	/* 17b2 */ x"ec",x"80",x"e0",x"e0",x"63",x"03",x"0d",x"d0", --     jne D, 0x0363, $fail
	/* 17ba */ x"e0",x"e0",x"39",x"30",                         --     push 12345
	/* 17be */ x"e4",x"80",                                     --     pop D
	/* 17c0 */ x"ec",x"80",x"e0",x"e0",x"39",x"30",x"0d",x"d0", --     jne D, 0x3039, $fail
	/* 17c8 */ x"e0",x"1c",x"85",                               --     push -123
	/* 17cb */ x"e4",x"80",                                     --     pop D
	/* 17cd */ x"ec",x"80",x"e0",x"e0",x"85",x"ff",x"0d",x"d0", --     jne D, 0xff85, $fail
	/* 17d5 */ x"5c",x"e0",x"e5",x"e7",                         --     call $_L_test_uop_get_arg_1
	/* 17d9 */ x"ec",x"60",x"e0",x"e0",x"fe",x"ad",x"0d",x"d0", --     jne C, 0xADFE, $fail
	/* 17e1 */ x"58",x"e0",x"ef",x"e7",                         --     jmp $_L_test_uop_get_arg_2
	/*     */                                                  -- _L_test_uop_get_arg_1:
	/* 17e5 */ x"60",x"60",x"e0",x"fe",x"ad",                   --     mov C, 0xADFE
	/* 17ea */ x"dc",                                           --     ret
	/* 17eb */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- _L_test_uop_get_arg_2:
	/*     */                                                  --
	/*     */                                                  -- # BEGIN test_call_ret.asm
	/*     */                                                  -- test_call_ret:
	/*     */                                                  --
	/* 17ef */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* 17f4 */ x"5c",x"e0",x"6b",x"e8",                         --     call $fn_test_target
	/* 17f8 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*     */                                                  --
	/* 1800 */ x"60",x"20",x"1c",x"0a",                         --     mov A, 10
	/* 1804 */ x"60",x"40",x"00",                               --     mov B, 0
	/* 1807 */ x"60",x"60",x"00",                               --     mov C, 0
	/* 180a */ x"60",x"80",x"00",                               --     mov D, 0
	/* 180d */ x"5c",x"e0",x"3a",x"e8",                         --     call $fn_recursive
	/*     */                                                  --
	/* 1811 */ x"ec",x"20",x"00",x"e0",x"0d",x"d0",             --     jne A, 0, $fail
	/* 1817 */ x"ec",x"40",x"e0",x"e0",x"3f",x"cf",x"0d",x"d0", --     jne B, 0xcf3f, $fail
	/* 181f */ x"ec",x"60",x"1c",x"e0",x"2d",x"0d",x"d0",       --     jne C, 0x002d, $fail
	/* 1826 */ x"ec",x"80",x"e0",x"e0",x"97",x"45",x"0d",x"d0", --     jne D, 0x4597, $fail
	/* 182e */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*     */                                                  --
	/* 1836 */ x"58",x"e0",x"78",x"e8",                         --     jmp $test_call_ret_end
	/*     */                                                  --
	/*     */                                                  -- fn_recursive:
	/* 183a */ x"04",x"20",x"1c",x"01",                         --     sub A, 1
	/* 183e */ x"5c",x"e0",x"63",x"e8",                         --     call $fn_process_c
	/* 1842 */ x"e8",x"20",x"00",x"e0",x"5e",x"e8",             --     jeq A, 0, $fn_recursive_end
	/* 1848 */ x"5c",x"e0",x"3a",x"e8",                         --     call $fn_recursive
	/* 184c */ x"00",x"80",x"60",                               --     add D, C
	/* 184f */ x"08",x"80",x"1c",x"03",                         --     mul D, 3
	/* 1853 */ x"00",x"40",x"80",                               --     add B, D
	/* 1856 */ x"e0",x"80",                                     --     push D
	/* 1858 */ x"08",x"40",x"1c",x"05",                         --     mul B, 5
	/* 185c */ x"e4",x"80",                                     --     pop D
	/*     */                                                  -- fn_recursive_end:
	/* 185e */ x"dc",                                           --     ret
	/* 185f */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  --
	/*     */                                                  -- fn_process_c:
	/* 1863 */ x"00",x"60",x"20",                               --     add C, A
	/* 1866 */ x"dc",                                           --     ret
	/* 1867 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  --
	/*     */                                                  -- fn_test_target:
	/* 186b */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0x0ffe, $fail
	/* 1873 */ x"dc",                                           --     ret
	/* 1874 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  --
	/*     */                                                  -- test_call_ret_end:
	/*     */                                                  -- # END test_call_ret.asm
	/*     */                                                  --
	/*     */                                                  --
	/*     */                                                  -- # BEGIN test_mem_access.asm
	/*     */                                                  -- test_mem_access:
	/* 1878 */ x"62",x"e0",x"e0",x"00",x"01",x"ed",x"ff",       --     mov [0x100], 0xFFED
	/* 187f */ x"ee",x"e0",x"e0",x"e0",x"00",x"01",x"aa",x"00",x"8d",x"e8", --     jne [0x100], 0x00AA, $test_mem_access_check_jmp
	/* 1889 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*     */                                                  -- test_mem_access_check_jmp:
	/*     */                                                  --
	/* 188d */ x"62",x"e0",x"00",x"00",x"10",                   --     mov [0x1000], 0
	/* 1892 */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* 1897 */ x"ee",x"a0",x"00",x"e0",x"0d",x"d0",             --     jne [SP], 0, $fail
	/* 189d */ x"e0",x"00",                                     --     push 0
	/* 189f */ x"e0",x"00",                                     --     push 0
	/* 18a1 */ x"e0",x"00",                                     --     push 0
	/* 18a3 */ x"e4",x"20",                                     --     pop A
	/* 18a5 */ x"e4",x"20",                                     --     pop A
	/* 18a7 */ x"e4",x"20",                                     --     pop A
	/* 18a9 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/* 18b1 */ x"ec",x"20",x"00",x"e0",x"0d",x"d0",             --     jne A, 0, $fail
	/*     */                                                  --
	/* 18b7 */ x"e0",x"e0",x"02",x"01",                         --     push 0x0102
	/* 18bb */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0xFFE, $fail
	/* 18c3 */ x"e0",x"e0",x"04",x"03",                         --     push 0x0304
	/* 18c7 */ x"ec",x"a0",x"e0",x"e0",x"fc",x"0f",x"0d",x"d0", --     jne SP, 0xFFC, $fail
	/*     */                                                  --
	/* 18cf */ x"ee",x"e0",x"e0",x"e0",x"fe",x"0f",x"02",x"01",x"0d",x"d0", --     jne [0xFFE], 0x0102, $fail
	/* 18d9 */ x"ee",x"e0",x"e0",x"e0",x"fc",x"0f",x"04",x"03",x"0d",x"d0", --     jne [0xFFC], 0x0304, $fail
	/*     */                                                  --
	/*     */                                                  --     # unaligned
	/* 18e3 */ x"ee",x"e0",x"e0",x"e0",x"fb",x"0f",x"00",x"04",x"0d",x"d0", --     jne [0xFFB], 0x0400, $fail
	/* 18ed */ x"ee",x"e0",x"e0",x"e0",x"fd",x"0f",x"03",x"02",x"0d",x"d0", --     jne [0xFFD], 0x0203, $fail
	/* 18f7 */ x"ee",x"e0",x"1c",x"e0",x"ff",x"0f",x"01",x"0d",x"d0", --     jne [0xFFF], 0x0001, $fail
	/*     */                                                  --
	/* 1900 */ x"e4",x"20",                                     --     pop A
	/* 1902 */ x"ec",x"20",x"e0",x"e0",x"04",x"03",x"0d",x"d0", --     jne A, 0x0304, $fail
	/* 190a */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0xFFE, $fail
	/* 1912 */ x"e4",x"20",                                     --     pop A
	/* 1914 */ x"ec",x"20",x"e0",x"e0",x"02",x"01",x"0d",x"d0", --     jne A, 0x0102, $fail
	/* 191c */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*     */                                                  --
	/*     */                                                  -- # END test_mem_access.asm
	/*     */                                                  --
	/*     */                                                  --
	/*     */                                                  -- # BEGIN test_cmp.asm
	/*     */                                                  -- test_cmp:
	/* 1924 */ x"cc",x"e0",x"ff",x"ff",                         --     setf 0xFFFF
	/* 1928 */ x"4c",x"20",                                     --     getf A
	/* 192a */ x"ec",x"20",x"1c",x"e0",x"3f",x"0d",x"d0",       --     jne A, 0x3F, $fail
	/*     */                                                  --
	/* 1931 */ x"cc",x"e0",x"ab",x"ab",                         --     setf 0xABAB
	/* 1935 */ x"4c",x"20",                                     --     getf A
	/* 1937 */ x"ec",x"20",x"1c",x"e0",x"2b",x"0d",x"d0",       --     jne A, 0x2B, $fail
	/*     */                                                  --
	/*     */                                                  --     # unsigned
	/* 193e */ x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             --     cmp 0xFFAB, 0x2B
	/* 1944 */ x"4c",x"20",                                     --     getf A
	/*     */                                                  --     # GE GT LE LT NE EQ
	/* 1946 */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*     */                                                  --
	/* 194d */ x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             --     cmp 0x2B, 0xFFAB
	/* 1953 */ x"4c",x"20",                                     --     getf A
	/* 1955 */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*     */                                                  --
	/* 195c */ x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     cmp 0xFFAB, 0xFFAB
	/* 1963 */ x"4c",x"20",                                     --     getf A
	/* 1965 */ x"ec",x"20",x"1c",x"e0",x"29",x"0d",x"d0",       --     jne A, 0b101001, $fail
	/*     */                                                  --
	/*     */                                                  --     # signed
	/* 196c */ x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             --     icmp 0xFFAB, 0x2B
	/* 1972 */ x"4c",x"20",                                     --     getf A
	/*     */                                                  --     # GE GT LE LT NE EQ
	/* 1974 */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*     */                                                  --
	/* 197b */ x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             --     icmp 0x2B, 0xFFAB
	/* 1981 */ x"4c",x"20",                                     --     getf A
	/* 1983 */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*     */                                                  --
	/* 198a */ x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     icmp 0xFFAB, 0xFFAB
	/* 1991 */ x"4c",x"20",                                     --     getf A
	/* 1993 */ x"ec",x"20",x"1c",x"e0",x"29",x"0d",x"d0",       --     jne A, 0b101001, $fail
	/*     */                                                  -- # END test_cmp.asm
	/*     */                                                  --
	/*     */                                                  -- end_of_test:
	/* 199a */ x"60",x"20",x"e0",x"ad",x"de",                   --     mov A, 0xDEAD
	/* 199f */ x"60",x"40",x"e0",x"ef",x"be",                   --     mov B, 0xBEEF
	/* 19a4 */ x"88",x"60",x"20",x"40",                         --     mul C, A, B
	/* 19a8 */ x"58",x"e0",x"12",x"d0",                         --     jmp $success
	/*     */                                                  --
	/* 19ac */ x"d8"                                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
