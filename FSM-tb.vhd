LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values--USE ieee.numeric_std.ALL;
 
ENTITY FSM_tb IS
END FSM_tb;
 
ARCHITECTURE behavior OF FSM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT maquina
    PORT(
         jogada : IN  std_logic_vector(9 downto 1);
         two_plays : IN  std_logic;
         reset : IN  std_logic;
         leds1 : OUT  std_logic_vector(9 downto 1);
         leds2 : OUT  std_logic_vector(9 downto 1);
         invalido : OUT  std_logic;
         placar1 : OUT  std_logic_vector(7 downto 0);
         placar2 : OUT  std_logic_vector(7 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal jogada : std_logic_vector(9 downto 1) := (others => '0');
   signal two_plays : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal leds1 : std_logic_vector(9 downto 1);
   signal leds2 : std_logic_vector(9 downto 1);
   signal invalido : std_logic;
   signal placar1 : std_logic_vector(7 downto 0);
   signal placar2 : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: maquina PORT MAP (
          jogada => jogada,
          two_plays => two_plays,
          reset => reset,
          leds1 => leds1,
          leds2 => leds2,
          invalido => invalido,
          placar1 => placar1,
          placar2 => placar2,
          clk => clk
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
     wait for Clk_period*10;
		
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
		
      Jogada <= "000000100"; --Jogador 2
		wait for Clk_period*10;
		
      Jogada <= "000000000";
		wait for Clk_period*10;

      Jogada <= "000001000"; --Jogador 1
		wait for Clk_period*10; 
		
      Jogada <= "000000000";
		wait for Clk_period*10;
		
      Jogada <= "001000000"; --Jogador 2
		wait for Clk_period*10;
      
		Jogada <= "000000000";
		wait for Clk_period*10;

      Jogada <= "001000000"; --Jogador 1
		wait for Clk_period*20; --Jogador 1 ganha!
		
------------------------------------------------Com a máquina------------
		
		Two_plays <= '0';
		Reset <= '1';
      wait for Clk_period*10;
		
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
