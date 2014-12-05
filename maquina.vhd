library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 


entity maquina is

	Port( jogada     : in std_logic_vector(9 downto 1);
			two_plays  : in std_logic; 
			reset      : in std_logic; 
			leds1      : out std_logic_vector(9 downto 1);
			leds2      : out std_logic_vector(9 downto 1);
	      invalido   : out std_logic; 
			placar1    : out std_logic_vector(7 downto 0);
	      placar2    : out std_logic_vector(7 downto 0);
			clk        : in std_logic
			);

end maquina;

architecture Behavioral of maquina is

component conta_1s is 
	port ( começa   : in std_logic; 
			 terminou : out std_logic;
			 clk      : in std_logic	
			);

end component;  

type os_estados is (init, aguarda, outro_jogador, mesmo_lugar, jogada_invalida, marca_campo, ganhou1, ganhou2, ganhou3, ganhou4, ganhou5, ganhou6, ganhou7, ganhou8, ganhou9, deu_velha, pisca1, pisca2, proximo_jogo);
signal estado : os_estados;

signal vez: std_logic; 
signal play1: std_logic_vector(9 downto 1);
signal play2: std_logic_vector(9 downto 1); 

signal começa, terminou: std_logic; 
signal jogada_vencedora:  std_logic_vector(9 downto 1);
signal s_placar1:         std_logic_vector(7 downto 0);  
signal s_placar2:         std_logic_vector(7 downto 0);
signal resultado:         std_logic_vector(9 downto 1);
signal comparaçao1:         std_logic_vector(9 downto 1);
signal comparaçao2:         std_logic_vector(9 downto 1);

signal jogada_vencedora1: std_logic_vector(9 downto 1) := "111000000";
signal jogada_vencedora2: std_logic_vector(9 downto 1) := "000111000"; 
signal jogada_vencedora3: std_logic_vector(9 downto 1) := "000000111"; 
signal jogada_vencedora4: std_logic_vector(9 downto 1) := "100100100"; 
signal jogada_vencedora5: std_logic_vector(9 downto 1) := "010010010"; 
signal jogada_vencedora6: std_logic_vector(9 downto 1) := "001001001"; 
signal jogada_vencedora7: std_logic_vector(9 downto 1) := "100010001"; 
signal jogada_vencedora8: std_logic_vector(9 downto 1) := "001010100"; 

type array_8x9 is array(8 downto 1, 9 downto 1) of std_logic;
signal jogadas_vencedoras : array_8x9:= ("111000000", "000111000", "000000111" , "100100100", "010010010", "001001001", "100010001", "001010100" );


    


begin



contador: conta_1s port map(começa, terminou, clk); 
maquina: process(clk, reset,jogada) 
	begin 
		if reset = '1' then
			estado <= init; 
		elsif rising_edge(clk) then

			case estado is 
				when init => 
				estado <= aguarda;
				play1 <= "000000000"; 
				play2 <= "000000000";
				vez <= '0';
				s_placar1 <= "00000000";
				s_placar2 <= "00000000";
				invalido <= '0';
				começa <= '0';
				
---------------------------------------------				
				when aguarda => 
				if jogada = "000000000" then
					estado <= aguarda;
				else 
					for i in 1 to 9 loop 
						resultado(i) <= (jogada(i) and play1(i)) or (jogada(i) and play2(i));
					end loop; 	
					estado <= mesmo_lugar;  
				end if; 	
				leds1 <= play1; 
				leds2 <= play2;
---------------------------------------------				
				when outro_jogador => 
				vez <= not vez;
				estado <= aguarda; 
				
---------------------------------------------
				when mesmo_lugar => 
				if resultado = "000000000"  then 
					estado <= marca_campo;
				else 
					estado <= jogada_invalida;
					
				end if;
				invalido <= '0'; 	
		
---------------------------------------------				
				when jogada_invalida =>
				invalido <= '1'; 
				estado <= aguarda; 	
				
---------------------------------------------				
				when marca_campo =>
				if vez = '0' then 
					play1 <= play1 or jogada;
				else 
					play2 <= play2 or jogada; 
				end if;
				
				comparaçao1 <= play1 and jogada_vencedora1 ;
				comparaçao2 <= play2 and jogada_vencedora1 ;	
				jogada_vencedora <= jogada_vencedora1;
				
				estado <= ganhou1; 	
				
				
---------------------------------------------				
				when ganhou1 =>
					if (comparaçao1 = jogada_vencedora1) or (comparaçao2 = jogada_vencedora1)  then
						comparaçao1 <= play1 and jogada_vencedora2 ;
						comparaçao2 <= play2 and jogada_vencedora2 ;	
						jogada_vencedora <= jogada_vencedora2;
						estado <= pisca1;
					else
						estado <=  ganhou2;
					end if;
					
