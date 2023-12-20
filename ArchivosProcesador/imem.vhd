library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use STD.TEXTIO.all;
use IEEE.NUMERIC_STD.all;
--use ieee.std_logic_textio.all;

entity imem is
	port(	a: in STD_LOGIC_VECTOR(31 downto 0);
			rd: out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture behave of imem is
--	type ramtype is array(63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
---- initialize memory from file
--	impure function init_ram_hex return ramtype is
--	file text_file : text open read_mode is "riscvtest.txt";
--		variable text_line : line;
--		variable ram_content : ramtype;
--		variable i : integer := 0;
--
--begin
--	for i in 0 to 63 loop -- set all contents low
--		ram_content(i) := (others => '0');
--	end loop;
--  
--	while not endfile(text_file) loop -- set contents from file
--		readline(text_file, text_line);
--		hread(text_line, ram_content(i));
--		i := i + 1;
--	end loop;
--  
--	return ram_content;
--end function;
--
--	signal mem : ramtype := init_ram_hex;
--begin
---- read memory
--	process(a) begin
--		rd <= mem(to_integer(unsigned(a(31 downto 2))));
--	end process;
type rom_type is array (0 to 31) of std_logic_vector (31 downto 0);                 
signal ROM : rom_type:= (
	X"00300413",
	X"00100493",
	X"01000913",
	X"009462b3",
	X"00947333",
	X"009403b3",
	X"40940e33",
	X"40848eb3",
	X"00942f33",
	X"0084afb3",
	--Se agrego esta linea
	X"009eaf33",
	X"00100293",
	X"00000313",
	X"01228863",
	X"005282b3",
	X"00130313",
	X"ff5ff06f",
	--Se cambio esta linea
	--X"000004b3",
	X"00000493",
	X"00000293",
	X"00a00313",
	X"00628863",
	X"008484b3",
	X"00128293",
	X"ff5ff06f",
	--Se agrego esta linea
	X"00802023",
	X"00902223",
	X"01202423",
	X"00002403",
	X"00402483",
	X"00802903",
--	X"40000e13",
--	X"01ce0e33",
--	X"01ce0e33",
--	X"01ce0e33",
--	X"008e2023",
--	X"009e2223",
--	X"000e2283",
--	X"004e2303",

	-- escribr el programa
	others => X"00000000");


signal ExceptionInst : rom_type:= (
	X"00100d13",
	X"03c00d93",
	X"01bd2023",
	X"00000000",
	others => X"00000000");

signal s_aux : std_logic_vector(31 downto 0);

begin

process(a)
begin
 if  a(31 downto 24) = X"28" then
	s_aux <= "00000000" & a(23 downto 0);
	rd <= ExceptionInst(to_integer(unsigned(s_aux)));
else 
   rd <= ROM(to_integer(unsigned(a)));
end if;
end process;

--Busqueda


end;