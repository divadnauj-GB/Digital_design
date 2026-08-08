`timescale 1ns/1ps
module sillyfunction_tb2();
  reg  a, b, c;
  wire y;
  sillyfunction dut(a, b, c, y);  // instantiate dut
    // dump the waveforms into a VCD file
 initial begin
    $dumpfile("sillyfunction_tb2.vcd"); 
    $dumpvars;
 end
  initial begin           // apply inputs, check results one at a time
    a = 0; b = 0; c = 0; #10;
    if (y !== 1) $display("000 failed.");
    c = 1; #10;
    if (y !== 0) $display("001 failed.");
    b = 1; c = 0; #10;
    if (y !== 0) $display("010 failed.");
    c = 1; #10;
    if (y !== 0) $display("011 failed.");
    a = 1; b = 0; c = 0; #10;
    if (y !== 1) $display("100 failed.");
    c = 1; #10;
    if (y !== 1) $display("101 failed.");
    b = 1; c = 0; #10;
    if (y !== 0) $display("110 failed.");
    c = 1; #10;
    if (y !== 0) $display("111 failed.");
  end
endmodule  
