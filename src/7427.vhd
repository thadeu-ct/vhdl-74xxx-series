library ieee;
use ieee.std_logic_1164.all;

entity ttl7427 is
    port (
        -- 1o nor 3 input
        i01, i02, i13: in std_logic;
        o12: out std_logic;
        -- 2o nor 3 input
        i03, i04, i05: in std_logic;
        o06: out std_logic;
        -- 3o nor 3 input
        i09, i10, i11: in std_logic;
        o08: out std_logic
    );
end ttl7427;

architecture tri_3in_nor of ttl7427 is
begin
    o12 <= not(i01 or i02 or i13);
    o06 <= not(i03 or i04 or i05);
    o08 <= not(i09 or i10 or i11);
end tri_3in_nor;