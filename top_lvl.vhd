library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top_level is
    Port ( Reset : in  STD_LOGIC;
           Jogada : in  STD_LOGIC_VECTOR (9 downto 1);
           Leds1 : out  STD_LOGIC_VECTOR (9 downto 1);
           Leds2 : out  STD_LOGIC_VECTOR (9 downto 1);
           Invalido : out  STD_LOGIC);
end Top_level;

architecture Jogo_Velha of Top_level is

begin


end Jogo_Velha;