---------------------------------------------				
				when ganhou2 =>
					if (comparaçao1 = jogada_vencedora1) or (comparaçao2 = jogada_vencedora1)  then
						comparaçao1 <= play1 and jogada_vencedora3 ;
						comparaçao2 <= play2 and jogada_vencedora3 ;	
						jogada_vencedora <= jogada_vencedora3;
						estado <= pisca1;
					else
						estado <=  ganhou3;
					end if;
					
---------------------------------------------				
				when ganhou3 =>
					if (comparaçao1 = jogada_vencedora1) or (comparaçao2 = jogada_vencedora1)  then
						comparaçao1 <= play1 and jogada_vencedora4 ;
						comparaçao2 <= play2 and jogada_vencedora4 ;	
						jogada_vencedora <= jogada_vencedora4;
						estado <= pisca1;
					else
						estado <=  ganhou4;
					end if;
					
---------------------------------------------				
				when ganhou4 =>
					if (comparaçao1 = jogada_vencedora1) or (comparaçao2 = jogada_vencedora1)  then
						comparaçao1 <= play1 and jogada_vencedora5 ;
						comparaçao2 <= play2 and jogada_vencedora5 ;	
						jogada_vencedora <= jogada_vencedora5;
						estado <= pisca1;
					else
						estado <=  ganhou5;
					end if;
					
---------------------------------------------				
				when ganhou5 =>
					if (comparaçao1 = jogada_vencedora1) or (comparaçao2 = jogada_vencedora1)  then
						comparaçao1 <= play1 and jogada_vencedora6 ;
						comparaçao2 <= play2 and jogada_vencedora6 ;	
						jogada_vencedora <= jogada_vencedora6;
						estado <= pisca1;
					else
						estado <=  ganhou6;
					end if;
					
---------------------------------------------				
				when ganhou6 =>
					if (comparaçao1 = jogada_vencedora1) or (comparaçao2 = jogada_vencedora1)  then
						comparaçao1 <= play1 and jogada_vencedora7 ;
						comparaçao2 <= play2 and jogada_vencedora7 ;	
						jogada_vencedora <= jogada_vencedora7;
						estado <= pisca1;
					else
						estado <=  ganhou7;
					end if;
					
---------------------------------------------				
				when ganhou7 =>
					if (comparaçao1 = jogada_vencedora1) or (comparaçao2 = jogada_vencedora1)  then
						comparaçao1 <= play1 and jogada_vencedora7 ;
						comparaçao2 <= play2 and jogada_vencedora7 ;	
						jogada_vencedora <= jogada_vencedora2;
						estado <= pisca1;
					else
						estado <=  ganhou8;
					end if;
					
---------------------------------------------				
				when ganhou8 =>
					if (comparaçao1 = jogada_vencedora1) or (comparaçao2 = jogada_vencedora1)  then
						comparaçao1 <= play1 and jogada_vencedora7 ;
						comparaçao2 <= play2 and jogada_vencedora7 ;	
						jogada_vencedora <= jogada_vencedora2;
						estado <= pisca1;
					else
						estado <=  ganhou9;
					end if;
					
---------------------------------------------				
				when ganhou9 =>
					if (comparaçao1 = jogada_vencedora1) or (comparaçao2 = jogada_vencedora1)  then
						comparaçao1 <= play1 and jogada_vencedora7 ;
						comparaçao2 <= play2 and jogada_vencedora7 ;	
						jogada_vencedora <= jogada_vencedora2;
						estado <= pisca1;
					else
						estado <=  deu_velha;
					end if;
					
---------------------------------------------				
				when deu_velha =>
					if ( play1 or play2 ) = "111111111"  then
						play1 <= "000000000"; 
						play2 <= "000000000";
						estado <= aguarda;
					else
						estado <= outro_jogador;
					end if;
					
---------------------------------------------
				when pisca1 =>
				if vez = '0' then 
				leds1 <= jogada_vencedora; 
				else 
				leds2 <= jogada_vencedora; 
			   end if; 
				
				if jogada = "000000000" then 
				estado <= pisca1;
				else
				estado <= proximo_jogo;
				end if; 
				
				começa <= '1'; 
				if terminou = '1' then 
					começa <= '0'; 
					estado <= pisca2;
				end if; 		
---------------------------------------------
				when pisca2 =>	
				leds1 <= play1;
				leds2 <= play2;
				
				começa <= '1'; 
				if terminou = '1' then 
					começa <= '0'; 
					estado <= pisca1;
				end if; 		
				
				
---------------------------------------------
				when proximo_jogo =>
						if vez = '0' then 
						s_placar1 <= s_placar1 + '1';
						else 
						s_placar2 <= s_placar2 + '1';
						end if;
							
				
				
				
---------------------------------------------				
			end case;
		end if; 
	end process maquina;

	placar1 <= s_placar1;
	placar2 <= s_placar2;
end Behavioral;

