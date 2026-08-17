module pg_ij (input wire Pik,Pkm1j,Gik,Gkm1j,
           output wire Pij,Gij);



assign Pij = Pik&Pkm1j;
assign Gij = Gik | Pik&Gkm1j;

endmodule