library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb74138 is
end tb74138;

architecture sim of tb74138 is

    signal s_ia, s_ib, s_ic : std_logic;
    signal s_ig1, s_ig2a, s_ig2b : std_logic;
    signal s_oy : std_logic_vector(7 downto 0);

begin
    uut: entity work.ttl74138(decoder_3x8)
    port map (
        ia => s_ia, 
        ib => s_ib, 
        ic => s_ic,
        ig1  => s_ig1, 
        ig2a => s_ig2a, 
        ig2b => s_ig2b,
        oy => s_oy
    );

    process
        -- Variável auxiliar para o loop
        variable i : integer; 
        variable count_vec : unsigned(2 downto 0);
    begin
        -- 1. Teste de Desabilitação (Enables inválidos)
        -- Todas as saídas devem ficar em '1' (High)
        
        -- Caso A: G1 em 0 (Desabilitado)
        s_ig1 <= '0'; s_ig2a <= '0'; s_ig2b <= '0';
        s_ic <= '0'; s_ib <= '0'; s_ia <= '0'; -- Selecionando 0
        wait for 20 ns;

        -- Caso B: G2A em 1 (Desabilitado)
        s_ig1 <= '1'; s_ig2a <= '1'; s_ig2b <= '0';
        wait for 20 ns;

        -- Caso C: G2B em 1 (Desabilitado)
        s_ig1 <= '1'; s_ig2a <= '0'; s_ig2b <= '1';
        wait for 20 ns;


        -- 2. Teste de Funcionamento Normal (Habilitado)
        -- G1=1, G2A=0, G2B=0
        s_ig1 <= '1'; s_ig2a <= '0'; s_ig2b <= '0';

        -- Loop de 0 a 7 para testar todas as saídas
        for i in 0 to 7 loop
            -- Converte o número 'i' para binário de 3 bits
            count_vec := to_unsigned(i, 3);
            
            -- Atribui aos sinais de seleção (C é o mais significativo)
            s_ic <= count_vec(2);
            s_ib <= count_vec(1);
            s_ia <= count_vec(0);
            
            wait for 20 ns;
            -- Aqui, no GTKWave, você deve ver o bit 'i' de 'oy' indo para 0
        end loop;

        wait; -- Para a simulação
    end process;

end sim;
