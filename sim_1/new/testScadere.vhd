----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 09:20:40 PM
-- Design Name: 
-- Module Name: testScadere - Behavioral
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

entity testScadere is
--  Port ( );
end testScadere;

architecture Behavioral of testScadere is
component scadere is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           rez : out STD_LOGIC_VECTOR (31 downto 0)
          );
end component;
signal a,b,rez:std_logic_vector(31 downto 0);


begin

scadem: scadere port map(a,b,rez,underflow);

process
begin
a<="00000000000000000000000000010000"; --16
b<="00000000000000000000000000000010"; --2
wait for 100ns;

a<="00000000000000000000000001110011"; --115
b<="00000000000000000000000000011011"; --27
wait for 100ns;

a<="00000000000000000000000000010000"; --16
b<="00000000000000000000000000010010"; --18
wait for 100ns;

end process;


end Behavioral;
