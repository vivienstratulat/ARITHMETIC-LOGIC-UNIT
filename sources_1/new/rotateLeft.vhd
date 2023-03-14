----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 09:38:32 PM
-- Design Name: 
-- Module Name: rotateLeft - Behavioral
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

entity rotateLeft is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           rez : out STD_LOGIC_VECTOR (31 downto 0));
end rotateLeft;

architecture Behavioral of rotateLeft is

begin
    process(a)
        begin
            rez(0)<=a(31);
            rez(31 downto 1)<=a(30 downto 0);
        end process;


end Behavioral;
