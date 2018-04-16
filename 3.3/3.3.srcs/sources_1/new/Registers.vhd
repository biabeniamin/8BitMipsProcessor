library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity Registers is
    Port ( clk : in STD_LOGIC;
        ra1 : in STD_LOGIC_vector(2 downto 0);
        ra2 : in STD_LOGIC_vector(2 downto 0);
        wa : in STD_LOGIC_vector(2 downto 0);
        wd : in STD_LOGIC_vector(15 downto 0);
        regWrite : in STD_LOGIC;
        wen : in STD_LOGIC;
        rd1 : out STD_LOGIC_vector(15 downto 0);
        rd2 : out STD_LOGIC_vector(15 downto 0)
    );
end Registers;

architecture Behavioral of Registers is

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

signal r0 : std_logic_vector(15 downto 0);
signal r1 : std_logic_vector(15 downto 0);
signal r2 : std_logic_vector(15 downto 0);
signal r3 : std_logic_vector(15 downto 0);
signal r4 : std_logic_vector(15 downto 0);
signal r5 : std_logic_vector(15 downto 0);
signal r6 : std_logic_vector(15 downto 0);
signal r7 : std_logic_vector(15 downto 0);


attribute mark_debug : string;
attribute mark_debug of reg_file : signal is "true";

begin

    process(clk)
    begin
        if(rising_edge(clk))
        then
            if(wen = '1')
            then
                if(regWrite = '1')
                then
                    reg_file(conv_integer(wa)) <= wd;
                end if;
            end if;
        end if;
    end process;
    
    rd1 <= reg_file(conv_integer(ra1));
    rd2 <= reg_file(conv_integer(ra2));
    
    r0 <= reg_file(0);
    r1 <= reg_file(1);
    r2 <= reg_file(2);
    r3 <= reg_file(3);
    r4 <= reg_file(4);
    r5 <= reg_file(5);
    r6 <= reg_file(6);
    r7 <= reg_file(7);

end Behavioral;



