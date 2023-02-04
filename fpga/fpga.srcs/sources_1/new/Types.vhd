library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.ALL;

package Types is

	subtype TPhyAddr is std_logic_vector(PhyAddrWidth-1 downto 0);
	subtype TAddr is std_logic_vector(AddrWidth-1 downto 0);
	subtype TData is std_logic_vector(DataWidth-1 downto 0);
	subtype TByte is std_logic_vector(7 downto 0);

	subtype TInstBufferIdx is unsigned(4-1 downto 0);
	type TInstBuffer is array(MaxInstructionLen-1 downto 0) of TByte;

	subtype TUop is std_logic_vector(UopLen-1 downto 0);

end Types;

package body Types is
end Types;
