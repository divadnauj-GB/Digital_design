module cmp #(parameter Nbit=32) 
            (input wire [Nbit-1:0] A,B,
            output wire eq, lt, geq
            );

wire C,V,N;
wire [Nbit-1:0] Sub;

assign N = Sub[Nbit-1];
assign V = ((A[Nbit-1] ^ B[Nbit-1])) & (N^A[Nbit-1]);

assign lt = N ^ V;
assign eq = &(~(A ^ B)); 
/*
assign eq = ~(|Sub); 
*/

assign geq = ~(N ^ V);

add_sub #(.Nbit(Nbit)) sub(
    .A(A),
    .B(B),
    .addn_sub(1'b1),
    .S(Sub),
    .Cout(C)
);


endmodule