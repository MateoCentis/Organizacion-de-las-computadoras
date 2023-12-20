--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:18:58 11/10/2022
-- Design Name:   
-- Module Name:   /home/tobias/Escritorio/RiscV2.0/RiscV2.0/tb_RISCV.vhd
-- Project Name:  RiscV2.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RISCV
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
 
ENTITY tb_RISCV IS
END tb_RISCV;
 
ARCHITECTURE behavior OF tb_RISCV IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RISCV
    PORT(
         clk : IN  std_logic;
         Reset : IN  std_logic;
         pulso : IN  std_logic;
         MemWrite : OUT  std_logic;
         DataAdress : OUT  std_logic_vector(31 downto 0);
         WriteData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal pulso : std_logic := '0';

 	--Outputs
   signal MemWrite : std_logic;
   signal DataAdress : std_logic_vector(31 downto 0);
   signal WriteData : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RISCV PORT MAP (
          clk => clk,
          Reset => Reset,
          pulso => pulso,
          MemWrite => MemWrite,
          DataAdress => DataAdress,
          WriteData => WriteData
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

 

      -- insert stimulus here 
		      -- hold reset state for 100 ns.
      wait for 10 ns;	

      --wait for clk_period*10;

      -- insert stimulus here
		Reset <= '1';
		
		
		wait for 15 ns;
		
		Reset <= '0';
		
		wait for 200 ns;
		pulso <= '1';
		
		wait for 10 ns;
		pulso <= '0';
		
		
      wait;
   end process;

END;
