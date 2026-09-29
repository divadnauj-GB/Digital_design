module LoadSignExt(
input wire [2:0] MemLoadSignExt,
input wire [31:0] MemRVal,
output wire [31:0] ReadMemVal
);

reg [31:0] ReadMemVal_ext;

always @(*) begin
    case (MemLoadSignExt)
        3'b000: ReadMemVal_ext = {{24{MemRVal[7]}},MemRVal[7:0]};
        3'b001: ReadMemVal_ext = {{16{MemRVal[15]}},MemRVal[15:0]};
        3'b010: ReadMemVal_ext = MemRVal;
        3'b100: ReadMemVal_ext = {24'd0,MemRVal[7:0]};
        3'b101: ReadMemVal_ext = {16'd0,MemRVal[15:0]};
        default: ReadMemVal_ext = MemRVal;
    endcase    
end


assign ReadMemVal = ReadMemVal_ext;

endmodule