library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ttl74151 is
    port (
        id0, id1, id2, id3, id4, id5, id6, id7: in std_logic; -- entradas
        ia, ib, ic: in std_logic;                             -- controle
        istrobe: in std_logic;                                -- enable
        oy, ow: out std_logic                                   -- saida
    );
end ttl74151;

architecture mux_8x1 of ttl74151 is
    signal entrada: std_logic_vector(7 downto 0);
    signal controle: std_logic_vector(2 downto 0);
    signal saida: std_logic;
begin
    entrada <= id7 & id6 & id5 & id4 & id3 & id2 & id1 & id0;
    controle <= ic & ib & ia;
    process(istrobe, entrada, controle)
    begin
        if(istrobe = '0') then
            saida <= entrada(to_integer(unsigned(controle)));
        else
            saida <= '0';
        end if;
    end process;
    oy <= saida;
    ow <= not(saida);
end mux_8x1;