library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4x1_tb is 
end mux4x1_tb;

architecture test_bench of mux4x1_tb is
	signal I:std_logic_vector(3 downto 0) :="0000";
	signal S:std_logic_vector(1 downto 0) :="00";
	signal y:std_logic :='0';
	
	component mux4x1_s
   	   port(i:in std_logic_vector(3 downto 0);
		s:in std_logic_vector(1 downto 0);
		y:out std_logic);
	end component;

begin
	u1:mux4x1_s port map(I, S, Y);

	cases:process
	variable count:std_logic_vector(5 downto 0) := "000000";
	begin
	for j in 0 to 64 loop
	 I(3)<=count(3);
	 I(2)<=count(2);
	 I(1)<=count(1);
	 I(0)<=count(0);
	 S(1)<=count(5);
	 S(0)<=count(4);
	 wait for 10 ns;
	 count:=std_logic_vector(unsigned(count)+1);
	end loop;
	wait;
	end process;
end test_bench;	
