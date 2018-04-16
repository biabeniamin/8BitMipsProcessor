library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;   

entity alu is
  Port (clk :in std_logic;
        nextInstruction : in STD_LOGIC_VECTOR(15 DOWNTO 0);
        rd1 : in STD_LOGIC_vector(15 downto 0);
        rd2 : in STD_LOGIC_vector(15 downto 0);
        aluSrc : in STD_LOGIC;
        extImm : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        funct : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        sa : IN STD_LOGIC;
        aluOp : in STD_LOGIC_VECTOR(1 DOWNTO 0);
        aluRes : out std_logic_vector(15 downto 0);
        zero : out std_logic;
        branchAddress : out STD_LOGIC_VECTOR(15 downto 0));
end alu;

architecture Behavioral of alu is

signal branchAddressS : STD_LOGIC_VECTOR(15 downto 0);
signal result : STD_LOGIC_VECTOR(15 downto 0);
signal aluIn2 : STD_LOGIC_VECTOR(15 downto 0);
signal aluControl : STD_LOGIC_VECTOR(3 downto 0);

attribute mark_debug : string;

attribute mark_debug of aluIn2 : signal is "true";

begin

    process(clk)
    begin
        
                if aluOp = "01"
                then
                    result <= rd1 + aluIn2;
                elsif aluOp = "10"
                then
                    if funct = "000"
                    then
                        if sa = '1'
                        then
                            result <= rd1(14 downto 0) & '0';
                        end if;
                    elsif funct = "001"
                    then
                        if sa = '1'
                        then
                            result <= '0' & rd1(15 downto 1);
                        end if;
                    elsif funct = "010"
                    then
                          result <= rd1 + rd2;
                    elsif funct = "011"
                    then
                        result <= rd1 - rd2;
					elsif funct = "100"
                    then
                        result <= rd1 and rd2;
					elsif funct = "101"
                    then
                        result <= rd1 or rd2;
                    elsif funct = "110"
                    then
                        result <= not rd1;
					elsif funct = "111"
                    then
                        result <= rd1 xor rd2;
                    end if;
                end if; 
    end process;
    
    aluRes <= result;
    
    branchAddressS <= nextInstruction + extImm;
    
    --selecting register 2
    with aluSrc select
        aluIn2 <= rd2 when '0',
            extImm when '1';
        
    
end Behavioral;
