module onehot_encoder(input wire [3:0] A,
                        output wire [1:0] Y,
                        output wire Vld);



assign Y[0] = A[3] | A[1];
assign Y[1] = A[2] | A[3];

endmodule