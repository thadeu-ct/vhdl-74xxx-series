library ieee;
use ieee.std_logic_1164.all;

entity tb7427 is  -- entidade vazia
end tb7427;

architecture sim of tb7427 is

    signal s_i1a, s_i1b, s_i1c, s_o1y: std_logic; -- nor 3 inputs 1
    signal s_i2a, s_i2b, s_i2c, s_o2y: std_logic; -- nor 3 inputs 2
    signal s_i3a, s_i3b, s_i3c, s_o3y: std_logic; -- nor 3 inputs 3

begin
    uut: entity work.ttl7427(tri_3in_nor)
    port map (
        i1a => s_i1a, i1b => s_i1b, i1c => s_i1c, o1y => s_o1y,
        i2a => s_i2a, i2b => s_i2b, i2c => s_i2c, o2y => s_o2y,
        i3a => s_i3a, i3b => s_i3b, i3c => s_i3c, o3y => s_o3y
    );

    process
    begin
        s_i1a <= '0'; s_i1b <= '0'; s_i1c <= '0'; -- caso 000 = saida 1
        s_i2a <= '0'; s_i2b <= '0'; s_i2c <= '1'; -- caso 001 = saida 0
        s_i3a <= '0'; s_i3b <= '1'; s_i3c <= '0'; -- caso 010 = saida 0
        wait for 100 ns;

        s_i1a <= '0'; s_i1b <= '1'; s_i1c <= '1'; -- caso 011 = saida 0
        s_i2a <= '0'; s_i2b <= '0'; s_i2c <= '0'; -- caso 000 = saida 1
        s_i3a <= '1'; s_i3b <= '0'; s_i3c <= '0'; -- caso 100 = saida 0
        wait for 100 ns;

        s_i1a <= '1'; s_i1b <= '0'; s_i1c <= '1'; -- caso 101 = saida 0
        s_i2a <= '1'; s_i2b <= '1'; s_i2c <= '0'; -- caso 110 = saida 0
        s_i3a <= '0'; s_i3b <= '0'; s_i3c <= '0'; -- caso 000 = saida 1
        wait for 100 ns;

        s_i1a <= '0'; s_i1b <= '0'; s_i1c <= '0'; -- caso 000 = saida 1
        s_i2a <= '1'; s_i2b <= '1'; s_i2c <= '1'; -- caso 111 = saida 0
        s_i3a <= '0'; s_i3b <= '1'; s_i3c <= '0'; -- caso 000 = saida 1
        wait for 100 ns;
        wait;
    end process;
end sim;