-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity clock_divider_tb is
end;

architecture bench of clock_divider_tb is

  component clock_divider
      Port ( reset : in STD_LOGIC := '0';
             clk_in : in STD_LOGIC := '0';
             clk_out : out STD_LOGIC := '0');
  end component;

  signal reset: STD_LOGIC := '0';
  signal clk_in: STD_LOGIC := '0';
  signal clk_out: STD_LOGIC := '0';

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: clock_divider port map ( reset   => reset,
                                clk_in  => clk_in,
                                clk_out => clk_out );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    stop_the_clock <= false;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk_in <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
  