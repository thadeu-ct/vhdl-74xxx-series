library ieee;
use ieee.std_logic_1164.all;

entity ttl7427 is
    port (
        -- 1o nor 3 input
        i1a, i1b, i1c: in std_logic;
        o1y: out std_logic;
        -- 2o nor 3 input
        i2a, i2b, i2c: in std_logic;
        o2y: out std_logic;
        -- 3o nor 3 input
        i3a, i3b, i3c: in std_logic;
        o3y: out std_logic
    );
end ttl7427;

architecture tri_3in_nor of ttl7427 is
begin
    o1y <= not(i1a or i1b or i1c);
    o2y <= not(i2a or i2b or i2c);
    o3y <= not(i3a or i3b or i3c);
end tri_3in_nor;