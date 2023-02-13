
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 1186;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | SECTION_BEGIN_boot:
    x"60",x"a0",x"e0",x"00",x"20",                   -- d000 |   mov SP, 0x2000
    x"5c",x"f8",x"05",x"00",                         -- d005 |   call ${fn_start}:rel + PC
    x"d8",                                           -- d009 |   halt
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_start:
    x"60",x"20",x"e0",x"fd",x"00",                   -- d00a |   mov A, 0xfd
    x"60",x"40",x"00",                               -- d00f |   mov B, 0
    x"54",x"e0",x"e0",x"1c",x"00",x"30",x"00",x"30",x"02", -- d012 |   mmap 0x3000, 0x3000, 0x2
    x"60",x"20",x"e0",x"72",x"d4",                   -- d01b |   mov A, ${const_data_1}
    x"5c",x"f8",x"2a",x"00",                         -- d020 |   call ${fn_send_data}:rel + PC
    x"60",x"20",x"ff",                               -- d024 |   mov A, H
    x"62",x"e0",x"1c",x"30",x"01",x"01",             -- d027 |   mov [${var_led_status}], 0x1
    x"63",x"e0",x"e0",x"0a",x"30",x"30",x"01",       -- d02d |   mov [0x300a], [${var_led_status}]
                                                     --      | _B_fn_start_1:
    x"5c",x"f8",x"56",x"00",                         -- d034 |   call ${fn_recv_command}:rel + PC
    x"5c",x"f8",x"bb",x"00",                         -- d038 |   call ${fn_led_activity}:rel + PC
    x"60",x"20",x"e0",x"00",x"00",                   -- d03c |   mov A, ${var_uart_recv_buf}
    x"5c",x"f8",x"be",x"00",                         -- d041 |   call ${fn_parse_command}:rel + PC
    x"58",x"f8",x"ef",x"-1",                         -- d045 |   jmp ${_B_fn_start_1}:rel + PC
                                                     --      | _E_fn_start_1:
    x"dc",                                           -- d049 |   ret
                                                     --      | end_fn_start:
                                                     --      | 
                                                     --      | fn_send_data:
    x"e0",x"20",                                     -- d04a |   push A
    x"e0",x"40",                                     -- d04c |   push B
    x"e0",x"60",                                     -- d04e |   push C
    x"60",x"60",x"1c",x"11",                         -- d050 |   mov C, 0x11
                                                     --      | _B_fn_send_data_1:
    x"61",x"40",x"20",                               -- d054 |   mov B, [A]
    x"2c",x"40",x"e0",x"ff",x"00",                   -- d057 |   and B, 0xff
    x"e8",x"40",x"00",x"f8",x"27",x"00",             -- d05c |   jeq B, 0, ${_E_fn_send_data_1}:rel + PC
                                                     --      | _B_fn_send_data_2:
    x"f0",x"60",x"1c",x"f8",x"10",x"14",x"00",       -- d062 |   jlt C, 0x10, ${_E_fn_send_data_2}:rel + PC
    x"61",x"60",x"e0",x"04",x"30",                   -- d069 |   mov C, [0x3004]
    x"2c",x"60",x"1c",x"3f",                         -- d06e |   and C, 0x3f
    x"58",x"f8",x"f0",x"-1",                         -- d072 |   jmp ${_B_fn_send_data_2}:rel + PC
                                                     --      | _E_fn_send_data_2:
    x"62",x"e0",x"40",x"00",x"30",                   -- d076 |   mov [0x3000], B
    x"44",x"20",                                     -- d07b |   inc A
    x"44",x"60",                                     -- d07d |   inc C
    x"58",x"f8",x"d5",x"-1",                         -- d07f |   jmp ${_B_fn_send_data_1}:rel + PC
                                                     --      | _E_fn_send_data_1:
    x"e4",x"60",                                     -- d083 |   pop C
    x"e4",x"40",                                     -- d085 |   pop B
    x"e4",x"20",                                     -- d087 |   pop A
    x"dc",                                           -- d089 |   ret
                                                     --      | end_fn_send_data:
                                                     --      | 
                                                     --      | fn_recv_command:
    x"e0",x"20",                                     -- d08a |   push A
    x"e0",x"60",                                     -- d08c |   push C
    x"e0",x"80",                                     -- d08e |   push D
    x"e0",x"fe",                                     -- d090 |   push G
    x"60",x"20",x"00",                               -- d092 |   mov A, 0
                                                     --      | _B_fn_recv_command_1:
                                                     --      | _B_fn_recv_command_2:
    x"f0",x"20",x"e0",x"f8",x"95",x"00",x"1b",x"00", -- d095 |   jlt A, 0x95, ${_E_fn_recv_command_2}:rel + PC
    x"60",x"fe",x"20",                               -- d09d |   mov G, A
    x"60",x"20",x"e0",x"79",x"d4",                   -- d0a0 |   mov A, ${const_data_2}
    x"5c",x"f8",x"a5",x"-1",                         -- d0a5 |   call ${fn_send_data}:rel + PC
    x"60",x"20",x"fe",                               -- d0a9 |   mov A, G
    x"58",x"f8",x"38",x"00",                         -- d0ac |   jmp ${_E_fn_recv_command_1}:rel + PC
                                                     --      | _E_fn_recv_command_2:
    x"61",x"60",x"e0",x"02",x"30",                   -- d0b0 |   mov C, [0x3002]
    x"ac",x"80",x"60",x"e0",x"00",x"80",             -- d0b5 |   and D, C, 0x8000
    x"e8",x"80",x"00",x"f8",x"da",x"-1",             -- d0bb |   jeq D, 0, ${_B_fn_recv_command_1}:rel + PC
    x"2c",x"60",x"e0",x"ff",x"00",                   -- d0c1 |   and C, 0xff
    x"62",x"e0",x"60",x"00",x"30",                   -- d0c6 |   mov [0x3000], C
    x"e8",x"60",x"1c",x"f8",x"0a",x"19",x"00",       -- d0cb |   jeq C, 0xa, ${_E_fn_recv_command_1}:rel + PC
    x"e8",x"60",x"1c",x"f8",x"0d",x"c3",x"-1",       -- d0d2 |   jeq C, 0xd, ${_B_fn_recv_command_1}:rel + PC
    x"62",x"e4",x"60",x"00",x"00",                   -- d0d9 |   mov [${var_uart_recv_buf} + A], C
    x"44",x"20",                                     -- d0de |   inc A
    x"58",x"f8",x"b5",x"-1",                         -- d0e0 |   jmp ${_B_fn_recv_command_1}:rel + PC
                                                     --      | _E_fn_recv_command_1:
    x"66",x"20",x"00",                               -- d0e4 |   bmov [A], 0
    x"60",x"ff",x"20",                               -- d0e7 |   mov H, A
    x"e4",x"fe",                                     -- d0ea |   pop G
    x"e4",x"80",                                     -- d0ec |   pop D
    x"e4",x"60",                                     -- d0ee |   pop C
    x"e4",x"20",                                     -- d0f0 |   pop A
    x"dc",                                           -- d0f2 |   ret
                                                     --      | end_fn_recv_command:
                                                     --      | 
                                                     --      | fn_led_activity:
    x"46",x"e0",x"30",x"01",                         -- d0f3 |   inc [${var_led_status}]
    x"63",x"e0",x"e0",x"0a",x"30",x"30",x"01",       -- d0f7 |   mov [0x300a], [${var_led_status}]
    x"dc",                                           -- d0fe |   ret
                                                     --      | end_fn_led_activity:
                                                     --      | 
                                                     --      | fn_parse_command:
    x"e0",x"40",                                     -- d0ff |   push B
    x"e0",x"60",                                     -- d101 |   push C
    x"5c",x"f8",x"8a",x"00",                         -- d103 |   call ${fn_split_command}:rel + PC
    x"60",x"40",x"ff",                               -- d107 |   mov B, H
    x"60",x"60",x"e0",x"83",x"d4",                   -- d10a |   mov C, ${const_data_3}
    x"5c",x"f8",x"9c",x"00",                         -- d10f |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_3:
    x"e8",x"ff",x"00",x"f8",x"18",x"00",             -- d113 |   jeq H, 0, ${_E_fn_parse_command_3}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- d119 |   mov A, B + 0x1
    x"5c",x"f8",x"d0",x"00",                         -- d11d |   call ${fn_handle_ping}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"5e",x"00",             -- d121 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"61",x"00",                         -- d127 |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_3:
    x"60",x"60",x"e0",x"8e",x"d4",                   -- d12b |   mov C, ${const_data_5}
    x"5c",x"f8",x"7b",x"00",                         -- d130 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_4:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- d134 |   jeq H, 0, ${_E_fn_parse_command_4}:rel + PC
    x"65",x"ff",x"40",                               -- d13a |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"42",x"00",             -- d13d |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- d143 |   mov A, B + 0x1
    x"5c",x"f8",x"b8",x"00",                         -- d147 |   call ${fn_handle_read}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"34",x"00",             -- d14b |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"37",x"00",                         -- d151 |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_4:
    x"60",x"60",x"e0",x"93",x"d4",                   -- d155 |   mov C, ${const_data_6}
    x"5c",x"f8",x"51",x"00",                         -- d15a |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_5:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- d15e |   jeq H, 0, ${_E_fn_parse_command_5}:rel + PC
    x"65",x"ff",x"40",                               -- d164 |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"18",x"00",             -- d167 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- d16d |   mov A, B + 0x1
    x"5c",x"f8",x"58",x"02",                         -- d171 |   call ${fn_handle_write}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"0a",x"00",             -- d175 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"0d",x"00",                         -- d17b |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_5:
                                                     --      | _L_fn_parse_command_2:
    x"60",x"20",x"e0",x"99",x"d4",                   -- d17f |   mov A, ${const_data_7}
    x"5c",x"f8",x"c6",x"-2",                         -- d184 |   call ${fn_send_data}:rel + PC
                                                     --      | _L_fn_parse_command_1:
    x"e4",x"60",                                     -- d188 |   pop C
    x"e4",x"40",                                     -- d18a |   pop B
    x"dc",                                           -- d18c |   ret
                                                     --      | end_fn_parse_command:
                                                     --      | 
                                                     --      | fn_split_command:
    x"e0",x"60",                                     -- d18d |   push C
    x"60",x"ff",x"20",                               -- d18f |   mov H, A
                                                     --      | _B_fn_split_command_1:
    x"65",x"60",x"ff",                               -- d192 |   bmov C, [H]
    x"e8",x"60",x"1c",x"f8",x"20",x"13",x"00",       -- d195 |   jeq C, 0x20, ${_E_fn_split_command_1}:rel + PC
    x"e8",x"60",x"00",x"f8",x"0c",x"00",             -- d19c |   jeq C, 0, ${_E_fn_split_command_1}:rel + PC
    x"44",x"ff",                                     -- d1a2 |   inc H
    x"58",x"f8",x"ee",x"-1",                         -- d1a4 |   jmp ${_B_fn_split_command_1}:rel + PC
                                                     --      | _E_fn_split_command_1:
    x"e4",x"60",                                     -- d1a8 |   pop C
    x"dc",                                           -- d1aa |   ret
                                                     --      | end_fn_split_command:
                                                     --      | 
                                                     --      | fn_string_cmp:
    x"e0",x"20",                                     -- d1ab |   push A
    x"e0",x"40",                                     -- d1ad |   push B
    x"e0",x"60",                                     -- d1af |   push C
    x"e0",x"fd",                                     -- d1b1 |   push F
    x"e0",x"fe",                                     -- d1b3 |   push G
    x"60",x"ff",x"00",                               -- d1b5 |   mov H, 0
                                                     --      | _B_fn_string_cmp_3:
    x"65",x"fd",x"20",                               -- d1b8 |   bmov F, [A]
    x"65",x"fe",x"60",                               -- d1bb |   bmov G, [C]
    x"e8",x"20",x"40",x"f8",x"1a",x"00",             -- d1be |   jeq A, B, ${_L_fn_string_cmp_2}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"1e",x"00",             -- d1c4 |   jeq G, 0, ${_L_fn_string_cmp_1}:rel + PC
    x"ec",x"fd",x"fe",x"f8",x"18",x"00",             -- d1ca |   jne F, G, ${_L_fn_string_cmp_1}:rel + PC
    x"44",x"20",                                     -- d1d0 |   inc A
    x"44",x"60",                                     -- d1d2 |   inc C
    x"58",x"f8",x"e4",x"-1",                         -- d1d4 |   jmp ${_B_fn_string_cmp_3}:rel + PC
                                                     --      | _E_fn_string_cmp_3:
                                                     --      | _L_fn_string_cmp_2:
    x"ec",x"fe",x"00",x"f8",x"0a",x"00",             -- d1d8 |   jne G, 0, ${_L_fn_string_cmp_1}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- d1de |   mov H, 0x1
                                                     --      | _L_fn_string_cmp_1:
    x"e4",x"fe",                                     -- d1e2 |   pop G
    x"e4",x"fd",                                     -- d1e4 |   pop F
    x"e4",x"60",                                     -- d1e6 |   pop C
    x"e4",x"40",                                     -- d1e8 |   pop B
    x"e4",x"20",                                     -- d1ea |   pop A
    x"dc",                                           -- d1ec |   ret
                                                     --      | end_fn_string_cmp:
                                                     --      | 
                                                     --      | fn_handle_ping:
    x"e0",x"20",                                     -- d1ed |   push A
    x"60",x"20",x"e0",x"88",x"d4",                   -- d1ef |   mov A, ${const_data_4}
    x"5c",x"f8",x"56",x"-2",                         -- d1f4 |   call ${fn_send_data}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- d1f8 |   mov H, 0x1
    x"e4",x"20",                                     -- d1fc |   pop A
    x"dc",                                           -- d1fe |   ret
                                                     --      | end_fn_handle_ping:
                                                     --      | 
                                                     --      | fn_handle_read:
    x"e0",x"20",                                     -- d1ff |   push A
    x"e0",x"40",                                     -- d201 |   push B
    x"e0",x"60",                                     -- d203 |   push C
    x"e0",x"80",                                     -- d205 |   push D
    x"e0",x"fc",                                     -- d207 |   push E
    x"e0",x"fd",                                     -- d209 |   push F
    x"e0",x"fe",                                     -- d20b |   push G
    x"5c",x"f8",x"8b",x"00",                         -- d20d |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"75",x"00",             -- d211 |   jeq G, 0, ${_L_fn_handle_read_2}:rel + PC
    x"60",x"60",x"ff",                               -- d217 |   mov C, H
    x"5c",x"f8",x"7e",x"00",                         -- d21a |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"68",x"00",             -- d21e |   jeq G, 0, ${_L_fn_handle_read_2}:rel + PC
    x"60",x"80",x"ff",                               -- d224 |   mov D, H
    x"60",x"20",x"e0",x"98",x"00",                   -- d227 |   mov A, ${var_uart_send_buf}
    x"60",x"40",x"60",                               -- d22c |   mov B, C
    x"5c",x"f8",x"35",x"01",                         -- d22f |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- d233 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- d238 |   mov A, A + 0x5
    x"60",x"40",x"80",                               -- d23c |   mov B, D
    x"5c",x"f8",x"25",x"01",                         -- d23f |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- d243 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- d248 |   mov A, A + 0x5
                                                     --      | _B_fn_handle_read_3:
    x"fc",x"60",x"80",x"f8",x"25",x"00",             -- d24c |   jge C, D, ${_E_fn_handle_read_3}:rel + PC
    x"61",x"fc",x"60",                               -- d252 |   mov E, [C]
    x"a8",x"40",x"fc",x"1c",x"08",                   -- d255 |   shl B, E, 0x8
    x"20",x"fc",x"1c",x"08",                         -- d25a |   shr E, 0x8
    x"30",x"40",x"fc",                               -- d25e |   or B, E
    x"5c",x"f8",x"03",x"01",                         -- d261 |   call ${fn_put_hex_16}:rel + PC
    x"60",x"20",x"3c",x"04",                         -- d265 |   mov A, A + 0x4
    x"60",x"60",x"7c",x"02",                         -- d269 |   mov C, C + 0x2
    x"58",x"f8",x"df",x"-1",                         -- d26d |   jmp ${_B_fn_handle_read_3}:rel + PC
                                                     --      | _E_fn_handle_read_3:
    x"62",x"20",x"1c",x"0a",                         -- d271 |   mov [A], 0xa
    x"60",x"20",x"e0",x"98",x"00",                   -- d275 |   mov A, ${var_uart_send_buf}
    x"5c",x"f8",x"d0",x"-3",                         -- d27a |   call ${fn_send_data}:rel + PC
                                                     --      | _B_fn_handle_read_4:
                                                     --      | _L_fn_handle_read_1:
    x"60",x"ff",x"1c",x"01",                         -- d27e |   mov H, 0x1
    x"58",x"f8",x"07",x"00",                         -- d282 |   jmp ${_E_fn_handle_read_4}:rel + PC
                                                     --      | _L_fn_handle_read_2:
    x"60",x"ff",x"00",                               -- d286 |   mov H, 0
                                                     --      | _E_fn_handle_read_4:
    x"e4",x"fe",                                     -- d289 |   pop G
    x"e4",x"fd",                                     -- d28b |   pop F
    x"e4",x"fc",                                     -- d28d |   pop E
    x"e4",x"80",                                     -- d28f |   pop D
    x"e4",x"60",                                     -- d291 |   pop C
    x"e4",x"40",                                     -- d293 |   pop B
    x"e4",x"20",                                     -- d295 |   pop A
    x"dc",                                           -- d297 |   ret
                                                     --      | end_fn_handle_read:
                                                     --      | 
                                                     --      | fn__parse_hex_arg:
                                                     --      | _B_fn__parse_hex_arg_2:
    x"65",x"ff",x"20",                               -- d298 |   bmov H, [A]
    x"ec",x"ff",x"1c",x"f8",x"20",x"09",x"00",       -- d29b |   jne H, 0x20, ${_E_fn__parse_hex_arg_2}:rel + PC
    x"44",x"20",                                     -- d2a2 |   inc A
                                                     --      | _E_fn__parse_hex_arg_2:
    x"5c",x"f8",x"e9",x"-2",                         -- d2a4 |   call ${fn_split_command}:rel + PC
    x"60",x"fe",x"00",                               -- d2a8 |   mov G, 0
    x"ec",x"3c",x"ff",x"f8",x"04",x"19",x"00",       -- d2ab |   jne A + 0x4, H, ${_L_fn__parse_hex_arg_1}:rel + PC
    x"5c",x"f8",x"13",x"00",                         -- d2b2 |   call ${fn_parse_hex_16}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"0e",x"00",             -- d2b6 |   jeq G, 0, ${_L_fn__parse_hex_arg_1}:rel + PC
    x"60",x"fe",x"1c",x"01",                         -- d2bc |   mov G, 0x1
    x"60",x"20",x"3c",x"04",                         -- d2c0 |   mov A, A + 0x4
                                                     --      | _L_fn__parse_hex_arg_1:
    x"dc",                                           -- d2c4 |   ret
                                                     --      | end_fn__parse_hex_arg:
                                                     --      | 
                                                     --      | fn_parse_hex_16:
    x"e0",x"20",                                     -- d2c5 |   push A
    x"e0",x"60",                                     -- d2c7 |   push C
    x"5c",x"f8",x"58",x"00",                         -- d2c9 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"4f",x"00",             -- d2cd |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- d2d3 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- d2d7 |   or C, H
    x"44",x"20",                                     -- d2da |   inc A
    x"5c",x"f8",x"45",x"00",                         -- d2dc |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"3c",x"00",             -- d2e0 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- d2e6 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- d2ea |   or C, H
    x"44",x"20",                                     -- d2ed |   inc A
    x"5c",x"f8",x"32",x"00",                         -- d2ef |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"29",x"00",             -- d2f3 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- d2f9 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- d2fd |   or C, H
    x"44",x"20",                                     -- d300 |   inc A
    x"5c",x"f8",x"1f",x"00",                         -- d302 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"16",x"00",             -- d306 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- d30c |   shl C, 0x4
    x"30",x"60",x"ff",                               -- d310 |   or C, H
    x"44",x"20",                                     -- d313 |   inc A
    x"60",x"ff",x"60",                               -- d315 |   mov H, C
    x"60",x"fe",x"1c",x"01",                         -- d318 |   mov G, 0x1
                                                     --      | _L_fn_parse_hex_16_1:
    x"e4",x"60",                                     -- d31c |   pop C
    x"e4",x"20",                                     -- d31e |   pop A
    x"dc",                                           -- d320 |   ret
                                                     --      | end_fn_parse_hex_16:
                                                     --      | 
                                                     --      | fn_parse_hex_4:
    x"65",x"ff",x"20",                               -- d321 |   bmov H, [A]
    x"30",x"ff",x"1c",x"20",                         -- d324 |   or H, 0x20
    x"f0",x"ff",x"1c",x"f8",x"30",x"38",x"00",       -- d328 |   jlt H, 0x30, ${_L_fn_parse_hex_4_2}:rel + PC
    x"f8",x"ff",x"1c",x"f8",x"66",x"31",x"00",       -- d32f |   jgt H, 0x66, ${_L_fn_parse_hex_4_2}:rel + PC
                                                     --      | _B_fn_parse_hex_4_3:
    x"f4",x"ff",x"1c",x"f8",x"39",x"12",x"00",       -- d336 |   jle H, 0x39, ${_E_fn_parse_hex_4_3}:rel + PC
    x"fc",x"ff",x"1c",x"f8",x"61",x"0b",x"00",       -- d33d |   jge H, 0x61, ${_E_fn_parse_hex_4_3}:rel + PC
    x"58",x"f8",x"1c",x"00",                         -- d344 |   jmp ${_L_fn_parse_hex_4_2}:rel + PC
                                                     --      | _E_fn_parse_hex_4_3:
                                                     --      | _B_fn_parse_hex_4_4:
    x"f8",x"ff",x"1c",x"f8",x"39",x"0f",x"00",       -- d348 |   jgt H, 0x39, ${_E_fn_parse_hex_4_4}:rel + PC
    x"04",x"ff",x"1c",x"30",                         -- d34f |   sub H, 0x30
    x"58",x"f8",x"08",x"00",                         -- d353 |   jmp ${_L_fn_parse_hex_4_1}:rel + PC
                                                     --      | _E_fn_parse_hex_4_4:
    x"04",x"ff",x"1c",x"57",                         -- d357 |   sub H, 0x57
                                                     --      | _L_fn_parse_hex_4_1:
    x"60",x"fe",x"1c",x"01",                         -- d35b |   mov G, 0x1
    x"dc",                                           -- d35f |   ret
                                                     --      | _L_fn_parse_hex_4_2:
    x"60",x"fe",x"00",                               -- d360 |   mov G, 0
    x"dc",                                           -- d363 |   ret
                                                     --      | end_fn_parse_hex_4:
                                                     --      | 
                                                     --      | fn_put_hex_16:
    x"e0",x"20",                                     -- d364 |   push A
    x"e0",x"40",                                     -- d366 |   push B
    x"e0",x"60",                                     -- d368 |   push C
    x"60",x"60",x"40",                               -- d36a |   mov C, B
    x"a0",x"40",x"60",x"1c",x"0c",                   -- d36d |   shr B, C, 0xc
    x"2c",x"40",x"1c",x"0f",                         -- d372 |   and B, 0xf
    x"5c",x"f8",x"39",x"00",                         -- d376 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- d37a |   inc A
    x"a0",x"40",x"60",x"1c",x"08",                   -- d37c |   shr B, C, 0x8
    x"2c",x"40",x"1c",x"0f",                         -- d381 |   and B, 0xf
    x"5c",x"f8",x"2a",x"00",                         -- d385 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- d389 |   inc A
    x"a0",x"40",x"60",x"1c",x"04",                   -- d38b |   shr B, C, 0x4
    x"2c",x"40",x"1c",x"0f",                         -- d390 |   and B, 0xf
    x"5c",x"f8",x"1b",x"00",                         -- d394 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- d398 |   inc A
    x"a0",x"40",x"60",x"00",                         -- d39a |   shr B, C, 0
    x"2c",x"40",x"1c",x"0f",                         -- d39e |   and B, 0xf
    x"5c",x"f8",x"0d",x"00",                         -- d3a2 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- d3a6 |   inc A
    x"e4",x"60",                                     -- d3a8 |   pop C
    x"e4",x"40",                                     -- d3aa |   pop B
    x"e4",x"20",                                     -- d3ac |   pop A
    x"dc",                                           -- d3ae |   ret
                                                     --      | end_fn_put_hex_16:
                                                     --      | 
                                                     --      | fn_put_hex_4:
    x"60",x"ff",x"40",                               -- d3af |   mov H, B
                                                     --      | _B_fn_put_hex_4_2:
    x"f8",x"ff",x"1c",x"f8",x"09",x"0f",x"00",       -- d3b2 |   jgt H, 0x9, ${_E_fn_put_hex_4_2}:rel + PC
    x"00",x"ff",x"1c",x"30",                         -- d3b9 |   add H, 0x30
    x"58",x"f8",x"08",x"00",                         -- d3bd |   jmp ${_L_fn_put_hex_4_1}:rel + PC
                                                     --      | _E_fn_put_hex_4_2:
    x"00",x"ff",x"1c",x"57",                         -- d3c1 |   add H, 0x57
                                                     --      | _L_fn_put_hex_4_1:
    x"62",x"20",x"ff",                               -- d3c5 |   mov [A], H
    x"dc",                                           -- d3c8 |   ret
                                                     --      | end_fn_put_hex_4:
                                                     --      | 
                                                     --      | fn_handle_write:
    x"e0",x"20",                                     -- d3c9 |   push A
    x"e0",x"40",                                     -- d3cb |   push B
    x"e0",x"60",                                     -- d3cd |   push C
    x"e0",x"fc",                                     -- d3cf |   push E
    x"e0",x"fd",                                     -- d3d1 |   push F
    x"e0",x"fe",                                     -- d3d3 |   push G
    x"5c",x"f8",x"c3",x"-2",                         -- d3d5 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"89",x"00",             -- d3d9 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
    x"60",x"60",x"ff",                               -- d3df |   mov C, H
    x"60",x"fd",x"ff",                               -- d3e2 |   mov F, H
    x"65",x"ff",x"20",                               -- d3e5 |   bmov H, [A]
    x"e8",x"ff",x"00",x"f8",x"7a",x"00",             -- d3e8 |   jeq H, 0, ${_L_fn_handle_write_1}:rel + PC
    x"44",x"20",                                     -- d3ee |   inc A
    x"5c",x"f8",x"9d",x"-3",                         -- d3f0 |   call ${fn_split_command}:rel + PC
    x"60",x"40",x"ff",                               -- d3f4 |   mov B, H
                                                     --      | _B_fn_handle_write_2:
    x"fc",x"20",x"40",x"f8",x"2b",x"00",             -- d3f7 |   jge A, B, ${_E_fn_handle_write_2}:rel + PC
    x"5c",x"f8",x"c8",x"-2",                         -- d3fd |   call ${fn_parse_hex_16}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"61",x"00",             -- d401 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
    x"a8",x"fc",x"ff",x"1c",x"08",                   -- d407 |   shl E, H, 0x8
    x"20",x"ff",x"1c",x"08",                         -- d40c |   shr H, 0x8
    x"30",x"fc",x"ff",                               -- d410 |   or E, H
    x"62",x"60",x"fc",                               -- d413 |   mov [C], E
    x"60",x"20",x"3c",x"04",                         -- d416 |   mov A, A + 0x4
    x"60",x"60",x"7c",x"02",                         -- d41a |   mov C, C + 0x2
    x"58",x"f8",x"d9",x"-1",                         -- d41e |   jmp ${_B_fn_handle_write_2}:rel + PC
                                                     --      | _E_fn_handle_write_2:
                                                     --      | _B_fn_handle_write_3:
    x"60",x"20",x"e0",x"98",x"00",                   -- d422 |   mov A, ${var_uart_send_buf}
    x"62",x"20",x"e0",x"4f",x"4b",                   -- d427 |   mov [A], 0x4b4f
    x"62",x"3c",x"1c",x"02",x"20",                   -- d42c |   mov [A + 0x2], 0x20
    x"60",x"20",x"3c",x"03",                         -- d431 |   mov A, A + 0x3
    x"60",x"40",x"fd",                               -- d435 |   mov B, F
    x"5c",x"f8",x"2c",x"-1",                         -- d438 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- d43c |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- d441 |   mov A, A + 0x5
    x"60",x"40",x"60",                               -- d445 |   mov B, C
    x"5c",x"f8",x"1c",x"-1",                         -- d448 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"0a",                   -- d44c |   mov [A + 0x4], 0xa
    x"60",x"20",x"e0",x"98",x"00",                   -- d451 |   mov A, ${var_uart_send_buf}
    x"5c",x"f8",x"f4",x"-5",                         -- d456 |   call ${fn_send_data}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- d45a |   mov H, 0x1
    x"58",x"f8",x"07",x"00",                         -- d45e |   jmp ${_E_fn_handle_write_3}:rel + PC
                                                     --      | _L_fn_handle_write_1:
    x"60",x"ff",x"00",                               -- d462 |   mov H, 0
                                                     --      | _E_fn_handle_write_3:
    x"e4",x"fe",                                     -- d465 |   pop G
    x"e4",x"fd",                                     -- d467 |   pop F
    x"e4",x"fc",                                     -- d469 |   pop E
    x"e4",x"60",                                     -- d46b |   pop C
    x"e4",x"40",                                     -- d46d |   pop B
    x"e4",x"20",                                     -- d46f |   pop A
    x"dc",                                           -- d471 |   ret
                                                     --      | end_fn_handle_write:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | const_data_1:
    x"52",x"45",x"41",x"44",x"59",x"0a",x"00",       -- d472 |   .data str:"READY\n"
                                                     --      | const_data_2:
    x"4f",x"56",x"45",x"52",x"46",x"4c",x"4f",x"57",x"0a",x"00", -- d479 |   .data str:"OVERFLOW\n"
                                                     --      | const_data_3:
    x"50",x"49",x"4e",x"47",x"00",                   -- d483 |   .data str:"PING"
                                                     --      | const_data_4:
    x"50",x"4f",x"4e",x"47",x"0a",x"00",             -- d488 |   .data str:"PONG\n"
                                                     --      | const_data_5:
    x"52",x"45",x"41",x"44",x"00",                   -- d48e |   .data str:"READ"
                                                     --      | const_data_6:
    x"57",x"52",x"49",x"54",x"45",x"00",             -- d493 |   .data str:"WRITE"
                                                     --      | const_data_7:
    x"49",x"4e",x"56",x"41",x"4c",x"49",x"44",x"0a",x"00", -- d499 |   .data str:"INVALID\n"
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
