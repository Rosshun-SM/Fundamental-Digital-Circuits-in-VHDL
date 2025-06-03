library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fa_tb is
end fa_tb;

architecture test_bench of fa_tb is
  signal A,B,CIN : std_logic :='0';
  signal SUM,COUT : std_logic;

  component fa_s is
   port(a,b,cin:in std_logic;
	sum,cout:out std_logic);
  end component;

begin
	u1:fa_s port map(a=>A, b=>B, cin=>CIN, sum=>SUM, cout=>COUT);

	cases:process
	variable count : std_logic_vector(2 downto 0) := "000";
	begin
	 for i in 0 to 7 loop
	  A<=count(2);
	  B<=count(1);
	  CIN<=count(0);
	  wait for 10 ns;
	  count := std_logic_vector(unsigned(count)+1);
	 end loop;
	 wait;
	end process;
end test_bench;	