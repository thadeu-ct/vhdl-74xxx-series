library ieee;
use ieee.std_logic_1164.all;

entity ttl7404 is
    port (
        -- 1o inverter
        i1a: in std_logic;
        o1y: out std_logic;
        -- 2o inverter
        i2a: in std_logic;
        o2y: out std_logic;
        -- 3o inverter
        i3a: in std_logic;
        o3y: out std_logic;
        -- 4o inverter
        i4a: in std_logic;
        o4y: out std_logic;
        -- 5o inverter
        i5a: in std_logic;
        o5y: out std_logic;
        -- 6o inverter
        i6a: in std_logic;
        o6y: out std_logic
    );
end ttl7404;

architecture hex_invert of ttl7404 is
begin
    o1y <= not(i1a);
    o2y <= not(i2a);
    o3y <= not(i3a);
    o4y <= not(i4a);
    o5y <= not(i5a);
    o6y <= not(i6a);
end hex_invert;
