library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ttl74192 is
    port (
        iup, idown: in std_logic;           -- clock, para up count e down count 
        ia, ib, ic, id: in std_logic;       -- entrada inicial
        iclr, niload: in std_logic;         -- clear e load barrados
        oqa, oqb, oqc, oqd: out std_logic;  -- saída contador
        noco, nobo: out std_logic           -- ripple carry out
    );
end ttl74192;

architecture cont_bin_4bits_up_down_sr_nsinc of ttl74192 is

    signal dados_entrada: unsigned(3 downto 0);
    signal contador: unsigned(3 downto 0);

begin
    dados_entrada <= unsigned(id & ic & ib & ia);

    process(iclr, niload, iup, idown)
    begin
        if iclr = '1' then
            contador <= "0000";
        elsif niload = '0' then
            contador <= dados_entrada;
        elsif rising_edge(iup) and idown = '1' then
            if contador = "1001" then
                contador <= "0000";
            else
                contador <= contador + 1;
            end if;
        elsif rising_edge(idown) and iup = '1' then
            if contador = "0000" then
                contador <= "1001";
            else
                contador <= contador - 1;
            end if;
        end if;
    end process;

    oqa <= std_logic(contador(0));
    oqb <= std_logic(contador(1));
    oqc <= std_logic(contador(2));
    oqd <= std_logic(contador(3));
    noco <= '0' when (contador = "1001" and iup = '0') else '1';
    nobo <= '0' when (contador = "0000" and idown = '0') else '1';
end cont_bin_4bits_up_down_sr_nsinc;