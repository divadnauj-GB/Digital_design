`timescale 1ns/1ps
`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end


module divider_tb();
localparam Nbit=4;

reg [Nbit-1:0] A,B;
wire [Nbit-1:0] Q,R;

divider DUT(
    .A(A),
    .B(B),
    .Q(Q),
    .R(R)
);



initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end

integer i,j;
initial begin
    for (i=0;i<(2**Nbit);i=i+1) begin
        for (j=0; j<(2**Nbit);j=j+1) begin
            A = i;
            B = j;
            #10;
            `assert(A,Q*B+R);
        end
    end
    $display("All verification tests passed!");
    $finish;
end

endmodule