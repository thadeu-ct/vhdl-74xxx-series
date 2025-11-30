library ieee;
use ieee.std_logic_1164.all;

entity ttl7432 is
    port (
        -- 1o or 2 input
        i1a, i1b: in std_logic;
        o1y: out std_logic;
        -- 2o or 2 input
        i2a, i2b: in std_logic;
        o2y: out std_logic;
        -- 3o or 2 input
        i3a, i3b: in std_logic;
        o3y: out std_logic;
        -- 4o or 2 input
        i4a, i4b: in std_logic;
        o4y: out std_logic
    );
end ttl7432;

architecture quad_2in_or of ttl7432 is
begin
    o1y <= i1a or i1b;
    o2y <= i2a or i2b;
    o3y <= i3a or i3b;
    o4y <= i4a or i4b;
end quad_2in_or;