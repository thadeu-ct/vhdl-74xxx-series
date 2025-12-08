library ieee;
use ieee.std_logic_1164.all;

entity tb7476 is
end tb7476;

architecture sim of tb7476 is

    signal s_i1j, s_i1k, s_i1clk : std_logic := '0';
    signal s_ni1pre, s_ni1clr : std_logic;
    signal s_o1q, s_no1q : std_logic;
    signal s_i2j, s_i2k, s_i2clk : std_logic := '0';
    signal s_ni2pre, s_ni2clr : std_logic;
    signal s_o2q, s_no2q : std_logic;
    constant CLK_PERIOD : time := 20 ns;

begin
    uut: entity work.ttl7476(dual_ff_jk_sr_nsinc)
    port map (
        i1j => s_i1j, i1k => s_i1k, i1clk => s_i1clk,
        ni1pre => s_ni1pre, ni1clr => s_ni1clr,
        o1q => s_o1q, no1q => s_no1q,
        i2j => s_i2j, i2k => s_i2k, i2clk => s_i2clk,
        ni2pre => s_ni2pre, ni2clr => s_ni2clr,
        o2q => s_o2q, no2q => s_no2q
    );

    clk_process: process
    begin
        s_i1clk <= '0';
        s_i2clk <= '0';
        wait for CLK_PERIOD / 2; -- 10 ns
        
        s_i1clk <= '1';
        s_i2clk <= '1';
        wait for CLK_PERIOD / 2; -- 10 ns
    end process;

    process
    begin
        s_ni1pre <= '1'; s_ni1clr <= '1';
        s_ni2pre <= '1'; s_ni2clr <= '1';
        s_i1j <= '0'; s_i1k <= '0';
        wait for 20 ns;

        s_ni1pre <= '0';
        wait for 10 ns;
        s_ni1pre <= '1';

        s_ni1clr <= '0';
        wait for 10 ns;
        s_ni1clr <= '1';

        s_i1j <= '1'; s_i1k <= '0';
        wait for CLK_PERIOD;

        s_i1j <= '0'; s_i1k <= '1';
        wait for CLK_PERIOD;

        s_i1j <= '1'; s_i1k <= '1';
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;

        s_i1j <= '0'; s_i1k <= '0';
        wait for CLK_PERIOD;

        s_ni1pre <= '0'; s_ni1clr <= '0';
        wait for 20 ns;
        s_ni1pre <= '1'; s_ni1clr <= '1';
        wait;
    end process;
end sim;