library ieee;
use ieee.std_logic_1164.all;

entity seg7_d is
    port(
        bin:in std_logic_vector(3 downto 0);
        seg:out std_logic_vector(6 downto 0)
    );
end seg7_d;

architecture dtf of seg7_d is
    signal a,b,c,d:std_logic;
begin
    a<=bin(3);
    b<=bin(2);
    c<=bin(1);
    d<=bin(0);

    seg(0)<=(not a and not c and not d)or(b and not c)or(a and not b and d);
    seg(1)<=(not a and not b and c and not d)or(b and c and d)or(a and d);
    seg(2)<=(not a and not b and d)or(c and d)or(a and b);
    seg(3)<=(not b and not c and not d)or(b and c and d)or(a and not b and c and not d);
    seg(4)<=(not d and((not b and not c)or(b and c)))or(a and not d);
    seg(5)<=(not a and not c and d)or(not a and b and not d)or(b and c and d);
    seg(6)<=(not a and not b and not c)or(b and c and d)or(a and not b and c);

end dtf;
