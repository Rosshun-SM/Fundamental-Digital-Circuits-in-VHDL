library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ha_b is
   port(a,b : in std_logic;
	sum,carry :out std_logic);
end ha_b;

architecture bhv of ha_b is
begin
  process(a,b)
  begin
	if a = '0' then
	 sum<=b; carry<='0';
	else
	 sum<=not b; carry<=b;
	end if;
  end process;
end bhv;
		