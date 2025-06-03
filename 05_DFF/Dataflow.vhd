library ieee;
use ieee.std_logic_1164.all;

entity dff_b is
   port(clk,d:in std_logic;
	q,qbar:out std_logic);
end dff_b;

architecture bhv of dff_b is
begin
	process(clk)
	begin
	 if rising_edge(clk) then
		q<=d;
		qbar<=not d;
	 end if;
	end process;
end bhv;