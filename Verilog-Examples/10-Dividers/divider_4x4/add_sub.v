module add_sub #(parameter Nbit=4) 
            (input wire [Nbit-1:0] A,B,
            input wire addn_sub,
            output wire [Nbit-1:0] R,
            output wire N);

wire [Nbit-1:0] B_bar;
wire [Nbit-1:0] R_sub;
wire Cout;

assign B_bar = B ^ {Nbit{addn_sub}};

rca #(.Nbit(Nbit)) adder(
    .A(A),
    .B(B_bar),
    .Cin(addn_sub),
    .S(R_sub),
    .Cout(Cout)
);

assign R = ~Cout ? A : R_sub;
//assign N = R_sub[Nbit-1];
assign N = ~Cout;
//assign N = R_sub[Nbit-1] ^ (((A[Nbit-1] ^ B[Nbit-1])) & (R_sub[Nbit-1]^A[Nbit-1]));

endmodule