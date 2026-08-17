module add (input wire Gim1m1,Ai,Bi,
           output wire Si);


assign Si = Ai^Bi^Gim1m1;

endmodule