library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb74148 is
end tb74148;

architecture sim of tb74148 is

    signal s_ien : std_logic;
    signal s_i0, s_i1, s_i2, s_i3, s_i4, s_i5, s_i6, s_i7 : std_logic;
    signal s_oa0, s_oa1, s_oa2 : std_logic;
    signal s_ogs, s_oen : std_logic;
    signal v_inputs : std_logic_vector(7 downto 0);

begin

    s_i7 <= v_inputs(7); s_i6 <= v_inputs(6); s_i5 <= v_inputs(5); s_i4 <= v_inputs(4);
    s_i3 <= v_inputs(3); s_i2 <= v_inputs(2); s_i1 <= v_inputs(1); s_i0 <= v_inputs(0);

    uut: entity work.ttl74148(enconder_priority_8x3)
    port map (
        ien => s_ien,
        i0 => s_i0, i1 => s_i1, i2 => s_i2, i3 => s_i3,
        i4 => s_i4, i5 => s_i5, i6 => s_i6, i7 => s_i7,
        oa0 => s_oa0, oa1 => s_oa1, oa2 => s_oa2,
        ogs => s_ogs, oen => s_oen
    );

    process
        variable i : integer;
    begin
        s_ien <= '1';
        v_inputs <= "00000000"; 
        wait for 20 ns;

        s_ien <= '0';
        v_inputs <= "11111111";
        wait for 20 ns; 

        for i in 7 downto 0 loop
            v_inputs <= (others => '1');
            v_inputs(i) <= '0'; 
            wait for 20 ns;
        end loop;
        
        v_inputs <= "01111110";
        wait for 20 ns;
        wait;
    end process;
end sim;