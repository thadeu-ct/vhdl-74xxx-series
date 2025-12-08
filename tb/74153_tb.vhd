library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb74153 is
end tb74153;

architecture sim of tb74153 is

    -- Sinais MUX 1
    signal s_i1c0, s_i1c1, s_i1c2, s_i1c3 : std_logic;
    signal s_istrobe1, s_oy1 : std_logic;

    -- Sinais MUX 2
    signal s_i2c0, s_i2c1, s_i2c2, s_i2c3 : std_logic;
    signal s_istrobe2, s_oy2 : std_logic;

    -- Controle Comum
    signal s_ia, s_ib : std_logic;

begin
    uut: entity work.ttl74153(dual_mux_4x1)
    port map (
        i1c0 => s_i1c0, i1c1 => s_i1c1, i1c2 => s_i1c2, i1c3 => s_i1c3, -- mux 1 entradas
        istrobe1 => s_istrobe1, oy1 => s_oy1,                           -- mux 1 enable
        i2c0 => s_i2c0, i2c1 => s_i2c1, i2c2 => s_i2c2, i2c3 => s_i2c3, -- mux 2 entradas
        istrobe2 => s_istrobe2, oy2 => s_oy2,                           -- mux 2 enable
        ia => s_ia, ib => s_ib                                          -- saidas mux 1 e 2
    );

    process
        variable i : integer;
        variable count_vec : unsigned(1 downto 0);
    begin
        s_istrobe1 <= '1'; s_istrobe2 <= '1';
        s_i1c0 <= '1'; s_i1c1 <= '1'; s_i1c2 <= '1'; s_i1c3 <= '1';
        s_i2c0 <= '1'; s_i2c1 <= '1'; s_i2c2 <= '1'; s_i2c3 <= '1';
        s_ia <= '0'; s_ib <= '0';
        wait for 20 ns;

        s_istrobe1 <= '0'; s_istrobe2 <= '0';
        s_i1c0 <= '0'; s_i1c1 <= '1'; s_i1c2 <= '0'; s_i1c3 <= '1';
        s_i2c0 <= '0'; s_i2c1 <= '0'; s_i2c2 <= '1'; s_i2c3 <= '1';

        for i in 0 to 3 loop
            count_vec := to_unsigned(i, 2);
            s_ib <= count_vec(1);
            s_ia <= count_vec(0);
            wait for 20 ns;
        end loop;

        s_i1c0 <= '1'; s_i1c1 <= '0'; s_i1c2 <= '1'; s_i1c3 <= '0';
        s_i2c0 <= '1'; s_i2c1 <= '1'; s_i2c2 <= '0'; s_i2c3 <= '0';
        for i in 0 to 3 loop
            count_vec := to_unsigned(i, 2);
            s_ib <= count_vec(1);
            s_ia <= count_vec(0);
            wait for 20 ns;
        end loop;
        wait;
    end process;
end sim;