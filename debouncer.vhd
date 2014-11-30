----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:43:06 09/10/2014 
-- Design Name: 
-- Module Name:    debouncer - Behavioral 
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

entity debouncer is
	port ( clk, reset : in std_logic;
			 pb         : in std_logic; 
			 pb_debounced : out std_logic); 
end debouncer;

architecture Behavioral of debouncer is

signal count500000 : integer range 0 to 499999;
signal clk_100hz : std_logic; 
signal pb_sampled : std_logic; 

begin
	div_100Hz : process (clk, reset) is
	begin 
		if reset = '1' then 
			count500000 <= 499999;
		elsif rising_edge(clk) then 
			if clk_100Hz = '1' then
				count500000 <= 499999;
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
				if pb = pb_sampled then 
					pb_debounced <= pb; 
				end if;
			pb_sampled <= pb;
		end if;
	end if;
end process debounce_pb; 
	
end Behavioral;

