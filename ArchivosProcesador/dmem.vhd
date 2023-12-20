library IEEE;
use IEEE.STD_LOGIC_1164.all;
use STD.TEXTIO.all;
use IEEE.NUMERIC_STD.all;

entity dmem is
	port(	clk, we: in STD_LOGIC;
			a, wd:   in STD_LOGIC_VECTOR(31 downto 0);
			rd: out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture behave of dmem is
begin
	process (clk, a) --is -- este is no va
		type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
		variable mem: ramtype;
	begin
-- read or write memory
		--loop
			if rising_edge(clk) then
				if (we = '1') then 
					mem(to_integer(unsigned(a(7 downto 2)))) := wd;
				end if;
			end if;
			rd <= mem(to_integer(unsigned(a(7 downto 2))));
			-- wait on clk, a; --No va porque agregue lista de sensibilidad
		--end loop;
		-- wait; -- lo agregue porque daba error --No va porque agregue lista de sensibilidad
		--Loop ha iterado 64 veces. Use "set -loop_iteration_limit XX" para iterar más.
   end process;
end;