----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.05.2022 15:57:33
-- Design Name: 
-- Module Name: reaction_timer - Behavioral
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

entity reaction_timer is
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
           hard_reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           led : out STD_LOGIC
);
end reaction_timer;

architecture Behavioral of reaction_timer is

signal clk_div: std_logic;
signal seg1_cnt: std_logic_vector(3 downto 0);
signal seg2_cnt: std_logic_vector(3 downto 0);
signal seg1_out_dec: std_logic_vector(6 downto 0);
signal seg2_out_dec: std_logic_vector(6 downto 0);
signal cnt_enable: std_logic;
signal gnd: std_logic := '1';


    component seven_seg_counter port(clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           seg1 : out STD_LOGIC_VECTOR (3 downto 0);
           seg2 : out STD_LOGIC_VECTOR (3 downto 0)); end component;
           
    component counter_to_BCD  Port ( seg1_in : in STD_LOGIC_VECTOR (3 downto 0);
           seg2_in : in STD_LOGIC_VECTOR (3 downto 0);
           seg1_out : out STD_LOGIC_VECTOR (6 downto 0);
           seg2_out : out STD_LOGIC_VECTOR (6 downto 0)); end component;

    component clock_divider Port( reset : in STD_LOGIC ;
           clk_in : in STD_LOGIC ;
           clk_out : out STD_LOGIC ); end component;
           
    component debouncer Port( button_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           led : out STD_LOGIC); end component;
           
    component display_handler     Port ( seg1_in : in STD_LOGIC_VECTOR (6 downto 0);
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
           ); end component;
begin



u1: clock_divider port map(clk_in => clk, clk_out => clk_div, reset => '0');
u2: debouncer port map(button_in => button_in, reset => reset, clk => clk, led => cnt_enable);
led <= cnt_enable;
u3: seven_seg_counter port map(clk_in => clk_div, reset => hard_reset, enable => cnt_enable, seg1 => seg1_cnt, seg2 => seg2_cnt);
u4: counter_to_BCD port map(seg1_in => seg1_cnt, seg2_in => seg2_cnt, seg1_out => seg1_out_dec, seg2_out => seg2_out_dec);
u5: display_handler port map(seg1_in => seg1_out_dec, seg2_in => seg2_out_dec, clk => clk_div, seg_out => seg_out, AN0 => AN0, AN1 => AN1, AN2 => AN2, AN3 => AN3,AN4 => AN4,AN5 => AN5,AN6 => AN6,AN7 => AN7);

end Behavioral;
