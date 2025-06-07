library ieee;
use ieee.std_logic_1164.all;

entity bintogray_d is
   port(bin:in std_logic_vector(3 downto 0);
	gry:out std_logic_vector(3 downto 0));
end bintogray_d;

architecture dtf of bintogray_d is
begin
	gry(3)<=bin(3);
	gry(2)<=bin(3) xor bin(2);
	gry(1)<=bin(2) xor bin(1);
	gry(0)<=bin(1) xor bin(0);
end dtf;
