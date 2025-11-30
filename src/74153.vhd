library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ttl74153 is
    port (
        i1c0, i1c1, i1c2, i1c3, i2c0, i2c1, i2c2, i2c3: in std_logic; -- entradas
        ia, ib: in std_logic;                                         -- controle
        istrobe1, istrobe2: in std_logic;                             -- enable
        oy1, oy2: out std_logic                                       -- saida
    );
end ttl74153;

architecture dual_mux_4x1 of ttl74153 is

    signal entrada1: std_logic_vector(3 downto 0);
    signal entrada2: std_logic_vector(3 downto 0);
    signal controle: std_logic_vector(1 downto 0);

begin
    entrada1 <= i1c3 & i1c2 & i1c1 & i1c0;
    entrada2 <= i2c3 & i2c2 & i2c1 & i2c0;
    controle <= ib & ia;

    process(istrobe1, controle)
    begin
        if(istrobe1 = '0') then
            oy1 <= entrada1(to_integer(unsigned(controle)));
        else
            oy1 <= '0';
        end if;
    end process;

    process(istrobe2, controle)
    begin
        if(istrobe2 = '0') then
            oy2 <= entrada2(to_integer(unsigned(controle)));
        else
            oy2 <= '0';
        end if;
    end process;
end dual_mux_4x1;