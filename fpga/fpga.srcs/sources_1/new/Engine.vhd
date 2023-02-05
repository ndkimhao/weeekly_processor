library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Engine is
	port (
		clk : in std_logic;

		uop_ready : in std_logic;
		uop_hold : out std_logic; -- pause uop decode
		uop : in TUop;
		uop_done : in std_logic; -- last uop of the current instruction
		uop_idx : in unsigned(7 downto 0);
		inst_buffer : in TInstBuffer;
		inst_len : in TInstBufferIdx;
		inst_nargs : in unsigned(2-1 downto 0);

		den : out std_logic;
		dwr : out std_logic;
		daddr : out TAddr;
		din : in TData;
		dout : out TData;
		
		mmu_cfg_wr : out std_logic;
		
		reg_a : out TData;
		reg_b : out TData;
		reg_c : out TData;
		reg_d : out TData;
		reg_sp : out TData;
		reg_pc : out TData;
		reg_fl : out TData;
		reg_e : out TData;
		reg_f : out TData;
		reg_g : out TData;
		reg_h : out TData
	);
end Engine;

architecture Behavioral of Engine is


type TArrUopsConstsROM is array (0 to 5-1) of TData;
signal uops_consts_rom : TArrUopsConstsROM := (
	x"0001", -- used 4 times
	x"FFFF", -- used 2 times
	x"00FF", -- used 1 times
	x"8000", -- used 2 times
	x"00CA"  -- used 1 times
); -- uops_consts_rom -------------------------------------------



-- '0', 'A', 'B', 'C', 'D', 'SP', 'PC', 'FL',
-- 'E', 'F', 'G', 'H', '2', '', '', ''
type TArrRegs is array(1 to 11) of TData;
signal arr_regs : TArrRegs;

signal idx_dst, idx_src : unsigned(4-1 downto 0);
signal r_dst, r_src : TData;
signal mem_load_dst_idx : unsigned(4-1 downto 0) := (others => '0');

signal uop_head : std_logic_vector(UcodeHeadLen-1 downto 0);
signal uop_tail : std_logic_vector(UcodeTailLen-1 downto 0);

signal alu_op : std_logic_vector(ALUOpLen-1 downto 0);
signal alu_out : TData;
signal alu_cmp : std_logic_vector(AluNumFLags-1 downto 0);

signal last_den, last_dwr : std_logic;

signal last_inst_buffer : TInstBuffer;

