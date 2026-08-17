`define assert(signal, value) \
    if ((signal) !== (value)) begin \
        $display("ASSERTION FAILED in %m: %s != %b, %b", `"signal`", value, signal); \
        $finish; \
    end


module add_sub_tb();
localparam Nbit=32;

reg [Nbit-1:0] A,B;
reg addn_sub;
wire [Nbit-1:0] S;
wire Cout;

add_sub #(.Nbit(Nbit)) DUT(
    .A(A),
    .B(B),
    .addn_sub(addn_sub),
    .S(S),
    .Cout(Cout)
);



initial begin
    $dumpfile("sim.vcd"); 
    $dumpvars;
 end

integer i,j;
initial begin
    addn_sub = 0;
    for (i=0;i<(Nbit/4);i=i+1) begin
        for (j=0; j<(Nbit/4);j=j+1) begin
            A = i;
            B = j;
            #10;
            `assert(S,A+B);
        end
    end
    addn_sub = 1;
    for (i=0;i<(Nbit/4);i=i+1) begin
        for (j=0; j<(Nbit/4);j=j+1) begin
            A = i;
            B = j;
            #10;
            `assert(S,A-B);
        end
    end
    $display("All verification tests passed!");
    $finish;
end

endmodule