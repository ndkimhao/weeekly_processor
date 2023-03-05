--------------------------------------------------------------------------------
--
--   FileName:         ps2_keyboard.vhd
--   Dependencies:     debounce.vhd
--   Design Software:  Quartus II 32-bit Version 12.1 Build 177 SJ Full Version
--
--   HDL CODE IS PROVIDED "AS IS."  DIGI-KEY EXPRESSLY DISCLAIMS ANY
--   WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
--   PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
--   BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
--   DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
--   PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
--   BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
--   ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
--
--   Version History
--   Version 1.0 11/25/2013 Scott Larson
--     Initial Public Release
--    
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ps2_keyboard IS
  GENERIC(
    debounce_counter_size : INTEGER := 5);
  PORT(
    clk          : IN  STD_LOGIC;                     --system clock
    reset        : IN  STD_LOGIC;
    ps2_clk      : IN  STD_LOGIC;                     --clock signal from PS/2 keyboard
    ps2_data     : IN  STD_LOGIC;                     --data signal from PS/2 keyboard
    ps2_code_new : OUT STD_LOGIC;                     --flag that new PS/2 code is available on ps2_code bus
    ps2_code     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)); --code received from PS/2
END ps2_keyboard;

ARCHITECTURE logic OF ps2_keyboard IS
  SIGNAL ps2_clk_int  : STD_LOGIC;                          --debounced clock signal from PS/2 keyboard
  SIGNAL ps2_word     : STD_LOGIC_VECTOR(10 DOWNTO 0) := (others => '0');      --stores the ps2 data word
  SIGNAL error        : STD_LOGIC;                          --validate parity, start, and stop bits
  SIGNAL count_bits   : INTEGER RANGE 0 TO 11 := 0;
  
  SIGNAL prev_ps2_clk_int  : STD_LOGIC;

  --declare debounce component for debouncing PS2 input signals
  COMPONENT debounce IS
    GENERIC(
      counter_size : INTEGER); --debounce period (in seconds) = 2^counter_size/(clk freq in Hz)
    PORT(
      clk    : IN  STD_LOGIC;  --input clock
      button : IN  STD_LOGIC;  --input signal to be debounced
      result : OUT STD_LOGIC); --debounced signal
  END COMPONENT;
BEGIN

  --debounce PS2 input signals
  debounce_ps2_clk: debounce
    GENERIC MAP(counter_size => debounce_counter_size)
    PORT MAP(clk => clk, button => ps2_clk, result => ps2_clk_int);
    
  --verify that parity, start, and stop bits are all correct
  error <= NOT (NOT ps2_word(0) AND ps2_word(10) AND (ps2_word(9) XOR ps2_word(8) XOR
        ps2_word(7) XOR ps2_word(6) XOR ps2_word(5) XOR ps2_word(4) XOR ps2_word(3) XOR 
        ps2_word(2) XOR ps2_word(1)));  

  --determine if PS2 port is idle (i.e. last transaction is finished) and output result
  PROCESS(clk)
  BEGIN
    IF RISING_EDGE(CLK) THEN           --rising edge of system clock
      IF reset = '1' then
        count_bits <= 0;
        prev_ps2_clk_int <= '0';
        ps2_code_new <= '0';
      ELSE
        prev_ps2_clk_int <= ps2_clk_int;
        ps2_code_new <= '0';

        IF(ps2_clk_int = '0') THEN                 --low PS2 clock, PS/2 is active
          IF prev_ps2_clk_int = '1' THEN     -- PS2 clock falling edge
            ps2_word <= ps2_data & ps2_word(10 DOWNTO 1);   --shift in PS2 data bit
            count_bits <= count_bits + 1;
          END IF;
        ELSIF(count_bits = 11 and error = '0') THEN  --idle threshold reached and no errors detected
          ps2_code_new <= '1';                             --set flag that new PS/2 code is available
          ps2_code <= ps2_word(8 DOWNTO 1);              --output new PS/2 code
          count_bits <= 0;
        END IF;
      END IF; -- if reset
    END IF; -- if rising_edge(clk)
  END PROCESS;
 
END logic;
