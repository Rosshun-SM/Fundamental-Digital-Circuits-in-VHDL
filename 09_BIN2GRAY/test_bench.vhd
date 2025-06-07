
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end tb;

architecture test of tb is
	signal BIN,GRY:std_logic_vector(3 downto 0);

	component bintogray_s
	   port(bin:in std_logic_vector(3 downto 0);
		gry:out std_logic_vector(3 downto 0));
	end component;
begin
	conv:bintogray_s port map(BIN,GRY);
 
	process
	begin
	 for i in 0 to 15 loop
		BIN<=std_logic_vector(to_unsigned(i,4));
		wait for 10ns;
	end loop;
	wait;
	end process;
end test;