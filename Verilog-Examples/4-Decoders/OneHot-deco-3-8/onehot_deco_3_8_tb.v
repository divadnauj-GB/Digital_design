`timescale 1ns/1ps

module onehot_deco_3_8_tb();

reg [2:0] IN;
reg Vld;
wire [7:0] Y;

onehot_deco_3_8 DUT(
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
    for(i=0;i<8;i=i+1) begin
        IN = i[2:0];
        #10;
    end
    Vld = 1;
    for(i=0;i<8;i=i+1) begin
        IN = i[2:0];
        #10;
    end
    $finish;
end

endmodule