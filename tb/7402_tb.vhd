library ieee;
use ieee.std_logic_1164.all;

entity tb7402 is   -- entidade vazia
end tb7402;

architecture sim of tb7402 is

    signal s_i1a, s_i1b, s_o1y: std_logic; -- nor 1
    signal s_i2a, s_i2b, s_o2y: std_logic; -- nor 2
    signal s_i3a, s_i3b, s_o3y: std_logic; -- nor 3
    signal s_i4a, s_i4b, s_o4y: std_logic; -- nor 4

begin
    uut: entity work.ttl7402(quad_2in_nor)
    port map (
        i1a => s_i1a, i1b => s_i1b, o1y => s_o1y,
        i2a => s_i2a, i2b => s_i2b, o2y => s_o2y,
        i3a => s_i3a, i3b => s_i3b, o3y => s_o3y,
        i4a => s_i4a, i4b => s_i4b, o4y => s_o4y
    );

    process
    begin
        s_i1a <= '0'; s_i1b <= '0'; -- caso 00 = saida 1
        s_i2a <= '0'; s_i2b <= '1'; -- caso 01 = saida 0
        s_i3a <= '1'; s_i3b <= '0'; -- caso 10 = saida 0
        s_i4a <= '1'; s_i4b <= '1'; -- caso 11 = saida 0
        wait for 100 ns;

        s_i1a <= '0'; s_i1b <= '1'; -- caso 01 = saida 0
        s_i2a <= '1'; s_i2b <= '0'; -- caso 10 = saida 0
        s_i3a <= '1'; s_i3b <= '1'; -- caso 11 = saida 0
        s_i4a <= '0'; s_i4b <= '0'; -- caso 00 = saida 1
        wait for 100 ns;

        s_i1a <= '1'; s_i1b <= '0'; -- caso 10 = saida 0
        s_i2a <= '1'; s_i2b <= '1'; -- caso 11 = saida 0
        s_i3a <= '0'; s_i3b <= '0'; -- caso 00 = saida 1
        s_i4a <= '0'; s_i4b <= '1'; -- caso 01 = saida 0
        wait for 100 ns;

        s_i1a <= '1'; s_i1b <= '1'; -- caso 11 = saida 0
        s_i2a <= '0'; s_i2b <= '0'; -- caso 00 = saida 1
        s_i3a <= '0'; s_i3b <= '1'; -- caso 01 = saida 0
        s_i4a <= '1'; s_i4b <= '0'; -- caso 10 = saida 0
        wait for 100 ns;
        wait;
    end process;
end sim;