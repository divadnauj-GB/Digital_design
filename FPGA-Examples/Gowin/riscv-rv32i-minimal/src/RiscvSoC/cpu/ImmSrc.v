module ImmSrc (
input wire [2:0] Immcntl,
input wire [31:0] Instr,
output wire [31:0] ImmSrcVal
);

reg [31:0] imm_src_sel_val;

always @(*) begin
    case (Immcntl)
        3'b000:  imm_src_sel_val = {{20{Instr[31]}},Instr[31:20]};
        3'b001:  imm_src_sel_val = {{20{Instr[31]}},Instr[31:25],Instr[11:7]};
        3'b010:  imm_src_sel_val = {{20{Instr[31]}},Instr[7],Instr[30:25],Instr[11:8], 1'b0};
        3'b011:  imm_src_sel_val = {{12{Instr[31]}},Instr[19:12],Instr[20],Instr[30:21],1'b0};
        default: imm_src_sel_val = {{20{Instr[31]}},Instr[31:20]};
    endcase
end


assign ImmSrcVal = imm_src_sel_val;
endmodule