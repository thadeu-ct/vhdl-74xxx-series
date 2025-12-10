library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb74138 is
end tb74138;

architecture sim of tb74138 is

    signal s_ia, s_ib, s_ic: std_logic;        -- select
    signal s_ig1, s_nig2a, s_nig2b: std_logic; -- enable
    signal s_oy: std_logic_vector(7 downto 0); -- output

begin
    uut: entity work.ttl74138(decoder_3x8)
    port map (
        ia => s_ia, 
        ib => s_ib, 
        ic => s_ic,
        ig1  => s_ig1, 
        nig2a => s_nig2a, 
        nig2b => s_nig2b,
        oy => s_oy
    );

    process
        variable count_vec : unsigned(2 downto 0);
    begin
        -- Testes de enables        
        -- Caso A: G1 em 0 (Desabilitado)
        s_ig1 <= '0'; s_nig2a <= '0'; s_nig2b <= '0';
        s_ic <= '0'; s_ib <= '0'; s_ia <= '0'; -- Selecionando 0
        wait for 20 ns; -- saida esperada = 11111111

        -- Caso B: G2A em 1 (Desabilitado)
        s_ig1 <= '1'; s_nig2a <= '1'; s_nig2b <= '0';
        wait for 20 ns; -- saida esperada = 11111111

        -- Caso C: G2B em 1 (Desabilitado)
        s_ig1 <= '1'; s_nig2a <= '0'; s_nig2b <= '1';
        wait for 20 ns; -- saida esperada = 11111111


        -- Teste de Funcionamento (g1 = 1 | ng2a = 0 | ng2b = 0)
        s_ig1 <= '1'; s_nig2a <= '0'; s_nig2b <= '0';
        for i in 0 to 7 loop
            count_vec := to_unsigned(i, 3);
            s_ic <= count_vec(2);
            s_ib <= count_vec(1);
            s_ia <= count_vec(0);
            wait for 20 ns;
        end loop;
        wait;
    end process;
end sim;