begin

	uop_head <= uop(12 downto 10);
	uop_tail <= uop(9 downto 8);

	idx_dst <= unsigned(uop(7 downto 4));
	idx_src <= unsigned(uop(3 downto 0));
	
	r_dst <=
		din when last_den = '1' and last_dwr = '0' and idx_dst = mem_load_dst_idx else
		arr_regs(to_integer(idx_dst)) when 1 <= idx_src and idx_src <= 11 else
		x"0000";

	r_src <=
		din when last_den = '1' and last_dwr = '0' and idx_src = mem_load_dst_idx else
		x"0002" when idx_src = REGID_2 else
		arr_regs(to_integer(idx_src)) when 1 <= idx_src and idx_src <= 11 else
		x"0000";

	alu_op <= 
		std_logic_vector(to_unsigned(OP_ADD, ALUOpLen)) when uop_tail = UOP_ALU_ADD else
		std_logic_vector(to_unsigned(OP_SUB, ALUOpLen)) when uop_tail = UOP_ALU_SUB else
		std_logic_vector(to_unsigned(OP_AND, ALUOpLen)) when uop_tail = UOP_ALU_AND else
		last_inst_buffer(0)(6 downto 2); -- Notes: COPY might not work correctly if it's the first instruction

	alu : entity work.ALU port map (
		a => r_dst,
		b => r_src,
		op => alu_op,
		r => alu_out,
		cmp_signed => uop_tail(0),
		cmp => alu_cmp
	);

	process(clk)
		variable r_write : std_logic;
		variable r_res : TData;
		variable r_idx : unsigned(4-1 downto 0);
		
		type ArrTailCount is array(0 to 1) of TInstBufferIdx;
		variable arg_tails : ArrTailCount;
		variable arg_tail : TInstBufferIdx;
		variable arg_head : TByte;
		variable arg_a : TData;
		variable arg_b : TData;
		variable arg_x : TData;

		variable v_regs : TArrRegs;
		variable v_inst : TInstBuffer;
	begin

		if rising_edge(clk) then
			v_regs := arr_regs;
			if uop_idx = 0 then
				v_inst := inst_buffer;
			else
				v_inst := last_inst_buffer;
			end if;
			last_inst_buffer <= v_inst;

			if last_den = '1' and last_dwr = '0' then
				v_regs(to_integer(mem_load_dst_idx)) := din;
			end if;
			last_den <= den;
			last_dwr <= dwr;

			den <= '0';
			dwr <= '0';
			daddr <= (others => '0');
			dout <= (others => '0');
			
			uop_hold <= '0';
			mmu_cfg_wr <= '0';

			if uop_ready = '1' and uop_hold = '0' then

				r_write := '0';
				case uop_head is
					when UOP_MISC_HEAD =>
						case uop_tail is
							when UOP_NOP => null;
							when UOP_MOV =>
								r_write := '1';
								r_res := r_src;
							when UOP_CON =>
								r_write := '1';
								r_res := uops_consts_rom(to_integer(idx_src));
							when UOP_MMU =>
								mmu_cfg_wr <= '1';
							when others => 
								null;
						end case; -- uop_tail

					when UOP_MEM_HEAD =>
						case uop_tail is
							when UOP_MEM_LOAD =>
								den <= '1';
								dwr <= '0';
								daddr <= r_src;
								mem_load_dst_idx <= idx_dst;
								uop_hold <= '1';
							when UOP_MEM_STORE =>
								den <= '1';
								dwr <= '1';
								daddr <= r_dst;
								dout <= r_src;
							when others => 
								null;
						end case; -- uop_tail

					when UOP_ARG_HEAD =>
						if uop_tail = UOP_ARG_PUT then
							r_write := '1';
							r_res := r_src;
						else
							for i in 0 to 1 loop
								if v_inst(i+1)(7 downto 5) = "111" then
									arg_tails(i) := to_unsigned(2, InstructionIndexWidth);
								elsif v_inst(i+1)(4 downto 2) = "111" then
									arg_tails(i) := to_unsigned(1, InstructionIndexWidth);
								else
									arg_tails(i) := to_unsigned(0, InstructionIndexWidth);
								end if;
							end loop;

							arg_tail := ("000" & inst_nargs) + 1;
							if uop_tail = UOP_ARG_GET_1 or uop_tail = UOP_ARG_GET_2 then
								arg_tail := arg_tail + arg_tails(0);
							end if;
							if uop_tail = UOP_ARG_GET_2 then
								arg_tail := arg_tail + arg_tails(1);
							end if;

							arg_head := v_inst(to_integer(unsigned(uop_tail)));
							if arg_head(7 downto 5) = "111" then
								arg_a := v_inst(to_integer(arg_tail)+1) & v_inst(to_integer(arg_tail));
							elsif arg_head(7 downto 5) = "000" then
								arg_a := x"0000";
							else
								arg_a := v_regs(to_integer(unsigned(arg_head(7 downto 5))));
							end if;
							if arg_head(4 downto 2) = "111" then
								arg_b := x"00" & v_inst(to_integer(arg_tail));
							elsif arg_head(4 downto 2) = "000" then
								arg_b := x"0000";
							else
								arg_b := v_regs(to_integer(unsigned(arg_head(4 downto 2))));
							end if;
							arg_a := arg_a sll to_integer(unsigned(arg_head(1 downto 0)));

							r_write := '1';
							r_res := std_logic_vector(unsigned(arg_a) + unsigned(arg_b));
						end if;

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
						r_idx := to_unsigned(REGID_FL, 4);
					elsif uop_head = UOP_ARG_HEAD and uop_tail = UOP_ARG_PUT then
						r_idx := "0" & unsigned(v_inst(1)(7 downto 5)); -- first arg of instruction
					else 
						r_idx := unsigned(uop(7 downto 4));
					end if;
					v_regs(to_integer(r_idx)) := r_res;
				end if; -- r_write

				if uop_done = '1' and not (r_write = '1' and r_idx = REGID_PC) then
					v_regs(REGID_PC) :=	std_logic_vector(unsigned(v_regs(REGID_PC)) + inst_len);
				end if;

			end if; -- uop_ready

			arr_regs <= v_regs;
		end if; -- rising_edge(clk)

	end process; -- process(clk)

	-- export registers
	reg_a <=  arr_regs(REGID_A);
	reg_b <=  arr_regs(REGID_B);
	reg_c <=  arr_regs(REGID_C);
	reg_d <=  arr_regs(REGID_D);
	reg_e <=  arr_regs(REGID_E);
	reg_sp <= arr_regs(REGID_SP);
	reg_pc <= arr_regs(REGID_PC);
	reg_fl <= arr_regs(REGID_FL);
	reg_e <=  arr_regs(REGID_E);
	reg_f <=  arr_regs(REGID_F);
	reg_g <=  arr_regs(REGID_G);
	reg_h <=  arr_regs(REGID_H);

end Behavioral;
