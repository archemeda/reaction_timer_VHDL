-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity reaction_timer_tb is
end;

architecture bench of reaction_timer_tb is

  component reaction_timer
       Port ( seg_out : out std_logic_vector(6 downto 0);
           AN0 : out STD_LOGIC;
           AN1 : out STD_LOGIC;
           AN2 : out STD_LOGIC;
           AN3 : out STD_LOGIC;
           AN4 : out STD_LOGIC;
           AN5 : out STD_LOGIC; 
           AN6 : out STD_LOGIC;
           AN7 : out STD_LOGIC;
           button_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           led : out STD_LOGIC
);
  end component;

  signal seg_out: std_logic_vector(6 downto 0);
  signal AN0: std_logic;
  signal AN1: std_logic;
  signal button_in: STD_LOGIC;
  signal reset: STD_LOGIC;
  signal clk: STD_LOGIC;
  signal led: STD_LOGIC;
  
  constant clock_period: time := 10 ns;

begin

  uut: reaction_timer port map ( seg_out  => seg_out,
                                 AN0 => AN0,
                                 AN1 => AN1,
                                 button_in => button_in,
                                 reset     => reset,
                                 clk       => clk,
                                 led       => led );

  stimulus: process
  begin
  
    -- Put initialisation code here
    reset <= '1';
    button_in <= '0';
    
    wait for 100ns;
    
    reset <= '0';
    button_in <= '1';
    
    wait for 9000ns;
    
    reset <= '1';
    
    wait for 100ns;


    -- Put test bench stimulus code here

    wait;
  end process;
  
  clocking: process
  begin
        clk <= '0';
        wait for clock_period /2;
        clk <= '1';
        wait for clock_period /2;
  end process;

end;

  