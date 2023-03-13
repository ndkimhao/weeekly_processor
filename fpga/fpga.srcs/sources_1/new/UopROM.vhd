library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;


package UopROM is


-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUopROM is array (0 to 227-1) of std_logic_vector(1+UopLen-1 downto 0);
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
	/*  24 */ 14x"0290", --     con Y, 0xFFFF
	/*  25 */ 14x"01a0", --     mov Z, 0
	/*  26 */ 14x"0c8b", --     alu X, K, ADD
	/*  27 */ 14x"0300", --     mmu # idx=4
	/*  28 */ 14x"0c8b", --     alu X, K, ADD
	/*  29 */ 14x"0300", --     mmu # idx=5
	/*  30 */ 14x"0c8b", --     alu X, K, ADD
	/*  31 */ 14x"0300", --     mmu # idx=6
	/*  32 */ 14x"0c8b", --     alu X, K, ADD
	/*  33 */ 14x"0300", --     mmu # idx=7
	/*     */            --     # --------------------
	/*     */            --     # reset Fetcher
	/*  34 */ 14x"0160", --     mov PC, 0
	/*  35 */ 14x"2263", --     con PC, $CodeRomStartAddr
	/*     */            -- # ======================================
	/*     */            -- # ALU
	/*     */            -- alu_2dd:
	/*  36 */ 14x"0988", --     (2d-) arg X, GET_0
	/*  37 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  38 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  39 */ 14x"2888", --     (2d-) arg X, PUT
	/*     */            -- alu_2di:
	/*  40 */ 14x"0988", --     (2d-) arg X, GET_0
	/*  41 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  42 */ 14x"0499", --     (--i) mem Y, Y, LOAD
	/*  43 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  44 */ 14x"2888", --     (2d-) arg X, PUT
	/*     */            -- alu_2id:
	/*  45 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  46 */ 14x"048b", --     (2i-) mem X, K, LOAD
	/*  47 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  48 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  49 */ 14x"25b8", --     (2i-) mem K, X, STORE
	/*     */            -- alu_2ii:
	/*  50 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  51 */ 14x"048b", --     (2i-) mem X, K, LOAD
	/*  52 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  53 */ 14x"0499", --     (--i) mem Y, Y, LOAD
	/*  54 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  55 */ 14x"25b8", --     (2i-) mem K, X, STORE
	/*     */            -- alu_3dd:
	/*  56 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  57 */ 14x"0baa", --     (3--) arg Z, GET_2
	/*  58 */ 14x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/*  59 */ 14x"2899", --     (3d-) arg Y, PUT
	/*     */            -- alu_3di:
	/*  60 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  61 */ 14x"0499", --     (--i) mem Y, Y, LOAD
	/*  62 */ 14x"0baa", --     (3--) arg Z, GET_2
	/*  63 */ 14x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/*  64 */ 14x"2899", --     (3d-) arg Y, PUT
	/*     */            -- alu_3id:
	/*  65 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  66 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  67 */ 14x"0baa", --     (3--) arg Z, GET_2
	/*  68 */ 14x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/*  69 */ 14x"25b9", --     (3i-) mem K, Y, STORE
	/*     */            -- alu_3ii:
	/*  70 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  71 */ 14x"0a99", --     (---) arg Y, GET_1
	/*  72 */ 14x"0499", --     (--i) mem Y, Y, LOAD
	/*  73 */ 14x"0baa", --     (3--) arg Z, GET_2
	/*  74 */ 14x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/*  75 */ 14x"25b9", --     (3i-) mem K, Y, STORE
	/*     */            -- alu_single_1dx:
	/*  76 */ 14x"0988", --     (1d-) arg X, GET_0
	/*  77 */ 14x"0f88", --     (1--) alu X, X, OP_COPY
	/*  78 */ 14x"2888", --     (-d-) arg X, PUT
	/*     */            -- alu_single_1ix:
	/*  79 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  80 */ 14x"048b", --     (1i-) mem X, K, LOAD
	/*  81 */ 14x"0f88", --     (1--) alu X, X, OP_COPY
	/*  82 */ 14x"25b8", --     (-i-) mem K, X, STORE
	/*     */            -- alu_single_2dd:
	/*  83 */ 14x"0a99", --     (2--) arg Y, GET_1
	/*  84 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  85 */ 14x"2888", --     (-d-) arg X, PUT
	/*     */            -- alu_single_2di:
	/*  86 */ 14x"0a99", --     (2--) arg Y, GET_1
	/*  87 */ 14x"0499", --     (2-i) mem Y, Y, LOAD
	/*  88 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  89 */ 14x"2888", --     (-d-) arg X, PUT
	/*     */            -- alu_single_2id:
	/*  90 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  91 */ 14x"0a99", --     (2--) arg Y, GET_1
	/*  92 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  93 */ 14x"25b8", --     (-i-) mem K, X, STORE
	/*     */            -- alu_single_2ii:
	/*  94 */ 14x"09bb", --     (-i-) arg K, GET_0
	/*  95 */ 14x"0a99", --     (2--) arg Y, GET_1
	/*  96 */ 14x"0499", --     (2-i) mem Y, Y, LOAD
	/*  97 */ 14x"0f89", --     (2--) alu X, Y, OP_COPY
	/*  98 */ 14x"25b8", --     (-i-) mem K, X, STORE
	/*     */            -- # ======================================
	/*     */            -- # CMP
	/*     */            -- cmp_dd:
	/*  99 */ 14x"0988", --     (--) arg X, GET_0
	/* 100 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 101 */ 14x"3289", --     (--) cmp X, Y, OP_COPY
	/*     */            -- cmp_di:
	/* 102 */ 14x"0988", --     (--) arg X, GET_0
	/* 103 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 104 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 105 */ 14x"3289", --     (--) cmp X, Y, OP_COPY
	/*     */            -- cmp_id:
	/* 106 */ 14x"0988", --     (--) arg X, GET_0
	/* 107 */ 14x"0488", --     (i-) mem X, X, LOAD
	/* 108 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 109 */ 14x"3289", --     (--) cmp X, Y, OP_COPY
	/*     */            -- cmp_ii:
	/* 110 */ 14x"0988", --     (--) arg X, GET_0
	/* 111 */ 14x"0488", --     (i-) mem X, X, LOAD
	/* 112 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 113 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 114 */ 14x"3289", --     (--) cmp X, Y, OP_COPY
	/*     */            -- # ======================================
	/*     */            -- # JMP
	/*     */            -- jmp_d:
	/* 115 */ 14x"2966", --     arg PC, GET_0
	/*     */            -- jmp_i:
	/* 116 */ 14x"0988", --     arg X, GET_0
	/* 117 */ 14x"0488", --     mem X, X, LOAD
	/* 118 */ 14x"2168", --     mov PC, X
	/*     */            -- jmp_cond_i:
	/* 119 */ 14x"0988", --     (-) arg X, GET_0
	/* 120 */ 14x"0488", --     (i) mem X, X, LOAD
	/* 121 */ 14x"3768", --     (-) cmv PC, X, COND_COPY
	/*     */            -- jmp_cond_d:
	/* 122 */ 14x"0988", --     (-) arg X, GET_0
	/* 123 */ 14x"3768", --     (-) cmv PC, X, COND_COPY
	/*     */            -- jmp_3dd:
	/* 124 */ 14x"0988", --     (--) arg X, GET_0
	/* 125 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 126 */ 14x"0baa", --     (--) arg Z, GET_2
	/* 127 */ 14x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 128 */ 14x"376a", --     (--) cmv PC, Z, COND_COPY
	/*     */            -- jmp_3di:
	/* 129 */ 14x"0988", --     (--) arg X, GET_0
	/* 130 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 131 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 132 */ 14x"0baa", --     (--) arg Z, GET_2
	/* 133 */ 14x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 134 */ 14x"376a", --     (--) cmv PC, Z, COND_COPY
	/*     */            -- jmp_3id:
	/* 135 */ 14x"0988", --     (--) arg X, GET_0
	/* 136 */ 14x"0488", --     (i-) mem X, X, LOAD
	/* 137 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 138 */ 14x"0baa", --     (--) arg Z, GET_2
	/* 139 */ 14x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 140 */ 14x"376a", --     (--) cmv PC, Z, COND_COPY
	/*     */            -- jmp_3ii:
	/* 141 */ 14x"0988", --     (--) arg X, GET_0
	/* 142 */ 14x"0488", --     (i-) mem X, X, LOAD
	/* 143 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 144 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 145 */ 14x"0baa", --     (--) arg Z, GET_2
	/* 146 */ 14x"1089", --     (--) cmp X, Y, UNSIGNED
	/* 147 */ 14x"376a", --     (--) cmv PC, Z, COND_COPY
	/*     */            -- # ======================================
	/*     */            -- # MOV
	/*     */            -- mov_dd:
	/* 148 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 149 */ 14x"2899", --     (d-) arg Y, PUT
	/*     */            -- mov_di:
	/* 150 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 151 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 152 */ 14x"2899", --     (d-) arg Y, PUT
	/*     */            -- mov_id:
	/* 153 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 154 */ 14x"0988", --     (i-) arg X, GET_0
	/* 155 */ 14x"2589", --     (i-) mem X, Y, STORE
	/*     */            -- mov_ii:
	/* 156 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 157 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 158 */ 14x"0988", --     (i-) arg X, GET_0
	/* 159 */ 14x"2589", --     (i-) mem X, Y, STORE
	/*     */            -- bmov_dd:
	/* 160 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 161 */ 14x"02a2", --     (--) con Z, 0x00FF
	/* 162 */ 14x"0e9a", --     (--) alu Y, Z, AND
	/* 163 */ 14x"2899", --     (d-) arg Y, PUT
	/*     */            -- bmov_di:
	/* 164 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 165 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 166 */ 14x"02a2", --     (--) con Z, 0x00FF
	/* 167 */ 14x"0e9a", --     (--) alu Y, Z, AND
	/* 168 */ 14x"2899", --     (d-) arg Y, PUT
	/*     */            -- bmov_id:
	/* 169 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 170 */ 14x"02a2", --     (--) con Z, 0x00FF
	/* 171 */ 14x"0e9a", --     (--) alu Y, Z, AND
	/* 172 */ 14x"09bb", --     (i-) arg K, GET_0
	/* 173 */ 14x"048b", --     (i-) mem X, K, LOAD
	/* 174 */ 14x"02a5", --     (i-) con Z, 0xFF00
	/* 175 */ 14x"0e8a", --     (i-) alu X, Z, AND
	/* 176 */ 14x"0c89", --     (i-) alu X, Y, ADD
	/* 177 */ 14x"25b8", --     (i-) mem K, X, STORE
	/*     */            -- bmov_ii:
	/* 178 */ 14x"0a99", --     (--) arg Y, GET_1
	/* 179 */ 14x"0499", --     (-i) mem Y, Y, LOAD
	/* 180 */ 14x"02a2", --     (--) con Z, 0x00FF
	/* 181 */ 14x"0e9a", --     (--) alu Y, Z, AND
	/* 182 */ 14x"09bb", --     (i-) arg K, GET_0
	/* 183 */ 14x"048b", --     (i-) mem X, K, LOAD
	/* 184 */ 14x"02a5", --     (i-) con Z, 0xFF00
	/* 185 */ 14x"0e8a", --     (i-) alu X, Z, AND
	/* 186 */ 14x"0c89", --     (i-) alu X, Y, ADD
	/* 187 */ 14x"25b8", --     (i-) mem K, X, STORE
	/*     */            -- # ======================================
	/*     */            -- # Others
	/*     */            -- halt:
	/* 188 */ 14x"2166", --     mov PC, PC
	/*     */            -- getf:
	/* 189 */ 14x"2877", --     arg FL, PUT
	/*     */            -- setf:
	/* 190 */ 14x"0977", --     arg FL, GET_0
	/* 191 */ 14x"0286", --     con X, 0x3F # 6 bits
	/* 192 */ 14x"2e78", --     alu FL, X, AND
	/*     */            -- call_d:
	/* 193 */ 14x"0988", --     (-) arg X, GET_0
	/* 194 */ 14x"0d5c", --     (-) alu SP, 2, SUB
	/* 195 */ 14x"055d", --     (-) mem SP, NPC, STORE
	/* 196 */ 14x"2168", --     (-) mov PC, X
	/*     */            -- call_i:
	/* 197 */ 14x"0988", --     (-) arg X, GET_0
	/* 198 */ 14x"0488", --     (i) mem X, X, LOAD
	/* 199 */ 14x"0d5c", --     (-) alu SP, 2, SUB
	/* 200 */ 14x"055d", --     (-) mem SP, NPC, STORE
	/* 201 */ 14x"2168", --     (-) mov PC, X
	/*     */            -- ret:
	/* 202 */ 14x"0485", --     mem X, SP, LOAD
	/* 203 */ 14x"0c5c", --     alu SP, 2, ADD
	/* 204 */ 14x"2168", --     mov PC, X
	/*     */            -- push_d:
	/* 205 */ 14x"0988", --     (-) arg X, GET_0
	/* 206 */ 14x"0d5c", --     (-) alu SP, 2, SUB
	/* 207 */ 14x"2558", --     (-) mem SP, X, STORE
	/*     */            -- push_i:
	/* 208 */ 14x"0988", --     (-) arg X, GET_0
	/* 209 */ 14x"0488", --     (i) mem X, X, LOAD
	/* 210 */ 14x"0d5c", --     (-) alu SP, 2, SUB
	/* 211 */ 14x"2558", --     (-) mem SP, X, STORE
	/*     */            -- pop_d:
	/* 212 */ 14x"0495", --     (-) mem Y, SP, LOAD
	/* 213 */ 14x"0c5c", --     (-) alu SP, 2, ADD
	/* 214 */ 14x"2899", --     (d) arg Y, PUT
	/*     */            -- pop_i:
	/* 215 */ 14x"0495", --     (-) mem Y, SP, LOAD
	/* 216 */ 14x"0c5c", --     (-) alu SP, 2, ADD
	/* 217 */ 14x"0988", --     (i) arg X, GET_0
	/* 218 */ 14x"2589", --     (i) mem X, Y, STORE
	/*     */            -- mmap: # start, end, slot_idx / Y, Z, X
	/* 219 */ 14x"0999", --     arg, Y, GET_0
	/* 220 */ 14x"0aaa", --     arg, Z, GET_1
	/* 221 */ 14x"0b88", --     arg, X, GET_2
	/* 222 */ 14x"2300", --     mmu
	/*     */            -- umap:
	/* 223 */ 14x"0988", --     arg, X, GET_0
	/* 224 */ 14x"0290", --     con Y, 0xFFFF
	/* 225 */ 14x"01a0", --     mov Z, 0
	/* 226 */ 14x"2300"  --     mmu
	/*     */            -- end_of_uop_rom:
); -- uops_rom ---------------------------------------------------



