`timescale 1ns/1ps

module mux2to1_tb();

reg [3:0] D;
reg [1:0] S;
wire Y;

mux4to1 DUT(
    .D(D),
    .S(S),
    .Y(Y)
);

 initial begin
    $dumpfile("mux.vcd"); 
    $dumpvars;
 end


integer in;
integer sel;
initial begin
    for(sel=0;sel<=3;sel=sel+1) begin
        S = sel[1:0];
        for(in=0;in<=15;in=in+1) begin
            D = in[3:0];
            #10;
        end
    end
    $finish;

end

endmodule