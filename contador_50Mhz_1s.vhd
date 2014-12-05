----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:48:37 12/04/2014 
-- Design Name: 
-- Module Name:    contador_50Mhz_1s - Behavioral 
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

entity conta_1s is
port ( 	 come�a   : in std_logic; 
			 terminou : out std_logic;
			 clk      : in std_logic); 
				
end conta_1s;

architecture Behavioral of conta_1s is

signal count500000 : integer range 0 to 49999999;
signal clk_100hz : std_logic := '0'; 
signal pb_sampled : std_logic; 

begin
	div_100Hz : process (clk, come�a) is
	begin 
		if come�a = '1' then 
			count500000 <= 49999999;
		elsif rising_edge(clk) then 
			if clk_100Hz = '1' then
				count500000 <= 49999999;
			else 
				count500000 <= count500000 - 1;
			end if;	
		end if;
	end process div_100Hz; 

clk_100Hz <= '1' when count500000 = 0 else '0';

debounce_pb : process (clk) is 
begin
		if rising_edge(clk) then
			if clk_100Hz = '1' then
					terminou <= '1';
			end if;
		end if;
end process debounce_pb; 
	

end Behavioral;

