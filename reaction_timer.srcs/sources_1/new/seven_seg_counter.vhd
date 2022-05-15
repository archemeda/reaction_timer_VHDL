----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2022 11:14:50
-- Design Name: 
-- Module Name: seven_seg_counter - Behavioral
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
use IEEE.std_logic_unsigned.ALL;
use ieee.numeric_std.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity seven_seg_counter is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           seg1 : out STD_LOGIC_VECTOR (3 downto 0);
           seg2 : out STD_LOGIC_VECTOR (3 downto 0));
end seven_seg_counter;

architecture Behavioral of seven_seg_counter is

signal count: std_logic_vector(3 downto 0):= "0000";
signal seg2_tmp: std_logic_vector(3 downto 0):= "0000";

begin


process(clk_in, reset)
begin
     if(reset = '1') then
        count <= "0000";
        seg2_tmp <= "0000";
            
     elsif(clk_in'event and clk_in = '1' and enable = '1') then
        count <= count + '1';
  
             if(count = "1001") then
                seg2_tmp <= seg2_tmp + 1;
                count <= "0000";         
             end if;
                    
     end if;
     seg1 <= count;
     seg2 <= seg2_tmp;
      
end process;
end Behavioral;
