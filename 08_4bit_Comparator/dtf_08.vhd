library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp4 is
    port(a,b : in std_logic_vector(3 downto 0);
         g,e,l : out std_logic);
end comp4;

architecture simp of comp4 is
    signal au, bu : unsigned(3 downto 0);
begin
    au <= unsigned(a);
    bu <= unsigned(b);

    g <= '1' when au > bu else '0';
    e <= '1' when au = bu else '0';
    l <= '1' when au < bu else '0';
end simp;