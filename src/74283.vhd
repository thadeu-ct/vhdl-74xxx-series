library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ttl74283 is
    port (
        ia1, ia2, ia3, ia4, ib1, ib2, ib3, ib4: in std_logic;   -- 8 bits a somar (4x2)
        ic0: in std_logic;                                      -- Cin
        osum1, osum2, osum3, osum4: out std_logic;              -- 4 bits somados
        oc4: out std_logic                                      -- Cout
    );
end ttl74283;

architecture somador_4bits of ttl74283 is

    signal entrada1: std_logic_vector(4 downto 0);
    signal entrada2: std_logic_vector(4 downto 0);
    signal carryout: std_logic_vector(4 downto 0);
    signal soma: unsigned(4 downto 0);
    signal saida: std_logic_vector(4 downto 0);

begin
    entrada1 <= ('0' & ia4 & ia3 & ia2 & ia1);
    entrada2 <= ('0' & ib4 & ib3 & ib2 & ib1);
    carryout <= ("0000" & ic0);

    soma <= unsigned(carryout) + unsigned(entrada1) + unsigned(entrada2);
    saida <= std_logic_vector(soma);

    oc4 <= saida(4);
    osum4 <= saida(3);
    osum3 <= saida(2);
    osum2 <= saida(1);
    osum1 <= saida(0);
end somador_4bits;