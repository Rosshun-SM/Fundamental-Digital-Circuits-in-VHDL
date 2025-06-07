library ieee;
use ieee.std_logic_1164.all;

entity traffic_fsm is
    port(clk, reset, TA, TB : in std_logic;
         LA, LB : out std_logic_vector(1 downto 0));
end traffic_fsm;

architecture behavior of traffic_fsm is
    type state_type is (S0, S1, S2, S3);
    signal current_state, next_state : state_type;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= S0;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    process(current_state, TA, TB)
    begin
        case current_state is
            when S0 =>
                if TA = '0' then next_state <= S1; else next_state <= S0; end if;
            when S1 => next_state <= S2;
            when S2 =>
                if TB = '0' then next_state <= S3; else next_state <= S2; end if;
            when S3 => next_state <= S0;
        end case;
    end process;

    process(current_state)
    begin
        case current_state is
            when S0 => LA <= "10"; LB <= "00"; -- Green A, Red B
            when S1 => LA <= "01"; LB <= "00"; -- Yellow A, Red B
            when S2 => LA <= "00"; LB <= "10"; -- Red A, Green B
            when S3 => LA <= "00"; LB <= "01"; -- Red A, Yellow B
        end case;
    end process;
end behavior;