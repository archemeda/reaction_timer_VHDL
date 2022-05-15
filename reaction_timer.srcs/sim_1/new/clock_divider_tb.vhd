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
      Port ( reset : in STD_LOGIC ;
             clk_in : in STD_LOGIC ;
             clk_out : out STD_LOGIC );
  end component;

  signal reset: STD_LOGIC;
  signal clk_in: STD_LOGIC;
  signal clk_out: STD_LOGIC ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: clock_divider port map ( reset   => reset,
                                clk_in  => clk_in,
                                clk_out => clk_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
    reset <= '0';

    -- Put test bench stimulus code here

    stop_the_clock <= false;
    wait;
  end process;

  clocking: process
  begin
        clk_in <= '0';
        wait for clock_period /2;
        clk_in <= '1';
        wait for clock_period /2;
  end process;

end;
  