module shiftter_right #(parameter Nbit=8)
                    (input wire [Nbit-1:0] A,
                     input wire [$clog2(Nbit)-1:0] shamnt,
                    output wire [Nbit-1:0] Y);

assign Y = $signed(A) >>> shamnt;

endmodule