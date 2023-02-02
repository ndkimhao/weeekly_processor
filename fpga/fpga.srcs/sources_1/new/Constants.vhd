library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package Constants is

	constant PhyAddrWidth : Integer := 24;
	constant AddrWidth : Integer := 16;
	constant DataWidth : Integer := 16;

	constant MMUIdxWidth : Integer := 2;
	constant MMUSlots    : Integer := 4;

	constant RAMSize : Integer := 1048576; -- 1MB

end Constants;

package body Constants is
end Constants;
