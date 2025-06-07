library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seg7_tb is
end seg7_tb;

architecture tb of seg7_tb is
    signal inb: std_logic_vector(3 downto 0);
    signal outg: std_logic_vector(6 downto 0);

    component seg7_b
        port (
            bin: in std_logic_vector(3 downto 0);
            seg: out std_logic_vector(6 downto 0)
        );
    end component;

begin
    uut: seg7_b port map (inb,outg);

    process
    begin
        for i in 0 to 15 loop
            inb <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;
        wait;
    end process;
end tb;
