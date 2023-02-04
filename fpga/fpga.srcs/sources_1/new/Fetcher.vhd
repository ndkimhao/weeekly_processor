library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Fetcher is
	port (
		clk : in std_logic;
		reset : in std_logic;

		pc : in TAddr; -- current program counter
		dwant : out std_logic; -- want to read
		daddr : out TAddr;
		din   : in TData;
		dvalid: in std_logic; -- din is valid
		
		ready : out std_logic; -- instruction is ready
		inst  : out TInstBuffer
	);
end Fetcher;

architecture Behavioral of Fetcher is

constant SizeW : Integer := 4;
constant NArgsW : Integer := 2;
constant OpW : Integer := 6;
subtype TSize is unsigned(SizeW-1 downto 0); -- in multiples of 2

signal a_inst : TInstBuffer;
signal s_size, s_need : TSize;

begin

	process (clk, reset)
	variable op : unsigned(OpW-1 downto 0);
	variable size, need : TSize;
	variable nargs : unsigned(NArgsW-1 downto 0);
	begin
	
		if reset = '1' then
			size := to_unsigned(0, SizeW);
			need := to_unsigned(MaxInstructionLen, SizeW);
		elsif rising_edge(clk) then
			size := s_size;
			need := s_need;

			if dwant and dvalid then
				a_inst(to_integer(size & '0')) <= din(7 downto 0);
				a_inst(to_integer(size & '1')) <= din(15 downto 8);
				size := size + 2;
			end if;

			if size = 0 then
				need := to_unsigned(2, SizeW); -- read 2 bytes first
			else -- size > 0
				op := unsigned(a_inst(0)(7 downto 2));
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

				need := ("00" & nargs) + to_unsigned(1, SizeW);
			end if; -- size > 0

			if size >= need then
			
			end if;

		end if;
	
		s_size <= size;
		s_need <= need;
		ready <= '1' when size >= need else '0';
		if size <= MaxInstructionLen-2 then -- don't read if there's only one empty slot left
			dwant <= '1';
			daddr <= std_logic_vector(unsigned(pc) + size);
		else
			dwant <= '0';
			daddr <= (others => '0');
		end if;
	end process;

end Behavioral;
