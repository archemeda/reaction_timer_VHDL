----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.05.2022 16:00:15
-- Design Name: 
-- Module Name: counter_to_BCD - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_to_BCD is
    Port ( seg1_in : in STD_LOGIC_VECTOR (3 downto 0);
           seg2_in : in STD_LOGIC_VECTOR (3 downto 0);
           seg1_out : out STD_LOGIC_VECTOR (6 downto 0);
           seg2_out : out STD_LOGIC_VECTOR (6 downto 0));
end counter_to_BCD;

architecture Behavioral of counter_to_BCD is

begin

seg1_out(0) <= not((not(seg1_in(0)) and not(seg1_in(2))) or (seg1_in(0) and seg1_in(2)) or seg1_in(1) or seg1_in(3));
seg1_out(1) <= not((not(seg1_in(0)) and not(seg1_in(1))) or (seg1_in(0) and seg1_in(1)) or not(seg1_in(2)));
seg1_out(2) <= not(seg1_in(0) or not(seg1_in(1)) or seg1_in(2));
seg1_out(3) <= not((not(seg1_in(2)) and seg1_in(1)) or (seg1_in(2) and not(seg1_in(1))) or not(seg1_in(0)) or seg1_in(3));
seg1_out(4) <= not((not(seg1_in(2)) and not(seg1_in(0))) or (seg1_in(1) and not(seg1_in(0))));
seg1_out(5) <= not((not(seg1_in(0)) and not(seg1_in(1))) or (not(seg1_in(1)) and seg1_in(2)) or (not(seg1_in(0)) and seg1_in(2)) or seg1_in(3));
seg1_out(6) <= not((seg1_in(1) and not(seg1_in(2))) or (not(seg1_in(1)) and seg1_in(2)) or (not(seg1_in(0)) and seg1_in(2)) or seg1_in(3));

seg2_out(0) <= not((not(seg2_in(0)) and not(seg2_in(2))) or (seg2_in(0) and seg2_in(2)) or seg2_in(1) or seg2_in(3));
seg2_out(1) <= not((not(seg2_in(0)) and not(seg2_in(1))) or (seg2_in(0) and seg2_in(1)) or not(seg2_in(2)));
seg2_out(2) <= not(seg2_in(0) or not(seg2_in(1)) or seg2_in(2));
seg2_out(3) <= not((not(seg2_in(2)) and seg2_in(1)) or (seg2_in(2) and not(seg2_in(1))) or not(seg2_in(0)) or seg2_in(3));
seg2_out(4) <= not((not(seg2_in(2)) and not(seg2_in(0))) or (seg2_in(1) and not(seg2_in(0))));
seg2_out(5) <= not((not(seg2_in(0)) and not(seg2_in(1))) or (not(seg2_in(1)) and seg2_in(2)) or (not(seg2_in(0)) and seg2_in(2)) or seg2_in(3));
seg2_out(6) <= not((seg2_in(1) and not(seg2_in(2))) or (not(seg2_in(1)) and seg2_in(2)) or (not(seg2_in(0)) and seg2_in(2)) or seg2_in(3));

end Behavioral;
