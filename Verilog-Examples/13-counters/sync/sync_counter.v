module sync_counter #(
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
            if(i==0) begin
                assign tff_t[i] = en; 
            end else begin
                assign tff_t[i] = tff_q[i-1] & tff_t[i-1]; 
            end
            tff tff_inst (
                    .clk(clk),
                    .rst_n(rst_n),
                    .en(1'b1), // Always enabled internally
                    .t(tff_t[i]),
                    .q(tff_q[i]),
                    .qn(tff_qn[i])
                );
         end
    endgenerate

    assign count = tff_q;

endmodule