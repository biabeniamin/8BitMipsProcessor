

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity newVersion is
    Port ( clk : in STD_LOGIC;
        btnH : in STD_LOGIC_VECTOR(3 downto 0);
        swH : in STD_LOGIC_VECTOR(3 downto 0));
end newVersion;

architecture Behavioral of newVersion is

signal btnO : std_logic_vector(4 downto 0);
signal swO : std_logic_vector(15 downto 0);
signal ledO : std_logic_vector(15 downto 0);
signal anO : std_logic_vector(3 downto 0);
signal catO : std_logic_vector(6 downto 0);

begin

btnO <= '0' & btnH;
swO <= "000000000000" & swH;

ic : entity work.main
    port map(clk => clk,
        btn => btnO,
        sw => swO,
        led => ledO,
        an => anO,
        cat => catO
    );


end Behavioral;
