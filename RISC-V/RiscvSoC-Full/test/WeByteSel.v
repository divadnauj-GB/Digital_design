module WeByteSel(
input wire [1:0] funct3,
output wire [3:0] ByteSel
);

reg [3:0] ByteSel_r

case (funct3)
    2'b00: ByteSel_r = 4'b0001;
    2'b01: ByteSel_r = 4'b0011;
    2'b10: ByteSel_r = 4'b1111;
    default: ByteSel_r = 4'b1111;
endcase

assign ByteSel = ByteSel_r

endmodule