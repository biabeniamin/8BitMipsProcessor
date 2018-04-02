

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

signal wd : std_logic_vector(15 downto 0);
signal reset : std_logic;

--signals for main control
signal regDst : STD_LOGIC;
signal extOp : STD_LOGIC;
signal aluSrc : STD_LOGIC;
signal branch : STD_LOGIC;
signal jump : STD_LOGIC;
signal aluOp : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal memWrite : STD_LOGIC;
signal memToReg : STD_LOGIC;
signal regWrite : STD_LOGIC;

--instruction deocde
signal rd1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rd2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal extImm : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal funct : STD_LOGIC_VECTOR(2 DOWNTO 0);
signal sa : STD_LOGIC;


attribute mark_debug : string;
attribute mark_debug of display : signal is "true";
attribute mark_debug of mpgDebouncedButton : signal is "true"; 
 
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
    
    
    with sw(7 downto 5) select
        display <= currentInstruction when "000",
            nextInstruction when "001",
            rd1 when "010",
            rd2 when "011",
            wd when others;
            
    led(7) <= regDst;
    led(6) <= extOp;
    led(5) <= aluSrc;
    led(4) <= branch;
    led(3) <= jump;
    led(2) <= memWrite;
    led(1) <= memToReg;
    led(0) <= regWrite;
    
    led(9 downto 8) <= aluOp;
        
    
    wd <= rd1 + rd2;
    
    uc : entity work.MainControl
    port map(instruction => currentInstruction,
        regDst => regDst,
        extOp => extOp,
        aluSrc => aluSrc,
        branch => branch,
        jump => jump,
        aluOp => aluOp,
        memWrite => memWrite,
        memToReg => memToReg,
        regWrite => regWrite
     );
    
    ic : entity work.InstructionDecode
    port map(clk => clk,
        wen => mpgDebouncedButton,
        regWrite =>regWrite,
        instruction =>currentInstruction,
        regDst => regDst,
        extOp => extOp,
        wd => wd,
        rd1 => rd1,
        rd2 => rd2,
        ext_Imm => extImm,
        funct => funct,
        sa => sa
        );
    
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
        branchAddress => x"0003",
        jumpAddress => x"0000",
        jumpControl => jump,
        pCSrcControl => branch,
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
