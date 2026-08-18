module adff (input wire D,clk,rst_n,
                output wire Q, Qn);


reg DFF;

always @(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
        DFF <= 0;
    end else begin
        DFF <= D;
    end
end

assign Q    = DFF;
assign Qn  = ~DFF;


endmodule