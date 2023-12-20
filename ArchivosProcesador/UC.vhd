library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity UC is
    port(
        -- Entradas
        Zero : in std_logic;
        Op : in std_logic_vector(6 downto 0);
        funct3: in std_logic_vector(2 downto 0);
        funct7 : in std_logic;
		  
		  -- Agregado
		  pulso : in std_logic;
		  ExceptionControl : out std_logic_vector(1 downto 0);
		  store : out std_logic;
		  clock : in std_logic;

        -- Salidas
        BufferControl : out std_logic_vector(10 downto 0));
end UC;

architecture arch of UC is

	COMPONENT maindec
	PORT(
		op : IN std_logic_vector(6 downto 0);          
		ResultSrc : OUT std_logic_vector(1 downto 0);
		MemWrite : OUT std_logic;
		Branch : OUT std_logic;
		ALUSrc : OUT std_logic;
		RegWrite : OUT std_logic;
		Jump : OUT std_logic;
		ImmSrc : OUT std_logic_vector(1 downto 0);
		ALUOp : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

    --Señales para mainDecoder
    signal s_resultSRC : std_logic_vector(1 downto 0);
    signal s_Branch : std_logic;
    signal s_MemWrite : std_logic;
    signal s_ALUSrc : std_logic;
    signal s_ImmSrc : std_logic_vector(1 downto 0);
    signal s_RegWrite : std_logic;
    signal s_jump : std_logic;

    --Señales para aluDecoder
    signal s_aluOperation : std_logic_vector(1 downto 0);
    signal s_aluControl : std_logic_vector(2 downto 0);

    --Señal intermediaria para salida
    signal s_PCSrc : std_logic;

	 --Señal agregada
	 signal s_pulso : std_logic_vector(10 downto 0);
	 signal s_exceptionencurso : std_logic := '0';
	 signal s_test : std_logic_vector(3 downto 0);

begin
	 	Inst_maindec : maindec PORT MAP(
		op => Op(6 downto 0),
		ResultSrc => s_resultSRC,
		MemWrite => s_MemWrite,
		Branch => s_Branch,
		ALUSrc => s_ALUSrc,
		RegWrite => s_RegWrite,
		Jump => s_jump,
		ImmSrc => s_ImmSrc,
		ALUOp => s_aluOperation
	);




   aluDecoder : entity work.aludec
   port map(
    opb5 => Op(5),
    funct3 => funct3,
    funct7b5 => funct7,
    ALUOp => s_aluOperation,
    ALUControl => s_aluControl
   );


-- Agregado en la Unidad de control
process(pulso,clock)
begin
if rising_edge(clock) then  
if (Op = "0000000" and s_exceptionEnCurso = '1') then
    --caso fin de excepcion
    ExceptionControl <= "10";
    store <= '0';
    s_exceptionEnCurso <= '0';
	 s_test <= "0100";
elsif(s_exceptionEnCurso = '1') then
    --caso excepcion en curso
    ExceptionControl <= "00";
    store <= '1';
    s_exceptionEnCurso <= '1';
	 s_test <= "0001";
elsif (pulso='1') then
    --caso llamado a excepcion
    ExceptionControl <= "01";
    store <= '1';
    s_exceptionEnCurso <= '1';
	 s_test <= "0010";
else
    --caso sin excepcion
    ExceptionControl <= "00";
    store <= '0';
    s_exceptionEnCurso <= '0';
	 s_test <= "1000";
end if;
end if;
end process;
	 
	-- Generacion del buffer de control 
	BufferControl <= ((Zero and s_Branch) or s_jump) & s_resultSRC & s_MemWrite & s_aluControl 
                   & s_ALUSrc & s_ImmSrc & s_RegWrite;
    
	
end architecture;