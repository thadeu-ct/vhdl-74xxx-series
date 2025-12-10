library ieee;
use ieee.std_logic_1164.all;

entity ttl74112 is
    port (                                              -- flip flop 1
        i1j, i1k, ni1clk, ni1pre, ni1clr: in std_logic; -- entrada 1
        o1q, no1q: out std_logic;                       -- saida 1
                                                        -- flip flop 2
        i2j, i2k, ni2clk, ni2pre, ni2clr: in std_logic; -- entrada 2
        o2q, no2q: out std_logic                        -- saida 2
    );
end ttl74112;

architecture dual_ff_jk_sr_nsinc of ttl74112 is

    signal q1_status: std_logic;
    signal q2_status: std_logic;

begin
    process(ni1clk, ni1pre, ni1clr)
    begin
        if (ni1pre = '0') then
            q1_status <= '1';
        elsif (ni1clr = '0') then
            q1_status <= '0';
        elsif (falling_edge(ni1clk)) then
            if (i1j = '0' and i1k = '0') then
                q1_status <= q1_status;
            elsif (i1j = '1' and i1k = '0') then
                q1_status <= '1';
            elsif (i1j = '0' and i1k = '1') then
                q1_status <= '0';
            elsif (i1j = '1' and i1k = '1') then
                q1_status <= not (q1_status);
            end if;
        end if;
    end process;

    process(ni2clk, ni2pre, ni2clr)
    begin
        if (ni2pre = '0') then
            q2_status <= '1';
        elsif (ni2clr = '0') then
            q2_status <= '0';
        elsif (falling_edge(ni2clk)) then
            if (i2j = '0' and i2k = '0') then
                q2_status <= q2_status;
            elsif (i2j = '1' and i2k = '0') then
                q2_status <= '1';
            elsif (i2j = '0' and i2k = '1') then
                q2_status <= '0';
            elsif (i2j = '1' and i2k = '1') then
                q2_status <= not (q2_status);
            end if;
        end if;
    end process;

    o1q <= '1' when (ni1pre = '0' and ni1clr = '0') else q1_status;
    no1q <= '1' when (ni1pre = '0' and ni1clr = '0') else not(q1_status);
    
    o2q <= '1' when (ni2pre = '0' and ni2clr = '0') else q2_status;
    no2q <= '1' when (ni2pre = '0' and ni2clr = '0') else not(q2_status);  
end dual_ff_jk_sr_nsinc;