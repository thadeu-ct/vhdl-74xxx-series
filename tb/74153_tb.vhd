library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb74153 is
end tb74153;

architecture sim of tb74153 is

    signal s_i1c0, s_i1c1, s_i1c2, s_i1c3: std_logic; -- mux 1 entrada
    signal s_nistrobe1, s_oy1: std_logic;             -- mux 1 enable
    signal s_i2c0, s_i2c1, s_i2c2, s_i2c3: std_logic; -- mux 2 entrada
    signal s_nistrobe2, s_oy2: std_logic;             -- mux 2 enable
    signal s_ia, s_ib: std_logic;                     -- saida mux 1 e 2

begin
    uut: entity work.ttl74153(dual_mux_4x1)
    port map (
        i1c0 => s_i1c0, i1c1 => s_i1c1, i1c2 => s_i1c2, i1c3 => s_i1c3,
        nistrobe1 => s_nistrobe1, oy1 => s_oy1,                           
        i2c0 => s_i2c0, i2c1 => s_i2c1, i2c2 => s_i2c2, i2c3 => s_i2c3,
        nistrobe2 => s_nistrobe2, oy2 => s_oy2,                           
        ia => s_ia, ib => s_ib                                          
    );

    process
        variable count_vec : unsigned(1 downto 0);
    begin
        s_nistrobe1 <= '1'; s_nistrobe2 <= '1';
        s_i1c0 <= '1'; s_i1c1 <= '1'; s_i1c2 <= '1'; s_i1c3 <= '1';
        s_i2c0 <= '1'; s_i2c1 <= '1'; s_i2c2 <= '1'; s_i2c3 <= '1';
        s_ia <= '0'; s_ib <= '0';
        wait for 20 ns;

        s_nistrobe1 <= '0'; s_nistrobe2 <= '0';
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

        s_i1c0 <= '1'; s_i1c1 <= '1'; s_i1c2 <= '0'; s_i1c3 <= '0';
        s_i2c0 <= '1'; s_i2c1 <= '0'; s_i2c2 <= '0'; s_i2c3 <= '1';
        for i in 0 to 3 loop
            count_vec := to_unsigned(i, 2);
            s_ib <= count_vec(1);
            s_ia <= count_vec(0);
            wait for 20 ns;
        end loop;
        wait;
    end process;
end sim;