library ieee;
use ieee.std_logic_1164.all;

entity jkff_b is
   port(clk,j,k,pr,clr:in std_logic;
	q,qbar:out std_logic);
end jkff_b;

architecture bhv of jkff_b is
begin
	func:process(clk,pr,clr)
	  variable jk: std_logic_vector(0 to 1) := "00";
	begin
	if pr='1' then
	  q<='1';

	elsif clr='1' then
	  q<='0';	  
		
	elsif rising_edge(clk) then
	jk:=j & k;
	case jk is
	when "01" => q<='0';
	when "10" => q<='1';
	when "11" => q<=not q;
	when others=> null;
	end case;
	end if;
	end process;

	qbar<=not q;
end bhv;
	