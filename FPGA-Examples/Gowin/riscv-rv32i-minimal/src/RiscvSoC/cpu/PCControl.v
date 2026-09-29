module PCControl (
    input wire Branch,
    input wire [1:0] Jump,
    input wire [2:0] funct3,
    input wire Z,C,V,N,
    output wire [1:0] PCControl
);

reg [1:0] PCControlVal;
always @(*) begin
    casez ({Branch,Jump,funct3})
    6'b000???:  PCControlVal = 2'b00;
    6'b001???:  PCControlVal = 2'b01;
    6'b100000:  PCControlVal = {1'b0,Z};
    default: PCControlVal = 2'b00;
    endcase
end

assign PCControl = PCControlVal;

endmodule