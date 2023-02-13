
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 10551;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | SECTION_BEGIN_boot:
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_self_test:
                                                     --      | .boot:
    x"60",x"20",x"e0",x"fa",x"ff",                   -- d000 |   mov A, 0xfffa
    x"ec",x"20",x"e0",x"f8",x"fa",x"00",x"50",x"00", -- d005 |   jne A, 0xfa, ${start_test}:rel + PC
                                                     --      | fail:
    x"d8",                                           -- d00d |   halt
    x"58",x"f8",x"ff",x"ff",                         -- d00e |   jmp ${fail}:rel + PC
                                                     --      | success:
    x"ec",x"20",x"e0",x"f8",x"ad",x"de",x"fb",x"ff", -- d012 |   jne A, 0xdead, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"ef",x"be",x"f3",x"ff", -- d01a |   jne B, 0xbeef, ${fail}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"83",x"49",x"eb",x"ff", -- d022 |   jne C, 0x4983, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"14",x"a6",x"e3",x"ff", -- d02a |   jne H, 0xa614, ${fail}:rel + PC
    x"60",x"80",x"ff",                               -- d032 |   mov D, H
    x"00",x"20",x"e0",x"ab",x"ac",                   -- d035 |   add A, 0xacab
    x"00",x"40",x"e0",x"cc",x"41",                   -- d03a |   add B, 0x41cc
    x"08",x"20",x"80",                               -- d03f |   mul A, D
    x"34",x"20",x"e0",x"4a",x"f2",                   -- d042 |   xor A, 0xf24a
    x"34",x"60",x"e0",x"4f",x"49",                   -- d047 |   xor C, 0x494f
    x"34",x"ff",x"e0",x"30",x"5a",                   -- d04c |   xor H, 0x5a30
    x"60",x"80",x"ff",                               -- d051 |   mov D, H
    x"d8",                                           -- d054 |   halt
                                                     --      | start_test:
                                                     --      | alu_test:
    x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d055 |   add B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"42",x"72",x"b0",x"ff", -- d05d |   jne B, 0x7242, ${fail}:rel + PC
    x"84",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d065 |   sub B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"1e",x"32",x"a0",x"ff", -- d06d |   jne B, 0x321e, ${fail}:rel + PC
    x"88",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d075 |   mul B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"60",x"c7",x"90",x"ff", -- d07d |   jne B, 0xc760, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"6c",x"83",x"88",x"ff", -- d085 |   jne H, 0x836c, ${fail}:rel + PC
    x"8c",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d08d |   imul B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"60",x"c7",x"78",x"ff", -- d095 |   jne B, 0xc760, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"2a",x"11",x"70",x"ff", -- d09d |   jne H, 0x112a, ${fail}:rel + PC
    x"a0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0a5 |   shr B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"8c",x"34",x"60",x"ff", -- d0ad |   jne B, 0x348c, ${fail}:rel + PC
    x"a4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0b5 |   ishr B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"8c",x"f4",x"50",x"ff", -- d0bd |   jne B, 0xf48c, ${fail}:rel + PC
    x"a8",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0c5 |   shl B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"c0",x"48",x"40",x"ff", -- d0cd |   jne B, 0x48c0, ${fail}:rel + PC
    x"ac",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0d5 |   and B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"10",x"80",x"30",x"ff", -- d0dd |   jne B, 0x8010, ${fail}:rel + PC
    x"b0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0e5 |   or B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"32",x"f2",x"20",x"ff", -- d0ed |   jne B, 0xf232, ${fail}:rel + PC
    x"b4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0f5 |   xor B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"22",x"72",x"10",x"ff", -- d0fd |   jne B, 0x7222, ${fail}:rel + PC
    x"b8",x"40",x"e0",x"30",x"d2",                   -- d105 |   neg B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"d0",x"2d",x"03",x"ff", -- d10a |   jne B, 0x2dd0, ${fail}:rel + PC
    x"bc",x"40",x"e0",x"30",x"d2",                   -- d112 |   not B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"cf",x"2d",x"f6",x"fe", -- d117 |   jne B, 0x2dcf, ${fail}:rel + PC
    x"c0",x"40",x"e0",x"30",x"d2",                   -- d11f |   bool B, 0xd230
    x"ec",x"40",x"1c",x"f8",x"01",x"e9",x"fe",       -- d124 |   jne B, 0x1, ${fail}:rel + PC
    x"c4",x"40",x"e0",x"30",x"d2",                   -- d12b |   inc B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"31",x"d2",x"dd",x"fe", -- d130 |   jne B, 0xd231, ${fail}:rel + PC
    x"c8",x"40",x"e0",x"30",x"d2",                   -- d138 |   dec B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"2f",x"d2",x"d0",x"fe", -- d13d |   jne B, 0xd22f, ${fail}:rel + PC
    x"80",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d145 |   add B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"e4",x"da",x"c0",x"fe", -- d14d |   jne B, 0xdae4, ${fail}:rel + PC
    x"84",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d155 |   sub B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"76",x"26",x"b0",x"fe", -- d15d |   jne B, 0x2676, ${fail}:rel + PC
    x"88",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d165 |   mul B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"2b",x"77",x"a0",x"fe", -- d16d |   jne B, 0x772b, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"93",x"00",x"98",x"fe", -- d175 |   jne H, 0x93, ${fail}:rel + PC
    x"8c",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d17d |   imul B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"2b",x"77",x"88",x"fe", -- d185 |   jne B, 0x772b, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"e6",x"ff",x"80",x"fe", -- d18d |   jne H, 0xffe6, ${fail}:rel + PC
    x"a0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d195 |   shr B, 0xad, 0xda37
    x"ec",x"40",x"1c",x"f8",x"01",x"70",x"fe",       -- d19d |   jne B, 0x1, ${fail}:rel + PC
    x"a4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1a4 |   ishr B, 0xad, 0xda37
    x"ec",x"40",x"1c",x"f8",x"01",x"61",x"fe",       -- d1ac |   jne B, 0x1, ${fail}:rel + PC
    x"a8",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1b3 |   shl B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"80",x"56",x"52",x"fe", -- d1bb |   jne B, 0x5680, ${fail}:rel + PC
    x"ac",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1c3 |   and B, 0xad, 0xda37
    x"ec",x"40",x"1c",x"f8",x"25",x"42",x"fe",       -- d1cb |   jne B, 0x25, ${fail}:rel + PC
    x"b0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1d2 |   or B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"bf",x"da",x"33",x"fe", -- d1da |   jne B, 0xdabf, ${fail}:rel + PC
    x"b4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1e2 |   xor B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"9a",x"da",x"23",x"fe", -- d1ea |   jne B, 0xda9a, ${fail}:rel + PC
    x"b8",x"40",x"e0",x"ad",x"00",                   -- d1f2 |   neg B, 0xad
    x"ec",x"40",x"e0",x"f8",x"53",x"ff",x"16",x"fe", -- d1f7 |   jne B, 0xff53, ${fail}:rel + PC
    x"bc",x"40",x"e0",x"ad",x"00",                   -- d1ff |   not B, 0xad
    x"ec",x"40",x"e0",x"f8",x"52",x"ff",x"09",x"fe", -- d204 |   jne B, 0xff52, ${fail}:rel + PC
    x"c0",x"40",x"e0",x"ad",x"00",                   -- d20c |   bool B, 0xad
    x"ec",x"40",x"1c",x"f8",x"01",x"fc",x"fd",       -- d211 |   jne B, 0x1, ${fail}:rel + PC
    x"c4",x"40",x"e0",x"ad",x"00",                   -- d218 |   inc B, 0xad
    x"ec",x"40",x"e0",x"f8",x"ae",x"00",x"f0",x"fd", -- d21d |   jne B, 0xae, ${fail}:rel + PC
    x"c8",x"40",x"e0",x"ad",x"00",                   -- d225 |   dec B, 0xad
    x"ec",x"40",x"e0",x"f8",x"ac",x"00",x"e3",x"fd", -- d22a |   jne B, 0xac, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d232 |   mov B, 0xf0ad
    x"00",x"40",x"e0",x"3f",x"2a",                   -- d237 |   add B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"ec",x"1a",x"d1",x"fd", -- d23c |   jne B, 0x1aec, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d244 |   mov B, 0xf0ad
    x"04",x"40",x"e0",x"3f",x"2a",                   -- d249 |   sub B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"6e",x"c6",x"bf",x"fd", -- d24e |   jne B, 0xc66e, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d256 |   mov B, 0xf0ad
    x"08",x"40",x"e0",x"3f",x"2a",                   -- d25b |   mul B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"93",x"9c",x"ad",x"fd", -- d260 |   jne B, 0x9c93, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"b7",x"27",x"a5",x"fd", -- d268 |   jne H, 0x27b7, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d270 |   mov B, 0xf0ad
    x"0c",x"40",x"e0",x"3f",x"2a",                   -- d275 |   imul B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"93",x"9c",x"93",x"fd", -- d27a |   jne B, 0x9c93, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"78",x"fd",x"8b",x"fd", -- d282 |   jne H, 0xfd78, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d28a |   mov B, 0xf0ad
    x"20",x"40",x"e0",x"3f",x"2a",                   -- d28f |   shr B, 0x2a3f
    x"ec",x"40",x"1c",x"f8",x"01",x"79",x"fd",       -- d294 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d29b |   mov B, 0xf0ad
    x"24",x"40",x"e0",x"3f",x"2a",                   -- d2a0 |   ishr B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"ff",x"ff",x"68",x"fd", -- d2a5 |   jne B, 0xffff, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2ad |   mov B, 0xf0ad
    x"28",x"40",x"e0",x"3f",x"2a",                   -- d2b2 |   shl B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"00",x"80",x"56",x"fd", -- d2b7 |   jne B, 0x8000, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2bf |   mov B, 0xf0ad
    x"2c",x"40",x"e0",x"3f",x"2a",                   -- d2c4 |   and B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"2d",x"20",x"44",x"fd", -- d2c9 |   jne B, 0x202d, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2d1 |   mov B, 0xf0ad
    x"30",x"40",x"e0",x"3f",x"2a",                   -- d2d6 |   or B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"bf",x"fa",x"32",x"fd", -- d2db |   jne B, 0xfabf, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2e3 |   mov B, 0xf0ad
    x"34",x"40",x"e0",x"3f",x"2a",                   -- d2e8 |   xor B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"92",x"da",x"20",x"fd", -- d2ed |   jne B, 0xda92, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2f5 |   mov B, 0xf0ad
    x"38",x"40",                                     -- d2fa |   neg B
    x"ec",x"40",x"e0",x"f8",x"53",x"0f",x"11",x"fd", -- d2fc |   jne B, 0xf53, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d304 |   mov B, 0xf0ad
    x"3c",x"40",                                     -- d309 |   not B
    x"ec",x"40",x"e0",x"f8",x"52",x"0f",x"02",x"fd", -- d30b |   jne B, 0xf52, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d313 |   mov B, 0xf0ad
    x"40",x"40",                                     -- d318 |   bool B
    x"ec",x"40",x"1c",x"f8",x"01",x"f3",x"fc",       -- d31a |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d321 |   mov B, 0xf0ad
    x"44",x"40",                                     -- d326 |   inc B
    x"ec",x"40",x"e0",x"f8",x"ae",x"f0",x"e5",x"fc", -- d328 |   jne B, 0xf0ae, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d330 |   mov B, 0xf0ad
    x"48",x"40",                                     -- d335 |   dec B
    x"ec",x"40",x"e0",x"f8",x"ac",x"f0",x"d6",x"fc", -- d337 |   jne B, 0xf0ac, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d33f |   mov B, 0
    x"00",x"40",x"e0",x"ad",x"de",                   -- d342 |   add B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"c6",x"fc", -- d347 |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d34f |   mov B, 0
    x"04",x"40",x"e0",x"ad",x"de",                   -- d352 |   sub B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"53",x"21",x"b6",x"fc", -- d357 |   jne B, 0x2153, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d35f |   mov B, 0
    x"08",x"40",x"e0",x"ad",x"de",                   -- d362 |   mul B, 0xdead
    x"ec",x"40",x"00",x"f8",x"a6",x"fc",             -- d367 |   jne B, 0, ${fail}:rel + PC
    x"ec",x"ff",x"00",x"f8",x"a0",x"fc",             -- d36d |   jne H, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d373 |   mov B, 0
    x"0c",x"40",x"e0",x"ad",x"de",                   -- d376 |   imul B, 0xdead
    x"ec",x"40",x"00",x"f8",x"92",x"fc",             -- d37b |   jne B, 0, ${fail}:rel + PC
    x"ec",x"ff",x"00",x"f8",x"8c",x"fc",             -- d381 |   jne H, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d387 |   mov B, 0
    x"20",x"40",x"e0",x"ad",x"de",                   -- d38a |   shr B, 0xdead
    x"ec",x"40",x"00",x"f8",x"7e",x"fc",             -- d38f |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d395 |   mov B, 0
    x"24",x"40",x"e0",x"ad",x"de",                   -- d398 |   ishr B, 0xdead
    x"ec",x"40",x"00",x"f8",x"70",x"fc",             -- d39d |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3a3 |   mov B, 0
    x"28",x"40",x"e0",x"ad",x"de",                   -- d3a6 |   shl B, 0xdead
    x"ec",x"40",x"00",x"f8",x"62",x"fc",             -- d3ab |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3b1 |   mov B, 0
    x"2c",x"40",x"e0",x"ad",x"de",                   -- d3b4 |   and B, 0xdead
    x"ec",x"40",x"00",x"f8",x"54",x"fc",             -- d3b9 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3bf |   mov B, 0
    x"30",x"40",x"e0",x"ad",x"de",                   -- d3c2 |   or B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"46",x"fc", -- d3c7 |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3cf |   mov B, 0
    x"34",x"40",x"e0",x"ad",x"de",                   -- d3d2 |   xor B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"36",x"fc", -- d3d7 |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3df |   mov B, 0
    x"38",x"40",                                     -- d3e2 |   neg B
    x"ec",x"40",x"00",x"f8",x"29",x"fc",             -- d3e4 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3ea |   mov B, 0
    x"3c",x"40",                                     -- d3ed |   not B
    x"ec",x"40",x"e0",x"f8",x"ff",x"ff",x"1e",x"fc", -- d3ef |   jne B, 0xffff, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3f7 |   mov B, 0
    x"40",x"40",                                     -- d3fa |   bool B
    x"ec",x"40",x"00",x"f8",x"11",x"fc",             -- d3fc |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d402 |   mov B, 0
    x"44",x"40",                                     -- d405 |   inc B
    x"ec",x"40",x"1c",x"f8",x"01",x"06",x"fc",       -- d407 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d40e |   mov B, 0
    x"48",x"40",                                     -- d411 |   dec B
    x"ec",x"40",x"e0",x"f8",x"ff",x"ff",x"fa",x"fb", -- d413 |   jne B, 0xffff, ${fail}:rel + PC
                                                     --      | jmp_test:
    x"e8",x"e0",x"1c",x"f8",x"ab",x"ff",x"2b",x"f2",x"fb", -- d41b |   jeq 0xffab, 0x2b, ${fail}:rel + PC
    x"ec",x"e0",x"1c",x"f8",x"ab",x"ff",x"2b",x"0d",x"00", -- d424 |   jne 0xffab, 0x2b, ${_L_test_jmp_1}:rel + PC
    x"58",x"f8",x"e0",x"fb",                         -- d42d |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_1:
    x"f0",x"e0",x"1c",x"f8",x"ab",x"ff",x"2b",x"dc",x"fb", -- d431 |   jlt 0xffab, 0x2b, ${fail}:rel + PC
    x"f4",x"e0",x"1c",x"f8",x"ab",x"ff",x"2b",x"d3",x"fb", -- d43a |   jle 0xffab, 0x2b, ${fail}:rel + PC
    x"f8",x"e0",x"1c",x"f8",x"ab",x"ff",x"2b",x"0d",x"00", -- d443 |   jgt 0xffab, 0x2b, ${_L_test_jmp_2}:rel + PC
    x"58",x"f8",x"c1",x"fb",                         -- d44c |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_2:
    x"fc",x"e0",x"1c",x"f8",x"ab",x"ff",x"2b",x"0d",x"00", -- d450 |   jge 0xffab, 0x2b, ${_L_test_jmp_3}:rel + PC
    x"58",x"f8",x"b4",x"fb",                         -- d459 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_3:
    x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             -- d45d |   cmp 0xffab, 0x2b
    x"68",x"f8",x"aa",x"fb",                         -- d463 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d467 |   jne ${_L_test_jmp_4}:rel + PC
    x"58",x"f8",x"a2",x"fb",                         -- d46b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_4:
    x"70",x"f8",x"9e",x"fb",                         -- d46f |   jlt ${fail}:rel + PC
    x"74",x"f8",x"9a",x"fb",                         -- d473 |   jle ${fail}:rel + PC
    x"78",x"f8",x"08",x"00",                         -- d477 |   jgt ${_L_test_jmp_5}:rel + PC
    x"58",x"f8",x"92",x"fb",                         -- d47b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_5:
    x"7c",x"f8",x"08",x"00",                         -- d47f |   jge ${_L_test_jmp_6}:rel + PC
    x"58",x"f8",x"8a",x"fb",                         -- d483 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_6:
    x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             -- d487 |   icmp 0xffab, 0x2b
    x"68",x"f8",x"80",x"fb",                         -- d48d |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d491 |   jne ${_L_test_jmp_7}:rel + PC
    x"58",x"f8",x"78",x"fb",                         -- d495 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_7:
    x"70",x"f8",x"08",x"00",                         -- d499 |   jlt ${_L_test_jmp_8}:rel + PC
    x"58",x"f8",x"70",x"fb",                         -- d49d |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_8:
    x"74",x"f8",x"08",x"00",                         -- d4a1 |   jle ${_L_test_jmp_9}:rel + PC
    x"58",x"f8",x"68",x"fb",                         -- d4a5 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_9:
    x"78",x"f8",x"64",x"fb",                         -- d4a9 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"60",x"fb",                         -- d4ad |   jge ${fail}:rel + PC
    x"e8",x"1c",x"e0",x"f8",x"2b",x"ab",x"ff",x"5c",x"fb", -- d4b1 |   jeq 0x2b, 0xffab, ${fail}:rel + PC
    x"ec",x"1c",x"e0",x"f8",x"2b",x"ab",x"ff",x"0d",x"00", -- d4ba |   jne 0x2b, 0xffab, ${_L_test_jmp_10}:rel + PC
    x"58",x"f8",x"4a",x"fb",                         -- d4c3 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_10:
    x"f0",x"1c",x"e0",x"f8",x"2b",x"ab",x"ff",x"0d",x"00", -- d4c7 |   jlt 0x2b, 0xffab, ${_L_test_jmp_11}:rel + PC
    x"58",x"f8",x"3d",x"fb",                         -- d4d0 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_11:
    x"f4",x"1c",x"e0",x"f8",x"2b",x"ab",x"ff",x"0d",x"00", -- d4d4 |   jle 0x2b, 0xffab, ${_L_test_jmp_12}:rel + PC
    x"58",x"f8",x"30",x"fb",                         -- d4dd |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_12:
    x"f8",x"1c",x"e0",x"f8",x"2b",x"ab",x"ff",x"2c",x"fb", -- d4e1 |   jgt 0x2b, 0xffab, ${fail}:rel + PC
    x"fc",x"1c",x"e0",x"f8",x"2b",x"ab",x"ff",x"23",x"fb", -- d4ea |   jge 0x2b, 0xffab, ${fail}:rel + PC
    x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             -- d4f3 |   cmp 0x2b, 0xffab
    x"68",x"f8",x"14",x"fb",                         -- d4f9 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d4fd |   jne ${_L_test_jmp_13}:rel + PC
    x"58",x"f8",x"0c",x"fb",                         -- d501 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_13:
    x"70",x"f8",x"08",x"00",                         -- d505 |   jlt ${_L_test_jmp_14}:rel + PC
    x"58",x"f8",x"04",x"fb",                         -- d509 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_14:
    x"74",x"f8",x"08",x"00",                         -- d50d |   jle ${_L_test_jmp_15}:rel + PC
    x"58",x"f8",x"fc",x"fa",                         -- d511 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_15:
    x"78",x"f8",x"f8",x"fa",                         -- d515 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"f4",x"fa",                         -- d519 |   jge ${fail}:rel + PC
    x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             -- d51d |   icmp 0x2b, 0xffab
    x"68",x"f8",x"ea",x"fa",                         -- d523 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d527 |   jne ${_L_test_jmp_16}:rel + PC
    x"58",x"f8",x"e2",x"fa",                         -- d52b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_16:
    x"70",x"f8",x"de",x"fa",                         -- d52f |   jlt ${fail}:rel + PC
    x"74",x"f8",x"da",x"fa",                         -- d533 |   jle ${fail}:rel + PC
    x"78",x"f8",x"08",x"00",                         -- d537 |   jgt ${_L_test_jmp_17}:rel + PC
    x"58",x"f8",x"d2",x"fa",                         -- d53b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_17:
    x"7c",x"f8",x"08",x"00",                         -- d53f |   jge ${_L_test_jmp_18}:rel + PC
    x"58",x"f8",x"ca",x"fa",                         -- d543 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_18:
    x"e8",x"e0",x"e0",x"f8",x"ab",x"ff",x"ab",x"ff",x"0e",x"00", -- d547 |   jeq 0xffab, 0xffab, ${_L_test_jmp_19}:rel + PC
    x"58",x"f8",x"bc",x"fa",                         -- d551 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_19:
    x"ec",x"e0",x"e0",x"f8",x"ab",x"ff",x"ab",x"ff",x"b8",x"fa", -- d555 |   jne 0xffab, 0xffab, ${fail}:rel + PC
    x"f0",x"e0",x"e0",x"f8",x"ab",x"ff",x"ab",x"ff",x"ae",x"fa", -- d55f |   jlt 0xffab, 0xffab, ${fail}:rel + PC
    x"f4",x"e0",x"e0",x"f8",x"ab",x"ff",x"ab",x"ff",x"0e",x"00", -- d569 |   jle 0xffab, 0xffab, ${_L_test_jmp_20}:rel + PC
    x"58",x"f8",x"9a",x"fa",                         -- d573 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_20:
    x"f8",x"e0",x"e0",x"f8",x"ab",x"ff",x"ab",x"ff",x"96",x"fa", -- d577 |   jgt 0xffab, 0xffab, ${fail}:rel + PC
    x"fc",x"e0",x"e0",x"f8",x"ab",x"ff",x"ab",x"ff",x"0e",x"00", -- d581 |   jge 0xffab, 0xffab, ${_L_test_jmp_21}:rel + PC
    x"58",x"f8",x"82",x"fa",                         -- d58b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_21:
    x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       -- d58f |   cmp 0xffab, 0xffab
    x"68",x"f8",x"08",x"00",                         -- d596 |   jeq ${_L_test_jmp_22}:rel + PC
    x"58",x"f8",x"73",x"fa",                         -- d59a |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_22:
    x"6c",x"f8",x"6f",x"fa",                         -- d59e |   jne ${fail}:rel + PC
    x"70",x"f8",x"6b",x"fa",                         -- d5a2 |   jlt ${fail}:rel + PC
    x"74",x"f8",x"08",x"00",                         -- d5a6 |   jle ${_L_test_jmp_23}:rel + PC
    x"58",x"f8",x"63",x"fa",                         -- d5aa |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_23:
    x"78",x"f8",x"5f",x"fa",                         -- d5ae |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"08",x"00",                         -- d5b2 |   jge ${_L_test_jmp_24}:rel + PC
    x"58",x"f8",x"57",x"fa",                         -- d5b6 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_24:
    x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       -- d5ba |   icmp 0xffab, 0xffab
    x"68",x"f8",x"08",x"00",                         -- d5c1 |   jeq ${_L_test_jmp_25}:rel + PC
    x"58",x"f8",x"48",x"fa",                         -- d5c5 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_25:
    x"6c",x"f8",x"44",x"fa",                         -- d5c9 |   jne ${fail}:rel + PC
    x"70",x"f8",x"40",x"fa",                         -- d5cd |   jlt ${fail}:rel + PC
    x"74",x"f8",x"08",x"00",                         -- d5d1 |   jle ${_L_test_jmp_26}:rel + PC
    x"58",x"f8",x"38",x"fa",                         -- d5d5 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_26:
    x"78",x"f8",x"34",x"fa",                         -- d5d9 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"08",x"00",                         -- d5dd |   jge ${_L_test_jmp_27}:rel + PC
    x"58",x"f8",x"2c",x"fa",                         -- d5e1 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_27:
                                                     --      | test_uop_get_arg:
    x"60",x"a0",x"e0",x"00",x"70",                   -- d5e5 |   mov SP, 0x7000
    x"60",x"20",x"e0",x"aa",x"00",                   -- d5ea |   mov A, 0xaa
    x"60",x"40",x"e0",x"bb",x"00",                   -- d5ef |   mov B, 0xbb
    x"60",x"fe",x"e0",x"55",x"01",                   -- d5f4 |   mov G, 0x155
    x"b6",x"e0",x"1c",x"fe",x"39",x"30",x"85",       -- d5f9 |   xor [0x3039], -123, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d0",x"fe",x"0d",x"fa", -- d600 |   jne [0x3039], 0xfed0, ${fail}:rel + PC
    x"ae",x"3e",x"fe",x"21",x"f6",                   -- d60a |   and [A*4 + -10], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"54",x"01",x"fe",x"f9", -- d60f |   jne [0x29e], 0x154, ${fail}:rel + PC
    x"86",x"21",x"e4",x"3e",x"de",x"fa",x"f6",       -- d619 |   sub [A*2], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ea",x"f8",x"ed",x"f9", -- d620 |   jne [0x154], 0xf8ea, ${fail}:rel + PC
    x"a6",x"e0",x"20",x"21",x"39",x"30",             -- d62a |   ishr [0x3039], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"0a",x"dd",x"f9", -- d630 |   jne [0x3039], 0xa, ${fail}:rel + PC
    x"aa",x"fe",x"2a",x"3e",x"f6",                   -- d639 |   shl [G], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"c0",x"cf",x"f9", -- d63e |   jne [0x155], 0xc000, ${fail}:rel + PC
    x"b2",x"fe",x"1c",x"fe",x"85",                   -- d648 |   or [G], -123, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"d5",x"ff",x"c0",x"f9", -- d64d |   jne [0x155], 0xffd5, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"20",x"85",                   -- d657 |   mul [A*4 + B], -123, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"52",x"ae",x"b1",x"f9", -- d65c |   jne [0x363], 0xae52, ${fail}:rel + PC
    x"a6",x"e0",x"e0",x"2a",x"39",x"30",x"39",x"30", -- d666 |   ishr [0x3039], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"07",x"06",x"9f",x"f9", -- d66e |   jne [0x3039], 0x607, ${fail}:rel + PC
    x"a2",x"21",x"e4",x"21",x"de",x"fa",             -- d678 |   shr [A*2], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b8",x"0f",x"8f",x"f9", -- d67e |   jne [0x154], 0xfb8, ${fail}:rel + PC
    x"82",x"21",x"fe",x"fe",                         -- d688 |   add [A*2], G, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"02",x"81",x"f9", -- d68c |   jne [0x154], 0x2aa, ${fail}:rel + PC
    x"a6",x"fe",x"e4",x"20",x"de",x"fa",             -- d696 |   ishr [G], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"fe",x"ff",x"71",x"f9", -- d69c |   jne [0x155], 0xfffe, ${fail}:rel + PC
    x"82",x"e0",x"e4",x"2a",x"39",x"30",x"de",x"fa", -- d6a6 |   add [0x3039], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"eb",x"fe",x"5f",x"f9", -- d6ae |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
    x"a6",x"20",x"20",x"20",                         -- d6b8 |   ishr [A], A, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"51",x"f9", -- d6bc |   jne [0xaa], 0, ${fail}:rel + PC
    x"82",x"fe",x"2a",x"20",                         -- d6c4 |   add [G], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0d",x"04",x"45",x"f9", -- d6c8 |   jne [0x155], 0x40d, ${fail}:rel + PC
    x"b6",x"fe",x"fe",x"fe",                         -- d6d2 |   xor [G], G, G
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"37",x"f9", -- d6d6 |   jne [0x155], 0, ${fail}:rel + PC
    x"aa",x"21",x"fe",x"21",                         -- d6de |   shl [A*2], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"50",x"15",x"2b",x"f9", -- d6e2 |   jne [0x154], 0x1550, ${fail}:rel + PC
    x"a6",x"fe",x"e0",x"21",x"39",x"30",             -- d6ec |   ishr [G], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"03",x"03",x"1b",x"f9", -- d6f2 |   jne [0x155], 0x303, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"e4",x"de",x"fa",             -- d6fc |   and [A*2], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"03",x"0b",x"f9", -- d702 |   jne [0x154], 0x300, ${fail}:rel + PC
    x"82",x"20",x"3e",x"3e",x"f6",x"f6",             -- d70c |   add [A], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"3c",x"05",x"fb",x"f8", -- d712 |   jne [0xaa], 0x53c, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"1c",x"39",x"30",x"85",       -- d71c |   or [0x3039], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d5",x"ff",x"ea",x"f8", -- d723 |   jne [0x3039], 0xffd5, ${fail}:rel + PC
    x"82",x"e0",x"fe",x"fe",x"39",x"30",             -- d72d |   add [0x3039], G, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"02",x"da",x"f8", -- d733 |   jne [0x3039], 0x2aa, ${fail}:rel + PC
    x"ae",x"fe",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- d73d |   and [G], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"08",x"30",x"c8",x"f8", -- d745 |   jne [0x155], 0x3008, ${fail}:rel + PC
    x"8e",x"e0",x"2a",x"3e",x"39",x"30",x"f6",       -- d74f |   imul [0x3039], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"1a",x"dd",x"b7",x"f8", -- d756 |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
    x"b2",x"21",x"e0",x"20",x"39",x"30",             -- d760 |   or [A*2], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"bb",x"30",x"a7",x"f8", -- d766 |   jne [0x154], 0x30bb, ${fail}:rel + PC
    x"8e",x"21",x"3e",x"21",x"f6",                   -- d770 |   imul [A*2], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"d8",x"79",x"98",x"f8", -- d775 |   jne [0x154], 0x79d8, ${fail}:rel + PC
    x"82",x"3e",x"1c",x"2a",x"f6",x"85",             -- d77f |   add [A*4 + -10], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e8",x"02",x"88",x"f8", -- d785 |   jne [0x29e], 0x2e8, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"21",x"de",x"fa",             -- d78f |   sub [G], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"34",x"fa",x"78",x"f8", -- d795 |   jne [0x155], 0xfa34, ${fail}:rel + PC
    x"b2",x"2a",x"e4",x"21",x"de",x"fa",             -- d79f |   or [A*4 + B], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"dc",x"fb",x"68",x"f8", -- d7a5 |   jne [0x363], 0xfbdc, ${fail}:rel + PC
    x"ae",x"21",x"21",x"20",                         -- d7af |   and [A*2], A*2, A
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"5a",x"f8", -- d7b3 |   jne [0x154], 0, ${fail}:rel + PC
    x"86",x"2a",x"2a",x"fe",                         -- d7bb |   sub [A*4 + B], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"0e",x"02",x"4e",x"f8", -- d7bf |   jne [0x363], 0x20e, ${fail}:rel + PC
    x"82",x"3e",x"3e",x"20",x"f6",x"f6",             -- d7c9 |   add [A*4 + -10], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"48",x"03",x"3e",x"f8", -- d7cf |   jne [0x29e], 0x348, ${fail}:rel + PC
    x"86",x"21",x"e0",x"e0",x"39",x"30",x"39",x"30", -- d7d9 |   sub [A*2], 0x3039, 0x3039
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"2c",x"f8", -- d7e1 |   jne [0x154], 0, ${fail}:rel + PC
    x"a2",x"20",x"1c",x"fe",x"85",                   -- d7e9 |   shr [A], -123, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"fc",x"07",x"1f",x"f8", -- d7ee |   jne [0xaa], 0x7fc, ${fail}:rel + PC
    x"aa",x"2a",x"1c",x"2a",x"85",                   -- d7f8 |   shl [A*4 + B], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"28",x"fc",x"10",x"f8", -- d7fd |   jne [0x363], 0xfc28, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"20",                         -- d807 |   or [A*4 + B], A, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"aa",x"00",x"02",x"f8", -- d80b |   jne [0x363], 0xaa, ${fail}:rel + PC
    x"86",x"20",x"20",x"1c",x"85",                   -- d815 |   sub [A], A, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"25",x"01",x"f3",x"f7", -- d81a |   jne [0xaa], 0x125, ${fail}:rel + PC
    x"a6",x"3e",x"e4",x"21",x"f6",x"de",x"fa",       -- d824 |   ishr [A*4 + -10], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b8",x"ff",x"e2",x"f7", -- d82b |   jne [0x29e], 0xffb8, ${fail}:rel + PC
    x"86",x"20",x"e0",x"e0",x"39",x"30",x"39",x"30", -- d835 |   sub [A], 0x3039, 0x3039
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"d0",x"f7", -- d83d |   jne [0xaa], 0, ${fail}:rel + PC
    x"82",x"fe",x"e0",x"e0",x"39",x"30",x"39",x"30", -- d845 |   add [G], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"72",x"60",x"c0",x"f7", -- d84d |   jne [0x155], 0x6072, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- d857 |   shr [A*4 + B], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"fb",x"00",x"ae",x"f7", -- d85f |   jne [0x363], 0xfb, ${fail}:rel + PC
    x"8e",x"20",x"20",x"fe",                         -- d869 |   imul [A], A, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"72",x"e2",x"a0",x"f7", -- d86d |   jne [0xaa], 0xe272, ${fail}:rel + PC
    x"a2",x"21",x"e4",x"2a",x"de",x"fa",             -- d877 |   shr [A*2], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"71",x"1f",x"90",x"f7", -- d87d |   jne [0x154], 0x1f71, ${fail}:rel + PC
    x"a2",x"2a",x"2a",x"1c",x"85",                   -- d887 |   shr [A*4 + B], A*4 + B, -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"1b",x"81",x"f7", -- d88c |   jne [0x363], 0x1b, ${fail}:rel + PC
    x"a2",x"20",x"21",x"2a",                         -- d895 |   shr [A], A*2, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"2a",x"74",x"f7", -- d899 |   jne [0xaa], 0x2a, ${fail}:rel + PC
    x"ae",x"e0",x"2a",x"20",x"39",x"30",             -- d8a2 |   and [0x3039], A*4 + B, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"22",x"65",x"f7", -- d8a8 |   jne [0x3039], 0x22, ${fail}:rel + PC
    x"a2",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"39",x"30", -- d8b1 |   shr [0x3039], 0x3039, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"18",x"52",x"f7", -- d8bb |   jne [0x3039], 0x18, ${fail}:rel + PC
    x"8a",x"20",x"fe",x"3e",x"f6",                   -- d8c4 |   mul [A], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"76",x"7c",x"44",x"f7", -- d8c9 |   jne [0xaa], 0x7c76, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"2a",x"39",x"30",             -- d8d3 |   add [A*4 + B], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"9c",x"33",x"34",x"f7", -- d8d9 |   jne [0x363], 0x339c, ${fail}:rel + PC
    x"8e",x"fe",x"3e",x"2a",x"f6",                   -- d8e3 |   imul [G], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"1a",x"dd",x"25",x"f7", -- d8e8 |   jne [0x155], 0xdd1a, ${fail}:rel + PC
    x"aa",x"20",x"21",x"e0",x"39",x"30",             -- d8f2 |   shl [A], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"a8",x"15",x"f7", -- d8f8 |   jne [0xaa], 0xa800, ${fail}:rel + PC
    x"82",x"21",x"fe",x"20",                         -- d902 |   add [A*2], G, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"01",x"07",x"f7", -- d906 |   jne [0x154], 0x1ff, ${fail}:rel + PC
    x"82",x"2a",x"2a",x"21",                         -- d910 |   add [A*4 + B], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"b7",x"04",x"f9",x"f6", -- d914 |   jne [0x363], 0x4b7, ${fail}:rel + PC
    x"a2",x"20",x"fe",x"e4",x"de",x"fa",             -- d91e |   shr [A], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"01",x"e9",x"f6", -- d924 |   jne [0xaa], 0x1, ${fail}:rel + PC
    x"82",x"fe",x"1c",x"20",x"85",                   -- d92d |   add [G], -123, A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"2f",x"db",x"f6", -- d932 |   jne [0x155], 0x2f, ${fail}:rel + PC
    x"8e",x"3e",x"fe",x"e0",x"f6",x"39",x"30",       -- d93b |   imul [A*4 + -10], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ed",x"3b",x"cb",x"f6", -- d942 |   jne [0x29e], 0x3bed, ${fail}:rel + PC
    x"8a",x"fe",x"e4",x"2a",x"de",x"fa",             -- d94c |   mul [G], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"98",x"dd",x"bb",x"f6", -- d952 |   jne [0x155], 0xdd98, ${fail}:rel + PC
    x"a2",x"fe",x"fe",x"20",                         -- d95c |   shr [G], G, A
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"ad",x"f6", -- d960 |   jne [0x155], 0, ${fail}:rel + PC
    x"b2",x"21",x"20",x"20",                         -- d968 |   or [A*2], A, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"00",x"a1",x"f6", -- d96c |   jne [0x154], 0xaa, ${fail}:rel + PC
    x"b2",x"3e",x"1c",x"21",x"f6",x"85",             -- d976 |   or [A*4 + -10], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"d5",x"ff",x"91",x"f6", -- d97c |   jne [0x29e], 0xffd5, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"1c",x"85",x"85",             -- d986 |   mul [A*4 + B], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"19",x"3b",x"81",x"f6", -- d98c |   jne [0x363], 0x3b19, ${fail}:rel + PC
    x"8a",x"e0",x"e4",x"21",x"39",x"30",x"de",x"fa", -- d996 |   mul [0x3039], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"a0",x"10",x"6f",x"f6", -- d99e |   jne [0x3039], 0x10a0, ${fail}:rel + PC
    x"86",x"fe",x"20",x"3e",x"f6",                   -- d9a8 |   sub [G], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0c",x"fe",x"60",x"f6", -- d9ad |   jne [0x155], 0xfe0c, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"21",                         -- d9b7 |   shl [A], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"30",x"36",x"52",x"f6", -- d9bb |   jne [0xaa], 0x3630, ${fail}:rel + PC
    x"b6",x"21",x"1c",x"2a",x"85",                   -- d9c5 |   xor [A*2], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"e6",x"fc",x"43",x"f6", -- d9ca |   jne [0x154], 0xfce6, ${fail}:rel + PC
    x"86",x"2a",x"3e",x"1c",x"f6",x"85",             -- d9d4 |   sub [A*4 + B], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"19",x"03",x"33",x"f6", -- d9da |   jne [0x363], 0x319, ${fail}:rel + PC
    x"86",x"e0",x"e0",x"e4",x"39",x"30",x"39",x"30",x"de",x"fa", -- d9e4 |   sub [0x3039], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"b1",x"34",x"1f",x"f6", -- d9ee |   jne [0x3039], 0x34b1, ${fail}:rel + PC
    x"ae",x"fe",x"2a",x"e4",x"de",x"fa",             -- d9f8 |   and [G], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"03",x"0f",x"f6", -- d9fe |   jne [0x155], 0x300, ${fail}:rel + PC
    x"aa",x"20",x"3e",x"fe",x"f6",                   -- da08 |   shl [A], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"c0",x"53",x"00",x"f6", -- da0d |   jne [0xaa], 0x53c0, ${fail}:rel + PC
    x"a6",x"fe",x"fe",x"e4",x"de",x"fa",             -- da17 |   ishr [G], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"01",x"f0",x"f5", -- da1d |   jne [0x155], 0x1, ${fail}:rel + PC
    x"ae",x"21",x"e0",x"2a",x"39",x"30",             -- da26 |   and [A*2], 0x3039, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"21",x"e1",x"f5", -- da2c |   jne [0x154], 0x21, ${fail}:rel + PC
    x"a6",x"21",x"21",x"1c",x"85",                   -- da35 |   ishr [A*2], A*2, -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"0a",x"d3",x"f5", -- da3a |   jne [0x154], 0xa, ${fail}:rel + PC
    x"b6",x"fe",x"21",x"e0",x"39",x"30",             -- da43 |   xor [G], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"6d",x"31",x"c4",x"f5", -- da49 |   jne [0x155], 0x316d, ${fail}:rel + PC
    x"86",x"2a",x"3e",x"2a",x"f6",                   -- da53 |   sub [A*4 + B], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"3b",x"ff",x"b5",x"f5", -- da58 |   jne [0x363], 0xff3b, ${fail}:rel + PC
    x"b2",x"e0",x"fe",x"1c",x"39",x"30",x"85",       -- da62 |   or [0x3039], G, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d5",x"ff",x"a4",x"f5", -- da69 |   jne [0x3039], 0xffd5, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"20",x"f6",                   -- da73 |   shl [A*4 + B], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"78",x"95",x"f5", -- da78 |   jne [0x363], 0x7800, ${fail}:rel + PC
    x"86",x"e0",x"21",x"20",x"39",x"30",             -- da82 |   sub [0x3039], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"00",x"85",x"f5", -- da88 |   jne [0x3039], 0xaa, ${fail}:rel + PC
    x"b6",x"e0",x"2a",x"21",x"39",x"30",             -- da92 |   xor [0x3039], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"37",x"02",x"75",x"f5", -- da98 |   jne [0x3039], 0x237, ${fail}:rel + PC
    x"ae",x"2a",x"e0",x"1c",x"39",x"30",x"85",       -- daa2 |   and [A*4 + B], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"01",x"30",x"64",x"f5", -- daa9 |   jne [0x363], 0x3001, ${fail}:rel + PC
    x"8e",x"fe",x"2a",x"e0",x"39",x"30",             -- dab3 |   imul [G], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0b",x"51",x"54",x"f5", -- dab9 |   jne [0x155], 0x510b, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"fe",                         -- dac3 |   or [A*4 + B], A, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ff",x"01",x"46",x"f5", -- dac7 |   jne [0x363], 0x1ff, ${fail}:rel + PC
    x"a6",x"3e",x"e0",x"20",x"f6",x"39",x"30",       -- dad1 |   ishr [A*4 + -10], 0x3039, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"0c",x"35",x"f5", -- dad8 |   jne [0x29e], 0xc, ${fail}:rel + PC
    x"aa",x"e0",x"e4",x"e4",x"39",x"30",x"de",x"fa",x"de",x"fa", -- dae1 |   shl [0x3039], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"88",x"22",x"f5", -- daeb |   jne [0x3039], 0x8800, ${fail}:rel + PC
    x"aa",x"20",x"e0",x"fe",x"39",x"30",             -- daf5 |   shl [A], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"20",x"07",x"12",x"f5", -- dafb |   jne [0xaa], 0x720, ${fail}:rel + PC
    x"b6",x"fe",x"3e",x"21",x"f6",                   -- db05 |   xor [G], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"ca",x"03",x"03",x"f5", -- db0a |   jne [0x155], 0x3ca, ${fail}:rel + PC
    x"b2",x"2a",x"fe",x"1c",x"85",                   -- db14 |   or [A*4 + B], G, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d5",x"ff",x"f4",x"f4", -- db19 |   jne [0x363], 0xffd5, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"e0",x"f6",x"85",x"39",x"30", -- db23 |   sub [A*4 + -10], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"4c",x"cf",x"e2",x"f4", -- db2b |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
    x"aa",x"21",x"21",x"21",                         -- db35 |   shl [A*2], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"40",x"15",x"d4",x"f4", -- db39 |   jne [0x154], 0x1540, ${fail}:rel + PC
    x"86",x"e0",x"e4",x"e0",x"39",x"30",x"de",x"fa",x"39",x"30", -- db43 |   sub [0x3039], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"4f",x"cb",x"c0",x"f4", -- db4d |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
    x"a2",x"21",x"e0",x"1c",x"39",x"30",x"85",       -- db57 |   shr [A*2], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"81",x"01",x"af",x"f4", -- db5e |   jne [0x154], 0x181, ${fail}:rel + PC
    x"a6",x"e0",x"e4",x"20",x"39",x"30",x"de",x"fa", -- db68 |   ishr [0x3039], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"fe",x"ff",x"9d",x"f4", -- db70 |   jne [0x3039], 0xfffe, ${fail}:rel + PC
    x"b6",x"3e",x"e4",x"e0",x"f6",x"de",x"fa",x"39",x"30", -- db7a |   xor [A*4 + -10], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b1",x"cb",x"8a",x"f4", -- db83 |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
    x"86",x"3e",x"21",x"3e",x"f6",x"f6",             -- db8d |   sub [A*4 + -10], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b6",x"fe",x"7a",x"f4", -- db93 |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
    x"8e",x"fe",x"1c",x"3e",x"85",x"f6",             -- db9d |   imul [G], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"16",x"be",x"6a",x"f4", -- dba3 |   jne [0x155], 0xbe16, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"2a",                         -- dbad |   shl [A], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"18",x"1b",x"5c",x"f4", -- dbb1 |   jne [0xaa], 0x1b18, ${fail}:rel + PC
    x"b6",x"e0",x"21",x"2a",x"39",x"30",             -- dbbb |   xor [0x3039], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"37",x"02",x"4c",x"f4", -- dbc1 |   jne [0x3039], 0x237, ${fail}:rel + PC
    x"82",x"21",x"21",x"e0",x"39",x"30",             -- dbcb |   add [A*2], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"8d",x"31",x"3c",x"f4", -- dbd1 |   jne [0x154], 0x318d, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"20",                         -- dbdb |   and [A*2], A*4 + B, A
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"22",x"2e",x"f4", -- dbdf |   jne [0x154], 0x22, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"e4",x"de",x"fa",             -- dbe8 |   shl [A], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"63",x"1f",x"f4", -- dbee |   jne [0xaa], 0x6300, ${fail}:rel + PC
    x"ae",x"2a",x"fe",x"20",                         -- dbf8 |   and [A*4 + B], G, A
    x"ee",x"e0",x"00",x"f8",x"63",x"03",x"11",x"f4", -- dbfc |   jne [0x363], 0, ${fail}:rel + PC
    x"b6",x"fe",x"21",x"1c",x"85",                   -- dc04 |   xor [G], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"d1",x"fe",x"04",x"f4", -- dc09 |   jne [0x155], 0xfed1, ${fail}:rel + PC
    x"ae",x"e0",x"fe",x"21",x"39",x"30",             -- dc13 |   and [0x3039], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"f4",x"f3", -- dc19 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"b2",x"3e",x"e0",x"2a",x"f6",x"39",x"30",       -- dc23 |   or [A*4 + -10], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"7b",x"33",x"e3",x"f3", -- dc2a |   jne [0x29e], 0x337b, ${fail}:rel + PC
    x"b6",x"fe",x"e4",x"3e",x"de",x"fa",x"f6",       -- dc34 |   xor [G], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"16",x"f9",x"d2",x"f3", -- dc3b |   jne [0x155], 0xf916, ${fail}:rel + PC
    x"8e",x"2a",x"21",x"2a",                         -- dc45 |   imul [A*4 + B], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"7c",x"7f",x"c4",x"f3", -- dc49 |   jne [0x363], 0x7f7c, ${fail}:rel + PC
    x"a6",x"fe",x"21",x"fe",                         -- dc53 |   ishr [G], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"0a",x"b6",x"f3", -- dc57 |   jne [0x155], 0xa, ${fail}:rel + PC
    x"8a",x"21",x"1c",x"1c",x"85",x"85",             -- dc60 |   mul [A*2], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"19",x"3b",x"a7",x"f3", -- dc66 |   jne [0x154], 0x3b19, ${fail}:rel + PC
    x"8e",x"2a",x"e4",x"20",x"de",x"fa",             -- dc70 |   imul [A*4 + B], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"50",x"08",x"97",x"f3", -- dc76 |   jne [0x363], 0x850, ${fail}:rel + PC
    x"a2",x"3e",x"3e",x"3e",x"f6",x"f6",x"f6",       -- dc80 |   shr [A*4 + -10], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"9e",x"02",x"86",x"f3", -- dc87 |   jne [0x29e], 0, ${fail}:rel + PC
    x"8a",x"20",x"1c",x"e4",x"85",x"de",x"fa",       -- dc8f |   mul [A], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a8",x"25",x"77",x"f3", -- dc96 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
    x"a6",x"3e",x"20",x"21",x"f6",                   -- dca0 |   ishr [A*4 + -10], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"0a",x"68",x"f3", -- dca5 |   jne [0x29e], 0xa, ${fail}:rel + PC
    x"b2",x"3e",x"20",x"20",x"f6",                   -- dcae |   or [A*4 + -10], A, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"aa",x"00",x"5a",x"f3", -- dcb3 |   jne [0x29e], 0xaa, ${fail}:rel + PC
    x"82",x"e0",x"fe",x"e0",x"39",x"30",x"39",x"30", -- dcbd |   add [0x3039], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"8e",x"31",x"48",x"f3", -- dcc5 |   jne [0x3039], 0x318e, ${fail}:rel + PC
    x"8e",x"3e",x"e0",x"3e",x"f6",x"39",x"30",x"f6", -- dccf |   imul [A*4 + -10], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"2e",x"35",x"36",x"f3", -- dcd7 |   jne [0x29e], 0x352e, ${fail}:rel + PC
    x"a6",x"fe",x"fe",x"21",                         -- dce1 |   ishr [G], G, A*2
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"15",x"28",x"f3", -- dce5 |   jne [0x155], 0x15, ${fail}:rel + PC
    x"8e",x"20",x"e4",x"3e",x"de",x"fa",x"f6",       -- dcee |   imul [A], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"f0",x"4d",x"18",x"f3", -- dcf5 |   jne [0xaa], 0x4df0, ${fail}:rel + PC
    x"a6",x"fe",x"20",x"fe",                         -- dcff |   ishr [G], A, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"05",x"0a",x"f3", -- dd03 |   jne [0x155], 0x5, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"3e",x"39",x"30",x"f6",       -- dd0c |   add [A*4 + B], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d7",x"32",x"fa",x"f2", -- dd13 |   jne [0x363], 0x32d7, ${fail}:rel + PC
    x"ae",x"3e",x"2a",x"e4",x"f6",x"de",x"fa",       -- dd1d |   and [A*4 + -10], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"03",x"e9",x"f2", -- dd24 |   jne [0x29e], 0x300, ${fail}:rel + PC
    x"8e",x"20",x"1c",x"2a",x"85",                   -- dd2e |   imul [A], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"6f",x"5f",x"da",x"f2", -- dd33 |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
    x"a2",x"fe",x"3e",x"e4",x"f6",x"de",x"fa",       -- dd3d |   shr [G], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"02",x"c9",x"f2", -- dd44 |   jne [0x155], 0x2, ${fail}:rel + PC
    x"b2",x"2a",x"e0",x"20",x"39",x"30",             -- dd4d |   or [A*4 + B], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"bb",x"30",x"ba",x"f2", -- dd53 |   jne [0x363], 0x30bb, ${fail}:rel + PC
    x"b6",x"2a",x"e0",x"fe",x"39",x"30",             -- dd5d |   xor [A*4 + B], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"6c",x"31",x"aa",x"f2", -- dd63 |   jne [0x363], 0x316c, ${fail}:rel + PC
    x"8e",x"20",x"20",x"e0",x"39",x"30",             -- dd6d |   imul [A], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"da",x"05",x"9a",x"f2", -- dd73 |   jne [0xaa], 0x5da, ${fail}:rel + PC
    x"b2",x"21",x"2a",x"3e",x"f6",                   -- dd7d |   or [A*2], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"03",x"8b",x"f2", -- dd82 |   jne [0x154], 0x3ff, ${fail}:rel + PC
    x"aa",x"fe",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- dd8c |   shl [G], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"10",x"79",x"f2", -- dd94 |   jne [0x155], 0x1000, ${fail}:rel + PC
    x"a6",x"2a",x"e4",x"2a",x"de",x"fa",             -- dd9e |   ishr [A*4 + B], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"71",x"ff",x"69",x"f2", -- dda4 |   jne [0x363], 0xff71, ${fail}:rel + PC
    x"aa",x"3e",x"e4",x"1c",x"f6",x"de",x"fa",x"85", -- ddae |   shl [A*4 + -10], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"71",x"57",x"f2", -- ddb6 |   jne [0x29e], 0x7100, ${fail}:rel + PC
    x"a2",x"3e",x"e4",x"20",x"f6",x"de",x"fa",       -- ddc0 |   shr [A*4 + -10], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"3e",x"46",x"f2", -- ddc7 |   jne [0x29e], 0x3e, ${fail}:rel + PC
    x"8a",x"3e",x"20",x"2a",x"f6",                   -- ddd0 |   mul [A*4 + -10], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"be",x"3f",x"38",x"f2", -- ddd5 |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
    x"b2",x"21",x"3e",x"2a",x"f6",                   -- dddf |   or [A*2], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"03",x"29",x"f2", -- dde4 |   jne [0x154], 0x3ff, ${fail}:rel + PC
    x"8e",x"3e",x"21",x"1c",x"f6",x"85",             -- ddee |   imul [A*4 + -10], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"a4",x"5c",x"19",x"f2", -- ddf4 |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
    x"aa",x"e0",x"3e",x"21",x"39",x"30",x"f6",       -- ddfe |   shl [0x3039], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"e0",x"29",x"08",x"f2", -- de05 |   jne [0x3039], 0x29e0, ${fail}:rel + PC
    x"aa",x"21",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- de0f |   shl [A*2], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"88",x"f6",x"f1", -- de17 |   jne [0x154], 0x8800, ${fail}:rel + PC
    x"82",x"fe",x"21",x"21",                         -- de21 |   add [G], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"a8",x"02",x"e8",x"f1", -- de25 |   jne [0x155], 0x2a8, ${fail}:rel + PC
    x"ae",x"21",x"e4",x"fe",x"de",x"fa",             -- de2f |   and [A*2], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"01",x"d8",x"f1", -- de35 |   jne [0x154], 0x100, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"e0",x"f6",x"39",x"30",x"39",x"30", -- de3f |   and [A*4 + -10], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"39",x"30",x"c5",x"f1", -- de48 |   jne [0x29e], 0x3039, ${fail}:rel + PC
    x"aa",x"3e",x"20",x"1c",x"f6",x"85",             -- de52 |   shl [A*4 + -10], A, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"40",x"15",x"b5",x"f1", -- de58 |   jne [0x29e], 0x1540, ${fail}:rel + PC
    x"ae",x"2a",x"3e",x"e4",x"f6",x"de",x"fa",       -- de62 |   and [A*4 + B], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"88",x"02",x"a4",x"f1", -- de69 |   jne [0x363], 0x288, ${fail}:rel + PC
    x"82",x"fe",x"1c",x"1c",x"85",x"85",             -- de73 |   add [G], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0a",x"ff",x"94",x"f1", -- de79 |   jne [0x155], 0xff0a, ${fail}:rel + PC
    x"8a",x"20",x"20",x"e4",x"de",x"fa",             -- de83 |   mul [A], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"50",x"08",x"84",x"f1", -- de89 |   jne [0xaa], 0x850, ${fail}:rel + PC
    x"b2",x"21",x"2a",x"fe",                         -- de93 |   or [A*2], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"77",x"03",x"76",x"f1", -- de97 |   jne [0x154], 0x377, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- dea1 |   sub [G], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"64",x"f1", -- dea9 |   jne [0x155], 0, ${fail}:rel + PC
    x"a2",x"2a",x"fe",x"e4",x"de",x"fa",             -- deb1 |   shr [A*4 + B], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"56",x"f1", -- deb7 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"86",x"21",x"1c",x"fe",x"85",                   -- dec0 |   sub [A*2], -123, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"30",x"fe",x"48",x"f1", -- dec5 |   jne [0x154], 0xfe30, ${fail}:rel + PC
    x"aa",x"3e",x"21",x"fe",x"f6",                   -- decf |   shl [A*4 + -10], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"80",x"2a",x"39",x"f1", -- ded4 |   jne [0x29e], 0x2a80, ${fail}:rel + PC
    x"aa",x"20",x"1c",x"3e",x"85",x"f6",             -- dede |   shl [A], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"40",x"29",x"f1", -- dee4 |   jne [0xaa], 0x4000, ${fail}:rel + PC
    x"8a",x"3e",x"2a",x"21",x"f6",                   -- deee |   mul [A*4 + -10], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"7c",x"7f",x"1a",x"f1", -- def3 |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
    x"a2",x"20",x"2a",x"fe",                         -- defd |   shr [A], A*4 + B, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"1b",x"0c",x"f1", -- df01 |   jne [0xaa], 0x1b, ${fail}:rel + PC
    x"82",x"20",x"2a",x"e0",x"39",x"30",             -- df0a |   add [A], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9c",x"33",x"fd",x"f0", -- df10 |   jne [0xaa], 0x339c, ${fail}:rel + PC
    x"b6",x"fe",x"e0",x"1c",x"39",x"30",x"85",       -- df1a |   xor [G], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"bc",x"cf",x"ec",x"f0", -- df21 |   jne [0x155], 0xcfbc, ${fail}:rel + PC
    x"86",x"20",x"e4",x"2a",x"de",x"fa",             -- df2b |   sub [A], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"25",x"f8",x"dc",x"f0", -- df31 |   jne [0xaa], 0xf825, ${fail}:rel + PC
    x"a6",x"2a",x"21",x"fe",                         -- df3b |   ishr [A*4 + B], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"0a",x"ce",x"f0", -- df3f |   jne [0x363], 0xa, ${fail}:rel + PC
    x"b2",x"21",x"fe",x"e4",x"de",x"fa",             -- df48 |   or [A*2], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"dd",x"fb",x"bf",x"f0", -- df4e |   jne [0x154], 0xfbdd, ${fail}:rel + PC
    x"8a",x"e0",x"e4",x"fe",x"39",x"30",x"de",x"fa", -- df58 |   mul [0x3039], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"28",x"0c",x"ad",x"f0", -- df60 |   jne [0x3039], 0xc28, ${fail}:rel + PC
    x"8e",x"2a",x"2a",x"e4",x"de",x"fa",             -- df6a |   imul [A*4 + B], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"98",x"dd",x"9d",x"f0", -- df70 |   jne [0x363], 0xdd98, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"fe",x"39",x"30",             -- df7a |   and [0x3039], A, G
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"8d",x"f0", -- df80 |   jne [0x3039], 0, ${fail}:rel + PC
    x"8e",x"fe",x"fe",x"2a",                         -- df88 |   imul [G], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"df",x"82",x"81",x"f0", -- df8c |   jne [0x155], 0x82df, ${fail}:rel + PC
    x"8e",x"3e",x"21",x"21",x"f6",                   -- df96 |   imul [A*4 + -10], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"90",x"c3",x"72",x"f0", -- df9b |   jne [0x29e], 0xc390, ${fail}:rel + PC
    x"b2",x"fe",x"e4",x"1c",x"de",x"fa",x"85",       -- dfa5 |   or [G], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"8d",x"ff",x"61",x"f0", -- dfac |   jne [0x155], 0xff8d, ${fail}:rel + PC
    x"8e",x"2a",x"20",x"3e",x"f6",                   -- dfb6 |   imul [A*4 + B], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ec",x"bc",x"52",x"f0", -- dfbb |   jne [0x363], 0xbcec, ${fail}:rel + PC
    x"a2",x"2a",x"3e",x"e0",x"f6",x"39",x"30",       -- dfc5 |   shr [A*4 + B], A*4 + -10, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"41",x"f0", -- dfcc |   jne [0x363], 0x1, ${fail}:rel + PC
    x"b6",x"2a",x"21",x"e0",x"39",x"30",             -- dfd5 |   xor [A*4 + B], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"6d",x"31",x"32",x"f0", -- dfdb |   jne [0x363], 0x316d, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"e0",x"39",x"30",x"f6",x"39",x"30", -- dfe5 |   shr [0x3039], A*4 + -10, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"01",x"1f",x"f0", -- dfee |   jne [0x3039], 0x1, ${fail}:rel + PC
    x"a2",x"21",x"1c",x"3e",x"85",x"f6",             -- dff7 |   shr [A*2], -123, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"03",x"10",x"f0", -- dffd |   jne [0x154], 0x3, ${fail}:rel + PC
    x"b2",x"21",x"20",x"21",                         -- e006 |   or [A*2], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"fe",x"01",x"03",x"f0", -- e00a |   jne [0x154], 0x1fe, ${fail}:rel + PC
    x"a2",x"fe",x"2a",x"21",                         -- e014 |   shr [G], A*4 + B, A*2
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"36",x"f5",x"ef", -- e018 |   jne [0x155], 0x36, ${fail}:rel + PC
    x"b6",x"e0",x"3e",x"2a",x"39",x"30",x"f6",       -- e021 |   xor [0x3039], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"fd",x"01",x"e5",x"ef", -- e028 |   jne [0x3039], 0x1fd, ${fail}:rel + PC
    x"8a",x"3e",x"e4",x"3e",x"f6",x"de",x"fa",x"f6", -- e032 |   mul [A*4 + -10], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"f0",x"4d",x"d3",x"ef", -- e03a |   jne [0x29e], 0x4df0, ${fail}:rel + PC
    x"8e",x"2a",x"21",x"3e",x"f6",                   -- e044 |   imul [A*4 + B], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d8",x"79",x"c4",x"ef", -- e049 |   jne [0x363], 0x79d8, ${fail}:rel + PC
    x"a2",x"e0",x"e4",x"3e",x"39",x"30",x"de",x"fa",x"f6", -- e053 |   shr [0x3039], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"03",x"b1",x"ef", -- e05c |   jne [0x3039], 0x3, ${fail}:rel + PC
    x"82",x"3e",x"20",x"fe",x"f6",                   -- e065 |   add [A*4 + -10], A, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ff",x"01",x"a3",x"ef", -- e06a |   jne [0x29e], 0x1ff, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- e074 |   shr [A*4 + B], 0xfade + A, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"7d",x"91",x"ef", -- e07c |   jne [0x363], 0x7d, ${fail}:rel + PC
    x"a2",x"3e",x"1c",x"1c",x"f6",x"85",x"85",       -- e085 |   shr [A*4 + -10], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"fc",x"07",x"81",x"ef", -- e08c |   jne [0x29e], 0x7fc, ${fail}:rel + PC
    x"8e",x"20",x"1c",x"e0",x"85",x"39",x"30",       -- e096 |   imul [A], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9d",x"d4",x"70",x"ef", -- e09d |   jne [0xaa], 0xd49d, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"21",x"f6",                   -- e0a7 |   shl [A*4 + B], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"e0",x"29",x"61",x"ef", -- e0ac |   jne [0x363], 0x29e0, ${fail}:rel + PC
    x"b6",x"21",x"e0",x"fe",x"39",x"30",             -- e0b6 |   xor [A*2], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"6c",x"31",x"51",x"ef", -- e0bc |   jne [0x154], 0x316c, ${fail}:rel + PC
    x"b6",x"e0",x"3e",x"3e",x"39",x"30",x"f6",x"f6", -- e0c6 |   xor [0x3039], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"3f",x"ef", -- e0ce |   jne [0x3039], 0, ${fail}:rel + PC
    x"b6",x"20",x"21",x"1c",x"85",                   -- e0d6 |   xor [A], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d1",x"fe",x"32",x"ef", -- e0db |   jne [0xaa], 0xfed1, ${fail}:rel + PC
    x"b6",x"21",x"21",x"fe",                         -- e0e5 |   xor [A*2], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"01",x"24",x"ef", -- e0e9 |   jne [0x154], 0x1, ${fail}:rel + PC
    x"8a",x"fe",x"e0",x"20",x"39",x"30",             -- e0f2 |   mul [G], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"da",x"05",x"15",x"ef", -- e0f8 |   jne [0x155], 0x5da, ${fail}:rel + PC
    x"b6",x"21",x"e0",x"21",x"39",x"30",             -- e102 |   xor [A*2], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"6d",x"31",x"05",x"ef", -- e108 |   jne [0x154], 0x316d, ${fail}:rel + PC
    x"8a",x"21",x"2a",x"e0",x"39",x"30",             -- e112 |   mul [A*2], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"0b",x"51",x"f5",x"ee", -- e118 |   jne [0x154], 0x510b, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"1c",x"f6",x"39",x"30",x"85", -- e122 |   and [A*4 + -10], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"01",x"30",x"e3",x"ee", -- e12a |   jne [0x29e], 0x3001, ${fail}:rel + PC
    x"aa",x"fe",x"21",x"20",                         -- e134 |   shl [G], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"50",x"d5",x"ee", -- e138 |   jne [0x155], 0x5000, ${fail}:rel + PC
    x"ae",x"20",x"e4",x"20",x"de",x"fa",             -- e142 |   and [A], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"88",x"00",x"c5",x"ee", -- e148 |   jne [0xaa], 0x88, ${fail}:rel + PC
    x"aa",x"21",x"3e",x"e4",x"f6",x"de",x"fa",       -- e152 |   shl [A*2], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"9e",x"b4",x"ee", -- e159 |   jne [0x154], 0x9e00, ${fail}:rel + PC
    x"b6",x"e0",x"e0",x"1c",x"39",x"30",x"39",x"30",x"85", -- e163 |   xor [0x3039], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"bc",x"cf",x"a1",x"ee", -- e16c |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
    x"8a",x"3e",x"3e",x"1c",x"f6",x"f6",x"85",       -- e176 |   mul [A*4 + -10], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"16",x"be",x"90",x"ee", -- e17d |   jne [0x29e], 0xbe16, ${fail}:rel + PC
    x"86",x"fe",x"21",x"3e",x"f6",                   -- e187 |   sub [G], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"b6",x"fe",x"81",x"ee", -- e18c |   jne [0x155], 0xfeb6, ${fail}:rel + PC
    x"86",x"3e",x"2a",x"fe",x"f6",                   -- e196 |   sub [A*4 + -10], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"0e",x"02",x"72",x"ee", -- e19b |   jne [0x29e], 0x20e, ${fail}:rel + PC
    x"b6",x"3e",x"1c",x"fe",x"f6",x"85",             -- e1a5 |   xor [A*4 + -10], -123, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"d0",x"fe",x"62",x"ee", -- e1ab |   jne [0x29e], 0xfed0, ${fail}:rel + PC
    x"86",x"20",x"2a",x"1c",x"85",                   -- e1b5 |   sub [A], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"de",x"03",x"53",x"ee", -- e1ba |   jne [0xaa], 0x3de, ${fail}:rel + PC
    x"86",x"20",x"21",x"fe",                         -- e1c4 |   sub [A], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ff",x"ff",x"45",x"ee", -- e1c8 |   jne [0xaa], 0xffff, ${fail}:rel + PC
    x"86",x"2a",x"20",x"e4",x"de",x"fa",             -- e1d2 |   sub [A*4 + B], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"22",x"05",x"35",x"ee", -- e1d8 |   jne [0x363], 0x522, ${fail}:rel + PC
    x"aa",x"e0",x"fe",x"3e",x"39",x"30",x"f6",       -- e1e2 |   shl [0x3039], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"40",x"24",x"ee", -- e1e9 |   jne [0x3039], 0x4000, ${fail}:rel + PC
    x"ae",x"20",x"1c",x"1c",x"85",x"85",             -- e1f3 |   and [A], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"85",x"ff",x"14",x"ee", -- e1f9 |   jne [0xaa], 0xff85, ${fail}:rel + PC
    x"b6",x"20",x"fe",x"e0",x"39",x"30",             -- e203 |   xor [A], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"6c",x"31",x"04",x"ee", -- e209 |   jne [0xaa], 0x316c, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"3e",x"39",x"30",x"f6",       -- e213 |   or [0x3039], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"de",x"03",x"f3",x"ed", -- e21a |   jne [0x3039], 0x3de, ${fail}:rel + PC
    x"b2",x"20",x"e4",x"21",x"de",x"fa",             -- e224 |   or [A], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"fb",x"e3",x"ed", -- e22a |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
    x"b6",x"fe",x"3e",x"3e",x"f6",x"f6",             -- e234 |   xor [G], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"d3",x"ed", -- e23a |   jne [0x155], 0, ${fail}:rel + PC
    x"b6",x"3e",x"20",x"e4",x"f6",x"de",x"fa",       -- e242 |   xor [A*4 + -10], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"22",x"fb",x"c4",x"ed", -- e249 |   jne [0x29e], 0xfb22, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"e0",x"39",x"30",x"85",x"39",x"30", -- e253 |   xor [0x3039], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"bc",x"cf",x"b1",x"ed", -- e25c |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
    x"a2",x"3e",x"fe",x"2a",x"f6",                   -- e266 |   shr [A*4 + -10], G, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"2a",x"a2",x"ed", -- e26b |   jne [0x29e], 0x2a, ${fail}:rel + PC
    x"ae",x"20",x"fe",x"20",                         -- e274 |   and [A], G, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"95",x"ed", -- e278 |   jne [0xaa], 0, ${fail}:rel + PC
    x"86",x"2a",x"e4",x"1c",x"de",x"fa",x"85",       -- e280 |   sub [A*4 + B], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"03",x"fc",x"86",x"ed", -- e287 |   jne [0x363], 0xfc03, ${fail}:rel + PC
    x"ae",x"e0",x"21",x"21",x"39",x"30",             -- e291 |   and [0x3039], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"76",x"ed", -- e297 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"a2",x"e0",x"20",x"e0",x"39",x"30",x"39",x"30", -- e2a1 |   shr [0x3039], A, 0x3039
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"64",x"ed", -- e2a9 |   jne [0x3039], 0, ${fail}:rel + PC
    x"8e",x"3e",x"2a",x"3e",x"f6",x"f6",             -- e2b1 |   imul [A*4 + -10], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"1a",x"dd",x"56",x"ed", -- e2b7 |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"1c",x"39",x"30",x"f6",x"85", -- e2c1 |   shr [0x3039], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"14",x"44",x"ed", -- e2c9 |   jne [0x3039], 0x14, ${fail}:rel + PC
    x"82",x"fe",x"20",x"e0",x"39",x"30",             -- e2d2 |   add [G], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"e3",x"30",x"35",x"ed", -- e2d8 |   jne [0x155], 0x30e3, ${fail}:rel + PC
    x"a6",x"e0",x"21",x"e0",x"39",x"30",x"39",x"30", -- e2e2 |   ishr [0x3039], A*2, 0x3039
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"23",x"ed", -- e2ea |   jne [0x3039], 0, ${fail}:rel + PC
    x"a6",x"e0",x"e4",x"1c",x"39",x"30",x"de",x"fa",x"85", -- e2f2 |   ishr [0x3039], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"dc",x"ff",x"12",x"ed", -- e2fb |   jne [0x3039], 0xffdc, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"20",x"f6",                   -- e305 |   or [A*4 + -10], G, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ff",x"01",x"03",x"ed", -- e30a |   jne [0x29e], 0x1ff, ${fail}:rel + PC
    x"a6",x"2a",x"2a",x"20",                         -- e314 |   ishr [A*4 + B], A*4 + B, A
    x"ee",x"e0",x"00",x"f8",x"63",x"03",x"f5",x"ec", -- e318 |   jne [0x363], 0, ${fail}:rel + PC
    x"aa",x"fe",x"e0",x"2a",x"39",x"30",             -- e320 |   shl [G], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"c8",x"81",x"e7",x"ec", -- e326 |   jne [0x155], 0x81c8, ${fail}:rel + PC
    x"8a",x"21",x"3e",x"20",x"f6",                   -- e330 |   mul [A*2], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ec",x"bc",x"d8",x"ec", -- e335 |   jne [0x154], 0xbcec, ${fail}:rel + PC
    x"8e",x"3e",x"3e",x"e0",x"f6",x"f6",x"39",x"30", -- e33f |   imul [A*4 + -10], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"2e",x"35",x"c6",x"ec", -- e347 |   jne [0x29e], 0x352e, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"3e",x"39",x"30",x"85",x"f6", -- e351 |   xor [0x3039], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"1b",x"fd",x"b4",x"ec", -- e359 |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"e4",x"de",x"fa",             -- e363 |   or [G], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"fb",x"a4",x"ec", -- e369 |   jne [0x155], 0xfbaa, ${fail}:rel + PC
    x"8e",x"fe",x"fe",x"3e",x"f6",                   -- e373 |   imul [G], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"76",x"7c",x"95",x"ec", -- e378 |   jne [0x155], 0x7c76, ${fail}:rel + PC
    x"8a",x"20",x"e0",x"3e",x"39",x"30",x"f6",       -- e382 |   mul [A], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"2e",x"35",x"84",x"ec", -- e389 |   jne [0xaa], 0x352e, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"20",                         -- e393 |   or [G], A, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"00",x"76",x"ec", -- e397 |   jne [0x155], 0xaa, ${fail}:rel + PC
    x"a2",x"3e",x"21",x"e4",x"f6",x"de",x"fa",       -- e3a1 |   shr [A*4 + -10], A*2, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"01",x"65",x"ec", -- e3a8 |   jne [0x29e], 0x1, ${fail}:rel + PC
    x"a6",x"20",x"3e",x"2a",x"f6",                   -- e3b1 |   ishr [A], A*4 + -10, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"53",x"57",x"ec", -- e3b6 |   jne [0xaa], 0x53, ${fail}:rel + PC
    x"82",x"20",x"e0",x"20",x"39",x"30",             -- e3bf |   add [A], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"e3",x"30",x"48",x"ec", -- e3c5 |   jne [0xaa], 0x30e3, ${fail}:rel + PC
    x"a6",x"20",x"1c",x"20",x"85",                   -- e3cf |   ishr [A], -123, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ff",x"ff",x"39",x"ec", -- e3d4 |   jne [0xaa], 0xffff, ${fail}:rel + PC
    x"ae",x"21",x"20",x"1c",x"85",                   -- e3de |   and [A*2], A, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"80",x"00",x"2a",x"ec", -- e3e3 |   jne [0x154], 0x80, ${fail}:rel + PC
    x"b6",x"2a",x"1c",x"e4",x"85",x"de",x"fa",       -- e3ed |   xor [A*4 + B], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"0d",x"04",x"19",x"ec", -- e3f4 |   jne [0x363], 0x40d, ${fail}:rel + PC
    x"82",x"20",x"e0",x"21",x"39",x"30",             -- e3fe |   add [A], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"8d",x"31",x"09",x"ec", -- e404 |   jne [0xaa], 0x318d, ${fail}:rel + PC
    x"82",x"21",x"fe",x"2a",                         -- e40e |   add [A*2], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b8",x"04",x"fb",x"eb", -- e412 |   jne [0x154], 0x4b8, ${fail}:rel + PC
    x"b2",x"20",x"2a",x"20",                         -- e41c |   or [A], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"eb",x"03",x"ed",x"eb", -- e420 |   jne [0xaa], 0x3eb, ${fail}:rel + PC
    x"82",x"21",x"1c",x"e0",x"85",x"39",x"30",       -- e42a |   add [A*2], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"be",x"2f",x"dc",x"eb", -- e431 |   jne [0x154], 0x2fbe, ${fail}:rel + PC
    x"aa",x"fe",x"2a",x"1c",x"85",                   -- e43b |   shl [G], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"60",x"6c",x"cd",x"eb", -- e440 |   jne [0x155], 0x6c60, ${fail}:rel + PC
    x"82",x"3e",x"3e",x"2a",x"f6",x"f6",             -- e44a |   add [A*4 + -10], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"01",x"06",x"bd",x"eb", -- e450 |   jne [0x29e], 0x601, ${fail}:rel + PC
    x"b2",x"20",x"3e",x"e4",x"f6",x"de",x"fa",       -- e45a |   or [A], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9e",x"fb",x"ac",x"eb", -- e461 |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
    x"aa",x"2a",x"21",x"1c",x"85",                   -- e46b |   shl [A*4 + B], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"80",x"2a",x"9d",x"eb", -- e470 |   jne [0x363], 0x2a80, ${fail}:rel + PC
    x"b2",x"e0",x"1c",x"2a",x"39",x"30",x"85",       -- e47a |   or [0x3039], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"e7",x"ff",x"8c",x"eb", -- e481 |   jne [0x3039], 0xffe7, ${fail}:rel + PC
    x"82",x"21",x"2a",x"2a",                         -- e48b |   add [A*2], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"c6",x"06",x"7e",x"eb", -- e48f |   jne [0x154], 0x6c6, ${fail}:rel + PC
    x"ae",x"20",x"21",x"20",                         -- e499 |   and [A], A*2, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"70",x"eb", -- e49d |   jne [0xaa], 0, ${fail}:rel + PC
    x"86",x"20",x"fe",x"1c",x"85",                   -- e4a5 |   sub [A], G, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d0",x"01",x"63",x"eb", -- e4aa |   jne [0xaa], 0x1d0, ${fail}:rel + PC
    x"b2",x"20",x"2a",x"3e",x"f6",                   -- e4b4 |   or [A], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ff",x"03",x"54",x"eb", -- e4b9 |   jne [0xaa], 0x3ff, ${fail}:rel + PC
    x"b6",x"2a",x"20",x"2a",                         -- e4c3 |   xor [A*4 + B], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"c9",x"03",x"46",x"eb", -- e4c7 |   jne [0x363], 0x3c9, ${fail}:rel + PC
    x"aa",x"21",x"fe",x"3e",x"f6",                   -- e4d1 |   shl [A*2], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"40",x"37",x"eb", -- e4d6 |   jne [0x154], 0x4000, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"21",x"f6",x"39",x"30",       -- e4e0 |   and [A*4 + -10], 0x3039, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"10",x"26",x"eb", -- e4e7 |   jne [0x29e], 0x10, ${fail}:rel + PC
    x"a2",x"e0",x"2a",x"e4",x"39",x"30",x"de",x"fa", -- e4f0 |   shr [0x3039], A*4 + B, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"03",x"15",x"eb", -- e4f8 |   jne [0x3039], 0x3, ${fail}:rel + PC
    x"8a",x"fe",x"21",x"2a",                         -- e501 |   mul [G], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"7c",x"7f",x"08",x"eb", -- e505 |   jne [0x155], 0x7f7c, ${fail}:rel + PC
    x"a2",x"3e",x"3e",x"fe",x"f6",x"f6",             -- e50f |   shr [A*4 + -10], A*4 + -10, G
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"14",x"f8",x"ea", -- e515 |   jne [0x29e], 0x14, ${fail}:rel + PC
    x"8a",x"20",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- e51e |   mul [A], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"48",x"81",x"e7",x"ea", -- e526 |   jne [0xaa], 0x8148, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"3e",x"85",x"f6",             -- e530 |   mul [A*4 + B], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"16",x"be",x"d7",x"ea", -- e536 |   jne [0x363], 0xbe16, ${fail}:rel + PC
    x"ae",x"2a",x"1c",x"fe",x"85",                   -- e540 |   and [A*4 + B], -123, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"05",x"01",x"c8",x"ea", -- e545 |   jne [0x363], 0x105, ${fail}:rel + PC
    x"aa",x"e0",x"e0",x"20",x"39",x"30",x"39",x"30", -- e54f |   shl [0x3039], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"e4",x"b6",x"ea", -- e557 |   jne [0x3039], 0xe400, ${fail}:rel + PC
    x"8e",x"20",x"fe",x"2a",                         -- e561 |   imul [A], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"df",x"82",x"a8",x"ea", -- e565 |   jne [0xaa], 0x82df, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"3e",x"f6",x"85",x"f6",       -- e56f |   sub [A*4 + -10], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e7",x"fc",x"97",x"ea", -- e576 |   jne [0x29e], 0xfce7, ${fail}:rel + PC
    x"aa",x"21",x"20",x"2a",                         -- e580 |   shl [A*2], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"50",x"05",x"89",x"ea", -- e584 |   jne [0x154], 0x550, ${fail}:rel + PC
    x"82",x"20",x"3e",x"21",x"f6",                   -- e58e |   add [A], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"f2",x"03",x"7a",x"ea", -- e593 |   jne [0xaa], 0x3f2, ${fail}:rel + PC
    x"8a",x"21",x"fe",x"1c",x"85",                   -- e59d |   mul [A*2], G, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"29",x"5c",x"6b",x"ea", -- e5a2 |   jne [0x154], 0x5c29, ${fail}:rel + PC
    x"8a",x"fe",x"1c",x"e0",x"85",x"39",x"30",       -- e5ac |   mul [G], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"9d",x"d4",x"5a",x"ea", -- e5b3 |   jne [0x155], 0xd49d, ${fail}:rel + PC
    x"a6",x"e0",x"2a",x"2a",x"39",x"30",             -- e5bd |   ishr [0x3039], A*4 + B, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"6c",x"4a",x"ea", -- e5c3 |   jne [0x3039], 0x6c, ${fail}:rel + PC
    x"82",x"2a",x"1c",x"21",x"85",                   -- e5cc |   add [A*4 + B], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d9",x"00",x"3c",x"ea", -- e5d1 |   jne [0x363], 0xd9, ${fail}:rel + PC
    x"8a",x"e0",x"e0",x"fe",x"39",x"30",x"39",x"30", -- e5db |   mul [0x3039], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"ed",x"3b",x"2a",x"ea", -- e5e3 |   jne [0x3039], 0x3bed, ${fail}:rel + PC
    x"b2",x"e0",x"2a",x"fe",x"39",x"30",             -- e5ed |   or [0x3039], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"77",x"03",x"1a",x"ea", -- e5f3 |   jne [0x3039], 0x377, ${fail}:rel + PC
    x"aa",x"2a",x"1c",x"e0",x"85",x"39",x"30",       -- e5fd |   shl [A*4 + B], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"0a",x"09",x"ea", -- e604 |   jne [0x363], 0xa00, ${fail}:rel + PC
    x"8a",x"fe",x"1c",x"2a",x"85",                   -- e60e |   mul [G], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"6f",x"5f",x"fa",x"e9", -- e613 |   jne [0x155], 0x5f6f, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"fe",x"f6",x"39",x"30",       -- e61d |   and [A*4 + -10], 0x3039, G
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"11",x"e9",x"e9", -- e624 |   jne [0x29e], 0x11, ${fail}:rel + PC
    x"a6",x"2a",x"21",x"e4",x"de",x"fa",             -- e62d |   ishr [A*4 + B], A*2, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"da",x"e9", -- e633 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"b2",x"21",x"21",x"2a",                         -- e63c |   or [A*2], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"77",x"03",x"cd",x"e9", -- e640 |   jne [0x154], 0x377, ${fail}:rel + PC
    x"ae",x"2a",x"fe",x"fe",                         -- e64a |   and [A*4 + B], G, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"55",x"01",x"bf",x"e9", -- e64e |   jne [0x363], 0x155, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"3e",x"f6",x"f6",             -- e658 |   shl [A*4 + B], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"80",x"af",x"e9", -- e65e |   jne [0x363], 0x8000, ${fail}:rel + PC
    x"86",x"3e",x"2a",x"1c",x"f6",x"85",             -- e668 |   sub [A*4 + -10], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"de",x"03",x"9f",x"e9", -- e66e |   jne [0x29e], 0x3de, ${fail}:rel + PC
    x"ae",x"fe",x"fe",x"1c",x"85",                   -- e678 |   and [G], G, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"05",x"01",x"90",x"e9", -- e67d |   jne [0x155], 0x105, ${fail}:rel + PC
    x"a6",x"21",x"3e",x"1c",x"f6",x"85",             -- e687 |   ishr [A*2], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"14",x"80",x"e9", -- e68d |   jne [0x154], 0x14, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"fe",x"39",x"30",             -- e696 |   or [0x3039], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"55",x"01",x"71",x"e9", -- e69c |   jne [0x3039], 0x155, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"21",                         -- e6a6 |   or [A*4 + B], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"fe",x"01",x"63",x"e9", -- e6aa |   jne [0x363], 0x1fe, ${fail}:rel + PC
    x"a2",x"21",x"20",x"e0",x"39",x"30",             -- e6b4 |   shr [A*2], A, 0x3039
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"53",x"e9", -- e6ba |   jne [0x154], 0, ${fail}:rel + PC
    x"8e",x"3e",x"3e",x"e4",x"f6",x"f6",x"de",x"fa", -- e6c2 |   imul [A*4 + -10], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"f0",x"4d",x"43",x"e9", -- e6ca |   jne [0x29e], 0x4df0, ${fail}:rel + PC
    x"a2",x"2a",x"3e",x"fe",x"f6",                   -- e6d4 |   shr [A*4 + B], A*4 + -10, G
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"14",x"34",x"e9", -- e6d9 |   jne [0x363], 0x14, ${fail}:rel + PC
    x"aa",x"e0",x"2a",x"1c",x"39",x"30",x"85",       -- e6e2 |   shl [0x3039], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"60",x"6c",x"24",x"e9", -- e6e9 |   jne [0x3039], 0x6c60, ${fail}:rel + PC
    x"86",x"e0",x"3e",x"20",x"39",x"30",x"f6",       -- e6f3 |   sub [0x3039], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"f4",x"01",x"13",x"e9", -- e6fa |   jne [0x3039], 0x1f4, ${fail}:rel + PC
    x"86",x"fe",x"3e",x"fe",x"f6",                   -- e704 |   sub [G], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"49",x"01",x"04",x"e9", -- e709 |   jne [0x155], 0x149, ${fail}:rel + PC
    x"b6",x"20",x"20",x"2a",                         -- e713 |   xor [A], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"c9",x"03",x"f6",x"e8", -- e717 |   jne [0xaa], 0x3c9, ${fail}:rel + PC
    x"a2",x"20",x"21",x"21",                         -- e721 |   shr [A], A*2, A*2
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"15",x"e8",x"e8", -- e725 |   jne [0xaa], 0x15, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"21",x"39",x"30",             -- e72e |   add [A*4 + B], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"8d",x"31",x"d9",x"e8", -- e734 |   jne [0x363], 0x318d, ${fail}:rel + PC
    x"82",x"fe",x"2a",x"2a",                         -- e73e |   add [G], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"c6",x"06",x"cb",x"e8", -- e742 |   jne [0x155], 0x6c6, ${fail}:rel + PC
    x"aa",x"2a",x"2a",x"3e",x"f6",                   -- e74c |   shl [A*4 + B], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"c0",x"bc",x"e8", -- e751 |   jne [0x363], 0xc000, ${fail}:rel + PC
    x"b6",x"3e",x"2a",x"20",x"f6",                   -- e75b |   xor [A*4 + -10], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"c9",x"03",x"ad",x"e8", -- e760 |   jne [0x29e], 0x3c9, ${fail}:rel + PC
    x"8a",x"20",x"e4",x"1c",x"de",x"fa",x"85",       -- e76a |   mul [A], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a8",x"25",x"9c",x"e8", -- e771 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"e4",x"f6",x"39",x"30",x"de",x"fa", -- e77b |   and [A*4 + -10], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"08",x"30",x"89",x"e8", -- e784 |   jne [0x29e], 0x3008, ${fail}:rel + PC
    x"82",x"20",x"fe",x"21",                         -- e78e |   add [A], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a9",x"02",x"7b",x"e8", -- e792 |   jne [0xaa], 0x2a9, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"fe",x"de",x"fa",             -- e79c |   sub [G], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"33",x"fa",x"6b",x"e8", -- e7a2 |   jne [0x155], 0xfa33, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"e4",x"39",x"30",x"f6",x"de",x"fa", -- e7ac |   shr [0x3039], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"02",x"58",x"e8", -- e7b5 |   jne [0x3039], 0x2, ${fail}:rel + PC
    x"a2",x"3e",x"21",x"2a",x"f6",                   -- e7be |   shr [A*4 + -10], A*2, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"2a",x"4a",x"e8", -- e7c3 |   jne [0x29e], 0x2a, ${fail}:rel + PC
    x"a2",x"fe",x"20",x"2a",                         -- e7cc |   shr [G], A, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"15",x"3d",x"e8", -- e7d0 |   jne [0x155], 0x15, ${fail}:rel + PC
    x"8e",x"2a",x"fe",x"21",                         -- e7d9 |   imul [A*4 + B], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"e4",x"c4",x"30",x"e8", -- e7dd |   jne [0x363], 0xc4e4, ${fail}:rel + PC
    x"8a",x"3e",x"e4",x"e4",x"f6",x"de",x"fa",x"de",x"fa", -- e7e7 |   mul [A*4 + -10], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"40",x"f8",x"1d",x"e8", -- e7f0 |   jne [0x29e], 0xf840, ${fail}:rel + PC
    x"82",x"3e",x"2a",x"e0",x"f6",x"39",x"30",       -- e7fa |   add [A*4 + -10], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"9c",x"33",x"0c",x"e8", -- e801 |   jne [0x29e], 0x339c, ${fail}:rel + PC
    x"b6",x"2a",x"fe",x"3e",x"f6",                   -- e80b |   xor [A*4 + B], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"cb",x"03",x"fd",x"e7", -- e810 |   jne [0x363], 0x3cb, ${fail}:rel + PC
    x"b6",x"21",x"e4",x"20",x"de",x"fa",             -- e81a |   xor [A*2], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"22",x"fb",x"ed",x"e7", -- e820 |   jne [0x154], 0xfb22, ${fail}:rel + PC
    x"a2",x"e0",x"e0",x"21",x"39",x"30",x"39",x"30", -- e82a |   shr [0x3039], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"03",x"03",x"db",x"e7", -- e832 |   jne [0x3039], 0x303, ${fail}:rel + PC
    x"8e",x"2a",x"fe",x"e0",x"39",x"30",             -- e83c |   imul [A*4 + B], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ed",x"3b",x"cb",x"e7", -- e842 |   jne [0x363], 0x3bed, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"21",x"39",x"30",x"85",       -- e84c |   xor [0x3039], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d1",x"fe",x"ba",x"e7", -- e853 |   jne [0x3039], 0xfed1, ${fail}:rel + PC
    x"86",x"e0",x"fe",x"e4",x"39",x"30",x"de",x"fa", -- e85d |   sub [0x3039], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"cd",x"05",x"a8",x"e7", -- e865 |   jne [0x3039], 0x5cd, ${fail}:rel + PC
    x"b6",x"20",x"21",x"e4",x"de",x"fa",             -- e86f |   xor [A], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"fa",x"98",x"e7", -- e875 |   jne [0xaa], 0xfadc, ${fail}:rel + PC
    x"8a",x"21",x"3e",x"e0",x"f6",x"39",x"30",       -- e87f |   mul [A*2], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"2e",x"35",x"87",x"e7", -- e886 |   jne [0x154], 0x352e, ${fail}:rel + PC
    x"aa",x"2a",x"21",x"20",                         -- e890 |   shl [A*4 + B], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"50",x"79",x"e7", -- e894 |   jne [0x363], 0x5000, ${fail}:rel + PC
    x"ae",x"fe",x"1c",x"e4",x"85",x"de",x"fa",       -- e89e |   and [G], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"80",x"fb",x"68",x"e7", -- e8a5 |   jne [0x155], 0xfb80, ${fail}:rel + PC
    x"a2",x"20",x"20",x"21",                         -- e8af |   shr [A], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"0a",x"5a",x"e7", -- e8b3 |   jne [0xaa], 0xa, ${fail}:rel + PC
    x"b6",x"3e",x"20",x"3e",x"f6",x"f6",             -- e8bc |   xor [A*4 + -10], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"34",x"02",x"4b",x"e7", -- e8c2 |   jne [0x29e], 0x234, ${fail}:rel + PC
    x"aa",x"3e",x"3e",x"21",x"f6",x"f6",             -- e8cc |   shl [A*4 + -10], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e0",x"29",x"3b",x"e7", -- e8d2 |   jne [0x29e], 0x29e0, ${fail}:rel + PC
    x"8a",x"20",x"3e",x"1c",x"f6",x"85",             -- e8dc |   mul [A], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"16",x"be",x"2b",x"e7", -- e8e2 |   jne [0xaa], 0xbe16, ${fail}:rel + PC
    x"b2",x"fe",x"fe",x"e0",x"39",x"30",             -- e8ec |   or [G], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"7d",x"31",x"1b",x"e7", -- e8f2 |   jne [0x155], 0x317d, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"3e",x"de",x"fa",x"f6",       -- e8fc |   shr [A*4 + B], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"03",x"0a",x"e7", -- e903 |   jne [0x363], 0x3, ${fail}:rel + PC
    x"8a",x"2a",x"20",x"e0",x"39",x"30",             -- e90c |   mul [A*4 + B], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"da",x"05",x"fb",x"e6", -- e912 |   jne [0x363], 0x5da, ${fail}:rel + PC
    x"ae",x"3e",x"21",x"e0",x"f6",x"39",x"30",       -- e91c |   and [A*4 + -10], A*2, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"10",x"ea",x"e6", -- e923 |   jne [0x29e], 0x10, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"2a",x"39",x"30",             -- e92c |   and [0x3039], A, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"22",x"db",x"e6", -- e932 |   jne [0x3039], 0x22, ${fail}:rel + PC
    x"8e",x"fe",x"2a",x"fe",                         -- e93b |   imul [G], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"df",x"82",x"ce",x"e6", -- e93f |   jne [0x155], 0x82df, ${fail}:rel + PC
    x"86",x"e0",x"fe",x"2a",x"39",x"30",             -- e949 |   sub [0x3039], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"f2",x"fd",x"be",x"e6", -- e94f |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
    x"a2",x"2a",x"fe",x"2a",                         -- e959 |   shr [A*4 + B], G, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"2a",x"b0",x"e6", -- e95d |   jne [0x363], 0x2a, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"fe",x"f6",                   -- e966 |   or [A*4 + -10], G, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"55",x"01",x"a2",x"e6", -- e96b |   jne [0x29e], 0x155, ${fail}:rel + PC
    x"b6",x"21",x"20",x"fe",                         -- e975 |   xor [A*2], A, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"01",x"94",x"e6", -- e979 |   jne [0x154], 0x1ff, ${fail}:rel + PC
    x"a2",x"fe",x"3e",x"1c",x"f6",x"85",             -- e983 |   shr [G], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"14",x"84",x"e6", -- e989 |   jne [0x155], 0x14, ${fail}:rel + PC
    x"a6",x"e0",x"fe",x"20",x"39",x"30",             -- e992 |   ishr [0x3039], G, A
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"75",x"e6", -- e998 |   jne [0x3039], 0, ${fail}:rel + PC
    x"8a",x"21",x"1c",x"e4",x"85",x"de",x"fa",       -- e9a0 |   mul [A*2], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a8",x"25",x"66",x"e6", -- e9a7 |   jne [0x154], 0x25a8, ${fail}:rel + PC
    x"b2",x"21",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- e9b1 |   or [A*2], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b9",x"fb",x"54",x"e6", -- e9b9 |   jne [0x154], 0xfbb9, ${fail}:rel + PC
    x"8e",x"2a",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- e9c3 |   imul [A*4 + B], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"48",x"81",x"42",x"e6", -- e9cb |   jne [0x363], 0x8148, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"1c",x"f6",x"85",             -- e9d5 |   or [A*4 + -10], G, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"d5",x"ff",x"32",x"e6", -- e9db |   jne [0x29e], 0xffd5, ${fail}:rel + PC
    x"a6",x"3e",x"21",x"20",x"f6",                   -- e9e5 |   ishr [A*4 + -10], A*2, A
    x"ee",x"e0",x"00",x"f8",x"9e",x"02",x"23",x"e6", -- e9ea |   jne [0x29e], 0, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"1c",x"85",                   -- e9f2 |   and [A*2], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"01",x"03",x"16",x"e6", -- e9f7 |   jne [0x154], 0x301, ${fail}:rel + PC
    x"b2",x"20",x"21",x"3e",x"f6",                   -- ea01 |   or [A], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"de",x"03",x"07",x"e6", -- ea06 |   jne [0xaa], 0x3de, ${fail}:rel + PC
    x"82",x"fe",x"3e",x"20",x"f6",                   -- ea10 |   add [G], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"48",x"03",x"f8",x"e5", -- ea15 |   jne [0x155], 0x348, ${fail}:rel + PC
    x"aa",x"3e",x"20",x"e0",x"f6",x"39",x"30",       -- ea1f |   shl [A*4 + -10], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"54",x"e7",x"e5", -- ea26 |   jne [0x29e], 0x5400, ${fail}:rel + PC
    x"aa",x"20",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- ea30 |   shl [A], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"88",x"d5",x"e5", -- ea38 |   jne [0xaa], 0x8800, ${fail}:rel + PC
    x"8e",x"fe",x"3e",x"e0",x"f6",x"39",x"30",       -- ea42 |   imul [G], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"2e",x"35",x"c4",x"e5", -- ea49 |   jne [0x155], 0x352e, ${fail}:rel + PC
    x"82",x"e0",x"1c",x"1c",x"39",x"30",x"85",x"85", -- ea53 |   add [0x3039], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"0a",x"ff",x"b2",x"e5", -- ea5b |   jne [0x3039], 0xff0a, ${fail}:rel + PC
    x"86",x"21",x"3e",x"fe",x"f6",                   -- ea65 |   sub [A*2], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"49",x"01",x"a3",x"e5", -- ea6a |   jne [0x154], 0x149, ${fail}:rel + PC
    x"a6",x"20",x"e4",x"fe",x"de",x"fa",             -- ea74 |   ishr [A], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"ff",x"93",x"e5", -- ea7a |   jne [0xaa], 0xffdc, ${fail}:rel + PC
    x"b6",x"20",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- ea84 |   xor [A], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"b1",x"cb",x"81",x"e5", -- ea8c |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
    x"86",x"fe",x"21",x"e4",x"de",x"fa",             -- ea96 |   sub [G], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"cc",x"05",x"71",x"e5", -- ea9c |   jne [0x155], 0x5cc, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"e0",x"39",x"30",x"39",x"30", -- eaa6 |   add [A*4 + B], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"72",x"60",x"5f",x"e5", -- eaae |   jne [0x363], 0x6072, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"e4",x"f6",x"85",x"de",x"fa", -- eab8 |   sub [A*4 + -10], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"fd",x"03",x"4d",x"e5", -- eac0 |   jne [0x29e], 0x3fd, ${fail}:rel + PC
    x"82",x"21",x"21",x"3e",x"f6",                   -- eaca |   add [A*2], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"f2",x"03",x"3e",x"e5", -- eacf |   jne [0x154], 0x3f2, ${fail}:rel + PC
    x"a2",x"20",x"e0",x"1c",x"39",x"30",x"85",       -- ead9 |   shr [A], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"81",x"01",x"2d",x"e5", -- eae0 |   jne [0xaa], 0x181, ${fail}:rel + PC
    x"8e",x"21",x"20",x"3e",x"f6",                   -- eaea |   imul [A*2], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ec",x"bc",x"1e",x"e5", -- eaef |   jne [0x154], 0xbcec, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"e4",x"f6",x"de",x"fa",       -- eaf9 |   or [A*4 + -10], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"dd",x"fb",x"0d",x"e5", -- eb00 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
    x"a6",x"fe",x"20",x"1c",x"85",                   -- eb0a |   ishr [G], A, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"05",x"fe",x"e4", -- eb0f |   jne [0x155], 0x5, ${fail}:rel + PC
    x"a6",x"21",x"20",x"e4",x"de",x"fa",             -- eb18 |   ishr [A*2], A, 0xfade + A
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"ef",x"e4", -- eb1e |   jne [0x154], 0, ${fail}:rel + PC
    x"a2",x"e0",x"1c",x"20",x"39",x"30",x"85",       -- eb26 |   shr [0x3039], -123, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"3f",x"e0",x"e4", -- eb2d |   jne [0x3039], 0x3f, ${fail}:rel + PC
    x"8e",x"20",x"20",x"3e",x"f6",                   -- eb36 |   imul [A], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ec",x"bc",x"d2",x"e4", -- eb3b |   jne [0xaa], 0xbcec, ${fail}:rel + PC
    x"82",x"2a",x"e4",x"fe",x"de",x"fa",             -- eb45 |   add [A*4 + B], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"dd",x"fc",x"c2",x"e4", -- eb4b |   jne [0x363], 0xfcdd, ${fail}:rel + PC
    x"b6",x"fe",x"e0",x"3e",x"39",x"30",x"f6",       -- eb55 |   xor [G], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"a7",x"32",x"b1",x"e4", -- eb5c |   jne [0x155], 0x32a7, ${fail}:rel + PC
    x"8e",x"20",x"e0",x"2a",x"39",x"30",             -- eb66 |   imul [A], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"0b",x"51",x"a1",x"e4", -- eb6c |   jne [0xaa], 0x510b, ${fail}:rel + PC
    x"b2",x"3e",x"e4",x"fe",x"f6",x"de",x"fa",       -- eb76 |   or [A*4 + -10], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"dd",x"fb",x"90",x"e4", -- eb7d |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
    x"86",x"21",x"1c",x"21",x"85",                   -- eb87 |   sub [A*2], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"31",x"fe",x"81",x"e4", -- eb8c |   jne [0x154], 0xfe31, ${fail}:rel + PC
    x"b2",x"2a",x"21",x"21",                         -- eb96 |   or [A*4 + B], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"54",x"01",x"73",x"e4", -- eb9a |   jne [0x363], 0x154, ${fail}:rel + PC
    x"8e",x"e0",x"20",x"3e",x"39",x"30",x"f6",       -- eba4 |   imul [0x3039], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"ec",x"bc",x"62",x"e4", -- ebab |   jne [0x3039], 0xbcec, ${fail}:rel + PC
    x"a6",x"3e",x"e4",x"2a",x"f6",x"de",x"fa",       -- ebb5 |   ishr [A*4 + -10], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"71",x"ff",x"51",x"e4", -- ebbc |   jne [0x29e], 0xff71, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"e4",x"39",x"30",x"de",x"fa", -- ebc6 |   and [0x3039], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"88",x"00",x"3f",x"e4", -- ebce |   jne [0x3039], 0x88, ${fail}:rel + PC
    x"a6",x"20",x"fe",x"fe",                         -- ebd8 |   ishr [A], G, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"0a",x"31",x"e4", -- ebdc |   jne [0xaa], 0xa, ${fail}:rel + PC
    x"8e",x"20",x"3e",x"20",x"f6",                   -- ebe5 |   imul [A], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ec",x"bc",x"23",x"e4", -- ebea |   jne [0xaa], 0xbcec, ${fail}:rel + PC
    x"b2",x"e0",x"3e",x"fe",x"39",x"30",x"f6",       -- ebf4 |   or [0x3039], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"df",x"03",x"12",x"e4", -- ebfb |   jne [0x3039], 0x3df, ${fail}:rel + PC
    x"82",x"21",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- ec05 |   add [A*2], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"c1",x"2b",x"00",x"e4", -- ec0d |   jne [0x154], 0x2bc1, ${fail}:rel + PC
    x"82",x"e0",x"1c",x"e4",x"39",x"30",x"85",x"de",x"fa", -- ec17 |   add [0x3039], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"0d",x"fb",x"ed",x"e3", -- ec20 |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"21",                         -- ec2a |   or [G], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"fe",x"01",x"df",x"e3", -- ec2e |   jne [0x155], 0x1fe, ${fail}:rel + PC
    x"aa",x"21",x"2a",x"21",                         -- ec38 |   shl [A*2], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"30",x"36",x"d1",x"e3", -- ec3c |   jne [0x154], 0x3630, ${fail}:rel + PC
    x"82",x"e0",x"2a",x"e0",x"39",x"30",x"39",x"30", -- ec46 |   add [0x3039], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"9c",x"33",x"bf",x"e3", -- ec4e |   jne [0x3039], 0x339c, ${fail}:rel + PC
    x"ae",x"2a",x"20",x"1c",x"85",                   -- ec58 |   and [A*4 + B], A, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"80",x"00",x"b0",x"e3", -- ec5d |   jne [0x363], 0x80, ${fail}:rel + PC
    x"b6",x"e0",x"20",x"1c",x"39",x"30",x"85",       -- ec67 |   xor [0x3039], A, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"2f",x"ff",x"9f",x"e3", -- ec6e |   jne [0x3039], 0xff2f, ${fail}:rel + PC
    x"ae",x"21",x"fe",x"e0",x"39",x"30",             -- ec78 |   and [A*2], G, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"11",x"8f",x"e3", -- ec7e |   jne [0x154], 0x11, ${fail}:rel + PC
    x"ae",x"3e",x"fe",x"3e",x"f6",x"f6",             -- ec87 |   and [A*4 + -10], G, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"14",x"80",x"e3", -- ec8d |   jne [0x29e], 0x14, ${fail}:rel + PC
    x"8a",x"3e",x"2a",x"2a",x"f6",                   -- ec96 |   mul [A*4 + -10], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"49",x"78",x"72",x"e3", -- ec9b |   jne [0x29e], 0x7849, ${fail}:rel + PC
    x"82",x"20",x"3e",x"e0",x"f6",x"39",x"30",       -- eca5 |   add [A], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d7",x"32",x"61",x"e3", -- ecac |   jne [0xaa], 0x32d7, ${fail}:rel + PC
    x"82",x"21",x"e0",x"3e",x"39",x"30",x"f6",       -- ecb6 |   add [A*2], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"d7",x"32",x"50",x"e3", -- ecbd |   jne [0x154], 0x32d7, ${fail}:rel + PC
    x"b6",x"21",x"3e",x"3e",x"f6",x"f6",             -- ecc7 |   xor [A*2], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"40",x"e3", -- eccd |   jne [0x154], 0, ${fail}:rel + PC
    x"a6",x"e0",x"20",x"20",x"39",x"30",             -- ecd5 |   ishr [0x3039], A, A
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"32",x"e3", -- ecdb |   jne [0x3039], 0, ${fail}:rel + PC
    x"a6",x"e0",x"e0",x"3e",x"39",x"30",x"39",x"30",x"f6", -- ece3 |   ishr [0x3039], 0x3039, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"21",x"e3", -- ecec |   jne [0x3039], 0, ${fail}:rel + PC
    x"aa",x"20",x"1c",x"21",x"85",                   -- ecf4 |   shl [A], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"50",x"f8",x"14",x"e3", -- ecf9 |   jne [0xaa], 0xf850, ${fail}:rel + PC
    x"ae",x"e0",x"21",x"e4",x"39",x"30",x"de",x"fa", -- ed03 |   and [0x3039], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"01",x"02",x"e3", -- ed0b |   jne [0x3039], 0x100, ${fail}:rel + PC
    x"b2",x"3e",x"1c",x"20",x"f6",x"85",             -- ed15 |   or [A*4 + -10], -123, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"af",x"ff",x"f2",x"e2", -- ed1b |   jne [0x29e], 0xffaf, ${fail}:rel + PC
    x"8e",x"21",x"1c",x"20",x"85",                   -- ed25 |   imul [A*2], -123, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"52",x"ae",x"e3",x"e2", -- ed2a |   jne [0x154], 0xae52, ${fail}:rel + PC
    x"8a",x"2a",x"2a",x"2a",                         -- ed34 |   mul [A*4 + B], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"49",x"78",x"d5",x"e2", -- ed38 |   jne [0x363], 0x7849, ${fail}:rel + PC
    x"86",x"2a",x"2a",x"e0",x"39",x"30",             -- ed42 |   sub [A*4 + B], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"2a",x"d3",x"c5",x"e2", -- ed48 |   jne [0x363], 0xd32a, ${fail}:rel + PC
    x"ae",x"fe",x"1c",x"21",x"85",                   -- ed52 |   and [G], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"04",x"01",x"b6",x"e2", -- ed57 |   jne [0x155], 0x104, ${fail}:rel + PC
    x"8e",x"21",x"e4",x"1c",x"de",x"fa",x"85",       -- ed61 |   imul [A*2], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a8",x"25",x"a5",x"e2", -- ed68 |   jne [0x154], 0x25a8, ${fail}:rel + PC
    x"8a",x"21",x"21",x"e4",x"de",x"fa",             -- ed72 |   mul [A*2], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a0",x"10",x"95",x"e2", -- ed78 |   jne [0x154], 0x10a0, ${fail}:rel + PC
    x"86",x"fe",x"e0",x"fe",x"39",x"30",             -- ed82 |   sub [G], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"e4",x"2e",x"85",x"e2", -- ed88 |   jne [0x155], 0x2ee4, ${fail}:rel + PC
    x"62",x"20",x"1c",x"85",                         -- ed92 |   mov [A], -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"85",x"ff",x"77",x"e2", -- ed96 |   jne [0xaa], 0xff85, ${fail}:rel + PC
    x"62",x"3e",x"3e",x"f6",x"f6",                   -- eda0 |   mov [A*4 + -10], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"9e",x"02",x"68",x"e2", -- eda5 |   jne [0x29e], 0x29e, ${fail}:rel + PC
    x"62",x"21",x"2a",                               -- edaf |   mov [A*2], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"63",x"03",x"5b",x"e2", -- edb2 |   jne [0x154], 0x363, ${fail}:rel + PC
    x"62",x"e0",x"1c",x"39",x"30",x"85",             -- edbc |   mov [0x3039], -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"85",x"ff",x"4b",x"e2", -- edc2 |   jne [0x3039], 0xff85, ${fail}:rel + PC
    x"62",x"fe",x"3e",x"f6",                         -- edcc |   mov [G], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"9e",x"02",x"3d",x"e2", -- edd0 |   jne [0x155], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"fe",x"39",x"30",                   -- edda |   mov [0x3039], G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"55",x"01",x"2e",x"e2", -- eddf |   jne [0x3039], 0x155, ${fail}:rel + PC
    x"62",x"fe",x"21",                               -- ede9 |   mov [G], A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"54",x"01",x"21",x"e2", -- edec |   jne [0x155], 0x154, ${fail}:rel + PC
    x"62",x"3e",x"e4",x"f6",x"de",x"fa",             -- edf6 |   mov [A*4 + -10], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"88",x"fb",x"11",x"e2", -- edfc |   jne [0x29e], 0xfb88, ${fail}:rel + PC
    x"62",x"e0",x"e0",x"39",x"30",x"39",x"30",       -- ee06 |   mov [0x3039], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"39",x"30",x"00",x"e2", -- ee0d |   jne [0x3039], 0x3039, ${fail}:rel + PC
    x"62",x"3e",x"fe",x"f6",                         -- ee17 |   mov [A*4 + -10], G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"55",x"01",x"f2",x"e1", -- ee1b |   jne [0x29e], 0x155, ${fail}:rel + PC
    x"62",x"20",x"fe",                               -- ee25 |   mov [A], G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"55",x"01",x"e5",x"e1", -- ee28 |   jne [0xaa], 0x155, ${fail}:rel + PC
    x"62",x"2a",x"2a",                               -- ee32 |   mov [A*4 + B], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"63",x"03",x"d8",x"e1", -- ee35 |   jne [0x363], 0x363, ${fail}:rel + PC
    x"62",x"3e",x"2a",x"f6",                         -- ee3f |   mov [A*4 + -10], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"63",x"03",x"ca",x"e1", -- ee43 |   jne [0x29e], 0x363, ${fail}:rel + PC
    x"62",x"2a",x"20",                               -- ee4d |   mov [A*4 + B], A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"aa",x"00",x"bd",x"e1", -- ee50 |   jne [0x363], 0xaa, ${fail}:rel + PC
    x"62",x"3e",x"20",x"f6",                         -- ee5a |   mov [A*4 + -10], A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"aa",x"00",x"af",x"e1", -- ee5e |   jne [0x29e], 0xaa, ${fail}:rel + PC
    x"62",x"20",x"20",                               -- ee68 |   mov [A], A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"aa",x"00",x"a2",x"e1", -- ee6b |   jne [0xaa], 0xaa, ${fail}:rel + PC
    x"62",x"2a",x"e4",x"de",x"fa",                   -- ee75 |   mov [A*4 + B], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"88",x"fb",x"93",x"e1", -- ee7a |   jne [0x363], 0xfb88, ${fail}:rel + PC
    x"62",x"21",x"1c",x"85",                         -- ee84 |   mov [A*2], -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"85",x"ff",x"85",x"e1", -- ee88 |   jne [0x154], 0xff85, ${fail}:rel + PC
    x"62",x"2a",x"e0",x"39",x"30",                   -- ee92 |   mov [A*4 + B], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"39",x"30",x"76",x"e1", -- ee97 |   jne [0x363], 0x3039, ${fail}:rel + PC
    x"62",x"3e",x"1c",x"f6",x"85",                   -- eea1 |   mov [A*4 + -10], -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"85",x"ff",x"67",x"e1", -- eea6 |   jne [0x29e], 0xff85, ${fail}:rel + PC
    x"62",x"3e",x"21",x"f6",                         -- eeb0 |   mov [A*4 + -10], A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"54",x"01",x"59",x"e1", -- eeb4 |   jne [0x29e], 0x154, ${fail}:rel + PC
    x"62",x"21",x"3e",x"f6",                         -- eebe |   mov [A*2], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"9e",x"02",x"4b",x"e1", -- eec2 |   jne [0x154], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"21",x"39",x"30",                   -- eecc |   mov [0x3039], A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"3c",x"e1", -- eed1 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"62",x"21",x"fe",                               -- eedb |   mov [A*2], G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"55",x"01",x"2f",x"e1", -- eede |   jne [0x154], 0x155, ${fail}:rel + PC
    x"62",x"2a",x"fe",                               -- eee8 |   mov [A*4 + B], G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"55",x"01",x"22",x"e1", -- eeeb |   jne [0x363], 0x155, ${fail}:rel + PC
    x"62",x"21",x"e4",x"de",x"fa",                   -- eef5 |   mov [A*2], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"88",x"fb",x"13",x"e1", -- eefa |   jne [0x154], 0xfb88, ${fail}:rel + PC
    x"62",x"20",x"3e",x"f6",                         -- ef04 |   mov [A], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9e",x"02",x"05",x"e1", -- ef08 |   jne [0xaa], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"3e",x"39",x"30",x"f6",             -- ef12 |   mov [0x3039], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"9e",x"02",x"f5",x"e0", -- ef18 |   jne [0x3039], 0x29e, ${fail}:rel + PC
    x"62",x"2a",x"3e",x"f6",                         -- ef22 |   mov [A*4 + B], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"9e",x"02",x"e7",x"e0", -- ef26 |   jne [0x363], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"e4",x"39",x"30",x"de",x"fa",       -- ef30 |   mov [0x3039], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"88",x"fb",x"d6",x"e0", -- ef37 |   jne [0x3039], 0xfb88, ${fail}:rel + PC
    x"62",x"21",x"e0",x"39",x"30",                   -- ef41 |   mov [A*2], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"39",x"30",x"c7",x"e0", -- ef46 |   jne [0x154], 0x3039, ${fail}:rel + PC
    x"62",x"fe",x"1c",x"85",                         -- ef50 |   mov [G], -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"85",x"ff",x"b9",x"e0", -- ef54 |   jne [0x155], 0xff85, ${fail}:rel + PC
    x"62",x"e0",x"2a",x"39",x"30",                   -- ef5e |   mov [0x3039], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"63",x"03",x"aa",x"e0", -- ef63 |   jne [0x3039], 0x363, ${fail}:rel + PC
    x"62",x"fe",x"e4",x"de",x"fa",                   -- ef6d |   mov [G], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"88",x"fb",x"9b",x"e0", -- ef72 |   jne [0x155], 0xfb88, ${fail}:rel + PC
    x"62",x"20",x"e0",x"39",x"30",                   -- ef7c |   mov [A], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"39",x"30",x"8c",x"e0", -- ef81 |   jne [0xaa], 0x3039, ${fail}:rel + PC
    x"62",x"20",x"21",                               -- ef8b |   mov [A], A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"54",x"01",x"7f",x"e0", -- ef8e |   jne [0xaa], 0x154, ${fail}:rel + PC
    x"62",x"3e",x"e0",x"f6",x"39",x"30",             -- ef98 |   mov [A*4 + -10], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"39",x"30",x"6f",x"e0", -- ef9e |   jne [0x29e], 0x3039, ${fail}:rel + PC
    x"62",x"fe",x"20",                               -- efa8 |   mov [G], A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"00",x"62",x"e0", -- efab |   jne [0x155], 0xaa, ${fail}:rel + PC
    x"62",x"21",x"20",                               -- efb5 |   mov [A*2], A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"00",x"55",x"e0", -- efb8 |   jne [0x154], 0xaa, ${fail}:rel + PC
    x"62",x"fe",x"fe",                               -- efc2 |   mov [G], G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"55",x"01",x"48",x"e0", -- efc5 |   jne [0x155], 0x155, ${fail}:rel + PC
    x"62",x"20",x"2a",                               -- efcf |   mov [A], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"63",x"03",x"3b",x"e0", -- efd2 |   jne [0xaa], 0x363, ${fail}:rel + PC
    x"62",x"2a",x"1c",x"85",                         -- efdc |   mov [A*4 + B], -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"85",x"ff",x"2d",x"e0", -- efe0 |   jne [0x363], 0xff85, ${fail}:rel + PC
    x"62",x"2a",x"21",                               -- efea |   mov [A*4 + B], A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"54",x"01",x"20",x"e0", -- efed |   jne [0x363], 0x154, ${fail}:rel + PC
    x"62",x"e0",x"20",x"39",x"30",                   -- eff7 |   mov [0x3039], A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"00",x"11",x"e0", -- effc |   jne [0x3039], 0xaa, ${fail}:rel + PC
    x"62",x"fe",x"e0",x"39",x"30",                   -- f006 |   mov [G], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"39",x"30",x"02",x"e0", -- f00b |   jne [0x155], 0x3039, ${fail}:rel + PC
    x"62",x"21",x"21",                               -- f015 |   mov [A*2], A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"54",x"01",x"f5",x"df", -- f018 |   jne [0x154], 0x154, ${fail}:rel + PC
    x"62",x"fe",x"2a",                               -- f022 |   mov [G], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"63",x"03",x"e8",x"df", -- f025 |   jne [0x155], 0x363, ${fail}:rel + PC
    x"62",x"20",x"e4",x"de",x"fa",                   -- f02f |   mov [A], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"88",x"fb",x"d9",x"df", -- f034 |   jne [0xaa], 0xfb88, ${fail}:rel + PC
    x"e0",x"2a",                                     -- f03e |   push A*4 + B
    x"e4",x"80",                                     -- f040 |   pop D
    x"ec",x"80",x"e0",x"f8",x"63",x"03",x"cb",x"df", -- f042 |   jne D, 0x363, ${fail}:rel + PC
    x"e0",x"1c",x"85",                               -- f04a |   push -123
    x"e4",x"80",                                     -- f04d |   pop D
    x"ec",x"80",x"e0",x"f8",x"85",x"ff",x"be",x"df", -- f04f |   jne D, 0xff85, ${fail}:rel + PC
    x"e0",x"fe",                                     -- f057 |   push G
    x"e4",x"80",                                     -- f059 |   pop D
    x"ec",x"80",x"e0",x"f8",x"55",x"01",x"b2",x"df", -- f05b |   jne D, 0x155, ${fail}:rel + PC
    x"e0",x"3e",x"f6",                               -- f063 |   push A*4 + -10
    x"e4",x"80",                                     -- f066 |   pop D
    x"ec",x"80",x"e0",x"f8",x"9e",x"02",x"a5",x"df", -- f068 |   jne D, 0x29e, ${fail}:rel + PC
    x"e0",x"20",                                     -- f070 |   push A
    x"e4",x"80",                                     -- f072 |   pop D
    x"ec",x"80",x"e0",x"f8",x"aa",x"00",x"99",x"df", -- f074 |   jne D, 0xaa, ${fail}:rel + PC
    x"e0",x"e4",x"de",x"fa",                         -- f07c |   push 0xfade + A
    x"e4",x"80",                                     -- f080 |   pop D
    x"ec",x"80",x"e0",x"f8",x"88",x"fb",x"8b",x"df", -- f082 |   jne D, 0xfb88, ${fail}:rel + PC
    x"e0",x"21",                                     -- f08a |   push A*2
    x"e4",x"80",                                     -- f08c |   pop D
    x"ec",x"80",x"e0",x"f8",x"54",x"01",x"7f",x"df", -- f08e |   jne D, 0x154, ${fail}:rel + PC
    x"e0",x"e0",x"39",x"30",                         -- f096 |   push 0x3039
    x"e4",x"80",                                     -- f09a |   pop D
    x"ec",x"80",x"e0",x"f8",x"39",x"30",x"71",x"df", -- f09c |   jne D, 0x3039, ${fail}:rel + PC
    x"5c",x"f8",x"10",x"00",                         -- f0a4 |   call ${_L_test_uop_get_arg_1}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"fe",x"ad",x"65",x"df", -- f0a8 |   jne C, 0xadfe, ${fail}:rel + PC
    x"58",x"f8",x"0e",x"00",                         -- f0b0 |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                                                     --      | _L_test_uop_get_arg_1:
    x"60",x"60",x"e0",x"fe",x"ad",                   -- f0b4 |   mov C, 0xadfe
    x"dc",                                           -- f0b9 |   ret
    x"58",x"f8",x"53",x"df",                         -- f0ba |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_get_arg_2:
                                                     --      | test_uop_alu_2dd:
    x"60",x"20",x"e0",x"cd",x"ab",                   -- f0be |   mov A, 0xabcd
    x"00",x"20",x"e0",x"ab",x"cd",                   -- f0c3 |   add A, 0xcdab
    x"ec",x"20",x"e0",x"f8",x"78",x"79",x"45",x"df", -- f0c8 |   jne A, 0x7978, ${fail}:rel + PC
                                                     --      | test_uop_alu_2di:
    x"60",x"20",x"e0",x"00",x"10",                   -- f0d0 |   mov A, 0x1000
    x"62",x"e0",x"e0",x"00",x"10",x"bc",x"0a",       -- f0d5 |   mov [0x1000], 0xabc
    x"01",x"20",x"20",                               -- f0dc |   add A, [A]
    x"ec",x"20",x"e0",x"f8",x"bc",x"1a",x"2e",x"df", -- f0df |   jne A, 0x1abc, ${fail}:rel + PC
                                                     --      | test_uop_alu_2id:
    x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       -- f0e7 |   mov [0x1000], 0x1234
    x"02",x"e0",x"e0",x"00",x"10",x"21",x"43",       -- f0ee |   add [0x1000], 0x4321
    x"61",x"20",x"e0",x"00",x"10",                   -- f0f5 |   mov A, [0x1000]
    x"ec",x"20",x"e0",x"f8",x"55",x"55",x"13",x"df", -- f0fa |   jne A, 0x5555, ${fail}:rel + PC
                                                     --      | test_uop_alu_2ii:
    x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       -- f102 |   mov [0x1000], 0x1234
    x"62",x"e0",x"e0",x"05",x"10",x"aa",x"aa",       -- f109 |   mov [0x1005], 0xaaaa
    x"03",x"e0",x"e0",x"05",x"10",x"00",x"10",       -- f110 |   add [0x1005], [0x1000]
    x"ee",x"e0",x"e0",x"f8",x"05",x"10",x"de",x"bc",x"f6",x"de", -- f117 |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                                                     --      | test_uop_alu_3dd:
    x"60",x"20",x"e0",x"fe",x"ab",                   -- f121 |   mov A, 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f126 |   mov B, 0x5555
    x"80",x"60",x"20",x"40",                         -- f12b |   add C, A, B
    x"ec",x"20",x"e0",x"f8",x"fe",x"ab",x"de",x"de", -- f12f |   jne A, 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"d6",x"de", -- f137 |   jne B, 0x5555, ${fail}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"53",x"01",x"ce",x"de", -- f13f |   jne C, 0x153, ${fail}:rel + PC
                                                     --      | test_uop_alu_3di:
    x"62",x"e0",x"e0",x"00",x"10",x"aa",x"12",       -- f147 |   mov [0x1000], 0x12aa
    x"60",x"40",x"e0",x"de",x"fa",                   -- f14e |   mov B, 0xfade
    x"b5",x"20",x"e0",x"40",x"00",x"10",             -- f153 |   xor A, [0x1000], B
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"aa",x"12",x"b4",x"de", -- f159 |   jne [0x1000], 0x12aa, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"de",x"fa",x"aa",x"de", -- f163 |   jne B, 0xfade, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"74",x"e8",x"a2",x"de", -- f16b |   jne A, 0xe874, ${fail}:rel + PC
                                                     --      | test_uop_alu_3id:
    x"60",x"20",x"e0",x"fe",x"ab",                   -- f173 |   mov A, 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f178 |   mov B, 0x5555
    x"86",x"e0",x"20",x"40",x"00",x"10",             -- f17d |   sub [0x1000], A, B
    x"ec",x"20",x"e0",x"f8",x"fe",x"ab",x"8a",x"de", -- f183 |   jne A, 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"82",x"de", -- f18b |   jne B, 0x5555, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"a9",x"56",x"7a",x"de", -- f193 |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                                                     --      | test_uop_alu_3ii:
    x"62",x"e0",x"e0",x"00",x"10",x"fe",x"ab",       -- f19d |   mov [0x1000], 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f1a4 |   mov B, 0x5555
    x"af",x"e0",x"e0",x"40",x"02",x"10",x"00",x"10", -- f1a9 |   and [0x1002], [0x1000], B
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"fe",x"ab",x"5c",x"de", -- f1b1 |   jne [0x1000], 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"52",x"de", -- f1bb |   jne B, 0x5555, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"02",x"10",x"54",x"01",x"4a",x"de", -- f1c3 |   jne [0x1002], 0x154, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_1dx:
    x"60",x"20",x"e0",x"00",x"ff",                   -- f1cd |   mov A, 0xff00
    x"3c",x"20",                                     -- f1d2 |   not A
    x"ec",x"20",x"e0",x"f8",x"ff",x"00",x"39",x"de", -- f1d4 |   jne A, 0xff, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_1ix:
    x"62",x"1c",x"e0",x"64",x"34",x"12",             -- f1dc |   mov [0x64], 0x1234
    x"3a",x"1c",x"64",                               -- f1e2 |   neg [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"cc",x"ed",x"28",x"de", -- f1e5 |   jne [0x64], 0xedcc, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2dd:
    x"60",x"40",x"e0",x"ff",x"00",                   -- f1ee |   mov B, 0xff
    x"bc",x"20",x"40",                               -- f1f3 |   not A, B
    x"ec",x"40",x"e0",x"f8",x"ff",x"00",x"17",x"de", -- f1f6 |   jne B, 0xff, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"00",x"ff",x"0f",x"de", -- f1fe |   jne A, 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2di:
    x"62",x"1c",x"e0",x"64",x"34",x"12",             -- f206 |   mov [0x64], 0x1234
    x"bd",x"20",x"1c",x"64",                         -- f20c |   not A, [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"34",x"12",x"fd",x"dd", -- f210 |   jne [0x64], 0x1234, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"cb",x"ed",x"f4",x"dd", -- f219 |   jne A, 0xedcb, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2id:
    x"60",x"40",x"e0",x"ff",x"00",                   -- f221 |   mov B, 0xff
    x"be",x"1c",x"40",x"64",                         -- f226 |   not [0x64], B
    x"ec",x"40",x"e0",x"f8",x"ff",x"00",x"e3",x"dd", -- f22a |   jne B, 0xff, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"00",x"ff",x"db",x"dd", -- f232 |   jne [0x64], 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2ii:
    x"62",x"1c",x"e0",x"66",x"ff",x"00",             -- f23b |   mov [0x66], 0xff
    x"bf",x"1c",x"1c",x"64",x"66",                   -- f241 |   not [0x64], [0x66]
    x"ee",x"1c",x"e0",x"f8",x"66",x"ff",x"00",x"c7",x"dd", -- f246 |   jne [0x66], 0xff, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"00",x"ff",x"be",x"dd", -- f24f |   jne [0x64], 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_cmp_dd:
    x"60",x"40",x"1c",x"7b",                         -- f258 |   mov B, 0x7b
    x"50",x"40",x"e0",x"c8",x"01",                   -- f25c |   cmp B, 0x1c8
    x"4c",x"20",                                     -- f261 |   getf A
    x"ec",x"40",x"1c",x"f8",x"7b",x"aa",x"dd",       -- f263 |   jne B, 0x7b, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"0e",x"a3",x"dd",       -- f26a |   jne A, 0xe, ${fail}:rel + PC
                                                     --      | test_uop_cmp_di:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f271 |   mov [0x64], -123
    x"60",x"40",x"e0",x"c8",x"01",                   -- f276 |   mov B, 0x1c8
    x"d1",x"40",x"1c",x"64",                         -- f27b |   icmp B, [0x64]
    x"4c",x"20",                                     -- f27f |   getf A
    x"ec",x"40",x"e0",x"f8",x"c8",x"01",x"8c",x"dd", -- f281 |   jne B, 0x1c8, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"32",x"84",x"dd",       -- f289 |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_cmp_id:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f290 |   mov [0x64], -123
    x"60",x"40",x"e0",x"c8",x"01",                   -- f295 |   mov B, 0x1c8
    x"d2",x"1c",x"40",x"64",                         -- f29a |   icmp [0x64], B
    x"4c",x"20",                                     -- f29e |   getf A
    x"ec",x"40",x"e0",x"f8",x"c8",x"01",x"6d",x"dd", -- f2a0 |   jne B, 0x1c8, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"0e",x"65",x"dd",       -- f2a8 |   jne A, 0xe, ${fail}:rel + PC
                                                     --      | test_uop_cmp_ii:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f2af |   mov [0x64], -123
    x"62",x"1c",x"e0",x"66",x"38",x"fe",             -- f2b4 |   mov [0x66], 0xfe38
    x"d3",x"1c",x"1c",x"64",x"66",                   -- f2ba |   icmp [0x64], [0x66]
    x"4c",x"20",                                     -- f2bf |   getf A
    x"ee",x"1c",x"1c",x"f8",x"64",x"85",x"4c",x"dd", -- f2c1 |   jne [0x64], -123, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"38",x"fe",x"44",x"dd", -- f2c9 |   jne [0x66], 0xfe38, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"32",x"3b",x"dd",       -- f2d2 |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_jmp_d:
    x"60",x"20",x"e0",x"e4",x"f2",                   -- f2d9 |   mov A, ${_L_test_uop_jmp_d_okay}
    x"58",x"20",                                     -- f2de |   jmp A
    x"58",x"f8",x"2d",x"dd",                         -- f2e0 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_d_okay:
                                                     --      | test_uop_jmp_i:
    x"62",x"1c",x"e0",x"64",x"f1",x"f2",             -- f2e4 |   mov [0x64], ${_L_test_uop_jmp_i_okay}
    x"5a",x"1c",x"64",                               -- f2ea |   jmp [0x64]
    x"58",x"f8",x"20",x"dd",                         -- f2ed |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_i_okay:
    x"ee",x"1c",x"e0",x"f8",x"64",x"f1",x"f2",x"1c",x"dd", -- f2f1 |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_cond_i:
    x"62",x"1c",x"e0",x"64",x"10",x"f3",             -- f2fa |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
    x"50",x"1c",x"1c",x"01",x"02",                   -- f300 |   cmp 0x1, 0x2
    x"68",x"f8",x"08",x"dd",                         -- f305 |   jeq ${fail}:rel + PC
    x"6e",x"1c",x"64",                               -- f309 |   jne [0x64]
    x"58",x"f8",x"01",x"dd",                         -- f30c |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_cond_i_okay:
    x"ee",x"1c",x"e0",x"f8",x"64",x"10",x"f3",x"fd",x"dc", -- f310 |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_cond_d:
    x"60",x"20",x"e0",x"2d",x"f3",                   -- f319 |   mov A, ${_L_test_uop_jmp_cond_d_okay}
    x"50",x"1c",x"1c",x"01",x"01",                   -- f31e |   cmp 0x1, 0x1
    x"6c",x"f8",x"ea",x"dc",                         -- f323 |   jne ${fail}:rel + PC
    x"68",x"20",                                     -- f327 |   jeq A
    x"58",x"f8",x"e4",x"dc",                         -- f329 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_cond_d_okay:
    x"ec",x"20",x"e0",x"f8",x"2d",x"f3",x"e0",x"dc", -- f32d |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3dd:
    x"60",x"20",x"1c",x"7b",                         -- f335 |   mov A, 0x7b
    x"ec",x"20",x"1c",x"f8",x"7b",x"d4",x"dc",       -- f339 |   jne A, 0x7b, ${fail}:rel + PC
    x"e8",x"20",x"1c",x"f8",x"7b",x"0b",x"00",       -- f340 |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
    x"58",x"f8",x"c6",x"dc",                         -- f347 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3dd_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"c2",x"dc",       -- f34b |   jne A, 0x7b, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3di:
    x"60",x"20",x"1c",x"7b",                         -- f352 |   mov A, 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f356 |   mov [0x64], 0x141
    x"e9",x"20",x"1c",x"f8",x"64",x"b1",x"dc",       -- f35c |   jeq A, [0x64], ${fail}:rel + PC
    x"ed",x"20",x"1c",x"f8",x"64",x"0b",x"00",       -- f363 |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
    x"58",x"f8",x"a3",x"dc",                         -- f36a |   jmp ${fail}:rel + PC
                                                     --      | test_uop_jmp_3di_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"9f",x"dc",       -- f36e |   jne A, 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"98",x"dc", -- f375 |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3id:
    x"60",x"20",x"1c",x"7b",                         -- f37e |   mov A, 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f382 |   mov [0x64], 0x141
    x"ea",x"1c",x"20",x"f8",x"64",x"85",x"dc",       -- f388 |   jeq [0x64], A, ${fail}:rel + PC
    x"ee",x"1c",x"20",x"f8",x"64",x"0b",x"00",       -- f38f |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
    x"58",x"f8",x"77",x"dc",                         -- f396 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3id_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"73",x"dc",       -- f39a |   jne A, 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"6c",x"dc", -- f3a1 |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3ii:
    x"62",x"e0",x"1c",x"c8",x"00",x"7b",             -- f3aa |   mov [0xc8], 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f3b0 |   mov [0x64], 0x141
    x"eb",x"1c",x"e0",x"f8",x"64",x"c8",x"00",x"57",x"dc", -- f3b6 |   jeq [0x64], [0xc8], ${fail}:rel + PC
    x"ef",x"1c",x"e0",x"f8",x"64",x"c8",x"00",x"0d",x"00", -- f3bf |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
    x"58",x"f8",x"45",x"dc",                         -- f3c8 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3ii_okay:
    x"ee",x"e0",x"1c",x"f8",x"c8",x"00",x"7b",x"41",x"dc", -- f3cc |   jne [0xc8], 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"38",x"dc", -- f3d5 |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_mov_dd:
    x"60",x"20",x"1c",x"7b",                         -- f3de |   mov A, 0x7b
    x"ec",x"20",x"1c",x"f8",x"7b",x"2b",x"dc",       -- f3e2 |   jne A, 0x7b, ${fail}:rel + PC
                                                     --      | test_uop_mov_di:
    x"62",x"1c",x"e0",x"64",x"da",x"ff",             -- f3e9 |   mov [0x64], 0xffda
    x"61",x"20",x"1c",x"64",                         -- f3ef |   mov A, [0x64]
    x"ec",x"20",x"e0",x"f8",x"da",x"ff",x"1a",x"dc", -- f3f3 |   jne A, 0xffda, ${fail}:rel + PC
                                                     --      | test_uop_mov_id:
    x"62",x"1c",x"e0",x"64",x"ff",x"ff",             -- f3fb |   mov [0x64], 0xffff
    x"ee",x"1c",x"e0",x"f8",x"64",x"ff",x"ff",x"0c",x"dc", -- f401 |   jne [0x64], 0xffff, ${fail}:rel + PC
                                                     --      | test_uop_mov_ii:
    x"60",x"20",x"1c",x"14",                         -- f40a |   mov A, 0x14
    x"62",x"1c",x"e0",x"78",x"fa",x"fd",             -- f40e |   mov [0x78], 0xfdfa
    x"63",x"1c",x"3c",x"64",x"64",                   -- f414 |   mov [0x64], [A + 0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"fa",x"fd",x"f4",x"db", -- f419 |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                                                     --      | test_uop_bmov_dd:
    x"64",x"20",x"e0",x"de",x"af",                   -- f422 |   bmov A, 0xafde
    x"ec",x"20",x"e0",x"f8",x"de",x"00",x"e6",x"db", -- f427 |   jne A, 0xde, ${fail}:rel + PC
    x"64",x"20",x"e0",x"fa",x"00",                   -- f42f |   bmov A, 0xfa
    x"ec",x"20",x"e0",x"f8",x"fa",x"00",x"d9",x"db", -- f434 |   jne A, 0xfa, ${fail}:rel + PC
                                                     --      | test_uop_bmov_di:
    x"62",x"1c",x"e0",x"64",x"da",x"ff",             -- f43c |   mov [0x64], 0xffda
    x"65",x"20",x"1c",x"64",                         -- f442 |   bmov A, [0x64]
    x"ec",x"20",x"e0",x"f8",x"da",x"00",x"c7",x"db", -- f446 |   jne A, 0xda, ${fail}:rel + PC
                                                     --      | test_uop_bmov_id:
    x"62",x"1c",x"e0",x"64",x"cd",x"ab",             -- f44e |   mov [0x64], 0xabcd
    x"62",x"1c",x"e0",x"66",x"34",x"12",             -- f454 |   mov [0x66], 0x1234
    x"62",x"1c",x"e0",x"68",x"78",x"56",             -- f45a |   mov [0x68], 0x5678
    x"66",x"1c",x"e0",x"66",x"df",x"00",             -- f460 |   bmov [0x66], 0xdf
    x"ee",x"1c",x"e0",x"f8",x"64",x"cd",x"ab",x"a7",x"db", -- f466 |   jne [0x64], 0xabcd, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"df",x"12",x"9e",x"db", -- f46f |   jne [0x66], 0x12df, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"68",x"78",x"56",x"95",x"db", -- f478 |   jne [0x68], 0x5678, ${fail}:rel + PC
    x"66",x"1c",x"e0",x"67",x"b8",x"00",             -- f481 |   bmov [0x67], 0xb8
    x"ee",x"1c",x"e0",x"f8",x"64",x"cd",x"ab",x"86",x"db", -- f487 |   jne [0x64], 0xabcd, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"df",x"b8",x"7d",x"db", -- f490 |   jne [0x66], 0xb8df, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"68",x"78",x"56",x"74",x"db", -- f499 |   jne [0x68], 0x5678, ${fail}:rel + PC
                                                     --      | test_uop_bmov_ii:
    x"62",x"e0",x"e0",x"2c",x"01",x"df",x"00",       -- f4a2 |   mov [0x12c], 0xdf
    x"62",x"e0",x"e0",x"2e",x"01",x"b8",x"00",       -- f4a9 |   mov [0x12e], 0xb8
    x"62",x"e0",x"e0",x"c8",x"00",x"cd",x"ab",       -- f4b0 |   mov [0xc8], 0xabcd
    x"62",x"e0",x"e0",x"ca",x"00",x"34",x"12",       -- f4b7 |   mov [0xca], 0x1234
    x"62",x"e0",x"e0",x"cc",x"00",x"78",x"56",       -- f4be |   mov [0xcc], 0x5678
    x"67",x"e0",x"e0",x"ca",x"00",x"2c",x"01",       -- f4c5 |   bmov [0xca], [0x12c]
    x"ee",x"e0",x"e0",x"f8",x"c8",x"00",x"cd",x"ab",x"41",x"db", -- f4cc |   jne [0xc8], 0xabcd, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"ca",x"00",x"df",x"12",x"37",x"db", -- f4d6 |   jne [0xca], 0x12df, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"cc",x"00",x"78",x"56",x"2d",x"db", -- f4e0 |   jne [0xcc], 0x5678, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2c",x"01",x"df",x"00",x"23",x"db", -- f4ea |   jne [0x12c], 0xdf, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2e",x"01",x"b8",x"00",x"19",x"db", -- f4f4 |   jne [0x12e], 0xb8, ${fail}:rel + PC
    x"67",x"e0",x"e0",x"cb",x"00",x"2e",x"01",       -- f4fe |   bmov [0xcb], [0x12e]
    x"ee",x"e0",x"e0",x"f8",x"c8",x"00",x"cd",x"ab",x"08",x"db", -- f505 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"ca",x"00",x"df",x"b8",x"fe",x"da", -- f50f |   jne [0xca], 0xb8df, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"cc",x"00",x"78",x"56",x"f4",x"da", -- f519 |   jne [0xcc], 0x5678, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2c",x"01",x"df",x"00",x"ea",x"da", -- f523 |   jne [0x12c], 0xdf, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2e",x"01",x"b8",x"00",x"e0",x"da", -- f52d |   jne [0x12e], 0xb8, ${fail}:rel + PC
                                                     --      | test_uop_halt:
                                                     --      | test_uop_getf:
    x"50",x"1c",x"1c",x"7b",x"2d",                   -- f537 |   cmp 0x7b, 0x2d
    x"4c",x"20",                                     -- f53c |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"cf",x"da",       -- f53e |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_setf:
    x"cc",x"e0",x"ff",x"ff",                         -- f545 |   setf 0xffff
    x"4c",x"20",                                     -- f549 |   getf A
    x"ec",x"20",x"1c",x"f8",x"3f",x"c2",x"da",       -- f54b |   jne A, 0x3f, ${fail}:rel + PC
                                                     --      | test_uop_call_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f552 |   mov SP, 0x1000
    x"60",x"40",x"e0",x"72",x"f5",                   -- f557 |   mov B, ${_L_test_uop_call_d_fn}
    x"5c",x"40",                                     -- f55c |   call B
    x"ec",x"40",x"e0",x"f8",x"72",x"f5",x"af",x"da", -- f55e |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"fa",x"34",x"a7",x"da", -- f566 |   jne A, 0x34fa, ${fail}:rel + PC
    x"58",x"f8",x"0a",x"00",                         -- f56e |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                                                     --      | _L_test_uop_call_d_fn:
    x"60",x"20",x"e0",x"fa",x"34",                   -- f572 |   mov A, 0x34fa
    x"dc",                                           -- f577 |   ret
                                                     --      | _L_test_uop_call_d_okay:
                                                     --      | test_uop_call_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f578 |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- f57d |   mov B, 0x64
    x"62",x"40",x"e0",x"9c",x"f5",                   -- f581 |   mov [B], ${_L_test_uop_call_i_fn}
    x"5e",x"40",                                     -- f586 |   call [B]
    x"ee",x"40",x"e0",x"f8",x"9c",x"f5",x"85",x"da", -- f588 |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"d4",x"aa",x"7d",x"da", -- f590 |   jne A, 0xaad4, ${fail}:rel + PC
    x"58",x"f8",x"0a",x"00",                         -- f598 |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                                                     --      | _L_test_uop_call_i_fn:
    x"60",x"20",x"e0",x"d4",x"aa",                   -- f59c |   mov A, 0xaad4
    x"dc",                                           -- f5a1 |   ret
                                                     --      | _L_test_uop_call_i_okay:
                                                     --      | test_uop_ret:
                                                     --      | test_uop_push_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f5a2 |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- f5a7 |   mov B, 0x64
    x"e0",x"40",                                     -- f5ab |   push B
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"60",x"da", -- f5ad |   jne SP, 0xffe, ${fail}:rel + PC
    x"ee",x"e0",x"1c",x"f8",x"fe",x"0f",x"64",x"58",x"da", -- f5b5 |   jne [0xffe], 0x64, ${fail}:rel + PC
    x"e4",x"60",                                     -- f5be |   pop C
    x"ec",x"60",x"1c",x"f8",x"64",x"4d",x"da",       -- f5c0 |   jne C, 0x64, ${fail}:rel + PC
                                                     --      | test_uop_push_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f5c7 |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- f5cc |   mov B, 0x64
    x"62",x"40",x"e0",x"90",x"01",                   -- f5d0 |   mov [B], 0x190
    x"e2",x"40",                                     -- f5d5 |   push [B]
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"36",x"da", -- f5d7 |   jne SP, 0xffe, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fe",x"0f",x"90",x"01",x"2e",x"da", -- f5df |   jne [0xffe], 0x190, ${fail}:rel + PC
    x"e4",x"60",                                     -- f5e9 |   pop C
    x"ec",x"60",x"e0",x"f8",x"90",x"01",x"22",x"da", -- f5eb |   jne C, 0x190, ${fail}:rel + PC
                                                     --      | test_uop_pop_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f5f3 |   mov SP, 0x1000
    x"e0",x"e0",x"da",x"fa",                         -- f5f8 |   push 0xfada
    x"e4",x"20",                                     -- f5fc |   pop A
    x"ec",x"20",x"e0",x"f8",x"da",x"fa",x"0f",x"da", -- f5fe |   jne A, 0xfada, ${fail}:rel + PC
                                                     --      | test_uop_pop_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f606 |   mov SP, 0x1000
    x"e0",x"e0",x"da",x"f2",                         -- f60b |   push 0xf2da
    x"e6",x"1c",x"64",                               -- f60f |   pop [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"da",x"f2",x"fb",x"d9", -- f612 |   jne [0x64], 0xf2da, ${fail}:rel + PC
                                                     --      | test_uop_mmap:
    x"62",x"e0",x"e0",x"00",x"30",x"00",x"ff",       -- f61b |   mov [0x3000], 0xff00
    x"62",x"e0",x"e0",x"00",x"31",x"01",x"ff",       -- f622 |   mov [0x3100], 0xff01
    x"62",x"e0",x"e0",x"00",x"32",x"02",x"ff",       -- f629 |   mov [0x3200], 0xff02
    x"62",x"e0",x"e0",x"00",x"40",x"00",x"dd",       -- f630 |   mov [0x4000], 0xdd00
    x"62",x"e0",x"e0",x"00",x"41",x"01",x"dd",       -- f637 |   mov [0x4100], 0xdd01
    x"62",x"e0",x"e0",x"00",x"42",x"02",x"dd",       -- f63e |   mov [0x4200], 0xdd02
    x"62",x"e0",x"e0",x"00",x"50",x"00",x"ee",       -- f645 |   mov [0x5000], 0xee00
    x"62",x"e0",x"e0",x"00",x"51",x"01",x"ee",       -- f64c |   mov [0x5100], 0xee01
    x"62",x"e0",x"e0",x"00",x"52",x"02",x"ee",       -- f653 |   mov [0x5200], 0xee02
    x"60",x"20",x"00",                               -- f65a |   mov A, 0
    x"60",x"40",x"e0",x"00",x"41",                   -- f65d |   mov B, 0x4100
    x"54",x"e0",x"e0",x"1c",x"00",x"31",x"ff",x"32",x"01", -- f662 |   mmap 0x3100, 0x32ff, 0x1
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"dd",x"a2",x"d9", -- f66b |   jne [0x3100], 0xdd01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"02",x"dd",x"98",x"d9", -- f675 |   jne [0x3200], 0xdd02, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"8e",x"d9", -- f67f |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"60",x"40",x"e0",x"00",x"51",                   -- f689 |   mov B, 0x5100
    x"54",x"e0",x"e0",x"1c",x"00",x"32",x"ff",x"32",x"02", -- f68e |   mmap 0x3200, 0x32ff, 0x2
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"01",x"ee",x"76",x"d9", -- f697 |   jne [0x3200], 0xee01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"6c",x"d9", -- f6a1 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"dd",x"62",x"d9", -- f6ab |   jne [0x3100], 0xdd01, ${fail}:rel + PC
    x"d4",x"1c",x"01",                               -- f6b5 |   umap 0x1
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"ff",x"55",x"d9", -- f6b8 |   jne [0x3100], 0xff01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"01",x"ee",x"4b",x"d9", -- f6c2 |   jne [0x3200], 0xee01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"41",x"d9", -- f6cc |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"d4",x"1c",x"02",                               -- f6d6 |   umap 0x2
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"34",x"d9", -- f6d9 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"ff",x"2a",x"d9", -- f6e3 |   jne [0x3100], 0xff01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"02",x"ff",x"20",x"d9", -- f6ed |   jne [0x3200], 0xff02, ${fail}:rel + PC
                                                     --      | test_uop_umap:
                                                     --      | test_aux_reg:
    x"60",x"20",x"1c",x"01",                         -- f6f7 |   mov A, 0x1
    x"60",x"40",x"1c",x"02",                         -- f6fb |   mov B, 0x2
    x"60",x"60",x"1c",x"03",                         -- f6ff |   mov C, 0x3
    x"60",x"80",x"1c",x"04",                         -- f703 |   mov D, 0x4
    x"60",x"fc",x"1c",x"05",                         -- f707 |   mov E, 0x5
    x"60",x"fd",x"1c",x"06",                         -- f70b |   mov F, 0x6
    x"60",x"fe",x"1c",x"07",                         -- f70f |   mov G, 0x7
    x"60",x"ff",x"1c",x"08",                         -- f713 |   mov H, 0x8
    x"ec",x"20",x"1c",x"f8",x"01",x"f6",x"d8",       -- f717 |   jne A, 0x1, ${fail}:rel + PC
    x"ec",x"40",x"1c",x"f8",x"02",x"ef",x"d8",       -- f71e |   jne B, 0x2, ${fail}:rel + PC
    x"ec",x"60",x"1c",x"f8",x"03",x"e8",x"d8",       -- f725 |   jne C, 0x3, ${fail}:rel + PC
    x"ec",x"80",x"1c",x"f8",x"04",x"e1",x"d8",       -- f72c |   jne D, 0x4, ${fail}:rel + PC
    x"ec",x"fc",x"1c",x"f8",x"05",x"da",x"d8",       -- f733 |   jne E, 0x5, ${fail}:rel + PC
    x"ec",x"fd",x"1c",x"f8",x"06",x"d3",x"d8",       -- f73a |   jne F, 0x6, ${fail}:rel + PC
    x"ec",x"fe",x"1c",x"f8",x"07",x"cc",x"d8",       -- f741 |   jne G, 0x7, ${fail}:rel + PC
    x"ec",x"ff",x"1c",x"f8",x"08",x"c5",x"d8",       -- f748 |   jne H, 0x8, ${fail}:rel + PC
    x"34",x"ff",x"e0",x"00",x"ff",                   -- f74f |   xor H, 0xff00
    x"ec",x"ff",x"e0",x"f8",x"08",x"ff",x"b9",x"d8", -- f754 |   jne H, 0xff08, ${fail}:rel + PC
    x"60",x"20",x"ff",                               -- f75c |   mov A, H
    x"ec",x"20",x"e0",x"f8",x"08",x"ff",x"ae",x"d8", -- f75f |   jne A, 0xff08, ${fail}:rel + PC
    x"60",x"fc",x"fe",                               -- f767 |   mov E, G
    x"ec",x"fc",x"1c",x"f8",x"07",x"a3",x"d8",       -- f76a |   jne E, 0x7, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"08",x"ff",x"9c",x"d8", -- f771 |   jne H, 0xff08, ${fail}:rel + PC
                                                     --      | test_call_ret:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f779 |   mov SP, 0x1000
    x"5c",x"f8",x"77",x"00",                         -- f77e |   call ${fn_test_target}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"8b",x"d8", -- f782 |   jne SP, 0x1000, ${fail}:rel + PC
    x"60",x"20",x"1c",x"0a",                         -- f78a |   mov A, 0xa
    x"60",x"40",x"00",                               -- f78e |   mov B, 0
    x"60",x"60",x"00",                               -- f791 |   mov C, 0
    x"60",x"80",x"00",                               -- f794 |   mov D, 0
    x"5c",x"f8",x"2d",x"00",                         -- f797 |   call ${fn_recursive}:rel + PC
    x"ec",x"20",x"00",x"f8",x"72",x"d8",             -- f79b |   jne A, 0, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"3f",x"cf",x"6c",x"d8", -- f7a1 |   jne B, 0xcf3f, ${fail}:rel + PC
    x"ec",x"60",x"1c",x"f8",x"2d",x"64",x"d8",       -- f7a9 |   jne C, 0x2d, ${fail}:rel + PC
    x"ec",x"80",x"e0",x"f8",x"97",x"45",x"5d",x"d8", -- f7b0 |   jne D, 0x4597, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"55",x"d8", -- f7b8 |   jne SP, 0x1000, ${fail}:rel + PC
    x"58",x"f8",x"42",x"00",                         -- f7c0 |   jmp ${test_call_ret_end}:rel + PC
                                                     --      | fn_recursive:
    x"04",x"20",x"1c",x"01",                         -- f7c4 |   sub A, 0x1
    x"5c",x"f8",x"25",x"00",                         -- f7c8 |   call ${fn_process_c}:rel + PC
    x"e8",x"20",x"00",x"f8",x"1c",x"00",             -- f7cc |   jeq A, 0, ${fn_recursive_end}:rel + PC
    x"5c",x"f8",x"f2",x"ff",                         -- f7d2 |   call ${fn_recursive}:rel + PC
    x"00",x"80",x"60",                               -- f7d6 |   add D, C
    x"08",x"80",x"1c",x"03",                         -- f7d9 |   mul D, 0x3
    x"00",x"40",x"80",                               -- f7dd |   add B, D
    x"e0",x"80",                                     -- f7e0 |   push D
    x"08",x"40",x"1c",x"05",                         -- f7e2 |   mul B, 0x5
    x"e4",x"80",                                     -- f7e6 |   pop D
                                                     --      | fn_recursive_end:
    x"dc",                                           -- f7e8 |   ret
    x"58",x"f8",x"24",x"d8",                         -- f7e9 |   jmp ${fail}:rel + PC
                                                     --      | fn_process_c:
    x"00",x"60",x"20",                               -- f7ed |   add C, A
    x"dc",                                           -- f7f0 |   ret
    x"58",x"f8",x"1c",x"d8",                         -- f7f1 |   jmp ${fail}:rel + PC
                                                     --      | fn_test_target:
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"18",x"d8", -- f7f5 |   jne SP, 0xffe, ${fail}:rel + PC
    x"dc",                                           -- f7fd |   ret
    x"58",x"f8",x"0f",x"d8",                         -- f7fe |   jmp ${fail}:rel + PC
                                                     --      | test_call_ret_end:
                                                     --      | test_mem_access:
    x"62",x"e0",x"e0",x"00",x"01",x"ed",x"ff",       -- f802 |   mov [0x100], 0xffed
    x"ee",x"e0",x"e0",x"f8",x"00",x"01",x"aa",x"00",x"0e",x"00", -- f809 |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
    x"58",x"f8",x"fa",x"d7",                         -- f813 |   jmp ${fail}:rel + PC
                                                     --      | test_mem_access_check_jmp:
    x"62",x"e0",x"00",x"00",x"10",                   -- f817 |   mov [0x1000], 0
    x"60",x"a0",x"e0",x"00",x"10",                   -- f81c |   mov SP, 0x1000
    x"ee",x"a0",x"00",x"f8",x"ec",x"d7",             -- f821 |   jne [SP], 0, ${fail}:rel + PC
    x"e0",x"00",                                     -- f827 |   push 0
    x"e0",x"00",                                     -- f829 |   push 0
    x"e0",x"00",                                     -- f82b |   push 0
    x"e4",x"20",                                     -- f82d |   pop A
    x"e4",x"20",                                     -- f82f |   pop A
    x"e4",x"20",                                     -- f831 |   pop A
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"da",x"d7", -- f833 |   jne SP, 0x1000, ${fail}:rel + PC
    x"ec",x"20",x"00",x"f8",x"d2",x"d7",             -- f83b |   jne A, 0, ${fail}:rel + PC
    x"e0",x"e0",x"02",x"01",                         -- f841 |   push 0x102
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"c8",x"d7", -- f845 |   jne SP, 0xffe, ${fail}:rel + PC
    x"e0",x"e0",x"04",x"03",                         -- f84d |   push 0x304
    x"ec",x"a0",x"e0",x"f8",x"fc",x"0f",x"bc",x"d7", -- f851 |   jne SP, 0xffc, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fe",x"0f",x"02",x"01",x"b4",x"d7", -- f859 |   jne [0xffe], 0x102, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fc",x"0f",x"04",x"03",x"aa",x"d7", -- f863 |   jne [0xffc], 0x304, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fb",x"0f",x"00",x"04",x"a0",x"d7", -- f86d |   jne [0xffb], 0x400, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fd",x"0f",x"03",x"02",x"96",x"d7", -- f877 |   jne [0xffd], 0x203, ${fail}:rel + PC
    x"ee",x"e0",x"1c",x"f8",x"ff",x"0f",x"01",x"8c",x"d7", -- f881 |   jne [0xfff], 0x1, ${fail}:rel + PC
    x"e4",x"20",                                     -- f88a |   pop A
    x"ec",x"20",x"e0",x"f8",x"04",x"03",x"81",x"d7", -- f88c |   jne A, 0x304, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"79",x"d7", -- f894 |   jne SP, 0xffe, ${fail}:rel + PC
    x"e4",x"20",                                     -- f89c |   pop A
    x"ec",x"20",x"e0",x"f8",x"02",x"01",x"6f",x"d7", -- f89e |   jne A, 0x102, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"67",x"d7", -- f8a6 |   jne SP, 0x1000, ${fail}:rel + PC
                                                     --      | test_cmp:
    x"cc",x"e0",x"ff",x"ff",                         -- f8ae |   setf 0xffff
    x"4c",x"20",                                     -- f8b2 |   getf A
    x"ec",x"20",x"1c",x"f8",x"3f",x"59",x"d7",       -- f8b4 |   jne A, 0x3f, ${fail}:rel + PC
    x"cc",x"e0",x"ab",x"ab",                         -- f8bb |   setf 0xabab
    x"4c",x"20",                                     -- f8bf |   getf A
    x"ec",x"20",x"1c",x"f8",x"2b",x"4c",x"d7",       -- f8c1 |   jne A, 0x2b, ${fail}:rel + PC
    x"50",x"e0",x"1c",x"ab",x"ff",x"2b",             -- f8c8 |   cmp 0xffab, 0x2b
    x"4c",x"20",                                     -- f8ce |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"3d",x"d7",       -- f8d0 |   jne A, 0x32, ${fail}:rel + PC
    x"50",x"1c",x"e0",x"2b",x"ab",x"ff",             -- f8d7 |   cmp 0x2b, 0xffab
    x"4c",x"20",                                     -- f8dd |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"2e",x"d7",       -- f8df |   jne A, 0xe, ${fail}:rel + PC
    x"50",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       -- f8e6 |   cmp 0xffab, 0xffab
    x"4c",x"20",                                     -- f8ed |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"1e",x"d7",       -- f8ef |   jne A, 0x29, ${fail}:rel + PC
    x"d0",x"e0",x"1c",x"ab",x"ff",x"2b",             -- f8f6 |   icmp 0xffab, 0x2b
    x"4c",x"20",                                     -- f8fc |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"0f",x"d7",       -- f8fe |   jne A, 0xe, ${fail}:rel + PC
    x"d0",x"1c",x"e0",x"2b",x"ab",x"ff",             -- f905 |   icmp 0x2b, 0xffab
    x"4c",x"20",                                     -- f90b |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"00",x"d7",       -- f90d |   jne A, 0x32, ${fail}:rel + PC
    x"d0",x"e0",x"e0",x"ab",x"ff",x"ab",x"ff",       -- f914 |   icmp 0xffab, 0xffab
    x"4c",x"20",                                     -- f91b |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"f0",x"d6",       -- f91d |   jne A, 0x29, ${fail}:rel + PC
                                                     --      | end_of_test:
    x"60",x"20",x"e0",x"ad",x"de",                   -- f924 |   mov A, 0xdead
    x"60",x"40",x"e0",x"ef",x"be",                   -- f929 |   mov B, 0xbeef
    x"88",x"60",x"20",x"40",                         -- f92e |   mul C, A, B
    x"58",x"f8",x"e0",x"d6",                         -- f932 |   jmp ${success}:rel + PC
    x"dc",                                           -- f936 |   ret
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
