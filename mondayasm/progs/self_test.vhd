
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 10515;
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
                                                     --      | jmp_test:
    x"e8",x"1c",x"1c",x"f8",x"ab",x"2b",x"f6",x"fb", -- d43f |   jeq 0xab, 0x2b, ${fail}:rel + PC
    x"ec",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d447 |   jne 0xab, 0x2b, ${_L_test_jmp_1}:rel + PC
    x"58",x"f8",x"e6",x"fb",                         -- d44f |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_1:
    x"f0",x"1c",x"1c",x"f8",x"ab",x"2b",x"e2",x"fb", -- d453 |   jlt 0xab, 0x2b, ${fail}:rel + PC
    x"f4",x"1c",x"1c",x"f8",x"ab",x"2b",x"da",x"fb", -- d45b |   jle 0xab, 0x2b, ${fail}:rel + PC
    x"f8",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d463 |   jgt 0xab, 0x2b, ${_L_test_jmp_2}:rel + PC
    x"58",x"f8",x"ca",x"fb",                         -- d46b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_2:
    x"fc",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d46f |   jge 0xab, 0x2b, ${_L_test_jmp_3}:rel + PC
    x"58",x"f8",x"be",x"fb",                         -- d477 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_3:
    x"50",x"1c",x"1c",x"ab",x"2b",                   -- d47b |   cmp 0xab, 0x2b
    x"68",x"f8",x"b5",x"fb",                         -- d480 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d484 |   jne ${_L_test_jmp_4}:rel + PC
    x"58",x"f8",x"ad",x"fb",                         -- d488 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_4:
    x"70",x"f8",x"a9",x"fb",                         -- d48c |   jlt ${fail}:rel + PC
    x"74",x"f8",x"a5",x"fb",                         -- d490 |   jle ${fail}:rel + PC
    x"78",x"f8",x"08",x"00",                         -- d494 |   jgt ${_L_test_jmp_5}:rel + PC
    x"58",x"f8",x"9d",x"fb",                         -- d498 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_5:
    x"7c",x"f8",x"08",x"00",                         -- d49c |   jge ${_L_test_jmp_6}:rel + PC
    x"58",x"f8",x"95",x"fb",                         -- d4a0 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_6:
    x"d0",x"1c",x"1c",x"ab",x"2b",                   -- d4a4 |   icmp 0xab, 0x2b
    x"68",x"f8",x"8c",x"fb",                         -- d4a9 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d4ad |   jne ${_L_test_jmp_7}:rel + PC
    x"58",x"f8",x"84",x"fb",                         -- d4b1 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_7:
    x"70",x"f8",x"08",x"00",                         -- d4b5 |   jlt ${_L_test_jmp_8}:rel + PC
    x"58",x"f8",x"7c",x"fb",                         -- d4b9 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_8:
    x"74",x"f8",x"08",x"00",                         -- d4bd |   jle ${_L_test_jmp_9}:rel + PC
    x"58",x"f8",x"74",x"fb",                         -- d4c1 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_9:
    x"78",x"f8",x"70",x"fb",                         -- d4c5 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"6c",x"fb",                         -- d4c9 |   jge ${fail}:rel + PC
    x"e8",x"1c",x"1c",x"f8",x"2b",x"ab",x"68",x"fb", -- d4cd |   jeq 0x2b, 0xab, ${fail}:rel + PC
    x"ec",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d4d5 |   jne 0x2b, 0xab, ${_L_test_jmp_10}:rel + PC
    x"58",x"f8",x"58",x"fb",                         -- d4dd |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_10:
    x"f0",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d4e1 |   jlt 0x2b, 0xab, ${_L_test_jmp_11}:rel + PC
    x"58",x"f8",x"4c",x"fb",                         -- d4e9 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_11:
    x"f4",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d4ed |   jle 0x2b, 0xab, ${_L_test_jmp_12}:rel + PC
    x"58",x"f8",x"40",x"fb",                         -- d4f5 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_12:
    x"f8",x"1c",x"1c",x"f8",x"2b",x"ab",x"3c",x"fb", -- d4f9 |   jgt 0x2b, 0xab, ${fail}:rel + PC
    x"fc",x"1c",x"1c",x"f8",x"2b",x"ab",x"34",x"fb", -- d501 |   jge 0x2b, 0xab, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"2b",x"ab",                   -- d509 |   cmp 0x2b, 0xab
    x"68",x"f8",x"27",x"fb",                         -- d50e |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d512 |   jne ${_L_test_jmp_13}:rel + PC
    x"58",x"f8",x"1f",x"fb",                         -- d516 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_13:
    x"70",x"f8",x"08",x"00",                         -- d51a |   jlt ${_L_test_jmp_14}:rel + PC
    x"58",x"f8",x"17",x"fb",                         -- d51e |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_14:
    x"74",x"f8",x"08",x"00",                         -- d522 |   jle ${_L_test_jmp_15}:rel + PC
    x"58",x"f8",x"0f",x"fb",                         -- d526 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_15:
    x"78",x"f8",x"0b",x"fb",                         -- d52a |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"07",x"fb",                         -- d52e |   jge ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"2b",x"ab",                   -- d532 |   icmp 0x2b, 0xab
    x"68",x"f8",x"fe",x"fa",                         -- d537 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d53b |   jne ${_L_test_jmp_16}:rel + PC
    x"58",x"f8",x"f6",x"fa",                         -- d53f |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_16:
    x"70",x"f8",x"f2",x"fa",                         -- d543 |   jlt ${fail}:rel + PC
    x"74",x"f8",x"ee",x"fa",                         -- d547 |   jle ${fail}:rel + PC
    x"78",x"f8",x"08",x"00",                         -- d54b |   jgt ${_L_test_jmp_17}:rel + PC
    x"58",x"f8",x"e6",x"fa",                         -- d54f |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_17:
    x"7c",x"f8",x"08",x"00",                         -- d553 |   jge ${_L_test_jmp_18}:rel + PC
    x"58",x"f8",x"de",x"fa",                         -- d557 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_18:
    x"e8",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- d55b |   jeq 0xab, 0xab, ${_L_test_jmp_19}:rel + PC
    x"58",x"f8",x"d2",x"fa",                         -- d563 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_19:
    x"ec",x"1c",x"1c",x"f8",x"ab",x"ab",x"ce",x"fa", -- d567 |   jne 0xab, 0xab, ${fail}:rel + PC
    x"f0",x"1c",x"1c",x"f8",x"ab",x"ab",x"c6",x"fa", -- d56f |   jlt 0xab, 0xab, ${fail}:rel + PC
    x"f4",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- d577 |   jle 0xab, 0xab, ${_L_test_jmp_20}:rel + PC
    x"58",x"f8",x"b6",x"fa",                         -- d57f |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_20:
    x"f8",x"1c",x"1c",x"f8",x"ab",x"ab",x"b2",x"fa", -- d583 |   jgt 0xab, 0xab, ${fail}:rel + PC
    x"fc",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- d58b |   jge 0xab, 0xab, ${_L_test_jmp_21}:rel + PC
    x"58",x"f8",x"a2",x"fa",                         -- d593 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_21:
    x"50",x"1c",x"1c",x"ab",x"ab",                   -- d597 |   cmp 0xab, 0xab
    x"68",x"f8",x"08",x"00",                         -- d59c |   jeq ${_L_test_jmp_22}:rel + PC
    x"58",x"f8",x"95",x"fa",                         -- d5a0 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_22:
    x"6c",x"f8",x"91",x"fa",                         -- d5a4 |   jne ${fail}:rel + PC
    x"70",x"f8",x"8d",x"fa",                         -- d5a8 |   jlt ${fail}:rel + PC
    x"74",x"f8",x"08",x"00",                         -- d5ac |   jle ${_L_test_jmp_23}:rel + PC
    x"58",x"f8",x"85",x"fa",                         -- d5b0 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_23:
    x"78",x"f8",x"81",x"fa",                         -- d5b4 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"08",x"00",                         -- d5b8 |   jge ${_L_test_jmp_24}:rel + PC
    x"58",x"f8",x"79",x"fa",                         -- d5bc |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_24:
    x"d0",x"1c",x"1c",x"ab",x"ab",                   -- d5c0 |   icmp 0xab, 0xab
    x"68",x"f8",x"08",x"00",                         -- d5c5 |   jeq ${_L_test_jmp_25}:rel + PC
    x"58",x"f8",x"6c",x"fa",                         -- d5c9 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_25:
    x"6c",x"f8",x"68",x"fa",                         -- d5cd |   jne ${fail}:rel + PC
    x"70",x"f8",x"64",x"fa",                         -- d5d1 |   jlt ${fail}:rel + PC
    x"74",x"f8",x"08",x"00",                         -- d5d5 |   jle ${_L_test_jmp_26}:rel + PC
    x"58",x"f8",x"5c",x"fa",                         -- d5d9 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_26:
    x"78",x"f8",x"58",x"fa",                         -- d5dd |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"08",x"00",                         -- d5e1 |   jge ${_L_test_jmp_27}:rel + PC
    x"58",x"f8",x"50",x"fa",                         -- d5e5 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_27:
                                                     --      | test_uop_get_arg:
    x"60",x"a0",x"e0",x"00",x"70",                   -- d5e9 |   mov SP, 0x7000
    x"60",x"20",x"e0",x"aa",x"00",                   -- d5ee |   mov A, 0xaa
    x"60",x"40",x"e0",x"bb",x"00",                   -- d5f3 |   mov B, 0xbb
    x"60",x"fe",x"e0",x"55",x"01",                   -- d5f8 |   mov G, 0x155
    x"b6",x"e0",x"1c",x"fe",x"39",x"30",x"85",       -- d5fd |   xor [0x3039], -123, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d0",x"fe",x"31",x"fa", -- d604 |   jne [0x3039], 0xfed0, ${fail}:rel + PC
    x"ae",x"3e",x"fe",x"21",x"f6",                   -- d60e |   and [A*4 + -10], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"54",x"01",x"22",x"fa", -- d613 |   jne [0x29e], 0x154, ${fail}:rel + PC
    x"86",x"21",x"e4",x"3e",x"de",x"fa",x"f6",       -- d61d |   sub [A*2], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ea",x"f8",x"11",x"fa", -- d624 |   jne [0x154], 0xf8ea, ${fail}:rel + PC
    x"a6",x"e0",x"20",x"21",x"39",x"30",             -- d62e |   ishr [0x3039], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"0a",x"01",x"fa", -- d634 |   jne [0x3039], 0xa, ${fail}:rel + PC
    x"aa",x"fe",x"2a",x"3e",x"f6",                   -- d63d |   shl [G], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"c0",x"f3",x"f9", -- d642 |   jne [0x155], 0xc000, ${fail}:rel + PC
    x"b2",x"fe",x"1c",x"fe",x"85",                   -- d64c |   or [G], -123, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"d5",x"e4",x"f9", -- d651 |   jne [0x155], 0xd5, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"20",x"85",                   -- d65a |   mul [A*4 + B], -123, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"52",x"ae",x"d6",x"f9", -- d65f |   jne [0x363], 0xae52, ${fail}:rel + PC
    x"a6",x"e0",x"e0",x"2a",x"39",x"30",x"39",x"30", -- d669 |   ishr [0x3039], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"07",x"06",x"c4",x"f9", -- d671 |   jne [0x3039], 0x607, ${fail}:rel + PC
    x"a2",x"21",x"e4",x"21",x"de",x"fa",             -- d67b |   shr [A*2], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b8",x"0f",x"b4",x"f9", -- d681 |   jne [0x154], 0xfb8, ${fail}:rel + PC
    x"82",x"21",x"fe",x"fe",                         -- d68b |   add [A*2], G, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"02",x"a6",x"f9", -- d68f |   jne [0x154], 0x2aa, ${fail}:rel + PC
    x"a6",x"fe",x"e4",x"20",x"de",x"fa",             -- d699 |   ishr [G], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"fe",x"96",x"f9", -- d69f |   jne [0x155], 0xfe, ${fail}:rel + PC
    x"82",x"e0",x"e4",x"2a",x"39",x"30",x"de",x"fa", -- d6a8 |   add [0x3039], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"eb",x"fe",x"85",x"f9", -- d6b0 |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
    x"a6",x"20",x"20",x"20",                         -- d6ba |   ishr [A], A, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"77",x"f9", -- d6be |   jne [0xaa], 0, ${fail}:rel + PC
    x"82",x"fe",x"2a",x"20",                         -- d6c6 |   add [G], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0d",x"04",x"6b",x"f9", -- d6ca |   jne [0x155], 0x40d, ${fail}:rel + PC
    x"b6",x"fe",x"fe",x"fe",                         -- d6d4 |   xor [G], G, G
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"5d",x"f9", -- d6d8 |   jne [0x155], 0, ${fail}:rel + PC
    x"aa",x"21",x"fe",x"21",                         -- d6e0 |   shl [A*2], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"50",x"15",x"51",x"f9", -- d6e4 |   jne [0x154], 0x1550, ${fail}:rel + PC
    x"a6",x"fe",x"e0",x"21",x"39",x"30",             -- d6ee |   ishr [G], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"03",x"03",x"41",x"f9", -- d6f4 |   jne [0x155], 0x303, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"e4",x"de",x"fa",             -- d6fe |   and [A*2], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"03",x"31",x"f9", -- d704 |   jne [0x154], 0x300, ${fail}:rel + PC
    x"82",x"20",x"3e",x"3e",x"f6",x"f6",             -- d70e |   add [A], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"3c",x"05",x"21",x"f9", -- d714 |   jne [0xaa], 0x53c, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"1c",x"39",x"30",x"85",       -- d71e |   or [0x3039], A*2, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"d5",x"10",x"f9", -- d725 |   jne [0x3039], 0xd5, ${fail}:rel + PC
    x"82",x"e0",x"fe",x"fe",x"39",x"30",             -- d72e |   add [0x3039], G, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"02",x"01",x"f9", -- d734 |   jne [0x3039], 0x2aa, ${fail}:rel + PC
    x"ae",x"fe",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- d73e |   and [G], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"08",x"30",x"ef",x"f8", -- d746 |   jne [0x155], 0x3008, ${fail}:rel + PC
    x"8e",x"e0",x"2a",x"3e",x"39",x"30",x"f6",       -- d750 |   imul [0x3039], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"1a",x"dd",x"de",x"f8", -- d757 |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
    x"b2",x"21",x"e0",x"20",x"39",x"30",             -- d761 |   or [A*2], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"bb",x"30",x"ce",x"f8", -- d767 |   jne [0x154], 0x30bb, ${fail}:rel + PC
    x"8e",x"21",x"3e",x"21",x"f6",                   -- d771 |   imul [A*2], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"d8",x"79",x"bf",x"f8", -- d776 |   jne [0x154], 0x79d8, ${fail}:rel + PC
    x"82",x"3e",x"1c",x"2a",x"f6",x"85",             -- d780 |   add [A*4 + -10], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e8",x"02",x"af",x"f8", -- d786 |   jne [0x29e], 0x2e8, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"21",x"de",x"fa",             -- d790 |   sub [G], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"34",x"fa",x"9f",x"f8", -- d796 |   jne [0x155], 0xfa34, ${fail}:rel + PC
    x"b2",x"2a",x"e4",x"21",x"de",x"fa",             -- d7a0 |   or [A*4 + B], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"dc",x"fb",x"8f",x"f8", -- d7a6 |   jne [0x363], 0xfbdc, ${fail}:rel + PC
    x"ae",x"21",x"21",x"20",                         -- d7b0 |   and [A*2], A*2, A
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"81",x"f8", -- d7b4 |   jne [0x154], 0, ${fail}:rel + PC
    x"86",x"2a",x"2a",x"fe",                         -- d7bc |   sub [A*4 + B], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"0e",x"02",x"75",x"f8", -- d7c0 |   jne [0x363], 0x20e, ${fail}:rel + PC
    x"82",x"3e",x"3e",x"20",x"f6",x"f6",             -- d7ca |   add [A*4 + -10], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"48",x"03",x"65",x"f8", -- d7d0 |   jne [0x29e], 0x348, ${fail}:rel + PC
    x"86",x"21",x"e0",x"e0",x"39",x"30",x"39",x"30", -- d7da |   sub [A*2], 0x3039, 0x3039
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"53",x"f8", -- d7e2 |   jne [0x154], 0, ${fail}:rel + PC
    x"a2",x"20",x"1c",x"fe",x"85",                   -- d7ea |   shr [A], -123, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"fc",x"07",x"46",x"f8", -- d7ef |   jne [0xaa], 0x7fc, ${fail}:rel + PC
    x"aa",x"2a",x"1c",x"2a",x"85",                   -- d7f9 |   shl [A*4 + B], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"28",x"fc",x"37",x"f8", -- d7fe |   jne [0x363], 0xfc28, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"20",                         -- d808 |   or [A*4 + B], A, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"aa",x"00",x"29",x"f8", -- d80c |   jne [0x363], 0xaa, ${fail}:rel + PC
    x"86",x"20",x"20",x"1c",x"85",                   -- d816 |   sub [A], A, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"25",x"01",x"1a",x"f8", -- d81b |   jne [0xaa], 0x125, ${fail}:rel + PC
    x"a6",x"3e",x"e4",x"21",x"f6",x"de",x"fa",       -- d825 |   ishr [A*4 + -10], 0xfade + A, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"b8",x"09",x"f8", -- d82c |   jne [0x29e], 0xb8, ${fail}:rel + PC
    x"86",x"20",x"e0",x"e0",x"39",x"30",x"39",x"30", -- d835 |   sub [A], 0x3039, 0x3039
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"f8",x"f7", -- d83d |   jne [0xaa], 0, ${fail}:rel + PC
    x"82",x"fe",x"e0",x"e0",x"39",x"30",x"39",x"30", -- d845 |   add [G], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"72",x"60",x"e8",x"f7", -- d84d |   jne [0x155], 0x6072, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- d857 |   shr [A*4 + B], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"fb",x"00",x"d6",x"f7", -- d85f |   jne [0x363], 0xfb, ${fail}:rel + PC
    x"8e",x"20",x"20",x"fe",                         -- d869 |   imul [A], A, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"72",x"e2",x"c8",x"f7", -- d86d |   jne [0xaa], 0xe272, ${fail}:rel + PC
    x"a2",x"21",x"e4",x"2a",x"de",x"fa",             -- d877 |   shr [A*2], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"71",x"1f",x"b8",x"f7", -- d87d |   jne [0x154], 0x1f71, ${fail}:rel + PC
    x"a2",x"2a",x"2a",x"1c",x"85",                   -- d887 |   shr [A*4 + B], A*4 + B, -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"1b",x"a9",x"f7", -- d88c |   jne [0x363], 0x1b, ${fail}:rel + PC
    x"a2",x"20",x"21",x"2a",                         -- d895 |   shr [A], A*2, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"2a",x"9c",x"f7", -- d899 |   jne [0xaa], 0x2a, ${fail}:rel + PC
    x"ae",x"e0",x"2a",x"20",x"39",x"30",             -- d8a2 |   and [0x3039], A*4 + B, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"22",x"8d",x"f7", -- d8a8 |   jne [0x3039], 0x22, ${fail}:rel + PC
    x"a2",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"39",x"30", -- d8b1 |   shr [0x3039], 0x3039, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"18",x"7a",x"f7", -- d8bb |   jne [0x3039], 0x18, ${fail}:rel + PC
    x"8a",x"20",x"fe",x"3e",x"f6",                   -- d8c4 |   mul [A], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"76",x"7c",x"6c",x"f7", -- d8c9 |   jne [0xaa], 0x7c76, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"2a",x"39",x"30",             -- d8d3 |   add [A*4 + B], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"9c",x"33",x"5c",x"f7", -- d8d9 |   jne [0x363], 0x339c, ${fail}:rel + PC
    x"8e",x"fe",x"3e",x"2a",x"f6",                   -- d8e3 |   imul [G], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"1a",x"dd",x"4d",x"f7", -- d8e8 |   jne [0x155], 0xdd1a, ${fail}:rel + PC
    x"aa",x"20",x"21",x"e0",x"39",x"30",             -- d8f2 |   shl [A], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"a8",x"3d",x"f7", -- d8f8 |   jne [0xaa], 0xa800, ${fail}:rel + PC
    x"82",x"21",x"fe",x"20",                         -- d902 |   add [A*2], G, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"01",x"2f",x"f7", -- d906 |   jne [0x154], 0x1ff, ${fail}:rel + PC
    x"82",x"2a",x"2a",x"21",                         -- d910 |   add [A*4 + B], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"b7",x"04",x"21",x"f7", -- d914 |   jne [0x363], 0x4b7, ${fail}:rel + PC
    x"a2",x"20",x"fe",x"e4",x"de",x"fa",             -- d91e |   shr [A], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"01",x"11",x"f7", -- d924 |   jne [0xaa], 0x1, ${fail}:rel + PC
    x"82",x"fe",x"1c",x"20",x"85",                   -- d92d |   add [G], -123, A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"2f",x"03",x"f7", -- d932 |   jne [0x155], 0x2f, ${fail}:rel + PC
    x"8e",x"3e",x"fe",x"e0",x"f6",x"39",x"30",       -- d93b |   imul [A*4 + -10], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ed",x"3b",x"f3",x"f6", -- d942 |   jne [0x29e], 0x3bed, ${fail}:rel + PC
    x"8a",x"fe",x"e4",x"2a",x"de",x"fa",             -- d94c |   mul [G], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"98",x"dd",x"e3",x"f6", -- d952 |   jne [0x155], 0xdd98, ${fail}:rel + PC
    x"a2",x"fe",x"fe",x"20",                         -- d95c |   shr [G], G, A
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"d5",x"f6", -- d960 |   jne [0x155], 0, ${fail}:rel + PC
    x"b2",x"21",x"20",x"20",                         -- d968 |   or [A*2], A, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"00",x"c9",x"f6", -- d96c |   jne [0x154], 0xaa, ${fail}:rel + PC
    x"b2",x"3e",x"1c",x"21",x"f6",x"85",             -- d976 |   or [A*4 + -10], -123, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"d5",x"b9",x"f6", -- d97c |   jne [0x29e], 0xd5, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"1c",x"85",x"85",             -- d985 |   mul [A*4 + B], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"19",x"3b",x"aa",x"f6", -- d98b |   jne [0x363], 0x3b19, ${fail}:rel + PC
    x"8a",x"e0",x"e4",x"21",x"39",x"30",x"de",x"fa", -- d995 |   mul [0x3039], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"a0",x"10",x"98",x"f6", -- d99d |   jne [0x3039], 0x10a0, ${fail}:rel + PC
    x"86",x"fe",x"20",x"3e",x"f6",                   -- d9a7 |   sub [G], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0c",x"fe",x"89",x"f6", -- d9ac |   jne [0x155], 0xfe0c, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"21",                         -- d9b6 |   shl [A], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"30",x"36",x"7b",x"f6", -- d9ba |   jne [0xaa], 0x3630, ${fail}:rel + PC
    x"b6",x"21",x"1c",x"2a",x"85",                   -- d9c4 |   xor [A*2], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"e6",x"fc",x"6c",x"f6", -- d9c9 |   jne [0x154], 0xfce6, ${fail}:rel + PC
    x"86",x"2a",x"3e",x"1c",x"f6",x"85",             -- d9d3 |   sub [A*4 + B], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"19",x"03",x"5c",x"f6", -- d9d9 |   jne [0x363], 0x319, ${fail}:rel + PC
    x"86",x"e0",x"e0",x"e4",x"39",x"30",x"39",x"30",x"de",x"fa", -- d9e3 |   sub [0x3039], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"b1",x"34",x"48",x"f6", -- d9ed |   jne [0x3039], 0x34b1, ${fail}:rel + PC
    x"ae",x"fe",x"2a",x"e4",x"de",x"fa",             -- d9f7 |   and [G], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"03",x"38",x"f6", -- d9fd |   jne [0x155], 0x300, ${fail}:rel + PC
    x"aa",x"20",x"3e",x"fe",x"f6",                   -- da07 |   shl [A], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"c0",x"53",x"29",x"f6", -- da0c |   jne [0xaa], 0x53c0, ${fail}:rel + PC
    x"a6",x"fe",x"fe",x"e4",x"de",x"fa",             -- da16 |   ishr [G], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"01",x"19",x"f6", -- da1c |   jne [0x155], 0x1, ${fail}:rel + PC
    x"ae",x"21",x"e0",x"2a",x"39",x"30",             -- da25 |   and [A*2], 0x3039, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"21",x"0a",x"f6", -- da2b |   jne [0x154], 0x21, ${fail}:rel + PC
    x"a6",x"21",x"21",x"1c",x"85",                   -- da34 |   ishr [A*2], A*2, -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"0a",x"fc",x"f5", -- da39 |   jne [0x154], 0xa, ${fail}:rel + PC
    x"b6",x"fe",x"21",x"e0",x"39",x"30",             -- da42 |   xor [G], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"6d",x"31",x"ed",x"f5", -- da48 |   jne [0x155], 0x316d, ${fail}:rel + PC
    x"86",x"2a",x"3e",x"2a",x"f6",                   -- da52 |   sub [A*4 + B], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"3b",x"ff",x"de",x"f5", -- da57 |   jne [0x363], 0xff3b, ${fail}:rel + PC
    x"b2",x"e0",x"fe",x"1c",x"39",x"30",x"85",       -- da61 |   or [0x3039], G, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"d5",x"cd",x"f5", -- da68 |   jne [0x3039], 0xd5, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"20",x"f6",                   -- da71 |   shl [A*4 + B], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"78",x"bf",x"f5", -- da76 |   jne [0x363], 0x7800, ${fail}:rel + PC
    x"86",x"e0",x"21",x"20",x"39",x"30",             -- da80 |   sub [0x3039], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"00",x"af",x"f5", -- da86 |   jne [0x3039], 0xaa, ${fail}:rel + PC
    x"b6",x"e0",x"2a",x"21",x"39",x"30",             -- da90 |   xor [0x3039], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"37",x"02",x"9f",x"f5", -- da96 |   jne [0x3039], 0x237, ${fail}:rel + PC
    x"ae",x"2a",x"e0",x"1c",x"39",x"30",x"85",       -- daa0 |   and [A*4 + B], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"01",x"30",x"8e",x"f5", -- daa7 |   jne [0x363], 0x3001, ${fail}:rel + PC
    x"8e",x"fe",x"2a",x"e0",x"39",x"30",             -- dab1 |   imul [G], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0b",x"51",x"7e",x"f5", -- dab7 |   jne [0x155], 0x510b, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"fe",                         -- dac1 |   or [A*4 + B], A, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ff",x"01",x"70",x"f5", -- dac5 |   jne [0x363], 0x1ff, ${fail}:rel + PC
    x"a6",x"3e",x"e0",x"20",x"f6",x"39",x"30",       -- dacf |   ishr [A*4 + -10], 0x3039, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"0c",x"5f",x"f5", -- dad6 |   jne [0x29e], 0xc, ${fail}:rel + PC
    x"aa",x"e0",x"e4",x"e4",x"39",x"30",x"de",x"fa",x"de",x"fa", -- dadf |   shl [0x3039], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"88",x"4c",x"f5", -- dae9 |   jne [0x3039], 0x8800, ${fail}:rel + PC
    x"aa",x"20",x"e0",x"fe",x"39",x"30",             -- daf3 |   shl [A], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"20",x"07",x"3c",x"f5", -- daf9 |   jne [0xaa], 0x720, ${fail}:rel + PC
    x"b6",x"fe",x"3e",x"21",x"f6",                   -- db03 |   xor [G], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"ca",x"03",x"2d",x"f5", -- db08 |   jne [0x155], 0x3ca, ${fail}:rel + PC
    x"b2",x"2a",x"fe",x"1c",x"85",                   -- db12 |   or [A*4 + B], G, -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"d5",x"1e",x"f5", -- db17 |   jne [0x363], 0xd5, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"e0",x"f6",x"85",x"39",x"30", -- db20 |   sub [A*4 + -10], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"4c",x"cf",x"0d",x"f5", -- db28 |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
    x"aa",x"21",x"21",x"21",                         -- db32 |   shl [A*2], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"40",x"15",x"ff",x"f4", -- db36 |   jne [0x154], 0x1540, ${fail}:rel + PC
    x"86",x"e0",x"e4",x"e0",x"39",x"30",x"de",x"fa",x"39",x"30", -- db40 |   sub [0x3039], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"4f",x"cb",x"eb",x"f4", -- db4a |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
    x"a2",x"21",x"e0",x"1c",x"39",x"30",x"85",       -- db54 |   shr [A*2], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"81",x"01",x"da",x"f4", -- db5b |   jne [0x154], 0x181, ${fail}:rel + PC
    x"a6",x"e0",x"e4",x"20",x"39",x"30",x"de",x"fa", -- db65 |   ishr [0x3039], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"fe",x"c8",x"f4", -- db6d |   jne [0x3039], 0xfe, ${fail}:rel + PC
    x"b6",x"3e",x"e4",x"e0",x"f6",x"de",x"fa",x"39",x"30", -- db76 |   xor [A*4 + -10], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b1",x"cb",x"b6",x"f4", -- db7f |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
    x"86",x"3e",x"21",x"3e",x"f6",x"f6",             -- db89 |   sub [A*4 + -10], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b6",x"fe",x"a6",x"f4", -- db8f |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
    x"8e",x"fe",x"1c",x"3e",x"85",x"f6",             -- db99 |   imul [G], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"16",x"be",x"96",x"f4", -- db9f |   jne [0x155], 0xbe16, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"2a",                         -- dba9 |   shl [A], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"18",x"1b",x"88",x"f4", -- dbad |   jne [0xaa], 0x1b18, ${fail}:rel + PC
    x"b6",x"e0",x"21",x"2a",x"39",x"30",             -- dbb7 |   xor [0x3039], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"37",x"02",x"78",x"f4", -- dbbd |   jne [0x3039], 0x237, ${fail}:rel + PC
    x"82",x"21",x"21",x"e0",x"39",x"30",             -- dbc7 |   add [A*2], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"8d",x"31",x"68",x"f4", -- dbcd |   jne [0x154], 0x318d, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"20",                         -- dbd7 |   and [A*2], A*4 + B, A
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"22",x"5a",x"f4", -- dbdb |   jne [0x154], 0x22, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"e4",x"de",x"fa",             -- dbe4 |   shl [A], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"63",x"4b",x"f4", -- dbea |   jne [0xaa], 0x6300, ${fail}:rel + PC
    x"ae",x"2a",x"fe",x"20",                         -- dbf4 |   and [A*4 + B], G, A
    x"ee",x"e0",x"00",x"f8",x"63",x"03",x"3d",x"f4", -- dbf8 |   jne [0x363], 0, ${fail}:rel + PC
    x"b6",x"fe",x"21",x"1c",x"85",                   -- dc00 |   xor [G], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"d1",x"fe",x"30",x"f4", -- dc05 |   jne [0x155], 0xfed1, ${fail}:rel + PC
    x"ae",x"e0",x"fe",x"21",x"39",x"30",             -- dc0f |   and [0x3039], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"20",x"f4", -- dc15 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"b2",x"3e",x"e0",x"2a",x"f6",x"39",x"30",       -- dc1f |   or [A*4 + -10], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"7b",x"33",x"0f",x"f4", -- dc26 |   jne [0x29e], 0x337b, ${fail}:rel + PC
    x"b6",x"fe",x"e4",x"3e",x"de",x"fa",x"f6",       -- dc30 |   xor [G], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"16",x"f9",x"fe",x"f3", -- dc37 |   jne [0x155], 0xf916, ${fail}:rel + PC
    x"8e",x"2a",x"21",x"2a",                         -- dc41 |   imul [A*4 + B], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"7c",x"7f",x"f0",x"f3", -- dc45 |   jne [0x363], 0x7f7c, ${fail}:rel + PC
    x"a6",x"fe",x"21",x"fe",                         -- dc4f |   ishr [G], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"0a",x"e2",x"f3", -- dc53 |   jne [0x155], 0xa, ${fail}:rel + PC
    x"8a",x"21",x"1c",x"1c",x"85",x"85",             -- dc5c |   mul [A*2], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"19",x"3b",x"d3",x"f3", -- dc62 |   jne [0x154], 0x3b19, ${fail}:rel + PC
    x"8e",x"2a",x"e4",x"20",x"de",x"fa",             -- dc6c |   imul [A*4 + B], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"50",x"08",x"c3",x"f3", -- dc72 |   jne [0x363], 0x850, ${fail}:rel + PC
    x"a2",x"3e",x"3e",x"3e",x"f6",x"f6",x"f6",       -- dc7c |   shr [A*4 + -10], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"9e",x"02",x"b2",x"f3", -- dc83 |   jne [0x29e], 0, ${fail}:rel + PC
    x"8a",x"20",x"1c",x"e4",x"85",x"de",x"fa",       -- dc8b |   mul [A], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a8",x"25",x"a3",x"f3", -- dc92 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
    x"a6",x"3e",x"20",x"21",x"f6",                   -- dc9c |   ishr [A*4 + -10], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"0a",x"94",x"f3", -- dca1 |   jne [0x29e], 0xa, ${fail}:rel + PC
    x"b2",x"3e",x"20",x"20",x"f6",                   -- dcaa |   or [A*4 + -10], A, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"aa",x"00",x"86",x"f3", -- dcaf |   jne [0x29e], 0xaa, ${fail}:rel + PC
    x"82",x"e0",x"fe",x"e0",x"39",x"30",x"39",x"30", -- dcb9 |   add [0x3039], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"8e",x"31",x"74",x"f3", -- dcc1 |   jne [0x3039], 0x318e, ${fail}:rel + PC
    x"8e",x"3e",x"e0",x"3e",x"f6",x"39",x"30",x"f6", -- dccb |   imul [A*4 + -10], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"2e",x"35",x"62",x"f3", -- dcd3 |   jne [0x29e], 0x352e, ${fail}:rel + PC
    x"a6",x"fe",x"fe",x"21",                         -- dcdd |   ishr [G], G, A*2
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"15",x"54",x"f3", -- dce1 |   jne [0x155], 0x15, ${fail}:rel + PC
    x"8e",x"20",x"e4",x"3e",x"de",x"fa",x"f6",       -- dcea |   imul [A], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"f0",x"4d",x"44",x"f3", -- dcf1 |   jne [0xaa], 0x4df0, ${fail}:rel + PC
    x"a6",x"fe",x"20",x"fe",                         -- dcfb |   ishr [G], A, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"05",x"36",x"f3", -- dcff |   jne [0x155], 0x5, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"3e",x"39",x"30",x"f6",       -- dd08 |   add [A*4 + B], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d7",x"32",x"26",x"f3", -- dd0f |   jne [0x363], 0x32d7, ${fail}:rel + PC
    x"ae",x"3e",x"2a",x"e4",x"f6",x"de",x"fa",       -- dd19 |   and [A*4 + -10], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"03",x"15",x"f3", -- dd20 |   jne [0x29e], 0x300, ${fail}:rel + PC
    x"8e",x"20",x"1c",x"2a",x"85",                   -- dd2a |   imul [A], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"6f",x"5f",x"06",x"f3", -- dd2f |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
    x"a2",x"fe",x"3e",x"e4",x"f6",x"de",x"fa",       -- dd39 |   shr [G], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"02",x"f5",x"f2", -- dd40 |   jne [0x155], 0x2, ${fail}:rel + PC
    x"b2",x"2a",x"e0",x"20",x"39",x"30",             -- dd49 |   or [A*4 + B], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"bb",x"30",x"e6",x"f2", -- dd4f |   jne [0x363], 0x30bb, ${fail}:rel + PC
    x"b6",x"2a",x"e0",x"fe",x"39",x"30",             -- dd59 |   xor [A*4 + B], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"6c",x"31",x"d6",x"f2", -- dd5f |   jne [0x363], 0x316c, ${fail}:rel + PC
    x"8e",x"20",x"20",x"e0",x"39",x"30",             -- dd69 |   imul [A], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"da",x"05",x"c6",x"f2", -- dd6f |   jne [0xaa], 0x5da, ${fail}:rel + PC
    x"b2",x"21",x"2a",x"3e",x"f6",                   -- dd79 |   or [A*2], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"03",x"b7",x"f2", -- dd7e |   jne [0x154], 0x3ff, ${fail}:rel + PC
    x"aa",x"fe",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- dd88 |   shl [G], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"10",x"a5",x"f2", -- dd90 |   jne [0x155], 0x1000, ${fail}:rel + PC
    x"a6",x"2a",x"e4",x"2a",x"de",x"fa",             -- dd9a |   ishr [A*4 + B], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"71",x"ff",x"95",x"f2", -- dda0 |   jne [0x363], 0xff71, ${fail}:rel + PC
    x"aa",x"3e",x"e4",x"1c",x"f6",x"de",x"fa",x"85", -- ddaa |   shl [A*4 + -10], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"71",x"83",x"f2", -- ddb2 |   jne [0x29e], 0x7100, ${fail}:rel + PC
    x"a2",x"3e",x"e4",x"20",x"f6",x"de",x"fa",       -- ddbc |   shr [A*4 + -10], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"3e",x"72",x"f2", -- ddc3 |   jne [0x29e], 0x3e, ${fail}:rel + PC
    x"8a",x"3e",x"20",x"2a",x"f6",                   -- ddcc |   mul [A*4 + -10], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"be",x"3f",x"64",x"f2", -- ddd1 |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
    x"b2",x"21",x"3e",x"2a",x"f6",                   -- dddb |   or [A*2], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"03",x"55",x"f2", -- dde0 |   jne [0x154], 0x3ff, ${fail}:rel + PC
    x"8e",x"3e",x"21",x"1c",x"f6",x"85",             -- ddea |   imul [A*4 + -10], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"a4",x"5c",x"45",x"f2", -- ddf0 |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
    x"aa",x"e0",x"3e",x"21",x"39",x"30",x"f6",       -- ddfa |   shl [0x3039], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"e0",x"29",x"34",x"f2", -- de01 |   jne [0x3039], 0x29e0, ${fail}:rel + PC
    x"aa",x"21",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- de0b |   shl [A*2], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"88",x"22",x"f2", -- de13 |   jne [0x154], 0x8800, ${fail}:rel + PC
    x"82",x"fe",x"21",x"21",                         -- de1d |   add [G], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"a8",x"02",x"14",x"f2", -- de21 |   jne [0x155], 0x2a8, ${fail}:rel + PC
    x"ae",x"21",x"e4",x"fe",x"de",x"fa",             -- de2b |   and [A*2], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"01",x"04",x"f2", -- de31 |   jne [0x154], 0x100, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"e0",x"f6",x"39",x"30",x"39",x"30", -- de3b |   and [A*4 + -10], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"39",x"30",x"f1",x"f1", -- de44 |   jne [0x29e], 0x3039, ${fail}:rel + PC
    x"aa",x"3e",x"20",x"1c",x"f6",x"85",             -- de4e |   shl [A*4 + -10], A, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"40",x"15",x"e1",x"f1", -- de54 |   jne [0x29e], 0x1540, ${fail}:rel + PC
    x"ae",x"2a",x"3e",x"e4",x"f6",x"de",x"fa",       -- de5e |   and [A*4 + B], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"88",x"02",x"d0",x"f1", -- de65 |   jne [0x363], 0x288, ${fail}:rel + PC
    x"82",x"fe",x"1c",x"1c",x"85",x"85",             -- de6f |   add [G], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0a",x"ff",x"c0",x"f1", -- de75 |   jne [0x155], 0xff0a, ${fail}:rel + PC
    x"8a",x"20",x"20",x"e4",x"de",x"fa",             -- de7f |   mul [A], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"50",x"08",x"b0",x"f1", -- de85 |   jne [0xaa], 0x850, ${fail}:rel + PC
    x"b2",x"21",x"2a",x"fe",                         -- de8f |   or [A*2], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"77",x"03",x"a2",x"f1", -- de93 |   jne [0x154], 0x377, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- de9d |   sub [G], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"90",x"f1", -- dea5 |   jne [0x155], 0, ${fail}:rel + PC
    x"a2",x"2a",x"fe",x"e4",x"de",x"fa",             -- dead |   shr [A*4 + B], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"82",x"f1", -- deb3 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"86",x"21",x"1c",x"fe",x"85",                   -- debc |   sub [A*2], -123, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"30",x"fe",x"74",x"f1", -- dec1 |   jne [0x154], 0xfe30, ${fail}:rel + PC
    x"aa",x"3e",x"21",x"fe",x"f6",                   -- decb |   shl [A*4 + -10], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"80",x"2a",x"65",x"f1", -- ded0 |   jne [0x29e], 0x2a80, ${fail}:rel + PC
    x"aa",x"20",x"1c",x"3e",x"85",x"f6",             -- deda |   shl [A], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"40",x"55",x"f1", -- dee0 |   jne [0xaa], 0x4000, ${fail}:rel + PC
    x"8a",x"3e",x"2a",x"21",x"f6",                   -- deea |   mul [A*4 + -10], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"7c",x"7f",x"46",x"f1", -- deef |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
    x"a2",x"20",x"2a",x"fe",                         -- def9 |   shr [A], A*4 + B, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"1b",x"38",x"f1", -- defd |   jne [0xaa], 0x1b, ${fail}:rel + PC
    x"82",x"20",x"2a",x"e0",x"39",x"30",             -- df06 |   add [A], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9c",x"33",x"29",x"f1", -- df0c |   jne [0xaa], 0x339c, ${fail}:rel + PC
    x"b6",x"fe",x"e0",x"1c",x"39",x"30",x"85",       -- df16 |   xor [G], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"bc",x"cf",x"18",x"f1", -- df1d |   jne [0x155], 0xcfbc, ${fail}:rel + PC
    x"86",x"20",x"e4",x"2a",x"de",x"fa",             -- df27 |   sub [A], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"25",x"f8",x"08",x"f1", -- df2d |   jne [0xaa], 0xf825, ${fail}:rel + PC
    x"a6",x"2a",x"21",x"fe",                         -- df37 |   ishr [A*4 + B], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"0a",x"fa",x"f0", -- df3b |   jne [0x363], 0xa, ${fail}:rel + PC
    x"b2",x"21",x"fe",x"e4",x"de",x"fa",             -- df44 |   or [A*2], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"dd",x"fb",x"eb",x"f0", -- df4a |   jne [0x154], 0xfbdd, ${fail}:rel + PC
    x"8a",x"e0",x"e4",x"fe",x"39",x"30",x"de",x"fa", -- df54 |   mul [0x3039], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"28",x"0c",x"d9",x"f0", -- df5c |   jne [0x3039], 0xc28, ${fail}:rel + PC
    x"8e",x"2a",x"2a",x"e4",x"de",x"fa",             -- df66 |   imul [A*4 + B], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"98",x"dd",x"c9",x"f0", -- df6c |   jne [0x363], 0xdd98, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"fe",x"39",x"30",             -- df76 |   and [0x3039], A, G
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"b9",x"f0", -- df7c |   jne [0x3039], 0, ${fail}:rel + PC
    x"8e",x"fe",x"fe",x"2a",                         -- df84 |   imul [G], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"df",x"82",x"ad",x"f0", -- df88 |   jne [0x155], 0x82df, ${fail}:rel + PC
    x"8e",x"3e",x"21",x"21",x"f6",                   -- df92 |   imul [A*4 + -10], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"90",x"c3",x"9e",x"f0", -- df97 |   jne [0x29e], 0xc390, ${fail}:rel + PC
    x"b2",x"fe",x"e4",x"1c",x"de",x"fa",x"85",       -- dfa1 |   or [G], 0xfade + A, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"8d",x"8d",x"f0", -- dfa8 |   jne [0x155], 0x8d, ${fail}:rel + PC
    x"8e",x"2a",x"20",x"3e",x"f6",                   -- dfb1 |   imul [A*4 + B], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ec",x"bc",x"7f",x"f0", -- dfb6 |   jne [0x363], 0xbcec, ${fail}:rel + PC
    x"a2",x"2a",x"3e",x"e0",x"f6",x"39",x"30",       -- dfc0 |   shr [A*4 + B], A*4 + -10, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"6e",x"f0", -- dfc7 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"b6",x"2a",x"21",x"e0",x"39",x"30",             -- dfd0 |   xor [A*4 + B], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"6d",x"31",x"5f",x"f0", -- dfd6 |   jne [0x363], 0x316d, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"e0",x"39",x"30",x"f6",x"39",x"30", -- dfe0 |   shr [0x3039], A*4 + -10, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"01",x"4c",x"f0", -- dfe9 |   jne [0x3039], 0x1, ${fail}:rel + PC
    x"a2",x"21",x"1c",x"3e",x"85",x"f6",             -- dff2 |   shr [A*2], -123, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"03",x"3d",x"f0", -- dff8 |   jne [0x154], 0x3, ${fail}:rel + PC
    x"b2",x"21",x"20",x"21",                         -- e001 |   or [A*2], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"fe",x"01",x"30",x"f0", -- e005 |   jne [0x154], 0x1fe, ${fail}:rel + PC
    x"a2",x"fe",x"2a",x"21",                         -- e00f |   shr [G], A*4 + B, A*2
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"36",x"22",x"f0", -- e013 |   jne [0x155], 0x36, ${fail}:rel + PC
    x"b6",x"e0",x"3e",x"2a",x"39",x"30",x"f6",       -- e01c |   xor [0x3039], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"fd",x"01",x"12",x"f0", -- e023 |   jne [0x3039], 0x1fd, ${fail}:rel + PC
    x"8a",x"3e",x"e4",x"3e",x"f6",x"de",x"fa",x"f6", -- e02d |   mul [A*4 + -10], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"f0",x"4d",x"00",x"f0", -- e035 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
    x"8e",x"2a",x"21",x"3e",x"f6",                   -- e03f |   imul [A*4 + B], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d8",x"79",x"f1",x"ef", -- e044 |   jne [0x363], 0x79d8, ${fail}:rel + PC
    x"a2",x"e0",x"e4",x"3e",x"39",x"30",x"de",x"fa",x"f6", -- e04e |   shr [0x3039], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"03",x"de",x"ef", -- e057 |   jne [0x3039], 0x3, ${fail}:rel + PC
    x"82",x"3e",x"20",x"fe",x"f6",                   -- e060 |   add [A*4 + -10], A, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ff",x"01",x"d0",x"ef", -- e065 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- e06f |   shr [A*4 + B], 0xfade + A, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"7d",x"be",x"ef", -- e077 |   jne [0x363], 0x7d, ${fail}:rel + PC
    x"a2",x"3e",x"1c",x"1c",x"f6",x"85",x"85",       -- e080 |   shr [A*4 + -10], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"fc",x"07",x"ae",x"ef", -- e087 |   jne [0x29e], 0x7fc, ${fail}:rel + PC
    x"8e",x"20",x"1c",x"e0",x"85",x"39",x"30",       -- e091 |   imul [A], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9d",x"d4",x"9d",x"ef", -- e098 |   jne [0xaa], 0xd49d, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"21",x"f6",                   -- e0a2 |   shl [A*4 + B], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"e0",x"29",x"8e",x"ef", -- e0a7 |   jne [0x363], 0x29e0, ${fail}:rel + PC
    x"b6",x"21",x"e0",x"fe",x"39",x"30",             -- e0b1 |   xor [A*2], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"6c",x"31",x"7e",x"ef", -- e0b7 |   jne [0x154], 0x316c, ${fail}:rel + PC
    x"b6",x"e0",x"3e",x"3e",x"39",x"30",x"f6",x"f6", -- e0c1 |   xor [0x3039], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"6c",x"ef", -- e0c9 |   jne [0x3039], 0, ${fail}:rel + PC
    x"b6",x"20",x"21",x"1c",x"85",                   -- e0d1 |   xor [A], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d1",x"fe",x"5f",x"ef", -- e0d6 |   jne [0xaa], 0xfed1, ${fail}:rel + PC
    x"b6",x"21",x"21",x"fe",                         -- e0e0 |   xor [A*2], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"01",x"51",x"ef", -- e0e4 |   jne [0x154], 0x1, ${fail}:rel + PC
    x"8a",x"fe",x"e0",x"20",x"39",x"30",             -- e0ed |   mul [G], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"da",x"05",x"42",x"ef", -- e0f3 |   jne [0x155], 0x5da, ${fail}:rel + PC
    x"b6",x"21",x"e0",x"21",x"39",x"30",             -- e0fd |   xor [A*2], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"6d",x"31",x"32",x"ef", -- e103 |   jne [0x154], 0x316d, ${fail}:rel + PC
    x"8a",x"21",x"2a",x"e0",x"39",x"30",             -- e10d |   mul [A*2], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"0b",x"51",x"22",x"ef", -- e113 |   jne [0x154], 0x510b, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"1c",x"f6",x"39",x"30",x"85", -- e11d |   and [A*4 + -10], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"01",x"30",x"10",x"ef", -- e125 |   jne [0x29e], 0x3001, ${fail}:rel + PC
    x"aa",x"fe",x"21",x"20",                         -- e12f |   shl [G], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"50",x"02",x"ef", -- e133 |   jne [0x155], 0x5000, ${fail}:rel + PC
    x"ae",x"20",x"e4",x"20",x"de",x"fa",             -- e13d |   and [A], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"88",x"00",x"f2",x"ee", -- e143 |   jne [0xaa], 0x88, ${fail}:rel + PC
    x"aa",x"21",x"3e",x"e4",x"f6",x"de",x"fa",       -- e14d |   shl [A*2], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"9e",x"e1",x"ee", -- e154 |   jne [0x154], 0x9e00, ${fail}:rel + PC
    x"b6",x"e0",x"e0",x"1c",x"39",x"30",x"39",x"30",x"85", -- e15e |   xor [0x3039], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"bc",x"cf",x"ce",x"ee", -- e167 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
    x"8a",x"3e",x"3e",x"1c",x"f6",x"f6",x"85",       -- e171 |   mul [A*4 + -10], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"16",x"be",x"bd",x"ee", -- e178 |   jne [0x29e], 0xbe16, ${fail}:rel + PC
    x"86",x"fe",x"21",x"3e",x"f6",                   -- e182 |   sub [G], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"b6",x"fe",x"ae",x"ee", -- e187 |   jne [0x155], 0xfeb6, ${fail}:rel + PC
    x"86",x"3e",x"2a",x"fe",x"f6",                   -- e191 |   sub [A*4 + -10], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"0e",x"02",x"9f",x"ee", -- e196 |   jne [0x29e], 0x20e, ${fail}:rel + PC
    x"b6",x"3e",x"1c",x"fe",x"f6",x"85",             -- e1a0 |   xor [A*4 + -10], -123, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"d0",x"fe",x"8f",x"ee", -- e1a6 |   jne [0x29e], 0xfed0, ${fail}:rel + PC
    x"86",x"20",x"2a",x"1c",x"85",                   -- e1b0 |   sub [A], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"de",x"03",x"80",x"ee", -- e1b5 |   jne [0xaa], 0x3de, ${fail}:rel + PC
    x"86",x"20",x"21",x"fe",                         -- e1bf |   sub [A], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"ff",x"72",x"ee", -- e1c3 |   jne [0xaa], 0xff, ${fail}:rel + PC
    x"86",x"2a",x"20",x"e4",x"de",x"fa",             -- e1cc |   sub [A*4 + B], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"22",x"05",x"63",x"ee", -- e1d2 |   jne [0x363], 0x522, ${fail}:rel + PC
    x"aa",x"e0",x"fe",x"3e",x"39",x"30",x"f6",       -- e1dc |   shl [0x3039], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"40",x"52",x"ee", -- e1e3 |   jne [0x3039], 0x4000, ${fail}:rel + PC
    x"ae",x"20",x"1c",x"1c",x"85",x"85",             -- e1ed |   and [A], -123, -123
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"85",x"42",x"ee", -- e1f3 |   jne [0xaa], 0x85, ${fail}:rel + PC
    x"b6",x"20",x"fe",x"e0",x"39",x"30",             -- e1fc |   xor [A], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"6c",x"31",x"33",x"ee", -- e202 |   jne [0xaa], 0x316c, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"3e",x"39",x"30",x"f6",       -- e20c |   or [0x3039], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"de",x"03",x"22",x"ee", -- e213 |   jne [0x3039], 0x3de, ${fail}:rel + PC
    x"b2",x"20",x"e4",x"21",x"de",x"fa",             -- e21d |   or [A], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"fb",x"12",x"ee", -- e223 |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
    x"b6",x"fe",x"3e",x"3e",x"f6",x"f6",             -- e22d |   xor [G], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"02",x"ee", -- e233 |   jne [0x155], 0, ${fail}:rel + PC
    x"b6",x"3e",x"20",x"e4",x"f6",x"de",x"fa",       -- e23b |   xor [A*4 + -10], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"22",x"fb",x"f3",x"ed", -- e242 |   jne [0x29e], 0xfb22, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"e0",x"39",x"30",x"85",x"39",x"30", -- e24c |   xor [0x3039], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"bc",x"cf",x"e0",x"ed", -- e255 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
    x"a2",x"3e",x"fe",x"2a",x"f6",                   -- e25f |   shr [A*4 + -10], G, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"2a",x"d1",x"ed", -- e264 |   jne [0x29e], 0x2a, ${fail}:rel + PC
    x"ae",x"20",x"fe",x"20",                         -- e26d |   and [A], G, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"c4",x"ed", -- e271 |   jne [0xaa], 0, ${fail}:rel + PC
    x"86",x"2a",x"e4",x"1c",x"de",x"fa",x"85",       -- e279 |   sub [A*4 + B], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"03",x"fc",x"b5",x"ed", -- e280 |   jne [0x363], 0xfc03, ${fail}:rel + PC
    x"ae",x"e0",x"21",x"21",x"39",x"30",             -- e28a |   and [0x3039], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"a5",x"ed", -- e290 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"a2",x"e0",x"20",x"e0",x"39",x"30",x"39",x"30", -- e29a |   shr [0x3039], A, 0x3039
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"93",x"ed", -- e2a2 |   jne [0x3039], 0, ${fail}:rel + PC
    x"8e",x"3e",x"2a",x"3e",x"f6",x"f6",             -- e2aa |   imul [A*4 + -10], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"1a",x"dd",x"85",x"ed", -- e2b0 |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"1c",x"39",x"30",x"f6",x"85", -- e2ba |   shr [0x3039], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"14",x"73",x"ed", -- e2c2 |   jne [0x3039], 0x14, ${fail}:rel + PC
    x"82",x"fe",x"20",x"e0",x"39",x"30",             -- e2cb |   add [G], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"e3",x"30",x"64",x"ed", -- e2d1 |   jne [0x155], 0x30e3, ${fail}:rel + PC
    x"a6",x"e0",x"21",x"e0",x"39",x"30",x"39",x"30", -- e2db |   ishr [0x3039], A*2, 0x3039
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"52",x"ed", -- e2e3 |   jne [0x3039], 0, ${fail}:rel + PC
    x"a6",x"e0",x"e4",x"1c",x"39",x"30",x"de",x"fa",x"85", -- e2eb |   ishr [0x3039], 0xfade + A, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"dc",x"41",x"ed", -- e2f4 |   jne [0x3039], 0xdc, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"20",x"f6",                   -- e2fd |   or [A*4 + -10], G, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ff",x"01",x"33",x"ed", -- e302 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
    x"a6",x"2a",x"2a",x"20",                         -- e30c |   ishr [A*4 + B], A*4 + B, A
    x"ee",x"e0",x"00",x"f8",x"63",x"03",x"25",x"ed", -- e310 |   jne [0x363], 0, ${fail}:rel + PC
    x"aa",x"fe",x"e0",x"2a",x"39",x"30",             -- e318 |   shl [G], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"c8",x"81",x"17",x"ed", -- e31e |   jne [0x155], 0x81c8, ${fail}:rel + PC
    x"8a",x"21",x"3e",x"20",x"f6",                   -- e328 |   mul [A*2], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ec",x"bc",x"08",x"ed", -- e32d |   jne [0x154], 0xbcec, ${fail}:rel + PC
    x"8e",x"3e",x"3e",x"e0",x"f6",x"f6",x"39",x"30", -- e337 |   imul [A*4 + -10], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"2e",x"35",x"f6",x"ec", -- e33f |   jne [0x29e], 0x352e, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"3e",x"39",x"30",x"85",x"f6", -- e349 |   xor [0x3039], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"1b",x"fd",x"e4",x"ec", -- e351 |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"e4",x"de",x"fa",             -- e35b |   or [G], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"fb",x"d4",x"ec", -- e361 |   jne [0x155], 0xfbaa, ${fail}:rel + PC
    x"8e",x"fe",x"fe",x"3e",x"f6",                   -- e36b |   imul [G], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"76",x"7c",x"c5",x"ec", -- e370 |   jne [0x155], 0x7c76, ${fail}:rel + PC
    x"8a",x"20",x"e0",x"3e",x"39",x"30",x"f6",       -- e37a |   mul [A], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"2e",x"35",x"b4",x"ec", -- e381 |   jne [0xaa], 0x352e, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"20",                         -- e38b |   or [G], A, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"00",x"a6",x"ec", -- e38f |   jne [0x155], 0xaa, ${fail}:rel + PC
    x"a2",x"3e",x"21",x"e4",x"f6",x"de",x"fa",       -- e399 |   shr [A*4 + -10], A*2, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"01",x"95",x"ec", -- e3a0 |   jne [0x29e], 0x1, ${fail}:rel + PC
    x"a6",x"20",x"3e",x"2a",x"f6",                   -- e3a9 |   ishr [A], A*4 + -10, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"53",x"87",x"ec", -- e3ae |   jne [0xaa], 0x53, ${fail}:rel + PC
    x"82",x"20",x"e0",x"20",x"39",x"30",             -- e3b7 |   add [A], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"e3",x"30",x"78",x"ec", -- e3bd |   jne [0xaa], 0x30e3, ${fail}:rel + PC
    x"a6",x"20",x"1c",x"20",x"85",                   -- e3c7 |   ishr [A], -123, A
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"ff",x"69",x"ec", -- e3cc |   jne [0xaa], 0xff, ${fail}:rel + PC
    x"ae",x"21",x"20",x"1c",x"85",                   -- e3d5 |   and [A*2], A, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"80",x"00",x"5b",x"ec", -- e3da |   jne [0x154], 0x80, ${fail}:rel + PC
    x"b6",x"2a",x"1c",x"e4",x"85",x"de",x"fa",       -- e3e4 |   xor [A*4 + B], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"0d",x"04",x"4a",x"ec", -- e3eb |   jne [0x363], 0x40d, ${fail}:rel + PC
    x"82",x"20",x"e0",x"21",x"39",x"30",             -- e3f5 |   add [A], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"8d",x"31",x"3a",x"ec", -- e3fb |   jne [0xaa], 0x318d, ${fail}:rel + PC
    x"82",x"21",x"fe",x"2a",                         -- e405 |   add [A*2], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b8",x"04",x"2c",x"ec", -- e409 |   jne [0x154], 0x4b8, ${fail}:rel + PC
    x"b2",x"20",x"2a",x"20",                         -- e413 |   or [A], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"eb",x"03",x"1e",x"ec", -- e417 |   jne [0xaa], 0x3eb, ${fail}:rel + PC
    x"82",x"21",x"1c",x"e0",x"85",x"39",x"30",       -- e421 |   add [A*2], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"be",x"2f",x"0d",x"ec", -- e428 |   jne [0x154], 0x2fbe, ${fail}:rel + PC
    x"aa",x"fe",x"2a",x"1c",x"85",                   -- e432 |   shl [G], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"60",x"6c",x"fe",x"eb", -- e437 |   jne [0x155], 0x6c60, ${fail}:rel + PC
    x"82",x"3e",x"3e",x"2a",x"f6",x"f6",             -- e441 |   add [A*4 + -10], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"01",x"06",x"ee",x"eb", -- e447 |   jne [0x29e], 0x601, ${fail}:rel + PC
    x"b2",x"20",x"3e",x"e4",x"f6",x"de",x"fa",       -- e451 |   or [A], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9e",x"fb",x"dd",x"eb", -- e458 |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
    x"aa",x"2a",x"21",x"1c",x"85",                   -- e462 |   shl [A*4 + B], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"80",x"2a",x"ce",x"eb", -- e467 |   jne [0x363], 0x2a80, ${fail}:rel + PC
    x"b2",x"e0",x"1c",x"2a",x"39",x"30",x"85",       -- e471 |   or [0x3039], -123, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"e7",x"bd",x"eb", -- e478 |   jne [0x3039], 0xe7, ${fail}:rel + PC
    x"82",x"21",x"2a",x"2a",                         -- e481 |   add [A*2], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"c6",x"06",x"b0",x"eb", -- e485 |   jne [0x154], 0x6c6, ${fail}:rel + PC
    x"ae",x"20",x"21",x"20",                         -- e48f |   and [A], A*2, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"a2",x"eb", -- e493 |   jne [0xaa], 0, ${fail}:rel + PC
    x"86",x"20",x"fe",x"1c",x"85",                   -- e49b |   sub [A], G, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d0",x"01",x"95",x"eb", -- e4a0 |   jne [0xaa], 0x1d0, ${fail}:rel + PC
    x"b2",x"20",x"2a",x"3e",x"f6",                   -- e4aa |   or [A], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ff",x"03",x"86",x"eb", -- e4af |   jne [0xaa], 0x3ff, ${fail}:rel + PC
    x"b6",x"2a",x"20",x"2a",                         -- e4b9 |   xor [A*4 + B], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"c9",x"03",x"78",x"eb", -- e4bd |   jne [0x363], 0x3c9, ${fail}:rel + PC
    x"aa",x"21",x"fe",x"3e",x"f6",                   -- e4c7 |   shl [A*2], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"40",x"69",x"eb", -- e4cc |   jne [0x154], 0x4000, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"21",x"f6",x"39",x"30",       -- e4d6 |   and [A*4 + -10], 0x3039, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"10",x"58",x"eb", -- e4dd |   jne [0x29e], 0x10, ${fail}:rel + PC
    x"a2",x"e0",x"2a",x"e4",x"39",x"30",x"de",x"fa", -- e4e6 |   shr [0x3039], A*4 + B, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"03",x"47",x"eb", -- e4ee |   jne [0x3039], 0x3, ${fail}:rel + PC
    x"8a",x"fe",x"21",x"2a",                         -- e4f7 |   mul [G], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"7c",x"7f",x"3a",x"eb", -- e4fb |   jne [0x155], 0x7f7c, ${fail}:rel + PC
    x"a2",x"3e",x"3e",x"fe",x"f6",x"f6",             -- e505 |   shr [A*4 + -10], A*4 + -10, G
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"14",x"2a",x"eb", -- e50b |   jne [0x29e], 0x14, ${fail}:rel + PC
    x"8a",x"20",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- e514 |   mul [A], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"48",x"81",x"19",x"eb", -- e51c |   jne [0xaa], 0x8148, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"3e",x"85",x"f6",             -- e526 |   mul [A*4 + B], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"16",x"be",x"09",x"eb", -- e52c |   jne [0x363], 0xbe16, ${fail}:rel + PC
    x"ae",x"2a",x"1c",x"fe",x"85",                   -- e536 |   and [A*4 + B], -123, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"05",x"01",x"fa",x"ea", -- e53b |   jne [0x363], 0x105, ${fail}:rel + PC
    x"aa",x"e0",x"e0",x"20",x"39",x"30",x"39",x"30", -- e545 |   shl [0x3039], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"e4",x"e8",x"ea", -- e54d |   jne [0x3039], 0xe400, ${fail}:rel + PC
    x"8e",x"20",x"fe",x"2a",                         -- e557 |   imul [A], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"df",x"82",x"da",x"ea", -- e55b |   jne [0xaa], 0x82df, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"3e",x"f6",x"85",x"f6",       -- e565 |   sub [A*4 + -10], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e7",x"fc",x"c9",x"ea", -- e56c |   jne [0x29e], 0xfce7, ${fail}:rel + PC
    x"aa",x"21",x"20",x"2a",                         -- e576 |   shl [A*2], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"50",x"05",x"bb",x"ea", -- e57a |   jne [0x154], 0x550, ${fail}:rel + PC
    x"82",x"20",x"3e",x"21",x"f6",                   -- e584 |   add [A], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"f2",x"03",x"ac",x"ea", -- e589 |   jne [0xaa], 0x3f2, ${fail}:rel + PC
    x"8a",x"21",x"fe",x"1c",x"85",                   -- e593 |   mul [A*2], G, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"29",x"5c",x"9d",x"ea", -- e598 |   jne [0x154], 0x5c29, ${fail}:rel + PC
    x"8a",x"fe",x"1c",x"e0",x"85",x"39",x"30",       -- e5a2 |   mul [G], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"9d",x"d4",x"8c",x"ea", -- e5a9 |   jne [0x155], 0xd49d, ${fail}:rel + PC
    x"a6",x"e0",x"2a",x"2a",x"39",x"30",             -- e5b3 |   ishr [0x3039], A*4 + B, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"6c",x"7c",x"ea", -- e5b9 |   jne [0x3039], 0x6c, ${fail}:rel + PC
    x"82",x"2a",x"1c",x"21",x"85",                   -- e5c2 |   add [A*4 + B], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d9",x"00",x"6e",x"ea", -- e5c7 |   jne [0x363], 0xd9, ${fail}:rel + PC
    x"8a",x"e0",x"e0",x"fe",x"39",x"30",x"39",x"30", -- e5d1 |   mul [0x3039], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"ed",x"3b",x"5c",x"ea", -- e5d9 |   jne [0x3039], 0x3bed, ${fail}:rel + PC
    x"b2",x"e0",x"2a",x"fe",x"39",x"30",             -- e5e3 |   or [0x3039], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"77",x"03",x"4c",x"ea", -- e5e9 |   jne [0x3039], 0x377, ${fail}:rel + PC
    x"aa",x"2a",x"1c",x"e0",x"85",x"39",x"30",       -- e5f3 |   shl [A*4 + B], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"0a",x"3b",x"ea", -- e5fa |   jne [0x363], 0xa00, ${fail}:rel + PC
    x"8a",x"fe",x"1c",x"2a",x"85",                   -- e604 |   mul [G], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"6f",x"5f",x"2c",x"ea", -- e609 |   jne [0x155], 0x5f6f, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"fe",x"f6",x"39",x"30",       -- e613 |   and [A*4 + -10], 0x3039, G
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"11",x"1b",x"ea", -- e61a |   jne [0x29e], 0x11, ${fail}:rel + PC
    x"a6",x"2a",x"21",x"e4",x"de",x"fa",             -- e623 |   ishr [A*4 + B], A*2, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"0c",x"ea", -- e629 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"b2",x"21",x"21",x"2a",                         -- e632 |   or [A*2], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"77",x"03",x"ff",x"e9", -- e636 |   jne [0x154], 0x377, ${fail}:rel + PC
    x"ae",x"2a",x"fe",x"fe",                         -- e640 |   and [A*4 + B], G, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"55",x"01",x"f1",x"e9", -- e644 |   jne [0x363], 0x155, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"3e",x"f6",x"f6",             -- e64e |   shl [A*4 + B], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"80",x"e1",x"e9", -- e654 |   jne [0x363], 0x8000, ${fail}:rel + PC
    x"86",x"3e",x"2a",x"1c",x"f6",x"85",             -- e65e |   sub [A*4 + -10], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"de",x"03",x"d1",x"e9", -- e664 |   jne [0x29e], 0x3de, ${fail}:rel + PC
    x"ae",x"fe",x"fe",x"1c",x"85",                   -- e66e |   and [G], G, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"05",x"01",x"c2",x"e9", -- e673 |   jne [0x155], 0x105, ${fail}:rel + PC
    x"a6",x"21",x"3e",x"1c",x"f6",x"85",             -- e67d |   ishr [A*2], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"14",x"b2",x"e9", -- e683 |   jne [0x154], 0x14, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"fe",x"39",x"30",             -- e68c |   or [0x3039], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"55",x"01",x"a3",x"e9", -- e692 |   jne [0x3039], 0x155, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"21",                         -- e69c |   or [A*4 + B], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"fe",x"01",x"95",x"e9", -- e6a0 |   jne [0x363], 0x1fe, ${fail}:rel + PC
    x"a2",x"21",x"20",x"e0",x"39",x"30",             -- e6aa |   shr [A*2], A, 0x3039
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"85",x"e9", -- e6b0 |   jne [0x154], 0, ${fail}:rel + PC
    x"8e",x"3e",x"3e",x"e4",x"f6",x"f6",x"de",x"fa", -- e6b8 |   imul [A*4 + -10], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"f0",x"4d",x"75",x"e9", -- e6c0 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
    x"a2",x"2a",x"3e",x"fe",x"f6",                   -- e6ca |   shr [A*4 + B], A*4 + -10, G
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"14",x"66",x"e9", -- e6cf |   jne [0x363], 0x14, ${fail}:rel + PC
    x"aa",x"e0",x"2a",x"1c",x"39",x"30",x"85",       -- e6d8 |   shl [0x3039], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"60",x"6c",x"56",x"e9", -- e6df |   jne [0x3039], 0x6c60, ${fail}:rel + PC
    x"86",x"e0",x"3e",x"20",x"39",x"30",x"f6",       -- e6e9 |   sub [0x3039], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"f4",x"01",x"45",x"e9", -- e6f0 |   jne [0x3039], 0x1f4, ${fail}:rel + PC
    x"86",x"fe",x"3e",x"fe",x"f6",                   -- e6fa |   sub [G], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"49",x"01",x"36",x"e9", -- e6ff |   jne [0x155], 0x149, ${fail}:rel + PC
    x"b6",x"20",x"20",x"2a",                         -- e709 |   xor [A], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"c9",x"03",x"28",x"e9", -- e70d |   jne [0xaa], 0x3c9, ${fail}:rel + PC
    x"a2",x"20",x"21",x"21",                         -- e717 |   shr [A], A*2, A*2
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"15",x"1a",x"e9", -- e71b |   jne [0xaa], 0x15, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"21",x"39",x"30",             -- e724 |   add [A*4 + B], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"8d",x"31",x"0b",x"e9", -- e72a |   jne [0x363], 0x318d, ${fail}:rel + PC
    x"82",x"fe",x"2a",x"2a",                         -- e734 |   add [G], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"c6",x"06",x"fd",x"e8", -- e738 |   jne [0x155], 0x6c6, ${fail}:rel + PC
    x"aa",x"2a",x"2a",x"3e",x"f6",                   -- e742 |   shl [A*4 + B], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"c0",x"ee",x"e8", -- e747 |   jne [0x363], 0xc000, ${fail}:rel + PC
    x"b6",x"3e",x"2a",x"20",x"f6",                   -- e751 |   xor [A*4 + -10], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"c9",x"03",x"df",x"e8", -- e756 |   jne [0x29e], 0x3c9, ${fail}:rel + PC
    x"8a",x"20",x"e4",x"1c",x"de",x"fa",x"85",       -- e760 |   mul [A], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a8",x"25",x"ce",x"e8", -- e767 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"e4",x"f6",x"39",x"30",x"de",x"fa", -- e771 |   and [A*4 + -10], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"08",x"30",x"bb",x"e8", -- e77a |   jne [0x29e], 0x3008, ${fail}:rel + PC
    x"82",x"20",x"fe",x"21",                         -- e784 |   add [A], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a9",x"02",x"ad",x"e8", -- e788 |   jne [0xaa], 0x2a9, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"fe",x"de",x"fa",             -- e792 |   sub [G], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"33",x"fa",x"9d",x"e8", -- e798 |   jne [0x155], 0xfa33, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"e4",x"39",x"30",x"f6",x"de",x"fa", -- e7a2 |   shr [0x3039], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"02",x"8a",x"e8", -- e7ab |   jne [0x3039], 0x2, ${fail}:rel + PC
    x"a2",x"3e",x"21",x"2a",x"f6",                   -- e7b4 |   shr [A*4 + -10], A*2, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"2a",x"7c",x"e8", -- e7b9 |   jne [0x29e], 0x2a, ${fail}:rel + PC
    x"a2",x"fe",x"20",x"2a",                         -- e7c2 |   shr [G], A, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"15",x"6f",x"e8", -- e7c6 |   jne [0x155], 0x15, ${fail}:rel + PC
    x"8e",x"2a",x"fe",x"21",                         -- e7cf |   imul [A*4 + B], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"e4",x"c4",x"62",x"e8", -- e7d3 |   jne [0x363], 0xc4e4, ${fail}:rel + PC
    x"8a",x"3e",x"e4",x"e4",x"f6",x"de",x"fa",x"de",x"fa", -- e7dd |   mul [A*4 + -10], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"40",x"f8",x"4f",x"e8", -- e7e6 |   jne [0x29e], 0xf840, ${fail}:rel + PC
    x"82",x"3e",x"2a",x"e0",x"f6",x"39",x"30",       -- e7f0 |   add [A*4 + -10], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"9c",x"33",x"3e",x"e8", -- e7f7 |   jne [0x29e], 0x339c, ${fail}:rel + PC
    x"b6",x"2a",x"fe",x"3e",x"f6",                   -- e801 |   xor [A*4 + B], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"cb",x"03",x"2f",x"e8", -- e806 |   jne [0x363], 0x3cb, ${fail}:rel + PC
    x"b6",x"21",x"e4",x"20",x"de",x"fa",             -- e810 |   xor [A*2], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"22",x"fb",x"1f",x"e8", -- e816 |   jne [0x154], 0xfb22, ${fail}:rel + PC
    x"a2",x"e0",x"e0",x"21",x"39",x"30",x"39",x"30", -- e820 |   shr [0x3039], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"03",x"03",x"0d",x"e8", -- e828 |   jne [0x3039], 0x303, ${fail}:rel + PC
    x"8e",x"2a",x"fe",x"e0",x"39",x"30",             -- e832 |   imul [A*4 + B], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ed",x"3b",x"fd",x"e7", -- e838 |   jne [0x363], 0x3bed, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"21",x"39",x"30",x"85",       -- e842 |   xor [0x3039], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d1",x"fe",x"ec",x"e7", -- e849 |   jne [0x3039], 0xfed1, ${fail}:rel + PC
    x"86",x"e0",x"fe",x"e4",x"39",x"30",x"de",x"fa", -- e853 |   sub [0x3039], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"cd",x"05",x"da",x"e7", -- e85b |   jne [0x3039], 0x5cd, ${fail}:rel + PC
    x"b6",x"20",x"21",x"e4",x"de",x"fa",             -- e865 |   xor [A], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"fa",x"ca",x"e7", -- e86b |   jne [0xaa], 0xfadc, ${fail}:rel + PC
    x"8a",x"21",x"3e",x"e0",x"f6",x"39",x"30",       -- e875 |   mul [A*2], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"2e",x"35",x"b9",x"e7", -- e87c |   jne [0x154], 0x352e, ${fail}:rel + PC
    x"aa",x"2a",x"21",x"20",                         -- e886 |   shl [A*4 + B], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"50",x"ab",x"e7", -- e88a |   jne [0x363], 0x5000, ${fail}:rel + PC
    x"ae",x"fe",x"1c",x"e4",x"85",x"de",x"fa",       -- e894 |   and [G], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"80",x"fb",x"9a",x"e7", -- e89b |   jne [0x155], 0xfb80, ${fail}:rel + PC
    x"a2",x"20",x"20",x"21",                         -- e8a5 |   shr [A], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"0a",x"8c",x"e7", -- e8a9 |   jne [0xaa], 0xa, ${fail}:rel + PC
    x"b6",x"3e",x"20",x"3e",x"f6",x"f6",             -- e8b2 |   xor [A*4 + -10], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"34",x"02",x"7d",x"e7", -- e8b8 |   jne [0x29e], 0x234, ${fail}:rel + PC
    x"aa",x"3e",x"3e",x"21",x"f6",x"f6",             -- e8c2 |   shl [A*4 + -10], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e0",x"29",x"6d",x"e7", -- e8c8 |   jne [0x29e], 0x29e0, ${fail}:rel + PC
    x"8a",x"20",x"3e",x"1c",x"f6",x"85",             -- e8d2 |   mul [A], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"16",x"be",x"5d",x"e7", -- e8d8 |   jne [0xaa], 0xbe16, ${fail}:rel + PC
    x"b2",x"fe",x"fe",x"e0",x"39",x"30",             -- e8e2 |   or [G], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"7d",x"31",x"4d",x"e7", -- e8e8 |   jne [0x155], 0x317d, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"3e",x"de",x"fa",x"f6",       -- e8f2 |   shr [A*4 + B], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"03",x"3c",x"e7", -- e8f9 |   jne [0x363], 0x3, ${fail}:rel + PC
    x"8a",x"2a",x"20",x"e0",x"39",x"30",             -- e902 |   mul [A*4 + B], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"da",x"05",x"2d",x"e7", -- e908 |   jne [0x363], 0x5da, ${fail}:rel + PC
    x"ae",x"3e",x"21",x"e0",x"f6",x"39",x"30",       -- e912 |   and [A*4 + -10], A*2, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"10",x"1c",x"e7", -- e919 |   jne [0x29e], 0x10, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"2a",x"39",x"30",             -- e922 |   and [0x3039], A, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"22",x"0d",x"e7", -- e928 |   jne [0x3039], 0x22, ${fail}:rel + PC
    x"8e",x"fe",x"2a",x"fe",                         -- e931 |   imul [G], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"df",x"82",x"00",x"e7", -- e935 |   jne [0x155], 0x82df, ${fail}:rel + PC
    x"86",x"e0",x"fe",x"2a",x"39",x"30",             -- e93f |   sub [0x3039], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"f2",x"fd",x"f0",x"e6", -- e945 |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
    x"a2",x"2a",x"fe",x"2a",                         -- e94f |   shr [A*4 + B], G, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"2a",x"e2",x"e6", -- e953 |   jne [0x363], 0x2a, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"fe",x"f6",                   -- e95c |   or [A*4 + -10], G, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"55",x"01",x"d4",x"e6", -- e961 |   jne [0x29e], 0x155, ${fail}:rel + PC
    x"b6",x"21",x"20",x"fe",                         -- e96b |   xor [A*2], A, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"01",x"c6",x"e6", -- e96f |   jne [0x154], 0x1ff, ${fail}:rel + PC
    x"a2",x"fe",x"3e",x"1c",x"f6",x"85",             -- e979 |   shr [G], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"14",x"b6",x"e6", -- e97f |   jne [0x155], 0x14, ${fail}:rel + PC
    x"a6",x"e0",x"fe",x"20",x"39",x"30",             -- e988 |   ishr [0x3039], G, A
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"a7",x"e6", -- e98e |   jne [0x3039], 0, ${fail}:rel + PC
    x"8a",x"21",x"1c",x"e4",x"85",x"de",x"fa",       -- e996 |   mul [A*2], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a8",x"25",x"98",x"e6", -- e99d |   jne [0x154], 0x25a8, ${fail}:rel + PC
    x"b2",x"21",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- e9a7 |   or [A*2], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b9",x"fb",x"86",x"e6", -- e9af |   jne [0x154], 0xfbb9, ${fail}:rel + PC
    x"8e",x"2a",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- e9b9 |   imul [A*4 + B], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"48",x"81",x"74",x"e6", -- e9c1 |   jne [0x363], 0x8148, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"1c",x"f6",x"85",             -- e9cb |   or [A*4 + -10], G, -123
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"d5",x"64",x"e6", -- e9d1 |   jne [0x29e], 0xd5, ${fail}:rel + PC
    x"a6",x"3e",x"21",x"20",x"f6",                   -- e9da |   ishr [A*4 + -10], A*2, A
    x"ee",x"e0",x"00",x"f8",x"9e",x"02",x"56",x"e6", -- e9df |   jne [0x29e], 0, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"1c",x"85",                   -- e9e7 |   and [A*2], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"01",x"03",x"49",x"e6", -- e9ec |   jne [0x154], 0x301, ${fail}:rel + PC
    x"b2",x"20",x"21",x"3e",x"f6",                   -- e9f6 |   or [A], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"de",x"03",x"3a",x"e6", -- e9fb |   jne [0xaa], 0x3de, ${fail}:rel + PC
    x"82",x"fe",x"3e",x"20",x"f6",                   -- ea05 |   add [G], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"48",x"03",x"2b",x"e6", -- ea0a |   jne [0x155], 0x348, ${fail}:rel + PC
    x"aa",x"3e",x"20",x"e0",x"f6",x"39",x"30",       -- ea14 |   shl [A*4 + -10], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"54",x"1a",x"e6", -- ea1b |   jne [0x29e], 0x5400, ${fail}:rel + PC
    x"aa",x"20",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- ea25 |   shl [A], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"88",x"08",x"e6", -- ea2d |   jne [0xaa], 0x8800, ${fail}:rel + PC
    x"8e",x"fe",x"3e",x"e0",x"f6",x"39",x"30",       -- ea37 |   imul [G], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"2e",x"35",x"f7",x"e5", -- ea3e |   jne [0x155], 0x352e, ${fail}:rel + PC
    x"82",x"e0",x"1c",x"1c",x"39",x"30",x"85",x"85", -- ea48 |   add [0x3039], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"0a",x"ff",x"e5",x"e5", -- ea50 |   jne [0x3039], 0xff0a, ${fail}:rel + PC
    x"86",x"21",x"3e",x"fe",x"f6",                   -- ea5a |   sub [A*2], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"49",x"01",x"d6",x"e5", -- ea5f |   jne [0x154], 0x149, ${fail}:rel + PC
    x"a6",x"20",x"e4",x"fe",x"de",x"fa",             -- ea69 |   ishr [A], 0xfade + A, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"dc",x"c6",x"e5", -- ea6f |   jne [0xaa], 0xdc, ${fail}:rel + PC
    x"b6",x"20",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- ea78 |   xor [A], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"b1",x"cb",x"b5",x"e5", -- ea80 |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
    x"86",x"fe",x"21",x"e4",x"de",x"fa",             -- ea8a |   sub [G], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"cc",x"05",x"a5",x"e5", -- ea90 |   jne [0x155], 0x5cc, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"e0",x"39",x"30",x"39",x"30", -- ea9a |   add [A*4 + B], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"72",x"60",x"93",x"e5", -- eaa2 |   jne [0x363], 0x6072, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"e4",x"f6",x"85",x"de",x"fa", -- eaac |   sub [A*4 + -10], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"fd",x"03",x"81",x"e5", -- eab4 |   jne [0x29e], 0x3fd, ${fail}:rel + PC
    x"82",x"21",x"21",x"3e",x"f6",                   -- eabe |   add [A*2], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"f2",x"03",x"72",x"e5", -- eac3 |   jne [0x154], 0x3f2, ${fail}:rel + PC
    x"a2",x"20",x"e0",x"1c",x"39",x"30",x"85",       -- eacd |   shr [A], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"81",x"01",x"61",x"e5", -- ead4 |   jne [0xaa], 0x181, ${fail}:rel + PC
    x"8e",x"21",x"20",x"3e",x"f6",                   -- eade |   imul [A*2], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ec",x"bc",x"52",x"e5", -- eae3 |   jne [0x154], 0xbcec, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"e4",x"f6",x"de",x"fa",       -- eaed |   or [A*4 + -10], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"dd",x"fb",x"41",x"e5", -- eaf4 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
    x"a6",x"fe",x"20",x"1c",x"85",                   -- eafe |   ishr [G], A, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"05",x"32",x"e5", -- eb03 |   jne [0x155], 0x5, ${fail}:rel + PC
    x"a6",x"21",x"20",x"e4",x"de",x"fa",             -- eb0c |   ishr [A*2], A, 0xfade + A
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"23",x"e5", -- eb12 |   jne [0x154], 0, ${fail}:rel + PC
    x"a2",x"e0",x"1c",x"20",x"39",x"30",x"85",       -- eb1a |   shr [0x3039], -123, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"3f",x"14",x"e5", -- eb21 |   jne [0x3039], 0x3f, ${fail}:rel + PC
    x"8e",x"20",x"20",x"3e",x"f6",                   -- eb2a |   imul [A], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ec",x"bc",x"06",x"e5", -- eb2f |   jne [0xaa], 0xbcec, ${fail}:rel + PC
    x"82",x"2a",x"e4",x"fe",x"de",x"fa",             -- eb39 |   add [A*4 + B], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"dd",x"fc",x"f6",x"e4", -- eb3f |   jne [0x363], 0xfcdd, ${fail}:rel + PC
    x"b6",x"fe",x"e0",x"3e",x"39",x"30",x"f6",       -- eb49 |   xor [G], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"a7",x"32",x"e5",x"e4", -- eb50 |   jne [0x155], 0x32a7, ${fail}:rel + PC
    x"8e",x"20",x"e0",x"2a",x"39",x"30",             -- eb5a |   imul [A], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"0b",x"51",x"d5",x"e4", -- eb60 |   jne [0xaa], 0x510b, ${fail}:rel + PC
    x"b2",x"3e",x"e4",x"fe",x"f6",x"de",x"fa",       -- eb6a |   or [A*4 + -10], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"dd",x"fb",x"c4",x"e4", -- eb71 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
    x"86",x"21",x"1c",x"21",x"85",                   -- eb7b |   sub [A*2], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"31",x"fe",x"b5",x"e4", -- eb80 |   jne [0x154], 0xfe31, ${fail}:rel + PC
    x"b2",x"2a",x"21",x"21",                         -- eb8a |   or [A*4 + B], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"54",x"01",x"a7",x"e4", -- eb8e |   jne [0x363], 0x154, ${fail}:rel + PC
    x"8e",x"e0",x"20",x"3e",x"39",x"30",x"f6",       -- eb98 |   imul [0x3039], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"ec",x"bc",x"96",x"e4", -- eb9f |   jne [0x3039], 0xbcec, ${fail}:rel + PC
    x"a6",x"3e",x"e4",x"2a",x"f6",x"de",x"fa",       -- eba9 |   ishr [A*4 + -10], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"71",x"ff",x"85",x"e4", -- ebb0 |   jne [0x29e], 0xff71, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"e4",x"39",x"30",x"de",x"fa", -- ebba |   and [0x3039], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"88",x"00",x"73",x"e4", -- ebc2 |   jne [0x3039], 0x88, ${fail}:rel + PC
    x"a6",x"20",x"fe",x"fe",                         -- ebcc |   ishr [A], G, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"0a",x"65",x"e4", -- ebd0 |   jne [0xaa], 0xa, ${fail}:rel + PC
    x"8e",x"20",x"3e",x"20",x"f6",                   -- ebd9 |   imul [A], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ec",x"bc",x"57",x"e4", -- ebde |   jne [0xaa], 0xbcec, ${fail}:rel + PC
    x"b2",x"e0",x"3e",x"fe",x"39",x"30",x"f6",       -- ebe8 |   or [0x3039], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"df",x"03",x"46",x"e4", -- ebef |   jne [0x3039], 0x3df, ${fail}:rel + PC
    x"82",x"21",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- ebf9 |   add [A*2], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"c1",x"2b",x"34",x"e4", -- ec01 |   jne [0x154], 0x2bc1, ${fail}:rel + PC
    x"82",x"e0",x"1c",x"e4",x"39",x"30",x"85",x"de",x"fa", -- ec0b |   add [0x3039], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"0d",x"fb",x"21",x"e4", -- ec14 |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"21",                         -- ec1e |   or [G], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"fe",x"01",x"13",x"e4", -- ec22 |   jne [0x155], 0x1fe, ${fail}:rel + PC
    x"aa",x"21",x"2a",x"21",                         -- ec2c |   shl [A*2], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"30",x"36",x"05",x"e4", -- ec30 |   jne [0x154], 0x3630, ${fail}:rel + PC
    x"82",x"e0",x"2a",x"e0",x"39",x"30",x"39",x"30", -- ec3a |   add [0x3039], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"9c",x"33",x"f3",x"e3", -- ec42 |   jne [0x3039], 0x339c, ${fail}:rel + PC
    x"ae",x"2a",x"20",x"1c",x"85",                   -- ec4c |   and [A*4 + B], A, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"80",x"00",x"e4",x"e3", -- ec51 |   jne [0x363], 0x80, ${fail}:rel + PC
    x"b6",x"e0",x"20",x"1c",x"39",x"30",x"85",       -- ec5b |   xor [0x3039], A, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"2f",x"ff",x"d3",x"e3", -- ec62 |   jne [0x3039], 0xff2f, ${fail}:rel + PC
    x"ae",x"21",x"fe",x"e0",x"39",x"30",             -- ec6c |   and [A*2], G, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"11",x"c3",x"e3", -- ec72 |   jne [0x154], 0x11, ${fail}:rel + PC
    x"ae",x"3e",x"fe",x"3e",x"f6",x"f6",             -- ec7b |   and [A*4 + -10], G, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"14",x"b4",x"e3", -- ec81 |   jne [0x29e], 0x14, ${fail}:rel + PC
    x"8a",x"3e",x"2a",x"2a",x"f6",                   -- ec8a |   mul [A*4 + -10], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"49",x"78",x"a6",x"e3", -- ec8f |   jne [0x29e], 0x7849, ${fail}:rel + PC
    x"82",x"20",x"3e",x"e0",x"f6",x"39",x"30",       -- ec99 |   add [A], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d7",x"32",x"95",x"e3", -- eca0 |   jne [0xaa], 0x32d7, ${fail}:rel + PC
    x"82",x"21",x"e0",x"3e",x"39",x"30",x"f6",       -- ecaa |   add [A*2], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"d7",x"32",x"84",x"e3", -- ecb1 |   jne [0x154], 0x32d7, ${fail}:rel + PC
    x"b6",x"21",x"3e",x"3e",x"f6",x"f6",             -- ecbb |   xor [A*2], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"74",x"e3", -- ecc1 |   jne [0x154], 0, ${fail}:rel + PC
    x"a6",x"e0",x"20",x"20",x"39",x"30",             -- ecc9 |   ishr [0x3039], A, A
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"66",x"e3", -- eccf |   jne [0x3039], 0, ${fail}:rel + PC
    x"a6",x"e0",x"e0",x"3e",x"39",x"30",x"39",x"30",x"f6", -- ecd7 |   ishr [0x3039], 0x3039, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"55",x"e3", -- ece0 |   jne [0x3039], 0, ${fail}:rel + PC
    x"aa",x"20",x"1c",x"21",x"85",                   -- ece8 |   shl [A], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"50",x"f8",x"48",x"e3", -- eced |   jne [0xaa], 0xf850, ${fail}:rel + PC
    x"ae",x"e0",x"21",x"e4",x"39",x"30",x"de",x"fa", -- ecf7 |   and [0x3039], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"01",x"36",x"e3", -- ecff |   jne [0x3039], 0x100, ${fail}:rel + PC
    x"b2",x"3e",x"1c",x"20",x"f6",x"85",             -- ed09 |   or [A*4 + -10], -123, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"af",x"26",x"e3", -- ed0f |   jne [0x29e], 0xaf, ${fail}:rel + PC
    x"8e",x"21",x"1c",x"20",x"85",                   -- ed18 |   imul [A*2], -123, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"52",x"ae",x"18",x"e3", -- ed1d |   jne [0x154], 0xae52, ${fail}:rel + PC
    x"8a",x"2a",x"2a",x"2a",                         -- ed27 |   mul [A*4 + B], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"49",x"78",x"0a",x"e3", -- ed2b |   jne [0x363], 0x7849, ${fail}:rel + PC
    x"86",x"2a",x"2a",x"e0",x"39",x"30",             -- ed35 |   sub [A*4 + B], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"2a",x"d3",x"fa",x"e2", -- ed3b |   jne [0x363], 0xd32a, ${fail}:rel + PC
    x"ae",x"fe",x"1c",x"21",x"85",                   -- ed45 |   and [G], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"04",x"01",x"eb",x"e2", -- ed4a |   jne [0x155], 0x104, ${fail}:rel + PC
    x"8e",x"21",x"e4",x"1c",x"de",x"fa",x"85",       -- ed54 |   imul [A*2], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a8",x"25",x"da",x"e2", -- ed5b |   jne [0x154], 0x25a8, ${fail}:rel + PC
    x"8a",x"21",x"21",x"e4",x"de",x"fa",             -- ed65 |   mul [A*2], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a0",x"10",x"ca",x"e2", -- ed6b |   jne [0x154], 0x10a0, ${fail}:rel + PC
    x"86",x"fe",x"e0",x"fe",x"39",x"30",             -- ed75 |   sub [G], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"e4",x"2e",x"ba",x"e2", -- ed7b |   jne [0x155], 0x2ee4, ${fail}:rel + PC
    x"62",x"20",x"1c",x"85",                         -- ed85 |   mov [A], -123
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"85",x"ac",x"e2", -- ed89 |   jne [0xaa], 0x85, ${fail}:rel + PC
    x"62",x"3e",x"3e",x"f6",x"f6",                   -- ed92 |   mov [A*4 + -10], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"9e",x"02",x"9e",x"e2", -- ed97 |   jne [0x29e], 0x29e, ${fail}:rel + PC
    x"62",x"21",x"2a",                               -- eda1 |   mov [A*2], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"63",x"03",x"91",x"e2", -- eda4 |   jne [0x154], 0x363, ${fail}:rel + PC
    x"62",x"e0",x"1c",x"39",x"30",x"85",             -- edae |   mov [0x3039], -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"85",x"81",x"e2", -- edb4 |   jne [0x3039], 0x85, ${fail}:rel + PC
    x"62",x"fe",x"3e",x"f6",                         -- edbd |   mov [G], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"9e",x"02",x"74",x"e2", -- edc1 |   jne [0x155], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"fe",x"39",x"30",                   -- edcb |   mov [0x3039], G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"55",x"01",x"65",x"e2", -- edd0 |   jne [0x3039], 0x155, ${fail}:rel + PC
    x"62",x"fe",x"21",                               -- edda |   mov [G], A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"54",x"01",x"58",x"e2", -- eddd |   jne [0x155], 0x154, ${fail}:rel + PC
    x"62",x"3e",x"e4",x"f6",x"de",x"fa",             -- ede7 |   mov [A*4 + -10], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"88",x"fb",x"48",x"e2", -- eded |   jne [0x29e], 0xfb88, ${fail}:rel + PC
    x"62",x"e0",x"e0",x"39",x"30",x"39",x"30",       -- edf7 |   mov [0x3039], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"39",x"30",x"37",x"e2", -- edfe |   jne [0x3039], 0x3039, ${fail}:rel + PC
    x"62",x"3e",x"fe",x"f6",                         -- ee08 |   mov [A*4 + -10], G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"55",x"01",x"29",x"e2", -- ee0c |   jne [0x29e], 0x155, ${fail}:rel + PC
    x"62",x"20",x"fe",                               -- ee16 |   mov [A], G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"55",x"01",x"1c",x"e2", -- ee19 |   jne [0xaa], 0x155, ${fail}:rel + PC
    x"62",x"2a",x"2a",                               -- ee23 |   mov [A*4 + B], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"63",x"03",x"0f",x"e2", -- ee26 |   jne [0x363], 0x363, ${fail}:rel + PC
    x"62",x"3e",x"2a",x"f6",                         -- ee30 |   mov [A*4 + -10], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"63",x"03",x"01",x"e2", -- ee34 |   jne [0x29e], 0x363, ${fail}:rel + PC
    x"62",x"2a",x"20",                               -- ee3e |   mov [A*4 + B], A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"aa",x"00",x"f4",x"e1", -- ee41 |   jne [0x363], 0xaa, ${fail}:rel + PC
    x"62",x"3e",x"20",x"f6",                         -- ee4b |   mov [A*4 + -10], A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"aa",x"00",x"e6",x"e1", -- ee4f |   jne [0x29e], 0xaa, ${fail}:rel + PC
    x"62",x"20",x"20",                               -- ee59 |   mov [A], A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"aa",x"00",x"d9",x"e1", -- ee5c |   jne [0xaa], 0xaa, ${fail}:rel + PC
    x"62",x"2a",x"e4",x"de",x"fa",                   -- ee66 |   mov [A*4 + B], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"88",x"fb",x"ca",x"e1", -- ee6b |   jne [0x363], 0xfb88, ${fail}:rel + PC
    x"62",x"21",x"1c",x"85",                         -- ee75 |   mov [A*2], -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"85",x"bc",x"e1", -- ee79 |   jne [0x154], 0x85, ${fail}:rel + PC
    x"62",x"2a",x"e0",x"39",x"30",                   -- ee82 |   mov [A*4 + B], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"39",x"30",x"ae",x"e1", -- ee87 |   jne [0x363], 0x3039, ${fail}:rel + PC
    x"62",x"3e",x"1c",x"f6",x"85",                   -- ee91 |   mov [A*4 + -10], -123
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"85",x"9f",x"e1", -- ee96 |   jne [0x29e], 0x85, ${fail}:rel + PC
    x"62",x"3e",x"21",x"f6",                         -- ee9f |   mov [A*4 + -10], A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"54",x"01",x"92",x"e1", -- eea3 |   jne [0x29e], 0x154, ${fail}:rel + PC
    x"62",x"21",x"3e",x"f6",                         -- eead |   mov [A*2], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"9e",x"02",x"84",x"e1", -- eeb1 |   jne [0x154], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"21",x"39",x"30",                   -- eebb |   mov [0x3039], A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"75",x"e1", -- eec0 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"62",x"21",x"fe",                               -- eeca |   mov [A*2], G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"55",x"01",x"68",x"e1", -- eecd |   jne [0x154], 0x155, ${fail}:rel + PC
    x"62",x"2a",x"fe",                               -- eed7 |   mov [A*4 + B], G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"55",x"01",x"5b",x"e1", -- eeda |   jne [0x363], 0x155, ${fail}:rel + PC
    x"62",x"21",x"e4",x"de",x"fa",                   -- eee4 |   mov [A*2], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"88",x"fb",x"4c",x"e1", -- eee9 |   jne [0x154], 0xfb88, ${fail}:rel + PC
    x"62",x"20",x"3e",x"f6",                         -- eef3 |   mov [A], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9e",x"02",x"3e",x"e1", -- eef7 |   jne [0xaa], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"3e",x"39",x"30",x"f6",             -- ef01 |   mov [0x3039], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"9e",x"02",x"2e",x"e1", -- ef07 |   jne [0x3039], 0x29e, ${fail}:rel + PC
    x"62",x"2a",x"3e",x"f6",                         -- ef11 |   mov [A*4 + B], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"9e",x"02",x"20",x"e1", -- ef15 |   jne [0x363], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"e4",x"39",x"30",x"de",x"fa",       -- ef1f |   mov [0x3039], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"88",x"fb",x"0f",x"e1", -- ef26 |   jne [0x3039], 0xfb88, ${fail}:rel + PC
    x"62",x"21",x"e0",x"39",x"30",                   -- ef30 |   mov [A*2], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"39",x"30",x"00",x"e1", -- ef35 |   jne [0x154], 0x3039, ${fail}:rel + PC
    x"62",x"fe",x"1c",x"85",                         -- ef3f |   mov [G], -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"85",x"f2",x"e0", -- ef43 |   jne [0x155], 0x85, ${fail}:rel + PC
    x"62",x"e0",x"2a",x"39",x"30",                   -- ef4c |   mov [0x3039], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"63",x"03",x"e4",x"e0", -- ef51 |   jne [0x3039], 0x363, ${fail}:rel + PC
    x"62",x"fe",x"e4",x"de",x"fa",                   -- ef5b |   mov [G], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"88",x"fb",x"d5",x"e0", -- ef60 |   jne [0x155], 0xfb88, ${fail}:rel + PC
    x"62",x"20",x"e0",x"39",x"30",                   -- ef6a |   mov [A], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"39",x"30",x"c6",x"e0", -- ef6f |   jne [0xaa], 0x3039, ${fail}:rel + PC
    x"62",x"20",x"21",                               -- ef79 |   mov [A], A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"54",x"01",x"b9",x"e0", -- ef7c |   jne [0xaa], 0x154, ${fail}:rel + PC
    x"62",x"3e",x"e0",x"f6",x"39",x"30",             -- ef86 |   mov [A*4 + -10], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"39",x"30",x"a9",x"e0", -- ef8c |   jne [0x29e], 0x3039, ${fail}:rel + PC
    x"62",x"fe",x"20",                               -- ef96 |   mov [G], A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"00",x"9c",x"e0", -- ef99 |   jne [0x155], 0xaa, ${fail}:rel + PC
    x"62",x"21",x"20",                               -- efa3 |   mov [A*2], A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"00",x"8f",x"e0", -- efa6 |   jne [0x154], 0xaa, ${fail}:rel + PC
    x"62",x"fe",x"fe",                               -- efb0 |   mov [G], G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"55",x"01",x"82",x"e0", -- efb3 |   jne [0x155], 0x155, ${fail}:rel + PC
    x"62",x"20",x"2a",                               -- efbd |   mov [A], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"63",x"03",x"75",x"e0", -- efc0 |   jne [0xaa], 0x363, ${fail}:rel + PC
    x"62",x"2a",x"1c",x"85",                         -- efca |   mov [A*4 + B], -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"85",x"67",x"e0", -- efce |   jne [0x363], 0x85, ${fail}:rel + PC
    x"62",x"2a",x"21",                               -- efd7 |   mov [A*4 + B], A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"54",x"01",x"5b",x"e0", -- efda |   jne [0x363], 0x154, ${fail}:rel + PC
    x"62",x"e0",x"20",x"39",x"30",                   -- efe4 |   mov [0x3039], A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"00",x"4c",x"e0", -- efe9 |   jne [0x3039], 0xaa, ${fail}:rel + PC
    x"62",x"fe",x"e0",x"39",x"30",                   -- eff3 |   mov [G], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"39",x"30",x"3d",x"e0", -- eff8 |   jne [0x155], 0x3039, ${fail}:rel + PC
    x"62",x"21",x"21",                               -- f002 |   mov [A*2], A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"54",x"01",x"30",x"e0", -- f005 |   jne [0x154], 0x154, ${fail}:rel + PC
    x"62",x"fe",x"2a",                               -- f00f |   mov [G], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"63",x"03",x"23",x"e0", -- f012 |   jne [0x155], 0x363, ${fail}:rel + PC
    x"62",x"20",x"e4",x"de",x"fa",                   -- f01c |   mov [A], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"88",x"fb",x"14",x"e0", -- f021 |   jne [0xaa], 0xfb88, ${fail}:rel + PC
    x"e0",x"2a",                                     -- f02b |   push A*4 + B
    x"e4",x"80",                                     -- f02d |   pop D
    x"ec",x"80",x"e0",x"f8",x"63",x"03",x"06",x"e0", -- f02f |   jne D, 0x363, ${fail}:rel + PC
    x"e0",x"1c",x"85",                               -- f037 |   push -123
    x"e4",x"80",                                     -- f03a |   pop D
    x"ec",x"80",x"1c",x"f8",x"85",x"f9",x"df",       -- f03c |   jne D, 0x85, ${fail}:rel + PC
    x"e0",x"fe",                                     -- f043 |   push G
    x"e4",x"80",                                     -- f045 |   pop D
    x"ec",x"80",x"e0",x"f8",x"55",x"01",x"ee",x"df", -- f047 |   jne D, 0x155, ${fail}:rel + PC
    x"e0",x"3e",x"f6",                               -- f04f |   push A*4 + -10
    x"e4",x"80",                                     -- f052 |   pop D
    x"ec",x"80",x"e0",x"f8",x"9e",x"02",x"e1",x"df", -- f054 |   jne D, 0x29e, ${fail}:rel + PC
    x"e0",x"20",                                     -- f05c |   push A
    x"e4",x"80",                                     -- f05e |   pop D
    x"ec",x"80",x"e0",x"f8",x"aa",x"00",x"d5",x"df", -- f060 |   jne D, 0xaa, ${fail}:rel + PC
    x"e0",x"e4",x"de",x"fa",                         -- f068 |   push 0xfade + A
    x"e4",x"80",                                     -- f06c |   pop D
    x"ec",x"80",x"e0",x"f8",x"88",x"fb",x"c7",x"df", -- f06e |   jne D, 0xfb88, ${fail}:rel + PC
    x"e0",x"21",                                     -- f076 |   push A*2
    x"e4",x"80",                                     -- f078 |   pop D
    x"ec",x"80",x"e0",x"f8",x"54",x"01",x"bb",x"df", -- f07a |   jne D, 0x154, ${fail}:rel + PC
    x"e0",x"e0",x"39",x"30",                         -- f082 |   push 0x3039
    x"e4",x"80",                                     -- f086 |   pop D
    x"ec",x"80",x"e0",x"f8",x"39",x"30",x"ad",x"df", -- f088 |   jne D, 0x3039, ${fail}:rel + PC
    x"5c",x"f8",x"10",x"00",                         -- f090 |   call ${_L_test_uop_get_arg_1}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"fe",x"ad",x"a1",x"df", -- f094 |   jne C, 0xadfe, ${fail}:rel + PC
    x"58",x"f8",x"0e",x"00",                         -- f09c |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                                                     --      | _L_test_uop_get_arg_1:
    x"60",x"60",x"e0",x"fe",x"ad",                   -- f0a0 |   mov C, 0xadfe
    x"dc",                                           -- f0a5 |   ret
    x"58",x"f8",x"8f",x"df",                         -- f0a6 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_get_arg_2:
                                                     --      | test_uop_alu_2dd:
    x"60",x"20",x"e0",x"cd",x"ab",                   -- f0aa |   mov A, 0xabcd
    x"00",x"20",x"e0",x"ab",x"cd",                   -- f0af |   add A, 0xcdab
    x"ec",x"20",x"e0",x"f8",x"78",x"79",x"81",x"df", -- f0b4 |   jne A, 0x7978, ${fail}:rel + PC
                                                     --      | test_uop_alu_2di:
    x"60",x"20",x"e0",x"00",x"10",                   -- f0bc |   mov A, 0x1000
    x"62",x"e0",x"e0",x"00",x"10",x"bc",x"0a",       -- f0c1 |   mov [0x1000], 0xabc
    x"01",x"20",x"20",                               -- f0c8 |   add A, [A]
    x"ec",x"20",x"e0",x"f8",x"bc",x"1a",x"6a",x"df", -- f0cb |   jne A, 0x1abc, ${fail}:rel + PC
                                                     --      | test_uop_alu_2id:
    x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       -- f0d3 |   mov [0x1000], 0x1234
    x"02",x"e0",x"e0",x"00",x"10",x"21",x"43",       -- f0da |   add [0x1000], 0x4321
    x"61",x"20",x"e0",x"00",x"10",                   -- f0e1 |   mov A, [0x1000]
    x"ec",x"20",x"e0",x"f8",x"55",x"55",x"4f",x"df", -- f0e6 |   jne A, 0x5555, ${fail}:rel + PC
                                                     --      | test_uop_alu_2ii:
    x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       -- f0ee |   mov [0x1000], 0x1234
    x"62",x"e0",x"e0",x"05",x"10",x"aa",x"aa",       -- f0f5 |   mov [0x1005], 0xaaaa
    x"03",x"e0",x"e0",x"05",x"10",x"00",x"10",       -- f0fc |   add [0x1005], [0x1000]
    x"ee",x"e0",x"e0",x"f8",x"05",x"10",x"de",x"bc",x"32",x"df", -- f103 |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                                                     --      | test_uop_alu_3dd:
    x"60",x"20",x"e0",x"fe",x"ab",                   -- f10d |   mov A, 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f112 |   mov B, 0x5555
    x"80",x"60",x"20",x"40",                         -- f117 |   add C, A, B
    x"ec",x"20",x"e0",x"f8",x"fe",x"ab",x"1a",x"df", -- f11b |   jne A, 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"12",x"df", -- f123 |   jne B, 0x5555, ${fail}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"53",x"01",x"0a",x"df", -- f12b |   jne C, 0x153, ${fail}:rel + PC
                                                     --      | test_uop_alu_3di:
    x"62",x"e0",x"e0",x"00",x"10",x"aa",x"12",       -- f133 |   mov [0x1000], 0x12aa
    x"60",x"40",x"e0",x"de",x"fa",                   -- f13a |   mov B, 0xfade
    x"b5",x"20",x"e0",x"40",x"00",x"10",             -- f13f |   xor A, [0x1000], B
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"aa",x"12",x"f0",x"de", -- f145 |   jne [0x1000], 0x12aa, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"de",x"fa",x"e6",x"de", -- f14f |   jne B, 0xfade, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"74",x"e8",x"de",x"de", -- f157 |   jne A, 0xe874, ${fail}:rel + PC
                                                     --      | test_uop_alu_3id:
    x"60",x"20",x"e0",x"fe",x"ab",                   -- f15f |   mov A, 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f164 |   mov B, 0x5555
    x"86",x"e0",x"20",x"40",x"00",x"10",             -- f169 |   sub [0x1000], A, B
    x"ec",x"20",x"e0",x"f8",x"fe",x"ab",x"c6",x"de", -- f16f |   jne A, 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"be",x"de", -- f177 |   jne B, 0x5555, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"a9",x"56",x"b6",x"de", -- f17f |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                                                     --      | test_uop_alu_3ii:
    x"62",x"e0",x"e0",x"00",x"10",x"fe",x"ab",       -- f189 |   mov [0x1000], 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f190 |   mov B, 0x5555
    x"af",x"e0",x"e0",x"40",x"02",x"10",x"00",x"10", -- f195 |   and [0x1002], [0x1000], B
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"fe",x"ab",x"98",x"de", -- f19d |   jne [0x1000], 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"8e",x"de", -- f1a7 |   jne B, 0x5555, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"02",x"10",x"54",x"01",x"86",x"de", -- f1af |   jne [0x1002], 0x154, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_1dx:
    x"60",x"20",x"e0",x"00",x"ff",                   -- f1b9 |   mov A, 0xff00
    x"3c",x"20",                                     -- f1be |   not A
    x"ec",x"20",x"e0",x"f8",x"ff",x"00",x"75",x"de", -- f1c0 |   jne A, 0xff, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_1ix:
    x"62",x"1c",x"e0",x"64",x"34",x"12",             -- f1c8 |   mov [0x64], 0x1234
    x"3a",x"1c",x"64",                               -- f1ce |   neg [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"cc",x"ed",x"64",x"de", -- f1d1 |   jne [0x64], 0xedcc, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2dd:
    x"60",x"40",x"e0",x"ff",x"00",                   -- f1da |   mov B, 0xff
    x"bc",x"20",x"40",                               -- f1df |   not A, B
    x"ec",x"40",x"e0",x"f8",x"ff",x"00",x"53",x"de", -- f1e2 |   jne B, 0xff, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"00",x"ff",x"4b",x"de", -- f1ea |   jne A, 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2di:
    x"62",x"1c",x"e0",x"64",x"34",x"12",             -- f1f2 |   mov [0x64], 0x1234
    x"bd",x"20",x"1c",x"64",                         -- f1f8 |   not A, [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"34",x"12",x"39",x"de", -- f1fc |   jne [0x64], 0x1234, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"cb",x"ed",x"30",x"de", -- f205 |   jne A, 0xedcb, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2id:
    x"60",x"40",x"e0",x"ff",x"00",                   -- f20d |   mov B, 0xff
    x"be",x"1c",x"40",x"64",                         -- f212 |   not [0x64], B
    x"ec",x"40",x"e0",x"f8",x"ff",x"00",x"1f",x"de", -- f216 |   jne B, 0xff, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"00",x"ff",x"17",x"de", -- f21e |   jne [0x64], 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2ii:
    x"62",x"1c",x"e0",x"66",x"ff",x"00",             -- f227 |   mov [0x66], 0xff
    x"bf",x"1c",x"1c",x"64",x"66",                   -- f22d |   not [0x64], [0x66]
    x"ee",x"1c",x"e0",x"f8",x"66",x"ff",x"00",x"03",x"de", -- f232 |   jne [0x66], 0xff, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"00",x"ff",x"fa",x"dd", -- f23b |   jne [0x64], 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_cmp_dd:
    x"60",x"40",x"1c",x"7b",                         -- f244 |   mov B, 0x7b
    x"50",x"40",x"e0",x"c8",x"01",                   -- f248 |   cmp B, 0x1c8
    x"4c",x"20",                                     -- f24d |   getf A
    x"ec",x"40",x"1c",x"f8",x"7b",x"e6",x"dd",       -- f24f |   jne B, 0x7b, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"0e",x"df",x"dd",       -- f256 |   jne A, 0xe, ${fail}:rel + PC
                                                     --      | test_uop_cmp_di:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f25d |   mov [0x64], -123
    x"60",x"40",x"e0",x"c8",x"01",                   -- f262 |   mov B, 0x1c8
    x"d1",x"40",x"1c",x"64",                         -- f267 |   icmp B, [0x64]
    x"4c",x"20",                                     -- f26b |   getf A
    x"ec",x"40",x"e0",x"f8",x"c8",x"01",x"c8",x"dd", -- f26d |   jne B, 0x1c8, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"32",x"c0",x"dd",       -- f275 |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_cmp_id:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f27c |   mov [0x64], -123
    x"60",x"40",x"e0",x"c8",x"01",                   -- f281 |   mov B, 0x1c8
    x"d2",x"1c",x"40",x"64",                         -- f286 |   icmp [0x64], B
    x"4c",x"20",                                     -- f28a |   getf A
    x"ec",x"40",x"e0",x"f8",x"c8",x"01",x"a9",x"dd", -- f28c |   jne B, 0x1c8, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"0e",x"a1",x"dd",       -- f294 |   jne A, 0xe, ${fail}:rel + PC
                                                     --      | test_uop_cmp_ii:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f29b |   mov [0x64], -123
    x"62",x"1c",x"e0",x"66",x"38",x"fe",             -- f2a0 |   mov [0x66], 0xfe38
    x"d3",x"1c",x"1c",x"64",x"66",                   -- f2a6 |   icmp [0x64], [0x66]
    x"4c",x"20",                                     -- f2ab |   getf A
    x"ee",x"1c",x"1c",x"f8",x"64",x"85",x"88",x"dd", -- f2ad |   jne [0x64], -123, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"38",x"fe",x"80",x"dd", -- f2b5 |   jne [0x66], 0xfe38, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"32",x"77",x"dd",       -- f2be |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_jmp_d:
    x"60",x"20",x"e0",x"d0",x"f2",                   -- f2c5 |   mov A, ${_L_test_uop_jmp_d_okay}
    x"58",x"20",                                     -- f2ca |   jmp A
    x"58",x"f8",x"69",x"dd",                         -- f2cc |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_d_okay:
                                                     --      | test_uop_jmp_i:
    x"62",x"1c",x"e0",x"64",x"dd",x"f2",             -- f2d0 |   mov [0x64], ${_L_test_uop_jmp_i_okay}
    x"5a",x"1c",x"64",                               -- f2d6 |   jmp [0x64]
    x"58",x"f8",x"5c",x"dd",                         -- f2d9 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_i_okay:
    x"ee",x"1c",x"e0",x"f8",x"64",x"dd",x"f2",x"58",x"dd", -- f2dd |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_cond_i:
    x"62",x"1c",x"e0",x"64",x"fc",x"f2",             -- f2e6 |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
    x"50",x"1c",x"1c",x"01",x"02",                   -- f2ec |   cmp 0x1, 0x2
    x"68",x"f8",x"44",x"dd",                         -- f2f1 |   jeq ${fail}:rel + PC
    x"6e",x"1c",x"64",                               -- f2f5 |   jne [0x64]
    x"58",x"f8",x"3d",x"dd",                         -- f2f8 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_cond_i_okay:
    x"ee",x"1c",x"e0",x"f8",x"64",x"fc",x"f2",x"39",x"dd", -- f2fc |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_cond_d:
    x"60",x"20",x"e0",x"19",x"f3",                   -- f305 |   mov A, ${_L_test_uop_jmp_cond_d_okay}
    x"50",x"1c",x"1c",x"01",x"01",                   -- f30a |   cmp 0x1, 0x1
    x"6c",x"f8",x"26",x"dd",                         -- f30f |   jne ${fail}:rel + PC
    x"68",x"20",                                     -- f313 |   jeq A
    x"58",x"f8",x"20",x"dd",                         -- f315 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_cond_d_okay:
    x"ec",x"20",x"e0",x"f8",x"19",x"f3",x"1c",x"dd", -- f319 |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3dd:
    x"60",x"20",x"1c",x"7b",                         -- f321 |   mov A, 0x7b
    x"ec",x"20",x"1c",x"f8",x"7b",x"10",x"dd",       -- f325 |   jne A, 0x7b, ${fail}:rel + PC
    x"e8",x"20",x"1c",x"f8",x"7b",x"0b",x"00",       -- f32c |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
    x"58",x"f8",x"02",x"dd",                         -- f333 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3dd_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"fe",x"dc",       -- f337 |   jne A, 0x7b, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3di:
    x"60",x"20",x"1c",x"7b",                         -- f33e |   mov A, 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f342 |   mov [0x64], 0x141
    x"e9",x"20",x"1c",x"f8",x"64",x"ed",x"dc",       -- f348 |   jeq A, [0x64], ${fail}:rel + PC
    x"ed",x"20",x"1c",x"f8",x"64",x"0b",x"00",       -- f34f |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
    x"58",x"f8",x"df",x"dc",                         -- f356 |   jmp ${fail}:rel + PC
                                                     --      | test_uop_jmp_3di_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"db",x"dc",       -- f35a |   jne A, 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"d4",x"dc", -- f361 |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3id:
    x"60",x"20",x"1c",x"7b",                         -- f36a |   mov A, 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f36e |   mov [0x64], 0x141
    x"ea",x"1c",x"20",x"f8",x"64",x"c1",x"dc",       -- f374 |   jeq [0x64], A, ${fail}:rel + PC
    x"ee",x"1c",x"20",x"f8",x"64",x"0b",x"00",       -- f37b |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
    x"58",x"f8",x"b3",x"dc",                         -- f382 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3id_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"af",x"dc",       -- f386 |   jne A, 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"a8",x"dc", -- f38d |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3ii:
    x"62",x"e0",x"1c",x"c8",x"00",x"7b",             -- f396 |   mov [0xc8], 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f39c |   mov [0x64], 0x141
    x"eb",x"1c",x"e0",x"f8",x"64",x"c8",x"00",x"93",x"dc", -- f3a2 |   jeq [0x64], [0xc8], ${fail}:rel + PC
    x"ef",x"1c",x"e0",x"f8",x"64",x"c8",x"00",x"0d",x"00", -- f3ab |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
    x"58",x"f8",x"81",x"dc",                         -- f3b4 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3ii_okay:
    x"ee",x"e0",x"1c",x"f8",x"c8",x"00",x"7b",x"7d",x"dc", -- f3b8 |   jne [0xc8], 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"74",x"dc", -- f3c1 |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_mov_dd:
    x"60",x"20",x"1c",x"7b",                         -- f3ca |   mov A, 0x7b
    x"ec",x"20",x"1c",x"f8",x"7b",x"67",x"dc",       -- f3ce |   jne A, 0x7b, ${fail}:rel + PC
                                                     --      | test_uop_mov_di:
    x"62",x"1c",x"1c",x"64",x"da",                   -- f3d5 |   mov [0x64], 0xda
    x"61",x"20",x"1c",x"64",                         -- f3da |   mov A, [0x64]
    x"ec",x"20",x"1c",x"f8",x"da",x"57",x"dc",       -- f3de |   jne A, 0xda, ${fail}:rel + PC
                                                     --      | test_uop_mov_id:
    x"62",x"1c",x"1c",x"64",x"ff",                   -- f3e5 |   mov [0x64], 0xff
    x"ee",x"1c",x"1c",x"f8",x"64",x"ff",x"4b",x"dc", -- f3ea |   jne [0x64], 0xff, ${fail}:rel + PC
                                                     --      | test_uop_mov_ii:
    x"60",x"20",x"1c",x"14",                         -- f3f2 |   mov A, 0x14
    x"62",x"1c",x"e0",x"78",x"fa",x"fd",             -- f3f6 |   mov [0x78], 0xfdfa
    x"63",x"1c",x"3c",x"64",x"64",                   -- f3fc |   mov [0x64], [A + 0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"fa",x"fd",x"34",x"dc", -- f401 |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                                                     --      | test_uop_bmov_dd:
    x"64",x"20",x"e0",x"de",x"af",                   -- f40a |   bmov A, 0xafde
    x"ec",x"20",x"e0",x"f8",x"de",x"00",x"26",x"dc", -- f40f |   jne A, 0xde, ${fail}:rel + PC
    x"64",x"20",x"e0",x"fa",x"00",                   -- f417 |   bmov A, 0xfa
    x"ec",x"20",x"e0",x"f8",x"fa",x"00",x"19",x"dc", -- f41c |   jne A, 0xfa, ${fail}:rel + PC
                                                     --      | test_uop_bmov_di:
    x"62",x"1c",x"1c",x"64",x"da",                   -- f424 |   mov [0x64], 0xda
    x"65",x"20",x"1c",x"64",                         -- f429 |   bmov A, [0x64]
    x"ec",x"20",x"e0",x"f8",x"da",x"00",x"08",x"dc", -- f42d |   jne A, 0xda, ${fail}:rel + PC
                                                     --      | test_uop_bmov_id:
    x"62",x"1c",x"e0",x"64",x"cd",x"ab",             -- f435 |   mov [0x64], 0xabcd
    x"62",x"1c",x"e0",x"66",x"34",x"12",             -- f43b |   mov [0x66], 0x1234
    x"62",x"1c",x"e0",x"68",x"78",x"56",             -- f441 |   mov [0x68], 0x5678
    x"66",x"1c",x"e0",x"66",x"df",x"00",             -- f447 |   bmov [0x66], 0xdf
    x"ee",x"1c",x"e0",x"f8",x"64",x"cd",x"ab",x"e8",x"db", -- f44d |   jne [0x64], 0xabcd, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"df",x"12",x"df",x"db", -- f456 |   jne [0x66], 0x12df, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"68",x"78",x"56",x"d6",x"db", -- f45f |   jne [0x68], 0x5678, ${fail}:rel + PC
    x"66",x"1c",x"e0",x"67",x"b8",x"00",             -- f468 |   bmov [0x67], 0xb8
    x"ee",x"1c",x"e0",x"f8",x"64",x"cd",x"ab",x"c7",x"db", -- f46e |   jne [0x64], 0xabcd, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"df",x"b8",x"be",x"db", -- f477 |   jne [0x66], 0xb8df, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"68",x"78",x"56",x"b5",x"db", -- f480 |   jne [0x68], 0x5678, ${fail}:rel + PC
                                                     --      | test_uop_bmov_ii:
    x"62",x"e0",x"e0",x"2c",x"01",x"df",x"00",       -- f489 |   mov [0x12c], 0xdf
    x"62",x"e0",x"e0",x"2e",x"01",x"b8",x"00",       -- f490 |   mov [0x12e], 0xb8
    x"62",x"e0",x"e0",x"c8",x"00",x"cd",x"ab",       -- f497 |   mov [0xc8], 0xabcd
    x"62",x"e0",x"e0",x"ca",x"00",x"34",x"12",       -- f49e |   mov [0xca], 0x1234
    x"62",x"e0",x"e0",x"cc",x"00",x"78",x"56",       -- f4a5 |   mov [0xcc], 0x5678
    x"67",x"e0",x"e0",x"ca",x"00",x"2c",x"01",       -- f4ac |   bmov [0xca], [0x12c]
    x"ee",x"e0",x"e0",x"f8",x"c8",x"00",x"cd",x"ab",x"82",x"db", -- f4b3 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"ca",x"00",x"df",x"12",x"78",x"db", -- f4bd |   jne [0xca], 0x12df, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"cc",x"00",x"78",x"56",x"6e",x"db", -- f4c7 |   jne [0xcc], 0x5678, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2c",x"01",x"df",x"00",x"64",x"db", -- f4d1 |   jne [0x12c], 0xdf, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2e",x"01",x"b8",x"00",x"5a",x"db", -- f4db |   jne [0x12e], 0xb8, ${fail}:rel + PC
    x"67",x"e0",x"e0",x"cb",x"00",x"2e",x"01",       -- f4e5 |   bmov [0xcb], [0x12e]
    x"ee",x"e0",x"e0",x"f8",x"c8",x"00",x"cd",x"ab",x"49",x"db", -- f4ec |   jne [0xc8], 0xabcd, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"ca",x"00",x"df",x"b8",x"3f",x"db", -- f4f6 |   jne [0xca], 0xb8df, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"cc",x"00",x"78",x"56",x"35",x"db", -- f500 |   jne [0xcc], 0x5678, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2c",x"01",x"df",x"00",x"2b",x"db", -- f50a |   jne [0x12c], 0xdf, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2e",x"01",x"b8",x"00",x"21",x"db", -- f514 |   jne [0x12e], 0xb8, ${fail}:rel + PC
                                                     --      | test_uop_halt:
                                                     --      | test_uop_getf:
    x"50",x"1c",x"1c",x"7b",x"2d",                   -- f51e |   cmp 0x7b, 0x2d
    x"4c",x"20",                                     -- f523 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"10",x"db",       -- f525 |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_setf:
    x"cc",x"1c",x"ff",                               -- f52c |   setf 0xff
    x"4c",x"20",                                     -- f52f |   getf A
    x"ec",x"20",x"1c",x"f8",x"3f",x"04",x"db",       -- f531 |   jne A, 0x3f, ${fail}:rel + PC
                                                     --      | test_uop_call_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f538 |   mov SP, 0x1000
    x"60",x"40",x"e0",x"58",x"f5",                   -- f53d |   mov B, ${_L_test_uop_call_d_fn}
    x"5c",x"40",                                     -- f542 |   call B
    x"ec",x"40",x"e0",x"f8",x"58",x"f5",x"f1",x"da", -- f544 |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"fa",x"34",x"e9",x"da", -- f54c |   jne A, 0x34fa, ${fail}:rel + PC
    x"58",x"f8",x"0a",x"00",                         -- f554 |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                                                     --      | _L_test_uop_call_d_fn:
    x"60",x"20",x"e0",x"fa",x"34",                   -- f558 |   mov A, 0x34fa
    x"dc",                                           -- f55d |   ret
                                                     --      | _L_test_uop_call_d_okay:
                                                     --      | test_uop_call_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f55e |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- f563 |   mov B, 0x64
    x"62",x"40",x"e0",x"82",x"f5",                   -- f567 |   mov [B], ${_L_test_uop_call_i_fn}
    x"5e",x"40",                                     -- f56c |   call [B]
    x"ee",x"40",x"e0",x"f8",x"82",x"f5",x"c7",x"da", -- f56e |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"d4",x"aa",x"bf",x"da", -- f576 |   jne A, 0xaad4, ${fail}:rel + PC
    x"58",x"f8",x"0a",x"00",                         -- f57e |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                                                     --      | _L_test_uop_call_i_fn:
    x"60",x"20",x"e0",x"d4",x"aa",                   -- f582 |   mov A, 0xaad4
    x"dc",                                           -- f587 |   ret
                                                     --      | _L_test_uop_call_i_okay:
                                                     --      | test_uop_ret:
                                                     --      | test_uop_push_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f588 |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- f58d |   mov B, 0x64
    x"e0",x"40",                                     -- f591 |   push B
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"a2",x"da", -- f593 |   jne SP, 0xffe, ${fail}:rel + PC
    x"ee",x"e0",x"1c",x"f8",x"fe",x"0f",x"64",x"9a",x"da", -- f59b |   jne [0xffe], 0x64, ${fail}:rel + PC
    x"e4",x"60",                                     -- f5a4 |   pop C
    x"ec",x"60",x"1c",x"f8",x"64",x"8f",x"da",       -- f5a6 |   jne C, 0x64, ${fail}:rel + PC
                                                     --      | test_uop_push_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f5ad |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- f5b2 |   mov B, 0x64
    x"62",x"40",x"e0",x"90",x"01",                   -- f5b6 |   mov [B], 0x190
    x"e2",x"40",                                     -- f5bb |   push [B]
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"78",x"da", -- f5bd |   jne SP, 0xffe, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fe",x"0f",x"90",x"01",x"70",x"da", -- f5c5 |   jne [0xffe], 0x190, ${fail}:rel + PC
    x"e4",x"60",                                     -- f5cf |   pop C
    x"ec",x"60",x"e0",x"f8",x"90",x"01",x"64",x"da", -- f5d1 |   jne C, 0x190, ${fail}:rel + PC
                                                     --      | test_uop_pop_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f5d9 |   mov SP, 0x1000
    x"e0",x"e0",x"da",x"fa",                         -- f5de |   push 0xfada
    x"e4",x"20",                                     -- f5e2 |   pop A
    x"ec",x"20",x"e0",x"f8",x"da",x"fa",x"51",x"da", -- f5e4 |   jne A, 0xfada, ${fail}:rel + PC
                                                     --      | test_uop_pop_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f5ec |   mov SP, 0x1000
    x"e0",x"e0",x"da",x"f2",                         -- f5f1 |   push 0xf2da
    x"e6",x"1c",x"64",                               -- f5f5 |   pop [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"da",x"f2",x"3d",x"da", -- f5f8 |   jne [0x64], 0xf2da, ${fail}:rel + PC
                                                     --      | test_uop_mmap:
    x"62",x"e0",x"e0",x"00",x"30",x"00",x"ff",       -- f601 |   mov [0x3000], 0xff00
    x"62",x"e0",x"e0",x"00",x"31",x"01",x"ff",       -- f608 |   mov [0x3100], 0xff01
    x"62",x"e0",x"e0",x"00",x"32",x"02",x"ff",       -- f60f |   mov [0x3200], 0xff02
    x"62",x"e0",x"e0",x"00",x"40",x"00",x"dd",       -- f616 |   mov [0x4000], 0xdd00
    x"62",x"e0",x"e0",x"00",x"41",x"01",x"dd",       -- f61d |   mov [0x4100], 0xdd01
    x"62",x"e0",x"e0",x"00",x"42",x"02",x"dd",       -- f624 |   mov [0x4200], 0xdd02
    x"62",x"e0",x"e0",x"00",x"50",x"00",x"ee",       -- f62b |   mov [0x5000], 0xee00
    x"62",x"e0",x"e0",x"00",x"51",x"01",x"ee",       -- f632 |   mov [0x5100], 0xee01
    x"62",x"e0",x"e0",x"00",x"52",x"02",x"ee",       -- f639 |   mov [0x5200], 0xee02
    x"60",x"20",x"00",                               -- f640 |   mov A, 0
    x"60",x"40",x"e0",x"00",x"41",                   -- f643 |   mov B, 0x4100
    x"54",x"e0",x"e0",x"1c",x"00",x"31",x"ff",x"32",x"01", -- f648 |   mmap 0x3100, 0x32ff, 0x1
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"dd",x"e4",x"d9", -- f651 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"02",x"dd",x"da",x"d9", -- f65b |   jne [0x3200], 0xdd02, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"d0",x"d9", -- f665 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"60",x"40",x"e0",x"00",x"51",                   -- f66f |   mov B, 0x5100
    x"54",x"e0",x"e0",x"1c",x"00",x"32",x"ff",x"32",x"02", -- f674 |   mmap 0x3200, 0x32ff, 0x2
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"01",x"ee",x"b8",x"d9", -- f67d |   jne [0x3200], 0xee01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"ae",x"d9", -- f687 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"dd",x"a4",x"d9", -- f691 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
    x"d4",x"1c",x"01",                               -- f69b |   umap 0x1
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"ff",x"97",x"d9", -- f69e |   jne [0x3100], 0xff01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"01",x"ee",x"8d",x"d9", -- f6a8 |   jne [0x3200], 0xee01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"83",x"d9", -- f6b2 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"d4",x"1c",x"02",                               -- f6bc |   umap 0x2
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"76",x"d9", -- f6bf |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"ff",x"6c",x"d9", -- f6c9 |   jne [0x3100], 0xff01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"02",x"ff",x"62",x"d9", -- f6d3 |   jne [0x3200], 0xff02, ${fail}:rel + PC
                                                     --      | test_uop_umap:
                                                     --      | test_aux_reg:
    x"60",x"20",x"1c",x"01",                         -- f6dd |   mov A, 0x1
    x"60",x"40",x"1c",x"02",                         -- f6e1 |   mov B, 0x2
    x"60",x"60",x"1c",x"03",                         -- f6e5 |   mov C, 0x3
    x"60",x"80",x"1c",x"04",                         -- f6e9 |   mov D, 0x4
    x"60",x"fc",x"1c",x"05",                         -- f6ed |   mov E, 0x5
    x"60",x"fd",x"1c",x"06",                         -- f6f1 |   mov F, 0x6
    x"60",x"fe",x"1c",x"07",                         -- f6f5 |   mov G, 0x7
    x"60",x"ff",x"1c",x"08",                         -- f6f9 |   mov H, 0x8
    x"ec",x"20",x"1c",x"f8",x"01",x"38",x"d9",       -- f6fd |   jne A, 0x1, ${fail}:rel + PC
    x"ec",x"40",x"1c",x"f8",x"02",x"31",x"d9",       -- f704 |   jne B, 0x2, ${fail}:rel + PC
    x"ec",x"60",x"1c",x"f8",x"03",x"2a",x"d9",       -- f70b |   jne C, 0x3, ${fail}:rel + PC
    x"ec",x"80",x"1c",x"f8",x"04",x"23",x"d9",       -- f712 |   jne D, 0x4, ${fail}:rel + PC
    x"ec",x"fc",x"1c",x"f8",x"05",x"1c",x"d9",       -- f719 |   jne E, 0x5, ${fail}:rel + PC
    x"ec",x"fd",x"1c",x"f8",x"06",x"15",x"d9",       -- f720 |   jne F, 0x6, ${fail}:rel + PC
    x"ec",x"fe",x"1c",x"f8",x"07",x"0e",x"d9",       -- f727 |   jne G, 0x7, ${fail}:rel + PC
    x"ec",x"ff",x"1c",x"f8",x"08",x"07",x"d9",       -- f72e |   jne H, 0x8, ${fail}:rel + PC
    x"34",x"ff",x"e0",x"00",x"ff",                   -- f735 |   xor H, 0xff00
    x"ec",x"ff",x"e0",x"f8",x"08",x"ff",x"fb",x"d8", -- f73a |   jne H, 0xff08, ${fail}:rel + PC
    x"60",x"20",x"ff",                               -- f742 |   mov A, H
    x"ec",x"20",x"e0",x"f8",x"08",x"ff",x"f0",x"d8", -- f745 |   jne A, 0xff08, ${fail}:rel + PC
    x"60",x"fc",x"fe",                               -- f74d |   mov E, G
    x"ec",x"fc",x"1c",x"f8",x"07",x"e5",x"d8",       -- f750 |   jne E, 0x7, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"08",x"ff",x"de",x"d8", -- f757 |   jne H, 0xff08, ${fail}:rel + PC
                                                     --      | test_call_ret:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f75f |   mov SP, 0x1000
    x"5c",x"f8",x"77",x"00",                         -- f764 |   call ${fn_test_target}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"cd",x"d8", -- f768 |   jne SP, 0x1000, ${fail}:rel + PC
    x"60",x"20",x"1c",x"0a",                         -- f770 |   mov A, 0xa
    x"60",x"40",x"00",                               -- f774 |   mov B, 0
    x"60",x"60",x"00",                               -- f777 |   mov C, 0
    x"60",x"80",x"00",                               -- f77a |   mov D, 0
    x"5c",x"f8",x"2d",x"00",                         -- f77d |   call ${fn_recursive}:rel + PC
    x"ec",x"20",x"00",x"f8",x"b4",x"d8",             -- f781 |   jne A, 0, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"3f",x"cf",x"ae",x"d8", -- f787 |   jne B, 0xcf3f, ${fail}:rel + PC
    x"ec",x"60",x"1c",x"f8",x"2d",x"a6",x"d8",       -- f78f |   jne C, 0x2d, ${fail}:rel + PC
    x"ec",x"80",x"e0",x"f8",x"97",x"45",x"9f",x"d8", -- f796 |   jne D, 0x4597, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"97",x"d8", -- f79e |   jne SP, 0x1000, ${fail}:rel + PC
    x"58",x"f8",x"42",x"00",                         -- f7a6 |   jmp ${test_call_ret_end}:rel + PC
                                                     --      | fn_recursive:
    x"04",x"20",x"1c",x"01",                         -- f7aa |   sub A, 0x1
    x"5c",x"f8",x"25",x"00",                         -- f7ae |   call ${fn_process_c}:rel + PC
    x"e8",x"20",x"00",x"f8",x"1c",x"00",             -- f7b2 |   jeq A, 0, ${fn_recursive_end}:rel + PC
    x"5c",x"f8",x"f2",x"ff",                         -- f7b8 |   call ${fn_recursive}:rel + PC
    x"00",x"80",x"60",                               -- f7bc |   add D, C
    x"08",x"80",x"1c",x"03",                         -- f7bf |   mul D, 0x3
    x"00",x"40",x"80",                               -- f7c3 |   add B, D
    x"e0",x"80",                                     -- f7c6 |   push D
    x"08",x"40",x"1c",x"05",                         -- f7c8 |   mul B, 0x5
    x"e4",x"80",                                     -- f7cc |   pop D
                                                     --      | fn_recursive_end:
    x"dc",                                           -- f7ce |   ret
    x"58",x"f8",x"66",x"d8",                         -- f7cf |   jmp ${fail}:rel + PC
                                                     --      | fn_process_c:
    x"00",x"60",x"20",                               -- f7d3 |   add C, A
    x"dc",                                           -- f7d6 |   ret
    x"58",x"f8",x"5e",x"d8",                         -- f7d7 |   jmp ${fail}:rel + PC
                                                     --      | fn_test_target:
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"5a",x"d8", -- f7db |   jne SP, 0xffe, ${fail}:rel + PC
    x"dc",                                           -- f7e3 |   ret
    x"58",x"f8",x"51",x"d8",                         -- f7e4 |   jmp ${fail}:rel + PC
                                                     --      | test_call_ret_end:
                                                     --      | test_mem_access:
    x"62",x"e0",x"1c",x"00",x"01",x"ed",             -- f7e8 |   mov [0x100], 0xed
    x"ee",x"e0",x"e0",x"f8",x"00",x"01",x"aa",x"00",x"0e",x"00", -- f7ee |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
    x"58",x"f8",x"3d",x"d8",                         -- f7f8 |   jmp ${fail}:rel + PC
                                                     --      | test_mem_access_check_jmp:
    x"62",x"e0",x"00",x"00",x"10",                   -- f7fc |   mov [0x1000], 0
    x"60",x"a0",x"e0",x"00",x"10",                   -- f801 |   mov SP, 0x1000
    x"ee",x"a0",x"00",x"f8",x"2f",x"d8",             -- f806 |   jne [SP], 0, ${fail}:rel + PC
    x"e0",x"00",                                     -- f80c |   push 0
    x"e0",x"00",                                     -- f80e |   push 0
    x"e0",x"00",                                     -- f810 |   push 0
    x"e4",x"20",                                     -- f812 |   pop A
    x"e4",x"20",                                     -- f814 |   pop A
    x"e4",x"20",                                     -- f816 |   pop A
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"1d",x"d8", -- f818 |   jne SP, 0x1000, ${fail}:rel + PC
    x"ec",x"20",x"00",x"f8",x"15",x"d8",             -- f820 |   jne A, 0, ${fail}:rel + PC
    x"e0",x"e0",x"02",x"01",                         -- f826 |   push 0x102
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"0b",x"d8", -- f82a |   jne SP, 0xffe, ${fail}:rel + PC
    x"e0",x"e0",x"04",x"03",                         -- f832 |   push 0x304
    x"ec",x"a0",x"e0",x"f8",x"fc",x"0f",x"ff",x"d7", -- f836 |   jne SP, 0xffc, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fe",x"0f",x"02",x"01",x"f7",x"d7", -- f83e |   jne [0xffe], 0x102, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fc",x"0f",x"04",x"03",x"ed",x"d7", -- f848 |   jne [0xffc], 0x304, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fb",x"0f",x"00",x"04",x"e3",x"d7", -- f852 |   jne [0xffb], 0x400, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fd",x"0f",x"03",x"02",x"d9",x"d7", -- f85c |   jne [0xffd], 0x203, ${fail}:rel + PC
    x"ee",x"e0",x"1c",x"f8",x"ff",x"0f",x"01",x"cf",x"d7", -- f866 |   jne [0xfff], 0x1, ${fail}:rel + PC
    x"e4",x"20",                                     -- f86f |   pop A
    x"ec",x"20",x"e0",x"f8",x"04",x"03",x"c4",x"d7", -- f871 |   jne A, 0x304, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"bc",x"d7", -- f879 |   jne SP, 0xffe, ${fail}:rel + PC
    x"e4",x"20",                                     -- f881 |   pop A
    x"ec",x"20",x"e0",x"f8",x"02",x"01",x"b2",x"d7", -- f883 |   jne A, 0x102, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"aa",x"d7", -- f88b |   jne SP, 0x1000, ${fail}:rel + PC
                                                     --      | test_cmp:
    x"cc",x"1c",x"ff",                               -- f893 |   setf 0xff
    x"4c",x"20",                                     -- f896 |   getf A
    x"ec",x"20",x"1c",x"f8",x"3f",x"9d",x"d7",       -- f898 |   jne A, 0x3f, ${fail}:rel + PC
    x"cc",x"e0",x"ab",x"ab",                         -- f89f |   setf 0xabab
    x"4c",x"20",                                     -- f8a3 |   getf A
    x"ec",x"20",x"1c",x"f8",x"2b",x"90",x"d7",       -- f8a5 |   jne A, 0x2b, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"ab",x"2b",                   -- f8ac |   cmp 0xab, 0x2b
    x"4c",x"20",                                     -- f8b1 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"82",x"d7",       -- f8b3 |   jne A, 0x32, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"2b",x"ab",                   -- f8ba |   cmp 0x2b, 0xab
    x"4c",x"20",                                     -- f8bf |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"74",x"d7",       -- f8c1 |   jne A, 0xe, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"ab",x"ab",                   -- f8c8 |   cmp 0xab, 0xab
    x"4c",x"20",                                     -- f8cd |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"66",x"d7",       -- f8cf |   jne A, 0x29, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"ab",x"2b",                   -- f8d6 |   icmp 0xab, 0x2b
    x"4c",x"20",                                     -- f8db |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"58",x"d7",       -- f8dd |   jne A, 0xe, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"2b",x"ab",                   -- f8e4 |   icmp 0x2b, 0xab
    x"4c",x"20",                                     -- f8e9 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"4a",x"d7",       -- f8eb |   jne A, 0x32, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"ab",x"ab",                   -- f8f2 |   icmp 0xab, 0xab
    x"4c",x"20",                                     -- f8f7 |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"3c",x"d7",       -- f8f9 |   jne A, 0x29, ${fail}:rel + PC
                                                     --      | end_of_test:
    x"60",x"20",x"e0",x"ad",x"de",                   -- f900 |   mov A, 0xdead
    x"60",x"40",x"e0",x"ef",x"be",                   -- f905 |   mov B, 0xbeef
    x"88",x"60",x"20",x"40",                         -- f90a |   mul C, A, B
    x"58",x"f8",x"2c",x"d7",                         -- f90e |   jmp ${success}:rel + PC
    x"dc",                                           -- f912 |   ret
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
