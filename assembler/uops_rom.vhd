-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUtopROM is array (0 to 232-1) of TUop;
constant uops_rom : TArrUtopROM := (
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
	/* 030 */ 13x"1fff", -- alu_1dx:
	/* 031 */ 13x"0988", --     ([12]d-) arg X, GET_0
	/* 032 */ 13x"0f80", --     (1--) alu X, 0, OP_COPY
	/* 033 */ 13x"0888", --     (1d-) arg X, PUT
	/* 034 */ 13x"1fff", -- alu_1ix:
	/* 035 */ 13x"09bb", --     ([12]i-) arg K, GET_0
	/* 036 */ 13x"048b", --     ([12]i-) mem X, K, LOAD
	/* 037 */ 13x"0f80", --     (1--) alu X, 0, OP_COPY
	/* 038 */ 13x"05b8", --     (1i-) mem K, X, STORE
	/* 039 */ 13x"1fff", -- alu_2dd:
	/* 040 */ 13x"0988", --     ([12]d-) arg X, GET_0
	/* 041 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 042 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 043 */ 13x"0888", --     (2d-) arg X, PUT
	/* 044 */ 13x"1fff", -- alu_2di:
	/* 045 */ 13x"0988", --     ([12]d-) arg X, GET_0
	/* 046 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 047 */ 13x"0499", --     ([23]-i) mem Y, Y, LOAD
	/* 048 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 049 */ 13x"0888", --     (2d-) arg X, PUT
	/* 050 */ 13x"1fff", -- alu_2id:
	/* 051 */ 13x"09bb", --     ([12]i-) arg K, GET_0
	/* 052 */ 13x"048b", --     ([12]i-) mem X, K, LOAD
	/* 053 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 054 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 055 */ 13x"05b8", --     (2i-) mem K, X, STORE
	/* 056 */ 13x"1fff", -- alu_2ii:
	/* 057 */ 13x"09bb", --     ([12]i-) arg K, GET_0
	/* 058 */ 13x"048b", --     ([12]i-) mem X, K, LOAD
	/* 059 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 060 */ 13x"0499", --     ([23]-i) mem Y, Y, LOAD
	/* 061 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 062 */ 13x"05b8", --     (2i-) mem K, X, STORE
	/* 063 */ 13x"1fff", -- alu_3dd:
	/* 064 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 065 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 066 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 067 */ 13x"0899", --     (3d-) arg Y, PUT
	/* 068 */ 13x"1fff", -- alu_3di:
	/* 069 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 070 */ 13x"0499", --     ([23]-i) mem Y, Y, LOAD
	/* 071 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 072 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 073 */ 13x"0899", --     (3d-) arg Y, PUT
	/* 074 */ 13x"1fff", -- alu_3id:
	/* 075 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 076 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 077 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 078 */ 13x"05b9", --     (3i-) mem K, Y, STORE
	/* 079 */ 13x"1fff", -- alu_3ii:
	/* 080 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 081 */ 13x"0499", --     ([23]-i) mem Y, Y, LOAD
	/* 082 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 083 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 084 */ 13x"05b9", --     (3i-) mem K, Y, STORE
	                     -- # ======================================
	                     -- # CMP
	/* 085 */ 13x"1fff", -- cmp_dd:
	/* 086 */ 13x"0988", --     (--) arg X, GET_0
	/* 087 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 088 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 089 */ 13x"1fff", -- cmp_di:
	/* 090 */ 13x"0988", --     (--) arg X, GET_0
	/* 091 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 092 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 093 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 094 */ 13x"1fff", -- cmp_id:
	/* 095 */ 13x"0988", --     (--) arg X, GET_0
	/* 096 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 097 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 098 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 099 */ 13x"1fff", -- cmp_ii:
	/* 100 */ 13x"0988", --     (--) arg X, GET_0
	/* 101 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 102 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 103 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 104 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	                     -- # ======================================
	                     -- # JMP
	/* 105 */ 13x"1fff", -- jmp_d:
	/* 106 */ 13x"0966", --     arg PC, GET_0
	/* 107 */ 13x"1fff", -- jmp_i:
	/* 108 */ 13x"0988", --     arg X, GET_0
	/* 109 */ 13x"0488", --     mem X, X, LOAD
	/* 110 */ 13x"0168", --     mov PC, X
	/* 111 */ 13x"1fff", -- jmp_3dd:
	/* 112 */ 13x"09bb", --     (--) arg K, GET_0
	/* 113 */ 13x"0a88", --     (--) arg X, GET_1
	/* 114 */ 13x"0b99", --     (--) arg Y, GET_2
	/* 115 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 116 */ 13x"176b", --     (--) cmv PC, K, COND_COPY
	/* 117 */ 13x"1fff", -- jmp_3di:
	/* 118 */ 13x"09bb", --     (--) arg K, GET_0
	/* 119 */ 13x"0a88", --     (--) arg X, GET_1
	/* 120 */ 13x"0b99", --     (--) arg Y, GET_2
	/* 121 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 122 */ 13x"176b", --     (--) cmv PC, K, COND_COPY
	/* 123 */ 13x"1fff", -- jmp_3id:
	/* 124 */ 13x"09bb", --     (--) arg K, GET_0
	/* 125 */ 13x"04bb", --     (i-) mem K, K, LOAD
	/* 126 */ 13x"0a88", --     (--) arg X, GET_1
	/* 127 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 128 */ 13x"0b99", --     (--) arg Y, GET_2
	/* 129 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 130 */ 13x"176b", --     (--) cmv PC, K, COND_COPY
	/* 131 */ 13x"1fff", -- jmp_3ii:
	/* 132 */ 13x"09bb", --     (--) arg K, GET_0
	/* 133 */ 13x"04bb", --     (i-) mem K, K, LOAD
	/* 134 */ 13x"0a88", --     (--) arg X, GET_1
	/* 135 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 136 */ 13x"0b99", --     (--) arg Y, GET_2
	/* 137 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 138 */ 13x"176b", --     (--) cmv PC, K, COND_COPY
	                     -- # ======================================
	                     -- # MOV
	/* 139 */ 13x"1fff", -- mov_dd:
	/* 140 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 141 */ 13x"0899", --     (d-) arg Y, PUT
	/* 142 */ 13x"1fff", -- mov_di:
	/* 143 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 144 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 145 */ 13x"0899", --     (d-) arg Y, PUT
	/* 146 */ 13x"1fff", -- mov_id:
	/* 147 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 148 */ 13x"0988", --     (i-) arg X, GET_0
	/* 149 */ 13x"0589", --     (i-) mem X, Y, STORE
	/* 150 */ 13x"1fff", -- mov_ii:
	/* 151 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 152 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 153 */ 13x"0988", --     (i-) arg X, GET_0
	/* 154 */ 13x"0589", --     (i-) mem X, Y, STORE
	                     -- # ======================================
	                     -- # Others
	/* 155 */ 13x"1fff", -- halt:
	/* 156 */ 13x"0166", --     mov PC, PC
	/* 157 */ 13x"1fff", -- getf:
	/* 158 */ 13x"0877", --     arg FL, PUT
	/* 159 */ 13x"1fff", -- setf:
	/* 160 */ 13x"0977", --     arg FL, GET_0
	/* 161 */ 13x"0284", --     con X, 0x3F # 6 bits
	/* 162 */ 13x"0e78", --     alu FL, X, AND
	/* 163 */ 13x"1fff", -- call_d:
	/* 164 */ 13x"0988", --     (-) arg X, GET_0
	/* 165 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 166 */ 13x"0556", --     (-) mem SP, PC, STORE
	/* 167 */ 13x"0168", --     (-) mov PC, X
	/* 168 */ 13x"1fff", -- call_i:
	/* 169 */ 13x"0988", --     (-) arg X, GET_0
	/* 170 */ 13x"0488", --     (i) mem X, X, LOAD
	/* 171 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 172 */ 13x"0556", --     (-) mem SP, PC, STORE
	/* 173 */ 13x"0168", --     (-) mov PC, X
	/* 174 */ 13x"1fff", -- ret:
	/* 175 */ 13x"0485", --     mem X, SP, LOAD
	/* 176 */ 13x"0c5c", --     alu SP, 2, ADD
	/* 177 */ 13x"0168", --     mov PC, X
	/* 178 */ 13x"1fff", -- push_d:
	/* 179 */ 13x"0988", --     (-) arg X, GET_0
	/* 180 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 181 */ 13x"0556", --     (-) mem SP, PC, STORE
	/* 182 */ 13x"1fff", -- push_i:
	/* 183 */ 13x"0988", --     (-) arg X, GET_0
	/* 184 */ 13x"0488", --     (i) mem X, X, LOAD
	/* 185 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 186 */ 13x"0556", --     (-) mem SP, PC, STORE
	/* 187 */ 13x"1fff", -- pop_d:
	/* 188 */ 13x"0495", --     (-) mem Y, SP, LOAD
	/* 189 */ 13x"0c5c", --     (-) alu SP, 2, ADD
	/* 190 */ 13x"0899", --     (d) arg Y, PUT
	/* 191 */ 13x"1fff", -- pop_i:
	/* 192 */ 13x"0495", --     (-) mem Y, SP, LOAD
	/* 193 */ 13x"0c5c", --     (-) alu SP, 2, ADD
	/* 194 */ 13x"0988", --     (i) arg X, GET_0
	/* 195 */ 13x"0589", --     (i) mem X, Y, STORE
	/* 196 */ 13x"1fff", -- mmap_dd: # start, end, slot_idx / Y, Z, X
	/* 197 */ 13x"0999", --     (--) arg, Y, GET_0
	/* 198 */ 13x"0aaa", --     (--) arg, Z, GET_1
	/* 199 */ 13x"0b88", --     (--) arg X, GET_2
	/* 200 */ 13x"0300", --     (--) mmu
	/* 201 */ 13x"1fff", -- mmap_di: # start, end, slot_idx / Y, Z, X
	/* 202 */ 13x"0999", --     (--) arg, Y, GET_0
	/* 203 */ 13x"0aaa", --     (--) arg, Z, GET_1
	/* 204 */ 13x"0b88", --     (--) arg X, GET_2
	/* 205 */ 13x"0300", --     (--) mmu
	/* 206 */ 13x"1fff", -- mmap_id: # start, end, slot_idx / Y, Z, X
	/* 207 */ 13x"0999", --     (--) arg, Y, GET_0
	/* 208 */ 13x"0499", --     (i-) mem, Y, Y, LOAD
	/* 209 */ 13x"0aaa", --     (--) arg, Z, GET_1
	/* 210 */ 13x"04aa", --     (i-) mem, Z, Z, LOAD
	/* 211 */ 13x"0b88", --     (--) arg X, GET_2
	/* 212 */ 13x"0300", --     (--) mmu
	/* 213 */ 13x"1fff", -- mmap_ii: # start, end, slot_idx / Y, Z, X
	/* 214 */ 13x"0999", --     (--) arg, Y, GET_0
	/* 215 */ 13x"0499", --     (i-) mem, Y, Y, LOAD
	/* 216 */ 13x"0aaa", --     (--) arg, Z, GET_1
	/* 217 */ 13x"04aa", --     (i-) mem, Z, Z, LOAD
	/* 218 */ 13x"0b88", --     (--) arg X, GET_2
	/* 219 */ 13x"0300", --     (--) mmu
	/* 220 */ 13x"1fff", -- umap_d:
	/* 221 */ 13x"0988", --     (-) arg, X, GET_0
	/* 222 */ 13x"0190", --     (-) mov Y, 0
	/* 223 */ 13x"01a0", --     (-) mov Z, 0
	/* 224 */ 13x"0300", --     (-) mmu
	/* 225 */ 13x"1fff", -- umap_i:
	/* 226 */ 13x"0988", --     (-) arg, X, GET_0
	/* 227 */ 13x"0488", --     (i) mem, X, X, LOAD
	/* 228 */ 13x"0190", --     (-) mov Y, 0
	/* 229 */ 13x"01a0", --     (-) mov Z, 0
	/* 230 */ 13x"0300", --     (-) mmu
	/* 231 */ 13x"1fff"  -- end_of_rom:
); -- uops_rom ---------------------------------------------------

