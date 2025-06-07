library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity jkff_tb is
end jkff_tb;

architecture beh of jkff_tb is

    component jkff_b
   	port(clk,j,k,pr,clr:in std_logic;
	q,qbar:out std_logic);
    end component;

    signal clk, j, k, pr, clr : std_logic := '0';
    signal q, qbar : std_logic;

begin

    u1: jkff_b port map (clk,j,k,pr,clr,q,qbar);

    clk_proc: process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    stim_proc: process
	variable jk_vec : std_logic_vector(1 downto 0);
    begin
        pr <= '1'; clr <= '0';
        wait for 10 ns;
        pr <= '0';
        wait for 10 ns;

        clr <= '1';
        wait for 10 ns;
        clr <= '0';
        wait for 10 ns;
        for i in 0 to 3 loop
            jk_vec := std_logic_vector(to_unsigned(i, 2));
            j <= jk_vec(1);
            k <= jk_vec(0);
            wait for 10 ns;
        end loop;
        j <= '1';
        k <= '1';
        wait for 20 ns;

        wait;
    end process;

end beh;
