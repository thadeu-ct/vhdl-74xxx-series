library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ttl74163 is
    port (
        iclk, ienp, ient: in std_logic;     -- clock, enable 
        ia, ib, ic, id: in std_logic;       -- entrada inicial
        niclr, niload: in std_logic;        -- clear e load barrados
        oqa, oqb, oqc, oqd: out std_logic;  -- saída contador
        orco: out std_logic                 -- ripple carry out
    );
end ttl74163;

architecture cont_bin_4bits_sr_sinc of ttl74163 is

    signal dados_entrada: unsigned(3 downto 0);
    signal contador: unsigned(3 downto 0) := "0000";

begin
    dados_entrada <= unsigned(std_logic_vector'(id & ic & ib & ia));

    process(iclk)
    begin
        if rising_edge(iclk) then
            if niclr = '0' then
                contador <= "0000";
            elsif niload = '0' then
                contador <= dados_entrada;
            elsif (ienp = '1' and ient = '1') then
                contador <= contador + 1;
            end if;
        end if;
    end process;
    
    oqa <= std_logic(contador(0));
    oqb <= std_logic(contador(1));
    oqc <= std_logic(contador(2));
    oqd <= std_logic(contador(3));
    orco <= '1' when (contador = "1111" and ient = '1') else '0';
end cont_bin_4bits_sr_sinc;