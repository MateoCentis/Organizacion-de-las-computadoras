----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:47 11/10/2022 
-- Design Name: 
-- Module Name:    storePC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity storePC is
    Port ( store : in  STD_LOGIC;
           in_PC : in  STD_LOGIC_VECTOR (31 downto 0);
           out_PC : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in STD_LOGIC);
end storePC;

architecture Behavioral of storePC is

signal s_PC : std_logic_vector (31 downto 0);

begin



process(store,clk)
begin
	if rising_edge(clk) then  
		if (store = '1') then
			s_PC <= s_PC;
		else
			s_PC <= in_PC;
		end if;
	end if;
end process;

out_PC <= s_PC;

end Behavioral;


