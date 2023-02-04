library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Decoder is
	port (
		clk : in std_logic;
		reset : in std_logic;

		avail : in TInstBufferIdx;
		inst  : in TInstBuffer;

		ready : out std_logic; -- uop is ready
		uop   : out TUop;
		used_len : out TInstBufferIdx
	);
end Decoder;

architecture Behavioral of Decoder is

-- ##############################################################
-- ## BEGIN UOPS ROM
-- ##############################################################

type TArrUtopROM is array (0 to 25-1) of TUop;
signal uops_rom : TArrUtopROM := (
	"00000000000000", -- 0000 |     NULL # dummy instruction at index 0 & 1
	"00000000000000", -- 0000 |     NULL, FALLTHROUGH
	                  --      | reset:
	                  --      |     # reset arch registers
	"00000100010000", -- 0110 |     MOV A,  0
	"00000100100000", -- 0120 |     MOV B,  0
	"00000100110000", -- 0130 |     MOV C,  0
	"00000101000000", -- 0140 |     MOV D,  0
	"00000101010000", -- 0150 |     MOV SP, 0
	"00000101110000", -- 0170 |     MOV FL, 0
	"00000101100000", -- 0160 |     MOV PC, 0
	"00110101101101", -- 0d6d |     ALU PC, 2, SUB
	"00110101101101", -- 0d6d |     ALU PC, 2, SUB # reset vector PC=0xFFFB
	                  --      |     # reset MMU
	"00000110010000", -- 0190 |     MOV F, 0
	"00000110100000", -- 01a0 |     MOV G, 0
	"00110110101100", -- 0dac |     ALU G, 1, SUB
	"00000110000000", -- 0180 |     MOV E, 0
	"00001000000000", -- 0200 |     MMU # phy=A:B, idx=E, start=F, end=G
	"00000110100000", -- 01a0 |     MOV G, 0
	"00110010001100", -- 0c8c |     ALU E, 1, ADD
	"00001000000000", -- 0200 |     MMU # idx=1
	"00110010001100", -- 0c8c |     ALU E, 1, ADD
	"00001000000000", -- 0200 |     MMU # idx=2
	"00110010001100", -- 0c8c |     ALU E, 1, ADD
	"10001000000000", -- 2200 |     MMU # idx=3
	                  --      | alu2_ii:
	"10000100010000", -- 2110 |     MOV A,  0
	                  --      | alu2_ir:
	"10000100010000"  -- 2110 |     MOV A,  0
); -- uops_rom ---------------------------------------------------

constant uops_label_reset : integer := 2;
constant uops_label_alu2_ii : integer := 23;
constant uops_label_alu2_ir : integer := 24;

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

	process(clk, reset)
		variable next_idx : TIndex;
		variable op : unsigned(OpW-1 downto 0); -- opcode portion, without args, from instruction stream
	
		variable need_a, need_b, need_c : unsigned(3-1 downto 0); -- each arg takes from 1 to 3 bytes
		variable need : unsigned(InstIdxW-1 downto 0);
		variable nargs : unsigned(NArgsW-1 downto 0);
	begin

		if reset = '1' then
			s_idx <= to_unsigned(uops_label_reset, UopIdxW) - 1;
			ready <= '0';
			used_len <= (others => '0');
		elsif rising_edge(clk) then
			need := (others => '0');

			if s_idx /= 0 and uop(UopLen-1) = '0' then
				next_idx := s_idx + 1;
			else
				next_idx := (others => '0');
			end if;

			-- BEGIN DECODE
			if avail /= 0 then
				op := unsigned(inst(0)(7 downto 2));
				nargs := to_unsigned(0, NArgsW);

				if op(4 downto 0) <= 13 then -- ALU with 2/3 args
					if op(5) = '0' then
						nargs := to_unsigned(2, NArgsW);
					else
						nargs := to_unsigned(3, NArgsW);
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
						when to_unsigned(OP_HALT, OpW) => nargs := to_unsigned(0, NArgsW);
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
							  to_unsigned(3, 3) when inst(1)(7 downto 5) = "111" else
							  to_unsigned(2, 3) when inst(1)(4 downto 2) = "111" else
							  to_unsigned(1, 3);
					need_b := to_unsigned(0, 3) when nargs = 0 or nargs = 1 else
							  to_unsigned(3, 3) when inst(2)(7 downto 5) = "111" else
							  to_unsigned(2, 3) when inst(2)(4 downto 2) = "111" else
							  to_unsigned(1, 3);
					need_c := to_unsigned(0, 3) when nargs /= 3 else
							  to_unsigned(3, 3) when inst(3)(7 downto 5) = "111" else
							  to_unsigned(2, 3) when inst(3)(4 downto 2) = "111" else
							  to_unsigned(1, 3);

					need := to_unsigned(1, InstIdxW) + need_a + need_b + need_c;

					if need >= avail then
						-- can decode now
						-- TODO
						next_idx := (others => '0');
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
