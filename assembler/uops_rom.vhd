-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUopROM is array (0 to 217-1) of std_logic_vector(1+UopLen-1 downto 0);
constant uops_rom : TArrUopROM := (
	/*   0 */ 14x"0000", --     nop # dummy instruction at index 0 & 1
	/*   1 */ 14x"0000", --     nop, !FALLTHROUGH
	/*     */            -- # ======================================
	/*     */            -- # pre-boot code
	/*     */            -- reset:
	/*     */            --     # --------------------
	/*     */            --     # reset arch registers
	/*   2 */ 14x"0110", --     mov A,  0
	/*   3 */ 14x"0120", --     mov B,  0
	/*   4 */ 14x"0130", --     mov C,  0
	/*   5 */ 14x"0140", --     mov D,  0
	/*   6 */ 14x"0150", --     mov SP, 0
	/*   7 */ 14x"0160", --     mov PC, 0
	/*   8 */ 14x"0170", --     mov FL, 0
	/*     */            --     # --------------------
	/*     */            --     # reset MMU
	/*     */            --     # slots 0-2 are empty, slot 3 is ROM
	/*     */            --     # mmu: phy=A:B, idx=X, start=Y, end=Z
	/*   9 */ 14x"0180", --     mov X, 0
	/*  10 */ 14x"0290", --     con Y, 0xFFFF
	/*  11 */ 14x"01a0", --     mov Z, 0
	/*  12 */ 14x"0300", --     mmu # idx=0
	/*  13 */ 14x"02b1", --     con K, 1
	/*  14 */ 14x"0c8b", --     alu X, K, ADD
	/*  15 */ 14x"0300", --     mmu # idx=1
	/*  16 */ 14x"0c8b", --     alu X, K, ADD
	/*  17 */ 14x"0300", --     mmu # idx=2
	/*  18 */ 14x"0212", --     con A, 0xFF # and B = 0
	/*  19 */ 14x"0293", --     con Y, $CodeRomStartAddr
	/*  20 */ 14x"02a4", --     con Z, $CodeRomEndAddr
	/*  21 */ 14x"0c8b", --     alu X, K, ADD
	/*  22 */ 14x"0300", --     mmu # idx=3 - ROM
	/*  23 */ 14x"0110", --     mov A, 0
	/*     */            --     # --------------------
	/*     */            --     # reset Fetcher
	/*  24 */ 14x"0160", --     mov PC, 0
	/*  25 */ 14x"2263", --     con PC, $CodeRomStartAddr
	/*     */            -- # ======================================
	/*     */            -- # ALU
	/*     */            -- alu_2dd:
	/*  26 */ 14x"0988", --     (2d-) arg X, GET_0
	/*  27 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  28 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  29 */ 14x"2888", --     (2d-) arg X, PUT
	/*     */            -- alu_2di:
	/*  30 */ 14x"0988", --     (2d-) arg X, GET_0
	/*  31 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  32 */ 14x"0499", --     (--i) mem Y, Y, LOAD
	/*  33 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  34 */ 14x"2888", --     (2d-) arg X, PUT
	/*     */            -- alu_2id:
	/*  35 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  36 */ 14x"048b", --     (2i-) mem X, K, LOAD
	/*  37 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  38 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  39 */ 14x"25b8", --     (2i-) mem K, X, STORE
	/*     */            -- alu_2ii:
	/*  40 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  41 */ 14x"048b", --     (2i-) mem X, K, LOAD
	/*  42 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  43 */ 14x"0499", --     (--i) mem Y, Y, LOAD
	/*  44 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  45 */ 14x"25b8", --     (2i-) mem K, X, STORE
	/*     */            -- alu_3dd:
	/*  46 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  47 */ 14x"0baa", --     (3--) arg Z, GET_2
	/*  48 */ 14x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/*  49 */ 14x"2899", --     (3d-) arg Y, PUT
	/*     */            -- alu_3di:
	/*  50 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  51 */ 14x"0499", --     (--i) mem Y, Y, LOAD
	/*  52 */ 14x"0baa", --     (3--) arg Z, GET_2
	/*  53 */ 14x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/*  54 */ 14x"2899", --     (3d-) arg Y, PUT
	/*     */            -- alu_3id:
	/*  55 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  56 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  57 */ 14x"0baa", --     (3--) arg Z, GET_2
	/*  58 */ 14x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/*  59 */ 14x"25b9", --     (3i-) mem K, Y, STORE
	/*     */            -- alu_3ii:
	/*  60 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  61 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  62 */ 14x"0499", --     (--i) mem Y, Y, LOAD
	/*  63 */ 14x"0baa", --     (3--) arg Z, GET_2
	/*  64 */ 14x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/*  65 */ 14x"25b9", --     (3i-) mem K, Y, STORE
	/*     */            -- alu_single_1dx:
	/*  66 */ 14x"0988", --     (1d-) arg X, GET_0
	/*  67 */ 14x"0f88", --     (1--) alu X, X, OP_COPY
	/*  68 */ 14x"2888", --     (-d-) arg X, PUT
	/*     */            -- alu_single_1ix:
	/*  69 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  70 */ 14x"048b", --     (1i-) mem X, K, LOAD
	/*  71 */ 14x"0f88", --     (1--) alu X, X, OP_COPY
	/*  72 */ 14x"25b8", --     (-i-) mem K, X, STORE
	/*     */            -- alu_single_2dd:
	/*  73 */ 14x"0a99", --     (2--) arg Y, GET_1
	/*  74 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  75 */ 14x"2888", --     (-d-) arg X, PUT
	/*     */            -- alu_single_2di:
	/*  76 */ 14x"0a99", --     (2--) arg Y, GET_1
	/*  77 */ 14x"0499", --     (2-i) mem Y, Y, LOAD
	/*  78 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  79 */ 14x"2888", --     (-d-) arg X, PUT
	/*     */            -- alu_single_2id:
	/*  80 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  81 */ 14x"0a99", --     (2--) arg Y, GET_1
	/*  82 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  83 */ 14x"25b8", --     (-i-) mem K, X, STORE
	/*     */            -- alu_single_2ii:
	/*  84 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  85 */ 14x"0a99", --     (2--) arg Y, GET_1
	/*  86 */ 14x"0499", --     (2-i) mem Y, Y, LOAD
	/*  87 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  88 */ 14x"25b8", --     (-i-) mem K, X, STORE
	/*     */            -- # ======================================
	/*     */            -- # CMP
	/*     */            -- cmp_dd:
	/*  89 */ 14x"0988", --     (--) arg X, GET_0
	/*  90 */ 14x"0a99", --     (--) arg Y, GET_1
	/*  91 */ 14x"3289", --     (--) cmp X, Y, OP_COPY
	/*     */            -- cmp_di:
	/*  92 */ 14x"0988", --     (--) arg X, GET_0
	/*  93 */ 14x"0a99", --     (--) arg Y, GET_1
	/*  94 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/*  95 */ 14x"3289", --     (--) cmp X, Y, OP_COPY
	/*     */            -- cmp_id:
	/*  96 */ 14x"0988", --     (--) arg X, GET_0
	/*  97 */ 14x"0488", --     (i-) mem X, X, LOAD
	/*  98 */ 14x"0a99", --     (--) arg Y, GET_1
	/*  99 */ 14x"3289", --     (--) cmp X, Y, OP_COPY
	/*     */            -- cmp_ii:
	/* 100 */ 14x"0988", --     (--) arg X, GET_0
	/* 101 */ 14x"0488", --     (i-) mem X, X, LOAD
	/* 102 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 103 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 104 */ 14x"3289", --     (--) cmp X, Y, OP_COPY
	/*     */            -- # ======================================
	/*     */            -- # JMP
	/*     */            -- jmp_d:
	/* 105 */ 14x"2966", --     arg PC, GET_0
	/*     */            -- jmp_i:
	/* 106 */ 14x"0988", --     arg X, GET_0
	/* 107 */ 14x"0488", --     mem X, X, LOAD
	/* 108 */ 14x"2168", --     mov PC, X
	/*     */            -- jmp_cond_i:
	/* 109 */ 14x"0988", --     (-) arg X, GET_0
	/* 110 */ 14x"0488", --     (i) mem X, X, LOAD
	/* 111 */ 14x"3768", --     (-) cmv PC, X, COND_COPY
	/*     */            -- jmp_cond_d:
	/* 112 */ 14x"0988", --     (-) arg X, GET_0
	/* 113 */ 14x"3768", --     (-) cmv PC, X, COND_COPY
	/*     */            -- jmp_3dd:
	/* 114 */ 14x"0988", --     (--) arg X, GET_0
	/* 115 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 116 */ 14x"0baa", --     (--) arg Z, GET_2
	/* 117 */ 14x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 118 */ 14x"376a", --     (--) cmv PC, Z, COND_COPY
	/*     */            -- jmp_3di:
	/* 119 */ 14x"0988", --     (--) arg X, GET_0
	/* 120 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 121 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 122 */ 14x"0baa", --     (--) arg Z, GET_2
	/* 123 */ 14x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 124 */ 14x"376a", --     (--) cmv PC, Z, COND_COPY
	/*     */            -- jmp_3id:
	/* 125 */ 14x"0988", --     (--) arg X, GET_0
	/* 126 */ 14x"0488", --     (i-) mem X, X, LOAD
	/* 127 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 128 */ 14x"0baa", --     (--) arg Z, GET_2
	/* 129 */ 14x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 130 */ 14x"376a", --     (--) cmv PC, Z, COND_COPY
	/*     */            -- jmp_3ii:
	/* 131 */ 14x"0988", --     (--) arg X, GET_0
	/* 132 */ 14x"0488", --     (i-) mem X, X, LOAD
	/* 133 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 134 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 135 */ 14x"0baa", --     (--) arg Z, GET_2
	/* 136 */ 14x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 137 */ 14x"376a", --     (--) cmv PC, Z, COND_COPY
	/*     */            -- # ======================================
	/*     */            -- # MOV
	/*     */            -- mov_dd:
	/* 138 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 139 */ 14x"2899", --     (d-) arg Y, PUT
	/*     */            -- mov_di:
	/* 140 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 141 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 142 */ 14x"2899", --     (d-) arg Y, PUT
	/*     */            -- mov_id:
	/* 143 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 144 */ 14x"0988", --     (i-) arg X, GET_0
	/* 145 */ 14x"2589", --     (i-) mem X, Y, STORE
	/*     */            -- mov_ii:
	/* 146 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 147 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 148 */ 14x"0988", --     (i-) arg X, GET_0
	/* 149 */ 14x"2589", --     (i-) mem X, Y, STORE
	/*     */            -- bmov_dd:
	/* 150 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 151 */ 14x"02a2", --     (--) con Z, 0x00FF
	/* 152 */ 14x"0e9a", --     (--) alu Y, Z, AND
	/* 153 */ 14x"2899", --     (d-) arg Y, PUT
	/*     */            -- bmov_di:
	/* 154 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 155 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 156 */ 14x"02a2", --     (--) con Z, 0x00FF
	/* 157 */ 14x"0e9a", --     (--) alu Y, Z, AND
	/* 158 */ 14x"2899", --     (d-) arg Y, PUT
	/*     */            -- bmov_id:
	/* 159 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 160 */ 14x"02a2", --     (--) con Z, 0x00FF
	/* 161 */ 14x"0e9a", --     (--) alu Y, Z, AND
	/* 162 */ 14x"09bb", --     (i-) arg K, GET_0
	/* 163 */ 14x"048b", --     (i-) mem X, K, LOAD
	/* 164 */ 14x"02a5", --     (i-) con Z, 0xFF00
	/* 165 */ 14x"0e8a", --     (i-) alu X, Z, AND
	/* 166 */ 14x"0c89", --     (i-) alu X, Y, ADD
	/* 167 */ 14x"25b8", --     (i-) mem K, X, STORE
	/*     */            -- bmov_ii:
	/* 168 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 169 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 170 */ 14x"02a2", --     (--) con Z, 0x00FF
	/* 171 */ 14x"0e9a", --     (--) alu Y, Z, AND
	/* 172 */ 14x"09bb", --     (i-) arg K, GET_0
	/* 173 */ 14x"048b", --     (i-) mem X, K, LOAD
	/* 174 */ 14x"02a5", --     (i-) con Z, 0xFF00
	/* 175 */ 14x"0e8a", --     (i-) alu X, Z, AND
	/* 176 */ 14x"0c89", --     (i-) alu X, Y, ADD
	/* 177 */ 14x"25b8", --     (i-) mem K, X, STORE
	/*     */            -- # ======================================
	/*     */            -- # Others
	/*     */            -- halt:
	/* 178 */ 14x"2166", --     mov PC, PC
	/*     */            -- getf:
	/* 179 */ 14x"2877", --     arg FL, PUT
	/*     */            -- setf:
	/* 180 */ 14x"0977", --     arg FL, GET_0
	/* 181 */ 14x"0286", --     con X, 0x3F # 6 bits
	/* 182 */ 14x"2e78", --     alu FL, X, AND
	/*     */            -- call_d:
	/* 183 */ 14x"0988", --     (-) arg X, GET_0
	/* 184 */ 14x"0d5c", --     (-) alu SP, 2, SUB
	/* 185 */ 14x"055d", --     (-) mem SP, NPC, STORE
	/* 186 */ 14x"2168", --     (-) mov PC, X
	/*     */            -- call_i:
	/* 187 */ 14x"0988", --     (-) arg X, GET_0
	/* 188 */ 14x"0488", --     (i) mem X, X, LOAD
	/* 189 */ 14x"0d5c", --     (-) alu SP, 2, SUB
	/* 190 */ 14x"055d", --     (-) mem SP, NPC, STORE
	/* 191 */ 14x"2168", --     (-) mov PC, X
	/*     */            -- ret:
	/* 192 */ 14x"0485", --     mem X, SP, LOAD
	/* 193 */ 14x"0c5c", --     alu SP, 2, ADD
	/* 194 */ 14x"2168", --     mov PC, X
	/*     */            -- push_d:
	/* 195 */ 14x"0988", --     (-) arg X, GET_0
	/* 196 */ 14x"0d5c", --     (-) alu SP, 2, SUB
	/* 197 */ 14x"2558", --     (-) mem SP, X, STORE
	/*     */            -- push_i:
	/* 198 */ 14x"0988", --     (-) arg X, GET_0
	/* 199 */ 14x"0488", --     (i) mem X, X, LOAD
	/* 200 */ 14x"0d5c", --     (-) alu SP, 2, SUB
	/* 201 */ 14x"2558", --     (-) mem SP, X, STORE
	/*     */            -- pop_d:
	/* 202 */ 14x"0495", --     (-) mem Y, SP, LOAD
	/* 203 */ 14x"0c5c", --     (-) alu SP, 2, ADD
	/* 204 */ 14x"2899", --     (d) arg Y, PUT
	/*     */            -- pop_i:
	/* 205 */ 14x"0495", --     (-) mem Y, SP, LOAD
	/* 206 */ 14x"0c5c", --     (-) alu SP, 2, ADD
	/* 207 */ 14x"0988", --     (i) arg X, GET_0
	/* 208 */ 14x"2589", --     (i) mem X, Y, STORE
	/*     */            -- mmap: # start, end, slot_idx / Y, Z, X
	/* 209 */ 14x"0999", --     arg, Y, GET_0
	/* 210 */ 14x"0aaa", --     arg, Z, GET_1
	/* 211 */ 14x"0b88", --     arg, X, GET_2
	/* 212 */ 14x"2300", --     mmu
	/*     */            -- umap:
	/* 213 */ 14x"0988", --     arg, X, GET_0
	/* 214 */ 14x"0290", --     con Y, 0xFFFF
	/* 215 */ 14x"01a0", --     mov Z, 0
	/* 216 */ 14x"2300"  --     mmu
	/*     */            -- end_of_uop_rom:
); -- uops_rom ---------------------------------------------------



