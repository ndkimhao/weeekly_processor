library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity RAM is
	port (
		clk  : in std_logic;
		en   : in std_logic;
		wr   : in std_logic;
		addr : in  TPhyAddr;
		din  : in  TData;
		dout : out TData := (others => '0')
	);
end RAM;

architecture Behavioral of RAM is

component blk_mem_gen_0
	port (
		clka : in std_logic;
		ena : in std_logic;
		wea : in std_logic_vector(0 downto 0);
		addra : in std_logic_vector(16 downto 0);
		dina : in std_logic_vector(7 downto 0);
		douta : out std_logic_vector(7 downto 0)
	);
end component;

signal addr2 : unsigned(PhyAddrWidth-2 downto 0);
signal addr2plus1 : unsigned(PhyAddrWidth-2 downto 0);
signal aligned, last_aligned : std_logic;

signal din_a, dout_a : TByte;
signal din_b, dout_b : TByte;
signal addr_a, addr_b : unsigned(16 downto 0);

begin

	addr2 <= unsigned(addr(PhyAddrWidth-1 downto 1));
	addr2plus1 <= addr2 + 1;
	aligned <= not addr(0);
	
	process(clk)
	begin
		if rising_edge(clk) then
			last_aligned <= aligned;
		end if;
	end process;

	din_a <= din(7 downto 0)  when aligned = '1' else din(15 downto 8);
	din_b <= din(15 downto 8) when aligned = '1' else din(7 downto 0);

	addr_a <= addr2(16 downto 0) when aligned = '1' else addr2plus1(16 downto 0);
	addr_b <= addr2(16 downto 0);

	dout <= dout_b & dout_a when last_aligned = '1' else
			dout_a & dout_b;

	blk_a : blk_mem_gen_0 PORT MAP (
		clka => clk,
		ena => en,
		wea => wr & "",
		addra => std_logic_vector(addr_a),
		dina => din_a,
		douta => dout_a
	);

	blk_b : blk_mem_gen_0 PORT MAP (
		clka => clk,
		ena => en,
		wea => wr & "",
		addra => std_logic_vector(addr_b),
		dina => din_b,
		douta => dout_b
	);

end Behavioral;
