library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_d is
   port(i:in std_logic_vector(3 downto 0);
	s:in std_logic_vector(1 downto 0);
	y:out std_logic);
end mux4x1_d;

architecture dtf of mux4x1_d is
begin
	y<=((not s(0))and (not s(1)) and i(0)) or 
		((not s(0)) and s(1) and i(1)) or 
		(s(0) and (not s(1)) and i(2)) or 
		(s(0) and s(1) and i(3));
end dtf;