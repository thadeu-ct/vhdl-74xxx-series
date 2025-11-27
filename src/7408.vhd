library ieee;
use ieee.std_logic_1164.all;

entity ttl7408 is
    port (
        -- 1o and 2 input
        i1a, i1b: in std_logic;
        o1y: out std_logic;
        -- 2o and 2 input
        i2a, i2b: in std_logic;
        o2y: out std_logic;
        -- 3o and 2 input
        i3a, i3b: in std_logic;
        o3y: out std_logic;
        -- 4o and 2 input
        i4a, i4b: in std_logic;
        o4y: out std_logic
    );
end ttl7408;

architecture quad_2in_and of ttl7408 is
begin
    o1y <= i1a and i1b;
    o2y <= i2a and i2b;
    o3y <= i3a and i3b;
    o4y <= i4a and i4b;
end quad_2in_and;
