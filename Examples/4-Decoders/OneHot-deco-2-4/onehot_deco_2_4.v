module onehot_deco_2_4(input wire [1:0] W,
                      input wire En,
                      output wire [3:0] Y);


assign Y[0] = (En&~W[1]&~W[0]);
assign Y[1] = (En&~W[1]&W[0]);
assign Y[2] = (En&W[1]&~W[0]);
assign Y[3] = (En&W[1]&W[0]);

endmodule