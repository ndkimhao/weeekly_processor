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

	cmp(FLAGID_EQ) <= '1' when ua = ub else '0'; -- EQ
	cmp(FLAGID_NE) <= not cmp(FLAGID_EQ); -- NE
	cmp(FLAGID_LT) <= '1' when (cmp_signed = '0' and ua < ub) or
							 (cmp_signed = '1' and sa < sb)
					else '0';
	cmp(FLAGID_LE) <= cmp(FLAGID_EQ) or cmp(FLAGID_LT);
	cmp(FLAGID_GT) <= not cmp(FLAGID_LE);
	cmp(FLAGID_GE) <= not cmp(FLAGID_LT);

end Behavioral;
