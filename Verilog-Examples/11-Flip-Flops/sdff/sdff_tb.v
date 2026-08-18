`timescale 1ns/1ps
`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end


module sdff_tb();

reg clk, rst_n, din;
wire Q,Qn;

always begin
    clk = 1'b0;
    #10;
    clk = 1'b1;
    #10;
end


sdff DUT(
    .clk(clk),
    .rst_n(rst_n),
    .D(din),
    .Q(Q),
    .Qn(Qn)
);



initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end

integer i,j;
initial begin
    clk=0;
    din = 0;
    rst_n = 0;
    #25;
    rst_n = 1;
    for (i=0;i<100;i=i+1) begin
        @(posedge clk);
        din = i[2];
    end
    #1;
    `assert(Q,din);
    $display("All verification tests passed!");
    $finish;
end

endmodule