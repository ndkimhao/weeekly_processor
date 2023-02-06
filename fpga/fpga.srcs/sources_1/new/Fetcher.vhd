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
		dvalid: in std_logic; -- allow to read din in the next cycle

		avail : out TInstBufferIdx;
		inst_buffer : out TInstBuffer;
		inst_pc : out TAddr;

		dec_done : in std_logic;
		dec_inst_len : in TInstBufferIdx
	);
end Fetcher;

architecture Behavioral of Fetcher is

signal s_old_pc : TAddr;
signal last_dwant : std_logic;
signal last_dvalid : std_logic;
signal last_diff_pc : std_logic;

begin

	process (clk, reset)
		variable diff_pc : unsigned(AddrWidth-1 downto 0);
		variable new_avail, lookahead : TInstBufferIdx;
		variable new_inst : TInstBuffer;
		variable virt_pc : TAddr;
	begin	
		if reset = '1' then
			dwant <= '0';
			daddr <= (others => '0');
			avail <= (others => '0');
			s_old_pc <= (others => '0');
			
			last_dwant <= '0';
			last_dvalid <= '0';
			last_diff_pc <= '0';
		elsif rising_edge(clk) then
			virt_pc := pc;
			if dec_done = '1' then
				virt_pc := std_logic_vector(unsigned(virt_pc) + dec_inst_len);
			end if;

			new_inst := inst_buffer;
			diff_pc := unsigned(virt_pc) - unsigned(s_old_pc);
			s_old_pc <= virt_pc;
			if diff_pc < avail then -- avail <= 17, so 0 <= diff_pc <= 16
--				for i in 0 to MaxInstructionLen-1 loop
--					if i + diff_pc <= MaxInstructionLen then
--						new_inst(i) := new_inst(i + to_integer(diff_pc));
--					end if;
--				end loop;
				case diff_pc is  -- avail <= 17, so 0 <= diff_pc <= 16
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
					when to_unsigned(11, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-11) := new_inst(11 to MaxInstructionLen);
					when to_unsigned(12, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-12) := new_inst(12 to MaxInstructionLen);
					when to_unsigned(13, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-13) := new_inst(13 to MaxInstructionLen);
					when to_unsigned(14, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-14) := new_inst(14 to MaxInstructionLen);
					when to_unsigned(15, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-15) := new_inst(15 to MaxInstructionLen);
					when to_unsigned(16, AddrWidth) =>
						new_inst(0 to MaxInstructionLen-16) := new_inst(16 to MaxInstructionLen);
					when others =>
						null;
				end case;
				new_avail := avail - diff_pc(4 downto 0);
			else
				new_avail := (others => '0');
			end if;

			if last_dwant = '1' and last_dvalid = '1' and diff_pc = 0 and last_diff_pc = '0' then
				new_inst(to_integer(new_avail)) := din(7 downto 0);
				new_inst(to_integer(new_avail) + 1) := din(15 downto 8);
				new_avail := new_avail + 2;
			end if;

			if dwant = '1' and dvalid = '1' and diff_pc = 0 then
				lookahead := new_avail + 2;
			else
				lookahead := new_avail;
			end if;

			if lookahead < MaxInstructionLen then
				dwant <= '1';
				daddr <= std_logic_vector(unsigned(virt_pc) + lookahead);
			else
				dwant <= '0';
				daddr <= (others => '0');
			end if;

			last_dwant <= dwant;
			last_dvalid <= dvalid;
			if diff_pc = 0 then
				last_diff_pc <= '0';
			else
				last_diff_pc <= '1';
			end if;

			avail <= new_avail;
			inst_buffer <= new_inst;
			inst_pc <= virt_pc;
		end if; -- rising_edge(clk)
	end process;


end Behavioral;
