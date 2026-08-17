module cla_4bit (input wire [3:0] A,B,
            input wire Cin,
            output wire [3:0] S,
            output wire Cout);

    wire [3:0] G; // Generation signals
    wire [3:0] P; // Propagation signals
    wire [4:0] C; // Carry signals

    // Step 1: Compute Generate (G) and Propagate (P) values

    genvar gi;
    generate 
        for(gi=0;gi<4;gi=gi+1) begin
            ha GP(
                .A(A[gi]),
                .B(B[gi]),
                .S(P[gi]),
                .Cout(G[gi])
            );
        end
    endgenerate

    // Step 2: Compute intermediate carries in parallel using CLA equations
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);

    // Step 3: Compute final Sum and Carry-out
    assign S  = P ^ C[3:0];
    assign Cout = C[4];

endmodule