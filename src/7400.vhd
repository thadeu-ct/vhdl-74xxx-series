library ieee;
use ieee.std_logic_1164.all;

entity ttl7400 is
    port (
        -- 1o nand 2 input
        i1a, i1b: in std_logic;
        o1y: out std_logic;
        -- 2o nand 2 input
        i2a, i2b: in std_logic;
        o2y: out std_logic;
        -- 3o nand 2 input
        i3a, i3b: in std_logic;
        o3y: out std_logic;
        -- 4o nand 2 input
        i4a, i4b: in std_logic;
        o4y: out std_logic;
    );
end ttl7400;

architecture quad_2in_nand of ttl7400 is
begin
    o1y <= not(i1a and i1b);
    o2y <= not(i2a and i2b);
    o3y <= not(i3a and i3b);
    o4y <= not(i4a and i4b);
end quad_2in_nand;
