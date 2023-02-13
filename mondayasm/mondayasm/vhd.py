def vhd_header(romlen):
    return f'''
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

package CodeROM is

-- ##############################################################
-- ## BEGIN ROM
-- ##############################################################

constant ROMSize : integer := {romlen};
type TArrROM is array (0 to ROMSize) of TByte;
constant arr_rom : TArrROM := (
'''


def vhd_footer():
    return '''
    x"d8" -- HALT - end of rom
); -- arr_rom -------------------------------------------

-- ##############################################################
-- ## END ROM
-- ##############################################################

end package;
'''
