library ieee;
use ieee.std_logic_1164.all;

entity ttl7402 is
    port (
        -- 1o nor 2 input
        i02, i03: in std_logic;
        o01: out std_logic;
        -- 2o nor 2 input
        i05, i06: in std_logic;
        o04: out std_logic;
        -- 3o nor 2 input
        i08, i09: in std_logic;
        o10: out std_logic;
        -- 4o nor 2 input
        i11, i12: in std_logic;
        o13: out std_logic
    );
end ttl7402;

architecture quad_2in_nor of ttl7402 is
begin
    o01 <= not(i02 or i03);
    o04 <= not(i05 or i06);
    o10 <= not(i08 or i09);
    o13 <= not(i11 or i12);
end quad_2in_nor;