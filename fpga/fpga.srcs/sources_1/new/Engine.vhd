library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;
use work.UopROM.all;

entity Engine is
	port (
		clk : in std_logic;
		reset : in std_logic;

		uop_ready : in std_logic;
		uop_hold : out std_logic; -- pause uop decode
		uop : in TUop;
		uop_done : in std_logic; -- last uop of the current instruction
		uop_idx : in TUopIndex;
		inst_buffer : in TEngineInstBuffer;
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
		reg_x : out TData;
		reg_y : out TData;
		reg_z : out TData;
		reg_k : out TData
	);
end Engine;

architecture Behavioral of Engine is

-- '0', 'A', 'B', 'C', 'D', 'SP', 'PC', 'FL',
-- 'X', 'Y', 'Z', 'K', '2', 'NPC', '', ''
--   NPC is the next program counter
type TArrRegs is array(1 to 11) of TData;
signal arr_regs : TArrRegs;

-- 'E', 'F', 'G', 'H'
type TArrAuxRegs is array(0 to 3) of TData;
signal arr_aux_regs : TArrAuxRegs;

signal idx_dst, idx_src : unsigned(4-1 downto 0);
signal r_dst, r_src : TData;

signal uop_head : std_logic_vector(UcodeHeadLen-1 downto 0);
signal uop_tail : std_logic_vector(UcodeTailLen-1 downto 0);

signal alu_op : std_logic_vector(ALUOpLen-1 downto 0);
signal alu_out, alu_aux : TData;
signal alu_cmp : std_logic_vector(AluNumFLags-1 downto 0);
signal alu_cmp_signed : std_logic;
signal alu_start_op : std_logic;
signal alu_div_done : std_logic;

signal fl_selector : unsigned(ALUOpLen-1 downto 0);
signal fl_bit : std_logic;

signal last_inst_buffer : TEngineInstBuffer;
signal inst_opcode : TByte;
signal next_pc : TData;

signal cached_uop : TUop;
signal effective_uop : TUop;

constant HoldCounterW : integer := 5;
signal hold_counter : unsigned(HoldCounterW-1 downto 0);

