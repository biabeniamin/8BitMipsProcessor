

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


signal mpgDebouncedButton : std_logic;
signal display : std_logic_vector(15 downto 0);
signal address : std_logic_vector(7 downto 0);

signal currentInstruction : std_logic_vector(15 downto 0);
signal nextInstruction : std_logic_vector(15 downto 0);

signal rd1 : std_logic_vector(15 downto 0);
signal wd : std_logic_vector(15 downto 0);
signal rd2 : std_logic_vector(15 downto 0);
signal reset : std_logic;
 
Begin 

    
    process(clk)
    begin
        if(btn(2) = '1')
        then
            address <= "00000000";
        elsif(clk'event and clk = '1')
        then
            if mpgDebouncedButton = '1'
            then
                address <= address + 1;
            end if;
        end if;
    end process;
    
    
    with sw(7) select
        display <= currentInstruction when '1',
            nextInstruction when '0';
        
    
    wd <= rd1(13 downto 0) & "00";
    
    
    --reg : entity work.Registers
    --port map ( clk =>clk,
    --        ra1 => address(2 downto 0),
    --        ra2 => address(2 downto 0),
    --        wa => address(2 downto 0),
    --       rd1 => rd1,
    --        rd2 => rd2,
    --        wd => wd,
    --        wen => wen
    --    );
    
    insfet : entity work.InstructFetch
    port map ( clk =>clk,
        clkEnable => mpgDebouncedButton,
        branchAddress => x"0000",
        jumpAddress => x"0003",
        jumpControl => sw(0),
        pCSrcControl => sw(1),
        clear => reset,
        currentInstruction => currentInstruction,
        nextInstruction => nextInstruction
        );
        

      
        
    --reg : entity work.Memory
      --      port map ( clk =>clk,
    --                ra => address(2 downto 0),
  --                  rd => rd1,
--                    wd => wd,
--                    wen => wen
--                );
 
        mpgInstance : entity work.MPG
            port map(btn => btn(0),
            clock => clk,
            debouncedClock => mpgDebouncedButton);
            
        mpgInstance2 : entity work.MPG
                        port map(btn => btn(1),
                        clock => clk,
                        debouncedClock => reset);
                            
         --   port map(clk => clk,
         --   btn => mpgDebouncedButton,
         --   sw => sw,
         --   output => display
         --   );
            
         segmentDecoder : entity work.segmentDecoder
            port map(value => display,
            clk => clk,
            an => an,
            cat => cat);
            
     
     
 end Behavioral; 
