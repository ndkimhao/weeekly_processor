library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Decoder is
	port (
		clk : in std_logic;
		reset : in std_logic;

		hold : in std_logic; -- pause decoding
		pc : in TAddr;

		avail : in TInstBufferIdx;
		inst_in  : in TInstBuffer;
		inst_pc : in TAddr;
		inst_nargs : out unsigned(2-1 downto 0);

		ready : out std_logic; -- uop is ready
		brk   : out std_logic; -- last uop of the block
		uop   : out TUop;
		uop_idx : out TUopIndex;
		used_len : out TInstBufferIdx;

		booted : out std_logic := '0' -- reset vector has been run
	);
end Decoder;

architecture Behavioral of Decoder is

-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUtopROM is array (0 to 233-1) of TUop;
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
	/* 019 */ 13x"0293", --     con Y, 0x8000
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
	/* 030 */ 13x"0263", --     con PC, 0x8000
	                     -- # ======================================
	                     -- # ALU
	/* 031 */ 13x"1fff", -- alu_1dx:
	/* 032 */ 13x"0988", --     ([12]d-) arg X, GET_0
	/* 033 */ 13x"0f80", --     (1--) alu X, 0, OP_COPY
	/* 034 */ 13x"0888", --     (1d-) arg X, PUT
	/* 035 */ 13x"1fff", -- alu_1ix:
	/* 036 */ 13x"09bb", --     ([12]i-) arg K, GET_0
	/* 037 */ 13x"048b", --     ([12]i-) mem X, K, LOAD
	/* 038 */ 13x"0f80", --     (1--) alu X, 0, OP_COPY
	/* 039 */ 13x"05b8", --     (1i-) mem K, X, STORE
	/* 040 */ 13x"1fff", -- alu_2dd:
	/* 041 */ 13x"0988", --     ([12]d-) arg X, GET_0
	/* 042 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 043 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 044 */ 13x"0888", --     (2d-) arg X, PUT
	/* 045 */ 13x"1fff", -- alu_2di:
	/* 046 */ 13x"0988", --     ([12]d-) arg X, GET_0
	/* 047 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 048 */ 13x"0499", --     ([23]-i) mem Y, Y, LOAD
	/* 049 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 050 */ 13x"0888", --     (2d-) arg X, PUT
	/* 051 */ 13x"1fff", -- alu_2id:
	/* 052 */ 13x"09bb", --     ([12]i-) arg K, GET_0
	/* 053 */ 13x"048b", --     ([12]i-) mem X, K, LOAD
	/* 054 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 055 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 056 */ 13x"05b8", --     (2i-) mem K, X, STORE
	/* 057 */ 13x"1fff", -- alu_2ii:
	/* 058 */ 13x"09bb", --     ([12]i-) arg K, GET_0
	/* 059 */ 13x"048b", --     ([12]i-) mem X, K, LOAD
	/* 060 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 061 */ 13x"0499", --     ([23]-i) mem Y, Y, LOAD
	/* 062 */ 13x"0f89", --     (2--) alu X, Y, OP_COPY
	/* 063 */ 13x"05b8", --     (2i-) mem K, X, STORE
	/* 064 */ 13x"1fff", -- alu_3dd:
	/* 065 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 066 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 067 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 068 */ 13x"0899", --     (3d-) arg Y, PUT
	/* 069 */ 13x"1fff", -- alu_3di:
	/* 070 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 071 */ 13x"0499", --     ([23]-i) mem Y, Y, LOAD
	/* 072 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 073 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 074 */ 13x"0899", --     (3d-) arg Y, PUT
	/* 075 */ 13x"1fff", -- alu_3id:
	/* 076 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 077 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 078 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 079 */ 13x"05b9", --     (3i-) mem K, Y, STORE
	/* 080 */ 13x"1fff", -- alu_3ii:
	/* 081 */ 13x"0a99", --     ([23]--) arg Y, GET_1
	/* 082 */ 13x"0499", --     ([23]-i) mem Y, Y, LOAD
	/* 083 */ 13x"0baa", --     (3--) arg Z, GET_2
	/* 084 */ 13x"0f9a", --     (3--) alu Y, Z, OP_COPY
	/* 085 */ 13x"05b9", --     (3i-) mem K, Y, STORE
	                     -- # ======================================
	                     -- # CMP
	/* 086 */ 13x"1fff", -- cmp_dd:
	/* 087 */ 13x"0988", --     (--) arg X, GET_0
	/* 088 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 089 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 090 */ 13x"1fff", -- cmp_di:
	/* 091 */ 13x"0988", --     (--) arg X, GET_0
	/* 092 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 093 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 094 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 095 */ 13x"1fff", -- cmp_id:
	/* 096 */ 13x"0988", --     (--) arg X, GET_0
	/* 097 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 098 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 099 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 100 */ 13x"1fff", -- cmp_ii:
	/* 101 */ 13x"0988", --     (--) arg X, GET_0
	/* 102 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 103 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 104 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 105 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	                     -- # ======================================
	                     -- # JMP
	/* 106 */ 13x"1fff", -- jmp_d:
	/* 107 */ 13x"0966", --     arg PC, GET_0
	/* 108 */ 13x"1fff", -- jmp_i:
	/* 109 */ 13x"0988", --     arg X, GET_0
	/* 110 */ 13x"0488", --     mem X, X, LOAD
	/* 111 */ 13x"0168", --     mov PC, X
	/* 112 */ 13x"1fff", -- jmp_3dd:
	/* 113 */ 13x"09bb", --     (--) arg K, GET_0
	/* 114 */ 13x"0a88", --     (--) arg X, GET_1
	/* 115 */ 13x"0b99", --     (--) arg Y, GET_2
	/* 116 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 117 */ 13x"176b", --     (--) cmv PC, K, COND_COPY
	/* 118 */ 13x"1fff", -- jmp_3di:
	/* 119 */ 13x"09bb", --     (--) arg K, GET_0
	/* 120 */ 13x"0a88", --     (--) arg X, GET_1
	/* 121 */ 13x"0b99", --     (--) arg Y, GET_2
	/* 122 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 123 */ 13x"176b", --     (--) cmv PC, K, COND_COPY
	/* 124 */ 13x"1fff", -- jmp_3id:
	/* 125 */ 13x"09bb", --     (--) arg K, GET_0
	/* 126 */ 13x"04bb", --     (i-) mem K, K, LOAD
	/* 127 */ 13x"0a88", --     (--) arg X, GET_1
	/* 128 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 129 */ 13x"0b99", --     (--) arg Y, GET_2
	/* 130 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 131 */ 13x"176b", --     (--) cmv PC, K, COND_COPY
	/* 132 */ 13x"1fff", -- jmp_3ii:
	/* 133 */ 13x"09bb", --     (--) arg K, GET_0
	/* 134 */ 13x"04bb", --     (i-) mem K, K, LOAD
	/* 135 */ 13x"0a88", --     (--) arg X, GET_1
	/* 136 */ 13x"0488", --     (i-) mem X, X, LOAD
	/* 137 */ 13x"0b99", --     (--) arg Y, GET_2
	/* 138 */ 13x"1289", --     (--) cmp X, Y, OP_COPY
	/* 139 */ 13x"176b", --     (--) cmv PC, K, COND_COPY
	                     -- # ======================================
	                     -- # MOV
	/* 140 */ 13x"1fff", -- mov_dd:
	/* 141 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 142 */ 13x"0899", --     (d-) arg Y, PUT
	/* 143 */ 13x"1fff", -- mov_di:
	/* 144 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 145 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 146 */ 13x"0899", --     (d-) arg Y, PUT
	/* 147 */ 13x"1fff", -- mov_id:
	/* 148 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 149 */ 13x"0988", --     (i-) arg X, GET_0
	/* 150 */ 13x"0589", --     (i-) mem X, Y, STORE
	/* 151 */ 13x"1fff", -- mov_ii:
	/* 152 */ 13x"0a99", --     (--) arg Y, GET_1
	/* 153 */ 13x"0499", --     (-i) mem Y, Y, LOAD
	/* 154 */ 13x"0988", --     (i-) arg X, GET_0
	/* 155 */ 13x"0589", --     (i-) mem X, Y, STORE
	                     -- # ======================================
	                     -- # Others
	/* 156 */ 13x"1fff", -- halt:
	/* 157 */ 13x"0166", --     mov PC, PC
	/* 158 */ 13x"1fff", -- getf:
	/* 159 */ 13x"0877", --     arg FL, PUT
	/* 160 */ 13x"1fff", -- setf:
	/* 161 */ 13x"0977", --     arg FL, GET_0
	/* 162 */ 13x"0284", --     con X, 0x3F # 6 bits
	/* 163 */ 13x"0e78", --     alu FL, X, AND
	/* 164 */ 13x"1fff", -- call_d:
	/* 165 */ 13x"0988", --     (-) arg X, GET_0
	/* 166 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 167 */ 13x"0556", --     (-) mem SP, PC, STORE
	/* 168 */ 13x"0168", --     (-) mov PC, X
	/* 169 */ 13x"1fff", -- call_i:
	/* 170 */ 13x"0988", --     (-) arg X, GET_0
	/* 171 */ 13x"0488", --     (i) mem X, X, LOAD
	/* 172 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 173 */ 13x"0556", --     (-) mem SP, PC, STORE
	/* 174 */ 13x"0168", --     (-) mov PC, X
	/* 175 */ 13x"1fff", -- ret:
	/* 176 */ 13x"0485", --     mem X, SP, LOAD
	/* 177 */ 13x"0c5c", --     alu SP, 2, ADD
	/* 178 */ 13x"0168", --     mov PC, X
	/* 179 */ 13x"1fff", -- push_d:
	/* 180 */ 13x"0988", --     (-) arg X, GET_0
	/* 181 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 182 */ 13x"0558", --     (-) mem SP, X, STORE
	/* 183 */ 13x"1fff", -- push_i:
	/* 184 */ 13x"0988", --     (-) arg X, GET_0
	/* 185 */ 13x"0488", --     (i) mem X, X, LOAD
	/* 186 */ 13x"0d5c", --     (-) alu SP, 2, SUB
	/* 187 */ 13x"0558", --     (-) mem SP, X, STORE
	/* 188 */ 13x"1fff", -- pop_d:
	/* 189 */ 13x"0495", --     (-) mem Y, SP, LOAD
	/* 190 */ 13x"0c5c", --     (-) alu SP, 2, ADD
	/* 191 */ 13x"0899", --     (d) arg Y, PUT
	/* 192 */ 13x"1fff", -- pop_i:
	/* 193 */ 13x"0495", --     (-) mem Y, SP, LOAD
	/* 194 */ 13x"0c5c", --     (-) alu SP, 2, ADD
	/* 195 */ 13x"0988", --     (i) arg X, GET_0
	/* 196 */ 13x"0589", --     (i) mem X, Y, STORE
	/* 197 */ 13x"1fff", -- mmap_dd: # start, end, slot_idx / Y, Z, X
	/* 198 */ 13x"0999", --     (--) arg, Y, GET_0
	/* 199 */ 13x"0aaa", --     (--) arg, Z, GET_1
	/* 200 */ 13x"0b88", --     (--) arg X, GET_2
	/* 201 */ 13x"0300", --     (--) mmu
	/* 202 */ 13x"1fff", -- mmap_di: # start, end, slot_idx / Y, Z, X
	/* 203 */ 13x"0999", --     (--) arg, Y, GET_0
	/* 204 */ 13x"0aaa", --     (--) arg, Z, GET_1
	/* 205 */ 13x"0b88", --     (--) arg X, GET_2
	/* 206 */ 13x"0300", --     (--) mmu
	/* 207 */ 13x"1fff", -- mmap_id: # start, end, slot_idx / Y, Z, X
	/* 208 */ 13x"0999", --     (--) arg, Y, GET_0
	/* 209 */ 13x"0499", --     (i-) mem, Y, Y, LOAD
	/* 210 */ 13x"0aaa", --     (--) arg, Z, GET_1
	/* 211 */ 13x"04aa", --     (i-) mem, Z, Z, LOAD
	/* 212 */ 13x"0b88", --     (--) arg X, GET_2
	/* 213 */ 13x"0300", --     (--) mmu
	/* 214 */ 13x"1fff", -- mmap_ii: # start, end, slot_idx / Y, Z, X
	/* 215 */ 13x"0999", --     (--) arg, Y, GET_0
	/* 216 */ 13x"0499", --     (i-) mem, Y, Y, LOAD
	/* 217 */ 13x"0aaa", --     (--) arg, Z, GET_1
	/* 218 */ 13x"04aa", --     (i-) mem, Z, Z, LOAD
	/* 219 */ 13x"0b88", --     (--) arg X, GET_2
	/* 220 */ 13x"0300", --     (--) mmu
	/* 221 */ 13x"1fff", -- umap_d:
	/* 222 */ 13x"0988", --     (-) arg, X, GET_0
	/* 223 */ 13x"0291", --     (-) con Y, 0xFFFF
	/* 224 */ 13x"01a0", --     (-) mov Z, 0
	/* 225 */ 13x"0300", --     (-) mmu
	/* 226 */ 13x"1fff", -- umap_i:
	/* 227 */ 13x"0988", --     (-) arg, X, GET_0
	/* 228 */ 13x"0488", --     (i) mem, X, X, LOAD
	/* 229 */ 13x"0291", --     (-) con Y, 0xFFFF
	/* 230 */ 13x"01a0", --     (-) mov Z, 0
	/* 231 */ 13x"0300", --     (-) mmu
	/* 232 */ 13x"1fff"  -- end_of_rom:
); -- uops_rom ---------------------------------------------------

