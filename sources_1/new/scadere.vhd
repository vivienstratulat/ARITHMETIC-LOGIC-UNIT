----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2022 08:56:54 PM
-- Design Name: 
-- Module Name: scadere - Behavioral
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
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity scadere is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           rez : out STD_LOGIC_VECTOR (31 downto 0)
           
           );
end scadere;

architecture Behavioral of scadere is

component rippleCarryAdder is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           sum : out STD_LOGIC_VECTOR (31 downto 0);
           cout: out STD_LOGIC;
           overflow: out STD_LOGIC);
end component;

signal rezultat:std_logic_vector(31 downto 0):=(others=>'0');
signal underflow,underflow2:std_logic;
signal b2:std_logic_vector(31 downto 0);
begin
b2<=not b;
--b2<=b2+1;

rca: rippleCarryAdder port map(a,b2,rezultat,open,underflow2); --complement 2
rca2: rippleCarryAdder port map(rezultat,"00000000000000000000000000000001",rez,open,underflow);


end Behavioral;
