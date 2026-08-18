`timescale 1ns/1ps
`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end


module cmp_tb();
localparam Nbit=32;

reg [Nbit-1:0] A,B;
reg [1:0] ALUControl;
wire Z,N,C,V;
wire [Nbit-1:0] Result;

ALU #(.Nbit(Nbit)) DUT(
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .Result(Result),
    .Z(Z),
    .N(N),
    .C(C),
    .V(V)
);



initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end

integer i,j;
initial begin
    ALUControl = 0;
    for (i=0;i<(Nbit/4);i=i+1) begin
        for (j=0; j<(Nbit/4);j=j+1) begin
            A = i;
            B = j;
            #10;
            `assert(Result,A+B);
        end
    end
    ALUControl = 1;
    for (i=0;i<(Nbit/4);i=i+1) begin
        for (j=0; j<(Nbit/4);j=j+1) begin
            A = i;
            B = j;
            #10;
            `assert(Result,A-B);
        end
    end
    ALUControl = 2;
    for (i=0;i<(Nbit/4);i=i+1) begin
        for (j=0; j<(Nbit/4);j=j+1) begin
            A = i;
            B = j;
            #10;
            `assert(Result,A&B);
        end
    end
    ALUControl = 3;
    for (i=0;i<(Nbit/4);i=i+1) begin
        for (j=0; j<(Nbit/4);j=j+1) begin
            A = i;
            B = j;
            #10;
            `assert(Result,A|B);
        end
    end
    $display("All verification tests passed!");
    $finish;
end

endmodule