constant label_reset : integer := 2;
constant label_alu_2dd : integer := 26;
constant label_alu_2di : integer := 30;
constant label_alu_2id : integer := 35;
constant label_alu_2ii : integer := 40;
constant label_alu_3dd : integer := 46;
constant label_alu_3di : integer := 50;
constant label_alu_3id : integer := 55;
constant label_alu_3ii : integer := 60;
constant label_alu_single_1dx : integer := 66;
constant label_alu_single_1ix : integer := 69;
constant label_alu_single_2dd : integer := 73;
constant label_alu_single_2di : integer := 76;
constant label_alu_single_2id : integer := 80;
constant label_alu_single_2ii : integer := 84;
constant label_cmp_dd : integer := 89;
constant label_cmp_di : integer := 92;
constant label_cmp_id : integer := 96;
constant label_cmp_ii : integer := 100;
constant label_jmp_d : integer := 105;
constant label_jmp_i : integer := 106;
constant label_jmp_cond_i : integer := 109;
constant label_jmp_cond_d : integer := 112;
constant label_jmp_3dd : integer := 114;
constant label_jmp_3di : integer := 119;
constant label_jmp_3id : integer := 125;
constant label_jmp_3ii : integer := 131;
constant label_mov_dd : integer := 138;
constant label_mov_di : integer := 140;
constant label_mov_id : integer := 143;
constant label_mov_ii : integer := 146;
constant label_bmov_dd : integer := 150;
constant label_bmov_di : integer := 154;
constant label_bmov_id : integer := 159;
constant label_bmov_ii : integer := 168;
constant label_halt : integer := 178;
constant label_getf : integer := 179;
constant label_setf : integer := 180;
constant label_call_d : integer := 183;
constant label_call_i : integer := 187;
constant label_ret : integer := 192;
constant label_push_d : integer := 195;
constant label_push_i : integer := 198;
constant label_pop_d : integer := 202;
constant label_pop_i : integer := 205;
constant label_mmap : integer := 209;
constant label_umap : integer := 213;
constant label_end_of_uop_rom : integer := 217;


type TArrUopsConstsROM is array (0 to 7-1) of TData;
constant uops_consts_rom : TArrUopsConstsROM := (
	x"FFFF", -- used 2 times
	x"0001", -- used 1 times
	x"00FF", -- used 5 times
	CodeRomStartAddr, -- used 2 times
	CodeRomEndAddr, -- used 1 times
	x"FF00", -- used 2 times
	x"003F"  -- used 1 times
); -- uops_consts_rom -------------------------------------------

-- ##############################################################
-- ## END UOPS ROM
-- ##############################################################



