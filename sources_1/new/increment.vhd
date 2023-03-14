----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 09:54:51 PM
-- Design Name: 
-- Module Name: increment - Behavioral
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

entity increment is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           rez : out STD_LOGIC_VECTOR (31 downto 0);
           cout:out std_logic);
end increment;

architecture Behavioral of increment is

component rippleCarryAdder is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           sum : out STD_LOGIC_VECTOR (31 downto 0);
           cout: out STD_LOGIC;
           overflow: out STD_LOGIC);
end component;

begin
 eticheta: rippleCarryAdder port map(a,"00000000000000000000000000000001",rez,cout,open);


end Behavioral;