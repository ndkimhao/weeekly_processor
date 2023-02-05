-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUtopROM is array (0 to 46-1) of TUop;
signal uops_rom : TArrUtopROM := (
	/* 000 */ 13x"0000", --     nop # dummy instruction at index 0 & 1
	/* 001 */ 13x"0000", --     nop, !FALLTHROUGH
	                     -- # ======================================
	                     -- # pre-boot code
	                     -- reset:
	                     --     # --------------------
	                     --     # reset arch registers
	/* 002 */ 13x"0110", --     mov A,  0
	/* 003 */ 13x"0120", --     mov B,  0
	/* 004 */ 13x"0130", --     mov C,  0
	/* 005 */ 13x"0140", --     mov D,  0
	/* 006 */ 13x"0150", --     mov SP, 0
	/* 007 */ 13x"0160", --     mov PC, 0
	/* 008 */ 13x"0170", --     mov FL, 0
	                     --     # --------------------
	                     --     # reset MMU
	/* 009 */ 13x"02b0", --     con H, 1
	/* 010 */ 13x"0190", --     mov F, 0
	/* 011 */ 13x"01a0", --     mov G, 0
	/* 012 */ 13x"0dab", --     alu G, H, SUB
	/* 013 */ 13x"0180", --     mov E, 0
	/* 014 */ 13x"0300", --     mmu # phy=A:B, idx=E, start=F, end=G
	/* 015 */ 13x"01a0", --     mov G, 0
	/* 016 */ 13x"0c8b", --     alu E, H, ADD
	/* 017 */ 13x"0300", --     mmu # idx=1
	/* 018 */ 13x"0c8b", --     alu E, H, ADD
	/* 019 */ 13x"0300", --     mmu # idx=2
	/* 020 */ 13x"0c8b", --     alu E, H, ADD
	/* 021 */ 13x"0300", --     mmu # idx=3
	/* 022 */ 13x"0000", --     nop # wait 1 cycle to write MMU config
	                     --     # --------------------
	                     --     # reset Fetcher
	/* 023 */ 13x"0160", --     mov PC, 0
	/* 024 */ 13x"0261", --     con PC, 0xFFF0
	                     -- # ======================================
	                     -- # ALU ops
	/* 025 */ 13x"1fff", -- alu2_dd:
	/* 026 */ 13x"0210", --     con A,  1
	/* 027 */ 13x"012c", --     mov B, 2
	/* 028 */ 13x"013c", --     mov C, 2
	/* 029 */ 13x"014c", --     mov D, 2
	/* 030 */ 13x"018c", --     mov E, 2
	/* 031 */ 13x"1fff", -- alu2_di:
	/* 032 */ 13x"0210", --     con A,  1
	/* 033 */ 13x"1fff", -- alu2_id:
	/* 034 */ 13x"0210", --     con A,  1
	/* 035 */ 13x"1fff", -- alu2_ii:
	/* 036 */ 13x"0210", --     con A,  1
	/* 037 */ 13x"1fff", -- alu3_dd:
	/* 038 */ 13x"0110", --     mov A,  0
	/* 039 */ 13x"1fff", -- alu3_di:
	/* 040 */ 13x"0110", --     mov A,  0
	/* 041 */ 13x"1fff", -- alu3_id:
	/* 042 */ 13x"0110", --     mov A,  0
	/* 043 */ 13x"1fff", -- alu3_ii:
	/* 044 */ 13x"0110", --     mov A,  0
	/* 045 */ 13x"1fff"  -- end_of_rom:
); -- uops_rom ---------------------------------------------------

constant uops_label_reset : integer := 2;
constant uops_label_alu2_dd : integer := 26;
constant uops_label_alu2_di : integer := 32;
constant uops_label_alu2_id : integer := 34;
constant uops_label_alu2_ii : integer := 36;
constant uops_label_alu3_dd : integer := 38;
constant uops_label_alu3_di : integer := 40;
constant uops_label_alu3_id : integer := 42;
constant uops_label_alu3_ii : integer := 44;

-- ##############################################################
-- ## END UOPS ROM
-- ##############################################################



type TArrUopsConstsROM is array (0 to 2-1) of TData;
signal uops_consts_rom : TArrUopsConstsROM := (
	x"0001", -- used 5 times
	x"FFF0"  -- used 1 times
); -- uops_consts_rom -------------------------------------------


constant UOP_NOP : TUcodeTail := "00";
constant UOP_MOV : TUcodeTail := "01";
constant UOP_CON : TUcodeTail := "10";
constant UOP_MMU : TUcodeTail := "11";
constant UOP_MEM_HEAD : TUcodeHead := "001";
constant UOP_MEM_LOAD : TUcodeTail := "00";
constant UOP_MEM_STORE : TUcodeTail := "01";
constant UOP_ARG_HEAD : TUcodeHead := "010";
constant UOP_ARG_PUT : TUcodeTail := "00";
constant UOP_ARG_GET_0 : TUcodeTail := "01";
constant UOP_ARG_GET_1 : TUcodeTail := "10";
constant UOP_ARG_GET_2 : TUcodeTail := "11";
constant UOP_ALU_HEAD : TUcodeHead := "011";
constant UOP_ALU_ADD : TUcodeTail := "00";
constant UOP_ALU_SUB : TUcodeTail := "01";
constant UOP_ALU_AND : TUcodeTail := "10";
constant UOP_ALU_OP_COPY : TUcodeTail := "11";
constant UOP_CMP_HEAD : TUcodeHead := "100";
constant UOP_CMP_UNSIGNED : TUcodeTail := "00";
constant UOP_CMP_SIGNED : TUcodeTail := "01";
constant UOP_JMP_HEAD : TUcodeHead := "101";
constant UOP_JMP_ALWAYS : TUcodeTail := "00";
constant UOP_JMP_COND_COPY : TUcodeTail := "01";
constant UOP_BRK_HEAD : TUcodeHead := "111";


constant REGID_0 : integer := 0;
constant REGID_A : integer := 1;
constant REGID_B : integer := 2;
constant REGID_C : integer := 3;
constant REGID_D : integer := 4;
constant REGID_SP : integer := 5;
constant REGID_PC : integer := 6;
constant REGID_FL : integer := 7;
constant REGID_E : integer := 8;
constant REGID_F : integer := 9;
constant REGID_G : integer := 10;
constant REGID_H : integer := 11;
constant REGID_2 : integer := 12;
