


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


use IEEE.NUMERIC_STD.ALL;                         



entity counter is
    Port ( clk :in std_logic;
        btn : in std_logic;
        sw : in std_logic_vector(15 downto 0);
        output : out std_logic_vector(15 downto 0)
     );
        
end counter;

architecture Behavioral of counter is


signal display : std_logic_vector(15 downto 0);

begin

   output <= display;
    
    process(clk)
    begin
        if(clk'event and clk = '1')
        then
            if btn = '1'
            then
                display <= display + 1;
            end if;
        end if;
    end process;
        

                    




end Behavioral;
