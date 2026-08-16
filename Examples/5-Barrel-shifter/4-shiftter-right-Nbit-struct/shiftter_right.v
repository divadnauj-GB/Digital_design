module shiftter_right #(parameter Nbit=8)
                    (input wire [Nbit-1:0] A,
                     input wire [$clog2(Nbit)-1:0] shamnt,
                    output wire [Nbit-1:0] Y);


//stage1
wire [Nbit-1:0] stage[0:$clog2(Nbit)];

genvar gid1,gid2,gid3,gid4;
assign stage[0] = A;

generate

    for (gid4=0; gid4<$clog2(Nbit); gid4=gid4+1) begin: STAGE 
        for (gid1=0; gid1<Nbit; gid1=gid1+1) begin : MUX
            if (gid1>(Nbit-1)-2**gid4) begin
                mux2to1 M0(
                    .D0(stage[gid4][gid1]),
                    .D1(1'b0),
                    .S(shamnt[gid4]),
                    .Y(stage[gid4+1][gid1])
                );
            end else begin
                mux2to1 M(
                    .D0(stage[gid4][gid1]),
                    .D1(stage[gid4][gid1+2**gid4]),
                    .S(shamnt[gid4]),
                    .Y(stage[gid4+1][gid1])
                );
            end
        end
    end

endgenerate

assign Y = stage[$clog2(Nbit)];

endmodule