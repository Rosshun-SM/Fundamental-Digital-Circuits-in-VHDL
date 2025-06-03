--Here we use master slave D Flip-Flop to implement rising edge trigger
--This is because in structural modelling we can't directly implement edge trigger.

--NAND
library ieee;
use ieee.std_logic_1164.all;

entity nand_g is
   port(x,y:in std_logic;
	o:out std_logic);
end nand_g;

architecture nand_dtf of nand_g is
begin
	o<=x nand y;
end nand_dtf;


--D Latch
library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
   port(e,d:in std_logic;
	dq,dq_bar:out std_logic);
end d_latch;

architecture dlatch_str of d_latch is
	signal not_d,not_clk,s,r : std_logic :='0';

	component nand_g 
	   port(x,y:in std_logic;
		o:out std_logic);
	end component;

begin
	not_d<=not d;

	nand1:nand_g port map(d,e,s);
	nand2:nand_g port map(not_d,e,r);
	nand3:nand_g port map(s,dq_bar,dq);
	nand4:nand_g port map(r,dq,dq_bar);
	
end dlatch_str;


--D Flip-Flop
library ieee;
use ieee.std_logic_1164.all;

entity dff_s is
   port(clk,d:in std_logic;
	q,qbar:out std_logic);
end dff_s;

architecture str of dff_s is
	signal master_q,not_clk,extra: std_logic :='0';
	
	component d_latch
	   port(e,d:in std_logic;
		dq,dq_bar:out std_logic);
	end component;

begin
	not_clk<=not clk;
	
	masterd:d_latch port map(not_clk,d,master_q,extra);
	slaved:d_latch port map(clk,master_q,q,qbar);
end str;