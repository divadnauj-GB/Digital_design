
module mux2to1(input wire D0, D1, S,
               output wire Y);

assign Y= S ? D1:D0;
endmodule