----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2022 14:44:05
-- Design Name: 
-- Module Name: display_handler - Behavioral
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

entity display_handler is
    Port ( seg1_in : in STD_LOGIC_VECTOR (6 downto 0);
           seg2_in : in STD_LOGIC_VECTOR (6 downto 0);
           seg_out : out STD_LOGIC_VECTOR (6 downto 0);
           clk : in STD_LOGIC;
           AN0 : out STD_LOGIC;
           AN1 : out STD_LOGIC;
           AN2 : out STD_LOGIC;
           AN3 : out STD_LOGIC;
           AN4 : out STD_LOGIC;
           AN5 : out STD_LOGIC; 
           AN6 : out STD_LOGIC;
           AN7 : out STD_LOGIC
           );
end display_handler;

architecture Behavioral of display_handler is

signal count: std_logic:='0';

begin
    process(clk)
    begin
    if(clk'event and clk = '1') then
    
    count <= not(count);
        if(count = '1') then
            seg_out <= seg1_in;
            AN0 <= '0';
            AN1 <= '1';
            AN2 <= '1';
            AN3 <= '1';
            AN4 <= '1';
            AN5 <= '1';
            AN6 <= '1';
            AN7 <= '1';
            
        elsif(count ='0') then
            seg_out <= seg2_in;
            AN0 <= '1';
            AN1 <= '0';
            AN2 <= '1';
            AN3 <= '1';
            AN4 <= '1';
            AN5 <= '1';
            AN6 <= '1';
            AN7 <= '1';
        end if;
    
    end if;
    
    end process;
end Behavioral;
