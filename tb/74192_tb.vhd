library ieee;
use ieee.std_logic_1164.all;

entity tb74192 is
end tb74192;

architecture sim of tb74192 is

    signal s_iup, s_idown: std_logic := '1';         -- clock/seletor
    signal s_ia, s_ib, s_ic, s_id: std_logic := '0'; -- entrada
    signal s_iclr: std_logic := '0';                 -- reset
    signal s_niload: std_logic := '1';               -- load
    signal s_oqa, s_oqb, s_oqc, s_oqd: std_logic;    -- saida
    signal s_noco, s_nobo: std_logic;                -- carry out

begin
    uut: entity work.ttl74192(cont_bin_4bits_up_down_sr_nsinc)
    port map (
        iup => s_iup, idown => s_idown,
        ia => s_ia, ib => s_ib, ic => s_ic, id => s_id,
        iclr => s_iclr, niload => s_niload,
        oqa => s_oqa, oqb => s_oqb, oqc => s_oqc, oqd => s_oqd,
        noco => s_noco, nobo => s_nobo
    );

    process
    begin
        -- Inicialização
        s_iclr <= '1';
        s_niload <= '1';
        s_iup <= '1'; s_idown <= '1';
        wait for 20 ns;
        s_iclr <= '0';
        wait for 20 ns;

        -- Load Assíncrono
        s_niload <= '0';
        s_id <= '0'; s_ic <= '1'; s_ib <= '1'; s_ia <= '0';
        wait for 20 ns;
        s_niload <= '1';
        
        -- Contar UP
        -- Pulso 1 saida = 7
        s_iup <= '0'; wait for 10 ns; s_iup <= '1'; wait for 10 ns;
        -- Pulso 2 saida = 8
        s_iup <= '0'; wait for 10 ns; s_iup <= '1'; wait for 10 ns;
        -- Pulso 3 saida = 9
        s_iup <= '0'; wait for 10 ns; s_iup <= '1'; wait for 10 ns;
        -- Pulso 4 saida = 0
        s_iup <= '0'; wait for 10 ns; -- CO ativa
        s_iup <= '1'; wait for 10 ns;

        -- Contar DOWN
        -- Pulso 1 saida = 9
        s_idown <= '0'; wait for 10 ns; -- BO ativa
        s_idown <= '1'; wait for 10 ns;
        -- Pulso 2 saida = 8
        s_idown <= '0'; wait for 10 ns; s_idown <= '1'; wait for 10 ns;

        -- Clear Assíncrono
        s_iclr <= '1';
        wait for 20 ns;
        wait;
    end process;
end sim;