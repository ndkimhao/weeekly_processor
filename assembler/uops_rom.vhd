-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUtopROM is array (0 to 26-1) of TUop;
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
	/* 007 */ 13x"0260", --     con PC, 0xFFF0
	/* 008 */ 13x"0170", --     mov FL, 0
	                     --     # --------------------
	                     --     # reset MMU
	/* 009 */ 13x"02b1", --     con H, 1
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
	/* 022 */ 13x"1fff", -- alu2_ii:
	/* 023 */ 13x"0110", --     mov A,  0, !FALLTHROUGH
	                     -- alu2_ir:
	/* 024 */ 13x"0110", --     mov A,  0
	/* 025 */ 13x"1fff"  -- end_of_rom:
); -- uops_rom ---------------------------------------------------

constant uops_label_reset : integer := 2;
constant uops_label_alu2_ii : integer := 22;
constant uops_label_alu2_ir : integer := 24;

-- ##############################################################
-- ## END UOPS ROM
-- ##############################################################



type TArrUopsConstsROM is array (0 to 2-1) of TData;
signal uops_consts_rom : TArrUopsConstsROM := (
	x"FFF0", -- used 1 times
	x"0001"  -- used 1 times
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
