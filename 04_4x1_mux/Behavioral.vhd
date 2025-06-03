library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_b is
   port(i:in std_logic_vector(3 downto 0);
	s:in std_logic_vector(1 downto 0);
	y:out std_logic);
end mux4x1_b;

architecture bhv of mux4x1_b is
begin
	recur:process(i,s)
	begin
	case s is
	 when "00" => y<=i(3);
	 when "01" => y<=i(2);
	 when "10" => y<=i(1);
	 when "11" => y<=i(0);
	 when others => y<='X';
	end case;
	end process;
end bhv;