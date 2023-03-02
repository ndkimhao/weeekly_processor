
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 11797;
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
    x"b8",x"40",x"e0",x"30",x"d2",                   -- d52b |   neg B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"d0",x"2d",x"05",x"fb", -- d530 |   jne B, 0x2dd0, ${fail}:rel + PC
    x"bc",x"40",x"e0",x"30",x"d2",                   -- d538 |   not B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"cf",x"2d",x"f8",x"fa", -- d53d |   jne B, 0x2dcf, ${fail}:rel + PC
    x"c0",x"40",x"e0",x"30",x"d2",                   -- d545 |   bool B, 0xd230
    x"ec",x"40",x"1c",x"f8",x"01",x"eb",x"fa",       -- d54a |   jne B, 0x1, ${fail}:rel + PC
    x"c4",x"40",x"e0",x"30",x"d2",                   -- d551 |   inc B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"31",x"d2",x"df",x"fa", -- d556 |   jne B, 0xd231, ${fail}:rel + PC
    x"c8",x"40",x"e0",x"30",x"d2",                   -- d55e |   dec B, 0xd230
    x"ec",x"40",x"e0",x"f8",x"2f",x"d2",x"d2",x"fa", -- d563 |   jne B, 0xd22f, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d56b |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d570 |   mov D, 0xda37
    x"80",x"40",x"60",x"80",                         -- d575 |   add B, C, D
    x"ec",x"40",x"e0",x"f8",x"e4",x"da",x"bc",x"fa", -- d579 |   jne B, 0xdae4, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d581 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d586 |   mov D, 0xda37
    x"84",x"40",x"60",x"80",                         -- d58b |   sub B, C, D
    x"ec",x"40",x"e0",x"f8",x"76",x"26",x"a6",x"fa", -- d58f |   jne B, 0x2676, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d597 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d59c |   mov D, 0xda37
    x"88",x"40",x"60",x"80",                         -- d5a1 |   mul B, C, D
    x"ec",x"40",x"e0",x"f8",x"2b",x"77",x"90",x"fa", -- d5a5 |   jne B, 0x772b, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"93",x"00",x"88",x"fa", -- d5ad |   jne H, 0x93, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d5b5 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d5ba |   mov D, 0xda37
    x"8c",x"40",x"60",x"80",                         -- d5bf |   imul B, C, D
    x"ec",x"40",x"e0",x"f8",x"2b",x"77",x"72",x"fa", -- d5c3 |   jne B, 0x772b, ${fail}:rel + PC
    x"ec",x"ff",x"1c",x"f8",x"e6",x"6a",x"fa",       -- d5cb |   jne H, 0xe6, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d5d2 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d5d7 |   mov D, 0xda37
    x"a0",x"40",x"60",x"80",                         -- d5dc |   shr B, C, D
    x"ec",x"40",x"1c",x"f8",x"01",x"55",x"fa",       -- d5e0 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d5e7 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d5ec |   mov D, 0xda37
    x"a4",x"40",x"60",x"80",                         -- d5f1 |   ishr B, C, D
    x"ec",x"40",x"1c",x"f8",x"01",x"40",x"fa",       -- d5f5 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d5fc |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d601 |   mov D, 0xda37
    x"a8",x"40",x"60",x"80",                         -- d606 |   shl B, C, D
    x"ec",x"40",x"e0",x"f8",x"80",x"56",x"2b",x"fa", -- d60a |   jne B, 0x5680, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d612 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d617 |   mov D, 0xda37
    x"ac",x"40",x"60",x"80",                         -- d61c |   and B, C, D
    x"ec",x"40",x"1c",x"f8",x"25",x"15",x"fa",       -- d620 |   jne B, 0x25, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d627 |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d62c |   mov D, 0xda37
    x"b0",x"40",x"60",x"80",                         -- d631 |   or B, C, D
    x"ec",x"40",x"e0",x"f8",x"bf",x"da",x"00",x"fa", -- d635 |   jne B, 0xdabf, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"00",                   -- d63d |   mov C, 0xad
    x"60",x"80",x"e0",x"37",x"da",                   -- d642 |   mov D, 0xda37
    x"b4",x"40",x"60",x"80",                         -- d647 |   xor B, C, D
    x"ec",x"40",x"e0",x"f8",x"9a",x"da",x"ea",x"f9", -- d64b |   jne B, 0xda9a, ${fail}:rel + PC
    x"b8",x"40",x"e0",x"ad",x"00",                   -- d653 |   neg B, 0xad
    x"ec",x"40",x"e0",x"f8",x"53",x"ff",x"dd",x"f9", -- d658 |   jne B, 0xff53, ${fail}:rel + PC
    x"bc",x"40",x"e0",x"ad",x"00",                   -- d660 |   not B, 0xad
    x"ec",x"40",x"e0",x"f8",x"52",x"ff",x"d0",x"f9", -- d665 |   jne B, 0xff52, ${fail}:rel + PC
    x"c0",x"40",x"e0",x"ad",x"00",                   -- d66d |   bool B, 0xad
    x"ec",x"40",x"1c",x"f8",x"01",x"c3",x"f9",       -- d672 |   jne B, 0x1, ${fail}:rel + PC
    x"c4",x"40",x"e0",x"ad",x"00",                   -- d679 |   inc B, 0xad
    x"ec",x"40",x"e0",x"f8",x"ae",x"00",x"b7",x"f9", -- d67e |   jne B, 0xae, ${fail}:rel + PC
    x"c8",x"40",x"e0",x"ad",x"00",                   -- d686 |   dec B, 0xad
    x"ec",x"40",x"e0",x"f8",x"ac",x"00",x"aa",x"f9", -- d68b |   jne B, 0xac, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d693 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d698 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d69d |   mov B, C
    x"00",x"40",x"80",                               -- d6a0 |   add B, D
    x"ec",x"40",x"e0",x"f8",x"ec",x"1a",x"92",x"f9", -- d6a3 |   jne B, 0x1aec, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d6ab |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d6b0 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d6b5 |   mov B, C
    x"04",x"40",x"80",                               -- d6b8 |   sub B, D
    x"ec",x"40",x"e0",x"f8",x"6e",x"c6",x"7a",x"f9", -- d6bb |   jne B, 0xc66e, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d6c3 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d6c8 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d6cd |   mov B, C
    x"08",x"40",x"80",                               -- d6d0 |   mul B, D
    x"ec",x"40",x"e0",x"f8",x"93",x"9c",x"62",x"f9", -- d6d3 |   jne B, 0x9c93, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"b7",x"27",x"5a",x"f9", -- d6db |   jne H, 0x27b7, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d6e3 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d6e8 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d6ed |   mov B, C
    x"0c",x"40",x"80",                               -- d6f0 |   imul B, D
    x"ec",x"40",x"e0",x"f8",x"93",x"9c",x"42",x"f9", -- d6f3 |   jne B, 0x9c93, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"78",x"fd",x"3a",x"f9", -- d6fb |   jne H, 0xfd78, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d703 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d708 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d70d |   mov B, C
    x"20",x"40",x"80",                               -- d710 |   shr B, D
    x"ec",x"40",x"1c",x"f8",x"01",x"22",x"f9",       -- d713 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d71a |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d71f |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d724 |   mov B, C
    x"24",x"40",x"80",                               -- d727 |   ishr B, D
    x"ec",x"40",x"1c",x"f8",x"ff",x"0b",x"f9",       -- d72a |   jne B, 0xff, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d731 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d736 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d73b |   mov B, C
    x"28",x"40",x"80",                               -- d73e |   shl B, D
    x"ec",x"40",x"e0",x"f8",x"00",x"80",x"f4",x"f8", -- d741 |   jne B, 0x8000, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d749 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d74e |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d753 |   mov B, C
    x"2c",x"40",x"80",                               -- d756 |   and B, D
    x"ec",x"40",x"e0",x"f8",x"2d",x"20",x"dc",x"f8", -- d759 |   jne B, 0x202d, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d761 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d766 |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d76b |   mov B, C
    x"30",x"40",x"80",                               -- d76e |   or B, D
    x"ec",x"40",x"e0",x"f8",x"bf",x"fa",x"c4",x"f8", -- d771 |   jne B, 0xfabf, ${fail}:rel + PC
    x"60",x"60",x"e0",x"ad",x"f0",                   -- d779 |   mov C, 0xf0ad
    x"60",x"80",x"e0",x"3f",x"2a",                   -- d77e |   mov D, 0x2a3f
    x"60",x"40",x"60",                               -- d783 |   mov B, C
    x"34",x"40",x"80",                               -- d786 |   xor B, D
    x"ec",x"40",x"e0",x"f8",x"92",x"da",x"ac",x"f8", -- d789 |   jne B, 0xda92, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d791 |   mov B, 0xf0ad
    x"38",x"40",                                     -- d796 |   neg B
    x"ec",x"40",x"e0",x"f8",x"53",x"0f",x"9d",x"f8", -- d798 |   jne B, 0xf53, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d7a0 |   mov B, 0xf0ad
    x"3c",x"40",                                     -- d7a5 |   not B
    x"ec",x"40",x"e0",x"f8",x"52",x"0f",x"8e",x"f8", -- d7a7 |   jne B, 0xf52, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d7af |   mov B, 0xf0ad
    x"40",x"40",                                     -- d7b4 |   bool B
    x"ec",x"40",x"1c",x"f8",x"01",x"7f",x"f8",       -- d7b6 |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d7bd |   mov B, 0xf0ad
    x"44",x"40",                                     -- d7c2 |   inc B
    x"ec",x"40",x"e0",x"f8",x"ae",x"f0",x"71",x"f8", -- d7c4 |   jne B, 0xf0ae, ${fail}:rel + PC
    x"60",x"40",x"e0",x"ad",x"f0",                   -- d7cc |   mov B, 0xf0ad
    x"48",x"40",                                     -- d7d1 |   dec B
    x"ec",x"40",x"e0",x"f8",x"ac",x"f0",x"62",x"f8", -- d7d3 |   jne B, 0xf0ac, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d7db |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d7de |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d7e3 |   mov B, C
    x"00",x"40",x"80",                               -- d7e6 |   add B, D
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"4c",x"f8", -- d7e9 |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d7f1 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d7f4 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d7f9 |   mov B, C
    x"04",x"40",x"80",                               -- d7fc |   sub B, D
    x"ec",x"40",x"e0",x"f8",x"53",x"21",x"36",x"f8", -- d7ff |   jne B, 0x2153, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d807 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d80a |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d80f |   mov B, C
    x"08",x"40",x"80",                               -- d812 |   mul B, D
    x"ec",x"40",x"00",x"f8",x"20",x"f8",             -- d815 |   jne B, 0, ${fail}:rel + PC
    x"ec",x"ff",x"00",x"f8",x"1a",x"f8",             -- d81b |   jne H, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d821 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d824 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d829 |   mov B, C
    x"0c",x"40",x"80",                               -- d82c |   imul B, D
    x"ec",x"40",x"00",x"f8",x"06",x"f8",             -- d82f |   jne B, 0, ${fail}:rel + PC
    x"ec",x"ff",x"00",x"f8",x"00",x"f8",             -- d835 |   jne H, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d83b |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d83e |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d843 |   mov B, C
    x"20",x"40",x"80",                               -- d846 |   shr B, D
    x"ec",x"40",x"00",x"f8",x"ec",x"f7",             -- d849 |   jne B, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d84f |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d852 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d857 |   mov B, C
    x"24",x"40",x"80",                               -- d85a |   ishr B, D
    x"ec",x"40",x"00",x"f8",x"d8",x"f7",             -- d85d |   jne B, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d863 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d866 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d86b |   mov B, C
    x"28",x"40",x"80",                               -- d86e |   shl B, D
    x"ec",x"40",x"00",x"f8",x"c4",x"f7",             -- d871 |   jne B, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d877 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d87a |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d87f |   mov B, C
    x"2c",x"40",x"80",                               -- d882 |   and B, D
    x"ec",x"40",x"00",x"f8",x"b0",x"f7",             -- d885 |   jne B, 0, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d88b |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d88e |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d893 |   mov B, C
    x"30",x"40",x"80",                               -- d896 |   or B, D
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"9c",x"f7", -- d899 |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"60",x"00",                               -- d8a1 |   mov C, 0
    x"60",x"80",x"e0",x"ad",x"de",                   -- d8a4 |   mov D, 0xdead
    x"60",x"40",x"60",                               -- d8a9 |   mov B, C
    x"34",x"40",x"80",                               -- d8ac |   xor B, D
    x"ec",x"40",x"e0",x"f8",x"ad",x"de",x"86",x"f7", -- d8af |   jne B, 0xdead, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d8b7 |   mov B, 0
    x"38",x"40",                                     -- d8ba |   neg B
    x"ec",x"40",x"00",x"f8",x"79",x"f7",             -- d8bc |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d8c2 |   mov B, 0
    x"3c",x"40",                                     -- d8c5 |   not B
    x"ec",x"40",x"1c",x"f8",x"ff",x"6e",x"f7",       -- d8c7 |   jne B, 0xff, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d8ce |   mov B, 0
    x"40",x"40",                                     -- d8d1 |   bool B
    x"ec",x"40",x"00",x"f8",x"62",x"f7",             -- d8d3 |   jne B, 0, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d8d9 |   mov B, 0
    x"44",x"40",                                     -- d8dc |   inc B
    x"ec",x"40",x"1c",x"f8",x"01",x"57",x"f7",       -- d8de |   jne B, 0x1, ${fail}:rel + PC
    x"60",x"40",x"00",                               -- d8e5 |   mov B, 0
    x"48",x"40",                                     -- d8e8 |   dec B
    x"ec",x"40",x"1c",x"f8",x"ff",x"4b",x"f7",       -- d8ea |   jne B, 0xff, ${fail}:rel + PC
                                                     --      | jmp_test:
    x"e8",x"1c",x"1c",x"f8",x"ab",x"2b",x"44",x"f7", -- d8f1 |   jeq 0xab, 0x2b, ${fail}:rel + PC
    x"ec",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d8f9 |   jne 0xab, 0x2b, ${_L_test_jmp_1}:rel + PC
    x"58",x"f8",x"34",x"f7",                         -- d901 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_1:
    x"f0",x"1c",x"1c",x"f8",x"ab",x"2b",x"30",x"f7", -- d905 |   jlt 0xab, 0x2b, ${fail}:rel + PC
    x"f4",x"1c",x"1c",x"f8",x"ab",x"2b",x"28",x"f7", -- d90d |   jle 0xab, 0x2b, ${fail}:rel + PC
    x"f8",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d915 |   jgt 0xab, 0x2b, ${_L_test_jmp_2}:rel + PC
    x"58",x"f8",x"18",x"f7",                         -- d91d |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_2:
    x"fc",x"1c",x"1c",x"f8",x"ab",x"2b",x"0c",x"00", -- d921 |   jge 0xab, 0x2b, ${_L_test_jmp_3}:rel + PC
    x"58",x"f8",x"0c",x"f7",                         -- d929 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_3:
    x"50",x"1c",x"1c",x"ab",x"2b",                   -- d92d |   cmp 0xab, 0x2b
    x"68",x"f8",x"03",x"f7",                         -- d932 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d936 |   jne ${_L_test_jmp_4}:rel + PC
    x"58",x"f8",x"fb",x"f6",                         -- d93a |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_4:
    x"70",x"f8",x"f7",x"f6",                         -- d93e |   jlt ${fail}:rel + PC
    x"74",x"f8",x"f3",x"f6",                         -- d942 |   jle ${fail}:rel + PC
    x"78",x"f8",x"08",x"00",                         -- d946 |   jgt ${_L_test_jmp_5}:rel + PC
    x"58",x"f8",x"eb",x"f6",                         -- d94a |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_5:
    x"7c",x"f8",x"08",x"00",                         -- d94e |   jge ${_L_test_jmp_6}:rel + PC
    x"58",x"f8",x"e3",x"f6",                         -- d952 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_6:
    x"d0",x"1c",x"1c",x"ab",x"2b",                   -- d956 |   icmp 0xab, 0x2b
    x"68",x"f8",x"da",x"f6",                         -- d95b |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d95f |   jne ${_L_test_jmp_7}:rel + PC
    x"58",x"f8",x"d2",x"f6",                         -- d963 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_7:
    x"70",x"f8",x"08",x"00",                         -- d967 |   jlt ${_L_test_jmp_8}:rel + PC
    x"58",x"f8",x"ca",x"f6",                         -- d96b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_8:
    x"74",x"f8",x"08",x"00",                         -- d96f |   jle ${_L_test_jmp_9}:rel + PC
    x"58",x"f8",x"c2",x"f6",                         -- d973 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_9:
    x"78",x"f8",x"be",x"f6",                         -- d977 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"ba",x"f6",                         -- d97b |   jge ${fail}:rel + PC
    x"e8",x"1c",x"1c",x"f8",x"2b",x"ab",x"b6",x"f6", -- d97f |   jeq 0x2b, 0xab, ${fail}:rel + PC
    x"ec",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d987 |   jne 0x2b, 0xab, ${_L_test_jmp_10}:rel + PC
    x"58",x"f8",x"a6",x"f6",                         -- d98f |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_10:
    x"f0",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d993 |   jlt 0x2b, 0xab, ${_L_test_jmp_11}:rel + PC
    x"58",x"f8",x"9a",x"f6",                         -- d99b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_11:
    x"f4",x"1c",x"1c",x"f8",x"2b",x"ab",x"0c",x"00", -- d99f |   jle 0x2b, 0xab, ${_L_test_jmp_12}:rel + PC
    x"58",x"f8",x"8e",x"f6",                         -- d9a7 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_12:
    x"f8",x"1c",x"1c",x"f8",x"2b",x"ab",x"8a",x"f6", -- d9ab |   jgt 0x2b, 0xab, ${fail}:rel + PC
    x"fc",x"1c",x"1c",x"f8",x"2b",x"ab",x"82",x"f6", -- d9b3 |   jge 0x2b, 0xab, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"2b",x"ab",                   -- d9bb |   cmp 0x2b, 0xab
    x"68",x"f8",x"75",x"f6",                         -- d9c0 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d9c4 |   jne ${_L_test_jmp_13}:rel + PC
    x"58",x"f8",x"6d",x"f6",                         -- d9c8 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_13:
    x"70",x"f8",x"08",x"00",                         -- d9cc |   jlt ${_L_test_jmp_14}:rel + PC
    x"58",x"f8",x"65",x"f6",                         -- d9d0 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_14:
    x"74",x"f8",x"08",x"00",                         -- d9d4 |   jle ${_L_test_jmp_15}:rel + PC
    x"58",x"f8",x"5d",x"f6",                         -- d9d8 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_15:
    x"78",x"f8",x"59",x"f6",                         -- d9dc |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"55",x"f6",                         -- d9e0 |   jge ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"2b",x"ab",                   -- d9e4 |   icmp 0x2b, 0xab
    x"68",x"f8",x"4c",x"f6",                         -- d9e9 |   jeq ${fail}:rel + PC
    x"6c",x"f8",x"08",x"00",                         -- d9ed |   jne ${_L_test_jmp_16}:rel + PC
    x"58",x"f8",x"44",x"f6",                         -- d9f1 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_16:
    x"70",x"f8",x"40",x"f6",                         -- d9f5 |   jlt ${fail}:rel + PC
    x"74",x"f8",x"3c",x"f6",                         -- d9f9 |   jle ${fail}:rel + PC
    x"78",x"f8",x"08",x"00",                         -- d9fd |   jgt ${_L_test_jmp_17}:rel + PC
    x"58",x"f8",x"34",x"f6",                         -- da01 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_17:
    x"7c",x"f8",x"08",x"00",                         -- da05 |   jge ${_L_test_jmp_18}:rel + PC
    x"58",x"f8",x"2c",x"f6",                         -- da09 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_18:
    x"e8",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- da0d |   jeq 0xab, 0xab, ${_L_test_jmp_19}:rel + PC
    x"58",x"f8",x"20",x"f6",                         -- da15 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_19:
    x"ec",x"1c",x"1c",x"f8",x"ab",x"ab",x"1c",x"f6", -- da19 |   jne 0xab, 0xab, ${fail}:rel + PC
    x"f0",x"1c",x"1c",x"f8",x"ab",x"ab",x"14",x"f6", -- da21 |   jlt 0xab, 0xab, ${fail}:rel + PC
    x"f4",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- da29 |   jle 0xab, 0xab, ${_L_test_jmp_20}:rel + PC
    x"58",x"f8",x"04",x"f6",                         -- da31 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_20:
    x"f8",x"1c",x"1c",x"f8",x"ab",x"ab",x"00",x"f6", -- da35 |   jgt 0xab, 0xab, ${fail}:rel + PC
    x"fc",x"1c",x"1c",x"f8",x"ab",x"ab",x"0c",x"00", -- da3d |   jge 0xab, 0xab, ${_L_test_jmp_21}:rel + PC
    x"58",x"f8",x"f0",x"f5",                         -- da45 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_21:
    x"50",x"1c",x"1c",x"ab",x"ab",                   -- da49 |   cmp 0xab, 0xab
    x"68",x"f8",x"08",x"00",                         -- da4e |   jeq ${_L_test_jmp_22}:rel + PC
    x"58",x"f8",x"e3",x"f5",                         -- da52 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_22:
    x"6c",x"f8",x"df",x"f5",                         -- da56 |   jne ${fail}:rel + PC
    x"70",x"f8",x"db",x"f5",                         -- da5a |   jlt ${fail}:rel + PC
    x"74",x"f8",x"08",x"00",                         -- da5e |   jle ${_L_test_jmp_23}:rel + PC
    x"58",x"f8",x"d3",x"f5",                         -- da62 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_23:
    x"78",x"f8",x"cf",x"f5",                         -- da66 |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"08",x"00",                         -- da6a |   jge ${_L_test_jmp_24}:rel + PC
    x"58",x"f8",x"c7",x"f5",                         -- da6e |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_24:
    x"d0",x"1c",x"1c",x"ab",x"ab",                   -- da72 |   icmp 0xab, 0xab
    x"68",x"f8",x"08",x"00",                         -- da77 |   jeq ${_L_test_jmp_25}:rel + PC
    x"58",x"f8",x"ba",x"f5",                         -- da7b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_25:
    x"6c",x"f8",x"b6",x"f5",                         -- da7f |   jne ${fail}:rel + PC
    x"70",x"f8",x"b2",x"f5",                         -- da83 |   jlt ${fail}:rel + PC
    x"74",x"f8",x"08",x"00",                         -- da87 |   jle ${_L_test_jmp_26}:rel + PC
    x"58",x"f8",x"aa",x"f5",                         -- da8b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_26:
    x"78",x"f8",x"a6",x"f5",                         -- da8f |   jgt ${fail}:rel + PC
    x"7c",x"f8",x"08",x"00",                         -- da93 |   jge ${_L_test_jmp_27}:rel + PC
    x"58",x"f8",x"9e",x"f5",                         -- da97 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_jmp_27:
                                                     --      | test_uop_get_arg:
    x"60",x"a0",x"e0",x"00",x"70",                   -- da9b |   mov SP, 0x7000
    x"60",x"20",x"e0",x"aa",x"00",                   -- daa0 |   mov A, 0xaa
    x"60",x"40",x"e0",x"bb",x"00",                   -- daa5 |   mov B, 0xbb
    x"60",x"fe",x"e0",x"55",x"01",                   -- daaa |   mov G, 0x155
    x"b6",x"e0",x"1c",x"fe",x"39",x"30",x"85",       -- daaf |   xor [0x3039], -123, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d0",x"fe",x"7f",x"f5", -- dab6 |   jne [0x3039], 0xfed0, ${fail}:rel + PC
    x"ae",x"3e",x"fe",x"21",x"f6",                   -- dac0 |   and [A*4 + -10], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"54",x"01",x"70",x"f5", -- dac5 |   jne [0x29e], 0x154, ${fail}:rel + PC
    x"86",x"21",x"e4",x"3e",x"de",x"fa",x"f6",       -- dacf |   sub [A*2], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ea",x"f8",x"5f",x"f5", -- dad6 |   jne [0x154], 0xf8ea, ${fail}:rel + PC
    x"a6",x"e0",x"20",x"21",x"39",x"30",             -- dae0 |   ishr [0x3039], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"0a",x"4f",x"f5", -- dae6 |   jne [0x3039], 0xa, ${fail}:rel + PC
    x"aa",x"fe",x"2a",x"3e",x"f6",                   -- daef |   shl [G], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"c0",x"41",x"f5", -- daf4 |   jne [0x155], 0xc000, ${fail}:rel + PC
    x"b2",x"fe",x"1c",x"fe",x"85",                   -- dafe |   or [G], -123, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"d5",x"32",x"f5", -- db03 |   jne [0x155], 0xd5, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"20",x"85",                   -- db0c |   mul [A*4 + B], -123, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"52",x"ae",x"24",x"f5", -- db11 |   jne [0x363], 0xae52, ${fail}:rel + PC
    x"a6",x"e0",x"e0",x"2a",x"39",x"30",x"39",x"30", -- db1b |   ishr [0x3039], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"07",x"06",x"12",x"f5", -- db23 |   jne [0x3039], 0x607, ${fail}:rel + PC
    x"a2",x"21",x"e4",x"21",x"de",x"fa",             -- db2d |   shr [A*2], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b8",x"0f",x"02",x"f5", -- db33 |   jne [0x154], 0xfb8, ${fail}:rel + PC
    x"82",x"21",x"fe",x"fe",                         -- db3d |   add [A*2], G, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"02",x"f4",x"f4", -- db41 |   jne [0x154], 0x2aa, ${fail}:rel + PC
    x"a6",x"fe",x"e4",x"20",x"de",x"fa",             -- db4b |   ishr [G], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"fe",x"e4",x"f4", -- db51 |   jne [0x155], 0xfe, ${fail}:rel + PC
    x"82",x"e0",x"e4",x"2a",x"39",x"30",x"de",x"fa", -- db5a |   add [0x3039], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"eb",x"fe",x"d3",x"f4", -- db62 |   jne [0x3039], 0xfeeb, ${fail}:rel + PC
    x"a6",x"20",x"20",x"20",                         -- db6c |   ishr [A], A, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"c5",x"f4", -- db70 |   jne [0xaa], 0, ${fail}:rel + PC
    x"82",x"fe",x"2a",x"20",                         -- db78 |   add [G], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0d",x"04",x"b9",x"f4", -- db7c |   jne [0x155], 0x40d, ${fail}:rel + PC
    x"b6",x"fe",x"fe",x"fe",                         -- db86 |   xor [G], G, G
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"ab",x"f4", -- db8a |   jne [0x155], 0, ${fail}:rel + PC
    x"aa",x"21",x"fe",x"21",                         -- db92 |   shl [A*2], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"50",x"15",x"9f",x"f4", -- db96 |   jne [0x154], 0x1550, ${fail}:rel + PC
    x"a6",x"fe",x"e0",x"21",x"39",x"30",             -- dba0 |   ishr [G], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"03",x"03",x"8f",x"f4", -- dba6 |   jne [0x155], 0x303, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"e4",x"de",x"fa",             -- dbb0 |   and [A*2], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"03",x"7f",x"f4", -- dbb6 |   jne [0x154], 0x300, ${fail}:rel + PC
    x"82",x"20",x"3e",x"3e",x"f6",x"f6",             -- dbc0 |   add [A], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"3c",x"05",x"6f",x"f4", -- dbc6 |   jne [0xaa], 0x53c, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"1c",x"39",x"30",x"85",       -- dbd0 |   or [0x3039], A*2, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"d5",x"5e",x"f4", -- dbd7 |   jne [0x3039], 0xd5, ${fail}:rel + PC
    x"82",x"e0",x"fe",x"fe",x"39",x"30",             -- dbe0 |   add [0x3039], G, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"02",x"4f",x"f4", -- dbe6 |   jne [0x3039], 0x2aa, ${fail}:rel + PC
    x"ae",x"fe",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- dbf0 |   and [G], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"08",x"30",x"3d",x"f4", -- dbf8 |   jne [0x155], 0x3008, ${fail}:rel + PC
    x"8e",x"e0",x"2a",x"3e",x"39",x"30",x"f6",       -- dc02 |   imul [0x3039], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"1a",x"dd",x"2c",x"f4", -- dc09 |   jne [0x3039], 0xdd1a, ${fail}:rel + PC
    x"b2",x"21",x"e0",x"20",x"39",x"30",             -- dc13 |   or [A*2], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"bb",x"30",x"1c",x"f4", -- dc19 |   jne [0x154], 0x30bb, ${fail}:rel + PC
    x"8e",x"21",x"3e",x"21",x"f6",                   -- dc23 |   imul [A*2], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"d8",x"79",x"0d",x"f4", -- dc28 |   jne [0x154], 0x79d8, ${fail}:rel + PC
    x"82",x"3e",x"1c",x"2a",x"f6",x"85",             -- dc32 |   add [A*4 + -10], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e8",x"02",x"fd",x"f3", -- dc38 |   jne [0x29e], 0x2e8, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"21",x"de",x"fa",             -- dc42 |   sub [G], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"34",x"fa",x"ed",x"f3", -- dc48 |   jne [0x155], 0xfa34, ${fail}:rel + PC
    x"b2",x"2a",x"e4",x"21",x"de",x"fa",             -- dc52 |   or [A*4 + B], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"dc",x"fb",x"dd",x"f3", -- dc58 |   jne [0x363], 0xfbdc, ${fail}:rel + PC
    x"ae",x"21",x"21",x"20",                         -- dc62 |   and [A*2], A*2, A
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"cf",x"f3", -- dc66 |   jne [0x154], 0, ${fail}:rel + PC
    x"86",x"2a",x"2a",x"fe",                         -- dc6e |   sub [A*4 + B], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"0e",x"02",x"c3",x"f3", -- dc72 |   jne [0x363], 0x20e, ${fail}:rel + PC
    x"82",x"3e",x"3e",x"20",x"f6",x"f6",             -- dc7c |   add [A*4 + -10], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"48",x"03",x"b3",x"f3", -- dc82 |   jne [0x29e], 0x348, ${fail}:rel + PC
    x"86",x"21",x"e0",x"e0",x"39",x"30",x"39",x"30", -- dc8c |   sub [A*2], 0x3039, 0x3039
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"a1",x"f3", -- dc94 |   jne [0x154], 0, ${fail}:rel + PC
    x"a2",x"20",x"1c",x"fe",x"85",                   -- dc9c |   shr [A], -123, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"fc",x"07",x"94",x"f3", -- dca1 |   jne [0xaa], 0x7fc, ${fail}:rel + PC
    x"aa",x"2a",x"1c",x"2a",x"85",                   -- dcab |   shl [A*4 + B], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"28",x"fc",x"85",x"f3", -- dcb0 |   jne [0x363], 0xfc28, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"20",                         -- dcba |   or [A*4 + B], A, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"aa",x"00",x"77",x"f3", -- dcbe |   jne [0x363], 0xaa, ${fail}:rel + PC
    x"86",x"20",x"20",x"1c",x"85",                   -- dcc8 |   sub [A], A, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"25",x"01",x"68",x"f3", -- dccd |   jne [0xaa], 0x125, ${fail}:rel + PC
    x"a6",x"3e",x"e4",x"21",x"f6",x"de",x"fa",       -- dcd7 |   ishr [A*4 + -10], 0xfade + A, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"b8",x"57",x"f3", -- dcde |   jne [0x29e], 0xb8, ${fail}:rel + PC
    x"86",x"20",x"e0",x"e0",x"39",x"30",x"39",x"30", -- dce7 |   sub [A], 0x3039, 0x3039
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"46",x"f3", -- dcef |   jne [0xaa], 0, ${fail}:rel + PC
    x"82",x"fe",x"e0",x"e0",x"39",x"30",x"39",x"30", -- dcf7 |   add [G], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"72",x"60",x"36",x"f3", -- dcff |   jne [0x155], 0x6072, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- dd09 |   shr [A*4 + B], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"fb",x"00",x"24",x"f3", -- dd11 |   jne [0x363], 0xfb, ${fail}:rel + PC
    x"8e",x"20",x"20",x"fe",                         -- dd1b |   imul [A], A, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"72",x"e2",x"16",x"f3", -- dd1f |   jne [0xaa], 0xe272, ${fail}:rel + PC
    x"a2",x"21",x"e4",x"2a",x"de",x"fa",             -- dd29 |   shr [A*2], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"71",x"1f",x"06",x"f3", -- dd2f |   jne [0x154], 0x1f71, ${fail}:rel + PC
    x"a2",x"2a",x"2a",x"1c",x"85",                   -- dd39 |   shr [A*4 + B], A*4 + B, -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"1b",x"f7",x"f2", -- dd3e |   jne [0x363], 0x1b, ${fail}:rel + PC
    x"a2",x"20",x"21",x"2a",                         -- dd47 |   shr [A], A*2, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"2a",x"ea",x"f2", -- dd4b |   jne [0xaa], 0x2a, ${fail}:rel + PC
    x"ae",x"e0",x"2a",x"20",x"39",x"30",             -- dd54 |   and [0x3039], A*4 + B, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"22",x"db",x"f2", -- dd5a |   jne [0x3039], 0x22, ${fail}:rel + PC
    x"a2",x"e0",x"e0",x"e0",x"39",x"30",x"39",x"30",x"39",x"30", -- dd63 |   shr [0x3039], 0x3039, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"18",x"c8",x"f2", -- dd6d |   jne [0x3039], 0x18, ${fail}:rel + PC
    x"8a",x"20",x"fe",x"3e",x"f6",                   -- dd76 |   mul [A], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"76",x"7c",x"ba",x"f2", -- dd7b |   jne [0xaa], 0x7c76, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"2a",x"39",x"30",             -- dd85 |   add [A*4 + B], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"9c",x"33",x"aa",x"f2", -- dd8b |   jne [0x363], 0x339c, ${fail}:rel + PC
    x"8e",x"fe",x"3e",x"2a",x"f6",                   -- dd95 |   imul [G], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"1a",x"dd",x"9b",x"f2", -- dd9a |   jne [0x155], 0xdd1a, ${fail}:rel + PC
    x"aa",x"20",x"21",x"e0",x"39",x"30",             -- dda4 |   shl [A], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"a8",x"8b",x"f2", -- ddaa |   jne [0xaa], 0xa800, ${fail}:rel + PC
    x"82",x"21",x"fe",x"20",                         -- ddb4 |   add [A*2], G, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"01",x"7d",x"f2", -- ddb8 |   jne [0x154], 0x1ff, ${fail}:rel + PC
    x"82",x"2a",x"2a",x"21",                         -- ddc2 |   add [A*4 + B], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"b7",x"04",x"6f",x"f2", -- ddc6 |   jne [0x363], 0x4b7, ${fail}:rel + PC
    x"a2",x"20",x"fe",x"e4",x"de",x"fa",             -- ddd0 |   shr [A], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"01",x"5f",x"f2", -- ddd6 |   jne [0xaa], 0x1, ${fail}:rel + PC
    x"82",x"fe",x"1c",x"20",x"85",                   -- dddf |   add [G], -123, A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"2f",x"51",x"f2", -- dde4 |   jne [0x155], 0x2f, ${fail}:rel + PC
    x"8e",x"3e",x"fe",x"e0",x"f6",x"39",x"30",       -- dded |   imul [A*4 + -10], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ed",x"3b",x"41",x"f2", -- ddf4 |   jne [0x29e], 0x3bed, ${fail}:rel + PC
    x"8a",x"fe",x"e4",x"2a",x"de",x"fa",             -- ddfe |   mul [G], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"98",x"dd",x"31",x"f2", -- de04 |   jne [0x155], 0xdd98, ${fail}:rel + PC
    x"a2",x"fe",x"fe",x"20",                         -- de0e |   shr [G], G, A
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"23",x"f2", -- de12 |   jne [0x155], 0, ${fail}:rel + PC
    x"b2",x"21",x"20",x"20",                         -- de1a |   or [A*2], A, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"00",x"17",x"f2", -- de1e |   jne [0x154], 0xaa, ${fail}:rel + PC
    x"b2",x"3e",x"1c",x"21",x"f6",x"85",             -- de28 |   or [A*4 + -10], -123, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"d5",x"07",x"f2", -- de2e |   jne [0x29e], 0xd5, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"1c",x"85",x"85",             -- de37 |   mul [A*4 + B], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"19",x"3b",x"f8",x"f1", -- de3d |   jne [0x363], 0x3b19, ${fail}:rel + PC
    x"8a",x"e0",x"e4",x"21",x"39",x"30",x"de",x"fa", -- de47 |   mul [0x3039], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"a0",x"10",x"e6",x"f1", -- de4f |   jne [0x3039], 0x10a0, ${fail}:rel + PC
    x"86",x"fe",x"20",x"3e",x"f6",                   -- de59 |   sub [G], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0c",x"fe",x"d7",x"f1", -- de5e |   jne [0x155], 0xfe0c, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"21",                         -- de68 |   shl [A], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"30",x"36",x"c9",x"f1", -- de6c |   jne [0xaa], 0x3630, ${fail}:rel + PC
    x"b6",x"21",x"1c",x"2a",x"85",                   -- de76 |   xor [A*2], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"e6",x"fc",x"ba",x"f1", -- de7b |   jne [0x154], 0xfce6, ${fail}:rel + PC
    x"86",x"2a",x"3e",x"1c",x"f6",x"85",             -- de85 |   sub [A*4 + B], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"19",x"03",x"aa",x"f1", -- de8b |   jne [0x363], 0x319, ${fail}:rel + PC
    x"86",x"e0",x"e0",x"e4",x"39",x"30",x"39",x"30",x"de",x"fa", -- de95 |   sub [0x3039], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"b1",x"34",x"96",x"f1", -- de9f |   jne [0x3039], 0x34b1, ${fail}:rel + PC
    x"ae",x"fe",x"2a",x"e4",x"de",x"fa",             -- dea9 |   and [G], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"03",x"86",x"f1", -- deaf |   jne [0x155], 0x300, ${fail}:rel + PC
    x"aa",x"20",x"3e",x"fe",x"f6",                   -- deb9 |   shl [A], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"c0",x"53",x"77",x"f1", -- debe |   jne [0xaa], 0x53c0, ${fail}:rel + PC
    x"a6",x"fe",x"fe",x"e4",x"de",x"fa",             -- dec8 |   ishr [G], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"01",x"67",x"f1", -- dece |   jne [0x155], 0x1, ${fail}:rel + PC
    x"ae",x"21",x"e0",x"2a",x"39",x"30",             -- ded7 |   and [A*2], 0x3039, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"21",x"58",x"f1", -- dedd |   jne [0x154], 0x21, ${fail}:rel + PC
    x"a6",x"21",x"21",x"1c",x"85",                   -- dee6 |   ishr [A*2], A*2, -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"0a",x"4a",x"f1", -- deeb |   jne [0x154], 0xa, ${fail}:rel + PC
    x"b6",x"fe",x"21",x"e0",x"39",x"30",             -- def4 |   xor [G], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"6d",x"31",x"3b",x"f1", -- defa |   jne [0x155], 0x316d, ${fail}:rel + PC
    x"86",x"2a",x"3e",x"2a",x"f6",                   -- df04 |   sub [A*4 + B], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"3b",x"ff",x"2c",x"f1", -- df09 |   jne [0x363], 0xff3b, ${fail}:rel + PC
    x"b2",x"e0",x"fe",x"1c",x"39",x"30",x"85",       -- df13 |   or [0x3039], G, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"d5",x"1b",x"f1", -- df1a |   jne [0x3039], 0xd5, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"20",x"f6",                   -- df23 |   shl [A*4 + B], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"78",x"0d",x"f1", -- df28 |   jne [0x363], 0x7800, ${fail}:rel + PC
    x"86",x"e0",x"21",x"20",x"39",x"30",             -- df32 |   sub [0x3039], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"00",x"fd",x"f0", -- df38 |   jne [0x3039], 0xaa, ${fail}:rel + PC
    x"b6",x"e0",x"2a",x"21",x"39",x"30",             -- df42 |   xor [0x3039], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"37",x"02",x"ed",x"f0", -- df48 |   jne [0x3039], 0x237, ${fail}:rel + PC
    x"ae",x"2a",x"e0",x"1c",x"39",x"30",x"85",       -- df52 |   and [A*4 + B], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"01",x"30",x"dc",x"f0", -- df59 |   jne [0x363], 0x3001, ${fail}:rel + PC
    x"8e",x"fe",x"2a",x"e0",x"39",x"30",             -- df63 |   imul [G], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0b",x"51",x"cc",x"f0", -- df69 |   jne [0x155], 0x510b, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"fe",                         -- df73 |   or [A*4 + B], A, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ff",x"01",x"be",x"f0", -- df77 |   jne [0x363], 0x1ff, ${fail}:rel + PC
    x"a6",x"3e",x"e0",x"20",x"f6",x"39",x"30",       -- df81 |   ishr [A*4 + -10], 0x3039, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"0c",x"ad",x"f0", -- df88 |   jne [0x29e], 0xc, ${fail}:rel + PC
    x"aa",x"e0",x"e4",x"e4",x"39",x"30",x"de",x"fa",x"de",x"fa", -- df91 |   shl [0x3039], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"88",x"9a",x"f0", -- df9b |   jne [0x3039], 0x8800, ${fail}:rel + PC
    x"aa",x"20",x"e0",x"fe",x"39",x"30",             -- dfa5 |   shl [A], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"20",x"07",x"8a",x"f0", -- dfab |   jne [0xaa], 0x720, ${fail}:rel + PC
    x"b6",x"fe",x"3e",x"21",x"f6",                   -- dfb5 |   xor [G], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"ca",x"03",x"7b",x"f0", -- dfba |   jne [0x155], 0x3ca, ${fail}:rel + PC
    x"b2",x"2a",x"fe",x"1c",x"85",                   -- dfc4 |   or [A*4 + B], G, -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"d5",x"6c",x"f0", -- dfc9 |   jne [0x363], 0xd5, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"e0",x"f6",x"85",x"39",x"30", -- dfd2 |   sub [A*4 + -10], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"4c",x"cf",x"5b",x"f0", -- dfda |   jne [0x29e], 0xcf4c, ${fail}:rel + PC
    x"aa",x"21",x"21",x"21",                         -- dfe4 |   shl [A*2], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"40",x"15",x"4d",x"f0", -- dfe8 |   jne [0x154], 0x1540, ${fail}:rel + PC
    x"86",x"e0",x"e4",x"e0",x"39",x"30",x"de",x"fa",x"39",x"30", -- dff2 |   sub [0x3039], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"4f",x"cb",x"39",x"f0", -- dffc |   jne [0x3039], 0xcb4f, ${fail}:rel + PC
    x"a2",x"21",x"e0",x"1c",x"39",x"30",x"85",       -- e006 |   shr [A*2], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"81",x"01",x"28",x"f0", -- e00d |   jne [0x154], 0x181, ${fail}:rel + PC
    x"a6",x"e0",x"e4",x"20",x"39",x"30",x"de",x"fa", -- e017 |   ishr [0x3039], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"fe",x"16",x"f0", -- e01f |   jne [0x3039], 0xfe, ${fail}:rel + PC
    x"b6",x"3e",x"e4",x"e0",x"f6",x"de",x"fa",x"39",x"30", -- e028 |   xor [A*4 + -10], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b1",x"cb",x"04",x"f0", -- e031 |   jne [0x29e], 0xcbb1, ${fail}:rel + PC
    x"86",x"3e",x"21",x"3e",x"f6",x"f6",             -- e03b |   sub [A*4 + -10], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"b6",x"fe",x"f4",x"ef", -- e041 |   jne [0x29e], 0xfeb6, ${fail}:rel + PC
    x"8e",x"fe",x"1c",x"3e",x"85",x"f6",             -- e04b |   imul [G], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"16",x"be",x"e4",x"ef", -- e051 |   jne [0x155], 0xbe16, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"2a",                         -- e05b |   shl [A], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"18",x"1b",x"d6",x"ef", -- e05f |   jne [0xaa], 0x1b18, ${fail}:rel + PC
    x"b6",x"e0",x"21",x"2a",x"39",x"30",             -- e069 |   xor [0x3039], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"37",x"02",x"c6",x"ef", -- e06f |   jne [0x3039], 0x237, ${fail}:rel + PC
    x"82",x"21",x"21",x"e0",x"39",x"30",             -- e079 |   add [A*2], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"8d",x"31",x"b6",x"ef", -- e07f |   jne [0x154], 0x318d, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"20",                         -- e089 |   and [A*2], A*4 + B, A
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"22",x"a8",x"ef", -- e08d |   jne [0x154], 0x22, ${fail}:rel + PC
    x"aa",x"20",x"2a",x"e4",x"de",x"fa",             -- e096 |   shl [A], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"63",x"99",x"ef", -- e09c |   jne [0xaa], 0x6300, ${fail}:rel + PC
    x"ae",x"2a",x"fe",x"20",                         -- e0a6 |   and [A*4 + B], G, A
    x"ee",x"e0",x"00",x"f8",x"63",x"03",x"8b",x"ef", -- e0aa |   jne [0x363], 0, ${fail}:rel + PC
    x"b6",x"fe",x"21",x"1c",x"85",                   -- e0b2 |   xor [G], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"d1",x"fe",x"7e",x"ef", -- e0b7 |   jne [0x155], 0xfed1, ${fail}:rel + PC
    x"ae",x"e0",x"fe",x"21",x"39",x"30",             -- e0c1 |   and [0x3039], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"6e",x"ef", -- e0c7 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"b2",x"3e",x"e0",x"2a",x"f6",x"39",x"30",       -- e0d1 |   or [A*4 + -10], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"7b",x"33",x"5d",x"ef", -- e0d8 |   jne [0x29e], 0x337b, ${fail}:rel + PC
    x"b6",x"fe",x"e4",x"3e",x"de",x"fa",x"f6",       -- e0e2 |   xor [G], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"16",x"f9",x"4c",x"ef", -- e0e9 |   jne [0x155], 0xf916, ${fail}:rel + PC
    x"8e",x"2a",x"21",x"2a",                         -- e0f3 |   imul [A*4 + B], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"7c",x"7f",x"3e",x"ef", -- e0f7 |   jne [0x363], 0x7f7c, ${fail}:rel + PC
    x"a6",x"fe",x"21",x"fe",                         -- e101 |   ishr [G], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"0a",x"30",x"ef", -- e105 |   jne [0x155], 0xa, ${fail}:rel + PC
    x"8a",x"21",x"1c",x"1c",x"85",x"85",             -- e10e |   mul [A*2], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"19",x"3b",x"21",x"ef", -- e114 |   jne [0x154], 0x3b19, ${fail}:rel + PC
    x"8e",x"2a",x"e4",x"20",x"de",x"fa",             -- e11e |   imul [A*4 + B], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"50",x"08",x"11",x"ef", -- e124 |   jne [0x363], 0x850, ${fail}:rel + PC
    x"a2",x"3e",x"3e",x"3e",x"f6",x"f6",x"f6",       -- e12e |   shr [A*4 + -10], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"9e",x"02",x"00",x"ef", -- e135 |   jne [0x29e], 0, ${fail}:rel + PC
    x"8a",x"20",x"1c",x"e4",x"85",x"de",x"fa",       -- e13d |   mul [A], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a8",x"25",x"f1",x"ee", -- e144 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
    x"a6",x"3e",x"20",x"21",x"f6",                   -- e14e |   ishr [A*4 + -10], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"0a",x"e2",x"ee", -- e153 |   jne [0x29e], 0xa, ${fail}:rel + PC
    x"b2",x"3e",x"20",x"20",x"f6",                   -- e15c |   or [A*4 + -10], A, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"aa",x"00",x"d4",x"ee", -- e161 |   jne [0x29e], 0xaa, ${fail}:rel + PC
    x"82",x"e0",x"fe",x"e0",x"39",x"30",x"39",x"30", -- e16b |   add [0x3039], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"8e",x"31",x"c2",x"ee", -- e173 |   jne [0x3039], 0x318e, ${fail}:rel + PC
    x"8e",x"3e",x"e0",x"3e",x"f6",x"39",x"30",x"f6", -- e17d |   imul [A*4 + -10], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"2e",x"35",x"b0",x"ee", -- e185 |   jne [0x29e], 0x352e, ${fail}:rel + PC
    x"a6",x"fe",x"fe",x"21",                         -- e18f |   ishr [G], G, A*2
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"15",x"a2",x"ee", -- e193 |   jne [0x155], 0x15, ${fail}:rel + PC
    x"8e",x"20",x"e4",x"3e",x"de",x"fa",x"f6",       -- e19c |   imul [A], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"f0",x"4d",x"92",x"ee", -- e1a3 |   jne [0xaa], 0x4df0, ${fail}:rel + PC
    x"a6",x"fe",x"20",x"fe",                         -- e1ad |   ishr [G], A, G
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"05",x"84",x"ee", -- e1b1 |   jne [0x155], 0x5, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"3e",x"39",x"30",x"f6",       -- e1ba |   add [A*4 + B], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d7",x"32",x"74",x"ee", -- e1c1 |   jne [0x363], 0x32d7, ${fail}:rel + PC
    x"ae",x"3e",x"2a",x"e4",x"f6",x"de",x"fa",       -- e1cb |   and [A*4 + -10], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"03",x"63",x"ee", -- e1d2 |   jne [0x29e], 0x300, ${fail}:rel + PC
    x"8e",x"20",x"1c",x"2a",x"85",                   -- e1dc |   imul [A], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"6f",x"5f",x"54",x"ee", -- e1e1 |   jne [0xaa], 0x5f6f, ${fail}:rel + PC
    x"a2",x"fe",x"3e",x"e4",x"f6",x"de",x"fa",       -- e1eb |   shr [G], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"02",x"43",x"ee", -- e1f2 |   jne [0x155], 0x2, ${fail}:rel + PC
    x"b2",x"2a",x"e0",x"20",x"39",x"30",             -- e1fb |   or [A*4 + B], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"bb",x"30",x"34",x"ee", -- e201 |   jne [0x363], 0x30bb, ${fail}:rel + PC
    x"b6",x"2a",x"e0",x"fe",x"39",x"30",             -- e20b |   xor [A*4 + B], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"6c",x"31",x"24",x"ee", -- e211 |   jne [0x363], 0x316c, ${fail}:rel + PC
    x"8e",x"20",x"20",x"e0",x"39",x"30",             -- e21b |   imul [A], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"da",x"05",x"14",x"ee", -- e221 |   jne [0xaa], 0x5da, ${fail}:rel + PC
    x"b2",x"21",x"2a",x"3e",x"f6",                   -- e22b |   or [A*2], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"03",x"05",x"ee", -- e230 |   jne [0x154], 0x3ff, ${fail}:rel + PC
    x"aa",x"fe",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- e23a |   shl [G], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"10",x"f3",x"ed", -- e242 |   jne [0x155], 0x1000, ${fail}:rel + PC
    x"a6",x"2a",x"e4",x"2a",x"de",x"fa",             -- e24c |   ishr [A*4 + B], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"71",x"ff",x"e3",x"ed", -- e252 |   jne [0x363], 0xff71, ${fail}:rel + PC
    x"aa",x"3e",x"e4",x"1c",x"f6",x"de",x"fa",x"85", -- e25c |   shl [A*4 + -10], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"71",x"d1",x"ed", -- e264 |   jne [0x29e], 0x7100, ${fail}:rel + PC
    x"a2",x"3e",x"e4",x"20",x"f6",x"de",x"fa",       -- e26e |   shr [A*4 + -10], 0xfade + A, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"3e",x"c0",x"ed", -- e275 |   jne [0x29e], 0x3e, ${fail}:rel + PC
    x"8a",x"3e",x"20",x"2a",x"f6",                   -- e27e |   mul [A*4 + -10], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"be",x"3f",x"b2",x"ed", -- e283 |   jne [0x29e], 0x3fbe, ${fail}:rel + PC
    x"b2",x"21",x"3e",x"2a",x"f6",                   -- e28d |   or [A*2], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"03",x"a3",x"ed", -- e292 |   jne [0x154], 0x3ff, ${fail}:rel + PC
    x"8e",x"3e",x"21",x"1c",x"f6",x"85",             -- e29c |   imul [A*4 + -10], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"a4",x"5c",x"93",x"ed", -- e2a2 |   jne [0x29e], 0x5ca4, ${fail}:rel + PC
    x"aa",x"e0",x"3e",x"21",x"39",x"30",x"f6",       -- e2ac |   shl [0x3039], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"e0",x"29",x"82",x"ed", -- e2b3 |   jne [0x3039], 0x29e0, ${fail}:rel + PC
    x"aa",x"21",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- e2bd |   shl [A*2], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"88",x"70",x"ed", -- e2c5 |   jne [0x154], 0x8800, ${fail}:rel + PC
    x"82",x"fe",x"21",x"21",                         -- e2cf |   add [G], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"a8",x"02",x"62",x"ed", -- e2d3 |   jne [0x155], 0x2a8, ${fail}:rel + PC
    x"ae",x"21",x"e4",x"fe",x"de",x"fa",             -- e2dd |   and [A*2], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"01",x"52",x"ed", -- e2e3 |   jne [0x154], 0x100, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"e0",x"f6",x"39",x"30",x"39",x"30", -- e2ed |   and [A*4 + -10], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"39",x"30",x"3f",x"ed", -- e2f6 |   jne [0x29e], 0x3039, ${fail}:rel + PC
    x"aa",x"3e",x"20",x"1c",x"f6",x"85",             -- e300 |   shl [A*4 + -10], A, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"40",x"15",x"2f",x"ed", -- e306 |   jne [0x29e], 0x1540, ${fail}:rel + PC
    x"ae",x"2a",x"3e",x"e4",x"f6",x"de",x"fa",       -- e310 |   and [A*4 + B], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"88",x"02",x"1e",x"ed", -- e317 |   jne [0x363], 0x288, ${fail}:rel + PC
    x"82",x"fe",x"1c",x"1c",x"85",x"85",             -- e321 |   add [G], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"0a",x"ff",x"0e",x"ed", -- e327 |   jne [0x155], 0xff0a, ${fail}:rel + PC
    x"8a",x"20",x"20",x"e4",x"de",x"fa",             -- e331 |   mul [A], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"50",x"08",x"fe",x"ec", -- e337 |   jne [0xaa], 0x850, ${fail}:rel + PC
    x"b2",x"21",x"2a",x"fe",                         -- e341 |   or [A*2], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"77",x"03",x"f0",x"ec", -- e345 |   jne [0x154], 0x377, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- e34f |   sub [G], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"de",x"ec", -- e357 |   jne [0x155], 0, ${fail}:rel + PC
    x"a2",x"2a",x"fe",x"e4",x"de",x"fa",             -- e35f |   shr [A*4 + B], G, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"d0",x"ec", -- e365 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"86",x"21",x"1c",x"fe",x"85",                   -- e36e |   sub [A*2], -123, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"30",x"fe",x"c2",x"ec", -- e373 |   jne [0x154], 0xfe30, ${fail}:rel + PC
    x"aa",x"3e",x"21",x"fe",x"f6",                   -- e37d |   shl [A*4 + -10], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"80",x"2a",x"b3",x"ec", -- e382 |   jne [0x29e], 0x2a80, ${fail}:rel + PC
    x"aa",x"20",x"1c",x"3e",x"85",x"f6",             -- e38c |   shl [A], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"40",x"a3",x"ec", -- e392 |   jne [0xaa], 0x4000, ${fail}:rel + PC
    x"8a",x"3e",x"2a",x"21",x"f6",                   -- e39c |   mul [A*4 + -10], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"7c",x"7f",x"94",x"ec", -- e3a1 |   jne [0x29e], 0x7f7c, ${fail}:rel + PC
    x"a2",x"20",x"2a",x"fe",                         -- e3ab |   shr [A], A*4 + B, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"1b",x"86",x"ec", -- e3af |   jne [0xaa], 0x1b, ${fail}:rel + PC
    x"82",x"20",x"2a",x"e0",x"39",x"30",             -- e3b8 |   add [A], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9c",x"33",x"77",x"ec", -- e3be |   jne [0xaa], 0x339c, ${fail}:rel + PC
    x"b6",x"fe",x"e0",x"1c",x"39",x"30",x"85",       -- e3c8 |   xor [G], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"bc",x"cf",x"66",x"ec", -- e3cf |   jne [0x155], 0xcfbc, ${fail}:rel + PC
    x"86",x"20",x"e4",x"2a",x"de",x"fa",             -- e3d9 |   sub [A], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"25",x"f8",x"56",x"ec", -- e3df |   jne [0xaa], 0xf825, ${fail}:rel + PC
    x"a6",x"2a",x"21",x"fe",                         -- e3e9 |   ishr [A*4 + B], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"0a",x"48",x"ec", -- e3ed |   jne [0x363], 0xa, ${fail}:rel + PC
    x"b2",x"21",x"fe",x"e4",x"de",x"fa",             -- e3f6 |   or [A*2], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"dd",x"fb",x"39",x"ec", -- e3fc |   jne [0x154], 0xfbdd, ${fail}:rel + PC
    x"8a",x"e0",x"e4",x"fe",x"39",x"30",x"de",x"fa", -- e406 |   mul [0x3039], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"28",x"0c",x"27",x"ec", -- e40e |   jne [0x3039], 0xc28, ${fail}:rel + PC
    x"8e",x"2a",x"2a",x"e4",x"de",x"fa",             -- e418 |   imul [A*4 + B], A*4 + B, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"98",x"dd",x"17",x"ec", -- e41e |   jne [0x363], 0xdd98, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"fe",x"39",x"30",             -- e428 |   and [0x3039], A, G
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"07",x"ec", -- e42e |   jne [0x3039], 0, ${fail}:rel + PC
    x"8e",x"fe",x"fe",x"2a",                         -- e436 |   imul [G], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"df",x"82",x"fb",x"eb", -- e43a |   jne [0x155], 0x82df, ${fail}:rel + PC
    x"8e",x"3e",x"21",x"21",x"f6",                   -- e444 |   imul [A*4 + -10], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"90",x"c3",x"ec",x"eb", -- e449 |   jne [0x29e], 0xc390, ${fail}:rel + PC
    x"b2",x"fe",x"e4",x"1c",x"de",x"fa",x"85",       -- e453 |   or [G], 0xfade + A, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"8d",x"db",x"eb", -- e45a |   jne [0x155], 0x8d, ${fail}:rel + PC
    x"8e",x"2a",x"20",x"3e",x"f6",                   -- e463 |   imul [A*4 + B], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ec",x"bc",x"cd",x"eb", -- e468 |   jne [0x363], 0xbcec, ${fail}:rel + PC
    x"a2",x"2a",x"3e",x"e0",x"f6",x"39",x"30",       -- e472 |   shr [A*4 + B], A*4 + -10, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"bc",x"eb", -- e479 |   jne [0x363], 0x1, ${fail}:rel + PC
    x"b6",x"2a",x"21",x"e0",x"39",x"30",             -- e482 |   xor [A*4 + B], A*2, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"6d",x"31",x"ad",x"eb", -- e488 |   jne [0x363], 0x316d, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"e0",x"39",x"30",x"f6",x"39",x"30", -- e492 |   shr [0x3039], A*4 + -10, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"01",x"9a",x"eb", -- e49b |   jne [0x3039], 0x1, ${fail}:rel + PC
    x"a2",x"21",x"1c",x"3e",x"85",x"f6",             -- e4a4 |   shr [A*2], -123, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"03",x"8b",x"eb", -- e4aa |   jne [0x154], 0x3, ${fail}:rel + PC
    x"b2",x"21",x"20",x"21",                         -- e4b3 |   or [A*2], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"fe",x"01",x"7e",x"eb", -- e4b7 |   jne [0x154], 0x1fe, ${fail}:rel + PC
    x"a2",x"fe",x"2a",x"21",                         -- e4c1 |   shr [G], A*4 + B, A*2
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"36",x"70",x"eb", -- e4c5 |   jne [0x155], 0x36, ${fail}:rel + PC
    x"b6",x"e0",x"3e",x"2a",x"39",x"30",x"f6",       -- e4ce |   xor [0x3039], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"fd",x"01",x"60",x"eb", -- e4d5 |   jne [0x3039], 0x1fd, ${fail}:rel + PC
    x"8a",x"3e",x"e4",x"3e",x"f6",x"de",x"fa",x"f6", -- e4df |   mul [A*4 + -10], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"f0",x"4d",x"4e",x"eb", -- e4e7 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
    x"8e",x"2a",x"21",x"3e",x"f6",                   -- e4f1 |   imul [A*4 + B], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d8",x"79",x"3f",x"eb", -- e4f6 |   jne [0x363], 0x79d8, ${fail}:rel + PC
    x"a2",x"e0",x"e4",x"3e",x"39",x"30",x"de",x"fa",x"f6", -- e500 |   shr [0x3039], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"03",x"2c",x"eb", -- e509 |   jne [0x3039], 0x3, ${fail}:rel + PC
    x"82",x"3e",x"20",x"fe",x"f6",                   -- e512 |   add [A*4 + -10], A, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ff",x"01",x"1e",x"eb", -- e517 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- e521 |   shr [A*4 + B], 0xfade + A, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"7d",x"0c",x"eb", -- e529 |   jne [0x363], 0x7d, ${fail}:rel + PC
    x"a2",x"3e",x"1c",x"1c",x"f6",x"85",x"85",       -- e532 |   shr [A*4 + -10], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"fc",x"07",x"fc",x"ea", -- e539 |   jne [0x29e], 0x7fc, ${fail}:rel + PC
    x"8e",x"20",x"1c",x"e0",x"85",x"39",x"30",       -- e543 |   imul [A], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9d",x"d4",x"eb",x"ea", -- e54a |   jne [0xaa], 0xd49d, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"21",x"f6",                   -- e554 |   shl [A*4 + B], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"e0",x"29",x"dc",x"ea", -- e559 |   jne [0x363], 0x29e0, ${fail}:rel + PC
    x"b6",x"21",x"e0",x"fe",x"39",x"30",             -- e563 |   xor [A*2], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"6c",x"31",x"cc",x"ea", -- e569 |   jne [0x154], 0x316c, ${fail}:rel + PC
    x"b6",x"e0",x"3e",x"3e",x"39",x"30",x"f6",x"f6", -- e573 |   xor [0x3039], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"ba",x"ea", -- e57b |   jne [0x3039], 0, ${fail}:rel + PC
    x"b6",x"20",x"21",x"1c",x"85",                   -- e583 |   xor [A], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d1",x"fe",x"ad",x"ea", -- e588 |   jne [0xaa], 0xfed1, ${fail}:rel + PC
    x"b6",x"21",x"21",x"fe",                         -- e592 |   xor [A*2], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"01",x"9f",x"ea", -- e596 |   jne [0x154], 0x1, ${fail}:rel + PC
    x"8a",x"fe",x"e0",x"20",x"39",x"30",             -- e59f |   mul [G], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"da",x"05",x"90",x"ea", -- e5a5 |   jne [0x155], 0x5da, ${fail}:rel + PC
    x"b6",x"21",x"e0",x"21",x"39",x"30",             -- e5af |   xor [A*2], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"6d",x"31",x"80",x"ea", -- e5b5 |   jne [0x154], 0x316d, ${fail}:rel + PC
    x"8a",x"21",x"2a",x"e0",x"39",x"30",             -- e5bf |   mul [A*2], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"0b",x"51",x"70",x"ea", -- e5c5 |   jne [0x154], 0x510b, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"1c",x"f6",x"39",x"30",x"85", -- e5cf |   and [A*4 + -10], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"01",x"30",x"5e",x"ea", -- e5d7 |   jne [0x29e], 0x3001, ${fail}:rel + PC
    x"aa",x"fe",x"21",x"20",                         -- e5e1 |   shl [G], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"00",x"50",x"50",x"ea", -- e5e5 |   jne [0x155], 0x5000, ${fail}:rel + PC
    x"ae",x"20",x"e4",x"20",x"de",x"fa",             -- e5ef |   and [A], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"88",x"00",x"40",x"ea", -- e5f5 |   jne [0xaa], 0x88, ${fail}:rel + PC
    x"aa",x"21",x"3e",x"e4",x"f6",x"de",x"fa",       -- e5ff |   shl [A*2], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"9e",x"2f",x"ea", -- e606 |   jne [0x154], 0x9e00, ${fail}:rel + PC
    x"b6",x"e0",x"e0",x"1c",x"39",x"30",x"39",x"30",x"85", -- e610 |   xor [0x3039], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"bc",x"cf",x"1c",x"ea", -- e619 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
    x"8a",x"3e",x"3e",x"1c",x"f6",x"f6",x"85",       -- e623 |   mul [A*4 + -10], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"16",x"be",x"0b",x"ea", -- e62a |   jne [0x29e], 0xbe16, ${fail}:rel + PC
    x"86",x"fe",x"21",x"3e",x"f6",                   -- e634 |   sub [G], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"b6",x"fe",x"fc",x"e9", -- e639 |   jne [0x155], 0xfeb6, ${fail}:rel + PC
    x"86",x"3e",x"2a",x"fe",x"f6",                   -- e643 |   sub [A*4 + -10], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"0e",x"02",x"ed",x"e9", -- e648 |   jne [0x29e], 0x20e, ${fail}:rel + PC
    x"b6",x"3e",x"1c",x"fe",x"f6",x"85",             -- e652 |   xor [A*4 + -10], -123, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"d0",x"fe",x"dd",x"e9", -- e658 |   jne [0x29e], 0xfed0, ${fail}:rel + PC
    x"86",x"20",x"2a",x"1c",x"85",                   -- e662 |   sub [A], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"de",x"03",x"ce",x"e9", -- e667 |   jne [0xaa], 0x3de, ${fail}:rel + PC
    x"86",x"20",x"21",x"fe",                         -- e671 |   sub [A], A*2, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"ff",x"c0",x"e9", -- e675 |   jne [0xaa], 0xff, ${fail}:rel + PC
    x"86",x"2a",x"20",x"e4",x"de",x"fa",             -- e67e |   sub [A*4 + B], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"22",x"05",x"b1",x"e9", -- e684 |   jne [0x363], 0x522, ${fail}:rel + PC
    x"aa",x"e0",x"fe",x"3e",x"39",x"30",x"f6",       -- e68e |   shl [0x3039], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"40",x"a0",x"e9", -- e695 |   jne [0x3039], 0x4000, ${fail}:rel + PC
    x"ae",x"20",x"1c",x"1c",x"85",x"85",             -- e69f |   and [A], -123, -123
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"85",x"90",x"e9", -- e6a5 |   jne [0xaa], 0x85, ${fail}:rel + PC
    x"b6",x"20",x"fe",x"e0",x"39",x"30",             -- e6ae |   xor [A], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"6c",x"31",x"81",x"e9", -- e6b4 |   jne [0xaa], 0x316c, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"3e",x"39",x"30",x"f6",       -- e6be |   or [0x3039], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"de",x"03",x"70",x"e9", -- e6c5 |   jne [0x3039], 0x3de, ${fail}:rel + PC
    x"b2",x"20",x"e4",x"21",x"de",x"fa",             -- e6cf |   or [A], 0xfade + A, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"fb",x"60",x"e9", -- e6d5 |   jne [0xaa], 0xfbdc, ${fail}:rel + PC
    x"b6",x"fe",x"3e",x"3e",x"f6",x"f6",             -- e6df |   xor [G], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"55",x"01",x"50",x"e9", -- e6e5 |   jne [0x155], 0, ${fail}:rel + PC
    x"b6",x"3e",x"20",x"e4",x"f6",x"de",x"fa",       -- e6ed |   xor [A*4 + -10], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"22",x"fb",x"41",x"e9", -- e6f4 |   jne [0x29e], 0xfb22, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"e0",x"39",x"30",x"85",x"39",x"30", -- e6fe |   xor [0x3039], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"bc",x"cf",x"2e",x"e9", -- e707 |   jne [0x3039], 0xcfbc, ${fail}:rel + PC
    x"a2",x"3e",x"fe",x"2a",x"f6",                   -- e711 |   shr [A*4 + -10], G, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"2a",x"1f",x"e9", -- e716 |   jne [0x29e], 0x2a, ${fail}:rel + PC
    x"ae",x"20",x"fe",x"20",                         -- e71f |   and [A], G, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"12",x"e9", -- e723 |   jne [0xaa], 0, ${fail}:rel + PC
    x"86",x"2a",x"e4",x"1c",x"de",x"fa",x"85",       -- e72b |   sub [A*4 + B], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"03",x"fc",x"03",x"e9", -- e732 |   jne [0x363], 0xfc03, ${fail}:rel + PC
    x"ae",x"e0",x"21",x"21",x"39",x"30",             -- e73c |   and [0x3039], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"f3",x"e8", -- e742 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"a2",x"e0",x"20",x"e0",x"39",x"30",x"39",x"30", -- e74c |   shr [0x3039], A, 0x3039
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"e1",x"e8", -- e754 |   jne [0x3039], 0, ${fail}:rel + PC
    x"8e",x"3e",x"2a",x"3e",x"f6",x"f6",             -- e75c |   imul [A*4 + -10], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"1a",x"dd",x"d3",x"e8", -- e762 |   jne [0x29e], 0xdd1a, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"1c",x"39",x"30",x"f6",x"85", -- e76c |   shr [0x3039], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"14",x"c1",x"e8", -- e774 |   jne [0x3039], 0x14, ${fail}:rel + PC
    x"82",x"fe",x"20",x"e0",x"39",x"30",             -- e77d |   add [G], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"e3",x"30",x"b2",x"e8", -- e783 |   jne [0x155], 0x30e3, ${fail}:rel + PC
    x"a6",x"e0",x"21",x"e0",x"39",x"30",x"39",x"30", -- e78d |   ishr [0x3039], A*2, 0x3039
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"a0",x"e8", -- e795 |   jne [0x3039], 0, ${fail}:rel + PC
    x"a6",x"e0",x"e4",x"1c",x"39",x"30",x"de",x"fa",x"85", -- e79d |   ishr [0x3039], 0xfade + A, -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"dc",x"8f",x"e8", -- e7a6 |   jne [0x3039], 0xdc, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"20",x"f6",                   -- e7af |   or [A*4 + -10], G, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"ff",x"01",x"81",x"e8", -- e7b4 |   jne [0x29e], 0x1ff, ${fail}:rel + PC
    x"a6",x"2a",x"2a",x"20",                         -- e7be |   ishr [A*4 + B], A*4 + B, A
    x"ee",x"e0",x"00",x"f8",x"63",x"03",x"73",x"e8", -- e7c2 |   jne [0x363], 0, ${fail}:rel + PC
    x"aa",x"fe",x"e0",x"2a",x"39",x"30",             -- e7ca |   shl [G], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"c8",x"81",x"65",x"e8", -- e7d0 |   jne [0x155], 0x81c8, ${fail}:rel + PC
    x"8a",x"21",x"3e",x"20",x"f6",                   -- e7da |   mul [A*2], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ec",x"bc",x"56",x"e8", -- e7df |   jne [0x154], 0xbcec, ${fail}:rel + PC
    x"8e",x"3e",x"3e",x"e0",x"f6",x"f6",x"39",x"30", -- e7e9 |   imul [A*4 + -10], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"2e",x"35",x"44",x"e8", -- e7f1 |   jne [0x29e], 0x352e, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"3e",x"39",x"30",x"85",x"f6", -- e7fb |   xor [0x3039], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"1b",x"fd",x"32",x"e8", -- e803 |   jne [0x3039], 0xfd1b, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"e4",x"de",x"fa",             -- e80d |   or [G], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"fb",x"22",x"e8", -- e813 |   jne [0x155], 0xfbaa, ${fail}:rel + PC
    x"8e",x"fe",x"fe",x"3e",x"f6",                   -- e81d |   imul [G], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"76",x"7c",x"13",x"e8", -- e822 |   jne [0x155], 0x7c76, ${fail}:rel + PC
    x"8a",x"20",x"e0",x"3e",x"39",x"30",x"f6",       -- e82c |   mul [A], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"2e",x"35",x"02",x"e8", -- e833 |   jne [0xaa], 0x352e, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"20",                         -- e83d |   or [G], A, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"00",x"f4",x"e7", -- e841 |   jne [0x155], 0xaa, ${fail}:rel + PC
    x"a2",x"3e",x"21",x"e4",x"f6",x"de",x"fa",       -- e84b |   shr [A*4 + -10], A*2, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"01",x"e3",x"e7", -- e852 |   jne [0x29e], 0x1, ${fail}:rel + PC
    x"a6",x"20",x"3e",x"2a",x"f6",                   -- e85b |   ishr [A], A*4 + -10, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"53",x"d5",x"e7", -- e860 |   jne [0xaa], 0x53, ${fail}:rel + PC
    x"82",x"20",x"e0",x"20",x"39",x"30",             -- e869 |   add [A], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"e3",x"30",x"c6",x"e7", -- e86f |   jne [0xaa], 0x30e3, ${fail}:rel + PC
    x"a6",x"20",x"1c",x"20",x"85",                   -- e879 |   ishr [A], -123, A
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"ff",x"b7",x"e7", -- e87e |   jne [0xaa], 0xff, ${fail}:rel + PC
    x"ae",x"21",x"20",x"1c",x"85",                   -- e887 |   and [A*2], A, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"80",x"00",x"a9",x"e7", -- e88c |   jne [0x154], 0x80, ${fail}:rel + PC
    x"b6",x"2a",x"1c",x"e4",x"85",x"de",x"fa",       -- e896 |   xor [A*4 + B], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"0d",x"04",x"98",x"e7", -- e89d |   jne [0x363], 0x40d, ${fail}:rel + PC
    x"82",x"20",x"e0",x"21",x"39",x"30",             -- e8a7 |   add [A], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"8d",x"31",x"88",x"e7", -- e8ad |   jne [0xaa], 0x318d, ${fail}:rel + PC
    x"82",x"21",x"fe",x"2a",                         -- e8b7 |   add [A*2], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b8",x"04",x"7a",x"e7", -- e8bb |   jne [0x154], 0x4b8, ${fail}:rel + PC
    x"b2",x"20",x"2a",x"20",                         -- e8c5 |   or [A], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"eb",x"03",x"6c",x"e7", -- e8c9 |   jne [0xaa], 0x3eb, ${fail}:rel + PC
    x"82",x"21",x"1c",x"e0",x"85",x"39",x"30",       -- e8d3 |   add [A*2], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"be",x"2f",x"5b",x"e7", -- e8da |   jne [0x154], 0x2fbe, ${fail}:rel + PC
    x"aa",x"fe",x"2a",x"1c",x"85",                   -- e8e4 |   shl [G], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"60",x"6c",x"4c",x"e7", -- e8e9 |   jne [0x155], 0x6c60, ${fail}:rel + PC
    x"82",x"3e",x"3e",x"2a",x"f6",x"f6",             -- e8f3 |   add [A*4 + -10], A*4 + -10, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"01",x"06",x"3c",x"e7", -- e8f9 |   jne [0x29e], 0x601, ${fail}:rel + PC
    x"b2",x"20",x"3e",x"e4",x"f6",x"de",x"fa",       -- e903 |   or [A], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9e",x"fb",x"2b",x"e7", -- e90a |   jne [0xaa], 0xfb9e, ${fail}:rel + PC
    x"aa",x"2a",x"21",x"1c",x"85",                   -- e914 |   shl [A*4 + B], A*2, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"80",x"2a",x"1c",x"e7", -- e919 |   jne [0x363], 0x2a80, ${fail}:rel + PC
    x"b2",x"e0",x"1c",x"2a",x"39",x"30",x"85",       -- e923 |   or [0x3039], -123, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"e7",x"0b",x"e7", -- e92a |   jne [0x3039], 0xe7, ${fail}:rel + PC
    x"82",x"21",x"2a",x"2a",                         -- e933 |   add [A*2], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"c6",x"06",x"fe",x"e6", -- e937 |   jne [0x154], 0x6c6, ${fail}:rel + PC
    x"ae",x"20",x"21",x"20",                         -- e941 |   and [A], A*2, A
    x"ee",x"e0",x"00",x"f8",x"aa",x"00",x"f0",x"e6", -- e945 |   jne [0xaa], 0, ${fail}:rel + PC
    x"86",x"20",x"fe",x"1c",x"85",                   -- e94d |   sub [A], G, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d0",x"01",x"e3",x"e6", -- e952 |   jne [0xaa], 0x1d0, ${fail}:rel + PC
    x"b2",x"20",x"2a",x"3e",x"f6",                   -- e95c |   or [A], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ff",x"03",x"d4",x"e6", -- e961 |   jne [0xaa], 0x3ff, ${fail}:rel + PC
    x"b6",x"2a",x"20",x"2a",                         -- e96b |   xor [A*4 + B], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"c9",x"03",x"c6",x"e6", -- e96f |   jne [0x363], 0x3c9, ${fail}:rel + PC
    x"aa",x"21",x"fe",x"3e",x"f6",                   -- e979 |   shl [A*2], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"00",x"40",x"b7",x"e6", -- e97e |   jne [0x154], 0x4000, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"21",x"f6",x"39",x"30",       -- e988 |   and [A*4 + -10], 0x3039, A*2
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"10",x"a6",x"e6", -- e98f |   jne [0x29e], 0x10, ${fail}:rel + PC
    x"a2",x"e0",x"2a",x"e4",x"39",x"30",x"de",x"fa", -- e998 |   shr [0x3039], A*4 + B, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"03",x"95",x"e6", -- e9a0 |   jne [0x3039], 0x3, ${fail}:rel + PC
    x"8a",x"fe",x"21",x"2a",                         -- e9a9 |   mul [G], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"7c",x"7f",x"88",x"e6", -- e9ad |   jne [0x155], 0x7f7c, ${fail}:rel + PC
    x"a2",x"3e",x"3e",x"fe",x"f6",x"f6",             -- e9b7 |   shr [A*4 + -10], A*4 + -10, G
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"14",x"78",x"e6", -- e9bd |   jne [0x29e], 0x14, ${fail}:rel + PC
    x"8a",x"20",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- e9c6 |   mul [A], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"48",x"81",x"67",x"e6", -- e9ce |   jne [0xaa], 0x8148, ${fail}:rel + PC
    x"8a",x"2a",x"1c",x"3e",x"85",x"f6",             -- e9d8 |   mul [A*4 + B], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"16",x"be",x"57",x"e6", -- e9de |   jne [0x363], 0xbe16, ${fail}:rel + PC
    x"ae",x"2a",x"1c",x"fe",x"85",                   -- e9e8 |   and [A*4 + B], -123, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"05",x"01",x"48",x"e6", -- e9ed |   jne [0x363], 0x105, ${fail}:rel + PC
    x"aa",x"e0",x"e0",x"20",x"39",x"30",x"39",x"30", -- e9f7 |   shl [0x3039], 0x3039, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"e4",x"36",x"e6", -- e9ff |   jne [0x3039], 0xe400, ${fail}:rel + PC
    x"8e",x"20",x"fe",x"2a",                         -- ea09 |   imul [A], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"df",x"82",x"28",x"e6", -- ea0d |   jne [0xaa], 0x82df, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"3e",x"f6",x"85",x"f6",       -- ea17 |   sub [A*4 + -10], -123, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e7",x"fc",x"17",x"e6", -- ea1e |   jne [0x29e], 0xfce7, ${fail}:rel + PC
    x"aa",x"21",x"20",x"2a",                         -- ea28 |   shl [A*2], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"50",x"05",x"09",x"e6", -- ea2c |   jne [0x154], 0x550, ${fail}:rel + PC
    x"82",x"20",x"3e",x"21",x"f6",                   -- ea36 |   add [A], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"f2",x"03",x"fa",x"e5", -- ea3b |   jne [0xaa], 0x3f2, ${fail}:rel + PC
    x"8a",x"21",x"fe",x"1c",x"85",                   -- ea45 |   mul [A*2], G, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"29",x"5c",x"eb",x"e5", -- ea4a |   jne [0x154], 0x5c29, ${fail}:rel + PC
    x"8a",x"fe",x"1c",x"e0",x"85",x"39",x"30",       -- ea54 |   mul [G], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"9d",x"d4",x"da",x"e5", -- ea5b |   jne [0x155], 0xd49d, ${fail}:rel + PC
    x"a6",x"e0",x"2a",x"2a",x"39",x"30",             -- ea65 |   ishr [0x3039], A*4 + B, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"6c",x"ca",x"e5", -- ea6b |   jne [0x3039], 0x6c, ${fail}:rel + PC
    x"82",x"2a",x"1c",x"21",x"85",                   -- ea74 |   add [A*4 + B], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"d9",x"00",x"bc",x"e5", -- ea79 |   jne [0x363], 0xd9, ${fail}:rel + PC
    x"8a",x"e0",x"e0",x"fe",x"39",x"30",x"39",x"30", -- ea83 |   mul [0x3039], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"ed",x"3b",x"aa",x"e5", -- ea8b |   jne [0x3039], 0x3bed, ${fail}:rel + PC
    x"b2",x"e0",x"2a",x"fe",x"39",x"30",             -- ea95 |   or [0x3039], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"77",x"03",x"9a",x"e5", -- ea9b |   jne [0x3039], 0x377, ${fail}:rel + PC
    x"aa",x"2a",x"1c",x"e0",x"85",x"39",x"30",       -- eaa5 |   shl [A*4 + B], -123, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"0a",x"89",x"e5", -- eaac |   jne [0x363], 0xa00, ${fail}:rel + PC
    x"8a",x"fe",x"1c",x"2a",x"85",                   -- eab6 |   mul [G], -123, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"6f",x"5f",x"7a",x"e5", -- eabb |   jne [0x155], 0x5f6f, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"fe",x"f6",x"39",x"30",       -- eac5 |   and [A*4 + -10], 0x3039, G
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"11",x"69",x"e5", -- eacc |   jne [0x29e], 0x11, ${fail}:rel + PC
    x"a6",x"2a",x"21",x"e4",x"de",x"fa",             -- ead5 |   ishr [A*4 + B], A*2, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"01",x"5a",x"e5", -- eadb |   jne [0x363], 0x1, ${fail}:rel + PC
    x"b2",x"21",x"21",x"2a",                         -- eae4 |   or [A*2], A*2, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"77",x"03",x"4d",x"e5", -- eae8 |   jne [0x154], 0x377, ${fail}:rel + PC
    x"ae",x"2a",x"fe",x"fe",                         -- eaf2 |   and [A*4 + B], G, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"55",x"01",x"3f",x"e5", -- eaf6 |   jne [0x363], 0x155, ${fail}:rel + PC
    x"aa",x"2a",x"3e",x"3e",x"f6",x"f6",             -- eb00 |   shl [A*4 + B], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"80",x"2f",x"e5", -- eb06 |   jne [0x363], 0x8000, ${fail}:rel + PC
    x"86",x"3e",x"2a",x"1c",x"f6",x"85",             -- eb10 |   sub [A*4 + -10], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"de",x"03",x"1f",x"e5", -- eb16 |   jne [0x29e], 0x3de, ${fail}:rel + PC
    x"ae",x"fe",x"fe",x"1c",x"85",                   -- eb20 |   and [G], G, -123
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"05",x"01",x"10",x"e5", -- eb25 |   jne [0x155], 0x105, ${fail}:rel + PC
    x"a6",x"21",x"3e",x"1c",x"f6",x"85",             -- eb2f |   ishr [A*2], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"14",x"00",x"e5", -- eb35 |   jne [0x154], 0x14, ${fail}:rel + PC
    x"b2",x"e0",x"21",x"fe",x"39",x"30",             -- eb3e |   or [0x3039], A*2, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"55",x"01",x"f1",x"e4", -- eb44 |   jne [0x3039], 0x155, ${fail}:rel + PC
    x"b2",x"2a",x"20",x"21",                         -- eb4e |   or [A*4 + B], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"fe",x"01",x"e3",x"e4", -- eb52 |   jne [0x363], 0x1fe, ${fail}:rel + PC
    x"a2",x"21",x"20",x"e0",x"39",x"30",             -- eb5c |   shr [A*2], A, 0x3039
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"d3",x"e4", -- eb62 |   jne [0x154], 0, ${fail}:rel + PC
    x"8e",x"3e",x"3e",x"e4",x"f6",x"f6",x"de",x"fa", -- eb6a |   imul [A*4 + -10], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"f0",x"4d",x"c3",x"e4", -- eb72 |   jne [0x29e], 0x4df0, ${fail}:rel + PC
    x"a2",x"2a",x"3e",x"fe",x"f6",                   -- eb7c |   shr [A*4 + B], A*4 + -10, G
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"14",x"b4",x"e4", -- eb81 |   jne [0x363], 0x14, ${fail}:rel + PC
    x"aa",x"e0",x"2a",x"1c",x"39",x"30",x"85",       -- eb8a |   shl [0x3039], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"60",x"6c",x"a4",x"e4", -- eb91 |   jne [0x3039], 0x6c60, ${fail}:rel + PC
    x"86",x"e0",x"3e",x"20",x"39",x"30",x"f6",       -- eb9b |   sub [0x3039], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"f4",x"01",x"93",x"e4", -- eba2 |   jne [0x3039], 0x1f4, ${fail}:rel + PC
    x"86",x"fe",x"3e",x"fe",x"f6",                   -- ebac |   sub [G], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"49",x"01",x"84",x"e4", -- ebb1 |   jne [0x155], 0x149, ${fail}:rel + PC
    x"b6",x"20",x"20",x"2a",                         -- ebbb |   xor [A], A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"c9",x"03",x"76",x"e4", -- ebbf |   jne [0xaa], 0x3c9, ${fail}:rel + PC
    x"a2",x"20",x"21",x"21",                         -- ebc9 |   shr [A], A*2, A*2
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"15",x"68",x"e4", -- ebcd |   jne [0xaa], 0x15, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"21",x"39",x"30",             -- ebd6 |   add [A*4 + B], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"8d",x"31",x"59",x"e4", -- ebdc |   jne [0x363], 0x318d, ${fail}:rel + PC
    x"82",x"fe",x"2a",x"2a",                         -- ebe6 |   add [G], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"c6",x"06",x"4b",x"e4", -- ebea |   jne [0x155], 0x6c6, ${fail}:rel + PC
    x"aa",x"2a",x"2a",x"3e",x"f6",                   -- ebf4 |   shl [A*4 + B], A*4 + B, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"c0",x"3c",x"e4", -- ebf9 |   jne [0x363], 0xc000, ${fail}:rel + PC
    x"b6",x"3e",x"2a",x"20",x"f6",                   -- ec03 |   xor [A*4 + -10], A*4 + B, A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"c9",x"03",x"2d",x"e4", -- ec08 |   jne [0x29e], 0x3c9, ${fail}:rel + PC
    x"8a",x"20",x"e4",x"1c",x"de",x"fa",x"85",       -- ec12 |   mul [A], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a8",x"25",x"1c",x"e4", -- ec19 |   jne [0xaa], 0x25a8, ${fail}:rel + PC
    x"ae",x"3e",x"e0",x"e4",x"f6",x"39",x"30",x"de",x"fa", -- ec23 |   and [A*4 + -10], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"08",x"30",x"09",x"e4", -- ec2c |   jne [0x29e], 0x3008, ${fail}:rel + PC
    x"82",x"20",x"fe",x"21",                         -- ec36 |   add [A], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"a9",x"02",x"fb",x"e3", -- ec3a |   jne [0xaa], 0x2a9, ${fail}:rel + PC
    x"86",x"fe",x"e4",x"fe",x"de",x"fa",             -- ec44 |   sub [G], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"33",x"fa",x"eb",x"e3", -- ec4a |   jne [0x155], 0xfa33, ${fail}:rel + PC
    x"a2",x"e0",x"3e",x"e4",x"39",x"30",x"f6",x"de",x"fa", -- ec54 |   shr [0x3039], A*4 + -10, 0xfade + A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"02",x"d8",x"e3", -- ec5d |   jne [0x3039], 0x2, ${fail}:rel + PC
    x"a2",x"3e",x"21",x"2a",x"f6",                   -- ec66 |   shr [A*4 + -10], A*2, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"2a",x"ca",x"e3", -- ec6b |   jne [0x29e], 0x2a, ${fail}:rel + PC
    x"a2",x"fe",x"20",x"2a",                         -- ec74 |   shr [G], A, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"15",x"bd",x"e3", -- ec78 |   jne [0x155], 0x15, ${fail}:rel + PC
    x"8e",x"2a",x"fe",x"21",                         -- ec81 |   imul [A*4 + B], G, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"e4",x"c4",x"b0",x"e3", -- ec85 |   jne [0x363], 0xc4e4, ${fail}:rel + PC
    x"8a",x"3e",x"e4",x"e4",x"f6",x"de",x"fa",x"de",x"fa", -- ec8f |   mul [A*4 + -10], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"40",x"f8",x"9d",x"e3", -- ec98 |   jne [0x29e], 0xf840, ${fail}:rel + PC
    x"82",x"3e",x"2a",x"e0",x"f6",x"39",x"30",       -- eca2 |   add [A*4 + -10], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"9c",x"33",x"8c",x"e3", -- eca9 |   jne [0x29e], 0x339c, ${fail}:rel + PC
    x"b6",x"2a",x"fe",x"3e",x"f6",                   -- ecb3 |   xor [A*4 + B], G, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"cb",x"03",x"7d",x"e3", -- ecb8 |   jne [0x363], 0x3cb, ${fail}:rel + PC
    x"b6",x"21",x"e4",x"20",x"de",x"fa",             -- ecc2 |   xor [A*2], 0xfade + A, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"22",x"fb",x"6d",x"e3", -- ecc8 |   jne [0x154], 0xfb22, ${fail}:rel + PC
    x"a2",x"e0",x"e0",x"21",x"39",x"30",x"39",x"30", -- ecd2 |   shr [0x3039], 0x3039, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"03",x"03",x"5b",x"e3", -- ecda |   jne [0x3039], 0x303, ${fail}:rel + PC
    x"8e",x"2a",x"fe",x"e0",x"39",x"30",             -- ece4 |   imul [A*4 + B], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"ed",x"3b",x"4b",x"e3", -- ecea |   jne [0x363], 0x3bed, ${fail}:rel + PC
    x"b6",x"e0",x"1c",x"21",x"39",x"30",x"85",       -- ecf4 |   xor [0x3039], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"d1",x"fe",x"3a",x"e3", -- ecfb |   jne [0x3039], 0xfed1, ${fail}:rel + PC
    x"86",x"e0",x"fe",x"e4",x"39",x"30",x"de",x"fa", -- ed05 |   sub [0x3039], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"cd",x"05",x"28",x"e3", -- ed0d |   jne [0x3039], 0x5cd, ${fail}:rel + PC
    x"b6",x"20",x"21",x"e4",x"de",x"fa",             -- ed17 |   xor [A], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"dc",x"fa",x"18",x"e3", -- ed1d |   jne [0xaa], 0xfadc, ${fail}:rel + PC
    x"8a",x"21",x"3e",x"e0",x"f6",x"39",x"30",       -- ed27 |   mul [A*2], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"2e",x"35",x"07",x"e3", -- ed2e |   jne [0x154], 0x352e, ${fail}:rel + PC
    x"aa",x"2a",x"21",x"20",                         -- ed38 |   shl [A*4 + B], A*2, A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"00",x"50",x"f9",x"e2", -- ed3c |   jne [0x363], 0x5000, ${fail}:rel + PC
    x"ae",x"fe",x"1c",x"e4",x"85",x"de",x"fa",       -- ed46 |   and [G], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"80",x"fb",x"e8",x"e2", -- ed4d |   jne [0x155], 0xfb80, ${fail}:rel + PC
    x"a2",x"20",x"20",x"21",                         -- ed57 |   shr [A], A, A*2
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"0a",x"da",x"e2", -- ed5b |   jne [0xaa], 0xa, ${fail}:rel + PC
    x"b6",x"3e",x"20",x"3e",x"f6",x"f6",             -- ed64 |   xor [A*4 + -10], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"34",x"02",x"cb",x"e2", -- ed6a |   jne [0x29e], 0x234, ${fail}:rel + PC
    x"aa",x"3e",x"3e",x"21",x"f6",x"f6",             -- ed74 |   shl [A*4 + -10], A*4 + -10, A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"e0",x"29",x"bb",x"e2", -- ed7a |   jne [0x29e], 0x29e0, ${fail}:rel + PC
    x"8a",x"20",x"3e",x"1c",x"f6",x"85",             -- ed84 |   mul [A], A*4 + -10, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"16",x"be",x"ab",x"e2", -- ed8a |   jne [0xaa], 0xbe16, ${fail}:rel + PC
    x"b2",x"fe",x"fe",x"e0",x"39",x"30",             -- ed94 |   or [G], G, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"7d",x"31",x"9b",x"e2", -- ed9a |   jne [0x155], 0x317d, ${fail}:rel + PC
    x"a2",x"2a",x"e4",x"3e",x"de",x"fa",x"f6",       -- eda4 |   shr [A*4 + B], 0xfade + A, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"03",x"8a",x"e2", -- edab |   jne [0x363], 0x3, ${fail}:rel + PC
    x"8a",x"2a",x"20",x"e0",x"39",x"30",             -- edb4 |   mul [A*4 + B], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"da",x"05",x"7b",x"e2", -- edba |   jne [0x363], 0x5da, ${fail}:rel + PC
    x"ae",x"3e",x"21",x"e0",x"f6",x"39",x"30",       -- edc4 |   and [A*4 + -10], A*2, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"10",x"6a",x"e2", -- edcb |   jne [0x29e], 0x10, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"2a",x"39",x"30",             -- edd4 |   and [0x3039], A, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"22",x"5b",x"e2", -- edda |   jne [0x3039], 0x22, ${fail}:rel + PC
    x"8e",x"fe",x"2a",x"fe",                         -- ede3 |   imul [G], A*4 + B, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"df",x"82",x"4e",x"e2", -- ede7 |   jne [0x155], 0x82df, ${fail}:rel + PC
    x"86",x"e0",x"fe",x"2a",x"39",x"30",             -- edf1 |   sub [0x3039], G, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"f2",x"fd",x"3e",x"e2", -- edf7 |   jne [0x3039], 0xfdf2, ${fail}:rel + PC
    x"a2",x"2a",x"fe",x"2a",                         -- ee01 |   shr [A*4 + B], G, A*4 + B
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"2a",x"30",x"e2", -- ee05 |   jne [0x363], 0x2a, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"fe",x"f6",                   -- ee0e |   or [A*4 + -10], G, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"55",x"01",x"22",x"e2", -- ee13 |   jne [0x29e], 0x155, ${fail}:rel + PC
    x"b6",x"21",x"20",x"fe",                         -- ee1d |   xor [A*2], A, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ff",x"01",x"14",x"e2", -- ee21 |   jne [0x154], 0x1ff, ${fail}:rel + PC
    x"a2",x"fe",x"3e",x"1c",x"f6",x"85",             -- ee2b |   shr [G], A*4 + -10, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"14",x"04",x"e2", -- ee31 |   jne [0x155], 0x14, ${fail}:rel + PC
    x"a6",x"e0",x"fe",x"20",x"39",x"30",             -- ee3a |   ishr [0x3039], G, A
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"f5",x"e1", -- ee40 |   jne [0x3039], 0, ${fail}:rel + PC
    x"8a",x"21",x"1c",x"e4",x"85",x"de",x"fa",       -- ee48 |   mul [A*2], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a8",x"25",x"e6",x"e1", -- ee4f |   jne [0x154], 0x25a8, ${fail}:rel + PC
    x"b2",x"21",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- ee59 |   or [A*2], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"b9",x"fb",x"d4",x"e1", -- ee61 |   jne [0x154], 0xfbb9, ${fail}:rel + PC
    x"8e",x"2a",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- ee6b |   imul [A*4 + B], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"48",x"81",x"c2",x"e1", -- ee73 |   jne [0x363], 0x8148, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"1c",x"f6",x"85",             -- ee7d |   or [A*4 + -10], G, -123
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"d5",x"b2",x"e1", -- ee83 |   jne [0x29e], 0xd5, ${fail}:rel + PC
    x"a6",x"3e",x"21",x"20",x"f6",                   -- ee8c |   ishr [A*4 + -10], A*2, A
    x"ee",x"e0",x"00",x"f8",x"9e",x"02",x"a4",x"e1", -- ee91 |   jne [0x29e], 0, ${fail}:rel + PC
    x"ae",x"21",x"2a",x"1c",x"85",                   -- ee99 |   and [A*2], A*4 + B, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"01",x"03",x"97",x"e1", -- ee9e |   jne [0x154], 0x301, ${fail}:rel + PC
    x"b2",x"20",x"21",x"3e",x"f6",                   -- eea8 |   or [A], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"de",x"03",x"88",x"e1", -- eead |   jne [0xaa], 0x3de, ${fail}:rel + PC
    x"82",x"fe",x"3e",x"20",x"f6",                   -- eeb7 |   add [G], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"48",x"03",x"79",x"e1", -- eebc |   jne [0x155], 0x348, ${fail}:rel + PC
    x"aa",x"3e",x"20",x"e0",x"f6",x"39",x"30",       -- eec6 |   shl [A*4 + -10], A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"00",x"54",x"68",x"e1", -- eecd |   jne [0x29e], 0x5400, ${fail}:rel + PC
    x"aa",x"20",x"e4",x"e4",x"de",x"fa",x"de",x"fa", -- eed7 |   shl [A], 0xfade + A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"00",x"88",x"56",x"e1", -- eedf |   jne [0xaa], 0x8800, ${fail}:rel + PC
    x"8e",x"fe",x"3e",x"e0",x"f6",x"39",x"30",       -- eee9 |   imul [G], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"2e",x"35",x"45",x"e1", -- eef0 |   jne [0x155], 0x352e, ${fail}:rel + PC
    x"82",x"e0",x"1c",x"1c",x"39",x"30",x"85",x"85", -- eefa |   add [0x3039], -123, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"0a",x"ff",x"33",x"e1", -- ef02 |   jne [0x3039], 0xff0a, ${fail}:rel + PC
    x"86",x"21",x"3e",x"fe",x"f6",                   -- ef0c |   sub [A*2], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"49",x"01",x"24",x"e1", -- ef11 |   jne [0x154], 0x149, ${fail}:rel + PC
    x"a6",x"20",x"e4",x"fe",x"de",x"fa",             -- ef1b |   ishr [A], 0xfade + A, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"dc",x"14",x"e1", -- ef21 |   jne [0xaa], 0xdc, ${fail}:rel + PC
    x"b6",x"20",x"e4",x"e0",x"de",x"fa",x"39",x"30", -- ef2a |   xor [A], 0xfade + A, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"b1",x"cb",x"03",x"e1", -- ef32 |   jne [0xaa], 0xcbb1, ${fail}:rel + PC
    x"86",x"fe",x"21",x"e4",x"de",x"fa",             -- ef3c |   sub [G], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"cc",x"05",x"f3",x"e0", -- ef42 |   jne [0x155], 0x5cc, ${fail}:rel + PC
    x"82",x"2a",x"e0",x"e0",x"39",x"30",x"39",x"30", -- ef4c |   add [A*4 + B], 0x3039, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"72",x"60",x"e1",x"e0", -- ef54 |   jne [0x363], 0x6072, ${fail}:rel + PC
    x"86",x"3e",x"1c",x"e4",x"f6",x"85",x"de",x"fa", -- ef5e |   sub [A*4 + -10], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"fd",x"03",x"cf",x"e0", -- ef66 |   jne [0x29e], 0x3fd, ${fail}:rel + PC
    x"82",x"21",x"21",x"3e",x"f6",                   -- ef70 |   add [A*2], A*2, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"f2",x"03",x"c0",x"e0", -- ef75 |   jne [0x154], 0x3f2, ${fail}:rel + PC
    x"a2",x"20",x"e0",x"1c",x"39",x"30",x"85",       -- ef7f |   shr [A], 0x3039, -123
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"81",x"01",x"af",x"e0", -- ef86 |   jne [0xaa], 0x181, ${fail}:rel + PC
    x"8e",x"21",x"20",x"3e",x"f6",                   -- ef90 |   imul [A*2], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"ec",x"bc",x"a0",x"e0", -- ef95 |   jne [0x154], 0xbcec, ${fail}:rel + PC
    x"b2",x"3e",x"fe",x"e4",x"f6",x"de",x"fa",       -- ef9f |   or [A*4 + -10], G, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"dd",x"fb",x"8f",x"e0", -- efa6 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
    x"a6",x"fe",x"20",x"1c",x"85",                   -- efb0 |   ishr [G], A, -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"05",x"80",x"e0", -- efb5 |   jne [0x155], 0x5, ${fail}:rel + PC
    x"a6",x"21",x"20",x"e4",x"de",x"fa",             -- efbe |   ishr [A*2], A, 0xfade + A
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"71",x"e0", -- efc4 |   jne [0x154], 0, ${fail}:rel + PC
    x"a2",x"e0",x"1c",x"20",x"39",x"30",x"85",       -- efcc |   shr [0x3039], -123, A
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"3f",x"62",x"e0", -- efd3 |   jne [0x3039], 0x3f, ${fail}:rel + PC
    x"8e",x"20",x"20",x"3e",x"f6",                   -- efdc |   imul [A], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ec",x"bc",x"54",x"e0", -- efe1 |   jne [0xaa], 0xbcec, ${fail}:rel + PC
    x"82",x"2a",x"e4",x"fe",x"de",x"fa",             -- efeb |   add [A*4 + B], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"dd",x"fc",x"44",x"e0", -- eff1 |   jne [0x363], 0xfcdd, ${fail}:rel + PC
    x"b6",x"fe",x"e0",x"3e",x"39",x"30",x"f6",       -- effb |   xor [G], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"a7",x"32",x"33",x"e0", -- f002 |   jne [0x155], 0x32a7, ${fail}:rel + PC
    x"8e",x"20",x"e0",x"2a",x"39",x"30",             -- f00c |   imul [A], 0x3039, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"0b",x"51",x"23",x"e0", -- f012 |   jne [0xaa], 0x510b, ${fail}:rel + PC
    x"b2",x"3e",x"e4",x"fe",x"f6",x"de",x"fa",       -- f01c |   or [A*4 + -10], 0xfade + A, G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"dd",x"fb",x"12",x"e0", -- f023 |   jne [0x29e], 0xfbdd, ${fail}:rel + PC
    x"86",x"21",x"1c",x"21",x"85",                   -- f02d |   sub [A*2], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"31",x"fe",x"03",x"e0", -- f032 |   jne [0x154], 0xfe31, ${fail}:rel + PC
    x"b2",x"2a",x"21",x"21",                         -- f03c |   or [A*4 + B], A*2, A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"54",x"01",x"f5",x"df", -- f040 |   jne [0x363], 0x154, ${fail}:rel + PC
    x"8e",x"e0",x"20",x"3e",x"39",x"30",x"f6",       -- f04a |   imul [0x3039], A, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"ec",x"bc",x"e4",x"df", -- f051 |   jne [0x3039], 0xbcec, ${fail}:rel + PC
    x"a6",x"3e",x"e4",x"2a",x"f6",x"de",x"fa",       -- f05b |   ishr [A*4 + -10], 0xfade + A, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"71",x"ff",x"d3",x"df", -- f062 |   jne [0x29e], 0xff71, ${fail}:rel + PC
    x"ae",x"e0",x"20",x"e4",x"39",x"30",x"de",x"fa", -- f06c |   and [0x3039], A, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"88",x"00",x"c1",x"df", -- f074 |   jne [0x3039], 0x88, ${fail}:rel + PC
    x"a6",x"20",x"fe",x"fe",                         -- f07e |   ishr [A], G, G
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"0a",x"b3",x"df", -- f082 |   jne [0xaa], 0xa, ${fail}:rel + PC
    x"8e",x"20",x"3e",x"20",x"f6",                   -- f08b |   imul [A], A*4 + -10, A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"ec",x"bc",x"a5",x"df", -- f090 |   jne [0xaa], 0xbcec, ${fail}:rel + PC
    x"b2",x"e0",x"3e",x"fe",x"39",x"30",x"f6",       -- f09a |   or [0x3039], A*4 + -10, G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"df",x"03",x"94",x"df", -- f0a1 |   jne [0x3039], 0x3df, ${fail}:rel + PC
    x"82",x"21",x"e0",x"e4",x"39",x"30",x"de",x"fa", -- f0ab |   add [A*2], 0x3039, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"c1",x"2b",x"82",x"df", -- f0b3 |   jne [0x154], 0x2bc1, ${fail}:rel + PC
    x"82",x"e0",x"1c",x"e4",x"39",x"30",x"85",x"de",x"fa", -- f0bd |   add [0x3039], -123, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"0d",x"fb",x"6f",x"df", -- f0c6 |   jne [0x3039], 0xfb0d, ${fail}:rel + PC
    x"b2",x"fe",x"20",x"21",                         -- f0d0 |   or [G], A, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"fe",x"01",x"61",x"df", -- f0d4 |   jne [0x155], 0x1fe, ${fail}:rel + PC
    x"aa",x"21",x"2a",x"21",                         -- f0de |   shl [A*2], A*4 + B, A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"30",x"36",x"53",x"df", -- f0e2 |   jne [0x154], 0x3630, ${fail}:rel + PC
    x"82",x"e0",x"2a",x"e0",x"39",x"30",x"39",x"30", -- f0ec |   add [0x3039], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"9c",x"33",x"41",x"df", -- f0f4 |   jne [0x3039], 0x339c, ${fail}:rel + PC
    x"ae",x"2a",x"20",x"1c",x"85",                   -- f0fe |   and [A*4 + B], A, -123
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"80",x"00",x"32",x"df", -- f103 |   jne [0x363], 0x80, ${fail}:rel + PC
    x"b6",x"e0",x"20",x"1c",x"39",x"30",x"85",       -- f10d |   xor [0x3039], A, -123
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"2f",x"ff",x"21",x"df", -- f114 |   jne [0x3039], 0xff2f, ${fail}:rel + PC
    x"ae",x"21",x"fe",x"e0",x"39",x"30",             -- f11e |   and [A*2], G, 0x3039
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"11",x"11",x"df", -- f124 |   jne [0x154], 0x11, ${fail}:rel + PC
    x"ae",x"3e",x"fe",x"3e",x"f6",x"f6",             -- f12d |   and [A*4 + -10], G, A*4 + -10
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"14",x"02",x"df", -- f133 |   jne [0x29e], 0x14, ${fail}:rel + PC
    x"8a",x"3e",x"2a",x"2a",x"f6",                   -- f13c |   mul [A*4 + -10], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"49",x"78",x"f4",x"de", -- f141 |   jne [0x29e], 0x7849, ${fail}:rel + PC
    x"82",x"20",x"3e",x"e0",x"f6",x"39",x"30",       -- f14b |   add [A], A*4 + -10, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"d7",x"32",x"e3",x"de", -- f152 |   jne [0xaa], 0x32d7, ${fail}:rel + PC
    x"82",x"21",x"e0",x"3e",x"39",x"30",x"f6",       -- f15c |   add [A*2], 0x3039, A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"d7",x"32",x"d2",x"de", -- f163 |   jne [0x154], 0x32d7, ${fail}:rel + PC
    x"b6",x"21",x"3e",x"3e",x"f6",x"f6",             -- f16d |   xor [A*2], A*4 + -10, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"54",x"01",x"c2",x"de", -- f173 |   jne [0x154], 0, ${fail}:rel + PC
    x"a6",x"e0",x"20",x"20",x"39",x"30",             -- f17b |   ishr [0x3039], A, A
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"b4",x"de", -- f181 |   jne [0x3039], 0, ${fail}:rel + PC
    x"a6",x"e0",x"e0",x"3e",x"39",x"30",x"39",x"30",x"f6", -- f189 |   ishr [0x3039], 0x3039, A*4 + -10
    x"ee",x"e0",x"00",x"f8",x"39",x"30",x"a3",x"de", -- f192 |   jne [0x3039], 0, ${fail}:rel + PC
    x"aa",x"20",x"1c",x"21",x"85",                   -- f19a |   shl [A], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"50",x"f8",x"96",x"de", -- f19f |   jne [0xaa], 0xf850, ${fail}:rel + PC
    x"ae",x"e0",x"21",x"e4",x"39",x"30",x"de",x"fa", -- f1a9 |   and [0x3039], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"00",x"01",x"84",x"de", -- f1b1 |   jne [0x3039], 0x100, ${fail}:rel + PC
    x"b2",x"3e",x"1c",x"20",x"f6",x"85",             -- f1bb |   or [A*4 + -10], -123, A
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"af",x"74",x"de", -- f1c1 |   jne [0x29e], 0xaf, ${fail}:rel + PC
    x"8e",x"21",x"1c",x"20",x"85",                   -- f1ca |   imul [A*2], -123, A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"52",x"ae",x"66",x"de", -- f1cf |   jne [0x154], 0xae52, ${fail}:rel + PC
    x"8a",x"2a",x"2a",x"2a",                         -- f1d9 |   mul [A*4 + B], A*4 + B, A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"49",x"78",x"58",x"de", -- f1dd |   jne [0x363], 0x7849, ${fail}:rel + PC
    x"86",x"2a",x"2a",x"e0",x"39",x"30",             -- f1e7 |   sub [A*4 + B], A*4 + B, 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"2a",x"d3",x"48",x"de", -- f1ed |   jne [0x363], 0xd32a, ${fail}:rel + PC
    x"ae",x"fe",x"1c",x"21",x"85",                   -- f1f7 |   and [G], -123, A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"04",x"01",x"39",x"de", -- f1fc |   jne [0x155], 0x104, ${fail}:rel + PC
    x"8e",x"21",x"e4",x"1c",x"de",x"fa",x"85",       -- f206 |   imul [A*2], 0xfade + A, -123
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a8",x"25",x"28",x"de", -- f20d |   jne [0x154], 0x25a8, ${fail}:rel + PC
    x"8a",x"21",x"21",x"e4",x"de",x"fa",             -- f217 |   mul [A*2], A*2, 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"a0",x"10",x"18",x"de", -- f21d |   jne [0x154], 0x10a0, ${fail}:rel + PC
    x"86",x"fe",x"e0",x"fe",x"39",x"30",             -- f227 |   sub [G], 0x3039, G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"e4",x"2e",x"08",x"de", -- f22d |   jne [0x155], 0x2ee4, ${fail}:rel + PC
    x"62",x"20",x"1c",x"85",                         -- f237 |   mov [A], -123
    x"ee",x"e0",x"1c",x"f8",x"aa",x"00",x"85",x"fa",x"dd", -- f23b |   jne [0xaa], 0x85, ${fail}:rel + PC
    x"62",x"3e",x"3e",x"f6",x"f6",                   -- f244 |   mov [A*4 + -10], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"9e",x"02",x"ec",x"dd", -- f249 |   jne [0x29e], 0x29e, ${fail}:rel + PC
    x"62",x"21",x"2a",                               -- f253 |   mov [A*2], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"63",x"03",x"df",x"dd", -- f256 |   jne [0x154], 0x363, ${fail}:rel + PC
    x"62",x"e0",x"1c",x"39",x"30",x"85",             -- f260 |   mov [0x3039], -123
    x"ee",x"e0",x"1c",x"f8",x"39",x"30",x"85",x"cf",x"dd", -- f266 |   jne [0x3039], 0x85, ${fail}:rel + PC
    x"62",x"fe",x"3e",x"f6",                         -- f26f |   mov [G], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"9e",x"02",x"c2",x"dd", -- f273 |   jne [0x155], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"fe",x"39",x"30",                   -- f27d |   mov [0x3039], G
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"55",x"01",x"b3",x"dd", -- f282 |   jne [0x3039], 0x155, ${fail}:rel + PC
    x"62",x"fe",x"21",                               -- f28c |   mov [G], A*2
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"54",x"01",x"a6",x"dd", -- f28f |   jne [0x155], 0x154, ${fail}:rel + PC
    x"62",x"3e",x"e4",x"f6",x"de",x"fa",             -- f299 |   mov [A*4 + -10], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"88",x"fb",x"96",x"dd", -- f29f |   jne [0x29e], 0xfb88, ${fail}:rel + PC
    x"62",x"e0",x"e0",x"39",x"30",x"39",x"30",       -- f2a9 |   mov [0x3039], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"39",x"30",x"85",x"dd", -- f2b0 |   jne [0x3039], 0x3039, ${fail}:rel + PC
    x"62",x"3e",x"fe",x"f6",                         -- f2ba |   mov [A*4 + -10], G
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"55",x"01",x"77",x"dd", -- f2be |   jne [0x29e], 0x155, ${fail}:rel + PC
    x"62",x"20",x"fe",                               -- f2c8 |   mov [A], G
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"55",x"01",x"6a",x"dd", -- f2cb |   jne [0xaa], 0x155, ${fail}:rel + PC
    x"62",x"2a",x"2a",                               -- f2d5 |   mov [A*4 + B], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"63",x"03",x"5d",x"dd", -- f2d8 |   jne [0x363], 0x363, ${fail}:rel + PC
    x"62",x"3e",x"2a",x"f6",                         -- f2e2 |   mov [A*4 + -10], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"63",x"03",x"4f",x"dd", -- f2e6 |   jne [0x29e], 0x363, ${fail}:rel + PC
    x"62",x"2a",x"20",                               -- f2f0 |   mov [A*4 + B], A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"aa",x"00",x"42",x"dd", -- f2f3 |   jne [0x363], 0xaa, ${fail}:rel + PC
    x"62",x"3e",x"20",x"f6",                         -- f2fd |   mov [A*4 + -10], A
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"aa",x"00",x"34",x"dd", -- f301 |   jne [0x29e], 0xaa, ${fail}:rel + PC
    x"62",x"20",x"20",                               -- f30b |   mov [A], A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"aa",x"00",x"27",x"dd", -- f30e |   jne [0xaa], 0xaa, ${fail}:rel + PC
    x"62",x"2a",x"e4",x"de",x"fa",                   -- f318 |   mov [A*4 + B], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"88",x"fb",x"18",x"dd", -- f31d |   jne [0x363], 0xfb88, ${fail}:rel + PC
    x"62",x"21",x"1c",x"85",                         -- f327 |   mov [A*2], -123
    x"ee",x"e0",x"1c",x"f8",x"54",x"01",x"85",x"0a",x"dd", -- f32b |   jne [0x154], 0x85, ${fail}:rel + PC
    x"62",x"2a",x"e0",x"39",x"30",                   -- f334 |   mov [A*4 + B], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"39",x"30",x"fc",x"dc", -- f339 |   jne [0x363], 0x3039, ${fail}:rel + PC
    x"62",x"3e",x"1c",x"f6",x"85",                   -- f343 |   mov [A*4 + -10], -123
    x"ee",x"e0",x"1c",x"f8",x"9e",x"02",x"85",x"ed",x"dc", -- f348 |   jne [0x29e], 0x85, ${fail}:rel + PC
    x"62",x"3e",x"21",x"f6",                         -- f351 |   mov [A*4 + -10], A*2
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"54",x"01",x"e0",x"dc", -- f355 |   jne [0x29e], 0x154, ${fail}:rel + PC
    x"62",x"21",x"3e",x"f6",                         -- f35f |   mov [A*2], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"9e",x"02",x"d2",x"dc", -- f363 |   jne [0x154], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"21",x"39",x"30",                   -- f36d |   mov [0x3039], A*2
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"54",x"01",x"c3",x"dc", -- f372 |   jne [0x3039], 0x154, ${fail}:rel + PC
    x"62",x"21",x"fe",                               -- f37c |   mov [A*2], G
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"55",x"01",x"b6",x"dc", -- f37f |   jne [0x154], 0x155, ${fail}:rel + PC
    x"62",x"2a",x"fe",                               -- f389 |   mov [A*4 + B], G
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"55",x"01",x"a9",x"dc", -- f38c |   jne [0x363], 0x155, ${fail}:rel + PC
    x"62",x"21",x"e4",x"de",x"fa",                   -- f396 |   mov [A*2], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"88",x"fb",x"9a",x"dc", -- f39b |   jne [0x154], 0xfb88, ${fail}:rel + PC
    x"62",x"20",x"3e",x"f6",                         -- f3a5 |   mov [A], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"9e",x"02",x"8c",x"dc", -- f3a9 |   jne [0xaa], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"3e",x"39",x"30",x"f6",             -- f3b3 |   mov [0x3039], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"9e",x"02",x"7c",x"dc", -- f3b9 |   jne [0x3039], 0x29e, ${fail}:rel + PC
    x"62",x"2a",x"3e",x"f6",                         -- f3c3 |   mov [A*4 + B], A*4 + -10
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"9e",x"02",x"6e",x"dc", -- f3c7 |   jne [0x363], 0x29e, ${fail}:rel + PC
    x"62",x"e0",x"e4",x"39",x"30",x"de",x"fa",       -- f3d1 |   mov [0x3039], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"88",x"fb",x"5d",x"dc", -- f3d8 |   jne [0x3039], 0xfb88, ${fail}:rel + PC
    x"62",x"21",x"e0",x"39",x"30",                   -- f3e2 |   mov [A*2], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"39",x"30",x"4e",x"dc", -- f3e7 |   jne [0x154], 0x3039, ${fail}:rel + PC
    x"62",x"fe",x"1c",x"85",                         -- f3f1 |   mov [G], -123
    x"ee",x"e0",x"1c",x"f8",x"55",x"01",x"85",x"40",x"dc", -- f3f5 |   jne [0x155], 0x85, ${fail}:rel + PC
    x"62",x"e0",x"2a",x"39",x"30",                   -- f3fe |   mov [0x3039], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"63",x"03",x"32",x"dc", -- f403 |   jne [0x3039], 0x363, ${fail}:rel + PC
    x"62",x"fe",x"e4",x"de",x"fa",                   -- f40d |   mov [G], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"88",x"fb",x"23",x"dc", -- f412 |   jne [0x155], 0xfb88, ${fail}:rel + PC
    x"62",x"20",x"e0",x"39",x"30",                   -- f41c |   mov [A], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"39",x"30",x"14",x"dc", -- f421 |   jne [0xaa], 0x3039, ${fail}:rel + PC
    x"62",x"20",x"21",                               -- f42b |   mov [A], A*2
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"54",x"01",x"07",x"dc", -- f42e |   jne [0xaa], 0x154, ${fail}:rel + PC
    x"62",x"3e",x"e0",x"f6",x"39",x"30",             -- f438 |   mov [A*4 + -10], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"9e",x"02",x"39",x"30",x"f7",x"db", -- f43e |   jne [0x29e], 0x3039, ${fail}:rel + PC
    x"62",x"fe",x"20",                               -- f448 |   mov [G], A
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"aa",x"00",x"ea",x"db", -- f44b |   jne [0x155], 0xaa, ${fail}:rel + PC
    x"62",x"21",x"20",                               -- f455 |   mov [A*2], A
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"aa",x"00",x"dd",x"db", -- f458 |   jne [0x154], 0xaa, ${fail}:rel + PC
    x"62",x"fe",x"fe",                               -- f462 |   mov [G], G
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"55",x"01",x"d0",x"db", -- f465 |   jne [0x155], 0x155, ${fail}:rel + PC
    x"62",x"20",x"2a",                               -- f46f |   mov [A], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"63",x"03",x"c3",x"db", -- f472 |   jne [0xaa], 0x363, ${fail}:rel + PC
    x"62",x"2a",x"1c",x"85",                         -- f47c |   mov [A*4 + B], -123
    x"ee",x"e0",x"1c",x"f8",x"63",x"03",x"85",x"b5",x"db", -- f480 |   jne [0x363], 0x85, ${fail}:rel + PC
    x"62",x"2a",x"21",                               -- f489 |   mov [A*4 + B], A*2
    x"ee",x"e0",x"e0",x"f8",x"63",x"03",x"54",x"01",x"a9",x"db", -- f48c |   jne [0x363], 0x154, ${fail}:rel + PC
    x"62",x"e0",x"20",x"39",x"30",                   -- f496 |   mov [0x3039], A
    x"ee",x"e0",x"e0",x"f8",x"39",x"30",x"aa",x"00",x"9a",x"db", -- f49b |   jne [0x3039], 0xaa, ${fail}:rel + PC
    x"62",x"fe",x"e0",x"39",x"30",                   -- f4a5 |   mov [G], 0x3039
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"39",x"30",x"8b",x"db", -- f4aa |   jne [0x155], 0x3039, ${fail}:rel + PC
    x"62",x"21",x"21",                               -- f4b4 |   mov [A*2], A*2
    x"ee",x"e0",x"e0",x"f8",x"54",x"01",x"54",x"01",x"7e",x"db", -- f4b7 |   jne [0x154], 0x154, ${fail}:rel + PC
    x"62",x"fe",x"2a",                               -- f4c1 |   mov [G], A*4 + B
    x"ee",x"e0",x"e0",x"f8",x"55",x"01",x"63",x"03",x"71",x"db", -- f4c4 |   jne [0x155], 0x363, ${fail}:rel + PC
    x"62",x"20",x"e4",x"de",x"fa",                   -- f4ce |   mov [A], 0xfade + A
    x"ee",x"e0",x"e0",x"f8",x"aa",x"00",x"88",x"fb",x"62",x"db", -- f4d3 |   jne [0xaa], 0xfb88, ${fail}:rel + PC
    x"e0",x"2a",                                     -- f4dd |   push A*4 + B
    x"e4",x"80",                                     -- f4df |   pop D
    x"ec",x"80",x"e0",x"f8",x"63",x"03",x"54",x"db", -- f4e1 |   jne D, 0x363, ${fail}:rel + PC
    x"e0",x"1c",x"85",                               -- f4e9 |   push -123
    x"e4",x"80",                                     -- f4ec |   pop D
    x"ec",x"80",x"1c",x"f8",x"85",x"47",x"db",       -- f4ee |   jne D, 0x85, ${fail}:rel + PC
    x"e0",x"fe",                                     -- f4f5 |   push G
    x"e4",x"80",                                     -- f4f7 |   pop D
    x"ec",x"80",x"e0",x"f8",x"55",x"01",x"3c",x"db", -- f4f9 |   jne D, 0x155, ${fail}:rel + PC
    x"e0",x"3e",x"f6",                               -- f501 |   push A*4 + -10
    x"e4",x"80",                                     -- f504 |   pop D
    x"ec",x"80",x"e0",x"f8",x"9e",x"02",x"2f",x"db", -- f506 |   jne D, 0x29e, ${fail}:rel + PC
    x"e0",x"20",                                     -- f50e |   push A
    x"e4",x"80",                                     -- f510 |   pop D
    x"ec",x"80",x"e0",x"f8",x"aa",x"00",x"23",x"db", -- f512 |   jne D, 0xaa, ${fail}:rel + PC
    x"e0",x"e4",x"de",x"fa",                         -- f51a |   push 0xfade + A
    x"e4",x"80",                                     -- f51e |   pop D
    x"ec",x"80",x"e0",x"f8",x"88",x"fb",x"15",x"db", -- f520 |   jne D, 0xfb88, ${fail}:rel + PC
    x"e0",x"21",                                     -- f528 |   push A*2
    x"e4",x"80",                                     -- f52a |   pop D
    x"ec",x"80",x"e0",x"f8",x"54",x"01",x"09",x"db", -- f52c |   jne D, 0x154, ${fail}:rel + PC
    x"e0",x"e0",x"39",x"30",                         -- f534 |   push 0x3039
    x"e4",x"80",                                     -- f538 |   pop D
    x"ec",x"80",x"e0",x"f8",x"39",x"30",x"fb",x"da", -- f53a |   jne D, 0x3039, ${fail}:rel + PC
    x"5c",x"f8",x"10",x"00",                         -- f542 |   call ${_L_test_uop_get_arg_1}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"fe",x"ad",x"ef",x"da", -- f546 |   jne C, 0xadfe, ${fail}:rel + PC
    x"58",x"f8",x"0e",x"00",                         -- f54e |   jmp ${_L_test_uop_get_arg_2}:rel + PC
                                                     --      | _L_test_uop_get_arg_1:
    x"60",x"60",x"e0",x"fe",x"ad",                   -- f552 |   mov C, 0xadfe
    x"dc",                                           -- f557 |   ret
    x"58",x"f8",x"dd",x"da",                         -- f558 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_get_arg_2:
                                                     --      | test_uop_alu_2dd:
    x"60",x"20",x"e0",x"cd",x"ab",                   -- f55c |   mov A, 0xabcd
    x"00",x"20",x"e0",x"ab",x"cd",                   -- f561 |   add A, 0xcdab
    x"ec",x"20",x"e0",x"f8",x"78",x"79",x"cf",x"da", -- f566 |   jne A, 0x7978, ${fail}:rel + PC
                                                     --      | test_uop_alu_2di:
    x"60",x"20",x"e0",x"00",x"10",                   -- f56e |   mov A, 0x1000
    x"62",x"e0",x"e0",x"00",x"10",x"bc",x"0a",       -- f573 |   mov [0x1000], 0xabc
    x"01",x"20",x"20",                               -- f57a |   add A, [A]
    x"ec",x"20",x"e0",x"f8",x"bc",x"1a",x"b8",x"da", -- f57d |   jne A, 0x1abc, ${fail}:rel + PC
                                                     --      | test_uop_alu_2id:
    x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       -- f585 |   mov [0x1000], 0x1234
    x"02",x"e0",x"e0",x"00",x"10",x"21",x"43",       -- f58c |   add [0x1000], 0x4321
    x"61",x"20",x"e0",x"00",x"10",                   -- f593 |   mov A, [0x1000]
    x"ec",x"20",x"e0",x"f8",x"55",x"55",x"9d",x"da", -- f598 |   jne A, 0x5555, ${fail}:rel + PC
                                                     --      | test_uop_alu_2ii:
    x"62",x"e0",x"e0",x"00",x"10",x"34",x"12",       -- f5a0 |   mov [0x1000], 0x1234
    x"62",x"e0",x"e0",x"05",x"10",x"aa",x"aa",       -- f5a7 |   mov [0x1005], 0xaaaa
    x"03",x"e0",x"e0",x"05",x"10",x"00",x"10",       -- f5ae |   add [0x1005], [0x1000]
    x"ee",x"e0",x"e0",x"f8",x"05",x"10",x"de",x"bc",x"80",x"da", -- f5b5 |   jne [0x1005], 0xbcde, ${fail}:rel + PC
                                                     --      | test_uop_alu_3dd:
    x"60",x"20",x"e0",x"fe",x"ab",                   -- f5bf |   mov A, 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f5c4 |   mov B, 0x5555
    x"80",x"60",x"20",x"40",                         -- f5c9 |   add C, A, B
    x"ec",x"20",x"e0",x"f8",x"fe",x"ab",x"68",x"da", -- f5cd |   jne A, 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"60",x"da", -- f5d5 |   jne B, 0x5555, ${fail}:rel + PC
    x"ec",x"60",x"e0",x"f8",x"53",x"01",x"58",x"da", -- f5dd |   jne C, 0x153, ${fail}:rel + PC
                                                     --      | test_uop_alu_3di:
    x"62",x"e0",x"e0",x"00",x"10",x"aa",x"12",       -- f5e5 |   mov [0x1000], 0x12aa
    x"60",x"40",x"e0",x"de",x"fa",                   -- f5ec |   mov B, 0xfade
    x"b5",x"20",x"e0",x"40",x"00",x"10",             -- f5f1 |   xor A, [0x1000], B
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"aa",x"12",x"3e",x"da", -- f5f7 |   jne [0x1000], 0x12aa, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"de",x"fa",x"34",x"da", -- f601 |   jne B, 0xfade, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"74",x"e8",x"2c",x"da", -- f609 |   jne A, 0xe874, ${fail}:rel + PC
                                                     --      | test_uop_alu_3id:
    x"60",x"20",x"e0",x"fe",x"ab",                   -- f611 |   mov A, 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f616 |   mov B, 0x5555
    x"86",x"e0",x"20",x"40",x"00",x"10",             -- f61b |   sub [0x1000], A, B
    x"ec",x"20",x"e0",x"f8",x"fe",x"ab",x"14",x"da", -- f621 |   jne A, 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"0c",x"da", -- f629 |   jne B, 0x5555, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"a9",x"56",x"04",x"da", -- f631 |   jne [0x1000], 0x56a9, ${fail}:rel + PC
                                                     --      | test_uop_alu_3ii:
    x"62",x"e0",x"e0",x"00",x"10",x"fe",x"ab",       -- f63b |   mov [0x1000], 0xabfe
    x"60",x"40",x"e0",x"55",x"55",                   -- f642 |   mov B, 0x5555
    x"af",x"e0",x"e0",x"40",x"02",x"10",x"00",x"10", -- f647 |   and [0x1002], [0x1000], B
    x"ee",x"e0",x"e0",x"f8",x"00",x"10",x"fe",x"ab",x"e6",x"d9", -- f64f |   jne [0x1000], 0xabfe, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"55",x"55",x"dc",x"d9", -- f659 |   jne B, 0x5555, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"02",x"10",x"54",x"01",x"d4",x"d9", -- f661 |   jne [0x1002], 0x154, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_1dx:
    x"60",x"20",x"e0",x"00",x"ff",                   -- f66b |   mov A, 0xff00
    x"3c",x"20",                                     -- f670 |   not A
    x"ec",x"20",x"e0",x"f8",x"ff",x"00",x"c3",x"d9", -- f672 |   jne A, 0xff, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_1ix:
    x"62",x"1c",x"e0",x"64",x"34",x"12",             -- f67a |   mov [0x64], 0x1234
    x"3a",x"1c",x"64",                               -- f680 |   neg [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"cc",x"ed",x"b2",x"d9", -- f683 |   jne [0x64], 0xedcc, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2dd:
    x"60",x"40",x"e0",x"ff",x"00",                   -- f68c |   mov B, 0xff
    x"bc",x"20",x"40",                               -- f691 |   not A, B
    x"ec",x"40",x"e0",x"f8",x"ff",x"00",x"a1",x"d9", -- f694 |   jne B, 0xff, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"00",x"ff",x"99",x"d9", -- f69c |   jne A, 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2di:
    x"62",x"1c",x"e0",x"64",x"34",x"12",             -- f6a4 |   mov [0x64], 0x1234
    x"bd",x"20",x"1c",x"64",                         -- f6aa |   not A, [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"34",x"12",x"87",x"d9", -- f6ae |   jne [0x64], 0x1234, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"cb",x"ed",x"7e",x"d9", -- f6b7 |   jne A, 0xedcb, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2id:
    x"60",x"40",x"e0",x"ff",x"00",                   -- f6bf |   mov B, 0xff
    x"be",x"1c",x"40",x"64",                         -- f6c4 |   not [0x64], B
    x"ec",x"40",x"e0",x"f8",x"ff",x"00",x"6d",x"d9", -- f6c8 |   jne B, 0xff, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"00",x"ff",x"65",x"d9", -- f6d0 |   jne [0x64], 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_alu_single_2ii:
    x"62",x"1c",x"e0",x"66",x"ff",x"00",             -- f6d9 |   mov [0x66], 0xff
    x"bf",x"1c",x"1c",x"64",x"66",                   -- f6df |   not [0x64], [0x66]
    x"ee",x"1c",x"e0",x"f8",x"66",x"ff",x"00",x"51",x"d9", -- f6e4 |   jne [0x66], 0xff, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"00",x"ff",x"48",x"d9", -- f6ed |   jne [0x64], 0xff00, ${fail}:rel + PC
                                                     --      | test_uop_cmp_dd:
    x"60",x"40",x"1c",x"7b",                         -- f6f6 |   mov B, 0x7b
    x"50",x"40",x"e0",x"c8",x"01",                   -- f6fa |   cmp B, 0x1c8
    x"4c",x"20",                                     -- f6ff |   getf A
    x"ec",x"40",x"1c",x"f8",x"7b",x"34",x"d9",       -- f701 |   jne B, 0x7b, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"0e",x"2d",x"d9",       -- f708 |   jne A, 0xe, ${fail}:rel + PC
                                                     --      | test_uop_cmp_di:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f70f |   mov [0x64], -123
    x"60",x"40",x"e0",x"c8",x"01",                   -- f714 |   mov B, 0x1c8
    x"d1",x"40",x"1c",x"64",                         -- f719 |   icmp B, [0x64]
    x"4c",x"20",                                     -- f71d |   getf A
    x"ec",x"40",x"e0",x"f8",x"c8",x"01",x"16",x"d9", -- f71f |   jne B, 0x1c8, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"32",x"0e",x"d9",       -- f727 |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_cmp_id:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f72e |   mov [0x64], -123
    x"60",x"40",x"e0",x"c8",x"01",                   -- f733 |   mov B, 0x1c8
    x"d2",x"1c",x"40",x"64",                         -- f738 |   icmp [0x64], B
    x"4c",x"20",                                     -- f73c |   getf A
    x"ec",x"40",x"e0",x"f8",x"c8",x"01",x"f7",x"d8", -- f73e |   jne B, 0x1c8, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"0e",x"ef",x"d8",       -- f746 |   jne A, 0xe, ${fail}:rel + PC
                                                     --      | test_uop_cmp_ii:
    x"62",x"1c",x"1c",x"64",x"85",                   -- f74d |   mov [0x64], -123
    x"62",x"1c",x"e0",x"66",x"38",x"fe",             -- f752 |   mov [0x66], 0xfe38
    x"d3",x"1c",x"1c",x"64",x"66",                   -- f758 |   icmp [0x64], [0x66]
    x"4c",x"20",                                     -- f75d |   getf A
    x"ee",x"1c",x"1c",x"f8",x"64",x"85",x"d6",x"d8", -- f75f |   jne [0x64], -123, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"38",x"fe",x"ce",x"d8", -- f767 |   jne [0x66], 0xfe38, ${fail}:rel + PC
    x"ec",x"20",x"1c",x"f8",x"32",x"c5",x"d8",       -- f770 |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_jmp_d:
    x"60",x"20",x"e0",x"82",x"f7",                   -- f777 |   mov A, ${_L_test_uop_jmp_d_okay}
    x"58",x"20",                                     -- f77c |   jmp A
    x"58",x"f8",x"b7",x"d8",                         -- f77e |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_d_okay:
                                                     --      | test_uop_jmp_i:
    x"62",x"1c",x"e0",x"64",x"8f",x"f7",             -- f782 |   mov [0x64], ${_L_test_uop_jmp_i_okay}
    x"5a",x"1c",x"64",                               -- f788 |   jmp [0x64]
    x"58",x"f8",x"aa",x"d8",                         -- f78b |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_i_okay:
    x"ee",x"1c",x"e0",x"f8",x"64",x"8f",x"f7",x"a6",x"d8", -- f78f |   jne [0x64], ${_L_test_uop_jmp_i_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_cond_i:
    x"62",x"1c",x"e0",x"64",x"ae",x"f7",             -- f798 |   mov [0x64], ${_L_test_uop_jmp_cond_i_okay}
    x"50",x"1c",x"1c",x"01",x"02",                   -- f79e |   cmp 0x1, 0x2
    x"68",x"f8",x"92",x"d8",                         -- f7a3 |   jeq ${fail}:rel + PC
    x"6e",x"1c",x"64",                               -- f7a7 |   jne [0x64]
    x"58",x"f8",x"8b",x"d8",                         -- f7aa |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_cond_i_okay:
    x"ee",x"1c",x"e0",x"f8",x"64",x"ae",x"f7",x"87",x"d8", -- f7ae |   jne [0x64], ${_L_test_uop_jmp_cond_i_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_cond_d:
    x"60",x"20",x"e0",x"cb",x"f7",                   -- f7b7 |   mov A, ${_L_test_uop_jmp_cond_d_okay}
    x"50",x"1c",x"1c",x"01",x"01",                   -- f7bc |   cmp 0x1, 0x1
    x"6c",x"f8",x"74",x"d8",                         -- f7c1 |   jne ${fail}:rel + PC
    x"68",x"20",                                     -- f7c5 |   jeq A
    x"58",x"f8",x"6e",x"d8",                         -- f7c7 |   jmp ${fail}:rel + PC
                                                     --      | _L_test_uop_jmp_cond_d_okay:
    x"ec",x"20",x"e0",x"f8",x"cb",x"f7",x"6a",x"d8", -- f7cb |   jne A, ${_L_test_uop_jmp_cond_d_okay}, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3dd:
    x"60",x"20",x"1c",x"7b",                         -- f7d3 |   mov A, 0x7b
    x"ec",x"20",x"1c",x"f8",x"7b",x"5e",x"d8",       -- f7d7 |   jne A, 0x7b, ${fail}:rel + PC
    x"e8",x"20",x"1c",x"f8",x"7b",x"0b",x"00",       -- f7de |   jeq A, 0x7b, ${_test_uop_jmp_3dd_okay}:rel + PC
    x"58",x"f8",x"50",x"d8",                         -- f7e5 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3dd_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"4c",x"d8",       -- f7e9 |   jne A, 0x7b, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3di:
    x"60",x"20",x"1c",x"7b",                         -- f7f0 |   mov A, 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f7f4 |   mov [0x64], 0x141
    x"e9",x"20",x"1c",x"f8",x"64",x"3b",x"d8",       -- f7fa |   jeq A, [0x64], ${fail}:rel + PC
    x"ed",x"20",x"1c",x"f8",x"64",x"0b",x"00",       -- f801 |   jne A, [0x64], ${test_uop_jmp_3di_okay}:rel + PC
    x"58",x"f8",x"2d",x"d8",                         -- f808 |   jmp ${fail}:rel + PC
                                                     --      | test_uop_jmp_3di_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"29",x"d8",       -- f80c |   jne A, 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"22",x"d8", -- f813 |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3id:
    x"60",x"20",x"1c",x"7b",                         -- f81c |   mov A, 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f820 |   mov [0x64], 0x141
    x"ea",x"1c",x"20",x"f8",x"64",x"0f",x"d8",       -- f826 |   jeq [0x64], A, ${fail}:rel + PC
    x"ee",x"1c",x"20",x"f8",x"64",x"0b",x"00",       -- f82d |   jne [0x64], A, ${_test_uop_jmp_3id_okay}:rel + PC
    x"58",x"f8",x"01",x"d8",                         -- f834 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3id_okay:
    x"ec",x"20",x"1c",x"f8",x"7b",x"fd",x"d7",       -- f838 |   jne A, 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"f6",x"d7", -- f83f |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_jmp_3ii:
    x"62",x"e0",x"1c",x"c8",x"00",x"7b",             -- f848 |   mov [0xc8], 0x7b
    x"62",x"1c",x"e0",x"64",x"41",x"01",             -- f84e |   mov [0x64], 0x141
    x"eb",x"1c",x"e0",x"f8",x"64",x"c8",x"00",x"e1",x"d7", -- f854 |   jeq [0x64], [0xc8], ${fail}:rel + PC
    x"ef",x"1c",x"e0",x"f8",x"64",x"c8",x"00",x"0d",x"00", -- f85d |   jne [0x64], [0xc8], ${_test_uop_jmp_3ii_okay}:rel + PC
    x"58",x"f8",x"cf",x"d7",                         -- f866 |   jmp ${fail}:rel + PC
                                                     --      | _test_uop_jmp_3ii_okay:
    x"ee",x"e0",x"1c",x"f8",x"c8",x"00",x"7b",x"cb",x"d7", -- f86a |   jne [0xc8], 0x7b, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"64",x"41",x"01",x"c2",x"d7", -- f873 |   jne [0x64], 0x141, ${fail}:rel + PC
                                                     --      | test_uop_mov_dd:
    x"60",x"20",x"1c",x"7b",                         -- f87c |   mov A, 0x7b
    x"ec",x"20",x"1c",x"f8",x"7b",x"b5",x"d7",       -- f880 |   jne A, 0x7b, ${fail}:rel + PC
                                                     --      | test_uop_mov_di:
    x"62",x"1c",x"1c",x"64",x"da",                   -- f887 |   mov [0x64], 0xda
    x"61",x"20",x"1c",x"64",                         -- f88c |   mov A, [0x64]
    x"ec",x"20",x"1c",x"f8",x"da",x"a5",x"d7",       -- f890 |   jne A, 0xda, ${fail}:rel + PC
                                                     --      | test_uop_mov_id:
    x"62",x"1c",x"1c",x"64",x"ff",                   -- f897 |   mov [0x64], 0xff
    x"ee",x"1c",x"1c",x"f8",x"64",x"ff",x"99",x"d7", -- f89c |   jne [0x64], 0xff, ${fail}:rel + PC
                                                     --      | test_uop_mov_ii:
    x"60",x"20",x"1c",x"14",                         -- f8a4 |   mov A, 0x14
    x"62",x"1c",x"e0",x"78",x"fa",x"fd",             -- f8a8 |   mov [0x78], 0xfdfa
    x"63",x"1c",x"3c",x"64",x"64",                   -- f8ae |   mov [0x64], [A + 0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"fa",x"fd",x"82",x"d7", -- f8b3 |   jne [0x64], 0xfdfa, ${fail}:rel + PC
                                                     --      | test_uop_bmov_dd:
    x"64",x"20",x"e0",x"de",x"af",                   -- f8bc |   bmov A, 0xafde
    x"ec",x"20",x"e0",x"f8",x"de",x"00",x"74",x"d7", -- f8c1 |   jne A, 0xde, ${fail}:rel + PC
    x"64",x"20",x"e0",x"fa",x"00",                   -- f8c9 |   bmov A, 0xfa
    x"ec",x"20",x"e0",x"f8",x"fa",x"00",x"67",x"d7", -- f8ce |   jne A, 0xfa, ${fail}:rel + PC
                                                     --      | test_uop_bmov_di:
    x"62",x"1c",x"1c",x"64",x"da",                   -- f8d6 |   mov [0x64], 0xda
    x"65",x"20",x"1c",x"64",                         -- f8db |   bmov A, [0x64]
    x"ec",x"20",x"e0",x"f8",x"da",x"00",x"56",x"d7", -- f8df |   jne A, 0xda, ${fail}:rel + PC
                                                     --      | test_uop_bmov_id:
    x"62",x"1c",x"e0",x"64",x"cd",x"ab",             -- f8e7 |   mov [0x64], 0xabcd
    x"62",x"1c",x"e0",x"66",x"34",x"12",             -- f8ed |   mov [0x66], 0x1234
    x"62",x"1c",x"e0",x"68",x"78",x"56",             -- f8f3 |   mov [0x68], 0x5678
    x"66",x"1c",x"e0",x"66",x"df",x"00",             -- f8f9 |   bmov [0x66], 0xdf
    x"ee",x"1c",x"e0",x"f8",x"64",x"cd",x"ab",x"36",x"d7", -- f8ff |   jne [0x64], 0xabcd, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"df",x"12",x"2d",x"d7", -- f908 |   jne [0x66], 0x12df, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"68",x"78",x"56",x"24",x"d7", -- f911 |   jne [0x68], 0x5678, ${fail}:rel + PC
    x"66",x"1c",x"e0",x"67",x"b8",x"00",             -- f91a |   bmov [0x67], 0xb8
    x"ee",x"1c",x"e0",x"f8",x"64",x"cd",x"ab",x"15",x"d7", -- f920 |   jne [0x64], 0xabcd, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"66",x"df",x"b8",x"0c",x"d7", -- f929 |   jne [0x66], 0xb8df, ${fail}:rel + PC
    x"ee",x"1c",x"e0",x"f8",x"68",x"78",x"56",x"03",x"d7", -- f932 |   jne [0x68], 0x5678, ${fail}:rel + PC
                                                     --      | test_uop_bmov_ii:
    x"62",x"e0",x"e0",x"2c",x"01",x"df",x"00",       -- f93b |   mov [0x12c], 0xdf
    x"62",x"e0",x"e0",x"2e",x"01",x"b8",x"00",       -- f942 |   mov [0x12e], 0xb8
    x"62",x"e0",x"e0",x"c8",x"00",x"cd",x"ab",       -- f949 |   mov [0xc8], 0xabcd
    x"62",x"e0",x"e0",x"ca",x"00",x"34",x"12",       -- f950 |   mov [0xca], 0x1234
    x"62",x"e0",x"e0",x"cc",x"00",x"78",x"56",       -- f957 |   mov [0xcc], 0x5678
    x"67",x"e0",x"e0",x"ca",x"00",x"2c",x"01",       -- f95e |   bmov [0xca], [0x12c]
    x"ee",x"e0",x"e0",x"f8",x"c8",x"00",x"cd",x"ab",x"d0",x"d6", -- f965 |   jne [0xc8], 0xabcd, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"ca",x"00",x"df",x"12",x"c6",x"d6", -- f96f |   jne [0xca], 0x12df, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"cc",x"00",x"78",x"56",x"bc",x"d6", -- f979 |   jne [0xcc], 0x5678, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2c",x"01",x"df",x"00",x"b2",x"d6", -- f983 |   jne [0x12c], 0xdf, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2e",x"01",x"b8",x"00",x"a8",x"d6", -- f98d |   jne [0x12e], 0xb8, ${fail}:rel + PC
    x"67",x"e0",x"e0",x"cb",x"00",x"2e",x"01",       -- f997 |   bmov [0xcb], [0x12e]
    x"ee",x"e0",x"e0",x"f8",x"c8",x"00",x"cd",x"ab",x"97",x"d6", -- f99e |   jne [0xc8], 0xabcd, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"ca",x"00",x"df",x"b8",x"8d",x"d6", -- f9a8 |   jne [0xca], 0xb8df, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"cc",x"00",x"78",x"56",x"83",x"d6", -- f9b2 |   jne [0xcc], 0x5678, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2c",x"01",x"df",x"00",x"79",x"d6", -- f9bc |   jne [0x12c], 0xdf, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"2e",x"01",x"b8",x"00",x"6f",x"d6", -- f9c6 |   jne [0x12e], 0xb8, ${fail}:rel + PC
                                                     --      | test_uop_halt:
                                                     --      | test_uop_getf:
    x"50",x"1c",x"1c",x"7b",x"2d",                   -- f9d0 |   cmp 0x7b, 0x2d
    x"4c",x"20",                                     -- f9d5 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"5e",x"d6",       -- f9d7 |   jne A, 0x32, ${fail}:rel + PC
                                                     --      | test_uop_setf:
    x"cc",x"1c",x"ff",                               -- f9de |   setf 0xff
    x"4c",x"20",                                     -- f9e1 |   getf A
    x"ec",x"20",x"1c",x"f8",x"3f",x"52",x"d6",       -- f9e3 |   jne A, 0x3f, ${fail}:rel + PC
                                                     --      | test_uop_call_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- f9ea |   mov SP, 0x1000
    x"60",x"40",x"e0",x"0a",x"fa",                   -- f9ef |   mov B, ${_L_test_uop_call_d_fn}
    x"5c",x"40",                                     -- f9f4 |   call B
    x"ec",x"40",x"e0",x"f8",x"0a",x"fa",x"3f",x"d6", -- f9f6 |   jne B, ${_L_test_uop_call_d_fn}, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"fa",x"34",x"37",x"d6", -- f9fe |   jne A, 0x34fa, ${fail}:rel + PC
    x"58",x"f8",x"0a",x"00",                         -- fa06 |   jmp ${_L_test_uop_call_d_okay}:rel + PC
                                                     --      | _L_test_uop_call_d_fn:
    x"60",x"20",x"e0",x"fa",x"34",                   -- fa0a |   mov A, 0x34fa
    x"dc",                                           -- fa0f |   ret
                                                     --      | _L_test_uop_call_d_okay:
                                                     --      | test_uop_call_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fa10 |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- fa15 |   mov B, 0x64
    x"62",x"40",x"e0",x"34",x"fa",                   -- fa19 |   mov [B], ${_L_test_uop_call_i_fn}
    x"5e",x"40",                                     -- fa1e |   call [B]
    x"ee",x"40",x"e0",x"f8",x"34",x"fa",x"15",x"d6", -- fa20 |   jne [B], ${_L_test_uop_call_i_fn}, ${fail}:rel + PC
    x"ec",x"20",x"e0",x"f8",x"d4",x"aa",x"0d",x"d6", -- fa28 |   jne A, 0xaad4, ${fail}:rel + PC
    x"58",x"f8",x"0a",x"00",                         -- fa30 |   jmp ${_L_test_uop_call_i_okay}:rel + PC
                                                     --      | _L_test_uop_call_i_fn:
    x"60",x"20",x"e0",x"d4",x"aa",                   -- fa34 |   mov A, 0xaad4
    x"dc",                                           -- fa39 |   ret
                                                     --      | _L_test_uop_call_i_okay:
                                                     --      | test_uop_ret:
                                                     --      | test_uop_push_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fa3a |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- fa3f |   mov B, 0x64
    x"e0",x"40",                                     -- fa43 |   push B
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"f0",x"d5", -- fa45 |   jne SP, 0xffe, ${fail}:rel + PC
    x"ee",x"e0",x"1c",x"f8",x"fe",x"0f",x"64",x"e8",x"d5", -- fa4d |   jne [0xffe], 0x64, ${fail}:rel + PC
    x"e4",x"60",                                     -- fa56 |   pop C
    x"ec",x"60",x"1c",x"f8",x"64",x"dd",x"d5",       -- fa58 |   jne C, 0x64, ${fail}:rel + PC
                                                     --      | test_uop_push_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fa5f |   mov SP, 0x1000
    x"60",x"40",x"1c",x"64",                         -- fa64 |   mov B, 0x64
    x"62",x"40",x"e0",x"90",x"01",                   -- fa68 |   mov [B], 0x190
    x"e2",x"40",                                     -- fa6d |   push [B]
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"c6",x"d5", -- fa6f |   jne SP, 0xffe, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fe",x"0f",x"90",x"01",x"be",x"d5", -- fa77 |   jne [0xffe], 0x190, ${fail}:rel + PC
    x"e4",x"60",                                     -- fa81 |   pop C
    x"ec",x"60",x"e0",x"f8",x"90",x"01",x"b2",x"d5", -- fa83 |   jne C, 0x190, ${fail}:rel + PC
                                                     --      | test_uop_pop_d:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fa8b |   mov SP, 0x1000
    x"e0",x"e0",x"da",x"fa",                         -- fa90 |   push 0xfada
    x"e4",x"20",                                     -- fa94 |   pop A
    x"ec",x"20",x"e0",x"f8",x"da",x"fa",x"9f",x"d5", -- fa96 |   jne A, 0xfada, ${fail}:rel + PC
                                                     --      | test_uop_pop_i:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fa9e |   mov SP, 0x1000
    x"e0",x"e0",x"da",x"f2",                         -- faa3 |   push 0xf2da
    x"e6",x"1c",x"64",                               -- faa7 |   pop [0x64]
    x"ee",x"1c",x"e0",x"f8",x"64",x"da",x"f2",x"8b",x"d5", -- faaa |   jne [0x64], 0xf2da, ${fail}:rel + PC
                                                     --      | test_uop_mmap:
    x"62",x"e0",x"e0",x"00",x"30",x"00",x"ff",       -- fab3 |   mov [0x3000], 0xff00
    x"62",x"e0",x"e0",x"00",x"31",x"01",x"ff",       -- faba |   mov [0x3100], 0xff01
    x"62",x"e0",x"e0",x"00",x"32",x"02",x"ff",       -- fac1 |   mov [0x3200], 0xff02
    x"62",x"e0",x"e0",x"00",x"40",x"00",x"dd",       -- fac8 |   mov [0x4000], 0xdd00
    x"62",x"e0",x"e0",x"00",x"41",x"01",x"dd",       -- facf |   mov [0x4100], 0xdd01
    x"62",x"e0",x"e0",x"00",x"42",x"02",x"dd",       -- fad6 |   mov [0x4200], 0xdd02
    x"62",x"e0",x"e0",x"00",x"50",x"00",x"ee",       -- fadd |   mov [0x5000], 0xee00
    x"62",x"e0",x"e0",x"00",x"51",x"01",x"ee",       -- fae4 |   mov [0x5100], 0xee01
    x"62",x"e0",x"e0",x"00",x"52",x"02",x"ee",       -- faeb |   mov [0x5200], 0xee02
    x"60",x"20",x"00",                               -- faf2 |   mov A, 0
    x"60",x"40",x"e0",x"00",x"41",                   -- faf5 |   mov B, 0x4100
    x"54",x"e0",x"e0",x"1c",x"00",x"31",x"ff",x"32",x"01", -- fafa |   mmap 0x3100, 0x32ff, 0x1
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"dd",x"32",x"d5", -- fb03 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"02",x"dd",x"28",x"d5", -- fb0d |   jne [0x3200], 0xdd02, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"1e",x"d5", -- fb17 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"60",x"40",x"e0",x"00",x"51",                   -- fb21 |   mov B, 0x5100
    x"54",x"e0",x"e0",x"1c",x"00",x"32",x"ff",x"32",x"02", -- fb26 |   mmap 0x3200, 0x32ff, 0x2
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"01",x"ee",x"06",x"d5", -- fb2f |   jne [0x3200], 0xee01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"fc",x"d4", -- fb39 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"dd",x"f2",x"d4", -- fb43 |   jne [0x3100], 0xdd01, ${fail}:rel + PC
    x"d4",x"1c",x"01",                               -- fb4d |   umap 0x1
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"ff",x"e5",x"d4", -- fb50 |   jne [0x3100], 0xff01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"01",x"ee",x"db",x"d4", -- fb5a |   jne [0x3200], 0xee01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"d1",x"d4", -- fb64 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"d4",x"1c",x"02",                               -- fb6e |   umap 0x2
    x"ee",x"e0",x"e0",x"f8",x"00",x"30",x"00",x"ff",x"c4",x"d4", -- fb71 |   jne [0x3000], 0xff00, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"31",x"01",x"ff",x"ba",x"d4", -- fb7b |   jne [0x3100], 0xff01, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"00",x"32",x"02",x"ff",x"b0",x"d4", -- fb85 |   jne [0x3200], 0xff02, ${fail}:rel + PC
                                                     --      | test_uop_umap:
                                                     --      | test_aux_reg:
    x"60",x"20",x"1c",x"01",                         -- fb8f |   mov A, 0x1
    x"60",x"40",x"1c",x"02",                         -- fb93 |   mov B, 0x2
    x"60",x"60",x"1c",x"03",                         -- fb97 |   mov C, 0x3
    x"60",x"80",x"1c",x"04",                         -- fb9b |   mov D, 0x4
    x"60",x"fc",x"1c",x"05",                         -- fb9f |   mov E, 0x5
    x"60",x"fd",x"1c",x"06",                         -- fba3 |   mov F, 0x6
    x"60",x"fe",x"1c",x"07",                         -- fba7 |   mov G, 0x7
    x"60",x"ff",x"1c",x"08",                         -- fbab |   mov H, 0x8
    x"ec",x"20",x"1c",x"f8",x"01",x"86",x"d4",       -- fbaf |   jne A, 0x1, ${fail}:rel + PC
    x"ec",x"40",x"1c",x"f8",x"02",x"7f",x"d4",       -- fbb6 |   jne B, 0x2, ${fail}:rel + PC
    x"ec",x"60",x"1c",x"f8",x"03",x"78",x"d4",       -- fbbd |   jne C, 0x3, ${fail}:rel + PC
    x"ec",x"80",x"1c",x"f8",x"04",x"71",x"d4",       -- fbc4 |   jne D, 0x4, ${fail}:rel + PC
    x"ec",x"fc",x"1c",x"f8",x"05",x"6a",x"d4",       -- fbcb |   jne E, 0x5, ${fail}:rel + PC
    x"ec",x"fd",x"1c",x"f8",x"06",x"63",x"d4",       -- fbd2 |   jne F, 0x6, ${fail}:rel + PC
    x"ec",x"fe",x"1c",x"f8",x"07",x"5c",x"d4",       -- fbd9 |   jne G, 0x7, ${fail}:rel + PC
    x"ec",x"ff",x"1c",x"f8",x"08",x"55",x"d4",       -- fbe0 |   jne H, 0x8, ${fail}:rel + PC
    x"34",x"ff",x"e0",x"00",x"ff",                   -- fbe7 |   xor H, 0xff00
    x"ec",x"ff",x"e0",x"f8",x"08",x"ff",x"49",x"d4", -- fbec |   jne H, 0xff08, ${fail}:rel + PC
    x"60",x"20",x"ff",                               -- fbf4 |   mov A, H
    x"ec",x"20",x"e0",x"f8",x"08",x"ff",x"3e",x"d4", -- fbf7 |   jne A, 0xff08, ${fail}:rel + PC
    x"60",x"fc",x"fe",                               -- fbff |   mov E, G
    x"ec",x"fc",x"1c",x"f8",x"07",x"33",x"d4",       -- fc02 |   jne E, 0x7, ${fail}:rel + PC
    x"ec",x"ff",x"e0",x"f8",x"08",x"ff",x"2c",x"d4", -- fc09 |   jne H, 0xff08, ${fail}:rel + PC
                                                     --      | test_call_ret:
    x"60",x"a0",x"e0",x"00",x"10",                   -- fc11 |   mov SP, 0x1000
    x"5c",x"f8",x"77",x"00",                         -- fc16 |   call ${fn_test_target}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"1b",x"d4", -- fc1a |   jne SP, 0x1000, ${fail}:rel + PC
    x"60",x"20",x"1c",x"0a",                         -- fc22 |   mov A, 0xa
    x"60",x"40",x"00",                               -- fc26 |   mov B, 0
    x"60",x"60",x"00",                               -- fc29 |   mov C, 0
    x"60",x"80",x"00",                               -- fc2c |   mov D, 0
    x"5c",x"f8",x"2d",x"00",                         -- fc2f |   call ${fn_recursive}:rel + PC
    x"ec",x"20",x"00",x"f8",x"02",x"d4",             -- fc33 |   jne A, 0, ${fail}:rel + PC
    x"ec",x"40",x"e0",x"f8",x"3f",x"cf",x"fc",x"d3", -- fc39 |   jne B, 0xcf3f, ${fail}:rel + PC
    x"ec",x"60",x"1c",x"f8",x"2d",x"f4",x"d3",       -- fc41 |   jne C, 0x2d, ${fail}:rel + PC
    x"ec",x"80",x"e0",x"f8",x"97",x"45",x"ed",x"d3", -- fc48 |   jne D, 0x4597, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"e5",x"d3", -- fc50 |   jne SP, 0x1000, ${fail}:rel + PC
    x"58",x"f8",x"42",x"00",                         -- fc58 |   jmp ${test_call_ret_end}:rel + PC
                                                     --      | fn_recursive:
    x"04",x"20",x"1c",x"01",                         -- fc5c |   sub A, 0x1
    x"5c",x"f8",x"25",x"00",                         -- fc60 |   call ${fn_process_c}:rel + PC
    x"e8",x"20",x"00",x"f8",x"1c",x"00",             -- fc64 |   jeq A, 0, ${fn_recursive_end}:rel + PC
    x"5c",x"f8",x"f2",x"ff",                         -- fc6a |   call ${fn_recursive}:rel + PC
    x"00",x"80",x"60",                               -- fc6e |   add D, C
    x"08",x"80",x"1c",x"03",                         -- fc71 |   mul D, 0x3
    x"00",x"40",x"80",                               -- fc75 |   add B, D
    x"e0",x"80",                                     -- fc78 |   push D
    x"08",x"40",x"1c",x"05",                         -- fc7a |   mul B, 0x5
    x"e4",x"80",                                     -- fc7e |   pop D
                                                     --      | fn_recursive_end:
    x"dc",                                           -- fc80 |   ret
    x"58",x"f8",x"b4",x"d3",                         -- fc81 |   jmp ${fail}:rel + PC
                                                     --      | fn_process_c:
    x"00",x"60",x"20",                               -- fc85 |   add C, A
    x"dc",                                           -- fc88 |   ret
    x"58",x"f8",x"ac",x"d3",                         -- fc89 |   jmp ${fail}:rel + PC
                                                     --      | fn_test_target:
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"a8",x"d3", -- fc8d |   jne SP, 0xffe, ${fail}:rel + PC
    x"dc",                                           -- fc95 |   ret
    x"58",x"f8",x"9f",x"d3",                         -- fc96 |   jmp ${fail}:rel + PC
                                                     --      | test_call_ret_end:
                                                     --      | test_mem_access:
    x"62",x"e0",x"1c",x"00",x"01",x"ed",             -- fc9a |   mov [0x100], 0xed
    x"ee",x"e0",x"e0",x"f8",x"00",x"01",x"aa",x"00",x"0e",x"00", -- fca0 |   jne [0x100], 0xaa, ${test_mem_access_check_jmp}:rel + PC
    x"58",x"f8",x"8b",x"d3",                         -- fcaa |   jmp ${fail}:rel + PC
                                                     --      | test_mem_access_check_jmp:
    x"62",x"e0",x"00",x"00",x"10",                   -- fcae |   mov [0x1000], 0
    x"60",x"a0",x"e0",x"00",x"10",                   -- fcb3 |   mov SP, 0x1000
    x"ee",x"a0",x"00",x"f8",x"7d",x"d3",             -- fcb8 |   jne [SP], 0, ${fail}:rel + PC
    x"e0",x"00",                                     -- fcbe |   push 0
    x"e0",x"00",                                     -- fcc0 |   push 0
    x"e0",x"00",                                     -- fcc2 |   push 0
    x"e4",x"20",                                     -- fcc4 |   pop A
    x"e4",x"20",                                     -- fcc6 |   pop A
    x"e4",x"20",                                     -- fcc8 |   pop A
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"6b",x"d3", -- fcca |   jne SP, 0x1000, ${fail}:rel + PC
    x"ec",x"20",x"00",x"f8",x"63",x"d3",             -- fcd2 |   jne A, 0, ${fail}:rel + PC
    x"e0",x"e0",x"02",x"01",                         -- fcd8 |   push 0x102
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"59",x"d3", -- fcdc |   jne SP, 0xffe, ${fail}:rel + PC
    x"e0",x"e0",x"04",x"03",                         -- fce4 |   push 0x304
    x"ec",x"a0",x"e0",x"f8",x"fc",x"0f",x"4d",x"d3", -- fce8 |   jne SP, 0xffc, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fe",x"0f",x"02",x"01",x"45",x"d3", -- fcf0 |   jne [0xffe], 0x102, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fc",x"0f",x"04",x"03",x"3b",x"d3", -- fcfa |   jne [0xffc], 0x304, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fb",x"0f",x"00",x"04",x"31",x"d3", -- fd04 |   jne [0xffb], 0x400, ${fail}:rel + PC
    x"ee",x"e0",x"e0",x"f8",x"fd",x"0f",x"03",x"02",x"27",x"d3", -- fd0e |   jne [0xffd], 0x203, ${fail}:rel + PC
    x"ee",x"e0",x"1c",x"f8",x"ff",x"0f",x"01",x"1d",x"d3", -- fd18 |   jne [0xfff], 0x1, ${fail}:rel + PC
    x"e4",x"20",                                     -- fd21 |   pop A
    x"ec",x"20",x"e0",x"f8",x"04",x"03",x"12",x"d3", -- fd23 |   jne A, 0x304, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"fe",x"0f",x"0a",x"d3", -- fd2b |   jne SP, 0xffe, ${fail}:rel + PC
    x"e4",x"20",                                     -- fd33 |   pop A
    x"ec",x"20",x"e0",x"f8",x"02",x"01",x"00",x"d3", -- fd35 |   jne A, 0x102, ${fail}:rel + PC
    x"ec",x"a0",x"e0",x"f8",x"00",x"10",x"f8",x"d2", -- fd3d |   jne SP, 0x1000, ${fail}:rel + PC
                                                     --      | test_cmp:
    x"cc",x"1c",x"ff",                               -- fd45 |   setf 0xff
    x"4c",x"20",                                     -- fd48 |   getf A
    x"ec",x"20",x"1c",x"f8",x"3f",x"eb",x"d2",       -- fd4a |   jne A, 0x3f, ${fail}:rel + PC
    x"cc",x"e0",x"ab",x"ab",                         -- fd51 |   setf 0xabab
    x"4c",x"20",                                     -- fd55 |   getf A
    x"ec",x"20",x"1c",x"f8",x"2b",x"de",x"d2",       -- fd57 |   jne A, 0x2b, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"ab",x"2b",                   -- fd5e |   cmp 0xab, 0x2b
    x"4c",x"20",                                     -- fd63 |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"d0",x"d2",       -- fd65 |   jne A, 0x32, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"2b",x"ab",                   -- fd6c |   cmp 0x2b, 0xab
    x"4c",x"20",                                     -- fd71 |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"c2",x"d2",       -- fd73 |   jne A, 0xe, ${fail}:rel + PC
    x"50",x"1c",x"1c",x"ab",x"ab",                   -- fd7a |   cmp 0xab, 0xab
    x"4c",x"20",                                     -- fd7f |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"b4",x"d2",       -- fd81 |   jne A, 0x29, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"ab",x"2b",                   -- fd88 |   icmp 0xab, 0x2b
    x"4c",x"20",                                     -- fd8d |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"a6",x"d2",       -- fd8f |   jne A, 0xe, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"2b",x"ab",                   -- fd96 |   icmp 0x2b, 0xab
    x"4c",x"20",                                     -- fd9b |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"98",x"d2",       -- fd9d |   jne A, 0x32, ${fail}:rel + PC
    x"d0",x"1c",x"1c",x"ab",x"ab",                   -- fda4 |   icmp 0xab, 0xab
    x"4c",x"20",                                     -- fda9 |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"8a",x"d2",       -- fdab |   jne A, 0x29, ${fail}:rel + PC
                                                     --      | test_cmp_direct:
    x"60",x"60",x"1c",x"ab",                         -- fdb2 |   mov C, 0xab
    x"60",x"80",x"1c",x"2b",                         -- fdb6 |   mov D, 0x2b
    x"50",x"60",x"80",                               -- fdba |   cmp C, D
    x"4c",x"20",                                     -- fdbd |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"76",x"d2",       -- fdbf |   jne A, 0x32, ${fail}:rel + PC
    x"50",x"80",x"60",                               -- fdc6 |   cmp D, C
    x"4c",x"20",                                     -- fdc9 |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"6a",x"d2",       -- fdcb |   jne A, 0xe, ${fail}:rel + PC
    x"50",x"60",x"60",                               -- fdd2 |   cmp C, C
    x"4c",x"20",                                     -- fdd5 |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"5e",x"d2",       -- fdd7 |   jne A, 0x29, ${fail}:rel + PC
    x"d0",x"60",x"80",                               -- fdde |   icmp C, D
    x"4c",x"20",                                     -- fde1 |   getf A
    x"ec",x"20",x"1c",x"f8",x"0e",x"52",x"d2",       -- fde3 |   jne A, 0xe, ${fail}:rel + PC
    x"d0",x"80",x"60",                               -- fdea |   icmp D, C
    x"4c",x"20",                                     -- fded |   getf A
    x"ec",x"20",x"1c",x"f8",x"32",x"46",x"d2",       -- fdef |   jne A, 0x32, ${fail}:rel + PC
    x"d0",x"60",x"60",                               -- fdf6 |   icmp C, C
    x"4c",x"20",                                     -- fdf9 |   getf A
    x"ec",x"20",x"1c",x"f8",x"29",x"3a",x"d2",       -- fdfb |   jne A, 0x29, ${fail}:rel + PC
                                                     --      | end_of_test:
    x"60",x"20",x"e0",x"ad",x"de",                   -- fe02 |   mov A, 0xdead
    x"60",x"40",x"e0",x"ef",x"be",                   -- fe07 |   mov B, 0xbeef
    x"88",x"60",x"20",x"40",                         -- fe0c |   mul C, A, B
    x"58",x"f8",x"2a",x"d2",                         -- fe10 |   jmp ${success}:rel + PC
    x"dc",                                           -- fe14 |   ret
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
