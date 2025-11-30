library ieee;
use ieee.std_logic_1164.all;

entity ttl7486 is
    port (
        -- 1o xor 2 input
        ia1, ib1: in std_logic;
        oy1: out std_logic;
        -- 2o xor 2 input
        ia2, ib2: in std_logic;
        oy2: out std_logic;
        -- 3o xor 2 input
        ia3, ib3: in std_logic;
        oy3: out std_logic;
        -- 4o xor 2 input
        ia4, ib4: in std_logic;
        oy4: out std_logic
    );
end ttl7486;

architecture quad_2in_xor of ttl7486 is
begin
    oy1 <= ia1 xor ib1;
    oy2 <= ia2 xor ib2;
    oy3 <= ia3 xor ib3;
    oy4 <= ia4 xor ib4;
end quad_2in_xor;