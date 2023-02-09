
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is
-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 10601;
type TArrROM is array (0 to ROMSize-1) of TByte;
constant arr_rom : TArrROM := (
	/*      */                                                  --
	/*      */                                                  -- # BEGIN preamble.asm
	/*      */                                                  -- .offset 0xD000
	/*      */                                                  -- .boot:
	/* d000 */ x"60",x"20",x"e0",x"fa",x"ff",                   --     mov A, 0xFFFA
	/* d005 */ x"ec",x"20",x"e0",x"e0",x"fa",x"00",x"55",x"d0", --     jne A, 0x00FA, $start_test
	/*      */                                                  -- fail:
	/*      */                                                  --     # register A contains failed test
	/* d00d */ x"d8",                                           --     halt
	/* d00e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- success:
	/* d012 */ x"ec",x"20",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne A, 0xDEAD, $fail  # check cookie
	/* d01a */ x"ec",x"40",x"e0",x"e0",x"ef",x"be",x"0d",x"d0", --     jne B, 0xBEEF, $fail
	/* d022 */ x"ec",x"60",x"e0",x"e0",x"83",x"49",x"0d",x"d0", --     jne C, 0x4983, $fail
	/* d02a */ x"ec",x"ff",x"e0",x"e0",x"14",x"a6",x"0d",x"d0", --     jne H, 0xA614, $fail
	/* d032 */ x"60",x"80",x"ff",                               --     mov D, H
	/*      */                                                  --     # okay!
	/* d035 */ x"00",x"20",x"e0",x"ab",x"ac",                   --     add A, 0xACAB
	/* d03a */ x"00",x"40",x"e0",x"cc",x"41",                   --     add B, 0x41CC
	/* d03f */ x"08",x"20",x"80",                               --     mul A, D
	/* d042 */ x"34",x"20",x"e0",x"4a",x"f2",                   --     xor A, 0xF24A
	/* d047 */ x"34",x"60",x"e0",x"4f",x"49",                   --     xor C, 0x494F
	/* d04c */ x"34",x"ff",x"e0",x"30",x"5a",                   --     xor H, 0x5A30
	/* d051 */ x"60",x"80",x"ff",                               --     mov D, H
	/*      */                                                  --     # A = 0x00aa
	/*      */                                                  --     # B = 0x00bb
	/*      */                                                  --     # C = 0x00cc
	/*      */                                                  --     # D = 0x0055
	/* d054 */ x"d8",                                           --     halt
	/*      */                                                  -- # END preamble.asm
	/*      */                                                  --
	/*      */                                                  -- start_test:
	/*      */                                                  -- alu_test:
	/*      */                                                  --      # t=True, a=d230, b=a012
	/* d055 */ x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     add B, 0xd230, 0xa012
	/* d05d */ x"ec",x"40",x"e0",x"e0",x"42",x"72",x"0d",x"d0", --     jne B, 0x7242, $fail
	/*      */                                                  --
	/* d065 */ x"84",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     sub B, 0xd230, 0xa012
	/* d06d */ x"ec",x"40",x"e0",x"e0",x"1e",x"32",x"0d",x"d0", --     jne B, 0x321e, $fail
	/*      */                                                  --
	/* d075 */ x"88",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     mul B, 0xd230, 0xa012
	/* d07d */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0d",x"d0", --     jne B, 0xc760, $fail
	/* d085 */ x"ec",x"ff",x"e0",x"e0",x"6c",x"83",x"0d",x"d0", --     jne H, 0x836c, $fail
	/*      */                                                  --
	/* d08d */ x"8c",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     imul B, 0xd230, 0xa012
	/* d095 */ x"ec",x"40",x"e0",x"e0",x"60",x"c7",x"0d",x"d0", --     jne B, 0xc760, $fail
	/* d09d */ x"ec",x"ff",x"e0",x"e0",x"2a",x"11",x"0d",x"d0", --     jne H, 0x112a, $fail
	/*      */                                                  --
	/* d0a5 */ x"a0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shr B, 0xd230, 0xa012
	/* d0ad */ x"ec",x"40",x"e0",x"e0",x"8c",x"34",x"0d",x"d0", --     jne B, 0x348c, $fail
	/*      */                                                  --
	/* d0b5 */ x"a4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     ishr B, 0xd230, 0xa012
	/* d0bd */ x"ec",x"40",x"e0",x"e0",x"8c",x"f4",x"0d",x"d0", --     jne B, 0xf48c, $fail
	/*      */                                                  --
	/* d0c5 */ x"a8",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     shl B, 0xd230, 0xa012
	/* d0cd */ x"ec",x"40",x"e0",x"e0",x"c0",x"48",x"0d",x"d0", --     jne B, 0x48c0, $fail
	/*      */                                                  --
	/* d0d5 */ x"ac",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     and B, 0xd230, 0xa012
	/* d0dd */ x"ec",x"40",x"e0",x"e0",x"10",x"80",x"0d",x"d0", --     jne B, 0x8010, $fail
	/*      */                                                  --
	/* d0e5 */ x"b0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     or B, 0xd230, 0xa012
	/* d0ed */ x"ec",x"40",x"e0",x"e0",x"32",x"f2",x"0d",x"d0", --     jne B, 0xf232, $fail
	/*      */                                                  --
	/* d0f5 */ x"b4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", --     xor B, 0xd230, 0xa012
	/* d0fd */ x"ec",x"40",x"e0",x"e0",x"22",x"72",x"0d",x"d0", --     jne B, 0x7222, $fail
	/*      */                                                  --
	/* d105 */ x"b8",x"40",x"e0",x"30",x"d2",                   --     neg B, 0xd230
	/* d10a */ x"ec",x"40",x"e0",x"e0",x"d0",x"2d",x"0d",x"d0", --     jne B, 0x2dd0, $fail
	/*      */                                                  --
	/* d112 */ x"bc",x"40",x"e0",x"30",x"d2",                   --     not B, 0xd230
	/* d117 */ x"ec",x"40",x"e0",x"e0",x"cf",x"2d",x"0d",x"d0", --     jne B, 0x2dcf, $fail
	/*      */                                                  --
	/* d11f */ x"c0",x"40",x"e0",x"30",x"d2",                   --     bool B, 0xd230
	/* d124 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d12b */ x"c4",x"40",x"e0",x"30",x"d2",                   --     inc B, 0xd230
	/* d130 */ x"ec",x"40",x"e0",x"e0",x"31",x"d2",x"0d",x"d0", --     jne B, 0xd231, $fail
	/*      */                                                  --
	/* d138 */ x"c8",x"40",x"e0",x"30",x"d2",                   --     dec B, 0xd230
	/* d13d */ x"ec",x"40",x"e0",x"e0",x"2f",x"d2",x"0d",x"d0", --     jne B, 0xd22f, $fail
	/*      */                                                  --
	/*      */                                                  --      # t=True, a=00ad, b=da37
	/* d145 */ x"80",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     add B, 0x00ad, 0xda37
	/* d14d */ x"ec",x"40",x"e0",x"e0",x"e4",x"da",x"0d",x"d0", --     jne B, 0xdae4, $fail
	/*      */                                                  --
	/* d155 */ x"84",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     sub B, 0x00ad, 0xda37
	/* d15d */ x"ec",x"40",x"e0",x"e0",x"76",x"26",x"0d",x"d0", --     jne B, 0x2676, $fail
	/*      */                                                  --
	/* d165 */ x"88",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     mul B, 0x00ad, 0xda37
	/* d16d */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0d",x"d0", --     jne B, 0x772b, $fail
	/* d175 */ x"ec",x"ff",x"e0",x"e0",x"93",x"00",x"0d",x"d0", --     jne H, 0x0093, $fail
	/*      */                                                  --
	/* d17d */ x"8c",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     imul B, 0x00ad, 0xda37
	/* d185 */ x"ec",x"40",x"e0",x"e0",x"2b",x"77",x"0d",x"d0", --     jne B, 0x772b, $fail
	/* d18d */ x"ec",x"ff",x"e0",x"e0",x"e6",x"ff",x"0d",x"d0", --     jne H, 0xffe6, $fail
	/*      */                                                  --
	/* d195 */ x"a0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     shr B, 0x00ad, 0xda37
	/* d19d */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d1a4 */ x"a4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     ishr B, 0x00ad, 0xda37
	/* d1ac */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d1b3 */ x"a8",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     shl B, 0x00ad, 0xda37
	/* d1bb */ x"ec",x"40",x"e0",x"e0",x"80",x"56",x"0d",x"d0", --     jne B, 0x5680, $fail
	/*      */                                                  --
	/* d1c3 */ x"ac",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     and B, 0x00ad, 0xda37
	/* d1cb */ x"ec",x"40",x"1c",x"e0",x"25",x"0d",x"d0",       --     jne B, 0x0025, $fail
	/*      */                                                  --
	/* d1d2 */ x"b0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     or B, 0x00ad, 0xda37
	/* d1da */ x"ec",x"40",x"e0",x"e0",x"bf",x"da",x"0d",x"d0", --     jne B, 0xdabf, $fail
	/*      */                                                  --
	/* d1e2 */ x"b4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", --     xor B, 0x00ad, 0xda37
	/* d1ea */ x"ec",x"40",x"e0",x"e0",x"9a",x"da",x"0d",x"d0", --     jne B, 0xda9a, $fail
	/*      */                                                  --
	/* d1f2 */ x"b8",x"40",x"e0",x"ad",x"00",                   --     neg B, 0x00ad
	/* d1f7 */ x"ec",x"40",x"e0",x"e0",x"53",x"ff",x"0d",x"d0", --     jne B, 0xff53, $fail
	/*      */                                                  --
	/* d1ff */ x"bc",x"40",x"e0",x"ad",x"00",                   --     not B, 0x00ad
	/* d204 */ x"ec",x"40",x"e0",x"e0",x"52",x"ff",x"0d",x"d0", --     jne B, 0xff52, $fail
	/*      */                                                  --
	/* d20c */ x"c0",x"40",x"e0",x"ad",x"00",                   --     bool B, 0x00ad
	/* d211 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d218 */ x"c4",x"40",x"e0",x"ad",x"00",                   --     inc B, 0x00ad
	/* d21d */ x"ec",x"40",x"e0",x"e0",x"ae",x"00",x"0d",x"d0", --     jne B, 0x00ae, $fail
	/*      */                                                  --
	/* d225 */ x"c8",x"40",x"e0",x"ad",x"00",                   --     dec B, 0x00ad
	/* d22a */ x"ec",x"40",x"e0",x"e0",x"ac",x"00",x"0d",x"d0", --     jne B, 0x00ac, $fail
	/*      */                                                  --
	/*      */                                                  --      # t=False, a=f0ad, b=2a3f
	/* d232 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d237 */ x"00",x"40",x"e0",x"3f",x"2a",                   --     add B, 0x2a3f
	/* d23c */ x"ec",x"40",x"e0",x"e0",x"ec",x"1a",x"0d",x"d0", --     jne B, 0x1aec, $fail
	/*      */                                                  --
	/* d244 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d249 */ x"04",x"40",x"e0",x"3f",x"2a",                   --     sub B, 0x2a3f
	/* d24e */ x"ec",x"40",x"e0",x"e0",x"6e",x"c6",x"0d",x"d0", --     jne B, 0xc66e, $fail
	/*      */                                                  --
	/* d256 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d25b */ x"08",x"40",x"e0",x"3f",x"2a",                   --     mul B, 0x2a3f
	/* d260 */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0d",x"d0", --     jne B, 0x9c93, $fail
	/* d268 */ x"ec",x"ff",x"e0",x"e0",x"b7",x"27",x"0d",x"d0", --     jne H, 0x27b7, $fail
	/*      */                                                  --
	/* d270 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d275 */ x"0c",x"40",x"e0",x"3f",x"2a",                   --     imul B, 0x2a3f
	/* d27a */ x"ec",x"40",x"e0",x"e0",x"93",x"9c",x"0d",x"d0", --     jne B, 0x9c93, $fail
	/* d282 */ x"ec",x"ff",x"e0",x"e0",x"78",x"fd",x"0d",x"d0", --     jne H, 0xfd78, $fail
	/*      */                                                  --
	/* d28a */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d28f */ x"20",x"40",x"e0",x"3f",x"2a",                   --     shr B, 0x2a3f
	/* d294 */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d29b */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2a0 */ x"24",x"40",x"e0",x"3f",x"2a",                   --     ishr B, 0x2a3f
	/* d2a5 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*      */                                                  --
	/* d2ad */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2b2 */ x"28",x"40",x"e0",x"3f",x"2a",                   --     shl B, 0x2a3f
	/* d2b7 */ x"ec",x"40",x"e0",x"e0",x"00",x"80",x"0d",x"d0", --     jne B, 0x8000, $fail
	/*      */                                                  --
	/* d2bf */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2c4 */ x"2c",x"40",x"e0",x"3f",x"2a",                   --     and B, 0x2a3f
	/* d2c9 */ x"ec",x"40",x"e0",x"e0",x"2d",x"20",x"0d",x"d0", --     jne B, 0x202d, $fail
	/*      */                                                  --
	/* d2d1 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2d6 */ x"30",x"40",x"e0",x"3f",x"2a",                   --     or B, 0x2a3f
	/* d2db */ x"ec",x"40",x"e0",x"e0",x"bf",x"fa",x"0d",x"d0", --     jne B, 0xfabf, $fail
	/*      */                                                  --
	/* d2e3 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2e8 */ x"34",x"40",x"e0",x"3f",x"2a",                   --     xor B, 0x2a3f
	/* d2ed */ x"ec",x"40",x"e0",x"e0",x"92",x"da",x"0d",x"d0", --     jne B, 0xda92, $fail
	/*      */                                                  --
	/* d2f5 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d2fa */ x"38",x"40",                                     --     neg B
	/* d2fc */ x"ec",x"40",x"e0",x"e0",x"53",x"0f",x"0d",x"d0", --     jne B, 0x0f53, $fail
	/*      */                                                  --
	/* d304 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d309 */ x"3c",x"40",                                     --     not B
	/* d30b */ x"ec",x"40",x"e0",x"e0",x"52",x"0f",x"0d",x"d0", --     jne B, 0x0f52, $fail
	/*      */                                                  --
	/* d313 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d318 */ x"40",x"40",                                     --     bool B
	/* d31a */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d321 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d326 */ x"44",x"40",                                     --     inc B
	/* d328 */ x"ec",x"40",x"e0",x"e0",x"ae",x"f0",x"0d",x"d0", --     jne B, 0xf0ae, $fail
	/*      */                                                  --
	/* d330 */ x"60",x"40",x"e0",x"ad",x"f0",                   --     mov B, 0xf0ad
	/* d335 */ x"48",x"40",                                     --     dec B
	/* d337 */ x"ec",x"40",x"e0",x"e0",x"ac",x"f0",x"0d",x"d0", --     jne B, 0xf0ac, $fail
	/*      */                                                  --
	/*      */                                                  --      # t=False, a=0000, b=dead
	/* d33f */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d343 */ x"00",x"40",x"e0",x"ad",x"de",                   --     add B, 0xdead
	/* d348 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*      */                                                  --
	/* d350 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d354 */ x"04",x"40",x"e0",x"ad",x"de",                   --     sub B, 0xdead
	/* d359 */ x"ec",x"40",x"e0",x"e0",x"53",x"21",x"0d",x"d0", --     jne B, 0x2153, $fail
	/*      */                                                  --
	/* d361 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d365 */ x"08",x"40",x"e0",x"ad",x"de",                   --     mul B, 0xdead
	/* d36a */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/* d371 */ x"ec",x"ff",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne H, 0x0000, $fail
	/*      */                                                  --
	/* d378 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d37c */ x"0c",x"40",x"e0",x"ad",x"de",                   --     imul B, 0xdead
	/* d381 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/* d388 */ x"ec",x"ff",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne H, 0x0000, $fail
	/*      */                                                  --
	/* d38f */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d393 */ x"20",x"40",x"e0",x"ad",x"de",                   --     shr B, 0xdead
	/* d398 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d39f */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3a3 */ x"24",x"40",x"e0",x"ad",x"de",                   --     ishr B, 0xdead
	/* d3a8 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d3af */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3b3 */ x"28",x"40",x"e0",x"ad",x"de",                   --     shl B, 0xdead
	/* d3b8 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d3bf */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3c3 */ x"2c",x"40",x"e0",x"ad",x"de",                   --     and B, 0xdead
	/* d3c8 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d3cf */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3d3 */ x"30",x"40",x"e0",x"ad",x"de",                   --     or B, 0xdead
	/* d3d8 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*      */                                                  --
	/* d3e0 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3e4 */ x"34",x"40",x"e0",x"ad",x"de",                   --     xor B, 0xdead
	/* d3e9 */ x"ec",x"40",x"e0",x"e0",x"ad",x"de",x"0d",x"d0", --     jne B, 0xdead, $fail
	/*      */                                                  --
	/* d3f1 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d3f5 */ x"38",x"40",                                     --     neg B
	/* d3f7 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d3fe */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d402 */ x"3c",x"40",                                     --     not B
	/* d404 */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*      */                                                  --
	/* d40c */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d410 */ x"40",x"40",                                     --     bool B
	/* d412 */ x"ec",x"40",x"1c",x"e0",x"00",x"0d",x"d0",       --     jne B, 0x0000, $fail
	/*      */                                                  --
	/* d419 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d41d */ x"44",x"40",                                     --     inc B
	/* d41f */ x"ec",x"40",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne B, 0x0001, $fail
	/*      */                                                  --
	/* d426 */ x"60",x"40",x"1c",x"00",                         --     mov B, 0x0000
	/* d42a */ x"48",x"40",                                     --     dec B
	/* d42c */ x"ec",x"40",x"e0",x"e0",x"ff",x"ff",x"0d",x"d0", --     jne B, 0xffff, $fail
	/*      */                                                  --
	/*      */                                                  -- jmp_test:
	/* d434 */ x"e8",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jeq 0xffab, 0x002b, $fail
	/* d43d */ x"ec",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"4a",x"d4", --     jne 0xffab, 0x002b, $_L_test_jmp_1
	/* d446 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_1:
	/* d44a */ x"f0",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jlt 0xffab, 0x002b, $fail
	/* d453 */ x"f4",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"0d",x"d0", --     jle 0xffab, 0x002b, $fail
	/* d45c */ x"f8",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"69",x"d4", --     jgt 0xffab, 0x002b, $_L_test_jmp_2
	/* d465 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_2:
	/* d469 */ x"fc",x"e0",x"1c",x"e0",x"ab",x"ff",x"2b",x"76",x"d4", --     jge 0xffab, 0x002b, $_L_test_jmp_3
	/* d472 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_3:
	/* d476 */ x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             --     cmp 0xffab, 0x002b
	/* d47c */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* d480 */ x"6c",x"e0",x"88",x"d4",                         --     jne $_L_test_jmp_4
	/* d484 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_4:
	/* d488 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* d48c */ x"74",x"e0",x"0d",x"d0",                         --     jle $fail
	/* d490 */ x"78",x"e0",x"98",x"d4",                         --     jgt $_L_test_jmp_5
	/* d494 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_5:
	/* d498 */ x"7c",x"e0",x"a0",x"d4",                         --     jge $_L_test_jmp_6
	/* d49c */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_6:
	/* d4a0 */ x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             --     icmp 0xffab, 0x002b
	/* d4a6 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* d4aa */ x"6c",x"e0",x"b2",x"d4",                         --     jne $_L_test_jmp_7
	/* d4ae */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_7:
	/* d4b2 */ x"70",x"e0",x"ba",x"d4",                         --     jlt $_L_test_jmp_8
	/* d4b6 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_8:
	/* d4ba */ x"74",x"e0",x"c2",x"d4",                         --     jle $_L_test_jmp_9
	/* d4be */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_9:
	/* d4c2 */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* d4c6 */ x"7c",x"e0",x"0d",x"d0",                         --     jge $fail
	/* d4ca */ x"e8",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jeq 0x002b, 0xffab, $fail
	/* d4d3 */ x"ec",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"e0",x"d4", --     jne 0x002b, 0xffab, $_L_test_jmp_10
	/* d4dc */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_10:
	/* d4e0 */ x"f0",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"ed",x"d4", --     jlt 0x002b, 0xffab, $_L_test_jmp_11
	/* d4e9 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_11:
	/* d4ed */ x"f4",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"fa",x"d4", --     jle 0x002b, 0xffab, $_L_test_jmp_12
	/* d4f6 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_12:
	/* d4fa */ x"f8",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jgt 0x002b, 0xffab, $fail
	/* d503 */ x"fc",x"1c",x"e0",x"e0",x"2b",x"ab",x"ff",x"0d",x"d0", --     jge 0x002b, 0xffab, $fail
	/* d50c */ x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             --     cmp 0x002b, 0xffab
	/* d512 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* d516 */ x"6c",x"e0",x"1e",x"d5",                         --     jne $_L_test_jmp_13
	/* d51a */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_13:
	/* d51e */ x"70",x"e0",x"26",x"d5",                         --     jlt $_L_test_jmp_14
	/* d522 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_14:
	/* d526 */ x"74",x"e0",x"2e",x"d5",                         --     jle $_L_test_jmp_15
	/* d52a */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_15:
	/* d52e */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* d532 */ x"7c",x"e0",x"0d",x"d0",                         --     jge $fail
	/* d536 */ x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             --     icmp 0x002b, 0xffab
	/* d53c */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* d540 */ x"6c",x"e0",x"48",x"d5",                         --     jne $_L_test_jmp_16
	/* d544 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_16:
	/* d548 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* d54c */ x"74",x"e0",x"0d",x"d0",                         --     jle $fail
	/* d550 */ x"78",x"e0",x"58",x"d5",                         --     jgt $_L_test_jmp_17
	/* d554 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_17:
	/* d558 */ x"7c",x"e0",x"60",x"d5",                         --     jge $_L_test_jmp_18
	/* d55c */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_18:
	/* d560 */ x"e8",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"6e",x"d5", --     jeq 0xffab, 0xffab, $_L_test_jmp_19
	/* d56a */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_19:
	/* d56e */ x"ec",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jne 0xffab, 0xffab, $fail
	/* d578 */ x"f0",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jlt 0xffab, 0xffab, $fail
	/* d582 */ x"f4",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"90",x"d5", --     jle 0xffab, 0xffab, $_L_test_jmp_20
	/* d58c */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_20:
	/* d590 */ x"f8",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"0d",x"d0", --     jgt 0xffab, 0xffab, $fail
	/* d59a */ x"fc",x"e0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",x"a8",x"d5", --     jge 0xffab, 0xffab, $_L_test_jmp_21
	/* d5a4 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_21:
	/* d5a8 */ x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     cmp 0xffab, 0xffab
	/* d5af */ x"68",x"e0",x"b7",x"d5",                         --     jeq $_L_test_jmp_22
	/* d5b3 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_22:
	/* d5b7 */ x"6c",x"e0",x"0d",x"d0",                         --     jne $fail
	/* d5bb */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* d5bf */ x"74",x"e0",x"c7",x"d5",                         --     jle $_L_test_jmp_23
	/* d5c3 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_23:
	/* d5c7 */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* d5cb */ x"7c",x"e0",x"d3",x"d5",                         --     jge $_L_test_jmp_24
	/* d5cf */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_24:
	/* d5d3 */ x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     icmp 0xffab, 0xffab
	/* d5da */ x"68",x"e0",x"e2",x"d5",                         --     jeq $_L_test_jmp_25
	/* d5de */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_25:
	/* d5e2 */ x"6c",x"e0",x"0d",x"d0",                         --     jne $fail
	/* d5e6 */ x"70",x"e0",x"0d",x"d0",                         --     jlt $fail
	/* d5ea */ x"74",x"e0",x"f2",x"d5",                         --     jle $_L_test_jmp_26
	/* d5ee */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_26:
	/* d5f2 */ x"78",x"e0",x"0d",x"d0",                         --     jgt $fail
	/* d5f6 */ x"7c",x"e0",x"fe",x"d5",                         --     jge $_L_test_jmp_27
	/* d5fa */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_jmp_27:
	/*      */                                                  -- test_uop_get_arg:
	/* d5fe */ x"60",x"a0",x"e0",x"00",x"70",                   --     mov SP, 0x7000
	/* d603 */ x"60",x"20",x"e0",x"aa",x"00",                   --     mov A, 0x00aa
	/* d608 */ x"60",x"40",x"e0",x"bb",x"00",                   --     mov B, 0x00bb
	/* d60d */ x"60",x"fe",x"e0",x"55",x"01",                   --     mov G, 0x0155
	/* d612 */ x"b6",x"e0",x"1c",x"fe",x"39",x"30",x"85",       --     xor [12345], -123, G
	/* d619 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"d0",x"fe",x"0d",x"d0", --     jne [0x3039], 0xfed0, $fail
	/* d623 */ x"ae",x"3e",x"fe",x"21",x"f6",                   --     and [A*4 + -10], G, A*2
	/* d628 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"54",x"01",x"0d",x"d0", --     jne [0x029e], 0x0154, $fail
	/* d632 */ x"86",x"21",x"e4",x"3e",x"de",x"fa",x"f6",       --     sub [A*2], 0xFADE + A, A*4 + -10
	/* d639 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ea",x"f8",x"0d",x"d0", --     jne [0x0154], 0xf8ea, $fail
	/* d643 */ x"a6",x"e0",x"20",x"21",x"39",x"30",             --     ishr [12345], A, A*2
	/* d649 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"0a",x"0d",x"d0", --     jne [0x3039], 0x000a, $fail
	/* d652 */ x"aa",x"fe",x"2a",x"3e",x"f6",                   --     shl [G], A*4 + B, A*4 + -10
	/* d657 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"00",x"c0",x"0d",x"d0", --     jne [0x0155], 0xc000, $fail
	/* d661 */ x"b2",x"fe",x"1c",x"fe",x"85",                   --     or [G], -123, G
	/* d666 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"d5",x"ff",x"0d",x"d0", --     jne [0x0155], 0xffd5, $fail
	/* d670 */ x"8a",x"2a",x"1c",x"20",x"85",                   --     mul [A*4 + B], -123, A
	/* d675 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"52",x"ae",x"0d",x"d0", --     jne [0x0363], 0xae52, $fail
	/* d67f */ x"a6",x"e0",x"e0",x"2a",x"39",x"30",x"39",x"30", --     ishr [12345], 12345, A*4 + B
	/* d687 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"07",x"06",x"0d",x"d0", --     jne [0x3039], 0x0607, $fail
	/* d691 */ x"a2",x"21",x"e4",x"21",x"de",x"fa",             --     shr [A*2], 0xFADE + A, A*2
	/* d697 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"b8",x"0f",x"0d",x"d0", --     jne [0x0154], 0x0fb8, $fail
	/* d6a1 */ x"82",x"21",x"fe",x"fe",                         --     add [A*2], G, G
	/* d6a5 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"aa",x"02",x"0d",x"d0", --     jne [0x0154], 0x02aa, $fail
	/* d6af */ x"a6",x"fe",x"e4",x"20",x"de",x"fa",             --     ishr [G], 0xFADE + A, A
	/* d6b5 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"fe",x"ff",x"0d",x"d0", --     jne [0x0155], 0xfffe, $fail
	/* d6bf */ x"82",x"e0",x"e4",x"2a",x"39",x"30",x"de",x"fa", --     add [12345], 0xFADE + A, A*4 + B
	/* d6c7 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"eb",x"fe",x"0d",x"d0", --     jne [0x3039], 0xfeeb, $fail
	/* d6d1 */ x"a6",x"20",x"20",x"20",                         --     ishr [A], A, A
	/* d6d5 */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* d6de */ x"82",x"fe",x"2a",x"20",                         --     add [G], A*4 + B, A
	/* d6e2 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"0d",x"04",x"0d",x"d0", --     jne [0x0155], 0x040d, $fail
	/* d6ec */ x"b6",x"fe",x"fe",x"fe",                         --     xor [G], G, G
	/* d6f0 */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"00",x"0d",x"d0", --     jne [0x0155], 0x0000, $fail
	/* d6f9 */ x"aa",x"21",x"fe",x"21",                         --     shl [A*2], G, A*2
	/* d6fd */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"50",x"15",x"0d",x"d0", --     jne [0x0154], 0x1550, $fail
	/* d707 */ x"a6",x"fe",x"e0",x"21",x"39",x"30",             --     ishr [G], 12345, A*2
	/* d70d */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"03",x"03",x"0d",x"d0", --     jne [0x0155], 0x0303, $fail
	/* d717 */ x"ae",x"21",x"2a",x"e4",x"de",x"fa",             --     and [A*2], A*4 + B, 0xFADE + A
	/* d71d */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"00",x"03",x"0d",x"d0", --     jne [0x0154], 0x0300, $fail
	/* d727 */ x"82",x"20",x"3e",x"3e",x"f6",x"f6",             --     add [A], A*4 + -10, A*4 + -10
	/* d72d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"3c",x"05",x"0d",x"d0", --     jne [0x00aa], 0x053c, $fail
	/* d737 */ x"b2",x"e0",x"21",x"1c",x"39",x"30",x"85",       --     or [12345], A*2, -123
	/* d73e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"d5",x"ff",x"0d",x"d0", --     jne [0x3039], 0xffd5, $fail
	/* d748 */ x"82",x"e0",x"fe",x"fe",x"39",x"30",             --     add [12345], G, G
	/* d74e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"aa",x"02",x"0d",x"d0", --     jne [0x3039], 0x02aa, $fail
	/* d758 */ x"ae",x"fe",x"e0",x"e4",x"39",x"30",x"de",x"fa", --     and [G], 12345, 0xFADE + A
	/* d760 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"08",x"30",x"0d",x"d0", --     jne [0x0155], 0x3008, $fail
	/* d76a */ x"8e",x"e0",x"2a",x"3e",x"39",x"30",x"f6",       --     imul [12345], A*4 + B, A*4 + -10
	/* d771 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"1a",x"dd",x"0d",x"d0", --     jne [0x3039], 0xdd1a, $fail
	/* d77b */ x"b2",x"21",x"e0",x"20",x"39",x"30",             --     or [A*2], 12345, A
	/* d781 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"bb",x"30",x"0d",x"d0", --     jne [0x0154], 0x30bb, $fail
	/* d78b */ x"8e",x"21",x"3e",x"21",x"f6",                   --     imul [A*2], A*4 + -10, A*2
	/* d790 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"d8",x"79",x"0d",x"d0", --     jne [0x0154], 0x79d8, $fail
	/* d79a */ x"82",x"3e",x"1c",x"2a",x"f6",x"85",             --     add [A*4 + -10], -123, A*4 + B
	/* d7a0 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"e8",x"02",x"0d",x"d0", --     jne [0x029e], 0x02e8, $fail
	/* d7aa */ x"86",x"fe",x"e4",x"21",x"de",x"fa",             --     sub [G], 0xFADE + A, A*2
	/* d7b0 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"34",x"fa",x"0d",x"d0", --     jne [0x0155], 0xfa34, $fail
	/* d7ba */ x"b2",x"2a",x"e4",x"21",x"de",x"fa",             --     or [A*4 + B], 0xFADE + A, A*2
	/* d7c0 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"dc",x"fb",x"0d",x"d0", --     jne [0x0363], 0xfbdc, $fail
	/* d7ca */ x"ae",x"21",x"21",x"20",                         --     and [A*2], A*2, A
	/* d7ce */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* d7d7 */ x"86",x"2a",x"2a",x"fe",                         --     sub [A*4 + B], A*4 + B, G
	/* d7db */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"0e",x"02",x"0d",x"d0", --     jne [0x0363], 0x020e, $fail
	/* d7e5 */ x"82",x"3e",x"3e",x"20",x"f6",x"f6",             --     add [A*4 + -10], A*4 + -10, A
	/* d7eb */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"48",x"03",x"0d",x"d0", --     jne [0x029e], 0x0348, $fail
	/* d7f5 */ x"86",x"21",x"e0",x"e0",x"39",x"30",x"39",x"30", --     sub [A*2], 12345, 12345
	/* d7fd */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* d806 */ x"a2",x"20",x"1c",x"fe",x"85",                   --     shr [A], -123, G
	/* d80b */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"fc",x"07",x"0d",x"d0", --     jne [0x00aa], 0x07fc, $fail
	/* d815 */ x"aa",x"2a",x"1c",x"2a",x"85",                   --     shl [A*4 + B], -123, A*4 + B
	/* d81a */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"28",x"fc",x"0d",x"d0", --     jne [0x0363], 0xfc28, $fail
	/* d824 */ x"b2",x"2a",x"20",x"20",                         --     or [A*4 + B], A, A
	/* d828 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"aa",x"00",x"0d",x"d0", --     jne [0x0363], 0x00aa, $fail
	/* d832 */ x"86",x"20",x"20",x"1c",x"85",                   --     sub [A], A, -123
	/* d837 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"25",x"01",x"0d",x"d0", --     jne [0x00aa], 0x0125, $fail
	/* d841 */ x"a6",x"3e",x"e4",x"21",x"f6",x"de",x"fa",       --     ishr [A*4 + -10], 0xFADE + A, A*2
	/* d848 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"b8",x"ff",x"0d",x"d0", --     jne [0x029e], 0xffb8, $fail
	/* d852 */ x"86",x"20",x"e0",x"e0",x"39",x"30",x"39",x"30", --     sub [A], 12345, 12345
	/* d85a */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* d863 */ x"82",x"fe",x"e0",x"e0",x"39",x"30",x"39",x"30", --     add [G], 12345, 12345
	/* d86b */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"72",x"60",x"0d",x"d0", --     jne [0x0155], 0x6072, $fail
	/* d875 */ x"a2",x"2a",x"e4",x"e4",x"de",x"fa",x"de",x"fa", --     shr [A*4 + B], 0xFADE + A, 0xFADE + A
	/* d87d */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"fb",x"00",x"0d",x"d0", --     jne [0x0363], 0x00fb, $fail
	/* d887 */ x"8e",x"20",x"20",x"fe",                         --     imul [A], A, G
	/* d88b */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"72",x"e2",x"0d",x"d0", --     jne [0x00aa], 0xe272, $fail
	/* d895 */ x"a2",x"21",x"e4",x"2a",x"de",x"fa",             --     shr [A*2], 0xFADE + A, A*4 + B
	/* d89b */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"71",x"1f",x"0d",x"d0", --     jne [0x0154], 0x1f71, $fail
	/* d8a5 */ x"a2",x"2a",x"2a",x"1c",x"85",                   --     shr [A*4 + B], A*4 + B, -123
	/* d8aa */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"1b",x"0d",x"d0", --     jne [0x0363], 0x001b, $fail
	/* d8b3 */ x"a2",x"20",x"21",x"2a",                         --     shr [A], A*2, A*4 + B
	/* d8b7 */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"2a",x"0d",x"d0", --     jne [0x00aa], 0x002a, $fail
	/* d8c0 */ x"ae",x"e0",x"2a",x"20",x"39",x"30",             --     and [12345], A*4 + B, A
	/* d8c6 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"22",x"0d",x"d0", --     jne [0x3039], 0x0022, $fail
	/* d8cf */ x"a2",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"39",x"30", --     shr [12345], 12345, 12345
	/* d8d9 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"18",x"0d",x"d0", --     jne [0x3039], 0x0018, $fail
	/* d8e2 */ x"8a",x"20",x"fe",x"3e",x"f6",                   --     mul [A], G, A*4 + -10
	/* d8e7 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"76",x"7c",x"0d",x"d0", --     jne [0x00aa], 0x7c76, $fail
	/* d8f1 */ x"82",x"2a",x"e0",x"2a",x"39",x"30",             --     add [A*4 + B], 12345, A*4 + B
	/* d8f7 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"9c",x"33",x"0d",x"d0", --     jne [0x0363], 0x339c, $fail
	/* d901 */ x"8e",x"fe",x"3e",x"2a",x"f6",                   --     imul [G], A*4 + -10, A*4 + B
	/* d906 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"1a",x"dd",x"0d",x"d0", --     jne [0x0155], 0xdd1a, $fail
	/* d910 */ x"aa",x"20",x"21",x"e0",x"39",x"30",             --     shl [A], A*2, 12345
	/* d916 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"00",x"a8",x"0d",x"d0", --     jne [0x00aa], 0xa800, $fail
	/* d920 */ x"82",x"21",x"fe",x"20",                         --     add [A*2], G, A
	/* d924 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ff",x"01",x"0d",x"d0", --     jne [0x0154], 0x01ff, $fail
	/* d92e */ x"82",x"2a",x"2a",x"21",                         --     add [A*4 + B], A*4 + B, A*2
	/* d932 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"b7",x"04",x"0d",x"d0", --     jne [0x0363], 0x04b7, $fail
	/* d93c */ x"a2",x"20",x"fe",x"e4",x"de",x"fa",             --     shr [A], G, 0xFADE + A
	/* d942 */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"01",x"0d",x"d0", --     jne [0x00aa], 0x0001, $fail
	/* d94b */ x"82",x"fe",x"1c",x"20",x"85",                   --     add [G], -123, A
	/* d950 */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"2f",x"0d",x"d0", --     jne [0x0155], 0x002f, $fail
	/* d959 */ x"8e",x"3e",x"fe",x"e0",x"f6",x"39",x"30",       --     imul [A*4 + -10], G, 12345
	/* d960 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"ed",x"3b",x"0d",x"d0", --     jne [0x029e], 0x3bed, $fail
	/* d96a */ x"8a",x"fe",x"e4",x"2a",x"de",x"fa",             --     mul [G], 0xFADE + A, A*4 + B
	/* d970 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"98",x"dd",x"0d",x"d0", --     jne [0x0155], 0xdd98, $fail
	/* d97a */ x"a2",x"fe",x"fe",x"20",                         --     shr [G], G, A
	/* d97e */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"00",x"0d",x"d0", --     jne [0x0155], 0x0000, $fail
	/* d987 */ x"b2",x"21",x"20",x"20",                         --     or [A*2], A, A
	/* d98b */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"aa",x"00",x"0d",x"d0", --     jne [0x0154], 0x00aa, $fail
	/* d995 */ x"b2",x"3e",x"1c",x"21",x"f6",x"85",             --     or [A*4 + -10], -123, A*2
	/* d99b */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"d5",x"ff",x"0d",x"d0", --     jne [0x029e], 0xffd5, $fail
	/* d9a5 */ x"8a",x"2a",x"1c",x"1c",x"85",x"85",             --     mul [A*4 + B], -123, -123
	/* d9ab */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"19",x"3b",x"0d",x"d0", --     jne [0x0363], 0x3b19, $fail
	/* d9b5 */ x"8a",x"e0",x"e4",x"21",x"39",x"30",x"de",x"fa", --     mul [12345], 0xFADE + A, A*2
	/* d9bd */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"a0",x"10",x"0d",x"d0", --     jne [0x3039], 0x10a0, $fail
	/* d9c7 */ x"86",x"fe",x"20",x"3e",x"f6",                   --     sub [G], A, A*4 + -10
	/* d9cc */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"0c",x"fe",x"0d",x"d0", --     jne [0x0155], 0xfe0c, $fail
	/* d9d6 */ x"aa",x"20",x"2a",x"21",                         --     shl [A], A*4 + B, A*2
	/* d9da */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"30",x"36",x"0d",x"d0", --     jne [0x00aa], 0x3630, $fail
	/* d9e4 */ x"b6",x"21",x"1c",x"2a",x"85",                   --     xor [A*2], -123, A*4 + B
	/* d9e9 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"e6",x"fc",x"0d",x"d0", --     jne [0x0154], 0xfce6, $fail
	/* d9f3 */ x"86",x"2a",x"3e",x"1c",x"f6",x"85",             --     sub [A*4 + B], A*4 + -10, -123
	/* d9f9 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"19",x"03",x"0d",x"d0", --     jne [0x0363], 0x0319, $fail
	/* da03 */ x"86",x"e0",x"e0",x"e4",x"39",x"30",x"39",x"30",x"de",x"fa", --     sub [12345], 12345, 0xFADE + A
	/* da0d */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"b1",x"34",x"0d",x"d0", --     jne [0x3039], 0x34b1, $fail
	/* da17 */ x"ae",x"fe",x"2a",x"e4",x"de",x"fa",             --     and [G], A*4 + B, 0xFADE + A
	/* da1d */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"00",x"03",x"0d",x"d0", --     jne [0x0155], 0x0300, $fail
	/* da27 */ x"aa",x"20",x"3e",x"fe",x"f6",                   --     shl [A], A*4 + -10, G
	/* da2c */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"c0",x"53",x"0d",x"d0", --     jne [0x00aa], 0x53c0, $fail
	/* da36 */ x"a6",x"fe",x"fe",x"e4",x"de",x"fa",             --     ishr [G], G, 0xFADE + A
	/* da3c */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"01",x"0d",x"d0", --     jne [0x0155], 0x0001, $fail
	/* da45 */ x"ae",x"21",x"e0",x"2a",x"39",x"30",             --     and [A*2], 12345, A*4 + B
	/* da4b */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"21",x"0d",x"d0", --     jne [0x0154], 0x0021, $fail
	/* da54 */ x"a6",x"21",x"21",x"1c",x"85",                   --     ishr [A*2], A*2, -123
	/* da59 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"0a",x"0d",x"d0", --     jne [0x0154], 0x000a, $fail
	/* da62 */ x"b6",x"fe",x"21",x"e0",x"39",x"30",             --     xor [G], A*2, 12345
	/* da68 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"6d",x"31",x"0d",x"d0", --     jne [0x0155], 0x316d, $fail
	/* da72 */ x"86",x"2a",x"3e",x"2a",x"f6",                   --     sub [A*4 + B], A*4 + -10, A*4 + B
	/* da77 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"3b",x"ff",x"0d",x"d0", --     jne [0x0363], 0xff3b, $fail
	/* da81 */ x"b2",x"e0",x"fe",x"1c",x"39",x"30",x"85",       --     or [12345], G, -123
	/* da88 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"d5",x"ff",x"0d",x"d0", --     jne [0x3039], 0xffd5, $fail
	/* da92 */ x"aa",x"2a",x"3e",x"20",x"f6",                   --     shl [A*4 + B], A*4 + -10, A
	/* da97 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"00",x"78",x"0d",x"d0", --     jne [0x0363], 0x7800, $fail
	/* daa1 */ x"86",x"e0",x"21",x"20",x"39",x"30",             --     sub [12345], A*2, A
	/* daa7 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"aa",x"00",x"0d",x"d0", --     jne [0x3039], 0x00aa, $fail
	/* dab1 */ x"b6",x"e0",x"2a",x"21",x"39",x"30",             --     xor [12345], A*4 + B, A*2
	/* dab7 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"37",x"02",x"0d",x"d0", --     jne [0x3039], 0x0237, $fail
	/* dac1 */ x"ae",x"2a",x"e0",x"1c",x"39",x"30",x"85",       --     and [A*4 + B], 12345, -123
	/* dac8 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"01",x"30",x"0d",x"d0", --     jne [0x0363], 0x3001, $fail
	/* dad2 */ x"8e",x"fe",x"2a",x"e0",x"39",x"30",             --     imul [G], A*4 + B, 12345
	/* dad8 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"0b",x"51",x"0d",x"d0", --     jne [0x0155], 0x510b, $fail
	/* dae2 */ x"b2",x"2a",x"20",x"fe",                         --     or [A*4 + B], A, G
	/* dae6 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"ff",x"01",x"0d",x"d0", --     jne [0x0363], 0x01ff, $fail
	/* daf0 */ x"a6",x"3e",x"e0",x"20",x"f6",x"39",x"30",       --     ishr [A*4 + -10], 12345, A
	/* daf7 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"0c",x"0d",x"d0", --     jne [0x029e], 0x000c, $fail
	/* db00 */ x"aa",x"e0",x"e4",x"e4",x"39",x"30",x"de",x"fa",x"de",x"fa", --     shl [12345], 0xFADE + A, 0xFADE + A
	/* db0a */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"00",x"88",x"0d",x"d0", --     jne [0x3039], 0x8800, $fail
	/* db14 */ x"aa",x"20",x"e0",x"fe",x"39",x"30",             --     shl [A], 12345, G
	/* db1a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"20",x"07",x"0d",x"d0", --     jne [0x00aa], 0x0720, $fail
	/* db24 */ x"b6",x"fe",x"3e",x"21",x"f6",                   --     xor [G], A*4 + -10, A*2
	/* db29 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"ca",x"03",x"0d",x"d0", --     jne [0x0155], 0x03ca, $fail
	/* db33 */ x"b2",x"2a",x"fe",x"1c",x"85",                   --     or [A*4 + B], G, -123
	/* db38 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"d5",x"ff",x"0d",x"d0", --     jne [0x0363], 0xffd5, $fail
	/* db42 */ x"86",x"3e",x"1c",x"e0",x"f6",x"85",x"39",x"30", --     sub [A*4 + -10], -123, 12345
	/* db4a */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"4c",x"cf",x"0d",x"d0", --     jne [0x029e], 0xcf4c, $fail
	/* db54 */ x"aa",x"21",x"21",x"21",                         --     shl [A*2], A*2, A*2
	/* db58 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"40",x"15",x"0d",x"d0", --     jne [0x0154], 0x1540, $fail
	/* db62 */ x"86",x"e0",x"e4",x"e0",x"39",x"30",x"de",x"fa",x"39",x"30", --     sub [12345], 0xFADE + A, 12345
	/* db6c */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"4f",x"cb",x"0d",x"d0", --     jne [0x3039], 0xcb4f, $fail
	/* db76 */ x"a2",x"21",x"e0",x"1c",x"39",x"30",x"85",       --     shr [A*2], 12345, -123
	/* db7d */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"81",x"01",x"0d",x"d0", --     jne [0x0154], 0x0181, $fail
	/* db87 */ x"a6",x"e0",x"e4",x"20",x"39",x"30",x"de",x"fa", --     ishr [12345], 0xFADE + A, A
	/* db8f */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"fe",x"ff",x"0d",x"d0", --     jne [0x3039], 0xfffe, $fail
	/* db99 */ x"b6",x"3e",x"e4",x"e0",x"f6",x"de",x"fa",x"39",x"30", --     xor [A*4 + -10], 0xFADE + A, 12345
	/* dba2 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"b1",x"cb",x"0d",x"d0", --     jne [0x029e], 0xcbb1, $fail
	/* dbac */ x"86",x"3e",x"21",x"3e",x"f6",x"f6",             --     sub [A*4 + -10], A*2, A*4 + -10
	/* dbb2 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"b6",x"fe",x"0d",x"d0", --     jne [0x029e], 0xfeb6, $fail
	/* dbbc */ x"8e",x"fe",x"1c",x"3e",x"85",x"f6",             --     imul [G], -123, A*4 + -10
	/* dbc2 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"16",x"be",x"0d",x"d0", --     jne [0x0155], 0xbe16, $fail
	/* dbcc */ x"aa",x"20",x"2a",x"2a",                         --     shl [A], A*4 + B, A*4 + B
	/* dbd0 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"18",x"1b",x"0d",x"d0", --     jne [0x00aa], 0x1b18, $fail
	/* dbda */ x"b6",x"e0",x"21",x"2a",x"39",x"30",             --     xor [12345], A*2, A*4 + B
	/* dbe0 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"37",x"02",x"0d",x"d0", --     jne [0x3039], 0x0237, $fail
	/* dbea */ x"82",x"21",x"21",x"e0",x"39",x"30",             --     add [A*2], A*2, 12345
	/* dbf0 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"8d",x"31",x"0d",x"d0", --     jne [0x0154], 0x318d, $fail
	/* dbfa */ x"ae",x"21",x"2a",x"20",                         --     and [A*2], A*4 + B, A
	/* dbfe */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"22",x"0d",x"d0", --     jne [0x0154], 0x0022, $fail
	/* dc07 */ x"aa",x"20",x"2a",x"e4",x"de",x"fa",             --     shl [A], A*4 + B, 0xFADE + A
	/* dc0d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"00",x"63",x"0d",x"d0", --     jne [0x00aa], 0x6300, $fail
	/* dc17 */ x"ae",x"2a",x"fe",x"20",                         --     and [A*4 + B], G, A
	/* dc1b */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* dc24 */ x"b6",x"fe",x"21",x"1c",x"85",                   --     xor [G], A*2, -123
	/* dc29 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"d1",x"fe",x"0d",x"d0", --     jne [0x0155], 0xfed1, $fail
	/* dc33 */ x"ae",x"e0",x"fe",x"21",x"39",x"30",             --     and [12345], G, A*2
	/* dc39 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"54",x"01",x"0d",x"d0", --     jne [0x3039], 0x0154, $fail
	/* dc43 */ x"b2",x"3e",x"e0",x"2a",x"f6",x"39",x"30",       --     or [A*4 + -10], 12345, A*4 + B
	/* dc4a */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"7b",x"33",x"0d",x"d0", --     jne [0x029e], 0x337b, $fail
	/* dc54 */ x"b6",x"fe",x"e4",x"3e",x"de",x"fa",x"f6",       --     xor [G], 0xFADE + A, A*4 + -10
	/* dc5b */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"16",x"f9",x"0d",x"d0", --     jne [0x0155], 0xf916, $fail
	/* dc65 */ x"8e",x"2a",x"21",x"2a",                         --     imul [A*4 + B], A*2, A*4 + B
	/* dc69 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"7c",x"7f",x"0d",x"d0", --     jne [0x0363], 0x7f7c, $fail
	/* dc73 */ x"a6",x"fe",x"21",x"fe",                         --     ishr [G], A*2, G
	/* dc77 */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"0a",x"0d",x"d0", --     jne [0x0155], 0x000a, $fail
	/* dc80 */ x"8a",x"21",x"1c",x"1c",x"85",x"85",             --     mul [A*2], -123, -123
	/* dc86 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"19",x"3b",x"0d",x"d0", --     jne [0x0154], 0x3b19, $fail
	/* dc90 */ x"8e",x"2a",x"e4",x"20",x"de",x"fa",             --     imul [A*4 + B], 0xFADE + A, A
	/* dc96 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"50",x"08",x"0d",x"d0", --     jne [0x0363], 0x0850, $fail
	/* dca0 */ x"a2",x"3e",x"3e",x"3e",x"f6",x"f6",x"f6",       --     shr [A*4 + -10], A*4 + -10, A*4 + -10
	/* dca7 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* dcb0 */ x"8a",x"20",x"1c",x"e4",x"85",x"de",x"fa",       --     mul [A], -123, 0xFADE + A
	/* dcb7 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"a8",x"25",x"0d",x"d0", --     jne [0x00aa], 0x25a8, $fail
	/* dcc1 */ x"a6",x"3e",x"20",x"21",x"f6",                   --     ishr [A*4 + -10], A, A*2
	/* dcc6 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"0a",x"0d",x"d0", --     jne [0x029e], 0x000a, $fail
	/* dccf */ x"b2",x"3e",x"20",x"20",x"f6",                   --     or [A*4 + -10], A, A
	/* dcd4 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"aa",x"00",x"0d",x"d0", --     jne [0x029e], 0x00aa, $fail
	/* dcde */ x"82",x"e0",x"fe",x"e0",x"39",x"30",x"39",x"30", --     add [12345], G, 12345
	/* dce6 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"8e",x"31",x"0d",x"d0", --     jne [0x3039], 0x318e, $fail
	/* dcf0 */ x"8e",x"3e",x"e0",x"3e",x"f6",x"39",x"30",x"f6", --     imul [A*4 + -10], 12345, A*4 + -10
	/* dcf8 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"2e",x"35",x"0d",x"d0", --     jne [0x029e], 0x352e, $fail
	/* dd02 */ x"a6",x"fe",x"fe",x"21",                         --     ishr [G], G, A*2
	/* dd06 */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"15",x"0d",x"d0", --     jne [0x0155], 0x0015, $fail
	/* dd0f */ x"8e",x"20",x"e4",x"3e",x"de",x"fa",x"f6",       --     imul [A], 0xFADE + A, A*4 + -10
	/* dd16 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"f0",x"4d",x"0d",x"d0", --     jne [0x00aa], 0x4df0, $fail
	/* dd20 */ x"a6",x"fe",x"20",x"fe",                         --     ishr [G], A, G
	/* dd24 */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"05",x"0d",x"d0", --     jne [0x0155], 0x0005, $fail
	/* dd2d */ x"82",x"2a",x"e0",x"3e",x"39",x"30",x"f6",       --     add [A*4 + B], 12345, A*4 + -10
	/* dd34 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"d7",x"32",x"0d",x"d0", --     jne [0x0363], 0x32d7, $fail
	/* dd3e */ x"ae",x"3e",x"2a",x"e4",x"f6",x"de",x"fa",       --     and [A*4 + -10], A*4 + B, 0xFADE + A
	/* dd45 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"00",x"03",x"0d",x"d0", --     jne [0x029e], 0x0300, $fail
	/* dd4f */ x"8e",x"20",x"1c",x"2a",x"85",                   --     imul [A], -123, A*4 + B
	/* dd54 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"6f",x"5f",x"0d",x"d0", --     jne [0x00aa], 0x5f6f, $fail
	/* dd5e */ x"a2",x"fe",x"3e",x"e4",x"f6",x"de",x"fa",       --     shr [G], A*4 + -10, 0xFADE + A
	/* dd65 */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"02",x"0d",x"d0", --     jne [0x0155], 0x0002, $fail
	/* dd6e */ x"b2",x"2a",x"e0",x"20",x"39",x"30",             --     or [A*4 + B], 12345, A
	/* dd74 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"bb",x"30",x"0d",x"d0", --     jne [0x0363], 0x30bb, $fail
	/* dd7e */ x"b6",x"2a",x"e0",x"fe",x"39",x"30",             --     xor [A*4 + B], 12345, G
	/* dd84 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"6c",x"31",x"0d",x"d0", --     jne [0x0363], 0x316c, $fail
	/* dd8e */ x"8e",x"20",x"20",x"e0",x"39",x"30",             --     imul [A], A, 12345
	/* dd94 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"da",x"05",x"0d",x"d0", --     jne [0x00aa], 0x05da, $fail
	/* dd9e */ x"b2",x"21",x"2a",x"3e",x"f6",                   --     or [A*2], A*4 + B, A*4 + -10
	/* dda3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ff",x"03",x"0d",x"d0", --     jne [0x0154], 0x03ff, $fail
	/* ddad */ x"aa",x"fe",x"e4",x"e0",x"de",x"fa",x"39",x"30", --     shl [G], 0xFADE + A, 12345
	/* ddb5 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"00",x"10",x"0d",x"d0", --     jne [0x0155], 0x1000, $fail
	/* ddbf */ x"a6",x"2a",x"e4",x"2a",x"de",x"fa",             --     ishr [A*4 + B], 0xFADE + A, A*4 + B
	/* ddc5 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"71",x"ff",x"0d",x"d0", --     jne [0x0363], 0xff71, $fail
	/* ddcf */ x"aa",x"3e",x"e4",x"1c",x"f6",x"de",x"fa",x"85", --     shl [A*4 + -10], 0xFADE + A, -123
	/* ddd7 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"00",x"71",x"0d",x"d0", --     jne [0x029e], 0x7100, $fail
	/* dde1 */ x"a2",x"3e",x"e4",x"20",x"f6",x"de",x"fa",       --     shr [A*4 + -10], 0xFADE + A, A
	/* dde8 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"3e",x"0d",x"d0", --     jne [0x029e], 0x003e, $fail
	/* ddf1 */ x"8a",x"3e",x"20",x"2a",x"f6",                   --     mul [A*4 + -10], A, A*4 + B
	/* ddf6 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"be",x"3f",x"0d",x"d0", --     jne [0x029e], 0x3fbe, $fail
	/* de00 */ x"b2",x"21",x"3e",x"2a",x"f6",                   --     or [A*2], A*4 + -10, A*4 + B
	/* de05 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ff",x"03",x"0d",x"d0", --     jne [0x0154], 0x03ff, $fail
	/* de0f */ x"8e",x"3e",x"21",x"1c",x"f6",x"85",             --     imul [A*4 + -10], A*2, -123
	/* de15 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"a4",x"5c",x"0d",x"d0", --     jne [0x029e], 0x5ca4, $fail
	/* de1f */ x"aa",x"e0",x"3e",x"21",x"39",x"30",x"f6",       --     shl [12345], A*4 + -10, A*2
	/* de26 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"e0",x"29",x"0d",x"d0", --     jne [0x3039], 0x29e0, $fail
	/* de30 */ x"aa",x"21",x"e4",x"e4",x"de",x"fa",x"de",x"fa", --     shl [A*2], 0xFADE + A, 0xFADE + A
	/* de38 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"00",x"88",x"0d",x"d0", --     jne [0x0154], 0x8800, $fail
	/* de42 */ x"82",x"fe",x"21",x"21",                         --     add [G], A*2, A*2
	/* de46 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"a8",x"02",x"0d",x"d0", --     jne [0x0155], 0x02a8, $fail
	/* de50 */ x"ae",x"21",x"e4",x"fe",x"de",x"fa",             --     and [A*2], 0xFADE + A, G
	/* de56 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"00",x"01",x"0d",x"d0", --     jne [0x0154], 0x0100, $fail
	/* de60 */ x"ae",x"3e",x"e0",x"e0",x"f6",x"39",x"30",x"39",x"30", --     and [A*4 + -10], 12345, 12345
	/* de69 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"39",x"30",x"0d",x"d0", --     jne [0x029e], 0x3039, $fail
	/* de73 */ x"aa",x"3e",x"20",x"1c",x"f6",x"85",             --     shl [A*4 + -10], A, -123
	/* de79 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"40",x"15",x"0d",x"d0", --     jne [0x029e], 0x1540, $fail
	/* de83 */ x"ae",x"2a",x"3e",x"e4",x"f6",x"de",x"fa",       --     and [A*4 + B], A*4 + -10, 0xFADE + A
	/* de8a */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"88",x"02",x"0d",x"d0", --     jne [0x0363], 0x0288, $fail
	/* de94 */ x"82",x"fe",x"1c",x"1c",x"85",x"85",             --     add [G], -123, -123
	/* de9a */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"0a",x"ff",x"0d",x"d0", --     jne [0x0155], 0xff0a, $fail
	/* dea4 */ x"8a",x"20",x"20",x"e4",x"de",x"fa",             --     mul [A], A, 0xFADE + A
	/* deaa */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"50",x"08",x"0d",x"d0", --     jne [0x00aa], 0x0850, $fail
	/* deb4 */ x"b2",x"21",x"2a",x"fe",                         --     or [A*2], A*4 + B, G
	/* deb8 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"77",x"03",x"0d",x"d0", --     jne [0x0154], 0x0377, $fail
	/* dec2 */ x"86",x"fe",x"e4",x"e4",x"de",x"fa",x"de",x"fa", --     sub [G], 0xFADE + A, 0xFADE + A
	/* deca */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"00",x"0d",x"d0", --     jne [0x0155], 0x0000, $fail
	/* ded3 */ x"a2",x"2a",x"fe",x"e4",x"de",x"fa",             --     shr [A*4 + B], G, 0xFADE + A
	/* ded9 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"01",x"0d",x"d0", --     jne [0x0363], 0x0001, $fail
	/* dee2 */ x"86",x"21",x"1c",x"fe",x"85",                   --     sub [A*2], -123, G
	/* dee7 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"30",x"fe",x"0d",x"d0", --     jne [0x0154], 0xfe30, $fail
	/* def1 */ x"aa",x"3e",x"21",x"fe",x"f6",                   --     shl [A*4 + -10], A*2, G
	/* def6 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"80",x"2a",x"0d",x"d0", --     jne [0x029e], 0x2a80, $fail
	/* df00 */ x"aa",x"20",x"1c",x"3e",x"85",x"f6",             --     shl [A], -123, A*4 + -10
	/* df06 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"00",x"40",x"0d",x"d0", --     jne [0x00aa], 0x4000, $fail
	/* df10 */ x"8a",x"3e",x"2a",x"21",x"f6",                   --     mul [A*4 + -10], A*4 + B, A*2
	/* df15 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"7c",x"7f",x"0d",x"d0", --     jne [0x029e], 0x7f7c, $fail
	/* df1f */ x"a2",x"20",x"2a",x"fe",                         --     shr [A], A*4 + B, G
	/* df23 */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"1b",x"0d",x"d0", --     jne [0x00aa], 0x001b, $fail
	/* df2c */ x"82",x"20",x"2a",x"e0",x"39",x"30",             --     add [A], A*4 + B, 12345
	/* df32 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"9c",x"33",x"0d",x"d0", --     jne [0x00aa], 0x339c, $fail
	/* df3c */ x"b6",x"fe",x"e0",x"1c",x"39",x"30",x"85",       --     xor [G], 12345, -123
	/* df43 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"bc",x"cf",x"0d",x"d0", --     jne [0x0155], 0xcfbc, $fail
	/* df4d */ x"86",x"20",x"e4",x"2a",x"de",x"fa",             --     sub [A], 0xFADE + A, A*4 + B
	/* df53 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"25",x"f8",x"0d",x"d0", --     jne [0x00aa], 0xf825, $fail
	/* df5d */ x"a6",x"2a",x"21",x"fe",                         --     ishr [A*4 + B], A*2, G
	/* df61 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"0a",x"0d",x"d0", --     jne [0x0363], 0x000a, $fail
	/* df6a */ x"b2",x"21",x"fe",x"e4",x"de",x"fa",             --     or [A*2], G, 0xFADE + A
	/* df70 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"dd",x"fb",x"0d",x"d0", --     jne [0x0154], 0xfbdd, $fail
	/* df7a */ x"8a",x"e0",x"e4",x"fe",x"39",x"30",x"de",x"fa", --     mul [12345], 0xFADE + A, G
	/* df82 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"28",x"0c",x"0d",x"d0", --     jne [0x3039], 0x0c28, $fail
	/* df8c */ x"8e",x"2a",x"2a",x"e4",x"de",x"fa",             --     imul [A*4 + B], A*4 + B, 0xFADE + A
	/* df92 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"98",x"dd",x"0d",x"d0", --     jne [0x0363], 0xdd98, $fail
	/* df9c */ x"ae",x"e0",x"20",x"fe",x"39",x"30",             --     and [12345], A, G
	/* dfa2 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* dfab */ x"8e",x"fe",x"fe",x"2a",                         --     imul [G], G, A*4 + B
	/* dfaf */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"df",x"82",x"0d",x"d0", --     jne [0x0155], 0x82df, $fail
	/* dfb9 */ x"8e",x"3e",x"21",x"21",x"f6",                   --     imul [A*4 + -10], A*2, A*2
	/* dfbe */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"90",x"c3",x"0d",x"d0", --     jne [0x029e], 0xc390, $fail
	/* dfc8 */ x"b2",x"fe",x"e4",x"1c",x"de",x"fa",x"85",       --     or [G], 0xFADE + A, -123
	/* dfcf */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"8d",x"ff",x"0d",x"d0", --     jne [0x0155], 0xff8d, $fail
	/* dfd9 */ x"8e",x"2a",x"20",x"3e",x"f6",                   --     imul [A*4 + B], A, A*4 + -10
	/* dfde */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"ec",x"bc",x"0d",x"d0", --     jne [0x0363], 0xbcec, $fail
	/* dfe8 */ x"a2",x"2a",x"3e",x"e0",x"f6",x"39",x"30",       --     shr [A*4 + B], A*4 + -10, 12345
	/* dfef */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"01",x"0d",x"d0", --     jne [0x0363], 0x0001, $fail
	/* dff8 */ x"b6",x"2a",x"21",x"e0",x"39",x"30",             --     xor [A*4 + B], A*2, 12345
	/* dffe */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"6d",x"31",x"0d",x"d0", --     jne [0x0363], 0x316d, $fail
	/* e008 */ x"a2",x"e0",x"3e",x"e0",x"39",x"30",x"f6",x"39",x"30", --     shr [12345], A*4 + -10, 12345
	/* e011 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"01",x"0d",x"d0", --     jne [0x3039], 0x0001, $fail
	/* e01a */ x"a2",x"21",x"1c",x"3e",x"85",x"f6",             --     shr [A*2], -123, A*4 + -10
	/* e020 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"03",x"0d",x"d0", --     jne [0x0154], 0x0003, $fail
	/* e029 */ x"b2",x"21",x"20",x"21",                         --     or [A*2], A, A*2
	/* e02d */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"fe",x"01",x"0d",x"d0", --     jne [0x0154], 0x01fe, $fail
	/* e037 */ x"a2",x"fe",x"2a",x"21",                         --     shr [G], A*4 + B, A*2
	/* e03b */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"36",x"0d",x"d0", --     jne [0x0155], 0x0036, $fail
	/* e044 */ x"b6",x"e0",x"3e",x"2a",x"39",x"30",x"f6",       --     xor [12345], A*4 + -10, A*4 + B
	/* e04b */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"fd",x"01",x"0d",x"d0", --     jne [0x3039], 0x01fd, $fail
	/* e055 */ x"8a",x"3e",x"e4",x"3e",x"f6",x"de",x"fa",x"f6", --     mul [A*4 + -10], 0xFADE + A, A*4 + -10
	/* e05d */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"f0",x"4d",x"0d",x"d0", --     jne [0x029e], 0x4df0, $fail
	/* e067 */ x"8e",x"2a",x"21",x"3e",x"f6",                   --     imul [A*4 + B], A*2, A*4 + -10
	/* e06c */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"d8",x"79",x"0d",x"d0", --     jne [0x0363], 0x79d8, $fail
	/* e076 */ x"a2",x"e0",x"e4",x"3e",x"39",x"30",x"de",x"fa",x"f6", --     shr [12345], 0xFADE + A, A*4 + -10
	/* e07f */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"03",x"0d",x"d0", --     jne [0x3039], 0x0003, $fail
	/* e088 */ x"82",x"3e",x"20",x"fe",x"f6",                   --     add [A*4 + -10], A, G
	/* e08d */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"ff",x"01",x"0d",x"d0", --     jne [0x029e], 0x01ff, $fail
	/* e097 */ x"a2",x"2a",x"e4",x"e0",x"de",x"fa",x"39",x"30", --     shr [A*4 + B], 0xFADE + A, 12345
	/* e09f */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"7d",x"0d",x"d0", --     jne [0x0363], 0x007d, $fail
	/* e0a8 */ x"a2",x"3e",x"1c",x"1c",x"f6",x"85",x"85",       --     shr [A*4 + -10], -123, -123
	/* e0af */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"fc",x"07",x"0d",x"d0", --     jne [0x029e], 0x07fc, $fail
	/* e0b9 */ x"8e",x"20",x"1c",x"e0",x"85",x"39",x"30",       --     imul [A], -123, 12345
	/* e0c0 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"9d",x"d4",x"0d",x"d0", --     jne [0x00aa], 0xd49d, $fail
	/* e0ca */ x"aa",x"2a",x"3e",x"21",x"f6",                   --     shl [A*4 + B], A*4 + -10, A*2
	/* e0cf */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"e0",x"29",x"0d",x"d0", --     jne [0x0363], 0x29e0, $fail
	/* e0d9 */ x"b6",x"21",x"e0",x"fe",x"39",x"30",             --     xor [A*2], 12345, G
	/* e0df */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"6c",x"31",x"0d",x"d0", --     jne [0x0154], 0x316c, $fail
	/* e0e9 */ x"b6",x"e0",x"3e",x"3e",x"39",x"30",x"f6",x"f6", --     xor [12345], A*4 + -10, A*4 + -10
	/* e0f1 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* e0fa */ x"b6",x"20",x"21",x"1c",x"85",                   --     xor [A], A*2, -123
	/* e0ff */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"d1",x"fe",x"0d",x"d0", --     jne [0x00aa], 0xfed1, $fail
	/* e109 */ x"b6",x"21",x"21",x"fe",                         --     xor [A*2], A*2, G
	/* e10d */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"01",x"0d",x"d0", --     jne [0x0154], 0x0001, $fail
	/* e116 */ x"8a",x"fe",x"e0",x"20",x"39",x"30",             --     mul [G], 12345, A
	/* e11c */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"da",x"05",x"0d",x"d0", --     jne [0x0155], 0x05da, $fail
	/* e126 */ x"b6",x"21",x"e0",x"21",x"39",x"30",             --     xor [A*2], 12345, A*2
	/* e12c */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"6d",x"31",x"0d",x"d0", --     jne [0x0154], 0x316d, $fail
	/* e136 */ x"8a",x"21",x"2a",x"e0",x"39",x"30",             --     mul [A*2], A*4 + B, 12345
	/* e13c */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"0b",x"51",x"0d",x"d0", --     jne [0x0154], 0x510b, $fail
	/* e146 */ x"ae",x"3e",x"e0",x"1c",x"f6",x"39",x"30",x"85", --     and [A*4 + -10], 12345, -123
	/* e14e */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"01",x"30",x"0d",x"d0", --     jne [0x029e], 0x3001, $fail
	/* e158 */ x"aa",x"fe",x"21",x"20",                         --     shl [G], A*2, A
	/* e15c */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"00",x"50",x"0d",x"d0", --     jne [0x0155], 0x5000, $fail
	/* e166 */ x"ae",x"20",x"e4",x"20",x"de",x"fa",             --     and [A], 0xFADE + A, A
	/* e16c */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"88",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0088, $fail
	/* e176 */ x"aa",x"21",x"3e",x"e4",x"f6",x"de",x"fa",       --     shl [A*2], A*4 + -10, 0xFADE + A
	/* e17d */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"00",x"9e",x"0d",x"d0", --     jne [0x0154], 0x9e00, $fail
	/* e187 */ x"b6",x"e0",x"e0",x"1c",x"39",x"30",x"39",x"30",x"85", --     xor [12345], 12345, -123
	/* e190 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"bc",x"cf",x"0d",x"d0", --     jne [0x3039], 0xcfbc, $fail
	/* e19a */ x"8a",x"3e",x"3e",x"1c",x"f6",x"f6",x"85",       --     mul [A*4 + -10], A*4 + -10, -123
	/* e1a1 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"16",x"be",x"0d",x"d0", --     jne [0x029e], 0xbe16, $fail
	/* e1ab */ x"86",x"fe",x"21",x"3e",x"f6",                   --     sub [G], A*2, A*4 + -10
	/* e1b0 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"b6",x"fe",x"0d",x"d0", --     jne [0x0155], 0xfeb6, $fail
	/* e1ba */ x"86",x"3e",x"2a",x"fe",x"f6",                   --     sub [A*4 + -10], A*4 + B, G
	/* e1bf */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"0e",x"02",x"0d",x"d0", --     jne [0x029e], 0x020e, $fail
	/* e1c9 */ x"b6",x"3e",x"1c",x"fe",x"f6",x"85",             --     xor [A*4 + -10], -123, G
	/* e1cf */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"d0",x"fe",x"0d",x"d0", --     jne [0x029e], 0xfed0, $fail
	/* e1d9 */ x"86",x"20",x"2a",x"1c",x"85",                   --     sub [A], A*4 + B, -123
	/* e1de */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"de",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03de, $fail
	/* e1e8 */ x"86",x"20",x"21",x"fe",                         --     sub [A], A*2, G
	/* e1ec */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"ff",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xffff, $fail
	/* e1f6 */ x"86",x"2a",x"20",x"e4",x"de",x"fa",             --     sub [A*4 + B], A, 0xFADE + A
	/* e1fc */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"22",x"05",x"0d",x"d0", --     jne [0x0363], 0x0522, $fail
	/* e206 */ x"aa",x"e0",x"fe",x"3e",x"39",x"30",x"f6",       --     shl [12345], G, A*4 + -10
	/* e20d */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"00",x"40",x"0d",x"d0", --     jne [0x3039], 0x4000, $fail
	/* e217 */ x"ae",x"20",x"1c",x"1c",x"85",x"85",             --     and [A], -123, -123
	/* e21d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"85",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xff85, $fail
	/* e227 */ x"b6",x"20",x"fe",x"e0",x"39",x"30",             --     xor [A], G, 12345
	/* e22d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"6c",x"31",x"0d",x"d0", --     jne [0x00aa], 0x316c, $fail
	/* e237 */ x"b2",x"e0",x"21",x"3e",x"39",x"30",x"f6",       --     or [12345], A*2, A*4 + -10
	/* e23e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"de",x"03",x"0d",x"d0", --     jne [0x3039], 0x03de, $fail
	/* e248 */ x"b2",x"20",x"e4",x"21",x"de",x"fa",             --     or [A], 0xFADE + A, A*2
	/* e24e */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"dc",x"fb",x"0d",x"d0", --     jne [0x00aa], 0xfbdc, $fail
	/* e258 */ x"b6",x"fe",x"3e",x"3e",x"f6",x"f6",             --     xor [G], A*4 + -10, A*4 + -10
	/* e25e */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"00",x"0d",x"d0", --     jne [0x0155], 0x0000, $fail
	/* e267 */ x"b6",x"3e",x"20",x"e4",x"f6",x"de",x"fa",       --     xor [A*4 + -10], A, 0xFADE + A
	/* e26e */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"22",x"fb",x"0d",x"d0", --     jne [0x029e], 0xfb22, $fail
	/* e278 */ x"b6",x"e0",x"1c",x"e0",x"39",x"30",x"85",x"39",x"30", --     xor [12345], -123, 12345
	/* e281 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"bc",x"cf",x"0d",x"d0", --     jne [0x3039], 0xcfbc, $fail
	/* e28b */ x"a2",x"3e",x"fe",x"2a",x"f6",                   --     shr [A*4 + -10], G, A*4 + B
	/* e290 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"2a",x"0d",x"d0", --     jne [0x029e], 0x002a, $fail
	/* e299 */ x"ae",x"20",x"fe",x"20",                         --     and [A], G, A
	/* e29d */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* e2a6 */ x"86",x"2a",x"e4",x"1c",x"de",x"fa",x"85",       --     sub [A*4 + B], 0xFADE + A, -123
	/* e2ad */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"03",x"fc",x"0d",x"d0", --     jne [0x0363], 0xfc03, $fail
	/* e2b7 */ x"ae",x"e0",x"21",x"21",x"39",x"30",             --     and [12345], A*2, A*2
	/* e2bd */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"54",x"01",x"0d",x"d0", --     jne [0x3039], 0x0154, $fail
	/* e2c7 */ x"a2",x"e0",x"20",x"e0",x"39",x"30",x"39",x"30", --     shr [12345], A, 12345
	/* e2cf */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* e2d8 */ x"8e",x"3e",x"2a",x"3e",x"f6",x"f6",             --     imul [A*4 + -10], A*4 + B, A*4 + -10
	/* e2de */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"1a",x"dd",x"0d",x"d0", --     jne [0x029e], 0xdd1a, $fail
	/* e2e8 */ x"a2",x"e0",x"3e",x"1c",x"39",x"30",x"f6",x"85", --     shr [12345], A*4 + -10, -123
	/* e2f0 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"14",x"0d",x"d0", --     jne [0x3039], 0x0014, $fail
	/* e2f9 */ x"82",x"fe",x"20",x"e0",x"39",x"30",             --     add [G], A, 12345
	/* e2ff */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"e3",x"30",x"0d",x"d0", --     jne [0x0155], 0x30e3, $fail
	/* e309 */ x"a6",x"e0",x"21",x"e0",x"39",x"30",x"39",x"30", --     ishr [12345], A*2, 12345
	/* e311 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* e31a */ x"a6",x"e0",x"e4",x"1c",x"39",x"30",x"de",x"fa",x"85", --     ishr [12345], 0xFADE + A, -123
	/* e323 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"dc",x"ff",x"0d",x"d0", --     jne [0x3039], 0xffdc, $fail
	/* e32d */ x"b2",x"3e",x"fe",x"20",x"f6",                   --     or [A*4 + -10], G, A
	/* e332 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"ff",x"01",x"0d",x"d0", --     jne [0x029e], 0x01ff, $fail
	/* e33c */ x"a6",x"2a",x"2a",x"20",                         --     ishr [A*4 + B], A*4 + B, A
	/* e340 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"00",x"0d",x"d0", --     jne [0x0363], 0x0000, $fail
	/* e349 */ x"aa",x"fe",x"e0",x"2a",x"39",x"30",             --     shl [G], 12345, A*4 + B
	/* e34f */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"c8",x"81",x"0d",x"d0", --     jne [0x0155], 0x81c8, $fail
	/* e359 */ x"8a",x"21",x"3e",x"20",x"f6",                   --     mul [A*2], A*4 + -10, A
	/* e35e */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ec",x"bc",x"0d",x"d0", --     jne [0x0154], 0xbcec, $fail
	/* e368 */ x"8e",x"3e",x"3e",x"e0",x"f6",x"f6",x"39",x"30", --     imul [A*4 + -10], A*4 + -10, 12345
	/* e370 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"2e",x"35",x"0d",x"d0", --     jne [0x029e], 0x352e, $fail
	/* e37a */ x"b6",x"e0",x"1c",x"3e",x"39",x"30",x"85",x"f6", --     xor [12345], -123, A*4 + -10
	/* e382 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"1b",x"fd",x"0d",x"d0", --     jne [0x3039], 0xfd1b, $fail
	/* e38c */ x"b2",x"fe",x"20",x"e4",x"de",x"fa",             --     or [G], A, 0xFADE + A
	/* e392 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"aa",x"fb",x"0d",x"d0", --     jne [0x0155], 0xfbaa, $fail
	/* e39c */ x"8e",x"fe",x"fe",x"3e",x"f6",                   --     imul [G], G, A*4 + -10
	/* e3a1 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"76",x"7c",x"0d",x"d0", --     jne [0x0155], 0x7c76, $fail
	/* e3ab */ x"8a",x"20",x"e0",x"3e",x"39",x"30",x"f6",       --     mul [A], 12345, A*4 + -10
	/* e3b2 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"2e",x"35",x"0d",x"d0", --     jne [0x00aa], 0x352e, $fail
	/* e3bc */ x"b2",x"fe",x"20",x"20",                         --     or [G], A, A
	/* e3c0 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"aa",x"00",x"0d",x"d0", --     jne [0x0155], 0x00aa, $fail
	/* e3ca */ x"a2",x"3e",x"21",x"e4",x"f6",x"de",x"fa",       --     shr [A*4 + -10], A*2, 0xFADE + A
	/* e3d1 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"01",x"0d",x"d0", --     jne [0x029e], 0x0001, $fail
	/* e3da */ x"a6",x"20",x"3e",x"2a",x"f6",                   --     ishr [A], A*4 + -10, A*4 + B
	/* e3df */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"53",x"0d",x"d0", --     jne [0x00aa], 0x0053, $fail
	/* e3e8 */ x"82",x"20",x"e0",x"20",x"39",x"30",             --     add [A], 12345, A
	/* e3ee */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"e3",x"30",x"0d",x"d0", --     jne [0x00aa], 0x30e3, $fail
	/* e3f8 */ x"a6",x"20",x"1c",x"20",x"85",                   --     ishr [A], -123, A
	/* e3fd */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"ff",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xffff, $fail
	/* e407 */ x"ae",x"21",x"20",x"1c",x"85",                   --     and [A*2], A, -123
	/* e40c */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"80",x"00",x"0d",x"d0", --     jne [0x0154], 0x0080, $fail
	/* e416 */ x"b6",x"2a",x"1c",x"e4",x"85",x"de",x"fa",       --     xor [A*4 + B], -123, 0xFADE + A
	/* e41d */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"0d",x"04",x"0d",x"d0", --     jne [0x0363], 0x040d, $fail
	/* e427 */ x"82",x"20",x"e0",x"21",x"39",x"30",             --     add [A], 12345, A*2
	/* e42d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"8d",x"31",x"0d",x"d0", --     jne [0x00aa], 0x318d, $fail
	/* e437 */ x"82",x"21",x"fe",x"2a",                         --     add [A*2], G, A*4 + B
	/* e43b */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"b8",x"04",x"0d",x"d0", --     jne [0x0154], 0x04b8, $fail
	/* e445 */ x"b2",x"20",x"2a",x"20",                         --     or [A], A*4 + B, A
	/* e449 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"eb",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03eb, $fail
	/* e453 */ x"82",x"21",x"1c",x"e0",x"85",x"39",x"30",       --     add [A*2], -123, 12345
	/* e45a */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"be",x"2f",x"0d",x"d0", --     jne [0x0154], 0x2fbe, $fail
	/* e464 */ x"aa",x"fe",x"2a",x"1c",x"85",                   --     shl [G], A*4 + B, -123
	/* e469 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"60",x"6c",x"0d",x"d0", --     jne [0x0155], 0x6c60, $fail
	/* e473 */ x"82",x"3e",x"3e",x"2a",x"f6",x"f6",             --     add [A*4 + -10], A*4 + -10, A*4 + B
	/* e479 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"01",x"06",x"0d",x"d0", --     jne [0x029e], 0x0601, $fail
	/* e483 */ x"b2",x"20",x"3e",x"e4",x"f6",x"de",x"fa",       --     or [A], A*4 + -10, 0xFADE + A
	/* e48a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"9e",x"fb",x"0d",x"d0", --     jne [0x00aa], 0xfb9e, $fail
	/* e494 */ x"aa",x"2a",x"21",x"1c",x"85",                   --     shl [A*4 + B], A*2, -123
	/* e499 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"80",x"2a",x"0d",x"d0", --     jne [0x0363], 0x2a80, $fail
	/* e4a3 */ x"b2",x"e0",x"1c",x"2a",x"39",x"30",x"85",       --     or [12345], -123, A*4 + B
	/* e4aa */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"e7",x"ff",x"0d",x"d0", --     jne [0x3039], 0xffe7, $fail
	/* e4b4 */ x"82",x"21",x"2a",x"2a",                         --     add [A*2], A*4 + B, A*4 + B
	/* e4b8 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"c6",x"06",x"0d",x"d0", --     jne [0x0154], 0x06c6, $fail
	/* e4c2 */ x"ae",x"20",x"21",x"20",                         --     and [A], A*2, A
	/* e4c6 */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"00",x"0d",x"d0", --     jne [0x00aa], 0x0000, $fail
	/* e4cf */ x"86",x"20",x"fe",x"1c",x"85",                   --     sub [A], G, -123
	/* e4d4 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"d0",x"01",x"0d",x"d0", --     jne [0x00aa], 0x01d0, $fail
	/* e4de */ x"b2",x"20",x"2a",x"3e",x"f6",                   --     or [A], A*4 + B, A*4 + -10
	/* e4e3 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"ff",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03ff, $fail
	/* e4ed */ x"b6",x"2a",x"20",x"2a",                         --     xor [A*4 + B], A, A*4 + B
	/* e4f1 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"c9",x"03",x"0d",x"d0", --     jne [0x0363], 0x03c9, $fail
	/* e4fb */ x"aa",x"21",x"fe",x"3e",x"f6",                   --     shl [A*2], G, A*4 + -10
	/* e500 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"00",x"40",x"0d",x"d0", --     jne [0x0154], 0x4000, $fail
	/* e50a */ x"ae",x"3e",x"e0",x"21",x"f6",x"39",x"30",       --     and [A*4 + -10], 12345, A*2
	/* e511 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"10",x"0d",x"d0", --     jne [0x029e], 0x0010, $fail
	/* e51a */ x"a2",x"e0",x"2a",x"e4",x"39",x"30",x"de",x"fa", --     shr [12345], A*4 + B, 0xFADE + A
	/* e522 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"03",x"0d",x"d0", --     jne [0x3039], 0x0003, $fail
	/* e52b */ x"8a",x"fe",x"21",x"2a",                         --     mul [G], A*2, A*4 + B
	/* e52f */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"7c",x"7f",x"0d",x"d0", --     jne [0x0155], 0x7f7c, $fail
	/* e539 */ x"a2",x"3e",x"3e",x"fe",x"f6",x"f6",             --     shr [A*4 + -10], A*4 + -10, G
	/* e53f */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"14",x"0d",x"d0", --     jne [0x029e], 0x0014, $fail
	/* e548 */ x"8a",x"20",x"e0",x"e4",x"39",x"30",x"de",x"fa", --     mul [A], 12345, 0xFADE + A
	/* e550 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"48",x"81",x"0d",x"d0", --     jne [0x00aa], 0x8148, $fail
	/* e55a */ x"8a",x"2a",x"1c",x"3e",x"85",x"f6",             --     mul [A*4 + B], -123, A*4 + -10
	/* e560 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"16",x"be",x"0d",x"d0", --     jne [0x0363], 0xbe16, $fail
	/* e56a */ x"ae",x"2a",x"1c",x"fe",x"85",                   --     and [A*4 + B], -123, G
	/* e56f */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"05",x"01",x"0d",x"d0", --     jne [0x0363], 0x0105, $fail
	/* e579 */ x"aa",x"e0",x"e0",x"20",x"39",x"30",x"39",x"30", --     shl [12345], 12345, A
	/* e581 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"00",x"e4",x"0d",x"d0", --     jne [0x3039], 0xe400, $fail
	/* e58b */ x"8e",x"20",x"fe",x"2a",                         --     imul [A], G, A*4 + B
	/* e58f */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"df",x"82",x"0d",x"d0", --     jne [0x00aa], 0x82df, $fail
	/* e599 */ x"86",x"3e",x"1c",x"3e",x"f6",x"85",x"f6",       --     sub [A*4 + -10], -123, A*4 + -10
	/* e5a0 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"e7",x"fc",x"0d",x"d0", --     jne [0x029e], 0xfce7, $fail
	/* e5aa */ x"aa",x"21",x"20",x"2a",                         --     shl [A*2], A, A*4 + B
	/* e5ae */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"50",x"05",x"0d",x"d0", --     jne [0x0154], 0x0550, $fail
	/* e5b8 */ x"82",x"20",x"3e",x"21",x"f6",                   --     add [A], A*4 + -10, A*2
	/* e5bd */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"f2",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03f2, $fail
	/* e5c7 */ x"8a",x"21",x"fe",x"1c",x"85",                   --     mul [A*2], G, -123
	/* e5cc */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"29",x"5c",x"0d",x"d0", --     jne [0x0154], 0x5c29, $fail
	/* e5d6 */ x"8a",x"fe",x"1c",x"e0",x"85",x"39",x"30",       --     mul [G], -123, 12345
	/* e5dd */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"9d",x"d4",x"0d",x"d0", --     jne [0x0155], 0xd49d, $fail
	/* e5e7 */ x"a6",x"e0",x"2a",x"2a",x"39",x"30",             --     ishr [12345], A*4 + B, A*4 + B
	/* e5ed */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"6c",x"0d",x"d0", --     jne [0x3039], 0x006c, $fail
	/* e5f6 */ x"82",x"2a",x"1c",x"21",x"85",                   --     add [A*4 + B], -123, A*2
	/* e5fb */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"d9",x"00",x"0d",x"d0", --     jne [0x0363], 0x00d9, $fail
	/* e605 */ x"8a",x"e0",x"e0",x"fe",x"39",x"30",x"39",x"30", --     mul [12345], 12345, G
	/* e60d */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"ed",x"3b",x"0d",x"d0", --     jne [0x3039], 0x3bed, $fail
	/* e617 */ x"b2",x"e0",x"2a",x"fe",x"39",x"30",             --     or [12345], A*4 + B, G
	/* e61d */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"77",x"03",x"0d",x"d0", --     jne [0x3039], 0x0377, $fail
	/* e627 */ x"aa",x"2a",x"1c",x"e0",x"85",x"39",x"30",       --     shl [A*4 + B], -123, 12345
	/* e62e */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"00",x"0a",x"0d",x"d0", --     jne [0x0363], 0x0a00, $fail
	/* e638 */ x"8a",x"fe",x"1c",x"2a",x"85",                   --     mul [G], -123, A*4 + B
	/* e63d */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"6f",x"5f",x"0d",x"d0", --     jne [0x0155], 0x5f6f, $fail
	/* e647 */ x"ae",x"3e",x"e0",x"fe",x"f6",x"39",x"30",       --     and [A*4 + -10], 12345, G
	/* e64e */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"11",x"0d",x"d0", --     jne [0x029e], 0x0011, $fail
	/* e657 */ x"a6",x"2a",x"21",x"e4",x"de",x"fa",             --     ishr [A*4 + B], A*2, 0xFADE + A
	/* e65d */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"01",x"0d",x"d0", --     jne [0x0363], 0x0001, $fail
	/* e666 */ x"b2",x"21",x"21",x"2a",                         --     or [A*2], A*2, A*4 + B
	/* e66a */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"77",x"03",x"0d",x"d0", --     jne [0x0154], 0x0377, $fail
	/* e674 */ x"ae",x"2a",x"fe",x"fe",                         --     and [A*4 + B], G, G
	/* e678 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"55",x"01",x"0d",x"d0", --     jne [0x0363], 0x0155, $fail
	/* e682 */ x"aa",x"2a",x"3e",x"3e",x"f6",x"f6",             --     shl [A*4 + B], A*4 + -10, A*4 + -10
	/* e688 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"00",x"80",x"0d",x"d0", --     jne [0x0363], 0x8000, $fail
	/* e692 */ x"86",x"3e",x"2a",x"1c",x"f6",x"85",             --     sub [A*4 + -10], A*4 + B, -123
	/* e698 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"de",x"03",x"0d",x"d0", --     jne [0x029e], 0x03de, $fail
	/* e6a2 */ x"ae",x"fe",x"fe",x"1c",x"85",                   --     and [G], G, -123
	/* e6a7 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"05",x"01",x"0d",x"d0", --     jne [0x0155], 0x0105, $fail
	/* e6b1 */ x"a6",x"21",x"3e",x"1c",x"f6",x"85",             --     ishr [A*2], A*4 + -10, -123
	/* e6b7 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"14",x"0d",x"d0", --     jne [0x0154], 0x0014, $fail
	/* e6c0 */ x"b2",x"e0",x"21",x"fe",x"39",x"30",             --     or [12345], A*2, G
	/* e6c6 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"55",x"01",x"0d",x"d0", --     jne [0x3039], 0x0155, $fail
	/* e6d0 */ x"b2",x"2a",x"20",x"21",                         --     or [A*4 + B], A, A*2
	/* e6d4 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"fe",x"01",x"0d",x"d0", --     jne [0x0363], 0x01fe, $fail
	/* e6de */ x"a2",x"21",x"20",x"e0",x"39",x"30",             --     shr [A*2], A, 12345
	/* e6e4 */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* e6ed */ x"8e",x"3e",x"3e",x"e4",x"f6",x"f6",x"de",x"fa", --     imul [A*4 + -10], A*4 + -10, 0xFADE + A
	/* e6f5 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"f0",x"4d",x"0d",x"d0", --     jne [0x029e], 0x4df0, $fail
	/* e6ff */ x"a2",x"2a",x"3e",x"fe",x"f6",                   --     shr [A*4 + B], A*4 + -10, G
	/* e704 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"14",x"0d",x"d0", --     jne [0x0363], 0x0014, $fail
	/* e70d */ x"aa",x"e0",x"2a",x"1c",x"39",x"30",x"85",       --     shl [12345], A*4 + B, -123
	/* e714 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"60",x"6c",x"0d",x"d0", --     jne [0x3039], 0x6c60, $fail
	/* e71e */ x"86",x"e0",x"3e",x"20",x"39",x"30",x"f6",       --     sub [12345], A*4 + -10, A
	/* e725 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"f4",x"01",x"0d",x"d0", --     jne [0x3039], 0x01f4, $fail
	/* e72f */ x"86",x"fe",x"3e",x"fe",x"f6",                   --     sub [G], A*4 + -10, G
	/* e734 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"49",x"01",x"0d",x"d0", --     jne [0x0155], 0x0149, $fail
	/* e73e */ x"b6",x"20",x"20",x"2a",                         --     xor [A], A, A*4 + B
	/* e742 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"c9",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03c9, $fail
	/* e74c */ x"a2",x"20",x"21",x"21",                         --     shr [A], A*2, A*2
	/* e750 */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"15",x"0d",x"d0", --     jne [0x00aa], 0x0015, $fail
	/* e759 */ x"82",x"2a",x"e0",x"21",x"39",x"30",             --     add [A*4 + B], 12345, A*2
	/* e75f */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"8d",x"31",x"0d",x"d0", --     jne [0x0363], 0x318d, $fail
	/* e769 */ x"82",x"fe",x"2a",x"2a",                         --     add [G], A*4 + B, A*4 + B
	/* e76d */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"c6",x"06",x"0d",x"d0", --     jne [0x0155], 0x06c6, $fail
	/* e777 */ x"aa",x"2a",x"2a",x"3e",x"f6",                   --     shl [A*4 + B], A*4 + B, A*4 + -10
	/* e77c */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"00",x"c0",x"0d",x"d0", --     jne [0x0363], 0xc000, $fail
	/* e786 */ x"b6",x"3e",x"2a",x"20",x"f6",                   --     xor [A*4 + -10], A*4 + B, A
	/* e78b */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"c9",x"03",x"0d",x"d0", --     jne [0x029e], 0x03c9, $fail
	/* e795 */ x"8a",x"20",x"e4",x"1c",x"de",x"fa",x"85",       --     mul [A], 0xFADE + A, -123
	/* e79c */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"a8",x"25",x"0d",x"d0", --     jne [0x00aa], 0x25a8, $fail
	/* e7a6 */ x"ae",x"3e",x"e0",x"e4",x"f6",x"39",x"30",x"de",x"fa", --     and [A*4 + -10], 12345, 0xFADE + A
	/* e7af */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"08",x"30",x"0d",x"d0", --     jne [0x029e], 0x3008, $fail
	/* e7b9 */ x"82",x"20",x"fe",x"21",                         --     add [A], G, A*2
	/* e7bd */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"a9",x"02",x"0d",x"d0", --     jne [0x00aa], 0x02a9, $fail
	/* e7c7 */ x"86",x"fe",x"e4",x"fe",x"de",x"fa",             --     sub [G], 0xFADE + A, G
	/* e7cd */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"33",x"fa",x"0d",x"d0", --     jne [0x0155], 0xfa33, $fail
	/* e7d7 */ x"a2",x"e0",x"3e",x"e4",x"39",x"30",x"f6",x"de",x"fa", --     shr [12345], A*4 + -10, 0xFADE + A
	/* e7e0 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"02",x"0d",x"d0", --     jne [0x3039], 0x0002, $fail
	/* e7e9 */ x"a2",x"3e",x"21",x"2a",x"f6",                   --     shr [A*4 + -10], A*2, A*4 + B
	/* e7ee */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"2a",x"0d",x"d0", --     jne [0x029e], 0x002a, $fail
	/* e7f7 */ x"a2",x"fe",x"20",x"2a",                         --     shr [G], A, A*4 + B
	/* e7fb */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"15",x"0d",x"d0", --     jne [0x0155], 0x0015, $fail
	/* e804 */ x"8e",x"2a",x"fe",x"21",                         --     imul [A*4 + B], G, A*2
	/* e808 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"e4",x"c4",x"0d",x"d0", --     jne [0x0363], 0xc4e4, $fail
	/* e812 */ x"8a",x"3e",x"e4",x"e4",x"f6",x"de",x"fa",x"de",x"fa", --     mul [A*4 + -10], 0xFADE + A, 0xFADE + A
	/* e81b */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"40",x"f8",x"0d",x"d0", --     jne [0x029e], 0xf840, $fail
	/* e825 */ x"82",x"3e",x"2a",x"e0",x"f6",x"39",x"30",       --     add [A*4 + -10], A*4 + B, 12345
	/* e82c */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"9c",x"33",x"0d",x"d0", --     jne [0x029e], 0x339c, $fail
	/* e836 */ x"b6",x"2a",x"fe",x"3e",x"f6",                   --     xor [A*4 + B], G, A*4 + -10
	/* e83b */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"cb",x"03",x"0d",x"d0", --     jne [0x0363], 0x03cb, $fail
	/* e845 */ x"b6",x"21",x"e4",x"20",x"de",x"fa",             --     xor [A*2], 0xFADE + A, A
	/* e84b */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"22",x"fb",x"0d",x"d0", --     jne [0x0154], 0xfb22, $fail
	/* e855 */ x"a2",x"e0",x"e0",x"21",x"39",x"30",x"39",x"30", --     shr [12345], 12345, A*2
	/* e85d */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"03",x"03",x"0d",x"d0", --     jne [0x3039], 0x0303, $fail
	/* e867 */ x"8e",x"2a",x"fe",x"e0",x"39",x"30",             --     imul [A*4 + B], G, 12345
	/* e86d */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"ed",x"3b",x"0d",x"d0", --     jne [0x0363], 0x3bed, $fail
	/* e877 */ x"b6",x"e0",x"1c",x"21",x"39",x"30",x"85",       --     xor [12345], -123, A*2
	/* e87e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"d1",x"fe",x"0d",x"d0", --     jne [0x3039], 0xfed1, $fail
	/* e888 */ x"86",x"e0",x"fe",x"e4",x"39",x"30",x"de",x"fa", --     sub [12345], G, 0xFADE + A
	/* e890 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"cd",x"05",x"0d",x"d0", --     jne [0x3039], 0x05cd, $fail
	/* e89a */ x"b6",x"20",x"21",x"e4",x"de",x"fa",             --     xor [A], A*2, 0xFADE + A
	/* e8a0 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"dc",x"fa",x"0d",x"d0", --     jne [0x00aa], 0xfadc, $fail
	/* e8aa */ x"8a",x"21",x"3e",x"e0",x"f6",x"39",x"30",       --     mul [A*2], A*4 + -10, 12345
	/* e8b1 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"2e",x"35",x"0d",x"d0", --     jne [0x0154], 0x352e, $fail
	/* e8bb */ x"aa",x"2a",x"21",x"20",                         --     shl [A*4 + B], A*2, A
	/* e8bf */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"00",x"50",x"0d",x"d0", --     jne [0x0363], 0x5000, $fail
	/* e8c9 */ x"ae",x"fe",x"1c",x"e4",x"85",x"de",x"fa",       --     and [G], -123, 0xFADE + A
	/* e8d0 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"80",x"fb",x"0d",x"d0", --     jne [0x0155], 0xfb80, $fail
	/* e8da */ x"a2",x"20",x"20",x"21",                         --     shr [A], A, A*2
	/* e8de */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"0a",x"0d",x"d0", --     jne [0x00aa], 0x000a, $fail
	/* e8e7 */ x"b6",x"3e",x"20",x"3e",x"f6",x"f6",             --     xor [A*4 + -10], A, A*4 + -10
	/* e8ed */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"34",x"02",x"0d",x"d0", --     jne [0x029e], 0x0234, $fail
	/* e8f7 */ x"aa",x"3e",x"3e",x"21",x"f6",x"f6",             --     shl [A*4 + -10], A*4 + -10, A*2
	/* e8fd */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"e0",x"29",x"0d",x"d0", --     jne [0x029e], 0x29e0, $fail
	/* e907 */ x"8a",x"20",x"3e",x"1c",x"f6",x"85",             --     mul [A], A*4 + -10, -123
	/* e90d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"16",x"be",x"0d",x"d0", --     jne [0x00aa], 0xbe16, $fail
	/* e917 */ x"b2",x"fe",x"fe",x"e0",x"39",x"30",             --     or [G], G, 12345
	/* e91d */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"7d",x"31",x"0d",x"d0", --     jne [0x0155], 0x317d, $fail
	/* e927 */ x"a2",x"2a",x"e4",x"3e",x"de",x"fa",x"f6",       --     shr [A*4 + B], 0xFADE + A, A*4 + -10
	/* e92e */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"03",x"0d",x"d0", --     jne [0x0363], 0x0003, $fail
	/* e937 */ x"8a",x"2a",x"20",x"e0",x"39",x"30",             --     mul [A*4 + B], A, 12345
	/* e93d */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"da",x"05",x"0d",x"d0", --     jne [0x0363], 0x05da, $fail
	/* e947 */ x"ae",x"3e",x"21",x"e0",x"f6",x"39",x"30",       --     and [A*4 + -10], A*2, 12345
	/* e94e */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"10",x"0d",x"d0", --     jne [0x029e], 0x0010, $fail
	/* e957 */ x"ae",x"e0",x"20",x"2a",x"39",x"30",             --     and [12345], A, A*4 + B
	/* e95d */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"22",x"0d",x"d0", --     jne [0x3039], 0x0022, $fail
	/* e966 */ x"8e",x"fe",x"2a",x"fe",                         --     imul [G], A*4 + B, G
	/* e96a */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"df",x"82",x"0d",x"d0", --     jne [0x0155], 0x82df, $fail
	/* e974 */ x"86",x"e0",x"fe",x"2a",x"39",x"30",             --     sub [12345], G, A*4 + B
	/* e97a */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"f2",x"fd",x"0d",x"d0", --     jne [0x3039], 0xfdf2, $fail
	/* e984 */ x"a2",x"2a",x"fe",x"2a",                         --     shr [A*4 + B], G, A*4 + B
	/* e988 */ x"ee",x"e0",x"1c",x"e0",x"63",x"03",x"2a",x"0d",x"d0", --     jne [0x0363], 0x002a, $fail
	/* e991 */ x"b2",x"3e",x"fe",x"fe",x"f6",                   --     or [A*4 + -10], G, G
	/* e996 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"55",x"01",x"0d",x"d0", --     jne [0x029e], 0x0155, $fail
	/* e9a0 */ x"b6",x"21",x"20",x"fe",                         --     xor [A*2], A, G
	/* e9a4 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ff",x"01",x"0d",x"d0", --     jne [0x0154], 0x01ff, $fail
	/* e9ae */ x"a2",x"fe",x"3e",x"1c",x"f6",x"85",             --     shr [G], A*4 + -10, -123
	/* e9b4 */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"14",x"0d",x"d0", --     jne [0x0155], 0x0014, $fail
	/* e9bd */ x"a6",x"e0",x"fe",x"20",x"39",x"30",             --     ishr [12345], G, A
	/* e9c3 */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* e9cc */ x"8a",x"21",x"1c",x"e4",x"85",x"de",x"fa",       --     mul [A*2], -123, 0xFADE + A
	/* e9d3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"a8",x"25",x"0d",x"d0", --     jne [0x0154], 0x25a8, $fail
	/* e9dd */ x"b2",x"21",x"e4",x"e0",x"de",x"fa",x"39",x"30", --     or [A*2], 0xFADE + A, 12345
	/* e9e5 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"b9",x"fb",x"0d",x"d0", --     jne [0x0154], 0xfbb9, $fail
	/* e9ef */ x"8e",x"2a",x"e0",x"e4",x"39",x"30",x"de",x"fa", --     imul [A*4 + B], 12345, 0xFADE + A
	/* e9f7 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"48",x"81",x"0d",x"d0", --     jne [0x0363], 0x8148, $fail
	/* ea01 */ x"b2",x"3e",x"fe",x"1c",x"f6",x"85",             --     or [A*4 + -10], G, -123
	/* ea07 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"d5",x"ff",x"0d",x"d0", --     jne [0x029e], 0xffd5, $fail
	/* ea11 */ x"a6",x"3e",x"21",x"20",x"f6",                   --     ishr [A*4 + -10], A*2, A
	/* ea16 */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"00",x"0d",x"d0", --     jne [0x029e], 0x0000, $fail
	/* ea1f */ x"ae",x"21",x"2a",x"1c",x"85",                   --     and [A*2], A*4 + B, -123
	/* ea24 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"01",x"03",x"0d",x"d0", --     jne [0x0154], 0x0301, $fail
	/* ea2e */ x"b2",x"20",x"21",x"3e",x"f6",                   --     or [A], A*2, A*4 + -10
	/* ea33 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"de",x"03",x"0d",x"d0", --     jne [0x00aa], 0x03de, $fail
	/* ea3d */ x"82",x"fe",x"3e",x"20",x"f6",                   --     add [G], A*4 + -10, A
	/* ea42 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"48",x"03",x"0d",x"d0", --     jne [0x0155], 0x0348, $fail
	/* ea4c */ x"aa",x"3e",x"20",x"e0",x"f6",x"39",x"30",       --     shl [A*4 + -10], A, 12345
	/* ea53 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"00",x"54",x"0d",x"d0", --     jne [0x029e], 0x5400, $fail
	/* ea5d */ x"aa",x"20",x"e4",x"e4",x"de",x"fa",x"de",x"fa", --     shl [A], 0xFADE + A, 0xFADE + A
	/* ea65 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"00",x"88",x"0d",x"d0", --     jne [0x00aa], 0x8800, $fail
	/* ea6f */ x"8e",x"fe",x"3e",x"e0",x"f6",x"39",x"30",       --     imul [G], A*4 + -10, 12345
	/* ea76 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"2e",x"35",x"0d",x"d0", --     jne [0x0155], 0x352e, $fail
	/* ea80 */ x"82",x"e0",x"1c",x"1c",x"39",x"30",x"85",x"85", --     add [12345], -123, -123
	/* ea88 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"0a",x"ff",x"0d",x"d0", --     jne [0x3039], 0xff0a, $fail
	/* ea92 */ x"86",x"21",x"3e",x"fe",x"f6",                   --     sub [A*2], A*4 + -10, G
	/* ea97 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"49",x"01",x"0d",x"d0", --     jne [0x0154], 0x0149, $fail
	/* eaa1 */ x"a6",x"20",x"e4",x"fe",x"de",x"fa",             --     ishr [A], 0xFADE + A, G
	/* eaa7 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"dc",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xffdc, $fail
	/* eab1 */ x"b6",x"20",x"e4",x"e0",x"de",x"fa",x"39",x"30", --     xor [A], 0xFADE + A, 12345
	/* eab9 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"b1",x"cb",x"0d",x"d0", --     jne [0x00aa], 0xcbb1, $fail
	/* eac3 */ x"86",x"fe",x"21",x"e4",x"de",x"fa",             --     sub [G], A*2, 0xFADE + A
	/* eac9 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"cc",x"05",x"0d",x"d0", --     jne [0x0155], 0x05cc, $fail
	/* ead3 */ x"82",x"2a",x"e0",x"e0",x"39",x"30",x"39",x"30", --     add [A*4 + B], 12345, 12345
	/* eadb */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"72",x"60",x"0d",x"d0", --     jne [0x0363], 0x6072, $fail
	/* eae5 */ x"86",x"3e",x"1c",x"e4",x"f6",x"85",x"de",x"fa", --     sub [A*4 + -10], -123, 0xFADE + A
	/* eaed */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"fd",x"03",x"0d",x"d0", --     jne [0x029e], 0x03fd, $fail
	/* eaf7 */ x"82",x"21",x"21",x"3e",x"f6",                   --     add [A*2], A*2, A*4 + -10
	/* eafc */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"f2",x"03",x"0d",x"d0", --     jne [0x0154], 0x03f2, $fail
	/* eb06 */ x"a2",x"20",x"e0",x"1c",x"39",x"30",x"85",       --     shr [A], 12345, -123
	/* eb0d */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"81",x"01",x"0d",x"d0", --     jne [0x00aa], 0x0181, $fail
	/* eb17 */ x"8e",x"21",x"20",x"3e",x"f6",                   --     imul [A*2], A, A*4 + -10
	/* eb1c */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"ec",x"bc",x"0d",x"d0", --     jne [0x0154], 0xbcec, $fail
	/* eb26 */ x"b2",x"3e",x"fe",x"e4",x"f6",x"de",x"fa",       --     or [A*4 + -10], G, 0xFADE + A
	/* eb2d */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"dd",x"fb",x"0d",x"d0", --     jne [0x029e], 0xfbdd, $fail
	/* eb37 */ x"a6",x"fe",x"20",x"1c",x"85",                   --     ishr [G], A, -123
	/* eb3c */ x"ee",x"e0",x"1c",x"e0",x"55",x"01",x"05",x"0d",x"d0", --     jne [0x0155], 0x0005, $fail
	/* eb45 */ x"a6",x"21",x"20",x"e4",x"de",x"fa",             --     ishr [A*2], A, 0xFADE + A
	/* eb4b */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* eb54 */ x"a2",x"e0",x"1c",x"20",x"39",x"30",x"85",       --     shr [12345], -123, A
	/* eb5b */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"3f",x"0d",x"d0", --     jne [0x3039], 0x003f, $fail
	/* eb64 */ x"8e",x"20",x"20",x"3e",x"f6",                   --     imul [A], A, A*4 + -10
	/* eb69 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"ec",x"bc",x"0d",x"d0", --     jne [0x00aa], 0xbcec, $fail
	/* eb73 */ x"82",x"2a",x"e4",x"fe",x"de",x"fa",             --     add [A*4 + B], 0xFADE + A, G
	/* eb79 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"dd",x"fc",x"0d",x"d0", --     jne [0x0363], 0xfcdd, $fail
	/* eb83 */ x"b6",x"fe",x"e0",x"3e",x"39",x"30",x"f6",       --     xor [G], 12345, A*4 + -10
	/* eb8a */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"a7",x"32",x"0d",x"d0", --     jne [0x0155], 0x32a7, $fail
	/* eb94 */ x"8e",x"20",x"e0",x"2a",x"39",x"30",             --     imul [A], 12345, A*4 + B
	/* eb9a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"0b",x"51",x"0d",x"d0", --     jne [0x00aa], 0x510b, $fail
	/* eba4 */ x"b2",x"3e",x"e4",x"fe",x"f6",x"de",x"fa",       --     or [A*4 + -10], 0xFADE + A, G
	/* ebab */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"dd",x"fb",x"0d",x"d0", --     jne [0x029e], 0xfbdd, $fail
	/* ebb5 */ x"86",x"21",x"1c",x"21",x"85",                   --     sub [A*2], -123, A*2
	/* ebba */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"31",x"fe",x"0d",x"d0", --     jne [0x0154], 0xfe31, $fail
	/* ebc4 */ x"b2",x"2a",x"21",x"21",                         --     or [A*4 + B], A*2, A*2
	/* ebc8 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"54",x"01",x"0d",x"d0", --     jne [0x0363], 0x0154, $fail
	/* ebd2 */ x"8e",x"e0",x"20",x"3e",x"39",x"30",x"f6",       --     imul [12345], A, A*4 + -10
	/* ebd9 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"ec",x"bc",x"0d",x"d0", --     jne [0x3039], 0xbcec, $fail
	/* ebe3 */ x"a6",x"3e",x"e4",x"2a",x"f6",x"de",x"fa",       --     ishr [A*4 + -10], 0xFADE + A, A*4 + B
	/* ebea */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"71",x"ff",x"0d",x"d0", --     jne [0x029e], 0xff71, $fail
	/* ebf4 */ x"ae",x"e0",x"20",x"e4",x"39",x"30",x"de",x"fa", --     and [12345], A, 0xFADE + A
	/* ebfc */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"88",x"00",x"0d",x"d0", --     jne [0x3039], 0x0088, $fail
	/* ec06 */ x"a6",x"20",x"fe",x"fe",                         --     ishr [A], G, G
	/* ec0a */ x"ee",x"e0",x"1c",x"e0",x"aa",x"00",x"0a",x"0d",x"d0", --     jne [0x00aa], 0x000a, $fail
	/* ec13 */ x"8e",x"20",x"3e",x"20",x"f6",                   --     imul [A], A*4 + -10, A
	/* ec18 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"ec",x"bc",x"0d",x"d0", --     jne [0x00aa], 0xbcec, $fail
	/* ec22 */ x"b2",x"e0",x"3e",x"fe",x"39",x"30",x"f6",       --     or [12345], A*4 + -10, G
	/* ec29 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"df",x"03",x"0d",x"d0", --     jne [0x3039], 0x03df, $fail
	/* ec33 */ x"82",x"21",x"e0",x"e4",x"39",x"30",x"de",x"fa", --     add [A*2], 12345, 0xFADE + A
	/* ec3b */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"c1",x"2b",x"0d",x"d0", --     jne [0x0154], 0x2bc1, $fail
	/* ec45 */ x"82",x"e0",x"1c",x"e4",x"39",x"30",x"85",x"de",x"fa", --     add [12345], -123, 0xFADE + A
	/* ec4e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"0d",x"fb",x"0d",x"d0", --     jne [0x3039], 0xfb0d, $fail
	/* ec58 */ x"b2",x"fe",x"20",x"21",                         --     or [G], A, A*2
	/* ec5c */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"fe",x"01",x"0d",x"d0", --     jne [0x0155], 0x01fe, $fail
	/* ec66 */ x"aa",x"21",x"2a",x"21",                         --     shl [A*2], A*4 + B, A*2
	/* ec6a */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"30",x"36",x"0d",x"d0", --     jne [0x0154], 0x3630, $fail
	/* ec74 */ x"82",x"e0",x"2a",x"e0",x"39",x"30",x"39",x"30", --     add [12345], A*4 + B, 12345
	/* ec7c */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"9c",x"33",x"0d",x"d0", --     jne [0x3039], 0x339c, $fail
	/* ec86 */ x"ae",x"2a",x"20",x"1c",x"85",                   --     and [A*4 + B], A, -123
	/* ec8b */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"80",x"00",x"0d",x"d0", --     jne [0x0363], 0x0080, $fail
	/* ec95 */ x"b6",x"e0",x"20",x"1c",x"39",x"30",x"85",       --     xor [12345], A, -123
	/* ec9c */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"2f",x"ff",x"0d",x"d0", --     jne [0x3039], 0xff2f, $fail
	/* eca6 */ x"ae",x"21",x"fe",x"e0",x"39",x"30",             --     and [A*2], G, 12345
	/* ecac */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"11",x"0d",x"d0", --     jne [0x0154], 0x0011, $fail
	/* ecb5 */ x"ae",x"3e",x"fe",x"3e",x"f6",x"f6",             --     and [A*4 + -10], G, A*4 + -10
	/* ecbb */ x"ee",x"e0",x"1c",x"e0",x"9e",x"02",x"14",x"0d",x"d0", --     jne [0x029e], 0x0014, $fail
	/* ecc4 */ x"8a",x"3e",x"2a",x"2a",x"f6",                   --     mul [A*4 + -10], A*4 + B, A*4 + B
	/* ecc9 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"49",x"78",x"0d",x"d0", --     jne [0x029e], 0x7849, $fail
	/* ecd3 */ x"82",x"20",x"3e",x"e0",x"f6",x"39",x"30",       --     add [A], A*4 + -10, 12345
	/* ecda */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"d7",x"32",x"0d",x"d0", --     jne [0x00aa], 0x32d7, $fail
	/* ece4 */ x"82",x"21",x"e0",x"3e",x"39",x"30",x"f6",       --     add [A*2], 12345, A*4 + -10
	/* eceb */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"d7",x"32",x"0d",x"d0", --     jne [0x0154], 0x32d7, $fail
	/* ecf5 */ x"b6",x"21",x"3e",x"3e",x"f6",x"f6",             --     xor [A*2], A*4 + -10, A*4 + -10
	/* ecfb */ x"ee",x"e0",x"1c",x"e0",x"54",x"01",x"00",x"0d",x"d0", --     jne [0x0154], 0x0000, $fail
	/* ed04 */ x"a6",x"e0",x"20",x"20",x"39",x"30",             --     ishr [12345], A, A
	/* ed0a */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* ed13 */ x"a6",x"e0",x"e0",x"3e",x"39",x"30",x"39",x"30",x"f6", --     ishr [12345], 12345, A*4 + -10
	/* ed1c */ x"ee",x"e0",x"1c",x"e0",x"39",x"30",x"00",x"0d",x"d0", --     jne [0x3039], 0x0000, $fail
	/* ed25 */ x"aa",x"20",x"1c",x"21",x"85",                   --     shl [A], -123, A*2
	/* ed2a */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"50",x"f8",x"0d",x"d0", --     jne [0x00aa], 0xf850, $fail
	/* ed34 */ x"ae",x"e0",x"21",x"e4",x"39",x"30",x"de",x"fa", --     and [12345], A*2, 0xFADE + A
	/* ed3c */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"00",x"01",x"0d",x"d0", --     jne [0x3039], 0x0100, $fail
	/* ed46 */ x"b2",x"3e",x"1c",x"20",x"f6",x"85",             --     or [A*4 + -10], -123, A
	/* ed4c */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"af",x"ff",x"0d",x"d0", --     jne [0x029e], 0xffaf, $fail
	/* ed56 */ x"8e",x"21",x"1c",x"20",x"85",                   --     imul [A*2], -123, A
	/* ed5b */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"52",x"ae",x"0d",x"d0", --     jne [0x0154], 0xae52, $fail
	/* ed65 */ x"8a",x"2a",x"2a",x"2a",                         --     mul [A*4 + B], A*4 + B, A*4 + B
	/* ed69 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"49",x"78",x"0d",x"d0", --     jne [0x0363], 0x7849, $fail
	/* ed73 */ x"86",x"2a",x"2a",x"e0",x"39",x"30",             --     sub [A*4 + B], A*4 + B, 12345
	/* ed79 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"2a",x"d3",x"0d",x"d0", --     jne [0x0363], 0xd32a, $fail
	/* ed83 */ x"ae",x"fe",x"1c",x"21",x"85",                   --     and [G], -123, A*2
	/* ed88 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"04",x"01",x"0d",x"d0", --     jne [0x0155], 0x0104, $fail
	/* ed92 */ x"8e",x"21",x"e4",x"1c",x"de",x"fa",x"85",       --     imul [A*2], 0xFADE + A, -123
	/* ed99 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"a8",x"25",x"0d",x"d0", --     jne [0x0154], 0x25a8, $fail
	/* eda3 */ x"8a",x"21",x"21",x"e4",x"de",x"fa",             --     mul [A*2], A*2, 0xFADE + A
	/* eda9 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"a0",x"10",x"0d",x"d0", --     jne [0x0154], 0x10a0, $fail
	/* edb3 */ x"86",x"fe",x"e0",x"fe",x"39",x"30",             --     sub [G], 12345, G
	/* edb9 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"e4",x"2e",x"0d",x"d0", --     jne [0x0155], 0x2ee4, $fail
	/* edc3 */ x"62",x"20",x"1c",x"85",                         --     mov [A], -123
	/* edc7 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"85",x"ff",x"0d",x"d0", --     jne [0x00aa], 0xff85, $fail
	/* edd1 */ x"62",x"3e",x"3e",x"f6",x"f6",                   --     mov [A*4 + -10], A*4 + -10
	/* edd6 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"9e",x"02",x"0d",x"d0", --     jne [0x029e], 0x029e, $fail
	/* ede0 */ x"62",x"21",x"2a",                               --     mov [A*2], A*4 + B
	/* ede3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"63",x"03",x"0d",x"d0", --     jne [0x0154], 0x0363, $fail
	/* eded */ x"62",x"e0",x"1c",x"39",x"30",x"85",             --     mov [12345], -123
	/* edf3 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"85",x"ff",x"0d",x"d0", --     jne [0x3039], 0xff85, $fail
	/* edfd */ x"62",x"fe",x"3e",x"f6",                         --     mov [G], A*4 + -10
	/* ee01 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"9e",x"02",x"0d",x"d0", --     jne [0x0155], 0x029e, $fail
	/* ee0b */ x"62",x"e0",x"fe",x"39",x"30",                   --     mov [12345], G
	/* ee10 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"55",x"01",x"0d",x"d0", --     jne [0x3039], 0x0155, $fail
	/* ee1a */ x"62",x"fe",x"21",                               --     mov [G], A*2
	/* ee1d */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"54",x"01",x"0d",x"d0", --     jne [0x0155], 0x0154, $fail
	/* ee27 */ x"62",x"3e",x"e4",x"f6",x"de",x"fa",             --     mov [A*4 + -10], 0xFADE + A
	/* ee2d */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"88",x"fb",x"0d",x"d0", --     jne [0x029e], 0xfb88, $fail
	/* ee37 */ x"62",x"e0",x"e0",x"39",x"30",x"39",x"30",       --     mov [12345], 12345
	/* ee3e */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"0d",x"d0", --     jne [0x3039], 0x3039, $fail
	/* ee48 */ x"62",x"3e",x"fe",x"f6",                         --     mov [A*4 + -10], G
	/* ee4c */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"55",x"01",x"0d",x"d0", --     jne [0x029e], 0x0155, $fail
	/* ee56 */ x"62",x"20",x"fe",                               --     mov [A], G
	/* ee59 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"55",x"01",x"0d",x"d0", --     jne [0x00aa], 0x0155, $fail
	/* ee63 */ x"62",x"2a",x"2a",                               --     mov [A*4 + B], A*4 + B
	/* ee66 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"63",x"03",x"0d",x"d0", --     jne [0x0363], 0x0363, $fail
	/* ee70 */ x"62",x"3e",x"2a",x"f6",                         --     mov [A*4 + -10], A*4 + B
	/* ee74 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"63",x"03",x"0d",x"d0", --     jne [0x029e], 0x0363, $fail
	/* ee7e */ x"62",x"2a",x"20",                               --     mov [A*4 + B], A
	/* ee81 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"aa",x"00",x"0d",x"d0", --     jne [0x0363], 0x00aa, $fail
	/* ee8b */ x"62",x"3e",x"20",x"f6",                         --     mov [A*4 + -10], A
	/* ee8f */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"aa",x"00",x"0d",x"d0", --     jne [0x029e], 0x00aa, $fail
	/* ee99 */ x"62",x"20",x"20",                               --     mov [A], A
	/* ee9c */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"aa",x"00",x"0d",x"d0", --     jne [0x00aa], 0x00aa, $fail
	/* eea6 */ x"62",x"2a",x"e4",x"de",x"fa",                   --     mov [A*4 + B], 0xFADE + A
	/* eeab */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"88",x"fb",x"0d",x"d0", --     jne [0x0363], 0xfb88, $fail
	/* eeb5 */ x"62",x"21",x"1c",x"85",                         --     mov [A*2], -123
	/* eeb9 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"85",x"ff",x"0d",x"d0", --     jne [0x0154], 0xff85, $fail
	/* eec3 */ x"62",x"2a",x"e0",x"39",x"30",                   --     mov [A*4 + B], 12345
	/* eec8 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"39",x"30",x"0d",x"d0", --     jne [0x0363], 0x3039, $fail
	/* eed2 */ x"62",x"3e",x"1c",x"f6",x"85",                   --     mov [A*4 + -10], -123
	/* eed7 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"85",x"ff",x"0d",x"d0", --     jne [0x029e], 0xff85, $fail
	/* eee1 */ x"62",x"3e",x"21",x"f6",                         --     mov [A*4 + -10], A*2
	/* eee5 */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"54",x"01",x"0d",x"d0", --     jne [0x029e], 0x0154, $fail
	/* eeef */ x"62",x"21",x"3e",x"f6",                         --     mov [A*2], A*4 + -10
	/* eef3 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"9e",x"02",x"0d",x"d0", --     jne [0x0154], 0x029e, $fail
	/* eefd */ x"62",x"e0",x"21",x"39",x"30",                   --     mov [12345], A*2
	/* ef02 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"54",x"01",x"0d",x"d0", --     jne [0x3039], 0x0154, $fail
	/* ef0c */ x"62",x"21",x"fe",                               --     mov [A*2], G
	/* ef0f */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"55",x"01",x"0d",x"d0", --     jne [0x0154], 0x0155, $fail
	/* ef19 */ x"62",x"2a",x"fe",                               --     mov [A*4 + B], G
	/* ef1c */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"55",x"01",x"0d",x"d0", --     jne [0x0363], 0x0155, $fail
	/* ef26 */ x"62",x"21",x"e4",x"de",x"fa",                   --     mov [A*2], 0xFADE + A
	/* ef2b */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"88",x"fb",x"0d",x"d0", --     jne [0x0154], 0xfb88, $fail
	/* ef35 */ x"62",x"20",x"3e",x"f6",                         --     mov [A], A*4 + -10
	/* ef39 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"9e",x"02",x"0d",x"d0", --     jne [0x00aa], 0x029e, $fail
	/* ef43 */ x"62",x"e0",x"3e",x"39",x"30",x"f6",             --     mov [12345], A*4 + -10
	/* ef49 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"9e",x"02",x"0d",x"d0", --     jne [0x3039], 0x029e, $fail
	/* ef53 */ x"62",x"2a",x"3e",x"f6",                         --     mov [A*4 + B], A*4 + -10
	/* ef57 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"9e",x"02",x"0d",x"d0", --     jne [0x0363], 0x029e, $fail
	/* ef61 */ x"62",x"e0",x"e4",x"39",x"30",x"de",x"fa",       --     mov [12345], 0xFADE + A
	/* ef68 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"88",x"fb",x"0d",x"d0", --     jne [0x3039], 0xfb88, $fail
	/* ef72 */ x"62",x"21",x"e0",x"39",x"30",                   --     mov [A*2], 12345
	/* ef77 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"39",x"30",x"0d",x"d0", --     jne [0x0154], 0x3039, $fail
	/* ef81 */ x"62",x"fe",x"1c",x"85",                         --     mov [G], -123
	/* ef85 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"85",x"ff",x"0d",x"d0", --     jne [0x0155], 0xff85, $fail
	/* ef8f */ x"62",x"e0",x"2a",x"39",x"30",                   --     mov [12345], A*4 + B
	/* ef94 */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"63",x"03",x"0d",x"d0", --     jne [0x3039], 0x0363, $fail
	/* ef9e */ x"62",x"fe",x"e4",x"de",x"fa",                   --     mov [G], 0xFADE + A
	/* efa3 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"88",x"fb",x"0d",x"d0", --     jne [0x0155], 0xfb88, $fail
	/* efad */ x"62",x"20",x"e0",x"39",x"30",                   --     mov [A], 12345
	/* efb2 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"39",x"30",x"0d",x"d0", --     jne [0x00aa], 0x3039, $fail
	/* efbc */ x"62",x"20",x"21",                               --     mov [A], A*2
	/* efbf */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"54",x"01",x"0d",x"d0", --     jne [0x00aa], 0x0154, $fail
	/* efc9 */ x"62",x"3e",x"e0",x"f6",x"39",x"30",             --     mov [A*4 + -10], 12345
	/* efcf */ x"ee",x"e0",x"e0",x"e0",x"9e",x"02",x"39",x"30",x"0d",x"d0", --     jne [0x029e], 0x3039, $fail
	/* efd9 */ x"62",x"fe",x"20",                               --     mov [G], A
	/* efdc */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"aa",x"00",x"0d",x"d0", --     jne [0x0155], 0x00aa, $fail
	/* efe6 */ x"62",x"21",x"20",                               --     mov [A*2], A
	/* efe9 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"aa",x"00",x"0d",x"d0", --     jne [0x0154], 0x00aa, $fail
	/* eff3 */ x"62",x"fe",x"fe",                               --     mov [G], G
	/* eff6 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"55",x"01",x"0d",x"d0", --     jne [0x0155], 0x0155, $fail
	/* f000 */ x"62",x"20",x"2a",                               --     mov [A], A*4 + B
	/* f003 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"63",x"03",x"0d",x"d0", --     jne [0x00aa], 0x0363, $fail
	/* f00d */ x"62",x"2a",x"1c",x"85",                         --     mov [A*4 + B], -123
	/* f011 */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"85",x"ff",x"0d",x"d0", --     jne [0x0363], 0xff85, $fail
	/* f01b */ x"62",x"2a",x"21",                               --     mov [A*4 + B], A*2
	/* f01e */ x"ee",x"e0",x"e0",x"e0",x"63",x"03",x"54",x"01",x"0d",x"d0", --     jne [0x0363], 0x0154, $fail
	/* f028 */ x"62",x"e0",x"20",x"39",x"30",                   --     mov [12345], A
	/* f02d */ x"ee",x"e0",x"e0",x"e0",x"39",x"30",x"aa",x"00",x"0d",x"d0", --     jne [0x3039], 0x00aa, $fail
	/* f037 */ x"62",x"fe",x"e0",x"39",x"30",                   --     mov [G], 12345
	/* f03c */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"39",x"30",x"0d",x"d0", --     jne [0x0155], 0x3039, $fail
	/* f046 */ x"62",x"21",x"21",                               --     mov [A*2], A*2
	/* f049 */ x"ee",x"e0",x"e0",x"e0",x"54",x"01",x"54",x"01",x"0d",x"d0", --     jne [0x0154], 0x0154, $fail
	/* f053 */ x"62",x"fe",x"2a",                               --     mov [G], A*4 + B
	/* f056 */ x"ee",x"e0",x"e0",x"e0",x"55",x"01",x"63",x"03",x"0d",x"d0", --     jne [0x0155], 0x0363, $fail
	/* f060 */ x"62",x"20",x"e4",x"de",x"fa",                   --     mov [A], 0xFADE + A
	/* f065 */ x"ee",x"e0",x"e0",x"e0",x"aa",x"00",x"88",x"fb",x"0d",x"d0", --     jne [0x00aa], 0xfb88, $fail
	/* f06f */ x"e0",x"2a",                                     --     push A*4 + B
	/* f071 */ x"e4",x"80",                                     --     pop D
	/* f073 */ x"ec",x"80",x"e0",x"e0",x"63",x"03",x"0d",x"d0", --     jne D, 0x0363, $fail
	/* f07b */ x"e0",x"1c",x"85",                               --     push -123
	/* f07e */ x"e4",x"80",                                     --     pop D
	/* f080 */ x"ec",x"80",x"e0",x"e0",x"85",x"ff",x"0d",x"d0", --     jne D, 0xff85, $fail
	/* f088 */ x"e0",x"fe",                                     --     push G
	/* f08a */ x"e4",x"80",                                     --     pop D
	/* f08c */ x"ec",x"80",x"e0",x"e0",x"55",x"01",x"0d",x"d0", --     jne D, 0x0155, $fail
	/* f094 */ x"e0",x"3e",x"f6",                               --     push A*4 + -10
	/* f097 */ x"e4",x"80",                                     --     pop D
	/* f099 */ x"ec",x"80",x"e0",x"e0",x"9e",x"02",x"0d",x"d0", --     jne D, 0x029e, $fail
	/* f0a1 */ x"e0",x"20",                                     --     push A
	/* f0a3 */ x"e4",x"80",                                     --     pop D
	/* f0a5 */ x"ec",x"80",x"e0",x"e0",x"aa",x"00",x"0d",x"d0", --     jne D, 0x00aa, $fail
	/* f0ad */ x"e0",x"e4",x"de",x"fa",                         --     push 0xFADE + A
	/* f0b1 */ x"e4",x"80",                                     --     pop D
	/* f0b3 */ x"ec",x"80",x"e0",x"e0",x"88",x"fb",x"0d",x"d0", --     jne D, 0xfb88, $fail
	/* f0bb */ x"e0",x"21",                                     --     push A*2
	/* f0bd */ x"e4",x"80",                                     --     pop D
	/* f0bf */ x"ec",x"80",x"e0",x"e0",x"54",x"01",x"0d",x"d0", --     jne D, 0x0154, $fail
	/* f0c7 */ x"e0",x"e0",x"39",x"30",                         --     push 12345
	/* f0cb */ x"e4",x"80",                                     --     pop D
	/* f0cd */ x"ec",x"80",x"e0",x"e0",x"39",x"30",x"0d",x"d0", --     jne D, 0x3039, $fail
	/* f0d5 */ x"5c",x"e0",x"e5",x"f0",                         --     call $_L_test_uop_get_arg_1
	/* f0d9 */ x"ec",x"60",x"e0",x"e0",x"fe",x"ad",x"0d",x"d0", --     jne C, 0xADFE, $fail
	/* f0e1 */ x"58",x"e0",x"ef",x"f0",                         --     jmp $_L_test_uop_get_arg_2
	/*      */                                                  -- _L_test_uop_get_arg_1:
	/* f0e5 */ x"60",x"60",x"e0",x"fe",x"ad",                   --     mov C, 0xADFE
	/* f0ea */ x"dc",                                           --     ret
	/* f0eb */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- _L_test_uop_get_arg_2:
	/*      */                                                  --
	/*      */                                                  -- # BEGIN test_uop_rom.asm
	/*      */                                                  -- test_uop_alu_2dd:
	/* f0ef */ x"60",x"20",x"e0",x"cd",x"ab",                   --     mov A, 0xABCD
	/* f0f4 */ x"00",x"20",x"e0",x"ab",x"cd",                   --     add A, 0xCDAB # TEST
	/* f0f9 */ x"ec",x"20",x"e0",x"e0",x"78",x"79",x"0d",x"d0", --     jne A, 0x7978, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_2di:
	/* f101 */ x"60",x"20",x"e0",x"00",x"10",                   --     mov A, 0x1000
	/* f106 */ x"62",x"e0",x"e0",x"00",x"10",x"bc",x"0a",       --     mov [0x1000], 0x0ABC
	/* f10d */ x"01",x"20",x"20",                               --     add A, [A]  # TEST
	/* f110 */ x"ec",x"20",x"e0",x"e0",x"bc",x"1a",x"0d",x"d0", --     jne A, 0x1ABC, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_2id:
	/* f118 */ x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       --     mov [0x1000], 0x1234
	/* f11f */ x"02",x"e0",x"e0",x"00",x"10",x"21",x"43",       --     add [0x1000], 0x4321  # TEST
	/* f126 */ x"61",x"20",x"e0",x"00",x"10",                   --     mov A, [0x1000]
	/* f12b */ x"ec",x"20",x"e0",x"e0",x"55",x"55",x"0d",x"d0", --     jne A, 0x5555, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_2ii:
	/* f133 */ x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       --     mov [0x1000], 0x1234
	/* f13a */ x"62",x"e0",x"e0",x"05",x"10",x"aa",x"aa",       --     mov [0x1005], 0xAAAA
	/* f141 */ x"03",x"e0",x"e0",x"05",x"10",x"00",x"10",       --     add [0x1005], [0x1000]  # TEST
	/* f148 */ x"ee",x"e0",x"e0",x"e0",x"05",x"10",x"de",x"bc",x"0d",x"d0", --     jne [0x1005], 0xBCDE, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_3dd:
	/* f152 */ x"60",x"20",x"e0",x"fe",x"ab",                   --     mov A, 0xABFE
	/* f157 */ x"60",x"40",x"e0",x"55",x"55",                   --     mov B, 0x5555
	/* f15c */ x"80",x"60",x"20",x"40",                         --     add C, A, B # TEST
	/* f160 */ x"ec",x"20",x"e0",x"e0",x"fe",x"ab",x"0d",x"d0", --     jne A, 0xABFE, $fail
	/* f168 */ x"ec",x"40",x"e0",x"e0",x"55",x"55",x"0d",x"d0", --     jne B, 0x5555, $fail
	/* f170 */ x"ec",x"60",x"e0",x"e0",x"53",x"01",x"0d",x"d0", --     jne C, 0x0153, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_3di:
	/* f178 */ x"62",x"e0",x"e0",x"00",x"10",x"aa",x"12",       --     mov [0x1000], 0x12AA
	/* f17f */ x"60",x"40",x"e0",x"de",x"fa",                   --     mov B, 0xFADE
	/* f184 */ x"b5",x"20",x"e0",x"40",x"00",x"10",             --     xor A, [0x1000], B # TEST
	/* f18a */ x"ee",x"e0",x"e0",x"e0",x"00",x"10",x"aa",x"12",x"0d",x"d0", --     jne [0x1000], 0x12AA, $fail
	/* f194 */ x"ec",x"40",x"e0",x"e0",x"de",x"fa",x"0d",x"d0", --     jne B, 0xFADE, $fail
	/* f19c */ x"ec",x"20",x"e0",x"e0",x"74",x"e8",x"0d",x"d0", --     jne A, 0xE874, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_3id:
	/* f1a4 */ x"60",x"20",x"e0",x"fe",x"ab",                   --     mov A, 0xABFE
	/* f1a9 */ x"60",x"40",x"e0",x"55",x"55",                   --     mov B, 0x5555
	/* f1ae */ x"86",x"e0",x"20",x"40",x"00",x"10",             --     sub [0x1000], A, B # TEST
	/* f1b4 */ x"ec",x"20",x"e0",x"e0",x"fe",x"ab",x"0d",x"d0", --     jne A, 0xABFE, $fail
	/* f1bc */ x"ec",x"40",x"e0",x"e0",x"55",x"55",x"0d",x"d0", --     jne B, 0x5555, $fail
	/* f1c4 */ x"ee",x"e0",x"e0",x"e0",x"00",x"10",x"a9",x"56",x"0d",x"d0", --     jne [0x1000], 0x56A9, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_3ii:
	/* f1ce */ x"62",x"e0",x"e0",x"00",x"10",x"fe",x"ab",       --     mov [0x1000], 0xABFE
	/* f1d5 */ x"60",x"40",x"e0",x"55",x"55",                   --     mov B, 0x5555
	/* f1da */ x"af",x"e0",x"e0",x"40",x"02",x"10",x"00",x"10", --     and [0x1002], [0x1000], B # TEST
	/* f1e2 */ x"ee",x"e0",x"e0",x"e0",x"00",x"10",x"fe",x"ab",x"0d",x"d0", --     jne [0x1000], 0xABFE, $fail
	/* f1ec */ x"ec",x"40",x"e0",x"e0",x"55",x"55",x"0d",x"d0", --     jne B, 0x5555, $fail
	/* f1f4 */ x"ee",x"e0",x"e0",x"e0",x"02",x"10",x"54",x"01",x"0d",x"d0", --     jne [0x1002], 0x0154, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_1dx:
	/* f1fe */ x"60",x"20",x"e0",x"00",x"ff",                   --     mov A, 0xFF00
	/* f203 */ x"3c",x"20",                                     --     not A # TEST
	/* f205 */ x"ec",x"20",x"e0",x"e0",x"ff",x"00",x"0d",x"d0", --     jne A, 0x00FF, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_1ix:
	/* f20d */ x"62",x"1c",x"e0",x"64",x"34",x"12",             --     mov [100], 0x1234
	/* f213 */ x"3a",x"1c",x"64",                               --     neg [100] # TEST
	/* f216 */ x"ee",x"1c",x"e0",x"e0",x"64",x"cc",x"ed",x"0d",x"d0", --     jne [100], 0xEDCC, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_2dd:
	/* f21f */ x"60",x"40",x"e0",x"ff",x"00",                   --     mov B, 0x00FF
	/* f224 */ x"bc",x"20",x"40",                               --     not A, B # TEST
	/* f227 */ x"ec",x"40",x"e0",x"e0",x"ff",x"00",x"0d",x"d0", --     jne B, 0x00FF, $fail
	/* f22f */ x"ec",x"20",x"e0",x"e0",x"00",x"ff",x"0d",x"d0", --     jne A, 0xFF00, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_2di:
	/* f237 */ x"62",x"1c",x"e0",x"64",x"34",x"12",             --     mov [100], 0x1234
	/* f23d */ x"bd",x"20",x"1c",x"64",                         --     not A, [100]
	/* f241 */ x"ee",x"1c",x"e0",x"e0",x"64",x"34",x"12",x"0d",x"d0", --     jne [100], 0x1234, $fail
	/* f24a */ x"ec",x"20",x"e0",x"e0",x"cb",x"ed",x"0d",x"d0", --     jne A, 0xEDCB, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_2id:
	/* f252 */ x"60",x"40",x"e0",x"ff",x"00",                   --     mov B, 0x00FF
	/* f257 */ x"be",x"1c",x"40",x"64",                         --     not [100], B # TEST
	/* f25b */ x"ec",x"40",x"e0",x"e0",x"ff",x"00",x"0d",x"d0", --     jne B, 0x00FF, $fail
	/* f263 */ x"ee",x"1c",x"e0",x"e0",x"64",x"00",x"ff",x"0d",x"d0", --     jne [100], 0xFF00, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_alu_single_2ii:
	/* f26c */ x"62",x"1c",x"e0",x"66",x"ff",x"00",             --     mov [102], 0x00FF
	/* f272 */ x"bf",x"1c",x"1c",x"64",x"66",                   --     not [100], [102] # TEST
	/* f277 */ x"ee",x"1c",x"e0",x"e0",x"66",x"ff",x"00",x"0d",x"d0", --     jne [102], 0x00FF, $fail
	/* f280 */ x"ee",x"1c",x"e0",x"e0",x"64",x"00",x"ff",x"0d",x"d0", --     jne [100], 0xFF00, $fail
	/*      */                                                  --
	/*      */                                                  -- # GE GT LE LT NE EQ
	/*      */                                                  -- test_uop_cmp_dd:
	/* f289 */ x"60",x"40",x"1c",x"7b",                         --     mov B, 123
	/* f28d */ x"50",x"40",x"e0",x"c8",x"01",                   --     cmp B, 456 # TEST
	/* f292 */ x"4c",x"20",                                     --     getf A
	/* f294 */ x"ec",x"40",x"1c",x"e0",x"7b",x"0d",x"d0",       --     jne B, 123, $fail
	/* f29b */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_cmp_di:
	/* f2a2 */ x"62",x"1c",x"1c",x"64",x"85",                   --     mov [100], -123
	/* f2a7 */ x"60",x"40",x"e0",x"c8",x"01",                   --     mov B, 456
	/* f2ac */ x"d1",x"40",x"1c",x"64",                         --     icmp B, [100] # TEST
	/* f2b0 */ x"4c",x"20",                                     --     getf A
	/* f2b2 */ x"ec",x"40",x"e0",x"e0",x"c8",x"01",x"0d",x"d0", --     jne B, 456, $fail
	/* f2ba */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_cmp_id:
	/* f2c1 */ x"62",x"1c",x"1c",x"64",x"85",                   --     mov [100], -123
	/* f2c6 */ x"60",x"40",x"e0",x"c8",x"01",                   --     mov B, 456
	/* f2cb */ x"d2",x"1c",x"40",x"64",                         --     icmp [100], B # TEST
	/* f2cf */ x"4c",x"20",                                     --     getf A
	/* f2d1 */ x"ec",x"40",x"e0",x"e0",x"c8",x"01",x"0d",x"d0", --     jne B, 456, $fail
	/* f2d9 */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_cmp_ii:
	/* f2e0 */ x"62",x"1c",x"1c",x"64",x"85",                   --     mov [100], -123
	/* f2e5 */ x"62",x"1c",x"e0",x"66",x"38",x"fe",             --     mov [102], -456
	/* f2eb */ x"d3",x"1c",x"1c",x"64",x"66",                   --     icmp [100], [102]  # TEST
	/* f2f0 */ x"4c",x"20",                                     --     getf A
	/* f2f2 */ x"ee",x"1c",x"1c",x"e0",x"64",x"85",x"0d",x"d0", --     jne [100], -123, $fail
	/* f2fa */ x"ee",x"1c",x"e0",x"e0",x"66",x"38",x"fe",x"0d",x"d0", --     jne [102], -456, $fail
	/* f303 */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_d:
	/* f30a */ x"60",x"20",x"e0",x"15",x"f3",                   --     mov A, $_L_test_uop_jmp_d_okay
	/* f30f */ x"58",x"20",                                     --     jmp A  # TEST
	/* f311 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _L_test_uop_jmp_d_okay:
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_i:
	/* f315 */ x"62",x"1c",x"e0",x"64",x"22",x"f3",             --     mov [100], $_L_test_uop_jmp_i_okay
	/* f31b */ x"5a",x"1c",x"64",                               --     jmp [100]  # TEST
	/* f31e */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _L_test_uop_jmp_i_okay:
	/* f322 */ x"ee",x"1c",x"e0",x"e0",x"64",x"22",x"f3",x"0d",x"d0", --     jne [100], $_L_test_uop_jmp_i_okay, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_cond_i:
	/* f32b */ x"62",x"1c",x"e0",x"64",x"41",x"f3",             --     mov [100], $_L_test_uop_jmp_cond_i_okay
	/* f331 */ x"50",x"1c",x"1c",x"01",x"02",                   --     cmp 1, 2
	/* f336 */ x"68",x"e0",x"0d",x"d0",                         --     jeq $fail
	/* f33a */ x"6e",x"1c",x"64",                               --     jne [100]  # TEST
	/* f33d */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _L_test_uop_jmp_cond_i_okay:
	/* f341 */ x"ee",x"1c",x"e0",x"e0",x"64",x"41",x"f3",x"0d",x"d0", --     jne [100], $_L_test_uop_jmp_cond_i_okay, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_cond_d:
	/* f34a */ x"60",x"20",x"e0",x"5e",x"f3",                   --     mov A, $_L_test_uop_jmp_cond_d_okay
	/* f34f */ x"50",x"1c",x"1c",x"01",x"01",                   --     cmp 1, 1
	/* f354 */ x"6c",x"e0",x"0d",x"d0",                         --     jne $fail
	/* f358 */ x"68",x"20",                                     --     jeq A  # TEST
	/* f35a */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _L_test_uop_jmp_cond_d_okay:
	/* f35e */ x"ec",x"20",x"e0",x"e0",x"5e",x"f3",x"0d",x"d0", --     jne A, $_L_test_uop_jmp_cond_d_okay, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_3dd:
	/* f366 */ x"60",x"20",x"1c",x"7b",                         --     mov A, 123
	/* f36a */ x"ec",x"20",x"1c",x"e0",x"7b",x"0d",x"d0",       --     jne A, 123, $fail
	/* f371 */ x"e8",x"20",x"1c",x"e0",x"7b",x"7c",x"f3",       --     jeq A, 123, $_test_uop_jmp_3dd_okay
	/* f378 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _test_uop_jmp_3dd_okay:
	/* f37c */ x"ec",x"20",x"1c",x"e0",x"7b",x"0d",x"d0",       --     jne A, 123, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_3di:
	/* f383 */ x"60",x"20",x"1c",x"7b",                         --     mov A, 123
	/* f387 */ x"62",x"1c",x"e0",x"64",x"41",x"01",             --     mov [100], 321
	/* f38d */ x"e9",x"20",x"1c",x"e0",x"64",x"0d",x"d0",       --     jeq A, [100], $fail
	/* f394 */ x"ed",x"20",x"1c",x"e0",x"64",x"9f",x"f3",       --     jne A, [100], $test_uop_jmp_3di_okay
	/* f39b */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     test_uop_jmp_3di_okay:
	/* f39f */ x"ec",x"20",x"1c",x"e0",x"7b",x"0d",x"d0",       --     jne A, 123, $fail
	/* f3a6 */ x"ee",x"1c",x"e0",x"e0",x"64",x"41",x"01",x"0d",x"d0", --     jne [100], 321, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_3id:
	/* f3af */ x"60",x"20",x"1c",x"7b",                         --     mov A, 123
	/* f3b3 */ x"62",x"1c",x"e0",x"64",x"41",x"01",             --     mov [100], 321
	/* f3b9 */ x"ea",x"1c",x"20",x"e0",x"64",x"0d",x"d0",       --     jeq [100], A, $fail
	/* f3c0 */ x"ee",x"1c",x"20",x"e0",x"64",x"cb",x"f3",       --     jne [100], A, $_test_uop_jmp_3id_okay
	/* f3c7 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _test_uop_jmp_3id_okay:
	/* f3cb */ x"ec",x"20",x"1c",x"e0",x"7b",x"0d",x"d0",       --     jne A, 123, $fail
	/* f3d2 */ x"ee",x"1c",x"e0",x"e0",x"64",x"41",x"01",x"0d",x"d0", --     jne [100], 321, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_jmp_3ii:
	/* f3db */ x"62",x"e0",x"1c",x"c8",x"00",x"7b",             --     mov [200], 123
	/* f3e1 */ x"62",x"1c",x"e0",x"64",x"41",x"01",             --     mov [100], 321
	/* f3e7 */ x"eb",x"1c",x"e0",x"e0",x"64",x"c8",x"00",x"0d",x"d0", --     jeq [100], [200], $fail
	/* f3f0 */ x"ef",x"1c",x"e0",x"e0",x"64",x"c8",x"00",x"fd",x"f3", --     jne [100], [200], $_test_uop_jmp_3ii_okay
	/* f3f9 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --     _test_uop_jmp_3ii_okay:
	/* f3fd */ x"ee",x"e0",x"1c",x"e0",x"c8",x"00",x"7b",x"0d",x"d0", --     jne [200], 123, $fail
	/* f406 */ x"ee",x"1c",x"e0",x"e0",x"64",x"41",x"01",x"0d",x"d0", --     jne [100], 321, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_mov_dd:
	/* f40f */ x"60",x"20",x"1c",x"7b",                         --     mov A, 123
	/* f413 */ x"ec",x"20",x"1c",x"e0",x"7b",x"0d",x"d0",       --     jne A, 123, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_mov_di:
	/* f41a */ x"62",x"1c",x"e0",x"64",x"da",x"ff",             --     mov [100], 0xFFDA
	/* f420 */ x"61",x"20",x"1c",x"64",                         --     mov A, [100]
	/* f424 */ x"ec",x"20",x"e0",x"e0",x"da",x"ff",x"0d",x"d0", --     jne A, 0xFFDA, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_mov_id:
	/* f42c */ x"62",x"1c",x"e0",x"64",x"ff",x"ff",             --     mov [100], 0xFFFF
	/* f432 */ x"ee",x"1c",x"e0",x"e0",x"64",x"ff",x"ff",x"0d",x"d0", --     jne [100], 0xFFFF, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_mov_ii:
	/* f43b */ x"60",x"20",x"1c",x"14",                         --     mov A, 20
	/* f43f */ x"62",x"1c",x"e0",x"78",x"fa",x"fd",             --     mov [120], 0xFDFA
	/* f445 */ x"63",x"1c",x"e4",x"64",x"64",x"00",             --     mov [100], [100+A]
	/* f44b */ x"ee",x"1c",x"e0",x"e0",x"64",x"fa",x"fd",x"0d",x"d0", --     jne [100], 0xFDFA, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_bmov_dd:
	/* f454 */ x"64",x"20",x"e0",x"de",x"af",                   --     bmov A, 0xAFDE
	/* f459 */ x"ec",x"20",x"e0",x"e0",x"de",x"00",x"0d",x"d0", --     jne A, 0xDE, $fail
	/* f461 */ x"64",x"20",x"e0",x"fa",x"00",                   --     bmov A, 0xFA
	/* f466 */ x"ec",x"20",x"e0",x"e0",x"fa",x"00",x"0d",x"d0", --     jne A, 0xFA, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_bmov_di:
	/* f46e */ x"62",x"1c",x"e0",x"64",x"da",x"ff",             --     mov [100], 0xFFDA
	/* f474 */ x"65",x"20",x"1c",x"64",                         --     bmov A, [100]
	/* f478 */ x"ec",x"20",x"e0",x"e0",x"da",x"00",x"0d",x"d0", --     jne A, 0xDA, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_bmov_id:
	/* f480 */ x"62",x"1c",x"e0",x"64",x"cd",x"ab",             --     mov [100], 0xABCD
	/* f486 */ x"62",x"1c",x"e0",x"66",x"34",x"12",             --     mov [102], 0x1234
	/* f48c */ x"62",x"1c",x"e0",x"68",x"78",x"56",             --     mov [104], 0x5678
	/* f492 */ x"66",x"1c",x"e0",x"66",x"df",x"00",             --     bmov [102], 0xDF
	/* f498 */ x"ee",x"1c",x"e0",x"e0",x"64",x"cd",x"ab",x"0d",x"d0", --     jne [100], 0xABCD, $fail
	/* f4a1 */ x"ee",x"1c",x"e0",x"e0",x"66",x"df",x"12",x"0d",x"d0", --     jne [102], 0x12DF, $fail
	/* f4aa */ x"ee",x"1c",x"e0",x"e0",x"68",x"78",x"56",x"0d",x"d0", --     jne [104], 0x5678, $fail
	/* f4b3 */ x"66",x"1c",x"e0",x"67",x"b8",x"00",             --     bmov [103], 0xB8
	/* f4b9 */ x"ee",x"1c",x"e0",x"e0",x"64",x"cd",x"ab",x"0d",x"d0", --     jne [100], 0xABCD, $fail
	/* f4c2 */ x"ee",x"1c",x"e0",x"e0",x"66",x"df",x"b8",x"0d",x"d0", --     jne [102], 0xB8DF, $fail
	/* f4cb */ x"ee",x"1c",x"e0",x"e0",x"68",x"78",x"56",x"0d",x"d0", --     jne [104], 0x5678, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_bmov_ii:
	/* f4d4 */ x"62",x"e0",x"e0",x"2c",x"01",x"df",x"00",       --     mov [300], 0xDF
	/* f4db */ x"62",x"e0",x"e0",x"2e",x"01",x"b8",x"00",       --     mov [302], 0xB8
	/*      */                                                  --
	/* f4e2 */ x"62",x"e0",x"e0",x"c8",x"00",x"cd",x"ab",       --     mov [200], 0xABCD
	/* f4e9 */ x"62",x"e0",x"e0",x"ca",x"00",x"34",x"12",       --     mov [202], 0x1234
	/* f4f0 */ x"62",x"e0",x"e0",x"cc",x"00",x"78",x"56",       --     mov [204], 0x5678
	/* f4f7 */ x"67",x"e0",x"e0",x"ca",x"00",x"2c",x"01",       --     bmov [202], [300]
	/* f4fe */ x"ee",x"e0",x"e0",x"e0",x"c8",x"00",x"cd",x"ab",x"0d",x"d0", --     jne [200], 0xABCD, $fail
	/* f508 */ x"ee",x"e0",x"e0",x"e0",x"ca",x"00",x"df",x"12",x"0d",x"d0", --     jne [202], 0x12DF, $fail
	/* f512 */ x"ee",x"e0",x"e0",x"e0",x"cc",x"00",x"78",x"56",x"0d",x"d0", --     jne [204], 0x5678, $fail
	/* f51c */ x"ee",x"e0",x"e0",x"e0",x"2c",x"01",x"df",x"00",x"0d",x"d0", --     jne [300], 0xDF, $fail
	/* f526 */ x"ee",x"e0",x"e0",x"e0",x"2e",x"01",x"b8",x"00",x"0d",x"d0", --     jne [302], 0xB8, $fail
	/* f530 */ x"67",x"e0",x"e0",x"cb",x"00",x"2e",x"01",       --     bmov [203], [302]
	/* f537 */ x"ee",x"e0",x"e0",x"e0",x"c8",x"00",x"cd",x"ab",x"0d",x"d0", --     jne [200], 0xABCD, $fail
	/* f541 */ x"ee",x"e0",x"e0",x"e0",x"ca",x"00",x"df",x"b8",x"0d",x"d0", --     jne [202], 0xB8DF, $fail
	/* f54b */ x"ee",x"e0",x"e0",x"e0",x"cc",x"00",x"78",x"56",x"0d",x"d0", --     jne [204], 0x5678, $fail
	/* f555 */ x"ee",x"e0",x"e0",x"e0",x"2c",x"01",x"df",x"00",x"0d",x"d0", --     jne [300], 0xDF, $fail
	/* f55f */ x"ee",x"e0",x"e0",x"e0",x"2e",x"01",x"b8",x"00",x"0d",x"d0", --     jne [302], 0xB8, $fail
	/*      */                                                  --
	/*      */                                                  --
	/*      */                                                  -- test_uop_halt:
	/*      */                                                  --     # Can't test!
	/*      */                                                  --
	/*      */                                                  -- test_uop_getf: # getf does not support indirection
	/* f569 */ x"50",x"1c",x"1c",x"7b",x"2d",                   --     cmp 123, 45
	/* f56e */ x"4c",x"20",                                     --     getf A
	/* f570 */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_setf: # setf does not support indirection
	/* f577 */ x"cc",x"e0",x"ff",x"ff",                         --     setf 0xFFFF
	/* f57b */ x"4c",x"20",                                     --     getf A
	/* f57d */ x"ec",x"20",x"1c",x"e0",x"3f",x"0d",x"d0",       --     jne A, 0x3F, $fail # masked only 6 bits
	/*      */                                                  --
	/*      */                                                  -- test_uop_call_d:
	/* f584 */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* f589 */ x"60",x"40",x"e0",x"a4",x"f5",                   --     mov B, $_L_test_uop_call_d_fn
	/* f58e */ x"5c",x"40",                                     --     call B
	/* f590 */ x"ec",x"40",x"e0",x"e0",x"a4",x"f5",x"0d",x"d0", --     jne B, $_L_test_uop_call_d_fn, $fail
	/* f598 */ x"ec",x"20",x"e0",x"e0",x"fa",x"34",x"0d",x"d0", --     jne A, 0x34FA, $fail
	/* f5a0 */ x"58",x"e0",x"aa",x"f5",                         --     jmp $_L_test_uop_call_d_okay
	/*      */                                                  --     _L_test_uop_call_d_fn:
	/* f5a4 */ x"60",x"20",x"e0",x"fa",x"34",                   --     mov A, 0x34FA
	/* f5a9 */ x"dc",                                           --     ret
	/*      */                                                  --     _L_test_uop_call_d_okay:
	/*      */                                                  --
	/*      */                                                  -- test_uop_call_i:
	/* f5aa */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* f5af */ x"60",x"40",x"1c",x"64",                         --     mov B, 100
	/* f5b3 */ x"62",x"40",x"e0",x"ce",x"f5",                   --     mov [B], $_L_test_uop_call_i_fn
	/* f5b8 */ x"5e",x"40",                                     --     call [B]
	/* f5ba */ x"ee",x"40",x"e0",x"e0",x"ce",x"f5",x"0d",x"d0", --     jne [B], $_L_test_uop_call_i_fn, $fail
	/* f5c2 */ x"ec",x"20",x"e0",x"e0",x"d4",x"aa",x"0d",x"d0", --     jne A, 0xAAD4, $fail
	/* f5ca */ x"58",x"e0",x"d4",x"f5",                         --     jmp $_L_test_uop_call_i_okay
	/*      */                                                  --     _L_test_uop_call_i_fn:
	/* f5ce */ x"60",x"20",x"e0",x"d4",x"aa",                   --     mov A, 0xAAD4
	/* f5d3 */ x"dc",                                           --     ret
	/*      */                                                  --     _L_test_uop_call_i_okay:
	/*      */                                                  --
	/*      */                                                  -- test_uop_ret:
	/*      */                                                  --     # already tested above
	/*      */                                                  --
	/*      */                                                  -- test_uop_push_d:
	/* f5d4 */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* f5d9 */ x"60",x"40",x"1c",x"64",                         --     mov B, 100
	/* f5dd */ x"e0",x"40",                                     --     push B
	/* f5df */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0xFFE, $fail
	/* f5e7 */ x"ee",x"e0",x"1c",x"e0",x"fe",x"0f",x"64",x"0d",x"d0", --     jne [0xFFE], 100, $fail
	/* f5f0 */ x"e4",x"60",                                     --     pop C
	/* f5f2 */ x"ec",x"60",x"1c",x"e0",x"64",x"0d",x"d0",       --     jne C, 100, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_push_i:
	/* f5f9 */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* f5fe */ x"60",x"40",x"1c",x"64",                         --     mov B, 100
	/* f602 */ x"62",x"40",x"e0",x"90",x"01",                   --     mov [B], 400
	/* f607 */ x"e2",x"40",                                     --     push [B]
	/* f609 */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0xFFE, $fail
	/* f611 */ x"ee",x"e0",x"e0",x"e0",x"fe",x"0f",x"90",x"01",x"0d",x"d0", --     jne [0xFFE], 400, $fail
	/* f61b */ x"e4",x"60",                                     --     pop C
	/* f61d */ x"ec",x"60",x"e0",x"e0",x"90",x"01",x"0d",x"d0", --     jne C, 400, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_pop_d:
	/* f625 */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* f62a */ x"e0",x"e0",x"da",x"fa",                         --     push 0xFADA
	/* f62e */ x"e4",x"20",                                     --     pop A
	/* f630 */ x"ec",x"20",x"e0",x"e0",x"da",x"fa",x"0d",x"d0", --     jne A, 0xFADA, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_pop_i:
	/* f638 */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* f63d */ x"e0",x"e0",x"da",x"f2",                         --     push 0xF2DA
	/* f641 */ x"e6",x"1c",x"64",                               --     pop [100]
	/* f644 */ x"ee",x"1c",x"e0",x"e0",x"64",x"da",x"f2",x"0d",x"d0", --     jne [100], 0xF2DA, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_mmap:
	/*      */                                                  --     # mmap/umap does not support indirection
	/* f64d */ x"62",x"e0",x"e0",x"00",x"30",x"00",x"ff",       --     mov [0x3000], 0xFF00
	/* f654 */ x"62",x"e0",x"e0",x"00",x"31",x"01",x"ff",       --     mov [0x3100], 0xFF01
	/* f65b */ x"62",x"e0",x"e0",x"00",x"32",x"02",x"ff",       --     mov [0x3200], 0xFF02
	/*      */                                                  --
	/* f662 */ x"62",x"e0",x"e0",x"00",x"40",x"00",x"dd",       --     mov [0x4000], 0xDD00
	/* f669 */ x"62",x"e0",x"e0",x"00",x"41",x"01",x"dd",       --     mov [0x4100], 0xDD01
	/* f670 */ x"62",x"e0",x"e0",x"00",x"42",x"02",x"dd",       --     mov [0x4200], 0xDD02
	/*      */                                                  --
	/* f677 */ x"62",x"e0",x"e0",x"00",x"50",x"00",x"ee",       --     mov [0x5000], 0xEE00
	/* f67e */ x"62",x"e0",x"e0",x"00",x"51",x"01",x"ee",       --     mov [0x5100], 0xEE01
	/* f685 */ x"62",x"e0",x"e0",x"00",x"52",x"02",x"ee",       --     mov [0x5200], 0xEE02
	/*      */                                                  --
	/* f68c */ x"60",x"20",x"00",                               --     mov A, 0
	/* f68f */ x"60",x"40",x"e0",x"00",x"41",                   --     mov B, 0x4100
	/* f694 */ x"54",x"e0",x"e0",x"1c",x"00",x"31",x"ff",x"32",x"01", --     mmap  0x3100, 0x32FF, 1 # start, end, idx
	/* f69d */ x"ee",x"e0",x"e0",x"e0",x"00",x"31",x"01",x"dd",x"0d",x"d0", --     jne [0x3100], 0xDD01, $fail
	/* f6a7 */ x"ee",x"e0",x"e0",x"e0",x"00",x"32",x"02",x"dd",x"0d",x"d0", --     jne [0x3200], 0xDD02, $fail
	/* f6b1 */ x"ee",x"e0",x"e0",x"e0",x"00",x"30",x"00",x"ff",x"0d",x"d0", --     jne [0x3000], 0xFF00, $fail
	/*      */                                                  --
	/* f6bb */ x"60",x"40",x"e0",x"00",x"51",                   --     mov B, 0x5100
	/* f6c0 */ x"54",x"e0",x"e0",x"1c",x"00",x"32",x"ff",x"32",x"02", --     mmap  0x3200, 0x32FF, 2 # higher priority
	/* f6c9 */ x"ee",x"e0",x"e0",x"e0",x"00",x"32",x"01",x"ee",x"0d",x"d0", --     jne [0x3200], 0xEE01, $fail
	/* f6d3 */ x"ee",x"e0",x"e0",x"e0",x"00",x"30",x"00",x"ff",x"0d",x"d0", --     jne [0x3000], 0xFF00, $fail
	/* f6dd */ x"ee",x"e0",x"e0",x"e0",x"00",x"31",x"01",x"dd",x"0d",x"d0", --     jne [0x3100], 0xDD01, $fail
	/*      */                                                  --
	/* f6e7 */ x"d4",x"1c",x"01",                               --     umap 1
	/* f6ea */ x"ee",x"e0",x"e0",x"e0",x"00",x"31",x"01",x"ff",x"0d",x"d0", --     jne [0x3100], 0xFF01, $fail
	/* f6f4 */ x"ee",x"e0",x"e0",x"e0",x"00",x"32",x"01",x"ee",x"0d",x"d0", --     jne [0x3200], 0xEE01, $fail
	/* f6fe */ x"ee",x"e0",x"e0",x"e0",x"00",x"30",x"00",x"ff",x"0d",x"d0", --     jne [0x3000], 0xFF00, $fail
	/*      */                                                  --
	/* f708 */ x"d4",x"1c",x"02",                               --     umap 2
	/* f70b */ x"ee",x"e0",x"e0",x"e0",x"00",x"30",x"00",x"ff",x"0d",x"d0", --     jne [0x3000], 0xFF00, $fail
	/* f715 */ x"ee",x"e0",x"e0",x"e0",x"00",x"31",x"01",x"ff",x"0d",x"d0", --     jne [0x3100], 0xFF01, $fail
	/* f71f */ x"ee",x"e0",x"e0",x"e0",x"00",x"32",x"02",x"ff",x"0d",x"d0", --     jne [0x3200], 0xFF02, $fail
	/*      */                                                  --
	/*      */                                                  -- test_uop_umap:
	/*      */                                                  --     # done above
	/*      */                                                  -- # END test_uop_rom.asm
	/*      */                                                  --
	/*      */                                                  --
	/*      */                                                  -- # BEGIN test_aux_regs.asm
	/*      */                                                  -- test_aux_reg:
	/* f729 */ x"60",x"20",x"1c",x"01",                         --     mov A, 1
	/* f72d */ x"60",x"40",x"1c",x"02",                         --     mov B, 2
	/* f731 */ x"60",x"60",x"1c",x"03",                         --     mov C, 3
	/* f735 */ x"60",x"80",x"1c",x"04",                         --     mov D, 4
	/*      */                                                  --
	/* f739 */ x"60",x"fc",x"1c",x"05",                         --     mov E, 5
	/* f73d */ x"60",x"fd",x"1c",x"06",                         --     mov F, 6
	/* f741 */ x"60",x"fe",x"1c",x"07",                         --     mov G, 7
	/* f745 */ x"60",x"ff",x"1c",x"08",                         --     mov H, 8
	/*      */                                                  --
	/* f749 */ x"ec",x"20",x"1c",x"e0",x"01",x"0d",x"d0",       --     jne A, 1, $fail
	/* f750 */ x"ec",x"40",x"1c",x"e0",x"02",x"0d",x"d0",       --     jne B, 2, $fail
	/* f757 */ x"ec",x"60",x"1c",x"e0",x"03",x"0d",x"d0",       --     jne C, 3, $fail
	/* f75e */ x"ec",x"80",x"1c",x"e0",x"04",x"0d",x"d0",       --     jne D, 4, $fail
	/*      */                                                  --
	/* f765 */ x"ec",x"fc",x"1c",x"e0",x"05",x"0d",x"d0",       --     jne E, 5, $fail
	/* f76c */ x"ec",x"fd",x"1c",x"e0",x"06",x"0d",x"d0",       --     jne F, 6, $fail
	/* f773 */ x"ec",x"fe",x"1c",x"e0",x"07",x"0d",x"d0",       --     jne G, 7, $fail
	/* f77a */ x"ec",x"ff",x"1c",x"e0",x"08",x"0d",x"d0",       --     jne H, 8, $fail
	/*      */                                                  --
	/* f781 */ x"34",x"ff",x"e0",x"00",x"ff",                   --     xor H, 0xFF00
	/* f786 */ x"ec",x"ff",x"e0",x"e0",x"08",x"ff",x"0d",x"d0", --     jne H, 0xFF08, $fail
	/* f78e */ x"60",x"20",x"ff",                               --     mov A, H
	/* f791 */ x"ec",x"20",x"e0",x"e0",x"08",x"ff",x"0d",x"d0", --     jne A, 0xFF08, $fail
	/* f799 */ x"60",x"fc",x"fe",                               --     mov E, G
	/* f79c */ x"ec",x"fc",x"1c",x"e0",x"07",x"0d",x"d0",       --     jne E, 7, $fail
	/* f7a3 */ x"ec",x"ff",x"e0",x"e0",x"08",x"ff",x"0d",x"d0", --     jne H, 0xFF08, $fail
	/*      */                                                  -- # END test_aux_regs.asm
	/*      */                                                  --
	/*      */                                                  --
	/*      */                                                  -- # BEGIN test_call_ret.asm
	/*      */                                                  -- test_call_ret:
	/*      */                                                  --
	/* f7ab */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* f7b0 */ x"5c",x"e0",x"27",x"f8",                         --     call $fn_test_target
	/* f7b4 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*      */                                                  --
	/* f7bc */ x"60",x"20",x"1c",x"0a",                         --     mov A, 10
	/* f7c0 */ x"60",x"40",x"00",                               --     mov B, 0
	/* f7c3 */ x"60",x"60",x"00",                               --     mov C, 0
	/* f7c6 */ x"60",x"80",x"00",                               --     mov D, 0
	/* f7c9 */ x"5c",x"e0",x"f6",x"f7",                         --     call $fn_recursive
	/*      */                                                  --
	/* f7cd */ x"ec",x"20",x"00",x"e0",x"0d",x"d0",             --     jne A, 0, $fail
	/* f7d3 */ x"ec",x"40",x"e0",x"e0",x"3f",x"cf",x"0d",x"d0", --     jne B, 0xcf3f, $fail
	/* f7db */ x"ec",x"60",x"1c",x"e0",x"2d",x"0d",x"d0",       --     jne C, 0x002d, $fail
	/* f7e2 */ x"ec",x"80",x"e0",x"e0",x"97",x"45",x"0d",x"d0", --     jne D, 0x4597, $fail
	/* f7ea */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*      */                                                  --
	/* f7f2 */ x"58",x"e0",x"34",x"f8",                         --     jmp $test_call_ret_end
	/*      */                                                  --
	/*      */                                                  -- fn_recursive:
	/* f7f6 */ x"04",x"20",x"1c",x"01",                         --     sub A, 1
	/* f7fa */ x"5c",x"e0",x"1f",x"f8",                         --     call $fn_process_c
	/* f7fe */ x"e8",x"20",x"00",x"e0",x"1a",x"f8",             --     jeq A, 0, $fn_recursive_end
	/* f804 */ x"5c",x"e0",x"f6",x"f7",                         --     call $fn_recursive
	/* f808 */ x"00",x"80",x"60",                               --     add D, C
	/* f80b */ x"08",x"80",x"1c",x"03",                         --     mul D, 3
	/* f80f */ x"00",x"40",x"80",                               --     add B, D
	/* f812 */ x"e0",x"80",                                     --     push D
	/* f814 */ x"08",x"40",x"1c",x"05",                         --     mul B, 5
	/* f818 */ x"e4",x"80",                                     --     pop D
	/*      */                                                  -- fn_recursive_end:
	/* f81a */ x"dc",                                           --     ret
	/* f81b */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --
	/*      */                                                  -- fn_process_c:
	/* f81f */ x"00",x"60",x"20",                               --     add C, A
	/* f822 */ x"dc",                                           --     ret
	/* f823 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --
	/*      */                                                  -- fn_test_target:
	/* f827 */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0x0ffe, $fail
	/* f82f */ x"dc",                                           --     ret
	/* f830 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  --
	/*      */                                                  -- test_call_ret_end:
	/*      */                                                  -- # END test_call_ret.asm
	/*      */                                                  --
	/*      */                                                  --
	/*      */                                                  -- # BEGIN test_mem_access.asm
	/*      */                                                  -- test_mem_access:
	/* f834 */ x"62",x"e0",x"e0",x"00",x"01",x"ed",x"ff",       --     mov [0x100], 0xFFED
	/* f83b */ x"ee",x"e0",x"e0",x"e0",x"00",x"01",x"aa",x"00",x"49",x"f8", --     jne [0x100], 0x00AA, $test_mem_access_check_jmp
	/* f845 */ x"58",x"e0",x"0d",x"d0",                         --     jmp $fail
	/*      */                                                  -- test_mem_access_check_jmp:
	/*      */                                                  --
	/* f849 */ x"62",x"e0",x"00",x"00",x"10",                   --     mov [0x1000], 0
	/* f84e */ x"60",x"a0",x"e0",x"00",x"10",                   --     mov SP, 0x1000
	/* f853 */ x"ee",x"a0",x"00",x"e0",x"0d",x"d0",             --     jne [SP], 0, $fail
	/* f859 */ x"e0",x"00",                                     --     push 0
	/* f85b */ x"e0",x"00",                                     --     push 0
	/* f85d */ x"e0",x"00",                                     --     push 0
	/* f85f */ x"e4",x"20",                                     --     pop A
	/* f861 */ x"e4",x"20",                                     --     pop A
	/* f863 */ x"e4",x"20",                                     --     pop A
	/* f865 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/* f86d */ x"ec",x"20",x"00",x"e0",x"0d",x"d0",             --     jne A, 0, $fail
	/*      */                                                  --
	/* f873 */ x"e0",x"e0",x"02",x"01",                         --     push 0x0102
	/* f877 */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0xFFE, $fail
	/* f87f */ x"e0",x"e0",x"04",x"03",                         --     push 0x0304
	/* f883 */ x"ec",x"a0",x"e0",x"e0",x"fc",x"0f",x"0d",x"d0", --     jne SP, 0xFFC, $fail
	/*      */                                                  --
	/* f88b */ x"ee",x"e0",x"e0",x"e0",x"fe",x"0f",x"02",x"01",x"0d",x"d0", --     jne [0xFFE], 0x0102, $fail
	/* f895 */ x"ee",x"e0",x"e0",x"e0",x"fc",x"0f",x"04",x"03",x"0d",x"d0", --     jne [0xFFC], 0x0304, $fail
	/*      */                                                  --
	/*      */                                                  --     # unaligned
	/* f89f */ x"ee",x"e0",x"e0",x"e0",x"fb",x"0f",x"00",x"04",x"0d",x"d0", --     jne [0xFFB], 0x0400, $fail
	/* f8a9 */ x"ee",x"e0",x"e0",x"e0",x"fd",x"0f",x"03",x"02",x"0d",x"d0", --     jne [0xFFD], 0x0203, $fail
	/* f8b3 */ x"ee",x"e0",x"1c",x"e0",x"ff",x"0f",x"01",x"0d",x"d0", --     jne [0xFFF], 0x0001, $fail
	/*      */                                                  --
	/* f8bc */ x"e4",x"20",                                     --     pop A
	/* f8be */ x"ec",x"20",x"e0",x"e0",x"04",x"03",x"0d",x"d0", --     jne A, 0x0304, $fail
	/* f8c6 */ x"ec",x"a0",x"e0",x"e0",x"fe",x"0f",x"0d",x"d0", --     jne SP, 0xFFE, $fail
	/* f8ce */ x"e4",x"20",                                     --     pop A
	/* f8d0 */ x"ec",x"20",x"e0",x"e0",x"02",x"01",x"0d",x"d0", --     jne A, 0x0102, $fail
	/* f8d8 */ x"ec",x"a0",x"e0",x"e0",x"00",x"10",x"0d",x"d0", --     jne SP, 0x1000, $fail
	/*      */                                                  --
	/*      */                                                  -- # END test_mem_access.asm
	/*      */                                                  --
	/*      */                                                  --
	/*      */                                                  -- # BEGIN test_cmp.asm
	/*      */                                                  -- test_cmp:
	/* f8e0 */ x"cc",x"e0",x"ff",x"ff",                         --     setf 0xFFFF
	/* f8e4 */ x"4c",x"20",                                     --     getf A
	/* f8e6 */ x"ec",x"20",x"1c",x"e0",x"3f",x"0d",x"d0",       --     jne A, 0x3F, $fail
	/*      */                                                  --
	/* f8ed */ x"cc",x"e0",x"ab",x"ab",                         --     setf 0xABAB
	/* f8f1 */ x"4c",x"20",                                     --     getf A
	/* f8f3 */ x"ec",x"20",x"1c",x"e0",x"2b",x"0d",x"d0",       --     jne A, 0x2B, $fail
	/*      */                                                  --
	/*      */                                                  --     # unsigned
	/* f8fa */ x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             --     cmp 0xFFAB, 0x2B
	/* f900 */ x"4c",x"20",                                     --     getf A
	/*      */                                                  --     # GE GT LE LT NE EQ
	/* f902 */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*      */                                                  --
	/* f909 */ x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             --     cmp 0x2B, 0xFFAB
	/* f90f */ x"4c",x"20",                                     --     getf A
	/* f911 */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*      */                                                  --
	/* f918 */ x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     cmp 0xFFAB, 0xFFAB
	/* f91f */ x"4c",x"20",                                     --     getf A
	/* f921 */ x"ec",x"20",x"1c",x"e0",x"29",x"0d",x"d0",       --     jne A, 0b101001, $fail
	/*      */                                                  --
	/*      */                                                  --     # signed
	/* f928 */ x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             --     icmp 0xFFAB, 0x2B
	/* f92e */ x"4c",x"20",                                     --     getf A
	/*      */                                                  --     # GE GT LE LT NE EQ
	/* f930 */ x"ec",x"20",x"1c",x"e0",x"0e",x"0d",x"d0",       --     jne A, 0b001110, $fail
	/*      */                                                  --
	/* f937 */ x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             --     icmp 0x2B, 0xFFAB
	/* f93d */ x"4c",x"20",                                     --     getf A
	/* f93f */ x"ec",x"20",x"1c",x"e0",x"32",x"0d",x"d0",       --     jne A, 0b110010, $fail
	/*      */                                                  --
	/* f946 */ x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       --     icmp 0xFFAB, 0xFFAB
	/* f94d */ x"4c",x"20",                                     --     getf A
	/* f94f */ x"ec",x"20",x"1c",x"e0",x"29",x"0d",x"d0",       --     jne A, 0b101001, $fail
	/*      */                                                  -- # END test_cmp.asm
	/*      */                                                  --
	/*      */                                                  -- end_of_test:
	/* f956 */ x"60",x"20",x"e0",x"ad",x"de",                   --     mov A, 0xDEAD
	/* f95b */ x"60",x"40",x"e0",x"ef",x"be",                   --     mov B, 0xBEEF
	/* f960 */ x"88",x"60",x"20",x"40",                         --     mul C, A, B
	/* f964 */ x"58",x"e0",x"12",x"d0",                         --     jmp $success
	/*      */                                                  --
	/* f968 */ x"d8"                                            -- __end_of_rom: halt
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
