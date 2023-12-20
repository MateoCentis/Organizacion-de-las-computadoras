library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity DataPath is
    port(
        Clk: in std_logic;
		Reset : in std_logic;
        BufferControl : in std_logic_vector(10 downto 0);
        instr,ReadData : in std_logic_vector(31 downto 0);
        Zero : out std_logic;
        PC,ALUResult,WriteData : out std_logic_vector(31 downto 0);
        MemWrite : out std_logic;
		  
		  -- agregado
		  ExceptionControl : in std_logic_vector(1 downto 0);
		  store : in std_logic);
end DataPath;

architecture arch of DataPath is

    signal immExt,Result,SrcB,RD1,RD2,PCNext,PCPlus,PCTarget,s_PC,s_ALUResult : std_logic_vector(31 downto 0);
	 -- agregado
	 signal s_out_pc,s_PCNext : std_logic_vector(31 downto 0);
	 

begin

    regfile : entity work.regfile
    port map(
        clk => Clk,
        a1 => instr(19 downto 15),
        a2 => instr(24 downto 20),
        a3 => instr(11 downto 7),
        rd1 => RD1,
        rd2 => RD2,
        wd3 => Result,
        we3 => BufferControl(0)
    );

    flopr : entity work.flopr
    port map(
        clk => Clk,
        reset => Reset,
        d => PCNext,
        q => s_PC
    );

    aluPcTarget : entity work.adder
    port map(
        a => s_PC,
        b => immExt,
        y => PCTarget
    );

    aluGeneral : entity work.alu
    port map(
        a => RD1,
        b => SrcB,
        ALUControl => BufferControl(6 downto 4),
		  Zero => Zero,
        ALUResult => s_ALUResult
    );

    aluMas4 : entity work.adder
    port map(
        a => s_PC,
        b => x"00000004",
        y => PCPlus
    );
	 
	 
-- Mux que le llega al PCSource
    muxPreFlopr : entity work.mux2
    port map(
        d0 => PCPlus,
        d1 => PCTarget,
        y => s_PCNext,
        s => BufferControl(10)
    );
	 
	 muxExcepciones : entity work.mux3
    port map(
        d0 => s_PCNext, --Direccion de programa que sale del Multiplexor
								--que decide entre PCPlus o PCTarget
		  d1 => x"A0000000", --Direccion de programa de la excepcion
		  d2 => s_out_PC, --Direccion de programa que guarda StorePC
        y => PCNext, --Entrada del PC
        s => ExceptionControl --Nueva señal de control agregada
    );
	 
	 -- Mux que recibe resultSCR
	 muxPostDataMem : entity work.mux3
    port map(
        d0 => s_ALUResult,
        d1 => ReadData,
		  d2 => PCPlus,
        y => Result,
        s => BufferControl(9 downto 8)
    );

    muxPreAlu : entity work.mux2
    port map(
        d0 => RD2,
        d1 => immExt,
        y => SrcB,
        s => BufferControl(3)
    );


    extend : entity work.extend
    port map(
        instr => instr(31 downto 7),
        immext => immExt,
        immsrc => BufferControl(2 downto 1)
    );
	 
	 -- Agregado
	 storePC : entity work.storePC
	 port map(
		store => store,
        in_PC => s_PC,
        out_PC => s_out_PC, 
		clk => Clk
	 );

    WriteData <= RD2;
    MemWrite <= BufferControl(7);
	 PC <= s_PC;
	 ALUResult <= s_ALUResult;
end arch;