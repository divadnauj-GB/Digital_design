module onehot_deco_3_8(input wire [2:0] W,
                      input wire En,
                      output wire [7:0] Y);

wire int_en_h;
wire int_en_l;

assign int_en_l = En&~W[2];
assign int_en_h = En&W[2];

onehot_deco_2_4 DECH(
.W(W[1:0]),
.En(int_en_h),
.Y(Y[7:4])
);

onehot_deco_2_4 DECL(
.W(W[1:0]),
.En(int_en_l),
.Y(Y[3:0])
);


endmodule