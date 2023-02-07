-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUtopROM is array (0 to 237-1) of TUop;
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
	/* 014 */ 13x"0291", --     con Y, 0xFFFF
	/* 015 */ 13x"01a0", --     mov Z, 0
	/* 016 */ 13x"0c8b", --     alu X, K, ADD
	/* 017 */ 13x"0300", --     mmu # idx=1
	/* 018 */ 13x"0212", --     con A, 0xFF # and B = 0
	/* 019 */ 13x"0293", --     con Y, 0xD000
	/* 020 */ 13x"02a1", --     con Z, 0xFFFF
	/* 021 */ 13x"0c8b", --     alu X, K, ADD
	/* 022 */ 13x"0300", --     mmu # idx=2
	/* 023 */ 13x"0110", --     mov A, 0
	/* 024 */ 13x"0291", --     con Y, 0xFFFF
	/* 025 */ 13x"01a0", --     mov Z, 0
	/* 026 */ 13x"0c8b", --     alu X, K, ADD
	/* 027 */ 13x"0300", --     mmu # idx=3
	/* 028 */ 13x"0000", --     nop # wait 1 cycle to write MMU config
	                     --     # --------------------
	                     --     # reset Fetcher
	/* 029 */ 13x"0160", --     mov PC, 0
	/* 030 */ 13x"0263", --     con PC, 0xD000
	                     -- # ======================================
	                     -- # ALU
	/* 031 */ 13x"1fff", -- alu_2dd:
	/* 032 */ 13x"0988", --     (2d-) arg X, GET_0
	/* 033 */ 13x"0a99", --     (---) arg Y, GET_1
	/* 034 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 035 */ 13x"0888", --     (2d-) arg X, PUT
	/* 036 */ 13x"1fff", -- alu_2di:
	/* 037 */ 13x"0988", --     (2d-) arg X, GET_0
	/* 038 */ 13x"0a99", --     (---) arg Y, GET_1
	/* 039 */ 13x"0499", --     (--i) mem Y, Y, LOAD
	/* 040 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 041 */ 13x"0888", --     (2d-) arg X, PUT
	/* 042 */ 13x"1fff", -- alu_2id:
	/* 043 */ 13x"09bb", --     (-i-) arg K, GET_0
	/* 044 */ 13x"048b", --     (2i-) mem X, K, LOAD
	/* 045 */ 13x"0a99", --     (---) arg Y, GET_1
	/* 046 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 047 */ 13x"05b8", --     (2i-) mem K, X, STORE
	/* 048 */ 13x"1fff", -- alu_2ii:
	/* 049 */ 13x"09bb", --     (-i-) arg K, GET_0
	/* 050 */ 13x"048b", --     (2i-) mem X, K, LOAD
	/* 051 */ 13x"0a99", --     (---) arg Y, GET_1
	/* 052 */ 13x"0499", --     (--i) mem Y, Y, LOAD
	/* 053 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 054 */ 13x"05b8", --     (2i-) mem K, X, STORE
	/* 055 */ 13x"1fff", -- alu_3dd:
	/* 056 */ 13x"0a99", --     (---) arg Y, GET_1
	/* 057 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 058 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 059 */ 13x"0899", --     (3d-) arg Y, PUT
	/* 060 */ 13x"1fff", -- alu_3di:
	/* 061 */ 13x"0a99", --     (---) arg Y, GET_1
	/* 062 */ 13x"0499", --     (--i) mem Y, Y, LOAD
	/* 063 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 064 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 065 */ 13x"0899", --     (3d-) arg Y, PUT
	/* 066 */ 13x"1fff", -- alu_3id:
	/* 067 */ 13x"09bb", --     (-i-) arg K, GET_0
	/* 068 */ 13x"0a99", --     (---) arg Y, GET_1
	/* 069 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 070 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 071 */ 13x"05b9", --     (3i-) mem K, Y, STORE
	/* 072 */ 13x"1fff", -- alu_3ii:
	/* 073 */ 13x"09bb", --     (-i-) arg K, GET_0
	/* 074 */ 13x"0a99", --     (---) arg Y, GET_1
	/* 075 */ 13x"0499", --     (--i) mem Y, Y, LOAD
	/* 076 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 077 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 078 */ 13x"05b9", --     (3i-) mem K, Y, STORE
	/* 079 */ 13x"1fff", -- alu_single_1dx:
	/* 080 */ 13x"0988", --     (1d-) arg X, GET_0
	/* 081 */ 13x"0f88", --     (1--) alu X, X, OP_COPY
	/* 082 */ 13x"0888", --     (-d-) arg X, PUT
	/* 083 */ 13x"1fff", -- alu_single_1ix:
	/* 084 */ 13x"09bb", --     (-i-) arg K, GET_0
	/* 085 */ 13x"048b", --     (1i-) mem X, K, LOAD
	/* 086 */ 13x"0f88", --     (1--) alu X, X, OP_COPY
	/* 087 */ 13x"05b8", --     (-i-) mem K, X, STORE
	/* 088 */ 13x"1fff", -- alu_single_2dd:
	/* 089 */ 13x"0a99", --     (2--) arg Y, GET_1
	/* 090 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 091 */ 13x"0888", --     (-d-) arg X, PUT
	/* 092 */ 13x"1fff", -- alu_single_2di:
	/* 093 */ 13x"0a99", --     (2--) arg Y, GET_1
	/* 094 */ 13x"0499", --     (2-i) mem Y, Y, LOAD
	/* 095 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 096 */ 13x"0888", --     (-d-) arg X, PUT
	/* 097 */ 13x"1fff", -- alu_single_2id:
	/* 098 */ 13x"09bb", --     (-i-) arg K, GET_0
	/* 099 */ 13x"0a99", --     (2--) arg Y, GET_1
	/* 100 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 101 */ 13x"05b8", --     (-i-) mem K, X, STORE
	/* 102 */ 13x"1fff", -- alu_single_2ii:
	/* 103 */ 13x"09bb", --     (-i-) arg K, GET_0
	/* 104 */ 13x"0a99", --     (2--) arg Y, GET_1
	/* 105 */ 13x"0499", --     (2-i) mem Y, Y, LOAD
	/* 106 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 107 */ 13x"05b8", --     (-i-) mem K, X, STORE
	                     -- # ======================================
	                     -- # CMP
	/* 108 */ 13x"1fff", -- cmp_dd:
	/* 109 */ 13x"0988", --     (--) arg X, GET_0
	/* 110 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 111 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 112 */ 13x"1fff", -- cmp_di:
	/* 113 */ 13x"0988", --     (--) arg X, GET_0
	/* 114 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 115 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 116 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 117 */ 13x"1fff", -- cmp_id:
	/* 118 */ 13x"0988", --     (--) arg X, GET_0
	/* 119 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 120 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 121 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 122 */ 13x"1fff", -- cmp_ii:
	/* 123 */ 13x"0988", --     (--) arg X, GET_0
	/* 124 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 125 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 126 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 127 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	                     -- # ======================================
	                     -- # JMP
	/* 128 */ 13x"1fff", -- jmp_d:
	/* 129 */ 13x"0966", --     arg PC, GET_0
	/* 130 */ 13x"1fff", -- jmp_i:
	/* 131 */ 13x"0988", --     arg X, GET_0
	/* 132 */ 13x"0488", --     mem X, X, LOAD
	/* 133 */ 13x"0168", --     mov PC, X
	/* 134 */ 13x"1fff", -- jmp_cond_i:
	/* 135 */ 13x"0988", --     (-) arg X, GET_0
	/* 136 */ 13x"0488", --     (i) mem X, X, LOAD
	/* 137 */ 13x"1768", --     (-) cmv PC, X, COND_COPY
	/* 138 */ 13x"1fff", -- jmp_cond_d:
	/* 139 */ 13x"0988", --     (-) arg X, GET_0
	/* 140 */ 13x"1768", --     (-) cmv PC, X, COND_COPY
	/* 141 */ 13x"1fff", -- jmp_3dd:
	/* 142 */ 13x"0988", --     (--) arg X, GET_0
	/* 143 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 144 */ 13x"0baa", --     (--) arg Z, GET_2
	/* 145 */ 13x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 146 */ 13x"176a", --     (--) cmv PC, Z, COND_COPY
	/* 147 */ 13x"1fff", -- jmp_3di:
	/* 148 */ 13x"0988", --     (--) arg X, GET_0
	/* 149 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 150 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 151 */ 13x"0baa", --     (--) arg Z, GET_2
	/* 152 */ 13x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 153 */ 13x"176a", --     (--) cmv PC, Z, COND_COPY
	/* 154 */ 13x"1fff", -- jmp_3id:
	/* 155 */ 13x"0988", --     (--) arg X, GET_0
	/* 156 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 157 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 158 */ 13x"0baa", --     (--) arg Z, GET_2
	/* 159 */ 13x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 160 */ 13x"176a", --     (--) cmv PC, Z, COND_COPY
	/* 161 */ 13x"1fff", -- jmp_3ii:
	/* 162 */ 13x"0988", --     (--) arg X, GET_0
	/* 163 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 164 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 165 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 166 */ 13x"0baa", --     (--) arg Z, GET_2
	/* 167 */ 13x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 168 */ 13x"176a", --     (--) cmv PC, Z, COND_COPY
	                     -- # ======================================
	                     -- # MOV
	/* 169 */ 13x"1fff", -- mov_dd:
	/* 170 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 171 */ 13x"0899", --     (d-) arg Y, PUT
	/* 172 */ 13x"1fff", -- mov_di:
	/* 173 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 174 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 175 */ 13x"0899", --     (d-) arg Y, PUT
	/* 176 */ 13x"1fff", -- mov_id:
	/* 177 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 178 */ 13x"0988", --     (i-) arg X, GET_0
	/* 179 */ 13x"0589", --     (i-) mem X, Y, STORE
	/* 180 */ 13x"1fff", -- mov_ii:
	/* 181 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 182 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 183 */ 13x"0988", --     (i-) arg X, GET_0
	/* 184 */ 13x"0589", --     (i-) mem X, Y, STORE
	                     -- # ======================================
	                     -- # Others
	/* 185 */ 13x"1fff", -- halt:
	/* 186 */ 13x"0166", --     mov PC, PC
	/* 187 */ 13x"1fff", -- getf:
	/* 188 */ 13x"0877", --     arg FL, PUT
	/* 189 */ 13x"1fff", -- setf:
	/* 190 */ 13x"0977", --     arg FL, GET_0
	/* 191 */ 13x"0284", --     con X, 0x3F # 6 bits
	/* 192 */ 13x"0e78", --     alu FL, X, AND
	/* 193 */ 13x"1fff", -- call_d:
	/* 194 */ 13x"0988", --     (-) arg X, GET_0
	/* 195 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 196 */ 13x"055d", --     (-) mem SP, NPC, STORE
	/* 197 */ 13x"0168", --     (-) mov PC, X
	/* 198 */ 13x"1fff", -- call_i:
	/* 199 */ 13x"0988", --     (-) arg X, GET_0
	/* 200 */ 13x"0488", --     (i) mem X, X, LOAD
	/* 201 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 202 */ 13x"055d", --     (-) mem SP, NPC, STORE
	/* 203 */ 13x"0168", --     (-) mov PC, X
	/* 204 */ 13x"1fff", -- ret:
	/* 205 */ 13x"0485", --     mem X, SP, LOAD
	/* 206 */ 13x"0c5c", --     alu SP, 2, ADD
	/* 207 */ 13x"0168", --     mov PC, X
	/* 208 */ 13x"1fff", -- push_d:
	/* 209 */ 13x"0988", --     (-) arg X, GET_0
	/* 210 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 211 */ 13x"0558", --     (-) mem SP, X, STORE
	/* 212 */ 13x"1fff", -- push_i:
	/* 213 */ 13x"0988", --     (-) arg X, GET_0
	/* 214 */ 13x"0488", --     (i) mem X, X, LOAD
	/* 215 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 216 */ 13x"0558", --     (-) mem SP, X, STORE
	/* 217 */ 13x"1fff", -- pop_d:
	/* 218 */ 13x"0495", --     (-) mem Y, SP, LOAD
	/* 219 */ 13x"0c5c", --     (-) alu SP, 2, ADD
	/* 220 */ 13x"0899", --     (d) arg Y, PUT
	/* 221 */ 13x"1fff", -- pop_i:
	/* 222 */ 13x"0495", --     (-) mem Y, SP, LOAD
	/* 223 */ 13x"0c5c", --     (-) alu SP, 2, ADD
	/* 224 */ 13x"0988", --     (i) arg X, GET_0
	/* 225 */ 13x"0589", --     (i) mem X, Y, STORE
	/* 226 */ 13x"1fff", -- mmap: # start, end, slot_idx / Y, Z, X
	/* 227 */ 13x"0999", --     arg, Y, GET_0
	/* 228 */ 13x"0aaa", --     arg, Z, GET_1
	/* 229 */ 13x"0b88", --     arg, X, GET_2
	/* 230 */ 13x"0300", --     mmu
	/* 231 */ 13x"1fff", -- umap:
	/* 232 */ 13x"0988", --     arg, X, GET_0
	/* 233 */ 13x"0291", --     con Y, 0xFFFF
	/* 234 */ 13x"01a0", --     mov Z, 0
	/* 235 */ 13x"0300", --     mmu
	/* 236 */ 13x"1fff"  -- end_of_rom:
); -- uops_rom ---------------------------------------------------



