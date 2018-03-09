

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MPG is
port( btn : in STD_LOGIC;
    clock : in STD_LOGIC;
    debouncedClock : out STD_LOGIC
    );

end MPG; 
 
architecture Behavioral of MPG is 
 
signal count_int : std_logic_vector(31 downto 0) :=x"00000000";
signal Q1 : std_logic;
signal Q2 : std_logic;
signal Q3 : std_logic;                        
signal en : std_logic;


Begin 
 en <= Q2 AND (not Q3); 
 debouncedClock <= en;
 process (clock)
  begin
      if clock='1' and clock'event 
      then
                count_int <= std_logic_vector(unsigned(count_int) + 1);
                    end if;
     end process; 
     
 process (clock) 
 begin    if clock'event and clock='1' 
 then
         if count_int(15 downto 0) = "1111111111111111"
          then
                     Q1 <= btn;
                            end if;
                                 end if;
end process; 

 process (clock)
  begin    
  if clock'event and clock='1' 
  then
           Q2 <= Q1;
                  Q3 <= Q2;
                      end if;
     end process; 
     
     
 end Behavioral; 
