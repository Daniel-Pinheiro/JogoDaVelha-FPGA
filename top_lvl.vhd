library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_level is
    Port ( Reset, Clk : in  STD_LOGIC;
           Jogada : in  STD_LOGIC_VECTOR (9 downto 1);
           Leds1 : out  STD_LOGIC_VECTOR (9 downto 1);
           Leds2 : out  STD_LOGIC_VECTOR (9 downto 1);
			  Digito  : in  STD_LOGIC_VECTOR (6 downto 0);
			  Display, Ponto : out  STD_LOGIC;
           Invalido : out  STD_LOGIC);
	end Top_level;

architecture Jogo_Velha of Top_level is
	
	component debouncer is 
		Port (clk, reset  : in  STD_LOGIC;
				pb 			: in  STD_LOGIC;
				pb_debounced: out  STD_LOGIC);
	end component; 

	component conversor_binario_bcd
		Port (entrada   : in  std_logic_vector(7 downto 0);
				unidade   : out std_logic_vector(3 downto 0);
				dezena    : out std_logic_vector(3 downto 0));	
	end component; 
	
	component decodificador_7segmentos is 
		Port (bcd   : in  std_logic_vector(3 downto 0);
				blank : in  std_logic;
				seg	: out std_logic_vector(6 downto 0));
	end component; 
	
	component multplex_displays is
		Port (clk 												: in  STD_LOGIC;
				display0, display1, display2, display3 : in STD_LOGIC_VECTOR(6 DOWNTO 0);
				digito 											: out  STD_LOGIC_VECTOR(6 DOWNTO 0);
				displays 										: out  STD_LOGIC_VECTOR(4 DOWNTO 1);
				ponto 											: out  STD_LOGIC);
	end component;
			  
	signal aumenta_placar1, aumenta_placar2: STD_LOGIC;
	signal s_jogada :  STD_LOGIC_VECTOR (9 downto 1);
	signal placar1, placar2 :  STD_LOGIC_VECTOR (7 downto 0);
	signal placar1_unidade, placar1_dezena, placar2_unidade, placar1_dezena :  STD_LOGIC_VECTOR (3 downto 0);
	signal primeira_casa, segunda_casa, terceira_casa, quarta_casa :  STD_LOGIC_VECTOR (6 downto 0);
begin
	
	Button1: debouncer port map(Clk, '0', Jogada(1), s_jogada(1));
	Button2: debouncer port map(Clk, '0', Jogada(2), s_jogada(2));
	Button3: debouncer port map(Clk, '0', Jogada(3), s_jogada(3));
	Button4: debouncer port map(Clk, '0', Jogada(4), s_jogada(4));
	Button5: debouncer port map(Clk, '0', Jogada(5), s_jogada(5));
	Button6: debouncer port map(Clk, '0', Jogada(6), s_jogada(6));
	Button7: debouncer port map(Clk, '0', Jogada(7), s_jogada(7));
	Button8: debouncer port map(Clk, '0', Jogada(8), s_jogada(8));
	Button9: debouncer port map(Clk, '0', Jogada(9), s_jogada(9));
	
	ConvPlacar1: conversor_binario_bcd port map(placar1, placar1_unidade, placar1_dezena);
	ConvPlacar2: conversor_binario_bcd port map(placar2, placar2_unidade, placar1_dezena);
	
	DecodPlacar1uni: Decodificador_7segmentos port map(placar1_unidade, '0', quarta_casa);
	DecodPlacar1dez: Decodificador_7segmentos port map(placar1_dezena, '0', terceira_casa);
	DecodPlacar2uni: Decodificador_7segmentos port map(placar2_unidade, '0', segunda_casa);
	DecodPlacar2dez: Decodificador_7segmentos port map(placar2_dezena, '0', primeira_casa);
	
	DisplayPlacar: multplex_displays port map (Clk, primeira_casa, segunda_casa, terceira_casa, quarta_casa, Digito, Display, Ponto);

end Jogo_Velha;

