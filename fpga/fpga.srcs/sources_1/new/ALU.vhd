library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity ALU is
	port (
		clk : in std_logic;

		a : in TData;
		b : in TData;
		op : in std_logic_vector(ALUOpLen-1 downto 0);
		r : out TData;
		aux : out TData;
		cmp_signed : in std_logic;
		-- GE GT LE LT NE EQ
		cmp : out std_logic_vector(AluNumFLags-1 downto 0);
		
		start_op : in std_logic;
		div_done : out std_logic := '0'
	);
end ALU;

architecture Behavioral of ALU is


component mult_signed_16
	port (
		clk : in std_logic;
		a : in std_logic_vector(15 downto 0);
		b : in std_logic_vector(15 downto 0);
		p : out std_logic_vector(31 downto 0)
	);
end component;

component mult_unsigned_16
	port (
		clk : in std_logic;
		a : in std_logic_vector(15 downto 0);
		b : in std_logic_vector(15 downto 0);
		p : out std_logic_vector(31 downto 0)
	);
end component;

component div_signed_16
	port (
		aclk : in std_logic;
		s_axis_divisor_tvalid : in std_logic;
		s_axis_divisor_tdata : in std_logic_vector(15 downto 0);
		s_axis_dividend_tvalid : in std_logic;
		s_axis_dividend_tdata : in std_logic_vector(15 downto 0);
		m_axis_dout_tvalid : out std_logic;
		m_axis_dout_tdata : out std_logic_vector(31 downto 0)
	);
end component;

component div_unsigned_16
	port (
		aclk : in std_logic;
		s_axis_divisor_tvalid : in std_logic;
		s_axis_divisor_tdata : in std_logic_vector(15 downto 0);
		s_axis_dividend_tvalid : in std_logic;
		s_axis_dividend_tdata : in std_logic_vector(15 downto 0);
		m_axis_dout_tvalid : out std_logic;
		m_axis_dout_tdata : out std_logic_vector(31 downto 0)
	);
end component;

signal ua, ub, ur: unsigned(DataWidth-1 downto 0);
signal sa, sb: signed(DataWidth-1 downto 0);
signal o : unsigned(ALUOpLen-1 downto 0);

signal uprod, sprod, udiv, sdiv : std_logic_vector(DataWidth*2-1 downto 0);
signal udiv_done, sdiv_done : std_logic;

begin

	ua <= unsigned(a);
	ub <= unsigned(b);
	sa <= signed(a);
	sb <= signed(b);
	o <= unsigned(op);
	r <= std_logic_vector(ur);
	
	ur <=
		-- 2 args
		ua + ub when o = OP_ADD else
		ua - ub when o = OP_SUB else
		unsigned(uprod(DataWidth-1 downto 0)) when o = OP_MUL else
		unsigned(sprod(DataWidth-1 downto 0)) when o = OP_IMUL else
		unsigned(udiv(DataWidth-1 downto 0)) when o = OP_DIV else
		unsigned(sdiv(DataWidth-1 downto 0)) when o = OP_IDIV else
		ua srl to_integer(ub(3 downto 0)) when o = OP_SHR else
		ua sra to_integer(ub(3 downto 0)) when o = OP_ISHR else
		ua sll to_integer(ub(3 downto 0)) when o = OP_SHL else
		ua and ub when o = OP_AND else
		ua or ub when o = OP_OR else
		ua xor ub when o = OP_XOR else
		-- 1 arg
		unsigned(-sa) when o = OP_NEG else
		not ua when o = OP_NOT else
		x"0001" when o = OP_BOOL and ua /= x"0000" else -- else 0 by default
		ua + 1 when o = OP_INC else
		ua - 1 when o = OP_DEC else
		x"0000";

	aux <=
		uprod(DataWidth*2-1 downto DataWidth) when o = OP_MUL else
		sprod(DataWidth*2-1 downto DataWidth) when o = OP_IMUL else
		udiv(DataWidth*2-1 downto DataWidth) when o = OP_DIV else
		sdiv(DataWidth*2-1 downto DataWidth) when o = OP_IDIV else
		x"0000";

	cmp(FLAGID_EQ) <= '1' when ua = ub else '0'; -- EQ
	cmp(FLAGID_NE) <= not cmp(FLAGID_EQ); -- NE
	cmp(FLAGID_LT) <= '1' when (cmp_signed = '0' and ua < ub) or
							 (cmp_signed = '1' and sa < sb)
					else '0';
	cmp(FLAGID_LE) <= cmp(FLAGID_EQ) or cmp(FLAGID_LT);
	cmp(FLAGID_GT) <= not cmp(FLAGID_LE);
	cmp(FLAGID_GE) <= not cmp(FLAGID_LT);

	unsigned_mult : mult_unsigned_16 port map (
		clk => clk,
		a => a,
		b => b,
		p => uprod
	);

	signed_mult : mult_signed_16 port map (
		clk => clk,
		a => a,
		b => b,
		p => sprod
	);
	
--	unsigned_div : div_unsigned_16 port map (
--		aclk => clk,
--		s_axis_divisor_tvalid => start_op,
--		s_axis_divisor_tdata => b,
--		s_axis_dividend_tvalid => start_op,
--		s_axis_dividend_tdata => a,
--		m_axis_dout_tvalid => udiv_done,
--		m_axis_dout_tdata => udiv
--	);

--	signed_div : div_signed_16 port map (
--		aclk => clk,
--		s_axis_divisor_tvalid => start_op,
--		s_axis_divisor_tdata => b,
--		s_axis_dividend_tvalid => start_op,
--		s_axis_dividend_tdata => a,
--		m_axis_dout_tvalid => sdiv_done,
--		m_axis_dout_tdata => sdiv
--	);
	
	div_done <= 
		udiv_done when o = OP_DIV else
		sdiv_done when o = OP_IDIV else
		'0';

end Behavioral;
