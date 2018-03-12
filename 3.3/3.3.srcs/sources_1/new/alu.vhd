library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;   

entity alu is
  Port (clk :in std_logic;
        btn : in std_logic;
        input1 : in std_logic_vector(15 downto 0);
        input2 : in std_logic_vector(15 downto 0);
        output : out std_logic_vector(15 downto 0));
end alu;

architecture Behavioral of alu is

begin

    process(clk)
    begin
        --if(rising_edge(clk))
        --then
    end process;
    
end Behavioral;
