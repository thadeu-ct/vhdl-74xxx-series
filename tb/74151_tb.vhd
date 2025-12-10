library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb74151 is
end tb74151;

architecture sim of tb74151 is

    signal s_id0, s_id1, s_id2, s_id3: std_logic; -- dados 4 menores bits
    signal s_id4, s_id5, s_id6, s_id7: std_logic; -- dados 4 maiores bits
    signal s_ia, s_ib, s_ic: std_logic;           -- controle saida
    signal s_nistrobe: std_logic;                 -- enable
    signal s_oy, s_ow: std_logic;                 -- saida/saida barrada

begin
    uut: entity work.ttl74151(mux_8x1)
    port map (
        id0 => s_id0, id1 => s_id1, id2 => s_id2, id3 => s_id3,
        id4 => s_id4, id5 => s_id5, id6 => s_id6, id7 => s_id7,
        ia => s_ia, ib => s_ib, ic => s_ic,
        nistrobe => s_nistrobe,
        oy => s_oy, ow => s_ow
    );

    process
        variable count_vec : unsigned(2 downto 0);
    begin
        s_nistrobe <= '1';
        s_id0 <= '1'; s_id1 <= '1'; s_id2 <= '1'; s_id3 <= '1';
        s_id4 <= '1'; s_id5 <= '1'; s_id6 <= '1'; s_id7 <= '1';
        s_ia <= '0'; s_ib <= '0'; s_ic <= '0';
        wait for 20 ns; -- oy = 0 (bloqueado)

        s_nistrobe <= '0';
        s_id0 <= '0'; s_id1 <= '1'; s_id2 <= '0'; s_id3 <= '1';
        s_id4 <= '0'; s_id5 <= '1'; s_id6 <= '0'; s_id7 <= '1';
        for i in 0 to 7 loop
            count_vec := to_unsigned(i, 3);
            s_ic <= count_vec(2);
            s_ib <= count_vec(1);
            s_ia <= count_vec(0);
            wait for 20 ns; -- oy = alternado entre 0 e 1
        end loop;

        s_id0 <= '1'; s_id1 <= '0'; s_id2 <= '1'; s_id3 <= '0';
        s_id4 <= '1'; s_id5 <= '0'; s_id6 <= '1'; s_id7 <= '0';
        for i in 0 to 7 loop
            count_vec := to_unsigned(i, 3);
            s_ic <= count_vec(2);
            s_ib <= count_vec(1);
            s_ia <= count_vec(0);
            wait for 20 ns; -- oy = alternado entre 1 e 0
        end loop;

        s_id0 <= '1'; s_id1 <= '1'; s_id2 <= '0'; s_id3 <= '0';
        s_id4 <= '1'; s_id5 <= '0'; s_id6 <= '0'; s_id7 <= '1';
        for i in 0 to 7 loop
            count_vec := to_unsigned(i, 3);
            s_ic <= count_vec(2);
            s_ib <= count_vec(1);
            s_ia <= count_vec(0);
            wait for 20 ns; -- oy = saida mista
        end loop;
        wait;
    end process;
end sim;