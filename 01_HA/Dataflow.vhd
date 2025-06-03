--Half Adder in Dataflow
library ieee;
use ieee.std_logic_1164.all;

entity ha_d is
   port(a,b : in std_logic;
	sum,carry :out std_logic);
end ha_d;

architecture dtf of ha_d is
begin
	sum <= a xor b;
	carry <= a and b;
end dtf;