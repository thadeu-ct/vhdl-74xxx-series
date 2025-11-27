library ieee;
use ieee.std_logic_1164.all;

entity ttl7420 is
    port (
        -- 1o nand 4 input
        ia1, ib1, ic1, id1: in std_logic;
        ov1: out std_logic;
        -- 2o nand 4 input
        ia2, ib2, ic2, id2: in std_logic;
        ov2: out std_logic
    );
end ttl7420;

architecture duo_4in_nand of ttl7420 is
begin
    ov1 <= not(ia1 and ib1 and ic1 and id1);
    ov2 <= not(ia2 and ib2 and ic2 and id2);
end duo_4in_nand;
