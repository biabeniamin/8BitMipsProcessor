

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;          



entity segmentDecoder is
    Port ( value : in STD_LOGIC_VECTOR (15 downto 0);
        clk : in STD_LOGIC;
        an : out std_logic_vector(3 downto 0);
        cat : out std_logic_vector(6 downto 0)
    );
end segmentDecoder;

architecture Behavioral of segmentDecoder is

signal state : std_logic_vector(15 downto 0);
signal digit : STD_LOGIC_VECTOR (3 downto 0);

begin

 process(clk)
    begin
        if(clk'event and clk = '1')
        then
            
            state <= state + 1;
        end if;
    end process;

with digit SELect
   cat<= "1111001" when "0001",   --1
         "0100100" when "0010",   --2
         "0110000" when "0011",   --3
         "0011001" when "0100",   --4
         "0010010" when "0101",   --5
         "0000010" when "0110",   --6
         "1111000" when "0111",   --7
         "0000000" when "1000",   --8
         "0010000" when "1001",   --9
         "0001000" when "1010",   --A
         "0000011" when "1011",   --b
         "1000110" when "1100",   --C
         "0100001" when "1101",   --d
         "0000110" when "1110",   --E
         "0001110" when "1111",   --F
         "1000000" when others;   --0
         
with state(15 downto 14) select
    an <= "1110" when "00",
        "1101" when "01",
        "1011" when "10",
        "0111" when "11";
                     
with state(15 downto 14) select
    digit <= value(3 downto 0) when "00",
        value(7 downto 4) when "01",
        value(11 downto 8) when "10",
        value(15 downto 12) when "11";


end Behavioral;
