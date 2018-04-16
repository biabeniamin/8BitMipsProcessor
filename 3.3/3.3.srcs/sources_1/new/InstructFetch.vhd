library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;          



entity InstructFetch is
    Port ( clk : in STD_LOGIC;
    clkEnable : in STD_LOGIC;
    branchAddress : in STD_LOGIC_VECTOR(15 downto 0);
    jumpAddress : in STD_LOGIC_VECTOR(15 downto 0);
    jumpControl : in STD_LOGIC;
    pCSrcControl : in STD_LOGIC;
    clear : in STD_LOGIC;    
    
    currentInstruction : out STD_LOGIC_VECTOR(15 DOWNTO 0);
    nextInstruction : out STD_LOGIC_VECTOR(15 DOWNTO 0)
    
    );
end InstructFetch;

architecture Behavioral of InstructFetch is

type romType is array(0 to 7) of std_logic_vector(15 downto 0);

--shift left log function=000
--add function=001
--substraction function=010
--shift right log function=011
--and function=100
--or function=101
--xor function=110
--not function=111

--opcode_source_second source_desti_shift amount_fucntion

--mov $1, $0
--addi $1, 5

signal rom : romType :=(
B"000_100_010_001_0_101",	--and $1, $4, $2
B"000_000_000_010_0_100",	--and $2, $0, $0
B"000_000_000_011_0_100",	--and $3, $0, $0
B"101_001_000_0000101",	--addi $1,$0, 5
B"000_001_000_010_0_101",	--or $2, $1, $0
B"001_011_000_0000000",	--lw $3,$0, 0
B"000_011_000_001_0_010",	--add $1, $3, $0
B"100_0000000001010"	--jmp 10




);

signal pc : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal nextInstr : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal branchAddr : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal nextAddr : STD_LOGIC_VECTOR(15 DOWNTO 0);

attribute mark_debug : string;
attribute mark_debug of pc : signal is "true";
attribute mark_debug of pCSrcControl : signal is "true";
attribute mark_debug of jumpControl : signal is "true"; 

begin
    nextAddr <= pc + 1;

    with pCSrcControl select
        branchAddr <= nextAddr when '0',
            branchAddress when others;

    with jumpControl Select
        nextInstr <= branchAddr when '0',
            jumpAddress when others;
            
    currentInstruction <= rom(conv_integer(pc));
    nextInstruction <= nextAddr;  

    process(clk)
    begin
        if('1' = clear)
        then
            pc <= "0000000000000000";
        elsif(rising_edge(clk))
        then
            if('1' = clkEnable)
            then
                pc <= nextInstr;
                
            end if;
        end if;
    end process;         

end Behavioral;
