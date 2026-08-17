module behave_multiplier_Nbit #(parameter N = 4) (
    input [N-1:0] A,
    input [N-1:0] B,
    output [2*N-1:0] P
);
    
    assign P = A * B;
endmodule