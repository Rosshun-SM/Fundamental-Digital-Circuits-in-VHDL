library ieee;
use ieee.std_logic_1164.all;

entity shift4 is
    port(clk,reset,si : in std_logic; 
	q : out std_logic_vector(3 downto 0));
end shift4;

architecture bhv of shift4 is
    signal temp : std_logic_vector(3 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            temp <= (others => '0');
        elsif rising_edge(clk) then
            temp <= temp(2 downto 0) & SI;
        end if;
    end process;

    Q <= temp;
end bhv;
