library ieee;
use ieee.std_logic_1164.all;

entity tb7420 is   -- entidade vazia
end tb7420;

architecture sim of tb7420 is

    signal s_ia1, s_ib1, s_ic1, s_id1, s_ov1 : std_logic; -- nand 4 inputs 1
    signal s_ia2, s_ib2, s_ic2, s_id2, s_ov2 : std_logic; -- nand 4 inputs 2

begin
    uut: entity work.ttl7420(dual_4in_nand)
    port map (
        ia1 => s_ia1, ib1 => s_ib1, ic1 => s_ic1, id1 => s_id1, ov1 => s_ov1,
        ia2 => s_ia2, ib2 => s_ib2, ic2 => s_ic2, id2 => s_id2, ov2 => s_ov2
    );

    process
    begin
        s_ia1 <= '0'; s_ib1 <= '0'; s_ic1 <= '0'; s_id1 <= '0'; -- caso 0000 = saida 1
        s_ia2 <= '1'; s_ib2 <= '1'; s_ic2 <= '1'; s_id2 <= '1'; -- caso 1111 = saida 0
        wait for 100 ns;

        s_ia1 <= '1'; s_ib1 <= '1'; s_ic1 <= '1'; s_id1 <= '1'; -- caso 1111 = saida 0
        s_ia2 <= '0'; s_ib2 <= '1'; s_ic2 <= '1'; s_id2 <= '1'; -- caso 0111 = saida 1
        wait for 100 ns;

        s_ia1 <= '1'; s_ib1 <= '0'; s_ic1 <= '1'; s_id1 <= '1'; -- caso 1011 = saida 1
        s_ia2 <= '1'; s_ib2 <= '0'; s_ic2 <= '1'; s_id2 <= '0'; -- caso 1010 = saida 1
        wait for 100 ns;

        s_ia1 <= '1'; s_ib1 <= '1'; s_ic1 <= '1'; s_id1 <= '0'; -- caso 1110 = saida 1
        s_ia2 <= '0'; s_ib2 <= '0'; s_ic2 <= '0'; s_id2 <= '0'; -- caso 0000 = saida 1
        wait for 100 ns;
        wait;
    end process;
end sim;