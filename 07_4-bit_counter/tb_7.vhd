
library ieee;
use ieee.std_logic_1164.all;

entity up_cnt_tb is
end up_cnt_tb;

architecture beh of up_cnt_tb is
    signal c : std_logic := '0';
    signal r : std_logic := '1';  
    signal cnt : std_logic_vector(3 downto 0);

    component up_cnt
        port(clk,rst : in std_logic;
             cnt : out std_logic_vector(3 downto 0));
    end component;
begin
    uut: up_cnt port map(c,r,cnt);

    c <= not c after 5 ns;

    process
    begin
        wait for 10 ns;  
        r <= '0';        
        wait for 120 ns; 
        wait;            
    end process;

end beh;