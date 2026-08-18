module divider #(parameter Nbit=4) 
            (input wire [Nbit-1:0] A,B,
            output wire [Nbit-1:0] Q,R);

wire [Nbit-1:0] R1;
wire [Nbit-1:0] R2;
wire [Nbit-1:0] R3;
wire [Nbit-1:0] R4;

wire [Nbit-1:0] Qn;

add_sub row0(
    .A({3'b000,A[3]}),
    .B(B),
    .addn_sub(1'b1),
    .R(R1),
    .N(Qn[3])
);

add_sub row1(
    .A({R1[2:0],A[2]}),
    .B(B),
    .addn_sub(1'b1),
    .R(R2),
    .N(Qn[2])
);

add_sub row2(
    .A({R2[2:0],A[1]}),
    .B(B),
    .addn_sub(1'b1),
    .R(R3),
    .N(Qn[1])
);

add_sub row3(
    .A({R3[2:0],A[0]}),
    .B(B),
    .addn_sub(1'b1),
    .R(R4),
    .N(Qn[0])
);

assign Q = ~Qn;
assign R = R4;

endmodule