module adder #(parameter Nbit=32) 
            (input wire [Nbit-1:0] A,B,
            input wire Cin,
            output wire [Nbit-1:0] S,
            output wire Cout);

wire [Nbit:0] tmp_sum ;

assign tmp_sum = A+B+Cin;
assign S = tmp_sum[Nbit-1:0];
assign Cout = tmp_sum[Nbit];

endmodule