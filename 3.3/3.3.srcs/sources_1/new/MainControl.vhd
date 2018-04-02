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

begin

    process(instruction)
    begin
        regDst <= '0';
        extOp <= '0';
        aluSrc <= '0';
        branch <= '0';
        jump <= '0';
        aluOp <= "00";
        memWrite <= '0';
        memToReg <= '0';
        regWrite <= '0';
    
        if(instruction(15 downto 13) = "000")--r instructin
        then
            regDst <= '1';
            regWrite <= '1';
            aluOp <= "10";
            
        elsif(instruction(15 downto 13) = "001")--lw instruction
        then
            memToReg <= '1';
            aluSrc <= '1';
            regWrite <= '1';
                        
        elsif(instruction(15 downto 13) = "010")--lw 
        then
            aluSrc <= '1';
            memWrite <= '1';
            
        elsif(instruction(15 downto 13) = "011")--beq
        then
            aluOp <= "01";
            branch <= '1';
            
        elsif(instruction(15 downto 13) = "100")--jmp
        then
            aluOp <= "00";
            jump <= '1';
                                    
        end if;        
    end process;

end Behavioral;
