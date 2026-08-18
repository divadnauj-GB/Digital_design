module pipo #(
    parameter WIDTH = 8
)(
    input  clk,
    input  rst_n,
    input  en,
    input  [WIDTH-1:0] in_data,
    output [WIDTH-1:0] out_data
);

    reg [WIDTH-1:0] pipo_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pipo_reg <= {WIDTH{1'b0}};
        end else if (en) begin
            pipo_reg <= in_data;
        end
    end
    assign out_data = pipo_reg;
endmodule