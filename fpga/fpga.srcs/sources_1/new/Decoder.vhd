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

		ready : out std_logic; -- uop is ready
		brk   : out std_logic; -- last uop of the block
		uop   : out TUop;
		used_len : out TInstBufferIdx;

		booted : out std_logic := '0' -- reset vector has been run
	);
end Decoder;

architecture Behavioral of Decoder is

-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUtopROM is array (0 to 53-1) of TUop;
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
	                     --     # phy=A:B, idx=E, start=F, end=G
	/* 009 */ 13x"02b0", --     con H, 1
	/* 010 */ 13x"018b", --     mov E, H
	/* 011 */ 13x"0190", --     mov F, 0
	/* 012 */ 13x"02a1", --     con G, 0xFFFF
	/* 013 */ 13x"0300", --     mmu # idx=1, 0000-FFFF to 0000-FFFF
	/* 014 */ 13x"01a0", --     mov G, 0
	/* 015 */ 13x"0c8b", --     alu E, H, ADD
	/* 016 */ 13x"0300", --     mmu # idx=1
	/* 017 */ 13x"0212", --     con A, 0xFF # and B = 0
	/* 018 */ 13x"0293", --     con F, 0x8000
	/* 019 */ 13x"02a1", --     con G, 0xFFFF
	/* 020 */ 13x"0c8b", --     alu E, H, ADD
	/* 021 */ 13x"0300", --     mmu # idx=2
	/* 022 */ 13x"0110", --     mov A, 0
	/* 023 */ 13x"0190", --     mov F, 0
	/* 024 */ 13x"01a0", --     mov G, 0
	/* 025 */ 13x"0c8b", --     alu E, H, ADD
	/* 026 */ 13x"0300", --     mmu # idx=3
	/* 027 */ 13x"0000", --     nop # wait 1 cycle to write MMU config
	                     --     # --------------------
	                     --     # reset Fetcher
	/* 028 */ 13x"0160", --     mov PC, 0
	/* 029 */ 13x"0263", --     con PC, 0x8000
	                     -- # ======================================
	                     -- # ALU ops
	/* 030 */ 13x"1fff", -- alu2_dd:
	/* 031 */ 13x"0214", --     con A,  0xCA
	/* 032 */ 13x"012c", --     mov B, 2
	/* 033 */ 13x"013c", --     mov C, 2
	/* 034 */ 13x"014c", --     mov D, 2
	/* 035 */ 13x"018c", --     mov E, 2
	/* 036 */ 13x"1fff", -- alu2_di:
	/* 037 */ 13x"0210", --     con A,  1
	/* 038 */ 13x"1fff", -- alu2_id:
	/* 039 */ 13x"0210", --     con A,  1
	/* 040 */ 13x"1fff", -- alu2_ii:
	/* 041 */ 13x"0210", --     con A,  1
	/* 042 */ 13x"1fff", -- alu3_dd:
	/* 043 */ 13x"0110", --     mov A,  0
	/* 044 */ 13x"1fff", -- alu3_di:
	/* 045 */ 13x"0110", --     mov A,  0
	/* 046 */ 13x"1fff", -- alu3_id:
	/* 047 */ 13x"0110", --     mov A,  0
	/* 048 */ 13x"1fff", -- alu3_ii:
	/* 049 */ 13x"0110", --     mov A,  0
	                     -- # ======================================
	                     -- # Misc
	/* 050 */ 13x"1fff", -- halt:
	/* 051 */ 13x"0166", --     mov PC, PC
	/* 052 */ 13x"1fff"  -- end_of_rom:
); -- uops_rom ---------------------------------------------------

constant uops_label_reset : integer := 2;
constant uops_label_alu2_dd : integer := 31;
constant uops_label_alu2_di : integer := 37;
constant uops_label_alu2_id : integer := 39;
constant uops_label_alu2_ii : integer := 41;
constant uops_label_alu3_dd : integer := 43;
constant uops_label_alu3_di : integer := 45;
constant uops_label_alu3_id : integer := 47;
constant uops_label_alu3_ii : integer := 49;
constant uops_label_halt : integer := 51;

-- ##############################################################
-- ## END UOPS ROM
-- ##############################################################



constant InstIdxW : Integer := 4; -- 10 bytes, longest instruction len
constant NArgsW : Integer := 2; -- max 3 arguments
constant UopIdxW : integer := 8; -- TODO: use more fit value, size of uops_rom array
constant OpW : Integer := 6;
subtype TIndex is unsigned(UopIdxW-1 downto 0);
signal s_idx : TIndex := (others => '0');

begin

	uop <= uops_rom(to_integer(s_idx));
	brk <= '1' when uops_rom(to_integer(s_idx) + 1) = 13x"1fff" else '0';

	process(clk, reset)
		variable next_idx, op_prog : TIndex;
		variable op : unsigned(OpW-1 downto 0); -- opcode portion, without args, from instruction stream
	
		variable need_a, need_b, need_c : unsigned(3-1 downto 0); -- each arg takes from 1 to 3 bytes
		variable need : unsigned(InstIdxW-1 downto 0);
		variable nargs : unsigned(NArgsW-1 downto 0);
	begin

		if reset = '1' then
			s_idx <= to_unsigned(uops_label_reset, UopIdxW) - 1;
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
							when "00" => op_prog := to_unsigned(uops_label_alu2_dd, UopIdxW);
							when "01" => op_prog := to_unsigned(uops_label_alu2_di, UopIdxW);
							when "10" => op_prog := to_unsigned(uops_label_alu2_id, UopIdxW);
							when "11" => op_prog := to_unsigned(uops_label_alu2_ii, UopIdxW);
							when others => null;
						end case;
					else
						nargs := to_unsigned(3, NArgsW);
						case inst_in(0)(1 downto 0) is
							when "00" => op_prog := to_unsigned(uops_label_alu3_dd, UopIdxW);
							when "01" => op_prog := to_unsigned(uops_label_alu3_di, UopIdxW);
							when "10" => op_prog := to_unsigned(uops_label_alu3_id, UopIdxW);
							when "11" => op_prog := to_unsigned(uops_label_alu3_ii, UopIdxW);
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
						when to_unsigned(OP_JMP , OpW) => nargs := to_unsigned(1, NArgsW);
						when to_unsigned(OP_CALL, OpW) => nargs := to_unsigned(1, NArgsW);
						when to_unsigned(OP_MOV , OpW) => nargs := to_unsigned(2, NArgsW);
						when to_unsigned(OP_BMOV, OpW) => nargs := to_unsigned(2, NArgsW);
						when to_unsigned(OP_SETF, OpW) => nargs := to_unsigned(1, NArgsW);
						when to_unsigned(OP_ICMP, OpW) => nargs := to_unsigned(2, NArgsW);
						when to_unsigned(OP_UMAP, OpW) => nargs := to_unsigned(1, NArgsW);
						when to_unsigned(OP_HALT, OpW) => nargs := to_unsigned(0, NArgsW); op_prog := to_unsigned(uops_label_halt, UopIdxW);
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

			end if; -- avail /= 0
			-- END DECODE

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
