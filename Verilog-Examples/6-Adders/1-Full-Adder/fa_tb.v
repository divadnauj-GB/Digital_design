`timescale 1ns/1ps
`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end


module fa_tb();


reg A,B,Cin;
wire S, Cout;

fa DUT(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
);



initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end

integer i,j;
initial begin

    for(i=0;i<8;i=i+1) begin
        A = i[2];
        B = i[1];
        Cin = i[0];
        #10;
    end

    $display("All verification tests passed!");
    $finish;
end

endmodule