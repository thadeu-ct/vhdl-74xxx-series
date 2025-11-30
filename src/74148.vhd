library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ttl74148 is
    port (
        ien : in std_logic;
        i0, i1, i2, i3, i4, i5, i6, i7: in std_logic;
        oa0, oa1, oa2: out std_logic;
        ogs, oen: out std_logic
    );
end ttl74148;

architecture enconder_priority_8x3 of ttl74148 is

    signal code: std_logic_vector(7 downto 0);
    signal num_code: integer range 0 to 255;
    signal decode: std_logic_vector(2 downto 0);

begin
    code <= i7 & i6 & i5 & i4 & i3 & i2 & i1 & i0;
    num_code <= to_integer(unsigned(code));
    
    process(ien, num_code)
    begin
        decode <= "111";
        ogs <= '1'; 
        oen <= '1';
        
        if ien = '0' then
            if num_code = 255 then
                oen <= '0';
            else
                ogs <= '0';
                
                if num_code < 128 then
                    decode <= "000"; -- 0
                elsif num_code < 192 then
                    decode <= "001"; -- 1
                elsif num_code < 224 then
                    decode <= "010"; -- 2
                elsif num_code < 240 then
                    decode <= "011"; -- 3
                elsif num_code < 248 then
                    decode <= "100"; -- 4
                elsif num_code < 252 then
                    decode <= "101"; -- 5
                elsif num_code < 254 then
                    decode <= "110"; -- 6
                end if;
            end if;
        end if;
    end process;

    oa0 <= decode(0);
    oa1 <= decode(1);
    oa2 <= decode(2);
end enconder_priority_8x3;