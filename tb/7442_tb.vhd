library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb7442 is
end tb7442;

architecture sim of tb7442 is

    signal s_ia, s_ib, s_ic, s_id: std_logic := '0';
    signal s_oy: std_logic_vector(9 downto 0);

begin
    uut: entity work.ttl7442(decoder_4x10)
    port map (
        ia => s_ia, ib => s_ib, ic => s_ic, id => s_id,
        oy => s_oy
    );

    process
        variable count_vec : unsigned(3 downto 0); -- 4 bits (0 a 15)
    begin
        for i in 0 to 9 loop -- casos validos
            count_vec := to_unsigned(i, 4);
            s_id <= count_vec(3);
            s_ic <= count_vec(2);
            s_ib <= count_vec(1);
            s_ia <= count_vec(0);
            wait for 20 ns;
        end loop;

        for i in 10 to 15 loop -- casos invalidos
            count_vec := to_unsigned(i, 4);
            s_id <= count_vec(3);
            s_ic <= count_vec(2);
            s_ib <= count_vec(1);
            s_ia <= count_vec(0);
            wait for 20 ns;
        end loop;
        wait;
    end process;
end sim;