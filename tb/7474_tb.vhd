library ieee;
use ieee.std_logic_1164.all;

entity tb7474 is
end tb7474;

architecture sim of tb7474 is

    signal s_i1d, s_i1clk: std_logic;
    signal s_ni1pre, s_ni1clr: std_logic;
    signal s_o1q, s_o2q: std_logic := '0';
    signal s_i2d, s_i2clk: std_logic;
    signal s_ni2pre, s_ni2clr: std_logic;
    signal s_no1q, s_no2q: std_logic := '1';

begin
    uut: entity work.ttl7474(dual_ff_d_sr_nsinc)
    port map (
        i1d => s_i1d, i1clk => s_i1clk, 
        ni1pre => s_ni1pre, ni1clr => s_ni1clr,
        o1q => s_o1q, no1q => s_no1q,
        i2d => s_i2d, i2clk => s_i2clk, 
        ni2pre => s_ni2pre, ni2clr => s_ni2clr,
        o2q => s_o2q, no2q => s_no2q
    );

    process
    begin
        -- Teste iniciando o flip flop
        s_ni1pre <= '1'; s_ni1clr <= '1'; s_i1clk <= '0'; s_i1d <= '0';
        s_ni2pre <= '1'; s_ni2clr <= '1'; s_i2clk <= '0'; s_i2d <= '0';
        wait for 20 ns;

        -- Teste caso absurdo
        s_ni1pre <= '0'; s_ni2pre <= '0';
        s_ni1clr <= '0'; s_ni2clr <= '0';
        wait for 20 ns;
        
        -- Teste set / reset
        s_ni1pre <= '0'; s_ni2pre <= '1';
        s_ni1clr <= '1'; s_ni2clr <= '0';
        wait for 20 ns;

        -- Teste reset / set
        s_ni1pre <= '1'; s_ni2pre <= '0';
        s_ni1clr <= '0'; s_ni2clr <= '1';
        wait for 20 ns;

        -- Teste D para a saida
        s_ni1pre <= '1'; s_ni2pre <= '1';
        s_ni1clr <= '1'; s_ni2clr <= '1';
        s_i1d <= '0';
        wait for 10 ns; 
        s_i1clk <= '1';
        wait for 10 ns;
        s_i1clk <= '0';
        wait for 20 ns;
        s_i1d <= '1';
        wait for 10 ns;
        s_i1clk <= '1';
        wait for 10 ns;
        s_i1clk <= '0';
        wait for 20 ns;
        wait;
    end process;
end sim;