constant label_reset : integer := 2;
constant label_alu_1dx : integer := 32;
constant label_alu_1ix : integer := 36;
constant label_alu_2dd : integer := 41;
constant label_alu_2di : integer := 46;
constant label_alu_2id : integer := 52;
constant label_alu_2ii : integer := 58;
constant label_alu_3dd : integer := 65;
constant label_alu_3di : integer := 70;
constant label_alu_3id : integer := 76;
constant label_alu_3ii : integer := 81;
constant label_cmp_dd : integer := 87;
constant label_cmp_di : integer := 91;
constant label_cmp_id : integer := 96;
constant label_cmp_ii : integer := 101;
constant label_jmp_d : integer := 107;
constant label_jmp_i : integer := 109;
constant label_jmp_3dd : integer := 113;
constant label_jmp_3di : integer := 119;
constant label_jmp_3id : integer := 125;
constant label_jmp_3ii : integer := 133;
constant label_mov_dd : integer := 141;
constant label_mov_di : integer := 144;
constant label_mov_id : integer := 148;
constant label_mov_ii : integer := 152;
constant label_halt : integer := 157;
constant label_getf : integer := 159;
constant label_setf : integer := 161;
constant label_call_d : integer := 165;
constant label_call_i : integer := 170;
constant label_ret : integer := 176;
constant label_push_d : integer := 180;
constant label_push_i : integer := 184;
constant label_pop_d : integer := 189;
constant label_pop_i : integer := 193;
constant label_mmap_dd : integer := 198;
constant label_mmap_di : integer := 203;
constant label_mmap_id : integer := 208;
constant label_mmap_ii : integer := 215;
constant label_umap_d : integer := 222;
constant label_umap_i : integer := 227;

