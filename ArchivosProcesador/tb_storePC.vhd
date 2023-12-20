--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:01:40 11/10/2022
-- Design Name:   
-- Module Name:   /home/tobias/Escritorio/RiscV2.0/RiscV2.0/tb_storePC.vhd
-- Project Name:  RiscV2.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: storePC
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_storePC IS
END tb_storePC;
 
ARCHITECTURE behavior OF tb_storePC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT storePC
    PORT(
         store : IN  std_logic;
         in_PC : IN  std_logic_vector(31 downto 0);
         out_PC : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal store : std_logic := '0';
   signal in_PC : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal out_PC : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: storePC PORT MAP (
          store => store,
          in_PC => in_PC,
          out_PC => out_PC
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	


      -- insert stimulus here 
			store <= "0";
			in_PC <= x"10000000";
			wait for 10 ns;
			store <= "1";
			in_PC <= x"11000000";
			wait for 10 ns;
			store <= "1";
			in_PC <= x"11000000";
			
      wait;
   end process;

END;
