-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUtopROM is array (0 to 103-1) of TUop;
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
	                     --     # phy=A:B, idx=X, start=Y, end=Z
	/* 009 */ 13x"02b0", --     con K, 1
	/* 010 */ 13x"018b", --     mov X, K
	/* 011 */ 13x"0190", --     mov Y, 0
	/* 012 */ 13x"02a1", --     con Z, 0xFFFF
	/* 013 */ 13x"0300", --     mmu # idx=1, 0000-FFFF to 0000-FFFF
	/* 014 */ 13x"01a0", --     mov Z, 0
	/* 015 */ 13x"0c8b", --     alu X, K, ADD
	/* 016 */ 13x"0300", --     mmu # idx=1
	/* 017 */ 13x"0212", --     con A, 0xFF # and B = 0
	/* 018 */ 13x"0293", --     con Y, 0x8000
	/* 019 */ 13x"02a1", --     con Z, 0xFFFF
	/* 020 */ 13x"0c8b", --     alu X, K, ADD
	/* 021 */ 13x"0300", --     mmu # idx=2
	/* 022 */ 13x"0110", --     mov A, 0
	/* 023 */ 13x"0190", --     mov Y, 0
	/* 024 */ 13x"01a0", --     mov Z, 0
	/* 025 */ 13x"0c8b", --     alu X, K, ADD
	/* 026 */ 13x"0300", --     mmu # idx=3
	/* 027 */ 13x"0000", --     nop # wait 1 cycle to write MMU config
	                     --     # --------------------
	                     --     # reset Fetcher
	/* 028 */ 13x"0160", --     mov PC, 0
	/* 029 */ 13x"0263", --     con PC, 0x8000
	                     -- # ======================================
	                     -- # ALU
	/* 030 */ 13x"1fff", -- alu2_dd:
	/* 031 */ 13x"0988", --     arg X, GET_0
	/* 032 */ 13x"0a99", --     arg Y, GET_1
	/* 033 */ 13x"0f89", --     alu X, Y, OP_COPY
	/* 034 */ 13x"0888", --     arg X, PUT
	/* 035 */ 13x"1fff", -- alu2_di:
	/* 036 */ 13x"0988", --     arg X, GET_0
	/* 037 */ 13x"0a99", --     arg Y, GET_1
	/* 038 */ 13x"0499", --     mem Y, Y, LOAD
	/* 039 */ 13x"0f89", --     alu X, Y, OP_COPY
	/* 040 */ 13x"0888", --     arg X, PUT
	/* 041 */ 13x"1fff", -- alu2_id:
	/* 042 */ 13x"0988", --     arg X, GET_0
	/* 043 */ 13x"0a99", --     arg Y, GET_1
	/* 044 */ 13x"04b8", --     mem K, X, LOAD
	/* 045 */ 13x"0fb9", --     alu K, Y, OP_COPY
	/* 046 */ 13x"058b", --     mem X, K, STORE
	/* 047 */ 13x"1fff", -- alu2_ii:
	/* 048 */ 13x"0988", --     arg X, GET_0
	/* 049 */ 13x"0a99", --     arg Y, GET_1
	/* 050 */ 13x"04b8", --     mem K, X, LOAD
	/* 051 */ 13x"0499", --     mem Y, Y, LOAD
	/* 052 */ 13x"0fb9", --     alu K, Y, OP_COPY
	/* 053 */ 13x"058b", --     mem X, K, STORE
	/* 054 */ 13x"1fff", -- alu3_dd:
	/* 055 */ 13x"0a88", --     arg X, GET_1
	/* 056 */ 13x"0b99", --     arg Y, GET_2
	/* 057 */ 13x"0f89", --     alu X, Y, OP_COPY
	/* 058 */ 13x"0888", --     arg X, PUT
	/* 059 */ 13x"1fff", -- alu3_di:
	/* 060 */ 13x"0a88", --     arg X, GET_1
	/* 061 */ 13x"0b99", --     arg Y, GET_2
	/* 062 */ 13x"0488", --     mem X, X, LOAD
	/* 063 */ 13x"0f89", --     alu X, Y, OP_COPY
	/* 064 */ 13x"0888", --     arg X, PUT
	/* 065 */ 13x"1fff", -- alu3_id:
	/* 066 */ 13x"09aa", --     arg Z, GET_0
	/* 067 */ 13x"0a88", --     arg X, GET_1
	/* 068 */ 13x"0b99", --     arg Y, GET_2
	/* 069 */ 13x"0f89", --     alu X, Y, OP_COPY
	/* 070 */ 13x"05a8", --     mem Z, X, STORE
	/* 071 */ 13x"1fff", -- alu3_ii:
	/* 072 */ 13x"09aa", --     arg Z, GET_0
	/* 073 */ 13x"0a88", --     arg X, GET_1
	/* 074 */ 13x"0b99", --     arg Y, GET_2
	/* 075 */ 13x"0488", --     mem X, X, LOAD
	/* 076 */ 13x"0f89", --     alu X, Y, OP_COPY
	/* 077 */ 13x"05a8", --     mem Z, X, STORE
	                     -- # ======================================
	                     -- # JMP
	/* 078 */ 13x"1fff", -- jmp_d:
	/* 079 */ 13x"0966", --     arg PC, GET_0
	/* 080 */ 13x"1fff", -- jmp_i:
	/* 081 */ 13x"0988", --     arg X, GET_0
	/* 082 */ 13x"0488", --     mem X, X, LOAD
	/* 083 */ 13x"0168", --     mov PC, X
	                     -- # ======================================
	                     -- # MOV
	/* 084 */ 13x"1fff", -- mov_dd:
	/* 085 */ 13x"0a99", --     arg Y, GET_1
	/* 086 */ 13x"0899", --     arg Y, PUT
	/* 087 */ 13x"1fff", -- mov_di:
	/* 088 */ 13x"0a99", --     arg Y, GET_1
	/* 089 */ 13x"0499", --     mem Y, Y, LOAD
	/* 090 */ 13x"0899", --     arg Y, PUT
	/* 091 */ 13x"1fff", -- mov_id:
	/* 092 */ 13x"0988", --     arg X, GET_0
	/* 093 */ 13x"0a99", --     arg Y, GET_1
	/* 094 */ 13x"0589", --     mem X, Y, STORE
	/* 095 */ 13x"1fff", -- mov_ii:
	/* 096 */ 13x"0988", --     arg X, GET_0
	/* 097 */ 13x"0a99", --     arg Y, GET_1
	/* 098 */ 13x"0499", --     mem Y, Y, LOAD
	/* 099 */ 13x"0589", --     mem X, Y, STORE
	/* 100 */ 13x"1fff", -- halt:
	/* 101 */ 13x"0166", --     mov PC, PC
	/* 102 */ 13x"1fff"  -- end_of_rom:
); -- uops_rom ---------------------------------------------------

