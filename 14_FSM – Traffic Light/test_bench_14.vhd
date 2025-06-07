library ieee;
use ieee.std_logic_1164.all;

entity tb_fsm is
end tb_fsm;

architecture test of tb_fsm is
    component traffic_fsm
        port(clk,reset,TA,TB : in std_logic;
             LA,LB : out std_logic_vector(1 downto 0));
    end component;

    signal clk,reset,ta,tb : std_logic := '0';
    signal la,lb : std_logic_vector(1 downto 0);


begin
    uut: traffic_fsm port map(clk,reset,ta,tb,la,lb);

    process
    begin
        while true loop
            clk <= '0'; wait for 10 ns;
            clk <= '1'; wait for 10 ns;
        end loop;
    end process;

    process
    begin
        reset <= '1'; wait for 30 ns; 
	reset <= '0'; wait for 10 ns;
        ta <= '0'; tb <= '1'; wait for 20 ns;
        ta <= '1'; tb <= '1'; wait for 20 ns;
        ta <= '1'; tb <= '1'; wait for 20 ns;
        ta <= '0'; tb <= '1'; wait for 20 ns;
        ta <= '1'; tb <= '0'; wait for 20 ns;
        ta <= '1'; tb <= '1'; wait for 20 ns;
        ta <= '1'; tb <= '1'; wait for 20 ns;
        ta <= '1'; tb <= '0'; wait for 20 ns;
        ta <= '0'; tb <= '1'; wait for 20 ns;
        wait;
    end process;
end test;
