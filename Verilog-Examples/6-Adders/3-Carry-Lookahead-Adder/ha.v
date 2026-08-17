module ha (input wire A,B,
           output wire S,Cout);

assign S=A^B;
assign Cout = A&B;

endmodule