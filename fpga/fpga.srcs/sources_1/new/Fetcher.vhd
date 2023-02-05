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
				for i in 0 to MaxInstructionLen-1 loop
					if i + diff_pc <= MaxInstructionLen then
						new_inst(i) := new_inst(i + to_integer(diff_pc));
					end if;
				end loop;
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
