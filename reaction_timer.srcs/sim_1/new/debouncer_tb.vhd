-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity debouncer_tb is
end;

architecture bench of debouncer_tb is

  component debouncer
      Port ( button_in : in STD_LOGIC;
             reset : in STD_LOGIC;
             clk : in STD_LOGIC;
             led : out STD_LOGIC);
  end component;

  signal button_in: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal clk: STD_LOGIC;
  signal led: STD_LOGIC;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: debouncer port map ( button_in => button_in,
                            reset     => reset,
                            clk       => clk,
                            led       => led );

  stimulus: process
  begin
  
    -- Put initialisation code here
    reset <= '1';
    wait for 50ns;
    
    reset <= '0';
    button_in <= '0';  
    wait for 50ns;
    
    -- Put test bench stimulus code here
    button_in <= '1';
    wait for 50ns;
    
    button_in <= '0';
    reset <= '1';   
    wait for 50ns;
    
    button_in <= '1';   
    wait for 50ns;

    stop_the_clock <= false;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  