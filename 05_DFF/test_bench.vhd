library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dff_tb is
end dff_tb;

architecture test_bench of dff_tb is
	signal CLK,D,Q,QBAR : std_logic := '0';

	component dff_s
	   port(clk,d:in std_logic;
		q,qbar:out std_logic);
	end component;
begin
	dff:dff_s port map(CLK, D, Q, QBAR);

	clock:process
	begin
	while true loop
	 CLK<='0'; wait for 5 ns;
	 CLK<='1'; wait for 5 ns;
	end loop;
	end process;

	cases:process
	begin
	wait for 6 ns;
	for i in 0 to 1 loop
	D<='1';wait for 10 ns;
	D<='0';wait for 10 ns;
	end loop;
	end process;
end test_bench;