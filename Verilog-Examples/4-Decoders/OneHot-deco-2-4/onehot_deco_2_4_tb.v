`timescale 1ns/1ps

module onehot_deco_2_4_tb();

reg [1:0] IN;
reg Vld;
wire [3:0] Y;

onehot_deco_2_4 DUT(
    .W(IN),
    .En(Vld),
    .Y(Y)
);


initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end

integer i;
initial begin
    Vld = 0;
    for(i=0;i<4;i=i+1) begin
        IN = i[1:0];
        #10;
    end
    Vld = 1;
    for(i=0;i<4;i=i+1) begin
        IN = i[1:0];
        #10;
    end
    $finish;
end

endmodule