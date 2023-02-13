
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 1234;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | SECTION_BEGIN_boot:
                                                     --      | _B_boot_1:
    x"e8",x"c0",x"e0",x"f8",x"00",x"e0",x"1d",x"00", -- e000 |   jeq PC, 0xe000, ${_E_boot_1}:rel + PC
    x"60",x"20",x"e0",x"ff",x"00",                   -- e008 |   mov A, 0xff
    x"60",x"40",x"00",                               -- e00d |   mov B, 0
    x"54",x"e0",x"e0",x"1c",x"00",x"e0",x"ff",x"fe",x"02", -- e010 |   mmap 0xe000, 0xfeff, 0x2
    x"58",x"e0",x"00",x"e0",                         -- e019 |   jmp 0xe000
                                                     --      | _E_boot_1:
    x"54",x"e0",x"e0",x"1c",x"00",x"e0",x"ff",x"fe",x"03", -- e01d |   mmap 0xe000, 0xfeff, 0x3
    x"d4",x"1c",x"02",                               -- e026 |   umap 0x2
    x"60",x"a0",x"e0",x"00",x"05",                   -- e029 |   mov SP, 0x500
    x"5c",x"f8",x"05",x"00",                         -- e02e |   call ${fn_start}:rel + PC
    x"d8",                                           -- e032 |   halt
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_start:
    x"60",x"20",x"e0",x"fd",x"00",                   -- e033 |   mov A, 0xfd
    x"60",x"40",x"00",                               -- e038 |   mov B, 0
    x"54",x"e0",x"1c",x"1c",x"00",x"ff",x"ff",x"02", -- e03b |   mmap 0xff00, 0xff, 0x2
    x"60",x"20",x"e0",x"a2",x"e4",                   -- e043 |   mov A, ${const_data_1}
    x"5c",x"f8",x"2a",x"00",                         -- e048 |   call ${fn_send_data}:rel + PC
    x"60",x"20",x"ff",                               -- e04c |   mov A, H
    x"62",x"e0",x"1c",x"30",x"01",x"01",             -- e04f |   mov [${var_led_status}], 0x1
    x"63",x"e0",x"e0",x"0a",x"ff",x"30",x"01",       -- e055 |   mov [0xff0a], [${var_led_status}]
                                                     --      | _B_fn_start_1:
    x"5c",x"f8",x"56",x"00",                         -- e05c |   call ${fn_recv_command}:rel + PC
    x"5c",x"f8",x"bb",x"00",                         -- e060 |   call ${fn_led_activity}:rel + PC
    x"60",x"20",x"e0",x"00",x"00",                   -- e064 |   mov A, ${var_uart_recv_buf}
    x"5c",x"f8",x"be",x"00",                         -- e069 |   call ${fn_parse_command}:rel + PC
    x"58",x"f8",x"ef",x"ff",                         -- e06d |   jmp ${_B_fn_start_1}:rel + PC
                                                     --      | _E_fn_start_1:
    x"dc",                                           -- e071 |   ret
                                                     --      | end_fn_start:
                                                     --      | 
                                                     --      | fn_send_data:
    x"e0",x"20",                                     -- e072 |   push A
    x"e0",x"40",                                     -- e074 |   push B
    x"e0",x"60",                                     -- e076 |   push C
    x"60",x"60",x"1c",x"11",                         -- e078 |   mov C, 0x11
                                                     --      | _B_fn_send_data_1:
    x"61",x"40",x"20",                               -- e07c |   mov B, [A]
    x"2c",x"40",x"e0",x"ff",x"00",                   -- e07f |   and B, 0xff
    x"e8",x"40",x"00",x"f8",x"27",x"00",             -- e084 |   jeq B, 0, ${_E_fn_send_data_1}:rel + PC
                                                     --      | _B_fn_send_data_2:
    x"f0",x"60",x"1c",x"f8",x"10",x"14",x"00",       -- e08a |   jlt C, 0x10, ${_E_fn_send_data_2}:rel + PC
    x"61",x"60",x"e0",x"04",x"ff",                   -- e091 |   mov C, [0xff04]
    x"2c",x"60",x"1c",x"3f",                         -- e096 |   and C, 0x3f
    x"58",x"f8",x"f0",x"ff",                         -- e09a |   jmp ${_B_fn_send_data_2}:rel + PC
                                                     --      | _E_fn_send_data_2:
    x"62",x"e0",x"40",x"00",x"ff",                   -- e09e |   mov [0xff00], B
    x"44",x"20",                                     -- e0a3 |   inc A
    x"44",x"60",                                     -- e0a5 |   inc C
    x"58",x"f8",x"d5",x"ff",                         -- e0a7 |   jmp ${_B_fn_send_data_1}:rel + PC
                                                     --      | _E_fn_send_data_1:
    x"e4",x"60",                                     -- e0ab |   pop C
    x"e4",x"40",                                     -- e0ad |   pop B
    x"e4",x"20",                                     -- e0af |   pop A
    x"dc",                                           -- e0b1 |   ret
                                                     --      | end_fn_send_data:
                                                     --      | 
                                                     --      | fn_recv_command:
    x"e0",x"20",                                     -- e0b2 |   push A
    x"e0",x"60",                                     -- e0b4 |   push C
    x"e0",x"80",                                     -- e0b6 |   push D
    x"e0",x"fe",                                     -- e0b8 |   push G
    x"60",x"20",x"00",                               -- e0ba |   mov A, 0
                                                     --      | _B_fn_recv_command_1:
                                                     --      | _B_fn_recv_command_2:
    x"f0",x"20",x"e0",x"f8",x"95",x"00",x"1b",x"00", -- e0bd |   jlt A, 0x95, ${_E_fn_recv_command_2}:rel + PC
    x"60",x"fe",x"20",                               -- e0c5 |   mov G, A
    x"60",x"20",x"e0",x"a9",x"e4",                   -- e0c8 |   mov A, ${const_data_2}
    x"5c",x"f8",x"a5",x"ff",                         -- e0cd |   call ${fn_send_data}:rel + PC
    x"60",x"20",x"fe",                               -- e0d1 |   mov A, G
    x"58",x"f8",x"38",x"00",                         -- e0d4 |   jmp ${_E_fn_recv_command_1}:rel + PC
                                                     --      | _E_fn_recv_command_2:
    x"61",x"60",x"e0",x"02",x"ff",                   -- e0d8 |   mov C, [0xff02]
    x"ac",x"80",x"60",x"e0",x"00",x"80",             -- e0dd |   and D, C, 0x8000
    x"e8",x"80",x"00",x"f8",x"da",x"ff",             -- e0e3 |   jeq D, 0, ${_B_fn_recv_command_1}:rel + PC
    x"2c",x"60",x"e0",x"ff",x"00",                   -- e0e9 |   and C, 0xff
    x"62",x"e0",x"60",x"00",x"ff",                   -- e0ee |   mov [0xff00], C
    x"e8",x"60",x"1c",x"f8",x"0a",x"19",x"00",       -- e0f3 |   jeq C, 0xa, ${_E_fn_recv_command_1}:rel + PC
    x"e8",x"60",x"1c",x"f8",x"0d",x"c3",x"ff",       -- e0fa |   jeq C, 0xd, ${_B_fn_recv_command_1}:rel + PC
    x"62",x"e4",x"60",x"00",x"00",                   -- e101 |   mov [${var_uart_recv_buf} + A], C
    x"44",x"20",                                     -- e106 |   inc A
    x"58",x"f8",x"b5",x"ff",                         -- e108 |   jmp ${_B_fn_recv_command_1}:rel + PC
                                                     --      | _E_fn_recv_command_1:
    x"66",x"20",x"00",                               -- e10c |   bmov [A], 0
    x"60",x"ff",x"20",                               -- e10f |   mov H, A
    x"e4",x"fe",                                     -- e112 |   pop G
    x"e4",x"80",                                     -- e114 |   pop D
    x"e4",x"60",                                     -- e116 |   pop C
    x"e4",x"20",                                     -- e118 |   pop A
    x"dc",                                           -- e11a |   ret
                                                     --      | end_fn_recv_command:
                                                     --      | 
                                                     --      | fn_led_activity:
    x"46",x"e0",x"30",x"01",                         -- e11b |   inc [${var_led_status}]
    x"63",x"e0",x"e0",x"0a",x"ff",x"30",x"01",       -- e11f |   mov [0xff0a], [${var_led_status}]
    x"dc",                                           -- e126 |   ret
                                                     --      | end_fn_led_activity:
                                                     --      | 
                                                     --      | fn_parse_command:
    x"e0",x"40",                                     -- e127 |   push B
    x"e0",x"60",                                     -- e129 |   push C
    x"5c",x"f8",x"8a",x"00",                         -- e12b |   call ${fn_split_command}:rel + PC
    x"60",x"40",x"ff",                               -- e12f |   mov B, H
    x"60",x"60",x"e0",x"b3",x"e4",                   -- e132 |   mov C, ${const_data_3}
    x"5c",x"f8",x"9c",x"00",                         -- e137 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_3:
    x"e8",x"ff",x"00",x"f8",x"18",x"00",             -- e13b |   jeq H, 0, ${_E_fn_parse_command_3}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- e141 |   mov A, B + 0x1
    x"5c",x"f8",x"d0",x"00",                         -- e145 |   call ${fn_handle_ping}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"5e",x"00",             -- e149 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"61",x"00",                         -- e14f |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_3:
    x"60",x"60",x"e0",x"be",x"e4",                   -- e153 |   mov C, ${const_data_5}
    x"5c",x"f8",x"7b",x"00",                         -- e158 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_4:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- e15c |   jeq H, 0, ${_E_fn_parse_command_4}:rel + PC
    x"65",x"ff",x"40",                               -- e162 |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"42",x"00",             -- e165 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- e16b |   mov A, B + 0x1
    x"5c",x"f8",x"b8",x"00",                         -- e16f |   call ${fn_handle_read}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"34",x"00",             -- e173 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"37",x"00",                         -- e179 |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_4:
    x"60",x"60",x"e0",x"c3",x"e4",                   -- e17d |   mov C, ${const_data_6}
    x"5c",x"f8",x"51",x"00",                         -- e182 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_5:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- e186 |   jeq H, 0, ${_E_fn_parse_command_5}:rel + PC
    x"65",x"ff",x"40",                               -- e18c |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"18",x"00",             -- e18f |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- e195 |   mov A, B + 0x1
    x"5c",x"f8",x"60",x"02",                         -- e199 |   call ${fn_handle_write}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"0a",x"00",             -- e19d |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"0d",x"00",                         -- e1a3 |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_5:
                                                     --      | _L_fn_parse_command_2:
    x"60",x"20",x"e0",x"c9",x"e4",                   -- e1a7 |   mov A, ${const_data_7}
    x"5c",x"f8",x"c6",x"fe",                         -- e1ac |   call ${fn_send_data}:rel + PC
                                                     --      | _L_fn_parse_command_1:
    x"e4",x"60",                                     -- e1b0 |   pop C
    x"e4",x"40",                                     -- e1b2 |   pop B
    x"dc",                                           -- e1b4 |   ret
                                                     --      | end_fn_parse_command:
                                                     --      | 
                                                     --      | fn_split_command:
    x"e0",x"60",                                     -- e1b5 |   push C
    x"60",x"ff",x"20",                               -- e1b7 |   mov H, A
                                                     --      | _B_fn_split_command_1:
    x"65",x"60",x"ff",                               -- e1ba |   bmov C, [H]
    x"e8",x"60",x"1c",x"f8",x"20",x"13",x"00",       -- e1bd |   jeq C, 0x20, ${_E_fn_split_command_1}:rel + PC
    x"e8",x"60",x"00",x"f8",x"0c",x"00",             -- e1c4 |   jeq C, 0, ${_E_fn_split_command_1}:rel + PC
    x"44",x"ff",                                     -- e1ca |   inc H
    x"58",x"f8",x"ee",x"ff",                         -- e1cc |   jmp ${_B_fn_split_command_1}:rel + PC
                                                     --      | _E_fn_split_command_1:
    x"e4",x"60",                                     -- e1d0 |   pop C
    x"dc",                                           -- e1d2 |   ret
                                                     --      | end_fn_split_command:
                                                     --      | 
                                                     --      | fn_string_cmp:
    x"e0",x"20",                                     -- e1d3 |   push A
    x"e0",x"40",                                     -- e1d5 |   push B
    x"e0",x"60",                                     -- e1d7 |   push C
    x"e0",x"fd",                                     -- e1d9 |   push F
    x"e0",x"fe",                                     -- e1db |   push G
    x"60",x"ff",x"00",                               -- e1dd |   mov H, 0
                                                     --      | _B_fn_string_cmp_3:
    x"65",x"fd",x"20",                               -- e1e0 |   bmov F, [A]
    x"65",x"fe",x"60",                               -- e1e3 |   bmov G, [C]
    x"e8",x"20",x"40",x"f8",x"1a",x"00",             -- e1e6 |   jeq A, B, ${_L_fn_string_cmp_2}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"1e",x"00",             -- e1ec |   jeq G, 0, ${_L_fn_string_cmp_1}:rel + PC
    x"ec",x"fd",x"fe",x"f8",x"18",x"00",             -- e1f2 |   jne F, G, ${_L_fn_string_cmp_1}:rel + PC
    x"44",x"20",                                     -- e1f8 |   inc A
    x"44",x"60",                                     -- e1fa |   inc C
    x"58",x"f8",x"e4",x"ff",                         -- e1fc |   jmp ${_B_fn_string_cmp_3}:rel + PC
                                                     --      | _E_fn_string_cmp_3:
                                                     --      | _L_fn_string_cmp_2:
    x"ec",x"fe",x"00",x"f8",x"0a",x"00",             -- e200 |   jne G, 0, ${_L_fn_string_cmp_1}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- e206 |   mov H, 0x1
                                                     --      | _L_fn_string_cmp_1:
    x"e4",x"fe",                                     -- e20a |   pop G
    x"e4",x"fd",                                     -- e20c |   pop F
    x"e4",x"60",                                     -- e20e |   pop C
    x"e4",x"40",                                     -- e210 |   pop B
    x"e4",x"20",                                     -- e212 |   pop A
    x"dc",                                           -- e214 |   ret
                                                     --      | end_fn_string_cmp:
                                                     --      | 
                                                     --      | fn_handle_ping:
    x"e0",x"20",                                     -- e215 |   push A
    x"60",x"20",x"e0",x"b8",x"e4",                   -- e217 |   mov A, ${const_data_4}
    x"5c",x"f8",x"56",x"fe",                         -- e21c |   call ${fn_send_data}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- e220 |   mov H, 0x1
    x"e4",x"20",                                     -- e224 |   pop A
    x"dc",                                           -- e226 |   ret
                                                     --      | end_fn_handle_ping:
                                                     --      | 
                                                     --      | fn_handle_read:
    x"e0",x"20",                                     -- e227 |   push A
    x"e0",x"40",                                     -- e229 |   push B
    x"e0",x"60",                                     -- e22b |   push C
    x"e0",x"80",                                     -- e22d |   push D
    x"e0",x"fc",                                     -- e22f |   push E
    x"e0",x"fd",                                     -- e231 |   push F
    x"e0",x"fe",                                     -- e233 |   push G
    x"5c",x"f8",x"93",x"00",                         -- e235 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"7d",x"00",             -- e239 |   jeq G, 0, ${_L_fn_handle_read_2}:rel + PC
    x"60",x"60",x"ff",                               -- e23f |   mov C, H
    x"5c",x"f8",x"86",x"00",                         -- e242 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"70",x"00",             -- e246 |   jeq G, 0, ${_L_fn_handle_read_2}:rel + PC
    x"60",x"80",x"ff",                               -- e24c |   mov D, H
    x"60",x"20",x"e0",x"98",x"00",                   -- e24f |   mov A, ${var_uart_send_buf}
    x"60",x"40",x"60",                               -- e254 |   mov B, C
    x"5c",x"f8",x"3d",x"01",                         -- e257 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- e25b |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- e260 |   mov A, A + 0x5
    x"60",x"40",x"80",                               -- e264 |   mov B, D
    x"5c",x"f8",x"2d",x"01",                         -- e267 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- e26b |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- e270 |   mov A, A + 0x5
                                                     --      | _B_fn_handle_read_3:
    x"fc",x"20",x"e0",x"f8",x"95",x"00",x"42",x"00", -- e274 |   jge A, ${var_uart_recv_buf} + 0095, ${_L_fn_handle_read_2}:rel + PC
    x"fc",x"60",x"80",x"f8",x"25",x"00",             -- e27c |   jge C, D, ${_E_fn_handle_read_3}:rel + PC
    x"61",x"fc",x"60",                               -- e282 |   mov E, [C]
    x"a8",x"40",x"fc",x"1c",x"08",                   -- e285 |   shl B, E, 0x8
    x"20",x"fc",x"1c",x"08",                         -- e28a |   shr E, 0x8
    x"30",x"40",x"fc",                               -- e28e |   or B, E
    x"5c",x"f8",x"03",x"01",                         -- e291 |   call ${fn_put_hex_16}:rel + PC
    x"60",x"20",x"3c",x"04",                         -- e295 |   mov A, A + 0x4
    x"60",x"60",x"7c",x"02",                         -- e299 |   mov C, C + 0x2
    x"58",x"f8",x"d7",x"ff",                         -- e29d |   jmp ${_B_fn_handle_read_3}:rel + PC
                                                     --      | _E_fn_handle_read_3:
    x"62",x"20",x"1c",x"0a",                         -- e2a1 |   mov [A], 0xa
    x"60",x"20",x"e0",x"98",x"00",                   -- e2a5 |   mov A, ${var_uart_send_buf}
    x"5c",x"f8",x"c8",x"fd",                         -- e2aa |   call ${fn_send_data}:rel + PC
                                                     --      | _B_fn_handle_read_4:
                                                     --      | _L_fn_handle_read_1:
    x"60",x"ff",x"1c",x"01",                         -- e2ae |   mov H, 0x1
    x"58",x"f8",x"07",x"00",                         -- e2b2 |   jmp ${_E_fn_handle_read_4}:rel + PC
                                                     --      | _L_fn_handle_read_2:
    x"60",x"ff",x"00",                               -- e2b6 |   mov H, 0
                                                     --      | _E_fn_handle_read_4:
    x"e4",x"fe",                                     -- e2b9 |   pop G
    x"e4",x"fd",                                     -- e2bb |   pop F
    x"e4",x"fc",                                     -- e2bd |   pop E
    x"e4",x"80",                                     -- e2bf |   pop D
    x"e4",x"60",                                     -- e2c1 |   pop C
    x"e4",x"40",                                     -- e2c3 |   pop B
    x"e4",x"20",                                     -- e2c5 |   pop A
    x"dc",                                           -- e2c7 |   ret
                                                     --      | end_fn_handle_read:
                                                     --      | 
                                                     --      | fn__parse_hex_arg:
                                                     --      | _B_fn__parse_hex_arg_2:
    x"65",x"ff",x"20",                               -- e2c8 |   bmov H, [A]
    x"ec",x"ff",x"1c",x"f8",x"20",x"09",x"00",       -- e2cb |   jne H, 0x20, ${_E_fn__parse_hex_arg_2}:rel + PC
    x"44",x"20",                                     -- e2d2 |   inc A
                                                     --      | _E_fn__parse_hex_arg_2:
    x"5c",x"f8",x"e1",x"fe",                         -- e2d4 |   call ${fn_split_command}:rel + PC
    x"60",x"fe",x"00",                               -- e2d8 |   mov G, 0
    x"ec",x"3c",x"ff",x"f8",x"04",x"19",x"00",       -- e2db |   jne A + 0x4, H, ${_L_fn__parse_hex_arg_1}:rel + PC
    x"5c",x"f8",x"13",x"00",                         -- e2e2 |   call ${fn_parse_hex_16}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"0e",x"00",             -- e2e6 |   jeq G, 0, ${_L_fn__parse_hex_arg_1}:rel + PC
    x"60",x"fe",x"1c",x"01",                         -- e2ec |   mov G, 0x1
    x"60",x"20",x"3c",x"04",                         -- e2f0 |   mov A, A + 0x4
                                                     --      | _L_fn__parse_hex_arg_1:
    x"dc",                                           -- e2f4 |   ret
                                                     --      | end_fn__parse_hex_arg:
                                                     --      | 
                                                     --      | fn_parse_hex_16:
    x"e0",x"20",                                     -- e2f5 |   push A
    x"e0",x"60",                                     -- e2f7 |   push C
    x"5c",x"f8",x"58",x"00",                         -- e2f9 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"4f",x"00",             -- e2fd |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- e303 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- e307 |   or C, H
    x"44",x"20",                                     -- e30a |   inc A
    x"5c",x"f8",x"45",x"00",                         -- e30c |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"3c",x"00",             -- e310 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- e316 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- e31a |   or C, H
    x"44",x"20",                                     -- e31d |   inc A
    x"5c",x"f8",x"32",x"00",                         -- e31f |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"29",x"00",             -- e323 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- e329 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- e32d |   or C, H
    x"44",x"20",                                     -- e330 |   inc A
    x"5c",x"f8",x"1f",x"00",                         -- e332 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"16",x"00",             -- e336 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- e33c |   shl C, 0x4
    x"30",x"60",x"ff",                               -- e340 |   or C, H
    x"44",x"20",                                     -- e343 |   inc A
    x"60",x"ff",x"60",                               -- e345 |   mov H, C
    x"60",x"fe",x"1c",x"01",                         -- e348 |   mov G, 0x1
                                                     --      | _L_fn_parse_hex_16_1:
    x"e4",x"60",                                     -- e34c |   pop C
    x"e4",x"20",                                     -- e34e |   pop A
    x"dc",                                           -- e350 |   ret
                                                     --      | end_fn_parse_hex_16:
                                                     --      | 
                                                     --      | fn_parse_hex_4:
    x"65",x"ff",x"20",                               -- e351 |   bmov H, [A]
    x"30",x"ff",x"1c",x"20",                         -- e354 |   or H, 0x20
    x"f0",x"ff",x"1c",x"f8",x"30",x"38",x"00",       -- e358 |   jlt H, 0x30, ${_L_fn_parse_hex_4_2}:rel + PC
    x"f8",x"ff",x"1c",x"f8",x"66",x"31",x"00",       -- e35f |   jgt H, 0x66, ${_L_fn_parse_hex_4_2}:rel + PC
                                                     --      | _B_fn_parse_hex_4_3:
    x"f4",x"ff",x"1c",x"f8",x"39",x"12",x"00",       -- e366 |   jle H, 0x39, ${_E_fn_parse_hex_4_3}:rel + PC
    x"fc",x"ff",x"1c",x"f8",x"61",x"0b",x"00",       -- e36d |   jge H, 0x61, ${_E_fn_parse_hex_4_3}:rel + PC
    x"58",x"f8",x"1c",x"00",                         -- e374 |   jmp ${_L_fn_parse_hex_4_2}:rel + PC
                                                     --      | _E_fn_parse_hex_4_3:
                                                     --      | _B_fn_parse_hex_4_4:
    x"f8",x"ff",x"1c",x"f8",x"39",x"0f",x"00",       -- e378 |   jgt H, 0x39, ${_E_fn_parse_hex_4_4}:rel + PC
    x"04",x"ff",x"1c",x"30",                         -- e37f |   sub H, 0x30
    x"58",x"f8",x"08",x"00",                         -- e383 |   jmp ${_L_fn_parse_hex_4_1}:rel + PC
                                                     --      | _E_fn_parse_hex_4_4:
    x"04",x"ff",x"1c",x"57",                         -- e387 |   sub H, 0x57
                                                     --      | _L_fn_parse_hex_4_1:
    x"60",x"fe",x"1c",x"01",                         -- e38b |   mov G, 0x1
    x"dc",                                           -- e38f |   ret
                                                     --      | _L_fn_parse_hex_4_2:
    x"60",x"fe",x"00",                               -- e390 |   mov G, 0
    x"dc",                                           -- e393 |   ret
                                                     --      | end_fn_parse_hex_4:
                                                     --      | 
                                                     --      | fn_put_hex_16:
    x"e0",x"20",                                     -- e394 |   push A
    x"e0",x"40",                                     -- e396 |   push B
    x"e0",x"60",                                     -- e398 |   push C
    x"60",x"60",x"40",                               -- e39a |   mov C, B
    x"a0",x"40",x"60",x"1c",x"0c",                   -- e39d |   shr B, C, 0xc
    x"2c",x"40",x"1c",x"0f",                         -- e3a2 |   and B, 0xf
    x"5c",x"f8",x"39",x"00",                         -- e3a6 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- e3aa |   inc A
    x"a0",x"40",x"60",x"1c",x"08",                   -- e3ac |   shr B, C, 0x8
    x"2c",x"40",x"1c",x"0f",                         -- e3b1 |   and B, 0xf
    x"5c",x"f8",x"2a",x"00",                         -- e3b5 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- e3b9 |   inc A
    x"a0",x"40",x"60",x"1c",x"04",                   -- e3bb |   shr B, C, 0x4
    x"2c",x"40",x"1c",x"0f",                         -- e3c0 |   and B, 0xf
    x"5c",x"f8",x"1b",x"00",                         -- e3c4 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- e3c8 |   inc A
    x"a0",x"40",x"60",x"00",                         -- e3ca |   shr B, C, 0
    x"2c",x"40",x"1c",x"0f",                         -- e3ce |   and B, 0xf
    x"5c",x"f8",x"0d",x"00",                         -- e3d2 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- e3d6 |   inc A
    x"e4",x"60",                                     -- e3d8 |   pop C
    x"e4",x"40",                                     -- e3da |   pop B
    x"e4",x"20",                                     -- e3dc |   pop A
    x"dc",                                           -- e3de |   ret
                                                     --      | end_fn_put_hex_16:
                                                     --      | 
                                                     --      | fn_put_hex_4:
    x"60",x"ff",x"40",                               -- e3df |   mov H, B
                                                     --      | _B_fn_put_hex_4_2:
    x"f8",x"ff",x"1c",x"f8",x"09",x"0f",x"00",       -- e3e2 |   jgt H, 0x9, ${_E_fn_put_hex_4_2}:rel + PC
    x"00",x"ff",x"1c",x"30",                         -- e3e9 |   add H, 0x30
    x"58",x"f8",x"08",x"00",                         -- e3ed |   jmp ${_L_fn_put_hex_4_1}:rel + PC
                                                     --      | _E_fn_put_hex_4_2:
    x"00",x"ff",x"1c",x"57",                         -- e3f1 |   add H, 0x57
                                                     --      | _L_fn_put_hex_4_1:
    x"62",x"20",x"ff",                               -- e3f5 |   mov [A], H
    x"dc",                                           -- e3f8 |   ret
                                                     --      | end_fn_put_hex_4:
                                                     --      | 
                                                     --      | fn_handle_write:
    x"e0",x"20",                                     -- e3f9 |   push A
    x"e0",x"40",                                     -- e3fb |   push B
    x"e0",x"60",                                     -- e3fd |   push C
    x"e0",x"fc",                                     -- e3ff |   push E
    x"e0",x"fd",                                     -- e401 |   push F
    x"e0",x"fe",                                     -- e403 |   push G
    x"5c",x"f8",x"c3",x"fe",                         -- e405 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"89",x"00",             -- e409 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
    x"60",x"60",x"ff",                               -- e40f |   mov C, H
    x"60",x"fd",x"ff",                               -- e412 |   mov F, H
    x"65",x"ff",x"20",                               -- e415 |   bmov H, [A]
    x"e8",x"ff",x"00",x"f8",x"7a",x"00",             -- e418 |   jeq H, 0, ${_L_fn_handle_write_1}:rel + PC
    x"44",x"20",                                     -- e41e |   inc A
    x"5c",x"f8",x"95",x"fd",                         -- e420 |   call ${fn_split_command}:rel + PC
    x"60",x"40",x"ff",                               -- e424 |   mov B, H
                                                     --      | _B_fn_handle_write_2:
    x"fc",x"20",x"40",x"f8",x"2b",x"00",             -- e427 |   jge A, B, ${_E_fn_handle_write_2}:rel + PC
    x"5c",x"f8",x"c8",x"fe",                         -- e42d |   call ${fn_parse_hex_16}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"61",x"00",             -- e431 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
    x"a8",x"fc",x"ff",x"1c",x"08",                   -- e437 |   shl E, H, 0x8
    x"20",x"ff",x"1c",x"08",                         -- e43c |   shr H, 0x8
    x"30",x"fc",x"ff",                               -- e440 |   or E, H
    x"62",x"60",x"fc",                               -- e443 |   mov [C], E
    x"60",x"20",x"3c",x"04",                         -- e446 |   mov A, A + 0x4
    x"60",x"60",x"7c",x"02",                         -- e44a |   mov C, C + 0x2
    x"58",x"f8",x"d9",x"ff",                         -- e44e |   jmp ${_B_fn_handle_write_2}:rel + PC
                                                     --      | _E_fn_handle_write_2:
                                                     --      | _B_fn_handle_write_3:
    x"60",x"20",x"e0",x"98",x"00",                   -- e452 |   mov A, ${var_uart_send_buf}
    x"62",x"20",x"e0",x"4f",x"4b",                   -- e457 |   mov [A], 0x4b4f
    x"62",x"3c",x"1c",x"02",x"20",                   -- e45c |   mov [A + 0x2], 0x20
    x"60",x"20",x"3c",x"03",                         -- e461 |   mov A, A + 0x3
    x"60",x"40",x"fd",                               -- e465 |   mov B, F
    x"5c",x"f8",x"2c",x"ff",                         -- e468 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- e46c |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- e471 |   mov A, A + 0x5
    x"60",x"40",x"60",                               -- e475 |   mov B, C
    x"5c",x"f8",x"1c",x"ff",                         -- e478 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"0a",                   -- e47c |   mov [A + 0x4], 0xa
    x"60",x"20",x"e0",x"98",x"00",                   -- e481 |   mov A, ${var_uart_send_buf}
    x"5c",x"f8",x"ec",x"fb",                         -- e486 |   call ${fn_send_data}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- e48a |   mov H, 0x1
    x"58",x"f8",x"07",x"00",                         -- e48e |   jmp ${_E_fn_handle_write_3}:rel + PC
                                                     --      | _L_fn_handle_write_1:
    x"60",x"ff",x"00",                               -- e492 |   mov H, 0
                                                     --      | _E_fn_handle_write_3:
    x"e4",x"fe",                                     -- e495 |   pop G
    x"e4",x"fd",                                     -- e497 |   pop F
    x"e4",x"fc",                                     -- e499 |   pop E
    x"e4",x"60",                                     -- e49b |   pop C
    x"e4",x"40",                                     -- e49d |   pop B
    x"e4",x"20",                                     -- e49f |   pop A
    x"dc",                                           -- e4a1 |   ret
                                                     --      | end_fn_handle_write:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | const_data_1:
    x"52",x"45",x"41",x"44",x"59",x"0a",x"00",       -- e4a2 |   .data str:"READY\n"
                                                     --      | const_data_2:
    x"4f",x"56",x"45",x"52",x"46",x"4c",x"4f",x"57",x"0a",x"00", -- e4a9 |   .data str:"OVERFLOW\n"
                                                     --      | const_data_3:
    x"50",x"49",x"4e",x"47",x"00",                   -- e4b3 |   .data str:"PING"
                                                     --      | const_data_4:
    x"50",x"4f",x"4e",x"47",x"0a",x"00",             -- e4b8 |   .data str:"PONG\n"
                                                     --      | const_data_5:
    x"52",x"45",x"41",x"44",x"00",                   -- e4be |   .data str:"READ"
                                                     --      | const_data_6:
    x"57",x"52",x"49",x"54",x"45",x"00",             -- e4c3 |   .data str:"WRITE"
                                                     --      | const_data_7:
    x"49",x"4e",x"56",x"41",x"4c",x"49",x"44",x"0a",x"00", -- e4c9 |   .data str:"INVALID\n"
                                                     --      | SECTION_END_const_data:
                                                     --      | 
                                                     --      | .offset 0x0000
                                                     --      | SECTION_BEGIN_static_data:
                                                     --      | var_uart_recv_buf:
                                                     --    0 |   .bss size:152
                                                     --      | var_uart_send_buf:
                                                     --   98 |   .bss size:152
                                                     --      | var_led_status:
                                                     --  130 |   .bss size:2
                                                     --      | SECTION_END_static_data:
                                                     --      | 

    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
