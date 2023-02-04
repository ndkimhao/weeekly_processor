-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUtopROM is array (0 to 25-1) of TUop;
signal uops_rom : TArrUtopROM := (
	"00000000000000", -- 0000 |     NULL # dummy instruction at index 0 & 1
	"00000000000000", -- 0000 |     NULL, FALLTHROUGH
	                  --      | # ======================================
	                  --      | # pre-boot code
	                  --      | reset:
	                  --      |     # --------------------
	                  --      |     # reset arch registers
	"00000100010000", -- 0110 |     MOV A,  0
	"00000100100000", -- 0120 |     MOV B,  0
	"00000100110000", -- 0130 |     MOV C,  0
	"00000101000000", -- 0140 |     MOV D,  0
	"00000101010000", -- 0150 |     MOV SP, 0
	"00001001100000", -- 0260 |     CON PC, 0xFFF0
	"00000101110000", -- 0170 |     MOV FL, 0
	                  --      |     # --------------------
	                  --      |     # reset MMU
	"00001010110001", -- 02b1 |     CON H, 1
	"00000110010000", -- 0190 |     MOV F, 0
	"00000110100000", -- 01a0 |     MOV G, 0
	"00110110101011", -- 0dab |     ALU G, H, SUB
	"00000110000000", -- 0180 |     MOV E, 0
	"00001100000000", -- 0300 |     MMU # phy=A:B, idx=E, start=F, end=G
	"00000110100000", -- 01a0 |     MOV G, 0
	"00110010001011", -- 0c8b |     ALU E, H, ADD
	"00001100000000", -- 0300 |     MMU # idx=1
	"00110010001011", -- 0c8b |     ALU E, H, ADD
	"00001100000000", -- 0300 |     MMU # idx=2
	"00110010001011", -- 0c8b |     ALU E, H, ADD
	"10001100000000", -- 2300 |     MMU # idx=3
	                  --      | alu2_ii:
	"10000100010000", -- 2110 |     MOV A,  0
	                  --      | alu2_ir:
	"00000100010000", -- 0110 |     MOV A,  0
	"10001000100010"  -- 2222 |     CON B, 0xFFEE
); -- uops_rom ---------------------------------------------------

constant uops_label_reset : integer := 2;
constant uops_label_alu2_ii : integer := 22;
constant uops_label_alu2_ir : integer := 23;

-- ##############################################################
-- ## END UOPS ROM
-- ##############################################################



type TArrUopsConstsROM is array (0 to 16-1) of TData;
signal uops_consts_rom : TArrUopsConstsROM := (
	x"FFF0", -- used 1 times
	x"0001", -- used 1 times
	x"FFEE", -- used 1 times
	x"0000", -- unused
	x"0000", -- unused
	x"0000", -- unused
	x"0000", -- unused
	x"0000", -- unused
	x"0000", -- unused
	x"0000", -- unused
	x"0000", -- unused
	x"0000", -- unused
	x"0000", -- unused
	x"0000", -- unused
	x"0000", -- unused
	x"0000"  -- unused
); -- uops_consts_rom -------------------------------------------
