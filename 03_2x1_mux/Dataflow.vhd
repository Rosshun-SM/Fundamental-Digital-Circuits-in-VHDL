library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_d is
   port(i0,i1,s0:in std_logic;
	y:out std_logic);
end mux2x1_d;

architecture dtf of mux2x1_d is
begin
	y<=(i0 and (not s0)) or (i1 and s0);
end dtf;