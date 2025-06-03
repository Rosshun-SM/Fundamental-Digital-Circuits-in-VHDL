--AND gate
library ieee;
use ieee.std_logic_1164.all;

entity and_g is
   port(x,y:in std_logic;
	out_a:out std_logic);
end and_g;

architecture dtf_a of and_g is
begin
	out_a<=x and y;
end dtf_a;

--XOR gate
library ieee;
use ieee.std_logic_1164.all;

entity xor_g is
   port(u,v:in std_logic;
	out_x:out std_logic);
end xor_g;

architecture dtf_a of xor_g is
begin
	out_x<=u xor v;
end dtf_a;

--HA 
library ieee;
use ieee.std_logic_1164.all;

entity ha_s is
   port(a,b:in std_logic;
	sum,carry:out std_logic);
end ha_s;

architecture str of ha_s is
	component and_g
	port(x,y: in std_logic;
	     out_a:out std_logic);
	end component;
	
	component xor_g
	port(u,v: in std_logic;
	     out_x:out std_logic);
	end component;

begin
	u1:xor_g port map(u=>a, v=>b, out_x=>sum);
	u2:and_g port map(x=>a ,y=>b, out_a=>carry);
end str;
