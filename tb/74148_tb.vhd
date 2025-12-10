library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb74148 is
end tb74148;

architecture sim of tb74148 is

    signal s_nien: std_logic := '1';                                         -- enable
    signal s_i0, s_i1, s_i2, s_i3, s_i4, s_i5, s_i6, s_i7: std_logic := '1'; -- entrada
    signal s_oa0, s_oa1, s_oa2: std_logic;                                   -- saida
    signal s_oen: std_logic;                                                 -- enable prox.
    signal s_ogs: std_logic;                                                 -- verificador
    signal v_in: std_logic_vector(7 downto 0) := "11111111";                 -- vetor inputs

begin
    s_i7 <= v_in(7); s_i6 <= v_in(6); s_i5 <= v_in(5); s_i4 <= v_in(4);
    s_i3 <= v_in(3); s_i2 <= v_in(2); s_i1 <= v_in(1); s_i0 <= v_in(0);

    uut: entity work.ttl74148(enconder_priority_8x3)
    port map (
        nien => s_nien,
        i0 => s_i0, i1 => s_i1, i2 => s_i2, i3 => s_i3,
        i4 => s_i4, i5 => s_i5, i6 => s_i6, i7 => s_i7,
        oa0 => s_oa0, oa1 => s_oa1, oa2 => s_oa2,
        ogs => s_ogs, oen => s_oen
    );

    process
    begin
        -- Testes de enable
        s_nien <= '1';
        v_in <= "00000000"; 
        wait for 20 ns;

        -- Teste de invalidez de entrada
        s_nien <= '0';
        v_in <= "11111111";
        wait for 20 ns; 

        -- Teste de priority de entrada
        for i in 7 downto 0 loop
            v_in <= (others => '1');
            v_in(i) <= '0'; 
            wait for 20 ns;
        end loop;
        
        -- Teste extra de 2 entradas 0
        v_in <= "01111110";
        wait for 20 ns;
        wait;
    end process;
end sim;