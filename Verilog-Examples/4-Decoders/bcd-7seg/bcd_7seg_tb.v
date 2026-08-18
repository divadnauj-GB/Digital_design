`timescale 1ns/1ps

module bcd_7seg_tb();

reg [3:0] IN;
wire [6:0] Y;

bcd_7seg DUT(
    .W(IN),
    .Y(Y)
);


reg [6:0] exp_7seg [0:15] ;
initial begin
    exp_7seg[0] = 7'h3f;
    exp_7seg[1] = 7'h06;
    exp_7seg[2] = 7'h5b;
    exp_7seg[3] = 7'h4f;
    exp_7seg[4] = 7'h66;
    exp_7seg[5] = 7'h6d;
    exp_7seg[6] = 7'h7d;
    exp_7seg[7] = 7'h07;
    exp_7seg[8] = 7'h7f;
    exp_7seg[9] = 7'h6f;
    exp_7seg[10] = 7'hxx;
    exp_7seg[11] = 7'hxx;
    exp_7seg[12] = 7'hxx;
    exp_7seg[13] = 7'hxx;
    exp_7seg[14] = 7'hxx;
    exp_7seg[15] = 7'hxx;
end


initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end

integer i;
initial begin
    for(i=0;i<16;i=i+1) begin
        IN = i[3:0];
        #10;
        if(Y!=exp_7seg[i]) $display("Error when 0x%h produced 0x%h expected 0x%h",IN,Y,exp_7seg[i]);
    end
    $finish;
end

endmodule