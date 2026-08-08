module trafic_lights(sa1, sa2, sb1, sb2,r,o,g);
input sa1;
input sa2;
input sb1;
input sb2;
output r;
output o;
output g;


assign r = (sa1 & sa2) | sb1;
assign o = sb1 | sa1;


endmodule