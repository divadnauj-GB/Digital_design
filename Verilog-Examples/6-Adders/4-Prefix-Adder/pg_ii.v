module pg_ii (input wire Ai,Bi,
           output wire Pii,Gii);


assign Pii = Ai | Bi;
assign Gii = Ai & Bi; 

endmodule