constant label_reset : integer := 2;
constant label_alu_2dd : integer := 36;
constant label_alu_2di : integer := 40;
constant label_alu_2id : integer := 45;
constant label_alu_2ii : integer := 50;
constant label_alu_3dd : integer := 56;
constant label_alu_3di : integer := 60;
constant label_alu_3id : integer := 65;
constant label_alu_3ii : integer := 70;
constant label_alu_single_1dx : integer := 76;
constant label_alu_single_1ix : integer := 79;
constant label_alu_single_2dd : integer := 83;
constant label_alu_single_2di : integer := 86;
constant label_alu_single_2id : integer := 90;
constant label_alu_single_2ii : integer := 94;
constant label_cmp_dd : integer := 99;
constant label_cmp_di : integer := 102;
constant label_cmp_id : integer := 106;
constant label_cmp_ii : integer := 110;
constant label_jmp_d : integer := 115;
constant label_jmp_i : integer := 116;
constant label_jmp_cond_i : integer := 119;
constant label_jmp_cond_d : integer := 122;
constant label_jmp_3dd : integer := 124;
constant label_jmp_3di : integer := 129;
constant label_jmp_3id : integer := 135;
constant label_jmp_3ii : integer := 141;
constant label_mov_dd : integer := 148;
constant label_mov_di : integer := 150;
constant label_mov_id : integer := 153;
constant label_mov_ii : integer := 156;
constant label_bmov_dd : integer := 160;
constant label_bmov_di : integer := 164;
constant label_bmov_id : integer := 169;
constant label_bmov_ii : integer := 178;
constant label_halt : integer := 188;
constant label_getf : integer := 189;
constant label_setf : integer := 190;
constant label_call_d : integer := 193;
constant label_call_i : integer := 197;
constant label_ret : integer := 202;
constant label_push_d : integer := 205;
constant label_push_i : integer := 208;
constant label_pop_d : integer := 212;
constant label_pop_i : integer := 215;
constant label_mmap : integer := 219;
constant label_umap : integer := 223;
constant label_end_of_uop_rom : integer := 227;


