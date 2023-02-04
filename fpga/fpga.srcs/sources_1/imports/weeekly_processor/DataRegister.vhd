library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity DataRegister is
    generic (
		N : integer := DataWidth
    );

    port (
		clk : in std_logic;
		reset : in std_logic;
		write : in std_logic;
		D : in std_logic_vector (N-1 downto 0);
		Q : out std_logic_vector (N-1 downto 0)
    );
end DataRegister;

architecture Behavioral of DataRegister is

signal procQ : std_logic_vector (N-1 downto 0);

begin
	
	Q <= procQ;
	
	process (clk, reset)
	begin
	
		if reset = '1' then
			procQ <= (others => '0');
		elsif rising_edge(clk) and write = '1' then
			procQ <= D;
		end if;

	end process;

end Behavioral;
