library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Constants.all;
use work.Types.all;

entity MemoryController is
	port (
		clk  : in std_logic;
		reset : in std_logic;

		en   : in std_logic;
		wr   : in std_logic;
		addr : in  TPhyAddr;
		din  : in  TData;
		dout : out TData := (others => '0');

		vbuf_en : out std_logic;
		vbuf_wr : out std_logic;
		vbuf_addr_bank : out std_logic_vector(2 downto 0);
		vbuf_addr : out TAddr;
		vbuf_dout : out TData;
		vbuf_din : in TData;
		
		uart_tx : out std_logic;
		uart_rx : in std_logic;
		
		ps2_clk  : in std_logic;
		ps2_data : in std_logic;
		
		led_out : out TByte;
		btn_in : in std_logic_vector(13-1 downto 0);

		uop_hold : in std_logic;
		uop_done : in std_logic
	);
end MemoryController;

architecture Behavioral of MemoryController is

component fifo_uart_buffer
	port (
		clk : in std_logic;
		srst : in std_logic;
		din : in std_logic_vector(7 downto 0);
		wr_en : in std_logic;
		rd_en : in std_logic;
		dout : out std_logic_vector(7 downto 0);
		full : out std_logic;
		empty : out std_logic;
		valid : out std_logic;
		data_count : out std_logic_vector(4 downto 0)
	);
end component;

component fifo_ps2_buffer
	port (
		clk : in std_logic;
		srst : in std_logic;
		din : in std_logic_vector(7 downto 0);
		wr_en : in std_logic;
		rd_en : in std_logic;
		dout : out std_logic_vector(7 downto 0);
		full : out std_logic;
		empty : out std_logic;
		valid : out std_logic 
	);
end component;

signal uart_send_rd_en : std_logic;
signal uart_send_dout : std_logic_vector(7 downto 0);
signal uart_send_full : std_logic;
signal uart_send_empty : std_logic;
signal uart_send_valid : std_logic;
signal uart_send_data_count : std_logic_vector(4 downto 0);

signal uart_recv_din : std_logic_vector(7 downto 0);
signal uart_recv_wr_en : std_logic;
signal uart_recv_dout : std_logic_vector(7 downto 0);
signal uart_recv_full : std_logic;
signal uart_recv_empty : std_logic;
signal uart_recv_valid : std_logic;
signal uart_recv_data_count : std_logic_vector(4 downto 0);

signal ps2_recv_din : std_logic_vector(7 downto 0);
signal ps2_recv_wr_en : std_logic;
signal ps2_recv_dout : std_logic_vector(7 downto 0);
signal ps2_recv_full : std_logic;
signal ps2_recv_empty : std_logic;
signal ps2_recv_valid : std_logic;
signal ps2_recv_buffer_rd_en : std_logic;

------

signal ahigh : unsigned(PhyAddrWidth-8-1 downto 0);
signal ahigh1 : unsigned(PhyAddrWidth-16-1 downto 0);
signal ahigh2 : unsigned(8-1 downto 0);
signal alow : unsigned(8-1 downto 0);

type TMappedMemory is (
	M_RAM,
	M_ROM,
	M_VIDEO,
	M_UART_SEND,
	M_UART_RECV,
	M_UART_STATUS,
	M_PS2_RECV,
	M_LED_WRITE,
	M_BTN_READ,
	M_CLK_READ_0,
	M_CLK_READ_1,
	M_CLK_READ_2,
	M_INSTCNT_READ_0,
	M_INSTCNT_READ_1,
	M_INSTCNT_READ_2,
	M_JUMP_TARGET,
	M_NONE
);

signal mtype : TMappedMemory;
signal last_mtype : TMappedMemory;

signal dev_en : std_logic;
signal s_led_out : TByte := (others => '0');

signal ram_out, rom_out : TData;
signal rom_addr : TPhyAddr;

signal clk_counter : unsigned(48-1 downto 0) := (others => '0');
signal inst_counter : unsigned(48-1 downto 0) := (others => '0');

signal mem_jump_target : TData := (others => '0');

-----
signal ram_en : std_logic;
signal uart_send_buffer_en, uart_recv_buffer_en : std_logic;
-----

