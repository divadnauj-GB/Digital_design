module async_counter #(
    parameter WIDTH = 4
)(
    input  clk,
    input  rst_n,
    input  en,
    output [WIDTH-1:0] count
);

    wire [WIDTH-1:0] tff_q;
    wire [WIDTH-1:0] tff_qn;
    wire [WIDTH-1:0] tff_t;
    
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : tff_gen
            if (i == 0) begin
                tff tff_inst (
                    .clk(clk),
                    .rst_n(rst_n),
                    .en(en), // Always enabled internally
                    .t(1'b1),
                    .q(tff_q[i]),
                    .qn(tff_qn[i])
                );
                
            end else begin
                
                tff tff_inst (
                    .clk(tff_qn[i-1]), // Clocked by the previous TFF's inverted output
                    .rst_n(rst_n),
                    .en(1'b1), // Always enabled internally
                    .t(1'b1),
                    .q(tff_q[i]),
                    .qn(tff_qn[i])
                );
            end
            
        end
    endgenerate

    assign count = tff_q;

endmodule