library ieee;
use ieee.std_logic_1164.all;

entity graytobin_d is
  port (
    gray:in std_logic_vector(3 downto 0);
    bin:out std_logic_vector(3 downto 0)
  );
end graytobin_d;

architecture dtf of graytobin_d is
begin
  bin(3)<=gray(3);
  bin(2)<=gray(3)xor gray(2);
  bin(1)<=gray(3)xor gray(2)xor gray(1);
  bin(0)<=gray(3)xor gray(2)xor gray(1)xor gray(0);
end dtf;