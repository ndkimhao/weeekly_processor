library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity CPU is
	port (
		clk : in std_logic;
		reset : in std_logic
	);
end CPU;

architecture Behavioral of CPU is

signal mem_en, mem_wr : std_logic;
signal mem_phy_addr : TPhyAddr;
signal mem_addr : TAddr;
signal mem_din, mem_dout : TData;

signal mmu_cfg_write : std_logic;

signal fet_avail : TInstBufferIdx;
signal fet_buffer : TInstBuffer;
signal fet_dwant : std_logic;
signal fet_daddr : TAddr;
signal fet_dvalid : std_logic;

signal dec_hold : std_logic;
signal dec_ready : std_logic;
signal dec_done : std_logic;
signal dec_uop : TUop;
signal dec_inst_len : TInstBufferIdx;
signal dec_booted : std_logic;

signal eng_den : std_logic;
signal eng_dwr : std_logic;
signal eng_daddr : TAddr;
signal eng_dout : TData;

signal reg_a : TData;
signal reg_b : TData;
signal reg_c : TData;
signal reg_d : TData;
signal reg_sp : TData;
signal reg_pc : TData;
signal reg_fl : TData;
signal reg_e : TData;
signal reg_f : TData;
signal reg_g : TData;
signal reg_h : TData;

begin

	mem : entity work.MemoryController port map (
		clk => clk,
		en => mem_en,
		wr => mem_wr,
		addr => mem_phy_addr,
		din => mem_din,
		dout => mem_dout
	);

	mmu : entity work.MMU port map (
		clk => clk,
		virt_addr => mem_addr,
		phy_addr => mem_phy_addr,

		cfg_index => reg_e(MMUIdxWidth-1 downto 0),
		cfg_virt_start => reg_f,
		cfg_virt_end => reg_g,
		cfg_phy_addr => reg_a(7 downto 0) & reg_b,
		cfg_write => mmu_cfg_write
	);

	fetcher : entity work.Fetcher port map (
		clk => clk,
		reset => reset,

		pc => reg_pc,
		dwant => fet_dwant, -- want to read
		daddr => fet_daddr,
		din => mem_dout,
		dvalid => fet_dvalid, -- din is valid

		avail => fet_avail,
		inst_buffer => fet_buffer
	);
	
	decoder : entity work.Decoder port map (
		clk => clk,
		reset => reset,

		hold => dec_hold,
		avail => fet_avail,
		inst_in => fet_buffer,

		ready => dec_ready, -- uop is ready
		brk => dec_done, -- last uop of the block
		uop => dec_uop,
		used_len => dec_inst_len,
		
		booted => dec_booted
	);

	engine : entity work.Engine port map (
		clk => clk,

		uop_ready => dec_ready,
		uop_hold => dec_hold,
		uop => dec_uop,
		uop_done => dec_done,
		inst_len => dec_inst_len,

		den => eng_den,
		dwr => eng_dwr,
		daddr => eng_daddr,
		din => mem_dout,
		dout => eng_dout,
		
		mmu_cfg_wr => mmu_cfg_write,

		reg_a => reg_a,
		reg_b => reg_b,
		reg_c => reg_c,
		reg_d => reg_d,
		reg_sp => reg_sp,
		reg_pc => reg_pc,
		reg_fl => reg_fl,
		reg_e => reg_e,
		reg_f => reg_f,
		reg_g => reg_g,
		reg_h => reg_h
	);

	mem_en <= '0' when dec_booted = '0' else
				(eng_den or fet_dwant);
	mem_wr <= eng_dwr when eng_den = '1' else '0';
	mem_addr <= eng_daddr when eng_den = '1' else fet_daddr;
	mem_din <= eng_dout; -- fetcher never writes

	fet_dvalid <= mem_en and not eng_den;

end Behavioral;
