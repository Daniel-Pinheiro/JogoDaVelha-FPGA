----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:51:28 10/20/2014 
-- Design Name: 
-- Module Name:    multplex_displays - Behavioral 
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

entity multplex_displays is
	    Port ( clk : in  STD_LOGIC;
           digito : out  STD_LOGIC_VECTOR(6 DOWNTO 0);
           displays : out  STD_LOGIC_VECTOR(4 DOWNTO 1);
			  display0, display1, display2, display3 : in STD_LOGIC_VECTOR(6 DOWNTO 0));

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
			elsif contagem = 10000 then
				digito <= display1;
				displays <= "1101"; 
			elsif contagem = 20000 then
				digito <= display2;
				displays <= "1011"; 
			elsif contagem = 30000 then
				digito <= display3;
				displays <= "0111";
			elsif contagem = 40000 then
				contagem <= 0; 				
--			else
--				contagem <= 0; 				
			end if;
		end if; 
	end process;
	

end Behavioral;

