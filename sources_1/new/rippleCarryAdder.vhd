----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 07:06:15 PM
-- Design Name: 
-- Module Name: rippleCarryAdder - Behavioral
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

entity rippleCarryAdder is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           sum : out STD_LOGIC_VECTOR (31 downto 0);
           cout: out STD_LOGIC;
           overflow: out STD_LOGIC);
end rippleCarryAdder;

architecture Behavioral of rippleCarryAdder is

component fullAdder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin: in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;

signal carry:std_logic_vector(32 downto 0);
signal s: std_logic_vector(31 downto 0);
signal cout2:std_logic;

begin
    carry(0) <='0'; --cin de la primul sum e tot timpul 0
     adunare:
    for i in 0 to 31 generate
        fullAdderEticheta: fullAdder port map( a=>a(i),b=>b(i),cin=>carry(i),sum=>s(i),cout=>carry(i+1));
     end generate;
     
     sum<=s;
     cout<=carry(32);
     cout2<=carry(32);
     
     --proces pt overflow
     process(a,b,s)
        begin
            --if a(31)=b(31) and s(31) /= a(31) then
            if cout2/= carry(31) then 
                overflow<='1';
             else
                 overflow<='0';
             end if;
      end process;


end Behavioral;
