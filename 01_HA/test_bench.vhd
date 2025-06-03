library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ha_tb is
end ha_tb;

architecture test_bench of ha_tb is
	signal A,B : std_logic := '0';
	signal SUM,CARRY : std_logic;

	component ha_s
	  port(a,b : in std_logic;
		sum,carry : out std_logic);
	end component;

begin
	U1:ha_s port map(a=>A, b=>B, sum=>SUM, carry=>CARRY);
	
	cases:process
		variable count: std_logic_vector(1 downto 0) := "00";
	        variable a_temp, b_temp : std_logic;
	begin
	  for i in 0 to 3 loop
        	a_temp := count(1);
        	b_temp := count(0);
		A <= count(1);
		B <= count(0);
		wait for 10ns;
		count := std_logic_vector(unsigned(count)+1);
	  end loop;
	  wait; -- to stop the process after the loop is completed
	end process;
end test_bench;