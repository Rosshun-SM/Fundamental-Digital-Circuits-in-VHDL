library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity up_cnt is
    port(clk,rst : in std_logic;
         cnt : out std_logic_vector(3 downto 0));
end up_cnt;

architecture beh of up_cnt is
    signal c : unsigned(3 downto 0) := (others=>'0');
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst='1' then
                c <= (others=>'0');
            else
                c <= c+1;
            end if;
        end if;
    end process;
    cnt <= std_logic_vector(c);
end beh;
