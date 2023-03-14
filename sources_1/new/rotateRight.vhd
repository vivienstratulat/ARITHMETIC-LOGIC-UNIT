----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 09:42:22 PM
-- Design Name: 
-- Module Name: rotateRight - Behavioral
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

entity rotateRight is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           rez : out STD_LOGIC_VECTOR (31 downto 0));
end rotateRight;

architecture Behavioral of rotateRight is

begin
    process(a)
    begin
    rez(31)<=a(0);
    rez(30 downto 0)<=a(31 downto 1);
    
    end process;


end Behavioral;
