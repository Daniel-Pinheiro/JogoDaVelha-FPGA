library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multplex_displays is
	    Port ( clk : in  STD_LOGIC;
           digito : out  STD_LOGIC_VECTOR(6 DOWNTO 0);
           displays : out  STD_LOGIC_VECTOR(4 DOWNTO 1);
			  display0, display1, display2, display3 : in STD_LOGIC_VECTOR(6 DOWNTO 0);
			  ponto 	: out  STD_LOGIC );
end multplex_displays;

architecture Behavioral of multplex_displays is

	signal contagem: integer range 0 to 40000;
begin

	ckDivider: process(clk)
		begin
		if rising_edge(clk) then 
		contagem <= contagem + 1; 
		
			if contagem = 0 then
				digito <= display0;
				displays <= "1110";
				ponto <= '0';
			elsif contagem = 10000 then
				digito <= display1;
				displays <= "1101"; 
				ponto <= '1';
			elsif contagem = 20000 then
				digito <= display2;
				displays <= "1011"; 
				ponto <= '0';
			elsif contagem = 30000 then
				digito <= display3;
				displays <= "0111";
				ponto <= '0';
			elsif contagem = 40000 then
				contagem <= 0; 				
			end if;
			
		end if; 
	end process;
	
end Behavioral;

