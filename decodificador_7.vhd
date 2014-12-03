LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

ENTITY Decodificador_7segmentos is
	PORT (  bcd   : in  std_logic_vector(3 downto 0);
			blank : in  std_logic;
			seg	  : out std_logic_vector(6 downto 0)
			);
END ENTITY Decodificador_7segmentos;

ARCHITECTURE arch OF Decodificador_7segmentos IS
	signal seg_tmp: std_logic_vector(6 downto 0);
BEGIN
	with bcd select
	seg_tmp <=  "1000000" when "0000", --0
					"1111001" when "0001", --1
					"0100100" when "0010", --2
					"0110000" when "0011", --3
					"0011001" when "0100", --4
					"0010010" when "0101", --5
					"0000010" when "0110", --6
					"1111000" when "0111", --7
					"0000000" when "1000", --8
					"0010000" when "1001", --9
					"0111111" when "1111", -- Sinal negativo
					"1111111" when "1110", -- Sem sinal
					"0110110" when others; --invalido
					
	seg <= 	   "1111110" when blank = '1'
	else seg_tmp;
END ARCHITECTURE arch;

