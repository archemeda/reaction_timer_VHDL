-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity counter_to_BCD_tb is
end;

architecture bench of counter_to_BCD_tb is

  component counter_to_BCD
      Port ( seg1_in : in STD_LOGIC_VECTOR (3 downto 0);
             seg2_in : in STD_LOGIC_VECTOR (3 downto 0);
             seg1_out : out STD_LOGIC_VECTOR (6 downto 0);
             seg2_out : out STD_LOGIC_VECTOR (6 downto 0));
  end component;

  signal seg1_in: STD_LOGIC_VECTOR (3 downto 0);
  signal seg2_in: STD_LOGIC_VECTOR (3 downto 0);
  signal seg1_out: STD_LOGIC_VECTOR (6 downto 0);
  signal seg2_out: STD_LOGIC_VECTOR (6 downto 0);

begin

  uut: counter_to_BCD port map ( seg1_in  => seg1_in,
                                 seg2_in  => seg2_in,
                                 seg1_out => seg1_out,
                                 seg2_out => seg2_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
    seg1_in <= "0000";
    seg2_in <= "0000";
    
    wait for 10ns;
    
    seg1_in <= "0001";
    seg2_in <= "0001";
    
    wait for 10ns;
    
    seg1_in <= "0010";
    seg2_in <= "0010";
    
    wait for 10ns;
    
    seg1_in <= "0011";
    seg2_in <= "0011";
    
    wait for 10ns;
    
    seg1_in <= "0100";
    seg2_in <= "0100";
    
    wait for 10ns;
    
    seg1_in <= "0101";
    seg2_in <= "0101";

    wait for 10ns;
    
    seg1_in <= "0110";
    seg2_in <= "0110";
    
    wait for 10ns;
    
    seg1_in <= "0111";
    seg2_in <= "0111";
    
    wait for 10ns;
    
    seg1_in <= "1000";
    seg2_in <= "1000";
    
    wait for 10ns;
    
    seg1_in <= "1001";
    seg2_in <= "1001";
    -- Put test bench stimulus code here

    wait;
  end process;


end;