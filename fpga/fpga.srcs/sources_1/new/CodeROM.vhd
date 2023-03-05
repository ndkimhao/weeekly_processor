
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 1355;
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
    x"61",x"ff",x"e0",x"0c",x"ff",                   -- f543 |   mov H, [0xff0c]
    x"2c",x"ff",x"e0",x"00",x"01",                   -- f548 |   and H, 0x100
    x"ec",x"ff",x"00",x"f8",x"13",x"00",             -- f54d |   jne H, 0, ${_E_fn_start_1}:rel + PC
    x"61",x"ff",x"e0",x"1c",x"ff",                   -- f553 |   mov H, [0xff1c]
    x"e8",x"ff",x"00",x"f8",x"08",x"00",             -- f558 |   jeq H, 0, ${_E_fn_start_1}:rel + PC
    x"58",x"ff",                                     -- f55e |   jmp H
                                                     --      | _E_fn_start_1:
    x"60",x"20",x"e0",x"17",x"fa",                   -- f560 |   mov A, ${const_data_1}
    x"5c",x"f8",x"23",x"00",                         -- f565 |   call ${fn_send_data}:rel + PC
    x"60",x"20",x"ff",                               -- f569 |   mov A, H
    x"62",x"e0",x"1c",x"0a",x"ff",x"01",             -- f56c |   mov [0xff0a], 0x1
                                                     --      | _B_fn_start_2:
    x"5c",x"f8",x"56",x"00",                         -- f572 |   call ${fn_recv_command}:rel + PC
    x"5c",x"f8",x"bd",x"00",                         -- f576 |   call ${fn_led_activity}:rel + PC
    x"60",x"20",x"e0",x"00",x"fb",                   -- f57a |   mov A, ${var_uart_buf}
    x"5c",x"f8",x"b9",x"00",                         -- f57f |   call ${fn_parse_command}:rel + PC
    x"58",x"f8",x"ef",x"ff",                         -- f583 |   jmp ${_B_fn_start_2}:rel + PC
                                                     --      | _E_fn_start_2:
    x"dc",                                           -- f587 |   ret
                                                     --      | end_fn_start:
                                                     --      | 
                                                     --      | fn_send_data:
    x"e0",x"20",                                     -- f588 |   push A
    x"e0",x"40",                                     -- f58a |   push B
    x"e0",x"60",                                     -- f58c |   push C
    x"60",x"60",x"1c",x"11",                         -- f58e |   mov C, 0x11
                                                     --      | _B_fn_send_data_1:
    x"61",x"40",x"20",                               -- f592 |   mov B, [A]
    x"2c",x"40",x"e0",x"ff",x"00",                   -- f595 |   and B, 0xff
    x"e8",x"40",x"00",x"f8",x"27",x"00",             -- f59a |   jeq B, 0, ${_E_fn_send_data_1}:rel + PC
                                                     --      | _B_fn_send_data_2:
    x"f0",x"60",x"1c",x"f8",x"10",x"14",x"00",       -- f5a0 |   jlt C, 0x10, ${_E_fn_send_data_2}:rel + PC
    x"61",x"60",x"e0",x"04",x"ff",                   -- f5a7 |   mov C, [0xff04]
    x"2c",x"60",x"1c",x"3f",                         -- f5ac |   and C, 0x3f
    x"58",x"f8",x"f0",x"ff",                         -- f5b0 |   jmp ${_B_fn_send_data_2}:rel + PC
                                                     --      | _E_fn_send_data_2:
    x"62",x"e0",x"40",x"00",x"ff",                   -- f5b4 |   mov [0xff00], B
    x"44",x"20",                                     -- f5b9 |   inc A
    x"44",x"60",                                     -- f5bb |   inc C
    x"58",x"f8",x"d5",x"ff",                         -- f5bd |   jmp ${_B_fn_send_data_1}:rel + PC
                                                     --      | _E_fn_send_data_1:
    x"e4",x"60",                                     -- f5c1 |   pop C
    x"e4",x"40",                                     -- f5c3 |   pop B
    x"e4",x"20",                                     -- f5c5 |   pop A
    x"dc",                                           -- f5c7 |   ret
                                                     --      | end_fn_send_data:
                                                     --      | 
                                                     --      | fn_recv_command:
    x"e0",x"20",                                     -- f5c8 |   push A
    x"e0",x"60",                                     -- f5ca |   push C
    x"e0",x"80",                                     -- f5cc |   push D
    x"e0",x"fe",                                     -- f5ce |   push G
    x"60",x"20",x"00",                               -- f5d0 |   mov A, 0
                                                     --      | _B_fn_recv_command_1:
                                                     --      | _B_fn_recv_command_2:
    x"f0",x"20",x"e0",x"f8",x"25",x"02",x"1b",x"00", -- f5d3 |   jlt A, 0x225, ${_E_fn_recv_command_2}:rel + PC
    x"60",x"fe",x"20",                               -- f5db |   mov G, A
    x"60",x"20",x"e0",x"1e",x"fa",                   -- f5de |   mov A, ${const_data_2}
    x"5c",x"f8",x"a5",x"ff",                         -- f5e3 |   call ${fn_send_data}:rel + PC
    x"60",x"20",x"fe",                               -- f5e7 |   mov A, G
    x"58",x"f8",x"38",x"00",                         -- f5ea |   jmp ${_E_fn_recv_command_1}:rel + PC
                                                     --      | _E_fn_recv_command_2:
    x"61",x"60",x"e0",x"02",x"ff",                   -- f5ee |   mov C, [0xff02]
    x"ac",x"80",x"60",x"e0",x"00",x"80",             -- f5f3 |   and D, C, 0x8000
    x"e8",x"80",x"00",x"f8",x"da",x"ff",             -- f5f9 |   jeq D, 0, ${_B_fn_recv_command_1}:rel + PC
    x"2c",x"60",x"e0",x"ff",x"00",                   -- f5ff |   and C, 0xff
    x"62",x"e0",x"60",x"00",x"ff",                   -- f604 |   mov [0xff00], C
    x"e8",x"60",x"1c",x"f8",x"0a",x"19",x"00",       -- f609 |   jeq C, 0xa, ${_E_fn_recv_command_1}:rel + PC
    x"e8",x"60",x"1c",x"f8",x"0d",x"c3",x"ff",       -- f610 |   jeq C, 0xd, ${_B_fn_recv_command_1}:rel + PC
    x"62",x"e4",x"60",x"00",x"fb",                   -- f617 |   mov [${var_uart_buf} + A], C
    x"44",x"20",                                     -- f61c |   inc A
    x"58",x"f8",x"b5",x"ff",                         -- f61e |   jmp ${_B_fn_recv_command_1}:rel + PC
                                                     --      | _E_fn_recv_command_1:
    x"66",x"e4",x"00",x"00",x"fb",                   -- f622 |   bmov [${var_uart_buf} + A], 0
    x"60",x"ff",x"20",                               -- f627 |   mov H, A
    x"e4",x"fe",                                     -- f62a |   pop G
    x"e4",x"80",                                     -- f62c |   pop D
    x"e4",x"60",                                     -- f62e |   pop C
    x"e4",x"20",                                     -- f630 |   pop A
    x"dc",                                           -- f632 |   ret
                                                     --      | end_fn_recv_command:
                                                     --      | 
                                                     --      | fn_led_activity:
    x"46",x"e0",x"0a",x"ff",                         -- f633 |   inc [0xff0a]
    x"dc",                                           -- f637 |   ret
                                                     --      | end_fn_led_activity:
                                                     --      | 
                                                     --      | fn_parse_command:
    x"e0",x"40",                                     -- f638 |   push B
    x"e0",x"60",                                     -- f63a |   push C
    x"5c",x"f8",x"b4",x"00",                         -- f63c |   call ${fn_split_command}:rel + PC
    x"60",x"40",x"ff",                               -- f640 |   mov B, H
    x"60",x"60",x"e0",x"28",x"fa",                   -- f643 |   mov C, ${const_data_3}
    x"5c",x"f8",x"c6",x"00",                         -- f648 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_3:
    x"e8",x"ff",x"00",x"f8",x"18",x"00",             -- f64c |   jeq H, 0, ${_E_fn_parse_command_3}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f652 |   mov A, B + 0x1
    x"5c",x"f8",x"fa",x"00",                         -- f656 |   call ${fn_handle_ping}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"88",x"00",             -- f65a |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"8b",x"00",                         -- f660 |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_3:
    x"60",x"60",x"e0",x"33",x"fa",                   -- f664 |   mov C, ${const_data_5}
    x"5c",x"f8",x"a5",x"00",                         -- f669 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_4:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- f66d |   jeq H, 0, ${_E_fn_parse_command_4}:rel + PC
    x"65",x"ff",x"40",                               -- f673 |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"6c",x"00",             -- f676 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f67c |   mov A, B + 0x1
    x"5c",x"f8",x"e2",x"00",                         -- f680 |   call ${fn_handle_read}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"5e",x"00",             -- f684 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"61",x"00",                         -- f68a |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_4:
    x"60",x"60",x"e0",x"38",x"fa",                   -- f68e |   mov C, ${const_data_6}
    x"5c",x"f8",x"7b",x"00",                         -- f693 |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_5:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- f697 |   jeq H, 0, ${_E_fn_parse_command_5}:rel + PC
    x"65",x"ff",x"40",                               -- f69d |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"42",x"00",             -- f6a0 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f6a6 |   mov A, B + 0x1
    x"5c",x"f8",x"8a",x"02",                         -- f6aa |   call ${fn_handle_write}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"34",x"00",             -- f6ae |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"37",x"00",                         -- f6b4 |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_5:
    x"60",x"60",x"e0",x"3e",x"fa",                   -- f6b8 |   mov C, ${const_data_7}
    x"5c",x"f8",x"51",x"00",                         -- f6bd |   call ${fn_string_cmp}:rel + PC
                                                     --      | _B_fn_parse_command_6:
    x"e8",x"ff",x"00",x"f8",x"21",x"00",             -- f6c1 |   jeq H, 0, ${_E_fn_parse_command_6}:rel + PC
    x"65",x"ff",x"40",                               -- f6c7 |   bmov H, [B]
    x"e8",x"ff",x"00",x"f8",x"18",x"00",             -- f6ca |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"60",x"20",x"5c",x"01",                         -- f6d0 |   mov A, B + 0x1
    x"5c",x"f8",x"09",x"03",                         -- f6d4 |   call ${fn_handle_jmp}:rel + PC
    x"e8",x"ff",x"00",x"f8",x"0a",x"00",             -- f6d8 |   jeq H, 0, ${_L_fn_parse_command_2}:rel + PC
    x"58",x"f8",x"0d",x"00",                         -- f6de |   jmp ${_L_fn_parse_command_1}:rel + PC
                                                     --      | _E_fn_parse_command_6:
                                                     --      | _L_fn_parse_command_2:
    x"60",x"20",x"e0",x"42",x"fa",                   -- f6e2 |   mov A, ${const_data_8}
    x"5c",x"f8",x"a1",x"fe",                         -- f6e7 |   call ${fn_send_data}:rel + PC
                                                     --      | _L_fn_parse_command_1:
    x"e4",x"60",                                     -- f6eb |   pop C
    x"e4",x"40",                                     -- f6ed |   pop B
    x"dc",                                           -- f6ef |   ret
                                                     --      | end_fn_parse_command:
                                                     --      | 
                                                     --      | fn_split_command:
    x"e0",x"60",                                     -- f6f0 |   push C
    x"60",x"ff",x"20",                               -- f6f2 |   mov H, A
                                                     --      | _B_fn_split_command_1:
    x"65",x"60",x"ff",                               -- f6f5 |   bmov C, [H]
    x"e8",x"60",x"1c",x"f8",x"20",x"13",x"00",       -- f6f8 |   jeq C, 0x20, ${_E_fn_split_command_1}:rel + PC
    x"e8",x"60",x"00",x"f8",x"0c",x"00",             -- f6ff |   jeq C, 0, ${_E_fn_split_command_1}:rel + PC
    x"44",x"ff",                                     -- f705 |   inc H
    x"58",x"f8",x"ee",x"ff",                         -- f707 |   jmp ${_B_fn_split_command_1}:rel + PC
                                                     --      | _E_fn_split_command_1:
    x"e4",x"60",                                     -- f70b |   pop C
    x"dc",                                           -- f70d |   ret
                                                     --      | end_fn_split_command:
                                                     --      | 
                                                     --      | fn_string_cmp:
    x"e0",x"20",                                     -- f70e |   push A
    x"e0",x"40",                                     -- f710 |   push B
    x"e0",x"60",                                     -- f712 |   push C
    x"e0",x"fd",                                     -- f714 |   push F
    x"e0",x"fe",                                     -- f716 |   push G
    x"60",x"ff",x"00",                               -- f718 |   mov H, 0
                                                     --      | _B_fn_string_cmp_3:
    x"65",x"fd",x"20",                               -- f71b |   bmov F, [A]
    x"65",x"fe",x"60",                               -- f71e |   bmov G, [C]
    x"e8",x"20",x"40",x"f8",x"1a",x"00",             -- f721 |   jeq A, B, ${_L_fn_string_cmp_2}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"1e",x"00",             -- f727 |   jeq G, 0, ${_L_fn_string_cmp_1}:rel + PC
    x"ec",x"fd",x"fe",x"f8",x"18",x"00",             -- f72d |   jne F, G, ${_L_fn_string_cmp_1}:rel + PC
    x"44",x"20",                                     -- f733 |   inc A
    x"44",x"60",                                     -- f735 |   inc C
    x"58",x"f8",x"e4",x"ff",                         -- f737 |   jmp ${_B_fn_string_cmp_3}:rel + PC
                                                     --      | _E_fn_string_cmp_3:
                                                     --      | _L_fn_string_cmp_2:
    x"ec",x"fe",x"00",x"f8",x"0a",x"00",             -- f73b |   jne G, 0, ${_L_fn_string_cmp_1}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- f741 |   mov H, 0x1
                                                     --      | _L_fn_string_cmp_1:
    x"e4",x"fe",                                     -- f745 |   pop G
    x"e4",x"fd",                                     -- f747 |   pop F
    x"e4",x"60",                                     -- f749 |   pop C
    x"e4",x"40",                                     -- f74b |   pop B
    x"e4",x"20",                                     -- f74d |   pop A
    x"dc",                                           -- f74f |   ret
                                                     --      | end_fn_string_cmp:
                                                     --      | 
                                                     --      | fn_handle_ping:
    x"e0",x"20",                                     -- f750 |   push A
    x"60",x"20",x"e0",x"2d",x"fa",                   -- f752 |   mov A, ${const_data_4}
    x"5c",x"f8",x"31",x"fe",                         -- f757 |   call ${fn_send_data}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- f75b |   mov H, 0x1
    x"e4",x"20",                                     -- f75f |   pop A
    x"dc",                                           -- f761 |   ret
                                                     --      | end_fn_handle_ping:
                                                     --      | 
                                                     --      | fn_handle_read:
    x"e0",x"20",                                     -- f762 |   push A
    x"e0",x"40",                                     -- f764 |   push B
    x"e0",x"60",                                     -- f766 |   push C
    x"e0",x"80",                                     -- f768 |   push D
    x"e0",x"fc",                                     -- f76a |   push E
    x"e0",x"fd",                                     -- f76c |   push F
    x"e0",x"fe",                                     -- f76e |   push G
    x"5c",x"f8",x"93",x"00",                         -- f770 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"7d",x"00",             -- f774 |   jeq G, 0, ${_L_fn_handle_read_2}:rel + PC
    x"60",x"60",x"ff",                               -- f77a |   mov C, H
    x"5c",x"f8",x"86",x"00",                         -- f77d |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"70",x"00",             -- f781 |   jeq G, 0, ${_L_fn_handle_read_2}:rel + PC
    x"60",x"80",x"ff",                               -- f787 |   mov D, H
    x"60",x"20",x"e0",x"00",x"fb",                   -- f78a |   mov A, ${var_uart_buf}
    x"60",x"40",x"60",                               -- f78f |   mov B, C
    x"5c",x"f8",x"3d",x"01",                         -- f792 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- f796 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- f79b |   mov A, A + 0x5
    x"60",x"40",x"80",                               -- f79f |   mov B, D
    x"5c",x"f8",x"2d",x"01",                         -- f7a2 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- f7a6 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- f7ab |   mov A, A + 0x5
                                                     --      | _B_fn_handle_read_3:
    x"fc",x"20",x"e0",x"f8",x"25",x"fd",x"42",x"00", -- f7af |   jge A, ${var_uart_buf} + 0225, ${_L_fn_handle_read_2}:rel + PC
    x"fc",x"60",x"80",x"f8",x"25",x"00",             -- f7b7 |   jge C, D, ${_E_fn_handle_read_3}:rel + PC
    x"61",x"fc",x"60",                               -- f7bd |   mov E, [C]
    x"a8",x"40",x"fc",x"1c",x"08",                   -- f7c0 |   shl B, E, 0x8
    x"20",x"fc",x"1c",x"08",                         -- f7c5 |   shr E, 0x8
    x"30",x"40",x"fc",                               -- f7c9 |   or B, E
    x"5c",x"f8",x"03",x"01",                         -- f7cc |   call ${fn_put_hex_16}:rel + PC
    x"60",x"20",x"3c",x"04",                         -- f7d0 |   mov A, A + 0x4
    x"60",x"60",x"7c",x"02",                         -- f7d4 |   mov C, C + 0x2
    x"58",x"f8",x"d7",x"ff",                         -- f7d8 |   jmp ${_B_fn_handle_read_3}:rel + PC
                                                     --      | _E_fn_handle_read_3:
    x"62",x"20",x"1c",x"0a",                         -- f7dc |   mov [A], 0xa
    x"60",x"20",x"e0",x"00",x"fb",                   -- f7e0 |   mov A, ${var_uart_buf}
    x"5c",x"f8",x"a3",x"fd",                         -- f7e5 |   call ${fn_send_data}:rel + PC
                                                     --      | _B_fn_handle_read_4:
                                                     --      | _L_fn_handle_read_1:
    x"60",x"ff",x"1c",x"01",                         -- f7e9 |   mov H, 0x1
    x"58",x"f8",x"07",x"00",                         -- f7ed |   jmp ${_E_fn_handle_read_4}:rel + PC
                                                     --      | _L_fn_handle_read_2:
    x"60",x"ff",x"00",                               -- f7f1 |   mov H, 0
                                                     --      | _E_fn_handle_read_4:
    x"e4",x"fe",                                     -- f7f4 |   pop G
    x"e4",x"fd",                                     -- f7f6 |   pop F
    x"e4",x"fc",                                     -- f7f8 |   pop E
    x"e4",x"80",                                     -- f7fa |   pop D
    x"e4",x"60",                                     -- f7fc |   pop C
    x"e4",x"40",                                     -- f7fe |   pop B
    x"e4",x"20",                                     -- f800 |   pop A
    x"dc",                                           -- f802 |   ret
                                                     --      | end_fn_handle_read:
                                                     --      | 
                                                     --      | fn__parse_hex_arg:
                                                     --      | _B_fn__parse_hex_arg_2:
    x"65",x"ff",x"20",                               -- f803 |   bmov H, [A]
    x"ec",x"ff",x"1c",x"f8",x"20",x"09",x"00",       -- f806 |   jne H, 0x20, ${_E_fn__parse_hex_arg_2}:rel + PC
    x"44",x"20",                                     -- f80d |   inc A
                                                     --      | _E_fn__parse_hex_arg_2:
    x"5c",x"f8",x"e1",x"fe",                         -- f80f |   call ${fn_split_command}:rel + PC
    x"60",x"fe",x"00",                               -- f813 |   mov G, 0
    x"ec",x"3c",x"ff",x"f8",x"04",x"19",x"00",       -- f816 |   jne A + 0x4, H, ${_L_fn__parse_hex_arg_1}:rel + PC
    x"5c",x"f8",x"13",x"00",                         -- f81d |   call ${fn_parse_hex_16}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"0e",x"00",             -- f821 |   jeq G, 0, ${_L_fn__parse_hex_arg_1}:rel + PC
    x"60",x"fe",x"1c",x"01",                         -- f827 |   mov G, 0x1
    x"60",x"20",x"3c",x"04",                         -- f82b |   mov A, A + 0x4
                                                     --      | _L_fn__parse_hex_arg_1:
    x"dc",                                           -- f82f |   ret
                                                     --      | end_fn__parse_hex_arg:
                                                     --      | 
                                                     --      | fn_parse_hex_16:
    x"e0",x"20",                                     -- f830 |   push A
    x"e0",x"60",                                     -- f832 |   push C
    x"5c",x"f8",x"58",x"00",                         -- f834 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"4f",x"00",             -- f838 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f83e |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f842 |   or C, H
    x"44",x"20",                                     -- f845 |   inc A
    x"5c",x"f8",x"45",x"00",                         -- f847 |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"3c",x"00",             -- f84b |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f851 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f855 |   or C, H
    x"44",x"20",                                     -- f858 |   inc A
    x"5c",x"f8",x"32",x"00",                         -- f85a |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"29",x"00",             -- f85e |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f864 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f868 |   or C, H
    x"44",x"20",                                     -- f86b |   inc A
    x"5c",x"f8",x"1f",x"00",                         -- f86d |   call ${fn_parse_hex_4}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"16",x"00",             -- f871 |   jeq G, 0, ${_L_fn_parse_hex_16_1}:rel + PC
    x"28",x"60",x"1c",x"04",                         -- f877 |   shl C, 0x4
    x"30",x"60",x"ff",                               -- f87b |   or C, H
    x"44",x"20",                                     -- f87e |   inc A
    x"60",x"ff",x"60",                               -- f880 |   mov H, C
    x"60",x"fe",x"1c",x"01",                         -- f883 |   mov G, 0x1
                                                     --      | _L_fn_parse_hex_16_1:
    x"e4",x"60",                                     -- f887 |   pop C
    x"e4",x"20",                                     -- f889 |   pop A
    x"dc",                                           -- f88b |   ret
                                                     --      | end_fn_parse_hex_16:
                                                     --      | 
                                                     --      | fn_parse_hex_4:
    x"65",x"ff",x"20",                               -- f88c |   bmov H, [A]
    x"30",x"ff",x"1c",x"20",                         -- f88f |   or H, 0x20
    x"f0",x"ff",x"1c",x"f8",x"30",x"38",x"00",       -- f893 |   jlt H, 0x30, ${_L_fn_parse_hex_4_2}:rel + PC
    x"f8",x"ff",x"1c",x"f8",x"66",x"31",x"00",       -- f89a |   jgt H, 0x66, ${_L_fn_parse_hex_4_2}:rel + PC
                                                     --      | _B_fn_parse_hex_4_3:
    x"f4",x"ff",x"1c",x"f8",x"39",x"12",x"00",       -- f8a1 |   jle H, 0x39, ${_E_fn_parse_hex_4_3}:rel + PC
    x"fc",x"ff",x"1c",x"f8",x"61",x"0b",x"00",       -- f8a8 |   jge H, 0x61, ${_E_fn_parse_hex_4_3}:rel + PC
    x"58",x"f8",x"1c",x"00",                         -- f8af |   jmp ${_L_fn_parse_hex_4_2}:rel + PC
                                                     --      | _E_fn_parse_hex_4_3:
                                                     --      | _B_fn_parse_hex_4_4:
    x"f8",x"ff",x"1c",x"f8",x"39",x"0f",x"00",       -- f8b3 |   jgt H, 0x39, ${_E_fn_parse_hex_4_4}:rel + PC
    x"04",x"ff",x"1c",x"30",                         -- f8ba |   sub H, 0x30
    x"58",x"f8",x"08",x"00",                         -- f8be |   jmp ${_L_fn_parse_hex_4_1}:rel + PC
                                                     --      | _E_fn_parse_hex_4_4:
    x"04",x"ff",x"1c",x"57",                         -- f8c2 |   sub H, 0x57
                                                     --      | _L_fn_parse_hex_4_1:
    x"60",x"fe",x"1c",x"01",                         -- f8c6 |   mov G, 0x1
    x"dc",                                           -- f8ca |   ret
                                                     --      | _L_fn_parse_hex_4_2:
    x"60",x"fe",x"00",                               -- f8cb |   mov G, 0
    x"dc",                                           -- f8ce |   ret
                                                     --      | end_fn_parse_hex_4:
                                                     --      | 
                                                     --      | fn_put_hex_16:
    x"e0",x"20",                                     -- f8cf |   push A
    x"e0",x"40",                                     -- f8d1 |   push B
    x"e0",x"60",                                     -- f8d3 |   push C
    x"60",x"60",x"40",                               -- f8d5 |   mov C, B
    x"a0",x"40",x"60",x"1c",x"0c",                   -- f8d8 |   shr B, C, 0xc
    x"2c",x"40",x"1c",x"0f",                         -- f8dd |   and B, 0xf
    x"5c",x"f8",x"39",x"00",                         -- f8e1 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f8e5 |   inc A
    x"a0",x"40",x"60",x"1c",x"08",                   -- f8e7 |   shr B, C, 0x8
    x"2c",x"40",x"1c",x"0f",                         -- f8ec |   and B, 0xf
    x"5c",x"f8",x"2a",x"00",                         -- f8f0 |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f8f4 |   inc A
    x"a0",x"40",x"60",x"1c",x"04",                   -- f8f6 |   shr B, C, 0x4
    x"2c",x"40",x"1c",x"0f",                         -- f8fb |   and B, 0xf
    x"5c",x"f8",x"1b",x"00",                         -- f8ff |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f903 |   inc A
    x"a0",x"40",x"60",x"00",                         -- f905 |   shr B, C, 0
    x"2c",x"40",x"1c",x"0f",                         -- f909 |   and B, 0xf
    x"5c",x"f8",x"0d",x"00",                         -- f90d |   call ${fn_put_hex_4}:rel + PC
    x"44",x"20",                                     -- f911 |   inc A
    x"e4",x"60",                                     -- f913 |   pop C
    x"e4",x"40",                                     -- f915 |   pop B
    x"e4",x"20",                                     -- f917 |   pop A
    x"dc",                                           -- f919 |   ret
                                                     --      | end_fn_put_hex_16:
                                                     --      | 
                                                     --      | fn_put_hex_4:
    x"60",x"ff",x"40",                               -- f91a |   mov H, B
                                                     --      | _B_fn_put_hex_4_2:
    x"f8",x"ff",x"1c",x"f8",x"09",x"0f",x"00",       -- f91d |   jgt H, 0x9, ${_E_fn_put_hex_4_2}:rel + PC
    x"00",x"ff",x"1c",x"30",                         -- f924 |   add H, 0x30
    x"58",x"f8",x"08",x"00",                         -- f928 |   jmp ${_L_fn_put_hex_4_1}:rel + PC
                                                     --      | _E_fn_put_hex_4_2:
    x"00",x"ff",x"1c",x"57",                         -- f92c |   add H, 0x57
                                                     --      | _L_fn_put_hex_4_1:
    x"62",x"20",x"ff",                               -- f930 |   mov [A], H
    x"dc",                                           -- f933 |   ret
                                                     --      | end_fn_put_hex_4:
                                                     --      | 
                                                     --      | fn_handle_write:
    x"e0",x"20",                                     -- f934 |   push A
    x"e0",x"40",                                     -- f936 |   push B
    x"e0",x"60",                                     -- f938 |   push C
    x"e0",x"fc",                                     -- f93a |   push E
    x"e0",x"fd",                                     -- f93c |   push F
    x"e0",x"fe",                                     -- f93e |   push G
    x"5c",x"f8",x"c3",x"fe",                         -- f940 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"89",x"00",             -- f944 |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
    x"60",x"60",x"ff",                               -- f94a |   mov C, H
    x"60",x"fd",x"ff",                               -- f94d |   mov F, H
    x"65",x"ff",x"20",                               -- f950 |   bmov H, [A]
    x"e8",x"ff",x"00",x"f8",x"7a",x"00",             -- f953 |   jeq H, 0, ${_L_fn_handle_write_1}:rel + PC
    x"44",x"20",                                     -- f959 |   inc A
    x"5c",x"f8",x"95",x"fd",                         -- f95b |   call ${fn_split_command}:rel + PC
    x"60",x"40",x"ff",                               -- f95f |   mov B, H
                                                     --      | _B_fn_handle_write_2:
    x"fc",x"20",x"40",x"f8",x"2b",x"00",             -- f962 |   jge A, B, ${_E_fn_handle_write_2}:rel + PC
    x"5c",x"f8",x"c8",x"fe",                         -- f968 |   call ${fn_parse_hex_16}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"61",x"00",             -- f96c |   jeq G, 0, ${_L_fn_handle_write_1}:rel + PC
    x"a8",x"fc",x"ff",x"1c",x"08",                   -- f972 |   shl E, H, 0x8
    x"20",x"ff",x"1c",x"08",                         -- f977 |   shr H, 0x8
    x"30",x"fc",x"ff",                               -- f97b |   or E, H
    x"62",x"60",x"fc",                               -- f97e |   mov [C], E
    x"60",x"20",x"3c",x"04",                         -- f981 |   mov A, A + 0x4
    x"60",x"60",x"7c",x"02",                         -- f985 |   mov C, C + 0x2
    x"58",x"f8",x"d9",x"ff",                         -- f989 |   jmp ${_B_fn_handle_write_2}:rel + PC
                                                     --      | _E_fn_handle_write_2:
                                                     --      | _B_fn_handle_write_3:
    x"60",x"20",x"e0",x"00",x"fb",                   -- f98d |   mov A, ${var_uart_buf}
    x"62",x"20",x"e0",x"4f",x"4b",                   -- f992 |   mov [A], 0x4b4f
    x"62",x"3c",x"1c",x"02",x"20",                   -- f997 |   mov [A + 0x2], 0x20
    x"60",x"20",x"3c",x"03",                         -- f99c |   mov A, A + 0x3
    x"60",x"40",x"fd",                               -- f9a0 |   mov B, F
    x"5c",x"f8",x"2c",x"ff",                         -- f9a3 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"20",                   -- f9a7 |   mov [A + 0x4], 0x20
    x"60",x"20",x"3c",x"05",                         -- f9ac |   mov A, A + 0x5
    x"60",x"40",x"60",                               -- f9b0 |   mov B, C
    x"5c",x"f8",x"1c",x"ff",                         -- f9b3 |   call ${fn_put_hex_16}:rel + PC
    x"62",x"3c",x"1c",x"04",x"0a",                   -- f9b7 |   mov [A + 0x4], 0xa
    x"60",x"20",x"e0",x"00",x"fb",                   -- f9bc |   mov A, ${var_uart_buf}
    x"5c",x"f8",x"c7",x"fb",                         -- f9c1 |   call ${fn_send_data}:rel + PC
    x"60",x"ff",x"1c",x"01",                         -- f9c5 |   mov H, 0x1
    x"58",x"f8",x"07",x"00",                         -- f9c9 |   jmp ${_E_fn_handle_write_3}:rel + PC
                                                     --      | _L_fn_handle_write_1:
    x"60",x"ff",x"00",                               -- f9cd |   mov H, 0
                                                     --      | _E_fn_handle_write_3:
    x"e4",x"fe",                                     -- f9d0 |   pop G
    x"e4",x"fd",                                     -- f9d2 |   pop F
    x"e4",x"fc",                                     -- f9d4 |   pop E
    x"e4",x"60",                                     -- f9d6 |   pop C
    x"e4",x"40",                                     -- f9d8 |   pop B
    x"e4",x"20",                                     -- f9da |   pop A
    x"dc",                                           -- f9dc |   ret
                                                     --      | end_fn_handle_write:
                                                     --      | 
                                                     --      | fn_handle_jmp:
    x"e0",x"20",                                     -- f9dd |   push A
    x"e0",x"fe",                                     -- f9df |   push G
    x"5c",x"f8",x"22",x"fe",                         -- f9e1 |   call ${fn__parse_hex_arg}:rel + PC
    x"e8",x"fe",x"00",x"f8",x"2a",x"00",             -- f9e5 |   jeq G, 0, ${_L_fn_handle_jmp_1}:rel + PC
    x"60",x"20",x"00",                               -- f9eb |   mov A, 0
    x"60",x"40",x"00",                               -- f9ee |   mov B, 0
    x"60",x"60",x"00",                               -- f9f1 |   mov C, 0
    x"60",x"80",x"00",                               -- f9f4 |   mov D, 0
    x"60",x"fc",x"00",                               -- f9f7 |   mov E, 0
    x"60",x"fd",x"00",                               -- f9fa |   mov F, 0
    x"60",x"fe",x"00",                               -- f9fd |   mov G, 0
    x"60",x"a0",x"00",                               -- fa00 |   mov SP, 0
    x"62",x"e0",x"00",x"0a",x"ff",                   -- fa03 |   mov [0xff0a], 0
    x"62",x"e0",x"ff",x"1c",x"ff",                   -- fa08 |   mov [0xff1c], H
    x"58",x"ff",                                     -- fa0d |   jmp H
                                                     --      | _L_fn_handle_jmp_1:
    x"60",x"ff",x"00",                               -- fa0f |   mov H, 0
    x"e4",x"fe",                                     -- fa12 |   pop G
    x"e4",x"20",                                     -- fa14 |   pop A
    x"dc",                                           -- fa16 |   ret
                                                     --      | end_fn_handle_jmp:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | const_data_1:
    x"52",x"45",x"41",x"44",x"59",x"0a",x"00",       -- fa17 |   .data str:"READY\n"
                                                     --      | const_data_2:
    x"4f",x"56",x"45",x"52",x"46",x"4c",x"4f",x"57",x"0a",x"00", -- fa1e |   .data str:"OVERFLOW\n"
                                                     --      | const_data_3:
    x"50",x"49",x"4e",x"47",x"00",                   -- fa28 |   .data str:"PING"
                                                     --      | const_data_4:
    x"50",x"4f",x"4e",x"47",x"0a",x"00",             -- fa2d |   .data str:"PONG\n"
                                                     --      | const_data_5:
    x"52",x"45",x"41",x"44",x"00",                   -- fa33 |   .data str:"READ"
                                                     --      | const_data_6:
    x"57",x"52",x"49",x"54",x"45",x"00",             -- fa38 |   .data str:"WRITE"
                                                     --      | const_data_7:
    x"4a",x"4d",x"50",x"00",                         -- fa3e |   .data str:"JMP"
                                                     --      | const_data_8:
    x"49",x"4e",x"56",x"41",x"4c",x"49",x"44",x"0a",x"00", -- fa42 |   .data str:"INVALID\n"
                                                     --      | SECTION_END_const_data:
                                                     --      | 
                                                     --      | .offset 0xfb00
                                                     --      | SECTION_BEGIN_static_data:
                                                     --      | var_uart_buf:
                                                     -- fb00 |   .bss size:552
                                                     --      | SECTION_END_static_data:
                                                     --      | 

    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
