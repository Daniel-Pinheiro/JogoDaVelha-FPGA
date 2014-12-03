library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_level is
    Port ( Reset : in  STD_LOGIC;
           Jogada : in  STD_LOGIC_VECTOR (9 downto 1);
           Leds1 : out  STD_LOGIC_VECTOR (9 downto 1);
           Leds2 : out  STD_LOGIC_VECTOR (9 downto 1);
			  Placar : in  STD_LOGIC_VECTOR (6 downto 0);
           Invalido : out  STD_LOGIC);
end Top_level;

architecture Jogo_Velha of Top_level is
	
	component debouncer is 
		Port (clk, reset : in  STD_LOGIC;
				pb : in  STD_LOGIC;
				pb_debounced : out  STD_LOGIC);
	end component; 

	component conversor_binario_bcd
		PORT (entrada   : in  std_logic_vector(7 downto 0);
				unidade   : out std_logic_vector(3 downto 0);
				dezena    : out std_logic_vector(3 downto 0));	
	end component; 
	
		component decodificador_7segmentos is 
		PORT (bcd   : in  std_logic_vector(3 downto 0);
				blank : in  std_logic;
				seg	: out std_logic_vector(6 downto 0));
	end component; 
	
	component multplex_displays is
		Port (clk : in  STD_LOGIC;
				display0, display1, display2, display3 : in STD_LOGIC_VECTOR(6 DOWNTO 0);
				digito : out  STD_LOGIC_VECTOR(6 DOWNTO 0);
				displays : out  STD_LOGIC_VECTOR(4 DOWNTO 1));
			  
	signal aumenta_placar1, aumenta_placar2: STD_LOGIC;
begin
	
	E0: debouncer port map(clk, '0', s_entrada(0), sig_pb_debounced(0)); 
	Placar1: conversor_binario_bcd port map(sig_A, s_unidade, s_dezena, s_centena, s_sinal,CLK);
	Placar2: conversor_binario_bcd port map(sig_A, s_unidade, s_dezena, s_centena, s_sinal,CLK);
	U4: Decodificador_7segmentos port map(s_unidade, blank, s_decod_uni);
	U8: multplex_displays port map (clk, 

end Jogo_Velha;

