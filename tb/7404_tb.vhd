library ieee;
use ieee.std_logic_1164.all;

entity tb7404 is   -- entidade vazia
end tb7404;

architecture sim of tb7404 is

    signal s_i1a, s_o1y : std_logic; -- not 1
    signal s_i2a, s_o2y : std_logic; -- not 2
    signal s_i3a, s_o3y : std_logic; -- not 3
    signal s_i4a, s_o4y : std_logic; -- not 4
    signal s_i5a, s_o5y : std_logic; -- not 5
    signal s_i6a, s_o6y : std_logic; -- not 6

begin
    uut: entity work.ttl7404(hex_invert)
    port map (
        i1a => s_i1a, o1y => s_o1y,
        i2a => s_i2a, o2y => s_o2y,
        i3a => s_i3a, o3y => s_o3y,
        i4a => s_i4a, o4y => s_o4y,
        i5a => s_i5a, o5y => s_o5y,
        i6a => s_i6a, o6y => s_o6y
    );

    process
    begin 
        -- cenario 0 para 1
        s_i1a <= '0';
        s_i2a <= '0';
        s_i3a <= '0';
        s_i4a <= '0';
        s_i5a <= '0';
        s_i6a <= '0';
        wait for 100 ns;
        -- cenario 1 para 0
        s_i1a <= '1';
        s_i2a <= '1';
        s_i3a <= '1';
        s_i4a <= '1';
        s_i5a <= '1';
        s_i6a <= '1';
        wait for 100 ns;
        -- cenario misto
        s_i1a <= '0';
        s_i2a <= '1';
        s_i3a <= '1';
        s_i4a <= '0';
        s_i5a <= '1';
        s_i6a <= '0';
        wait for 100 ns;
        wait;
    end process;
end sim;
