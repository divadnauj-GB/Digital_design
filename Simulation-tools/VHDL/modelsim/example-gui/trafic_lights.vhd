--- header 




library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity trafic_lights is
port(
    sa1 :in std_logic;
    sa2 :in std_logic;
    sb1 :in std_logic;
    sb2 :in std_logic;
    r   :out std_logic;
    o   :out std_logic;
    g   :out std_logic
);
end entity trafic_lights;


architecture rtl of trafic_lights is
-- declarative part
signal s_b2 : std_logic;

begin

    s_b2 <= sb2;
    r <= (sa1 and sa2) or sb1;
    o <= sb1 or sa1;
    g <= s_b2 xor sa1;
    

end architecture;