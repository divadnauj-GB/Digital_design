module rca #(parameter Nbit=32) 
            (input wire [Nbit-1:0] A,B,
            input wire Cin,
            output wire [Nbit-1:0] S,
            output wire Cout);

wire [Nbit:0] p_carry;

assign p_carry[0] = Cin;
assign Cout = p_carry[Nbit];

genvar gi;

generate
    for (gi=0; gi<Nbit; gi=gi+1) begin
        fa AddBit(
            .A(A[gi]),
            .B(B[gi]),
            .Cin(p_carry[gi]),
            .S(S[gi]),
            .Cout(p_carry[gi+1])
        );
    end
    
endgenerate

endmodule