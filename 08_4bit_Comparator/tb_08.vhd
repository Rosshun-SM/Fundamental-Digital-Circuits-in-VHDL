library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp_tb is
end comp_tb;

architecture test of comp_tb is
    signal a,b:std_logic_vector(3 downto 0);
    signal gt,eq,ls:std_logic;
    signal cnt:unsigned(7 downto 0):=(others=>'0');

    component comp4
        port(a,b:in std_logic_vector(3 downto 0); 
	g,e,l:out std_logic);
    end component;

begin
    u1:comp4 port map(a,b,gt,eq,ls);
    stim:process
    begin
        for i in 0 to 255 loop
            cnt<=to_unsigned(i,8);
            a<=std_logic_vector(cnt(7 downto 4));
            b<=std_logic_vector(cnt(3 downto 0));
            wait for 10 ns;
        end loop;
        wait;
    end process;
end test;