library ieee;
use ieee.std_logic_1164.all;

entity tb_shift4 is
end tb_shift4;

architecture test of tb_shift4 is
    component shift4
        port(clk,reset,si : in std_logic; 
	q : out std_logic_vector(3 downto 0));
    end component;

    signal clk, rst, si : std_logic := '0';
    signal q : std_logic_vector(3 downto 0);

begin
    uut: shift4 port map(clk,rst,si,q);

    process
    begin
        while true loop
            clk <= '0'; wait for 10 ns; 
	    clk <= '1'; wait for 10 ns;
        end loop;
    end process;

    process
    begin
        rst <= '1'; wait for 25 ns; 
	rst <= '0';
        si <= '1'; wait for 20 ns;
        si <= '0'; wait for 20 ns;
        si <= '1'; wait for 20 ns;
        si <= '1'; wait for 20 ns;
        wait;
    end process;
end test;