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

		dec_inst_len : in TInstBufferIdx
	);
end Fetcher;

architecture Behavioral of Fetcher is

signal s_old_pc : TAddr;
signal last_dwant : std_logic;
signal last_dvalid : std_logic;
signal last_diff_pc : std_logic;

signal s_inst_buffer : TFetcherInstBuffer;
signal s_start_buffer : TInstBufferIdx;
signal s_avail : TFetcherBufferIdx;

begin

	gen_inst_out : for i in 0 to MaxInstructionLen-1 generate
		inst_buffer(i) <= s_inst_buffer(to_integer(s_start_buffer + i));
	end generate gen_inst_out;

	avail <= to_unsigned(MaxInstructionLen, InstructionIndexWidth) when s_avail >= MaxInstructionLen else
			s_avail(InstructionIndexWidth-1 downto 0);

	process (clk)
		variable diff_pc : unsigned(AddrWidth-1 downto 0);
		variable new_avail, lookahead : TFetcherBufferIdx;
		variable virt_pc : TAddr;
		variable new_start_buffer : TInstBufferIdx;
		variable write_idx_0, write_idx_1 : TInstBufferIdx;
	begin	
		if rising_edge(clk) then
			if reset = '1' then
				dwant <= '0';
				daddr <= (others => '0');
				s_avail <= (others => '0');
				s_old_pc <= (others => '0');
				
				last_dwant <= '0';
				last_dvalid <= '0';
				last_diff_pc <= '0';
				
				s_start_buffer <= (others => '0');
			else -- reset = '0'
				virt_pc := std_logic_vector(unsigned(pc) + dec_inst_len);
				diff_pc := unsigned(virt_pc) - unsigned(s_old_pc);
				s_old_pc <= virt_pc;
				if diff_pc < s_avail then
					new_start_buffer := s_start_buffer + diff_pc(InstructionIndexWidth-1 downto 0);
					new_avail := s_avail - diff_pc(InstructionIndexWidth-1 downto 0);
				else
					new_start_buffer := (others => '0');
					new_avail := (others => '0');
				end if;
				s_start_buffer <= new_start_buffer;
	
				if last_dwant = '1' and last_dvalid = '1' and diff_pc = 0 and last_diff_pc = '0' then
					write_idx_0 := new_start_buffer + new_avail(InstructionIndexWidth-1 downto 0);
					write_idx_1 := write_idx_0 + 1;
					s_inst_buffer(to_integer(write_idx_0)) <= din(7 downto 0);
					s_inst_buffer(to_integer(write_idx_1)) <= din(15 downto 8);
					new_avail := new_avail + 2;
				end if;
	
				if dwant = '1' and dvalid = '1' and diff_pc = 0 then
					lookahead := new_avail + 2;
				else
					lookahead := new_avail;
				end if;
	
				if lookahead <= FetcherBufferSize-2 then
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
	
				s_avail <= new_avail;
				inst_pc <= virt_pc;
			end if; -- reset = '0'
		end if; -- rising_edge(clk)
	end process;


end Behavioral;
