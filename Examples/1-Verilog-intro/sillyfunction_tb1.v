`timescale 1ns/1ps
module sillyfunction_tb1();
  reg a, b, c;
  wire y;

  // instantiate device under test
  sillyfunction dut(a, b, c, y);

  // dump the waveforms into a VCD file
 initial begin
    $dumpfile("sillyfunction_tb1.vcd"); 
    $dumpvars;
 end
  // apply inputs one at a time
  initial begin
    a = 0; b = 0; c = 0; #10;
    c = 1; #10;
    b = 1; c = 0; #10;
    c = 1; #10;
    a = 1; b = 0; c = 0; #10;
    c = 1; #10;
    b = 1; c = 0; #10;
    c = 1; #10;
  end
endmodule 
