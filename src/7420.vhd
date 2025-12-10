library ieee;
use ieee.std_logic_1164.all;

entity ttl7420 is
    port (
        -- 1o nand 4 input
        i1a, i1b, i1c, i1d: in std_logic;
        o1y: out std_logic;
        -- 2o nand 4 input
        i2a, i2b, i2c, i2d: in std_logic;
        o2y: out std_logic
    );
end ttl7420;

architecture dual_4in_nand of ttl7420 is
begin
    o1y <= not(i1a and i1b and i1c and i1d);
    o2y <= not(i2a and i2b and i2c and i2d);
end dual_4in_nand;