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
		vbuf_addr : out TAddr;
		vbuf_dout : out TData;
		vbuf_din : in TData;
		
		uart_tx : out std_logic;
		uart_rx : in std_logic;
		
		led_out : out TByte;
		btn_in : in std_logic_vector(13-1 downto 0)
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

------

signal ahigh : unsigned(PhyAddrWidth-8-1 downto 0);
signal alow : unsigned(8-1 downto 0);

constant EN_RAM : integer := 0;
constant EN_ROM : integer := 1;
constant EN_VIDEO : integer := 2;
constant EN_UART_SEND : integer := 3;
constant EN_UART_RECV : integer := 4;
constant EN_UART_STATUS : integer := 5;
constant EN_SPI_SEND : integer := 6;
constant EN_SPI_STATUS : integer := 7;
constant EN_LED_WRITE : integer := 8;
constant EN_BTN_READ : integer := 9;
constant EN_PS2_READ : integer := 10;
constant EN_CLK_LO_READ : integer := 11;
constant EN_CLK_HI_READ : integer := 12;
constant EN_COUNT : integer := 13;
signal a : std_logic_vector(EN_COUNT-1 downto 0);
signal last_a : std_logic_vector(EN_COUNT-1 downto 0);

signal dev_en : std_logic;
signal s_led_out : TByte := (others => '0');

signal ram_out, rom_out : TData;
signal rom_addr : TPhyAddr;

signal clk_counter : unsigned(38-1 downto 0) := (others => '0');

-----

begin
	ahigh <= unsigned(addr(PhyAddrWidth-1 downto 8));
	alow <= unsigned(addr(7 downto 0));

	a(EN_RAM) <= en when ahigh < (RAMSize / 256) else '0';
	a(EN_ROM) <= en when x"FF00" <= ahigh else '0';
	a(EN_VIDEO) <= en when x"FE00" <= ahigh and ahigh < x"FE96" else '0';

	-- External devices
	dev_en <= '1' when addr(PhyAddrWidth-1 downto 8) = x"FD00" else '0';

	a(EN_UART_SEND)   <= dev_en when alow(7 downto 0) = x"00" else '0';
	a(EN_UART_RECV)   <= dev_en when alow(7 downto 0) = x"02" else '0';
	a(EN_UART_STATUS) <= dev_en when alow(7 downto 0) = x"04" else '0';

	a(EN_SPI_SEND)   <= dev_en when alow(7 downto 0) = x"06" else '0';
	a(EN_SPI_STATUS) <= dev_en when alow(7 downto 0) = x"08" else '0';

	a(EN_LED_WRITE) <= dev_en when alow(7 downto 0) = x"0A" else '0';
	a(EN_BTN_READ)  <= dev_en when alow(7 downto 0) = x"0C" else '0';

	a(EN_PS2_READ) <= dev_en when alow(7 downto 0) = x"0E" else '0';

	a(EN_CLK_LO_READ) <= dev_en when alow(7 downto 0) = x"10" else '0';
	a(EN_CLK_HI_READ) <= dev_en when alow(7 downto 0) = x"12" else '0';
	---

	rom_addr <= x"00" & addr(15 downto 0);
	vbuf_addr <= addr(15 downto 0);

	vbuf_wr <= wr;
	vbuf_en <= a(EN_VIDEO);

	ram : entity work.RAM port map (
		clk => clk,
		en => a(EN_RAM),
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

	dout <= ram_out when last_a(EN_RAM) = '1' else
			rom_out when last_a(EN_ROM) = '1' else
			vbuf_din when last_a(EN_VIDEO) = '1' else
			uart_recv_valid & uart_recv_empty & "000000" & uart_recv_dout
				when last_a(EN_UART_RECV) = '1' else
			"0" & uart_recv_empty & uart_recv_full & uart_recv_data_count &
			"0" & uart_send_empty & uart_send_full & uart_send_data_count
				when last_a(EN_UART_STATUS) = '1' else
			"000" & btn_in when last_a(EN_BTN_READ) = '1' else
			std_logic_vector(clk_counter(21 downto 6)) when last_a(EN_CLK_LO_READ) = '1' else
			std_logic_vector(clk_counter(37 downto 22)) when last_a(EN_CLK_HI_READ) = '1' else
			(others => '0');

	vbuf_dout <= din;

	process(clk)
	begin
		if rising_edge(clk) then
			last_a <= a;
			
			if a(EN_LED_WRITE) then
				s_led_out <= din(7 downto 0);
			end if;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				clk_counter <= (others => '0');
			else
				clk_counter <= clk_counter + 1;
			end if;
		end if;
	end process;

    --- GPIO
    led_out <= s_led_out;
 
	--- UART

	uart_send_buffer : fifo_uart_buffer port map (
		clk => clk,
		srst => reset,
		din => din(7 downto 0),
		wr_en => a(EN_UART_SEND),
		rd_en => uart_send_rd_en,
		dout => uart_send_dout,
		full => uart_send_full,
		empty => uart_send_empty,
		valid => uart_send_valid,
		data_count => uart_send_data_count
	);

	uart_recv_buffer : fifo_uart_buffer port map (
		clk => clk,
		srst => reset,
		din => uart_recv_din,
		wr_en => uart_recv_wr_en,
		rd_en => a(EN_UART_RECV),
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

end Behavioral;
