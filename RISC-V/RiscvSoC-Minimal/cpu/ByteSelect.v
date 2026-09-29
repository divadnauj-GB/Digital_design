module ByteSelect(
input wire [1:0] funct3,
output wire [3:0] ByteEnable
);

reg [3:0] ByteEnable_r;

always @(*) begin
    case (funct3)
        2'b00: ByteEnable_r = 4'b0001;
        2'b01: ByteEnable_r = 4'b0011;
        2'b10: ByteEnable_r = 4'b1111;
        default: ByteEnable_r = 4'b1111;
    endcase    
end


assign ByteEnable = 4'b1111;

endmodule