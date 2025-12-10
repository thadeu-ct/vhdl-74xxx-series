library ieee;
use ieee.std_logic_1164.all;

entity tb7420 is   -- entidade vazia
end tb7420;

architecture sim of tb7420 is

    signal s_i1a, s_i1b, s_i1c, s_i1d, s_o1y: std_logic; -- nand 4 inputs 1
    signal s_i2a, s_i2b, s_i2c, s_i2d, s_o2y: std_logic; -- nand 4 inputs 2

begin
    uut: entity work.ttl7420(dual_4in_nand)
    port map (
        i1a => s_i1a, i1b => s_i1b, i1c => s_i1c, i1d => s_i1d, o1y => s_o1y,
        i2a => s_i2a, i2b => s_i2b, i2c => s_i2c, i2d => s_i2d, o2y => s_o2y
    );

    process
    begin
        s_i1a <= '0'; s_i1b <= '0'; s_i1c <= '0'; s_i1d <= '0'; -- caso 0000 = saida 1
        s_i2a <= '1'; s_i2b <= '1'; s_i2c <= '1'; s_i2d <= '1'; -- caso 1111 = saida 0
        wait for 100 ns;

        s_i1a <= '1'; s_i1b <= '1'; s_i1c <= '1'; s_i1d <= '1'; -- caso 1111 = saida 0
        s_i2a <= '0'; s_i2b <= '1'; s_i2c <= '1'; s_i2d <= '1'; -- caso 0111 = saida 1
        wait for 100 ns;

        s_i1a <= '1'; s_i1b <= '0'; s_i1c <= '1'; s_i1d <= '1'; -- caso 1011 = saida 1
        s_i2a <= '1'; s_i2b <= '0'; s_i2c <= '1'; s_i2d <= '0'; -- caso 1010 = saida 1
        wait for 100 ns;

        s_i1a <= '1'; s_i1b <= '1'; s_i1c <= '1'; s_i1d <= '0'; -- caso 1110 = saida 1
        s_i2a <= '0'; s_i2b <= '0'; s_i2c <= '0'; s_i2d <= '0'; -- caso 0000 = saida 1
        wait for 100 ns;
        wait;
    end process;
end sim;