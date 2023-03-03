
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 1363;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
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
    x"60",x"20",x"e0",x"1f",x"fa",                   -- f543 |   mov A, ${const_data_1}
    x"5c",x"f8",x"2a",x"00",                         -- f548 |   call ${fn_send_data}:rel + PC
    x"60",x"20",x"ff",                               -- f54c |   mov A, H
    x"62",x"e0",x"1c",x"30",x"fc",x"01",             -- f54f |   mov [${var_led_status}], 0x1
    x"63",x"e0",x"e0",x"0a",x"ff",x"30",x"fc",       -- f555 |   mov [0xff0a], [${var_led_status}]
                                                     --      | _B_fn_start_1:
    x"5c",x"f8",x"56",x"00",                         -- f55c |   call ${fn_recv_command}:rel + PC
    x"5c",x"f8",x"bb",x"00",                         -- f560 |   call ${fn_led_activity}:rel + PC
    x"60",x"20",x"e0",x"00",x"fb",                   -- f564 |   mov A, ${var_uart_recv_buf}
    x"5c",x"f8",x"be",x"00",                         -- f569 |   call ${fn_parse_command}:rel + PC
    x"58",x"f8",x"ef",x"ff",                         -- f56d |   jmp ${_B_fn_start_1}:rel + PC
                                                     --      | _E_fn_start_1:
    x"dc",                                           -- f571 |   ret
                                                     --      | end_fn_start:
                                                     --      | 
                                                     --      | fn_send_data:
    x"e0",x"20",                                     -- f572 |   push A
    x"e0",x"40",                                     -- f574 |   push B
    x"e0",x"60",                                     -- f576 |   push C
    x"60",x"60",x"1c",x"11",                         -- f578 |   mov C, 0x11
                                                     --      | _B_fn_send_data_1:
    x"61",x"40",x"20",                               -- f57c |   mov B, [A]
    x"2c",x"40",x"e0",x"ff",x"00",                   -- f57f |   and B, 0xff
    x"e8",x"40",x"00",x"f8",x"27",x"00",             -- f584 |   jeq B, 0, ${_E_fn_send_data_1}:rel + PC
                                                     --      | _B_fn_send_data_2:
    x"f0",x"60",x"1c",x"f8",x"10",x"14",x"00",       -- f58a |   jlt C, 0x10, ${_E_fn_send_data_2}:rel + PC
    x"61",x"60",x"e0",x"04",x"ff",                   -- f591 |   mov C, [0xff04]
    x"2c",x"60",x"1c",x"3f",                         -- f596 |   and C, 0x3f
    x"58",x"f8",x"f0",x"ff",                         -- f59a |   jmp ${_B_fn_send_data_2}:rel + PC
                                                     --      | _E_fn_send_data_2:
    x"62",x"e0",x"40",x"00",x"ff",                   -- f59e |   mov [0xff00], B
    x"44",x"20",                                     -- f5a3 |   inc A
    x"44",x"60",                                     -- f5a5 |   inc C
    x"58",x"f8",x"d5",x"ff",                         -- f5a7 |   jmp ${_B_fn_send_data_1}:rel + PC
                                                     --      | _E_fn_send_data_1:
    x"e4",x"60",                                     -- f5ab |   pop C
    x"e4",x"40",                                     -- f5ad |   pop B
    x"e4",x"20",                                     -- f5af |   pop A
    x"dc",                                           -- f5b1 |   ret
                                                     --      | end_fn_send_data:
                                                     --      | 
                                                     --      | fn_recv_command:
    x"e0",x"20",                                     -- f5b2 |   push A
    x"e0",x"60",                                     -- f5b4 |   push C
    x"e0",x"80",                                     -- f5b6 |   push D
    x"e0",x"fe",                                     -- f5b8 |   push G
    x"60",x"20",x"00",                               -- f5ba |   mov A, 0
                                                     --      | _B_fn_recv_command_1:
                                                     --      | _B_fn_recv_command_2:
    x"f0",x"20",x"e0",x"f8",x"95",x"00",x"1b",x"00", -- f5bd |   jlt A, 0x95, ${_E_fn_recv_command_2}:rel + PC
    x"60",x"fe",x"20",                               -- f5c5 |   mov G, A
    x"60",x"20",x"e0",x"26",x"fa",                   -- f5c8 |   mov A, ${const_data_2}
    x"5c",x"f8",x"a5",x"ff",                         -- f5cd |   call ${fn_send_data}:rel + PC
    x"60",x"20",x"fe",                               -- f5d1 |   mov A, G
    x"58",x"f8",x"38",x"00",                         -- f5d4 |   jmp ${_E_fn_recv_command_1}:rel + PC
                                                     --      | _E_fn_recv_command_2:
    x"61",x"60",x"e0",x"02",x"ff",                   -- f5d8 |   mov C, [0xff02]
    x"ac",x"80",x"60",x"e0",x"00",x"80",             -- f5dd |   and D, C, 0x8000
    x"e8",x"80",x"00",x"f8",x"da",x"ff",             -- f5e3 |   jeq D, 0, ${_B_fn_recv_command_1}:rel + PC
    x"2c",x"60",x"e0",x"ff",x"00",                   -- f5e9 |   and C, 0xff
    x"62",x"e0",x"60",x"00",x"ff",                   -- f5ee |   mov [0xff00], C
    x"e8",x"60",x"1c",x"f8",x"0a",x"19",x"00",       -- f5f3 |   jeq C, 0xa, ${_E_fn_recv_command_1}:rel + PC
    x"e8",x"60",x"1c",x"f8",x"0d",x"c3",x"ff",       -- f5fa |   jeq C, 0xd, ${_B_fn_recv_command_1}:rel + PC
    x"62",x"e4",x"60",x"00",x"fb",                   -- f601 |   mov [${var_uart_recv_buf} + A], C
    x"44",x"20",                                     -- f606 |   inc A
    x"58",x"f8",x"b5",x"ff",                         -- f608 |   jmp ${_B_fn_recv_command_1}:rel + PC
                                                     --      | _E_fn_recv_command_1:
    x"66",x"20",x"00",                               -- f60c |   bmov [A], 0
    x"60",x"ff",x"20",                               -- f60f |   mov H, A
    x"e4",x"fe",                                     -- f612 |   pop G
    x"e4",x"80",                                     -- f614 |   pop D
    x"e4",x"60",                                     -- f616 |   pop C
    x"e4",x"20",                                     -- f618 |   pop A
    x"dc",                                           -- f61a |   ret
                                                     --      | end_fn_recv_command:
                                                     --      | 
                                                     --      | fn_led_activity:
    x"46",x"e0",x"30",x"fc",                         -- f61b |   inc [${var_led_status}]
    x"63",x"e0",x"e0",x"0a",x"ff",x"30",x"fc",       -- f61f |   mov [0xff0a], [${var_led_status}]
    x"dc",                                           -- f626 |   ret
                                                     --      | end_fn_led_activity:
                                                     --      | 
                                                     --      | fn_parse_command:
    x"e0",x"40",                                     -- f627 |   push B
    x"e0",x"60",                                     -- f629 |   push C
    x"5c",x"f8",x"b4",x"00",                         -- f62b |   call ${fn_split_command}:rel + PC
    x"60",x"40",x"ff",                               -- f62f |   mov B, H
    x"60",x"60",x"e0",x"30",x"fa",                   -- f632 |   mov C, ${const_data_3}
    x"5c",x"f8",x"c6",x"00",                         -- f637 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_3:
    x"e8",x"ff",x"00",x"f8",x"18",x"00",             -- f63b |   jeq H, 0, ${_E_fn_parse_command_3}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f641 |   mov A, B + 0x1
    x"5c",x"f8",x"fa",x"00",                         -- f645 |   call ${fn_handle_ping}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"88",x"00",             -- f649 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"8b",x"00",                         -- f64f |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_3:
    x"60",x"60",x"e0",x"3b",x"fa",                   -- f653 |   mov C, ${const_data_5}
    x"5c",x"f8",x"a5",x"00",                         -- f658 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_4:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- f65c |   jeq H, 0, ${_E_fn_parse_command_4}:rel + PC
    x"65",x"ff",x"40",                               -- f662 |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"6c",x"00",             -- f665 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f66b |   mov A, B + 0x1
    x"5c",x"f8",x"e2",x"00",                         -- f66f |   call ${fn_handle_read}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"5e",x"00",             -- f673 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"61",x"00",                         -- f679 |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_4:
    x"60",x"60",x"e0",x"40",x"fa",                   -- f67d |   mov C, ${const_data_6}
    x"5c",x"f8",x"7b",x"00",                         -- f682 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_5:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- f686 |   jeq H, 0, ${_E_fn_parse_command_5}:rel + PC
    x"65",x"ff",x"40",                               -- f68c |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"42",x"00",             -- f68f |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f695 |   mov A, B + 0x1
    x"5c",x"f8",x"8a",x"02",                         -- f699 |   call ${fn_handle_write}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"34",x"00",             -- f69d |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"37",x"00",                         -- f6a3 |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_5:
    x"60",x"60",x"e0",x"46",x"fa",                   -- f6a7 |   mov C, ${const_data_7}
    x"5c",x"f8",x"51",x"00",                         -- f6ac |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_6:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- f6b0 |   jeq H, 0, ${_E_fn_parse_command_6}:rel + PC
    x"65",x"ff",x"40",                               -- f6b6 |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"18",x"00",             -- f6b9 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f6bf |   mov A, B + 0x1
    x"5c",x"f8",x"09",x"03",                         -- f6c3 |   call ${fn_handle_jmp}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"0a",x"00",             -- f6c7 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"0d",x"00",                         -- f6cd |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_6:
                                                     --      | _L_fn_parse_command_2:
    x"60",x"20",x"e0",x"4a",x"fa",                   -- f6d1 |   mov A, ${const_data_8}
    x"5c",x"f8",x"9c",x"fe",                         -- f6d6 |   call ${fn_send_data}:rel + PC
                                                     --      | _L_fn_parse_command_1:
    x"e4",x"60",                                     -- f6da |   pop C
    x"e4",x"40",                                     -- f6dc |   pop B
    x"dc",                                           -- f6de |   ret
                                                     --      | end_fn_parse_command:
                                                     --      | 
                                                     --      | fn_split_command:
    x"e0",x"60",                                     -- f6df |   push C
    x"60",x"ff",x"20",                               -- f6e1 |   mov H, A
                                                     --      | _B_fn_split_command_1:
    x"65",x"60",x"ff",                               -- f6e4 |   bmov C, [H]
    x"e8",x"60",x"1c",x"f8",x"20",x"13",x"00",       -- f6e7 |   jeq C, 0x20, ${_E_fn_split_command_1}:rel + PC
    x"e8",x"60",x"00",x"f8",x"0c",x"00",             -- f6ee |   jeq C, 0, ${_E_fn_split_command_1}:rel + PC
    x"44",x"ff",                                     -- f6f4 |   inc H
    x"58",x"f8",x"ee",x"ff",                         -- f6f6 |   jmp ${_B_fn_split_command_1}:rel + PC
                                                     --      | _E_fn_split_command_1:
    x"e4",x"60",                                     -- f6fa |   pop C
    x"dc",                                           -- f6fc |   ret
                                                     --      | end_fn_split_command:
                                                     --      | 
                                                     --      | fn_string_cmp:
    x"e0",x"20",                                     -- f6fd |   push A
    x"e0",x"40",                                     -- f6ff |   push B
    x"e0",x"60",                                     -- f701 |   push C
    x"e0",x"fd",                                     -- f703 |   push F
    x"e0",x"fe",                                     -- f705 |   push G
    x"60",x"ff",x"00",                               -- f707 |   mov H, 0
                                                     --      | _B_fn_string_cmp_3:
    x"65",x"fd",x"20",                               -- f70a |   bmov F, [A]
    x"65",x"fe",x"60",                               -- f70d |   bmov G, [C]
    x"e8",x"20",x"40",x"f8",x"1a",x"00",             -- f710 |   jeq A, B, ${_L_fn_string_cmp_2}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"1e",x"00",             -- f716 |   jeq G, 0, ${_L_fn_string_cmp_1}:rel + PC
    x"ec",x"fd",x"fe",x"f8",x"18",x"00",             -- f71c |   jne F, G, ${_L_fn_string_cmp_1}:rel + PC
    x"44",x"20",                                     -- f722 |   inc A
    x"44",x"60",                                     -- f724 |   inc C
    x"58",x"f8",x"e4",x"ff",                         -- f726 |   jmp ${_B_fn_string_cmp_3}:rel + PC
                                                     --      | _E_fn_string_cmp_3:
                                                     --      | _L_fn_string_cmp_2:
    x"ec",x"fe",x"00",x"f8",x"0a",x"00",             -- f72a |   jne G, 0, ${_L_fn_string_cmp_1}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- f730 |   mov H, 0x1
                                                     --      | _L_fn_string_cmp_1:
    x"e4",x"fe",                                     -- f734 |   pop G
    x"e4",x"fd",                                     -- f736 |   pop F
    x"e4",x"60",                                     -- f738 |   pop C
    x"e4",x"40",                                     -- f73a |   pop B
    x"e4",x"20",                                     -- f73c |   pop A
    x"dc",                                           -- f73e |   ret
                                                     --      | end_fn_string_cmp:
                                                     --      | 
                                                     --      | fn_handle_ping:
    x"e0",x"20",                                     -- f73f |   push A
    x"60",x"20",x"e0",x"35",x"fa",                   -- f741 |   mov A, ${const_data_4}
    x"5c",x"f8",x"2c",x"fe",                         -- f746 |   call ${fn_send_data}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- f74a |   mov H, 0x1
    x"e4",x"20",                                     -- f74e |   pop A
    x"dc",                                           -- f750 |   ret
                                                     --      | end_fn_handle_ping:
                                                     --      | 
                                                     --      | fn_handle_read:
    x"e0",x"20",                                     -- f751 |   push A
    x"e0",x"40",                                     -- f753 |   push B
    x"e0",x"60",                                     -- f755 |   push C
    x"e0",x"80",                                     -- f757 |   push D
    x"e0",x"fc",                                     -- f759 |   push E
    x"e0",x"fd",                                     -- f75b |   push F
    x"e0",x"fe",                                     -- f75d |   push G
    x"5c",x"f8",x"93",x"00",                         -- f75f |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"7d",x"00",             -- f763 |   jeq G, 0, ${_L_fn_handle_read_2}:rel + PC
    x"60",x"60",x"ff",                               -- f769 |   mov C, H
    x"5c",x"f8",x"86",x"00",                         -- f76c |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"70",x"00",             -- f770 |   jeq G, 0, ${_L_fn_handle_read_2}:rel + PC
    x"60",x"80",x"ff",                               -- f776 |   mov D, H
    x"60",x"20",x"e0",x"98",x"fb",                   -- f779 |   mov A, ${var_uart_send_buf}
    x"60",x"40",x"60",                               -- f77e |   mov B, C
    x"5c",x"f8",x"3d",x"01",                         -- f781 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- f785 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- f78a |   mov A, A + 0x5
    x"60",x"40",x"80",                               -- f78e |   mov B, D
    x"5c",x"f8",x"2d",x"01",                         -- f791 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- f795 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- f79a |   mov A, A + 0x5
                                                     --      | _B_fn_handle_read_3:
    x"fc",x"20",x"e0",x"f8",x"95",x"fb",x"42",x"00", -- f79e |   jge A, ${var_uart_recv_buf} + 0095, ${_L_fn_handle_read_2}:rel + PC
    x"fc",x"60",x"80",x"f8",x"25",x"00",             -- f7a6 |   jge C, D, ${_E_fn_handle_read_3}:rel + PC
    x"61",x"fc",x"60",                               -- f7ac |   mov E, [C]
    x"a8",x"40",x"fc",x"1c",x"08",                   -- f7af |   shl B, E, 0x8
    x"20",x"fc",x"1c",x"08",                         -- f7b4 |   shr E, 0x8
    x"30",x"40",x"fc",                               -- f7b8 |   or B, E
    x"5c",x"f8",x"03",x"01",                         -- f7bb |   call ${fn_put_hex_16}:rel + PC
    x"60",x"20",x"3c",x"04",                         -- f7bf |   mov A, A + 0x4
    x"60",x"60",x"7c",x"02",                         -- f7c3 |   mov C, C + 0x2
    x"58",x"f8",x"d7",x"ff",                         -- f7c7 |   jmp ${_B_fn_handle_read_3}:rel + PC
                                                     --      | _E_fn_handle_read_3:
    x"62",x"20",x"1c",x"0a",                         -- f7cb |   mov [A], 0xa
    x"60",x"20",x"e0",x"98",x"fb",                   -- f7cf |   mov A, ${var_uart_send_buf}
    x"5c",x"f8",x"9e",x"fd",                         -- f7d4 |   call ${fn_send_data}:rel + PC
                                                     --      | _B_fn_handle_read_4:
                                                     --      | _L_fn_handle_read_1:
    x"60",x"ff",x"1c",x"01",                         -- f7d8 |   mov H, 0x1
    x"58",x"f8",x"07",x"00",                         -- f7dc |   jmp ${_E_fn_handle_read_4}:rel + PC
                                                     --      | _L_fn_handle_read_2:
    x"60",x"ff",x"00",                               -- f7e0 |   mov H, 0
                                                     --      | _E_fn_handle_read_4:
    x"e4",x"fe",                                     -- f7e3 |   pop G
    x"e4",x"fd",                                     -- f7e5 |   pop F
    x"e4",x"fc",                                     -- f7e7 |   pop E
    x"e4",x"80",                                     -- f7e9 |   pop D
    x"e4",x"60",                                     -- f7eb |   pop C
    x"e4",x"40",                                     -- f7ed |   pop B
    x"e4",x"20",                                     -- f7ef |   pop A
    x"dc",                                           -- f7f1 |   ret
                                                     --      | end_fn_handle_read:
                                                     --      | 
                                                     --      | fn__parse_hex_arg:
                                                     --      | _B_fn__parse_hex_arg_2:
    x"65",x"ff",x"20",                               -- f7f2 |   bmov H, [A]
    x"ec",x"ff",x"1c",x"f8",x"20",x"09",x"00",       -- f7f5 |   jne H, 0x20, ${_E_fn__parse_hex_arg_2}:rel + PC
    x"44",x"20",                                     -- f7fc |   inc A
                                                     --      | _E_fn__parse_hex_arg_2:
    x"5c",x"f8",x"e1",x"fe",                         -- f7fe |   call ${fn_split_command}:rel + PC
    x"60",x"fe",x"00",                               -- f802 |   mov G, 0
    x"ec",x"3c",x"ff",x"f8",x"04",x"19",x"00",       -- f805 |   jne A + 0x4, H, ${_L_fn__parse_hex_arg_1}:rel + PC
    x"5c",x"f8",x"13",x"00",                         -- f80c |   call ${fn_parse_hex_16}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"0e",x"00",             -- f810 |   jeq G, 0, ${_L_fn__parse_hex_arg_1}:rel + PC
    x"60",x"fe",x"1c",x"01",                         -- f816 |   mov G, 0x1
    x"60",x"20",x"3c",x"04",                         -- f81a |   mov A, A + 0x4
                                                     --      | _L_fn__parse_hex_arg_1:
    x"dc",                                           -- f81e |   ret
                                                     --      | end_fn__parse_hex_arg:
                                                     --      | 
                                                     --      | fn_parse_hex_16:
    x"e0",x"20",                                     -- f81f |   push A
    x"e0",x"60",                                     -- f821 |   push C
    x"5c",x"f8",x"58",x"00",                         -- f823 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"4f",x"00",             -- f827 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f82d |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f831 |   or C, H
    x"44",x"20",                                     -- f834 |   inc A
    x"5c",x"f8",x"45",x"00",                         -- f836 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"3c",x"00",             -- f83a |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f840 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f844 |   or C, H
    x"44",x"20",                                     -- f847 |   inc A
    x"5c",x"f8",x"32",x"00",                         -- f849 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"29",x"00",             -- f84d |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f853 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f857 |   or C, H
    x"44",x"20",                                     -- f85a |   inc A
    x"5c",x"f8",x"1f",x"00",                         -- f85c |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"16",x"00",             -- f860 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f866 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f86a |   or C, H
    x"44",x"20",                                     -- f86d |   inc A
    x"60",x"ff",x"60",                               -- f86f |   mov H, C
    x"60",x"fe",x"1c",x"01",                         -- f872 |   mov G, 0x1
                                                     --      | _L_fn_parse_hex_16_1:
    x"e4",x"60",                                     -- f876 |   pop C
    x"e4",x"20",                                     -- f878 |   pop A
    x"dc",                                           -- f87a |   ret
                                                     --      | end_fn_parse_hex_16:
                                                     --      | 
                                                     --      | fn_parse_hex_4:
    x"65",x"ff",x"20",                               -- f87b |   bmov H, [A]
    x"30",x"ff",x"1c",x"20",                         -- f87e |   or H, 0x20
    x"f0",x"ff",x"1c",x"f8",x"30",x"38",x"00",       -- f882 |   jlt H, 0x30, ${_L_fn_parse_hex_4_2}:rel + PC
    x"f8",x"ff",x"1c",x"f8",x"66",x"31",x"00",       -- f889 |   jgt H, 0x66, ${_L_fn_parse_hex_4_2}:rel + PC
                                                     --      | _B_fn_parse_hex_4_3:
    x"f4",x"ff",x"1c",x"f8",x"39",x"12",x"00",       -- f890 |   jle H, 0x39, ${_E_fn_parse_hex_4_3}:rel + PC
    x"fc",x"ff",x"1c",x"f8",x"61",x"0b",x"00",       -- f897 |   jge H, 0x61, ${_E_fn_parse_hex_4_3}:rel + PC
    x"58",x"f8",x"1c",x"00",                         -- f89e |   jmp ${_L_fn_parse_hex_4_2}:rel + PC
                                                     --      | _E_fn_parse_hex_4_3:
                                                     --      | _B_fn_parse_hex_4_4:
    x"f8",x"ff",x"1c",x"f8",x"39",x"0f",x"00",       -- f8a2 |   jgt H, 0x39, ${_E_fn_parse_hex_4_4}:rel + PC
    x"04",x"ff",x"1c",x"30",                         -- f8a9 |   sub H, 0x30
    x"58",x"f8",x"08",x"00",                         -- f8ad |   jmp ${_L_fn_parse_hex_4_1}:rel + PC
                                                     --      | _E_fn_parse_hex_4_4:
    x"04",x"ff",x"1c",x"57",                         -- f8b1 |   sub H, 0x57
                                                     --      | _L_fn_parse_hex_4_1:
    x"60",x"fe",x"1c",x"01",                         -- f8b5 |   mov G, 0x1
    x"dc",                                           -- f8b9 |   ret
                                                     --      | _L_fn_parse_hex_4_2:
    x"60",x"fe",x"00",                               -- f8ba |   mov G, 0
    x"dc",                                           -- f8bd |   ret
                                                     --      | end_fn_parse_hex_4:
                                                     --      | 
                                                     --      | fn_put_hex_16:
    x"e0",x"20",                                     -- f8be |   push A
    x"e0",x"40",                                     -- f8c0 |   push B
    x"e0",x"60",                                     -- f8c2 |   push C
    x"60",x"60",x"40",                               -- f8c4 |   mov C, B
    x"a0",x"40",x"60",x"1c",x"0c",                   -- f8c7 |   shr B, C, 0xc
    x"2c",x"40",x"1c",x"0f",                         -- f8cc |   and B, 0xf
    x"5c",x"f8",x"39",x"00",                         -- f8d0 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f8d4 |   inc A
    x"a0",x"40",x"60",x"1c",x"08",                   -- f8d6 |   shr B, C, 0x8
    x"2c",x"40",x"1c",x"0f",                         -- f8db |   and B, 0xf
    x"5c",x"f8",x"2a",x"00",                         -- f8df |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f8e3 |   inc A
    x"a0",x"40",x"60",x"1c",x"04",                   -- f8e5 |   shr B, C, 0x4
    x"2c",x"40",x"1c",x"0f",                         -- f8ea |   and B, 0xf
    x"5c",x"f8",x"1b",x"00",                         -- f8ee |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f8f2 |   inc A
    x"a0",x"40",x"60",x"00",                         -- f8f4 |   shr B, C, 0
    x"2c",x"40",x"1c",x"0f",                         -- f8f8 |   and B, 0xf
    x"5c",x"f8",x"0d",x"00",                         -- f8fc |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f900 |   inc A
    x"e4",x"60",                                     -- f902 |   pop C
    x"e4",x"40",                                     -- f904 |   pop B
    x"e4",x"20",                                     -- f906 |   pop A
    x"dc",                                           -- f908 |   ret
                                                     --      | end_fn_put_hex_16:
                                                     --      | 
                                                     --      | fn_put_hex_4:
    x"60",x"ff",x"40",                               -- f909 |   mov H, B
                                                     --      | _B_fn_put_hex_4_2:
    x"f8",x"ff",x"1c",x"f8",x"09",x"0f",x"00",       -- f90c |   jgt H, 0x9, ${_E_fn_put_hex_4_2}:rel + PC
    x"00",x"ff",x"1c",x"30",                         -- f913 |   add H, 0x30
    x"58",x"f8",x"08",x"00",                         -- f917 |   jmp ${_L_fn_put_hex_4_1}:rel + PC
                                                     --      | _E_fn_put_hex_4_2:
    x"00",x"ff",x"1c",x"57",                         -- f91b |   add H, 0x57
                                                     --      | _L_fn_put_hex_4_1:
    x"62",x"20",x"ff",                               -- f91f |   mov [A], H
    x"dc",                                           -- f922 |   ret
                                                     --      | end_fn_put_hex_4:
                                                     --      | 
                                                     --      | fn_handle_write:
    x"e0",x"20",                                     -- f923 |   push A
    x"e0",x"40",                                     -- f925 |   push B
    x"e0",x"60",                                     -- f927 |   push C
    x"e0",x"fc",                                     -- f929 |   push E
    x"e0",x"fd",                                     -- f92b |   push F
    x"e0",x"fe",                                     -- f92d |   push G
    x"5c",x"f8",x"c3",x"fe",                         -- f92f |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"89",x"00",             -- f933 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
    x"60",x"60",x"ff",                               -- f939 |   mov C, H
    x"60",x"fd",x"ff",                               -- f93c |   mov F, H
    x"65",x"ff",x"20",                               -- f93f |   bmov H, [A]
    x"e8",x"ff",x"00",x"f8",x"7a",x"00",             -- f942 |   jeq H, 0, ${_L_fn_handle_write_1}:rel + PC
    x"44",x"20",                                     -- f948 |   inc A
    x"5c",x"f8",x"95",x"fd",                         -- f94a |   call ${fn_split_command}:rel + PC
    x"60",x"40",x"ff",                               -- f94e |   mov B, H
                                                     --      | _B_fn_handle_write_2:
    x"fc",x"20",x"40",x"f8",x"2b",x"00",             -- f951 |   jge A, B, ${_E_fn_handle_write_2}:rel + PC
    x"5c",x"f8",x"c8",x"fe",                         -- f957 |   call ${fn_parse_hex_16}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"61",x"00",             -- f95b |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
    x"a8",x"fc",x"ff",x"1c",x"08",                   -- f961 |   shl E, H, 0x8
    x"20",x"ff",x"1c",x"08",                         -- f966 |   shr H, 0x8
    x"30",x"fc",x"ff",                               -- f96a |   or E, H
    x"62",x"60",x"fc",                               -- f96d |   mov [C], E
    x"60",x"20",x"3c",x"04",                         -- f970 |   mov A, A + 0x4
    x"60",x"60",x"7c",x"02",                         -- f974 |   mov C, C + 0x2
    x"58",x"f8",x"d9",x"ff",                         -- f978 |   jmp ${_B_fn_handle_write_2}:rel + PC
                                                     --      | _E_fn_handle_write_2:
                                                     --      | _B_fn_handle_write_3:
    x"60",x"20",x"e0",x"98",x"fb",                   -- f97c |   mov A, ${var_uart_send_buf}
    x"62",x"20",x"e0",x"4f",x"4b",                   -- f981 |   mov [A], 0x4b4f
    x"62",x"3c",x"1c",x"02",x"20",                   -- f986 |   mov [A + 0x2], 0x20
    x"60",x"20",x"3c",x"03",                         -- f98b |   mov A, A + 0x3
    x"60",x"40",x"fd",                               -- f98f |   mov B, F
    x"5c",x"f8",x"2c",x"ff",                         -- f992 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- f996 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- f99b |   mov A, A + 0x5
    x"60",x"40",x"60",                               -- f99f |   mov B, C
    x"5c",x"f8",x"1c",x"ff",                         -- f9a2 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"0a",                   -- f9a6 |   mov [A + 0x4], 0xa
    x"60",x"20",x"e0",x"98",x"fb",                   -- f9ab |   mov A, ${var_uart_send_buf}
    x"5c",x"f8",x"c2",x"fb",                         -- f9b0 |   call ${fn_send_data}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- f9b4 |   mov H, 0x1
    x"58",x"f8",x"07",x"00",                         -- f9b8 |   jmp ${_E_fn_handle_write_3}:rel + PC
                                                     --      | _L_fn_handle_write_1:
    x"60",x"ff",x"00",                               -- f9bc |   mov H, 0
                                                     --      | _E_fn_handle_write_3:
    x"e4",x"fe",                                     -- f9bf |   pop G
    x"e4",x"fd",                                     -- f9c1 |   pop F
    x"e4",x"fc",                                     -- f9c3 |   pop E
    x"e4",x"60",                                     -- f9c5 |   pop C
    x"e4",x"40",                                     -- f9c7 |   pop B
    x"e4",x"20",                                     -- f9c9 |   pop A
    x"dc",                                           -- f9cb |   ret
                                                     --      | end_fn_handle_write:
                                                     --      | 
                                                     --      | fn_handle_jmp:
    x"e0",x"20",                                     -- f9cc |   push A
    x"e0",x"fe",                                     -- f9ce |   push G
    x"5c",x"f8",x"22",x"fe",                         -- f9d0 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"0c",x"00",             -- f9d4 |   jeq G, 0, ${_L_fn_handle_jmp_1}:rel + PC
    x"5c",x"f8",x"0e",x"00",                         -- f9da |   call ${fn_clear_state}:rel + PC
    x"58",x"ff",                                     -- f9de |   jmp H
                                                     --      | _L_fn_handle_jmp_1:
    x"60",x"ff",x"00",                               -- f9e0 |   mov H, 0
    x"e4",x"fe",                                     -- f9e3 |   pop G
    x"e4",x"20",                                     -- f9e5 |   pop A
    x"dc",                                           -- f9e7 |   ret
                                                     --      | end_fn_handle_jmp:
                                                     --      | 
                                                     --      | fn_clear_state:
    x"60",x"20",x"00",                               -- f9e8 |   mov A, 0
    x"60",x"40",x"1c",x"02",                         -- f9eb |   mov B, 0x2
                                                     --      | _B_fn_clear_state_1:
    x"fc",x"20",x"e0",x"f8",x"00",x"ff",x"12",x"00", -- f9ef |   jge A, 0xff00, ${_E_fn_clear_state_1}:rel + PC
    x"62",x"20",x"00",                               -- f9f7 |   mov [A], 0
    x"00",x"20",x"40",                               -- f9fa |   add A, B
    x"58",x"f8",x"f2",x"ff",                         -- f9fd |   jmp ${_B_fn_clear_state_1}:rel + PC
                                                     --      | _E_fn_clear_state_1:
    x"60",x"20",x"00",                               -- fa01 |   mov A, 0
    x"60",x"40",x"00",                               -- fa04 |   mov B, 0
    x"60",x"60",x"00",                               -- fa07 |   mov C, 0
    x"60",x"80",x"00",                               -- fa0a |   mov D, 0
    x"60",x"fc",x"00",                               -- fa0d |   mov E, 0
    x"60",x"fd",x"00",                               -- fa10 |   mov F, 0
    x"60",x"fe",x"00",                               -- fa13 |   mov G, 0
    x"60",x"a0",x"00",                               -- fa16 |   mov SP, 0
    x"62",x"e0",x"00",x"0a",x"ff",                   -- fa19 |   mov [0xff0a], 0
    x"dc",                                           -- fa1e |   ret
                                                     --      | end_fn_clear_state:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | const_data_1:
    x"52",x"45",x"41",x"44",x"59",x"0a",x"00",       -- fa1f |   .data str:"READY\n"
                                                     --      | const_data_2:
    x"4f",x"56",x"45",x"52",x"46",x"4c",x"4f",x"57",x"0a",x"00", -- fa26 |   .data str:"OVERFLOW\n"
                                                     --      | const_data_3:
    x"50",x"49",x"4e",x"47",x"00",                   -- fa30 |   .data str:"PING"
                                                     --      | const_data_4:
    x"50",x"4f",x"4e",x"47",x"0a",x"00",             -- fa35 |   .data str:"PONG\n"
                                                     --      | const_data_5:
    x"52",x"45",x"41",x"44",x"00",                   -- fa3b |   .data str:"READ"
                                                     --      | const_data_6:
    x"57",x"52",x"49",x"54",x"45",x"00",             -- fa40 |   .data str:"WRITE"
                                                     --      | const_data_7:
    x"4a",x"4d",x"50",x"00",                         -- fa46 |   .data str:"JMP"
                                                     --      | const_data_8:
    x"49",x"4e",x"56",x"41",x"4c",x"49",x"44",x"0a",x"00", -- fa4a |   .data str:"INVALID\n"
                                                     --      | SECTION_END_const_data:
                                                     --      | 
                                                     --      | .offset 0xfb00
                                                     --      | SECTION_BEGIN_static_data:
                                                     --      | var_uart_recv_buf:
                                                     -- fb00 |   .bss size:152
                                                     --      | var_uart_send_buf:
                                                     -- fb98 |   .bss size:152
                                                     --      | var_led_status:
                                                     -- fc30 |   .bss size:2
                                                     --      | SECTION_END_static_data:
                                                     --      | 

    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
