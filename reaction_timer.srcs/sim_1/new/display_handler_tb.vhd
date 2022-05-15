-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity display_handler_tb is
end;

architecture bench of display_handler_tb is

  component display_handler
      Port ( seg1_in : in STD_LOGIC_VECTOR (6 downto 0);
             seg2_in : in STD_LOGIC_VECTOR (6 downto 0);
             seg_out : out STD_LOGIC_VECTOR (6 downto 0);
             clk : in STD_LOGIC;
             AN0 : out STD_LOGIC;
             AN1 : out STD_LOGIC);
  end component;

  signal seg1_in: STD_LOGIC_VECTOR (6 downto 0);
  signal seg2_in: STD_LOGIC_VECTOR (6 downto 0);
  signal seg_out: STD_LOGIC_VECTOR (6 downto 0);
  signal clk: STD_LOGIC;
  signal AN0: STD_LOGIC;
  signal AN1: STD_LOGIC;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: display_handler port map ( seg1_in => seg1_in,
                                  seg2_in => seg2_in,
                                  seg_out => seg_out,
                                  clk     => clk,
                                  AN0     => AN0,
                                  AN1     => AN1 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    seg1_in <= "0000000";
    seg2_in <= "1111111";

    -- Put test bench stimulus code here

    stop_the_clock <= FALSE;
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