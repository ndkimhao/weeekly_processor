
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 11857;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | SECTION_BEGIN_boot:
                                                     --      | _B_boot_1:
    x"e8",x"c0",x"e0",x"f8",x"00",x"d0",x"1d",x"00", -- d000 |   jeq PC, 0xd000, ${_E_boot_1}:rel + PC
    x"60",x"20",x"e0",x"ff",x"00",                   -- d008 |   mov A, 0xff
    x"60",x"40",x"00",                               -- d00d |   mov B, 0
    x"54",x"e0",x"e0",x"1c",x"00",x"d0",x"ff",x"fe",x"02", -- d010 |   mmap 0xd000, 0xfeff, 0x2
    x"58",x"e0",x"00",x"d0",                         -- d019 |   jmp 0xd000
                                                     --      | _E_boot_1:
    x"54",x"e0",x"e0",x"1c",x"00",x"d0",x"ff",x"fe",x"03", -- d01d |   mmap 0xd000, 0xfeff, 0x3
    x"d4",x"1c",x"02",                               -- d026 |   umap 0x2
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_self_test:
                                                     --      | .boot:
    x"60",x"20",x"1c",x"fa",                         -- d029 |   mov A, 0xfa
    x"ec",x"20",x"e0",x"f8",x"fa",x"00",x"50",x"00", -- d02d |   jne A, 0xfa, ${start_test}:rel + PC
                                                     --      | fail:
    x"d8",                                           -- d035 |   halt
    x"58",x"f8",x"ff",x"ff",                         -- d036 |   jmp ${fail}:rel + PC
                                                     --      | success:
    x"ec",x"20",x"e0",x"f8",x"ad",x"de",x"fb",x"ff", -- d03a |   jne A, 0xdead, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"ef",x"be",x"f3",x"ff", -- d042 |   jne B, 0xbeef, ${fail}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"83",x"49",x"eb",x"ff", -- d04a |   jne C, 0x4983, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"14",x"a6",x"e3",x"ff", -- d052 |   jne H, 0xa614, ${fail}:rel + PC
    x"60",x"80",x"ff",                               -- d05a |   mov D, H
    x"00",x"20",x"e0",x"ab",x"ac",                   -- d05d |   add A, 0xacab
    x"00",x"40",x"e0",x"cc",x"41",                   -- d062 |   add B, 0x41cc
    x"08",x"20",x"80",                               -- d067 |   mul A, D
    x"34",x"20",x"e0",x"4a",x"f2",                   -- d06a |   xor A, 0xf24a
    x"34",x"60",x"e0",x"4f",x"49",                   -- d06f |   xor C, 0x494f
    x"34",x"ff",x"e0",x"30",x"5a",                   -- d074 |   xor H, 0x5a30
    x"60",x"80",x"ff",                               -- d079 |   mov D, H
    x"d8",                                           -- d07c |   halt
                                                     --      | start_test:
                                                     --      | alu_test:
    x"80",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d07d |   add B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"42",x"72",x"b0",x"ff", -- d085 |   jne B, 0x7242, ${fail}:rel + PC
    x"84",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d08d |   sub B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"1e",x"32",x"a0",x"ff", -- d095 |   jne B, 0x321e, ${fail}:rel + PC
    x"88",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d09d |   mul B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"60",x"c7",x"90",x"ff", -- d0a5 |   jne B, 0xc760, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"6c",x"83",x"88",x"ff", -- d0ad |   jne H, 0x836c, ${fail}:rel + PC
    x"8c",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0b5 |   imul B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"60",x"c7",x"78",x"ff", -- d0bd |   jne B, 0xc760, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"2a",x"11",x"70",x"ff", -- d0c5 |   jne H, 0x112a, ${fail}:rel + PC
    x"a0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0cd |   shr B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"8c",x"34",x"60",x"ff", -- d0d5 |   jne B, 0x348c, ${fail}:rel + PC
    x"a4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0dd |   ishr B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"8c",x"f4",x"50",x"ff", -- d0e5 |   jne B, 0xf48c, ${fail}:rel + PC
    x"a8",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0ed |   shl B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"c0",x"48",x"40",x"ff", -- d0f5 |   jne B, 0x48c0, ${fail}:rel + PC
    x"ac",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d0fd |   and B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"10",x"80",x"30",x"ff", -- d105 |   jne B, 0x8010, ${fail}:rel + PC
    x"b0",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d10d |   or B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"32",x"f2",x"20",x"ff", -- d115 |   jne B, 0xf232, ${fail}:rel + PC
    x"b4",x"40",x"e0",x"e0",x"30",x"d2",x"12",x"a0", -- d11d |   xor B, 0xd230, 0xa012
    x"ec",x"40",x"e0",x"f8",x"22",x"72",x"10",x"ff", -- d125 |   jne B, 0x7222, ${fail}:rel + PC
    x"b8",x"40",x"e0",x"30",x"d2",                   -- d12d |   neg B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"d0",x"2d",x"03",x"ff", -- d132 |   jne B, 0x2dd0, ${fail}:rel + PC
    x"bc",x"40",x"e0",x"30",x"d2",                   -- d13a |   not B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"cf",x"2d",x"f6",x"fe", -- d13f |   jne B, 0x2dcf, ${fail}:rel + PC
    x"c0",x"40",x"e0",x"30",x"d2",                   -- d147 |   bool B, 0xd230
    x"ec",x"40",x"1c",x"f8",x"01",x"e9",x"fe",       -- d14c |   jne B, 0x1, ${fail}:rel + PC
    x"c4",x"40",x"e0",x"30",x"d2",                   -- d153 |   inc B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"31",x"d2",x"dd",x"fe", -- d158 |   jne B, 0xd231, ${fail}:rel + PC
    x"c8",x"40",x"e0",x"30",x"d2",                   -- d160 |   dec B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"2f",x"d2",x"d0",x"fe", -- d165 |   jne B, 0xd22f, ${fail}:rel + PC
    x"80",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d16d |   add B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"e4",x"da",x"c0",x"fe", -- d175 |   jne B, 0xdae4, ${fail}:rel + PC
    x"84",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d17d |   sub B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"76",x"26",x"b0",x"fe", -- d185 |   jne B, 0x2676, ${fail}:rel + PC
    x"88",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d18d |   mul B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"2b",x"77",x"a0",x"fe", -- d195 |   jne B, 0x772b, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"93",x"00",x"98",x"fe", -- d19d |   jne H, 0x93, ${fail}:rel + PC
    x"8c",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1a5 |   imul B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"2b",x"77",x"88",x"fe", -- d1ad |   jne B, 0x772b, ${fail}:rel + PC
    x"ec",x"ff",x"1c",x"f8",x"e6",x"80",x"fe",       -- d1b5 |   jne H, 0xe6, ${fail}:rel + PC
    x"a0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1bc |   shr B, 0xad, 0xda37
    x"ec",x"40",x"1c",x"f8",x"01",x"71",x"fe",       -- d1c4 |   jne B, 0x1, ${fail}:rel + PC
    x"a4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1cb |   ishr B, 0xad, 0xda37
    x"ec",x"40",x"1c",x"f8",x"01",x"62",x"fe",       -- d1d3 |   jne B, 0x1, ${fail}:rel + PC
    x"a8",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1da |   shl B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"80",x"56",x"53",x"fe", -- d1e2 |   jne B, 0x5680, ${fail}:rel + PC
    x"ac",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1ea |   and B, 0xad, 0xda37
    x"ec",x"40",x"1c",x"f8",x"25",x"43",x"fe",       -- d1f2 |   jne B, 0x25, ${fail}:rel + PC
    x"b0",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d1f9 |   or B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"bf",x"da",x"34",x"fe", -- d201 |   jne B, 0xdabf, ${fail}:rel + PC
    x"b4",x"40",x"e0",x"e0",x"ad",x"00",x"37",x"da", -- d209 |   xor B, 0xad, 0xda37
    x"ec",x"40",x"e0",x"f8",x"9a",x"da",x"24",x"fe", -- d211 |   jne B, 0xda9a, ${fail}:rel + PC
    x"b8",x"40",x"e0",x"ad",x"00",                   -- d219 |   neg B, 0xad
    x"ec",x"40",x"e0",x"f8",x"53",x"ff",x"17",x"fe", -- d21e |   jne B, 0xff53, ${fail}:rel + PC
    x"bc",x"40",x"e0",x"ad",x"00",                   -- d226 |   not B, 0xad
    x"ec",x"40",x"e0",x"f8",x"52",x"ff",x"0a",x"fe", -- d22b |   jne B, 0xff52, ${fail}:rel + PC
    x"c0",x"40",x"e0",x"ad",x"00",                   -- d233 |   bool B, 0xad
    x"ec",x"40",x"1c",x"f8",x"01",x"fd",x"fd",       -- d238 |   jne B, 0x1, ${fail}:rel + PC
    x"c4",x"40",x"e0",x"ad",x"00",                   -- d23f |   inc B, 0xad
    x"ec",x"40",x"e0",x"f8",x"ae",x"00",x"f1",x"fd", -- d244 |   jne B, 0xae, ${fail}:rel + PC
    x"c8",x"40",x"e0",x"ad",x"00",                   -- d24c |   dec B, 0xad
    x"ec",x"40",x"e0",x"f8",x"ac",x"00",x"e4",x"fd", -- d251 |   jne B, 0xac, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d259 |   mov B, 0xf0ad
    x"00",x"40",x"e0",x"3f",x"2a",                   -- d25e |   add B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"ec",x"1a",x"d2",x"fd", -- d263 |   jne B, 0x1aec, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d26b |   mov B, 0xf0ad
    x"04",x"40",x"e0",x"3f",x"2a",                   -- d270 |   sub B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"6e",x"c6",x"c0",x"fd", -- d275 |   jne B, 0xc66e, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d27d |   mov B, 0xf0ad
    x"08",x"40",x"e0",x"3f",x"2a",                   -- d282 |   mul B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"93",x"9c",x"ae",x"fd", -- d287 |   jne B, 0x9c93, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"b7",x"27",x"a6",x"fd", -- d28f |   jne H, 0x27b7, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d297 |   mov B, 0xf0ad
    x"0c",x"40",x"e0",x"3f",x"2a",                   -- d29c |   imul B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"93",x"9c",x"94",x"fd", -- d2a1 |   jne B, 0x9c93, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"78",x"fd",x"8c",x"fd", -- d2a9 |   jne H, 0xfd78, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2b1 |   mov B, 0xf0ad
    x"20",x"40",x"e0",x"3f",x"2a",                   -- d2b6 |   shr B, 0x2a3f
    x"ec",x"40",x"1c",x"f8",x"01",x"7a",x"fd",       -- d2bb |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2c2 |   mov B, 0xf0ad
    x"24",x"40",x"e0",x"3f",x"2a",                   -- d2c7 |   ishr B, 0x2a3f
    x"ec",x"40",x"1c",x"f8",x"ff",x"69",x"fd",       -- d2cc |   jne B, 0xff, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2d3 |   mov B, 0xf0ad
    x"28",x"40",x"e0",x"3f",x"2a",                   -- d2d8 |   shl B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"00",x"80",x"58",x"fd", -- d2dd |   jne B, 0x8000, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2e5 |   mov B, 0xf0ad
    x"2c",x"40",x"e0",x"3f",x"2a",                   -- d2ea |   and B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"2d",x"20",x"46",x"fd", -- d2ef |   jne B, 0x202d, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d2f7 |   mov B, 0xf0ad
    x"30",x"40",x"e0",x"3f",x"2a",                   -- d2fc |   or B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"bf",x"fa",x"34",x"fd", -- d301 |   jne B, 0xfabf, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d309 |   mov B, 0xf0ad
    x"34",x"40",x"e0",x"3f",x"2a",                   -- d30e |   xor B, 0x2a3f
    x"ec",x"40",x"e0",x"f8",x"92",x"da",x"22",x"fd", -- d313 |   jne B, 0xda92, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d31b |   mov B, 0xf0ad
    x"38",x"40",                                     -- d320 |   neg B
    x"ec",x"40",x"e0",x"f8",x"53",x"0f",x"13",x"fd", -- d322 |   jne B, 0xf53, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d32a |   mov B, 0xf0ad
    x"3c",x"40",                                     -- d32f |   not B
    x"ec",x"40",x"e0",x"f8",x"52",x"0f",x"04",x"fd", -- d331 |   jne B, 0xf52, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d339 |   mov B, 0xf0ad
    x"40",x"40",                                     -- d33e |   bool B
    x"ec",x"40",x"1c",x"f8",x"01",x"f5",x"fc",       -- d340 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d347 |   mov B, 0xf0ad
    x"44",x"40",                                     -- d34c |   inc B
    x"ec",x"40",x"e0",x"f8",x"ae",x"f0",x"e7",x"fc", -- d34e |   jne B, 0xf0ae, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d356 |   mov B, 0xf0ad
    x"48",x"40",                                     -- d35b |   dec B
    x"ec",x"40",x"e0",x"f8",x"ac",x"f0",x"d8",x"fc", -- d35d |   jne B, 0xf0ac, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d365 |   mov B, 0
    x"00",x"40",x"e0",x"ad",x"de",                   -- d368 |   add B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"c8",x"fc", -- d36d |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d375 |   mov B, 0
    x"04",x"40",x"e0",x"ad",x"de",                   -- d378 |   sub B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"53",x"21",x"b8",x"fc", -- d37d |   jne B, 0x2153, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d385 |   mov B, 0
    x"08",x"40",x"e0",x"ad",x"de",                   -- d388 |   mul B, 0xdead
    x"ec",x"40",x"00",x"f8",x"a8",x"fc",             -- d38d |   jne B, 0, ${fail}:rel + PC
    x"ec",x"ff",x"00",x"f8",x"a2",x"fc",             -- d393 |   jne H, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d399 |   mov B, 0
    x"0c",x"40",x"e0",x"ad",x"de",                   -- d39c |   imul B, 0xdead
    x"ec",x"40",x"00",x"f8",x"94",x"fc",             -- d3a1 |   jne B, 0, ${fail}:rel + PC
    x"ec",x"ff",x"00",x"f8",x"8e",x"fc",             -- d3a7 |   jne H, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3ad |   mov B, 0
    x"20",x"40",x"e0",x"ad",x"de",                   -- d3b0 |   shr B, 0xdead
    x"ec",x"40",x"00",x"f8",x"80",x"fc",             -- d3b5 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3bb |   mov B, 0
    x"24",x"40",x"e0",x"ad",x"de",                   -- d3be |   ishr B, 0xdead
    x"ec",x"40",x"00",x"f8",x"72",x"fc",             -- d3c3 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3c9 |   mov B, 0
    x"28",x"40",x"e0",x"ad",x"de",                   -- d3cc |   shl B, 0xdead
    x"ec",x"40",x"00",x"f8",x"64",x"fc",             -- d3d1 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3d7 |   mov B, 0
    x"2c",x"40",x"e0",x"ad",x"de",                   -- d3da |   and B, 0xdead
    x"ec",x"40",x"00",x"f8",x"56",x"fc",             -- d3df |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3e5 |   mov B, 0
    x"30",x"40",x"e0",x"ad",x"de",                   -- d3e8 |   or B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"48",x"fc", -- d3ed |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d3f5 |   mov B, 0
    x"34",x"40",x"e0",x"ad",x"de",                   -- d3f8 |   xor B, 0xdead
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"38",x"fc", -- d3fd |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d405 |   mov B, 0
    x"38",x"40",                                     -- d408 |   neg B
    x"ec",x"40",x"00",x"f8",x"2b",x"fc",             -- d40a |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d410 |   mov B, 0
    x"3c",x"40",                                     -- d413 |   not B
    x"ec",x"40",x"1c",x"f8",x"ff",x"20",x"fc",       -- d415 |   jne B, 0xff, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d41c |   mov B, 0
    x"40",x"40",                                     -- d41f |   bool B
    x"ec",x"40",x"00",x"f8",x"14",x"fc",             -- d421 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d427 |   mov B, 0
    x"44",x"40",                                     -- d42a |   inc B
    x"ec",x"40",x"1c",x"f8",x"01",x"09",x"fc",       -- d42c |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d433 |   mov B, 0
    x"48",x"40",                                     -- d436 |   dec B
    x"ec",x"40",x"1c",x"f8",x"ff",x"fd",x"fb",       -- d438 |   jne B, 0xff, ${fail}:rel + PC
                                                     --      | alu_test_direct_reg:
    x"60",x"60",x"e0",x"30",x"d2",                   -- d43f |   mov C, 0xd230
    x"60",x"80",x"e0",x"12",x"a0",                   -- d444 |   mov D, 0xa012
    x"80",x"40",x"60",x"80",                         -- d449 |   add B, C, D
    x"ec",x"40",x"e0",x"f8",x"42",x"72",x"e8",x"fb", -- d44d |   jne B, 0x7242, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d455 |   mov C, 0xd230
    x"60",x"80",x"e0",x"12",x"a0",                   -- d45a |   mov D, 0xa012
    x"84",x"40",x"60",x"80",                         -- d45f |   sub B, C, D
    x"ec",x"40",x"e0",x"f8",x"1e",x"32",x"d2",x"fb", -- d463 |   jne B, 0x321e, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d46b |   mov C, 0xd230
    x"60",x"80",x"e0",x"12",x"a0",                   -- d470 |   mov D, 0xa012
    x"88",x"40",x"60",x"80",                         -- d475 |   mul B, C, D
    x"ec",x"40",x"e0",x"f8",x"60",x"c7",x"bc",x"fb", -- d479 |   jne B, 0xc760, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"6c",x"83",x"b4",x"fb", -- d481 |   jne H, 0x836c, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d489 |   mov C, 0xd230
    x"60",x"80",x"e0",x"12",x"a0",                   -- d48e |   mov D, 0xa012
    x"8c",x"40",x"60",x"80",                         -- d493 |   imul B, C, D
    x"ec",x"40",x"e0",x"f8",x"60",x"c7",x"9e",x"fb", -- d497 |   jne B, 0xc760, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"2a",x"11",x"96",x"fb", -- d49f |   jne H, 0x112a, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d4a7 |   mov C, 0xd230
    x"60",x"80",x"e0",x"12",x"a0",                   -- d4ac |   mov D, 0xa012
    x"a0",x"40",x"60",x"80",                         -- d4b1 |   shr B, C, D
    x"ec",x"40",x"e0",x"f8",x"8c",x"34",x"80",x"fb", -- d4b5 |   jne B, 0x348c, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d4bd |   mov C, 0xd230
    x"60",x"80",x"e0",x"12",x"a0",                   -- d4c2 |   mov D, 0xa012
    x"a4",x"40",x"60",x"80",                         -- d4c7 |   ishr B, C, D
    x"ec",x"40",x"e0",x"f8",x"8c",x"f4",x"6a",x"fb", -- d4cb |   jne B, 0xf48c, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d4d3 |   mov C, 0xd230
    x"60",x"80",x"e0",x"12",x"a0",                   -- d4d8 |   mov D, 0xa012
    x"a8",x"40",x"60",x"80",                         -- d4dd |   shl B, C, D
    x"ec",x"40",x"e0",x"f8",x"c0",x"48",x"54",x"fb", -- d4e1 |   jne B, 0x48c0, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d4e9 |   mov C, 0xd230
    x"60",x"80",x"e0",x"12",x"a0",                   -- d4ee |   mov D, 0xa012
    x"ac",x"40",x"60",x"80",                         -- d4f3 |   and B, C, D
    x"ec",x"40",x"e0",x"f8",x"10",x"80",x"3e",x"fb", -- d4f7 |   jne B, 0x8010, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d4ff |   mov C, 0xd230
    x"60",x"80",x"e0",x"12",x"a0",                   -- d504 |   mov D, 0xa012
    x"b0",x"40",x"60",x"80",                         -- d509 |   or B, C, D
    x"ec",x"40",x"e0",x"f8",x"32",x"f2",x"28",x"fb", -- d50d |   jne B, 0xf232, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d515 |   mov C, 0xd230
    x"60",x"80",x"e0",x"12",x"a0",                   -- d51a |   mov D, 0xa012
    x"b4",x"40",x"60",x"80",                         -- d51f |   xor B, C, D
    x"ec",x"40",x"e0",x"f8",x"22",x"72",x"12",x"fb", -- d523 |   jne B, 0x7222, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d52b |   mov C, 0xd230
    x"b8",x"40",x"60",                               -- d530 |   neg B, C
    x"ec",x"40",x"e0",x"f8",x"d0",x"2d",x"02",x"fb", -- d533 |   jne B, 0x2dd0, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d53b |   mov C, 0xd230
    x"bc",x"40",x"60",                               -- d540 |   not B, C
    x"ec",x"40",x"e0",x"f8",x"cf",x"2d",x"f2",x"fa", -- d543 |   jne B, 0x2dcf, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d54b |   mov C, 0xd230
    x"c0",x"40",x"60",                               -- d550 |   bool B, C
    x"ec",x"40",x"1c",x"f8",x"01",x"e2",x"fa",       -- d553 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d55a |   mov C, 0xd230
    x"c4",x"40",x"60",                               -- d55f |   inc B, C
    x"ec",x"40",x"e0",x"f8",x"31",x"d2",x"d3",x"fa", -- d562 |   jne B, 0xd231, ${fail}:rel + PC
    x"60",x"60",x"e0",x"30",x"d2",                   -- d56a |   mov C, 0xd230
    x"c8",x"40",x"60",                               -- d56f |   dec B, C
    x"ec",x"40",x"e0",x"f8",x"2f",x"d2",x"c3",x"fa", -- d572 |   jne B, 0xd22f, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d57a |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d57f |   mov D, 0xda37
    x"80",x"40",x"60",x"80",                         -- d584 |   add B, C, D
    x"ec",x"40",x"e0",x"f8",x"e4",x"da",x"ad",x"fa", -- d588 |   jne B, 0xdae4, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d590 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d595 |   mov D, 0xda37
    x"84",x"40",x"60",x"80",                         -- d59a |   sub B, C, D
    x"ec",x"40",x"e0",x"f8",x"76",x"26",x"97",x"fa", -- d59e |   jne B, 0x2676, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d5a6 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d5ab |   mov D, 0xda37
    x"88",x"40",x"60",x"80",                         -- d5b0 |   mul B, C, D
    x"ec",x"40",x"e0",x"f8",x"2b",x"77",x"81",x"fa", -- d5b4 |   jne B, 0x772b, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"93",x"00",x"79",x"fa", -- d5bc |   jne H, 0x93, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d5c4 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d5c9 |   mov D, 0xda37
    x"8c",x"40",x"60",x"80",                         -- d5ce |   imul B, C, D
    x"ec",x"40",x"e0",x"f8",x"2b",x"77",x"63",x"fa", -- d5d2 |   jne B, 0x772b, ${fail}:rel + PC
    x"ec",x"ff",x"1c",x"f8",x"e6",x"5b",x"fa",       -- d5da |   jne H, 0xe6, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d5e1 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d5e6 |   mov D, 0xda37
    x"a0",x"40",x"60",x"80",                         -- d5eb |   shr B, C, D
    x"ec",x"40",x"1c",x"f8",x"01",x"46",x"fa",       -- d5ef |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d5f6 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d5fb |   mov D, 0xda37
    x"a4",x"40",x"60",x"80",                         -- d600 |   ishr B, C, D
    x"ec",x"40",x"1c",x"f8",x"01",x"31",x"fa",       -- d604 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d60b |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d610 |   mov D, 0xda37
    x"a8",x"40",x"60",x"80",                         -- d615 |   shl B, C, D
    x"ec",x"40",x"e0",x"f8",x"80",x"56",x"1c",x"fa", -- d619 |   jne B, 0x5680, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d621 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d626 |   mov D, 0xda37
    x"ac",x"40",x"60",x"80",                         -- d62b |   and B, C, D
    x"ec",x"40",x"1c",x"f8",x"25",x"06",x"fa",       -- d62f |   jne B, 0x25, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d636 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d63b |   mov D, 0xda37
    x"b0",x"40",x"60",x"80",                         -- d640 |   or B, C, D
    x"ec",x"40",x"e0",x"f8",x"bf",x"da",x"f1",x"f9", -- d644 |   jne B, 0xdabf, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d64c |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d651 |   mov D, 0xda37
    x"b4",x"40",x"60",x"80",                         -- d656 |   xor B, C, D
    x"ec",x"40",x"e0",x"f8",x"9a",x"da",x"db",x"f9", -- d65a |   jne B, 0xda9a, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d662 |   mov C, 0xad
    x"b8",x"40",x"60",                               -- d667 |   neg B, C
    x"ec",x"40",x"e0",x"f8",x"53",x"ff",x"cb",x"f9", -- d66a |   jne B, 0xff53, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d672 |   mov C, 0xad
    x"bc",x"40",x"60",                               -- d677 |   not B, C
    x"ec",x"40",x"e0",x"f8",x"52",x"ff",x"bb",x"f9", -- d67a |   jne B, 0xff52, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d682 |   mov C, 0xad
    x"c0",x"40",x"60",                               -- d687 |   bool B, C
    x"ec",x"40",x"1c",x"f8",x"01",x"ab",x"f9",       -- d68a |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d691 |   mov C, 0xad
    x"c4",x"40",x"60",                               -- d696 |   inc B, C
    x"ec",x"40",x"e0",x"f8",x"ae",x"00",x"9c",x"f9", -- d699 |   jne B, 0xae, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d6a1 |   mov C, 0xad
    x"c8",x"40",x"60",                               -- d6a6 |   dec B, C
    x"ec",x"40",x"e0",x"f8",x"ac",x"00",x"8c",x"f9", -- d6a9 |   jne B, 0xac, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d6b1 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d6b6 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d6bb |   mov B, C
    x"00",x"40",x"80",                               -- d6be |   add B, D
    x"ec",x"40",x"e0",x"f8",x"ec",x"1a",x"74",x"f9", -- d6c1 |   jne B, 0x1aec, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d6c9 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d6ce |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d6d3 |   mov B, C
    x"04",x"40",x"80",                               -- d6d6 |   sub B, D
    x"ec",x"40",x"e0",x"f8",x"6e",x"c6",x"5c",x"f9", -- d6d9 |   jne B, 0xc66e, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d6e1 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d6e6 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d6eb |   mov B, C
    x"08",x"40",x"80",                               -- d6ee |   mul B, D
    x"ec",x"40",x"e0",x"f8",x"93",x"9c",x"44",x"f9", -- d6f1 |   jne B, 0x9c93, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"b7",x"27",x"3c",x"f9", -- d6f9 |   jne H, 0x27b7, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d701 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d706 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d70b |   mov B, C
    x"0c",x"40",x"80",                               -- d70e |   imul B, D
    x"ec",x"40",x"e0",x"f8",x"93",x"9c",x"24",x"f9", -- d711 |   jne B, 0x9c93, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"78",x"fd",x"1c",x"f9", -- d719 |   jne H, 0xfd78, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d721 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d726 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d72b |   mov B, C
    x"20",x"40",x"80",                               -- d72e |   shr B, D
    x"ec",x"40",x"1c",x"f8",x"01",x"04",x"f9",       -- d731 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d738 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d73d |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d742 |   mov B, C
    x"24",x"40",x"80",                               -- d745 |   ishr B, D
    x"ec",x"40",x"1c",x"f8",x"ff",x"ed",x"f8",       -- d748 |   jne B, 0xff, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d74f |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d754 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d759 |   mov B, C
    x"28",x"40",x"80",                               -- d75c |   shl B, D
    x"ec",x"40",x"e0",x"f8",x"00",x"80",x"d6",x"f8", -- d75f |   jne B, 0x8000, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d767 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d76c |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d771 |   mov B, C
    x"2c",x"40",x"80",                               -- d774 |   and B, D
    x"ec",x"40",x"e0",x"f8",x"2d",x"20",x"be",x"f8", -- d777 |   jne B, 0x202d, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d77f |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d784 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d789 |   mov B, C
    x"30",x"40",x"80",                               -- d78c |   or B, D
    x"ec",x"40",x"e0",x"f8",x"bf",x"fa",x"a6",x"f8", -- d78f |   jne B, 0xfabf, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d797 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d79c |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d7a1 |   mov B, C
    x"34",x"40",x"80",                               -- d7a4 |   xor B, D
    x"ec",x"40",x"e0",x"f8",x"92",x"da",x"8e",x"f8", -- d7a7 |   jne B, 0xda92, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d7af |   mov C, 0xf0ad
    x"60",x"40",x"60",                               -- d7b4 |   mov B, C
    x"38",x"40",                                     -- d7b7 |   neg B
    x"ec",x"40",x"e0",x"f8",x"53",x"0f",x"7c",x"f8", -- d7b9 |   jne B, 0xf53, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d7c1 |   mov C, 0xf0ad
    x"60",x"40",x"60",                               -- d7c6 |   mov B, C
    x"3c",x"40",                                     -- d7c9 |   not B
    x"ec",x"40",x"e0",x"f8",x"52",x"0f",x"6a",x"f8", -- d7cb |   jne B, 0xf52, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d7d3 |   mov C, 0xf0ad
    x"60",x"40",x"60",                               -- d7d8 |   mov B, C
    x"40",x"40",                                     -- d7db |   bool B
    x"ec",x"40",x"1c",x"f8",x"01",x"58",x"f8",       -- d7dd |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d7e4 |   mov C, 0xf0ad
    x"60",x"40",x"60",                               -- d7e9 |   mov B, C
    x"44",x"40",                                     -- d7ec |   inc B
    x"ec",x"40",x"e0",x"f8",x"ae",x"f0",x"47",x"f8", -- d7ee |   jne B, 0xf0ae, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d7f6 |   mov C, 0xf0ad
    x"60",x"40",x"60",                               -- d7fb |   mov B, C
    x"48",x"40",                                     -- d7fe |   dec B
    x"ec",x"40",x"e0",x"f8",x"ac",x"f0",x"35",x"f8", -- d800 |   jne B, 0xf0ac, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d808 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d80b |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d810 |   mov B, C
    x"00",x"40",x"80",                               -- d813 |   add B, D
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"1f",x"f8", -- d816 |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d81e |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d821 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d826 |   mov B, C
    x"04",x"40",x"80",                               -- d829 |   sub B, D
    x"ec",x"40",x"e0",x"f8",x"53",x"21",x"09",x"f8", -- d82c |   jne B, 0x2153, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d834 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d837 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d83c |   mov B, C
    x"08",x"40",x"80",                               -- d83f |   mul B, D
    x"ec",x"40",x"00",x"f8",x"f3",x"f7",             -- d842 |   jne B, 0, ${fail}:rel + PC
    x"ec",x"ff",x"00",x"f8",x"ed",x"f7",             -- d848 |   jne H, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d84e |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d851 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d856 |   mov B, C
    x"0c",x"40",x"80",                               -- d859 |   imul B, D
    x"ec",x"40",x"00",x"f8",x"d9",x"f7",             -- d85c |   jne B, 0, ${fail}:rel + PC
    x"ec",x"ff",x"00",x"f8",x"d3",x"f7",             -- d862 |   jne H, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d868 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d86b |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d870 |   mov B, C
    x"20",x"40",x"80",                               -- d873 |   shr B, D
    x"ec",x"40",x"00",x"f8",x"bf",x"f7",             -- d876 |   jne B, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d87c |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d87f |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d884 |   mov B, C
    x"24",x"40",x"80",                               -- d887 |   ishr B, D
    x"ec",x"40",x"00",x"f8",x"ab",x"f7",             -- d88a |   jne B, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d890 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d893 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d898 |   mov B, C
    x"28",x"40",x"80",                               -- d89b |   shl B, D
    x"ec",x"40",x"00",x"f8",x"97",x"f7",             -- d89e |   jne B, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d8a4 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d8a7 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d8ac |   mov B, C
    x"2c",x"40",x"80",                               -- d8af |   and B, D
    x"ec",x"40",x"00",x"f8",x"83",x"f7",             -- d8b2 |   jne B, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d8b8 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d8bb |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d8c0 |   mov B, C
    x"30",x"40",x"80",                               -- d8c3 |   or B, D
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"6f",x"f7", -- d8c6 |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d8ce |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d8d1 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d8d6 |   mov B, C
    x"34",x"40",x"80",                               -- d8d9 |   xor B, D
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"59",x"f7", -- d8dc |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d8e4 |   mov C, 0
    x"60",x"40",x"60",                               -- d8e7 |   mov B, C
    x"38",x"40",                                     -- d8ea |   neg B
    x"ec",x"40",x"00",x"f8",x"49",x"f7",             -- d8ec |   jne B, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d8f2 |   mov C, 0
    x"60",x"40",x"60",                               -- d8f5 |   mov B, C
    x"3c",x"40",                                     -- d8f8 |   not B
    x"ec",x"40",x"1c",x"f8",x"ff",x"3b",x"f7",       -- d8fa |   jne B, 0xff, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d901 |   mov C, 0
    x"60",x"40",x"60",                               -- d904 |   mov B, C
    x"40",x"40",                                     -- d907 |   bool B
    x"ec",x"40",x"00",x"f8",x"2c",x"f7",             -- d909 |   jne B, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d90f |   mov C, 0
    x"60",x"40",x"60",                               -- d912 |   mov B, C
    x"44",x"40",                                     -- d915 |   inc B
    x"ec",x"40",x"1c",x"f8",x"01",x"1e",x"f7",       -- d917 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d91e |   mov C, 0
    x"60",x"40",x"60",                               -- d921 |   mov B, C
    x"48",x"40",                                     -- d924 |   dec B
    x"ec",x"40",x"1c",x"f8",x"ff",x"0f",x"f7",       -- d926 |   jne B, 0xff, ${fail}:rel + PC
                                                     --      | jmp_test:
    x"e8",x"1c",x"1c",x"f8",x"ab",x"2b",x"08",x"f7", -- d92d |   jeq 0xab, 0x2b, ${fail}:rel + PC
    x"ec",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d935 |   jne 0xab, 0x2b, ${_L_test_jmp_1}:rel + PC
    x"58",x"f8",x"f8",x"f6",                         -- d93d |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_1:
    x"f0",x"1c",x"1c",x"f8",x"ab",x"2b",x"f4",x"f6", -- d941 |   jlt 0xab, 0x2b, ${fail}:rel + PC
    x"f4",x"1c",x"1c",x"f8",x"ab",x"2b",x"ec",x"f6", -- d949 |   jle 0xab, 0x2b, ${fail}:rel + PC
    x"f8",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d951 |   jgt 0xab, 0x2b, ${_L_test_jmp_2}:rel + PC
    x"58",x"f8",x"dc",x"f6",                         -- d959 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_2:
    x"fc",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d95d |   jge 0xab, 0x2b, ${_L_test_jmp_3}:rel + PC
    x"58",x"f8",x"d0",x"f6",                         -- d965 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_3:
    x"50",x"1c",x"1c",x"ab",x"2b",                   -- d969 |   cmp 0xab, 0x2b
    x"68",x"f8",x"c7",x"f6",                         -- d96e |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d972 |   jne ${_L_test_jmp_4}:rel + PC
    x"58",x"f8",x"bf",x"f6",                         -- d976 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_4:
    x"70",x"f8",x"bb",x"f6",                         -- d97a |   jlt ${fail}:rel + PC
    x"74",x"f8",x"b7",x"f6",                         -- d97e |   jle ${fail}:rel + PC
    x"78",x"f8",x"08",x"00",                         -- d982 |   jgt ${_L_test_jmp_5}:rel + PC
    x"58",x"f8",x"af",x"f6",                         -- d986 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_5:
    x"7c",x"f8",x"08",x"00",                         -- d98a |   jge ${_L_test_jmp_6}:rel + PC
    x"58",x"f8",x"a7",x"f6",                         -- d98e |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_6:
    x"d0",x"1c",x"1c",x"ab",x"2b",                   -- d992 |   icmp 0xab, 0x2b
    x"68",x"f8",x"9e",x"f6",                         -- d997 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d99b |   jne ${_L_test_jmp_7}:rel + PC
    x"58",x"f8",x"96",x"f6",                         -- d99f |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_7:
    x"70",x"f8",x"08",x"00",                         -- d9a3 |   jlt ${_L_test_jmp_8}:rel + PC
    x"58",x"f8",x"8e",x"f6",                         -- d9a7 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_8:
    x"74",x"f8",x"08",x"00",                         -- d9ab |   jle ${_L_test_jmp_9}:rel + PC
    x"58",x"f8",x"86",x"f6",                         -- d9af |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_9:
    x"78",x"f8",x"82",x"f6",                         -- d9b3 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"7e",x"f6",                         -- d9b7 |   jge ${fail}:rel + PC
    x"e8",x"1c",x"1c",x"f8",x"2b",x"ab",x"7a",x"f6", -- d9bb |   jeq 0x2b, 0xab, ${fail}:rel + PC
    x"ec",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d9c3 |   jne 0x2b, 0xab, ${_L_test_jmp_10}:rel + PC
    x"58",x"f8",x"6a",x"f6",                         -- d9cb |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_10:
    x"f0",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d9cf |   jlt 0x2b, 0xab, ${_L_test_jmp_11}:rel + PC
    x"58",x"f8",x"5e",x"f6",                         -- d9d7 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_11:
    x"f4",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d9db |   jle 0x2b, 0xab, ${_L_test_jmp_12}:rel + PC
    x"58",x"f8",x"52",x"f6",                         -- d9e3 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_12:
    x"f8",x"1c",x"1c",x"f8",x"2b",x"ab",x"4e",x"f6", -- d9e7 |   jgt 0x2b, 0xab, ${fail}:rel + PC
    x"fc",x"1c",x"1c",x"f8",x"2b",x"ab",x"46",x"f6", -- d9ef |   jge 0x2b, 0xab, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"2b",x"ab",                   -- d9f7 |   cmp 0x2b, 0xab
    x"68",x"f8",x"39",x"f6",                         -- d9fc |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- da00 |   jne ${_L_test_jmp_13}:rel + PC
    x"58",x"f8",x"31",x"f6",                         -- da04 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_13:
    x"70",x"f8",x"08",x"00",                         -- da08 |   jlt ${_L_test_jmp_14}:rel + PC
    x"58",x"f8",x"29",x"f6",                         -- da0c |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_14:
    x"74",x"f8",x"08",x"00",                         -- da10 |   jle ${_L_test_jmp_15}:rel + PC
    x"58",x"f8",x"21",x"f6",                         -- da14 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_15:
    x"78",x"f8",x"1d",x"f6",                         -- da18 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"19",x"f6",                         -- da1c |   jge ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"2b",x"ab",                   -- da20 |   icmp 0x2b, 0xab
    x"68",x"f8",x"10",x"f6",                         -- da25 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- da29 |   jne ${_L_test_jmp_16}:rel + PC
    x"58",x"f8",x"08",x"f6",                         -- da2d |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_16:
    x"70",x"f8",x"04",x"f6",                         -- da31 |   jlt ${fail}:rel + PC
    x"74",x"f8",x"00",x"f6",                         -- da35 |   jle ${fail}:rel + PC
    x"78",x"f8",x"08",x"00",                         -- da39 |   jgt ${_L_test_jmp_17}:rel + PC
    x"58",x"f8",x"f8",x"f5",                         -- da3d |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_17:
    x"7c",x"f8",x"08",x"00",                         -- da41 |   jge ${_L_test_jmp_18}:rel + PC
    x"58",x"f8",x"f0",x"f5",                         -- da45 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_18:
    x"e8",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- da49 |   jeq 0xab, 0xab, ${_L_test_jmp_19}:rel + PC
    x"58",x"f8",x"e4",x"f5",                         -- da51 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_19:
    x"ec",x"1c",x"1c",x"f8",x"ab",x"ab",x"e0",x"f5", -- da55 |   jne 0xab, 0xab, ${fail}:rel + PC
    x"f0",x"1c",x"1c",x"f8",x"ab",x"ab",x"d8",x"f5", -- da5d |   jlt 0xab, 0xab, ${fail}:rel + PC
    x"f4",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- da65 |   jle 0xab, 0xab, ${_L_test_jmp_20}:rel + PC
    x"58",x"f8",x"c8",x"f5",                         -- da6d |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_20:
    x"f8",x"1c",x"1c",x"f8",x"ab",x"ab",x"c4",x"f5", -- da71 |   jgt 0xab, 0xab, ${fail}:rel + PC
    x"fc",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- da79 |   jge 0xab, 0xab, ${_L_test_jmp_21}:rel + PC
    x"58",x"f8",x"b4",x"f5",                         -- da81 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_21:
    x"50",x"1c",x"1c",x"ab",x"ab",                   -- da85 |   cmp 0xab, 0xab
    x"68",x"f8",x"08",x"00",                         -- da8a |   jeq ${_L_test_jmp_22}:rel + PC
    x"58",x"f8",x"a7",x"f5",                         -- da8e |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_22:
    x"6c",x"f8",x"a3",x"f5",                         -- da92 |   jne ${fail}:rel + PC
    x"70",x"f8",x"9f",x"f5",                         -- da96 |   jlt ${fail}:rel + PC
    x"74",x"f8",x"08",x"00",                         -- da9a |   jle ${_L_test_jmp_23}:rel + PC
    x"58",x"f8",x"97",x"f5",                         -- da9e |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_23:
    x"78",x"f8",x"93",x"f5",                         -- daa2 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"08",x"00",                         -- daa6 |   jge ${_L_test_jmp_24}:rel + PC
    x"58",x"f8",x"8b",x"f5",                         -- daaa |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_24:
    x"d0",x"1c",x"1c",x"ab",x"ab",                   -- daae |   icmp 0xab, 0xab
    x"68",x"f8",x"08",x"00",                         -- dab3 |   jeq ${_L_test_jmp_25}:rel + PC
    x"58",x"f8",x"7e",x"f5",                         -- dab7 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_25:
    x"6c",x"f8",x"7a",x"f5",                         -- dabb |   jne ${fail}:rel + PC
    x"70",x"f8",x"76",x"f5",                         -- dabf |   jlt ${fail}:rel + PC
    x"74",x"f8",x"08",x"00",                         -- dac3 |   jle ${_L_test_jmp_26}:rel + PC
    x"58",x"f8",x"6e",x"f5",                         -- dac7 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_26:
    x"78",x"f8",x"6a",x"f5",                         -- dacb |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"08",x"00",                         -- dacf |   jge ${_L_test_jmp_27}:rel + PC
    x"58",x"f8",x"62",x"f5",                         -- dad3 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_27:
                                                     --      | test_uop_get_arg:
    x"60",x"a0",x"e0",x"00",x"70",                   -- dad7 |   mov SP, 0x7000
    x"60",x"20",x"e0",x"aa",x"00",                   -- dadc |   mov A, 0xaa
    x"60",x"40",x"e0",x"bb",x"00",                   -- dae1 |   mov B, 0xbb
    x"60",x"fe",x"e0",x"55",x"01",                   -- dae6 |   mov G, 0x155
    x"b6",x"e0",x"1c",x"fe",x"39",x"30",x"85",       -- daeb |   xor [0x3039], -123, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d0",x"fe",x"43",x"f5", -- daf2 |   jne [0x3039], 0xfed0, ${fail}:rel + PC
    x"ae",x"3e",x"fe",x"21",x"f6",                   -- dafc |   and [A*4 + -10], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"54",x"01",x"34",x"f5", -- db01 |   jne [0x29e], 0x154, ${fail}:rel + PC
    x"86",x"21",x"e4",x"3e",x"de",x"fa",x"f6",       -- db0b |   sub [A*2], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ea",x"f8",x"23",x"f5", -- db12 |   jne [0x154], 0xf8ea, ${fail}:rel + PC
    x"a6",x"e0",x"20",x"21",x"39",x"30",             -- db1c |   ishr [0x3039], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"0a",x"13",x"f5", -- db22 |   jne [0x3039], 0xa, ${fail}:rel + PC
    x"aa",x"fe",x"2a",x"3e",x"f6",                   -- db2b |   shl [G], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"c0",x"05",x"f5", -- db30 |   jne [0x155], 0xc000, ${fail}:rel + PC
    x"b2",x"fe",x"1c",x"fe",x"85",                   -- db3a |   or [G], -123, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"d5",x"f6",x"f4", -- db3f |   jne [0x155], 0xd5, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"20",x"85",                   -- db48 |   mul [A*4 + B], -123, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"52",x"ae",x"e8",x"f4", -- db4d |   jne [0x363], 0xae52, ${fail}:rel + PC
    x"a6",x"e0",x"e0",x"2a",x"39",x"30",x"39",x"30", -- db57 |   ishr [0x3039], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"07",x"06",x"d6",x"f4", -- db5f |   jne [0x3039], 0x607, ${fail}:rel + PC
    x"a2",x"21",x"e4",x"21",x"de",x"fa",             -- db69 |   shr [A*2], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b8",x"0f",x"c6",x"f4", -- db6f |   jne [0x154], 0xfb8, ${fail}:rel + PC
    x"82",x"21",x"fe",x"fe",                         -- db79 |   add [A*2], G, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"02",x"b8",x"f4", -- db7d |   jne [0x154], 0x2aa, ${fail}:rel + PC
    x"a6",x"fe",x"e4",x"20",x"de",x"fa",             -- db87 |   ishr [G], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"fe",x"a8",x"f4", -- db8d |   jne [0x155], 0xfe, ${fail}:rel + PC
    x"82",x"e0",x"e4",x"2a",x"39",x"30",x"de",x"fa", -- db96 |   add [0x3039], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"eb",x"fe",x"97",x"f4", -- db9e |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
    x"a6",x"20",x"20",x"20",                         -- dba8 |   ishr [A], A, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"89",x"f4", -- dbac |   jne [0xaa], 0, ${fail}:rel + PC
    x"82",x"fe",x"2a",x"20",                         -- dbb4 |   add [G], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0d",x"04",x"7d",x"f4", -- dbb8 |   jne [0x155], 0x40d, ${fail}:rel + PC
    x"b6",x"fe",x"fe",x"fe",                         -- dbc2 |   xor [G], G, G
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"6f",x"f4", -- dbc6 |   jne [0x155], 0, ${fail}:rel + PC
    x"aa",x"21",x"fe",x"21",                         -- dbce |   shl [A*2], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"50",x"15",x"63",x"f4", -- dbd2 |   jne [0x154], 0x1550, ${fail}:rel + PC
    x"a6",x"fe",x"e0",x"21",x"39",x"30",             -- dbdc |   ishr [G], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"03",x"03",x"53",x"f4", -- dbe2 |   jne [0x155], 0x303, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"e4",x"de",x"fa",             -- dbec |   and [A*2], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"03",x"43",x"f4", -- dbf2 |   jne [0x154], 0x300, ${fail}:rel + PC
    x"82",x"20",x"3e",x"3e",x"f6",x"f6",             -- dbfc |   add [A], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"3c",x"05",x"33",x"f4", -- dc02 |   jne [0xaa], 0x53c, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"1c",x"39",x"30",x"85",       -- dc0c |   or [0x3039], A*2, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"d5",x"22",x"f4", -- dc13 |   jne [0x3039], 0xd5, ${fail}:rel + PC
    x"82",x"e0",x"fe",x"fe",x"39",x"30",             -- dc1c |   add [0x3039], G, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"02",x"13",x"f4", -- dc22 |   jne [0x3039], 0x2aa, ${fail}:rel + PC
    x"ae",x"fe",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- dc2c |   and [G], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"08",x"30",x"01",x"f4", -- dc34 |   jne [0x155], 0x3008, ${fail}:rel + PC
    x"8e",x"e0",x"2a",x"3e",x"39",x"30",x"f6",       -- dc3e |   imul [0x3039], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"1a",x"dd",x"f0",x"f3", -- dc45 |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
    x"b2",x"21",x"e0",x"20",x"39",x"30",             -- dc4f |   or [A*2], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"bb",x"30",x"e0",x"f3", -- dc55 |   jne [0x154], 0x30bb, ${fail}:rel + PC
    x"8e",x"21",x"3e",x"21",x"f6",                   -- dc5f |   imul [A*2], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"d8",x"79",x"d1",x"f3", -- dc64 |   jne [0x154], 0x79d8, ${fail}:rel + PC
    x"82",x"3e",x"1c",x"2a",x"f6",x"85",             -- dc6e |   add [A*4 + -10], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e8",x"02",x"c1",x"f3", -- dc74 |   jne [0x29e], 0x2e8, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"21",x"de",x"fa",             -- dc7e |   sub [G], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"34",x"fa",x"b1",x"f3", -- dc84 |   jne [0x155], 0xfa34, ${fail}:rel + PC
    x"b2",x"2a",x"e4",x"21",x"de",x"fa",             -- dc8e |   or [A*4 + B], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"dc",x"fb",x"a1",x"f3", -- dc94 |   jne [0x363], 0xfbdc, ${fail}:rel + PC
    x"ae",x"21",x"21",x"20",                         -- dc9e |   and [A*2], A*2, A
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"93",x"f3", -- dca2 |   jne [0x154], 0, ${fail}:rel + PC
    x"86",x"2a",x"2a",x"fe",                         -- dcaa |   sub [A*4 + B], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"0e",x"02",x"87",x"f3", -- dcae |   jne [0x363], 0x20e, ${fail}:rel + PC
    x"82",x"3e",x"3e",x"20",x"f6",x"f6",             -- dcb8 |   add [A*4 + -10], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"48",x"03",x"77",x"f3", -- dcbe |   jne [0x29e], 0x348, ${fail}:rel + PC
    x"86",x"21",x"e0",x"e0",x"39",x"30",x"39",x"30", -- dcc8 |   sub [A*2], 0x3039, 0x3039
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"65",x"f3", -- dcd0 |   jne [0x154], 0, ${fail}:rel + PC
    x"a2",x"20",x"1c",x"fe",x"85",                   -- dcd8 |   shr [A], -123, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"fc",x"07",x"58",x"f3", -- dcdd |   jne [0xaa], 0x7fc, ${fail}:rel + PC
    x"aa",x"2a",x"1c",x"2a",x"85",                   -- dce7 |   shl [A*4 + B], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"28",x"fc",x"49",x"f3", -- dcec |   jne [0x363], 0xfc28, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"20",                         -- dcf6 |   or [A*4 + B], A, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"aa",x"00",x"3b",x"f3", -- dcfa |   jne [0x363], 0xaa, ${fail}:rel + PC
    x"86",x"20",x"20",x"1c",x"85",                   -- dd04 |   sub [A], A, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"25",x"01",x"2c",x"f3", -- dd09 |   jne [0xaa], 0x125, ${fail}:rel + PC
    x"a6",x"3e",x"e4",x"21",x"f6",x"de",x"fa",       -- dd13 |   ishr [A*4 + -10], 0xfade + A, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"b8",x"1b",x"f3", -- dd1a |   jne [0x29e], 0xb8, ${fail}:rel + PC
    x"86",x"20",x"e0",x"e0",x"39",x"30",x"39",x"30", -- dd23 |   sub [A], 0x3039, 0x3039
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"0a",x"f3", -- dd2b |   jne [0xaa], 0, ${fail}:rel + PC
    x"82",x"fe",x"e0",x"e0",x"39",x"30",x"39",x"30", -- dd33 |   add [G], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"72",x"60",x"fa",x"f2", -- dd3b |   jne [0x155], 0x6072, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- dd45 |   shr [A*4 + B], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"fb",x"00",x"e8",x"f2", -- dd4d |   jne [0x363], 0xfb, ${fail}:rel + PC
    x"8e",x"20",x"20",x"fe",                         -- dd57 |   imul [A], A, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"72",x"e2",x"da",x"f2", -- dd5b |   jne [0xaa], 0xe272, ${fail}:rel + PC
    x"a2",x"21",x"e4",x"2a",x"de",x"fa",             -- dd65 |   shr [A*2], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"71",x"1f",x"ca",x"f2", -- dd6b |   jne [0x154], 0x1f71, ${fail}:rel + PC
    x"a2",x"2a",x"2a",x"1c",x"85",                   -- dd75 |   shr [A*4 + B], A*4 + B, -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"1b",x"bb",x"f2", -- dd7a |   jne [0x363], 0x1b, ${fail}:rel + PC
    x"a2",x"20",x"21",x"2a",                         -- dd83 |   shr [A], A*2, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"2a",x"ae",x"f2", -- dd87 |   jne [0xaa], 0x2a, ${fail}:rel + PC
    x"ae",x"e0",x"2a",x"20",x"39",x"30",             -- dd90 |   and [0x3039], A*4 + B, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"22",x"9f",x"f2", -- dd96 |   jne [0x3039], 0x22, ${fail}:rel + PC
    x"a2",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"39",x"30", -- dd9f |   shr [0x3039], 0x3039, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"18",x"8c",x"f2", -- dda9 |   jne [0x3039], 0x18, ${fail}:rel + PC
    x"8a",x"20",x"fe",x"3e",x"f6",                   -- ddb2 |   mul [A], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"76",x"7c",x"7e",x"f2", -- ddb7 |   jne [0xaa], 0x7c76, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"2a",x"39",x"30",             -- ddc1 |   add [A*4 + B], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"9c",x"33",x"6e",x"f2", -- ddc7 |   jne [0x363], 0x339c, ${fail}:rel + PC
    x"8e",x"fe",x"3e",x"2a",x"f6",                   -- ddd1 |   imul [G], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"1a",x"dd",x"5f",x"f2", -- ddd6 |   jne [0x155], 0xdd1a, ${fail}:rel + PC
    x"aa",x"20",x"21",x"e0",x"39",x"30",             -- dde0 |   shl [A], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"a8",x"4f",x"f2", -- dde6 |   jne [0xaa], 0xa800, ${fail}:rel + PC
    x"82",x"21",x"fe",x"20",                         -- ddf0 |   add [A*2], G, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"01",x"41",x"f2", -- ddf4 |   jne [0x154], 0x1ff, ${fail}:rel + PC
    x"82",x"2a",x"2a",x"21",                         -- ddfe |   add [A*4 + B], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"b7",x"04",x"33",x"f2", -- de02 |   jne [0x363], 0x4b7, ${fail}:rel + PC
    x"a2",x"20",x"fe",x"e4",x"de",x"fa",             -- de0c |   shr [A], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"01",x"23",x"f2", -- de12 |   jne [0xaa], 0x1, ${fail}:rel + PC
    x"82",x"fe",x"1c",x"20",x"85",                   -- de1b |   add [G], -123, A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"2f",x"15",x"f2", -- de20 |   jne [0x155], 0x2f, ${fail}:rel + PC
    x"8e",x"3e",x"fe",x"e0",x"f6",x"39",x"30",       -- de29 |   imul [A*4 + -10], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ed",x"3b",x"05",x"f2", -- de30 |   jne [0x29e], 0x3bed, ${fail}:rel + PC
    x"8a",x"fe",x"e4",x"2a",x"de",x"fa",             -- de3a |   mul [G], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"98",x"dd",x"f5",x"f1", -- de40 |   jne [0x155], 0xdd98, ${fail}:rel + PC
    x"a2",x"fe",x"fe",x"20",                         -- de4a |   shr [G], G, A
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"e7",x"f1", -- de4e |   jne [0x155], 0, ${fail}:rel + PC
    x"b2",x"21",x"20",x"20",                         -- de56 |   or [A*2], A, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"00",x"db",x"f1", -- de5a |   jne [0x154], 0xaa, ${fail}:rel + PC
    x"b2",x"3e",x"1c",x"21",x"f6",x"85",             -- de64 |   or [A*4 + -10], -123, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"d5",x"cb",x"f1", -- de6a |   jne [0x29e], 0xd5, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"1c",x"85",x"85",             -- de73 |   mul [A*4 + B], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"19",x"3b",x"bc",x"f1", -- de79 |   jne [0x363], 0x3b19, ${fail}:rel + PC
    x"8a",x"e0",x"e4",x"21",x"39",x"30",x"de",x"fa", -- de83 |   mul [0x3039], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"a0",x"10",x"aa",x"f1", -- de8b |   jne [0x3039], 0x10a0, ${fail}:rel + PC
    x"86",x"fe",x"20",x"3e",x"f6",                   -- de95 |   sub [G], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0c",x"fe",x"9b",x"f1", -- de9a |   jne [0x155], 0xfe0c, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"21",                         -- dea4 |   shl [A], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"30",x"36",x"8d",x"f1", -- dea8 |   jne [0xaa], 0x3630, ${fail}:rel + PC
    x"b6",x"21",x"1c",x"2a",x"85",                   -- deb2 |   xor [A*2], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"e6",x"fc",x"7e",x"f1", -- deb7 |   jne [0x154], 0xfce6, ${fail}:rel + PC
    x"86",x"2a",x"3e",x"1c",x"f6",x"85",             -- dec1 |   sub [A*4 + B], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"19",x"03",x"6e",x"f1", -- dec7 |   jne [0x363], 0x319, ${fail}:rel + PC
    x"86",x"e0",x"e0",x"e4",x"39",x"30",x"39",x"30",x"de",x"fa", -- ded1 |   sub [0x3039], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"b1",x"34",x"5a",x"f1", -- dedb |   jne [0x3039], 0x34b1, ${fail}:rel + PC
    x"ae",x"fe",x"2a",x"e4",x"de",x"fa",             -- dee5 |   and [G], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"03",x"4a",x"f1", -- deeb |   jne [0x155], 0x300, ${fail}:rel + PC
    x"aa",x"20",x"3e",x"fe",x"f6",                   -- def5 |   shl [A], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"c0",x"53",x"3b",x"f1", -- defa |   jne [0xaa], 0x53c0, ${fail}:rel + PC
    x"a6",x"fe",x"fe",x"e4",x"de",x"fa",             -- df04 |   ishr [G], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"01",x"2b",x"f1", -- df0a |   jne [0x155], 0x1, ${fail}:rel + PC
    x"ae",x"21",x"e0",x"2a",x"39",x"30",             -- df13 |   and [A*2], 0x3039, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"21",x"1c",x"f1", -- df19 |   jne [0x154], 0x21, ${fail}:rel + PC
    x"a6",x"21",x"21",x"1c",x"85",                   -- df22 |   ishr [A*2], A*2, -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"0a",x"0e",x"f1", -- df27 |   jne [0x154], 0xa, ${fail}:rel + PC
    x"b6",x"fe",x"21",x"e0",x"39",x"30",             -- df30 |   xor [G], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"6d",x"31",x"ff",x"f0", -- df36 |   jne [0x155], 0x316d, ${fail}:rel + PC
    x"86",x"2a",x"3e",x"2a",x"f6",                   -- df40 |   sub [A*4 + B], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"3b",x"ff",x"f0",x"f0", -- df45 |   jne [0x363], 0xff3b, ${fail}:rel + PC
    x"b2",x"e0",x"fe",x"1c",x"39",x"30",x"85",       -- df4f |   or [0x3039], G, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"d5",x"df",x"f0", -- df56 |   jne [0x3039], 0xd5, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"20",x"f6",                   -- df5f |   shl [A*4 + B], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"78",x"d1",x"f0", -- df64 |   jne [0x363], 0x7800, ${fail}:rel + PC
    x"86",x"e0",x"21",x"20",x"39",x"30",             -- df6e |   sub [0x3039], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"00",x"c1",x"f0", -- df74 |   jne [0x3039], 0xaa, ${fail}:rel + PC
    x"b6",x"e0",x"2a",x"21",x"39",x"30",             -- df7e |   xor [0x3039], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"37",x"02",x"b1",x"f0", -- df84 |   jne [0x3039], 0x237, ${fail}:rel + PC
    x"ae",x"2a",x"e0",x"1c",x"39",x"30",x"85",       -- df8e |   and [A*4 + B], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"01",x"30",x"a0",x"f0", -- df95 |   jne [0x363], 0x3001, ${fail}:rel + PC
    x"8e",x"fe",x"2a",x"e0",x"39",x"30",             -- df9f |   imul [G], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0b",x"51",x"90",x"f0", -- dfa5 |   jne [0x155], 0x510b, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"fe",                         -- dfaf |   or [A*4 + B], A, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ff",x"01",x"82",x"f0", -- dfb3 |   jne [0x363], 0x1ff, ${fail}:rel + PC
    x"a6",x"3e",x"e0",x"20",x"f6",x"39",x"30",       -- dfbd |   ishr [A*4 + -10], 0x3039, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"0c",x"71",x"f0", -- dfc4 |   jne [0x29e], 0xc, ${fail}:rel + PC
    x"aa",x"e0",x"e4",x"e4",x"39",x"30",x"de",x"fa",x"de",x"fa", -- dfcd |   shl [0x3039], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"88",x"5e",x"f0", -- dfd7 |   jne [0x3039], 0x8800, ${fail}:rel + PC
    x"aa",x"20",x"e0",x"fe",x"39",x"30",             -- dfe1 |   shl [A], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"20",x"07",x"4e",x"f0", -- dfe7 |   jne [0xaa], 0x720, ${fail}:rel + PC
    x"b6",x"fe",x"3e",x"21",x"f6",                   -- dff1 |   xor [G], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"ca",x"03",x"3f",x"f0", -- dff6 |   jne [0x155], 0x3ca, ${fail}:rel + PC
    x"b2",x"2a",x"fe",x"1c",x"85",                   -- e000 |   or [A*4 + B], G, -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"d5",x"30",x"f0", -- e005 |   jne [0x363], 0xd5, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"e0",x"f6",x"85",x"39",x"30", -- e00e |   sub [A*4 + -10], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"4c",x"cf",x"1f",x"f0", -- e016 |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
    x"aa",x"21",x"21",x"21",                         -- e020 |   shl [A*2], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"40",x"15",x"11",x"f0", -- e024 |   jne [0x154], 0x1540, ${fail}:rel + PC
    x"86",x"e0",x"e4",x"e0",x"39",x"30",x"de",x"fa",x"39",x"30", -- e02e |   sub [0x3039], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"4f",x"cb",x"fd",x"ef", -- e038 |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
    x"a2",x"21",x"e0",x"1c",x"39",x"30",x"85",       -- e042 |   shr [A*2], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"81",x"01",x"ec",x"ef", -- e049 |   jne [0x154], 0x181, ${fail}:rel + PC
    x"a6",x"e0",x"e4",x"20",x"39",x"30",x"de",x"fa", -- e053 |   ishr [0x3039], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"fe",x"da",x"ef", -- e05b |   jne [0x3039], 0xfe, ${fail}:rel + PC
    x"b6",x"3e",x"e4",x"e0",x"f6",x"de",x"fa",x"39",x"30", -- e064 |   xor [A*4 + -10], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b1",x"cb",x"c8",x"ef", -- e06d |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
    x"86",x"3e",x"21",x"3e",x"f6",x"f6",             -- e077 |   sub [A*4 + -10], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b6",x"fe",x"b8",x"ef", -- e07d |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
    x"8e",x"fe",x"1c",x"3e",x"85",x"f6",             -- e087 |   imul [G], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"16",x"be",x"a8",x"ef", -- e08d |   jne [0x155], 0xbe16, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"2a",                         -- e097 |   shl [A], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"18",x"1b",x"9a",x"ef", -- e09b |   jne [0xaa], 0x1b18, ${fail}:rel + PC
    x"b6",x"e0",x"21",x"2a",x"39",x"30",             -- e0a5 |   xor [0x3039], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"37",x"02",x"8a",x"ef", -- e0ab |   jne [0x3039], 0x237, ${fail}:rel + PC
    x"82",x"21",x"21",x"e0",x"39",x"30",             -- e0b5 |   add [A*2], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"8d",x"31",x"7a",x"ef", -- e0bb |   jne [0x154], 0x318d, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"20",                         -- e0c5 |   and [A*2], A*4 + B, A
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"22",x"6c",x"ef", -- e0c9 |   jne [0x154], 0x22, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"e4",x"de",x"fa",             -- e0d2 |   shl [A], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"63",x"5d",x"ef", -- e0d8 |   jne [0xaa], 0x6300, ${fail}:rel + PC
    x"ae",x"2a",x"fe",x"20",                         -- e0e2 |   and [A*4 + B], G, A
    x"ee",x"e0",x"00",x"f8",x"63",x"03",x"4f",x"ef", -- e0e6 |   jne [0x363], 0, ${fail}:rel + PC
    x"b6",x"fe",x"21",x"1c",x"85",                   -- e0ee |   xor [G], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"d1",x"fe",x"42",x"ef", -- e0f3 |   jne [0x155], 0xfed1, ${fail}:rel + PC
    x"ae",x"e0",x"fe",x"21",x"39",x"30",             -- e0fd |   and [0x3039], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"32",x"ef", -- e103 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"b2",x"3e",x"e0",x"2a",x"f6",x"39",x"30",       -- e10d |   or [A*4 + -10], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"7b",x"33",x"21",x"ef", -- e114 |   jne [0x29e], 0x337b, ${fail}:rel + PC
    x"b6",x"fe",x"e4",x"3e",x"de",x"fa",x"f6",       -- e11e |   xor [G], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"16",x"f9",x"10",x"ef", -- e125 |   jne [0x155], 0xf916, ${fail}:rel + PC
    x"8e",x"2a",x"21",x"2a",                         -- e12f |   imul [A*4 + B], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"7c",x"7f",x"02",x"ef", -- e133 |   jne [0x363], 0x7f7c, ${fail}:rel + PC
    x"a6",x"fe",x"21",x"fe",                         -- e13d |   ishr [G], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"0a",x"f4",x"ee", -- e141 |   jne [0x155], 0xa, ${fail}:rel + PC
    x"8a",x"21",x"1c",x"1c",x"85",x"85",             -- e14a |   mul [A*2], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"19",x"3b",x"e5",x"ee", -- e150 |   jne [0x154], 0x3b19, ${fail}:rel + PC
    x"8e",x"2a",x"e4",x"20",x"de",x"fa",             -- e15a |   imul [A*4 + B], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"50",x"08",x"d5",x"ee", -- e160 |   jne [0x363], 0x850, ${fail}:rel + PC
    x"a2",x"3e",x"3e",x"3e",x"f6",x"f6",x"f6",       -- e16a |   shr [A*4 + -10], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"9e",x"02",x"c4",x"ee", -- e171 |   jne [0x29e], 0, ${fail}:rel + PC
    x"8a",x"20",x"1c",x"e4",x"85",x"de",x"fa",       -- e179 |   mul [A], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a8",x"25",x"b5",x"ee", -- e180 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
    x"a6",x"3e",x"20",x"21",x"f6",                   -- e18a |   ishr [A*4 + -10], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"0a",x"a6",x"ee", -- e18f |   jne [0x29e], 0xa, ${fail}:rel + PC
    x"b2",x"3e",x"20",x"20",x"f6",                   -- e198 |   or [A*4 + -10], A, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"aa",x"00",x"98",x"ee", -- e19d |   jne [0x29e], 0xaa, ${fail}:rel + PC
    x"82",x"e0",x"fe",x"e0",x"39",x"30",x"39",x"30", -- e1a7 |   add [0x3039], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"8e",x"31",x"86",x"ee", -- e1af |   jne [0x3039], 0x318e, ${fail}:rel + PC
    x"8e",x"3e",x"e0",x"3e",x"f6",x"39",x"30",x"f6", -- e1b9 |   imul [A*4 + -10], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"2e",x"35",x"74",x"ee", -- e1c1 |   jne [0x29e], 0x352e, ${fail}:rel + PC
    x"a6",x"fe",x"fe",x"21",                         -- e1cb |   ishr [G], G, A*2
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"15",x"66",x"ee", -- e1cf |   jne [0x155], 0x15, ${fail}:rel + PC
    x"8e",x"20",x"e4",x"3e",x"de",x"fa",x"f6",       -- e1d8 |   imul [A], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"f0",x"4d",x"56",x"ee", -- e1df |   jne [0xaa], 0x4df0, ${fail}:rel + PC
    x"a6",x"fe",x"20",x"fe",                         -- e1e9 |   ishr [G], A, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"05",x"48",x"ee", -- e1ed |   jne [0x155], 0x5, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"3e",x"39",x"30",x"f6",       -- e1f6 |   add [A*4 + B], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d7",x"32",x"38",x"ee", -- e1fd |   jne [0x363], 0x32d7, ${fail}:rel + PC
    x"ae",x"3e",x"2a",x"e4",x"f6",x"de",x"fa",       -- e207 |   and [A*4 + -10], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"03",x"27",x"ee", -- e20e |   jne [0x29e], 0x300, ${fail}:rel + PC
    x"8e",x"20",x"1c",x"2a",x"85",                   -- e218 |   imul [A], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"6f",x"5f",x"18",x"ee", -- e21d |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
    x"a2",x"fe",x"3e",x"e4",x"f6",x"de",x"fa",       -- e227 |   shr [G], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"02",x"07",x"ee", -- e22e |   jne [0x155], 0x2, ${fail}:rel + PC
    x"b2",x"2a",x"e0",x"20",x"39",x"30",             -- e237 |   or [A*4 + B], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"bb",x"30",x"f8",x"ed", -- e23d |   jne [0x363], 0x30bb, ${fail}:rel + PC
    x"b6",x"2a",x"e0",x"fe",x"39",x"30",             -- e247 |   xor [A*4 + B], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"6c",x"31",x"e8",x"ed", -- e24d |   jne [0x363], 0x316c, ${fail}:rel + PC
    x"8e",x"20",x"20",x"e0",x"39",x"30",             -- e257 |   imul [A], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"da",x"05",x"d8",x"ed", -- e25d |   jne [0xaa], 0x5da, ${fail}:rel + PC
    x"b2",x"21",x"2a",x"3e",x"f6",                   -- e267 |   or [A*2], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"03",x"c9",x"ed", -- e26c |   jne [0x154], 0x3ff, ${fail}:rel + PC
    x"aa",x"fe",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- e276 |   shl [G], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"10",x"b7",x"ed", -- e27e |   jne [0x155], 0x1000, ${fail}:rel + PC
    x"a6",x"2a",x"e4",x"2a",x"de",x"fa",             -- e288 |   ishr [A*4 + B], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"71",x"ff",x"a7",x"ed", -- e28e |   jne [0x363], 0xff71, ${fail}:rel + PC
    x"aa",x"3e",x"e4",x"1c",x"f6",x"de",x"fa",x"85", -- e298 |   shl [A*4 + -10], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"71",x"95",x"ed", -- e2a0 |   jne [0x29e], 0x7100, ${fail}:rel + PC
    x"a2",x"3e",x"e4",x"20",x"f6",x"de",x"fa",       -- e2aa |   shr [A*4 + -10], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"3e",x"84",x"ed", -- e2b1 |   jne [0x29e], 0x3e, ${fail}:rel + PC
    x"8a",x"3e",x"20",x"2a",x"f6",                   -- e2ba |   mul [A*4 + -10], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"be",x"3f",x"76",x"ed", -- e2bf |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
    x"b2",x"21",x"3e",x"2a",x"f6",                   -- e2c9 |   or [A*2], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"03",x"67",x"ed", -- e2ce |   jne [0x154], 0x3ff, ${fail}:rel + PC
    x"8e",x"3e",x"21",x"1c",x"f6",x"85",             -- e2d8 |   imul [A*4 + -10], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"a4",x"5c",x"57",x"ed", -- e2de |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
    x"aa",x"e0",x"3e",x"21",x"39",x"30",x"f6",       -- e2e8 |   shl [0x3039], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"e0",x"29",x"46",x"ed", -- e2ef |   jne [0x3039], 0x29e0, ${fail}:rel + PC
    x"aa",x"21",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- e2f9 |   shl [A*2], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"88",x"34",x"ed", -- e301 |   jne [0x154], 0x8800, ${fail}:rel + PC
    x"82",x"fe",x"21",x"21",                         -- e30b |   add [G], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"a8",x"02",x"26",x"ed", -- e30f |   jne [0x155], 0x2a8, ${fail}:rel + PC
    x"ae",x"21",x"e4",x"fe",x"de",x"fa",             -- e319 |   and [A*2], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"01",x"16",x"ed", -- e31f |   jne [0x154], 0x100, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"e0",x"f6",x"39",x"30",x"39",x"30", -- e329 |   and [A*4 + -10], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"39",x"30",x"03",x"ed", -- e332 |   jne [0x29e], 0x3039, ${fail}:rel + PC
    x"aa",x"3e",x"20",x"1c",x"f6",x"85",             -- e33c |   shl [A*4 + -10], A, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"40",x"15",x"f3",x"ec", -- e342 |   jne [0x29e], 0x1540, ${fail}:rel + PC
    x"ae",x"2a",x"3e",x"e4",x"f6",x"de",x"fa",       -- e34c |   and [A*4 + B], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"88",x"02",x"e2",x"ec", -- e353 |   jne [0x363], 0x288, ${fail}:rel + PC
    x"82",x"fe",x"1c",x"1c",x"85",x"85",             -- e35d |   add [G], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0a",x"ff",x"d2",x"ec", -- e363 |   jne [0x155], 0xff0a, ${fail}:rel + PC
    x"8a",x"20",x"20",x"e4",x"de",x"fa",             -- e36d |   mul [A], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"50",x"08",x"c2",x"ec", -- e373 |   jne [0xaa], 0x850, ${fail}:rel + PC
    x"b2",x"21",x"2a",x"fe",                         -- e37d |   or [A*2], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"77",x"03",x"b4",x"ec", -- e381 |   jne [0x154], 0x377, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- e38b |   sub [G], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"a2",x"ec", -- e393 |   jne [0x155], 0, ${fail}:rel + PC
    x"a2",x"2a",x"fe",x"e4",x"de",x"fa",             -- e39b |   shr [A*4 + B], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"94",x"ec", -- e3a1 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"86",x"21",x"1c",x"fe",x"85",                   -- e3aa |   sub [A*2], -123, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"30",x"fe",x"86",x"ec", -- e3af |   jne [0x154], 0xfe30, ${fail}:rel + PC
    x"aa",x"3e",x"21",x"fe",x"f6",                   -- e3b9 |   shl [A*4 + -10], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"80",x"2a",x"77",x"ec", -- e3be |   jne [0x29e], 0x2a80, ${fail}:rel + PC
    x"aa",x"20",x"1c",x"3e",x"85",x"f6",             -- e3c8 |   shl [A], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"40",x"67",x"ec", -- e3ce |   jne [0xaa], 0x4000, ${fail}:rel + PC
    x"8a",x"3e",x"2a",x"21",x"f6",                   -- e3d8 |   mul [A*4 + -10], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"7c",x"7f",x"58",x"ec", -- e3dd |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
    x"a2",x"20",x"2a",x"fe",                         -- e3e7 |   shr [A], A*4 + B, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"1b",x"4a",x"ec", -- e3eb |   jne [0xaa], 0x1b, ${fail}:rel + PC
    x"82",x"20",x"2a",x"e0",x"39",x"30",             -- e3f4 |   add [A], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9c",x"33",x"3b",x"ec", -- e3fa |   jne [0xaa], 0x339c, ${fail}:rel + PC
    x"b6",x"fe",x"e0",x"1c",x"39",x"30",x"85",       -- e404 |   xor [G], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"bc",x"cf",x"2a",x"ec", -- e40b |   jne [0x155], 0xcfbc, ${fail}:rel + PC
    x"86",x"20",x"e4",x"2a",x"de",x"fa",             -- e415 |   sub [A], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"25",x"f8",x"1a",x"ec", -- e41b |   jne [0xaa], 0xf825, ${fail}:rel + PC
    x"a6",x"2a",x"21",x"fe",                         -- e425 |   ishr [A*4 + B], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"0a",x"0c",x"ec", -- e429 |   jne [0x363], 0xa, ${fail}:rel + PC
    x"b2",x"21",x"fe",x"e4",x"de",x"fa",             -- e432 |   or [A*2], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"dd",x"fb",x"fd",x"eb", -- e438 |   jne [0x154], 0xfbdd, ${fail}:rel + PC
    x"8a",x"e0",x"e4",x"fe",x"39",x"30",x"de",x"fa", -- e442 |   mul [0x3039], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"28",x"0c",x"eb",x"eb", -- e44a |   jne [0x3039], 0xc28, ${fail}:rel + PC
    x"8e",x"2a",x"2a",x"e4",x"de",x"fa",             -- e454 |   imul [A*4 + B], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"98",x"dd",x"db",x"eb", -- e45a |   jne [0x363], 0xdd98, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"fe",x"39",x"30",             -- e464 |   and [0x3039], A, G
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"cb",x"eb", -- e46a |   jne [0x3039], 0, ${fail}:rel + PC
    x"8e",x"fe",x"fe",x"2a",                         -- e472 |   imul [G], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"df",x"82",x"bf",x"eb", -- e476 |   jne [0x155], 0x82df, ${fail}:rel + PC
    x"8e",x"3e",x"21",x"21",x"f6",                   -- e480 |   imul [A*4 + -10], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"90",x"c3",x"b0",x"eb", -- e485 |   jne [0x29e], 0xc390, ${fail}:rel + PC
    x"b2",x"fe",x"e4",x"1c",x"de",x"fa",x"85",       -- e48f |   or [G], 0xfade + A, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"8d",x"9f",x"eb", -- e496 |   jne [0x155], 0x8d, ${fail}:rel + PC
    x"8e",x"2a",x"20",x"3e",x"f6",                   -- e49f |   imul [A*4 + B], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ec",x"bc",x"91",x"eb", -- e4a4 |   jne [0x363], 0xbcec, ${fail}:rel + PC
    x"a2",x"2a",x"3e",x"e0",x"f6",x"39",x"30",       -- e4ae |   shr [A*4 + B], A*4 + -10, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"80",x"eb", -- e4b5 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"b6",x"2a",x"21",x"e0",x"39",x"30",             -- e4be |   xor [A*4 + B], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"6d",x"31",x"71",x"eb", -- e4c4 |   jne [0x363], 0x316d, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"e0",x"39",x"30",x"f6",x"39",x"30", -- e4ce |   shr [0x3039], A*4 + -10, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"01",x"5e",x"eb", -- e4d7 |   jne [0x3039], 0x1, ${fail}:rel + PC
    x"a2",x"21",x"1c",x"3e",x"85",x"f6",             -- e4e0 |   shr [A*2], -123, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"03",x"4f",x"eb", -- e4e6 |   jne [0x154], 0x3, ${fail}:rel + PC
    x"b2",x"21",x"20",x"21",                         -- e4ef |   or [A*2], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"fe",x"01",x"42",x"eb", -- e4f3 |   jne [0x154], 0x1fe, ${fail}:rel + PC
    x"a2",x"fe",x"2a",x"21",                         -- e4fd |   shr [G], A*4 + B, A*2
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"36",x"34",x"eb", -- e501 |   jne [0x155], 0x36, ${fail}:rel + PC
    x"b6",x"e0",x"3e",x"2a",x"39",x"30",x"f6",       -- e50a |   xor [0x3039], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"fd",x"01",x"24",x"eb", -- e511 |   jne [0x3039], 0x1fd, ${fail}:rel + PC
    x"8a",x"3e",x"e4",x"3e",x"f6",x"de",x"fa",x"f6", -- e51b |   mul [A*4 + -10], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"f0",x"4d",x"12",x"eb", -- e523 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
    x"8e",x"2a",x"21",x"3e",x"f6",                   -- e52d |   imul [A*4 + B], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d8",x"79",x"03",x"eb", -- e532 |   jne [0x363], 0x79d8, ${fail}:rel + PC
    x"a2",x"e0",x"e4",x"3e",x"39",x"30",x"de",x"fa",x"f6", -- e53c |   shr [0x3039], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"03",x"f0",x"ea", -- e545 |   jne [0x3039], 0x3, ${fail}:rel + PC
    x"82",x"3e",x"20",x"fe",x"f6",                   -- e54e |   add [A*4 + -10], A, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ff",x"01",x"e2",x"ea", -- e553 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- e55d |   shr [A*4 + B], 0xfade + A, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"7d",x"d0",x"ea", -- e565 |   jne [0x363], 0x7d, ${fail}:rel + PC
    x"a2",x"3e",x"1c",x"1c",x"f6",x"85",x"85",       -- e56e |   shr [A*4 + -10], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"fc",x"07",x"c0",x"ea", -- e575 |   jne [0x29e], 0x7fc, ${fail}:rel + PC
    x"8e",x"20",x"1c",x"e0",x"85",x"39",x"30",       -- e57f |   imul [A], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9d",x"d4",x"af",x"ea", -- e586 |   jne [0xaa], 0xd49d, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"21",x"f6",                   -- e590 |   shl [A*4 + B], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"e0",x"29",x"a0",x"ea", -- e595 |   jne [0x363], 0x29e0, ${fail}:rel + PC
    x"b6",x"21",x"e0",x"fe",x"39",x"30",             -- e59f |   xor [A*2], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"6c",x"31",x"90",x"ea", -- e5a5 |   jne [0x154], 0x316c, ${fail}:rel + PC
    x"b6",x"e0",x"3e",x"3e",x"39",x"30",x"f6",x"f6", -- e5af |   xor [0x3039], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"7e",x"ea", -- e5b7 |   jne [0x3039], 0, ${fail}:rel + PC
    x"b6",x"20",x"21",x"1c",x"85",                   -- e5bf |   xor [A], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d1",x"fe",x"71",x"ea", -- e5c4 |   jne [0xaa], 0xfed1, ${fail}:rel + PC
    x"b6",x"21",x"21",x"fe",                         -- e5ce |   xor [A*2], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"01",x"63",x"ea", -- e5d2 |   jne [0x154], 0x1, ${fail}:rel + PC
    x"8a",x"fe",x"e0",x"20",x"39",x"30",             -- e5db |   mul [G], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"da",x"05",x"54",x"ea", -- e5e1 |   jne [0x155], 0x5da, ${fail}:rel + PC
    x"b6",x"21",x"e0",x"21",x"39",x"30",             -- e5eb |   xor [A*2], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"6d",x"31",x"44",x"ea", -- e5f1 |   jne [0x154], 0x316d, ${fail}:rel + PC
    x"8a",x"21",x"2a",x"e0",x"39",x"30",             -- e5fb |   mul [A*2], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"0b",x"51",x"34",x"ea", -- e601 |   jne [0x154], 0x510b, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"1c",x"f6",x"39",x"30",x"85", -- e60b |   and [A*4 + -10], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"01",x"30",x"22",x"ea", -- e613 |   jne [0x29e], 0x3001, ${fail}:rel + PC
    x"aa",x"fe",x"21",x"20",                         -- e61d |   shl [G], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"50",x"14",x"ea", -- e621 |   jne [0x155], 0x5000, ${fail}:rel + PC
    x"ae",x"20",x"e4",x"20",x"de",x"fa",             -- e62b |   and [A], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"88",x"00",x"04",x"ea", -- e631 |   jne [0xaa], 0x88, ${fail}:rel + PC
    x"aa",x"21",x"3e",x"e4",x"f6",x"de",x"fa",       -- e63b |   shl [A*2], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"9e",x"f3",x"e9", -- e642 |   jne [0x154], 0x9e00, ${fail}:rel + PC
    x"b6",x"e0",x"e0",x"1c",x"39",x"30",x"39",x"30",x"85", -- e64c |   xor [0x3039], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"bc",x"cf",x"e0",x"e9", -- e655 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
    x"8a",x"3e",x"3e",x"1c",x"f6",x"f6",x"85",       -- e65f |   mul [A*4 + -10], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"16",x"be",x"cf",x"e9", -- e666 |   jne [0x29e], 0xbe16, ${fail}:rel + PC
    x"86",x"fe",x"21",x"3e",x"f6",                   -- e670 |   sub [G], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"b6",x"fe",x"c0",x"e9", -- e675 |   jne [0x155], 0xfeb6, ${fail}:rel + PC
    x"86",x"3e",x"2a",x"fe",x"f6",                   -- e67f |   sub [A*4 + -10], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"0e",x"02",x"b1",x"e9", -- e684 |   jne [0x29e], 0x20e, ${fail}:rel + PC
    x"b6",x"3e",x"1c",x"fe",x"f6",x"85",             -- e68e |   xor [A*4 + -10], -123, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"d0",x"fe",x"a1",x"e9", -- e694 |   jne [0x29e], 0xfed0, ${fail}:rel + PC
    x"86",x"20",x"2a",x"1c",x"85",                   -- e69e |   sub [A], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"de",x"03",x"92",x"e9", -- e6a3 |   jne [0xaa], 0x3de, ${fail}:rel + PC
    x"86",x"20",x"21",x"fe",                         -- e6ad |   sub [A], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"ff",x"84",x"e9", -- e6b1 |   jne [0xaa], 0xff, ${fail}:rel + PC
    x"86",x"2a",x"20",x"e4",x"de",x"fa",             -- e6ba |   sub [A*4 + B], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"22",x"05",x"75",x"e9", -- e6c0 |   jne [0x363], 0x522, ${fail}:rel + PC
    x"aa",x"e0",x"fe",x"3e",x"39",x"30",x"f6",       -- e6ca |   shl [0x3039], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"40",x"64",x"e9", -- e6d1 |   jne [0x3039], 0x4000, ${fail}:rel + PC
    x"ae",x"20",x"1c",x"1c",x"85",x"85",             -- e6db |   and [A], -123, -123
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"85",x"54",x"e9", -- e6e1 |   jne [0xaa], 0x85, ${fail}:rel + PC
    x"b6",x"20",x"fe",x"e0",x"39",x"30",             -- e6ea |   xor [A], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"6c",x"31",x"45",x"e9", -- e6f0 |   jne [0xaa], 0x316c, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"3e",x"39",x"30",x"f6",       -- e6fa |   or [0x3039], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"de",x"03",x"34",x"e9", -- e701 |   jne [0x3039], 0x3de, ${fail}:rel + PC
    x"b2",x"20",x"e4",x"21",x"de",x"fa",             -- e70b |   or [A], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"fb",x"24",x"e9", -- e711 |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
    x"b6",x"fe",x"3e",x"3e",x"f6",x"f6",             -- e71b |   xor [G], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"14",x"e9", -- e721 |   jne [0x155], 0, ${fail}:rel + PC
    x"b6",x"3e",x"20",x"e4",x"f6",x"de",x"fa",       -- e729 |   xor [A*4 + -10], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"22",x"fb",x"05",x"e9", -- e730 |   jne [0x29e], 0xfb22, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"e0",x"39",x"30",x"85",x"39",x"30", -- e73a |   xor [0x3039], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"bc",x"cf",x"f2",x"e8", -- e743 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
    x"a2",x"3e",x"fe",x"2a",x"f6",                   -- e74d |   shr [A*4 + -10], G, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"2a",x"e3",x"e8", -- e752 |   jne [0x29e], 0x2a, ${fail}:rel + PC
    x"ae",x"20",x"fe",x"20",                         -- e75b |   and [A], G, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"d6",x"e8", -- e75f |   jne [0xaa], 0, ${fail}:rel + PC
    x"86",x"2a",x"e4",x"1c",x"de",x"fa",x"85",       -- e767 |   sub [A*4 + B], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"03",x"fc",x"c7",x"e8", -- e76e |   jne [0x363], 0xfc03, ${fail}:rel + PC
    x"ae",x"e0",x"21",x"21",x"39",x"30",             -- e778 |   and [0x3039], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"b7",x"e8", -- e77e |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"a2",x"e0",x"20",x"e0",x"39",x"30",x"39",x"30", -- e788 |   shr [0x3039], A, 0x3039
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"a5",x"e8", -- e790 |   jne [0x3039], 0, ${fail}:rel + PC
    x"8e",x"3e",x"2a",x"3e",x"f6",x"f6",             -- e798 |   imul [A*4 + -10], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"1a",x"dd",x"97",x"e8", -- e79e |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"1c",x"39",x"30",x"f6",x"85", -- e7a8 |   shr [0x3039], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"14",x"85",x"e8", -- e7b0 |   jne [0x3039], 0x14, ${fail}:rel + PC
    x"82",x"fe",x"20",x"e0",x"39",x"30",             -- e7b9 |   add [G], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"e3",x"30",x"76",x"e8", -- e7bf |   jne [0x155], 0x30e3, ${fail}:rel + PC
    x"a6",x"e0",x"21",x"e0",x"39",x"30",x"39",x"30", -- e7c9 |   ishr [0x3039], A*2, 0x3039
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"64",x"e8", -- e7d1 |   jne [0x3039], 0, ${fail}:rel + PC
    x"a6",x"e0",x"e4",x"1c",x"39",x"30",x"de",x"fa",x"85", -- e7d9 |   ishr [0x3039], 0xfade + A, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"dc",x"53",x"e8", -- e7e2 |   jne [0x3039], 0xdc, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"20",x"f6",                   -- e7eb |   or [A*4 + -10], G, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ff",x"01",x"45",x"e8", -- e7f0 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
    x"a6",x"2a",x"2a",x"20",                         -- e7fa |   ishr [A*4 + B], A*4 + B, A
    x"ee",x"e0",x"00",x"f8",x"63",x"03",x"37",x"e8", -- e7fe |   jne [0x363], 0, ${fail}:rel + PC
    x"aa",x"fe",x"e0",x"2a",x"39",x"30",             -- e806 |   shl [G], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"c8",x"81",x"29",x"e8", -- e80c |   jne [0x155], 0x81c8, ${fail}:rel + PC
    x"8a",x"21",x"3e",x"20",x"f6",                   -- e816 |   mul [A*2], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ec",x"bc",x"1a",x"e8", -- e81b |   jne [0x154], 0xbcec, ${fail}:rel + PC
    x"8e",x"3e",x"3e",x"e0",x"f6",x"f6",x"39",x"30", -- e825 |   imul [A*4 + -10], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"2e",x"35",x"08",x"e8", -- e82d |   jne [0x29e], 0x352e, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"3e",x"39",x"30",x"85",x"f6", -- e837 |   xor [0x3039], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"1b",x"fd",x"f6",x"e7", -- e83f |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"e4",x"de",x"fa",             -- e849 |   or [G], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"fb",x"e6",x"e7", -- e84f |   jne [0x155], 0xfbaa, ${fail}:rel + PC
    x"8e",x"fe",x"fe",x"3e",x"f6",                   -- e859 |   imul [G], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"76",x"7c",x"d7",x"e7", -- e85e |   jne [0x155], 0x7c76, ${fail}:rel + PC
    x"8a",x"20",x"e0",x"3e",x"39",x"30",x"f6",       -- e868 |   mul [A], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"2e",x"35",x"c6",x"e7", -- e86f |   jne [0xaa], 0x352e, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"20",                         -- e879 |   or [G], A, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"00",x"b8",x"e7", -- e87d |   jne [0x155], 0xaa, ${fail}:rel + PC
    x"a2",x"3e",x"21",x"e4",x"f6",x"de",x"fa",       -- e887 |   shr [A*4 + -10], A*2, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"01",x"a7",x"e7", -- e88e |   jne [0x29e], 0x1, ${fail}:rel + PC
    x"a6",x"20",x"3e",x"2a",x"f6",                   -- e897 |   ishr [A], A*4 + -10, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"53",x"99",x"e7", -- e89c |   jne [0xaa], 0x53, ${fail}:rel + PC
    x"82",x"20",x"e0",x"20",x"39",x"30",             -- e8a5 |   add [A], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"e3",x"30",x"8a",x"e7", -- e8ab |   jne [0xaa], 0x30e3, ${fail}:rel + PC
    x"a6",x"20",x"1c",x"20",x"85",                   -- e8b5 |   ishr [A], -123, A
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"ff",x"7b",x"e7", -- e8ba |   jne [0xaa], 0xff, ${fail}:rel + PC
    x"ae",x"21",x"20",x"1c",x"85",                   -- e8c3 |   and [A*2], A, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"80",x"00",x"6d",x"e7", -- e8c8 |   jne [0x154], 0x80, ${fail}:rel + PC
    x"b6",x"2a",x"1c",x"e4",x"85",x"de",x"fa",       -- e8d2 |   xor [A*4 + B], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"0d",x"04",x"5c",x"e7", -- e8d9 |   jne [0x363], 0x40d, ${fail}:rel + PC
    x"82",x"20",x"e0",x"21",x"39",x"30",             -- e8e3 |   add [A], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"8d",x"31",x"4c",x"e7", -- e8e9 |   jne [0xaa], 0x318d, ${fail}:rel + PC
    x"82",x"21",x"fe",x"2a",                         -- e8f3 |   add [A*2], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b8",x"04",x"3e",x"e7", -- e8f7 |   jne [0x154], 0x4b8, ${fail}:rel + PC
    x"b2",x"20",x"2a",x"20",                         -- e901 |   or [A], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"eb",x"03",x"30",x"e7", -- e905 |   jne [0xaa], 0x3eb, ${fail}:rel + PC
    x"82",x"21",x"1c",x"e0",x"85",x"39",x"30",       -- e90f |   add [A*2], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"be",x"2f",x"1f",x"e7", -- e916 |   jne [0x154], 0x2fbe, ${fail}:rel + PC
    x"aa",x"fe",x"2a",x"1c",x"85",                   -- e920 |   shl [G], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"60",x"6c",x"10",x"e7", -- e925 |   jne [0x155], 0x6c60, ${fail}:rel + PC
    x"82",x"3e",x"3e",x"2a",x"f6",x"f6",             -- e92f |   add [A*4 + -10], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"01",x"06",x"00",x"e7", -- e935 |   jne [0x29e], 0x601, ${fail}:rel + PC
    x"b2",x"20",x"3e",x"e4",x"f6",x"de",x"fa",       -- e93f |   or [A], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9e",x"fb",x"ef",x"e6", -- e946 |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
    x"aa",x"2a",x"21",x"1c",x"85",                   -- e950 |   shl [A*4 + B], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"80",x"2a",x"e0",x"e6", -- e955 |   jne [0x363], 0x2a80, ${fail}:rel + PC
    x"b2",x"e0",x"1c",x"2a",x"39",x"30",x"85",       -- e95f |   or [0x3039], -123, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"e7",x"cf",x"e6", -- e966 |   jne [0x3039], 0xe7, ${fail}:rel + PC
    x"82",x"21",x"2a",x"2a",                         -- e96f |   add [A*2], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"c6",x"06",x"c2",x"e6", -- e973 |   jne [0x154], 0x6c6, ${fail}:rel + PC
    x"ae",x"20",x"21",x"20",                         -- e97d |   and [A], A*2, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"b4",x"e6", -- e981 |   jne [0xaa], 0, ${fail}:rel + PC
    x"86",x"20",x"fe",x"1c",x"85",                   -- e989 |   sub [A], G, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d0",x"01",x"a7",x"e6", -- e98e |   jne [0xaa], 0x1d0, ${fail}:rel + PC
    x"b2",x"20",x"2a",x"3e",x"f6",                   -- e998 |   or [A], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ff",x"03",x"98",x"e6", -- e99d |   jne [0xaa], 0x3ff, ${fail}:rel + PC
    x"b6",x"2a",x"20",x"2a",                         -- e9a7 |   xor [A*4 + B], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"c9",x"03",x"8a",x"e6", -- e9ab |   jne [0x363], 0x3c9, ${fail}:rel + PC
    x"aa",x"21",x"fe",x"3e",x"f6",                   -- e9b5 |   shl [A*2], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"40",x"7b",x"e6", -- e9ba |   jne [0x154], 0x4000, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"21",x"f6",x"39",x"30",       -- e9c4 |   and [A*4 + -10], 0x3039, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"10",x"6a",x"e6", -- e9cb |   jne [0x29e], 0x10, ${fail}:rel + PC
    x"a2",x"e0",x"2a",x"e4",x"39",x"30",x"de",x"fa", -- e9d4 |   shr [0x3039], A*4 + B, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"03",x"59",x"e6", -- e9dc |   jne [0x3039], 0x3, ${fail}:rel + PC
    x"8a",x"fe",x"21",x"2a",                         -- e9e5 |   mul [G], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"7c",x"7f",x"4c",x"e6", -- e9e9 |   jne [0x155], 0x7f7c, ${fail}:rel + PC
    x"a2",x"3e",x"3e",x"fe",x"f6",x"f6",             -- e9f3 |   shr [A*4 + -10], A*4 + -10, G
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"14",x"3c",x"e6", -- e9f9 |   jne [0x29e], 0x14, ${fail}:rel + PC
    x"8a",x"20",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- ea02 |   mul [A], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"48",x"81",x"2b",x"e6", -- ea0a |   jne [0xaa], 0x8148, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"3e",x"85",x"f6",             -- ea14 |   mul [A*4 + B], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"16",x"be",x"1b",x"e6", -- ea1a |   jne [0x363], 0xbe16, ${fail}:rel + PC
    x"ae",x"2a",x"1c",x"fe",x"85",                   -- ea24 |   and [A*4 + B], -123, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"05",x"01",x"0c",x"e6", -- ea29 |   jne [0x363], 0x105, ${fail}:rel + PC
    x"aa",x"e0",x"e0",x"20",x"39",x"30",x"39",x"30", -- ea33 |   shl [0x3039], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"e4",x"fa",x"e5", -- ea3b |   jne [0x3039], 0xe400, ${fail}:rel + PC
    x"8e",x"20",x"fe",x"2a",                         -- ea45 |   imul [A], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"df",x"82",x"ec",x"e5", -- ea49 |   jne [0xaa], 0x82df, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"3e",x"f6",x"85",x"f6",       -- ea53 |   sub [A*4 + -10], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e7",x"fc",x"db",x"e5", -- ea5a |   jne [0x29e], 0xfce7, ${fail}:rel + PC
    x"aa",x"21",x"20",x"2a",                         -- ea64 |   shl [A*2], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"50",x"05",x"cd",x"e5", -- ea68 |   jne [0x154], 0x550, ${fail}:rel + PC
    x"82",x"20",x"3e",x"21",x"f6",                   -- ea72 |   add [A], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"f2",x"03",x"be",x"e5", -- ea77 |   jne [0xaa], 0x3f2, ${fail}:rel + PC
    x"8a",x"21",x"fe",x"1c",x"85",                   -- ea81 |   mul [A*2], G, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"29",x"5c",x"af",x"e5", -- ea86 |   jne [0x154], 0x5c29, ${fail}:rel + PC
    x"8a",x"fe",x"1c",x"e0",x"85",x"39",x"30",       -- ea90 |   mul [G], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"9d",x"d4",x"9e",x"e5", -- ea97 |   jne [0x155], 0xd49d, ${fail}:rel + PC
    x"a6",x"e0",x"2a",x"2a",x"39",x"30",             -- eaa1 |   ishr [0x3039], A*4 + B, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"6c",x"8e",x"e5", -- eaa7 |   jne [0x3039], 0x6c, ${fail}:rel + PC
    x"82",x"2a",x"1c",x"21",x"85",                   -- eab0 |   add [A*4 + B], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d9",x"00",x"80",x"e5", -- eab5 |   jne [0x363], 0xd9, ${fail}:rel + PC
    x"8a",x"e0",x"e0",x"fe",x"39",x"30",x"39",x"30", -- eabf |   mul [0x3039], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"ed",x"3b",x"6e",x"e5", -- eac7 |   jne [0x3039], 0x3bed, ${fail}:rel + PC
    x"b2",x"e0",x"2a",x"fe",x"39",x"30",             -- ead1 |   or [0x3039], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"77",x"03",x"5e",x"e5", -- ead7 |   jne [0x3039], 0x377, ${fail}:rel + PC
    x"aa",x"2a",x"1c",x"e0",x"85",x"39",x"30",       -- eae1 |   shl [A*4 + B], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"0a",x"4d",x"e5", -- eae8 |   jne [0x363], 0xa00, ${fail}:rel + PC
    x"8a",x"fe",x"1c",x"2a",x"85",                   -- eaf2 |   mul [G], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"6f",x"5f",x"3e",x"e5", -- eaf7 |   jne [0x155], 0x5f6f, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"fe",x"f6",x"39",x"30",       -- eb01 |   and [A*4 + -10], 0x3039, G
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"11",x"2d",x"e5", -- eb08 |   jne [0x29e], 0x11, ${fail}:rel + PC
    x"a6",x"2a",x"21",x"e4",x"de",x"fa",             -- eb11 |   ishr [A*4 + B], A*2, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"1e",x"e5", -- eb17 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"b2",x"21",x"21",x"2a",                         -- eb20 |   or [A*2], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"77",x"03",x"11",x"e5", -- eb24 |   jne [0x154], 0x377, ${fail}:rel + PC
    x"ae",x"2a",x"fe",x"fe",                         -- eb2e |   and [A*4 + B], G, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"55",x"01",x"03",x"e5", -- eb32 |   jne [0x363], 0x155, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"3e",x"f6",x"f6",             -- eb3c |   shl [A*4 + B], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"80",x"f3",x"e4", -- eb42 |   jne [0x363], 0x8000, ${fail}:rel + PC
    x"86",x"3e",x"2a",x"1c",x"f6",x"85",             -- eb4c |   sub [A*4 + -10], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"de",x"03",x"e3",x"e4", -- eb52 |   jne [0x29e], 0x3de, ${fail}:rel + PC
    x"ae",x"fe",x"fe",x"1c",x"85",                   -- eb5c |   and [G], G, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"05",x"01",x"d4",x"e4", -- eb61 |   jne [0x155], 0x105, ${fail}:rel + PC
    x"a6",x"21",x"3e",x"1c",x"f6",x"85",             -- eb6b |   ishr [A*2], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"14",x"c4",x"e4", -- eb71 |   jne [0x154], 0x14, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"fe",x"39",x"30",             -- eb7a |   or [0x3039], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"55",x"01",x"b5",x"e4", -- eb80 |   jne [0x3039], 0x155, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"21",                         -- eb8a |   or [A*4 + B], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"fe",x"01",x"a7",x"e4", -- eb8e |   jne [0x363], 0x1fe, ${fail}:rel + PC
    x"a2",x"21",x"20",x"e0",x"39",x"30",             -- eb98 |   shr [A*2], A, 0x3039
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"97",x"e4", -- eb9e |   jne [0x154], 0, ${fail}:rel + PC
    x"8e",x"3e",x"3e",x"e4",x"f6",x"f6",x"de",x"fa", -- eba6 |   imul [A*4 + -10], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"f0",x"4d",x"87",x"e4", -- ebae |   jne [0x29e], 0x4df0, ${fail}:rel + PC
    x"a2",x"2a",x"3e",x"fe",x"f6",                   -- ebb8 |   shr [A*4 + B], A*4 + -10, G
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"14",x"78",x"e4", -- ebbd |   jne [0x363], 0x14, ${fail}:rel + PC
    x"aa",x"e0",x"2a",x"1c",x"39",x"30",x"85",       -- ebc6 |   shl [0x3039], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"60",x"6c",x"68",x"e4", -- ebcd |   jne [0x3039], 0x6c60, ${fail}:rel + PC
    x"86",x"e0",x"3e",x"20",x"39",x"30",x"f6",       -- ebd7 |   sub [0x3039], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"f4",x"01",x"57",x"e4", -- ebde |   jne [0x3039], 0x1f4, ${fail}:rel + PC
    x"86",x"fe",x"3e",x"fe",x"f6",                   -- ebe8 |   sub [G], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"49",x"01",x"48",x"e4", -- ebed |   jne [0x155], 0x149, ${fail}:rel + PC
    x"b6",x"20",x"20",x"2a",                         -- ebf7 |   xor [A], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"c9",x"03",x"3a",x"e4", -- ebfb |   jne [0xaa], 0x3c9, ${fail}:rel + PC
    x"a2",x"20",x"21",x"21",                         -- ec05 |   shr [A], A*2, A*2
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"15",x"2c",x"e4", -- ec09 |   jne [0xaa], 0x15, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"21",x"39",x"30",             -- ec12 |   add [A*4 + B], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"8d",x"31",x"1d",x"e4", -- ec18 |   jne [0x363], 0x318d, ${fail}:rel + PC
    x"82",x"fe",x"2a",x"2a",                         -- ec22 |   add [G], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"c6",x"06",x"0f",x"e4", -- ec26 |   jne [0x155], 0x6c6, ${fail}:rel + PC
    x"aa",x"2a",x"2a",x"3e",x"f6",                   -- ec30 |   shl [A*4 + B], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"c0",x"00",x"e4", -- ec35 |   jne [0x363], 0xc000, ${fail}:rel + PC
    x"b6",x"3e",x"2a",x"20",x"f6",                   -- ec3f |   xor [A*4 + -10], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"c9",x"03",x"f1",x"e3", -- ec44 |   jne [0x29e], 0x3c9, ${fail}:rel + PC
    x"8a",x"20",x"e4",x"1c",x"de",x"fa",x"85",       -- ec4e |   mul [A], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a8",x"25",x"e0",x"e3", -- ec55 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"e4",x"f6",x"39",x"30",x"de",x"fa", -- ec5f |   and [A*4 + -10], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"08",x"30",x"cd",x"e3", -- ec68 |   jne [0x29e], 0x3008, ${fail}:rel + PC
    x"82",x"20",x"fe",x"21",                         -- ec72 |   add [A], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a9",x"02",x"bf",x"e3", -- ec76 |   jne [0xaa], 0x2a9, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"fe",x"de",x"fa",             -- ec80 |   sub [G], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"33",x"fa",x"af",x"e3", -- ec86 |   jne [0x155], 0xfa33, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"e4",x"39",x"30",x"f6",x"de",x"fa", -- ec90 |   shr [0x3039], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"02",x"9c",x"e3", -- ec99 |   jne [0x3039], 0x2, ${fail}:rel + PC
    x"a2",x"3e",x"21",x"2a",x"f6",                   -- eca2 |   shr [A*4 + -10], A*2, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"2a",x"8e",x"e3", -- eca7 |   jne [0x29e], 0x2a, ${fail}:rel + PC
    x"a2",x"fe",x"20",x"2a",                         -- ecb0 |   shr [G], A, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"15",x"81",x"e3", -- ecb4 |   jne [0x155], 0x15, ${fail}:rel + PC
    x"8e",x"2a",x"fe",x"21",                         -- ecbd |   imul [A*4 + B], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"e4",x"c4",x"74",x"e3", -- ecc1 |   jne [0x363], 0xc4e4, ${fail}:rel + PC
    x"8a",x"3e",x"e4",x"e4",x"f6",x"de",x"fa",x"de",x"fa", -- eccb |   mul [A*4 + -10], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"40",x"f8",x"61",x"e3", -- ecd4 |   jne [0x29e], 0xf840, ${fail}:rel + PC
    x"82",x"3e",x"2a",x"e0",x"f6",x"39",x"30",       -- ecde |   add [A*4 + -10], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"9c",x"33",x"50",x"e3", -- ece5 |   jne [0x29e], 0x339c, ${fail}:rel + PC
    x"b6",x"2a",x"fe",x"3e",x"f6",                   -- ecef |   xor [A*4 + B], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"cb",x"03",x"41",x"e3", -- ecf4 |   jne [0x363], 0x3cb, ${fail}:rel + PC
    x"b6",x"21",x"e4",x"20",x"de",x"fa",             -- ecfe |   xor [A*2], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"22",x"fb",x"31",x"e3", -- ed04 |   jne [0x154], 0xfb22, ${fail}:rel + PC
    x"a2",x"e0",x"e0",x"21",x"39",x"30",x"39",x"30", -- ed0e |   shr [0x3039], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"03",x"03",x"1f",x"e3", -- ed16 |   jne [0x3039], 0x303, ${fail}:rel + PC
    x"8e",x"2a",x"fe",x"e0",x"39",x"30",             -- ed20 |   imul [A*4 + B], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ed",x"3b",x"0f",x"e3", -- ed26 |   jne [0x363], 0x3bed, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"21",x"39",x"30",x"85",       -- ed30 |   xor [0x3039], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d1",x"fe",x"fe",x"e2", -- ed37 |   jne [0x3039], 0xfed1, ${fail}:rel + PC
    x"86",x"e0",x"fe",x"e4",x"39",x"30",x"de",x"fa", -- ed41 |   sub [0x3039], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"cd",x"05",x"ec",x"e2", -- ed49 |   jne [0x3039], 0x5cd, ${fail}:rel + PC
    x"b6",x"20",x"21",x"e4",x"de",x"fa",             -- ed53 |   xor [A], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"fa",x"dc",x"e2", -- ed59 |   jne [0xaa], 0xfadc, ${fail}:rel + PC
    x"8a",x"21",x"3e",x"e0",x"f6",x"39",x"30",       -- ed63 |   mul [A*2], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"2e",x"35",x"cb",x"e2", -- ed6a |   jne [0x154], 0x352e, ${fail}:rel + PC
    x"aa",x"2a",x"21",x"20",                         -- ed74 |   shl [A*4 + B], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"50",x"bd",x"e2", -- ed78 |   jne [0x363], 0x5000, ${fail}:rel + PC
    x"ae",x"fe",x"1c",x"e4",x"85",x"de",x"fa",       -- ed82 |   and [G], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"80",x"fb",x"ac",x"e2", -- ed89 |   jne [0x155], 0xfb80, ${fail}:rel + PC
    x"a2",x"20",x"20",x"21",                         -- ed93 |   shr [A], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"0a",x"9e",x"e2", -- ed97 |   jne [0xaa], 0xa, ${fail}:rel + PC
    x"b6",x"3e",x"20",x"3e",x"f6",x"f6",             -- eda0 |   xor [A*4 + -10], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"34",x"02",x"8f",x"e2", -- eda6 |   jne [0x29e], 0x234, ${fail}:rel + PC
    x"aa",x"3e",x"3e",x"21",x"f6",x"f6",             -- edb0 |   shl [A*4 + -10], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e0",x"29",x"7f",x"e2", -- edb6 |   jne [0x29e], 0x29e0, ${fail}:rel + PC
    x"8a",x"20",x"3e",x"1c",x"f6",x"85",             -- edc0 |   mul [A], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"16",x"be",x"6f",x"e2", -- edc6 |   jne [0xaa], 0xbe16, ${fail}:rel + PC
    x"b2",x"fe",x"fe",x"e0",x"39",x"30",             -- edd0 |   or [G], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"7d",x"31",x"5f",x"e2", -- edd6 |   jne [0x155], 0x317d, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"3e",x"de",x"fa",x"f6",       -- ede0 |   shr [A*4 + B], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"03",x"4e",x"e2", -- ede7 |   jne [0x363], 0x3, ${fail}:rel + PC
    x"8a",x"2a",x"20",x"e0",x"39",x"30",             -- edf0 |   mul [A*4 + B], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"da",x"05",x"3f",x"e2", -- edf6 |   jne [0x363], 0x5da, ${fail}:rel + PC
    x"ae",x"3e",x"21",x"e0",x"f6",x"39",x"30",       -- ee00 |   and [A*4 + -10], A*2, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"10",x"2e",x"e2", -- ee07 |   jne [0x29e], 0x10, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"2a",x"39",x"30",             -- ee10 |   and [0x3039], A, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"22",x"1f",x"e2", -- ee16 |   jne [0x3039], 0x22, ${fail}:rel + PC
    x"8e",x"fe",x"2a",x"fe",                         -- ee1f |   imul [G], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"df",x"82",x"12",x"e2", -- ee23 |   jne [0x155], 0x82df, ${fail}:rel + PC
    x"86",x"e0",x"fe",x"2a",x"39",x"30",             -- ee2d |   sub [0x3039], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"f2",x"fd",x"02",x"e2", -- ee33 |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
    x"a2",x"2a",x"fe",x"2a",                         -- ee3d |   shr [A*4 + B], G, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"2a",x"f4",x"e1", -- ee41 |   jne [0x363], 0x2a, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"fe",x"f6",                   -- ee4a |   or [A*4 + -10], G, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"55",x"01",x"e6",x"e1", -- ee4f |   jne [0x29e], 0x155, ${fail}:rel + PC
    x"b6",x"21",x"20",x"fe",                         -- ee59 |   xor [A*2], A, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"01",x"d8",x"e1", -- ee5d |   jne [0x154], 0x1ff, ${fail}:rel + PC
    x"a2",x"fe",x"3e",x"1c",x"f6",x"85",             -- ee67 |   shr [G], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"14",x"c8",x"e1", -- ee6d |   jne [0x155], 0x14, ${fail}:rel + PC
    x"a6",x"e0",x"fe",x"20",x"39",x"30",             -- ee76 |   ishr [0x3039], G, A
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"b9",x"e1", -- ee7c |   jne [0x3039], 0, ${fail}:rel + PC
    x"8a",x"21",x"1c",x"e4",x"85",x"de",x"fa",       -- ee84 |   mul [A*2], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a8",x"25",x"aa",x"e1", -- ee8b |   jne [0x154], 0x25a8, ${fail}:rel + PC
    x"b2",x"21",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- ee95 |   or [A*2], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b9",x"fb",x"98",x"e1", -- ee9d |   jne [0x154], 0xfbb9, ${fail}:rel + PC
    x"8e",x"2a",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- eea7 |   imul [A*4 + B], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"48",x"81",x"86",x"e1", -- eeaf |   jne [0x363], 0x8148, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"1c",x"f6",x"85",             -- eeb9 |   or [A*4 + -10], G, -123
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"d5",x"76",x"e1", -- eebf |   jne [0x29e], 0xd5, ${fail}:rel + PC
    x"a6",x"3e",x"21",x"20",x"f6",                   -- eec8 |   ishr [A*4 + -10], A*2, A
    x"ee",x"e0",x"00",x"f8",x"9e",x"02",x"68",x"e1", -- eecd |   jne [0x29e], 0, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"1c",x"85",                   -- eed5 |   and [A*2], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"01",x"03",x"5b",x"e1", -- eeda |   jne [0x154], 0x301, ${fail}:rel + PC
    x"b2",x"20",x"21",x"3e",x"f6",                   -- eee4 |   or [A], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"de",x"03",x"4c",x"e1", -- eee9 |   jne [0xaa], 0x3de, ${fail}:rel + PC
    x"82",x"fe",x"3e",x"20",x"f6",                   -- eef3 |   add [G], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"48",x"03",x"3d",x"e1", -- eef8 |   jne [0x155], 0x348, ${fail}:rel + PC
    x"aa",x"3e",x"20",x"e0",x"f6",x"39",x"30",       -- ef02 |   shl [A*4 + -10], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"54",x"2c",x"e1", -- ef09 |   jne [0x29e], 0x5400, ${fail}:rel + PC
    x"aa",x"20",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- ef13 |   shl [A], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"88",x"1a",x"e1", -- ef1b |   jne [0xaa], 0x8800, ${fail}:rel + PC
    x"8e",x"fe",x"3e",x"e0",x"f6",x"39",x"30",       -- ef25 |   imul [G], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"2e",x"35",x"09",x"e1", -- ef2c |   jne [0x155], 0x352e, ${fail}:rel + PC
    x"82",x"e0",x"1c",x"1c",x"39",x"30",x"85",x"85", -- ef36 |   add [0x3039], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"0a",x"ff",x"f7",x"e0", -- ef3e |   jne [0x3039], 0xff0a, ${fail}:rel + PC
    x"86",x"21",x"3e",x"fe",x"f6",                   -- ef48 |   sub [A*2], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"49",x"01",x"e8",x"e0", -- ef4d |   jne [0x154], 0x149, ${fail}:rel + PC
    x"a6",x"20",x"e4",x"fe",x"de",x"fa",             -- ef57 |   ishr [A], 0xfade + A, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"dc",x"d8",x"e0", -- ef5d |   jne [0xaa], 0xdc, ${fail}:rel + PC
    x"b6",x"20",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- ef66 |   xor [A], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"b1",x"cb",x"c7",x"e0", -- ef6e |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
    x"86",x"fe",x"21",x"e4",x"de",x"fa",             -- ef78 |   sub [G], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"cc",x"05",x"b7",x"e0", -- ef7e |   jne [0x155], 0x5cc, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"e0",x"39",x"30",x"39",x"30", -- ef88 |   add [A*4 + B], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"72",x"60",x"a5",x"e0", -- ef90 |   jne [0x363], 0x6072, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"e4",x"f6",x"85",x"de",x"fa", -- ef9a |   sub [A*4 + -10], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"fd",x"03",x"93",x"e0", -- efa2 |   jne [0x29e], 0x3fd, ${fail}:rel + PC
    x"82",x"21",x"21",x"3e",x"f6",                   -- efac |   add [A*2], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"f2",x"03",x"84",x"e0", -- efb1 |   jne [0x154], 0x3f2, ${fail}:rel + PC
    x"a2",x"20",x"e0",x"1c",x"39",x"30",x"85",       -- efbb |   shr [A], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"81",x"01",x"73",x"e0", -- efc2 |   jne [0xaa], 0x181, ${fail}:rel + PC
    x"8e",x"21",x"20",x"3e",x"f6",                   -- efcc |   imul [A*2], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ec",x"bc",x"64",x"e0", -- efd1 |   jne [0x154], 0xbcec, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"e4",x"f6",x"de",x"fa",       -- efdb |   or [A*4 + -10], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"dd",x"fb",x"53",x"e0", -- efe2 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
    x"a6",x"fe",x"20",x"1c",x"85",                   -- efec |   ishr [G], A, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"05",x"44",x"e0", -- eff1 |   jne [0x155], 0x5, ${fail}:rel + PC
    x"a6",x"21",x"20",x"e4",x"de",x"fa",             -- effa |   ishr [A*2], A, 0xfade + A
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"35",x"e0", -- f000 |   jne [0x154], 0, ${fail}:rel + PC
    x"a2",x"e0",x"1c",x"20",x"39",x"30",x"85",       -- f008 |   shr [0x3039], -123, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"3f",x"26",x"e0", -- f00f |   jne [0x3039], 0x3f, ${fail}:rel + PC
    x"8e",x"20",x"20",x"3e",x"f6",                   -- f018 |   imul [A], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ec",x"bc",x"18",x"e0", -- f01d |   jne [0xaa], 0xbcec, ${fail}:rel + PC
    x"82",x"2a",x"e4",x"fe",x"de",x"fa",             -- f027 |   add [A*4 + B], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"dd",x"fc",x"08",x"e0", -- f02d |   jne [0x363], 0xfcdd, ${fail}:rel + PC
    x"b6",x"fe",x"e0",x"3e",x"39",x"30",x"f6",       -- f037 |   xor [G], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"a7",x"32",x"f7",x"df", -- f03e |   jne [0x155], 0x32a7, ${fail}:rel + PC
    x"8e",x"20",x"e0",x"2a",x"39",x"30",             -- f048 |   imul [A], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"0b",x"51",x"e7",x"df", -- f04e |   jne [0xaa], 0x510b, ${fail}:rel + PC
    x"b2",x"3e",x"e4",x"fe",x"f6",x"de",x"fa",       -- f058 |   or [A*4 + -10], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"dd",x"fb",x"d6",x"df", -- f05f |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
    x"86",x"21",x"1c",x"21",x"85",                   -- f069 |   sub [A*2], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"31",x"fe",x"c7",x"df", -- f06e |   jne [0x154], 0xfe31, ${fail}:rel + PC
    x"b2",x"2a",x"21",x"21",                         -- f078 |   or [A*4 + B], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"54",x"01",x"b9",x"df", -- f07c |   jne [0x363], 0x154, ${fail}:rel + PC
    x"8e",x"e0",x"20",x"3e",x"39",x"30",x"f6",       -- f086 |   imul [0x3039], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"ec",x"bc",x"a8",x"df", -- f08d |   jne [0x3039], 0xbcec, ${fail}:rel + PC
    x"a6",x"3e",x"e4",x"2a",x"f6",x"de",x"fa",       -- f097 |   ishr [A*4 + -10], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"71",x"ff",x"97",x"df", -- f09e |   jne [0x29e], 0xff71, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"e4",x"39",x"30",x"de",x"fa", -- f0a8 |   and [0x3039], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"88",x"00",x"85",x"df", -- f0b0 |   jne [0x3039], 0x88, ${fail}:rel + PC
    x"a6",x"20",x"fe",x"fe",                         -- f0ba |   ishr [A], G, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"0a",x"77",x"df", -- f0be |   jne [0xaa], 0xa, ${fail}:rel + PC
    x"8e",x"20",x"3e",x"20",x"f6",                   -- f0c7 |   imul [A], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ec",x"bc",x"69",x"df", -- f0cc |   jne [0xaa], 0xbcec, ${fail}:rel + PC
    x"b2",x"e0",x"3e",x"fe",x"39",x"30",x"f6",       -- f0d6 |   or [0x3039], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"df",x"03",x"58",x"df", -- f0dd |   jne [0x3039], 0x3df, ${fail}:rel + PC
    x"82",x"21",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- f0e7 |   add [A*2], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"c1",x"2b",x"46",x"df", -- f0ef |   jne [0x154], 0x2bc1, ${fail}:rel + PC
    x"82",x"e0",x"1c",x"e4",x"39",x"30",x"85",x"de",x"fa", -- f0f9 |   add [0x3039], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"0d",x"fb",x"33",x"df", -- f102 |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"21",                         -- f10c |   or [G], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"fe",x"01",x"25",x"df", -- f110 |   jne [0x155], 0x1fe, ${fail}:rel + PC
    x"aa",x"21",x"2a",x"21",                         -- f11a |   shl [A*2], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"30",x"36",x"17",x"df", -- f11e |   jne [0x154], 0x3630, ${fail}:rel + PC
    x"82",x"e0",x"2a",x"e0",x"39",x"30",x"39",x"30", -- f128 |   add [0x3039], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"9c",x"33",x"05",x"df", -- f130 |   jne [0x3039], 0x339c, ${fail}:rel + PC
    x"ae",x"2a",x"20",x"1c",x"85",                   -- f13a |   and [A*4 + B], A, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"80",x"00",x"f6",x"de", -- f13f |   jne [0x363], 0x80, ${fail}:rel + PC
    x"b6",x"e0",x"20",x"1c",x"39",x"30",x"85",       -- f149 |   xor [0x3039], A, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"2f",x"ff",x"e5",x"de", -- f150 |   jne [0x3039], 0xff2f, ${fail}:rel + PC
    x"ae",x"21",x"fe",x"e0",x"39",x"30",             -- f15a |   and [A*2], G, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"11",x"d5",x"de", -- f160 |   jne [0x154], 0x11, ${fail}:rel + PC
    x"ae",x"3e",x"fe",x"3e",x"f6",x"f6",             -- f169 |   and [A*4 + -10], G, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"14",x"c6",x"de", -- f16f |   jne [0x29e], 0x14, ${fail}:rel + PC
    x"8a",x"3e",x"2a",x"2a",x"f6",                   -- f178 |   mul [A*4 + -10], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"49",x"78",x"b8",x"de", -- f17d |   jne [0x29e], 0x7849, ${fail}:rel + PC
    x"82",x"20",x"3e",x"e0",x"f6",x"39",x"30",       -- f187 |   add [A], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d7",x"32",x"a7",x"de", -- f18e |   jne [0xaa], 0x32d7, ${fail}:rel + PC
    x"82",x"21",x"e0",x"3e",x"39",x"30",x"f6",       -- f198 |   add [A*2], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"d7",x"32",x"96",x"de", -- f19f |   jne [0x154], 0x32d7, ${fail}:rel + PC
    x"b6",x"21",x"3e",x"3e",x"f6",x"f6",             -- f1a9 |   xor [A*2], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"86",x"de", -- f1af |   jne [0x154], 0, ${fail}:rel + PC
    x"a6",x"e0",x"20",x"20",x"39",x"30",             -- f1b7 |   ishr [0x3039], A, A
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"78",x"de", -- f1bd |   jne [0x3039], 0, ${fail}:rel + PC
    x"a6",x"e0",x"e0",x"3e",x"39",x"30",x"39",x"30",x"f6", -- f1c5 |   ishr [0x3039], 0x3039, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"67",x"de", -- f1ce |   jne [0x3039], 0, ${fail}:rel + PC
    x"aa",x"20",x"1c",x"21",x"85",                   -- f1d6 |   shl [A], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"50",x"f8",x"5a",x"de", -- f1db |   jne [0xaa], 0xf850, ${fail}:rel + PC
    x"ae",x"e0",x"21",x"e4",x"39",x"30",x"de",x"fa", -- f1e5 |   and [0x3039], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"01",x"48",x"de", -- f1ed |   jne [0x3039], 0x100, ${fail}:rel + PC
    x"b2",x"3e",x"1c",x"20",x"f6",x"85",             -- f1f7 |   or [A*4 + -10], -123, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"af",x"38",x"de", -- f1fd |   jne [0x29e], 0xaf, ${fail}:rel + PC
    x"8e",x"21",x"1c",x"20",x"85",                   -- f206 |   imul [A*2], -123, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"52",x"ae",x"2a",x"de", -- f20b |   jne [0x154], 0xae52, ${fail}:rel + PC
    x"8a",x"2a",x"2a",x"2a",                         -- f215 |   mul [A*4 + B], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"49",x"78",x"1c",x"de", -- f219 |   jne [0x363], 0x7849, ${fail}:rel + PC
    x"86",x"2a",x"2a",x"e0",x"39",x"30",             -- f223 |   sub [A*4 + B], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"2a",x"d3",x"0c",x"de", -- f229 |   jne [0x363], 0xd32a, ${fail}:rel + PC
    x"ae",x"fe",x"1c",x"21",x"85",                   -- f233 |   and [G], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"04",x"01",x"fd",x"dd", -- f238 |   jne [0x155], 0x104, ${fail}:rel + PC
    x"8e",x"21",x"e4",x"1c",x"de",x"fa",x"85",       -- f242 |   imul [A*2], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a8",x"25",x"ec",x"dd", -- f249 |   jne [0x154], 0x25a8, ${fail}:rel + PC
    x"8a",x"21",x"21",x"e4",x"de",x"fa",             -- f253 |   mul [A*2], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a0",x"10",x"dc",x"dd", -- f259 |   jne [0x154], 0x10a0, ${fail}:rel + PC
    x"86",x"fe",x"e0",x"fe",x"39",x"30",             -- f263 |   sub [G], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"e4",x"2e",x"cc",x"dd", -- f269 |   jne [0x155], 0x2ee4, ${fail}:rel + PC
    x"62",x"20",x"1c",x"85",                         -- f273 |   mov [A], -123
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"85",x"be",x"dd", -- f277 |   jne [0xaa], 0x85, ${fail}:rel + PC
    x"62",x"3e",x"3e",x"f6",x"f6",                   -- f280 |   mov [A*4 + -10], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"9e",x"02",x"b0",x"dd", -- f285 |   jne [0x29e], 0x29e, ${fail}:rel + PC
    x"62",x"21",x"2a",                               -- f28f |   mov [A*2], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"63",x"03",x"a3",x"dd", -- f292 |   jne [0x154], 0x363, ${fail}:rel + PC
    x"62",x"e0",x"1c",x"39",x"30",x"85",             -- f29c |   mov [0x3039], -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"85",x"93",x"dd", -- f2a2 |   jne [0x3039], 0x85, ${fail}:rel + PC
    x"62",x"fe",x"3e",x"f6",                         -- f2ab |   mov [G], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"9e",x"02",x"86",x"dd", -- f2af |   jne [0x155], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"fe",x"39",x"30",                   -- f2b9 |   mov [0x3039], G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"55",x"01",x"77",x"dd", -- f2be |   jne [0x3039], 0x155, ${fail}:rel + PC
    x"62",x"fe",x"21",                               -- f2c8 |   mov [G], A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"54",x"01",x"6a",x"dd", -- f2cb |   jne [0x155], 0x154, ${fail}:rel + PC
    x"62",x"3e",x"e4",x"f6",x"de",x"fa",             -- f2d5 |   mov [A*4 + -10], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"88",x"fb",x"5a",x"dd", -- f2db |   jne [0x29e], 0xfb88, ${fail}:rel + PC
    x"62",x"e0",x"e0",x"39",x"30",x"39",x"30",       -- f2e5 |   mov [0x3039], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"39",x"30",x"49",x"dd", -- f2ec |   jne [0x3039], 0x3039, ${fail}:rel + PC
    x"62",x"3e",x"fe",x"f6",                         -- f2f6 |   mov [A*4 + -10], G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"55",x"01",x"3b",x"dd", -- f2fa |   jne [0x29e], 0x155, ${fail}:rel + PC
    x"62",x"20",x"fe",                               -- f304 |   mov [A], G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"55",x"01",x"2e",x"dd", -- f307 |   jne [0xaa], 0x155, ${fail}:rel + PC
    x"62",x"2a",x"2a",                               -- f311 |   mov [A*4 + B], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"63",x"03",x"21",x"dd", -- f314 |   jne [0x363], 0x363, ${fail}:rel + PC
    x"62",x"3e",x"2a",x"f6",                         -- f31e |   mov [A*4 + -10], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"63",x"03",x"13",x"dd", -- f322 |   jne [0x29e], 0x363, ${fail}:rel + PC
    x"62",x"2a",x"20",                               -- f32c |   mov [A*4 + B], A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"aa",x"00",x"06",x"dd", -- f32f |   jne [0x363], 0xaa, ${fail}:rel + PC
    x"62",x"3e",x"20",x"f6",                         -- f339 |   mov [A*4 + -10], A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"aa",x"00",x"f8",x"dc", -- f33d |   jne [0x29e], 0xaa, ${fail}:rel + PC
    x"62",x"20",x"20",                               -- f347 |   mov [A], A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"aa",x"00",x"eb",x"dc", -- f34a |   jne [0xaa], 0xaa, ${fail}:rel + PC
    x"62",x"2a",x"e4",x"de",x"fa",                   -- f354 |   mov [A*4 + B], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"88",x"fb",x"dc",x"dc", -- f359 |   jne [0x363], 0xfb88, ${fail}:rel + PC
    x"62",x"21",x"1c",x"85",                         -- f363 |   mov [A*2], -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"85",x"ce",x"dc", -- f367 |   jne [0x154], 0x85, ${fail}:rel + PC
    x"62",x"2a",x"e0",x"39",x"30",                   -- f370 |   mov [A*4 + B], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"39",x"30",x"c0",x"dc", -- f375 |   jne [0x363], 0x3039, ${fail}:rel + PC
    x"62",x"3e",x"1c",x"f6",x"85",                   -- f37f |   mov [A*4 + -10], -123
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"85",x"b1",x"dc", -- f384 |   jne [0x29e], 0x85, ${fail}:rel + PC
    x"62",x"3e",x"21",x"f6",                         -- f38d |   mov [A*4 + -10], A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"54",x"01",x"a4",x"dc", -- f391 |   jne [0x29e], 0x154, ${fail}:rel + PC
    x"62",x"21",x"3e",x"f6",                         -- f39b |   mov [A*2], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"9e",x"02",x"96",x"dc", -- f39f |   jne [0x154], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"21",x"39",x"30",                   -- f3a9 |   mov [0x3039], A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"87",x"dc", -- f3ae |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"62",x"21",x"fe",                               -- f3b8 |   mov [A*2], G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"55",x"01",x"7a",x"dc", -- f3bb |   jne [0x154], 0x155, ${fail}:rel + PC
    x"62",x"2a",x"fe",                               -- f3c5 |   mov [A*4 + B], G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"55",x"01",x"6d",x"dc", -- f3c8 |   jne [0x363], 0x155, ${fail}:rel + PC
    x"62",x"21",x"e4",x"de",x"fa",                   -- f3d2 |   mov [A*2], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"88",x"fb",x"5e",x"dc", -- f3d7 |   jne [0x154], 0xfb88, ${fail}:rel + PC
    x"62",x"20",x"3e",x"f6",                         -- f3e1 |   mov [A], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9e",x"02",x"50",x"dc", -- f3e5 |   jne [0xaa], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"3e",x"39",x"30",x"f6",             -- f3ef |   mov [0x3039], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"9e",x"02",x"40",x"dc", -- f3f5 |   jne [0x3039], 0x29e, ${fail}:rel + PC
    x"62",x"2a",x"3e",x"f6",                         -- f3ff |   mov [A*4 + B], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"9e",x"02",x"32",x"dc", -- f403 |   jne [0x363], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"e4",x"39",x"30",x"de",x"fa",       -- f40d |   mov [0x3039], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"88",x"fb",x"21",x"dc", -- f414 |   jne [0x3039], 0xfb88, ${fail}:rel + PC
    x"62",x"21",x"e0",x"39",x"30",                   -- f41e |   mov [A*2], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"39",x"30",x"12",x"dc", -- f423 |   jne [0x154], 0x3039, ${fail}:rel + PC
    x"62",x"fe",x"1c",x"85",                         -- f42d |   mov [G], -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"85",x"04",x"dc", -- f431 |   jne [0x155], 0x85, ${fail}:rel + PC
    x"62",x"e0",x"2a",x"39",x"30",                   -- f43a |   mov [0x3039], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"63",x"03",x"f6",x"db", -- f43f |   jne [0x3039], 0x363, ${fail}:rel + PC
    x"62",x"fe",x"e4",x"de",x"fa",                   -- f449 |   mov [G], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"88",x"fb",x"e7",x"db", -- f44e |   jne [0x155], 0xfb88, ${fail}:rel + PC
    x"62",x"20",x"e0",x"39",x"30",                   -- f458 |   mov [A], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"39",x"30",x"d8",x"db", -- f45d |   jne [0xaa], 0x3039, ${fail}:rel + PC
    x"62",x"20",x"21",                               -- f467 |   mov [A], A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"54",x"01",x"cb",x"db", -- f46a |   jne [0xaa], 0x154, ${fail}:rel + PC
    x"62",x"3e",x"e0",x"f6",x"39",x"30",             -- f474 |   mov [A*4 + -10], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"39",x"30",x"bb",x"db", -- f47a |   jne [0x29e], 0x3039, ${fail}:rel + PC
    x"62",x"fe",x"20",                               -- f484 |   mov [G], A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"00",x"ae",x"db", -- f487 |   jne [0x155], 0xaa, ${fail}:rel + PC
    x"62",x"21",x"20",                               -- f491 |   mov [A*2], A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"00",x"a1",x"db", -- f494 |   jne [0x154], 0xaa, ${fail}:rel + PC
    x"62",x"fe",x"fe",                               -- f49e |   mov [G], G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"55",x"01",x"94",x"db", -- f4a1 |   jne [0x155], 0x155, ${fail}:rel + PC
    x"62",x"20",x"2a",                               -- f4ab |   mov [A], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"63",x"03",x"87",x"db", -- f4ae |   jne [0xaa], 0x363, ${fail}:rel + PC
    x"62",x"2a",x"1c",x"85",                         -- f4b8 |   mov [A*4 + B], -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"85",x"79",x"db", -- f4bc |   jne [0x363], 0x85, ${fail}:rel + PC
    x"62",x"2a",x"21",                               -- f4c5 |   mov [A*4 + B], A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"54",x"01",x"6d",x"db", -- f4c8 |   jne [0x363], 0x154, ${fail}:rel + PC
    x"62",x"e0",x"20",x"39",x"30",                   -- f4d2 |   mov [0x3039], A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"00",x"5e",x"db", -- f4d7 |   jne [0x3039], 0xaa, ${fail}:rel + PC
    x"62",x"fe",x"e0",x"39",x"30",                   -- f4e1 |   mov [G], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"39",x"30",x"4f",x"db", -- f4e6 |   jne [0x155], 0x3039, ${fail}:rel + PC
    x"62",x"21",x"21",                               -- f4f0 |   mov [A*2], A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"54",x"01",x"42",x"db", -- f4f3 |   jne [0x154], 0x154, ${fail}:rel + PC
    x"62",x"fe",x"2a",                               -- f4fd |   mov [G], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"63",x"03",x"35",x"db", -- f500 |   jne [0x155], 0x363, ${fail}:rel + PC
    x"62",x"20",x"e4",x"de",x"fa",                   -- f50a |   mov [A], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"88",x"fb",x"26",x"db", -- f50f |   jne [0xaa], 0xfb88, ${fail}:rel + PC
    x"e0",x"2a",                                     -- f519 |   push A*4 + B
    x"e4",x"80",                                     -- f51b |   pop D
    x"ec",x"80",x"e0",x"f8",x"63",x"03",x"18",x"db", -- f51d |   jne D, 0x363, ${fail}:rel + PC
    x"e0",x"1c",x"85",                               -- f525 |   push -123
    x"e4",x"80",                                     -- f528 |   pop D
    x"ec",x"80",x"1c",x"f8",x"85",x"0b",x"db",       -- f52a |   jne D, 0x85, ${fail}:rel + PC
    x"e0",x"fe",                                     -- f531 |   push G
    x"e4",x"80",                                     -- f533 |   pop D
    x"ec",x"80",x"e0",x"f8",x"55",x"01",x"00",x"db", -- f535 |   jne D, 0x155, ${fail}:rel + PC
    x"e0",x"3e",x"f6",                               -- f53d |   push A*4 + -10
    x"e4",x"80",                                     -- f540 |   pop D
    x"ec",x"80",x"e0",x"f8",x"9e",x"02",x"f3",x"da", -- f542 |   jne D, 0x29e, ${fail}:rel + PC
    x"e0",x"20",                                     -- f54a |   push A
    x"e4",x"80",                                     -- f54c |   pop D
    x"ec",x"80",x"e0",x"f8",x"aa",x"00",x"e7",x"da", -- f54e |   jne D, 0xaa, ${fail}:rel + PC
    x"e0",x"e4",x"de",x"fa",                         -- f556 |   push 0xfade + A
    x"e4",x"80",                                     -- f55a |   pop D
    x"ec",x"80",x"e0",x"f8",x"88",x"fb",x"d9",x"da", -- f55c |   jne D, 0xfb88, ${fail}:rel + PC
    x"e0",x"21",                                     -- f564 |   push A*2
    x"e4",x"80",                                     -- f566 |   pop D
    x"ec",x"80",x"e0",x"f8",x"54",x"01",x"cd",x"da", -- f568 |   jne D, 0x154, ${fail}:rel + PC
    x"e0",x"e0",x"39",x"30",                         -- f570 |   push 0x3039
    x"e4",x"80",                                     -- f574 |   pop D
    x"ec",x"80",x"e0",x"f8",x"39",x"30",x"bf",x"da", -- f576 |   jne D, 0x3039, ${fail}:rel + PC
    x"5c",x"f8",x"10",x"00",                         -- f57e |   call ${_L_test_uop_get_arg_1}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"fe",x"ad",x"b3",x"da", -- f582 |   jne C, 0xadfe, ${fail}:rel + PC
    x"58",x"f8",x"0e",x"00",                         -- f58a |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                                                     --      | _L_test_uop_get_arg_1:
    x"60",x"60",x"e0",x"fe",x"ad",                   -- f58e |   mov C, 0xadfe
    x"dc",                                           -- f593 |   ret
    x"58",x"f8",x"a1",x"da",                         -- f594 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_get_arg_2:
                                                     --      | test_uop_alu_2dd:
    x"60",x"20",x"e0",x"cd",x"ab",                   -- f598 |   mov A, 0xabcd
    x"00",x"20",x"e0",x"ab",x"cd",                   -- f59d |   add A, 0xcdab
    x"ec",x"20",x"e0",x"f8",x"78",x"79",x"93",x"da", -- f5a2 |   jne A, 0x7978, ${fail}:rel + PC
                                                     --      | test_uop_alu_2di:
    x"60",x"20",x"e0",x"00",x"10",                   -- f5aa |   mov A, 0x1000
    x"62",x"e0",x"e0",x"00",x"10",x"bc",x"0a",       -- f5af |   mov [0x1000], 0xabc
    x"01",x"20",x"20",                               -- f5b6 |   add A, [A]
    x"ec",x"20",x"e0",x"f8",x"bc",x"1a",x"7c",x"da", -- f5b9 |   jne A, 0x1abc, ${fail}:rel + PC
                                                     --      | test_uop_alu_2id:
    x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       -- f5c1 |   mov [0x1000], 0x1234
    x"02",x"e0",x"e0",x"00",x"10",x"21",x"43",       -- f5c8 |   add [0x1000], 0x4321
    x"61",x"20",x"e0",x"00",x"10",                   -- f5cf |   mov A, [0x1000]
    x"ec",x"20",x"e0",x"f8",x"55",x"55",x"61",x"da", -- f5d4 |   jne A, 0x5555, ${fail}:rel + PC
                                                     --      | test_uop_alu_2ii:
    x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       -- f5dc |   mov [0x1000], 0x1234
    x"62",x"e0",x"e0",x"05",x"10",x"aa",x"aa",       -- f5e3 |   mov [0x1005], 0xaaaa
    x"03",x"e0",x"e0",x"05",x"10",x"00",x"10",       -- f5ea |   add [0x1005], [0x1000]
    x"ee",x"e0",x"e0",x"f8",x"05",x"10",x"de",x"bc",x"44",x"da", -- f5f1 |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                                                     --      | test_uop_alu_3dd:
    x"60",x"20",x"e0",x"fe",x"ab",                   -- f5fb |   mov A, 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f600 |   mov B, 0x5555
    x"80",x"60",x"20",x"40",                         -- f605 |   add C, A, B
    x"ec",x"20",x"e0",x"f8",x"fe",x"ab",x"2c",x"da", -- f609 |   jne A, 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"24",x"da", -- f611 |   jne B, 0x5555, ${fail}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"53",x"01",x"1c",x"da", -- f619 |   jne C, 0x153, ${fail}:rel + PC
                                                     --      | test_uop_alu_3di:
    x"62",x"e0",x"e0",x"00",x"10",x"aa",x"12",       -- f621 |   mov [0x1000], 0x12aa
    x"60",x"40",x"e0",x"de",x"fa",                   -- f628 |   mov B, 0xfade
    x"b5",x"20",x"e0",x"40",x"00",x"10",             -- f62d |   xor A, [0x1000], B
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"aa",x"12",x"02",x"da", -- f633 |   jne [0x1000], 0x12aa, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"de",x"fa",x"f8",x"d9", -- f63d |   jne B, 0xfade, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"74",x"e8",x"f0",x"d9", -- f645 |   jne A, 0xe874, ${fail}:rel + PC
                                                     --      | test_uop_alu_3id:
    x"60",x"20",x"e0",x"fe",x"ab",                   -- f64d |   mov A, 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f652 |   mov B, 0x5555
    x"86",x"e0",x"20",x"40",x"00",x"10",             -- f657 |   sub [0x1000], A, B
    x"ec",x"20",x"e0",x"f8",x"fe",x"ab",x"d8",x"d9", -- f65d |   jne A, 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"d0",x"d9", -- f665 |   jne B, 0x5555, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"a9",x"56",x"c8",x"d9", -- f66d |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                                                     --      | test_uop_alu_3ii:
    x"62",x"e0",x"e0",x"00",x"10",x"fe",x"ab",       -- f677 |   mov [0x1000], 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f67e |   mov B, 0x5555
    x"af",x"e0",x"e0",x"40",x"02",x"10",x"00",x"10", -- f683 |   and [0x1002], [0x1000], B
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"fe",x"ab",x"aa",x"d9", -- f68b |   jne [0x1000], 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"a0",x"d9", -- f695 |   jne B, 0x5555, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"02",x"10",x"54",x"01",x"98",x"d9", -- f69d |   jne [0x1002], 0x154, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_1dx:
    x"60",x"20",x"e0",x"00",x"ff",                   -- f6a7 |   mov A, 0xff00
    x"3c",x"20",                                     -- f6ac |   not A
    x"ec",x"20",x"e0",x"f8",x"ff",x"00",x"87",x"d9", -- f6ae |   jne A, 0xff, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_1ix:
    x"62",x"1c",x"e0",x"64",x"34",x"12",             -- f6b6 |   mov [0x64], 0x1234
    x"3a",x"1c",x"64",                               -- f6bc |   neg [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"cc",x"ed",x"76",x"d9", -- f6bf |   jne [0x64], 0xedcc, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2dd:
    x"60",x"40",x"e0",x"ff",x"00",                   -- f6c8 |   mov B, 0xff
    x"bc",x"20",x"40",                               -- f6cd |   not A, B
    x"ec",x"40",x"e0",x"f8",x"ff",x"00",x"65",x"d9", -- f6d0 |   jne B, 0xff, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"00",x"ff",x"5d",x"d9", -- f6d8 |   jne A, 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2di:
    x"62",x"1c",x"e0",x"64",x"34",x"12",             -- f6e0 |   mov [0x64], 0x1234
    x"bd",x"20",x"1c",x"64",                         -- f6e6 |   not A, [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"34",x"12",x"4b",x"d9", -- f6ea |   jne [0x64], 0x1234, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"cb",x"ed",x"42",x"d9", -- f6f3 |   jne A, 0xedcb, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2id:
    x"60",x"40",x"e0",x"ff",x"00",                   -- f6fb |   mov B, 0xff
    x"be",x"1c",x"40",x"64",                         -- f700 |   not [0x64], B
    x"ec",x"40",x"e0",x"f8",x"ff",x"00",x"31",x"d9", -- f704 |   jne B, 0xff, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"00",x"ff",x"29",x"d9", -- f70c |   jne [0x64], 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2ii:
    x"62",x"1c",x"e0",x"66",x"ff",x"00",             -- f715 |   mov [0x66], 0xff
    x"bf",x"1c",x"1c",x"64",x"66",                   -- f71b |   not [0x64], [0x66]
    x"ee",x"1c",x"e0",x"f8",x"66",x"ff",x"00",x"15",x"d9", -- f720 |   jne [0x66], 0xff, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"00",x"ff",x"0c",x"d9", -- f729 |   jne [0x64], 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_cmp_dd:
    x"60",x"40",x"1c",x"7b",                         -- f732 |   mov B, 0x7b
    x"50",x"40",x"e0",x"c8",x"01",                   -- f736 |   cmp B, 0x1c8
    x"4c",x"20",                                     -- f73b |   getf A
    x"ec",x"40",x"1c",x"f8",x"7b",x"f8",x"d8",       -- f73d |   jne B, 0x7b, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"0e",x"f1",x"d8",       -- f744 |   jne A, 0xe, ${fail}:rel + PC
                                                     --      | test_uop_cmp_di:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f74b |   mov [0x64], -123
    x"60",x"40",x"e0",x"c8",x"01",                   -- f750 |   mov B, 0x1c8
    x"d1",x"40",x"1c",x"64",                         -- f755 |   icmp B, [0x64]
    x"4c",x"20",                                     -- f759 |   getf A
    x"ec",x"40",x"e0",x"f8",x"c8",x"01",x"da",x"d8", -- f75b |   jne B, 0x1c8, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"32",x"d2",x"d8",       -- f763 |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_cmp_id:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f76a |   mov [0x64], -123
    x"60",x"40",x"e0",x"c8",x"01",                   -- f76f |   mov B, 0x1c8
    x"d2",x"1c",x"40",x"64",                         -- f774 |   icmp [0x64], B
    x"4c",x"20",                                     -- f778 |   getf A
    x"ec",x"40",x"e0",x"f8",x"c8",x"01",x"bb",x"d8", -- f77a |   jne B, 0x1c8, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"0e",x"b3",x"d8",       -- f782 |   jne A, 0xe, ${fail}:rel + PC
                                                     --      | test_uop_cmp_ii:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f789 |   mov [0x64], -123
    x"62",x"1c",x"e0",x"66",x"38",x"fe",             -- f78e |   mov [0x66], 0xfe38
    x"d3",x"1c",x"1c",x"64",x"66",                   -- f794 |   icmp [0x64], [0x66]
    x"4c",x"20",                                     -- f799 |   getf A
    x"ee",x"1c",x"1c",x"f8",x"64",x"85",x"9a",x"d8", -- f79b |   jne [0x64], -123, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"38",x"fe",x"92",x"d8", -- f7a3 |   jne [0x66], 0xfe38, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"32",x"89",x"d8",       -- f7ac |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_jmp_d:
    x"60",x"20",x"e0",x"be",x"f7",                   -- f7b3 |   mov A, ${_L_test_uop_jmp_d_okay}
    x"58",x"20",                                     -- f7b8 |   jmp A
    x"58",x"f8",x"7b",x"d8",                         -- f7ba |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_d_okay:
                                                     --      | test_uop_jmp_i:
    x"62",x"1c",x"e0",x"64",x"cb",x"f7",             -- f7be |   mov [0x64], ${_L_test_uop_jmp_i_okay}
    x"5a",x"1c",x"64",                               -- f7c4 |   jmp [0x64]
    x"58",x"f8",x"6e",x"d8",                         -- f7c7 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_i_okay:
    x"ee",x"1c",x"e0",x"f8",x"64",x"cb",x"f7",x"6a",x"d8", -- f7cb |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_cond_i:
    x"62",x"1c",x"e0",x"64",x"ea",x"f7",             -- f7d4 |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
    x"50",x"1c",x"1c",x"01",x"02",                   -- f7da |   cmp 0x1, 0x2
    x"68",x"f8",x"56",x"d8",                         -- f7df |   jeq ${fail}:rel + PC
    x"6e",x"1c",x"64",                               -- f7e3 |   jne [0x64]
    x"58",x"f8",x"4f",x"d8",                         -- f7e6 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_cond_i_okay:
    x"ee",x"1c",x"e0",x"f8",x"64",x"ea",x"f7",x"4b",x"d8", -- f7ea |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_cond_d:
    x"60",x"20",x"e0",x"07",x"f8",                   -- f7f3 |   mov A, ${_L_test_uop_jmp_cond_d_okay}
    x"50",x"1c",x"1c",x"01",x"01",                   -- f7f8 |   cmp 0x1, 0x1
    x"6c",x"f8",x"38",x"d8",                         -- f7fd |   jne ${fail}:rel + PC
    x"68",x"20",                                     -- f801 |   jeq A
    x"58",x"f8",x"32",x"d8",                         -- f803 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_cond_d_okay:
    x"ec",x"20",x"e0",x"f8",x"07",x"f8",x"2e",x"d8", -- f807 |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3dd:
    x"60",x"20",x"1c",x"7b",                         -- f80f |   mov A, 0x7b
    x"ec",x"20",x"1c",x"f8",x"7b",x"22",x"d8",       -- f813 |   jne A, 0x7b, ${fail}:rel + PC
    x"e8",x"20",x"1c",x"f8",x"7b",x"0b",x"00",       -- f81a |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
    x"58",x"f8",x"14",x"d8",                         -- f821 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3dd_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"10",x"d8",       -- f825 |   jne A, 0x7b, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3di:
    x"60",x"20",x"1c",x"7b",                         -- f82c |   mov A, 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f830 |   mov [0x64], 0x141
    x"e9",x"20",x"1c",x"f8",x"64",x"ff",x"d7",       -- f836 |   jeq A, [0x64], ${fail}:rel + PC
    x"ed",x"20",x"1c",x"f8",x"64",x"0b",x"00",       -- f83d |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
    x"58",x"f8",x"f1",x"d7",                         -- f844 |   jmp ${fail}:rel + PC
                                                     --      | test_uop_jmp_3di_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"ed",x"d7",       -- f848 |   jne A, 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"e6",x"d7", -- f84f |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3id:
    x"60",x"20",x"1c",x"7b",                         -- f858 |   mov A, 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f85c |   mov [0x64], 0x141
    x"ea",x"1c",x"20",x"f8",x"64",x"d3",x"d7",       -- f862 |   jeq [0x64], A, ${fail}:rel + PC
    x"ee",x"1c",x"20",x"f8",x"64",x"0b",x"00",       -- f869 |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
    x"58",x"f8",x"c5",x"d7",                         -- f870 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3id_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"c1",x"d7",       -- f874 |   jne A, 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"ba",x"d7", -- f87b |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3ii:
    x"62",x"e0",x"1c",x"c8",x"00",x"7b",             -- f884 |   mov [0xc8], 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f88a |   mov [0x64], 0x141
    x"eb",x"1c",x"e0",x"f8",x"64",x"c8",x"00",x"a5",x"d7", -- f890 |   jeq [0x64], [0xc8], ${fail}:rel + PC
    x"ef",x"1c",x"e0",x"f8",x"64",x"c8",x"00",x"0d",x"00", -- f899 |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
    x"58",x"f8",x"93",x"d7",                         -- f8a2 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3ii_okay:
    x"ee",x"e0",x"1c",x"f8",x"c8",x"00",x"7b",x"8f",x"d7", -- f8a6 |   jne [0xc8], 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"86",x"d7", -- f8af |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_mov_dd:
    x"60",x"20",x"1c",x"7b",                         -- f8b8 |   mov A, 0x7b
    x"ec",x"20",x"1c",x"f8",x"7b",x"79",x"d7",       -- f8bc |   jne A, 0x7b, ${fail}:rel + PC
                                                     --      | test_uop_mov_di:
    x"62",x"1c",x"1c",x"64",x"da",                   -- f8c3 |   mov [0x64], 0xda
    x"61",x"20",x"1c",x"64",                         -- f8c8 |   mov A, [0x64]
    x"ec",x"20",x"1c",x"f8",x"da",x"69",x"d7",       -- f8cc |   jne A, 0xda, ${fail}:rel + PC
                                                     --      | test_uop_mov_id:
    x"62",x"1c",x"1c",x"64",x"ff",                   -- f8d3 |   mov [0x64], 0xff
    x"ee",x"1c",x"1c",x"f8",x"64",x"ff",x"5d",x"d7", -- f8d8 |   jne [0x64], 0xff, ${fail}:rel + PC
                                                     --      | test_uop_mov_ii:
    x"60",x"20",x"1c",x"14",                         -- f8e0 |   mov A, 0x14
    x"62",x"1c",x"e0",x"78",x"fa",x"fd",             -- f8e4 |   mov [0x78], 0xfdfa
    x"63",x"1c",x"3c",x"64",x"64",                   -- f8ea |   mov [0x64], [A + 0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"fa",x"fd",x"46",x"d7", -- f8ef |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                                                     --      | test_uop_bmov_dd:
    x"64",x"20",x"e0",x"de",x"af",                   -- f8f8 |   bmov A, 0xafde
    x"ec",x"20",x"e0",x"f8",x"de",x"00",x"38",x"d7", -- f8fd |   jne A, 0xde, ${fail}:rel + PC
    x"64",x"20",x"e0",x"fa",x"00",                   -- f905 |   bmov A, 0xfa
    x"ec",x"20",x"e0",x"f8",x"fa",x"00",x"2b",x"d7", -- f90a |   jne A, 0xfa, ${fail}:rel + PC
                                                     --      | test_uop_bmov_di:
    x"62",x"1c",x"1c",x"64",x"da",                   -- f912 |   mov [0x64], 0xda
    x"65",x"20",x"1c",x"64",                         -- f917 |   bmov A, [0x64]
    x"ec",x"20",x"e0",x"f8",x"da",x"00",x"1a",x"d7", -- f91b |   jne A, 0xda, ${fail}:rel + PC
                                                     --      | test_uop_bmov_id:
    x"62",x"1c",x"e0",x"64",x"cd",x"ab",             -- f923 |   mov [0x64], 0xabcd
    x"62",x"1c",x"e0",x"66",x"34",x"12",             -- f929 |   mov [0x66], 0x1234
    x"62",x"1c",x"e0",x"68",x"78",x"56",             -- f92f |   mov [0x68], 0x5678
    x"66",x"1c",x"e0",x"66",x"df",x"00",             -- f935 |   bmov [0x66], 0xdf
    x"ee",x"1c",x"e0",x"f8",x"64",x"cd",x"ab",x"fa",x"d6", -- f93b |   jne [0x64], 0xabcd, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"df",x"12",x"f1",x"d6", -- f944 |   jne [0x66], 0x12df, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"68",x"78",x"56",x"e8",x"d6", -- f94d |   jne [0x68], 0x5678, ${fail}:rel + PC
    x"66",x"1c",x"e0",x"67",x"b8",x"00",             -- f956 |   bmov [0x67], 0xb8
    x"ee",x"1c",x"e0",x"f8",x"64",x"cd",x"ab",x"d9",x"d6", -- f95c |   jne [0x64], 0xabcd, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"df",x"b8",x"d0",x"d6", -- f965 |   jne [0x66], 0xb8df, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"68",x"78",x"56",x"c7",x"d6", -- f96e |   jne [0x68], 0x5678, ${fail}:rel + PC
                                                     --      | test_uop_bmov_ii:
    x"62",x"e0",x"e0",x"2c",x"01",x"df",x"00",       -- f977 |   mov [0x12c], 0xdf
    x"62",x"e0",x"e0",x"2e",x"01",x"b8",x"00",       -- f97e |   mov [0x12e], 0xb8
    x"62",x"e0",x"e0",x"c8",x"00",x"cd",x"ab",       -- f985 |   mov [0xc8], 0xabcd
    x"62",x"e0",x"e0",x"ca",x"00",x"34",x"12",       -- f98c |   mov [0xca], 0x1234
    x"62",x"e0",x"e0",x"cc",x"00",x"78",x"56",       -- f993 |   mov [0xcc], 0x5678
    x"67",x"e0",x"e0",x"ca",x"00",x"2c",x"01",       -- f99a |   bmov [0xca], [0x12c]
    x"ee",x"e0",x"e0",x"f8",x"c8",x"00",x"cd",x"ab",x"94",x"d6", -- f9a1 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"ca",x"00",x"df",x"12",x"8a",x"d6", -- f9ab |   jne [0xca], 0x12df, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"cc",x"00",x"78",x"56",x"80",x"d6", -- f9b5 |   jne [0xcc], 0x5678, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2c",x"01",x"df",x"00",x"76",x"d6", -- f9bf |   jne [0x12c], 0xdf, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2e",x"01",x"b8",x"00",x"6c",x"d6", -- f9c9 |   jne [0x12e], 0xb8, ${fail}:rel + PC
    x"67",x"e0",x"e0",x"cb",x"00",x"2e",x"01",       -- f9d3 |   bmov [0xcb], [0x12e]
    x"ee",x"e0",x"e0",x"f8",x"c8",x"00",x"cd",x"ab",x"5b",x"d6", -- f9da |   jne [0xc8], 0xabcd, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"ca",x"00",x"df",x"b8",x"51",x"d6", -- f9e4 |   jne [0xca], 0xb8df, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"cc",x"00",x"78",x"56",x"47",x"d6", -- f9ee |   jne [0xcc], 0x5678, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2c",x"01",x"df",x"00",x"3d",x"d6", -- f9f8 |   jne [0x12c], 0xdf, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2e",x"01",x"b8",x"00",x"33",x"d6", -- fa02 |   jne [0x12e], 0xb8, ${fail}:rel + PC
                                                     --      | test_uop_halt:
                                                     --      | test_uop_getf:
    x"50",x"1c",x"1c",x"7b",x"2d",                   -- fa0c |   cmp 0x7b, 0x2d
    x"4c",x"20",                                     -- fa11 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"22",x"d6",       -- fa13 |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_setf:
    x"cc",x"1c",x"ff",                               -- fa1a |   setf 0xff
    x"4c",x"20",                                     -- fa1d |   getf A
    x"ec",x"20",x"1c",x"f8",x"3f",x"16",x"d6",       -- fa1f |   jne A, 0x3f, ${fail}:rel + PC
                                                     --      | test_uop_call_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fa26 |   mov SP, 0x1000
    x"60",x"40",x"e0",x"46",x"fa",                   -- fa2b |   mov B, ${_L_test_uop_call_d_fn}
    x"5c",x"40",                                     -- fa30 |   call B
    x"ec",x"40",x"e0",x"f8",x"46",x"fa",x"03",x"d6", -- fa32 |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"fa",x"34",x"fb",x"d5", -- fa3a |   jne A, 0x34fa, ${fail}:rel + PC
    x"58",x"f8",x"0a",x"00",                         -- fa42 |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                                                     --      | _L_test_uop_call_d_fn:
    x"60",x"20",x"e0",x"fa",x"34",                   -- fa46 |   mov A, 0x34fa
    x"dc",                                           -- fa4b |   ret
                                                     --      | _L_test_uop_call_d_okay:
                                                     --      | test_uop_call_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fa4c |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- fa51 |   mov B, 0x64
    x"62",x"40",x"e0",x"70",x"fa",                   -- fa55 |   mov [B], ${_L_test_uop_call_i_fn}
    x"5e",x"40",                                     -- fa5a |   call [B]
    x"ee",x"40",x"e0",x"f8",x"70",x"fa",x"d9",x"d5", -- fa5c |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"d4",x"aa",x"d1",x"d5", -- fa64 |   jne A, 0xaad4, ${fail}:rel + PC
    x"58",x"f8",x"0a",x"00",                         -- fa6c |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                                                     --      | _L_test_uop_call_i_fn:
    x"60",x"20",x"e0",x"d4",x"aa",                   -- fa70 |   mov A, 0xaad4
    x"dc",                                           -- fa75 |   ret
                                                     --      | _L_test_uop_call_i_okay:
                                                     --      | test_uop_ret:
                                                     --      | test_uop_push_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fa76 |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- fa7b |   mov B, 0x64
    x"e0",x"40",                                     -- fa7f |   push B
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"b4",x"d5", -- fa81 |   jne SP, 0xffe, ${fail}:rel + PC
    x"ee",x"e0",x"1c",x"f8",x"fe",x"0f",x"64",x"ac",x"d5", -- fa89 |   jne [0xffe], 0x64, ${fail}:rel + PC
    x"e4",x"60",                                     -- fa92 |   pop C
    x"ec",x"60",x"1c",x"f8",x"64",x"a1",x"d5",       -- fa94 |   jne C, 0x64, ${fail}:rel + PC
                                                     --      | test_uop_push_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fa9b |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- faa0 |   mov B, 0x64
    x"62",x"40",x"e0",x"90",x"01",                   -- faa4 |   mov [B], 0x190
    x"e2",x"40",                                     -- faa9 |   push [B]
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"8a",x"d5", -- faab |   jne SP, 0xffe, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fe",x"0f",x"90",x"01",x"82",x"d5", -- fab3 |   jne [0xffe], 0x190, ${fail}:rel + PC
    x"e4",x"60",                                     -- fabd |   pop C
    x"ec",x"60",x"e0",x"f8",x"90",x"01",x"76",x"d5", -- fabf |   jne C, 0x190, ${fail}:rel + PC
                                                     --      | test_uop_pop_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fac7 |   mov SP, 0x1000
    x"e0",x"e0",x"da",x"fa",                         -- facc |   push 0xfada
    x"e4",x"20",                                     -- fad0 |   pop A
    x"ec",x"20",x"e0",x"f8",x"da",x"fa",x"63",x"d5", -- fad2 |   jne A, 0xfada, ${fail}:rel + PC
                                                     --      | test_uop_pop_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fada |   mov SP, 0x1000
    x"e0",x"e0",x"da",x"f2",                         -- fadf |   push 0xf2da
    x"e6",x"1c",x"64",                               -- fae3 |   pop [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"da",x"f2",x"4f",x"d5", -- fae6 |   jne [0x64], 0xf2da, ${fail}:rel + PC
                                                     --      | test_uop_mmap:
    x"62",x"e0",x"e0",x"00",x"30",x"00",x"ff",       -- faef |   mov [0x3000], 0xff00
    x"62",x"e0",x"e0",x"00",x"31",x"01",x"ff",       -- faf6 |   mov [0x3100], 0xff01
    x"62",x"e0",x"e0",x"00",x"32",x"02",x"ff",       -- fafd |   mov [0x3200], 0xff02
    x"62",x"e0",x"e0",x"00",x"40",x"00",x"dd",       -- fb04 |   mov [0x4000], 0xdd00
    x"62",x"e0",x"e0",x"00",x"41",x"01",x"dd",       -- fb0b |   mov [0x4100], 0xdd01
    x"62",x"e0",x"e0",x"00",x"42",x"02",x"dd",       -- fb12 |   mov [0x4200], 0xdd02
    x"62",x"e0",x"e0",x"00",x"50",x"00",x"ee",       -- fb19 |   mov [0x5000], 0xee00
    x"62",x"e0",x"e0",x"00",x"51",x"01",x"ee",       -- fb20 |   mov [0x5100], 0xee01
    x"62",x"e0",x"e0",x"00",x"52",x"02",x"ee",       -- fb27 |   mov [0x5200], 0xee02
    x"60",x"20",x"00",                               -- fb2e |   mov A, 0
    x"60",x"40",x"e0",x"00",x"41",                   -- fb31 |   mov B, 0x4100
    x"54",x"e0",x"e0",x"1c",x"00",x"31",x"ff",x"32",x"01", -- fb36 |   mmap 0x3100, 0x32ff, 0x1
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"dd",x"f6",x"d4", -- fb3f |   jne [0x3100], 0xdd01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"02",x"dd",x"ec",x"d4", -- fb49 |   jne [0x3200], 0xdd02, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"e2",x"d4", -- fb53 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"60",x"40",x"e0",x"00",x"51",                   -- fb5d |   mov B, 0x5100
    x"54",x"e0",x"e0",x"1c",x"00",x"32",x"ff",x"32",x"02", -- fb62 |   mmap 0x3200, 0x32ff, 0x2
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"01",x"ee",x"ca",x"d4", -- fb6b |   jne [0x3200], 0xee01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"c0",x"d4", -- fb75 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"dd",x"b6",x"d4", -- fb7f |   jne [0x3100], 0xdd01, ${fail}:rel + PC
    x"d4",x"1c",x"01",                               -- fb89 |   umap 0x1
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"ff",x"a9",x"d4", -- fb8c |   jne [0x3100], 0xff01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"01",x"ee",x"9f",x"d4", -- fb96 |   jne [0x3200], 0xee01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"95",x"d4", -- fba0 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"d4",x"1c",x"02",                               -- fbaa |   umap 0x2
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"88",x"d4", -- fbad |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"ff",x"7e",x"d4", -- fbb7 |   jne [0x3100], 0xff01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"02",x"ff",x"74",x"d4", -- fbc1 |   jne [0x3200], 0xff02, ${fail}:rel + PC
                                                     --      | test_uop_umap:
                                                     --      | test_aux_reg:
    x"60",x"20",x"1c",x"01",                         -- fbcb |   mov A, 0x1
    x"60",x"40",x"1c",x"02",                         -- fbcf |   mov B, 0x2
    x"60",x"60",x"1c",x"03",                         -- fbd3 |   mov C, 0x3
    x"60",x"80",x"1c",x"04",                         -- fbd7 |   mov D, 0x4
    x"60",x"fc",x"1c",x"05",                         -- fbdb |   mov E, 0x5
    x"60",x"fd",x"1c",x"06",                         -- fbdf |   mov F, 0x6
    x"60",x"fe",x"1c",x"07",                         -- fbe3 |   mov G, 0x7
    x"60",x"ff",x"1c",x"08",                         -- fbe7 |   mov H, 0x8
    x"ec",x"20",x"1c",x"f8",x"01",x"4a",x"d4",       -- fbeb |   jne A, 0x1, ${fail}:rel + PC
    x"ec",x"40",x"1c",x"f8",x"02",x"43",x"d4",       -- fbf2 |   jne B, 0x2, ${fail}:rel + PC
    x"ec",x"60",x"1c",x"f8",x"03",x"3c",x"d4",       -- fbf9 |   jne C, 0x3, ${fail}:rel + PC
    x"ec",x"80",x"1c",x"f8",x"04",x"35",x"d4",       -- fc00 |   jne D, 0x4, ${fail}:rel + PC
    x"ec",x"fc",x"1c",x"f8",x"05",x"2e",x"d4",       -- fc07 |   jne E, 0x5, ${fail}:rel + PC
    x"ec",x"fd",x"1c",x"f8",x"06",x"27",x"d4",       -- fc0e |   jne F, 0x6, ${fail}:rel + PC
    x"ec",x"fe",x"1c",x"f8",x"07",x"20",x"d4",       -- fc15 |   jne G, 0x7, ${fail}:rel + PC
    x"ec",x"ff",x"1c",x"f8",x"08",x"19",x"d4",       -- fc1c |   jne H, 0x8, ${fail}:rel + PC
    x"34",x"ff",x"e0",x"00",x"ff",                   -- fc23 |   xor H, 0xff00
    x"ec",x"ff",x"e0",x"f8",x"08",x"ff",x"0d",x"d4", -- fc28 |   jne H, 0xff08, ${fail}:rel + PC
    x"60",x"20",x"ff",                               -- fc30 |   mov A, H
    x"ec",x"20",x"e0",x"f8",x"08",x"ff",x"02",x"d4", -- fc33 |   jne A, 0xff08, ${fail}:rel + PC
    x"60",x"fc",x"fe",                               -- fc3b |   mov E, G
    x"ec",x"fc",x"1c",x"f8",x"07",x"f7",x"d3",       -- fc3e |   jne E, 0x7, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"08",x"ff",x"f0",x"d3", -- fc45 |   jne H, 0xff08, ${fail}:rel + PC
                                                     --      | test_call_ret:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fc4d |   mov SP, 0x1000
    x"5c",x"f8",x"77",x"00",                         -- fc52 |   call ${fn_test_target}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"df",x"d3", -- fc56 |   jne SP, 0x1000, ${fail}:rel + PC
    x"60",x"20",x"1c",x"0a",                         -- fc5e |   mov A, 0xa
    x"60",x"40",x"00",                               -- fc62 |   mov B, 0
    x"60",x"60",x"00",                               -- fc65 |   mov C, 0
    x"60",x"80",x"00",                               -- fc68 |   mov D, 0
    x"5c",x"f8",x"2d",x"00",                         -- fc6b |   call ${fn_recursive}:rel + PC
    x"ec",x"20",x"00",x"f8",x"c6",x"d3",             -- fc6f |   jne A, 0, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"3f",x"cf",x"c0",x"d3", -- fc75 |   jne B, 0xcf3f, ${fail}:rel + PC
    x"ec",x"60",x"1c",x"f8",x"2d",x"b8",x"d3",       -- fc7d |   jne C, 0x2d, ${fail}:rel + PC
    x"ec",x"80",x"e0",x"f8",x"97",x"45",x"b1",x"d3", -- fc84 |   jne D, 0x4597, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"a9",x"d3", -- fc8c |   jne SP, 0x1000, ${fail}:rel + PC
    x"58",x"f8",x"42",x"00",                         -- fc94 |   jmp ${test_call_ret_end}:rel + PC
                                                     --      | fn_recursive:
    x"04",x"20",x"1c",x"01",                         -- fc98 |   sub A, 0x1
    x"5c",x"f8",x"25",x"00",                         -- fc9c |   call ${fn_process_c}:rel + PC
    x"e8",x"20",x"00",x"f8",x"1c",x"00",             -- fca0 |   jeq A, 0, ${fn_recursive_end}:rel + PC
    x"5c",x"f8",x"f2",x"ff",                         -- fca6 |   call ${fn_recursive}:rel + PC
    x"00",x"80",x"60",                               -- fcaa |   add D, C
    x"08",x"80",x"1c",x"03",                         -- fcad |   mul D, 0x3
    x"00",x"40",x"80",                               -- fcb1 |   add B, D
    x"e0",x"80",                                     -- fcb4 |   push D
    x"08",x"40",x"1c",x"05",                         -- fcb6 |   mul B, 0x5
    x"e4",x"80",                                     -- fcba |   pop D
                                                     --      | fn_recursive_end:
    x"dc",                                           -- fcbc |   ret
    x"58",x"f8",x"78",x"d3",                         -- fcbd |   jmp ${fail}:rel + PC
                                                     --      | fn_process_c:
    x"00",x"60",x"20",                               -- fcc1 |   add C, A
    x"dc",                                           -- fcc4 |   ret
    x"58",x"f8",x"70",x"d3",                         -- fcc5 |   jmp ${fail}:rel + PC
                                                     --      | fn_test_target:
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"6c",x"d3", -- fcc9 |   jne SP, 0xffe, ${fail}:rel + PC
    x"dc",                                           -- fcd1 |   ret
    x"58",x"f8",x"63",x"d3",                         -- fcd2 |   jmp ${fail}:rel + PC
                                                     --      | test_call_ret_end:
                                                     --      | test_mem_access:
    x"62",x"e0",x"1c",x"00",x"01",x"ed",             -- fcd6 |   mov [0x100], 0xed
    x"ee",x"e0",x"e0",x"f8",x"00",x"01",x"aa",x"00",x"0e",x"00", -- fcdc |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
    x"58",x"f8",x"4f",x"d3",                         -- fce6 |   jmp ${fail}:rel + PC
                                                     --      | test_mem_access_check_jmp:
    x"62",x"e0",x"00",x"00",x"10",                   -- fcea |   mov [0x1000], 0
    x"60",x"a0",x"e0",x"00",x"10",                   -- fcef |   mov SP, 0x1000
    x"ee",x"a0",x"00",x"f8",x"41",x"d3",             -- fcf4 |   jne [SP], 0, ${fail}:rel + PC
    x"e0",x"00",                                     -- fcfa |   push 0
    x"e0",x"00",                                     -- fcfc |   push 0
    x"e0",x"00",                                     -- fcfe |   push 0
    x"e4",x"20",                                     -- fd00 |   pop A
    x"e4",x"20",                                     -- fd02 |   pop A
    x"e4",x"20",                                     -- fd04 |   pop A
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"2f",x"d3", -- fd06 |   jne SP, 0x1000, ${fail}:rel + PC
    x"ec",x"20",x"00",x"f8",x"27",x"d3",             -- fd0e |   jne A, 0, ${fail}:rel + PC
    x"e0",x"e0",x"02",x"01",                         -- fd14 |   push 0x102
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"1d",x"d3", -- fd18 |   jne SP, 0xffe, ${fail}:rel + PC
    x"e0",x"e0",x"04",x"03",                         -- fd20 |   push 0x304
    x"ec",x"a0",x"e0",x"f8",x"fc",x"0f",x"11",x"d3", -- fd24 |   jne SP, 0xffc, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fe",x"0f",x"02",x"01",x"09",x"d3", -- fd2c |   jne [0xffe], 0x102, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fc",x"0f",x"04",x"03",x"ff",x"d2", -- fd36 |   jne [0xffc], 0x304, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fb",x"0f",x"00",x"04",x"f5",x"d2", -- fd40 |   jne [0xffb], 0x400, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fd",x"0f",x"03",x"02",x"eb",x"d2", -- fd4a |   jne [0xffd], 0x203, ${fail}:rel + PC
    x"ee",x"e0",x"1c",x"f8",x"ff",x"0f",x"01",x"e1",x"d2", -- fd54 |   jne [0xfff], 0x1, ${fail}:rel + PC
    x"e4",x"20",                                     -- fd5d |   pop A
    x"ec",x"20",x"e0",x"f8",x"04",x"03",x"d6",x"d2", -- fd5f |   jne A, 0x304, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"ce",x"d2", -- fd67 |   jne SP, 0xffe, ${fail}:rel + PC
    x"e4",x"20",                                     -- fd6f |   pop A
    x"ec",x"20",x"e0",x"f8",x"02",x"01",x"c4",x"d2", -- fd71 |   jne A, 0x102, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"bc",x"d2", -- fd79 |   jne SP, 0x1000, ${fail}:rel + PC
                                                     --      | test_cmp:
    x"cc",x"1c",x"ff",                               -- fd81 |   setf 0xff
    x"4c",x"20",                                     -- fd84 |   getf A
    x"ec",x"20",x"1c",x"f8",x"3f",x"af",x"d2",       -- fd86 |   jne A, 0x3f, ${fail}:rel + PC
    x"cc",x"e0",x"ab",x"ab",                         -- fd8d |   setf 0xabab
    x"4c",x"20",                                     -- fd91 |   getf A
    x"ec",x"20",x"1c",x"f8",x"2b",x"a2",x"d2",       -- fd93 |   jne A, 0x2b, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"ab",x"2b",                   -- fd9a |   cmp 0xab, 0x2b
    x"4c",x"20",                                     -- fd9f |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"94",x"d2",       -- fda1 |   jne A, 0x32, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"2b",x"ab",                   -- fda8 |   cmp 0x2b, 0xab
    x"4c",x"20",                                     -- fdad |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"86",x"d2",       -- fdaf |   jne A, 0xe, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"ab",x"ab",                   -- fdb6 |   cmp 0xab, 0xab
    x"4c",x"20",                                     -- fdbb |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"78",x"d2",       -- fdbd |   jne A, 0x29, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"ab",x"2b",                   -- fdc4 |   icmp 0xab, 0x2b
    x"4c",x"20",                                     -- fdc9 |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"6a",x"d2",       -- fdcb |   jne A, 0xe, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"2b",x"ab",                   -- fdd2 |   icmp 0x2b, 0xab
    x"4c",x"20",                                     -- fdd7 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"5c",x"d2",       -- fdd9 |   jne A, 0x32, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"ab",x"ab",                   -- fde0 |   icmp 0xab, 0xab
    x"4c",x"20",                                     -- fde5 |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"4e",x"d2",       -- fde7 |   jne A, 0x29, ${fail}:rel + PC
                                                     --      | test_cmp_direct:
    x"60",x"60",x"1c",x"ab",                         -- fdee |   mov C, 0xab
    x"60",x"80",x"1c",x"2b",                         -- fdf2 |   mov D, 0x2b
    x"50",x"60",x"80",                               -- fdf6 |   cmp C, D
    x"4c",x"20",                                     -- fdf9 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"3a",x"d2",       -- fdfb |   jne A, 0x32, ${fail}:rel + PC
    x"50",x"80",x"60",                               -- fe02 |   cmp D, C
    x"4c",x"20",                                     -- fe05 |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"2e",x"d2",       -- fe07 |   jne A, 0xe, ${fail}:rel + PC
    x"50",x"60",x"60",                               -- fe0e |   cmp C, C
    x"4c",x"20",                                     -- fe11 |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"22",x"d2",       -- fe13 |   jne A, 0x29, ${fail}:rel + PC
    x"d0",x"60",x"80",                               -- fe1a |   icmp C, D
    x"4c",x"20",                                     -- fe1d |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"16",x"d2",       -- fe1f |   jne A, 0xe, ${fail}:rel + PC
    x"d0",x"80",x"60",                               -- fe26 |   icmp D, C
    x"4c",x"20",                                     -- fe29 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"0a",x"d2",       -- fe2b |   jne A, 0x32, ${fail}:rel + PC
    x"d0",x"60",x"60",                               -- fe32 |   icmp C, C
    x"4c",x"20",                                     -- fe35 |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"fe",x"d1",       -- fe37 |   jne A, 0x29, ${fail}:rel + PC
                                                     --      | end_of_test:
    x"60",x"20",x"e0",x"ad",x"de",                   -- fe3e |   mov A, 0xdead
    x"60",x"40",x"e0",x"ef",x"be",                   -- fe43 |   mov B, 0xbeef
    x"88",x"60",x"20",x"40",                         -- fe48 |   mul C, A, B
    x"58",x"f8",x"ee",x"d1",                         -- fe4c |   jmp ${success}:rel + PC
    x"dc",                                           -- fe50 |   ret
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
