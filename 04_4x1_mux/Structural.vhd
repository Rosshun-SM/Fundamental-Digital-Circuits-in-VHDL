--AND
library ieee;
use ieee.std_logic_1164.all;

entity and_g is
   port(x,y,z:in std_logic;
	o:out std_logic);
end and_g;

architecture dtf of and_g is
begin
	o<=x and y and z;
end dtf;

--OR
library ieee;
use ieee.std_logic_1164.all;

entity or_g is
   port(x,y,z,q:in std_logic;
	o:out std_logic);
end or_g;

architecture dtf of or_g is
begin
	o<=x or y or z or q ;
end dtf;

--MUX_4X1
library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_s is
   port(i:in std_logic_vector(0 to 3);
	s:in std_logic_vector(0 to 1);
	y:out std_logic);
end mux4x1_s;

architecture str of mux4x1_s is
	signal t1,t2,t3,t4,not_s0,not_s1 : std_logic :='0';
	
	component or_g 
   	   port(x,y,z,q:in std_logic;
		o:out std_logic);
	end component;

	component and_g
   	   port(x,y,z:in std_logic;
		o:out std_logic);
	end component;

begin
	not_s0<=not s(0);
	not_s1<=not s(1);

	and1:and_g port map(not_s0, not_s1, i(0), t1);
	and2:and_g port map(not_s0, s(1), i(1), t2);
	and3:and_g port map(s(0), not_s1, i(2), t3);
	and4:and_g port map(s(0), s(1), i(3), t4);
	or1:or_g port map(t1,t2,t3,t4,y);
end str;