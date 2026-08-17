module shiftter_left (input wire [4-1:0] A,
                     input wire [1:0] shamnt,
                    output wire [4-1:0] Y);


mux4to1 SH0(
    .D({3'b000,A[0]}),
    .S(shamnt),
    .Y(Y[0])
);

mux4to1 SH1(
    .D({2'b00,A[0],A[1]}),
    .S(shamnt),
    .Y(Y[1])
);

mux4to1 SH2(
    .D({1'b0,A[0],A[1],A[2]}),
    .S(shamnt),
    .Y(Y[2])
);

mux4to1 SH3(
    .D({A[0],A[1],A[2],A[3]}),
    .S(shamnt),
    .Y(Y[3])
);

endmodule