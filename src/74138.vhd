library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ttl74138 is
    port (
        ia, ib, ic: in std_logic;             -- select
        ig1, ig2a, ig2b: in std_logic;        -- enable
        oy: out std_logic_vector(7 downto 0)  -- output
    );
end ttl74138;

architecture decoder_3x8 of ttl74138 is
    signal enable: std_logic;
    signal control: std_logic_vector(2 downto 0);
begin
    enable <= (not(ig2a) and not(ig2b)) and ig1;
    control <= ic & ib & ia;
    process(enable, control)
    begin
        oy <= others('1');
        if enable = '1' then
            oy(to_integer(unsigned(control))) <= '0';
        end if;
    end process;
end decoder_3x8;


-- architecture decoder_3x8 of ttl74138 is
--     signal g2: std_logic;
--     signal enable: std_logic;
--     signal c: std_logic_vector(2 downto 0);
-- begin
--     oy <= others('1');
--     g2 <= not(ig2a) and not(ig2b);
--     if g2 then
--         enable <= g2 and ig1;
--         process(enable, ia, ib, ic)
--         begin
--             if enable then
--                 c <= ic & ib & ia;
--                 y(to_integer(unsigned(c))) <= '0';
--             end if;
--         end process;
--     end if;
-- end decoder_3x8;