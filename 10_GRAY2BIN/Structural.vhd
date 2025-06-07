-- XOR2
library ieee;
use ieee.std_logic_1164.all;

entity xor2 is
  port (
    a,b:in std_logic;
    y:out std_logic
  );
end xor2;

architecture dt of xor2 is
begin
  y<=a xor b;
end dt;

--
library ieee;
use ieee.std_logic_1164.all;

entity graytobin_s is
  port (
    gray:in std_logic_vector(3 downto 0);
    bin:out std_logic_vector(3 downto 0)
  );
end graytobin_s;

architecture str of graytobin_s is
  component xor2
    port(a,b:in std_logic;y:out std_logic);
  end component;

  signal s1,s2,s3:std_logic;

begin
  bin(3)<=gray(3);

  u1:xor2 port map(gray(3),gray(2),s1);
  bin(2)<=s1;

  u2:xor2 port map(s1,gray(1),s2);
  bin(1)<=s2;

  u3:xor2 port map(s2,gray(0),bin(0));

end str;