library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity Memory is
    Port ( clk : in STD_LOGIC;
        ra : in STD_LOGIC_vector(2 downto 0);
        wd : in STD_LOGIC_vector(15 downto 0);
        wen : in STD_LOGIC;
        rd : out STD_LOGIC_vector(15 downto 0)
    );
end Memory;

architecture Behavioral of Memory is

type reg_array is array(0 to 7) of std_logic_vector(15 downto 0);
signal reg_file : reg_array :=(
"0000000000000000",
"0000000000000001",
"0000000000000010",
"0000000000000100",
"0000000000001000",
"0000000000010000",
"0000000000100000",
"0000000001000000"
); 

begin

    process(clk)
    begin
        if(rising_edge(clk))
        then
            if(wen = '1')
            then
                reg_file(conv_integer(ra)) <= wd;
                rd <= wd;
            else
                rd <= reg_file(conv_integer(ra));
            end if;
        end if;
    end process;
    


end Behavioral;



