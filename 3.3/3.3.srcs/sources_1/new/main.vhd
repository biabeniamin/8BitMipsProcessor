

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

attribute mark_debug : string;

signal mpgDebouncedButton : std_logic;
signal display : std_logic_vector(15 downto 0);
signal address : std_logic_vector(7 downto 0);

attribute mark_debug of display : signal is "true";
attribute mark_debug of mpgDebouncedButton : signal is "true";

--main signal 
signal jumpAddress : STD_LOGIC_VECTOR(15 DOWNTO 0);

--instruction fetch
signal currentInstruction : std_logic_vector(15 downto 0);
signal nextInstruction : std_logic_vector(15 downto 0);
attribute mark_debug of currentInstruction : signal is "true";


signal registerWD : std_logic_vector(15 downto 0);
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
signal pCSrcControl  : STD_LOGIC;

--signals for alu
signal aluRes : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal zero : STD_LOGIC;
signal branchAddress : STD_LOGIC_VECTOR(15 DOWNTO 0);

--signals for memory
signal memData : STD_LOGIC_VECTOR(15 DOWNTO 0);

--instruction deocde
signal writeRegisterAddress : STD_LOGIC_VECTOR(2 DOWNTO 0);
signal rd1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal rd2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal extImm : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal funct : STD_LOGIC_VECTOR(2 DOWNTO 0);
signal sa : STD_LOGIC;
attribute mark_debug of rd1 : signal is "true";
attribute mark_debug of rd2 : signal is "true";

--if/id register
signal ifId : STD_LOGIC_VECTOR(31 downto 0);
signal idEx : STD_LOGIC_VECTOR(77 downto 0);
signal exMem : STD_LOGIC_VECTOR(77 downto 0);
signal memWb : STD_LOGIC_VECTOR(77 downto 0);
 
 
Begin
    
    process(clk, mpgDebouncedButton)
	begin
		if(rising_edge(clk))
		then
		  if(mpgDebouncedButton = '1')
          then
            ifId(15 downto 0)  <= currentInstruction;
            ifId(31 downto 16) <= nextInstruction;
            
            idEx(15 downto 0) <= rd1;
            idEx(31 downto 16) <= rd2;
            idEx(46 downto 32) <= extImm;
            idEx(49 downto 35) <= funct;
            idEx(50) <= sa;
            
            idEx(51) <= regDst;
            idEx(52) <= extOp;
            idEx(53) <= aluSrc;
            idEx(54) <= branch;
            idEx(55) <= jump;
            idEx(57 downto 56) <= aluOp;
            idEx(58) <= memWrite;
            idEx(59) <= memToReg;
            idEx(60) <= regWrite;
            idEx(76 downto 61) <= ifId(31 downto 16);
            idEx(92 downto 76) <= ifId(15 downto 0);
            
            exMem(2 downto 0) <= writeRegisterAddress;
            exMem(18 downto 3) <= rd2;
            exMem(34 downto 19) <= aluRes;
            exMem(35) <= zero;
            exMem(51 downto 36) <= branchAddress;
            exMem(52) <= idEx(54);
            exMem(53) <= idEx(58);
            exMem(54) <= idEx(60);
            exMem(55) <= idEx(59);
            
            memWb(2 downto 0) <= exMem(2 downto 0);
            memWb(17 downto 2) <= exMem(34 downto 19);
            memWb(33 downto 18) <= memData;
            memWb(34) <= exMem(55);
            memWb(34) <= exMem(54);
            
          end if;
		end if;
    end process;
    
    with idEx(51) select 
        writeRegisterAddress <= idEx(85 downto 83) when '0',
            idEx(82 downto 80) when others;

    
    with memWb(34) select
        registerWD <= memWb(33 downto 18) when '1',
             memWb(17 downto 2) when '0';
            
    jumpAddress <=  ifId(46 downto 29 ) & ifId(12 downto 0);
    
    pCSrcControl <= exMem(52) and exMem(35);
    
    memory : entity work.Memory
        Port map( clk => clk,
            ra => exMem(34 downto 19),
            wd => exMem(18 downto 3),
            wen => mpgDebouncedButton,
            memWrite => exMem(53),
            rd => memData
        );
    
    uc : entity work.MainControl
    port map(instruction => ifId(15 downto 0),
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
        writeAddress =>memWb(2 downto 0),
        instruction =>ifId(15 downto 0),
        regWrite => memWb(34),
        extOp => extOp,
        wd => registerWD,
        rd1 => rd1,
        rd2 => rd2,
        ext_Imm => extImm,
        funct => funct,
        sa => sa
        );

    
    insfet : entity work.InstructFetch
    port map ( clk =>clk,
        clkEnable => mpgDebouncedButton,
        branchAddress => exMem(51 downto 36),
        jumpAddress => jumpAddress,
        jumpControl => jump,
        pCSrcControl => pCSrcControl,
        clear => reset,
        currentInstruction => currentInstruction,
        nextInstruction => nextInstruction
        );
		
	alu : entity work.alu
	Port map(clk =>clk,
        nextInstruction => idEx(76 downto 61),
        rd1 => idEx(15 downto 0),
		rd2 => idEx(31 downto 16),
        aluSrc => idEx(53),
        extImm => idEx(46 downto 32),
        funct => idEx(49 downto 35),
        sa => idEx(50),
        aluOp => idEx(57 downto 56),
        aluRes => aluRes,
        zero => zero,
        branchAddress => exMem(51 downto 36));
        
        
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
            
            
            with sw(8 downto 5) select
                display <= currentInstruction when "0000",
                    nextInstruction when "0001",
                    rd1 when "0010",
                    rd2 when "0011",
					extImm when "0100",
					aluRes when "0101",
					memData when "0110",
					registerWD when "0111",
					"0000000000000" & currentInstruction(12 downto 10) when "1000",
					"0000000000000" & currentInstruction(9 downto 7) when "1001",
					branchAddress when "1010",
					aluRes when others;
            
			led(9 downto 8) <= aluOp;			
            led(7) <= regDst;
            led(6) <= extOp;
            led(5) <= aluSrc;
            led(4) <= branch;
            led(3) <= jump;
            led(2) <= memWrite;
            led(1) <= memToReg;
            led(0) <= regWrite;
            
            
     
     
 end Behavioral; 
