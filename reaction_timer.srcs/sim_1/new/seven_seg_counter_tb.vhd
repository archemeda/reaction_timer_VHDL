-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity seven_seg_counter_tb is
end;

architecture bench of seven_seg_counter_tb is

  component seven_seg_counter
      Port ( clk_in : in STD_LOGIC;
             reset : in STD_LOGIC;
             seg1 : out STD_LOGIC_VECTOR (8 downto 0);
             seg2 : out STD_LOGIC_VECTOR (8 downto 0));
  end component;

  signal clk_in: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal seg1: STD_LOGIC_VECTOR (8 downto 0);
  signal seg2: STD_LOGIC_VECTOR (8 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: seven_seg_counter port map ( clk_in => clk_in,
                                    reset  => reset,
                                    seg1   => seg1,
                                    seg2   => seg2 );

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
    while not stop_the_clock loop
      clk_in <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;