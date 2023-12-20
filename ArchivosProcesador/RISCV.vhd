library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all ;

entity RISCV is
	Port (
   clk : in std_logic;
	Reset : in std_logic;
	pulso : in std_logic;
	
	MemWrite : out std_logic;
	DataAdress, WriteData : out std_logic_vector(31 downto 0));
end RISCV;

architecture Behavioral of RISCV is

	signal s_MemWrite : std_logic;
	signal s_ALUResult, s_WriteData, s_ReadData,s_Instr,s_PC2,s_PC : std_logic_vector(31 downto 0); 

begin

	memDatos : entity work.dmem
	Port Map(
	clk => clk,
	we  => s_MemWrite,
	a   => s_ALUResult,
	wd	 => s_WriteData,
	rd  => s_ReadData
	);
	
	
	s_PC2 <= "00" & s_PC(31 downto 2);

	memInstruc : entity work.imem
	Port Map(
	a   => s_PC2,
	rd  => s_Instr
	);
	
	
	procesador : entity work.procesador
	Port Map (
	PC => s_PC,
	ReadData => s_ReadData,
	Instr => s_Instr,
	clock => clk,
	Reset => Reset,
	ALUResult => s_ALUResult,
	WriteData => s_WriteData,
	MemWrite => s_MemWrite,
	pulso => pulso
	);
	DataAdress <= s_ALUResult;
	MemWrite <= s_MemWrite;
	WriteData <= s_WriteData;

end Behavioral;

