----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/14/2022 11:01:26 PM
-- Design Name: 
-- Module Name: testInmultire - Behavioral
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

entity testInmultire is
--  Port ( );
end testInmultire;

architecture Behavioral of testInmultire is

component shiftAndAdd is
    Port (  X : in std_logic_vector (31 downto 0); -- multiplicand
            Y : in std_logic_vector (31 downto 0); -- multiplier
            P : out std_logic_vector (63 downto 0) ); -- product
end component ;

signal x,y,test:std_logic_vector(31 downto 0);
signal p:std_logic_vector(63 downto 0);

begin
eticheta: shiftAndAdd port map(x,y,p);

process
begin
x<="00000000000000000000000000000010";
y<="00000000000000000000000000000010";

wait for 20ns;

x<="00000000000000000000000000000010"; --2
y<="11111111111111111111111111111110"; --(-2)

wait for 20ns;

x<="11111111111111111111111111111100"; --(-4)
y<="11111111111111111111111111111100"; --(-4)
wait for 20 ns;


end process;

end Behavioral;