begin

	next_pc <= std_logic_vector(unsigned(arr_regs(REGID_PC)) + inst_len);

	inst_opcode <=
		inst_buffer(0) when uop_idx = 0 else
		last_inst_buffer(0);
	
	effective_uop <= cached_uop when hold_counter /= 0 else uop;

	uop_head <= effective_uop(12 downto 10);
	uop_tail <= effective_uop(9 downto 8);

	idx_dst <= unsigned(effective_uop(7 downto 4));
	idx_src <= unsigned(effective_uop(3 downto 0));
	
	r_dst <=
		arr_regs(to_integer(idx_dst)) when 1 <= idx_dst and idx_dst <= 11 else
		x"0000";

	r_src <=
		x"0002" when idx_src = REGID_2 else
		arr_regs(to_integer(idx_src)) when 1 <= idx_src and idx_src <= 11 else
		next_pc when idx_src = REGID_NPC else
		x"0000";

	alu_op <= 
		std_logic_vector(to_unsigned(OP_ADD, ALUOpLen)) when uop_tail = UOP_ALU_ADD else
		std_logic_vector(to_unsigned(OP_SUB, ALUOpLen)) when uop_tail = UOP_ALU_SUB else
		std_logic_vector(to_unsigned(OP_AND, ALUOpLen)) when uop_tail = UOP_ALU_AND else
		inst_opcode(6 downto 2); -- OP_COPY

	alu_cmp_signed <=
		'1' when uop_tail = UOP_CMP_SIGNED else
		'0' when uop_tail = UOP_CMP_UNSIGNED else
		inst_opcode(7); -- OP_COPY

	fl_selector <=
		to_unsigned(OP_JEQ, ALUOpLen) when uop_tail = UOP_CMV_EQ else
		to_unsigned(OP_JLT, ALUOpLen) when uop_tail = UOP_CMV_LT else
		to_unsigned(OP_JLE, ALUOpLen) when uop_tail = UOP_CMV_LE else
		unsigned(inst_opcode(6 downto 2)); -- OP_COPY

	fl_bit <=
		arr_regs(REGID_FL)(FLAGID_EQ) when fl_selector = OP_JEQ else
		arr_regs(REGID_FL)(FLAGID_NE) when fl_selector = OP_JNE else
		arr_regs(REGID_FL)(FLAGID_LT) when fl_selector = OP_JLT else
		arr_regs(REGID_FL)(FLAGID_LE) when fl_selector = OP_JLE else
		arr_regs(REGID_FL)(FLAGID_GT) when fl_selector = OP_JGT else
		arr_regs(REGID_FL)(FLAGID_GE) when fl_selector = OP_JGE else
		'0';

	alu : entity work.ALU port map (
		clk => clk,
		a => r_dst,
		b => r_src,
		op => alu_op,
		r => alu_out,
		aux => alu_aux,
		cmp_signed => alu_cmp_signed,
		cmp => alu_cmp,
		start_op => alu_start_op,
		div_done => alu_div_done
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

		variable v_inst : TEngineInstBuffer;
	begin

		if rising_edge(clk) then
			if reset = '1' then
				den <= '0';
				dwr <= '0';
				daddr <= (others => '0');
				dout <= (others => '0');
				
				uop_hold <= '0';
				mmu_cfg_wr <= '0';
				hold_counter <= (others => '0');
				alu_start_op <= '0';
			else
		
				if uop_idx = 0 then
					v_inst := inst_buffer;
				else
					v_inst := last_inst_buffer;
				end if;
				last_inst_buffer <= v_inst;
	
				if hold_counter = 0 then
					cached_uop <= uop;
				end if;
	
				den <= '0';
				dwr <= '0';
				daddr <= (others => '0');
				dout <= (others => '0');
				
				uop_hold <= '0';
				mmu_cfg_wr <= '0';
				hold_counter <= (others => '0');
				alu_start_op <= '0';
	
				if uop_ready = '1' and (uop_hold = '0' or hold_counter /= 0) then
	
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
									uop_hold <= '1';
								when others => 
									null;
							end case; -- uop_tail
	
						when UOP_MEM_HEAD =>
							case uop_tail is
								when UOP_MEM_LOAD =>
									r_write := '1';
									r_res := din;
									if hold_counter = 0 then -- first cycle
										den <= '1';
										dwr <= '0';
										daddr <= r_src;
										uop_hold <= '1';
										hold_counter <= to_unsigned(2, HoldCounterW);
									else
										if hold_counter /= 1 then
											uop_hold <= '1';
										end if;
										hold_counter <= hold_counter - 1;
									end if;
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
								if v_inst(1)(7 downto 2) = "111111" then -- if aux reg
									arr_aux_regs(to_integer(unsigned(v_inst(1)(1 downto 0)))) <= r_src;
								else
									r_write := '1';
									r_res := r_src;
								end if;
							else
								for i in 0 to 1 loop
									if v_inst(i+1)(7 downto 2) = "111111" then -- if aux reg
										arg_tails(i) := to_unsigned(0, InstructionIndexWidth);
									elsif v_inst(i+1)(7 downto 5) = "111" then
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
								if arg_head(7 downto 2) = "111111" then -- if aux reg
									arg_a := arr_aux_regs(to_integer(unsigned(arg_head(1 downto 0))));
									arg_b := (others => '0');
								else -- not aux reg
									if arg_head(7 downto 5) = "111" then
										arg_a := v_inst(to_integer(arg_tail)+1) & v_inst(to_integer(arg_tail));
									elsif arg_head(7 downto 5) = "000" then
										arg_a := x"0000";
									else
										arg_a := arr_regs(to_integer(unsigned(arg_head(7 downto 5))));
									end if;
									if arg_head(4 downto 2) = "111" then
										if v_inst(to_integer(arg_tail))(7) = '0' then -- sign check
											arg_b := x"00" & v_inst(to_integer(arg_tail));
										else
											arg_b := x"FF" & v_inst(to_integer(arg_tail));
										end if;
									elsif arg_head(4 downto 2) = "000" then
										arg_b := x"0000";
									else
										arg_b := arr_regs(to_integer(unsigned(arg_head(4 downto 2))));
									end if;
									if arg_head(1 downto 0) /= "00" then
										arg_a := arg_a sll (to_integer(unsigned(arg_head(1 downto 0))) - 1);
									end if;
								end if; -- else not aux reg
	
								r_write := '1';
								r_res := std_logic_vector(unsigned(arg_a) + unsigned(arg_b));
							end if;
	
						when UOP_ALU_HEAD =>
							r_write := '1';
							r_res := alu_out;
							if unsigned(alu_op) = OP_MUL or unsigned(alu_op) = OP_IMUL or
							   unsigned(alu_op) = OP_DIV or unsigned(alu_op) = OP_IDIV then
	
								if hold_counter = 0 then
									if unsigned(alu_op) = OP_MUL or unsigned(alu_op) = OP_IMUL then
										hold_counter <= to_unsigned(4, HoldCounterW);
									else
										hold_counter <= to_unsigned(31, HoldCounterW);
										alu_start_op <= '1';
									end if;
									uop_hold <= '1';
								else
									hold_counter <= hold_counter - 1;
									if hold_counter = 1 or alu_div_done = '1' then
										uop_hold <= '0';
										arr_aux_regs(AUXREGID_H) <= alu_aux;
										hold_counter <= (others => '0');
									else
										uop_hold <= '1';
									end if;
								end if; -- if hold_counter

							end if; -- if OP_MUL or OP_DIV
	
						when UOP_CMP_HEAD =>
							r_write := '1';
							r_res := 10x"0000" & alu_cmp;
	
						when UOP_CMV_HEAD =>
							if fl_bit = '1' then
								r_write := '1';
								r_res := r_src;
							end if;
	
						when others =>
							null;
					end case; -- uop_head
	
					if r_write = '1' then
						if uop_head = UOP_CMP_HEAD then
							r_idx := to_unsigned(REGID_FL, 4);
						elsif uop_head = UOP_ARG_HEAD and uop_tail = UOP_ARG_PUT then
							r_idx := "0" & unsigned(v_inst(1)(7 downto 5)); -- first arg of instruction
						else 
							r_idx := idx_dst;
						end if;
						arr_regs(to_integer(r_idx)) <= r_res;
					end if; -- r_write
	
					if uop_hold = '0' and uop_done = '1' and not (r_write = '1' and r_idx = REGID_PC) then
						arr_regs(REGID_PC) <= next_pc;
					end if;
	
				end if; -- uop_ready
		
			end if; -- reset = '1'

		end if; -- rising_edge(clk)

	end process; -- process(clk)

	-- export registers
	reg_a <=  arr_regs(REGID_A);
	reg_b <=  arr_regs(REGID_B);
	reg_c <=  arr_regs(REGID_C);
	reg_d <=  arr_regs(REGID_D);
	reg_sp <= arr_regs(REGID_SP);
	reg_pc <= arr_regs(REGID_PC);
	reg_fl <= arr_regs(REGID_FL);
	reg_x <=  arr_regs(REGID_X);
	reg_y <=  arr_regs(REGID_Y);
	reg_z <=  arr_regs(REGID_Z);
	reg_k <=  arr_regs(REGID_K);

end Behavioral;
