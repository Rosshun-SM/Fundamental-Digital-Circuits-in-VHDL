library ieee;
use ieee.std_logic_1164.all;

entity parity_gen is
    port(data : in std_logic_vector(3 downto 0);
	 even_parity,odd_parity:out std_logic);
end parity_gen;

architecture bhv of parity_gen is
begin
    process(data)
        variable parity : std_logic;
    begin
        parity := data(3) xor data(2) xor data(1) xor data(0);
        even_parity <= parity;
        odd_parity  <= not parity;
    end process;
end bhv;