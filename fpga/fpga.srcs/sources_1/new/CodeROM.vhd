
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 10474;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | SECTION_BEGIN_boot:
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_self_test:
                                                     --      | .boot:
    x"60",x"20",x"1c",x"fa",                         -- d000 |   mov A, 0xfa
    x"ec",x"20",x"e0",x"f8",x"fa",x"00",x"50",x"00", -- d004 |   jne A, 0xfa, ${start_test}:rel + PC
                                                     --      | fail:
    x"d8",                                           -- d00c |   halt
    x"58",x"f8",x"ff",x"ff",                         -- d00d |   jmp ${fail}:rel + PC
                                                     --      | success:
    x"ec",x"20",x"e0",x"f8",x"ad",x"de",x"fb",x"ff", -- d011 |   jne A, 0xdead, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"ef",x"be",x"f3",x"ff", -- d019 |   jne B, 0xbeef, ${fail}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"83",x"49",x"eb",x"ff", -- d021 |   jne C, 0x4983, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"14",x"a6",x"e3",x"ff", -- d029 |   jne H, 0xa614, ${fail}:rel + PC
    x"60",x"80",x"ff",                               -- d031 |   mov D, H
    x"00",x"20",x"e0",x"ab",x"ac",                   -- d034 |   add A, 0xacab
    x"00",x"40",x"e0",x"cc",x"41",                   -- d039 |   add B, 0x41cc
    x"08",x"20",x"80",                               -- d03e |   mul A, D
    x"34",x"20",x"e0",x"4a",x"f2",                   -- d041 |   xor A, 0xf24a
    x"34",x"60",x"e0",x"4f",x"49",                   -- d046 |   xor C, 0x494f
    x"34",x"ff",x"e0",x"30",x"5a",                   -- d04b |   xor H, 0x5a30
    x"60",x"80",x"ff",                               -- d050 |   mov D, H
    x"d8",                                           -- d053 |   halt
                                                     --      | start_test:
                                                     --      | alu_test:
    x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d054 |   add B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"42",x"72",x"b0",x"ff", -- d05c |   jne B, 0x7242, ${fail}:rel + PC
    x"84",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d064 |   sub B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"1e",x"32",x"a0",x"ff", -- d06c |   jne B, 0x321e, ${fail}:rel + PC
    x"88",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d074 |   mul B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"60",x"c7",x"90",x"ff", -- d07c |   jne B, 0xc760, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"6c",x"83",x"88",x"ff", -- d084 |   jne H, 0x836c, ${fail}:rel + PC
    x"8c",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d08c |   imul B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"60",x"c7",x"78",x"ff", -- d094 |   jne B, 0xc760, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"2a",x"11",x"70",x"ff", -- d09c |   jne H, 0x112a, ${fail}:rel + PC
    x"a0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0a4 |   shr B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"8c",x"34",x"60",x"ff", -- d0ac |   jne B, 0x348c, ${fail}:rel + PC
    x"a4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0b4 |   ishr B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"8c",x"f4",x"50",x"ff", -- d0bc |   jne B, 0xf48c, ${fail}:rel + PC
    x"a8",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0c4 |   shl B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"c0",x"48",x"40",x"ff", -- d0cc |   jne B, 0x48c0, ${fail}:rel + PC
    x"ac",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0d4 |   and B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"10",x"80",x"30",x"ff", -- d0dc |   jne B, 0x8010, ${fail}:rel + PC
    x"b0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0e4 |   or B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"32",x"f2",x"20",x"ff", -- d0ec |   jne B, 0xf232, ${fail}:rel + PC
    x"b4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0f4 |   xor B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"22",x"72",x"10",x"ff", -- d0fc |   jne B, 0x7222, ${fail}:rel + PC
    x"b8",x"40",x"e0",x"30",x"d2",                   -- d104 |   neg B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"d0",x"2d",x"03",x"ff", -- d109 |   jne B, 0x2dd0, ${fail}:rel + PC
    x"bc",x"40",x"e0",x"30",x"d2",                   -- d111 |   not B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"cf",x"2d",x"f6",x"fe", -- d116 |   jne B, 0x2dcf, ${fail}:rel + PC
    x"c0",x"40",x"e0",x"30",x"d2",                   -- d11e |   bool B, 0xd230
    x"ec",x"40",x"1c",x"f8",x"01",x"e9",x"fe",       -- d123 |   jne B, 0x1, ${fail}:rel + PC
    x"c4",x"40",x"e0",x"30",x"d2",                   -- d12a |   inc B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"31",x"d2",x"dd",x"fe", -- d12f |   jne B, 0xd231, ${fail}:rel + PC
    x"c8",x"40",x"e0",x"30",x"d2",                   -- d137 |   dec B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"2f",x"d2",x"d0",x"fe", -- d13c |   jne B, 0xd22f, ${fail}:rel + PC
    x"80",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d144 |   add B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"e4",x"da",x"c0",x"fe", -- d14c |   jne B, 0xdae4, ${fail}:rel + PC
    x"84",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d154 |   sub B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"76",x"26",x"b0",x"fe", -- d15c |   jne B, 0x2676, ${fail}:rel + PC
    x"88",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d164 |   mul B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"2b",x"77",x"a0",x"fe", -- d16c |   jne B, 0x772b, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"93",x"00",x"98",x"fe", -- d174 |   jne H, 0x93, ${fail}:rel + PC
    x"8c",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d17c |   imul B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"2b",x"77",x"88",x"fe", -- d184 |   jne B, 0x772b, ${fail}:rel + PC
    x"ec",x"ff",x"1c",x"f8",x"e6",x"80",x"fe",       -- d18c |   jne H, 0xe6, ${fail}:rel + PC
    x"a0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d193 |   shr B, 0xad, 0xda37
    x"ec",x"40",x"1c",x"f8",x"01",x"71",x"fe",       -- d19b |   jne B, 0x1, ${fail}:rel + PC
    x"a4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1a2 |   ishr B, 0xad, 0xda37
    x"ec",x"40",x"1c",x"f8",x"01",x"62",x"fe",       -- d1aa |   jne B, 0x1, ${fail}:rel + PC
    x"a8",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1b1 |   shl B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"80",x"56",x"53",x"fe", -- d1b9 |   jne B, 0x5680, ${fail}:rel + PC
    x"ac",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1c1 |   and B, 0xad, 0xda37
    x"ec",x"40",x"1c",x"f8",x"25",x"43",x"fe",       -- d1c9 |   jne B, 0x25, ${fail}:rel + PC
    x"b0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1d0 |   or B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"bf",x"da",x"34",x"fe", -- d1d8 |   jne B, 0xdabf, ${fail}:rel + PC
    x"b4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1e0 |   xor B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"9a",x"da",x"24",x"fe", -- d1e8 |   jne B, 0xda9a, ${fail}:rel + PC
    x"b8",x"40",x"e0",x"ad",x"00",                   -- d1f0 |   neg B, 0xad
    x"ec",x"40",x"e0",x"f8",x"53",x"ff",x"17",x"fe", -- d1f5 |   jne B, 0xff53, ${fail}:rel + PC
    x"bc",x"40",x"e0",x"ad",x"00",                   -- d1fd |   not B, 0xad
    x"ec",x"40",x"e0",x"f8",x"52",x"ff",x"0a",x"fe", -- d202 |   jne B, 0xff52, ${fail}:rel + PC
    x"c0",x"40",x"e0",x"ad",x"00",                   -- d20a |   bool B, 0xad
    x"ec",x"40",x"1c",x"f8",x"01",x"fd",x"fd",       -- d20f |   jne B, 0x1, ${fail}:rel + PC
    x"c4",x"40",x"e0",x"ad",x"00",                   -- d216 |   inc B, 0xad
    x"ec",x"40",x"e0",x"f8",x"ae",x"00",x"f1",x"fd", -- d21b |   jne B, 0xae, ${fail}:rel + PC
    x"c8",x"40",x"e0",x"ad",x"00",                   -- d223 |   dec B, 0xad
    x"ec",x"40",x"e0",x"f8",x"ac",x"00",x"e4",x"fd", -- d228 |   jne B, 0xac, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d230 |   mov B, 0xf0ad
    x"00",x"40",x"e0",x"3f",x"2a",                   -- d235 |   add B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"ec",x"1a",x"d2",x"fd", -- d23a |   jne B, 0x1aec, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d242 |   mov B, 0xf0ad
    x"04",x"40",x"e0",x"3f",x"2a",                   -- d247 |   sub B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"6e",x"c6",x"c0",x"fd", -- d24c |   jne B, 0xc66e, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d254 |   mov B, 0xf0ad
    x"08",x"40",x"e0",x"3f",x"2a",                   -- d259 |   mul B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"93",x"9c",x"ae",x"fd", -- d25e |   jne B, 0x9c93, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"b7",x"27",x"a6",x"fd", -- d266 |   jne H, 0x27b7, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d26e |   mov B, 0xf0ad
    x"0c",x"40",x"e0",x"3f",x"2a",                   -- d273 |   imul B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"93",x"9c",x"94",x"fd", -- d278 |   jne B, 0x9c93, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"78",x"fd",x"8c",x"fd", -- d280 |   jne H, 0xfd78, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d288 |   mov B, 0xf0ad
    x"20",x"40",x"e0",x"3f",x"2a",                   -- d28d |   shr B, 0x2a3f
    x"ec",x"40",x"1c",x"f8",x"01",x"7a",x"fd",       -- d292 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d299 |   mov B, 0xf0ad
    x"24",x"40",x"e0",x"3f",x"2a",                   -- d29e |   ishr B, 0x2a3f
    x"ec",x"40",x"1c",x"f8",x"ff",x"69",x"fd",       -- d2a3 |   jne B, 0xff, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2aa |   mov B, 0xf0ad
    x"28",x"40",x"e0",x"3f",x"2a",                   -- d2af |   shl B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"00",x"80",x"58",x"fd", -- d2b4 |   jne B, 0x8000, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2bc |   mov B, 0xf0ad
    x"2c",x"40",x"e0",x"3f",x"2a",                   -- d2c1 |   and B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"2d",x"20",x"46",x"fd", -- d2c6 |   jne B, 0x202d, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2ce |   mov B, 0xf0ad
    x"30",x"40",x"e0",x"3f",x"2a",                   -- d2d3 |   or B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"bf",x"fa",x"34",x"fd", -- d2d8 |   jne B, 0xfabf, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2e0 |   mov B, 0xf0ad
    x"34",x"40",x"e0",x"3f",x"2a",                   -- d2e5 |   xor B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"92",x"da",x"22",x"fd", -- d2ea |   jne B, 0xda92, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2f2 |   mov B, 0xf0ad
    x"38",x"40",                                     -- d2f7 |   neg B
    x"ec",x"40",x"e0",x"f8",x"53",x"0f",x"13",x"fd", -- d2f9 |   jne B, 0xf53, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d301 |   mov B, 0xf0ad
    x"3c",x"40",                                     -- d306 |   not B
    x"ec",x"40",x"e0",x"f8",x"52",x"0f",x"04",x"fd", -- d308 |   jne B, 0xf52, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d310 |   mov B, 0xf0ad
    x"40",x"40",                                     -- d315 |   bool B
    x"ec",x"40",x"1c",x"f8",x"01",x"f5",x"fc",       -- d317 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d31e |   mov B, 0xf0ad
    x"44",x"40",                                     -- d323 |   inc B
    x"ec",x"40",x"e0",x"f8",x"ae",x"f0",x"e7",x"fc", -- d325 |   jne B, 0xf0ae, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d32d |   mov B, 0xf0ad
    x"48",x"40",                                     -- d332 |   dec B
    x"ec",x"40",x"e0",x"f8",x"ac",x"f0",x"d8",x"fc", -- d334 |   jne B, 0xf0ac, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d33c |   mov B, 0
    x"00",x"40",x"e0",x"ad",x"de",                   -- d33f |   add B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"c8",x"fc", -- d344 |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d34c |   mov B, 0
    x"04",x"40",x"e0",x"ad",x"de",                   -- d34f |   sub B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"53",x"21",x"b8",x"fc", -- d354 |   jne B, 0x2153, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d35c |   mov B, 0
    x"08",x"40",x"e0",x"ad",x"de",                   -- d35f |   mul B, 0xdead
    x"ec",x"40",x"00",x"f8",x"a8",x"fc",             -- d364 |   jne B, 0, ${fail}:rel + PC
    x"ec",x"ff",x"00",x"f8",x"a2",x"fc",             -- d36a |   jne H, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d370 |   mov B, 0
    x"0c",x"40",x"e0",x"ad",x"de",                   -- d373 |   imul B, 0xdead
    x"ec",x"40",x"00",x"f8",x"94",x"fc",             -- d378 |   jne B, 0, ${fail}:rel + PC
    x"ec",x"ff",x"00",x"f8",x"8e",x"fc",             -- d37e |   jne H, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d384 |   mov B, 0
    x"20",x"40",x"e0",x"ad",x"de",                   -- d387 |   shr B, 0xdead
    x"ec",x"40",x"00",x"f8",x"80",x"fc",             -- d38c |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d392 |   mov B, 0
    x"24",x"40",x"e0",x"ad",x"de",                   -- d395 |   ishr B, 0xdead
    x"ec",x"40",x"00",x"f8",x"72",x"fc",             -- d39a |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3a0 |   mov B, 0
    x"28",x"40",x"e0",x"ad",x"de",                   -- d3a3 |   shl B, 0xdead
    x"ec",x"40",x"00",x"f8",x"64",x"fc",             -- d3a8 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3ae |   mov B, 0
    x"2c",x"40",x"e0",x"ad",x"de",                   -- d3b1 |   and B, 0xdead
    x"ec",x"40",x"00",x"f8",x"56",x"fc",             -- d3b6 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3bc |   mov B, 0
    x"30",x"40",x"e0",x"ad",x"de",                   -- d3bf |   or B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"48",x"fc", -- d3c4 |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3cc |   mov B, 0
    x"34",x"40",x"e0",x"ad",x"de",                   -- d3cf |   xor B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"38",x"fc", -- d3d4 |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3dc |   mov B, 0
    x"38",x"40",                                     -- d3df |   neg B
    x"ec",x"40",x"00",x"f8",x"2b",x"fc",             -- d3e1 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3e7 |   mov B, 0
    x"3c",x"40",                                     -- d3ea |   not B
    x"ec",x"40",x"1c",x"f8",x"ff",x"20",x"fc",       -- d3ec |   jne B, 0xff, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3f3 |   mov B, 0
    x"40",x"40",                                     -- d3f6 |   bool B
    x"ec",x"40",x"00",x"f8",x"14",x"fc",             -- d3f8 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3fe |   mov B, 0
    x"44",x"40",                                     -- d401 |   inc B
    x"ec",x"40",x"1c",x"f8",x"01",x"09",x"fc",       -- d403 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d40a |   mov B, 0
    x"48",x"40",                                     -- d40d |   dec B
    x"ec",x"40",x"1c",x"f8",x"ff",x"fd",x"fb",       -- d40f |   jne B, 0xff, ${fail}:rel + PC
                                                     --      | jmp_test:
    x"e8",x"1c",x"1c",x"f8",x"ab",x"2b",x"f6",x"fb", -- d416 |   jeq 0xab, 0x2b, ${fail}:rel + PC
    x"ec",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d41e |   jne 0xab, 0x2b, ${_L_test_jmp_1}:rel + PC
    x"58",x"f8",x"e6",x"fb",                         -- d426 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_1:
    x"f0",x"1c",x"1c",x"f8",x"ab",x"2b",x"e2",x"fb", -- d42a |   jlt 0xab, 0x2b, ${fail}:rel + PC
    x"f4",x"1c",x"1c",x"f8",x"ab",x"2b",x"da",x"fb", -- d432 |   jle 0xab, 0x2b, ${fail}:rel + PC
    x"f8",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d43a |   jgt 0xab, 0x2b, ${_L_test_jmp_2}:rel + PC
    x"58",x"f8",x"ca",x"fb",                         -- d442 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_2:
    x"fc",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d446 |   jge 0xab, 0x2b, ${_L_test_jmp_3}:rel + PC
    x"58",x"f8",x"be",x"fb",                         -- d44e |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_3:
    x"50",x"1c",x"1c",x"ab",x"2b",                   -- d452 |   cmp 0xab, 0x2b
    x"68",x"f8",x"b5",x"fb",                         -- d457 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d45b |   jne ${_L_test_jmp_4}:rel + PC
    x"58",x"f8",x"ad",x"fb",                         -- d45f |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_4:
    x"70",x"f8",x"a9",x"fb",                         -- d463 |   jlt ${fail}:rel + PC
    x"74",x"f8",x"a5",x"fb",                         -- d467 |   jle ${fail}:rel + PC
    x"78",x"f8",x"08",x"00",                         -- d46b |   jgt ${_L_test_jmp_5}:rel + PC
    x"58",x"f8",x"9d",x"fb",                         -- d46f |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_5:
    x"7c",x"f8",x"08",x"00",                         -- d473 |   jge ${_L_test_jmp_6}:rel + PC
    x"58",x"f8",x"95",x"fb",                         -- d477 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_6:
    x"d0",x"1c",x"1c",x"ab",x"2b",                   -- d47b |   icmp 0xab, 0x2b
    x"68",x"f8",x"8c",x"fb",                         -- d480 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d484 |   jne ${_L_test_jmp_7}:rel + PC
    x"58",x"f8",x"84",x"fb",                         -- d488 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_7:
    x"70",x"f8",x"08",x"00",                         -- d48c |   jlt ${_L_test_jmp_8}:rel + PC
    x"58",x"f8",x"7c",x"fb",                         -- d490 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_8:
    x"74",x"f8",x"08",x"00",                         -- d494 |   jle ${_L_test_jmp_9}:rel + PC
    x"58",x"f8",x"74",x"fb",                         -- d498 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_9:
    x"78",x"f8",x"70",x"fb",                         -- d49c |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"6c",x"fb",                         -- d4a0 |   jge ${fail}:rel + PC
    x"e8",x"1c",x"1c",x"f8",x"2b",x"ab",x"68",x"fb", -- d4a4 |   jeq 0x2b, 0xab, ${fail}:rel + PC
    x"ec",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d4ac |   jne 0x2b, 0xab, ${_L_test_jmp_10}:rel + PC
    x"58",x"f8",x"58",x"fb",                         -- d4b4 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_10:
    x"f0",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d4b8 |   jlt 0x2b, 0xab, ${_L_test_jmp_11}:rel + PC
    x"58",x"f8",x"4c",x"fb",                         -- d4c0 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_11:
    x"f4",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d4c4 |   jle 0x2b, 0xab, ${_L_test_jmp_12}:rel + PC
    x"58",x"f8",x"40",x"fb",                         -- d4cc |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_12:
    x"f8",x"1c",x"1c",x"f8",x"2b",x"ab",x"3c",x"fb", -- d4d0 |   jgt 0x2b, 0xab, ${fail}:rel + PC
    x"fc",x"1c",x"1c",x"f8",x"2b",x"ab",x"34",x"fb", -- d4d8 |   jge 0x2b, 0xab, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"2b",x"ab",                   -- d4e0 |   cmp 0x2b, 0xab
    x"68",x"f8",x"27",x"fb",                         -- d4e5 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d4e9 |   jne ${_L_test_jmp_13}:rel + PC
    x"58",x"f8",x"1f",x"fb",                         -- d4ed |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_13:
    x"70",x"f8",x"08",x"00",                         -- d4f1 |   jlt ${_L_test_jmp_14}:rel + PC
    x"58",x"f8",x"17",x"fb",                         -- d4f5 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_14:
    x"74",x"f8",x"08",x"00",                         -- d4f9 |   jle ${_L_test_jmp_15}:rel + PC
    x"58",x"f8",x"0f",x"fb",                         -- d4fd |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_15:
    x"78",x"f8",x"0b",x"fb",                         -- d501 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"07",x"fb",                         -- d505 |   jge ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"2b",x"ab",                   -- d509 |   icmp 0x2b, 0xab
    x"68",x"f8",x"fe",x"fa",                         -- d50e |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d512 |   jne ${_L_test_jmp_16}:rel + PC
    x"58",x"f8",x"f6",x"fa",                         -- d516 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_16:
    x"70",x"f8",x"f2",x"fa",                         -- d51a |   jlt ${fail}:rel + PC
    x"74",x"f8",x"ee",x"fa",                         -- d51e |   jle ${fail}:rel + PC
    x"78",x"f8",x"08",x"00",                         -- d522 |   jgt ${_L_test_jmp_17}:rel + PC
    x"58",x"f8",x"e6",x"fa",                         -- d526 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_17:
    x"7c",x"f8",x"08",x"00",                         -- d52a |   jge ${_L_test_jmp_18}:rel + PC
    x"58",x"f8",x"de",x"fa",                         -- d52e |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_18:
    x"e8",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- d532 |   jeq 0xab, 0xab, ${_L_test_jmp_19}:rel + PC
    x"58",x"f8",x"d2",x"fa",                         -- d53a |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_19:
    x"ec",x"1c",x"1c",x"f8",x"ab",x"ab",x"ce",x"fa", -- d53e |   jne 0xab, 0xab, ${fail}:rel + PC
    x"f0",x"1c",x"1c",x"f8",x"ab",x"ab",x"c6",x"fa", -- d546 |   jlt 0xab, 0xab, ${fail}:rel + PC
    x"f4",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- d54e |   jle 0xab, 0xab, ${_L_test_jmp_20}:rel + PC
    x"58",x"f8",x"b6",x"fa",                         -- d556 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_20:
    x"f8",x"1c",x"1c",x"f8",x"ab",x"ab",x"b2",x"fa", -- d55a |   jgt 0xab, 0xab, ${fail}:rel + PC
    x"fc",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- d562 |   jge 0xab, 0xab, ${_L_test_jmp_21}:rel + PC
    x"58",x"f8",x"a2",x"fa",                         -- d56a |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_21:
    x"50",x"1c",x"1c",x"ab",x"ab",                   -- d56e |   cmp 0xab, 0xab
    x"68",x"f8",x"08",x"00",                         -- d573 |   jeq ${_L_test_jmp_22}:rel + PC
    x"58",x"f8",x"95",x"fa",                         -- d577 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_22:
    x"6c",x"f8",x"91",x"fa",                         -- d57b |   jne ${fail}:rel + PC
    x"70",x"f8",x"8d",x"fa",                         -- d57f |   jlt ${fail}:rel + PC
    x"74",x"f8",x"08",x"00",                         -- d583 |   jle ${_L_test_jmp_23}:rel + PC
    x"58",x"f8",x"85",x"fa",                         -- d587 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_23:
    x"78",x"f8",x"81",x"fa",                         -- d58b |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"08",x"00",                         -- d58f |   jge ${_L_test_jmp_24}:rel + PC
    x"58",x"f8",x"79",x"fa",                         -- d593 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_24:
    x"d0",x"1c",x"1c",x"ab",x"ab",                   -- d597 |   icmp 0xab, 0xab
    x"68",x"f8",x"08",x"00",                         -- d59c |   jeq ${_L_test_jmp_25}:rel + PC
    x"58",x"f8",x"6c",x"fa",                         -- d5a0 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_25:
    x"6c",x"f8",x"68",x"fa",                         -- d5a4 |   jne ${fail}:rel + PC
    x"70",x"f8",x"64",x"fa",                         -- d5a8 |   jlt ${fail}:rel + PC
    x"74",x"f8",x"08",x"00",                         -- d5ac |   jle ${_L_test_jmp_26}:rel + PC
    x"58",x"f8",x"5c",x"fa",                         -- d5b0 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_26:
    x"78",x"f8",x"58",x"fa",                         -- d5b4 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"08",x"00",                         -- d5b8 |   jge ${_L_test_jmp_27}:rel + PC
    x"58",x"f8",x"50",x"fa",                         -- d5bc |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_27:
                                                     --      | test_uop_get_arg:
    x"60",x"a0",x"e0",x"00",x"70",                   -- d5c0 |   mov SP, 0x7000
    x"60",x"20",x"e0",x"aa",x"00",                   -- d5c5 |   mov A, 0xaa
    x"60",x"40",x"e0",x"bb",x"00",                   -- d5ca |   mov B, 0xbb
    x"60",x"fe",x"e0",x"55",x"01",                   -- d5cf |   mov G, 0x155
    x"b6",x"e0",x"1c",x"fe",x"39",x"30",x"85",       -- d5d4 |   xor [0x3039], -123, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d0",x"fe",x"31",x"fa", -- d5db |   jne [0x3039], 0xfed0, ${fail}:rel + PC
    x"ae",x"3e",x"fe",x"21",x"f6",                   -- d5e5 |   and [A*4 + -10], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"54",x"01",x"22",x"fa", -- d5ea |   jne [0x29e], 0x154, ${fail}:rel + PC
    x"86",x"21",x"e4",x"3e",x"de",x"fa",x"f6",       -- d5f4 |   sub [A*2], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ea",x"f8",x"11",x"fa", -- d5fb |   jne [0x154], 0xf8ea, ${fail}:rel + PC
    x"a6",x"e0",x"20",x"21",x"39",x"30",             -- d605 |   ishr [0x3039], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"0a",x"01",x"fa", -- d60b |   jne [0x3039], 0xa, ${fail}:rel + PC
    x"aa",x"fe",x"2a",x"3e",x"f6",                   -- d614 |   shl [G], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"c0",x"f3",x"f9", -- d619 |   jne [0x155], 0xc000, ${fail}:rel + PC
    x"b2",x"fe",x"1c",x"fe",x"85",                   -- d623 |   or [G], -123, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"d5",x"e4",x"f9", -- d628 |   jne [0x155], 0xd5, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"20",x"85",                   -- d631 |   mul [A*4 + B], -123, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"52",x"ae",x"d6",x"f9", -- d636 |   jne [0x363], 0xae52, ${fail}:rel + PC
    x"a6",x"e0",x"e0",x"2a",x"39",x"30",x"39",x"30", -- d640 |   ishr [0x3039], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"07",x"06",x"c4",x"f9", -- d648 |   jne [0x3039], 0x607, ${fail}:rel + PC
    x"a2",x"21",x"e4",x"21",x"de",x"fa",             -- d652 |   shr [A*2], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b8",x"0f",x"b4",x"f9", -- d658 |   jne [0x154], 0xfb8, ${fail}:rel + PC
    x"82",x"21",x"fe",x"fe",                         -- d662 |   add [A*2], G, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"02",x"a6",x"f9", -- d666 |   jne [0x154], 0x2aa, ${fail}:rel + PC
    x"a6",x"fe",x"e4",x"20",x"de",x"fa",             -- d670 |   ishr [G], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"fe",x"96",x"f9", -- d676 |   jne [0x155], 0xfe, ${fail}:rel + PC
    x"82",x"e0",x"e4",x"2a",x"39",x"30",x"de",x"fa", -- d67f |   add [0x3039], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"eb",x"fe",x"85",x"f9", -- d687 |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
    x"a6",x"20",x"20",x"20",                         -- d691 |   ishr [A], A, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"77",x"f9", -- d695 |   jne [0xaa], 0, ${fail}:rel + PC
    x"82",x"fe",x"2a",x"20",                         -- d69d |   add [G], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0d",x"04",x"6b",x"f9", -- d6a1 |   jne [0x155], 0x40d, ${fail}:rel + PC
    x"b6",x"fe",x"fe",x"fe",                         -- d6ab |   xor [G], G, G
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"5d",x"f9", -- d6af |   jne [0x155], 0, ${fail}:rel + PC
    x"aa",x"21",x"fe",x"21",                         -- d6b7 |   shl [A*2], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"50",x"15",x"51",x"f9", -- d6bb |   jne [0x154], 0x1550, ${fail}:rel + PC
    x"a6",x"fe",x"e0",x"21",x"39",x"30",             -- d6c5 |   ishr [G], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"03",x"03",x"41",x"f9", -- d6cb |   jne [0x155], 0x303, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"e4",x"de",x"fa",             -- d6d5 |   and [A*2], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"03",x"31",x"f9", -- d6db |   jne [0x154], 0x300, ${fail}:rel + PC
    x"82",x"20",x"3e",x"3e",x"f6",x"f6",             -- d6e5 |   add [A], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"3c",x"05",x"21",x"f9", -- d6eb |   jne [0xaa], 0x53c, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"1c",x"39",x"30",x"85",       -- d6f5 |   or [0x3039], A*2, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"d5",x"10",x"f9", -- d6fc |   jne [0x3039], 0xd5, ${fail}:rel + PC
    x"82",x"e0",x"fe",x"fe",x"39",x"30",             -- d705 |   add [0x3039], G, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"02",x"01",x"f9", -- d70b |   jne [0x3039], 0x2aa, ${fail}:rel + PC
    x"ae",x"fe",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- d715 |   and [G], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"08",x"30",x"ef",x"f8", -- d71d |   jne [0x155], 0x3008, ${fail}:rel + PC
    x"8e",x"e0",x"2a",x"3e",x"39",x"30",x"f6",       -- d727 |   imul [0x3039], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"1a",x"dd",x"de",x"f8", -- d72e |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
    x"b2",x"21",x"e0",x"20",x"39",x"30",             -- d738 |   or [A*2], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"bb",x"30",x"ce",x"f8", -- d73e |   jne [0x154], 0x30bb, ${fail}:rel + PC
    x"8e",x"21",x"3e",x"21",x"f6",                   -- d748 |   imul [A*2], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"d8",x"79",x"bf",x"f8", -- d74d |   jne [0x154], 0x79d8, ${fail}:rel + PC
    x"82",x"3e",x"1c",x"2a",x"f6",x"85",             -- d757 |   add [A*4 + -10], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e8",x"02",x"af",x"f8", -- d75d |   jne [0x29e], 0x2e8, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"21",x"de",x"fa",             -- d767 |   sub [G], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"34",x"fa",x"9f",x"f8", -- d76d |   jne [0x155], 0xfa34, ${fail}:rel + PC
    x"b2",x"2a",x"e4",x"21",x"de",x"fa",             -- d777 |   or [A*4 + B], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"dc",x"fb",x"8f",x"f8", -- d77d |   jne [0x363], 0xfbdc, ${fail}:rel + PC
    x"ae",x"21",x"21",x"20",                         -- d787 |   and [A*2], A*2, A
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"81",x"f8", -- d78b |   jne [0x154], 0, ${fail}:rel + PC
    x"86",x"2a",x"2a",x"fe",                         -- d793 |   sub [A*4 + B], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"0e",x"02",x"75",x"f8", -- d797 |   jne [0x363], 0x20e, ${fail}:rel + PC
    x"82",x"3e",x"3e",x"20",x"f6",x"f6",             -- d7a1 |   add [A*4 + -10], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"48",x"03",x"65",x"f8", -- d7a7 |   jne [0x29e], 0x348, ${fail}:rel + PC
    x"86",x"21",x"e0",x"e0",x"39",x"30",x"39",x"30", -- d7b1 |   sub [A*2], 0x3039, 0x3039
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"53",x"f8", -- d7b9 |   jne [0x154], 0, ${fail}:rel + PC
    x"a2",x"20",x"1c",x"fe",x"85",                   -- d7c1 |   shr [A], -123, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"fc",x"07",x"46",x"f8", -- d7c6 |   jne [0xaa], 0x7fc, ${fail}:rel + PC
    x"aa",x"2a",x"1c",x"2a",x"85",                   -- d7d0 |   shl [A*4 + B], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"28",x"fc",x"37",x"f8", -- d7d5 |   jne [0x363], 0xfc28, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"20",                         -- d7df |   or [A*4 + B], A, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"aa",x"00",x"29",x"f8", -- d7e3 |   jne [0x363], 0xaa, ${fail}:rel + PC
    x"86",x"20",x"20",x"1c",x"85",                   -- d7ed |   sub [A], A, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"25",x"01",x"1a",x"f8", -- d7f2 |   jne [0xaa], 0x125, ${fail}:rel + PC
    x"a6",x"3e",x"e4",x"21",x"f6",x"de",x"fa",       -- d7fc |   ishr [A*4 + -10], 0xfade + A, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"b8",x"09",x"f8", -- d803 |   jne [0x29e], 0xb8, ${fail}:rel + PC
    x"86",x"20",x"e0",x"e0",x"39",x"30",x"39",x"30", -- d80c |   sub [A], 0x3039, 0x3039
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"f8",x"f7", -- d814 |   jne [0xaa], 0, ${fail}:rel + PC
    x"82",x"fe",x"e0",x"e0",x"39",x"30",x"39",x"30", -- d81c |   add [G], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"72",x"60",x"e8",x"f7", -- d824 |   jne [0x155], 0x6072, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- d82e |   shr [A*4 + B], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"fb",x"00",x"d6",x"f7", -- d836 |   jne [0x363], 0xfb, ${fail}:rel + PC
    x"8e",x"20",x"20",x"fe",                         -- d840 |   imul [A], A, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"72",x"e2",x"c8",x"f7", -- d844 |   jne [0xaa], 0xe272, ${fail}:rel + PC
    x"a2",x"21",x"e4",x"2a",x"de",x"fa",             -- d84e |   shr [A*2], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"71",x"1f",x"b8",x"f7", -- d854 |   jne [0x154], 0x1f71, ${fail}:rel + PC
    x"a2",x"2a",x"2a",x"1c",x"85",                   -- d85e |   shr [A*4 + B], A*4 + B, -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"1b",x"a9",x"f7", -- d863 |   jne [0x363], 0x1b, ${fail}:rel + PC
    x"a2",x"20",x"21",x"2a",                         -- d86c |   shr [A], A*2, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"2a",x"9c",x"f7", -- d870 |   jne [0xaa], 0x2a, ${fail}:rel + PC
    x"ae",x"e0",x"2a",x"20",x"39",x"30",             -- d879 |   and [0x3039], A*4 + B, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"22",x"8d",x"f7", -- d87f |   jne [0x3039], 0x22, ${fail}:rel + PC
    x"a2",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"39",x"30", -- d888 |   shr [0x3039], 0x3039, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"18",x"7a",x"f7", -- d892 |   jne [0x3039], 0x18, ${fail}:rel + PC
    x"8a",x"20",x"fe",x"3e",x"f6",                   -- d89b |   mul [A], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"76",x"7c",x"6c",x"f7", -- d8a0 |   jne [0xaa], 0x7c76, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"2a",x"39",x"30",             -- d8aa |   add [A*4 + B], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"9c",x"33",x"5c",x"f7", -- d8b0 |   jne [0x363], 0x339c, ${fail}:rel + PC
    x"8e",x"fe",x"3e",x"2a",x"f6",                   -- d8ba |   imul [G], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"1a",x"dd",x"4d",x"f7", -- d8bf |   jne [0x155], 0xdd1a, ${fail}:rel + PC
    x"aa",x"20",x"21",x"e0",x"39",x"30",             -- d8c9 |   shl [A], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"a8",x"3d",x"f7", -- d8cf |   jne [0xaa], 0xa800, ${fail}:rel + PC
    x"82",x"21",x"fe",x"20",                         -- d8d9 |   add [A*2], G, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"01",x"2f",x"f7", -- d8dd |   jne [0x154], 0x1ff, ${fail}:rel + PC
    x"82",x"2a",x"2a",x"21",                         -- d8e7 |   add [A*4 + B], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"b7",x"04",x"21",x"f7", -- d8eb |   jne [0x363], 0x4b7, ${fail}:rel + PC
    x"a2",x"20",x"fe",x"e4",x"de",x"fa",             -- d8f5 |   shr [A], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"01",x"11",x"f7", -- d8fb |   jne [0xaa], 0x1, ${fail}:rel + PC
    x"82",x"fe",x"1c",x"20",x"85",                   -- d904 |   add [G], -123, A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"2f",x"03",x"f7", -- d909 |   jne [0x155], 0x2f, ${fail}:rel + PC
    x"8e",x"3e",x"fe",x"e0",x"f6",x"39",x"30",       -- d912 |   imul [A*4 + -10], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ed",x"3b",x"f3",x"f6", -- d919 |   jne [0x29e], 0x3bed, ${fail}:rel + PC
    x"8a",x"fe",x"e4",x"2a",x"de",x"fa",             -- d923 |   mul [G], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"98",x"dd",x"e3",x"f6", -- d929 |   jne [0x155], 0xdd98, ${fail}:rel + PC
    x"a2",x"fe",x"fe",x"20",                         -- d933 |   shr [G], G, A
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"d5",x"f6", -- d937 |   jne [0x155], 0, ${fail}:rel + PC
    x"b2",x"21",x"20",x"20",                         -- d93f |   or [A*2], A, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"00",x"c9",x"f6", -- d943 |   jne [0x154], 0xaa, ${fail}:rel + PC
    x"b2",x"3e",x"1c",x"21",x"f6",x"85",             -- d94d |   or [A*4 + -10], -123, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"d5",x"b9",x"f6", -- d953 |   jne [0x29e], 0xd5, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"1c",x"85",x"85",             -- d95c |   mul [A*4 + B], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"19",x"3b",x"aa",x"f6", -- d962 |   jne [0x363], 0x3b19, ${fail}:rel + PC
    x"8a",x"e0",x"e4",x"21",x"39",x"30",x"de",x"fa", -- d96c |   mul [0x3039], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"a0",x"10",x"98",x"f6", -- d974 |   jne [0x3039], 0x10a0, ${fail}:rel + PC
    x"86",x"fe",x"20",x"3e",x"f6",                   -- d97e |   sub [G], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0c",x"fe",x"89",x"f6", -- d983 |   jne [0x155], 0xfe0c, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"21",                         -- d98d |   shl [A], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"30",x"36",x"7b",x"f6", -- d991 |   jne [0xaa], 0x3630, ${fail}:rel + PC
    x"b6",x"21",x"1c",x"2a",x"85",                   -- d99b |   xor [A*2], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"e6",x"fc",x"6c",x"f6", -- d9a0 |   jne [0x154], 0xfce6, ${fail}:rel + PC
    x"86",x"2a",x"3e",x"1c",x"f6",x"85",             -- d9aa |   sub [A*4 + B], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"19",x"03",x"5c",x"f6", -- d9b0 |   jne [0x363], 0x319, ${fail}:rel + PC
    x"86",x"e0",x"e0",x"e4",x"39",x"30",x"39",x"30",x"de",x"fa", -- d9ba |   sub [0x3039], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"b1",x"34",x"48",x"f6", -- d9c4 |   jne [0x3039], 0x34b1, ${fail}:rel + PC
    x"ae",x"fe",x"2a",x"e4",x"de",x"fa",             -- d9ce |   and [G], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"03",x"38",x"f6", -- d9d4 |   jne [0x155], 0x300, ${fail}:rel + PC
    x"aa",x"20",x"3e",x"fe",x"f6",                   -- d9de |   shl [A], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"c0",x"53",x"29",x"f6", -- d9e3 |   jne [0xaa], 0x53c0, ${fail}:rel + PC
    x"a6",x"fe",x"fe",x"e4",x"de",x"fa",             -- d9ed |   ishr [G], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"01",x"19",x"f6", -- d9f3 |   jne [0x155], 0x1, ${fail}:rel + PC
    x"ae",x"21",x"e0",x"2a",x"39",x"30",             -- d9fc |   and [A*2], 0x3039, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"21",x"0a",x"f6", -- da02 |   jne [0x154], 0x21, ${fail}:rel + PC
    x"a6",x"21",x"21",x"1c",x"85",                   -- da0b |   ishr [A*2], A*2, -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"0a",x"fc",x"f5", -- da10 |   jne [0x154], 0xa, ${fail}:rel + PC
    x"b6",x"fe",x"21",x"e0",x"39",x"30",             -- da19 |   xor [G], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"6d",x"31",x"ed",x"f5", -- da1f |   jne [0x155], 0x316d, ${fail}:rel + PC
    x"86",x"2a",x"3e",x"2a",x"f6",                   -- da29 |   sub [A*4 + B], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"3b",x"ff",x"de",x"f5", -- da2e |   jne [0x363], 0xff3b, ${fail}:rel + PC
    x"b2",x"e0",x"fe",x"1c",x"39",x"30",x"85",       -- da38 |   or [0x3039], G, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"d5",x"cd",x"f5", -- da3f |   jne [0x3039], 0xd5, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"20",x"f6",                   -- da48 |   shl [A*4 + B], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"78",x"bf",x"f5", -- da4d |   jne [0x363], 0x7800, ${fail}:rel + PC
    x"86",x"e0",x"21",x"20",x"39",x"30",             -- da57 |   sub [0x3039], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"00",x"af",x"f5", -- da5d |   jne [0x3039], 0xaa, ${fail}:rel + PC
    x"b6",x"e0",x"2a",x"21",x"39",x"30",             -- da67 |   xor [0x3039], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"37",x"02",x"9f",x"f5", -- da6d |   jne [0x3039], 0x237, ${fail}:rel + PC
    x"ae",x"2a",x"e0",x"1c",x"39",x"30",x"85",       -- da77 |   and [A*4 + B], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"01",x"30",x"8e",x"f5", -- da7e |   jne [0x363], 0x3001, ${fail}:rel + PC
    x"8e",x"fe",x"2a",x"e0",x"39",x"30",             -- da88 |   imul [G], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0b",x"51",x"7e",x"f5", -- da8e |   jne [0x155], 0x510b, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"fe",                         -- da98 |   or [A*4 + B], A, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ff",x"01",x"70",x"f5", -- da9c |   jne [0x363], 0x1ff, ${fail}:rel + PC
    x"a6",x"3e",x"e0",x"20",x"f6",x"39",x"30",       -- daa6 |   ishr [A*4 + -10], 0x3039, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"0c",x"5f",x"f5", -- daad |   jne [0x29e], 0xc, ${fail}:rel + PC
    x"aa",x"e0",x"e4",x"e4",x"39",x"30",x"de",x"fa",x"de",x"fa", -- dab6 |   shl [0x3039], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"88",x"4c",x"f5", -- dac0 |   jne [0x3039], 0x8800, ${fail}:rel + PC
    x"aa",x"20",x"e0",x"fe",x"39",x"30",             -- daca |   shl [A], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"20",x"07",x"3c",x"f5", -- dad0 |   jne [0xaa], 0x720, ${fail}:rel + PC
    x"b6",x"fe",x"3e",x"21",x"f6",                   -- dada |   xor [G], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"ca",x"03",x"2d",x"f5", -- dadf |   jne [0x155], 0x3ca, ${fail}:rel + PC
    x"b2",x"2a",x"fe",x"1c",x"85",                   -- dae9 |   or [A*4 + B], G, -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"d5",x"1e",x"f5", -- daee |   jne [0x363], 0xd5, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"e0",x"f6",x"85",x"39",x"30", -- daf7 |   sub [A*4 + -10], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"4c",x"cf",x"0d",x"f5", -- daff |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
    x"aa",x"21",x"21",x"21",                         -- db09 |   shl [A*2], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"40",x"15",x"ff",x"f4", -- db0d |   jne [0x154], 0x1540, ${fail}:rel + PC
    x"86",x"e0",x"e4",x"e0",x"39",x"30",x"de",x"fa",x"39",x"30", -- db17 |   sub [0x3039], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"4f",x"cb",x"eb",x"f4", -- db21 |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
    x"a2",x"21",x"e0",x"1c",x"39",x"30",x"85",       -- db2b |   shr [A*2], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"81",x"01",x"da",x"f4", -- db32 |   jne [0x154], 0x181, ${fail}:rel + PC
    x"a6",x"e0",x"e4",x"20",x"39",x"30",x"de",x"fa", -- db3c |   ishr [0x3039], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"fe",x"c8",x"f4", -- db44 |   jne [0x3039], 0xfe, ${fail}:rel + PC
    x"b6",x"3e",x"e4",x"e0",x"f6",x"de",x"fa",x"39",x"30", -- db4d |   xor [A*4 + -10], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b1",x"cb",x"b6",x"f4", -- db56 |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
    x"86",x"3e",x"21",x"3e",x"f6",x"f6",             -- db60 |   sub [A*4 + -10], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b6",x"fe",x"a6",x"f4", -- db66 |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
    x"8e",x"fe",x"1c",x"3e",x"85",x"f6",             -- db70 |   imul [G], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"16",x"be",x"96",x"f4", -- db76 |   jne [0x155], 0xbe16, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"2a",                         -- db80 |   shl [A], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"18",x"1b",x"88",x"f4", -- db84 |   jne [0xaa], 0x1b18, ${fail}:rel + PC
    x"b6",x"e0",x"21",x"2a",x"39",x"30",             -- db8e |   xor [0x3039], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"37",x"02",x"78",x"f4", -- db94 |   jne [0x3039], 0x237, ${fail}:rel + PC
    x"82",x"21",x"21",x"e0",x"39",x"30",             -- db9e |   add [A*2], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"8d",x"31",x"68",x"f4", -- dba4 |   jne [0x154], 0x318d, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"20",                         -- dbae |   and [A*2], A*4 + B, A
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"22",x"5a",x"f4", -- dbb2 |   jne [0x154], 0x22, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"e4",x"de",x"fa",             -- dbbb |   shl [A], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"63",x"4b",x"f4", -- dbc1 |   jne [0xaa], 0x6300, ${fail}:rel + PC
    x"ae",x"2a",x"fe",x"20",                         -- dbcb |   and [A*4 + B], G, A
    x"ee",x"e0",x"00",x"f8",x"63",x"03",x"3d",x"f4", -- dbcf |   jne [0x363], 0, ${fail}:rel + PC
    x"b6",x"fe",x"21",x"1c",x"85",                   -- dbd7 |   xor [G], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"d1",x"fe",x"30",x"f4", -- dbdc |   jne [0x155], 0xfed1, ${fail}:rel + PC
    x"ae",x"e0",x"fe",x"21",x"39",x"30",             -- dbe6 |   and [0x3039], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"20",x"f4", -- dbec |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"b2",x"3e",x"e0",x"2a",x"f6",x"39",x"30",       -- dbf6 |   or [A*4 + -10], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"7b",x"33",x"0f",x"f4", -- dbfd |   jne [0x29e], 0x337b, ${fail}:rel + PC
    x"b6",x"fe",x"e4",x"3e",x"de",x"fa",x"f6",       -- dc07 |   xor [G], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"16",x"f9",x"fe",x"f3", -- dc0e |   jne [0x155], 0xf916, ${fail}:rel + PC
    x"8e",x"2a",x"21",x"2a",                         -- dc18 |   imul [A*4 + B], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"7c",x"7f",x"f0",x"f3", -- dc1c |   jne [0x363], 0x7f7c, ${fail}:rel + PC
    x"a6",x"fe",x"21",x"fe",                         -- dc26 |   ishr [G], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"0a",x"e2",x"f3", -- dc2a |   jne [0x155], 0xa, ${fail}:rel + PC
    x"8a",x"21",x"1c",x"1c",x"85",x"85",             -- dc33 |   mul [A*2], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"19",x"3b",x"d3",x"f3", -- dc39 |   jne [0x154], 0x3b19, ${fail}:rel + PC
    x"8e",x"2a",x"e4",x"20",x"de",x"fa",             -- dc43 |   imul [A*4 + B], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"50",x"08",x"c3",x"f3", -- dc49 |   jne [0x363], 0x850, ${fail}:rel + PC
    x"a2",x"3e",x"3e",x"3e",x"f6",x"f6",x"f6",       -- dc53 |   shr [A*4 + -10], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"9e",x"02",x"b2",x"f3", -- dc5a |   jne [0x29e], 0, ${fail}:rel + PC
    x"8a",x"20",x"1c",x"e4",x"85",x"de",x"fa",       -- dc62 |   mul [A], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a8",x"25",x"a3",x"f3", -- dc69 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
    x"a6",x"3e",x"20",x"21",x"f6",                   -- dc73 |   ishr [A*4 + -10], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"0a",x"94",x"f3", -- dc78 |   jne [0x29e], 0xa, ${fail}:rel + PC
    x"b2",x"3e",x"20",x"20",x"f6",                   -- dc81 |   or [A*4 + -10], A, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"aa",x"00",x"86",x"f3", -- dc86 |   jne [0x29e], 0xaa, ${fail}:rel + PC
    x"82",x"e0",x"fe",x"e0",x"39",x"30",x"39",x"30", -- dc90 |   add [0x3039], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"8e",x"31",x"74",x"f3", -- dc98 |   jne [0x3039], 0x318e, ${fail}:rel + PC
    x"8e",x"3e",x"e0",x"3e",x"f6",x"39",x"30",x"f6", -- dca2 |   imul [A*4 + -10], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"2e",x"35",x"62",x"f3", -- dcaa |   jne [0x29e], 0x352e, ${fail}:rel + PC
    x"a6",x"fe",x"fe",x"21",                         -- dcb4 |   ishr [G], G, A*2
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"15",x"54",x"f3", -- dcb8 |   jne [0x155], 0x15, ${fail}:rel + PC
    x"8e",x"20",x"e4",x"3e",x"de",x"fa",x"f6",       -- dcc1 |   imul [A], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"f0",x"4d",x"44",x"f3", -- dcc8 |   jne [0xaa], 0x4df0, ${fail}:rel + PC
    x"a6",x"fe",x"20",x"fe",                         -- dcd2 |   ishr [G], A, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"05",x"36",x"f3", -- dcd6 |   jne [0x155], 0x5, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"3e",x"39",x"30",x"f6",       -- dcdf |   add [A*4 + B], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d7",x"32",x"26",x"f3", -- dce6 |   jne [0x363], 0x32d7, ${fail}:rel + PC
    x"ae",x"3e",x"2a",x"e4",x"f6",x"de",x"fa",       -- dcf0 |   and [A*4 + -10], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"03",x"15",x"f3", -- dcf7 |   jne [0x29e], 0x300, ${fail}:rel + PC
    x"8e",x"20",x"1c",x"2a",x"85",                   -- dd01 |   imul [A], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"6f",x"5f",x"06",x"f3", -- dd06 |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
    x"a2",x"fe",x"3e",x"e4",x"f6",x"de",x"fa",       -- dd10 |   shr [G], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"02",x"f5",x"f2", -- dd17 |   jne [0x155], 0x2, ${fail}:rel + PC
    x"b2",x"2a",x"e0",x"20",x"39",x"30",             -- dd20 |   or [A*4 + B], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"bb",x"30",x"e6",x"f2", -- dd26 |   jne [0x363], 0x30bb, ${fail}:rel + PC
    x"b6",x"2a",x"e0",x"fe",x"39",x"30",             -- dd30 |   xor [A*4 + B], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"6c",x"31",x"d6",x"f2", -- dd36 |   jne [0x363], 0x316c, ${fail}:rel + PC
    x"8e",x"20",x"20",x"e0",x"39",x"30",             -- dd40 |   imul [A], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"da",x"05",x"c6",x"f2", -- dd46 |   jne [0xaa], 0x5da, ${fail}:rel + PC
    x"b2",x"21",x"2a",x"3e",x"f6",                   -- dd50 |   or [A*2], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"03",x"b7",x"f2", -- dd55 |   jne [0x154], 0x3ff, ${fail}:rel + PC
    x"aa",x"fe",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- dd5f |   shl [G], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"10",x"a5",x"f2", -- dd67 |   jne [0x155], 0x1000, ${fail}:rel + PC
    x"a6",x"2a",x"e4",x"2a",x"de",x"fa",             -- dd71 |   ishr [A*4 + B], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"71",x"ff",x"95",x"f2", -- dd77 |   jne [0x363], 0xff71, ${fail}:rel + PC
    x"aa",x"3e",x"e4",x"1c",x"f6",x"de",x"fa",x"85", -- dd81 |   shl [A*4 + -10], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"71",x"83",x"f2", -- dd89 |   jne [0x29e], 0x7100, ${fail}:rel + PC
    x"a2",x"3e",x"e4",x"20",x"f6",x"de",x"fa",       -- dd93 |   shr [A*4 + -10], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"3e",x"72",x"f2", -- dd9a |   jne [0x29e], 0x3e, ${fail}:rel + PC
    x"8a",x"3e",x"20",x"2a",x"f6",                   -- dda3 |   mul [A*4 + -10], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"be",x"3f",x"64",x"f2", -- dda8 |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
    x"b2",x"21",x"3e",x"2a",x"f6",                   -- ddb2 |   or [A*2], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"03",x"55",x"f2", -- ddb7 |   jne [0x154], 0x3ff, ${fail}:rel + PC
    x"8e",x"3e",x"21",x"1c",x"f6",x"85",             -- ddc1 |   imul [A*4 + -10], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"a4",x"5c",x"45",x"f2", -- ddc7 |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
    x"aa",x"e0",x"3e",x"21",x"39",x"30",x"f6",       -- ddd1 |   shl [0x3039], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"e0",x"29",x"34",x"f2", -- ddd8 |   jne [0x3039], 0x29e0, ${fail}:rel + PC
    x"aa",x"21",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- dde2 |   shl [A*2], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"88",x"22",x"f2", -- ddea |   jne [0x154], 0x8800, ${fail}:rel + PC
    x"82",x"fe",x"21",x"21",                         -- ddf4 |   add [G], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"a8",x"02",x"14",x"f2", -- ddf8 |   jne [0x155], 0x2a8, ${fail}:rel + PC
    x"ae",x"21",x"e4",x"fe",x"de",x"fa",             -- de02 |   and [A*2], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"01",x"04",x"f2", -- de08 |   jne [0x154], 0x100, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"e0",x"f6",x"39",x"30",x"39",x"30", -- de12 |   and [A*4 + -10], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"39",x"30",x"f1",x"f1", -- de1b |   jne [0x29e], 0x3039, ${fail}:rel + PC
    x"aa",x"3e",x"20",x"1c",x"f6",x"85",             -- de25 |   shl [A*4 + -10], A, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"40",x"15",x"e1",x"f1", -- de2b |   jne [0x29e], 0x1540, ${fail}:rel + PC
    x"ae",x"2a",x"3e",x"e4",x"f6",x"de",x"fa",       -- de35 |   and [A*4 + B], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"88",x"02",x"d0",x"f1", -- de3c |   jne [0x363], 0x288, ${fail}:rel + PC
    x"82",x"fe",x"1c",x"1c",x"85",x"85",             -- de46 |   add [G], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0a",x"ff",x"c0",x"f1", -- de4c |   jne [0x155], 0xff0a, ${fail}:rel + PC
    x"8a",x"20",x"20",x"e4",x"de",x"fa",             -- de56 |   mul [A], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"50",x"08",x"b0",x"f1", -- de5c |   jne [0xaa], 0x850, ${fail}:rel + PC
    x"b2",x"21",x"2a",x"fe",                         -- de66 |   or [A*2], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"77",x"03",x"a2",x"f1", -- de6a |   jne [0x154], 0x377, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- de74 |   sub [G], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"90",x"f1", -- de7c |   jne [0x155], 0, ${fail}:rel + PC
    x"a2",x"2a",x"fe",x"e4",x"de",x"fa",             -- de84 |   shr [A*4 + B], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"82",x"f1", -- de8a |   jne [0x363], 0x1, ${fail}:rel + PC
    x"86",x"21",x"1c",x"fe",x"85",                   -- de93 |   sub [A*2], -123, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"30",x"fe",x"74",x"f1", -- de98 |   jne [0x154], 0xfe30, ${fail}:rel + PC
    x"aa",x"3e",x"21",x"fe",x"f6",                   -- dea2 |   shl [A*4 + -10], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"80",x"2a",x"65",x"f1", -- dea7 |   jne [0x29e], 0x2a80, ${fail}:rel + PC
    x"aa",x"20",x"1c",x"3e",x"85",x"f6",             -- deb1 |   shl [A], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"40",x"55",x"f1", -- deb7 |   jne [0xaa], 0x4000, ${fail}:rel + PC
    x"8a",x"3e",x"2a",x"21",x"f6",                   -- dec1 |   mul [A*4 + -10], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"7c",x"7f",x"46",x"f1", -- dec6 |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
    x"a2",x"20",x"2a",x"fe",                         -- ded0 |   shr [A], A*4 + B, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"1b",x"38",x"f1", -- ded4 |   jne [0xaa], 0x1b, ${fail}:rel + PC
    x"82",x"20",x"2a",x"e0",x"39",x"30",             -- dedd |   add [A], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9c",x"33",x"29",x"f1", -- dee3 |   jne [0xaa], 0x339c, ${fail}:rel + PC
    x"b6",x"fe",x"e0",x"1c",x"39",x"30",x"85",       -- deed |   xor [G], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"bc",x"cf",x"18",x"f1", -- def4 |   jne [0x155], 0xcfbc, ${fail}:rel + PC
    x"86",x"20",x"e4",x"2a",x"de",x"fa",             -- defe |   sub [A], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"25",x"f8",x"08",x"f1", -- df04 |   jne [0xaa], 0xf825, ${fail}:rel + PC
    x"a6",x"2a",x"21",x"fe",                         -- df0e |   ishr [A*4 + B], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"0a",x"fa",x"f0", -- df12 |   jne [0x363], 0xa, ${fail}:rel + PC
    x"b2",x"21",x"fe",x"e4",x"de",x"fa",             -- df1b |   or [A*2], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"dd",x"fb",x"eb",x"f0", -- df21 |   jne [0x154], 0xfbdd, ${fail}:rel + PC
    x"8a",x"e0",x"e4",x"fe",x"39",x"30",x"de",x"fa", -- df2b |   mul [0x3039], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"28",x"0c",x"d9",x"f0", -- df33 |   jne [0x3039], 0xc28, ${fail}:rel + PC
    x"8e",x"2a",x"2a",x"e4",x"de",x"fa",             -- df3d |   imul [A*4 + B], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"98",x"dd",x"c9",x"f0", -- df43 |   jne [0x363], 0xdd98, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"fe",x"39",x"30",             -- df4d |   and [0x3039], A, G
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"b9",x"f0", -- df53 |   jne [0x3039], 0, ${fail}:rel + PC
    x"8e",x"fe",x"fe",x"2a",                         -- df5b |   imul [G], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"df",x"82",x"ad",x"f0", -- df5f |   jne [0x155], 0x82df, ${fail}:rel + PC
    x"8e",x"3e",x"21",x"21",x"f6",                   -- df69 |   imul [A*4 + -10], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"90",x"c3",x"9e",x"f0", -- df6e |   jne [0x29e], 0xc390, ${fail}:rel + PC
    x"b2",x"fe",x"e4",x"1c",x"de",x"fa",x"85",       -- df78 |   or [G], 0xfade + A, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"8d",x"8d",x"f0", -- df7f |   jne [0x155], 0x8d, ${fail}:rel + PC
    x"8e",x"2a",x"20",x"3e",x"f6",                   -- df88 |   imul [A*4 + B], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ec",x"bc",x"7f",x"f0", -- df8d |   jne [0x363], 0xbcec, ${fail}:rel + PC
    x"a2",x"2a",x"3e",x"e0",x"f6",x"39",x"30",       -- df97 |   shr [A*4 + B], A*4 + -10, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"6e",x"f0", -- df9e |   jne [0x363], 0x1, ${fail}:rel + PC
    x"b6",x"2a",x"21",x"e0",x"39",x"30",             -- dfa7 |   xor [A*4 + B], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"6d",x"31",x"5f",x"f0", -- dfad |   jne [0x363], 0x316d, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"e0",x"39",x"30",x"f6",x"39",x"30", -- dfb7 |   shr [0x3039], A*4 + -10, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"01",x"4c",x"f0", -- dfc0 |   jne [0x3039], 0x1, ${fail}:rel + PC
    x"a2",x"21",x"1c",x"3e",x"85",x"f6",             -- dfc9 |   shr [A*2], -123, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"03",x"3d",x"f0", -- dfcf |   jne [0x154], 0x3, ${fail}:rel + PC
    x"b2",x"21",x"20",x"21",                         -- dfd8 |   or [A*2], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"fe",x"01",x"30",x"f0", -- dfdc |   jne [0x154], 0x1fe, ${fail}:rel + PC
    x"a2",x"fe",x"2a",x"21",                         -- dfe6 |   shr [G], A*4 + B, A*2
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"36",x"22",x"f0", -- dfea |   jne [0x155], 0x36, ${fail}:rel + PC
    x"b6",x"e0",x"3e",x"2a",x"39",x"30",x"f6",       -- dff3 |   xor [0x3039], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"fd",x"01",x"12",x"f0", -- dffa |   jne [0x3039], 0x1fd, ${fail}:rel + PC
    x"8a",x"3e",x"e4",x"3e",x"f6",x"de",x"fa",x"f6", -- e004 |   mul [A*4 + -10], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"f0",x"4d",x"00",x"f0", -- e00c |   jne [0x29e], 0x4df0, ${fail}:rel + PC
    x"8e",x"2a",x"21",x"3e",x"f6",                   -- e016 |   imul [A*4 + B], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d8",x"79",x"f1",x"ef", -- e01b |   jne [0x363], 0x79d8, ${fail}:rel + PC
    x"a2",x"e0",x"e4",x"3e",x"39",x"30",x"de",x"fa",x"f6", -- e025 |   shr [0x3039], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"03",x"de",x"ef", -- e02e |   jne [0x3039], 0x3, ${fail}:rel + PC
    x"82",x"3e",x"20",x"fe",x"f6",                   -- e037 |   add [A*4 + -10], A, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ff",x"01",x"d0",x"ef", -- e03c |   jne [0x29e], 0x1ff, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- e046 |   shr [A*4 + B], 0xfade + A, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"7d",x"be",x"ef", -- e04e |   jne [0x363], 0x7d, ${fail}:rel + PC
    x"a2",x"3e",x"1c",x"1c",x"f6",x"85",x"85",       -- e057 |   shr [A*4 + -10], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"fc",x"07",x"ae",x"ef", -- e05e |   jne [0x29e], 0x7fc, ${fail}:rel + PC
    x"8e",x"20",x"1c",x"e0",x"85",x"39",x"30",       -- e068 |   imul [A], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9d",x"d4",x"9d",x"ef", -- e06f |   jne [0xaa], 0xd49d, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"21",x"f6",                   -- e079 |   shl [A*4 + B], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"e0",x"29",x"8e",x"ef", -- e07e |   jne [0x363], 0x29e0, ${fail}:rel + PC
    x"b6",x"21",x"e0",x"fe",x"39",x"30",             -- e088 |   xor [A*2], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"6c",x"31",x"7e",x"ef", -- e08e |   jne [0x154], 0x316c, ${fail}:rel + PC
    x"b6",x"e0",x"3e",x"3e",x"39",x"30",x"f6",x"f6", -- e098 |   xor [0x3039], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"6c",x"ef", -- e0a0 |   jne [0x3039], 0, ${fail}:rel + PC
    x"b6",x"20",x"21",x"1c",x"85",                   -- e0a8 |   xor [A], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d1",x"fe",x"5f",x"ef", -- e0ad |   jne [0xaa], 0xfed1, ${fail}:rel + PC
    x"b6",x"21",x"21",x"fe",                         -- e0b7 |   xor [A*2], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"01",x"51",x"ef", -- e0bb |   jne [0x154], 0x1, ${fail}:rel + PC
    x"8a",x"fe",x"e0",x"20",x"39",x"30",             -- e0c4 |   mul [G], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"da",x"05",x"42",x"ef", -- e0ca |   jne [0x155], 0x5da, ${fail}:rel + PC
    x"b6",x"21",x"e0",x"21",x"39",x"30",             -- e0d4 |   xor [A*2], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"6d",x"31",x"32",x"ef", -- e0da |   jne [0x154], 0x316d, ${fail}:rel + PC
    x"8a",x"21",x"2a",x"e0",x"39",x"30",             -- e0e4 |   mul [A*2], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"0b",x"51",x"22",x"ef", -- e0ea |   jne [0x154], 0x510b, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"1c",x"f6",x"39",x"30",x"85", -- e0f4 |   and [A*4 + -10], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"01",x"30",x"10",x"ef", -- e0fc |   jne [0x29e], 0x3001, ${fail}:rel + PC
    x"aa",x"fe",x"21",x"20",                         -- e106 |   shl [G], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"50",x"02",x"ef", -- e10a |   jne [0x155], 0x5000, ${fail}:rel + PC
    x"ae",x"20",x"e4",x"20",x"de",x"fa",             -- e114 |   and [A], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"88",x"00",x"f2",x"ee", -- e11a |   jne [0xaa], 0x88, ${fail}:rel + PC
    x"aa",x"21",x"3e",x"e4",x"f6",x"de",x"fa",       -- e124 |   shl [A*2], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"9e",x"e1",x"ee", -- e12b |   jne [0x154], 0x9e00, ${fail}:rel + PC
    x"b6",x"e0",x"e0",x"1c",x"39",x"30",x"39",x"30",x"85", -- e135 |   xor [0x3039], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"bc",x"cf",x"ce",x"ee", -- e13e |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
    x"8a",x"3e",x"3e",x"1c",x"f6",x"f6",x"85",       -- e148 |   mul [A*4 + -10], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"16",x"be",x"bd",x"ee", -- e14f |   jne [0x29e], 0xbe16, ${fail}:rel + PC
    x"86",x"fe",x"21",x"3e",x"f6",                   -- e159 |   sub [G], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"b6",x"fe",x"ae",x"ee", -- e15e |   jne [0x155], 0xfeb6, ${fail}:rel + PC
    x"86",x"3e",x"2a",x"fe",x"f6",                   -- e168 |   sub [A*4 + -10], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"0e",x"02",x"9f",x"ee", -- e16d |   jne [0x29e], 0x20e, ${fail}:rel + PC
    x"b6",x"3e",x"1c",x"fe",x"f6",x"85",             -- e177 |   xor [A*4 + -10], -123, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"d0",x"fe",x"8f",x"ee", -- e17d |   jne [0x29e], 0xfed0, ${fail}:rel + PC
    x"86",x"20",x"2a",x"1c",x"85",                   -- e187 |   sub [A], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"de",x"03",x"80",x"ee", -- e18c |   jne [0xaa], 0x3de, ${fail}:rel + PC
    x"86",x"20",x"21",x"fe",                         -- e196 |   sub [A], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"ff",x"72",x"ee", -- e19a |   jne [0xaa], 0xff, ${fail}:rel + PC
    x"86",x"2a",x"20",x"e4",x"de",x"fa",             -- e1a3 |   sub [A*4 + B], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"22",x"05",x"63",x"ee", -- e1a9 |   jne [0x363], 0x522, ${fail}:rel + PC
    x"aa",x"e0",x"fe",x"3e",x"39",x"30",x"f6",       -- e1b3 |   shl [0x3039], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"40",x"52",x"ee", -- e1ba |   jne [0x3039], 0x4000, ${fail}:rel + PC
    x"ae",x"20",x"1c",x"1c",x"85",x"85",             -- e1c4 |   and [A], -123, -123
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"85",x"42",x"ee", -- e1ca |   jne [0xaa], 0x85, ${fail}:rel + PC
    x"b6",x"20",x"fe",x"e0",x"39",x"30",             -- e1d3 |   xor [A], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"6c",x"31",x"33",x"ee", -- e1d9 |   jne [0xaa], 0x316c, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"3e",x"39",x"30",x"f6",       -- e1e3 |   or [0x3039], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"de",x"03",x"22",x"ee", -- e1ea |   jne [0x3039], 0x3de, ${fail}:rel + PC
    x"b2",x"20",x"e4",x"21",x"de",x"fa",             -- e1f4 |   or [A], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"fb",x"12",x"ee", -- e1fa |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
    x"b6",x"fe",x"3e",x"3e",x"f6",x"f6",             -- e204 |   xor [G], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"02",x"ee", -- e20a |   jne [0x155], 0, ${fail}:rel + PC
    x"b6",x"3e",x"20",x"e4",x"f6",x"de",x"fa",       -- e212 |   xor [A*4 + -10], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"22",x"fb",x"f3",x"ed", -- e219 |   jne [0x29e], 0xfb22, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"e0",x"39",x"30",x"85",x"39",x"30", -- e223 |   xor [0x3039], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"bc",x"cf",x"e0",x"ed", -- e22c |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
    x"a2",x"3e",x"fe",x"2a",x"f6",                   -- e236 |   shr [A*4 + -10], G, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"2a",x"d1",x"ed", -- e23b |   jne [0x29e], 0x2a, ${fail}:rel + PC
    x"ae",x"20",x"fe",x"20",                         -- e244 |   and [A], G, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"c4",x"ed", -- e248 |   jne [0xaa], 0, ${fail}:rel + PC
    x"86",x"2a",x"e4",x"1c",x"de",x"fa",x"85",       -- e250 |   sub [A*4 + B], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"03",x"fc",x"b5",x"ed", -- e257 |   jne [0x363], 0xfc03, ${fail}:rel + PC
    x"ae",x"e0",x"21",x"21",x"39",x"30",             -- e261 |   and [0x3039], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"a5",x"ed", -- e267 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"a2",x"e0",x"20",x"e0",x"39",x"30",x"39",x"30", -- e271 |   shr [0x3039], A, 0x3039
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"93",x"ed", -- e279 |   jne [0x3039], 0, ${fail}:rel + PC
    x"8e",x"3e",x"2a",x"3e",x"f6",x"f6",             -- e281 |   imul [A*4 + -10], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"1a",x"dd",x"85",x"ed", -- e287 |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"1c",x"39",x"30",x"f6",x"85", -- e291 |   shr [0x3039], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"14",x"73",x"ed", -- e299 |   jne [0x3039], 0x14, ${fail}:rel + PC
    x"82",x"fe",x"20",x"e0",x"39",x"30",             -- e2a2 |   add [G], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"e3",x"30",x"64",x"ed", -- e2a8 |   jne [0x155], 0x30e3, ${fail}:rel + PC
    x"a6",x"e0",x"21",x"e0",x"39",x"30",x"39",x"30", -- e2b2 |   ishr [0x3039], A*2, 0x3039
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"52",x"ed", -- e2ba |   jne [0x3039], 0, ${fail}:rel + PC
    x"a6",x"e0",x"e4",x"1c",x"39",x"30",x"de",x"fa",x"85", -- e2c2 |   ishr [0x3039], 0xfade + A, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"dc",x"41",x"ed", -- e2cb |   jne [0x3039], 0xdc, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"20",x"f6",                   -- e2d4 |   or [A*4 + -10], G, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ff",x"01",x"33",x"ed", -- e2d9 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
    x"a6",x"2a",x"2a",x"20",                         -- e2e3 |   ishr [A*4 + B], A*4 + B, A
    x"ee",x"e0",x"00",x"f8",x"63",x"03",x"25",x"ed", -- e2e7 |   jne [0x363], 0, ${fail}:rel + PC
    x"aa",x"fe",x"e0",x"2a",x"39",x"30",             -- e2ef |   shl [G], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"c8",x"81",x"17",x"ed", -- e2f5 |   jne [0x155], 0x81c8, ${fail}:rel + PC
    x"8a",x"21",x"3e",x"20",x"f6",                   -- e2ff |   mul [A*2], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ec",x"bc",x"08",x"ed", -- e304 |   jne [0x154], 0xbcec, ${fail}:rel + PC
    x"8e",x"3e",x"3e",x"e0",x"f6",x"f6",x"39",x"30", -- e30e |   imul [A*4 + -10], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"2e",x"35",x"f6",x"ec", -- e316 |   jne [0x29e], 0x352e, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"3e",x"39",x"30",x"85",x"f6", -- e320 |   xor [0x3039], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"1b",x"fd",x"e4",x"ec", -- e328 |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"e4",x"de",x"fa",             -- e332 |   or [G], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"fb",x"d4",x"ec", -- e338 |   jne [0x155], 0xfbaa, ${fail}:rel + PC
    x"8e",x"fe",x"fe",x"3e",x"f6",                   -- e342 |   imul [G], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"76",x"7c",x"c5",x"ec", -- e347 |   jne [0x155], 0x7c76, ${fail}:rel + PC
    x"8a",x"20",x"e0",x"3e",x"39",x"30",x"f6",       -- e351 |   mul [A], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"2e",x"35",x"b4",x"ec", -- e358 |   jne [0xaa], 0x352e, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"20",                         -- e362 |   or [G], A, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"00",x"a6",x"ec", -- e366 |   jne [0x155], 0xaa, ${fail}:rel + PC
    x"a2",x"3e",x"21",x"e4",x"f6",x"de",x"fa",       -- e370 |   shr [A*4 + -10], A*2, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"01",x"95",x"ec", -- e377 |   jne [0x29e], 0x1, ${fail}:rel + PC
    x"a6",x"20",x"3e",x"2a",x"f6",                   -- e380 |   ishr [A], A*4 + -10, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"53",x"87",x"ec", -- e385 |   jne [0xaa], 0x53, ${fail}:rel + PC
    x"82",x"20",x"e0",x"20",x"39",x"30",             -- e38e |   add [A], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"e3",x"30",x"78",x"ec", -- e394 |   jne [0xaa], 0x30e3, ${fail}:rel + PC
    x"a6",x"20",x"1c",x"20",x"85",                   -- e39e |   ishr [A], -123, A
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"ff",x"69",x"ec", -- e3a3 |   jne [0xaa], 0xff, ${fail}:rel + PC
    x"ae",x"21",x"20",x"1c",x"85",                   -- e3ac |   and [A*2], A, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"80",x"00",x"5b",x"ec", -- e3b1 |   jne [0x154], 0x80, ${fail}:rel + PC
    x"b6",x"2a",x"1c",x"e4",x"85",x"de",x"fa",       -- e3bb |   xor [A*4 + B], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"0d",x"04",x"4a",x"ec", -- e3c2 |   jne [0x363], 0x40d, ${fail}:rel + PC
    x"82",x"20",x"e0",x"21",x"39",x"30",             -- e3cc |   add [A], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"8d",x"31",x"3a",x"ec", -- e3d2 |   jne [0xaa], 0x318d, ${fail}:rel + PC
    x"82",x"21",x"fe",x"2a",                         -- e3dc |   add [A*2], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b8",x"04",x"2c",x"ec", -- e3e0 |   jne [0x154], 0x4b8, ${fail}:rel + PC
    x"b2",x"20",x"2a",x"20",                         -- e3ea |   or [A], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"eb",x"03",x"1e",x"ec", -- e3ee |   jne [0xaa], 0x3eb, ${fail}:rel + PC
    x"82",x"21",x"1c",x"e0",x"85",x"39",x"30",       -- e3f8 |   add [A*2], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"be",x"2f",x"0d",x"ec", -- e3ff |   jne [0x154], 0x2fbe, ${fail}:rel + PC
    x"aa",x"fe",x"2a",x"1c",x"85",                   -- e409 |   shl [G], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"60",x"6c",x"fe",x"eb", -- e40e |   jne [0x155], 0x6c60, ${fail}:rel + PC
    x"82",x"3e",x"3e",x"2a",x"f6",x"f6",             -- e418 |   add [A*4 + -10], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"01",x"06",x"ee",x"eb", -- e41e |   jne [0x29e], 0x601, ${fail}:rel + PC
    x"b2",x"20",x"3e",x"e4",x"f6",x"de",x"fa",       -- e428 |   or [A], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9e",x"fb",x"dd",x"eb", -- e42f |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
    x"aa",x"2a",x"21",x"1c",x"85",                   -- e439 |   shl [A*4 + B], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"80",x"2a",x"ce",x"eb", -- e43e |   jne [0x363], 0x2a80, ${fail}:rel + PC
    x"b2",x"e0",x"1c",x"2a",x"39",x"30",x"85",       -- e448 |   or [0x3039], -123, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"e7",x"bd",x"eb", -- e44f |   jne [0x3039], 0xe7, ${fail}:rel + PC
    x"82",x"21",x"2a",x"2a",                         -- e458 |   add [A*2], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"c6",x"06",x"b0",x"eb", -- e45c |   jne [0x154], 0x6c6, ${fail}:rel + PC
    x"ae",x"20",x"21",x"20",                         -- e466 |   and [A], A*2, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"a2",x"eb", -- e46a |   jne [0xaa], 0, ${fail}:rel + PC
    x"86",x"20",x"fe",x"1c",x"85",                   -- e472 |   sub [A], G, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d0",x"01",x"95",x"eb", -- e477 |   jne [0xaa], 0x1d0, ${fail}:rel + PC
    x"b2",x"20",x"2a",x"3e",x"f6",                   -- e481 |   or [A], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ff",x"03",x"86",x"eb", -- e486 |   jne [0xaa], 0x3ff, ${fail}:rel + PC
    x"b6",x"2a",x"20",x"2a",                         -- e490 |   xor [A*4 + B], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"c9",x"03",x"78",x"eb", -- e494 |   jne [0x363], 0x3c9, ${fail}:rel + PC
    x"aa",x"21",x"fe",x"3e",x"f6",                   -- e49e |   shl [A*2], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"40",x"69",x"eb", -- e4a3 |   jne [0x154], 0x4000, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"21",x"f6",x"39",x"30",       -- e4ad |   and [A*4 + -10], 0x3039, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"10",x"58",x"eb", -- e4b4 |   jne [0x29e], 0x10, ${fail}:rel + PC
    x"a2",x"e0",x"2a",x"e4",x"39",x"30",x"de",x"fa", -- e4bd |   shr [0x3039], A*4 + B, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"03",x"47",x"eb", -- e4c5 |   jne [0x3039], 0x3, ${fail}:rel + PC
    x"8a",x"fe",x"21",x"2a",                         -- e4ce |   mul [G], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"7c",x"7f",x"3a",x"eb", -- e4d2 |   jne [0x155], 0x7f7c, ${fail}:rel + PC
    x"a2",x"3e",x"3e",x"fe",x"f6",x"f6",             -- e4dc |   shr [A*4 + -10], A*4 + -10, G
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"14",x"2a",x"eb", -- e4e2 |   jne [0x29e], 0x14, ${fail}:rel + PC
    x"8a",x"20",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- e4eb |   mul [A], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"48",x"81",x"19",x"eb", -- e4f3 |   jne [0xaa], 0x8148, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"3e",x"85",x"f6",             -- e4fd |   mul [A*4 + B], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"16",x"be",x"09",x"eb", -- e503 |   jne [0x363], 0xbe16, ${fail}:rel + PC
    x"ae",x"2a",x"1c",x"fe",x"85",                   -- e50d |   and [A*4 + B], -123, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"05",x"01",x"fa",x"ea", -- e512 |   jne [0x363], 0x105, ${fail}:rel + PC
    x"aa",x"e0",x"e0",x"20",x"39",x"30",x"39",x"30", -- e51c |   shl [0x3039], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"e4",x"e8",x"ea", -- e524 |   jne [0x3039], 0xe400, ${fail}:rel + PC
    x"8e",x"20",x"fe",x"2a",                         -- e52e |   imul [A], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"df",x"82",x"da",x"ea", -- e532 |   jne [0xaa], 0x82df, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"3e",x"f6",x"85",x"f6",       -- e53c |   sub [A*4 + -10], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e7",x"fc",x"c9",x"ea", -- e543 |   jne [0x29e], 0xfce7, ${fail}:rel + PC
    x"aa",x"21",x"20",x"2a",                         -- e54d |   shl [A*2], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"50",x"05",x"bb",x"ea", -- e551 |   jne [0x154], 0x550, ${fail}:rel + PC
    x"82",x"20",x"3e",x"21",x"f6",                   -- e55b |   add [A], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"f2",x"03",x"ac",x"ea", -- e560 |   jne [0xaa], 0x3f2, ${fail}:rel + PC
    x"8a",x"21",x"fe",x"1c",x"85",                   -- e56a |   mul [A*2], G, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"29",x"5c",x"9d",x"ea", -- e56f |   jne [0x154], 0x5c29, ${fail}:rel + PC
    x"8a",x"fe",x"1c",x"e0",x"85",x"39",x"30",       -- e579 |   mul [G], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"9d",x"d4",x"8c",x"ea", -- e580 |   jne [0x155], 0xd49d, ${fail}:rel + PC
    x"a6",x"e0",x"2a",x"2a",x"39",x"30",             -- e58a |   ishr [0x3039], A*4 + B, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"6c",x"7c",x"ea", -- e590 |   jne [0x3039], 0x6c, ${fail}:rel + PC
    x"82",x"2a",x"1c",x"21",x"85",                   -- e599 |   add [A*4 + B], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d9",x"00",x"6e",x"ea", -- e59e |   jne [0x363], 0xd9, ${fail}:rel + PC
    x"8a",x"e0",x"e0",x"fe",x"39",x"30",x"39",x"30", -- e5a8 |   mul [0x3039], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"ed",x"3b",x"5c",x"ea", -- e5b0 |   jne [0x3039], 0x3bed, ${fail}:rel + PC
    x"b2",x"e0",x"2a",x"fe",x"39",x"30",             -- e5ba |   or [0x3039], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"77",x"03",x"4c",x"ea", -- e5c0 |   jne [0x3039], 0x377, ${fail}:rel + PC
    x"aa",x"2a",x"1c",x"e0",x"85",x"39",x"30",       -- e5ca |   shl [A*4 + B], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"0a",x"3b",x"ea", -- e5d1 |   jne [0x363], 0xa00, ${fail}:rel + PC
    x"8a",x"fe",x"1c",x"2a",x"85",                   -- e5db |   mul [G], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"6f",x"5f",x"2c",x"ea", -- e5e0 |   jne [0x155], 0x5f6f, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"fe",x"f6",x"39",x"30",       -- e5ea |   and [A*4 + -10], 0x3039, G
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"11",x"1b",x"ea", -- e5f1 |   jne [0x29e], 0x11, ${fail}:rel + PC
    x"a6",x"2a",x"21",x"e4",x"de",x"fa",             -- e5fa |   ishr [A*4 + B], A*2, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"0c",x"ea", -- e600 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"b2",x"21",x"21",x"2a",                         -- e609 |   or [A*2], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"77",x"03",x"ff",x"e9", -- e60d |   jne [0x154], 0x377, ${fail}:rel + PC
    x"ae",x"2a",x"fe",x"fe",                         -- e617 |   and [A*4 + B], G, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"55",x"01",x"f1",x"e9", -- e61b |   jne [0x363], 0x155, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"3e",x"f6",x"f6",             -- e625 |   shl [A*4 + B], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"80",x"e1",x"e9", -- e62b |   jne [0x363], 0x8000, ${fail}:rel + PC
    x"86",x"3e",x"2a",x"1c",x"f6",x"85",             -- e635 |   sub [A*4 + -10], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"de",x"03",x"d1",x"e9", -- e63b |   jne [0x29e], 0x3de, ${fail}:rel + PC
    x"ae",x"fe",x"fe",x"1c",x"85",                   -- e645 |   and [G], G, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"05",x"01",x"c2",x"e9", -- e64a |   jne [0x155], 0x105, ${fail}:rel + PC
    x"a6",x"21",x"3e",x"1c",x"f6",x"85",             -- e654 |   ishr [A*2], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"14",x"b2",x"e9", -- e65a |   jne [0x154], 0x14, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"fe",x"39",x"30",             -- e663 |   or [0x3039], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"55",x"01",x"a3",x"e9", -- e669 |   jne [0x3039], 0x155, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"21",                         -- e673 |   or [A*4 + B], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"fe",x"01",x"95",x"e9", -- e677 |   jne [0x363], 0x1fe, ${fail}:rel + PC
    x"a2",x"21",x"20",x"e0",x"39",x"30",             -- e681 |   shr [A*2], A, 0x3039
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"85",x"e9", -- e687 |   jne [0x154], 0, ${fail}:rel + PC
    x"8e",x"3e",x"3e",x"e4",x"f6",x"f6",x"de",x"fa", -- e68f |   imul [A*4 + -10], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"f0",x"4d",x"75",x"e9", -- e697 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
    x"a2",x"2a",x"3e",x"fe",x"f6",                   -- e6a1 |   shr [A*4 + B], A*4 + -10, G
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"14",x"66",x"e9", -- e6a6 |   jne [0x363], 0x14, ${fail}:rel + PC
    x"aa",x"e0",x"2a",x"1c",x"39",x"30",x"85",       -- e6af |   shl [0x3039], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"60",x"6c",x"56",x"e9", -- e6b6 |   jne [0x3039], 0x6c60, ${fail}:rel + PC
    x"86",x"e0",x"3e",x"20",x"39",x"30",x"f6",       -- e6c0 |   sub [0x3039], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"f4",x"01",x"45",x"e9", -- e6c7 |   jne [0x3039], 0x1f4, ${fail}:rel + PC
    x"86",x"fe",x"3e",x"fe",x"f6",                   -- e6d1 |   sub [G], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"49",x"01",x"36",x"e9", -- e6d6 |   jne [0x155], 0x149, ${fail}:rel + PC
    x"b6",x"20",x"20",x"2a",                         -- e6e0 |   xor [A], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"c9",x"03",x"28",x"e9", -- e6e4 |   jne [0xaa], 0x3c9, ${fail}:rel + PC
    x"a2",x"20",x"21",x"21",                         -- e6ee |   shr [A], A*2, A*2
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"15",x"1a",x"e9", -- e6f2 |   jne [0xaa], 0x15, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"21",x"39",x"30",             -- e6fb |   add [A*4 + B], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"8d",x"31",x"0b",x"e9", -- e701 |   jne [0x363], 0x318d, ${fail}:rel + PC
    x"82",x"fe",x"2a",x"2a",                         -- e70b |   add [G], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"c6",x"06",x"fd",x"e8", -- e70f |   jne [0x155], 0x6c6, ${fail}:rel + PC
    x"aa",x"2a",x"2a",x"3e",x"f6",                   -- e719 |   shl [A*4 + B], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"c0",x"ee",x"e8", -- e71e |   jne [0x363], 0xc000, ${fail}:rel + PC
    x"b6",x"3e",x"2a",x"20",x"f6",                   -- e728 |   xor [A*4 + -10], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"c9",x"03",x"df",x"e8", -- e72d |   jne [0x29e], 0x3c9, ${fail}:rel + PC
    x"8a",x"20",x"e4",x"1c",x"de",x"fa",x"85",       -- e737 |   mul [A], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a8",x"25",x"ce",x"e8", -- e73e |   jne [0xaa], 0x25a8, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"e4",x"f6",x"39",x"30",x"de",x"fa", -- e748 |   and [A*4 + -10], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"08",x"30",x"bb",x"e8", -- e751 |   jne [0x29e], 0x3008, ${fail}:rel + PC
    x"82",x"20",x"fe",x"21",                         -- e75b |   add [A], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a9",x"02",x"ad",x"e8", -- e75f |   jne [0xaa], 0x2a9, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"fe",x"de",x"fa",             -- e769 |   sub [G], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"33",x"fa",x"9d",x"e8", -- e76f |   jne [0x155], 0xfa33, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"e4",x"39",x"30",x"f6",x"de",x"fa", -- e779 |   shr [0x3039], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"02",x"8a",x"e8", -- e782 |   jne [0x3039], 0x2, ${fail}:rel + PC
    x"a2",x"3e",x"21",x"2a",x"f6",                   -- e78b |   shr [A*4 + -10], A*2, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"2a",x"7c",x"e8", -- e790 |   jne [0x29e], 0x2a, ${fail}:rel + PC
    x"a2",x"fe",x"20",x"2a",                         -- e799 |   shr [G], A, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"15",x"6f",x"e8", -- e79d |   jne [0x155], 0x15, ${fail}:rel + PC
    x"8e",x"2a",x"fe",x"21",                         -- e7a6 |   imul [A*4 + B], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"e4",x"c4",x"62",x"e8", -- e7aa |   jne [0x363], 0xc4e4, ${fail}:rel + PC
    x"8a",x"3e",x"e4",x"e4",x"f6",x"de",x"fa",x"de",x"fa", -- e7b4 |   mul [A*4 + -10], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"40",x"f8",x"4f",x"e8", -- e7bd |   jne [0x29e], 0xf840, ${fail}:rel + PC
    x"82",x"3e",x"2a",x"e0",x"f6",x"39",x"30",       -- e7c7 |   add [A*4 + -10], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"9c",x"33",x"3e",x"e8", -- e7ce |   jne [0x29e], 0x339c, ${fail}:rel + PC
    x"b6",x"2a",x"fe",x"3e",x"f6",                   -- e7d8 |   xor [A*4 + B], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"cb",x"03",x"2f",x"e8", -- e7dd |   jne [0x363], 0x3cb, ${fail}:rel + PC
    x"b6",x"21",x"e4",x"20",x"de",x"fa",             -- e7e7 |   xor [A*2], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"22",x"fb",x"1f",x"e8", -- e7ed |   jne [0x154], 0xfb22, ${fail}:rel + PC
    x"a2",x"e0",x"e0",x"21",x"39",x"30",x"39",x"30", -- e7f7 |   shr [0x3039], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"03",x"03",x"0d",x"e8", -- e7ff |   jne [0x3039], 0x303, ${fail}:rel + PC
    x"8e",x"2a",x"fe",x"e0",x"39",x"30",             -- e809 |   imul [A*4 + B], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ed",x"3b",x"fd",x"e7", -- e80f |   jne [0x363], 0x3bed, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"21",x"39",x"30",x"85",       -- e819 |   xor [0x3039], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d1",x"fe",x"ec",x"e7", -- e820 |   jne [0x3039], 0xfed1, ${fail}:rel + PC
    x"86",x"e0",x"fe",x"e4",x"39",x"30",x"de",x"fa", -- e82a |   sub [0x3039], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"cd",x"05",x"da",x"e7", -- e832 |   jne [0x3039], 0x5cd, ${fail}:rel + PC
    x"b6",x"20",x"21",x"e4",x"de",x"fa",             -- e83c |   xor [A], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"fa",x"ca",x"e7", -- e842 |   jne [0xaa], 0xfadc, ${fail}:rel + PC
    x"8a",x"21",x"3e",x"e0",x"f6",x"39",x"30",       -- e84c |   mul [A*2], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"2e",x"35",x"b9",x"e7", -- e853 |   jne [0x154], 0x352e, ${fail}:rel + PC
    x"aa",x"2a",x"21",x"20",                         -- e85d |   shl [A*4 + B], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"50",x"ab",x"e7", -- e861 |   jne [0x363], 0x5000, ${fail}:rel + PC
    x"ae",x"fe",x"1c",x"e4",x"85",x"de",x"fa",       -- e86b |   and [G], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"80",x"fb",x"9a",x"e7", -- e872 |   jne [0x155], 0xfb80, ${fail}:rel + PC
    x"a2",x"20",x"20",x"21",                         -- e87c |   shr [A], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"0a",x"8c",x"e7", -- e880 |   jne [0xaa], 0xa, ${fail}:rel + PC
    x"b6",x"3e",x"20",x"3e",x"f6",x"f6",             -- e889 |   xor [A*4 + -10], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"34",x"02",x"7d",x"e7", -- e88f |   jne [0x29e], 0x234, ${fail}:rel + PC
    x"aa",x"3e",x"3e",x"21",x"f6",x"f6",             -- e899 |   shl [A*4 + -10], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e0",x"29",x"6d",x"e7", -- e89f |   jne [0x29e], 0x29e0, ${fail}:rel + PC
    x"8a",x"20",x"3e",x"1c",x"f6",x"85",             -- e8a9 |   mul [A], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"16",x"be",x"5d",x"e7", -- e8af |   jne [0xaa], 0xbe16, ${fail}:rel + PC
    x"b2",x"fe",x"fe",x"e0",x"39",x"30",             -- e8b9 |   or [G], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"7d",x"31",x"4d",x"e7", -- e8bf |   jne [0x155], 0x317d, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"3e",x"de",x"fa",x"f6",       -- e8c9 |   shr [A*4 + B], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"03",x"3c",x"e7", -- e8d0 |   jne [0x363], 0x3, ${fail}:rel + PC
    x"8a",x"2a",x"20",x"e0",x"39",x"30",             -- e8d9 |   mul [A*4 + B], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"da",x"05",x"2d",x"e7", -- e8df |   jne [0x363], 0x5da, ${fail}:rel + PC
    x"ae",x"3e",x"21",x"e0",x"f6",x"39",x"30",       -- e8e9 |   and [A*4 + -10], A*2, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"10",x"1c",x"e7", -- e8f0 |   jne [0x29e], 0x10, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"2a",x"39",x"30",             -- e8f9 |   and [0x3039], A, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"22",x"0d",x"e7", -- e8ff |   jne [0x3039], 0x22, ${fail}:rel + PC
    x"8e",x"fe",x"2a",x"fe",                         -- e908 |   imul [G], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"df",x"82",x"00",x"e7", -- e90c |   jne [0x155], 0x82df, ${fail}:rel + PC
    x"86",x"e0",x"fe",x"2a",x"39",x"30",             -- e916 |   sub [0x3039], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"f2",x"fd",x"f0",x"e6", -- e91c |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
    x"a2",x"2a",x"fe",x"2a",                         -- e926 |   shr [A*4 + B], G, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"2a",x"e2",x"e6", -- e92a |   jne [0x363], 0x2a, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"fe",x"f6",                   -- e933 |   or [A*4 + -10], G, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"55",x"01",x"d4",x"e6", -- e938 |   jne [0x29e], 0x155, ${fail}:rel + PC
    x"b6",x"21",x"20",x"fe",                         -- e942 |   xor [A*2], A, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"01",x"c6",x"e6", -- e946 |   jne [0x154], 0x1ff, ${fail}:rel + PC
    x"a2",x"fe",x"3e",x"1c",x"f6",x"85",             -- e950 |   shr [G], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"14",x"b6",x"e6", -- e956 |   jne [0x155], 0x14, ${fail}:rel + PC
    x"a6",x"e0",x"fe",x"20",x"39",x"30",             -- e95f |   ishr [0x3039], G, A
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"a7",x"e6", -- e965 |   jne [0x3039], 0, ${fail}:rel + PC
    x"8a",x"21",x"1c",x"e4",x"85",x"de",x"fa",       -- e96d |   mul [A*2], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a8",x"25",x"98",x"e6", -- e974 |   jne [0x154], 0x25a8, ${fail}:rel + PC
    x"b2",x"21",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- e97e |   or [A*2], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b9",x"fb",x"86",x"e6", -- e986 |   jne [0x154], 0xfbb9, ${fail}:rel + PC
    x"8e",x"2a",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- e990 |   imul [A*4 + B], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"48",x"81",x"74",x"e6", -- e998 |   jne [0x363], 0x8148, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"1c",x"f6",x"85",             -- e9a2 |   or [A*4 + -10], G, -123
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"d5",x"64",x"e6", -- e9a8 |   jne [0x29e], 0xd5, ${fail}:rel + PC
    x"a6",x"3e",x"21",x"20",x"f6",                   -- e9b1 |   ishr [A*4 + -10], A*2, A
    x"ee",x"e0",x"00",x"f8",x"9e",x"02",x"56",x"e6", -- e9b6 |   jne [0x29e], 0, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"1c",x"85",                   -- e9be |   and [A*2], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"01",x"03",x"49",x"e6", -- e9c3 |   jne [0x154], 0x301, ${fail}:rel + PC
    x"b2",x"20",x"21",x"3e",x"f6",                   -- e9cd |   or [A], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"de",x"03",x"3a",x"e6", -- e9d2 |   jne [0xaa], 0x3de, ${fail}:rel + PC
    x"82",x"fe",x"3e",x"20",x"f6",                   -- e9dc |   add [G], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"48",x"03",x"2b",x"e6", -- e9e1 |   jne [0x155], 0x348, ${fail}:rel + PC
    x"aa",x"3e",x"20",x"e0",x"f6",x"39",x"30",       -- e9eb |   shl [A*4 + -10], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"54",x"1a",x"e6", -- e9f2 |   jne [0x29e], 0x5400, ${fail}:rel + PC
    x"aa",x"20",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- e9fc |   shl [A], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"88",x"08",x"e6", -- ea04 |   jne [0xaa], 0x8800, ${fail}:rel + PC
    x"8e",x"fe",x"3e",x"e0",x"f6",x"39",x"30",       -- ea0e |   imul [G], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"2e",x"35",x"f7",x"e5", -- ea15 |   jne [0x155], 0x352e, ${fail}:rel + PC
    x"82",x"e0",x"1c",x"1c",x"39",x"30",x"85",x"85", -- ea1f |   add [0x3039], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"0a",x"ff",x"e5",x"e5", -- ea27 |   jne [0x3039], 0xff0a, ${fail}:rel + PC
    x"86",x"21",x"3e",x"fe",x"f6",                   -- ea31 |   sub [A*2], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"49",x"01",x"d6",x"e5", -- ea36 |   jne [0x154], 0x149, ${fail}:rel + PC
    x"a6",x"20",x"e4",x"fe",x"de",x"fa",             -- ea40 |   ishr [A], 0xfade + A, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"dc",x"c6",x"e5", -- ea46 |   jne [0xaa], 0xdc, ${fail}:rel + PC
    x"b6",x"20",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- ea4f |   xor [A], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"b1",x"cb",x"b5",x"e5", -- ea57 |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
    x"86",x"fe",x"21",x"e4",x"de",x"fa",             -- ea61 |   sub [G], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"cc",x"05",x"a5",x"e5", -- ea67 |   jne [0x155], 0x5cc, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"e0",x"39",x"30",x"39",x"30", -- ea71 |   add [A*4 + B], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"72",x"60",x"93",x"e5", -- ea79 |   jne [0x363], 0x6072, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"e4",x"f6",x"85",x"de",x"fa", -- ea83 |   sub [A*4 + -10], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"fd",x"03",x"81",x"e5", -- ea8b |   jne [0x29e], 0x3fd, ${fail}:rel + PC
    x"82",x"21",x"21",x"3e",x"f6",                   -- ea95 |   add [A*2], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"f2",x"03",x"72",x"e5", -- ea9a |   jne [0x154], 0x3f2, ${fail}:rel + PC
    x"a2",x"20",x"e0",x"1c",x"39",x"30",x"85",       -- eaa4 |   shr [A], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"81",x"01",x"61",x"e5", -- eaab |   jne [0xaa], 0x181, ${fail}:rel + PC
    x"8e",x"21",x"20",x"3e",x"f6",                   -- eab5 |   imul [A*2], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ec",x"bc",x"52",x"e5", -- eaba |   jne [0x154], 0xbcec, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"e4",x"f6",x"de",x"fa",       -- eac4 |   or [A*4 + -10], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"dd",x"fb",x"41",x"e5", -- eacb |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
    x"a6",x"fe",x"20",x"1c",x"85",                   -- ead5 |   ishr [G], A, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"05",x"32",x"e5", -- eada |   jne [0x155], 0x5, ${fail}:rel + PC
    x"a6",x"21",x"20",x"e4",x"de",x"fa",             -- eae3 |   ishr [A*2], A, 0xfade + A
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"23",x"e5", -- eae9 |   jne [0x154], 0, ${fail}:rel + PC
    x"a2",x"e0",x"1c",x"20",x"39",x"30",x"85",       -- eaf1 |   shr [0x3039], -123, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"3f",x"14",x"e5", -- eaf8 |   jne [0x3039], 0x3f, ${fail}:rel + PC
    x"8e",x"20",x"20",x"3e",x"f6",                   -- eb01 |   imul [A], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ec",x"bc",x"06",x"e5", -- eb06 |   jne [0xaa], 0xbcec, ${fail}:rel + PC
    x"82",x"2a",x"e4",x"fe",x"de",x"fa",             -- eb10 |   add [A*4 + B], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"dd",x"fc",x"f6",x"e4", -- eb16 |   jne [0x363], 0xfcdd, ${fail}:rel + PC
    x"b6",x"fe",x"e0",x"3e",x"39",x"30",x"f6",       -- eb20 |   xor [G], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"a7",x"32",x"e5",x"e4", -- eb27 |   jne [0x155], 0x32a7, ${fail}:rel + PC
    x"8e",x"20",x"e0",x"2a",x"39",x"30",             -- eb31 |   imul [A], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"0b",x"51",x"d5",x"e4", -- eb37 |   jne [0xaa], 0x510b, ${fail}:rel + PC
    x"b2",x"3e",x"e4",x"fe",x"f6",x"de",x"fa",       -- eb41 |   or [A*4 + -10], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"dd",x"fb",x"c4",x"e4", -- eb48 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
    x"86",x"21",x"1c",x"21",x"85",                   -- eb52 |   sub [A*2], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"31",x"fe",x"b5",x"e4", -- eb57 |   jne [0x154], 0xfe31, ${fail}:rel + PC
    x"b2",x"2a",x"21",x"21",                         -- eb61 |   or [A*4 + B], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"54",x"01",x"a7",x"e4", -- eb65 |   jne [0x363], 0x154, ${fail}:rel + PC
    x"8e",x"e0",x"20",x"3e",x"39",x"30",x"f6",       -- eb6f |   imul [0x3039], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"ec",x"bc",x"96",x"e4", -- eb76 |   jne [0x3039], 0xbcec, ${fail}:rel + PC
    x"a6",x"3e",x"e4",x"2a",x"f6",x"de",x"fa",       -- eb80 |   ishr [A*4 + -10], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"71",x"ff",x"85",x"e4", -- eb87 |   jne [0x29e], 0xff71, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"e4",x"39",x"30",x"de",x"fa", -- eb91 |   and [0x3039], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"88",x"00",x"73",x"e4", -- eb99 |   jne [0x3039], 0x88, ${fail}:rel + PC
    x"a6",x"20",x"fe",x"fe",                         -- eba3 |   ishr [A], G, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"0a",x"65",x"e4", -- eba7 |   jne [0xaa], 0xa, ${fail}:rel + PC
    x"8e",x"20",x"3e",x"20",x"f6",                   -- ebb0 |   imul [A], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ec",x"bc",x"57",x"e4", -- ebb5 |   jne [0xaa], 0xbcec, ${fail}:rel + PC
    x"b2",x"e0",x"3e",x"fe",x"39",x"30",x"f6",       -- ebbf |   or [0x3039], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"df",x"03",x"46",x"e4", -- ebc6 |   jne [0x3039], 0x3df, ${fail}:rel + PC
    x"82",x"21",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- ebd0 |   add [A*2], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"c1",x"2b",x"34",x"e4", -- ebd8 |   jne [0x154], 0x2bc1, ${fail}:rel + PC
    x"82",x"e0",x"1c",x"e4",x"39",x"30",x"85",x"de",x"fa", -- ebe2 |   add [0x3039], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"0d",x"fb",x"21",x"e4", -- ebeb |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"21",                         -- ebf5 |   or [G], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"fe",x"01",x"13",x"e4", -- ebf9 |   jne [0x155], 0x1fe, ${fail}:rel + PC
    x"aa",x"21",x"2a",x"21",                         -- ec03 |   shl [A*2], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"30",x"36",x"05",x"e4", -- ec07 |   jne [0x154], 0x3630, ${fail}:rel + PC
    x"82",x"e0",x"2a",x"e0",x"39",x"30",x"39",x"30", -- ec11 |   add [0x3039], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"9c",x"33",x"f3",x"e3", -- ec19 |   jne [0x3039], 0x339c, ${fail}:rel + PC
    x"ae",x"2a",x"20",x"1c",x"85",                   -- ec23 |   and [A*4 + B], A, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"80",x"00",x"e4",x"e3", -- ec28 |   jne [0x363], 0x80, ${fail}:rel + PC
    x"b6",x"e0",x"20",x"1c",x"39",x"30",x"85",       -- ec32 |   xor [0x3039], A, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"2f",x"ff",x"d3",x"e3", -- ec39 |   jne [0x3039], 0xff2f, ${fail}:rel + PC
    x"ae",x"21",x"fe",x"e0",x"39",x"30",             -- ec43 |   and [A*2], G, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"11",x"c3",x"e3", -- ec49 |   jne [0x154], 0x11, ${fail}:rel + PC
    x"ae",x"3e",x"fe",x"3e",x"f6",x"f6",             -- ec52 |   and [A*4 + -10], G, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"14",x"b4",x"e3", -- ec58 |   jne [0x29e], 0x14, ${fail}:rel + PC
    x"8a",x"3e",x"2a",x"2a",x"f6",                   -- ec61 |   mul [A*4 + -10], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"49",x"78",x"a6",x"e3", -- ec66 |   jne [0x29e], 0x7849, ${fail}:rel + PC
    x"82",x"20",x"3e",x"e0",x"f6",x"39",x"30",       -- ec70 |   add [A], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d7",x"32",x"95",x"e3", -- ec77 |   jne [0xaa], 0x32d7, ${fail}:rel + PC
    x"82",x"21",x"e0",x"3e",x"39",x"30",x"f6",       -- ec81 |   add [A*2], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"d7",x"32",x"84",x"e3", -- ec88 |   jne [0x154], 0x32d7, ${fail}:rel + PC
    x"b6",x"21",x"3e",x"3e",x"f6",x"f6",             -- ec92 |   xor [A*2], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"74",x"e3", -- ec98 |   jne [0x154], 0, ${fail}:rel + PC
    x"a6",x"e0",x"20",x"20",x"39",x"30",             -- eca0 |   ishr [0x3039], A, A
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"66",x"e3", -- eca6 |   jne [0x3039], 0, ${fail}:rel + PC
    x"a6",x"e0",x"e0",x"3e",x"39",x"30",x"39",x"30",x"f6", -- ecae |   ishr [0x3039], 0x3039, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"55",x"e3", -- ecb7 |   jne [0x3039], 0, ${fail}:rel + PC
    x"aa",x"20",x"1c",x"21",x"85",                   -- ecbf |   shl [A], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"50",x"f8",x"48",x"e3", -- ecc4 |   jne [0xaa], 0xf850, ${fail}:rel + PC
    x"ae",x"e0",x"21",x"e4",x"39",x"30",x"de",x"fa", -- ecce |   and [0x3039], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"01",x"36",x"e3", -- ecd6 |   jne [0x3039], 0x100, ${fail}:rel + PC
    x"b2",x"3e",x"1c",x"20",x"f6",x"85",             -- ece0 |   or [A*4 + -10], -123, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"af",x"26",x"e3", -- ece6 |   jne [0x29e], 0xaf, ${fail}:rel + PC
    x"8e",x"21",x"1c",x"20",x"85",                   -- ecef |   imul [A*2], -123, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"52",x"ae",x"18",x"e3", -- ecf4 |   jne [0x154], 0xae52, ${fail}:rel + PC
    x"8a",x"2a",x"2a",x"2a",                         -- ecfe |   mul [A*4 + B], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"49",x"78",x"0a",x"e3", -- ed02 |   jne [0x363], 0x7849, ${fail}:rel + PC
    x"86",x"2a",x"2a",x"e0",x"39",x"30",             -- ed0c |   sub [A*4 + B], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"2a",x"d3",x"fa",x"e2", -- ed12 |   jne [0x363], 0xd32a, ${fail}:rel + PC
    x"ae",x"fe",x"1c",x"21",x"85",                   -- ed1c |   and [G], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"04",x"01",x"eb",x"e2", -- ed21 |   jne [0x155], 0x104, ${fail}:rel + PC
    x"8e",x"21",x"e4",x"1c",x"de",x"fa",x"85",       -- ed2b |   imul [A*2], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a8",x"25",x"da",x"e2", -- ed32 |   jne [0x154], 0x25a8, ${fail}:rel + PC
    x"8a",x"21",x"21",x"e4",x"de",x"fa",             -- ed3c |   mul [A*2], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a0",x"10",x"ca",x"e2", -- ed42 |   jne [0x154], 0x10a0, ${fail}:rel + PC
    x"86",x"fe",x"e0",x"fe",x"39",x"30",             -- ed4c |   sub [G], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"e4",x"2e",x"ba",x"e2", -- ed52 |   jne [0x155], 0x2ee4, ${fail}:rel + PC
    x"62",x"20",x"1c",x"85",                         -- ed5c |   mov [A], -123
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"85",x"ac",x"e2", -- ed60 |   jne [0xaa], 0x85, ${fail}:rel + PC
    x"62",x"3e",x"3e",x"f6",x"f6",                   -- ed69 |   mov [A*4 + -10], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"9e",x"02",x"9e",x"e2", -- ed6e |   jne [0x29e], 0x29e, ${fail}:rel + PC
    x"62",x"21",x"2a",                               -- ed78 |   mov [A*2], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"63",x"03",x"91",x"e2", -- ed7b |   jne [0x154], 0x363, ${fail}:rel + PC
    x"62",x"e0",x"1c",x"39",x"30",x"85",             -- ed85 |   mov [0x3039], -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"85",x"81",x"e2", -- ed8b |   jne [0x3039], 0x85, ${fail}:rel + PC
    x"62",x"fe",x"3e",x"f6",                         -- ed94 |   mov [G], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"9e",x"02",x"74",x"e2", -- ed98 |   jne [0x155], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"fe",x"39",x"30",                   -- eda2 |   mov [0x3039], G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"55",x"01",x"65",x"e2", -- eda7 |   jne [0x3039], 0x155, ${fail}:rel + PC
    x"62",x"fe",x"21",                               -- edb1 |   mov [G], A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"54",x"01",x"58",x"e2", -- edb4 |   jne [0x155], 0x154, ${fail}:rel + PC
    x"62",x"3e",x"e4",x"f6",x"de",x"fa",             -- edbe |   mov [A*4 + -10], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"88",x"fb",x"48",x"e2", -- edc4 |   jne [0x29e], 0xfb88, ${fail}:rel + PC
    x"62",x"e0",x"e0",x"39",x"30",x"39",x"30",       -- edce |   mov [0x3039], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"39",x"30",x"37",x"e2", -- edd5 |   jne [0x3039], 0x3039, ${fail}:rel + PC
    x"62",x"3e",x"fe",x"f6",                         -- eddf |   mov [A*4 + -10], G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"55",x"01",x"29",x"e2", -- ede3 |   jne [0x29e], 0x155, ${fail}:rel + PC
    x"62",x"20",x"fe",                               -- eded |   mov [A], G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"55",x"01",x"1c",x"e2", -- edf0 |   jne [0xaa], 0x155, ${fail}:rel + PC
    x"62",x"2a",x"2a",                               -- edfa |   mov [A*4 + B], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"63",x"03",x"0f",x"e2", -- edfd |   jne [0x363], 0x363, ${fail}:rel + PC
    x"62",x"3e",x"2a",x"f6",                         -- ee07 |   mov [A*4 + -10], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"63",x"03",x"01",x"e2", -- ee0b |   jne [0x29e], 0x363, ${fail}:rel + PC
    x"62",x"2a",x"20",                               -- ee15 |   mov [A*4 + B], A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"aa",x"00",x"f4",x"e1", -- ee18 |   jne [0x363], 0xaa, ${fail}:rel + PC
    x"62",x"3e",x"20",x"f6",                         -- ee22 |   mov [A*4 + -10], A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"aa",x"00",x"e6",x"e1", -- ee26 |   jne [0x29e], 0xaa, ${fail}:rel + PC
    x"62",x"20",x"20",                               -- ee30 |   mov [A], A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"aa",x"00",x"d9",x"e1", -- ee33 |   jne [0xaa], 0xaa, ${fail}:rel + PC
    x"62",x"2a",x"e4",x"de",x"fa",                   -- ee3d |   mov [A*4 + B], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"88",x"fb",x"ca",x"e1", -- ee42 |   jne [0x363], 0xfb88, ${fail}:rel + PC
    x"62",x"21",x"1c",x"85",                         -- ee4c |   mov [A*2], -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"85",x"bc",x"e1", -- ee50 |   jne [0x154], 0x85, ${fail}:rel + PC
    x"62",x"2a",x"e0",x"39",x"30",                   -- ee59 |   mov [A*4 + B], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"39",x"30",x"ae",x"e1", -- ee5e |   jne [0x363], 0x3039, ${fail}:rel + PC
    x"62",x"3e",x"1c",x"f6",x"85",                   -- ee68 |   mov [A*4 + -10], -123
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"85",x"9f",x"e1", -- ee6d |   jne [0x29e], 0x85, ${fail}:rel + PC
    x"62",x"3e",x"21",x"f6",                         -- ee76 |   mov [A*4 + -10], A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"54",x"01",x"92",x"e1", -- ee7a |   jne [0x29e], 0x154, ${fail}:rel + PC
    x"62",x"21",x"3e",x"f6",                         -- ee84 |   mov [A*2], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"9e",x"02",x"84",x"e1", -- ee88 |   jne [0x154], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"21",x"39",x"30",                   -- ee92 |   mov [0x3039], A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"75",x"e1", -- ee97 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"62",x"21",x"fe",                               -- eea1 |   mov [A*2], G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"55",x"01",x"68",x"e1", -- eea4 |   jne [0x154], 0x155, ${fail}:rel + PC
    x"62",x"2a",x"fe",                               -- eeae |   mov [A*4 + B], G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"55",x"01",x"5b",x"e1", -- eeb1 |   jne [0x363], 0x155, ${fail}:rel + PC
    x"62",x"21",x"e4",x"de",x"fa",                   -- eebb |   mov [A*2], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"88",x"fb",x"4c",x"e1", -- eec0 |   jne [0x154], 0xfb88, ${fail}:rel + PC
    x"62",x"20",x"3e",x"f6",                         -- eeca |   mov [A], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9e",x"02",x"3e",x"e1", -- eece |   jne [0xaa], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"3e",x"39",x"30",x"f6",             -- eed8 |   mov [0x3039], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"9e",x"02",x"2e",x"e1", -- eede |   jne [0x3039], 0x29e, ${fail}:rel + PC
    x"62",x"2a",x"3e",x"f6",                         -- eee8 |   mov [A*4 + B], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"9e",x"02",x"20",x"e1", -- eeec |   jne [0x363], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"e4",x"39",x"30",x"de",x"fa",       -- eef6 |   mov [0x3039], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"88",x"fb",x"0f",x"e1", -- eefd |   jne [0x3039], 0xfb88, ${fail}:rel + PC
    x"62",x"21",x"e0",x"39",x"30",                   -- ef07 |   mov [A*2], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"39",x"30",x"00",x"e1", -- ef0c |   jne [0x154], 0x3039, ${fail}:rel + PC
    x"62",x"fe",x"1c",x"85",                         -- ef16 |   mov [G], -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"85",x"f2",x"e0", -- ef1a |   jne [0x155], 0x85, ${fail}:rel + PC
    x"62",x"e0",x"2a",x"39",x"30",                   -- ef23 |   mov [0x3039], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"63",x"03",x"e4",x"e0", -- ef28 |   jne [0x3039], 0x363, ${fail}:rel + PC
    x"62",x"fe",x"e4",x"de",x"fa",                   -- ef32 |   mov [G], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"88",x"fb",x"d5",x"e0", -- ef37 |   jne [0x155], 0xfb88, ${fail}:rel + PC
    x"62",x"20",x"e0",x"39",x"30",                   -- ef41 |   mov [A], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"39",x"30",x"c6",x"e0", -- ef46 |   jne [0xaa], 0x3039, ${fail}:rel + PC
    x"62",x"20",x"21",                               -- ef50 |   mov [A], A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"54",x"01",x"b9",x"e0", -- ef53 |   jne [0xaa], 0x154, ${fail}:rel + PC
    x"62",x"3e",x"e0",x"f6",x"39",x"30",             -- ef5d |   mov [A*4 + -10], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"39",x"30",x"a9",x"e0", -- ef63 |   jne [0x29e], 0x3039, ${fail}:rel + PC
    x"62",x"fe",x"20",                               -- ef6d |   mov [G], A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"00",x"9c",x"e0", -- ef70 |   jne [0x155], 0xaa, ${fail}:rel + PC
    x"62",x"21",x"20",                               -- ef7a |   mov [A*2], A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"00",x"8f",x"e0", -- ef7d |   jne [0x154], 0xaa, ${fail}:rel + PC
    x"62",x"fe",x"fe",                               -- ef87 |   mov [G], G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"55",x"01",x"82",x"e0", -- ef8a |   jne [0x155], 0x155, ${fail}:rel + PC
    x"62",x"20",x"2a",                               -- ef94 |   mov [A], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"63",x"03",x"75",x"e0", -- ef97 |   jne [0xaa], 0x363, ${fail}:rel + PC
    x"62",x"2a",x"1c",x"85",                         -- efa1 |   mov [A*4 + B], -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"85",x"67",x"e0", -- efa5 |   jne [0x363], 0x85, ${fail}:rel + PC
    x"62",x"2a",x"21",                               -- efae |   mov [A*4 + B], A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"54",x"01",x"5b",x"e0", -- efb1 |   jne [0x363], 0x154, ${fail}:rel + PC
    x"62",x"e0",x"20",x"39",x"30",                   -- efbb |   mov [0x3039], A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"00",x"4c",x"e0", -- efc0 |   jne [0x3039], 0xaa, ${fail}:rel + PC
    x"62",x"fe",x"e0",x"39",x"30",                   -- efca |   mov [G], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"39",x"30",x"3d",x"e0", -- efcf |   jne [0x155], 0x3039, ${fail}:rel + PC
    x"62",x"21",x"21",                               -- efd9 |   mov [A*2], A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"54",x"01",x"30",x"e0", -- efdc |   jne [0x154], 0x154, ${fail}:rel + PC
    x"62",x"fe",x"2a",                               -- efe6 |   mov [G], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"63",x"03",x"23",x"e0", -- efe9 |   jne [0x155], 0x363, ${fail}:rel + PC
    x"62",x"20",x"e4",x"de",x"fa",                   -- eff3 |   mov [A], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"88",x"fb",x"14",x"e0", -- eff8 |   jne [0xaa], 0xfb88, ${fail}:rel + PC
    x"e0",x"2a",                                     -- f002 |   push A*4 + B
    x"e4",x"80",                                     -- f004 |   pop D
    x"ec",x"80",x"e0",x"f8",x"63",x"03",x"06",x"e0", -- f006 |   jne D, 0x363, ${fail}:rel + PC
    x"e0",x"1c",x"85",                               -- f00e |   push -123
    x"e4",x"80",                                     -- f011 |   pop D
    x"ec",x"80",x"1c",x"f8",x"85",x"f9",x"df",       -- f013 |   jne D, 0x85, ${fail}:rel + PC
    x"e0",x"fe",                                     -- f01a |   push G
    x"e4",x"80",                                     -- f01c |   pop D
    x"ec",x"80",x"e0",x"f8",x"55",x"01",x"ee",x"df", -- f01e |   jne D, 0x155, ${fail}:rel + PC
    x"e0",x"3e",x"f6",                               -- f026 |   push A*4 + -10
    x"e4",x"80",                                     -- f029 |   pop D
    x"ec",x"80",x"e0",x"f8",x"9e",x"02",x"e1",x"df", -- f02b |   jne D, 0x29e, ${fail}:rel + PC
    x"e0",x"20",                                     -- f033 |   push A
    x"e4",x"80",                                     -- f035 |   pop D
    x"ec",x"80",x"e0",x"f8",x"aa",x"00",x"d5",x"df", -- f037 |   jne D, 0xaa, ${fail}:rel + PC
    x"e0",x"e4",x"de",x"fa",                         -- f03f |   push 0xfade + A
    x"e4",x"80",                                     -- f043 |   pop D
    x"ec",x"80",x"e0",x"f8",x"88",x"fb",x"c7",x"df", -- f045 |   jne D, 0xfb88, ${fail}:rel + PC
    x"e0",x"21",                                     -- f04d |   push A*2
    x"e4",x"80",                                     -- f04f |   pop D
    x"ec",x"80",x"e0",x"f8",x"54",x"01",x"bb",x"df", -- f051 |   jne D, 0x154, ${fail}:rel + PC
    x"e0",x"e0",x"39",x"30",                         -- f059 |   push 0x3039
    x"e4",x"80",                                     -- f05d |   pop D
    x"ec",x"80",x"e0",x"f8",x"39",x"30",x"ad",x"df", -- f05f |   jne D, 0x3039, ${fail}:rel + PC
    x"5c",x"f8",x"10",x"00",                         -- f067 |   call ${_L_test_uop_get_arg_1}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"fe",x"ad",x"a1",x"df", -- f06b |   jne C, 0xadfe, ${fail}:rel + PC
    x"58",x"f8",x"0e",x"00",                         -- f073 |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                                                     --      | _L_test_uop_get_arg_1:
    x"60",x"60",x"e0",x"fe",x"ad",                   -- f077 |   mov C, 0xadfe
    x"dc",                                           -- f07c |   ret
    x"58",x"f8",x"8f",x"df",                         -- f07d |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_get_arg_2:
                                                     --      | test_uop_alu_2dd:
    x"60",x"20",x"e0",x"cd",x"ab",                   -- f081 |   mov A, 0xabcd
    x"00",x"20",x"e0",x"ab",x"cd",                   -- f086 |   add A, 0xcdab
    x"ec",x"20",x"e0",x"f8",x"78",x"79",x"81",x"df", -- f08b |   jne A, 0x7978, ${fail}:rel + PC
                                                     --      | test_uop_alu_2di:
    x"60",x"20",x"e0",x"00",x"10",                   -- f093 |   mov A, 0x1000
    x"62",x"e0",x"e0",x"00",x"10",x"bc",x"0a",       -- f098 |   mov [0x1000], 0xabc
    x"01",x"20",x"20",                               -- f09f |   add A, [A]
    x"ec",x"20",x"e0",x"f8",x"bc",x"1a",x"6a",x"df", -- f0a2 |   jne A, 0x1abc, ${fail}:rel + PC
                                                     --      | test_uop_alu_2id:
    x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       -- f0aa |   mov [0x1000], 0x1234
    x"02",x"e0",x"e0",x"00",x"10",x"21",x"43",       -- f0b1 |   add [0x1000], 0x4321
    x"61",x"20",x"e0",x"00",x"10",                   -- f0b8 |   mov A, [0x1000]
    x"ec",x"20",x"e0",x"f8",x"55",x"55",x"4f",x"df", -- f0bd |   jne A, 0x5555, ${fail}:rel + PC
                                                     --      | test_uop_alu_2ii:
    x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       -- f0c5 |   mov [0x1000], 0x1234
    x"62",x"e0",x"e0",x"05",x"10",x"aa",x"aa",       -- f0cc |   mov [0x1005], 0xaaaa
    x"03",x"e0",x"e0",x"05",x"10",x"00",x"10",       -- f0d3 |   add [0x1005], [0x1000]
    x"ee",x"e0",x"e0",x"f8",x"05",x"10",x"de",x"bc",x"32",x"df", -- f0da |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                                                     --      | test_uop_alu_3dd:
    x"60",x"20",x"e0",x"fe",x"ab",                   -- f0e4 |   mov A, 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f0e9 |   mov B, 0x5555
    x"80",x"60",x"20",x"40",                         -- f0ee |   add C, A, B
    x"ec",x"20",x"e0",x"f8",x"fe",x"ab",x"1a",x"df", -- f0f2 |   jne A, 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"12",x"df", -- f0fa |   jne B, 0x5555, ${fail}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"53",x"01",x"0a",x"df", -- f102 |   jne C, 0x153, ${fail}:rel + PC
                                                     --      | test_uop_alu_3di:
    x"62",x"e0",x"e0",x"00",x"10",x"aa",x"12",       -- f10a |   mov [0x1000], 0x12aa
    x"60",x"40",x"e0",x"de",x"fa",                   -- f111 |   mov B, 0xfade
    x"b5",x"20",x"e0",x"40",x"00",x"10",             -- f116 |   xor A, [0x1000], B
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"aa",x"12",x"f0",x"de", -- f11c |   jne [0x1000], 0x12aa, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"de",x"fa",x"e6",x"de", -- f126 |   jne B, 0xfade, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"74",x"e8",x"de",x"de", -- f12e |   jne A, 0xe874, ${fail}:rel + PC
                                                     --      | test_uop_alu_3id:
    x"60",x"20",x"e0",x"fe",x"ab",                   -- f136 |   mov A, 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f13b |   mov B, 0x5555
    x"86",x"e0",x"20",x"40",x"00",x"10",             -- f140 |   sub [0x1000], A, B
    x"ec",x"20",x"e0",x"f8",x"fe",x"ab",x"c6",x"de", -- f146 |   jne A, 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"be",x"de", -- f14e |   jne B, 0x5555, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"a9",x"56",x"b6",x"de", -- f156 |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                                                     --      | test_uop_alu_3ii:
    x"62",x"e0",x"e0",x"00",x"10",x"fe",x"ab",       -- f160 |   mov [0x1000], 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f167 |   mov B, 0x5555
    x"af",x"e0",x"e0",x"40",x"02",x"10",x"00",x"10", -- f16c |   and [0x1002], [0x1000], B
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"fe",x"ab",x"98",x"de", -- f174 |   jne [0x1000], 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"8e",x"de", -- f17e |   jne B, 0x5555, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"02",x"10",x"54",x"01",x"86",x"de", -- f186 |   jne [0x1002], 0x154, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_1dx:
    x"60",x"20",x"e0",x"00",x"ff",                   -- f190 |   mov A, 0xff00
    x"3c",x"20",                                     -- f195 |   not A
    x"ec",x"20",x"e0",x"f8",x"ff",x"00",x"75",x"de", -- f197 |   jne A, 0xff, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_1ix:
    x"62",x"1c",x"e0",x"64",x"34",x"12",             -- f19f |   mov [0x64], 0x1234
    x"3a",x"1c",x"64",                               -- f1a5 |   neg [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"cc",x"ed",x"64",x"de", -- f1a8 |   jne [0x64], 0xedcc, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2dd:
    x"60",x"40",x"e0",x"ff",x"00",                   -- f1b1 |   mov B, 0xff
    x"bc",x"20",x"40",                               -- f1b6 |   not A, B
    x"ec",x"40",x"e0",x"f8",x"ff",x"00",x"53",x"de", -- f1b9 |   jne B, 0xff, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"00",x"ff",x"4b",x"de", -- f1c1 |   jne A, 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2di:
    x"62",x"1c",x"e0",x"64",x"34",x"12",             -- f1c9 |   mov [0x64], 0x1234
    x"bd",x"20",x"1c",x"64",                         -- f1cf |   not A, [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"34",x"12",x"39",x"de", -- f1d3 |   jne [0x64], 0x1234, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"cb",x"ed",x"30",x"de", -- f1dc |   jne A, 0xedcb, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2id:
    x"60",x"40",x"e0",x"ff",x"00",                   -- f1e4 |   mov B, 0xff
    x"be",x"1c",x"40",x"64",                         -- f1e9 |   not [0x64], B
    x"ec",x"40",x"e0",x"f8",x"ff",x"00",x"1f",x"de", -- f1ed |   jne B, 0xff, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"00",x"ff",x"17",x"de", -- f1f5 |   jne [0x64], 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2ii:
    x"62",x"1c",x"e0",x"66",x"ff",x"00",             -- f1fe |   mov [0x66], 0xff
    x"bf",x"1c",x"1c",x"64",x"66",                   -- f204 |   not [0x64], [0x66]
    x"ee",x"1c",x"e0",x"f8",x"66",x"ff",x"00",x"03",x"de", -- f209 |   jne [0x66], 0xff, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"00",x"ff",x"fa",x"dd", -- f212 |   jne [0x64], 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_cmp_dd:
    x"60",x"40",x"1c",x"7b",                         -- f21b |   mov B, 0x7b
    x"50",x"40",x"e0",x"c8",x"01",                   -- f21f |   cmp B, 0x1c8
    x"4c",x"20",                                     -- f224 |   getf A
    x"ec",x"40",x"1c",x"f8",x"7b",x"e6",x"dd",       -- f226 |   jne B, 0x7b, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"0e",x"df",x"dd",       -- f22d |   jne A, 0xe, ${fail}:rel + PC
                                                     --      | test_uop_cmp_di:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f234 |   mov [0x64], -123
    x"60",x"40",x"e0",x"c8",x"01",                   -- f239 |   mov B, 0x1c8
    x"d1",x"40",x"1c",x"64",                         -- f23e |   icmp B, [0x64]
    x"4c",x"20",                                     -- f242 |   getf A
    x"ec",x"40",x"e0",x"f8",x"c8",x"01",x"c8",x"dd", -- f244 |   jne B, 0x1c8, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"32",x"c0",x"dd",       -- f24c |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_cmp_id:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f253 |   mov [0x64], -123
    x"60",x"40",x"e0",x"c8",x"01",                   -- f258 |   mov B, 0x1c8
    x"d2",x"1c",x"40",x"64",                         -- f25d |   icmp [0x64], B
    x"4c",x"20",                                     -- f261 |   getf A
    x"ec",x"40",x"e0",x"f8",x"c8",x"01",x"a9",x"dd", -- f263 |   jne B, 0x1c8, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"0e",x"a1",x"dd",       -- f26b |   jne A, 0xe, ${fail}:rel + PC
                                                     --      | test_uop_cmp_ii:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f272 |   mov [0x64], -123
    x"62",x"1c",x"e0",x"66",x"38",x"fe",             -- f277 |   mov [0x66], 0xfe38
    x"d3",x"1c",x"1c",x"64",x"66",                   -- f27d |   icmp [0x64], [0x66]
    x"4c",x"20",                                     -- f282 |   getf A
    x"ee",x"1c",x"1c",x"f8",x"64",x"85",x"88",x"dd", -- f284 |   jne [0x64], -123, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"38",x"fe",x"80",x"dd", -- f28c |   jne [0x66], 0xfe38, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"32",x"77",x"dd",       -- f295 |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_jmp_d:
    x"60",x"20",x"e0",x"a7",x"f2",                   -- f29c |   mov A, ${_L_test_uop_jmp_d_okay}
    x"58",x"20",                                     -- f2a1 |   jmp A
    x"58",x"f8",x"69",x"dd",                         -- f2a3 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_d_okay:
                                                     --      | test_uop_jmp_i:
    x"62",x"1c",x"e0",x"64",x"b4",x"f2",             -- f2a7 |   mov [0x64], ${_L_test_uop_jmp_i_okay}
    x"5a",x"1c",x"64",                               -- f2ad |   jmp [0x64]
    x"58",x"f8",x"5c",x"dd",                         -- f2b0 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_i_okay:
    x"ee",x"1c",x"e0",x"f8",x"64",x"b4",x"f2",x"58",x"dd", -- f2b4 |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_cond_i:
    x"62",x"1c",x"e0",x"64",x"d3",x"f2",             -- f2bd |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
    x"50",x"1c",x"1c",x"01",x"02",                   -- f2c3 |   cmp 0x1, 0x2
    x"68",x"f8",x"44",x"dd",                         -- f2c8 |   jeq ${fail}:rel + PC
    x"6e",x"1c",x"64",                               -- f2cc |   jne [0x64]
    x"58",x"f8",x"3d",x"dd",                         -- f2cf |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_cond_i_okay:
    x"ee",x"1c",x"e0",x"f8",x"64",x"d3",x"f2",x"39",x"dd", -- f2d3 |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_cond_d:
    x"60",x"20",x"e0",x"f0",x"f2",                   -- f2dc |   mov A, ${_L_test_uop_jmp_cond_d_okay}
    x"50",x"1c",x"1c",x"01",x"01",                   -- f2e1 |   cmp 0x1, 0x1
    x"6c",x"f8",x"26",x"dd",                         -- f2e6 |   jne ${fail}:rel + PC
    x"68",x"20",                                     -- f2ea |   jeq A
    x"58",x"f8",x"20",x"dd",                         -- f2ec |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_cond_d_okay:
    x"ec",x"20",x"e0",x"f8",x"f0",x"f2",x"1c",x"dd", -- f2f0 |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3dd:
    x"60",x"20",x"1c",x"7b",                         -- f2f8 |   mov A, 0x7b
    x"ec",x"20",x"1c",x"f8",x"7b",x"10",x"dd",       -- f2fc |   jne A, 0x7b, ${fail}:rel + PC
    x"e8",x"20",x"1c",x"f8",x"7b",x"0b",x"00",       -- f303 |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
    x"58",x"f8",x"02",x"dd",                         -- f30a |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3dd_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"fe",x"dc",       -- f30e |   jne A, 0x7b, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3di:
    x"60",x"20",x"1c",x"7b",                         -- f315 |   mov A, 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f319 |   mov [0x64], 0x141
    x"e9",x"20",x"1c",x"f8",x"64",x"ed",x"dc",       -- f31f |   jeq A, [0x64], ${fail}:rel + PC
    x"ed",x"20",x"1c",x"f8",x"64",x"0b",x"00",       -- f326 |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
    x"58",x"f8",x"df",x"dc",                         -- f32d |   jmp ${fail}:rel + PC
                                                     --      | test_uop_jmp_3di_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"db",x"dc",       -- f331 |   jne A, 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"d4",x"dc", -- f338 |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3id:
    x"60",x"20",x"1c",x"7b",                         -- f341 |   mov A, 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f345 |   mov [0x64], 0x141
    x"ea",x"1c",x"20",x"f8",x"64",x"c1",x"dc",       -- f34b |   jeq [0x64], A, ${fail}:rel + PC
    x"ee",x"1c",x"20",x"f8",x"64",x"0b",x"00",       -- f352 |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
    x"58",x"f8",x"b3",x"dc",                         -- f359 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3id_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"af",x"dc",       -- f35d |   jne A, 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"a8",x"dc", -- f364 |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3ii:
    x"62",x"e0",x"1c",x"c8",x"00",x"7b",             -- f36d |   mov [0xc8], 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f373 |   mov [0x64], 0x141
    x"eb",x"1c",x"e0",x"f8",x"64",x"c8",x"00",x"93",x"dc", -- f379 |   jeq [0x64], [0xc8], ${fail}:rel + PC
    x"ef",x"1c",x"e0",x"f8",x"64",x"c8",x"00",x"0d",x"00", -- f382 |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
    x"58",x"f8",x"81",x"dc",                         -- f38b |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3ii_okay:
    x"ee",x"e0",x"1c",x"f8",x"c8",x"00",x"7b",x"7d",x"dc", -- f38f |   jne [0xc8], 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"74",x"dc", -- f398 |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_mov_dd:
    x"60",x"20",x"1c",x"7b",                         -- f3a1 |   mov A, 0x7b
    x"ec",x"20",x"1c",x"f8",x"7b",x"67",x"dc",       -- f3a5 |   jne A, 0x7b, ${fail}:rel + PC
                                                     --      | test_uop_mov_di:
    x"62",x"1c",x"1c",x"64",x"da",                   -- f3ac |   mov [0x64], 0xda
    x"61",x"20",x"1c",x"64",                         -- f3b1 |   mov A, [0x64]
    x"ec",x"20",x"1c",x"f8",x"da",x"57",x"dc",       -- f3b5 |   jne A, 0xda, ${fail}:rel + PC
                                                     --      | test_uop_mov_id:
    x"62",x"1c",x"1c",x"64",x"ff",                   -- f3bc |   mov [0x64], 0xff
    x"ee",x"1c",x"1c",x"f8",x"64",x"ff",x"4b",x"dc", -- f3c1 |   jne [0x64], 0xff, ${fail}:rel + PC
                                                     --      | test_uop_mov_ii:
    x"60",x"20",x"1c",x"14",                         -- f3c9 |   mov A, 0x14
    x"62",x"1c",x"e0",x"78",x"fa",x"fd",             -- f3cd |   mov [0x78], 0xfdfa
    x"63",x"1c",x"3c",x"64",x"64",                   -- f3d3 |   mov [0x64], [A + 0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"fa",x"fd",x"34",x"dc", -- f3d8 |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                                                     --      | test_uop_bmov_dd:
    x"64",x"20",x"e0",x"de",x"af",                   -- f3e1 |   bmov A, 0xafde
    x"ec",x"20",x"e0",x"f8",x"de",x"00",x"26",x"dc", -- f3e6 |   jne A, 0xde, ${fail}:rel + PC
    x"64",x"20",x"e0",x"fa",x"00",                   -- f3ee |   bmov A, 0xfa
    x"ec",x"20",x"e0",x"f8",x"fa",x"00",x"19",x"dc", -- f3f3 |   jne A, 0xfa, ${fail}:rel + PC
                                                     --      | test_uop_bmov_di:
    x"62",x"1c",x"1c",x"64",x"da",                   -- f3fb |   mov [0x64], 0xda
    x"65",x"20",x"1c",x"64",                         -- f400 |   bmov A, [0x64]
    x"ec",x"20",x"e0",x"f8",x"da",x"00",x"08",x"dc", -- f404 |   jne A, 0xda, ${fail}:rel + PC
                                                     --      | test_uop_bmov_id:
    x"62",x"1c",x"e0",x"64",x"cd",x"ab",             -- f40c |   mov [0x64], 0xabcd
    x"62",x"1c",x"e0",x"66",x"34",x"12",             -- f412 |   mov [0x66], 0x1234
    x"62",x"1c",x"e0",x"68",x"78",x"56",             -- f418 |   mov [0x68], 0x5678
    x"66",x"1c",x"e0",x"66",x"df",x"00",             -- f41e |   bmov [0x66], 0xdf
    x"ee",x"1c",x"e0",x"f8",x"64",x"cd",x"ab",x"e8",x"db", -- f424 |   jne [0x64], 0xabcd, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"df",x"12",x"df",x"db", -- f42d |   jne [0x66], 0x12df, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"68",x"78",x"56",x"d6",x"db", -- f436 |   jne [0x68], 0x5678, ${fail}:rel + PC
    x"66",x"1c",x"e0",x"67",x"b8",x"00",             -- f43f |   bmov [0x67], 0xb8
    x"ee",x"1c",x"e0",x"f8",x"64",x"cd",x"ab",x"c7",x"db", -- f445 |   jne [0x64], 0xabcd, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"df",x"b8",x"be",x"db", -- f44e |   jne [0x66], 0xb8df, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"68",x"78",x"56",x"b5",x"db", -- f457 |   jne [0x68], 0x5678, ${fail}:rel + PC
                                                     --      | test_uop_bmov_ii:
    x"62",x"e0",x"e0",x"2c",x"01",x"df",x"00",       -- f460 |   mov [0x12c], 0xdf
    x"62",x"e0",x"e0",x"2e",x"01",x"b8",x"00",       -- f467 |   mov [0x12e], 0xb8
    x"62",x"e0",x"e0",x"c8",x"00",x"cd",x"ab",       -- f46e |   mov [0xc8], 0xabcd
    x"62",x"e0",x"e0",x"ca",x"00",x"34",x"12",       -- f475 |   mov [0xca], 0x1234
    x"62",x"e0",x"e0",x"cc",x"00",x"78",x"56",       -- f47c |   mov [0xcc], 0x5678
    x"67",x"e0",x"e0",x"ca",x"00",x"2c",x"01",       -- f483 |   bmov [0xca], [0x12c]
    x"ee",x"e0",x"e0",x"f8",x"c8",x"00",x"cd",x"ab",x"82",x"db", -- f48a |   jne [0xc8], 0xabcd, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"ca",x"00",x"df",x"12",x"78",x"db", -- f494 |   jne [0xca], 0x12df, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"cc",x"00",x"78",x"56",x"6e",x"db", -- f49e |   jne [0xcc], 0x5678, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2c",x"01",x"df",x"00",x"64",x"db", -- f4a8 |   jne [0x12c], 0xdf, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2e",x"01",x"b8",x"00",x"5a",x"db", -- f4b2 |   jne [0x12e], 0xb8, ${fail}:rel + PC
    x"67",x"e0",x"e0",x"cb",x"00",x"2e",x"01",       -- f4bc |   bmov [0xcb], [0x12e]
    x"ee",x"e0",x"e0",x"f8",x"c8",x"00",x"cd",x"ab",x"49",x"db", -- f4c3 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"ca",x"00",x"df",x"b8",x"3f",x"db", -- f4cd |   jne [0xca], 0xb8df, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"cc",x"00",x"78",x"56",x"35",x"db", -- f4d7 |   jne [0xcc], 0x5678, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2c",x"01",x"df",x"00",x"2b",x"db", -- f4e1 |   jne [0x12c], 0xdf, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2e",x"01",x"b8",x"00",x"21",x"db", -- f4eb |   jne [0x12e], 0xb8, ${fail}:rel + PC
                                                     --      | test_uop_halt:
                                                     --      | test_uop_getf:
    x"50",x"1c",x"1c",x"7b",x"2d",                   -- f4f5 |   cmp 0x7b, 0x2d
    x"4c",x"20",                                     -- f4fa |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"10",x"db",       -- f4fc |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_setf:
    x"cc",x"1c",x"ff",                               -- f503 |   setf 0xff
    x"4c",x"20",                                     -- f506 |   getf A
    x"ec",x"20",x"1c",x"f8",x"3f",x"04",x"db",       -- f508 |   jne A, 0x3f, ${fail}:rel + PC
                                                     --      | test_uop_call_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f50f |   mov SP, 0x1000
    x"60",x"40",x"e0",x"2f",x"f5",                   -- f514 |   mov B, ${_L_test_uop_call_d_fn}
    x"5c",x"40",                                     -- f519 |   call B
    x"ec",x"40",x"e0",x"f8",x"2f",x"f5",x"f1",x"da", -- f51b |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"fa",x"34",x"e9",x"da", -- f523 |   jne A, 0x34fa, ${fail}:rel + PC
    x"58",x"f8",x"0a",x"00",                         -- f52b |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                                                     --      | _L_test_uop_call_d_fn:
    x"60",x"20",x"e0",x"fa",x"34",                   -- f52f |   mov A, 0x34fa
    x"dc",                                           -- f534 |   ret
                                                     --      | _L_test_uop_call_d_okay:
                                                     --      | test_uop_call_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f535 |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- f53a |   mov B, 0x64
    x"62",x"40",x"e0",x"59",x"f5",                   -- f53e |   mov [B], ${_L_test_uop_call_i_fn}
    x"5e",x"40",                                     -- f543 |   call [B]
    x"ee",x"40",x"e0",x"f8",x"59",x"f5",x"c7",x"da", -- f545 |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"d4",x"aa",x"bf",x"da", -- f54d |   jne A, 0xaad4, ${fail}:rel + PC
    x"58",x"f8",x"0a",x"00",                         -- f555 |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                                                     --      | _L_test_uop_call_i_fn:
    x"60",x"20",x"e0",x"d4",x"aa",                   -- f559 |   mov A, 0xaad4
    x"dc",                                           -- f55e |   ret
                                                     --      | _L_test_uop_call_i_okay:
                                                     --      | test_uop_ret:
                                                     --      | test_uop_push_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f55f |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- f564 |   mov B, 0x64
    x"e0",x"40",                                     -- f568 |   push B
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"a2",x"da", -- f56a |   jne SP, 0xffe, ${fail}:rel + PC
    x"ee",x"e0",x"1c",x"f8",x"fe",x"0f",x"64",x"9a",x"da", -- f572 |   jne [0xffe], 0x64, ${fail}:rel + PC
    x"e4",x"60",                                     -- f57b |   pop C
    x"ec",x"60",x"1c",x"f8",x"64",x"8f",x"da",       -- f57d |   jne C, 0x64, ${fail}:rel + PC
                                                     --      | test_uop_push_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f584 |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- f589 |   mov B, 0x64
    x"62",x"40",x"e0",x"90",x"01",                   -- f58d |   mov [B], 0x190
    x"e2",x"40",                                     -- f592 |   push [B]
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"78",x"da", -- f594 |   jne SP, 0xffe, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fe",x"0f",x"90",x"01",x"70",x"da", -- f59c |   jne [0xffe], 0x190, ${fail}:rel + PC
    x"e4",x"60",                                     -- f5a6 |   pop C
    x"ec",x"60",x"e0",x"f8",x"90",x"01",x"64",x"da", -- f5a8 |   jne C, 0x190, ${fail}:rel + PC
                                                     --      | test_uop_pop_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f5b0 |   mov SP, 0x1000
    x"e0",x"e0",x"da",x"fa",                         -- f5b5 |   push 0xfada
    x"e4",x"20",                                     -- f5b9 |   pop A
    x"ec",x"20",x"e0",x"f8",x"da",x"fa",x"51",x"da", -- f5bb |   jne A, 0xfada, ${fail}:rel + PC
                                                     --      | test_uop_pop_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f5c3 |   mov SP, 0x1000
    x"e0",x"e0",x"da",x"f2",                         -- f5c8 |   push 0xf2da
    x"e6",x"1c",x"64",                               -- f5cc |   pop [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"da",x"f2",x"3d",x"da", -- f5cf |   jne [0x64], 0xf2da, ${fail}:rel + PC
                                                     --      | test_uop_mmap:
    x"62",x"e0",x"e0",x"00",x"30",x"00",x"ff",       -- f5d8 |   mov [0x3000], 0xff00
    x"62",x"e0",x"e0",x"00",x"31",x"01",x"ff",       -- f5df |   mov [0x3100], 0xff01
    x"62",x"e0",x"e0",x"00",x"32",x"02",x"ff",       -- f5e6 |   mov [0x3200], 0xff02
    x"62",x"e0",x"e0",x"00",x"40",x"00",x"dd",       -- f5ed |   mov [0x4000], 0xdd00
    x"62",x"e0",x"e0",x"00",x"41",x"01",x"dd",       -- f5f4 |   mov [0x4100], 0xdd01
    x"62",x"e0",x"e0",x"00",x"42",x"02",x"dd",       -- f5fb |   mov [0x4200], 0xdd02
    x"62",x"e0",x"e0",x"00",x"50",x"00",x"ee",       -- f602 |   mov [0x5000], 0xee00
    x"62",x"e0",x"e0",x"00",x"51",x"01",x"ee",       -- f609 |   mov [0x5100], 0xee01
    x"62",x"e0",x"e0",x"00",x"52",x"02",x"ee",       -- f610 |   mov [0x5200], 0xee02
    x"60",x"20",x"00",                               -- f617 |   mov A, 0
    x"60",x"40",x"e0",x"00",x"41",                   -- f61a |   mov B, 0x4100
    x"54",x"e0",x"e0",x"1c",x"00",x"31",x"ff",x"32",x"01", -- f61f |   mmap 0x3100, 0x32ff, 0x1
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"dd",x"e4",x"d9", -- f628 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"02",x"dd",x"da",x"d9", -- f632 |   jne [0x3200], 0xdd02, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"d0",x"d9", -- f63c |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"60",x"40",x"e0",x"00",x"51",                   -- f646 |   mov B, 0x5100
    x"54",x"e0",x"e0",x"1c",x"00",x"32",x"ff",x"32",x"02", -- f64b |   mmap 0x3200, 0x32ff, 0x2
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"01",x"ee",x"b8",x"d9", -- f654 |   jne [0x3200], 0xee01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"ae",x"d9", -- f65e |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"dd",x"a4",x"d9", -- f668 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
    x"d4",x"1c",x"01",                               -- f672 |   umap 0x1
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"ff",x"97",x"d9", -- f675 |   jne [0x3100], 0xff01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"01",x"ee",x"8d",x"d9", -- f67f |   jne [0x3200], 0xee01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"83",x"d9", -- f689 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"d4",x"1c",x"02",                               -- f693 |   umap 0x2
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"76",x"d9", -- f696 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"ff",x"6c",x"d9", -- f6a0 |   jne [0x3100], 0xff01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"02",x"ff",x"62",x"d9", -- f6aa |   jne [0x3200], 0xff02, ${fail}:rel + PC
                                                     --      | test_uop_umap:
                                                     --      | test_aux_reg:
    x"60",x"20",x"1c",x"01",                         -- f6b4 |   mov A, 0x1
    x"60",x"40",x"1c",x"02",                         -- f6b8 |   mov B, 0x2
    x"60",x"60",x"1c",x"03",                         -- f6bc |   mov C, 0x3
    x"60",x"80",x"1c",x"04",                         -- f6c0 |   mov D, 0x4
    x"60",x"fc",x"1c",x"05",                         -- f6c4 |   mov E, 0x5
    x"60",x"fd",x"1c",x"06",                         -- f6c8 |   mov F, 0x6
    x"60",x"fe",x"1c",x"07",                         -- f6cc |   mov G, 0x7
    x"60",x"ff",x"1c",x"08",                         -- f6d0 |   mov H, 0x8
    x"ec",x"20",x"1c",x"f8",x"01",x"38",x"d9",       -- f6d4 |   jne A, 0x1, ${fail}:rel + PC
    x"ec",x"40",x"1c",x"f8",x"02",x"31",x"d9",       -- f6db |   jne B, 0x2, ${fail}:rel + PC
    x"ec",x"60",x"1c",x"f8",x"03",x"2a",x"d9",       -- f6e2 |   jne C, 0x3, ${fail}:rel + PC
    x"ec",x"80",x"1c",x"f8",x"04",x"23",x"d9",       -- f6e9 |   jne D, 0x4, ${fail}:rel + PC
    x"ec",x"fc",x"1c",x"f8",x"05",x"1c",x"d9",       -- f6f0 |   jne E, 0x5, ${fail}:rel + PC
    x"ec",x"fd",x"1c",x"f8",x"06",x"15",x"d9",       -- f6f7 |   jne F, 0x6, ${fail}:rel + PC
    x"ec",x"fe",x"1c",x"f8",x"07",x"0e",x"d9",       -- f6fe |   jne G, 0x7, ${fail}:rel + PC
    x"ec",x"ff",x"1c",x"f8",x"08",x"07",x"d9",       -- f705 |   jne H, 0x8, ${fail}:rel + PC
    x"34",x"ff",x"e0",x"00",x"ff",                   -- f70c |   xor H, 0xff00
    x"ec",x"ff",x"e0",x"f8",x"08",x"ff",x"fb",x"d8", -- f711 |   jne H, 0xff08, ${fail}:rel + PC
    x"60",x"20",x"ff",                               -- f719 |   mov A, H
    x"ec",x"20",x"e0",x"f8",x"08",x"ff",x"f0",x"d8", -- f71c |   jne A, 0xff08, ${fail}:rel + PC
    x"60",x"fc",x"fe",                               -- f724 |   mov E, G
    x"ec",x"fc",x"1c",x"f8",x"07",x"e5",x"d8",       -- f727 |   jne E, 0x7, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"08",x"ff",x"de",x"d8", -- f72e |   jne H, 0xff08, ${fail}:rel + PC
                                                     --      | test_call_ret:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f736 |   mov SP, 0x1000
    x"5c",x"f8",x"77",x"00",                         -- f73b |   call ${fn_test_target}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"cd",x"d8", -- f73f |   jne SP, 0x1000, ${fail}:rel + PC
    x"60",x"20",x"1c",x"0a",                         -- f747 |   mov A, 0xa
    x"60",x"40",x"00",                               -- f74b |   mov B, 0
    x"60",x"60",x"00",                               -- f74e |   mov C, 0
    x"60",x"80",x"00",                               -- f751 |   mov D, 0
    x"5c",x"f8",x"2d",x"00",                         -- f754 |   call ${fn_recursive}:rel + PC
    x"ec",x"20",x"00",x"f8",x"b4",x"d8",             -- f758 |   jne A, 0, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"3f",x"cf",x"ae",x"d8", -- f75e |   jne B, 0xcf3f, ${fail}:rel + PC
    x"ec",x"60",x"1c",x"f8",x"2d",x"a6",x"d8",       -- f766 |   jne C, 0x2d, ${fail}:rel + PC
    x"ec",x"80",x"e0",x"f8",x"97",x"45",x"9f",x"d8", -- f76d |   jne D, 0x4597, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"97",x"d8", -- f775 |   jne SP, 0x1000, ${fail}:rel + PC
    x"58",x"f8",x"42",x"00",                         -- f77d |   jmp ${test_call_ret_end}:rel + PC
                                                     --      | fn_recursive:
    x"04",x"20",x"1c",x"01",                         -- f781 |   sub A, 0x1
    x"5c",x"f8",x"25",x"00",                         -- f785 |   call ${fn_process_c}:rel + PC
    x"e8",x"20",x"00",x"f8",x"1c",x"00",             -- f789 |   jeq A, 0, ${fn_recursive_end}:rel + PC
    x"5c",x"f8",x"f2",x"ff",                         -- f78f |   call ${fn_recursive}:rel + PC
    x"00",x"80",x"60",                               -- f793 |   add D, C
    x"08",x"80",x"1c",x"03",                         -- f796 |   mul D, 0x3
    x"00",x"40",x"80",                               -- f79a |   add B, D
    x"e0",x"80",                                     -- f79d |   push D
    x"08",x"40",x"1c",x"05",                         -- f79f |   mul B, 0x5
    x"e4",x"80",                                     -- f7a3 |   pop D
                                                     --      | fn_recursive_end:
    x"dc",                                           -- f7a5 |   ret
    x"58",x"f8",x"66",x"d8",                         -- f7a6 |   jmp ${fail}:rel + PC
                                                     --      | fn_process_c:
    x"00",x"60",x"20",                               -- f7aa |   add C, A
    x"dc",                                           -- f7ad |   ret
    x"58",x"f8",x"5e",x"d8",                         -- f7ae |   jmp ${fail}:rel + PC
                                                     --      | fn_test_target:
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"5a",x"d8", -- f7b2 |   jne SP, 0xffe, ${fail}:rel + PC
    x"dc",                                           -- f7ba |   ret
    x"58",x"f8",x"51",x"d8",                         -- f7bb |   jmp ${fail}:rel + PC
                                                     --      | test_call_ret_end:
                                                     --      | test_mem_access:
    x"62",x"e0",x"1c",x"00",x"01",x"ed",             -- f7bf |   mov [0x100], 0xed
    x"ee",x"e0",x"e0",x"f8",x"00",x"01",x"aa",x"00",x"0e",x"00", -- f7c5 |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
    x"58",x"f8",x"3d",x"d8",                         -- f7cf |   jmp ${fail}:rel + PC
                                                     --      | test_mem_access_check_jmp:
    x"62",x"e0",x"00",x"00",x"10",                   -- f7d3 |   mov [0x1000], 0
    x"60",x"a0",x"e0",x"00",x"10",                   -- f7d8 |   mov SP, 0x1000
    x"ee",x"a0",x"00",x"f8",x"2f",x"d8",             -- f7dd |   jne [SP], 0, ${fail}:rel + PC
    x"e0",x"00",                                     -- f7e3 |   push 0
    x"e0",x"00",                                     -- f7e5 |   push 0
    x"e0",x"00",                                     -- f7e7 |   push 0
    x"e4",x"20",                                     -- f7e9 |   pop A
    x"e4",x"20",                                     -- f7eb |   pop A
    x"e4",x"20",                                     -- f7ed |   pop A
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"1d",x"d8", -- f7ef |   jne SP, 0x1000, ${fail}:rel + PC
    x"ec",x"20",x"00",x"f8",x"15",x"d8",             -- f7f7 |   jne A, 0, ${fail}:rel + PC
    x"e0",x"e0",x"02",x"01",                         -- f7fd |   push 0x102
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"0b",x"d8", -- f801 |   jne SP, 0xffe, ${fail}:rel + PC
    x"e0",x"e0",x"04",x"03",                         -- f809 |   push 0x304
    x"ec",x"a0",x"e0",x"f8",x"fc",x"0f",x"ff",x"d7", -- f80d |   jne SP, 0xffc, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fe",x"0f",x"02",x"01",x"f7",x"d7", -- f815 |   jne [0xffe], 0x102, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fc",x"0f",x"04",x"03",x"ed",x"d7", -- f81f |   jne [0xffc], 0x304, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fb",x"0f",x"00",x"04",x"e3",x"d7", -- f829 |   jne [0xffb], 0x400, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fd",x"0f",x"03",x"02",x"d9",x"d7", -- f833 |   jne [0xffd], 0x203, ${fail}:rel + PC
    x"ee",x"e0",x"1c",x"f8",x"ff",x"0f",x"01",x"cf",x"d7", -- f83d |   jne [0xfff], 0x1, ${fail}:rel + PC
    x"e4",x"20",                                     -- f846 |   pop A
    x"ec",x"20",x"e0",x"f8",x"04",x"03",x"c4",x"d7", -- f848 |   jne A, 0x304, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"bc",x"d7", -- f850 |   jne SP, 0xffe, ${fail}:rel + PC
    x"e4",x"20",                                     -- f858 |   pop A
    x"ec",x"20",x"e0",x"f8",x"02",x"01",x"b2",x"d7", -- f85a |   jne A, 0x102, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"aa",x"d7", -- f862 |   jne SP, 0x1000, ${fail}:rel + PC
                                                     --      | test_cmp:
    x"cc",x"1c",x"ff",                               -- f86a |   setf 0xff
    x"4c",x"20",                                     -- f86d |   getf A
    x"ec",x"20",x"1c",x"f8",x"3f",x"9d",x"d7",       -- f86f |   jne A, 0x3f, ${fail}:rel + PC
    x"cc",x"e0",x"ab",x"ab",                         -- f876 |   setf 0xabab
    x"4c",x"20",                                     -- f87a |   getf A
    x"ec",x"20",x"1c",x"f8",x"2b",x"90",x"d7",       -- f87c |   jne A, 0x2b, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"ab",x"2b",                   -- f883 |   cmp 0xab, 0x2b
    x"4c",x"20",                                     -- f888 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"82",x"d7",       -- f88a |   jne A, 0x32, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"2b",x"ab",                   -- f891 |   cmp 0x2b, 0xab
    x"4c",x"20",                                     -- f896 |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"74",x"d7",       -- f898 |   jne A, 0xe, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"ab",x"ab",                   -- f89f |   cmp 0xab, 0xab
    x"4c",x"20",                                     -- f8a4 |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"66",x"d7",       -- f8a6 |   jne A, 0x29, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"ab",x"2b",                   -- f8ad |   icmp 0xab, 0x2b
    x"4c",x"20",                                     -- f8b2 |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"58",x"d7",       -- f8b4 |   jne A, 0xe, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"2b",x"ab",                   -- f8bb |   icmp 0x2b, 0xab
    x"4c",x"20",                                     -- f8c0 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"4a",x"d7",       -- f8c2 |   jne A, 0x32, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"ab",x"ab",                   -- f8c9 |   icmp 0xab, 0xab
    x"4c",x"20",                                     -- f8ce |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"3c",x"d7",       -- f8d0 |   jne A, 0x29, ${fail}:rel + PC
                                                     --      | end_of_test:
    x"60",x"20",x"e0",x"ad",x"de",                   -- f8d7 |   mov A, 0xdead
    x"60",x"40",x"e0",x"ef",x"be",                   -- f8dc |   mov B, 0xbeef
    x"88",x"60",x"20",x"40",                         -- f8e1 |   mul C, A, B
    x"58",x"f8",x"2c",x"d7",                         -- f8e5 |   jmp ${success}:rel + PC
    x"dc",                                           -- f8e9 |   ret
                                                     --      | end_fn_self_test:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | SECTION_END_const_data:
                                                     --      | 
                                                     --      | .offset 0x0000
                                                     --      | SECTION_BEGIN_static_data:
                                                     --      | SECTION_END_static_data:
                                                     --      | 

    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
