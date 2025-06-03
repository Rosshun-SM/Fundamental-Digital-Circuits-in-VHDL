library ieee;
use ieee.std_logic_1164.all;

entity fa_b is
   port(a,b,cin:in std_logic;
	sum,cout:out std_logic);
end fa_b;

architecture str of fa_b is
begin
	cond:process(a,b,cin)
	begin
	 if a<='0' then
	    if b<='0' then
		sum<=cin;
		cout<='0';
	    elsif b<='1' then
		sum<=not cin;
		cout<=cin;
	    end if;
	 elsif a<='1' then
	    if b<='0' then
		sum<=not cin;
		cout<=cin;
	    elsif b<='1' then
		sum<=cin;
		cout<='1';
	    end if;
	 end if;
	end process;
end str;
