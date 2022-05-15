----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2022 09:35:41
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
    Port ( reset : in STD_LOGIC ;
           clk_in : in STD_LOGIC ;
           clk_out : out STD_LOGIC );
end clock_divider;

architecture Behavioral of clock_divider is

signal count: std_logic_vector(19 downto 0):= "00000000000000000000";
signal tmp_clk_out: std_logic := '0';

begin
    process(clk_in, reset)
        begin
            clk_out <= tmp_clk_out;
            if(reset = '1') then
                count <= "00000000000000000000";
                
            elsif(clk_in'event and clk_in = '1') then
                count <= count + '1';
                
            if(count = "11111111111111000000") then
                tmp_clk_out <= not(tmp_clk_out);
                count <= "00000000000000000000";
            end if;
            end if;
    end process;

end Behavioral;
