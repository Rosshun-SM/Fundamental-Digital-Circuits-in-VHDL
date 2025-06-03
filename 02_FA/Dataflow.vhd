library ieee;
use ieee.std_logic_1164.all;

entity fa_d is
   port(a,b,cin:in std_logic;
	sum,cout:out std_logic);
end fa_d;

architecture dtf of fa_d is
begin
	sum<=a xor b xor cin;
	cout<= (a and b) or (b and cin) or (cin and a);
end dtf;