constant label_reset : integer := 2;
constant label_alu_2dd : integer := 32;
constant label_alu_2di : integer := 37;
constant label_alu_2id : integer := 43;
constant label_alu_2ii : integer := 49;
constant label_alu_3dd : integer := 56;
constant label_alu_3di : integer := 61;
constant label_alu_3id : integer := 67;
constant label_alu_3ii : integer := 73;
constant label_alu_single_1dx : integer := 80;
constant label_alu_single_1ix : integer := 84;
constant label_alu_single_2dd : integer := 89;
constant label_alu_single_2di : integer := 93;
constant label_alu_single_2id : integer := 98;
constant label_alu_single_2ii : integer := 103;
constant label_cmp_dd : integer := 109;
constant label_cmp_di : integer := 113;
constant label_cmp_id : integer := 118;
constant label_cmp_ii : integer := 123;
constant label_jmp_d : integer := 129;
constant label_jmp_i : integer := 131;
constant label_jmp_cond_i : integer := 135;
constant label_jmp_cond_d : integer := 139;
constant label_jmp_3dd : integer := 142;
constant label_jmp_3di : integer := 148;
constant label_jmp_3id : integer := 155;
constant label_jmp_3ii : integer := 162;
constant label_mov_dd : integer := 170;
constant label_mov_di : integer := 173;
constant label_mov_id : integer := 177;
constant label_mov_ii : integer := 181;
constant label_halt : integer := 186;
constant label_getf : integer := 188;
constant label_setf : integer := 190;
constant label_call_d : integer := 194;
constant label_call_i : integer := 199;
constant label_ret : integer := 205;
constant label_push_d : integer := 209;
constant label_push_i : integer := 213;
constant label_pop_d : integer := 218;
constant label_pop_i : integer := 222;
constant label_mmap : integer := 227;
constant label_umap : integer := 232;


type TArrUopsConstsROM is array (0 to 5-1) of TData;
constant uops_consts_rom : TArrUopsConstsROM := (
	x"0001", -- used 1 times
	x"FFFF", -- used 5 times
	x"00FF", -- used 1 times
	x"D000", -- used 2 times
	x"003F"  -- used 1 times
); -- uops_consts_rom -------------------------------------------

-- ##############################################################
-- ## END UOPS ROM
-- ##############################################################



