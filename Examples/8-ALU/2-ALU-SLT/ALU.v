module ALU #(parameter Nbit=32) 
            (input wire [Nbit-1:0] A,B,
            input wire [2:0] ALUControl,
            output wire [Nbit-1:0] Result,
            output wire Z,N,C,V
            );


wire [Nbit-1:0] Rmux, Rmux1;
wire [Nbit-1:0] RLor, RLand;
wire [Nbit-1:0] MLogic, RArith;
wire Cout;


add_sub #(.Nbit(Nbit)) sub(
    .A(A),
    .B(B),
    .addn_sub(ALUControl[0]),
    .S(RArith),
    .Cout(Cout)
);


assign RLor = A | B;
assign RLand = A & B;


assign MLogic = ALUControl[0] ? RLor : RLand;
assign Rmux1 = ALUControl[1] ? MLogic: RArith;
assign Rmux = ALUControl[2] ? {31'h00000000,{RArith[Nbit-1]^V}} : Rmux1;

assign C = (~ALUControl[1])&Cout;
assign V = (RArith[Nbit-1] ^ A[Nbit-1]) & (~ALUControl[1]) & (~(ALUControl[0]^A[Nbit-1]^B[Nbit-1]));
assign N = Rmux[Nbit-1];
assign Z = ~(|Rmux);
assign Result = Rmux;

endmodule