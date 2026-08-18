`timescale 1ns/1ps

module onehot_encoder_tb();

reg [3:0] IN;
wire [1:0] Y;
wire Vld;

onehot_encoder DUT(
    .A(IN),
    .Y(Y),
    .Vld(Vld)
);


initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end

integer i;
initial begin
    for(i=0;i<16;i=i+1) begin
        IN = i[3:0];
        #10;
    end
    $finish;
end

endmodule