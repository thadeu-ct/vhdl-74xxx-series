library ieee;
use ieee.std_logic_1164.all;

entity tb74163 is
end tb74163;

architecture sim of tb74163 is

    signal s_iclk: std_logic := '0';
    signal s_ienp, s_ient: std_logic := '0'; 
    signal s_ia, s_ib, s_ic, s_id: std_logic := '0';
    signal s_niclr, s_niload: std_logic := '0'; 
    
    signal s_oqa, s_oqb, s_oqc, s_oqd: std_logic;
    signal s_orco: std_logic;

begin
    uut: entity work.ttl74163(cont_bin_4bits_sr_sinc)
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

        -- Clock -> Reset
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;

        -- Reset off
        s_niclr <= '1';
        wait for 20 ns;

        -- Load Sincrono
        s_niload <= '0';
        s_id <= '1'; s_ic <= '1'; s_ib <= '0'; s_ia <= '0';
        wait for 10 ns;
        
        -- Clock -> load
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;
        
        -- Load off
        s_niload <= '1';
        
        -- Contagem
        -- Pulso 1 saida = 13
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;
        
        -- Pulso 2 saida = 14
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;
        
        -- Pulso 3 saida = 15
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;
        
        -- Teste clear sincrono
        s_niclr <= '0';
        wait for 20 ns; -- não deveria limpar
        
        -- Clock -> reset
        s_iclk <= '1'; wait for 10 ns;
        s_iclk <= '0'; wait for 10 ns;
        
        s_niclr <= '1';
        wait;
    end process;
end sim;