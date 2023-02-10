
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := 425;
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
                                                     --      | SECTION_BEGIN_boot:
    x"60",x"a0",x"e0",x"00",x"20",                   -- d000 |   mov SP, 0x2000
    x"5c",x"e0",x"0a",x"d0",                         -- d005 |   call $fn_start
    x"d8",                                           -- d009 |   halt
                                                     --      | SECTION_END_boot:
                                                     --      | 
                                                     --      | fn_start:
    x"60",x"20",x"e0",x"fd",x"00",                   -- d00a |   mov A, 0xfd
    x"60",x"40",x"00",                               -- d00f |   mov B, 0
    x"54",x"e0",x"e0",x"1c",x"00",x"30",x"00",x"30",x"02", -- d012 |   mmap 0x3000, 0x3000, 0x2
    x"60",x"20",x"e0",x"8d",x"d1",                   -- d01b |   mov A, $const_data_1
    x"5c",x"e0",x"4a",x"d0",                         -- d020 |   call $fn_send_data
    x"60",x"20",x"ff",                               -- d024 |   mov A, H
    x"62",x"e0",x"1c",x"04",x"01",x"01",             -- d027 |   mov [$var_led_status], 0x1
    x"63",x"e0",x"e0",x"0a",x"30",x"04",x"01",       -- d02d |   mov [0x300a], [$var_led_status]
                                                     --      | _B_fn_start_1:
    x"5c",x"e0",x"8a",x"d0",                         -- d034 |   call $fn_recv_command
    x"5c",x"e0",x"e8",x"d0",                         -- d038 |   call $fn_led_activity
    x"60",x"20",x"e0",x"00",x"00",                   -- d03c |   mov A, $var_uart_recv_buf
    x"5c",x"e0",x"f4",x"d0",                         -- d041 |   call $fn_parse_command
    x"58",x"e0",x"34",x"d0",                         -- d045 |   jmp $_B_fn_start_1
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
    x"e8",x"40",x"00",x"e0",x"83",x"d0",             -- d05c |   jeq B, 0, $_E_fn_send_data_1
                                                     --      | _B_fn_send_data_2:
    x"f0",x"60",x"1c",x"e0",x"10",x"76",x"d0",       -- d062 |   jlt C, 0x10, $_E_fn_send_data_2
    x"61",x"60",x"e0",x"04",x"30",                   -- d069 |   mov C, [0x3004]
    x"2c",x"60",x"1c",x"3f",                         -- d06e |   and C, 0x3f
    x"58",x"e0",x"62",x"d0",                         -- d072 |   jmp $_B_fn_send_data_2
                                                     --      | _E_fn_send_data_2:
    x"62",x"e0",x"40",x"00",x"30",                   -- d076 |   mov [0x3000], B
    x"44",x"20",                                     -- d07b |   inc A
    x"44",x"60",                                     -- d07d |   inc C
    x"58",x"e0",x"54",x"d0",                         -- d07f |   jmp $_B_fn_send_data_1
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
    x"f0",x"20",x"1c",x"e0",x"7f",x"af",x"d0",       -- d095 |   jlt A, 0x7f, $_E_fn_recv_command_2
    x"60",x"fe",x"20",                               -- d09c |   mov G, A
    x"60",x"20",x"e0",x"94",x"d1",                   -- d09f |   mov A, $const_data_2
    x"5c",x"e0",x"4a",x"d0",                         -- d0a4 |   call $fn_send_data
    x"60",x"20",x"fe",                               -- d0a8 |   mov A, G
    x"58",x"e0",x"dc",x"d0",                         -- d0ab |   jmp $_E_fn_recv_command_1
                                                     --      | _E_fn_recv_command_2:
    x"61",x"60",x"e0",x"02",x"30",                   -- d0af |   mov C, [0x3002]
    x"ac",x"80",x"60",x"e0",x"00",x"80",             -- d0b4 |   and D, C, 0x8000
    x"e8",x"80",x"00",x"e0",x"95",x"d0",             -- d0ba |   jeq D, 0, $_B_fn_recv_command_1
    x"2c",x"60",x"e0",x"ff",x"00",                   -- d0c0 |   and C, 0xff
    x"62",x"e0",x"60",x"00",x"30",                   -- d0c5 |   mov [0x3000], C
    x"e8",x"60",x"1c",x"e0",x"0a",x"dc",x"d0",       -- d0ca |   jeq C, 0xa, $_E_fn_recv_command_1
    x"62",x"e4",x"60",x"00",x"00",                   -- d0d1 |   mov [$var_uart_recv_buf + A], C
    x"44",x"20",                                     -- d0d6 |   inc A
    x"58",x"e0",x"95",x"d0",                         -- d0d8 |   jmp $_B_fn_recv_command_1
                                                     --      | _E_fn_recv_command_1:
    x"60",x"ff",x"20",                               -- d0dc |   mov H, A
    x"e4",x"fe",                                     -- d0df |   pop G
    x"e4",x"80",                                     -- d0e1 |   pop D
    x"e4",x"60",                                     -- d0e3 |   pop C
    x"e4",x"20",                                     -- d0e5 |   pop A
    x"dc",                                           -- d0e7 |   ret
                                                     --      | end_fn_recv_command:
                                                     --      | 
                                                     --      | fn_led_activity:
    x"46",x"e0",x"04",x"01",                         -- d0e8 |   inc [$var_led_status]
    x"63",x"e0",x"e0",x"0a",x"30",x"04",x"01",       -- d0ec |   mov [0x300a], [$var_led_status]
    x"dc",                                           -- d0f3 |   ret
                                                     --      | end_fn_led_activity:
                                                     --      | 
                                                     --      | fn_parse_command:
    x"e0",x"20",                                     -- d0f4 |   push A
    x"e0",x"40",                                     -- d0f6 |   push B
    x"e0",x"60",                                     -- d0f8 |   push C
    x"e0",x"80",                                     -- d0fa |   push D
    x"5c",x"e0",x"1f",x"d1",                         -- d0fc |   call $fn_split_command
    x"60",x"40",x"ff",                               -- d100 |   mov B, H
    x"60",x"60",x"e0",x"9e",x"d1",                   -- d103 |   mov C, $const_data_3
    x"5c",x"e0",x"3d",x"d1",                         -- d108 |   call $fn_string_cmp
                                                     --      | _B_fn_parse_command_1:
    x"e8",x"ff",x"00",x"e0",x"16",x"d1",             -- d10c |   jeq H, 0, $_E_fn_parse_command_1
    x"5c",x"e0",x"7f",x"d1",                         -- d112 |   call $fn_handle_ping
                                                     --      | _E_fn_parse_command_1:
    x"e4",x"80",                                     -- d116 |   pop D
    x"e4",x"60",                                     -- d118 |   pop C
    x"e4",x"40",                                     -- d11a |   pop B
    x"e4",x"20",                                     -- d11c |   pop A
    x"dc",                                           -- d11e |   ret
                                                     --      | end_fn_parse_command:
                                                     --      | 
                                                     --      | fn_split_command:
    x"e0",x"60",                                     -- d11f |   push C
    x"60",x"ff",x"20",                               -- d121 |   mov H, A
                                                     --      | _B_fn_split_command_1:
    x"65",x"60",x"ff",                               -- d124 |   bmov C, [H]
    x"e8",x"60",x"1c",x"e0",x"20",x"3a",x"d1",       -- d127 |   jeq C, 0x20, $_E_fn_split_command_1
    x"e8",x"60",x"00",x"e0",x"3a",x"d1",             -- d12e |   jeq C, 0, $_E_fn_split_command_1
    x"44",x"ff",                                     -- d134 |   inc H
    x"58",x"e0",x"24",x"d1",                         -- d136 |   jmp $_B_fn_split_command_1
                                                     --      | _E_fn_split_command_1:
    x"e4",x"60",                                     -- d13a |   pop C
    x"dc",                                           -- d13c |   ret
                                                     --      | end_fn_split_command:
                                                     --      | 
                                                     --      | fn_string_cmp:
    x"e0",x"20",                                     -- d13d |   push A
    x"e0",x"40",                                     -- d13f |   push B
    x"e0",x"60",                                     -- d141 |   push C
    x"e0",x"fd",                                     -- d143 |   push F
    x"e0",x"fe",                                     -- d145 |   push G
    x"60",x"ff",x"00",                               -- d147 |   mov H, 0
                                                     --      | _B_fn_string_cmp_3:
    x"65",x"fd",x"20",                               -- d14a |   bmov F, [A]
    x"65",x"fe",x"60",                               -- d14d |   bmov G, [C]
    x"e8",x"20",x"40",x"e0",x"6a",x"d1",             -- d150 |   jeq A, B, $_L_fn_string_cmp_2
    x"e8",x"fe",x"00",x"e0",x"74",x"d1",             -- d156 |   jeq G, 0, $_L_fn_string_cmp_1
    x"ec",x"fd",x"fe",x"e0",x"74",x"d1",             -- d15c |   jne F, G, $_L_fn_string_cmp_1
    x"44",x"20",                                     -- d162 |   inc A
    x"44",x"60",                                     -- d164 |   inc C
    x"58",x"e0",x"4a",x"d1",                         -- d166 |   jmp $_B_fn_string_cmp_3
                                                     --      | _E_fn_string_cmp_3:
                                                     --      | _L_fn_string_cmp_2:
    x"ec",x"fe",x"00",x"e0",x"74",x"d1",             -- d16a |   jne G, 0, $_L_fn_string_cmp_1
    x"60",x"ff",x"1c",x"01",                         -- d170 |   mov H, 0x1
                                                     --      | _L_fn_string_cmp_1:
    x"e4",x"fe",                                     -- d174 |   pop G
    x"e4",x"fd",                                     -- d176 |   pop F
    x"e4",x"60",                                     -- d178 |   pop C
    x"e4",x"40",                                     -- d17a |   pop B
    x"e4",x"20",                                     -- d17c |   pop A
    x"dc",                                           -- d17e |   ret
                                                     --      | end_fn_string_cmp:
                                                     --      | 
                                                     --      | fn_handle_ping:
    x"e0",x"20",                                     -- d17f |   push A
    x"60",x"20",x"e0",x"a3",x"d1",                   -- d181 |   mov A, $const_data_4
    x"5c",x"e0",x"4a",x"d0",                         -- d186 |   call $fn_send_data
    x"e4",x"20",                                     -- d18a |   pop A
    x"dc",                                           -- d18c |   ret
                                                     --      | end_fn_handle_ping:
                                                     --      | 
                                                     --      | SECTION_BEGIN_const_data:
                                                     --      | const_data_1:
    x"52",x"45",x"41",x"44",x"59",x"0a",x"00",       -- d18d |   .data str:"READY\n"
                                                     --      | const_data_2:
    x"4f",x"56",x"45",x"52",x"46",x"4c",x"4f",x"57",x"0a",x"00", -- d194 |   .data str:"OVERFLOW\n"
                                                     --      | const_data_3:
    x"50",x"49",x"4e",x"47",x"00",                   -- d19e |   .data str:"PING"
                                                     --      | const_data_4:
    x"50",x"4f",x"4e",x"47",x"0a",x"00",             -- d1a3 |   .data str:"PONG\n"
                                                     --      | SECTION_END_const_data:
                                                     --      | 
                                                     --      | .offset 0x0000
                                                     --      | SECTION_BEGIN_static_data:
                                                     --      | var_uart_recv_buf:
                                                     --    0 |   .bss size:130
                                                     --      | var_uart_send_buf:
                                                     --   82 |   .bss size:130
                                                     --      | var_led_status:
                                                     --  104 |   .bss size:2
                                                     --      | SECTION_END_static_data:
                                                     --      | 

    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
