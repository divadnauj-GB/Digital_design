`timescale 1ns/1ps

module shiftter_left_tb();

reg [3:0] IN;
reg [1:0] shift;
wire [3:0] Y;

shiftter_left DUT(
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
    for (j=0; j<4; j=j+1) begin
        shift = j[1:0];
        for(i=0;i<16;i=i+1) begin
            IN = i[3:0];
            #10;
        end
    end
    $finish;
end

endmodule