library ieee;
use ieee.std_logic_1164.all;

entity ttl7474 is
    port (                                         -- flip flop 1
        i1d, i1clk, ni1pre, ni1clr: in std_logic;  -- entrada 1
        o1q, no1q: out std_logic;                  -- saida 1
                                                   -- flip flop 2
        i2d, i2clk, ni2pre, ni2clr: in std_logic;  -- entrada 22
        o2q, no2q: out std_logic                   -- saida 2
    );
end ttl7474;

architecture dual_ff_d_sr_nsinc of ttl7474 is
begin
    process(i1clk, ni1pre, ni1clr)
    begin
        if (ni1pre = '0' and ni1clr = '0') then
            o1q <= '1';
            no1q <= '1';
        elsif (ni1pre = '0') then
            o1q <= '1';
            no1q <= '0';
        elsif (ni1clr = '0') then
            o1q <= '0';
            no1q <= '1';
        elsif rising_edge(i1clk) then
            o1q <= i1d;
            no1q <= not (i1d);
        end if; 
    end process;
    process(i2clk, ni2pre, ni2clr)
    begin
        if (ni2pre = '0' and ni2clr = '0') then
            o2q <= '1';
            no2q <= '1';
        elsif (ni2pre = '0') then
            o2q <= '1';
            no2q <= '0';
        elsif (ni2clr = '0') then
            o2q <= '0';
            no2q <= '1';
        elsif rising_edge(i2clk) then
            o2q <= i2d;
            no2q <= not (i2d);
        end if; 
    end process;
end dual_ff_d_sr_nsinc;