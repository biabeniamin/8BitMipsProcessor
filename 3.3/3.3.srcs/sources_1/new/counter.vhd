


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

entity counter is
    Port ( clk :in std_logic;
        btn : in std_logic_vector(4 downto 0);
        sw : in std_logic_vector(15 downto 0);
        led : out std_logic_vector(15 downto 0);
        an : out std_logic_vector(3 downto 0);
        cat : out std_logic_vector(6 downto 0)
     );
        
end counter;

architecture Behavioral of counter is

signal state : std_logic_vector(15 downto 0);
signal debouncedClock : std_logic;
signal display : std_logic_vector(15 downto 0);
signal digit0 : std_logic_vector(6 downto 0);
signal digit1 : std_logic_vector(6 downto 0);
signal digit2 : std_logic_vector(6 downto 0);
signal digit3 : std_logic_vector(6 downto 0);

begin

    process(clk)
    begin
        if(clk'event and clk = '1')
        then
            
            state <= std_logic_vector(unsigned(state) + 1);
        end if;
    end process;
    
    process(clk)
    begin
        if(clk'event and clk = '1')
        then
            if debouncedClock = '1'
            then
                display <= display + 1;
            end if;
        end if;
    end process;

    with state(15 downto 0) select
        an <= "1110" when "00",
            "1101" when "01",
            "1011" when "10",
            "0111" when "11";
            
     with state(15 downto 0) select
        cat <= digit0 when "00",
             digit1 when "01",
             digit2 when "10",
             digit3 when "11";

    mpgInstance : entity work.MPG
        port map(btn => btn(0),
        clock => clk,
        debouncedClock => debouncedClock);
        
    digit0Decoder : entity work.segmentDecoder
                port map(digit => display(3 downto 0),
                    output => digit0);
                    
    digit1Decoder : entity work.segmentDecoder
                port map(digit => display(7 downto 4),
                     output => digit1);
    
    digit2Decoder : entity work.segmentDecoder
                port map(digit => display(11 downto 8),
                     output => digit2);
                                           
    digit3Decoder : entity work.segmentDecoder
                port map(digit => display(15 downto 12),
                      output => digit3);




end Behavioral;
