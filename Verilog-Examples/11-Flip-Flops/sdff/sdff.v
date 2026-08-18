module sdff (input wire D,clk,rst_n,
                output wire Q, Qn);


reg DFF;

always @(posedge clk) begin
    if(!rst_n) begin
        DFF <= 0;
    end else begin
        DFF <= D;
    end
end

assign Q    = DFF;
assign Qn  = ~DFF;


endmodule