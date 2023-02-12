library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;
use work.UopROM.all;

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
		inst_out  : out TInstBuffer;
		used_len : out TInstBufferIdx;

		booted : out std_logic := '0' -- reset vector has been run
	);
end Decoder;

architecture Behavioral of Decoder is

signal s_idx : TIndex := (others => '0');
signal s_uop : TUop;
attribute ram_style of s_uop : signal is "registers";

begin

	uop <= s_uop;

	process(clk)
		variable next_idx, op_prog : TIndex;
		variable op : unsigned(OpW-1 downto 0); -- opcode portion, without args, from instruction stream
		variable next_fetched_uop : std_logic_vector(1+UopLen-1 downto 0); -- with fin bit
	
		variable need_a, need_b, need_c : unsigned(3-1 downto 0); -- each arg takes from 1 to 3 bytes
		variable need : unsigned(InstIdxW-1 downto 0);
		variable nargs : unsigned(NArgsW-1 downto 0);
		variable indirect_specs : unsigned(2-1 downto 0);
	begin

		if rising_edge(clk) then
			if reset = '1' then
				s_idx <= to_unsigned(label_reset, UopIdxW) - 1;
				brk <= '0';
				ready <= '0';
				used_len <= (others => '0');
				booted <= '0';
				s_uop <= (others => '0');
			elsif hold = '0' then
				if s_idx /= 0 and brk = '0' then
					next_idx := s_idx + 1;
				else
					next_idx := (others => '0');
					booted <= '1';
				end if;
	
				-- BEGIN DECODE
				if avail /= 0 and next_idx = 0 then
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
							op_prog := labels_alu_single1(to_integer(indirect_specs(1 downto 1)));
						else
							nargs := to_unsigned(2, NArgsW);
							op_prog := labels_alu_single2(to_integer(indirect_specs));
						end if;
					elsif op(4 downto 0) <= 25 then -- Misc
						case op is
							when to_unsigned(OP_GETF, OpW) => nargs := to_unsigned(1, NArgsW); op_prog := to_unsigned(label_getf, UopIdxW);
							when to_unsigned(OP_CMP , OpW) => nargs := to_unsigned(2, NArgsW); op_prog := labels_cmp(to_integer(indirect_specs));
							when to_unsigned(OP_MMAP, OpW) => nargs := to_unsigned(3, NArgsW); op_prog := to_unsigned(label_mmap, UopIdxW);
							when to_unsigned(OP_JMP , OpW) => nargs := to_unsigned(1, NArgsW); op_prog := labels_jmp(to_integer(indirect_specs(1 downto 1)));
							when to_unsigned(OP_CALL, OpW) => nargs := to_unsigned(1, NArgsW); op_prog := labels_call(to_integer(indirect_specs(1 downto 1)));
							when to_unsigned(OP_MOV , OpW) => nargs := to_unsigned(2, NArgsW); op_prog := labels_mov(to_integer(indirect_specs));
							when to_unsigned(OP_BMOV, OpW) => nargs := to_unsigned(2, NArgsW); op_prog := labels_bmov(to_integer(indirect_specs));
							when to_unsigned(OP_SETF, OpW) => nargs := to_unsigned(1, NArgsW); op_prog := to_unsigned(label_setf, UopIdxW);
							when to_unsigned(OP_ICMP, OpW) => nargs := to_unsigned(2, NArgsW); op_prog := labels_cmp(to_integer(indirect_specs));
							when to_unsigned(OP_UMAP, OpW) => nargs := to_unsigned(1, NArgsW); op_prog := to_unsigned(label_umap, UopIdxW);
							when to_unsigned(OP_HALT, OpW) => nargs := to_unsigned(0, NArgsW); op_prog := to_unsigned(label_halt, UopIdxW);
							when to_unsigned(OP_RET , OpW) => nargs := to_unsigned(0, NArgsW); op_prog := to_unsigned(label_ret, UopIdxW);
							when to_unsigned(OP_PUSH, OpW) => nargs := to_unsigned(1, NArgsW); op_prog := labels_push(to_integer(indirect_specs(1 downto 1)));
							when to_unsigned(OP_POP , OpW) => nargs := to_unsigned(1, NArgsW); op_prog := labels_pop(to_integer(indirect_specs(1 downto 1)));
							when others => null;
						end case;
					else -- if op(4 downto 0) <= 32 then -- Jmp
						if op(5) = '0' then
							nargs := to_unsigned(1, NArgsW);
							op_prog := labels_jmp_cond(to_integer(indirect_specs(1 downto 1)));
						else
							nargs := to_unsigned(3, NArgsW);
							op_prog := labels_jmp_3(to_integer(indirect_specs));
						end if;
					end if;
	
					if avail - 1 >= nargs then -- -1 opcode byte
						-- 7 6 5 4 3 2 1 0
						-- a a a b b b x x
						need_a := to_unsigned(0, 3) when nargs = 0 else
								  to_unsigned(1, 3) when inst_in(1)(7 downto 2) = "111111" else
								  to_unsigned(3, 3) when inst_in(1)(7 downto 5) = "111" else
								  to_unsigned(2, 3) when inst_in(1)(4 downto 2) = "111" else
								  to_unsigned(1, 3);
						need_b := to_unsigned(0, 3) when nargs = 0 or nargs = 1 else
								  to_unsigned(1, 3) when inst_in(2)(7 downto 2) = "111111" else
								  to_unsigned(3, 3) when inst_in(2)(7 downto 5) = "111" else
								  to_unsigned(2, 3) when inst_in(2)(4 downto 2) = "111" else
								  to_unsigned(1, 3);
						need_c := to_unsigned(0, 3) when nargs /= 3 else
								  to_unsigned(1, 3) when inst_in(3)(7 downto 2) = "111111" else
								  to_unsigned(3, 3) when inst_in(3)(7 downto 5) = "111" else
								  to_unsigned(2, 3) when inst_in(3)(4 downto 2) = "111" else
								  to_unsigned(1, 3);
	
						need := to_unsigned(1, InstIdxW) + need_a + need_b + need_c;
	
						 -- check if we can really speculatively decode the next instruction from fetcher
						if avail >= need and (pc = inst_pc or (unsigned(s_uop) /= 0 and unsigned(s_uop(7 downto 4)) /= REGID_PC)) then
							-- can decode now
							next_idx := op_prog;
							inst_out <= inst_in;
							used_len <= need;
						end if;
					end if;
					
					inst_nargs <= nargs;
				end if; -- avail /= 0
				-- END DECODE
	
				s_idx <= next_idx;
				if next_idx /= 0 then
					ready <= '1';
				else
					ready <= '0';
					used_len <= (others => '0');
				end if;

				next_fetched_uop := uops_rom(to_integer(next_idx));
				s_uop <= next_fetched_uop(UopLen-1 downto 0);
				brk <= next_fetched_uop(1+UopLen-1);

			end if; -- hold == '0'

		end if; -- rising_edge(clk)

	end process;

end Behavioral;
