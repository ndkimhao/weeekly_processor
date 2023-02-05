library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity Fetcher_tb is
end Fetcher_tb;

architecture Behavioral of Fetcher_tb is

signal clk  : std_logic;
signal reset: std_logic;
signal r_en   : std_logic := '0';
signal r_wr   : std_logic := '0';
signal r_addr : TPhyAddr := (others => '0');
signal m_din  : TData := (others => '0');
signal r_dout : TData := (others => '0');

signal pc : TAddr; -- program counter
signal f_dwant : std_logic; -- want to read
signal f_daddr : TAddr;
signal f_dvalid: std_logic; -- din is valid

signal f_avail : TInstBufferIdx;
signal f_inst : TInstBuffer;

signal m_en : std_logic;
signal m_wr : std_logic;
signal m_addr : TAddr;

signal req_m_en : std_logic;

begin

	ram : entity work.RAM port map (
		clk  => clk,
		en   => r_en, 
		wr   => r_wr,
		addr => r_addr,
		din  => m_din,
		dout => r_dout
	);
	
	fetcher : entity work.Fetcher port map (
		clk => clk,
		reset => reset,
		pc => pc, -- program counter
		dwant => f_dwant, -- want to read
		daddr => f_daddr,
		din => r_dout,
		dvalid => f_dvalid,
		avail => f_avail,
		inst_buffer => f_inst
	);

	r_en <= m_en or f_dwant;
	r_wr <= m_en and m_wr; -- fetcher always read
	r_addr <= x"00" & m_addr when m_en = '1' else x"00" & f_daddr;
	f_dvalid <= not m_en;

	process -- clock
	begin
		clk <= '0'; wait for 500ns;
		clk <= '1'; wait for 500ns;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			m_en <= req_m_en;
		end if;
	end process;

	process -- test
	begin
		pc <= x"1000";
		req_m_en <= '1';
		reset <= '1'; wait for 1us;
		reset <= '0'; wait for 1us;
		
		m_wr <= '1';
		m_addr <= x"1000"; m_din <= x"0100"; wait for 1us;
		m_addr <= x"1002"; m_din <= x"0302"; wait for 1us;
		m_addr <= x"1004"; m_din <= x"0504"; wait for 1us;
		m_addr <= x"1006"; m_din <= x"0706"; wait for 1us;
		m_addr <= x"1008"; m_din <= x"0908"; wait for 1us;
		m_addr <= x"100A"; m_din <= x"0B0A"; wait for 1us;
		m_addr <= x"100C"; m_din <= x"0D0C"; wait for 1us;
		m_addr <= x"100E"; m_din <= x"0F0E"; wait for 1us;
		m_addr <= x"1010"; m_din <= x"A1A0"; wait for 1us;
		m_addr <= x"1012"; m_din <= x"A3A2"; wait for 1us;
		m_addr <= x"1014"; m_din <= x"A5A4"; wait for 1us;
		
		m_wr <= '0';
		req_m_en <= '0';
		m_addr <= x"FF00"; m_din <= x"CCCC"; wait for 1us;

		wait for 8us;
		pc <= x"1002";

		wait for 3us;
		pc <= x"1005";

		wait for 4us;
		pc <= x"1001";

		wait for 3us;
		req_m_en <= '1';
		wait for 4us;
		req_m_en <= '0';

		wait for 3us;
		pc <= x"1000";
		wait for 2us;
		pc <= x"1006";

		wait for 10us;

		wait for 1us;
		std.env.finish;
	end process;
end Behavioral;
