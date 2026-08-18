module divider #(parameter Nbit=4) 
            (input wire [Nbit-1:0] A,B,
            output wire [Nbit-1:0] Q,R);

assign Q=$unsigned(A)/$unsigned(B);
assign R=$unsigned(A)%$unsigned(B);

endmodule