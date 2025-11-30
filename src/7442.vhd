library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ttl7442 is
    port (
        ia, ib, ic, id: in std_logic;        -- controle
        oy : out std_logic_vector (9 downto 0) -- saida
    );
end ttl7442;

architecture decoder_4x10 of ttl7442 is

    signal control: std_logic_vector(3 downto 0);
    signal index: integer range 0 to 15;
    
begin
    control <= id & ic & ib & ia;
    index <= to_integer(unsigned(control));

    process(index)
    begin
        oy <= (others => '1');

        if index < 10 then
            oy(index) <= '0';
        end if;
    end process;
end decoder_4x10;