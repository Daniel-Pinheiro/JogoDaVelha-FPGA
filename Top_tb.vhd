--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:17:28 12/04/2014
-- Design Name:   
-- Module Name:   C:/Users/Daniel/Documents/UnB/Sistemas Digitais 2/Trabalhos/final/JogoDaVelha/Top_tb.vhd
-- Project Name:  SD2Projeto
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Top_level
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
 
ENTITY Top_tb IS
END Top_tb;
 
ARCHITECTURE behavior OF Top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Top_level
    PORT(
         Reset : IN  std_logic;
         Two_plays : IN  std_logic;
         Clk : IN  std_logic;
         Jogada : IN  std_logic_vector(9 downto 1);
         Leds1 : OUT  std_logic_vector(9 downto 1);
         Leds2 : OUT  std_logic_vector(9 downto 1);
         Digito : OUT  std_logic_vector(6 downto 0);
         Displays : OUT  std_logic_vector(3 downto 0);
         Ponto : OUT  std_logic;
         Invalido : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Two_plays : std_logic := '1';
   signal Clk : std_logic := '0';
   signal Jogada : std_logic_vector(9 downto 1) := (others => '0');

 	--Outputs
   signal Leds1 : std_logic_vector(9 downto 1);
   signal Leds2 : std_logic_vector(9 downto 1);
   signal Digito : std_logic_vector(6 downto 0);
   signal Displays : std_logic_vector(3 downto 0);
   signal Ponto : std_logic;
   signal Invalido : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ps;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top_level PORT MAP (
          Reset => Reset,
          Two_plays => Two_plays,
          Clk => Clk,
          Jogada => Jogada,
          Leds1 => Leds1,
          Leds2 => Leds2,
          Digito => Digito,
          Displays => Displays,
          Ponto => Ponto,
          Invalido => Invalido
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait for Clk_period;
		
      Jogada <= "100000000"; --Jogador 1
		wait for Clk_period*10;

      Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "100000000"; --Jogador 2
		wait for Clk_period*10;
		
		Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "100000000"; --Jogador 1
		wait for Clk_period*10;
		
      Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "000010000"; --Jogador 2
		wait for Clk_period*10;
		
      Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "010000000"; --Jogador 1
		wait for Clk_period*10;
		
      Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "000000001"; --Jogador 2
		wait for Clk_period*10;
		
		
      Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "000000100"; --Jogador 1
		wait for Clk_period*10;
		
      Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "00000100"; --Jogador 2
		wait for Clk_period*10;
		
		
      Jogada <= "000000000";
		wait for Clk_period*10;

      Jogada <= "001000000"; --Jogador 1
		wait for Clk_period*10; --Jogador 1 ganha!
		
------------------------------------------------Com a máquina------------
		
		Two_plays <= '0';
		Reset <= '1';
      wait for Clk_period;
		
		Reset <= '0';
      Jogada <= "100000000";
		wait for Clk_period*10;

      Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "100000000";
		wait for Clk_period*10;
		
      Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "010000000";
		wait for Clk_period*10;
		
      Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "000000100";
		wait for Clk_period*10;
		
      Jogada <= "000000000";
		wait for Clk_period*10;

      Jogada <= "001000000";
		wait for Clk_period*10; --Jogador 1 ganha!
				
      wait;
   end process;

END;
