--AND
library ieee;
use ieee.std_logic_1164.all;

entity and_g is
   port(x,y:in std_logic;
	o:out std_logic);
end and_g;

architecture dtf of and_g is
begin
	o<=x and y;
end dtf;

--OR
library ieee;
use ieee.std_logic_1164.all;

entity or_g is
   port(x,y:in std_logic;
	o:out std_logic);
end or_g;

architecture dtf of or_g is
begin
	o<=x or y ;
end dtf;

--2X1_MUX
library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_s is
   port(i0,i1,s0:in std_logic;
	y:out std_logic);
end mux2x1_s;

architecture str of mux2x1_s is
	signal t1,t2,not_s0:std_logic:='0';
	
	component or_g 
   	   port(x,y:in std_logic;
		o:out std_logic);
	end component;

	component and_g
   	   port(x,y:in std_logic;
		o:out std_logic);
	end component;

begin
	not_s0<=not s0;

	and1:and_g port map(i0, not_s0, t1);
	and2:and_g port map(i1, s0, t2);
	or1:or_g port map(t1, t2, y);
end str;