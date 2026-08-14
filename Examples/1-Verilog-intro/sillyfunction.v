`timescale 1ns/1ps

module sillyfunction(input wire a,b,c,
                     output wire y);

assign y=(~b&~c)|(a&~b);

endmodule