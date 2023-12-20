library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity procesador is
    port(
        -- Entradas
        ReadData, Instr : in std_logic_vector(31 downto 0);
        clock : in std_logic;
		  Reset : in std_logic;
		  
		  --agregado
		  pulso : in std_logic;
		  
        -- Salidas
        PC, ALUResult, WriteData: out std_logic_vector(31 downto 0);
        MemWrite : out std_logic);
end procesador;

architecture arch of procesador is
    
    signal s_BufferControl : std_logic_vector(10 downto 0);
	 signal s_zero : std_logic;
	 -- agregado
	 signal s_ExceptionControl : std_logic_vector(1 downto 0);
	 signal s_store : std_logic;
	 
    begin
	 
	     dataPath : entity work.DataPath
    port map(
     Clk => clock,
	  Reset => Reset,
     BufferControl => s_BufferControl,
     instr => Instr,
     ReadData => ReadData,
     Zero => s_zero,
     PC => PC,
     ALUResult => ALUResult,
     WriteData => WriteData,
     MemWrite => MemWrite,
	  --
	  ExceptionControl => s_ExceptionControl,
	  store => s_store
    );
	 
	     unidadControl : entity work.UC
    port map(
      Zero => s_zero,
      Op => Instr(6 downto 0),
      funct3 =>Instr(14 downto 12),
      funct7 => Instr(30),
      BufferControl => s_BufferControl,
		--
		ExceptionControl => s_ExceptionControl,
		pulso => pulso,
		store => s_store,
		clock => clock
    );

end architecture;