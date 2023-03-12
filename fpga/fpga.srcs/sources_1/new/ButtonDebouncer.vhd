library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity ButtonDebouncer is
	generic (
		N : integer := 16
	);
	port (
		clk : in std_logic;
		btn_in : in std_logic_vector(N-1 downto 0);
		debounced_out : out std_logic_vector(N-1 downto 0)
	);
end ButtonDebouncer;

architecture Behavioral of ButtonDebouncer is

constant CNT_W : integer := 16;
subtype CounterType is unsigned(CNT_W-1 downto 0);
constant CNT_MAX : CounterType := to_unsigned(60000, CNT_W); -- 60Mhz => 1ms delay

signal cnt : CounterType;
signal s_debounced : std_logic_vector(N-1 downto 0) := (others => '0');

begin
	debounced_out <= s_debounced;

	process(clk)
	begin
		if rising_edge(clk) then
			
			if cnt = 0 then
		
				if btn_in /= s_debounced then
					s_debounced <= btn_in;
					cnt <= CNT_MAX;
				end if; -- btn_in /= last_btn_in
			
			else
				
				cnt <= cnt - 1;
				
			end if; -- cnt
			
		end if;
	end process;

end Behavioral;
