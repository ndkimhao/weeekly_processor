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
		uop_idx : out unsigned(7 downto 0);
		used_len : out TInstBufferIdx;

		booted : out std_logic := '0' -- reset vector has been run
	);
end Decoder;

architecture Behavioral of Decoder is


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
	                     -- # ALU ops
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
	                     -- # Misc
	/* 078 */ 13x"1fff", -- jmp_d:
	/* 079 */ 13x"0966", --     arg PC, GET_0
	/* 080 */ 13x"1fff", -- jmp_i:
	/* 081 */ 13x"0988", --     arg X, GET_0
	/* 082 */ 13x"0488", --     mem X, X, LOAD
	/* 083 */ 13x"0168", --     mov PC, X
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




constant InstIdxW : Integer := InstructionIndexWidth;
constant NArgsW : Integer := 2; -- max 3 arguments
constant UopIdxW : integer := 8; -- TODO: use more fit value, size of uops_rom array
constant OpW : Integer := 6;
subtype TIndex is unsigned(UopIdxW-1 downto 0);
signal s_start_idx : TIndex := (others => '0');
signal s_idx : TIndex := (others => '0');

begin

	uop <= uops_rom(to_integer(s_idx));
	brk <= '1' when uops_rom(to_integer(s_idx) + 1) = 13x"1fff" else '0';

	uop_idx <= s_idx - s_start_idx when s_idx /= 0 else (others => '0');

	process(clk, reset)
		variable next_idx, op_prog : TIndex;
		variable op : unsigned(OpW-1 downto 0); -- opcode portion, without args, from instruction stream
	
		variable need_a, need_b, need_c : unsigned(3-1 downto 0); -- each arg takes from 1 to 3 bytes
		variable need : unsigned(InstIdxW-1 downto 0);
		variable nargs : unsigned(NArgsW-1 downto 0);
	begin

		if reset = '1' then
			s_start_idx <= to_unsigned(label_reset, UopIdxW);
			s_idx <= to_unsigned(label_reset, UopIdxW) - 1;
			ready <= '0';
			used_len <= (others => '0');
			booted <= '0';
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
				nargs := to_unsigned(0, NArgsW);

				if op(4 downto 0) <= 13 then -- ALU with 2/3 args
					if op(5) = '0' then
						nargs := to_unsigned(2, NArgsW);
						case inst_in(0)(1 downto 0) is
							when "00" => op_prog := to_unsigned(label_alu2_dd, UopIdxW);
							when "01" => op_prog := to_unsigned(label_alu2_di, UopIdxW);
							when "10" => op_prog := to_unsigned(label_alu2_id, UopIdxW);
							when "11" => op_prog := to_unsigned(label_alu2_ii, UopIdxW);
							when others => null;
						end case;
					else
						nargs := to_unsigned(3, NArgsW);
						case inst_in(0)(1 downto 0) is
							when "00" => op_prog := to_unsigned(label_alu3_dd, UopIdxW);
							when "01" => op_prog := to_unsigned(label_alu3_di, UopIdxW);
							when "10" => op_prog := to_unsigned(label_alu3_id, UopIdxW);
							when "11" => op_prog := to_unsigned(label_alu3_ii, UopIdxW);
							when others => null;
						end case;
					end if;
				elsif op(4 downto 0) <= 18 then -- ALU with 1/2 args
					if op(5) = '0' then
						nargs := to_unsigned(1, NArgsW);
					else
						nargs := to_unsigned(2, NArgsW);
					end if;
				elsif op(4 downto 0) <= 25 then -- Misc
					case op is
						when to_unsigned(OP_GETF, OpW) => nargs := to_unsigned(1, NArgsW);
						when to_unsigned(OP_CMP , OpW) => nargs := to_unsigned(2, NArgsW);
						when to_unsigned(OP_MMAP, OpW) => nargs := to_unsigned(3, NArgsW); -- idx,start,len
						when to_unsigned(OP_JMP , OpW) =>
							nargs := to_unsigned(1, NArgsW);
							case inst_in(0)(1 downto 1) is
								when "0" => op_prog := to_unsigned(label_jmp_d, UopIdxW);
								when "1" => op_prog := to_unsigned(label_jmp_i, UopIdxW);
								when others => null;
							end case;
						when to_unsigned(OP_CALL, OpW) => nargs := to_unsigned(1, NArgsW);
						when to_unsigned(OP_MOV , OpW) =>
							nargs := to_unsigned(2, NArgsW);
							case inst_in(0)(1 downto 0) is
								when "00" => op_prog := to_unsigned(label_mov_dd, UopIdxW);
								when "01" => op_prog := to_unsigned(label_mov_di, UopIdxW);
								when "10" => op_prog := to_unsigned(label_mov_id, UopIdxW);
								when "11" => op_prog := to_unsigned(label_mov_ii, UopIdxW);
								when others => null;
							end case;
						when to_unsigned(OP_BMOV, OpW) => nargs := to_unsigned(2, NArgsW);
						when to_unsigned(OP_SETF, OpW) => nargs := to_unsigned(1, NArgsW);
						when to_unsigned(OP_ICMP, OpW) => nargs := to_unsigned(2, NArgsW);
						when to_unsigned(OP_UMAP, OpW) => nargs := to_unsigned(1, NArgsW);
						when to_unsigned(OP_HALT, OpW) => nargs := to_unsigned(0, NArgsW); op_prog := to_unsigned(label_halt, UopIdxW);
						when to_unsigned(OP_RET , OpW) => nargs := to_unsigned(0, NArgsW);
						when to_unsigned(OP_PUSH, OpW) => nargs := to_unsigned(1, NArgsW);
						when to_unsigned(OP_POP , OpW) => nargs := to_unsigned(1, NArgsW);
						when others => null;
					end case;
				else -- if op(4 downto 0) <= 32 then -- Jmp
					if op(5) = '0' then
						nargs := to_unsigned(2, NArgsW);
					else
						nargs := to_unsigned(3, NArgsW);
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

			s_start_idx <= op_prog;
			s_idx <= next_idx;
			if next_idx /= 0 then
				ready <= '1';
				used_len <= need;
			else
				ready <= '0';
				used_len <= (others => '0');
			end if;
		end if;

	end process;

end Behavioral;
