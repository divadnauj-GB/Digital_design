`timescale 1ns/1ps

`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end


module shiftter_right_tb();
localparam Nbit = 16;

reg [Nbit-1:0] IN;
reg [$clog2(Nbit)-1:0] shift;
wire [Nbit-1:0] Y;

shiftter_right #(Nbit)
    DUT(
    .A(IN),
    .shamnt(shift),
    .Y(Y)
);



initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end

integer i,j;
initial begin
    for (j=0; j<Nbit; j=j+1) begin
        shift = j;
        for(i=0;i<2**Nbit;i=i+1) begin
            IN = i[Nbit-1:0];
            #10;
            `assert(Y,$unsigned($signed(IN)>>>shift));
        end
    end
    $display("All verification tests passed!");
    $finish;
end

endmodule