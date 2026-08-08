
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity trafic_lights_tb is
end entity trafic_lights_tb;


architecture testbench of trafic_lights_tb is

    signal s_a1 : std_logic := '0';
    signal s_b1 : std_logic := '0';
    signal s_a2 : std_logic := '0';
    signal s_b2 : std_logic := '0';
    signal s_r : std_logic := '0';
    signal s_o : std_logic := '0';
    signal s_g : std_logic := '0';

    type data is array(0 to 16) of std_logic_vector(3 downto 0);
    signal test_data: data := ("0000",
                               "0001",
                               "0010",
                               "0011",
                               "0100",
                               "0101",
                               "0110",
                               "0111",
                               "1000",
                               "1001",
                               "1010",
                               "1011",
                               "1100",
                               "1101",                               
                               "1110",
                               "1111",
                               "0000");

begin

    dut: entity work.trafic_lights port map (
        sa1 => s_a1,
        sa2 => s_b1,
        sb1 => s_a2,
        sb2 => s_b2,
        r   => s_r ,
        o   => s_o ,
        g   => s_g);

    
    process
    begin
        for i in 0 to 16 loop
            s_a1 <= test_data(i)(0);
            s_b1 <= test_data(i)(1);
            s_a2 <= test_data(i)(2);
            s_b1 <= test_data(i)(3);
            wait for 10 ns;
        end loop; -- 
            report("Simulation_finished!");
        wait;
    end process;

end architecture;