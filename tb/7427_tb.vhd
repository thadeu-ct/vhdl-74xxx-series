library ieee;
use ieee.std_logic_1164.all;

entity tb7427 is  -- entidade vazia
end tb7427;

architecture sim of tb7427 is

    signal s_i01, s_i02, s_i13, s_o12 : std_logic; -- nor 3 inputs 1
    signal s_i03, s_i04, s_i05, s_o06 : std_logic; -- nor 3 inputs 2
    signal s_i09, s_i10, s_i11, s_o08 : std_logic; -- nor 3 inputs 3

begin
    uut: entity work.ttl7427(tri_3in_nor)
    port map (
        i01 => s_i01, i02 => s_i02, i13 => s_i13, o12 => s_o12,
        i03 => s_i03, i04 => s_i04, i05 => s_i05, o06 => s_o06,
        i09 => s_i09, i10 => s_i10, i11 => s_i11, o08 => s_o08
    );

    process
    begin
        s_i01 <= '0'; s_i02 <= '0'; s_i13 <= '0'; -- caso 000 = saida 1
        s_i03 <= '0'; s_i04 <= '0'; s_i05 <= '1'; -- caso 001 = saida 0
        s_i09 <= '0'; s_i10 <= '1'; s_i11 <= '0'; -- caso 010 = saida 0
        wait for 100 ns;

        s_i01 <= '0'; s_i02 <= '1'; s_i13 <= '1'; -- caso 011 = saida 0
        s_i03 <= '0'; s_i04 <= '0'; s_i05 <= '0'; -- caso 000 = saida 1
        s_i09 <= '1'; s_i10 <= '0'; s_i11 <= '0'; -- caso 100 = saida 0
        wait for 100 ns;

        s_i01 <= '1'; s_i02 <= '0'; s_i13 <= '1'; -- caso 101 = saida 0
        s_i03 <= '1'; s_i04 <= '1'; s_i05 <= '0'; -- caso 110 = saida 0
        s_i09 <= '0'; s_i10 <= '0'; s_i11 <= '0'; -- caso 000 = saida 1
        wait for 100 ns;

        s_i01 <= '0'; s_i02 <= '0'; s_i13 <= '0'; -- caso 000 = saida 1
        s_i03 <= '1'; s_i04 <= '1'; s_i05 <= '1'; -- caso 111 = saida 0
        s_i09 <= '0'; s_i10 <= '1'; s_i11 <= '0'; -- caso 000 = saida 1
        wait for 100 ns;
        wait;
    end process;
end sim;