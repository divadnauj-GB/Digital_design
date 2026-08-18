`timescale 1ns/1ps

module mux2to1_tb();

reg D0,D1,S;
wire Y;

mux2to1 DUT(
    .D0(D0),
    .D1(D1),
    .S(S),
    .Y(Y)
);

 initial begin
    $dumpfile("mux.vcd"); 
    $dumpvars;
 end

initial begin
    {D0,D1,S} = 3'b000;
    #10;
    {D0,D1,S} = 3'b100;
    #10;
    {D0,D1,S} = 3'b010;
    #10;
    {D0,D1,S} = 3'b110;
    #10;
    {D0,D1,S} = 3'b001;
    #10;
    {D0,D1,S} = 3'b101;
    #10;
    {D0,D1,S} = 3'b011;
    #10;
    {D0,D1,S} = 3'b111;
    $finish;

end

endmodule