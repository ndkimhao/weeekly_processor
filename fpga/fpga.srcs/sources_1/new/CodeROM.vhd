
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 1339;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | .config CODE_OFFSET 0xf500
                                                     --      | 
                                                     --      | SECTION_BEGIN_boot:
                                                     --      | _B_boot_1:
    x"e8",x"c0",x"e0",x"f8",x"00",x"f5",x"1d",x"00", -- f500 |   jeq PC, 0xf500, ${_E_boot_1}:rel + PC
    x"60",x"20",x"e0",x"ff",x"00",                   -- f508 |   mov A, 0xff
    x"60",x"40",x"00",                               -- f50d |   mov B, 0
    x"54",x"e0",x"e0",x"1c",x"00",x"f5",x"ff",x"fa",x"02", -- f510 |   mmap 0xf500, 0xfaff, 0x2
    x"58",x"e0",x"00",x"f5",                         -- f519 |   jmp 0xf500
                                                     --      | _E_boot_1:
    x"54",x"e0",x"e0",x"1c",x"00",x"f5",x"ff",x"fa",x"03", -- f51d |   mmap 0xf500, 0xfaff, 0x3
    x"d4",x"1c",x"02",                               -- f526 |   umap 0x2
    x"60",x"a0",x"e0",x"00",x"ff",                   -- f529 |   mov SP, 0xff00
    x"5c",x"f8",x"05",x"00",                         -- f52e |   call ${fn_start}:rel + PC
    x"d8",                                           -- f532 |   halt
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_start:
    x"60",x"20",x"e0",x"fd",x"00",                   -- f533 |   mov A, 0xfd
    x"60",x"40",x"00",                               -- f538 |   mov B, 0
    x"54",x"e0",x"1c",x"1c",x"00",x"ff",x"ff",x"02", -- f53b |   mmap 0xff00, 0xff, 0x2
                                                     --      | _B_fn_start_1:
    x"61",x"ff",x"e0",x"1c",x"ff",                   -- f543 |   mov H, [0xff1c]
    x"e8",x"ff",x"00",x"f8",x"08",x"00",             -- f548 |   jeq H, 0, ${_E_fn_start_1}:rel + PC
    x"58",x"ff",                                     -- f54e |   jmp H
                                                     --      | _E_fn_start_1:
    x"60",x"20",x"e0",x"07",x"fa",                   -- f550 |   mov A, ${const_data_1}
    x"5c",x"f8",x"23",x"00",                         -- f555 |   call ${fn_send_data}:rel + PC
    x"60",x"20",x"ff",                               -- f559 |   mov A, H
    x"62",x"e0",x"1c",x"0a",x"ff",x"01",             -- f55c |   mov [0xff0a], 0x1
                                                     --      | _B_fn_start_2:
    x"5c",x"f8",x"56",x"00",                         -- f562 |   call ${fn_recv_command}:rel + PC
    x"5c",x"f8",x"bd",x"00",                         -- f566 |   call ${fn_led_activity}:rel + PC
    x"60",x"20",x"e0",x"00",x"fb",                   -- f56a |   mov A, ${var_uart_recv_buf}
    x"5c",x"f8",x"b9",x"00",                         -- f56f |   call ${fn_parse_command}:rel + PC
    x"58",x"f8",x"ef",x"ff",                         -- f573 |   jmp ${_B_fn_start_2}:rel + PC
                                                     --      | _E_fn_start_2:
    x"dc",                                           -- f577 |   ret
                                                     --      | end_fn_start:
                                                     --      | 
                                                     --      | fn_send_data:
    x"e0",x"20",                                     -- f578 |   push A
    x"e0",x"40",                                     -- f57a |   push B
    x"e0",x"60",                                     -- f57c |   push C
    x"60",x"60",x"1c",x"11",                         -- f57e |   mov C, 0x11
                                                     --      | _B_fn_send_data_1:
    x"61",x"40",x"20",                               -- f582 |   mov B, [A]
    x"2c",x"40",x"e0",x"ff",x"00",                   -- f585 |   and B, 0xff
    x"e8",x"40",x"00",x"f8",x"27",x"00",             -- f58a |   jeq B, 0, ${_E_fn_send_data_1}:rel + PC
                                                     --      | _B_fn_send_data_2:
    x"f0",x"60",x"1c",x"f8",x"10",x"14",x"00",       -- f590 |   jlt C, 0x10, ${_E_fn_send_data_2}:rel + PC
    x"61",x"60",x"e0",x"04",x"ff",                   -- f597 |   mov C, [0xff04]
    x"2c",x"60",x"1c",x"3f",                         -- f59c |   and C, 0x3f
    x"58",x"f8",x"f0",x"ff",                         -- f5a0 |   jmp ${_B_fn_send_data_2}:rel + PC
                                                     --      | _E_fn_send_data_2:
    x"62",x"e0",x"40",x"00",x"ff",                   -- f5a4 |   mov [0xff00], B
    x"44",x"20",                                     -- f5a9 |   inc A
    x"44",x"60",                                     -- f5ab |   inc C
    x"58",x"f8",x"d5",x"ff",                         -- f5ad |   jmp ${_B_fn_send_data_1}:rel + PC
                                                     --      | _E_fn_send_data_1:
    x"e4",x"60",                                     -- f5b1 |   pop C
    x"e4",x"40",                                     -- f5b3 |   pop B
    x"e4",x"20",                                     -- f5b5 |   pop A
    x"dc",                                           -- f5b7 |   ret
                                                     --      | end_fn_send_data:
                                                     --      | 
                                                     --      | fn_recv_command:
    x"e0",x"20",                                     -- f5b8 |   push A
    x"e0",x"60",                                     -- f5ba |   push C
    x"e0",x"80",                                     -- f5bc |   push D
    x"e0",x"fe",                                     -- f5be |   push G
    x"60",x"20",x"00",                               -- f5c0 |   mov A, 0
                                                     --      | _B_fn_recv_command_1:
                                                     --      | _B_fn_recv_command_2:
    x"f0",x"20",x"e0",x"f8",x"95",x"00",x"1b",x"00", -- f5c3 |   jlt A, 0x95, ${_E_fn_recv_command_2}:rel + PC
    x"60",x"fe",x"20",                               -- f5cb |   mov G, A
    x"60",x"20",x"e0",x"0e",x"fa",                   -- f5ce |   mov A, ${const_data_2}
    x"5c",x"f8",x"a5",x"ff",                         -- f5d3 |   call ${fn_send_data}:rel + PC
    x"60",x"20",x"fe",                               -- f5d7 |   mov A, G
    x"58",x"f8",x"38",x"00",                         -- f5da |   jmp ${_E_fn_recv_command_1}:rel + PC
                                                     --      | _E_fn_recv_command_2:
    x"61",x"60",x"e0",x"02",x"ff",                   -- f5de |   mov C, [0xff02]
    x"ac",x"80",x"60",x"e0",x"00",x"80",             -- f5e3 |   and D, C, 0x8000
    x"e8",x"80",x"00",x"f8",x"da",x"ff",             -- f5e9 |   jeq D, 0, ${_B_fn_recv_command_1}:rel + PC
    x"2c",x"60",x"e0",x"ff",x"00",                   -- f5ef |   and C, 0xff
    x"62",x"e0",x"60",x"00",x"ff",                   -- f5f4 |   mov [0xff00], C
    x"e8",x"60",x"1c",x"f8",x"0a",x"19",x"00",       -- f5f9 |   jeq C, 0xa, ${_E_fn_recv_command_1}:rel + PC
    x"e8",x"60",x"1c",x"f8",x"0d",x"c3",x"ff",       -- f600 |   jeq C, 0xd, ${_B_fn_recv_command_1}:rel + PC
    x"62",x"e4",x"60",x"00",x"fb",                   -- f607 |   mov [${var_uart_recv_buf} + A], C
    x"44",x"20",                                     -- f60c |   inc A
    x"58",x"f8",x"b5",x"ff",                         -- f60e |   jmp ${_B_fn_recv_command_1}:rel + PC
                                                     --      | _E_fn_recv_command_1:
    x"66",x"e4",x"00",x"00",x"fb",                   -- f612 |   bmov [${var_uart_recv_buf} + A], 0
    x"60",x"ff",x"20",                               -- f617 |   mov H, A
    x"e4",x"fe",                                     -- f61a |   pop G
    x"e4",x"80",                                     -- f61c |   pop D
    x"e4",x"60",                                     -- f61e |   pop C
    x"e4",x"20",                                     -- f620 |   pop A
    x"dc",                                           -- f622 |   ret
                                                     --      | end_fn_recv_command:
                                                     --      | 
                                                     --      | fn_led_activity:
    x"46",x"e0",x"0a",x"ff",                         -- f623 |   inc [0xff0a]
    x"dc",                                           -- f627 |   ret
                                                     --      | end_fn_led_activity:
                                                     --      | 
                                                     --      | fn_parse_command:
    x"e0",x"40",                                     -- f628 |   push B
    x"e0",x"60",                                     -- f62a |   push C
    x"5c",x"f8",x"b4",x"00",                         -- f62c |   call ${fn_split_command}:rel + PC
    x"60",x"40",x"ff",                               -- f630 |   mov B, H
    x"60",x"60",x"e0",x"18",x"fa",                   -- f633 |   mov C, ${const_data_3}
    x"5c",x"f8",x"c6",x"00",                         -- f638 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_3:
    x"e8",x"ff",x"00",x"f8",x"18",x"00",             -- f63c |   jeq H, 0, ${_E_fn_parse_command_3}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f642 |   mov A, B + 0x1
    x"5c",x"f8",x"fa",x"00",                         -- f646 |   call ${fn_handle_ping}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"88",x"00",             -- f64a |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"8b",x"00",                         -- f650 |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_3:
    x"60",x"60",x"e0",x"23",x"fa",                   -- f654 |   mov C, ${const_data_5}
    x"5c",x"f8",x"a5",x"00",                         -- f659 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_4:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- f65d |   jeq H, 0, ${_E_fn_parse_command_4}:rel + PC
    x"65",x"ff",x"40",                               -- f663 |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"6c",x"00",             -- f666 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f66c |   mov A, B + 0x1
    x"5c",x"f8",x"e2",x"00",                         -- f670 |   call ${fn_handle_read}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"5e",x"00",             -- f674 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"61",x"00",                         -- f67a |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_4:
    x"60",x"60",x"e0",x"28",x"fa",                   -- f67e |   mov C, ${const_data_6}
    x"5c",x"f8",x"7b",x"00",                         -- f683 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_5:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- f687 |   jeq H, 0, ${_E_fn_parse_command_5}:rel + PC
    x"65",x"ff",x"40",                               -- f68d |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"42",x"00",             -- f690 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f696 |   mov A, B + 0x1
    x"5c",x"f8",x"8a",x"02",                         -- f69a |   call ${fn_handle_write}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"34",x"00",             -- f69e |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"37",x"00",                         -- f6a4 |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_5:
    x"60",x"60",x"e0",x"2e",x"fa",                   -- f6a8 |   mov C, ${const_data_7}
    x"5c",x"f8",x"51",x"00",                         -- f6ad |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_6:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- f6b1 |   jeq H, 0, ${_E_fn_parse_command_6}:rel + PC
    x"65",x"ff",x"40",                               -- f6b7 |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"18",x"00",             -- f6ba |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f6c0 |   mov A, B + 0x1
    x"5c",x"f8",x"09",x"03",                         -- f6c4 |   call ${fn_handle_jmp}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"0a",x"00",             -- f6c8 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"0d",x"00",                         -- f6ce |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_6:
                                                     --      | _L_fn_parse_command_2:
    x"60",x"20",x"e0",x"32",x"fa",                   -- f6d2 |   mov A, ${const_data_8}
    x"5c",x"f8",x"a1",x"fe",                         -- f6d7 |   call ${fn_send_data}:rel + PC
                                                     --      | _L_fn_parse_command_1:
    x"e4",x"60",                                     -- f6db |   pop C
    x"e4",x"40",                                     -- f6dd |   pop B
    x"dc",                                           -- f6df |   ret
                                                     --      | end_fn_parse_command:
                                                     --      | 
                                                     --      | fn_split_command:
    x"e0",x"60",                                     -- f6e0 |   push C
    x"60",x"ff",x"20",                               -- f6e2 |   mov H, A
                                                     --      | _B_fn_split_command_1:
    x"65",x"60",x"ff",                               -- f6e5 |   bmov C, [H]
    x"e8",x"60",x"1c",x"f8",x"20",x"13",x"00",       -- f6e8 |   jeq C, 0x20, ${_E_fn_split_command_1}:rel + PC
    x"e8",x"60",x"00",x"f8",x"0c",x"00",             -- f6ef |   jeq C, 0, ${_E_fn_split_command_1}:rel + PC
    x"44",x"ff",                                     -- f6f5 |   inc H
    x"58",x"f8",x"ee",x"ff",                         -- f6f7 |   jmp ${_B_fn_split_command_1}:rel + PC
                                                     --      | _E_fn_split_command_1:
    x"e4",x"60",                                     -- f6fb |   pop C
    x"dc",                                           -- f6fd |   ret
                                                     --      | end_fn_split_command:
                                                     --      | 
                                                     --      | fn_string_cmp:
    x"e0",x"20",                                     -- f6fe |   push A
    x"e0",x"40",                                     -- f700 |   push B
    x"e0",x"60",                                     -- f702 |   push C
    x"e0",x"fd",                                     -- f704 |   push F
    x"e0",x"fe",                                     -- f706 |   push G
    x"60",x"ff",x"00",                               -- f708 |   mov H, 0
                                                     --      | _B_fn_string_cmp_3:
    x"65",x"fd",x"20",                               -- f70b |   bmov F, [A]
    x"65",x"fe",x"60",                               -- f70e |   bmov G, [C]
    x"e8",x"20",x"40",x"f8",x"1a",x"00",             -- f711 |   jeq A, B, ${_L_fn_string_cmp_2}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"1e",x"00",             -- f717 |   jeq G, 0, ${_L_fn_string_cmp_1}:rel + PC
    x"ec",x"fd",x"fe",x"f8",x"18",x"00",             -- f71d |   jne F, G, ${_L_fn_string_cmp_1}:rel + PC
    x"44",x"20",                                     -- f723 |   inc A
    x"44",x"60",                                     -- f725 |   inc C
    x"58",x"f8",x"e4",x"ff",                         -- f727 |   jmp ${_B_fn_string_cmp_3}:rel + PC
                                                     --      | _E_fn_string_cmp_3:
                                                     --      | _L_fn_string_cmp_2:
    x"ec",x"fe",x"00",x"f8",x"0a",x"00",             -- f72b |   jne G, 0, ${_L_fn_string_cmp_1}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- f731 |   mov H, 0x1
                                                     --      | _L_fn_string_cmp_1:
    x"e4",x"fe",                                     -- f735 |   pop G
    x"e4",x"fd",                                     -- f737 |   pop F
    x"e4",x"60",                                     -- f739 |   pop C
    x"e4",x"40",                                     -- f73b |   pop B
    x"e4",x"20",                                     -- f73d |   pop A
    x"dc",                                           -- f73f |   ret
                                                     --      | end_fn_string_cmp:
                                                     --      | 
                                                     --      | fn_handle_ping:
    x"e0",x"20",                                     -- f740 |   push A
    x"60",x"20",x"e0",x"1d",x"fa",                   -- f742 |   mov A, ${const_data_4}
    x"5c",x"f8",x"31",x"fe",                         -- f747 |   call ${fn_send_data}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- f74b |   mov H, 0x1
    x"e4",x"20",                                     -- f74f |   pop A
    x"dc",                                           -- f751 |   ret
                                                     --      | end_fn_handle_ping:
                                                     --      | 
                                                     --      | fn_handle_read:
    x"e0",x"20",                                     -- f752 |   push A
    x"e0",x"40",                                     -- f754 |   push B
    x"e0",x"60",                                     -- f756 |   push C
    x"e0",x"80",                                     -- f758 |   push D
    x"e0",x"fc",                                     -- f75a |   push E
    x"e0",x"fd",                                     -- f75c |   push F
    x"e0",x"fe",                                     -- f75e |   push G
    x"5c",x"f8",x"93",x"00",                         -- f760 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"7d",x"00",             -- f764 |   jeq G, 0, ${_L_fn_handle_read_2}:rel + PC
    x"60",x"60",x"ff",                               -- f76a |   mov C, H
    x"5c",x"f8",x"86",x"00",                         -- f76d |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"70",x"00",             -- f771 |   jeq G, 0, ${_L_fn_handle_read_2}:rel + PC
    x"60",x"80",x"ff",                               -- f777 |   mov D, H
    x"60",x"20",x"e0",x"98",x"fb",                   -- f77a |   mov A, ${var_uart_send_buf}
    x"60",x"40",x"60",                               -- f77f |   mov B, C
    x"5c",x"f8",x"3d",x"01",                         -- f782 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- f786 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- f78b |   mov A, A + 0x5
    x"60",x"40",x"80",                               -- f78f |   mov B, D
    x"5c",x"f8",x"2d",x"01",                         -- f792 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- f796 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- f79b |   mov A, A + 0x5
                                                     --      | _B_fn_handle_read_3:
    x"fc",x"20",x"e0",x"f8",x"2d",x"fc",x"42",x"00", -- f79f |   jge A, ${var_uart_send_buf} + 0095, ${_L_fn_handle_read_2}:rel + PC
    x"fc",x"60",x"80",x"f8",x"25",x"00",             -- f7a7 |   jge C, D, ${_E_fn_handle_read_3}:rel + PC
    x"61",x"fc",x"60",                               -- f7ad |   mov E, [C]
    x"a8",x"40",x"fc",x"1c",x"08",                   -- f7b0 |   shl B, E, 0x8
    x"20",x"fc",x"1c",x"08",                         -- f7b5 |   shr E, 0x8
    x"30",x"40",x"fc",                               -- f7b9 |   or B, E
    x"5c",x"f8",x"03",x"01",                         -- f7bc |   call ${fn_put_hex_16}:rel + PC
    x"60",x"20",x"3c",x"04",                         -- f7c0 |   mov A, A + 0x4
    x"60",x"60",x"7c",x"02",                         -- f7c4 |   mov C, C + 0x2
    x"58",x"f8",x"d7",x"ff",                         -- f7c8 |   jmp ${_B_fn_handle_read_3}:rel + PC
                                                     --      | _E_fn_handle_read_3:
    x"62",x"20",x"1c",x"0a",                         -- f7cc |   mov [A], 0xa
    x"60",x"20",x"e0",x"98",x"fb",                   -- f7d0 |   mov A, ${var_uart_send_buf}
    x"5c",x"f8",x"a3",x"fd",                         -- f7d5 |   call ${fn_send_data}:rel + PC
                                                     --      | _B_fn_handle_read_4:
                                                     --      | _L_fn_handle_read_1:
    x"60",x"ff",x"1c",x"01",                         -- f7d9 |   mov H, 0x1
    x"58",x"f8",x"07",x"00",                         -- f7dd |   jmp ${_E_fn_handle_read_4}:rel + PC
                                                     --      | _L_fn_handle_read_2:
    x"60",x"ff",x"00",                               -- f7e1 |   mov H, 0
                                                     --      | _E_fn_handle_read_4:
    x"e4",x"fe",                                     -- f7e4 |   pop G
    x"e4",x"fd",                                     -- f7e6 |   pop F
    x"e4",x"fc",                                     -- f7e8 |   pop E
    x"e4",x"80",                                     -- f7ea |   pop D
    x"e4",x"60",                                     -- f7ec |   pop C
    x"e4",x"40",                                     -- f7ee |   pop B
    x"e4",x"20",                                     -- f7f0 |   pop A
    x"dc",                                           -- f7f2 |   ret
                                                     --      | end_fn_handle_read:
                                                     --      | 
                                                     --      | fn__parse_hex_arg:
                                                     --      | _B_fn__parse_hex_arg_2:
    x"65",x"ff",x"20",                               -- f7f3 |   bmov H, [A]
    x"ec",x"ff",x"1c",x"f8",x"20",x"09",x"00",       -- f7f6 |   jne H, 0x20, ${_E_fn__parse_hex_arg_2}:rel + PC
    x"44",x"20",                                     -- f7fd |   inc A
                                                     --      | _E_fn__parse_hex_arg_2:
    x"5c",x"f8",x"e1",x"fe",                         -- f7ff |   call ${fn_split_command}:rel + PC
    x"60",x"fe",x"00",                               -- f803 |   mov G, 0
    x"ec",x"3c",x"ff",x"f8",x"04",x"19",x"00",       -- f806 |   jne A + 0x4, H, ${_L_fn__parse_hex_arg_1}:rel + PC
    x"5c",x"f8",x"13",x"00",                         -- f80d |   call ${fn_parse_hex_16}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"0e",x"00",             -- f811 |   jeq G, 0, ${_L_fn__parse_hex_arg_1}:rel + PC
    x"60",x"fe",x"1c",x"01",                         -- f817 |   mov G, 0x1
    x"60",x"20",x"3c",x"04",                         -- f81b |   mov A, A + 0x4
                                                     --      | _L_fn__parse_hex_arg_1:
    x"dc",                                           -- f81f |   ret
                                                     --      | end_fn__parse_hex_arg:
                                                     --      | 
                                                     --      | fn_parse_hex_16:
    x"e0",x"20",                                     -- f820 |   push A
    x"e0",x"60",                                     -- f822 |   push C
    x"5c",x"f8",x"58",x"00",                         -- f824 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"4f",x"00",             -- f828 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f82e |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f832 |   or C, H
    x"44",x"20",                                     -- f835 |   inc A
    x"5c",x"f8",x"45",x"00",                         -- f837 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"3c",x"00",             -- f83b |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f841 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f845 |   or C, H
    x"44",x"20",                                     -- f848 |   inc A
    x"5c",x"f8",x"32",x"00",                         -- f84a |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"29",x"00",             -- f84e |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f854 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f858 |   or C, H
    x"44",x"20",                                     -- f85b |   inc A
    x"5c",x"f8",x"1f",x"00",                         -- f85d |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"16",x"00",             -- f861 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f867 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f86b |   or C, H
    x"44",x"20",                                     -- f86e |   inc A
    x"60",x"ff",x"60",                               -- f870 |   mov H, C
    x"60",x"fe",x"1c",x"01",                         -- f873 |   mov G, 0x1
                                                     --      | _L_fn_parse_hex_16_1:
    x"e4",x"60",                                     -- f877 |   pop C
    x"e4",x"20",                                     -- f879 |   pop A
    x"dc",                                           -- f87b |   ret
                                                     --      | end_fn_parse_hex_16:
                                                     --      | 
                                                     --      | fn_parse_hex_4:
    x"65",x"ff",x"20",                               -- f87c |   bmov H, [A]
    x"30",x"ff",x"1c",x"20",                         -- f87f |   or H, 0x20
    x"f0",x"ff",x"1c",x"f8",x"30",x"38",x"00",       -- f883 |   jlt H, 0x30, ${_L_fn_parse_hex_4_2}:rel + PC
    x"f8",x"ff",x"1c",x"f8",x"66",x"31",x"00",       -- f88a |   jgt H, 0x66, ${_L_fn_parse_hex_4_2}:rel + PC
                                                     --      | _B_fn_parse_hex_4_3:
    x"f4",x"ff",x"1c",x"f8",x"39",x"12",x"00",       -- f891 |   jle H, 0x39, ${_E_fn_parse_hex_4_3}:rel + PC
    x"fc",x"ff",x"1c",x"f8",x"61",x"0b",x"00",       -- f898 |   jge H, 0x61, ${_E_fn_parse_hex_4_3}:rel + PC
    x"58",x"f8",x"1c",x"00",                         -- f89f |   jmp ${_L_fn_parse_hex_4_2}:rel + PC
                                                     --      | _E_fn_parse_hex_4_3:
                                                     --      | _B_fn_parse_hex_4_4:
    x"f8",x"ff",x"1c",x"f8",x"39",x"0f",x"00",       -- f8a3 |   jgt H, 0x39, ${_E_fn_parse_hex_4_4}:rel + PC
    x"04",x"ff",x"1c",x"30",                         -- f8aa |   sub H, 0x30
    x"58",x"f8",x"08",x"00",                         -- f8ae |   jmp ${_L_fn_parse_hex_4_1}:rel + PC
                                                     --      | _E_fn_parse_hex_4_4:
    x"04",x"ff",x"1c",x"57",                         -- f8b2 |   sub H, 0x57
                                                     --      | _L_fn_parse_hex_4_1:
    x"60",x"fe",x"1c",x"01",                         -- f8b6 |   mov G, 0x1
    x"dc",                                           -- f8ba |   ret
                                                     --      | _L_fn_parse_hex_4_2:
    x"60",x"fe",x"00",                               -- f8bb |   mov G, 0
    x"dc",                                           -- f8be |   ret
                                                     --      | end_fn_parse_hex_4:
                                                     --      | 
                                                     --      | fn_put_hex_16:
    x"e0",x"20",                                     -- f8bf |   push A
    x"e0",x"40",                                     -- f8c1 |   push B
    x"e0",x"60",                                     -- f8c3 |   push C
    x"60",x"60",x"40",                               -- f8c5 |   mov C, B
    x"a0",x"40",x"60",x"1c",x"0c",                   -- f8c8 |   shr B, C, 0xc
    x"2c",x"40",x"1c",x"0f",                         -- f8cd |   and B, 0xf
    x"5c",x"f8",x"39",x"00",                         -- f8d1 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f8d5 |   inc A
    x"a0",x"40",x"60",x"1c",x"08",                   -- f8d7 |   shr B, C, 0x8
    x"2c",x"40",x"1c",x"0f",                         -- f8dc |   and B, 0xf
    x"5c",x"f8",x"2a",x"00",                         -- f8e0 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f8e4 |   inc A
    x"a0",x"40",x"60",x"1c",x"04",                   -- f8e6 |   shr B, C, 0x4
    x"2c",x"40",x"1c",x"0f",                         -- f8eb |   and B, 0xf
    x"5c",x"f8",x"1b",x"00",                         -- f8ef |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f8f3 |   inc A
    x"a0",x"40",x"60",x"00",                         -- f8f5 |   shr B, C, 0
    x"2c",x"40",x"1c",x"0f",                         -- f8f9 |   and B, 0xf
    x"5c",x"f8",x"0d",x"00",                         -- f8fd |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f901 |   inc A
    x"e4",x"60",                                     -- f903 |   pop C
    x"e4",x"40",                                     -- f905 |   pop B
    x"e4",x"20",                                     -- f907 |   pop A
    x"dc",                                           -- f909 |   ret
                                                     --      | end_fn_put_hex_16:
                                                     --      | 
                                                     --      | fn_put_hex_4:
    x"60",x"ff",x"40",                               -- f90a |   mov H, B
                                                     --      | _B_fn_put_hex_4_2:
    x"f8",x"ff",x"1c",x"f8",x"09",x"0f",x"00",       -- f90d |   jgt H, 0x9, ${_E_fn_put_hex_4_2}:rel + PC
    x"00",x"ff",x"1c",x"30",                         -- f914 |   add H, 0x30
    x"58",x"f8",x"08",x"00",                         -- f918 |   jmp ${_L_fn_put_hex_4_1}:rel + PC
                                                     --      | _E_fn_put_hex_4_2:
    x"00",x"ff",x"1c",x"57",                         -- f91c |   add H, 0x57
                                                     --      | _L_fn_put_hex_4_1:
    x"62",x"20",x"ff",                               -- f920 |   mov [A], H
    x"dc",                                           -- f923 |   ret
                                                     --      | end_fn_put_hex_4:
                                                     --      | 
                                                     --      | fn_handle_write:
    x"e0",x"20",                                     -- f924 |   push A
    x"e0",x"40",                                     -- f926 |   push B
    x"e0",x"60",                                     -- f928 |   push C
    x"e0",x"fc",                                     -- f92a |   push E
    x"e0",x"fd",                                     -- f92c |   push F
    x"e0",x"fe",                                     -- f92e |   push G
    x"5c",x"f8",x"c3",x"fe",                         -- f930 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"89",x"00",             -- f934 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
    x"60",x"60",x"ff",                               -- f93a |   mov C, H
    x"60",x"fd",x"ff",                               -- f93d |   mov F, H
    x"65",x"ff",x"20",                               -- f940 |   bmov H, [A]
    x"e8",x"ff",x"00",x"f8",x"7a",x"00",             -- f943 |   jeq H, 0, ${_L_fn_handle_write_1}:rel + PC
    x"44",x"20",                                     -- f949 |   inc A
    x"5c",x"f8",x"95",x"fd",                         -- f94b |   call ${fn_split_command}:rel + PC
    x"60",x"40",x"ff",                               -- f94f |   mov B, H
                                                     --      | _B_fn_handle_write_2:
    x"fc",x"20",x"40",x"f8",x"2b",x"00",             -- f952 |   jge A, B, ${_E_fn_handle_write_2}:rel + PC
    x"5c",x"f8",x"c8",x"fe",                         -- f958 |   call ${fn_parse_hex_16}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"61",x"00",             -- f95c |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
    x"a8",x"fc",x"ff",x"1c",x"08",                   -- f962 |   shl E, H, 0x8
    x"20",x"ff",x"1c",x"08",                         -- f967 |   shr H, 0x8
    x"30",x"fc",x"ff",                               -- f96b |   or E, H
    x"62",x"60",x"fc",                               -- f96e |   mov [C], E
    x"60",x"20",x"3c",x"04",                         -- f971 |   mov A, A + 0x4
    x"60",x"60",x"7c",x"02",                         -- f975 |   mov C, C + 0x2
    x"58",x"f8",x"d9",x"ff",                         -- f979 |   jmp ${_B_fn_handle_write_2}:rel + PC
                                                     --      | _E_fn_handle_write_2:
                                                     --      | _B_fn_handle_write_3:
    x"60",x"20",x"e0",x"98",x"fb",                   -- f97d |   mov A, ${var_uart_send_buf}
    x"62",x"20",x"e0",x"4f",x"4b",                   -- f982 |   mov [A], 0x4b4f
    x"62",x"3c",x"1c",x"02",x"20",                   -- f987 |   mov [A + 0x2], 0x20
    x"60",x"20",x"3c",x"03",                         -- f98c |   mov A, A + 0x3
    x"60",x"40",x"fd",                               -- f990 |   mov B, F
    x"5c",x"f8",x"2c",x"ff",                         -- f993 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- f997 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- f99c |   mov A, A + 0x5
    x"60",x"40",x"60",                               -- f9a0 |   mov B, C
    x"5c",x"f8",x"1c",x"ff",                         -- f9a3 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"0a",                   -- f9a7 |   mov [A + 0x4], 0xa
    x"60",x"20",x"e0",x"98",x"fb",                   -- f9ac |   mov A, ${var_uart_send_buf}
    x"5c",x"f8",x"c7",x"fb",                         -- f9b1 |   call ${fn_send_data}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- f9b5 |   mov H, 0x1
    x"58",x"f8",x"07",x"00",                         -- f9b9 |   jmp ${_E_fn_handle_write_3}:rel + PC
                                                     --      | _L_fn_handle_write_1:
    x"60",x"ff",x"00",                               -- f9bd |   mov H, 0
                                                     --      | _E_fn_handle_write_3:
    x"e4",x"fe",                                     -- f9c0 |   pop G
    x"e4",x"fd",                                     -- f9c2 |   pop F
    x"e4",x"fc",                                     -- f9c4 |   pop E
    x"e4",x"60",                                     -- f9c6 |   pop C
    x"e4",x"40",                                     -- f9c8 |   pop B
    x"e4",x"20",                                     -- f9ca |   pop A
    x"dc",                                           -- f9cc |   ret
                                                     --      | end_fn_handle_write:
                                                     --      | 
                                                     --      | fn_handle_jmp:
    x"e0",x"20",                                     -- f9cd |   push A
    x"e0",x"fe",                                     -- f9cf |   push G
    x"5c",x"f8",x"22",x"fe",                         -- f9d1 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"2a",x"00",             -- f9d5 |   jeq G, 0, ${_L_fn_handle_jmp_1}:rel + PC
    x"60",x"20",x"00",                               -- f9db |   mov A, 0
    x"60",x"40",x"00",                               -- f9de |   mov B, 0
    x"60",x"60",x"00",                               -- f9e1 |   mov C, 0
    x"60",x"80",x"00",                               -- f9e4 |   mov D, 0
    x"60",x"fc",x"00",                               -- f9e7 |   mov E, 0
    x"60",x"fd",x"00",                               -- f9ea |   mov F, 0
    x"60",x"fe",x"00",                               -- f9ed |   mov G, 0
    x"60",x"a0",x"00",                               -- f9f0 |   mov SP, 0
    x"62",x"e0",x"00",x"0a",x"ff",                   -- f9f3 |   mov [0xff0a], 0
    x"62",x"e0",x"ff",x"1c",x"ff",                   -- f9f8 |   mov [0xff1c], H
    x"58",x"ff",                                     -- f9fd |   jmp H
                                                     --      | _L_fn_handle_jmp_1:
    x"60",x"ff",x"00",                               -- f9ff |   mov H, 0
    x"e4",x"fe",                                     -- fa02 |   pop G
    x"e4",x"20",                                     -- fa04 |   pop A
    x"dc",                                           -- fa06 |   ret
                                                     --      | end_fn_handle_jmp:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | const_data_1:
    x"52",x"45",x"41",x"44",x"59",x"0a",x"00",       -- fa07 |   .data str:"READY\n"
                                                     --      | const_data_2:
    x"4f",x"56",x"45",x"52",x"46",x"4c",x"4f",x"57",x"0a",x"00", -- fa0e |   .data str:"OVERFLOW\n"
                                                     --      | const_data_3:
    x"50",x"49",x"4e",x"47",x"00",                   -- fa18 |   .data str:"PING"
                                                     --      | const_data_4:
    x"50",x"4f",x"4e",x"47",x"0a",x"00",             -- fa1d |   .data str:"PONG\n"
                                                     --      | const_data_5:
    x"52",x"45",x"41",x"44",x"00",                   -- fa23 |   .data str:"READ"
                                                     --      | const_data_6:
    x"57",x"52",x"49",x"54",x"45",x"00",             -- fa28 |   .data str:"WRITE"
                                                     --      | const_data_7:
    x"4a",x"4d",x"50",x"00",                         -- fa2e |   .data str:"JMP"
                                                     --      | const_data_8:
    x"49",x"4e",x"56",x"41",x"4c",x"49",x"44",x"0a",x"00", -- fa32 |   .data str:"INVALID\n"
                                                     --      | SECTION_END_const_data:
                                                     --      | 
                                                     --      | .offset 0xfb00
                                                     --      | SECTION_BEGIN_static_data:
                                                     --      | var_uart_recv_buf:
                                                     -- fb00 |   .bss size:152
                                                     --      | var_uart_send_buf:
                                                     -- fb98 |   .bss size:152
                                                     --      | SECTION_END_static_data:
                                                     --      | 

    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
