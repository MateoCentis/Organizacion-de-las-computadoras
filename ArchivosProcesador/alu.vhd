library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
	port(	a, b: in STD_LOGIC_VECTOR(31 downto 0);
			ALUControl: in STD_LOGIC_VECTOR(2 downto 0);
			ALUResult:   out STD_LOGIC_VECTOR(31 downto 0);
			Zero: out STD_LOGIC);
end alu;

architecture Behavioral of alu is

	signal srca_ext, srcb_ext, sum_ext, sub : unsigned(31 downto 0);
	signal slt, temp1: STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
begin
	srca_ext <= unsigned(a);	--'0' & 
	srcb_ext <= unsigned(b) when ALUControl(2) = '0' else unsigned(not b) +1; 
	sum_ext <= srca_ext + srcb_ext;
	sub <= unsigned(a) - unsigned(b);
	slt <= X"00000001" when sub(31) = '1' else X"00000000"; 
	-- zero <= '1' when (sum_ext = X"00000000") else '0'; 
	zero <= '1' when (sub = X"00000000") else '0';
	with ALUControl(2 downto 0) select 
		-- Se corrigieron los when para respetar La tabla alu decoder
--		aluResult <= 	a and std_logic_vector(srcb_ext(31 downto 0)) when "000",
--							a or std_logic_vector(srcb_ext(31 downto 0)) when "001",
--							a Xor std_logic_vector(srcb_ext(31 downto 0)) when "100",
--							std_logic_vector(sum_ext(31 downto 0)) when "010"|"110",
--							slt when "111",
--							x"00000000" when others;
		
		aluResult <= 	a and std_logic_vector(srcb_ext(31 downto 0)) when "010",
							a or std_logic_vector(srcb_ext(31 downto 0)) when "011",
							std_logic_vector(sum_ext(31 downto 0)) when "000",
							std_logic_vector(sub(31 downto 0)) when "001",
							slt when "101",
							x"00000000" when others;
end;