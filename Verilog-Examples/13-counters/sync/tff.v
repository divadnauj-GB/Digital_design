module tff (

    input  clk,
    input  rst_n,
    input  en,
    input  t,
    output  q,
    output  qn
);

    reg q_reg;
    
    // T Flip-Flop behavior
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q_reg <= 1'b0; // Reset state
        end else if (en) begin
            if (t) begin
                q_reg <= ~q_reg; // Toggle state
            end
        end
    end

    assign q = q_reg;
    assign qn = ~q_reg;
endmodule