-- ##############################################################
-- ## END UOPS ROM
-- ##############################################################



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
constant labels_alu1 : ArrLabel2 := (
	to_unsigned(label_alu_1dx, UopIdxW),
	to_unsigned(label_alu_1ix, UopIdxW)
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
constant labels_mmap : ArrLabel4 := (
	to_unsigned(label_mmap_dd, UopIdxW),
	to_unsigned(label_mmap_di, UopIdxW),
	to_unsigned(label_mmap_id, UopIdxW),
	to_unsigned(label_mmap_ii, UopIdxW)
);
constant labels_umap : ArrLabel2 := (
	to_unsigned(label_umap_d, UopIdxW),
	to_unsigned(label_umap_i, UopIdxW)
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

-----------------------------------------------------------------------------------

signal s_idx : TIndex := (others => '0');

begin

	process(clk, reset)
		variable next_idx, op_prog : TIndex;
		variable op : unsigned(OpW-1 downto 0); -- opcode portion, without args, from instruction stream
	
		variable need_a, need_b, need_c : unsigned(3-1 downto 0); -- each arg takes from 1 to 3 bytes
		variable need : unsigned(InstIdxW-1 downto 0);
		variable nargs : unsigned(NArgsW-1 downto 0);
		variable indirect_specs : unsigned(2-1 downto 0);
	begin

		if reset = '1' then
			s_idx <= to_unsigned(label_reset, UopIdxW) - 1;
			brk <= '0';
			ready <= '0';
			used_len <= (others => '0');
			booted <= '0';
			uop <= (others => '0');
			uop_idx <= (others => '0');
		elsif rising_edge(clk) and hold = '0' then
			need := (others => '0');
			op_prog := (others => '0');

			if s_idx /= 0 and brk = '0' then
				next_idx := s_idx + 1;
			else
				next_idx := (others => '0');
				booted <= '1';
			end if;

			-- BEGIN DECODE
			if avail /= 0 then
				op := unsigned(inst_in(0)(7 downto 2));
				indirect_specs := unsigned(inst_in(0)(1 downto 0));
				nargs := to_unsigned(0, NArgsW);

				if op(4 downto 0) <= 13 then -- ALU with 2/3 args
					if op(5) = '0' then
						nargs := to_unsigned(2, NArgsW);
					else
						nargs := to_unsigned(3, NArgsW);
					end if;
					op_prog := labels_alu23(to_integer(op(5) & indirect_specs));
				elsif op(4 downto 0) <= 18 then -- ALU with 1/2 args
					if op(5) = '0' then
						nargs := to_unsigned(1, NArgsW);
						op_prog := labels_alu1(to_integer(indirect_specs(1 downto 1)));
					else
						nargs := to_unsigned(2, NArgsW);
						op_prog := labels_alu23(to_integer("0" & indirect_specs));
					end if;
				elsif op(4 downto 0) <= 25 then -- Misc
					case op is
						when to_unsigned(OP_GETF, OpW) => nargs := to_unsigned(1, NArgsW); op_prog := to_unsigned(label_getf, UopIdxW);
						when to_unsigned(OP_CMP , OpW) => nargs := to_unsigned(2, NArgsW); op_prog := labels_cmp(to_integer(indirect_specs));
						when to_unsigned(OP_MMAP, OpW) => nargs := to_unsigned(3, NArgsW); op_prog := labels_mmap(to_integer(indirect_specs));
						when to_unsigned(OP_JMP , OpW) => nargs := to_unsigned(1, NArgsW); op_prog := labels_jmp(to_integer(indirect_specs(1 downto 1)));
						when to_unsigned(OP_CALL, OpW) => nargs := to_unsigned(1, NArgsW); op_prog := labels_call(to_integer(indirect_specs(1 downto 1)));
						when to_unsigned(OP_MOV , OpW) => nargs := to_unsigned(2, NArgsW); op_prog := labels_mov(to_integer(indirect_specs));
						when to_unsigned(OP_BMOV, OpW) => nargs := to_unsigned(2, NArgsW); -- TODO
						when to_unsigned(OP_SETF, OpW) => nargs := to_unsigned(1, NArgsW); op_prog := to_unsigned(label_setf, UopIdxW);
						when to_unsigned(OP_ICMP, OpW) => nargs := to_unsigned(2, NArgsW); op_prog := labels_cmp(to_integer(indirect_specs));
						when to_unsigned(OP_UMAP, OpW) => nargs := to_unsigned(1, NArgsW); op_prog := labels_umap(to_integer(indirect_specs(1 downto 1)));
						when to_unsigned(OP_HALT, OpW) => nargs := to_unsigned(0, NArgsW); op_prog := to_unsigned(label_halt, UopIdxW);
						when to_unsigned(OP_RET , OpW) => nargs := to_unsigned(0, NArgsW); op_prog := to_unsigned(label_ret, UopIdxW);
						when to_unsigned(OP_PUSH, OpW) => nargs := to_unsigned(1, NArgsW); op_prog := labels_push(to_integer(indirect_specs(1 downto 1)));
						when to_unsigned(OP_POP , OpW) => nargs := to_unsigned(1, NArgsW); op_prog := labels_pop(to_integer(indirect_specs(1 downto 1)));
						when others => null;
					end case;
				else -- if op(4 downto 0) <= 32 then -- Jmp
					if op(5) = '0' then
						nargs := to_unsigned(0, NArgsW);
						op_prog := labels_jmp(to_integer(indirect_specs(1 downto 1)));
					else
						nargs := to_unsigned(3, NArgsW);
						op_prog := labels_jmp_3(to_integer(indirect_specs));
					end if;
				end if;

				if avail - 1 >= nargs then -- -1 opcode byte
					-- 7 6 5 4 3 2 1 0
					-- a a a b b b x x
					need_a := to_unsigned(0, 3) when nargs = 0 else
							  to_unsigned(3, 3) when inst_in(1)(7 downto 5) = "111" else
							  to_unsigned(2, 3) when inst_in(1)(4 downto 2) = "111" else
							  to_unsigned(1, 3);
					need_b := to_unsigned(0, 3) when nargs = 0 or nargs = 1 else
							  to_unsigned(3, 3) when inst_in(2)(7 downto 5) = "111" else
							  to_unsigned(2, 3) when inst_in(2)(4 downto 2) = "111" else
							  to_unsigned(1, 3);
					need_c := to_unsigned(0, 3) when nargs /= 3 else
							  to_unsigned(3, 3) when inst_in(3)(7 downto 5) = "111" else
							  to_unsigned(2, 3) when inst_in(3)(4 downto 2) = "111" else
							  to_unsigned(1, 3);

					need := to_unsigned(1, InstIdxW) + need_a + need_b + need_c;

					 -- wait one cycle between ops decode (check s_idx instead of next_idx)
					if s_idx = 0 and pc = inst_pc and avail >= need then
						-- can decode now
						next_idx := op_prog;
					end if;
				end if;
				
				inst_nargs <= nargs;
			end if; -- avail /= 0
			-- END DECODE

			s_idx <= next_idx;
			if next_idx /= 0 then
				ready <= '1';
				used_len <= need;
				uop_idx <= next_idx - op_prog;
			else
				ready <= '0';
				used_len <= (others => '0');
				uop_idx <= (others => '0');
			end if;
			
			uop <= uops_rom(to_integer(next_idx));
			if uops_rom(to_integer(next_idx) + 1) = 13x"1fff" then
				brk <= '1';
			else
				brk <= '0';
			end if;

		end if;

	end process;

end Behavioral;
