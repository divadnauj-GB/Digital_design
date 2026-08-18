module jk_ff (

    input  clk,
    input  rst_n,
    input  en,
    input  j,
    input  k,
    output  q,
    output  qn
);

    reg q_reg;
    
    // JK Flip-Flop behavior
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q_reg <= 1'b0; // Reset state
        end else if (en) begin
            case ({j, k})
                2'b00: q_reg <= q_reg;      // No change
                2'b01: q_reg <= 1'b0;       // Reset
                2'b10: q_reg <= 1'b1;       // Set
                2'b11: q_reg <= ~q_reg;     // Toggle
            endcase
        end
    end

    assign q = q_reg;
    assign qn = ~q_reg;
endmodule