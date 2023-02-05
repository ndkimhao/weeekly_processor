library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Fetcher is
	port (
		clk : in std_logic;
		reset : in std_logic;

		pc : in TAddr; -- program counter
		dwant : out std_logic; -- want to read
		daddr : out TAddr;
		din   : in TData;
		dvalid: in std_logic; -- din is valid

		avail : out TInstBufferIdx;
		inst_buffer : out TInstBuffer
	);
end Fetcher;

architecture Behavioral of Fetcher is

constant SizeW : Integer := 4;
constant NArgsW : Integer := 2;
constant OpW : Integer := 6;
subtype TSize is unsigned(SizeW-1 downto 0); -- in multiples of 2

signal s_inst : TInstBuffer;
signal s_old_pc : TAddr;

signal s_allow_read : std_logic;
signal s_want : std_logic;

begin

	process (clk, reset)
		variable diff_pc : unsigned(AddrWidth-1 downto 0);
		variable new_avail, lookahead : TInstBufferIdx;
		variable new_inst : TInstBuffer;
	begin	
		if reset = '1' then
			dwant <= '0';
			daddr <= (others => '0');
			avail <= (others => '0');
			s_old_pc <= (others => '0');
			s_allow_read <= '0';
			s_want <= '0';
		elsif rising_edge(clk) then

			new_avail := avail;
			new_inst := inst_buffer;

			diff_pc := unsigned(pc) - unsigned(s_old_pc);
			if diff_pc < new_avail then -- avail <= 11, so diff_pc <= 10
				case diff_pc is
					when to_unsigned(1, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-1) := new_inst(1 to MaxInstructionLen);
					when to_unsigned(2, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-2) := new_inst(2 to MaxInstructionLen);
					when to_unsigned(3, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-3) := new_inst(3 to MaxInstructionLen);
					when to_unsigned(4, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-4) := new_inst(4 to MaxInstructionLen);
					when to_unsigned(5, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-5) := new_inst(5 to MaxInstructionLen);
					when to_unsigned(6, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-6) := new_inst(6 to MaxInstructionLen);
					when to_unsigned(7, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-7) := new_inst(7 to MaxInstructionLen);
					when to_unsigned(8, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-8) := new_inst(8 to MaxInstructionLen);
					when to_unsigned(9, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-9) := new_inst(9 to MaxInstructionLen);
					when to_unsigned(10, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-10) := new_inst(10 to MaxInstructionLen);
					when others =>
						null;
				end case;
				new_avail := new_avail - diff_pc(3 downto 0);
			else
				new_avail := (others => '0');
			end if;

			s_old_pc <= pc;

			if s_allow_read = '1' and diff_pc = 0 then -- allow read in previous cycle
				new_inst(to_integer(new_avail)) := din(7 downto 0);
				new_inst(to_integer(new_avail) + 1) := din(15 downto 8);
				new_avail := new_avail + 2;
			end if;

			avail <= new_avail;
			inst_buffer <= new_inst;
			
			if s_want = '1' and dvalid = '1' and diff_pc = 0 then
				s_allow_read <= '1';
				lookahead := to_unsigned(2, 4);
			else
				s_allow_read <= '0';
				lookahead := to_unsigned(0, 4);
			end if;
			s_want <= dwant;

			lookahead := new_avail + lookahead;
			if lookahead < MaxInstructionLen then
				dwant <= '1';
				daddr <= std_logic_vector(unsigned(pc) + lookahead);
			else
				if dwant = '0' then
					s_allow_read <= '0';
				end if;
				dwant <= '0';
				daddr <= (others => '0');
			end if;
		end if; -- rising_edge(clk)
	end process;


end Behavioral;
