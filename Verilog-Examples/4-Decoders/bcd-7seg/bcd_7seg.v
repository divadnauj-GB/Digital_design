module bcd_7seg(input wire [3:0] W,
                output wire [6:0] Y);

reg [6:0] tmpout;
assign Y = tmpout;

always @(*) begin
    case (W)
        4'b0000: tmpout = 7'h3f;
        4'b0001: tmpout = 7'h06;
        4'b0010: tmpout = 7'h5b;
        4'b0011: tmpout = 7'h4f;
        4'b0100: tmpout = 7'h66;
        4'b0101: tmpout = 7'h6d;
        4'b0110: tmpout = 7'h7d;
        4'b0111: tmpout = 7'h07;
        4'b1000: tmpout = 7'h7f;
        4'b1001: tmpout = 7'h6f;
        default: tmpout = 7'hxx; // don't care for invalid inputs
    endcase
end

endmodule