----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2023 12:47:32 AM
-- Design Name: 
-- Module Name: testImpartire - Behavioral
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

entity testImpartire is
--  Port ( );
end testImpartire;

architecture Behavioral of testImpartire is

component impartire2 is
    Port (  X : in std_logic_vector (63 downto 0);
            Y : in std_logic_vector (31 downto 0);
            Quotient : out std_logic_vector (31 downto 0);
            Remainder : out std_logic_vector (63 downto 0) );
end component;
signal X :std_logic_vector (63 downto 0);
signal Y :  std_logic_vector (31 downto 0);
signal Quotient : std_logic_vector (31 downto 0);
signal Remainder :  std_logic_vector (63 downto 0);

begin
eticheta: impartire2 port map(x,y,Quotient,Remainder);
process
begin
x<="0000000000000000000000000000000000000000000000000000000000000111";
y<="00000000000000000000000000000010";
wait for 20ns;

x<="0000000000000000000000000000000000000000000000000000000000111111";
y<="00000000000000000000000000000110";
wait for 20ns;
end process;


end Behavioral;