constant label_reset : integer := 2;
constant label_alu2_dd : integer := 31;
constant label_alu2_di : integer := 36;
constant label_alu2_id : integer := 42;
constant label_alu2_ii : integer := 48;
constant label_alu3_dd : integer := 55;
constant label_alu3_di : integer := 60;
constant label_alu3_id : integer := 66;
constant label_alu3_ii : integer := 72;
constant label_jmp_d : integer := 79;
constant label_jmp_i : integer := 81;
constant label_mov_dd : integer := 85;
constant label_mov_di : integer := 88;
constant label_mov_id : integer := 92;
constant label_mov_ii : integer := 96;
constant label_halt : integer := 101;

-- ##############################################################
-- ## END UOPS ROM
-- ##############################################################



type TArrUopsConstsROM is array (0 to 4-1) of TData;
signal uops_consts_rom : TArrUopsConstsROM := (
	x"0001", -- used 1 times
	x"FFFF", -- used 2 times
	x"00FF", -- used 1 times
	x"8000"  -- used 2 times
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
constant UOP_CMV_HEAD : TUcodeHead := "101";
constant UOP_CMV_EQ : TUcodeTail := "00";
constant UOP_CMV_LT : TUcodeTail := "01";
constant UOP_CMV_LE : TUcodeTail := "10";
constant UOP_CMV_COND_COPY : TUcodeTail := "11";
constant UOP_BRK_HEAD : TUcodeHead := "111";


constant REGID_0 : integer := 0;
constant REGID_A : integer := 1;
constant REGID_B : integer := 2;
constant REGID_C : integer := 3;
constant REGID_D : integer := 4;
constant REGID_SP : integer := 5;
constant REGID_PC : integer := 6;
constant REGID_FL : integer := 7;
constant REGID_X : integer := 8;
constant REGID_Y : integer := 9;
constant REGID_Z : integer := 10;
constant REGID_K : integer := 11;
constant REGID_2 : integer := 12;
