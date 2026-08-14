
module mux4to1(input wire [3:0] D,
               input wire [1:0] S, 
               output wire Y);


mux2to1 M0(
    .D0(D[0]),
    .D1(D[1]),
    .S(S[0]),
    .Y(Y0)
);

mux2to1 M1(
    .D0(D[2]),
    .D1(D[3]),
    .S(S[0]),
    .Y(Y1)
);

mux2to1 M2(
    .D0(Y0),
    .D1(Y1),
    .S(S[1]),
    .Y(Y)
);


endmodule