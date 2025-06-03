library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2x1_tb is 
end mux2x1_tb;

architecture test_bench of mux2x1_tb is
	signal A,B,S,Y: std_logic := '0';
	
	component mux2x1_s
   	   port(i0,i1,s0:in std_logic;
		y:out std_logic);
	end component;

begin
	u1:mux2x1_s port map(A, B, S, Y);

	cases:process
	variable count:std_logic_vector(2 downto 0) := "000";
	begin
	for i in 0 to 7 loop
	 A<=count(1);
	 B<=count(0);
	 S<=count(2);
	 wait for 10 ns;
	 count:=std_logic_vector(unsigned(count)+1);
	end loop;
	wait;
	end process;
end test_bench;	