library ieee;
use ieee.std_logic_1164.all;

entity tb74283 is
end tb74283;

architecture sim of tb74283 is

    signal s_ia1, s_ia2, s_ia3, s_ia4: std_logic := '0';  -- entrada A
    signal s_ib1, s_ib2, s_ib3, s_ib4: std_logic := '0';  -- entrada B
    signal s_ic0: std_logic := '0';                       -- carry in
    signal s_osum1, s_osum2, s_osum3, s_osum4: std_logic; -- saida soma
    signal s_oc4: std_logic;                              -- carry out

begin
    uut: entity work.ttl74283(somador_4bits)
    port map (
        ia1 => s_ia1, ia2 => s_ia2, ia3 => s_ia3, ia4 => s_ia4,
        ib1 => s_ib1, ib2 => s_ib2, ib3 => s_ib3, ib4 => s_ib4,
        ic0 => s_ic0,
        osum1 => s_osum1, osum2 => s_osum2, osum3 => s_osum3, osum4 => s_osum4,
        oc4 => s_oc4
    );

    process
    begin
        -- Caso 1: 0 + 0 + 0(Cin) = 0
        s_ic0 <= '0';
        s_ia4 <= '0'; s_ia3 <= '0'; s_ia2 <= '0'; s_ia1 <= '0'; -- 0
        s_ib4 <= '0'; s_ib3 <= '0'; s_ib2 <= '0'; s_ib1 <= '0'; -- 0
        wait for 20 ns;

        -- Caso 2: 5 + 3 = 8 (0101 + 0011 = 1000)
        s_ia4 <= '0'; s_ia3 <= '1'; s_ia2 <= '0'; s_ia1 <= '1'; -- 5
        s_ib4 <= '0'; s_ib3 <= '0'; s_ib2 <= '1'; s_ib1 <= '1'; -- 3
        wait for 20 ns;

        -- Caso 3: 10 + 10 = 20 (1010 + 1010 = 10100) -> Soma 4, Carry 1
        s_ia4 <= '1'; s_ia3 <= '0'; s_ia2 <= '1'; s_ia1 <= '0'; -- 10
        s_ib4 <= '1'; s_ib3 <= '0'; s_ib2 <= '1'; s_ib1 <= '0'; -- 10
        wait for 20 ns;

        -- Caso 4: Teste de Carry In
        -- 1 + 1 + 1(Cin) = 3 (0001 + 0001 + 1 = 0011)
        s_ic0 <= '1';
        s_ia4 <= '0'; s_ia3 <= '0'; s_ia2 <= '0'; s_ia1 <= '1'; -- 1
        s_ib4 <= '0'; s_ib3 <= '0'; s_ib2 <= '0'; s_ib1 <= '1'; -- 1
        wait for 20 ns;

        -- Caso 5: Soma Máxima (15 + 15 + 1 = 31 -> 11111) -> Soma 15, Carry 1
        s_ia4 <= '1'; s_ia3 <= '1'; s_ia2 <= '1'; s_ia1 <= '1'; -- 15
        s_ib4 <= '1'; s_ib3 <= '1'; s_ib2 <= '1'; s_ib1 <= '1'; -- 15
        wait for 20 ns;
        wait;
    end process;
end sim;