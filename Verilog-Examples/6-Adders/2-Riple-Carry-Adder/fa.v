module fa (input wire A,B,Cin,
           output wire S,Cout);

assign S=A^B^Cin;
assign Cout = A&B | A&Cin | B&Cin;

endmodule