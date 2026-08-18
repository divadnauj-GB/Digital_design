`timescale 1ns/1ps
`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end


module rca_tb();
localparam Nbit=32;

reg [Nbit-1:0] A,B;
reg Cin;
wire [Nbit-1:0] S;
wire Cout;

rca #(.Nbit(Nbit)) DUT(
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
    Cin = 0;
    for (i=0;i<2Nbit;i=i+1) begin
        for (j=0; j<2Nbit;j=j+1) begin
            A = i;
            B = j;
            #10;
            `assert(S,A+B+Cin);
        end
    end
    Cin = 1;
    for (i=0;i<Nbit;i=i+1) begin
        for (j=0; j<Nbit;j=j+1) begin
            A = i;
            B = j;
            #10;
            `assert(S,A+B+Cin);
        end
    end
    $display("All verification tests passed!");
    $finish;
end

endmodule