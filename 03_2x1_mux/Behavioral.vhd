library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_b is
   port(i0,i1,s0:in std_logic;
	y:out std_logic);
end mux2x1_b;

architecture bhv of mux2x1_b is
begin
	recur:process(i0,i1,s0)
	begin
	if s0='0' then
	 y<=i0;
	else
	 y<=i1;
	end if;
	end process;
end bhv;