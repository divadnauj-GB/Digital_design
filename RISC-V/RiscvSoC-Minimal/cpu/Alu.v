module Alu (input wire [31:0] A,B,
            input wire [3:0] ALUControl,
            output wire [31:0] Result,
            output wire Z,N,C,V
            );


wire [32:0] sum;
wire Cin;
wire Cout;
wire add_sub;
wire Overflow;
wire [31:0] Bn;
reg [31:0] WResult;

wire [31:0] SltOp;
wire [31:0] SltUOp;

assign Bn = B ^ {32{add_sub}};
assign Cin = add_sub;
assign sum = A+Bn+Cin;
assign Cout = sum[32];

assign add_sub = ALUControl[0];

assign SltOp = {31'd0,sum[31]^Overflow};
assign SltUOp = {31'd0,~Cout};

always @(*) begin
    case (ALUControl)
        4'b0000:  WResult = sum[31:0];
        4'b0001:  WResult = sum[31:0];
        4'b0010:  WResult = A << B[4:0];
        4'b0101:  WResult = SltOp;
        4'b1001:  WResult = SltUOp;
        4'b0011:  WResult = A ^ B;
        4'b0100:  WResult = A >> B[4:0];
        4'b0110:  WResult = $signed(A) >>> B[4:0];
        4'b0111:  WResult = A | B;
        4'b1000:  WResult = A & B;
        default: WResult = sum[31:0];
    endcase
    
end

assign Overflow = add_sub ? ((~A[31] & ~Bn[31]) & sum[31]) | ((A[31] & Bn[31]) & ~sum[31]) : 0;

assign Z=~(|WResult);
assign C=Cout;
assign N=WResult[31];
assign V = Overflow;
assign Result = WResult;

endmodule