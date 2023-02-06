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
		uop_idx : out TUopIndex;
		used_len : out TInstBufferIdx;

		booted : out std_logic := '0' -- reset vector has been run
	);
end Decoder;

architecture Behavioral of Decoder is

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

	process(clk)
		variable next_idx, op_prog : TIndex;
		variable op : unsigned(OpW-1 downto 0); -- opcode portion, without args, from instruction stream
	
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
				uop <= (others => '0');
				uop_idx <= (others => '0');
			elsif hold = '0' then
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
							op_prog := labels_alu_single1(to_integer(indirect_specs(1 downto 1)));
						else
							nargs := to_unsigned(2, NArgsW);
							op_prog := labels_alu_single2(to_integer(indirect_specs));
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
			
			end if; -- hold == '0'

		end if; -- rising_edge(clk)

	end process;

end Behavioral;
