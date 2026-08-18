`timescale 1ns/1ps
`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end


module cmp_tb();
localparam Nbit=32;

reg [Nbit-1:0] A,B;
wire eq,lt,geq;

cmp #(.Nbit(Nbit)) DUT(
    .A(A),
    .B(B),
    .eq(eq),
    .lt(lt),
    .geq(geq)
);



initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end

integer i,j;
initial begin
    for (i=0;i<(Nbit/4);i=i+1) begin
        for (j=0; j<(Nbit/4);j=j+1) begin
            A = i;
            B = j;
            #10;
            `assert(eq,$unsigned(i)==$unsigned(j));
            `assert(lt,$unsigned(i)<$unsigned(j));
            `assert(geq,$unsigned(i)>=$unsigned(j));
        end
    end
    $display("All verification tests passed!");
    $finish;
end

endmodule