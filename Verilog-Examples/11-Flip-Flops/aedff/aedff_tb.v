`timescale 1ns/1ps
`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end


module aedff_tb();

reg clk, rst_n, din, en;
wire Q,Qn;

always begin
    clk = 1'b0;
    #10;
    clk = 1'b1;
    #10;
end


aedff DUT(
    .clk(clk),
    .rst_n(rst_n),
    .D(din),
    .en(en),
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
    en = 0;
    #25;
    rst_n = 1;
    for (i=0;i<100;i=i+1) begin
        @(posedge clk);
        din = i[2];
        en = i[3];
    end
    #1;
    `assert(Q,din);
    $display("All verification tests passed!");
    $finish;
end

endmodule