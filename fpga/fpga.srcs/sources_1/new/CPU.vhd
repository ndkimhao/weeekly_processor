library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity CPU is
	port (
		clk : in std_logic;
		reset : in std_logic;

		vbuf_en : out std_logic;
		vbuf_wr : out std_logic;
		vbuf_addr_bank : out std_logic_vector(4-1 downto 0);
		vbuf_addr : out TAddr;
		vbuf_dout : out TData;
		vbuf_din : in TData;
		
		uart_tx : out std_logic;
		uart_rx : in std_logic;
		ps2_clk  : in std_logic;
		ps2_data : in std_logic;
		led_out : out std_logic_vector(8-1 downto 0);
		btn_in : in std_logic_vector(13-1 downto 0);

		sd_pwr  : out std_logic;
		sd_cs   : out std_logic;
		sd_sclk : out std_logic;
		sd_mosi : out std_logic;
		sd_miso : in  std_logic
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
signal fet_inst_pc : TAddr;

signal dec_hold : std_logic;
signal dec_ready : std_logic;
signal dec_done : std_logic;
signal dec_uop : TUop;
signal dec_inst_len : TInstBufferIdx;
signal dec_inst_nargs : unsigned(2-1 downto 0);
signal dec_booted : std_logic;
signal dec_inst_out : TInstBuffer;

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
signal reg_x : TData;
signal reg_y : TData;
signal reg_z : TData;
signal reg_k : TData;

begin

	devices_controller : entity work.MemoryController port map (
		clk => clk,
		reset => reset,

		en => mem_en,
		wr => mem_wr,
		addr => mem_phy_addr,
		din => mem_din,
		dout => mem_dout,

		vbuf_en => vbuf_en,
		vbuf_wr => vbuf_wr,
		vbuf_addr_bank => vbuf_addr_bank,
		vbuf_addr => vbuf_addr,
		vbuf_dout => vbuf_dout,
		vbuf_din => vbuf_din,
		
		uart_tx => uart_tx,
		uart_rx => uart_rx,
		ps2_clk => ps2_clk,
		ps2_data => ps2_data,
		led_out => led_out,
		btn_in => btn_in,
		
		sd_pwr  => sd_pwr,
		sd_cs   => sd_cs,
		sd_sclk => sd_sclk,
		sd_mosi => sd_mosi,
		sd_miso => sd_miso,
		
		uop_hold => dec_hold,
		uop_done => dec_done
	);

	mmu : entity work.MMU port map (
		clk => clk,
		virt_addr => mem_addr,
		phy_addr => mem_phy_addr,

		cfg_index => reg_x(MMUIdxWidth-1 downto 0),
		cfg_virt_start => reg_y,
		cfg_virt_end => reg_z,
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
		inst_buffer => fet_buffer,
		inst_pc => fet_inst_pc,

		dec_inst_len => dec_inst_len
	);

	decoder : entity work.Decoder port map (
		clk => clk,
		reset => reset,

		hold => dec_hold,
		pc => reg_pc,

		avail => fet_avail,
		inst_in => fet_buffer,
		inst_pc => fet_inst_pc,
		inst_nargs => dec_inst_nargs,

		ready => dec_ready, -- uop is ready
		brk => dec_done, -- last uop of the block
		uop => dec_uop,
		inst_out => dec_inst_out,
		used_len => dec_inst_len,
		
		booted => dec_booted
	);

	engine : entity work.Engine port map (
		clk => clk,
		reset => reset,

		uop_ready => dec_ready,
		uop_hold => dec_hold,
		uop => dec_uop,
		uop_done => dec_done,
		inst_buffer => dec_inst_out,
		inst_len => dec_inst_len,
		inst_nargs => dec_inst_nargs,

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
		reg_x => reg_x,
		reg_y => reg_y,
		reg_z => reg_z,
		reg_k => reg_k
	);

	mem_en <= '0' when dec_booted = '0' else
				(eng_den or fet_dwant);
	mem_wr <= eng_dwr when eng_den = '1' else '0';
	mem_addr <= eng_daddr when eng_den = '1' else fet_daddr;
	mem_din <= eng_dout; -- fetcher never writes

	fet_dvalid <= mem_en and not eng_den;

end Behavioral;
