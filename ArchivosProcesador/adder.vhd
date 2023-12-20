library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all; --*

entity adder is
	port(	a, b: in STD_LOGIC_VECTOR(31 downto 0);
			y: out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture behave of adder is
	signal sa, sb, sy : signed(31 downto 0);
begin
	-- Se agregaron estas asignaciones
   sa <= signed(a);
	sb <= signed(b);
	sy <= sa + sb; -- tendrian que ser signed???
	y <= STD_LOGIC_VECTOR(sy);
end;