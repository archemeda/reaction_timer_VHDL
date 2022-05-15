----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.05.2022 20:22:09
-- Design Name: 
-- Module Name: debouncer - Behavioral
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

entity debouncer is
    Port ( button_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           led : out STD_LOGIC);
end debouncer;

architecture Behavioral of debouncer is

signal w : std_logic;
signal ff_in : std_logic;
signal ff_out : std_logic;

begin

process(clk)

begin

if clk'event and clk='1' then
      if reset='1' then
         ff_out <= '0';
      else
         ff_out <= ff_in;
      end if;
      
   end if;

led <= ff_out;

end process;

process(clk)
begin

if button_in = '1' then
    w <= '1';
else
    w <= ff_out;
end if;
  
ff_in <= w and not(reset);

end process;

end Behavioral;
