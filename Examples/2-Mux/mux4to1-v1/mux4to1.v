
module mux4to1(input wire [3:0] D,
               input wire [1:0] S, 
               output wire Y);


assign Y = (~S[1]&~S[0]&D[0]) | (~S[1]&S[0]&D[1]) | (S[1]&~S[0]&D[2]) | (S[1]&S[0]&D[3]);


endmodule