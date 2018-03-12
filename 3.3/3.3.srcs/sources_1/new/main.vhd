

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
port(   clk :in std_logic;
        btn : in std_logic_vector(4 downto 0);
        sw : in std_logic_vector(15 downto 0);
        led : out std_logic_vector(15 downto 0);
        an : out std_logic_vector(3 downto 0);
        cat : out std_logic_vector(6 downto 0));

end main; 
 
architecture Behavioral of main is 

type ramType is array(0 to 7) of std_logic_vector(15 downto 0);

signal ram : ramType :=(
"0000000000000000",
"0000000000000010",
"0000000000000101",
"0000000000001101",
"0000000000100000",
"0000000000100010",
"0000000000100101",
"0000000000101101"
);
signal mpgDebouncedButton : std_logic;
signal display : std_logic_vector(15 downto 0);
signal address : std_logic_vector(7 downto 0);
 
Begin 

    
    process(clk)
    begin
        if(clk'event and clk = '1')
        then
            if mpgDebouncedButton = '1'
            then
                address <= address + 1;
            end if;
        end if;
    end process;
    
    display <= ram(conv_integer(address));
 
        mpgInstance : entity work.MPG
            port map(btn => btn(0),
            clock => clk,
            debouncedClock => mpgDebouncedButton);
            
        counter : entity work.counter
            port map(clk => clk,
            btn => mpgDebouncedButton,
            sw => sw,
            output => display
            );
            
         segmentDecoder : entity work.segmentDecoder
            port map(value => display,
            clk => clk,
            an => an,
            cat => cat);
            
     
     
 end Behavioral; 