type TArrUopsConstsROM is array (0 to 7-1) of TData;
constant uops_consts_rom : TArrUopsConstsROM := (
	x"FFFF", -- used 3 times
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




-----------------------------------------------------------------
-- Label Map
-----------------------------------------------------------------

attribute ram_style of uops_rom : constant is "distributed";


constant InstIdxW : Integer := InstructionIndexWidth;
constant NArgsW : Integer := 2; -- max 3 arguments
constant UopIdxW : integer := UopIndexWidth;
constant OpW : Integer := 6;
subtype TIndex is unsigned(UopIdxW-1 downto 0);


type ArrLabel2 is array(0 to 2-1) of TIndex;
type ArrLabel4 is array(0 to 4-1) of TIndex;
type ArrLabel8 is array(0 to 8-1) of TIndex;
type ArrLabel16 is array(0 to 16-1) of TIndex;


constant labels_mov : ArrLabel4 := (
	to_unsigned(label_mov_dd, UopIdxW),
	to_unsigned(label_mov_di, UopIdxW),
	to_unsigned(label_mov_id, UopIdxW),
	to_unsigned(label_mov_ii, UopIdxW)
);
constant labels_bmov : ArrLabel4 := (
	to_unsigned(label_bmov_dd, UopIdxW),
	to_unsigned(label_bmov_di, UopIdxW),
	to_unsigned(label_bmov_id, UopIdxW),
	to_unsigned(label_bmov_ii, UopIdxW)
);
constant labels_alu_single1 : ArrLabel2 := (
	to_unsigned(label_alu_single_1dx, UopIdxW),
	to_unsigned(label_alu_single_1ix, UopIdxW)
);
constant labels_alu_single2 : ArrLabel4 := (
	to_unsigned(label_alu_single_2dd, UopIdxW),
	to_unsigned(label_alu_single_2di, UopIdxW),
	to_unsigned(label_alu_single_2id, UopIdxW),
	to_unsigned(label_alu_single_2ii, UopIdxW)
);
constant labels_alu23 : ArrLabel8 := (
	to_unsigned(label_alu_2dd, UopIdxW),
	to_unsigned(label_alu_2di, UopIdxW),
	to_unsigned(label_alu_2id, UopIdxW),
	to_unsigned(label_alu_2ii, UopIdxW),
	to_unsigned(label_alu_3dd, UopIdxW),
	to_unsigned(label_alu_3di, UopIdxW),
	to_unsigned(label_alu_3id, UopIdxW),
	to_unsigned(label_alu_3ii, UopIdxW)
);
constant labels_cmp : ArrLabel4 := (
	to_unsigned(label_cmp_dd, UopIdxW),
	to_unsigned(label_cmp_di, UopIdxW),
	to_unsigned(label_cmp_id, UopIdxW),
	to_unsigned(label_cmp_ii, UopIdxW)
);
constant labels_push : ArrLabel2 := (
	to_unsigned(label_push_d, UopIdxW),
	to_unsigned(label_push_i, UopIdxW)
);
constant labels_pop : ArrLabel2 := (
	to_unsigned(label_pop_d, UopIdxW),
	to_unsigned(label_pop_i, UopIdxW)
);
constant labels_jmp : ArrLabel2 := (
	to_unsigned(label_jmp_d, UopIdxW),
	to_unsigned(label_jmp_i, UopIdxW)
);
constant labels_jmp_cond : ArrLabel2 := (
	to_unsigned(label_jmp_cond_d, UopIdxW),
	to_unsigned(label_jmp_cond_i, UopIdxW)
);
constant labels_jmp_3 : ArrLabel4 := (
	to_unsigned(label_jmp_3dd, UopIdxW),
	to_unsigned(label_jmp_3di, UopIdxW),
	to_unsigned(label_jmp_3id, UopIdxW),
	to_unsigned(label_jmp_3ii, UopIdxW)
);
constant labels_call : ArrLabel2 := (
	to_unsigned(label_call_d, UopIdxW),
	to_unsigned(label_call_i, UopIdxW)
);


-----------------------------------------------------------------
-- End Label Map
-----------------------------------------------------------------
end package;