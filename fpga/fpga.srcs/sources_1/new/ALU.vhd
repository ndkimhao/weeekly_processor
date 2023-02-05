library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity ALU is
	port (
		a : in TData;
		b : in TData;
		op : in std_logic_vector(ALUOpLen-1 downto 0);
		r : out TData;
		cmp_signed : in std_logic;
		-- GE GT LE LT NE EQ
		cmp : out std_logic_vector(AluNumFLags-1 downto 0)
	);
end ALU;

architecture Behavioral of ALU is

signal ua, ub, ur: unsigned(DataWidth-1 downto 0);
signal sa, sb: signed(DataWidth-1 downto 0);
signal o : unsigned(ALUOpLen-1 downto 0);

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

	cmp(FLAG_EQ) <= '1' when ua = ub else '0'; -- EQ
	cmp(FLAG_NE) <= not cmp(FLAG_EQ); -- NE
	cmp(FLAG_LT) <= '1' when (cmp_signed = '0' and ua < ub) or
							 (cmp_signed = '1' and sa < sb)
					else '0';
	cmp(FLAG_LE) <= cmp(FLAG_EQ) or cmp(FLAG_LT);
	cmp(FLAG_GT) <= not cmp(FLAG_LE);
	cmp(FLAG_GE) <= not cmp(FLAG_LT);

end Behavioral;
