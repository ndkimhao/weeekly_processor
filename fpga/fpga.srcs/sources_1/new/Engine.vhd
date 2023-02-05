library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Engine is
	port (
		clk : in std_logic;
		reset : in std_logic;

		uop_ready : in std_logic;
		uop : in TUop
	);
end Engine;

architecture Behavioral of Engine is

-- ===========================================================================
type TArrUopsConstsROM is array (0 to 2-1) of TData;
signal uops_consts_rom : TArrUopsConstsROM := (
	x"FFF0", -- used 1 times
	x"0001"  -- used 1 times
); -- uops_consts_rom -------------------------------------------
-- ===========================================================================



-- '0', 'A', 'B', 'C', 'D', 'SP', 'PC', 'FL',
-- 'E', 'F', 'G', 'H', '2', '', '', ''
type TArrRegs is array(1 to 11) of TData;
signal a_regs : TArrRegs;

signal idx_dst, idx_src : unsigned(4-1 downto 0);
signal r_dst, r_src : TData;

signal uop_head : std_logic_vector(UcodeHeadLen-1 downto 0);
signal uop_tail : std_logic_vector(UcodeTailLen-1 downto 0);

signal alu_op : std_logic_vector(ALUOpLen-1 downto 0);
signal alu_out : TData;
signal alu_cmp : std_logic_vector(AluNumFLags-1 downto 0);

begin

	uop_head <= uop(12 downto 10);
	uop_tail <= uop(9 downto 8);

	idx_dst <= unsigned(uop(7 downto 4));
	idx_src <= unsigned(uop(3 downto 0));
	
	r_dst <=
		a_regs(to_integer(idx_dst)) when 1 <= idx_src and idx_src <= 11 else
		x"0000";

	r_src <=
		x"0002" when idx_src = REG_2 else
		a_regs(to_integer(idx_src)) when 1 <= idx_src and idx_src <= 11 else
		x"0000";

	alu_op <= 
		std_logic_vector(to_unsigned(OP_ADD, ALUOpLen)) when uop_tail = UOP_ALU_ADD else
		std_logic_vector(to_unsigned(OP_SUB, ALUOpLen)) when uop_tail = UOP_ALU_SUB else
		std_logic_vector(to_unsigned(OP_AND, ALUOpLen)) when uop_tail = UOP_ALU_AND else
		(others => '0'); -- TOOD: COPY case

	alu : entity work.ALU port map (
		a => r_dst,
		b => r_src,
		op => alu_op,
		r => alu_out,
		cmp_signed => uop_tail(0),
		cmp => alu_cmp
	);

	process(clk, reset)
		variable r_write : std_logic;
		variable r_res : TData;
		variable r_idx : unsigned(4-1 downto 0);
	begin

		if reset = '1' then
			a_regs <= (others => (others => '0'));
		elsif rising_edge(clk) then
		
			if uop_ready = '1' then
				r_write := '0';
				case uop_head is
					when "000" =>
						case uop_tail is
							when UOP_NOP => null;
							when UOP_MOV =>
								r_write := '1';
								r_res := r_src;
							when UOP_CON =>
								r_write := '1';
								r_res := uops_consts_rom(to_integer(idx_src));
							when UOP_MMU =>
								null; -- TODO
							when others => 
								null;
						end case; -- "000" uop_tail

					when UOP_ALU_HEAD =>
						r_write := '1';
						r_res := alu_out;

					when UOP_CMP_HEAD =>
						r_write := '1';
						r_res := 10x"0000" & alu_cmp;

					when others =>
						null;
				end case; -- uop_head

				if r_write = '1' then
					if uop_head = UOP_CMP_HEAD then
						r_idx := to_unsigned(REG_FL, 4);
					else 
						r_idx := unsigned(uop(7 downto 4));
					end if;
					a_regs(to_integer(r_idx)) <= r_res;
				end if; -- r_write

			else -- uop_ready = '0'
				-- TODO: reset signals
			end if; -- uop_ready

		end if; -- rising_edge(clk)

	end process; -- process(clk, reset)


end Behavioral;
