--XOR
library ieee;
use ieee.std_logic_1164.all;

entity xor_g is
   port(x,y,z:in std_logic;
	o:out std_logic);
end xor_g;

architecture dtf of xor_g is
begin
	o<=x xor y xor z;
end dtf;

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
   port(x,y,z:in std_logic;
	o:out std_logic);
end or_g;

architecture dtf of or_g is
begin
	o<=x or y or z;
end dtf;

--FA
library ieee;
use ieee.std_logic_1164.all;

entity fa_s is
   port(a,b,cin:in std_logic;
	sum,cout:out std_logic);
end fa_s;

architecture str of fa_s is
	signal t1,t2,t3 : std_logic :='0';

	component or_g is
   	port(x,y,z:in std_logic;
	     o:out std_logic);
	end component;

	component xor_g is
   	port(x,y,z:in std_logic;
	     o:out std_logic);
	end component;	

	component and_g is
   	port(x,y:in std_logic;
	     o:out std_logic);
	end component;
	
begin
	xor1:xor_g port map(a, b, cin, sum);
	and1:and_g port map(a, b, t1);
	and2:and_g port map(b, cin, t2);
	and3:and_g port map(cin, a, t3);
	or1:or_g port map(t1, t2, t3, cout);
end str;
