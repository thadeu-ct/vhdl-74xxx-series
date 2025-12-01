library ieee;
use ieee.std_logic_1164.all;

entity tb7402 is   -- entidade vazia
end tb7402;

architecture sim of tb7402 is

    signal s_i02, s_i03, s_o01 : std_logic; -- nor 1
    signal s_i05, s_i06, s_o04 : std_logic; -- nor 2
    signal s_i08, s_i09, s_o10 : std_logic; -- nor 3
    signal s_i11, s_i12, s_o13 : std_logic; -- nor 4

begin
    uut: entity work.ttl7402
    port map (
        i02 => s_i02, i03 => s_i03, o01 => s_o01,
        i05 => s_i05, i06 => s_i06, o04 => s_o04,
        i08 => s_i08, i09 => s_i09, o10 => s_o10,
        i11 => s_i11, i12 => s_i12, o13 => s_o13
    );

    process
    begin
        s_i02 <= '0'; s_i03 <= '0'; -- caso 00 = saida 1
        s_i05 <= '0'; s_i06 <= '1'; -- caso 01 = saida 0
        s_i08 <= '1'; s_i09 <= '0'; -- caso 10 = saida 0
        s_i11 <= '1'; s_i12 <= '1'; -- caso 11 = saida 0
        wait for 100 ns;

        s_i02 <= '0'; s_i03 <= '1'; -- caso 01 = saida 0
        s_i05 <= '1'; s_i06 <= '0'; -- caso 10 = saida 0
        s_i08 <= '1'; s_i09 <= '1'; -- caso 11 = saida 0
        s_i11 <= '0'; s_i12 <= '0'; -- caso 00 = saida 1
        wait for 100 ns;

        s_i02 <= '1'; s_i03 <= '0'; -- caso 10 = saida 0
        s_i05 <= '1'; s_i06 <= '1'; -- caso 11 = saida 0
        s_i08 <= '0'; s_i09 <= '0'; -- caso 00 = saida 1
        s_i11 <= '0'; s_i12 <= '1'; -- caso 01 = saida 0
        wait for 100 ns;

        s_i02 <= '1'; s_i03 <= '1'; -- caso 11 = saida 0
        s_i05 <= '0'; s_i06 <= '0'; -- caso 00 = saida 1
        s_i08 <= '0'; s_i09 <= '1'; -- caso 01 = saida 0
        s_i11 <= '1'; s_i12 <= '0'; -- caso 10 = saida 0
        wait for 100 ns;
        wait;
    end process;
end sim;