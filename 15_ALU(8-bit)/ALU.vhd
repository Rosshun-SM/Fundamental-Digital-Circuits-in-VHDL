-- add 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity add is
    port(a,b : in std_logic_vector(7 downto 0);
         s : out std_logic_vector(7 downto 0));
end add;

architecture beh of add is
begin
    s <= std_logic_vector(unsigned(a)+unsigned(b));
end beh;

-- sub 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sub is
    port(a,b : in std_logic_vector(7 downto 0);
         d : out std_logic_vector(7 downto 0));
end sub;

architecture beh of sub is
begin
    d <= std_logic_vector(unsigned(a)-unsigned(b));
end beh;

-- logic unit 
library ieee;
use ieee.std_logic_1164.all;

entity lu is
    port(a,b : in std_logic_vector(7 downto 0);
         sel : in std_logic_vector(1 downto 0);
         r : out std_logic_vector(7 downto 0));
end lu;

architecture beh of lu is
begin
    process(a,b,sel)
    begin
        case sel is
            when "00" => r <= a and b;
            when "01" => r <= a or b;
            when "10" => r <= a xor b;
            when others => r <= (others=>'0');
        end case;
    end process;
end beh;

--ALU
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port(a,b : in std_logic_vector(7 downto 0);
         sel : in std_logic_vector(2 downto 0);
         res : out std_logic_vector(7 downto 0));
end alu;

architecture str of alu is

    component add is
        port(a,b: in std_logic_vector(7 downto 0);
             s: out std_logic_vector(7 downto 0));
    end component;

    component sub is
        port(a,b: in std_logic_vector(7 downto 0);
             d: out std_logic_vector(7 downto 0));
    end component;

    component lu is
        port(a,b: in std_logic_vector(7 downto 0);
             sel: in std_logic_vector(1 downto 0);
             r: out std_logic_vector(7 downto 0));
    end component;

    signal s,sb,l : std_logic_vector(7 downto 0);
    signal ls : std_logic_vector(1 downto 0);

begin

    uadd:add port map(a=>a,b=>b,s=>s);
    usub:sub port map(a=>a,b=>b,d=>sb);
    ls <= sel(1 downto 0);
    ulu:lu port map(a=>a,b=>b,sel=>ls,r=>l);

    process(sel,s,sb,l)
    begin
        case sel is
            when "000" => res <= s;
            when "001" => res <= sb;
            when "010" => res <= l;
            when "011" => res <= l;
            when "100" => res <= l;
            when others => res <= (others=>'0');
        end case;
    end process;

end str;