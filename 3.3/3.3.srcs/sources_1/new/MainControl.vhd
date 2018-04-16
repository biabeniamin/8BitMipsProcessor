library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainControl is
    Port ( instruction : in STD_LOGIC_VECTOR (15 downto 0);
    regDst : out STD_LOGIC;
    extOp : out STD_LOGIC;
    aluSrc : out STD_LOGIC;
    branch : out STD_LOGIC;
    jump : out STD_LOGIC;
    aluOp : out STD_LOGIC_VECTOR(1 DOWNTO 0);
    memWrite : out STD_LOGIC;
    memToReg : out STD_LOGIC;
    regWrite : out STD_LOGIC
    );
end MainControl;

architecture Behavioral of MainControl is

attribute mark_debug : string;

signal regDstS : STD_LOGIC;
signal extOpS : STD_LOGIC;
signal aluSrcS : STD_LOGIC;
signal branchS : STD_LOGIC;
signal jumpS : STD_LOGIC;
signal aluOpS : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal memWriteS : STD_LOGIC;
signal memToRegS : STD_LOGIC;
signal regWriteS : STD_LOGIC;
attribute mark_debug of regDstS : signal is "true";
attribute mark_debug of extOpS : signal is "true";
attribute mark_debug of aluSrcS : signal is "true";
attribute mark_debug of branchS : signal is "true";
attribute mark_debug of jumpS : signal is "true";
attribute mark_debug of aluOpS : signal is "true";
attribute mark_debug of memWriteS : signal is "true";
attribute mark_debug of memToRegS : signal is "true";
attribute mark_debug of regWriteS : signal is "true";

begin

        regDst <= regDstS;
        extOp <= extOpS;
        aluSrc <= aluSrcS;
        branch <= branchS;
        jump <= jumpS;
        aluOp <= aluOpS;
        memWrite <= memWriteS;
        memToReg <= memToRegS;
        regWrite <= regWriteS;    

    process(instruction)
    begin
        regDstS <= '0';
        extOpS <= '0';
        aluSrcS <= '0';
        branchS <= '0';
        jumpS <= '0';
        aluOpS <= "00";
        memWriteS <= '0';
        memToRegS <= '0';
        regWriteS <= '0';
    
        if(instruction(15 downto 13) = "000")--r instructin
        then
            regDstS <= '1';
            regWriteS <= '1';
            aluOpS <= "10";
            
        elsif(instruction(15 downto 13) = "001")--lw instruction
        then
            aluOpS <= "01";
            memToRegS <= '1';
            aluSrcS <= '1';
            regWriteS <= '1';
                        
        elsif(instruction(15 downto 13) = "010")--sw 
        then
            aluOpS <= "01";
            aluSrcS <= '1';
            memWriteS <= '1';
            
        elsif(instruction(15 downto 13) = "011")--beq
        then
            aluOpS <= "01";
            branchS <= '1';
            
        elsif(instruction(15 downto 13) = "101")--addi
        then
            aluOpS <= "01";
            regWriteS <= '1';
            
        elsif(instruction(15 downto 13) = "100")--jmp
        then
            aluOpS <= "00";
            jumpS <= '1';
                                    
        end if;        
    end process;

end Behavioral;
