library ieee;
use ieee.std_logic_1164.all;

entity xorg is
   port(x,y:in std_logic;
	o:out std_logic);
end xorg;

architecture datf of xorg is
begin

	o<=x xor y;
end datf;

library ieee;
use ieee.std_logic_1164.all;

entity bintogray_s is
   port(bin:in std_logic_vector(3 downto 0);
	gry:out std_logic_vector(3 downto 0));
end bintogray_s;

architecture str of bintogray_s is

	component xorg
	   port(x,y:in std_logic;
		o:out std_logic);
	end component;
begin
	gry(3)<=bin(3);

	xor1:xorg port map(bin(3),bin(2),gry(2));
	xor2:xorg port map(bin(2),bin(1),gry(1));
	xor3:xorg port map(bin(1),bin(0),gry(0));
end str;