begin
	ahigh <= unsigned(addr(PhyAddrWidth-1 downto 8));
	ahigh1 <= ahigh(PhyAddrWidth-8-1 downto 8);
	ahigh2 <= ahigh(8-1 downto 0);
	alow <= unsigned(addr(7 downto 0));

	dev_en <= '1' when ahigh1 = x"FD" else '0';

	mtype <=
		-- Memory
		M_RAM when en = '1' and ahigh < (RAMSize / 256) else
		M_ROM when en = '1' and x"FF" <= ahigh1 else
		M_VIDEO when en = '1' and x"F0" <= ahigh1 and ahigh1 < x"F8"
							  and x"00" <= ahigh2 and ahigh2 < x"96" else
		
		-- External devices
		M_UART_SEND   when dev_en = '1' and alow = x"00" else
		M_UART_RECV   when dev_en = '1' and alow = x"02" else
		M_UART_STATUS when dev_en = '1' and alow = x"04" else
		M_PS2_RECV    when dev_en = '1' and alow = x"06" else

		M_LED_WRITE   when dev_en = '1' and alow = x"0A" else
		M_BTN_READ    when dev_en = '1' and alow = x"0C" else
		
		-- Counters
		M_CLK_READ_0 when dev_en = '1' and alow = x"10" else
		M_CLK_READ_1 when dev_en = '1' and alow = x"12" else
		M_CLK_READ_2 when dev_en = '1' and alow = x"14" else

		M_INSTCNT_READ_0 when dev_en = '1' and alow = x"16" else
		M_INSTCNT_READ_1 when dev_en = '1' and alow = x"18" else
		M_INSTCNT_READ_2 when dev_en = '1' and alow = x"1A" else

		-- Miscs
		M_JUMP_TARGET when dev_en = '1' and alow = x"1C" else

		--
		M_NONE;

	dout <= 
		-- Memory
		ram_out when last_mtype = M_RAM else
		rom_out when last_mtype = M_ROM else
		vbuf_din when last_mtype = M_VIDEO else
		
		-- External devices
		uart_recv_valid & uart_recv_empty & "000000" & uart_recv_dout
			when last_mtype = M_UART_RECV else
		"0" & uart_recv_empty & uart_recv_full & uart_recv_data_count &
		"0" & uart_send_empty & uart_send_full & uart_send_data_count
			when last_mtype = M_UART_STATUS else
			
		ps2_recv_valid & ps2_recv_empty & "000000" & ps2_recv_dout
			when last_mtype = M_PS2_RECV else

		"000" & btn_in
			when last_mtype = M_BTN_READ else
		x"00" & s_led_out when last_mtype = M_LED_WRITE else

		-- Counters
		std_logic_vector(clk_counter(15 downto  0)) when last_mtype = M_CLK_READ_0 else
		std_logic_vector(clk_counter(31 downto 16)) when last_mtype = M_CLK_READ_1 else
		std_logic_vector(clk_counter(47 downto 32)) when last_mtype = M_CLK_READ_2 else

		std_logic_vector(inst_counter(15 downto  0)) when last_mtype = M_INSTCNT_READ_0 else
		std_logic_vector(inst_counter(31 downto 16)) when last_mtype = M_INSTCNT_READ_1 else
		std_logic_vector(inst_counter(47 downto 32)) when last_mtype = M_INSTCNT_READ_2 else

		-- Miscs
		mem_jump_target when last_mtype = M_JUMP_TARGET else
		
		--
		(others => '0'); -- M_NONE

	rom_addr <= x"00" & addr(15 downto 0);
	vbuf_addr <= addr(15 downto 0);
	vbuf_addr_bank <= addr(18 downto 16);

	vbuf_wr <= wr;
	vbuf_en <= '1' when mtype = M_VIDEO else '0';

	ram_en <= '1' when mtype = M_RAM else '0';
	ram : entity work.RAM port map (
		clk => clk,
		en => ram_en,
		wr => wr,
		addr => addr,
		din => din,
		dout => ram_out
	);

	rom : entity work.ROM port map (
		clk => clk,
		addr => rom_addr,
		dout => rom_out
	);

	vbuf_dout <= din;

	process(clk)
	begin
		if rising_edge(clk) then
			last_mtype <= mtype;

			if wr = '1' then
				case mtype is
					when M_LED_WRITE =>
						s_led_out <= din(7 downto 0);
					when M_JUMP_TARGET =>
						mem_jump_target <= din;
					when others =>
						null;
				end case;
			end if;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				clk_counter <= (others => '0');
				inst_counter <= (others => '0');
			else
				clk_counter <= clk_counter + 1;
				if uop_hold = '0' and uop_done = '1' then
					inst_counter <= inst_counter + 1;
				end if;
			end if;
		end if;
	end process;

    --- GPIO
    led_out <= s_led_out;
 
	--- UART

	uart_send_buffer_en <= '1' when mtype = M_UART_SEND else '0';
	uart_send_buffer : fifo_uart_buffer port map (
		clk => clk,
		srst => reset,
		din => din(7 downto 0),
		wr_en => uart_send_buffer_en,
		rd_en => uart_send_rd_en,
		dout => uart_send_dout,
		full => uart_send_full,
		empty => uart_send_empty,
		valid => uart_send_valid,
		data_count => uart_send_data_count
	);

	uart_recv_buffer_en <= '1' when mtype = M_UART_RECV else '0';
	uart_recv_buffer : fifo_uart_buffer port map (
		clk => clk,
		srst => reset,
		din => uart_recv_din,
		wr_en => uart_recv_wr_en,
		rd_en => uart_recv_buffer_en,
		dout => uart_recv_dout,
		full => uart_recv_full,
		empty => uart_recv_empty,
		valid => uart_recv_valid,
		data_count => uart_recv_data_count
	);

    uart_transceiver : entity work.uart port map (  
		clock => clk,
		reset => reset,
		data_stream_in => uart_send_dout,
		data_stream_in_stb => uart_send_valid,
		data_stream_in_ready => uart_send_rd_en,
		data_stream_in_empty => uart_send_empty,
		data_stream_out => uart_recv_din,
		data_stream_out_stb => uart_recv_wr_en,
		tx => uart_tx,
		rx => uart_rx
    );

	--- PS/2
	ps2_recv_buffer_rd_en <= '1' when mtype = M_PS2_RECV else '0';
	ps2_recv_buffer : fifo_ps2_buffer port map (
		clk => clk,
		srst => reset,
		din => ps2_recv_din,
		wr_en => ps2_recv_wr_en,
		rd_en => ps2_recv_buffer_rd_en,
		dout => ps2_recv_dout,
		full => ps2_recv_full,
		empty => ps2_recv_empty,
		valid => ps2_recv_valid
	);

	ps2_receiver : entity work.ps2_keyboard port map (
		clk => clk,
		ps2_clk => ps2_clk,
		ps2_data => ps2_data,
		ps2_code_new => ps2_recv_wr_en,
		ps2_code => ps2_recv_din
	);
end Behavioral;
