module add_sub #(parameter Nbit=32) 
            (input wire [Nbit-1:0] A,B,
            input wire addn_sub,
            output wire [Nbit-1:0] S,
            output wire Cout);

wire [Nbit-1:0] B_bar;

assign B_bar = B ^ {Nbit{addn_sub}};

rca #(.Nbit(Nbit)) adder(
    .A(A),
    .B(B_bar),
    .Cin(addn_sub),
    .S(S),
    .Cout(Cout)
);

endmodule