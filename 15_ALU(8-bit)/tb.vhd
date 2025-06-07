library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end alu_tb;

architecture beh of alu_tb is

    component alu
        port(
            a   : in  std_logic_vector(7 downto 0);
            b   : in  std_logic_vector(7 downto 0);
            sel : in  std_logic_vector(2 downto 0);
            res : out std_logic_vector(7 downto 0)
        );
    end component;

    signal a,b : std_logic_vector(7 downto 0) := (others => '0');
    signal sel : std_logic_vector(2 downto 0) := (others => '0');
    signal res : std_logic_vector(7 downto 0);

begin

    u1:alu port map(a,b,sel,res);

    process
    begin
        a <= "00000101"; -- 5
        b <= "00000011"; -- 3
        sel <= "000";    
        wait for 10 ns;

        sel <= "001";    
        wait for 10 ns;

        sel <= "010";    
        wait for 10 ns;

        sel <= "011";    
        wait for 10 ns;

        sel <= "100";   
        wait for 10 ns;

        sel <= "111";    
        wait for 10 ns;

        wait;
    end process;

end beh;
