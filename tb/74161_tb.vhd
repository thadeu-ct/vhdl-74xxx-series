library ieee;
use ieee.std_logic_1164.all;

entity tb74161 is
end tb74161;

architecture sim of tb74161 is

    signal s_iclk: std_logic := '0';
    signal s_ienp, s_ient: std_logic := '0';         -- enable
    signal s_ia, s_ib, s_ic, s_id: std_logic := '0'; -- entrada
    signal s_niclr, s_niload: std_logic := '0';      -- controle
    signal s_oqa, s_oqb, s_oqc, s_oqd: std_logic;    -- saida
    signal s_orco: std_logic;                        -- carry out

begin
    uut: entity work.ttl74161(cont_bin_4bits_s_sinc_r_nsinc)
    port map (
        iclk => s_iclk, 
        ienp => s_ienp, ient => s_ient,
        ia => s_ia, ib => s_ib, ic => s_ic, id => s_id,
        niclr => s_niclr, niload => s_niload,
        oqa => s_oqa, oqb => s_oqb, oqc => s_oqc, oqd => s_oqd,
        orco => s_orco
    );

    process
    begin
        -- Inicialização
        s_niclr <= '0';
        s_niload <= '1';
        s_ienp <= '1'; s_ient <= '1';
        s_iclk <= '0';
        wait for 20 ns;

        -- Solta o Reset
        s_niclr <= '1';
        wait for 20 ns;

        -- Teste LOAD Síncrono
        s_niload <= '0';
        s_id <= '1'; s_ic <= '1'; s_ib <= '0'; s_ia <= '0';
        wait for 10 ns;
        
        -- Pulso de Clock
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;
        
        s_niload <= '1';
        
        -- Pulso 1 saida = 13
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;
        
        -- Pulso 2 saida = 14
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;
        
        -- Pulso 3 saida = 15 -> RCO vira 1
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;
        
        -- Pulso 4 (Overflow para 0)
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;

        -- 4. Teste CLEAR Assíncrono
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;
        
        -- Agora ativa o Clear SEM clock
        s_niclr <= '0';
        wait for 20 ns;
        s_niclr <= '1';
        wait;
    end process;
end sim;