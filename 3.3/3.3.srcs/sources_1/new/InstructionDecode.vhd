library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionDecode is
    Port ( clk : in STD_LOGIC;
    wen : in STD_LOGIC;
    regWrite : in STD_LOGIC;
    instruction : in STD_LOGIC_VECTOR(15 DOWNTO 0);
    regDst : in STD_LOGIC;
    extOp : in STD_LOGIC;
    wd : in STD_LOGIC_VECTOR(15 DOWNTO 0);
    rd1 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    rd2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    ext_Imm : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    funct : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    sa : OUT STD_LOGIC
    );
end InstructionDecode;

architecture Behavioral of InstructionDecode is

signal writeAddress : STD_LOGIC_VECTOR(2 DOWNTO 0);



begin
    
    process(instruction, extOp)
    begin
        if(instruction(6) = '0')
        then
            if(extOp = '1')
            then
                ext_Imm <= b"111_111_111" & instruction(6 downto 0);
            else
                ext_Imm <= b"000_000_000" & instruction(6 downto 0);
            end if;
        else
            ext_Imm <= b"000_000_000" & instruction(6 downto 0);
        end if;
    end process;
    
    with regDst select 
        writeAddress <= instruction(9 downto 7) when '0',
            instruction(6 downto 4) when others;
    
    reg : entity work.Registers
    port map ( clk =>clk,
            ra1 => instruction(12 downto 10),
            ra2 => instruction(9 downto 7),
            wa => writeAddress,
           rd1 => rd1,
            rd2 => rd2,
            wd => wd,
            wen => regWrite
        );
        
    funct <= instruction(2 downto 0);
    sa <= instruction(3);

end Behavioral;
