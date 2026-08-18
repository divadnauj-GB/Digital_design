module aedff (input wire D,en,clk,rst_n,
                output wire Q, Qn);


reg DFF;

always @(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
        DFF <= 0;
    end else begin
        if(en) begin
            DFF <= D;
        end
    end
end

assign Q    = DFF;
assign Qn  = ~DFF;


endmodule