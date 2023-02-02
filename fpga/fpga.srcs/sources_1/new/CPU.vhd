library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity CPU is
	port (
		den  : out std_logic;
		dwr  : out std_logic;
		daddr: out TAddr;
		din  : in  TData;
		dout : out TData
	);
end CPU;

architecture Behavioral of CPU is

begin


end Behavioral;
