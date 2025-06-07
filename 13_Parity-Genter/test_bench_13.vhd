library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_parity_gen is
end tb_parity_gen;

architecture test of tb_parity_gen is
    component parity_gen
        port(data : in std_logic_vector(3 downto 0); 
	even_parity,odd_parity : out std_logic);
    end component;

    signal data : std_logic_vector(3 downto 0) := "0000";
    signal even_parity,odd_parity : std_logic;

begin
    uut: parity_gen port map(data,even_parity,odd_parity);

    process
    begin
        for i in 0 to 15 loop
            data <= std_logic_vector(to_unsigned(i, 4));
            wait for 20 ns;
        end loop;
        wait;
    end process;
end test;