library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity graytobin_tb is
end graytobin_tb;

architecture test of graytobin_tb is
  signal gray:std_logic_vector(3 downto 0);
  signal bin_d,bin_s:std_logic_vector(3 downto 0);

  component graytobin_d
    port(gray:in std_logic_vector(3 downto 0);bin:out std_logic_vector(3 downto 0));
  end component;

  component graytobin_s
    port(gray:in std_logic_vector(3 downto 0);bin:out std_logic_vector(3 downto 0));
  end component;

begin
  u1:graytobin_d port map(gray=>gray,bin=>bin_d);
  u2:graytobin_s port map(gray=>gray,bin=>bin_s);

  process
  begin
    for i in 0 to 15 loop
      gray<=std_logic_vector(to_unsigned(i,4));
      wait for 10 ns;
    end loop;
    wait;
  end process;
end test;