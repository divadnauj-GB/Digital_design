module AluControl(
    input wire [1:0] AluOp,
    input wire [2:0] funct3,
    input wire Opcode_5,
    input wire function7_5,
    output reg [3:0] ALUControl
);

always @(*) begin
    casez ({AluOp,funct3,Opcode_5,function7_5})
        7'b00?????:  ALUControl = 4'b0000;
        7'b01?????:  ALUControl = 4'b0001;
        7'b100000?:  ALUControl = 4'b0000;
        7'b1000010:  ALUControl = 4'b0000;
        7'b1000011:  ALUControl = 4'b0001;
        7'b10001?0:  ALUControl = 4'b0010;
        7'b100100?:  ALUControl = 4'b0101;
        7'b1001010:  ALUControl = 4'b0101;
        7'b100110?:  ALUControl = 4'b1001;
        7'b1001110:  ALUControl = 4'b1001;
        7'b101000?:  ALUControl = 4'b0011;
        7'b1010010:  ALUControl = 4'b0011;
        7'b10101?0:  ALUControl = 4'b0100;
        7'b10101?1:  ALUControl = 4'b0110;
        7'b101100?:  ALUControl = 4'b0111;
        7'b1011010:  ALUControl = 4'b0111;
        7'b101110?:  ALUControl = 4'b1000;
        7'b1011110:  ALUControl = 4'b1000;
        default: ALUControl = 4'b0000;
    endcase
end


endmodule