constant label_reset : integer := 2;
constant label_alu_1dx : integer := 31;
constant label_alu_1ix : integer := 35;
constant label_alu_2dd : integer := 40;
constant label_alu_2di : integer := 45;
constant label_alu_2id : integer := 51;
constant label_alu_2ii : integer := 57;
constant label_alu_3dd : integer := 64;
constant label_alu_3di : integer := 69;
constant label_alu_3id : integer := 75;
constant label_alu_3ii : integer := 80;
constant label_cmp_dd : integer := 86;
constant label_cmp_di : integer := 90;
constant label_cmp_id : integer := 95;
constant label_cmp_ii : integer := 100;
constant label_jmp_d : integer := 106;
constant label_jmp_i : integer := 108;
constant label_jmp_3dd : integer := 112;
constant label_jmp_3di : integer := 118;
constant label_jmp_3id : integer := 124;
constant label_jmp_3ii : integer := 132;
constant label_mov_dd : integer := 140;
constant label_mov_di : integer := 143;
constant label_mov_id : integer := 147;
constant label_mov_ii : integer := 151;
constant label_halt : integer := 156;
constant label_getf : integer := 158;
constant label_setf : integer := 160;
constant label_call_d : integer := 164;
constant label_call_i : integer := 169;
constant label_ret : integer := 175;
constant label_push_d : integer := 179;
constant label_push_i : integer := 183;
constant label_pop_d : integer := 188;
constant label_pop_i : integer := 192;
constant label_mmap_dd : integer := 197;
constant label_mmap_di : integer := 202;
constant label_mmap_id : integer := 207;
constant label_mmap_ii : integer := 214;
constant label_umap_d : integer := 221;
constant label_umap_i : integer := 226;

-- ##############################################################
-- ## END UOPS ROM
-- ##############################################################



type TArrUopsConstsROM is array (0 to 5-1) of TData;
constant uops_consts_rom : TArrUopsConstsROM := (
	x"0001", -- used 1 times
	x"FFFF", -- used 2 times
	x"00FF", -- used 1 times
	x"8000", -- used 2 times
	x"003F"  -- used 1 times
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
constant UOP_CMP_OP_COPY : TUcodeTail := "10";
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
