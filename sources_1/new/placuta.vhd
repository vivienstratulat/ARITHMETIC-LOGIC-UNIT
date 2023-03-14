----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/17/2022 10:49:39 PM
-- Design Name: 
-- Module Name: placuta - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity placuta is
  Port (clk: in std_logic;
  btn:in std_logic_vector(4 downto 0);
  sw:in std_logic_vector(15 downto 0);
  led:out std_logic_vector(15 downto 0);
  an: out std_logic_vector(3 downto 0);
  cat:out std_logic_vector(6 downto 0)
  );
end placuta;

architecture Behavioral of placuta is

component MPG is
    Port ( en : out STD_LOGIC;
           input : in STD_LOGIC;
           clock : in STD_LOGIC);
end component;

component SSD is
    Port ( clk: in STD_LOGIC;
           digits: in STD_LOGIC_VECTOR(15 downto 0);
           an: out STD_LOGIC_VECTOR(3 downto 0);
           cat: out STD_LOGIC_VECTOR(6 downto 0));
end component;

component scadere is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component rippleCarryAdder is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           b : in STD_LOGIC_VECTOR (31 downto 0);
           sum : out STD_LOGIC_VECTOR (31 downto 0);
           cout: out STD_LOGIC;
           overflow: out STD_LOGIC);
end component;

component increment is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           rez : out STD_LOGIC_VECTOR (31 downto 0);
           cout:out std_logic);
end component;

component decrement is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component rotateRight is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component rotateLeft is
    Port ( a : in STD_LOGIC_VECTOR (31 downto 0);
           rez : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component shiftAndAdd is
    Port (  X : in std_logic_vector (31 downto 0); -- multiplicand
            Y : in std_logic_vector (31 downto 0); -- multiplier
            P : out std_logic_vector (63 downto 0) ); -- product
end component ;

component impartire2 is
    Port (  X : in std_logic_vector (63 downto 0);
            Y : in std_logic_vector (31 downto 0);
            Quotient : out std_logic_vector (31 downto 0);
            Remainder : out std_logic_vector (63 downto 0) );
end component;

signal en:std_logic;
signal digits:std_logic_vector(15 downto 0);
signal sel:std_logic_vector(3 downto 0);
signal suma,diferenta,rezInc,rezDec,rezRight,rezLeft,q,si,sau,nu:std_logic_vector(31 downto 0);
signal rest,produs:std_logic_vector(63 downto 0);
signal cout1,overflow,coutInc,cout,i,incA,incB,decA,decB:std_logic;
signal a:std_logic_vector(31 downto 0);
signal b:std_logic_vector(31 downto 0);
signal a2:std_logic_vector(63 downto 0);

type registru is array(0 to 3) of std_logic_vector(31 downto 0);
	signal valoriA : registru:=("00000000000000000000000000000100", --4
	"11111111111111111111111111110111", --fff7 (-9)
	"00000000000000000000010111110001", -- (1521) =FFFF FA0F
	"01111100010001011011010111100111" --7c45b5e7
	--"000000000000000000000001010010011" --659-293hex
	);
	
	signal valoriB:registru:=("11111111111111111111111111111100", --(-4) ffffffc
	  "00000000000000000000000011100011", --227 =E3
	  "00000000000000000000000000001101", --13
	  "00000000100110011100011010111101" --99c6bd
	 -- "00000000000000000000000010011110" --9ehex-158dec
	  ); 

	


begin

--if (a(31)='0'

btnIncA: mpg port map(incA,btn(0),clk);
btnIncB: mpg port map(incB,btn(1),clk);
btnDecA: mpg port map(decA,btn(2),clk);
btnDecB: mpg port map(decB,btn(3),clk);
--btnRotateLeft: mpg port map(sel(1),btn(1),clk);
--btnAdd: mpg port map(sel(0),btn(0),clk);

display: ssd port map(clk,digits,an,cat);
adunare: rippleCarryAdder port map(a,b,suma,cout,overflow);
scadere2: scadere port map(a,b,diferenta);
incrementare: increment port map(a,rezInc,coutInc);
decrementare2: decrement port map(a,rezDec);
rotireStanga: rotateLeft port map(a,rezLeft);
rotireDreapta: rotateRight port map(a,rezRight);
inmultire: shiftAndAdd port map(a,b,produs);
impartire: impartire2 port map(a2,b,q,rest);

process
variable i,j: integer range 0 to 7;
begin



if(incA='1' and clk'event and clk='1') then i:=i+1;
 end if;
 if(incB='1' and clk'event and clk='1') then j:=j+1;
  end if;
  if(decA='1' and clk'event and clk='1') then i:=i-1;
   end if;
   if(decB='1' and clk'event and clk='1') then j:=j-1;
    end if;


a<=valoriA(i);
b<=valoriB(j);
a2<="00000000000000000000000000000000"&a;

si <= a and b;
sau <=a  or b;
nu <= not a;

case sw(4 downto 0) is
    when "00000" => digits<=a(31 downto 16);
    when "00001" => digits <=a(15 downto 0);
    
    when "00010"=> digits<=b(31 downto 16);
    when "00011" => digits<=b(15 downto 0);
    
    when "00100" => digits<=produs(63 downto 48);
    when "00101" =>digits<=produs(47 downto 32);
    when "00110" =>digits<=produs (31 downto 16);
    when "00111" =>digits<=produs (15 downto 0);
    
    when "01000" =>digits<=q(31 downto 16);
    when "01001" =>digits<=q(15 downto 0);
    when "01010" => digits<=rest(31 downto 16);
    when "01011" => digits <=rest(15 downto 0);
    
    when "01100" => digits<=diferenta(31 downto 16);
    when "01101" => digits <=diferenta(15 downto 0);
    
    when "01110" =>digits <=suma(31 downto 16);
    when "01111"=>digits <=suma(15 downto 0);
    
    when "10000"=>digits <=rezInc(31 downto 16);
    when "10001"=>digits <=rezInc(15 downto 0);
    
    when "10010" =>digits <=rezDec(31 downto 16);
    when "10011"=>digits <=rezDec(15 downto 0);
    
    when "10100"=>digits <=rezLeft (31 downto 16);
    when "10101"=>digits <=rezLeft(15 downto 0);
    
    when "10110" =>digits <=rezRight(31 downto 16);
    when "10111"=> digits <=rezRight(15 downto 0);
    
    when "11000"=> digits <=nu (31 downto 16);
    when "11001"=> digits <=nu (15 downto 0);
    
    when "11010"=> digits <=sau(31 downto 16);
    when "11011"=> digits <=sau(15 downto 0);
    
    when "11101"=> digits <=si(31 downto 16);
    when "11110"=> digits <=si(15 downto 0);
    
    
    
    when others => digits<=(others =>'0');
    end case;
  
end process;

end Behavioral;
