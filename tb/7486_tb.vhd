library ieee;
use ieee.std_logic_1164.all;

entity tb7486 is   -- entidade vazia
end tb7486;

architecture sim of tb7486 is

    signal s_ia1, s_ib1, s_oy1 : std_logic; -- xor 1
    signal s_ia2, s_ib2, s_oy2 : std_logic; -- xor 2
    signal s_ia3, s_ib3, s_oy3 : std_logic; -- xor 3
    signal s_ia4, s_ib4, s_oy4 : std_logic; -- xor 4

begin
    uut: entity work.ttl7486(quad_2in_xor)
    port map (
        ia1 => s_ia1, ib1 => s_ib1, oy1 => s_oy1,
        ia2 => s_ia2, ib2 => s_ib2, oy2 => s_oy2,
        ia3 => s_ia3, ib3 => s_ib3, oy3 => s_oy3,
        ia4 => s_ia4, ib4 => s_ib4, oy4 => s_oy4
    );

    process
    begin
        s_ia1 <= '0'; s_ib1 <= '0'; -- caso 00 = saida 0
        s_ia2 <= '0'; s_ib2 <= '1'; -- caso 01 = saida 1
        s_ia3 <= '1'; s_ib3 <= '0'; -- caso 10 = saida 1
        s_ia4 <= '1'; s_ib4 <= '1'; -- caso 11 = saida 0
        wait for 100 ns;

        s_ia1 <= '0'; s_ib1 <= '1'; -- caso 01 = saida 1
        s_ia2 <= '1'; s_ib2 <= '0'; -- caso 10 = saida 1
        s_ia3 <= '1'; s_ib3 <= '1'; -- caso 11 = saida 0
        s_ia4 <= '0'; s_ib4 <= '0'; -- caso 00 = saida 0
        wait for 100 ns;

        s_ia1 <= '1'; s_ib1 <= '0'; -- caso 10 = saida 1
        s_ia2 <= '1'; s_ib2 <= '1'; -- caso 11 = saida 0
        s_ia3 <= '0'; s_ib3 <= '0'; -- caso 00 = saida 0
        s_ia4 <= '0'; s_ib4 <= '1'; -- caso 01 = saida 1
        wait for 100 ns;

        s_ia1 <= '1'; s_ib1 <= '1'; -- caso 11 = saida 0
        s_ia2 <= '0'; s_ib2 <= '0'; -- caso 00 = saida 0
        s_ia3 <= '0'; s_ib3 <= '1'; -- caso 01 = saida 1
        s_ia4 <= '1'; s_ib4 <= '0'; -- caso 10 = saida 1
        wait for 100 ns;
        wait;
    end process;
end sim;